Received: from r3-73.sinamail.sina.com.cn (r3-73.sinamail.sina.com.cn [202.108.3.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD6133A702
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778419453; cv=none; b=pVsVji1rlGT50YdDQ0+jtkVx/x/LrjZQw9rBduXjwMIx3/rMBqUN/gKE1qmOm2jbGKQX6F7Rt8CegIKxV7De4CvvZpvjKMviKNw9VlcT7dfiuNlrmPTfc+aIqiUFUcjlvO4TliLzvrKDOMU8Z/yeYof0OL2RO62j/Ap13vOcxrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778419453; c=relaxed/simple;
	bh=c3qB6n24yF0GGWk3JhnztkerQuG8WCyBP/bsu4j26e8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nzC9VPMIyvg3owfs1g5PYrO/hDeYN+lMcwsFpi8/VyafFnkhlIj041w56A433R9dEicIOv60gI4WU3FlBOcYR0s9/QxlP7smgWJgCwywbJIeNK4IrckdZx0Zk21OiQb7aJ178IAelWTQH3nBGig0nZ+LImcXPnk4CLpG36rJYyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6A0086CE00005B48; Sun, 10 May 2026 21:23:30 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 8F7D8E0849BF4F408024F79B1D901708
X-SMAIL-UIID: 8F7D8E0849BF4F408024F79B1D901708-20260510-212330
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
Subject: [PATCH v13 4/6] ASoC: Intel: soc-acpi: arl: Add es9356 support
Date: Sun, 10 May 2026 21:23:19 +0800
Message-Id: <20260510132321.14687-5-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260510132321.14687-1-zhangyi@everest-semi.com>
References: <20260510132321.14687-1-zhangyi@everest-semi.com>
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

