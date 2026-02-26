Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CCB3624A8;
	Thu, 26 Feb 2026 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104661; cv=fail; b=nL6NhHb7/JC7AVi2dA0fKk8LNEuyD/uct8o42F53aRXlC37U/MGFKBWdWRI6clQ2Kv606YcpZCO1+kZegTFfMs4s1/mhqHj4v+t/zyQ6jgLjfNd8hHJocsQ70P8LB6lS1BYPDibTsYUZxOSGDJIRI8yDgTlP99POfvyx6L71sVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104661; c=relaxed/simple;
	bh=uBuB0QEjN/Xv/tC2OCLNx9eTYeJiVZ38GqA4tPsKYFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LRRAMzfMTwyZWMSKm1dqR54cJ8quel7St1QuQfiZ/Mo9wRqbqVLyqE7DQ2Q6GiU3l4snU49pDEld6CWyvy7XQYLbVY5fXosc7KO6offpEi0BeUo+b0ud6TqA2cehzVJIgCwa5grWvspu6tIOQELfYL6P+FmqQO8twr2cYun+1xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gZSrSzqD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RM1RSCg+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gZSrSzqD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RM1RSCg+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q6wIT8698084;
	Thu, 26 Feb 2026 05:17:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=5ViR4SZMQQ/b0X3t
	FI00C3e9bWVXZUeg35YZsaAcHb8=; b=gZSrSzqD2IL7tNFJrc6feQdO5YS/TExB
	HuasIYC2tKzvtKTJiU00POtIZRiw/MxPwgW9QQzSSd9DkAqv7qz1gJAdUEuudi8+
	0UQ/aKsAlpqwTnjam47altbGyiiKfSEXYLSxkh1EM2x/lX4GVVN9DWnY4MwnZfXf
	JqLsJ36c1iJQPznjWN0FmKn06UiibuznybB4Fs6Eb0FfZyUmImJs37SCURLEKWmC
	igW3lIgc748vYJyd2ZNQcFhkBs+kAHhZcFXicEzvESXznimpTdkLQneTcqBj7NN2
	PzgIeSsJc7ab0VjUgDAEc2AfpHNlmpihmpo4e5+IDAGrLAsYxm1qWA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023142.outbound.protection.outlook.com [40.93.201.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j5st4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 05:17:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H42ActS2LEcdOv9Ci80SEO0zbrQv4A+6UmXYZRITrTLIzLDLuL1B2IzmdVY/DponQmOsb3Din3M8etWKA067OxM5K2iKo9WETPBZ1OkMT6IdDkEcBhvwxwmDKtXeKb7L1hg/CDQfY6Gf/LM5jIGa2FEbNDH5rb5W9rUlvGW3+37t0wchMpSedY3jPirn0n2c/E8aNe4cXp46Aw/VG3JLXAgsnk00+tY6UzybGvWZ5kohrW6yKz+ImvaEuIQWmUQ3OrzdFL9rolv/D6jNVrdVyYLP0V/+TCWGghK5yJMi71h79HzoaX5mam9ke6FKmtcKhM80FW+H0wAktLC4RYfs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ViR4SZMQQ/b0X3tFI00C3e9bWVXZUeg35YZsaAcHb8=;
 b=Q4ZPE/4ghtsInJpFb8DRZMpR6ipKNM09ZkrOUO+Zc/QX8UO1/XuehGZ+nL4qCmeWLXZ41ryo01lV5L1C+6fkE0rTsMtEcNXql7wO7yNXDhd170WmeuelrxU0h4BdbTHJTcq7pHZZRpJNQ79V1VPi+veeSLoZ0LQhVzzbMUhDMW403lPSaXnLg+7a8+l7H4EF1ShfXeAa54PvlO65mvLL9DpN+KKGYd+BkpfnBI+qEJvv9NdNyc8sHYqnvB2ZkFpopFgOCgunXP2gz/B/gEC/UVqAOVhvjt1tOLOVbFNrlahnHASaFBMnnA0E7y0LPMul5vFduDqUcAB8SstsY860Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ViR4SZMQQ/b0X3tFI00C3e9bWVXZUeg35YZsaAcHb8=;
 b=RM1RSCg+6lMUrm8EfcGfAqGLtF7X4ya5cYmp7q2aB1/DB9ROAX6w/cBMV6Q8JGmCa7F6MlZW+YiVqzglUZaR8tXeR9ZWaXRHp+RuF7KEC3S31kb+z0V2FScnj/5u5OMv3brckSC7DjSGhLfOnBByQ+kMv6+sRSf+YWJUfRdUvd0=
Received: from SJ2PR07CA0017.namprd07.prod.outlook.com (2603:10b6:a03:505::17)
 by IA1PR19MB6228.namprd19.prod.outlook.com (2603:10b6:208:3e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 11:17:31 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::39) by SJ2PR07CA0017.outlook.office365.com
 (2603:10b6:a03:505::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 11:17:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 11:17:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7CD20406541;
	Thu, 26 Feb 2026 11:17:28 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 64CF182024B;
	Thu, 26 Feb 2026 11:17:28 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda: cs35l56: Fix signedness error in cs35l56_hda_posture_put()
Date: Thu, 26 Feb 2026 11:17:28 +0000
Message-ID: <20260226111728.1700431-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|IA1PR19MB6228:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0422b6f1-a291-4d62-9940-08de7528a1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	MLdTJcR2uwyE0F9EhCmGlG1VuCFrs6SuA7WvBFwy4O7pwzdBvWAfbzZHcG23aKsvAEoMit8PIUopvItTmOMPBiRI0VsvM27mhPMzodbWHqJkwU2IRSxmCjLLpiMM5+5XPOCh5RCbqOfvfAjI9CDT7fyzHZDCNnQ86NeJH9IW4eEawRo4BuxuDMJNIG9kUn8IY5d1ZAWVc9gOPMfX90YBF+TKDIDvB4HYoyxkzOrL0uMdLebUSRVF6O7niO6QeNnFKwQJAOpWQ1HXaHbu9r19ILH7Oik0kBaI8FzTtOMCl8xAg3vcCoIKKkjORPuptq8yZqND7izj0sfRoIQ4VbZKF9Kh7YDKhHVewnLxk0DnQCM7apVU3PdOyqPkxXTddZ/6lGJ7rvuwy9cBrLhO6+1gATWtpgsbvJde1dPb7vWCjmvxSGQfYeCQK7S2po47utsyzs5hwQK1Rp1p3M4zStAVQVOsuT9rTRyMtcxJcU9eygjj1f0TpguLdluheiKrlMjLfiehwFV8HWaPYyoTZArJDLyT+vFzST4lQseM/2HzpX0WW4dK0RsN1pqj3xc1/GkHh06FuQs6Mm5HSraA2gjK+zTrF+f57vl9Gm3l1JIVPhC+7nWrmDUDuFZbzvz/90gVPxf/GQi54Go3bmzuHEKbyZCZIVQOVwnTtfpCd5TI51pG+RtBXZ3d/92GWMtdT+EZI1Pl1kai8CVIPrNJ0WqV46XY7ZumFxQSkwnF7yYuzzjKrXCnYZS61lmQKqaIR4P8hcCHX0LOApaGh17FdWs578YLnwhxjgyTNfwn4r1Bx3NLSYaKujkZH6EJUEqDzD88JZPgIgnnoHZttZ/LmWX5RA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NPhJ0MomXOjeRJXlnEWHl4bquR8QV6d07XPhJcQKDQSt0+cglmrIP75pbXEAM4oA7PsHp5fu1pdClAYeBP4/rYsnn8i7H1JhQ882TCg2hs43Ik1JpdVIBo87TLN56OUMvXL0ZGzSNyKy3Tl4fyfzxAET7E3QzD4lL2uzzAkQMD/00y6jSTa1D3ioq079zNYXgo/vF4Z9hMgLzpt591DucumOYcl0mySQi5+74R7DLimEVFbCw197D10Lk2c5vqBmSESr/OFybHxTDZy2kbNbWuGUQAvjUU/kYAmhJOSoglibLbmNpOTARHao0MFFmSo54yKBcq2gfABBz1scVxmYoMCPqy4TUUnYQ1kuocY4ADbUnKWJEoOp0jnvoeYT4tbFLcqR9+IYWWZiUY3rg8+D1hEIpW6P93oXJG0Nn2lFWdQIT8XR7HpmxntjWrxLZqhc
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:17:30.3117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0422b6f1-a291-4d62-9940-08de7528a1c6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6228
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEwMiBTYWx0ZWRfX5ZG5e1CueB1M
 7FZ2h5FLVkkDA9Wu+My4y2vhRufmJYS4TpZcn2NNSkwLnJJ3An+AoUsek4IhIkEAHnZiet5NrDJ
 Voovr7RBoXPrHhtpXJabpktkWeKu5//5VheUEwuvnwQkFL2c+wf3NZixPuXZVG1p7h4rvV84TK2
 mEQVwvXB/HN/ZLGNh+5to51L/SW0K2L4YOX6AZGaUbW/R45bgc8mZlmL7GSg2HLCMg337mJkNMV
 ut4kJYjtcN6NEQBRIigESmrynmys0ljVI9t+kTWffEV7Zu6rG+32R/QAHX8cXPavQekEW1gNQPC
 99xXzHN2TqaZQckwcu+M5xC8DuZgph+2GRD19K2o8X5ASmPPL/0s3S7+hLqbdDeAohQpu+sis7n
 iTVagIPS6Wmd3ziTAeNoWO4MyHikl1C5Y+pAoB6nrMTUGk3k5cZKUB0piWEizfMGbUviklfthSN
 w20gdFnHPaMwxztiISw==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=69a02bd0 cx=c_pps
 a=h/+960zEkKFrtNevg2BoYg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=k-pK7wjOgmN85Yy3wVwA:9
X-Proofpoint-GUID: wmoxyn9fxJdpLeTynY0YuPRhLqGnGe0N
X-Proofpoint-ORIG-GUID: wmoxyn9fxJdpLeTynY0YuPRhLqGnGe0N
X-Proofpoint-Spam-Reason: safe

In cs35l56_hda_posture_put() assign ucontrol->value.integer.value[0] to
a long instead of an unsigned long. ucontrol->value.integer.value[0] is
a long.

This fixes the sparse warning:

sound/hda/codecs/side-codecs/cs35l56_hda.c:256:20: warning: unsigned value
that used to be signed checked against zero?
sound/hda/codecs/side-codecs/cs35l56_hda.c:252:29: signed value source

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 73cfbfa9caea8 ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index cfc8de2ae499..eb66827eabf8 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -249,7 +249,7 @@ static int cs35l56_hda_posture_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
 	struct cs35l56_hda *cs35l56 = snd_kcontrol_chip(kcontrol);
-	unsigned long pos = ucontrol->value.integer.value[0];
+	long pos = ucontrol->value.integer.value[0];
 	bool changed;
 	int ret;
 
-- 
2.47.3

