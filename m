Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E9029CEB
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 00:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746577196; cv=fail; b=pQ8uoCkAAg/BTFHlnva7qIsAD4zI/rIbzRm3KSzvD9IIlI9tgWoHyz1RzSSxlm4Ro0ek8EINl0QSxY93BP/gAIxdtyndfkfRZUN+O5UQXdltepxnk/IIjYRDWhwuKqECRLnhHogrxlaGLApRrh+AOM+ZT/RAK93n7LNQkIr8K80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746577196; c=relaxed/simple;
	bh=clL9Fj7F/TUPbBTQPXD6Sbi9k9+jzUbeChLvuFncQWQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=K+La+3r9kQ5F+kI4RhFFHsiPZW0qFoxgz+1HisqeDExUBVEKuUu06gINmMP9GJQG9T5acABjlzRvoeNYwDxqTxkL0VH67JrJ1Vd3DRTnYa89mCoyUN4jym0gwp2+VjCftYKUmtdn8Zz1AJbKZl2XhWiB+ne1lRdBMaK0ByN8D88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VG2Is31q; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VG2Is31q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rK+gDUAb66JzG+pW2onHB+GTZ1kxZlOqXFFCMz/XJeNYXj0HmLbPVDjSEpQp0a6FY7V8Zh1Z0Yq57yKetaW4DS2mtj5UvQXERFm7RhS3Uy7aj+PTvaScW6VuOFeQvHTDI38vEcggNuRnk6916ENkLZFBh0DsmVLDNxnhj7VtF/9Z2SilduBkggWSgb6GubqC7Z6p8HfYLCsDtH/r6Eao4JwEbif7Cg4gCztZDzyKE+qSAc1OVdLO3vdwonOuGA05CKoXi+SI7Sxe+BJO/4PeA228kslQvCSoU0PO0U7gU4Ae5BzXmIoSPaSWeIJRh142rjvsNNJjWs9RciELHy13aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96sc5+0Y3d5hyd3PklU/wSdeIyIGZ3bCDDO2FmFtotM=;
 b=N2WW4k69bwHxFAa2eGcsEd2vMO2UZnY2ybglLad2MKy+oWNUNXUXesBzRoU72UucGPGxB/b9IxWYJazw9bozILL1jpDCPpXy+8tvL4KTkAaOhwMV4Q9H/mbPRuMJZp/wlmEb3hXaXzPkBjBD7jkHZB570BBmjOS9wQobMvst681tWLxg7rg8mxUW2Fg2SGOUN80mdB+cS46zJe1hm21Mip5uvbQkFcsF920LhWlb57Ja43vP4RqGMn/60R2fr/KQShAA5zMiPfJufNiNmyrk14ltmRFJMKzVK7+yCfZXArZCCJJDeGRoETLo5PjuQvzC6ZMpoWq2akyktFHGiKZyfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96sc5+0Y3d5hyd3PklU/wSdeIyIGZ3bCDDO2FmFtotM=;
 b=VG2Is31qoKhkuHYphzqHLgYaC0sV2KaaXSJbU9HL/hWlBIrJKZxl/NP8ay8O8Lpfv4biCS3Z1hmDmMSKRSPECW7RmJ+om4WSQmLzymXg8UOuQeN08diepZpr0MT2eqAwZsi9ZibK5UPFiPDc7famBikwOyUEkcgvGfb7dq29mIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12318.jpnprd01.prod.outlook.com
 (2603:1096:405:106::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 00:19:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%7]) with mapi id 15.20.8699.024; Wed, 7 May 2025
 00:19:48 +0000
Message-ID: <875xidclwg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: Question about conversion kcontrol to component
In-Reply-To: <aAuxCjJgi11NdWSd@opensource.cirrus.com>
References: <aAuxCjJgi11NdWSd@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 7 May 2025 00:19:47 +0000
X-ClientProxiedBy: TYCP286CA0365.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12318:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1212b5-8191-42a1-b59f-08dd8cfce042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AIRHE0FMRIjP147NlnKFTSrjO4JtBMKDaIlOWPq9NfHKJIKZTSTBCorKCB8U?=
 =?us-ascii?Q?OwjoRtLaaOg/Zj5EFgEM6ub7UVJElvOy0jS3XFZcojvTHPjpGHTTjpoSvWEW?=
 =?us-ascii?Q?O5gNfFk26+lpUUhLR0QvvqZRcTbR1tniWn+wXo97lmabuRJI/1PCS54iRLVm?=
 =?us-ascii?Q?+T4eHSh6Nkl+FKuQca1E008IpJag6i1RbZ9XWlP7t9NSs7yvPHIqr04tfbAL?=
 =?us-ascii?Q?ld2n46TuhA80yqmxghKda1GuaUHlnaWtCEs73kVRAQzaMgVP22jtWpD6FYWq?=
 =?us-ascii?Q?zOmX/LonLMIe0asB0vfNUZg3dDNgRJT+k+tkWr2if8i9h8dgyJB8ubs6Hef5?=
 =?us-ascii?Q?Si06KJfF8mdwQaPM6PWah0tqX6rFUig+1ocibQEJd7Zd8O3pa+N0J3Xfa4Aw?=
 =?us-ascii?Q?m9p6B+MSeFesMMpQ8vV9zbkjG2NC9X24XCya6+oYPWQqAx8whgZ6LYHK0M9z?=
 =?us-ascii?Q?U81dXPdJ0lA8YY2gP+5GsfhXqgmmIr+DjRFfu4BI8hXBAJlDmJrFUlcInhRU?=
 =?us-ascii?Q?9ZPeJQsIIaAZCELwEwK4DIlV9lGBp5UyWf9wtG0wUiRCUF5dkw+3W89/VqlX?=
 =?us-ascii?Q?S3QnsWsxyasyLj10Q3NGatjaZ6JdIOP680g+ZF9q4mLihzacDHRwW81opqql?=
 =?us-ascii?Q?nqrCC0SiWiPeTpYXepI1xL1xSBYJ4oao0ZN33xE+/FhtNlPELhLUxU47SBfU?=
 =?us-ascii?Q?B+mlCnCwOMx6x8hfZD36lMMxAzAHleIanmIfPtBilqEnoL9LC8M1vG3U+OV9?=
 =?us-ascii?Q?NZaNKjDYHw9uemxf3xaX4/pKmaQupGtIHvPx5vG8FzMgLzLKdOhuN/siUT88?=
 =?us-ascii?Q?Nnk8ZTb05sRwJRB05ciFAxlakBQxABUJosdG15eX2124tzI6uRzxVmEvDFdT?=
 =?us-ascii?Q?/7sODyjSlrKDs8Y4KuBYsbJ2Qh6d+v6jzDHDpFVnZ/8siNblsxx11ku6/0cX?=
 =?us-ascii?Q?Ty+KQdQ2D5Mi+iZysO4nEQDfrQQZc/g1mVN3TaP74LFOrZ/oni76p0/bi3ou?=
 =?us-ascii?Q?OLKIc02Kvi3qF0+MA7wOhb09LMGXPs/jwAQu+qgFBTndW3XFbU9mT9ikF6ZO?=
 =?us-ascii?Q?VqieVFigLkyRrqDiXgqN7wEvAHJRntmsil72/UIXu+wWFVn6mmV5wQi1uUei?=
 =?us-ascii?Q?nh74mqYMNOS6I6Q43IfTNpHibCjwXiRaJXkKt0qkTQ6PfWiWVK78TK9iPYmX?=
 =?us-ascii?Q?XSRjF7Dh3CBdN/4VlM81ed08USmb30wznr1nFc7V9sT48/GwD3gEGnhaTWeh?=
 =?us-ascii?Q?sROwmJ5Oik09zH5VZUGrynkr4bKP82qmUlJLU3A6qE1FOHg4/5Q1ImiFU0eV?=
 =?us-ascii?Q?1UmDJqLs9Aq1KR4Tem+59UhKeeDnHGKdN32Yudu6PZbhamJ5jzN1LJ99grPQ?=
 =?us-ascii?Q?9byLS7w4E64TKquIqS+w0fjTfS8wimZSN+nHn14hNVxW75PIjxknC0OsQIQP?=
 =?us-ascii?Q?o3pnNtI0fdULCzV45VLCYr6R5/DZ3d/nuAS/0GsTXKWeCYleqOpgHw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X+eZIfYEqpq7EleKdEGqwHl+HxGA0/j6QHFgbnXEjY4R7ghXbsCgZHRJyuGX?=
 =?us-ascii?Q?OAW1jOsFdjrYuLiVcecTvk9nvug8a04aAbnvm+j6nACeUDENL76Dj72h+bw1?=
 =?us-ascii?Q?5A+Dt6Bj6wEw8T2J6SiYDs2aYrUhvm6OxTASXFtubDxKiiYa4vjmlMX7X2sM?=
 =?us-ascii?Q?YapWgBdARAUcO3mlwDdFwC3T6crRMWWghrlrwRofUdOEiNYYRy2FP4wNGArz?=
 =?us-ascii?Q?u/w4IrNZ6I5yDq5LqM7d0elHOBcQTPd5LGSp1Y1HXMRJldikulfqdrh4ElKu?=
 =?us-ascii?Q?EcKEranwG6cIZ9iWuUX/0yatqMknKuiXY+OPPtraUHvvBia2s1+bmIHhjB3j?=
 =?us-ascii?Q?g60btn53SRQFbXrKGyAMThFWEvbaK2XSTBfjuOuc1U3YvYuegn6LvAIYIapA?=
 =?us-ascii?Q?/MI2CE+piM7H4TF/GqxSdPKTZed19lY6uehHG33JTA8CsRLZuZKnMeTTOkV1?=
 =?us-ascii?Q?WENzVy4xrrTTfSn6QdQ9ZRhU4D3qIE9UTmp9J1Zz57I3blzeY4qYD8PrXt1O?=
 =?us-ascii?Q?sIre882Jm+0NF9QHUA4JJw7k4cmZV10u62jLecyVCjg3+sxS7+KCMQCy+tXo?=
 =?us-ascii?Q?7DTyNW0um9tpGauWF6gdV4YdSjJnIPQdRg6nMIV81KoKJ12GyOIc+RXqiH++?=
 =?us-ascii?Q?DDBw7hZLrtnYNh/NthN0zPybcmp3HYWKozMtikwuATzZhEY0f+XaDwVC6qSj?=
 =?us-ascii?Q?NQxuZbxKl5WOt+edhnGap9f7HCkWh041YO31HgqU5RuccBYKs2tg28heWCkL?=
 =?us-ascii?Q?QJWVYPXYvoaCvCcNJaPb4dlju1R4fRDcfMlS4NEnoFbFm8WjQ+OU6S32N/8W?=
 =?us-ascii?Q?bGjIpK1kr1PGgKpAC9mzoaGP2qjULty4aaAILj9WTB6gTzRbAI7tXnnC3eCz?=
 =?us-ascii?Q?z6d6Vyr0yOuPgYPxgiKg41q3JPIr3VK8JXVIbyssShaf/hxBQF6IB9tB4GtG?=
 =?us-ascii?Q?cQIVkuBMRPb/EN8fFt07XpjWlMc2M5Tlxf7YnomnRX6FNuz+cRPjlbj/U0mi?=
 =?us-ascii?Q?miejYoIAmGfLcyKpv0MpBKZ9aLFzDnrFAGehEl0yh7o/EMSIB/PurpRZdb/e?=
 =?us-ascii?Q?UhL8sLcn6UZB9+6dfAtHTuXiAPfiqROugpr7pfdWPOwHq9JAoHYNogu41uFB?=
 =?us-ascii?Q?lpqsxFZ2yLpPat0LiEUOOcmRFN4oDciMDaI85bwaA86VPpWotxznzRZKOP69?=
 =?us-ascii?Q?tAdUaNlmCGvNm/Ps/LPqZw7AgGlXqXEUThJbvw30EeM7wYxA5tB0WYgyHH8U?=
 =?us-ascii?Q?fDyGswL37fzWLVm1qCBE1jpmb/fz0NvJLPhmK6cTO5311CbozaqH4FOaDWWy?=
 =?us-ascii?Q?1zX2jF+FIRdQ/FaNOoJkiNjzk6NaM56eTbMEIuRpKYtDrGirSqExtHRjIdM4?=
 =?us-ascii?Q?nd4BX6t/f04+X9dUIQWmIGk58n4T90bHo5aYs1T05u0IAxOPaT2T7bb0TctL?=
 =?us-ascii?Q?QTWQz5dOUtrTaN44aZSyty2cbekFAGtVof/MCVnQb2Ir+/P8M6GyblsPouav?=
 =?us-ascii?Q?O11fzMAS5SjPOZde79omOWT6VxDkO+dY+QYH1IeUTn0wiH/Dn9VzAQEWNwvZ?=
 =?us-ascii?Q?WxVTFe3hktJXQlVu6Vr3SWSG4KWZcR5E8EKmUs2XmWEs1tX25fEh1Qye6Eat?=
 =?us-ascii?Q?wxI6q35WpE6mUcNyxqDs+rI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1212b5-8191-42a1-b59f-08dd8cfce042
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 00:19:48.0729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRg+VjZeaGfwiCWtmHelSqQOSzwz+r5gtr5d1t3RCCUQVQJ5sL/lmdK+ocgTxZGOCXVVknE+keGDuuUWpyUQqnqwYXPwaQe7tR5gBuYMEuDI8d86avMNWunt72L74HiN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12318


Hi Charles

Thank you for your reply, and sorry for my late response
(Japan was long holiday which is called as Golden Week).

> > I have noticed that we have similar functions
> > 
> > 	snd_soc_kcontrol_component()
> > 	snd_soc_dapm_kcontrol_component()
> > 
> > Both converts snd_kcontrol to snd_soc_component.
> > I wonder can we merge these ? or which we can use is case-by-case ?
> > 
> 
> I think this is case-by-case snd_soc_kcontrol_component() relies on
> the component being stored in private_data on the kcontrol, which is
> true for all controls added through snd_soc_add_component_controls(),
> but not true for DAPM controls which often use private_data for
> various internal things and call snd_soc_cnew() directly.

OK, thanks. I will investigate about this. Your reply is good hint for it.
I think we want to use same function for it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
