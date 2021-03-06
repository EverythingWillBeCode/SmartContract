pragma solidity ^0.5.0;

contract Coches {
    address owner;
    uint256 precio;
    uint256[] identificadores;
    mapping(address => Coche) coches;
    struct Coche {
        uint256 identificador;
        string marca;
        uint32 caballos;
        uint32 Kilometros;
    }
    
    modifier precioFiltro(uint256 _precio) {
        require(_precio == precio);
        _;
    }
    
    constructor(uint256 _precio) public {
        owner = msg.sender;
        precio = _precio;
    }
    
    function addCoche(uint256 _id, string memory _marca, uint32 _caballos, uint32 _Kilometros) public precioFiltro(msg.value) payable {
        identificadores.push(_id);
        coches[msg.sender].identificador = _id;
        coches[msg.sender].marca = _marca;
        coches[msg.sender].caballos = _caballos;
        coches[msg.sender].Kilometros = _Kilometros;
    }
    
    function getIdentificadores() external view returns(uint256) {
        return identificadores.length;
    }
    
    function getCoche() external view returns(string memory marca, uint32 caballos, uint32 Kilometros) {
        marca = coches[msg.sender].marca;
        caballos = coches[msg.sender].caballos;
        Kilometros = coches[msg.sender].Kilometros;
    }
}