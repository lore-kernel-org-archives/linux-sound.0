Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA522253FC
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 05:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756703563; cv=none; b=YbEij2CXCNuLVPSZPKl69Kqfo0cOLZB0ItpKarqXKLu4nmSsv1xsoVgt9J6jAtnlADH76cevVYuvnb7KeJlf3XOiCu5yUl2I9Kq+2Ug5s/NObq34GA4JriN+Bx4qe+GP0UL2XxlxEgKCeOOWl1CPg8zJIaH4nhUXyEnKJOXCEYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756703563; c=relaxed/simple;
	bh=ke3NXagnYGmhycdK2kU8N0wNZ2e+U8Q1Oihh6oc7FlM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OpAnL2uYhn54AIihDKR4zkDsmW9T5BngltEQzczZgj2k5D4OB4/LnQN1h9nVBBCOE+1JN3nyPVKBzFn3fCGajpsN57NAr6Bz484q5mKonKv/pbngqXhaFBgG6a0qL9cAtnbh0Kzpv8RnWshLcIFhewYTms4knLauTkwI+KnPfcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mtCsxCaC; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mtCsxCaC"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5815CKGA2292876;
	Mon, 1 Sep 2025 00:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756703540;
	bh=HWV5YrYxSohtENyjJUitIjcydDNpF5x+mny+ocLzNWU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mtCsxCaCbFsMTPLK7SSVSxZgta63aIpaCRooZBlAJjL9OIHnE+cMvFeb9YavVHt2O
	 J4L+O28UjcCAkr5PhejNz2DoVyZ5exVyniBeW3UFbtCocKvdco0eAs3mllTG0DnHFP
	 dQ73QuO0e0z8s9uMhxZl0jN12Gx0iXKPjVrDHzhg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5815CKBL1302475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 00:12:20 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 00:12:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 00:12:20 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5815BvJC1628562;
	Mon, 1 Sep 2025 00:12:15 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <navada@ti.com>,
        <shenghao-ding@ti.com>, <v-hampiholi@ti.com>, <baojun.xu@ti.com>,
        Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 4/4] tas2783A: Add acpi match changes for Intel MTL
Date: Mon, 1 Sep 2025 10:41:43 +0530
Message-ID: <20250901051144.1112-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250901051144.1112-1-niranjan.hy@ti.com>
References: <20250901051144.1112-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

acpi match changes to support tas2783a on mtl
on link 0 for 2 devices

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 75dc8935a794..ec9fd8486c05 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -948,6 +948,30 @@ static const struct snd_soc_acpi_adr_device cs42l42_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device tas2783_0_adr[] = {
+	{
+		.adr = 0x0000380102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "tas2783-1"
+	},
+	{
+		.adr = 0x0000390102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "tas2783-2"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr tas2783_link0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(tas2783_0_adr),
+		.adr_d = tas2783_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr cs42l42_link0_max98363_link2[] = {
 	/* Expected order: jack -> amp */
 	{
@@ -1080,6 +1104,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = tas2783_link0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-tas2783.tplg",
+	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = mtl_rt713_l0_rt1316_l12_rt1713_l3,
-- 
2.25.1

