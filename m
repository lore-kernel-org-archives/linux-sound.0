Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B1433F37A
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 23:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783036467; cv=fail; b=CAS5K1xD+CNvnN33amrou+EDqXmY9pRyppqI3sOBIhMxVhKd3i8c0vvXjcOZO1J1WkpAfFgtjARq0rrBrDk9ACuPoC9AXdnjOvMIEtWTta6jn3EYpAh7MKaWya9pmMwexmI0JR9ISCEL/bdasrU8CLdXWPjJKN8L5v7QpZjKmCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783036467; c=relaxed/simple;
	bh=aGSHZbTZya/uzoCrht6ODRKYjw5gLQ8uKC0iqTL4x5Y=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CquDoq3enwgN6SD1CtVkGWPKiRUx0GFkImTSoI1y1T2t9RXkg0czDRuU/nDJoI47DjNYXXZtA59PqgA0Zsq0VjhfNt98Dj6IdVIe/qbg16dELm2ZCxWiyyVUEdVnIDwGgrnAfAgY+gGxhsM2d28qDhiK0MavgI9w/RsR/nsxOhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=D3nGwE7q; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="D3nGwE7q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwheKDFFuB19B/Qhyx381dyB010C8sCycMGekbWpLml37AEu38e80JF9SBe7Gzb2p41U/Wgz+7D1GRBMa1SF+QMw8z8eTDsA6al1qbAPsW8zvgMdIbx+PzcKqyBA6aMurXJPw0aEeq9r1zjRh11UqXRIPcNGlDCACsqIK2N2TuYejkEZqDMNWR5svsgxwSHpw53hEd1T/p4pBLXK/X/ei71eiGMMrjXeMSDKNiW/79MfokS2aIwSQERgCSc9VbGsjvm84GhDofoqdbpcWyDJaY3qZOBx/PVHUPRYegqLDUxIx5UnNGDM1rxetKlXyXd4p7dyIa9QyCi4qbDyZmw4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99j0criUXgWu2kwG4VZ/BsRjtAs+YlOSMZf5EJ+6bns=;
 b=u+pZ86FENp6j/EgwoGYh2abDrgp3DaNLBYah1AnF6Ik2Y0zeZ6vBWoBx92ZOcw0pUfBHaUvWDR2H//rXpLUBfpVUDQigOr9phpwABY6e+bdhvLpm10lW9svAmMp3VCDH0BQ7a8qDFfbSFweOx/z6nGRiZWpy6fTMQqc5kpEHxpfc2+NeWCgFcBHC+FoUNGDA9dq+3sqhtFYfUZHxPMTcwemUZ9Fbt851YF1zBGZuKMPALl6olBOxwhHGGqcmz6TIAt3+GFWdRdtQo09lvmNZa8hM2/NSbm7/acZIcecdRjJ+UJAkE4Vz9ZlZicsZhSOsrS7OOr+iYlr85HbzKpPRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99j0criUXgWu2kwG4VZ/BsRjtAs+YlOSMZf5EJ+6bns=;
 b=D3nGwE7qaO3b5g3JAliqPsXwJAKLC4u0jMYL2aNqNe9j4dGJ3RsFgksDV+J7NeZQ7M0gjiyQ95bkSoxkKyNxm+MNe6jjZLh/QPliwdAYnmNTuszMXkhube/rTAuAaDyjrPB8hnZWOSxLDQU6KHH/j/HchYlqZSmepcap0vkPoCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB12964.jpnprd01.prod.outlook.com (2603:1096:405:1c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 23:54:22 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Thu, 2 Jul 2026
 23:54:22 +0000
Message-ID: <8733y16j82.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood
	<lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>,
	Mark Brown
	<broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai
	<tiwai@suse.com>
Subject: Re: [PATCH 0/5] ASoC: intel: use component_name for Component name
In-Reply-To: <cf0cf8ba-f47d-40bb-8321-47a7054e2027@intel.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
	<d5e3fc22-8a17-4672-ba5f-167d8cab2aa8@intel.com>
	<87se66dyqp.wl-kuninori.morimoto.gx@renesas.com>
	<2965d6d5-6cf0-4fba-97a0-7a97861fbbaa@intel.com>
	<87o6grd4ol.wl-kuninori.morimoto.gx@renesas.com>
	<dfb5efcd-6c9a-462d-85f7-e8fff3ded624@intel.com>
	<87zf0axr11.wl-kuninori.morimoto.gx@renesas.com>
	<87wlvevtgo.wl-kuninori.morimoto.gx@renesas.com>
	<cf0cf8ba-f47d-40bb-8321-47a7054e2027@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 23:54:21 +0000
X-ClientProxiedBy: TY4P286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB12964:EE_
X-MS-Office365-Filtering-Correlation-Id: c24e5b18-6178-441f-1537-08ded8953cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|52116014|1800799024|366016|11063799006|4143699003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	o0FqrPCkWArpBoQJ8QWZCDQvcV8ksfp8lkP8dsJOl6xTS09iy9Vx3tcaRaJWQFHR235JyS55GHV0DdXykL/ZuJLnWYDc3FXhipUHfl/qkOjBFGYdzgH8pPSt5MiRh/8FICj7/bnBefJZEtE9tolMpIyKJdnxVfNbViTbU5mJYFZ/8Z60bJQETIp1CmneKx3PX0ZP5y0Ln+L8Wcbx+rGC8+ytFVp0JvtWD0Xh5o6EVF/fbw/Lknq3zTdARjh2kKSpzmv1X/z6xZJsK5mVjCQXiPZMkSlby7LaEgeq36LkXVltJQVpOrzhMBvVtddE89QAzyeKGhLSSmnQL1dLQvIiBGBzlEQQzNvFq2LnZTgXPFkkZfZ5KTWX0WZ1ZyRql4GMQmUJLNrNdHyaLylOo+8Vrwuk29uF/ti9VBY2e9dSdNrVKqMFKL2M4H60JypEOQVR726Qek+e7G4B927DZGdgehOQlFu293OAMLwQ4xclwXNlvi2uHZ5hNSn5qJn1+LQVP7eErk+F9Mu7IrDHeCpht7ZK/afl/C3JW2KOY8AD6zVCuaPKVD1BTic5luUp3Dv/trDrcjQV4y/RJ93nHYaeLzbTJ1u25NwAGuLfUPeWqIBzz99K/o0qROXxtFRo7N16NuhQJ6TgrcpNrJ/mHurBzoXBj1Jd9jWATP1bGpbqYvezI2uZM5PGrLoMXGUvvJaTTSed4mYAtLvJY2+AV+XHhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(52116014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8E1r/+rO3KHHm08Te5Wwz0tUyla3GZFgSTiT55pEjgDsD1oUe/laoO98W0pw?=
 =?us-ascii?Q?kYie16DO9qAfVlcoFDZrwVl4FYoYw7C2fz2KLbfd6uHK7pIAFUvuWS5rXZFJ?=
 =?us-ascii?Q?ps8vCabTbRI7CaWhN25m8Rg9S2K/448gBhk1DpeOXDsZVxnm3NEYITsxWpVs?=
 =?us-ascii?Q?Y4ZrC0TMeitUp2RtAeheCfi/9sb2XvjlwkLEnW7z5tgPrN/5kZymqWLl9r9L?=
 =?us-ascii?Q?OywGrY7xP2ZuQrtStezJgcVORTNCbE26ILfY9hoXaSZXZKiYlPsIz5oktssp?=
 =?us-ascii?Q?mXeb3qMP2PqTr0FBP+P4ivWFRNpSAswCdGAJckwriI3rLSEaPGptCckO5exK?=
 =?us-ascii?Q?68bSz4ORIN4txx+QQzMv/209DM0anQXwiPOVszWK8B+0ZCf3bNMQ8cjnvf/C?=
 =?us-ascii?Q?f188d3HP87XtyslvtQ9vIEBdLFmzfZSzyW6jQInRW6MUoUx+AOpoLx3NEX8g?=
 =?us-ascii?Q?QgrDxr43qO4+Nuuzy6PVEbDEmieAlS0anz0MgonHPuZwHFrXbX+pGkz2LU1b?=
 =?us-ascii?Q?q9q8Xy5YXjDwvrvNsCQKKXCTqwza9VZE6NPOb8ELy/W8lm34/EYTpvZf0LJ5?=
 =?us-ascii?Q?40XKfGC1JUqCnP3hyxTozgbsgvtkWJxhqXEg36ZgUdLyRc7TstVdsBKXkxn3?=
 =?us-ascii?Q?nU2Bpq6RpKo4eVf+kOgW0L33W+WGKrIz9zf79Q51yj1B5i7VwiE7OmD5otMZ?=
 =?us-ascii?Q?L9W5arbbXgQf+IgdsL+oze48t4lxB+mmYyPtnIO19If52PydMl+OgbvcNJnB?=
 =?us-ascii?Q?1/dV/rv9NmMFbib2bs99HX/wqqsHsfX+AWB1mE7RtY+itQXIbF75GVTC9AZS?=
 =?us-ascii?Q?uTtVAP2km0gFM8DYiHTv8sKLWsQGK1L5ekrF0MSVl25TL0b2aYjmN0lWR+cy?=
 =?us-ascii?Q?uOp3Cz1OEc1vV/vxVpc1ZfRDBwApoJudnq5q06LZYalSg2PGvSnuLVH6hqz8?=
 =?us-ascii?Q?Nz/cWm0yZVxFnJ+Wz45UI5pSgU8i2JqrP8eeR8ndU3Q89PFpFgESCvfF6P/a?=
 =?us-ascii?Q?QuZwD+Op4SZHRpZY2DeMr+B646I1nlLwz7tZ+sCFXbM7xShrnZpGRu0itoRP?=
 =?us-ascii?Q?+uy2m89URggo5HaeUO0o9Ey7K/UhVlx27buoVhXssO8iVVd0DQuaPHlfLSQu?=
 =?us-ascii?Q?20AyC4pfTexekEiP7mEtQWNo1UHGuonFV6PxwPO5gBNvJBhrXyNRPq90Aa+u?=
 =?us-ascii?Q?88rJDM9GF8ytsrENU25HpoNokocf+giyJQy7mU7EfpKeBtnPTnekDKVkmCXz?=
 =?us-ascii?Q?MuUL00f+1CfcJz90BnTtBzj5yuyK8f6lcNxht18tSUdrnpvCeET4r5/vDf55?=
 =?us-ascii?Q?xHZ5Ndbf1cnRQzulZP1FKZ3mnhVvjnt/aOSBycR3oPn7AHvHPnPpKa8xAxRc?=
 =?us-ascii?Q?FMuoz6GQh7vOTIk5yuOE4KorzF5lKzxEvn+OpD9Gftj0U4UKOOu0+oh6t1pt?=
 =?us-ascii?Q?YV1JQ+HxcFBN+1wCb4x4glFcNDvJ5FA195GDGbG/RXz4mp/WeSlSLES/aMYC?=
 =?us-ascii?Q?6DrplhlgC3FdouIjcXtokYK2PNJ1LVNP2pmo3Tztcr5/ItsoiqA0CBwKUIGC?=
 =?us-ascii?Q?nv/KnwdCqPIoNDhAfmx2uvzBoHzur36saZ+VLBN9Kg56JgHtwON1alXhqujU?=
 =?us-ascii?Q?8q0KjOYDkU57Nd5UMbLwru/5VGuFcbyEXOf6iU6wFyiaFcsfeTwtLSc7PorK?=
 =?us-ascii?Q?UkciScJ7VN+C9xpEAnjVX7fDtFcO66GGhuz1yb2uqkSBi5icfilqRtWHV8QG?=
 =?us-ascii?Q?4OuRCxCrHVzhhBvOYSEwWhSTXGj8kGIbmhqIui68srWdv9drlLG5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24e5b18-6178-441f-1537-08ded8953cda
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 23:54:21.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xb+tNCrQ/zmFrPbZORiPDNa2lZd2F0rKFboiWDnjsVQL0aAareNPXEa5LEGSs7r183pNJfuV3+v+Lx6Su5Y2eDrndaxCN4MQBziA6GlAAA9o4efv+vJFp5uAE/msONJE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12964


Hi Cezary

Thank you for your feedback

> > I reconsidered about your opinion (= flexibility), and is your concern that
> > we might have new component->xxx in the future which is Component specific
> > (= not Component driver specific) ?
> 
> Precisely!

OK, Now I could understand your opinion !
And yes I 100% agree.

> Yes, that's why I've explicitly provided an example for component->name 
> earlier:
> 
> 	snd_soc_component_name()
> 	snd_soc_component_set_name()

OK.
But 1 concern here is that if we use "set", we want to have "get".
But I prefer to use snd_soc_component_name() (= not get).

This is just a naming balance. I want to use...

	snd_soc_component_name()
	snd_soc_component_attach_name()

>	snd_soc_component_initialize(component, ...);	(A)
>	snd_soc_component_add(component, ...);		(B)
(snip)
>	snd_soc_register_component(component, ...); // = (A) + (B)

Actually, my 1st motivation to do create this patch-set was this
unbalance. basically people use

	snd_soc_register_component();
	snd_soc_unregister_component();

It is easy to understand.
But, the code which want to set component->name, it is

	snd_soc_component_initialize(component, ...);	(A)
	snd_soc_component_add(component, ...);		(B)
	snd_soc_unregister_component();

It is a really minor thing, but this kind of unbalance really
bothers me... I'm happy if we can have register func = (A) + (B).

> Without getters/setters, soon I won't be the only one complaining about 
> the lack of flexibility.  Anyhow, I'm going to continue in the follow up 
> thread you've posted.

Thank you for your help/review !!

Best regards
---
Kuninori Morimoto
