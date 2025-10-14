Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2496230AAB0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415926; cv=fail; b=LMZ8JmYBpCbsyZF9KnZbeS05eedc5DaOnkct/18jYiiGxTnbh+dF5Oy9IaX8loaiXJyAZjmarIxADHgNFwj68BzYYwdbyihiP9pfzDzTXK8cyisZu/wPATvno8GCgEyrkuRN3nRJ59RiZzbrffgSrbrGawvbrnAD6FF8PFA3TQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415926; c=relaxed/simple;
	bh=gKuea+8DOFpTwDqctuQGVCJMInMABxAhHPe/mf68pq8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RhcCNRGAQqFnHrCi1Y/o2Knxnofp+6PHjEMJN022jzrJoWx/6BbbVuwzz7QW3XfbNFxWnyP+M889bT1XPYuDyTdFsVd8wc02WenOb2Xw0YyoqUzIhtQMsxsYOwFEzUW2uW2JIbe0waEMAebsXdhKoKD9RE29W3UkPzbDhob3Nz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q6Zl7Wwj; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q6Zl7Wwj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k09gkBAyvpaJ3T4ZfZL0sY6NtM5IlsuqLCjOHF/fhE/KcZqDaFVIxSa04rSi0bD3J8xQo6sd3PSt/6n45zxQ9U6Js037z1VKvOyBSLTD5DnD04cFIpPM+95+jIiEB/DHqvO9JfDNgoh4fuH+k6Q6x2uAOdKsCsPuEdEYRfnKISxYW4n+PnOkYxcH0veM9OFFyLgjyY4546IS/5rx6lUa5V9iYFtL3hH+BmdIdwrWuLWdzXx2KlabvKurXS8LOfL/5CjergAHNWqJvvEq8jlb7xUHWMAvN7ju1hwKGedAwktzSH10aNvGjL2uQyRRmVsC9fOsggCO0o1whJbvcbQsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEfDZMNWyvnRDKBQWexZcV8cdEtRHt08b7S7ESTkYzM=;
 b=ym2ykKcG8pjQRsj46xrFqCM0SyXT9Q76qvV4mcTQfByz+KXwiyN5ICr5+9EFQSemJFdcKQG6qgBI/lfDctPolk/IXH/sgoxxpuKDo0Sh01m9R+slSuwiDr55NQkI3CSVkdQ2Xp5qF33QxYUELSxcxK/hWxMCFmRNSYF4K2Ox7xaBtmfTBZ90y1fiGmJeCeC46DzkKt28yluTa3QtFU6hyHVyPPgF/RXBC8rbxqhk9kcrX5P1uCcLwzC5J7wIKPOVJVxYpKy/+twexYvnRJivnznFAW0gLMlFwxZ2bhVx2uyMFleyctcoVLYHAsHNMlcdHSByOyNPTYmpWycKSjSOFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEfDZMNWyvnRDKBQWexZcV8cdEtRHt08b7S7ESTkYzM=;
 b=Q6Zl7Wwjlli9pDCDDDa3a0wlWd6rie9Wb1AVBiSooS1maNjwHvX7K4NPAqB3xdghxV8tDWAtYnAA5ffcALAscIytjDOe0qZOvzR46YYXEL/fTQPFPSGZSHPouZ2wtkgpAIYor7158In931TuL/D+CCw/WSydopIKF5r7ZFQ7Qxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:23 +0000
Message-ID: <874is2p0st.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 094/139] ASoC: codecs: uda1334: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:22 +0000
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 84250672-2d8a-4c27-2d1e-08de0ad9b121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?72qo6L7bQBbV1mZkvn/7meBNCxUAfuazAuk3wzYpJ4/LavJnBra3nGd9BLpk?=
 =?us-ascii?Q?6imeo64yDE5vFoS4QLDs/3YrZ6BpIijIRXVBf9TNluc4Ea76RU4KGL3t5zeI?=
 =?us-ascii?Q?uJAgd5br94xYExkTNu7rqx2jNOTVu2cndd/CCFiwdvZYNamDEiQEpm/aUGkc?=
 =?us-ascii?Q?W2MNPXxnrLoU8UjVJwoSh0xwhWRacwpdLkdTfECVG5oDq4pHDYow3OCPn1lb?=
 =?us-ascii?Q?H0bxR4/WPYripfYhBp8s1l/YHLIA4mHwgJZtPjMCibCDMKbNym9aGxWgMA9+?=
 =?us-ascii?Q?8mWOkPREzbBz7dNZx4M11kkLLejbIvPBvOC76gLdA4gWbdkwQbYWcDmy7ufI?=
 =?us-ascii?Q?m9G2UFeE4XBso6jMyw8Hfi0uXXVH5RzyxOV8ZqOWzX5eUR1BoeYvyM++emen?=
 =?us-ascii?Q?I2o2Hk2O1YpCsDOy/gHdWyYyXE1AjH12qh1IwaIyJQx3GD74wS19J7+SJP5J?=
 =?us-ascii?Q?U2A86jI1DNWBLwMNMPyvW345mPw7TXtFeqYszxACdDdUlge/ErQpk7OIHxEt?=
 =?us-ascii?Q?MamDaCNujnBt6rir1is9Fsm40sRfDNyLcG1ApLSHujRF0Xbh1+55B/HYHChx?=
 =?us-ascii?Q?nhhUtKpVjrn+PcUkTmT34pUoZVya4dgUBagbM9bm3skCaYMH1ykslqQwXXn5?=
 =?us-ascii?Q?K9BA7bMXH24OrPaodKTLMhJENfAMf5gA8z4Bgf/ao2+Z2dtKTisQX95V7kmR?=
 =?us-ascii?Q?1VZJVvQE8bOYAexlNpFRfZ/nGTyEVIJuBYNwM1GXrG9UJaHINM0/1zFm4VtJ?=
 =?us-ascii?Q?8wO8WtxU+mpNbHBCWOmKPRadaK05aWqrz3IG/5tqHKLezP71H55q5ebX6p7W?=
 =?us-ascii?Q?SyqeiAbgbzAfJBb1dLN3jrBA4JCj577odj7khRk7h/qzNowXI4B+3x+xRtNg?=
 =?us-ascii?Q?JOruBtypjQm/XhDHUD/KEH1rmp3tt/Qk6aUVfUOSRF17g0mR1DMi+lVMbmeA?=
 =?us-ascii?Q?DkUllexPmdkm6jpxsYLj5NMFh6yNfdFR2AzulYDFiMBoLy05I9dQddvfMnRW?=
 =?us-ascii?Q?mUL/ZuvApgY7ALGhVN8st+HXGuAgGIts8inY2Z/rtycOsDe2IM+uTm8Ds1Bd?=
 =?us-ascii?Q?m1nkqs9QiFQc5E1mhSV+5IizT8cH1eCCcGYcJ8+WiSA3E2I+a56lzlcvFln/?=
 =?us-ascii?Q?nuZJ6VRXDCf4z7AXWODMkyuuHHJksbVhhM0S09C3qfdwtnikDOJX0kyfB5Q6?=
 =?us-ascii?Q?bddO6TLUM6eqfl3R8e7XPxgX+Lie05ayrZ9BTNx5sdQvlbv53mlNFmkP9n1+?=
 =?us-ascii?Q?A0O+nisv6+PcfVW+hC8qyvFr8bxmDF5ilHXWua8xsygBFDpp5z6oE9vpHN41?=
 =?us-ascii?Q?AwxnZv7dHh8m5biB+aVJykfJxVYfrTJobKGvfJ1TPtkDQeIbw8brsbbqpv8G?=
 =?us-ascii?Q?iAUoRXLcNHKGMnYWzpMwtcW1zUpjXLVCIJj+djNENwgDArj1S1vexKlnVexR?=
 =?us-ascii?Q?lb2Uvl2QE4nNiqh8mmgL1R6AFxDf42fy7akuhxffY7U3d4KppwUvyT/ggCPs?=
 =?us-ascii?Q?Ql0soSrG/DW34tfXHgxkn66OtzSaLXRkfc2q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BvaVqekzCbr8vns4fF0SfiBFDq/plivtvE/zUV+DJqnrDIgqAxYErAd774TQ?=
 =?us-ascii?Q?YM5S7oFbOoDQ+Od8ANSA8wSuj0MjgN0HXakOkw5UboydorOZA2rNExSAiaW4?=
 =?us-ascii?Q?mPelMXWE+eyMmF8Ix2uSzMFmiut43ZHDS+3Q8fiid9WI5r2G0MRpH17NjUzW?=
 =?us-ascii?Q?aGu7jZVIYeWwGUAXyNYBHU9h2uHfVjthSeuJzFSAnfQvczOqO+onJ6bgw5VW?=
 =?us-ascii?Q?81/TDCxi3IPSOXNhmpWMKEJyIZwzgAjBLugCJmDZvV6Hn/moz3yCwSQC35RF?=
 =?us-ascii?Q?byJX/8r9IsXrs3Je0Kv/fdJntqtUUs/fGJvdlY/5lwPtw1MsUdS3+LsUMOZc?=
 =?us-ascii?Q?2W4UmRoOwzjuCf3wxuDwZDJlj0gryOoCxE0Ixi5QgWKPcS9b62jkbP8DCyo4?=
 =?us-ascii?Q?SP7P5O6UEibi0hiKWfJ58kbiZwj7k5Y27qdsdlg6aQq9mxgLHhRJ7ca1HwUF?=
 =?us-ascii?Q?aFmKBcyLivQVb5ypzG0SNHs5C5QQz5WW0WhzB2AYAEasbquX2ijXA9d2lMWb?=
 =?us-ascii?Q?plMeHxHRL1LyH8wDeQDhsHwYQ/wACYw+nUrBIwh1ZUwLeBo13gNpPi/DW7bp?=
 =?us-ascii?Q?XatYF9nNflJ+LLdrqeMQHkAnRAo/Oh9WJt5ND6tv0G5LRpokJXgPqb6dteRW?=
 =?us-ascii?Q?7DRDXo8X+n9raxaZ2241vSqw/V7ALfY9Ldr61RNMU1GZxftpLudjbviS6KR0?=
 =?us-ascii?Q?KAqc24uileB8PAPcbgf5eZOsaMd6l4pRV/rcZ/rsTDDH2UMdZjmvN/d6cojY?=
 =?us-ascii?Q?ZmrcCtAMrO8DHdDPdWfnqke4iaJgHQyelRNXyuxRCE4krBODqkCdi4iQO1KG?=
 =?us-ascii?Q?zYABh1kIfXlCYHCnS4jBdKyELiE97KICiI3VyuFYbSr5zNdWzsUBjegUys2q?=
 =?us-ascii?Q?qFIG88siY2BbrLTR3HA4lROpPuOLsUAHrTg+Fdiko2IrGxjFMr8rRSJZZfA/?=
 =?us-ascii?Q?8n/EB4y+jv58K0MWZILORcyDc+1u1Dp4F5F4ajegM7UbY2se7RQGRRboNTWD?=
 =?us-ascii?Q?g9svqkQQS8osMqoNvl3IgXSVUpGscTe/crWtm+kjwf5m3rQ6/+SsbTTSvpBx?=
 =?us-ascii?Q?KPapjo5PowJtNpTDvkLzZ7c7ZPukPfUuR/Jf6BCZF+SJONbvtnRQkG/wWMIv?=
 =?us-ascii?Q?E0dmzPOjnvh68Q/utSrqPSOwBH9QiyEnsfBsW8p1aHuI3DkeQzyQqHkVu9JV?=
 =?us-ascii?Q?kZ42HsLyl/tUGW5Z3inPvwdgIRolQvWzdBpsC6ypjc+yvf70DHx6qKjmgZ0B?=
 =?us-ascii?Q?8uWqMB62VyygyfpsRDLObJ+OVDablkVQyyDWeN1ORnpjm0ukvjqWKE0fOFMK?=
 =?us-ascii?Q?T0KQ3yirdFhpdgbmLcgMEZaIKw3GEeuZ1kt3DJaxxxsIWXbHIvj3oK56z+wP?=
 =?us-ascii?Q?/gXWmt9in91jk/QKGopXXJZjmLH0NhysDjgUlfxtBR4o+6ZN5nmUEUXA0a31?=
 =?us-ascii?Q?lpjKUy9f2XttMAzDDFkWJgUGWS9mhvjb1k348MaFkavMnOeutU0cO8nkVX2x?=
 =?us-ascii?Q?xqLqnuHDAIdUY34CvQ36dYV3PEemehCDcrxtHdIFhEh0TRvfr6b5O2BO6oca?=
 =?us-ascii?Q?bDRyk6KNczb3/hkqzjNbjxpfyO/DamleYxwQfLEU+1Ks2zauQIbZOjqx2NrR?=
 =?us-ascii?Q?uzwayi8jjXmUQ6RizQ0M13M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84250672-2d8a-4c27-2d1e-08de0ad9b121
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:23.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ddHtxzPfvOtIRK6PxnSxPfXwDA0riZQ5HsMC2bYrE4N0Moz4gE6oMXXiL/YMpaE8yoabTd7lkSRccvv/Ghm/46zUltcDZV7kPgKf3bdeF2VpQn/yn7k7xDHLRcBBJ5a
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
 sound/soc/codecs/uda1334.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/uda1334.c b/sound/soc/codecs/uda1334.c
index 296caad5d026a..f799772ff747d 100644
--- a/sound/soc/codecs/uda1334.c
+++ b/sound/soc/codecs/uda1334.c
@@ -42,7 +42,7 @@ static const struct snd_soc_dapm_route uda1334_dapm_routes[] = {
 static int uda1334_put_deemph(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct uda1334_priv *uda1334 = snd_soc_component_get_drvdata(component);
 	int deemph = ucontrol->value.integer.value[0];
 
@@ -57,7 +57,7 @@ static int uda1334_put_deemph(struct snd_kcontrol *kcontrol,
 static int uda1334_get_deemph(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct uda1334_priv *uda1334 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-- 
2.43.0

