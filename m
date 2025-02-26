Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C782B19CD19
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533991; cv=fail; b=oDuMwkWVrgkM3BV08lB+CHdTpsVCz3TlClXizTNcmfHM6LGPI3OzDzXNukYTcjXto2SKN6IoUJH+MMyW4eAB1BT6LHIKObJ07VxGCAP/Nx9lqMPNl2NFITTTLVnB5RXYOeyKSx6RXvk+sig04q8P8MVyzAhDP5ACxGBAbdcn9P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533991; c=relaxed/simple;
	bh=GNvRmxq6x3Rk/yB2/0tzLQfdrkkZJWkutWe2b8sCMxI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bvG+N4oVhR3VSXKMIDnf6vkrn3LsixUR5hnP7BiX3xNEzahr17C9jFqcpD1GCB3aBPOH9LCAdVgWlQP9dwn7SvVhH8dDXi3VCMPOBWIIHLWwrsTPgYbC4J5zd3TCRHbkDogDtJi0bwGBRRuuuwQbMemTzS7npkbBMa0hgt+PUjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f/liGuQZ; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f/liGuQZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3LfF7SYe6GNxlD9NS21ePFcAL+XfCGGpMJZvoJ6LQRdA0RPQzhnKQJY6KLs1NHqJgoT3N+of899yhOGj/yz5INPVcTmsJzc7NVSFgfKSe2FODm5sO1NCb8KJrG6yfXcVSO3uBIy6k1wpUBtDyno0l828cKS83tdwm4P4FtRcJA/vtWoNoEUCiwX3wvlEhfUt/mGU71Fxvxz9Yn8hC3F8wChMWHA3dsBvD2nOkI2XN79PKxU3u0N9HPPwxDLJTOACLBJzlSQUOcbgFfgtXrhOzHPajkxUxHxm0BLAX5TFbKdwlooqSLbTczU9gSzfWaKGtdHlTHhJKKWrJ+yYQmHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3N7M3biA/9HYASZx0/zrOw068EorP2rfNgdhinu/5v8=;
 b=MZp3LHtEApdhP34zG2us9TfuEQQEzAaDYQjgEEhhhjh4x7J7+dqueFo4gDyKmGEm1O3wKOM4e8vXL2d8LPOHlxFBRYm/t5zdf+rqUjvjkpiyFsiJXkQnSyA0hhBYUIgC9/lltEBheUOmCDBdeenwL6Y8dc2mDyCEs+kIHd1S5Qaoa/hJ3Fqp1lPV/nKlVXaSVUtwd3AJBF8Pp2hOcVEYcWTXZ5xPQaniljnbqdi4PQ20DavEq39RCNQY9cjWCDvma4CdtA5oj+GvhYdzyPpLwX5qgrcU6Iv3WDdXpNTtPNIkfumnXIMmXRRADjLOEhHbZUUJDH68myRnvzwdRY6hNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3N7M3biA/9HYASZx0/zrOw068EorP2rfNgdhinu/5v8=;
 b=f/liGuQZjFDlrgtav0s5lfxQ+E1LSNq4+czcJrNNEgctEZIn/7BvmETH3r9Os4P9lgtcgWntZzsnNA8oRvufYlOxUB7s/PFnvpaO9BzsHQn/xwVSsW97y+atdL8BtYAXR8aW6lYnd4GagEbyXMKQrjnGeCBTWMnbXZNO9cnHUqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:47 +0000
Message-ID: <877c5d8ows.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 156/157] ASoC: rockchip: rockchip_rt5645: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:47 +0000
X-ClientProxiedBy: TYCPR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:405:2::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 459b3518-2268-4a61-b6c4-08dd5606744b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IM7jda745gQYcm/8Uczlun37Pm45LALApsYKM/2Zux4hrwxXBZ2OTmy4+u4c?=
 =?us-ascii?Q?HjhjNa84VxER6tQB21KoK27NfDNoJjgSw7lDTpJQCMhzwLfFYKzI/RA1Mscm?=
 =?us-ascii?Q?yu6dqWSNBhmIZ266VYD02Hb4eFR6O9uEbL7MmnGhn/yb6Za+o0fn9wvaTHtN?=
 =?us-ascii?Q?B+L1Pl97m31BzisLm62OXZ+IBwGuf3aIAlowVjqp+5a9ZsiVhZM3OqeL/l+e?=
 =?us-ascii?Q?XarEvOs4r09RyJnuYUp27KL33hKRrEiN8wzYfqtrogKIpPSPU1eEgvzk0Mqz?=
 =?us-ascii?Q?NZtsBp76g9YT8mqvaoXbAV7Nd4Mj/vuRu4U5Ws1ftF87+fUg4ysTp+PHZHGU?=
 =?us-ascii?Q?sKtCA9QoEqNYK/0LsHbQF3hefd3XDNlM95U9x9KRZORa7hed7YdT+X6UKzUd?=
 =?us-ascii?Q?ai3Jq3snJh7QoMnKosjEeadbd7xhFV1mcvm8aAnFHJAwI2DIO59oT3eKPKXB?=
 =?us-ascii?Q?1CH5hpmdrtF0norKeSkbz8OfcVIJRILI1Ml5yGBCF4w+nkLsmBOtMyzEuvl0?=
 =?us-ascii?Q?cgH/X4e2nf+269vETJdehLepSOr1yLuuEHAaocR25YqeGui36DGtOxYwycux?=
 =?us-ascii?Q?dBpRo05kniSm6yBFoRgaHTJtH4B/ccPecLNn61nYmeZYKLEsODLjrr91uxxe?=
 =?us-ascii?Q?/JNkwPy3OvMpRn2CJttVqsyTlekhWI/VrHCJ5rkzTUeT2VBiePJb1cWxeMWB?=
 =?us-ascii?Q?50bkcnqKIFy7LBqIcxz1XurY2q8RD5NdJveCHTcJfR0CFZYn/exESIg/muPj?=
 =?us-ascii?Q?9P2WZ8MkPQbzRbzz1yD+7C3306h9OvGIKoszioGgy+3eFLVNAl8UjI2YmtvU?=
 =?us-ascii?Q?GotjpH1mxPGAXAJUskWr1cawUiX//e5N5XmWOX8ohIgEWK/OGF7ucfhV7KjV?=
 =?us-ascii?Q?q6+xN7eqrkathtnkOi46Nwx0V7yR/PqccIjUZ4liKJzO5wwmQE0UfGw6Z36C?=
 =?us-ascii?Q?nH8If9HTuUPGQxto8hnhDKlvvPbKReVnKZ2MOLZeyCFJDRtTZEpH/k7wyzT5?=
 =?us-ascii?Q?D83JFO7mov3tzsoVfSanIdT1JvOVrnaXvhPFc2sHGT4D1kRvFpZqsp8D73CJ?=
 =?us-ascii?Q?TIxJ+mOoL3mrkjyxg8rr79hphK38/YYirLAqOosWusKCjeNGAyWdUqt6R9Gp?=
 =?us-ascii?Q?ixwOGOogwY6yTgrtFq34LCwkKHi1jytUc8iDA8EOJpj6gnSYRDSRhqegxT+6?=
 =?us-ascii?Q?/ojJSAefqo952IpKudSp67ZENX1s3xYMwTnMXgoKq46Sw+U0zaqUjdpbwoxx?=
 =?us-ascii?Q?xA44Yyod+SJmSn3FOevwCsepsUyTcZMNeWo3Y8p3WY55ujmw1Bhjs46ZDddz?=
 =?us-ascii?Q?7+cN1zarNnuMjnqhqidprBOjJYdUP5UqhukOeCgKrxsjVF54ywNq0LuTIQvs?=
 =?us-ascii?Q?0Sg3ZeFfER/dtbqKXTMaMw76MwUG1QAuUUTt1d3GUIpz9V3Npe0SSJ5JMNNs?=
 =?us-ascii?Q?dvwDEpM86XxJMWH0TETOH91EZVKnu3xA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yhiG96CNvkblciaZHFxssXoDB8TZjjhC60x9CQ2rIuGS7R2a9fZm86RLUrEm?=
 =?us-ascii?Q?EFkhv3T6GLt3PWrCGjCF/xiO/o9LPfI6DbINtjflzE8aLm4rOPyzVvJ2V2Lu?=
 =?us-ascii?Q?J8WT6oOGX4M404SgXjDCAzAHNtC1pzpYg+VAQv87Kas+VRayTc6j/+oNiw5T?=
 =?us-ascii?Q?3eXZ+s8d3zBvu0u+GmFPj8Kl3rS3WnibgcXWe5M/nhvZV3hsrMV88y04Efg+?=
 =?us-ascii?Q?D5o8q1mO4oYjbCRafex2I+BFRgLRd5Rxvomhco58T1Mh8DkCuRp1gaAJH7yJ?=
 =?us-ascii?Q?rFCdzKN0E2R9ZkVcGQxu0a1DwQ2frExvC5EDhXbAUfxL0gOZW7gZvPj6pXG4?=
 =?us-ascii?Q?A1DYTfZrsh/WMlY7o3khZhZ7Z+U2JZCGmQqZIc7JdDN1BtJ3YDI9wDLIE9Fd?=
 =?us-ascii?Q?2HAystVrGCZDB8nVGWWEKpZOAwJDHozxwl56QGTyCdOCEXfYyBNrkQVbhnjB?=
 =?us-ascii?Q?JUqg6SvohT9oTHg7KbgMcNfpA+UlrA/ITxfqNmImRPN56SxebINJEoV5yTtQ?=
 =?us-ascii?Q?RK9Vn5ViIz5aJQFNA+5QcHEYnGr6pjgrWJa9oc4oUlHCaruCTjmBHZpqoReA?=
 =?us-ascii?Q?9RoDz+3F0P7f4zr63AOgL3HVE2ROyth+i0kRZuM8KJmC6EO26XKlAnvRsWiO?=
 =?us-ascii?Q?lN5OZvBj+75xzzaeXoZ4n2ssnFaZGqdfTxfOgnDIQo06s+OXWfIlrCFFXN6r?=
 =?us-ascii?Q?8l2Htx44jzLOhvh9ce+NaOEgP30/AX9XxzlCtD18s5luh1T3dqnNQWFGKVUq?=
 =?us-ascii?Q?hQWqvwsYKAKYkeR3Wo3tFGKj9AlRqn+P4aRY5acmFr8oG6+xJAAV1xsnplXR?=
 =?us-ascii?Q?Li1TZVpD1EMiIpxcji90ftLtX/jUa5dLF0DXD1LNILeI7/aXSRJwFKC/lIg2?=
 =?us-ascii?Q?zZiywoCpIn9r5wUf5TlWD7lh6o7emUur5LDCW41HlNgLLpXAkvel4tMcd2Nr?=
 =?us-ascii?Q?LtBDD4doyHMtSlbiSC4862fH7NEpe/ijok8C8T1cv8w/JxdbzdzpeZwwiI53?=
 =?us-ascii?Q?0VmdVVdhGSQPpJor8sUOfR6X1n/5UR2R7cHtx26/b8U2H0m2yfmy180Pv/WE?=
 =?us-ascii?Q?2Feh3I2keeEwTvkZ20UjKzNTl5affw2HAubQZLCGAoH5N/gBf74EpaxzGmT0?=
 =?us-ascii?Q?cYvCCHlqL11OhooBIpPeeQu90u4tjQ6rOaEdWYAPHJkqFmEAXmIUnDiqqjtz?=
 =?us-ascii?Q?IRWrK7qWVHPRonoOHBVsFqXUoIy2nEQbH6Jj6f5YAlXh/R3t5cyGiBYUt7st?=
 =?us-ascii?Q?s9VvYbaP6f+HlPcwi+xATry0F2hWu76bwTtLaGAhTuI6YqqScOewWW8jERyg?=
 =?us-ascii?Q?HdZ2Zo7+WXR1CgrcuTSF0+uYCtydw19rNasfwyI7VjxJizprKq5IUNodtNTf?=
 =?us-ascii?Q?2khtWrryYeVEAna5TDGAO1eedDdLctr6VazzthTERJR238FHsACU+mO5GSiU?=
 =?us-ascii?Q?zod0V6AqEIK1Tr7k6A1GC8nHcnn/g/6YjzlQ0li3viiJeUjjwMsEUpEELWWX?=
 =?us-ascii?Q?s7xXYWORTI/LotwmyLlXb8BOsjaB1NrnTM2fvUfMGtVtRt2bpnjHlFD+6QpW?=
 =?us-ascii?Q?voKAhW0xUW9euAPux5erad9+go9bwlt2mP4ksOYvZ/jr15VecXWo7dVRmg4G?=
 =?us-ascii?Q?hih1vurPgJ886M0jrYRKEeU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459b3518-2268-4a61-b6c4-08dd5606744b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:47.8528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MX3Lgga0N8l3wrXlkHT8jz7YoDJUWy4JchTsKVaOkYKvS5NaFd9ULqeMsIm5pteSuLUUFWPeSybF9TiY4zRf+3/s7Vs+LrGk1Dscdhbqbu7euYnro6b4hW6gRFz6Wmq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/rockchip/rockchip_rt5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index b085d80ea2e4..590b64b362f6 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -145,7 +145,7 @@ static struct snd_soc_dai_link rk_dailink = {
 	.ops = &rk_aif1_ops,
 	/* set rt5645 as slave */
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		SND_SOC_DAIFMT_CBS_CFS,
+		SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(pcm),
 };
 
-- 
2.43.0

