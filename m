Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51993BF692;
	Wed, 12 Aug 2026 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528921; cv=fail; b=P2F86ceQ6JsBOtdW4VU74IbWg6W8tmYdPkRhbuu4/5bWVR6njOxVA6UjIo6Yexm9Hj5yXZPZ+BrQ7y9/lxC54ENRX3Pmg984X2OZs39XIlvlq3p0FXrcmJLlGYwRzY/gGBkVo8R+lZfoG2XuPHkndSkz6/LLkdfijfZeH0a1SCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528921; c=relaxed/simple;
	bh=XMi5hnVvZ7Ar+UOFdG+zCPgqK2ELrXz8vsEXqy95tuM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jTIUAzm1kLy5XFTxnFHyTev/b/A4RcIo8IkPbdk9OkIFbAW6MKnPpGNEkN2VceZXCh4NROD0ZbvbCqnx/1SrLf6zMNYhEvD6X57tyFOJ5hJ0K7rtifKbxGSOznQxXlYEnoBmhca2Nkpi7S7QG+Fy3+Vasgm1MrsdvzWzHWfifD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dj3WfnLy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=laDRYeAm; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dj3WfnLy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="laDRYeAm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C7pBZu006912;
	Wed, 12 Aug 2026 05:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XMi5hnVvZ7Ar+UOFdG+zCPgqK2ELrXz8vsEXqy95tuM=; b=
	dj3WfnLyw6jVi+LW7Ey5Qfdo1h+C+fvw1BQ/Te/8YL30dHa6Cb3iktLOoRrkXUH9
	SSew1C2yMH14M95JAYF51GK570IYpN4qujhG4LH3zJRp9EYlAB97ENBMt3Iz7FAJ
	Dy1/6O8L2phKR7njdkNaf3p0oAb2tn1PTdC9JsAQN9XL2LDGkKKmzQoCxUvuEBUt
	a/9GZyaDhe/5gYm+Me3KlrZNLRSJ/Ak8RUjizw8qMqAY7deIYTL7CxUfAIuK8Nba
	vYx4pEqGceEU84NFvp1mBeuH1GVJrPuJk0MF+N8Z1u/MoSsAth/RSKG92r/uLP8z
	5kMe4htWTYyTxOzC5WMGpQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020107.outbound.protection.outlook.com [52.101.56.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g0msjr4cu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 05:01:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTV55qGgCe5f2p1tV6jxOo7RoigidR4Qm6ypZvbnCmgXkRd2Fu70Ov9tFFW6E0fnJwI6v6OgpkayP6HHJBZ85Cc06ps6gZ84byZl8G5DdFqgpp+wKpdtqQyONP1NOX5tKAJgmvymYUhibdAxg/3dnZdquW8kQEhyySbtpOyIdKBxaC520PcXBWXQM80Q1M/XWzv3/akmDnfDc+Ixv1fn8euYq/oofcvwnrdClep/1YOMarEg15b+d1xpB85/r8ywh6BbLbd7mLZ8GcifdHqNI00FWBg6uLyAPCcyMP9s2KkLJz/ZwdnvpfhkQh9x16ke9fgC4hoh1+OXl0JMwWBDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMi5hnVvZ7Ar+UOFdG+zCPgqK2ELrXz8vsEXqy95tuM=;
 b=splKbE1iYU7A80fPcpn5SkD2k/H5qujsFeu7PaERkmQgC8P3EHk6vHGrKdDZne0I1dWfiHqj6rzQ4HpHgxUuWCiyR7CuUNNMRo/F33aMNRn2V6GOPLsNOJpJI92XmOhuQDsHe1CRlZZyrmtRs6RgrGUUta/h7bWSdJm2/1rwZEsjuk8toWaRVFWpU+BH2utu73FW4axmEwV3dZmJBxuO2v5MlcqKHXyEhm+hsaex6uibcFU34XfYD3Hl+W8Nc4f54+HX4t5SNVoVWiM+Q1Oz+MetSah1RFiOKgdA+G/+UjD3I0H6i/j4kGewzo0ENkyT8s5Zv+mi2SS4vy39mzUImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMi5hnVvZ7Ar+UOFdG+zCPgqK2ELrXz8vsEXqy95tuM=;
 b=laDRYeAmTiUMk8QO492QyUUf/hZmIn4bIECuJ4nntkOqrejsT90ygCokVWoOSHlMXbe1Qdq+s8zHZhiIZZ7GDPM7q1DX6qgSlCW6bf6O1Sq0kuihJEBEuO54eYRF+WCkVQwafGTxz4uxy24lYqSLN4k4XPQwo6Q3p588NJX+tIo=
Received: from MN0PR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:52c::31)
 by BL1PPF63B4E0715.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ead) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 10:01:52 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::1a) by MN0PR05CA0006.outlook.office365.com
 (2603:10b6:208:52c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Wed,
 12 Aug 2026 10:01:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Wed, 12 Aug 2026 10:01:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7852840654B;
	Wed, 12 Aug 2026 10:01:51 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6F5DD82025A;
	Wed, 12 Aug 2026 10:01:51 +0000 (UTC)
Message-ID: <ad2dea1d-e397-43de-b7d5-3123a5783278@opensource.cirrus.com>
Date: Wed, 12 Aug 2026 11:01:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: cs35l56: Switch to using the IRQ from the
 SoundWire core
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260810104045.60701-1-rf@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <20260810104045.60701-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|BL1PPF63B4E0715:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e84989a-7fe6-4b5c-413f-08def858bbcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|23010399003|82310400026|10067099003|56012099006|11063799006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9wEpX/QnMvMWtNH3XThWNS/pRa1J4YTryHXQud7f/l6TXj4zaDQ32rh4+jEzG4h+LlvEEkZnpNrnxxXPA6CsqlWNE+EKG55SXqCRC7Lm3C8WTUGTfUDJBJo7F0bG4Q+gBos3mq/+eT5zbI7/CTpCEwmOO2Y38osIYLbzVLkADUmEwGk9mlxAoH2ZX4g6+4jJjABxnp2bAUhkNDQtYNpGqTy6LYhJjYtSlNcWFfL2Xmbu+9U07eaS/y3NA1QaDtWXZf7nno0juqF3W/hSq+BGmXhIjHY+ISjjdxWsKgBF2/YH9ibnfKcgxKAID2kupI3Bj30XyNHEIJuFGYZ0b4IhOQOjYHXuJXIqFHcwC+kJn2P+xvtw/DRSwicwTwEvceSahFgRdYmGh/o9EZi9IJDESV+Ijn8gydVY6K9BSCqWtot5k3b/ZTLJweAg13mO50n5UaTUpPDC5ZPkp08h7dZ8ol3ZHKowsoaRJZtkuYIvktyUMg7L/ftDwJVQKpVnhe489XqvSD7+F8SxYepAGwTp4OuvDdr5q08IScudOpl/ld5VpR9mKxvsczKPEkh5uPEpCfAQCxvVnpCD+LpH8uFz6zZZlAlUpcdtO2TTeeJSq898/7OaZnBf6jTS6XpVkxrbZl/5J6+7q33QyfDB+npHIhVGSXfqqs6Ewd29uRbsbUUPki2VmO35VMic3kr0sBMgaTV7GGfMJq4MlCaNbbH3lw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AG1MRKC/kUQLu4aK3QagroUo3Z5ZGvJ0eyGx78cBCF+GGYPoX9I9uNN6FGRUI9NT0Fr0bpGy+//Id/RR7HNgLNrMJ6F21nxkvmmnEg6pJ69LMJT4XXBKij2LDfb+PobAGl488+qWJKRw6mjEBGcgA5VlplYL74+CETCu/tPRd1sTmH/1qKCSQ2ZbdeqQkiswQEnvvUUEjCw5MRaXJHkKI2GmlTQX9zdxO2QiSuKCv1ucfTF8Evf8A7IUd8jmU9o6y79Co3MHtbx4R6eGQzzyrUolnlsEwMugNBLopmU0fI/FGUY0RM3JtAzoL1zGuMyEC4WQ1wcf09DX5IMYddr0UouTa+MOFSRkoeI2ZOQGX8QSUaMBAK9DD+1JdxSqPK71SYM0MVg0vpu3K7/N7TOVKGFISGaQ89MFvl4QfhRg+TKQRcGLZJW/Xtwx4FDoib7k
X-Exchange-RoutingPolicyChecked:
	DeGUhHTQI6kdJF1mJ4lyGYalge3tUmHTc3/M2cl67wI6bfddbVaJCqk3ZAwzQkF0gVSpcB0wlnOTHHbVKQkwnnxzn3Mvq6C6eaxXfCTymhPDRGiB5pLz/OIJSbW2blpt/ofjyNsfP5nR9LK7wniruNogmw7ho2yryQRasVxeWyIZLfbE7HBRba85m7xKJy2wt+VO+eFtFgB5XP3shlU177O8MjE/4dA9yHNomJ5Ys6uoO+cxZ3LbDJ4Yyhme1W/7nAcCVn9nwGvXnOg+3/TyeUoUKPzDmge2PnH/04VBHMDcK9L4xAzHkL0GDybMZ6SFx6vASlTkwxfGJ2tJYsSMIA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 10:01:52.2594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e84989a-7fe6-4b5c-413f-08def858bbcb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF63B4E0715
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4MCBTYWx0ZWRfX9N56NC5KG9Bd
 OEzRsVf4GsnHClBQLSBGrACursSW9+Ht98m4CWdu1vNoqcN3BZRPO61exvBvV0W1F+WPrLx7K0B
 aCnWGFTgyWMWA7V2VKvg1NmmLe9MwEMXGOCySpwlFhKNri86GS6c2gOZJ5PbY9JRIQo/xklXFth
 DmLxAn43dtdIwjFDw3sH93xyFtOZOxcAf4b48bXcNxjZYUuRnQxrTnQAvV89FCSuD7JvsfmckzJ
 BuJDKjoi4uqVaHI0IIaEEUP9BV05xF2PT0rS+eMXgyY32DJAQlLjH9bSnzhlaDAiLHnBJhwxQ2D
 cThILiULaAkWu7JjtXWxtk8GL0LVFsh7NjpdhtriY1lj+zdViXSaw9pi4BOF0S/Khk4UdvOvTrE
 XyDUm2z9vxMdCg/z6hP4MwN523KXM8Ybeh3AN3rn+Rcf4R3/5uu8LDcsUNI9eHpVJ9jMByLjnLG
 BRa5Fhg6gvQlDvlzf6w==
X-Proofpoint-GUID: GmbshS4dNLkZcB99S9tyIAvb0y-dJX_n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4MCBTYWx0ZWRfXwDm9YtFcHa5/
 Br2jm+fSqgsaUt+JhLDdKLWP5GHa5n5H9blPUqmLLM6YTMPu4LERVTNsvn5x9AEtpQwMjjWXahI
 CqT6Ef52JCzZJDol5sfGdrTW+gK4xi4=
X-Authority-Analysis: v=2.4 cv=VdTH+lp9 c=1 sm=1 tr=0 ts=6a7c4494 cx=c_pps
 a=5/VQbJzMw90GIObl+oL5Zw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zz_LNmnal2haRPJW:21 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22
 a=KfkQE9S9VqCBgivYGm0O:22 a=Rrg8qXwF0M_PI2HqC9wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GmbshS4dNLkZcB99S9tyIAvb0y-dJX_n
X-Proofpoint-Spam-Reason: safe

On 10/08/2026 11:40 am, Richard Fitzgerald wrote:
> At the time the cs35l56 driver was written the only way to get interrupts
> from the SoundWire core was to implement a custom handler inside the
> interrupt_callback() function.

Mark, don't take this series. I need to send a bugfix for something else
and I want to do that first.
