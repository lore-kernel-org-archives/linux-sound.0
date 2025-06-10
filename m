Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B31FAA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558620; cv=fail; b=qxScGisHO8R9j1NWUsBJ4IaP2VS9q8kgYO5Fqe7VTyJVt3UCxdrV4wUU+nwpI0rIU/dWFqVcMnPOJrsR3XPqS+RKccBy2EIvtiiYKPJPnSYU5MZi9+wOdGaWuxR8YR/StU9SLOCHPC92bZlrtOvIIHIGLW0gDFEt8iJ0ldETj1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558620; c=relaxed/simple;
	bh=6tBGezwrQx0cdAvBq8Stcg63+i7i2ps1nLE4wSegf/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5oHhLEoI4hYuwM3E1jtUSBuplWGzhX+AFIASy50uXKA5hDfhEAsbw/Ko5G5qgE2iH18QeSDFdDG066L7HTaQa/PJKV+PPK078+l4gsebDdM4/qeT/F/bdnJuuDjMB8fw91fIB2Elwwo8z0FGxdnE6dfBTfqGv8sRGpxZvg9DEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XLoszptU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=m2RhaE/V; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XLoszptU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="m2RhaE/V"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ABXB07007827;
	Tue, 10 Jun 2025 07:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=7y5AjGXpPLwlW2Vyq7
	X0tq/CVtpcc9xRDi+8v4QHxb0=; b=XLoszptUfpRaIVIdH4ASfitvMr/FcOQVlV
	pl1kHGijZRRMBnNvM6s0K5CM4B3SWZAfOiO3DxEYwAcKgiQCBHaLpY97aMcCGFOU
	Vt1Kyrj+jExWpF6aIYElBjBlwZPjqNcwNMC1qCNjT8BMwMG2cx6jhXrsJJmIZHl9
	7/1GXWyUXai/8dCgdtjqF1RkhWujSvUOl7UP+ToErsmm7BpuM2owRFCga/DjJGhB
	e5NtpOB3qVNh2GAWH3BUHb6PE1uhnYdqpcuyPrxGoskM2UVKmRB3OXEokRdFlvOC
	xmJnem8WSUm/uQNL5BNNttVJTTaXuMeXiWj4EeWS893umzpo37mw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11hn2237.outbound.protection.outlook.com [52.100.173.237])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4760mwsdmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 07:30:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w17kUuzmEOXy08KNexDzGK0cUCyMydBX33pxsrxPxRfG2X/bd2mzrUSCiS4zpTws0JU5ExxmorpVj0gNuzgvmXKlCeszojLTrCI+C5eH8Ha33qe2xB72m1MfTWluTNDGuwH5IsSoCI/vii3G7FtInlzdFaXqWkZrYtP00AGrBNT5aJjFj70iII1oyjQgrYwl0LGx0S6CBxtoY7HoAISBvfbTSSauRFtj/CMW8FEg3EsukjpYnT6brujt6/VT/XZ1nUbFkC6CKWRxj/cVm4wiafPUa5fN8HtpNPP8EmsxNpcIrdJnMRIpJS3LRijiWHyNa/aLhtXZBX9lP81PGpSFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7y5AjGXpPLwlW2Vyq7X0tq/CVtpcc9xRDi+8v4QHxb0=;
 b=YH5UWSY/F0SPHy3AXxN+M2qdrGVKPuGAnJvsERTHrtz9nEpEfyRITXOAbZiQvbV9sQeXZVKHObul+Evbnkjd67swm+KKkE5BUODK/yTFIrk5oWrbNQjikqsYzhcOT+TLWacFNfsd3eQ6H1Yllv8ofNm5DBVLNw/t+xu60lRIRfNB046pgn/6Q+cwVFINEsiWQ6O/0Bpa9kRhvvD64Nl8CzOwW2RKBQgn5xPzcLTe5efl6DWm8DjFCl+K+epWJIc7FkrGTE1GG9a4txvivK+lpMVnGZ+9zJ3N1kOEoH5LgqYz7YmSflHikNOqIO2RU8mS5pMZH4sNxkyDaBTPhAXc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y5AjGXpPLwlW2Vyq7X0tq/CVtpcc9xRDi+8v4QHxb0=;
 b=m2RhaE/VoitM7PlQMQjH2LxDJMXrAz2R91fj17nOJEEam3CSB0aA/tS+uBksEB+ESzbee7TPDDjPRDf7o0fc7j4T6CCltSA56LAa9G0//vQEJqcZEQE6ZZfdl3F8KUVwotSTGZUujnFbMWKy5vRNSaaFI+bnLGtiJrCLhnUQ1iY=
Received: from SJ0PR13CA0073.namprd13.prod.outlook.com (2603:10b6:a03:2c4::18)
 by IA4PR19MB9115.namprd19.prod.outlook.com (2603:10b6:208:54d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 12:30:00 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::dc) by SJ0PR13CA0073.outlook.office365.com
 (2603:10b6:a03:2c4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.16 via Frontend Transport; Tue,
 10 Jun 2025 12:29:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 10 Jun 2025 12:29:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CBCBF406541;
	Tue, 10 Jun 2025 12:29:57 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B407E822542;
	Tue, 10 Jun 2025 12:29:57 +0000 (UTC)
Date: Tue, 10 Jun 2025 13:29:56 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH 7/7] ASoC: SDCA: Add some initial IRQ handlers
Message-ID: <aEglRBN0adx84nN8@opensource.cirrus.com>
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
 <20250609123936.292827-8-ckeepax@opensource.cirrus.com>
 <283bafe1-136d-46f4-a83b-7467d0344fd4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <283bafe1-136d-46f4-a83b-7467d0344fd4@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|IA4PR19MB9115:EE_
X-MS-Office365-Filtering-Correlation-Id: b10b0dff-db5f-4647-ffe5-08dda81a8414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|34020700016|61400799027|82310400026|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/z8W850qtgZrR7eDltZm6ain+w3bGNOFw1WLM8Pbbh3VxD/HVBW6l6D0v4fN?=
 =?us-ascii?Q?VCaLWivHJlqlFQ7KxalOPypXZ8BL+tfAogIatPpnoWShLia8N802z92i/lQ7?=
 =?us-ascii?Q?Rb+EHtDz8xOmAAHKlwTERWh1s/nK634G12R6G4tsWpZaCs3uBKUcWdOgxFX/?=
 =?us-ascii?Q?Og++ju59YumPzjBP+8m9VygLSZ7wDiUtAtho/ySDZ9DPrUZtJY3/AF/bnMaR?=
 =?us-ascii?Q?5V63adDIMgr7gjYBXC3mJ7w7XfV5XZ4il2Plzs0QPinN2LwvEQLjWVXkhWtr?=
 =?us-ascii?Q?XqHuNeC/fTlzQrCcpXkIYBU1O9EDTROIKIBhNl8IGITUeQdJz5Ck5TNJxDHS?=
 =?us-ascii?Q?L1UiGAonlvbe/yCCl0GGKTP8J3QBzQmpIwXJyYN4FEqvT+FnOR9vKkOHQo23?=
 =?us-ascii?Q?btvkKJZhpbybFfbFryWZ0WY17ae4NI5iGSGgRzuug/l1WaqMksMpCbzODZt7?=
 =?us-ascii?Q?31NZBE9rw5IJ5CKBomEGCfBdWox4jP11SJ+rr8Q8aljCTTa+E8TX0Gx3Eb0x?=
 =?us-ascii?Q?ijtvecMMiOd6PQubKkfo9Ih4Kqdnn3mEgvhojc30jTOvPJcUpgPm0ZW/0HDl?=
 =?us-ascii?Q?uN45G2MfvQpRXd1WOsB6IdlLQ6NIW51hnLJ3+bswwDqcZGWH2THDZRCD0+eW?=
 =?us-ascii?Q?LtBJD+gdA/z1LVAYu9geNbqX9FMZIg4Jxuav+Ll1r0pA/1UaIYbBoL2n/1BK?=
 =?us-ascii?Q?mixBCLvfZcEj0NeJOgxN3osdH9H5Qm8GYycG6pWqTTEtKqhHEYkZX/orrf07?=
 =?us-ascii?Q?9WnclxwctETLgPaBidbAsRR33fy1/KmnwlGKGoBGVPxSSHKk8HghDSSmeWKB?=
 =?us-ascii?Q?DW7o8Wnfq458viPO+cPXXzc/WKgBcbIkJDbKpnMRQ41MsLa6I1DUE/iofvTT?=
 =?us-ascii?Q?vI54EmwLzplBa42Z68TGiedC74QZx0sSpEl/g6fdM8k57hl9VLd/U/E06M7F?=
 =?us-ascii?Q?N1E6BOT4eSY59CMDd63nAXqPutOH7taIpqMwFfaoLCVJsHnF+xGiOT9DETlS?=
 =?us-ascii?Q?lgs7rzSEIsMC2TrY3htS9x2C6Si8NULlW2EJlk/WHHlyochs6+AdxbV2kNk1?=
 =?us-ascii?Q?dTwzBSJAVxYRArVAp0XrCxgzwXCiNYwemgYyWYY0nFtwFvJhliyad7urhlWl?=
 =?us-ascii?Q?iBz3p7T+uZLfYAC/ZNV6SrO52No8CMt4MCTj6+vl9FX8ClJarwuUDMCD/ZNx?=
 =?us-ascii?Q?1BotfeeOuy19DVM/yeQ6Atcv59g3dGZaBEKNaKr21bUoS4iIkiu8mT9J2luF?=
 =?us-ascii?Q?oeCiZTs1noiUlk4KPRENOJyp7huK4ebZW9Jmq3GEytfAxowGITg+uOMgJcoz?=
 =?us-ascii?Q?HpWqrC8x3rOjrzgwQ7nluR0i1Cwy/Q/j2u5Gi33swnOenJRN4dWWNaT9F4Gl?=
 =?us-ascii?Q?kdrXsst373DCa+3XSAF62lBJ16fL+F6SrQP/V4lBd3RZGa1f/W0xOBEMwxRX?=
 =?us-ascii?Q?K3WqIyr3K/OdPwTNEgg7By1XW9bOM2FeJ8x7+I4Ar03w6yFoEX4dUiFuMEbI?=
 =?us-ascii?Q?Q/zIEhUKm1Bb1IIVO7z36vAdxY/1yVz538R6?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(61400799027)(82310400026)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 12:29:59.2312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b10b0dff-db5f-4647-ffe5-08dda81a8414
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR19MB9115
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5OCBTYWx0ZWRfX0J77Ha58G1F4 x6xFjB7jnJdqF5f2PmUW+eDewXSsaTNO4Wbabl0G4UNQ6rwBEiNpK4vsFlpqhtA8EuNpxfiIrGT XtJH0VcfPJlZnjsW+tNnfqZTfm5r+FJIxTp8Qe9HvgrSsQ20P4USlF/l8devZNryT3LRYOvXoAi
 e/JWPMeeLcGt2Bs0Q5ZWJVXbnd+aAzCcD0GLRtm99zIxt133D+Eh6MZ3y+JQD978m91dQnJhmoT c8kscKVKanlBLSklaGDKOn688VsoAMiqpOBMWjovgaDLVSBn+Haqfh7qRZNIaO3vsBiUduZjiuo eB0R8BH/ahNmOFlknu9Lxx1NktjmL6eYQYckikFGKUFi/f/2jzsVS5c2yhauWFfDBqUUvuJNNji
 VFlqdHIynScqNDT71LPa9g4Qa72nOrvy8rn0k3JveLAUoZOz/HneeUjodZt9B1oAQYCgQLv7
X-Authority-Analysis: v=2.4 cv=coCbk04i c=1 sm=1 tr=0 ts=6848254c cx=c_pps a=JZ/lOlYs+bVsQ1Xh/xWJ7w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=4to3ydW5KnvLW-hm1wEA:9 a=CjuIK1q_8ugA:10 a=jZz-an6Pvt0H8_Yc_ROU:22 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-ORIG-GUID: kLf6JKs4JuGSeH-8r-2lMN4qD05-oZBf
X-Proofpoint-GUID: kLf6JKs4JuGSeH-8r-2lMN4qD05-oZBf
X-Proofpoint-Spam-Reason: safe

On Tue, Jun 10, 2025 at 11:07:00AM +0200, Pierre-Louis Bossart wrote:
> > +	ret = regmap_read(interrupt->component->regmap, reg, &val);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to read function status: %d\n", ret);
> > +		return IRQ_NONE;
> 
> usually when a read fails, the entire device is in the
> weeds. Not sure squelching the interrupts is wise, something
> more drastic should happen.

I am not sure I really want to get to far into complex error
handling at the moment. I think I would lean towards focusing on
getting the functional case working first. This is also pretty
much what all audio drivers do on register read errors log a
message, abort the current operation, and carry on. There isn't
great value in doing more unless one goes so far as to actually
attempt to reboot the device and recover, which I would definitely
put outside the scope of what we are trying to achieve here.

> > +	dev_dbg(dev, "function status: %#x\n", val);
> > +
> > +	status = val;
> > +	for_each_set_bit(mask, &status, BITS_PER_BYTE) {
> > +		mask = 1 << mask;
> > +
> > +		switch (mask) {
> > +		case SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION:
> > +			//FIXME: Add init writes
> > +			break;
> 
> between here...
> 
> > +		case SDCA_CTL_ENTITY_0_FUNCTION_FAULT:
> > +			dev_err(dev, "function fault\n");
> > +			break;
> > +		case SDCA_CTL_ENTITY_0_UMP_SEQUENCE_FAULT:
> > +			dev_err(dev, "ump sequence fault\n");
> > +			break;
> > +		case SDCA_CTL_ENTITY_0_DEVICE_NEWLY_ATTACHED:
> > +		case SDCA_CTL_ENTITY_0_INTS_DISABLED_ABNORMALLY:
> > +		case SDCA_CTL_ENTITY_0_STREAMING_STOPPED_ABNORMALLY:
> > +		case SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET:
> 
> ... and here, the status bit essentially mean the Function isn't
> working as expected. I really don't see the point of attempting
> to write a register below, we'd need something that essentially
> resets the SoundWire device to restart from a known position.

The FAULT ones definitely, hence why I log an error. The others
its less clear, definitely on first boot both NEWLY_ATTACHED
and RESET are likely going to be set. The two ABNORMALLY's are
also a bit sketchy, if you look in Table 198 these can be set
after any reset. Basically where one gets to is  all of these
can basically happen during normal operation.

One could probably get into more complex trying to filter out
post reset events and catch later ones, but again I am hesitant
to get to far into complex error fielding like that. It seems
like it would make more sense to tackle those problems once we
have some situations where people are actually hitting problems
then the requirements might start to become a little more clear.

At most right now I would probably go for a debug in here, but it
feels redundant as there is the line above logging the function
status value. Also if a device wants to respond to these with
more strenuous measures it could override the function status
IRQ and taking device specific action.

> > +		case SDCA_CTL_ENTITY_0_FUNCTION_BUSY:
> > +			break;
> 
> Conversely this one seems harmless, FUNCTION_BUSY only impacts
> specific SDCA registers and this status cannot have any bearing
> on how to deal with interrupts.

Yeah this should be pretty harmless... well unless its a device
that function busy's for random reasons (ie. reasons other than a
deferred register operation), but that is not something we are
currently adding support for.

> > +	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
> > +			   interrupt->control->sel, 0);
> 
> Humm, I have to walk back what I wrote above, if FUNCTION_BUSY
> is set the read below can be problematic, no?

In the current register operation function busy model, this will
always be fine as this operation will block on the regmap lock
which should be held by the previous register operation that is
causing the function busy.

> > +	switch (val) {
> > +	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
> > +	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
> > +		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
> > +				   interrupt->entity->id,
> > +				   SDCA_CTL_GE_SELECTED_MODE, 0);
> > +
> > +		/*
> > +		 * Selected mode is not typically a volatile register, but
> > +		 * force a read from the hardware in the case detected mode
> > +		 * is unknown to see what the device selected as a "safe"
> > +		 * option.
> > +		 */
> 
> I am not sure this explanation is correct. I was my
> understanding that when there's a jack interrupt, both
> the DETECTED and SELECTED values are set by hardware, but
> SELECTED can be overridden by higher-level software or user
> interaction. DETECTED is RO, SELECTED is R/W IIRC.

That is basically what I am trying to say in the comment. Normal
proceedure from the class side is to read the DETECTED and write
that into the SELECTED, even though the hardware will have likely
already done that. But it is slightly unusual to have a register
that is Class Access and RW but still written by the device. RW
registers are usually cached, here we need to drop that cache to
ensure we read the value which the firmware has tampered with,
because we if DETECTED was showing unknown we want to know what
"safe" value the firmware picked for SELECTED rather than our
cached value.

Thanks,
Charles
