Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31F439E17E
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809931; cv=fail; b=q7n5GdNkqeeXTFUGYuu6lAjRy8+BTslKtVQjF4n6CqzDOI53SN20ojYugJ89uPy+SfHKjoWLs4p+xDcn31tfAKVwlViokvE1L0W4ektpVHo5F39nJJEcFQe6+2KBTNnLGM0GR1GgYNiv6VcUxsOBQk1wNfgsMZL0DQ7OtUFvrKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809931; c=relaxed/simple;
	bh=cOJGNpMG7fLiPlGjtMWiEm8qv/U0r8WIbh/T4GJNZ28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wrk8/y9d7/dAeN2WCvkYikP33bgnYIvHtCjGmwu05R5cYxoBI+NyYJjZ5q2u70k1WUz6O4p2I0UtPdl8irXMJLIvbCgaK06pqO8d90Wf8Ana4m+TQcArqttBsN1eJBfsiAoJKCPsqjUPFxx5x2AJaAyi7sZphhYRptGVLkGJypY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=llZlLaRi; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vdVkUEwz; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="llZlLaRi";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vdVkUEwz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A2uw8B955660;
	Fri, 10 Apr 2026 03:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ijRg7b3Uk+dcRS2sVG
	iBQnT2U4UBGv6849VXGb4v3Sc=; b=llZlLaRibugaNe14e+CvFQJjck5zpHh6Nx
	ogx+5QO4frfpDxMEAgUE0iDoCOIswfXefy+0paUNmnuJ2Ad1Du4kyod01rdW6lAL
	kkfv2ATpmIX5FRDwJqIWMwD+Ig2Uit/LQ23s8hc9lFUD+ROSbsGb2P1xIM27H0tC
	ZbWwtyxnmK0N2XkMUy5EqlPIisweYPiJK7zhO4nqS0nc2vAgIQmEpJJ7JlnulsSc
	fjynxnqX0kKCMzgnnRx9rZbxT5p4UOC5wF2rar0KfRN6j2YA1byEQUskAgX4VQ5A
	+ia8LgTsItu0mdP6txkrY2FwSu1ueXUdvbZsRkwTa7S1/AE1MNeQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021108.outbound.protection.outlook.com [52.101.62.108])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7mr21-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 03:31:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPM22r7Q9xkmxkD01vGprgi7/RDg18wv9Z9cRLyjwyUdWf9HJQbrrMMwu8wyL9g5rcFszyvAmIxfSV+bDkKgLbWDgA67ma5CmkLkfdvtIhu/h21+rEDREUfU3qRlomNGl7XOCpllW8AAODxOf2rNABnKsAD71JfWOa9rFEFeqAuhibQXiHDusqYP2mrhzGkgBzptOE47Hm2oMxs1DcTIjgaQ6wIjOGpP+4SGgC+F4oxgXhbomqd0BYqSWxsTzqmNuo3Dar9KDTPwG0fYo9CCkIXCsY9/IDFXT4CZbvs/FATNLc+iKkyGq7RMAhfhHAlXu0MaVkplq+rvgw6V3Y91KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijRg7b3Uk+dcRS2sVGiBQnT2U4UBGv6849VXGb4v3Sc=;
 b=dDDBXq/+Ow5jU5X0lp4emTPxKgi3LyiMqhy9vtwBQ2xcxQNwUCqQD+mkEWe+IIdG6DxTzIQ1yShaTjLRgm3KN62pLfpWZjJNjk9G7upZTUY7WvkzI7Br0vIe6hXVS7a3ij5cle8Hqm/7zakNMgnfGJtTeruYGzCpNjqPYdDq6PfKmkVfJ6RjBH/foTiXruDD51SWEPIq6b+q6iH4tkVwB7C03NN81Dx5Q6NJYdi/wGEu+kTKA3dVKMNMmpL7lteT4tSzqt2cZruLUl4QsgRF8bO3KDzMsLo4blRMUrc4CSUdGpKL5fmVteuiZpXWAJNhnvmkvxFam33gyWXchmrHzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijRg7b3Uk+dcRS2sVGiBQnT2U4UBGv6849VXGb4v3Sc=;
 b=vdVkUEwziS+kR1BTYUNKMWqOT/fKAxonnEsL439wIPJeqRmcL+8yAqEhLybJBwe81Bkvd5tEo4idq1qixp3x1hMXWH6Z44MZ09xStOurNmrpoB0BfR6dTkWNvv5nmnMe0CuXmX073DtRNZJjFY0c5lPqbN6MWcln+kY/iOlXbh0=
Received: from PH8PR20CA0015.namprd20.prod.outlook.com (2603:10b6:510:23c::8)
 by PH0PR19MB5576.namprd19.prod.outlook.com (2603:10b6:510:142::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 10 Apr
 2026 08:31:48 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::e2) by PH8PR20CA0015.outlook.office365.com
 (2603:10b6:510:23c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 08:31:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Fri, 10 Apr 2026 08:31:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3966D406542;
	Fri, 10 Apr 2026 08:31:46 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2199782024A;
	Fri, 10 Apr 2026 08:31:46 +0000 (UTC)
Date: Fri, 10 Apr 2026 09:31:44 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 4/4] ASoC: SDCA: Update text of FIXME
Message-ID: <adi1cIvqIcgkBFgi@opensource.cirrus.com>
References: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
 <20260409164328.3999434-5-ckeepax@opensource.cirrus.com>
 <adfc-q2KTRLIP3q1@sirena.co.uk>
 <adfyUENpWw7xHb-J@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adfyUENpWw7xHb-J@sirena.co.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|PH0PR19MB5576:EE_
X-MS-Office365-Filtering-Correlation-Id: 212add13-750e-49fa-dff5-08de96db9b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|22082099003|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	AKIx31edEbAFJnkyS56eObHVAwQoENWuDFa52STdkCW6rMZ8cKkbdef3mGVVKOet4FYSfSyoETjNBybNiKaqWTXQL2iGsDfGIvqYsEi2KQYA8FargmjVlGTdGDO06KaTpulcs//tZxi1GTRL7qN+1N44g5p+wmcLUz5vNsphdEiWaxlpsEKBXOoCNzQUJ/xjgV3CJ9DF95IwfnJzhJk63t6bZkoh2piNr8BSDMipt/GKl/x4bD62fk2mQihp8+Bk8fXcJku+j4JQ5s4S+xYdms9jyx95yc9GqucfrD3dVO6G/tWvjcMjOo+hC2I9ewiJ3uSCa4AzJ1fuTd3a9W9SUFtVDuV5gOt20FxRXnSSv2xeqgtRReZ78zV5qZXj6US/ez3PYTylViALWqpKuZqA4NwGH7DCB73I/XQCXRIHzXS/Mh2FozZxHxWKiOJub7HesE3BfYUc5KKrdwQeIdV4VYTQNJuYCLy4oze01x3XiyA8P579wxckrK9uTANGysVHOf1ZsGqXgvY0TCBUNmO/WaQWuoeGShGKadqCbDqirCLxqpCGi8NenN0RujR473mq3yUZrkaEkMc5Pjst25838vspB9OfKgaFVxQl3+IA1ci1kEK6/u+UO0NazX325NIL1nnD0IafN7uNmKx0QuhFF+OIDi5RUlbsb5hGaT94pKA/gG8olw4QokzGLVvJQbSZMH/Fy40XyIiBmQQIZOg2J4iRhE1evjLl5xH+Wf5usw6JTApbteSoujQAdgrsa0l5NS+HeoIAxvT0+WXpSAUnzQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(22082099003)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3u2a/IaUgbXPDigb5Gg5HrFUyD0sCrInI7qQdvjtnDk4tNqCG0lXSkMxqhs5HNz5Zq/Kgp9XbyomTL+5ggs0ujMSgp0OTtel0dJHLKLn3a162h3k4NNTSRjzIgnQjkTyBno+JrqC0/L8LehbQPfY4T2RPyVzxJffQ9z6AtQ5ky8/Mxm3DKkK+1aFNYp4q1aLrqcZRRrISN0RsHyWhixpjRJv95YX70iFRAFlrzgMoTZ5jM4rfPBdhvcPqp19dHC/AnK63jPSBuqrMzKNqZ4m+37tF6oO7v9JMJPP2I0Gh4p5qWtkLNqkAu70/MzWSG1LVguBS9hfc00D0RBIAi6UUnDF4N6TWZ8ixIZngRhvXLVzxgim1ORl34R61lql5oq+UeA4e6nAaGXVnPVVCrNdkh4S6+FgiY80oMS7rjRdmu8yhx8rjmXYPIMbiOFmLmzZ
X-Exchange-RoutingPolicyChecked:
	H3cM2zQJF2HrcYclONFirnsaVijTiOiTxbxQzIsq4xuUXe+MGCj3WJXf+o9hsP8XD5Yl77NzCB91vw3NmOV22XJE9wdAteftApyXHqo12U0twixFY2APVnjxS7Vc/TNbF17krMHUOKRNvN4tHH0r229R5ix9X0V6K7EMeNATQa21Ss0C6rgJ3gv22FKsF7Z10q0OXbO8/CILNZTdviXAWj5McjjQhtSoQs2WUczME6JpIR+BPKHO/uq+0lc2aNkxKnM8iWUZ9PXRL4JysL5ES1Xhtaz9fsJ/81oU3FMUHCgd4ef3446kRUJMc+EwMSoRJD2cqOFtdg2wRROkp/J0vg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:31:47.4982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 212add13-750e-49fa-dff5-08de96db9b21
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5576
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d8b578 cx=c_pps
 a=6M4rKnXcPrsC4kvHXiJwJA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=F0TSYZUmv4DxsdPCSzQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 5tRyNI90oi9-G3ZxGFLr9DN0nInHDuY8
X-Proofpoint-ORIG-GUID: 5tRyNI90oi9-G3ZxGFLr9DN0nInHDuY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA3OCBTYWx0ZWRfXzSNmDCn/FcXE
 9T14xWi7q0AQLtcuPK/JnLLJMfH00wXeOJO+/Dd3vrBxyae9mAfMPX/N3lGsJ13z3cYzv8Ltj9n
 pk72HvxAPfYWL3Yjk5dC+5N3N/WVfcIF4qRAyXAL+imUYaz78oUfcXMycwkD5Ifih91c8e9BSl6
 561ynpmYDLFezZXC9MlrA4NjQ0vNypPZj70Wd6WFXUStRpeI6MJevtR45k7hvPcdCPmhTGN49Dz
 EbcvU+q3XaILxpNqXSbKALHGBGMjcRMtyajsJsRAJ3i9zPLQxy7wVO1GWQzABrV8fs/8HEz+Wjb
 0Ge7/rvn5Jj0L9j8tPQdxs6WP9rpt5OyrihigUsaxV62LwXUrk2LJpGVZXW3djjvIAwksTkdy3U
 LoC1A+SbmCqE7JUuI/BBMmtWCEr3kGqCCVkc7sGK5IU2HwsQKs1v9/DDazyC3bZmiVAZMnJXQKq
 fAF7uy8DjTFo378/zNQ==
X-Proofpoint-Spam-Reason: safe

On Thu, Apr 09, 2026 at 07:39:12PM +0100, Mark Brown wrote:
> On Thu, Apr 09, 2026 at 06:08:10PM +0100, Mark Brown wrote:
> > On Thu, Apr 09, 2026 at 05:43:28PM +0100, Charles Keepax wrote:
> > > A couple of attempts to correct this FIXME have been sent upstream but
> > > the situation is not quite a simple as the FIXME implies. Update the
> > > FIXME to include a better description of the situation.
> > 
> > Please don't try to mix versions in the middle of a series, that is just
> > going to confuse both people and tooling.  The versioning applies to the
> > series as a whole.
> 
> Yeah, I actually can't convince things to interpret this as part of the
> series but the threading means the actual series gets in the way of
> handling the patch by itself.

Sorry I didn't actually mean to do that. I will resend the extra
patch.

Thanks,
Charles
