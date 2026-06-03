Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013001.outbound.protection.outlook.com [40.107.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3057322B8C;
	Wed,  3 Jun 2026 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780521531; cv=fail; b=spGjfQqNndhYYB8f+TZHLBG9auuBmaUuDSjS19oysMNF6SNLSluTZS1VyEg1l2bzuwJenqOq/qUFo707QXOUAC1hXSel7Qmsv9/N4CvByEbKkkfJ2eaFRw1X0SSHZLOkPMzlTbWHbVEuoLdDrjrN9p5ojuly06DRTRarNOBzfcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780521531; c=relaxed/simple;
	bh=CBb0lJWYtFgAkQ070DI2++nE7Ss6mummnN0Et5RMQbE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uB7Y/UZzASWzl8XMHctzfBJkaUc8/DPkZQ99sCTcNnd2zAAmxIjhM9tQR+nYKwGMhMVIDtxGXC5o2Y2Bh0lWdtxC2tF+iurEpI1SgXQvhNxmZ/Qgj4sAGPSfQzh/5WwZR2m0E07XVWBH6X4SI+qhmlaRw6oKXP/HZ37q7kNaZJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qff4uzdl; arc=fail smtp.client-ip=40.107.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qff4uzdl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+mL04z3LQZWUH6kpdQ+4g4YJ1ChflYqsgUizrsYoXsV6+4yfIhqf4zuebCw3xoL98qRb+ulmHg/ZHz14W8dZsMCUqta/riTbusjAA54EdjRq0EYK3nzDf+kk/aNoKVpnIXdgqrMRSi73hfIxYMfpGfNu9vib+0VVnWHvECyykcEygp4TVEcj0YQU5S9Yd7rI+XB5MCMeGSqGXZr6Ef2B30S+AHm7N9wX5Qmo96Du1dliaN3tiHPTQW+9qpg6h1JJbQiTZhq/6n/vgy8twcRxlFAZMtghPpH/TK9oPy34y3V/uhxS6qLDQScsjLu/iEyxYGJTvEOBVEwLZQ6sWoMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ch8yHPt8IDTP3fSQ9eZkQVZw8I3wu3De/Br54JIoQyk=;
 b=CfiQ4lHcsS6U5cxURblUTcFz9qMI6WnbVdAPHoS+LhEn5bfFEca9ZiozbAumYKTjiElfxsHF1HXlwqgMXa68KR7P0OXiFY9mAGZ20Z+FpuGdKDZfJmBIExLuULar8SipIbsnaV5oTrlq0l0gaXqLA5s1shc42y4llPT8WoIvDJrwy0/WtjghCyjjwBfYVuZf5O4FroskIdJLblRLQKzhLw94OuaZyyhJSlWCIgHPgXn8Iz14o80omyWGZvRXPodg14eBIB5QLdVplsNHoqt0sEsNF7/9unKjAgELURCa/2ruw9TBayZpIUI3fGGIFxXcHkGr4UjR71kOUrEBqh95Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ch8yHPt8IDTP3fSQ9eZkQVZw8I3wu3De/Br54JIoQyk=;
 b=qff4uzdlpijls3fvMiCto8BmTV51QJtHIvGienYSmFkOt5aET1oYVx8P+CIXel0yUUHdhhq5f6GGEBEoBW74gD9kDYJ3FVhpoq6L6rAzDmf2LDoRmkTy7hXP9l/CIrIZ92XTDEqbZyptyakSO99XlTnStn1hnrYFmOZ10OIZok0=
Received: from MN0PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:52c::21)
 by PH0PR10MB4503.namprd10.prod.outlook.com (2603:10b6:510:3a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 21:18:46 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::7c) by MN0PR05CA0017.outlook.office365.com
 (2603:10b6:208:52c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 21:18:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 21:18:45 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 16:18:44 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 16:18:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 16:18:44 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653LIix32530014;
	Wed, 3 Jun 2026 16:18:44 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH] ASoC: ti: davinci-mcasp: Add audio-graph-card2 and DPCM support
Date: Wed, 3 Jun 2026 16:18:30 -0500
Message-ID: <20260603211835.635184-1-sen@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|PH0PR10MB4503:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d2bdb72-5c8d-488f-e91b-08dec1b5b202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6Z0rLr1yW5ab/LlcUyLOmBNpLoHf/cJo+2PWj+nv9SFGVdjv+iKiGtn7K0iSI4iF2lgFmfh0iZmMdORMJty+rXd/od065DrFH1p29C6YUFk6Ew9jSVwkB/yPGG2kjs4mq4E0s7xBT0Yen0iZ0Z1bVOdJ44K7niC3GAij06osE0FokJcg+t1WZsN1CF6rYlvYVoP/ubv+wYMVzamzsl6VUxgLUqTQVJSkaxN7z3vvyoZ3rrEH2ygCHYiWz/ks9lk2SLn/4DseyXx+3gIgExhtFAyxBlXDQ2JU7bAOk1wcna5ECBRzrW1DJpvnJUqHjCk6SVwqIWTqFqUTb8xlN5BXdnQeaJ60eFN+NFEBaukBSEYHimfvKEd4DFS74NMFuj1btmOdA4kukTJiZiUSn2OpboexVNnJRqTrYpeG9Eh5xNacJ5An/zYDeoOfOI3nzqhSandig7EIVvjIV8dmMfJmTzO51vg/fI1u1vfHSZR+PbIIpcq1M0Txc3b5rqeXlztaPKhmCwA8pBcX+/f0IpLLQWknsx6Z/nCWfy34eGsDM6XvO2uYJjLQraNB7aSY7fC+X0ab98ZAGRCwLqeZuWpQTCagFDTEXlI2DaleNXJPQ0r8+fyQd8KQEFub6wbuvAKb3EukI4nL+WsnD8mjFr7/0AW/30JcVO9706DzYZjiLsbtWrYymVLRyE2lHMCGHPBPuCpKGqjbE72/TmS2mL0Vm7jiRkkcb7UVArzpGLQkBko=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mei1bpMB7ZSA2mQY+xo+6SuM5GOzLgx8q05VheXMN2pmHmEyursWOql4JlgXr2YzipNtDI3QEH9Uz63xSjwOe/Fqr3MZvhI1v6KnEUkxGy+Or44PHZCtX21bDXjmBGnkNv/EmI1FQ6n8wBXOujIRrKlIlc7PyQn/L5rdKL9vVsWGjEE0hVK5kBqr4FZTRVLOvpFYbsk5R/C+dk4s5oHDU9krwSCwnuPz9p8cAB0GgKPeG4wH/Nf2FKOzsQMqOcf2Lpii4HPz/6Gs7p/FL9UFypfBRDoAx2id68jxXNV5XOONNaqXxS/hX0xHlJcXI/K2e5A3jJton7nbYqLFSyye02ONEiCKGeNKGUXY2w6qkcEq1ynA5YGkI6iQna6hgYv4Liakkr967KerHeDD629w+9YvCbIpeuxyGhhCkAlB7kZo7ioxd/5XiI6E3tgm0i+b
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 21:18:45.1801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2bdb72-5c8d-488f-e91b-08dec1b5b202
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4503

Extend the McASP driver to support audio-graph-card2 of-graph topology,
while maintaining backwards compatibility for existing simple-audio-card
phandles and machine drivers, which now uses the default MCASP_GRAPH_NONE
code path.

Signed-off-by: Sen Wang <sen@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 183 ++++++++++++++++++++++++++++++++++-
 1 file changed, 180 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index f229f847eaf4..79239131b659 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -21,6 +21,7 @@
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_data/davinci_asp.h>
 #include <linux/math64.h>
 #include <linux/bitmap.h>
@@ -74,6 +75,14 @@ struct davinci_mcasp_ruledata {
 	int stream;
 };
 
+enum mcasp_graph_mode {
+	MCASP_GRAPH_NONE,	/* 1:1, simple-audio-card, no of-graph endpoints */
+	MCASP_GRAPH_PORT,	/* 1:1, audio-graph-card: port { endpoint } */
+	MCASP_GRAPH_PORTS,	/* 1:N, audio-graph-card2 non-DPCM: ports { port@0; ... } */
+	MCASP_GRAPH_DPCM,	/* N:M, audio-graph-card2 DPCM: N FE DAIs, detected via */
+				/* remote "dpcm" node in the sound card DT */
+};
+
 struct davinci_mcasp {
 	struct snd_dmaengine_dai_dma_data dma_data[2];
 	struct davinci_mcasp_pdata *pdata;
@@ -124,6 +133,10 @@ struct davinci_mcasp {
 	int	max_format_width;
 	u8	active_serializers[2];
 
+	/* Audio graph support */
+	enum mcasp_graph_mode graph_mode;
+	int	num_dais;
+
 #ifdef CONFIG_GPIOLIB
 	struct gpio_chip gpio_chip;
 #endif
@@ -1486,7 +1499,18 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	ret = davinci_mcasp_set_dai_fmt(cpu_dai, mcasp->dai_fmt);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	unsigned int cpu_fmt;
+
+	if (mcasp->graph_mode != MCASP_GRAPH_NONE && rtd->dai_link->dai_fmt)
+		/* clock provider bits stored separately in ext_fmt */
+		cpu_fmt = snd_soc_daifmt_clock_provider_flipped(
+				rtd->dai_link->dai_fmt) |
+			  rtd->dai_link->cpus[0].ext_fmt;
+	else
+		cpu_fmt = mcasp->dai_fmt;
+
+	ret = davinci_mcasp_set_dai_fmt(cpu_dai, cpu_fmt);
 	if (ret)
 		return ret;
 
@@ -2029,8 +2053,31 @@ static struct snd_soc_dai_driver davinci_mcasp_dai[] = {
 
 };
 
+/* Translate of-graph endpoint to DAI ID (DPCM: port reg; else 0). */
+static int davinci_mcasp_of_xlate_dai_id(struct snd_soc_component *component,
+					 struct device_node *endpoint)
+{
+	struct davinci_mcasp *mcasp = snd_soc_component_get_drvdata(component);
+	struct device_node *port;
+	u32 port_reg = 0;
+
+	if (mcasp->graph_mode != MCASP_GRAPH_DPCM)
+		return 0;
+
+	/* endpoint is inside mcasp/ports/port@N — read port's reg */
+	port = of_get_parent(endpoint);
+	if (!port)
+		return -EINVAL;
+
+	of_property_read_u32(port, "reg", &port_reg);
+	of_node_put(port);
+
+	return port_reg;
+}
+
 static const struct snd_soc_component_driver davinci_mcasp_component = {
 	.name			= "davinci-mcasp",
+	.of_xlate_dai_id	= davinci_mcasp_of_xlate_dai_id,
 	.legacy_dai_naming	= 1,
 };
 
@@ -2138,6 +2185,88 @@ static bool davinci_mcasp_have_gpiochip(struct davinci_mcasp *mcasp)
 	return device_property_present(mcasp->dev, "gpio-controller");
 }
 
+/* Return true if the remote sound card uses a "dpcm" container. */
+static bool mcasp_detect_dpcm(struct device_node *np)
+{
+	struct device_node *ep, *remote_ep;
+	struct device_node *port, *container, *parent;
+	bool is_dpcm = false;
+
+	/* Grab the first endpoint under this McASP node */
+	ep = of_graph_get_next_endpoint(np, NULL);
+	if (!ep)
+		return false;
+
+	/* Follow remote-endpoint phandle into the card node */
+	remote_ep = of_graph_get_remote_endpoint(ep);
+	of_node_put(ep);
+	if (!remote_ep)
+		return false;
+
+	/* Traverse the remote: remote_ep -> port -> ports@N -> dpcm */
+	port = of_get_parent(remote_ep);
+	of_node_put(remote_ep);
+	if (!port)
+		return false;
+
+	container = of_get_parent(port);
+	of_node_put(port);
+	if (!container)
+		return false;
+
+	if (of_node_name_eq(container, "ports")) {
+		parent = of_get_parent(container);
+		of_node_put(container);
+		if (parent) {
+			is_dpcm = of_node_name_eq(parent, "dpcm");
+			of_node_put(parent);
+		}
+	} else {
+		of_node_put(container);
+	}
+
+	return is_dpcm;
+}
+
+/* Detect audio-graph topology and return the number of DAIs to register. */
+static int davinci_mcasp_parse_of_graph(struct davinci_mcasp *mcasp,
+					struct device_node *np)
+{
+	struct device_node *port, *ports;
+	int num_dais = 0;
+
+	mcasp->graph_mode = MCASP_GRAPH_NONE;
+
+	/* audio-graph-card2: ports { port@0 ... }; DPCM -> N DAIs, else 1 */
+	ports = of_get_child_by_name(np, "ports");
+	if (ports) {
+		int port_count = of_get_child_count(ports);
+
+		of_node_put(ports);
+
+		if (mcasp_detect_dpcm(np)) {
+			num_dais = port_count;
+			mcasp->graph_mode = MCASP_GRAPH_DPCM;
+		} else {
+			num_dais = 1;
+			mcasp->graph_mode = MCASP_GRAPH_PORTS;
+		}
+
+		return num_dais;
+	}
+
+	/* audio-graph-card: single port { endpoint } */
+	port = of_get_child_by_name(np, "port");
+	if (port) {
+		num_dais = of_graph_get_endpoint_count(port);
+		if (num_dais > 0)
+			mcasp->graph_mode = MCASP_GRAPH_PORT;
+		of_node_put(port);
+	}
+
+	return num_dais ? num_dais : 1;
+}
+
 static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 				    struct platform_device *pdev)
 {
@@ -2555,6 +2684,53 @@ static inline int davinci_mcasp_init_gpiochip(struct davinci_mcasp *mcasp)
 }
 #endif /* CONFIG_GPIOLIB */
 
+static int davinci_mcasp_register_component(struct davinci_mcasp *mcasp,
+					    struct platform_device *pdev)
+{
+	struct snd_soc_dai_driver *dais;
+	int i;
+
+	if (mcasp->graph_mode == MCASP_GRAPH_NONE || mcasp->num_dais <= 1)
+		return devm_snd_soc_register_component(&pdev->dev,
+						       &davinci_mcasp_component,
+						       &davinci_mcasp_dai[mcasp->op_mode], 1);
+
+	dais = devm_kcalloc(&pdev->dev, mcasp->num_dais, sizeof(*dais),
+			    GFP_KERNEL);
+	if (!dais)
+		return -ENOMEM;
+
+	for (i = 0; i < mcasp->num_dais; i++) {
+		memcpy(&dais[i], &davinci_mcasp_dai[mcasp->op_mode],
+		       sizeof(*dais));
+		dais[i].id = i;
+		dais[i].name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+					      "davinci-mcasp.%d", i);
+		if (!dais[i].name)
+			return -ENOMEM;
+
+		/* Unique stream names per DAI */
+		if (dais[i].playback.channels_min) {
+			dais[i].playback.stream_name =
+				devm_kasprintf(&pdev->dev, GFP_KERNEL,
+					       "Playback Port %d", i);
+			if (!dais[i].playback.stream_name)
+				return -ENOMEM;
+		}
+		if (dais[i].capture.channels_min) {
+			dais[i].capture.stream_name =
+				devm_kasprintf(&pdev->dev, GFP_KERNEL,
+					       "Capture Port %d", i);
+			if (!dais[i].capture.stream_name)
+				return -ENOMEM;
+		}
+	}
+
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &davinci_mcasp_component,
+					       dais, mcasp->num_dais);
+}
+
 static int davinci_mcasp_probe(struct platform_device *pdev)
 {
 	struct snd_dmaengine_dai_dma_data *dma_data;
@@ -2760,9 +2936,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &davinci_mcasp_component,
-					      &davinci_mcasp_dai[mcasp->op_mode], 1);
+	/* Parse audio-graph structure and register DAIs */
+	mcasp->num_dais = davinci_mcasp_parse_of_graph(mcasp, pdev->dev.of_node);
 
+	ret = davinci_mcasp_register_component(mcasp, pdev);
 	if (ret != 0)
 		goto err;
 
-- 
2.43.0

