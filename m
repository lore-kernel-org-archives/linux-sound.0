Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1D015C158;
	Tue, 24 Feb 2026 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949924; cv=fail; b=L6B16Pf0oOyvm9q/cI8G1QwljEWQgwdZVlSx/FfJbiA1Hagr8y3hnEXo0YWhMnnRXLbhot+JCe39NaaxRXHaiPqBQ2cZ3698uCQeOVe05ILNLaG1UEXeFj/l5uK7ow3AXTGkvvSiEdHmvDUyyQelUxaoQnIM5t+P+35B3wPinKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949924; c=relaxed/simple;
	bh=miHryDJyLOFoM//nJP+N5PjknExYFBplYxk8fWxeURI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UyIHIQN9Ua3W8fQ4i2RjkKXamaDSKuUS6US6uHEWgo8aVGDD79nFYdd9d1l8IHiJHf/U9tVnmftXQlgYZssITeVqFTe2Qe62xjZShcxfofm3rywoFq7qToPmwRc5uMseFRSP7QhcORBl3mIviuLNMzWw1OMeBGZVNBhjTR0Zpfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ikwsLYXF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jS5+UcZi; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ikwsLYXF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jS5+UcZi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OEGu5L038320;
	Tue, 24 Feb 2026 10:18:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=pgro8MOzBcUkHM1k
	t8cOacUcSdGSMNRAVDBq7fUBorI=; b=ikwsLYXFMRBwm00DecxNSelp3rrqwbOb
	n+8rPuTPrgzmZEFZw12KH3nRS/YhogwUTNMTLRwX7L9oM2vV9yO1lwDHpNFBJ3Zs
	pssLH6f9wzEDbUm9rfpJD2U07D+fRZVG01i6eVmTs2/TMTihXVOIwljVFgCimEF5
	0ZWp8ovdyUPAoUMRUEYjRfiGt5+KkJ2WpfOiMkEMZEuUF4c70wg5FmMNnEy/lxyW
	8chFNeuZe5KJkZ00SZqHugdKWf+U7NAHuXxP/rxeMehs6MV/2g5wJc7zRYvUukDp
	Nze/7Q/xdUZkCD/vY1KBoP/VEilS2n+0iD7GrCOz8yalFXgWnAsr0A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020083.outbound.protection.outlook.com [52.101.85.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4chdku87vb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 10:18:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxNdrv+aOhK5HlcpP8WRxmmCjy1XBO4JQiDWkjB+B9Cbqe7uxWbQD6nDUi+ixGtifVSvgQ4svkvXTsSaKTaSwOxeqiV+cR7/w29dIVPKtEKB6dnwnSdTA4cSwd3eSk3k/dxb9Yz0LtP5hKpe9c3s7N1USXwvdO+vRzwwezxkpA2vAa4ZSppAp9ClRFXHvSv/3SmBt7ybfR6BsvmJiZHkHZxXMdoq7X7w42XaVeTiZYEkcMhaP0pLZ5TmwVHuEGMOZ+djRGM2oKyxMJ4WOVppuqC9b87Da+ALbEytITL/IzoZ9YMr4ECIUdycqOXVeLHygN8iY5JMrlAdUCfnomOH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgro8MOzBcUkHM1kt8cOacUcSdGSMNRAVDBq7fUBorI=;
 b=Z2SAjTiZtGHfkXlcmF4kP0m3NjkwF0/fqNHI3r7zJ6RkbQBPXV3X+Lj2wahqSx5Zs05EavMSwSEU75Zq2J/GNOYsJuE/WKOK1hcdQ8mIOJ51GHM22IYEmQB9Tu/SDWn33fa7ZLS2S2fzQ8GBCDyghj88HHI9hCybV7c2yjmN1EN0qyHwfwDLMAC2ZKdJF81CMerRs4/bCkOc5wTatSB9HboZRypowNTE0nDupgLz5NdyZ7uGFOa2sBjGiXKFPJ2YuX1C1fm0iYaCfvsJDq47wpqaNdB18Je/OrwkTdmNg6BNseWUUHUNu+9EqMTkgnQ3TZVz21ZRxnQFllZ1Lq/3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgro8MOzBcUkHM1kt8cOacUcSdGSMNRAVDBq7fUBorI=;
 b=jS5+UcZi99/Z6UVUmxJroiSxj/oHhGu0OiEjGboSBEU6dImilqZxhc609umS2J+6Te56i2VADPfF76Yr2g4Pe++j+1MQ6K38rOxsUJD7HYs/M616SOnAJOuCJvlGWtxIYr6FPD93DK06/JIzeqw/unuN9B2BMqMAXNUkYdWDWF0=
Received: from PH8PR22CA0010.namprd22.prod.outlook.com (2603:10b6:510:2d1::14)
 by CY5PR19MB6169.namprd19.prod.outlook.com (2603:10b6:930:2e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:18:38 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::df) by PH8PR22CA0010.outlook.office365.com
 (2603:10b6:510:2d1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:18:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 24 Feb 2026 16:18:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BBCC1406540;
	Tue, 24 Feb 2026 16:18:35 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A870F82024B;
	Tue, 24 Feb 2026 16:18:35 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 0/4] Support wm_adsp hibernation for runtime suspend
Date: Tue, 24 Feb 2026 16:18:04 +0000
Message-ID: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|CY5PR19MB6169:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2734fb24-c6ce-4123-f20a-08de73c05d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S0PER5XEam9LHOgfJQ5PwTdXc4qhoQ42WjjaapzIoVNlaKoe7LyOFjxo368+?=
 =?us-ascii?Q?YIMWnjcYqw7362DyKc7GUn834qT+MNQqM61AQlP1v0iB24Ed4lu9vTvRDs0r?=
 =?us-ascii?Q?tt4n5spzipdpCijVGapdKD6KcemERYWyeTKzYg93WAcQmxYTJTcj39hpdu1X?=
 =?us-ascii?Q?Cs3k0gz+iX0VsQ8bvpWL0PnWh6WwTejSjWfD/X/Fv2PINGB2mtTe8mUQWobj?=
 =?us-ascii?Q?cz7HRea7nGAIsP/Rnl+n4SpSJh8kdBhmPuyKQUZLfmBEGt/TSw+KJNI/etnp?=
 =?us-ascii?Q?hH3XwZVfQLD2hFBjY/XkBeighMYC4C5BwuvvpUJ2h1p1BX61v+pZkNZ8yJ59?=
 =?us-ascii?Q?QIdUUFZBy7mAoV7O3kRq9/5fc4aoMVJ45Mcb2uOjmPOUh/6fe4UsGSNtJnKE?=
 =?us-ascii?Q?3PJWw2XgfS2IR/4WeObXcI7K5IiU41O7Ls60BymHfRVxUJq/0iQCCk6a+QHD?=
 =?us-ascii?Q?xh00RyrZpjiIsL0ejXXn0VNk5OU3dQqStwp3I+ttdM6Mec/bQqR4Y3YZTsSn?=
 =?us-ascii?Q?UMm7vuqvdut1NLOyPXVmeMS2MqtpW1NP0UhMwfUcw2n6m7ouszY7RTg8ve53?=
 =?us-ascii?Q?jy2/MzC/uVwRMi0cBsOfXxl95kkw6ldPLSRbWhSiQQUw9u07ZCWFEXnSK/W3?=
 =?us-ascii?Q?L7JfBl/4VhgRKFbXPbnQEt9u3WWJxcbAlBAS4b0ZKbYx0tVLvZfEnttm1E4A?=
 =?us-ascii?Q?2UifpAabYO8g+Xv9yviuwg9kajkKalYvQLl8Sk3CaAh6HcV6oRvyxbJs2VA9?=
 =?us-ascii?Q?5H12xCzCsVnejTOICnJZ6lGBvpijBAUJbsP7gN1HMKuAx0ojMjykEWmr2O5D?=
 =?us-ascii?Q?ZmIXA+yNa7eOqsNmUmE2+rePhLl7R1R7ixHbTdXH0mOP37EjL91QkQYy6IIJ?=
 =?us-ascii?Q?CmLulECUbcpLSJjHq9eT4CW6xt1SpIQ54/gTqNva4XQU03G/pt3t96ReYjfU?=
 =?us-ascii?Q?P1Cl9wHEnoPcNbHtma1wjrDK5uGUp6cQesVh/AK/qWw/1kRBbIBVWyTbRDhA?=
 =?us-ascii?Q?uHpdQDyJ7Xtr/fy9JkiCAK0HHDT/ypyH3BFGn9PBphKXG06sQlhURYP17Wo7?=
 =?us-ascii?Q?MsRHz+MHZXXf/pZa5C6BqEDlQzJVA4f1ACa5EI4t1UF9Xtu1j3Wej4k0yxKU?=
 =?us-ascii?Q?1HA698FZW8NXoGZ2KPMJpidmGmZ5YktV/F6wl5s5iGGRaj5RkbojPgFekHJN?=
 =?us-ascii?Q?4/r64ES+3lnC3HdVBgUs/fBuAyt331jVkwObYAZtPng2Bt6O5pDk2kOiPDqo?=
 =?us-ascii?Q?3Eq0swm3oS4tonSUzdp+jQzvEMyeqYgba1zHtyxy7VeB4a/hewgOiVj5gMbI?=
 =?us-ascii?Q?lAgaIl6Y3z2cCefBJPNYiJ9Wg1Kf8T1LgnOzohJAfm7poAnC4z9pNB4FOMzM?=
 =?us-ascii?Q?6jMbrIB2vmRtlE3HoH1T1dQGO1Y3/Y6UzTMbCWyyZx1BjvvSQMhMSMkrFGY0?=
 =?us-ascii?Q?fTkE6ZYjnlQE+TD8TMl0Y1hPMCv0uEC+PrIpSJNu6kkQusEluIFkhMyFdqKG?=
 =?us-ascii?Q?1FONsvtHBqJ6qU+Ncz2+ZxfeENBLBFlOociPw7zkh8GlYJ1FRX7hKFKm0oot?=
 =?us-ascii?Q?me8kPl0GSDe/NL8eVCdcJbvZpCFCV5azkIPlJMbqrb9V3BzlxKtTM9QqRtj7?=
 =?us-ascii?Q?ugPdnfetbdQRyBHcATfxGSAGcMGKlDxiXFrIu+SIX1G2BClQPQaPNrcqDKZc?=
 =?us-ascii?Q?eSz3Pw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aSjbFAZZF3jjKQ60qWvojGJuwz1L10WSnDh215rw19ckGyyz2CJgvl1MydXRHwHnheXHc3k2VFvQavHtaA0+4ZgNO7HgSCClcxtrJI4nezKc+o5kk53ATo84tSJHQBbDV3nlgNPjT7yP8yMuvWssX47UMXKWYpdRwQlheTjNgX9kzSe3Pgxeu9uVri0fPk6YwfNTsHlnSpSDPtm0bqT8AuNjaL6EGcj5mLLZbufkDg3nOB9lI615xMeQg3LkcgfGIaNu3b9D2VRLOzXN4/uz6LppcMmj16RRZMqUZBQS55NHCRrycY5VYblP1hPmeweb9QeDhz9hFpMHqtltwhfUd4OzFubII7Z/EkWi79ucvAfUIqCGRmkoT4lG0SAPn2mSsXgXItEQDU/mSerl4JxfRUbr24/6S0aPh84ZT/ajd+8C/HNfsH4YMlk9NG2F+6IU
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:18:37.0919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2734fb24-c6ce-4123-f20a-08de73c05d90
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6169
X-Authority-Analysis: v=2.4 cv=OZiVzxTY c=1 sm=1 tr=0 ts=699dcf60 cx=c_pps
 a=anORMkbxiaoIRYctk5qcAw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=0dS-fIzxx-oUyaO0NY4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEzNSBTYWx0ZWRfX2NajgoBYJQQC
 f+FeMznD/5jV4AEnjyeBX9EJCBg7Bc26wkkusBN9iUx+aHkcR9Ptb0Ws2NYGLGwqanT0QyoG+63
 xYO6MYm2qrHOuGcIgE1h8bbO20zaBROziYVC/4+hKiCJzDVP0uaxtx8txtJUi78vglRrDwgU//C
 o1UPLWhUZ3q3LBnUQcJdidZ3Jfr4VpWjRs6s6O2/Y+A8p4MF5wqTq/8H1wCga6IzDIFPVpcNmvZ
 V1k665Ixl4636zpHbroBjjXxIem8Gw5pLdksllep7Bnm7uX6FQhrBL1odQs8ngUGrqbm5xvQwXu
 b2CkDNHCkOdOCfD6wbIYFpEkYj8+dyQ5zIhu4SAsahtk0RPE5BOC67HAPWpL/zDkvhPJN/XxMHI
 guiDr7yYeh0XPwabtWOUK6eaMalJ6WkpU1ZZO6nJilweSCD0drug9iIuMDU6BotPgsE9Ptm+lYS
 0SzrFe9gHEt2P49vEIw==
X-Proofpoint-GUID: zIdCqmj3ejyX_wGKp4RJ8S2n1ujfNtl0
X-Proofpoint-ORIG-GUID: zIdCqmj3ejyX_wGKp4RJ8S2n1ujfNtl0
X-Proofpoint-Spam-Reason: safe

When the CS35L41 and CS35L45 drivers suspend, they are put into
hibernation, and the regmap goes into cache_only, but the firmware is
still running, and wm_adsp is not stopped. If userspace attempts to
read a firmware control, it will perform a regmap_raw_read() and this
will produce an error in the kernel log.

To prevent these spurious errors, add an apis into cs_dsp and wm_adsp
to allow wm_adsp to hibernate. In this hibernation mode, reads or
writes to the dsp controls would be rejected with -EPERM rather than
-EBUSY, and no error will be printed to the kernel log.

Changes Since v1:
- Fix minor error in cs_dsp API documentation
- Add similar patch to use new wm_adsp api for CS35L45

Ricardo Rivera-Matos (1):
  ASoC: cs35l45: Hibernate wm_adsp on runtime suspend

Stefan Binding (3):
  firmware: cs_dsp: Add API to hibernate the DSP
  ASoC: codecs: wm_adsp: Allow wm_adsp to hibernate without stopping DSP
  ASoC: cs35l41: Hibernate wm_adsp on runtime suspend

 drivers/firmware/cirrus/cs_dsp.c       | 49 +++++++++++++++++++++++---
 include/linux/firmware/cirrus/cs_dsp.h |  3 ++
 sound/soc/codecs/cs35l41.c             |  5 +++
 sound/soc/codecs/cs35l45.c             |  3 ++
 sound/soc/codecs/wm_adsp.c             |  6 ++++
 sound/soc/codecs/wm_adsp.h             |  1 +
 6 files changed, 63 insertions(+), 4 deletions(-)

-- 
2.43.0

