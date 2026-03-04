Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD61324BBF4
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 04:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772598176; cv=fail; b=K+0GGlMgBmbscyj1T5u9XueApQr88LRlpYRuOp1LG6AQIR5AadfZQQRWY+YPm4U6ht1iy5HyCc5EWajej4jxxCrJ4KmuoRvQTQhoi08fgXVfPbBySLm/l117tfdmagqqLSZhZxzqpzPw29xFBnhqguIKGdrQDSpTcx6NDA1/ov4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772598176; c=relaxed/simple;
	bh=1F9BYMxDCH8HQ7WN03I2oPU/x6QSzqnASVKCioIDUo4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TNCaQHPNHB7m8fHd3kbHVJrkZJO5jC0vqDglFTeGBRWQVaHuzMjGIdnIerCtoXadBM69nLEjTxwpl70wU/Ey5kzCpUZM0+ZGs7dA/g2mNio4HXKlawrVCQXLqUgSAXjWmq+UOTTNCch3VJDZrsT+k5rs8apgBi4B5hhV1DYnwzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TyabW55g; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TyabW55g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCunEKcEhvPmZD9pMYoJCIhSZNu2yrylhsVtLZ4fL5qyIH4wvXBHC6pWxcoZGUeQwgDHxoY0RW8wMvnC4qQAXYuoVOO4+lw8oVyYO/5VU5/IWrDtgTWn8djW80ezui16t1niKgJi7bo0Ai70u3lLBW4W/C0BLP7hjNLhcijtliGfjiiZg6v/Mo4p/Dy8Ubiip6IW67W04I5TJ0i8aL5d2gSQrKe5D01j6EhSsMVUsxZMFCUGpknaSLyIMOIqvCIi5LuYzn4rziAr8LENrhhR/yIPOc5KCffgUeGDBm36xrlowgcvdQsWLxUJ/GbuVE7PvQq3DL/ay9NzL0jjtNdpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhowpT03yEk/aNbV+czyBGMbFDutJ1xHwgSqiISa3pw=;
 b=LERcWLHLg7+fskccBhrZVXJPyy9q+/6PYI074CdHQDMZnSh5wAmmOEDZG/0P6qHtSWi87lxl39MEOH/QuYkhBx60duSMjR6+Tfcls53oMXR79NknIbPTXepPAKSeHO1pabjRN6lbeltDD7rxMbCIdhBMILiCGpVRHBfOl4d6HQqY7IMcTjWomCxfmw01TGARrCS632AZxLB7cQsUy4V5CflROrARoTF8E0Vf6mNF4J0xemHkrGvsOrw8Aq57y7lOBbA4h5MPcbp5Wd09gu8ke5bZg5RdI5d2elGKiBYm+4aFYgtNxROBEX9Y42WouFmCI8ugJWM/YLV6TSnR5VodqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhowpT03yEk/aNbV+czyBGMbFDutJ1xHwgSqiISa3pw=;
 b=TyabW55g0039hXDbJlao+SdtQFFz9y4SVKE/Lic2xFsPIL14tIdcdUVgrjAwZ+e5Z+FAZfX2xbew7DI6WXsjzLl2FlgaZCaCVAlncPfsDoa+JpC7lXWd/XgI2tgJpJLpnnxXBxQ7hRZBsdnavpBNJ8qMFGtrZch77Ggb69HmSZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYWPR01MB10805.jpnprd01.prod.outlook.com (2603:1096:400:2a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 04:22:48 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 04:22:48 +0000
Message-ID: <87zf4op6jt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH][need test] ASoC: core: cleanup card rebinding
In-Reply-To: <871pi0qvv1.wl-kuninori.morimoto.gx@renesas.com>
References: <871pi0qvv1.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 Mar 2026 04:22:47 +0000
X-ClientProxiedBy: OS0PR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:604:9a::31) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYWPR01MB10805:EE_
X-MS-Office365-Filtering-Correlation-Id: 554b6465-7aa4-4ce0-5ec2-08de79a5b0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	fZolAyB/C5tTjktnQmfTmGvTRPuBiSP17SI9nu8cFoFKaUOWrSqATJC5ylTJBoqSbicKdaKlRnF92qYZdBSH6L92k3IlG2sk70GbL6SrLZXyAO50o1WkKetMgIaJXyOvHyU1mREht2GH3pNV5bv5Qn0/cELtF+gaYkK7W2qqa4dhJ3YdQMLd/+a0er4BgeLAyNkDD9yQwRA1f6/Qfu/U00gn/smG+3C10IJpTh3qfUR9XjGotgBLHwrGFqEjIskjKNqS4ubS4CMisvBDNsl7YUp4NpTq7twWLz4T5HgcweZSRTAXWTzGDzw4EfUbuQsIrbzUQ5MbtNwZikxYzVVsYcjzLYtaI2XfRYNEQwI5zExfeE1snI0n4TG3G1uDfMx0Dp8n7GSXXEQ/mVJhEYZHtrmDKO+kMocgrguIuCwKRq0+dy7eLSeUwjDSvOmuh2V0JgfT4K9TkrZEox8oJT4hfBkwOjivDu+Au4TVhuQbIROnMPg7dfaA2SFzH75lCJalJgdPaXUrqY1C05IJS55PArb8Lcps0UxYBoKdCYq+M8WwzNqAVA461oo7Pms4jxvg20HO8KaWQspM1T1LD/FSvm9eD4bC2/BVkaWhUdPJxdHMLQEaWIushH5Q2TpbJ1L78Ei1ycCkBE6YsMd6McysIYPckfe9pBny7chkGry+aRKzhLEpdrIhNmHCG6yDztGk3RZvDMhzJDIQBhYZiYTTq1ZBgN7ax3kMtIhg5YEV0rGJovD+Zyf0gpeJ6r6CNaDA8fVTo6hCo0yiohVa4IiskOSQBWjmNmUGMbrv1vYwhck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?v3tLNbMrg8Ym2/pQgXWTPPgzpEfdQsohI1+YKtHTcaJiv7EhkyEBYWbn+Z?=
 =?iso-8859-2?Q?FjkBv+nlpdhSHgUmoChosHyuD7tfrIqvHM3Oah4AbgTvnwXy9LmNSQp+4o?=
 =?iso-8859-2?Q?rIgfPqjFWw54h+dKMpVSZsii5FmB3Zk+gaozkrGatGISSFPXuCjKTAVAZk?=
 =?iso-8859-2?Q?syNtGbeg9J/s3UxEyI+3q2XK2+Ev4DLfcJt2o2CqzFnxC8BOq5/bJ3eEFD?=
 =?iso-8859-2?Q?5+9isF8Sax3sXrDOjXaJnIXSIa072lfCfdHW/73/jy7L2wEC4k4GmrnPPQ?=
 =?iso-8859-2?Q?tJx7rvMC6g9yanKaDAzM60WSbbhN1YikWcXhAdzGPeGyNyYuJDS3TElYeO?=
 =?iso-8859-2?Q?nH4ls3awdFv+nkJJ2c+kcqWN7jxHk2sZf348EdSQF0+LjnbZfBOeM/EpCG?=
 =?iso-8859-2?Q?ZG84pzL6vaIe08qdvjv512ATznFbWKwd4rKqoOhRP1q+SBUVcnC6c8R5bH?=
 =?iso-8859-2?Q?0yc4WNm96I78QDrNUuA1+dJ29XzR1RJ9fbqFuq2RtAGle7bLkqLkzmYUiU?=
 =?iso-8859-2?Q?seZ5r83Pxqtiy1HMx/UmrG7+gQIUUIUZGZ3OHc7C4BmamBqNbwrsGHllly?=
 =?iso-8859-2?Q?49aaMdMhTFCAB8mt+sjyDBL3FKG7QOtWgA0ctU8Zpo71rBIFGeeLxvL/oy?=
 =?iso-8859-2?Q?WnPM+COc7mp5LIZSrelPdY7dCZ720IFAG+jBc6WXYOqftLFmIHpFv5OZS+?=
 =?iso-8859-2?Q?LPPvGId+BCq59JjRCMzm0OMQKtwKSkv6LRpSNbkRixyRzkmyLhjQn1klT1?=
 =?iso-8859-2?Q?97hx0nAewTHdYYbtjz6aKjiBBgUYghy3Wlx5V7pk49djijRdhxF1yxAuLj?=
 =?iso-8859-2?Q?tHIko/FhzAWJO/j/5l9DmfhZkGRtzHCJ1Nfw2LJ4nXgGDe0m7fLixQUkwv?=
 =?iso-8859-2?Q?4SsoLNoqPHPCsAfYlq4ucyzamgamchdFt7c5iRLeD/VmL/DiogU5fvKe9W?=
 =?iso-8859-2?Q?7oQ448kRdqG+jwEb/vKsXr7CN3aTdXLO6t/JSNqXK3PkMJYU5MeEiT9Chl?=
 =?iso-8859-2?Q?kIfX6283sJmJFPFoBMvPi7WKP5yrJ169F5pYIO8eG3rDEETbQhvt1DJCsN?=
 =?iso-8859-2?Q?DX5OP53cYQYSWiZrShtnsSs+Dy6TScuZJCnKDTw6LQWa9M6kIJbMRrHVN6?=
 =?iso-8859-2?Q?VdIPi41D0+LqTSjkmKLWf8p6A1hmb5zBz+c8iB4wfe9/rb2XRhcYY3bZzT?=
 =?iso-8859-2?Q?SkcPFRV61rpuRaNb0gybNR1mizOL/PKzweVSdLdOubxfnrwnCOlRLuWWar?=
 =?iso-8859-2?Q?pRRk+c2tZwgyHvfeTHrbABvWAxnyEvKK31LJ5sXHzmRIXAsA+cn0bkciFf?=
 =?iso-8859-2?Q?GIJbEwU11B31LXoK50uhmXNi2RIn0mVvHNFiWMyVotxY3E4EmJVNFP5OQl?=
 =?iso-8859-2?Q?iq0HT5XuOpml5BGcY4CAavcJRLEksonXTmQGViYTmFQOlTzBfjri0a9k/x?=
 =?iso-8859-2?Q?o8ExAu6Hm9BZzs1ROgRh0EGFK4wqOIg4BwQIfIo88NvyiGzCkKYiWd4ZKy?=
 =?iso-8859-2?Q?MSXbdtJUhFRQQT4e7p9HPbZr1Olq/cLjgUSCNUtpEVHrALqUHogNDk82tR?=
 =?iso-8859-2?Q?RVv9u/ACiNK9dTqdB7zlt5RKe26ow9FWEJivbK/nM35x+UJzcdjewvgT2Q?=
 =?iso-8859-2?Q?j3UqlcRIaS5XlC2q8IxDH30wQ0Zs71EJz/oWSXQHft9ZonRBaVDXyBIsB3?=
 =?iso-8859-2?Q?HJ9TtR0LBnOfuSq1/VP8UMMiuCgTqP25OM3Ty4om9DKok33CLiSwopuaN1?=
 =?iso-8859-2?Q?FBfGLt4M9c2w6+oMzT7VL/om3cdSOe7U050K/OT4/Mhc9RN+dAEqPJWi38?=
 =?iso-8859-2?Q?zveMiqgiuDpjlUL8I/dRofQi4glP0G+1rcCTQPOUpqp0s9LoBMuq?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554b6465-7aa4-4ce0-5ec2-08de79a5b0ea
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 04:22:47.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Fzpa9a7OPg5Bp3OHMUfMe2wJfaUrr9bXtL/37824F9gNN4wdsOo8f5hR/jTAuOmNvvHb3+LBim0jCri3GKtwgAPjaO2ssWmugfYOkKZMhz6jE6l0G+E/lIu4DzINCQE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10805


Hi Mark, Cezary, Amadeusz

> commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding")
> supports complete card rebinding, but it uses unbalanced pair functions
> It added devm_snd_soc_bind_card() (=3D bind), but its inverse function is
> snd_soc_unregister_card() (=3D unregister), and it adds new
> devm_snd_soc_register_deferrable_card() (=3D register), but it doesn't ha=
ve
> inverse function (=3D merged with above inverse of bind function).
>=20
> Thus, it is difficult to understand, and difficult to cleanup soc-core.c.
> This patch cleanup the rebinding code.
>=20
> The rebind method to connecting to "unbind_card_list" is merged into
> snd_soc_{bind/unbind}_card() which are used from all drivers.
> This means no need to use special bind function
> (=3D devm_snd_soc_register_deferrable_card()) to use complete card rebind=
ing.
>=20
> When it bind the card, and if it failed with -EPROBE_DEFER, the card was
> added into unbind_card_list (=3D snd_soc_bind_card()).
>=20
> When it unbind the card, and if it it needs to be reused, the card was
> added into unbind_card_list. If not reused, the card will be just removed=
.
> (=3D snd_soc_unbind_card())
>=20
> Because snd_soc_card will be capsuled soon, separated from mutex_lock()
> (=3D client_mutex is soc-core local).
>=20
> It renames function name. Will be moved to soc-card.c soon.
> 	snd_soc_bind_card()	-> soc_card_bind()
> 	snd_soc_unbind_card()	-> soc_card_unbind()
>=20
> All Card user will use complete card rebinding by this patch.
>=20
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Cc: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>,
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

I noticed that this patch has issue around mutex (client_mutex).
Will post v2 soon

Thank you for your help !!

Best regards
---
Kuninori Morimoto
