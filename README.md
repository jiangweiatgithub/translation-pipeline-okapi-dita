# Translation Pipeline: XML ➜ TMX ➜ DITA (via Okapi Rainbow)

This project demonstrates a localization workflow using:
- A bilingual XML file
- XSLT transformation to TMX
- DITA content translation using TMX via Okapi Framework's Rainbow tool

## 🔧 Requirements

- Java (for running Okapi tools)
- [Okapi Framework](https://okapiframework.org/)
- Bash shell (for running scripts)

## 📁 File Structure

- `data/` — Contains XML, TMX, and DITA files
- `xslt/` — Contains XSLT for XML to TMX transformation
- `okapi/` — Rainbow project files to process and translate
- `scripts/` — Automation script

## 🚀 Usage

1. **Transform XML to TMX using XSLT:**

```bash
xsltproc xslt/ENG-ESP_BT_Updated.xslt data/ENG-ESP_BT_Updated.xml > data/ENG-ESP_BT_Updated.tmx
```
OR
In Okapi Rainbow, open dita_xml_2_tmx.rnb:
![image](https://github.com/user-attachments/assets/665d9e90-507d-4819-99b0-2d3163f191c4)
![image](https://github.com/user-attachments/assets/72e432da-86aa-49e6-8383-26502ac00f51)
Here is what the generated TMX looks like when imported into a Translation Memory in memoQ:
![image](https://github.com/user-attachments/assets/f02c9bbb-052d-4e4a-b7f6-b062d3c7f679)

2. **Translate the DITA file using Rainbow:**

```bash
java -jar path/to/Rainbow.jar okapi/translate.rnb
```

3. *(Optional)* Run the entire process:

```bash
bash scripts/transform_and_translate.sh
```

## 📝 Notes

- Files are based on English-Spanish translation (en-GB ➜ es-ES).
- XSLT and TMX structures conform to Okapi and TMX 1.4b standards.
