Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DD32DC77F
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 23:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757633487; cv=fail; b=TSiwaKgSwDK2STaxZheOYFnAcsXtE00jJ6FvBO6QLqPhrBu6ecP8PmoEIWFuHVH6SX7NRZPXV1EBeUUF2fUcY8z8VaDVqXQ7koO0wpVLJW06MUoX5cfydLfj2rR7cejBMaeeU5znNUiK61fK4OsDxBoRkqhqE4dnTEuKYei/K+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757633487; c=relaxed/simple;
	bh=f5ae3a0HEnj35CDIABPD8F+nsKcM9nfF2cxOdJkJMmo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WMaIauxQXmtxf++VJ4VUg2nQbVkdoKNsLWlvHoPyGa8Ej6tIdo7E7FlZ5TuuZMQCEK7jiqfR3klZseUz4x6jDy59js9HUMAzFKdCR4T4y/ECTtky5ev0LIgwpzejzviE8GIDd8t0lBiNT+x0jH9p22DswhCR5sxs/MmnRqT2LXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bk0N9gyg; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bk0N9gyg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bs5LicGzyQRmy9gjIRTsCZ9b0fABQFizbbyXOE9Dy73dj4X3LT/uaBHbyMTztZvzCjiYGImQPXRNfdjgAPEFmt/sVgfyjm7U0aABYSVByNJTIoz92vxx0bUEOS6Ek2qVTqEuao0Wov8YP2IFsUsXHWqhd/GzRO7YrACh4gAhyhr4H6f4MPELs4rYfIeSVD/L55521epzbu7FQFMcWwd1YD4akx6qSRxUncyRirsyauPR221OjVHm0qf7tDN0K4BwiTHrpixLPHIV0CZanCow92D2tvpvD3Z0Kqe4fXgz372FmVdQDlwRwPUwANALlpjRBAectpq3eOjqDt+MF2vvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy/rV6Ya12Genh2ejZ4RS4ubYygZpZFA4rY9DMURjRs=;
 b=P2QxPU35wUmzIYFyoIdSjpL+D66h/tZl7K4zzPgKqNvP/LhUrPnW25KJOp1iqDzZlRKvevBf/0vp4+ne4QYCi4LiBPruPeMUGnlYt0/UnMhSLnCxVkunq5cuogYOvwrt+PRvYI1jw8G38XcbyY7VWJgAR/HAwL2FllXs71L+auxZW/+suf8tQ0lL1kzxxXHj5DsX5rDiXRMDJ4/HSKVgleUlfPaAB+LIrxk8pZR2dx6cQhcibbLcJvGQU0SHfwfbb5Ax2eCv9E+a7bCF9Ak+AT81w2Ubh71jSRzEXo6132BGuHczqva+rbhal6qxZO+gKP3n3X0AQqarKD5boFzcjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xy/rV6Ya12Genh2ejZ4RS4ubYygZpZFA4rY9DMURjRs=;
 b=bk0N9gygjHHaOI7arGW8nrU6M8vlpQf64kP5CvtbQxRip9m0Vn5P5PY8W5va0vJKmCdoNiz67MQmzij7sB8isqzJnLx/Tki1cR2zvHO0R28skVEsxJsrfet8Fylr0znRCLmvozCr3Iw3erKRJFCFdK/+sb48YIGJQNdXuGXaNIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12437.jpnprd01.prod.outlook.com
 (2603:1096:604:2e4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 23:31:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 23:31:21 +0000
Message-ID: <87ldmkftx2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: broonie@kernel.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH 1/4] ASoC: renesas: msiof: Use guard() for spin locks
In-Reply-To: <CAMuHMdWjNV2TS1DVOUjXV0iw-ioKPqcYcWG2eYe6=prsTf4W3g@mail.gmail.com>
References: <87jz291yrr.wl-kuninori.morimoto.gx@renesas.com>
	<20250910084736.3336686-1-geert+renesas@glider.be>
	<87ecsddfqr.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWjNV2TS1DVOUjXV0iw-ioKPqcYcWG2eYe6=prsTf4W3g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 11 Sep 2025 23:31:21 +0000
X-ClientProxiedBy: TY4P301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12437:EE_
X-MS-Office365-Filtering-Correlation-Id: 491ebdec-f553-401c-eeb0-08ddf18b50ce
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eOyGPDfLk/v99RlnOVd5M8RMG6f5h+PeUcQ1lEHmB7umpl5eqDQAk8AlJ/6e?=
 =?us-ascii?Q?EBDXt6dCTphutWdLm8mVYatJoVM081iupXg+IXJiq+p+WejzCnSI7foCCTue?=
 =?us-ascii?Q?QOvjBEUYcyvJHM9GCwOiu+68AqS/skx34fOOpWq3IpcU3Be06auYDYqgq+tp?=
 =?us-ascii?Q?ri9xnhU1Jg/ca9O1EMHjYzmbwgZxLmHr+bdEDivhiy2FEfsZ/uwGLZBv1JQp?=
 =?us-ascii?Q?bGF0dVIER0a/9wL+5tXDD6Gx5dvj1YKXCNLJdKRNFC4TwzJDHxZTYcA/JW5B?=
 =?us-ascii?Q?xXB3JThUZAG8vSq9ljMCf+QTeM/zA7Xkf5xxwVzSepVyFbGMcHlrCJLRRxB/?=
 =?us-ascii?Q?G4N/mdjmTnFNzPrVv/QwxTPS0VnEwSl5mt2q9w2AkTpkzhR3m+MlXsHaXXqR?=
 =?us-ascii?Q?vYA9LdnG77lqZIJnmKT1pJfiFitZUMAGqUx9LvD5sW0P9WpnMLdCwiQqEekm?=
 =?us-ascii?Q?uw852bnydrHJeonU4+Z7sdX8wYDHWlBTviLyMyEzQ1W7OAlsmnoEh+Odw2i4?=
 =?us-ascii?Q?WL3sXwHBlDIOTtEvYzXeRhtsrOak0VYVOvJqIliq/wlaIKQc/NcNcFdY4BJy?=
 =?us-ascii?Q?r9Q6S1xFA7PeRaIQBr2Oqa+iYvVFSshtbVnfM3vCDR1CALBumrGOAPzfWGXD?=
 =?us-ascii?Q?1fRsCQ2Sf3CFHOzFUKwFL/ikdx6BxIM8TfNj2+0YyG7BmjlvTrjGBpoY9CX0?=
 =?us-ascii?Q?RAueJT5sbWJvqTUVi8/sVeWEIpegBuKPsOJ3cz7akchvcsfQ/D/fN/ffV4me?=
 =?us-ascii?Q?lWfmaJoZKC/6qf0q68blShaZGxXGXFqPDdLGI5wTL0Awy6M80Jd6UBSE8B4S?=
 =?us-ascii?Q?86KzhTiVxUugc/MTp+b6J++yiRrvaemLUcBxYgilkA+5R5TP7TF8FxETgzPz?=
 =?us-ascii?Q?jBi8dHFIjGujY3NQ6sJTLsXqRjlJtQfKABwvoQlq/UcPJn9sARmE6Rawjk0r?=
 =?us-ascii?Q?VKG+i3KI+J+3fy33plKH07ZOfBem/dEKVVH5oVzDrA4kSwzbPGQcvITVPA1W?=
 =?us-ascii?Q?biCcmHr9W8jUJ5QMQ8OZFFlS0Kg+oiOU2uOpe8tunfoVBUkCqMO3MmnGu9qB?=
 =?us-ascii?Q?hxZKdbla7rk1HnV1Cr9ru1TvoMH9AOD5pR3BgRP6GkCtyGajniuMwyBgGS+M?=
 =?us-ascii?Q?DzOImXI5jyjc6A3bQLxid6A7X9QjruUn1gG7M3ekDbb/CTFFbyD7Z3iyh9Gj?=
 =?us-ascii?Q?uTMfx/Mzi/oW25FNo/eh2ojoRpLG8Ly5unWtCl3ygtOQREb4SDyN7o+u5UID?=
 =?us-ascii?Q?Gsi5oG2R8Dy7EmGcD4v8r0DyHWt5Vu7lmRCLbduTe0259rIL4IpOj2TTp++u?=
 =?us-ascii?Q?KnTcWzYpTCjDCiJF5wjRa8rUfvaa7ztycb8hTFw8+Xb0qne6gWynLuWVR5GD?=
 =?us-ascii?Q?MgM/UtE9kCaGqBz3VMgljp8P+PlHUnohnlGHDuStFcPi4PH6DXJSk4T1Wgwu?=
 =?us-ascii?Q?ZZUfF08KwSpZJNTCjKNWY8kpFR9pLTPg5FoVQ8iyhf7BqYnQyMIXAKoikRoe?=
 =?us-ascii?Q?+90HNtlQoFunLeE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GMcD65h5UrWuZGOLWx6xMIzDeUNFA2Wl4sbSmmrgQrnO1x5icN0HHzbo7NLq?=
 =?us-ascii?Q?43q04KhXYGVtlm6Uph+Y2krJabcy+BtSrGk/8etCrUOOgqOY0OyAAyvZdSJW?=
 =?us-ascii?Q?2WqTena73HrA4e7ThPZr8zoeeAlnKGyFLKKzygMqtpcA4e+X7dX2vkUCVRzs?=
 =?us-ascii?Q?nCurbwr6DT8DGg3Ggc8h297ntYW9fy9Gu9BFrCXQRpMZUblRf51xGr1tY36d?=
 =?us-ascii?Q?IkmOcCenncznzUoEJLhtOIDXKejCuKTjn3LrHJcNdVeIHI/oDz4pmyL+Wp0t?=
 =?us-ascii?Q?YhLh2fC/InUoFcMvmFK8k5WyQ+dOj9QNHAXhFY2MyXkuhpmRboql9q7CynS7?=
 =?us-ascii?Q?yBw00TwungLdM1vAV1fQ/3XOaH5SqTRrZhvE6pcSTADkLn6IW91mBt8qpdXJ?=
 =?us-ascii?Q?U3VqQ1W4ZQf7aRTum9IiUFuWPT0nmGXTkkJz12ufjit6PzBwy4PWy6M8C2Rw?=
 =?us-ascii?Q?VQX/5mv3A8rRFczKHpTco3ZU7lLBzYU8Iwd21KQgbyiRXBDKH9/AZWLP3a/M?=
 =?us-ascii?Q?wCe5daoPVWvH4qEvdQNgdRPETc3+txBmWTJxIgxX4PTlQ70luEAI6wzVmIzJ?=
 =?us-ascii?Q?S8SB/tkuBVBMCkyG5DXEZ7pdgRzzkQGp2CDKzDIYcjIdCGYBUBG2OZfkXe1d?=
 =?us-ascii?Q?JRFrzgVwjWjNHmdl9YgxEYTbjvkiq9zAqGlXz9/FYTKFxM9lX9tM6n0ysXxs?=
 =?us-ascii?Q?crNRaJEr3jANujxm27K6NSk/kSLlw+kZEDSAscKQffvPI7F1ekeAaxfg/GYl?=
 =?us-ascii?Q?qe8pHtlkLn8wdg/1gHbCAR5EzYucqNPTxdmQ8j2joYja6svQQOGzOEwa/21j?=
 =?us-ascii?Q?xhy7k5P7iRVIQfsEO5OMOmu9Lo1qxj4N9ku9SVtnw7c7VizdA110XyYJqiER?=
 =?us-ascii?Q?oOqN68ytXgXECpLc/G5CCG81kGoodV6yrzCfvJZ489GhwloPeGh1RI0DlsMU?=
 =?us-ascii?Q?78/iVwoIa4QMyTmdwkIsPJoUfTGvom7w0i5rtZR30auNa7EdTvlMxsX5ewNc?=
 =?us-ascii?Q?ghjMFXbHY+8am4eLV5bHM8HH3oKsUf1Rx6Tp1VpdAGGhQaNQJeYhbsLIuDs7?=
 =?us-ascii?Q?UxIEOBi5Zmzymmv/dpZJ6R72ZOC7l47upKkRgjgzzFeCn5xFUrdrLvzTS+eX?=
 =?us-ascii?Q?vAUpTbGqM++JiPak50Wa4YBQX+t9OG2k55eyBxheHjmYEKRhUXkaIzXlQYl/?=
 =?us-ascii?Q?fZrOR15ZKSYB9tcPJLjMuaviye6Yfxi59MYp14GzHFEqbAUHCM33vwhO1wDj?=
 =?us-ascii?Q?KQSP7UJLJa+gF0vDndYaR/sBWq512WvEgWXwj/pST9jRDlay+fxX0gFyF67l?=
 =?us-ascii?Q?oe+B0WTcOa6MzcI1sE0NRXGBsAdwBDaPLAVmeWUFWqpavxLckiK9otHKVW3a?=
 =?us-ascii?Q?nUShLPGkdBcJYnwbuoWsSZU/U2SAvZ1tNEFreXln/L8Fgata5UyiUgfDYPxp?=
 =?us-ascii?Q?QSVMEZDPooc6X4wy9G46HI7WS0yWvZJKqmQdHD75QJSNpGOwRDTQf8NnQgIr?=
 =?us-ascii?Q?jLW2HZ1Ra8lGcCADX3ZUNtv8Yn3Hhmasq0irjJ+8q+n87Pqk+wVLb80VPaQv?=
 =?us-ascii?Q?kUspzovoC1iN8M2ypj2c+lU8YbMp2mFAMMAz9FE82o81jGB/cmNehOce2FHd?=
 =?us-ascii?Q?rntE4ngz2P+uGNDSJwx25y0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 491ebdec-f553-401c-eeb0-08ddf18b50ce
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 23:31:21.5904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKSay7zCxiw22UTByFWHHgmDHSZjUzTkDdxkT4lpw+qxlkOH7/qdto3L4AIH6Nlza9ol+h4nUsVJV3rI7+sc6S+2IM1uGs9DtnMm5JvBjnaEf+BzQ7S9e9oBsZVVqc+Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12437


Hi Geert

> > > You want to include #include <linux/cleanup.h>, as it is not included
> > > implicitly on all platforms.  This applies to all patches in this series.
> >
> > Oops ? I didn't notice about that. Thank you for pointing it.
> > OK, will post such patch.
> >
> > ... or can I add it on <sound/soc.h> for ASoC user ?
> 
> Upon second look, include/linux/spinlock.h already includes it,
> so please ignore my email.
> (I must have misremembered seeing kernel robot reports, probably
>  they were about direct users of __free).

OK, Thanks a lot !

Best regards
---
Kuninori Morimoto
