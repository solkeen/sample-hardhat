// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

interface ISafeswapRouter01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

interface ISafeswapRouter02 is ISafeswapRouter01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}


interface ISafewapV2Pair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;

    function initialize(address, address) external;
}
/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Liquidity {

    address private BBTFWallet;
    // address private SafeMoonRouter = 0x37da632c6436137BD4D0CA30c98d3c615974120b; 
    address private SafeMoonRouter; 
    // address private BBTFToken = 0xe7057B10E2B59F46D151588d9C8694B4b8328F44;
    address private BBTFToken;
    // address private WBNB = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
    address private WBNB;
    // address private BUSD = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
    address private BUSD;
    // address private pairBnbBbtf = 0x6a5cfce57EBD5622BbD0c4f8199593230CB15CE9;
    address private pairBnbBbtf;

    address private admin;
    
    uint256 private DURATION;
    uint public percentage;

    function initiailize() external {
        BBTFWallet = 0x3D27f909606c97b13973c52b0752c06C5cAd9240;
        SafeMoonRouter = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D; 
        BBTFToken = 0xA37f4b8825C66ce5F43977035f2A657dbf7D42AC;
        WBNB = 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6;
        BUSD = 0x75E0942E8614BEA5EEAee90A9B1240d5E3C98a57;
        pairBnbBbtf = 0x2A4135e068f4666419e3CB633CaCF0779b1b30fC;
        DURATION = 1000;
        admin = msg.sender;
    }

    function deposit(uint _busdAmount) public payable {
        uint _bnbAmount;
        bool flag;

        require(msg.value != 0 || _busdAmount != 0, "Input Error");
        
        // Swap BUSD to the BNB 
        if (_busdAmount != 0 && msg.value == 0) {
            address[] memory pathBUSDToBNB = new address[](2);
            pathBUSDToBNB[0] = BUSD;
            pathBUSDToBNB[1] = WBNB;
            uint[] memory outBNBAmount = new uint[](2);
            // Predict that how much BNB will be received
            outBNBAmount = ISafeswapRouter01(SafeMoonRouter).getAmountsOut(
                _busdAmount, 
                pathBUSDToBNB
                );
            uint bnbAmountOutMin = outBNBAmount[1] * 90 / 100;

            // Swap BUSD to the BNB
            ISafeswapRouter02(SafeMoonRouter).swapExactTokensForETHSupportingFeeOnTransferTokens(
                _busdAmount, 
                bnbAmountOutMin, 
                pathBUSDToBNB, 
                address(this), 
                block.timestamp + DURATION
                );
            flag = !flag;
            
        } 

        if (_busdAmount == 0 && msg.value != 0) {
            flag = !flag;
        }

        // Get the whole amount BNB of this contract
        _bnbAmount = address(this).balance;

        require(flag, "Incorrect Input");

      
        // Get the amount of 37% BNB
        uint bnbAmount_ = _bnbAmount * percentage / 100;
        
        address[] memory pathBNBToBBTF = new address[](2);
        pathBNBToBBTF[0] = WBNB;
        pathBNBToBBTF[1] = BBTFToken;

        uint[] memory outBBTFAmount = new uint[](2);

        // Get the amount of the BBTF token to receive
        outBBTFAmount = ISafeswapRouter01(SafeMoonRouter).getAmountsOut(
            bnbAmount_, 
            pathBNBToBBTF
            );
        uint bbfAmountOutMin = outBBTFAmount[1] * 90 / 100;

        // Swap BNB to the BBTF token
        ISafeswapRouter02(SafeMoonRouter).swapExactETHForTokensSupportingFeeOnTransferTokens{value: bnbAmount_}(
            bbfAmountOutMin, 
            pathBNBToBBTF, 
            address(this), 
            block.timestamp + DURATION
            );

        uint bbtfAmount = IERC20(BBTFToken).balanceOf(address(this));

       
        // Get the Desired token BBTF Amount
        (uint reserve0, uint reserve1, ) = ISafewapV2Pair(pairBnbBbtf).getReserves();

        uint lpBnbAmount = bbtfAmount * reserve1 / reserve0;

        IERC20(BBTFToken).approve(SafeMoonRouter, bbtfAmount);

        // Add Liquidity with BNB and BBTF
        ISafeswapRouter01(SafeMoonRouter).addLiquidityETH{value: lpBnbAmount}(
            BBTFToken, 
            bbtfAmount, 1, 1, 
            msg.sender, 
            block.timestamp + DURATION
            );
        
        // Send the rest of total BNB to the BBTF operations wallet
        payable(BBTFWallet).transfer((address(this).balance));
        
    }

    function setPercentage(uint _newPercentage) external onlyAdmin{
        percentage = _newPercentage;
    }

     modifier onlyAdmin{
        require(admin == msg.sender, "OA");
        _;
    }

    function setNewAdmin(address newAdd) external onlyAdmin{
        admin = newAdd;
    }
}
