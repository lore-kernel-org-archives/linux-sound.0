Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5F118DB23
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533515; cv=fail; b=Y1jfovspdE3/oEOtFH5IeCaeVju5ASrM2HkkXrnpp+4L7TtNRaP4uemyH7pR5trDL4uWk+R7oeK51ZWjGQgFElkq+nHP9QhWyA/8sCKDO64mvCvyJ7bVE/Iwvqnaoa4Etcw1gaabrH3f3yneNV8apAw4z0c2wpgWDkuCx9j+hAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533515; c=relaxed/simple;
	bh=Sdyb+HvWvF2bLrsLq/Z1sJWQTl4SsWgu0svgvuMZA7o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qa2/56lX3EOStWZCJAmGCP5cPxK292CZqw+NMqgBazEDqD5wg+fixDrM/Jt68aowPKpUmJsi4gN+ls0jLHeAnnYw4tJ1VzgQgFWb3RG/yRr4Eq/25Rx9wFSP4Oe5Rm0V+AK7AH4n3sJcgSh2TygT65Cw6dmwd6+BBNjhrtAJqso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lSnq/SBv; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lSnq/SBv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbuPJ4kJznX+ooNPB0l/jrb7eNc8FqwE/9y+rEf3dVhThPxCEBqPnpo2NLbYcxo6Y+6OrtCBi9V1ZQMJ7FViGn08mNPnX73FgkoGuUIheM0MC+BvUvEV7IjhobYLjcG2Fd4oycA+VOle165lwalMV2O2dGZqYqnJCZumD4mqWwhNOpm76IRwLXclHAe5iR2VsYBzNAt1dKqBYsCWstHtomqyVdA+QpWOIzOqkB3fmyiMXHfbG+P5z9dRetUjKqM7ZllzmRCr+6cc6TsFijGQp3xJLJUovH1l61WEtbt88gQLCf7QNYciw5O6/T/3WX6XYPluTN2RNGpzyJmdBqZ+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv0o8lPxhcVc385l941jkhkmT1Hm7Crd+3sXT2ip9pk=;
 b=J046klWNgKAWEUCw3eUNBN94IkCvc5szkkl33PmDvCkenaNgl91B2Nxop08zzSmrLqGjGxAt5ABsr3ZFUufO9NPo4Umzsul1N+RtmUMXEJzkuNq3OnWanv6kA+lPY6wUR6HPnFSv1MCkw+1k+YL9x3VziQZN07jLS4x6/rn+JT+tzaw/ToGX7tm8fkf/lAPVmp2ld0Wy+rx/hNcptJHghy2bWFBchCC1za2spaGLXqdFstx+AAucyu/IfZ5oyrDJRXiwFhUp9w7khft4NZvDDSvvupGrpx2vqFlsGfSIB9d5TSumhTDuo3EEfY4FnAphak9smCfEwjh9emIbsAlTUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv0o8lPxhcVc385l941jkhkmT1Hm7Crd+3sXT2ip9pk=;
 b=lSnq/SBvy7UFp0crgQxNp3dlRNL7j4CQKu3FCr23PCoKrCa/CdzqFE6MlSRpILot2Ur1yiBJFS4aFCO3ytZu/9UTIhTCVLuB5FSi85BaUHSTUyM9dKO3heLoe5rZIzzpP1KpiMY38AfGgbbJWDT360v9PnA2r3tz71kFSfFv2fY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:52 +0000
Message-ID: <87bjupfq48.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 028/157] ASoC: codec: cs42l73: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:51 +0000
X-ClientProxiedBy: TYBP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 9827382f-a14e-4463-36e5-08dd560558c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GRnH0Tgz8TEpRoIQbOG/0PsFOO5shTjBvVHCvkxeuC/FTMjBbb+DmpvSB/w1?=
 =?us-ascii?Q?TT5lauoRp+kBBvyXNAJCuYkTfjqmgYH7r+Ts8IDLsC82UtVHS5XDvSFDaHiF?=
 =?us-ascii?Q?FbvKW2l7FfGU0sDQcgUBlOljcJwjPvBaiD3m7kfiZQx2DxGKtPpZw0+cCQ2W?=
 =?us-ascii?Q?Jo6YFvNiAEpQRgp+/BfmIx9n8ZtkPyemzThgJPfp2umddv89xun3ySBXEYsI?=
 =?us-ascii?Q?MMcvfgO/1HIp80XlB8UrpbN0Y12egHE/gJN00qKnPk1R6j8BOwEGTgzxdLq8?=
 =?us-ascii?Q?yolAw40i+cn8ffejXJE/mqaeaTZJeLHIUqnoT5X9JwVtU9Bh56sbOZBScVWI?=
 =?us-ascii?Q?OVC8IzrGwpwAmdwJtNLc444br6rvCqWhGvZOwWjRnm9PfViA661+cYdlvGRj?=
 =?us-ascii?Q?Cs1z5s6nsyIBm69D9+NfJHeVnJ66l+BrGyiGIvsz8xyLp4o9TCoTLl8OTFDj?=
 =?us-ascii?Q?cwlHA0AewJBVxDFwTpDIA72zpEs1eZZn3e3t6Gywbucaa230FUz5Qavcy0m7?=
 =?us-ascii?Q?JSZOvacPRvmnhrQuWDs0VO3p1g5p9Fo/WSqsFzsBLKormxCXSRCSnSjNwDXd?=
 =?us-ascii?Q?dfaX9Jo55vjhvo+EsOquuDyt/wNRIIiuDKiLdYP0w4G8IOn+Qa4Boo/aTScd?=
 =?us-ascii?Q?WzLVZUr+tMKzGhiPY4e16YhtpnZ6v/u1AF+UZ/Z22hv8Jxr8+Wjeez+kafJt?=
 =?us-ascii?Q?SC/8OXW4xQBH6qzJpDVkXpGv6hPvAnUaJRmWASR88XjIPhBAyu42uOI8NBcJ?=
 =?us-ascii?Q?uaW+XwUpJSVxvy4oUJ+5oIz0SjDF1RjGcMJluQqpmqygdguhk+AHsoaG9nB+?=
 =?us-ascii?Q?TXgT7XP8eQoZcWcEILiKskYMzdk1zl38TJ+uXoUIkkBX3IGY177Wltq/yQpK?=
 =?us-ascii?Q?t/WhzSsv6VgDd28/GGiWRp270msRN91OY6IpmvSzeIJ1fi8pcVX1ZgX6MWav?=
 =?us-ascii?Q?o0exVz+LqMLh84Dguf5lHIU4faDps+1uwLLa1VxYMxxM/IL169q/kiw3puoV?=
 =?us-ascii?Q?LsFnoWUuBbT/dVBjaAlobbatUqfT8DkhWRIIF65PvOCokIm38w/cjvCf1VcF?=
 =?us-ascii?Q?eaeIuRXSQvwrZZMRG1iBK6Eh6X2QgbkcY8S0CXghjepjrCIewNIHT+JlP4NR?=
 =?us-ascii?Q?uL1+eqLTTOmTN84ko/9b+hggMY607HqE2FtxjF1N5ti6snNQQLRD4tmgcoxR?=
 =?us-ascii?Q?iEoRIykWF9hkrgL6fHVgUBAwGtwZHaY4XvCqkI/YXnByVpo8G1QleKDFQp4x?=
 =?us-ascii?Q?VV666Bg5XajN+hQBa+BOXbMg/P52utZvw/xPcgfkQmmcI/mEujSMyJ4ZUE9s?=
 =?us-ascii?Q?iNxkVIGW/bEaMTJ3fX5vxy6zfAsk/ZImLhKGJDLrL08oZVCnkfGmejnWK+fS?=
 =?us-ascii?Q?33xgtBumQkuO/ykDYBGtLQHRs3lRpPO10EOnJs+2gUUNloe34A9Jllbjzo0Y?=
 =?us-ascii?Q?tYoQvqv9Klfu+7w2HWL9XG0GCl7znSIj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?anY0UNXjdEVmX08Y9ygMBsH9iHNy+vJY12LDLczFgosPbuBUUB2jHdGPcdcW?=
 =?us-ascii?Q?GP6rnlyfPzrNDT7BBUha2ydFmArw/+Q/9CPmE5e7K4Y2hlKrwMwqcCKehuEm?=
 =?us-ascii?Q?SXjbatyqHkediMgxewZwADfvkaQnpT80hU1Rj7S45BX3pSDk+kiWD3r+xovD?=
 =?us-ascii?Q?GaKZFyjS5UYQUZsypzfJNkLeEePpCXrqDR5gG0h5k22peGbxQn7SFU5bD3hl?=
 =?us-ascii?Q?bXm5jQO4S5ZSEaGDmCrOSJvHHjWlu7J1mETQf2DyVYNG7f0SxKxqaf7m+RgR?=
 =?us-ascii?Q?DAhVekR8FTpovbpihYT5dFAOakG8jOJDYUyb5MhmY/XyIIj0calmU88VHq9c?=
 =?us-ascii?Q?i/GUzjrlxemqwSiN5M6JeTOd7gxey28k2djr6ydOGf4/m4UfsvHiQyQqV+tA?=
 =?us-ascii?Q?kD5xQAj7BayP35jTmCK3es2h3YPaYlfqJTv+pwXgUJJQmURR9IKlr8Bq8J4O?=
 =?us-ascii?Q?gBqlagvxoZ9phLVg4WzzxZfFJYj7UWmaJWVRWe+5zw90b3VEk8k/fpPJEBdM?=
 =?us-ascii?Q?IEj4qFq9G14PHodDeUoCH3uLPkasWRF8pakhLdym7alk7M1yzb0QGPvdm3g2?=
 =?us-ascii?Q?uyWdsgzNF9b/xXh/4POc8yEm6Q3OQLzEh+VvWoJ2JGd1zX7aQBBkrDYLCKIb?=
 =?us-ascii?Q?vly3rY3ALfD/JbUFMiBKDpb/Tj11YZjgmTKVbDdo55WMfYbUegjaztC/47HP?=
 =?us-ascii?Q?Xn/IuGaEWb4vS8fZ8QCkZwMVI7nR99juwlS80Nly//OoEIbyITMsVdx0i79c?=
 =?us-ascii?Q?gWCkfuOmxAIBUDYXGtBuDO6GLF9+INg45H+CdQFQR5i+VkUZS5JCcm+a7NfW?=
 =?us-ascii?Q?Yr9Ja9h/DCism+0QkQ3ab7mkFUzMBOJU6CixKme/+0PQYqGepmGu2Pp+C6Nc?=
 =?us-ascii?Q?CXP/033qPgEhi0c7iRtTzmoQuKGhJxjSz93SEbEGYlCzbnPzFeEG1cAug0k2?=
 =?us-ascii?Q?f5piXcCgHTwzzGhEpvaAOxe42LEasP9y44e+8RY41ylGudlSlEL5xNpgJxhS?=
 =?us-ascii?Q?u7+ClKfqOERT1Jl5c/fNc6aZQnnxttRzQbNv6YOe9xmViscc/Vh1saXFxVzt?=
 =?us-ascii?Q?/cJdw2mld5hZaBqt6TKVKkbsV8d4vSoDm74F8rG5EG2MzPRw7bd1j2t4JIKA?=
 =?us-ascii?Q?Egpsc9C9lXuHkY21CY/MKqSotOdmoBichAFHQ8NAs4A4WO0kJomQNHepiFfs?=
 =?us-ascii?Q?HbM5vMeRz7gXzYkpl19i0mMAclDdwInZ44sYJzPkq0pqh9Z8VGh98ub4qQRm?=
 =?us-ascii?Q?mw2Mbtd42eayUJWqxmAAFp7Y27DFK4T42qvNfMRZuuAJ2mhxldXDW99UP19h?=
 =?us-ascii?Q?y3chSE8o+CSX/Vtvh8g9F7SIkZnhcSaotka+rz43sUDyYem4H946nTjcqe8W?=
 =?us-ascii?Q?A6vxK9x7rLlXFEh/7He8Zk4l5fCO7yqg3R39M40B0+/UOSd1Hta4bph6BAKH?=
 =?us-ascii?Q?1mWAjINJU0JmbJWZ9YgFLQwwlih4tz8flh1mZcDQ2BFfticuA6BbdXs8alZD?=
 =?us-ascii?Q?lgzZpQejHoTnBi+Isc8WdVWEurXw7BWpxBBZEDnz3Jg/cZGhzfaj/oXlBvNC?=
 =?us-ascii?Q?kz1+n9TRGEBq4HKZFAll9MLERNF+2xupop1FTxsO0PGme6z9wCu8IF5aGlA3?=
 =?us-ascii?Q?piYyZR6/ESG8rytyIghPwLE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9827382f-a14e-4463-36e5-08dd560558c1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:52.1355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OInwwCF0JhFlj/VgmfeoVb9GEuNOWVKc2YIuJIpxCs0KSc7pRJ9m9tB4y/RASIogHa8yt8wKyCwaS0vOoiUn2mdoy0xX/d7tNp26cf1r84U9HORqErjyXBdCZohRh6mm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42l73.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 21ba796a5cd9..ddf36001100e 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -943,11 +943,11 @@ static int cs42l73_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	mmcc = snd_soc_component_read(component, CS42L73_MMCC(id));
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		mmcc |= CS42L73_MS_MASTER;
 		break;
 
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		mmcc &= ~CS42L73_MS_MASTER;
 		break;
 
-- 
2.43.0

