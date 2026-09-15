Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471A54D0A15
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 23:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789515471; cv=fail; b=NUWWao9UGwEgXOn+gQiJicMbaG9TtSDSim4lFNIWybGWn0pAgKZFBd17roUtVttZBKO/YYLEBkCyyqTsv0nGVIydGvP2UAQV4psHnviIwzXL3bsbsGkyzYDSpsE52HkLvGVOlkXM4a3fZbO1VIFSrwqlrAWc6xgRtyUL19yzCeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789515471; c=relaxed/simple;
	bh=4VbulxAO9N1h/wZQZiaqjtKu8Ux6EeLnsTI1Ptrpm0M=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=m9StayfnkKHIBV9AFgWZXaGW5GbRfLFgJVSVmr0b1PX5XHoUTDMXnD30RmFofRu3yApx6JxH+VGamy+7o4SEhgAdI2FQFr2jPmyqrHQIwWy/tU9EAYsHjP5HIQ8k6wW7XoThoKOz0CoEgZntx4NlvDpoPwfM1RtKLU+s+886vMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pd9GVqKa; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pd9GVqKa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIM3NXTYG7Z22vYFLe/A+tsSxJACmui5LRs6dJcFceLQqsPak3p1UG7MmNOq/lPTC5EsjE/qSaZigUDlgkclCohSygbsjqCuCx9TT/gJScNoL7zdt56f0hG2V3/JsniRzyDDnPDT8MMo8wLkPOLXyRZqiDScri+4rGJ2HU/f+rvcxPOJhKMG7oMfqKZ3CqlrxXVEs1lPH0yKRgo8NwpetCdp11ObgwsXTwRvwgKDEQvFRPZsT56dawA9bzd8OPkTW2unqaNuM6PmfPyzGgMtGaTLtNhoelPCs3XV3/8AGBQ9WJ5Y1Ct0CXNrZE0w/tbr4WU4fKcF+ra/dWCdIofLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RrPnN9z8w3qtRDziJJ8/wtcYyMK+57Uv0mG64J1Jzg=;
 b=C/+6U41TI9ENYcrcoGuP6EVjz+8uK+rImmukEQX8W4nVHRmIQ0QfxQusvqaWlkgTQ8ErBDpBEmiGiH04EfS+jt77Xyg66dD64J7zK5zaizzuWXmR0ymRr88YtEgRWE67E2hNwB52NJbochJNuCzM2w10rwewaKvl3Nq5IHpvyb9SVK0QfIIbHp1RQthSnHMzKQLGnXogfKheDzfKe0Hm8K845CLZEk0ALP0rGDNXQSWC7+JG7ex6IXJOAHgZch2yytSQJ2P6j1XmW15c37pWqVy1dUtUVU+6eYpb4A3ELtkHiwaoabGe+BphSGs7EgYpPTuW407Rn+76N72M42Q1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RrPnN9z8w3qtRDziJJ8/wtcYyMK+57Uv0mG64J1Jzg=;
 b=Pd9GVqKakT++feD+BDn133hRRuCs9EromfqX2kekvktR2oswnc9nRF/JP7+Ds21OZlYCUtI3QVkeZh1Ieut9Jktb8RjwvtHcnUwryL9hqvn35fisaQCGecxhIcxhSL1vTXxJ079/WIZr/msT1wRa9vAzXOWFxvBeINEbr/mvhic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS7PR01MB18136.jpnprd01.prod.outlook.com
 (2603:1096:604:4c5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 23:37:45 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.009; Tue, 15 Sep 2026
 23:37:45 +0000
Message-ID: <87ik46w0fr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin.sipraga@analog.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 04/10] ASoC: soc-dai: add snd_soc_dai_{to/from}_list()
In-Reply-To: <aqlUINu_YUeN9O47@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
	<87ld94li94.wl-kuninori.morimoto.gx@renesas.com>
	<aqlUINu_YUeN9O47@analog.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Sep 2026 23:37:45 +0000
X-ClientProxiedBy: TYCP286CA0211.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::14) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS7PR01MB18136:EE_
X-MS-Office365-Filtering-Correlation-Id: 43da2222-b77b-469f-6a23-08df138257ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|366016|376014|3023799007|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Bohh4LN+nMoIzF/qMhCiochBG2oibZuSkTLu22XhIhg60W+MVFi2hNCb2LXA4+DGFGfSKlWgPLYAigtEkbOQ8kzVApAOjxtZnN+RhyS2EuGOSSpM2GnmbbK6SxAnMEI1sAQxb9j/uYNh3vIh6h/SESbdi2tzE0BtRWjPrbEp4HUPToidAzLohQWS/IvQ3CoWVAGn5G4at67pS4sPpawCEqOsVhBYOwRe827P4ACnM0NPTMuer1BRx7fj2h5n4dZYuBjbsaK5Fs+QKpSDbySrpZOSjwJLLUPTe2goI7Fd9WUlzGJwLOnIXT/fd+vGTCcCMPfbUsB+oPz1KHwlnN81xU3JvRBvOwzVtpwbeWIZ6TkD4KVYR2AabLzbV5WciPLaQO3RDv1kdfM5gcKHde8WENWnx0g3P/zCQ9tG2Y+GRIhx/DUjSRLAFNzGNYawtrIZ2Jn66OYB3MIwG4gD5qYIruOMZMn40EhAfvBPWUY/Fc35Qhanadh85uN4aXRYqsGL4MuQxtFek/ilhqZ5VZLV60nmxBac0UcxCKdpnySrPzg/pPtullRI7Vdf/U/lVCLBT5tjgSPRI/MIG7tQYmfi3YawacEJtLKVpwaZwrTmH7XzsXvRZ61Ysy9ef0YIOI8jdX3CSkThMLkvlXWfyu0daXcMd8anud5aJMg7dCLEdHlkgcjgpNgNkBzTBiAO2D9SwHJ+N2mfMLu8oQaS4BgrMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(366016)(376014)(3023799007)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w2Oa4gwc6c4C6/ztuI6RVRczVRRumheORSLo1/XLfNnSZAfTq6mQtc32FywP?=
 =?us-ascii?Q?c2L1W0XAFvtiHye+uXqXDDK6fJzvpEvh4bX8Mhk4bWgLLjaEeqkEvjR6eTr3?=
 =?us-ascii?Q?mKdw4DU+2RXsvxO9Sn3UCe3KwExoaPJ8l9o3VIK76wIHGX3wRVOsqVVCoPt+?=
 =?us-ascii?Q?JLIluqHLiesLqlRBSifd3J52XP/HG2FJCEgwfzyCZynlq3kc9CWq5QQI7Nku?=
 =?us-ascii?Q?23AgmZE0F2acAZws+YHnjJlaKm3UbyH250sOwrlt8U+UuX/ZuNQBQIXzTjxI?=
 =?us-ascii?Q?jBsJw3Y8+o67tcBIM/eg38GjA82IQT+wnp6z8fmzL+F4HZhYyeQEFAxH2vCX?=
 =?us-ascii?Q?pUP2jw7uOy1XOMM0HlneFB3TZga/cxEFumXI4MBqzkOti7XRfa13I7cndBtu?=
 =?us-ascii?Q?HAtYnDeN4Wl1Wgh4KnBL42c2x2xP2QnJ4R2OtOnZNW9v2WRH15dXJcrk0I2D?=
 =?us-ascii?Q?cMWS3NunwUMt9D2JAoqdNr8xJRyH0Yp/cKnhZsXpgee9AMAPIYAfipIXOe+1?=
 =?us-ascii?Q?5Yb2JrGhp0gfj3WSgO67OdzxdIw6BG9HgZNzPMOKZXuvDGYqhHT/odeuXBWe?=
 =?us-ascii?Q?Jt9vEgK8EQsqEwC76zpvkQY1RDVOCrhCBwFYmEGueD9DbuLcKOdzEJn6Afpk?=
 =?us-ascii?Q?lrG3lgZ7eJs7iw0+TYUnjDGPvm3aJgwzP2YuUlvs5HwaJWpt21fCfrbSXv3o?=
 =?us-ascii?Q?UZYk8OLEssZXqJS82CaBZrrAkbY9y51E95bo+tr/g0b6glF+tobpni+0u9HE?=
 =?us-ascii?Q?8NUk2/p32mYfwV8/muzZTl4ZYYbzPwYQn1Cm6xfnB4/Uz4SmB1OeVJWhNpho?=
 =?us-ascii?Q?6/WEskJo/CWye0NqqZ4xsSJeUlFplSfoJO52Zx4XR3lNGJeT+uvcHkc457N6?=
 =?us-ascii?Q?7G5VZuwWjaw0jt4aegJT3BaZSGNgT36Bnd0LQ6f6o2Xpr1YxAvjDN37Hrs4J?=
 =?us-ascii?Q?bs6jUEE59QlJW38uDrvldgEwFiEYa2NerJhxmjgXr1HxePLdPcgjqnrdGJhe?=
 =?us-ascii?Q?9iLJ9pzcMsv1mUJXoec0hhYmY9lF6Ny86Pi/2O0Wjijsk8C6bTGcaBIdszUv?=
 =?us-ascii?Q?+IHCMudXYJ2J6rt6sv0B8j5eFMlvxFYhvweENAAlth2WhFaPnEB1IsNaEdwC?=
 =?us-ascii?Q?OI0xYe/BEddJJb3mmjhQZ3lN9YSwjtUTTtMShQnI4BfpKrnY1SdI9X0zc8Um?=
 =?us-ascii?Q?zr1TzytT8vRhP+hLOEBNKnx0es6ZBBxWjRLH0IMIBV/YMhQQoNM0AkwO7Q7c?=
 =?us-ascii?Q?NTbuE5YQFLITTJHYI0iBU0QRp4ULvK4RrP4Oo5EhlgoPlNwv1I9nane1C2XM?=
 =?us-ascii?Q?82GH3BiIyb9dy8AS1koFpsUknHpjYFuFtO/AAtRyaP1yVoGzkMJEiUY3ZhBs?=
 =?us-ascii?Q?VNZDmLcVuX3NEWrGmF4WtecuCc6I1KZyVC4Ak2E+iY8V8E1MUnaIuJ2GLFBQ?=
 =?us-ascii?Q?m1IqsUeXT8DAv6hSKSMC6yoMmsmEq3J4us2u1HGRTQ78T+qYfuFVGpk7eDUA?=
 =?us-ascii?Q?LTHN59ZKRRq8oeDOsSkE/2vXbY0//9MIOjBhGk9zrk4MN23MrSfGkccFAPy3?=
 =?us-ascii?Q?HkPuo6jEF1my5oK+Gbzw3WPZcNCbgYgGzLKG0TLHwfVrsbhKeRMNFKPp1M2V?=
 =?us-ascii?Q?L3cY3854/G/FDUHoGuLc5Z7CJ7STjOd9+AVzLyZzSNyq0OuiDo9SeAlfbuqY?=
 =?us-ascii?Q?TEXKIyfQ4riDe5hrGxNhssIaYtLxV/XkY3f/BE87wozQrijViPL8F381C59G?=
 =?us-ascii?Q?UDS/fYF6zVYlecPwKW2vsIQn+3zPXuwC0FrJUjgYEanlzpFu8G5n?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43da2222-b77b-469f-6a23-08df138257ec
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 23:37:45.4131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQfKfbIPvGHmInAEg4mxTY4lJZK9UHJ8m7CU8QTt6YPvw4ErrMZor0LCM4S0FQVzPshywVZ4qBS9Q84l3JQocMB/mEanNQfbfPkFbhQ5EFDg88pb/aUTNye7KzEB2M1C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB18136


Hi Alvin

Thank you for your review

> > DAI parameter will be capsuled soon, will be not enable to access from
> > each drivers. add snd_soc_dai_{to/from}_list() to use for_each macro.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
(snip)
> > +#define for_each_component_dais_safe(component, dai, _dai)			\
> > +	for (dai = snd_soc_dai_from_list((component)->dai_list.next),		\
> > +	     _dai = snd_soc_dai_from_list(snd_soc_dai_to_list(dai)->next);	\
> > +	     snd_soc_dai_to_list(dai) != &(component)->dai_list;		\
> > +	     dai = _dai, _dai = snd_soc_dai_from_list(snd_soc_dai_to_list(_dai)->next))
> 
> Hmm, I guess later on you will have to also encapsulate components, and
> so this header macro won't be allowed to expose (component)->dai_list
> either. You will need some function like:

Yes, I will post such patch at some steps later
(It needs many steps for capsuling)

> That's 4 calls per iteration I think. Idk if it really matters.
(snip)
>   for (struct list_head *_h = (head), *_i = _h->next;     \
>        _i != _h && ((pos) = from_list(_i), true);         \
>        _i = _i->next)

Indeed it makes function call a lot is bad point of capsuling...
I don't prepare for loop template, but it is good idea.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
