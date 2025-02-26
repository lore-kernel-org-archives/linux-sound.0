Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D8618FC8C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533658; cv=fail; b=T8dTdmkXGoF75BLLdGTzTiUlagh9CpDmiZ/IzD4FRL7rIPXVlTfxNwHEblIjLwVfPuLx0bwgBS3igg2sqRiVFYLNJ6YEXsk64QTf7h3Svv/bx3zPbtDNvoB5aRgRLdT3jAySFLxW0nIjjBxXVvrEpJO0r/mPEf6n7nUuM832p+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533658; c=relaxed/simple;
	bh=qbyeAf+45xBCL9Aar54H6o+i7mvOuqqxdpGpgv3UJx0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iq7KPqv99ow/wTsd8Uw5Cr5mX2XhTUsgj28gHlqxqLWTC36pJTx0e+szGku6iGay7J/1KT7/zCI7osI7Rw/qmO6nACeIc0cUl0xlLlz9GSbRSDjJ67UnRhV/sCmvdd4wNdu+nk0RPCLIeaUuF9zh9SF3IyCTtlKK2+vSsQlhxP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b+9lwFSO; arc=fail smtp.client-ip=40.107.74.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b+9lwFSO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVLj90vayIYF7arvLpEoGct12/8yb/GG5khoN1sFdlWX3/620BY1g8kKqrQ4hTX0hdt95etQb0P17bWklcymOiTbX+nyGssdNfQuZcdNHCEICqVgSz9r6hsmDq+/BpMzmlDyOauZaKik+BaCcdFNeds+IOpDTyFfstcHJbtggd/YA/ZKCghF2qa8TAdlxZwWjDfSbbPoHIDDtOuzUSlhdRaY+rbgqh+2zq9Nmf6BXpAiZqfEX2nszKCsM/KUQwrlsOBrtQDpjerFDidZAu3udmkvhtMeciGjqvD2jvQYgyhP0bUPLW4m8zw2QfyKP/24CEWJmv1B9sDx1OsC2n0/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTuTsrxt18OxRP+F18EX5vb9YOQgZ9/kKfn7bdVRFhU=;
 b=bO1xC4VdC5+DLZSclIQfSZXA+wQcwE49p06FNu5KevvjCnn0BZNbQ3ayg+a0HKHUMLAynpljanN9QofeUrb8y9+HJQBWyp8VNFD7zI04OCNRs2JFL8qfy2E1S5+OgSxhjoFcxDccESb8T0X9gj+aFOj03Ddtn6onGKsRsFxYJtyKBIHrEKLg7m+JEx+iDqJqucwmRbXqTiGCgyfbmbqXUIE1uK/0QBJ/Co8q4kbCqPbwTcKmTjlpaOS4d9T/Ugha14DZz2mujZKfjIauYD4VXqhAR49+jxNdfP+CDFMhmT2m/9OHMo40FY1zNSe1UlIbpKiOvpLlcobf6Z4zv0BVDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTuTsrxt18OxRP+F18EX5vb9YOQgZ9/kKfn7bdVRFhU=;
 b=b+9lwFSOfTIgqE5MuwZav7y4xwJIwyN5AyD5UCncz0xqwXo+pmwlOeNXds9x8+tPlohCOP4D7K7SwDnQa1kXk7h8GwcDjZz3hlbWqU2LE+kCQJKyVZse0jrOwSJDrKV2ILGVQJX8iaki0/+vrThYR76HYSmDqYHYK04VzinQe/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:34:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:14 +0000
Message-ID: <87tt8hcwvd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 065/157] ASoC: codec: wm2200: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:14 +0000
X-ClientProxiedBy: TYCPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e8409c-f58e-4519-3846-08dd5605ad92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O0OcjJylcTgKzwvJ70ZDxwFMcnXLLZ6c0hFK36j1n/d33+KHTYI5mZEPFWEk?=
 =?us-ascii?Q?cGRV2ErDTcfpsQcCezqoBlDuLSEWNYHOFvWy0H7MiLYZl18UkXdWyWvkUTB+?=
 =?us-ascii?Q?oOgyo8APfy2MHJJTnDQzOy+OayOUHSptEx1EXpph/pcC0fxuyfu49F0Ppf4R?=
 =?us-ascii?Q?jMFKPjxDMh5iVtKBR9HSMxyvqMfIU9s8cgcSPy4qqdilwLF6pe+cmu8i8Y6t?=
 =?us-ascii?Q?r7NK8JQWZIEqoJbPF4Sgojyt1KDFA+Xa0wrp5cpIBz4Tf0WvV5AJNnnyklPa?=
 =?us-ascii?Q?JSo9UTJcOjxW5X8kPVjS7ROjohmTw4GJvp0m/+xG8tciuG0PhBX5JdY633KH?=
 =?us-ascii?Q?PD9R9Nbf/0AhQqSBA8RsU8fxTo/H3Sa6oWeGeXhzj4IGkyQNeN9tCYsgKVNP?=
 =?us-ascii?Q?uQNiOe2ufe+iFMZdFbq5zZMc0v6WRsmgbg5A2USQtOfm3FB5djrRMXV1Ne2v?=
 =?us-ascii?Q?18tc80F1SqmBLp5IS4vHwpJUxdZUzg0c4IeUD6Uv05m9rKSvws3MIdR4kHSR?=
 =?us-ascii?Q?/hBhHVATy5Yyl5aX8MZ+idtkgtmir9ctEuKU/+oLZrr40rgqZAdVXFH1NbEH?=
 =?us-ascii?Q?9kRve73FOm5yhWBOmsY46n4ICvNMdnOgq46bX1N3bciFbhy9UF331SkKgyCI?=
 =?us-ascii?Q?bmZzCmS59V90BCUua/1r15DmlTr+qE2jdFAcY0tWO5HNXL1Q4lYXhqE4TuNb?=
 =?us-ascii?Q?j26YBAwQ+NgaqWlteUTTxTAZFLNPUtGaTqTf7k0DXEQNC2CWUwGwC7PaHGW+?=
 =?us-ascii?Q?ZwxdeJ6HlCt8adOuwwTWsxvvZvbya3L+0C5kQ4T0hhAOqfkCfJl4CyiDQ0b1?=
 =?us-ascii?Q?MV8ABpNzBAUoV2vGCq+9M5qefHhHfBo2KV9royuv+mEn+oXi32/IpMRCqMH0?=
 =?us-ascii?Q?MAYjlxubMLWoLakaDhQldO7rnUOKbHxiDUW92FEznoUQiP7tyzzIQUrmDKDH?=
 =?us-ascii?Q?EyN/lsvZt9r3mhDdr3cB3fy9W2SYy3z3nygP34UvwK+dq/04KUrMEPVjliCn?=
 =?us-ascii?Q?DZXuA974onL1DHM8osRTQC9DPiDNqFpm7XinVSIZGTsOZLXXBRq/48YthBBR?=
 =?us-ascii?Q?7eUGT4vFfB0PBjGPL+7XxsTmmizgO4RTyY1p09Ukn6FwbBKoTC3woG0vZrio?=
 =?us-ascii?Q?0xnC1iegUpvqQtmhp9oxCpQficj7Siim/ZquUuocdN3vAlnM2bt2FW9X3tMK?=
 =?us-ascii?Q?qLfS+QvE1CcHX5mOBv4LLf9vNx/D6ZbBsIcUdvR5R/sXXfvlEkCpdU1dCinR?=
 =?us-ascii?Q?gAgf6zXToKdQsgFVL9Sa4rqDdygqX7k73wQSesIYTaDyGTlZdovidCCeYAdg?=
 =?us-ascii?Q?CEuQOQVZCnvrbhPHHuoe10lYG8+544G4mwz9NRp95dxW6py30zHR9Dopb7ct?=
 =?us-ascii?Q?sWE5ZemJN3vxHra1YtlfMrVw1PhBdt58MnqamnD0733e6s2mGe6euGeGUFpI?=
 =?us-ascii?Q?M3VnIMw9FwiPA8vwBMt18yCdiVUzNlph?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vk8cyjQtP4nAAsV4RjCN32W6JMq7Os9KDGTrY6qZXRB7VsCrzcYDODg/GkGp?=
 =?us-ascii?Q?rlWHnvqwHXrIllzlqwhevQXkDDaZnXshDQrFM0C3WwsPSRBkuVTZXDB2UIfk?=
 =?us-ascii?Q?8d5QEHzj098sXaFXOaJUUEhkfYTitPWGO/QTjwpjqBFx/zhaO0iTdDtvbKfu?=
 =?us-ascii?Q?Jmty+VPxQQ0uiGRmCkqaUfCdHuL7aTF9gOXu6pG4rU+zLqk0TT6jqB5V8ZK9?=
 =?us-ascii?Q?n9lO/TaM1qs2Lw1Xzo+x6DFowtStzExdc+er+GFNW2f7TuOBKRLV/1aGYCCj?=
 =?us-ascii?Q?GE/HB/ml50dsMm8tnl7MbSXY5DTJrq6tdblEyfca8cKAYbt0bSB761+3z0KX?=
 =?us-ascii?Q?lcP8Vx0Z2XLeQmHHVanIh9BhCvOwmrFG9JjfxMnIFk4GKRPkIMM/CA4y6pNt?=
 =?us-ascii?Q?2GvBVT+tT8TyvtYbKVnlORs3tbYIchyNKhBJTILPhXX8FzmSZ+W6TIX+eq27?=
 =?us-ascii?Q?Ws8eiQiZ9gkF0HsIoLHZmpK5csBE1BGzFUeDTiMU1S9Ea8wxYPtp0fQDfUnP?=
 =?us-ascii?Q?TIrbdXP7+qjqB4DEA0fkOAmByLvQfaGfYSFVHqtVMRRXLiWRglQHc3+OXFLJ?=
 =?us-ascii?Q?IZITNeZHPzDyjxB6duktwznqbWbEo3pVt3fvhD+d6canYboCa4y7sJOC2kWV?=
 =?us-ascii?Q?Lf7m7ElkgljPuW4nOAHPaZmqpmqDRxa4ImVgFADAXAk8/3XClQcSMGuC9feS?=
 =?us-ascii?Q?DCkU9BZtMNP5e84y3lhpHLEeSpKt4Ov7TJ7ifvBWhLrDyUB6ffCHnuW1R+gX?=
 =?us-ascii?Q?3jJprPu+PbLvOWiS03eBuRuE4v5HjnJZzSIpSHpHqPtBOdeXWgX3wtEPM731?=
 =?us-ascii?Q?40BpkURhEK19gaeqQqeQyTHF6BRDd/kYzd6i0Sz44JSrc8KZqiwaW+S7+6zo?=
 =?us-ascii?Q?zsYgWP9H/vKstJbQrsEFg/SuY9lCFrx4/lBcOEqL/zuRUzuCD+P6mkaKPB1P?=
 =?us-ascii?Q?gqysC1mZv2BsMeDdi3DXusJM1gV/lsXG5X58P8pg4u5cSET8qcM4choki5Qq?=
 =?us-ascii?Q?ymkqDw2olpvBVv1kiQNkyGosri+8TDnhoeyL9SGKw07ZKATMOfJRiG2WSgrj?=
 =?us-ascii?Q?e2tOmQgMPPUavQ7IcSWuP30+O12HAbo9vOMwOYWlBnvmleOJXzn4A/yYc+R+?=
 =?us-ascii?Q?cR4quZpnZt6mPdX/Dpgc1ZYAIMcr/dNxX+nXAu/hk6WHEZDs3sV4wQ/Be3I1?=
 =?us-ascii?Q?ihsj/dmrnmiNorblQMm8Jm8IAj2vD4CnkTirszJWGAhXrwC/QfAd/QafdVvX?=
 =?us-ascii?Q?oElN7MauPK5MCHeXQsktKqFgx+vvclEeCoWjohF8phQIRYb3wlSWli2anAt4?=
 =?us-ascii?Q?WOG3TLBkE+7hXRSmwtwSUtr/2yg4PN8x7HTLOPWh+5qW7o4ffJSP5Ae54uwI?=
 =?us-ascii?Q?81Vlx+9zL6PCsAwzEeddfbeuBoSMT/okwX/1noSYu/1Zz7C16Aswj0JkwAUs?=
 =?us-ascii?Q?qr+SwJ+jQ2ipKknW3Zs79O+YNo8ha9x/V6ks66srsKvFX9FdMZVyOAloLSJ+?=
 =?us-ascii?Q?/4ZQ6P5aOCNsJ1fIpyfSRIC1lSD2efMZVSLbk1UsUcPZoYZZ/ccKg/s+pzYA?=
 =?us-ascii?Q?iY4LuVFOd+mLJwd3m3uQD/Lz6I2IxEfEBQxCn0S1d6HAbgnoskGTMYHq1nLi?=
 =?us-ascii?Q?oQ+8vOW36fCn/WV/cZs8R2g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e8409c-f58e-4519-3846-08dd5605ad92
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:14.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyYzyx5bhX4f/ev3mRJTQ3pWQgY+h4VbhdqN2+aPClT9nm+UaZ+mHWU4cPUOWECiwttxWZqKhHd0c6/gLFBPV4ryrZMH1NL8bDVjIcHQ1xENitfV2znb9tuA/7XznbVY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm2200.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index 841247173d98..7ed4ac5cce3c 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -1576,15 +1576,15 @@ static int wm2200_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		lrclk |= WM2200_AIF1TX_LRCLK_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		bclk |= WM2200_AIF1_BCLK_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		lrclk |= WM2200_AIF1TX_LRCLK_MSTR;
 		bclk |= WM2200_AIF1_BCLK_MSTR;
 		break;
-- 
2.43.0

