Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9BA22B8AB;
	Thu, 16 Jan 2025 14:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737039360; cv=fail; b=YmbPIH7rPQxmFD4YEd3d6dN4qpjUGN9KgOVF76oF7zS65CGA3xF5R+oHygYtdEhcG+4X/VOedErecbBeaPO6+Cpn2NyFl3pobKlB8WmDkKI+yWQ/3cQBSHP4g3OWstQQuJaqXzOPwuLl0OHWoXaN7GyG236VP7pGRpvy00/+Nsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737039360; c=relaxed/simple;
	bh=0Ktv+wOQ0OoxXs5ewz4zwlQPybmIngZ7R6XujmeuIBo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lPEAWO+1EsTbLN9VKOht2jvUK6507iNC28g7GUue72fiAU54X+IOYMIMzUo9dsqw+B33ay9got71hElfKIZsTFe2UXU+R23QpwLuh9/NoIUjraaDR7InBdlpcA+ztwHrVx0VmvpirVXpXS96uaGNl/PFNUia3r5x/RtaCCQ99eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2zS9JG/J; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2zS9JG/J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ju1maHZVxppXMacVjVEgqU6dJ4oHfkqAMwqLb0mZ8uJhwdY5EvYpOuSQABXzxksrb/C2jRmD6HGl3CvfrGxt9Qo3hIjZKgu113FYHUiddfYncG3ranXLptWaKDiSjP21rvVkdyd5vPb/IPZ/l792R8smWRVWd5eIptt7ucS11zzbBpUIsE2+K4B2Gj8PGHhltTEDVnlKAAX30O6wwnBUgnULHnMDaG/T3kNQfurswVvGzrtxkrj+S4a2z8HZSc8V8JyVjvsXrvYqaebbv96kS7P/f836/X8/A5fFo2wSGaGMH459B6GbPGLTcaYwfpan87yophWP4WZHgXRC+yUq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RN+lUqqXfFFnt2ftAYlgEuz6QuwjjAyaGeEfpafExi4=;
 b=BImf54nynLKvviX9MHiKL3LVhCOQB99TftYLpzZT8IubqgVWz6l6+ioX9YgcUnXzPHQih/ZT5hOu+fJMNdgGyTd289s2g9jqZEFyvBEHyAeoNXi9mQkpHU0kZkCQpXUtruT7ymfIi7h0L7BPL45E16W6uFcbJv/Dk2AFxnq2E7U0dpHsNd+3tTrs0Hl5SmVhy8FURFHS8en85qId8nWYTZpbOZfaHAZggIhrjdtOODUzGz2ncnUxDudTKppsUdgUCtOKyJJEthEem9IvwO9RtOCQzlCNzMW49t57lIRhDk6qynV3wG4wlvUF6tsRaNLW4wczsDEKiDuBBy7MGRNSiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN+lUqqXfFFnt2ftAYlgEuz6QuwjjAyaGeEfpafExi4=;
 b=2zS9JG/JXaOCOSy8gJ+BBq1TKohKtYVrXowARLLaMxo7u+2xed1t1tpI3xIxq1wRFfH9FeebG9bHoxNY8HioAaYxoLHSiQkxpl5ctRpDPkDfJIQyR1PMla0Lil+ApyZKguR/50HQVbLhHsYCODDazJXZWyL4m4REKeJQHkD+DOY=
Received: from SA0PR12CA0028.namprd12.prod.outlook.com (2603:10b6:806:6f::33)
 by DS0PR12MB8366.namprd12.prod.outlook.com (2603:10b6:8:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 14:55:54 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:6f:cafe::98) by SA0PR12CA0028.outlook.office365.com
 (2603:10b6:806:6f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.16 via Frontend Transport; Thu,
 16 Jan 2025 14:55:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Thu, 16 Jan 2025 14:55:53 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Jan
 2025 08:55:50 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>
Subject: [PATCH] ASoC: xilinx: xlnx_spdif: Simpify using devm_clk_get_enabled()
Date: Thu, 16 Jan 2025 15:55:46 +0100
Message-ID: <90075f57ceff7cdf958d0d146f46f50661335236.1737039345.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3096; i=michal.simek@amd.com; h=from:subject:message-id; bh=0Ktv+wOQ0OoxXs5ewz4zwlQPybmIngZ7R6XujmeuIBo=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvRO2c+2/o3vM5eXZ7yq+3C/u3Pdw4DMf3+ufcqacVi40 DNpqsKCjlgWBkEmBlkxRRZpmytn9lbOmCJ88bAczBxWJpAhDFycAjARobsM872kGuwudG4y2Fu3 42jbf5Wdu+JarzHM9w742ZT8ePNeizfH+2f8e5x7w1/GFAA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|DS0PR12MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 1273cf12-caf2-4be2-d3d3-08dd363de002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?clvqNkrgbtGhFHMA9qSSngGD5CDp8ZjOXmVj5MyDRtznLhLKbEVRBLlUFOk5?=
 =?us-ascii?Q?DmgPgfl/udP5K8YyqT6qeGU3PEPuk21rzMh1RXnlgcIlRvftGW9Dztoh/HME?=
 =?us-ascii?Q?EUqL/GJhuLFUbVW/DqN4o8Y8D/rBG6lZJ3DOAA9QEcwckvnLUy7Pwdj0gm9q?=
 =?us-ascii?Q?SnsRwIBzChBkNxhVSXBeyIoIaR/QiI5yP8FIV9Xp9pb57Vc6WJadHC4EYCXY?=
 =?us-ascii?Q?zmNaXQER3O6PIisKL+gZcKsu3QXGjHjVqzXXLiGrWSfMtPccnneFktecdXR5?=
 =?us-ascii?Q?3koxR74o9/yIkm5OUtu1b7Se2m5RHhLitaJD8AI0EWnuxNxPnniacIDEAgwz?=
 =?us-ascii?Q?nVBm8usgGxGHlIs+76s6CL+TXkuYSpvPD4OtcSS69n33Cmx87J7Zx1n0Hr2G?=
 =?us-ascii?Q?VTiwSoCv6XxjNvRLs9h19B4oOe+i1O5+1VafVgXChwEm/u3ljZpCosTHY6Z/?=
 =?us-ascii?Q?+wYEarCugY4tZyJ6s/5BtXUN6G4w3CXqNkyKUE2awsUje7GzBIkb5mXvm7CO?=
 =?us-ascii?Q?javXZ071mrFEEZo9gufxsUfT6HcxFOx9Pbwn34h869W9IfPO+y+nPcGcFH9y?=
 =?us-ascii?Q?YqAMMAyPU3EX9LaEduaw/3LhTqhmkG1xaA2P96WXLPx8Z6m6arfFJbx2IRJC?=
 =?us-ascii?Q?WtBa3gADsYjSm686LPmw5o+A0cRnuArLAjwaqgAff7LbmMvktu8qka8HJYuH?=
 =?us-ascii?Q?EIuxoNZaQjM9Xobx60rr3ZvBB5Ca6XY4OFcW30vdZBPAHmov/KTvKOKY0xWc?=
 =?us-ascii?Q?lYC9uGgqee47Tuc2kTDPxfK+8Byio8MTZnJ2A+CY861GIfW9QTTkvIv+Q1jL?=
 =?us-ascii?Q?opqt6ngch05QBTCsOkQobQVyv2T3GrYHBqElM/QrNXJmrbx55GRi2yrvGAHW?=
 =?us-ascii?Q?J3oYfiyKzwQqO/RhbcrRF/zjuW8z6lvFIkC9sxjQ0gSRgd1ZL2hfpt6fF0Es?=
 =?us-ascii?Q?oBw0RfPsrAxpcpxEDx5ohwMlvHkngp3iVbiXFU5bdaBi9+TBMP1NbEFZYXCp?=
 =?us-ascii?Q?ga+Tgc9bY9DSgjsB4/w7G0djoFAq3PRyygYC5deLIcHjGqCmO/agGY/Y9szE?=
 =?us-ascii?Q?+N3b/aCWFIGdRKTXe1eons3sTIg9AW5H9YKsVVt3WF8YhBealbxniqU15LVX?=
 =?us-ascii?Q?CYOXjLwqsj7rSfeOMh0ibzOzzGBdckJ7tzpDfdIQAgJJUDYMxh1BxvDaFy+6?=
 =?us-ascii?Q?YxecvprzTSVsSHSwxTV+NXz8AkJcnK/zFrDfrbBRwguxnB89DLWLfsLgS4B0?=
 =?us-ascii?Q?TP/OVUNrzvuwX+wOh1g0rmN2JbmYLXHs3brJXuYyJr84ayMf2KBdcDV0YfIg?=
 =?us-ascii?Q?UYDJs08tDb1C/4bda4zUk0MGDmPSihIDjErONBLbMqz+YprLmT+64KIRwbv8?=
 =?us-ascii?Q?d6q3jqPyXxjP9qP4FMYosD1AG/foU/0mlEf3iDBoiy8VcKBsOT38iIvfRolQ?=
 =?us-ascii?Q?cYq9eqsi7E76/edGuS4ZustySv1uXWXevM9Ybxj/PXBVyiKc41AYlEUGBczj?=
 =?us-ascii?Q?xVbmrO9ZsKRHA94=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 14:55:53.4883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1273cf12-caf2-4be2-d3d3-08dd363de002
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8366

Clock handling can be very simlified with using devm_clk_get_enabled() as
was done by commit 8d2aaf4382b7 ("gpio: zynq: Simplify using
devm_clk_get_enabled()").

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Compiled only.
---
 sound/soc/xilinx/xlnx_spdif.c | 38 ++++++++++-------------------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index 7febb3830dc2..017a64ab9f1e 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -248,41 +248,35 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->axi_clk = devm_clk_get(dev, "s_axi_aclk");
+	ctx->axi_clk = devm_clk_get_enabled(dev, "s_axi_aclk");
 	if (IS_ERR(ctx->axi_clk)) {
 		ret = PTR_ERR(ctx->axi_clk);
 		dev_err(dev, "failed to get s_axi_aclk(%d)\n", ret);
 		return ret;
 	}
-	ret = clk_prepare_enable(ctx->axi_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable s_axi_aclk(%d)\n", ret);
-		return ret;
-	}
 
 	ctx->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(ctx->base)) {
-		ret = PTR_ERR(ctx->base);
-		goto clk_err;
-	}
+	if (IS_ERR(ctx->base))
+		return PTR_ERR(ctx->base);
+
 	ret = of_property_read_u32(node, "xlnx,spdif-mode", &ctx->mode);
 	if (ret < 0) {
 		dev_err(dev, "cannot get SPDIF mode\n");
-		goto clk_err;
+		return ret;
 	}
 	if (ctx->mode) {
 		dai_drv = &xlnx_spdif_tx_dai;
 	} else {
 		ret = platform_get_irq(pdev, 0);
 		if (ret < 0)
-			goto clk_err;
+			return ret;
+
 		ret = devm_request_irq(dev, ret,
 				       xlnx_spdifrx_irq_handler,
 				       0, "XLNX_SPDIF_RX", ctx);
 		if (ret) {
 			dev_err(dev, "spdif rx irq request failed\n");
-			ret = -ENODEV;
-			goto clk_err;
+			return -ENODEV;
 		}
 
 		init_waitqueue_head(&ctx->chsts_q);
@@ -292,7 +286,7 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 	ret = of_property_read_u32(node, "xlnx,aud_clk_i", &ctx->aclk);
 	if (ret < 0) {
 		dev_err(dev, "cannot get aud_clk_i value\n");
-		goto clk_err;
+		return ret;
 	}
 
 	dev_set_drvdata(dev, ctx);
@@ -301,22 +295,13 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 					      dai_drv, 1);
 	if (ret) {
 		dev_err(dev, "SPDIF component registration failed\n");
-		goto clk_err;
+		return ret;
 	}
 
 	writel(XSPDIF_SOFT_RESET_VALUE, ctx->base + XSPDIF_SOFT_RESET_REG);
 	dev_info(dev, "%s DAI registered\n", dai_drv->name);
 
-clk_err:
-	clk_disable_unprepare(ctx->axi_clk);
-	return ret;
-}
-
-static void xlnx_spdif_remove(struct platform_device *pdev)
-{
-	struct spdif_dev_data *ctx = dev_get_drvdata(&pdev->dev);
-
-	clk_disable_unprepare(ctx->axi_clk);
+	return 0;
 }
 
 static struct platform_driver xlnx_spdif_driver = {
@@ -325,7 +310,6 @@ static struct platform_driver xlnx_spdif_driver = {
 		.of_match_table = xlnx_spdif_of_match,
 	},
 	.probe = xlnx_spdif_probe,
-	.remove = xlnx_spdif_remove,
 };
 module_platform_driver(xlnx_spdif_driver);
 
-- 
2.43.0

