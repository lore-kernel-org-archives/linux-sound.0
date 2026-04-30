Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9603FFACF;
	Thu, 30 Apr 2026 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544510; cv=fail; b=EV7VM/AX+pMle5Y7gCTTHx8cyvhcr/D9dHb6xTQLzqFmqyZ8J+9llhTtxXh37Q9DHLR7nzQ/WT93Vs1gJRQ8fbztuo/ctS2jLFGlKygrJWimoJ0+It56xNI7FNAC93/at37tlBvT0gc5JXoyKY4AQr3fuqyL5toevg6JWRm+j/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544510; c=relaxed/simple;
	bh=Qx1eRrbbsGaOKLnWt+A1ukKKt2qFKwx5hPkHxXUWufk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmTZHrVbC12o33rTLySwTz0f6rCWID/ef1xmoIBgauvJ+nMOVi2ytmhrGcaq+hFT4RA7Bpp0iriIJdUKFTC6GSkBbPly0lsMkrSIltxfCxV10wygyxwsy8L9O7ZDE/LTnvkveoRYw4/V1aIsiDIbXqgK+3JpANtBakpDsu3WKa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iAizapcn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=I3LnTVmy; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iAizapcn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="I3LnTVmy"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U4YrdL687636;
	Thu, 30 Apr 2026 05:21:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+TaWmYXK272UlTMmyap6SC8U/pszIjbU/qvFkm1rTdU=; b=
	iAizapcnyZ58DxseghFvaGfn11SYGPyh0Ad7QQERsxlBps6e4LyWKhTmZdemt1bA
	gNiCM5gK52/vuYz0PWthBZIL2MF5ZF3yIYuNncJppWcNM5hp66BQcVHXy2tv6ojG
	DP/uSqlZdMTPHdaGuRvJLjQOvmm5J258KWDWQ7br19NdJGsyD00a8IYiIilvMuLd
	RIy9LYVqiL7lQeqjSRE6ZxR/f2PK69mcvLTyPjyqj8Q/zI0kllg+Dvnm/tClbyJt
	pC9mwFyqyZXNWrAF6EOfsSeuVKzqxWEdPuTRGC4It7psO+9qpi6+SwvYk4MDBLru
	AOdTJ38XXcPsak0VaMjZ7g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021079.outbound.protection.outlook.com [52.101.62.79])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jq0b8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 05:21:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewoJSsn5/a5NmS86H1tbsZHWVhuq0lODXnJl/HJxq8+fhPfymRmvcbv0u3n6e1/nt65Khpb5o3eG05Q0B31skz78/DS0MQxCMa1IRti4TxZqzMhD56tfv4KitRUAXqt3mJ0ll4D4UevISldNA5S+d6zcnjGDRFNJoUVHFu7fm0N1brBEHbnfzF5bvxwf9GdvU2flRgYFt31t6HLACHy2oclANYIJeurVftgt8ukgPLH1MO7qnws+xXLxAAYpiqh8X+NJ0nmzqR5YVWNQZuxTvM1Q3ixa6hGfuOJYDMkOvQUR06HyUsr1pHL0/4fBdNJFp62LJ7IEI7ttj3FxMnKaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TaWmYXK272UlTMmyap6SC8U/pszIjbU/qvFkm1rTdU=;
 b=erwIJyZDFK9NYCrVIYCAOnhLJRfgmrI2OELKVjtoC0chOL3tiE8xRNI6bpZ2exQYcJcZBJ03FdYXgV8eZDYLjYIcmTStshaYzcY8WlAUPLo22Guj+E4/8M48wRT6say/2kk6ldfLY6QI+hTKV7EECu5YkDBqs6lKoXi8hT1/pmkhAoDTyIrDgjCwf0Quw1LY93EHeKxnpQHeL9H0hn58wm7CWpyjA5DYhuArQXEU0FDMNCUZZb4TXwfLkJtQyeyni0zYVKoh7nlZXMq1pdPP6Xrl0B4GdHXPrY6A6fBKci6q7cc2sSAQ/fhJfiPU6cYkCNXhGuaryrVQBfIdA5LKHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TaWmYXK272UlTMmyap6SC8U/pszIjbU/qvFkm1rTdU=;
 b=I3LnTVmyuiZ8JZyayqTXAIELGZavm+zHZBwC4uutMxLkGPnaET7HT+1GSJIUgKX6ZeP2aMkIekFdaK9Gh/A9NTJWWSjkEn3Unv4myEJSs8Dl5/3S3EAURX++Hjy72IA+8TpxVLIuVO3IE+LYKvK6jgDqQaqFhJnqgW4ephCoGrk=
Received: from CH2PR15CA0012.namprd15.prod.outlook.com (2603:10b6:610:51::22)
 by SJ4PPF1D334ED31.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a0d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Thu, 30 Apr
 2026 10:21:28 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::93) by CH2PR15CA0012.outlook.office365.com
 (2603:10b6:610:51::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 10:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 10:21:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DF850406554;
	Thu, 30 Apr 2026 10:21:23 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BA7DF82026C;
	Thu, 30 Apr 2026 10:21:23 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/3] ASoC: SDCA: Remove sdca_function_data duplication
Date: Thu, 30 Apr 2026 11:21:19 +0100
Message-ID: <20260430102120.1283320-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430102120.1283320-1-ckeepax@opensource.cirrus.com>
References: <20260430102120.1283320-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|SJ4PPF1D334ED31:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 35d6ca20-80c6-4ad9-d5e3-08dea6a23c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|61400799027|56012099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	4H0aVfao3dqGQ/JVelMO+MHx8EA/xm9WvdD/K+gYqQCHMP4MKU0I8ifsr6ji77J5cr6PDEgQ0ejYzeZO8KEvbi9zFz6lLvxFlfRv3+RWFBl2Ggd3+gB8x0rgYg7J/TRZc02+x/53aI0hx/5lhNYSb4uk/Du5lNY9fnmcOkb3pwaoTBsGC/PZA6LnLoc8bZS4R2Yu7HQCwoqaRj8MzsIZkQGTMuf4OiPa6Gom4TvoEdC4VYiIPM03aVI0uN28Qju1YQrIG8ST1sstTr5HrJX+KhWvde5K0i3KDuzbeMe2I4VzuDbQ0EbYv+KOu7stsQVVV3BEEY8zg0R1VqvFChVags4xN3vlj9uJLjqGYmXbxRhl7HCJ01Rsv1U2K+JC1rERf04nOYa49mAhui99uO4+qUw9YfPvDuCeJ9hS+BBG1H4PT/SDHEPWNoCqMUFoOjJps8X+ZIhP0q5hjhy0VXCVPaWsvKMkWWBJ9Q5VJOVRYknR9na4T7mvNr9AvU7uuua6VC2YUuoeKvxnFBcr8X3Got8xO39RHp6MmXPosgdbt19G7F84ld6cufFG0hRoTrk6JjUkExDtQi+ra5PrHC5ajR9DsHYaafczO7V9qFkvAcocuJO4n2N2P3TQYVb01Af23SqZQrp6riItlojd9EnN4HZB2jDaIyel/yW/6H9CwwN2DJjSAQcafUR7q9N53MCQ2dfeSKLj4/0odmf+uVZbIeqaZW84VCvqgej0zCLWNwg2oB8ytSEsz94Smu/pGlBOaHX/2jvfwbxZylChutWaoQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(61400799027)(56012099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zi0eb39tblO+wib2Tl74r9KCSye8bViS0fpmHKa8nNj46IlcWyrhfzeN98Zk8HVVubO8bf6BNzLahXPIxfxGLxK3XyDDaO5NSjmdn+LsCWORNKHb1M+d2UDL8ouOVui53dvBgfcDC4SiGx1EvAb265FUjNeDM0SuX8kL9gTfnSZ2k5U/GOvcmgiPFxL6yzzK79BH3iEmHF6WwesOeeVmO9QJvIA8Ei5hTHqTTI3vRCXgpXOL13iPXOaFV+JGhfLojA5OBNOWQHulPVazHlAwcpsAKRKYO+IJ9P2iukh09U7h0dvjNPjp9+6mMFsXDQVyq2UBpWfpHWOoCqMGWc5Uxn8drjcS8IDyhrlgFXI0pVWwwlAic1Y4HwtyF3+6oOixDqjydLfVFzmFcnHHF/nrOoV/eaaQ8h+/RVzzq0gb0nwS6ivjZFWi+UPOnBZpz9g0
X-Exchange-RoutingPolicyChecked:
	DIx7EM8rwPo7FNPueJamS+/bJku9aonCbERQYhcph/5SlqnASBtamaoF1y6Gzl1qJ63o5c26qHNF8nqClk6zHp+wj9rwnnBXINVIHFpDlQ2gwWrwk4x0ObFDb+xHCsvvhpuArYCti1ITdQQWJkNHtly08viuqoNbR8i8HnMwu6Hg54zRldQKgazDjz1+PZLW//9uc07k6EiyfVLS/HkZEOmQmkSDKOTgoBAn3N/EkUMFtyx1J+e7lUC0rD/k/b1WfT+Ouh5VQ0Tu55fMJv1eqmSLZdLwYyWwu/z7QPuN5rkIst5Y2aMpWJGvmJhDCVjwQkuKk5prR8xK4xgMC29QXQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 10:21:25.2621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d6ca20-80c6-4ad9-d5e3-08dea6a23c03
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF1D334ED31
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69f32d2c cx=c_pps
 a=pfd1m+JhmiCErHYdEUHeAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=YCwCtIK0V8ENfNN9dB4A:9 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: 28RKJ4HpHXhPGGEA20DIKmCQFhbbBl7h
X-Proofpoint-ORIG-GUID: 28RKJ4HpHXhPGGEA20DIKmCQFhbbBl7h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEwMyBTYWx0ZWRfX9sadwIZ3OPpC
 o5LCamy+8sIEwmlT+uA83e5pQxBOtaLipi/I3VNO3mmM4u6KtoPDYjQHv8OtiLvMdlRtwXzrH9E
 e9e3a1oUqBwhNu4Qj+rqwflbv5yS9Xx9aXu1E6xnswrncQ96Rra6CQCD78uSbl3UXhyVtZ+MaRR
 CouUrp6ZHBZwJdjITd/yUQ79nGt9MxqQiW5bBQe9e0pVvqRepyEcd1vUIzxvcjJcwJJBdLB5s6a
 NTxCZ2uxyE8OD5sMi+vXT6K4AA6Z+vcpeTJ62i3Bjq5VNIjfIMqu81nN6tnECyb8Nxt0/84V8J8
 2TSX0hfcXHmUy8bMkzMwDfFVUAi56SESCi2j+2XP4ONXVHFqRfUfFRReVxCVSbF+azRfWj8WSue
 mhoaZCEYHskKIrPrvBAb8O8B+UxfW1nBscsJq4F1nj1P7kZvD4vgqMC5IA6hNlZZKGKCsU6FrRI
 gNPycYLTDEj54cMb2Ig==
X-Proofpoint-Spam-Reason: safe

The class driver internally has an array of sdca_function_data pointers
that it uses to store the parsed DisCo data. However, there is already
an sdca_function_data attached to the auxdev device. It makes more sense
to use the one already provided in the auxdev device, as it could also
be used by custom drivers for parts that require those.

Using the auxdev copy also prevents the need for the class function
drivers to search through the array for the correct data, which
currently is based off matching the function type. This has problems
when two functions have the same type as the current code will find the
same data for both drivers, using the auxdev copy of the data avoids
this problem.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Update tas2783 for the API change (note this is untested although I
   am pretty confident it is fine, but Niranjan is CCed).

 include/sound/sdca_function.h        |  1 -
 sound/soc/codecs/tas2783-sdw.c       |  4 +---
 sound/soc/sdca/sdca_class.c          |  7 -------
 sound/soc/sdca/sdca_class.h          |  1 -
 sound/soc/sdca/sdca_class_function.c | 23 +++++------------------
 sound/soc/sdca/sdca_functions.c      | 25 ++++++++++---------------
 6 files changed, 16 insertions(+), 45 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 0e871c786513f..b1489178b0ef8 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1452,7 +1452,6 @@ static inline u32 sdca_range_search(struct sdca_control_range *range,
 }
 
 int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
-			struct sdca_function_desc *desc,
 			struct sdca_function_data *function);
 
 const char *sdca_find_terminal_name(enum sdca_terminal_type type);
diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 90008d2d06e2c..810ddd40ecbee 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1311,9 +1311,7 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 					     "failed to parse sdca functions");
 
 		/* Parse the function */
-		ret = sdca_parse_function(dev, peripheral,
-					  &peripheral->sdca_data.function[i],
-					  function_data);
+		ret = sdca_parse_function(dev, peripheral, function_data);
 		if (!ret)
 			tas_dev->sa_func_data = function_data;
 		else
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 6e9b66f718019..a6a3da8de4371 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -183,7 +183,6 @@ static void class_boot_work(struct work_struct *work)
 static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
 {
 	struct device *dev = &sdw->dev;
-	struct sdca_device_data *data = &sdw->sdca_data;
 	struct regmap_config *dev_config;
 	struct sdca_class_drv *drv;
 	int ret;
@@ -199,12 +198,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	if (!dev_config)
 		return -ENOMEM;
 
-	drv->functions = devm_kcalloc(dev, data->num_functions,
-				      sizeof(*drv->functions),
-				      GFP_KERNEL);
-	if (!drv->functions)
-		return -ENOMEM;
-
 	drv->dev = dev;
 	drv->sdw = sdw;
 	mutex_init(&drv->regmap_lock);
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
index 6f24ea2bbd381..8b63e62485e64 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/sound/soc/sdca/sdca_class.h
@@ -24,7 +24,6 @@ struct sdca_class_drv {
 	struct regmap *dev_regmap;
 	struct sdw_slave *sdw;
 
-	struct sdca_function_data *functions;
 	struct sdca_interrupt_info *irq_info;
 
 	struct mutex regmap_lock;
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 31fc08d513077..1496a15f7d2ac 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -27,6 +27,7 @@
 #include <sound/soc-dai.h>
 #include <sound/soc.h>
 #include "sdca_class.h"
+#include "sdca_function_device.h"
 
 struct class_function_drv {
 	struct device *dev;
@@ -294,8 +295,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 {
 	struct device *dev = &auxdev->dev;
 	struct sdca_class_drv *core = dev_get_drvdata(dev->parent);
-	struct sdca_device_data *data = &core->sdw->sdca_data;
-	struct sdca_function_desc *desc;
+	struct sdca_dev *sdev = auxiliary_dev_to_sdca_dev(auxdev);
 	struct snd_soc_component_driver *cmp_drv;
 	struct snd_soc_dai_driver *dais;
 	struct class_function_drv *drv;
@@ -305,7 +305,6 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	int ndefaults;
 	int num_dais;
 	int ret;
-	int i;
 
 	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
 	if (!drv)
@@ -328,21 +327,9 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 
 	drv->dev = dev;
 	drv->core = core;
+	drv->function = &sdev->function;
 
-	for (i = 0; i < data->num_functions; i++) {
-		desc = &data->function[i];
-
-		if (desc->type == aux_dev_id->driver_data)
-			break;
-	}
-	if (i == core->sdw->sdca_data.num_functions) {
-		dev_err(dev, "failed to locate function\n");
-		return -EINVAL;
-	}
-
-	drv->function = &core->functions[i];
-
-	ret = sdca_parse_function(dev, core->sdw, desc, drv->function);
+	ret = sdca_parse_function(dev, core->sdw, drv->function);
 	if (ret)
 		return ret;
 
@@ -377,7 +364,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 		return dev_err_probe(dev, PTR_ERR(drv->regmap),
 				     "failed to create regmap");
 
-	switch (desc->type) {
+	switch (drv->function->desc->type) {
 	case SDCA_FUNCTION_TYPE_UAJ:
 	case SDCA_FUNCTION_TYPE_RJ:
 		cmp_drv->set_jack = class_function_set_jack;
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 196bade11ab5d..02abb7315b727 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2158,27 +2158,22 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
  * @sdw: SoundWire slave device to be processed.
- * @function_desc: Pointer to the Function short descriptor.
  * @function: Pointer to the Function information, to be populated.
  *
  * Return: Returns 0 for success.
  */
 int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
-			struct sdca_function_desc *function_desc,
 			struct sdca_function_data *function)
 {
+	struct fwnode_handle *node = function->desc->node;
 	u32 tmp;
 	int ret;
 
-	function->desc = function_desc;
-
-	ret = fwnode_property_read_u32(function_desc->node,
-				       "mipi-sdca-function-busy-max-delay", &tmp);
+	ret = fwnode_property_read_u32(node, "mipi-sdca-function-busy-max-delay", &tmp);
 	if (!ret)
 		function->busy_max_delay = tmp;
 
-	ret = fwnode_property_read_u32(function_desc->node,
-				       "mipi-sdca-function-reset-max-delay", &tmp);
+	ret = fwnode_property_read_u32(node, "mipi-sdca-function-reset-max-delay", &tmp);
 	if (ret || tmp == 0) {
 		dev_dbg(dev, "reset delay missing, defaulting to 100mS\n");
 		function->reset_max_delay = 100000;
@@ -2187,26 +2182,26 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	}
 
 	dev_dbg(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
-		function->desc->node, function->desc->name,
-		function->busy_max_delay, function->reset_max_delay);
+		node, function->desc->name, function->busy_max_delay,
+		function->reset_max_delay);
 
-	ret = find_sdca_init_table(dev, function_desc->node, function);
+	ret = find_sdca_init_table(dev, node, function);
 	if (ret)
 		return ret;
 
-	ret = find_sdca_entities(dev, sdw, function_desc->node, function);
+	ret = find_sdca_entities(dev, sdw, node, function);
 	if (ret)
 		return ret;
 
-	ret = find_sdca_connections(dev, function_desc->node, function);
+	ret = find_sdca_connections(dev, node, function);
 	if (ret)
 		return ret;
 
-	ret = find_sdca_clusters(dev, function_desc->node, function);
+	ret = find_sdca_clusters(dev, node, function);
 	if (ret < 0)
 		return ret;
 
-	ret = find_sdca_filesets(dev, sdw, function_desc->node, function);
+	ret = find_sdca_filesets(dev, sdw, node, function);
 	if (ret)
 		return ret;
 
-- 
2.47.3

