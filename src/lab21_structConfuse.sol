// SPDX-License-Identifier: UNLICENSED
// lab21_structConfuse.sol

pragma solidity ^0.8.6;

contract TestContract {
    struct Buyer {
        string name;
        uint price;
    }

    Buyer[] buyer; // 為什麼有兩個 BUYER?

    /*  Buyer 是 data-type，你可以用它來做兩件事
    　  1) 宣告，正是 "buyer" 宣告的方法
    　  2) 配合 ( ) 用來產生 instance ==> ex: Buyer("TzuTung", 9999);
    　  
    　  buyer 是準備用來存放 instance 的 array。
    　  - 本質上它是 array
    　  - 而且這個 array 裡面只能放 instance
    　  - 把 instance 放進 array 的方法是 push ==> ex: buyer.push(instance)

        注意:
    　  - 只有 instance 才能用 .(dot) 存取成員
    　  - buyer 是 array, 不是 instance，所以 buyer.name = "Andrew"; 是錯誤寫法
    　  - buyer 是 array, 但是 buyer 裡面放的東西就是 instance ==> ex: buyer[3] 是 instance
    　  - 所以 buyer[3].name = "milkW"; 是正確的法語法
     */
     
    constructor() {
        // buyer.name = "Andrew"; // 錯誤寫法
        
        buyer.push(Buyer("TzuTung", 9999));
        buyer[0].price = 100000;
    }
    
    /* 事實上對於 line12 的 "兩個 buyer" 的疑惑也可能來自於命名，
       compiler 只會檢查語法正不正確，在程式中決定使用哪一種 "語意" 是撰寫者的工作。
       或許有人聽到 BUYER 會覺得它像是個具體的東西，而不是一種 "型態"
       如果有這樣的疑惑，或許可考慮重新命名 Buyer 為其它名字. ex:
       
       BuyerInfo[] buyer;
       BuyerModel[] buyer;
       BuyerRecord[] buyer;
       ...
       ..
       .
     */
    
}
