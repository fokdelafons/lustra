function normalizeDocumentTypeForDisplay(value) {
    return String(value || "")
        .trim()
        .replace(/\./g, "")
        .replace(/[_-]+/g, " ")
        .replace(/\s+/g, " ")
        .toUpperCase();
}

function normalizePrintNumberForDisplay(value) {
    return String(value || "")
        .trim()
        .replace(/[_-]+/g, " ")
        .replace(/\s+/g, " ");
}

function formatFromCompositeId(rawId) {
    const raw = String(rawId || "").trim();
    if (!raw) return "";

    const parts = raw.split(/[_\s]+/).filter(Boolean);

    // Example: 119_HR_8250 -> HR 8250
    if (parts.length > 1 && /^\d+$/.test(parts[0])) {
        parts.shift();
    }

    return parts.join(" ").replace(/\s+/g, " ").trim();
}

function formatLegislativeId(doc = {}) {
    const documentType = doc.documentType;
    const printNumber = doc.printNumber;

    if (documentType && printNumber) {
        return `${normalizeDocumentTypeForDisplay(documentType)} ${normalizePrintNumberForDisplay(printNumber)}`
            .replace(/\s+/g, " ")
            .trim();
    }

    return formatFromCompositeId(doc.id);
}

module.exports = {
    formatLegislativeId,
};