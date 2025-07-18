Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1341221F04
	for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830949; cv=fail; b=gzUwvHVFQm5G5/pto3U/jBfDqZ1WBWmFqGx+6e2BYW7O5NeRw+XGfjwgrAGfaypFnpQ6MXY43EVFQosv3EUJmOASsQZm8T08OzuEgwQFLdSbswFjnd4/Rm6HnmOkChfVUD/4wUbFpmcbkKTqpnpcbiEOc+Og9MFf+JvIWFBPlTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830949; c=relaxed/simple;
	bh=2PKHZrL1xjLxYuGQkuqMoBPEuN+cmL/iASfNpOfL6mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJOko/ssyOo3taF9YOZzXzFzZNx60VN22YRVrnyE6jlwYY1+hlBKDjUQ1dFOrFDoDOFSzjSr1vSIdfGxPVkqVE5AlftRoZuxYSqJ4EFYjjMAg5DHxmvtAROXS2QJQndJf7MgejJYIzsbeRUUTSJly/oYkbf9evIYyUqffJwUcss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Nk8aVWQu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hlmar4vw; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Nk8aVWQu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hlmar4vw"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8otwi031689;
	Fri, 18 Jul 2025 04:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=lsugHpiiXbaWCJzRGv
	uLljhhV8BQZKNd6CY5iXDW4Nk=; b=Nk8aVWQu9zFtt1IGOW051eOJ5y6uieVnNl
	Uq9z+4CQhWZh4XXkS4xsZy0tdXk/xjZxTFxcbMY7Pp1Z65jLbSbkzzzm15xOUVdY
	GR6KPJaeKQy4GKYR02J+in+tvFJPjCovLHyfHDuHpBUHaoaBbFnyPonOl0W8uiSC
	Jaf0h6APNm4O0cXZA0a1zwU/KgNwDCu6N0efCRgWOyzKpVvLIwc+yAYz0b2uWKqY
	E/Q+5jEgIUg2Ev1zpAc5RNgEbt93sTJNaMotGdRpTX+GwiIgBKbd8Samm4Ell7b0
	jUWAEAQT8xqQ3K2hWDwwkj4nhzL3JVG9SHR2IrbMpZaOAWTXoGjQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2105.outbound.protection.outlook.com [40.107.237.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47x7uuu78j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 04:28:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3Xm19ak8xLNbfaEq9750mkO5cfUnWtkVzytJr4tCGMQnr5nV1u3VoesikWMO98Vytb/BeZMo0gNSPZY+26sn5QLV8EcZEfI4Y8gs6BeqRKyie0TjlKxcScEj5AuZgN74nBFhN6RX5JsRCkgUPJpOWUVIlPsbfpNfrZPet+34j/yHvjy0uj6Yzx+SOB9HjmH3Ihj898/Dg7fAzw3uDOcVj9V0/fd2XAw7rFYgDkvdc53XEC6pNiHC5WgdHrt3Lh5VI9jYV3+6z2s2Qt7Vqu5W0tK0ADqzyyYn3aXdPzXAhwmQsAzPfL35NS6SvINegU6QULQk0/z3WP1xCUryiYpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsugHpiiXbaWCJzRGvuLljhhV8BQZKNd6CY5iXDW4Nk=;
 b=GVFSZq9xNty7t8QM7Bv4JO5fx1RMpo28oljYyg89m4xK+e2Q7d3sxVpjQlghoxJk6u0hSP8MOTSqhlg8MXBCHrjCWrhnxG1MO6FEGrpps1dyURsjk7yR8lA0qf2My1fZjUhpCzXY/6aQoOV66gcSbeJvl38q7/4WjecI3GSTdoQpjVuoIFsfPiB095LImvcwuDEUPBrM5QKcUCv0pcxTMFWdiMTeAJunagXzNzb4AWmgAcFzIeoyi/WRDB1M9yn/8R4XuPIbzy8BJ1JoHFQMxDKq1Bs02QPLEMq3gAFC5DFWZx4cDp54dsNUp03BN6eNGzh7T6FNs92U1FQU0oqZ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=suse.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsugHpiiXbaWCJzRGvuLljhhV8BQZKNd6CY5iXDW4Nk=;
 b=hlmar4vwIZgB9IH0ihpVi7O9zPYODBVd+IyUVmQfZggf+n32qAEIlROo+atXxLigd8OwNSl9fUu09O39BaoqzcdyxYaHBfRvnCglfcX4RdMdm3Auwg4wIHZ2KwIrhEUktngJ/k9LcoOs4y+Wt8PlOh7Gem43T4kLW1D/LXiBEg4=
Received: from SN6PR01CA0009.prod.exchangelabs.com (2603:10b6:805:b6::22) by
 PH0PR19MB7453.namprd19.prod.outlook.com (2603:10b6:510:28f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 18 Jul
 2025 09:28:54 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:805:b6:cafe::67) by SN6PR01CA0009.outlook.office365.com
 (2603:10b6:805:b6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Fri,
 18 Jul 2025 09:29:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Fri, 18 Jul 2025 09:28:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9743D406541;
	Fri, 18 Jul 2025 09:28:51 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 79361820249;
	Fri, 18 Jul 2025 09:28:51 +0000 (UTC)
Date: Fri, 18 Jul 2025 10:28:50 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 027/103] ALSA: cs423x: Use safer strscpy() instead of
 strcpy()
Message-ID: <aHoT0mKnL4IZy+zx@opensource.cirrus.com>
References: <20250710100727.22653-1-tiwai@suse.de>
 <20250710100727.22653-28-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710100727.22653-28-tiwai@suse.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|PH0PR19MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c37754b-8e6c-4348-2857-08ddc5dd8310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KWIG5sVf1o8Mr0PXDxe4x9f00QDf/bYVyMMskrdNa55BMcEV5SO5YWBixq1V?=
 =?us-ascii?Q?5NG7wBrooS6uCrm/lFPQ3rtDrh9Q9OczVQnD5CnITIjI6qfV8x4SKpxhyZ3L?=
 =?us-ascii?Q?eRVRLeT25v3x+6GfZh/7VWwrWRiC7alFM9Nk/tkuh9D/3rQSqz9Ebs4dR9Lw?=
 =?us-ascii?Q?cLFSGOub5j4Rgmde8i12v6A6je8Eje7a9JUb3q2KxOJjjemSC/1ywqqQ0Qx9?=
 =?us-ascii?Q?EL48JsKql8k8Li52YQGCNp6VThQHZwJdNeLrcv2D8/IaTMFiQqvJXicJVHVT?=
 =?us-ascii?Q?Kro4E4in9yaEHQ6SG+JAhBH3P7ZwTm17Ljwp3HOZspDEut4sbI5f2R3aryxm?=
 =?us-ascii?Q?jUdERXH9IGClA9E+aTvRLuQPvMoXjUAnJR93izjAQq/h4NBtI3MDNQM+yjKj?=
 =?us-ascii?Q?mXXnvhipBD3W2HKcu1n+unGGY76cVe6FLtHVW12yodQUR8Kt6P6PhOYrNNrf?=
 =?us-ascii?Q?pqWQDN/4NV7Sbq+V0E56CggvwJMYRN9kwUsR+QUaajkIRKf+kTUQ8FGPhJSk?=
 =?us-ascii?Q?06gKTzzN8cCNKX0mNX/TP1AG54zIvHlckiVWTAAIj3JprhVzFaPcNauTLmsq?=
 =?us-ascii?Q?Ve+Vq8oO95iikBk0vrIn/nNGlOBAmi8DJfRvfokLDM0hCwa4TGphTwGSerDg?=
 =?us-ascii?Q?UFoWu9tqsVyzkqSH1Wcn00gF+leGjZzLsKHhlMdnrA2y5Tn6guy/9TuF7z3m?=
 =?us-ascii?Q?tHnCVJJW5eztIqd8v1LXkVzn1Qmi+Sy9aSFg8m+LC82JmQAWAyeKm4RxtQ5J?=
 =?us-ascii?Q?sb5jOjkh2DpPYLMs1troi1cS8vkAy++KJY9UvBK0hnB4n8UNsFijRWOuPECb?=
 =?us-ascii?Q?cWeBEWTRiB6RB49MgQzTOgy8T4K8j7N4fUwvzBU5rJWYla7q9nWnA2/PjzvO?=
 =?us-ascii?Q?MojeguoT04RAVCc0htu++RJZJE0iZPVrYcstnlsMHYoG3xjgK224w/y7OP/s?=
 =?us-ascii?Q?9zIJSUf2TMuTqh3fUxGr8LwVOaniARu9bWecxe4r+7Epd+QxU5+bYgJFd/OP?=
 =?us-ascii?Q?WUzpFs5f7MBC8i2MNihZX79e9kO+DudsTuc6ZnYMLOpCvEWPtnamukLwTM2u?=
 =?us-ascii?Q?/0Kq+OKqn2//uqtoRungZiRcrTgLZy+D5mHNCrjKCZVftxIe1ovB0iv3xL8D?=
 =?us-ascii?Q?XcN+Ffb3dInvORPf5NWhgoGhoBO/cWOVZ8MElze6VKY6WUGN1PCs/CkecO2T?=
 =?us-ascii?Q?5izS7d5oOn1L69IHs+d6Dlh6Ijb2QH3gCGyh8GQEVtyKJlXVdZq7OmlwW5Ag?=
 =?us-ascii?Q?n6oRciFWsuS/ooqm2egMB1NqitFt6l6onDurIoIXEUw0zBvr1ZA3X8DwNR5m?=
 =?us-ascii?Q?k75sLh4weQGrWROx7LgRuHdwS2H3FtPv9RK9s8mbE1NnCy5AKNJ9WUoGAaQQ?=
 =?us-ascii?Q?cBedWqVSaeqO9ON9ZMqwNfCO0CHRLVuj+TyqmiM27Hg1ZJ4ibBfy2Hmgr139?=
 =?us-ascii?Q?KkgMLSZRd1vvFb02M+W8irk1rQYWIX1KhoRLUqixeHfigLL0cLwvTl5AA4tD?=
 =?us-ascii?Q?M7bIg+Bo+dMaVYJyAfUkMH2x8BGSfkQGjZkt?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:28:53.1047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c37754b-8e6c-4348-2857-08ddc5dd8310
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB7453
X-Proofpoint-ORIG-GUID: dYzFrmyJ-kUXyElkyZIa_q_GUrnVZI2z
X-Proofpoint-GUID: dYzFrmyJ-kUXyElkyZIa_q_GUrnVZI2z
X-Authority-Analysis: v=2.4 cv=IIwCChvG c=1 sm=1 tr=0 ts=687a13da cx=c_pps a=IWBKlLGroRVvC9/lYsYQWQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=xpKaoQlV9wSQHpw91qYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2NyBTYWx0ZWRfX579GlwlwLl8S 00v137muegrGzgnk9asEL6Ig1+xAd6F5FemIjOJ45i9/APJm1y8Btya9lay2nyE/ul7rtdYzJcM +oGVdYftyxJiV6ZtpYQyWS/CIDEaCd8ZZGJjNCnw+84b21SxGhJQ1uIFd2UM1OHpsuJI70DB0sC
 7XOoZb7aTXl6xS+RGGf/WU01XcveAf+ye0OGsMBhLSmVceufqmm9T3MzHQa02lM8+0J4GmIVYbp C6fgBO29DFyj69bCEuM144ZeNmdnjmBaFgmGzIdfQELj/scG9a+kYdY9MHexsgnpVqkhLe+9OWW itANT4hRxfFWapTWc497PQA6KEzboEDPWOmjn4D971Haamo/b07AHfZ1mu5d70OL4rB+CTGtjrj BsriKD1s
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 10, 2025 at 12:06:09PM +0200, Takashi Iwai wrote:
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
