Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824C721FF30
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 21:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772400848; cv=none; b=k/avaEB1pbHQlfxmEM8cZVSW+fUL/dIidd/m3bw6qr1GQgAPsuf0jO0xTCt/7GDA67MQND+E7f4LGW/WiOqW96F1xB0oa+7XYjk5GSWpUMd9cWSHfOEVWXFfhAyQ73PLBUWFZdVYHTbt4ZIJ+RzwX7p5SsoAoy3SotdFo4S6LjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772400848; c=relaxed/simple;
	bh=lM8CSz0ZAgw0noIwUoYPin1QYbAEN1swuFeYfH8WiOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sIH41Wge/SAsBFL5+9iVfqdfnds4ScPedc5zjTGG8nkdB40c9xuJuNYR/4vTXGbI8n/f6eQ18hMw0C/Z93X8wuDv9uu/F1ClCFdYf3c/rYToDzlgLIhdEvUZ4UsJJikF4iRQzgKqSFb3eGSbPVkDYkf/neLU8Lm14tHVyVWA3cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSp3pcBr; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSp3pcBr"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65faaa8b807so6951150a12.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 13:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772400844; x=1773005644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsG6AI7p1nqWRSx0MJDSqDIjQsSAz68j9rdPzL7TnOQ=;
        b=gSp3pcBrTYthFKdr+28ysev2KbbT8wC/3BvwYOIKFUkvCqXcJzgEJ3EgaxXNNsGVUE
         WX71cZcwjSaUCUkj3xgJNsGX+1sZcBya3iT+fj8VKsv1J647DpcaD48ndIjf1Ou0KrQu
         DjcxhtAlTEhMENy+3/Feha++OgaGgBkr0XHi2fllklwmkO+Ld6vmvYuSeUsh7o61yhum
         2XMmawFHV2VSM31pZIhVdceXzqj/F/z+rQHSfWYXEh9emS28P3x7ugXU7/2aFDShvlwP
         cIv+IJQCjSqFkSRhA56k9jCYStKxl7PqhPxSIYrMpuj0krD0l8WulyfwFOKEaCTHFm9s
         3lWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772400844; x=1773005644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EsG6AI7p1nqWRSx0MJDSqDIjQsSAz68j9rdPzL7TnOQ=;
        b=b4hihDDPoHwPjcJNbBS1kW+78br53kAGXc7cUFPAbJZwm5K9QwS/LkMg++bjEqpr7b
         qt9eF/q/EVx4DBx49HtKAAHi40uF22gjTNj/hTfb0nGv/awR16hOQugv4IbgVpvCP1GS
         2RYUwJ+cuUcV9c32y5h6S26NiWkf7HMHzE/to0jft83VLOOWO8bwZRXgqWc3fzonvljZ
         IZcxdO99kojNUm8FSznR94rryJEsU8ViK0D25o/zzHs6IUG3RHqsGK1bgzWR85aPu5aF
         kM3E24CrbweCQWrfwae/ev9FYJO8rrwNzFpm8bF5UxHkFZmkJJrqAJcqmBH2sprSWsCR
         xm8w==
X-Gm-Message-State: AOJu0YyfzxNr7+gcnRhr00TvtdOtwA5YGioUvlHiIrYtRWeLaKzc6060
	dzD5zVpW4sTVuwy+hnBqKd+TbeDqXgziFEAWixquBa0oGjBW1wnEwzwR
X-Gm-Gg: ATEYQzwhOkk4m+i+XdazijlNXNyVBOUGScUklTTpkuy/jeS6bKTs5DFAswTl0M9Xtfa
	pDm1OT+loNtZ/IsEL0mW7eEGkjSFSYSUW85lfKxYXO6XjfVp7cjzBL5vZDJBo/y69ALUqLLulRq
	l+V/D4SVdWZc3ndl2Dg077Z8vRtZRLbUNjwRKxLi/7V60XxUyCt9JRuWA1hIBu11R3LL3hy430B
	nYNrJKG3dAKLWKYXHv1gUYInYZWfPkehl34qigOnaK0DPZCPnPZuF4F1hmmoGUB7hphNh/XQ3IW
	u+xUq/hb/PKaI8GCNlI6Yqv4L0C+W9rr4AhYJi868XEEXrnSWG3g2Rx+j26O5HkZa6ry/1eJLYy
	4qmVqW7733AQ4axndWt49deCEUIpoAyu6y1FHLGdWI/Uy1YoXR1rf3exB+549uQVawp6JBgiXJP
	Wy0/OVYRF/Tz9xp4Th2g==
X-Received: by 2002:a05:6402:2755:b0:65f:830b:1034 with SMTP id 4fb4d7f45d1cf-65fdd6bd91bmr6814260a12.6.1772400843423;
        Sun, 01 Mar 2026 13:34:03 -0800 (PST)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6cfd9sm2934793a12.22.2026.03.01.13.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:34:02 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Sun, 01 Mar 2026 23:33:44 +0200
Subject: [PATCH v2 1/3] ASoC: Intel: soc-acpi-cht: Unify device quirks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-asoc-yogabook-v2-v2-1-adcc7ed40985@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772400841; l=5864;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=lM8CSz0ZAgw0noIwUoYPin1QYbAEN1swuFeYfH8WiOM=;
 b=JbfeDRs0yg23M6QPpyUd9mijcWCGHTNQAind0YtJfZwW2pOefIal+eeifYIbbPxb0yp4Siij/
 XHH9bCRvrSsAYfvUV4+Z9vUdy+tEYyk/r4pZsPmiR3WFeNc7RWGTenm
X-Developer-Key: i=jekhor@gmail.com; a=ed25519;
 pk=C/csaZJs7UBNDgeJcUAmPu4ntqNeaZ3BKfBQiH8tuGc=

This file contains two types of quirks, both checking DMI for
machine-specific strings and returning machine data for a matching entry.

The first one, `cht_quirk`, is used to override the default entry for an
existing ACPI codec node if the node's info is invalid. It returns either
the matched machine data or the default entry if no match is found.

The second one, `cht_yt3_quirk_cb`, is used for devices (originally the
Lenovo Yoga Tab 3 Pro) without a valid codec DSDT entry. It is bound to
the SST ACPI node and returns either the matched machine data or NULL if
no match is found.

To allow adding new machine entries to the second case and to use a single
DMI match entry for both cases (for example, if two variants of one device
exist: one with a valid ACPI entry and one without, like the Lenovo Yoga
Book YB1-X91 and YB1-X90 - Windows and Android versions), reorganize
these quirks functions to use the same approach: machine data is set in
the matched dmi_system_id entry as driver_data field.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 100 +++++++++-------------
 1 file changed, 42 insertions(+), 58 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index e4c3492a0c28..57097c1d011e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -9,47 +9,63 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
-static unsigned long cht_machine_id;
-
-#define CHT_SURFACE_MACH 1
+static struct snd_soc_acpi_mach cht_surface_mach = {
+	.id = "10EC5640",
+	.drv_name = "cht-bsw-rt5645",
+	.fw_filename = "intel/fw_sst_22a8.bin",
+	.board = "cht-bsw",
+	.sof_tplg_filename = "sof-cht-rt5645.tplg",
+};
 
-static int cht_surface_quirk_cb(const struct dmi_system_id *id)
-{
-	cht_machine_id = CHT_SURFACE_MACH;
-	return 1;
-}
+static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
+	.id = "10WM5102",
+	.drv_name = "bytcr_wm5102",
+	.fw_filename = "intel/fw_sst_22a8.bin",
+	.board = "bytcr_wm5102",
+	.sof_tplg_filename = "sof-cht-wm5102.tplg",
+};
 
 static const struct dmi_system_id cht_table[] = {
 	{
-		.callback = cht_surface_quirk_cb,
+		.driver_data = (void *)&cht_surface_mach,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
 		},
 	},
+	{
+		/*
+		 * The Lenovo Yoga Tab 3 Pro YT3-X90, with Android factory OS
+		 * has a buggy DSDT with the codec not being listed at all.
+		 */
+		.driver_data = (void *)&cht_lenovo_yoga_tab3_x90_mach,
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
+	const struct dmi_system_id *match;
 
-	dmi_check_system(cht_table);
-
-	if (cht_machine_id == CHT_SURFACE_MACH)
-		return &cht_surface_mach;
+	match = dmi_first_match(cht_table);
+	if (match)
+		return (struct snd_soc_acpi_mach *)match->driver_data;
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
@@ -75,38 +91,6 @@ static struct snd_soc_acpi_mach *cht_ess8316_quirk(void *arg)
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
@@ -208,14 +192,14 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.sof_tplg_filename = "sof-cht-src-50khz-pcm512x.tplg",
 	},
 	/*
-	 * Special case for the Lenovo Yoga Tab 3 Pro YT3-X90 where the DSDT
-	 * misses the codec. Match on the SST id instead, lenovo_yt3_x90_quirk()
-	 * will return a YT3 specific mach or NULL when called on other hw,
-	 * skipping this entry.
+	 * Special case for devices where the DSDT misses the codec. Match on
+	 * the SST id instead, cht_quirk_nocodec() will return a
+	 * device-specific mach for matched device or NULL when called on other
+	 * hw, skipping this entry.
 	 */
 	{
 		.id = "808622A8",
-		.machine_quirk = lenovo_yt3_x90_quirk,
+		.machine_quirk = cht_quirk_nocodec,
 	},
 
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH)

-- 
2.51.0

