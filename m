Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607352;
	b=BqFGtyGgkBc9vgWX1iJ5B4Qob02f3k63wm/duJMwXMNhBVhyridxqju2R0LtnWt6xhpj
	 ShonyBrKql78sA9HDzd/zdSP4bV3ovN+NFd9oCJA1/CgRElazAj+qhaW5NbR2uwWL3Jbo
	 MeEXF9Bc6CI7nBdRCVO8SvGeAJf3A7+NxZS99MYbz/XLt4x+E4K5gauGoLbGCE/JoIkhS
	 uYBMymV/7k/6cy9tCTJldjbL4nwtcPau+m8tqlWhQNrC4BjU7bxK7A/nYZOQg5uOrmAc9
	 ug20vpv8v5tY3mjqUaSJJQnN2g65tazlYToQ0q/CSTf1DPVXPUwghxl31yRmwW/7wKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607352;
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
	bh=/Ql3vC89PIkxyN0/ndWvamgsaeA34zg+lNw5VmKxP2o=;
	b=GwFjoHmm8dbD8ANZ7jCRT27ZX4FlkCc2Uf3NpILuCbd2mQDQWFY1gb9CruDJ168kXMX7
	 an9Yw+EyOLeptGROH2a0CbXyURtC41MtvQpV1wdugDqNyS/wmZTbfXOAXSesODbdftMmj
	 9wcaPegjfYQLHxzg+1tdz4F6LowkQoKkkBCMgBqT28YV46n8u48eR48wkYotJhLH5V5ju
	 gTcDVyYgr7Bk2RUXOuwF9SAZTuF9QnonZnrobxDYDw0Jzq2Fyf0sje35rZkn8g2JsiGi5
	 8uE2ajDY8P9o6m3S9GJcRP3BaUCTABpM6Xxiq2RqDCcQplKohAVdEuIdW+T62zyArgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=C3mKxRsA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.11
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E49606A338;
	Wed, 25 Nov 2026 11:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E49606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=C3mKxRsA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4MlKfxm6/N8Rky41BifSWPjRp83dclM6wdK8JvKhxLb2KpO4XRFlt1diorJ53UoYwDGIJYci4DPlQgHPX8xcCNkLYbJSxW2O2e1SFsWL26AUPydSd1KY2lFe/bQboeHH6KhIJ8eGwaHUHX2SyFf2TeOmjFUoC3f/I+a6Jr1pRUH+ro6ntw/LaU1wkdlT0Hq0lsIZB6QliC1SGRfbCWbad48EmpZjt/AiIWx8LmkqHa14lrZ0Q9+Eyyw6ZY8f9BZ0rcMJrHLs3LVmU7rDNDbsoumfggwAB9TGLXF0cnr1h9YCyjGtpCFPEFbPy1uP+65oYxwvuKDn/LTWYRB+K9V4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ql3vC89PIkxyN0/ndWvamgsaeA34zg+lNw5VmKxP2o=;
 b=shmQNPUQ+rMEL0wJDB61WPFP70SlU2MJr4KSU0BuyZVhoTUsXg2P78jUSiZ6RD8ORZ0L2/0gjDrYVGK+Eb1JpslB3uJUqu1NvitLuJd/KjnuBIMgIoxuKtITxrUQFVHqP4SUMuf3ORcYM8KyADvn89UDnBhvMiFXQtPA8PvqugdDKYta+1tIgcJtzt1fOlb9ea2l06r8/J79n0bbj6JY9z5pZD5YKL6tIrtuTsMMhzacNJxitfc3s9lzCtX+VWmMeEARwRtWoxEeRUGdomWLwT5KCGHqhl2BkuotbH7G9HUPisQB7gUJ7ZQ/18Dwu6zyMB2DEkdGwJZk2PfqEN5AGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ql3vC89PIkxyN0/ndWvamgsaeA34zg+lNw5VmKxP2o=;
 b=C3mKxRsAbwp+CB9i/au0YCGkQ7FaMbCfSLvAxL0E4SwKkeCg6J63kPyYOCzQrthTnjonS3CqaePaGjuKJsjHTI8Dv5EMDEVIc51HnyfqnWYEuGuPnd6AXW/60M93VN4H5khn3y7qyA+s/I9L51b04DYc0MXKAluiv+fgIBWsOJQ=
Received: from CH5P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::25)
 by DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Wed, 25 Nov
 2026 11:49:06 +0000
Received: from BL2PEPF000352CD.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::1e) by CH5P222CA0009.outlook.office365.com
 (2603:10b6:610:1ee::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:49:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352CD.mail.protection.outlook.com (10.167.249.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 11:49:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 05:49:04 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 05:49:03 -0600
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 05:48:59 -0600
From: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michal Simek
	<michal.simek@amd.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<naveen.gaddipati@amd.com>, Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Subject: [PATCH 3/4] ASoC: xlnx: formatter: set a 64-bit DMA mask
Date: Wed, 25 Nov 2026 17:18:38 +0530
Message-ID: <20261125114839.3642735-4-katta.dhanunjanrao@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CD:EE_|DM6PR12MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe787d7-b726-403a-4633-08df4aea1c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|7416014|18002099003|22082099003|261009223027099003|11063799006|56012099006|261021121427099003|261028144727099003|261022075727099003|261026140227099003|261022105027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	9aaahkiEHJbQCpvP0NX5sKQtsxohG1QNk7rOzCm8sGut7JrnSrt8qG8FknqP1zu4r8F7baP9PwJFmVh97iGMjOd8QoA5hyQLsI+1rDiTggSgfspqEttMXvnIQcpSj+Tcyra+0a0LI60HjCNtN8Cev6a27n6TMlz4Avo+Lm8cFHROCU0uCRt6iQ/3yscU9rfQewHrgfwmzfWkeVUJBUa2pjIrzxAhJ8CukNgOxOd27vXVvEVEmvS0PtseeedQ3lfTTLexYJwGKD54OjPNvAXWeI5t28Y96W5c+TOTHUrIq8KXe7NW6usZuS8WlV/PSlh1NmQr/fBN5Dgn1ein2XGNb4+8YIlF2cfdjm3pcZEYpm4r9zfBrRYyBkBrIxWtBZE4tggrYZprhnIZ/25kkz4e+7vZseoKcRWEVpow+aw9oGHNh5GZRkgstH6xtjaQtzhofq4Mib9NQ3dKTuIIelcB9f2dJFp8ooY5YvrKyPkNjtqsMcv70y5P02mtlLAC6d6HzJw6NZB2q7kA0x0lBofDDdf3zeblkQ/L1PQZjEm9Jmqxvx8D7LsYaMsXsZ7/QpMvdTmXUguXA6mP6yTK/D1jtb8sYDy3+325gTlRsa1zTf/oDSvspwRHcAw4COcyHXGUg7cQHBjpfPi7zPkNK+b87Ums+KltiXbDG3Mr9RxBHIVKRJ16UTQxVN5ZQfIoIVkatSmh1CrK1R3Fw7+7KOYpxQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(7416014)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261021121427099003)(261028144727099003)(261022075727099003)(261026140227099003)(261022105027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iFiROJXqWk6jDi8d7k+OGN8s85YXmTZJBxriJc1z43YywxvA+DJjj5tIV0x/8D0dtDhLKWP2GWDAI7toPBwAvj6sisnbp+itLPwcrmpmZ+MExFHYKuZsh9GxzzbNOupSLLsdU9zuyBp+cWA93XKoLWC1NvKkIAeM1F7M93OR2brIJsz2QBOYcGpkg5Zd28RpEyupK4E6MyD3QDvxmW7JkeC8wt9unrzV29SlR1ua7fCgpgZNzuPm8r8UTW+M85Cn48zA55W0GixXSCNPgsWkOyRx4LkV9KPNQ1iNjEmVOVUED0YEjKDuy0xu3IKkDFcZjDqFgsChWGyOzqBmrY6biBvVO4q97B5tue397uG+l30tnCikv7nv11zxjb0U+Qe40w8veYHgjLAJAUy89XGSmXG6lUmmtfAImYcSB0lPFghdzWdJ3GtmXkC9lLIT4vVA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:49:06.4596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe787d7-b726-403a-4633-08df4aea1c26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4251

hw_params splits the ring buffer address over the LSB and MSB buffer
address registers, but the device is left on the default 32-bit mask.
The coherent buffer therefore always comes from below 4G and the MSB
register is only ever written as zero.

Set a 64-bit mask so the buffer can sit in high memory as well.

Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index fa7419439ec7..57901c9466a0 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/sizes.h>
@@ -598,6 +599,11 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct clk *axi_clk, *aud_mclk, *axis_clk;
 
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to set the 64-bit DMA mask\n");
+
 	axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
 	if (IS_ERR(axi_clk))
 		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get s_axi_lite_aclk");
-- 
2.34.1

