Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086CF310774;
	Tue,  2 Dec 2025 11:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764675290; cv=fail; b=SGzQBq98yvrQz5s9Gx7XEn6MLcQgyU4IqDs4VWOWwohG5lWBNiuieFnXy0yaWAnMQYPvlv76F9IF4qJAto4jx1JhdLkqJ5tTcXsnVhl88Tj2zweTH8N9K09y4bpWzhQVMQJu52gVmzmQg/5bPT5iZna8CNCKkGr5E+EBXzhkaqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764675290; c=relaxed/simple;
	bh=vDkFqItm32MyUfjf7BAuVYwEnHA2mXyo1btfXoQ4aeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ONbP+0XrPtjoe3PbWwR3T6h01TN+uvnS/GTgBR1KZixHSQbKz6jLMURXV9rfXpE0hKONmXPJ4ZS6M3jZNoALKgrmiJe9eskOz+zOdYthrqPlbKc6NDWWGWnHsXdoUATpco+alLAAQfVZBfO+UQb581qBQGYWgTTAVvQGeuojhYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=j4pXtpxA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=w89Vo6+o; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="j4pXtpxA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="w89Vo6+o"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B25JB1H3989500;
	Tue, 2 Dec 2025 05:34:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=fuXKkmxbkgcdL1Wi
	cfDzrHGUovtTcCBSOUEEPKMgaTg=; b=j4pXtpxAK2vFu/TCSIJ4l20XdE1gAwt2
	+5PFNocckLny3fGYJbor51lsbuLFknKIGQ5XwEN2603+eZV0xqKNVsDCfwRgGfAA
	A95pvK6Em0VygUwOEnlEE8KUspEa/k1/quXAtTNCHXM8br7zVv+brpnpjFmKSuCl
	d1lB53ErNAWf/mNCWihxg7LVCYEhYcH41xk6GUJxmQfq3v1Hot9lXI1XotObdXYs
	SA33BYqQYksXPS3xl43dtIllMzpyPru1QCw3by2mGoQ+n0X4DtHw/WgXkHjyOz7E
	mdvIolkky27mFJSOgYTsU7g2hLHMTlF8UHHJ6Pvs4x+6nvcW+FprAQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020126.outbound.protection.outlook.com [52.101.56.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4aqx4kk87b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 05:34:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o13kNjrMnM3srloRVpZm0mPiTmq3iP/BgACBsgKgXaqul2JugmK4PyiUzoJ4dPYfP17bo14IAHleKTW2OFuwut7CTXpPNxH7eoarhRz1EV6xUP8gS/R53ImFcTkurHaNEGeAjAKisDyHOLVilsov2VLO+dfbdYeRL1beqZPe319ThrVzQnZxkeChFs83F4GdRc8Zpb3D7+7qZIX5Vrw39j2YpdL0nbX79q92Iwbr4tVl87uW8LmvGS+SIiYChUsds9AaoK0Bivd3RMVgjhRLXipBVPmfljXDanLOw72FZSUtVstJSP00kCoF3cCzB2tVdlrSSnIUi/joysEIlB+Xzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuXKkmxbkgcdL1WicfDzrHGUovtTcCBSOUEEPKMgaTg=;
 b=VjS4+0eo66DhqvR0TTlXwAwk5HKAwF4ZbuH6BNXyTpifjmW8Beo8ym5DKHk46QG9A1s4RA34sQYk1rZ+54jJ0tXpEhqkAESe4gT0yh1aBkvbEHo6AMKbWdf20CaCAak1Kilnr95EdnBi5exPlORZZV4sHu3HzZ8gI/fJW7ofV3m2RBTfHTPsDNoTGqbFmRi57JOrgeDUIuYemqi5xPOnI+d3fDS/vR99LTmpjrveQd6vmD0yHhipNVCMGQZ11wyQTzGc0IjyyVrSnQPN9VL99w/cXIURYOXWy1qSKxmPkXAl/1PB+p3oG8PCoKLJy5RK1/rEmBTin0gbobJ7izOAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuXKkmxbkgcdL1WicfDzrHGUovtTcCBSOUEEPKMgaTg=;
 b=w89Vo6+oS0194Lc3zlsH0c+RXanPfVeaJ3I0YibD/V4bLfAUdCs3H7XJFh4vfKTxoK/Y9SjSLNw/hcpuMTEhmzKQ43YhTOJO3mYZ9BWU+qitpBInVN26Ij/qiKKBTd4U2OKRyGSlTkog2agqGiSYIIYBOm+fkvEKlrvELnJ8d+A=
Received: from BY5PR17CA0027.namprd17.prod.outlook.com (2603:10b6:a03:1b8::40)
 by SA1PR19MB6647.namprd19.prod.outlook.com (2603:10b6:806:25a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:34:28 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::b4) by BY5PR17CA0027.outlook.office365.com
 (2603:10b6:a03:1b8::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 11:34:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Tue, 2 Dec 2025 11:34:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EE799406541;
	Tue,  2 Dec 2025 11:34:25 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CBFD782024D;
	Tue,  2 Dec 2025 11:34:25 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Remove __free() from cs_dsp_debugfs_string_read()
Date: Tue,  2 Dec 2025 11:34:25 +0000
Message-ID: <20251202113425.413700-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SA1PR19MB6647:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9567c31e-2e7d-4244-a771-08de3196c076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+7bDehxeVLlQngI/XkVUH04/iMuhSJZokLfnntB5rwwqc7Zrw6BgpiBQzW2V?=
 =?us-ascii?Q?zrReQTNf3asERQyOeTrPFUs5UEWetlVcmXB30Jrhy4+Hz1UEt1ppXulqNMyT?=
 =?us-ascii?Q?DAJe4I0mhe4aFAZISCb0GWMpcnJLYvRlJ0RlX2Fnk1b/wu34ojPHQeeHVMTy?=
 =?us-ascii?Q?6KADpy9X4VyJGqrIOI8WEGnm5roCFMa75L1UqS/ZN655Q5GizEtrAAdrfYgk?=
 =?us-ascii?Q?zybgFhJlbGsvd9yR4jN7/ByOoSsnoM3a+m3hRB836T9zSb8cLwB7r/AQQk2I?=
 =?us-ascii?Q?Ai77rerJhGVvtODPxtPtgruCvYAVsJtnFuw476olIO9jH9cFR2UImECrf1O7?=
 =?us-ascii?Q?hYtIAGsXkBUQS0wam13ZxGVp0Dgn1ABO5wYjB8ytYAaxg2Co76GFjQVi/FpX?=
 =?us-ascii?Q?FTfEvDO/Qp5Mu/bqPomhHL+50AgRG/0Qh15dvwItK1V6q7zmVzvAaSN3cXoX?=
 =?us-ascii?Q?21TBjlEN9cnhH1Mm2JBiZkBd0Fsxk4rwXANr731I+flN9o368uD+/OJz3Sta?=
 =?us-ascii?Q?/KGRxeZhjotxjqfdBiQmLTdnPrshYAbM/Kk0RygykxTdKNR/KlLkT5fqsrMk?=
 =?us-ascii?Q?5Y2+BXOZxTCAMDYXRuzELCEMoklsXveOPH9v+rzuZg3wSmmBgOYcwwZn+mjm?=
 =?us-ascii?Q?Oc73rALEkeRpWRLw5bogH67Q+x/e6pAsEovwPnmR+AY8MwMvUmcuzKSjKr/E?=
 =?us-ascii?Q?d++m6nWCvNx5JDt2KK0jbKbI8T3tFlzq93USul61MXKK4xwYmS6iVADin1pd?=
 =?us-ascii?Q?FpReV5YvFUjqx6CBduhDA5tFxKEaXuK6I1L2tRRgXjeZagzzvIGfZ6EKOrE6?=
 =?us-ascii?Q?77149t/1jlW1WZJZmfnKJDlB8NKkSifrIeeGme15njVvtewn+P+LtllqP+Si?=
 =?us-ascii?Q?f+IcWC9D9NKb5cwd3P0wtcRyfQvUxc8BEHqRdDE0zqe/m/nRirmjp1mDiJxR?=
 =?us-ascii?Q?lt+kZ2wPFe8X5kOIe4CZ2njei4EyebGIu4Vt7xsYLHy38UcnMZNuJASe0DhF?=
 =?us-ascii?Q?BYvD1B2nHU7OHUcvLHwKYvACrvDXl+ZHeVz0d5//6sfKeMC3HLGIfE7Ix1yT?=
 =?us-ascii?Q?41k0khV3NIhmB6v9YfZY6Z9gHMc535usTAnY272nyeOZleSYgrcOt4yIGE4x?=
 =?us-ascii?Q?3vJsng/UkKK8H/KntbkNYfKPrRzLW3oMi5eFo6T6UYIwRTFOIf01SGPlfPoI?=
 =?us-ascii?Q?zmoTzm9DRmzovi0Hyu+RQEal3d9JWPyIOh2fY0jliR85FY1ai48wyxQbnNdV?=
 =?us-ascii?Q?Ugvdf1ZFTIzzVOwegmBSwWTFEDHvwjSJY1kVvSkMYBSoC5CKb2GfW2CYP80R?=
 =?us-ascii?Q?NmNTJVjhKGR1Ezhcakw6lxVNbouiOixAX2LG7ZH0dpm0yY99gL+mc0gDADP9?=
 =?us-ascii?Q?T5FIJAwmN0AHmCn83mMNFbPeGBBRLPdrARMpSzehwUwMFwO1DjtEtTbSuknD?=
 =?us-ascii?Q?ysFcVbksc4f+wRpuAtOsCtc0GgyTNBxRsIDUFMNLeSQnedWpsyVOD2f2lpdO?=
 =?us-ascii?Q?pHxx1QrV5oyfN4XFOmain0rLicWpOuN/KXzCeXr7jeQB+HB5P81lCRwTgXfz?=
 =?us-ascii?Q?BHwqrdngXS+0Xu9xFUA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:34:27.3722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9567c31e-2e7d-4244-a771-08de3196c076
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6647
X-Authority-Analysis: v=2.4 cv=FJAWBuos c=1 sm=1 tr=0 ts=692ecec9 cx=c_pps
 a=y6InnzShCRkIpTYudTQ+bA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=w1d2syhTAAAA:8 a=HSZkpB9FzI5ZIj1ExGwA:9
X-Proofpoint-ORIG-GUID: ESfe3tOHfanJsnYB4t32ZKhUCDqrzjMp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA5MyBTYWx0ZWRfX9e6xOFpkitlN
 JUiyB/riX8vdQNXTRI4ZdjO8ts0wtk5RVCzMU6/5rRP9bz/lNsyIq04gLPMrxg+xPEo4/i7OC4K
 qNCIZ0xMnoHep7fR5hsgnCOLtN3tqLGLd+a9JMEPnDchLoIZ50+WvmAVglg5CdjjDKqfHfvdrhM
 3z2Gw/Zy9/OPfXzyGo/Rv4SCSmB/Zyk+NOOpayhh3+jNNDM9ZqZ7cOE0INFaxw/DWl19qkPaG53
 qqi4J3BKcTQULfsefpRKlm/G00YNH7eTrlK9MY0yHsA8E+pvrhRUZrl+xZZo8W//E52mZKOyVBB
 kz7VrssTPsIwzXcKM0WSH/zt+82OtAMIFdpwFTHf9opj8SPOdHe3OmtG520iDnT5eHtHjRFu2wA
 ZAv8eib7LSKwzCjhAIVEjqDxBmhwkg==
X-Proofpoint-GUID: ESfe3tOHfanJsnYB4t32ZKhUCDqrzjMp
X-Proofpoint-Spam-Reason: safe

Don't use __free(kfree) in cs_dsp_debugfs_string_read. Instead use
normal kfree() to cleanup.

The use of __free() can create new cleanup bugs that are difficult to spot
because the defective code is idiomatically correct regular C. This
function used the suspect declaration __free(kfree) = NULL;.

The __free(kfree) didn't really do anything here. The function can be
rearranged to avoid any need to return or goto within the code.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 3045e29d248b ("firmware: cs_dsp: Append \n to debugfs string during read")
---
 drivers/firmware/cirrus/cs_dsp.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index c2614de47107..d35d0f5ccaf7 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -375,18 +375,23 @@ static ssize_t cs_dsp_debugfs_string_read(struct cs_dsp *dsp,
 					  size_t count, loff_t *ppos,
 					  const char **pstr)
 {
-	const char *str __free(kfree) = NULL;
+	const char *str;
+	ssize_t ret = 0;
 
 	scoped_guard(mutex, &dsp->pwr_lock) {
-		if (!*pstr)
-			return 0;
-
-		str = kasprintf(GFP_KERNEL, "%s\n", *pstr);
-		if (!str)
-			return -ENOMEM;
-
-		return simple_read_from_buffer(user_buf, count, ppos, str, strlen(str));
+		if (*pstr) {
+			str = kasprintf(GFP_KERNEL, "%s\n", *pstr);
+			if (str) {
+				ret = simple_read_from_buffer(user_buf, count,
+							      ppos, str, strlen(str));
+				kfree(str);
+			} else {
+				ret = -ENOMEM;
+			}
+		}
 	}
+
+	return ret;
 }
 
 static ssize_t cs_dsp_debugfs_wmfw_read(struct file *file,
-- 
2.47.3

