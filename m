Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3593F0773;
	Thu, 11 Jun 2026 15:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190771; cv=fail; b=ewLutUi7gPxCYhihIL+ncB+EZq7NJnYQGGXputNhyWthelvuYG+AeUjLnkty4pi6Lxywmo8EeZgHAleFhm57Q3c2B+4OOjVTeWDZ742NADJptJMk++HpUnKY8OsXN3ecClO/sxz+xGV4KK/wZhCUcJqpMYA5OrUm14DlV+LvNpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190771; c=relaxed/simple;
	bh=d4wkFhCVL42ZmZtox3x8Y3AOygpM41q3aTDUyFkorNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PboiVPt+ATeaBN4RV87B/FosUOTr5ddnHfMCp53K6U5/56Rg6Fbc6q4+j8g4jhLlrS+5XaRzZ28C28iMvYPO2FAopaSYLjlzyAs/ZzBST5szQebSK88bFGUll376+sfqFuz4mmIPhsmthqRHFLwqP997zToE+8SJ+j2JL8TpfZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=rE4P5tz7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gIU3T5av; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="rE4P5tz7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gIU3T5av"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BD4GCR3537185;
	Thu, 11 Jun 2026 10:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=SNbMwjUFPUko047s
	WhkNd5fLI2SlibGAlmPPfn58nXo=; b=rE4P5tz7iHOscO/YSTzIoZfoMZdqxmbh
	JobqztyDETyHh1SHrKV2sKdXVkSjcF9JMMiiqRoCIL/B67OHeOuxJn1mo7RoeYZ6
	DG5Dpw1LPqx3O6ycEEEf/OTA+/A7y0p5yKEfD3z9s8oEZeSHia2JmJ/h9lT+Ndzq
	eflKL5xrDhVxDE0nN2A94vEkrO+fVLh8vbOyZRC7ZbqaNex6zDBy0jQUUbSUoRHe
	yEFRZv3Cbck6qrIyRosuCAc3DYsHmX2RAuL1H8q8XwWaGzC/VzO1VCULmRE6O0j5
	pqpe63sfFFWDrilK3hpyq9SiGhsnHhN9X9X+Vv+yx6HBcOz/khnolQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021134.outbound.protection.outlook.com [40.107.208.134])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4eqe6ds8ge-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 10:12:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSe3aRfDn8E0S/FmGYr69HbkjDEHMeDqlZ0iWNPWVH7H6Doe2hRJvBwK4OLi8RZLpATLL5kNj413dyOu3dkJp+Q55Eo4Pi3EqDaEMh4Yod7gwmVU2nRzBqOp43sd9tD8SwZneXpTMU8AVtnKK4kT6t6j/iDJdu4H1hSO8SjMl0PEIVrRy9gAvz2ZfjIoYxJ7WP2M/LfgTX5Q/bdNkVwlO7zy23O/vRthNKnbbFcaq1j6IsJroDHI6An6N1vPRd5EDHX12zsScGaI2a3po8KQhKP29CDXobxzzN/5kyQWu72tsAHSFMYYReex40tMTzrbu7M5zBtudaCV2mkMC03wkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNbMwjUFPUko047sWhkNd5fLI2SlibGAlmPPfn58nXo=;
 b=mSGo0lFFD8+qtWUWWvZuwUxsC4Of4GhE/4gz31zZYWoBF8H1qQiP+GKQ+RdUXDk3QKPud9jFGmWtDKC+J2zme4vMBl3qESD5YQMb9C6WN16SMHBRaOnVt25pXKP4PkCmjWl7ggneVqPER+n8CRXMab0tMsdk9ODMurX3KidGwQgh7lVcLHVIlRuYilrN+/+X8ZckzbVOh5MjOH3h28Npck7CcoV7/UUBYdhJH4etk/ibLCqhFI9NU8BtNtV1dE9j+DNKIQzyfHIFdNxS8NKN1qiWyWAhLFi6ja5CfWgmd0Yh3/EVtndPzTqi45hu/0uLFvdu+sXE2nRq1559VgjnXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNbMwjUFPUko047sWhkNd5fLI2SlibGAlmPPfn58nXo=;
 b=gIU3T5avG/I4n+iSSHIXOMhbfUOLzcqRfUiGhLcXxtZKHdAQKC3WJkQ/C0PRiP4/U+xknNTt9cNvUo3Qx6WxwGfPBACXHy2HT5rB80yme8m33bn+OZKGADwEp25iHe+Lc8AR1iGP/WFdJDlpMjT0noc09LG/bf1IXN+YgbCj+X4=
Received: from BL1PR13CA0092.namprd13.prod.outlook.com (2603:10b6:208:2b9::7)
 by CH3PR19MB7284.namprd19.prod.outlook.com (2603:10b6:610:150::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 15:12:36 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:208:2b9:cafe::1f) by BL1PR13CA0092.outlook.office365.com
 (2603:10b6:208:2b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.5 via Frontend Transport; Thu, 11
 Jun 2026 15:12:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.1
 via Frontend Transport; Thu, 11 Jun 2026 15:12:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2F7EC40654B;
	Thu, 11 Jun 2026 15:12:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 22834822549;
	Thu, 11 Jun 2026 15:12:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Fix wrong error test on simple_write_to_buffer()
Date: Thu, 11 Jun 2026 16:12:34 +0100
Message-ID: <20260611151234.1111153-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|CH3PR19MB7284:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 23404ab1-352b-43be-a448-08dec7cbdeb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|23010399003|376014|18002099003|16102099003|13003099007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	czkUKuJprmV7nwUTZD530ohaadxY+uP91fE2DaOYx671RzdorSEoSEYBR2kzQYKRB0bOQ6BWaVz1rzJVrdPRLK7jIXGI6Y7aovY4d2sGO73zSLv1SVRJAGOdep/9QMsOCSgK/GnQvasFsyk870t74EZwES3MpjYVXDrtBB9e1oOUqmMpq77jCZfN/AQTT97Zkw7zc9kp+W82MuCLfZ625BYo69iW01l3Zk15svOFepHOc8M0b7oUFNMFPveWpIkIi49IiV1gFJo1IB87WSgV+RBH2GL2FNzHF1kZx5eTjdH/OBr3KZ8kGxTjiWxBMh48QGvOxUSzZr/7zmx66S11/brJuWj+LB0TT7RAoaHyEIK71gixmR+cRwKwpn3sVxQioirpH5AyaAzx3T1b5gln3AmYEVjVtbt/zNKsceQqxUDq2eG/f++qHK4fK9gGnqrBgvzvwek7G/sTWVMdOXbJV+a+ikZxBor9Tqf7O+emCSEo/M1xmTfAT8qwfE5Uz2sv7Ox7CDWM7jNJdc1uNstu1+26oTrcmpYamHto9WgxM1/b01IAVI+UGlsfv66qgCm+Phez0FOCdq/GJPRdhRXvRKsy0StqFKjlsUfaWX2HDcDcSTAiq74r+gnPZYEZreJlzYGN1tcUt1aRe96WjkZoT19fpE85SupScyNgC3shzJm8Bgvw6tAoP8UewCM9Bhnl
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(16102099003)(13003099007)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DSydgR2aLDL6byVM9yDKt8apYG6eQBLSaf6Z13/JbQc3/YmxtIXuwopF+HkSGYEJctwVPZcW6JsMcO5qVFy2C4DLe+plRr1Edw1PXVyWxo/u3UPZCD0ciSdVV2Wp9yZJLhMmk33At71oQEOj6/kvEIVYK0RFA8KApQmt5vcmlEmCt6K1yaBZKKV+PuMptlD5Lfe58SwHmYvtAWABiRkB0H/hUScGel2xsnxzfjVFoArwcfuakVgH0kRP/s5P0R+seKI6vR9kwEhmljGUQAWj2m4VPkoSLO0uI6Ql6W6ol1bCSfK3Ab2FCR8ohdMtlfq4JuwDm6yaxlWfni2Hwp6yf1gqyegEAD9Mb+Xki5aBSWlzlfC2aCcPoCNZ6wNI7efc2JF/7wvOvyIbAesCBGhN5uVXC0QbjuooF9ES22QOKmQXGUrwzJxTfBgjKVFEp+Hk
X-Exchange-RoutingPolicyChecked:
	qqKaW1UYpR6R/8LCdAXcVfeP1zhaIfgfNCyBvkt5MDUKRM7udkmFeF9sKd19diWyYZhK4ltB4XHFHrPdj+1fRxcQXDZTk87Zjvr7FD40V8gycr28g/RaxDZuGb5gCFhLiTsgKslmDY5KY3HRBu8Govp+3vdIihSLCU4ekb347J+wAwwNQi5TCyR18OChhezO9q2Ve2ahDjaGYqoLO0wfT90dGi2G6FVZAH19jfKCUu72L2zsg5cOX4Iatnzb9IAMAtSChdqY5x1R+YrMsLsqKf3CkLK1tbmqL2lUWUf68Pts8K4wGL6QI38tJocmsCbFhKfNrX6qSd3+RhUupe4RfA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 15:12:35.9912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23404ab1-352b-43be-a448-08dec7cbdeb7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7284
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE1MyBTYWx0ZWRfX9G6hfS1ycAzC
 BAMjLKVphzYt2z9nRFGjErHSa2dZ2uE7NHVQEc9GQcxRBOPYN/N9D0gFkRNOx5EPsgPiG63Xupm
 B2TZY5U9P7XCqVRFsqTXIdLfT21uB/vr/ICafivObU2iPU966olXbUGatFEsmgEaE8A++cTPkNy
 nJMpUcNPGZ2/jIzSWGX2zFeT7SXozdGQDJ6Yf71UfNT64TFeKmylxZtmQqP439xW2JcmtE3Kf0O
 QeTFwfK83Jh0pmzZ0LwNozoV+CdQz9PyuCTXR+Jw3aBgKpTtPyfJslY2xCjDAHype7C1zhnse7m
 YjzIVC4men1NiX2JCKIRmtz7WGgDSlo91Ho/VDhE5qrJrtTqzcFZ5fTQbYKWPh1fiiP03WAo/fZ
 A1WR9ZCSN2ZMPCfddBP/XiyXCZ8lVn4z2oPt0b19o9gDkUzOmM7y8VFIHqphWksxEvtK6eX077g
 QEajmy4wqi76gFTYVdw==
X-Authority-Analysis: v=2.4 cv=Zdct8MVA c=1 sm=1 tr=0 ts=6a2ad06a cx=c_pps
 a=FeeVHR8rqpo+Pf7fuAv9nw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=c92rfblmAAAA:8 a=w1d2syhTAAAA:8 a=VwQbUJbxAAAA:8 a=ZWxKnu4YsgHEB4sWVoQA:9
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE1MyBTYWx0ZWRfX0xwx6mEvIi4N
 bgkCZKVOBQJdJP85K6jii2gGoR6r5TkUoK7zsHE5OFSkvWFrmP9IBprxZKxGbgcvoOY7g55zJQh
 wS6hIztET3GejNKugXerNk+QfFNSCy8=
X-Proofpoint-ORIG-GUID: i9n-mUx1khulYhclGuOrDb1cmHfzqnKr
X-Proofpoint-GUID: i9n-mUx1khulYhclGuOrDb1cmHfzqnKr
X-Proofpoint-Spam-Reason: safe

In cs35l56_cal_data_debugfs_write() fix the if statement that checks for
error return to only check for negative values.

Reported by Sashiko:

  simple_write_to_buffer() returns the positive number of bytes copied
  on success. Since the condition returns immediately on any non-zero
  value, is it possible that the written calibration data is discarded
  and cs35l56_stash_calibration() is never called?

Fixes: f7097161e94c ("ASoC: cs35l56: Add common code for factory calibration")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260610093432.557375-1-rf%40opensource.cirrus.com
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Mark,

for-next
This is low priority.

 sound/soc/codecs/cs35l56-shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index d9f237bf8168..f14e2eaaa4ee 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -1260,7 +1260,7 @@ ssize_t cs35l56_cal_data_debugfs_write(struct cs35l56_base *cs35l56_base,
 		return -EMSGSIZE;
 
 	ret = simple_write_to_buffer(&cal_data, sizeof(cal_data), ppos, from, count);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	ret = cs35l56_stash_calibration(cs35l56_base, &cal_data);
-- 
2.47.3

