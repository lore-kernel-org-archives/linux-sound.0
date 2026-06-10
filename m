Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EFB3C10A7
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 23:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781135537; cv=none; b=KOpWCHyOV7txkP31vbIDBUHArzLN7R501XnfWWjJWbMQ7bjhAWTlALsaaR2+EWL/y9wicvs8OTDZkBsy6VNeYEC1AShd2b5Ev8695za+/hkIOumw2w2Mggq1d+X2j8ZHkyBdIdy37IPo9Yun5X8yZvzcc0abkEEqUoR+Y5OAL68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781135537; c=relaxed/simple;
	bh=XvXmjNswgEkkL4IDUq64RMfcvfD8wfe1FUyHGBixG3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nhr+vYQf9bxMHj8jkrssjOonrXrcBvdYRldRsFijbWPasM5jKRzL510EH7fATCj+Hd1BvN3J/YBR0SDUONZqw2dGHreGC2Hk6egT5iWZSo+bdAJj97WPFw0a412RK9wSiCpHI6SFQjOw2PnR9BH4DBELoyGQnYOIvXdwHiVZHLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVypwsve; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVypwsve"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bebb72b845aso1174367466b.3
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 16:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781135532; x=1781740332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+wAnMpm8w/PKv4rL1o8F2L6hEkDcrRnbe/1tLY579E=;
        b=UVypwsvefmJc7sHZXNx0FI/qQvxF1mfT/KUVha7z1Bd5rfwz7TpZf1+KIGg4FzGkfA
         TQwYsp8qYHuwfx08duNVM7y52TJ+HebwBzczzj7eUTCxF0PehL7zKWsTy3UXG49sUhtg
         1pQoklyj0tp/GWYiFO6hL0eN+CO0rbmlbyBUnNVvjzxmgrcFY7yMpCvys4R+ytt4ShYH
         MZ3YRS2ZHRl7Q5+ISWOBqLn1Sb+LEdtDpHvzyr31PY/5aSWFscplT7oo3EAKQqiaadWj
         YvHzS1xdalHkIJQrEB2Nl4YSyS/DtsB+G2buMMUHjsKmQFme2iEcE9YnTtrhzuEh3PRz
         rbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781135532; x=1781740332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R+wAnMpm8w/PKv4rL1o8F2L6hEkDcrRnbe/1tLY579E=;
        b=CLXr5Rm1qfQ8YxAaBGTjFp+rB5m9D186lKHacrkuR06ta32iog+fNRVAUDQpk2crG4
         85SrXyVioopKAYZHN6Cktn+MRRswOyyfzDDHb934jM8hRVhYyZmeN9CikfChufhfHZl2
         bfTChnz6MelMXrm+tmstdOxF3upa6iTSPZ8qm8vogOWYdkRmqIfYW493qmhHZmh/zu7G
         aAFcW3hGnwKUAwrtmsE1BqRQbWtFhRm1Yoc+El6z34ITqHyHylh0x3qkLqKR4tPVjBf9
         IWd/3ySZRi3gKPcYdWvfQqcdkfpovavnn7ZYMMZhodNtBychCnD9f3DPLp7NlDp/mv92
         KGuA==
X-Gm-Message-State: AOJu0YwIjFzGmquMx7jL98+qrcWnoVbtS4xIRwGMXl7txHbEqI98nR3g
	ipZ0O6oi0fnhfldGsfGOQ92ZTC88kMUjKsT5GFHTy2ZCzFzWquq7PHJx
X-Gm-Gg: Acq92OF5+3QYadWyE6BxcTai5y/fJ7FoKpTqOuTwP0YOQV3G9M+786aRtKt6RjdRQ9S
	/hnUXlZ+RlQyS+95/8IaoFB41zvl1OoxYbSLe60AE3eGEWqwOiyDkm5i6GZq8lJynTfU8o8jltk
	sCK3W6COP4sZs1dAT2grKQMU87RIGNfCPeXON/3Hlf7Hx/cD1y6YEJPZqrtb4lvI8dF6aNZtZNn
	AdxldgUKW9qNlObBfTrIV89Bajs3p+aPpGfPQlVoBWN+GzwNpThhCXqgU0YuWBeX/iTEYKZ+wGH
	X44ppTuXE9GwnZvQv6RhVRfKs6DMuXokUI4noGb2Fu/+tLYo+aAOLQqS2xnGFcLvJsYaCPk/w6U
	nJlK8HuzINvZxIetrYeb2iAPhybzohWXzvHTYJam6E2Ol5zarUc51w2RRfWJjspYY+/BT6YwDhd
	KPfgOuyPf5z3uLr2LWZe6QuNc6+a9V
X-Received: by 2002:a17:907:2d2a:b0:bd4:6c96:f87b with SMTP id a640c23a62f3a-bfc87bf967cmr2262666b.28.1781135531695;
        Wed, 10 Jun 2026 16:52:11 -0700 (PDT)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e03716sm1225741366b.34.2026.06.10.16.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 16:52:11 -0700 (PDT)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Thu, 11 Jun 2026 02:51:56 +0300
Subject: [PATCH v3 2/3] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Book
 entries
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-asoc-yogabook-v2-v3-2-3128447b67b6@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781135528; l=3008;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=XvXmjNswgEkkL4IDUq64RMfcvfD8wfe1FUyHGBixG3A=;
 b=DmEhyMGAmX2Zg43WIT2cyJOFQisjIgOVEUtGP+p4pF2rbayj2ydnETB+jDjuH/ybwON2YRguG
 y6v2XPXF08hCdCjzBf51FgvgZFyLtoBInPMZnZlUALfJ5FKXGuVCnSo
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
index 28f600171f9d..5e8a1dc84ee1 100644
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
2.53.0

