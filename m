Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57EA2475E3
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771234973; cv=fail; b=o2jSn2Xd3HI8d78Tav3hSv1dRdZrFIyHIIJRGkqFp8tKm/H1qmwhx7VivTD9/10yDfKPd+SreQCXRmdizH+4einSZJXeVNXRM5aDktpzygdhePe082NU8TBDKMXasOx6M+eaMXkUObmQIVdSOLe8mT3BC8Mo6wJkbOPE32j04K4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771234973; c=relaxed/simple;
	bh=bhPzWkwS1fWEyswzXcO4dHoQt3efZRsTFcPsdzJ2CWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwGetp0DqNQxL9vq34sRQfA2aePR9B35cDbG6+/COIZRAhPpo23QceRNVK/vF6VBB4DvZlZwmzvNPr/bwTtRIrtq7h92xrXXa9iC1pxhK27Lu6q2nydD3rzvtXBPM1cU1rL89ddjABrIE+VkFIUgEKJkeG3jRM6EFXBzZ5Yea0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O4woIpoS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ivutUsdR; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O4woIpoS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ivutUsdR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8tAUq1588589;
	Mon, 16 Feb 2026 03:42:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ycY7arRuvqA7cMKS2p
	0r2GcFyKJUIy/d+p2Fte6Nc1o=; b=O4woIpoSpU58tntV2M7bs5dygwKI798uPe
	YvlSsyuA2JKcDf83YWeAqNdrIKrYlRaZTrR0LIV+H8WqRwa9uI1WVSge8tINe9aY
	/3R7nMc7GtSiM+UYZK2zs6qRl+BlOhie30+rKg9Pk/svff97kp4JbCEkSwrPJ9v9
	OOtsl18S1/MM/XDvJXBFhrQRGA0IKqqAjHLz3iae7W6Js6avuKVtAWKxayNcbuB3
	5g8FyAH+w6b4+fGmFembFw6O1Ub7je0TObJnbPC9xUknYJQxZsqrQk5ReVNuKChz
	fZXV49is3wbVIbANIMeV0+6rP3UKm6u5rVcTo5swSKrRJ1oSTf1g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020119.outbound.protection.outlook.com [52.101.61.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4caqb1h99d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 03:42:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+wDu4WouoR4H3YZtGX8wVolG3Zekhh1QMEGeD1uYrYKbsAX337Gbmxz+vFyCUvL5arXOjrVHaKtN+P5d5seBodKakYM8yLSm4MJ7JlxvsVIDCA6b1PQNIhYt/YpQrv1GfVwF2rgOhdcPMUnbZzJ4je2TWPDU2GwxwC0naVW4Mno8WD+xurvN30czET6twdoVEjeepp8qGM7MVrBtPHQ5K4dnMRj1vjFidaw77lYbtlWFxKlodWC9+FM9K9VNF9joPlVqlv6iT2IOkFu33VAbKwBKnmlp8hl6mRpYhMUTJ8865hYMlYrRmoOmr8neTOZaTda1ntnbaf4UsYZFoSk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycY7arRuvqA7cMKS2p0r2GcFyKJUIy/d+p2Fte6Nc1o=;
 b=MkP/pdHP0o9yrvSEV4JCHnWHV8c/VcJqzRduKrUZu2TQwr0j27E7ZY4Uk4sne3rUCV1kZIUP7F1js3hBQaeaeEebeFOrXxJ+/YR+/mvIULztttNIx9JT7JJ3HCVxxWnQHjkZIL/MGNVoMHG7r1itiHOx42okuOxwxYJQnQfnEQGzD5b9TK1E2aXGXy2srDxC1c9vw193e7juqI8+U+xk2s+Osm7rbnxeFpbgYU6XuEvkExU2YUEEXEwlc2cixrXECjJQ72f4KgdlNcLLoRoV/e/SQ/e+zGLEZ/TYYOtF+LTImQdLIyALyrBtr4rT7F9bi7J2EO5cdd5Ie4smQmqwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=infradead.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycY7arRuvqA7cMKS2p0r2GcFyKJUIy/d+p2Fte6Nc1o=;
 b=ivutUsdRSZmEs4QgDnHgBjMIWV/1eduReP1TVCMj8oo94JNCJ8SJ7hAx680nDXLaDM63z0bc6Y4WE1iF8z/HjFaN+O7n9gWL3ueNteUD05Ful7ccruYplCf2v5EF3Bt0/yQEZ3XsxEC4wNLxevYWxMGDeGJRELfQchaU2DfuGmU=
Received: from MN0PR04CA0027.namprd04.prod.outlook.com (2603:10b6:208:52d::16)
 by LV8PR19MB8795.namprd19.prod.outlook.com (2603:10b6:408:25a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 09:42:12 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::80) by MN0PR04CA0027.outlook.office365.com
 (2603:10b6:208:52d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 09:42:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 16 Feb 2026 09:42:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9805140654A;
	Mon, 16 Feb 2026 09:42:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7E45B820259;
	Mon, 16 Feb 2026 09:42:09 +0000 (UTC)
Date: Mon, 16 Feb 2026 09:42:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH] soundwire: sdw.h: repair names and format of kernel-doc
 comments
Message-ID: <aZLmcPjTa9R0hnaS@opensource.cirrus.com>
References: <20260216054418.2766846-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216054418.2766846-1-rdunlap@infradead.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|LV8PR19MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: ed994c3a-ac00-4e92-57d1-08de6d3fa898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026|54012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F8j7mEmAMHSiSLvfZQ2yMvKZxZ6cPUU9OJET+y7N2UZrz7u3gnUM+K0XhQ/n?=
 =?us-ascii?Q?wX5GobBMPbvSJ9AMTa7njaw+PkO+KrojR3c7JTMnyPzKqtyjRoFgzfhCDFZC?=
 =?us-ascii?Q?C3BZRCrqQeonO5eV2dLnpl8OTo8Z/wE1WbZ7JiZYlfI4BtOMzscpiJcJfK8g?=
 =?us-ascii?Q?d9JD8AJiPcLjIeyoofN417Zb5Xr+N4C+DU9KBYxrbEGATZZKmUSHL68pRA6k?=
 =?us-ascii?Q?DWcnDd3naCTKc+Kudv9iMNuveEEEza8zk9tHMVeQdv/UXW5nZsOzueDadMOX?=
 =?us-ascii?Q?D8gSSWVzWWDQ/1Zs/5vD4J/hx1KE1azTaDvt1fg7Iuyp4Ib4IjGpG02vCQYn?=
 =?us-ascii?Q?ocMN0kEVZMPBZlkTcnUyKfrIF75VI9okt+Cle/rwyS8M/ddhNc9X9DwIZRmj?=
 =?us-ascii?Q?RF7P0eMwTNSf75YHZMBj0J3RaK7mJAd3rOgwVox0SarCvZ+D8p4uyqDGms6g?=
 =?us-ascii?Q?mKZBBYWEhVo7k+VQs9XPyZItvcQy2FXAULbTFofpXo+EntQh2pUGGvp2bbob?=
 =?us-ascii?Q?FsQFqZ/zcyyKWLD71bUacNoR/jKHf3Tl0TYCXgwKNyBfhh5ZRdwvAGzWqJgx?=
 =?us-ascii?Q?11bPLL0JZue1X0fziyyMJM+QoIEQB14cxeN+f8HpL05mAfJpKlammqJ51xwE?=
 =?us-ascii?Q?lEwolfcq+jt7hc16PaB8EMunIKq/O4N+1Ljgr08WjgP/k7WamPnEGH0M9qEp?=
 =?us-ascii?Q?dkIZjrhVMVRGDKnGH/7em0uc2CEwvtGGeUG3IJsuSRcav7L/n85Ks8kRZ41W?=
 =?us-ascii?Q?SPgQUN3HZG/aE0OQop2/CicYQOF17wuy6yHYcWwQkoEwFNervaJh/3lp96pB?=
 =?us-ascii?Q?j8Gk36R0rXrKWavFjm/YkwHIdKEAlZMFmB8ztfemOPwVegAiOLXDKCKWysRH?=
 =?us-ascii?Q?W9V05iBvPHth5WMG7VJBWC5Agn83YomKZnLYgdvHl6A279wbs9RJqfA4qXba?=
 =?us-ascii?Q?KtvhCK76kPVY6wK8C7NOtxkV3bdp/HLeAG49nFgKH3VN76UH4WowER5cYrx+?=
 =?us-ascii?Q?YFDdA5/LB6REwCpzoloXmAAbXuFWB8ZjxMBkY0S75C+B4GVjPG/4svUGYHmu?=
 =?us-ascii?Q?l+Zx8YF+DRkAwXEUMiCY8GO0gRteNHAL6IGrg4WA7uJt3F5DMrGtMwXoDfyH?=
 =?us-ascii?Q?CIdFzgJw6yE4JJ0inFgG5HSsnX3pUjX/ixE1zgyeVvPsRNRnNle/E8WG0yRF?=
 =?us-ascii?Q?yf0swAIcRQkb5L7+9hy6g+QAeYn+2RdgXbXljkvp8ry9d/VYhEyURKZG45zg?=
 =?us-ascii?Q?n3qzsXLJvD767lsdKR+9dIoW2dYL5d4eEIDQsJ0DBPaTZh8++e9Ej/SWXPlk?=
 =?us-ascii?Q?bXqAIZSQISl6zliHMxXhphjoM37uzCEUutb1ngr/XTipwVLF0Nt3zr0DUKq+?=
 =?us-ascii?Q?FDHtyt+h1SannwW2sLa2OLo9VLsXAb64kFzpTlcyrmMQ7HQWwa/d9lGu7wHw?=
 =?us-ascii?Q?6VsvXIsUsuDj2GKOm0I5tF936T6urQQg2FEcLZOmkwbHeLd6KeQKNEC0mguw?=
 =?us-ascii?Q?azOl/HyzeEvL6atWzNOiPSIfhp0MFggzuIU6RLcwa0I6fovhNTXZC4tq2nqS?=
 =?us-ascii?Q?CiQ5epGSqi5vviUrwjQ/DGSbjO/9X2Ts2oOvvF7AAsVf7M/LjMNmGtA9sVnI?=
 =?us-ascii?Q?gMwJUxI/Qnx7OgNd6+QgiV9fWIhzTJuOsFRogGU4zFnGhxPOyFhQwEjmM1X2?=
 =?us-ascii?Q?EBs5zQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026)(54012099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hn3wwxXlBwAR/H3YSoJXk2LMZuQBcOCUzzxiRWjc80RjfHffVCRTGSxl1dkXIiaNHLPydSQb/WS1mRfCVt3AXMTofBGPraYqNlRKj2kEYX7f83fwIl4oDhOOhDAppnlOjNZmtMjIjjqF8f3vyl61Ir0to50t4047V90IJBneLz1ry22XqsJAUpsNl0C79wBrJS7AN8BUqohJU/cPZUyR0pJ12sku+uh1CXnp65ODhLBBpcvGsg+MoD6aCortIBRQHV41UtCqEYDB3fW+IXih0y0hkRgA1/soJ23RWD+n+ecYsqGO7PwyiR9RWhWzByP0F/GtsUSfhxm2ED/Ib47S9IY/H621r23QoT4ast/usInhJkZvYk0qw0STorly71eR2e16gLDtTRc2f4U2yrc9rHKWwVp2q1sVMsX7BNZDqhXG+msUoZYacTBWaG66wBxH
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 09:42:11.0059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed994c3a-ac00-4e92-57d1-08de6d3fa898
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8795
X-Proofpoint-GUID: y_zfcR6fB7jI221FAlwVrRdflYgbZQhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA4MSBTYWx0ZWRfX1ASMo7LMhkKE
 6f84vdQkp7hNrdCkIC46kRLb/QHoeVyHuG/9KtjIXGLWwgKcmwmOmBQ4NupHbTyGd6WSCSnIRmn
 ua9PllEdUc4pP3T87OetEJif2icdapPYc3q+/zk+DJOQpFPm+YCLdcrRr9trrxzhmUV1Zu7LEvw
 ee1T1z99ThdU4c/3GMTI/XbYgwQwD+jc8qBdcN3A7qTZpr59sqSu1LNYCU0W/+Irl1+feZ3NW/s
 Lcmxsu3pyzK4Xt1x5hg22D4ZdDOEztZQcPpnjAu+VySSAZgwvUmWocePVUkvjN2B+j8K6yvP/RY
 OqMJCG5T/Uf+N8s7f+LAPxXKTMPVZhmR9ghUmGhRnSw3dozf98gD6m+oydIUC0kxLE7WqeD1LoM
 xMpn5wwq6GTSXcNrK6dN78stfXgYG8fOIi1SEdffuRd9OuJmLSQUIcLKXwSW/Ks8U9sKPCv0I2b
 nk7Mf/Yd7n891ym5GUg==
X-Authority-Analysis: v=2.4 cv=SOlPlevH c=1 sm=1 tr=0 ts=6992e677 cx=c_pps
 a=3VoOYKrvvlFRQJIGxkfhew==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=JfrnYn6hAAAA:8 a=w1d2syhTAAAA:8 a=OVGPyekrpVKGRGsOnFEA:9 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: y_zfcR6fB7jI221FAlwVrRdflYgbZQhg
X-Proofpoint-Spam-Reason: safe

On Sun, Feb 15, 2026 at 09:44:18PM -0800, Randy Dunlap wrote:
> Fix all kernel-doc warnings in sdw.h:
> 
> Warning: include/linux/soundwire/sdw.h:538 cannot understand function prototype: 'enum sdw_reg_bank'
> Warning: include/linux/soundwire/sdw.h:779 struct member 'port_num' not described in 'sdw_transport_params'
> Warning: include/linux/soundwire/sdw.h:792 struct member 'port_num' not described in 'sdw_enable_ch'
> Warning: include/linux/soundwire/sdw.h:892 cannot understand function prototype: 'struct sdw_port_config'
> Warning: include/linux/soundwire/sdw.h:906 cannot understand function prototype: 'struct sdw_stream_config'
> Warning: include/linux/soundwire/sdw.h:925 cannot understand function prototype: 'enum sdw_stream_state'
> Warning: include/linux/soundwire/sdw.h:942 cannot understand function prototype: 'struct sdw_stream_params'
> Warning: include/linux/soundwire/sdw.h:960 cannot understand function prototype: 'struct sdw_stream_runtime'
> Warning: include/linux/soundwire/sdw.h:1047 struct member 'bpt_stream_refcount' not described in 'sdw_bus'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
