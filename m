Received: from mail-m1973187.qiye.163.com (mail-m1973187.qiye.163.com [220.197.31.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A327C383C89
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 07:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786518376; cv=none; b=j6qJstMs5ug5xWfohw4i1t5HK9XQdafp5uNh2gc8Z5ZSdQIilLRJVCXonPZ8OLzuWu3owRklruAgRyxrg1l+ibJch+MwD2WWom4/n8KPcn8JfijhZy8lBMBO5AaFNzMGXDz0GuFVq6nZV40rW87XZ5PBD4B5Dud7HUDN9R4qZgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786518376; c=relaxed/simple;
	bh=HKVUkLLs8RWJ7xSP3wFNw8dt7UzUhE484aC4cRmNxRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlpR8OjkLhtwZ3srdakMRQUhnu9egmBVB2sqexhyW/Z5ozRu0LfHusH9L0hH1Hjkh1fMClsEPIjQ2u9y8TpMGQpbxFb5CzQnQ7QC0sFTq8/lF5ABVzmFifQhG9hLGIV8xZYXEo514PRGkw5TIjyqISlQJzceBsa+GSHfSFBPmH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=g5DzkZ51; arc=none smtp.client-ip=220.197.31.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="g5DzkZ51"
Received: from localhost.localdomain (unknown [182.148.129.247])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49b045933;
	Wed, 12 Aug 2026 15:00:52 +0800 (GMT+08:00)
From: qianghua wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	cezary.rojewski@intel.com,
	bo.liu@senarytech.com,
	"qianghua.wang" <qianghua.wang@senarytech.com>
Subject: [PATCH 3/3] ASoC: Intel: soc-acpi: add SN624x entries for PTL
Date: Wed, 12 Aug 2026 14:59:44 +0800
Message-ID: <86101e7815def5ff5d8414619a3f412efc4ab8b2.1786511177.git.qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786511177.git.qianghua.wang@senarytech.com>
References: <cover.1786511177.git.qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ff4c61e2a09d8kunma462499a3e5217
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHxpKVkoYTh9CSkJCTUlDS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVJT0xZV1kWGg8SFR0UWUFZT0tIVU
	pLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=g5DzkZ51/ICYK6PmYM9mYMbm7M7BYo65UW6QChuBPreLJDgKIMgiFGS2Ls/jhBWq3JTkjKyxWPLh+pVN09StM38m+HqSTgfrI6JcAqqzAyytSCoHnQb76X3FwouYYOQIDrtDhiXy1Qq7cNFar2Jwugg3BotUmsTs9VrRdZhFJjI=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=/4+fCzVNtJ8DHFVM950/BJVHeUGLrQfaCMoXcaZiJFE=;
	h=date:mime-version:subject:message-id:from;

From: "qianghua.wang" <qianghua.wang@senarytech.com>

Add Panther Lake SoundWire machine entries for Senary SN6242/6244/6247
on link 3, and select the SN624x SDCA codec from the SOF SoundWire
machine Kconfig.

Signed-off-by: qianghua.wang <qianghua.wang@senarytech.com>
---
 sound/soc/intel/boards/Kconfig                |  1 +
 .../intel/common/soc-acpi-intel-ptl-match.c   | 81 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index cddbd2aa424e..2f2692cd8135 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -519,6 +519,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT715_SDCA_SDW
 	select SND_SOC_RT721_SDCA_SDW
 	select SND_SOC_RT722_SDCA_SDW
+	select SND_SOC_SN624X_SDCA_SDW
 	select SND_SOC_RT1308_SDW
 	select SND_SOC_RT1308
 	select SND_SOC_RT1316_SDW
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index f7694b2a2b02..88bf1552be77 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -438,6 +438,65 @@ static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l3_rt1320_l3[] = {
 };
 
 /* this table is used when there is no I2S codec present */
+
+/*
+ * Senary SN624x: one multi-function device on link 3. Separate mach entries
+ * per part ID (adr_d[] is AND, not OR). ADR version nibble 0x3 matches the
+ * silicon SoundWire version. Amp endpoint is aggregated like the generic
+ * SOC_SDW_DAI_TYPE_AMP shape from find_acpi_adr_device().
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
+		.name_prefix = "sn6242",				\
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
@@ -531,6 +590,28 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l3.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
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
2.47.3

