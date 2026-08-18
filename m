Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC516F288
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 00:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787013749; cv=fail; b=H8ytT3n023CZtLBE6E34i20LaPNEqSU/K2OlL2+IVMrEKg61AyphE3ua/oDBVD5n7J2RWGUuc5ijc4wQ73tkqWSCUofS38DN3y2zN9s/EtbIV1/T5C3JiG0mUec6a+AT9Vlg3HxtBBIoJcO8tN08arTGBiOGEB8sMwAngGPtxEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787013749; c=relaxed/simple;
	bh=6uehomrAbEI8EyA4yzgammvDdOlr16YcKWXTFhjfmUs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VKPkuglhXDx/6z70TmAgNlN8usqaT/3UDW6qRD9z/lTFdOJUJOwOCMeGHsF4HPPQce9zlbF9zqoAywvTCn+iBfCzPkjH+RqEHx2PGF1SVsgrdISN/4oLFXSCLOBHpoSVuAwUbqLdbY8y/R7YPJH4S6W3USnWnCt63mWp841PREA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KYl6Yu2S; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KYl6Yu2S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fbr/i7QrYRjyLYgrWJruXNNfnmhWyTq3t3lo+iReLxcVbQo2Dz3mdZd/JDZbranUhTECYf8yPVGi2tMWdv9MxR1vKmXCjzXfx8wWeQb10wxqqeNtXOcdkb49uVLWaEg+vVeVdPLwJIZEnXBkodiyrNgvjMjEOI6I08NLxuvuRP98V7R6/hJfFRE5Jrq7FJvBNsZgP5IgnBYtMryHS9eiJu5nkLQE2BVU5BnWMf53taPqHJwdtzDTVkWIok2BA8AhIWKdiIOHZ9JxaaQ3BKRwUjE7k+zC130dETHDdkc8ogOn0H6Fg/53xVR8EA58tNaHTvv1GJi2dwmR532u+g8Bxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4cmok7Fsd/ddL7rgR3Wb6bksWWTkT3MUID0KY2fJnc=;
 b=FeZUdR6nFbcOtaIQ6xF0ST5n+pKhEwx9dwtJWURuq2H800DZelWg+ktg4F50ugrme4KFymFGiK/AsyFY21tHNA/rSBshc2gClHjGxw4zanEX3gcg62SgpxA+Rr0Q8abzM9Xk0bjyulsgGEkyqANNo3U8nnjmuUUs5peyKEO/oOZfVsgb7lujl4+WE4VIx2Iaj7zOnWZ+CoW4l99XL3mHxBp2hlexQjp+hiy14W4l0YV9p8UQKN00tLGaeAVYAwtQoTiTBtiaCjRbY86mxDxR170W2ve0/wxccZRtXFMjqI2zDuFyesZVXTzveY5by3XZuAtk9o2P5McBc4D0MUcRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4cmok7Fsd/ddL7rgR3Wb6bksWWTkT3MUID0KY2fJnc=;
 b=KYl6Yu2SDEOEpgeLo4egQahF/FkANUw6+lke6KbJ/dIRangxSdQQ+c8rTKSgxkWZe6WxSQqgqcfJ9k3BVV6N5+He3F7bRGv9YVOhVs7qKw9zLiyn8USbtbjVHXyoKobcKTWEJcicfanvLxXGatP/ft5oP4mv7inlg++gSSwdq+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB12957.jpnprd01.prod.outlook.com (2603:1096:405:1e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 00:42:25 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 00:42:24 +0000
Message-ID: <87zeykmf7z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 43/44] ASoC: codecs: wm*: use .auto_selectable_formats
In-Reply-To: <anWo/cCK2u5UuAhg@opensource.cirrus.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
	<87h5l6sq6n.wl-kuninori.morimoto.gx@renesas.com>
	<anWo/cCK2u5UuAhg@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Aug 2026 00:42:24 +0000
X-ClientProxiedBy: TYCP286CA0294.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB12957:EE_
X-MS-Office365-Filtering-Correlation-Id: d15264a6-4e28-441a-858e-08defcc19258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	7nBsHAj//M0ERZEMZBRi9POOoR6/4SuW0xaF0AK9CslhMFDc+EN4KtbpIqgZ7HenPBxVKMzHrAuCQpfxjgiMhWoxw2YJ0zQn8EWab45eyBZPiCxYodCWIcjqoCEXGLtSztgVIuoseZCtWp5YWrTqYtqf793d1/B4L24fMpTkf3F3StwEob4SD9nEmc1jsU/A9d3en+cue2RX6GLRD3/bwCDiLqI5kmrn19rObFNSFhWrW+3YZ7A/zWCzuu62VMxmMEx+qGAvGEXnEN1yQ7rO8T91elm6DHfMPHJZjZbaFw9gv5Guei7dEQx7WuShq5ai/JyYYRChu+38uDCqZAL7N9WfqumkExrMd7Y926H11UKc+gJErcrzQRSCnt2V1O0qrBe+eU7htC7lkJk5tHKjXEHp0Xz3T017VOn/zVLN6hBXrm6fOSYAZjpD5LIGgDT8mB3JqISrbfSCBHTlEtOrKaS6HvuOMFqLKeTSlkEkWPz4IKaVsv3b8apBerkZVd3UTqiWleh+XMe5tVYo9Pt45Am6BmY4ocLtDJsLVaKo1V1NSdjYch1/8Xj7q2VeUuuW4R5WFopixt3ZgM6wvq0bst/3ks+UVzGQHH3oqzP2BC4bg7SurT9jYiaL77/ZS//ge32RVDsGrVs7s0deOh3fJhQUX4qi/8zf+z4+7WNQX9ylmEdWsTA3sFtanXz+9+1Xjk6YZvI6sTvx5Ot89WaBnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vg6wErydTvKMVxEfAOvI0rqOmYjENxwJ7iuvMqXGMaD0ZB6Y5rleC/wHvRl1?=
 =?us-ascii?Q?22XLYh2mx0RvD7FrvBfZ5GKbbyBlbnGSuXFQtdvyUoSRVruCON4+YeYWzlcz?=
 =?us-ascii?Q?df6PpEugkA2gTg/tlTaUS/N3nkrNnJNtcjbplAVY9Sve0DJ7hX4rJguF8jG6?=
 =?us-ascii?Q?Nj8UkwNfY5PVY5m5XvCdTqGBEe8nF04tgOOHvEIkXS9HcZ2cBdQiCnb5GkLO?=
 =?us-ascii?Q?ffxR3UyADu1kBtaGLPuzNV8dTYFzs6eEpz+dztnKSTFU78STUS0zrNFdWnpL?=
 =?us-ascii?Q?OGLIyBba+mFxV6qRGrGHhSQfrFkx+hU+aCU1ssW5tDaK559KvRgiDemOSGu7?=
 =?us-ascii?Q?4eWGSKhlnM1rgTu9F7E6wWkL01yVq2LL1AXXV8THkEA+LVlJhA+8OSmE+bIW?=
 =?us-ascii?Q?0dvDJQRHDIu/1TN9sURx+gJ1o+KUflVr/3pVpzBD4Ty9sVV3f/wfjayYPOHy?=
 =?us-ascii?Q?CpwW4iRjRyYmj6yRcMob5zJFoJUzJZh/9srZ00r6Q/ajZ9ey7FR2rE2c/v1b?=
 =?us-ascii?Q?h7djv8+2y5PHkrnIUkl4Eb49B5r+uv8XSDMKttMelw6wC2kCBmiPOFXEu7fA?=
 =?us-ascii?Q?0/Jr9afBrdr2EaAOl24+RC59OUiXHsgHmUmvSN2IY2htLVAcsL4c41CMm3DW?=
 =?us-ascii?Q?1NtbAj10+hMM25hkL8Os6XfajBVzBrRv2DVbvTpuFLPTaAbj2On6e/HHNtDv?=
 =?us-ascii?Q?vsEbnI5qVtKY50NQa2TF7ypAE3H+dt+2wps33crPZKR6QLQIzxbmDD0bwVS9?=
 =?us-ascii?Q?BiAEgPAZQ571V+h1WcFfMKzfKw/c0CXHqH9PgIq02mzi5m+JXODg1y8iIxcQ?=
 =?us-ascii?Q?zPX4VftQARhnYwXhmT6ncC08PlVLSGAlQkMcud7vNXI6Nd/Y7nsJLGBYSO5K?=
 =?us-ascii?Q?71/Apus318PDsEdfml8lrhocfo/G3gtQItq9O68wEDnxiIpFozF4byYZPG6i?=
 =?us-ascii?Q?3AarzCXZNvfTL9yuOKyICCLi0nfouHPnjInQkukStoCoJAWaaG/VUdLK4jKb?=
 =?us-ascii?Q?AZjbpt/2LMRFRldAQlIXAnl8infHSqwuxyqRi2gPFZMFcqQxvnNt/ySdbRJH?=
 =?us-ascii?Q?Fbbut9zLrly51ulxDnB1/JSUr/Zijp5infkXdxTT5HVAqh+Q90FraOhYqZjr?=
 =?us-ascii?Q?JG7cFYYurSGuXMdpNMWrpxpLXCe7+KHLv+fmAro3N80n0b9HTdAqIOhPiYfR?=
 =?us-ascii?Q?3vmwIHt1tW5HZboIjFSbvxbUuLE5pukMav4OufYd76WD5jHTkV+K879gsU9M?=
 =?us-ascii?Q?+CBBgOLDkk3wTtE0q0Wm7urwlP0DHxvOxT0ODSc1YxMskOQd75F9nKHLR6li?=
 =?us-ascii?Q?hHXr+Sf33/tjN5AB1QFPq4eY2aS6EIbeJmZdZ4x2CmQprs3qXzDfG6JdcqBX?=
 =?us-ascii?Q?vgKLd0gR6I7BdyBSP/xQCyUmUa3EN9o20XMCoTdi89vOoH1FGawNq3iDlC4A?=
 =?us-ascii?Q?yRMhbIfRUNQ4cEBGVIafzB24Fm3WTUiedJuxNu1bH9o5ISENuCUy1Gtqr4HJ?=
 =?us-ascii?Q?VxHVRpQI6hTaxFR2aBoWM5sbQ55Ulk+/75E0tFj/yMNP5ckqSw4FzE0cYHaj?=
 =?us-ascii?Q?jqYnFdajDdK8DIgRCsxDIPGO7ZqhClNSFpfEcsA5SI2YfGoCebTXKsRi/4ZO?=
 =?us-ascii?Q?ehvM8fVRsMV9b8F0dyPNezucXGmp/7WkQK9l3FBKvT0is6tHcED+fWU87DmO?=
 =?us-ascii?Q?BvMHUIzbw2F5L1OuSYb9fFC3+z6fOI6R1D//5Bj7JsU4dG1L9GqLnCsDNBiW?=
 =?us-ascii?Q?DTdoFlQUjXNbMtx9zOXorkSTbFuw0E4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15264a6-4e28-441a-858e-08defcc19258
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 00:42:24.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYkhsgH4JQqsGR0Trxnipyz9AU2hPZZFcYBjJDuo0LIV8gY/p22BmvCXlu80XEMomUd52RzPTWUticrDcKhvbQziO2AYrVrnL2MkeMaIHrVdfwih/xZE/v7/lIxfkNJy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12957


Hi Charles

Thank you for your review

> > +static const u64 wm8350_selectable_formats =
> > +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> > +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> > +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> > +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> > +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> > +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> 
> I think we should only allow NF for the DSP modes here. Looking
> carefully at the driver code it sets the same value for DSP_A
> and DSP_B so LRCLK_INV is actually selecting between those two
> modes here. Admittedly, it should probably block then setting the
> clock stuff in the following switch, but no point compounding that
> problem here.

Oh, yes, indeed.
Thank you for pointing it.
Will fix

> > --- a/sound/soc/codecs/wm8962.c
> > +++ b/sound/soc/codecs/wm8962.c
> > @@ -3056,6 +3056,22 @@ static int wm8962_mute(struct snd_soc_dai *dai, int mute, int direction)
> >  #define WM8962_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
> >  			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
> >  
> > +static const u64 wm8962_selectable_formats[] = {
> > +	/* 1st priority */
> > +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> > +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> > +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> > +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> 
> DSP_B also only supports NF, there is a fallthrough in the
> switch.

Yes, it was my fault.
Will fix

Thank you for your help !!

Best regards
---
Kuninori Morimoto
