Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8E619994F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533959; cv=fail; b=XOkNJecPp1OEa1tl2IsR+072gChbAmZkV5dpQigIEXBwN4lfP1Tftujwc1z07zy8c7x62XecTeE+IHWHDkvPlUxafG7xoV7KJDdhaHzkXJBiwixGAkSio2kzxQB2iP+piFwNjoNG6nyzdJ1szPjIWYnWgyZL2jFLE74ytK9DFio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533959; c=relaxed/simple;
	bh=Z8i9ZFk4yYyiMXCz8f71QxXRsSz9HQ4H+PgmpXQ/Dc8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HGMFh7wt60113fyvW3Sv6AZqCeBxzk6Eq0O/2UuAe3Rk6NXnFsAgeZDbUauUIcueGMs6240SgcSvTw2Xx9kHapzE/XMLafs6uI2o12Y7p9FuEhkdL4od52Atd80kK6dxXJ4ZkKqkjXffiu/7fgzHFQg0+8FLfFlB5Y9vR4NcptM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oJqI/osY; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oJqI/osY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cf0vlbEDqMqHDn36LH/dlpDmXGizQKWenOqjza6m4XX30TbreWwbX5+nUvoDywJg3NnGwEV6vd74P+xWLVmIWBQhOeba7z057rX5+9DpCJuBcOvn7d0fRaLtgEcTxLfSbfv4KzZsMcP4UVnbZFyHeC/Dw4HUlt/XWw5JtC6wf6XGTU805s10pti4yNg6If43Hlpm6uOk1/jNLyv7Ao8LTotH8h9U3BgrVk43R6LuwOwUKojowJ0kB5YJI9/C1lFcll6fqLfvUDQZF7QxALFdmbABkyd+0QUw3KvEhMvQHOQktjzSigU1cYQlv0XTiw74FY80inRrzykUJO5icp5ymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19cEmzYo3X5x7prHpKPy3MX0F2e27vw26NnKsLg2F84=;
 b=GocuOTcssm6BEDaVxny5xwbYp5Hegt/pELxu/ZA6cN7dRUJEyqLAu83r8yJ2GcPtXdiCs47v8A1dxLJHTnrWpYrbt4A00CUq39otTQf/0/qv1b3a2BZvHOWo78F4/65sCzPgUcdQP/nzpGf0lEoMC1ZC+GCSp7H985j/D2u1j3ZXtGt6oGVkYEtZ8ptnNgAJs0Ab4bmfZgEI//gJ+lNwr41IZ5sklSrIRwIOcty0MXat221HpPRLz4UcD0DFCAz6h6eIlvydpdg5Yx4eJKv3oQdwneRSeNxlVtgRyE73ShjRltFewPk0G+1CW2SCo1lIuVsjErjxqC8WC2LkQ1+ujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19cEmzYo3X5x7prHpKPy3MX0F2e27vw26NnKsLg2F84=;
 b=oJqI/osYqINU8htz9VKLbZq7hamY6qA+y4dujvpV9L0TTgcelXu0W1EysrE0mkLuWdaGrFBMhbbnbSs2diM9i1LmeUI4MxOWGA8IpdqV+J26zc3U6yiaTMjrM+bxTSwxwxnV/pFf4olbmaLsdSA23Z6VLko0u1NY7SSJfkUQOFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:16 +0000
Message-ID: <87jz9d8oxo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 147/157] ASoC: mediatek: mt8186-mt6366: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:15 +0000
X-ClientProxiedBy: TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6e36aa-e842-4bc2-8b14-08dd56066150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dfT+c4x/2x07P+l+iiqBCfHHVXY3WH7JLFabY8LCBGysl+8VbydMgj8FWit4?=
 =?us-ascii?Q?IOfq8pKvJsrKoygiBXvGKpVIMXZqs3uZPvWd8vCoFAt4o2/wSRFODU8w6Dr+?=
 =?us-ascii?Q?xE7RrNbUJWmpJ9db3JiLvpn7oO1N2yCn1hD0+N6DfV9lQhLznbcKc6soyziB?=
 =?us-ascii?Q?S8YUt1u3HdjAQ9KuHNuFn1bU83M+0MmFufvpafnneSoX3kJOTfdzkcoak7+1?=
 =?us-ascii?Q?3hiRNRiHElOAEx/ne6O7ZALHnyTKlp3vNMlXxalbBtl6bk/x1nmsewlivUvz?=
 =?us-ascii?Q?WbDxOuZI4dqYEFujT3+qXhIfq5dDu3dHgnTzT+EmgVwsCmw0lmk4JNWwWQAl?=
 =?us-ascii?Q?VQpB6zp1UGJddz1h2ge0fHj35bErBkwf65Xn9219pJGE3uZLM/uBhhrVVkqo?=
 =?us-ascii?Q?vuPO3fzgL1C2KOV6F/uqtLwktVVNW0nRuDBAee2/dr+RvBMCOZhOukTcZkVP?=
 =?us-ascii?Q?OkWyOROGaUTkHx2dmgCziUIjMOxSPm0AT3vT/Ueeo8ySYTKuFPcHUndy5Kij?=
 =?us-ascii?Q?jT6pIpKYOQgrUt0U7iN/hgaO7+Adj90wwj3mRLTnYDmF3aflaR6tcp1cWcsV?=
 =?us-ascii?Q?ocmJT6blnDDVcZc+OVdrR2UpekIsZs/YpfJI8+1GSukgTxy9XIa36USXfseQ?=
 =?us-ascii?Q?yImfJjlyJlDABJSJoyn4gDt0aDv/+ZOfTXCBvZJ3am2VoTvpZlmRBVW5MxL1?=
 =?us-ascii?Q?p1T0AAIG+AYF3jlMoeh9ntQqKDYkE7OJmTsrC8ke32kyXbOy0izohlZ02ylw?=
 =?us-ascii?Q?oyZpypFneBEvr6Ilhbg5xHRZik7nrmSpxAFJcGKbyKIlIj4DymKc5/ebUQw6?=
 =?us-ascii?Q?ie+jJzKxLCvWbOLq9z6d3Ao7j87gG6++8AVNo1DzLdogjbVpEzy9uUm+lvYh?=
 =?us-ascii?Q?zMe9P0GSf3CsYCnJesCFQGQpun+kuPWfZqs26pzW7S4Yg9voF2ROfxjJdrkL?=
 =?us-ascii?Q?UCAktTyj6lWmYB1l+5NOhyhyS1/RTtdNTKqxsZ8EKrWcaHmOnp4k+Fp0QUJq?=
 =?us-ascii?Q?Ly4dieR+0TUtI5GnLNd9QYBtJ7SXoRF0/11LQvmd/YZ68lkpMQpfssjUYUgI?=
 =?us-ascii?Q?zup6bkXjmw4Z8ZRP1Qg06z2LvQvcsHPdW0Kpp/xHllv6pCa4qiFEn9zualQ2?=
 =?us-ascii?Q?yCbG5iHvw4k3qspzP3/NKotu5xYiBiDtDqC1bSWpDuv7hiL5nBlYvEf69GHO?=
 =?us-ascii?Q?/ri+cQ2Lej7XHOhbVhILp5Xl6zdx3dnkCEnWlVW2Ha1gG3Gf+qUFEXLp/u4w?=
 =?us-ascii?Q?uBMDGyudlQpde9dJOXeVsoufsfWFuxOeAsqALgA/h2Dp5b2n9AvdFyZ9O4Vy?=
 =?us-ascii?Q?k6lMeQ3OupaZ2sEnofDE28dY7UQn1Gt/NZp7fuUQp2lJ8apeUuX2fM/qFLv2?=
 =?us-ascii?Q?QV+SYeiBP62klOzujP7GKUc+fSbZq7Xd4aAm1VcmvHCahWWuDgKDOBoPdG9S?=
 =?us-ascii?Q?f0K1NtZmz3ES/Y+tCygCgIeTq4aO52zo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vPPvrngjCGHWkh9ZVL+mgualcZvLqt+72yhxFEUI45finWLh40AbFQfM4ZaV?=
 =?us-ascii?Q?KHZYQEoi+qmKvN3Ewj14XjSKS7Jz0pjkNdxuZ+erFwDK+BJCsDcn2X0vg0ql?=
 =?us-ascii?Q?XeuKPykvTkNJNViIwmdjIOo+ZXaMEwa+Wc67yZan1kK7hF3kpap9xvFKn4fS?=
 =?us-ascii?Q?/7ZypTQkHA2lwLa7Ld3uSfjlf6FI221QS2zrhOPytAQCc5WOWPLy8KLKuIph?=
 =?us-ascii?Q?O4M9D9ZVhTRVNmNaJhHaql+esiKDmLXEcyHAJggoNzI5GtJgdqob7f28KZPU?=
 =?us-ascii?Q?l+mp7U2UJ1IMZVqvadCqoNciXPLVT2Wz6eRCn1+XZKQboVeWwJzyjKxayNGF?=
 =?us-ascii?Q?Yrq4FtI5r3pp0aTRGNC3UjpZNDXfkb5CY0tOK6menurm+xH7CEwf2mL3uIcq?=
 =?us-ascii?Q?HmE6Buo7GmwEHQ//J0hYanfm9e5VefNaLoGSnSVt3b5iKpR0E0npVETUOFqr?=
 =?us-ascii?Q?a9nevyVjnbcjnPLB3yJ/q9+jcPWhrXjMAxNH4PQCxz6u4U7t7NcAvu5V0CzF?=
 =?us-ascii?Q?v1dyDoBGTEzZpB1tqsWdGzYzw7plHKZBZsgebRZYVynFVLY3FNNBVxxqc0Ow?=
 =?us-ascii?Q?WK+GwYcgD6QeUNg61SxS1hkxMtxzzzFKlCXhoEbgGzeN1HLfm27hpQGBKoQV?=
 =?us-ascii?Q?rOqsJ/za5eYHEABRBiVZ0elkhvC+k95SyeVDQvjJZ0jc7K7fLbaIEOx/lAuG?=
 =?us-ascii?Q?dbur1yf6cIqY9kcUEr5ACBLUzC4HARQX3M7sN5c4nYe6kkB70gvI4WQzeOJb?=
 =?us-ascii?Q?rnYXwNBSO1fLSqHwhY1DcpQuBfIBd1YoTBVNIS1g20EIPR7B3w2kxkBRRkjC?=
 =?us-ascii?Q?LgN36ArZ0A6T8xwNKPAer6fSd9hSpjjGFR3ykNy9Lle27w9nQ1VNyUzGpzJk?=
 =?us-ascii?Q?uargnHVh93JaRET7NN9oA7W6oh/XU4U64d8ZGp/xVH8HhBR/6+s00LQPxDqD?=
 =?us-ascii?Q?t91MWT4PuUAbttoyImW2nrbFHstJmgIMGv1FTO1Mltkz9mjnZ1CiGuoOFESM?=
 =?us-ascii?Q?DPQ7OL0F+19JXXafBFRl5YQD1TmW9L+BX2z6pr8afxuqneP/uCAvMSsCtJys?=
 =?us-ascii?Q?RdC1LLwlQhTN0LUoPbFGJVW2CObwFNyAwxlJqaVWG/bOEdrRAs8HYutoFCio?=
 =?us-ascii?Q?EHtqKAkuusF591/5kYgKXJD3QgdSbew+5DuDGHgzP3CYPT4OgSvy46o62I1I?=
 =?us-ascii?Q?yEssFweAbs5h4vOUP+9eAO3MzerzuHVBuVr30Kae0Nq3Bs4dwZMOkLH9RR+m?=
 =?us-ascii?Q?tbcEPiRF1fIB/IJnMMkWhr/Sgr8fBTksrXG5n0NunqwTOTQQLTy5ykHf7qGh?=
 =?us-ascii?Q?OC+qX6QIbHDHKVhFx50erpXBvns/Uf5kYDR2AkvnC0AO/NbAfOflCKoMyeQp?=
 =?us-ascii?Q?Yf3ZO26Bm75iLreu79OZ91rpIIWzaFY86MsQVAGYnfwVtKurKsbG55cyW8k4?=
 =?us-ascii?Q?fAheyd+Sppl58Hm1+G7pXQ4R0YXjJM70WSX3eiHUua2pTeusz4hyIUP6kNO1?=
 =?us-ascii?Q?W/xFvKenVqYJCaxBlNDfSJY7sSiRBBg6B0ENLcrD4QRStYItxLldDUBThWmC?=
 =?us-ascii?Q?P6wL0PGTomg2hRWj4YT/4QEPUIJSer+qYaYTDaZgf0yyd5RIjmbcuPuqrFpU?=
 =?us-ascii?Q?W2lojfHeaEPK/1+v4s+JKGo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6e36aa-e842-4bc2-8b14-08dd56066150
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:16.0356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yu/pWMscHXWftq/I4+wzfwfbp9kSEE6zB/st3+n+WgkWn0ledtfjOEOWyZ8vynI+YforhfIYtZ3JDaXkK9slLLaxuQGASWXuWnczWi34WcO895YdEusDTvh2jALHslVK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8186/mt8186-mt6366.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index a5ef913743d4..43546012cf61 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -875,7 +875,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_IB_IF |
-			   SND_SOC_DAIFMT_CBM_CFM,
+			   SND_SOC_DAIFMT_CBP_CFP,
 		.playback_only = 1,
 		.ignore_suspend = 1,
 		.init = mt8186_mt6366_rt1019_rt5682s_hdmi_init,
-- 
2.43.0

