Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FB9334C1C;
	Fri, 17 Jul 2026 09:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280437; cv=fail; b=jw8Ny0CBjcaXurdLMPm7zx6orP0YEiqt8mMLzWuM3fHARhhwDq+egba3DAScG7tnZUvEkqKQmrtVBItc6SMRC6LFLe7stwhChxWRWiPpWeuEPTDMlvXrgNUT68WkH08U7FbWtBi2+/3FFLGGNzMcybqWLP0LcVxWtBR6cRbxbxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280437; c=relaxed/simple;
	bh=mcbfgveXLQ8IWDkmigAjaU828G7YphH0nMEkT5/gdC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AB+JgGzUcAfRTnD3r2pUx7GVQ+Fmo/5xw0EjFe+TmAmuo2nAOaA96Qpn59oqaJk6lOlruDPOjhfGqjBABNlSpuhxjTj9HP/sGG4L/sugB7zZQJtj616pNLrvp1EwFdVQfP3qt7yMInRovMIX7ajpzf2Gj2uvrjeIDV0RTGv5Nbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GTdDTCnM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rfBw/1Ug; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GTdDTCnM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rfBw/1Ug"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H5mPC32673182;
	Fri, 17 Jul 2026 04:27:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=aDrUq3CLSf5q++Sy
	U6BCf/r8GDkOeTL9E9K+2RcStiI=; b=GTdDTCnMDXKBj1LeJs1NqZuh1oY2j7ry
	2pqE0/jGSt+Au4HJ3d2+r+Yf49KdCO3bSq7QKRMr1jmzJLxUqAzlcmCEcasW5XRk
	AQ3xE8rWRk4ELgvjhKeKZPi1kyK4GoUwekppD+WpFCKL1Xb8eCITo0DpkLLEWStL
	EJsXOgVHbt1fQFSLeqx4rGGbtxQ/x8LJF4B94Tk195hZZo9EHNYXrTFtJg8bYEeG
	7RE+g5Rw8yPAMJOPBbq5rCzZeqlV0/6Dq+rGNqoQVmBdklMfxkGoWjEcQh8jb65p
	7ki3JFXrJ37UDvpcdrxCj7B0WJ46aiMTgkwTJmrexl1kd0vhjWwDRA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021117.outbound.protection.outlook.com [52.101.62.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ff3tt0t13-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 04:27:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkGqFH/RQe6O6ba38NfC2R8MTKO6wmiaUpfYFLzvRkZMHt96fRcjOTJ73VTF9V4NG8Wpdu2ire69a8V7FOqNpqTzDrhpsg5hyyqvlECsVl9DCsRIKv2eLkESX/iweQfbZSQsZL0bz3paEHBPw1wOtDzDKUfmWfg5E4lAWta+ng3D//K55LeX804UycoNqAyB93kCHOJ9AwLfXNL3YQF2fRxOfk6VGS6zwpxfvHsbJl1JWUVCsT6U5Ws/SCPnEGj2b80P2wounWbDzNB8Z+/+0Tms3Q8DUIwNo2JSDm17VkZgrXEoTTqCuA/CdB7KkTHaRaxzqLQ4WM+hI90KU+HmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDrUq3CLSf5q++SyU6BCf/r8GDkOeTL9E9K+2RcStiI=;
 b=c5OEddYb/VH602wFOJQxLsKRCoF0n2iF7cjYCIonLHkkR7cmYio3oM5RcWV/JahwBCxcbEOofqhIYcWZMuZi09dsV+HZ5/ohfVMa2ANoKgmSoehVHgBuqCZAda71ieTlqiQLerdt6GIz79PeZPA9qfbHIi7jXLLM68uPqWH/Ne0VImdKIuPOaTmimC33MQS4GOEhanLWnuzwKTCbpqgQdyMhEunMn4+JaT/FZTlcdbVQKD4JzJ6Au5BVCnDpMpF03ICNshv6Cqn16Lm5bnTklSmpdK8vj9Q631NIumn2ogk+ONttozCENL/UqT82DCd/uOU4iB5Kjt42dw13s5PuXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDrUq3CLSf5q++SyU6BCf/r8GDkOeTL9E9K+2RcStiI=;
 b=rfBw/1Ug50Hev1Y1wGhWujiabtBLJYB440zodIZzXCRkIDzzW7qv7gW5hL34+upA/I1skEsA0L8T0+Lm11EJP6RJmXqu8RLrAPKTVsR8IfrBsvQ+Gn+Z+C0BZHEWycEh5bp0yxpLDGcBt3gpx6JBs4tesUSrETxcZS+GsMAM/LU=
Received: from MN2PR20CA0061.namprd20.prod.outlook.com (2603:10b6:208:235::30)
 by DS4PR19MB9122.namprd19.prod.outlook.com (2603:10b6:8:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 09:26:57 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::32) by MN2PR20CA0061.outlook.office365.com
 (2603:10b6:208:235::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 09:26:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Fri, 17 Jul 2026 09:26:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 56208406541;
	Fri, 17 Jul 2026 09:26:55 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 496F0820244;
	Fri, 17 Jul 2026 09:26:55 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Remove unnecessary goto in cs35l56_runtime_resume_common()
Date: Fri, 17 Jul 2026 10:26:55 +0100
Message-ID: <20260717092655.1730484-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|DS4PR19MB9122:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6ccae3f0-4daf-4851-aee2-08dee3e58c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|23010399003|82310400026|10067099003|11063799006|56012099006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	g0MU2a3Jv2IeP/t4zYeIm1Ew8HfVbJ0BDxC/ifleGySfL6slBClPg2ApurRHzTphKH1HUb/NXKrdSCAu4VaB4VTbFi5We/eBnv+XEJdc4GBzmSuiTbUBWP5wxCt8vCFVSfj+jGPHtGLbWWjv8Ndf3srMupAQLe3d9OjcD+xk74vpxxs2icnATKOFrDjHNJco6jCTRpx/bzI68sljEMMqJB4VqLQ2ntyt3vdQ5lUscI80KkCqEyPZTP23WJARyt6+rZgWrGPLr3atlpG4xpUYbpKMPZvkv2Dr6soiETU0F1bsS6xAE4xoUJIa6zfT9sOKjj+v2Yl43gzRBnPUKGJZwfZFbx1Sgg5IesZk9FgLjzhGhAIEnHKK+JoLwnCXXsMRJlRuTIq8HllssTOH5mSR1GWSiDyvAVGX8Fh/pzRvrxN9MClGQGxkJv41+z4hsswmaA2Ec3pJguQpPR2+3mtpkJWYt/EmdYRllbQvQEOd/FRHTSVoQOPCRWscnm79+wFaxsYotB1uScDQrS49ZNwbZVb86CsRLgPGgTSd8XUuaMRbii/zJQLCCpsNW6FiQnNYif0Lvhx6jzWFq5FIVyrv4mcobLi0KCpaOnZ/l/wD4K40ycK+fVqPffD1dHRFwJYW5zUfU0MIwPJyjbfNoAA9QgVtZskY3kXonMdTbKGWbd2vn5r3hUjdZMZvTM+WgmKdQ48ay2yQs2MKcJSHPSPzuA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0cELh+ySMJ8E4vM1bZiMU14NiEHEw4nBDZMsylzxnsOjLohwc0nlmJ9YykhAGH6q9bo5n/MjXqBTLAipnB928VmUsZMeenZERoHPRQ/N6mMTbhNLv/UqFIg8uT+VEEMVc1BSxAkijdZ4xLs2Cvn0E3aHq+i05N0pKx30eO5/Iz7yHa7AJGvfVC9l5ZK9yzDtyJzngpwIQIaWBfKhYv+ndZWFSjyBKsljW1+K6pSoWkM5k1PrqrcEBPYH799k17+lyIxLqEeOgMjNYFvZHvaL6ZgRT+M1fII3We2L2rFQ8zqovxmzCWPyhS1nHNLmmeHY4aZQbvN1U5zXa0QosxkSqhuNMtoF3ZaKlA0aHHyvyTC3fwUyVxlYqcP7eoYT1Y9oTkyt78pKsH22+J64FMkRaX0Dy3rk4Tj3Xu3PwwxBlVroGJApK5bkqf24TJvRm9/K
X-Exchange-RoutingPolicyChecked:
	e8UJN8pVm9bBSOCB3GUCoB2IyHdstWI18sLfTBMrZbjC+a064RAJuu9QfTvDqTt1PJEE/jrj3VZR946BcAKyyK44s1Yn9bQfxQk+y2b9HnOQy4PdpTXUFKZzhw1QsYUgmiL3d5KDO+lqqQyqHsPfZG5K6DlS4ssb2NY3VaxbtBPj6zHYU3eI/pNANdcqY0KPKZoxl3IBd/DT+GmwkwDQ/mBZvX37N9F1lla9pe5S/o33bWs0RmoOVIg68Z0ZGu8mhxE5fCAUSOax/WgJfb7VcN5JJGiE4YJm5AY8C2PTnt0bHaBlXvmjPh2t+wuVggeb7HY7EAseJVKXshVWZy42hg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 09:26:56.9429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccae3f0-4daf-4851-aee2-08dee3e58c25
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB9122
X-Proofpoint-GUID: VWB-RlTVy7-vMLv7XRjmeg4HmFbsOUYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MyBTYWx0ZWRfX1aVzMst4mKip
 c7q++Hh99B4P4gLUA6pCmvhjNoT0cd5TxvDTdy1VRgfzE4tq1yJqfNjIKN0caYhIrGPxgcaMz0T
 MfUQ3v7ApxW5MDkoB83rMPKSNIHXhWENbpu2/QNpTrWbbGUlYbThqoawr9lcODYetMjq+YC59O7
 Eg8gE8CjQxRN9N+mfIwwAv0yRgOtSQWj6fL1ElNjBGi007D6b3/qrNqjpL81CId3dRC1pXn1yMA
 d2zk/Jyc2sdVwaMiCKN3Www/t5XWy7ve7/BSE0Ijw2r32MQ4+RmsSVFe24Xkv5Lnq33ULoLMZp4
 SGJoeOwdFqxcnSJO/Asohb2yJhlmSXl5GnLbeH/NbKhD+pkY3/C+bE+5UPwjK4o8j4I2lkAdvXZ
 T5SmUN7mJlxnAy1zquYo/E8YS8s4sc8R9brrHBOSfwhk9i5b07Qeq6wjeYA424ECu2khnOsTQAn
 D5+cUS6aqlJCjoiG/7Q==
X-Authority-Analysis: v=2.4 cv=e4Q2j6p/ c=1 sm=1 tr=0 ts=6a59f564 cx=c_pps
 a=0ugTtL2IYW/sDoruYPcCDA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=pD7yZ2Mvqx6XgYXrYv0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MyBTYWx0ZWRfXzVuBBZOg2aiP
 XQ1TXYXP0DbsRjiYbiekRiTaDnJANXfD91rcXFMTLvA6V/g3H6HgTCMRme9wRIJEmdBr2nu0LNU
 Xhuerg/AnpggOUl2w7CXK1jzJNt62Fg=
X-Proofpoint-ORIG-GUID: VWB-RlTVy7-vMLv7XRjmeg4HmFbsOUYo
X-Proofpoint-Spam-Reason: safe

The 'goto out_sync' in cs35l56_runtime_resume_common() is unnecessary
because it only skips a single if-statement and function call. It can
be replaced by inverting the conditional and merging it with the next
if-statement.

This was a legacy of an early version of the function, where more code
was skipped by the goto.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f20bcdfd35af0..b40bd3a8d27b9 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -811,14 +811,10 @@ int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_sou
 	if (!cs35l56_base->init_done)
 		return 0;
 
-	if (!cs35l56_base->can_hibernate)
-		goto out_sync;
-
-	/* Must be done before releasing cache-only */
-	if (!is_soundwire)
+	/* Hibernate wake must be done before releasing cache-only */
+	if (cs35l56_base->can_hibernate && !is_soundwire)
 		cs35l56_issue_wake_event(cs35l56_base);
 
-out_sync:
 	ret = cs35l56_wait_for_firmware_boot(cs35l56_base);
 	if (ret) {
 		dev_err(cs35l56_base->dev, "Hibernate wake failed: %d\n", ret);
-- 
2.47.3

