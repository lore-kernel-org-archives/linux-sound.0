Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D7C3002C3
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757335134; cv=fail; b=tgOqF9mmRZKZYnsh6M+a3gfEfLqIzxdAplJg/YkFnObIHfcSXfIqoIfBp6S7p/5tiSCrYwVVEm8VSWPbL9B40H2RS3PNZTbwLhAZvxMeVO7u07JpGolNhRhhf4RaQuGPAgj9iqakcC8QjeyBQS1QwcHrCLqW5lSC7G8KHx6yJgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757335134; c=relaxed/simple;
	bh=q2AN5RuVlbGsb31eVFWyFxFcUV1FNxrqug9Vgn5Z0ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRmYWoakm+/U1p1e3yHTkvo9KcyvORrfvwAW/+nxsR87p0PYJq5/XfYh0NbZL4djCYnTebUjjXzHrrsHVo3Iwd+WAEFawG2JwoJqweqWYDQqhgn4gU9ZS5DVLPiFnlulQ56jRe4UZ+63wpDa4FLKpzopMOCsmseaNg6TpqFtjMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fEIzPUXi; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wM6KyI+V; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fEIzPUXi";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wM6KyI+V"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5888V5uR2152784;
	Mon, 8 Sep 2025 07:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=olDl8daQhX8yAd61yS
	9pmHa06hxt441hs9nMcFA1hyI=; b=fEIzPUXiy/4qA/EgRzFUjAknrli6CrUS8T
	hRmdQKiiBL/6b3+OV7c2w52Xuj2wLVx/zpWYvblFg2mtKNP12MrGOzL0QUYC66tb
	IaCjXHP3aCshfjg4u16c1cBiM2AWvAtFIpaILlhpMmE/Rg2Rxtw73QViKNJJEGpa
	/gFmKbHUq+3eYRUDH0NZ1hc9lhYJkNOdUDneWDugptVF1BpU1N3LeNwtjKl919iH
	AMeeA92OOtrEL7o7LMdg6RJNnj7vma6ICtjgY6t2Hz7TbZJYJDALQA8pMSIcUSv3
	H+anzMfiOLnX6+HbrIfGRA39rrBytjJjrRDTnRH3MNWwpFprEv5g==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2139.outbound.protection.outlook.com [40.107.243.139])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 491upq87kw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 07:38:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsSm6HxUN41w9uee+KMht2ua8n8cyx09r0CIxDRzrDS+JltcKbsxxnfidwqEV8UJja/v0S1rWPAzAgOBrdAag+sZSL13zMvDQ9x/Np6DUESfnY76JPMhnoEAnDtRWlGgUIJI+QPDgBRU1AlHjo9WccD89ZC4HGDBbaB6f66iFDsBi2XjuucX+SGFFjYVJLr/BSXfiMPVflA2+SB3fvOBG+L5N/6NIEB4Cpp5CauH3kbmm9D+zYB+q2t66/y4KGe6lpkIpiiv1i1DNK08ew2I7tFyThM99NxnLvcL3bqgh+VayWJqr/yNpOLY30h4fzJ8f8712uB0RUz8KgJhbF8+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olDl8daQhX8yAd61yS9pmHa06hxt441hs9nMcFA1hyI=;
 b=KWjdO6hTq3DF3DytD3LU0ocixZ+kTfRKPkotewhfCLA+LCnpfQO/aKT9LznCnjJJYze0Cd3bSe3BEOuNlgfMtNFNckr37JqWqFQcHXbmhiLmltBD09ps0SxJyxOwrC5T6cWL2SmpnyZuR2XJ4ayyufj+ohWylxNbeW/NbaF2u7fTeJbFYqRdOYUo1i8oygcmECoz3DzKqgCW9uNDyWFf5qG+4ckef60cMgX/8DYu1l0qhOXRa5ZlS5+/6eFUoe9GmwvSPwLGcf2G77SO9r0BmQlUX5b4cA17XVaje9ubLZ9kTzWYYW5ePmyJLzVMpKdQ1wZgbv6ASQVnESvYvCfzsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olDl8daQhX8yAd61yS9pmHa06hxt441hs9nMcFA1hyI=;
 b=wM6KyI+VYHnDuP8FzsvDTS/pi9IPcRClQ6HWMH38GVxH9wTw6iqAnFldXx5oPk7j3DiImzAUA1AN6BAgaw3krOMjJFXVnI+2KZaF6imvB0Ps6l1HsYRAc1Gn3qulRN21fK1Ez+UeE3FAefoRsD6/kUrMkAKpbj9fFBAuMnqgPJw=
Received: from BYAPR03CA0019.namprd03.prod.outlook.com (2603:10b6:a02:a8::32)
 by PH7PR19MB7384.namprd19.prod.outlook.com (2603:10b6:510:274::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 12:38:19 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::c9) by BYAPR03CA0019.outlook.office365.com
 (2603:10b6:a02:a8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 12:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 8 Sep 2025 12:38:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E95F5406540;
	Mon,  8 Sep 2025 12:38:15 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CFD94820247;
	Mon,  8 Sep 2025 12:38:15 +0000 (UTC)
Date: Mon, 8 Sep 2025 13:38:14 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 01/15] regmap: sdw-mbq: Don't assume the regmap device is
 the SoundWire slave
Message-ID: <aL7ONoJXdQ3Z/Oxl@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-2-ckeepax@opensource.cirrus.com>
 <efb5af23-c055-426a-bd7c-888f5983d868@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efb5af23-c055-426a-bd7c-888f5983d868@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|PH7PR19MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef16833-fbd4-4169-8927-08ddeed4965d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?otPcdegDw+HXHxoNbS6zhfH7wk1l9zky7pKnKYcMEA3koCLg7Dijj2fHoxtY?=
 =?us-ascii?Q?MGxwSupYe+iA99XLK3Pq2dEZuZMRkEZ1ti2SKSLYpN1/0wfv1M3F3W0CtOIY?=
 =?us-ascii?Q?22lN7AC8pJ6CX0OGYIyr2xgyeLdYnDZRXVaIn639S7LRB9w/tWIZL0lC/HUY?=
 =?us-ascii?Q?tEUbYu9lKl1ErJRbTqbLm/Yy08vTtt/dwBsS4d9prwzi2YL8s4QbnWs/W/XX?=
 =?us-ascii?Q?/j1qqjBqY9GuSAGFvDPp7my1EosKAjN0VHBFIj9/0NmtG5lhQUQFyjg/ptGR?=
 =?us-ascii?Q?uTN2VyDxrO36NvWE1ZH73ZpeMKb883qSfgyIkbtRfiOoMUFMYOCm6i85MQN+?=
 =?us-ascii?Q?xTh20mZSLDPntlsiV8H/DNNzoOcx/zEpFW3LxQfYdH9lMle9qtcH5j7fX2kq?=
 =?us-ascii?Q?cge0R2DLnaZcjGMQYlRM31kYlUW2kZ5LGgxeMADDluKL/vpV6Mip3ZJ2xhC2?=
 =?us-ascii?Q?QiifjTKqrG3f7L5RGz7PuovD7Lgc+8SlWUGIOt/gvNhz9Yy1Eo/g67+HNUsx?=
 =?us-ascii?Q?UFoFHlCiaZPxXvpB8mGz2qfYP3vNc22t8PzNxfTQ6PJX0iMRFGsaubZRcSKs?=
 =?us-ascii?Q?GzPBY5NZSgfdT8GJBeC1/JUBdiMesk38muggHanpNLZ9QLhGe3/KWIiLHPvx?=
 =?us-ascii?Q?Hsgmw/mYQQwpfwChA65SxgRLlb4EFoWAJQRISa8vKkO08rxQhGKMJmi9UDbL?=
 =?us-ascii?Q?+428LldssGvMwrPjI8z/satTWDB6C6ovpH0sF76h6E9Czwj6+sdMcn45IYfI?=
 =?us-ascii?Q?YnbUAsxOq8V8Uj6NeOIypSjal2JQsBQhYfzcy/0wIxteViZSL3H3IQ0upKtQ?=
 =?us-ascii?Q?nxNfrXna4NBwAKCHVCvMhWLKGQFlrHEvTw+Py2+KXtZ3zkpQa84nKO9DnpOY?=
 =?us-ascii?Q?R+kwsB6WvqHmKYdVxD6APiD5Di0fDI3WIdK9vI68jKhgB7Y3llUdkJ/RkotI?=
 =?us-ascii?Q?A6g7lUHLsk/ginzoeb0IkdTzj2n2MLyiOhJAnZXWUZA0kv4lYKhyHXfmxqR3?=
 =?us-ascii?Q?elc1ZRMMNW6hia4raBMKfkyhU1dEaegw1Flk2vw3nml4SvFweVtOc4ZX7UFZ?=
 =?us-ascii?Q?CVXB3m0QLaHAhk5FvNds7VCV4LHs2K2KQ6UvFlcBkXnF2ahA4RU0aAOs55pZ?=
 =?us-ascii?Q?8XhEMVzcqnWexAAsWzSHn+MXzudtF2kifqsoSwGbaFiNnLKB888BUoS4iAto?=
 =?us-ascii?Q?ARtCE0Xuc41zbl8K3J5IsWFp0gnNFnjk1T9r61zDd2XKkFzXl17uLc3ri+m8?=
 =?us-ascii?Q?NzU0s90RTSCY4rxwRr+4MFz87Y56kefOpRvzfgdJnXC8PNGJTVenGnOw62Gc?=
 =?us-ascii?Q?CfHhZ73yjPfAcJdUKRQfnS1pLrlF1ceBlOTbGeP/dfY2+wJuvGGjojFFkypq?=
 =?us-ascii?Q?epIenwxwIRf5iBdAQOOlUUPRAEOyhaoX29RACVsxXnC/ykHv3mK5hvEzOUkX?=
 =?us-ascii?Q?KAONCJ3SnNYJsGt9O/kpkFxN/1bI1k4XUUHP0NC6qP+uFGVapNZnE3jzkdne?=
 =?us-ascii?Q?VXzL/8OiJfEd8Ak/wuDe/kci5RKxZTcBV9uC?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 12:38:17.6229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef16833-fbd4-4169-8927-08ddeed4965d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7384
X-Authority-Analysis: v=2.4 cv=DMuP4zNb c=1 sm=1 tr=0 ts=68bece41 cx=c_pps
 a=WRu4cO6RzerQPdfMOIdFEg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10
 a=RJds5ZGsK2u0GVmbWGIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: otPdHsIn_Z0iWo5saHvilChRjHzqMvjj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDEyNiBTYWx0ZWRfX1DhCtX7WX961
 y7yECr+UXvkl2AemFnQV91fCn6NQghBL0kBgfBVpZ2DEgUc6VP/dK3kiE6//AmSlgcJiEo2ZD1B
 kHMpHUklEAKEladaUIPe14R33xE/ARWYQYL9RUDmMvV2nbqK15xrxO1n7K8YseAZPFUAyfCACU3
 6SgZdmiQQnACE+VgFi2OW5zWpFIAiX6HeYVbCAKcAId2IBtu1Rx7xvZqGSy6g6+NpDOT6pKT1LL
 pFKKLfv3JI0QYTbW16d6S/DcYMidXbRTG7c4Y9Zvvf4KYFow8tVewdWN4Gk/EVCr4/jhundpb8f
 ZiN6YbELe/Ih8NPHQ/zEFEW0xR6zkldBD6D7jD9VYGNi8RTJabPBRWbGLf26So=
X-Proofpoint-ORIG-GUID: otPdHsIn_Z0iWo5saHvilChRjHzqMvjj
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 08, 2025 at 01:35:44PM +0200, Pierre-Louis Bossart wrote:
> On 9/5/25 16:31, Charles Keepax wrote:
> > Currently, the code assumes that the device that registered the
> > MBQ register map is the actual SoundWire slave device. This works
> > fine for all current users, however future SDCA devices will
> > likely be implemented with the SoundWire slave as a parent device
> > and separate child drivers with regmaps for each audio Function.
> 
> I thought you wanted a single regmap shared by all function drivers?
> Maybe it's the wording that throws me off but are you now leaning to
> have multiple regmaps, one per child device/driver?

Yeah I think you convinced us about the regmap per function
thing, so that is the current plan.

Thanks,
Charles
