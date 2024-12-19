Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D193E33DB
	for <linux-sound@vger.kernel.org>; Thu, 19 Dec 2024 00:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568536; cv=fail; b=KdTLlJwjnP3jbiWKv3NdYEBYeYZn3eA7Ik/doIbVDNoaOOZ0WUrjM/si7vErj52YRZJLZLLNp9D2k73reezjaGrtzcU/QxOF0/BGn0CXGBWuWP8kmgTRmLnrtR03uhhnKUjIgUs3I0pDtH6twd1wrSuCZS3fsts49fvoaUj1On8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568536; c=relaxed/simple;
	bh=LBn6g11xJEn5O8cjRKTJLdVA7WnEkS8ZBTd2AqBQgLs=;
	h=Message-ID:In-Reply-To:References:To:From:Subject:Content-Type:
	 Date:MIME-Version; b=RbsHky4hxqTRa1nkq7NJ9LmIqNzBSUT2drtZEqOV6xiR5TjJgwvD5DXxbdhU03Y0Ff5mj7W23VrMkHjgSYO4iihLMmdAUzIofp/eTdwsc2eDcchq+RonjSYoRvVXdrbA+dv33f5L9jPP751Wp5Q3rYaeZEmhH2Qpl24drZ+E+L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RaY8Mi9n; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RaY8Mi9n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmdySXPtAbT++C1N67IG77ela3KtN1xt4tSzJmNs1/35b9uHFno0M0xtpV1xyGVjI4J9XkWuhNTaKpVJTTV4B9a9GA6qMSnePQ0+QwKqInf3dpKl8jqluakwKpNJ3Jce5X3+DysiJOdQBCVBNYsHRBEzeMY5BCsve+RbzqPQoW7zHs7H1LExPvR/0eVvYRP0JM1EVPqTLmtAZ/mw3fXr1OTegPh7XEBBywmJymrV96HupokCqzdk+Q0+3sINrx0uJtdAG4cOsSLCLsF+nrAIUJlEHMpOrSiW4le7NPzJYqsxeNq3YG4PqTdUYXXD09VUfIkHFp4CA2/CE9sHXbkaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUQQ+4ZbkQkz4KAmBKMiDOPMK/+30sxXNCa8D+sYDDg=;
 b=Le+I+SaB91spDoxFI1r+mKeuYG7lW7Hzh3V33cdLc2O8L02oThrRxncbNP7DihMtO8QxlArknLMC43HtD61LmBX7ECQZpnScFmgU5VIxnQwl/y68lNWs4N9iweshKtABgm4lTZPmbhT0+Ya7c2muvBGisVLmCRcQABqM6GUfoeHm/q/Zs0E6MWb+7Av2XhcVGPhh+5zTS7MOFufzw5ImCwWUEbVxRBPinqly8FD/ve1X4yhcVpBXrh4PH8ukoWGTUQlXqegVTjKiU3eFiUBB0gp98GoFQohaNeyUHD1uecjMJE1T7+swer3iRmCUPcqqwpBfDsHiIOJXDFU5cDOSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUQQ+4ZbkQkz4KAmBKMiDOPMK/+30sxXNCa8D+sYDDg=;
 b=RaY8Mi9npQZFkya1Lq78EI7TyC8JNVJSwUJhujo0vzbsZoR7izrY1S2MSbHs00lkweBrksqBpflvBHa8q2iybahHk1tgBJX5wVJkNXXmHJfoFQrkzF/RyX36tIudPwJhsdf1yAQ3H9iOI7/9monhG0GAWr3MmHqdrCB9qsKQONs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB14144.jpnprd01.prod.outlook.com
 (2603:1096:405:221::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 00:35:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 00:35:33 +0000
Message-ID: <87ldwccxwr.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/6] ASoC: soc-core: return 0 if np was NULL on snd_soc_daifmt_parse_clock_provider_raw()
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Dec 2024 00:35:33 +0000
X-ClientProxiedBy: TYCP301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB14144:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c7bc75-7e43-4754-ba1c-08dd1fc50c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1MLUBEbgxH43h0Rw8y3WbxBjwBowERklYwwaDiwzqOgL66nOZsojmHQitP3D?=
 =?us-ascii?Q?1Pw8F/rgrsQ0nxxQF69swquvsc6F7i8awjXNrP+0144rZKv5eOcN1Z4qrQm4?=
 =?us-ascii?Q?DcNK4ikijGtDK5pS7QQKBtu2vHvoeW46KONTxFT4Tj+jxk7V1G8EIZ3T4+8U?=
 =?us-ascii?Q?p18N5bxmwGDoBXyxJhZSwuOIE47hWuT2+qewNXZ72NNA7ryvSLY4WtU8Ohy7?=
 =?us-ascii?Q?j1ctCZOQqwljApYvuDESsPal4DbrT3o1eBJBUdchcyqIAWVWF+pc2cQqsH6J?=
 =?us-ascii?Q?bku8ukeQDb0AGVAH7ba3VrAVK8pSJLq52jSRij755t/IrSXMZTI9yK6qXj94?=
 =?us-ascii?Q?b1p+L+bRGE3MHIM3VRspBAcNnjB29bFJNOsPW5dKhFxUkqrWCXUfPbRs1QWw?=
 =?us-ascii?Q?5u8SeOAtegEHrFpfnkG/pABpedpwgznSNqnfaBJ+T+L/rwoBfzgkI0HWmNKk?=
 =?us-ascii?Q?WmJWuS9aaIx07c0WuxB+rDT85vo9ZhoXDIEMRPVpee26dR0bsxznplMyOoUA?=
 =?us-ascii?Q?DeE4lxNen2VH1a7SXRyuyYZEjwbRiz533NakJDuxK58e/1Vxog1oh96C0QJU?=
 =?us-ascii?Q?+BRlsjECG+HRSaEj50fimVSPSHMYyq5NtY3rmG9ZwFyYMRP1boMj7aM1Gj2R?=
 =?us-ascii?Q?oImYwZIrEVVU0mW/xM5jbTu8knQnYTwKejEI9OvuAUFliLSXoj5sBlqqyQ57?=
 =?us-ascii?Q?wr8mP5Qn/vHwjbOkUOmPVDFeAuCHUconGj0wE9/1EhsizHDdAcScWp6l8Jlw?=
 =?us-ascii?Q?R8avqBCWytiJedW2pnZsGQrXbXQVHY/xj0xPdaxRMrBG94JgJtV46e+2yOe7?=
 =?us-ascii?Q?ESCyxKe5rBY3LejwZk9VzPbDgh5myJmARUDMG6gpDR0EFAmOxlGIBsbB8dhO?=
 =?us-ascii?Q?46y9Sq+EupUsZtKrOxtGd0UId/hskNDheGl69LNlNYD/Mii9wdHPrOpaxrks?=
 =?us-ascii?Q?FWhf6znnv9rA9r8wYglp94yWnSz6ann9/VEBh2X5GGznw0jBxlOuEI6finQK?=
 =?us-ascii?Q?S/p09fOsqcKcsLTBPU9MYrrjEZlxiQywloB3r8wN2fo4XkhYp/D65oG9nQWL?=
 =?us-ascii?Q?knZHnVBy+wmRupjhlM7W8Y+5sDNRDTIJkNYmPe+WMZSHCcH3fvXGiZPaaNgk?=
 =?us-ascii?Q?AolmhvLW+MpPyVDpg/DB+LDVOX0nbR8t6pp17ONVG2qBCG8GCf9qMtwzw1VP?=
 =?us-ascii?Q?n5oYz5dLbPdGdMvWuVeQhIclhjycfgmm7OcDVUsT9mCDMByRL/0+tbIOxBs1?=
 =?us-ascii?Q?+UbkvteN++nE7UBUpvJYxCKSwnJ7X43dFG9CvrL+Uf0Z2LeavoHFbg0XqkIH?=
 =?us-ascii?Q?HfyQr6mwF5DSSWZkib+/WM19tjUJ9iYNuzfOdUJKl92Htgdt3sJRFMtbHAcO?=
 =?us-ascii?Q?/Q/Qhkd3cS19lqHVYB36lQR2xBpwkeHwF5IZ8V68Dra5HX3FVOcU57Qy/TgZ?=
 =?us-ascii?Q?RVpfbmPJgSuQkHRQRwnyKk4FY10mGYkv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sHMz3yhKfL1W2FPD/WaWi1MFBQIYQxD9KB6ZqqmNLgyOYCk/CIBeL0em+t3z?=
 =?us-ascii?Q?L5uZo7YrBlTmrTsik159rUWu6J8TLWW5rKIwI8SpmDNKqUbOA/3lHl6/+N6O?=
 =?us-ascii?Q?xTTsUZUa6rkut9urao4sLtR1E4d2T4339AWNJHqftnm7j9ITVPf32F2e9Pgw?=
 =?us-ascii?Q?oCrWGtgrOFGrNqTPhQrdIxohTgrtSQUI9lQzYbjzjTVRBVE8mt8hG5J28olz?=
 =?us-ascii?Q?SVX0Gn7iBZQGjGK6tEnx9NP/Ew15Vxe3HLkqvFJWhyXxSYAWa9bE6hVhffd3?=
 =?us-ascii?Q?SKSAaVG0eQ74cQLaiFVpykieczd5mEzUujglklk7UNjZCHA4a8mrYZlzG5l+?=
 =?us-ascii?Q?EYmuppKDcKI0XozpLg9KlXdCpq/HhbTsUcyEZxi0PU4t7r1MLGyycA/GGPGG?=
 =?us-ascii?Q?sx9svE9Tqor4RBkuD2uQH65g6rS2lF0tuuBPg9mgim3eLHaGhT4YOlOkjAlw?=
 =?us-ascii?Q?XekAtEUQpDR16c8P30KsMAEP9/N7iP9wuR1kCo6b40iaLy064jBbQ/Yvw/w8?=
 =?us-ascii?Q?hRJoB0imzi5RTW04Sv+H8y4Q1tIeiMY7PsUbu/dJkd+H9j0kAa4/bUzMOKQZ?=
 =?us-ascii?Q?QnklvM4+odfVZ65EoiEkZWFhd1GWmtUbwdHsC1PFfS9RFWWvOtUtT09d2nA9?=
 =?us-ascii?Q?jdSHM1vDMVpYYH+InEHR4zr5dOxcTbBBqL9QmIcGvSc5Ms8RX4YLvXpI1E/9?=
 =?us-ascii?Q?xnYhfHMZjo5Gsa+8r8075YkZlzbqpttj2YhyxGEBdkcKKP+9Mn6BXZS+LMYL?=
 =?us-ascii?Q?n9QVAoi+tlfvuCDM04/Et3c52mN972Ec42KxzKGAbRmGXzryi0WZ8ru46XHH?=
 =?us-ascii?Q?wbbrqyE2tJ4qXTbGpiBGGDo3vy+ZYXVfjOZSW2HvL6kkYHMLtRQyojyNmTLp?=
 =?us-ascii?Q?VimKSKugeHRemIHXJVVvQAhVM2/XEmLvyITxp8HHrCWT6bQiD+RfBLBafgOi?=
 =?us-ascii?Q?kDsN23prb00KklcbErmVC7KcXlyUwwm4nI/l5Xg1oWhiHcuaCDaVerqhVDXh?=
 =?us-ascii?Q?CkiNAmQjY/nqP09CYoDUkb2Ra7xQGa8OHC0cHFr1IRrxD160KfJp1iXHAevf?=
 =?us-ascii?Q?Pej21g645GJYOdgTBK+RW+omY0ZItVPzKqGffc7qryKHGO2a6rthqWOlEWuL?=
 =?us-ascii?Q?0INqOBCWXO9T/JKQUray52CNr5D4OiX/DSX2akUkbeda/yXVd3FIGeAbuZNm?=
 =?us-ascii?Q?rI6ZfMvisfmKyZ3kD8njSYSGGCENH9XPKlsR3AO4nSSnl6u0qBqKpNay5TBe?=
 =?us-ascii?Q?s/tMBPN5hDPe9fWo6+NAuMhsuRN472OnutvY9s0EcHXu4uqpPfgVczZgpVGl?=
 =?us-ascii?Q?jUvXF02y42n8x3MiobzVL+0ijMNMj2I6IYVZHDVQj38bpNNfLjENVS0/vYMH?=
 =?us-ascii?Q?cbhK55t8kiZiIIlBx9be9uL8DX3dS9UkFINpyyFhQM3CJJieu4spKcP25Mi2?=
 =?us-ascii?Q?onXLUAWs1pO5O+2nn0d3i0PZCPsU/8v1GVPuiGojw+iO9PXVgQueXtZhMhlh?=
 =?us-ascii?Q?b5ryCOW0tIKP2rtT4ZVe+7eKRLrNfg/b5D7ykKKXsOzttRlACPzItGbegVMJ?=
 =?us-ascii?Q?NzOcZ/ALmRJxxL15JKnQ3sDozDZ0DyLLNwk4fpZ0jGVqarl4BCfNYGs3W+Lz?=
 =?us-ascii?Q?Jf8PSCT6LokKgTA8hk1RgOM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c7bc75-7e43-4754-ba1c-08dd1fc50c4c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 00:35:33.2857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npFP08oZ9HHKM1hYRgaVuBQKCYoV0O2IJhTAFlh9duNZ8ka5EdOH5G9JBNmocB4mf0Mzpz6vBVSBY7B3CAyUPEv9KzYsU9isUZVPUVP7XxrFOJQakLfB9GTU0QPSa4x9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14144

snd_soc_daifmt_parse_clock_provider_raw() might be called with NULL np.
Return 0 in such case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 710c278e4f36b..31cf499e3e79d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3390,6 +3390,9 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 	char prop[128];
 	unsigned int bit, frame;
 
+	if (!np)
+		return 0;
+
 	if (!prefix)
 		prefix = "";
 
-- 
2.43.0

