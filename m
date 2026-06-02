Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B49364E81
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 02:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780368957; cv=fail; b=tXe8U0eDs4RVgQN+Blw5FsQ/f2iakvp1WgnFt2ANRtr1NAtBytPCwtb1plcfKHtVNESSbLhmxRbtijAKkpwGcyZHAmlWZGsvVB4Dfk8YR/2GjPcs1wWmZk23Pb7p5RFMq3VQgXEQtpi/qsZug68TZQBrPap9dNv52MjTmcPDeKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780368957; c=relaxed/simple;
	bh=P/a1Q8burAdzhLPVTM2+v7cfrG+fP2Bv8r8vQfqQyjM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DLGgSjbk28KnkNgJtIpilGSLzXoBPIHK49BOGxPDaEolD6mC+E2YnUo3oQJmOj0BEDP6Lb+Qc4gA6Fw38PgleGYWr2ZIrhIINMyyywYlYSohNoo5drri254QMqCqSsOSVS3zZp+zkpR+z+HB8q6L3QgHCr0l8nHFuBrkkYoHgDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ma07/1h/; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ma07/1h/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGwxftUY8VJ2ebWF8RJI2KQgdPLRrpdfgKMywBrpP1b0eoC0hz4L7yU3fXUbqrfJI+v2Ct8dA+VFmV/1JP//uIgOMWEXzj0GuCiI61/b0/gmmN90PKcJi8qgTILBf4QUcKqrd9/Lz9dgz78EmUXxh2bHda3ByN7tvkYOTQT4ry6VCGAFbzCBV/fL4LWbMhwMyshS0U55EB0PsW3mqvyGtyr5tl368apF0wRlCD0ew1lwuY18rXMhEnXfNRN/pIIHYxCnNUze5hKpSnP/fSdGwQ5aUGjMt56ZKy8umiT06yCslECgXniv+rf2W6KMVMCrquhg6nrfFNloCiRgXOs1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMhmAI2Zn7m2FgeWeSmNTPMm/pqaErsX1dEj2Xdmbq8=;
 b=nA1yO2CzJb3Hr8bFS8uNSB7XVgtbviyXX35kSwJ/sgca9p7QSubl7EVRQHCToj87ljr+9+U04qV97bYdIyeOisZ6keMPZfi5ttvcFmnmtnN0rqgKBDT+K04aCx6vxU8684Xp32bneDbvgmOUsnL23Z8htcr2nM8V/Nt+K1zZJ3klrr7cit7wAtCt1gvMfsuC49ULeq24ekk0Kmje+/yxsvaFK3gQJO62hez2/zzZtcSS3uJW7SvzOzoJv1kxwDBUCLbLl7VnMsXxX+co4/7pOjwUUwy0UQNP8B24A7aQEwVsoMyqy0X4nCFA+R0N5Dl5wB1fu+Pc7gWBySK137gxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMhmAI2Zn7m2FgeWeSmNTPMm/pqaErsX1dEj2Xdmbq8=;
 b=Ma07/1h/snoggPS5rntIb/u79SL/Coxddcrs2NdPbxTA3Ikf9ThDAnHd4qzEAjsZ7x05oYOsrwPX0quTMvBJhkWbHnh6MrNyAS20nU5/2jz01zI3RsoPuIGo2RQF352MDA5LvVQQrrKLmcmwjAD4HC6lenlS6NnjK23FGbTrNRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB8313.jpnprd01.prod.outlook.com (2603:1096:400:166::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 02:55:53 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:55:51 +0000
Message-ID: <87fr35k5vs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/6] ASoC: stm: stm32_adfsdm: set debugfs_prefix via Component driver
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Jun 2026 02:55:51 +0000
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d4a3d9-b5be-4656-7fd0-08dec05274ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|6133799003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	9vDgcVI9vG7u1Pd8HD3sJiyKN2wAKr06HnSttdZ8F8/c9BSE1i8PdmP7yVrAmAXsuXSzs/fJOEv0+AV13N5jMCWNlc0xuajEBUaItFAXdTOCNSlRCyJea9e1GjBNIZHA6tEPIpngxz2WFE0ExaIs8dPhSd4KScAnaKzSnOTVhemPyaol/Yaipis6/f4sLGu/3NlhJVNAVUOHUPSPabMaoamj1AP28jjNOAU/Mtp3W5MsxWT99HwBig8ZSw9q8CGE5zJvjKNq9DMZSAOXkuIBD7BN7BQ7QIKt3VxmO1apwbvke+sMqXgBPEwXCousCgMWY6C+NQk6sxXfyZj+64dQOH0379gAil1RuntONkPBxm/Np4cAYQixl7b9UrAiyoxt2IhWSukBfYryyht2cIPpmM3FKyAp3nDglx5hHTIp0qg8q7le0CGQM9oRajvcp1sd5EmMEGy9iGbIIdczqEqifI6fFLw8wMrovdnmGTYLA2qyAAlz0RoUruakabH9CrojwLo/IFjMmZQ3+xfUCYUbI6z/JoGE9aGL606vMO8I5d73uwNt6gqYR68IPbrcCuhySFfULIIpWuQWioYNQiGxDL+Ngyg4UEeRiLN4NQM64iRW4oGgj1CGQm+aDLyT3vngfa5cnD0PloJbbFY/RM0xB3ZdtFKUHHQNkq3VX5MaPcecDga667T9h+Ou4itSWMRMHLR7jsxqhPdZJRwuwmkW5QK2B3J0OkH9uQDLzwpS5SX+gFKibwhaSx7tAmHDrbW8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(6133799003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2F2v4ycOExQ3JX3QS1S7mrc1wwuwXYJo8yPc/y+vqnJAOXVdN0qU7JnPjXv8?=
 =?us-ascii?Q?pwN+2fkj1UQbVw6jNIlrBJNIp0lNIxICD487KW6W8K10lzN1Vj2Wd0vN4jX8?=
 =?us-ascii?Q?gF3zSFdm9L78j8HwNXRMQ4x/kU2fY1dO361AJ2jELJlWZ4d2Zpe7Okujlgg2?=
 =?us-ascii?Q?d2FMPtwnEwoALrHlaFD1vgZErg8ZxHq0hkIv+VrvOH7JzlbdFqKKpE0lESHN?=
 =?us-ascii?Q?r5h3/Awli93PPddPPg8uYxEKheAC2SefuxZ5mBXeq/kJL67OdMr8KhxEByvr?=
 =?us-ascii?Q?a0s2lVl2xDp+SHm1DIhlhiXbbU+Ph112xC9gsySlFQwpp01UBFG6gMECENFC?=
 =?us-ascii?Q?8k3NcnJ8OxdKwFANfGs5mpsxk6XZOoc/QIHHN/B40XE33Rar7hljoS3Dy8au?=
 =?us-ascii?Q?kWcvEXVXak9s0/Ocyja42J6iFVvP4JucvdHKL4kktyv5ozeOW2QkRbNSvELV?=
 =?us-ascii?Q?3zqD4pqgU3fTO78jsVEO0A+gj97gw+l0X+Uj7ImbKjX14GiL9b6zyYJgoAUn?=
 =?us-ascii?Q?DPwcQmyy0CxZLZ5+/AvLgIrtJajlJUsXaMxwMapky00x08UqGvVmIzFpPal8?=
 =?us-ascii?Q?FcF60rOEa1KB0nmiYkE32XOJsG3YxjU3NBJCzVSW/rLIhSF72Nad67md2MM5?=
 =?us-ascii?Q?XGnc13PU+wqYGCP3fESRU6WamVOySDzY5dpbJh10w3UCpQZ9g9SrAd3D8oyp?=
 =?us-ascii?Q?XcueJRBru89wyXm9Gf5QiICuDCMxDZI+S/Ft7iiO1p+QSx3OUp3RjcekUxzl?=
 =?us-ascii?Q?ye5q74dMd+j/9Ti3m8OIUVWO1/ZT5ZvvM3mU83I7ZXMUEd6PcLTatGzQQQuS?=
 =?us-ascii?Q?RTKz12ZGyaDhAd4WCE6/ES+qHPhUHfLId9qpmvIouwe3Ssh5mBPEt3shxdbh?=
 =?us-ascii?Q?Sx1Fjx4FzqiB76o4q+4oXGMvMdcpdploVOzRHVbDKFtnOdlHQefBz98Xe4BB?=
 =?us-ascii?Q?QkJWeZ9hsaoDyVARA/DzQvPbGWzJ0p5kdtrbpfBE1UPYbG9ipEOrlLAW9d9N?=
 =?us-ascii?Q?JlZSHfXr9H1yHou4MW69fYfYI2vGEwiuTw0tt7pxZ0CFVcJuGNFPEE5KPPjl?=
 =?us-ascii?Q?bOzSbITOIccpZRb2nJEEwFBNorhkoYSJmccfi3bYZ6z8Oellt2bAo8B6A7a3?=
 =?us-ascii?Q?O/75P1ev9sY379dsxo4IgRg9/AempLXgooZn6RtHDqt/JD+oHsKDD9Q5ErhN?=
 =?us-ascii?Q?losP5L38QXoL16am7A5aV2VuErT2IIyo1a5ptDkzYCtqU44MtE1MCX7Taqgi?=
 =?us-ascii?Q?k+sszHW6HeXKaYDDRdNIP2ZQr7f+wy7UNekDQWsOj+HcNmUoub4MZ86uPnGP?=
 =?us-ascii?Q?BuTJzGLzIjDEQWRXzit/t/qZoJfQOGyn1K4ySSf1IM6S296oBqTWdktDK8R/?=
 =?us-ascii?Q?51B6RE9A/wntkUIWThmFeCr9OSUw8SUkIetWynZgBBhbG/jtgL1oXCbsAoB5?=
 =?us-ascii?Q?aHiZLuu5nYFw0wPk5G6RdQ7ju4H0a2/3sEfgHxsr8tUmlkVTupDJ1Z0ShojW?=
 =?us-ascii?Q?9uytm0EY95ZAI4Z0/GYcrvJDvQPknwbvv6BKxWlc4mBuYBO9G9pvX0KI1PMh?=
 =?us-ascii?Q?3oIE5Pa9jFQal4qjnpaZhMOkWW47bJbJhW/RrBgRsJmzIU6Xo0LxvLWYfWPz?=
 =?us-ascii?Q?cuLKp/3mEygA/zttcnewH+3qzjsR40chs/vBC0JbzX8HEi2CX7jJjnfS8xvh?=
 =?us-ascii?Q?/u/130ZjwZfnuxCWa65bs1pwCiKcGar1XGupk0iFUTs/vVZtBMhPSH+s0g0r?=
 =?us-ascii?Q?SqYSH/glle2OEe+k2kAeHG34HC9HlRkX5FszLkT4DnBfTogtsLlm?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d4a3d9-b5be-4656-7fd0-08dec05274ea
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:55:51.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z605da/ZkSs+Yq/tmHM8sYvdlttSZHYZiGy1TuMFn/HEyPd/Ymf9p432lzH67jvhsQIoFkLzu1Ud2pTIweuWbT4KjEbde24uptOC7J/9YpMgMF56GJbwNo/Qj4g3/3at
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8313

We can set component->debugfs_prefix via component_driver->debugfs_prefix.
Use it.

Now it no longer need to use snd_soc_component_initialize() /
snd_soc_component_add(). Use snd_soc_component_register() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/stm32_adfsdm.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index a585cb9fc011a..66efb9a0acb9e 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -312,6 +312,7 @@ static const struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
 	.trigger	= stm32_adfsdm_trigger,
 	.pointer	= stm32_adfsdm_pcm_pointer,
 	.pcm_new	= stm32_adfsdm_pcm_new,
+	.debugfs_prefix	= "pcm",
 };
 
 static const struct of_device_id stm32_adfsdm_of_match[] = {
@@ -323,7 +324,6 @@ MODULE_DEVICE_TABLE(of, stm32_adfsdm_of_match);
 static int stm32_adfsdm_probe(struct platform_device *pdev)
 {
 	struct stm32_adfsdm_priv *priv;
-	struct snd_soc_component *component;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -357,20 +357,9 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	component = devm_kzalloc(&pdev->dev, sizeof(*component), GFP_KERNEL);
-	if (!component)
-		return -ENOMEM;
-
-	ret = snd_soc_component_initialize(component,
-					   &stm32_adfsdm_soc_platform,
-					   &pdev->dev);
-	if (ret < 0)
-		return ret;
-#ifdef CONFIG_DEBUG_FS
-	component->debugfs_prefix = "pcm";
-#endif
-
-	ret = snd_soc_add_component(component, NULL, 0);
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &stm32_adfsdm_soc_platform,
+					      NULL, 0);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "%s: Failed to register PCM platform\n",
 			__func__);
-- 
2.43.0

