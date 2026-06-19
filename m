Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225051C3BFC;
	Fri, 19 Jun 2026 16:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781885254; cv=fail; b=aGoUegytpK1CmC06opIQCf5FCZkgaCyWgqeHFEw24W1rtPGy0hlNLdNShtjk1YD27QElM5Yh7BD8nNMU5gEFVba6ndr+OaDc03WAMeiO9mES99xktjqWK0F09XtWxI4KgajZINOqxs8WKpnqaBI/onKqAYyHk+hAC/lnw+fyHNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781885254; c=relaxed/simple;
	bh=1OYoy+DKWoBTQXgznhKgCZui9Y5jJthoko6nmk4ypZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDXP3g4CJwQbPUIowo+4EXBmkT+3u+7Yl4KMCGFlpa7u/RsDbjjc4FWfiOC9dItw/gNgn06/ive9xMF/rubIATZSn/a4BX94VhRKlcLMBO/QUGva4pvidDnGfrnaXQ99VNrzpTNmtNhe3p60TDJIt/BZu5fy+oPWM6+6TEo7LF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XSTVJagy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yS5kR9tb; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XSTVJagy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yS5kR9tb"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JFkMrt3644319;
	Fri, 19 Jun 2026 11:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=cZpEWWcTIvtUT9rwtQ
	j688XTqfv6CeYsiPJGzU8YZRM=; b=XSTVJagy5n9Rmf3eJFs91vW5GJEji2AAFI
	okF6By3HPaI9+cH/4Ql7HPYImSfVoG/jIpeW2jnY1AkbOqDN7/LC5HvBY0hZ83W0
	AFwKIAh14ac+2PlvKYzWfkxkszlcNoHqk1db6QoBX1pooi5aNwFTCGQKTPgqEwqL
	s3SXepIcGobjBxyUnLiEaWFAdbjYEH1sBGOtTxECS+MTwag3kEXykIt335MsCAyL
	kk6gn/0Znjy5yDViaw6vFF2jbp0wB0wIaQdBZW8RtmPhx24Qby+gg3AoisX4Mrdf
	eb24P8NfYQEWpJjCQLlyPqdhM0sxiQ1SEWen+dBfQyuMoQTaKQAQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021140.outbound.protection.outlook.com [52.101.62.140])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4eueefvprr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 11:07:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEmIFcDnJxaJvlfhWZg7SpotpcDfnyp+4BB5Jm7u2yxK+cJUmUxBdWJHgPZI7VnFAbKyZBD52CDB8E3GI2nb5JxRS0EgvQ0sAdnuofd60Qxs0wc3LnY/UE/CWXLOLlfOhSOZlVx5xx9fipjwMiCEK9Uo09bgxyGB3c12udr3kTMHIuI+IKwABxlv6qStCXriO/qg1dqdSLx9pkJRot3lR9jvhSvBveLNHePXMZTKTMyJv4AlBKEMv2ERBM8DYNCL8THU4vRePbHFTZ5VZLDxCe0/RXu39ImX9BR6M72KcinIfFEBeOp9OcZG0ju1eJ8C9pyVedYOG9gLn6dXxmn0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZpEWWcTIvtUT9rwtQj688XTqfv6CeYsiPJGzU8YZRM=;
 b=FngSuKY4SO0FpVHECdYIcaSRoGOHbnZYT/xos0OOlxWjlrk4BkqkVhNf0sKtH2fAdl5KODxFa1pxg7iNS3ftc848vdBQqqaZz8shrENRyVSvMYIa7InxemWdirER24OiMOR6QuMsZErTyHKYSGMwH/Me18ZbGq81rtEFi31hjxxIxJZOvKVsM9MU7oPo4GcBfw91NZgWafoQQTCWsjTThduPto5mDHemRbcpBagDqGzFGoecd/LuJOvFJ158bcfG0bT+qhkBd5aPFQh/sd+k+a90iCo5n+YtWw+BLdnkAoI6o9Tic9c8gZUEPHfluFAHIqhovCewXVzEtLP+nWyrEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZpEWWcTIvtUT9rwtQj688XTqfv6CeYsiPJGzU8YZRM=;
 b=yS5kR9tb0Zxu2i5vcfvUMUbnL81BfoCi1uPn9Y3e7vzSWbvmLl2EeFML94cQUp9PprYf1bAazzlE81w7pJqahAK9ilYmbDluukHBIqLjn2XBQdwcDvQyM/Op9CAXPUF0NNXwSaGvQehaqfBHjUT6oGVyYd8wprzttS9f/EhI2OA=
Received: from CY5P221CA0109.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:1f::21)
 by LV2PR19MB6104.namprd19.prod.outlook.com (2603:10b6:408:171::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 16:07:17 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:1f:cafe::5a) by CY5P221CA0109.outlook.office365.com
 (2603:10b6:930:1f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Fri,
 19 Jun 2026 16:07:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Fri, 19 Jun 2026 16:07:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B0C3B406544;
	Fri, 19 Jun 2026 16:07:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9820682025A;
	Fri, 19 Jun 2026 16:07:14 +0000 (UTC)
Date: Fri, 19 Jun 2026 17:07:13 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org, lgirdwood@gmail.com,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v3 00/10] Expand SoundWire enumeration helper coverage
Message-ID: <ajVpMYzqnSc0x/YB@opensource.cirrus.com>
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
 <7466d545-85e0-4dab-aa3d-79c8e3a9cbda@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7466d545-85e0-4dab-aa3d-79c8e3a9cbda@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|LV2PR19MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: acf17b80-7319-4e5f-7ac0-08dece1cd52c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|7416014|23010399003|36860700016|376014|3023799007|16102099003|22082099003|18002099003|56012099006|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	srUgnB4LOLHePRRGyVqGUxn1hzj889r6sy9Gx09fY3NxwEJuistb1I5t9D58hoR2Z/mt8eeLbcR93RuAwAg2zkgPNyOWqghBWt3gb95crgP3r76XFg9zEyEw23HfGcyEflo1rYfg8VidZ3Ymkh63PUiKVGMynQld+tN3snkzgEO4Gr7+rNRbGrgKdoPrjfGUxSr/mSe+LLhp29EQWlEkD3qMgSCITYK60zBoPZgfq1tjXkPC0du0x6LcqX3vWDVyKY0OcKFESdzmPopyDIJnkR2PDiEMkH/YiZ8sXyZaMAqj3CymtlMlfIdxTSxAd4Y9fsHOrGH7Wcw8i4jeI2khlQOvWcWSTPD9LmAgmzqczMSmXDtF46B2jraIhGNvtKWub3g6wSDlyDuJ3mg+ZXCN+r0Fflvd7ZWUxFeMmmRMVZmPgRB2IUPwTxrV1R5LMBELIriND3jlJvZ/+3pcjUoe9txchFQYsjBovcBknA+IwttP5agD0lA7ZKvVSwtkUNqylqu3FFy3Yb8kx8jo25QSDxsKgA/fbS9C56u3QuYldDuDSAAer9btTIC8sh+Egon9if21XSgXPyCLpnvgwqBIlZ33DkXjzh/nMOSsRcvBLYFn2uYKfpmZl0SRyUIHjiF5dakB5H+g46G5yKNCFwRizC3djvVdQc2tXPbUb8XuohGZ5DC/7vzdit86YKvDNWszvTMVEN/l2hKJwi6S9swH+Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(7416014)(23010399003)(36860700016)(376014)(3023799007)(16102099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ziDT0beouLwm9OqTYNY9uhA6zI0dQQe+hSuTXn+tbB5c+MFMbSWJEs3SBAR6JmH+yi/LeLTrMZqpS+dXmNuY28iaklf4pZeCE8+hYez+uFpkIVzZXTgEoI0I5Khuuux72BXBJ7ELU9F351Dbd0ntRBErDy0HPKAv6Q44grfqOXUL7IM66hz1wfVTpXU/0/QvkfP+MJyaYjat5YfE6YazlpzIsPe1i3E5lBNzU9R61CTsVLASLGMDHGvjdvJSywLOg9gc9xlqs3UgQpkNdphx3SeY2C/CvfFruHdwArE8xi1HyOf3JQEAIqRBT0TJtHcyiuIfLMIU3VP5SbJ1v9j0VHQGubgWZqxbMRNA+MRwxSTpCJvtt/mPjPeNAlIm/uHySFE8PsocfSW8N1Ks73CAGNdda7i77hSXdkgbFq2Dkh+uwDGXEs30RblUvt5Cr4Pi
X-Exchange-RoutingPolicyChecked:
	RSGMb44lrn62FaaRLn5RHq6aGAz9QUsjdjE5dJVQ3cc+pk1WntIZCiPEocZas8Yg6VmUYlUzWqlNx8e+/rfEGDXokTSF2j68J7UuSw+bNCZ/fe0wKFl0eZvnwCjkZFEcr+y8ToDqA8ccTLH/MYBlAJnBcMEp570mLEFNc1IFaVmVlJ6gRZWH+lm0yTYVA0oW5Aw4iF+vjWh9Cj7dcRCvT9oWgmXfh3MMCDbWa1rprnrbK5w8WwmtGPqWPa7j1pqb7YNd6gg95p4OFPYHGL4VViam/rYNYmLPyW79E7Y4ZNoza/EQ/5r0l8cJTnJz0MuWSWLW+AGhHNL1hkNiNRmq4w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 16:07:16.1129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acf17b80-7319-4e5f-7ac0-08dece1cd52c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6104
X-Proofpoint-GUID: 4wdpNylKlUDhsyMMrrmGAjSQFSEpT9-V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE1MiBTYWx0ZWRfX18ed4kJOtdN7
 owT0AQP/zn3rkOgZhHUC54kouGpAeGZ7IgcEbddjADxw10RjVx8V50Hk4CqaHBThYgoaDRiY8Zh
 25Jc0YuBjRkX30AYnXWtU0WHaBzBUtkiNJR0qlXuAethcLNr7PG9EYBkr1b+vJ2/Z8K7GkZvk5j
 FWOBaIQ7A/uJyTGRnt/yEajpczKd+34K+spbOzAFj08DX1RuhdrKWGvbGc+uPciokPa4ePzSann
 86czirwbk+/m1KHvkJ1ohY4Y98/D4NXatmjQENJdMeXL9zK/M9Nc9XEZZlz2biANxf7vuffZkRs
 lhaVlJGhTlgGM5BeBpMV4W9vXWdlOsQmpX0sNS5xkgG23VFLEA1TsHUYUluDP3wVTtmW5l4bLx/
 YCHuf6w/r2KLEi+MPGwyQzeEqUQs/E6SSO3mK5QISzYgMVqPpVYD2emi+MfO99EAkNSjsXQ5vmc
 dOBkmsepTU254+E9blQ==
X-Proofpoint-ORIG-GUID: 4wdpNylKlUDhsyMMrrmGAjSQFSEpT9-V
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a35693b cx=c_pps
 a=3OKKl51w8sN2have8IVhxQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=HLZD6yUAqX_67UJ5UX8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE1MiBTYWx0ZWRfX88ihPiLvYPio
 IKlN/OdHExiVRhdJd24aFQZ3ZRDQf+9Y9BfuvFuQ/d5yjId/qwoedsuhshGpBZh/cvsNwB6jy5i
 TKLReGrjBSt68eDbNotxO9XLWuBfCMs=
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 19, 2026 at 03:41:44PM +0200, Pierre-Louis Bossart wrote:
> 
> > The patch series in [1] added a new helper to remove common boiler plate
> > waiting for a device to enumerate on SoundWire, however, many devices
> > also wait for enumeration during probe. This series updates things to be
> > suitable such that we can call the same helper at probe time when the
> > unattach_request is not valid.
> 
> So if we are no longer testing for unattach_request, should this be definition and its use be removed?
> Looks like there were multiple evolutions since the initial patch
> "soundwire: sdw_slave: track unattach_request to handle all init sequences",
> is an additional cleanup needed?

There are still a couple of end drivers that use unattach_request
to attempt to track if the device was reset. I suspect that is
likely better done other ways but its very hard stuff to change
without detailed knowledge of the specific devices.

I think our only part still using this is cs42l42 which I think
someone has the power to test internally, so we could look at
that at some point in the future. But I am not comfortable
changing the realtek or ess parts using this myself.

> > There is one final step outstanding which is to add a core helper
> > that waits for a device to drop off the bus. This is not include
> > in this series and should be the last step of this process.
> 
> Humm, I am not following why the core needs to wait for a device
> to drop off.  If there's a bus reset or device reset, it's almost
> immediate.  It the devices loses sync then the core wouldn't
> wait either since it's not expecting the device to drop-off.

The problem is mostly from the device side. This usually comes up
from a device reset. So the driver does a reset, device drops off
the bus, the device driver doesn't want to carry on until it
knows the device is back on the bus. So naively one calls
sdw_slave_wait_for_init() but there is nothing the ensures the
core saw the bus disconnection before that call so it might
immediately succeed, causing the driver to attempt to access a
missing device.

Yeah the fall of the bus is fast but so are processors, you need
to actually ensure you can't shortcut the wait. Although typing
this it occurs to me it probably doesn't have to be a wait one
can probably just manually reinit the initalization_complete
completion. But hopefully I will get this series ready soon and
we can discuss on there.

Thanks,
Charles
