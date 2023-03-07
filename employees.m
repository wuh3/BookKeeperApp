classdef employees
    %EMPLOYEE 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        LastName
        FirstName
        AddressLine1
        AddressLine2
        City
        State
        Zip
        SSN
        numOfWitholdings
        Salary

    end
    
    methods
        function obj = employees(LN, FN, AL1, AL2, C, S, Z, SSN, NOW, Salary)
            %EMPLOYEE 构造此类的实例
            %   此处显示详细说明
            obj.LastName = LN;
            obj.FirstName = FN;
            obj.AddressLine1 = AL1;
            obj.AddressLine2 = AL2;
            obj.City = C;
            obj.State = S;
            obj.Zip = Z;
            obj.SSN = SSN;
            obj.numOfWitholdings = NOW;
            obj.Salary = Salary;
        end
        
        function arr = toDataform(obj)
            %METHOD1 此处显示有关此方法的摘要
            %   此处显示详细说明
            arr = {obj.LastName, obj.FirstName, obj.AddressLine1, obj.AddressLine2, obj.City, obj.State, obj.Zip, obj.SSN, obj.numOfWitholdings, obj.Salary};
        end
    end
end

