Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ED6309DA1
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415752; cv=fail; b=IoSOXPqZ+COZQi/VjrH/yMtSmS2uQkQbht2GVdmTpCsEUq4srYdcAFvUSA4xs1gn/NUnTLg+U3lfLVKL4tvNpdXYv4pjP56wZGz9Wdz2nADsaaqMgmcupsI88KBACN+gAeEQq3MQE+4LxEGCrSLm8E5ioj3lokUqu0ls6qvy4RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415752; c=relaxed/simple;
	bh=ryz6UCsVEZSQxlyKWrk85l8Xtjqq8yU/Lf4m+jaJvV8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Xv12JP55Z/jDD1hb15HuPcwabQ6m7PPNNKgxdCfEhG/RvydRh5JGjmOtLoSNfXpw909QTqjWGEtT920QTSovxjN9H/O8bxpLk6VTLxgKYWUYqLk1TuqNONHw8Jr9+rj5UwHe+aoYj6DhNFCDdoFNjppQVlte5J57nykcgbSiJKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gqrhDurm; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gqrhDurm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/M9SvunqGO/cDx37FdSCLePJpRXgvYMphypy9YwHOi7YuXOFmOorsdpZd5dGZK4r/R0u4I/631IaC69X2IJXDleYmD83W0YHpGR1BdBGFT1Snt/bJCycInV+cbnz5MPF80kSG46defivuuNf6o7u5KSZ5lyAJnFk/eAYgL53eSeLIRltNuaXeCZfmB5pq1Tq+matYfq4iOVYIgtvSBZ/xDO/atcTXJASdYG4ap6cqOxL+aeqteoRj8TrkpSuqcN219fdxj8rcqO2vy7q2Swb8cs5vVRxMBMV6NsejNJm0YfIQqfS0Gv0e+DERgK6JLgVcgpBChqXRDY07ba/iyq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vy3qgT/lLzz89ejK7O10NFqfn2blD5r5IUDm7YiTnQ=;
 b=PvsTYV/jbuA+hMCh5pT4rMR4X/kcy+cRZO6AMb+3CRan1S787zhSpUFv/ZPJgOeTOiFTjDVh+/GK3zO+GZFHaApiFBVW5SAAC1/Qblt6Chxl3CzrEOFaMlHO52CKmta8vm7g9aRI3AXWmUULu7TB3/oY37L1R1lwRmjP03iUOcEgovP2cpjLTD8vCEK7JpZ/XolD5ZrA6zVicZjGrO+Pj3nMf7PYbTAGycDgBBbpRWSSi0lrRjVUjtIWjfiM7VfD9J44NBs8kOo/3t1JcvfpOY/zqiPh5IKKXhNVXIsVsFau355G2rI6PeMMMdO8NUMMHuEaZVzC08+LfAYZ7Th5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vy3qgT/lLzz89ejK7O10NFqfn2blD5r5IUDm7YiTnQ=;
 b=gqrhDurm/Dtlb1eNMNPl6VCz9L2P4DO/aLojDPlGrevd+tmVeg8cjBy8n9gF8KattTNX8vDm1aG2t/ev8/1AXwqEZQiSvUYPAjRGhutuotWeQ5pyit47zr/WBWNetTw4SPfAUsAOJlQFULEWlbQ/FGymUzjcBUbZeRDIFtnh3S0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:29 +0000
Message-ID: <87y0peqfi2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 048/139] ASoC: codecs: max98090: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:29 +0000
X-ClientProxiedBy: TYCP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: e6882883-e8a2-4d48-7e34-08de0ad949c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uej7CWTaqXMX4HUWgMsCLrGqixQ8eTp2VeOS00xO3ekkuDEoD205cd8RokEf?=
 =?us-ascii?Q?HxxypiSeFHDIwn8L4ew81ND5ss6saorSmseb76HUmq99R8wBQqBE8iTkz3Dy?=
 =?us-ascii?Q?dMJcMP5B4uz/6H53z6FSqgRkw5i5yOwqNzgjuCEpI4ohlgnZ4zPYM+JKwFb2?=
 =?us-ascii?Q?Z/jfVKdRVk1vEGqVNV0elkVNvksCmk1X+odiHYmAhB2oX77gVUB5Lsk5a1IJ?=
 =?us-ascii?Q?lHEtFE9ZJENXVnAV8mcP00LD4+1Efik62+pY+wdaRYuYF3ZtAVJ1uEwbKv8v?=
 =?us-ascii?Q?PFjlCAA6pTQ2BGBjz547RHYKKnMxmlhsEy7ySOfIVyNVjVZDhbxB7YkBcmuZ?=
 =?us-ascii?Q?ZN0FcZ1CNLs0jM95uInXys2CYjFuqyzVgUTxD72QJR93yMSyK7CrR3FRlI+w?=
 =?us-ascii?Q?/41JzbB8t7ARLYLA7NGdlo/7QQOiVOtOAUZ1zvjjIt0tsD15pFunBGZ1peLO?=
 =?us-ascii?Q?ZS43lThq18JTed3jFb9YleQuMot4yVJR/faKr1BPgwSav/S5xH5k4Wljsyrc?=
 =?us-ascii?Q?ysBWv2UsfeRcJwhJdwf7sW9UebBUWJFQYfZB+wyEcGI+wgEOk+npI3ZkzuLC?=
 =?us-ascii?Q?+iRKt0k2MT1xXra5zTyUlKu6xhTyV6W2J8VHeY24lWcIMpIah+yruFkdVhEc?=
 =?us-ascii?Q?On95XO4viYbeN7wTd0tM7T/oBJLFz21CE+Oz+TjykyTyVG1XAL1MozvyB9YU?=
 =?us-ascii?Q?znjt31m9Y98uByxLRsvHDhjWcaJF/Z5k9Bn74zwUW7EtD/rkAV9hVur+pP9o?=
 =?us-ascii?Q?0Pl6/00o5xh6a7V9jejcd3wuR7M6UOxwu8vy4oUMrZ0ld+0IPXw5RV6YkoDj?=
 =?us-ascii?Q?pa/uZBe55QZtz9BWQxN46BNtPxs9lEXm3S4+l80wRA0n1ion9xzJg6aR4ki7?=
 =?us-ascii?Q?mzhjiTfVwnWPnua5enBFBtRAWLo1usZHrUp4wJG4fWYbu93xY0GrjR6/5Rin?=
 =?us-ascii?Q?wYL9/fBbhFiS/nwTeD3YLXF1xGFeEWN0V8v5DZlYowjtQhepPZSIUF5mKr1s?=
 =?us-ascii?Q?GSzlaKIE30KsAHw6/qfXAsxXTNbkH2Z2DMOcJrYdn7flyNaTsOgjVsl3I+De?=
 =?us-ascii?Q?Igk8kuHsVIQweVsFvCqSNVVXdQ0Slfxb70UbVD68ncZckuNAjZYX9M898tTb?=
 =?us-ascii?Q?+hooGZAIn4ktz+MeO9EaX6QqdW6shXHtQOTHUsRWWY9h9Vlo6ycZpGXTtj3b?=
 =?us-ascii?Q?IHp8lCQvfL2bRerrVKx1B1Y0fIof5jl1hjFjsrmJnVZ4ndZjPCiwFUVisU7T?=
 =?us-ascii?Q?IVSsMJmUcfpyThDUIgbHWFKdFBvnFCrNC2ZjwUtk8B8l/JvSNJiQvyBdHnn+?=
 =?us-ascii?Q?dLkzRkEZvTRmCAXXxxZJcBsmUc1HRyg20WZhaMfifLFn6DL8w+JhiFKxmniK?=
 =?us-ascii?Q?tbiOuvQjKfzC7rDimNdKzM38YgeOD1TB9B+SXT+nlUa2NmFUW92iKg4TWup5?=
 =?us-ascii?Q?uIjRZj5zE0MBDDr9oEKJKVCQXUo40fLlU4AMdnqTMckhGXefw2OTRn9MI+rt?=
 =?us-ascii?Q?IHjOf3AqD2ncns3UV/D/PLmSSNRpduAzwyok?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dYSd4lFQvjqeReNsjtjsw0HqOJgQ9CNg+MC2ssU7I/YBn1I8sh60DnAq3ghp?=
 =?us-ascii?Q?AWMJJfKmTbkSDWFByF9UwF9bGYIqM4US4tF4W/77qx5ZofzFRa3ZOdB8/1L3?=
 =?us-ascii?Q?DDDTkiqb2q40I244AOXJtL/AENd+zSPGxoSBZgOVjRwLFdVUjxPGnwMp2eUD?=
 =?us-ascii?Q?/fOihXXagADjWpgKtJcq2iTToNzmf2Ww+2ZEEnkdKLfh4Gg8q4xc7b2TciHv?=
 =?us-ascii?Q?hRvlNTjxhlIsZ+Bge8X3y3+9ECawQogSaQR8ueDAJiw5Axfke+0FFkh20SS5?=
 =?us-ascii?Q?DDWlYLGqAyuSW2tv7PKK3GbGT++i+tYTP6FHdDoFPLeSZdx2RxWUmv6SgPKb?=
 =?us-ascii?Q?U2T9QsfBy/eh722o+ECYPACmpntRKOYDRS3GSbJE9yYMWav1g1BZeC66d69u?=
 =?us-ascii?Q?1oUYM0pIN1Vi7TcgA94tvA9TcgAYtg4Fi+BYgSE0tI5G6/eEvuWQ/lzjX6pR?=
 =?us-ascii?Q?L6tEQcXRbc+Hx4Dp03WGcQrv2ySuERXHmb4VNJKcVHok44xIHyB4yOXYwUIP?=
 =?us-ascii?Q?OooHfjWkP1BIhIUafACUG99RCNMU4UJJjO1HfeY87JvSMgx2PApP5pYMfVfr?=
 =?us-ascii?Q?Mc0QvS+zvR4F/TJQBmP3L/HFJN4Rv1/uFKy4XtzAKw6RfUz4+MjVV60CFxks?=
 =?us-ascii?Q?CMcFlr41omK74m52mCvCSo7ypmooVjLanMfgTr2TjrmhnfrWY2QPSOhfcfwO?=
 =?us-ascii?Q?pFaKC9OXMxn9LRdZ7GhdkRB4k06AADQu/M0k8vAjgpeOv7FF0ueO23D+1Qi5?=
 =?us-ascii?Q?mruV1PoL2dx33UEQgfG68Xgy+HLoBDJabRL5QL5cUZjRXEvI1Pn4lsUcx+yr?=
 =?us-ascii?Q?d//8YJ33j1k8tCCP0MMFAkxw6krXx+sL9Zt+d/BEAmuKh5u5higCxKb0+1pp?=
 =?us-ascii?Q?zpVnRxnyBrue0iT8b1rXU15W/s5NyGAQ0GJe17kzrqEtvqNZWKMredaiqfNI?=
 =?us-ascii?Q?VfJpGrF3tNDFm8TkxS1tXpg0ed9C1ukaGcHnve+SDbq4b/hcNSRKxsqHpyXL?=
 =?us-ascii?Q?im2PPz8NohTOErEs0EuQMf4W5WI1EUT9BvFkSMVB4pxjHhVEJqmTS/SHXIUc?=
 =?us-ascii?Q?Y1EM57A0o3/YcV/6T9UR7CoXngXvzlmJYlQyHABC0pgXgSVCx+1Mw1IZE0Hi?=
 =?us-ascii?Q?1cHnWlaFB/bFiatqReXAoN+Yw02N2R7SYSEdr9yANMoN3viQoGTYLAYm4WDm?=
 =?us-ascii?Q?jdynpPKxq3ggSJXLepRZQ/ggka8Sv6x1wXxNTB6Jk6Ps0SWbV8Ldey/cTHQv?=
 =?us-ascii?Q?q01z5qBZrKGiBt+4DfNANBD6N8q2gd/xxx/ID+/EG6CinoNYppB7yggSvJhb?=
 =?us-ascii?Q?UQPgrhCxrp2dhCwQncBRkszTW+/cZiOIZi4M/k0zb84pu09fvAlcG/Ak2fCm?=
 =?us-ascii?Q?i6RoooFtZR5NqBuiIME8CE2VxaYg/EByzIpT5rbqNPIspCpdSeObGpd5izgF?=
 =?us-ascii?Q?PI4TuX93azo1JCteKWi+BIazZqe57ii3a4CmF8o5orK3IyrpOshgiArpr5gC?=
 =?us-ascii?Q?f/jM0BF/H2EAtPdFWxV9tKFzt470PfiaINo0iGiMTMCiY7XGp1gj+NeV0Tpv?=
 =?us-ascii?Q?uqEWKDg7sjtskvA3DIfjU94LJAspKAEYAMGMLaf2V/U7mlnstcbZne6kGPHc?=
 =?us-ascii?Q?qItL5psgLTCWK869FvXhPGE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6882883-e8a2-4d48-7e34-08de0ad949c4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:29.6446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htWSDQ2C2I8gFUuzfJRUx0+8zE8fWzP5AfL/9JTs+FNGdMcItiwvCX0tojI309and5zYbUoS3uu1W0yhF9CY2I3leKRoJyzdsSDmjuafmW90dKZTvBc8C/pmp+d5wmlO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max98090.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 22177c1ce1602..ff6b8190af565 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -347,7 +347,7 @@ static const DECLARE_TLV_DB_RANGE(max98090_rcv_lout_tlv,
 static int max98090_get_enab_tlv(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -387,7 +387,7 @@ static int max98090_get_enab_tlv(struct snd_kcontrol *kcontrol,
 static int max98090_put_enab_tlv(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-- 
2.43.0

