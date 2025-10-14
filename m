Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D230B508
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416066; cv=fail; b=eVAwqtijM7mcT+rNEftz0cR3R/vtAgNOfCP5l+6Zp9njsW91DGZOTEf5oOqF2S0WNrD3HabE0xatwltqkxZZ2NDznm6LyQCSu0UDtB1cA7yqhTPR85CaZgaeKzVH+SToljnwEhkvjHwIij3eHkQkiuWgv7f5AjLeBxHO9NJSWXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416066; c=relaxed/simple;
	bh=MHqOhXxYe5tMtZzGzb2jmzSiL9x9LoMut2NwlCWrOtw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iTNC1zC4+K9KE/9ftES2KKY60pvtOdoCsYHPqPu4T34XLCVuA4GRaGdbHla+CXHQf1x2wF87YedScOs298EuidKB8n1YKEdcjfZos6pYspa9KJXXkigYsbNrvh7HZHx224SBJCZCD4Nf2ySOE/EbdN9obVx5NSJdfCvSF4UYivQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nLMhNSqu; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nLMhNSqu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VX38zHStrmeXrgzZrVZL7BonYmI8wjh132oX3UQ5X6K0FPIh8HAThamMVVf/FgxbMXW7ZqTrx3EIgRjX8z0+ChhLL3LDPqSUuPnDaWi0jmP6iEtvdXYR8h3U756Lo7nsJ608SqL0IEsBJoDok+GrOUhpaxhSjet0oBq5HxCdattiq+Mqv3wMUoBSVFht75u5t2h2QtSQ+JncRqa5pm8hXdAhKdIRvJZMEJBNsiyEMzSLjA5MXFKqFHdzLOgpyg7rikNY8wI6/H7FSbeThSV4GdZVOopOZWobbynHE+BkmfsfKuT/cujs90NXWUALwUH2tTKSF/j20/ZcPDDngxLcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWGxvrFZO3Ns/y8k8DY7tkyS5X5RTumO4a8hh/PR1B4=;
 b=g3MsqBWTPA7RDa5o6MNoJt5i3T2nWT2n4QduY+B5QFmWlYKcSMbXV5kg9ri80lwY4tR2Qx4omI+BMA7WWbYiBjCSSDsoZxAxbWjCSN1/QfzpEdRawVKroZ2PQTMTugFYYd8LUh8+j74ebuncixwnDlMEnwzD9Ial5PzC/xDhZuVDOJ0WZ+XdygcQG44q6liCWnZqgCc/kBDFhL+8allgNsVsV7u4DZMakL1jmtjCSKKVDKGci3KbtcxOjUFuHg2Osbb8aLLuz5WafEVoCffnux+AjwkWR7T0xJaLP9lmA+DxEw52+/fS/JbtuMIPVwehg/sGamJoFiP2JPPr99Yzyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWGxvrFZO3Ns/y8k8DY7tkyS5X5RTumO4a8hh/PR1B4=;
 b=nLMhNSquWsBdlwWnqyC8w4Tns5gifZgedFit0A7UObGlRxgRlVFJouiMhgzGOI4k9s+C/yTtPm2k+GfKsGDoT+0rTsccOe3ffPvv4i5sAWZKrTvTeJ8gyggSUYBkRyro8eFtYI7C1eLfNKF5HVanRag2cU6VSlEwjAMUq5Y351w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7268.jpnprd01.prod.outlook.com
 (2603:1096:400:f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:43 +0000
Message-ID: <87jz0ym7k1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 133/139] ASoC: mediatek: mt8192: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:42 +0000
X-ClientProxiedBy: TYCP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7f2d17-5f3c-4fb9-054b-08de0ada04a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GyrM15ACpui8nV1f7QM6S8Phq+1AGFuavh/hciVBfCIAZkO4e7xWw5cchMLo?=
 =?us-ascii?Q?KoU/qZrli9zUJU7a0TTFTDGawT2IOfDuqgbMed2aAQZ3xw1wUlwM1E13cST+?=
 =?us-ascii?Q?mu9uw3Ih3Sa9YFvPuhPYvzC0Ps6HVhifDmaICVujNeFPLokJItImOaBbwctj?=
 =?us-ascii?Q?ktaDdPrKI1jeDbXkKBAVd2UyjejJaEyEegK0bmd6WK0OWv7SOVV3Sk80D2fS?=
 =?us-ascii?Q?qC6yRCiWao7jt5g3ih+RFkAbXDy03+wM9sTKzX+WW9uTXpBEx7uc1fwlgzKE?=
 =?us-ascii?Q?Xqi60LMgyYLLH+Vlzk5VdcL3gl/yK6bGuTRGFj2z5+2knTENlLaYdd01JnYp?=
 =?us-ascii?Q?e4D3aPkxMtUB9KPcxt+3Z2yoztMe+wnpUr4/K5s1srWgyyu7MoxjzrAt0x9M?=
 =?us-ascii?Q?DzToRQXHPq8x18AOsM0/eP5ry9iyVNA7jAMNsIRcrqxax86kPdE8YxQBpSNW?=
 =?us-ascii?Q?ZH1KmqWPYHSekEPTQYFmlhFONjI8MGpMfRjDQfdFrLTv9Uej4NCjLX4a2AC3?=
 =?us-ascii?Q?V0LdwZhIRanraKMsmh/SE0rCONpuL/YFk8kZFiIrnq8xOfvAHmiHedYjrbxF?=
 =?us-ascii?Q?zMfbRfkmXK7vmKLjC2ZVQwiwf37fH+hi+5GkmVAdGqKbmOWMXvYQmPJdHGar?=
 =?us-ascii?Q?txBFy4NVCDfez/jBu07yyppmHN+TqsBQhoV4RA2UiL4NV4dYCKC2ri2T02UI?=
 =?us-ascii?Q?9mEe/NYdjn0Tb5/pSYQo01tzOT/AI3wrYsQsT9alPvOt7opiFrBapdkCYF+o?=
 =?us-ascii?Q?Oj17EdPnZ/E09iDLlr0T9DN+LEPT1G+ekEA7AXXM1ZkTkHGxmYMInBXsD/Zj?=
 =?us-ascii?Q?tzzguJUvB13u5tz3VCqKFdgNK1EHUlRKB+bllxAuy6jw4dlujQ6CFj0jNjKr?=
 =?us-ascii?Q?aI0vGkhvDS5v5/GCWAf7orpSgC0GsjEDKWOvD/7yeML+qytIX8mKEeEgFs6v?=
 =?us-ascii?Q?+vbc/WX7U7PZ61dUrOkr5cSUKR8tp08QT0PHEI30n5AAfFBg0a0bz1Cr+sso?=
 =?us-ascii?Q?yvvM2T/eJVq0jeNrPAAJJaNtbHuVHf8oIuX/RHq+G6gxrr7xpujm+q91gIJk?=
 =?us-ascii?Q?QCTnx5UM5DNJN/dR0Gk1/8tTfMNTgeqIOiJRwIXGtMitKl0EjQUtG3kIlrkX?=
 =?us-ascii?Q?ipRQPlzrhO64a/xeo7+ckuhTPtEytYuOxJoXAXSN7NI5iGGb6u7AilGKnYXu?=
 =?us-ascii?Q?miXF7bcs9CSe08/QNMJ/13Tk7XyE/498R6WwpW8uwP1fH5NVa9NuCp/Jzhsu?=
 =?us-ascii?Q?Ie4YxVpyGdOR+33bB9uCG+W+2rg/Fm0MMf4h+T3rkDVWKj++NMAKf1vkZqfm?=
 =?us-ascii?Q?DmB2/Tp1RIKF1D4goF4AtWLHA+zBJcWp8NqLqbNiskfD7dZ0yFCKCINowEOp?=
 =?us-ascii?Q?WozzWpPYJug7arnSLL8KLGFzBSwfMjAzkcxZVStG2OsdXjLAcYcGu3qcL2W4?=
 =?us-ascii?Q?4l+SzWjrwAREAVJMBQQ91ym27ip2xjIgvoqomlGFWeOnfafYPqJxEAZmfuSO?=
 =?us-ascii?Q?0G4+dgUphUk+nfa+QKjB2m3f3ZIsYOeJQj6M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i7wQpQoJxtQsSkqM/9rHs2xu4lCbAY1rZ1WTxE9pkEINj6CK2O+U04v7DELd?=
 =?us-ascii?Q?tqpkObNYclGL2yC6j+LNQASYn0s5MhNKb/LJsYeQtKtB/ipPPKo7laHqVwJg?=
 =?us-ascii?Q?6XfHnXotjiy2qwQ5zjk7TovqrqByzYZRRzAByHvzjmQJPZHJXJt9EmnQGcC4?=
 =?us-ascii?Q?04anJ0PveZ/xUnkYZXVJKntQdZVpO7B1mG0WoH4zzA5I+EF2qm/aw4bfgFkE?=
 =?us-ascii?Q?MylQ4s9owSjP1MbHz1h7ohGL0SinZJhpUB6b7FnQ9b4qaIoRbtuhqzif/Rxb?=
 =?us-ascii?Q?kExVrMRabbjQUYBdg7j428zppcOtQK5LCMUtVghnjCM/DOaRHWVLuAXsSfs8?=
 =?us-ascii?Q?eXbXNulQtry80dwPf4cEBdPHtnLwe+PIj7fESW6WIzb0L3Zvx5xl0AWQECiA?=
 =?us-ascii?Q?Aw4NA4L5bJtPIeGBbgp7mQ6dzxc22EaVCzEB9lOgm84Wt7Q9w3sWugn+Xz4q?=
 =?us-ascii?Q?b2LRQutdTYy3qVAKVWHZBIpgJmLlLoDtlkHBuQDq6s5H43+vz61CpqtKEK6R?=
 =?us-ascii?Q?eyLyo/kDBkWGYCcSpaV4Z0JAdgsLgWXcShkqseCEPUo15LLi4zRB3ZuK/1nW?=
 =?us-ascii?Q?5sIjzsonmV444JYd4aQ3C4kS9NirLCIiw/kVUGAR9G/cO9FaldnhJHevCGeg?=
 =?us-ascii?Q?KcNa6LqFZCWRWFHs4gRsld9oCB3l6qQQVP6y1mEL5poWq9kwYHNSidIfnf5S?=
 =?us-ascii?Q?yK3JwmasdBf5Zqt0kaqp419BvYjaxp2rpW5A9z7TgU441W2uQHw8gjFOySA9?=
 =?us-ascii?Q?f4EUsg7GX7lnkC1tqsx98LKv0ZxrPKxxnEqMM6jhO5vXEgjxho3Nt6NFziZ5?=
 =?us-ascii?Q?GlFhR9cHO5SgOhsI3OApBbRC6L/Id5un+CbX6yb+jTKA1Kww4UtUO/ZgbOjG?=
 =?us-ascii?Q?h8Hv5I8BBhOawLVkgfC3tOYabVWkggiG4aqRq3DkwhlRWko/AJheAIoGcSMq?=
 =?us-ascii?Q?84rMtlvC47gHAoNJgXNyd72gO1W32LTJCZwhTwp+Mw/NEVcgDwTLneCicbIS?=
 =?us-ascii?Q?EA2LEnOjus4ZwiK5165PySI07ZMX8nEflfRw6aVzGfpaZ1tqgnnHFqHrtXSB?=
 =?us-ascii?Q?0mjisgXjwiL0BBEHuveQU6iTOOsNxpEH7/lkGCvKWK11g9USiPzjR3ylJejs?=
 =?us-ascii?Q?PWqg9vRuiUz/EQEcwLvIWbtFroMsdB+v3+RUclVZwem15xwLUDNQuUtuxo+u?=
 =?us-ascii?Q?wonP3a5TtgDIl4LQOtAyIp3IUx9RUQ3iFwy61hgYee6yK3q7wh80Bfeux0eI?=
 =?us-ascii?Q?fs+0PKU/wW1lABpJCNslqmxzw0x7WOtIjf/MdvTHQiyiO6PIwl1ODVX0rA2j?=
 =?us-ascii?Q?4QsBG9N3rqU4iI5d6YhV5/slGCStCc+XrS6Bm1U/mTSGTn1jcxNTfBr5s5hG?=
 =?us-ascii?Q?Tb3fzwv2nJhFv3B2UAs1yQMB4VUyZ1PTstsbtPhNVISawtIyH/5iA1t/FPbh?=
 =?us-ascii?Q?G0Fd76Rm/0yyn0LpFZAWUa/VJj3uGHmIjbWZQub8b/K/yFJFLBoPKsSBo5PY?=
 =?us-ascii?Q?oy4cVdGOpem3QQ3t1hiAujQF0tHGG+PnmudNWiH4SAmz/CYoF676PLyW6fph?=
 =?us-ascii?Q?ProUQT1ky2UdqlWAXcuqC24ebSZoM75thC02z+RXjBK8hNxai9rI+b57wtEC?=
 =?us-ascii?Q?yWlMV2AogEtPqHnEfx5nmqs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7f2d17-5f3c-4fb9-054b-08de0ada04a3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:43.1176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENIkU3oAu9P9/VnuJIEdt5jmB0W2HppOZ+pT3Y8XAURCZ/ISEKE0ZdRmxmZkz7G0vxtIM324y08Gz0Jf1HiWHMa0k077bxxZCHt8XgD44gmPy0q2jaoCqdmCNeUn94Ig
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7268

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
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 12 ++++++------
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c  |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index 99de85b876435..f8cb84621d386 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -492,7 +492,7 @@ static int mtk_adda_ch34_dl_event(struct snd_soc_dapm_widget *w,
 static int stf_positive_gain_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 
@@ -503,7 +503,7 @@ static int stf_positive_gain_get(struct snd_kcontrol *kcontrol,
 static int stf_positive_gain_set(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int gain_db = ucontrol->value.integer.value[0];
@@ -527,7 +527,7 @@ static int stf_positive_gain_set(struct snd_kcontrol *kcontrol,
 static int mt8192_adda_dmic_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 
@@ -538,7 +538,7 @@ static int mt8192_adda_dmic_get(struct snd_kcontrol *kcontrol,
 static int mt8192_adda_dmic_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dmic_on;
@@ -558,7 +558,7 @@ static int mt8192_adda_dmic_set(struct snd_kcontrol *kcontrol,
 static int mt8192_adda6_only_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 
@@ -569,7 +569,7 @@ static int mt8192_adda6_only_get(struct snd_kcontrol *kcontrol,
 static int mt8192_adda6_only_set(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_adda6_only;
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index 47dc7ec4cae7e..1632fc94776da 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -135,7 +135,7 @@ static SOC_ENUM_SINGLE_EXT_DECL(mt8192_i2s_enum, mt8192_i2s_hd_str);
 static int mt8192_i2s_hd_get(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
 
@@ -154,7 +154,7 @@ static int mt8192_i2s_hd_get(struct snd_kcontrol *kcontrol,
 static int mt8192_i2s_hd_set(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-- 
2.43.0

