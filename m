Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A523232E6B4;
	Tue,  6 Jan 2026 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767705934; cv=fail; b=F4mZqgSG1FrYSgJa1CMd/cmNxT6VkyU4RroVzJG8jVf3c/dQEo//oQ+SVgNwjA3XpL56YWH8Wl6yP5O9DYVW50kfvxxU/vmyq8LbJ9dm9SibXR4nLMkshuxoeJqzrqlt9WF786ANk9POiGwVPUaoxG4jQtHIa0+zuNpNCazkjbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767705934; c=relaxed/simple;
	bh=FdUMCHTb9ppAlq/Sed6SF4NJCiXLb2XxIJt+AxM5hrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOavFlbcgDM/TWNh5sQqdc6ZXP8lTHlB5iGUVcDL5oLN5fa7rFRd6ELKcPAro+9vpeyHzlvg+rqcS+8qpxxZh/MFjbK7wT5lsn/1Feets9lO4p7DonzFzDvafQvo3agf9G7kytoTvTCT+bPYEMktKPq2M+S6YcFhA9fJdXuiNOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fHYrHZMc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IiyQRFVa; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fHYrHZMc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IiyQRFVa"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066H6M4761065;
	Tue, 6 Jan 2026 07:23:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=CohxqB5Ra76yKM3uzH
	978TSzp6nAoE6UOnhtuCCBr1I=; b=fHYrHZMclG7GAapmxSazsT9S+V33kq9HY0
	vp4nyetV+hZ8MqYJlfbWnPcfe/Qj9gSK9ZXk8gHq7Igx4lGKm8kIBs1ExfT9NqsH
	lDcoTpf7ANXW6r9CA+v+7FR/tuVIokIfIyDy2no7lywoRZmYSxtwXCtz+mDEF1nt
	XGvcRbwvjjfOv/NIIbs6erGeb/DHqApGA2jjp3YslKSnpUW81oH85Dr5EhocCzSx
	hLgGVUcxxLOQ/kEYXWQA6ERdeHo9WEkRNPiLwPvvIvYy32u/CLaOF/hx9mlNanYV
	n/6c4CyqAmKJBDTU0/WfdcgCLo8R6uP2dDZGK1kBP27gWxVNzX6A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022110.outbound.protection.outlook.com [52.101.48.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bf1d32y4w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 07:23:57 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHxXDFWhSg1uoevM/OZCKK0/h+Av7M42uNCEIEVK92gpIsdKyC3b4diD8MYDSfTUOXEPgbzEVtrux3A9CeMZzZYIdVkp82nUr+ZgLFmJN9QdAS+cY6up5z597f4FK/mI8qOwRGn7YUheU9Voc5xpuZu7KI6hwSb9t3nN1awmMqe9awiV824A+KPyoYhHzseYbylYCtUBn79CdSEd9eibQa5CEZmixA15mhRY3wUQ5AGOxSZ2TJbanuxf0XHF3sKPGSZkwGx7hTYPrcmECr5PSIxcl3m5YS/mAnnwBeXfCqGoGhFxW4AUcjzy+BqE1v8U4D8f9WOpN6VyELNtFsdwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CohxqB5Ra76yKM3uzH978TSzp6nAoE6UOnhtuCCBr1I=;
 b=lYpbwOYAdfK7Ya35IH+0qdh1Res5iRBYD6BOyCKOzfo4R2itGfdH4Vl93JU27RsioQSy8eI0Pwbx6HxztgNaggRrQ/MNIdRfzCcuumHvlIfFFJlK1iFaOAu5rJKtCeWFbw8T2eUp86r0S5zuc+Dg951a3lssM4fxMDoQjV5/8GVOR1XZkOD8lAbUnvj/vcjnqmkFW/qdN29raDUovajweulck5/dBH2GaNNyk+CJuf/OD5vBB4w75FOqlvpTVi2p+Voz1/C1uFxoI7mDRvrepBgbYEpG6EWTIHy2lt3xHPmwuOopwvy+4BjLms/K23QsSBIpvaIxYhCWCdZR+cLSGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CohxqB5Ra76yKM3uzH978TSzp6nAoE6UOnhtuCCBr1I=;
 b=IiyQRFVacHGSYzTR7u8krtTppOQY8WYd+2qabIWxmUyTTeNY9TfjZgOLKovtp/gp7ZwAzwX/xaVDVfilr9Hf4HmbAyYGWcLe3ZemWhcEBTK4/v/9V/zGcfBAlHmWNeNUb93HyEjmfYPcsCMsVT+UulMZA++dfXLCqo+DquzXots=
Received: from BN9PR03CA0316.namprd03.prod.outlook.com (2603:10b6:408:112::21)
 by IA1PR19MB7688.namprd19.prod.outlook.com (2603:10b6:208:3fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 13:23:52 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::a7) by BN9PR03CA0316.outlook.office365.com
 (2603:10b6:408:112::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 13:23:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Tue, 6 Jan 2026 13:23:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6851D40654A;
	Tue,  6 Jan 2026 13:23:50 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4D050820249;
	Tue,  6 Jan 2026 13:23:50 +0000 (UTC)
Date: Tue, 6 Jan 2026 13:23:49 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Michal Hocko <mhocko@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2] ASoC: SDCA: Replace use of system_wq with
 system_dfl_wq
Message-ID: <aV0M5deGtAHqvTvk@opensource.cirrus.com>
References: <20251230143429.179643-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230143429.179643-1-marco.crivellari@suse.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|IA1PR19MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc50e9a-9722-49b7-d072-08de4d26d56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OHKo5asaBuoyWSh5k8zIxK/jVjsNMGKaFL5MNZPMXSDj3nC2ASZ7J+3LgbZ+?=
 =?us-ascii?Q?GQrtZtvKnZEt/42e9NwoJdmsdmVBHsjN7C02FKmwlT99i7yFUdqhZOhtsR7Z?=
 =?us-ascii?Q?jagU/8XAOY109vZi1MIk4MIerjNg0LI/UlyKiRsSL1lrPJGysXeggb9F3ZsP?=
 =?us-ascii?Q?PJgEqQZbMa+MckEk4Nptjr/A37FvnVE5n3cEeZJPjTh3Vzur7kNlzW5hVzPu?=
 =?us-ascii?Q?+15a9QvtrX/alm9jowJUomK8+4tgHfGZXUxtNS5OEbmanSg85freYFUSybzW?=
 =?us-ascii?Q?mnfoY8u+NZbqryalZ5SrFbqYevvyPxONfBiOUbfvCyAJYWBPchWvXxoi/3Lp?=
 =?us-ascii?Q?pUxbzqsS6kqRdshwVnAApAptz8DI/dToN29zRRa0pQ9M9WdAkfGGw7Z+Vxl2?=
 =?us-ascii?Q?SJ4ZIhs3ropFYR2lG5ro+sJsAPwrWc4FLS0CVd4M0Tis/6BBj1qtK1IA5smE?=
 =?us-ascii?Q?/cC2T6VlPywP6vUaRpT8WA7nVZW/Y7fHJu+NFX5SQpKC8v6bhlsPd6gXxS92?=
 =?us-ascii?Q?dq3kc3k6UIICSVm5v0T++xBXT6S+qpEzaFkKNyrWSFGh/Fw4bxp/uOw4rlRP?=
 =?us-ascii?Q?sVwDJ36V5uhtcVQpH5EWkK/IShJBYbNAfTa5Vbg78c1FVGqbb2srniW85Eey?=
 =?us-ascii?Q?sg+2lPpoGa2jRnGqoOoz5zPLJGfWjPJN/oDUb9zWfUHjrnfIHuC3NFW0QS9v?=
 =?us-ascii?Q?Hzg19rf9bQ/gOUqvChWRnB47Uia7Zdp4Jp5LeTpoT9telzCD07RzHT4rgV8c?=
 =?us-ascii?Q?RNe2m9gRY+9SjTkagPAx8tclqvDepgou9VljqzjQgKWn5lQXrlUdbWMayoP/?=
 =?us-ascii?Q?8mHH2GomhsfM/l947G+W+HhE9nXg5L3+vRzGogVMihdgKKIaC1mIA0QoJfqa?=
 =?us-ascii?Q?S2tfZeUfVPb4rn4x30Z5xKr90Avcwl6+kCerAoky9Hfi5kjM4Jcov6i5I9fn?=
 =?us-ascii?Q?4MnfkA0hYMBORYX2iWHFeEA0behI9MOYx/186Lh1rROJnS54gC2xD/ryZlA8?=
 =?us-ascii?Q?DBqkn/XWUNAYpIBrdljpMQlUMbpyKwfiJQ6sPNdPzoxO0qKM6k2E/+W3HjSQ?=
 =?us-ascii?Q?FELol6TkN4QGRDSAFOPw6lSpHRgMEw9bLD7acu5wRapypusNgaa46hSWo1iP?=
 =?us-ascii?Q?JpcbeoMPEKYOVKWYdTNlie9DtuiZN2CfFhZQOXWuCnAQ7pgWB/i9Hgnx/lq/?=
 =?us-ascii?Q?RN4AZFsLLcFoOXxO9b6xptnPTRv1baOVeMjnEJEmV1Y5Ig5Qz7S8NcEu0TT4?=
 =?us-ascii?Q?VzP9+1H8dK/YPo4PN9qjJkUC82UL5NQM7SgU1ja+/Ql+ExlpkRcygtiCeo0L?=
 =?us-ascii?Q?NMB94O5XaRmnZuRrjNW+BjO/aH8ioMaBlbeGLzvQmFiX6ACXB1W6mBkCDpyM?=
 =?us-ascii?Q?BZx4Fw4ygB4vYiwoFp/HRzMM4ryUgwnU02/RDKgN6yjpGDR+ZHTpP5e24ayO?=
 =?us-ascii?Q?7qxgaZYFXORAaS8WJoJjegByn3CXepbVB940qxbxbbBoPs7MNa1Tdu4OVV9z?=
 =?us-ascii?Q?yG3o3X2clRD3rflj8cIb0iivtD/cpgjw/F+zLMCCtXS6bOYpz0/s2B3HHpev?=
 =?us-ascii?Q?9+fNtchosQF/p7jk3uA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 13:23:51.5895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc50e9a-9722-49b7-d072-08de4d26d56e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7688
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=695d0ced cx=c_pps
 a=ylTaWg/OuTOBUQxDHB/KXw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=w1d2syhTAAAA:8
 a=EFlhQnycTdAuC0AJn-UA:9 a=CjuIK1q_8ugA:10 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: QGxai854a9pBlN6EU89G6PLmJbh_uNqr
X-Proofpoint-ORIG-GUID: QGxai854a9pBlN6EU89G6PLmJbh_uNqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExNiBTYWx0ZWRfX4of7DTU/4LE9
 XOzpJEjGP/7dKoQ0wvxJ25W2HjOFXwKl3YcG/1Y4egfHNzbY1sZJwMVonhjBHKLeS/nshmBK2dU
 n4olgxwyp6/6p3W53hGWLihj44TMl/wrMjVUMLl2ahtzQ1kI9wFSq2qK+9QgYxRbFgsHrjm3Q6D
 rkFU/AAVJZlorz8Z6RH+evQDnX3tEfgiOsDFMoPxR7ox0Fxw3NqFmlM87MgD7yHMbsqlgyPZr2q
 ysLrEi8iW2nfvNVgyWtly4Wgh55ZUEPx1OBNtJIaq6uUMGyJHxL9E/GXV9msuMnf3a6qvldBPSk
 s3zhJjSQ5kRnkCNEYHctgC/WTWHGMerQ4tFUTMtBUD01SUZnRk/OoLf5I56XlCNjGN+8mZ05aMh
 PUVjfXY9OfhJcGwTEHagnU10uQDmYVh78xvVXCIW+uIq+jZp9MDO76rujwnV4viVlV2gn570lKX
 1x38WdfucxUgBptypvg==
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 30, 2025 at 03:34:29PM +0100, Marco Crivellari wrote:
> This patch continues the effort to refactor workqueue APIs, which has begun
> with the changes introducing new workqueues and a new alloc_workqueue flag:
> 
>    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>    commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The point of the refactoring is to eventually alter the default behavior of
> workqueues to become unbound by default so that their workload placement is
> optimized by the scheduler.
> 
> Before that to happen after a careful review and conversion of each individual
> case, workqueue users must be converted to the better named new workqueues with
> no intended behaviour changes:
> 
>    system_wq -> system_percpu_wq
>    system_unbound_wq -> system_dfl_wq
> 
> This specific workload has no benefits being per-cpu, so system_wq
> has been replaced with system_dfl_wq (the unbound workqueue).
> 
> This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
> removed in the future.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
