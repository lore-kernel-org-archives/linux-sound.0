Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795704281;
	b=MXIuoG4wLqhBQ6yfJqS+qtVSx0KPaEVVRphl393EYx4tTxijXXLL1tq230hln6i4ZkAz
	 5F9TcgSoOAzyjR0qE4IpFz+Zzt1PtRgoTj3Ms5xcqm7vPPPdYSiEI5uYiKJjShmkLiPPC
	 c40u7BNUm75R2Z225uYIBWdlu/sK1pf68/p+2B/Kn9oxCa9+aFTv4jOGB7YctnCqQfAma
	 qmb/b/QNHtD/kcX4a0itZezyQNgnAXxY4vMky3hpL/S5LwwSGMuPeQh9WsjUOPAEemLds
	 oIWhsoKCg4nrddfQEMrbo3iurWqIMeoTUVNQO6INEXjkEdBflHl3QTK5b8aEE63gIOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704281;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=0P4TV5LdVL6w8mPKNZ5vFwVL+SjAZEYC+63rbb05k18=;
	b=ITsV64pubdk7l8ncFogQB93g4/YKve6ZR9Qkh5ojRByxJi8fuUkCYOMXfPX/gfjPCTtF
	 nyVuAcKS7XqJilyau2r3LYGXki1dwOI7kqWIEiT5+hA6kcN0vBUXBgmAGdoOaopaymgKk
	 81pavBr0HtlIW7pcbD+L4wUcGQJdgO01NIQW/3wN3gkBqjYRBJvgkMDc4WCYNOEekXLtv
	 yB+SYfkl/CLu0ruS3CDn9lmE1WQw9PaIqwGZ+wuCUJ9QP+tGOkFW49ZvJ6m5nidQxD/OR
	 +o58uiFlmK/6LjpFNhJeB/SWfH0Z0I3N88NZ/UwDj/5QS9RiX3qeU/QUm6IJw5/zzNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=SogNLKGI;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=XuHWt7A5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84B2606A327;
	Thu, 26 Nov 2026 14:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=SogNLKGI;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=XuHWt7A5
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQDsP4Y116072;
	Thu, 26 Nov 2026 08:44:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=0P4TV5LdVL6w8mPKNZ
	5vFwVL+SjAZEYC+63rbb05k18=; b=SogNLKGIjrCAnU/oErizOwQdkf/YdCbTrE
	teNCL9xefzxyKJfXztdMdZYYTy0EKac4hkhJXvn0va6tdXCQEC/4UZZxOHZUob1e
	2vKu9OTgpMt8LlapuQIzqeLU8AjZJRIZf3ycMgK7+IlaxSO6pv9LiMVT9hrT4NlD
	P1r8VaPo2ZJqFpmI2X9Glteh0xilbIns3wy4vxcbeiE+/R/f/X1fKQS3eRR12SXn
	dIW7EmCVwTh51wkHtcMu4pUGjPANH25jxCTTEcPGPBzT0ET6gr7dZfZs1i2ZI/ke
	nY8KXJaaOAiwAwfcgqAHVdzN4TZxur6XYAdIuFGihyTvEKBGv8kg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021112.outbound.protection.outlook.com [40.93.194.112])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j51884amd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:44:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vF1DPWR68spZQNusrgWtUlaAqpIWaBWwTwVwYdJ4eAebTf6iajM3Xitu4TNrnM5wyxs4xaW2m3UxOjZTMm4YtE/wH6um6vJ8c5GxA9h05Q/w8824ksxJhKSncK/YQfysb3inSJKn7X+Woz820OQHMqsKRJPgSPNklAZoIwq/yS+TRymitRvsFjRlDmyATk5YA3qMbaxt1XR2lJSemX0EwVzJocwHdyVB3OHUl7kAQ/HOpV80o0lj+NlV28GbDcmefLo806CspgKRPF2JgJD34mXr40FTTKdcLJ3IC3/Y7XX57nvBGvNjQWNL0kifEwdu8sKyVyg9a9z0OXuyQAyzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0P4TV5LdVL6w8mPKNZ5vFwVL+SjAZEYC+63rbb05k18=;
 b=crQqtY0KW0DYwKD8Xv2cDnLhJU3k+y1eE0jpq2LF8//GAac2hpwksqoNyD/I8XxfLLnSlpOQwmnqnRrA0yAQe/7tNOXZU8vRBYkPO3aWM16wNmmHe73L+9FvQwF3mykDw5ptfqzme+onRmmLOTOhDMa7ca268ccq4tUa7kQxQi1ZehNo93ZDheOxaVLIIAJbWqKXXsrWd18NhYTjDV0IBukvPPRewdid7WRVXGFOF25LOgeh7OpAWibqPfxY2yJyhvNhXZzF5/+y3r5hvjiB2vHA/SMh/UAXGB++wBJ67NbvrZPpVQqPEc6BbiB/9SV2T4lTEI5ObaCRQOz27FlVGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0P4TV5LdVL6w8mPKNZ5vFwVL+SjAZEYC+63rbb05k18=;
 b=XuHWt7A5+qceRcPPFZa6FrEdBWF0y2UIhCAqN6M1I2sxJYVdJJ/1iIW3EQAUq+rooBacp5aQB47JMreBkbLoEn66iyY1+w7/7IZtmo7ZH/KsZ/eo7io5ng/GZIUsgh5Y0ZL4GjQnpG1GOmMvu0h3mq9s7OuIekbQePWSOiv2cJE=
Received: from MW4PR03CA0131.namprd03.prod.outlook.com (2603:10b6:303:8c::16)
 by IA0PPF311458007.namprd19.prod.outlook.com (2603:10b6:20f:fc04::c97) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 26 Nov
 2026 14:44:25 +0000
Received: from BY1PEPF0002696B.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::6c) by MW4PR03CA0131.outlook.office365.com
 (2603:10b6:303:8c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 14:44:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0002696B.mail.protection.outlook.com (10.167.244.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Thu, 26 Nov 2026 14:44:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BAD7A406550;
	Thu, 26 Nov 2026 14:44:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A2D58822540;
	Thu, 26 Nov 2026 14:44:21 +0000 (UTC)
Date: Thu, 26 Nov 2026 14:44:20 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: (subset) [PATCH v3 2/2] mfd: cs42l43: Move to core detach helper
Message-ID: <awhFxHHaapoYL3FM@opensource.cirrus.com>
References: <20261116110913.3555209-3-ckeepax@opensource.cirrus.com>
 <179569809495.72708.5920909967925778004.b4-ty@b4>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179569809495.72708.5920909967925778004.b4-ty@b4>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696B:EE_|IA0PPF311458007:EE_
X-MS-Office365-Filtering-Correlation-Id: ad3df2e2-bb8b-4120-1dc6-08df4bcbc36b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|61400799027|82310400026|11063799006|261009223027099003|10067099003|4143699003|56012099006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2Io8JoEQC43PB/JsW19cOy8at+3w29wDkFgn4nu736HEHvViCMiejDvYuaPC/FDyEg61str2N2XZz/Ke8ZbbJ2HD+CSRgDeW+Z6orcmbGqTW4lSn0AEFP77PnWAPI4wyCqaYrNc/YjyzYZU3MYb6A2ztfjoi4lS0a4CLBzzrkLEGLmvyWmGfh5ZuhV0myhO+p9zJk0RvzMAv9j3asfMBN4CfxRACDKS0YK8GN9z/hEpmtayGhtiLjDIZo/my/GDQ7c+DS/Ftn8RnTqC3OGa0VDbUHhOnFO1FMoDfTwdatApopdZxWYy+B8rqxYlWmWOU8latZDxPEKk4vGcmMpeWG+BsDm9KD3iaFE1MpI2UeXRhiNKERy5aYmoPvDQWbvJKYlO8aX9GNh0JV2A1y3PeoQt5L9KrgIs4975D4MLKLFdPiW0/F990ces95Y+VpgWuiHfuBG5HGYG5jCCbPdqLCQ68Q1jQFoHEu1fgVLXjbDn+rxooUFlru1SDlnS0paRFaIVAxAuUbwSHrhSXn+luR5936WMQVjQSO7OrVQ1Rh/2q1QZwr2rlCuYvzhY+CmeMDWT+uGLvgfcPpKhLhOUP5tqTfi62RAZgK2iE97+C/I2U6ZILeNh+i3K4O/okryJMI5z66p3VTxpnkiwmUazWP4iGDumV0Kxenhb+3nybvuk72xPPZNluuW29OVM3mVyYh138ENicMpkZGCuezzfZiQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(61400799027)(82310400026)(11063799006)(261009223027099003)(10067099003)(4143699003)(56012099006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	et9HrQmVmYUaVPwntap2IFYMLObO4M4D5z/U5AYD0gewDmRnlG8HG97IugjG42BXEGoNLLeyI++k7MFLIrrOwEYTtv9+4DtznW0mVQ0SZgc6X+MpV1qBlnaRXfCQfNUeHIUpLmFOt62D4rdtwI7LpXaqiRfvGhqFWYEUXg0XJpVRG9KmMwpt7Qy9fh5AYh2eXkxCYO3lrWOzbpWQ0G3LJP9QJUF+JysdtqaUtI6Z2apvBhgboyFmU1bZ6zH8OcMqcpBEyS1zgriAFYyrDtX+Q7jKXs/nXKXmIwOVodt4CW32GmuDmlUZFJkiJlYE6NWDKg7L8KXiepntaRy4g/ZlnkofMwgKXoU47DQEuthRcxaDLkDSFB/FL0ojprN2+KrmMWgRsM5dH2NbKmz0+x5S5gBUoNczNm98bV+r+DP/EzSVUxnHEtq8Z1GJnrnrbPXc
X-Exchange-RoutingPolicyChecked:
	DOsWtDIQQ/H43ZCaxGhC9EFA4B/Bc4mbzwsZFQzz6k2X7h7guCrOpYtw2tFIMN3oqq2RnAulzSSRem2L7lNx9iuLO9mPWheeWfDctCOfjtfDkNsCRc396QzQih40O54FZhhLusLdAPh292gx61i92dduh23PAYFIJVIKTFhheRHupCaPyNOyjOvQgQuin4MucGtFP7+DeiJ3eHONoujyHqCZ1T+sJNV2GxGuK8pUsRu/vuwTrQ9dyok1ToSHw4PvJLCrAWZJJaR7bnql6P4nV8DE1Xn4AHf0nMBjRGcH3kLmpBNAcX+y3dQ+g0HuJQNjnP5QxTEcUetJ4OQhR1/haA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:44:23.5758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3df2e2-bb8b-4120-1dc6-08df4bcbc36b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0002696B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF311458007
X-Proofpoint-ORIG-GUID: UMzhIhQ7AqCoPJ_wQGlkDRUTWkM7tfDu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX+xSjy9XuqU2k
 QLYFSkkTLUPod5qwnCYovPs54nRfZmaMr8adpnP9+KxtD0ZWWm5GKHI5/iIr4fsxqhl7SH7eHTG
 wAQrI8cZBUKdTLOFSei7vaOkB8724EXg1tS5qAUPJNZGwjop2ZlFFcdJfbZuGebVVK/dOtTeF/H
 UuxZGLMeMaYj49/mT/TdUkCO+ZBwoBQrSVuY3lIKkt5v6Jm4mgazXrAis+Zyv+f7kxiKEB9c4Ib
 sRhegNqJpKJ4EXmjOfEB7vNeEe28WByBAE/4xVYC5ZVvV/rR7bm48xDLATjdjoYMmoWURHYdilH
 unjCZRxHAOJjH/kloSClwMfrJZgvsEDGvI6EQgMHfo44gXUKBZ2WzM1Cqs4vJZNJj2+XU1SGaOR
 1Z0qufLmVDO4mZ4o/gHcLZdURxBvJV97Z5KOuzFeQ661XHW7O/Z2yv+Ghbs2O5DlVUJUbJbFilh
 Dd6mGi5M52q0uQE58ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX1f6fZnrtrIIH
 M6NYb0aC+YFZmIKIieIym/IiI/ZngOeV8cgrDawtOH/Nqq2tZYiPj9Vp3z+vrjRiFHgVTraMy/k
 SUDD8ehtbEIZMR8xizq9irBkHObGLH0=
X-Proofpoint-GUID: UMzhIhQ7AqCoPJ_wQGlkDRUTWkM7tfDu
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b0845cc cx=c_pps
 a=c++aTPG+XoUugkGw6UtskQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=_HRWddgdQaYcXc59OkkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 26, 2026 at 01:01:34PM +0000, Lee Jones wrote:
> On Mon, 16 Nov 2026 11:09:13 +0000, Charles Keepax wrote:
> > Now the core has a helper to signal a device will detach from
> > the SoundWire bus, there is no need for the cs42l43 driver code
> > to separately track that. Switch to using the new core helper.
> 
> Applied, thanks!
> 
> [2/2] mfd: cs42l43: Move to core detach helper
>       commit: 54b3632c8ec08735d3f6235d80005aa0b648c7dd

This won't build without the soundwire bit.

Thanks,
Charles
