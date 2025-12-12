Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AED44C8F;
	Fri, 12 Dec 2025 16:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765555468; cv=fail; b=cVvhlT9AUwdGvIE7YhgpLbX0Mqm3tADBbTfHFKR0A400Xuwt2h2cOSxJkC1A5ID31sZ2EY/LzoeoysJCxoHmVo9+oNZCtFi8oklQTRgEHtRLqNhr2mqh3NGP6JaEDZRSLk4Ubz3BkS/6pYzOVY9ihHrCm3vmKTGVZkid8qmWMns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765555468; c=relaxed/simple;
	bh=WwJonhp6XfBpn62b+OdosoEWhTtHRfuWdBuJenFE/oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1nLLhuZbe2j30O+IpTxTX4vNa+pM7vmTg9rR3yq7tO+rHto7HAmqrYDiwBR83PZYcWmw/o03VVUVZWPOyIvY1FVbU2472AK7iSs6VCU+aT/CEe4/lXj71DcKs3cQH/N8feMrW4eexbuGM5rmwFZsRfo3BMmenT6hPfeSVnJVRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Vj/Wn5/X; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kERSWU/7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Vj/Wn5/X";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kERSWU/7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC5u7Gu1809007;
	Fri, 12 Dec 2025 10:03:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=cChEFKv5FHqQOMKTwP
	66KjAhaXNkMBS8g9w1yfYgStY=; b=Vj/Wn5/X9G0UdKAwoqGQV9c5Gx9NIQKXbg
	5tbs7BEc9bPk4F3KRpThU77goLaIA07CspaeRJJyZrK007Si3DiZ4yyNiwkj6T1a
	g/9cLlK2clXcWlHyOV3GgAYhC/nSdA/UUaWb06Yd+v94UlOM7vBygAKcjVNKTnRq
	EGF04+kIaR1mmaUmECXUvsfSSig73IQAQ53x0zerU4S5QEaXVee5Zf1uNV7uQGx+
	oqKvQhhNGDNHstHzYR7cOxJUanky4BlM829z/JqyENAjt+hiXdJkTi2HXDAbvebO
	WCK5rf25/eKNNFY5HdhempEliZgAFrasIAzNNY8l7vVskF3FH4HQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022136.outbound.protection.outlook.com [40.107.209.136])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ayp6p21eh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 10:03:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjyF6mfLn/TPZV8FUFcPBnowdqhVCT0gYTCeb/1oBSjAAI09iV0hRcMFUrMOTIb8hNYpDXQ1lzr2TQoiJsdBhK/7bkfHqx7MAte80UNpImkrwffCLyNGgQmCRABCgDEfD6iPq6AWxJOzu643NhRvTliEDiFy2wWXzKDmoQqQrS7dtb5XkcBB+id6i+W4VVGundzWif2J+BWTdjpBqt/rYMFcmrwSMjb/+qReNaNgkyYD5rJWDffoMn6RuoEJmeDAFTYIcLONxsdz1zwsaO4cBwMRDqRwam6RKLv9GxZnJV4rI4LSDxVSSEXpCuoZ2E4GeOJY8eRIZCHEyXpk1vGifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cChEFKv5FHqQOMKTwP66KjAhaXNkMBS8g9w1yfYgStY=;
 b=i0LrNhYHS8Z43r6byvLuJtTPtJOk5IvzEblyDW5OcGAPMhj0DU4mR52lRpd01JzdIyLRug4qYyM0WV+3Q+RzwzqESyZUM8cd8iZbpndUx4ZDg44ThIy8Bown6mp9TOeKAXsGJTyklGJA3qmWxRdJE1aY0Gvd+Ftvxen/SXqQdWccMg7IAdyJ+jlQn55MyUWzsMA1NnZdXhS72wBxeemcKn7RJAsvCs9Bhzka0OhSBVbVAXodynCqR0PqOcvjqzLeO2IFVrzkataqI9BmxSwEHRtgMbyRTmycnLcr9p/76D/tE4uiIDfRmS2rBOv4kIZwmcZt4ObJjsvijkzkm4amTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bradkelley.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cChEFKv5FHqQOMKTwP66KjAhaXNkMBS8g9w1yfYgStY=;
 b=kERSWU/778bdTOMXsCddS7WSwOopenflHymySsuJtaV+IX82S1BzGylRf4YRJ79f7g7OLJQ9drmDw0/r8fg0qLy35igS9atNvWyYnIKzbAHuasO6n1cmFktkUYEw6ZdlDwkF5kEAJuIx8vXfVSjo2ubWvgbEcY+v0TxM5/zJwMQ=
Received: from CH5PR04CA0020.namprd04.prod.outlook.com (2603:10b6:610:1f4::21)
 by DS4PPFA96D1C9B4.namprd19.prod.outlook.com (2603:10b6:f:fc00::a44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 12 Dec
 2025 16:03:51 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:1f4:cafe::e5) by CH5PR04CA0020.outlook.office365.com
 (2603:10b6:610:1f4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.12 via Frontend Transport; Fri,
 12 Dec 2025 16:03:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Fri, 12 Dec 2025 16:03:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AEB51406540;
	Fri, 12 Dec 2025 16:03:49 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8F894820244;
	Fri, 12 Dec 2025 16:03:49 +0000 (UTC)
Date: Fri, 12 Dec 2025 16:03:48 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Brad Kelley <brad@bradkelley.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Brad Kelley <spambake@bradkelley.org>, david.rhodes@cirrus.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Correct a typo which inverted the reset GPIO pin
 sequence.
Message-ID: <aTw85NCvh8/bk9Br@opensource.cirrus.com>
References: <20251211051628.391435-1-spambake@bradkelley.org>
 <aTqRXbdAaV++jdHZ@opensource.cirrus.com>
 <9bcc59d6-027a-4b66-af81-2f69c84c3efd@opensource.cirrus.com>
 <f93147a6-0357-44d8-97ef-9cefd666629a@bradkelley.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f93147a6-0357-44d8-97ef-9cefd666629a@bradkelley.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|DS4PPFA96D1C9B4:EE_
X-MS-Office365-Filtering-Correlation-Id: 169424f0-b6f4-49df-87dd-08de39980a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y2z//jlEI3CL5DUDwNs4yhOpp9bAA3F4zqSxYT7ejoUy3moFqtF3rgBZTVb7?=
 =?us-ascii?Q?ACiDXh+YsOBDqeFjNz/vmYOuGF7utMr+JFxXq6SYUtjK89xYr/HkO0KIr4wl?=
 =?us-ascii?Q?Oegt6VJgEOXD92yVb2k+mK74psFrDuMygvIVH+4GzCTlPlKnODWEp4gINpb7?=
 =?us-ascii?Q?d8s80LjBHQ88XwKcdAD8KEyiaqXrRQWoPbtC3Gt+f4EiCBs8/G9JHFkXnYKS?=
 =?us-ascii?Q?7jEjhTJKWR4L3ySLCuR7HxYJClA5o60o+knCHJ3Kh5mpvE/Yfu2y8cpmRG+o?=
 =?us-ascii?Q?NBDofeNYFWAIL4HgmSrCF95sNcl/KQS0i2Cobjwyay0JuWE7XnB3ZiqgDdJ5?=
 =?us-ascii?Q?CMueujm/tX8sDM/988qLhXX8uC9DCS73w8gELhZ0AspQIkU8XM+Bjj9LUQ+b?=
 =?us-ascii?Q?O/GfVZN01GCqiKKlWPRE2+Wax8lHiQGS9FL1oItCMBJ3z0MDE4PgDcqZ2Vhh?=
 =?us-ascii?Q?5KpEwAwgkM+q3cvKJZZtnCjNiAzaMPny7xps6xrZUo8iJcRuZpdgeEcibajk?=
 =?us-ascii?Q?ccc9VVZBN5kViVdsLrb/rkojbpTM46oQiwOkmY6DFqpfmnz8jAIsUoyFZznD?=
 =?us-ascii?Q?hEXoJaOwLbbCg4jL2gt2CyLIqzy+XtXi1vEhvuvQFRcalcG9onjxqAfWGEeH?=
 =?us-ascii?Q?77JHKiibC4HUR9lAg7qOHOOQ4jZk15n3qcHu3Pi3/sEoB+FRHQPygHCDtk85?=
 =?us-ascii?Q?oudHXUXLmDkvUtDUrZWN6hQqftc20qtVMgnUT46bt9yrK3RZWkDri4ecg2gv?=
 =?us-ascii?Q?s2SlqP8xt7AUuTVMGPKk+KcLVc7+jpY7v+/2+HfxrqzOp8D8VDTDpAcTDr1t?=
 =?us-ascii?Q?S0vC3aEKC+kJgZAEyk1H4r47mBwtH0NCBD0N6aVfqWdp5HcDdvS6MYDLzYTQ?=
 =?us-ascii?Q?bmaBjyWv4D48bsn9SMQHv04QKGf/XzaN+ilA0h+xvdc1l/qW7firveFeeHi1?=
 =?us-ascii?Q?rwGsvqjbQ82VIkfwwiH/CnyPlELeEsSbRJKjLravAZr5kjPIdta7TBRtkeY2?=
 =?us-ascii?Q?N0curPgxFt8rNvu88XWl0cpEYHfhaiomrm5jOMpC1UqMJD48S/GlzglE2PmB?=
 =?us-ascii?Q?MwOR093E/zd5BWYgSRr0xteNZRSwroYs3EdObFEqGTwqMzuFYiGXUfo9pf/o?=
 =?us-ascii?Q?pO3qmpQOulPacQwnBD/OpoLBzeCuMhsulppY8vXKnKFo26c6kHYMpQRQZXuU?=
 =?us-ascii?Q?EABLRB66BpjbEyvV5cpKVdoGhSsxgyboH35nBiD6gFbwl6IHOl7mGl7dM1OW?=
 =?us-ascii?Q?F67jRDOg7tkQFOEa/eHpkXnlJY6EcURgNykqR2H849f3YDlSYddZZ7eNCZtK?=
 =?us-ascii?Q?4gJe2o30+AxlcA4MYw5jwmqlCaAdbf8L0XjM4l+En6KuPRtUIHt7eumQ4f9U?=
 =?us-ascii?Q?NNu9PhSpMWveAT45cAaN5a9Jm1R9NFIQj4I431FiFQNgfkmKjnWVm/5+pywT?=
 =?us-ascii?Q?b6oMKX7BGnxxmGEEbV5SJf1PAAat8PdTk/zmEog+iZ+gozuxZMN1OzBi9Uhi?=
 =?us-ascii?Q?hx3cdw+KtCrB4yC0Nrf4du0cCeLOAVErf0F36NiLhOzcrBIWirc507ilwbx+?=
 =?us-ascii?Q?M6rpM543161tNhVJggc=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:03:50.6789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 169424f0-b6f4-49df-87dd-08de39980a9e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA96D1C9B4
X-Proofpoint-ORIG-GUID: rz44UcGdBorHVpTZNZeeiVx9fVLMo29X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyNyBTYWx0ZWRfX2L/215ShZ8DR
 MZ4VIedPQg/4x6IKmO0fwwgY/vMNCR2VfaFxj/i260npeXbIw6wU3a6LCkU7HITHCmevc+6s4a1
 XQ2/WfIEpiIUaqXCMO2hfF3yk+N/MzTNiyN5HN6ttlOTc5MGcxdDxTCR0jq5810Ew0ldoGD9yGV
 T5PKBhw4hba1d3Ke5czMkuKP2G8b2LQi+SqrXmZrQrDXz18FsJLmOfjj3Jn+A5FDnnnsWt3SuHc
 7JRJtszsCxFZ0L0+KGtnXrr3G7elKwBD+wl5alSiNqA8HD92IzwRaD6XcnFb/ZHoJ/U+270JDf4
 1UQtdsLdmadsOpSZpdwCiFsw80b0LIFL5rygoaW/10u/sQXw4jATrmU+DZD+WqIPVwOX11em8RL
 o1xYV2WXUtv7qXkiTCYtKESpVEy2rg==
X-Proofpoint-GUID: rz44UcGdBorHVpTZNZeeiVx9fVLMo29X
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=693c3cec cx=c_pps
 a=aZOTJIJ1i17uwAYHC389yQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_aMze6hf1rAcGzMR-BwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Fri, Dec 12, 2025 at 07:44:21AM -0800, Brad Kelley wrote:
> On 12/11/2025 2:19 AM, Richard Fitzgerald wrote:
> > Actually this patch looks incorrect and will break things.
> > The 2nd argument to gpiod_direction_output() is the initial state of
> > the GPIO. The kerneldoc for the function says "The initial value of the
> > output must be specified as the logical value of the GPIO"
> > 
> > So the original code is correct: first we assert it (logical state 1)
> > then below it is deasserted (logical state 0).
> > 
> > The problem is that originally the code set the raw signal level
> > (0 to reset, 1 to not-reset) but now that it uses gpiod you must
> > add the ACTIVE_LOW flag to the gpio definition if its electrical
> > signal level is inverse of its logical level.
> > 
> > See the code in gpiod_direction_output_nonotify() in
> > drivers/gpio/gpiolib.c, which inverts the value if FLAG_ACTIVE_LOW
> > is set.
> 
> Thanks to both of you for the explanations and patience.  That all 
> makes sense and I appreciate the guidance.  

Absolutely no problem, welcome to the kernel community.

> This my first patch. I think I need to send a withdrawal email.

No need for any separate withdrawal.

> The problem for my use seems to be in the superaudioboard overlay 
> which sets the GPIO_ACTIVE_HIGH flag.  A quick compile of the 
> edited dts file fixes the problem.  I changed the line to this:
>   reset-gpio = <&gpio 26 1>; /* Pin 26, active low */
> but maybe there's an updated method.

Suspected that might be the problem, glad we could help you
figuring it out.

> I'll do some more research and testing and submit a new patch to 
> the proper maintainers for that overlay.

Aye that makes sense, if the DT is in the kernel the process
should be pretty similar just as you say finding the right
maintainers.

Thanks,
Charles
