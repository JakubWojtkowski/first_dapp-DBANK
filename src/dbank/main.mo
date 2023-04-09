import Debug "mo:base/Debug";

// creating a new canister
actor DBank {
    var currentValue = 300;
    currentValue := 100; // updating currentValue

    let id = 2453374858362991; // it's like `const` in JS

    Debug.print(debug_show (currentValue));

    public func topUp(amount : Nat) {
        currentValue += amount;
        Debug.print(debug_show (currentValue));
    };

    public func withdrawl(amount : Nat) {
        currentValue -= amount;
        Debug.print(debug_show (currentValue));
    };
};
