// SPDX-License-Identifier: UNLICENSED
// lab76_contract_call_contract.sol

pragma solidity >=0.8.0 <0.9.0;

contract ArtWorks {
    function projectName(string memory _name) external pure returns (string memory) {
        return _name;
    }
    // Q: 如果 projectName() 為 internal, Artist 可以呼叫嗎？
    // A: 不行！internal 表示只有 ArtWorks 內部才能呼叫
}

contract Artist {
    address artworks_addr;
    
    // 為了呼叫到 ArtWorks 內的 func，需要先知道 ArtWorks 部署後的 address。
    function setArtWorksAddr(address _addr) external {
        artworks_addr = _addr;
    }
    
    function getProjectName() external view returns (string memory, string memory) {
        ArtWorks aw = ArtWorks(artworks_addr);  // <= 這個範例的重點在這
        
        return (aw.projectName("Writing the Time Lag"),
                aw.projectName("Forkonomy()"));
    }
}
