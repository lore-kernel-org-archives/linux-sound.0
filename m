Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6303C1082
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 23:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781135535; cv=none; b=g957Pq4aKfJf4ZruOTeybeFTwdqq9Yufy+nr69QFW3MB6kWVwMjmFDDL4xq6q+ibGO8Cv6L6jpzQHURXHigHZzBvhf6RUo1qSStj6Vrc1iO12XwnGOOhGLbyVMhOQfZAu6ZrDNX/mIfDJJqguHfs+ehJ4JTCcVD7V07+wp16m/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781135535; c=relaxed/simple;
	bh=KCapcH04GnQHTviEX00pHFF1ryFIL2Xzijj8JcWrcA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pd/PYyPWHeaqXwdtrhizoF4aQqsmkL00UxGNAHAkk5m467NEB4V8xcsVcnR1ooqrwxeXwoZWjeObYMOWsU9Qqntq88SxeL+QMgz2LMhi6FqfnY+3k23diLAGSHuDplAvlvilIw7Sjz9Up/wihYO39ij2NmPA2V0qEMlO7o/BA1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgBjv6At; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgBjv6At"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bebb72b845aso1174365566b.3
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 16:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781135531; x=1781740331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6H99sHoIWKNuVB0cS6tuVXAWbJCFFw3FoZpbc6aip4=;
        b=KgBjv6AtA/UYA5rej+CIsAMcWeTGQAKYO2k/ktqSCfnqdnzgbmFVlU8mYEq2OPSzbk
         6CZG7z5BlzpwEfJjljvtjzTunFDn4YyXp8sVrcNZdE+JwxAIZSG3P+DfyWtWFSw3ZPQs
         zMtEYTneSQ2wegPJB+4jcM+2AUMMPyzSl2hbHB0ypioE0+RD9LHcG5bpwiWgkXz8ANTO
         ZrrJLg7hEE7W+LXvPsyOEloEelY/U2M0qYf4PmBNSnCpa9Ir+YIJsyx1HImXRfho8qSD
         87xYJ1zrziIUoHa56lFm/xE/Vertnua+4rldiov4B6vvkSS8Cg0Ij6hjddAUqhISJ+Lu
         4lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781135531; x=1781740331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E6H99sHoIWKNuVB0cS6tuVXAWbJCFFw3FoZpbc6aip4=;
        b=PaZI0ETg+9S02Vy3AhiyeVObmPSMzCBgo9IhVGDvoNYBj0s/bOVdEegBfHMGl8apmX
         Kufkr+hwyDtgM3G6lESQH6BpCUPMCmKMZVB8pYb2sFwS0jDcnxbAq+ji5ZjK8G/kmxMM
         W0q12cjoQNYZy1p+LKe98QVv2iY83+Cl1L5jh1zRKLGIQ78pIQgjILCZRELZGBHnimYx
         PHVNo05hfAVVXHWqqD48X55p0UMTvwoF7tQuAWIO7kDn/7cJ9MTzJ92Y3wR3qrnDflPY
         UP8rWpiqLMaQVwp0yQFRk52pdcg26o7yiHaUW45c8p6r+mv1yn0HRp5NGP9Xyuidw5VL
         7GTg==
X-Gm-Message-State: AOJu0Yy+V43hGKoKbu3W8Mda7M1NRFpMmNZ3/uyDP5PTKxxqnBlKuX4M
	77armjhKtCqVAYs1p6/wX04JHMY0nS37ejRHnZrp16yfFYgaPGKC+C4n
X-Gm-Gg: Acq92OHiLCjCnKSus2XTT6VlfXNVPrWaiTqLTC6VBFbfazHAW2BQu1ZgcH1PyiVyx6n
	T9oWFkNVwai9sL00kniGu2JbTZ8YdBywty79DhkZReCDTdpU6ivX4x6QPMNVhlRdw9TEvpaEniK
	2RkKA1gR+vyfklDifbRKNUNFIeHSfNliT2pDoGu+lBWv8SeUyaePsNn8hotpUVcaFTtpk5FA2z4
	BDD3b52zqyLwcdrPb+VFCsC5r1STB3cbfNcQPJUQJObmadRKCq0JmO0BAWMSIftRK5Ig1gHFP9C
	/HuhSfAvgQSNstApy0/S4kVGYzjkYoqqmYqo9TYf8F7gGpFb5EKuXIB/jWpz81OB3tv12dyGhIK
	z9w2a2SG+c0Phs/20c7Cj5d3dQsyvCqpUbbMbo+ccPTG38lDWWdP2+qmTOPh71noZeZNjEJRwdF
	Y4rGIUYtXyT+BJMsA7aR6AJQO7JKUC
X-Received: by 2002:a17:907:9702:b0:bed:4f1f:bf9f with SMTP id a640c23a62f3a-bfc855337d8mr2716766b.5.1781135530677;
        Wed, 10 Jun 2026 16:52:10 -0700 (PDT)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e03716sm1225741366b.34.2026.06.10.16.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 16:52:10 -0700 (PDT)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Thu, 11 Jun 2026 02:51:55 +0300
Subject: [PATCH v3 1/3] ASoC: Intel: soc-acpi-cht: Unify device quirks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-asoc-yogabook-v2-v3-1-3128447b67b6@gmail.com>
References: <20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com>
In-Reply-To: <20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781135528; l=5862;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=KCapcH04GnQHTviEX00pHFF1ryFIL2Xzijj8JcWrcA8=;
 b=Yo4qIXbPba2P7yyvuj8ifINTPJcCkc75oiJmm/mCr5Jr8yFiV/SKp26JqK220FTDUUgOlkhBV
 VT3a+EfT/k/DhydkK4RMPoMIpgOE8bLydoJem0PKjHYNzSqqGECQG1e
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
index e4c3492a0c28..28f600171f9d 100644
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
 
+static struct snd_soc_acpi_mach *cht_quirk_strict(void *arg)
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
+		.machine_quirk = cht_quirk_strict,
 	},
 
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH)

-- 
2.53.0

