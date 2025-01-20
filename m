Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483BA1E1C07;
	Mon, 20 Jan 2025 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737367374; cv=fail; b=iipNv/HaX3dId+rpKDZVLQZNFueaEnKwpv2I9OZRzhnGmx/IcTtJSTBi9eGPEDng/ksCLg/rfIS0FyGPTLw8CVZcKySwuQgCN56epyoWJEbP0OOLe5OEs/PiRW9IMVon4Cb9TqH3897wvum+s0jZin9aJZfzOhsjp6Kq81qO/CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737367374; c=relaxed/simple;
	bh=DYGEVkSN9u7dm04G37kUeh4tY9MArp1JjCXoRDfJ0fE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qWRJw37mN2tmpdwly8iqWsHkYIEyj54qjwG2IetnHljfdIRAaPEVcozb8C4KcL0KIXeF4qwhBnWhuBUdPehZ8G9h3SaWZ9qCYDwzgg5ghgI+W84rHU5Ff6CTaOPqcpCxJ6IvrHzpg+zRFNwni5i9WNQZlM2bLb/wvAPdNfyP3qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GTIIVN75; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GTIIVN75"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWLQfaZlgcXJhuE3BmskfMyPhNUiV+RlIzkqLIYstYHwujV0BL1efwSMVD/8t2YKfx19X0oagYbAd+KhMnDSijoKDL+xqhGCE7HtYSrWCkcN2a13/ehKjkNPm8UyQ+iwmRU9o9DzMDh080tKNgtnuYqwGOl84S7a88VGO4GrGeqy0Wcu276NmXEZz8O2P8udI0pZWZ5lsDgwOEtZ+kNesfT80D51JbKr0mIB+3xlh43rksRraaER26T59OUWE39HouLLSDFMyF+Steqd8T0WGLkdDPHGFZVkhvWko4YF3kiHkUqQgtccoewog2Itq3Ev5GfedkaH0vgf1ewheSL8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bqs8fEL8CLx238hQgTGPuNC4fH36n7lpumWBynkZZCI=;
 b=fhpyl1XjweLkmAS/y7Z9cUWbmcbEFPbhnukHe1QjMU2uuvW7xs6Bjf96OhnH+pRYVi7bq+BWXcFIj1klmmaxcxsWK+5tcKNxLWz+X+oGx9mU9dFd/aB0x1jCZS6D21MB4LL/OIocrm7rbkh3qWfnBEiIZaq1PYimAxzbiKpq04c+wQSNST8VEEmrDEKi/ei8AeJorg4Ms1vzCRBlqRlJR9kTsFZxHNdyFmCzjtG1S/xVutKQDBK6qlj7zhTfWK3GLiVOLLJu9fH43oEEIjm/mX1refFA1HBX1xMIOvVo8pD4GbYqJ3UG6ljmoXgsVSxLG7jWMPmwvMPwDTSFVIZYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bqs8fEL8CLx238hQgTGPuNC4fH36n7lpumWBynkZZCI=;
 b=GTIIVN75lrxVlMxEI6znWQuf+9q+eUCmKliD9iI7y4LoI9umxCul420pfMTljvX399yr3KMaW/KA4olcCKaIe+t2XnEYmdl2o7MveM5CIma76ozqD95BHljv2zA/1CI74SmBO+f1xBrlZWeTfuFpXj3WETVUQCxSPlpV/L0+4oo=
Received: from CH2PR08CA0019.namprd08.prod.outlook.com (2603:10b6:610:5a::29)
 by DS7PR12MB8229.namprd12.prod.outlook.com (2603:10b6:8:ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:02:48 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::56) by CH2PR08CA0019.outlook.office365.com
 (2603:10b6:610:5a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:48 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:44 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 18/23] ASoC: amd: acp70: enable soundwire host wake irq mask
Date: Mon, 20 Jan 2025 15:31:25 +0530
Message-ID: <20250120100130.3710412-19-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DS7PR12MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a70f556-ef49-454b-7177-08dd393997f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y+vRNenpPQO4VNwtH2OzSMSiqMptIvoZZjUZh2Yu4e+EovdXDrRLaI8yDqdp?=
 =?us-ascii?Q?vVosd4MbsmwB8satwU3Y5GotttWLlZbDDPT2OTCU6qGMqWwMgE3/wQSIRdVR?=
 =?us-ascii?Q?E+C7pQWlnNgIM4mh7HwohaN9Xl668k7V+iMrj39Ugiau4BDL4O5RLaVcjjLe?=
 =?us-ascii?Q?a+9oUcu0MZi0vlZPv7q2jrRNOouarOIOolS173NKlYhnpgeps9g1h8sdtBpw?=
 =?us-ascii?Q?H6TcOCvbIcaCuL6HWNXgJLv5X/6oAknF+aQlpP3TXycYB6aH2+Vjd8JT4jJs?=
 =?us-ascii?Q?uhvX5FyN8CDeUSuwpvdS75uX6LF/ckvfNda296TflPebTROGrjPHkqfhWlw+?=
 =?us-ascii?Q?SSf9VmG2luzDGH/8MIX1/QLxm/QGrHoHttymmhJSiU54zxFd4BxGnkrl3Afl?=
 =?us-ascii?Q?kxt4iL5/VE7KWMoc3VuMwMjcjFKhO/TAtRcnJszJZahavuXC+2R2VuB3WT0q?=
 =?us-ascii?Q?PCczyNqK7P+KXUHXB1DqPukMjOZc3qa9aUI769uV3hrGmzrB0r42omQd0T3n?=
 =?us-ascii?Q?GziVtfr4gf5+w11aIiuzi34zoS8sqZN6oTz7/Gm26LKvWmNsSl1yfOA/VrqD?=
 =?us-ascii?Q?ZsX2CsJf2AOP2+P3AZgQ99u+AbalRl0UmeW+WOcmPnZ2Qoe6SvK6zjrzsG8K?=
 =?us-ascii?Q?dYjoNRcAAU4687gTndgA4OBADFXL+yF6EaRbOIgok5U87z9PPhoosK3sCEBh?=
 =?us-ascii?Q?KbXNZc/zAwT/2A1ASRhgyOASpCdyMJLnOA6sO3dWYovM/q3HlOrdo9F5I54P?=
 =?us-ascii?Q?bzVY+Ab8dLM2YtJkCWeuNk5zYwpIzpLWafMJMReqnnsm4PaSeAtcNpREOGxk?=
 =?us-ascii?Q?du2VZc1ivqM4p0EtgL55TnNimsyEwICdbz37/2bUgAa2Z390I0mecFkSdTkP?=
 =?us-ascii?Q?GAwubQjObyP6u2dNBAW5lQ0aoZgUaljta3NucPyIZFy1joIeGSVwbY9VYFzu?=
 =?us-ascii?Q?zkvfHtAa9OQIJbGDSVqOfzRt8ImqCzVUAkSPU44uSe/HvTBDCyQQKVu89Uup?=
 =?us-ascii?Q?KchHK3+8eOa/irGyEIVx2kx41KCb+GaDsUIqmCJSuRtoeszkNHwogOGf8Plf?=
 =?us-ascii?Q?ZEBWBWU1SBevAYlZ0WhSBVimFzUxQiPcWOhbANhCEzuD2FAgH9/SD/tEyBpk?=
 =?us-ascii?Q?GCJvtyMV6GAnNmY6Z7x9mjbBqC/9vpo4kiT/dS35SqvyTQziLcm1AXsF1NNW?=
 =?us-ascii?Q?XGRL5UVDLnjeK0R42s8Kc5Y6ksWUFbF6/txIx4mpL9IRm9QaitBoBQLU+agX?=
 =?us-ascii?Q?0ARScAk1Tq++F2IRjMvZdYLoYDfAHnUxSt/kar42jK6BHHA555yGJLE7z/si?=
 =?us-ascii?Q?Gh5F8Os3Px6bhf97Wu1Pg5KnuxW+ezuNDjTtUb4I20gr6zcZr9VZHZs2Bh/m?=
 =?us-ascii?Q?7595JKbT8x5g/X3rduWPndQPSn9Z08YO8azRsSUwqQn/KGwy+uDWRUgEiYi+?=
 =?us-ascii?Q?462LeSnTrMJiuoO+Eh+JnHUO0aPuZd9wVorQ8OjaLhD7wkLa+P6tOysccwTP?=
 =?us-ascii?Q?DZl9wRReTcYmVdk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:48.1061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a70f556-ef49-454b-7177-08dd393997f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8229

When ACP enters D0 state, after executing acp soft reset sequence,
all acp registers will be set to default values.
To handle ACP D0 & SoundWire D3 scenario wake events, Soundwire
host wake interrupt mask should be reprogrammed.

Enable SoundWire host wake irq mask during acp init sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |  1 +
 sound/soc/amd/acp70/pci-acp70.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index ab4d6a5c1cd2..232210df6f10 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -139,6 +139,7 @@
 
 /* time in ms for runtime suspend delay */
 #define ACP_SUSPEND_DELAY_MS	2000
+#define ACP_SDW_HOST_WAKE_MASK 0x0C00000
 
 enum acp_config {
 	ACP_CONFIG_0 = 0,
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index ff03fd493e98..79b0ab96217b 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -52,10 +52,25 @@ static int acp70_reset(void __iomem *acp_base)
 	return readl_poll_timeout(acp_base + ACP_SOFT_RESET, val, !val, DELAY_US, ACP_TIMEOUT);
 }
 
+static void acp70_enable_sdw_host_wake_interrupts(void __iomem *acp_base)
+{
+	u32 ext_intr_cntl1;
+
+	ext_intr_cntl1 = readl(acp_base + ACP_EXTERNAL_INTR_CNTL1);
+	ext_intr_cntl1 |= ACP_SDW_HOST_WAKE_MASK;
+	writel(ext_intr_cntl1, acp_base + ACP_EXTERNAL_INTR_CNTL1);
+}
+
 static void acp70_enable_interrupts(void __iomem *acp_base)
 {
+	u32 sdw0_wake_en, sdw1_wake_en;
+
 	writel(1, acp_base + ACP_EXTERNAL_INTR_ENB);
 	writel(ACP_ERROR_IRQ, acp_base + ACP_EXTERNAL_INTR_CNTL);
+	sdw0_wake_en = readl(acp_base + ACP_SW0_WAKE_EN);
+	sdw1_wake_en = readl(acp_base + ACP_SW1_WAKE_EN);
+	if (sdw0_wake_en || sdw1_wake_en)
+		acp70_enable_sdw_host_wake_interrupts(acp_base);
 }
 
 static void acp70_disable_interrupts(void __iomem *acp_base)
-- 
2.34.1

