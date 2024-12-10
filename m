Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011061.outbound.protection.outlook.com [52.101.125.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0999670816
	for <linux-sound@vger.kernel.org>; Tue, 10 Dec 2024 02:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798408; cv=fail; b=i4FK8OTUJV9Rw2mhdTD4uQCgPFgPn2+e+UPRlzTbM0+LI6ujV1bUO5vDqz9xkLGZNpRUeoQsJcuBRoBcF37tIttfgPzlSNwCM6WR+w4LckSvZuO1uKwmP9y+VIOVxVhaQyQ67mEbZQXOF5UKgNriomXz7B7EFDauTx09kJZxxeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798408; c=relaxed/simple;
	bh=bZGffK10mgHFXeSt0kJ9GRo7IY/VwijFqLwA2dwCy/c=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=f/T3gY4tmR/SA6q5oZB34s2C2L0P8D4ro79X1se5z2ZRrrIbMx9WJeM/wzSECE2olXWRo77Tu6kTjEDR5ETqxiwsL/36QyajL+Wjw+qIieR+QvHlaPSQhNpGORokYX6E8stB29s29QA5TUtbuT7GDVd7cDIEwyWvhlNzxvIpb58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QQMrUtbg; arc=fail smtp.client-ip=52.101.125.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QQMrUtbg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGXpVCoT4PCZcLxZUyJESiDLGuZyF056ta8OLPMv7/jtexlcYbGFDro8VQXxF+CeuKpSizhHKiBAyff2/V3hLV+XeFVZayn+fUk6wWGMxv82KUXh1Zn42ZPVTQNoVpg8ufXAsSQ1m1qqYbJOQ312a+s+GB4k6oLUsXipFCMefAIiQ+1CqOFxteIJD3If+8MHDl0xYlAeivsxbbTGnegT+gxj9RhQGH5AOOY85+f6MBvRop9wLglv7SV1WJ/f9iVK4tOwgXGwbAJJiTLILPnRuXqpU4z+qnuIV5VScYbwk0s+1Gu0B2Fo8RH3JLwOXXAaIg3DX8xEH1lfe0hKgjX7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJznulR8z6OZpVtAgG2p/H3vD1FTIhAskA+jTYtn+2E=;
 b=gvtqLdjB7G9/XQnjHmGHGB5p5bWgmM4eITN2+FKarfoEz7yNygVfl3gKxW6ATUHVSXYMtOgz42vFUI8wZgVOZofYibOa6EhjfSmYHsfAR5nZk9FYxZdlksiDg+bFBQ+au8uTkO/6pCWeN5uFfg4ksOE1PZzwFaJqOoeZBnHu3k1fW8aHg/bWkdiE2Pfji7iFChyHDjesz6YiSei5pdxuw9dhAuPpw1E68+S6RqSiAQmKpd1cvkvSVTE+GZ7OcbwBgcUxy9kOdYfq/FOcDCd95ozHNVnjO3SIA4ZMJ3wfVzyu1JyUYwFh9QSCyvJC7uEl/TxNb4hVEUPuTrQutSYH6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJznulR8z6OZpVtAgG2p/H3vD1FTIhAskA+jTYtn+2E=;
 b=QQMrUtbgtP+tZPaz03XQ1P2emEb7nLjN2gFSttsHuGgryysSbGAzF1EFM2cnJw9d1VyL9TTsIA9GwPq64sovIbPGvl1sITaiYBkDsqv02OjJdB5O9JoQSBRvBwAsKLhoYChw9CNmykVea3xCGYSm8Lsdq+BZ65z+zRXzQHLGhcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5659.jpnprd01.prod.outlook.com
 (2603:1096:404:8055::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 02:40:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 02:40:02 +0000
Message-ID: <87o71kjm66.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Stephen Gordon <gordoste@iinet.net.au>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood
 <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: pcm3168a: Add option to force clock consumer
In-Reply-To: <20241209231258.22f3902f@rpi5>
References: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
	<5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
	<cec27c80-ca7d-43a1-90e2-ce014e56e295@sirena.org.uk>
	<c2b9ae73-6a94-4184-9aab-8c95bd242b60@iinet.net.au>
	<3c39e10d-0d39-4343-bdec-fe3041361cc8@sirena.org.uk>
	<20241207125222.7aeedbf6@rpi5>
	<878qspobvg.wl-kuninori.morimoto.gx@renesas.com>
	<20241209231258.22f3902f@rpi5>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Dec 2024 02:40:01 +0000
X-ClientProxiedBy: TY2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:404:a6::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbf7f7b-7b1f-4923-a02d-08dd18c3f24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/WcngROCQJRzNIi2OeSdI1OpjI3p0Nbn+rsuiuTOEFRbLAovs2run9mJaH7R?=
 =?us-ascii?Q?WmQzZWkTHINH1oRjnoSMTj4Y+h4FtppIRBbrZRxgXCQb2+9Y3WymKe8k6XAr?=
 =?us-ascii?Q?kPfGfYjC6mYpgbzEDymZ/L4Whff3mOl71EB1pRas0qp3wsI7QRErr1rZ5wHh?=
 =?us-ascii?Q?w1SdmJUn6AMhY0DB+SwaYUFu3bEZj5f41jKAga9qLPjtXrirISFwOht5XYPQ?=
 =?us-ascii?Q?lxfHgA93hoBFaK6ToICtReve63RvU9WFT9iFZFai3ukCnZyETaT/XCW4ZYbE?=
 =?us-ascii?Q?CbLQcU5iFHYT/78218GwP2CL6lVV5j/hK5j6+ZaKWEhb6nvuGE3wdSHhaPGE?=
 =?us-ascii?Q?cUL4M1ckfQYgCS1TKylxH+OIMlFJt1PWoRqWESC3zvK/iCRP3fscvuNNbF4a?=
 =?us-ascii?Q?9IWNALb3gSONPZbbP51E8dxaerYzB31L+kCbag5fJPaw77r2GHN/TIbH95Fw?=
 =?us-ascii?Q?q8KZU2BidbF9YlaEHau2aX2/MWTNtz7SFTxIvnp2N+qn1it/DAMgHaSX81vH?=
 =?us-ascii?Q?ggcqmZpaQFeqr4Iy8KGqoOmNF1BPAb17L981+FhD+P3HIvPlTTbgLN2Hh6Y3?=
 =?us-ascii?Q?74N+YIPVkA/ZjP3P6fxDgDuA+SCQwoF9TEEa+/FEtcfvi4aiQBuChvK4FWCH?=
 =?us-ascii?Q?G9gqT6SEy4zpc74UcAeoDSgt2GSI/AyoNRYAKVO5+8ZIYEycdjEMiR6lzwgK?=
 =?us-ascii?Q?KEvcWknNf+AjoS+/Zm5/YVJpEChOAEh0rV7RMPfZ4anbjhSwdW0nnvP5J+iV?=
 =?us-ascii?Q?uwhLAfl0oCa2HJppM7Y7siIRXdqc55MPeLMBM7c4VR4J46q0WtYbtuu2kYDj?=
 =?us-ascii?Q?DflbpssXMJHnIdWkC+zkwCOWC0zah+l4T/yLC+vdPoIWv5BsuIyy89I5shyk?=
 =?us-ascii?Q?7fWm1jdpZzXLKCSKNjpLTQfnY1qL7GztIy876/iTbtGh6SMg/6ykeQUh1oPq?=
 =?us-ascii?Q?Y2dRGA5YTjulP1AMJxBOdOXxhsBKA28b+hqCFqwLtWPl8Hh3wuobz1jY695b?=
 =?us-ascii?Q?5XDQ/GIKBTSe11IZpiqCaD515ezCwoIgLw+Cw3tHU8Yx3ACJthbYN0bbJAc1?=
 =?us-ascii?Q?pTtLhtuuXrB7XEwSSQzzcq530BnLhzi3mm0iV5626Ou+0eTkVWR3D+fJGmB7?=
 =?us-ascii?Q?AapPojyXQxid+wX9HVYDllmYBDFOKo87G9UY6iT/rQXOg5/sIbJNUOjp4joB?=
 =?us-ascii?Q?eED3007TUyaunQhtOYGx+DLMYa6HqcfoILTLqGI81HuOHP3mQ7oZQ3j16kis?=
 =?us-ascii?Q?stmjJHHMpRQL1hDCq+6MUbyYim1ajdNBoa5+O5HHFspvfqZEkiTpoxC2aVDR?=
 =?us-ascii?Q?6C9XA15Gl/gYYSWJg5eohDxVCUU8YPYATEwy3qWPsnpy7MKJhAoC+ckhoQwF?=
 =?us-ascii?Q?0RSbe/ziiSmt1TuEgPlOLq6WQiZI8xwRSQoJbnQuuQ/Sw3KhMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iED4Yio2TtaeW0Pt4jLMABJn4rB53dvZxHNjBb5vI6uOdyxWF4SJqlcM0hUB?=
 =?us-ascii?Q?j6ekVqfnCOtIoSMH5p0h7wPqKZh+Uss0mylnysroJGZcUQT+Wc/TEtmrMGi0?=
 =?us-ascii?Q?P5Com8lEVfX1t1DNB1GD7IOzQzcaWfYrVObo48dtQvFstRs+X99r5271VLDL?=
 =?us-ascii?Q?0HL9l5eTpVqLqRchfiMnxO3phMl48Cp1MPuCg1LV9K2/NcUXbLpkQWJbsHWt?=
 =?us-ascii?Q?txA1nfG05Zli5ZFmW9EQwZOYGCs8eT3duXlun48ZnP29FyWyNsSp8RXpr9iw?=
 =?us-ascii?Q?NM+Zuf0+8kUE0c3lSE3weCE77J0KtOK9vUEmHXl0VlsHitjqQ4K8TreLH+rp?=
 =?us-ascii?Q?zIijPGil7dQYe/yujOYwsfGkvR62N8RuA0DZ0IGp2h8thHxq+uDB5/B7KYbV?=
 =?us-ascii?Q?I0fK133B21uLj7lSPEla41QvUHCTwCSqHknvIJqq69TtYLvOgkQzqYxEeMJB?=
 =?us-ascii?Q?2NomtRP3ad+r6ymaQ12WExAjTNGNUvAlNx4kOTz8RJ0t7gKEmKKbaVwNri9Z?=
 =?us-ascii?Q?9RV4J2/qA5pgyBIbmfhZwp0d27G2WsKQ2d7G6SPPtVMa1oSWDaxy0bwFshNJ?=
 =?us-ascii?Q?03ojdUCVfkbC65NW0r4DSCouuXLaUSmmFah6mJ+CNJgDcFaPV3PAD0fCmJw6?=
 =?us-ascii?Q?xLrSnoRWCyC5L9T3hI9ikybxuqBeQDYt8+VU4kzDqQhoAPGglzKUaQQyhrkw?=
 =?us-ascii?Q?EcP0vOYwE9HbjRkLmW/Mx8uV3IR5Q7rDGCkdxiVyA34hQTBWL4ClDP8tawR3?=
 =?us-ascii?Q?f46z2sWh4r1qeeo6g5bVPIq2Txt5eAjeqZvTSGR2/oAAMd0Itub3TP3rjYJR?=
 =?us-ascii?Q?OoP5CCinDpjYbkefF0CzFDeqYbuYJLyQ2ZYWECJzOTpNsIb8tsCRIdp75jST?=
 =?us-ascii?Q?2NNawzXY8+efQQWxIDvBU4JF1H/9oJln4te7Y4WLnN3fOHF7du+XNWjOxMSq?=
 =?us-ascii?Q?u8aDLTnoa0qLth5cHOr1Zlj9DB+FuU30mtndJcLDKL9G3OsQKydnr/ZJPqvZ?=
 =?us-ascii?Q?KIUFs+k8FhK3YrOX5JPLOCC98fjz7xdKNkyfElpVo2aLny8x0EI8G+/w7lId?=
 =?us-ascii?Q?fXG/p4XV/0+OseI2RrR1GZyOxqt+BmSL7z9dnMt7A8sd7z4LBYJAGxDgZjYK?=
 =?us-ascii?Q?ULmve1gVx2Ggi6UqbsRitt3IK9SxvXnxABKNMdYCA+LEPqTJtB6QcEMdN60J?=
 =?us-ascii?Q?zrI8W0dNXYan5QeQdaFehRnwJK7HYRSQctEBsXT2XxL1oyAFtG7Uu7tniFs6?=
 =?us-ascii?Q?cI3Pa9Hvtcd1UgvnV1uAl9PSM3VQ/fQHWVqc3nGI3GkRy5vWQ1RFbY8G6m5/?=
 =?us-ascii?Q?/hny3IgV3NPWz7dSNLQHNjD/ay7/vb24xAMJboXDG3cW/WY4arslFQuseZWQ?=
 =?us-ascii?Q?RJFYB6u/qfwOayWfCZDWtdu4CR+OnufwCQiEqceTj6L2qF3nuoyO3u6N/Zjl?=
 =?us-ascii?Q?WDGe/ZJ4dV9fzMELJ1rjQongM2sSmGcuGBEF6bd2qoveIDKwemDHDqoReBeK?=
 =?us-ascii?Q?xEhnhTw9xLKcfCW+tyN+bnHWAzPtmwN7p1qQZ2Bu0Nnp1hG3zhw2wAf298cW?=
 =?us-ascii?Q?67R9uWaAG1DBZEe5fmpXSRKdO3BaZH+uzxHiuBKPauVpvaiAOGilneHUIGyO?=
 =?us-ascii?Q?cP4twNhdYncDYQiav1/gTGM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbf7f7b-7b1f-4923-a02d-08dd18c3f24f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 02:40:02.0754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DALZCs4MLMzvcDg0AdR1oIHuuxqcV+TbQ7DrdMXF9OmxKqTqXS4dehIJ+7E26H8/BiXcYr9frbsvE/J5/+5UHhRefXVaRttPIUsoAUK07XlQfNPbEGvjLYqzh6hph/VC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5659


Hi Mark
Cc Stephen

> It is trying to set the CPU end as producer. I think it's because
> asoc_simple_parse_daifmt() checks whether the bit/frame phandles passed
> match the codec phandle - since it doesn't (it's a different codec),
> it sets the DAI link as "consumer mode" (i.e. clocks come from CPU).
> Therefore, the CPU side gets configured as producer.
(snip)
> > # Clock producer/consumer settings is very confusable, because it was
> > # Codec base, and has flip, etc...

Ah.. indeed, but hmm...

Current ASoC provider/consumer settings for clock/frame is set via
dai_link->dai_fmt.

	static int soc_init_pcm_runtime(...)
	{
		...
=3D>		ret =3D snd_soc_runtime_set_dai_fmt(..., dai_link->dai_fmt);
		...
	}

And use it for both Codec (A) and CPU (B) with flipping (C)

	int snd_soc_runtime_set_dai_fmt(..., dai_fmt)
	{
		...
 ^		for_each_rtd_codec_dais(rtd, i, codec_dai) {
(A)			...
 v		}

		/* Flip the polarity for the "CPU" end of link */
(C)		dai_fmt =3D snd_soc_daifmt_clock_provider_flipped(dai_fmt);

 ^		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
(B)			...
 v		}
		...
	}

So, I think we can't use both CPU/Codec as "consumer" (or "provider")
on current ASoC, but what do you think, Mark ?

Because of ASoC history, the clock/frame provider/consumer settings was
from Codec point of view (CBx_CFx), and "Sound Card" is still based on this=
.
OTOH, each CPU/Codec driver is now using own base (Bx_Fx).
Because of it we need flipping (C).

From "Sound Card" point of view, setup directly Bx_Fx base instead of
CBx_CFx base is not a big deal. But if we do it, we need to have such
setting for each DAI, instead of common dai_link.

Now dai_link->dai_fmt is including 4 type of info

	1. DAI hardware audio formats
	2. DAI Clock gating
	3. DAI hardware signal polarity
	4. DAI hardware clock providers/consumers

I think we want to separate 4 (and maybe 2 too ?) from it to support
more flexible system ?

Legacy system
	dai_link->dai_fmt		// include all 1, 2, 3, 4

New system
	dai_link->dai_fmt		// include 1, 2, 3 (or 1, 3)
	dai_link->cpus[idx].fmt		// include 4       (or 2, 4)

	fmt =3D dai_link->dai_fmt | dai_link->cpus[i].fmt

"flip" has effect to 4 only, so New system has no issue with flipping
on dai_link->dai_fmt.


> simple_card/audio-graph-card/audio-graph-card2 are using same logic aroun=
d here.

I'm sorry, this was wrong.
simple_card/audio-graph-card are using same function/method, but
audio-graph-card2 is using own method to handing dai_link->dai_fmt

Thank you for your help !!

Best regards
---
Kuninori Morimoto
