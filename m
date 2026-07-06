Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011015.outbound.protection.outlook.com [40.107.74.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5387637CD33
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303380; cv=fail; b=ao+bewhpvin2IpL0ERIivYao90j3K0g/5qLjlyjM1Y6OpthANikCWQcJiRe7U+3fIwxNCBigbXafq8VqM52CH0Jz/bEaf+0ghXVo87jPnE7aSey8dtZibofAyhGSi8XdFcLcXOOehGOpsAqrOZaT7yxxXSK16XHw7as/Sxk1bYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303380; c=relaxed/simple;
	bh=iCR3yDt9KQv84np9bfyBNspsTduywWIBGApJfkkEHp8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kmrt6rtNIWCPYBf0zeAnXdV/NdmQp/bON/kZorktZZTzIK9BaZQs5Wt3iYkQkn9XYkWs63IXvsjtMNvR2c9ckELoa5LGH4nSEL1hF4sJiT0nfles/UEKw8UEE/ir1zgUfFqeY4ltspqAe5mbWfzITs8qbd2qMAxFh0KmBfTOc/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p+T9bNHD; arc=fail smtp.client-ip=40.107.74.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p+T9bNHD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A718AbDIrxbyVqE2mz8peBx1KP0hCObA6i8bTkirVJMOtwlYu1RrVttuLFNMOvBl4CQKfdWQMbKUhiyKapPFAoXdUQG4jUcurhPi+iyxfYWvEGmJPiQZJYDlS8040QByEg9jQZuZEOVZzn0HaGkfgLOrKaaGHGJkr4WAoRMPnxHKcXWVCFv79Rij2QkhCRBuAM3iAeQwzQhwtbkfjMBM86xYhm+t3jpmmBtAuqNTl6mFKM5eCl8anFLXfV5jpItegNGT7tUNc9gnwzTUb/IxwwTyP6PHVagjr7OeLo3ccvwr5XUDcKk9ZRT4mnVUOdv7aXEg6bSWC7Nfp+d9iRRASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuwZYpwjyRiUT63EPwtyP3+3gyunuQAdQSERyFrDMvY=;
 b=BceED9Kcb03yAr1klbGCbcvJKO1gHBpSJPtfp62EO4LpcBFivZ2bcDMg8Bsmvwz1wBBibxIL6kmR2mYY1hQTSHcKB7WUotXr2clB8HpQD5bnUub4OjSLrrdjHhKgd8CI0LgSF9Lod7xPnERf0viBAAU0e9NmfeTmVkT2zwVLv/5hW8Khq0ouCpPuZEQAuo4XFphSPVk2TzycO6zBlg2VRbdKpQMD/u++LoXltvebOQSAiN/ME/IDdiICxyGuIA4gloWO0Y3dPzownZjtW16bzlXAANgGJ7UKtTc8w0GjgQfXvrEmcoCe0/8vJXcRVrqTGV8GdXqRThM6hLu5WJjKSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuwZYpwjyRiUT63EPwtyP3+3gyunuQAdQSERyFrDMvY=;
 b=p+T9bNHDBSoJ+Z80G0RgOUlWt9bziHi5PxHTzp0jOO0Nki2eyWBfq9vSd61UB+qdTdTyQCbBhfzJ+JIGi6S1Fe89DrS9RJlrTj++JYhqP9/ZpWyuuwgpBrSEhNxtQYUeod8FF9la3sX7bOlkWxtqo8jA3Ic1mmN6qGE+avLLxDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14075.jpnprd01.prod.outlook.com (2603:1096:405:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:02:57 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:02:56 +0000
Message-ID: <87jyr8c1tb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 11/12] ASoC: soc-core: makes snd_soc_component_initialize() / snd_soc_add_component() local
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:02:56 +0000
X-ClientProxiedBy: TY4PR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14075:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eea1109-d439-407b-e88f-08dedb02b2b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|23010399003|1800799024|38350700014|6133799003|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KoEm4QBV2NNZmkdZ2hc8sJwWhOnEh30q/yHM0snducFCxXKp9imE7f+gDX1LR1K9U54qzj6p0KKABAIgWo5hVha1Cu9bGj0hdoC5OB3fvjYLnPJkJOSjnzR4yDCIXVa4IYMYwcwRvSWlJqr+dJyUGEkGDU9P4c3/97c1zj5LaCmEHCJZZbcxEc0O5SF9/5t9wc1a5oNB4ZhpVYIHnxEATolDGQOQYpA01GZbUKbjrF1RBhEBtJOOlNL7lBjlwum8joHKOiq0nyv+RGs4s2jojzyUjtXnDPr2SlKTiXgOCp0udSU87Ww3Xk4XVpUYLREi6sEzMHKp+TcGWGU9IUvifF+jss0mHccohc/QMMOKdyA/WBm5zDP9LTBHtV928ww9tGUsvC5xDxdEnWT1oHeFc5/rvs9/lD56qYYjA+lHk89FDpDmXrTtKKLturBrS3+N5YwyHBHUKfFnezHE28eaie/9lyeJDWdJOFWYuH7VK9RTWJ8KTwSks1xj8gmrDURxVsiazT1rZcjkZ95WWc0O4f1ekNAf7ThmNpAx5RuCpIcmdy3wU6AXOV92BVx2aSkHHYVTjNqsD0Pm6F2a+pVNXE3PVqIr21B/fVvnb9X8le3ZAWvCL0s6bddBJ+803BHEAskYcLBXu7F2ZpctcPRgPagQX3WFggOlpo3cWCgmBxGc78XaEwZ6guM3jMLm1th/KOd6Bpog8cU7l0hxujia0cp3Mi11xOHQskYVRXi2hDFRLlJUTqOaowyHBhxxfO88
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(23010399003)(1800799024)(38350700014)(6133799003)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EvPPz5L/80s02oAIznpBy9U/W002gCCMBeNqifEn9Vhuk/0C096KE4Gy9GxY?=
 =?us-ascii?Q?xX7+4oB1mlfvIyn7Oh2owgro7CqPSJDyESoiJMOeV/+VUvd/SSaxjacTEnAA?=
 =?us-ascii?Q?9Z5EH5rbv5ZiCxHlEN0bw02HIRMVGu0AMui1nsP6/8bJjypClX0aepuadtF/?=
 =?us-ascii?Q?ymhOWuebx4fLYfd67KABHcQhZAxbiNdc20mnNuc6UVdJPvWtmyV36NSzTWEY?=
 =?us-ascii?Q?dRhRCs7GjjYdXLBwOpKoJ8D48wHk9p1llBgLaOR9Rcg3i+o1wDawlhdvnnLq?=
 =?us-ascii?Q?TugI3Hd2ogbFfp+ySZ2Y8GkjiTtf5Wira90V3OqaPprusnBz9FQBLhIWfuf3?=
 =?us-ascii?Q?qk7Z+WN8DCGJWf6dHn5dn8QpyBIa2OOGmwHvwTILdoUWVJ8B4tZaFiYzy/61?=
 =?us-ascii?Q?Uiy39LNgq5hGEr70wgTDvC6M5EXH/xBxJDdeWhwJtF72PGIm2EaTop1VzmfM?=
 =?us-ascii?Q?HRFMEqqP1JpALPUnPEjAnS0Ly7noJzgAxssk2bsYTGh7Itps0d+gpK3k6+oB?=
 =?us-ascii?Q?1Xh2fN83zfPk2i2zwBHDl4/eu+h/M2MRMRtwnH9dQCoRhsRSo/zTq8+Gvn2r?=
 =?us-ascii?Q?czKWOFpWlho5SdGT/n0RqP3b3n0mlbNcAh5E9v6mBPODudUzPR2ZhtQryoBb?=
 =?us-ascii?Q?KhIQOPP7Dmushf0Kc6EZ4QFvfCmhA1znKU3uV9T2byDdjnJav8HT3KMFseNO?=
 =?us-ascii?Q?aq/RdecSuJq84w5z8nlnPhO+Vbu5526cHCbF0tzeQm64yw911jGUblgETZUx?=
 =?us-ascii?Q?FYJLY257/QKZz1zmTV1Ay0uT6Pe2gOJH6xyBVmOtNv4178QQ/cBFzNFibsxw?=
 =?us-ascii?Q?DfLb++AuitZm76OsL1kq1OcGUrS6PEDy1xgrXZUNV9xMxmHyBq9SCz69LcdS?=
 =?us-ascii?Q?Dl2cy5xzPaIQm4xSCr/qgi538pcgkCtdegplQ2Tpr9Ab8QsDk5iSG/YzNpgK?=
 =?us-ascii?Q?YQ82uTpAt/U2ZoYH42NeT+5z3tMpZC4JLlMszTnltL6w/jRvwbZunOIAyHMD?=
 =?us-ascii?Q?QVEyh16ykle5coSLubvQX8YtuVm6kSbzQ+0I+8hxgdqbfrRO/EMkTHDXhM+B?=
 =?us-ascii?Q?58B0du/lBbeocu1DbZLJ5irCJfduRqTB0CcnoUa7931Wae3YXyp6UfB0TPJR?=
 =?us-ascii?Q?deM03cpmuwUc7Al9rH5OXybjleBg6oJSLNlwPB4rvdNXQZumNdDPzFmSkUcW?=
 =?us-ascii?Q?5eB4xSu2mzlVtbYaNBTYU2Bqqt8smajHiUU25zIlNNe/D/hx6uc6mIzR/mBS?=
 =?us-ascii?Q?WQYrlURu0yn7ky1KkLUppYvgCg2sx7zbOoK9kiNLBNv42+g2s6+TMdWwtUIi?=
 =?us-ascii?Q?qmXf24oOEP8TjOZ9evdtsKR8aHqxPTEE2d9j4fLIoFq9rtXFisJAS5FXNHRI?=
 =?us-ascii?Q?qEYLi5iiKugxFUqubXcaHa6BOZx4Ha9LRtUEkQqlfuncWRhxUmagfqD5kNEj?=
 =?us-ascii?Q?X5sN66CDD6PkvdB5tmAXUOYkN1f1JlYIRslnjqyyHNIzQrsky/2o3PX8z+go?=
 =?us-ascii?Q?eliXnyUpWqK3x3DVczUQGxu10cCo1CsEjst99yJixFzYJ/RU4LMbnXP2Frs1?=
 =?us-ascii?Q?Dck/2fzjtop4EchzLL+2Z0vVP0Vc4XNCujUBmKaNjNcKlIMmrV2C2wYxfwER?=
 =?us-ascii?Q?6D3+s+9n4RhTbPAkGaP7AJToa7vNAArDZwxc+bHkHi+WLEskG+GX8t/wwle3?=
 =?us-ascii?Q?PWz3XpvhkGxdWkVGu3RJKbRJMwYFRbj12nMRUvpt6yBVIvAR8/EEqvMVr/fc?=
 =?us-ascii?Q?a/0rI0HOhUtJDbMN0kUITlnMZf00+MXddMdOeMB6BUjzRr69weDe?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eea1109-d439-407b-e88f-08dedb02b2b5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:02:56.9258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yq71mnYa/Ad271Fy5FAo+VEQAHWC7UIwX3U2nt8uLDCy9z3dljaF637AwsrRspYIawyQtfny8fPNM6YPwqH4HMTvqQgeZgtjMldNeMNITIP48MDLXpIS3IYRV8pPYEln
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14075

No one is calling snd_soc_component_initialize() / snd_soc_add_component()
calling from driver. Makes them local functions.

It renames
	- snd_soc_add_component()
	+ snd_soc_component_add()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  6 ------
 sound/soc/soc-core.c | 18 ++++++++----------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index cb0de41e2ada5..f46b2bc2a022b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -447,12 +447,6 @@ static inline int snd_soc_resume(struct device *dev)
 }
 #endif
 int snd_soc_poweroff(struct device *dev);
-int snd_soc_component_initialize(struct snd_soc_component *component,
-				 const struct snd_soc_component_driver *driver,
-				 struct device *dev);
-int snd_soc_add_component(struct snd_soc_component *component,
-			  struct snd_soc_dai_driver *dai_drv,
-			  int num_dai);
 int snd_soc_register_component_c(struct snd_soc_component *component,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3b1d18bfadda9..f1368bfe3fa4e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2702,9 +2702,9 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 	list_del(&component->list);
 }
 
-int snd_soc_component_initialize(struct snd_soc_component *component,
-				 const struct snd_soc_component_driver *driver,
-				 struct device *dev)
+static int soc_component_initialize(struct snd_soc_component *component,
+				    const struct snd_soc_component_driver *driver,
+				    struct device *dev)
 {
 	component->dapm = snd_soc_dapm_alloc(dev);
 	if (!component->dapm)
@@ -2730,11 +2730,10 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_initialize);
 
-int snd_soc_add_component(struct snd_soc_component *component,
-			  struct snd_soc_dai_driver *dai_drv,
-			  int num_dai)
+static int soc_component_add(struct snd_soc_component *component,
+			     struct snd_soc_dai_driver *dai_drv,
+			     int num_dai)
 {
 	struct snd_soc_card *card, *c;
 	int ret;
@@ -2773,7 +2772,6 @@ int snd_soc_add_component(struct snd_soc_component *component,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(snd_soc_add_component);
 
 int snd_soc_register_component_c(struct snd_soc_component *component,
 			const struct snd_soc_component_driver *component_driver,
@@ -2782,11 +2780,11 @@ int snd_soc_register_component_c(struct snd_soc_component *component,
 {
 	int ret;
 
-	ret = snd_soc_component_initialize(component, component_driver, component->dev);
+	ret = soc_component_initialize(component, component_driver, component->dev);
 	if (ret < 0)
 		return ret;
 
-	return snd_soc_add_component(component, dai_drv, num_dai);
+	return soc_component_add(component, dai_drv, num_dai);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_component_c);
 
-- 
2.53.0

