package com.poly.service;

import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.poly.entities.Products;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;

public class ExcelProductGenerator {

	private List<Products> listProducts;
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;

	public ExcelProductGenerator(List<Products> listProducts) {
		this.listProducts = listProducts;
		workbook = new XSSFWorkbook();
	}

	private void writeHeader() {
		sheet = workbook.createSheet("Product");

		Row row = sheet.createRow(0);

		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setFontHeight(16);
		style.setFont(font);

		createCell(row, 0, "ID", style);
		createCell(row, 1, "Name", style);
		createCell(row, 2, "Price", style);
		createCell(row, 3, "Image", style);
		createCell(row, 4, "Brand", style);
		createCell(row, 5, "Descriptions", style);
		createCell(row, 6, "Category ID", style);
	}

	private void createCell(Row row, int columnCount, Object value, CellStyle style) {
		sheet.autoSizeColumn(columnCount);
		Cell cell = row.createCell(columnCount);
		if (value instanceof Integer) {
			cell.setCellValue((Integer) value);
		} else if (value instanceof Double) {
			cell.setCellValue((Double) value);
		} else if (value instanceof Long) {
			cell.setCellValue((Long) value);
		} else if (value instanceof Boolean) {
			cell.setCellValue((Boolean) value);
		} else {
			cell.setCellValue((String) value);
		}
		cell.setCellStyle(style);
	}

	private void write() {
	    int rowCount = 1;

	    CellStyle style = workbook.createCellStyle();
	    XSSFFont font = workbook.createFont();
	    font.setFontHeight(14);
	    style.setFont(font);

	    for (Products product : listProducts) {
	        Row row = sheet.createRow(rowCount++);
	        int columnCount = 0;

	        createCell(row, columnCount++, product.getId(), style);
	        createCell(row, columnCount++, product.getName(), style);
	        createCell(row, columnCount++, product.getPrice(), style);
	        createCell(row, columnCount++, product.getImage(), style);
	        createCell(row, columnCount++, product.getBrand().getName(), style); // Thay đổi ở đây
	        createCell(row, columnCount++, product.getDescription(), style);
	        createCell(row, columnCount++, product.getCategory().getId(), style);
	    }
	}


	public void generate(HttpServletResponse response) throws IOException {
		writeHeader();
		write();
		ServletOutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		workbook.close();

		outputStream.close();

	}
}
