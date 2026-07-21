Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED23377EC2
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597237; cv=fail; b=Lssz1Aol83mUNx2H89EZYdJ9nCxsIehOdM0AfB8doYCEl8478JGYBcN4OMvdzLUA36o/0KgCXnesubc2kIz+QKIY68aTsE5K6HUlhVbum8eVEVlFW4/lS+Ib19kETMfd9Pv3GownmMRcvTATtY/Zc4vnZPwnK5k4u75qiMHTA24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597237; c=relaxed/simple;
	bh=vFWRm4aigPdxUi6eoBgxD37myvUWr1NqPVOKU9jKJSk=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=rX4UrFisaCn5m3vulQxYSVqu/wnsn/IWkcWBj3NEWNb3/Y+58xQ2psBW9PLSsYeUUGbxvh2m4oyMvAF9lG3/QDdhJiDnCovV2mvWjLswaucTphr7t9k69p9Jkbp/Qkn0pIDNloJUznGtwSFMzRtYFtUwZ/TbnOLGZbHwTqgP2Cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=T6wXOMqk; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="T6wXOMqk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hn2yB21mB1SR28DraWGyfnCiFqL/OLVr+fsjC29lnN22Y7kKwQ9U1rk+UUQaiLp6HqCFbEZEvNXU4TEEn00vSUROGydvPlcqhLI306Z4NLR+UvAw1cHkhb71x8XJEIH3fHRGQ1bIo5vzxoHmncwvvBkSWhzdx/zT+P3XeZ+LE08w43WYPGEcyl+l9bA+PGjCyCTyJW/NoHilkMhfgC18Lrq/n+s5lTWUlse4b6EDyGJNMN3j08YBYUkoZxiCnOhswDKsGzsE+MkLDehd3R+Im3RTANmOsaC5fO8b1d4axGn7cQFx2rqvaLBFhk74caddbOtgNcypjURZAD7dmjOmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xpZXuR+JutdqbO/rSTn3MXD+cPRf+gg2W5bc65o/Hw=;
 b=DOrhgkwf0a2ZMJby9F2wQd3JhL5dkJ0C2gJGCBUp6p1CQaGSou+KTyRj1VKHZEBRi/OePOp+AEE4jQdcTWhvT8fjItUV+KdYJmL0BZSlczu6ngtQzFiLj5wjj3/h0LgZ5nJVWceC/XOYv2lmhQqWYTc5RQ/v7kZQm59MfZpkFVPvYVFH8v7UO88eXPsnhr++tw6t7QkkBOfwEtN5lX6R6Hmkcl8am3Z19anBQKUEtA5DooZZarb7kfUospJ7uGm4t/l2adSJN76EQ52ZNJAx9OTtqlzIX3nZJrHRzR90NuCetKoJX46vigmfsyyn+VhrIhN6Rpe5VwQ5HH996ilShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xpZXuR+JutdqbO/rSTn3MXD+cPRf+gg2W5bc65o/Hw=;
 b=T6wXOMqkVinxAlBFWN6qt0q7QcI57V4FNs1811BUl/qVqJ7W1oh2m718eP654yJnKLP/df/QwrWPvC/LqfE1oJURa5tYMQh6DZWF65qmE1mddJMrFEyOZwfzFvEEWYbkeqSYqNos8s4PU7FLvnAN4PeyirK1ouK4x04cyBTa0qw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB7164.jpnprd01.prod.outlook.com (2603:1096:400:f6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:27:14 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:27:14 +0000
Message-ID: <878q75jfny.wl-kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: atmel: atmel_wm8904: use dev in atmel_asoc_wm8904_dt_init()
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:27:14 +0000
X-ClientProxiedBy: TY4P301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: fd04855b-9c73-448d-b98c-08dee6c731c5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|38350700014|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	f6cWf39jvaRlE97z+r7jg/qeraX/00lGm9yaLm6smDP55yNmnmWZUQozg1zKL+3Gy6SuIR9G1GV0JXXic4ymUI/o1YL6AGRlkXjewXmWZNw7x5QjgHPm0QVdICsy2pui1fOctagFTxQP9p54+rv6LAl4fhQccOJwgV0X0uEynS7pcA/bPkttwudFeGvFp49iMCu+ZaiZm9VCkIO2QqwEfWkI+I4uMi63CW55vf91orls0AuVFHmt+grQ313A9CSG9G1zsYh8sOUavd+H+QR4D1e0mOjV161IJ7NH4KWGnIoymcyykLz5uWEGgpkvJcIKiKvgELuVVWyevUf404RLTCyEaZ3RqXvHuqS8+FlAlQld1L2HozLDwAY4cnsDogbGCrIJxeV73y43uG/IOzzCbS9XyDtYatQ3Bp8fgS3PTKY6K9n08GeevY/3qiH0Yjj7nmYgkGnNlAlDTHCYgCShEBWau5zKDZnZB0XNC8nC9CtsMHOXaUsldn5tm+t9w8moDF6U8CUIYtoj/VPl/pSbi5BCQiJQTWm/KPxXGMNnH0kYYdJ1xRG0G9FVvC6mHGwqFAufdtNfmlnlZuMeixXkgDZhZ7bzuuRC5OIeSCLUXDZMeKC7rgTWsCH+Gco18JvBIP5yWFhurd+hC5puUkAVDpDpuRlM6g1rwzxWijSr8Ot8UWApjTPPzYF2I7D6Hn4E4yD5F+ISVF+hQc/m7Z8YFNtZ/5jwX4Or4AUozm1FXnc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LJ5tvTwiQtbjCpqfGNv3zC7+qqAfGm/DArjVh/4wKq5qIZ1ctJ8rnNRA3WwR?=
 =?us-ascii?Q?ZCO7jUijnyFUse6mPCNfwTDIH5VljzhVQbAsc2C4q5tla6G7zl8sTH4X/Jln?=
 =?us-ascii?Q?dGhfuhw1lIaLqFjemvNvjf4/89+q3RnaSdWpgETu3gGwAxzK87D4Erq9LCPG?=
 =?us-ascii?Q?a7niKOpprZFqJqmzYRaf/mVATbcOTC+gDLl0szkMwlCIU/bo/4lIRNaW8r0/?=
 =?us-ascii?Q?ILl9AMAQ9tD8B1z4l6x/8t2Bi11vTi3uCHy56kHgy3st0tYHNlk5RfC48RO1?=
 =?us-ascii?Q?IR6w2zQ2PW/ztkHwbXNUNpaTONdAYUW346+W12j02uF11zznbqta2qvH66qT?=
 =?us-ascii?Q?LJspWEiatVZ8ppuqsfq8Be8LDcl/Zcp76pOAHJBwqQ5h99YpoAhHQIgty5RZ?=
 =?us-ascii?Q?crUxN5/zRGAvf0XMDLTrKsq7s7cxE+SonR0ltDY8RipGpnRq3Xc0DD8mQCw6?=
 =?us-ascii?Q?V+GOOtGA8X0ShJl6+5LclgcNnBornErd9jvflBRQEQuGBehCSkixtEJ0PhZY?=
 =?us-ascii?Q?ZzBPGOWzeh9DicM1oYkZMr7wjJDfuj6Fv4MPi7qrKsgq9Sulx4pm3ycG1W/9?=
 =?us-ascii?Q?JGa+VUbYokk+G2m7ETlZPkWLsDqHunMTSVFciUQWys6n2XkJi4+y/JjJD3Dh?=
 =?us-ascii?Q?tys5IftccYMWBwbftDbnOySbjDoP00ojsmX+j5y7OH9QkVN1jRgXRfITVIxP?=
 =?us-ascii?Q?CuSoj7ZIvUOxR+FfLFEBP+V/zDeeS2hG3jVOK4UzG2XystKV2zDIivLVOHcz?=
 =?us-ascii?Q?bDn/JUyfyKTR3wK88rJRFr3sP8UXoJv9A6P+7UA3iWG2qsXfrh0yOWjtdK1W?=
 =?us-ascii?Q?8b4kUGSDPrQ0aRw3oYcwMSYl16FkPQePccE6BRMMAgY0hOdEMvdy7X+fl1D7?=
 =?us-ascii?Q?fM7AXOGPROIE6KahEvpxpfBOVfwy2gIOJSAdCQOHtHz/hy8OkUvpzEz3/hTy?=
 =?us-ascii?Q?rqpHpwA/SOXhiVZv7RWqmz13P0TfNZetxvF+9rr8qaVyfesI3Pz0+7mb/P3H?=
 =?us-ascii?Q?Dgl11IXweLWAyHXfYUGJsoiEDxAu8F2JxjIPD68nqfUR+7B23DWKdAhAujMy?=
 =?us-ascii?Q?zO1saqAaoSBi+9FGrxT0a3DbSvBl3C3OWBDGK9JLGIfXyjb38l6cesJnwuUk?=
 =?us-ascii?Q?38Kekzp52QyoPnWURdnWO50dtGKPTJJHh64s+K4XU0Gnp8ThoWIJC8CJ6vgn?=
 =?us-ascii?Q?zS5yXgC5QzecqK1fqYQNE3b+3G40iceyLE1A7Cw+JG1GTK7hnDOwXR8/A53l?=
 =?us-ascii?Q?xYmulnMagvr7tUdMEtg0LHj3nG4xN4sUNMnrU/ZFKO9VnLB1zFvg7k8gHe7F?=
 =?us-ascii?Q?a3amsccTvGEIuyDuV9CouDETIadbrcJ+Ke7o/QrXDTyxjhl0uBKnz9Y3BHtF?=
 =?us-ascii?Q?dJeWsvvWy7C+10ES9c4p0npSJY1YAplM8YEYLTGMsHT3woNcPSLwGE/M1ySV?=
 =?us-ascii?Q?sFV+CD46wvmo0r1jLRTt8xfLEL326mJoeDHyuxsIkI3jBiqJ5xPNL/aBSIXR?=
 =?us-ascii?Q?WszaN6G4/0kAwV9zf5h3p/WX/wSZkcNfDSLgOkj2IvR1hIZb4fKOfYB885WX?=
 =?us-ascii?Q?vFb3Bheg/e8L4SG/xwvCXVM6ZEzzrw/DH6wH0h6l1sROuDVz7W7KrwQ+coX7?=
 =?us-ascii?Q?o7nkjhalxsToWGTqlkxhttq24EEHP5ZLx0hNFYxwTHo4situdX9RZRHFY4zO?=
 =?us-ascii?Q?htJXhBE9i9FT8UDh7CP7+D14symiwpcQEcl0e2KwZdrKPE+m0c7FVWuOh+Ei?=
 =?us-ascii?Q?BX05AIYGaSLsDWd7dQh5ghw8X3tcDBxQM/9uaj/QH/Oi0AqXvXRj?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd04855b-9c73-448d-b98c-08dee6c731c5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:27:14.2575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymNHzXssEoHpvVPAC9M1e1JFKD/ogWmq0ujRaEnjdyVckqvapzIPMO3gs2EOT/bRpmiOag87Hm/P1ZmIzxwk1G8x9h/QIm8/v6jtqBDdyM66tctMR7BLxuesLRJXWgwT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7164

atmel_asoc_wm8904_dt_init() will be updated when Card capsuling.
To makes its review easy, use dev in this function and reduce
un-related diff.
No functional change, but is preparation for cleanup driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/atmel_wm8904.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index 0f4021c6c5882..df3e5ef8fa617 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -82,32 +82,33 @@ static struct snd_soc_card atmel_asoc_wm8904_card = {
 
 static int atmel_asoc_wm8904_dt_init(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct device_node *codec_np, *cpu_np;
 	struct snd_soc_card *card = &atmel_asoc_wm8904_card;
 	struct snd_soc_dai_link *dailink = &atmel_asoc_wm8904_dailink;
 	int ret;
 
 	if (!np) {
-		dev_err(&pdev->dev, "only device tree supported\n");
+		dev_err(dev, "only device tree supported\n");
 		return -EINVAL;
 	}
 
 	ret = snd_soc_of_parse_card_name(card, "atmel,model");
 	if (ret) {
-		dev_err(&pdev->dev, "failed to parse card name\n");
+		dev_err(dev, "failed to parse card name\n");
 		return ret;
 	}
 
 	ret = snd_soc_of_parse_audio_routing(card, "atmel,audio-routing");
 	if (ret) {
-		dev_err(&pdev->dev, "failed to parse audio routing\n");
+		dev_err(dev, "failed to parse audio routing\n");
 		return ret;
 	}
 
 	cpu_np = of_parse_phandle(np, "atmel,ssc-controller", 0);
 	if (!cpu_np) {
-		dev_err(&pdev->dev, "failed to get dai and pcm info\n");
+		dev_err(dev, "failed to get dai and pcm info\n");
 		ret = -EINVAL;
 		return ret;
 	}
@@ -117,7 +118,7 @@ static int atmel_asoc_wm8904_dt_init(struct platform_device *pdev)
 
 	codec_np = of_parse_phandle(np, "atmel,audio-codec", 0);
 	if (!codec_np) {
-		dev_err(&pdev->dev, "failed to get codec info\n");
+		dev_err(dev, "failed to get codec info\n");
 		ret = -EINVAL;
 		return ret;
 	}
-- 
2.53.0

