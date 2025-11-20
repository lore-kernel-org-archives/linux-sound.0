Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979AC33A003;
	Thu, 20 Nov 2025 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646288; cv=fail; b=g4QnmDQGExh0n/uzogXHIsowLWVsZXKOeB6veC6rp1451DFpeoZIjPzoeZGTP4IBoTfc9sHGGNpti7XiOiChpElh69JVWBDwqNmcNtlWXbLzuTY5YFxDcf5xqvp2Vn6KAxYikZ++NofA9km5I0loXC+OBIQIDldlu5mgfBCa8Do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646288; c=relaxed/simple;
	bh=ptRMx/I10pc6A6Ms9gIv9flDyHtwOMmBLfUT0IqJL6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHSD5366o8VCRHFg94QTjI/R3FXQW0HGQJYOvVvgFAi4N3ALPbjxgHB0J9bRoQ21Sz7t3eUOJxGwFfRvBul1oiWOnqztP5g9eP9rFUcZx1oxxR8mLPV6iI2Iz3C1BOGsXkPIcBRNUAcjh/BOPXn2Ts8i19aB8seOnXpNGu3i5Ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YwwOyqmu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KPLW6v0J; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YwwOyqmu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KPLW6v0J"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK609YW460858;
	Thu, 20 Nov 2025 07:44:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zh4gkiMCArJ9SB7Tm0hC8HkyXtkuVnNxaERfq2L78Mc=; b=
	YwwOyqmueXglDjKPN4fQpws+P2ma+zdtQQUPzBqn4UwX6pQqhV99EvrO7gR4c2xF
	mP+DNgkzzp1jGu0/tD6jaKhoOjf87fZ8LHviQS0G5YQ6rnV85seWghqwvliASLlX
	YeVUW+1mIcqDDwZDSHtrNL3kdgE1TdHBVPwd86Tnu7wTbpqlFtGy4wvCHWJwpKPk
	Nn41HVM/VcLFTR7K8nJvy6s9zA7SJC4d2NCNqamDfB5wt0UZ7sHYUK4ALoMGR//s
	+2l54uiv0eH8j26PYlv30N+rFox/1bbhHjObu2kqvlpM2STGg/iSCkx1jy6OFaOZ
	1SqGsdlXj4JlLbYHFmT7lw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020087.outbound.protection.outlook.com [52.101.201.87])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1eg5e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:44:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4VsMapZBLYiu74qGvG1crUwqrHZQee6laBRDPPYNWWEOAGrLnJCtZpMaw6nFdM9dQN4yMK19A/DxRCf35TtUgeYbAY2LU2bDcP9gLO/oXAgWbFi7l1qPDCV04dly6N+NMl54PXsCDf0zUtIPKKllf1GsoLKBtTQqkjFS01Z4Sp4xorbcjkCbyqf8ibima9vhqBrdNBXWdOGuLz4jVD2SbomZ0HMHAkk9wkjesg1Jp3l7T2nusJ0Lk7+JosFWNQHqOv+K+VKMvDgmhdqxeiuCyEg5y7gWpxlbMlsi4QS9mSfbpLd9Lc2Z4DVqjvuKlROJMTJVeh9mzq6VIU6/wqsug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zh4gkiMCArJ9SB7Tm0hC8HkyXtkuVnNxaERfq2L78Mc=;
 b=AIaIoawrj4nzVfpKqvTLeU3KrZgJhcDj0QsLqPUvC8kY6280V3rAl+2sL/tm3OXd09WE64FnvZcMY9VmueOSRPBP9J/C/BlJl60pS1KHNvS2tWXx6LJjPWzv8/pyZOyzszTKnf9/rAKKxfXMCUh6XTxYFkwyfJWBDc+QmGYJKEc4XagwpdKUXDafBcmuINw9Dv13JPp/WrqL/bb4rHmvP3tzoo6qd9CKgWu3zcWdv4T+UTg7HyePjElBmWhlBFF+YgvqoOMwxmnnXx8xs9AaujV6EItMgHsYSuMtJuq/V4nuhsiTYGAAb2kXLPG400QQPVIwJlvTj6qYuMfQNTKsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zh4gkiMCArJ9SB7Tm0hC8HkyXtkuVnNxaERfq2L78Mc=;
 b=KPLW6v0JYbHMlGLXrQPS+3FZKrw3cRBtPUYxyYCt9lOEk6edHS3nYg18hzlVq9jGkKopLWNWeibcV2PHcbZPMRMNcgYDDEzfXLdJBo4NmMuBMf762qFq41Pd7to9IjKZHGXvjHpvlfazbwHYCBRP/Pm6bDraY9/Sg/drYadTaFU=
Received: from SJ0PR03CA0175.namprd03.prod.outlook.com (2603:10b6:a03:338::30)
 by SJ2PR19MB7529.namprd19.prod.outlook.com (2603:10b6:a03:4cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 20 Nov
 2025 13:44:40 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::a7) by SJ0PR03CA0175.outlook.office365.com
 (2603:10b6:a03:338::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 13:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 13:44:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AD34E406555;
	Thu, 20 Nov 2025 13:44:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8E92582026B;
	Thu, 20 Nov 2025 13:44:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/4] ASoC: cs35l56: Use SOC_ENUM_EXT_ACC() for CAL_SET_STATUS control
Date: Thu, 20 Nov 2025 13:44:36 +0000
Message-ID: <20251120134437.1179191-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120134437.1179191-1-rf@opensource.cirrus.com>
References: <20251120134437.1179191-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|SJ2PR19MB7529:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 16bacaa5-27c2-4a29-44b3-08de283af3c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aXFPoGCvXP/0NsuQlVkTUGrxDuTgNUjayc/ppjT8oKE0kYiFofUm33Sh+H9d?=
 =?us-ascii?Q?6F4WnROTixmNm+fw6RoQbqE4WAtnlQUi8aFkbXGtdKsJE+2hfZMsHkaZOaE8?=
 =?us-ascii?Q?JreC0XIwzH2IrwG0bAQ4gEEIJXm9PFTLPXZpiWka5FeU3ylLCKaTyDq3jzex?=
 =?us-ascii?Q?QWz/Nz5i0YA+HG2+/kmMmyQoD7uYVdc13kmIRq5QsAaTLfERdQR6INgLP82U?=
 =?us-ascii?Q?YccjWEwqrePKwSHb1Qs0DxM7Iz/WTNdbnos4fITwZwlTMOCx+pkcuYQCbIwL?=
 =?us-ascii?Q?d3E0hz0QpDqqvP6fru7EnCUKCzCg5EMKaCV4jOjiz8SHwznTG5fXNVLSAFr6?=
 =?us-ascii?Q?MxQN/Nhy2iqlOOVrGeUG6jPYQEB6xCx0FZkNbV5e8ucXVHlOnCyI63tOzX24?=
 =?us-ascii?Q?SZBixDhsZxA6RDNrIrc1RFI03UuSd3VDyNQsMM+BP1LYcHiM5p7yHElcGU86?=
 =?us-ascii?Q?Cf16rL6SlqOIA7nY09QEDEdwwFnqkslHF9EHoDtdTJB225RjyvUmXTUbDUdW?=
 =?us-ascii?Q?HNxxmP6yRCcrsk51yr4m2Biy8HdGQE2ZF4Wywufj8X2hfZ7+RurJJFzg8Ay6?=
 =?us-ascii?Q?60Cw1e4lYI9XOG2Nwrca1HLPkM+6UkbpKZ/omRq+yD9lUuX5p0ST+X78OvM9?=
 =?us-ascii?Q?0M8YjHCToLKfwFENXh8dc0DdR/CeYR1RH1M+jXObBUQvf8VuYoQKiiPYscfX?=
 =?us-ascii?Q?PtmDvo+J/v1w1f3APPSA+iSO5xcFgHUox13xGt0umfnHM5MEES69+C+Y13mf?=
 =?us-ascii?Q?4dC7iqlh6JthPxthg3Jl+E8IMoaGEcz+8bFVkqSSrd61r/McdKA9MoBggTVF?=
 =?us-ascii?Q?t+R7oUclZKpBzbngIcbL42oomo31cF1aT9UZPNv3FqEzSdDIIcdJh1z7yrQm?=
 =?us-ascii?Q?1OTM+cwOCLzO3w/YwheP/bx0DEiDx1A5vZK/HZ6vFzcSuTp1hDK031VgFCxR?=
 =?us-ascii?Q?Y6ilGo511ImEsMI1CYYWLEiFTVoR8SoPkNcdbs70lel9iIbLJUIgevTi+uRM?=
 =?us-ascii?Q?lJqVL8FJrBHnY5vnIrGC7qNQBz/bmeXok/84VG3Ui5Nlt9drR7pXUsuUoZAE?=
 =?us-ascii?Q?PYnvKg3vT22rajzfsaMrPSCQPXPXqXSyK1UCNeY90B9TVyxeQ/RTameHZFMm?=
 =?us-ascii?Q?JlTiNTJIZBwmE4NSvU6M23Qd8BwVmv3tBTIjXXlFV40K01UzdwQP8zFFE4gD?=
 =?us-ascii?Q?7x7ASYilCiVM5nqS5BlimA+y9t5KLGntbk09c9siqgosPpUqKGHWRCl3Se8l?=
 =?us-ascii?Q?0F+2qe8eCfBAkoyfasI/be4+YgcFUJtEQhgziH+jgmI6n96hFpHNGtOLSsfc?=
 =?us-ascii?Q?TgZB4cdBEQsjco6drypnhFtf5cTdwGxizF2SSXMNaTwefzuFrTCnke2NAK5S?=
 =?us-ascii?Q?SnBHETVLSlGBTJjUSD7vxrB0Gr6XJ9EjtomqMt2S+e/f4BCviriea6iJCZr8?=
 =?us-ascii?Q?los5XCVrYXg2XGiIJLkaG+xlm+w2Tqo6pCG3Chw322A5U8fhvUo0H1VXnr1M?=
 =?us-ascii?Q?RudEEFvfxlPwyPPeOAWSRK3yPoB0xXomHdcZvl+M0fqT6ff30J4u9ixTcUBz?=
 =?us-ascii?Q?dLOf0er6LLo/9Il/HzQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:44:39.2852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bacaa5-27c2-4a29-44b3-08de283af3c5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7529
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f1b4b cx=c_pps
 a=M3VJd0sitle1370pw5NXFA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=w1d2syhTAAAA:8 a=8K60sZ1CEUfmsYt1aJoA:9
X-Proofpoint-GUID: 2xMDdUI1HiDid8MMcYUa-W96ed_9IPu9
X-Proofpoint-ORIG-GUID: 2xMDdUI1HiDid8MMcYUa-W96ed_9IPu9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4OCBTYWx0ZWRfX2gJIzRMQ88fJ
 MDkLIy1r8I0NJAZ4c0ncmCF8/dObI8FJLmAeDPJSlZ5pCQswW0f0PLCAx0FYLiWk77Y/Tb1DepX
 lUoCkoOGiCUHc7K7WADEfQv+hY2V04c0MU7gGWXQlioXrEu8qx/Rl/uIgvPuxGX9z+MtcVtn8aq
 X85/5skoIE4dsRmhyTTTykmIe7GcQw+9WGnLnHIR6O22mwJlqnq6ppG6OGPNkol3LuYkcb9uuyr
 wOvKph1FxWaQP0yuYtcpfLNCx5Mw7D+hNgY5vZasEuUEKx6ByJSE4nkSo6J/5YoZ9LUpTaiHBZa
 0neUr0N3y1RG19OGvqHbn9iAP2OnSdg9S37xmTdgNN5MS6DL+FvbUX0WOGk+Ilj+UaKMz4ArPrH
 ZXmkQvRZxkBNipZJfKofjEDIjG39hQ==
X-Proofpoint-Spam-Reason: safe

Use the new SOC_ENUM_EXT_ACC() macro instead of SOC_ENUM_EXT() to
define the CAL_SET_STATUS control, so that it is marked as read-only
and volatile.

This avoids userland code expecting to be able to write to it and
then getting an unexpected EPERM error, or assuming that its value
can never change.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 802658720510..f5fd20c8cce1 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -95,8 +95,9 @@ static const struct snd_kcontrol_new cs35l56_controls[] = {
 	SOC_SINGLE_EXT("Posture Number", CS35L56_MAIN_POSTURE_NUMBER,
 		       0, 255, 0,
 		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
-	SOC_ENUM_EXT("CAL_SET_STATUS", cs35l56_cal_set_status_enum,
-		     cs35l56_cal_set_status_ctl_get, NULL),
+	SOC_ENUM_EXT_ACC("CAL_SET_STATUS", cs35l56_cal_set_status_enum,
+			 cs35l56_cal_set_status_ctl_get, NULL,
+			 SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
 };
 
 static const struct snd_kcontrol_new cs35l63_controls[] = {
@@ -116,8 +117,9 @@ static const struct snd_kcontrol_new cs35l63_controls[] = {
 	SOC_SINGLE_EXT("Posture Number", CS35L63_MAIN_POSTURE_NUMBER,
 		       0, 255, 0,
 		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
-	SOC_ENUM_EXT("CAL_SET_STATUS", cs35l56_cal_set_status_enum,
-		     cs35l56_cal_set_status_ctl_get, NULL),
+	SOC_ENUM_EXT_ACC("CAL_SET_STATUS", cs35l56_cal_set_status_enum,
+			 cs35l56_cal_set_status_ctl_get, NULL,
+			 SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
 };
 
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx1_enum,
-- 
2.47.3

