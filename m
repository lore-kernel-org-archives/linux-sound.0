Received: from r3-73.sinamail.sina.com.cn (r3-73.sinamail.sina.com.cn [202.108.3.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B93038E116
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 07:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772091391; cv=none; b=HKobEAQMgDCC7FDAEH/ceGZoLUt43BEbASMONe7nRyeB9EnwbVQcDcnVurzPOcguqRDp+iopkzD92CDjd5BFaR4N/uzoPfnS/CAoG8wxXLttO7JXb66vIRZUen2jHu4fBG4fYp8whlHy7Il0Q8RztX5JXaG5sHApJaQKV3RHwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772091391; c=relaxed/simple;
	bh=j6Vn/g6uqEPpXX8fFTItQfPe4WbNmEoLH4IEFsVlErU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ZKw7F2D22N1IgzlqekNEQi5ZWIRhSxqb4STaPNFgOv7uTRKjUMr/32Im+dDm5clrjclfBUgqqKBeoiSNY+ZGOSgjXA16qez4V+W4GCerQe//uS7yD7XgzUFkVKtGUOSOmRMJe5n2CZZpqzidCMoTwk0q4LLa8AyAcQggaUF3dkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.39) with ESMTP
	id 699FF7CB00003FE6; Thu, 26 Feb 2026 15:35:49 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 6371DEACE592472BB79A8C800C653DA9
X-SMAIL-UIID: 6371DEACE592472BB79A8C800C653DA9-20260226-153549
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 5/6] ASoC: Intel: soc-acpi: arl: Add es9356 support
Date: Thu, 26 Feb 2026 15:35:33 +0800
Message-Id: <20260226073534.3347-6-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260226073534.3347-1-zhangyi@everest-semi.com>
References: <20260226073534.3347-1-zhangyi@everest-semi.com>
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
index c952f7d2b..e03bf072b 100644
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
 
+static const struct snd_soc_acpi_link_adr arl_n_mrd_es9356_link0[] = {
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
+		.links = arl_n_mrd_es9356_link0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-es9356.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_sdw_machines);
-- 
2.17.1

