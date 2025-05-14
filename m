Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C834A4B5AE
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229720; cv=fail; b=Oj2xfmaxg1O65mqtJsHpEvz9jxQmLI/AD2RQ4OBt9K9jh1bfVf9cCFUU0CWskBbRzyW3ll4W4Zb6Ml9PNiWckennQQ7ejj4tlLwdlA5pe3c/K+YZ5SuNQI+yM9VG5tU4wLMIzFar6tZygj2HTeufdMfcyjxGx4bTN+qY9nES3xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229720; c=relaxed/simple;
	bh=wRhinwiyaWSx4TD7hwY2utpV4clDyFURqOoaGFaK2cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oahztHu16IhmRy+4V+CQLmN5XKDzw/KHDA1NYSitKOamIAqBre50MHLT8d6PY1hTfXlJyg5OldmG+rBzvDNvsLqadPcjHKMg8c6BXXW/Pel4+tDHu0/DyL0T2hfXl4Hs4TaE38SfJw01JPbzPMbkORdW5k2WqfvCCH1uzYqNxsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fNlInfbs; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KgibyLfN; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fNlInfbs";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KgibyLfN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E4Urt4006828;
	Wed, 14 May 2025 08:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=JU0ZsTdhH8vkaqvGQ1
	bYN2hOiY7+pW3oiqiUCSmfR2w=; b=fNlInfbsz77oCkV+xs9miRKieVmKOHuYW/
	Zk6fP6L9YO55dAy0uB2s/pdLh8cEjlQ7sANK9qhR2PHzX2GhJDqcc+BOCd7FAze/
	pGzE6SAUSS4N7ciW2NSWBzxIC4OfSRpQL/9/0qkMmqb1UI6lIKeY1I8u0IFDGOYi
	54h8pgnKKODLzxFyHQS7pKFP0lRCp5h1rO8MztiJBIOuZ6WqojeyBHFPUfAva0S6
	t1q5IFVSkuG8LbxbjK9hQnCCyAuL0XdrTCzvfxnV9ldx+1r1d59m6URorA+VT6lw
	pHkh5lenomUAtwqbjwRJ/Wf3BIxvsf8OtWIhtDyqKzN2iOnt7tKw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46mbdr95w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 08:35:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETN1h9BA8HKgXQ/IWxhWzIaEIPCXx07ZaFtNjv8v2VOf1ULDQjc+M0oLsDctaaJq1qhEN39nbKTVFvWTiLpvGK8iItlBuIrfUj5a7KaalJa3594pagNsO4bhLCYkIv9bzfLljtOAyD/naX8Wb/YpvZ3cTjI0rBXhs5oVRolKWCcZYduChnD9cpQ+hjDeBqfNKvmeHR4McUSEwyOxsv6HfgBd5fkOYWz7r9lF4YJKuMzowypN85theZZnLIZunCERtmWkWf96LnfVPZstbH0GDWTztjk/WQu6d6Css20Dp5C6CX7p0PI2mn0yraXCghdGcL9W/CBgR03KTyOXnlj6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JU0ZsTdhH8vkaqvGQ1bYN2hOiY7+pW3oiqiUCSmfR2w=;
 b=zFajmRb0PE+cYSCyzNkeUQ8/KkD7HHOye2s5ucE5629KjXNZxMbSe+oj8cL3JRWOJ53SvOI2VNOTqeREe+IkFTjPBS+tRGNGVb62Ejneo7kT8AIYncRs7k0L4bwAV4woJB5QdQr8273xM9Y8ZwDLiDFU+I3bD++9UJG6RyZntTgQ3LotNe+TTNEt9UKDq2yV4nJDQYmf3MQT4EDL8PE7UUOBeV+T/G9wA2CgYg5Rr9KtVg50WpeNF6kLHub067/WKUpIsCIfiBoYSA+6ZqvppvSz0UsK6WyQs81jcxPCa6V5akAw9JZaSgof/LQK2wj+Mx2uqW1SMk/SJNy+BeyNcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU0ZsTdhH8vkaqvGQ1bYN2hOiY7+pW3oiqiUCSmfR2w=;
 b=KgibyLfNpZ1SQfau7atW6NJnOC3/WcK+Q1pTPhSURaL0Kt0MwpwvcZrmG+z9JIpayTeRIMVPk72lDdovoqUsRpGocCcLhbY8BdmALm6DtkFS6XJQEvWSdXag3YEt8V8IDes6HQ7kpWZKAF5TDm+hCdWw3ctLmzSgxPUNHCsMnjQ=
Received: from PH7P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::8)
 by PH7PR19MB8140.namprd19.prod.outlook.com (2603:10b6:510:1ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 13:35:06 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::ff) by PH7P222CA0020.outlook.office365.com
 (2603:10b6:510:33a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Wed,
 14 May 2025 13:35:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 14 May 2025 13:35:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0DA0F406545;
	Wed, 14 May 2025 13:35:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id E4C3482026C;
	Wed, 14 May 2025 13:35:02 +0000 (UTC)
Date: Wed, 14 May 2025 14:35:01 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 5/6] ASoC: SDCA: Create ALSA controls from DisCo
Message-ID: <aCScBQHCw9xpsCp2@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-6-ckeepax@opensource.cirrus.com>
 <cd574985-e434-46d9-91ff-a2782c6e8eef@linux.dev>
 <aCIsWP1Ac8WvX11n@opensource.cirrus.com>
 <aCMdyOugv7tbXJ5I@opensource.cirrus.com>
 <f04afa43-ed28-4e2f-a3b9-0d9990d2a8ce@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f04afa43-ed28-4e2f-a3b9-0d9990d2a8ce@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|PH7PR19MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 2590521f-30b4-401d-14bd-08dd92ec229f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ph0VMHJqch2msbABK6Ew5SJuBcNpGHgJFsgUajBTkZsaZWAtY7gvK/wYotjK?=
 =?us-ascii?Q?uK1Z5F5jd29CbjwVMmscs4crQ/qN7pn4tsgbBYtVE4fD+vFk2wD4zkBRpKUx?=
 =?us-ascii?Q?dezzJcswUtZArYtuDRivoGYuV08827kPNoqga5pn9nocNLHMtxqrz13rzO9P?=
 =?us-ascii?Q?f5krwIsMjSl7EKeMRwEUdmJRxV7ysIgiWP42oDED36sCNCLxNozyTeisADL6?=
 =?us-ascii?Q?u0Nh8n7hOK4tarffKBgZqk7ulAY3D/FzM514m+OYrwsPiSha1CM3L3a8My4k?=
 =?us-ascii?Q?pYlohKDpRUK9Ux7YUc2FacouyWvVSnMjZQHz+Ui1H5DjKLpJjyr45T/3kiny?=
 =?us-ascii?Q?4hqsNwh+HeJwOXpvAqfJ7OR6neC4yb2Vz7SsCp6C/stKu8xG9ZSI8R8SD6Ep?=
 =?us-ascii?Q?t9o96PRNvQILZWJou5rEIof89GEY+y1Q2Y3Wq+pf2oqmXzPHnx7eTKfX0uvp?=
 =?us-ascii?Q?5n/tN4oN/HqjwTnzGh9r5jnBN4oOdJYbByC1lslPZHTjVyRXnQIUXiDyixdL?=
 =?us-ascii?Q?DUVSwejF6uHTVZZn5XtNzqj/TlerBIZJWlZpRd9depRVcRwrD6LjIoyAfqj6?=
 =?us-ascii?Q?9BE5MnJ/ktsFigtCxzt8swRkSjA43I4AFR6BngUvx5wGWQ2rr8Evx4MDjZuz?=
 =?us-ascii?Q?8/0PQRgN1QZMjJC8RpqX6vtGwhGBC0ScXMmn5AIWoq41fzDzz4bPtwQKOU2b?=
 =?us-ascii?Q?Q8pt7XKQO634jdIRCmr7rQTRU2oPOihzF3nuvImYJBQ4Awg5B7xMOq+wpqyD?=
 =?us-ascii?Q?rNuyqEZeL9Lhm9916Kxq3a4UN35TncaE5TOcYzA++b5m3xyMH1TlPpuVqTMd?=
 =?us-ascii?Q?x5SCr95om+9Mt2ET2Wy2i6vqmWBHvEZOIUj4a4+RemIERpt8JUovbvyXYLDN?=
 =?us-ascii?Q?WC8MAOz5cHl0KXd68gl2ffuSXF8CKWjqp7mSpVZioBusjWGj2HLMMLAsyCVf?=
 =?us-ascii?Q?HJE8MYkDz6iIrOqioBOpLJbah+H0gJokdKCGbp1V8FiKFs0HAnTNPWmlKkww?=
 =?us-ascii?Q?ZKk9W65/EL9dkOWazgFh+iHCwryCWTTChSVwjifJseO5AxR7DfzSqJSIkoKg?=
 =?us-ascii?Q?NLXz961U/Iz5GOmsV3OdSRdylbKXS8Mkv4aTWFcKaOpcm8YmYd67yWAR1R5u?=
 =?us-ascii?Q?IWhwp+efVqNwv/tNZxt8O0S4fv8MvdBtXOyCimx2f98cskVlAyh9GzyxVFEA?=
 =?us-ascii?Q?P7IU51tirr9mq1RrVjblNeFrju4lIf1u8Bzesf6sk0AvWXkwGVu4/d+TDuMT?=
 =?us-ascii?Q?N1Dl9khDPZ1owJNb9rredAHEciwbNuNTzq9FbXjqwHX+gR7k7INlwQ61Woiu?=
 =?us-ascii?Q?8UNg9CzmPSMUig71a/3TBz232VRHzRvgoxyW6IkEd4NrBVoMN/zuRAN7j0nm?=
 =?us-ascii?Q?HUW99i2bGOGxqQ0VMf+cgMUaWF2bbVKBYzFLHmHHIryRtaS742ocTdTkPpph?=
 =?us-ascii?Q?B7cbmesrcScw1dmjsx+T25+ffykSRSW53owNJ4zL9geiZ+wJKjn1Z5xBh4pz?=
 =?us-ascii?Q?6G6cZkWshlYJepVvWFS2m5RYc5k19WvN5by8?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:35:04.4433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2590521f-30b4-401d-14bd-08dd92ec229f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB8140
X-Proofpoint-ORIG-GUID: 8Cja51pvdbMSJBAWWztkxO6y22dJ6iZr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEyMCBTYWx0ZWRfX2b8sm2A7Dscd EBV5TzvUsTs9bBAqrMAOI89uNIMbY3gqh2qSa4EA27Rznp5NnoBIZ4DL08tXmdmGuUhDX8zgIKY tdGsfjeqmObxTZTpt7IIKxakfrh4wjHass/6WHr/91tBu+6WFqUBOFh3E9QT8bFKZ9EdwYLDJAM
 BcvlQeaXVKGEtjjkeiQRgkLN8FN7oWFYr+lBcoFNJmpU5QNkTWbu2XA3ziBCICRLnIZqshRvUzQ LUksxKCoRTn5hayzZxye51dyGTTtcsjiAX7g8NUhLHZYMQNlZFzeKUw3E+oBigkaKKMqHfirVS8 xq+x2XPmEF2NfM5OjW00w6biIW+Ljjr8etRDa9sJCPnkYFTF42ziaAl8wiHgqXtu0mgHPpFJE8P
 42VshKbAYifh2i4aNuP8xSzoWdwDq3pf9VpUh9FiZCnObSjkwoYJgTJaQljqREvs3MlT4ghn
X-Proofpoint-GUID: 8Cja51pvdbMSJBAWWztkxO6y22dJ6iZr
X-Authority-Analysis: v=2.4 cv=abNhnQot c=1 sm=1 tr=0 ts=68249c0f cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=RWc_ulEos4gA:10 a=Gq7KA6286GR4nWjycngA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Wed, May 14, 2025 at 02:39:20PM +0200, Pierre-Louis Bossart wrote:
> On 5/13/25 12:24, Charles Keepax wrote:
> > On Mon, May 12, 2025 at 06:14:00PM +0100, Charles Keepax wrote:
> >> On Mon, May 12, 2025 at 03:53:36PM +0200, Pierre-Louis Bossart wrote:
> >>>
> >>>> +static bool exported_control(struct sdca_control *control)
> >>>> +{
> >>>> +	/* No need to export control for something that only has one value */
> >>>> +	if (control->has_fixed)
> >>>> +		return false;
> >>>
> >>> why is that? It'd simplify userspace if there was always a way to
> >>> get a value, even if it's fixed?
> >>
> >> Well mostly it is because various things in the stack get
> >> sad with a single value control you can't set. If we wanted
> >> to change that I would suggest we add a FIXME. It isn't really
> >> critical and I would really like to get more of this class
> >> driver stuff moving, it has been out for review for a really long
> >> time now.
> >>
> > 
> > Thinking a little more about this user-space is going to have to
> > handle controls not being there as different controls will be
> > exported across different parts anyway, based of which options
> > are implemented. Also we have seen a bit of people hiding
> > controls by changing the access layer. Although sometimes that
> > does result in things that are technically not class conformant
> > but they do work through the Microsoft drivers, so we will likely
> > need to support it anyway.
> 
> Sorry, I missed what the conclusion was, would this filter stay or be removed?

Not sure I was clear either :-)

I have been poking this a little more today and I think I might
have overstated some of the problems here. I think it might be ok
to just mark the controls are read only. Will keep poking it and
will update soon, but kinda hopeful we could actually export
these in the next rev.

Thanks,
Charles
