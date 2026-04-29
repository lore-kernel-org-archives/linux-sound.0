Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAFC371CE3;
	Wed, 29 Apr 2026 15:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477266; cv=fail; b=RdFLnQFsh/fzxiYiFLDPhPvz6AcACMgdYFr8EOttE0KfLCVh7JP7ehVQv+mDJxx9RJLGl8Crpy6n7zi1T7J32OjQCFE4jg8F7a0qdp3z8Ao4AC0Qk+qIqIfBCvkYF6cfHFEjNITyGEW0PL09MWdXZcWIlwi5XIzVrVOjQAyJ4UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477266; c=relaxed/simple;
	bh=A223ijPyMIjYAwy3/xQsQTP24oZL2ivWDMErmxdjBAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=du4eF0jgr+zjgNSsOVPjP9IWdsEltrgQA+kcUkm6n3hv1RuMvRqExt5qReZPTRdM4K0BWKdOhNiI6Nw6ZQcCn8AaU4aywOTTTrlbzeGM2DaStcp3EzBPQY05qPFnUEGhF5mrkZssYaj3DN4EEUR7LBHiHYIEr54vqaKz1HxeSio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LdDhfUsd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=B7dFxSDm; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LdDhfUsd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="B7dFxSDm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5gj0f572975;
	Wed, 29 Apr 2026 10:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=l9hfHu1D0YXn7jta
	HxofhtMEwutr/VzCszmX6OLyK1E=; b=LdDhfUsdr8wTxKOu+yfexe0sAjU36rH1
	NkHJIywZISLprPU9ZDl6ab36+rL3ON/jTZaEVDzR5FobvhCoipjLsTsCr9SDNnN6
	S37RGXvqUFCQemCqru7s0kCevR5U6dIWi0O7SGEhw6Tsun8+Z2uyCHRzETjKsDhO
	5XFl11DUpfuA6CD/VoFR9cyZ95h/F6tPB5YB4H99irCpGUv0qYtt+PFJ0tZRdMsA
	hQPwFq2hLS1j/BXc1uEac9PB2VDiatsrJUd3FBBiYwILQuaw8NLVrkzApZhtkSOo
	resYWDcY0V1llAA6SEBO1qRnJfIJ9z+KTKLp8G81IPF8lZFER6kRlw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022081.outbound.protection.outlook.com [40.107.200.81])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10dcnu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 10:38:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGtHIYVzcY3rCMu4H7DXHpbjCtZJdfxa6GLBD7adR0bQz4IKRu2SAYmH96UbeuiqBdExViL3gF7c55k5RVV1MQh53hvJszJkJZyDtDnQjrQwFCVex6jEiE1mgyYzVr7jSxG2A3IHKRdc3b+tMr46IXrTOJLXC2prqlqOwJ6oHTph5zs69n4hSTGlA9iNvb5BOWjHnAy5TEkW3a0zIz06LQVXv+BTBzy5tq3PPu3A4YxhPA8M+pgVZ4EjD61BjyxynHEd+ieqxL1wqHUqRsy3fV8Uf27bNy9XwISuIbIZ5XUYN0VybYcE520uBfS/EBC/XXhwjEwBTz8YNzWsZU9LSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9hfHu1D0YXn7jtaHxofhtMEwutr/VzCszmX6OLyK1E=;
 b=tSFc/EdoBGyDhWpIUjjWpjsksK/H1kLhArCfKBM5fkapj0vcqBtBgLzccV48P/KNpaB1uNKB1TRAcMgL/sPd8SJ7QvQODTSjFgXZH5gK02B2OIYfdrnr+bUWe2auRI5cjl91iAEIQFdAv8Y44CEb76PqgnmI3y8VADQyzoGxzMmeTqq6zdV0EtW12dnFjrVoYdgw39ksDv2rEmMLXRVDT0Nk8uT4SjalDZMfCByXcDzvV8RSMWnvdB4P7+4i89bc5qkciTaO/DSNZuilWodD9IdU58pbbWy6MKbt4ArRuzLNKUTV9qCr8pj+dt+0MSy5R4ayscgDL1asBSAScpvq0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9hfHu1D0YXn7jtaHxofhtMEwutr/VzCszmX6OLyK1E=;
 b=B7dFxSDmbQ/U5osXGbP/d2U+sUDHsAHv8KLIwprZyhbIPGsffzMXTKO4rVDwg4j9DwKTAVa76kyv38d2yOHtuQkrgN5kuvnScJKiFbZkyO9aoEMVe0GXONpjL1oDp8wzbvM2YQvwQEzmCdxMi/UF2mwvOwm7ok4Mz6T3jwfjFIY=
Received: from BY3PR03CA0027.namprd03.prod.outlook.com (2603:10b6:a03:39a::32)
 by DM3PR19MB8338.namprd19.prod.outlook.com (2603:10b6:8:1ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:36:21 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::63) by BY3PR03CA0027.outlook.office365.com
 (2603:10b6:a03:39a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 29 Apr 2026 15:36:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 88B6F40654A;
	Wed, 29 Apr 2026 15:36:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6CF5682024A;
	Wed, 29 Apr 2026 15:36:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2] soundwire: intel_auxdevice: Add cs42l43b to wake_capable_list
Date: Wed, 29 Apr 2026 16:36:14 +0100
Message-ID: <20260429153614.741899-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|DM3PR19MB8338:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: df7b4e19-57d1-43fa-b83b-08dea605101c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8alFMo8SZhQwP9a34Li4g0vLbz+rH7XBQuf75wC/LklFXhk6LqRDah9uOp/VNMYKRg8TDNXYAljRv2tbgYeI9Dfq0uIQMwqBF9n4YsjudKyEJJjC3Hyw220je58DV94BuhT2TQU9V+f/GVzJDkwZJGP2tFdKcRslEAbVn5HZvJeAIrM4ZoQJbvc9jpw+pkkhQirbdfKTEAvzcxnjN81fW1tRPWE06+8po6OKkJioYZs25fGAMmMcGDOfyEzeatN0KaYgEweoaKmQs/M3cQ/PqNTDH9obmYmTX0sUSSXhv6409Yilxz1zkV1j7cUSeHitsnM+URQJIAmWW+J4/ZucRigbUAKQO843XaV9Mf9r9HVvhpVdIFhFoWuwrOZccjr0wGJEvoNzpQaGWKhyDfO0Ni6ZxdGvZpWAHBcIl1oEfEWTy6M4Iunok+B5kywVOSdfnnpw06PRLA0mfnQC1+9ubiTlFhS6HMg36V7+fLLrchuSCjiAPhSzLc2tO3G6c2oNhmJMcSNnFbFQdUdJdZi90jBr4ptjDHoF0ItIudLjgpAqHzhWg+IlFZfvauOyPkz1czvPG5ZKbo7C7Jpt824RfmcOromseeNgot+oWqvy+Yp+V71Js5XJC0VnY/usZdFYynLksza+OpmdgoGZAXXV6er0d6LXTKnuezYRTW9teXkDSMTbg2c/8pSl8kH3ZthEiLsHMluPYS4zf/cfPICl7ZcBw2b6Mp00TqFxko1xERC9kL29lWMFqS/mr4WWSdin84Pv/LnwE3ilNPkkTfiamw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PRdbpxJ+/SoBOrNEXlADGqCgY3aTXCK/RDZSD2KzNsivLUB7MZ8SJuir5wgsq8Sbffxg9+lP5DQyOcSdlXcL/MLJIoDSmy5IO/63tc61tGSbjqBWO/q8Dvpr/HW+0aX6lfXDcSB6kclD7+XLmfI0ZgUPilsz7bza6ELDLwN2h+fWOcJKreXWJHdigGn5YWlNkh32PHTpK0oUXfcfJNXjt8CtD1WiGUYo6AxLisAm2U9OdemTKy7lgDLMK3Uswk+F9iuAbp4Qx8FPPGRlZoOJXsRU6OdG+stp1dyB9+ZuNJThhI0A0GJ1z+9bKXqRPdl/1+eYYldf9jM26PjRq40H6eDALf4gZxBtKpoE+U38B30kPffdiTzmsfdhyNsIeBhh4tcIKUSko84lmV6oYzI/AYqZr7Nu9am0t1+mMaIDU7oNVG0lrYI0rfrxQGMX+vu2
X-Exchange-RoutingPolicyChecked:
	hQlaGTnwJxkXUCBDF+I1kGaiK/0hVULOTNH+zeHCCtEafyD3PHe2nISLDXyn1Pgm7m6orkvfUOHFXQDN292cZTfNalnzuq6WO8S0qZsc3VWxdurH8pDx0Pf2JccCN7eW2Ij9yH1CUSAFpiyrs+xWsNz8L8Naz4P/Quh6DnO9szHIxEjgsr7y9idT/+WXERD4UDppba4Tr1LEFMBFPkCbLTnEDGvWVxfwrOWHyKVzCMnVjlxaYZoGWLSLtUgO9qevDv3qztmI3aPHiR71w+MQ7cTPco0tCwadLYaPqK+RHzrZ2A6JisjDKdpF+phqfPl7BqPAKwBDswMVWMjJ+tnVSA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:36:20.5264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df7b4e19-57d1-43fa-b83b-08dea605101c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR19MB8338
X-Proofpoint-ORIG-GUID: SYUYqwbWUnblsosj0SkqWu_obEtXW3s1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1OCBTYWx0ZWRfX8qywUC8po1J2
 0bMHsCPABthD2leAIQ1zK9yexE8iEgME7oeqz/dToLZbOFzKPSZo1vm+63UCGCgBzqUcLRO+b3L
 WqgABKyo6dDOPZFssGobpg70mUwI1VHYhEvE0BEaYFmw2/an9Yr+BZ1Rn7HrOGV0fb8Z/mjytWq
 ftzTm6VvMgP6hE+7w4ZgBnliNAso0u0kFwIsCMMi2aY8HZ1V5hpcazkuuU6UOLTNIXNX32yynA4
 8rKZzDgSEzz4iHIjRGl2f2lkabhS8lL1LhK/fpz9dVO1zZXVMX4eVvDAIWXqUUJRXxM0VNZ9qRT
 WvWv0rl/+BQ3z3uOM59/O19f295qQYLQQRWarYOpVZ3D02PtB8Pm7HJTY3GU/zvIAa7j9LWSLqV
 4WEICaFGWezBh1aQUQgl+kbcS57QPY/AZLd7s8WBCECyBreNC2yLMiRF2vX0r9yH/aHXDC8tkkc
 qzhvYep7E9gtCEPstwg==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f225f0 cx=c_pps
 a=W2lJqvwlxpc/IP2FXjrMFw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Ba_tczi7Fg5earTfHEIA:9
X-Proofpoint-GUID: SYUYqwbWUnblsosj0SkqWu_obEtXW3s1
X-Proofpoint-Spam-Reason: safe

Add cs42l43b (both packaging options) to the wake_capable_list
because it can generate jack events whilst the bus is stopped.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Add support for the QFN package of cs42l43b which will actually have
   a different part number.

 drivers/soundwire/intel_auxdevice.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 913e95207ee1a..ee951be154657 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -51,6 +51,8 @@ struct wake_capable_part {
 };
 
 static struct wake_capable_part wake_capable_list[] = {
+	{0x01fa, 0x2A30},
+	{0x01fa, 0x2A3B},
 	{0x01fa, 0x4243},
 	{0x01fa, 0x4245},
 	{0x01fa, 0x4249},
-- 
2.47.3

