Received: from mail-m127168.xmail.ntesmail.com (mail-m127168.xmail.ntesmail.com [115.236.127.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5709337AA91
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 07:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248246; cv=none; b=mzo3ExUg12H4SM30/nhX9oU43pcs3IlLOoDPd/kkzfgBj4IvjQnQE/G825viTO/I6cy3qml+hyjp/dXR0vQa0YieNiQ8zdwc7ejjskONQoSxZTTRCUW/rWI8qUAbF8RKBgtqNZ88PqiXBb69jDLi9h7e7+POau2hoIRf0OJZ5I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248246; c=relaxed/simple;
	bh=RKj4l0S2vzPBMy9AGpIx+WEsbOkE89aqT9yhsRrvSDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDxmvLZUEM3j+EtfaULFqW/loFsCUcvEGsHYJHwV3yftEp8NVwBOhP9kszAhHcGpeSfM3UpoTo14MjfZxGIg1oGy13Ap1xWs3F9i/SgzNJMRvHkyE7YwnZMCADp1lzqBJ0g/fUbVd5fNM1mT1D6IYozWeyacULXow37mb9gDQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=CNIn040/; arc=none smtp.client-ip=115.236.127.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="CNIn040/"
Received: from test-VJFE6CF11X-XXXXXX (unknown [112.193.82.77])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c0aaacb6;
	Tue, 1 Sep 2026 11:01:08 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: Qianghua Wang <qianghua.wang@senarytech.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH v5 3/3] ASoC: Intel: soc-acpi: add SN624x entries for ARL/LNL/MTL/PTL
Date: Tue,  1 Sep 2026 11:00:49 +0800
Message-ID: <14488e51e696df1b91b15a4100f41fa0a6975793.1788230065.git.qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788230065.git.qianghua.wang@senarytech.com>
References: <cover.1788230065.git.qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa05ae9d1ea09d8kunm596bfc8a4b20b3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSExNVkhOS0wZTU9MGUkaHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVSkJIVUNJVUxMWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=CNIn040/IheD4mBPnWlmWvSNarj4exQj7I6gh1gxwKSIehWRPxAXDcUatFnMM4xlCS8gbE2m9jIjKbdDydljsRmiQ6ydo0GgkNrvQDROB6SxF7hA15pXzLhJhg2sxKfz1I+E+BXOhj/j/TtZhZzALlxJmjinpKuZa7oK7BBr224=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=4QOqxzaYfId6f7NskDaSwSnB+0SD7b2HzZMRVNfy4ig=;
	h=date:mime-version:subject:message-id:from;

Add SoundWire machine match entries for Senary SN624x on Arrow Lake,
Lunar Lake, Meteor Lake, and Panther Lake, and select the SN624x SDCA
codec from the SOF SoundWire machine Kconfig. Each part ID uses a
separate mach entry; name_prefix is "sn624x".

Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
---
 sound/soc/intel/boards/Kconfig                |  1 +
 .../intel/common/soc-acpi-intel-arl-match.c   | 71 ++++++++++++++++
 .../intel/common/soc-acpi-intel-lnl-match.c   | 71 ++++++++++++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   | 71 ++++++++++++++++
 .../intel/common/soc-acpi-intel-ptl-match.c   | 82 +++++++++++++++++++
 5 files changed, 296 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index cddbd2aa424e..5b80b1770ff0 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -535,6 +535,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_ES9356
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
+	select SND_SOC_SN624X_SDCA_SDW
 	imply SND_SOC_SDW_MOCKUP
 	help
 	  Add support for Intel SoundWire-based platforms connected to
diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 1033f2d45c8a..575889a4c69b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -531,6 +531,63 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_machines[] = {
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_machines);
 
 /* this table is used when there is no I2S codec present */
+
+/*
+ * Senary SN624x on Arrow Lake: one multi-function device on link 0.
+ * Separate mach entries per part ID (adr_d[] is AND, not OR). Amp endpoint
+ * is aggregated like the generic SOC_SDW_DAI_TYPE_AMP shape from
+ * find_acpi_adr_device().
+ */
+static const struct snd_soc_acpi_endpoint sn624x_endpoints[] = {
+	/* Jack */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* Amp */
+	{
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 1,
+		.group_id = 1,
+	},
+	/* DMIC */
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+#define SN624X_ARL_SINGLE_ADR(_sym, _adr)				\
+static const struct snd_soc_acpi_adr_device _sym[] = {			\
+	{								\
+		.adr = (_adr),						\
+		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),		\
+		.endpoints = sn624x_endpoints,				\
+		.name_prefix = "sn624x",				\
+	},								\
+}
+
+#define SN624X_ARL_LINK(_sym, _adr_arr)					\
+static const struct snd_soc_acpi_link_adr _sym[] = {			\
+	{								\
+		.mask = BIT(0),						\
+		.num_adr = ARRAY_SIZE(_adr_arr),			\
+		.adr_d = _adr_arr,					\
+	},								\
+	{}								\
+}
+
+SN624X_ARL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
+SN624X_ARL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
+
+SN624X_ARL_LINK(arl_link_sn6242, sn6242_single_adr);
+SN624X_ARL_LINK(arl_link_sn6244, sn6244_single_adr);
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 	{
 		.link_mask = BIT(0) | BIT(2) | BIT(3),
@@ -624,6 +681,20 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-arl-es9356.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0),
+		.links = arl_link_sn6242,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-sn624x.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
+	{
+		.link_mask = BIT(0),
+		.links = arl_link_sn6244,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-sn624x.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_sdw_machines);
diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 3b9758f73238..f9c47cc1e0c7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -685,6 +685,63 @@ static const struct snd_soc_acpi_link_adr lnl_sdw_rt712_vb_l2_rt1320_l1[] = {
 };
 
 /* this table is used when there is no I2S codec present */
+
+/*
+ * Senary SN624x on Lunar Lake: one multi-function device on link 0.
+ * Separate mach entries per part ID (adr_d[] is AND, not OR). Amp endpoint
+ * is aggregated like the generic SOC_SDW_DAI_TYPE_AMP shape from
+ * find_acpi_adr_device().
+ */
+static const struct snd_soc_acpi_endpoint sn624x_endpoints[] = {
+	/* Jack */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* Amp */
+	{
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 1,
+		.group_id = 1,
+	},
+	/* DMIC */
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+#define SN624X_LNL_SINGLE_ADR(_sym, _adr)				\
+static const struct snd_soc_acpi_adr_device _sym[] = {			\
+	{								\
+		.adr = (_adr),						\
+		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),		\
+		.endpoints = sn624x_endpoints,				\
+		.name_prefix = "sn624x",				\
+	},								\
+}
+
+#define SN624X_LNL_LINK(_sym, _adr_arr)					\
+static const struct snd_soc_acpi_link_adr _sym[] = {			\
+	{								\
+		.mask = BIT(0),						\
+		.num_adr = ARRAY_SIZE(_adr_arr),			\
+		.adr_d = _adr_arr,					\
+	},								\
+	{}								\
+}
+
+SN624X_LNL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
+SN624X_LNL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
+
+SN624X_LNL_LINK(lnl_link_sn6242, sn6242_single_adr);
+SN624X_LNL_LINK(lnl_link_sn6244, sn6244_single_adr);
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -805,6 +862,20 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-lnl-rt713-l2-rt1320-l13.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0),
+		.links = lnl_link_sn6242,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-sn624x.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
+	{
+		.link_mask = BIT(0),
+		.links = lnl_link_sn6244,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-sn624x.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 596582053d93..e89c5cfd6ed1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -1296,6 +1296,63 @@ static const struct snd_soc_acpi_link_adr mtl_cs35l63_x2_link1_link3_fb[] = {
 };
 
 /* this table is used when there is no I2S codec present */
+
+/*
+ * Senary SN624x on Meteor Lake: one multi-function device on link 0.
+ * Separate mach entries per part ID (adr_d[] is AND, not OR). Amp endpoint
+ * is aggregated like the generic SOC_SDW_DAI_TYPE_AMP shape from
+ * find_acpi_adr_device().
+ */
+static const struct snd_soc_acpi_endpoint sn624x_endpoints[] = {
+	/* Jack */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* Amp */
+	{
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 1,
+		.group_id = 1,
+	},
+	/* DMIC */
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+#define SN624X_MTL_SINGLE_ADR(_sym, _adr)				\
+static const struct snd_soc_acpi_adr_device _sym[] = {			\
+	{								\
+		.adr = (_adr),						\
+		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),		\
+		.endpoints = sn624x_endpoints,				\
+		.name_prefix = "sn624x",				\
+	},								\
+}
+
+#define SN624X_MTL_LINK(_sym, _adr_arr)					\
+static const struct snd_soc_acpi_link_adr _sym[] = {			\
+	{								\
+		.mask = BIT(0),						\
+		.num_adr = ARRAY_SIZE(_adr_arr),			\
+		.adr_d = _adr_arr,					\
+	},								\
+	{}								\
+}
+
+SN624X_MTL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
+SN624X_MTL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
+
+SN624X_MTL_LINK(mtl_link_sn6242, sn6242_single_adr);
+SN624X_MTL_LINK(mtl_link_sn6244, sn6244_single_adr);
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	/* mockup tests need to be first */
 	{
@@ -1503,6 +1560,20 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-mtl-sdw-cs42l42-l0-max98363-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0),
+		.links = mtl_link_sn6242,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-sn624x.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
+	{
+		.link_mask = BIT(0),
+		.links = mtl_link_sn6244,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-sn624x.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_sdw_machines);
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 756bbf82a326..dd84e97836c9 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -438,6 +438,66 @@ static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l3_rt1320_l3[] = {
 };
 
 /* this table is used when there is no I2S codec present */
+
+/*
+ * Senary SN624x on Panther Lake: one multi-function device on link 3.
+ * Separate mach entries per part ID (adr_d[] is AND, not OR). ADR version
+ * nibble 0x3 matches the silicon SoundWire version. Amp endpoint is
+ * aggregated like the generic SOC_SDW_DAI_TYPE_AMP shape from
+ * find_acpi_adr_device().
+ */
+static const struct snd_soc_acpi_endpoint sn624x_endpoints[] = {
+	/* Jack */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* Amp */
+	{
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 1,
+		.group_id = 1,
+	},
+	/* DMIC */
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+#define SN624X_PTL_SINGLE_ADR(_sym, _adr)				\
+static const struct snd_soc_acpi_adr_device _sym[] = {			\
+	{								\
+		.adr = (_adr),						\
+		.num_endpoints = ARRAY_SIZE(sn624x_endpoints),		\
+		.endpoints = sn624x_endpoints,				\
+		.name_prefix = "sn624x",				\
+	},								\
+}
+
+#define SN624X_PTL_LINK(_sym, _adr_arr)					\
+static const struct snd_soc_acpi_link_adr _sym[] = {			\
+	{								\
+		.mask = BIT(3),						\
+		.num_adr = ARRAY_SIZE(_adr_arr),			\
+		.adr_d = _adr_arr,					\
+	},								\
+	{}								\
+}
+
+SN624X_PTL_SINGLE_ADR(sn6242_single_adr, 0x0003300496624201ull);
+SN624X_PTL_SINGLE_ADR(sn6244_single_adr, 0x0003300496624401ull);
+SN624X_PTL_SINGLE_ADR(sn6247_single_adr, 0x0003300496624701ull);
+
+SN624X_PTL_LINK(ptl_link_sn6242, sn6242_single_adr);
+SN624X_PTL_LINK(ptl_link_sn6244, sn6244_single_adr);
+SN624X_PTL_LINK(ptl_link_sn6247, sn6247_single_adr);
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 /* Order Priority: mockup > most links > most bit link-mask > alphabetical */
 	{
@@ -531,6 +591,28 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.machine_check = snd_soc_acpi_intel_rt712_vb_no_function_topology,
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l3.tplg",
 	},
+
+	{
+		.link_mask = BIT(3),
+		.links = ptl_link_sn6242,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-sn624x.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
+	{
+		.link_mask = BIT(3),
+		.links = ptl_link_sn6244,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-sn624x.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
+	{
+		.link_mask = BIT(3),
+		.links = ptl_link_sn6247,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-sn624x.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
-- 
2.53.0

