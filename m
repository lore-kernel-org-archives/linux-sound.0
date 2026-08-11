Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B178E477294
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481904; cv=none; b=cSSkAX0Hd21ZWRaCQWtR14bP/HfcLv/6QJdMR91g4/V4PfCgK7zJGmyfkK8GpVgA3XWmcFfrhxwWtKU42hAaY0k2m6m89bFEQvMxGMG8S1a8GOwsLrEkffxjAzMmdUVaQlU2Lxl9CxYq6sLdCYTqFQOZUrUbfYpKmYfzpDqqBxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481904; c=relaxed/simple;
	bh=3LhNsgLoxNYZDiDksG4yzIINxvMC1s+m2wHs2h0sIvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MHTuJ5U/iosJx1CvlaH7CTRpE8arbmYzQkiiYXgoRmqbhWIwAVR+CJ7azb9O/WpU8jhn0xyl5bqLaXl71p6mQHd5YScI0A/HwnU9SA342oiJ6wRRHUcB0qjJ2GtLZLjxCtUcqlRZzM3AKw2u0PmQUU4E7i/tc9gKAYDlLf6XHzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGikqj98; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGikqj98"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15e2dab83eso46923566b.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786481901; x=1787086701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9+2ax1B+F5GfsmMbjcinAmYhd98Pr24E1UBhoJp1Gc=;
        b=dGikqj98NR6a/fXdJbaZeCPyhv7DM0yZ1BxMZvtXq6bqlSmHBdfnZ5g112mlE2qS62
         O76CPWQi8oJ9P/3VMhKCDLLj3bEFmqf9xpmRwSaarqy0xO3YnWsXa1l77M1PnVIzF4Ec
         l4NjpvaCGinJosv0PgfawwxI2h/hWszbG9mqzrzHG3S9+B4Ub8M/gRbKK0bvF1Bf05QP
         xKDpKfIW3zH2r+69rryngra5hwQph8nZgzV89gjUCCUqESxyjp7O+ykdShtaosk0GgB/
         UFjWg5jl2Uq86LA2rUyvYtJuQLKDGCin9YR5tq//Oyd4HvC5wmUcBzArif1B3yJBS0Bt
         WjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786481901; x=1787086701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9+2ax1B+F5GfsmMbjcinAmYhd98Pr24E1UBhoJp1Gc=;
        b=CvW2Monl3c45LJ0C9c/6zzO9iPp+56a7tmGzL3Q8b8tT5H3htbnanFs+kYzSQZ30gj
         DgkpFHUleCkeb/iIbxZLocl4p6kPQMYJzfNbarTJLmbJWMlhxrsd1JL6+8SAdlEqoGD+
         djyDx74+t2zrIEWENRZqOfLAKKrvWYUaMcoYE+w0opewIhNYA55bdfHKQ/LZ2VRbTcu+
         oDsu2mAeBaMloopQ6768gG4zqhNprRhY3REDfPRog3kRpP6rZuP9ficnj8lKqbtIm6W2
         49WAdSQ1gKq8m8TBhkROkbGhLM/fUHdE0RLATKeNJNtiorC+AlK8Xd91x4Ps5UDqr057
         IxJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrd/K7PlcOJHXKMYZaVadtM1Ub1pdAXGT0Dw7qR4nBqUe4/uL1Ab6qBG8WravR+9pAM3kMwaqSYzTrq1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFgAyqTZKVPRAoeoF7jm4zLUlbB2i5NKifcOaUtvCH+3dG95fO
	agu01VaTqU2gs+fDY8dAXxdNKOIKIgh8i/R6fMYSCdy5wXjhvw5NN3SENQ0HnUkcqhU=
X-Gm-Gg: AR+sD12o3fwcHkWGXgwtoGvrvUqWbvp6X16Agq2uXm4s9Sngbv329Ry5fqw4pM00TDv
	C2FCjLNm8b+DpLj7WC4VdPo4ROYKma01/wQyjzsnI6mOqm6vXCgCoCmoTGVavO9xlD0ipHfDycK
	qhPBEj8OrJpP+yObzNsHVRV8Ll7mLyJP6EFsQ4G/sKtCHyz/y1WTs1/iIzA+6MnwtdHCmQ78h2e
	EnridrboXcZhMv16/MwfYXB6TW31kDmSBI/a+BGO65uvXvDztanEObd34/z41jVhoXv9acJ9CP1
	nQPPlZgM6TzX+N9hwcuGnYI4F5KRbblu3PAn5TNfBClhPohgLzIlFamOPa9xpAxa6z9am7wDVyI
	cpmCfcR7t54SBPGUaK2IG9Yp+GBl0l4+DBIJbOdcgPNi7VZp33Q89hQ4n2F8CWr3qxZpmLB+eHu
	gi9/IrJ4I3Cc1sJ7fcuT0Yt7xzQEfOnLS2h2fSG+YXL2P+t1YLmmKl0fD1HUwEC1Xi7ks93mTKV
	OZbGDWzc8cAIfCcopwHQosI0hMDb6DF5T0fh81fSSo=
X-Received: by 2002:a17:907:97c8:b0:c16:2dc0:e1ed with SMTP id a640c23a62f3a-c20f2e4f66amr10421466b.4.1786481900632;
        Tue, 11 Aug 2026 13:58:20 -0700 (PDT)
Received: from archlinux (77-236-24-72.static.play.pl. [77.236.24.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20f0b0e971sm14686566b.61.2026.08.11.13.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 13:58:20 -0700 (PDT)
From: Denys Papushaiev <denqxotl@gmail.com>
To: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denys Papushaiev <denqxotl@gmail.com>
Subject: [PATCH v1] ASoC: Intel: sof_sdw: Add ASUS UX5406AA SoundWire configuration
Date: Tue, 11 Aug 2026 22:58:10 +0200
Message-ID: <20260811205810.12395-1-denqxotl@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ZenBook S14 UX5406AA has a CS42L43 codec on SoundWire link 3 and four CS35L56 speaker amplifiers on links 1 and 2.

The existing machine table only describes the CS35L56 amplifiers on link 2. As a result, the machine configuration is not matched and SOF falls back to function topology enumeration. That fallback creates duplicate DAI link names and prevents the audio card from being initialized.

Add the missing SoundWire ADR entries and aggregated speaker endpoints for the two CS35L56 amplifiers on link 1. Add a machine-table entry matching links 1, 2 and 3 and reuse the existing CS42L43/CS35L56 topology.

Tested on an ASUS ZenBook S14 UX5406AA with kernel 7.1.8-arch1-3. The SOF card initializes successfully and all four CS35L56 amplifiers are detected and calibrated.

Signed-off-by: Denys Papushaiev <denqxotl@gmail.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index f7694b2a2b02..b62a946062e4 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -92,6 +92,21 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+/* Endpoints for 4-channel CS35L56 configurations (e.g. ASUS ZenBook UX5406AA) */
+static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 2,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_4_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 3,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
@@ -184,6 +199,26 @@ static const struct snd_soc_acpi_adr_device cs35l56_2_lr_adr[] = {
 	}
 };
 
+/*
+ * ASUS ZenBook S14 UX5406AA (Panther Lake) has 4x CS35L56 amps:
+ * 2 amps on SoundWire link 1 (unique_id 2 and 3)
+ * 2 amps on SoundWire link 2 (unique_id 0 and 1)
+ */
+static const struct snd_soc_acpi_adr_device cs35l56_1_lr_adr[] = {
+	{
+		.adr = 0x00013201fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00013301fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_4_endpoint,
+		.name_prefix = "AMP4"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -315,6 +350,30 @@ static const struct snd_soc_acpi_link_adr ptl_cs42l43_agg_l3_cs35l56_l2[] = {
 	{}
 };
 
+/*
+ * ASUS ZenBook S14 UX5406AA: CS42L43 on link 3, CS35L56 x4 on links 1 and 2.
+ * Link 1 carries AMP3 (uid=2) and AMP4 (uid=3).
+ * Link 2 carries AMP1 (uid=0) and AMP2 (uid=1).
+ */
+static const struct snd_soc_acpi_link_adr ptl_cs42l43_agg_l3_cs35l56_l12[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs42l43_3_agg_adr),
+		.adr_d = cs42l43_3_agg_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs35l56_2_lr_adr),
+		.adr_d = cs35l56_2_lr_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56_1_lr_adr),
+		.adr_d = cs35l56_1_lr_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rt722_l0_rt1320_l23[] = {
 	{
 		.mask = BIT(0),
@@ -510,6 +569,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		/* ASUS ZenBook S14 UX5406AA (Panther Lake): 4x CS35L56 */
+		/* on links 1+2, CS42L43 on link 3 */
+		.link_mask = BIT(1) | BIT(2) | BIT(3),
+		.links = ptl_cs42l43_agg_l3_cs35l56_l12,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-cs42l43-agg-l3-cs35l56-l2.tplg",
+	},
 	{
 		.link_mask = BIT(2) | BIT(3),
 		.links = ptl_cs42l43_agg_l3_cs35l56_l2,
-- 
2.55.0

