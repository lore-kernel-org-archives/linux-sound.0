Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808583;
	b=M2o20sJ1EInXGfc8Kha6sLsGWufRqLe8HcjqMg56iZsgUTxC8SkzWrlLHlYz7b4rAv2+
	 B0Wm2V5LGY5HX8pFcFdfxVd7mKEfkaO4HPt1eUc4ZEPegy+7HXfg/oaPTgKsvgI3xmjLQ
	 ab8blMGwKq8dlS5TkhnVbQkzTHRe4crXzIjBD/jpTOz3qroh/iT2fAiTZVu/9OkoSmYyY
	 HLkMLMAd2c48Jz6M7FO7tp1WFBb0frTSgEBF4p/jRaRREx8kWHaoiHF5SPfRkhS2dcTPB
	 /vxFe1QUwBGI4wRJzPITG/9je2Ele5/U6g736NI3zttZ8RwWxGJHcYnsUzHHTKpuUjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=I/5XjpRkuugiUvajtiQst7cmnkAsliJPRUsIIgPB5lw=;
	b=3J/7Hdb5tIabP0wxyTCvADTSyIk7xlaXLnyAv7BVBIZoFi1WzoXTzzYtbNDtp8J+mXrL
	 CSI4arAHCoWUdAwk/ISWAu7App77jutiWwHos2nJGVJ/9TUetWBvVt3DIKeUQpvflebko
	 hQ9nDL3Emgb5NVVFojDhOza7Z57CdgUK8bBPbqFbZdtye/4+nPRvl/Tg58tN/cuM6JCHq
	 FXArQeMFRfvkckw74WX0+IPqmnFufEMBkY+FCad5TsYJeB7/woLRqvQYPaflzwWE4Jhsc
	 pkDrIxhddSkRAW4AlL7OjnqVQqwlcNhzNO0LwR7RWqKCqrwVJSDQ1BqCtdfK+Ly8ojQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IvOKyLc9;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83814606D80A
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 16:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83814606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IvOKyLc9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso5562175e9.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 08:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793808582; x=1794413382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/5XjpRkuugiUvajtiQst7cmnkAsliJPRUsIIgPB5lw=;
        b=IvOKyLc9phwAhdOEIy05IyB6L6/v0m3nxWhLFRvDrtoSK2rwOyfqnPm05PcW9c8RSg
         XBI1cdVuWzfzP51IHXkG+el9tL1PfjXwpyQ6/y98sSWSBAJ2uhGrawUGukJBw4YMgXAz
         Dn1AwNBZJ/h+csVtNJIOko78YoGQmndJHFlHkuO1tePbLs4744IzYhn+eVU01gVk4+2+
         4eVokbXy35YUmykftBYZxE4WSqy2MKO/9JY9pUMwiMOeyelKKJFaeVFp726MsnaKxTqy
         tUKGpvUW42xzTDEFGZELnk1lpSV5PTM1ZAOKshHSiAe9aDBBS7r1SUcGiwyuU7LF29Mp
         axQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808582; x=1794413382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/5XjpRkuugiUvajtiQst7cmnkAsliJPRUsIIgPB5lw=;
        b=RQxXghxteTDXU+0D1mYnJ4XR0EGZWnpM+6GoyGsJQreeROR/XUmQClCG4/vsP/kUVn
         4mwK08+7w8sFQVf7RFch4I6u8p3FWKB9TIAvKG7L2QQhG9cFQGI98jnahVVj4rGrTinl
         bbZmFscYSLeDM6UBSfdGJc5GhbdJqjCBCDjbR06k4ee/a3pnC0nGPvJgUDQ62MR+1zj1
         CVnyomApSBpoz7ZW9OZVlILWrQApEVDNpoGwUlr/dqFOhuk0dueVlyk3GZCs7r5IEJ5d
         1RXDgUHY5Q1XIbp2MqC0HZnYrlOtlkaaIi9+MrQWA0Z4tEMrTnX/JYtMowOZpxc4lGHw
         Ning==
X-Forwarded-Encrypted: i=1; AKwUvBzAuM7+l7keAHOJnJ//ANED2Zh0p0Hj5P9bk02Q8/b8kJPCsyRPGpkrOGf73/eBKSGVfWPVuuu6qTqsNA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8FithZOGdrsHlZ6RgwYHA/Wvse3O2t4WuNfoPVEG6tQKtjzSwK
	NqiC69VK3RMy07lVLjmOvljoHUYO+am2HMgNEUaBFI2mAhUzgkxjwmqE0JIsRMa7ZNg=
X-Gm-Gg: AYBFou3hnoETo/mMq29m0yVgvvlhknVs0kuqrgPGpts8g3MKg47kJ4GyQ6Avl8veQfI
	fWnlS9lLAnQW+xaeNffUdQ78X3+SOegFKn6us6z/NDO6wK38rs55xclInaTy1U5Do6QPtf7Fy/B
	ulKr0N7A21mAzf02MSw8pE3tpS3sco2qYaFvhb7/6JFVNPImIdftG3HI60AKNHOED0xDPY0yvLq
	HDAr4Dz4iSeF+bY1F/LrpO1qZ5Ja8YjVenwDr1TnErCy7/1M3n3B9fcpECmsAHc/IaAl3Eqjk/M
	yEq7mkSpC0OJ4KQRuNV3rDZGMYc+41C9ku9ebAT//05cGsnxfEqVmgtXRXKkf/2kVaKmW20ba/4
	IILkfwS06K9sfMAc89soyyCruNogjZZf+p7ZGidnrdiCJPryT6PhG+LM6kUQCb8mMnu4ggSswzL
	5xIA9ainaZ6xL/xoxb3sXyJk6K7928uJ0N5borbPr4exIHJHp6o5uB/QAxfHSaNCYWVuC6DjU1k
	V7iDkljadDrfaLVE47TWcTfipvVjhl43d4gjqZW7uxAHZZ3yLqydMh1z9Zj/nGHVkshP57OESRU
	rBaWBu+DCQIZV24D7ed+m+vz6uN7P7yotrxi+vXgcHQMeA==
X-Received: by 2002:a05:600c:8b01:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4ac1737c682mr380593515e9.8.1793808581916;
        Wed, 04 Nov 2026 08:09:41 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:458e:d526:4eee:2f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm85089815e9.3.2026.11.04.08.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:09:41 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 04 Nov 2026 16:09:31 +0000
Subject: [PATCH v2 2/2] mfd: Use named initializers for acpi_device_id
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-acpi-mfd-v2-2-64b9dee3baaf@thegoodpenguin.co.uk>
References: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
In-Reply-To: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Zha Qipeng <qipeng.zha@intel.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-crypto@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793808577; l=6931;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=Vj9aA4kkyLkATCkr6co8ZKsAFirU7o8I3IUzmoP+oTU=;
 b=/CnulND5qAnaKTESsxoCTPHT8xa5xKKx/FKC3JkDQ45uhPQYBjiw6v21n1uS5CQ2D0px0j8Dx
 AjLvUGtJn+2AYiELUoqAmHrCh/nqs72pLWkwd/sLS9OEwdhIQGQ6gBT
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mfd/axp20x-i2c.c              | 2 +-
 drivers/mfd/cs42l43-i2c.c             | 8 ++++----
 drivers/mfd/intel_pmc_bxt.c           | 2 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c | 4 ++--
 drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
 drivers/mfd/intel_soc_pmic_crc.c      | 4 ++--
 drivers/mfd/intel_soc_pmic_mrfld.c    | 4 ++--
 drivers/mfd/kempld-core.c             | 6 +++---
 drivers/mfd/loongson-se.c             | 2 +-
 drivers/mfd/upboard-fpga.c            | 6 +++---
 11 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 5c93136f977e..c5d0d35c7fb0 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -97,7 +97,7 @@ static const struct acpi_device_id axp20x_i2c_acpi_match[] = {
 		.id = "INT33F4",
 		.driver_data = AXP288_ID,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, axp20x_i2c_acpi_match);
 #endif
diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index 2f1862199618..89dca295cc57 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -73,10 +73,10 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);
 
 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id cs42l43_acpi_match[] = {
-	{ "CSC4243", CS42L43_DEVID_VAL },
-	{ "CSC2A3B", CS42L43B_DEVID_VAL },
-	{ "CSC4244", CS42L43B_DEVID_VAL },
-	{}
+	{ .id = "CSC4243", .driver_data = CS42L43_DEVID_VAL },
+	{ .id = "CSC2A3B", .driver_data = CS42L43B_DEVID_VAL },
+	{ .id = "CSC4244", .driver_data = CS42L43B_DEVID_VAL },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
 #endif
diff --git a/drivers/mfd/intel_pmc_bxt.c b/drivers/mfd/intel_pmc_bxt.c
index e405d7513ca1..6a9ad1f135c7 100644
--- a/drivers/mfd/intel_pmc_bxt.c
+++ b/drivers/mfd/intel_pmc_bxt.c
@@ -414,7 +414,7 @@ static int intel_pmc_create_devices(struct intel_pmc_dev *pmc)
 }
 
 static const struct acpi_device_id intel_pmc_acpi_ids[] = {
-	{ "INT34D2" },
+	{ .id = "INT34D2" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_pmc_acpi_ids);
diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
index 117517c171b5..08fedf3d3fee 100644
--- a/drivers/mfd/intel_soc_pmic_bxtwc.c
+++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
@@ -606,7 +606,7 @@ static int bxtwc_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(bxtwc_pm_ops, bxtwc_suspend, bxtwc_resume);
 
 static const struct acpi_device_id bxtwc_acpi_ids[] = {
-	{ "INT34D3", },
+	{ .id = "INT34D3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bxtwc_acpi_ids);
diff --git a/drivers/mfd/intel_soc_pmic_chtdc_ti.c b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
index 6daf33e07ea0..49f4138961c8 100644
--- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
+++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
@@ -162,8 +162,8 @@ static int chtdc_ti_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(chtdc_ti_pm_ops, chtdc_ti_suspend, chtdc_ti_resume);
 
 static const struct acpi_device_id chtdc_ti_acpi_ids[] = {
-	{ "INT33F5" },
-	{ },
+	{ .id = "INT33F5" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, chtdc_ti_acpi_ids);
 
diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
index aa71a7d83fcd..413d2fd4f86a 100644
--- a/drivers/mfd/intel_soc_pmic_chtwc.c
+++ b/drivers/mfd/intel_soc_pmic_chtwc.c
@@ -261,7 +261,7 @@ static const struct i2c_device_id cht_wc_i2c_id[] = {
 };
 
 static const struct acpi_device_id cht_wc_acpi_ids[] = {
-	{ "INT34D3", },
+	{ .id = "INT34D3" },
 	{ }
 };
 
diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 627a89334908..d39f73ae6773 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -252,8 +252,8 @@ static int crystal_cove_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(crystal_cove_pm_ops, crystal_cove_suspend, crystal_cove_resume);
 
 static const struct acpi_device_id crystal_cove_acpi_match[] = {
-	{ "INT33FD" },
-	{ },
+	{ .id = "INT33FD" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, crystal_cove_acpi_match);
 
diff --git a/drivers/mfd/intel_soc_pmic_mrfld.c b/drivers/mfd/intel_soc_pmic_mrfld.c
index 77121775c1a3..531d8b8be44d 100644
--- a/drivers/mfd/intel_soc_pmic_mrfld.c
+++ b/drivers/mfd/intel_soc_pmic_mrfld.c
@@ -139,8 +139,8 @@ static int bcove_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id bcove_acpi_ids[] = {
-	{ "INTC100E" },
-	{}
+	{ .id = "INTC100E" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bcove_acpi_ids);
 
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 47062f876e5d..399f1c97320c 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -470,9 +470,9 @@ static void kempld_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id kempld_acpi_table[] = {
-	{ "KEM0000", (kernel_ulong_t)&kempld_platform_data_generic },
-	{ "KEM0001", (kernel_ulong_t)&kempld_platform_data_generic },
-	{}
+	{ .id = "KEM0000", .driver_data = (kernel_ulong_t)&kempld_platform_data_generic },
+	{ .id = "KEM0001", .driver_data = (kernel_ulong_t)&kempld_platform_data_generic },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, kempld_acpi_table);
 
diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
index 3902ba377d69..49a95b8e4ca3 100644
--- a/drivers/mfd/loongson-se.c
+++ b/drivers/mfd/loongson-se.c
@@ -233,7 +233,7 @@ static int loongson_se_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id loongson_se_acpi_match[] = {
-	{ "LOON0011", 0 },
+	{ .id = "LOON0011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_se_acpi_match);
diff --git a/drivers/mfd/upboard-fpga.c b/drivers/mfd/upboard-fpga.c
index 9a9599dcb0a1..37c3c50aa6e4 100644
--- a/drivers/mfd/upboard-fpga.c
+++ b/drivers/mfd/upboard-fpga.c
@@ -300,9 +300,9 @@ static int upboard_fpga_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id upboard_fpga_acpi_match[] = {
-	{ "AANT0F01", (kernel_ulong_t)&upboard_up2_fpga_data },
-	{ "AANT0F04", (kernel_ulong_t)&upboard_up_fpga_data },
-	{}
+	{ .id = "AANT0F01", .driver_data = (kernel_ulong_t)&upboard_up2_fpga_data },
+	{ .id = "AANT0F04", .driver_data = (kernel_ulong_t)&upboard_up_fpga_data },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, upboard_fpga_acpi_match);
 

-- 
2.53.0

