Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE032737E0
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 00:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785888557; cv=fail; b=KBGyMUEVYdMV+Kc8jnLL8QK0RjzFESWCLpO7KVPapku6/b2YIsQp2FWSsjN6AuEW3jykMDHpqKEbNjfRyC6/vJ6nd1Yv3nGIczApZcm4YMtgJ51PZtG78eX8wW6eeLM0vb1GFQv0dKlr5xmTtvbEZpERfJkD7TtgZtqrtLU8O7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785888557; c=relaxed/simple;
	bh=mWywsy5HSH4M6EDmsrpGsYb2UFGkgwLLy60tcy8rnb0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sgoXApOs0Ecq0u9uKBaTPpCIxXNJrdsX8EJVDgBHtKohNjRG0gEBv9B+b7IwX/8HCcFEYPfAGTkVT5KfDwEIW2za1VZeNGJgWCHMKH6RHVEAAe8bEWFJFEbMXTQ5a73f/UxaifxTvSqp4FonZuz7AwMn3aFcoNirT6mQRRk7Rcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oWv9Em1P; arc=fail smtp.client-ip=52.101.125.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oWv9Em1P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEQl0/DJB4pEcqNQm/1CoY0nAOc1/jWhBs292TKlfJnmskOzx1pESumSKQYWFa+T1y9I530GD3WdPyphT7h9RA317eLJUvJBYRpTIS2E0wK+H0Hl9UJGdjhmYScBCa42dBFs7n/tQcEMgQGm+e/rDsA7jtKNur6N7EgNPWrFFAqWxuZPnVCcvrUv+sHJ+0g3TQo7wQMvVm7IGmw5TP6W9/rNoEgLoZ5Qg++/9lKrP6LZDAB2659F6Jr+mIFK3n0skiTvC09YFsLLAFo5yBdZsNdG6iIqGPaXJLdtJbIpRTW8s0dHP1yiFfbGdCVsCEdgOChOLOJdRntpQj/Gdeo+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eplozSBWmI6YDvivPCMmVcgWIYVT/2XAm17cITLZ6ks=;
 b=QKbZh92VqY6Z6AKyqpPieSYBvqa2c91hQtiBtzvIn/c+6pYKZ6S1mtFidn6Hc5XT+Tba4LeaVIeh4Y7kvp4QJK+mL5mNNjKbcVnweZKLeIgnx3CIc+YJM7tEyLiRkbF+MGTmUbwJOcTAFJ0oDvRgE1gmX5SbjO3INvUODrgM6nSs8UfwcpkAoaiIIq3uC3Z8Dw5LVG90L5L+RCEwwLxza3/QPXZy6MwVJ0JOE1rrnkb+3rVMp4+lQsEoBaw7D9+ijuC6Su0VeIUy0iCcUCiaHaTZBrFXrDUpF3Q50GTyszDwrr2Z2Jy0tupneQf6nOpuV6cE3YCZDlQQ4OjyIfWrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eplozSBWmI6YDvivPCMmVcgWIYVT/2XAm17cITLZ6ks=;
 b=oWv9Em1Pg29ulmvxh+ciLjmiTONmNVrRDhmkEWnaSYb7HnCYo2DPAh0bIQeaaXAwzOHTgPQBiuyl7SMLfc8d6DsDpZNFrxrPU62EgGKuBRjSFjbG++2A46bMXdE4F5wbUVrqB43jhqlyNzpXgKrLE4/N72GpvMZvvNcvdsloQAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6639.jpnprd01.prod.outlook.com (2603:1096:400:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 00:09:06 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 00:09:06 +0000
Message-ID: <87h5l9v36n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: renesas: enable COMPILE_TEST for PCM SH7760
In-Reply-To: <CAMuHMdWxRASq-jwryP4prDMAQuYEBSYpPNY2iw8GbQUKh-P2ww@mail.gmail.com>
References: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
	<87wlu8rmr3.wl-kuninori.morimoto.gx@renesas.com>
	<c474b067-e549-4d51-be21-4337cb8de184@sirena.org.uk>
	<87jyq6vgyd.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWxRASq-jwryP4prDMAQuYEBSYpPNY2iw8GbQUKh-P2ww@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Aug 2026 00:09:06 +0000
X-ClientProxiedBy: TYCP286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: 717caa59-dbbb-4fdd-34c3-08def285c3ef
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|6133799003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zreyF0rfbvWm+5a74ieoQDbRFfhaYcx7vqydg5htjkENiwgOi99caPqb4DXwGf9H/ZKM2ORWphkqW39nu9JbtkgOSE3hksZ5r97J+gUOGkLETsb3TB3LvZdfW9nOyBRXmGov/MdxR5TJaZwD1YO3JWcm0ay1eP4JcfAQkMYrUDN7AoTQ5YFavmOxKUtEJD0bqr3QhIuU+OK3Dx8fpgDLFJlRnY8T9eXmExPAR0NBZdm9hZpTtMcM0Vk9u1dSKELhJHaxjlen1qbrDVaqFF9cx5xoVGTrHeHCjNugFFF5EizpQpcZE+Tk79MzEoCHiBhNYorSM2UO/O3TlnpHxzKlKESXWqzToVTxgqC/2osQLHIy3XUpR+vCJmIWhT6vsPliEdEZC59wQ2SIQsK8wtx8cpcqlvw1MY4qkQTeh2MrveJ2FOdIKwLCzeuJ43saFEye/bOSBAZIU9gzVP6dw6hEkhxcBiWkpU/KdgLxfIxVz0EisDMfYYL4uVeB7CNyckvr8OeDtMVi1PSnKpLCKwSmNFWWWT4DyBYZkzDeg4501UC7r4xhBfr4tmLyWtPp145W7pBFLnczotcQ+Yb75AzRATzr6rFnyWwexrGGzMSW8SBlXGFLKISUhxy9OwbgbYqEr1yp3s92i243RDvudz4uAegn5XM/w0YomgMm5bB2QeaPfIv5uA4kqjyxqC/5IS9UKGMwZqfDKM/3tLArJ5vhFniqlQ8+t1hM5Y4qB1DoEk8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jzGW7skoYqcAqL96w2w+8cxrE57U+nWnXk9Ou3srBTgI9bKE5/lvhxmzQDCy?=
 =?us-ascii?Q?X9E4IBjB2EdA10yu4UOQr/Voey6GEl2jn9+L0k0mTLIl2mQJOSjoYzxUC0o5?=
 =?us-ascii?Q?jcPA8gqlqIIj4Sq9piNscNHT8wLvXlhXPUScdH8GpYQ8QTmKqgcfTTlRLq3c?=
 =?us-ascii?Q?Ks7URukBpZuw6vdxlKGVBIU2qC2hoMl3V25l+bPZtXfM08WvKILgYtvpECLZ?=
 =?us-ascii?Q?syJvRzdHNE0hPix5nFZr5M5peXhZGJQc2ApDL0SjQC9XRYFOZP9Q1VSL2/s4?=
 =?us-ascii?Q?XMvd4lkMXVIvKZ+gPXAj5ihW8/mwDQ+KyLEmn28EMgMgt4yfA6cwd3sNMKl4?=
 =?us-ascii?Q?4zHlhofmnt8oFAroL9MPjqHG98gUCHi9J/zdpzPz+nxEUhYPQa2MN0lsNvUJ?=
 =?us-ascii?Q?ipffiblniGobQGz+jJCUnv/OYt92CoTgzMauf09i1gkgo5IDZomIopysDyaf?=
 =?us-ascii?Q?aLQCLOMjbRenYA8m2ISJIst2ydcS5iebH8GXy+Z8gKaByHvfjr3MhCXnBxP5?=
 =?us-ascii?Q?vTXPcChX3Er3fmZb0I51Obd5qVlbuvU1B9TDv6WRleJFSCaiiMoReoeDNlKE?=
 =?us-ascii?Q?vXEPSX/gQI+qTBlzrmo8wkE0Gh9liKkggRPUruB8HKihyc0P7jAICBkYI7IH?=
 =?us-ascii?Q?y46oeZ2v+8hRtGMuukAmoaV8ZGZN5eW92gP2ADS9aErP+GyeOWvbbfJOg1z2?=
 =?us-ascii?Q?KCxBd/L/c287+LJgkFRUbVDvQxOoThk0gOPit/x8EWm+C4N7U6R08gU0hXNB?=
 =?us-ascii?Q?urLmLjgJaifRrN/S3k9j7gtZlxFFgIGWYnLOTpATxGaHTwh3zuryVhg28GXu?=
 =?us-ascii?Q?bZT5w95Me0r1LK1VY/lfBCN6CLgEslH0cOalsPWo8fX2BKHCrztSVBtrpkBD?=
 =?us-ascii?Q?7hYrP7xYJ4YZZi8KMBa54Vm+jEJMk2AZNl7S13bSj4+rwtJ9Q19f7IYr0zqR?=
 =?us-ascii?Q?2qrqZZ+puWOtEoN63Zs2GvM9WJkeVfZDmIxhTvOeyw8G6+CVnBtQe3o+RDCV?=
 =?us-ascii?Q?j8eaTNUjD/QOOSh2l1GcbTmKKuv8u5da9FZGisO6j98nRCOP22+dJ4jGwvXy?=
 =?us-ascii?Q?rYw8bzBmIy2ebY6KBHPPt9t41Cs/XoWT28NjBj3aS2J30ySRsXjUJLGP6wtU?=
 =?us-ascii?Q?5LrlDadZCj/wQN9z34tDH1uCOCcM6whlopBT8gS1EcNgFeVQ1A+aduIYcNGe?=
 =?us-ascii?Q?2vqtlllIHULAUE482keuhfES3p/tFXGr3SDOkP2J4UgHOAGpBLu85pxtzBxR?=
 =?us-ascii?Q?3oXuLeQodrEnJ8Nrl1MZ658r3DvSG+7l8UbwRn/bxtOsTvPIYVfFe9CR3iwv?=
 =?us-ascii?Q?Zo3ioHobW3q/ghSbaDg52ZLSm25vQumxewqoPxmIHt99grErF8IaNTTJ06Ma?=
 =?us-ascii?Q?ElpvQWrEMyqarYtMho6YEys/XWQLnVn3adsu6uZ45jd1b8sLsB8KzXowfMHa?=
 =?us-ascii?Q?InKdcAAKGxi5GIfxc146jx7WQqtLPDXRLiD2CgQmOyBiTl6tr9psyQuEUuDn?=
 =?us-ascii?Q?pSDGOETUD1ieRF0gcTbv0f09XVhYTu4iBZ7kmVNpm06BU2DI4nQmmojOIvgk?=
 =?us-ascii?Q?nvwHoATZFlg8u1MhVNluVGdbNsCi6IZjxfiNbsOnmCKPo2eGGzGDxR/YnTnV?=
 =?us-ascii?Q?F2CLr19nmQsZrG0vsijNntYkoByziWtcTuJU6f2emz3uyW3oLSCwjhGu2QM/?=
 =?us-ascii?Q?NvHjVv4E288xS+DdRjRv8LBs/BC2X20Z1Y2L9ajg5WREYc2G4SEW2cFKbaoD?=
 =?us-ascii?Q?V2lvkH0F9CtafFHMMFolHc5zxBi7zuU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 717caa59-dbbb-4fdd-34c3-08def285c3ef
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 00:09:06.7239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLKI0lQhnCfJ9Rd2GEyxpJGjTyN87jJe+bjZ/FN4jzGcCif27vQahQhA9/Uyew1n00NiHl6WElvrbYM9oeR4japqpLVyOqcmlkKRAzm/2GFZ9bKewpiH8VvyIobRccNj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6639


Hi Geert

Thank you for your review

> > > > -   depends on CPU_SUBTYPE_SH7760 && SH_DMABRG
> > > > +   depends on SUPERH || ARCH_SHMOBILE
> 
> You can drop the ARCH_SHMOBILE part, as it is a subset of SUPERH
> (if ARCH_SHMOBILE is enabled, SUPERH is enabled, too).

Will do

> > > SH_DMABRG looks like an actual dependency, there's custom IRQ request
> > > and free functions which don't have stubs.
> >
> > Ah...
> > SH_DMABRG itself is depends on CPU_SUBTYPE_SH7760.
> > So I think it should be "select" instead of "depends",
> > like below.
> >
> >         depends on SUPERH || ARCH_SHMOBILE
> >         depends on CPU_SUBTYPE_SH7760 || COMPILE_TEST
> >         select SH_DMABRG
> 
> 1. "depends on SH_DMABRG" should be fine, as SH_DMABRG is a
>     user-visible symbol,
> 2. SH_DMABRG depends on CPU_SUBTYPE_SH7760, so you cannot just select
>     it without enabling compile-testing for SH_DMABRG first.

Do we need to use "depends" for it ?

SH_DMABRG is indeed defined as user-visible, but is needed only for Sound
(and/or USB ?). It is specific/necessary feature, not generic feature.

In this case, it should be selected automatically if Sound (and/or USB) was
selected, IMO. In such case, we can compile with COMPILE_TEST ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
