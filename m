Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0762C9D
	for <linux-sound@vger.kernel.org>; Mon, 23 Dec 2024 02:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734919320; cv=fail; b=Dnm0vvM+7s8SzOgZEBZ1lrpRfX/BFh0zKifxAgkGuajQrvTI/gya2iWIWEwe6GxnFXyQQi6Dby0wCARsl42z59Zo72SKwid9YTfngxrJoBRpNI8TAQsKSK6Rjvj/RLFIRu3YR1IIf3eZ6Zh3zvatugaJyidoJs0mbGzujfrONls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734919320; c=relaxed/simple;
	bh=XkKYhXywj07tzq+kcYxIwUA520bKeX7qweUsSrXtYgY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Vqfq4BbU4p9iMiWcwhSJ1TIG5Ed9Euk3hoajk2ej3jlOifLx+Y+x0Wyrb8ixB61dk75hXBdjtUGQfQ+uIUNcTxQHBqCwNynagomaQR2O/rwOKVnbIQTEjS6tuokUNZbDvQZAYT+7cr0CqZqo3enhV4+SGlURjjqcAOSIuz5NQkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CYkNgRIj; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CYkNgRIj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgUlMbBVrbFSzmGLDnrPth0gb6Z3PIpw2/zjdgBPuypewtojutIv2AtBDDka/Q0ym+nCcVxErmMDH3mqiKA7cyLNEY2hakCWN4vUMq16ZlJlmWOceFTX3Sz0f4y86rSL+Kna9aR+pBJQHrDRY0EmuXr1SW8X9WIyngTM1wYpUMJslsDlkHvFb+YjTKOldwhmxs8x83PwwNCGu/mR7NOQpyIH89eo748JkLI15EnN5IvHRl7RzZ1Cjvrq1uf/2wg1exMJTIse70AfwIWcoZocp7ekHE/B4Es61gQ21iults7u5kfalhV0flFlB+UzgI1hdQioD7IZQ4IY4/sbUH3ytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TMioSgUIw3AGF+ppkAKFFJFpFQWTH4kuy6mi++gHww=;
 b=Efjr7iF0rn70p7qhiYgPxRVYL5olzRMWukhvR0S0nZB/Uu+Idmr0QnmmT3qa88jYkfnSkd38rCPYai+bDQMArPp3uK45FelmQzFalvUP8KdY34hB6Qyc1OmogqiEool1iPLVgi6VOGQx0l5me3oRE4Yja6NuzQvy2EwuMxnaU2vUZV773KHDoyYJT5GG7lPOkfy1o9LP7izzzK2UVfMWvU1nif8hCE7lFDfEkWruvq1jMMu6rK6GslrQeGqfgcvRQ2yo07+aeUK0npNr3HjHXJWTGun5mJJx9MXDbXSJ4e27Yw4BDosSd+A+wBgu7gyt/jeg/qm+lTcz6eDxzJCbkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TMioSgUIw3AGF+ppkAKFFJFpFQWTH4kuy6mi++gHww=;
 b=CYkNgRIj7jGMPMhoz7GjC1vdV6jHVeKDVRcNg1XHj36jdAbLVeOK8xEI5zkcQ1bd0Nt01HyZGROg2Lm2N9AvQ0FSGS2avHJ5W0yBk7fYi4yXRq4sWkw4BguT9wazVtRUDdKCebrcv41Gfy2PWJ21jeed3xgdvXyj/6rwilHhYCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13125.jpnprd01.prod.outlook.com
 (2603:1096:604:350::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Mon, 23 Dec
 2024 02:01:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 02:01:55 +0000
Message-ID: <87cyhj88dp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stephen Gordon <gordoste@iinet.net.au>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] ASoC: extra format on each DAI
In-Reply-To: <20241220110133.2e8f1986@rpi5>
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
	<20241220110133.2e8f1986@rpi5>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Dec 2024 02:01:55 +0000
X-ClientProxiedBy: TY2PR0101CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13125:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b567d9-4fc3-4fad-d210-08dd22f5c69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n8LKSWl1lS+9lI9T9QtIsA1rB1/cIpeZvr/wFwYhuhKzit0rRRzhVylJQJbi?=
 =?us-ascii?Q?dx5yYJJRrp8hacVW56R5Ma/8l3BqZoWlNp1/MKVB3lc2u5JlqGUTWBd+6Wn2?=
 =?us-ascii?Q?BkIWYlXcbpPEFfU67zOqFO28w4zOf5aOKFCzfv4wJiJRSBliqzCAqcrVB5sT?=
 =?us-ascii?Q?Qmnd4+kc9vWXrJumnrEQX2Jl9zsgYN9XLP5284sGZaU3kXlF0G+vpHiuL133?=
 =?us-ascii?Q?XD2wxmwRosdjesreAGfhpHj09ax/B2m1ZICrjHOVgwdIGRBDcGotidvrzpbW?=
 =?us-ascii?Q?Izg2AKIHAJhmMM1pluCSil9BvImUUbSR8V5+47GSDrzKiNbEJGMw4mNO3JPx?=
 =?us-ascii?Q?uK21Xn/IJtMIbIpAokyzjmiNRgSQo5lZn0m75iX92f1QxSjcm/tQbavtdMRF?=
 =?us-ascii?Q?p0VRZhEEUQwhpko3FfUYMb2OVV21oIaRPBI0dwC0jbURzKVrpiByaqIh7S9E?=
 =?us-ascii?Q?at17AdndHADVWW4qrpMlQ/Ptf7s9SmXk5oWAWANkaBDGvfTzDoshHANjHD+z?=
 =?us-ascii?Q?LByGLI3Vg6bu+2CUr/KL0t8Nhc0MPiD3PR4t0cFOryK0fxgePPX4Tm+mEn4U?=
 =?us-ascii?Q?8rOegxrhnc6X/xAsq4KcOThgFXqc3AmSaqRQmMVcdH3se/OB7GethlH/JTNn?=
 =?us-ascii?Q?eD46hLD6NLOsMsHTJidvRXsSj+pJOQeU3esD9+vDp2H9YFejcXlCdwv7jDzl?=
 =?us-ascii?Q?pbCaCilISJfNwhqaZeTzmDjkPRQj72fYF7J0Jo2AK/otaq5SU8tMIA7lHUvy?=
 =?us-ascii?Q?SbM1YNgfWfx/uddwNhRtTOhwSPjhLfkzzPmEtYGLFIk7FHThT3ITMe/Bz4Yo?=
 =?us-ascii?Q?21ynUa3IKWI5Lzz9PT5PEYFHM1mtligKV9aKfycu7K+IEsRHSooKPdOwnbwh?=
 =?us-ascii?Q?E0U4NARJOe6pXiWjM1GxprUXBCa3cNiJ4ROZelcWU7vp/wrkMdQTVVlKT23K?=
 =?us-ascii?Q?28KJdLP1gIc8UBgvsSBCwdD5M1Sxz1TOi8T4uia5ZGxjR3xYhCChVelsFAI4?=
 =?us-ascii?Q?r/08YtQZoVheMa9wDOdEhHFbESEzWmzJz+EpMljwLEliR/M4WizBoPGdeRK9?=
 =?us-ascii?Q?J/4HEqhHjfS7NwOFEwjegey66pq+i15DpFdvR30Wj2dAbUoVsKMEWHewzX7A?=
 =?us-ascii?Q?64GDtcGlL4yWehWG/iW42W+lB3av7ZERpWtjVwSj7W32H4XSc23XKLIpnm/m?=
 =?us-ascii?Q?N9OWbvyfuH1RQErp+EW5xgWb13XobW/0ok6C1gHwXg7xCbgk6KHPuoykFVzA?=
 =?us-ascii?Q?/mK+d/OhyRh+zkWCE1//h/fvB1h2Vy/bSWhgCD4KV++a66xOMgpwlj6ABIft?=
 =?us-ascii?Q?C9rkvnGOoW05Q/uJCj61PB6pKHAvbHEZcW3Mp/iVTikOhS4t+TxaAIZfH2+m?=
 =?us-ascii?Q?si0/vvnavobk4OW4hzG23H2wmkFQ94OPBXimd3QfKgyl5Rjv8S64ye5fxAmf?=
 =?us-ascii?Q?YsEI45WR8jUVXz7tCX6/FL7FrkNVsRYM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VcX5xEfHl7fUUzYa93Q/VI4jq2Esw2eJ6jrwVVT08fs5batotxpegXyPGbRK?=
 =?us-ascii?Q?ea5/O1b4Msq6JJPempQf/e3p+J6oysqzlpruejKzWMMzxr6p8iU+Bi+EFZn7?=
 =?us-ascii?Q?NZg565Xt+Od5rdGA7rVd8Jtf8A4lBpSkboFXnOHd0NiAgUwssbMJQCRFhtOl?=
 =?us-ascii?Q?+VPXmETM7LjMIi9QNqnYFBzrb08mjm8p+sesWFkoeXPiQpYFCHf8BsXk4x+z?=
 =?us-ascii?Q?2qYE9FuGFCguW+ZE0ZI0fxx9uO0uhIw6pEcKDexZStidNxHC3ys0gmq/gBXt?=
 =?us-ascii?Q?4cp+63zaAGs7dIl2diH112sU7PQG7ldLvTX4L3der8j0LzTi2tINYlv7jg8h?=
 =?us-ascii?Q?webT3aekfmIOwIj1XsG/zRBk4fR9ox5ktUI4OtEURcqlcry0XN3kY4TK4FcJ?=
 =?us-ascii?Q?sJ9SnYCy1qQB5MUileUX2UNVteOb3x5f1sEL+gVHoRrgb0cahFfquh8f2YeB?=
 =?us-ascii?Q?j2JF/AmEhQmp3wlQDxSA+x7EDpCGgxrHDoh/RUFgk4hi9LYVlVK4ZB8w8aWe?=
 =?us-ascii?Q?MQlwTGCUnK9JlClHTh9Nj0ZTX4HqtfNbkbulhbYQnQSGoCsjnICvNN1N6xz0?=
 =?us-ascii?Q?+X80FqnWRHPF/ZVndgwM1VwNcFeQqAZ5je/4y7ui29ytRLltrwaRxqfEk2RR?=
 =?us-ascii?Q?DYcuaTR0wtxD1+pdPGtF4JqYB9iLKSzIA2d29DJZhKH5OPr5VbTemC80xxLq?=
 =?us-ascii?Q?DCUFZf4qw1xmshBL9OwOiR/BRhS5XLEmX+2on4MMtPqn+Bvv/rnw2niC2FcN?=
 =?us-ascii?Q?/nGe3Bjqu5nawaURp4DrqSp914Lb734OEh5rTE6FeXFCokjoiZFEmqU3wNMc?=
 =?us-ascii?Q?LDf6X2/63FYBnCbyQrflRvZV/Tb/D/Xh3WMx7gG/HjsxqiDz72Yipp42loxx?=
 =?us-ascii?Q?hOvWIZnPUIfympYaDA+tCKr8rVtoTkmoKkA/f5aj61Lzz4/pSh1I/MydqndR?=
 =?us-ascii?Q?ZrDtu5hs+nLHjuLQQeKHEPDfXUIvsJUjrjQmsPj2HHxWFtG1KQ0zD2hJnFWG?=
 =?us-ascii?Q?z6Eo7r5tGdeEDqeLu1Dt9+A7H0o6ITkobvsCWJg6qzB4alkez9vG7t/2CYbm?=
 =?us-ascii?Q?r3BgAvViIoylcaWp7V9ueEfL5i9q8Yn/x4MPlsiitP9thtErsEm7eyseIHyz?=
 =?us-ascii?Q?ZlRuOgVu4g61s39SWbjE9ocgTEUqcRYtp9k4hj/Uxzgpo4Ilx/HWDqzJS7Km?=
 =?us-ascii?Q?x1tJJyRNSwfV4aRub9daqCHQUH1eUClfF8G/oZ7d1nScF4rqwCd/zC6lfqAr?=
 =?us-ascii?Q?KfQOBn+rn/Ttxub3OhwWvYIAFirq04qPthWUsgD0rTEh35bu9JkCeK15PXOx?=
 =?us-ascii?Q?AUyHLzECY5HutQhdTh6D3J0zBmuMaMIbpShM24M6llMLpXu89vIB6F1nbwmT?=
 =?us-ascii?Q?nMufjVBduQ3MWq8T6ugvrvg/aenBsxl03OhGQZWqfF/w19N2l+jUtJCDpz7U?=
 =?us-ascii?Q?VtU0n1o44xKnSz/Xl2cOgdAMIQ/i7/cYQeGIuwh11eB9+pFoCX+Dj28imB8P?=
 =?us-ascii?Q?CzQWMXCCiehjhr8ReU589ornL4aC8gdo4IDJrhETZQ/XUNXoCch4dLCj1nsd?=
 =?us-ascii?Q?ECU4V8QhaFzPWXvTIcZ3T0YSCis1aNj72c6j3uh/hG4YQGYUIATXcPR5MAdq?=
 =?us-ascii?Q?AudKer3qsbWrZIP0i3l4QdY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b567d9-4fc3-4fad-d210-08dd22f5c69f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 02:01:55.2673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UUMnPyHMIMCw9LyzFNPTeDsPtrx/myl/so2rf8nQMWQtoUoEkwv2+zeGchRoqHqCjFI861WJg4PLGIF1o7TBmkP+Y7/dcBNpqDPrS/mJv5pHXD4rbeiSK7o0az9gyut
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13125


Hi Stephen

Thank you for testing

> I am attempting to test this by applying your patchset on top of
> 6.13-rc3. But I am running into a problem, probably because my
> graph-card2 DT is wrong. I've attached the DTS file. I used the
> Semi-Multi example.

Hmm... It seems the DT setting itself is correct. I have copied your
settings to test-cpu / test-codec, but it could probe without any error.

> [   27.333830] asoc-audio-graph-card2 soc@107c000000:sound: probe with
> driver asoc-audio-graph-card2 failed with error -12

It is -12 = -ENOMEM = kmalloc() error ?


Thank you for your help !!

Best regards
---
Kuninori Morimoto
