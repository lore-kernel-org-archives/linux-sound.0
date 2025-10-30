Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E3B3595B
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822111; cv=fail; b=Xl2o0aR2rCG0KckwG8HRVvz+QqmRbNRk4Pr4ri+OoY/WoC4bMkKbsQL19n6zQnzf8E7Cx/8fti6jJroLnsNozcz6ztcyJlM+Fw34MzxE8zHaxBJt3dx+yJ0oeirytsAgq4MQWz6Ua/JRjK2u8d4FQWh3DtlH2HAWrXxMlU5a4ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822111; c=relaxed/simple;
	bh=M0rvxxuTblhlDJrKk/OWzVoTPxzZZMx11c4ymKQMIeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQWfqonbSk9URdRgHVNjAtMb0LFhOnE+kv09X3jH2EKwSCqtjmnElTqUtcfBzyhIXeuByLPPY+xVUR2Ji62Ks2K1ubaFlVnCF48KW/Q9kbWA8Npkq17AVVp0v5M2GbzRSzFsvju9JxDfvg+XIph7C6ecx/O4GvPa+gza6Wo5ZHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cu1M6+Ft; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=d0O7/OZ8; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cu1M6+Ft";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="d0O7/OZ8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TI9WdZ692320;
	Thu, 30 Oct 2025 06:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ZHzLLfUKzySAFvoeH1
	daIsW6XuFLd0V2bcvd2UZoCmI=; b=cu1M6+FtofKza8kGN0iKMKDbQCZvD99WFz
	VDOxd+Wx5lY8Qi+3bOO8lQ0A4Ush6qpt5Ogy9+rSn0gMkkd+2HQ+uYHge7BOzZyy
	WPcyuqdlvBJau3wYsUiIL2yCkMb3TVUsQirkgIEuIwAVzvtNGrtv5KvVEruNdA8q
	qNgu1QqxIBhDJQ47wjngW1SuUaPu4KTBGkyY47nwJu2+ADz3Xqwz1FTYMLMqTzGs
	g8jR/Izfvp1nSxXtTllYXQNMgIa98IRlrsHgyQ/tYyOGaUt/NGunt6un+exaUklJ
	IHZaueqSqKZZSz7yAsudtgz8D4xb/2tapVBJN5eijsEYrRR14RQQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020139.outbound.protection.outlook.com [40.93.198.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a34a3td57-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 06:01:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJDurDG8rrAAjn0p8KvGrkB+VL2QW7JEkuf6YN32/kUZturH5DfjZteONbrkkTzlR6JXfuX7LH+VebwidARmIPzYpO/I1oWiMf+Bt7nJavbCP94sTaT/Ja53KscR0UZkilBue0MZqrZ+vRYnYfh94ICAlxjlOP6gmu4Hhz0DFHaSesnXtNm1WGVQtCYBAUv2FgcskbHwlIUhE0QDtQRtz0VyttbHEQ/TJw6FowZ5tyE9WWUHykQlFbQFiRsm/ExIbIXck9WDdzIOaf/IobCJMvzagkb3bQ+t3jv5wtgnzyBUeXMJLBFs6l0iI82upUWUsg1ZTJAyfm34O/KCzfijfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHzLLfUKzySAFvoeH1daIsW6XuFLd0V2bcvd2UZoCmI=;
 b=AbW7sHm5uO4u0wCpJWP4Aquz05ii4pGXPZLUBqR88nnkOZzYqRVOu0l0jGZGYyvANxaz45SAgWAONEd740+X+P7He0yvDZ/CT8IwJ8cODDmwOHtmCIs63HOas5j8hw8PMyNs87FKAgrKiZV99nH9iy24Fd99YsNZR3/VIvKmAnjxZxoKHsQO2TD0L4QALtq6g6CticdnF+QRWwbGfYhn9Uhy6oO/Av61xnodLYfLrEe/06Ajl+pBaj8QxoS26eeUiAv9RZK1qnPNyfpt3YMof0vZz9qaLSxIT3W52ZjVV0LyXTpyVJEVxiQmHYAzPitLYPswLeQWi1MVMzayc4YHow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHzLLfUKzySAFvoeH1daIsW6XuFLd0V2bcvd2UZoCmI=;
 b=d0O7/OZ8qn07sKs50vQqDGjyIZYKCB/TRkt8pumT7stjIPunKjSRzFqThpwbGWaX27VUA5Sm7YnhXy5mWHfp0khEityzkcEmNBQd52OcuGwCBYJgjk/RHY14FWsF2iGVSq+XlkVZ+OWt9Al9+2cvaVMAPf9nPBtXO5E4n0yBwEo=
Received: from CH0PR04CA0041.namprd04.prod.outlook.com (2603:10b6:610:77::16)
 by SA1PR19MB6598.namprd19.prod.outlook.com (2603:10b6:806:252::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 11:01:19 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::34) by CH0PR04CA0041.outlook.office365.com
 (2603:10b6:610:77::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Thu,
 30 Oct 2025 11:01:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Thu, 30 Oct 2025 11:01:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 93987406541;
	Thu, 30 Oct 2025 11:01:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 960EE820257;
	Thu, 30 Oct 2025 11:01:15 +0000 (UTC)
Date: Thu, 30 Oct 2025 11:01:06 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v3 RESEND 14/19] ASoC: SDCA: Add FDL library for XU
 entities
Message-ID: <aQNFcpAnoaMzRZD0@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
 <20251020155512.353774-15-ckeepax@opensource.cirrus.com>
 <39108baa-b379-4171-8426-c3b00a94e5f9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39108baa-b379-4171-8426-c3b00a94e5f9@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|SA1PR19MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: 9021f38f-cd7b-4479-dcfa-08de17a3a712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bIxCV0sS+1byaqNarKJ2i/aFRCb8Mv6kJnwoFfEBRkhBv3Ks6zLdKbOUkDnV?=
 =?us-ascii?Q?w37tIYoVzY1CM5N5xMmJBtqcgEknRR7ws3+uJ+9MpGmy+3LO3vw2CDzTqmJc?=
 =?us-ascii?Q?ssuVAmJrj5huoilZNerjAWM1XtipTEcd0dxNOxt1ET0Lfdy+xojAEAVa/ew1?=
 =?us-ascii?Q?n1PrVbIgcKVTaoyiKd+g8Sx/Qb8gnchwf7PZAwOyY7sw9K4zfMMocKzYTTtL?=
 =?us-ascii?Q?ngvRKq9oQdGLldGDdI2+0tRFLkFmjh7aBi6QN0SnWe4lDc0NA46F18twL+H3?=
 =?us-ascii?Q?pAq6ytm3pAChgNOCWLWdSMnnNmaW0FEKB88cL1s3wuby2qZnt+rqZYCPD8bl?=
 =?us-ascii?Q?cSqn9AJuvzF4X0KJSpHeFhqOCz8NgfXPy5oo5xxd6oZ120fS2dem064DVMqd?=
 =?us-ascii?Q?FAAnK7evuBxuZmQ9rke+ueJvssNBEZINMA4djsQA8XTr8KOx+qyKBpY/VR6q?=
 =?us-ascii?Q?CmKz8+3guwF4s6qeNTEIkY8iP6tXfzatWsyrmu/ZO3sp7HBcDWZTYM1jgGz1?=
 =?us-ascii?Q?mdpmLFrSSQJmYAnTSvRvY/1Zggu2Fm89fSiKPYxgo9DX5zi9dcGNsijNuEjd?=
 =?us-ascii?Q?VDNTh1chr4R0tki9maj0hbLOBV+TeyYvlVSwBz8PofJpvL0mHyHqMxNqb7MR?=
 =?us-ascii?Q?UdQT0HFvc+sKYUCPmiBcVUrUUPqNhmcknlpMD3XqAsMSPkLa5z3m+lsakJdm?=
 =?us-ascii?Q?tFCKBN7eLILdYE5VFVjL+oGtKhXHmyGoU0nt57w3q8fqiZnuPFsaa5EKXRF3?=
 =?us-ascii?Q?O2gyoMGiaQl6IqGRt76RYA9N+Ku+MxyodR8RtJKiHPl9PWYqvvqWKJqfMivj?=
 =?us-ascii?Q?NuNH+JLKEJW10J9k+O1Criy3l/emR58e/iSiM+Esman0fIlQgc5TrasKN2CN?=
 =?us-ascii?Q?WtjBT3b/U9B65RXxtsEoVg+LmtaM8airxu8AiS9919leeHuuc84USytRmiHn?=
 =?us-ascii?Q?pXiFKtPdKEJX16DElMAl+0/7Q1DdpChDkSyzvEG1tfhK4bbuTGiMKPh6aZlU?=
 =?us-ascii?Q?oKKCgkcAPeVjJGBIKfhI1XVI0PyBEUGCuqy79fHimDk30zutFJgC4Y7OLFR5?=
 =?us-ascii?Q?HBmjECxOdOSJQEkt7N2o5uSkEBQlyr6/1z97Qjrv2hvDJ2oQDdJl0cDcfoJL?=
 =?us-ascii?Q?DR6i3XFYlgu2WUEbY9dNdP+73u+RHZ0cDZZ+ohY4nkWSEMlQBq6fI9F96GWO?=
 =?us-ascii?Q?sY7023Hc1M45K59UcbipWlM1qzeNmPH3bTSVBYRZdWlsiinastNcYoSrsfKs?=
 =?us-ascii?Q?mgM2gdN4jTY76X51fmUyTJa1oBAXqxIbJaq4FGYQ4vZra6W7NTBqwda6iqvP?=
 =?us-ascii?Q?DZpaGYzT1qhFQ4Reg2rX5a8MHMHe88X2acKXcbYcnHt5mbxY4NKJS5vqgfQs?=
 =?us-ascii?Q?nUWB8lCqqgdP97GSqOE2sm1/q8p5btnizTBo/jTbBR/Pomd4JbNkg0rgMftm?=
 =?us-ascii?Q?YwcL/s625Sdc/cOsCITGD4Kph/zvzRZ2chR2C1FYn7MkkOI8w+twjwfRP/Yg?=
 =?us-ascii?Q?VXhPj1q3EGu/5EXIAtW0Dg/W1bNYGMCWlSnF2tHU7Fr6TMIICPJBvjyzXqvJ?=
 =?us-ascii?Q?V5UtqWZ5eZUo8MG96lk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 11:01:18.0147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9021f38f-cd7b-4479-dcfa-08de17a3a712
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6598
X-Authority-Analysis: v=2.4 cv=Wq4m8Nfv c=1 sm=1 tr=0 ts=69034581 cx=c_pps
 a=dNw5gGrGfw7lLk+3QxxirQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=nmL8fkkZafKExq16iBIA:9 a=CjuIK1q_8ugA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: PFr-nHrVhYn5yRhV4AtoNBkw5tU-GX6t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4OSBTYWx0ZWRfXxT9Vxy15lWCW
 UFN1/y2tl1KRA/Vmcw3QTJ2CXPaN3uSB8lwi4MMpuI5X4u0syBpZ1Z/1V5Bk1VYNqE98foPCcJR
 RsNUY99iwWyzIRF7CnLCPJEIciQZFtW6zo6Nd1oBuESAlr0ijJLF20xtqVfpr6oUIdxYv2tRVwb
 hL9wcpoP8y2QQ5GDp0nQjZd9ow1hcKY6MmH2VBhjF4W1YKqFdar+rcWnGlMgX5Efc93AaOPVy6C
 8AlnpTLwOqIMGZuUDNP0dq3GqLKHxDcI1v7fWMbtsvtmxdhGzCfu/AMkmtI5YOfp7AHaMnPxymi
 16S+PJ6NTVEvw/09PTSCOzOv7GwPYPfPpoF9liiQ6Bn9wFgVs10v16+0EOe2vy0WiCODO2XimY0
 ubBJNcbyleFsv0/5+hyQlmoqw04VKg==
X-Proofpoint-GUID: PFr-nHrVhYn5yRhV4AtoNBkw5tU-GX6t
X-Proofpoint-Spam-Reason: safe

On Mon, Oct 27, 2025 at 03:39:40PM +0100, Pierre-Louis Bossart wrote:
> > +config SND_SOC_SDCA_FDL
> > +	bool "SDCA FDL (File DownLoad) support"
> > +	depends on SND_SOC_SDCA
> > +	default y
> > +	help
> > +	  This option enables support for the File Download using UMP,
> > +	  typically used for downloading firmware to devices.
> 
> nit-pick: shouldn't this option be selected by device drivers
> who need this library?

These bits are all bools that add additional stuff into the main
SDCA module, so they do nothing if SDCA isn't selected. So the
device driver would just select SDCA generally speaking and I
think it makes sense if you enable SDCA that you get all the
functionality. If a certain config wants less they can disable
but that feels like its just for people really trying to size
optimise their kernel.

> There should be guardrails to prevent the fallback helpers from
> being used silently.

A top level driver has to bind to the device and it still
basically controls what happens, it has to register the stuff for
FDL to happen before it will happen.

> > +int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
> > +			struct regmap *regmap)
> > +{
> > +	unsigned int reg = SDW_SDCA_CTL(function->desc->adr,
> > +					SDCA_ENTITY_TYPE_ENTITY_0,
> > +					SDCA_CTL_ENTITY_0_FUNCTION_ACTION, 0);
> > +	unsigned int val, poll_us;
> > +	int ret;
> > +
> > +	ret = regmap_write(regmap, reg, SDCA_CTL_ENTITY_0_RESET_FUNCTION_NOW);
> > +	if (ret) // Allowed for function reset to not be implemented
> > +		return 0;
> 
> nit-pick: maybe document why this is allowed. This doesn't seem
> very good in terms of design.

It's what the spec says, as often is the case I tend to agree with
you its not the best design decision. I guess perhaps the wording
could be tweaked but in general where the comments say this weird
thing is allowed/required they are referring to the spec.

> > +	if (!function->reset_max_delay) {
> > +		dev_err(dev, "No reset delay specified in DisCo\n");
> > +		return -EINVAL;
> > +	}
> 
> nit-pick: or maybe fallback to a reasonable default? Making the
> entire download dependent on Disco correctness isn't going to work
> long-term.

I don't have any objections to a default here, although it should
also have a comment to say why, since the spec requires this
property if function reset is implemented.

On a wider point I am not sure I totally agree with the DisCo
correctness point. I guess we have to cross those bridges as we find
them but in general an awful lot of this class driver relies on DisCo
correctness. We build the whole function topology from DisCo if that
is incorrect there is a fairly good chance the part won't work.
Although for the most part my thinking has been if someone stuffs
up the DisCo too badly they will have to implement a custom
driver to handle it rather than relying on the class driver, but
for cases like this I think we can be a little flexible.

> > +
> > +	poll_us = umin(function->reset_max_delay >> 4, 1000);
> 
> add comment on what this >> 4 means.

Yeah that could use a comment I will add one.

> > +	switch (response) {
> > +	case SDCA_CTL_XU_FDLH_RESET_ACK:
> > +		dev_dbg(dev, "FDL request reset\n");
> > +
> > +		switch (xu->reset_mechanism) {
> > +		default:
> > +			dev_warn(dev, "Requested reset mechanism not implemented\n");
> > +			fallthrough;
> 
> this fallthrough looks odd since it forces a check on the reset a second time ...
> 
> > +		case SDCA_XU_RESET_FUNCTION:
> > +			goto reset_function;
> > +		}
> > +	default:
> > +		return 0;
> > +	}
> > +
> > +reset_function:
> 
> ... inside this function call
> 
> > +	sdca_reset_function(dev, interrupt->function, interrupt->function_regmap);

Not sure I totally follow this one, there isn't a second check of
reset_mechanism inside sdca_reset_function(). Perhaps this was an
earlier iteration of the code.

Thanks,
Charles
