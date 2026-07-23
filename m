Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649CD39479C
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788484; cv=fail; b=l+cwOac/XmCHTwOR6/GLyatMH3Cilyr/UqP5HYf0fHffB0f++wtITS8fs0uZMP386ljXQL3heyCQSGUNqiHjeRW3Gj2j+JPCLP4GZI1yCTTdp7KRHodoOGHGgzJ5QJdYPGaz8NWc3419eMhRz/0XDAMyW51Ej8VbkSIKbnTVHU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788484; c=relaxed/simple;
	bh=cpTQV5q0F+Pcc8e8ejMLf/1YufkO+jAAJ7FyfoQj+Ao=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t5yKEZSRh33OFnSprwXoWwDoNkvFwNUdCONTKR2aYw3YDCS8M4sEzkLfZNNzPt4tBr1ozwoCP3W8ah7thYEoGit10ualbxYuLzsWuP4RkJ70FEkkxKNZ4/Qpbn6fn49NW49LViYHGm6ZXl4Zyd+krvTst7ideD5rYdfFbabQsPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TFlrvwgE; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TFlrvwgE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgzLLxYCIuzlLjz17Sp6PH71iOXLD9PPf6biBPsOsi63KHyOyvqjOu6NGIJg+xJ62/uHzzjhb3vERWac5LC86TbSiBIFS8wh6FpFI6lG8xQWnVQt+/jtThnrTkbTi0OXo4TEacS0YhNPeCGxYCWgR7DUoIUGiZ95K8ZY37DiomCTh6Kvbz1DxG8LfSeQrGIdVRQ9OREjeDv6l70S2272zi7MqWZJHucC9jioq3kCvkdD8535yus0YwaTTctQVZAwINQBn6pgLSSEh/cbg91RdEG91gyh8Q3NqWVWN1M+ebcRBEc85Sn1/aEmccopTH7/7sdYN7R6fkO8WuIGyFhVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0nfnbINoq8Ysaf/eYisqICoQZKU/WKyYI8CQ5eD28s=;
 b=UQHmTQPT6fGOTeILfsMKTm0CIqdYXw/JZ/fvxR6KhtbnnknbcO7k+SLuWY2KvBmpYqOovEtE4omSJZz1DI3QwGXwuQKHbtEkAYnMMXEjfyCNoqSaIPj3sylLUDrH4IyAOgbFr0XebeGWMcUJ4OrpgqfSVjWZSKg0JMiRPfR2gajb6p/CvFLKsQMgMgjw9mXjbQNhXaVQtAOAKiFXEIa32U78N2dYLl5ptZeCTU2fiMkMNvpDNMwTw/mcLAvAr46yo8irBIW3ECeobjUnAOGVqYkFyc22us1twDTRfH8orhqD11X8+D/lMAQ8eIuGo0UWYvAaQWbBGtRObxH3V96LzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0nfnbINoq8Ysaf/eYisqICoQZKU/WKyYI8CQ5eD28s=;
 b=TFlrvwgEa4Hv9U+yagDw64eU55xWOtO0Kld7O35tKG6O3Mjm6F8Q9V1LC/uoet/nrSakWYbqG2rgG9Gt7jwKGnKinmaV4VdPiz7GptpWNnfk6jG3po8On3QPh1c+sIOt/RPb8K1kRizeR32JDMoQnpni/r87ggYwh7Ozzu1AL0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB7103.jpnprd01.prod.outlook.com (2603:1096:400:df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:39 +0000
Message-ID: <87pl0erz7k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 06/12] ASoC: intel: avs: use snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
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
In-Reply-To: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 06:34:39 +0000
X-ClientProxiedBy: TY4P286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: c148b8ea-0638-489d-1af5-08dee88478f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|7416014|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BWmN3aT/0ai6HT/B1t5YTeWj4yWLiw99JzwWuRWRvJmsZZCtHru9VmlSALrhPNMWVbuAuu2UFM26I/OKT+LbGCqGS2zVXr9HbFJDtkiR8O7GVsNUAsOnSX5/oJ3bDVO46CqrcrD4JxjVM6YMJMdHtzUPCeKX73Jup9utBSbSuDwss5kMxFpPwafyblj3gbo/sm9ahZPEBG/9MX4nxYy4CoIUWtSPGaONgVx7PsJd568+7fSPUcL+L5YeawvYW7PzdZ3UA7mRB60I9xesgeGazgboV6csLESfqaoChRzNDoJCly3uyaH418vYv4gXUGsyY7L4aSEdvhs1w2pQ3aQJnrN/rIDYoIPZkKVjaHWHIcrB1+LcEv9OFkVrnVd0ipZPhZpGIXWOMk3lbDvT4giE14YCzaFYB8RhE/WcwD+lF/JIOOYkzpJGHDfdli3e5XpowtzOn+MphupxTWqqjSWxdb9/0yxPMD+VCatp8lm6Vs4HWIpo2seVGM0PGfMWHtmy53HtXQFUrr7PHSfYvfeROieGlV67gO8hAjaqppzeENczQQiOGJRxtmpE64m7n/Qp67Rp2a2i3jle8r0JtQkIMADOi1ycao7wr9Bncx9XxSWTj9G55sHWkRZcgrbbI9T5UXCbHg0gODV7BWgMRIm/2gN5z1P7/lNYTq034jPnclFqWxyFV5Sa4UXoLdt2v3hAO+N90DyY1cx0a4cs/ZGVJnvKD1vSrQWv+t/bzQQp+no=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WSd3j/2QirT0Qw1F7gJyyAtcCGo1a7ttpOdnAc1JJcylt39pjO/wPm4pNI8i?=
 =?us-ascii?Q?DExvi1kPQoje4Iysh6lLSLZQwTfIGNIgfAafMYT3UbaM4sgN33Vru2GdFxAF?=
 =?us-ascii?Q?MRCi1sHuhisrBkhN/Kmhrb9n/wByZgloXWC4IN36agVRRn1pMaIy8tBI3LnO?=
 =?us-ascii?Q?YYrYN/lGIuRboY9EpE7izh7S1wQnM/aqN7zyIN15LS6/7s2ZQT+TtZbmozrJ?=
 =?us-ascii?Q?uS59G3IoG8lXB0IRdWXU3bpfug52p0vCupN+X/Y5qhCb7DioZ23ser8vk2dD?=
 =?us-ascii?Q?OTRdzKo0C596XkMtAMa0WAGKUPHCw9E+yCmlLm9FZ23TeAK70WAqKWj+5Jgv?=
 =?us-ascii?Q?w1sUsZqUD26bDCVLNlBgHuwrG5xMATYdkpsc1Ys3YUZEHffkiaUT7+3sf8ps?=
 =?us-ascii?Q?1x6PGzoCFjLsA3ihy0xM1T95Up56oBsbb4qODGIw5PGJTa4J3Kvhqnx+zNBU?=
 =?us-ascii?Q?iKITegRg1GLpS5TrybDlTqisCm8lOMbiiback3lQOuKxJyMHkQu6gBwhmT0B?=
 =?us-ascii?Q?ErA4MdnkPmOndMqbqBqDhywJYpv18iaDfe7Lm4nNi2qL1m1MERzjS5gemFsZ?=
 =?us-ascii?Q?/FWy6wB4+gQNzZ07rIiaXM88Ogrsavu4Eta+xpwRkCdTaVhH7MweVMvAz3I+?=
 =?us-ascii?Q?CBSJUbESSTj8JAdMeL+AUnjW/tMuaEbb6Rq+2uLtgTzRa05r7h7MtGiQ+3VX?=
 =?us-ascii?Q?1HRsQY8cRmwP4IDGeDI3W9LrHdpVyVOskxBbp0zZo9iO7/jAM2SrcaCX7gHv?=
 =?us-ascii?Q?v6B8JVPFYUV0XdhzhOVfIXBkmg6rJ2gWJr49EsxgdfrUy1xT+YmnB1yRDpGg?=
 =?us-ascii?Q?OzZAuTT6Ul41d9YhDf2zO5pjsWQgYHT9f+viKLiciE4vqWOk/lIfjLv5d4Ll?=
 =?us-ascii?Q?HUvNtKReVeGr9rwRdNYZDh1L6WsZHQXzfb+1em26S+s6YePrrwnsz0pZQ6xd?=
 =?us-ascii?Q?1oKkL2wBeq+zaXAWFxq8FJpMCtuhsp1DaUS2NnvIygQYBcxyastXfCY71sYr?=
 =?us-ascii?Q?Eu3zov4UlIW3VO5o8i9aKEtx4rqoPBE4rJzi6sIRfUIyxzsQMXeHrqsZb3Bc?=
 =?us-ascii?Q?Le+M0hrPVorYj584n4nLs+EpgEd0pj5PoRyMESFFZl6al3v10oWgmuA5+Y8s?=
 =?us-ascii?Q?tAWTAFFkqWcnEcTkPDUtF0KJ+WdMxYMrvz6kXS4zMdmABjWIdqGqMblBL55c?=
 =?us-ascii?Q?snkkr+L0z07a2EMXC2m3gWQeYVj1Gob4Q5yeZXanri+wBHsx9g4MrSdyHcdN?=
 =?us-ascii?Q?qnYraIqcrEsuEWZtyo87jjY1tRTWrPzx+AGq741NOizmejcn6026u2e+DKB1?=
 =?us-ascii?Q?ux8mqkTQyMUAK7niSZpbk1Ksk5UY7lzNeOdDrYnYYlknUNYp51paVLNf/3db?=
 =?us-ascii?Q?ti85q0UfVa5VFGD3x4lsaaeq4sv+DiSJiG8qwD72HHdk16CVFVQGs+Q+/aVv?=
 =?us-ascii?Q?cO+ZTfWB6DKNc300L5vNOYi3eaX7OJr63qcNC24d+fhcKnI9C3WKUQ4qEojR?=
 =?us-ascii?Q?e+l0Nhg3Axm9/oPtkEUwmF6LWb3ZsL98VguEm+bHaMU2JhC8YXPNHk/XzMj6?=
 =?us-ascii?Q?PZu2HLpYUyNq7OQTS4roT87InOYKf2Cqq1Y/V1gejuCJDqKn8vwoCIIqsK82?=
 =?us-ascii?Q?bCGX4vt49PqtZSFAFeaWy/eCLON0nyhGqcMVMmRSUy2keBcpYoLoz8oowS8i?=
 =?us-ascii?Q?7r/oS/W95cWqKZUKLHxRb2SEZWwqb64zJxZOCqoaFSLes6jhoaINfUSNXVJ+?=
 =?us-ascii?Q?peCaljSSUF5Fs25/o0sp7JyeLF5kD6/r4Pb13iPa4s1FJgB5JUK7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c148b8ea-0638-489d-1af5-08dee88478f2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:39.6474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6rnB52v1TzrIj6/9ldLa8EH+e4xq0O9gK47MzFxHNFow6MYfB59mcewC7S/JuYnwNnynjADSgFh+ro0R6qM40OhtcPitjJPIb4UTLbPSkMVAOysfcmvoUQ10D5o8DAY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7103

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

It is using container_of() to get avs_soc_component from component, but
will not be able to use it when capsuling has done.
We can now use snd_soc_component_to_priv() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h |  5 ++---
 sound/soc/intel/avs/ipc.c |  2 +-
 sound/soc/intel/avs/pcm.c | 19 +++++++++++--------
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 0f8ddd0e9e5f1..b4f9d66d55ad7 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -336,14 +336,13 @@ int avs_icl_load_basefw(struct avs_dev *adev, struct firmware *fw);
 /* Soc component members */
 
 struct avs_soc_component {
-	struct snd_soc_component base;
+	struct snd_soc_component *base;
 	struct avs_tplg *tplg;
 
 	struct list_head node;
 };
 
-#define to_avs_soc_component(comp) \
-	container_of(comp, struct avs_soc_component, base)
+#define to_avs_soc_component(comp) snd_soc_component_to_priv(comp)
 
 extern const struct snd_soc_dai_ops avs_dai_fe_ops;
 
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 71e7997e52c2f..39b0de9831da1 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -106,7 +106,7 @@ static void avs_dsp_recovery(struct avs_dev *adev)
 			struct snd_soc_pcm_runtime *rtd;
 			struct snd_soc_card *card;
 
-			card = acomp->base.card;
+			card = acomp->base->card;
 			if (!card)
 				continue;
 
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 797b9c9163b49..2b886fae82090 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -958,7 +958,7 @@ static const struct file_operations topology_name_fops = {
 static int avs_component_load_libraries(struct avs_soc_component *acomp)
 {
 	struct avs_tplg *tplg = acomp->tplg;
-	struct avs_dev *adev = to_avs_dev(acomp->base.dev);
+	struct avs_dev *adev = to_avs_dev(acomp->base->dev);
 	int ret;
 
 	if (!tplg->num_libs)
@@ -1387,25 +1387,28 @@ int avs_register_component(struct device *dev, const char *name,
 			   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
 {
 	struct avs_soc_component *acomp;
-	int ret;
+	const char *comp_name;
 
 	acomp = devm_kzalloc(dev, sizeof(*acomp), GFP_KERNEL);
 	if (!acomp)
 		return -ENOMEM;
 
-	acomp->base.name = devm_kstrdup(dev, name, GFP_KERNEL);
-	if (!acomp->base.name)
+	acomp->base = snd_soc_component_alloc(dev);
+	if (!acomp->base)
+		return -ENOMEM;
+
+	comp_name = devm_kstrdup(dev, name, GFP_KERNEL);
+	if (!comp_name)
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&acomp->node);
 
 	drv->use_dai_pcm_id = !obsolete_card_names;
 
-	ret = snd_soc_component_initialize(&acomp->base, drv, dev);
-	if (ret < 0)
-		return ret;
+	snd_soc_component_set_name(acomp->base, comp_name);
+	snd_soc_component_set_priv(acomp->base, acomp);
 
-	return snd_soc_add_component(&acomp->base, cpu_dais, num_cpu_dais);
+	return snd_soc_register_component(acomp->base, drv, cpu_dais, num_cpu_dais);
 }
 
 static struct snd_soc_dai_driver dmic_cpu_dais[] = {
-- 
2.53.0

