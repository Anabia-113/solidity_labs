//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StudentRegistrationSystem {
    enum Department {
        Artificial_Intelligence,
        Blockchain,
        E_Commerce,
        Arts
    }
    enum Status {
        Enrolled,
        NotEnrolled,
        Graduated,
        Expelled
    }
    struct Student {
        string name;
        uint256 age;
        uint256 registrationDate;
        Department department;
        Status status;
        uint256 obtainedMarks;
    }
    mapping(uint256 => Student) students;
    uint256[] studentRoll;
    uint256[3] top3;

    function register(
        string memory _name,
        uint256 _age,
        uint256 _registrationDate,
        Department _department
    ) public {
        uint256 _roll = studentRoll.length + 1;
        students[_roll] = Student(
            _name,
            _age,
            _registrationDate,
            _department,
            Status.NotEnrolled,
            0
        );
        studentRoll.push(_roll);
    }

    function update(
        uint256 _rollNo,
        string memory _name,
        uint256 _age,
        uint256 _date,
        Department _department,
        Status _status,
        uint256 _obtainedMarks
    ) public {
        for (uint256 i = 1; i <= studentRoll.length; i++) {
            if (_rollNo == i) {
                students[_rollNo] = Student(
                    _name,
                    _age,
                    _date,
                    _department,
                    _status,
                    _obtainedMarks
                );
            }
        }
    }

    function retrieve(uint256 _rollNo)
        public
        view
        returns (
            string memory name,
            uint256 age,
            uint256 date,
            Department departnment,
            Status status,
            uint256 obtainedMarks
        )
    {
        return (
            students[_rollNo].name,
            students[_rollNo].age,
            students[_rollNo].registrationDate,
            students[_rollNo].department,
            students[_rollNo].status,
            students[_rollNo].obtainedMarks
        );
    }

    function countOfStudents()
        public
        view
        returns (
            uint256 AI,
            uint256 blockChain,
            uint256 e_commerce,
            uint256 arts
        )
    {
        uint256 _ai;
        uint256 _blockC;
        uint256 _ecomm;
        uint256 _art;
        for (uint256 i = 0; i < studentRoll.length; i++) {
            if (students[i].department == Department(0)) {
                _ai++;
            } else if (students[i].department == Department(1)) {
                _blockC++;
            } else if (students[i].department == Department(2)) {
                _ecomm++;
            } else if (students[i].department == Department(3)) {
                _art++;
            }
        }
        return (_ai, _blockC, _ecomm, _art);
    }

    function topperGetter() public view returns (uint256[3] memory) {
        return top3;
    }

    function top3Achivers() public {
        uint256[] memory _arr = studentRoll;
        for (uint256 j = 0; j < _arr.length - 1; j++) {
            for (uint256 k = 0; k < _arr.length - 1; k++) {
                if (
                    students[_arr[k]].obtainedMarks <students[_arr[k + 1]].obtainedMarks
                ) {
                    uint256 _bucket = _arr[k + 1];
                    _arr[k + 1] = _arr[k];
                    _arr[k] = _bucket;
                }
            }
        }
        top3[0] = _arr[0];
        top3[1] = _arr[1];
        top3[2] = _arr[2];
    }
}
