import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

// creating a new canister
actor DBank {
    var currentValue : Nat = 300;
    currentValue := 100; // updating currentValue

    let id = 2453374858362991; // it's like `const` in JS

    Debug.print(debug_show (currentValue));

    public func topUp(amount : Nat) {
        currentValue += amount;
        Debug.print(debug_show (currentValue));
    };

    public func withdrawl(amount : Nat) {
        let tempValue : Int = currentValue - amount;
        if (tempValue >= 0) {
            currentValue -= amount;
            Debug.print(debug_show (currentValue));
        } else {
            Debug.print("Amount too large, currentValue less than 0.");
        };
    };

    public query func checkBalance() : async Nat {
        currentValue;
    };
};
