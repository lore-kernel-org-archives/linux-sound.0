Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3EA2EBBA1
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 01:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780881907; cv=fail; b=tShkLHjTaDBLTvnx2c9UMI+RPuGir6ImGWDZz/VJ5pS7FLe8dobHWfndBCID3F1ChYLaYgUG4mqcsoN2I6huohJWoPxVltOm3pywEu/Sdb/S0tnF5KSBQgcoBjQhnfGaluEjAnTGvYRGGM6LDQ2f/sx9m22jy+IVRQkdDzPqGd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780881907; c=relaxed/simple;
	bh=fHXQSROyPZr57F+mbt93AIbM3V6PSkGEcxFi5NTBMIM=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sm9P5WNbqlT3v+eFm0qRU+U/zsHqhd+IbJgguZUXYgFE6nVklqqqJ7595NK0cuOJvNXr/AgG1tuEPhziBeUjwbzOEdDAZvNaNsFu3ajELLEHP4de9YeCS6BEJnxMPOrpGwYjv9d9QiiMZBQr3Kp9bekaj+GJ2gSKIRyu++D/r50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=End0Tnps; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="End0Tnps"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKyRJPDUiGZhKgg6zxkLeNwRGEp3qNeVwxBqaWb1kvQoaOb7YDLzoI1+Pw4oxphg9qXS91upey/ftN1MxyjtWe84EbZ6ur1aSicOpbobKA2eIdU8uzvgWAvGspA1PMRWhjPH5CA5MOREAfkufVb9lIoZjC6VRQ+hD2Iit2uf+E9X1MU7fxJiL1bkpS0JI2ehgXVOWzOw6qmnbroGKX9bJ90PGtJwEpNQzkJleVsFVOWqpNT8Y4H/8uTxzDEPZZ99VQewn0wa5gtMdI1oa2eYk3kb3WvdFOFi2xk0nBdpg5fUJVGat+dISn7K98bWDx/ruhnAnE5qfL+tseMso9ACsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfgr1xwUpiBxuQ23zxiy8XxiPPqJVa21Mir1LKl/UIQ=;
 b=pbONOBr4/7FMyl8yuDp8PpCiEedHm/b2hxbX6jX06U9rvBN7oh2E3n8dYUTwb3UK5VDaSAKnTVDzKHRzY+dSTiWowNiHmXhEDw87YPqMF8dA1YwS0I7Sv0Zb6CkvotS7mBc/h1zEoO14dKeAIqWwVpaogXJjCBUb122T1MWouKD6BYtiYOOgipKdSj7eECqaeRPGBMdZ6f/Gp7ZK5RYej0/xp4jbrDqmJpvYbmQ+c/f6fwhUHW4TIs+o3pBlvczbCTW3DhGBLAV42lX4m65tRX6hgWb5qYgX8k9VyLRoX5bXiuJOpuXeEuHzQ9N1EngSvH7WoQyedodluunGs2BTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfgr1xwUpiBxuQ23zxiy8XxiPPqJVa21Mir1LKl/UIQ=;
 b=End0TnpsFze0fI0cMhkr0zVjfo80VBSQJ/uJP+hCAH0c8juLUawwa1TH4poV8wjs3k8YyHC6rDnCdvbPGtlyrz81AZ5PH/IgHWzT+gW3EfqE8bBdz/Snng+TF/uGZTChSyzAQLNG4wANy0601YZMdBwx+04ZhHrkyZq9zzgGC6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 01:25:04 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 01:25:04 +0000
Message-ID: <87a4t5escw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/6] ASoC: mediatek: mt8365_mt6357: use *dev in mt8365_mt6357_gpio_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 01:25:03 +0000
X-ClientProxiedBy: TYCP301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f5c032-3bf3-40ef-1acf-08dec4fcc474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A/rluCqd73piwqFFcpCGujLv27cxdq1KVFgvUP9EKQbH6fujJMN2OHaI9YLUE8PiQ7nqlkZjGNyH7mdO9w8389M0v1D0icZ47w9LOre9TC3V4nT7hEXVGR7ruH+kiBcnvpDXkcfvoEXTsx514wSiLe87HQsUKGTjQmbzDYQlS3RJq8aCGlyeZAmp7fNY6JQL6cxuGFFIHQ9A1JDmZ/FErx8MOwPfJtha16cfy+IdQBxDgIOg7EI5KWlEqnSuIhKjm72DWYJ9OG7k9Zrq1GKnwYS2YlSAH1VoqIhnL4QnBoXnTYjr4BbhiGePVO2qpfKMeAcY7nKKEfknlN4mGsWITr+Dzll3mxanZKyuM/e6yS006GQkxoeAeGGI4iY3/YRgwR+2kFy4Qtb8RiJBOio6ec9EKpsAyQoFCI+IvtdQsGwC5UMfDmW3WsbgVFeh8D3Za6nZV67oOrS/mnw2aAEqwG681deiXP9bKo4toyHfEad5V5o/c/ZEZz9ZaodgoEfL/Xk09HAv//oK8JjQECBxSfa/rZLl4l1ZNkR+M7VlmNmKFI5x6pfzLHhDV+W/Yfq/rP4tHhY+/Fw/U7izokFPzY+uTsz9AdcRxg2a+WxlE/vJBTP/AHNcNv/rQlb5+vigtcrJhWlfdbSJh6yurmCuyX0Wu6P7knoAxztiDh/h7+4Bzr+UjjFgtOUmE4PoPRIIQ8iN+AVe6B4QnadjhTsGOTpYkcoWzKi//9deliOWz99jhzoozOBL363EfEhzgWO3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xaZPcGTBv9Hwmk/r8Ebp1RWrmBi8Fz7QZTEZ7ue+MFzBcpQCOsnesiRm0KwH?=
 =?us-ascii?Q?4YvPLmjKBtHKLVWUTIjtJP9xr13ICC9CkJltFSr9bxB/rkYBIVja/l/1Jeym?=
 =?us-ascii?Q?G2YvApbl/kBnhrZF9eRXT3wiOH8sleE+AyKkZ9WVVdRJ5K7iL558sAZzSPqY?=
 =?us-ascii?Q?CuJKM1WZ0PlOJDWUiKeGlOclgJLlTvR0JfjbWdMYO6sqEc/4Hd4QSWBC69Xa?=
 =?us-ascii?Q?3EF1NBUdQPWdnud/3xbiDHqJFQuXIAntL2GffVNKJTt/zLxn6iK4inmKmpDQ?=
 =?us-ascii?Q?FQthY/TTQEZy/EXfS725Kos0k6fLK9FROirFN733ZXyTFKQGLe9w8T8qAbDY?=
 =?us-ascii?Q?pmQfSwTTjRFLwebro1AG8VTPLTRYNKRwyzX3D8ECeUZZ73Ss6E1dNxF+QEA9?=
 =?us-ascii?Q?94zABbK3T0g+FCoxabrkyvuTQdsVlnm4EJasukNR2txy7clo3NBwB7imeNK9?=
 =?us-ascii?Q?JrilZcKvgC3LIrkz8wDfah8DGFXUSTHv1s4OnsOXxWOAL1Gj9FYz8Anhd8zN?=
 =?us-ascii?Q?LLaaU0fqc21wp3k/86+5KBzvS+I8KUo6M/s6fiSYij+Kt/aOk7509ydkeBwE?=
 =?us-ascii?Q?lXCCKSCHG9c3+x8z4r6dGNzcLr2GuaNjG7b1jNd5XGoCFeiSryq3Jb5A0RZp?=
 =?us-ascii?Q?KQ8WCl/yPO7g6XSLNuqU/d+j/zl+93NOiyI0Hm/VdDk8ywuJRRlHTJiMjgTE?=
 =?us-ascii?Q?XUPq6fwMOp8eNVxjUQsfRb3/tAM6Jcpswr7ooRofO7PbLhhhilqh4Pwb0e/3?=
 =?us-ascii?Q?dCawvi0f2MK8rsQxgafecI16HSFbLXYbVKcUCV+2GoCaMkBW3OqTXcuyS5oJ?=
 =?us-ascii?Q?bSJNsQJ9HGEtHaZ74BqGcWZDkGz8btt/x+cIY4XaSH0DG0pBjTyrpagSPDPo?=
 =?us-ascii?Q?0ls16zdg65Ucxg6fh7u2OzxQDFCT9QlHtmLhDb/MWSHmBY477md3jIHaV6l0?=
 =?us-ascii?Q?V8/yi7ou7JWxfgCB0qQZ+z7r7yT8vY5KoeS/jkmkGFrh6UuD5qBFLYyRu6oS?=
 =?us-ascii?Q?D8OdAAiyrb5P3THExIrzFiE8W3gPNnffA04okOdOot6rGDNBSNZPiy4TzTOg?=
 =?us-ascii?Q?DL8g81AOCr6JnwaFXqlsO9+3ds3DQp138fsfzyxCzmWjLkOMpP6DhMe9h47Q?=
 =?us-ascii?Q?N8tcD3Ab60OqnExp+wGahX1pwIJ/gIgCl/vIUsHtYhl4/PkB9CIy0KkZH+Lw?=
 =?us-ascii?Q?ej7ZCJGzACLVeWNmwbeF91mL/v1+W63n+fn60wIP2JSgWpCAPO0STaelEhKz?=
 =?us-ascii?Q?zDzuVpVFJgTktjJxvu2J39NWiv50Sh4hCLyoXQwYhfdZ8GGLRKyG6LicsXaD?=
 =?us-ascii?Q?jKzlUYLOsZZTlTTc6HPOfBgxFOLk8koF3Fdgs1MpeaSEe5r2a2OT32BqIINB?=
 =?us-ascii?Q?xU9ZFb2LHJ6mJ1gxwOR+fpa60vAsAVzos8DDEsmXLgt5bhSJBsU6asy3v3oK?=
 =?us-ascii?Q?eTwdoofwgD4OHnCDPInpifLMMoFt45XlZD3peNMxdS/taEiiyjs74dHDRx8O?=
 =?us-ascii?Q?MfRF/X5DwibiKcFGHaD+lz3800K3o/OYbZvtnmmj9TpPDb91nh0Cq28XqgF0?=
 =?us-ascii?Q?icqABP3+ZJztqyiUbdHcDZU33DvWMBpCRkbFY3YTqgtGMwuxzd0f4g602nX+?=
 =?us-ascii?Q?RLgQ3Tbl7hIYOhrhGU2ONCtzGH4yjsm00COfhGOXxiXdRVg/tInv8AKMml1w?=
 =?us-ascii?Q?DN27dfPmYDJcWNHraMr9SvW85/ltY8xOSyY0k5YU4MUDmf2uyysCzDS1QCft?=
 =?us-ascii?Q?zCasqU9wJ7w+1g9kayyqKCz6kuDH+PBlXGvZJy21+mm71nMQeWYl?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f5c032-3bf3-40ef-1acf-08dec4fcc474
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 01:25:04.1641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66nxuMynOxQoFsGsJv2YxP4PdNbVq+cGTsRpRrX2Tpgv7LW7y00OH+4hjT5QqnbOpKoGLj1mVa+3UrCENNeZ+xwUI8N2r/nK9hYJeCAKAKVdj7nd/3iogt/Md4HkBAhP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

use *dev, instead of card->dev.
No functional change, but is preparation for cleanup driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
index a998fba82bfec..10f9ef73c130c 100644
--- a/sound/soc/mediatek/mt8365/mt8365-mt6357.c
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -247,26 +247,26 @@ static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
 static int mt8365_mt6357_gpio_probe(struct snd_soc_card *card)
 {
 	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(card);
+	struct device *dev = card->dev;
 	int ret, i;
 
-	priv->pinctrl = devm_pinctrl_get(card->dev);
+	priv->pinctrl = devm_pinctrl_get(dev);
 	if (IS_ERR(priv->pinctrl)) {
 		ret = PTR_ERR(priv->pinctrl);
-		return dev_err_probe(card->dev, ret,
-				     "Failed to get pinctrl\n");
+		return dev_err_probe(dev, ret, "Failed to get pinctrl\n");
 	}
 
 	for (i = PIN_STATE_DEFAULT ; i < PIN_STATE_MAX ; i++) {
 		priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
 							   mt8365_mt6357_pin_str[i]);
 		if (IS_ERR(priv->pin_states[i])) {
-			dev_info(card->dev, "No pin state for %s\n",
+			dev_info(dev, "No pin state for %s\n",
 				 mt8365_mt6357_pin_str[i]);
 		} else {
 			ret = pinctrl_select_state(priv->pinctrl,
 						   priv->pin_states[i]);
 			if (ret) {
-				dev_err_probe(card->dev, ret,
+				dev_err_probe(dev, ret,
 					      "Failed to select pin state %s\n",
 					      mt8365_mt6357_pin_str[i]);
 				return ret;
-- 
2.53.0

