Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B5A321F3B
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757518823; cv=fail; b=UjJ0W+GdYkUkPz1iALWQekdP11tq9vX3CVCEijXkAuBTZvfkG0ayzyKcmTH00tXi/Cy19s5hSZcvBbg6Q5fQoKFxczIAf6d+bnzvd7J/eyjh77CjMImlX2O9tAFEYx1CelGz9jq/GMjDMaNSG6kBlATTt/dx99MLbwkAWh8yJSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757518823; c=relaxed/simple;
	bh=lg1q0AoqM8JDkfZfszTJpjAYpJVc5that4S62S/RqV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQTQzmFNaRPlUI6tmTL6kjFHoEIp4VCLulo4r33mW/ScHIG3SQZbPSNAYHZUSwJv3hJTHzFd3YqDAIFhSA3qF0QX9H8aSzKUn3U3yfHhDt/T/izDonGiBFOzAWuF4AXQfjFaZoWcYepCNwhu9NQ1OfS6F5zVmt9VAoDxbnvjlkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Efy6GCsv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=a/kny/21; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Efy6GCsv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="a/kny/21"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58A9Rtdk3627667;
	Wed, 10 Sep 2025 10:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=cIq9phpBO2FTtK13qy
	nIx56BWPwb1ll2/mNX/AzKD/I=; b=Efy6GCsvIEze7Ug9tD0GnIcP7XC6uargju
	jR0y2Aor30qiRnmzz+lMYeWfnDrHD026wUg7cS8/IiRJ8weTB1tB0DY2KXMj1GW7
	K/AIbF7NMN7K+t3/jVKSNSkHqUoERfOhwUDo7+DIr+Dn1bms30P7mpGMQ+VpYoSQ
	KFclsH4KGwuAEOIprzn05TvIQReyHA25DyxKgEfRc/4bh5YOmL51qJsL+PP6Ug+f
	+fhbQuY2+CCz506aM7f0di4rF+Ph6Sal2aNURiVdYS63WBUUQhFoSLnJ/wHcF7nv
	JEYB9Iucfr9kyjZAAaSmOfFY5AzYx3sL3d/GZuxlA8HYgX2hi9lA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2107.outbound.protection.outlook.com [40.107.220.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6t9tw4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 10:40:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CO5K+jyb/la5e3Ue+RT9u/qYvHGWcvgov7SUnRBint5vMR3ZEPh3l9EHaN4WGs5UNfn4BEyRxZTlW0Ta/ej9gY9HRu7LeBGFJYxtSqGmgKIjEuy+o23JG3AcDsLKEhJMcJpgSQsqHm8tTevdlcFYCSri3ST2FsJ+Lo/e9xQIK0Yy00/dUFDDNyM/Rv2mNRN3bfcwWsch3kK3xx2VsVYmOROwbk9q3HcU8Px/DnNZc3eSk6t4OuqxaBodf0Tyw51NZy1RGplFRxO1mJ2GSEbeQlqS4LGH835kxnjZUU3KYU8E3z+E3kfD4cb88yr9GnqDU7Jfn95a7xyKfwxAcSoxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIq9phpBO2FTtK13qynIx56BWPwb1ll2/mNX/AzKD/I=;
 b=LyXO9h1pZ31mtWoS5eVGUw6Dp7xzXvlladhbgbmhvartoEVhgKDjtJ76cyJlZiEldUBS+UXvU3UU1hYrJ17XJwqZGNc8VMz71XnWRDhqoRdQo9tthsaxeF9oG41ST6OZS1tvah9EwUhgtUv0RVfHMXcVxYXFJJzOdrVrSAwy5eAYzBQriGb0Q7V7m69Ai09IVa+0jiwuLEhjIfHVwyjnj4G3bYEQ2iK2aaOpNhe7czf1lXpVDcKMba4fvoRv94daZ/GeM6DxdJLWJIUzi7Jx7UkPY7Nt7cma7pSAW8KMIFZuRd1heXbBRDVgL+ejd8ZVAAUqggoJ6jioPjzcpvH7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIq9phpBO2FTtK13qynIx56BWPwb1ll2/mNX/AzKD/I=;
 b=a/kny/21BAUvajZ0FGOdP1uXQFf+KfjWQFqipqtOpJa8gh8+vnOcq8DgeMK+U8/SvG7s8nStC55RPTGM0Omap7HvAJOmNvyb+4SO1/hpJpy5ciqkkSEb8Dq/mPNa+kd2F1jFudqaW8WHIX7TiW+bXlleqkVAlUrzFKWsRfIksCk=
Received: from BN9PR03CA0156.namprd03.prod.outlook.com (2603:10b6:408:f4::11)
 by BN0PR19MB5312.namprd19.prod.outlook.com (2603:10b6:408:157::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:40:02 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::e) by BN9PR03CA0156.outlook.office365.com
 (2603:10b6:408:f4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Wed,
 10 Sep 2025 15:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Wed, 10 Sep 2025 15:40:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7A4B5406540;
	Wed, 10 Sep 2025 15:40:00 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5EF2D820247;
	Wed, 10 Sep 2025 15:40:00 +0000 (UTC)
Date: Wed, 10 Sep 2025 16:39:59 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 09/15] ASoC: SDCA: Add UMP buffer helper functions
Message-ID: <aMGbz3l2n0q9Fhkh@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-10-ckeepax@opensource.cirrus.com>
 <e85fa12d-727c-402b-a7c1-493d2224f228@linux.dev>
 <aL7W3iS1YxGfk/AP@opensource.cirrus.com>
 <2a069e04-8f72-48b2-af5c-6b45a0ea8e5e@linux.dev>
 <aMBbavEX2RyzBy1o@opensource.cirrus.com>
 <6ee44392-afef-4c63-a8af-f50931b15551@linux.dev>
 <aMF/H8yejQ51B65X@opensource.cirrus.com>
 <0c440de8-764a-40a4-b040-a343ac3687f2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c440de8-764a-40a4-b040-a343ac3687f2@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|BN0PR19MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a89b744-eac4-4885-09f9-08ddf0804e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZWn+fx5EfRQJA3127p4dQbibWWrIk1GuYnZWq3tijJlQP4zDqzM/+PvOBE90?=
 =?us-ascii?Q?ytvgpXTehfC75P7x0i4AE7cvsvHkJvI4mpaQ+zTwr2JKygQ2wrgw5U6B8mk9?=
 =?us-ascii?Q?KeaNV5RrVXnXFmCMm1bb9EvbSkgTK64W067NNkSeXPbN9zYvgaQ+hS+reIu2?=
 =?us-ascii?Q?htfpFF9gDJn3QLpVTAkT22YVDeCVKHZOhUCDtetSj97sL7eZp5VwkOg17T1p?=
 =?us-ascii?Q?ekwx+PO5WCcGqV1/5Sg4nwDs2nrB63oklt74HhnY6ifFyjsmllvRZgcz5Ovi?=
 =?us-ascii?Q?b7NlICzUaYUcz8i2MQirrcltMrIPVpMWhKBxpW1tTHdwNEUZnrQHs3N9sFFs?=
 =?us-ascii?Q?RGxhBsJ2Ky/RqVGkMfn7XTVvs+6q5RwnE1z5YtoIcRNDV2C2D+70iD+ijLzz?=
 =?us-ascii?Q?junWwP6rZRroBTJD2bjTGRkQoF0zL+iGViQvWHBoblzEfKOIs2zI78L/NhFc?=
 =?us-ascii?Q?SbSQU+scR+Wm56Anpa0QLiXdVgVs8yNAjXlF5NS8n7yiFR9k4wYyrBByFNo0?=
 =?us-ascii?Q?7wbZFLUH3wf/0V9Xk2levlLWYIaVYZQzz+aE4LyeAaCv7oynPtu2Elqgc0w6?=
 =?us-ascii?Q?XfF0BDkLo0JvOjXtMHM7KWiCkID2GR3/WY6mJxnK6mBFMuYugsmRGHfBNYvJ?=
 =?us-ascii?Q?mZ1nzCtoFtAsHkei3Q3aoU19tCwapw2OROhIq8mlDo//wi7hqJ4l9MVe7ElH?=
 =?us-ascii?Q?N9V0ifI8014b4n0vZ66t1dAC8Bu1UXW6QifrKsTFD73h4V7asqijPHsfWyKY?=
 =?us-ascii?Q?aqFwFvhO+YXeM5MrNpd6wh2YpC9UEjopAdZ+gLRt64hXSVWo0Trk6CGQbQnu?=
 =?us-ascii?Q?TbFl5YZu2/YWxGI3A76yPe/qx+AXWyUDqbUGvi2jX2hT23CFJ6wE7fabTKYO?=
 =?us-ascii?Q?rfSyZQi1djZtQE7Uq/32/A6FY2ot3v4ZfAt4Un8ZETx+CWG8Lxp/IUuiAjuZ?=
 =?us-ascii?Q?wF8pRO26dqeJm43JViJCvOikKYsHNzEygWfouyjribnkirS1daoZ8IfCB5eM?=
 =?us-ascii?Q?nByGQTIRl3niSUcTeVUqupNoUOS0fpWvyE/jup6Qelu8W0FGpCUPKZ+Chf7s?=
 =?us-ascii?Q?TZtctK/YNu0iOC5VPQJzhCHdgEnX1LPFFjMLhJIoRhujNyywrJD+rCsIg8JD?=
 =?us-ascii?Q?s6Y5WLwIqDwo7Mk7vvYdv0uh+NyAoHKVJic3+LgKbFwURYP6AbiLSYWIvtAM?=
 =?us-ascii?Q?5Xt0CM3tF1Bwj5Pbg3xEMiXJ2Jf8UJQlaSUfspBzWwcAPmwYKQuWUg7Run8V?=
 =?us-ascii?Q?rst6ooidl0kCtmD+7M8NABvB4Rx3bFz0hT/Dutwf3PZVLW+ZelRvCnUd4isu?=
 =?us-ascii?Q?iaa52kGdLv+OuHbSQ4jjTzRNg0MX/PhEYaXhPVxv0un6yQmxiSjFFirlz4sO?=
 =?us-ascii?Q?EXmy0gvz6h79HGzCC/zFUqrvnc2dKT+A/D7g7EFo5NbYLhnb/uAgr6hCPtb4?=
 =?us-ascii?Q?okB6wt0J9QlDgZ1vli6JqgERsirLjJCETGfMEvf3UUMc3VnBSJlcGicwCNkf?=
 =?us-ascii?Q?MAdXalPMVp/TrYPG5gsgEzeaDCarWFMCpBzh?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:40:01.5327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a89b744-eac4-4885-09f9-08ddf0804e5a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR19MB5312
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE0NSBTYWx0ZWRfX+0t2Esvygn+E
 bzc5hzl/z6igvhW71a+zzzV8AiZXpvrW5Uj4PXa3KA5DhXLfVlSsSyRfxUB88tuqk0+f2e9oCrm
 3mmvqVWZihlXDsv3s3YoDz3n3PoZDOLX13C3K6sVhMC64SpFtU+fvYFkyyN5+gqNitFYc3zYNRa
 BdUKcwdNmtgriv8sI1vmQObWsas09ygGjPKl8weic74IlpaeY1M+Hb71iikBkPm6/Q1jCIwPZLZ
 /9BB2XrAJPe0bD1QDR3/Zff3jin7aKfNhhtxquTRkZEQGMCYLkjljZ09Q7rY/vOG9sF4qn+HrXH
 QdtsSqEwzUEXdc6KKXmEiTxZ5rqbSzSj6yXRMmJfpamIaaXUR+/7aTTzlGBZGA=
X-Proofpoint-GUID: 1o_JzB890qhaxcczbzRESkk2-xOtH46r
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c19bd6 cx=c_pps
 a=QkMd9A5hkDPJHF1mgsh70Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=9oxLDRRzLXogTNPnSUoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 1o_JzB890qhaxcczbzRESkk2-xOtH46r
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 10, 2025 at 04:29:40PM +0200, Pierre-Louis Bossart wrote:
> On 9/10/25 15:37, Charles Keepax wrote:
> > On Wed, Sep 10, 2025 at 02:09:14PM +0200, Pierre-Louis Bossart wrote:
> >> On 9/9/25 18:52, Charles Keepax wrote:
> >>> On Tue, Sep 09, 2025 at 03:14:00PM +0200, Pierre-Louis Bossart wrote:
> >>>> On 9/8/25 15:15, Charles Keepax wrote:
> >>>>> On Mon, Sep 08, 2025 at 02:02:09PM +0200, Pierre-Louis Bossart wrote:
> >>>>>> On 9/5/25 16:31, Charles Keepax wrote:
> > Second question would probably be could we get a little more of a
> > concrete example of what you are looking for. Options I can see
> > would be to add the options of using a blocking type API, maybe
> > something like:
> > 
> > sdca_ump_notify_owner() - this could probably be part of
> >                           sdca_ump_get_owner_host()
> > sdca_ump_wait_for_owner()
> > sdca_ump_send_message_and_wait() - this would like be a wrapper
> >                                    for a write and the first two.
> > 
> > But I am a little hesitant to switch the FDL process over this,
> > has to start firing off work queues etc. and everything gets a
> > little more complex.
> > 
> > Or one could add something like:
> > 
> > sdca_ump_cancel_timeout()
> > sdca_ump_schedule_timeout(callback, timeout)
> > 
> > This probably integrates nicer with the IRQ driven way the FDL
> > is implemented at the moment.
> > 
> > Would something like one of those be what you are looking for? Or
> > are you really looking for a much higher level API with some sort
> > of message queue? Although if going in that way I get very very
> > nervous about all the SDCA weirdness.
> 
> Oh I wasn't thinking at all of a message queue with a
> higher-level API, more something along the lines of the SOF/cAVS
> IPC based on doorbells.

I am not super familiar with the inner workings of SOF but at
first glance it does look like exactly the thing I was hoping to
avoid :-)

> You probably want an async mechanism where the set_owner()
> returns immediately and is followed by a wait with a configurable
> timeout. I don't really get the nuance between your two proposals
> but they go in the direction I had in mind.

The difference was intended to be the first is a blocking API
(ie. function returns on either owner being transferred back to
you or the timeout expires). The second was intended to be async
and based on a callback ie. returns immediately and the callback
is called when the timeout expires so you can run whatever error
handling you want.

> That said, I do think you'll have to deal with workqueues,
> not sure how else to deal with the protocol. If you have an
> interrupt that requires a follow-up UMP-based check, things
> could get messy with an interrupt blocking another one. We had
> similar problems with the SOF IPC and for the standard SoundWire
> interrupts. Best to keep interrupt handlers simple and signal
> stuff to do for workqueues.

Definitely agree that blocking in the IRQs is not what we want,
hence my previous comments about preferring the callback based
option.

For the most part HID and FDL are extremely device led
processes. We don't really need to keep super complex state on the
host side as we don't initiate anything, we are just responding
to what the device wants to do. To my mind keeping complex state
on the host side likely increases the chance something goes wrong.

I will have a think see if I can come up with a nice way to
integrate a timeout to individual UMP owner transfers, but I am
not exactly sure how much value this adds for the currently
implemented features. HID won't use this, and FDL already has a
timeout for the FDL process, so one still sees if it failed and
as you can see the status and response pairs debugging should be
fairly easy.

Once these timeouts exist we have to pick values for them,
because SDCA is a huge huge fan of asking you to wait for
something but not saying for how long. If you have any thoughts
on this that would be appreciated too, but mostly I will just
pluck some vaguely reasonable sounding values as I did for the
existing FDL timeouts.

Thanks,
Charles
