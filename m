Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0A8621
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 00:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734049543; cv=fail; b=lLpy1KvubVNqjRj9Cwj8rpe+OstNH576XAKUwn5Wftkyb/UhbimcnwU3Lg+9NNJfWvH8S2Yd8S9haGKdB8gvYwecKYAs+OOotlyR5KMRGa516hDzeqVoIokX60//G/nKmoECsWINIVtqOQdVYNTFowKW2EA7fQ5/jCGfALQK6Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734049543; c=relaxed/simple;
	bh=oxNterYb8ZdsL/oKcTewM2m3zW2QJp5YH4Ckqe8gK9U=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DLnKGa2Ku4P4KD/i9wk/eEbYdYinjqbH8XS8LFEGpnQZqfqL7OyW6clyGHQU83HrXE+ff9ZD3R/UzSf3iiIH5kMXAYWexQVJ1S6g2cdbt0pT4UImQqqR884x86PCFWnkJ/UIAZosHXOxK62+cPx7uI/PJvGBcSefWR1SRYHoJUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MqpBbtr7; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MqpBbtr7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7Vy2NuWqutwQwXtVI+8EoLGc+3tPYtkf9pJqDcHfpd34FZFM65SLWXiZksuQDmLC+1fD1WNGIR6m2XLATv1qSxCs6lsZ0+aYmHYlhiWhWY8zC6sHquQTXn/FUw26YsQXaU6ze0x1/UK+NH3u4yekQ53LCw9vDcrUVLX3WivNe+pbthEuuYbaywkYmyqQuas/rlbnRo0cpzs2UsUbl5zRGHrs19/ISTzqSs3QSHJjdEM87kUikQIRjRSZG1sQ3MqTNNc/xMoMa+zuOLdnzop/EL+fLl+Px3rsHAbbDS6Rl+83Jaz2FTddlRXX2EFfDF8QPYlNkYlniRCvlnGbt8P5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2hKFEF4C/lLi6laDs9XKNJEx2fFKrN51hpuyu4OLKY=;
 b=uH4iYMZoPHHivU/p2I7NWSdgjZiowWsb9ifAdK4CbaH24U2PWWNkMMz/YQfH8bhcB/YcC8FQSB2tRd7q4PojqyVGOyKiaMtDI01Cn4xKx6cvRdlquWvALMHndH8vZ5ocqn+zndwo+kNDqBAXDHsySowwcaAnYw1qO0GQHBmsaA8rhbHxrxCqMIry6cI67QDyknhY9MMC15/gpUKJA9GGrhv6jUAuzPkvqDB95Ky8lf2rjzjSuS/eBf1HyJrS/IdCq4uHJJEIw7aSHLUjWSxHGnTbgkccXZaRjHofMliJkx9M/cSeXe+de3TVOs5LZBokevoDjVnSr6dxlaxCCiL4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2hKFEF4C/lLi6laDs9XKNJEx2fFKrN51hpuyu4OLKY=;
 b=MqpBbtr7nc9AbfSje1qRyp0ohVTjD5BJLjkYSbZcLQ4Ae7OjQimsnW9sRXUk8xnZCuRu2sZHC6duSpSMgN0DRy20HParPUBA5Yme5gknoP2KGQOyVzC64B1UPTujWLY1lQnMTdvVRcXwwFwscCkp9gvDV8ODEVjmlkfYX3I5U38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB15037.jpnprd01.prod.outlook.com
 (2603:1096:405:248::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 00:25:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 00:25:37 +0000
Message-ID: <87ed2c8m4f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-pcm: don't ignore -EINVAL on soc_pcm_ret()
In-Reply-To: <8ba4dbc0-323e-47cf-9d74-88495f4c40a2@redhat.com>
References: <87v7vptzap.wl-kuninori.morimoto.gx@renesas.com>
	<8ba4dbc0-323e-47cf-9d74-88495f4c40a2@redhat.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 13 Dec 2024 00:25:36 +0000
X-ClientProxiedBy: TYCPR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB15037:EE_
X-MS-Office365-Filtering-Correlation-Id: 46901f1d-886c-476f-778a-08dd1b0caa65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?esW10cFMTdKTRuIsagecpkotj4jzGeoeWXf2DPclHic2u6227WoAd4uSSGC7?=
 =?us-ascii?Q?h04XngiWee/CBT+6C/muiPcz2HR6MPnjBLejRel8V14qMG2HymKtZLt3YbjR?=
 =?us-ascii?Q?vzRktEH/8Xg4inm9vFN0k1rCWLo741LIQ8+Om9YPNirT3oDE2E2Pq08f4nQI?=
 =?us-ascii?Q?rENc/AsG5So4U2tvQYhPkhbBTp3M7HiAewOs4fXMnL9LPx/cPabhCv1iemEU?=
 =?us-ascii?Q?1fm6/1MRafmR2H7yV+WtEHEn9NufSutF/cy76I356t4+7AcV2iQTiA+N4JN7?=
 =?us-ascii?Q?lPqNWvPV2GLv3uclE+wa36cuOFNtxwKLf+aJZ/oHdYlUl4518WP+QfeT1qLY?=
 =?us-ascii?Q?GBsIOFwQeinmuH/RiYNZvuOs8UDo0mO542gFx5O9ag9i02Y8nAgzTeIjjaZn?=
 =?us-ascii?Q?0OwrmoObMFguLo0wVzdfS69Y1yyQJ23jc8DbT6GA/vqa2VPieALAftyTvo6l?=
 =?us-ascii?Q?xhoF5cK1BbxLd2xolFtHYP74I37PGmOWK05w611yxChKswGcwoZRS53x7Bii?=
 =?us-ascii?Q?23TZMnreVybfmaVQc33E9A41973M+amCLiFKOM4KrmZp1+5yjFDeV/k9Yab+?=
 =?us-ascii?Q?4DroIgw4AXtjDDyEY04t2dX3hfeoHfaIkSzW3VqFZQyIOqgE0ge2a7OcKU5C?=
 =?us-ascii?Q?mKQSJ+5erYPyup3IaxJnMccpy7XP55MMpEm4NEXf2eRQcAHM+oz0WqVfmeYB?=
 =?us-ascii?Q?5rRwUYTBEN1T/XOZyq1duvQ35W0F6bollpGyO9+7x3rVbVAx3cTcooE4/hXx?=
 =?us-ascii?Q?/fxDtU8TWsLORqyDJj2vadBhejD5aw+SfzMrI+bvEm2jdq8bFN5e2PHlyF+C?=
 =?us-ascii?Q?NPJPmZbAGf0tp/okSuNnwA97sl/Ol/lBtEGAwWuJW7VhpEQ+ue/CGcfQV+tr?=
 =?us-ascii?Q?5vSqEj857qwn5Mzc7XOpC11XCuPPQBBBmU0vkiVCygPwXlPz8he06wSt/Lz7?=
 =?us-ascii?Q?WBvMD+ENdITl4OP4I/e0n3qZyCZd1Ns5HcUTf4WinM53u2tWJT5/u1NCSj/n?=
 =?us-ascii?Q?e87ctf7/4Vod5W4thDvis5WrT/+20ORsjDFsWdpW7lPa3AlJ9QtzXgh9V6nS?=
 =?us-ascii?Q?PMKd5ac5IKrUgCv9YIEYQGrI2iTwauamOfCvh8qKfuABSoG6B7htbdCkBLZP?=
 =?us-ascii?Q?6wbEqtxnFlPj4CF3/dJ3Fnx4Issf9neyAl7YejmR0D6F/IzCZtzboc0MOxQn?=
 =?us-ascii?Q?EwUes4XBRlDjIejSVeC8kMCOkGYK64gmgLAdnHE3wt2/vbGraPYChgBpV0r+?=
 =?us-ascii?Q?svBOoLpYOuV/mlYEUbQxY3a9SgBaVwHjwX4XbRryJysVZ4yuW7AWEUhR5xd0?=
 =?us-ascii?Q?/1eWR/vC40AI0mXG7Wr60GfdLtWwoHj2iP81G4/Qk7bBZyR2A3PnGd0QQzOp?=
 =?us-ascii?Q?Ee2bEKSGh9z0obaLrMBmFc2BPffUFi1jYIrG0sTx8hh66HmKUA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r9KJ5Q8n36P7zwi71k+UbbdRrnnQFp0n+fLm3aU0HeJ34fwdjLBuep0BTpDQ?=
 =?us-ascii?Q?ZXbMbfQ0/+frFZbdVXXaK76NwDcO1qA0fVMlYET9XjHYtJERYOgo8kVLCP9Q?=
 =?us-ascii?Q?jMFxw4Z2g2oX4VRHzeikdc12z5vwN/rUwNjuWU+rpsnfHQhCoMArlCI6WSvy?=
 =?us-ascii?Q?XaDHqPE1dZQx465yTraKSMY34PdUPW1iBWFWp16tjdjQER8Y8s/WDxfqf4Tc?=
 =?us-ascii?Q?ftENIgHpKcrQ2bK8M72JDGfX2AEwqWyh6KrrO4YfkbOMm1B0p62bwju5SoBr?=
 =?us-ascii?Q?tAvwPZDn6fsRHSMjrWIiVJQgDFTeNBtAjg1iJUr+D2mxubGgW2aqW5JtgEtE?=
 =?us-ascii?Q?fmuaDKZrguwSlvwO9+dyEFok3fhoGLVM8IA+8Nss80KfHwNVjV/itQ3Kqa7K?=
 =?us-ascii?Q?GMv/l8nFUUPszixFhfb8DS/zyLDiL9JN/jvMx3I3r1y4Jty5RB839FPL1lLn?=
 =?us-ascii?Q?LW0QDwHDK32tGWSVeKxlYG78gZ6C652LyFlLSr+DzRvUKUtThLStROSpaNVr?=
 =?us-ascii?Q?lcw7gbUfo1cN7Hy5utpAOM1CD+aEKDq2XZmhNififFE2dieSUPFXfWfEYnK4?=
 =?us-ascii?Q?sqWpi0FpXE+HEU228m0ZN8z4tYi0Scq6pzWr0SS+IWV1wAvd8RTF0zMPvd9o?=
 =?us-ascii?Q?GJ7fsmSAHMPQGYy+QE4hufUjucXkxsQItEEbNw3kmo8PH+gSQVXn4k5zAZ+X?=
 =?us-ascii?Q?X6resJA+gnuYLiYXrYtSsem3iGNo5au0HtrcsNneQ5ZbIgM7CkJnLmzxVtVY?=
 =?us-ascii?Q?dtpDYztbpcurcgA5YxE1NSys/efPzdzk/6A3QMEnB5dp0oP7QC2g6bqedGch?=
 =?us-ascii?Q?1lLdtRUxYYAZwsWEnWRDtix13xqgokPnjQKKenI3slwK6HbngrbWgju85bKg?=
 =?us-ascii?Q?ida4JngjXw4UXI443t2w5vA226zy9FvXC1BU2mSXO4qzu0ztCbh8/HduYoHF?=
 =?us-ascii?Q?XU7xLJGeMF+MYL0szL3c8EBXM/pkv7LLTpZ32SEGS49fkGFEEWfaHhstEhvq?=
 =?us-ascii?Q?LAid8/feNllWGrPHfRXOnLDI8O14uRtfY5VchAGVG+yopxo+VnoS37Lc3grb?=
 =?us-ascii?Q?z++IlEA9GuxT6jw/ght5GmFjqDI79NvwqZNAny6Wd3qI2vyj1fvqSJpbHxGh?=
 =?us-ascii?Q?/P7WY6GaL/nGC1YoRpJyYtCubLdDO8zGC+U2n7ckco9H+lnzro6xP/5nORh8?=
 =?us-ascii?Q?Sgj7vj8feIKUhDgaWzbTpBXj3HzAXd328kheJADYAV4Uby0C3v/Vj1QlhznW?=
 =?us-ascii?Q?EqxGd5M8bDZVtLAEUltgf6wFr1zrsilzFPcZ4XC0aYRR6qcXDuWGKfom2qAI?=
 =?us-ascii?Q?zn+F7cfBcFKaG4qoltbmovGCkR4q1MTxPUIeuaYKAZmZbIHnrD7aQ+u5jVkA?=
 =?us-ascii?Q?iVyHj5dqzZ4/O4JY3DDumD5gF49EVm8r4xf8i+Ta8YVZ54+2yIQBzFvXXrW0?=
 =?us-ascii?Q?zOejEuh1oIGLJV0u1slAW4Xc9BRDuQzLzydD4tEhPnSb+lnFDFa1R4zgzK+V?=
 =?us-ascii?Q?Ia1j1tqJswThjSJRTum6g4e/xWuCFlw1UTbI4YoPtdFJopVSwEeYRtqTU0YU?=
 =?us-ascii?Q?lDuJZN+YjyFTZRahsQ4pKrk/lYHktrgVTMUk9eV26ejG9dukZZr8mfBeOHQs?=
 =?us-ascii?Q?9egWGGtMe+VuDKAMvScN7ks=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46901f1d-886c-476f-778a-08dd1b0caa65
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 00:25:37.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SoKqdqk3bUdo51vE82TkwQ2gl5WZUc6sVzL6wh+vmslYre6EHRbr8was2MOBcoEVClQXuZEbHEg2QXbhOHL6AoKZwsa5WrB5xcmYOtYayqImtVIubWeTg1h5Jx3TWYl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB15037


Hi Hans

Thank you for the feedback

> -EINVAL really should only be used upon invalid parameters coming from
> userspace and in that case we don't want to log an error since we do
> not want to give userspace a way to do a denial-of-service attack
> on the syslog / diskspace.
>
> I'm not convinced that this change is a good idea, but I also
> have no strong objections.

Thanks but hmm...
In reality, -EINVAL is used not only from userspace, and many inside
kernel functions are using it. So don't indicate -EINVAL for all case
is over-kill in real world. But thank you for clarify the situation.
I think indicating it on comment is good idea.


> > @@ -2560,8 +2559,8 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
> >  			     fe->dai_link->name);
> >  		dev_dbg(fe->dev, "ASoC: no backend DAIs enabled for %s\n",
> >  			fe->dai_link->name);
> > -		ret = -EINVAL;
> > -		goto out;
> > +		/* don't use soc_pcm_ret() to lower error log severity */
> > +		return -EINVAL;
> 
> You cannot just do a return here, you are now missing these 2 lines from
> the "goto out" path:

Oh, yes, indeed.
Thank you for pointing it. Will fix in v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto
