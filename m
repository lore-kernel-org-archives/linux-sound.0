Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D2A3769E6
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 03:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787542942; cv=none; b=cSDiyETjEhbhPLYYgAZLn0P8kIVSLswOkU7aWn1Ms+Q8A0MMUJ6cHlBzgVssDd6uoObU0LwONpyrWdNSZyPGXDNw0ECbWYOF0F2N5AjHKOF9axwRbhvNwKYyP5GNlMfbxgQDWs1jSFRLpSkOzTGnQu6eVs3ojvwObsk7/lQ6iPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787542942; c=relaxed/simple;
	bh=RgZqNmuHnMuCM9fWcu+FEU7F3M/kAZgN7T8Y+r9naps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WN/Wtwf5dAfggxMyHAwlqnJz84emq8284OoNWucvlnh4l4JGV21ixKJhJ81AUfvL43WIjA/BdxCopvZceKY0xWlG+7y1vWlYpxRP+GYtfe2X41Pj/B37FRo1lFKOcWMDf+jNlYiN6LOlx5vSnCYRcV9i0p5itA9UbUTApN2B81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=carbonforge.ai; spf=pass smtp.mailfrom=carbonforge.ai; dkim=pass (2048-bit key) header.d=carbonforge.ai header.i=@carbonforge.ai header.b=Ri7Ycnxa; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=carbonforge.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carbonforge.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carbonforge.ai header.i=@carbonforge.ai header.b="Ri7Ycnxa"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc891373e0so32463565ad.2
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 20:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=carbonforge.ai; s=google; t=1787542941; x=1788147741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4vNHtcWg94izlKL+HU8qbCCKnFQ7+drsjhhdkllyHM=;
        b=Ri7YcnxaKo89VcRMdZcyP9lIx7atRKgJOy4dqlLxyyHi+3bg8MB2f55BPE8Z9+yYyp
         7lnePkb4BaZ+oCxqJ71XYiZmvwgZOM4dup5nQOkMw/SY5ywfMWrk3RPkIBRAu7CPGUlb
         7CgIK1jsvAuJxDJ8NLVIPyaKMxzqCM1geqUzshAuhThuVhHEnDnfzwLhZw0D7zIQSN4N
         qp6iaCfnEYU5ErAhAqixV9QMDyCeH9GRCSNEz0xQfFfha9nHsKabVKtKU1M9IOPDn0hu
         BeUaQ8OwCkx2w/1pvrTUVViRAuf05Pscg/67zojOqhVTlsjaDonxOH/DnIo7+UEQKUFs
         qTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787542941; x=1788147741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X4vNHtcWg94izlKL+HU8qbCCKnFQ7+drsjhhdkllyHM=;
        b=J2dzoHcQtntLucv3eqgdDTeCt4hq+GTKVoCDcAiBccM9QyXYa5hwZUvoZl0X92COYO
         81xHE1KpUrF9caqKgicEQ+OZb1qBPHs0Ah1Hj0NhwHj6AATuEi5vuVln8gmTqdxdFuZc
         sTXP8s3sFhIi1CA+/MaV6lnVn8YiGMEB6kCZv1EX3X4TaFWGiRg+dcjgIKObRl8zsKs1
         5gSx3fnnGa6U4SA+1rQz9owFImx9XkQ9AoXlkf4vTh1XWs5TKNWgP+PXA5HFw4KDGKoX
         eBY40GAy9ElquTqGG3gDH0jEEdGD2xSEkOCW0kSQAImkoa8Wxo0xyQCTvIIuOnv7VDCQ
         TOwQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro57SRYUXu9TRw2q6fle9gLQ/b7uMRFuZkazC3Pm052RtJ2cTFGpuTKLN/0K06JBZMemXC+Rv45/B4gsg==@vger.kernel.org
X-Gm-Message-State: AFuF++mpKK/h9M4AMX67voejsYfX3tfzqrQjZVVli2bBfzgPZZnhZwrI
	ic4PREjdWEEh1aUB7/Rbbygy6uFassCci2l9rH5/VTDRLv7cD+DuANrG/MOFXknqV3aL
X-Gm-Gg: AR+sD12KYmk/KLazUNeLvtAiGpKyJI9/2X+jk6kFjTqZElvg9Y9isTA0jRquTL5FoNQ
	jUnmxQTt0rJ6UvPzD1kX9tyDTqqaQyfFqgHKZzZlW45SAdVnFyuHAiI7ujDcOndWVwCrqLUo7z2
	mMzowVELpLxyjAQ0NoL+vN9RXx+t3i44DLCrnFGOom1mRS/eM4ZJrLJWrJSikeuftXhqrnWk/SE
	a0Hloa+oSl2VCePQUvBO7LWF0NXAeFAf1ZFPGRjV74TEbN3oraD6DSzeeWNFL+4ffpOBPPRd8mQ
	nJ+mDo8aDRAjz6FqauIWe3DUfNp3WMWLcn9NvItmlWFFoZ8S5HYzQ/raCygvqa8C1DDrHQ0P7qN
	UoczU6CSezVYYEk+Vxzd9rWoTnkHIDN6B3Iih/yzJuw1V5IvYBP6BuN3iJ32BtNd/KqquAUWjGG
	LVo+7sRnCOjAWGMufMnwRb91zP8cjukPS6zCyO6lJRD2LqtNyV0rvj17XQ1z1tZD/7Q7EetDSiB
	/60KLAtkm5pg2W76KtTh8y/C2u4h79EG19kaFOhi1jLZqY1TsHeZyis27QdYFtkAPDanG8QFDDb
	g+YqoNGfj3bl2XGd5LdYoya9/33euHwHpYZeAjs3c/gmZ0X+WZ+KK3BzduSi2ZZ2sQpJn53WlPh
	NbCM/GLXiyxMbecxJQK9imb65UQOzeXBlspAkRJUlF/gEsB4U
X-Received: by 2002:a17:90b:3dc5:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-395dee7e2dfmr31536855a91.2.1787542940800;
        Sun, 23 Aug 2026 20:42:20 -0700 (PDT)
Received: from jml-HP-OmniBook-X-Flip-Laptop-14-kc0xxx.tail8972ac.ts.net (45-19-222-18.lightspeed.sntcca.sbcglobal.net. [45.19.222.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90e22f8sm19080206eec.13.2026.08.23.20.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 20:42:20 -0700 (PDT)
From: jml <jml@carbonforge.ai>
To: Vijendar.Mukunda@amd.com,
	shenghao-ding@ti.com,
	broonie@kernel.org
Cc: venkataprasad.potturu@amd.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	jml <jml@carbonforge.ai>
Subject: [PATCH v2 2/3] ASoC: tas2783: also look for calibration data under the OEM GUID
Date: Sun, 23 Aug 2026 20:41:52 -0700
Message-ID: <20260824034153.50193-3-jml@carbonforge.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824034153.50193-1-jml@carbonforge.ai>
References: <20260824034153.50193-1-jml@carbonforge.ai>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tas2783_update_calibdata() looks the SmartAmpCalibrationData UEFI
variable up under a single vendor GUID. At least one OEM stores the very
same payload under a different GUID: on the HP OmniBook X Flip
14-kc0xxx the variable is named SmartAmpCalibrationData but sits under
53559579-8753-4f5c-9130-e82acfb8d893.

efi.get_variable() matches on name *and* GUID, so the lookup fails, the
driver takes the silent dev_dbg("No calibration data in UEFI") path, and
the amplifiers run on generic defaults. The factory data is present and
valid - magic 2783, spk_count 2, CRC32 verified, per-speaker records
carrying the unique_ids of the two amplifiers fitted - it is simply
never read. Audibly this shows up as distortion at higher volumes, since
the protection algorithm has no real R0/TLim values for the drivers.

Try both GUIDs before giving up.

Signed-off-by: jml <jml@carbonforge.ai>
---
 sound/soc/codecs/tas2783-sdw.c | 52 +++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index eaebb0ebb..2ca634a6e 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -46,6 +46,15 @@
 #define TAS2783_PROBE_TIMEOUT 5000
 #define TAS2783_CALI_GUID EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc, \
 				   0x09, 0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92)
+/*
+ * Some OEMs store the same SmartAmpCalibrationData payload under a different
+ * vendor GUID. Seen on the HP OmniBook X Flip 14-kc0xxx (board 8EA1): the
+ * variable name matches but the GUID does not, so the factory per-speaker
+ * calibration was silently ignored and the protection algorithm ran on
+ * defaults.
+ */
+#define TAS2783_CALI_GUID_ALT EFI_GUID(0x53559579, 0x8753, 0x4f5c, 0x91, \
+				       0x30, 0xe8, 0x2a, 0xcf, 0xb8, 0xd8, 0x93)
 
 static const u32 tas2783_cali_reg[] = {
 	TAS2783_CAL_R0,
@@ -702,8 +711,10 @@ static void tas2783_set_calib_params_to_device(struct tas2783_prv *tas_dev, u32
 
 static s32 tas2783_update_calibdata(struct tas2783_prv *tas_dev)
 {
-	efi_guid_t efi_guid = TAS2783_CALI_GUID;
-	u32 attr, i, *tmp_val;
+	static const efi_guid_t efi_guids[] = {
+		TAS2783_CALI_GUID, TAS2783_CALI_GUID_ALT };
+	efi_guid_t efi_guid;
+	u32 attr, i, g, *tmp_val;
 	unsigned long size;
 	s32 ret;
 	efi_status_t status;
@@ -717,22 +728,29 @@ static s32 tas2783_update_calibdata(struct tas2783_prv *tas_dev)
 	 * In some cases, the calibration is performed in Windows,
 	 * and data was saved in UEFI. Linux can access it.
 	 */
-	for (i = 0; i < ARRAY_SIZE(efi_names); i++) {
-		size = 0;
-		status = efi.get_variable(efi_names[i], &efi_guid, &attr,
-					  &size, NULL);
-		if (size > TAS2783_CALIB_DATA_SZ) {
-			dev_err(tas_dev->dev, "cali data too large\n");
-			break;
-		}
-
-		tas_dev->cali_data.read_sz = size;
-		if (status == EFI_BUFFER_TOO_SMALL) {
+	status = EFI_NOT_FOUND;
+	for (g = 0; g < ARRAY_SIZE(efi_guids); g++) {
+		efi_guid = efi_guids[g];
+		for (i = 0; i < ARRAY_SIZE(efi_names); i++) {
+			size = 0;
 			status = efi.get_variable(efi_names[i], &efi_guid, &attr,
-							&tas_dev->cali_data.read_sz,
-							tas_dev->cali_data.data);
-			dev_dbg(tas_dev->dev, "cali get %lu bytes result:%ld\n",
-				tas_dev->cali_data.read_sz, status);
+						  &size, NULL);
+			if (size > TAS2783_CALIB_DATA_SZ) {
+				dev_err(tas_dev->dev, "cali data too large\n");
+				status = EFI_NOT_FOUND;
+				break;
+			}
+
+			tas_dev->cali_data.read_sz = size;
+			if (status == EFI_BUFFER_TOO_SMALL) {
+				status = efi.get_variable(efi_names[i], &efi_guid, &attr,
+							  &tas_dev->cali_data.read_sz,
+							  tas_dev->cali_data.data);
+				dev_dbg(tas_dev->dev, "cali get %lu bytes result:%ld\n",
+					tas_dev->cali_data.read_sz, status);
+			}
+			if (status == EFI_SUCCESS)
+				break;
 		}
 		if (status == EFI_SUCCESS)
 			break;
-- 
2.53.0

