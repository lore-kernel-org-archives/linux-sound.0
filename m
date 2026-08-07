Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6DC259C82
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064213; cv=fail; b=c98gOami7YiH9U6fccGFZzYUUcuXmq4xDSI3Gisx7/dD2pf14bUljkSeZkNPZVcyymTzjPf2sv1a84Pv75sqmZ3SmR+LitrDoam3EE7fenAhmT0JfiM5zuYQ0ipBW6amo3OHhE3NG+dzLEjmFXn3BSC3Zf2+a6Li7NStM6vqJ2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064213; c=relaxed/simple;
	bh=fz3N6AUuqgWsB+M3FX5i6DfmhJim281ohqv5Dhv+crU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WebPTFzkFWRifff5tFLjHv9DZgi0ehIgfpS0aKIZXW6W4HrZA183Ii2QegcCnGaBQQbCDIq7cYYKi2AD14kMaETXCSIUDfd3BMRa0fcQmNTctLXpn4bt4rtca9qzXQRSu+e9AsM5YCJ/Bd2Cr5Ku1aucUc99YeaIh/O4CErufMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SVlLzPUq; arc=fail smtp.client-ip=40.107.74.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SVlLzPUq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oqhus0L2u75w+5QegV55DTky6mRfPrXjwy2uV3r1qu/f2nmM0o8fgQAg55Vo6SxHSaBzOTvL+b7ao7VFzvBKk+3Q/F14ZgeS5O7pUtpM4VyFZuJP9tq+3zJ8plQTFGjyf1TK8iZhA5xVr6nVHxpOLJ3LutDMeCB2iyNfoiejgrhxWnILD6OJa4gminZOX1Tj9jx6yWXC0o4ER0JYFpXNvntDNFDNBPLEG7cRuq32hP5VnAAouupDy6S+cRh+iUF7NK2xZKff0oEFuPK4x+qmYFKD2xs3nbqLrxPueyq8J7soQutc+IkKhTYMpbzQAQd1VNlAiQsoAkfZZW3Sm9foSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSNytrmSyh2FuLO0qgMa7BACoJZUx+Hz1flcAfBNpaA=;
 b=l0QjHMVSVO3cJDXkAFb6QQ2TaBeHbUiaD6lsJIcshbOd/u+M+tAchw1VGxzejEWPIr+xmnqsNEPgDbYW5AflA1C369eXb3vBazaM9kYY4YSA2fjxVZvUtzY4D+fwIWQxVY/P28L4Tr4PmF6hwqqxVxk4bPO9uOJ/i4EGrkz77UZl/Ne5Th2pmSSgmzOgjGGq1KYkxsFLBk7GTkvMjU5V6wZohvR4upIm5qBSXW/EF3Q6lgAkeqt+GRPfZNoM8wm+dUaZpQHo7bIG8QUE3/HE8nfdcXi/iIFfuqQ3xgPkHVEUSnCzQZYHhveB5kIE3GuJ/nmFzUNSH0+pKe8lmELVrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSNytrmSyh2FuLO0qgMa7BACoJZUx+Hz1flcAfBNpaA=;
 b=SVlLzPUqH27vHW/hSmLQQbHdC0vLHGcRZHheNjJ4N+1a3RdZ26M1L8RtMpv55CC2vI6tg7lksuOTjrCHhDvZu4Do5YMk9U6fXSCXij9/q0ziMPrAwp58B9dG11uN3rNlj6nWn/3yVWmWc9rVjueMh9uCS7f4zXLmQNuI1FKWamo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:56:50 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:56:50 +0000
Message-ID: <87o6fesq7h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Rosin <peda@lysator.liu.se>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 38/44] ASoC: codecs: tfa9879: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:56:50 +0000
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 878efe6b-da05-4d83-2eaf-08def41ec3c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T2RaxJaugD5n3OaBQ03rOiMA7fsZtsdNZFAWPY2bFD6JWB6E9UliCZQT4TItN3kMD4l55y8h84uhwnZ6VfVMZlOE4/mHBbFLLrxC/aoECPIgnLn2jRMrk48OUnnA1R1VIWFqWs95f7vfPMGJPjlVTPGT3SegwZAi/9pDlzw1PIunztRCpTcyH5fmMLxwa9FwiDW1C6kKNjyvR9A8F6iyszCcSKHkKf4aJa9apMDTtk+ocK2WZO7NvD6tLAl0NAGkQpyIndOHYEbC1rVCFz66ywIorowhMIqQbH1txg7HDcdFuDAhLofodzPJD5bBTo6wVrITnsQ5/LlfEZybNvyDdJktk4/Xwpp57ekgvDzNGCwQO8M6dKLFwOWkrOxLXOEPUcJwBiNHmbxOPCyRvPVtFv3l+zONc7rhby/L1WG7Mzkj8VfcWuCH6brG0bhm6yl2Aty7QvRCtMUPgIAMUiOZB8jCwv45Qcwcl7s9ZwBtc7fgRPji4VaF2oa/oeDWkmpA6tmWNb1Z2fXaRKP2V6vJe3YvVyC+zTSDrJjnj0cbeMWLIm6KGy8hAqgYu/+iRKwVu05c378YbkyL6uNAc1uanKlgbHD+kbeFMUlub2k1vp+5//AHOYy890oB5xbtmlBWajiSPNY6hhCrmKaQUyZmqLNxd0sy/PrZR3e3aIzm4y2jmKmumRJEr1IbmcdFGbzE+munOVoOaeA6Yw8G03VR9q14cNxQOZ9yEM4Lke/4FbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t2zYgYA40KN80W9Kf27TkK1vjfPH0DK30YmvRPEQdqL00/5WetQYkFh4Ayfj?=
 =?us-ascii?Q?1J40sO0vEN5UYVLxrhnratrShiyYxfFhUY1txr2FBGVsH0w/BKH03FMoOOnr?=
 =?us-ascii?Q?uktHPRwXNcLQNfT1clEFg0z+qW1HJsLcEwh91GzFoTCF27mZoW/mioPfcQUQ?=
 =?us-ascii?Q?X+JIZBDP4wlJrivhKHC1p5im/eSrhf3tRq5QDT/ZeTgAVYK7GUSFGYd/Mlx9?=
 =?us-ascii?Q?JH+XXLJaDioEB48JoG6P2urCGJAgOc7QKXlI5+Yw9Wqw0yB4yC6vA2GswBz8?=
 =?us-ascii?Q?QCY/6frQpb+unsupUyKWWY2SFNiLoD+LLQ2PH6XsCpNKZt1zIjdfpDKjejhQ?=
 =?us-ascii?Q?jn4pLYIAmMRpyS5zKcYKI1RoTICfgFJAcd1t5NNqnwADx/gRPdeP53fI5oSg?=
 =?us-ascii?Q?tptcYciqAERvjOVax3fhTN+Y7YClEpCxYHDgW4H7hHEaPqv7eakmD/WHC17J?=
 =?us-ascii?Q?/gpNEzht4NlGVRDNP5DXiP9N4u+9VbAGx7HLg06LcJF4qjvTvUQWmK5e8K8+?=
 =?us-ascii?Q?l2qTfLPWm5417jatWSykYoqjamEZdjwfoa8O05r/Gi31cAqsMJA2YgUnCAub?=
 =?us-ascii?Q?awRYCgdzBSmugUntGOxHFPYXDRM2jjyhd8rNQjdv8sgnnPVT4/XVLEkEOXV5?=
 =?us-ascii?Q?TG9VXXs/u1hmITVWye9Wc6MS+2IDI5SSYNm30IDL/Rr1khHlI3rj1DwkNPPN?=
 =?us-ascii?Q?9ORQXRBQ9uTN50ubc7n5HLWgSPU3wlkKFVvunWbgjnePGp597AaSi8yoBueu?=
 =?us-ascii?Q?NvcDpKbIFloI/Ah+edAHt4tsqcfUSfIyOhZbzETZd+UoPis13Q2vu3zEfp6d?=
 =?us-ascii?Q?9awR9J0aAN7EiEciq1R1shvw1/47sjvRSg1gihs/1FpKYuuPfn7YgWpC3n4w?=
 =?us-ascii?Q?nmpdcex2oy29R50HytErT0A1jE9Tutk9EGBNXa+V/T/jK69f5YkdTcmfj54z?=
 =?us-ascii?Q?HscTDdF74RoNKwvr8xKE2444v737KeP1Op/U4wzYeeTYOwIpboz/o21gpB1p?=
 =?us-ascii?Q?5ejtM6tvAb/XEn/qecSd+CONIS1t0Uk/OBAJfdgqQSAioZZb4hdJ1olVWAso?=
 =?us-ascii?Q?6Cy8G4lPQNcqCw3AwCeRZ4A6725fVdIUayLoGBb+GUUIDkjQNTnmUvoJs8sS?=
 =?us-ascii?Q?OGK2q0xjmsHK8qMWGdjoA0vfYCmNarygA+DFXkf6HRyahZ9R4w8EKjHCZowx?=
 =?us-ascii?Q?QzN0veOueXrk+ob3qTe/sUBHwc5PhD1oJkr6TOoe8w/ErLAghsyO0gQCoiKs?=
 =?us-ascii?Q?2bEOjnymeDG3kfwHGNqR7DwgfZiwG7KSREOBWT6LU0HxQ3ZCn1S+J7oXHD3J?=
 =?us-ascii?Q?Y2PsAY6LSSSk6DEkUw4eeSZAKKyWMtT9Bh847afoxmsORLm6+XG9WmY1R7Om?=
 =?us-ascii?Q?umiYkqjTFeGjujG35cPkyUv6BcBa35Hn6kyaYIjQRNioEicj2W+T9Xq++lfC?=
 =?us-ascii?Q?bBamFgsxZpmSu7t9Y2RhORfe1X7wbeSRpnlvQ7ht4yqKEvKFxhzyPbegh+9m?=
 =?us-ascii?Q?N9KJqgMYREKZYG0uRd0qT7b+gTUy9NZL/IEn2dtCEgpNe0B/dlGdbccazGaY?=
 =?us-ascii?Q?e3DgwXXhjUMcwasVj3ufRK2gX7O+dkGQMmt7UC5pDZBPijvE+4edqruX8T8b?=
 =?us-ascii?Q?7i+/y7CSIECGbR+HzTms7CGK1R4DY7BSzLImHJpQyl9zXRrQ0uZTXbY+RBpa?=
 =?us-ascii?Q?Owts8f5j1fmVeeHO/FpTcq7uz4w9RosvQ7ct+K1TZNCSz+6yewiFMVsY+KcI?=
 =?us-ascii?Q?t9RdAMnX/PM1UO3WPJWN5+JHDiKb5Hc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 878efe6b-da05-4d83-2eaf-08def41ec3c8
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:56:50.5405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0U7/RvihncESHsAupfKm55fE03Xb1cN7z8FPcDLAaHqyk50regEdd9VIzDj8mOU1mXBzUyqvKSF5i/ssws/ye6biaGiQhNUc+WL/3L6mDFVqoJyY1lMUotM/7LtpOYZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tfa9879.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/tfa9879.c b/sound/soc/codecs/tfa9879.c
index f30479f1f53b0..5191037317687 100644
--- a/sound/soc/codecs/tfa9879.c
+++ b/sound/soc/codecs/tfa9879.c
@@ -248,10 +248,19 @@ static const struct regmap_config tfa9879_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+static const u64 tfa9879_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops tfa9879_dai_ops = {
 	.hw_params = tfa9879_hw_params,
 	.mute_stream = tfa9879_mute_stream,
 	.set_fmt = tfa9879_set_fmt,
+	.auto_selectable_formats	= &tfa9879_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

