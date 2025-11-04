Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E387528DB3
	for <linux-sound@vger.kernel.org>; Tue,  4 Nov 2025 00:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762216874; cv=fail; b=K5KgTn2hvxNL4JLCWjJceTAXXAtsYIzixLp1Nc/tY78R4aK8jNDN8h3TY5I+T93jsZwjM12e07qW3hgBOpITI1CemAYcdhErtgNcYF3CqlZUti1atBeaQVL8bHAlt91dGd1fnd4hPOopsfkFLb9UsqCMivxDIeSdXRE5jUoh6LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762216874; c=relaxed/simple;
	bh=HMimFveM76ZjsXu6k2NxdMxynm8t7+rPTReu9i6ula4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=M5TgdiPYmj77RwvhT8HcGSvBarcvS8d/cr3z9mOayh7N7pQSFoSJLRRs6VXd+16uNS3Bq+zC4+pKj/AvDOh/p+EIg2Ktj3wcKdPvv50pmmfzg8LOCAdmfo6ovTCXFEQgf94f8TXoe0Eze3HKoLVpkBr6mwxhAfaCIIsrRa8WZOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KkyZw1M+; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KkyZw1M+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y01YzRkacbLAcweEE3YbwVJPUXYkXu/Up8xxeYKAGE5B56IOjdkn7YlTVMGigpZufnsjZ5mtuepwvK4OLJUxvQMfDu4kAH7IR+7S6uvURV+kDuF13+BFFzFDRFt6dGVWn4zjUFyHHcsS+hyxCP2eF3htrCFAot0N6OLQXJXgX/Kgp5ySmrpEK3+chsQgP2t6ydFfBh7y5Q5fg2KH9jQvffzPKUIBYtGJ+RNsKn3w9IDG0TfPcPkMJjDOBLm++W/NgdgwT6EbPdtZSVaBd1l5XoO+LFJfj82jfxhr8kcLzWfKKuYlRJRui6ezvXRWmWhQ3jKPTCacDNe5ANTlQXyFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hf5uwXlGUXbdjdNxt4ae1Wx7qGvZQSu62MdqutkKFBE=;
 b=VZ6yWkCVKa0zlMaKInIETXxwEOPoWNx8OzrZmC64uFi1i5FcEIAj0cjB/T/jstKJoUI/ZXFhGjVne6SvV8q2tqpcyTHLSHwkhleOkVLc2tEK77MDcT7poDX0eETxqu9TWtVesn7pJCqPlma2EJkOMCJtpumAt3Y/khWO8Hs+P9LpWUhJrzB9Xq5hh4ZCaI5ddkOhr6J5fvfJBf8my/XKkxk+q7hrZqhqr+r7f67x6L/R4CtOkQjeM7oR6pAvIiYOXQjZuhvIkf+8GIytbJcLU6V6l16rFmdHCBYY3oiK9/hzh0q/1NgQ5eJWIYwBBiP6EgLGbaSzCwIN3M2DPhFAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hf5uwXlGUXbdjdNxt4ae1Wx7qGvZQSu62MdqutkKFBE=;
 b=KkyZw1M+giZh1wUJewJPqLNDUZKSU9+jKFPl1sDuOyN/vVbuT5msgHnVOUdd0DZKGuzZSrp2Bcb6/Z9Hcbmx05W3+pQ7GpsvCk0tWOgcf4WnzSMz4kMzABNm1XjbrzQd3VJBkBPPaLI+W0etgoKJko3TwVNiAZfyknkOXeHgyzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10802.jpnprd01.prod.outlook.com
 (2603:1096:400:323::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 00:41:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 00:41:09 +0000
Message-ID: <87a512aau3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH x/x] ASoC: convert to snd_soc_dapm_xxx()
In-Reply-To: <ce39d5e1-9cb3-4af3-9872-a1f56d7cbf8d@sirena.org.uk>
References: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
	<6358b4f5-88a1-4bd2-b15a-20f090dddbb4@sirena.org.uk>
	<87bjlqv9ug.wl-kuninori.morimoto.gx@renesas.com>
	<ce39d5e1-9cb3-4af3-9872-a1f56d7cbf8d@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Nov 2025 00:41:09 +0000
X-ClientProxiedBy: TY4P301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10802:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a4d432-6602-4fdf-e830-08de1b3ad8e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8VMI/P6hUuX0F2YSz3011384byPTh+xV8sTZo9tCml5lYbiDIexTzP5fyi2R?=
 =?us-ascii?Q?c8W4cLtK3t0PsBgtC1nuDzFvyH90Uvvk4s0ZT23SQ8xP8A4TYL2Quz2uSJ0K?=
 =?us-ascii?Q?hIScSpS1tVHSXIkzvZIQgXtX/RsFonaeOTxCVHb9A1DcBKn5wOt90abIKkVm?=
 =?us-ascii?Q?mh+Mb1CeVmnCoc2J49pV2CyJiYxJKSzPO+OB+bVUOOGAEpPXSbwhMuksywWp?=
 =?us-ascii?Q?hL/7FuZu78opCSLMUxyWc3oUTbSp9qHVCSisdcYJwSxm++3N804xpJKXPitQ?=
 =?us-ascii?Q?X0XAC5pWJfKK/rRsddOcsWkBs2GSPlnz123dMPr2rBjotkyL+GR6bRF6WG5y?=
 =?us-ascii?Q?97Nli3N1T5wAvhmfZn/6NWr+BjOzj2KAyBJueLyhgnW80Z1B5wubfTaJgQIB?=
 =?us-ascii?Q?zvqIbFfv/AAXPwX73XpthjJk9se/JUcAm62V69E/K49OwFX8XhpXbTM1hL0G?=
 =?us-ascii?Q?aXpvHgDCNbFz4HwHX9jPKeDGgnLYZra217oIiJj7MANvBg2IckCZT5BoOEsU?=
 =?us-ascii?Q?Zx3cqcYAL4nT+9HWqvxjuRycRD7xhRIUJ0fMuM9jrB/bB8qauaRQhPmxv8qe?=
 =?us-ascii?Q?TlQVwSenm8+sAGgU2gcWtukCbc6A6xa7fCWooBg4bdr+nUXGrWXK5Cvabwuo?=
 =?us-ascii?Q?hHfED7m7gdc0ADp8+5E1rKeDthhI11jsxAev9PBW1mW/+g/g44LDGxtjPeI9?=
 =?us-ascii?Q?cloW6rEXyh4iIW9OlpRErCpstMv0+EI+hyEKeXmk0vr7i5MwX9JsVhe+mHI8?=
 =?us-ascii?Q?f8j4Hcx4JPSuP8Ub6B+1H6IgjSkq4FkY8vs8T3XtzIvsZdV7JFjhxDhJsrjB?=
 =?us-ascii?Q?wHlf5My+7k/SJnK9641VQOsO7pkKbfJkJvP3L1OHq/JTxaZPrU3/VYxryNGM?=
 =?us-ascii?Q?v+IzJko9XmScpfA3nrSiiZ4L8e14vlYy5Dlg2dVVFeAvI3jpaxSNE0QY0Er1?=
 =?us-ascii?Q?rXAoXbI+4veV+iYoU+AXMRlsfVel0dqQt5vfSmCa8k7y8+eiHDy5orsjgObq?=
 =?us-ascii?Q?N137El1AU+7ko90FgW9b839JNcOGztikHCL308TpA407EYi52af3ZaOlHEzb?=
 =?us-ascii?Q?aR5xJwp3VtzRqxfDXT605uAVWn55uO44Lwox78Kfs5zBIPTQrSuLMOg27RHi?=
 =?us-ascii?Q?vR+P0GdbdG1Ri0Jgq2btJKMdbwHIGXJQEekoZff5lcAQNOtJ3YF/Y2uBQ4iu?=
 =?us-ascii?Q?O/k4vN6TXUyeuxf8P+czNjGSHXYubl4h1F/bkU/FfDPxwP/YKNE2ZVQM0JYR?=
 =?us-ascii?Q?MIn9UL0uCZ3crYDAn+U2CLTfhVlLeWiT4X5J73T3RnUDN+KlbdrxVXVCgxpk?=
 =?us-ascii?Q?cAMxoKsMX69Zd4VTqLCLdwzi7BQvrBTY+9kgXd3/2G873Cdmt0P64hjUncjj?=
 =?us-ascii?Q?q3Bj47F1cBpIaB4vjfoVeSadwrMuCG96x9RiwKgsbdhhP6NzOvmiE5JiDhjX?=
 =?us-ascii?Q?HgnZFCG2H+oyRuyB+Lhw4XkasWlaFNB3ohPSWHo7eDl/7jf73Mw0MA4kE/Qt?=
 =?us-ascii?Q?ytrkBF5YffURDomgmSAH9Qb8V9ujb3rV/2UJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f6NrDMTS8ra2X3lHE6HtiDvS2MUgq0UemW989sWEsM2u3nAydhHyjVEO5gdm?=
 =?us-ascii?Q?caMHLj2I5yG0U/epl1Qal/1JQHxuwcZQdVgTowaVI3HgGgSTQSsyyTs7g9Ys?=
 =?us-ascii?Q?D9n8SnvpXVd9QtzfGFL/VRBEYO4VySVh+ntxOh0brr/ZGZTVnhVwbfRH607g?=
 =?us-ascii?Q?HHewiMUBcrkJZopUpgW1rP0rXsHM7IW2wzRecvnlB/nbfxISgIFwR5aJ06kb?=
 =?us-ascii?Q?lr0PtwLmRyNtT+4OpEPNN92W3Saf91PGoSIhfxBpTmr5Lr71dH/JVat0BJZr?=
 =?us-ascii?Q?HxCvPZp7IIdArBoXe9wLahVSt5Yn4pDLmTRIVm9xdSignthB35+K6RuNR7hQ?=
 =?us-ascii?Q?vqYPyaKSN3GKmXx64Hty0xjOyR/kAgV/hcr/RF0nJC3KZo2j3yjzam55AVW7?=
 =?us-ascii?Q?DhbjMFAtcq/GjGgZKB/8T0KWG43YJgv5nAhqUniEXi/nyB3PhUvMvLMosQT9?=
 =?us-ascii?Q?s69CvqD+R+Tl8/tFy7HpAppWJ+Ky1tytvD/lzrD0rqyEePw03T8XhF5lU1KG?=
 =?us-ascii?Q?ptefRimoQ6LhOpx2Nll2E0EtOD1L6aLTmyWqMsnwQCA4WjG8KLN84Ls8SY/B?=
 =?us-ascii?Q?LceT8tVDlFe4IARvFDUdi+oOTpHfQamJM9mUr3jE+xJXtqV6r4K+4qIQilsK?=
 =?us-ascii?Q?o9JUvgP0BlQB6A8JGYvBC2zIUHCp2EdCEtz4BJJydXzniAfemOtcsKzPWpuW?=
 =?us-ascii?Q?qkccnA/dgRsiQnHnc39nomgerwRECm4jbsuQTaHZVY8ICZhev/6yykede9Q3?=
 =?us-ascii?Q?YnRT8F42ZVQ3EDyu+1vUYhDtsD+TpQPxvIs4ygYVTb5O8GUQ6IqSm02LyDi0?=
 =?us-ascii?Q?VILPXm2u0LZbx77pCJvt7rQTPZukZdbYw5nizrgY2qn7kBvJXpg9jvuS0QRb?=
 =?us-ascii?Q?tLlGI9GAAqq1+y34qhi5GCOSbB9i3RB4ORMk0vZ+AzcY2lwxQgitsAYZ1Yki?=
 =?us-ascii?Q?+Dbr5r5W3RzgpquiPioAimYUmTMgdRZI+IjhXhXSCiy4bJTkvzhDGJwZK5sM?=
 =?us-ascii?Q?/Z1PFUqAnoOzMjMNWAw7TX9RO1eCXRL9ymu7BrNEeY1oTLFBXAMufcn+FFLc?=
 =?us-ascii?Q?tSunso95x/7aIo6g98NDgZRlDTUihzD4bWD85lEZyH4s7q7g/ZtQ73yYUw+L?=
 =?us-ascii?Q?8NAVfycV/+ItII4OX6uz42cbrqZUyiwICv2Rbi94MhYJlO0p7wnF87ZqNQTz?=
 =?us-ascii?Q?0CVB2xeQzRjAWWpx7nX+CPlbUjV2IynK2FwnajAcIvhGfQBhb6brTsUWCjq7?=
 =?us-ascii?Q?9DRZmxkj5/kE9MFjR3NJsgV8WZqG4/FcCYBwNky3MsYPmh4HWGZL8JE/Hhi1?=
 =?us-ascii?Q?j+BiXQlk54G3jve6MPMfm2mcE1zlsF5+tF2vrYdpma7ijeDXtPf02gFYfsnR?=
 =?us-ascii?Q?2cnJ5IY7yVwDySOM+G12xkrAeAiXe5VrCdUiSp8GSoDtbPSEcnLIgPkr+aMj?=
 =?us-ascii?Q?dov/LnCCC6YhPI67q0CkzJFWwreeV1CVkCSZL8h4UwPWmPx2aeODFHiHAv0i?=
 =?us-ascii?Q?l8Jqs+pCZa4gFM9qsYo0Vff8BoZBAC+xPg27zo6zqlzDBVIrYN6dv6S0U+0c?=
 =?us-ascii?Q?DDp2a8mFh/ZOkflpee2KWLJV+Pm+4cOJhm2bTIVEReEy8Ub8eGOOy8UX//Hb?=
 =?us-ascii?Q?lxvjlyqlFF63i3eivwtFFAk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a4d432-6602-4fdf-e830-08de1b3ad8e0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 00:41:09.5236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCOWjEvlQqGlg5wGQtHwHpdoPLmxyVel8pGUXr6wKxCGUVHGGve8iD1eTchkYdo3r7Pg6N2YG5BR6BvjpYCEiRouNXntHcwoo7gnGKfpTn9zevURuk7UdC6xMpOTeD/z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10802


Hi Mark

> Yeah, I think it's a case by case thing.  Things where a big proportion
> of the uses are just the simple two stage lookup might need a bit more
> consideration but probably for a lot of cases it is better to just have
> a bit more code.

Thanks.

If DAPM and its functions were completely hidden behind Component/Card,
and users don't have to worry about DAPM at all, then a wrapper is not bad
idea. But...

So, I will remove the wrapper by this patch-set.
I will wait +2 or +3 days, and will post full patch set.

Best regards
---
Kuninori Morimoto
