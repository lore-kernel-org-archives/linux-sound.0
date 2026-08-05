Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2452B352017;
	Wed,  5 Aug 2026 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933749; cv=fail; b=oBBQ+LFz6EuZjQ5ampWG3koi2kjefceq8CtPe8KYFi4hPO+hDVTT7eRMFW3NvUoUzJiaujoeol16kzvpDrhq7X//Ok7kYY20/TWLqA5EKJXZy2cCuesAAwPU9CT9qTltMXOjkDppO4i/tEZYLmltoleDJv5qjMoZ7FHKyBPWYBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933749; c=relaxed/simple;
	bh=41FYardRGEFFZe94ddnNDdzWAKSOBxlB8vDd2IfjkMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gyO9SYjXrBWklCRCIl+vSTRldei/BxWNhyMpdtVBKvglv0r46FtB1ykoRK9FJyLbZab7ttX3cgW9G6sffOmt3CqKX4oMJvxmCe4S6gmxSsGrG3IJOjOGzj2qEm381nIne5xpMjUcDhS96Z8YSAfaHwJoqqLQJXI4kSmz4V5vI1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MSKCJZdu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eo9g+X88; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MSKCJZdu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eo9g+X88"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755964w2591917;
	Wed, 5 Aug 2026 07:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=69JHUfgzR8vARAyiL0wV+vFjqq4F/nYbCZHoOlCFGok=; b=
	MSKCJZdue+fJhxC9iGX7/nWC1utKSsvdmK39l86nCf7yuKuPM+lZQSrJZr7qwtwX
	e0vpRILeoOPN6/mtrLLL69lMFU7Ptd5actBPoofmmk69IXV92DIi7piWX0HOc+v3
	Jh9wz/p9iXdw8SRdXMJNrqoBMfBi2pxBJutXmyCOdJGGP7+O8t63ybmUBBGvYCwn
	u2a6B0aesEnTySkPkl8M6A/c/+W/oW4SGUoLJfSNbO3avrR408PYYB8okYdKMTzs
	bLUUWcO/fj8HaL+2xbhqasgYNofvrjcfJcUybfYrrLRv/gZJ40LsM0LjsDGysnO+
	HTuvU73Tw2i+zWjGBLvdjg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022103.outbound.protection.outlook.com [40.93.195.103])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fsd7h5pe7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:42:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pokSfALvtmWKOSzstuQ6QCw5A5W2aTCDvISb56m0zCV7Cayk2C5vOl5anBfnN7jI8zMFJot6ju0p5V8sGjTNKA8PkTnNqJjjSnRRQqgO0hD34VPmLszIm3erMEOW6sosWMN4qlO+3c/kQLOpbz+l1tvXLWd6RtiUEqcZsltzZPpTkuU5kwkAD9wILCnd5rzjzG0zUauCPxzA5oRcGXGSAosCrdxk27GxBpHDtaxQB2SPJp6uFmnRCvf8/b/9XuFw3yu+uvar+JEVEd2PIDMUQGbAiSS3Q47z9CLeFBTrPYRYotO4Y24kC38ngv+zxq+H7lXJmL85Gh8xjUVYV8g4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69JHUfgzR8vARAyiL0wV+vFjqq4F/nYbCZHoOlCFGok=;
 b=KE9ISEGQkT/Ul+V36shhnAYNNFbHSYZjMqJbromdxFBGkeKdfuhM9ofeIhzxb08ZkzzaPKuKQ/74ZG5s6G+jwVJG5bV0uMNaFy6JCUkJ6ZvUbUKuEwSN1R6t+9S2slD1aajzdyg+dJkhnR8wd+wZ64psZ/ACvq+txUBL5Wa0MkZIFxi3Y+raOCEzNtDBHP9N+Uoy9ZvI5Ww57lNpIxrwO2HbLYHgkzeK8KeUBOx5TpVjCc1DJWlh3A5Yp/HGqUw6mddobPCW+moGdvo65qTq7BsaDw4lmk/miIpKfcn3iwoSDVcCedgPHsTCeehN+Q1VLW1kBbF6Hc1iW2WkCHRPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69JHUfgzR8vARAyiL0wV+vFjqq4F/nYbCZHoOlCFGok=;
 b=eo9g+X88+lvKJRb71m/aIrYTl9AFoYs8rmKig/4RlmRX/7iC3x+8LI5BHtpiAthQFI1rKPon7duSliMl+hwWWqWhpjFFgg35GymapNgLy7VO4Y9tw/dFSWP+plwORPSFAYtNKaY/IlkW0pJdZKHhoorgCtnfmCd+c/FjJIIUkHQ=
Received: from CH2PR12CA0015.namprd12.prod.outlook.com (2603:10b6:610:57::25)
 by SA7PR19MB997352.namprd19.prod.outlook.com (2603:10b6:806:4cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:42:13 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::7b) by CH2PR12CA0015.outlook.office365.com
 (2603:10b6:610:57::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 12:42:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via
 Frontend Transport; Wed, 5 Aug 2026 12:42:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 964D1406558;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7A386822542;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, niranjan.hy@ti.com,
        oder_chiou@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/8] ASoC: SDCA: Move HID descriptors to function
Date: Wed,  5 Aug 2026 13:42:01 +0100
Message-ID: <20260805124205.4152543-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
References: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|SA7PR19MB997352:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 465f1aae-1e4e-41be-0afd-08def2eef94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|7416014|23010399003|10067099003|11063799006|6133799003|56012099006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zROqiIp52NTxGVWT5Gzfsn5SAYWz4KcRxLNhOPqBhqcnz/OVfoNzZbsesUAh2YK8qgCtx8LIeYB1dIlrybSQwUaAPTizaW8YDMNGuH7cEC87WsZ1aFYZcdG3zfSIrWEc/82uH4CFTEzrt+RSfoqlkxM/BGujoQfWDYEqV1U1qZIS6+nTys58ntocd9/fpBpwRXNW9ejNFmIGExvDws9y7cjSkpLx2RQfNTwNJinhI64LBZLPUxozvuWQkjvOFY90104KB373jc82JQUrUSFHQp8CLbsJODVT4Cl2H+MzyWn9CG/lxw2WKSCX4ukZHdT4CjvdaOTRh+KMDNjrkRKEGFjQQlPrY/KWEiwjZp1StN+vL7doxgRCUnZodUVepv3lSiRAWc2Pi7re2fu/Pive7axXJ6TX/ceU9PONcc/Zt7H/KMiMPDJe5do/Epv7ssQTWcKgwQEIFYXKxnTunoG9Lh98ndXr9URaBg5bGVguB0SuiSobFrgLXFTzGPLxkaoGSmF6DtciV2aTQ+Cn3lk0CchG6CdisWU3InEx9iJglxQxhX/hIFhesHuNyy4pO8pOZ7+CissnKEucWGpTeGwsIQApnMQV914kKbi3ca7N6p6kVik/4DICmiWNkjZkRXNJrCpl4Lye8m6+mWR+rLH77NlY5cUej2ekSYVQ2Eu6YzShQmhJOmhEdGk696Y2Nt1DDPdeReBQ7Ji7M8GoT+3dmA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(7416014)(23010399003)(10067099003)(11063799006)(6133799003)(56012099006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	565O6EIWxoM9tPeO29ZztEYRjAmkxL1RHLs4W+L+5bNgq7hiz04mtPieuwRGDFc47B5ofiyanuag8w9ohZUJgEqTZ0+Emc9MASXcGjcu20TQ5UjRfYNxsH1sJDzRVUwjnHFFIIYs2+3MvJ2AcnC4UbUNSLe6hBIC6vfKwi2fWt8IQCP0muKUMjRodWSdH2M5r1/Tg+HLt7qsyayGDdWa38PaCxSkhB1aDhG3Qco3yWBj7KgOCOhD4iL7K2sPeQKTBvQ3QmFJw8pVuY+vTJ8PfO4eGMN/YQwLGml0y3rPDSzxZ60HSmcE/bFTU5EXaEzSKi9wggwpL97LKbHStQmKK64ZyoZjKsRFcLP0KajXVf4XupTfc3Ynr/bHMIdRE/7rvD4EBIG3M8fAQw/7BuBHSYCeFKFl1+7sI7FnH+SRcUdbmIYONFbiTbPZxONTjthK
X-Exchange-RoutingPolicyChecked:
	N7ohWJR5nWetfSLC6c91110E/f0AUtEv28pTy3G/JAVXKxuI8B/8Cx68sw3MPSwS0DCVq/bMsYk5M03jlQdxZ/B2SrSRYEeTdFFd3trvT1iC+1beEypZ9Jws7f0vLGnPA4sOl3J9+gXXozOmqPf5EVa2XTKduZHzljUrCtLsfUQoT7OHgWdlnqffiCFYimM3i0lvljsv+sLlri3aIu1hcQtOp4gRGd/fuo8+0TacKVIDiO+dZDxsJRIbfWFnFzlR367qWew49XDnVl6tDcbkCaUCPYRmGvCAyP+1lOrJ+pJEzQeOoVTrqLUpqGdrMpp6Upujb6l6vM+boKbJV3MxLg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:42:12.9359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 465f1aae-1e4e-41be-0afd-08def2eef94f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR19MB997352
X-Authority-Analysis: v=2.4 cv=ZK/nX37b c=1 sm=1 tr=0 ts=6a732fa9 cx=c_pps
 a=dTL/NSpv458ZJk1fBD1pSQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=5O3Bb7otnqWnkzufcSAA:9 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: uq0DUTf9-YK80skwRf8gILo8QCoyv5k0
X-Proofpoint-ORIG-GUID: uq0DUTf9-YK80skwRf8gILo8QCoyv5k0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfXy1TUBllln0rq
 rDyrQNJcUX2/Dp9MvtkmneXOjSG3oPe7iuSujuoeU/7U+Jdlxyq8/5OFt6yumT3UclOxltxgZ+y
 pVCcqiu9LfqE9V2L5KqCGzHPMJXg/ZD3urolOFwrx9q98mrpHKimuD2kBD9HgKAmPvc627y5H3O
 U6g3AIiRoifUQL3pvUqFo83PECyQ9iimusbGPyiBMVyMZxT9+5tRSU0jzv2vQWv3mFXGFvjRNQ4
 Q7q8z3Pilo+IhvTxjptEDBVvlCRvxY8yFwaDa01R0nu0+2bcUrbUm9sIk0p/tU9iD66QZoJzYAq
 m6Et7PNtfzchbZHc+SlxJGVdRc+HsGW0wYuHTaKrGnHWyE8V2LN8hinzGECnwKQtrH+Xsb3MC1S
 PLIJ5iaLuXhmKqtDb87s1aR6wPirSgAZa4RLtzgUZOK/s2B2Ssg942havcOlnkLX/eQM4mgSxy5
 F61syVxxSmC8LFmnxuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX4pqj1RkGGtIR
 Da73uoiW/2dzCZ42Ul4hMIWx3IdJIHTiu7cHkfpQXi6Fx++hNWqmK2HCflrXAO+ufdwgTxxin0n
 bpiy/5jRt1snwCA4BvbQvWkW3PyPLhw=
X-Proofpoint-Spam-Reason: safe

The HID descriptors are defined at the function level in DisCo
and as such it makes more sense to parse and store them at
that level in the SDCA code. This shouldn't really make much
practical difference but is conceptually better and avoids
passing the function node down to the entity parsing code.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   | 19 ++++++++--
 sound/soc/sdca/sdca_functions.c | 65 ++++++++++++++++++++++-----------
 sound/soc/sdca/sdca_hid.c       | 11 +++---
 3 files changed, 63 insertions(+), 32 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 35799a9771454..72441ed5eba49 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1126,8 +1126,6 @@ struct sdca_entity_ge {
  * within this Device
  * @max_delay: the maximum time in microseconds allowed for the Device
  * to change the ownership from Device to Host
- * @hid_report_desc: HID Report Descriptor for the HIDE Entity
- * @hid_desc: HID descriptor for the HIDE Entity
  */
 struct sdca_entity_hide {
 	unsigned int *hidtx_ids;
@@ -1137,8 +1135,6 @@ struct sdca_entity_hide {
 	unsigned int af_number_list[SDCA_MAX_FUNCTION_COUNT];
 	unsigned int hide_reside_function_num;
 	unsigned int max_delay;
-	unsigned char *hid_report_desc;
-	struct hid_descriptor hid_desc;
 };
 
 /**
@@ -1399,6 +1395,16 @@ struct sdca_fdl_data {
 	int num_sets;
 };
 
+/**
+ * struct sdca_function_hid - information about a function's HID descriptors
+ * @report_desc: HID Report Descriptor for the HID Function
+ * @desc: HID descriptor for the HID Function
+ */
+struct sdca_function_hid {
+	unsigned char *report_desc;
+	struct hid_descriptor desc;
+};
+
 /**
  * struct sdca_function_data - top-level information for one SDCA function
  * @desc: Pointer to short descriptor from initial parsing.
@@ -1413,6 +1419,7 @@ struct sdca_fdl_data {
  * @reset_max_delay: Maximum Function reset delay in microseconds, before an
  * error should be reported.
  * @fdl_data: FDL data for this Function, if available.
+ * @hid: HID data for this Function, if available.
  */
 struct sdca_function_data {
 	struct sdca_function_desc *desc;
@@ -1428,6 +1435,10 @@ struct sdca_function_data {
 	unsigned int reset_max_delay;
 
 	struct sdca_fdl_data fdl_data;
+
+	union {
+		struct sdca_function_hid hid;
+	};
 };
 
 static inline u32 sdca_range(struct sdca_control_range *range,
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index e9b449b670332..e49acfe49e289 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1364,14 +1364,13 @@ static int find_sdca_entity_ge(struct device *dev,
 	return -EINVAL;
 }
 
-static int
-find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
-		      struct fwnode_handle *entity_node, struct sdca_entity *entity)
+static int find_sdca_entity_hide(struct device *dev,
+				 struct fwnode_handle *entity_node,
+				 struct sdca_entity *entity)
 {
 	struct sdca_entity_hide *hide = &entity->hide;
 	unsigned int delay, *af_list = hide->af_number_list;
 	int nval, ret;
-	unsigned char *report_desc = NULL;
 
 	ret = fwnode_property_read_u32(entity_node,
 				       "mipi-sdca-RxUMP-ownership-transition-max-delay", &delay);
@@ -1424,23 +1423,6 @@ find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
 	fwnode_property_read_u32_array(entity_node,
 				       "mipi-sdca-hide-related-audio-function-list", af_list, nval);
 
-	nval = fwnode_property_count_u8(function_node, "mipi-sdca-hid-descriptor");
-	if (nval)
-		fwnode_property_read_u8_array(function_node, "mipi-sdca-hid-descriptor",
-					      (u8 *)&hide->hid_desc, nval);
-
-	if (hide->hid_desc.bNumDescriptors) {
-		nval = fwnode_property_count_u8(function_node, "mipi-sdca-report-descriptor");
-		if (nval) {
-			report_desc = devm_kzalloc(dev, nval, GFP_KERNEL);
-			if (!report_desc)
-				return -ENOMEM;
-			hide->hid_report_desc = report_desc;
-			fwnode_property_read_u8_array(function_node, "mipi-sdca-report-descriptor",
-						      report_desc, nval);
-		}
-	}
-
 	return 0;
 }
 
@@ -1518,7 +1500,7 @@ static int find_sdca_entity(struct device *dev, struct sdca_function_data *funct
 		ret = find_sdca_entity_ge(dev, entity_node, entity);
 		break;
 	case SDCA_ENTITY_TYPE_HIDE:
-		ret = find_sdca_entity_hide(dev, function_node, entity_node, entity);
+		ret = find_sdca_entity_hide(dev, entity_node, entity);
 		break;
 	default:
 		break;
@@ -2167,6 +2149,35 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 	return 0;
 }
 
+static int find_sdca_hid(struct device *dev, struct fwnode_handle *function_node,
+			 struct sdca_function_data *function)
+{
+	int nval;
+
+	nval = fwnode_property_count_u8(function_node, "mipi-sdca-hid-descriptor");
+	if (nval)
+		fwnode_property_read_u8_array(function_node, "mipi-sdca-hid-descriptor",
+					      (u8 *)&function->hid.desc, nval);
+
+	if (function->hid.desc.bNumDescriptors) {
+		nval = fwnode_property_count_u8(function_node, "mipi-sdca-report-descriptor");
+		if (nval) {
+			unsigned char *report_desc;
+
+			report_desc = devm_kzalloc(dev, nval, GFP_KERNEL);
+			if (!report_desc)
+				return -ENOMEM;
+
+			function->hid.report_desc = report_desc;
+			fwnode_property_read_u8_array(function_node,
+						      "mipi-sdca-report-descriptor",
+						      report_desc, nval);
+		}
+	}
+
+	return 0;
+}
+
 /**
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
@@ -2218,6 +2229,16 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	if (ret)
 		return ret;
 
+	switch (function->desc->type) {
+	case SDCA_FUNCTION_TYPE_HID:
+		ret = find_sdca_hid(dev, node, function);
+		if (ret)
+			return ret;
+		break;
+	default:
+		break;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index ea511c6f9798e..5000d73657b41 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -24,18 +24,18 @@
 
 static int sdwhid_parse(struct hid_device *hid)
 {
-	struct sdca_entity *entity = hid->driver_data;
+	struct sdca_function_data *function = hid->driver_data;
 	unsigned int rsize;
 	int ret;
 
-	rsize = le16_to_cpu(entity->hide.hid_desc.rpt_desc.wDescriptorLength);
+	rsize = le16_to_cpu(function->hid.desc.rpt_desc.wDescriptorLength);
 
 	if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
 		dev_err(&hid->dev, "invalid size of report descriptor (%u)\n", rsize);
 		return -EINVAL;
 	}
 
-	ret = hid_parse_report(hid, entity->hide.hid_report_desc, rsize);
+	ret = hid_parse_report(hid, function->hid.report_desc, rsize);
 
 	if (!ret)
 		return 0;
@@ -90,7 +90,6 @@ int sdca_add_hid_device(struct sdca_interrupt *interrupt)
 {
 	struct device *dev = interrupt->dev;
 	struct sdca_function_data *function = interrupt->function;
-	struct sdca_entity *entity = interrupt->entity;
 	struct hid_device *hid;
 	int ret;
 
@@ -102,13 +101,13 @@ int sdca_add_hid_device(struct sdca_interrupt *interrupt)
 
 	hid->dev.parent = dev;
 	hid->bus = BUS_SDW;
-	hid->version = le16_to_cpu(entity->hide.hid_desc.bcdHID);
+	hid->version = le16_to_cpu(function->hid.desc.bcdHID);
 
 	strscpy(hid->phys, dev_name(dev));
 	snprintf(hid->name, sizeof(hid->name), "SDCA %s:%02x",
 		 function->desc->name, function->desc->adr);
 
-	hid->driver_data = entity;
+	hid->driver_data = function;
 
 	ret = hid_add_device(hid);
 	if (ret && ret != -ENODEV) {
-- 
2.47.3

