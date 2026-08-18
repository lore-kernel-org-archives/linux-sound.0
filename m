Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F7D1E492D
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 00:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787012991; cv=fail; b=SidF3/PQGWjBNZVORh063IgKmYB7Fy+leSfnihvOw7qn1HhA7Yc7QLrdlthV1ABgpodSDOOyU+KqOZVidjjV1V7vNkzg5TXl8m5Hk5tMz6/VHWTL9fCkdp525HcqTZaaBrADcan1KP6k3/AuhNYaikA01TmJmuSgChfFBq/+f7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787012991; c=relaxed/simple;
	bh=nfXDabymbENDDMN0/iX4tDQZGfHOjWkxMCirDO7HXqQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iiV6bLNG1pZSHGR1qYs3PD106Jmyq3piDjawGNYQmLdQQldaUxDvpVvgQ73QiZO29UODqybbWoiRT5qlsNTb0HK14nkUGe1jh9Xc7O1vjv8HsXzbq3CUpdyBihcweNSYyfo6S9SiozWhRa2VWdKwzBnLVth8eUKFBxvgIvipyDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P/QtGSNz; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P/QtGSNz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2QIs7o/lGPyg/7+tWm8fz6RfQ4idSKY5zBQu0Brp1j21WeXXg/6fjH3pqiLTPJ7qI75j3NxR1NqH3uJvDb5j7jM6e6coxCIuP5SDngc1+Q7VmCh/nM5GKbNxA+zTWntmCuZlQZZuVt7deGJKC1VIBTeyfGAMxumZOWR9+H9MEYDIItUzAVQ9Q1ozs+5LZxep25rZaYC8eZBsz3NZmlaz3JjHysgyyOaQ5b1NnE6ZH/S5wdaMb1JnktlEL/g0SbJbR1Fq9yrA2pLl+HnQ0t+4Hzl1b7DWEIJuBpaJi9wzn8jON5PLoTV1m4/1v5WmbWswklhBaQLnhaZhydmwhbVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=884CJ531GjWMRuZkDiqxCYx4v1utanEOVEifq0kxBCo=;
 b=Db91IVnRh2wZt3OqvU3FiMyvkbtQJYxUhMNS7Mig+p1fE6KxOxqHUo0wpkBwpx7Wbvkg92XGBcQGka9oHogwIz+B9uBC7aaHx39inCNrn9qgWP4DCCzDcONqFKKZ+cu5gVJC7NPVtQmhj3qTuXod3LBZhifGsEURKBGatKIFUpfhIgdPToUgvNDYCLGXrIpP2Ummx02aWaLpMUWfejNeMq+NdLtee16kITKhcagONc5nVt/pnkS8MfkAzh/Q/LX5eexMek6D1RA1uCjAYLw+97VOqVBjg7q2Ib8ya7n8ExrPZWDOGHvgejQq5HOUOnK9ebZZL/3//dwt13ngRSjjEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=884CJ531GjWMRuZkDiqxCYx4v1utanEOVEifq0kxBCo=;
 b=P/QtGSNzlWcscUcgSQ7/KGmrESUt5sU8Ct6JLCcQpCJPjNetfhe5d4gjdGSAdhVVA+8UQFNHc7mtocQFosp57kxFirIm6r9HD7LGULzZ8U/gihl2oEZdLSVv75hdwTWvDu3/SMbxL2BRI6fwbiyVM7IiokKsdrTN1yfLiKDjeeg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB12299.jpnprd01.prod.outlook.com (2603:1096:604:2d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 00:29:41 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 00:29:41 +0000
Message-ID: <871pbwnudn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,	=?ISO-8859-1?Q?=22Nuno_S=C3=A1=22?=
 <nuno.sa@analog.com>,	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 04/44] ASoC: codecs: adau*: use .auto_selectable_formats
In-Reply-To: <90850af1-8095-40b6-a44e-64479b0b64b6@sirena.org.uk>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
	<871pcavjig.wl-kuninori.morimoto.gx@renesas.com>
	<90850af1-8095-40b6-a44e-64479b0b64b6@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 00:29:41 +0000
X-ClientProxiedBy: TYCP286CA0151.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB12299:EE_
X-MS-Office365-Filtering-Correlation-Id: 55edbf4b-0458-4fb1-fcd4-08defcbfcb31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|23010399003|376014|366016|38350700014|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uev5/Jz70D4Yx9Pdi0AkevvJrmKGRl8lPAVo/p1xTpP8qQPSGEuJsmxYy2Or9KNo2Svq/7KYGIjQvjO4cYP3lELFLRFOvD0i0a7+KhUtXto8PC6iArVEyU/W3T8l8M9QuK6sMg0Uvj0r3O6Tqu8H9gYd505vBWeq7qybnOHIhz/ml6IsXbPEFM8QxZVtDK5xa5npAdJCt7hl4Ythgg/5RQA8h5AC+ThXcmomRnu92RNpj/CmS2KPvUFhzMNaek2qBPs/knsGJ4PqY/DVMOLBKfztwn5EXqgXP41Tfo85LUGdHYKHit8FratCcrVBF4yRQiA1L2L5USsD+XooCuvjaQazvVNh0J79RS1t2dzNpGGYqYgA5t9OLpwOyd7+7taSPen/3GKB7Wto7JZQwhGqa+IXIcHG0yuB/q0h6DQmVn+MfRqHtGje2LIkvE9r9VelL2bzBTYPigNgmkzJxhl1S36NRdGjKYFyl4fPPpzwf3yIM5RNeLPx3T16RJvuQNncxj6Xo2JCIVhdYPZpHhHqeTfCxo06nVIX4qyT0AMbblXPxks/UVZI8Zbip5ctkgymRKdvxLXtIPTUBFG0CUiOo/9v9VqdXYWmWPOCyUDNmZnJkDGBHqXMW5ntN+QDdNnUxS0T2Q7z5G5E0I4qLwnHopQmsPGSE3YFMtRxMXkQtysvipuGSdcK4p19BEjTgH4TpPW7V05vcnzuUnoh9KLEG1Lj+fGZsiML9XO/ZBaswzg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(23010399003)(376014)(366016)(38350700014)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZeBohp51alLxYk7z+QxYd946AVJdcLTKjjgQW7Y52lE/6bHaLrkNl75W6I7A?=
 =?us-ascii?Q?NPHviYrezt0rYbl1xyfoKPRhdN1DF929KrsQkeJ4r72/bWd+9KdLRSjcsjJh?=
 =?us-ascii?Q?H3dI7HWyTkgjKiEYNEpMeoZiCF9E010SQG5GKQbk1AiPENEX/tz+HXQY59cT?=
 =?us-ascii?Q?zBnjH0oZRGlvWYSlqRTryP599rOjcZfp5hXgczZ7ab2+Eq5MVdSdKAPE5z1O?=
 =?us-ascii?Q?cdT61FBjn/uLckVWrOAOzIFo0H9DEb84kn6XZGODCv6F21NqWvj0PZkvHfhg?=
 =?us-ascii?Q?QUqUmmE8tkZKjGNN0CWVE7YXnMTiCArohRe5DfAjHCmr7szWavEv4URk/fp/?=
 =?us-ascii?Q?2UTo1zrMAy1Mhzx28VP5VuNlmtukFwnu6FvdvvQHeLNQ/x77/8DfCiaYKzJy?=
 =?us-ascii?Q?MtA6kI6W3kZh7i5FwymcDJoIZgbTnlLSTMtCxaVazLhL/nGU5wXOvQpf6hxa?=
 =?us-ascii?Q?a3x8bynchNKRwC8yMiXlB4QYWYSmYwDKX0ocosDtqvf4bPlI2vVkiLXLt+fP?=
 =?us-ascii?Q?7r4/fNSoXdz1CAUAhbO04b71ozorghEHqdn2VrllJHnlmAnmac0Cb9xxUcAG?=
 =?us-ascii?Q?aZLsTa2VNRgcPSQs4eN0HR0oDx7R0v3L6srWz1iXE8joyByujgdwAPphSP3v?=
 =?us-ascii?Q?bsQLJ/ZW4nleClqu/yvSDexE/qBS7Dbpo6uzp6+EW/CPJgTzBUI3Xut9lw9f?=
 =?us-ascii?Q?zWYNypCwLFLtyLQTNzZSLczt11pPD+UZEu8YX7LhC3pC1n0EO9o0l9ys5NN7?=
 =?us-ascii?Q?pqx4rAlZF9jc9xyo8ksOroKsTo/CacudzrrFp27HGtM3kyBb0XrC2UGVyrNE?=
 =?us-ascii?Q?Qv1uvcRN6g2opWJLG07VRq7OGvy6ypx9CYIpJU4txPcp+oauZhN2U5yxeLEb?=
 =?us-ascii?Q?2gQBeGo/rEyw+G/Cgb+DA1aEKKog/WodwPXXj9lrTQX+/SrK04gsWhr3o6MY?=
 =?us-ascii?Q?/hyRyDFi/pGHnTjLpBkJ13JK4fQtxgSLbnzfFmpws3VktN0N8VaMQaw2cHgZ?=
 =?us-ascii?Q?Swuay26+vl3IrRnfq/mI7O5gcetbLC8cuft6R1zhLfe39tFihUfU11Xx+BHw?=
 =?us-ascii?Q?tJNwRrzbCHKazwUlqP15SFDYrlO98D+c94tDN50ZplNqQfRZS5KLSNzzztGR?=
 =?us-ascii?Q?f+64Ygg+DWfD1S2zMVuFtkT6MKR2lw8uYXwL68qyLJK69wE+zcaB2ctNZCyQ?=
 =?us-ascii?Q?DOEF+SX8ibyPpvzioLwPiaFV8Ig2QtAg1249J1qBplLmb42wCFWjRjDQRuSh?=
 =?us-ascii?Q?mxzeLYEvpDqiwfctpPZQJEIDG45bOcBrhCSRFnknt3+e0TwUGiTVRrhekgQG?=
 =?us-ascii?Q?nysEodjR7G4nC3hMbR6TEesOszmPU6q3x5ydqNDo3DUbJaEkK5bN/N1TF/Ev?=
 =?us-ascii?Q?jUQdpgku18qFGz1wFMTsJZZj/B+qZO3vM5bj8UTCEEtGhEYn04wVH4gU3W0m?=
 =?us-ascii?Q?7VdKV67/hgsxi/ye2U1Rq3WWSX9XFrXu3fJs+XLGyV4wRIyoBj9umSoVAQxG?=
 =?us-ascii?Q?dY5LwLGh44WEOlFVLM7DwsB7O3t1eNnjx7vdVhv07BgHl9/YsYjRcht+Ymnm?=
 =?us-ascii?Q?xxA7WqfmV2RFL/dyU2sU1ky7iVulHlN1duhcL2mHfPF1H3G75ZxH+jbAWnDm?=
 =?us-ascii?Q?upaj9xAxCevKilbM8kIMXousV8BB85HJU5FL9sGnXK/T2LZ+RjPSny9A5hIj?=
 =?us-ascii?Q?g72VNARIIRamqS53vnSfp15STL8q2ZiYb9GpBHcHIwleFfuQLaICn2FDbZtP?=
 =?us-ascii?Q?ufmchC998JWxJ30KspjnJFuIe+QF9jQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55edbf4b-0458-4fb1-fcd4-08defcbfcb31
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 00:29:41.3731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaxKPcT+PYlWIdaUhxORScE0VRc4ye48Qr4fmkyNHUISD6yP5ZmJGWSSF9+Iha2ucLzO+5J8mfd/lYcgUY70qVuT7OXnSOmcVYZNigIKtFZD/++jiO0bro6mBa7wcgpA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12299


Hi Mark

Thank you for your review

> > diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
> > index b42f35b1a6036..b9d9853934216 100644
> > --- a/sound/soc/codecs/adau1977.c
> > +++ b/sound/soc/codecs/adau1977.c
> > @@ -741,6 +741,17 @@ static int adau1977_set_tristate(struct snd_soc_da=
i *dai, int tristate)
> >  		ADAU1977_SAI_OVERTEMP_DRV_HIZ, val);
> >  }
> > =20
> > +static const u64 adau1977_selectable_formats =3D
> > +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> > +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> > +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> > +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> > +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> > +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> > +
>=20
> This looks like another one where not all combinations are supported -
> the DSP formats look like they disable invered LRCLK?

Hmm...
From code point of view, "invert_lrclk" looks handling "block_power" only.
RIGHT_J/LEFT_J are also updating it.
It does not appear that the combination is prohibited ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
