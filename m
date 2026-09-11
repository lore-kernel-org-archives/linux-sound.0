Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1A46C851
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117873; cv=none; b=nmEmiPn/83RTxnwnuhVCdmkAZMbqQ7XasbFPVGin2Wj5iKECmb1r4GfoqCJKs5tnrpBjJnusHD/UbhTy/ksFjwEv8RZAOFhkMJu2I8TviR/M/+zxVvGkk35kBaU+Z46XYpSWtx7ir7glsoQMp28Pt4O2li42b0dKgiNUiTp+Kus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117873; c=relaxed/simple;
	bh=qzB5xYjZudpXmyra4RIP7KgCNC17z3/27DkbVpLf9Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tVIY/EZibCLCnMPZVjgZG9y5geDGAcv+6pCFirhqT4sdIlf6oMKcPsqFu49BnzZfvmbht2yY+4r8JlaHDYhuIe5DzfekzJu6gbShZIy6b3v5H3Ygh1ZODvHunAkKlaCt3NUniBtmENIM1Npdm5RNNXafyiNEJ3gf096+KVZCEUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qEYHDK03; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qEYHDK03"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so378129f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 02:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789117870; x=1789722670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FjWAgtoFbX+Dl7d9AIeU+Ccr9woc+xQZQf6E8IGydFc=;
        b=qEYHDK03Qzz0pwLTGqHJ+reMo5iCcRJgfD+IxfyphkvDPM/EN28knBC6BihUILfB5Y
         QngspixBTCf5nGppk3ojExehZe/mBsLrTudVXWdNCK2aCRsC9nzjrDuOeM+M3BI8RdOy
         G3zmaDmEaDWwVAp4oPQetlGLYvr1G7rtnbEBCdR/PJ6pULx6tRlrEFIfXe+KTABApqfp
         dkIQnwPqEAHFnK7dVXp3WMq9hfqnqze52seQ6VoJs6pg42d6qH3J7iDziRnxAr5aYhTI
         qAoTFkvrYmyfQ5+3wbRNwe+lju0+GbJBLX6fXw+5dR5xK4vzSAPmxKYuWuivov6iAtaX
         WH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117870; x=1789722670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FjWAgtoFbX+Dl7d9AIeU+Ccr9woc+xQZQf6E8IGydFc=;
        b=T0gPe5fd5GNUEANNcEZH+3l+1lZoS/9rNy2UQHLl0H7NxvnO5pobC9ORzbKx6tEAP4
         +sJqoBohVdYPpHanYrwTeK0GwG3OC5reVhcvFS1DwBNjgY/zoUYV5y8iZ0ecnNfPAPp7
         aebIbc3eHlUP2AjPxXxcRfPqz4Ov0yGlkTVUindfK4xyvgthYQcwx3dxHVfkZFipFotC
         uo5HxVVxPYmP28hoppTznspw+iko0Ha3LsrBaIViyHWbG6sYYwTGl72rSWf5jOplQTlN
         13N++dxurr+HI3IFDmncKR9nZ2Kjs4Zljaog4nJrAbjoyBGzQ0uYxzYCDuvMUH5S+zoi
         UwiA==
X-Forwarded-Encrypted: i=1; AKwUvByZrjvv4gGRJVJOgJpgTJTAHtg3Oyk/z/i0aF3Tk4MAqfMMpcKUT2lU3AEhyQMX0MYH4qzaVqBa7i797w==@vger.kernel.org
X-Gm-Message-State: AFuF++nDBoiIWF45oN3oPL33FCfg1oA33Gvq+sngMSinHdG2qaavwy1j
	ypsyWWEAOxGECRpl0qsLlszc5SzeCeZJtSiziEqwDRD4031WUWUTLqsz
X-Gm-Gg: AYBFou0IF81KPcbzFPtqZFRoWr86JtzlUg/4Sgvmdh3odpAJMDtf3fzmZHl5HPf+zbB
	kDwCg1WAoS+rpJVqZy332oQpH0kbeR0u8fx9s99tfX6LT9G74iIbxwnRmTmpbK5kabPkISuvyYs
	7aKXXLsSNzhv4ORzVwOMx/RMioBuUBF3fY5+w8Y1UtZvbTBXmnY4ZlW3bywtUPcTMbAS5TQ8OdQ
	7uJhFmAmGtXn56a1RC7GCFWOUjeNsDIkyXkNq87RXo2S4Y6VpWpm92aU+KidjddBI95BdcMjhf/
	z8v24I5MmWzDa+gBx7oc1iD2Zela1ib97QVpg+1egCxkcSNxB6N+z3PcF7V9jLUwR840fqvoIt6
	vq8ed2i1o/s80gWx3tyhszE2k3g2vlMDulMUR2USmq7ZgIjka/D5Vn84Iemo8hokDADW0C0xfFO
	1j6IU2Lfauq/wZvg6tUk4/xFUA9+VmyYf+A31N3gXSf+JxTQ5DxnlEYwIrWMySoi4KzYUM1KGX3
	fV3oAVkzgfNvSwD86v9Gp4ZAL6zKzJemPvn+pZOW+UoQQ+qPMawFaCKx2wNoyR/S9CNCA7ReYax
	ghu5
X-Received: by 2002:a05:6000:2f84:b0:485:b148:aa2a with SMTP id ffacd0b85a97d-486eb342209mr6494717f8f.23.1789117869546;
        Fri, 11 Sep 2026 02:11:09 -0700 (PDT)
Received: from TIM.homenet.telecomitalia.it (host-87-20-169-207.retail.telecomitalia.it. [87.20.169.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ebe4sm3872075f8f.14.2026.09.11.02.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:11:09 -0700 (PDT)
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
Subject: [PATCH] ASoC: Intel: soc-acpi: add SoundWire config for ASUS P5405CAA
Date: Fri, 11 Sep 2026 11:10:35 +0200
Message-ID: <20260911091035.221224-1-antoniodilorenzonap@gmail.com>
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

RT721 AIF1 is used for the headset jack and AIF3 for the DMIC,
while AIF2 is unused when external speaker amplifiers are present.

Use function topology selection for this configuration.

Signed-off-by: Antonio Di Lorenzo <antoniodilorenzonap@gmail.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 756bbf82a326..1035d61f65e9 100644
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
+		/* Function topologies only; no monolithic fallback. */
+		.sof_tplg_filename = "sof-ptl-dummy.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(0) | BIT(2) | BIT(3),
 		.links = ptl_rt722_l0_rt1320_l23,
-- 
2.55.0

