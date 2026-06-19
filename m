Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1384F3B4E98;
	Fri, 19 Jun 2026 15:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884491; cv=fail; b=M6VgOnBa6m3ecGL9DhwB4T7kfFfiJEZmS+fgVzfEKtxw+OTTSYOwkFHHH2dHlTFuau7qKXirbvn2BC4fNc4yhXDFG4nKSRdna/C/7R0w0sHEK5WDmZzZ61UiDP4qFRT6fuGhobq8Zo6gfpCs87/cWjFqHhIcYK7IG0m+HuQuAz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884491; c=relaxed/simple;
	bh=d+d+cOeY442mKFQsArBZU9ke5WInM52RZviuUE1h1uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEYrEN6AvV7HhPfLq/S9h1LIb8VRkCi5R5PILaFFJ5SStILMyQ5RF8H+ZF8Gew/dwOVNVGA7momSRCLkn9xD8PXmlx3lHuExy8aCv8oIdfE421AjB8lVRK0BjQtaRVUM3d/oSoZhrzSSQCX9MTHePPHyxo/x3Au1YSF0KrQLpb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=J7lzP6QS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Z3nzoHQM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="J7lzP6QS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Z3nzoHQM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JFiGp9939830;
	Fri, 19 Jun 2026 10:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=NoehtHp8jWq22K4mpn
	mBA9qt+IyYRHPlZyU4j/o+VG0=; b=J7lzP6QS5RhTnxFr9AAq4mLr1xJ6l4rraD
	GwrmXQYElxkb+GsNxkdI/2xCJP0ODj5ZiJatlLSyn+GFs4BxDbFaaG/l5cjTGycy
	INZy0xX2TIZ6PUtwwHV2wo2kSky2kYocWrZMk41hH8pkVIkOhPoPgtA7xT3TuDJ5
	MxwY5AuL1rDLPUZX81hsNDV+CCb/XN9Aiu/quRmesXpfSd4W6E2c/spC0IL7ai+Y
	2/UyXOBPI7GJOdk/iTOIE4aogBNg5tJkzoEp8e3mbPgjQlZukqgxChRldxR8E/0T
	WZgKzSnG2+kVap58QMZWFxZ3XsD2XL9AmzZgE8mgGc2ewQKeqcDg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022075.outbound.protection.outlook.com [40.107.200.75])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4euee3cdba-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 10:54:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaMEZQnGzVXIdPh98TBM3X8IyhT4dQIkO+qMPD0KRAxrw7fAdfaM1Jd9qGDclRI3wWfWqN3FTwIF+qb5YOgm8r3EaHWg1Qmh/11nReUGcrmlQuzPzza/A5nm0pFq9ZHmpUwXUIpABOmTNLSXC6GtN4L6oSkQfL6jqX6j/QoEaohHzCW0phqT/cUDTB439CpHFpAljygU8LjIBIbp0PNT2ec41qmAZlZP6eZhENO6lBivOG6v0a16zNdcu0wQqXOEdpUIsmsqU4alSl4q1zAcXvPBi/Btz359xCJt2OOjgE6AJfswE3lZb5ZNwzimBYmja3ahqFS1p6pI5GmgwKZLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoehtHp8jWq22K4mpnmBA9qt+IyYRHPlZyU4j/o+VG0=;
 b=Xm0qMlA1nsUWXbvFViy/m3taIPZukgnHpyjxJ3gFyNZ1fIcwe2in4pBZ5L2hTTaV+YI25kzIf695Wo01NYkuRVSrDY3A9JU5JIdq5DfFx8HgCiWl2VgxyUUOFb4vgvmRposw3vxSa14cLd3I22YrvaKTMsR2vVx9s7fSCcdWF4ae57vl+PeRrWyB3yXAOlznJYDIzAJzUqg99e7WrT3MO0beJc3z1KPhTKdWZ5M1IVVwuFvISMuQo1kJT2Nmg34izCBXmroMc5Jd8uCw1EZJo2OzvGjqQEATIlChw/si8a46IoceVXYV8CguhbHKPnqTM9R46oaIbeR47oWTQ4/VDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=broadcom.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoehtHp8jWq22K4mpnmBA9qt+IyYRHPlZyU4j/o+VG0=;
 b=Z3nzoHQMRaacJWelfLweHAS/K068v8DmdaCgvPZNvRuSPdqUjKOBFtYYz5ArE0gVDvQI9CkTPPjVtQwmwIAP83QDypfS4wkoKtfXhijqq7zy/GMNlOqrct6sLA/R95hAzswyzF086Gu9ccuTM65OtgHgI6ctRF71ObyzTRFNbMk=
Received: from SA9PR13CA0054.namprd13.prod.outlook.com (2603:10b6:806:22::29)
 by BL1PPF5DD7888E4.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ea9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 15:54:19 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:22:cafe::43) by SA9PR13CA0054.outlook.office365.com
 (2603:10b6:806:22::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8 via Frontend Transport; Fri, 19
 Jun 2026 15:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Fri, 19 Jun 2026 15:54:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C668B406544;
	Fri, 19 Jun 2026 15:54:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ADB6F82025A;
	Fri, 19 Jun 2026 15:54:16 +0000 (UTC)
Date: Fri, 19 Jun 2026 16:54:15 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, broonie@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Maxime Ripard <mripard@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v2] ASoC: soc-core: Create device_link to ensure correct
 suspend order
Message-ID: <ajVmJ2N/sDKxVZx+@opensource.cirrus.com>
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
 <CGME20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57@eucas1p2.samsung.com>
 <4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
 <b9e3f7cd-2329-43b0-89ca-0243e4916c16@opensource.cirrus.com>
 <c29c5ef0-cb10-428f-8ccd-8a84195dd504@samsung.com>
 <6af1deff-8d1b-472a-8ef3-04f47321689e@opensource.cirrus.com>
 <4d8b5ea3-299c-4a03-86be-696ce51afd9c@samsung.com>
 <7d97a6b2-9ff8-44bb-977f-c87deb5a3e88@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d97a6b2-9ff8-44bb-977f-c87deb5a3e88@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|BL1PPF5DD7888E4:EE_
X-MS-Office365-Filtering-Correlation-Id: b418c4c6-5dfe-431e-d0e5-08dece1b0593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|61400799027|82310400026|56012099006|11063799006|22082099003|16102099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	Kft7zeiQIdheUadQCUqRzLlqaoU26cin4fstz/4H+h5MOVT2tkCw5/LlrlE/eZRetKcu7IArRxiwfS3hO6ARVpLpUAUA5wdRmh/R9NJl1VX/m5bB5SV+74wKGDCKrAUfXHL1RX0bK+xGN7KPGNEV0XPDEIC7buHjXTt4DYVdyhKuGYnws/iXR0LYBZvJ2L16jGKZH2YxSvcQMhf/aP+aUhCiBb2OXJGK0FVcZF0LEK0CIkON8ygClsvyR1lql3142qFrRc/18Iw6Nv6vDR/j+37VXtGrI8pWqhIFzY5s8w7lMNCMeilnwpc0ThNG0FnP9d/+vKAe07YmNxIE3CyjsvREEMm1HQ4KRF+6uMENvr5o3UIu+46Ww9PtWlTb5FOH21G1RzL5z1KkC7Njp82fiEy1/XUidL6D3/N2+rG5oaJZhMBYznr05Fas6Ww/+Ur5TNfvDjeIxlZ7eYvTIb8sFlzZFxAY7I8JkClatjoqgyktY6eIRQhT31dl/aT3Oz8kgQ5FUS3XX8zZlhVPAHjwJhCJSVvP6Ya7s16qCs4sHZnCPlnTKD7HdzEjOlZW9X0iZk4omiskZwoPd3+VTpOu/95bBWl/7G+krVvqRzYrJUrOHklsaUlJ4Ms137IXK1hNz7txpOPiOBlQHoHyJGVYx8UWXYU+TuD1t8plV62PrMCi+GChiIDTlieaNcG9+slvhC3HLuQXDPBdbBtVVkPoRg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(61400799027)(82310400026)(56012099006)(11063799006)(22082099003)(16102099003)(18002099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dYKaACPQazrtOqkg9hdRmmFnls5+SKS64P2sMphNkdI0TH2n/6KWRfhn9UGI6CFK6LwyF5DSRR4Zd+tUIo82tWCKfNVHa8TDoWDUYw+S1qzHfMuDTuwEJSBxViH+ythpt4QKVL/gAENyef3pwThvusGPHlGp0GCq1gBY2sodrDHY0ZGG8MFe86zP9iz4usa26PH3E5NdymhVaQsoz7PXWxslQHNDXvWqF/jI7ealloEZx8dyC4BOPveAAhr+nbuluGMbrHq/md2IxGk66veoWU7dvkeSKIjhhg0Sk3F8lpHBIv6WfScqciHP8Nj6290ezCK+gm+7ShP//sN+z6fAYC+v4SSYS0uDaGVcwzcoH96SsLA62RSBdQZaaEXQHKUwVj5/TqGYRmItxukseYdP40SQxtRnQ8ZZJrT9q2arVwNtyDqd2bz11yROKUfye8W6
X-Exchange-RoutingPolicyChecked:
	BQqC4BkwrbifxWFf+jPj3OPWlVMrpnbwnXfF4kKfh9qECVc2lAW69YcsD4/SAdT29q5VDEoNoroKzWCDXbz/hpmhDQQo+GUOh2XeVip1B+ApA/ACgmMxO4tyNyNghQcqp6QaigeNyW9p7N52PpX/scaPLJqHLE6FaQvrvthqJ252RSz/6tAzy7wAct6z1Kr82zc75dSPtpO50nLquyRupJNOMb/YtFQsFoBL5EGmqt8vLmmX0VgPKs5ccl2xrOuufjCqCnXcEYzkAHd410QqjVDbppG0qDXusfl+eS1smWz753xq56f/ugoO280/wHqAVVBbOzPagRo4LKSP8I0Qdg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:54:18.3405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b418c4c6-5dfe-431e-d0e5-08dece1b0593
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF5DD7888E4
X-Proofpoint-ORIG-GUID: EtqHf2lMYkTTPKtsAFxhrnBOKU9y3uj8
X-Authority-Analysis: v=2.4 cv=UuxT8ewB c=1 sm=1 tr=0 ts=6a35662e cx=c_pps
 a=5czeKszRpWsvzRcawb/TzA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=Eurk5xXqOIN39_yJsSQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE1MSBTYWx0ZWRfXwvE3bHRCuV5u
 qXygE1jQor2mXXXVTP9PQOOS/mKjFB6WlnSJwRy1eQv2/1uOUjqeznRStbrhZfIYKJe03DodOqQ
 7wLxdENQpjOh7d3znEUkt6d77dFOldI=
X-Proofpoint-GUID: EtqHf2lMYkTTPKtsAFxhrnBOKU9y3uj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE1MSBTYWx0ZWRfXye8W7HT7Y6JU
 Iln4wvNN3t3rCjDt1IdD8SBi6a2yA0h1/PSzOrshioGlMFwIzGM4YEcrMYkZLfJ5vaIHh7wxSFS
 KdM1qGiGi1VFuRkx1lTRfbGNGHG26OKz3Ui8PAxNjMVt7NgvSVGpTXvaTKyV/SYJzMyfoC388Z1
 1MhbsCZrAyhEabVsfm/ay+9e4JOhgWdvbFcZQc5YGn22T+rR9o5OlZDvgxnwuYJ/IzqHlvinx8F
 zznrvVJYJimbbGycifNVxUDlLModlozZAYcCYDjS8wD/0LPTBfmpo2y+h44BfYfAD6ihir7nept
 fAsDjZE/ENXRdwg5eXgBcEF1Y5N8tBZ0z+TE4sbIp0lN4GlLQVll78k+jQRHYZmjTjYbQU25nSO
 w1Y8DM7l51jFA5qblBAB9TEu5q6jpsLlMAW+mm7SK6qd+b6Cq3Iqk68esjn1z522t+27Xdk3XHt
 4plMAc9M2OpNWaGdzWA==
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 19, 2026 at 02:33:36PM +0100, Richard Fitzgerald wrote:
> On 18/6/26 14:22, Marek Szyprowski wrote:
> > On 18.06.2026 15:12, Richard Fitzgerald wrote:
> > > On 18/6/26 13:58, Marek Szyprowski wrote:
> > > > On 18.06.2026 13:22, Richard Fitzgerald wrote:
> > > > > On 17/6/26 15:10, Marek Szyprowski wrote:
> > > > > > On 11.06.2026 13:08, Richard Fitzgerald wrote:
> > > Is the machine driver the parent of the codec driver?
> > 
> > Yes, so this change fixes the issue:
> 
> Right. I thought I'd tested that. But I haven't got any hardware that
> uses that "for real", so obviously I messed up my testing there.
> 
> It makes this whole device_link stuff less useful if you can't use it to
> reorder a parent-child suspend order for when the parent-child
> relationship isn't relevant to the order they should suspend.

Yeah it is pretty confusing situation if the machine driver
is the parent of the codec. What is the correct order for
things to suspend in that case? I feel like probably the parent
child relation takes precedent, but generally not making codecs
children of the machine driver seems prudent.

> If we skip entries that we can't re-order, is that simply adding
> confusing complications and _mostly_ ASoC forces the correct order, but
> in some cases it cannot and then it is up to those affected drivers to
> figure it out themselves? Can we always guarantee that those drivers
> will know which they are, or can it all break subtly because a driver
> doesn't know that in some systems it becomes related to some other
> driver?

I dunno still feels like this change is an improvement to me. The
core DAPM powers down the path, it needs the codecs available to
do that. You fix some subtle issues just not all of them.

> Mark - should we revert this because of too many corner cases in the
> device_link code and go back to every codec driver with a system_suspend
> installing its own device_link to ensure correct suspend order compared
> to the machine driver?

If you go back to this you still have a situation where ASoC
mostly does the right order it just took you more code to get
there. Also I think you would need to install the link from the
machine driver, since the codec driver could be used in
situations where it is or isn't a child of the machine driver, as
you noted earlier.

Personally I would vote for just skipping the case where the
machine driver is a parent of the card.

Thanks,
Charles
