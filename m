Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021FA149E17
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820480; cv=fail; b=HAorcjTBEbRTaQy1EoJl1DUP55nMCRY52yPDnb8B462zyqiSh+n1kfk/oyTRUJ2t84QAbLWXaUsIfkjTmu/LioWz/xquTZyhsVRR8E0oXX3f7gGeqJvp7IrmM66XTQRUgCgeLT6wuJpomWeBZ+VIPuGANNk57d8Q9RmKxjtPBb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820480; c=relaxed/simple;
	bh=09sQWb2GgrKXAknyH4KXgEUSsUCV1RyMGwlViPaK6fI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PnjylMjQeCfjJzzTkUAH9JiAoG0+qfdqnj1VI7aiYv4ntSL7XYctd0U/J0K1PpaG4+hnBNFM8RHlQfpXuTv1v1WN5HdSTWquCmJuacdVDL23ILYl9TL8JTp0TyZE4sjcsWXQZHe2QkVEej88885jDfaq/fKzkiITVG28ukyuaKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KFeJJhn7; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KFeJJhn7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+8fkJvcgzc0q4vCyWZQCowV1NB90Ir5QmMs+RCqTgVx/VYenxB7D7C4ZzkEw/EKqrRfiaAI6B2ti3Zq40Y5/zVFjkW7JOaoyR94D+IUtqFpCWJc3tmo8LJu8UUwILpf3e5AwcgLleoUjbfGnShTH6ZRkiMVje0u38EwNwlsrYPZL1bcVEmrg3Ni9NjQmzbFKINjdT5T7g24vOq0e+jE7Yhc+o9CQ+n7UXN/9S7FLLDr72iIxB3Bse2pjrlq7B8u/v8cXdL4rbW+Mx9mwsz4SBS3MGHyCeS82NYIHUDnGMz5ag0F9pjMFlOqqzy75uuE8B/LroVSNscBvIypB68Img==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKnin2W2Zh4gcd+c1kQtCUde6L3qAyzGvxL05/NSncc=;
 b=j7YZ3gtsx5dI7bm5CWEe6hgpZRr8lyhtoWBvHBwR+sQ/LM6EI8Khtk1ATXv6xVCqsOhbeXDNrRUZAITtmvPysB/cjovsOee7w8GdlEPBItQja4NgyEUglD+tc28XtMQewCageJ3e5v2d3CN7qqF+Et0Bskkfv3TFTKNP4YSYtYf9xD4qb4geY4LyxfMYanGOhZ6DGT0n5GYG2nhBzilU0nfg+MZuBB1uYRMAuvTA5ZG4yf/LoLvGwEexfL37VPuU+O3e3ea26wI4NKnM7KsyMo8pNyAnPNl+Nh5P+UPZxTg/ZJUFUA0i9/CDNxlc+Nhle9EIIBV4YsIxsiBzqb8Wfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKnin2W2Zh4gcd+c1kQtCUde6L3qAyzGvxL05/NSncc=;
 b=KFeJJhn7vaHggnwzEdkDzgpiUa1077JB1j/M3HWj3BewfRdcTrW5ZDjKHsdJWGL7CDb5rVf8M+c4SWzzXn4tKxmGNMsTUW57wv+xmwRQgO53LYnqynXBRMv1qL7x4Fr/tNDF5JLFAf0pzLiZfheGPhbGRj8GBvuvvE3cg4SsAaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:17 +0000
Message-ID: <87fral772b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 047/292] ASoC: codecs: cs47l90: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:16 +0000
X-ClientProxiedBy: TYCP286CA0208.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a57573d-a6f5-4b48-5f5a-08de20b83b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0z62SddN60HtppdDD1/LyR0W5DNTjVgfxms1Qxl/9jyei6CLS4VM3157gSHw?=
 =?us-ascii?Q?Qene68vXh2aYrzIOcKK/J4OuzGaD5c3+78Piu7XAWdjCvGd8YOeHkOQPV3es?=
 =?us-ascii?Q?CC4+xJGB/H0O8uliSWPdM5I2uSal6FYhlW3RIPPP5KZFX2AV0yWoZonskwB0?=
 =?us-ascii?Q?E0Walr1OeC1FWsAufICWYENb/cHD8PupVn5CGpx/f3UtaN47TgJYsMCinect?=
 =?us-ascii?Q?cg4fWNg6gRkfjHsFUzFCFzCZlDMzYqRhNAa4QiZsfg0fMay6B8TbElgKCVFh?=
 =?us-ascii?Q?itKJ/LD2CtWIu/zfB5mlByyEPuV17ZN34C70iuoXvRX0VRjf4nuIeJ9FTLb/?=
 =?us-ascii?Q?OtAmD+5DJkplEBku1Y+6TKh+Tj3jHqUQDHMtMiJ9+rDUiRAa3u9/+IzugHH4?=
 =?us-ascii?Q?pTOyMaMuitNdGuWIcnUTCkvHbLZa1BprzUMxn+cKzi4PuwA/MMQM++td/TK9?=
 =?us-ascii?Q?lDrKh1GSqwb1LfkcEgFYOBa92psQ3YlCwN4hXHXGI2q0/HcT3pDRrr1Lg5MW?=
 =?us-ascii?Q?U05MLfQHB5277uIX+2wt/xhdBBr1RUhYvL0cXeT3eLeRNp3XRW2P0vF9m/Tf?=
 =?us-ascii?Q?Uy5z7mYey6O/Zn5vIbvG4+rwAeZHIJTX+e/IUk119uJv9rwQqo8NbDQo6t1a?=
 =?us-ascii?Q?QpUggX7z26oQliOPueTRBW3bV7sBaZtw5Ou2mWNBg73/syzpvK54QTDS6L8Q?=
 =?us-ascii?Q?xgK+HxAZ/Y/YFoScTT87tgp4gBMdC4/db/gMe8vgIVzvmoQSaF5MMHwQwppD?=
 =?us-ascii?Q?MF1woAClasZJzOfAq3ebLZXrcKPWHA6QYdBO3lWFFajSoyvQlEwcyB1Ljmws?=
 =?us-ascii?Q?aSGq5/Z6qIp47/l28NvoVnQlB0PbDvekT4AcnJl352+9LLN+nLilVI/hLur4?=
 =?us-ascii?Q?7dU0XrIKnAj846om4eOjonksqKIcnxFGXh/j3KP8LAHrcMG8JQhzSgI05aXY?=
 =?us-ascii?Q?Uf5QDeP5xJuNiCr5bfHP+Gm5DJRLjjBdFbxAd5MdK10N+Ci9zkXj6G7rKRWK?=
 =?us-ascii?Q?1sYY91FDM47ryfSamLCXppzFvvE4FFrXxzGl/QPiKiIucvfGifCX7dL9mHx3?=
 =?us-ascii?Q?mT/N5Lh5auh0EMmHJoOGETtMwPim8mPNqHPfDcp7hVdLFCUabsWGigTX7HVg?=
 =?us-ascii?Q?wcGqB0EV26sWeFMSSQ2ceNytkRgtUNa0BT5SlQuF7cPkQntUvClsPev/8Hd5?=
 =?us-ascii?Q?uFvn+FA4IQorYUUYiM9wlKv0hdQ2J8o2ra71L1wJSFCfb/Ma0L372F8+JKDw?=
 =?us-ascii?Q?MsklmWa6/Uj1yPnLmmIYIIQv4jy6xxiXUgw2M+9AJWugdlhzce0UrmaZ85tb?=
 =?us-ascii?Q?VZlrIByCNuHuTHDu/At+gUP2o6cpnD5IcxwoKMHwxLGzEfPt83rW4U8kxnCh?=
 =?us-ascii?Q?XkJoBUR+bTdYN0TpquZ5NE23sYQwkrBUWzcJkm9E7SaUm7/iBT22/PTAxneJ?=
 =?us-ascii?Q?/cV9bkDFoumigyeB27HfP4mH0MDiUfOejptpdfmL4P3hVSzmRhWHQWy0Ry+2?=
 =?us-ascii?Q?Y4WK+E1aTft841QGZqyp4ExWk1RLeli/0SHH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6qrjOZxAn3bc7f2SanbvIik/bImjjgak7hRHFL0+aVYQXIyUSUuBWf1GDP+z?=
 =?us-ascii?Q?Hhzud0eXVkfPj3QPFvF0xghDbh7iQSGaWfmqDHvR0j1OHXDwXT2JP9wLw7tX?=
 =?us-ascii?Q?xNn/kVhqlmddr5yohNMgFsth9MlNAvSYaoxlfr4V2LO+vThAQV1Hr7MBwAec?=
 =?us-ascii?Q?6ztSwRE1uqkzI4R9Z8uD37HUyDAJ3I/ADsjca7dsmX6HX4QSkV6my14qHTx+?=
 =?us-ascii?Q?VvIrfsyAPiQLq8oUTYHS+HTVkQX/210mG2hSJ6dAYgxFRIERrCK7VHCjydFu?=
 =?us-ascii?Q?AfcfoF4M/Kf+2oVuBn9IgcSZEHjceTv6ZBJeH09TwE5f4JUlj36Cx5wVOLkL?=
 =?us-ascii?Q?GKo49ApktD8Ez4Du/QzlwkRmZWzhQwiO42dJts5lMZtjwi+8TORzodHPnlhr?=
 =?us-ascii?Q?vXNRyVIjU9gnGuuAQZjQnMIMoKA0M567nVmdBBvCYKrq9+gonICxW+t00i4D?=
 =?us-ascii?Q?D2cPa0IuEaTizvgN+ptZFmUFuWCyzV066kqXekyvgKN8LZtEQDkHUW3VLeT+?=
 =?us-ascii?Q?RdhgGFWhwGBn2a5RrKYDJBoFgOhh63KNcxtG3rCBlsmS0HRass4t7ZW1osqR?=
 =?us-ascii?Q?E10S72rScxyDjSHW1tweVQVacrAc6GdmrmNxioeF/aJF+7/uMQ+qsfxNjLs0?=
 =?us-ascii?Q?Fk61b1KdJ/1JO4iWfF7Yf89HmihCA/Jo/a6uocTwQ4fhbFyKGSagB93mDsY9?=
 =?us-ascii?Q?XF4YjHxLRv7lJnsJy94yJoKCBF+kv4oSbDnkAPmz6pEo9ZGqr/FRVS82puIa?=
 =?us-ascii?Q?AFL8KwchHoYCmDt3s4c8TxURSPm6wMexThvKpE0v5pbFb4XjyiDVq6eSX7Oe?=
 =?us-ascii?Q?L5az2MNkLNJxV1ium2GF+6ECvKcO3g2OQhIZ5+P2wTKLT2ZtdpkJ1TflX00n?=
 =?us-ascii?Q?auVHXTaLVlZ1r+/z6dXDVAqFGFLW/xJA9jKkWtE4MxXZ5CxbVYdsgV8rTbOH?=
 =?us-ascii?Q?9b61aRnMwTv4CJbmJn23hBOLCJxJf++uN7izlw+y7ePyjj4bj2qL46gqJGqY?=
 =?us-ascii?Q?MV2AP/3FRlHisBao/uIJjvicbk31xGucc8d2iTVj1Igj5oGCIxGszWG2lKJS?=
 =?us-ascii?Q?WR7pGsO7hqqjWoexJ7oq2yujxGOcoa7P6ijAhb2gTbr8hq5tKih6yX64GlNF?=
 =?us-ascii?Q?5BCurVFCl0eXl9vs5XSWxBwfOIl3VYsViw4RQ7jXb6nhINfhRBFdYJXQFab2?=
 =?us-ascii?Q?ijWvg5dWb3G74cVze0/inwfjwfzABCZ9Ki6b+Sap1e50Go7mIG4+0EgiXtFU?=
 =?us-ascii?Q?aYrZqwPCxjdNwpH+FxwmFjjArqGmYhG5YwUM0HYF9dr0HBIJml7bdMe7SOZF?=
 =?us-ascii?Q?mjvcul0RnSQrum7k/IakyNXy4Vw+usCPcWik9v+9WctsHIJd3gw2QkBa8xmK?=
 =?us-ascii?Q?mpfFwO/W360Rax81h+nLZ11UeOLeFAcdbsflpak0dyFR+6/ldrvm+l5d71fO?=
 =?us-ascii?Q?ZlWoFrUxZH6OTQmQH+Oo4+M6YDYUmJKGdhLId2eJ+kEa90zype3LgH9CLwUR?=
 =?us-ascii?Q?yyXQ5R3XA9NmwLYGThpLyM4BZrnXxFR9JBclEbbJo1aNd03aHBLyqhqEi0cn?=
 =?us-ascii?Q?1xdrMwp0HK/Us0G3pnCPctbnot8eBfsy+KSND7oSPPeZgH+cX0upeKMFsnj8?=
 =?us-ascii?Q?0lPfvcEWDA0b8tGuc2A5QqE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a57573d-a6f5-4b48-5f5a-08de20b83b1c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:17.1839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BM59VkHOQgOlfp6hf6N9Tjr9X5yY+8DsFvDQa+IbjyROOqr4BT9w2yqO8lo9/JrNc6Hh4pBBva9i+dauermMmdEoqHb0QD2H7s83K6rco+aDeBLFEVtOj10XQ4gAxrWW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs47l90.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index a9e703981f371..77e8aabb241a1 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2416,6 +2416,7 @@ static irqreturn_t cs47l90_adsp2_irq(int irq, void *data)
 
 static int cs47l90_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs47l90 *cs47l90 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l90->core.madera;
 	int ret, i;
@@ -2423,7 +2424,7 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 	snd_soc_component_init_regmap(component, madera->regmap);
 
 	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_get_dapm(component);
+	madera->dapm = snd_soc_component_to_dapm(component);
 	mutex_unlock(&madera->dapm_ptr_lock);
 
 	ret = madera_init_inputs(component);
@@ -2435,7 +2436,7 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	snd_soc_component_disable_pin(component, "HAPTICS");
+	snd_soc_dapm_disable_pin(dapm, "HAPTICS");
 
 	ret = snd_soc_add_component_controls(component,
 					     madera_adsp_rate_controls,
-- 
2.43.0

