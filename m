Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB27214B06C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533464; cv=fail; b=KzWwbkvuPvsJMAmjJoY6JVn7cM2MYoE2oF8Z9flS1gDnuj6jdS3iVR04iUDTMSuk//AF64DIMt1loMyLjySwNo4AU5n+PORpu19nzDUOyYB0P5sTWKxw3at3eIWOKDQwIPwIMT1f/dDma0kdAJcHpv2TDAe8PoBETWnjFigWGtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533464; c=relaxed/simple;
	bh=9kMbLSRC1VozfprfPggwCnDLQu9oarkoUePFCRNojv8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pN+acoZY6RUr6u6eZ8f+YzVEf/WyOJtparMnJ/oMt4QTcALLYTlyb4KT8Y6uDrGTt2Vhq35OgVKhOdVNlgri8ec6+XcGjXNLCHOKzeR3mpe5vQ/GcIhLJl1dEE4kO1DOc2R1MMkNztlXTW8uNRY/aGgBpzXl5t+Sjb/v522B9kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IPwpw8J6; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IPwpw8J6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkcAvSZslhazEq1kSRquHWo3diiixCGOVDxgzclK6go6EBWueYp5/zc7djAnkkU+YJSfc7eb0ZmInNijc3Ma5DKu0dd5U1XywG3ahXTuCgRaSUAytXzknJV1GtPg+6QLUO9vd8Yfjg/CwYkULe+Bvs7S5Aj4w3Qmc5lwH2M31V3nQdyygLvMzTj7761wLdAJUwNIeQUouS389Q6RyZ75+wwe9jwBQESv67UZSUigQD5HiH1uFs+Qnjc6nFtTRL0c8d4gFQi+YfbQ7LqNMygXukGCUo79oVS1t3XJsv2ZUyqBnXVy9D/EJmU88wY7zbZ4yIW2YfwUl7TFcQ1mk0jWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2XvfERyLgxdSs8z8x6NxqykYs56s6ZSEQp7TP3rMa0=;
 b=rthoFEO8cU/a33EoOtFlH/A0Bu3NvwiP06HAbvGKylgFfaBzUgpypHekMsaBxKpX6WUBNOyqBdEE+l32WWRsySbBs7UJsiPM/VKDxltW35c9ApA+TlFGItqA+KKnSKLrG11iFM8M5KSnuMaasnvQ4AmG2YsTIeO4H4Q1tBLMpjPpHm2dKTguErQeQq5nbaee6bjc9oWrJpWTxThN5brHrr92V/zUvbPEvqmV94vNZRRjeeNiF8U8tfGRDPbc7PwL6dpOlkKxBtRHA2pty9vikAml/UKH0KXhhCCICbaWymk/ofZQi0hDuKYpmy9JZY76D6BHE3GGAis/A1wqtrXFWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2XvfERyLgxdSs8z8x6NxqykYs56s6ZSEQp7TP3rMa0=;
 b=IPwpw8J6saYbnVfNCt+VLGQVs4DF5MFU1jPcqAuo/Yb4vlEuTjGb2nXLoJ6Sli0y/hkmrNxUdsrJe3gSGQiCWEnkyFvh+9xyaDCVVlrEBhZ0ACdel73+VTKLCEzk0qYjfHEVjkn7WFa1h2XF1UlEEyQ0fBhudhvRBUKNle+Dfmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:01 +0000
Message-ID: <87seo1fq5n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 016/157] ASoC: codec: cs4265: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:00 +0000
X-ClientProxiedBy: TYCP286CA0277.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: ad27e566-68c5-4e67-649d-08dd56053a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2hQyhs8ZTI2T37sSa/wOyHTWOAIWFvaHSioXI7VVhHB4XXW3Kkcjetsxcr1T?=
 =?us-ascii?Q?y/Rer1ZWc1i9VQ9wZzQmL760pCPYWnKoga/Ie0q/eo2UKQmB3GffbPTjfj5h?=
 =?us-ascii?Q?CZJsaN/He+RxQHgZNpP0chUt/s0suWFbDlwpY66tdx72GPIxw/i1vGyVzcWC?=
 =?us-ascii?Q?DXxlUhwEs6zgvZbSGk3bdX/em5MTLOVBZR/bMzodd36JO1iVEhNru1eynSxL?=
 =?us-ascii?Q?LaILb4hzwLYa/aRFepvtivtkHrmpJH2x3zOwuWMqgZbK68WV2gy60YGRh3Qg?=
 =?us-ascii?Q?hNvRmrHTIX7IN2XijF9aAGr4rgSQpfg8C3HbF+G69VPeIrZ46MPw3UeokY/+?=
 =?us-ascii?Q?o7oEKIcm6DacjpICVWhvoEXcCvRx83GQlnSS4vI5i+gYyX9MjsSnqyihpmIy?=
 =?us-ascii?Q?/wcqhruhdfdfnC4un3ZdZn3HPA5AkoczEvhw0oYuW9wrhdwdTtSzutcycUgS?=
 =?us-ascii?Q?xJh0FFxlxkD285u02RvVrF+9Lkl44J/b4y+SGx85iigsBklt1QxESwLSAQzd?=
 =?us-ascii?Q?YcEAsMIdk0j4nF3duTjgJFMnc/HhvEw0GBVUeCg4KwyhkTmuVcKTpFK+QEUn?=
 =?us-ascii?Q?sAFB/c3y9k0EVHSX/7W0Vvg+hiFfTixpeOkHoqRRKJLRVoY8Ok/1lT5mrRI2?=
 =?us-ascii?Q?rx8eW5cJN7RqKYkaNNFkp0G+L4z92jNSXCSX4cxpSd8tQDsCmeUMcO9f/mmr?=
 =?us-ascii?Q?pOrs2R3ILPZh625ehR9k2pGCqvhUTOhLeJkQ54J/7fzBaoFXryico6nKVPsw?=
 =?us-ascii?Q?f4b5kR/p4RUVLsKnI9lYmkssv2EVR7FtNVEn4XKIYyYi6T4fnHme+WY+1+Hf?=
 =?us-ascii?Q?WLIIpqIu8NcpnUMQ+wN93WMPW5zas99SbWA4JX+qK0xtHkbBK2dTGHdo78++?=
 =?us-ascii?Q?p8lIe/3D4QKXpY4+8Dm81tUocWN2xU/QkEpRCMma6YuSGdpxkxPykqcQCXML?=
 =?us-ascii?Q?ODVC37jxlHo2RdXBghUD6Vf4jK++W4d12Ed4ONM6uN5BlBMYX381RGcqlR+z?=
 =?us-ascii?Q?KcJNl5Z1psby6Sv36X7bE4ngNrbfaU4SY33GY4v1Z215d+Mduk/2+2SDQj7Y?=
 =?us-ascii?Q?jTuFPrciA5ZIg7hQVxNPyO2eY89mybtTWP+Z7ugutaAFUI/rF8FreKpRUo4M?=
 =?us-ascii?Q?fZrjwNiBnIDK04KNfmpuXP+VIvncQusMuLOIQ3cWER5YTnx+Ifr7xFDrUH4t?=
 =?us-ascii?Q?2nsq9RQl4SBMYKutZ86K6RZ6xYoPEBnLQ6RyZpm/3nbY9juAqjktrO+AiWb7?=
 =?us-ascii?Q?ediU2HaVG7Sb5Mql3cF9gdW+L1RE6EWCMkCco3lv8EKKtz8GPwEENU+f93OO?=
 =?us-ascii?Q?DualPeuExUJ4x5OfRxTGukxCV7057lgjpIfS6hjXDY6rNcEMwvnvsq4ExXy1?=
 =?us-ascii?Q?St4hgiqoHQe9PVpjLJQGvzoCwOCFI7CyTimIzfy5vhW9mQ6/R8waE5ZYnOoW?=
 =?us-ascii?Q?FEj/9vsnjaIXImYVPAA6CpgQ5AnvfnFZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4Xu1Zb1oLY+onyRysBd/SBiGCET7IvTUIKQzLAjBidUn8DHaZOq9ebzXfbzM?=
 =?us-ascii?Q?0KeLC4hfRaL2RDmG1Ebgea0SQkgLw0O1KK6kYU7blIeWOjIvJyZc+yT0wiej?=
 =?us-ascii?Q?Qm3SbQgylXoJ6nzudoA3QIzNPOPMWkEyFAptxVHbJC4u5ZbK3FmmOOD4yRht?=
 =?us-ascii?Q?Y/GyOy0nShPtJ9/iOe0vb36yUrHWj3HavHDUkkEsrc9hJPomQHGfCM+eP1M4?=
 =?us-ascii?Q?p9KVlfCJRY0QBotvMecT1ksDYFO7s8dTNQjL9Zlmw1kc1X7GWLtJvyaVIUiF?=
 =?us-ascii?Q?2MC+Dd/hVfaYi5L0Zbm+ahuFQRYs1K4shK6AvZdF7TU+Cfqwa7d/0dIjiwad?=
 =?us-ascii?Q?oJSrajAQOYgfpC3oOhEgaKuineZsfrV07aIq91usKRFuGQBRoPlE2NHS1OUQ?=
 =?us-ascii?Q?pssAnl8FAu97DmPDWjHUOmzA6SZCBItyPBMAQ02nTgImJVVz/9nMjRvKda9F?=
 =?us-ascii?Q?ZLxaa/OY2L6KiFquENLc/DdCIJHxmzUse/qWqjhbAq0+bcjRR+nWdWq/SbxD?=
 =?us-ascii?Q?XxNiYe5Q35w2SEdSV7Dh1oEmuR0ez77AaMnGwjbmVjScrdN3sqapG4lz4ESc?=
 =?us-ascii?Q?2eSML8uJmfdWm3zXMSGxSECsyr04gDXRZvvaH/+8T2OFRQjnumqKk5NsWx1D?=
 =?us-ascii?Q?brdCEmglrTDWH6S/X7FXebdN0VL7ujNOznHFyqlM/BzjBICKTpaWOb4hRKuv?=
 =?us-ascii?Q?sfTu00UCMqP/Czw4ZB8VXTg2XgxbPZu+wpx1pUI7rhgL7RV5GpsRC8hhl6OS?=
 =?us-ascii?Q?e+eT6+1r1OJdRQ3fGu5TAScjHmWHO2HiS+2i4mrFgzWy6tadInqT2HuY+Kpf?=
 =?us-ascii?Q?eFryElBr4FtKl4LujDA4NRN/TgRlQUw/0s9lXK+imtpgk9RGoC+Vc6Tv2OrK?=
 =?us-ascii?Q?J/3W7sPl7rStC7O3Ep+e8migRRFga4FuFhvcBAqpyEQ3M5omhvLT/CMJ1MWB?=
 =?us-ascii?Q?K8yjo/t9zTa191TsJkat8ljXLNJKaZubNe9Dg7RsDRuEpcf9sAPYJU7LpUsX?=
 =?us-ascii?Q?8ccWZrwfHQtIAkAMJtKVO/bPJ0mCmQiuuR/hfpBSD826tLCYvFrdc5t7cRjh?=
 =?us-ascii?Q?jcKSStPn/+BtXIVhm7VgZd+NyfV7xo4e/KqHnGNzCACFG7xmgnsIEgM9iaxX?=
 =?us-ascii?Q?7rstHmTJpJXTBO/gfU0gMQj+k8mnoFWearajvEkl1RMBAVwYDuACM2+rN55d?=
 =?us-ascii?Q?uqk32mNxLEdXXQsq2jrRp4MLfDwVNnmvaQaiJNho4IMByBwEFtwkFqfgB555?=
 =?us-ascii?Q?SHPeyyaOGMZ0mYoEIHmEb/MBNtGDScapN+sVnlutgLOLbknMeZvNAQE2zkJ/?=
 =?us-ascii?Q?VcL2lDSSe4yQLY7NuMUHMdBSBP8y7vpf3dabDkFoMc1HI041sdWb3rZSfMuS?=
 =?us-ascii?Q?sTKfYmHOUP0wGED65mlsXCIkrTnSxxd5qptEgxzHzuDg9tEwnCPPourBYzOu?=
 =?us-ascii?Q?Zc+D/h/GcqbaXFahgx8sOoFRrDHsoCPnqEh6Hh7b2+w7gCxxDRPk2kpnwEnk?=
 =?us-ascii?Q?Vjwm9Rno1Jc1VUie1K6ySc2XAypO1ntKW6Jr6NY71P9HPSUZvquUR8rA+s4Q?=
 =?us-ascii?Q?ofU3z/2CVv4DQD/ccGc6KjPNxv4BdoCfTrYaGsXeCnS3sEnUP0XqctWxRPFV?=
 =?us-ascii?Q?hUwB44RRSWyu0HkaxPZHpOQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad27e566-68c5-4e67-649d-08dd56053a3a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:00.9722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o64NXCPehYrf+OKm3DUdR7CbLtoyiyFD4Q3s0JzQZIdQpY3rgdIEuCD8rjMeinIv8z1SEFzu/Eu1TG8QVEFXg5dR7AQa9TkfEplxIfuenez1rI8DfWGAGRptC7Ta+/p5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs4265.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index 78ffb7fa7fc5..3f759c13d6d1 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -344,12 +344,12 @@ static int cs4265_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	u8 iface = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		snd_soc_component_update_bits(component, CS4265_ADC_CTL,
 				CS4265_ADC_MASTER,
 				CS4265_ADC_MASTER);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		snd_soc_component_update_bits(component, CS4265_ADC_CTL,
 				CS4265_ADC_MASTER,
 				0);
-- 
2.43.0

