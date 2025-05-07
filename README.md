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
In Okapi Rainbow, open okapi\step_0_xml_2_tmx.rnb:
![image](https://github.com/user-attachments/assets/665d9e90-507d-4819-99b0-2d3163f191c4)
![image](https://github.com/user-attachments/assets/72e432da-86aa-49e6-8383-26502ac00f51)
Here is what the generated TMX looks like when imported into a Translation Memory in memoQ:
![image](https://github.com/user-attachments/assets/f02c9bbb-052d-4e4a-b7f6-b062d3c7f679)

2. **Prepare xlf pack for the DITA file using Rainbow**
In Okapi Rainbow, open okapi\step_1_create_pack.rnb:
![image](https://github.com/user-attachments/assets/f1ef5abe-eddc-4189-98e8-e354e5a0e3f4)

3. **Translate the xlf file using Rainbow**
In Okapi Rainbow, open okapi\step_2_translate.rnb:
![image](https://github.com/user-attachments/assets/77e090da-6143-44b7-96fb-47a3460327cb)

4. **Create the target/trandlated DITA file using Rainbow**
In Okapi Rainbow, open okapi\steP_3_create_target.rnb:
![image](https://github.com/user-attachments/assets/12f83e4a-52c4-43b0-b5e4-bb2d6b92a93a)

Now you have the translated DITA file - okapi\pack1\done\translation-pipeline-okapi-dita\data\t0001_test.dita：
![image](https://github.com/user-attachments/assets/6eefca90-cc39-4a86-8772-94f0138551f1)


## 📝 Notes

- Files are based on English-Spanish translation (en-GB ➜ es-ES).
- XSLT and TMX structures conform to Okapi and TMX 1.4b standards.
