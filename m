Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012059.outbound.protection.outlook.com [40.107.200.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210F30CDB0
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765812769; cv=fail; b=RxW2sUXPjopVPmq4g1nmBBB57OtJBVFPQ2NO8GYLGac7XPK1N1pqtcr6y/IdqlwOiHROSL1/Hx0iaJ9qgIyqHncs3QGKi8Mkuat49hCgC7eksOPKGR0QuWraeAPfgeBFICjG83n5ZJ/4jNRo83Vyf7oP+xs9FIKBsWDZ90iOEWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765812769; c=relaxed/simple;
	bh=kWtccdvoMmnDhRRWPi8cN9dkO+UP/yy2WDvdZssFpEM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aEedF9ko2KWS9boSSeGXM2ATqnp/Z1m13sAMrvSGcGxHsTip1IxZsT26P6eQvKZbCp44//835uONCOMi7JQw/OKMpyC9LMOJql61+qr4oykBw540Wt1ApbE1T5YC/i2ux1HyC0uR9xMCddguSBZb5AQXH6RzIlZL/JctE2EihLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=d50KLWAH; arc=fail smtp.client-ip=40.107.200.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="d50KLWAH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHCGWQoszUwxMSA9J8v61ugeooZ5hALkKSo8mNbxwLbkt5w99gH8PijrdTc/aWK++maof2eV+u+CWTFRGD1mmvDyLts7a0l1RPn6teNJhXidVobhvuY+qEqeKPbv+3BqYDQKe+lsrcSlii78/9ickcouwu8jZ1UroENz9baKoWJZ8Ta+kze3rkI99JG9UFGo7Rq4uqIrlvQ7bUcK0qLFGWZJmdtlYMMGSQ1dRO9ZdI78dhc/0c5H2anA5tDaQZJcX48YcHPhBNPdz6zdhgvQnJ5nT/r8HdIIJ8++QBmwaqDztE3QKVyxNjAmGpJgAQzE/RHi/uouuZZ5NysbvFVlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWgaNEQ1JdsYqVdlQLEF+Mj4IZxKgWm3zl+hhbUfy+Y=;
 b=s7F9JRV4YnkCF5m+ZiARbMh7HXHUWY84ajdcyB2uU5sRUlpfCHsonfTTWyv1dcfmiGrePWMua6oT1wW2dADzXY9f68TvuM2Kh7ZpxTXnny2k48pRmGZQaJ16gtHuyWNPSKxCH4zp/BuhYRDj5wVp9Y/fHRNI5ZYl5O87+llPQe7wYXTG6bE0mkqZQuKLrVhvnpPDsGUOdQGXg1raoHK8Dj6NbvomR9QIGAYpuEgl0u5jgkzNAbErYV4NxpC6fw75fxIITJjpy68KkuGS3JLIZ4uPVSdIFR0gG31zj1V93X1+1K/qZcg7Dp2aXWVl/rO3j5KIf3Y3Ong3C6RfRZhguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWgaNEQ1JdsYqVdlQLEF+Mj4IZxKgWm3zl+hhbUfy+Y=;
 b=d50KLWAHiuFOAPZpreilnHrKe5EJVtsD3XzynwU1/mpX0PReaTn5pW3e+d6MoS679OA1HG3Z0UNKbcl0qv+yxkoab3P7H/og6xjA97cZ7CskwkkZzYBB9bnfQCwanfxD1tb2auiccXSwDv4CkizT9nMfB6VJCjAEhEO33rcZ97Q=
Received: from BN9PR03CA0685.namprd03.prod.outlook.com (2603:10b6:408:10e::30)
 by BY5PR10MB4339.namprd10.prod.outlook.com (2603:10b6:a03:20a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:32:43 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::ad) by BN9PR03CA0685.outlook.office365.com
 (2603:10b6:408:10e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 15:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 15:32:41 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:32:34 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:32:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 09:32:34 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFFWTtU2639809;
	Mon, 15 Dec 2025 09:32:29 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	<sandeepk@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 1/8] ASoC: tas2783A: sdw_utils: support ch 3 & 4
Date: Mon, 15 Dec 2025 21:02:12 +0530
Message-ID: <20251215153219.810-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|BY5PR10MB4339:EE_
X-MS-Office365-Filtering-Correlation-Id: 37548f6e-5eea-4d8b-c701-08de3bef2f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CMjNxGPVH+20inZBnNXOJ5oHdKf/p1tdScEQmMNES/X6z31kHKQCH4XLu6t1?=
 =?us-ascii?Q?THWpFAZg0Uxt859xbS60ZCe2gMwI9x3siBBs8pPgsN7UBVHkF4Z29j9gHW+R?=
 =?us-ascii?Q?IEH9xRTvIFuzKRtiu56fTVR8BFTShrue5Zd7cLMH2zVXnaeK8FmTX1d957Wf?=
 =?us-ascii?Q?WOzaeqbXFDipudEGsaJ0zJhv2s5kTIhaddJcSj/musw+qbN8xnZuLM4VcTLX?=
 =?us-ascii?Q?vEI4UkDotfi7+j8U/2pVb2TkV/5F2aWKhlzjK/PEWiMuS8ISp7aeoa0VX93c?=
 =?us-ascii?Q?g5Nf/kJ2vpms7G3BO5pKvSlKZw+Ka321Hi1HUMvhb+tBli4dk6qEbsBZm38A?=
 =?us-ascii?Q?7HD78AIuI1bV/p74jEHdOHN1JuH75HwllUq6yZP4q9+mOZ8hkI7NSrYJE9pQ?=
 =?us-ascii?Q?P94c3StM69VepxCp83Bn2DaEXz1MEotZwHkCntKT4mA9J+uO/JFuR885L9ln?=
 =?us-ascii?Q?Aud16qMhx3L1rl80TJ/NeHXRuc438TL0M3Ufy4re7hFVWzq3naNc+vW6FT1b?=
 =?us-ascii?Q?QSP9KBuUcvchO3sUhghzfAY712v+dCy1W8Gh7pGh2etRkxWGCtb5VI3qv9vB?=
 =?us-ascii?Q?fqq7wrWWkc4Ol//RCxiud01GUpIxhUbFVvd96WGyCPzNwuCJdGd4w4AwmUPp?=
 =?us-ascii?Q?ILMYIDXHj1uJyQPq9UBq9oMW2IazSE8IbftD7mpd8RK71Q/LMCCb1xvl7qeW?=
 =?us-ascii?Q?eQigduqO1e0bgrmIn+kD4TYwcMERcLNZGDclmtfzZq87UCGsn+OR9aWqaw4X?=
 =?us-ascii?Q?JCMs0FKxWsSYMuft/9hSOgOVYjtdCr9EnYVzHnL42uqXMMFF8rg5zIcEGFD2?=
 =?us-ascii?Q?5CsyimJydNhj8GfORXHgkiAWjL6eOGXfzy0YJgONJsMxGZ8dqbdtSFvs0KTi?=
 =?us-ascii?Q?8t1BzCS1WGnSTR6GquYfdcVzCVsvr7MU2IwiTycgk8QzxKw2KHdovzO8mb6O?=
 =?us-ascii?Q?TCwwr3GEqOyOynNGqUl8v812EkatnJxRHovVab/WY4et8ewfENaDxjYu/IpR?=
 =?us-ascii?Q?LeqdZ0PoHBcZEugZAzY6nyr5COer1xsaAH+ScbuV+essNqHkL/HjfITPvtPd?=
 =?us-ascii?Q?x+WDSgWVLmvwKftFbBUasYoiNBiVZjuHTZfPShaOFa1xr+TJdpjrJwYgplJK?=
 =?us-ascii?Q?trQWI1iC/fgMnG0fPI+dx4CTTpJgQQPNJpB9zC2wYEkvqgx0w3lm44VfZj3O?=
 =?us-ascii?Q?E9wqsShNyD4vJCJy1o1cHX1Nv2OzEoeijGn/aJxlmRBesaaWESbTAM/42Cma?=
 =?us-ascii?Q?KJZHCbiaxN0rIlxSt58CJxoj0o1IYgmQRM5Zl1eHsc0EjIiNi/I+Yvm0n0qa?=
 =?us-ascii?Q?rMf3i2lJbT5yaWfPd50PeXv+S3Iq3SmPXHiHssDbpq6Tyhl1t1WN+38n87Ja?=
 =?us-ascii?Q?6yApz+d+82Bw+q6E/d3NpLa6gVGs6e/Djyngbr5o+8sFkY912DQ4YMZFQoYz?=
 =?us-ascii?Q?gT7iHu7X4b9fUBXZfrCwNxG1r4LxfD0DD/qcx/TWe177cE6XLxVmYmSDUoK2?=
 =?us-ascii?Q?h5IB2RMuj50QazSSqgy867goTsroollWkiEul+rrysdnmYANcuU9TK6hsNwT?=
 =?us-ascii?Q?1wx0HKW/Yt9UOqU9LGU=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:32:41.4115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37548f6e-5eea-4d8b-c701-08de3bef2f9d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4339

 Currently the machine driver for tas2783A can only
support 2 channels. This patch adds support for
2 channel playback with 4 device setup.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
v2:
- no change
---
 sound/soc/sdw_utils/soc_sdw_ti_amp.c |  4 ++++
 sound/soc/sdw_utils/soc_sdw_utils.c  | 22 ++++++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_ti_amp.c b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
index cbd60faec..488ef2ef4 100644
--- a/sound/soc/sdw_utils/soc_sdw_ti_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
@@ -58,6 +58,10 @@ int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd,
 			strscpy(speaker, "Left Spk", sizeof(speaker));
 		} else if (!strncmp(prefix, "tas2783-2", strlen("tas2783-2"))) {
 			strscpy(speaker, "Right Spk", sizeof(speaker));
+		} else if (!strncmp(prefix, "tas2783-3", strlen("tas2783-3"))) {
+			strscpy(speaker, "Left Spk2", sizeof(speaker));
+		} else if (!strncmp(prefix, "tas2783-4", strlen("tas2783-4"))) {
+			strscpy(speaker, "Right Spk2", sizeof(speaker));
 		} else {
 			ret = -EINVAL;
 			dev_err(card->dev, "unhandled prefix %s", prefix);
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index f169d9589..1d1ba7a25 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -40,11 +40,25 @@ static const struct snd_soc_dapm_widget lr_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
+static const struct snd_soc_dapm_widget lr_4spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+	SND_SOC_DAPM_SPK("Left Spk2", NULL),
+	SND_SOC_DAPM_SPK("Right Spk2", NULL),
+};
+
 static const struct snd_kcontrol_new lr_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Left Spk"),
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
 
+static const struct snd_kcontrol_new lr_4spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+	SOC_DAPM_PIN_SWITCH("Left Spk2"),
+	SOC_DAPM_PIN_SWITCH("Right Spk2"),
+};
+
 static const struct snd_soc_dapm_widget rt700_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_MIC("AMIC", NULL),
@@ -69,10 +83,10 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = asoc_sdw_ti_amp_init,
 				.rtd_init = asoc_sdw_ti_spk_rtd_init,
-				.controls = lr_spk_controls,
-				.num_controls = ARRAY_SIZE(lr_spk_controls),
-				.widgets = lr_spk_widgets,
-				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
+				.controls = lr_4spk_controls,
+				.num_controls = ARRAY_SIZE(lr_4spk_controls),
+				.widgets = lr_4spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_4spk_widgets),
 			},
 		},
 		.dai_num = 1,
-- 
2.43.0

