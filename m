Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D01F9A80;
	Tue, 21 Jan 2025 23:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737501733; cv=fail; b=BHqWwiheVl6oH9hFTFWp+pdkrKFTAydzN6k0HR1Pno3rdfixMvewqNg8h/nxu4F16inxLnBQ46QRK8C1T7m70aMaZgy7gzLsSOPt/dRqGcutWfnGitOv10ItGi68l8y5vL8XYebioVHSgrLntkj42M0FUBASoQ9avdfaHUrbUUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737501733; c=relaxed/simple;
	bh=cteHlILURPg6p++ftoJIdZiEuBO1H1ZJVL2jwjrDRhY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=g0TSnS4JdJXJvBbqkG4sVw0WngnQRznS4Il96DUxePSj8nFhKC0WZdeUMbAfldhb+STtf/ZwUwm9k/mVLQupjKsab19iiUDg4rZNKB3+0dWlJN1Ir3jl7H7yeDIZyjuvtWfCIX+d7xVz7XHGSHZAGF7gpzGljHqCruTga9L+Ic0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=d7KRBCk8; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="d7KRBCk8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cENQd27pA7VMEivBHpGr3+ymgWwlCHQC4ruV3ypulvPTnDRTZ5vqdQF9uLuws9cAV2GU4lKj6Zgx6unVM569Th727RMEewrUF4HEPn9jpBaohLjiJpPO45gvuFekhFfnPwrDV455U55PsY9NIYMCsdmRahtaXtEOkBzwvqki/hnSiPTTl+8IR83nzlb+cKrqcdVBf78j4J1WuprEK3ZUXKKaBF97jCSruE21EHLh/h42sH0CB1Vgw8o52Zf/t3RE16WRw4OstkfWxaQBHwNqL4ZQ22kc0OGCqwiDJpdmI0scKBrZuInboqKzFB/3CZ5YnV1DmYIUMv0duhRsqlVM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAO/q9B6Shjdl+NYj9b0bYRLBIvNZuLM3s1s3ctWqnE=;
 b=V54pJCv1oXzheeAZXJPAM1LOOTnqhrXstC3Mq6r0taNQOlYtLfk6u0/i0bAFIR+/AxwVHy8KUsWW+qhaEta9UcA67h1frKGz0lGqlTB5yupI3HZ0qUi5rWfgrEAUctNeplwjq04AFKQm3MaIjPIczgPZxw93aKB9hDuWdC2ckyEzMT8yyVixgKBYHnZzPq5krVDDsfodQ/KSFPfBPHdcieEgthRFgAeEdIVX1yU8BUzgnfcjPSHjFdyEUHByOQrIlkrBN6J1glHnirXV/QZwLCWQ2jimQMElhSe4lFKwk7TW0NNBz33jM2+DCCDzS11OuvJqmG2nHWMboALWCtFS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAO/q9B6Shjdl+NYj9b0bYRLBIvNZuLM3s1s3ctWqnE=;
 b=d7KRBCk8JE/KSgqulrwHq+KY3WBloaHtPRuB/Dm7CSlGJJkl3GepmmzB5SeJXJdRDVCiV4XwOMRIpJSAbpaa13KMJFDr3+G07KR+qUXeyyCG9Ha8bCwCFNz3KQmhF3ycZCWHFoAdn/oaf4vDU8fXOwWI+7Q17QNvsWQpeu8LNcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12688.jpnprd01.prod.outlook.com
 (2603:1096:604:340::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 23:22:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8377.009; Tue, 21 Jan 2025
 23:22:07 +0000
Message-ID: <87msfjkb1d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: audio-graph-card2: use correct endpoint when getting link parameters
In-Reply-To: <20250121064815.741820-1-ivo.g.dimitrov.75@gmail.com>
References: <87h65t3voj.wl-kuninori.morimoto.gx@renesas.com>
	<20250121064815.741820-1-ivo.g.dimitrov.75@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jan 2025 23:22:06 +0000
X-ClientProxiedBy: TYCPR01CA0203.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12688:EE_
X-MS-Office365-Filtering-Correlation-Id: c4785fdb-280b-48bc-f148-08dd3a726bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oXMeENM6csoM6QZ5dxizHEw/JTKZhTlkXcxqZIjZr2AJU2JGTph5d8tdrLT9?=
 =?us-ascii?Q?bMBqbwW5mvt/n8rADLt+/SYhlf0dpa5TU0UAnX7mKc9O0fl8BIHwtGI3KCA7?=
 =?us-ascii?Q?tdHUUcEQ6HaSpb17Cj9CFgal9sKIkmkDO6Ol+pydzB9ZX6c7vFojZyeALans?=
 =?us-ascii?Q?r2vzmK3xOUg2Kf9pc9faAMduUm6mXEQY+Gz7gdB2j++1mO7FNll8Kbh1XIgI?=
 =?us-ascii?Q?W5miGryO0Se6XSQ1Lt1xh+dnrVWyzvfwcVU5s3Cy7JSqydZ/2IgqDvXwEkH9?=
 =?us-ascii?Q?5KmCb1sWldlM92lqT5MF33MhTP7eDn3PfOsqSwXGTPpILjjFkTjUzqtI7hNC?=
 =?us-ascii?Q?aj/5PmpglJtSSVTLP0yfN2VFlFoWjSnzOuIGy59GIlo9gYcgAuIOL6s840e8?=
 =?us-ascii?Q?G+dI7n7ZsqPour7NyJit5LS1jXmZ92vnk3OCHaEw3c/+ZcSHO8d0cG8REELE?=
 =?us-ascii?Q?Cn0E/FUqevc5qY2fSSIO2uDYVpnNS+G1m+Wg4f9lGXDv4LZr21UaezelZGVE?=
 =?us-ascii?Q?7bVXC/MruEYzNYoY335MU9l+OkJgxSk+3U51mGV7Wn1IXmk9bvmLAV/bbJ3l?=
 =?us-ascii?Q?qpxeTSmQ37OQ5MmnY9kjonoB7wxSUtzPogaNRA2GymMpsuQL29MKpH1matuy?=
 =?us-ascii?Q?LU0FR/Ax7gOd6w95EZevMiJFIyBXsC3zHgKUDIE91G+2Unn36HW3H1oXEsj+?=
 =?us-ascii?Q?SwSzO9erwCa0EJ12vC0b7pB5cgMK+nbIh4bcTkstsE3Bh0d3qzFB+0pmExwP?=
 =?us-ascii?Q?wFsJDMET+difCiptKDCaLY+dglqfuvKEJZRYm4715+xKdJehFkvzhMCbi4/9?=
 =?us-ascii?Q?/JpQsJa0Ssb4TChXmhnwqwSWDw3J+TotkDOLkcDr/GxkM7ZoPlihywyKaFIs?=
 =?us-ascii?Q?0dgA0ChFr5qq2WxHSBVnsrYGPWF6tEvZidL2IvPTBEG8YI/PADQv0Eq3B62U?=
 =?us-ascii?Q?oDt365RFQ1Q3+z6GjoyNb916IQoBIo/j7mmU4szIBU12RWShPJJsG3GaY58O?=
 =?us-ascii?Q?1IOadgF0SQGVtIuG1zb0gI4P9DlrNP7fJJ99C2+qyufyyh+GYicmAz61HmIQ?=
 =?us-ascii?Q?AZEKEJZNb0UHbCUPQCVeE/h6BKndFqtPhFYq6680dpy/GWDXZOMs7xsNL/D2?=
 =?us-ascii?Q?ZhV2USlr9r7gt+Z3MitfXyha+Jv5UAiCVfQShGoTSmx9hjp2YXnHZ8YVZILD?=
 =?us-ascii?Q?WplcfzyqRaax/wuQ7ZsOeP+Yvn2hxK8mEuuWc30Vs2O7yF8Rc9gSmC+XI8RH?=
 =?us-ascii?Q?WQlai89jmYhTxjqci0MCsZossP9bs4NPYjdHlHF1+hI93STxukOW5fxZ3j75?=
 =?us-ascii?Q?U274qHXlwTfOWe7+gi9LEIUca+C8kSpzJLstzLfpIOr/c8FWwJBs5acPOZe3?=
 =?us-ascii?Q?5eGGJnIMmhQCtnlt0++05QwKLDayzHLvmw78AUDkjrS+lDmXj2RyonrCi6Fs?=
 =?us-ascii?Q?+S5f35bT/jk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mq2eJfNCblY8QoE5INaAMydMqroueYzEicZ3dubR10AjaU+Ib0lgxdjsqIqW?=
 =?us-ascii?Q?+AbOvXrLe+3kxzfX6+CGe80I0/y1AwPIuirWv7/+7saNlkye6HpT0IWcC9Lt?=
 =?us-ascii?Q?+N2qlKi5x8EkdgGXeZvpgHEswQDdWRomEFBjTiAB0nO7phmbw+sspQiyfgYV?=
 =?us-ascii?Q?PpxAioAMXjVDuxoFdcZntKJ3zHt7+gIyty7+bn0uA+HXI3Q8DdLPGxmIF5uA?=
 =?us-ascii?Q?vYJszpDKM/i/Qm5j+TcGvFwgSfgj8XkVYUA1GUh1WamWvnc0qeUfshPM9rV2?=
 =?us-ascii?Q?WXjdPo107EKwxmeYV5ugp+/r0gW4CJM9zkTYJMLs3wnZ1N6Fgm01tkQrdXc2?=
 =?us-ascii?Q?Mg0GaSoZhj9XK3o4xk4LV4cw3fzPRXAjOsdJbTpN9X4cppxLdUhnDPNjhAJU?=
 =?us-ascii?Q?L2OCyfrIpikNk/B3C4fGz90N/q0ZYY2SDMWmaSz81uO8b9XlwlwFyJ+pPwWn?=
 =?us-ascii?Q?kQOouYPu+vUA3UvSt8RNdDpz+Jr69nxKvpenFU8xDeT7w2V7+TkwxldbXwn3?=
 =?us-ascii?Q?KPrHuTJA1Ub57td8vdYoaliFXBS9txxxmq0Jed8wvslIHreQmtT6mgwY5oOR?=
 =?us-ascii?Q?cJUd4rNATgrMTGR3I5heyfUSqej+Hzxc5aZBH+gDEW/M3FEioxLs4mFP072h?=
 =?us-ascii?Q?5nzS19o8G65yVHwWAglkfvOPxIsevmJgy1gyOxlirI5Z0karTRZiP79YWUIh?=
 =?us-ascii?Q?CnvHNC5yon0lp2tJKXj78UsPE0DSxWXL/ZSO38o4QKUYe0HKnOcBnS4xYiZl?=
 =?us-ascii?Q?aSpCz5V100UfvKQ/tmFCnhuZhj63xGiIkKWMb6X8fG1UE0OdKn26av75/d7a?=
 =?us-ascii?Q?TfIOZWP6IvQ06Dt+iMrd/BHEGgv+1kDU14Aam+vgGYIEaZJUqu2ke1cBjJX6?=
 =?us-ascii?Q?WuIUR8jYpOPc4tBoFrVM/OChcydFk80cpL13C4t7OLuR2Oul4gK8yzTCJS1k?=
 =?us-ascii?Q?KSJcUblvHBG+xxzz7M+ISLTBrDLWFWm5NK5K+HRPPcUptZzfbuOEulwboUlu?=
 =?us-ascii?Q?hHfMPnD59mZw4IeG7xQA6r0iiyjcSEMbntxptepdS8axEzPULz0uR3yeu0lA?=
 =?us-ascii?Q?tGtSaeWDsw5QS24QiZYaSVfE+f0rDaamFvWSk2Zn3BA3/kYl/ppzYamBmGn/?=
 =?us-ascii?Q?TUGbEFdm4zfLutrXDNzus+mRg2gF1rTpQjeQWwGAQSQAbqiajEvXGem/ReFa?=
 =?us-ascii?Q?sRn4gNpXOFVh+usHteED8Q1F8q9aFy4eL+51K7B/aiEEueHtkRK5mgI08SHd?=
 =?us-ascii?Q?RP8/dwNHRcVmGKREg8ZE8McT6spi/DrdX+4Ngndx6W1aCagjiIw5Ld6xJ0L8?=
 =?us-ascii?Q?3Mi1C3lsGepiS9Sb+jFhD4wnAFjKn2P2HBTv/amKgiBoBcwJhEmITNJS2oHa?=
 =?us-ascii?Q?74dgvT8EX/sbVRyZAJupdJHco57tgknyCxekYL+3fsp6lc+/j10Q3D++8Q1o?=
 =?us-ascii?Q?Ey1xQNpFvkOte/wTpKcR8+EFkaC/4r2B61yXrVbJa9YtjNI5wXOGUmCct+Ss?=
 =?us-ascii?Q?JboOrCaK42QzPbyMOGtxnRRsJehquW6Yq5Cfe87SKUA0C/Cp80nTtOmsQuFC?=
 =?us-ascii?Q?aWQnjx5y3bbhaOIk6owqHL8gI/3caA7rLMmoFTgX4whEh4uM/DUhe4etT88R?=
 =?us-ascii?Q?ob0Y2dgtG52DPyY8Cji06sE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4785fdb-280b-48bc-f148-08dd3a726bf7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 23:22:06.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfYcALNne4Pfb5t2GkAMv6A1YAacBYC1Via6buDdtbHfVJRihMKaV1eWOdFtqwcDBhTTL3zcUoTpfL/N59pU5yniqqnBlG4cci9QIlC/B7aggZS6ST6go6TpTIxUPf86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12688


Hi Mark, Ivaylo

Thank you for the patch

> When link DT nodes are parsed, most functions get port as a parameter,
> which results in port endpoint@0 always being used. However, each endpoint
> might have different settings, but those are currently ignored.
> 
> Fix that by passing endpoint instead of port when parsing link parameters.
> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Looks good to me. Thanks
It already has the tag, but...

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto
