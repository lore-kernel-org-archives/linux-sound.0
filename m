Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D32366541
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119954; cv=none; b=QEqMAYybdHbt8206rA1UAnnZfgVKuSWdEnFjYdQqJQHyu3pdyULt9mFYrex/9jeLqPmNvxoiWF7NvHT65MrF1gFT1Pl/b4wS9VH5hxgW56DKBHulg8+ycit2ZfktfHOQvj9dPw+2l0Ofq4DbI5Y86O6M2/s5ngCIbX6aAfkNgog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119954; c=relaxed/simple;
	bh=dytEZOn1FDj2SMJe8538PIZbHoiQaaz5IHeNj6uVCQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JwkGc7hLrtKYJ1Xrtx3UcYQKY1KUxGH2iTLCCmNV1fn7LCvG7HQvUcNOdoyqVaNp0dvUWaiE9Pz/LKLMsboivoTJdZdWhyrXGDRvKST6PIahYvwWHVJqzrqHrqccRpefKajOkTSUZFznnlKXXqmWwvhwP5vgZSWVY9hmt0KNL2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etVGKNx0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etVGKNx0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so519983f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 02:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789119951; x=1789724751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=39DANzm2wDydTuTG7bVtQ+9QaeAwoGihngbn0SxWnoM=;
        b=etVGKNx0UHQBdFWJ8LT/4jki8XGtiiN+35/sMOFM7QP6B1VAVUIejp4OzieSgcyX7S
         +BVD0oxqztiXPtJ5Nk+6+xoaofa9LkUHqlhCcXRSPM7BtYXODb/6WvSbdVNJ8VRX8fHr
         8dJN3yISgl2TgOvyAQ8MHuXrjYi7gk66PwWkfCZwRWM/BaIZKD4iUUTM+bSroVJjzdGo
         c0Y1KlBThfSo2/IUjj+OJiOTLsbk44fNnAgAFZOdM2L8TOfIIFi+lu8tWrpUky3odAcH
         6ZcoCCSEZUA3M3iWbK2fBCz4idD7q84kQA5RNP+abmJcPnND6Vwy7PrFPyIikdTNWf+C
         Rw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789119951; x=1789724751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39DANzm2wDydTuTG7bVtQ+9QaeAwoGihngbn0SxWnoM=;
        b=TtJmwEqqrynEqLil3jZ4N8Rc/J6aZl0KYhZUpv2dqyehV8anMo2K4uaWy8NbXPPK+0
         JWVqoWTmXu6e7uOig83EajZlatYgfG8DjKVRVL0Q8QO4fUa0OhkruxTyqAR5jeS1iaXQ
         7zjFlh7Ka69h50mRYsB1i2I1oxM/gxXGH2HmiNInyOBgvCuUupMiFT9ATKFyrDuD9n7e
         gcwBu4sbBNt8q/xECtwOkP2QMcGMaFaPOLcdizjHd6kTsrv6FGvxr9B+JaFl5Obqi6/8
         5Xi42j0rnoEJ0mf8e7wdM0Wl08BlRIzNDdz5RDabi77XfjEOQdcNgW2+NSYtZdVwmi7L
         aJWw==
X-Forwarded-Encrypted: i=1; AKwUvBx15EsqAuO9OS8e4zQzX6dqjk8cWXLuOQBV/o0MqDUm7jqBRWM1cM5M062KiZp2NC8UKNIhjWfSKtk1Zw==@vger.kernel.org
X-Gm-Message-State: AFuF++kFbndSXlHwAIt1etoLZc/Q8G6IfEOkC4n15Qx3PkiVAMmyWE3I
	bPHIMOklbHh37MQr5dnjtxKpCp77XL4AdDLzHdUzX+eDIBo4naYF/SXO
X-Gm-Gg: AYBFou2u4g5THnR7w8E9/FTFCuMOcsrTo5Fb15P4zCVBJQpSTEiaGWhslPQPNbXUxr6
	8jii7AmvXQ0BmRUITvmFNzAv0VgF4hHuZk0rRlexsNkthyHmz0g3356XP4NxGrZERqCU6wCmPXl
	7EiuW3R4Px6Pr/z6zRU0V2qmHTgvR3h/oNspyoeADI3cMFrfwuKTV0CkmjzFSxaZwjBKuX1bpJE
	Ko0SJ2jNuCSNAqfRIlVnTeu0o0Ij5Pg6xLKM1kRRf8jz0HeP84u+bc/Nx+Iv8I9ayf58wlcCjXH
	NmP0MyIpvrIi1Fa7xxLgVherulHA4M20ILd5J4nkULEUBhFr4XnrpJ1eTtAAjCVfSZQfiikDj8+
	LclmMCiTifNU/bit4V0Bw06zwO1sHJRFouVlEUaJP2bfpuZTZax7AmbozFZj1aLX0NXrc787PKY
	dZNafsWje8JJAfQQk8Hmqq53yQa+1cS3vy9hjNiztZgJVM5cAhE2ylH/zH+cBADATcSAhAReZ3l
	pQyYoTDYfW9XZMaKL9fM9gU/AKadZdipgoct5BusrZ0cfrCVQb5Ou00SCh6W6p/XmnUagrpuiar
	dfS7Wokuakpofk4=
X-Received: by 2002:adf:f9d2:0:b0:486:e6a2:2d7c with SMTP id ffacd0b85a97d-486eb31b1ccmr5619433f8f.15.1789119951201;
        Fri, 11 Sep 2026 02:45:51 -0700 (PDT)
Received: from TIM.homenet.telecomitalia.it (host-87-20-169-207.retail.telecomitalia.it. [87.20.169.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm4588470f8f.4.2026.09.11.02.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:45:50 -0700 (PDT)
From: Antonio Di Lorenzo <antoniodilorenzonap@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	Antonio Di Lorenzo <antoniodilorenzonap@gmail.com>
Subject: [PATCH v2] ASoC: Intel: soc-acpi: add SoundWire config for ASUS P5405CAA
Date: Fri, 11 Sep 2026 11:45:39 +0200
Message-ID: <20260911094539.237430-1-antoniodilorenzonap@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ExpertBook P5 P5405CAA uses two TAS2783 speaker
amplifiers on SoundWire link 1 and an RT721 codec on link 3.

Add the corresponding SoundWire ADR devices and link description
so the sof_sdw machine driver can select the correct configuration.

There is no monolithic topology for this machine. Use the
sof-ptl-dummy.tplg sentinel so SOF requires function topologies
instead of falling back to a monolithic topology. The platform
name in the sentinel is also used by sof_sdw_get_tplg_files() when
building the function topology filenames.

Signed-off-by: Antonio Di Lorenzo <antoniodilorenzonap@gmail.com>
---
Changes in v2:
- Drop the RT721 AIF description from the commit message.
- Explain why the machine relies on function topologies and uses the
  sof-ptl-dummy.tplg sentinel instead of a monolithic topology.
- Clarify the purpose of the dummy topology name in the match table.

Link to v1: https://lore.kernel.org/r/20260911091035.221224-1-antoniodilorenzonap@gmail.com/

 .../intel/common/soc-acpi-intel-ptl-match.c   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 756bbf82a326..510e4b204fe6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -109,6 +109,23 @@ static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_endpoint rt721_jack_dmic_endpoints[] = {
+	/* Jack Endpoint (AIF1) */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* DMIC Endpoint (AIF3); AIF2 is unused with external speaker amps */
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
@@ -301,6 +318,46 @@ static const struct snd_soc_acpi_adr_device rt1320_3_group2_adr[] = {
 	}
 };
 
+/* TAS2783 stereo speaker pair on SoundWire link 1. */
+static const struct snd_soc_acpi_adr_device tas2783_1_adr[] = {
+	{
+		.adr = 0x00013c0102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "tas2783-1",
+	},
+	{
+		.adr = 0x0001390102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "tas2783-2",
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt721_3_adr[] = {
+	{
+		.adr = 0x000330025d072101ull,
+		.num_endpoints = ARRAY_SIZE(rt721_jack_dmic_endpoints),
+		.endpoints = rt721_jack_dmic_endpoints,
+		.name_prefix = "rt721",
+	},
+};
+
+/* ASUS ExpertBook P5 P5405CAA */
+static const struct snd_soc_acpi_link_adr ptl_tas2783_l1_rt721_l3[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(tas2783_1_adr),
+		.adr_d = tas2783_1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt721_3_adr),
+		.adr_d = rt721_3_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_cs42l43_agg_l3_cs35l56_l2[] = {
 	{
 		.mask = BIT(3),
@@ -487,6 +544,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt713-l3-rt1320-l1.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(1) | BIT(3),
+		.links = ptl_tas2783_l1_rt721_l3,
+		.drv_name = "sof_sdw",
+		/* "dummy" tells SOF to require function topologies without fallback. */
+		.sof_tplg_filename = "sof-ptl-dummy.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(0) | BIT(2) | BIT(3),
 		.links = ptl_rt722_l0_rt1320_l23,
-- 
2.55.0

