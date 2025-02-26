Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B8E18DB25
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533574; cv=fail; b=G5+f/vHoHir2vfU1aRsXYkqDmbCdq/moszcJvBqhfaOkGyaNUeR/viLGD1irn9or6ztKqxXD0YNknZZBfaw2qvzIGtE7PBOrxAOvPOY291mTMFp7nDsHn6um2dms+kWrBJPvU5G4/Ke1N1u0YobPtgl54sz51qQ/yVePqj7gdo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533574; c=relaxed/simple;
	bh=4TJenQj7ZNt5nKBCzzUVd2sGIBLedCKjAyV8wnq6tq8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mxnQTyr3uH3DO2Vq/6JAqbTTRBt1P08a5rH506Mr6IFGFviRSNyHtX/GWeVe8puCy8ewSdf7W24MX20Mf1QM8ihf4ARK6aDvgfOhBeov5uP2zh+bdAeM+sspWTc2eSxL1acawbmwu+5vnXDFKuyJDihzpFeXbW3nDi1wwc+lLgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=N89hPCuR; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="N89hPCuR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ms6Y3f/qtbmmG+qv8gVxqVgb8HIkHLnDNviWAPDxf7oLRCZssH4GJQWKcaZqccFSc42RhfVnXMBPPZXveH/ePQpYczT2mJnXLsxKJe+2C0DSiHooaNvUHInDJLD7kCIo7TJsXoQBGTmA7kBv6cL9DsIRFROJHXGuyS/tTecr3QDCz8Sa1wHDrkQTIk0CXuziyKnqBFQdK1n3GCJzDV8nFY7s+Sf3eqHgde6huPvmNFWu81mWXkxiXMBuB0z23AJQsZYLHVsDziCF+h1aLmenJ6Jw7/5vHbr70/FgP4jcG4kjmwO53bcjQnsE4TSL/cRPW6wg+O2hh0vUfDaNEEvKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8YviUWYB1rVbgA0AhiNGJ+emjI0sO/n56+2n4HL3Co=;
 b=Fqz+MHPYsH/EGDtZeN/f1jEeZDfVAH1od0oIMwBBQOVSls/EkblppYI5mmaI8eNdRsZ587AiojLhByTD3ZK+H60Zb0lsvdbI03qoj3UOGymXpB9yDloEpoexH0c9eR2XbiHnLOdBQMLY5exMZSFxS+Rz69tRXtwN5x04Ddk/iPdYgAtkzbYu0U8gndgFqeph1R0W0AQeOmSKVXOoQAW2nkRJzUpGypF/QOiUI3pKxu+qN+QFi26H8tTJperQQ4QoT4QaWWit/NLlLMrvGTr+UGcxIt3Lil2c46hdrn+bj7sTdaGs4QwzGm8GBjTzWBIJj0c3lsMYE+N9rL8tWYtd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8YviUWYB1rVbgA0AhiNGJ+emjI0sO/n56+2n4HL3Co=;
 b=N89hPCuRM1Yn5Q9yqNcXWNgaaZSC9TtAdFg5JhEgwqqcCeiHRd4bcSujSrmWwvi0ArHfTj0M0T3B1gVWYasD4CHQsr7RjzgLSQBjXbFS0fvhnGvlhik4YjogmLZMxeRWGDC7aVdh8x6PVFtXR//PpHSXSdthE+cEVFrZ7RU8T3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:51 +0000
Message-ID: <87plj5ebi4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 043/157] ASoC: codec: rt274: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:51 +0000
X-ClientProxiedBy: TYXPR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:403:a::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 8614b636-ec65-426d-9761-08dd56057c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k3f5wc1857ywXYdv2QaRSzm6MnQup0K4EEBAe564EKPrJs1zIeBisXuywJk0?=
 =?us-ascii?Q?drSBYmhENESUTNJQgst+UYF4kQuQT40W7WW/6il2LD81iLjd859dYz5sbElY?=
 =?us-ascii?Q?KoSsfCERGRr8fccLLXxN8fvI32N7p0XgOD7Zyb1l1LeVCBU/pk0tV78HFdwL?=
 =?us-ascii?Q?nhRUuSiEWlOBfBimBz6ctObFcZjFoED+o2jcU4uKmD7UgSbk7eGLXgc4TKDp?=
 =?us-ascii?Q?6y9SvmdFSWlgoXzAm3Pt7Tyk3fFeLA5sLqAnc3o6SAOXsEz7xZhQWWBmkO+2?=
 =?us-ascii?Q?jW+qwuMHE2lgWy7Y/irtYI50o7B7EQnHn9RTFU2idUEOcKV/4Bcvv3gZDRTp?=
 =?us-ascii?Q?MWQSK1yg5a7LUgGWoYMh5roLSuJYQG337YzLFxCsRdYFmIW6+VzE+JU7aZyE?=
 =?us-ascii?Q?bX1jzt9Hn722PDGokI5Bm6+cRuzY6AFyVlWjDPTAeTxB6ib2gn8IlVRpeFlU?=
 =?us-ascii?Q?IeZJtSOEZC+/st3jEXBMfljMu9wbp9KW4Vt1+J18F18DkufIyjL/C3ZK0+Su?=
 =?us-ascii?Q?Plf6Ut1rrgA2Q5MJ8O9IoXiNS5AYFZ9gP9cKrOXm1NUKEsxHwxFMvQSezTEj?=
 =?us-ascii?Q?xZRQoNU+IHZt4WZg0Z1cYXSvSiBOWhSWFWV9ZPyorvjmpHm2DOaG71Ra8yiq?=
 =?us-ascii?Q?qIdJ31L69g7/AFL9cznJBBTPbQDTzoTmBx18IL8Mca9yqeVBWc3XGID44OeC?=
 =?us-ascii?Q?Mz/EFnrxmEj/bAfMqjcLtVe9wG+UwO0yQ9uVobMDzGg8+BmnokeSW5Q2lWIN?=
 =?us-ascii?Q?vhI+pui0q6k2qPih/SbOEaA4UMFKG6tOVTH8MRAlD+gMjhobH05E6+LbRnEs?=
 =?us-ascii?Q?Mle9fIyG/fhTnunVbXWv43eX4A6tsD0Rn6F2ATxSd55lgr7zTG7hxEY+LHVf?=
 =?us-ascii?Q?nbOklhONBm7pEcYK8iuFvYY78lk9EZUfvrBHShi7t6hpH/SycBKMmmrYi5aN?=
 =?us-ascii?Q?7t2QoG+IB5sr9O+8BaIFqHDW6QVR77OC/u21//LiQc31j302BSC0NiqW/gWu?=
 =?us-ascii?Q?22kPRnCR40hFcwRRyQ2u6mi+YC6z8OMXRfQfNd2/Zqxt5axa6fuBNDSc6P/b?=
 =?us-ascii?Q?bF0ttMJhbpq1dykfBrs00FDeAiMly12+sfO0fSxoS6SZngZynlvTaMZu7imZ?=
 =?us-ascii?Q?dTru/BeMcJ6KA4SGyFbdpKF2darY51kRJf/SdG+SB6gB+2jq4t1pPNRtxwsI?=
 =?us-ascii?Q?tUhYBtHfrB0UhZHH1jDNgY1swtfTq5H5rZeO5/AKmYpKpOggoXXKTCr8YnTh?=
 =?us-ascii?Q?n313oUxkfX6y0ZdwMvBCgSPz95vBNbH0q2Nu8+Q1tWhcG+5JidNhsjrBzO95?=
 =?us-ascii?Q?3H53uekrwXhxHYz7XwJ2ckNcQk69qzg/6N+/KhUI+MNcSGYs1xhppPNfvid0?=
 =?us-ascii?Q?hvl6M3ZgDUBDzI1RRKLif6R2QFe2K6ZN5NByWkjliWR+PtEtR9jlxoPA3GCa?=
 =?us-ascii?Q?e43SRBekvxLGo6w3j8DSlZmBfaomsIQP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?674Uf+3ES4IjS7wtNrHQIrMC/dtnR+a4fbnotjlYkb70FrxmEYmNeLL67nFQ?=
 =?us-ascii?Q?/QBuCIbSmiDaGNttVYmGwWvpjjc9NNUmYkTXx4tB0DrohHaz2tk/PP+67rFc?=
 =?us-ascii?Q?U1U18wTc11ORMpemhbpe+ISJLqzfQiS9gbwog788nETUEMh77+hVCOXoWQCP?=
 =?us-ascii?Q?lD6YOUtDcNl/K8Biqz0gN6sDIDkacT+xigv5uK6MrJca1jeM4RhDsQpezupz?=
 =?us-ascii?Q?pd5dgeBJsaZtdM6o4zADvcCPcM+S6oEXK/LUK1I65c4kOMgsPQPhyK9pA34v?=
 =?us-ascii?Q?RvCalsm4nP++SW48H6qYBhurTSMTEm6Hj28n1y0Xv55p6O/38QQHxi+3ONo/?=
 =?us-ascii?Q?WxAPSlOKzaQQSGRk02c8yuhAHOhU8tZJKzY2p/X1alA18dNPFozlj3du1fYl?=
 =?us-ascii?Q?VGQb8wPtFIFRetBd+/nN0/DFC8u65nrmXdbwdVN2y8FU2ODX7Ig4umQ59eZM?=
 =?us-ascii?Q?1120+P2Eh7+8O7m12+Co1bgtfO6o8nCjWO3rWvryMab0zpQcBx/iQsea480h?=
 =?us-ascii?Q?m7TIhMdB5qpEghSgiy+jxLWflbAzvn98+jnKC7HRAK8a5XbFbAS0ic4cShDp?=
 =?us-ascii?Q?kfhLspIIeYrEnLMkydr6BQzixJHAfn1ZvP8fGBZnGW0H/5o0SHvmK7c17t12?=
 =?us-ascii?Q?YV/rnjbL46jFn9E+eMiAkjd4bn/GXpwA8fxiGJKZQVQPsv6P4cJg4jm5obR0?=
 =?us-ascii?Q?Af6mxsK+v1vsrU5+zUcvwFwkJkXinoafzxoYUd8hfxT7E8g31pvJkMu0rwbE?=
 =?us-ascii?Q?5c7wqh477c/WVFOcvd+8eEJyj5CSWux4yzHkduMUTiRBayDsli45wOJFbyoG?=
 =?us-ascii?Q?UNvMGD8kmvbTmpO5PjAXZ+Cy3ALZa2qcdOV+BVr37S979A/NbiUFcR+wT6y8?=
 =?us-ascii?Q?Wrs+jUAVznBVnrsq2IzvkF4GZVKmlhEzGVruAIKgGfiAcuNim0wVktp2LWd3?=
 =?us-ascii?Q?ngzPqXtOm81j56E/4CyjczzVAcFidVF6vJDj7dyeIrt4jI7VctTVaiZsDJRl?=
 =?us-ascii?Q?z80u3SwpGeRGJ/6Bw4hKPZ/mCzCq6EJJJpvjcBCFRUGVEG0khk+Y8798RKLu?=
 =?us-ascii?Q?PLvvZsK/iAzlrqLhDz3D+zFOovlh+oq9+Kh/lcp7ctsVAm7q5utea+eAv9Yq?=
 =?us-ascii?Q?546ZzYlxUt5BibiuzLJKtw4AWWMrmObv7XIu4+UZOVB5nNASwSGq/zuxv/0Q?=
 =?us-ascii?Q?AX0Fpp0cjgwo9flFeDcYd61K1GsB5wzdijfPprwHMascwKyakrQ4KAxiFp5f?=
 =?us-ascii?Q?/ErxKM3jsZ8gdjcQ0TJFMZDkJFvar03qwEiw+95322C7QgH5QdK3JPh6GDZI?=
 =?us-ascii?Q?mww0eKCLcCF8bZawYZSoTLfoW4YTd4E09JXaMWrmrfdou2G6m15hAK1i7aYE?=
 =?us-ascii?Q?0jb1PTnO63HtfiMItnHnwBg5sJYZF86Jbvlt8oH0dZxiHw1JGVeW3ieiwZkn?=
 =?us-ascii?Q?IKKt8WqvbYB3oiRUI/LaUmZ4/jiX8L5GbiWfWOthvIc0qXiH1KXbojSBsQRX?=
 =?us-ascii?Q?N2AELXURWm3WHKQ6+00K8di5PBn3VZkOnk6R+YxDHLlNA56PW5c7V2Nr52r/?=
 =?us-ascii?Q?0twq/Iz5PQcZYf3WqxiRucACWbA8ovItRfhtYhAYW6yTcL2CbVWsRgsn3Olu?=
 =?us-ascii?Q?2BP9ADvxileRfAoJ3457V38=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8614b636-ec65-426d-9761-08dd56057c0f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:51.3876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3/5fvBORkMhvlL+gM6F+GdhFJXGdCWVJ51qlsSUf9P+GKcZw3qL+Kd8cQ9rHixMKA19fwXz6+OvKGuQkzTKOpvwnBJ0uTWSoLgLv0/W22MaY/UYo27jG2lBJa5ZTySK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt274.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index bd61a257d7b5..92ff78aa536b 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -706,12 +706,12 @@ static int rt274_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct rt274_priv *rt274 = snd_soc_component_get_drvdata(component);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		snd_soc_component_update_bits(component,
 			RT274_I2S_CTRL1, RT274_I2S_MODE_MASK, RT274_I2S_MODE_M);
 		rt274->master = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		snd_soc_component_update_bits(component,
 			RT274_I2S_CTRL1, RT274_I2S_MODE_MASK, RT274_I2S_MODE_S);
 		rt274->master = false;
-- 
2.43.0

