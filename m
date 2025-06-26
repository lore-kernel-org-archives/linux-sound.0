Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5564F1C4A2D
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903966; cv=fail; b=qCdxRltjdEVbuI1GR3PCHh5xXKDL3p7QL4o0f1jR1xjlzCs4VvBroEb5aeUgAf4tRQ2dm/hNYtKUSjmrbByO14uBmj0KaDrzfxt//QlskCNBcAoHkMglV2PP5SyM4+cNWMKNftoIusCGuYwvpJRYi7lIlsl9LMh+XIL/0UmmFVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903966; c=relaxed/simple;
	bh=Hmm3LydcwerNu4BZ0yLlcfRt6UXPpSKlt3KHZCctDKU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OpG6PZ/+WxG8BvsXvkmsFaDXyW4D1M66hauUUFMe+CyqOWQfnbnrJGNQ3yCamlkLCRP/xQDn9FqLs3ikAg7Nb6QKpSLsaN1zkRYcmSU3IPRXM42rDVvwz4fnu+ZL7NQhQjWHI9DGf7Kx2iNEFf1Pa8cQt9eT8ws11faQKSOy/2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HcmgVLtj; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HcmgVLtj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbwEZaTPEhfTItXnA619twNcaTy64i0QdcvJF1HpuU6qnJ52yx/7UlUHyA/xdP1fhciULbKsyvL21/1fHj1AUQs/0sNTcU+VpvqQODa2e69gQkYJsVPTCyH1iOa/VpHdkYjFVYD2D5/XfPXJw/DNVkYt57y3JnS3YqU0go0E46iDJ+apkqXUhGDZT2T+yUJZiIDVM6C7JS2tNDUrRjwc79tzFJrFnmEUr/F4HUdLU6h4LWKfXLv4PpIQoMC7s8Pu6Ch9mn9nCssTjG7w8gHBwf/n5awWGrQWoaGIpIoH/vu1JXOmf9iHMwgHIG2OqPvw6QkvEgey9mxSAoTS467/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XoY51K5y3TEbwsCPt5aSHzNWInKEhkPOm/J11aKg28=;
 b=xhlAcsk8yTKXhD+ljQQOI1+unrTbsguPwhnPLwFwR0lyN+nNs37is6Rz0zZqVFOovGO60IhO6lmW2qjHAOWq+itYGJlpCF6RfWEgqmQYQ0P8+6G6nUEP8AHO2u6rFpjOkEe/EgbV7IYwNgvBH/K/41WFaqOtTDoET0zRXr/Bp3EZsFrmY+fDMSNHNowGM2h/J3lyWehJanHM7uLRA1i9FuTPHzdQdxJa2gVcmbyOWyz6WCLmMrR86f5g9kdHVI0UDdx/A5VYRm13LgIPYvkVc8Pxt5S7own/cuKQT0/cE7y9oVcwB0DzL6XNzg0qT+50jfowddWK0gM/Z+bsZ/tK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XoY51K5y3TEbwsCPt5aSHzNWInKEhkPOm/J11aKg28=;
 b=HcmgVLtjn/ymVwv5PAWSFfSBYt50R5UzIrwQmwAAL4AI81gyFrDTA4zU5wuONo6XYIFLsmZZKavTdMi7ndH9kgznbUswabgupiVRg8Hx+QFwaAknGjwPeNUNT8LOKF7y86vmnTpFVTFs+uscDIcK+C0c3btYuS0BCpgTwwpfjsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY4PR01MB13972.jpnprd01.prod.outlook.com
 (2603:1096:405:20a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 02:12:42 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:12:42 +0000
Message-ID: <87o6ub1c9y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/11] ASoC: soc-dapm: use component instead of cmpnt
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:12:42 +0000
X-ClientProxiedBy: TYCP286CA0192.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::18) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY4PR01MB13972:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e395e7-dca6-4b38-58a8-08ddb456eec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jyWPV6tRdgfLz5yTvJwDTD+mI66CaHu+39rcxwDNQ8Ab6oL8CPg+NX+dd9GU?=
 =?us-ascii?Q?wKSo1QRqkKPisYuOeyXFiN3zpnVtCok7paL+6p57Kzss8WzUjSPs2MkYBIJg?=
 =?us-ascii?Q?PzTdsJryMWlZFoTtYUrq3ZnIUrWr7BfNlDzpJcMpaOOufqTNYNb07EdzglPV?=
 =?us-ascii?Q?tS/mtxcEQrx5FnQkVZoaJS5a5TYkFsVnUIbEFSsI9f7qQ1rEGbtlxl/Th2y5?=
 =?us-ascii?Q?3TPZvUw6Vdivsh7JFYCnsyHIkvQiNeDbOdMkks4zQSWokv3mNqHFRgtZTXud?=
 =?us-ascii?Q?Z92SRcngTHDabaUf39jgkqPsh+tkHoMN0t5m7FyVQLJU/KoICuHB5wAjKXmd?=
 =?us-ascii?Q?IZzJTUhPlkh6QZuaFcMF7eYvLsOUUQTTKbyXq4WEoUU1m6Vj+1ZXLIODmijg?=
 =?us-ascii?Q?aELOMF/pzM59HPC+jG1Vpd8aHafEX6regWgeqjuz8Opm8ZASgQwvAM6hNPBK?=
 =?us-ascii?Q?r5TI0PBIxr7CWv+HgJOGsk2gfvAOC24TDbLwKhQ4iGrW2ROsyHj/sFRtMfS6?=
 =?us-ascii?Q?nv9XAJHr93j3Xaop4ixQljPgd8kYUAUfjUF3MAM3au6FkQ+g5cRPWtsffyBC?=
 =?us-ascii?Q?PNzlu7n95SC/SXHjKCIQH6THkIF5cws3AnF+xtqO3IvDxTRNkmVEjN/EZ2hs?=
 =?us-ascii?Q?uZ1szEdHdKLfLicT7pMF2oV4bxHXIzl0XzrtAuJ71TzK4ZJEdURkqVdgKK33?=
 =?us-ascii?Q?qp2u6UcPcr14MQVMcFpXi1GoGVAsPOHzpzo8+ew6LtGYWYkY23q5opbc97WL?=
 =?us-ascii?Q?vt+jiUFeOs2di+CNGWL9ozBVCEUBTok6Z4ckxQFO/06UZVDgfIosg/9Z2CNN?=
 =?us-ascii?Q?x3ZeuSX/J4AL1PjkFwk2AbVDSU7iP50UJeJnXOCF/IiqwP53yKCRWcpzzKVc?=
 =?us-ascii?Q?NMQEENZsWIv3ffHlaCCAHvQ68ozPLi9+P0slimoruzjZ3ylNfXHwRZUXI66p?=
 =?us-ascii?Q?8poHnri/0gNj2s25uNJVXwDx0WQkO/YOJuNYrTLEbGdy9xA4FIyT8Mo5cEix?=
 =?us-ascii?Q?zY7u2PHywYY6vSSXk7sO05w9lAR7adJy8wMppX10IWntmS1w08yEtXFFsFLB?=
 =?us-ascii?Q?93StmqpHqNoKDRNHCfnMd8eAhc5bst3uxnHHf63CFjotbZb64FIJAdZVxd+t?=
 =?us-ascii?Q?1NGDkX4pdEO1aIad6/xZp6or9OD89jjdkQFKyp/aRrathHZqX6xld0xIU8gG?=
 =?us-ascii?Q?MJuin+zxoe3Dc1j27X7iUBXZUd/pvdK0r8p3c7UhBESDeg7xgO8P32GD+gXC?=
 =?us-ascii?Q?JdkngQfZMN5O9C2auqDrE0C4bvY2AyEax3kQhvpJjnUG4zmckrnWGYP1n+dD?=
 =?us-ascii?Q?jVpm1S68/BqHzDdOMOba2WH6seWCJ1cPpeCQ1NOb5obDTV6qC+MBugpL8T17?=
 =?us-ascii?Q?rEv8uE6LFCbcMJtEW493o3+POdS1VzopHPYUyIk6VplhFw1N4rTacQWFPFJX?=
 =?us-ascii?Q?Tk2cD2bQEptJ7eDeLuVhAb9206VSF165hMjpHLmlEj1wtUkX7LdZYA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t/9s6A6kVSqPc88b2dE//W1mTEOIYsBhVklEJKNTDjAsZjLkd/fnsatHK0Q5?=
 =?us-ascii?Q?cJiQqXMO1wMWKQKzQfuN0UDUpJr6RArlwSIA6BfWPHXgl7lhbBBsr+f7DTs5?=
 =?us-ascii?Q?eoRPdWoXt5OaY1fK9FNvM6FpI+dmzXsTHzb0K24q7XV8qCvF6WPww355X8X9?=
 =?us-ascii?Q?/M0Wxh8gVms2VwQtHxhrxYK6U8fK/4GZZWk/iEoX1caLc9fiHBgPvo7G+GR/?=
 =?us-ascii?Q?ZGM0vf16qTPI+KUryZTbVCDUUeiPEiYt+K6vCdmYUdxKfF0/yZDrLXXyrbfF?=
 =?us-ascii?Q?dp4BO3HP5pm0E4cv4FwVJ9CjL2esybvC+gizh0d9jBhVy06bGi20BKq7FSUi?=
 =?us-ascii?Q?ry3UG7Xa307FVkJdEztHS5xxPPz5bILAJozTsk3N80W4OYODTpS0pACVcxxI?=
 =?us-ascii?Q?/7DFrgJJyrD2xxrCFWBS4W8Npy9pGN23wG1A7jBcdtQ+I6OLEVnbZkz3om0U?=
 =?us-ascii?Q?TUovTzEp0/FDuPE6wxRa4eu6WtpOC2Osx14qdvxNqpKddct7XGsByEH3/90l?=
 =?us-ascii?Q?Cf8Il/2jJDYPpWP/r1sXW19abBEqau/3meMKuzUcoVjNFLHvHwsQMVlViyQQ?=
 =?us-ascii?Q?nNHDinhs+5sWqZ/Wdb8FebWSfQ32JHyoggqdc82mhRsShXTdnewBRw5G+1/V?=
 =?us-ascii?Q?BueUTfw1xE7aqRBJJCjA/mKYQhAbUufDCLn1aDdCimwCkvD154Mr8oEtowGv?=
 =?us-ascii?Q?iILDwzwKxpg4mth/mIjQO+ZBN7WtynaV2HzTtxMLyiOCsyBT0+pSRmgQlOZ5?=
 =?us-ascii?Q?dYg7Hlrjcoi50fZCFS47joLEgMN7ZQVxqfEQYOxwvQkUTDQkN0GPZl64jia5?=
 =?us-ascii?Q?Y9lEmBqldRx5nAfjmxOP1PytGNFuKOPQQK3LgwD4rABqXRYVivcaVGt77DNq?=
 =?us-ascii?Q?LP55uXGdtt6A8quGnVAlsbm/l38IxdsI/n0Ym0sDpRaglbq58gybyk9pE9+x?=
 =?us-ascii?Q?HKntRpc6wjlIvSB1zSkc61HuCfc8aWp0SfjH2JapdTvsJQLMEEjTEjEqymF6?=
 =?us-ascii?Q?Fi4F7ol1ZJExi5I1RIRw7g3/5PIvaEIAvbVBPMx/vHIyrAOF0waVeHdYiI9q?=
 =?us-ascii?Q?PMtK1o4WTW2g3r1qg8zr1g6VZvnayENNEyoMYuSekg56+d5gC4ZMN7vw5atu?=
 =?us-ascii?Q?A+Eg429StCEJ2QBu9NrXlF0FZ6LhkWma50UNdSIAL0pvYNl5dxccxLhrW+OE?=
 =?us-ascii?Q?FbMjn/cklKVX29AudU3vsZ/syEJH7VylLeGk/x7aAVUDOAfVV0ONdJhvdY/v?=
 =?us-ascii?Q?+KdBPBdtYhsw5nUxLyua8uNHkApWucJssPpIJbpIfWAk4j+f5abbpyvsgVkV?=
 =?us-ascii?Q?x25wSiofZptX9JRZLA6CHI84aEsEr/ZZPAdYseHKkI3yMuPp9o6to29k14Hq?=
 =?us-ascii?Q?KQ3IqhQHtFVrb6WR6XTk+IFnMgwsaJKwJ6kIVumE/t54lGSwx96ZLNoI5KPr?=
 =?us-ascii?Q?QiwPLFuM0bC6AEGfYhf1eI04clkJaRPl5LrSS6InLD1+R/dkJKrD+z/WXaZD?=
 =?us-ascii?Q?Mj4qMcFEgIL014NPAOCLD6wOoVqmwThETpOBhec1Y1+E+lZWcQih0P0zWysc?=
 =?us-ascii?Q?xCJ/S5DjLAZqHjnHa13VdG0x1OhMN3Tiv11iSIYkXtxPCcVuPAoK2QjBzQqJ?=
 =?us-ascii?Q?kcRyHoHYGh1WqBgLi825SQA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e395e7-dca6-4b38-58a8-08ddb456eec1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:12:42.3438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DHV3aHpvK+U4+y+DQGMwEC5xrzjBSFri3IM7PExxvIII+zckIeutWN5kewwa7LtH1HptdSydcgw89mX3v+ip+1hWYfnLXBkU+Fcg/yjE1cNCNvdbCTDg3CxSSdrE2sC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13972

Use normal "component" instead of short "cmpnt"

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index a3180d4c1676..9925f5484933 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2631,10 +2631,10 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mixer_update_power);
 
-static ssize_t dapm_widget_show_component(struct snd_soc_component *cmpnt,
+static ssize_t dapm_widget_show_component(struct snd_soc_component *component,
 					  char *buf, int count)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct snd_soc_dapm_widget *w;
 	char *state = "not set";
 
@@ -2642,10 +2642,10 @@ static ssize_t dapm_widget_show_component(struct snd_soc_component *cmpnt,
 	 * we're checking for that case specifically here but in future
 	 * we will ensure that the dummy component looks like others.
 	 */
-	if (!cmpnt->card)
+	if (!component->card)
 		return 0;
 
-	for_each_card_widgets(cmpnt->card, w) {
+	for_each_card_widgets(component->card, w) {
 		if (w->dapm != dapm)
 			continue;
 
@@ -2706,9 +2706,9 @@ static ssize_t dapm_widget_show(struct device *dev,
 	snd_soc_dapm_mutex_lock_root(rtd->card);
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		struct snd_soc_component *cmpnt = codec_dai->component;
+		struct snd_soc_component *component = codec_dai->component;
 
-		count = dapm_widget_show_component(cmpnt, buf, count);
+		count = dapm_widget_show_component(component, buf, count);
 	}
 
 	snd_soc_dapm_mutex_unlock(rtd->card);
-- 
2.43.0

