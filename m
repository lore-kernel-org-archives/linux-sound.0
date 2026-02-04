Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241C41917FB
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 05:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770184761; cv=fail; b=AXvp+gwLdZms9D0+cMeCkoo20/2PPCxXwhx+xzh0ka+R8uJYTm/EpZcjB3PEKjSILrAlaOzK8gOdK4TFXf175ZqvYc8kIVS22ksU4ck3j27J5omDr5zRZMxwLmrhWiCSC9BGBLt7fQle3TvBeGt3yoYYKVa1XDlIFrhek/Shu5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770184761; c=relaxed/simple;
	bh=mnctslATmn/X6ukTUImrIODEH8ZbbR+hWt5ZeuL3ldo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=myxLhZu9FBugBwQ7INK/pNUcWeAxSvWXqaUiIvrfVarAheWhoaUlAN5hxN42ukOlIqt1jJ0El8x4npWpWRI3huELjPuPp+CbvNxU2XkfKuESkQKOtAfKHSo38efMTxkcucZ5OPdQDI5NAIPYXeTSJSJzCiUGXTp5H4/oIx4n6oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BhY+3YD8; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BhY+3YD8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhMGR4yi1dQsdHPWP38GKiTQq11ShnyeWqk2nROrn7YO+AcpSBLDcbYP2mWT1EMkSLTGAicuRVX8qDrH/VJDb/85i4aj7teyLJ9S+zn3toDiekoMB0hCKzDoEaxxzCGHhMJCTA4BCy7M0XOdkQjaqdKb+HMR5YxcXVPHNklGZ3VyLFrDYd56w4iE/2rUAfGJ+G3eLwL0K0zL2oKWeIWrPM5W7i/pvmrDmRqFEVxsQQCdTNWM/KOrBwu9KuE8ttZRfJWbi/uIoFeTAzxvC6rhkAAQeRHHSnBeSlBFYiFo9xOn5zAoUxODXQN2TsZ8q5D9MpnfY6xJhiLKXxolZM/Q3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULu3W8P+/7UOG0q7wta9y4EqJpmx1JcXmcxJXzBmjUI=;
 b=EUQeiWJ/wtMU9h3XmqNVET8wUVgcfLGPS4ElcalysZYhx+oSPGHzGhfjUUzh5Dvoq4YBUbpwu6R+N65UN/c+AF6to443YwUwzYt/8HgNcGqjB8vB+4fsOWhhR6t8nsKSqBTNctWCkZCmHjnvIF1O/Qhp62gNyUCIDTy0tAeNSF3VASuEpUgwo9uuovuRL2PuezJqgxtb7E7D1A+35oZYmG6I9fz44NHId0JzG3gYvZuEh5jV2gkTmPFUlw1fUDGUHYrzWRpQQc7AQO7dsL9T8Xi0D4aOVnGoukncYN4vOub5TYPKxnD0MEi1Yrk/omI02OcJOnOTC+//2efy8NNhEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULu3W8P+/7UOG0q7wta9y4EqJpmx1JcXmcxJXzBmjUI=;
 b=BhY+3YD82n3k8e/PiJqgbLHB3YvkyCggdlkjY9iuKs/2c0l9qB7d9kqe4MWKKWk8RuAfw44+PrkolKgibPvlPoGgdli0uRUuEYSTE0EHYc7RVRo+CHYwvB0lALEcC8Td6jJ0H9ug7YnXH+5L/quL9GXW8NnqBlLwSNUR2f/usDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY4PR01MB15073.jpnprd01.prod.outlook.com (2603:1096:405:280::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 05:59:17 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 05:59:17 +0000
Message-ID: <871pj1gibu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Linux-ALSA <linux-sound@vger.kernel.org>,
 Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
In-Reply-To: <45fde0f3-39b3-414e-b866-bb445df369b0@sirena.org.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>	<aX4D1VodQ8Ksrad6@sirena.co.uk>	<87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>	<b55cce82-1bdb-4e99-86ba-024f73a0aef6@gmail.com>	<45fde0f3-39b3-414e-b866-bb445df369b0@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 Feb 2026 05:59:17 +0000
X-ClientProxiedBy: TY4PR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:405:370::9) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY4PR01MB15073:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c357b37-7288-4ab3-e8fd-08de63b28833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?znY85e5VzQoic4e0asd1gmrau4KkcGEbRTkCyUj63HUlSLIErVYLqaap57Ov?=
 =?us-ascii?Q?RWeyjELA4u3Vlx1AZaztMbHyAnfOIFnOtq4dWapKxsSXt3oGJB9j9YPc+Od2?=
 =?us-ascii?Q?TyIFr1ssvadMGC9QgtKcNruPKuXc6GaY8PLkDA0jr/yuJ89hMRrR+XA7BGHx?=
 =?us-ascii?Q?ce5sSmZv8jgXuQLpnF0Os+G2Sxob7CcWxOK2VPJGUs6ucGhq18kvvxvIxG0S?=
 =?us-ascii?Q?2L7ulw3GUqzUPrlzaHkvvwvD3CMokM87ot1QiEZ1C8Cmc9PmcGbuEjesvnan?=
 =?us-ascii?Q?zirw6E9y5iTp2tvCKBip+rOkuQ3q64EJWPjzryz27BbRE087MNT+yk7DB40i?=
 =?us-ascii?Q?NNKBrfjaiqTx+9z/LlYYtgdO8tEvPFpCsuQ3TTO8BtQb/7zYf7K7eKzQNFL/?=
 =?us-ascii?Q?ZkZ0VV0JEH1shO55P5WPmQAyRe326lgBzG9IhaDo7w4o2kc/Chp1YLtEm+9L?=
 =?us-ascii?Q?7wKBiLiUF5331k08AmS8OKlq9bg9H0Kuq+aTxemkz3bUNXSWpndg20Az3Kc/?=
 =?us-ascii?Q?1pLU5wGLVVb1yugKBkt1IN4c9N2NcfOFHFuABjAZroFqUOgi/FtSJUXRI9me?=
 =?us-ascii?Q?z4UILtNO2mTJfdfi1kd+SYJ/DhbPWPIaq1bLqbHCfuD6QO4lVlD1r7Bq313a?=
 =?us-ascii?Q?z3S0i4T0xJza4D1PyO9d5kHwusfu7Y0ICP1uN0SkJRGlbLzloQ1GCLDigTpA?=
 =?us-ascii?Q?4EZfdTuub9SLdD9AacD/kbara9FMJ3FQlsO5LVShH9wJNnvXl34ZPX8lD7fA?=
 =?us-ascii?Q?Hvn89mujapNDC5Z9ZfaZ2eZwVv6/jJhr3i0hgrc5uvoY28Ae5BBSxWelNHwh?=
 =?us-ascii?Q?2uv/+eMFz+96yWwCCQrFGOx2g136LbpRa2qnux0mvupvoAJogyvnuGqiq0P5?=
 =?us-ascii?Q?ZHBzofVVupTfMz/SOJGi7je2FTixhi3/+VSO/V0baLfi9CfNYcCAKSmhuyKB?=
 =?us-ascii?Q?ZtXYymNH7TyJdAckMIzoo/fZmUgrT/7QVQ0jQ6asQB6DbdlDyHWFVLb0siMy?=
 =?us-ascii?Q?7Fz3b/RY8gTuysUDC3UPdTdnCkfO3WCEV091vdEQnxWwZ8DHmVQO4mzxV6rY?=
 =?us-ascii?Q?vJvniTr/Lb1Gt+ztWm/eFxN693bxXs7dlaFrbMNsv7COB5hZzSR4wUL4QwJY?=
 =?us-ascii?Q?YRDUjYewIgjYt47Z4+osbPAMuS89ANkUL88ixEWhat67+MJQSM/IlcZwU7uK?=
 =?us-ascii?Q?QkGYtEzZPftblxvXMNw5l3q/FG0tNA0FGJJ7rlEt3iUlAhmnIRO6l24iXNAb?=
 =?us-ascii?Q?ZeqVElkGVfPQYcPZLn4kO6FlAcmiuCbZLBcbVRr0RYQcvkKfuPaLaAkRjc4F?=
 =?us-ascii?Q?oLWQlPyhaRnB81p6WfvmpolXv+cZxCZqJa5TYFavM2GE7SvcsBABAR4IxSsw?=
 =?us-ascii?Q?vkGUQaXq6a4Bhjr/6t+8PjJYADFyUxiBgiviqZa0UOzv16dGLr53QG3FbO0S?=
 =?us-ascii?Q?jziyfYKbP5hQ70jIfFoMA8XInNpc8BCngFaM10qNf7awZwEMasqLf3woQWJm?=
 =?us-ascii?Q?qEQiBqFOQpqt/c+K5huoU8B7eSIVRqdUP4KV389k5up3KVaRUFyvt0YxTJfV?=
 =?us-ascii?Q?w7WGAdrbNihbztaI4CTu76jU/dfVCO3WQYZVSj1OkCA/qLwHJFkP6f8Og7HE?=
 =?us-ascii?Q?cg6tKS1Wb9z2tvnNn5/ljHk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E730/wQ0qZyZ7iNkgVBRCpL5/YH+zvcx143vQRETrbE/Z/aLDyPtoVK1ihPA?=
 =?us-ascii?Q?0QdLg04s/8Gt271ntVuhX7ROZwBB5Tui4IlY63r3KcCFHtzfpJqxHHDexSCG?=
 =?us-ascii?Q?jmPscvtF61DBCtCO4AC57SzWLEdOBF6iVl5mIhtuERdo9J0kpAT1wtPjgQL2?=
 =?us-ascii?Q?MCYPHkblZAGiy+j2+LyU3Zy7PTHiwqsAFSCQybWv+YdvOO1p7MJ2L7gea4m0?=
 =?us-ascii?Q?n4YYJss5MBkviYr7vqyF1SW4fvfnPIqIWFv5fsuQB8mf9SzxmmGpdImKr0/X?=
 =?us-ascii?Q?PNA8O33BneeeycLP0DgtUl5ov62OQ/wfSygTC+x+n08fe4vBXDN4NvM22fwt?=
 =?us-ascii?Q?KFYbQS8TCNFvuiirvu60GhDxpoVJ1cM4N/CVg8PK0A624SBLAHXvTM089Psu?=
 =?us-ascii?Q?6OTemC8gcilxZ/s3aIvy+pXhbFXuS8kH0AIwp5m2yW/M+H8FZ+x9R0hCFZs7?=
 =?us-ascii?Q?PiNhIVJWC0sGOMrnxYtm7ZZj1KGhAvStVEPunTOVVsg40vuLCer8EIu5cUuk?=
 =?us-ascii?Q?CpLaxm2DNqwCsFTZBiDDrhQFjxFO2bBGDFF9z3O9gbWPgq0SKMSRBbOfKJvX?=
 =?us-ascii?Q?o8R7VUPmt5k9SdoKbxDU0wJWsMtamrY1y1y4cqEBwwvhJjpmE6C9OnYN5y6h?=
 =?us-ascii?Q?Y3p+woVMYsOLJ0YZbw0LTWHsXPwzdUVwLWahUgMMIHziIVCuJrEGR8HEZLvI?=
 =?us-ascii?Q?mqH3w6iWdco7Ua17fmFG+VL40MOmvIQeEaobbUIXuUdcbpq5QZfGRiWm5YQL?=
 =?us-ascii?Q?e3y4g03AhcYrRPgdD9pP8V1TUYDvJFNMY7Mj69MQ5ITVzfDLlqV8P5Pj3ytA?=
 =?us-ascii?Q?chwqkwKm7AiNylpGXdO9R3gjwaqCAtRxMosZFxqMqY4KZhGoVAIe9zYhdGMS?=
 =?us-ascii?Q?Tta5GIHs9WUbBXb+YWPAguC4H6f5Nbr+UbQXzSHk1648ElLsQCO/U0fUfsfG?=
 =?us-ascii?Q?kRORM85qxcKTeoBEjk0QCTsdqLhvEQvqhl/xXlmqC/0lZIbKG1kkR16UEsrx?=
 =?us-ascii?Q?FfdwNvJ3YnqXG3wQNm1KoV1lO/bzFyDf8cWoDFUzYjepfPwHd8zTBp4HvPpG?=
 =?us-ascii?Q?hAufyswqiSuiVFkZlSKfG+n1a7d+ZuZgswgfTQrdsOPmG22aIgBQb+saRWdL?=
 =?us-ascii?Q?DG5tLcgb3m3ozsEtKlhNWM7l2KuvVbp8M2qfVYfLfKyfSRTEcgGfaYhgKnZN?=
 =?us-ascii?Q?g7EEF/qC/eM98dMrYbSUGElkB5ycKac9NBnjpzCDhEEoItmEmbSS7Xd84kxT?=
 =?us-ascii?Q?m/CK9GII1xFQTa7HKo+qsg3TJ9GyCdCQVASYV5/hq1jpvFAO1fT9RHzsRtvs?=
 =?us-ascii?Q?1F79eYMhi8RkbkCxTPpuBlCqMDGzpZXlnPd8y8oNC5JM1NrW+yAGndiLlkZK?=
 =?us-ascii?Q?Ucx6tLJzELMj/TWsUcvHtdgC2uB0wCgll703zB/OsfNakTlhBfkyn8KeWF5g?=
 =?us-ascii?Q?sp2qVAK4pOsqZbHPbld4IZiW4kQLrPldkd7woMoNvgwg50xIvIfVrTJEAAZF?=
 =?us-ascii?Q?2qHU1BVYw6fE81IN7g08k6REbwyvzOAG0hR8xcufv8Z78n0yr+aRiOilQMSM?=
 =?us-ascii?Q?WVS/BTBEUDpOL9ktAgAvY5clcOAjLwcf8Nho6JMVo6b+EzAjebOa19YT+2yS?=
 =?us-ascii?Q?m/4gepZEYfcWoQKom2zhH07sW8pmeb8NE3iQYyc6wh+1UOH7Y6hQ4b6a7hAi?=
 =?us-ascii?Q?a/LtO5RptIOls3it7S9HFrx984wl6aKeM9t70mRfzBsla1Eg+4el8SCBYbxR?=
 =?us-ascii?Q?t10qmrllLGzvHZYQRkmt9fEKgl9SnlOd4toYMfODd/U1CEFIBLw8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c357b37-7288-4ab3-e8fd-08de63b28833
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 05:59:17.6009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGn0aUG0L5QDaLisa2OfSLOXdOZLZL/RKDzf7MMEN8AodmHtrcBnhHihIjgrTwjlxkiN4mgj4IR20V+bzYAyB/cLBiKJZvlXzEnKYYhyWw4V80FxTILvZzKDCEhrFZGa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15073


Hi Liam

Thank you for your feedback

> Btw, I'm assuming pcm2 will reuse existing DAI and codec drivers but
> without the DAPM/DPCM flows ? i.e. same codec/dai binaries shipped by
> distros can be used by both pcm and pcm2 ?

pcm2 will not use DPCM.
CPU driver have no compatibility with pcm1 and pcm2.
If it was very very simple CPU driver, it might have some chance to conver
pcm1 CPU driver to pcm2 CPU driver, but almost 0 chance.

I'm not sure about DAPM so far, maybe reuse, maybe not.
Hopefully we want to keep Codec driver as-is, but not sure so far.

> DAPM is using "string match" method to check path/routing, but I want to
> use pointer style for it.
(snip)
> It should hopefully be easy to convert to an integer/pointer format here
> with some search/replace, however the mux enum controls reuse the
> strings in the kcontrol names IIRC so you may need to keep those.

Sorry my text was not clear.
I'm not sure how to do it, but my image is something like this

	[A] ----[C]
	[B] -+/

// [A]
struct mod mod_a {
	.name =3D "mod_a",
	...
};

// [B]
struct mod mod_b {
	.name =3D "mod_b",
	...
};

// [C]
struct mux mod_c =3D {
	.name =3D "mod_c",
	.inputs =3D { &mod_a,
		    &mod_b, },
};

	> amixer set "Mux mod_c input" "mod_a"
	> amixer set "Mux mod_c input" "mod_b"


> Whether having default volume or not should not mandatory, should be just
> option. We want to have flexible framework, like some board want to use s=
ame
> style as before (=3D setup full routing etc via amixer), and/or some boar=
d want
> to have default routing/volumes, etc.
(snip)
> I think hiding any kcontrols or hard coding kcontrols that change audio
> processing or routing will break all client use cases, yes this may be
> nice on IoT where there is no sound server or userspace audio infra and
> very simple audio is needed, but on client we need the soundserver e.g.
> Pipewire, CRAS or audio HAL to configure and control the use case/policy.

This is also maybe it was miss lead.
I want to say is like this. Because indicating image by ASCII art is
difficult, so it is using very simple case only.

	    [A]----[C]--[D]----[E] -->
	--> [B]-+/          \+-[F] -->
	                    \+-[G]

For example this chip has many inputs and many outputs, but used/connected
is only [B] (input) and [E]/[F] (output) for example.
From HW point of view, we need to select [C] input (=3D A or B), because
default is zero input. so we need to do this

	> amixer set "C input" "mod_b"

This is needed (from HW point of view), but is not needed (from user point
of view). I want to reduce it in pcm2.

And in the same time, from amixer point of view, current ASoC can do this

	> amixer set "D output" "mod_g"

But this is 100% not needed. This just increasing the number of amixer list
in this case. For example my case, we need to select via amixer is only 2 o=
r
3, but amixer list indicated tons of settings. So I always indicate which
settings is needed on DT file, otherwise no one can use sound.

Maybe it is not related to PC user, but it makes embedded systems user
confuse (Please note that not PC user only is the Linux user, and not
all user have advanced userland).

And, if above [D] was DEMUX, I think there are 2 type of method.
One is like this. TYPE-A

	> aplay hw:0,0 // [E] output
	> aplay hw:0,1 // [F] output

Other is like this. TYPE-B

	> amixer set "demux D out" "mod_e"
	> aplay  // [E] output

	> amixer set "demux D out" "mod_f"
	> aplay  // [F] output

I don't intend to force TYPE-A. Someone want to use TYPE-A,
and someone want to use TYPE-B. But soc-pcm2 want to allow both case.
I think it depends on Card driver developer's design, though.

> One other thing I would say is that the audio hardware landscape is=20
> changing for client devices in that they are transitioning to Soundwire=20
> SDCA compliance over the next few years. This will probably impact IoT=20
> too as codec prices become lower over time, so I would recommend more=20
> focus on soundwire integration than say legacy HDA in pcm2 as this would=
=20
> probably help more in the long term.

OK, thank you for your comment.





Thank you for your help !!

Best regards
---
Kuninori Morimoto
