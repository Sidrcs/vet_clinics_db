# vet_clinics_db
A database for exploring equitable access to veterinary (vet) care in Madison, WI, explores the limitations for people when accessing vet care using census tract level data: demographics, socio-economic variables including public transit information. Therefore, the database serves the queries for potential low accessibility areas (census tracts) within census tracts and allows for a food desert alike analysis.

Hosted spatial data: 
The projection of data is UTM Zone 16N

<table>
    <tr>
        <th>Table name</th>
        <th>File type</th>
        <th>Geometry type</th>
        <th>Projection</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>dane_roads</td>
        <td>Shapefile</td>
        <td>Line</td>
        <td>UTM Zone 16N</td>
        <td>Stores Dane county road network</td>
    </tr>
    <tr>
        <td>madison_demographics</td>
        <td>CSV</td>
        <td>NA</td>
        <td>NA</td>
        <td>Stores Demographic and socio-economic information</td>
    </tr>
    <tr>
        <td>madison_census_tracts</td>
        <td>Shapefile</td>
        <td>Polygon</td>
        <td>UTM Zone 16N</td>
        <td>Stores latest census tracts information 2022 (Tiger line)</td>
    </tr>
    <tr>
        <td>madison_metro</td>
        <td>Shapefile</td>
        <td></td>
    </tr>
</table>


<h3>Socio-Demographic Indicators</h3>:

The socio-demographic indicators, are retrieved from American Community Survey (ACS) 2016-20, describe economic conditions with better dimensions and help analyze veternary deserts in Madison. The data is sourced from <a href = "https://foodsecurity.wisc.edu/downloaddata">Applied Population Laboratory (APL)</a>

<ul>
    <li><code>noveh1620_est</code>: Households without vehicle, % (2016-20)</li>
    <li><code>gini1620_est</code>: Gini Index of Income Inequality (2016-20)</li>
    <li><code>medincacs1620_est</code>: Median household income (2016-20)</li>
    <li><code>walkoth1620_est</code>: Workers walking or other non-vehicle, % (2016-20)</li>
    <li><code>pubtrans1620_est</code>: Workers using public transportation, % (2016-20)</li>
    <li><code>noncitizens1620_est</code>: Noncitizens, % (2016-20)</li>
    <li><code>hispanic1620_est</code>: Hispanic or Latino, % (2016-20)</li>
    <li><code>raceoth1620_est</code>: Other or multiple race, % (2016-20)</li>
    <li><code>raceamind1620_est</code>: American Indian, % (2016-20)</li>
    <li><code>raceasian1620_est</code>: Asian, % (2016-20)</li>
    <li><code>raceaa1620_est</code>: African American, % (2016-20)</li>
    <li><code>racewhite1620_est</code>: White, % (2016-20)</li>
</ul>
