Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B048332694E
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597626; cv=fail; b=bo70zTyXO4jQ5jdRbCb2BKDtcbnflo8IPgwfwAcWEoqYtyMKx7hiUHi//riKqi2d/a9CyIHHtj/cLr5ziGgY3MMgZgBzFHeqE7f9G0IQWiHRY3lVEHf1MqG+FWSnOyCsjOxRBzsTR/ILQNb8ua4UU3GQmqWCa7T5INqfhLl8ZoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597626; c=relaxed/simple;
	bh=644/2rreQi9XsvlCz6TvR6GYZtC5+fs0hnbhbAHpQps=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Orhf5MQJMVxuw0PrFcja8kmmdpZsYFXcGzx4Zt2fixQkpSvK7kGG1eXPLKlouG49xX6GUQH1OYS3QFg7RZtfLdA2Dr/m5PrEC82hg96IZqy4Cciz7LihrKcGhmfvcZb/7lIgWAmAeaUVnzRruJaIGzV6mahtRAesSADwgZrzoWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=M7reqCjI; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M7reqCjI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBxK7BTdoOKX0unimlrxiX39KeC1/jFZ5jkPX/ni8qjALHQEfZbeNydUOrDPR1GCeBALaupT9FQvL1z73rQOV/n8nfs7YAFiJ9tcqLilFjN9wItQ41ZuhxGyzoAn7K5c7zN2EBee2G1K1pZjeTlT7K6aKGVb+QUA1FEAoUZcEHFfKxoblZF0oUc4Cr9UQOAhzRchVrlb0QwpQXD+8BD0sXxyqgEo60WVtlDvAuavcmthimSsPaUDiBjSgSKSnrP9sxNBp6t7V6OpBOELbzZmx5DDIH1GSQtYPHzdFA9HYfDNXQlVGu63I/+GMPtqUtry4Urb5vyPzR4jU421CneSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4sQIgA4ANaRxyaNQxXFnavckVuj7FWjkesk5oqh7G0=;
 b=SzUWvL+4yc/aakHUtcXCn7+O6gP7UzST24qVq1ybhuQMo8t6v22IEUxMPAbjxG0ABAEc0q56aSl4SkAzYSICVsP5/UrxODi8VgoGHzi7vRRwM3jpOttTMye4MJh2tT6mV09OSSeBjoHxSWozpWfGUCM3aEIUr3TGVk7rFK8RUhWUimHAAL6e8E7AgRpy35Vr4AZNqP5xCI94oGDmiFoML/G5osI6ygUy14KZal2FULrA6FKZ9rAnnSHMmBFu779r8dDE7nj9PHQl5dfIHCana7kcDGrxV4sMHM9EEYHflEKmQnmwrzQ5SnZojBk6MunaFSja2e9VCgdOTLKVpG9kCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4sQIgA4ANaRxyaNQxXFnavckVuj7FWjkesk5oqh7G0=;
 b=M7reqCjIzW6lfBhPH4cW2lujoWAgsR7oijbGvToThbZN03A5pvuTY2uOem2Zjfwd50mS1+ZDtIUxcx+7MocU8+0Gu6czxHYQi8WaNmDeSciFZ8MEM4+mGr6PZgjagkekSZ9gKxBM37ViT22HqM/f2R6tSU02pvRVYlhBLC8HfDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB7282.jpnprd01.prod.outlook.com (2603:1096:400:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:33:42 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:33:42 +0000
Message-ID: <87zezli0sp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] ASoC: mediatek: common/mtk-dsp-sof-common: use for_each_card_prelinks()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
In-Reply-To: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
References: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:33:42 +0000
X-ClientProxiedBy: TY6PR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 829db20f-fcf0-4fac-ea6c-08dee6c81941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	XVxieVw8cT4ykerHuHchDx7A93h+q4Vy2rmjWCxU52MYzu6TPenSWamYgPY+Ny1+Izgohd9PcRGvtRlFoCraNSESsD593iOaQhJ2lKaNPBmPBf/j5RzbDj2C4oRH9fJedK80rZmSXW7IupBgJroZbPn7W4Y2q0M4N48JlLBNHUHbs889DogKxINQWFI93ziJAfYD5RxZVO2a0vtMvxjAArZD8gCdZrbxtSNCIfQ75ptn8wBW3Cb6X1wP+kA23BrfPSOws4SREKLEplGS3N3scqrVvnxmsudN4FkQNTNBo4F8uO6F22VmrT54PieVBbYcqFlYKVX4PbnQs9OfVorF0UcX+PM83D/ImC6eSmtRX9uhT21csS+vjo1GZwkBCOop/cDE1iVba1EfTSmB4Pzu/tpBYYw/yEj18PXkADb1O6Ov5Efwmx5ln7sGZOn+B13TJsfFBs8bqJSlI9G5rNZJ5TEVH+XBmbobHVcuveybpyC0CWWWcR5A0uTo1jskjSRVgj2W4X5sLWsKCjZ9IfP6IKo4gsJpUAcQfEmzjD3HNIw0xO3D7bW//7MhrV6uOnspdU2UpDAFJWhMyFGQasaeP7BsD0E+iN/57sq2L52jTs9vQmewZr8yykOuajOM8QnR9X3g4PLnnvBlxKMFDkHTXQqmRo3JiWEOqhUX+ZvWe8q/KuBDZ18H2dKYOi4l9eccyvPhTSOPK0qFGCz/hmjLeGy73HcgdAOyNM30eg3DTSw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HwdwGp1aV+IbzBP/Fuui1LtNQBdWRGQblKXLx15y/mBDvBn8z3rr+qcWVM+g?=
 =?us-ascii?Q?qXgvYvboOuwAXNkkYDx3gcm8f1eu7LajYd2c1k0qQ+Pphy7+d6wbSdhCfLHE?=
 =?us-ascii?Q?Ptf5lyZ7rHt634P7vPjaLfxvv24tjWYAHUIdXi5aPlnKCCUzxVbZZrEsH/Uz?=
 =?us-ascii?Q?TKY+F/TQz+wRZa5VkOIK2+gorTubU65tPm2hTrmCUhskY0ZoDABDM3mbqHdk?=
 =?us-ascii?Q?ho40U3vX4B7UIf+gTJWpjbF414C6mTh9PsrITtd3axLSFEabEdKOYudkXMEe?=
 =?us-ascii?Q?uOV5dbqmNBfR8csS42bsy6ACEov7GWofVeHUUWvsfH+dUdh4jjimumNeF0RD?=
 =?us-ascii?Q?g5TP85HDg5aRa41icaWBxI0Texq0vYELH1OQGxqwYNg3k5mHexLm6fyV6QB1?=
 =?us-ascii?Q?fkSsFpkJ2vHSAEUGGR+snhlyFYFkGKQ9LJvIyWkAAI1QQYeXzEC+rfj3fKdZ?=
 =?us-ascii?Q?Vc9Irbfgy15eUlL3p2qoFmszn1b+SMG1qHeVeMGrq5xwgUjL3fqHiG7BI8IS?=
 =?us-ascii?Q?GGR0V7/lPuTve9N1M4Cwq6RR2zoBEuQnywNqeEtWWGGdPCr/mvU5TbVwc0i1?=
 =?us-ascii?Q?uTIWhwoBAcr5IJGXkF+CwgSAlnQmY6QhL9J1JlINVeUgRQh5JvLCRuBK/LjP?=
 =?us-ascii?Q?7T3Q3u0AkEPkv97e/rmqwXs7bQz10vOdU08L93ocUKWSKuwvKwNsHY4xO72C?=
 =?us-ascii?Q?IxjxPkYIhRIWF7Liz94nQQ2825TbdVvxOX+wZVT+f3osqKISFwJrHq/yMa/6?=
 =?us-ascii?Q?vtt5Qi1fn7szg1rM3wESqUr3Ra9oqow4hFAeF/4uZYvSahTfOaXBDpW3eTIt?=
 =?us-ascii?Q?/4bmb3nZ57vKnrPvcV+ZTBXnspCbb794js+sY42A90sHQHeSWQMix6WQj4vZ?=
 =?us-ascii?Q?aj7MK/ojy/CveQoTNYv8jij3RiEqEZGaPfVpG5EW8of1Idqz4jj/Cm+DpJ7H?=
 =?us-ascii?Q?2ajj4tnCvJJJeOBb40P3URs+UjmPeX9YaKsgq/3XDy21N4vjZFsZEKKTcz1e?=
 =?us-ascii?Q?rIKZo1quxM6q6NKfd7XZMpgCrjqMjlF8xs+VRFePYnh1qxwRLuUwR4KV+Ouf?=
 =?us-ascii?Q?JqfWr1k8TBJgMgjf6mGis5Kji2jH/7OkjbwerxOelxGPApUuGmaU4nLfhxve?=
 =?us-ascii?Q?r6g5VktVMPosXt8j8+tp9lkaaNAnCqkSDbkVhl9onUve+GFI0vlE3x+QF7NR?=
 =?us-ascii?Q?zPOGEEhl8PrlmMyca4WlbQ8VTYvbbljhNzi+oPwRVdma7rSsVw/EkpDu38v5?=
 =?us-ascii?Q?2xbvA/v43FTGsk0SnN7hb3Pcy+/HLz+1Tb5QX33IZo3oFWVHfXdxlgA+OC9C?=
 =?us-ascii?Q?TOXLVpGeGsr0yNWKsx9okKn5NbBf0tDdhfKd8r6GlCkrk3s9P7lGWuOUAy+u?=
 =?us-ascii?Q?E+L5m170PlDmEg9ql3du+NvZ1tBqSp64FxBwlJkd6WvxqSwY1jd/JwfZqLT1?=
 =?us-ascii?Q?6F2Qocn/pSu0BNvFGM5j+qqX+VGE+MQkJ3dha/3xVs34EC69FN9miVkDavLs?=
 =?us-ascii?Q?0dI6sfBxGzZxAfnjqKNuvbLLizz5szxORiT5hvcvA08aaaTKZ4FD31qYpNli?=
 =?us-ascii?Q?gJm+qhW1FVeOeUE422zfU8jd90ksOeyqzvfATDbfBlgaHC7y4cb6xafe3cvg?=
 =?us-ascii?Q?T8vEhNeu16/Bg8dzPIFd8DjrN8o3PtcnLzVD1a6iHwZ93eiFhflsNE8/1MqB?=
 =?us-ascii?Q?MqmKpwQZrksWAPoxR4WLTsN45IB2YahpdxkfLD/pNBu93FjQ0/fA6zZXcp4T?=
 =?us-ascii?Q?p7LkBdAceoy3jVN4N+dnCSKkK/Gyvwd3Wp2Zx8NjS4yk3kLnNDIt?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 829db20f-fcf0-4fac-ea6c-08dee6c81941
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:33:42.6276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsX9m7yRIPvFVUVdkUkQwf/xirQP6uR6DCmr7sepIPrQaat9CPyegNxYRqGPfsUnAmum9nd4FqbU3lmBKfHRO0w4Fp3CzhJJcUwV1zrOfg+ISwCR9AgzAlJUUrFgONHT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7282

We already have for_each_card_prelinks(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/common/mtk-dsp-sof-common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
index 17b9ea6be6040..adefbed5bbe72 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.c
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
@@ -232,6 +232,7 @@ int mtk_sof_dailink_parse_of(struct device *dev, struct snd_soc_card *card,
 			     const char *propname)
 {
 	struct device_node *np = dev->of_node;
+	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_dai_link *parsed_dai_link;
 	const char *dai_name = NULL;
 	int i, j, ret, num_links, parsed_num_links = 0;
@@ -254,9 +255,9 @@ int mtk_sof_dailink_parse_of(struct device *dev, struct snd_soc_card *card,
 			return ret;
 		}
 		dev_dbg(dev, "ASoC: Property get dai_name:%s\n", dai_name);
-		for (j = 0; j < card->num_links; j++) {
-			if (!strcmp(dai_name, card->dai_link[j].name)) {
-				memcpy(&parsed_dai_link[parsed_num_links++], &card->dai_link[j],
+		for_each_card_prelinks(card, j, dai_link) {
+			if (!strcmp(dai_name, dai_link->name)) {
+				memcpy(&parsed_dai_link[parsed_num_links++], dai_link,
 				       sizeof(struct snd_soc_dai_link));
 				break;
 			}
-- 
2.53.0

