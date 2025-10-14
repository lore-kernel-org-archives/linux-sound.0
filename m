Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1330A3081C4
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415630; cv=fail; b=IoLIONLRbg3BtVsdf/pO0waH70+t0XSqc4ixD4/gjPjFAb41tHWZsYOkVm9aE7Ya2qb0cHMl68JF27wpxHjfqgKgrDXLd8Fq/Mvj3yJ/T5elKA4NEqH9mHtyvipTvT5uSCBYBxdEZa88BkBqNpEoVRaW+k48ClAOUDq+ps4ti1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415630; c=relaxed/simple;
	bh=isVBNhjj2s1wxQQmsn9517BUQqX7DynYfFIyqmp+Jgo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=I91IvVPbOEcImphxuyHAWHLTsOWOvHW47RYeZui1CMBzLmja4Fsm8x4+tQgeZ6NqbpPOv8kEXK2B8CSVuQ58lQT7dO1tnFQz/bTrEBEswssYbFn1syGDqWg9PgpAj16zrL/ggjY62y0pTHFRbKJWA0USAhXy6QhX8/PjeY9cO/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pb58czGE; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pb58czGE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrWmBKOEEt8Oi3A55SPI2FGP5s0EfLRGnZbaV3MoWNvboBHkb9duPg93LH/HUZs2ONGB11ui7yy0Fks0hJ7kQkorsW4TmFepVdojZgc6kFdPLM+C1hJpZj9h2I/b/c2juUEgYqALM8OEGYzM7xRoZ7GFL/zxQ2jjbyHEFwHjurM/6DNSsKXXeGYI5+/FxVu7pB1qBw83pUnODpk/8+vImpcPD9wZrDd14nGzG1BsdhYcAL0XCpkH6nCf2pD3I+9HAedYIf1L00xSfHI1iA2beBXUDBw64DRPejlkFRr5I+So6boZcMbgomfpwH1QarluXZiGLJrs1/sDQ0IDwe8OWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeCX64q+gh5Acm+NMsgoH+/zUpaUEH9sq/ZWOp8sOzo=;
 b=hKamc2tv5aqGp9dI/mCHbdg+JB2MYYMulIpJaxgsOkX2n2hik6g3CMDurpo0ZA0gogj1IyaCY1/9AxZ6eTOW6izkLqd/a5IXQSxXVBs8e1GUgnJLjFOGGW7pgwYTTE6l7YaLLgtm5j0wap4zS8Kqi1cEXtFp1bCUk/hlmyU+SDS0D4eTBbit0dfZqlwNTiby0WLr/M+Jv+nIcf3KWM4fbVtmAkoB9ZVx2k8mu6qR8xtbk4z/CQPY0cA0ugbkX+k1XwdJ7dp0tTl6CV/KZ1ruv9UaYEUOZuH+0xrWa4bp83nkYNKkwDdNpMPPE5czHLp/vlZSXo9x0cTA37vZgl2Edw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeCX64q+gh5Acm+NMsgoH+/zUpaUEH9sq/ZWOp8sOzo=;
 b=Pb58czGE/YfbiPfI5L/Vm2rmTXbfE8K6utPHTAFJ1jMAYMDiOA10DY7QHBtQA1cxfmHtU+naTGgA25RyKAxZg/W2Sc9O7CFat4x6OZHbnoJhK6qYUJj7q3ITpYj0e8O7ULf1L2LOCKQ8L0wdlklRzifE9nqIk4LHx8ZaEf19MLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:27 +0000
Message-ID: <878qhet8qc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 016/139] ASoC: codecs: bd28623: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:27 +0000
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3a150b-2867-46c9-76de-08de0ad9010f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7WcDJPrSWzX1xh2YrG5balH0LIFCd28iFRzZysAtdk3IEO1p2cl07VQM84aj?=
 =?us-ascii?Q?kqKcnTexvzvHuppLfdqdjEb/SIIDg2LlqEtjrsYv14uKePrCFyJUfqNFRUDa?=
 =?us-ascii?Q?9ztQmlygmlxQrAzFFL9Cy8LuvFg98mZFmacHsSFWFWZ/4puLWSqWrsKcoezz?=
 =?us-ascii?Q?j0Oy+gsuTFF3gfX0nG8u9opvYyJPYlluvJysLyLjis2cDJ3+WJ/JMuhFbGLC?=
 =?us-ascii?Q?YbrnUQQdUKAjG9PNzlB3DSn5Q3EBSm348wT5YLZTzMS7s1ynUzRtJ+xiUl9h?=
 =?us-ascii?Q?EffjK2oHnfzU9XU9NWHI2eYJ9Bhos7OqL7sQHeFi01BKt8hN+YWVY4eksw2F?=
 =?us-ascii?Q?rQA4Ic/9qoCWYyREh/efUsnaoZIwH+VBLxPEx4BZGcddUHSTp035lT6R5oO4?=
 =?us-ascii?Q?+BUZTx5TUHDzozdOMJfu29cdrgbpTIzUyDrfSO9+P+zshufqulUYBn8raC/0?=
 =?us-ascii?Q?1sQDxdMl9ztOQuie3j/6ldmKWU4SsRTmbuBTBYPAFWbhvshQYIvy89WVZbnu?=
 =?us-ascii?Q?fkomjwlv37BmFyezJY4B0uKVffoKyahLd8/IZfTISMeWQz4WbNWuE6uQWn2a?=
 =?us-ascii?Q?xJKcmVhQc5VqiORkdB20NW/HqQC0W/AVnBM5wpXbXUxZm6xPezYme7PS7/+L?=
 =?us-ascii?Q?gm0l04YrTE3ZWw4cVQiJw9dRmnpKf4Nf22dKv+BuOBDLqSmduwXqsRwDeEqk?=
 =?us-ascii?Q?9rcqTlACKMHrQ6lbcO1LaUSkhHhlRuOTVLdEXoYDdmbcQ0Q4C1JTIJlQo8LI?=
 =?us-ascii?Q?5B0Fh53TipNU+MrTNReahxhunrVa4bpw1RA089cS+bOw5mAXeqpmVI4f89/x?=
 =?us-ascii?Q?bG3AF1EtFscEgWbzNiL1dmVZp4T6FhxgnNoTJfbWFQjf8x50S02zF6cmvd3B?=
 =?us-ascii?Q?1LRrrjV4gdp2p/OGqXxP3j0gMW7is5nvGJXt/yaD4a/DsvFjhMLu/CK3i5gK?=
 =?us-ascii?Q?aM3zT/i/f6a8HEj7JqaFnAacZ/A3TrrqOrISsqPNWb6u+7eVQecEL/H0Mrh9?=
 =?us-ascii?Q?+Ngj2kkiJIvP6scFLXdIZMulE5Xx4QZ9GuJGIKy+Qy2XG32fd1qVAwtLGsDH?=
 =?us-ascii?Q?11gOlN/hgendiNpqVoBc/xk7J+t1r6O0jtavQeP/Kc0xAdv/ot+4b/uNRKAF?=
 =?us-ascii?Q?BIqxW1vY8hY/aMnoWjDzSfjC3Qddtxau22+9YO0sTd/7e4dgCrF/ig5LgJCE?=
 =?us-ascii?Q?G4kbMaBqvXGfvFE9WqwKTjwNgnTdRWIy6WwDu1UI6k7336i+W2QoVUe0Y0XD?=
 =?us-ascii?Q?Mzr4Al01x5Q8tlFOr88DHiFMZtizLdV882LMfTLPdkF/XekQjpuH10JL6zj3?=
 =?us-ascii?Q?aXE6OLKbBcrgH2iwE774UPRy9GIqf4oHgrpeRNz1fHepo76y7QHAg7f4p+Zg?=
 =?us-ascii?Q?xdEfirP4IR9y58pB050/Bn0nsGzHeVJxYGp/Zv9jSMZIpOJq7h9H8tWBt06c?=
 =?us-ascii?Q?0bppMIDSlWK0iCMX4eifyy1cMkm8rZYmIzChSE4hwK6qsOClwcdHqU4sCQB6?=
 =?us-ascii?Q?mNij8q1mggO4PRsgCqCfU0aB+iIqJsw7i4r4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nKcAcDm41CDo0CJ0FFRfWr53+8bLyjbno8vKUg9N3h/X6g8WXcUcqJQuMWuk?=
 =?us-ascii?Q?9DTzpUHRXykd2Eh802aJcwyiyXP3o8lh9r1zWCahtldZeHAwVYPR0+lNXh8+?=
 =?us-ascii?Q?yfLw5yUOi9px3tBi4VukQtXSmnxxMWTZOZfalLxK7ITdIf2l74gIJaswLjKW?=
 =?us-ascii?Q?TF8kTUUoePUGpyV10Nk7au4d4DhSL3d7Rr6VcWyNksEcl69RVUvcyM0Mg27y?=
 =?us-ascii?Q?BiAE+rkWIJmtVrzQOPy+kQy7DKFJCLrW6TA8xnufSrTT7cnaCDUv7Go+dEaR?=
 =?us-ascii?Q?n9ZGVJojcCJyh+DXtYmd+l67bqB3NWxFX9+2PMPGQwHImZmMjfaj4qq1nXyB?=
 =?us-ascii?Q?7ixlCqMOcEpGWTO3yqSKRjyNZGSHD44D3xFah/msqx8Jrclt+Z0I1GOn1ElS?=
 =?us-ascii?Q?Ix73uTnkQV7xrU6/cZDPhWVreiWaKyOhaBjrASSJzgceIprV5nmm4H/2R6mU?=
 =?us-ascii?Q?7xZJpvhZSPbZjRM2JbqOJIHY6KCUJcN9YE5CZ954fkVGcqp5+s29Ol19mXR6?=
 =?us-ascii?Q?Sm0F1OjRsdmwaB4I5a0ckZ4KaYJBnZmySHTxLB/hXf15/Ak2Q92Qn4e0DLZM?=
 =?us-ascii?Q?cPaUUhaCmws7h7ZYe9HxjFnMJDF2iqMPQqPGw03SghGPFjDMrGVlUE5lJUvM?=
 =?us-ascii?Q?JLEU+fr+EzGtZ9u6Re/2whU+FY1loU0O9rB70GF1x4fE+uXESUYELaKMZUZ9?=
 =?us-ascii?Q?zheNzSzYoVgv0baSJU20wW0wZ9fM2YQtMNY9iclPXp1O0A6Jh8N/a3+UG+BP?=
 =?us-ascii?Q?NMRql5vxjeOcOnf5Go1RlKIAfh/6Ho8RMtMmGBkZXfuwQ/EHl94ddzLVuZA7?=
 =?us-ascii?Q?QxPxhZTDKiKBkGM9gWg0t4bd2EM5geAqlM1HHFwELF2aewj+VU5Jv0rZr3md?=
 =?us-ascii?Q?feGHDmNomOwfUc0vt38We1HotplplqBDSKJ4wQnhL4g18o+MFDMxSUgrzFTF?=
 =?us-ascii?Q?c+cUmRcC23E/tEZZeIqldHmROFULnPKArmnb5qDkzuyBKFkPnMKx5gHFrjO+?=
 =?us-ascii?Q?gYNy2byEoqygBJ5HVYLllJun4uHPbNTtAnLY52iVzyUvVi6S3WLtLPnsHXYD?=
 =?us-ascii?Q?alyF/On+jhh1ICkZ8mCdLgRLCzI8o51ZTPDk5Z6A4IKPpsxRTl5mkOmX0rHs?=
 =?us-ascii?Q?BdPaXEj8AttKv7BGvMAmdhNsz2+Yopvx6fiIJavaLftmG/7cjsWRAMLQt6oL?=
 =?us-ascii?Q?xJai6l3ZmTdSdpB7Al7TUVQLEl9s1vWGQca4g5tF4ZqQonhLoj5qTzElKSnx?=
 =?us-ascii?Q?6dfzZ2lZI+aNCc0lOdVXDQfSAlwY71aFCXI3LqqxWECDjvnMPrIOBoWF1Vmv?=
 =?us-ascii?Q?YOJVs0PkgIX01BYCXfP44z7C0529fkgP2Ic9Mk4mVWcbiUNuMF7IO/Qny2Rz?=
 =?us-ascii?Q?vBQ/5EysA+Y7Tg1O3NH8xSxOhxs6Q7fQDpmANGSkamsqMhfBufqxm+Woy7L7?=
 =?us-ascii?Q?2weZ+hMAKW+v8FlTdCeiInG0V6s0qosnf0BHgESFvG1JEmEiLvq3tuRg3o5R?=
 =?us-ascii?Q?iYx539QSP+tDJI+/NnDgIEnVVsNUaEFu0GIzCoWRPn9NPCfGtf/inKxMbERT?=
 =?us-ascii?Q?LvLS+PfwqQpDzeWiyDlv1lDAqsdi5F6LYLikGFlWygmvE7QuWP3qAVZ6MDC9?=
 =?us-ascii?Q?u8wWjx6giX4ZPq9rTH8RGR8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3a150b-2867-46c9-76de-08de0ad9010f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:27.6448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiE0iobxNUq6WkzYEqou8ZKyWYPUPW7H7IBLUhg6wFguDEBTkHp1MctQQs6JdimnOCiqROkHs4BrzNsXX6RXOYqWABCORqm1mnk2YThHH72xJacC4BwDkxun2gdshP50
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

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
 sound/soc/codecs/bd28623.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/bd28623.c b/sound/soc/codecs/bd28623.c
index 82a94211d0123..07e7bd79c8b07 100644
--- a/sound/soc/codecs/bd28623.c
+++ b/sound/soc/codecs/bd28623.c
@@ -70,8 +70,7 @@ static void bd28623_power_off(struct bd28623_priv *bd)
 static int bd28623_get_switch_spk(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct bd28623_priv *bd = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = bd->switch_spk;
@@ -82,8 +81,7 @@ static int bd28623_get_switch_spk(struct snd_kcontrol *kcontrol,
 static int bd28623_set_switch_spk(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct bd28623_priv *bd = snd_soc_component_get_drvdata(component);
 
 	if (bd->switch_spk == ucontrol->value.integer.value[0])
-- 
2.43.0

