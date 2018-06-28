#region HEADER
$script:DSCModuleName = 'AuditPolicyDsc'
$script:DSCResourceName = 'MSFT_AuditPolicySubcategory'

# Unit Test Template Version: 1.2.2
$script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
     (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone','https://github.com/PowerShell/DscResource.Tests.git',(Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))
}

Import-Module -Name (Join-Path -Path $script:moduleRoot -ChildPath (Join-Path -Path 'DSCResource.Tests' -ChildPath 'TestHelper.psm1')) -Force

$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName $script:DSCModuleName `
    -DSCResourceName $script:DSCResourceName `
    -ResourceType 'Mof' `
    -TestType Unit
#endregion HEADER

# Begin Testing
try
{
    #region Pester Tests

    InModuleScope $script:DSCResourceName {

        # The script scope does not pierce the InModuleScope
        $script:DSCResourceName = 'MSFT_AuditPolicySubcategory'

        Describe "$($script:DSCResourceName)\Get-TargetResource" {

            $testParameters = @{
                Name      = 'Logon'
                AuditFlag = 'Success'
            }

            Context "Single word subcategory submit 'Success' and return 'Success'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Success'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Present'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Single word subcategory submit 'Success' and return 'Failure'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties from a Single word subcategory' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Failure'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Absent'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Single word subcategory submit 'Success' and return 'NoAuditing'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'NoAuditing' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'NoAuditing'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Absent'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Single word subcategory submit 'Success' and return 'Success and Failure'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success and Failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Success'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Present'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            $testParameters.AuditFlag = 'Failure'

            Context "Single word subcategory submit 'Failure' and return 'Success'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Success'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Absent'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Single word subcategory submit 'Failure' and return 'Failure'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties from a Single word subcategory' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Failure'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Present'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Single word subcategory submit 'Failure' and return 'NoAuditing'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'NoAuditing' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'NoAuditing'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Absent'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Single word subcategory submit 'Failure' and return 'Success and Failure'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success and Failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Failure'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Present'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            $testParameters.Name      = 'Credential Validation'
            $testParameters.AuditFlag = 'Success'

            Context "Mulit-word subcategory submit 'Success' and return 'Success'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Success'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Present'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Mulit-word subcategory submit 'Success' and return 'Failure'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Failure'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Absent'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Mulit-word subcategory submit 'Success' and return 'NoAuditing'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'NoAuditing' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'NoAuditing'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Absent'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Mulit-word subcategory submit 'Success' and return 'Success and Failure'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success and Failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Success'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Present'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            $testParameters.AuditFlag = 'Failure'

            Context "Mulit-word subcategory submit 'Failure' and return 'Success'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Success'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Absent'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Mulit-word subcategory submit 'Failure' and return 'Failure'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties from a Single word subcategory' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Failure'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Present'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Mulit-word subcategory submit 'Failure' and return 'NoAuditing'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'NoAuditing' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'NoAuditing'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Absent'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context "Mulit-word subcategory submit 'Failure' and return 'Success and Failure'" {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success and Failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return the correct hashtable properties' {
                    $script:getTargetResourceResult.Name      | Should Be $testParameters.Name
                    $script:getTargetResourceResult.AuditFlag | Should Be 'Failure'
                    $script:getTargetResourceResult.Ensure    | Should Be 'Present'
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }
        }

        Describe "$($script:DSCResourceName)\Test-TargetResource" {

            Mock -CommandName Test-ValidSubcategory -MockWith { return $true } `
                 -ModuleName MSFT_AuditPolicySubcategory

            $testParameters = @{
                Name      = 'Invalid'
                AuditFlag = 'Success'
                Ensure    = 'Present'
            }

            Context 'Invalid subcategory' {

                Mock -CommandName Get-AuditSubcategory -MockWith { } `
                     -ModuleName MSFT_AuditPolicySubcategory

                It 'Should throw an exception' {
                    { $getTargetResourceResult = Get-TargetResource @testParameters } |
                        Should Throw
                }

                It 'Should NOT call expected Mocks' {
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Times 0
                }
            }

            # Update the Subcategory to a valid name
            $testParameters.Name = 'Logon'

            Context 'Single word subcategory Success flag present and should be' {

                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:testTargetResourceResult = Test-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return true' {
                    $script:testTargetResourceResult | Should Be $true
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context 'Single word subcategory Success flag present and should not be' {

                $testParameters.Ensure = 'Absent'
                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:testTargetResourceResult = Test-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should return false' {
                    $script:testTargetResourceResult | Should Be $false
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            $testParameters.AuditFlag   = 'Failure'

            Context 'Single word subcategory failure flag present and should be' {

                $testParameters.Ensure = 'Present'
                Mock -CommandName Get-AuditSubcategory -MockWith { return 'failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:testTargetResourceResult = Test-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return true' {
                    $script:testTargetResourceResult | Should Be $true
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context 'Single word subcategory failure flag present and should not be' {

                $testParameters.Ensure = 'Absent'
                Mock -CommandName Get-AuditSubcategory -MockWith { return 'failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:testTargetResourceResult = Test-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should return false' {
                    $script:testTargetResourceResult | Should Be $false
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            $testParameters.AuditFlag   = 'Success'
            $testParameters.Name = 'Credential Validation'

            Context 'Multi-word subcategory Success flag present and should be' {

                $testParameters.Ensure = 'Present'
                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:testTargetResourceResult = Test-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return true' {
                    $script:testTargetResourceResult | Should Be $true
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context 'Multi-word subcategory Success flag present and should not be' {

                $testParameters.Ensure = 'Absent'
                Mock -CommandName Get-AuditSubcategory -MockWith { return 'Success' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:testTargetResourceResult = Test-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should return false' {
                    $script:testTargetResourceResult | Should Be $false
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            $testParameters.AuditFlag   = 'Failure'

            Context 'Multi-word subcategory failure flag present and should be' {

                $testParameters.Ensure = 'Present'
                Mock -CommandName Get-AuditSubcategory -MockWith { return 'failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:testTargetResourceResult = Test-TargetResource @testParameters } |
                        Should Not Throw
                }

                It 'Should return true' {
                    $script:testTargetResourceResult | Should Be $true
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }

            Context 'Multi-word subcategory failure flag present and should not be' {

                $testParameters.Ensure = 'Absent'
                Mock -CommandName Get-AuditSubcategory -MockWith { return 'failure' } `
                     -ModuleName MSFT_AuditPolicySubcategory -Verifiable

                It 'Should not throw an exception' {
                    { $script:testTargetResourceResult = Test-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should return false' {
                    $script:testTargetResourceResult | Should Be $false
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-AuditSubcategory -Exactly 1
                }
            }
        }

        Describe "$($script:DSCResourceName)\Set-TargetResource" {

            Mock -CommandName Test-ValidSubcategory -MockWith { return $true } `
                 -ModuleName MSFT_AuditPolicySubcategory

            $testParameters = @{
                Name      = 'Logon'
                AuditFlag = 'Success'
                Ensure    = 'Present'
            }

            Context 'Set single word subcategory success flag to present' {

                Mock -CommandName Set-AuditSubcategory -MockWith { } -Verifiable

                It 'Should not throw an exception' {
                    { Set-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Set-AuditSubcategory -Exactly 1
                }
            }

            Context 'Set single word subcategory failure flag to present' {

                $testParameters.AuditFlag = 'Failure'
                Mock -CommandName Set-AuditSubcategory -MockWith { } -Verifiable

                It 'Should not throw an exception' {
                    { Set-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Set-AuditSubcategory -Exactly 1
                }
            }

            Context 'Set single word subcategory success flag to absent' {

                $testParameters.Ensure    = 'Absent'
                $testParameters.AuditFlag = 'Success'
                Mock -CommandName Set-AuditSubcategory -MockWith { } -Verifiable

                It 'Should not throw an exception' {
                    { Set-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Set-AuditSubcategory -Exactly 1
                }
            }

            Context 'Set single word subcategory failure flag to absent' {

                $testParameters.AuditFlag = 'Failure'
                Mock -CommandName Set-AuditSubcategory -MockWith { } -Verifiable

                It 'Should not throw an exception' {
                    { Set-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Set-AuditSubcategory -Exactly 1
                }
            }

            Context 'Set multi-word subcategory success flag to present' {

                $testParameters.Name      = 'Credential Validation'
                $testParameters.AuditFlag = 'Success'
                $testParameters.Ensure    = 'Present'
                Mock -CommandName Set-AuditSubcategory -MockWith { } -Verifiable

                It 'Should not throw an exception' {
                    { Set-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Set-AuditSubcategory -Exactly 1
                }
            }

            Context 'Set multi-word subcategory failure flag to present' {

                $testParameters.AuditFlag = 'Failure'
                Mock -CommandName Set-AuditSubcategory -MockWith { } -Verifiable

                It 'Should not throw an exception' {
                    { Set-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Set-AuditSubcategory -Exactly 1
                }
            }

            Context 'Set single word subcategory success flag to absent' {

                $testParameters.AuditFlag = 'Success'
                $testParameters.Ensure    = 'Absent'
                Mock -CommandName Set-AuditSubcategory -MockWith { } -Verifiable

                It 'Should not throw an exception' {
                    { Set-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Set-AuditSubcategory -Exactly 1
                }
            }

            Context 'Set single word subcategory failure flag to absent' {

                $testParameters.AuditFlag = 'Failure'
                Mock -CommandName Set-AuditSubcategory -MockWith { } -Verifiable

                It 'Should not throw an exception' {
                    { Set-TargetResource @testParameters } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Set-AuditSubcategory -Exactly 1
                }
            }
        }

        Describe 'Function Get-AuditSubcategory'  {

            [String] $subCategory     = 'Logon'
            [String] $subCategoryGuid = '{0CCE9215-69AE-11D9-BED3-505054503030}'
            Context 'Get single word audit category success flag' {

                [String] $auditFlag   = 'Success'
                <#
                    The return is 3 lines Header, blank line, data
                    ComputerName,System,Subcategory,GUID,AuditFlags
                 #>
                 Mock -CommandName Invoke-Auditpol -MockWith {
                     @{
                        'Machine Name'= $env:COMPUTERNAME
                        'Policy Target' = 'System'
                        'Subcategory' = $subCategory
                        'Subcategory GUID' = $subCategoryGuid
                        'Inclusion Setting' = $auditFlag
                        'Exclusion Setting' = ''
                    }
                } -ParameterFilter { $Command -eq 'Get' } -Verifiable

                It 'Should not throw an exception' {
                    { $script:getAuditCategoryResult = Get-AuditSubcategory -Name $subCategory } |
                        Should Not Throw
                }

                It 'Should return the correct value' {
                    $script:getAuditCategoryResult | Should Be $auditFlag
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Invoke-Auditpol -Exactly 1
                }
            }

            Context 'Get single word audit category failure flag' {

                [String] $auditFlag = 'failure'
                <#
                    The return is 3 lines Header, blank line, data
                    ComputerName,System,Subcategory,GUID,AuditFlags
                 #>
                 Mock -CommandName Invoke-Auditpol -MockWith {
                    @{
                        'Machine Name'= $env:COMPUTERNAME
                        'Policy Target' = 'System'
                        'Subcategory' = $subCategory
                        'Subcategory GUID' = $subCategoryGuid
                        'Inclusion Setting' = $auditFlag
                        'Exclusion Setting' = ''
                    }
                } -ParameterFilter { $Command -eq 'Get' } -Verifiable

                It 'Should not throw an exception' {
                    { $script:getAuditCategoryResult = Get-AuditSubcategory -Name $subCategory } |
                        Should Not Throw
                }

                It 'Should return the correct value' {
                    $script:getAuditCategoryResult | Should Be $auditFlag
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Invoke-Auditpol -Exactly 1
                }
            }

            [String] $subCategory     = 'Credential Validation'
            [String] $subCategoryGuid = '{0CCE923F-69AE-11D9-BED3-505054503030}'
            Context 'Get single word audit category success flag' {

                [String] $auditFlag   = 'Success'
                # the return is 3 lines Header, blank line, data
                # ComputerName,System,Subcategory,GUID,AuditFlags
                 Mock -CommandName Invoke-Auditpol -MockWith {
                    @{
                        'Machine Name'= $env:COMPUTERNAME
                        'Policy Target' = 'System'
                        'Subcategory' = $subCategory
                        'Subcategory GUID' = $subCategoryGuid
                        'Inclusion Setting' = $auditFlag
                        'Exclusion Setting' = ''
                    }
                } -ParameterFilter { $Command -eq 'Get' } -Verifiable

                It 'Should not throw an exception' {
                    { $script:getAuditCategoryResult = Get-AuditSubcategory -Name $subCategory } |
                        Should Not Throw
                }

                It 'Should return the correct value' {
                    $script:getAuditCategoryResult | Should Be $auditFlag
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Invoke-Auditpol -Exactly 1
                }
            }

            Context 'Get single word audit category failure flag' {

                [String] $auditFlag   = 'failure'
                # the return is 3 lines Header, blank line, data
                # ComputerName,System,Subcategory,GUID,AuditFlags
                 Mock -CommandName Invoke-Auditpol -MockWith {
                    @{
                        'Machine Name'= $env:COMPUTERNAME
                        'Policy Target' = 'System'
                        'Subcategory' = $subCategory
                        'Subcategory GUID' = $subCategoryGuid
                        'Inclusion Setting' = $auditFlag
                        'Exclusion Setting' = ''
                    }
                } -ParameterFilter { $Command -eq 'Get' } -Verifiable

                It 'Should not throw an exception' {
                    { $script:getAuditCategoryResult = Get-AuditSubcategory -Name $subCategory } |
                        Should Not Throw
                }

                It 'Should return the correct value' {
                    $script:getAuditCategoryResult | Should Be $auditFlag
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Invoke-Auditpol -Exactly 1
                }
            }
        }

        Describe 'Function Set-AuditSubcategory' {

            Context 'Set single word audit category Success flag to Present' {

                Mock -CommandName Invoke-Auditpol -MockWith { } -ParameterFilter {
                    $Command -eq 'Set' } -Verifiable

                $comamnd = @{
                    Name      = "Logon"
                    AuditFlag = "Success"
                    Ensure    = "Present"
                }

                It 'Should not throw an error' {
                    { Set-AuditSubcategory @comamnd } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Invoke-Auditpol -Exactly 1
                }
            }

            Context 'Set single word audit category Success flag to Absent' {

                Mock -CommandName Invoke-Auditpol -MockWith { } -ParameterFilter {
                    $Command -eq 'Set' } -Verifiable

                $comamnd = @{
                    Name      = "Logon"
                    AuditFlag = "Success"
                    Ensure    = "Absent"
                }

                It 'Should not throw an exception' {
                    { Set-AuditSubcategory @comamnd } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Invoke-Auditpol -Exactly 1
                }
            }

            Context 'Set multi-word audit category Success flag to Present' {

                Mock -CommandName Invoke-Auditpol -MockWith { } -ParameterFilter {
                    $Command -eq 'Set' } -Verifiable

                $comamnd = @{
                    Name      = "Object Access"
                    AuditFlag = "Success"
                    Ensure    = "Present"
                }

                It 'Should not throw an exception' {
                    { Set-AuditSubcategory @comamnd } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Invoke-Auditpol -Exactly 1
                }
            }

            Context 'Set multi-word audit category Success flag to Absent' {

                Mock -CommandName Invoke-Auditpol -MockWith { } -ParameterFilter {
                    $Command -eq 'Set' } -Verifiable

                $comamnd = @{
                    Name      = "Object Access"
                    AuditFlag = "Success"
                    Ensure    = "Absent"
                }

                It 'Should not throw an exception' {
                    { Set-AuditSubcategory @comamnd } | Should Not Throw
                }

                It 'Should call expected Mocks' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Invoke-Auditpol -Exactly 1
                }
            }
        }

        Describe 'Function Test-AuditSubcategory' {

            Context 'Sucess' {

                $auditFlag = 'Success'
                It "Should return false when 'No Auditing' is present on the system" {
                    Test-AuditSubcategoryBitPresent -CurrentAuditFlag 'No Auditing' -AuditFlag $auditFlag |
                    Should Be $false
                }

                It "Should return true when 'Success' is present on the system" {
                    Test-AuditSubcategoryBitPresent -CurrentAuditFlag 'Success' -AuditFlag $auditFlag |
                    Should Be $true
                }

                It "Should return false when 'Failure' is present on the system" {
                    Test-AuditSubcategoryBitPresent -CurrentAuditFlag 'Failure' -AuditFlag $auditFlag |
                    Should Be $false
                }

                It "Should return true when 'Success and Failure' is present on the system" {
                    Test-AuditSubcategoryBitPresent -CurrentAuditFlag 'Success and Failure' -AuditFlag $auditFlag |
                    Should Be $true
                }
            }

            Context 'Failure' {

                $auditFlag = 'Failure'
                It "Should return false when 'No Auditing' is present on the system" {
                    Test-AuditSubcategoryBitPresent -CurrentAuditFlag 'No Auditing' -AuditFlag $auditFlag |
                    Should Be $false
                }

                It "Should return false when 'Success' is present on the system" {
                    Test-AuditSubcategoryBitPresent -CurrentAuditFlag 'Success' -AuditFlag $auditFlag |
                    Should Be $false
                }

                It "Should return true when 'Failure' is present on the system" {
                    Test-AuditSubcategoryBitPresent -CurrentAuditFlag 'Failure' -AuditFlag $auditFlag |
                    Should Be $true
                }

                It "Should return true when 'Success and Failure' is present on the system" {
                    Test-AuditSubcategoryBitPresent -CurrentAuditFlag 'Success and Failure' -AuditFlag $auditFlag |
                    Should Be $true
                }
            }

        }

        Describe 'Localization Files' {

            $modulePath = Join-Path -Path $moduleRoot -ChildPath "DscResources\$script:DSCResourceName"
            $localizationFiles = Get-ChildItem -Path $modulePath -Filter "$script:DSCResourceName.strings.psd1" -Recurse

            foreach ($file in $localizationFiles)
            {
                $culture = $file.PSParentPath.Substring($file.PSParentPath.LastIndexOf("\")+1)

                Context "Culture $culture" {

                    Import-LocalizedData `
                        -BindingVariable 'testLocalizedData' `
                        -FileName "$script:DSCResourceName.strings.psd1" `
                        -BaseDirectory $file.Directory.FullName

                    $requiredStrings = @('NoAuditing','Success','Failure','SuccessAndFailure')

                    foreach ($requiredString in $requiredStrings)
                    {
                        It "Should have $requiredString" {
                            $testLocalizedData.$requiredString | Should Not BeNullOrEmpty
                        }
                    }
                }
            }
        }
    }
    #endregion
}
finally
{
    #region FOOTER
    Restore-TestEnvironment -TestEnvironment $TestEnvironment
    #endregion
}
