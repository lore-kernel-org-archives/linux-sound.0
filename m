Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39742206B3
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 06:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784850; cv=fail; b=bNyEdI6NC4vTis3ZxxP9ez2I8NHUpu33xJvXxtgEvLtkKCC/dsRUy9faGKMs9VrdiI79cXJ8SP+xHzhXhfgLLvIw9V8EpYosXCR0iHR2zvyHT1edL31/ueusMO3Wp4k90h83Qeumv1o4OD3nGc1S+nN2xDEMZJfFJt0gkqHTjVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784850; c=relaxed/simple;
	bh=NKJdOEll/jK/xlmJAoFCOYP19vF3kjoCXYdc1L3WYXw=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=au6s0RH2mLM0ncTDTgiue2Lu/24phdfa2SnW+VTgiipgO7ADBOFNsLVBDnGTtA1lo3chML4Dlb9vHXnir1NqLpPssfnqNzSpqGOGGUx8kelYlLROOE75KGi6AVoGQSx31Hzmp2U9Pjc+dg6iOsTIiMy9JjD1TqY8NxaALmU+kLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e0jd9BwT; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e0jd9BwT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wII7ulSl2GNtbm3sr1wDEzCYRtQlJwv5VyTsfu3vqK99I65gXKRZUQ4bMgcEMnCGFpNeHcCGyEWM5vV9E2xb+ObX1/Mu3mQ+i3/+ATooJOTQ4oljYaxfTF+mRrUZfi4pz43b8OomD70lIHgDQEJ2DHHQ1j5g+vEWbVXjBmNxfMEiHU2TW70jndPIy5fHStuzwFsxr/+JnsSbiMPKYPeqUpUQXaSsv6M05wOSGKLuIB4D7h1ZfXI85defj4ITM1ceIcLrgjWmnrJM5ZB7f3KL3Ze704rHBU600df/QbGS7ju0Cadb6gguOJlR2n9cyJr0XEC4ocrqeKFFBeCW+HFqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykUazRcluzby2lU9CPhtANY48LZ/PwiP5huTMHYMkIs=;
 b=xhEskXMZlRZ1aRoT7HkxlIBRRtY5Vly0rzGxsRvFMXnLnYEBQcxOTun2baUw//9T82Au4CR4kQBo+k7FtiPrYyCh0tDqRYw6Sb89pHKEraayiktbRFTY032dFlPWOd4gEgeHsGkhxY4fp3i0uo7FiFJGLeUqa36vHaxrM1ASajZ8jK6aLEC+MOISCbCrZ9obkSU0OlDoRF7Q5mQ00U35A633Hsp9mFreS5l/dOj89NZ8EHC7J63OVJVozkPEIKk/zYTsUm9zzzJpBtYSAXXMkMs41O6nJTgLjqaylKKW/MDW2NarhYxo7d2OY11O1rl03oqwGA/7r/ZTV/mkgWS8Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykUazRcluzby2lU9CPhtANY48LZ/PwiP5huTMHYMkIs=;
 b=e0jd9BwT/F1ZEYZRYxFd30Y+FDZHlgDgY+NjI5YA3DZWyswu+sayFvBtJM1gqRuCtJ03YfbXihTP9F6BeKWiX6CqRvS2G8X6fDmf4qGvoH5opqyRI1KH5yWqAFDLqTnCDzsr8fPARqFelQSIm+dXtWq77rSBlCfJyouS89qgj5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12992.jpnprd01.prod.outlook.com
 (2603:1096:405:1dd::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 06:27:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 06:27:22 +0000
Message-ID: <87a58g8vue.wl-kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt8195: use snd_soc_dlc_is_dummy()
In-Reply-To: <87ecxs8vvc.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecxs8vvc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Apr 2025 06:27:22 +0000
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12992:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e1f39d-e47c-4b18-02f0-08dd7cafbf19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QBw8vRYJWQefxifA+i+wYZyn4se2Bb+O0j5g49EsickWd4GxnjGq3qC1vAF2?=
 =?us-ascii?Q?Twx9esphokEqYS2gHZVmpiZ0uIEUUTAO02+KKP6KVXVjB+TGfQoQTm1NYiKO?=
 =?us-ascii?Q?6Rw4PwdiXQVrxuP0HX43r2zOAcskITbFSRcLILFB+ebgjnnJhu0RjSv+AUeR?=
 =?us-ascii?Q?JgoYoybORiBnWt/UkPQC4ei24vE1DNg9aes1S4U2wsVPIxLfCvbJ3ns5uwhx?=
 =?us-ascii?Q?kxITVGBVYi5C8QgXc1RbD7jxybhoOoB79W4HMxTn1kRENCyadddHVx2y4bJ0?=
 =?us-ascii?Q?TnsFUhBP4g3lu+IMTWjdxLTFv8eqHrZ0eUiiEIzCVArQKR5DtrHTDAGgt8WU?=
 =?us-ascii?Q?sLozfMbP8eQmkVTpuSuJvLbIHcIN2KM/mwGxDWkvUHClHTAkYtDJR2xyjbpn?=
 =?us-ascii?Q?Rt/mZUDMF1hTbLk4Tt9XUL++H4qXkhTdWm8Rw2rLTQc2C1Mr6M8C0EoxBh3n?=
 =?us-ascii?Q?M/kqU785LZhDcwYc+d8oSjDH0A5eiszHR5y4VIYjYgpvge7QwxfqgszxtUXR?=
 =?us-ascii?Q?V+Hhsb3/KYFpF+ith9ibSk3lFSWhLDnOdZiCa01PbmM7wYl12VPmkYrzGPpy?=
 =?us-ascii?Q?qePSKcvLlN+YxleQdscnKdJ47yxiJTPugIySad9Jae04XuqJwLG5hYQ/yfcU?=
 =?us-ascii?Q?sELSEy8O+SIXFSmy0KQB5xmtpPkEbSiLcorfbB16Y8hBR8vsNPO9I4fIo+qq?=
 =?us-ascii?Q?m/7fri6XkOifPBU6uWC5MnKw5EfF78EApKhWQXhLtRQfj6CEhkFnJmLTXPee?=
 =?us-ascii?Q?OpJAJnVqBZVSb5U1lfk1TV3KIT0MvAxbfx6bi1sfOo7eDsIp+fZjCkg+PhUI?=
 =?us-ascii?Q?yZfVyxDK+6gW35bsWGc5dvS33yxdj27FAQ39rAR6zUB+3P8CLd+TDGjh29cL?=
 =?us-ascii?Q?NTrmLoyfxwQa36APc5AEZKnyFf1XnRbbXvhmOJCf5IbwpCuubBFKPzarP8SC?=
 =?us-ascii?Q?FsJ62F2o+/6AEPRUC4dqG/S7pmLxNYICGQpyIPjdjPlhNB+q4O7PjnFovWA1?=
 =?us-ascii?Q?hoeZPcT1Tc1vO1yZOZsNx73sppdrFLWBEmuy3+KG3fahejZGO41t/7nzuV99?=
 =?us-ascii?Q?AmbwNRrgyeW0+IEe1guikOpp4rq3iMxTW+njeo5ToZpDdrs4KPkSAwgiGeBv?=
 =?us-ascii?Q?5AiWRftnvI518hWXNp5m3840KbQFDoQXDcntnbhCv1I2lEUodcDfchxxYQv0?=
 =?us-ascii?Q?Du/Vc81pcGyVXMggEKD1jsaNesFkWsd8mau46b3q5aeuUJBBNGtva5NNMVGZ?=
 =?us-ascii?Q?8SZ/jEScEKjOq9vkvYovautmx3Ljwyf3SYcBMTqED+VR3jO0HrZtIeZ8T50k?=
 =?us-ascii?Q?NP8RZS6+h5YmNFuK6ley0tmnNtNr2rnwP/Vah5Z6fP4ip2hxhzzR2NdkLyi/?=
 =?us-ascii?Q?rk3G+tP0RvdGk79PJ8eJHkeb9TqnYBqiHii+qDopEvYu++kSP2LvsMdbGd3B?=
 =?us-ascii?Q?/tEJUiT0g5tW++6R217cHnU/uR4O2tJ8/xS1Zr7gV+921SXefTJ7cw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L3+25Q4QEsTiFOvFF8fdPPquQYRNSsupQSh+GRIp7UCIjz+f31acWyK/UU/7?=
 =?us-ascii?Q?cb8fa41QM8vN1awGRdFXyPHQulBn3gGQu6Y1ghaSl5yYDZXsWTRTmK5+X0MU?=
 =?us-ascii?Q?5JDjpnCQqaJwLZWHkACByxKw4m32JPN69oCXjt3PMZ9pM18mh+RZTvUos4xg?=
 =?us-ascii?Q?OjZVGeKYnbpON9v1EL2wZinr6IYdq9Lxgk42d76BMCZ8RadKLC1qFqS8FYbp?=
 =?us-ascii?Q?mYt1ibb5n1W4KUECmxx9I7v4SMRYHs7i20o8uEc9eytvUnXUjDXVXllysHNe?=
 =?us-ascii?Q?TSntlcbv4NGmRUGrRH+N0cy89ePl7yVEsNPUZiSvVrGgzCM+UVR0WFqurgAe?=
 =?us-ascii?Q?VN/OWzWtVLCJnKj55xTvc3+56Twa60yhA0cZf9iMT/BLU5XFFqkIcBxW95sH?=
 =?us-ascii?Q?b7jSelTLyVXrWIgyKKWB3SaSbP+BeVNr+xVw4J24TUuCCuv2fTrBOpLacsMD?=
 =?us-ascii?Q?SqNPhfFH2I9pqMUvlSWftGcakizs2Ay0IUvco4PBN9LplRrJXfHM0xdvfE1N?=
 =?us-ascii?Q?Mn5oPhOtXg1pqji6Pp3ETn0HQp+yQETjtvb0EKwwDazodLkPLYo2awooO3iq?=
 =?us-ascii?Q?xEY/OomQa0gK5HW9VAA8VfiYZ/Q+UFilGQ1V8We7U8bAePImCTvaT17E5FrU?=
 =?us-ascii?Q?G95j0nUZX/obWOTp2kt2KqzAbGLBhviuSpy1/wqZfsaIn7uFFJCyX+efNxrN?=
 =?us-ascii?Q?4Wo5yg09AAh5xA2+lPYOZZaYyWJXoeNfWfOAqsIGfS6wbQWoqmkehr9KyA9v?=
 =?us-ascii?Q?4JGnWEvusxegTSZ6yFmGB2Xs8d53XQI2Evx95tiyXPSQ3b9XuPOwOz6fDcrv?=
 =?us-ascii?Q?tXBEel67GhbppH2brtroHz7lHk8hPG7u4Ou2p8416khZVLg1midn9foUYjq2?=
 =?us-ascii?Q?K/4iXRAsLjaA630kZmxgmVPRTugh1KYDS5fa4B48K2nHcXKUVS4DN5A8SzUC?=
 =?us-ascii?Q?2QXNlK210CGwlUeUVTj5ic6V4cTC+Kuhb0tw+C7iF44pAwAtighfdEqWcSit?=
 =?us-ascii?Q?fbJUiir8DmMx8Nf30CX3f0xoU0cI0MXOwOfC4/hXQ3zePKhizPwA29TbRfW4?=
 =?us-ascii?Q?FO9m30o1FB3KBUPzKNxpGHIwhvw3vD3ybjFEvg2JWVXtio1mqzw8pTjpqPDR?=
 =?us-ascii?Q?BvDWcDjEEzb9ooSjIURjluQYJyUOT3h1vDpWagx/r1QugE/Hl/3f0xdMe2JK?=
 =?us-ascii?Q?hx3aaJPh7jxp/MYTmHlEAOhwsx7Oj1/q0DxWb1kPiDyir/dpm/QW0Imxw6Zw?=
 =?us-ascii?Q?7KjMyyfBgxcHUOabcDWGvR4iXlxAQjgOSiC0swfQFUwhfkTAP4dN4UVOYQ/a?=
 =?us-ascii?Q?iG8gfjeXaTfNJUmnctYHUO66FttG7uLBFH51vj8sE4VDE5JfvlEsDZfHT2cI?=
 =?us-ascii?Q?+i/g9Fh1+5f2JYhJz7vR6sfdzl0MpjgDZDZUUOnM9H1ArjDkxJLDp9TaGxSr?=
 =?us-ascii?Q?FDW73YCv/MLX/dOVME32xWgPmZOR4xq7iVjdS9ajQyuTfuIH3sIHhRH6E41m?=
 =?us-ascii?Q?a9/sCMSHzIKcA3XyAARV0q5fkME6+rgHxwALfetgVGICLN20W3A9/R9EHKoM?=
 =?us-ascii?Q?RQgdHXfxFY8j/GP8SF6TwE7CUlwVApLuU89zVGKswDuJ+tXmVpWW5y/2X3l7?=
 =?us-ascii?Q?ZBhiuoqGnP3kjACm2vUoPHg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e1f39d-e47c-4b18-02f0-08dd7cafbf19
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 06:27:22.5779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFJN5HRw/aVRLCtbtYKKwFXIwZdYS9dIMhxZF05x+a5kZDwCGAAjmDMZ/cboITA8yUY2LZXaWwIsYJhG6PvN4JRaUup9bDpMjkr7anGPRc0ZWTXJzRjeVO4jdatZB/yj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12992

We can use snd_soc_dlc_is_dummy(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index df29a9fa5aee..85954083f40a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1379,11 +1379,11 @@ static int mt8195_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 	for_each_card_prelinks(card, i, dai_link) {
 		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
 			if (dai_link->num_codecs &&
-			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
+			    !snd_soc_dlc_is_dummy(dai_link->codecs))
 				dai_link->init = mt8195_dptx_codec_init;
 		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
 			if (dai_link->num_codecs &&
-			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
+			    !snd_soc_dlc_is_dummy(dai_link->codecs))
 				dai_link->init = mt8195_hdmi_codec_init;
 		} else if (strcmp(dai_link->name, "DL_SRC_BE") == 0 ||
 			   strcmp(dai_link->name, "UL_SRC1_BE") == 0 ||
@@ -1423,7 +1423,7 @@ static int mt8195_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 					codec_init |= RT5682_CODEC_INIT;
 				}
 			} else {
-				if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {
+				if (!snd_soc_dlc_is_dummy(dai_link->codecs)) {
 					if (!(codec_init & DUMB_CODEC_INIT)) {
 						dai_link->init = mt8195_dumb_amp_init;
 						codec_init |= DUMB_CODEC_INIT;
-- 
2.43.0

