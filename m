Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E2F2FE041
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765360586; cv=fail; b=F1HQeZ9rpn9Pew446eWF+XR7b5V+UKvOltSkAgRxefSKySow8MUNfjTfJtgigc/fbMMPh/R86hl3XIysbeJIVZHqjAxfmsX5mcbEZCIBfCWanCuhtmarXA37FYIcCQ7znqvujhuU6RXe/5bhLNW5KvHbm6BFzzHx2/2yEMK3WHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765360586; c=relaxed/simple;
	bh=fh6jbfY2GuU8te9C8LjNsghYzIprBygHipXzMhd3+yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2ATcZVk2x/LyPzTO351PBVbc7L3L2E3qKm6mCMe11wqR8/2TRjiMoLrMes08NKogIzsNKsxpHHOhuLLTCJYWeTSAiECcqA9B51P/L0KygXMPTrfMKwZLzsyM2uY7CLSJHWebPuB8+kKJioJ35bXxIw2amcRIk08kFMbmIpNRDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=a+WRfWWF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=X5fXuvoh; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="a+WRfWWF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="X5fXuvoh"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3wHNK1225799;
	Wed, 10 Dec 2025 03:55:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=FDaRMNlxfE8490/cQG
	rtTeAFHbe650iulU66CB6naDs=; b=a+WRfWWFARoD5dkfYFCFd1UkgHTA3GyS7g
	ZK839RnLDwi2SL088WxHaolSYedne30Z+wywtSmwX41MM2XC6Fi18GnnexCSV8if
	g/5Lg9Cz2nE4k+K0xfWtphJXq8PeHasfaj3IFsa8EdfzhOSyrqjvntLzW3GqRuuk
	RxJoDXSCHzIZxB5O0EXSNJ2gzZqJTnzvSel++VExxATzIvLyUAna6T8BfP1mAcjy
	YAGbAn7xaN1pOzDQnGeblqnib2CahEUZIyBGLOVK06l1CTn9/+rbUnoC/6p+guEE
	5ZKBUlyf3Po60XQk46cqxVrunXhJokvFfIYcCfrWx7vWapyi3BAw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020110.outbound.protection.outlook.com [52.101.201.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4avjs2ge5s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 03:55:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8JagPCrasG9cIFkP0YuFZg703CyBP2kZG7PlUYrXMBunGzuz2kuONxwWqkSAn+h9UhjhqOQzk6piTwZr7Bypy/TmHr+CVJ4Ycco/jVGXPohWMnsJr9/APWsJCHKEs/e3bCCbM4/P0agMddkQ07CzHC4nPTrApUEL8eoL3+cQ2aySU7fiSRO5kkXJD6Inmp/9YTTocx9e0VYDAjrx38J6dLVCw3cLVuFa+eQwOHmkPH7gWPteIT4tOeP/RYEqyIpa2MqY0OXSVitGMetARWU7kB4HnPmNrdwWNXFLQS5DuntRx4X6vVazT7+KLBKTRGMMc4YbNSJlg98Ztte56JP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDaRMNlxfE8490/cQGrtTeAFHbe650iulU66CB6naDs=;
 b=vcvCYtVi87fPOKZDnTZvpHIT+y0APD2kpuzOR7h5kyAkql/sixhHh6EFWEZVWZcCskh8ZSvhA03Q9/Icv0PMMRow35kWHDs9rOm5YgJ7V56TnRDu/D/UGLTrW74pxJX9gKIIZt7EzdgZULnyqdoXS/C/IU5zrGhDQTs+8J7DWw0stAX/8pCn41Tic8xsK3igIAUAl3AXQYRLQNM3cKboICHLaAdtgs85HJMeGEzcjTngGO+JdxZg0Aa7IfWMCq0DuR4IuozPOVVe20DgZZMPunraq6WzeqDWU9/qoEJx44rM1jA15WGpmybp0GvB58MZZtJtADxMw5vZXPHrw6WDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDaRMNlxfE8490/cQGrtTeAFHbe650iulU66CB6naDs=;
 b=X5fXuvohcusWMJXf3/maa31PO+61KV2pPsSKALKUmsX2CvG07KEe+eDBNZoM2mrHYKAsvehW+xeWSM8kAOjuGw9Y51HOS2P1NwYgjfBAcs23wwWM298w/qCfne/emKA1QPgLgZaJ95y2SIfbyEzFRBxnyyIG4foglIbtT27U4N4=
Received: from DM6PR18CA0024.namprd18.prod.outlook.com (2603:10b6:5:15b::37)
 by PH3PPF0B76EB972.namprd19.prod.outlook.com (2603:10b6:518:1::c05) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 09:55:48 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:15b:cafe::93) by DM6PR18CA0024.outlook.office365.com
 (2603:10b6:5:15b::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Wed,
 10 Dec 2025 09:55:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Wed, 10 Dec 2025 09:55:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AA7C9406540;
	Wed, 10 Dec 2025 09:55:46 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8A0BA820247;
	Wed, 10 Dec 2025 09:55:46 +0000 (UTC)
Date: Wed, 10 Dec 2025 09:55:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
        vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
Message-ID: <aTlDoVxI0gJMQOuw@opensource.cirrus.com>
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
 <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
 <aQOEREIJ8TiwZHef@opensource.cirrus.com>
 <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
 <382ce438-5251-4d4d-af44-863197c77b94@linux.dev>
 <aQo0d3UWKinyzTYT@opensource.cirrus.com>
 <5dcb51e4-e9e1-4b26-816a-90c92fbb200d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dcb51e4-e9e1-4b26-816a-90c92fbb200d@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|PH3PPF0B76EB972:EE_
X-MS-Office365-Filtering-Correlation-Id: df469c65-d4f8-4cd0-02d7-08de37d24b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XIM32mvwAfkMYvt34LM4ZtVJ/Joa5VYoTPfHZww7RXZyVv4k1J4TaUDQ+jPU?=
 =?us-ascii?Q?fgD7H6/euLeFS4twwF3XtsIcbmWCOgXkLkIX1YqCqI4kVPEawJjry4isQMM9?=
 =?us-ascii?Q?0ApWzGF6XlJwl1crrspnGSRJHH+poig7XD3TdpYFCtw9ZuPaUVvjeffiuudZ?=
 =?us-ascii?Q?yV8UFizjtBBUq+N8jhnqp4mmTTEyapd3PleSDvHFcaOxdTBIjDBjJWCazSIR?=
 =?us-ascii?Q?x+YgShSdex6eO+bzOayQ4dPzllg/szVFsk3HDagPfWMsAYu5pWx0Y//huW/V?=
 =?us-ascii?Q?sY364jn1fN0sAr3ONRlrCefnBW4TwIOndDpazCNzJEvdm81fMfLXUHJn8RXh?=
 =?us-ascii?Q?xbPZHgHpEAtaSUOC+28qL10Qo1viDrYqkt7ts3nE+/IzGI8YcOQQPOPuX3JT?=
 =?us-ascii?Q?T6JRchVsW3Xf745LnqVY7NjQr6BJkgbVavu3JgegdN9qojOd/RJ+HJSMzmK7?=
 =?us-ascii?Q?KtmzwwMqwzjRF/+Uc6G+7//OA1PQa6WJtjf/DJ1p2Dmy1+7cGNksFKjXNB5h?=
 =?us-ascii?Q?7C9gPt83ByEy9CiSB5XVKWn+ZuFWKLnF18ylVQPCtfIzaZgFvmd4WfCz/iJH?=
 =?us-ascii?Q?QeYxV+r3gFqTrp2EixYaKt3lPbRYgY2XvxnZRIfLCaeIbUFYj2VJ3pZPqPtO?=
 =?us-ascii?Q?7BMpslLUxYFE3zch8nFp8x8Co1tdi36tmtqxwLCJhEVyqMo8TiF7fGcEjF0c?=
 =?us-ascii?Q?xQ1sO8XzD2Ei8g2VsbtZ4Kv5nbMv0KtpftnJjV5znyy2Y9HAfyRlFWEOeMvN?=
 =?us-ascii?Q?tzFkkXFb4h1gat3oHa+uD8gtItGniSBSi5JipJUbfP54UlPLmk5pYmJQtZD8?=
 =?us-ascii?Q?byWX01H+KviN4O6n8vk6MNUltTZIU/NugjRCkPsvubxmeQ5uIJ79Mb27xNCu?=
 =?us-ascii?Q?VDu6irqaa4Q2x901Cng6UMY2gN5BRrNy1KyWcnu+ixUpMnS/vdn6ZfoB3nb5?=
 =?us-ascii?Q?2xGLfRKW9y62a2Wvd7/s/Ydsv6S98WfG1qSrrWzn88CXg6fJiO9a6BroJn9H?=
 =?us-ascii?Q?Qa2F1WQqH91BbpPUV6lwJXFB8fd89TRAeX5v/Nq8q4Ctwl1p3FZ+QInQJAeI?=
 =?us-ascii?Q?AkE3qeHqSdSUPOver6SSTL53Pk7c0RHIjaRCNAJ6fA1LAqRDcefZ8ciGEWFY?=
 =?us-ascii?Q?TH8Fces1zR7MI62u05unyDschcxJ3VrBRgbCKLdhyWBRnC64bbAv2Fb2VsmA?=
 =?us-ascii?Q?uD/TjrdJfLsbzi33V9gnMtuYAe+v5KldS96sK/xA505x5esBmzw8s/S7Fc6W?=
 =?us-ascii?Q?rSRtkoWA4ET4qTuXGo2RU6fMxUvWgoiXrqrcxx/yvsJRr92VC7zVePgWvxE9?=
 =?us-ascii?Q?ZQsz8IZeucZTMtVB7YdgVK69/1ze/qAyEY8dlIkwFWyKX1SGbABuKWUZ2dxD?=
 =?us-ascii?Q?Br0RcqYHLMTBv0k1sZA+s75g96HeymmnGyFjGFa6NlRQNJ8LRjoPv27iobDn?=
 =?us-ascii?Q?j1o3HuzTIEamAeiC1ErrJVk3u/45huXXZx4A+FleRWZwoFmDdQs1lMQQ8QhS?=
 =?us-ascii?Q?SyiWdvtBEYFVrQwuIwoDTfL8FfQ4DECn4ThZ7id35D/Jl6il+8ijy3d/Lrge?=
 =?us-ascii?Q?PS4ZDY7mvFxXWamQG2c=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:55:47.8120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df469c65-d4f8-4cd0-02d7-08de37d24b65
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0B76EB972
X-Authority-Analysis: v=2.4 cv=dZONHHXe c=1 sm=1 tr=0 ts=693943aa cx=c_pps
 a=FaoZe42t3hJ4J9xi/30H+Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=nMDIn12j2Ybx7ldIpkIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NCBTYWx0ZWRfXxMhaYCN4JPjV
 zyy8nvZ0IWvjrYENCiJKZaKIyaOQUDFydnSw7NIwYF8MxyZLN4HqxBXXkb9a1HO19BOWS0RSkSv
 u9KqmBWLSfF5BQ1Ld9rXDJHvVe4XQ7DEDkAvQBwS6kt89Eo4Jnm91nQ59V/AnV4o/a4oODH4ma9
 uh5ptZMVqKBmm+YQh/I5nsGRGSiA6mmaHWmwDGOzluVoXO3zCb/XzFRy11qd/usrkETQKJRKH0W
 JSQvlM5IwMvzyb+vhAUd4MPUZM97IOQqZr3zA2LFK4SUwxVy3UsWBWcg+IJM9yzYVS2+UhH8O+2
 +ttOIe7NmljFhajQBRhvDmcao4UI/Ul346uevXlf6Sf/qKyrihkcTpzwCAk41C87RF/XKmukCyW
 UwK6VH8b1mNFKwxhqhHX/mmukPIxfg==
X-Proofpoint-GUID: s98-C4uuHb-NlFojvMdhZC4lIkJ33PF5
X-Proofpoint-ORIG-GUID: s98-C4uuHb-NlFojvMdhZC4lIkJ33PF5
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 09, 2025 at 12:47:06PM +0000, Pierre-Louis Bossart wrote:
> > That is some scary stuff there, that is basically working around
> > the fact that with those drivers the soundcard is created before
> > the hardware is actually ready. But its one aspect of that and
> > there are likely many knock on effects/races hiding in there. At
> > some point we should probably revisit the whole enumeration
> > thing in soundwire it does cause a lot of scary code.
> I don't see how we can revisit this, the codec probe happens
> based on ACPI information even before the bus is started. The
> card driver is also probed when the PCI driver creates a platform
> device.

I mean in general the fact SoundWire probes devices before they
are available. It introduces a lot of scary things, as basically
the whole kernel is setup to believe that when a device is probed
it is ready. I mean I know why we did it, because we might need
to setup some things (resets/regulators) to cause the SoundWire
device to enumerate, but it does result in scaryness.

> > That said... the class driver doesn't have the same problem
> > however, because of the two layer nature of the auxiliary driver
> > stuff. The soundwire driver binds to the device and completes
> > probe, but it is the auxiliary drivers that are used in the
> > soundcard and those are only probed once the device itself has
> > enumerated in class_boot_work(). This means the sound card is
> > only created after the device has enumerated, so the same problem
> > isn't present and we can have a more normal PM runtime startup.
> Humm, that's an important detail indeed that I completely missed...
> 
> You could also have registered the function subdevices based on
> ACPI information *before* the whole enumeration. I can see why
> you took that function-register-after-device-enumeration route,
> but I have mixed feelings about having separate mechanisms for
> vendor- and class-drivers.

At least currently you have separate mechanisms regardless
of the choice of probe time since all existing vendor drivers
register a single driver and the class driver registers many
through auxiliary. The difference is only in the secondary
drivers that the vendor drivers don't have anyway.

Personally I like the only registering the functions when the
device has enumerated approach as keeps interactions with other
kernel subsystems within the expectations those subsystems have
of the driver. There is a lot less to think about.

Ultimately, I think the long game solution here is probably that
we move SoundWire to internally have two devices. An initial
device the gets registered and does the probe setup and then a
child device that probes on enumeration. Basically, the same
setup as we have for the auxiliaries in SDCA but internal to
SoundWire. But in the mean time I think using MFD/auxiliary to
introduce a 2 step probe seems like a really neat solution.

Additionally, there arn't that many SDCA vendor drivers at the
moment, a handful of Realtek ones and a TI one. If we wanted
to standardise I would suggest standardising on the better
solution, which to my mind is clearly this approach.

> Note that things will be interesting when we use the new
> ACPI aggregation information to create the card, we're missing
> a means to re-trigger deferred probe checks as devices become
> functional. I had a patch on this a couple of years ago, look
> for "driver core: export driver_deferred_probe_trigger()",
> we probably need to revisit the entire scheme...

Apologies if I am misunderstanding but is this not another example
of the advantages of probing when the device enumerates? If I
understand correctly the problem those patches are solving is
resources that become available outside of a probe break deferred
probe. By tying the probe of the auxiliaries to the enumeration
of the device, we ensure that link between probe and resource
availability. I think the point Greg is making in that thread
is that the kernel expects resources are available once probed,
so if one is going to break that assumption it should really
be handled exclusively in the driver that does that. But the
simplest solution to my mind is just to not break that assumption
then everything works as expected.

Thanks,
Charles
