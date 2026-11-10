Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282468;
	b=sXdqS4Gvb5tX/eh5kEc6QRFRct7tJYvKBcVR0qKHYiZPiMQKepFoX8tXUghGwdNYI5hh
	 D9AKiZUVVYBdaae+uBJHST0gE9xuq2yaPCvUADlmlf3SEOJ3M4uxJvPsiFn0FwhV8LO2H
	 wfVoiJI6E68OscvQeqSpVvDJ7nQye3FNT9ejzV8ppYxJ1bcmsSGHB5NXUPmQGbYTpNvMa
	 Q2BBVyi8NrW+7Qobxkxy+MxJwFv+k1b9zpjdxSgX9tiMei3kSaDuQtNXURgMUPlx9s9O6
	 8nJbmTsCCw50Vgr+fajO4u47+XeeAUTCnbNWf11RYFnvgs5V53+7uGVrgKpwAcfdVSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282468;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=GuKqB2jgP2WlVwybpbvi1+IVbHjunNSBvyjU7+rYPNc=;
	b=utJRllww47rmAOOJo/uYHs5hFB3JTk1AZS0QFfyUEJz4RbX/Q/QYU+5YUz67rJvkU1Jq
	 JjFox5oWzGNjS/qRl8K9NvkuL0GDpex1f3k7Rb4KE2++MbqvG3Np2jedU098r83j5Hw+r
	 nC2kedo52TSZzfNDx9DPOWWkFYsv4dX806DYUXcBgjDoO2FSS9fBKp8P0hLAgJt5QU+uu
	 odFnNUdMwe+GnEe23iCddpPMPrK9wCRmIdGrJg6XO+3dJqSUO/fOOyrkvi1YD2VHcA/zs
	 DDMKGlyM4MOc3U+3GBJAB6SVBmzciVW6f34Auq8wGUJSRI2BLjVew6iBHv3YVDRXLbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b="Oxv058/+";
	arc=none smtp.remote-ip=156.224.81.31
Received: from mail-m8131.xmail.ntesmail.com (mail-m8131.xmail.ntesmail.com [156.224.81.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A443B606A32A
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 03:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A443B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=Oxv058/+
Received: from Wangqianghua.localdomain (unknown [118.113.94.0])
	by smtp.qiye.163.com (Hmail) with ESMTP id 541949453;
	Tue, 10 Nov 2026 11:47:35 +0800 (GMT+08:00)
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
Subject: [PATCH v2] ASoC: sn624x: add support for the SN6245 part ID
Date: Tue, 10 Nov 2026 11:47:36 +0800
Message-ID: <20261110034736.742465-1-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110032012.711191-1-qianghua.wang@senarytech.com>
References: <20261110032012.711191-1-qianghua.wang@senarytech.com>
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
X-HM-Tid: 0aa1c391828609d8kunm83f7ebf530d5f1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTxhKVkxDT0tLS0tDShhMHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkNVSkpIVUJPVUtZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Oxv058/+KEi6A8q4lKAlWhaVia7dRQ6SaSo+stvsxEV+skO4jFI5B9xeQ4FcgiVtms1EAJadv1ynLfvlLpkd13bL0AbjWr61D4ixf3e+yzVjuo9d1ZZPx0il0qS48uI5ReKUyDhV7qpX9xim/LIiYA0cpCm6AMYSdYA7dUvyNZ4=; s=default; c=relaxed/relaxed; d=senarytech.com; v=1;
	bh=GuKqB2jgP2WlVwybpbvi1+IVbHjunNSBvyjU7+rYPNc=;
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
other SN624x parts.

PTL matches link 3. MTL, ARL and LNL stay on link 0. On every platform
the _ADR version nibble is 0x3, matching the silicon SoundWire version.
snd_soc_acpi_sdw_link_slaves_found() does not treat version 0 as a
wildcard, so the existing MTL, ARL and LNL SN6242 and SN6244 entries
are corrected the same way.

Link: https://github.com/thesofproject/linux/issues/6012
Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
---
Changes in v2:
- Encode SoundWire version 0x3 in the ARL, LNL and MTL _ADR values
  (0x0000300496624x01). Version 0 is not a wildcard in
  snd_soc_acpi_sdw_link_slaves_found(), so those entries never matched
  a SN624x codec. Link stays 0. PTL was already link 3 / version 3.
- Correct the existing SN6242 and SN6244 entries on ARL, LNL and MTL
  the same way.

 sound/soc/codecs/sn624x-sdca-sdw.c            |  2 +
 .../intel/common/soc-acpi-intel-arl-match.c   | 18 ++++--
 .../intel/common/soc-acpi-intel-lnl-match.c   | 18 ++++--
 .../intel/common/soc-acpi-intel-mtl-match.c   | 18 ++++--
 .../intel/common/soc-acpi-intel-ptl-match.c   |  9 +++
 sound/soc/sdw_utils/soc_sdw_utils.c           | 56 ++++++++++++++++++-
 6 files changed, 107 insertions(+), 14 deletions(-)

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
index 1d5f6677b..bddeb1225 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -603,8 +603,9 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_machines);
 
 /*
  * Senary SN624x on Arrow Lake: one multi-function device on link 0.
- * Separate mach entries per part ID (adr_d[] is AND, not OR). Amp endpoint
- * is aggregated like the generic SOC_SDW_DAI_TYPE_AMP shape from
+ * Separate mach entries per part ID (adr_d[] is AND, not OR). ADR version
+ * nibble 0x3 matches the silicon SoundWire version. Amp endpoint is
+ * aggregated like the generic SOC_SDW_DAI_TYPE_AMP shape from
  * find_acpi_adr_device().
  */
 static const struct snd_soc_acpi_endpoint sn624x_endpoints[] = {
@@ -651,11 +652,13 @@ static const struct snd_soc_acpi_link_adr _sym[] = {			\
 	{}								\
 }
 
-SN624X_ARL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
-SN624X_ARL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
+SN624X_ARL_SINGLE_ADR(sn6242_single_adr, 0x0000300496624201ull);
+SN624X_ARL_SINGLE_ADR(sn6244_single_adr, 0x0000300496624401ull);
+SN624X_ARL_SINGLE_ADR(sn6245_single_adr, 0x0000300496624501ull);
 
 SN624X_ARL_LINK(arl_link_sn6242, sn6242_single_adr);
 SN624X_ARL_LINK(arl_link_sn6244, sn6244_single_adr);
+SN624X_ARL_LINK(arl_link_sn6245, sn6245_single_adr);
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 	{
@@ -779,6 +782,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
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
index a9fef394f..ef021771e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -688,8 +688,9 @@ static const struct snd_soc_acpi_link_adr lnl_sdw_rt712_vb_l2_rt1320_l1[] = {
 
 /*
  * Senary SN624x on Lunar Lake: one multi-function device on link 0.
- * Separate mach entries per part ID (adr_d[] is AND, not OR). Amp endpoint
- * is aggregated like the generic SOC_SDW_DAI_TYPE_AMP shape from
+ * Separate mach entries per part ID (adr_d[] is AND, not OR). ADR version
+ * nibble 0x3 matches the silicon SoundWire version. Amp endpoint is
+ * aggregated like the generic SOC_SDW_DAI_TYPE_AMP shape from
  * find_acpi_adr_device().
  */
 static const struct snd_soc_acpi_endpoint sn624x_endpoints[] = {
@@ -736,11 +737,13 @@ static const struct snd_soc_acpi_link_adr _sym[] = {			\
 	{}								\
 }
 
-SN624X_LNL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
-SN624X_LNL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
+SN624X_LNL_SINGLE_ADR(sn6242_single_adr, 0x0000300496624201ull);
+SN624X_LNL_SINGLE_ADR(sn6244_single_adr, 0x0000300496624401ull);
+SN624X_LNL_SINGLE_ADR(sn6245_single_adr, 0x0000300496624501ull);
 
 SN624X_LNL_LINK(lnl_link_sn6242, sn6242_single_adr);
 SN624X_LNL_LINK(lnl_link_sn6244, sn6244_single_adr);
+SN624X_LNL_LINK(lnl_link_sn6245, sn6245_single_adr);
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
@@ -877,6 +880,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
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
index 704b4e0d2..1b4483c7b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -1299,8 +1299,9 @@ static const struct snd_soc_acpi_link_adr mtl_cs35l63_x2_link1_link3_fb[] = {
 
 /*
  * Senary SN624x on Meteor Lake: one multi-function device on link 0.
- * Separate mach entries per part ID (adr_d[] is AND, not OR). Amp endpoint
- * is aggregated like the generic SOC_SDW_DAI_TYPE_AMP shape from
+ * Separate mach entries per part ID (adr_d[] is AND, not OR). ADR version
+ * nibble 0x3 matches the silicon SoundWire version. Amp endpoint is
+ * aggregated like the generic SOC_SDW_DAI_TYPE_AMP shape from
  * find_acpi_adr_device().
  */
 static const struct snd_soc_acpi_endpoint sn624x_endpoints[] = {
@@ -1347,11 +1348,13 @@ static const struct snd_soc_acpi_link_adr _sym[] = {			\
 	{}								\
 }
 
-SN624X_MTL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
-SN624X_MTL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
+SN624X_MTL_SINGLE_ADR(sn6242_single_adr, 0x0000300496624201ull);
+SN624X_MTL_SINGLE_ADR(sn6244_single_adr, 0x0000300496624401ull);
+SN624X_MTL_SINGLE_ADR(sn6245_single_adr, 0x0000300496624501ull);
 
 SN624X_MTL_LINK(mtl_link_sn6242, sn6242_single_adr);
 SN624X_MTL_LINK(mtl_link_sn6244, sn6244_single_adr);
+SN624X_MTL_LINK(mtl_link_sn6245, sn6245_single_adr);
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -1574,6 +1577,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
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

