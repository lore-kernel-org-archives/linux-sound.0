Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6259733688A
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 00:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772584395; cv=fail; b=IBkupHFZ5exJropkGhwjZHYIegNLCqNUINxHxVv2m75+rCWp6UrBNCvQIVRqIomaMNIsvXlqyudHAEDlkxn3gnCVOO7J43AbDiUf85x7fbFSeYDgioD2+Jr6i0p/JFGmiab7uKZW+JEQDrPGh62bzziGooX3qCj0BBBXMVwSuHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772584395; c=relaxed/simple;
	bh=fVaZTcC0J/MVMCqQADw8nNHJCOHV9L4UplgKVzl60QU=;
	h=Message-ID:From:To:Cc:Subject:References:Content-Type:Date:
	 MIME-Version; b=UMNk0kN1ly32/jelY1FZEM/8zOjjlaIbzO6/2S8hhiD8vYlsks81mRp3fSYeO4I58kEwvbv4B+SiL7FKJCOO2NOoRJmRb/2MGLTHq+I7SoOLsCgykUHmmS8ZljrFVNPAciNR9Q4aBTIKvjNTz866bxMWxK98eJAwk7bR+cii2Iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LJ8Qrpek; arc=fail smtp.client-ip=40.107.74.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LJ8Qrpek"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwNDGVbsDjOQLo+B89AGvVz+W6ZhjeHxkuWQAs+TJs9hpzNjhCpeEpkRTgnuOR/+EzKvZWmlz+ZuZ8ye4Ak/e+0nVSEiqfRn3yN62V1ggQvmtDjKMpz3qbiD75ndAyOhaYyxPr2IJt2bRtUcmA1VGzEibe9Fb+HROhwcW7PSaSI80S0ruZ6NXuy48w3GzioFKV1rB2DQCv+IR7z6aKYWA2gAOQd0ZKixqVue8KW2PGwtuZIx7q35Jdn0binKJjeomdyOHCarJpPpajX6/+nj4zoHkl3PDo/X6xdJ2nhukPjCOHg18rDtyw4dTCJORNIaEZ3zMBmaofsisVczFRURZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGidmdh25sfWSDMJdXj8QXZw7W+0xn7ygfGgtBPF2Rc=;
 b=dI6VOWBoYFfD7yCUwrTEe8uPH+oLBw7tbpZ3Uwjw3wcnbEppsvFRkJ/2ejgEuTJGij8PPJqpVbUFdJBRi07kiVMOcMX32naTBQkiTjk1sEjC9LLrdEgXiRFEFQOwLZzZB9qoJWK1OMqLkBRcSLLVzao9Hh4tsmk/dcczAEeUrhcBEOse3OZ3nAz0QaFuvLYikMcvGfl5Ulk7J/KDLqI6hi4JeI6FL7gVocRHj8eBf2jet9NJKDL6KuGQmOOerZvSI4vMDquGRcbVabtDTGHVDnX0SlOb+OxIuxC68fO2Wd3amggI/mhdWnIh2KDhP3lkQpQQYZHbPkDkCpF1FTVDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGidmdh25sfWSDMJdXj8QXZw7W+0xn7ygfGgtBPF2Rc=;
 b=LJ8QrpeknsD3Ws1SFp34Ab2cMKImyNw3S9khhx1HXXCQpxFRusU+Eqy6PKgwLXVXfJ/MqrnCKFamy44+u8lFlsAqgVcnkK2bG0JqbmuO61J4HnTHYPLdkazbzDgkvn3y5GfUppUEFotXGLjaPe2auMIDJgW3IidB3GuZYL3TQgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OSOPR01MB12392.jpnprd01.prod.outlook.com (2603:1096:604:2dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 00:33:08 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 00:33:07 +0000
Message-ID: <87zf4oph6k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,	Mark Brown <broonie@kernel.org>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>,
	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>
Subject: Re: Question about Card rebinding
References: <877bryznly.wl-kuninori.morimoto.gx@renesas.com>
	<0dadcf51-12e5-4bd2-82d4-4a815d7c2d83@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 00:33:07 +0000
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OSOPR01MB12392:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d06b770-7147-4fee-5d74-08de79859b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	G9A8c1WdriLsHPgfKJOxpHr4u/+Oidp5Hja1eP48Gtu0oUWEyTaM2y/BgAe45CQ2WbNTMhg5E9rhwd9Lvbl9M5zTcaxypV3CwUZGJucA5kElwMHQPrciqC40hG2JndzkMG6TPA8nEFWlxSZdygHsDSJWMRi8eq+5jwGAi22zQsOQ2dj3WmFn7yAy/FxPyI1ehfmuhRpixbyOLI3zhV7jehCRyTDjAerVN0XPbMpwWoa6KEyFQCAVkOHmH/1GNOCLYUbLnQnQUE5XX3Pyf7f4xr8mZi+g2WgqPSoBoVkTxGKLLAc7BpdkikfnElUj8WpNb18dwh7jUenyNotWlimQHc8VXo/ge/3yEEwGmQ+o5x5TJCuQQIOBZzysI6XydXg8XmgRCz3qjoQ/ds7zjdHjzrXjQ+kSaxsdFXYw02MSy35t06CcjA6ktNMMPAp8NyUNJhi+s/y4mGVy3tFKe4qEsRymOMuEKzHT+Y/CzVhm2+icMOrfDT/BVghInWek2Bc/KMYmwVowBf0F6ba60Ekzf9nlTw6q8/NUNh1+Rebes7eC2kiXsvfVd1h4l8LQOKEsLgnL4aHYwCB/19MnOeRTRr4c0pi30haQWH7PttEX6rx6U4kHlnrtMWguiAJytNlLkCQB7kOnTsY05bvWhq7JYOzdAxRxPXmHnIOIPiuKsA3l/i7j2exxEkdyMT2LrpQXoaa5c2nMgwixTKtkar9DBASnXd1Zy40KMUjy9/jPrHRBc9HvunN2fH9YewfTJ4rP3opGnzOXo0yRT+MPS3mnMJ/2afB0/pGB/xfSRS+cJ4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B2wnBznA0wUwxyFCe+DgwbtTuyjnhU++vDMo/Tm76f1I61pvcaev/5PYCvFB?=
 =?us-ascii?Q?YcPKWUpQJwbohqdT7zLNmf1qcvwaBe/uyR5GgLNxwwiPv63h1z1iV0G1+C4c?=
 =?us-ascii?Q?kfISwDOkxyR8Uf4I9KD2N79ALa2JcQ/3hmDfgEQx0qsSq810kAMRq2unPf57?=
 =?us-ascii?Q?xKlPLiqB2dT/PnoPf/vyuZbsHWhTZnkjva3nooxuecVdyR9dykX5t4KdCdBT?=
 =?us-ascii?Q?b/Zj8QQbIoEoXtEayBqnWM9jGSv9VihIamnmP/reZO6vqR/gb2zW4wCV8G+b?=
 =?us-ascii?Q?Kp7HdojUXA6t4EJ+y96KIP35WY9JWM7UEAenXxSFMslyCfuKxir9A9Z0PgBs?=
 =?us-ascii?Q?I50mCi7E/CncWzUBLK4ES8VxVq/lG7rkl2hS0zgYn4nQIue7ItikOolWJ+Az?=
 =?us-ascii?Q?0LHfH+Nom3CiTrJP7a52taktTf7BWnHTY+kUbZpuEEJ5nZpByUQbIlUgM2zy?=
 =?us-ascii?Q?6sZ2+53raSJ3kzDt/CeMzPkvDKAlNPCMDl3//3oOHtg9T7iuF7RHPE8dp2Lp?=
 =?us-ascii?Q?nB9GNgyHuhpvKnNPMM4KMrS7uY+ip4Nd7mhDnIHjruhKD55lFlFni9qJ9kYt?=
 =?us-ascii?Q?l5zp1Uk3K4v96wzwGtIAH0M6PRK/crLaAxIRwGli9mji+jFevfeinWNdGCg3?=
 =?us-ascii?Q?jjYPKS8e2/d+BWeBuTmU+nnFePdfNu3OIykbgZTC/763kzTCL77x7YGYJshN?=
 =?us-ascii?Q?pifQ5TEoUh3ke2b5a5VKkGdF9y3cVRL421GQ1kskhj0p8OUE0vooQ0pPEJfJ?=
 =?us-ascii?Q?KEhhxZQWMvGOxJ96ts/ZeFR5Ck3wUc6VdtNXM0YGPUOyaBZrH5Mpq6QQZH5p?=
 =?us-ascii?Q?KUtrLq3yDaikUKd0fqVR8h/6m93ccQwBQ0BAbVE+BEjkTDl6e1LtzubU8uQC?=
 =?us-ascii?Q?7WN9GyQGpEP3XFOtb6iyL4ONRYc4m2yHEYpkFHK1zl4irMRUbltEw3Y8EdCv?=
 =?us-ascii?Q?aT6f6Z04Vv8UpUQLt3Zh0prXPAPG7uop1R+HQAo8XCn4TMZRZkYRNCDAkrP6?=
 =?us-ascii?Q?suwQxm1JyIhK/z/5GO83StETH8vHwSmFj4vXCzm+6hpFvUNYcN28mB1P/9A7?=
 =?us-ascii?Q?VJSNHxHWqpvuj4YvxTzin4JCx5Fl3eOZfmTjMvLzjLft5WhycbzzKSQ/bmLI?=
 =?us-ascii?Q?JBlTQRePgmufOTLIE0Ll8LHFALFJDm2MIbuJph7FeNPcIRhj0G6SOee4jirp?=
 =?us-ascii?Q?vvYYt/s/7ke2oCh94bwuY/hDmFIF6yzmM0dOoe4OuFENgR0YsUh2lAUQOIjV?=
 =?us-ascii?Q?X1jRGutkhNbqmCih82yOo40kFsxQIr/0Fyk5dkV9Y+i2ogDjRFiiqadfqHum?=
 =?us-ascii?Q?c0UnwFML9F+Ga4dsGA0Yuck2INhPHyT6yRIfrvP9IAUHnsUxnRiNyd3xsqfB?=
 =?us-ascii?Q?7qk1IYIv7bsmMzrMjIcrMQG68Q3d1sMePtNbZSbrsKlgLjCxYaaG3PBJm648?=
 =?us-ascii?Q?378Y9nZU0YM5iONo082+uk3KNMaBN6Dxr1UE0Q0EdphV6HlOVM2mnCh5n5VM?=
 =?us-ascii?Q?lTbabEIx7WWcBSfqHfMeOe6m8rWVwE59eeN2Q/wtVSQMVVGQv/ut/Pz+gBEd?=
 =?us-ascii?Q?m9W/ywJTeruhQcxRsWJ063jAlJ4BlGw+FBphKamAoR6XFIqY8s9WT8SZz51M?=
 =?us-ascii?Q?4kjvdGZzhPwzO1pZLoTorYRfh6wmOTmhHWvl5EMSJqvmRN8hbmcMz/5jLmiN?=
 =?us-ascii?Q?MpBeU00D6yN5UX9gOfQry1Ii1MsHJUi63j4xutSVX6SNPcYw+T1ojUYudDLJ?=
 =?us-ascii?Q?jbu5xwTeQOuhfRQU45dLnN0aiW4SRKYq7brZ6qQY/bX3TQ7GLA8F?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d06b770-7147-4fee-5d74-08de79859b41
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 00:33:07.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+Zox1p0EcuRB4YgnKh4crRjbn4ptTl9r1ot/stWMqBWyoN+ON8h610ZDK1pWiIw0syEIX77ZqwWzrVgdwR2TmeVDjfg6HtYnfwtA987VqioWB12ir5zbjCFP8/D+pto
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12392


Hi Cezary, again

> In snd_soc_rebind_card(), it calls devres_destroy() and re-call
> devm_snd_soc_bind_card() in case of devm_snd_soc_register_deferrable_card().
> 
> But I wonder do we need to destroy and re-call devm_snd_soc_bind_card()
> again ? I think we can re-use existing devm_card_bind_release().
> In other words, snd_soc_rebind_card() can be just snd_soc_bind_card() ?

I have posted cleanup function, as

	"ASoC: core: cleanup card rebinding"

Please check and test it. It merges devm_snd_soc_register_deferrable_card()
and snd_soc_register_card(). All Card user uses complete card rebinding by
this. If Intel test was OK, all vender also should be OK.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
