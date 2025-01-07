Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F761273F9;
	Tue,  7 Jan 2025 23:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292223; cv=fail; b=u4SBeSeA51jnbxyu9iEtmT7vl5fHCnRMcF8h0gCxvCNvSu2JtOjFV1rdRfk1scLtnuLA6C6nBaZaa+QqS1qCLJ1dsSyB7eDA8QOxsq6vlVO1AjQLHl7QNIbWf5qD7oThIz2Ia1fxxQG7rRDv2PnmljVtF7h/ySdDipcW2SivO7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292223; c=relaxed/simple;
	bh=SeQLShhMfSAYNx4+wt+pvZ+yucVp736VC0t517unWZM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=H1z04HSo3q0MiWSbB06F/2omtVvvuFvgw83jdtHrjPthRI4X2H6XWYFS05D+YJ4VmYFj8N7dNrLVZI4ars7LHYYTT+kAqIUwBmxkuH2VOj2ulg/AbbeKiRzBVkGbSnieET5CpGhQbqTZZArEJilP7bwKHSs9UOFzuZuAPT+zIO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=L+3162X3; arc=fail smtp.client-ip=52.101.229.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="L+3162X3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfnCgVt4vkjJ7ao8ID8ks6cvwmHF2IMaPv8O8t1UEDiWInn2BvDTblHKXgYgqlGUeDf/GJtTukpTaOlUDCTOm0QjUly5hlzzln00QHmVxVUWSuO3v4kzXDowfNvKVzc8k17FkC4wjT0na4o27IJ/e+z0dUNyp6xEJPCFrzLZi3/h5dILMe+OaeKAnGA1ktbWdLqlzOZNHxggOqH9fb7FHjtalpmH+wuXP84STp3XR5l2aHn3dJ1VFPKGTkjXRI9qcsJbmrZwPD4AGdLenfrPBOfFBhFkMcbowcqv0anABDSnFJvSixPd5QBzT/9sBfv/U+rQkFmrAh+N2k8SC8zLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlBfWIxN7GAqUj7/sTQkqSxRoWzCf7k+OlpuTNIJ7iM=;
 b=wJPI41zFVkvJltplBSfPz533bgQXIWFPuqZgxc32kHgl7qp2zx57SogR5a6TMHJkBqCQu0pCgcN0mrX9q4HaHP9eSu1jduBDvhoWB5B+oDJL0uFixomBoTozM6k9hqzMHkZ/xeEn2F7Vh0fztEXUyV4R2n1nDoAC/NUVAsb8hf27rJri6uSj0aDBPstMw+49H8ulSelxALZXctWHyUmUiMhgttiRBMlec//aluK5x204qz6XZSwW4fmg50rmveZuDDqhyqCW9gQ52WY5fhzS1UbR9Uqr3nQtOGOPLpj9Jv5mRliO4M076RdcY3dxQPkPZ2VHNRr7u0sljBVTDwRjXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlBfWIxN7GAqUj7/sTQkqSxRoWzCf7k+OlpuTNIJ7iM=;
 b=L+3162X37Cl/vlm/qgx51hUgepYPbayjGcAJIP5tej3GbN4xEbIQ5GXGzTjnq/GHytdcdmoXzK/8RG9Q+W22MLgdO0KgS+TlHKXhXL9Q/ojn/bcay20HVYlbNEwwWjunRZwpxrLnczaXdR564rvMKnUQxTwUkBttqQR0IUFGf6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TYCPR01MB8615.jpnprd01.prod.outlook.com
 (2603:1096:400:157::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 23:23:37 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 23:23:37 +0000
Message-ID: <87y0zmky36.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add missing maintainers for Sound drivers
In-Reply-To: <38d57b92-a03c-4dd4-bd0d-2c1ae5d1a8f3@sirena.org.uk>
References: <87msg4o4zu.wl-kuninori.morimoto.gx@renesas.com>
	<2505bc4e-2968-414e-a7e0-4c0ac0862c55@sirena.org.uk>
	<87ed1fmrsw.wl-kuninori.morimoto.gx@renesas.com>
	<38d57b92-a03c-4dd4-bd0d-2c1ae5d1a8f3@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 7 Jan 2025 23:23:37 +0000
X-ClientProxiedBy: TYWPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::20) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TYCPR01MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7296e6-bbf5-4714-42bf-08dd2f725000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bjy3qVtmYrSkgypwSP/fsgbuvcTINgevLWCM4Z8C0AWnfb+ujy3PVYsMjxHX?=
 =?us-ascii?Q?V3IJSXKaOgisToBhATMO7nOVgYM0rchfBCBOCJNxsXWU/7rFwsCPWcKUPqs/?=
 =?us-ascii?Q?7x0sk02DCHFLwa0L9JH8bD3Cj9n35B5a+T7VeF2t59aGFevBXX9zWYK2wn0G?=
 =?us-ascii?Q?/1B7hzEX/U8lAQ1zoVasQubUfeafzzQpy/msINgsckEAm0Q6vxJDJW79V3pr?=
 =?us-ascii?Q?mG11L7xZRttbxYbAWGruJn9bBatbXcKxWnXjxki0JBCi70x8ETxxcGQ+pzPK?=
 =?us-ascii?Q?MMG8IIp061VRtbxN6C2w+M4vNOUyb2qBJkSBoX8uNetEKYBV/C0k9LCLE2lg?=
 =?us-ascii?Q?cLVCZimyJcfecclwuc8ZOoVlXgZJ/LxIWgQJya2voJfnrh9dyqKZs4wmceKy?=
 =?us-ascii?Q?5yENa+BY9s7naN9XVkYYYhPijzypQmJ6e90nRENh/il9RWttcazuaK7TMPfq?=
 =?us-ascii?Q?TBtkSN3CK/1kdM6nXQrGZZNLzOwdQ466ktxLnz0C2ee0ksLOsOJ9My4TckJT?=
 =?us-ascii?Q?QTbAD3lhF0vpwgEKkEYgyZyrED2Ob2sgf8oaAc9QH8/f77nLUDuQibGHTkxq?=
 =?us-ascii?Q?C2xwqtlKIxZH+cnSSKx0OZ/1/9w/jOtGe2gQf04IxMnEtKFOKhfrgkXMPwQh?=
 =?us-ascii?Q?cyBj9/iWddfFrjOBygnKYWyzLx5WNMd8aHIT9E5dT1Z/kry6fQw/jXt6XI6w?=
 =?us-ascii?Q?CpDvFsIL6arFURQzVYDAdscvIAczFpqf6LsINvCSPmY2CP6xFJf28ldGGi73?=
 =?us-ascii?Q?6cxfscODY0KJ21aXyr7CySXUV02eELITVM3PmzxCD/yOaybi9iFrVQ5rOaIs?=
 =?us-ascii?Q?s51B5Svazk/EKbDgI8/41yy8OslsTe7Yy+o96+EhGJAuIVcdswgeXNYgL8RB?=
 =?us-ascii?Q?hFzgSrnxB9Sm7EYdjvbi+Aw64cXlNMji/N7Jq3eLYxgR9x835gPskn/J/Z/6?=
 =?us-ascii?Q?e73HzhLDWSnw4qepCW1F9e33VhzLtm7/b7jebsgqQzbATJFTNzypN+6B0xHg?=
 =?us-ascii?Q?RT76Xlre5B3uibURXzyTdi0fO7wEXeDItwV68wcuuKW5+4I5Tp/4NY6ZK2JL?=
 =?us-ascii?Q?KMUg6iUayrWd2IJn6jv8if8p8jo2iIwiFJcF9ZKCWMvejqzpcTRSf1qSSfp4?=
 =?us-ascii?Q?mBfDsQrEtStnfi90RTL368ZTtd0rVnlNxzN+QkBSAysn2VZ8/ydPMRoHju1t?=
 =?us-ascii?Q?xGQ5cPEYSVproQJ1OdMgSfsRaNfN4dITguyqfqKXWJfNmLH0Q1AynSiL2lU1?=
 =?us-ascii?Q?C6qviG6C/qRqmi+Sis0GIgvex4JtrvNUsDUl62aUeWxMsJ8Ir7b+Ay4cKE9Q?=
 =?us-ascii?Q?iL7zt1nZNP+7K9uchzu/2tcZm2LUwwVJDXUYSHuVCORZx1PGwhWFxcO5DkeF?=
 =?us-ascii?Q?TvNU+aX/in5BHuxVS4mX5zuSedFFl8jmosVfgukKVN8Z/lZK1bxGXBaZmFY3?=
 =?us-ascii?Q?3raIWKIK4n+jVeWAZcuDaRtESotKs15/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7YZD3nXzZDUgX5Z+2KuUKWV//FjfljeA6X4cPGlw5yxixjFXEoo83fjTSeyq?=
 =?us-ascii?Q?v6TF8l2uZ95HFpNepc4g8tFUSlF3GiHWGP6bgJS22gMc2ZpzeGa0WELwiPU5?=
 =?us-ascii?Q?o30cNNVa9PhI7eybFGTtQBUCgYaNa12RshG0e72T3llOGuNlCsQVroYC3big?=
 =?us-ascii?Q?hpF0F4P8mHq0TwESTPfTHERmbqJtggizYcHNbn7IvDocL4oirwZ9maNpSaOk?=
 =?us-ascii?Q?rRYilO2mECqJXk2BmHHtru2YVPPdxQqlZ4OF7p+w+KXRHsLPUJDF3h+yU7SW?=
 =?us-ascii?Q?gcpLAoZl1ZIO5aJ3v8nKRFYzSK+a3G2GqYoDjgVvcksTNU9IB3aqlyTe4WgM?=
 =?us-ascii?Q?qJs4QpMdF/0H7994+gYEwCrcxh7ZSt+b/5gngG+9bD0axy1ga3AArj/hOVZZ?=
 =?us-ascii?Q?l0LnztuD2ytAST2/S32AExIQZz2J8wQmy7XsNCXrugU2aXBdrP+vk2wMDsqU?=
 =?us-ascii?Q?dK1+A5SWPHT31enNKnuxEyUpx8ZNuL/vT3ONZaEtsKE7drtYKEUfRIVPun2/?=
 =?us-ascii?Q?Aqtvf1K3DLoCZP0e+6tDqOjyNDiFd8SjOMd5/SZ3kBwk2n57bUKXTLzEyDC9?=
 =?us-ascii?Q?PBLnr9JOokoQUcL2zz+ozWDMBLawWrm785AMLSdng/M1PIJvPqWUJvj89Fq3?=
 =?us-ascii?Q?G02P2qpBY3Bg37EusPDTW0k+bdtWVmCbr3YFtiaE1VsvhYb6lFcv9Q3dMq44?=
 =?us-ascii?Q?dclMi3/zD/aJQRbthBbhUQNseGwJCw1ZvnkbL4z2+DPfe74ytzw1ROj7pLZA?=
 =?us-ascii?Q?8/nfP6p1z3fwF7Lju/MdJks72kyKsXkPzrWQizfO/f2qWWciEtdtyb1D4nnP?=
 =?us-ascii?Q?eOGQDZKS4x3oQI3Qm7Hgc5lXf933292rDaYWSj7XGFLm+H1e++JDOzOTDYYT?=
 =?us-ascii?Q?ZmD8ulIvXvJNb+jMdZ9LbIYP5fxCDC+6IK3/yFd59MX+vAy5+Df5SR1nuc2F?=
 =?us-ascii?Q?caXwc3A5hLd0NxwZH9TcTGI/t/2rhj+JZaY7ke89Y8cmiFrtQs8yL5pSWjQU?=
 =?us-ascii?Q?1dtUfTIl7VAh4LN91Ga9Y1Qaw36qfuY27Gcd3hr42KoCxJWErcV45ScDciUn?=
 =?us-ascii?Q?YM/vlYtRpdszuJH/tCHR1yl8YKd3O9Gm+rb/QsdTJblw3JENNDGiLjD3bWEp?=
 =?us-ascii?Q?Pnmsn3b2x4EIWTRz6mYaHEnLSh8FMLS6EwQGcerZaxGA5/1NwFPrtxJEEypS?=
 =?us-ascii?Q?dpcY+cFKV9zbPLQL5d5bbOQiaqHjNBnomYrK6o9ZzW9IVRa5CWNhXpd2+jaf?=
 =?us-ascii?Q?dFLDBKAOzUdxJtTLJpmn3TmQYHQhTpDdNRUpkhRJvb93jS6Sz/UujfkyM1Sy?=
 =?us-ascii?Q?YwSrUOfwTnaCsS0Kmmf9XqRM+fI0G2fYBnihbc99OBZOfPbkMYwQM8VSVasf?=
 =?us-ascii?Q?crkjEYsiWu4LQR9c6thhQxt3q3uLs6M/wQrGoPx3BxF5NJOsba7mDz2lNc+1?=
 =?us-ascii?Q?eKViGlaYWN4AUp9bckqUSlZgK6xLBRXGGOqPdgZO7AtgXjz8g6AeboXSs9CO?=
 =?us-ascii?Q?lrSv4F52HT9rbrXs4NAOUuLRiZa0xfHa4mIKTtjxHAvTXjrSt7bS2AmGr9TW?=
 =?us-ascii?Q?ZyCJ9mnrfLamEqvoD1m8Tg9s+26A3NBhajDe2t9o0iIOkFWnFXGHOXfcu6MU?=
 =?us-ascii?Q?mSy4J5qLpX9Iig1KDF7Ff28=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7296e6-bbf5-4714-42bf-08dd2f725000
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 23:23:37.2624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIblYy8cBrrP5KkgTm6u8LnSRL8dMj8tiqYpfgfWJk8T6Yk+z2SFu9F7PPAuzHXSKWmtIUk5pKyvbWRS5H1Jwv9lZV+27szkX+MBNqZX+QYFXLwA+cXDzNV7Yc+Cea/J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8615


Hi Mark

> We could do, though that'd also pull in generic ALSA stuff that's not
> relevant to me (which is why it's the specific patterns at the minute).
> TBH I get copied on enough stuff and the volume is low enough that it's
> not the end of the world.  The other, more specific, option would be to
> add the individual files.  It'd also be fine to list me for the generic
> cards if you like, it was mainly R-Car that didn't seem right.

OK, I see. Thank you for clarify the situation.
I think adding your name to Generic Card is more simple.
Will post the patch, soon.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
