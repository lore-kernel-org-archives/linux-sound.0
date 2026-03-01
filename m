Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43632C21FE
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 21:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772400848; cv=none; b=pnkUzdl75G0Ne1Q523JFrvzyotkqsJ35lwLFMo/xZqoMUu3hxv8455kHh9/YZ6d32vJg+9ZtG9fWxHbuFaHuEZJR2XFiio2CK/jwgz6Yey4of+TqQvDQsy+7ggAKPb5INw6PUypnv/k3MULH2goaIWHkxFXstkKnOLqAzNNSuVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772400848; c=relaxed/simple;
	bh=B8FnKyLJmR2ho+Z9gxg55SrZBzenyK2GQpiJ5FVZin4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXcD0QKRRcXtg+xQC/8oi+41nhJTajhm7NDc9wOBHYOplMUy78cxoj96BCsaOrYCX9SuGVw99akOEBZjj6GgnzRxZ3QhEO01mHp7YaXgOZ2xErqarPxfs5P3Xk0X/JvAC0Bs04CoSwwlxiW0jZSdg/tZQbrZfFxmX9kJTGt9Xh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfzljBbn; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfzljBbn"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65fa79f5c98so6365295a12.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 13:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772400845; x=1773005645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEUARIzmZmUzYn3fC8mAujTGgUYKtVNaTf4bY9B92SY=;
        b=YfzljBbnl2N3PO4Sa9qwnQh2j+kz1iaSg1kZkqsQjkluXvjKJenzyGYOfI5TFqXdvH
         egM8d5F45ShNZMOReY37LmpZOkF6r3yNxd31aMg238lZG/NhXRCHZAolqBk8LbCexrFE
         1aTcDlJL1EiuNdEEtRHAuhVlbf+rkAI7K/dMYqDztdfolmcXI2LeNq7h6vNYyp0OlOGi
         s6fumKdDAsWxlkH3tVMD7gHBTyX+QYUQBkUs2Fy6O3zdnhlp42EqpXkm7NrVsSdn/7Cf
         E3lT9WB1pNZn6bdszclbOBO1rO3QTdmjpy7nYg9xlJj8Doy7MijOmkrlhHJ3tCHaJeld
         GS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772400845; x=1773005645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mEUARIzmZmUzYn3fC8mAujTGgUYKtVNaTf4bY9B92SY=;
        b=fRedest9pChzxmW+ZKb2/fUBUR5u9K8RV8DwQejZZTtYswcFCnZ7qNcuD4tWFTl17t
         fT0+NMthh4hpOOj1xs7IVG6VG92YSGk1Q1E7xBjAtp13epAgMn+uN3xK0fefi9Lr75Bu
         9st64VAOFKSH/qVQBe5sOe4m0W27YLMWs0IMzrSH+mLvjoLZKVFbdYIVEJJaz/0Xsnz9
         FcLBAcLDqLFM7p3Om0DHdTDc5/Un0p5ggMnKkepjLDiOoKeFwlBztHD14lGJlIsP7M78
         5k0fc+x58nRPFLEdEqPUlqDQbK5INUn4Z0Y2zx4KTYT9qxV/JVKSt9aPB1vq3NIzya9t
         UtNg==
X-Gm-Message-State: AOJu0YxMd1gmnaKha4jpfLMq2EDcL2YOwAkTAS1ZVKzv97WTLpTPgHuM
	8ZHiIqF4L861XcLaBuzD5f724lL5g5wUjMETHuoukOl50yI3xas4h4xc
X-Gm-Gg: ATEYQzw/3t3CI8Uam/upH/LVdWJhQfK0wlG94yGb1D+KUiUcgcNUU/JeZNPtCm2DcIK
	Y4elOhoHgl8fOnwL9r1XtRmjIgzdDdDuyXFTgipw/edcmfMafdKHhw5SuSOuUYoNdVbHQY0++9K
	tllOPzEaXOCBaK834lfY9K0sZ63gXmxwzelolyMfyb5GQIzCjt33xHlMR1HWktQ+GNxe6ep0LPb
	wMZn/BZoaEBNitFBWR8j21j3vcNdUquaWSBhlKayKlrD6lhJ7g5aza77HJBZ3hsmpq9zs0UhQDL
	zG8XpShSg75a5QUcu4vj7zKFkmIaVoO4ToQA1DnRpGL5gNvlzUEpralWiIEsKqPCz2dMv98wxeX
	UFMAKv66DsjbBNsbRdNZmKMM2hJJSC7doYUhA605yA982S8/iCHjU72latVdeNsv6soW24EBApp
	IcnFV4ADXTNvTH8KQl9A==
X-Received: by 2002:a05:6402:d0e:b0:65c:76a6:4bdc with SMTP id 4fb4d7f45d1cf-65fe2d48286mr5371232a12.9.1772400844623;
        Sun, 01 Mar 2026 13:34:04 -0800 (PST)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6cfd9sm2934793a12.22.2026.03.01.13.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:34:04 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Sun, 01 Mar 2026 23:33:45 +0200
Subject: [PATCH v2 2/3] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Book
 entries
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-asoc-yogabook-v2-v2-2-adcc7ed40985@gmail.com>
References: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
In-Reply-To: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772400841; l=3008;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=B8FnKyLJmR2ho+Z9gxg55SrZBzenyK2GQpiJ5FVZin4=;
 b=LsCIpY6MH6aZ+5U3s7JgLAGUxGBxgC3acKtnHrnItgo6aWnTF1CTkNSqfXk4sZPYsecjAUuE6
 4aj3WPCWzLKDT5CgTbo2t6NcHMRBS19RZAB5680LxGK3SkRKT7ldkic
X-Developer-Key: i=jekhor@gmail.com; a=ed25519;
 pk=C/csaZJs7UBNDgeJcUAmPu4ntqNeaZ3BKfBQiH8tuGc=

Lenovo Yoga Book YB1-X91 device uses a Cherry Trail SoC and has a valid
ACPI DSDT entry for the RT5677 codec. This entry has some non-standard
resource definitions, such as jack detection chip information, and
hardware has some additional GPIO controls so use 'cht-yogabook'
for the driver name instead of some default (like 'cht-bsw-rt5677').

Lenovo Yoga Book YB1-X90 device (Android version of the tablet) has the
same hardware configuration but lacks a valid ACPI DSDT entry for the
codec, so add DMI match data for it and use the same machine data as for
YB1-X91.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index 57097c1d011e..8673ade66e9d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -17,6 +17,14 @@ static struct snd_soc_acpi_mach cht_surface_mach = {
 	.sof_tplg_filename = "sof-cht-rt5645.tplg",
 };
 
+static struct snd_soc_acpi_mach cht_yogabook_mach = {
+	.id = "10EC5677",
+	.drv_name = "cht-yogabook",
+	.fw_filename = "intel/fw_sst_22a8.bin",
+	.board = "cht-yogabook",
+	.sof_tplg_filename = "sof-cht-rt5677.tplg",
+};
+
 static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
 	.id = "10WM5102",
 	.drv_name = "bytcr_wm5102",
@@ -33,6 +41,24 @@ static const struct dmi_system_id cht_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
 		},
 	},
+	{
+		.ident = "Lenovo Yoga Book YB1-X91",
+		.driver_data = (void *)&cht_yogabook_mach,
+		/* YB1-X91L/F */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
+		}
+	},
+	{
+		.ident = "Lenovo Yoga Book YB1-X90",
+		.driver_data = (void *)&cht_yogabook_mach,
+		/* YB1-X90L/F, codec is not listed in DSDT */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "YETI-11"),
+		}
+	},
 	{
 		/*
 		 * The Lenovo Yoga Tab 3 Pro YT3-X90, with Android factory OS
@@ -121,6 +147,20 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.board = "cht-bsw",
 		.sof_tplg_filename = "sof-cht-rt5670.tplg",
 	},
+	/*
+	 * The only known Cherry Trail device with RT5677 codec and 10EC677
+	 * DSTD entry is the Lenovo Yoga Book YB1-X91. It has a device-specific
+	 * driver, so check DMI and use a machine quirk to override the default
+	 * (non-existent) machine driver.
+	 */
+	{
+		.id = "10EC5677",
+		.drv_name = "cht-bsw-rt5677",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "cht-bsw",
+		.machine_quirk = cht_quirk,
+		.sof_tplg_filename = "sof-cht-rt5677.tplg",
+	},
 	{
 		.comp_ids = &rt5645_comp_ids,
 		.drv_name = "cht-bsw-rt5645",

-- 
2.51.0

