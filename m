Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347793;
	b=LytcG07R0OIBlQQD8Z3ng0X/6kEYZzNS0etQxRYUU8WiPkZ+m5jU8Bmw9eUcZA3+sTKz
	 Y2SOTdz1WEylmo19+x1MklDqmzza4J2474sZW6bm1Wx945FHetKRNzP/89dW6zQ0vwOmx
	 qEUPdzGW2JzmmH5TjkYPEApsXDyInHOvl+Fi0+ZH3XRnTg92aEyVG0WheHXFW0UF8UtxB
	 +5JiALaHYqkb9SlNjA//6gLa83MQCFB+HWzw/KMixlodE4Tnz1a+MjwTPoeqyi1rQO/m+
	 5bGK0QW9/LeYgetr0OqFlGFqjfEioBaEN80+vM4BcDb8Ux3QwX8pi8RCzaVSx/mTzQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=NO6xfwXJCf7saDCbc00EU4syl5ydeWwA/x34A0BsQ0M=;
	b=j+CzFKEFTRL8IFqf5lubxdM32EfHvYfe22pFtIRwsgN8xixo0xJSM1yvW26112XIjcm8
	 XE2CMzxSg7rpvvYGp7PxL55ZcTfbQ3sZSZRtQXK8UZ/Peo8WV64bOVmvf7tc9OyM1x3gH
	 +nUhVeQxrFsbxhxipx/cRPxY5HRIe7T318tdlwSihvC0YW0PThGM0Xnhu++dOSTh6M732
	 AkmJ8n40fsXXjzLoXOfq7oYw51JwIT1yctfApHRyE6jNIInMCZVZ+xPk6M55tpyiP8rWY
	 KbCuI0Ic9ldo9pQ6AkVNrK/wTLfkW/8CmRZoNpnB9l4TF7XC+7PH0LqIlCynCVrTmWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k+JG0y2A;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF782606A9A9
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 21:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF782606A9A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k+JG0y2A
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so27853565e9.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 13:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347791; x=1794952591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NO6xfwXJCf7saDCbc00EU4syl5ydeWwA/x34A0BsQ0M=;
        b=k+JG0y2AurrMVGn4qnq2kToy9xNDIEenSjKJLz0mR/4LwQb5EoKq6OATFtgm4PEekF
         gMaV1z6Zmc6V2btyEWjfHpIWzbjzFg56aCUaoLP1NqjBYHrstlhWZx6cvQrfDhMF3ppH
         IR9IANn7JIekKtSB3wy7OrEoIOP4sCguNY3cAnrentShPZPlwPcZZ3KlgBa9gwhtRZqr
         L51zrh9eL8GJNc5J8FOR1qlX96dxJgJD0bRTdp6uRW3lQiTbwvv+B4gSzvkNstyxWXTR
         yjMg+Fa7ndJYhTpwLFVaBjJu9VHE//NZhR8pzWYqW91ZwQy0Ri5qq9p0FGN4UeLoC4cF
         ng4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347791; x=1794952591;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NO6xfwXJCf7saDCbc00EU4syl5ydeWwA/x34A0BsQ0M=;
        b=xVBuTQFApEUmviDH31y+KnZxtc99R1hqs6QWt6mJ/K7pz8QP/gLwB2pdbnr34R0qie
         qmyzw6fQz3mdV9+Z5851U7R48FaW4p8e4S3wAnfeRhzJsYWAHmD8TKdfK8yHZwpZcSxY
         zKPrMfj1Uxd6Yq9p6I/bWyyT9QGm48QRkIZRSJzaH8350uNc3wRTJiGW/ov85WxLQ3U7
         1yYcQ3pxs+VogxoXYdc5x0q2Bk4HfnIfQDg3h0+EpMPI2ug5fkbwG+Gaq2IjNnpzyaJb
         GNX/XaVVqgaRQXq50gju9tGWq3t/p9p5pY3dE8yIUklj2J3gc2+/La8ygLqAWIJCQ5Xz
         xN9Q==
X-Forwarded-Encrypted: i=1; AL+hErEnMiEqCCLmhHkJXLbGpQcf/tRI9A4Y3OTsJXvphPyWTu5Q1/vSTCaGhrdNXVo2gyGPewyjAUrccJQ8Og==@vger.kernel.org
X-Gm-Message-State: APuU4Z+WsBpELowny6RgBiJb5TPo2dZT4NLn9AQgWRGTQsPiZGXx2ZES
	YNWbwwqLpqDw5sJjdPeckPKmxoDsP+Wc7tBoLimcYCYBKyGPlDiA0YgybshIE9nhCfV7cXoN4eo
	omtq/18s=
X-Gm-Gg: AYBFou33U/Er1jLoO5zouuXuritJcitF5/sU6sJZAl3W2pV4c1u4oRuRyfN+KhEY3uW
	Ao9nexg3+h6YE6E2eWbWkE2bJ+LE0zo6DHtfE+vv/8D/9arlcdmLW2WmCdDWLuxjWf6aktsb9OE
	F9zB40BduyepLx/ZdjK9+dJpSFE0xczhGzJIreSoYHyvaIk4gCmj4lpmpWslpE9+beOuWSH46e7
	eCRPGb6fgozqsllO5DzVaMEuJyUTS3DkXa4aa7gh2nDF9S7STJLMC85UfbUyucZoLvPvfFH+BZr
	PkCG+l8Faqq561HT4FOqkma/OhNlijVcPBLDfVv953RJcUvYBUnLsM6PWfHzPxikIRJT4El/PAU
	CfByZZ+Amy41nHag/OTxXdD8bdKxGalinFbG7Umkjxb8V94sCtOevX0juaNJC8ilnj4BKizmWyp
	cHhQqdFqJoKVbILVPFe9v4sgW7ygqdymI9hSMlFU5D9dlVyKgZzkSdACgGhgVQIN34BfOrAdz57
	fJJhpTjZnrif23JB94CJsgVmWRVoNMh2IAqBua+MATRQrKNtWFUlCD79Ti3d//AQePYkixjIsub
	8MvmnSVE7KI2P6+J0OSd1Y1JkPbhC39pSA==
X-Received: by 2002:a05:600c:4f84:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4ba0931d9eamr7085555e9.1.1794347791129;
        Tue, 10 Nov 2026 13:56:31 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0204ee67sm92179165e9.13.2026.11.10.13.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:29 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 16/20] mfd: Unify style of acpi_device_id arrays
Date: Tue, 10 Nov 2026 22:54:41 +0100
Message-ID:  <7e0cc26f7a3a662024c5383d68611353881f5f6e.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4372; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=dcnySOz5sLZB2IWc3ElMFGLXGXlvG+aJt0YimLpkApE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85LKtaDtSVT1IPnpbcyOBmlZuTxtOseh+i5G+ ifEdwREwu2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSygAKCRCPgPtYfRL+ Tn67CACH7JMlEnwG/SIKz8ZvFT6CIhXib6vgc9DtOxq4/nsrYLDvz3xLbXTNO4iQHXGzPuIPGw1 n09AjJCwlxrcLk4byGvF8+2sZ8e+94ojgcRjI+g4GSTDo/aLLDmre6K6bEpPhbURRXKq4GgPOZT UL+JzLkBqGYh16ymfeJ8wbxcjaXxQeW1LPAnE7YmdXpHSF6QSoDTCfs9h6UR28eSY5n0u41urMm 5ROSTd4EW7XQxfAo7CC0epc4ar0hUZE9X2kYwgQZ5/1HkqkcHBcmRiBl0uf/0GT5rIcCKCMl/5R Y9lxjj8orOxo/slp9RlVKF7QNYobVmlOXY8pRgaKV6T4x4ri
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various acpi_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c              | 2 +-
 drivers/mfd/cs42l43-i2c.c             | 2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
 drivers/mfd/intel_soc_pmic_crc.c      | 2 +-
 drivers/mfd/intel_soc_pmic_mrfld.c    | 2 +-
 drivers/mfd/kempld-core.c             | 2 +-
 drivers/mfd/upboard-fpga.c            | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 2f595e2b883c..57695e46e00e 100644
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
index faf4fc6b3d73..89dca295cc57 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -76,7 +76,7 @@ static const struct acpi_device_id cs42l43_acpi_match[] = {
 	{ .id = "CSC4243", .driver_data = CS42L43_DEVID_VAL },
 	{ .id = "CSC2A3B", .driver_data = CS42L43B_DEVID_VAL },
 	{ .id = "CSC4244", .driver_data = CS42L43B_DEVID_VAL },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
 #endif
diff --git a/drivers/mfd/intel_soc_pmic_chtdc_ti.c b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
index ff6223d6f54b..49f4138961c8 100644
--- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
+++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
@@ -163,7 +163,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(chtdc_ti_pm_ops, chtdc_ti_suspend, chtdc_ti_resu
 
 static const struct acpi_device_id chtdc_ti_acpi_ids[] = {
 	{ .id = "INT33F5" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, chtdc_ti_acpi_ids);
 
diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index c1c02700ef08..95588caa2e77 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -253,7 +253,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(crystal_cove_pm_ops, crystal_cove_suspend, cryst
 
 static const struct acpi_device_id crystal_cove_acpi_match[] = {
 	{ .id = "INT33FD" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, crystal_cove_acpi_match);
 
diff --git a/drivers/mfd/intel_soc_pmic_mrfld.c b/drivers/mfd/intel_soc_pmic_mrfld.c
index 9d7e1881d693..531d8b8be44d 100644
--- a/drivers/mfd/intel_soc_pmic_mrfld.c
+++ b/drivers/mfd/intel_soc_pmic_mrfld.c
@@ -140,7 +140,7 @@ static int bcove_probe(struct platform_device *pdev)
 
 static const struct acpi_device_id bcove_acpi_ids[] = {
 	{ .id = "INTC100E" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bcove_acpi_ids);
 
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 71b226a57204..ceef894efcca 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -440,7 +440,7 @@ static void kempld_remove(struct platform_device *pdev)
 static const struct acpi_device_id kempld_acpi_table[] = {
 	{ .id = "KEM0000" },
 	{ .id = "KEM0001" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, kempld_acpi_table);
 
diff --git a/drivers/mfd/upboard-fpga.c b/drivers/mfd/upboard-fpga.c
index 6674f4a1d2fe..37c3c50aa6e4 100644
--- a/drivers/mfd/upboard-fpga.c
+++ b/drivers/mfd/upboard-fpga.c
@@ -302,7 +302,7 @@ static int upboard_fpga_probe(struct platform_device *pdev)
 static const struct acpi_device_id upboard_fpga_acpi_match[] = {
 	{ .id = "AANT0F01", .driver_data = (kernel_ulong_t)&upboard_up2_fpga_data },
 	{ .id = "AANT0F04", .driver_data = (kernel_ulong_t)&upboard_up_fpga_data },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, upboard_fpga_acpi_match);
 
-- 
2.56.0.rc1

