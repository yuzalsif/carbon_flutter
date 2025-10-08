---

### `CHANGELOG.md`

```markdown
# Changelog

All notable changes to this project will be documented in this file.

## 0.1.0 - Initial Release

*Date: [Enter Today's Date Here, e.g., 2023-11-15]*

### Added

- **Foundation:**
  - `CTheme`: Centralized theme definition for light and dark modes.
  - `CColors`: A comprehensive set of semantic color tokens based on the Carbon Design System.
  - `CTypography`: A full typographic scale using the IBM Plex Sans font family.
  - `CSpacing`: Spacing constants based on Carbon's 8px grid.

- **Components:**
  - Implemented over 25 core Carbon components, including:
    - **Forms & Inputs:** `CButton`, `CTextInput`, `CCheckbox`, `CRadioButtonGroup`, `CToggle`, `CDropdown`, `CMultiselect`, `CSlider`, `CSearch`, `CNumberInput`, `CDatePicker`, `CFileUploader`.
    - **Navigation:** `CBreadcrumb`, `CLink`, `CTabs`, `CContentSwitcher`, `CPagination`.
    - **Feedback & Status:** `CLoading`, `CInlineLoading`, `CSnackbar`, `CTooltip`, `CProgressIndicator`.
    - **Content & Layout:** `CAccordion`, `CModal`, `CTag`, `CContainedList`, `CTile`, `CCodeSnippet`, `CDataTable`.

- **Development:**
  - Created a comprehensive example application to showcase and test all implemented components and their states.
  - Structured the package with a clear separation between public API (`lib/`) and internal implementation (`lib/src/`).