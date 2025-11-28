Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE63054D0;
	Fri, 28 Nov 2025 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325304; cv=fail; b=ufUCrTIt4lqb3rgYX2ECl+12BUV1rC1VhV3IHVlDp7rFni3K+W+hgCzWUwK82XmgHh67GuSNIGtrnZR2qrJreDQx+DS0Qne4MJKeytyCnhPAtd9UoQ1ZHTlgb8w7DH3561KbrlZ0/rbhlE8nstTJeKWNd3k8B8aaK0nCLs7wquE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325304; c=relaxed/simple;
	bh=eWh1ljWRhHFupLrleIj0j56TbdB6lDswMFz3UH26vCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U2x81X9OZQeTjQohAkFaOkXBuIAIuBtV7LF4ozTbWiXlb8XwwAyZXxkIpd7XK7faJ2YbPqY99/gq4cEks+BT1BdeeYbNd7Pf+F8ZiGhyAb45+AK9GBCI/mbP2xMnnp4dCzgaS1AUY5jBCwzfFI0+Tlk/kM66Vh3D0uE3HdLvmYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DGwT6QLN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=e+LApktK; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DGwT6QLN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="e+LApktK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS91UQX3346218;
	Fri, 28 Nov 2025 04:21:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=22P6ISiahZWw8yAIC2Y5TccLO1y3ewx7glJJdrEj40c=; b=
	DGwT6QLNogJcJonXCSOC7MlaN1NkOjpakbgPTToVorZf+tVjL+26+i3VyLe36f+i
	RfZv29lbyIfh5sAIk0VuSUqj/uXfIzZfnKmV2OVQ7lMQ/+4P1wrad1FYYh/Wmlae
	3eZ1lEvthWk+knNwAEbEG3jatcMvBDbdpsr1Rnjnsom5vHaQ6mPsvhN4UJrOm+Xw
	M0mpAiZA8alVlqPSFUWHnGvlCJWnPjlMBgHIPHo6RJaGJHUye5iTwRfOfcjnZfGG
	/zFQ2sbAwPDCMHQJfvY7890QGRBOihbaocElYT9mq85ay1aN/IYD1SO+ek3DhSpy
	xTgbVm3OWSaTklTf3ueK0g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020127.outbound.protection.outlook.com [40.93.198.127])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwue81-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 04:21:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=la/K8/4jroA9uPoMAFdiOkkfsQcUmDT89WJi8M0kRa3dVLE7U3l7DCg2rSNOcHGNHyQy1g+5+0r7MEwnVEjUArebHmgbSH/PFtkgbLMmEgFvlFCT29iUC5FiMvQUTYdgXtA09tF3h3p/Cp9P438k4QVLNU4TD+Wt+C/k2Tq5s0bNZRDL6lfqHaaugakY5DEgAres9V4bw9ILSy5irAy5anOUaJP0BvkoHTs63lud6yn3QNUEi9YKnG0SM2C9t8z4twhHxDptt97v6hcNCEeOpuuifnrTQQcFIQH9iVjDCY4gZT55I7ufgo/2DFmzSctWY/e1GhfxodcHNtOlyV8hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22P6ISiahZWw8yAIC2Y5TccLO1y3ewx7glJJdrEj40c=;
 b=RATtVPqwXLeyWuARpJTPPp4bO+bISkNXmmA74ovflIU3V6rdQDUbTA6juhvvOA0u7Hwu6kMnYgOLPVdSFwnip089TNKMFEqD7cOrvQaRukmMNUgFDbtumtw+/p3c+IlDyXHnZV3llbkPKXVSNJvovLRpEuy1yOE9SIy3t8fVv07Vu7/Vj1KyAV0gHehVPsg95bOAhEH++t/38D2axVFgOyXULfp/glrhL7JGuNAMKZz2vYxocO9aVXfkaBihwSwrdviPag2rH5NckzjsQZx6D+M9p0xebUx2OPcF8bPekwtBaibLywXxG2moB00MGT+iEsWocILzou1tFaJ2lVmIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22P6ISiahZWw8yAIC2Y5TccLO1y3ewx7glJJdrEj40c=;
 b=e+LApktKHHJjaUKHQL8jkTm/SLUdf6ODfjsgc32OMrrdsc/4594tMu5WKNLoac/aDgO2xs45g3zLtCXV8zl5wxZdWp5+wO/8sOzyZfgYerloGhsbt1ttjWv/3dTjcg2SJFGjiWRhA4WCDfKVrJ+WT2UMtfZgL7FN4i5we5it2IY=
Received: from MN0PR02CA0003.namprd02.prod.outlook.com (2603:10b6:208:530::6)
 by DS7PR19MB6136.namprd19.prod.outlook.com (2603:10b6:8:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Fri, 28 Nov
 2025 10:21:35 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::5d) by MN0PR02CA0003.outlook.office365.com
 (2603:10b6:208:530::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 28 Nov 2025 10:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Fri, 28 Nov 2025 10:21:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4B023406544;
	Fri, 28 Nov 2025 10:21:33 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 402F8820273;
	Fri, 28 Nov 2025 10:21:33 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] firmware: cs_dsp: Add test cases for client_ops == NULL
Date: Fri, 28 Nov 2025 10:21:32 +0000
Message-ID: <20251128102132.1575177-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251128102132.1575177-1-rf@opensource.cirrus.com>
References: <20251128102132.1575177-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|DS7PR19MB6136:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ab63ea6a-d9a2-4e1b-496e-08de2e67e859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LjBZXuHAtWpDD3Le78RqaU8/frNTO0kPT8dXMzc/TJ/u9nP+NqV7TWz/SyW9?=
 =?us-ascii?Q?0ypnns3/gFlwrTNVbyEwWlvi92nc+03u9RieWO/lo6rHyRZHBkutqbIsr1wc?=
 =?us-ascii?Q?pyqmz7myNEWteGv24iFGx88ZKQSL4yDMgRtKLgYbeHVrRpuDtfWhz6HP7JhK?=
 =?us-ascii?Q?AjrG39qlAlOOmzdvN995u1+ZQppR6x1A1bCQ5QmVLMbcbw9DTbdE29ZUlJXT?=
 =?us-ascii?Q?AmO1jIngkLwEAUe6Amn9WPRmPStREAtHxRuB4lCGE7mep297wZbZE5F32qYr?=
 =?us-ascii?Q?FW23gc+RgCOrMSn8wr8fxd9x4azqugMyX4F6/MVCDfkCXb8JqZXBXuWFArU7?=
 =?us-ascii?Q?cm2gRQavJRJKkkiAhhTrJ67i31T01HJp/WvqvmaeX9w7410TiWIrNKuZUnBy?=
 =?us-ascii?Q?GUsdBr6hgsi54znLV0fgwRbf9GfwdjF04fvMIN23l38MyLqq4LMQhwkbwCfe?=
 =?us-ascii?Q?ReMaWKEfJP0tY5ia5im/oKBEprARMvA+1ryuGeJD5kp5xf/+fJsg5DNqDMdR?=
 =?us-ascii?Q?a611/LyMkoM/uM3koyDhYcQZxZXT/iUr5y5znzfLLaZKAZxBhvxKbZhA1Ega?=
 =?us-ascii?Q?7vOs0UiiecivAenraU5WK9Wd/ulPiI6LDvouERxg14AYZ5XSXNg7ub6ZvSaR?=
 =?us-ascii?Q?LLCn5ob6Q3pkqrcJERrJ0Y7EbyKEJCKPzQZ5J0iGsT0PyKnrbyAJgTxjVxhZ?=
 =?us-ascii?Q?i/bWE8aFAT83LgSj41Iq03ylAs5aL7WOQ/VYQVEWiP8eCVQTiwZifcqtDr3e?=
 =?us-ascii?Q?rcch8mA400aVzgLDIvxhm21+ohxDZtCZiBsJBdUusSzYTcJJvn0d3O6yYEb7?=
 =?us-ascii?Q?3F2XfvWErU/CbzBSgNYwyIrqeSZ/6AHIGXuI3FtE5bh20BtCXcOxi5jc6lt7?=
 =?us-ascii?Q?sH/729AXfo6JuuY4epW9mz01rOIrHTxjJ6FJwYSOMqk3NYho7UD6kJVHKsaW?=
 =?us-ascii?Q?XxvTkUMoBc1cPepfUrS/ltWz5DGG7y8U/H4cj9oFFPc13/pxbKJfByLxKMO4?=
 =?us-ascii?Q?cTSR8gnirzQR6kVgavkLOBEPPUyrVLIrVwVvUmRPzlVF3tYEjy8nTe4FAu5v?=
 =?us-ascii?Q?X/Zq1UUuZTM5yiS1WtyxEXI3/Ti1lkovnTf52lFq0Xwtwg4/OiM2XJxuThHe?=
 =?us-ascii?Q?Rvar2Hfwqnd9eOPeP4NBk4EnWK7fYYXWSrFdkqwely2NtF7w1/CJY1UiZLCA?=
 =?us-ascii?Q?bCgbkp2I0Gt9bTNyurfC3v2H5mWkp4MbhFylVXrRN72V84OXksmsFuCrAZdi?=
 =?us-ascii?Q?rjFsCa/Nr9RFe2OpUrnmF7pdDMUL8OT3idcDjcSQB0GSFDBJAwYGsEnlFzRx?=
 =?us-ascii?Q?cFE+BROC3NoZI48gXPvpJF72rqJU/so9YlqtFEVe/b/Iz4xmXJ/kCvqmSYmk?=
 =?us-ascii?Q?i0KQc/hf+zfbRze4NHyTNPrj3KFd16ny+f5gm41z4uKk58EI0+FfhR/Hj3Z7?=
 =?us-ascii?Q?ZmMXpo93I7qb153sV6dyipPR0eVb+JdJrgu/s6cR72sUstdYCuWdT//sUDEM?=
 =?us-ascii?Q?FpR3pJqcaTmyIha4xkXWU6AQ4rgVY9Z8GaEMl8eLJJZyoAGA2hFOFUcLUAR+?=
 =?us-ascii?Q?bRUdAnCS+PR5+YGoKZg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 10:21:34.5675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab63ea6a-d9a2-4e1b-496e-08de2e67e859
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6136
X-Proofpoint-ORIG-GUID: nG8YKvn8TZ9I9OXRxV_fJHPtg0yycHf6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NSBTYWx0ZWRfX6eo/+KZEjSdS
 2Xsh41piGn+yZNeyohg5JZsWukFWKH9WBk64gW4ex+oQrKqnUo4ec4jLb96HIc0uyw/hmUCtYVF
 u7eWIlIOuPw9zuAKXMXyQ8m7TfFJ160IJsamFcmM111n41zIi2WiFI3RPLr8WPt6Qx8rxRg+ulf
 30t+w7XJXFnqc7AByjx2U09KOHNH9R2lY3YjgKb8LuorfV4/Mv37PZ/Z3RJDdywaAK8InC+yvIs
 QMvUxBfEzrlVOUNZfZ4A5yKKZRCB4k1gln0aMpVubitxhrIaY3A2zzgSs34gsIixvE+scKCYKJg
 w87ACpigBquNhVlFhXpV6MopfU4k2JoZMyGPakxVxKxFKe3AkgDNc9YP392E/AC1LrUpkidMYvG
 rbhT77WK8t+rAqir6MGq8udpaAUsoA==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=692977b3 cx=c_pps
 a=eXjbGYYLs/cxvPp3erIRkw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=NMzYnsYAkykA1CXli88A:9
X-Proofpoint-GUID: nG8YKvn8TZ9I9OXRxV_fJHPtg0yycHf6
X-Proofpoint-Spam-Reason: safe

Add test cases for the client not providing a pointer to a
struct cs_dsp_client_ops. This proves that it is safe for the client
to leave the client_ops pointer at NULL if it does not need to
implement any of the callbacks.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c b/drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c
index 8a9b66a3b7d3..e5a389808e5f 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c
@@ -600,6 +600,7 @@ KUNIT_ARRAY_PARAM(cs_dsp_callbacks_ops,
 
 static const struct cs_dsp_callbacks_test_param cs_dsp_no_callbacks_cases[] = {
 	{ .ops =  &cs_dsp_callback_test_empty_client_ops, .case_name = "empty ops" },
+	{ .ops =  NULL, .case_name = "NULL ops" },
 };
 
 KUNIT_ARRAY_PARAM(cs_dsp_no_callbacks,
-- 
2.47.3

