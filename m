Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD4C2E3FE
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 00:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775088766; cv=none; b=HcPiuLo/mWgSJBFa2HFxptLWHw9CT20e1JuOsabdtNNyJpDAOWpPHQ9B2Bwh1iJOnk3LqGomVPhKdbnxVIVcycgHvG/NxPbyzPhz/sPB0JYEr5vRK2lULSgMJUFbEuDdqeTCycablGUmv+Gm8gRfBQCG89V231PpX2LPbohn1uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775088766; c=relaxed/simple;
	bh=Ng9HGDs2m2y0NiDsGHKii1VIFz1qjZ4iuEDg4KEiYyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u16ywyfZnKkZ9kGajmW5elGGwOk7Vi/RtubKvWy+R+deBdGo9JDP0i6aGF+jjHhWdB+0rUn6wRKvynyjhVdb/8bn+34izPW5uhbexmKZ9bUsaGx87JJ8hed/chB1kxHhivXdu5qgqSPGVveWsXHB9Cdzch/DBF2Fg7WUxXkRlM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fdma.com; spf=pass smtp.mailfrom=fdma.com; dkim=pass (2048-bit key) header.d=fdma-com.20230601.gappssmtp.com header.i=@fdma-com.20230601.gappssmtp.com header.b=F/ugvtuB; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fdma.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fdma.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fdma-com.20230601.gappssmtp.com header.i=@fdma-com.20230601.gappssmtp.com header.b="F/ugvtuB"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56d9c4f7f0bso261534e0c.2
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 17:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fdma-com.20230601.gappssmtp.com; s=20230601; t=1775088764; x=1775693564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og/Jp95vTIL4Vp4bxD9HnApJDN4ugZLaGkQYybwKDL4=;
        b=F/ugvtuB/c0OPXtcBWBlJlbgMstXcG6+EmUTy/uz7D2noIyz4QBTWE5E/19TVhIG3n
         LYY0arbMfvmYOtAenY8hV6PW+Td2rrEvTfspTOpNZIOx0IgwYPVObE3Lc8xEuLpjWQRU
         l05SusNHtiufzUYgCEDKiwlZ9JW/fmZ9LOESpiIjXtNV3BRC7lbLHYzInptIIqlZcUIk
         jVUt+CW7guPMaElRVE3Q6L+/kO2tCoiPp91hgr/Do7/LvxtKR4Epokd/ymqdtHV+VvhE
         NA6CGih8q+9WtIMnCj/ug/yIpJs3ctHvqYU7TJMWPZWVTE9U/KkuPcn0W/ZQ8SpBQBUj
         BTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775088764; x=1775693564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=og/Jp95vTIL4Vp4bxD9HnApJDN4ugZLaGkQYybwKDL4=;
        b=HIY5GDlA7U2FJow5I7bf55VctB4nDSXi7Wo3MDA6yXWMmHDMgxgMZDwROtSs4SXnBQ
         ILdYiFyoD+tVBuxEeo7872//VPFxN21opVgWCxAaShpQ8nj0ZvZGTfA+0SL+bRSpCdmc
         Ek6gN01Wt6rfwz36bjNOsDQey5Off1ybpsTquP56/7hjoSDs3hnhFCW5ETiEUeZU3eSj
         im6q/RKrIDwqBDSszYQp8fgu7beYki20N0JIwm4ul/SS1af8dSNaNEpedagbIv7FWz/z
         +6C90PCCFC8VHNNMX3/isuvoyXdDcgXwh4gxx45yruWt37F6X2WEdFOhpv3HJc9GYFSl
         smGA==
X-Gm-Message-State: AOJu0YwQi4mD2xSUxgcqO/MgS7XifiFnGnBTEodNXT39avkLBOBg8ol6
	eFOWyMwb3Evr6oy76ZqMKN/C14j9JJOUYHrFbeN2AYhO1Oxvq1HxyCtWLHn6khYTiv57phskDWg
	WIIaBoqpYkw==
X-Gm-Gg: ATEYQzx9McWM2jRtJFoDDhU8w6GXlzFLM9++iTIAZpTjKcjn1tErq/Jj2tuTxFt8Wal
	ihOiiApKEN8PFjyqsS/DQpKzxmqBlGlrKORSIjqW6inyFp++qpGR6xuruUJ4rwoVSjujUQKuisp
	Ky4fsy1+h4yuvpB7nTYdeuw/MXHj2HnzBPi7QOgLnkpzksF9ovT2enZ8ir2BoinGFo9YK2tPIkc
	438AUfZmKGKe3GHhR6q5GmQE1vjhG/HnVtMLD/xsXBxetEkTuEPydnXpu+FxdPdhKtSvwY5KMZ6
	gJfEEdBSKmWWfFIgDKJFIt44V6pxJGBjZgjEmNMd15ktw6SSYEj5kv8DRu2BGb0YRf5WtgQCkeG
	qM1i5CCIAY4qQ2QhysGBpntatrlAwWn7PpxHJGfI1xj6ouVMkhaS25b/LgvIkxgH+dcD7qpw5SP
	WAJMgfG9Dj3bplFpbThq5h6y5CMOHTHLPgKmtQ/1H/hrSeL/C+x5ND1CN+vnKBQGy0TKd+daRJo
	DyWCocddiRhBDSusLcuioy/Moy6oYA0TTfaz0Ui8iIcBLi2p8U=
X-Received: by 2002:a05:6122:6592:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-56d8a8324f5mr2895413e0c.4.1775088763889;
        Wed, 01 Apr 2026 17:12:43 -0700 (PDT)
Received: from cashxps.fdma.com (c-76-137-39-120.hsd1.fl.comcast.net. [76.137.39.120])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb7f1523sm1756460241.1.2026.04.01.17.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:12:43 -0700 (PDT)
From: John Meyer <jmeyer@fdma.com>
To: linux-sound@vger.kernel.org
Cc: yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	John Meyer <jmeyer@fdma.com>
Subject: [PATCH 2/2] ASoC: intel: ptl: Add machine driver entry for Dell XPS 14 DA14260
Date: Wed,  1 Apr 2026 20:12:36 -0400
Message-ID: <20260402001236.17086-2-jmeyer@fdma.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402001236.17086-1-jmeyer@fdma.com>
References: <20260402001236.17086-1-jmeyer@fdma.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell XPS 14 DA14260 (Panther Lake) uses the following SoundWire
audio topology:

  Link 0: CS42L45 (mfr 0x01FA, part 0x4245) -- SDCA headset codec
            ADR 0x00003001FA424501
            Endpoints: UAJ (jack playback), SmartMic (DMIC), UAJ (jack
            capture)

  Link 2: Two CS35L57 speaker amps (mfr 0x01FA, part 0x3557)
            ADR 0x00023201FA355701 (left/AMP1)
            ADR 0x00023301FA355701 (AMP2)

  Link 3: Two CS35L57 speaker amps
            ADR 0x00033001FA355701 (right/AMP3)
            ADR 0x00033101FA355701 (AMP4)

ADR values were obtained from the platform ACPI DSDT.

Add the necessary ADR device arrays, endpoint descriptors, link array,
and machine table entry.  The CS42L45 uses three non-aggregated
endpoints (jack playback/capture and DMIC) matching the SDCA functions
advertised by the hardware.  The four CS35L57 amps use the existing
aggregated speaker endpoint descriptors (spk_l, spk_2, spk_r, spk_3).

The topology file name follows the established PTL naming convention.
Note: a PTL-specific topology file does not yet exist; users can
symlink sof-lnl-cs42l43-l0-cs35l56-l23.tplg as a workaround until
a dedicated PTL topology is submitted to linux-firmware.

Tested on Dell XPS 14 DA14260 (Panther Lake, kernel 6.18.20).

Signed-off-by: John Meyer <jmeyer@fdma.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 103 ++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -227,6 +227,66 @@
 	},
 };

+static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
+	{ /* Jack Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Jack Capture Endpoint */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
+	{
+		.adr = 0x00003001FA424501ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_2_lr_adr[] = {
+	{
+		.adr = 0x00023201FA355701ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00023301FA355701ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_3_lr_adr[] = {
+	{
+		.adr = 0x00033001FA355701ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00033101FA355701ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP4"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_2_adr[] = {
 	{
 		.adr = 0x00023001fa424301ull,
@@ -431,6 +491,25 @@
 	}
 };

+static const struct snd_soc_acpi_link_adr ptl_cs42l43_l0_cs35l56_l23[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs35l56_2_lr_adr),
+		.adr_d = cs35l56_2_lr_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs35l56_3_lr_adr),
+		.adr_d = cs35l56_3_lr_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_cs42l43_l2_cs35l56x6_l13[] = {
 	{
 		.mask = BIT(2),
@@ -619,6 +698,12 @@
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
+		.link_mask = BIT(0) | BIT(2) | BIT(3),
+		.links = ptl_cs42l43_l0_cs35l56_l23,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-cs42l43-l0-cs35l56-l23.tplg",
+	},
+	{
 		.link_mask = BIT(1) | BIT(2) | BIT(3),
 		.links = ptl_cs42l43_l2_cs35l56x6_l13,
 		.drv_name = "sof_sdw",
--
2.49.0
