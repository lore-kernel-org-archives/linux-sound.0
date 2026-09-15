Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78309199920
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449655; cv=fail; b=JIqPtmfUI3xtZ68EAThtDLzpvUkqYSsp253U1wHJo+Pu0hqQ/T3PxXZGCttG1WmTg6oG1dPr6eKg40KeIEm7K2wncQTECc434aRQde+fGg7B7rum7lD8mbnAlz5NzoDkApHjq90qIRX1hBJFj/qsMeAClQIIPT48ehP3YnVkhDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449655; c=relaxed/simple;
	bh=nmq0fZO81eO+J5GyZxw9WSXBubAaa+I+6rB1DtAz9GU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=h1N4SO/Kw4D6WhZ+mb7FxabUJCiEXeeL15bleoX1hi7jk2jXqab4MI+6oiIuEA5xWMCQK887O40KScCe5/+piXAD6O7CCLOAZwtpG6vP4YJcso/nFohNQIm2arfzhwYibjtEuddklFczv6AXjjoMg1EliM77zDeO6rrffOVADPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XlHxgJYV; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XlHxgJYV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xf3T4EugcDMCqyQl8JsMQ6Ojhi5KBJZyEmKNoojQJTozK6H//RKFOPXGv13DQyROgpp8o/OYHhbGVMMlO14gd2Gy4oiQHETqusXoZn4Jm0QdjjLW15N0Tu1Xnbt48Sg+xHhhybwXBID0cFS1kzM6mQWoCJ2NnAIPjHIYYERkJa7y1mZ2cJl//eaoLHBZh1uBQW8EvY0AJeRnRWACWa+63jdIIfzILX0riZqTjZyPf3tn1ZJR0W7EBaY0O8HmhyonCw0xUBTFkHpXVSXMfEnR2/tGnHm9dLhedVBr0nki9becDCvQDyZO6l41aEg9JaXQhJ0BVefeZXzEgI52nB8QXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qxf8x781uEsXZLrBm+6retWVq209sCIwfjOTQ1SELYI=;
 b=EaBqthAKiX9ITvfgIDKyBf9CNZXjiNOpyL0ZMR4qqHMmfsmG6k6A6IcncGrygB/4820ljFk0FN4/Hkek0wZTG53QCggh5GibJWxe2Vi/ePQ5GOgXhfKFkIFOzS0pGFK20XHirOCgzmHqnAaGsSL/oZpnI9oHLtsselqpHZxiHOrGjagfoLN8jeUhNkbHc7OVtx9onqJpcD6m2qLoa4HG8C53OcI3w7y3x51zqs/NzFJfIkbtQwox/B3axzObeNzXOMI+q4Fq7JYngqcefL0er2Ksij9F25+1Pkw0VEYUva5e52AbFuQQHHZJsY9Ny+jpxsSvqWU2bMMpPDTaX9a0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qxf8x781uEsXZLrBm+6retWVq209sCIwfjOTQ1SELYI=;
 b=XlHxgJYVOt0IZ3SzpgUJP2XIsAfrws5b9LTHQZULf0+VabxLGVS80k8xIs7kNHBzzChw/VYQnV5PUAxgXrMevB6PA01wgALUjztmyWH7WmQSIcYZUe9rhA1mCC5702HbvOYBeHtuLsAfiUVyIWuA9iDQhChetF2M2cHOWnitjd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TY4PR01MB17816.jpnprd01.prod.outlook.com
 (2603:1096:405:34d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 05:20:51 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 05:20:50 +0000
Message-ID: <874ifrrsy5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin.sipraga@analog.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 07/10] ASoC: soc-dai: rename snd_soc_dai_stream_active()
In-Reply-To: <aqiS7yz4IIYzU6ml@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
	<87h5jsli4y.wl-kuninori.morimoto.gx@renesas.com>
	<aqiS7yz4IIYzU6ml@analog.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Sep 2026 05:20:50 +0000
X-ClientProxiedBy: TY4P301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::16) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TY4PR01MB17816:EE_
X-MS-Office365-Filtering-Correlation-Id: a0eea420-3b16-403b-d255-08df12e91b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|10067099003|4143699003|6133799003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Mio2D4pmlkt4TmX91kMpQlXT9Vyc34eYk9lI1eNGBr8+A0eFqwFnQ4uSjeNL2bYMM6kms4aDI7Euk/YXFST2hPsgdH4iD0cqHZECPqjOkdE18zsMWpR3GCX/5JDyvRUX/2eUfQe5UvR89ANjHLfguATRmZcYxTa0qrAQX1Qt9vZC8FWv/88rSPftL3f1UNyN55uGtj1nj4j1sI62aS2/CXOY05eSo0RqUYmvYVMYJmqhZ0D0tr70PKU9LmIEJFh+JrY+6tGuGQIBrHKEe+8cUY5x9zrad2eN9eRw1MEhys5RyvEt/9X16P0JiMXi3mrSWma/Y3OSNuDuIW4cELue/QQIdI6BDzt/NQMwS8jJOOYECbZMuoFzFsNlhQG7BET7PtT4SzyQbMyWeCSvIE1mRb8l3g7dZXnC4AdtA26rrGsHpOlb9++aVHgKv14Za24KXjdTiLyvKFBCF2OfXgNKt5VGqo2rSpO2m9D5KhSXIPTDZiwoimUK87QrBhMYO/Tn385eEu83buY9ijALVddZWnI39n0NaxBxYMDtmsId6rBE8Y64xju+y2slBowrPPuwk+Ks1fzFmkmgcpEh3dC9KwjtHiW7wSGJYTRhbF+Fy3T1e/2KhnO63uHEDIiCVIGRZ1M87q1+ZvAPI8nkntz2Zu3dE2MyboY3P/JjUqW3cUfwGZxmRmfu4y1EgNa1M73GRvYgjbNcBbQLHIYpW9QqvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(10067099003)(4143699003)(6133799003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NGz3ISFCg5XiqdkjRGZV91hOANXAe9S51DXB1XCz33ueFM+rBx/AkrFOxbEv?=
 =?us-ascii?Q?jPmHSKsSRl7vIdYdx1EO+DEPobVcgZoWR761lAEuOXudDO5kV+T7BUpzIKvC?=
 =?us-ascii?Q?FMzey322vwUu2PtebAb3OjemXNF054fB1jaOWVehAFY0nADrcJ/OtY7dd0Ij?=
 =?us-ascii?Q?j56O4oxm8ICtxYn8nZXVl3ZGCO6X9uIPVyrfH9OUy1/io1nXX/7tqaRey846?=
 =?us-ascii?Q?C1uEBYFtOduTd6N89wSETBvoEQmvveS6V1rCIq9qiQzP+xHhheZ+csqFDFq0?=
 =?us-ascii?Q?ZGxNRW3Hh/n3qr2t/+ZwHv/fuFFw2+bNyvS4klVFtu8aumHjBQ220aveiQNe?=
 =?us-ascii?Q?lRNI+xK8KeZE7r1UuUr/GJ/ws5IGYygpN/b3D46cUUFprekVVNG47t3D7GLk?=
 =?us-ascii?Q?Jsu+35MRNd3c5KU1Jzd8s4N+dvLaeE7Z82fgNB2jwtX7ncQepJLADIs4EUto?=
 =?us-ascii?Q?Dw0li8VkJy2gP4lRxsnXCvJhCUfBK+vwtmr1eLuJC7dbSukupkQLFmYVottJ?=
 =?us-ascii?Q?fVR4Hz+NpQxpySnwX22mvKqDMxQk2wI/TUzisUcYwhMipKq8BYJmUvpD6vkp?=
 =?us-ascii?Q?6Ce5rtXcBaPbfMNGumpWbpZ8/xpO05Y/p9Cpfc5tFdh7J+jQRN+NJnKWwrtt?=
 =?us-ascii?Q?fgdyVwy3+NR9iQPViwfO5f60h6su4WPI3eko2q/OBnlx6sMAYXo12UNDALpg?=
 =?us-ascii?Q?NSMnOfFqqzkEwn23SIyWZ3vViORLMTYEK70nkKD1NCVSmGnpC46hj0YuDquj?=
 =?us-ascii?Q?bi7RtjKUgP3Q4MW0NoPN3OEAdgg9pAnJh6sl+tDDh3RsS06xs0d76/SgxzOi?=
 =?us-ascii?Q?r7UQ8C3ifaaZsUExiriiBx0ZnW2ykExiRJLYD2fzI3mx26EkvNioezwcJpX6?=
 =?us-ascii?Q?6c5G/meeiJFOsfafxnNRVuQMwrVfeqfZLSHh6CEgGPa5/8e9FQESlCgeg1aZ?=
 =?us-ascii?Q?UzrjeSd3xPFy2cG2LttmlC+tXpDz2+IOSEATtDtPNuLI9ljAMGeyXfgHprxW?=
 =?us-ascii?Q?ogiJ7vHatGco3mXFYjGHTUDB1GopgbWHhRWKD5kdSND+htt16t27VxL5WrXn?=
 =?us-ascii?Q?HqU4eNIofKKppKew4tVfTpaHB9Cb5HjBPK9gxe+D8R1SMci7cnH04+lvYE5/?=
 =?us-ascii?Q?xroe6uEpCiGYeOj5g6hWlHZ+DgZfRnkvVXCsnlbek8NJSf/GWz5vcKH9JCMz?=
 =?us-ascii?Q?1T+Fx0+KCkJ4HSd/ndTuc/eLFMfypKDbi7cd/tl4nRjgNC+cYeX68iUmn4Nr?=
 =?us-ascii?Q?1dJs8Gogu06W6VMNKt0fRLAENi7FqHSgOAdKF04nw249Ibe1amo5wZcdT7Hk?=
 =?us-ascii?Q?wPd6kupRoL0N+XMTlPBwQ9GOG2JmZv6/wzylVhzu6xbKEBgfkrFgXULoBuOi?=
 =?us-ascii?Q?Hf8nPiFKQdZiJmANfNXHOp8l8Ux9QNZYQ3ZpQtmBMPZtrfPwyIhoXDRJVjJA?=
 =?us-ascii?Q?djteI8unt3Dp5bWb/LebNgZHwXMICf3W4RmXPn1SlNQskMQbdWZk5JzwCdjG?=
 =?us-ascii?Q?yMe+vFXV6cmwHvW7pAJPQLAEy4LYhvP5ie/X5r9skeaHaILk6ff/xrwH0r0Z?=
 =?us-ascii?Q?XHQdswtGoVBvfMjRNaSIoeCpnpl5/kyIRQlvDFk5/Sk6AW32LxY7ftxJFT8d?=
 =?us-ascii?Q?hZoKUAM099q4BILb7nX4KnPwlroRBHtwvPFDSDAX+KVo2mu9xhZxVez9kQgj?=
 =?us-ascii?Q?42LtnfLPYrKX1o5M+9JxIS1aveCCJJXiSOPoDuGDnDtSKwEFEN7uRb9YCKdK?=
 =?us-ascii?Q?Un6MU8DkfjERWOjo0EGZGKLO6dY5heRgIOuTSt+r8uqXR1O4v0r6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0eea420-3b16-403b-d255-08df12e91b66
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 05:20:50.7908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVGNz6ai8qFq9+95BLxR1EI2BITDAJL3Sge68AdnRvRbOJuhjjs4MORkGwbZL8C6YVIU6Ufs4SiN/aiPnNWW7dJBjlwioJcBCzdFAgmGxZ6x7nVu7xugKiUFYK5saZJ7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17816


Hi Alvin

Thank you for your review

> Normally I read a function like snd_soc_dai_steam_active(x, y) to mean
> "is stream y of dai x active"? We also have snd_soc_dai_stream_valid()
> which has similar semantics.
> 
> OTOH snd_soc_dai_active_stream() sounds like "what's the active stream
> of the DAI?" (which of course doesn't make sense; could be that both or
> neither are active).
> 
> I sense you're trying to "namespace" all the dai->stream[dir].active
> logic under functions named snd_soc_dai_active_xxx(), which is
> understandable, but don't you think the following is cleaner?
> 
> snd_soc_dai_action()          <=>   similar to snd_soc_runtime_action()
> snd_soc_dai_active()          <=>   is (any) DAI stream active?
> snd_soc_dai_stream_active()   <=>   is (given) DAI stream active?

Yeah, agree.
This is maybe because of my English-skill, but "active" / "action" are
makes it more confusable / non-intuitive.

How about this ?

	snd_soc_dai_stream_count()		(= snd_soc_dai_active_stream())
	snd_soc_dai_stream_count_update()	(= snd_soc_dai_active_action())

	snd_soc_dai_count()			(= snd_soc_dai_active())
	// no _count_update()

Not only DAI, but Component/runtime too

	snd_soc_component_count()		(= snd_soc_component_active())
	snd_soc_component_count_update()	(= snd_soc_component_active_action())

	// no _count()
	snd_soc_runtime_count_update()		(= snd_soc_runtime_action())

Then, we want to rename .active to .count

Thank you for your help !!

Best regards
---
Kuninori Morimoto
