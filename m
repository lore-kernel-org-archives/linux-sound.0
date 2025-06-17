Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737F329A331
	for <linux-sound@vger.kernel.org>; Tue, 17 Jun 2025 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152638; cv=fail; b=bdpuT9c4YI8hxUmQ1GZdY7swcpY5aBmnOh3CE2kBanQEve/yNK5n09MnwaZovDsNl/AfJnPdc+XWQEPDiYLckNqsaw/Cv75nVE+/eiiZnbTCYKyOBU3/GOMP44KJb5uw4p9wLBO24/t2Z7s7svuYmb0h2bL1qFeFCfO1MDTYpHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152638; c=relaxed/simple;
	bh=jF76Nk/yMVL5Ea3Ug4y/RAfORbyRo4VPZTKNvIiUZY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZowCpR41O34XCeftfGWVrsEZouZFulNZZf5Xi/l/FJhMpyKGm9Jzsr/RapVmjQhkzDnPkP5QzwiITa88w1o5uzKxsg5qdGjKvriY+4likN9vRi8NQ2jJZA2bIll+YYdlv5ZTPCxSE2NrvnX2UntqmSARz8aIwbB/yWjDQ/1Lj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EL9hsMqA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JembU6HI; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EL9hsMqA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JembU6HI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6slNd027246;
	Tue, 17 Jun 2025 04:30:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=VvkoXRMDRLaf2QRVzd
	A0RLVjWdN2q+qBUQiH9VTUCto=; b=EL9hsMqAz7eJQBqLz60DIgtIhVAYmWj5Nh
	gzbJlmWehQSrq7GnBeoE6+buF+lZ9XEVopdvZhBuTXZ10nRgZ14zB7oUadan+vAm
	J8+mu5I1lwC3OoJfmk4jJ+jK/aWYv5N2vnzmBxW8u3RKAPiPZ7b3XaLCUolP2K7m
	mgi6y6WR7OwIENK4fH5MOPvyQyN5RjhMNxA9wu3L+VI92uP9SJ0jrEIHSJ0/Tjw1
	3chuc3u4fl8Cr1hidnt0NpRj3QHGndf2drlPVXm5YI2QOjHeNY9SSTRToiVs+xg0
	ojW4tx9Cnw58zO7F8Q9exL26UBS99tFPa8rTgjCw2YoD3vuM/RLA==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2126.outbound.protection.outlook.com [40.107.95.126])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47ap6as79e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 04:30:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQKg1gcPxfn/yBPPPJx6FnqrmRJ373uvZEvREFC4yEao7KD/OJvceGtaFJfqqJvb/XvZYzFO1bl7dflouIzzCFU/tjFxA0d5KEUIovFQEco5zauh2xGoOs3Au5SHUZV2JrvX3iNZ5jSAGJgHsfww5iTCkaf0I2o2/tiA+ox/1+tTezUzkWjMurBJApVAmHqj/9ntFgqZ2tNZicPCymfBTziiU4CcdWxAEwzhMbFBqea6Idj7wdJUkoWO15y1b1zo6s9Hcf9OOlTJZHsnG5QbkA0zZYXQ0pq75b8NkJf2nZZhYVQbOAdWxmM8rVw5OqhSrr7Iakoz+Q/a3uxjpnwjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvkoXRMDRLaf2QRVzdA0RLVjWdN2q+qBUQiH9VTUCto=;
 b=OnfYiu4jGUX6/GXgUTx4CyGj5xVWLmGW7vfiU0XHaN9TkuWzE8cGcHIDmyRnUTO3iANsX3U2J1ckrlTfPeeYPNFaIiw2osCa8uQVvFTCLlyDrgqGcsR9Hf1Ma5+2Cg6FaIzJLhF6o+o0Nbc2kM/E+EUribU4hTg43+ltNSOk6o986EBRtnRJ0zbdbrW8MDRNV7h5VsZbI8pzfd9wXdmrUy5yBRsG9pNNIUOIHGu5h7REf9AI4fFeAXTM9nEYcFCp9yuobSrN3x0gk7iohgDWmtZBhvInMjtuIM2AuWrvDg4jyj6Cik5imTs36TarvOf3uq9xjRfeZE0p5CGfcyoZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvkoXRMDRLaf2QRVzdA0RLVjWdN2q+qBUQiH9VTUCto=;
 b=JembU6HI06WATDK7lRyR4HU1XlmGAZRgecPYf/OJIlJtl8JXXaFflJ9/4vmCiIvLt13qs4BTNVILIdpx3IKmH8p64Ac2DYRoq+zJKXEAeAkK+aegBnoEbFlAR3oelKJkjM4ufr7mtHDbH0lrwhnlWPwMBwG8Bn3kNONxApq3UK4=
Received: from DS7PR03CA0300.namprd03.prod.outlook.com (2603:10b6:5:3ad::35)
 by SA1PR19MB8890.namprd19.prod.outlook.com (2603:10b6:806:46a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 09:30:17 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::3f) by DS7PR03CA0300.outlook.office365.com
 (2603:10b6:5:3ad::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Tue,
 17 Jun 2025 09:30:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15 via
 Frontend Transport; Tue, 17 Jun 2025 09:30:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B3C83406540;
	Tue, 17 Jun 2025 09:30:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 923C582024A;
	Tue, 17 Jun 2025 09:30:14 +0000 (UTC)
Date: Tue, 17 Jun 2025 10:30:13 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH 6/7] ASoC: SDCA: Generic interrupt support
Message-ID: <aFE1padVBUQTrBue@opensource.cirrus.com>
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
 <20250609123936.292827-7-ckeepax@opensource.cirrus.com>
 <4233bfad-973b-4803-82f1-13a0b1dae8cb@linux.dev>
 <aEgHQnT1hNU3kJKP@opensource.cirrus.com>
 <600df1c6-1928-40a2-bced-32cd1f264511@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <600df1c6-1928-40a2-bced-32cd1f264511@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|SA1PR19MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a786568-10a3-41ff-7a82-08ddad8191af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VHHLoTiJJdheVkQVUch2lQ7SDDBX65zXbx4wgOWFqkqi6dyTYhYd1X+ASix5?=
 =?us-ascii?Q?Y0T49BCigDNJfsvHuRG7vhgVIXb1xMwuQjhvQqtSlG0FSrX42K+Qx/sSKXOa?=
 =?us-ascii?Q?PvTZ+l1DRZwL9aCT3rqpc6oIiGua4jf2PY0XS6nVZM6xfkH4tEqNPLnH6vAN?=
 =?us-ascii?Q?4KcsIG4qqAUFksQu17VI6affd/noMtreEk0vszvqHKQlkRdM7eIb6HT6QDNa?=
 =?us-ascii?Q?z8vBThAjf2BmHHJATCIunF6j4gHVU9tJTIY0DbYloicOuH6r6Y/QNw37wjLx?=
 =?us-ascii?Q?bHu3+TDkpU1ZFvubxaHdWjVkUZwnHvi2u9VoEuy4CxVqrdFW/brCfPqWuRbC?=
 =?us-ascii?Q?ahXKevWlTa7KiOI1kySWzfs6mm/tYnpgOaUT0tdu0aTAopGMyzawTwhM2X60?=
 =?us-ascii?Q?C/AR/SvrLv4IbWksattSDtwr+cOq08WyFkyuEWvL/h7i9EOiaQBmrmQcE5JL?=
 =?us-ascii?Q?VA4HfCMbsnq2AqPfrCzj3pJy7rCGb2Vm8x6/Ak/RUAiqsexhW6WUR2v7DJJq?=
 =?us-ascii?Q?6rvD4+8dA0C9X90mStR7CPktU/8TbAQsihQOJVW7L0lswDPyx/U5tPLsco4L?=
 =?us-ascii?Q?XiuF+EnBSaAde7MU86EmN6/z87PwG6huVppv6gisWf4ddND8X7DOicwFilPm?=
 =?us-ascii?Q?gpkS45AZES7hYgqgIkAtL042dO4RPj4A5zXvb3XpV4+aP38fK/TW8TFG5cUf?=
 =?us-ascii?Q?u7N9i/tPdmNawY5vRFlQRzPnq3vyxUsLfTzNcJr0cz1NZad4j+vW4X7RIIq1?=
 =?us-ascii?Q?pSZfmmZz36Z9fMYSC1r7nlzoN97ye3t3Jd3yMSgNC9Q1Unj+KfTljfKcYdsa?=
 =?us-ascii?Q?wL54LTA0Xyoo9mx5c+wEXXYdpQMe2QERdPgqLg2fQlrjSw3f3sgPi3P413Nn?=
 =?us-ascii?Q?vNGgQPEgcNCXwkNDJJDluxYJj7iWPm4N6UF+A0i4YAauQooH+garpt8iP/wK?=
 =?us-ascii?Q?HdaXPwKepwZo0XZ3yMqoJgN1sbqwHQBtVenzrHvEBNevrfkHmpXmYLuM36+9?=
 =?us-ascii?Q?Muc4kJKQpTXUtTVfsyHGxKntd5O7/RikLRyd11SeRis0nme5+XzB36NilwSu?=
 =?us-ascii?Q?A8eDt61FX9LRdZeo9fz0Ja3oILXiMn/zK9wB3aQiHGsBfrmy9YTAU64zPgWq?=
 =?us-ascii?Q?seKns39irKydUKyO7t/6xZVWey5nPCs6ESYW/0YHOaiT+8xbGCtEn+h+RSHl?=
 =?us-ascii?Q?AsxhkF21bpviPSe7qgm3i5lZWCkYmt5hpVFt6x2RrrmmySddH72XMJvcbGH0?=
 =?us-ascii?Q?PKQmhQM+RZCPyVDe1FTxbHfNwocI0jBh4AQJviDPYsOn9kyXE48oiC2mMCoh?=
 =?us-ascii?Q?0wZTkIG052N6TvmxnDZm+4X5TWFVcXhhzI9egKCIj+DDEMsMlUSX/4VntEwH?=
 =?us-ascii?Q?wusHyvIW6EgbuK2AiIJfZQEb6Omom3NTHlWpDidGSIaxMMcvuu5AxCbQA9TL?=
 =?us-ascii?Q?PLeG7+k0x1pS7mcSTgtO6Gef0FMlNDN7YRjbJ5eK6IEMrEFecqbGA4SucTVq?=
 =?us-ascii?Q?L5xMGdPPAEGP4yK8Hh4KDQyHOeNPmuGk1SeY?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:30:16.0262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a786568-10a3-41ff-7a82-08ddad8191af
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8890
X-Proofpoint-GUID: E3EQFQ1t1z_--B5vfnzXYLZ1snBXZQIJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3NyBTYWx0ZWRfXzdH/kInFEQN1 UxMfYvUx0rL0zfcCOo1zmkz179dfwO3SsSORq01IYi0b/sni0qw9E/7vKIUcXfFaybgqervSn78 Xe4+VZitss+v8YR3DiAkzdP/y5f142mm4KR0qgOq+TwVNIOKj2yhBkRAIOqS/OnipvcfGGee1Ll
 6ROTA7NcUQiinNNZn2rio5bFjSDlzZ9C9ydwRN2qaAbXC41HDBJsV0W8iN1d7cQUUWCeZ/cAqlM +qQPlrfFU2om45lXEVqxzXJEKSaRFOCOf7VGrMsowaVovuZ/q0IbDeAaqZL/tMfvlltxcEuVkP3 rFiSRzCTaXXzlR9Z5Ldt2qvBIIUVnDaQ9Jsf2DVlwshMWg2R3JFjEZd4D73VqFPlvrn0yS+EGUA
 IVVcMgj3PxRYAMPFgZbKs3Jw/vpyhcTCeONWU3kv3AcBBJZKiaieSe6QT0cqa7XV8XTpYbJy
X-Authority-Analysis: v=2.4 cv=F/pXdrhN c=1 sm=1 tr=0 ts=685135ad cx=c_pps a=buHwmX5sm+bAfQQNRseUuw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=RWc_ulEos4gA:10 a=nauYTp7-yNCEZ73rO6gA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: E3EQFQ1t1z_--B5vfnzXYLZ1snBXZQIJ
X-Proofpoint-Spam-Reason: safe

On Tue, Jun 10, 2025 at 07:55:23PM +0200, Pierre-Louis Bossart wrote:
> On 6/10/25 12:21, Charles Keepax wrote:
> > On Tue, Jun 10, 2025 at 10:52:30AM +0200, Pierre-Louis Bossart wrote:

Apologies for the delay, I was sure I responded to this but I
must have done one of those writing the email then failing to
send it tricks.

> >>> + * @externally_requested: Internal flag used to check if something has already
> >>> + * requested the interrupt.
> >>
> >> I am not following what 'externally' and 'something'
> >> refer to. Each interrupt is allocated to a specific
> >> function/entity/control, this hints at another agent getting in
> >> the way but that's not really how this is supposed to work.
> >>
> >> This deserves additional clarifications IMHO.
> > 
> > I can update the commit message/comment a bit, but the idea
> > is mostly we are creating an SDCA library here, so there are
> > two possible IRQ flows, the SDCA framework can handle the IRQ
> > internally, ie. using the handlers present in sdca_interrupts.c or
> > the client driver can register a handler for the IRQ directly to
> > do additional magic. This flag lets the core know that was done.
> 
> I would have expected a base behavior to deal with the interrupt
> itself, and optionally a vendor-specific extension for additional
> magic. I don't really get the notion of 'two possible flows'.

There really isn't a lot of difference between the two:

  1) Internal: the handler is all class compliant the core just
     registers it for you:
      - device driver calls sdca_irq_allocate to register the
        root IRQ.
      - function driver calls sdca_irq_populate to register all
        the handlers.
  2) External: the handler is not class compliant the end driver
     should register its own handler to do whatever magic:
      - device driver calls sdca_irq_allocate to register the
        root IRQ.
      - function driver calls sdca_irq_request for the IRQs that
        need custom handling.
      - function driver calls sdca_irq_populate to register any
        remaining handlers, this can be skipped if all IRQs were
        registered through sdca_irq_request.

Its really just a cutting down on boiler plate code thing, one
could always make the client driver register all IRQs through
sdca_irq_request and then you wouldn't need the external flag,
but its nice for compliant devices if you can just have a single
register all IRQs call.

> >>> +	.runtime_pm = true,
> >>
> >> can you clarify what this last initialization does? runtime_pm
> >> is far from obvious for SDCA with the different levels between
> >> the SoundWire bus (enumeration, clock stop, register access,
> >> etc) and Function management.
> > 
> > Means the regmap IRQ handler will do a PM runtime get whilst
> > handling the IRQ, which will ensure the both the device and the
> > controller are powered up, which will be necessary for
> > communicating with the device.
> 
> this is kind of odd, the device needs to already be up before
> you have an SDCA interrupt, no?
> The only case where the device and controller would be in a
> low-power state would be in the clock-stop, but that's different
> to the SDCA interrupt, it's the SoundWire 'keep data line high'
> mechanism.

I mean yes the device is probably already up when the IRQ is
first processed by the SoundWire. In general its just good
practice to be holding a runtime reference whilst interacting
with the part, stop things turning off whilst you do so.

> >>> +static irqreturn_t base_handler(int irq, void *data)
> >>> +{
> >>> +	struct sdca_interrupt *interrupt = data;
> >>> +	struct device *dev = interrupt->component->dev;
> >>> +
> >>> +	dev_warn(dev, "%s irq without full handling\n", interrupt->name);
> >>
> >> is this saying this function is really a placeholder for
> >> something else?
> > 
> > Yeah basically, this will be assigned to any IRQ that doesn't
> > have an implemented handler. For now that is most things, but
> > even in the end once the core is more flushed out this will likely
> > persist as IRQs are control specific in SDCA. This will always be
> > necessary for controls that don't have any spec mandated handling
> > but could get an IRQ for implementation specific purposes and
> > would have a custom handler registered by the client driver. It
> > is really a default handler to warn the user/system implementor
> > that some code is likely missing for a part.
> 
> ok, not sure a dev_warn is required though?

It is useful information to the user, it typically indicates the
part is doing something that has no software support. I would be
happy to downgrade to an info or dbg if you felt strongly, but
personally I think a warn feels right here.

> >>> +	info->irqs[sdca_irq].externally_requested = true;
> >>
> >> this looks like generic/core code, not sure what's 'external'
> >> about this...
> > 
> > The key point here is that handler is passed into the function,
> > that is the destinction between an internal and external here,
> > internal uses a built in handler, external gets handed a handler
> > by the client driver.
> 
> I am not sure I follow this one, you could have a common
> mechanism followed by a vendor-specific one. Why would there be
> a choice to make? IIRC the mechanism I implemented in the early
> stages didn't have this architectural notion of internal/external,
> just a vendor-specific callback once the interrupt was cleared.
> 

The regmap IRQ always clears the interrupt, so that is the same
as your previous implementation. The handler registered here is
analogous to your vendor-specific callback whether it is
internal or external. The extra layer here is just a convience,
the core can register all the IRQ handlers for you if you don't
need any non-class compliant handling. Just saves a bunch of
boiler plate in the drivers registering all the IRQs.

Thanks,
Charles
