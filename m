Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120E32FFDC4;
	Thu, 15 Jan 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768505173; cv=fail; b=RU6kMk1kK7tAO5jAboZeS3rPAFf+C3L/gvOr++y+/iuQR86cZIN3loOGgr589F38jzi00/F1U0DE6g2Xp+XFcxjaZvGO1/JITHkdBkHokgV9dbuQr3pZlvw9AMkuKvQtexxf3y7BVdH2oWNux8VhAUnYA2Yq3ePWfw4cJZ9V4Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768505173; c=relaxed/simple;
	bh=ApmXpPCrXtuKg3ymNo+0I92pPrwVtG6sDGiRWySBMCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZVHUhSYE81Cgg3p9T14Cr/IPUylVNgR2mGmBEj18D8p+ju3T6O96RXE+rzFIuXjkNFLaqp3thjv0/f0oW039iD44+kfAxceDv/r6yNEf66OKUrXwoBeVCxIFbbTEeMLAzLMiqTjPauAcZXshrjdTUqbh4FhffTO06Xju9zeE62A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DQIBUIxp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QjLPcI+2; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DQIBUIxp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QjLPcI+2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FHSqxC2878170;
	Thu, 15 Jan 2026 13:25:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=sZlm/oRbn1oZxC5q
	7wYrJwuFarw8QnEQTDhNuw2p1oU=; b=DQIBUIxpSumIfubzuLgaI/pgkfF3GkHy
	gfa2367tzYLm3hAJgNhFDE+Btft+7eDvgijBtQXoeAGFtKiMqxCckxopyl1B0gB8
	AO2cbxpRNlhTCJSV78PzsAanjxr6bapsd7jnP9L85TSaZ+AjXURLK31jVGUv2xHM
	CLLzx/Fskx3Y4//x+Uuz2oHYH/+FUhziWQjDNMyME1w93uN0s6gN4nOD9Weo1c7X
	XBnY/GiM+i3l9z6rq9s66DA0uer3hChRpOdrOLaWZq5Hbfsz0Nogb8P4aMfX7TBd
	Bxw5++PtKkniHMm9UBjG8fHIfUnS1hRQ6yJ71QSag+mpU+lmQnPOlQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023138.outbound.protection.outlook.com [40.107.201.138])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n6ct9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 13:25:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlygw/U7cDCTfELcNkolye5MSQtn+QV4kOaHma7ppDF0EsWd3RDSIWY7wfYQPD0ZsfIwy6fGFhAWP+bNRQv9mF/i/gGyk6i/YLQSGoRAMZ6ciCTQ1248oErrE9CWgg1+K64QSELVRBDnGe5ljw0XwERAkjLL7vY9HVuTZQ/Owh0gtxMNUklHLoh98nl7mAFvPd3lTwi9SteOH9/KTQv1NpPgfYNtqGMtAX2lppOIH1ymEKcLx57hg6V6SoWbVtwfT0uoSeIH+rcbGE/DsSajkwclXNPmaJcyBEHig5D6peVfxsy8YS6DGZpao07RNNLPObq25GPxMMC/GWMWcO/4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZlm/oRbn1oZxC5q7wYrJwuFarw8QnEQTDhNuw2p1oU=;
 b=r44Cayd5x2zlrz9zRFo/1iASJ7jcFKXnAcJcCCKohoDXDlE3Jzoi7hRQU60cFHoFgGCfycN6gWSZ9TLDcLEr8XgZPBtjtGpoh5XBxNKOy6LowHkbkpp7H051ouaLoNiOtyWE3R0WdwdJZ+JWwVLX7H48hVXkwNe4cC7aZ10Ydx5Oeku9lrtiz2GYUBJAXdMBER4T2IbjjTzXy8OM/wcC+QJnESTgOU7DQRlQn52djJ89ViApuNR+vmo3/u49NtZUFEe2qwiMEmaxDSHPbnLyD+6a0F3UMkScIf6Hglo9bOMMWuNLj3DAmvsXMxq9uP8PXsijn8VaPHip6XlYBraZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZlm/oRbn1oZxC5q7wYrJwuFarw8QnEQTDhNuw2p1oU=;
 b=QjLPcI+2GPvArIEAv3e5SugHhvzWqLHlJdhgx6/TGIbj7+K/ZaBI0QOUfThMWSQaPh7Sy62yRH/aVDlPy8SxydpkSa9poFYVwsyCs3jhL88h7oXEp6gmrhPkRgAbgXBkKIvCqJy4+GMg1OXfx/JWyfpIwf5YLuROSbLIfF3wq0s=
Received: from BL0PR02CA0039.namprd02.prod.outlook.com (2603:10b6:207:3d::16)
 by LV2PR19MB5816.namprd19.prod.outlook.com (2603:10b6:408:173::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 19:25:48 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:207:3d:cafe::ef) by BL0PR02CA0039.outlook.office365.com
 (2603:10b6:207:3d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 19:25:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Thu, 15 Jan 2026 19:25:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E26C540654E;
	Thu, 15 Jan 2026 19:25:46 +0000 (UTC)
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com [141.131.145.166])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 46246822547;
	Thu, 15 Jan 2026 19:25:45 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Subject: [PATCH 0/1] ASoC: Corrects ASP_TX5 DAPM widget typo
Date: Thu, 15 Jan 2026 19:25:09 +0000
Message-ID: <20260115192523.1335742-1-rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|LV2PR19MB5816:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c5e03211-50b2-48e0-550c-08de546be312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y8R0H1pALjfSi467YfLl6PtrMnxuU8cfNvRpBcEdlyi4Dn5QUfPlGpU+dtX8?=
 =?us-ascii?Q?DsXnaYcoEZAiiOGZ1JvaMUi9Nc0vNrXc3Oewhqush6C2ks+gWJchq7VZEd82?=
 =?us-ascii?Q?ZvLIOEfmn3jFeOJdyX7MTc7EWtLPlwsk6jRsNPG/FXbb4NbwSLdEHnVX6Fga?=
 =?us-ascii?Q?2NKn2PAtV1abifSqCeXWOl9SlJeGpeNxTzV3W9oLD9QHghVxLIYlTPscNKSm?=
 =?us-ascii?Q?SLx4+WqvUAVssh8YOHNCLcHxJxgFDNsQ0OpdvDTwgWgyymOJ+Id9EJmvMtJM?=
 =?us-ascii?Q?ZZkQexvCEw0fZ3Yj17rnrtju3U3nkO8RRuDk1iwUHh7yph0L2K5mfDb2SQrd?=
 =?us-ascii?Q?j0B/mAoZwrcibJ91BW7/3xGvg8baQTDGxC0FFDkRNJ/725RzvxBSFpm7E9Kx?=
 =?us-ascii?Q?OWaRwcWgjYIm3IO/rOygWkoE08+Zuv/+Ch+vuXcMgbLKog/+mG9zUCgqv7Xc?=
 =?us-ascii?Q?AH2g9SeZupzELseeqgVsrnx3XcmV95V9BqqZmiUWR4xcCmg29MuokKCFGPBv?=
 =?us-ascii?Q?xVdv7Jk1oIJsZl5oSzYxoIA3rvuJ6nSDwlBruVLcXyYuEFbsa9LlLIjjTGnc?=
 =?us-ascii?Q?K+sX7k9fbJ/E54Yt3HDne/+mn16X/Ymwh8FJ8aNWNpAKCDUkQQ61zsEhaP6t?=
 =?us-ascii?Q?mj3kF1Y2RXoaK3x6BQNNJpgCrYgP3R6yF38U2vc1SLRbDgGC9xFCoIlvBFHe?=
 =?us-ascii?Q?5FgmS1ngBfWQCsQ/5TVz3W9SeSNYITLKfdmQhc13gsKMIxJefeIsNfu0dbDl?=
 =?us-ascii?Q?0H72VvcbL9Gy7gej9qYmphcZyYHCXul/ss1K8HznL3xPhEYoXToU3ccxF1Ye?=
 =?us-ascii?Q?Wz1rhE628M6NHNv72JfiV+Uy3aQbEfZVls8LAfx2LypLM1ZetoacR0s/nbk0?=
 =?us-ascii?Q?QfNw0RPuV1l3iRw/lR94vSqdu90Fzeaw+vNiwtcZ/cqOCYAG1XKnlPJ0wh/J?=
 =?us-ascii?Q?Z5qJSx4PHhFamorxAKESuZhRXzdI5Yf5cLsFvacLkxfq7a5LVsjpvqPIrfRf?=
 =?us-ascii?Q?VcWws8Ehg+uldk1kvDx3J8nvSWNecQA3WYwqvpupoMdWqXUa7kjluBbMYsCv?=
 =?us-ascii?Q?eYFcAFm6xceayNGVD/Tl8n27SHlU7tlHLo+2zi4sRVeNHDYZkEHwixgSRHpH?=
 =?us-ascii?Q?DNyQQjAdUfqAo6ERbeQ0AgzJAFdhcRmzCrYaGGJaynaXT/qiKAAfH0/+H/5g?=
 =?us-ascii?Q?pi9iOHlWYG53C+eZV1UltJr50KpmWBekrZ1KRtaJcsV6sUj6HdXoMtdnKpla?=
 =?us-ascii?Q?DkMl8l8/t+pk+Z1GE+A7L2ENu9w/ErZV4agDC+YYgs83u7mK2GT4+2pcLElA?=
 =?us-ascii?Q?+bUS8IZEEH5R5IB7k67MoOXAhIR7adEFiX4I2eDkE4ThvkjHUGs/Sy7SdzKS?=
 =?us-ascii?Q?KrkkdUS/j/OR/orbaRmRvHDicQFn70ULqznGrIqs8BaXqp0nOiCEsmqTwqSL?=
 =?us-ascii?Q?z+tD++dSOFnF5laVwUpS6kmnGwSXf/KM4qB/5M+7K1+8AVMsRJ0ukEC4PN6z?=
 =?us-ascii?Q?NyBPlTus6DIi8LXsCMRNDFkpkU/CeHndpzp7fQP95TuYOu0+ueyXyVllgdcN?=
 =?us-ascii?Q?7pS8dzlJzIsT3xW2MbjM3SGZ4ZMioofxSflKW6Y5BQvMtj+73gMqlNqnD6pi?=
 =?us-ascii?Q?krUSCo8KfGkbCzarysN5yzozDbQ3GFk2eU1rJgqseXwummezlrDvaLFvKRiN?=
 =?us-ascii?Q?x6GqFQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 19:25:47.8989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e03211-50b2-48e0-550c-08de546be312
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5816
X-Proofpoint-GUID: 64N1vF2sar7JeqkogYZdKTOHY4NmlKMw
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69693f41 cx=c_pps
 a=PjMtKLFqB+SPhzMRFbua8w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7zNiQtifepgkQGnLef8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1MSBTYWx0ZWRfX4afWfEXMeL3o
 kUfTjBukIo/MS7RTh2nIxdqKQ33GNxHfAhJgpSv4TT22ZeLz7MU4LniHLxM0XR52Cay1EjnKnBl
 wzMKvEAP2LIItPbjzL7M3kJvdMZJDyLghNsPc7vmyC0sxApmA0/ugFipn+iXifMPEvksys1Z5qA
 /8s/fswtdYorGAN/+UQ4jixCrrT0c0o/5vMvsepX/jyR4+9YSSBiNH2ZpDIjAzQVaDlxbfTSpkG
 39EfFQ+GYByuMyHRpi954n3Zyt2Y/TbYlLOKisltPi3J9DMQV91uXmGswjE3sbk157z6yv7Ui+M
 OHeQIKKWhviSfHI1wpIXnVjT2/KKX05FS/zLsZ5mhTV/2PPAuP2gPgFKHuCJD+U/e4ZE6S79azn
 V/77iMd2WYkqbSC+nNhFKKzGlhWXZ69JWp7dRnZ1HY6sjN3J+T7WCNGAN4x6KL8nfRH2gDIdfMa
 eklfdMIHA/sU8kr5FIg==
X-Proofpoint-ORIG-GUID: 64N1vF2sar7JeqkogYZdKTOHY4NmlKMw
X-Proofpoint-Spam-Reason: safe

This commit corrects a typo in the channel number of the ASP_TX5
AIF DAPM widget.

Ricardo Rivera-Matos (1):
  ASoC: cs35l45: Corrects ASP_TX5 DAPM widget channel

 sound/soc/codecs/cs35l45.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


base-commit: 4a0abde23ad63eb21175dabed3089bbdb90b1e72
-- 
2.43.0

