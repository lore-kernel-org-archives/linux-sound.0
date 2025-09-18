Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC28428137A
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758190775; cv=fail; b=XtzwMggD0RJSh89QFAwpoxJ93lDFqf5fSqdno6E2KwYXHXLZBoIqHgIHTnSdcjoUBf0Ksv2Z1PDCyuav133cIkDAnBM7Suc7HAZ5zvMDc5I+6ewD1ZomiZIrGxAQiqPBvBPco1mxcR0oW7j1GqtqBC0Sf48nEgs9W9+zDJGB2WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758190775; c=relaxed/simple;
	bh=+3mdeDELHddHMj5WMnwmDdNxkzdabuG7RFwjEe/uzsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7Q+hEiFZYvkRPULlsgAwapJ/mpfc50zZ8f4vYwhievm9O0tES3tZFC/eQT45n1uyVFPeml2umpV7O+E3HVHKPTIUUm33AytW7d5A+mR87X/+BUgY5nY9txXzeMfiJm4eY2dwGuq4lfrAY0Y5hjy9AZHpLxumq7TNsE2IS3QGWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hOo+Ct+X; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BoNd/t/L; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hOo+Ct+X";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BoNd/t/L"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I9x4Sf1775648;
	Thu, 18 Sep 2025 05:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=FuvWAjAq5A3Syz9wcw
	dTXbDPwhvUfvNyBUCBqlje7RM=; b=hOo+Ct+XnfUoSQ+1/fAjIjmvhpovd5zZD7
	FjI9Tw6PiEZRcmDk+9UtiiCw4B1Cq35T14e40GoDZDGm6sQJkPJ9+30fltoWvKxH
	lmMzUUQMAp8Piq8mgBKqEfPYd2AcCYGzFC70JAXEYAymL2dyELN+Pg3OgUrooPAw
	WGJqUsfblyEH0t33AB/+IX9l4nM5+UBOySt7kynXZy29//uewXROAlqmc7eDY58v
	W2unqxBK9v5sdAqNKbWufLlVE/XLjHoreZ856iUzSW3vt4q7AHS3sw7+b1Ux0iQb
	kWkdBWlMa2IJJu9o2OR61Z1Gj2sjaEJTjoLfeM9woqs3T1gzm4+Q==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2130.outbound.protection.outlook.com [40.107.243.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4980h694vy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 05:19:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwLyLSeNl6naM/sdBSnve+Rn+gz7C7eNA4lz9ZzObWQ+Zu1HrE9HkcS8aY7CQku8jaLHF7iFJInTxjGV17kGjozx+wxBkHgtyM0L7ZXZMvf5BfRk85GHHuxJWeC34ZzQL4TjNTCLuqhKnFZG9QdMZs4Izepd81gkw7XuuBieIRhI54l9P0FwphOmz0i7OrP7Ft/ghL2zaOkicsMfl0Pw4SlaZN6AhvCq7xqF9Zv1xBq7XmSSQX45czPZdGCuOVNVQhQrrdxs/VzDJo65Ue5IwHGbkUlrjDO6c1Q9rMqjZOpVIBZAJLwbZM6cAL3Z7WIyUXBMnVyU7cOhzC/Y9qcuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuvWAjAq5A3Syz9wcwdTXbDPwhvUfvNyBUCBqlje7RM=;
 b=aSCHUcwlxCF+hdDW9979v1qtfKWkG8LiBHFE9FGhgP1qqwU2bCfUwwLIxGTQUK86EJYUGWV5hwEw9uoK0wrfJdUfOr4AVOoBpAbG3laoT7bD/awciIg28nzvlMumDZRHN6AfrES+LKNSZQ0FIAiWZYEoBTxtl6p7SSRPA0uwnsFOD6FNHr3ySfM11nzg4ZGQUvqEGB8/0IFIlG7/caA1bbjnUThoqML5DQRySafIfxR++mLwqCp8LJP8/bZlv66Zs3Ao8yYKWdc+t3QjoP0ozXYHHb8YFHgK6osudVo/M8PSe112GNNsXA0bnMozCEcCumyg3piO9N8K9EZMD8GAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuvWAjAq5A3Syz9wcwdTXbDPwhvUfvNyBUCBqlje7RM=;
 b=BoNd/t/LvEc2fpD2rIuzXalBnliSesY5ESecTiYS4DyuUBqEc8uJ0XXKJevmgc/a1+e6ymHvePDZptfVryPvv1NmePW1T47jmwKvsGI7KLbwBdO32YZLVXHuZ2d9jaZxUxTdh4fcr3JoEooLdiqXL4sN5hqUrVdUxYsUeMQiO7g=
Received: from SA0PR11CA0019.namprd11.prod.outlook.com (2603:10b6:806:d3::24)
 by CY5PR19MB6364.namprd19.prod.outlook.com (2603:10b6:930:20::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 10:19:01 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::21) by SA0PR11CA0019.outlook.office365.com
 (2603:10b6:806:d3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 10:19:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Thu, 18 Sep 2025 10:19:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B6468406547;
	Thu, 18 Sep 2025 10:18:59 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9B80C820247;
	Thu, 18 Sep 2025 10:18:59 +0000 (UTC)
Date: Thu, 18 Sep 2025 11:18:58 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 09/19] ASoC: SDCA: Force some SDCA Controls to be
 volatile
Message-ID: <aMvckvvfNP86svKe@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-10-ckeepax@opensource.cirrus.com>
 <893d6efb-14e4-4b1c-b114-dda207579bca@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893d6efb-14e4-4b1c-b114-dda207579bca@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|CY5PR19MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: a7184997-87f8-49a4-e7e2-08ddf69cc975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U15D6KiPvbuVU1TUOMM23vQlnxwD/OjcTEmfmzwnqbHQp0uVytJenldeBWy4?=
 =?us-ascii?Q?47Zg9e0WMbEA9TR75+mYmMKhC+OEIYe104NVrBQ8JOg533SziAEBLsrXJsfZ?=
 =?us-ascii?Q?EirKJl/I6olnOTGcQlkjt3PRzSLsZ4GDOfAb4Iu5Nq1DRmeiPf3huTFVOpfA?=
 =?us-ascii?Q?UxBRKNMmiTuuW0snlBFkNk4vkqWlkFrZktUGHG5TLx4kDBfcSR4ZljnNVaA1?=
 =?us-ascii?Q?MOEKOsW7qee4vs9xpVx78gHHZnRmIYt1446xJwGktVeF0rCCXC+PhQXTHQHn?=
 =?us-ascii?Q?PqeBF09rzxVmSQ+Y6ccV+RV7sqt/7VkXC9Zj9YeE8c8rio0c+hPRracK/4gf?=
 =?us-ascii?Q?04+D17vnbdQ08TwgGsqpxe2IeWdCzyZLQRNjp3BjBu2NOcgURGNjTUciGVGj?=
 =?us-ascii?Q?7wZ76em70qElmJEhsHNpOJOUJeSd2OVo9RooS2Gfu8xsxTvkLzf5jw1h5MQS?=
 =?us-ascii?Q?9CaFU5wpeUXI/uCouI9f8ZAOER671cpDs/zlSpjyc+ZOEZgyztVnfrjol4Ug?=
 =?us-ascii?Q?oqairOyaYrqbyjSoZS4ZilHlQwabgMcuGppviOplrsRvAlIyUHwVFfnd/gzL?=
 =?us-ascii?Q?ZKB/wWbuTwmI4syuAaqWfigp7wO2KQWPRU+SIpE1VPI6PI33YVvq8izP2aiK?=
 =?us-ascii?Q?X07+TG2PcTjwet1gW6Ydf/hd6nWEhT6hzlSGKhsDtDRF9EBk6u10eJ9ucG42?=
 =?us-ascii?Q?JQLAR7QpM192isqp2pp4ljqNLwoBOCuGArzqMbBclCUu81jkzla5XVz0ejwI?=
 =?us-ascii?Q?AFxQ2YBU7TM9v82AWq0Y2h54xoFVgf+8yCnuOV084S//cX3J6hK1PJj4MwVx?=
 =?us-ascii?Q?Xx94c4ysXaPuUHkggvLWn6JaZPYX0Yfo0Ca1hprBUBtmWueeSkgXHZA2Zw6E?=
 =?us-ascii?Q?kdjcQmptH+Sl1X28P9i5+J1UHyYecNPVm5N4R/DHVgS5Cu1jCQugAceWbGR1?=
 =?us-ascii?Q?w56TNSs+ctnPqlawf//XAI0fwrV27vZQsf9OWOWcJMu+0Ix+45EeaeYSNvlm?=
 =?us-ascii?Q?VaDEPw8JgPQx1HWD2Q+kHwEoEQZ04RJBVLU4RQePVkhQLR/o1hOwchEOqWuG?=
 =?us-ascii?Q?EOVvcoH4Ojt3JifV8AR+J6R8KUr6u0SFiQvmTu+ca8k+yCcZArqhPFWmc1ec?=
 =?us-ascii?Q?LsBZX+lkkd14YmoHC0Qj+krg+mb/WRJlyqtOCQvn1HfFXCc+hswcK+M+PRnT?=
 =?us-ascii?Q?IZ7/fvT2ACag2XztN5ZBrHqm3UQy+dwwva4tF/QhncxARTr7VE3yVALPDMPm?=
 =?us-ascii?Q?Hq7Ec7ipGFKS+A9A6Jaz4p/WOkPIUgs3llgoQBe3kxAo7Hk0CNaEerjkc8Yl?=
 =?us-ascii?Q?wwu1DeGMmP2rhTCK8P8ouBR9IKFQzjpQgWroejkcyP228Mg/q3zf+5m3/7A3?=
 =?us-ascii?Q?3KBb2DtpZNUcL/5QcLA2T/JdH5KzsU48n3CgzwJJ6tXxDcsoa1uwEZQmmsrI?=
 =?us-ascii?Q?+rjMqiS8sYciQuGBvgBoP9TmEDbSLtuX5BkKHEY5kfDhScGCffd0exe0sUQg?=
 =?us-ascii?Q?2lwGlS+XGgexw1FK9Ab53HkPfD+NdpR/4sqr?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 10:19:00.8914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7184997-87f8-49a4-e7e2-08ddf69cc975
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6364
X-Proofpoint-GUID: 8GUWRzgl320zNnVZXAYtEF7t8pV2BWQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA5NSBTYWx0ZWRfXyGuUTAQfuDdH
 vd1CXBoVF+73OAh7MvxhTlUHpnFmmKQB61yj6/OW2IJ9YIrQUqMfrEq7qo1ikAWY4tBCJSXIdOl
 g04r6+Vp+ESHgvJyo7IwE09nXUjDck3+YOyEJXx+RB1q/wlTQKyIdsVrDkwH5P1RSpluCUIpOQL
 EM//naP/nJp0c5lXjLeNx5LN20JhKdXKsxpFtLO9oQUGOsTVokCFYcqWxxPHnkInur6CCymQBmW
 ifLQE1Q/myZT89L3LGjjWRitDGdE390JR0Z07iSjGtsvjXo2cTJJGxFnHQp0D9kY61EGy/ZzbMt
 4mXmeGKJ9RWg0AAwiHjCFPhL04lN9rtwILzzRgyMFa/KqsLwo8i18Wmq8KG9Z8=
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=68cbdc99 cx=c_pps
 a=AkQMgfLE9l6RAPU6jSJUeg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=iegA-UQ8chVO_Mqam4YA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 8GUWRzgl320zNnVZXAYtEF7t8pV2BWQ8
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 17, 2025 at 08:53:04PM +0200, Pierre-Louis Bossart wrote:
> 
> > +	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
> > +	case SDCA_CTL_TYPE_S(XU, FDL_HOST_REQUEST):
> > +	case SDCA_CTL_TYPE_S(XU, FDL_MESSAGEOFFSET):
> > +	case SDCA_CTL_TYPE_S(XU, FDL_MESSAGELENGTH):
> > +	case SDCA_CTL_TYPE_S(SPE, AUTHTX_MESSAGEOFFSET):
> > +	case SDCA_CTL_TYPE_S(SPE, AUTHTX_MESSAGELENGTH):
> > +	case SDCA_CTL_TYPE_S(SPE, AUTHRX_MESSAGEOFFSET):
> > +	case SDCA_CTL_TYPE_S(SPE, AUTHRX_MESSAGELENGTH):
> > +	case SDCA_CTL_TYPE_S(MFPU, AE_MESSAGEOFFSET):
> > +	case SDCA_CTL_TYPE_S(MFPU, AE_MESSAGELENGTH):
> > +	case SDCA_CTL_TYPE_S(SMPU, HIST_MESSAGEOFFSET):
> > +	case SDCA_CTL_TYPE_S(SMPU, HIST_MESSAGELENGTH):
> > +	case SDCA_CTL_TYPE_S(SMPU, DTODTX_MESSAGEOFFSET):
> > +	case SDCA_CTL_TYPE_S(SMPU, DTODTX_MESSAGELENGTH):
> > +	case SDCA_CTL_TYPE_S(SMPU, DTODRX_MESSAGEOFFSET):
> > +	case SDCA_CTL_TYPE_S(SMPU, DTODRX_MESSAGELENGTH):
> > +	case SDCA_CTL_TYPE_S(SAPU, DTODTX_MESSAGEOFFSET):
> > +	case SDCA_CTL_TYPE_S(SAPU, DTODTX_MESSAGELENGTH):
> > +	case SDCA_CTL_TYPE_S(SAPU, DTODRX_MESSAGEOFFSET):
> > +	case SDCA_CTL_TYPE_S(SAPU, DTODRX_MESSAGELENGTH):
> > +	case SDCA_CTL_TYPE_S(HIDE, HIDTX_MESSAGEOFFSET):
> > +	case SDCA_CTL_TYPE_S(HIDE, HIDTX_MESSAGELENGTH):
> > +	case SDCA_CTL_TYPE_S(HIDE, HIDRX_MESSAGEOFFSET):
> > +	case SDCA_CTL_TYPE_S(HIDE, HIDRX_MESSAGELENGTH):
> > +	case SDCA_CTL_TYPE_S(XU, FDL_STATUS):
> > +	case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
> > +	case SDCA_CTL_TYPE_S(SPE, AUTHTX_CURRENTOWNER):
> > +	case SDCA_CTL_TYPE_S(SPE, AUTHRX_CURRENTOWNER):
> > +	case SDCA_CTL_TYPE_S(MFPU, AE_CURRENTOWNER):
> > +	case SDCA_CTL_TYPE_S(SMPU, HIST_CURRENTOWNER):
> > +	case SDCA_CTL_TYPE_S(SMPU, DTODTX_CURRENTOWNER):
> > +	case SDCA_CTL_TYPE_S(SMPU, DTODRX_CURRENTOWNER):
> > +	case SDCA_CTL_TYPE_S(SAPU, DTODTX_CURRENTOWNER):
> > +	case SDCA_CTL_TYPE_S(SAPU, DTODRX_CURRENTOWNER):
> > +	case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
> > +	case SDCA_CTL_TYPE_S(HIDE, HIDRX_CURRENTOWNER):
> 
> Maybe reorder these cases by entity type? or by control
> selector? The list above is a mix that doesn't seem very
> logical to me.

Yeah I will reorder by entity.

Thanks,
Charles
