import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

// creating a new canister
actor DBank {
    stable var currentValue : Float = 300; // with 'stable' keyword it will be persisted across any sort of updates etc. / no db is needed / it's saved in the state
    currentValue := 300; // updating currentValue
   Debug.print(debug_show (currentValue));

    let id = 2453374858362991; // it's like `const` in JS

    stable var startTime = Time.now();
    startTime := Time.now();

    Debug.print(debug_show (startTime));

    public func topUp(amount : Float) {
        currentValue += amount;
        Debug.print(debug_show (currentValue));
    };

    public func withdrawl(amount : Float) {
        let tempValue : Float = currentValue - amount;
        if (tempValue >= 0) {
            currentValue -= amount;
            Debug.print(debug_show (currentValue));
        } else {
            Debug.print("Amount too large, currentValue less than 0.");
        };
    };

    public query func checkBalance() : async Float {
        currentValue;
    };

    public func compound() {
        let currentTime = Time.now();
        let timeElapsedNS = currentTime - startTime;
        let timeElapsedS = timeElapsedNS / 1000000000;
        currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
        startTime := currentTime;
    };
};
