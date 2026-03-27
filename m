Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8B024503B;
	Fri, 27 Mar 2026 01:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774573881; cv=fail; b=T1juqod9fRBu2GXoBHKnOEz0vBUEVSZekYY7HYa4JkQF5pCNjnySkMt6+zXMxTI43dVpteFTrA9MUexkPj0/HXzkA/Ki6pPh50X4QcHEkCnK5Pj5dYsJLD+s7HtuyjNf/D22AUuXBq85iSP3hoad5nS11ziVWcaW7w6NjTT0dzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774573881; c=relaxed/simple;
	bh=C+vrRCuEKPczSLeBaClaVBxRAjn2iPl7qzmFVSgFjDg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NspZpR0ypapqgvnNlFJ3JnD7rJDMgTOKmem+q65b9jEovqKeHSnMP1K4SNtO5b9Az+X+e9T9vdFn08Vr5Dz8bnPhGvRnZiw8Zug2gVI105eXOFlOdxK+aGdCR79jVBw8lw73XNPnG7dmoygLCs3QPAxbIp/RkKOuwdo4tE5R18M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jw2ncZP4; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jw2ncZP4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roJAfdIh4nB5t3RPdELlD9o+HuEAJ/XozyysjnTzrPzgdrwiwlGZ/+NuWyUqomr7IF+UsIEkXP9Ru5zCN4eE3+lH/zKbGb7YTTB6tJnu8FU6bpEgA6oxloCDbXv/dWxBOYimDMwCh2Y0owNUteSDv+huGfvqv6yLjaSBcBuwGWkzaAdeiPZFxclWiRztfBDBE/jjZ2fuLnA20S6afDPumTkyejwzDfJrUjlxau9MVsvNp8nUgr/XY3GlCO2VhPRkhgObfGznRCuVqkPwJRTwbxlctrSeT8QxUrtGmKerua+n/LTU2z6eUhBe2WHGuYvkmT37WGdoXM4aNvBowLXJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEucSSGzOw1Go3LDd4K+zZb5Lbl+PerlDxKBFrt578M=;
 b=WLrL7g0Lc4KQKnqY8ub8BsGt8GTMK0np5mQj91ggSP0UTNs83dI1dB67gvyrD/K/Dn+wiKxHJncahUR1ITSEUidshTd1YXqumgjwUr8Vxu9ncIPi5G/BBS8/SsBqqPdHzoZ6+V+nPt0BgRvM3q169avFVv/rda9Y1qRU1YmBoy2bWXj8weJlHQNJETzHv7ONtr2bKzTMjmEhsPaWpNBY25KcK0Z2HGD675vGPlbuzj6VSrwBUjDoIzMz3COjqBFuAx8pE3JetShb4anHgZzcFYXZwByZ0jg3KPwmlYQOX61M5jVbn36dqGiqVqV43mCpPbTuDoLGOkXyuyItu5u6VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEucSSGzOw1Go3LDd4K+zZb5Lbl+PerlDxKBFrt578M=;
 b=jw2ncZP4pQzrmxHTiPQHoFJogTEX53nYpUcJ2YJrPPaQ0ussAp5lHBcZ3BMk1hCSGfwEiKMQ02q9nCyOOasr9T0zmnKlixPJwnC6b171OHWduHIDhbsYkZl9Fzahi0A25PoigtQ79+8hXtvrE+uqXgEpQy1yiAOglvtkhfrAkFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB9819.jpnprd01.prod.outlook.com (2603:1096:604:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 01:11:14 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 01:11:14 +0000
Message-ID: <877bqyxej1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: generic: keep fallback dai_name stable across rebind
In-Reply-To: <20260326-asoc-generic-fallback-dai-name-rebind-v1-1-ac9da3cbd606@gmail.com>
References: <20260326-asoc-generic-fallback-dai-name-rebind-v1-1-ac9da3cbd606@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Mar 2026 01:11:14 +0000
X-ClientProxiedBy: TYCP286CA0288.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB9819:EE_
X-MS-Office365-Filtering-Correlation-Id: df2449a9-8ffb-4feb-cff3-08de8b9dbddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vYWJBIQo0AioX2dEm+11ZgVDegrYKCRIwFPwTb0IPYS0IITKM4gsojb52hGPw/eCKJgot7iGH94boi78vLW8T5zQ/iuQrtO9Q+WPtPe4eSM3f2/FsHjCbnMIzvEAZqwDM9G3TcLh+6DNUZRvawhi7wBwAROfGUeCpP9TzUtxH2kTRml2vJ1O+EMJvY/bptC8mqGlKNM3KMwYrcSycqdRLYPpiVIQ1cwoFg1M9hEx0KB31azZ43iz5jTaOOa8cd2c9PKe3n+AgAV34KJ6xPNn5cLlrauRIaQA2L6b5opiSU5D57qdWXDFk4IZ0WTsLPNIGWpt/8fFONmr5NKVbbqOvuYMoBoP+ya6FMJX5jgRmHnk0lhzmxgLuyj/Aes8KSHNH2bt4ZAb053HqS5eTqWIbfAGAxxo9BmqzGncqvbEdSCCEy3nM8sYehoxrrhND13ef82wUy0M6hx4yVUABovT8UwdRhZMhUOlZWdLwR1yAbZgE3dXNVO/4OaSBypXEXERes89pkW+foXlrKwLknRBU8wKDWoTpHUf/4IBKV2CoX7OFoXYpZLFjRTS+qUTNJy9Ks7gZ6nBEYdsnjTZjQ/zvO7peau9I4i6Fkxx7di4sHKUSPMDSXNrDq+Gvg5/cwqAjBPMUM0lvfoGJgycfwaSwfwkCg/TTjHwoJU33V9oCBNlbDvPKWqACuW85k+5zvTbs+hF8HCi6EzyBigjF+/WTUESsjHN2OyllrgQ2aMLMHDKt7vhZl6ybscsXvYEK0phhLohoNQezCznID6fo7Ib4FsakcTaAa6mac+psij65nM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?2R9djoeZOAHykmMfp9HW9JMJvKT0U8EoNyoHY3ETZ9EdE+KYk+Gafrz0Gj?=
 =?iso-8859-1?Q?nFFtZn4um+uEeBZOQ1bVUBM/OoZub06hvMzOvNGMdPsHHWJcNX8/23QXiQ?=
 =?iso-8859-1?Q?KChOB+RxyRAWE3KwFyQO3Bf9ep8g/DDAY17LPjW3rPHVJPID6IRB2sGPUC?=
 =?iso-8859-1?Q?UzCEH1VvfSPYgVSLHly07O1UWD5ZBAxmQBh2iu01m0fy1GQfX5cQzdL0f4?=
 =?iso-8859-1?Q?vAku7ERXBRIl9gSqwiZ0XedGW4c5tKJoPIpjL7X6ed7ul1yd/62JC66Si/?=
 =?iso-8859-1?Q?s9JmHzSvqGUabDNn6NCr3VAoDrKedYLeAgfdMBzyc5qCYzr5YY2GHJLvpi?=
 =?iso-8859-1?Q?lrlwpe9ZPGlgZlCu6/VT/sxYRTjPb2fzGR1H2aqq/kdHM+wSFasoEm+JeF?=
 =?iso-8859-1?Q?LJ/SvTqdYd1Gnxmj4wvrFzKJ9/fN5bVhKdErlJAr6MWvv+wsfzirkXNddc?=
 =?iso-8859-1?Q?BJzFPOdjuxMF07sqWnVrEvdTgLf4JOplLJt0ucXYZglgBmEsYQBnGRBKpt?=
 =?iso-8859-1?Q?ruyKRnBOrBdSlFjtjr3cvCytMqOcbzN0ZLq2KJ8rE93fL4ZPva9WFiMOy2?=
 =?iso-8859-1?Q?8E1qOgnFgQSADKcbYXY1vxIlpgnILc2VKOV2VYogNbJZpdbKCIusqzIDjs?=
 =?iso-8859-1?Q?/ae03Fkng3A8s6UynSC26Pfs7yyK3BybstwsLcCkxkhKtnfx8JwUlXubZZ?=
 =?iso-8859-1?Q?fPlYRtbVP1g2RddGlElfDs51+IDu42CNMXMlHpUMRQKVq2ZwLxakmDvNpM?=
 =?iso-8859-1?Q?kjRC1w4i6ZjGzBtU8gwYvPy0DOfLVV6MNkCVu+iyXqj9XAPVoJjJpQjF/K?=
 =?iso-8859-1?Q?459ZTwEMeOYw0TY9ht1+nvEBN3AQx2tZGK/IGkWfr4fOOtP5wxm7sb2jaT?=
 =?iso-8859-1?Q?A91hzE72g/oKgxXAWclNNNyIB+mlW4mHCK0xC9RIdCgMvBTVT1neI0pEJn?=
 =?iso-8859-1?Q?Fk7ymdsTtw/ZRLEQyXqas84rTohy60nGW1KO/ZhzthIE9FhYFKjJH5vEdF?=
 =?iso-8859-1?Q?lelX+NPYc2NU0UkfU/z7JTz8PF5SRfKfYQuAop4AtFebuv1DgOVhcbfVzd?=
 =?iso-8859-1?Q?W27fxc3sQaJxuKP9G2LOrZkhqbcp781mLLBqLhKVEbwXcZEY1KiJlYe9Q8?=
 =?iso-8859-1?Q?NByileWHnKZIjxrowyYo49tHdUZ822HnmZogR7ElGum/2QxvptJ0My6SPG?=
 =?iso-8859-1?Q?Aakbj/4ulKxiQqvGizkacZs6H989CjJtqeLLWuLaUfJL8aJd8NMu6wKmR9?=
 =?iso-8859-1?Q?p9WUD3PdlBzW6jW8J8v10Yaiz4BOLeVADWI89z6Q/SJ1izrtiovck9izXO?=
 =?iso-8859-1?Q?U3m7AGNgJGi2KoP/YZT2J/WH8y35ktTKdrkuyKhmAqVWuRD317USMy5Qy7?=
 =?iso-8859-1?Q?PHy0U/5ZQyIMLFGBERnbae4anxsJBQ/FvvplLFmYFj3iCQ8aqbwlyJl0KO?=
 =?iso-8859-1?Q?AUs92kcPzGz6lYbVYwDraERFa7nDxbxV9T0FE2IE1Jul+X4x2qcKCtjElE?=
 =?iso-8859-1?Q?HA0Bywv18JFWDXB2n9otumIUAt2Sk3KY8UktxCRPGBpLIiwN0f20Y4QDpW?=
 =?iso-8859-1?Q?On6rFYs9EzGh1hmhzcCo5N/cvhbDC/ski5zg4FfyWlKTLuz6HUr4VlcgoR?=
 =?iso-8859-1?Q?0x6Iqul2bVVzCcCGv3JuIyATnaSWk02mr7wVNzB37ouQotuzCrL+elvqvP?=
 =?iso-8859-1?Q?ajAxpKGjxtg07Vhts9pMr8yyeljcHAqxS4PoqYsuow/sCsk2Yv4cQ2RIrL?=
 =?iso-8859-1?Q?3toqIaQ1zLTlFWJb+Ov8d8SuOaD1HWgLLAcKBCXf3RpFtK5Oa21mfU3okU?=
 =?iso-8859-1?Q?dX1sEQnCyrx5Rgssd9G8O8b/5iSuF9eeokAavkN57VK+7Bi/kmm/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2449a9-8ffb-4feb-cff3-08de8b9dbddf
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 01:11:14.5755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6X1jdxpM/DW9A8StWyeb2aFrliUm6IjjtEDm5H50inIm34ZQ9nAJc2bBzr4v46Qky/llwsop09dCazN0gGWk+uM11ERZRN9zPNFNljisY173QJe2BoXh++OdJMwNU++
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9819


Hi C=E1ssio

Thank you for your patch

> simple_parse_dai() and graph_util_parse_dai() first try to identify a
> DAI via dai_args. When that works the card can rebind without relying on
> dlc->dai_name.
>=20
> The fallback path still calls snd_soc_get_dlc(), which returns a
> borrowed dai_name pointer. If the CPU or codec component is unbound
> while the sound card stays registered, the generic card keeps that
> pointer and the next rebind may compare stale memory while matching the
> DAI.
>=20
> Stage the fallback result in a temporary dai_link_component and move
> only a card-owned copy of dai_name into the live link component. Use
> devm_kstrdup_const() so static names are reused and dynamic ones remain
> valid for the lifetime of the card device.
>=20
> Signed-off-by: C=E1ssio Gabriel <cassiogabrielcontato@gmail.com>
> ---

It looks good to me.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

1 concern is that this function is using goto, ad your code is fixing
(A) part.

	int graph_util_parse_dai(...)
	{
		...
		dai =3D snd_soc_get_dai_via_args(...);
		if (dai) {
			...
=3D>			goto parse_dai_end;
		}

(A)		...

	parse_dai_end:
		...
	}


I think it is good timing to use if-else here ?

	int graph_util_parse_dai(...)
	{
		...
		dai =3D snd_soc_get_dai_via_args(...);
		if (dai) {
			...
+		} else {
+ (A)			...
+		}
		...
	}



Thank you for your help !!

Best regards
---
Kuninori Morimoto
