Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB228265CBD
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336344; cv=fail; b=BnBax3pZqRHmGEqdPSempFB9lIDwhxTe6lVvZydz7eDOtTZF8+YsEKdGXMaCx5KsjDfrmNT3/6G2bTl1+TweO5JNrsPuZ9gbDPkCt7tb5nAd4hGHpX6ZIfEbCPwk7f6c/0l2dyGnDUvpwh8XKYZvnYPo0ogHKZZxmf0yz6JnB8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336344; c=relaxed/simple;
	bh=h/XmpJAuW5/w7aMmZb2438IxGsZnCDrPgAidOo2f+gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K86FQsMNA/kTWQWtpWSDMgiU9SsUb8tB9aM1DoAf8PlKwIE2YkkX/w5VxEI4ns3ZZ2DhZuEaUT8C2GBhGPmWD5Y+ZjkREM2bW1n1oFXsPdj26JriKSPB1az7AWOBGkcayScYdxS5A4HNWuje0Djsb8QXwXTq1rMZ5nc5W21ao1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MAK3iy6u; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SH8BBR21; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MAK3iy6u";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SH8BBR21"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58849x2Q3868119;
	Mon, 8 Sep 2025 07:58:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=us9FOs6isBxAhm2YEb
	fpI5UkZfPGie5ua6+Zja98l/w=; b=MAK3iy6unqU95pgeT3XKxXObrqiIcsfN+e
	h65QRC2MDhHrqXx8HCc14aUYY/lK5PAd+OrDqHSiGgLi9bnVehhsvGTtkUw1EJ5y
	l1zXXB/uwWePuvqyxAgdRfaQCgh/0z4M4yk2mSb+BfdkVMk+mYqPU/VNbSeAHI7q
	MaAUTJa8kiF2PcVprnBkYTv9ku+VUEKZOm9y0SIXD5anLZrzL8rbH0/0YEXDJAa9
	spz/pPqF/u7g6kdDw4UKpo2WwEjT8fcx+QXhWEn5HipCnYHsQ2LE/maQpUTBAYsx
	MuTV42dpukoQ62+IP0Jry61pCUoctyqB7pS6PwZQ1uQhc52sWljg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2092.outbound.protection.outlook.com [40.107.220.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 490jbxhwb8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 07:58:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLkipiDJ03+AuS57XhDzcGe77+yiM0I8wS+xnwQYQLE692C8Ulm7uj7dERvzkOjsFGI3kBqB1e3EzTwdKUbOKv3/wIwnn0Z36uWRPt4nuJMZDJD7wrXR4rJHpYKZeGdFueBT0uRh/psI3stk2fi/M8vCRaXMTDHAHOma/4gz/0jwlMuoLCQZAOdRa+YIEiZA/ZgI35X7vKxe7T+VlpywzmdiRYki/flsqe2i785HERE3U36j8j7jDBrdUNIYVYZz97gUzMLkSPdOqPSsNKy20FCvtYCRdyseVEqus8VXWdEo2DkL0ljWU29uaDDF3wkzjdsZNGiz+QXZQmhpmH2oYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=us9FOs6isBxAhm2YEbfpI5UkZfPGie5ua6+Zja98l/w=;
 b=vfU4XKekRfTfFVCC+QJvrAUn4zcDMzOaZW0qZuaqDZ1+owTe7uq9Ck9rZvxE4ZCLK03TXlRXRXOpZmnj7shcXO9XYHLLZ/XcQqv7Wurkdh/E2CtbHfhUnsrYIGDYKW9oAaEMWUWPwwquCZAPjGvkwY7tXnqWDQl2q13ijdLs/7lxLBRfjGLaPtDq4Ap/cJi5QFEwik6lW46UMSSJfLR4858gOBCizkXPUEO2iZ8wbzoMbKgcZ21r46qZR5zIpjaVYjZH4Fgs0dzHv4HwcDBSQ9R2J/HTCsobCN1Oo1448IVam0FZR3zdDjOYi7BjVmOfqKKtOQ+Z6Jb5gT5cgAbbDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=us9FOs6isBxAhm2YEbfpI5UkZfPGie5ua6+Zja98l/w=;
 b=SH8BBR21QmrSI9soks+Jij0So4mpJLmRDWeoWsSerHGLkAIdyaG6GFzh3HBWPJRr9XhPgNOgd8xIbuyilA9pp6skWjHq/Dbnr50U8YgC21KBIBqWtv+MKt8ZFBviptUP3/eMdgLTV+RaiOGjWLc0Z7AGGg0rSfy8b3bkri8/J44=
Received: from SJ0PR03CA0081.namprd03.prod.outlook.com (2603:10b6:a03:331::26)
 by SA3PR19MB9696.namprd19.prod.outlook.com (2603:10b6:806:495::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 12:58:51 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::77) by SJ0PR03CA0081.outlook.office365.com
 (2603:10b6:a03:331::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 12:58:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 8 Sep 2025 12:58:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7E002406540;
	Mon,  8 Sep 2025 12:58:47 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6717E820247;
	Mon,  8 Sep 2025 12:58:47 +0000 (UTC)
Date: Mon, 8 Sep 2025 13:58:46 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 07/15] ASoC: SDCA: Rely less on the ASoC component in IRQ
 handling
Message-ID: <aL7TBsl6ZUGIRKqB@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-8-ckeepax@opensource.cirrus.com>
 <1026f2d4-cc5d-4824-8828-1e129e44e6d0@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1026f2d4-cc5d-4824-8828-1e129e44e6d0@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|SA3PR19MB9696:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8c5553-5a07-49af-8197-08ddeed774da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mKNxlhGangv//qbtAFixgTRc4n7f26KGggs2yPtT5gLvsitQUXTbWkFIv8jS?=
 =?us-ascii?Q?HfuKrq4q3BjHsPJOdccPyT56LUbDW6DP6Z2yRipt4R6YzYvdspRjGlbsp4Es?=
 =?us-ascii?Q?NnUMEXLtM2G7fXAGAE/t7ZWpyKcxGLSRHZuvII5TyAcyTG0CwVl13uQ0pJf8?=
 =?us-ascii?Q?y7Rf53F8pHuFzQ+p84y/fTWPY0d0IueAMqhhRlCf9cXaOVUPr4RJ71ATSwPu?=
 =?us-ascii?Q?R7+gfHvIvsXc15VUl4zGd/V5F/Ht7/jg0P92DYaSgfIvEPaefyj4Jyqehnei?=
 =?us-ascii?Q?033vDNQ0rxS54uRQbzxHsnpQriG0rXikPtSG25c3/6/EXLYGf1pKpwCYlJK0?=
 =?us-ascii?Q?9xcOVpBv4QYFlxptHlTsghG1I+0dfuC1c9+BLjQdSYJJ7ida55nKamDvsHBU?=
 =?us-ascii?Q?G+TZZpRa6A4h1ayLJlf6ZOpLE5c8xZFlm+s4QCRyhgGMfdQ/P45obIlG2o98?=
 =?us-ascii?Q?r5pAtqmryEjeKDoNztLMgYjkKP/6EOS1wetTd2HmNp8CHE9cRbMq2zNGPDhS?=
 =?us-ascii?Q?i9yzIABcqUUC9xN+vPXPH6qJT8fmouXFwRt2IcG6sExjB8C/W1jR3IwH9Jlf?=
 =?us-ascii?Q?UcfKVuXlwu/empGKjS1QnqCoH41AA+Eq6+dejWwQQfSXFuz18mqDlHUNaL71?=
 =?us-ascii?Q?w0FRcGXX1SRIR3OCpHdDYVmedw1wzn1iYScrGNWGhHxqgo2ZGOkvhQaRPiko?=
 =?us-ascii?Q?M0s9CLpZ0zEHe5bcQw/80krT8wQdGMyXDAJP2cmwQBnovI+iaQ7ddI2KPOq1?=
 =?us-ascii?Q?zreFVVyGqiQTmHIofSGany0pEChKO42RL88woQHaTMRDsWcGFHFwKdnaB7G8?=
 =?us-ascii?Q?vMGXXQr5fHIw+4iv8aaHlA8AKC5K2SikX0wqrLTqKG5eyjfnojEMhxNnq6md?=
 =?us-ascii?Q?fyFPx/fHSBuwPd2LCcI3ssWDyf2JFt+dkjt9zk5jyPs3Nwb8E4t5cD3oOt9G?=
 =?us-ascii?Q?8VSr9n2Y2gRiKDCElsmzPKKp/qyFoXKsAM9wKjhMhYGQJSH/yfCqZnPBOyt3?=
 =?us-ascii?Q?lzoBeeRC9Dyue+O50mNwdYBJ6s+TzeFuXaQwzpD70ofQWMrufLwP4cuKV+bW?=
 =?us-ascii?Q?WOoVAxtc9S3pVvmab7sNNPeVkuLw3ZEv4EvgPz1gu+SpGEc03bst65LEoTwz?=
 =?us-ascii?Q?mfjmcspeDAcgMOJP8thELTW0k0hAeGNghCY7r1SvCPKMJjqJjzFCtHPnIi4O?=
 =?us-ascii?Q?SCXxCtQncwbD0FmHozaddqkbg28DKzYYyMjaiF9jC5GIXpbUpD9qIFBkuqTy?=
 =?us-ascii?Q?O8yhtXdP3BjEk7MdHcRQxwT9iQrKsFDdl512FvS+HoJO+KDvNgZ2tPONWjAB?=
 =?us-ascii?Q?MycCLd4t3BKHjdQluYePlVu+YAPRd4LxldOcY0rEak4rm0rA32Po/qKTFQ9E?=
 =?us-ascii?Q?gKpt24Ugzjy0XAnuzVkRGeAYWAbrlfG8/+t4rn7J2JyJnI76eRA47EEEBdQl?=
 =?us-ascii?Q?2rSqHi2UK6TMmT2m0loULufHkojYLiuI1TfiCEQRxrAGlzt32kC8Gg5hKQIT?=
 =?us-ascii?Q?rtCPZ2PVHAnnBduP5/SURLcEVDCfVY7OLPk6?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 12:58:49.9042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8c5553-5a07-49af-8197-08ddeed774da
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9696
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDEzMCBTYWx0ZWRfXxhBj3tmfsOfM
 9U73HtPrTvodnxRY7x0stzmTvon/wdRUBs+HLbuA3DaWUsFx4AnBoJ3NnyMPLvjVmdxurOVU4N8
 I82DQKdWnqENAjXCCqfld2KgCX4+dylquSwwzhQqtYgu1NGMRmXSADfIrGt8n95Gq80Dy2GUfFu
 xVDj4k29H1L+WHy5S8OnplDyWYffysk/cvmqtP09ehymroT/O3krgQmowR8hNlFICKM6Jqe4I15
 PQRTRtu42UKWrHaVIRV5XFfodOkDZGZkG1oElnQzUIVfSeJ2hqWTkViC/rqeknopfExH68CK5pr
 JENz/vuM1OqwKbQhkQHoLOatIMMYm6DAdox2WQ78MwCTUJ2D00uTAPAdfp6LGI=
X-Authority-Analysis: v=2.4 cv=L6sdQ/T8 c=1 sm=1 tr=0 ts=68bed30d cx=c_pps
 a=jJZ4UFFBHWlj+5JB8Ksa9w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10
 a=xYchQNRigUSTisd5TQEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: WFCKPWDeF8S7qfeqxLFqEFmxg5DddeP_
X-Proofpoint-GUID: WFCKPWDeF8S7qfeqxLFqEFmxg5DddeP_
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 08, 2025 at 01:55:21PM +0200, Pierre-Louis Bossart wrote:
> On 9/5/25 16:31, Charles Keepax wrote:
> > In the future some IRQs (mostly File DownLoad) will need to run before
> 
> nitpick: I think you meant UMP interrupts used e.g. for file
> download. I am not aware of any interrupts for file download
> proper.
> 
> > the soundcard is constructed, as such refactor more of the IRQ handling
> > to use raw device and regmap pointers rather than accessing things
> > through the component.
> 
> Maybe elaborate that these interrupts would be used as soon
> as the actual SoundWire device attaches on the link.

Certainly no object to tweaking the wording on both of those.

Thanks,
Charles
