Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5051E3101CD
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 23:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771370016; cv=none; b=at2ITGhhAEn6wwZv8msLOmpjT0EqUd2y31hq/1iYXNA5r+zc+loltHydPlwTHbfl4XVzBbk0WJPgHsugzcx2PORNllgqz7xnKtaSAn7ZCdJf1PE1VmwJFWdbCGSsfW35KKcDvsbKyKZyGprwQs72edkG3yWzxP5IjMS5xLLt+1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771370016; c=relaxed/simple;
	bh=aEdMirBVX3PPQ1QFkY6pFwuZYxuJIL/jbDi5a1WULFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/A1CSyeHgYD/cCBdQCOm8lE7v+A9fuOLrMTC2Vc4vEWpYpWAUw5hc4eHH8lqbWwDDQhOLAtTOZcbqJjAG+pig5AU56FNb1cH4QyoYruKbXm8QRkH5enxWvbEYBXr3H9a65m/WH3acrPKcU3ZT7/aalzFdT87POwMX0HJ1DSoQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpIfbGL5; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpIfbGL5"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65a1970b912so508670a12.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 15:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771370012; x=1771974812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChNMzOH279vklBP3A89PcATTRSKJjuOlqr/8qHAiJfo=;
        b=IpIfbGL52kPzS4cQZ1amP7z+sW7sXRhCWyLgOAKufPB5ZfqmULH208cCf+IsaCOdCR
         tmLhiG3W76F3b5SWtOIJFBV88hRW1S3KSDAMq5d5VSY6IjK45ANZj3uiUOlG5Af8PVVD
         nv+C/OWFGV/bscjSl2tOdAMUSd1NMTv3Jn98B0U4ECW2l2T3Exjnx9f2hh2fREh9oCa3
         0y5s7ZYsDY132y8sFjhdCdC+udeRhT+sLZXMO29chi2jTyOdDtO06+VEN0eOHYycNej3
         sJKzHDj3S5UX7okaQuop5uh4DX/32TWmJRzYWdcJJOD0ko07p8UEcLsaKON5w8/N1JkZ
         6pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771370012; x=1771974812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ChNMzOH279vklBP3A89PcATTRSKJjuOlqr/8qHAiJfo=;
        b=I8unV87BGf0DADmT4OS0bEg+TLCAf14Ao6tJHhjHFnSNV0j5lXxA2K0Nk//MzEjl6+
         XNd763GB4xzZGFwRHgyn33XJA3jhl1bJcB31vX04w6I8SrHNEMANFNKcWuNpRaUJJXdR
         A73GgaYa1M+JqegQiAPztFB1piDNY3Qw0cmltb46LNhNChxVKGjdV2AffTz6nL9e+Ddf
         y61+ATYHCZhzHU+A6uJ/jgPdttDC9Y20Igc0HXcVpmg4j5LBmiRlG3uTsZzpr0ENrEJX
         qSiHNMy2q2ztqT5n32Pi6643UKPwwrSFWJJ96s00mqM+cmpxsc4HJcf3RpylJDibNeob
         Y1sA==
X-Gm-Message-State: AOJu0YyiS5vgzzmXypyNLEtkX2vJkgXXM9dgb0Bcg3/Qb9fKB5BzhHlv
	ZC4wgVnaIsHhnW76PJK/XFPyTEWv3JiMqoN8AnAs0SPUJ+X7eW2S3GguQNHy5g==
X-Gm-Gg: AZuq6aKoIzsYc1FKVfsTa1Kb4h+AXw3Qd6GpoQNAjNk0MiFnwVYQ1BsHiem/pVw/Ccq
	rZRHHNKoVeN2Fb1TMDriUYmPT4bXKcBbj59gEmytuD6FzxvHjxP89fGT6SM5qhLxv5Y/7S3+O9K
	2ucPnJ3S+VZcNkub2rnnP2w/HZRPKMoEGah2MTeyMDjU1Q2DBlZ3/I0gHmauvGeS+Up9REpHhS2
	YqfbI8XDvQKb2uRXiVQqHUiEFFANuyEJy8CL6zqUinQ+EbotN8Mg1EHi/PfNCfARCEAqA6tUXS9
	YTvWHlPfCMYl+/vQEgDV1FeBvj8yRLDo8YlUwmBHOt/9yitRCtMEqWeYOrwA903XgunjCPMD9lu
	TXoU9Z5gnqmq3EefvoVlkl9Usgp4WIJXiQfXI5Fg/OYnLXD1h0bYopuqq0niqLBbTaVvkBkL0se
	xkOMXfdV/oEjqMhw==
X-Received: by 2002:a17:907:9341:b0:b72:5629:1789 with SMTP id a640c23a62f3a-b903ce43635mr3012566b.13.1771370012393;
        Tue, 17 Feb 2026 15:13:32 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f137dsm2661375a12.27.2026.02.17.15.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 15:13:32 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v1 2/2] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Book entries
Date: Wed, 18 Feb 2026 01:13:24 +0200
Message-ID: <20260217231324.1319392-3-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260217231324.1319392-1-jekhor@gmail.com>
References: <20260217231324.1319392-1-jekhor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo Yoga Book YB1-X91 device uses a Cherry Trail SoC and has a valid
ACPI DSDT entry for the RT5677 codec. This entry has some non-standard
resource definitions, such as jack detection chip information, and
hardware has some additional GPIO controls so use 'cht-yogabook'
for the driver name instead of some default (like 'cht-bsw-rt5677').

Lenovo Yoga Book YB1-X90 device (Android version of the tablet) has the
same hardware configuration but lacks a valid ACPI DSDT entry for the
codec. To match this device, extend the existing quirk designated for the
Lenovo Yoga Tab 3 Pro YT3-X90 and make it more generic: select a matched
machine using the dmi_check_system() quirk mechanism.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 .../intel/common/soc-acpi-intel-cht-match.c   | 144 ++++++++++++------
 1 file changed, 94 insertions(+), 50 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index e4c3492a0c28..cadb7790d86a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -9,13 +9,47 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
-static unsigned long cht_machine_id;
+static struct snd_soc_acpi_mach *cht_quirk_mach;
 
-#define CHT_SURFACE_MACH 1
+static struct snd_soc_acpi_mach cht_surface_mach = {
+	.id = "10EC5640",
+	.drv_name = "cht-bsw-rt5645",
+	.fw_filename = "intel/fw_sst_22a8.bin",
+	.board = "cht-bsw",
+	.sof_tplg_filename = "sof-cht-rt5645.tplg",
+};
+
+static struct snd_soc_acpi_mach cht_yogabook_mach = {
+	.id = "10EC5677",
+	.drv_name = "cht-yogabook",
+	.fw_filename = "intel/fw_sst_22a8.bin",
+	.board = "cht-yogabook",
+	.sof_tplg_filename = "sof-cht-rt5677.tplg",
+};
+
+static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
+	.id = "10WM5102",
+	.drv_name = "bytcr_wm5102",
+	.fw_filename = "intel/fw_sst_22a8.bin",
+	.board = "bytcr_wm5102",
+	.sof_tplg_filename = "sof-cht-wm5102.tplg",
+};
 
 static int cht_surface_quirk_cb(const struct dmi_system_id *id)
 {
-	cht_machine_id = CHT_SURFACE_MACH;
+	cht_quirk_mach = &cht_surface_mach;
+	return 1;
+}
+
+static int cht_yogabook_quirk_cb(const struct dmi_system_id *id)
+{
+	cht_quirk_mach = &cht_yogabook_mach;
+	return 1;
+}
+
+static int cht_yt3_quirk_cb(const struct dmi_system_id *id)
+{
+	cht_quirk_mach = &cht_lenovo_yoga_tab3_x90_mach;
 	return 1;
 }
 
@@ -27,29 +61,57 @@ static const struct dmi_system_id cht_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
 		},
 	},
+	{
+		.callback = cht_yogabook_quirk_cb,
+		.ident = "Lenovo Yoga Book YB1-X91",
+		/* YB1-X91L/F */
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
+		}
+	},
+	{
+		.callback = cht_yogabook_quirk_cb,
+		.ident = "Lenovo Yoga Book YB1-X90",
+		/* YB1-X90L/F, codec is not listed in DSDT */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "YETI-11"),
+		}
+	},
+	{
+		/*
+		 * The Lenovo Yoga Tab 3 Pro YT3-X90, with Android factory OS
+		 * has a buggy DSDT with the codec not being listed at all.
+		 */
+		.callback = cht_yt3_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
+		},
+	},
 	{ }
 };
 
-static struct snd_soc_acpi_mach cht_surface_mach = {
-	.id = "10EC5640",
-	.drv_name = "cht-bsw-rt5645",
-	.fw_filename = "intel/fw_sst_22a8.bin",
-	.board = "cht-bsw",
-	.sof_tplg_filename = "sof-cht-rt5645.tplg",
-};
-
 static struct snd_soc_acpi_mach *cht_quirk(void *arg)
 {
 	struct snd_soc_acpi_mach *mach = arg;
 
 	dmi_check_system(cht_table);
 
-	if (cht_machine_id == CHT_SURFACE_MACH)
-		return &cht_surface_mach;
+	if (cht_quirk_mach)
+		return cht_quirk_mach;
 	else
 		return mach;
 }
 
+static struct snd_soc_acpi_mach *cht_quirk_nocodec(void *arg)
+{
+	struct snd_soc_acpi_mach *mach = cht_quirk(arg);
+
+	return mach == arg ? NULL : mach;
+}
+
 /*
  * Some tablets with Android factory OS have buggy DSDTs with an ESSX8316 device
  * in the ACPI tables. While they are not using an ESS8316 codec. These DSDTs
@@ -75,38 +137,6 @@ static struct snd_soc_acpi_mach *cht_ess8316_quirk(void *arg)
 	return arg;
 }
 
-/*
- * The Lenovo Yoga Tab 3 Pro YT3-X90, with Android factory OS has a buggy DSDT
- * with the coded not being listed at all.
- */
-static const struct dmi_system_id lenovo_yoga_tab3_x90[] = {
-	{
-		/* Lenovo Yoga Tab 3 Pro YT3-X90, codec missing from DSDT */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
-		},
-	},
-	{ }
-};
-
-static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
-	.id = "10WM5102",
-	.drv_name = "bytcr_wm5102",
-	.fw_filename = "intel/fw_sst_22a8.bin",
-	.board = "bytcr_wm5102",
-	.sof_tplg_filename = "sof-cht-wm5102.tplg",
-};
-
-static struct snd_soc_acpi_mach *lenovo_yt3_x90_quirk(void *arg)
-{
-	if (dmi_check_system(lenovo_yoga_tab3_x90))
-		return &cht_lenovo_yoga_tab3_x90_mach;
-
-	/* Skip wildcard match snd_soc_acpi_intel_cherrytrail_machines[] entry */
-	return NULL;
-}
-
 static const struct snd_soc_acpi_codecs rt5640_comp_ids = {
 	.num_codecs = 2,
 	.codecs = { "10EC5640", "10EC3276" },
@@ -137,6 +167,20 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
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
@@ -208,14 +252,14 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.sof_tplg_filename = "sof-cht-src-50khz-pcm512x.tplg",
 	},
 	/*
-	 * Special case for the Lenovo Yoga Tab 3 Pro YT3-X90 where the DSDT
-	 * misses the codec. Match on the SST id instead, lenovo_yt3_x90_quirk()
-	 * will return a YT3 specific mach or NULL when called on other hw,
-	 * skipping this entry.
+	 * Special case for the Lenovo Yoga Tab 3 Pro YT3-X90 and Lenovo
+	 * Yoga Book YB1-X90 where the DSDT misses the codec. Match on the
+	 * SST id instead, cht_quirk_nocodec() will return a machine-specific
+	 * mach or NULL when called on other hw, skipping this entry.
 	 */
 	{
 		.id = "808622A8",
-		.machine_quirk = lenovo_yt3_x90_quirk,
+		.machine_quirk = cht_quirk_nocodec,
 	},
 
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH)
-- 
2.51.0

