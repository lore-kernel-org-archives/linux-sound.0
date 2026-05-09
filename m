Received: from smtp153-140.sina.com.cn (smtp153-140.sina.com.cn [61.135.153.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C73B39E6EB
	for <linux-sound@vger.kernel.org>; Sat,  9 May 2026 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778321518; cv=none; b=A+pjNXz3JirxKYHQiwtGq9bqkUr8IEBUAoF8FPbm1S364iL+ja7cRGP0EKVspmCcBuz+bmWPKh/VHyGZeKcBhoPvDp8dsezG4CEq2fZPJ8YFe9MPVjv3K+CCmH24V2M6te0JAGzfXlobfP51g2pKM/q7GnNR84vvkyUvbwOAQi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778321518; c=relaxed/simple;
	bh=c3qB6n24yF0GGWk3JhnztkerQuG8WCyBP/bsu4j26e8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=kQnL0enbSPFyoQTfgkU6hbSrVC0L8kYa4hlVjCxtk9TntbwoGw+Aro9PZFUM+WRPBZ7EEVOyUlzBbaNsVTm8lnBW0UjqFJRRRTkudWa65QQ4wno/F5DsCm/k5F6ciXVV+CFOZmDPAcjwxOHxPD/YxukP60t9ZzPymF4ftHGsab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 69FF08380000082F; Sat, 9 May 2026 18:11:10 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 2F5FBFCC45E446D6A93B4BE5B047265F
X-SMAIL-UIID: 2F5FBFCC45E446D6A93B4BE5B047265F-20260509-181110
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	vkoul@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v12 4/6] ASoC: Intel: soc-acpi: arl: Add es9356 support
Date: Sat,  9 May 2026 18:11:00 +0800
Message-Id: <20260509101102.10286-5-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260509101102.10286-1-zhangyi@everest-semi.com>
References: <20260509101102.10286-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add support for the es9356 codec in the ARL board configuration.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index c952f7d2b..9782825dd 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -192,6 +192,42 @@ static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_endpoint es9356_endpoints[] = {
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
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device es9356_adr[] = {
+	{
+		.adr = 0x00013004b3935601ull,
+		.num_endpoints = ARRAY_SIZE(es9356_endpoints),
+		.endpoints = es9356_endpoints,
+		.name_prefix = "es9356"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
 	{
 		.adr = 0x00003001FA424301ull,
@@ -255,6 +291,15 @@ static const struct snd_soc_acpi_adr_device rt1320_2_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr arl_n_mrd_es9356_link1[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(es9356_adr),
+		.adr_d = es9356_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr arl_cs42l43_l0[] = {
 	{
 		.mask = BIT(0),
@@ -528,6 +573,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-arl-rt722-l0_rt1320-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(1),
+		.links = arl_n_mrd_es9356_link1,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-es9356.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_sdw_machines);
-- 
2.17.1

