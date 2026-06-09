Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB253EFD21;
	Tue,  9 Jun 2026 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008197; cv=fail; b=qpaQuTTl4vkBUm0l0+pFxCYAbCh9wVw4arsdQRfkrX921gnZABk2W0wa9oNRQkwSr0mXJBvEQd8rGX63oVK8/q5rtUezmh3SwF3Yt5Yht0wVsGNzjVi9fCIM84uFiyK28nMZ3SYWlg4wb4orgonWg9FYIBosMK0ss2DG6mrsO7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008197; c=relaxed/simple;
	bh=7e2caO7t8CE6YcY7cWkxeV2BuJJ/U9lT6mahOtbjMb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LeA/fzB0/d9IYSr1lK0T+lSrXdMhDdMisZXKwoK8Is+pyAG/e6dfM2eumxkPvSHkYZfrpj0txvljAKf6sIVwFeDgYaBLs2w8ZTzUJEHFJplOKLWipF1n3YaBuDdh3pNsEOm0iIdciqq589qtYqnFh+AYwsprUNGa1k4cepvqgG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=m5aG3Db0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vF68h5sR; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="m5aG3Db0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vF68h5sR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596HXM8253610;
	Tue, 9 Jun 2026 07:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=mM+/+x2r0RMtvrzZ
	E0ChV+2WTnAbLaGmUU0nvainBsE=; b=m5aG3Db0vSxjgJjwAC6T/TzO4LDvurpN
	3JmoGUgGjheU7+rYa4x8KOFK5FkSQuGGlN0iE8aBhqK2uym/6seFl5wvhZaF/hGD
	ajjwKXAAzu1vcbOATMdq2g1nTAelji5yU8Jar5lLF5jqJYR81aHXRwJKdMVaGgSH
	+Uj+CckOlOLqapTYF1xKVoFpzG/VB2jsY+uf0LzYHhL5+/KESeMZZ3YUehjeMfpd
	O+fvOFntzbmqb5PzZLGeEy3Ifm43IS4UcPKevZPMqi+4KMZBLzSYY9HMz2+i1A5k
	nGmxyZbsRBPCZzUCAfDn/2jzNDiNZ0KqEX+I/OR1yFxKMlhHBgf3Pw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023142.outbound.protection.outlook.com [40.93.201.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfygc5ha-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 07:29:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jh1vobo5ISOB5ec+uB33tf8Ig5edflBqGgmFZAeGbgtelaJk6C0/x2FSW1JhKkxuGUJVBj5Lihqr7EZ0qBRLZsrSp5HNo9ziGH7MUIMEZWNIqNBCWjqFfUtPm7nAn7sjdT3QimBCj25AgyQzqC3rXDYifhduXkIoPvabZs2XDomZnrSkp6eDQmpZnNifKnN3BT2Z236hFU33Hcmkm7flutWHloDVxlxNwsjJ5xrE62tit2VJYCGLXGF/mzmhZozdhEXH3Kz2C10liiqUbYTXkOEVBMTKVHB7HNntTCcPE93uZ+xT1/fcoi9Yn9wpBBNJAkeu7f619+AzfwWiAWLFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mM+/+x2r0RMtvrzZE0ChV+2WTnAbLaGmUU0nvainBsE=;
 b=YiOdPGQzAifqJ7Yxjm02qo4UWsV44nToMTq6No2ba06KU139MbuHLTklhr6xfiPXqbvX3ww5TTUSNx6MDaANTXFK2minYZ2KBRwyT2/azu31enG/nOTlZ7aVAWSElipgOyaD5LbBkyfIn0xWw3b1v5DqhH6MsekAU/RsBulx8CpHgvgiEj3set8ngz+fhVkS6z6cUUmZdOVUhfZ9N+CvDUzRki4UNYvOjACd7UUgHgvbM9SS0usPrjBvmqJtEYcXJcDTes8PhI4jq+tBua1SNaglIvGS/dZLaluhbw9vlIOLunGVn1r32TxHuxpIh4aG007asDR1X6EPWqU8jLrS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM+/+x2r0RMtvrzZE0ChV+2WTnAbLaGmUU0nvainBsE=;
 b=vF68h5sRgtIoo/FjIpfx/MhOJAfdpqL5Mc0HqU1apR6HQ54x7lE8IU3aS1x4MgeBpDcCifv+Wv3VICoYK/b2sZtOINAJHZ6+lvHTWAnfmZgcxzeh+kd7LMDjAHgojYgqKq9732rmnQWFUT5ZPVl4HGsfTyDqog2Go6ZewgQvsTE=
Received: from DS7P220CA0058.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::22) by
 BN0PR19MB5280.namprd19.prod.outlook.com (2603:10b6:408:153::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 12:29:48 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:8:224:cafe::43) by DS7P220CA0058.outlook.office365.com
 (2603:10b6:8:224::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 12:29:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 9 Jun 2026 12:29:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5DA13406540;
	Tue,  9 Jun 2026 12:29:46 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5103B82024A;
	Tue,  9 Jun 2026 12:29:46 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Increase pm_runtime autosuspend delay
Date: Tue,  9 Jun 2026 13:29:46 +0100
Message-ID: <20260609122946.288103-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|BN0PR19MB5280:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6464d1b6-902e-440f-8245-08dec622cb99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700016|56012099006|11063799006|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N0wrkku0H/+ndjReUEQyR2YS/YipgYSVzxeJf3nGI4E737bQZaLtw3+ezi4W4LV27hzFt4ffng0pjUQKLRpIPdzf5+0zSTI03fYPbaPFVDkBePV8Qrpmk7pygCjPeVQ1teBX75c9jTtQFTmyUWID1rYyhKF/gTzeCCnAvEPsDKXq/v+BzHyKECySGbtXaGPeKN1+Vt+r8DHhQJHnYxqnC8d4ZsosRRtyE18hUi4xxfza6+fpqTmwTLozs7Se4D1xSYtlBVgu1m5NWISbts84AYXIqZe/HahjLPXl484MTmvI1Ozizehb7WrimyeYHuLuU4R9HQnLQSLDhDgsmftb8J0r7l4buP4WBo0Qu5XtXtXpTu4etBeknaoH6rr6Hmc1u9XASM5lHa2PFnTEmrGEgDdC7kPBcfPA7RhTL8B0id+P97tNTeu4H8FPydKE5kmvt5uiDQIJ2A+j54ex3gliVlNshaZi7mUUA18+3EbjqrTWi4IV7pVdUguSxUMeZDoUDxzvY9MAggKmG1TuCAZdcNYpd/c9/EfX5yC2uD015UJt29mzeTWgRpPnEymH/8D0PhFnadcNodZ6R1DXOh1x11VQufeBF8WAxKqLHVoB8oYtvcspQPzS1l0xuTx4mhONnEdvtdWi15mcK+pP/Nge9l68VIeX+tAX6f03WwecturLj1Jl+cSDaDKhPnKvGa2yPYXF+fR1D8G8Z9BJhO/6daUbo9zJuH7K5Wm0jWcvsuA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700016)(56012099006)(11063799006)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	somG/sZj8fzsKdE0qyZ/zgHMep0hzgkx3Q8rlsebpO288ISYvf9avGozIOPhtMtfKrt90e9QijlHvZM0CP2olg22jFOTaqFj3Wss19RtwgfbYLeCB9sExAzHClg2vsdovKYBsaY7QTktOe7hat+kds+ysHF3MEsC/0fDokHRwgCYEBw8jMcFkUZ5MqBkpcMCEI6m/P5m39D2mbno+c/aX2WqGTBszc4JD1DTpRNcfrTG+QeaqE+GTirEg2HxXWPhuGIDSIfi1hV66uiEm24f/YbxqTKc3Qtt7HU57kN8+PfzHeQHNB0tu/gBqGX13jxy5vrBti4Rf7FPJPuh3s0H5DuzVG2kI7/AkHhE5HTsocWqGVlBJoe3LmKBkuqkmYZqCoW2bOrslUNk7jkSjbHD6utx9TpiuXCOuoX1rmvASeCd1jLBjChVf7WLCTdNtyL1
X-Exchange-RoutingPolicyChecked:
	cwlSjostqM/2BtaVzzCC6ylF00OYVQ1wAcRSGfBUCmtnn9OYS8jk5uDgQPg839F6kIueDs/bNKRfySbL4N9MgLr2mavtT+e9CaW928Rk42iZFdUDb82la7SFrn4oW4AVjbsaz7p6Bx0L9IGR7lVOpN+ZUIGjggj15v1hS8NjvDNOzh2tZCBshfPzduEV9O7O3m8iymz9OIBjmsKFU46HaXCVkjEWtnzBmFbcVwLmmoAA02FREdYvQ9WgJo2Q1wGxnlLtNH63v9S2KyIncROw/i6ML0Ig5KJ47rH4VN8Cwe2UucEA5KZsuUtPupaGKI7xjAzuH95f8z36BSVfs2vTpA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 12:29:47.7449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6464d1b6-902e-440f-8245-08dec622cb99
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR19MB5280
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a280741 cx=c_pps
 a=h/+960zEkKFrtNevg2BoYg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=WE3oENCUmATueN7k5GEA:9
X-Proofpoint-GUID: YZBaB9SjztKTCcIe7Or1zSvIqDCkvLTU
X-Proofpoint-ORIG-GUID: YZBaB9SjztKTCcIe7Or1zSvIqDCkvLTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExOCBTYWx0ZWRfXzC+4vsO8KjJP
 zLSFA85LeaOxyxJLpnHWE49xOOMHnga2d+BEeaw5FtuLdQAfHFQmheE6MT/vwuIWVY4R8OaIUFn
 HqDltB8Ygn0+C7JJYOW/vJTGtsv9UuTgtHhHH8i0YsPmOBjDC9QKPIBrQZhIrXpvazXmylcetli
 U8dWw/xYK2K+Gj2NKgopEUF6Oe8onHV6OFIzDcoBSa/KdWKsGa7L5R/Xp9pFDPzTwPUR6jZnz7n
 CGjbOp8rA/RMwW+dKxk0VRw1pscLNY+CH3FlczmbhzfYv1Rwu2w5YsC/gX7J4wkaeYY5JmXk+YE
 Rcl3QYR1enFNjaC4C3/VIrPooAIS6TBwrQlcgULxKu7NhM+WFYvVrET9RK8JPpXnwrkxHrJ/xh6
 jvUvqcRrHKoHjjMAlpiYC/+r8UCc6yESvR+aIO8szxzIBxt+uHjrf8BxaqhZJqiGc1Ms9EcqdYd
 es3/6gXIvLxNYogmKdw==
X-Proofpoint-Spam-Reason: safe

Increase the pm_runtime autosuspend delay to be longer than the
timeout of the firmware's own inactivity timer.

There is no point attempting to pm_runtime suspend any sooner than
the firmware idle timeout because it would only mean the driver has
to poll waiting for the firmware idle.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h    | 2 ++
 sound/soc/codecs/cs35l56.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index c3b10587cb4c..2490b72c0a7a 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -286,6 +286,8 @@ struct snd_ctl_elem_value;
 #define CS35L56_MBOX_TIMEOUT_US				5000
 #define CS35L56_MBOX_POLL_US				250
 
+#define CS35L56_FW_REQ_ACTIVE_TIMEOUT_MS		250
+
 #define CS35L56_PS0_POLL_US				500
 #define CS35L56_PS0_TIMEOUT_US				50000
 #define CS35L56_PS3_POLL_US				500
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 6e2d92ab98e1..2e3b5f5e33ba 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -2041,7 +2041,8 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	if (cs35l56->base.init_done)
 		return 0;
 
-	pm_runtime_set_autosuspend_delay(cs35l56->base.dev, 100);
+	pm_runtime_set_autosuspend_delay(cs35l56->base.dev,
+					 CS35L56_FW_REQ_ACTIVE_TIMEOUT_MS + 50);
 	pm_runtime_use_autosuspend(cs35l56->base.dev);
 	pm_runtime_set_active(cs35l56->base.dev);
 	pm_runtime_enable(cs35l56->base.dev);
-- 
2.47.3

