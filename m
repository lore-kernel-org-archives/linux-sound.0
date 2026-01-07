Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9844C2D6409
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767780194; cv=fail; b=c7xfcU8c8IMz8EEoAfUoo1uKPPNZSsaERzyFb3ao9vGXetRWTvkZQ0aMpqenvQsbn4FljEzLqvW06bYw2TxCgZokVyeByRaTD2B8P0V1uI8OfoOuboKyt1EmsWs0OXftG7Pp0nyAOUYcoL05fh4PulzkBcEcTha5I7evjS8+tnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767780194; c=relaxed/simple;
	bh=GgyVTritfuVdj2Nzuw3c1SDlFncOvsOdPjJAzvj8os0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1hK5lNtXtNjmbNqJfHgcdXNMYvBytL9xC+kdJHPB3hKNKaBgqqmR8AXArpDccwsq6P4hSec0wyt9MIK5Lv5kcy32UdmFksrajtj2vkJKJvYWFoi/vaLzlGnhuoQ7pupfSASWVTiUT5mG7UII5zndzQoT07g4ALpB1m9XTGqUiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ez270H/D; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ArJCh7Uz; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ez270H/D";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ArJCh7Uz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076S3cI3534260;
	Wed, 7 Jan 2026 04:02:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=c0zBR0YGKx8cnYQ97j
	NflumYa1FncJcPoc0vC8X4EBg=; b=ez270H/D9cADg7ZDZdCmsCDJHuQmP4LcnW
	2csGs58CgX1N3215A8Gh2q2wxImtno4YtZGKK0QZhePQPCIvSuckqEJ+4aGxk9Yr
	IBENsiqn8TwxzPh8xmAzeM0NOgrHyqQ+iERHt4VUfPWMMBuUe+166nFEKR0hCUIq
	Q00QUPU976M2Ft+ogSgDEph9v6BP0dVu3xKAQ8qZhMT9RPCBcOCvwKm9VY6nbw5s
	+x2P4HtDl9CC8lqgXmIdLlbS0CvCme/obgYiumSmUMB2dU9WjYbQvicvpXjZScCe
	MIySISNTlhBcePWKU5ZYsaGGCzuGh+gmDCzW375ZkyRR3wDheBfA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023139.outbound.protection.outlook.com [40.93.201.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bf1d343d0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 04:02:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNd16axFViXKiNwyBUflLK2jLDM0hV0kJxe+PAuDEcVM8PbuSW3EhlSjw9Vud4FGY1WehDDnmylu3YuupU9b2q03YSz6XKmx+ok6KDb9oZrtJk/0T3VrcAOYUPS/w6CDr52/MzRAEigRZblxXcnIpjghaOTnlAqQeQzgRcLYHAqYpOVg5ORuGY8LjwBlAmTAqH4pUAXs+TxP/X/EucAFcBSELu0foNNMwcdPhDDewkUhOA9+s20HXtm8c8k7CP6Ey7kkD2v8Y1hBEsneVl2jOy6cts4wLKrzr4VKY1NoaEx0KdOoyBdsLf1Usk3fjWgz00rAKhbJzRz3oTlIukwSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0zBR0YGKx8cnYQ97jNflumYa1FncJcPoc0vC8X4EBg=;
 b=kYw1f+kC2kdjTOCMZg+pdao8Qp5whYj2remNwlfF6N05fZ91k6VJgmiU+baeIue0xbmhRYVB72BleVWK6zAWGcDGvbKIEzBgGrTifxFMWdZl1ScEBU3exMXZ8ZjeX3pb+u89vqCTrecJBL97OFlZVvddlIKnKNrdPQ8RnivgOKmoSQz3Gtvq9CVlqrWZ5JJzogkFP1UBAvYFWMOb+MBE5uJrlAb3jyMWdPAnyXmtAX2+L8Ag+Z29vJXGnAA6wqk3gEfCMctBlk7xcG+7Y95lyTFRn+IVYDGcRh+EDD48Lnq1jnnsOr/EU1rR0fH74aOkZ/t0WmILLUxjxCjmpkYsWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0zBR0YGKx8cnYQ97jNflumYa1FncJcPoc0vC8X4EBg=;
 b=ArJCh7UzPbY8B+pPbp7kimK2Naas9JUn/mbDKgVEcwTxgx5LUFUPRKDYN/x/SlmDCoN8iCMGeZNA9yu+K8p6JZTjcsVAzyceZ9aFIPFLfNwmKCw7EdULfmY1bqs9YHi/VkHD/HXNAnnlC/mTqaGvZdIHK/YFJ9D314Vow39sGT0=
Received: from SA9PR13CA0011.namprd13.prod.outlook.com (2603:10b6:806:21::16)
 by IA1PR19MB6299.namprd19.prod.outlook.com (2603:10b6:208:3e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 10:02:45 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:21:cafe::a9) by SA9PR13CA0011.outlook.office365.com
 (2603:10b6:806:21::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Wed, 7
 Jan 2026 10:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Wed, 7 Jan 2026 10:02:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 374EF40654A;
	Wed,  7 Jan 2026 10:02:43 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1D408820247;
	Wed,  7 Jan 2026 10:02:43 +0000 (UTC)
Date: Wed, 7 Jan 2026 10:02:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 1/4] ASoC: SDCA: Add SDCA IRQ enable/disable helpers
Message-ID: <aV4vQWMUJvnc0I5w@opensource.cirrus.com>
References: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
 <20251218113520.1287693-2-ckeepax@opensource.cirrus.com>
 <b09dc2bc-43dd-48c5-b0f8-ed75bbf50a1b@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b09dc2bc-43dd-48c5-b0f8-ed75bbf50a1b@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|IA1PR19MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb58bc4-cded-4a55-3eae-08de4dd3e772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5pJMKASKlJZuqKeOW6UlmD47733O8rvlMr+esf9JOeisjUqRIbHd+lKn+/mM?=
 =?us-ascii?Q?0mJTzS0Hnp7VFE0C6DeNMIJjPCqIL0gfQCphYaRIpFQ0Ho+UCLxwVJjyo0cg?=
 =?us-ascii?Q?ZoUeVrkJxaXWjgFzvPHHlcquTCZv/OrKH3DtGzSinDqOXK3twZC1uhJkahHp?=
 =?us-ascii?Q?NLec0KRyZjQ6vmxCXKoEJkp64xNMgPE5sMSDPVB9o87W5FvzEm8pOX0rVmZI?=
 =?us-ascii?Q?1KttAqqozPGvkxJ5rzrJ/0DTHTpCOLOGhGc1LGFq20xl/BRKnD1NZRjA29pj?=
 =?us-ascii?Q?ptVAVxxBL0naqgPe/dub/62x9nVSBUFkYPveCypK0/yO4GrW0/dE3ldrY0qQ?=
 =?us-ascii?Q?M97L95tsvlOA9dtfA0u0doXkf/mTlU53QI9R7D4dIrm4/KrNCOBxCIifzK0d?=
 =?us-ascii?Q?sCpX0OsNPLgInW2tcT6RONJTpodKhQdb9gGAhirhMWDR6vWIq9qHZ2S8A/kw?=
 =?us-ascii?Q?4Ni0gFtPTa9zI0Q2yBNEX7b89oGwdjzxkS72N4T7u3X5RKoW/3eUNQbsMg+N?=
 =?us-ascii?Q?XLjtX4OkdQ16BgAVbDRegy2sqbNWo1wxWYg7HK+xPdxsfxCIfp/t138/KWzh?=
 =?us-ascii?Q?LMBaOJKBmvmAWVM15g77M8hDUyr7fy2d5EES0LOPzvJkN670QAKmdT34hx+Z?=
 =?us-ascii?Q?N24RLmEv4ExrlhPHSFZD6ibaKCSjVry93J45e2xwcCRmCU/iBHPs2ijjK9nh?=
 =?us-ascii?Q?FIUodLmTp1KuqCSDYYCOnLqo2egNFoEkA3CKw372yTgZPLXA4RFW3Xb4Pc91?=
 =?us-ascii?Q?b6dfrp4Ypnbs6Yd2P/loSD2q/FfMa1E37c93Ux8mzti2y6QMPgY9X1u5Esf7?=
 =?us-ascii?Q?fHpapvrkQn6/vtZL77Agc7yI/YCW765lwEztk/Za/7id5dFj3vQ//MCZms+d?=
 =?us-ascii?Q?DNUcgsWdILJKKnGogPAjRKl+T3kOC6wb8tbNWET972CdYKQFb61jOqiRpLsh?=
 =?us-ascii?Q?cF8/MH/k4bgHMV11yjf8ijBRdbtUd5hOv6km/uLE5eYDgI7+5IKsaxDh6KCE?=
 =?us-ascii?Q?TmxBH4E758b8nJ6BRM5XDy7NU1mbCVKGZQDp6bnWLqfnbKKJ8GXrDDeoyUam?=
 =?us-ascii?Q?U71qv2BhWBkCbwclahnB4Us4uVUDEUf0lchqrRBsWTaNr3HxjYUyl7Ia/oj6?=
 =?us-ascii?Q?YNkSTHr4dK2ERAguiWGqpyKC+agclGgd5UX+UKsdX0cKGa73fDAIGDAWOiLE?=
 =?us-ascii?Q?rJkUZSXYQoXoWaX1F10rKUQQas1h8BAvGuTGAX4CScv+v9AffOlty8irM9JJ?=
 =?us-ascii?Q?fMNQU9whdUurASF0e6mfU6f2qOkvE1XuV16azCD5N8jC51Rg+nhMV66KeUKd?=
 =?us-ascii?Q?FgwDQ2w486pHKnoPl4mqJCNecU3SJjzrqyRjbP4yUrS8e8khBhXcRLv4q6vW?=
 =?us-ascii?Q?iuSHlc/pThgsvzXixvTUuT7x8L4mX8camDuXLp3EgSwqgiyr8Pd0aUmukqil?=
 =?us-ascii?Q?+PfBVoloAbixU7ZlgOc8xOvMTcJvDuOFlDNnO2e8TZWaGwRMV1ME1MyrkWBZ?=
 =?us-ascii?Q?geIlHbgCSiP/DHNBJnONcmzvpaWbTlQ9ZrOt0xRRHLl0+4w2zPdO5DdAmGcg?=
 =?us-ascii?Q?5ZS+qo3ZGx9XC69jbsA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:02:44.6872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb58bc4-cded-4a55-3eae-08de4dd3e772
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6299
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=695e2f4c cx=c_pps
 a=nTChkIIWaLHlKa6Ix9xfsg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7G9YTCZFXC_mNS1zC78A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: jKl00EqW6mqDZW1kyKltObc5Ux7j8t85
X-Proofpoint-ORIG-GUID: jKl00EqW6mqDZW1kyKltObc5Ux7j8t85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4MSBTYWx0ZWRfX7/rxsmnIdB4o
 PrZOATN+l38sXkZaVc0pGPOweafp8PwxyEOaGhhbjP356/ExTOEmrj4JvjXW7pEvWtMpSXOn4l9
 cbzjff7BtTfDXSQmOpZVw3iPo63UaBak82Rt4KfYyqhm136qd+4oXbd9XarpXIb/jSUV8yrYuXi
 3HS3uidrT9ORiVD2cGUrICqNO4llCZKauEPbC9Mms1ZWTIwECQDtYSu6XHg/ZpWnz8nOTLDJfnr
 PaP78a2aP0EWNr2niIvgYMJOYNJkYCFQC6N+8ji0ea9YZxww3Ku55LNdPBcpdG070DGReN5yWvI
 mVcsRITtUtEQ3t1LRPnUnAGenkmYy87pzlVUwhatNlcq41ywMYyg2ExvQufSQ17qZMP+lAeJ7ip
 pdVQyMQgZm4Cv4yg0xHAMStZGbZ7frfJPYiJ2uojWpMZJ+3T2qrSiyczE/3CFJ2+oAB5sfByN8M
 UXPxqENyMlH1tBgNuYA==
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 06, 2026 at 06:17:10PM +0100, Pierre-Louis Bossart wrote:
> only a couple of nit-picks below:
> 
> > +/**
> > + * sdca_irq_enable_early - Re-enable early SDCA IRQs for a given function
> > + * @function: Pointer to the SDCA Function.
> > + * @info: Pointer to the SDCA interrupt info for this device.
> > + */
> > +void sdca_irq_enable_early(struct sdca_function_data *function,
> > +			   struct sdca_interrupt_info *info)
> > +{
> > +	irq_enable_flags(function, info, true);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(sdca_irq_enable_early, "SND_SOC_SDCA");
> > +
> > +/**
> > + * sdca_irq_enable_early - Re-enable SDCA IRQs for a given function
> 
> copy-paste from above making this kernel-doc description incorrect.

Thanks, good spot will get that fixed up.

> > + * @function: Pointer to the SDCA Function.
> > + * @info: Pointer to the SDCA interrupt info for this device.
> > + */
> > +void sdca_irq_enable(struct sdca_function_data *function,
> > +		     struct sdca_interrupt_info *info)
> > +{
> > +	irq_enable_flags(function, info, false);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(sdca_irq_enable, "SND_SOC_SDCA");
> > +
> > +/**
> > + * sdca_irq_disable - Disable SDCA IRQs for a given function
> > + * @function: Pointer to the SDCA Function.
> > + * @info: Pointer to the SDCA interrupt info for this device.
> > + */
> > +void sdca_irq_disable(struct sdca_function_data *function,
> > +		      struct sdca_interrupt_info *info)
> 
> maybe explain why we have an _early version for enable but not a _late for disable?
> 

Yeah I can add some text to that affect.

Thanks,
Charles
