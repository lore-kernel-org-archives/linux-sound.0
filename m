Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C414A0C
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 23:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783986241; cv=fail; b=VVEfYOth3RjIbqkDq1XNidKOw8UlHqbt0UD4l/dDyHZ4suMZKZfGSC8/Wx9rGDcfoPuwKq9UWNATz2GpCuo5xK5ak3XrtBtbng3xDRH/J4of8Qz6Erx3pMRYgdQqd+ijpCx8z/9eoVULPgNdqC8uSKt5zzENwKlFeCyXnE4k0z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783986241; c=relaxed/simple;
	bh=I4iRw2EvJIO2T+5jXlMj13+m64O6fBsU9AQSXIS/xO0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rh1uLqqRwNNU53rnvzr2ak4Hq8XXypByPdruXPlDnnoWzvwvn8787pK94JZSGs4FDVid83jQWaq/JvdZbUgi/HJOlKNOSf6wmv/8gxOWKVQRQeCfO1BEOzx7Hnppf7+ww66d+7H96PNV93I294OnMrdYKG5HhO5rACYex/6ho3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OlfSwUFu; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OlfSwUFu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dq0cUDhEuGnqIK0QEGkZKSHeAxa440EWiMlCpU/kFPKvTUo4hTe9MxpAtS+kVwuJDa95pIdhoQALTIBlsJdqjGxFesR0y4G1pzBouqnq4BwkQDnYrOzk6t8r1WgUA+6rVdMYZttvS0ViOmxP6vOD+5e9Pr2aCz3HeaNGE7obe9LNWu3vYe7agqZIrXXrXk/QF8+5qSuWk7eiEZwyRXBMjqpII2ufzXNrx0Pog5Aj2tWfrhYLfq7/ETf+ssvsx8DSFe3JyJDrSyzGMJrbfvXJqEgQQyyj4LQn6qzTjxxWTM88REm0u3tIonVoa/oTsNPkyI0VeVOwZHp4COf0e2v3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ij1UMScq5X7ozCN9skrJ7XxuPP0ji3U7oQxzIHZRdT8=;
 b=Kc2wWyR0XoiMHjjmBT4JCMRdeN/DgG0vepIXwk1bvtDt9lAv6pOmdJ3kuAX4/6vNmZC4opD4QIX4WGD0B0OJgE8ZXJsLHyoOWqkRUD8azq0WsTlDA8h+k+tVIWl2gKatRX0qmbJVFkePOfHNcsmagWBEX/1d6OFVPZd41bQC+BbEWB/XPL10NYDRsJVWhGTa1FC+7FlepTR23CiXqZKSAq0by414CPsf3okHsGjyNQtK24aNWnVTl9FleQkUBIcpOcd3LD5w/ZJMUFPgFY5IYBsaeLD+YOwPNk+8qVHHA/HyOnCeHR+Usk9YJBF2hF3s0rFBa2pUEKVLrBmOkECDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij1UMScq5X7ozCN9skrJ7XxuPP0ji3U7oQxzIHZRdT8=;
 b=OlfSwUFulNiNFg4rs/8GGjljDQzPbaiIMnMto0ilaejbBIX/U4NsdFsCdp5SKiaJLrm3ZqMK5ut29Vt+mcY/ODzCXwlrouGOC2d+u1yeY7rIjZXMsMucw8utScTfQc5qxF2FFLWUL+7Sa74T6jya13TTJEYetVA9+K1esIO54kU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14320.jpnprd01.prod.outlook.com (2603:1096:405:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 23:43:51 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 23:43:51 +0000
Message-ID: <871pd6pia1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,	Liam Girdwood <lgirdwood@gmail.com>,
	=?ISO-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>,	Takashi
 Iwai <tiwai@suse.com>,	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/5] ASoC: apple: use .auto_selectable_formats
In-Reply-To: <9b2ce09d-45cf-4277-bcac-72cae66f8216@sirena.org.uk>
References: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
	<87o6gb20py.wl-kuninori.morimoto.gx@renesas.com>
	<9b2ce09d-45cf-4277-bcac-72cae66f8216@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Jul 2026 23:43:50 +0000
X-ClientProxiedBy: TYCP301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14320:EE_
X-MS-Office365-Filtering-Correlation-Id: e6152dca-9dff-4ca1-00dd-08dee138978b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|6133799003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FheGiFLa2JgV8fjnl+HIAWNNSk7wlKeTFKtRGkVrpK6buiAMOSI/dAUUYIdAMNlKLPu9XEN+lJltmokm5na1B1/Mxt5kGIR7L/2dbQA6IH0y2cn1LPrH3b2X0A4NyFLITZ1mHt45F54cDUQ2Pl+qr6/bAkZpdYdNLlQul13nq08IwBiSHZ8QFMJmWEM9XA6zRiajMNUNbUbsrTUN6aYnW9y5w80qfY8oJC82Y7eG60+vTywtcc7gYT4NvphLTK7Y2t4i9ZHqYg+lLuz3J9Hbq5XddJ4F+BQlXksqG3XF+UTUtUxlSgfC1Akwb24PnzL+N8Xy+FiVW5MyLcKGG8zhVJ9+oG42AXCkCPlllXX8Xcx7PTs9gJW2ZTSvPLKPAMLeWoDR1NuISr4FtsdgSwqO+WAXAzgd4hBrmbtHxfeLbVi8cjdm+E9lzHskRivQF7GKbMuRgtdDFXHP3S02sgX3niCOlDaFQ5Y1F1y2FEMKKcrAcf/BFVUmDuVhH+BNOrmmIP+sXYglCzrb5Jhj3AVjW1Blt38v2VYDnolitBkFW2+im8lEiHGytRhk+pnOPS+yGgkpbAAFkYve8EXVd1KRJvfd3y/PIpoP15n7tHWT/t/qhXVUCPw3ocHw+TJS9T4a1g64JCn2OFZO410sXCbPHQ9sIyTY88grb2GI/C3oAp4rS4kFmTnb2I32O2tppbcViKLOCGqfEwVcVwh3Acp7w21fMjpa+n+t+MWt7Qv2m58=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iZd7yX9GImF/Y39/LupamfqNzQItKfvy27iSF8nRvSWh/bT9GA/3emu/w05W?=
 =?us-ascii?Q?C3Eg9/cX+fH4jJ4JwAIYKRs5JHVFoq8sRzUqZeRYNTjw2M1I/NX1jC+NFP+e?=
 =?us-ascii?Q?GiJEQr2VqgqDoTQRzXZ98oQBH3Fab+q7LIShN9ntK9FVeoIuI4hP5vhUDzec?=
 =?us-ascii?Q?JZgGBMOvYdZjC2QSsUnogbj+c4jfQe+LlraxlsFVcOrCV7VlEyJyaXphFQ3x?=
 =?us-ascii?Q?2QfZWGmt82U3hrr2BFksq415Fp5xyrwmHazLG+1yzkzo/Z1jB4rADDcj2b5l?=
 =?us-ascii?Q?QI9Er3NAmYy371InM349nae8BAbxmw5RQoLCeWEfBS21Bf7/FsHhDVF6jiw3?=
 =?us-ascii?Q?Li/rM4ATbM7Ilh8ymdDgt4RCWqYaGVvoysI9KZP1P4bgHNeKCETRSAKyi4tf?=
 =?us-ascii?Q?ND/OK+UM1h8hZGWfODyXFDvFXV3XWoqu7k1pyoY2dBXKX+AElcv7x1p8znce?=
 =?us-ascii?Q?s68qlv+t9Nk2f31Vhk3haBI8Y1oyUj3CMYLmM2WTuwTH26pxjNvvS3J4PeJT?=
 =?us-ascii?Q?kb1r/s9hqUKHikzvcUoJeu8640C61bTFHZUDE3buFsLkfR7a4Nbxp9FWyEV0?=
 =?us-ascii?Q?oR7ucpK5BjG0NVM7DqyopbmYYUZjQV9UHDn13g+rkXsnHj1kRBemJLIH19ab?=
 =?us-ascii?Q?6wmpuDKmq1Cu6yqLcgodEKqZFnWUdFuIXlAYL2sbTt9xT0wMPnsQO0DCUMtz?=
 =?us-ascii?Q?0hvozSPrmwsniHWmXDCgW3oS0PEEodp5Tkvv+f+bXfiWr+dOrjA7lOUOKsPY?=
 =?us-ascii?Q?MG0mE9lc94G2AaNW5cGjD0NmtLBxOR2Rp7aESY0Hfw6Et0Ww0XjO67dTYaH9?=
 =?us-ascii?Q?3+IMPIHWkoLtCzWtIt5ZFa2sj20i9K/Hj6OjqMN/dv39hndcCh6eZQvwB1jF?=
 =?us-ascii?Q?OeprAw7ywRwKx3Hla4sAfTkyEMbip+naSeD1q6KI41hJV7hvJABCys6UK/ib?=
 =?us-ascii?Q?O4LbD4kK8Ud9YEAQqXLbouIEdaFbYAbVxnKBmMmhzso6oFUUkVRV5MdDFn1I?=
 =?us-ascii?Q?ftJdQ5sAOjhJhiw29yH9ypF9dhXb/sR+R1anMLopFwXyDVC199J3ufIL67n1?=
 =?us-ascii?Q?gwghj4E+Sd/5sseOFGemiqOPUmj4LHkGyPNZdhnPgc+/usqj6dGJiM7Rj7W7?=
 =?us-ascii?Q?xbEfLle9YXrXgny4fixSUYqXHqe0+ex6XfY1f1+Hl6bz484x+aD+yvRcvgfo?=
 =?us-ascii?Q?XHFleG2r5fjO5p6dD5HDHkLHjU//xjdxsyp0XeXp2OkI7CHBYNYLXhmGBsNB?=
 =?us-ascii?Q?OKxf6L2QFSHiqJ13YY8k2m1CqMA2Ge+4NVotn/l4DxfLKnhFayAbTIII7n3x?=
 =?us-ascii?Q?tDJu8Pv+ZXaX7s7TiW8/deaKgIMXxIxn8OHwtuCKHY1qCvOuTxnd5/PsqLkE?=
 =?us-ascii?Q?waVuJ+I7sc+75csqkF1f6vUTvKYtfnkJPXWVGWgE/vrbhHnFddSnmfTmZeqV?=
 =?us-ascii?Q?0g6rBtAWuzegr7OkbPU0i6iSbHQWJSzoOAg4gCpzXjPS+QRsNfskNTHTgRyZ?=
 =?us-ascii?Q?y5arGvF2R6MkShhgpOJMbjIVqH7swoeEhH4QpNHs6y3Jf1q4Lkcj+8snjdeT?=
 =?us-ascii?Q?n/uN1S2G5Z4ozWOVarKEvrt1wb0SlfGETLY4m85mwdXmUhzLZMabd5z8FJzk?=
 =?us-ascii?Q?4Civ6kzEtFp1grkLJGjojXCWIRPjzVWEvGWBEUdxYRvp53Nd80SfqpPCLbKL?=
 =?us-ascii?Q?CVO7PS9o+bC5cK1QOb6y1Uy/wczZXV7+7PR5L25b8IYeAG8LIvrSJD4IKpjp?=
 =?us-ascii?Q?A4HWvAUGKcLaBoi67HsBML//wsirIsQEWhfcZFqCXd4ZSoTYHrA6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6152dca-9dff-4ca1-00dd-08dee138978b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 23:43:51.1259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BY6vjCtPq2XUSGb9pfS4RTypG06rhwZDtBHynmikJNGct+uysZX3MGZeBYOv222FzSWIl9vrDGgCtW/mNGR6MbpJQF1R+4baXKbFL/lSysC2Tv5mt55l4uzzuAVuQAS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14320


Hi Mark

> > +static const u64 mca_fe_selectable_formats =
> > +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> > +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> > +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> > +
> >  static const struct snd_soc_dai_ops mca_fe_ops = {
> >  	.startup = mca_fe_startup,
> >  	.set_fmt = mca_fe_set_fmt,
> > @@ -706,6 +714,8 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
> >  	.set_tdm_slot = mca_fe_set_tdm_slot,
> >  	.hw_params = mca_fe_hw_params,
> >  	.trigger = mca_fe_trigger,
> > +	.auto_selectable_formats = &mca_fe_selectable_formats,
> > +	.num_auto_selectable_formats = 1,
> 
> Not all combinations are valid here, should we have separate formats for
> _I2S and _LEFT_J cases with the appropriate clock polarity settings so
> we don't autoselect something that doesn't work?

Do you mean some kind of limitation exist on this driver ?
I couldn't find it.

But if there is some kind of limitation that it is impossible and/or
difficult to select format automatically, I think
.auto_selectable_formats is not mandatory. They can use dai_link->dai_fmt
same as today.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
