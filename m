Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280827;
	b=wQKJLOztJsAmEXCPI3XqwmCDob5yQMgW0TzUVQKSIVE9MVVqdqYLfPgdzVPL6Mgco7O/
	 S5guibGaVyfsP9k9qgkqXDG/oDX0jCbpMWZDbsvIx7zntN6MKwPkBXAoFHzLu0rhrW0Da
	 AV7S5BzangrH8n/Ag/pUyP2rgFuoa4GlYMCEKNniXQObVIkCPBxCFpr1WR/Z8t7VYREvE
	 f+oasj+/PneuruB2R/ofofuANqig8mBEQKSgjy9tc470g1p6oDc/kva9b5DFZ/zhQjpqj
	 gj44oOVZMnxHvLZYkPBzUwHgZ28UF3+qJNQsuQMuIMMmMcxPQauvENy7SBpp01jvB9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280827;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=A5WswjkGGYw1Dw5faaGIeyqDL8BtErw2Hw9qk0QrREQ=;
	b=nyDQ/vPCYl3xtORgSNvBP5nsGRZLsJEYzLNofa8vL2o4+LclGKPFccFGlNYXG5fb9jTx
	 2vj/jM/XmyhEdzsS08K8PL+EWZ3fpqmpimBOG5JlU40ZrsnfPpUCWfNahMu+fJfUiZYNK
	 ViXLLNpS9FLtuStAMmsarF3qN9EMZSeo1//NdT1emI8MsiKwnxB8cMcePHsyTyvL62g/Q
	 Nd+VAIO2PECVailkXx+pKKfWiQITt1LBFwxDmeFyiVE7Dy3XC9riFvfd1avHTXKxA7uG8
	 TzpkFyEzRw3FJh4TIM8t8Xbh//70ajE5rUwqSJZ8TINBT9c29FYHQlXf6FPcp/bjn8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=EKjmFUSX;
	arc=none smtp.remote-ip=154.81.10.210
Received: from mail-m10210.netease.com (mail-m10210.netease.com [154.81.10.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E349A606A336
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 03:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E349A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=EKjmFUSX
Received: from Wangqianghua.localdomain (unknown [101.207.32.251])
	by smtp.qiye.163.com (Hmail) with ESMTP id 541859e59;
	Tue, 10 Nov 2026 11:20:15 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	bo liu <bo.liu@senarytech.com>,
	Qianghua Wang <qianghua.wang@senarytech.com>
Subject: [PATCH] ASoC: sn624x: add support for the SN6245 part ID
Date: Tue, 10 Nov 2026 11:20:12 +0800
Message-ID: <20261110032012.711191-1-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa1c378798809d8kunmba4d3a193083a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTh5IVh9NSENCTxpPGB9LTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVSUtMVUhJVUlOSllXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=EKjmFUSXIl5UNLTS/7Jmd+XUJ7ocJXL8vlhvEpiDaWXpF9WXE/RjPKpJNg+G0sJ0zlpNiwrqelB/ZiVTJE0CeglL2bEJVy7CSpkwc2yVATwtiOr8QHqp+fkzBPTb37KuUCD2byd+DKN2Gz3QILBf2BcApIPjW9XfC+kh4akzy+U=; s=default; c=relaxed/relaxed; d=senarytech.com; v=1;
	bh=A5WswjkGGYw1Dw5faaGIeyqDL8BtErw2Hw9qk0QrREQ=;
	h=date:mime-version:subject:message-id:from;

Panther Lake systems such as the MECHREVO YAOSHI report a single Senary
codec on SoundWire link 3 (mfg_id 0x0496, part_id 0x6245, version 0x3).
The SN624x driver, the sdw_utils codec info table and the ACPI match
tables list 0x6242, 0x6244 and 0x6247, but not 0x6245. SOF then logs
"part id 0x6245 is not supported" and falls back to the HDMI-only HDA
machine driver, so the speakers and the headset jack stay silent.

SN6245 is register-compatible with SN6244 for jack, amp and DMIC. Add
the part ID to the SDW driver ID table and the codec info table, and
add MTL, ARL, LNL and PTL match entries. The new entries use
sof-<platform>-dummy.tplg plus function topologies, the same as the
other SN624x parts. PTL matches link 3 / version 3; MTL, ARL and LNL
match link 0, following the existing SN6242/SN6244 entries.

Link: https://github.com/thesofproject/linux/issues/6012
Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
---
 sound/soc/codecs/sn624x-sdca-sdw.c            |  2 +
 .../intel/common/soc-acpi-intel-arl-match.c   |  9 +++
 .../intel/common/soc-acpi-intel-lnl-match.c   |  9 +++
 .../intel/common/soc-acpi-intel-mtl-match.c   |  9 +++
 .../intel/common/soc-acpi-intel-ptl-match.c   |  9 +++
 sound/soc/sdw_utils/soc_sdw_utils.c           | 56 ++++++++++++++++++-
 6 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x-sdca-sdw.c
index c9e690482..1d4e5f27a 100644
--- a/sound/soc/codecs/sn624x-sdca-sdw.c
+++ b/sound/soc/codecs/sn624x-sdca-sdw.c
@@ -1771,6 +1771,8 @@ static void sn624x_sdca_sdw_remove(struct sdw_slave *slave)
 static const struct sdw_device_id sn624x_sdca_id[] = {
 	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6242, 0x3, 0x1, 0),
 	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6244, 0x3, 0x1, 0),
+	/* SN6245 is register-compatible with SN6244 (jack/amp/dmic). */
+	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6245, 0x3, 0x1, 0),
 	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6247, 0x3, 0x1, 0),
 	{ }
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 1d5f6677b..2fe33280b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -653,9 +653,11 @@ static const struct snd_soc_acpi_link_adr _sym[] = {			\
 
 SN624X_ARL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
 SN624X_ARL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
+SN624X_ARL_SINGLE_ADR(sn6245_single_adr, 0x0000000496624501ull);
 
 SN624X_ARL_LINK(arl_link_sn6242, sn6242_single_adr);
 SN624X_ARL_LINK(arl_link_sn6244, sn6244_single_adr);
+SN624X_ARL_LINK(arl_link_sn6245, sn6245_single_adr);
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 	{
@@ -779,6 +781,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-arl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0),
+		.links = arl_link_sn6245,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-dummy.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_sdw_machines);
diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index a9fef394f..5e90e17a9 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -738,9 +738,11 @@ static const struct snd_soc_acpi_link_adr _sym[] = {			\
 
 SN624X_LNL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
 SN624X_LNL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
+SN624X_LNL_SINGLE_ADR(sn6245_single_adr, 0x0000000496624501ull);
 
 SN624X_LNL_LINK(lnl_link_sn6242, sn6242_single_adr);
 SN624X_LNL_LINK(lnl_link_sn6244, sn6244_single_adr);
+SN624X_LNL_LINK(lnl_link_sn6245, sn6245_single_adr);
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
@@ -877,6 +879,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-lnl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0),
+		.links = lnl_link_sn6245,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-dummy.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 704b4e0d2..10c38bc4f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -1349,9 +1349,11 @@ static const struct snd_soc_acpi_link_adr _sym[] = {			\
 
 SN624X_MTL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
 SN624X_MTL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
+SN624X_MTL_SINGLE_ADR(sn6245_single_adr, 0x0000000496624501ull);
 
 SN624X_MTL_LINK(mtl_link_sn6242, sn6242_single_adr);
 SN624X_MTL_LINK(mtl_link_sn6244, sn6244_single_adr);
+SN624X_MTL_LINK(mtl_link_sn6245, sn6245_single_adr);
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -1574,6 +1576,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-mtl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0),
+		.links = mtl_link_sn6245,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-dummy.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_sdw_machines);
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index a5896796a..467709def 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -495,10 +495,12 @@ static const struct snd_soc_acpi_link_adr _sym[] = {			\
 
 SN624X_PTL_SINGLE_ADR(sn6242_single_adr, 0x0003300496624201ull);
 SN624X_PTL_SINGLE_ADR(sn6244_single_adr, 0x0003300496624401ull);
+SN624X_PTL_SINGLE_ADR(sn6245_single_adr, 0x0003300496624501ull);
 SN624X_PTL_SINGLE_ADR(sn6247_single_adr, 0x0003300496624701ull);
 
 SN624X_PTL_LINK(ptl_link_sn6242, sn6242_single_adr);
 SN624X_PTL_LINK(ptl_link_sn6244, sn6244_single_adr);
+SN624X_PTL_LINK(ptl_link_sn6245, sn6245_single_adr);
 SN624X_PTL_LINK(ptl_link_sn6247, sn6247_single_adr);
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
@@ -609,6 +611,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-dummy.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(3),
+		.links = ptl_link_sn6245,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-dummy.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_link_sn6247,
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 7a19de75f..fefc4d7f5 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1492,8 +1492,9 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	/*
-	 * Senary SN6242/6244/6247: same SDCA jack/amp/mic topology; only part_id
-	 * differs. name_prefix stays "sn624x" for UCM/DAI naming.
+	 * Senary SN6242/6244/6245/6247: same SDCA jack/amp/mic topology; only
+	 * part_id differs. SN6245 is register-compatible with SN6244.
+	 * name_prefix stays "sn624x" for UCM/DAI naming.
 	 */
 	{
 		.vendor_id = 0x0496,
@@ -1546,6 +1547,57 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 3,
 	},
+	{
+		.vendor_id = 0x0496,
+		.part_id = 0x6245,
+		.name_prefix = "sn624x",
+		.ignore_internal_dmic = true,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "sn624x-sdca-aif",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_senary_sdca_jack_init,
+				.exit = asoc_sdw_senary_sdca_jack_exit,
+				.rtd_init = asoc_sdw_senary_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "sn624x-sdca-aif2",
+				.component_name = "sn624x",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_senary_amp_init,
+				.exit = asoc_sdw_senary_amp_exit,
+				.rtd_init = asoc_sdw_senary_sdca_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+				.quirk = SOC_SDW_CODEC_SPKR,
+				.quirk_exclude = true,
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "sn624x-sdca-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_senary_dmic_rtd_init,
+				.widgets = sn624x_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(sn624x_dmic_widgets),
+				.controls = sn624x_dmic_controls,
+				.num_controls = ARRAY_SIZE(sn624x_dmic_controls),
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
+			},
+		},
+		.dai_num = 3,
+	},
 	{
 		.vendor_id = 0x0496,
 		.part_id = 0x6247,
-- 
2.43.0

