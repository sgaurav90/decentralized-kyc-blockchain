pragma solidity ^0.5.9;

contract KYC{


    struct Customer {
        string userName;   
        string data;  
        address bank;
    }
    
    struct Bank {
        string name;
        address ethAddress;
        string regNumber;
    }

    mapping(string => Customer) customers;

    mapping(address => Bank) banks;

    
    function addCustomer(string memory _userName, string memory _customerData) public {
        require(customers[_userName].bank == address(0), "Customer is already present, please call modifyCustomer to edit the customer data");
        customers[_userName].userName = _userName;
        customers[_userName].data = _customerData;
        customers[_userName].bank = msg.sender;
    }
    
    function viewCustomer(string memory _userName) public view returns (string memory, string memory, address) {
        require(customers[_userName].bank != address(0), "Customer is not present in the database");
        return (customers[_userName].userName, customers[_userName].data, customers[_userName].bank);
    }
    
    function modifyCustomer(string memory _userName, string memory _newcustomerData) public {
        require(customers[_userName].bank != address(0), "Customer is not present in the database");
        customers[_userName].data = _newcustomerData;
    }    
    
    
    
}    


