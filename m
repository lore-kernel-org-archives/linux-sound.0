Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69119995E
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533905; cv=fail; b=Vd2ThknZ3oizucImnSfSGJX30IGyV3yb+mC/4JmBX/ReHCjUgGUxSnQvxmoF650rbL0lZnQPcJA3pWBZg07igShDfA39SN2eUN6VgfIIs8sBnH1lXUOQuME8aO2bcgXpRCbQUpfvZUAZe0lbbdggohCTuazKrJ9K9vE9Doua/bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533905; c=relaxed/simple;
	bh=5AKV4XM04uDz1Uz1qiTlEfpqjSxFXUY2U84R17nT/xo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bFbfOcWfsH7Ratbyj+BtEXCMw0TeERjQuX/KnSXHvqXiw2ojUGo4zNLVqBHZP/A0fI/MwHrzmZIR1maW0AgLeRbFwyoYCCZv5mR0GLKZdzlA6kcmM2s6P9TUd3Y2XpDwvzhAt6DIKXVgN63U5lqZZMM8XVVkS1XXN8AOJ/khCmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fN7EzGvX; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fN7EzGvX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOxt+N/T0EmGmOzSJkrj6qiTmFbU/GzBJp94wtKEWtRwfB8nJw+HbKZqQFjDXnDTDM8h13hMH4+lICyRkTYNv0eIYzaV7PvnfwxzzCcZFyyh1Gy2Mty2KD5xS2jd4CvnSvSbW6f631LxU4kilLjZ9rLfsFH+zKN6vaAYtopLG60FVUaoOxFHqccs0gy4Va355gSmmmK9JiQH0kFmUae7pEJ2gwCmaGkiAeRlfizHlskW/hlGX7w29btQNTjPfyBXKH7IQQm9EBbuFyc92M4EAEuEezrLtocU4kXm+LNalElIBm3fcPsKUyQGomrXaTJsNpKx7hx5t+S/crHlF27CXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUXwBoqD+skDUct71wEaT/eQ7Rz0HD28WgCD02K+VUg=;
 b=xAiVL7NKHnYo2JCB5fznR60JyhZtr+Zhq5p5h9w0w5cvrEPbGJ5xQFAGKuV1MYT9JKCG8fl7F00AX1NOtxo1uepbCfFCEwrnuIPmQsw3Je9K9GWpRaFOvyKv2HDdUdBDxnNVTPg+c6OoJt3Y9gyf6BJzKEgeeeVQw8A9SauJh06gEywZsM147bkfxAfWpSdl958/lXKvzLuxYoLIC98yjwE4OMXfDTP7zWeMyNfC+AZOlD6y2PVCAgX20rZJqi3dQAk/BOsRriUH6NTVKlLSvlTyuD9PuzQJ3UQq6lLuCp48l8Wk4Uu6pup+zjKs2gWo6Ge3OAXKp60mxaLcwBsbEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUXwBoqD+skDUct71wEaT/eQ7Rz0HD28WgCD02K+VUg=;
 b=fN7EzGvXMTBozAxnJYxVMK2sNVhxPl51y9fnnyVvGwWB0XM3Y/uoERzJ+F24xZzJknD74B6u755kIDzk1k+a4rrHB6ZGZsvHNLdXnsd4jW775f2W8CQT1adYnleutLmgYLCI9WbphTKBXRwOLQ3NskpaGCgtpTXqOvmtpp8IVuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:21 +0000
Message-ID: <874j0ha3jn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 133/157] ASoC: samsung: smdk_wm8994: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:21 +0000
X-ClientProxiedBy: TYCP286CA0235.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 6954659c-487b-4b78-20f5-08dd560640bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mgbb3XRMdPY4dBvVod+WWvp/c54VymKT8s885zgc2DgoZKRKhWo9iuhFwP68?=
 =?us-ascii?Q?vEGKEkEXfdbbnk6YY6sBhKex3dUg0DbLbznj1Pzjs7pBFNa9br/3w7vcDdf8?=
 =?us-ascii?Q?UMffoFLpt3LX9t0LD1oDwkliWPdy3rYoQcDX3CxEZVQSUM+5gmK0ZjDY9cX+?=
 =?us-ascii?Q?gdiTR0BB6f9g9Fm+B9d2pwfkqpnjU8UeteA8XxfsSvebiJ6hC+C0v4YJpB/+?=
 =?us-ascii?Q?PTkv4bKeIk/bf+dcXSDJtMcfNWTPW4Q67KxFXP5PxIcNvGgrEjKwPZoFIxAT?=
 =?us-ascii?Q?pQgvpquYl/t/4pOe/8GRsI3RngiR5P5pgtRaqwt8G6v271ApfTX9sCH+7oqg?=
 =?us-ascii?Q?IsSwJjkXFrt0GENQjdurZpwCc+sNgF/+FFRZS4GPMXburGVrOZY2q5RO7eyw?=
 =?us-ascii?Q?XqL+LnWEPwKlbHrtoADqXC1KbbcpZbqznKw3IkDI/Ili6++4YVAG4TimR0CB?=
 =?us-ascii?Q?uC6QrK65RxWtaIR1MkRdzJzy/Nb78FKV1iWjE2qdlsuZEoemFToPRzVnJGap?=
 =?us-ascii?Q?Nl6DzHjfXOAg9Ial/p1ZxGCaD48LMU3ibRA0aGKATmZA0gSBC//Jyp+x3LAn?=
 =?us-ascii?Q?/1k4RSHMFFNHnmpw6zj7oJN3Al1JBCU6NHy4q1q1Oxh/HFpMjPXMCr4C76vP?=
 =?us-ascii?Q?OiIyVUpDyMpvEkGzRiX3xgB/6xL73xfKcO4V9npmYD2r/kJ3qx9kVUlG/zan?=
 =?us-ascii?Q?tqA8gybmpKUbUnBCqLw1N2VMgCr8DsX9tr4DcdOGaDuwhx9CEW6WhfmYD57Q?=
 =?us-ascii?Q?sAcR7dN8Kud5xWPPNthTpteWq6gWPLuez0P3KSKxGT5Qmu4eGWtH5pf8lgzM?=
 =?us-ascii?Q?RYsM+EqxRXYeFZyMQKmyzZisnDUm3f81FW8hkLbPfXbljrCfIhGP7JlU6yZY?=
 =?us-ascii?Q?71LoBzerfYpRrKuAKz6uGt1Kg4yRnBMYMHJfl126bbeDSTC54djagA3W2jFa?=
 =?us-ascii?Q?IazrTOOsgwlFuMHwt6ZBwWlztD/oVHRQcaCfF+oTvYiPlKbAX7viEgtcairU?=
 =?us-ascii?Q?hdsbh+6BtIbkHHhm2D/bCAfKwiA9OvkpdB53N8tjQBLkh7h0VQKNCUjc+f7s?=
 =?us-ascii?Q?Q3OTdM/2pNEdSSmmjZIkraoJKB2ToBJ+9+5NH2jv1g81Z27yb9WYhrSzdwFW?=
 =?us-ascii?Q?iAqZmd4fbkyTs5cK7PogZ08lOzeAQvNYJ57nYiOTBi1ygybb9Tm+cfxEqhtY?=
 =?us-ascii?Q?hRy/z0zp9Ahk2SaPSrgTGL0AWcQ5xUNkvLDwZ6GvwVXFDU2wnU368D7uFD2n?=
 =?us-ascii?Q?iCGr9EOTsPDCofSMOQ9nSSIc75rEkakvJHG/BABqZO95FlRaF5FG9fQev4hQ?=
 =?us-ascii?Q?zl2ropeQ/yP6k5Eq85UtvM7CUqL5v6I+yEHK1CoXayznAw4waI6WQhnj9G/y?=
 =?us-ascii?Q?E0Hkc/6lMAdiLZK/MiigYZBfgWdG4FMYh9fQm9suQ2BXYz8C2r4vuYE0sOg0?=
 =?us-ascii?Q?orzFdT3vDXhg8cV5XRLdAurXLwUzrk7h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zFd/JM8rj3HBYC6+H2Y9X/xwoYJ/onfmanUIELGg65Q2hlj5o2u09I/mFnu+?=
 =?us-ascii?Q?SCNjjfnbHVWDF6PzNzWEimjNn0T7PkBqU/qEaDKH7P47sMlfg7z3JN8djBwV?=
 =?us-ascii?Q?Rgu1gEdzIJRliWe7q9J1s0BcPvbE4MGSHD1+AOZyPqjiX1vXi7PvTnuKKx7m?=
 =?us-ascii?Q?yxxMVKDI/854xWE5d5GTKyE2XZ2aszLxuB06QiYYs2hxVV8t3Tir0wUF3cMM?=
 =?us-ascii?Q?l1WCgcjmOGq77y5dUavPO7BaWTshUgy7x23g7v9mO3FMRDx7O/T+U1DU1uu5?=
 =?us-ascii?Q?r5gJa1q2BG0Gt7+Y6oLH77WCh0QoSbt9lGQjqQGrAF133aL9AJj9Y8z9Klj7?=
 =?us-ascii?Q?/z+niGV6z4TslcyqPjh3Kxb/E5P5RaPKsHGjyqS/hkfkatJU3lzcI+YzpTal?=
 =?us-ascii?Q?6OnU6osBK2u4xogZaRSmDSr1HP1oeBEdyDuVV+CC2etBgTOvzjahOGI+qqYS?=
 =?us-ascii?Q?g2LMi1HBeJr61ob0J7j7fyv+NE1AATMQnuVY7fZuRGoX1q+4DYzx89E1wwb9?=
 =?us-ascii?Q?/FigVTdnIeDucE4RcoHM6g+TYR5O1sNShLG4yiqnfNNwQjZVzXxIw4LjQ2TX?=
 =?us-ascii?Q?o4hErSPEjRqY2c4c6Y0wFFUJujLaGcui0tY9QVSVZhiOYP3udWDARqUZO3Rq?=
 =?us-ascii?Q?5lMqtL+4Kw0RwXSlDQ1I8QCxevubhB3gKv9bIXueAyVXtF3hVkeZR2IVOkH8?=
 =?us-ascii?Q?gTLlcyZZOtBvuF34avQ603LoHHyAHeHuB12wjZ7CqaBHpJl24p/28chOCeMy?=
 =?us-ascii?Q?7GPiDAsO7DZmO7ODQLZkMZvFP6DUCn6oMFi+o/B6hCnL/GcOWSKLtsuNF0oP?=
 =?us-ascii?Q?BuJ8NrPONkAeJF9EeMZcaJKwxn2hHJvcTV8Og/nNKMSTHYzC3BPTJgYvQb1o?=
 =?us-ascii?Q?YtYJKTdPcu9ojMwSYrfoO4P3Mv8TNL9+bNivL0dhtIeAkxt/ToPmRYl/mtk7?=
 =?us-ascii?Q?Xi6is3tyxmRpO1MR37BZ/MJR0N96ky8bhq87OuYxa4J2oJ5IQLbv9f+BS9Ia?=
 =?us-ascii?Q?wsdc4DcGX8JgdhEMBcUMTW6prD5HCGOusFcgwg0njxWsCQ1y/sLNRAKAuJBo?=
 =?us-ascii?Q?Hbk3UNbKq4In4XstTHj3vjGtzg2bhvYAwjLOxwKkWguBLzuKbtFNleLQUxRH?=
 =?us-ascii?Q?WLzhs7D4WRARSgSah20Dzh+qi6qZV9JM02uIGrR/nPXClvITTOjVMdFaBR9a?=
 =?us-ascii?Q?nTV+FKRUofg/7EmJXZ/1zHmyWsJlE0pepsHEjgfiHHi8frZw32cP1p6+oDyL?=
 =?us-ascii?Q?WrRhby2I6Y9rKgjlpD/0sL3bG3pM495yW3shQutqQtTkV1Y1S+TS65q9uXkQ?=
 =?us-ascii?Q?KkGV4e7lr0xOWGUmZguCMo77XqV9PAf5yx2iXb3nqUAyUMxca3wS91Bp2raj?=
 =?us-ascii?Q?LOk2zX6yLN9AFpUJnsIMrzDLWVZP4aGG7LEYzO1ITI+a71vsQpjOaDdGNgQd?=
 =?us-ascii?Q?ip4VX5bRNI+ydWpppaIFWC5CZXjvvwM+cLD8kcD/ijFeuU1eQIKS2ysuUrmk?=
 =?us-ascii?Q?4Wzjn0zXcoOZV4IsxmM4AuCkyCPZX7OgKfMdLGgLMw6bdP7PCZwbC6Kqn42n?=
 =?us-ascii?Q?g6MoxQFiYV4TJiFptKbcDw4IXxOHozGWzO9mQb0cNqsAidaZ6wYYT1AIinZb?=
 =?us-ascii?Q?NvVxvSZFyCrNq6CLnW+J6FU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6954659c-487b-4b78-20f5-08dd560640bd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:21.4009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ukwWuGZmBWkyxqDISFNjFa6G+EYUcGfZFVOy3bXw95QYpGjCyamhnjzbSTzXwiDyA5b0+gVph60t/wkVOp3VmPGsWUiCKiSWTrkxvTO1VRHvS7dy3R7XCwsax7K3Z2d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/smdk_wm8994.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index def92cc09f9c..acb29cd785a9 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -106,14 +106,14 @@ static struct snd_soc_dai_link smdk_dai[] = {
 		.stream_name = "Pri_Dai",
 		.init = smdk_wm8994_init_paiftx,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBM_CFM,
+			SND_SOC_DAIFMT_CBP_CFP,
 		.ops = &smdk_ops,
 		SND_SOC_DAILINK_REG(aif1),
 	}, { /* Sec_Fifo Playback i/f */
 		.name = "Sec_FIFO TX",
 		.stream_name = "Sec_Dai",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBM_CFM,
+			SND_SOC_DAIFMT_CBP_CFP,
 		.ops = &smdk_ops,
 		SND_SOC_DAILINK_REG(fifo_tx),
 	},
-- 
2.43.0

