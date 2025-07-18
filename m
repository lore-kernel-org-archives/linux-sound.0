Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF76E1E98E3
	for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831715; cv=fail; b=HaJU0o7cJ5d7wVU8pxR12oO9VOck8ATPRHMNMv8aa/wIijAhUfg+w8pf1UtqQ1ZgOhesro6oFom8Sx+2uw2xKhuSjPIcwUAC8hxx0g/zBuRzHhyYq0yRV6jMQGYkxoy6JkqkBQPt2r8AeI1+eehEjV/4gTXXI5vbXgm2rMtp49I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831715; c=relaxed/simple;
	bh=hVFRljjYVggTdbj5P2OrZEI5Bke/4g3cQLUxc8d6cqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4fr1XMekSoK2txz65a9ZfXfy+no9yxfYHCIcwFEBIFsSsFwSpnnMZyxScupPJSGxhWmKRPgV7y3IZxT3EfU/KQLAjwV2oeB6os7X5AfIj0C351VdJKZLfWW0YG5ScEUjCzmkVoeGiInW1CLUph0ILpyqCiM3WgzOoE4aLxOBX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YszLURPU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Soxg/Dzy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YszLURPU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Soxg/Dzy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I5MgnE030603;
	Fri, 18 Jul 2025 04:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=fa7uGmT6eWYAmCS8kS
	DEjXAW5Mw3G7w4vCXMTxIhtAA=; b=YszLURPUmjG5V5eJHfO6CHmvoQUnXJ25lO
	FutxXWp22oujQ2G28tPJMJckhR2oMpJYFT3mDxsqi36pAzoem8vsGR/eSuPNp3LI
	2GZX8BX8hg01EOf8vrW8kRqaPvnjD8/PxmFE72WbtZwqYUONpne85CGhg+4k1H85
	nLaLluyM3It4IWSJuqMwL0ePqG6MNcdasOADaC6SA3Bh24cglxp1ZM9iZe7NytkL
	q78FMxOPXcaSW1rR1Dnv4USPv7Sl+etODZPe9c3JhPMifT/eHXU+3eJvEKx2GQXL
	LU2aFV9ffJeuW3gIxsmS3AxoNNo0S/pTcw11xCQK9f6Xcyv/n3eg==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2090.outbound.protection.outlook.com [40.107.102.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47xqstt5ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 04:41:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M16/pTT8/HqVRXch20GTvwILhL9ClhA8bDEjghF3WcUIyhMEAIVPVDVdLD7NSUwzF0oLDaBMW8LpWA+RxKfXcD3qANocQSTXV0F2a8vrHlNNu1mRIkQsH0mvlknywAeImCWHVKxJVN4m2ZcvJ80q+Fh/opuv3xHMV4+OLu3A6YFIZb/c+FnHxtusuaKnoodHZkes5QGZqV0b3wbPGMfOFnSxkuyumkluXPE9JNxv/mFOmeuSkjNkw79N+MmWFnxJ83mkNoA637SsDIgAei/DH7l1goIyDRQ75ZFGSj2jfq/w5nO2gbx+DSgJv5lSYLW+Q1eEZRkNqdcqqWaWIFASIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa7uGmT6eWYAmCS8kSDEjXAW5Mw3G7w4vCXMTxIhtAA=;
 b=Y0zIplHb+dJcXEdSdARoHjqF5hpjco1+nK/XB3FrfmmKnbSENc+bmG/ieAGYjotsvjEosrM6VuZs+uBvoHmagR7lYOr184uU5V8LUa+qpWl739wGNZH4zMWq0V9c8/P7XlXw4C1Qpc6sZwogygHuwSeAGn6B9XqnOS1kzorb8QljUX+IWf47TOYqcL1rrnPXE73hiLUegRbqXF/PMtGgpbpmNj00uaQuVI2Zib/EGMItGcJxcsgoCcw87H7VbZWwjXqDQlLB6l4wJ5fvNVsDPP2JuDv92nSn+vHvWW/jQKHtPn3HYLBRaHDiwJPHOcWPwnDzUTZZgdUYkny0QdYeVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=suse.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa7uGmT6eWYAmCS8kSDEjXAW5Mw3G7w4vCXMTxIhtAA=;
 b=Soxg/DzyynwlvlFnRAJva4k72EaqEgcsmzHrKOCdF7nN7yMuFFoOTeFSu4utOa215Yg3prlWsH01eWv11xyrM5Gvfpjbk+27Fi6zNWCArkDtjAmq7a/sLwvnXr2DxgP4GU3y2ee0z/Wk7aGkO0fRv+0yY4/I5o4MrYMCNHV2utk=
Received: from BYAPR01CA0001.prod.exchangelabs.com (2603:10b6:a02:80::14) by
 CH0PR19MB7979.namprd19.prod.outlook.com (2603:10b6:610:194::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.16; Fri, 18 Jul
 2025 09:41:44 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a02:80:cafe::f8) by BYAPR01CA0001.outlook.office365.com
 (2603:10b6:a02:80::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 09:41:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.1
 via Frontend Transport; Fri, 18 Jul 2025 09:41:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ACF96406541;
	Fri, 18 Jul 2025 09:41:40 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9353A820249;
	Fri, 18 Jul 2025 09:41:40 +0000 (UTC)
Date: Fri, 18 Jul 2025 10:41:39 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 057/103] ALSA: cs5530: Use safer strscpy() instead of
 strcpy()
Message-ID: <aHoW0zIjtPYO27ak@opensource.cirrus.com>
References: <20250710100727.22653-1-tiwai@suse.de>
 <20250710100727.22653-58-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710100727.22653-58-tiwai@suse.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|CH0PR19MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: e721cbe2-40f8-4bb7-0b95-08ddc5df4db4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yzdWsGT9wRyyMeQJwZRedyLWznY2POxUhRbq2xZax5ZKMwzQ9pd9fCXiFL//?=
 =?us-ascii?Q?zSUobbjGkyaRoggHFEpf/1f39d+buys2WTJK8j2sAx0sFV1o+qn5MjYDDkx3?=
 =?us-ascii?Q?OOxZpquTtGsOUGegZH3msgE3kuxIVVQk2LY8nsHow3ldpg/PhhQzftgWKBhj?=
 =?us-ascii?Q?PYPtr4311bHi6/eri8GgiOv0INmtSH6lT441CZ8EtyMHR8xBl8U2qFugbu/0?=
 =?us-ascii?Q?PyBRWszm7v+/pCUqMeqWVvDyoaSnLYm05SikOXRUEw2RrRxLvLpwG2hys1qj?=
 =?us-ascii?Q?ho58RqJgOGpyL603VytuA3njZxGx+glSnTV869tEZi07ihKA57pP44PRLsOh?=
 =?us-ascii?Q?wsqYDOrM9Z+61b+RvOMVBqKYje2jhDjhz3CzmJJyKkLl98Cfj1qORbIQSfGC?=
 =?us-ascii?Q?/Pv7UNx53c5NLX5E8LtCRd0H0TO7vqYWDKOSNZzDq9HR38F5BbLAvlWo04Sc?=
 =?us-ascii?Q?vbYpIDM/mejns+Qpa1Lc/nu8XzVCvozqsBxZMoxczHHVjYFPImqQ0KaoHDqb?=
 =?us-ascii?Q?WJZma8kvoWgNp+vehrbeCrKEFcWy1UWhZ+mfvaC8pD70RERUQrOarA8Nn+i4?=
 =?us-ascii?Q?nIeeRIC6pYN1YBFl/cm7KxAl3tVR6mP1z4Kug0DHqmVW1r/8e6/p/zNd+tPF?=
 =?us-ascii?Q?7omJesSrjyNCkGggieTbdXCVQ8CX+7PxESuTCGQHsnvz/5hJDzj2jJdZ/r/X?=
 =?us-ascii?Q?+LGjJvrFL0UxEpOXPaOlyikjirFz970XXHsQ8I1OI1pTCUjOaRQH02npZ3c5?=
 =?us-ascii?Q?yQMDvUnLYjlgfcQ1ACHLwTDDf63Pdwk5G98ZCCbwM6Zy/2BU7iloNwlyX1MD?=
 =?us-ascii?Q?+qs6V20RfqMqa8CWvYbjONZVVhf2VKbBklST2KmGSEkAqy01JPWqEoqSCAx7?=
 =?us-ascii?Q?qPNA9uJfvJZidatAG6E+r3XUvzTLKSDxC0dVOOF6MRCKiqTYIbztBqlscoS8?=
 =?us-ascii?Q?9HIxEpyYIXI4rofbFYtr7ob3Bj089BRSe2edRheT4pWS1ViMpU6RK5mMjGAP?=
 =?us-ascii?Q?dZkhk+vfWJzCyggoPeb+r9MGCeBjcrj7nY7UuPqVVuUz344gZrj06cbhj4yX?=
 =?us-ascii?Q?EqKf4CAgi15ch/xO/J4Ml5AbO6Wkz3SwTxzRbkdiKel2VWgvn8tADJW87u8g?=
 =?us-ascii?Q?Y8iWPVynmkSKVTPrgGSV6mcCbMuv/MGCsg1xuA6CrFgMK2wv5MD9hhCRScQW?=
 =?us-ascii?Q?n9bhCOSQJazIAD6RyCvnDFWQ3k2ap5flSFAcvVrytlpjLpomDUFYoMUVz6Bm?=
 =?us-ascii?Q?uBNbwbDuwtCvtXI6lBl+a6MfwiieQpfV+huJSbdO0Jmujm0TUcshOZcNVxX2?=
 =?us-ascii?Q?mLVf9eNMqwMuMboSAA3zbmHqZoLATK9YGdORu+5kgpIjh1fBEz1NgY6oe8lC?=
 =?us-ascii?Q?bNk8ORn9Aqin23QSN3jgbGMEaSVIRg8foWIsl9hxPM+xJgliKmnuNUCp2Zeu?=
 =?us-ascii?Q?/ChfBKbmYrTnarYaytUfoh61KW8MZLV/HcChTs2f0Qk3pVLX5155FE0w2NVU?=
 =?us-ascii?Q?Hfb2Fg8Wrpfeq+mRs9Qw88oepJ4JF5vEuxyW?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:41:42.5248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e721cbe2-40f8-4bb7-0b95-08ddc5df4db4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR19MB7979
X-Proofpoint-GUID: 6gv5W3b42tOzztRUY2kaXhdce5inPlAt
X-Proofpoint-ORIG-GUID: 6gv5W3b42tOzztRUY2kaXhdce5inPlAt
X-Authority-Analysis: v=2.4 cv=C5vpyRP+ c=1 sm=1 tr=0 ts=687a16de cx=c_pps a=OkheQ7YMNxSF7aQwypjV+w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=xpKaoQlV9wSQHpw91qYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAxNCBTYWx0ZWRfX3J+zrYsi7wXB BvOb3O41NEjlg8dlmbIOIgO+D5MbHU3jJZKm26OFeltiuzyQJYgkyFsJlMv4yn9HIzHHGTynneL oyCemUZJ9GWPWZBSDk4vsFpSjuRHiadBkrvP42I1dkXzEqmndr6TRG/wIpTVAt6j8Q14IBDEsgO
 1zliLfyF54FyToMWTYIL5i3KJlO/x2hPmoswti5Ait5hvxwqTlyrRBGmkP5BSsgmcvsAOZsGyel WO0m6DixAPooFcwZ1QZIJtuvzqHGiGWeWxZZLlCHeNPSroK2MME17xEfLESJFS4FeLegG39syMz lx288P5UYae3ThnrUuXzfmh4BgseADb+sJcUCABibzzKEzns7YvLnMh0P9/EviYwszJiznbpO1l 0Odln8yZ
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 10, 2025 at 12:06:39PM +0200, Takashi Iwai wrote:
> Use a safer function strscpy() instead of strcpy() for copying to
> arrays.
> 
> Only idiomatic code replacement, and no functional changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
