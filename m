Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D343D9028;
	Tue, 31 Mar 2026 11:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956974; cv=fail; b=dggNxvpvLY3wtxUbzuJtsOK5MP6p8GLeEY54diG6DW8Ac+dTBqaaQznEGMYl2quvfZdZ0SIEYGV2ethtvrUvJ4KcOA+KKMylaKZe5o/JKtL+CF6KIoMU2V8bMb4xsaDmYyGMHVSJGWalt23VboNZk06rHr8HI8wIPeg/bRZXvRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956974; c=relaxed/simple;
	bh=8PD4tN47U9blGyi3J8f/O8nfaTWDRhFRouaGkBfjRN8=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=TLFb+MzAubg83vaGOP+vUm5pqwuw2iSnBtWrUanL+o3KolXG76BO2srBhnHZ8ECr356fnbTr3rfuviYGXJnMdYqTEwSp2vSlabvDWkV9Pc/1jzHHCNCcDbGUM/ioT+cPVc7qnEwKeo0+9B+2Sw+su2tWjlCT3qO9PpjINKoWlDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OF+Y6hLH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KEilyy4k; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OF+Y6hLH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KEilyy4k"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4aRT91605297;
	Tue, 31 Mar 2026 06:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ceW0h+pXXCdmms2YyP11XYvyxz1StHMvTyISbkh9IF0=; b=
	OF+Y6hLHRFT38vvRQjR+0VT7ZUjJjBHKiMJAUffJ0C6tVULCPwDz4IWTEE9J3/IU
	RWmBQXp/0ht+hksZqEM8TfPSbfkGtmfZi6gVEPHk065BuNawkWrEzyQ3lxsY/1wM
	Yc16zoh7XfoTgLVGh10qEtNUMeyXqaXeWgiMQSUNjH9nV8D2LFzdKwAPU3pBmmyd
	xxmPeO5MphojRSKAKb2VONSOnqAn7WFz6YcXfvJlqOFi+M5EWOcWKxF6grEOY5/D
	U6zmxwWtEJQ86JSY/Gl6hajGh0PJJCqHb8Tx5bHW/M5TV4xpoXcaMLAMixopX42H
	5HAiCPELPlNwApWof+AF9g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021084.outbound.protection.outlook.com [52.101.62.84])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d6bdh34nu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 31 Mar 2026 06:36:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j60RX2esfHEtF48D3dHhkcO/Xakvpm6YllyBsjOGHtBqHRvGXHH/HNeXaclMGC/OgWlZd7TABprawlg09vFkNwj9oBuoYtAVoOy3zkV8tQHhYybpErhAENGOcc/6zCWSiZkpIX/hZt7iiI8giSA9+wrgSnaWtPCjfJ8RiwzrFdeltm9GjIIShK6GCWw/1z1c6m8cOZ3orjniHSzia5PbjncwIa+US0a8+c5lWsJ64Q48kMX6vefApm2pxfFwNBK/MZIwngwyVCZiLv6UEBDYbkZYEesC+WL1SoYhxt2fPv4K7n2GHiVmEBhSuojx54pCkdtcaaeSCBuEGFa4puDjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceW0h+pXXCdmms2YyP11XYvyxz1StHMvTyISbkh9IF0=;
 b=BRawhG4tfFT4gUhpYjXciaQgPpZfAghRiLeiJmajWPxJSSjpDcvxdiJPr/y3ygphxyO/chWzNiToVPZflTaDNou0Ka95A+7p/I6wjJYR5Loloxur6JVYf5kL78dBFHBK1QgmqAgCv+az09tf08gDqXcQEtw5Dr08kS4CDjLMv6DwekFwVU1WP6WsKhVn8QpcglGS7USQNpjsc2TBsbeA9MztXTkBpSh16RIljs+595WnBhsDWnoLUBiPakduMjALjv7D5+HOZUoj8ovQ0lPGyyG8dwxiy7q6jAacZG5xyQiiLlqZaXFi+FK8T3SQo5+qVu/Xg0S/z8uFTgxPzpHTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=amd.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceW0h+pXXCdmms2YyP11XYvyxz1StHMvTyISbkh9IF0=;
 b=KEilyy4k1Gf7pX/p9zeT0f1EXu9nMzvCenCKpbMAxYvMdpw4dOaPoPpbtX0O06DEIAYYLWaBLJ8r3qFgTDKvnfuvJs4wfE65IslaKHfyogFamJJ9wNbl2YElkVfiECB9adnAP5l07J0KZc1ifcPIeR4qhjDIroZCqJbC+bjSBQM=
Received: from SA1P222CA0166.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::10)
 by MW4PR19MB8153.namprd19.prod.outlook.com (2603:10b6:303:1ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 11:35:56 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:3c3:cafe::55) by SA1P222CA0166.outlook.office365.com
 (2603:10b6:806:3c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 11:35:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Tue, 31 Mar 2026 11:35:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D76F240654A;
	Tue, 31 Mar 2026 11:35:53 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9F88082024A;
	Tue, 31 Mar 2026 11:35:53 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
To: "'Mark Brown'" <broonie@kernel.org>
Cc: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <Vijendar.Mukunda@amd.com>
References: <20260331104116.16417-1-simont@opensource.cirrus.com> <3d2bde4e-fb69-4e94-b83f-119f073aba95@sirena.org.uk>
In-Reply-To: <3d2bde4e-fb69-4e94-b83f-119f073aba95@sirena.org.uk>
Subject: RE: [PATCH] ASoC: amd: ps: Fix missing leading zeros in subsystem_device SSID log
Date: Tue, 31 Mar 2026 12:35:53 +0100
Message-ID: <005c01dcc102$887470a0$995d51e0$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG9uVm8WY/1u0DEEcOGFXi/tw3ukgMnbS4cte1WlAA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|MW4PR19MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b314ec-8a99-4041-2dfe-08de8f19abe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|82310400026|16102099003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Q1cyMLUZ6IhRFOzhsTpZfxX/xLUwqQECrguYxw960+fZXMepw/ytQvKLxGP1DSm6gCJSx1GIclORBgqiv7H+8swF0fulFcP9/NERfqjNwyuXTnbx8Z+US/+F7yAVDjYtl/1lJ1xv9+tyUM4dQPMHj2586ySivuAsq6vnKXbP+m8MR6ZOeVqNRZwpHxcDMxw11+/aYp/gX2vuU7YFmhkjyz3B/ONBO+kdBc0TDi82g32kIA1kEW3xaqptxwimRVHrGWFM4RDKVmtzE87HZMVTkx8hiomCeiXG6zJwPY86pdcWKAP4g35dRmGOd5rh39dHynyMjHRQhGeAa8yYqoYXuju+kNNoR89auD6MDTtqfLARNJi4ox1nNbQoFUvqlDYfUh6qUmyP3im8d5kkxI19Da/k83nSfgJSuxKELZYSUX8RTG6dFqYOkqq+EI8/Y4kI3O8jnfjCB/NU2MIp0HAe9WGhKrSd13B05+U+tk/OIDNtp2bt+dKpoWBaizBsOnckYl3qYsB/yg9JUgqrIsA8QcSG/+jto4VvcTRaC1AIkqBuQLc42mqTnuaodXOMjZkXQi0Jb075x9IOgCOFTaZQ+YDSmhB2SdXJT5s58OGlb9jQ0kn1U/4D6vuT1CAzDS/OAzk+NcmQwd+usITKucDhWaFXb28hdZCCjSoDq31zCfd75v2l26Fjhj8EWefNsdIBkMtpgNr6x90ww+IuF45kav9kOoXjth33+k3P10+GkphIVXhekZUJfD3f+JoWQs0ji0gVL5RR0E/4KZM/31eL2A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(82310400026)(16102099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n72LGnTGig1lwfWE/fw5Ze237HQdDU0XSg9JktoASrXAt0itAT0FffgHams0kji9VQkbhKmaALSCCjMZSxwnxyOco/hVVlD0OBoKqu8ff1ZoDCnpatmOWiWSGgEz+zeCjmGC4z7i8/X8juBoxefkwkbDPnb04NtXjVAv2ReyR7vsj2CBQfBt1S8jOZeFOp+RVRl1TYdZOBA6XOUs4qnH3FaSljNb3qcHQ1wgGlBGS9nepqtr9ICFFfBRjV13AU1HOhpaxrZ0TtMaL+BCyoifdS7Rq9vXO/LqPh8kYnbLiHzMW86jMPP7A0Il6Bdl4ZlvJSWyqdlcm8N3KKdyLnVSgYggQyxhk33Dw25HR5TtX6QfUNypx4TDxj0rExj9moBpwmvNCxMm4XVLVLr5ChYFJ4fgeW+k4+WpqjlmPpo0YYJbdlKv8Oqnia/Hd0Aq+gGP
X-Exchange-RoutingPolicyChecked:
	B6uWLDmUI/dzzwYDyzUiUX/NETPtBoNDVXV4RcbbXYGMZoz0fxFpb/r8LAfFq2fCttZTlS+VXIUdeCvJfwio8csFzulFyl+SJMNmA9QwgW9GrJhWesujBSufog2IrJFcD1sajr7vGefd+pvASOZn5WWNgQXT42dU43F5Hf53I4TLWvzkGIdk4k1DJFTRIXRscnbgljujPK/6MPv4wQaOIRPMKl4FTmZZpKsAk9E9BLO34wn09a3PQj55Fn0Lm5g0ThOf7LCWe1gycNREyhuX4ShU9qvMZo6jYz7v1Ysb9+FWiJPM/U+CIPwb9qI3lfsalfxw3b0JhYeNk/h6/J9l6Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 11:35:55.1243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b314ec-8a99-4041-2dfe-08de8f19abe5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB8153
X-Proofpoint-GUID: AA_yDE1UBYYtNBHYVFk-KF-Y6OMdaTMr
X-Proofpoint-ORIG-GUID: AA_yDE1UBYYtNBHYVFk-KF-Y6OMdaTMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDExMiBTYWx0ZWRfX3f7QUTz68r6k
 lVMrvTOboAAOT70WSxdy/PrqpPQpmWLC/GEADHW4V5qmD/GAd/+J9bauJzUw9+gkaN+XjvOLDL2
 oaQCCFcq+t5h6jU0DShwZ9c/pwSa3n+FFJ+zkKrZaJiEKeqdHQ4THaqfvVHCe9vWCrxu+wFsxiO
 hDt+4nGQsI9Wfbt7/P9jIiK7uu+LFqDyWv6bT1+IjyqAgLI954+0VlXB2yOBOZbu4urbGF0V1qL
 CF9H+NUOM/FKGeimn7k1/+5x0x0+1K4UEsXU3WpvNYw0p7AB3g45VKqfBZ/tFV7DV13f+S6/Dya
 /OS+nLlxq/sLaScKzOYsiCTdaFmx2jBzUb5VBwwOvLgY1gEhakm+nqTMuTc3+aJTB/x15B87MBy
 oAkL2zcT5fRKslVgstNYM8tuAWifsJfjAGOowYFoMIiRYgajk2sjutexyLvW32lXPNjbH9YdNYt
 WKxwdECSaHyBwwNPLwg==
X-Authority-Analysis: v=2.4 cv=GK0F0+NK c=1 sm=1 tr=0 ts=69cbb1a0 cx=c_pps
 a=0yFM1XxYkakKyygSKIuBYA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=zd2uoN0lAAAA:8 a=ZqcnUXZBxUTIyFpCECgA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, March 31, 2026 12:27 PM
> To: Simon Trimmer <simont@opensource.cirrus.com>
> Cc: linux-sound@vger.kernel.org; linux-kernel@vger.kernel.org;
> patches@opensource.cirrus.com; Vijendar.Mukunda@amd.com
> Subject: Re: [PATCH] ASoC: amd: ps: Fix missing leading zeros in
> subsystem_device SSID log
> 
> On Tue, Mar 31, 2026 at 10:41:16AM +0000, Simon Trimmer wrote:
> > Ensure that subsystem_device is printed with leading zeros when combined
> > with subsystem_vendor to form the SSID. Without this, devices with upper
> > bits unset may appear to have an incorrect SSID in the debug output.
> 
> > Fixes: aab1301cfde344 ("ASoC: amd: ps: Propagate the PCI subsystem
> Vendor and Device IDs")
> 
> Fixes?
> 
> > -			dev_dbg(dev, "SSID %x%x\n", mach-
> >mach_params.subsystem_vendor,
> > +			dev_dbg(dev, "SSID %x%0x\n", mach-
> >mach_params.subsystem_vendor,
> 
> This doesn't specify a width so how would printk know how much to zero
> pad?

Hmm, that's a good point - I'll correct it

Looking at sound/ there's a handful of other log messages making this same
mistake

