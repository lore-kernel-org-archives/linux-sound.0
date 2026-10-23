Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792753137;
	b=3jyb3zqtUnX4hPK+cPGGVlHtsNPbnTR1lIwU0kdHYX0gpPcPh29YW9Y/53NxiRluPxEJ
	 B0vBaLxRrYoF6pvENwC+s+K/TtDrgNTZCZSg6DdvJfulPN0sDvOjzL4VqxrEduYocT1ky
	 wJIbv6MKj7THYLaXBUMyj8JRdvh6hL2SCMWXgwjyyAbM4pXvakKaf8YjwzcZlu/FaQjiI
	 n5S/LMM1A3yKIiGDGVZGbKLfvgbIoxi8VnQI/+/U/YhbMmMKNL/Y/e0HFOp1iPKEHOk7z
	 scVcdtBwoc7wzzNYqGwWgUSzkuY8yBpztZyxBz18oIIN0gR8Ws3Cm+UW9O6EgEEjj4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753137;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+sICo6EXhd+jRzAeUQACtC0lcv28nFCR/Ddwe8EaUWI=;
	b=4R9Pn6rjU4mS+rlgFY781ZXU1QQwV+4EtbxQWoZroZQMtxSfC5TB/vbnTf4JySoRd+ji
	 n4fvECIXzspKHRCCGiZ/zhIonC28lcSiawLJPl93lIQE1+Xh9//6VTSce8W2htVNwOd8O
	 iTNzQKr6eG3c8/aPJ52w5zrg66KpVGVYNW1FVHgrMV3wX90ykg7CYWKJa+cUbpSQAuEba
	 rShP4EjY9XheqSk6PBRRcYDEgKZ9wi6stFzbGvoSkyNT29g4fL6hWk7FTDeIxSpX8NHED
	 kgzhAkNsgNWcOD01lzEa/5+gUVnHKlPnPT+h8rwjWoR5WzPCrm0lXq/EIbh0T6FjrfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BWZbOxgL;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6C606A31A
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F6C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BWZbOxgL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792753137; x=1824289137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T6kMX53SEFwbHuiVt4gWVhan17tdyivfd/WS44ld4II=;
  b=BWZbOxgL+dvhVXBYhiXRqTnbZMsI+cnb2wf5I/yxRZTfhZwEXTaqgsbg
   TQqDqUfcE22Nnf7o1PV70ROGZPPMuiY2zLcqY++1Wd1kl0aJgVV0/tAXv
   TXXNCJJo+Z5cl/UGJhv7HhP6/1UdUA82BvcrBEyNw4C76AQ+JjJQEN0/5
   qaXDsT6mRbw+w/kn50Ae7aG0XRpOqhPgRyqVhnJ65g7QPoYUDCcm1UbHF
   Ext8T1e08PRnUETYXp49YUoSUY4E8J6L+rYR72TY7X+ioNouqGlZcN+mf
   QfcswbXQPB1IHJ6VbJjvWDQVR3ke3AmP7Z4cwfmt+Qo6NOeKz8gE3Z6oq
   Q==;
X-CSE-ConnectionGUID: rCpioKjUQ8+HAI+AfiPJsA==
X-CSE-MsgGUID: eTXyaiirQnyFn3qj1Y4ghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1605844"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1605844"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:58:57 -0700
X-CSE-ConnectionGUID: hTNPxc1gQdaQ2yfYbGYsZg==
X-CSE-MsgGUID: PAYeo7LuQH66Pl9dkQDnig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3681775"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:58:55 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH RESEND 2/2] ASoC: Intel: soc-acpi-intel-arl-match: Add RT713 + dual RT1320 support
Date: Fri, 23 Oct 2026 18:58:43 +0800
Message-ID: <20261023105843.2257167-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023105843.2257167-1-yung-chuan.liao@linux.intel.com>
References: <20261023105843.2257167-1-yung-chuan.liao@linux.intel.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: JJ Gault <jgault87@gmail.com>

Add a SoundWire machine-driver match entry for boards with an RT713
(SDCA "VB" jack/dmic variant) on link 0 and two RT1320 speaker amps
sharing link 2 (distinguished by unique_id 0/1, left/right).

This exact codec pairing is already supported on Panther Lake
(ptl_sdw_rt713_vb_l2_rt1320_l13) and Lunar Lake
(lnl_sdw_rt713_vb_l2_rt1320_l13); Arrow Lake was missing the
corresponding entry, so affected boards fell back to the generic
skl_hda_dsp_generic driver and only exposed HDMI outputs.

Confirmed on an MSI Raider 16 Max HX B2WI (MS-2651): the kernel now
correctly identifies the hardware and no longer falls back to the
generic HDA driver.

No dedicated topology has been built for this link0/link2 layout yet,
so sof_tplg_filename is set to a placeholder ("sof-arl-dummy.tplg")
rather than pointing at an existing but unrelated topology, per review
feedback.

Signed-off-by: JJ Gault <jgault87@gmail.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 09bb7302ed25..310c4b77c4b7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -70,6 +70,23 @@ static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
+	/* Jack Endpoint */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* DMIC Endpoint */
+	{
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs35l56_2_lr_adr[] = {
 	{
 		.adr = 0x00023001FA355601ull,
@@ -301,6 +318,35 @@ static const struct snd_soc_acpi_adr_device rt1320_2_single_adr[] = {
 	}
 };
 
+/*
+ * MSI Raider 16 Max HX B2WI (MS-2651): RT713 (jack/dmic, "VB" SDCA variant)
+ * on link 0, two RT1320 speaker amps sharing link 2 (unique_id 0 = left,
+ * unique_id 1 = right).
+ */
+static const struct snd_soc_acpi_adr_device rt713_vb_0_adr[] = {
+	{
+		.adr = 0x000030025D071301ull,
+		.num_endpoints = ARRAY_SIZE(jack_dmic_endpoints),
+		.endpoints = jack_dmic_endpoints,
+		.name_prefix = "rt713"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1320_2_lr_adr[] = {
+	{
+		.adr = 0x000230025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1320-1"
+	},
+	{
+		.adr = 0x000231025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1320-2"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr arl_n_mrd_es9356_link1[] = {
 	{
 		.mask = BIT(1),
@@ -454,6 +500,20 @@ static const struct snd_soc_acpi_link_adr arl_rt711_l0_rt1316_l3[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr arl_rt713_vb_l0_rt1320_l2[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_vb_0_adr),
+		.adr_d = rt713_vb_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1320_2_lr_adr),
+		.adr_d = rt1320_2_lr_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr arl_rt722_l0_rt1320_l2[] = {
 	{
 		.mask = BIT(0),
@@ -626,6 +686,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-arl-cs42l43-l0-cs35l56-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0) | BIT(2),
+		.links = arl_rt713_vb_l0_rt1320_l2,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-arl-dummy.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(0) | BIT(2),
 		.links = arl_rt722_l0_rt1320_l2,
-- 
2.43.0

