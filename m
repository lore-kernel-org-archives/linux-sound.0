Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012053.outbound.protection.outlook.com [52.101.53.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44BB23A564
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 19:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401463; cv=fail; b=pQCskHNSE/F/IvMMxVbPUWAAdZgWNo9nNj6abF5MCid48YOplZUHo4SD0nVdwehvRHYT5XtrCQWrZUB+g9/bUY1OnxbJwCIdE2ek9tTBow8OSV14ff3ZGGzvCkEZzX//XpDnPwJQNMxVWQwJMULIa2CZkCCCdJ4a9JQxq/EERAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401463; c=relaxed/simple;
	bh=FMb8tuvilzCjfoqvONJ4sEANVl4qbmA02B2yd9gwssU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o4sZMlHdq0Arw4Z67lA3BqsoH05WotF34CBuE9uG4yzcD36eMJqe7O7tnUsU6HKPIEvXFJ/anw1H3eFWV4DPAX82kJkBNvRkcFvbyliCG+gghvfHgXySrvcIhQsrt8FfhfeJ/kHez/5YI+ApwliGtednwOC2WCwhow7XpljvWBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YKtXO9NU; arc=fail smtp.client-ip=52.101.53.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YKtXO9NU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUfWg7gW6gwlNxD5iDP/3WHGsGD7ziN2BBOy9MeSdLmsi+8JlYe5/Q6+gfKA4ILexCaAY9InrEEXzFnd7DYmnVSeINgmlKSZZhJ04ru5KaLgJzjK9xBq4hu0HeZF6m6VjjaIE2f4JfJ1EgIHfz60+RfHHVwM1YP3+7URbFchw7V8nKruypaf/F68ISHe7/jbSbD2bFabVAPabi5u0fwKOWd7eUFM3jatXJq49xAA798vKOrMGQZdSkEkaieTeB+ksNqkvUXpgV09KOqj3mvIv26WEScQ82/4BvUlgvj7sxhhGbuTrXaCeyuFYalpWVrj0RQYrBjG4mTaN8nZ7AFGow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kQzyDIjSmUcGJ2oUEthiLzwAL2P7Umd2MQGfT7gfD8=;
 b=Y5EHwmYo54pypnR8GA1cO7SZI1XfWiXHC4Fc8L8szVUU2ysmM991y7rJb8ti8alZ0Riu5ixZ7vgqyhGOwvtMLv/sgmrWzeoGhC74YNhCjgXI2/LS2xKBCJzA7//WY7eMKJHpPYLYaKExv4vrGw1Q9kmKNsBCQ0GfwiNeFbn5WTiWsNYCCgcNuQErxWEQsCO6knhF6PlNmm0N9sOZ4j6U1ZUBrONH04rz9CkU/helnhf1p4Xy5sbnkfwqhascWPJWTpv7ZNpFpoJewlv1ZCfpKwzfVkWiTyev7FV7HfIJx8G34rIRchAy4RM78Q2BAG/W/jEyHOca6NsSCteg5b8pcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kQzyDIjSmUcGJ2oUEthiLzwAL2P7Umd2MQGfT7gfD8=;
 b=YKtXO9NUUx3jGAWFZ0lKHY44emuBnYRCPSrehB+vAE9x3floOjFT9lfKq4VCQE9Wu15XagvGZjtJqgK7dKV2wGLtfT323U/cxZND0IB1xR6LGiY1zAPsmMkOgTN+ktO4U+Az+OQHYSrzC5FI/1UAOtUMvk4RowikyZgZ+nOChso=
Received: from SJ0PR03CA0215.namprd03.prod.outlook.com (2603:10b6:a03:39f::10)
 by CYXPR12MB9318.namprd12.prod.outlook.com (2603:10b6:930:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 19:30:57 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::3) by SJ0PR03CA0215.outlook.office365.com
 (2603:10b6:a03:39f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 19:30:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 19:30:56 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 14:30:54 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <Vijendar.Mukunda@amd.com>, <venkataprasad.potturu@amd.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: Mario Limonciello <mario.limonciello@amd.com>, Zachary Huang
	<zuzhenhuang365@gmail.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH] ASoC: amd: acp63: add standalone ES9356 SoundWire machine
Date: Wed, 7 Oct 2026 14:30:36 -0500
Message-ID: <20261007193038.2473068-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|CYXPR12MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b2863f4-2876-4f3e-09f8-08df24a98294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|18002099003|3023799007|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	SAqf7/Z1r4fqtUE/90dMh2TFKhDl0jHYT6hK1gPp2yF/8sEEVsgL9xU48XyrBSosNIlqouv87uFUM/dmivtmpn1SeGPRHYl53nzj+LrBUJ2466BYQ5Vgx1qQpU47zS0rc/esSYuktazGpDughm9jc11UbH4Why3Ph3ERv72OMOidQ/gAYoKbTxoZLf/4wkWUbOpFTOzfAEWhp6KA/1l1nfiXEggl1s+vBtm3XryGSPtEmOd2CT64H2FfUnPBkbr1gEOz5eLZaSfna+WPQwd7wT5EJbZHQTqb6vY8h41nJEpOybR26jO7qExx8IlyK8OZ/o8g8RorVWUaoa29O27wJiqsaP8rxsoinn8cMnhoMzAZMnRxs02/l2yMUOfDj3Psg5Wm2fOIILD0KRmfByTfm2SJ9W9rRtd/W8wQQFHsAiysQVgn9vQ9TFQExSpr6fG3qsYPCUx9iGFZIf/IetK2kThPOFeFBZmLpxbStpS3dQ98iSrLbCCtv5watniIDtx6CxJYwwFhGYqTnM2S4UsznQl2KoEadN+bmo7LTDonIPTz7U9LujmJg/k5wOAox8RC7/ODP6QcWMFrhUIYMHyQ/a7ay8/X9wRyH1C+mFoFUTl0ZJvgvOQ6q2XySHVu1GbzsGK65HV97A74H5CfbkHG6B+NRuvvUWlPQt3CSKMJjD/N81cBCbuP55d0ofWkzcsFgS185Up0yc1n4uU+EpQXbw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(18002099003)(3023799007)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k9PYvSVpXpEL7k1OG3MN9LPRw9ompwfhkQIFTXBr09V+6qMdPSIGzGpKYQ7zoshhvPl1tyzCdlEXk4ldXauisEMD8apP/E5ZKUU0xqyiEJ6FFI+lAUCCs11+DalvuODYG07fnCXwNjMbjhXllu7JHEAQWdy/bwEmoTfVECaXKMQW3RyFFGojCyhnyKeY2HukWP55+o6oXSbn1D2lBew6envZg/WcQzJ0yon/FRrIQP0K4EHo1/XWVMoqU1/KySaunI3WqtFdEH50hEJpbVrYS27ElAatcggg5UiYbIk3d/kTP0mxhxP5KE1Omerk2W9nkWjzcgzw3nDd6PWOofRgQ7gaB+Zm7cusXcRm6hUYuhLY9ISzRb6FN377pi8DMNEl77y9ZriwnhPXdZRpO8O1TLiBSmTci6wZH4BCJKSv5jh17XcdiFqSU4DokMh6LoaD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 19:30:56.7882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2863f4-2876-4f3e-09f8-08df24a98294
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9318

The MECHREVO WUJIE 14SAH exposes a single ES9356 SDCA codec on ACP6.3
SoundWire link 0. The peripheral and its UAJ, SmartMic, SmartAmp and HID
functions enumerate, but the ACP6.3 match table has no entry for it.
Machine selection therefore fails and no sound card is registered.

Add a link 0 machine entry containing all four ES9356 audio endpoints so
the generic amd_sdw machine driver creates jack playback and capture,
DMIC capture, and speaker playback links. Select the ES9356 codec from
the legacy SoundWire machine configuration when SDCA support is enabled.

Reported-by: Zachary Huang <zuzhenhuang365@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222092
Assisted-by: LLM
Tested-by: Zachary Huang <zuzhenhuang365@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
Zach tested this and it helps AMD machine driver side.
There are separate ES9356 changes needed that Zach will send separately.
---
 sound/soc/amd/acp/Kconfig                |  1 +
 sound/soc/amd/acp/amd-acp63-acpi-match.c | 50 ++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index b7b7b4f4a55ca..a62bf0fb1efcc 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -181,6 +181,7 @@ config SND_SOC_AMD_LEGACY_SDW_MACH
 	select SND_SOC_RT715_SDW
 	select SND_SOC_RT715_SDCA_SDW
 	select SND_SOC_RT722_SDCA_SDW
+	select SND_SOC_ES9356 if SND_SOC_SDCA
 	select SND_SOC_TAS2783_SDW if SND_SOC_SDCA && EFI
 	help
 	  This option enables Legacy(No DSP) sound card support for SoundWire
diff --git a/sound/soc/amd/acp/amd-acp63-acpi-match.c b/sound/soc/amd/acp/amd-acp63-acpi-match.c
index 1dbbaba3c75b3..4f448c711c2cb 100644
--- a/sound/soc/amd/acp/amd-acp63-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp63-acpi-match.c
@@ -117,6 +117,42 @@ static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
 	}
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
+static const struct snd_soc_acpi_adr_device es9356_0_adr[] = {
+	{
+		.adr = 0x00003004b3935601ull,
+		.num_endpoints = ARRAY_SIZE(es9356_endpoints),
+		.endpoints = es9356_endpoints,
+		.name_prefix = "es9356"
+	}
+};
+
 static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 	{ /* Jack Playback Endpoint */
 		.num = 0,
@@ -465,6 +501,15 @@ static const struct snd_soc_acpi_link_adr acp63_rt722_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr acp63_es9356_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(es9356_0_adr),
+		.adr_d = es9356_0_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[] = {
 	{
 		.link_mask = BIT(0) | BIT(1),
@@ -478,6 +523,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[] = {
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp63_sof_sdw_machines);
 
 struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sdw_machines[] = {
+	{
+		.link_mask = BIT(0),
+		.links = acp63_es9356_only,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = acp63_rt722_only,
-- 
2.43.0

