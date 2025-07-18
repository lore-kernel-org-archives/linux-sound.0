Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B73F298CB0
	for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831672; cv=fail; b=obcD5DToXm+swJyJ8Qjl/yJyWmmTWDFJQmljPuF40bOl8x/umINbGr74QdvyG0rGj0UhycwBKq86HR0A3+BGyncFplmaMN9LkpGkQVX8Ru1+Kxnx9RfzJtil7gBDO2YjIJhfrG9AYfP5rYYJ5ULDZwH05iEC1SM+5BxtwMU9Mbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831672; c=relaxed/simple;
	bh=1oenfL9+L57gAl+nxcM5D+iom28VDbLjoqQfldJ6qaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNx/MFaekC5/EsC0sIzh8pAu5+kPehBcMgK6dQufb2dA4WgPBf4Yiyj1aDgaBLOKdS7R7uiD0djWSwQEYkZlOL/obVMuy8u/UcxwhVQdoTZTcvm+mKXkXP+qmxC1cjDQsLio7p4MhVcRiWmzgsKv1TUPLcjIG0oKyuSLw8SgS0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=E1f3AeXr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=af103BsF; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="E1f3AeXr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="af103BsF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8otx6031689;
	Fri, 18 Jul 2025 04:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=p7LySm4VvCn7naoblY
	mwZKrtYwF4ss8W0CFLR604Ows=; b=E1f3AeXrTAjeIJ/CzLciMoH8diMYl8dJe8
	3nShPum6Qg7fzQZoXQvR6JyLXCma++TZXorwCTxtppZscSfoaH/l2GjgULaG5qz7
	WeZjHwEQO85vkAScFmc/nrP0omVtnIDDioM4q5hdgUKj5ZeN1wHQxtMj8nZgMXs8
	50Yh7HjH3ccerTd61Sk10blzLDuXwYyMSec+WJoigIdaKwPjDRtGrvbze0h6dfPU
	2U9RC9loDLCiX2uCPc39lyvqWij1VRKu6G5kxU887oheCAh78GfCwaiN4FhFml6/
	9QX52HuexGPSmihwapqU2sneVq5DhMau4OCJeO31XOCidc1Vc4+g==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2111.outbound.protection.outlook.com [40.107.243.111])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47x7uuu7qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 04:41:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnN+yJBAg1ryxcpOrjcIGsIppIBJ/cLFSFYlj5EstPFB9npbFulL5mwuejSVZXFaNByldYtTvx5F5qAy1zsA9EqEfcfVgphT2bWfPh0OTz3F+rB0NyxJm1gar2MU3yyEaoLdazPpzR7W86YIM4VZt/bk25B1ce2p2PJ9Kk6GcwYsI2senjxLi4zqZ7o5xJgZ7mjnBcJKZ7yY/cXYukFz5WdzbAUnFtM72anN9TLxkwHI86V3q4U0u3pDZutlNKzggO7uP1lkZZuaEFJQzlFo83HzIyiM4pIN8nDXIjaD8N5uDbtnYuYyNwtKuKbcVTOiKDRSQOpLmGA+kOfyyLJyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7LySm4VvCn7naoblYmwZKrtYwF4ss8W0CFLR604Ows=;
 b=fvJT2SKyk/9LRzUUCvN28xljv9sz+jEwuDVCOYS0L88UVG+JG5YnABKPsTFpcJGZi34jxwH11aa+bbAcJibx2vQlrZJEV2o2JLo8aZUZBW/qPnHfNxpyv2+fHlYZgunmURiiRqa7Yb7VuScrjxMfzZAl60Aml/4vdfZv+rblVuM46qsFqceYb4fMlyTzSJsHgSh+3c6g2M7eq7Gic7r3mLgdmYn888kqDXB+83ShfR2QPj1RgrMzn65cZmTRrAdqp+Yoco4AlpGCdztUseUiyFFuLWNOPEQDqDJ5y5OOnIiXEnvkfVzpEOEIKL+AI0rUM035rjRx160k0K4Lg/a/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=suse.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7LySm4VvCn7naoblYmwZKrtYwF4ss8W0CFLR604Ows=;
 b=af103BsFRo4jgtZD+N46n1GTfANDF2hteTpAGA/uxZUrRsR+3YN0m3SafC8z7LLqRPqwdHv3QBK1+vHoroljdsLdbiphPTCe8SHBQ22rH2beGqOCyFoh0B8aYmAY4BKmicoPNU/bdQsk/TPyMlfYPBzJUklyOXx87BRzEFVGUR4=
Received: from CH5P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::8)
 by MN0PR19MB6090.namprd19.prod.outlook.com (2603:10b6:208:381::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Fri, 18 Jul
 2025 09:41:02 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::5f) by CH5P220CA0017.outlook.office365.com
 (2603:10b6:610:1ef::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 09:41:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Fri, 18 Jul 2025 09:41:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 31B0C406541;
	Fri, 18 Jul 2025 09:41:00 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 13980820249;
	Fri, 18 Jul 2025 09:41:00 +0000 (UTC)
Date: Fri, 18 Jul 2025 10:40:58 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 055/103] ALSA: cs4281: Use safer strscpy() instead of
 strcpy()
Message-ID: <aHoWqnAV0Dxqh5vK@opensource.cirrus.com>
References: <20250710100727.22653-1-tiwai@suse.de>
 <20250710100727.22653-56-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710100727.22653-56-tiwai@suse.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|MN0PR19MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad70e53-8436-4ed7-3bee-08ddc5df34ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RPoj9gtjOu3OkW7ATQLMtRmXxl905LNT8a/EkukCoFXZWPXTOxtDxNtYQQjK?=
 =?us-ascii?Q?MfzO7yCIP+y8nTQ/g1Z04feImXqrtGY6ghyMgHJq5sM+eb2kyQZpM1Yhuzdr?=
 =?us-ascii?Q?KUpo6NBB5dFPYz2j69FE9ajw/4qj3sItuavzX6WUy1lkkWs4OFyECK5lmibi?=
 =?us-ascii?Q?6wARiGe/TJiH680g81N59rtmcsMZF2ShIjJgcB7A+wY4nONP0OGolSfZ5gzc?=
 =?us-ascii?Q?AqwsLcDqffMJMyUJLp3v6ZUk4OqgEumFfA0Nz5ZrCty1CUJS9kMyEmCdo87/?=
 =?us-ascii?Q?Hjp1bTwOHNViHe8GcK68l1PBoWz8cS1Pp8As9KzJl7OEUcbOtfoJDdIKVcSP?=
 =?us-ascii?Q?4TEmbJxE4Sz0binfZVe5NETh8j4bw3kOc2292se51GUQFN620uELB2rpQfwU?=
 =?us-ascii?Q?Kzqoo09YWYSnm7L5Kcp7O8XqvuDTOwpRvtBp9ix8sRpxDiiAWi/Heb6tsn5C?=
 =?us-ascii?Q?8eZ2pYiOXIJ1NYbeXIbpRG5JgZndPcqNUcxVaWcKkF7RknaTkKbvf3+9IeWf?=
 =?us-ascii?Q?1wwWlU9LR705c3qefrGsBJf4VDjqUS21GvhPuHI/dmxkRcjUgZXXFyG+YfBT?=
 =?us-ascii?Q?LQnuKHs+/ZNsAD6NbecKOG9uIRE0vrjuAqHCKRy62f2ZglNJJ6eBqubU6z3i?=
 =?us-ascii?Q?MT/I8yi7RXjG4l9xZL4NJvV+cYI2ursG1VCcKLpjYZQCKQfK7qpjk7gb2d57?=
 =?us-ascii?Q?/GNS5B4xzDXcMrLZLo40CHOF0gIijaHw4o1q/SGbuiQYf4DyQ36txL/uLy5Q?=
 =?us-ascii?Q?+8gu1rb7Dy7XnF+fpchiNtm8YRdIRUUYjtKeCh3BQ4dKiCzFmoaIRRHPFuDx?=
 =?us-ascii?Q?1boJ5vcmY2Cl9kEQKhL4St4YHBTyxQGAh19KKMt89YjwkUbDmKmudzeCxinl?=
 =?us-ascii?Q?J4cYB3kcaVj8xXa967Jlca0HOsOqhglvN1OOAydvMUNN8+u6oDRkXYoMgk60?=
 =?us-ascii?Q?9L8g06IelFizOXq9/Ndr1rvGRw10bw1unejIt07cfHfQo637/wpUOGqByo4u?=
 =?us-ascii?Q?ccyYjGbF2/VMzcZihmqdQHw3Vfr4AripedarGQvURfznMWv4lVlKFStC8bZA?=
 =?us-ascii?Q?8zWoXZePOX4Kun5XDjY7ON9yHCqu74tnDFstzmBhFPdeOhlPhw+JNg+XqoIh?=
 =?us-ascii?Q?rGiJtCzJ0+OINmtGiayy4WJCYjC4AifZijYvnxsf6aFN7NJ2KjqHYr5CF9Pc?=
 =?us-ascii?Q?D9k7afbmRlEgXpPhoZpu3MnSr72+4fiLgDGn/ym1jGTAbw2ejj6hrq+RxRNR?=
 =?us-ascii?Q?MFbzJzbNJXXmecvzrLiyufiXLwuEKCyhzlICZqW9LApcs28gQaazKrQR+JYq?=
 =?us-ascii?Q?6RcGF7R1yUzFLF8vUGQLE51ssp7/On191LZKqPileK8qRq1U0vZFZSaNdYVr?=
 =?us-ascii?Q?yPglUdFDmMHbMXPNkSZ+Oq6Lxdt94B68Xy7fXl6MsM3ll6qvttWd/0OeSUwM?=
 =?us-ascii?Q?Vc9XV95HDyf/qwKfQrPZtex7EwPaAHIM/PIKVhBP9ZQeGy2eJYiaeyxNWaWA?=
 =?us-ascii?Q?LDhO/zGsFxvXUKuiJhKDRtBdhox73GqP7RW3?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:41:01.1631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad70e53-8436-4ed7-3bee-08ddc5df34ff
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6090
X-Proofpoint-ORIG-GUID: cownpRhlgIzZgbzhnYnwS3KPF9ClZyfc
X-Proofpoint-GUID: cownpRhlgIzZgbzhnYnwS3KPF9ClZyfc
X-Authority-Analysis: v=2.4 cv=IIwCChvG c=1 sm=1 tr=0 ts=687a16b3 cx=c_pps a=7pXqsjAnxE70JKEdeggx/Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=xpKaoQlV9wSQHpw91qYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2NyBTYWx0ZWRfX3AT3Uco0wlmu +1J3DQWPttlB/+cJAiAFrqYw10YTDxBPj8zFXj38j3VF8DeVNUes5RhiSk3bJuM0BJ8cPeweSBr mlbwC5su1/ULRXBf2gBnXDO6AId+97zpYF4owQHlzklgK6O/7uS51FbxqJlowwvBIfNvtB/2quU
 bi0v2mJwC+WrbQdUrs0oTifbSIvNzVfNv5p3TNwmwnjgGTnsXncxSmS7PCMPB/LWwj03QwtogKL W+sWiMP81E3QESPjF3rFpJca0LjKflVv5w3VcJnHJ73/Kk7qoy1vuhnXz7y2XT05WnXJqdDfSDt 1nkmHea1J298389C4LblR3dDByVShnAv3iOe5odc5sv5LFe+pDDBun8Ifam3XUKIOfVOi2yQiYy xgbUL+Oi
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 10, 2025 at 12:06:37PM +0200, Takashi Iwai wrote:
> Use a safer function strscpy() instead of strcpy() for copying to
> arrays.
> 
> Only idiomatic code replacement, and no functional changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
