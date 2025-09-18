Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB4D27B4E4
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758193086; cv=fail; b=D2LJq199NLqvtYD3xdpIivZ7Tj48/W2yw1aY59yc1SdnvItGCjUdC8P105uWnq0Mo4Dl82vQNWm+AqrcfPlPPuKS0lTgTO1blxXCUX03+mVLszIo4YiSJ5tvMbNrNZ4EdiqLF+XN2lC19R21ujwINlxnofAMu1L4hnyvOJJt47k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758193086; c=relaxed/simple;
	bh=wtDUEqbZVZDf18zP7uSYTNsveQuyQnTVH4soNpiiTaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auy9T/kpSZfLnlr5tRbyPYxoW0PjyU7aIIb2wdIXkI2NR/6KBniUgkMxe55NjNUJBMMCwFeCqIF8+qAE6/XbHWTicFYxGVUYc3QaQTYKdy4uZZ3R+JEoTOGjd0HcbUSGg2U4YC1xlFmN3HNSDE7eVoHK7qwSX0jFGva4FYwk8oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nGE8T8Ps; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VaHGypSe; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nGE8T8Ps";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VaHGypSe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58HJLVAD2718634;
	Thu, 18 Sep 2025 05:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=rG5qTqp6eNYRa+tCOw
	GtVheHSrJQFrc/lCN2thOvsTA=; b=nGE8T8Ps0UmabYYnA7V4RbyD4eAMlklm33
	laj/IQPPYyEvnW/0W6YHZ+wLo1GQiFLUApJy2r+p745sFo6JFKkPmiekD0HHk0Yt
	1ENbmUc4nlneQM74nwzZ37Uqtpvg5Bd6ImIIJyxu5wkqDCH/IfBofMYC2xcRkP3H
	2Fzm0bCUoArHFfytdrNV9tTGJ0JDokrMNgfqDF2Kw/NIBGB9ZhLsJcoBkZspzPvg
	DSmuPzhmAtxBSX0JXWJwyGZ/VlXPzD4EDmAi1ZF3C7jB3l+F8DeHmmwGNzUeIMsZ
	Uk4fLWoO6PfwN1T3EbeiHu/BOJY+SJfTqBkpsbVcfX2YF08zOEbA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2128.outbound.protection.outlook.com [40.107.223.128])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 497fyktffh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 05:57:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHBPazPyDWcf673G/hk37VDuZgpAfA1wKR2AxZWMJ2bQEYv5L0vsaQ2eqhJsxo5gPg9ccQKJm+LOItr3B8EKH4fWG7NTF68Mfci/s1yJuDWQHqssYAObRGD+obmQ/uw61PxI9eXF/fXQMzbOh+29C/D624QdfKp67opPDX3MZQt5XVowyiOob1iXRu42SJmTS5TuJLeKCsUB6DgDQOI6jk6QJ4wk/kRWqbzZX5q+Q9qVrjkQnFBk3B7fnERKUGBJYw4ItBJAdm8RVK4LhC+oYHGf4pbJtPg9GWCPdDsJuM5e3wHebrGw8lGAc1C4bFIabZMijDSNk6YOQsGX5/IAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rG5qTqp6eNYRa+tCOwGtVheHSrJQFrc/lCN2thOvsTA=;
 b=JfvMqNGEcnblPc7hHrM6STv37HLS6SIUj8LbmlLRyfdq4GPwINLk5jTj0VNPrAFMIJFRTrBYOtSCS17+XYw/kQmRAJtp1QFYxNDhAKE1Lrp3NMWn0tCJEVtImc1OjZ/UdpFyRrMDZAwgcp9FdoaR9N1hH0N918eDpLVqVFbXJm4bwxHVun0LxYwWIeMNHFHLVwSGHM+GDBhOdk/tIoP6HscDO2ExhNyraxppc3WcFHuJN3ZR0HwxMBlri/Bap36hdRH8ZBwCuP4FEaFPuTrXYj73gP1CxZaJB0RhhxUkZokeRHthUdLwnDxaccN7fysIQ07k5iAdgXjcZHNxQUFB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rG5qTqp6eNYRa+tCOwGtVheHSrJQFrc/lCN2thOvsTA=;
 b=VaHGypSen7qn922Ac6utvY46wSoHtWmP/dqsTb563gpG0naC994HAeit8Kt4UIIfhL3Uzz9mmUvo9p+oL3XY1HbQoAtxkjj1WHcmHZsqIQYFb5cxhPlVpHIUcIpeuqYNH5OtsA99NUT6ggmONYUWtFWW2lSfQCrlH+UAUpg4uM8=
Received: from SJ0PR13CA0182.namprd13.prod.outlook.com (2603:10b6:a03:2c3::7)
 by CH8PR19MB9141.namprd19.prod.outlook.com (2603:10b6:610:2b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 10:57:50 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::70) by SJ0PR13CA0182.outlook.office365.com
 (2603:10b6:a03:2c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 10:57:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.0
 via Frontend Transport; Thu, 18 Sep 2025 10:57:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ED951406547;
	Thu, 18 Sep 2025 10:57:46 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D4D78820247;
	Thu, 18 Sep 2025 10:57:46 +0000 (UTC)
Date: Thu, 18 Sep 2025 11:57:45 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 16/19] ASoC: SDCA: Add completion for FDL start and
 stop
Message-ID: <aMvlqUXDVL7VatJB@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-17-ckeepax@opensource.cirrus.com>
 <e88ae1e0-7fc4-4915-bf20-564232640c6c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e88ae1e0-7fc4-4915-bf20-564232640c6c@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|CH8PR19MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: 75fd2928-04b3-41b6-1aee-08ddf6a234f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4GWi2bCLMgM7ghkGKPOSL1wvr4XOg/K9KOaOucW1Wo//HJG6GSfqzgDuI/JN?=
 =?us-ascii?Q?2hfE/+jHbC0V9mUcd4TMI7fLkOEucUYUBiK2bVfJvJLoFvFFzp0WxuNZ3xGK?=
 =?us-ascii?Q?srN1qPD3jwx+e6d086FO894Oh5xd5nTaELfSYqns8HFzApzZ9kVRQoaocC7Z?=
 =?us-ascii?Q?Rop5pf3dwmclZzAzKHw6LXZW6+vDYg3d6PTY6CEsZhhZJOgQlHFCLcw8pOzN?=
 =?us-ascii?Q?/HkL7ywGgZU1BJuK/42QPPJH2jpFW9U4Z9q+xX1h4A6pzHxgc3OItMG000XE?=
 =?us-ascii?Q?K86mOczwnNQqxDnM1EVTDvcd/7nlZ0YMxwvxgiqxanADc9V1yjXGWl4pJtD+?=
 =?us-ascii?Q?xmnIvTNrRjmiylPXUoq0mN5J7LFV9LAaGVQAy15cvZfTMf9etP0e5ckLk6Fu?=
 =?us-ascii?Q?/PIdms6DZwXVzqJNubKkwLAgWCcsozRCyLfQPfHmN9J9uAsTAFJYxRAWpZZG?=
 =?us-ascii?Q?nSSTRzSgDk1iAOtJGLjt6gWKD0NwrizpexZBbTgWbxn7S87Yv4j3HpKkWg9t?=
 =?us-ascii?Q?NIGQp4/UF7yvqTuRsbzjCnObp92dX8wsanSw++mEjNOTM2UUhrxeB58Vxzec?=
 =?us-ascii?Q?Ek8SrRZS+TZK261XRnjS6vHto/GFjiIEJxL4cgUSCB6m68PmlclQc/ZNXeKT?=
 =?us-ascii?Q?Qgwv5ooUCn+ueF86tV1kfd/n6MpLk1OTGM8w79Wgc4+7b8oWFOqTyHtpY1j0?=
 =?us-ascii?Q?J7YkQT8WTEITcPYwh2hnOfduoHjOq7/VPBeW468TkjHsjwT4JYnF7K6K9Krn?=
 =?us-ascii?Q?OUiNDmFrFKkhr6iV5TO+sMCgFLD6YdGl4iV9PN81kZwsdo1YBcm3Od1aqeNR?=
 =?us-ascii?Q?4Lj+ec2cVPUtJlDsYRObePhtB6VzVKtaXmi3kVYfrd1clP62tkZxs7QTGQlj?=
 =?us-ascii?Q?rjM9+4Fyozxd09FnK88jWFjE3bwYnqXb+UmsoeJfpiwTMrSy/2hmQ912gCTe?=
 =?us-ascii?Q?pQKZi5iDTLx7Y1rWchvrnlhsnt8vFH8hywb0GIL4ojDchaPph+9Oxx81wElb?=
 =?us-ascii?Q?fw6HR+JCZZNA2VCOnNTQxDXZgVVPfahNCAGA9Wr7ewKbnDeTsdUFfyNoI+cg?=
 =?us-ascii?Q?yXQOTBilf02Ej4klkKJD9ZzIzApJenpfYDUjgeNN4QPBSpwdeupmWw+PrQb+?=
 =?us-ascii?Q?tiC/Azzhaan1QkYs4DrU6P2O14Fme2lVIJHKe5B/3JccM8n0P+jXYd0Lt8yP?=
 =?us-ascii?Q?fBiZlDVHK+vnYV+c6pVArYtcmZ73Vr3e1WKskirkmgJZbM0XVKAnyp+W9nLp?=
 =?us-ascii?Q?BGN9kcY9ctNStY74RioHWZX7n0jbYu3ABZ/WnqJgCr/bpAQ+9OSkiifT7+Mo?=
 =?us-ascii?Q?yRgrvaKs5D8L4ao2xxNqr0HpeW2gt5iYmI24qwim0lm5wIT/AEuFqwizjSn4?=
 =?us-ascii?Q?Qrh1UFToqvRUt81SmzZkVPNytGwTZHzIwSoMlrylb5SdqdCDIj2nZtVpZomU?=
 =?us-ascii?Q?qiERJCLQCQUVLz9kDUYi7vSDTiKOdnBkANTDN4Vl9CpxYHGw6e8by0tsdnra?=
 =?us-ascii?Q?ekqXSY3hTs9+BelWFJKr3X90cFKeK0p+Zj7X?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 10:57:48.6609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fd2928-04b3-41b6-1aee-08ddf6a234f3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB9141
X-Proofpoint-GUID: 9uI-7F8rcpqpjjaVgESgKNMTio-0VRK_
X-Proofpoint-ORIG-GUID: 9uI-7F8rcpqpjjaVgESgKNMTio-0VRK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDEwMSBTYWx0ZWRfXyr3J07/Fu5+I
 21pvchh5H/n1KQNzieVbUas0OyODF97B7eHiRaFu+K0ldgY6rryq5kp5LHUUDv9LU7NUy12jvOI
 iJv+hEw22P//dRo8n7lQZqCy3eZkSlAMXIoWaKJ2O1vh9aiMUuR4v9UkDZnj+M9uPNbj75qXzXt
 oeMCwE9/+CFO6cjk1eE44xxu04HhIAFLGi4OvkgCMWV4Xu+B5Ech4U/vri207lhz5mrG1HkOhzR
 q/AWn5itOuAetdJ6Qiz2jQr9Y81L0r81dalR0fJg8jpAzwS5X2aDJM8BRHi4qwnMGasK6fw4CSL
 mWxsyuOwpMUmyLSZ3gQPckdrS/nXvTqb/Z7IRpiXuZtQiUQYTLTPUnGXnNEh+4=
X-Authority-Analysis: v=2.4 cv=KvRN2XWN c=1 sm=1 tr=0 ts=68cbe5b1 cx=c_pps
 a=TrUki+83yUijjlW2nz+WEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=FQvmDCtKv7JEz-W3DeYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 17, 2025 at 10:13:27PM +0200, Pierre-Louis Bossart wrote:
> On 9/12/25 12:35, Charles Keepax wrote:
> > Add some completions and a helper function to allow other parts of the
> > system to wait for FDL to complete. The sdca_fdl_sync() function will
> > wait until it completes a full time out without a new FDL request
> > happening, this ensures that even parts requiring multiple rounds of FDL
> > should be fully downloaded before the driver boot continues.
> 
> I couldn't figure out what the last sentence means. In
> theory we have a status that can be checked to know if all
> the firmware sets have been processed by the device. so why
> do we need a 'timeout without a new FDL request'. The status
> tells you exactly when the FDL iterations are over.

This is the other timeout I was asking about after you so
usefully pointed out the DisCo property I was missing for the
UMPs.

Presuming you are referring to the FDL status. That will keep
track of the progress of a single FDL set. But I can't see
anything that prevents a device requesting a second set (and in
fact our device does). So after the first FDL has been complete
one has to wait to see if the device initiates any further FDL.

All the spec says in step 9, 13.1, v1.1 is "Wait until there are
no new requests for File Download". But if I am missing some
additional status field that indicates the device is happy and
ready to rock that would be awesome?

> >  /**
> >   * struct fdl_state - FDL state structure to keep data between interrupts
> > + * @begin: Completion indicating the start of an FDL download cycle.
> > + * @done: Completion indicating the end of an FDL download cycle.
> >   * @set: Pointer to the FDL set currently being downloaded.
> >   * @file_index: Index of the current file being processed.
> >   */
> >  struct fdl_state {
> > +	struct completion begin;
> > +	struct completion done;
> > +
> 
> maybe explain why you need to track the 'begin' phase? This
> isn't a concept I can map to the FDL state machine.

These are not so much concepts from the state machine as just the
naive interpretation of their names. Begin means an FDL has
begun, and done means that FDL has completed. We track the begin
because as far as I can see the only signal the device is fully
ready is that it doesn't initiate an FDL for a while.

> IIRC the device tells you if it needs firmware or not. It
> could very well be that it kept all the context and doesn't
> need to be re-initialized always. Adding a timeout in all
> cases doesn't seem quite right - or it should be something done
> for specific hardware that always needs to be re-initialized
> with firmware.

I think what I am missing here is what is the mechanism for that
telling you it no longer needs firmware? As far as I can see the
only mechanism is an IRQ on the FDL UMP buffer, so we wait for
that.

> > +int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
> > +		  struct sdca_interrupt_info *info)
> > +{
> > +	static const int max_fdls = 10;
> 
> I think you can have 8 sets with 3 bits for the status. where does the 10 come from?

This is just an arbitrary number of retries before we give up.
Basically for the UMP timeout case you wanted added, we now reset
the function, so hopefully it will succeed on the next go.

Sorry what do you mean by 8 sets with 3 bits for the status? I
am a little concerned I am missing something here. As far as
I can see Set_Index is a 1 byte control, so 256 possible set
numbers, and the FDL status is also 1 byte, so 8 bits for
the status.

> > +	int nfdl;
> > +	int i, j;
> > +
> > +	for (i = 0; i < max_fdls; i++) {
> > +		nfdl = 0;
> > +
> > +		for (j = 0; j < SDCA_MAX_INTERRUPTS; j++) {
> > +			struct sdca_interrupt *interrupt = &info->irqs[j];
> 
> I don't fully understand why you have the interrupt in the
> inner loop. For a given XU, one might think that there's a single
> interrupt for the XU UMP used for FDL, and that each set is sent
> with the same mechanism?

There probably is a single interrupt, but you need to find it
first. This is called from the function boot, so it doesn't
automatically have access to what that XU is, it is faster to
search the IRQs than to search all the entities, as there is a
lot less of them typically.

Also I don't think it is a spec requirement that there is only a
single XU FDLing, so the code supports more.

> > +			struct fdl_state *fdl_state;
> > +			unsigned long time;
> > +
> > +			if (interrupt->function != function ||
> > +			    !interrupt->entity || !interrupt->control ||
> > +			    interrupt->entity->type != SDCA_ENTITY_TYPE_XU ||
> > +			    interrupt->control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
> > +				continue;
> > +
> > +			fdl_state = interrupt->priv;
> > +			nfdl++;
> > +
> > +			/*
> > +			 * Looking for timeout without any new FDL requests
> > +			 * to imply the device has completed initial
> > +			 * firmware setup. Alas the specification doesn't
> > +			 * have any mechanism to detect this.
> > +			 */
> > +			time = wait_for_completion_timeout(&fdl_state->begin,
> > +							   begin_timeout);
> > +			if (!time) {
> > +				dev_dbg(dev, "no new FDL starts\n");
> > +				nfdl--;
> > +				continue;
> > +			}
> > +
> > +			time = wait_for_completion_timeout(&fdl_state->done,
> > +							   done_timeout);
> > +			if (!time) {
> > +				dev_err(dev, "timed out waiting for FDL to complete\n");
> > +				return -ETIMEDOUT;
> > +			}
> > +		}
> > +
> > +		if (!nfdl)
> > +			return 0;
> > +	}
> 
> Why don't you use the mask provided in the NEEDS_SET message?

Perhaps I am misunderstanding here, but NEEDS_SET contains no
data, it just tells you to read the FDL_Set_Index control. Which
then gives you a single set index to download. The device may
then go on to request a second set?

> > +
> > +	dev_err(dev, "too many FDL quests\n");
> 
> requests?

lol oops, as accidentally hilarious as this is I will fix.

Thanks,
Charles
