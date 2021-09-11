#include <iostream>
#include <string>  

class Trip {
public:
    Trip() {
        setEnd("N/A");
        setDistance(1);
        setPrice(1);

        description = "N/A";
    }

    Trip(
        const std::string& end,
        const int dist,
        const double pr
    )
    {
        setEnd(end);
        setDistance(dist);
        setPrice(pr);

        description = "Trip " + std::to_string(distance) + "km to " + end
            + " for a price of " + std::to_string(price) + "lv.";
    }

    Trip(const Trip& rhs) {
        setEnd(rhs.end);
        setPrice(rhs.price);
        setDistance(rhs.distance);
        description = rhs.description;
    }

    virtual ~Trip() = default;

    virtual Trip* clone() const = 0;

    std::string getEnd() const {
        return end;
    }

    void setEnd(const std::string& e) {
        end = e;
    }

    virtual std::string getDescription() const = 0;

    int getDistance() const {
        return distance;
    }

    void setDistance(int dist) {
        distance = dist;
    }

    double getPrice() const {
        return price;
    }

    void setPrice(const double pr) {
        price = pr;
    }

protected:
    std::string description;

private:
    std::string end;
    int distance;
    double price;
};

class BusTrip: public Trip {
public:
    BusTrip(
        const std::string& end,
        const int dist,
        const double pr,
        const std::string& comp
    )
        : Trip(
            end,
            dist,
            pr
        )
    {
        setCompany(comp);
    }

    BusTrip(const BusTrip& rhs) : Trip(rhs) {
        setCompany(rhs.company);
    }

    BusTrip* clone() const override
    {
        return new BusTrip(*this);
    }

    std::string getCompany() const {
        return company;
    }

    void setCompany(const std::string& comp) {
        company = comp;
    }

    std::string getDescription() const override {
        return description + " with a bus by " + company;
    }

private:
    std::string company;
};

class PlaneFlight : public Trip {
public:
    PlaneFlight(
        const std::string& end,
        const int dist,
        const double pr,
        const std::string& c
    )
        : Trip(
            end,
            dist,
            pr
        )
    {
        setCode(c);
    }

    PlaneFlight(const PlaneFlight& rhs) : Trip(rhs) {
        setCode(rhs.code);
    }

    PlaneFlight* clone() const override
    {
        return new PlaneFlight(*this);
    }

    std::string getNumber() const {
        return code;
    }

    void setCode(const std::string& c) {
        code = c;
    }

    std::string getDescription() const override {
        return description + " with flight " + code;
    }

private:
    std::string code;
};

class Tour : public Trip {
public:
    Tour(
        const std::string& end,
        Trip** i_ptr,
        unsigned s
    )
    {
        size = s;
        setI(i_ptr);
        setEnd(end);
        setPrice(calcPrice());
        setDistance(calcDist());
    }

    Tour(const Tour& rhs) : Trip(rhs) {
        copy(rhs);
    }

    Tour& operator=(const Tour& rhs) {
        if (this != &rhs)
        {
            del();
            copy(rhs);
        }

        return *this;
    }

    ~Tour() override {
        del();
    }

    Tour* clone() const override
    {
        return new Tour(*this);
    }

    Trip** getI() const {
        return i;
    }

    void setI(Trip** newI) {
        i = new Trip * [size];

        for (int j = 0; j < size; ++j) {
            i[j] = newI[j]->clone();
        }
    }

    std::string getDescription() const override {
        std::string result;

        for (int j = 0; j < size; ++j) {
            result += i[j]->getDescription() + '\n';
        }

        return result + "Total distance " + std::to_string(getDistance()) + "km for a price of " + std::to_string(getPrice()) + "lv.";
    }

    Tour sliceTour(char const* start, char const* end) const {
        Trip** trips = new Trip * [64];
        unsigned numAdded = 0;
        bool found = false;

        for (int j = 0; j < size; ++j) {
            if (i[j]->getEnd() == end) {
                trips[numAdded++] = i[j]->clone();
                break;
            } else if (found) {
                trips[numAdded++] = i[j]->clone();
            } else if (i[j]->getEnd() == start) {
                found = true;
            }
        }

        return found ? Tour(end, trips, numAdded) : Tour("Error", {}, 0);
    }

    void priceReport() const {
        Trip** trips = new Trip * [size];

        for (int j = 0; j < size; ++j) {
            trips[j] = i[j]->clone();
        }

        for (int j = 0; j < size - 1; ++j) {
            int maxIdx = j;

            for (int k = j + 1; k < size; ++k) {
                double current = trips[k]->getPrice() / trips[k]->getDistance();
                double currentMax = trips[maxIdx]->getPrice() / trips[maxIdx]->getDistance();

                if (current > currentMax) {
                    maxIdx = k;
                }
            }

            Trip* tmp = trips[maxIdx]->clone();
            trips[maxIdx] = trips[j]->clone();
            trips[j] = tmp;
        }

        for (int j = 0; j < size; ++j) {
            std::cout << trips[j]->getDescription() << ' ' << trips[j]->getPrice() / trips[j]->getDistance() << '\n';
            delete trips[j];
            trips[j] = nullptr;
        }

        delete* trips;
    }
    
private:
    Trip** i;
    unsigned size;

    void copy(const Tour& rhs) {
        setDistance(rhs.getDistance());
        setPrice(rhs.getPrice());
        setEnd(rhs.getEnd());
        description = rhs.getDescription();
        size = rhs.size;

        i = new Trip * [size];

        for (int j = 0; j < size; ++j) {
            i[j] = rhs.i[j]->clone();
        }
    }

    void del() {
        size = 0;

        for (int j = 0; j < size; ++j) {
            delete i[j];
            i[j] = nullptr;
        }

        delete i;
        i = nullptr;
    }

    unsigned calcDist() {
        unsigned result = 0;

        for (int j = 0; j < size; ++j) {
            result += i[j]->getDistance();
        }

        return result;
    }

    double calcPrice() {
        double result = 0;

        for (int j = 0; j < size; ++j) {
            result += i[j]->getPrice();
        }

        return result;
    }
};

int main()
{
    std::cout << "Testing PlaneFlight and BusTrip\n";
    Trip* plane_varna = new PlaneFlight("Varna", 500, 220, "LH3434");
    Trip* bus_shumen = new BusTrip("Shumen", 86, 198.89, "Etap");
    Trip* bus_sofia = new BusTrip("Sofia", 450, 400, "Etap");
    Trip* plane_aaubourg = new PlaneFlight("Aaubourg", 1100, 600, "BJ6969");
    
    std::cout << '\t' << (*plane_varna).getDescription() << '\n';
    std::cout << '\t' << (*bus_shumen).getDescription() << '\n';

    std::cout << "\nTesting Trip\n";

    Trip** trips = new Trip*[4]{plane_varna, bus_shumen, bus_sofia, plane_aaubourg};

    Tour tour("Shumen", trips, 4);
    std::cout << std::boolalpha << '\t' << (tour.getPrice() == 418.89) << '\n';
    std::cout << '\t' << (tour.getDistance() == 950) << '\n';
    std::cout << tour.getDescription() << '\n';

    std::cout << "\n\n" << tour.sliceTour("Shumen", "Sofia").getDescription() << '\n';
    std::cout << "\n\n" << tour.sliceTour("Shumen", "Aaubourg").getDescription() << '\n';
    std::cout << "\n\n" << tour.sliceTour("Varna", "Sofia").getDescription() << '\n';
    std::cout << "\n\n" << tour.sliceTour("Aaubourg", "Shumen").getDescription() << '\n';

    std::cout << "\n\n";

    tour.priceReport();

    std::cout << '\n';

    return 0;
}
