# vet_clinics_db
A database for exploring equitable access to veterinary (vet) care in Madison, WI, explores the limitations for people when accessing vet care using census tract level data: demographics, socio-economic variables including public transit information. Therefore, the database serves the queries for potential low accessibility areas (census tracts) within census tracts and allows for a food desert alike analysis.

<h3>Data Engineering Information:</h3>

<table>
    <tr>
        <th>Table name</th>
        <th>File type</th>
        <th>Geometry type</th>
        <th>Projection</th>
        <th>Data source</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>vet_walk_polygons</td>
        <td>Shapefile</td>
        <td>Polygons</td>
        <td>UTM Zone 16N</td>
        <td>Network Analysis by Sid</td>
        <td>Stores 0.5, 1 mile walk polygons from veterinary clinics (Network Analysis)</td>
    </tr>
    <tr>
        <td>madison_demographics</td>
        <td>CSV</td>
        <td>NA</td>
        <td>NA</td>
        <td>Wisconsin Food Project</td>
        <td>Stores Demographic and socio-economic information</td>
    </tr>
    <tr>
        <td>madison_census_tracts</td>
        <td>Shapefile</td>
        <td>Polygon</td>
        <td>UTM Zone 16N</td>
        <td>GeoData@Wisconsin</td>
        <td>Stores latest census tracts information 2022 (Tiger line)</td>
    </tr>
    <tr>
        <td>madison_metro</td>
        <td>Shapefile</td>
        <td>Point</td>
        <td>UTM Zone 16N</td>
        <td>City of Madison</td>
        <td>Stores stops information of Madison Metro Bus routes</td>
    </tr>
    <tr>
        <td>madison_vet</td>
        <td>Shapefile</td>
        <td>Point</td>
        <td>UTM Zone 16N</td>
        <td>Compiled by Kaitlyn Breaux</td>
        <td>Stores information on veterinary clinics (dogs, cats, open days)</td>
    </tr>
    <tr>
        <td>madison_urban_bounds</td>
        <td>Shapefile</td>
        <td>Polygon</td>
        <td>UTM Zone 16N</td>
        <td>GeoData@Wisconsin</td>
        <td>Stores urban bounds of city of Madison, WI</td>
    </tr>
     <tr>
        <td>dane_roads</td>
        <td>Shapefile</td>
        <td>line</td>
        <td>UTM Zone 16N</td>
        <td>GeoData@Wisconsin</td>
        <td>Stores road network (Elevation model) of Dane county</td>
    </tr>
</table>


<h3>Attribute information of datasets:</h3>

<code>madison_demographics</code> stores socio-demographic indicators which are retrieved from American Community Survey (ACS) 2016-20 describe economic conditions with better dimensions like Gini Index of income inequality, median income and help analyze veternary deserts situation in Madison, WI. The data is sourced from <a href = "https://foodsecurity.wisc.edu/downloaddata">Applied Population Laboratory (APL)</a>

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

<code>madison_metro</code> stores information of metro transit stop names and routes connected from a bus stop. The information is sourced from <a href = "https://data-cityofmadison.opendata.arcgis.com/datasets/cityofmadison::metro-transit-bus-stops/explore"> City of Madison</a>. The dataset helps in understanding public transit availability in a census tracts to assess vet care accessibility.
<ul>
    <li><code>stop_code</code>: Bus stop code for each stop provided by Madison metro bus service.<li>
    <li><code>stop_name</code>: Name of the bus stop<li>
    <li><code>primary_st</code>: Primary street where the bus stop is located<li>
    <li><code>Route</code>: Other connected route codes from a bus stop<li>
    <li><code>geometry</code>: Point geometry of bus stop<li>
</ul>

<code>madison_census_tracts</code> is useful in appending with madison_demographics to gain insights for spatial queries in understanding vet clinics availability, number of bus stops.
<ul>
    <li><code>tractce</code>: Census tract code</li>
    <li><code>geoid</code>: Census tract identifier which is combination of state(55), county(025) and tractce values</li>
    <li><code>namelsad</code>:  Translated legal/statistical area description</li>
    <li><code>shape_leng</code>: Shape length</li>
    <li><code>shape_area</code>: Shape area</li>
    <li><code>geometry</code>: Polygon geometry of each census tract</li>
</ul>

<code>madison_vet</code> provides information on veterinary clinic addresses with range of service availability (weekends/weekdays) for various species of pet animals. Additional information on payment plans, full services are also added to complement the veterinary clinics data. The data is compiled by Kaitlyn Breaux.

<ul>
    <li><code>name</code>: Name of veterinary clinic/hospital</li>
    <li><code>hnum</code>: House number</li>
    <li><code>street</code>: Street address of the clinic</li>
    <li><code>city</code>: Location of city (Within Dane county)</li>
    <li><code>open_wk</code>: Open on weekdays (Yes/No)</li>
    <li><code>open_wkds</code>: Open on weekends (Yes/No)</li>
    <li><code>cats</code>: Cats are treated (Yes/No)</li>
    <li><code>dogs</code>: Dogs are treated (Yes/No)</li>
    <li><code>others</code>: Other animals are treated (Yes/No/NA)</li>
    <li><code>pplan</code>: Payment plan availability (Yes/No/NA)</li>
    <li><code>full_srvc</code>: Full service availability (Yes/No)</li>
    <li><code>low_cost</code>: Low cost clinic (Yes/No)</li>
    <li><code>geometry</code>: Point location of veterinary clinic</li>
</ul>

<code>madison_urban_bounds</code> stores the geometry information on the limits of Madison, WI. The dataset is downloaded from <a href = "https://data-cityofmadison.opendata.arcgis.com/datasets/madison-urban-area-boundary/explore">city of Madison</a>

<ul>
    <li><code>name</code>: Name of shapefile</li>
    <li><code>geometry</code>: Polygon geometry of Madison, WI urban bounds</li>
</ul>

<code>vet_walk_polygons</code> provides walk polygons of 0.5, 1 mile from veterinary clinics (using madison_vet datasest) and dane_roads shapefile which describes Dane county road network sourced from GeoData@Wisconsin website (2022). The dataset is computed by Chinna Subbaraya Siddharth (Sid) Ramavajjala by performing network analysis using ArcGIS Pro. The dataset helps in understanding of vet deserts in Madison, WI.
<ul>
    <li><code>name</code>: Veterinary clinic from which walk polygons are computed</li>
    <li><code>org_mile</code>: Origin mile value of the walk polygon</li>
    <li><code>dst_mile</code>: Destination mile value of the walk polygon</li>
    <li><code>shape_leng</code>: Shape length of polygon</li>
    <li><code>shape_area</code>: Shape area of polygon</li>
    <li><code>geometry</code>: Walk polygon geometry of 0.5 and 1 mile</li>
</ul>