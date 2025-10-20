Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19D0279DAD
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975759; cv=fail; b=Lb6sWM2oSzSfYp6FWy8hZN3d9db+MGV9bSh1ErglLe60VIIfFK/oGC1CyipYulDYpS0qV5ZRfRmLnaWZk+DiJM8OsaK0urEVkq1wKEMI+oNOG9pAag+JM+iNqsypIAkvsPL1UPTCYqIHHk2yjEaeLB2b5pJ8DsM4a7WHqWwg18I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975759; c=relaxed/simple;
	bh=e4gBXvbP3wQfgwRnrbdHCIdi0fuFdKAsX+sfSar9hkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hqBpIJtLV+MyWhfxYcIT3zPX0SjaGqenCGfftJY2VefxJjNL204SzZwBOmBo7YuPKX82FIAyY0mpMeZX0868VkDhA70gelSUCDBywu6lWo/vATfmarslFtfhv885IDwLMZC7nMdRgcPHB/3sjG0NWspWLYAi9mOjhNDi58Pfbrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WLJDQ5aa; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=A2W3Y1zC; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WLJDQ5aa";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="A2W3Y1zC"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAnlO941629;
	Mon, 20 Oct 2025 10:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ySMUubb1VzzYj5zm2VE+7dCGQMgHiadEIrJuGO/6Xj4=; b=
	WLJDQ5aa512bHpg5ghF3gZzMtpItgzW1GZmzgZ+y8P2ru5lmRvoJM11UJRVwx5Sl
	Ra4XQpHP9j2n2M+dwZznWpNlPigmurOzsO+V8v1LeSvuaWskCcg5p2gnzI7X8dSr
	TrMC79w6XGDVdkwT6t1LPsNFoeWk4J37Zh+lSU+SNm9A0xL6dTTn4qQpGwq76fTV
	pVEzHzjS8xR4DpL2igy6ex3ZUoCtfd1Kk/iFeW1yLJ9fV0PiXNdvab9pge9+XSZe
	ThwZXuEKkv00gCBLwYadtqxJkh1LKLcZoKVlUeAJ8kBSEfu5vSGHMwQc+MvC42Q3
	NgWEqwq7iCieQJA6RL9Z9Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022080.outbound.protection.outlook.com [40.107.209.80])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aes-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrQdgERrXHlebL2V8I0heGwjiCEBp+t0vxiDr1aBUDETyxINU0yjD+GuUjJPPmUNKfPmInKvqcLQP87qBtLG8XSIG1HkYIDFnGPdVwRUteu78kDRJV9gDCDA8+Qx/F9lUIRs4W6jQkkqJ+4cKcmZ8TuaA9bd3AjJXmLJMQEvcri5U9QCPrdtTXz5hxtZIYiL46P9zRA2Sg5uMHwhxVHogMYVG94F5DuisUOH6FhsL3hC46PuiUk/eRO1L15V+FLWezHJtWirh8rh4ZBBcVEjepPXwCjbStTzm6CC+AQwH80oRRbZUkhshDHgBBXVHBhse+OlG1u8efs7FhjdtZA58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySMUubb1VzzYj5zm2VE+7dCGQMgHiadEIrJuGO/6Xj4=;
 b=R9obdwl5lTsX+qJS3BOmbeH6ZimQsOr5yIFf9fHqfeqi0qKnXzpteEMAytPyUIOzJ9M7bTRKq81Fv4mjuHs7UUT5UG5QlCTzBCon8YnLb258DIJ6SSwYpFkM9EnyinWel8nxCCtfmZY29ZqDsuiD1DRVa/Gw4FMX7AgGo0xTHDDu0+8b9vYW1HN0nnsxb6pBVMl8abwUC6i94kjtJpYwVstAcn/7rI5PidziZm/v2TCkkMbH46BEzSuYH9UhZepsg4FMTpza4ECj+gaWveYburFX/q70FvHAtqgZOEvxV1n8adM9Wtx/wB3FGVEG/l303QK1sqnA5ay6XQfCXvqDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySMUubb1VzzYj5zm2VE+7dCGQMgHiadEIrJuGO/6Xj4=;
 b=A2W3Y1zCqYdJNSIW55UFe9Yp7mWzoU0O77gENKMfkRcB+iEZRpFC4++OI7hYpjoi5Qky2RrliMQNxHXiNYIVaejazu4ce0H4XsjvoqZRk2oOdRUIvvW0BjOV534KFc5eh1Meqsfd0UatZqwnOiZN3lwhxnjTuLYYCDB3r9vPDms=
Received: from SA0PR11CA0194.namprd11.prod.outlook.com (2603:10b6:806:1bc::19)
 by SJ2PR19MB8227.namprd19.prod.outlook.com (2603:10b6:a03:55a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:55:24 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::60) by SA0PR11CA0194.outlook.office365.com
 (2603:10b6:806:1bc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 15:55:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F0F1B406648;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E0DCA822540;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 17/19] ASoC: SDCA: Add UMP timeout handling for FDL
Date: Mon, 20 Oct 2025 16:55:10 +0100
Message-ID: <20251020155512.353774-18-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|SJ2PR19MB8227:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3edd3e90-bb64-4714-7ff3-08de0ff114c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IYbLyShEyLdly/2CNkakQbIDMMWAfS9IwTjlHAxOm9YXmArPbXMRVavBSsE6?=
 =?us-ascii?Q?0u8SR7EFLsZEjlGBmlV2TV5SQ75e5jIkrsbfWASOJxqY8IHEzT6//MO5LCIO?=
 =?us-ascii?Q?40cUI3Vt2BwicFxS7B2gHtyQKwrUM9ckdzbNPGXcvG/eruGcTdVb7fZu5zoo?=
 =?us-ascii?Q?POxMZF83JJLaOqEps5873tDXBsT4YE17jdHRmfTb+pCMU5cBqaTS3JJc2xU+?=
 =?us-ascii?Q?ZYv1Mm3H5iV8CWAA7OGnH4E9mc+S0f7ustjqF1FxeSSOT27MbMV+QVj1/2I3?=
 =?us-ascii?Q?5jMjkr5YLn/vQW32H1zVQIs4sj+R4oSIgF1OSmIdVe3tr2jxHx6NzL+CingL?=
 =?us-ascii?Q?ClsbffaBrP0EB7JAZKsZXkmZ6j9ES5rKVruumzn1qB5ppATykxl5H4sr1ZUd?=
 =?us-ascii?Q?ovqRFZ/KrPQMJFlYAxhCHLMFKgrVs1dRp6bzXmeTsI39EjREH/xe4h22lzaW?=
 =?us-ascii?Q?FByWEY4BCnRCmJ4esv1Vsa7pIJxsyD/LaMX/WnsbCUltDnXCnV4CXiU2xgFD?=
 =?us-ascii?Q?u7OtAULA/Uc0Dz/TgLONdP+HQKIQCw9GUmrl13HXoLjBMNGTrTuucGWBC6VA?=
 =?us-ascii?Q?Pc2+5oGuneghkLIhAtqneTwrxD2iYmNL39oVC+oTn9Lru4fG9FX+LKM0RGV6?=
 =?us-ascii?Q?/GJ/61Z1dZejoIiEphJbc+wbAtu7CviyIC+046a+wZltAEOxmYZTWCO0sswI?=
 =?us-ascii?Q?WOD+EerrwH6IdZ2STT7jXSVtNs6dtHF5mVgbsH8qW4vuu94iCcShrc7VcXnP?=
 =?us-ascii?Q?NNWtc1njFnHZI7FCaSfc31dXgnVWrZxMkWD4CVY+jwi1850/LWDhD5/h7n5V?=
 =?us-ascii?Q?jwXxjWOjHYgyg+sIC1VVX8Abz+2Hwp6OikXmX+nUrA7zgaQ1mg3hAzv5KHRZ?=
 =?us-ascii?Q?5FBwswC38ONM6NqJ2pSXaUKRhM6Vxx8zUSEWcVlwGzw8IdzW8gpHDDTiTT6l?=
 =?us-ascii?Q?f3s3xbq0Y11tkXV7OPm4m0GRF7hg6OywwxVqbdil9DmoF2fPFL6mKXUdiJSO?=
 =?us-ascii?Q?beLznU03jjJQ3jsFBzm2P55xNO+BrIBX2YOLRvko6YpCzgW2a8dNYkCa8J/w?=
 =?us-ascii?Q?QQ0gulSo4Y7lIEAfA7rw69QfmkNia5CUX+5OTht2xB3KGPlv4uyRA+qnXIw9?=
 =?us-ascii?Q?ZGEfqzvOeRIPAb1uitKE6hN+TmGRpVwVyyxH/dzbOS3Wo3xZNRa1kdztkkxM?=
 =?us-ascii?Q?km9f8l3aRkHApZCdwQa1BXyvNi8X80DLKuqSsODqyG+qGDkBH3a11fZtYYxK?=
 =?us-ascii?Q?2VZr+EbRNM4HtBep4DI/F2pXCsaNErMdjv0JbnfghpCySM27U5nisoXyLswC?=
 =?us-ascii?Q?3TA/7B55DLqLB3ynTolwpIp7QqEEnmWNtcJKPhDi+ZA2Vi1Nt5GAze/84pUa?=
 =?us-ascii?Q?LofwyzyLh7c4j6Nf987aTQ35NoOni5N+9vV2BB36sfDKlr1Z3ISqrVxGKAC2?=
 =?us-ascii?Q?H9i01XTbGnN3COLSCWejmA69n1CtXx9b99D9QWBDv2u2StCkpdml82VVYIRc?=
 =?us-ascii?Q?N3Mie2U+rTfwTQlQrfCDXwGjalgEfdqXFOoqrtb69pGYpKgSaQqDITh2TUt6?=
 =?us-ascii?Q?9u1PAky+RveJJ+EUxTg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:24.0346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edd3e90-bb64-4714-7ff3-08de0ff114c8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8227
X-Proofpoint-ORIG-GUID: d05bZkQu81FLNOAqFUdIODgReKyNwLN2
X-Proofpoint-GUID: d05bZkQu81FLNOAqFUdIODgReKyNwLN2
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b6f cx=c_pps
 a=12vGVFQirf4vZIp7c/z4DQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=7YH4QgMdnEmkNJGjKpcA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfXzSshBEgxXxVP
 pVU5OU3tRTfVSi3NNYpFFlc3V3k59JMtHASEtLOxnsNNpSvpsZSweBYg3quJL0YpKbWUeRE0NWn
 QUvFe94kETF4wxjJRuD9KF1NR45nyo4gnzAo2adYeWK67q7GCh+MgN1bVkhu8vFgKMlUTZldiEZ
 /duioipPdqvw5Tf6srzG8iAfJy5y9QUoGourYGQvaylw2u830d25Y+OrXPiK6Gl/n2nMqQMw/qK
 XcZennczpDubWKBOI4v8dbJ58SGyJyA7SOzZvClTeNVtMfu75WuKziX+adkgG8fdqNHUGskDZoh
 2g4yfBuDGY5QsZWmDcCLTDZJGMxVhBNDAaKA5fZKlM1uPA3nu0o8uLRCUePd+OMWVKipv9BvDcO
 wClKClZ1IGrDc8WduieyE0nqtQGxDw==
X-Proofpoint-Spam-Reason: safe

Several of the UMP transactions in the FDL process should timeout if the
device does not respond within a certain time, add handling into the UMP
helpers and the FDL code to handle this.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Add mutex to lock between UMP timeout work and IRQ handlers
 - Clean up UMP timeout work after FDL fails

 include/sound/sdca_fdl.h  |  7 ++++++
 include/sound/sdca_ump.h  |  5 ++++
 sound/soc/sdca/sdca_fdl.c | 50 ++++++++++++++++++++++++++++++++++++++-
 sound/soc/sdca/sdca_ump.c | 15 ++++++++++++
 4 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
index 4ea000d6acef4..f4ba809cb203a 100644
--- a/include/sound/sdca_fdl.h
+++ b/include/sound/sdca_fdl.h
@@ -11,6 +11,7 @@
 #define __SDCA_FDL_H__
 
 #include <linux/completion.h>
+#include <linux/workqueue.h>
 
 struct device;
 struct regmap;
@@ -23,13 +24,19 @@ struct sdca_interrupt_info;
  * struct fdl_state - FDL state structure to keep data between interrupts
  * @begin: Completion indicating the start of an FDL download cycle.
  * @done: Completion indicating the end of an FDL download cycle.
+ * @timeout: Delayed work used for timing out UMP transactions.
+ * @lock: Mutex to protect between the timeout work and IRQ handlers.
+ * @interrupt: Pointer to the interrupt struct to which this FDL is attached.
  * @set: Pointer to the FDL set currently being downloaded.
  * @file_index: Index of the current file being processed.
  */
 struct fdl_state {
 	struct completion begin;
 	struct completion done;
+	struct delayed_work timeout;
+	struct mutex lock;
 
+	struct sdca_interrupt *interrupt;
 	struct sdca_fdl_set *set;
 	int file_index;
 };
diff --git a/include/sound/sdca_ump.h b/include/sound/sdca_ump.h
index b2363199d19aa..f54f9d48c64cb 100644
--- a/include/sound/sdca_ump.h
+++ b/include/sound/sdca_ump.h
@@ -15,6 +15,7 @@ struct sdca_control;
 struct sdca_entity;
 struct sdca_function_data;
 struct snd_soc_component;
+struct delayed_work;
 
 int sdca_ump_get_owner_host(struct device *dev,
 			    struct regmap *function_regmap,
@@ -42,4 +43,8 @@ int sdca_ump_write_message(struct device *dev,
 			   unsigned int length_sel,
 			   void *msg, int msg_len);
 
+void sdca_ump_cancel_timeout(struct delayed_work *work);
+void sdca_ump_schedule_timeout(struct delayed_work *work,
+			       unsigned int timeout_us);
+
 #endif // __SDCA_UMP_H__
diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 39298314f69c9..cb79dc3131b82 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -116,7 +116,7 @@ int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
 							   done_timeout);
 			if (!time) {
 				dev_err(dev, "timed out waiting for FDL to complete\n");
-				return -ETIMEDOUT;
+				goto error;
 			}
 		}
 
@@ -125,6 +125,25 @@ int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
 	}
 
 	dev_err(dev, "too many FDL requests\n");
+
+error:
+	for (j = 0; j < SDCA_MAX_INTERRUPTS; j++) {
+		struct sdca_interrupt *interrupt = &info->irqs[j];
+		struct fdl_state *fdl_state;
+
+		if (interrupt->function != function ||
+		    !interrupt->entity || !interrupt->control ||
+		    interrupt->entity->type != SDCA_ENTITY_TYPE_XU ||
+		    interrupt->control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
+			continue;
+
+		disable_irq(interrupt->irq);
+
+		fdl_state = interrupt->priv;
+
+		sdca_ump_cancel_timeout(&fdl_state->timeout);
+	}
+
 	return -ETIMEDOUT;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_fdl_sync, "SND_SOC_SDCA");
@@ -302,6 +321,21 @@ static void fdl_end(struct sdca_interrupt *interrupt)
 	dev_dbg(interrupt->dev, "completed FDL process\n");
 }
 
+static void sdca_fdl_timeout_work(struct work_struct *work)
+{
+	struct fdl_state *fdl_state = container_of(work, struct fdl_state,
+						   timeout.work);
+	struct sdca_interrupt *interrupt = fdl_state->interrupt;
+	struct device *dev = interrupt->dev;
+
+	dev_err(dev, "FDL transaction timed out\n");
+
+	guard(mutex)(&fdl_state->lock);
+
+	fdl_end(interrupt);
+	sdca_reset_function(dev, interrupt->function, interrupt->function_regmap);
+}
+
 static int fdl_status_process(struct sdca_interrupt *interrupt, unsigned int status)
 {
 	struct fdl_state *fdl_state = interrupt->priv;
@@ -364,15 +398,20 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 {
 	struct device *dev = interrupt->dev;
 	struct sdca_entity_xu *xu = &interrupt->entity->xu;
+	struct fdl_state *fdl_state = interrupt->priv;
 	unsigned int reg, status;
 	int response, ret;
 
+	guard(mutex)(&fdl_state->lock);
+
 	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
 				      interrupt->function, interrupt->entity,
 				      interrupt->control);
 	if (ret)
 		goto reset_function;
 
+	sdca_ump_cancel_timeout(&fdl_state->timeout);
+
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   SDCA_CTL_XU_FDL_STATUS, 0);
 	ret = regmap_read(interrupt->function_regmap, reg, &status);
@@ -415,7 +454,13 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 		case SDCA_XU_RESET_FUNCTION:
 			goto reset_function;
 		}
+	case SDCA_CTL_XU_FDLH_COMPLETE:
+		if (status & SDCA_CTL_XU_FDLD_REQ_ABORT ||
+		    status == SDCA_CTL_XU_FDLD_COMPLETE)
+			return 0;
+		fallthrough;
 	default:
+		sdca_ump_schedule_timeout(&fdl_state->timeout, xu->max_delay);
 		return 0;
 	}
 
@@ -441,8 +486,11 @@ int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 	if (!fdl_state)
 		return -ENOMEM;
 
+	INIT_DELAYED_WORK(&fdl_state->timeout, sdca_fdl_timeout_work);
 	init_completion(&fdl_state->begin);
 	init_completion(&fdl_state->done);
+	mutex_init(&fdl_state->lock);
+	fdl_state->interrupt = interrupt;
 
 	interrupt->priv = fdl_state;
 
diff --git a/sound/soc/sdca/sdca_ump.c b/sound/soc/sdca/sdca_ump.c
index 5dcad2f7ea05b..8aba3ff168728 100644
--- a/sound/soc/sdca/sdca_ump.c
+++ b/sound/soc/sdca/sdca_ump.c
@@ -245,3 +245,18 @@ int sdca_ump_write_message(struct device *dev,
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_ump_write_message, "SND_SOC_SDCA");
+
+void sdca_ump_cancel_timeout(struct delayed_work *work)
+{
+	cancel_delayed_work_sync(work);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_cancel_timeout, "SND_SOC_SDCA");
+
+void sdca_ump_schedule_timeout(struct delayed_work *work, unsigned int timeout_us)
+{
+	if (!timeout_us)
+		return;
+
+	queue_delayed_work(system_wq, work, usecs_to_jiffies(timeout_us));
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_schedule_timeout, "SND_SOC_SDCA");
-- 
2.47.3

