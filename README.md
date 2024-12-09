# Mule4 API Implementation Template

This Template Project is to be used as the start point for new API Implementations.

## How to use:

1. Download or Clone to your local system

2. Import this Project as Mule Project
   - Right-Click in `Package Explorer`
   - `Import`
   - `Anypoint Studio project from File System`
   - Select this project in `Project Root`
   - `Project Name` should be the Implementation Name
   - Select target Server Runtime
   - Check `Copy project into workspace`
   - `Finish`

3. change `artifactId` in your pom.xml

4. Update `src/main/resources/properties/apiProperties.yaml`

5. (Optional) Import API Design
   - Right-Click Project in `Package Explorer`
   - Manage Dependencies
   - Manage APIs
   - Click Green cross on top to add API Design

6. Configure the `HTTP Listener`:
   - Set Port: `${http.port}`
   - Set Base path: `${api.basePath}`

7. Remove example / reference `mule4ApiImplementationTemplate.xml`

8. Remove folder .git (from Explorer)

9. Start implementing
