Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3261F1304
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 01:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772675810; cv=fail; b=HwvTWjOStDd3Vraqvo+EbWI9mCAYODLKqhbWmOQQi76L4WuhNByZ/u90nznRSZM6LyU1i0CLUzZejYel+YjjrM7UE1gk8TVJf9k84NcityRrcJFFXd3S20Gsv39zDUPQSbNjwttxvNxyj227HyQwu5ghxY/+F/YQ6D6fUN15ug4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772675810; c=relaxed/simple;
	bh=Us4vvZqFsFq4aYwbya2k3Mm3rqDtFWTBx13y23X8IUQ=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=q3BgdpFY+g9RIIWwF6ciHUfZSGZuzPmSKqB/kfn0IKszaBiiiTEJKGGqevz8QfdgUAQXD91SM6kITJZv0Cedsi/TXboqyyW6zmkzP25adfYOU6EPHkkEuSVy1QDP0NLLrCPV1KpCnopcAM/iLT5LozqeA1t5W5+ApBTXdBUMJ6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=G9h/mLHd; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="G9h/mLHd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogRiQrpuu0m+E1bQNezq3XVhd01RxpQetVHW5KWCB1wtzfUxQlIOK8YsLFSPOjrvHBgTFjhpTKC6N3R8RSsAtQSV2IcUWZp0o8PJasrqCT62QRrd5HVyBKpgY23OmFLYg2FPJBvNUwzYJs+lainBYE8nQ7CnYSX9IcPH0B0a11qz9cituS6oQ2rexrJzXZO0D60OIXdswSvtvsRtnnYIc5MQeJYGpB6+nOmjv+5nTwB9s1qF4AYMvTN+8BVwSIVisxO9lPzn+pZgsxnuj6HUKC5qXESrA0cXi9PHzBTJ3m/oeB/jW4VOn9E0sS308HCxUjPsRfxaP89jLG7O5a4xRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpcURw/lHatY5l3WrnCNipivwQZQ0DVDQfaPbuD2nuY=;
 b=VUulu6nFSeNUaldRgnMWoJAkew4W4zMlHWqR+uo7iBp5mGP9xIeYgnRafGgS5wBW3yr5obvTt/foYw0fVqna5BwflaGZDN4ICCKr3Hzpy8ev6SErGeHLjCwM80Q2PRw25rheKvbQXxa435exfkVG8mtMy58SvVePrR/6Wsp75Yt5ENSjAqLRs8vVs33jYTWK4apVvuxM1/eAPeYe4BSJMNS4Mfw2SvSKb/VtaQziJKS7Z/I6hPcU2BtXWVZ7bCv0huSg1ZlSzB8Oz/w9D39Xfuv1Vq464IqtHLwtrmLM4GiQgw+OF+fvK9HbwQ6sdUoWJcVY7bl03g62u84SS23Axw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpcURw/lHatY5l3WrnCNipivwQZQ0DVDQfaPbuD2nuY=;
 b=G9h/mLHdgf2GGpdJuKBrYlfmgYY8V6cfWBuvajOxj3fMVww5ioXHco4imAHrvIRsmr0OOWrg6r9gTj9WTP33ZuTjolufPImNnkSk/1M3J3VApJRQkxmb0jH8eJzq1jW1KjMZciS9ODHgO/+LYgipuBWzsNtJWjzE1lFPABP4pZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OSOPR01MB12251.jpnprd01.prod.outlook.com (2603:1096:604:2da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 01:56:45 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 01:56:45 +0000
Message-ID: <87bjh33uoz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Maciej Strozek <mstrozek@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: soc-dai: don't use dev_{set/get}_drvdata() on DAI
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 5 Mar 2026 01:56:44 +0000
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OSOPR01MB12251:EE_
X-MS-Office365-Filtering-Correlation-Id: dca14f80-3adf-431f-2f75-08de7a5a7437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	mnVxZeAymL4MiGsb86QzT2U+SOInn0zVyoXvAuStyj+LOppB2iRchjOOA8QVxxLGYDgrpY4kSkUdfYYwgtcBXZH2v1Syza1ajZ5ijxjMVMW2n7U2tiC15BKNY9igg3UF6vyWuxUKJrQaWae7aF5UXCmojnoPj/revNvnsShV2wlJza2f3WRRX+fGOB0KFGG+wJjXMSJrKAItRQtMXn4rrONXDPvdhhXBaY5pGRs3PMG8b2GXu4+0rI+5Mzr+HW7SbCl8vCnVi0vK5Vkl01O19WsxBgRwdTED+O5V4NNGZVoe0khAldz0aiYKtzcIb2M1RNOfu5apxUW1yVONMCkEVokMKJ46sFZLYZINTIA3jUpRMdC6SOO6RY9rCdDWBQtPBRu5gqABgq2Rn0kp/EatpDW+QEshPYVW87rjR4GVtiSO16ZqpOSK2pDdUj+hIJkIIiuu1puRXgrTxCVFg6RNvyXXbz5vcQoK8VW2KWUMENOepu/1PsE2UivHvjKqg85RGBTzU4a6eXxbpzpgH33YzaO01ko9X5heVm0e0xaLFRIurNvTPj/uHiLMa4+lXpKw75yJzpvwThGE4jL6DDOIp90yTStQajtQ+a9nJNew15fCcDz2qNalH7BPX7MoKcxQVOZ+cmquA1fU9RTo6IHyuR2D3LfqprkSsbvbwlFUj2UMTHoKEquj0zXRAhohptZOiCl2BRlSGYvgHJTsJLfR9sYd8IY/ikJ3PfNY5Frdb2Gd9In7ceLp2ZWBygcWqfAH1jQM1UzUK06Ojmv8MTNRv9ag6X+wBzx6uF8puXPaHdw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GaQ3LSyCFqS70Q5pAN9A7gcNTho2B9nkML78LxFMUm+Wncot6SC2EOzuv7DW?=
 =?us-ascii?Q?Mnf1YXBR8gr/CYdYquHF6jwwR2A+CxlQi7wA3cXTDk0Vd6/YLZD5bbTsOGry?=
 =?us-ascii?Q?lQMGNDw5tzorE+r4pBgop1EqRUY0PbM5vXCs8/ADmLNscA/P7BIA0mbgVjfl?=
 =?us-ascii?Q?55VmBMmVVFr8c8P12jcYGJZdvBWANADh6fCVj9NPBLVQ0xxfyv92icsND7nm?=
 =?us-ascii?Q?V9FSbLB8TNl7LrZ+gU6F3vmh73/imcy1/Tn6iBI29xDZga/ZU/ycwYKcJxZv?=
 =?us-ascii?Q?IEbpWXlpjZ5tC9ctzvmZB1FLL365qscbvD//t9nI+MVI2QOuBWUuMmnfE93Y?=
 =?us-ascii?Q?MdIo399ae6/zox/FbfBYul4p605xJSMRUCan8cuyk1gmqr0f4NSLGZ2MtoVM?=
 =?us-ascii?Q?dCxiZTh1AJqo6wngPRYwgXBkDcxD6UezH3koiKG3+FbeVfmCPZhwFYORJC+X?=
 =?us-ascii?Q?xPmAGhCvSDSz6tjFxS2SIDCBtXZ/AvPR9m1ueT+e3/Ge5VvY/too34UMij8K?=
 =?us-ascii?Q?K4o69iAwd+d4eL4b1FhaPNHmF8TQazSTBxCiqNQdnIwgW0VSeT96so1Mr9mQ?=
 =?us-ascii?Q?K0nsGNc2okck0J7Z1KMUu67Rjy646pbFwiJfJUo1aoA4wT4/A6VZAk2fnLd7?=
 =?us-ascii?Q?0wmm9vL5ODq4sj7QeJaRfAbAMvSElqylCJZR7NLg+3sGXwwYDELcQn54CnN7?=
 =?us-ascii?Q?2+To4tR83SVc20J4y0Mr6Eu/5VZ4K4MJuhMyYqm2PfUpixVYBhB1Pr0H2qsn?=
 =?us-ascii?Q?PW0i09SGuAUekW/zX1J8V3bC4TipFzM34A6+D1A84AEt3T7yK4yBQ30BuTUD?=
 =?us-ascii?Q?kVMrag2DKJkR74xiG2o+EypiNhUqaHgr4t4joP6Dk+H+LW3T3BDG/5EOXv+S?=
 =?us-ascii?Q?x5NwhkDEONCrD9nNFGjCR1KQQI92NqXHxhtSr1ajbae77/ks5TnemPpdIp+w?=
 =?us-ascii?Q?dbC3CT4wpA7KLRWa/zw6UoJz/F4M5qlR66gf75Y2WHOAZgySHtwgXtCFI2vE?=
 =?us-ascii?Q?tHPzJfLDqrP/B6BawVBihB+uaWWA3t8NYGRkkSPyTVnDw/Yr9h1t/nrs81ZE?=
 =?us-ascii?Q?tUfXfCUigwzWdGCGBdwG3VY1gI0nHS35RTa2LgIRnVSdvNyXg2j2JE63rr2E?=
 =?us-ascii?Q?pEt2yWevrJ6/2yrzs7i0TIi/6nUqK+MaQsMuG4h2JVzk9pZuI4MlrGyjOCMH?=
 =?us-ascii?Q?Ut/5iewGhv7+uy0I+xtNlSUn1YpPN76zs0u98BxMwDQJOSVnCysUe12DUbFs?=
 =?us-ascii?Q?Gb3eIlM1I7bwh4kz+HD+UOKCMlwuJGLh4E2a4Q+FQUHIaHOCuG75+ladhlT0?=
 =?us-ascii?Q?PIrDIRP8nZ7tVXTb5BdLWuufUDrd3png5oXen0AOnXfT3DWfdsmjuZ47FsCb?=
 =?us-ascii?Q?pJz03mfO6G/+fszxxPukU/9/k3HAgKtU5t6HYCq6qT//nkxN9oitqLQjadap?=
 =?us-ascii?Q?dhggSIgJA8JgDRCPJNL0qPqh5MQG7A+Efj3ojzvMJRiUATmP0KSTRDbx/o1y?=
 =?us-ascii?Q?L4O17R7bXyfJHCsuft4l+FmbkEl+nQ4E3dC4YIST8/UMuQLmqGPprPyS8zDr?=
 =?us-ascii?Q?VQnoXwZASEPacDzIMqtignGJcIsOS53g/7PrUErL9yottZ0dYl6fOa3VUwxI?=
 =?us-ascii?Q?pSx5ClxexlFaj7c9lReCGSZpeRAchnJWIgRIwBWoRh7v1zYlrqPUiAHep4mv?=
 =?us-ascii?Q?tTruAA4/cXkMyp0ms1ppjGs0YNQnju2DWFPaqrd3Wb325QzxxXwW3gs5XbnX?=
 =?us-ascii?Q?hD/Eu/z56ac+pDSj1hsp+q+IHOybY1Sk9RQi8oPtz8rWs+UgAQeY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca14f80-3adf-431f-2f75-08de7a5a7437
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:56:45.0723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r21PD2QEhhdpahHjVHXSdAUBGyQgHFmWqBIfe1/5JpRaQg0UPxd8JHlVNZ9Aj2SLUYAvcqTCznKuubZWqFp7eL5fAtGJmoETl9CPhmNsliD8HpD4k+NP4mMh89QbJ6tc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12251

We have 2 type of driver data set functions.

(A)	snd_soc_component_set_drvdata()
(B)	snd_soc_dai_set_drvdata()

Both are using dev_set_drvdata() with own dev

(A)	static inline void snd_soc_component_set_drvdata(...)
	{
		dev_set_drvdata(component->dev, data);
	}			^^^^^^^^^^^^^^

(B)	static inline void snd_soc_dai_set_drvdata(...)
	{
		dev_set_drvdata(dai->dev, data);
	}			^^^^^^^^

But, these are same dev.

	struct snd_soc_dai *snd_soc_register_dai(...)
	{
(A)		struct device *dev = component->dev;
		...
(B)		dai->dev = dev;
		...
	}

This means, if (A) and (B) were called in the same time, private data
will be overwritten.

But, in the same time, commit 5f86d41d0410 ("ASoC: soc-dai: Add private
data to snd_soc_dai") added dai->priv for private data, and sdca_asoc.c
is only user of it.

We can re-use this dai->priv for snd_soc_dai_set_drvdata() (B) instead,
and avoid the issue.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h    | 4 ++--
 sound/soc/sdca/sdca_asoc.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 224396927aef3..2b006d3de777a 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -536,12 +536,12 @@ static inline unsigned int snd_soc_dai_stream_active(const struct snd_soc_dai *d
 static inline void snd_soc_dai_set_drvdata(struct snd_soc_dai *dai,
 		void *data)
 {
-	dev_set_drvdata(dai->dev, data);
+	dai->priv = data;
 }
 
 static inline void *snd_soc_dai_get_drvdata(struct snd_soc_dai *dai)
 {
-	return dev_get_drvdata(dai->dev);
+	return dai->priv;
 }
 
 /**
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index a342a4e56717a..c53c74952069f 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1456,7 +1456,7 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
-	dai->priv = constraint;
+	snd_soc_dai_set_drvdata(dai, constraint);
 
 	return 0;
 }
@@ -1472,7 +1472,7 @@ EXPORT_SYMBOL_NS(sdca_asoc_set_constraints, "SND_SOC_SDCA");
 void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct snd_pcm_hw_constraint_list *constraint = dai->priv;
+	struct snd_pcm_hw_constraint_list *constraint = snd_soc_dai_get_drvdata(dai);
 
 	kfree(constraint);
 }
-- 
2.43.0

