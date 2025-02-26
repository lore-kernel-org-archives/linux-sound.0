Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA65C18BBAE
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533493; cv=fail; b=I3urB63n2cJsJQ6wrNkQ5V4U0xOWqftEy7nVivENkjZrz+fciZnmTTkv32DI7yCcQVSaDwvOYhju8wIkX9rFmTB4lPd6dP0zT2VP1ho1wBa5baDuWMD1TTegG2vYiOcwytxIg3rRnfiChJKqX1RqL23U2g/KV0q4Eu2Q8m/V924=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533493; c=relaxed/simple;
	bh=1u1MADDMb0qy5mHKQL6pR1+nGp8NBz6MBux3v14AkEM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WK9QNuoL19Is0k41bViP6pZQftikVzBQxDgEorVX0CVekjQ2+nIf1gXqOczwEXnkihAKBqPFtg8Qm/CnKeHcOlJOco+mBcGCxbH9tvQCEjyPWuF36xm6Myjjf2a6UF9YA5/pzfaU5HB1pMt6H0IXEH55yifJ+fXKY94QJooJj1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=INN8GbzA; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="INN8GbzA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4uZKUI/RtFbaI3RyTUVOt6KjdM6vjByNLDZidGuE9eMrjZetxTvoIr2HfUj9rX0K+SpreNiBhWA5XYm/UJixlaMJeD7CDig0YZLErrp4wIAW2A3l64EnmOPojluEgxN1NYAxSaEmzsFSOxrKjnPWHey7UE3+8YkY3ghG/MjTjuOzmVSbaNlOggOesZaH3DR1ZXesypdX6rUnwL46XDT1ac8yFCyhAyya0A1mdaD41h6gT6i1ozB01hzrEGbVRD56xwe5b5lrdPG4rwYyI319pUSNNyYzt+e5um2GERsSJlNiMV/drthBSTgsw6XK67zyIyKQJ82HETjj9PuU6ayVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//7+7XT3RJ5G8MweZDNyuGzAlfpEJhkkk/fyt1jWsLo=;
 b=XuNEVQVoBWPTwac4L/UXrvquZqiT8jQvoJiJhAH3vc/Y+TW8+7yWZYPEO60ftRJUX7bOe0Zf5jP2aVR0iCrlxYp1Z3nBDV1v4s2EKSTb3TkyF1h8Xei8r3k9bG7N0toUzdNKawqNS3vNsA2QPOV+wkjboWHMO3MuHpHJnJPybi2m8F0V9lmyE9mi9XWHuusW6DUdfFrxQhklu7903dM7OaI6fvyhLGqE8Pc4I40kwTQ7hCKq6TG28m5JttHmloJRybkzu/WxXmY1giRNZbWLpQZZEoT+qLceH6HCotS/9UFpxMSLH0hqFfB8eEqe/0uXRXXU28aCi5NdN15CBA057Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//7+7XT3RJ5G8MweZDNyuGzAlfpEJhkkk/fyt1jWsLo=;
 b=INN8GbzAtUrW6wkjx2mzBxwxwX9ZWy5XYVe+8ZcQmrId/Iwj1wllNSsnTjwB7IBwIkI6JL4YKHBGzvmPOu9R43geXohS629rvHpzSuUM72dblLLYM8FuegWeZqaLj0r4iY6r3/t4FnMmTar+aWKZOdrWlxo0Twj+ockU/uAaYTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:29 +0000
Message-ID: <87jz9dfq4u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 022/157] ASoC: codec: cs35l33: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:29 +0000
X-ClientProxiedBy: TYCP286CA0240.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 5980cb9c-6b41-4ffb-cf76-08dd56054b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?99MHTrMGwZNUzqb7SWrUPLwyDXdxmbzLGiGZn54vq8ZOFsYVUhiyuMHo+2Cm?=
 =?us-ascii?Q?GzbUoisGg9jsFoN/4CNXW1gOQyYvVnmwhQGdRGmwTAw2OCBiEyLAREruCi7C?=
 =?us-ascii?Q?uMxtTsLppSALXuiwJcnwJZI7HGT0nnRn1oZ6vzoi6/W+tTsSiB0CrDqdXt8h?=
 =?us-ascii?Q?u4EWp5Ba+/fEwffX6ckArPXNxD93P7m7TO1qJ5ZsmMUExIzmxxzjlH7x5Z9/?=
 =?us-ascii?Q?Ll1K5ugcOpL6SsNsCw3lq9Gw5py0n6Ipfd6Yarro9jqeRBK1ANdtgKvT6ywj?=
 =?us-ascii?Q?nSrCzgX8jg2uIc4oJas+yBTLjb/sDK/5e7go6XgKlOJYpttGl0qEOkcO0GPk?=
 =?us-ascii?Q?mP+e5CtFVRl54HkfniNIBBGj4TSJ8TDjjbSBv4IGUsHyJoJw8LGY7JQcW/1B?=
 =?us-ascii?Q?vmxpdPIYyYZTnn+B918hoQzl0r6w70aT/9Tfh5OGlvz46qt0itMhdDcI8czW?=
 =?us-ascii?Q?u8E8rxN8I24lTh4QUZ+lS2rzVaxjjKJN5Q5OjT6LpEu074DzoTdH4m+UoQNV?=
 =?us-ascii?Q?5qEdaSbYr+0GeQLB4GhmG4U3n7zbzjpWcjlNF6wQ6T5HVvw1whG8trpLU5fq?=
 =?us-ascii?Q?TR2VPlqkrPMbxdkM7SDmiCxlCZd5mPt5ZnWMAw+ZQaae0MxY+dTkFi+ZIjWi?=
 =?us-ascii?Q?0tV6Bcsg0otsQRf7pX8Tvtbb2/y6mNjIQazkcx1p4GA2OjUcJRM+L0n2wY3N?=
 =?us-ascii?Q?3UtycfgVZsCsy+hw0ZjeAXq4XPBjKErNRBjxzlNoEMe98dxeRKqDvL277tqe?=
 =?us-ascii?Q?p7OhDT98S3KjjK0wfTPsegwjnNPvkcM7HYz7bpX0GzwA6qrEQjw0ba0gM2Ur?=
 =?us-ascii?Q?ke1MS3vmJy3vxoAvjV9Zbhht1Kdjq+JjZAdluXW4nQ2QwiEaYNkyAdKaufXM?=
 =?us-ascii?Q?L/+4pxioY0VgyNn9lr3JEFjRW2ErSc8a7ktGi7HLTe3zfjI7afRQ5aGw6fij?=
 =?us-ascii?Q?iI/a/yijfpOK/tPWltDofr4MIIhbzQPgpM6rxD4T6E63bvT78ZEmZPbA2mjH?=
 =?us-ascii?Q?dZ0J/g/fW92A+1sWpXjHCFLl/97BMzuYEedz1EFZc0Ymy68633/cb3Q7AJot?=
 =?us-ascii?Q?QgYC2dC0LZxbtz2U08PkhJJ8UTpIc0Lz/UwmV1Fxxf3F9N914uoRiF9Vue+m?=
 =?us-ascii?Q?/NYciHgqh9coXF3MagVRShISgGdXkcqrYIXsWpkfC1ohzT+ofzAFL21EnPIS?=
 =?us-ascii?Q?AtxtuvlXvhBFz/vsaM4qoUqyISpP/7S8oayu7Kyzuae17PrjL3eGCCAv67J1?=
 =?us-ascii?Q?bR/74Y5DOzBLVvmVqRwOsK7R3pk4ZNu64pjyF8lxrZiX6D6VinDPZzY88Tnp?=
 =?us-ascii?Q?6OVIoOTQuCmsywPo151+Y/RGjNHuDbrRWANyrgQ3Fd6IPaWbxaJJ1+jpw0N8?=
 =?us-ascii?Q?6vm9p1U634bvxFfiAOUttqZYRQDLmnlqq/anl5LNsq8f/VPtwhXMfD27JJJZ?=
 =?us-ascii?Q?jYEV5J+l3L6LcYt6XWO9Hl9DixdTpw2r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XoZfPw5ICf1K67E9tYsLm75QrwqDNXHriSdrsGR6+CU5EvgDl9fqld1BkvQe?=
 =?us-ascii?Q?Mw6jqIn0u0ZbT+lW28p9yVdApK7MEDH1wZRE/a2KrytIZOushC/SSvXQXYkD?=
 =?us-ascii?Q?3Doctw5fhvqnHxvVL8J0I+/NjVic4H20RWXX0H7WqwnvKGp7BGKd7pvjlCxl?=
 =?us-ascii?Q?gqEXADhJr8T57JizzpTpmvXJ/ZGiIXRNwPopzM4igg/adog9nOekET+997em?=
 =?us-ascii?Q?yTZvgyx8NoXtxcbDEk39t16DkcZQFnPwk3gv2U1hF14Q9AC+NaTcBVs5Ekmo?=
 =?us-ascii?Q?uYM/14vAfupZopDqpByTNvKNclhl7aZJgaEswC/yyDzSZfoysG41kFLmUWcl?=
 =?us-ascii?Q?lh0C3+UodYUVNwJ8AObouqsH55vJF35hX3yQ95LhXOSjWMSyKfmbcHupv65l?=
 =?us-ascii?Q?gjmh/XNtVQ01YVhpI+MhUext6ibRGX2vdg6Kc/uwK8J6AUxSonGJFiONGCkw?=
 =?us-ascii?Q?72Z2E4FMY++5pclS4neu4h6jVQ0zvkqicjkt4v/xubKlu5A+S1Ypn+w1fjTn?=
 =?us-ascii?Q?hHuvNDtnaHhykcs2vKM3JMchvdR9AfFKmB10Ai+IkbVMOza8qyFd+vcYR209?=
 =?us-ascii?Q?Q13LlaxSm2Y7LL29M0/UNDQiEEexEXngHLa0v8Zte5TMfHDI8Q4k0zrGWmjp?=
 =?us-ascii?Q?R+2KaZmVJXWZCilcLqxKEw0aEpjbu+SveJSPknNJKIGZ8uF5KPUtz3OnI5sx?=
 =?us-ascii?Q?lu2yUm3m+ZCQpBCMKljyP0UlSLnPeMxWX4oR12WnRJecyd0CQPNQF7WJSvGA?=
 =?us-ascii?Q?vfRh9Md0eRnNFriNT/jAWV7oc4sPiISv8qtf5dhc7iB9g+dtwmAWLHMlik7d?=
 =?us-ascii?Q?CupjFtb6GXXYs16VnSrlaa5xY/KHE4cIoppTRofHviR26HJPlvA3zpmRnumz?=
 =?us-ascii?Q?459GouckYitNgmrjcVdO0Ayu6DKkfVdtRUfgZrTw4xBQtq98riiJRKRon1na?=
 =?us-ascii?Q?OMBs8u/DOFSs19OPbaMUSMsmkvSRzt+vyY5OVlx1rBE/zxVghGDfRAD/BLH7?=
 =?us-ascii?Q?+xqrdr0ERjvy6kQVaMONIacWzNdysSqbOKuEq7Qj8ePV0eqt/W+uMXf2QHEy?=
 =?us-ascii?Q?hgPk1EQrYMqCNePTvGg7uyybYXApINlJTsVDnmu2UBNkDncxPgq0xqTYhP5G?=
 =?us-ascii?Q?SMA/8noPzYOwubOd4k0yAjjOM9TNScPlFSduHqxl26YABWhUCQGNxasowMzk?=
 =?us-ascii?Q?NJypr2WrUOJQZMsXszj8SUayHociIKrbNPwq2bPFFy6xdeGZ5Jd8UVaY2BN9?=
 =?us-ascii?Q?TLFuIhlDSdy0n6k8qI2h01RJLa5uP1niZkj/WImRoMpYk4eYHhw2a6yWbPSL?=
 =?us-ascii?Q?5K0YQakxxF4v2SGXudagYwMLJyIjRbxKlyAqIywU8+cNk2hXyJdakLgjcgxQ?=
 =?us-ascii?Q?MnAyFUDCWKBcmzQGMm+LBIR9w7awEupucBgUHJJQ+Y+J83C8KGbGv6mFYFRs?=
 =?us-ascii?Q?Eo4BMNSnKbKDiWVBPL/HsCbwMHzzUDcb1X7wgbI8rcdB7e11iF7mg97Yc7GS?=
 =?us-ascii?Q?LGQo22W4pSeGFDHGMHVHAozFFeOxlfy3x4lKDifH5WXsPkBuAyjADl/yREuq?=
 =?us-ascii?Q?267764WJK12QBTTT4tZxkjfkbZOW5vRM/ZmVkbM7QrR3vCEI7Ky7TbTVA0ON?=
 =?us-ascii?Q?aOyfWy52JYuVQFv+uwUPUa8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5980cb9c-6b41-4ffb-cf76-08dd56054b4e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:29.5824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyEFSIpDZc90s89YXRr0KCrmsVOFmiyBRj73793gTqbCWpsqX7D4zNGy3Lh3CRruLJkd9CHzU+MkIFhMAqP5llI7Qe0I3K5LyJ2Dgtfvcbq1BQJuy45ZEeIp8MifIx0A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs35l33.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index b03aab147530..02a420659a33 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -438,12 +438,12 @@ static int cs35l33_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	struct cs35l33_private *priv = snd_soc_component_get_drvdata(component);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		regmap_update_bits(priv->regmap, CS35L33_ADSP_CTL,
 			CS35L33_MS_MASK, CS35L33_MS_MASK);
 		dev_dbg(component->dev, "Audio port in master mode\n");
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		regmap_update_bits(priv->regmap, CS35L33_ADSP_CTL,
 			CS35L33_MS_MASK, 0);
 		dev_dbg(component->dev, "Audio port in slave mode\n");
-- 
2.43.0

