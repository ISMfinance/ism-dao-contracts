
// File: @openzeppelin/contracts/math/Math.sol
//pragma experimental ABIEncoderV2;
pragma solidity ^0.5.16;

/**
 * @dev Standard math utilities missing in the Solidity language.
 */
library Math {
    /**
     * @dev Returns the largest of two numbers.
     */
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    /**
     * @dev Returns the smallest of two numbers.
     */
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    /**
     * @dev Returns the average of two numbers. The result is rounded towards
     * zero.
     */
    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity ^0.5.16;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/GSN/Context.sol

pragma solidity ^0.5.16;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

pragma solidity ^0.5.16;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), _owner);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Returns true if the caller is the current owner.
     */
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.16;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {ERC20Detailed}.
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
    function mint(address account, uint amount) external;

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
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

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

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity ^0.5.16;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * This test is non-exhaustive, and there may be false-negatives: during the
     * execution of a contract's constructor, its address will be reported as
     * not containing a contract.
     *
     * IMPORTANT: It is unsafe to assume that an address for which this
     * function returns false is an externally-owned account (EOA) and not a
     * contract.
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }

    /**
     * @dev Converts an `address` into `address payable`. Note that this is
     * simply a type cast: the actual underlying value is not changed.
     *
     * _Available since v2.4.0._
     */
    function toPayable(address account) internal pure returns (address payable) {
        return address(uint160(account));
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     *
     * _Available since v2.4.0._
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

pragma solidity ^0.5.16;




/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for ERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: contracts/IRewardDistributionRecipient.sol

pragma solidity ^0.5.16;



contract IRewardDistributionRecipient is Ownable {
    address public rewardDistribution;

    //function notifyRewardAmount(uint256 reward) external;

    modifier onlyRewardDistribution() {
        require(_msgSender() == rewardDistribution, "Caller is not reward distribution");
        _;
    }

    function setRewardDistribution(address _rewardDistribution)
        external
        onlyOwner
    {
        rewardDistribution = _rewardDistribution;
    }
}


/**
 * @dev Library for managing
 * https://en.wikipedia.org/wiki/Set_(abstract_data_type)[sets] of primitive
 * types.
 *
 * Sets have the following properties:
 *
 * - Elements are added, removed, and checked for existence in constant time
 * (O(1)).
 * - Elements are enumerated in O(n). No guarantees are made on the ordering.
 *
 * ```
 * contract Example {
 *     // Add the library methods
 *     using EnumerableSet for EnumerableSet.AddressSet;
 *
 *     // Declare a set state variable
 *     EnumerableSet.AddressSet private mySet;
 * }
 * ```
 *
 * As of v3.3.0, sets of type `bytes32` (`Bytes32Set`), `address` (`AddressSet`)
 * and `uint256` (`UintSet`) are supported.
 */
library EnumerableSet {
    // To implement this library for multiple types with as little code
    // repetition as possible, we write it in terms of a generic Set type with
    // bytes32 values.
    // The Set implementation uses private functions, and user-facing
    // implementations (such as AddressSet) are just wrappers around the
    // underlying Set.
    // This means that we can only create new EnumerableSets for types that fit
    // in bytes32.

    struct Set {
        // Storage of set values
        bytes32[] _values;

        // Position of the value in the `values` array, plus 1 because index 0
        // means a value is not in the set.
        mapping (bytes32 => uint256) _indexes;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function _add(Set storage set, bytes32 value) private returns (bool) {
        if (!_contains(set, value)) {
            set._values.push(value);
            // The value is stored at length-1, but we add 1 to all indexes
            // and use 0 as a sentinel value
            set._indexes[value] = set._values.length;
            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function _remove(Set storage set, bytes32 value) private returns (bool) {
        // We read and store the value's index to prevent multiple reads from the same storage slot
        uint256 valueIndex = set._indexes[value];

        if (valueIndex != 0) { // Equivalent to contains(set, value)
            // To delete an element from the _values array in O(1), we swap the element to delete with the last one in
            // the array, and then remove the last element (sometimes called as 'swap and pop').
            // This modifies the order of the array, as noted in {at}.

            uint256 toDeleteIndex = valueIndex - 1;
            uint256 lastIndex = set._values.length - 1;

            // When the value to delete is the last one, the swap operation is unnecessary. However, since this occurs
            // so rarely, we still do the swap anyway to avoid the gas cost of adding an 'if' statement.

            bytes32 lastvalue = set._values[lastIndex];

            // Move the last value to the index where the value to delete is
            set._values[toDeleteIndex] = lastvalue;
            // Update the index for the moved value
            set._indexes[lastvalue] = toDeleteIndex + 1; // All indexes are 1-based

            // Delete the slot where the moved value was stored
            set._values.pop();

            // Delete the index for the deleted slot
            delete set._indexes[value];

            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function _contains(Set storage set, bytes32 value) private view returns (bool) {
        return set._indexes[value] != 0;
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function _length(Set storage set) private view returns (uint256) {
        return set._values.length;
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function _at(Set storage set, uint256 index) private view returns (bytes32) {
        require(set._values.length > index, "EnumerableSet: index out of bounds");
        return set._values[index];
    }

    // Bytes32Set

    struct Bytes32Set {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _add(set._inner, value);
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _remove(set._inner, value);
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(Bytes32Set storage set, bytes32 value) internal view returns (bool) {
        return _contains(set._inner, value);
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(Bytes32Set storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(Bytes32Set storage set, uint256 index) internal view returns (bytes32) {
        return _at(set._inner, index);
    }

    // AddressSet

    struct AddressSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(AddressSet storage set, address value) internal returns (bool) {
        return _add(set._inner, bytes32(uint256(value)));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(AddressSet storage set, address value) internal returns (bool) {
        return _remove(set._inner, bytes32(uint256(value)));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(AddressSet storage set, address value) internal view returns (bool) {
        return _contains(set._inner, bytes32(uint256(value)));
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(AddressSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(AddressSet storage set, uint256 index) internal view returns (address) {
        return address(uint256(_at(set._inner, index)));
    }


    // UintSet

    struct UintSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(UintSet storage set, uint256 value) internal returns (bool) {
        return _add(set._inner, bytes32(value));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(UintSet storage set, uint256 value) internal returns (bool) {
        return _remove(set._inner, bytes32(value));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(UintSet storage set, uint256 value) internal view returns (bool) {
        return _contains(set._inner, bytes32(value));
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function length(UintSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

   /**
    * @dev Returns the value stored at position `index` in the set. O(1).
    *
    * Note that there are no guarantees on the ordering of values inside the
    * array, and it may change when more values are added or removed.
    *
    * Requirements:
    *
    * - `index` must be strictly less than {length}.
    */
    function at(UintSet storage set, uint256 index) internal view returns (uint256) {
        return uint256(_at(set._inner, index));
    }
}

interface IRewardPools {
    function deposit(uint256 pid, uint256 time, uint256 amount) external;
    function withdraw(uint256 pid, uint256 amount) external;
    function earned(uint256 rid, uint256 pid, address account) external view returns(uint256);
    function getTokenAmount(address account, address token) external view returns(uint256);
    function getTokenIsInMembers(address token) external view returns(bool);
    function getTokenMember(uint256 index) external view returns(address);
    function getTokenMembersLength() external view returns(uint256);
    function isVote() external view returns(bool);
    function lastTimeRewardApplicable(uint256 rid, uint256 pid) external view returns(uint256);
    function poolUse(uint256 pid) external view returns(IERC20, uint256, uint256, uint256, uint256);
    function rewardPerToken(uint256 rid, uint256 pid) external view returns(uint256);
    function totalID() external view returns(uint256);
    function isDeposit(uint256 pid, address account) external view returns(bool);
    function depositNum(uint256 pid) external view returns(uint256);
    function user(uint256 pid, address account) external view returns(uint256, uint256, uint256, uint256, uint256);
    function userInfo(uint256 rid, uint256 pid, address account) external view returns(uint256, uint256);
    function poolInfo(uint256 rid, uint256 pid) external view returns(uint256, uint256, uint256, uint256, uint256, uint256);
}

contract RewardPools is IRewardDistributionRecipient, IRewardPools {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using EnumerableSet for EnumerableSet.AddressSet;
    
    uint256 public totalID;
    uint256 oneMonth = 30 days;
    uint256 threeYear = 3 * 12 * oneMonth;
    bool public isVote;
    EnumerableSet.AddressSet rewardToken;

    struct PoolInfo {
        uint256 initreward;
        uint256 rewardRate;
        uint256 lastUpdateTime;
        uint256 rewardPerTokenStored;
        uint256 periodFinish;
    }

    struct UserInfo {
        uint256 userRewardPerTokenPaid;
        uint256 rewards;
    }

    struct PoolUse {
        IERC20 lpToken;
        uint256 totalSupply;
        uint256 duration;
        uint256 totalTime;
        uint256 weight;
    }

    struct User {
        uint256 balances;
        uint256 lastTime;
        uint256 choiceTime;
        uint256 endTime;
        uint256 weight;
    }

    // pid => poolUse
    mapping (uint256 => PoolUse) public poolUse;
    // pid => user => user
    mapping (uint256 => mapping(address => User)) public user;
    // rid => pid => reward
    mapping (uint256 => mapping(uint256 => PoolInfo)) public poolInfo;
    // rid => pid => user => userInfo
    mapping(uint256 => mapping(uint256 => mapping(address => UserInfo))) public userInfo;
    mapping(uint256 => mapping(address => bool)) public isDeposit;
    mapping(uint256 => uint256) public depositNum;

    event RewardAdded(uint256 rid, uint256 pid, uint256 reward);
    event Deposit(address indexed user, uint256 pid, uint256 amount);
    event Withdrawn(address indexed user, uint256 pid, uint256 amount);
    event RewardPaid(address indexed user, uint256 rid, uint256 pid, uint256 reward);
    event VoteTime(bool _isVote);

    constructor() public {}
    

    modifier updateReward(uint256 pid, address account) {
        uint256 rid = getTokenMembersLength();
        for(uint256 i = 0; i < rid; i++) {
            poolInfo[i][pid].rewardPerTokenStored = rewardPerToken(i, pid);
            poolInfo[i][pid].lastUpdateTime = lastTimeRewardApplicable(i, pid);
            if (account != address(0)) {
                userInfo[i][pid][account].rewards = earned(i, pid, account);
                userInfo[i][pid][account].userRewardPerTokenPaid = poolInfo[i][pid].rewardPerTokenStored;
            }
        }
        _;
    }

    modifier isPidExist(uint256 pid) {
        require(pid < totalID, "pid not exist");
        _;
    }

    modifier isRidExist(uint256 rid) {
        require(rid < getTokenMembersLength(), "rid not exist");
        _;
    }
    
    modifier notVote() {
        require(!isVote, "time is vote statistical");
        _;
    }

    function addDepositToken(IERC20 token, uint256 duration) 
        public 
        onlyOwner  
        returns(uint256 pid) 
    {
        pid = totalID++;
        poolUse[pid] = PoolUse({
            lpToken: token,
            totalSupply: 0,
            duration: duration,
            totalTime: 0,
            weight: 0
        });
    }

    function addRewardToken(address token) public onlyOwner returns(bool) {
        if(!rewardToken.contains(token)) {
            rewardToken.add(token);
        }
        return true;
    }

    function getTokenAmount(address account, address token) public view returns(uint256) {
        return IERC20(token).balanceOf(account);
    }
    
    function getTokenMember(uint256 index) public view returns(address) {
        return rewardToken.at(index);
    }
    
    function getTokenMembersLength() public view returns(uint256) {
        return rewardToken.length();
    }
    
    function getTokenIsInMembers(address token) public view returns(bool) {
        return rewardToken.contains(token);
    }

    function lastTimeRewardApplicable(uint256 rid, uint256 pid) 
        public 
        isPidExist(pid) 
        view 
        returns (uint256) 
    {
        return Math.min(block.timestamp, poolInfo[rid][pid].periodFinish);
    }

    function rewardPerToken(uint256 rid, uint256 pid) public isPidExist(pid) view returns (uint256) {
        if (poolUse[pid].weight == 0) {
            return poolInfo[rid][pid].rewardPerTokenStored;
        }
        return
            poolInfo[rid][pid].rewardPerTokenStored.add(
                lastTimeRewardApplicable(rid, pid)
                    .sub(poolInfo[rid][pid].lastUpdateTime)
                    .mul(poolInfo[rid][pid].rewardRate)
                    .mul(1e36)
                    .div(poolUse[pid].weight)
            );
    }

    function earned(uint256 rid, uint256 pid, address account) public view returns (uint256) {
        return
            user[pid][account].weight
                .mul(rewardPerToken(rid, pid).sub(userInfo[rid][pid][account].userRewardPerTokenPaid))
                .div(1e36)
                .add(userInfo[rid][pid][account].rewards);
    }

    function deposit(uint256 pid, uint256 time, uint256 amount) 
        public 
        isPidExist(pid) 
        notVote
        updateReward(pid, msg.sender) 
    {
        require(amount > 0, "amount cant not less than 0");
        require(time/oneMonth >= 1, "time shoud >= oneMonth");

        stake(pid, time, amount);
        emit Deposit(msg.sender, pid, amount);
        
        if(!isDeposit[pid][msg.sender]) {
            isDeposit[pid][msg.sender] = true;
            depositNum[pid]++;
        }
    }

    function withdraw(uint256 pid, uint256 amount) 
        public 
        isPidExist(pid)
        notVote
        updateReward(pid, msg.sender) 
    {
        require(amount >= 0, "amount cant not less than 0");
        if(amount > 0) {
            require(block.timestamp > user[pid][msg.sender].endTime, "can not unlock");
        }
        uint256 rid = getTokenMembersLength();
        for(uint256 i = 0; i < rid; i++) {
            _getReward(i, pid);   
        }

        if (amount > 0) {
            withdraws(pid, amount);
            emit Withdrawn(msg.sender, pid, amount);
        }
        
        if(isDeposit[pid][msg.sender] && user[pid][msg.sender].balances == 0) {
            isDeposit[pid][msg.sender] = false;
            if(depositNum[pid] > 0) {
                depositNum[pid]--;    
            }
        }
    }

    function _getReward(uint256 rid, uint256 pid) internal {
        uint256 reward = earned(rid, pid, msg.sender);
        if (reward > 0) {
            userInfo[rid][pid][msg.sender].rewards = 0;
            poolInfo[rid][pid].initreward = poolInfo[rid][pid].initreward.sub(reward);
            IERC20(getTokenMember(rid)).safeTransfer(msg.sender, reward);
            emit RewardPaid(msg.sender, rid, pid, reward);
        }
    }

    function notifyRewardAmount(uint256 reward, uint256 rid, uint256 pid)
        external
        isRidExist(rid)
        isPidExist(pid)
        onlyRewardDistribution
        updateReward(pid, address(0))
    {
        PoolInfo storage pool = poolInfo[rid][pid];
        uint256 _currTime = block.timestamp; 
        if (_currTime >= pool.periodFinish) {
            pool.rewardRate = reward.div(poolUse[pid].duration);
        } else {
            uint256 remaining = pool.periodFinish.sub(block.timestamp);
            uint256 leftover = remaining.mul(pool.rewardRate);
            pool.rewardRate = reward.add(leftover).div(poolUse[pid].duration);
        }

        address token = getTokenMember(rid);
        IERC20(token).safeTransferFrom(msg.sender, address(this), reward);

        pool.initreward = pool.initreward.add(reward);
        pool.lastUpdateTime = _currTime;
        pool.periodFinish = _currTime.add(poolUse[pid].duration);
        emit RewardAdded(rid, pid, reward);
    }



    function stake(uint256 pid, uint256 time, uint256 amount) internal {
        if(time > threeYear) {
            time = threeYear;
        }
        poolUse[pid].totalSupply = poolUse[pid].totalSupply.add(amount);
        user[pid][msg.sender].balances = user[pid][msg.sender].balances.add(amount);

        uint256 _currTime = block.timestamp;
        uint256 _totalWeight = poolUse[pid].weight;
        if(_currTime > user[pid][msg.sender].endTime) {
            _totalWeight = _totalWeight.sub(user[pid][msg.sender].weight);
            poolUse[pid].totalTime = poolUse[pid].totalTime.sub(user[pid][msg.sender].choiceTime).add(time);
            user[pid][msg.sender].choiceTime = time;
            user[pid][msg.sender].endTime = _currTime.add(time);
            user[pid][msg.sender].lastTime = _currTime;
            user[pid][msg.sender].weight = user[pid][msg.sender].balances.mul(time);
            _totalWeight = _totalWeight.add(user[pid][msg.sender].weight);
            poolUse[pid].weight = _totalWeight;
        } else {
            _totalWeight = _totalWeight.sub(user[pid][msg.sender].weight);
            uint256 _useTime = _currTime.sub(user[pid][msg.sender].lastTime);
            uint256 _remainTime = 0;
            if(_useTime <= user[pid][msg.sender].choiceTime) {
                _remainTime = user[pid][msg.sender].choiceTime.sub(_useTime);
            }
            poolUse[pid].totalTime = poolUse[pid].totalTime.sub(user[pid][msg.sender].choiceTime);

            user[pid][msg.sender].choiceTime = _remainTime.add(time);
            if(user[pid][msg.sender].choiceTime > threeYear) {
                user[pid][msg.sender].choiceTime = threeYear;
            }
            
            user[pid][msg.sender].endTime = user[pid][msg.sender].choiceTime.add(_currTime);
            user[pid][msg.sender].lastTime = _currTime;
            user[pid][msg.sender].weight = user[pid][msg.sender].balances.mul(user[pid][msg.sender].choiceTime);

            poolUse[pid].totalTime = poolUse[pid].totalTime.add(user[pid][msg.sender].choiceTime);
            _totalWeight = _totalWeight.add(user[pid][msg.sender].weight);
            poolUse[pid].weight = _totalWeight;
        }
        
        poolUse[pid].lpToken.safeTransferFrom(msg.sender, address(this), amount);
    }

    function withdraws(uint256 pid, uint256 amount) internal {
        uint256 _totalWeight = poolUse[pid].weight;
        _totalWeight = _totalWeight.sub(user[pid][msg.sender].weight);

        poolUse[pid].totalSupply = poolUse[pid].totalSupply.sub(amount);
        user[pid][msg.sender].balances = user[pid][msg.sender].balances.sub(amount);

        uint256 _currTime = block.timestamp;
        user[pid][msg.sender].lastTime = _currTime;

        user[pid][msg.sender].weight = user[pid][msg.sender].balances.mul(user[pid][msg.sender].choiceTime);
        _totalWeight = _totalWeight.add(user[pid][msg.sender].weight);
        poolUse[pid].weight = _totalWeight;

        if(amount > 0) {
            poolUse[pid].lpToken.safeTransfer(msg.sender, amount);
        }
    }

    // seconds
    function setDuration(uint256 pid, uint256 newDuration) 
        public 
        isPidExist(pid)
        updateReward(pid, address(0))
        onlyOwner
    {
        require(newDuration > 0, "new duration shoud bigger than zero");
        uint256 num = getTokenMembersLength();
        uint256 _currTime = block.timestamp; 

        for(uint256 i = 0; i < num; i++) {
            PoolInfo storage pool = poolInfo[i][pid];
            if (_currTime < pool.periodFinish) {
                if(newDuration < poolUse[pid].duration) {
                    uint256 startTime = pool.periodFinish.sub(poolUse[pid].duration);
                    require(startTime.add(newDuration) > _currTime, "new end time < old end time");
                }
                
                uint256 remaining = pool.periodFinish.sub(_currTime);
                uint256 leftover = remaining.mul(pool.rewardRate);
                pool.rewardRate = leftover.div(newDuration);
                pool.lastUpdateTime = _currTime;
                pool.periodFinish = _currTime.add(newDuration);
            }
        }
        poolUse[pid].duration = newDuration;
    }
    
    function setVote(bool _isVote) public onlyOwner {
        isVote = _isVote;
        emit VoteTime(_isVote);
    }
}
