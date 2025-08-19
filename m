Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65CD18E3F
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 02:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755569345; cv=fail; b=jiN+PLcVRhj2zKmLY/cZvQMe2ksfU/pM937F6amGVQ120AsKETv6cdpLf81aF9RSPTbr96YVwi0nO3G9M0T3+M8MdDdO4BSxf3YTbtsqAZmVWlqVfVmqP/i2tDMhxrsHtlsV+YXa8BE05u5H0nf9H4+mAN46Bm6OWde4nuvMOp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755569345; c=relaxed/simple;
	bh=7KhZDWY37oLvve4GW7ENrLf8Wujl/ocWFHqQ0+2izEs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EGltFEvbD2rGPSCLnn2iw9LxcKvE25qNMKYzxmbX+9jOEvjLYWaBYCIjuZ0LIf3TKSnoWF4xqKtJ6LVWOe0tXSTI19zU/yKiotAFckpMMI3CDvUbKOL+O1e4a+jXHUR07FoXJNTmXNE78AHkP1IslM6iqrsENhJRLxjgAVbmY+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ix2gOjyt; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ix2gOjyt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCNB+p2eRSmiPPtFP6N0+tf4tfIYa/Joo7aeO5IjOuCNvmU5rTPEdpH09U3FC7D/XP5lUiAhI4dxU3eetVY6ZTfKAr9FXIq1X3HDqN3E8GvcPRIsSDvnW1QaUePBQqe5P/QLb1vbnQQRZWZRZTnKrB11CroLZL3VbarLRhbd5JtDTPqnm2nyb9/vic/CUO4WmysNw4LqpLoIl+NWlEqrABEB16+8Zt43TUhEZBQD+bP3/T+zaOSboy0ILvpl9e1w10rJ+rCezGKpGPnYp3nxprYswGJihWXdfa0RMxrkepXNLxAKeuMfteKUE9c1zI66ugM38kKR4s9v5sg5Sdq63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exMFf2wlQ7I5OCxMLPZ2IMxY97+QoO0+t24aqO+/NPM=;
 b=ehj/Dl6ztjBfbYN0nT2hkLU8NocgnUIVSpu5RBf7mFX+jaEmEJopBudRUR5Yn6YAwvCb9Z4vA/ckWYO2aRvm6bG80V5+xLRCZwPs7hIi4vD62cJ8csVOG1q8dSe76wgTiNzYv5ej6UmONscp0162LgQ3RCM9ScVFxnzaFzW5gWv7xwFdBDC8aaHN39OTUPkipl4RLemfEd3CKtWcKc/zShyPKpgwaa9DN3ReLSmOuOQyt6g5ITUWTw5byF2Ucx7cyqVM3vsrOz/6EBSbOF/SiB7fwNKIf/hacpDRewVo6uttViqmXJ1IvXZTz7IY07eB3m2b6b8UCBjqbzgpe1qYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exMFf2wlQ7I5OCxMLPZ2IMxY97+QoO0+t24aqO+/NPM=;
 b=ix2gOjytmKL6HHFa96cYuTrf9uh5Jd/p/FtPewL7SipBocqa2DC/8xdG27ksC7sioPbhhWWTK9tabTAqRqbxell2mBOxkLfRYrqREVSulFrqVpd2z1uOIhKTeDJ4ge2qEe/eOtqLEDX0OkQGH2M8LqYVTGHN3VlFmsF5J+129bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYTPR01MB10936.jpnprd01.prod.outlook.com
 (2603:1096:400:39f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 02:09:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 02:09:00 +0000
Message-ID: <87bjocysec.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?Ond=F8ej?= Jirman <megi@xff.cz>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: merge snd_soc_unregister_component() and snd_soc_unregister_component_by_driver()
In-Reply-To: <ydh2silrxxmz27pjwgpx7nakaxwxllq4q232hdoybfs3gjwt6e@523okt2uovjq>
References: <87h61qy2vn.wl-kuninori.morimoto.gx@renesas.com>
	<arxpwzu6nzgjxvsndct65ww2wz4aezb5gjdzlgr24gfx7xvyih@natjg6dg2pj6>
	<ydh2silrxxmz27pjwgpx7nakaxwxllq4q232hdoybfs3gjwt6e@523okt2uovjq>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Aug 2025 02:09:00 +0000
X-ClientProxiedBy: TYAPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYTPR01MB10936:EE_
X-MS-Office365-Filtering-Correlation-Id: 02733ca7-6e0d-4b69-9c42-08dddec55d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-2?Q?DfoqL/ALUV3T/Nabux0CyYChcpuU0TjtJ+pCsK/d9pRSEe7GgDrQqniKPD?=
 =?iso-8859-2?Q?TjFjXlnkk7ffqWlCwauhNfr+NQ4EcIP3iXkaEZkUbvM2tT863CQ/PJiPIQ?=
 =?iso-8859-2?Q?GDqnJWmuRQWaHo5rlKESPlU579ftPAQORM7JNW27JbODUOCFCWpb9FTJcS?=
 =?iso-8859-2?Q?1MKgKJE8gc3pHw18Eg64cl7Ct6dS0Xv/Zhx3P9XQaRkwP45k1bQKNVg97i?=
 =?iso-8859-2?Q?fqSSl5g4vA0b92Zb+BurStJ/2CYPKnDfLOmcXUQuB/5+yLj2AIfn1ESoKi?=
 =?iso-8859-2?Q?JCluOo8n07IuyNKdWwfhZYjBj43R50sDuAb9RHRxiiYJVzczN/NjMu8ZUW?=
 =?iso-8859-2?Q?U/a891SWPCrF7ZFFHYMo/lSrc+KexW2nPTwcM6RAexShf/eWZTFDy7/Gcv?=
 =?iso-8859-2?Q?fYfxhoTf9n2RBOkbBH7DdCR+6/l0NL/GV17UeBkEsUmV620OaNV6ldOqD7?=
 =?iso-8859-2?Q?y8rpaX9PN/9k2kbLF3ko9hN7i/hpi8AtHNZlWaqZ88bdng4XBOHZsJuHrN?=
 =?iso-8859-2?Q?I+6awbhMniJ5ukyZcTJtn7kLMps2GmfZju5CBctgnghASnNMDaPqZRM/Be?=
 =?iso-8859-2?Q?U61zW1mBxDwPnqaoMLqsQyK9x3QEN8d9jhYFBLj4DVNGhfb9feab7uNovs?=
 =?iso-8859-2?Q?W5EHLGXi/NY80kpHvgXbkOogBm7JSe1r9e1j0CtflJRtHic8a/eiO4I8qW?=
 =?iso-8859-2?Q?1Fkgbdu/2mQ82I59GWsEQg3t2xh70w8NYU/BIDK0AJWNT+4FTxBw3bux4w?=
 =?iso-8859-2?Q?RKXRpqTgs4RC61hcI2qEc0LzhrczNoCkZCUjG8SPaVUakOYW6frWC06Abs?=
 =?iso-8859-2?Q?J0I8iOaNErSJPiYkwchQ3eYlkIeuWX5cj6CLi3MtH060/R4qrX0wa47qMZ?=
 =?iso-8859-2?Q?A3Jf/4Xp7GHMCFLsBJQck9m7weJQrr5Nl8p4IO97F9fJ6bzdkRrFMlgDLr?=
 =?iso-8859-2?Q?4Gh72cODhQxqMaLQrr3OAB0Yuu2LAyFaaSx8DXXECtbwVSGWTv28NIkMQO?=
 =?iso-8859-2?Q?F73ajRfrpfTx4guJe1RwH04GFZw9OHT3EIbVwq0McXqlBaeDy8CBGfyZU6?=
 =?iso-8859-2?Q?yB9Hxt1bvy7NtUizHm09u/iSbeA2eJ9ahRK0kpHsTAOlQo6rVj205lThIm?=
 =?iso-8859-2?Q?Hsa0UI961z+J+ss7RhjK9vrG5/7JX92QH+QbvB/7fDUpMHU4jv7MGuZ4Xz?=
 =?iso-8859-2?Q?0BJdsaktemE2ntnxXTJrPvO7E8MJXcv1fqChAzFNlkuAGL7+e9Z0N1aKHo?=
 =?iso-8859-2?Q?GxlNRQseNkleuDbOcG9UkhRhjh+TwnV7bXc1VwWO6Pqb0zGDUJrM+2fC9D?=
 =?iso-8859-2?Q?5wIdqLUFkxpjKEaK4myO/RpiwXLwFHzwvj9G52FjKW/yHVnOtAhnrWrxVF?=
 =?iso-8859-2?Q?CmGOzFLTfVpX4PtqDaVZ/2Z7B2WA/lL7V5hJEtGpy4ZSltjN5Q7u4MrWNa?=
 =?iso-8859-2?Q?QkBfVpxjMX4n2nDkSvW5V+c4cz8bjeyIvd2j4r1EskTuA/cvsbvytHL1aI?=
 =?iso-8859-2?Q?gAAQXeE/MUArCda9Vw2oF58xiM6MWcq4RoGymQGq2SdQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?EnJuTKFADqmtiBvsu7KhZKM3hS7RKBY7x4UdKW7XitYc/iv5QZ+eQSnohM?=
 =?iso-8859-2?Q?xmq+yZNybzHXQhZHC4v1MovVAFeLGnOrJ/VJzcTlsFXkOr17adtLje7D+z?=
 =?iso-8859-2?Q?LaVeIHuBcYMTRzarBB8jc+9vIjDmu5E4p3PsKCQBCp6PPv6JycLRo5eLFG?=
 =?iso-8859-2?Q?qOElab+x8MU9Vlm7C6lsteoezsbSp0B+NJZMaLRU0IvEeyxGEG+hxlgL0n?=
 =?iso-8859-2?Q?oZL4GFdXUvEO0yk51ys6pOqgnIelRPQBLYIPmspIL55NKIdwC8/QA/0vTt?=
 =?iso-8859-2?Q?Py0SKc9+pHJIzBtMv0aSJE/4vgXltOBJmy7m8eBkiTk8pJypoafwagI6jb?=
 =?iso-8859-2?Q?8TquHybqGR9Z8Ig426k1wl1cgXn+B0MOJjBPOX3DTGlni0IB+N83Cw+FeY?=
 =?iso-8859-2?Q?XJtaZZgbpTLyWc6/yoAhj2fOe3FXiOCBmfcJjPEl/77y64z7TJoenNcbg7?=
 =?iso-8859-2?Q?InxrTExAcf7G8GdJQEXoP5x/sU0oB1+2XNBe8QA191W6N3qG6OR9O8jakO?=
 =?iso-8859-2?Q?XXehmB/PXHmjmFO6yfjSbH95gGP519P8h9usEU19HUZ4WdhMRF9EzGONot?=
 =?iso-8859-2?Q?sEOFuvtdr/Jp06VA3ng/XfaVutpyktCACoOLeYtT455qz5gp0DqrUAQEaL?=
 =?iso-8859-2?Q?rvNaSWcjai13SoKOY7OYpYfMqbM8OLuX5daAZjkkC2woCNZ8vpt3gqgztZ?=
 =?iso-8859-2?Q?HpbAT1pv7KBpku+Kg0DSnb4cA2IbXDx6dYNoqg93jNHU1KsRKa09ORkXJl?=
 =?iso-8859-2?Q?UrZ9EW3eQa5/UgoSKwicfsx6CI8W5r1/j4H4eue2QUnC5JfH52zzKnJZE4?=
 =?iso-8859-2?Q?GZRdEpfcOvV0ylEteEZwdw7ld/nl7zZYAcJM2kKpXzCdnnDGrwH2tFcELS?=
 =?iso-8859-2?Q?tq1cx9x2FmueGbjjuIlp6TogGvE3oerwLcAHkYs0aWoLrwFgiYsHwXleTp?=
 =?iso-8859-2?Q?EyGeu3wHVG86x/+LiWbNA67e6g55v8Rz/OX7+BWzQJnijuSymdEPAH2uq5?=
 =?iso-8859-2?Q?LEsJIXJUtOpvVrgDgb82EDkDM6v4+u1yCuHh+9ucre/GU+uvmzumZpU7cN?=
 =?iso-8859-2?Q?sNtDoyhM1F8acWU8drm2/8iKyHxnDnUjcNDF2JgVwonhnQrU4ocj5W1dZp?=
 =?iso-8859-2?Q?QEU9NlHKOfqNqLaOhz5MkrBk54P2LFffsAjY+hk72Zsjlv0MWvJ5TP9qDI?=
 =?iso-8859-2?Q?BoKQzH9s5SxFG3OZ/LEe7wAgOMg9hFnwqMXhpr12XnAMY+qvcGcv5bO9Pn?=
 =?iso-8859-2?Q?cIgcbtr9cJnoMjMa9DS+oDiWJzEIh5aLYUtSId6ABTWyVQ9gNhSG6+sTgK?=
 =?iso-8859-2?Q?v0ZWaZG7eYg5pw5QONerAgFD0romWoOUjI/WG5TeTF2LPIa2wWQi1ijMqW?=
 =?iso-8859-2?Q?UmKJh7dKYjjBaM0J79r9+e8Ow+PlO0vYx2zaI76yXxJC97eLujDukWqvS3?=
 =?iso-8859-2?Q?481kW4I7hFK/1iFwE1+FSttHeEOkdqMLF2Oepc5fjSoC53SYfcziqs7ENF?=
 =?iso-8859-2?Q?tZkOl76bdeVNnOyz6Ksk5kVBXSV7VroREb0g32hIbL9Gq4izeSw98rRyt1?=
 =?iso-8859-2?Q?3ZSrblEYu+S6fhoimPq0WIb05uQ+a2NcJlfryiPbcYXgDfI3s8QlFYHq9e?=
 =?iso-8859-2?Q?DuMowhDntEiuKyUHsYVZ+RbkyDWhHHsvpXtNQEtL2M/nd1cd8WDFcX+Vwq?=
 =?iso-8859-2?Q?4lFtHq6TXLi2AQTGBps=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02733ca7-6e0d-4b69-9c42-08dddec55d0b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 02:09:00.9086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjJDTOFF2rrn1ESAGT6sgmTef1NVmh/srNLjWgoW/mC16D4BceHiIDAObhwrZE1z9E5GWGIsLJm5Eec35oGTgDkx4j5oE+en+FlPWQJdfr/iaEIXd+1OreDt3jJnVwi5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10936


Hi Ond=F8ej

Sorry,  I didn't noticed this mail somehow...

> > This patch creates a boot failure on Orange Pi PC / Allwinner H3 based =
board.
> > Reverting it fixes the boot failure.
(snip)
> > Is now called with driver_name !=3D NULL, and this results in crashes w=
hen
> > component->driver->name is NULL, which it is for a lot of drivers.
> >=20
> > I guess maybe the issue is in snd_soc_lookup_component_nolocked() which=
 is
> > just revealed by this patch, and that's that it does not deal with a co=
mmon
> > case of component->driver->name being NULL?
>=20
> Or maybe the issue is that snd_soc_del_component_unlocked(component); is =
now
> called multiple times for a case that was previously handled by this func=
tion
> without a loop:

I guess your system is using soc-generic-dmaengine-pcm, and CPU driver does=
n't
have driver->name ?

I don't use soc-generic-dmaengine-pcm, so I can't reproduce the issue, but
I think the issue can be solved if snd_soc_lookup_component_nolocked() igno=
re
NULL name driver correctly.

I have posted the patch. Please check it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
