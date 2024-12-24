Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2F918FDCE;
	Tue, 24 Dec 2024 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735030621; cv=none; b=C8UAzBwXzFNzUd2B33Hg5cacG/MxupVTPGokhzI1NJjOPk420+q1yaeVKkASorEBsoLOwBE5kPqfxrCoGECSuHau5MW8Y1nuVDSkUVs+9ToQOOuNM9wArZh5EgcZ44Ejeh+Hqbnl/89CQaYSqVWGxTs8LTv45nOJFjI4cXFAY1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735030621; c=relaxed/simple;
	bh=GnYpk40hgLXKcuTRJGovRAfENYFBr24CTB1Z0zr6gDM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JwH8ho2P+zMmGf/Fwbp7cHm3tBWTDpVEOojNBUj4CsZhuHiBbUj3LoGa6R5SemFPQTZ33KwjvskFtoYVrInBij+sFNiG690zQ6U4CXu7u+l/nNNyHT+N1HaFqttbMm9em/aR1JnFnq6zWUanC3nV44MhBUuoEKpm2M7OKxPOd+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Q5mR/V9D; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Q5mR/V9D"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BO8uYMo032732;
	Tue, 24 Dec 2024 02:56:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735030594;
	bh=/cHwIvVbqr1mNe38TzIGhYqbk9+IngKbqZapUa57FWQ=;
	h=From:To:CC:Subject:Date;
	b=Q5mR/V9DIsZZ8hZaO21gijXBp0Kl6iZ/+Cans/zX5wipLDt/0YsVJ2Z+9BbpOmHOr
	 AJv0xhUMtZ39cteg+1+mZgSoK3IXVsSg0IO1pkxnlrVeYFl5N5AnTBeFI642/8Jicu
	 jcI+SpTrPNm0EPgiWDh8i/drHiM9z2ZVR5PRzWUI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BO8uY82005183
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Dec 2024 02:56:34 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 24
 Dec 2024 02:56:34 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 24 Dec 2024 02:56:34 -0600
Received: from lelvsmtp6.itg.ti.com ([10.250.165.138])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BO8uQZw099580;
	Tue, 24 Dec 2024 02:56:27 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <shenghao-ding@ti.com>,
        <navada@ti.com>, <13916275206@139.com>, <v-hampiholi@ti.com>,
        <v-po@ti.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <baojun.xu@ti.com>,
        <broonie@kernel.org>, <antheas.dk@gmail.com>,
        <stuart.a.hayhurst@gmail.com>
Subject: [PATCH v7] ALSA: hda/tas2781: Add speaker id check for ASUS projects
Date: Tue, 24 Dec 2024 16:56:01 +0800
Message-ID: <20241224085601.426-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add speaker id check by gpio in ACPI for ASUS projects.
In other vendors, speaker id was checked by BIOS, and was applied in
last bit of subsys id, so we can load corresponding firmware binary file
for its speaker by subsys id.
But in ASUS project, the firmware binary name will be appended an extra
number to tell the speakers from different vendors. And this single digit
come from gpio level of speaker id in BIOS.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
v7:
 - Do not return with error if subsys id was not found,
   it will cause error on TAS2563 projects (have no subsys id).
v6:
 - Remove define for AUSU in tas2781.h.
 - Add include linux/pci_ids.h for use public ASUS id define.
 - Add subid for ASUS id save and check.
 - Change comments to /* */ from //.
 - Change next line indented to (.
 - Change ASUS check from string compare to u16 compare.
v5:
 - Change length in strncmp(), use strlen().
v4:
 - Change strncasecmp() to strncmp().
 - Add error debug message print for "add driver gpio".
 - Put error information (PTR_ERR) to ret for get gpio.
 - Change %01d to %d in snprintf().
v3:
 - Change strstr() to strncasecmp() for compare subsystem id.
 - Remove result check after devm_acpi_dev_add_driver_gpios().
 - Remove spk_id > 1 check, as result of gpiod_get_value(),
   must be 0 or 1, or negative if error happend.
 - Change scnprintf() to snprintf(), as didn't care the length.
 - Remove changes which not relative current patch.
v2:
 - Change ASUS id from 0x10430000 to "1043".
 - Move gpio setting to tas2781_read_acpi() from probe.
 - Remove interrupt gpio in acpi_gpio_mapping.
 - Add sub and physdev in tas2781_read_acpi() for subsys id read.
 - Add debug log for get acpi resource failed.
 - Return error if get resource or subsys id failed.
 - Return error if get gpio fail for speaker id with ASUS projects.
 - Change fixed buffer lengh to sizeof().
 - Change bits calculator to lower_16_bits().
 - Remove unnecessary empty line in tas2781_hda_i2c_probe().
---
 sound/pci/hda/tas2781_hda_i2c.c | 39 +++++++++++++++++----------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 0af015806aba..f2576c53ad6e 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -140,28 +140,29 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 		dev_err(p->dev, "Failed to get ACPI resource.\n");
 		goto err;
 	}
+	p->speaker_id = NULL;
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
 	if (IS_ERR(sub)) {
-		dev_err(p->dev, "Failed to get SUBSYS ID.\n");
-		ret = PTR_ERR(sub);
-		goto err;
-	}
-	/* Speaker id was needed for ASUS projects. */
-	ret = kstrtou32(sub, 16, &subid);
-	if (!ret && upper_16_bits(subid) == PCI_VENDOR_ID_ASUSTEK) {
-		ret = devm_acpi_dev_add_driver_gpios(p->dev,
-			tas2781_speaker_id_gpios);
-		if (ret < 0)
-			dev_err(p->dev, "Failed to add driver gpio %d.\n",
-				ret);
-		p->speaker_id = devm_gpiod_get(p->dev, "speakerid", GPIOD_IN);
-		if (IS_ERR(p->speaker_id)) {
-			dev_err(p->dev, "Failed to get Speaker id.\n");
-			ret = PTR_ERR(p->speaker_id);
-			goto err;
-		}
+		/* Project TAS2563 have no subsys id. */
+		dev_info(p->dev, "Failed %d to get SUBSYS ID.\n",
+			 PTR_ERR(sub));
 	} else {
-		p->speaker_id = NULL;
+		/* Speaker id was needed for ASUS projects. */
+		ret = kstrtou32(sub, 16, &subid);
+		if (!ret && upper_16_bits(subid) == PCI_VENDOR_ID_ASUSTEK) {
+			ret = devm_acpi_dev_add_driver_gpios(p->dev,
+				tas2781_speaker_id_gpios);
+			if (ret < 0)
+				dev_err(p->dev, "Failed to add gpio %d.\n",
+					ret);
+			p->speaker_id = devm_gpiod_get(p->dev, "speakerid",
+						       GPIOD_IN);
+			if (IS_ERR(p->speaker_id)) {
+				dev_err(p->dev, "Failed to get Speaker id.\n");
+				ret = PTR_ERR(p->speaker_id);
+				goto err;
+			}
+		}
 	}
 
 	acpi_dev_free_resource_list(&resources);
-- 
2.43.0

