pragma solidity ^0.5.0;

contract CareBlocks{
    
    mapping(uint256 => Request) public request;
    uint256 public repositoryAmount = 0;
    uint256 public requestCount = 0;
    
    function donateAmount(uint256 _amount) public{
        repositoryAmount += _amount;
    }

    function releaseAmount(string memory _requestHash, uint256 _amount) public{
        requestCount++;
        request[requestCount] = Request(requestCount, _requestHash, _amount);
        require(repositoryAmount >= _amount);
            repositoryAmount -= _amount;
            
        emit Released(requestCount, request[requestCount].requestHash, request[requestCount].amount);
    }
    
    struct Request{
        uint256 requestNumber;
        string requestHash;
        uint256 amount;
    }
    
    event Released(
        uint256 requestNumber,
        string requestHash,
        uint256 amount
        );
    
}
