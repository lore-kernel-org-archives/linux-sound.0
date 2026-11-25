Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607344;
	b=CLytEayCzY1gWRhBDfYgbQfqJnouamW05Qn8BJhCREL6xor6TOf0/qqwRw5Wd1QdPTo+
	 uiiLptGe8/P0rhhGXbo/ZUDu0WfnEzSMDAz0X6Zann3Awtm+ioYjr5f9eN+6IyZNAKbQ7
	 oyrBrH/eomJy2wKkhnK4OPXo3xpZL7+TRzwRnmms0MWib4i2X4iGc2hRxiYIEIbsJTCAC
	 HACi2MdIn/+xeDx1WACok8S3ocjZM1Nw8WQm2hnidhXfcWa2oK4aUWfqKJx2F5/iWMbjf
	 iM5VBbnCvwL8YX6vz9GGHyGIgPBxbUbT+PJ2BVMV3qM1lfggdSBkGIb7hI1ruWTFBBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607344;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=3FLTWF6eR50zNSMwkKYkqDClNHLv07HdvdjPX6gtmwg=;
	b=gU6CF0IbGiVJhY1twbWl3qTAGuV6TvfRzMuphq8+KY3KHgMdli2EoM1kNxQW0Zw3KrNu
	 ImkSfaym2ePR5lwVYgzzWmgkxlYBszfvBpLrFgr+928LUfppuQsfKOLT1bazkdJmHeDW9
	 TnsLRcyZ0e8PvlwXGAF9ytsPbCLUrJQcpLbfoilUTLdGTOl19wgHO75Ms31xcIKwYkfrK
	 EJ97hEXai1Fq8zwLU0dTP4MxVPdDMeJgqnzOmeiM1UyyI05va0vICnO02qLeK+7TtQOyE
	 REfPLAvvcKsb5uzweboqMEbEM2lzY/SnQBg9vjXZcY0xw0tBkDuaZKvJwD3pyAAIcMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=s2VIdE+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.64
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010064.outbound.protection.outlook.com [40.93.198.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB29D606A327;
	Wed, 25 Nov 2026 11:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB29D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=s2VIdE+N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5SP7wS9stWPT8f0pP3XEQ/Yvi7SehZ5INFKGi7Jud4WiZaX2NRHdzMTHM5cVm7GWfAykGOQWEURKgecOKbXawWLPLshAFtoH87MDum3Z2vWAsfJYokZh9HuzSagKk4tqjv78glONR8rySyR6foIpatmhjWhW3/404BwfQtVN8vcOTZlBt88JPeEsEAa0qSCJBXeaT3FVoYsGIJVQewgL1owVZKGgD/brJIAOfTRaujvfZ2h4hCdWYw4TnR5qqLR5kslErYfbxk5LPuMevO6FIJXuTuJXltipYFh9TvEmdTzCuTgEvhR1vJNKkqJzLKommSs2FmZm2HfEm9OXvYLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FLTWF6eR50zNSMwkKYkqDClNHLv07HdvdjPX6gtmwg=;
 b=oZjE4ZG+RSnVsI3ls3dJ23KOn+f7g9yTSCzRsIJuLwWnrddCd9SFPeQiuqoUfHdLfssJ3TsNuLIOqLF7+0b9FTDpHhjRDIjrkxl31nxcDCdnjvNV2mgJMm/h+eMn12ZrYonVH6fQyeBVp/+z23RwqjbGEm9v2bYfYee3kVJHjuND0xkzbpxdzictDbqsHKSGLm5lHmmmpeJW/j41vdiYR615ajx1woeJpK5qTEV0ft981CyU8DDaOHYhbN/Ln4ImGyeFiIodqW9RHEIJg1ysOmbPAHL2ep1jrboOg+nGcHdaFI+Yi/dypHdBB0LDUWMnDrMNwzTIhyG53OY52Zhd/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FLTWF6eR50zNSMwkKYkqDClNHLv07HdvdjPX6gtmwg=;
 b=s2VIdE+N1JqAnCV4s9XVcgybF4OWLC1IOyJByVXR8iGTcbsM2T73h9I8CRcQ9zFTjeRzJ371ZfRFcxoyYeYlDn1M+PcnnlpmiehykymSQGkA0n+Z7HiGvhZz3xeNHP6/WTfyfd73vtDDgcgrhzXQgJJMGhViSdnBJXJcg653G2Y=
Received: from CH0PR04CA0020.namprd04.prod.outlook.com (2603:10b6:610:76::25)
 by CY0PR12MB177289.namprd12.prod.outlook.com (2603:10b6:930:138::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 11:49:00 +0000
Received: from BL2PEPF000352CA.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::7f) by CH0PR04CA0020.outlook.office365.com
 (2603:10b6:610:76::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:49:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352CA.mail.protection.outlook.com (10.167.249.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 11:49:00 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 05:48:59 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 05:48:59 -0600
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 05:48:55 -0600
From: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michal Simek
	<michal.simek@amd.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<naveen.gaddipati@amd.com>, Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Subject: [PATCH 2/4] ASoC: xlnx: formatter: get the stream and audio clocks
Date: Wed, 25 Nov 2026 17:18:37 +0530
Message-ID: <20261125114839.3642735-3-katta.dhanunjanrao@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125114839.3642735-1-katta.dhanunjanrao@amd.com>
References: <20261125114839.3642735-1-katta.dhanunjanrao@amd.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CA:EE_|CY0PR12MB177289:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c9e616-41fa-4976-9c30-08df4aea18a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|1800799024|82310400026|376014|261102123227099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|10067099003|261021121427099003|11063799006|56012099006|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	bwYb9GVaqTloclzLpYxK+VnbVLLr8a3/aTNcmXdmBhBLHDNlq0qVudaA85XqCh4MNErfm6P3qAFAdZ7NX1NT4QDURJQrqTrcGlS/LmZbK9vh0pzK47vYjPt1aNxpPNl9o1Ovhk16RHfMCVBaxUZQS51G/nvzfNTAP3d0lAqxa40fn0uaqCdIgwXE8242oWZDfi17Vyw1hJCFguRLMqDPv3wwZ3Rz2+DNqOFvwhQarNjve8PUuzUGC/BFWrKRinCdZqpQ1pHQIpFCHB4B2889QlE4vUfPvGeQ+pUjyL12cMsSDiSiqwL9bdWywgC4o0aR2jzaTDLSD+nyxqxI0JHOGTSdFFMkMXucDL10h/Pm2Vzh8ZPEueHW1COyZ2VM6cA27mEmpcPN7x4vZNtS/v7Jv8PO9GY9lTcC/CC7HsEgxP9iFEVHa7dnZ1OxzAiCOI5j+M3sTYLwtmgMTv4Umkk5mK0+UfVeMafmtJTDUkmJLeK8W10GMdTvxQT4A9avh0yhmLKbBymxkNac+jejYHUkV8MuAkg+EKi539ZmXoqeH285/gg5WzwFKsk/LLKM/ngqKMz9GcnjFGpv7+3ILBa1pjMgY1oZfWK9sq5b5FV9PUV6PxaFNTHRgnpUDBneEN4aXWELp/B3b/pdPXZ489++rtjUhXe7tyAZY6MFLeLbBWQU5YnClvi8Iv9xL4XtQaLF9DaPoTBvKfjf/qkuBIufEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(1800799024)(82310400026)(376014)(261102123227099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(10067099003)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JouoFWaa4+b+rhn3tejLBv3ulYPL7HwgOuQIFC1D5PYQi/mYPzRmeWB4+WcuJfbkP1Q3ZQ0ofJd5tOSl47Gsakl/Tfqolmd1Uhs3oPxD+jHtH1M05hjinZ5QLnEbw9n1MzosYR3EQnBVm38BDEKPXLqvncLITuFbbgSk3LLnipeF0LlHghtVgmsFXjkjG5LVWIKOJsD2jGgBfEwDrXG6NBp9xS2ZnxToHD2EbDqv4I8pSdAPDfPTGQH9Mam22i9VrhAupfZMZQIXI1ssx0aw0L5BSe08B623XCkQ3aIjDabQFNv4X45Fc66SnY2V5yrXdfi0tS4jiAm7O5FKxYpYThX7JYveNJiFcpOEpg4dimiHlFKxqndtxPrAuHyZ0EdEsZUXHNQ69JRoMzqVeLY1F5QMqhbRun3t3MhP0pqQtBSV4JakY2ebWyZYJQ5kwmeY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:49:00.5498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c9e616-41fa-4976-9c30-08df4aea18a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY0PR12MB177289

The driver only requests s_axi_lite_aclk. The audio master clock and
the AXI4-Stream clock of each data mover are used but never claimed,
so the formatter works only for as long as something else in the
design keeps them running.

Request them through the common clock framework. The stream clock is
taken in the branch that already checks the core configuration
register for its data mover, so a playback only or capture only design
is not asked for a clock it does not have.

All three are optional. The binding lets a device tree name
s_axi_lite_aclk alone and those device trees have to keep working.

Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 2699bef216b1..fa7419439ec7 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -596,12 +596,17 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 	u32 val;
 	struct xlnx_pcm_drv_data *aud_drv_data;
 	struct device *dev = &pdev->dev;
-	struct clk *axi_clk;
+	struct clk *axi_clk, *aud_mclk, *axis_clk;
 
 	axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
 	if (IS_ERR(axi_clk))
 		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get s_axi_lite_aclk");
 
+	aud_mclk = devm_clk_get_optional_enabled(dev, "aud_mclk");
+	if (IS_ERR(aud_mclk))
+		return dev_err_probe(dev, PTR_ERR(aud_mclk),
+				     "failed to get aud_mclk\n");
+
 	aud_drv_data = devm_kzalloc_obj(dev, *aud_drv_data);
 	if (!aud_drv_data)
 		return -ENOMEM;
@@ -612,6 +617,12 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 
 	val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
 	if (val & AUD_CFG_MM2S_MASK) {
+		axis_clk = devm_clk_get_optional_enabled(dev,
+							 "m_axis_mm2s_aclk");
+		if (IS_ERR(axis_clk))
+			return dev_err_probe(dev, PTR_ERR(axis_clk),
+					     "failed to get m_axis_mm2s_aclk\n");
+
 		aud_drv_data->mm2s_presence = true;
 		ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
 					       XLNX_MM2S_OFFSET);
@@ -633,6 +644,12 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 			return ret;
 	}
 	if (val & AUD_CFG_S2MM_MASK) {
+		axis_clk = devm_clk_get_optional_enabled(dev,
+							 "s_axis_s2mm_aclk");
+		if (IS_ERR(axis_clk))
+			return dev_err_probe(dev, PTR_ERR(axis_clk),
+					     "failed to get s_axis_s2mm_aclk\n");
+
 		aud_drv_data->s2mm_presence = true;
 		ret = xlnx_formatter_pcm_reset(aud_drv_data->mmio +
 					       XLNX_S2MM_OFFSET);
-- 
2.34.1

