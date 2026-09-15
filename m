Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F733B27F3
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 04:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447726; cv=fail; b=DiCC2sXsr56r5zOGxesPSPLnU7AXPZzyb2LgWLNnUIADlQ6TtL//TIPGU4VBYaJhkw0ZyG6UL8pgQaqqR9tP3VlsWNsmcZ9ybZshPqfLeRUeF2fb3FLpl1g37ZCBdg5ziGM7jPj+VKajM/aroJYU3rIicy/5BuSMY50imWkDOrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447726; c=relaxed/simple;
	bh=aUy6yPQ4EUvCRr0by/kWQzPMScf5zS2Qr/kq5OuyIYg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U0nk/DkvT4/NBl037D2XKMkKo6/rMOxnFEuibDpu/BEODrX2vCBCeXCAUQyhyNVFDV+CUlWRq4oeupQtD0T334A7FYEwhJaSk++F9FG4uZdfNk+1QYtR5CZpQut8vsC4j633eobZ6PhOTGg2EHliiDocuQ2zdoxFvM2hEa52w7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=nicOarrM; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZTfAw1O4; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="nicOarrM";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZTfAw1O4"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2loxL3281004;
	Mon, 14 Sep 2026 23:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=iY5GCtobbOAyH
	UkG6CVkfRDWZrcTDSXgT7E9N/OVDT4=; b=nicOarrMMJDfQZWU7M4FsVjWmqet+
	r18G64hjDgNGFTqaYzgRc9wTQnPW6d3sKr7OA7vTW2bbJGTBPB6k1HDeYY3jP1La
	+/fss7iMJ6UHdlyzmBrBAIlHQ0l09rLftydxJjdVedRb9QW5s/R8nF6oB8N1Pemn
	b+M5sRKknOEhTdIlJH0Mmq8Wq26UkQ9wKVOI4LE7tx8EpDGlxqUZty7DTjNMxT6p
	RP0ANbdQIfbLfSqPw08pUKF100TYRjuCCft6aAZM3E4kiCDP7z0ZbeRv3WrnQuXd
	QsxF3pP4HQHqAOiG3qT6p2UAkXd6jBamMvhDy+i5/q8NJ4/UkXYAQWRPg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012034.outbound.protection.outlook.com [52.101.43.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gpvpj8y4j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 23:48:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwJcLEhuHY00nWVU0A/wwZK78mKiLgP8qtBvYCMOu86SF7i+fkSJPVXA3ObGNwTIQfkEtdZKko0CL3DaUiE34M6lp8bqorr8IrfLTjM/XPKppX9jZwox8pgkyCbeNsQn+PStAl1u28NQcEKz6soBmNqGFMioXF783d7nSPDj15+3vGkcirDH1gXoyx28UWDnbA0uiRZ7rxN0I5YO5royg52RCrcQ8skZ7Vx5IJGQK+qVAiP2mx08TdDkAS4Maw7A7CEb1Mi4jBN0j5TKGzImQ7whaxIlFpQIWzzbjRtwlPrg9HDS6Zol3cSD0RsGA2UB1GiFB9iCkDptAniioaa2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iY5GCtobbOAyHUkG6CVkfRDWZrcTDSXgT7E9N/OVDT4=;
 b=AWsS3IKXuN8ApMhyguAFmMIrGiEEny5ZZT7/7AwisNMdlrsHu3rmaqRyEChF1tUT1eKbz+cbE+2f2djgMOT4vkXb0uaEFIzPvP4gIeut/2Qu4Updw2gx1ZlD99/YUcjNR4ngvFbrH4ckvBFIdLMukjzr+umSglVeUDqkDk+vu08XrFsgJ+Sd/2wWYlCiH3g6XtBsRt23ySkpx40QVvVWGprv0wMDvODpsAK73ypMF935PjbXqPJKyPbv6yzSKOi2midBXuBs6Gcl4Jw7w9Q4rklD6jV8M9PBXsjjyJjqBPbW4Ro8UhOpJVWTF64laiU2i36Aob8jbpfmhEKTCZ0jlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iY5GCtobbOAyHUkG6CVkfRDWZrcTDSXgT7E9N/OVDT4=;
 b=ZTfAw1O4L6jGzwaVdiUTuxbKpWcf2Yx95/fNPsm/04UkqY2/a4GLl6486JkV3pL0g3geAj0M53bPMftLP1nirQmKENW0rO5w/od/LgXxErnE+kDuN1lwO7898TZECiYwUbM8gT8jnZ+26wT6i4TnP5gVjXPCP64MpVDDD2/BW9Y=
Received: from BY5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:1d0::24)
 by CY5PR10MB6213.namprd10.prod.outlook.com (2603:10b6:930:32::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 04:48:11 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::7d) by BY5PR04CA0014.outlook.office365.com
 (2603:10b6:a03:1d0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 04:48:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 04:48:10 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 23:47:43 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 23:47:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 14 Sep 2026 23:47:43 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.163.3])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68F4leRj3480595;
	Mon, 14 Sep 2026 23:47:40 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v3] ASoC: tas2781: Add TAS2573 calibration support
Date: Tue, 15 Sep 2026 12:47:35 +0800
Message-ID: <20260915044735.1305-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|CY5PR10MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 507ac753-e2ba-4245-f966-08df12e48aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|18002099003|56012099006|3023799007|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	f7tPjm7CdsURRVp0KONtxUR0FiZozUuf3HG2AZ9k79eSUv5AZAD/cjEEDEo7GmK2YINB8tJxMPwN/RnOEJgpJxaqSkOCCcaUs5fkBm/eZ2sfc0aMlGfywXETkjKggwAhDE7eS3RYBrwK+RzFP+hf+HlYns8LqGrwZ64tpdy7xdSQVloe/3aqfhNBbzLOFQCzinLCujnfX6OytUyukyuBLDsF3IU0zYd/XOjio3nt2egOOW3zM5x+cq3wA8vYGDWRINfaKwtInTfA2NdBnDRDaTcuIlVCQGJitRKfpx/o2Jl5UySLBtXkuSr1ZxK4EDdSjJ2ldffCcXaD6FfJrJq06IK/wqx7zxUnEwWwIKmgfltaCAnjlSElcPRQ5skekmhKK0KUD3wVkvFQnLsaFNdJMHXBCvq4Ct7JsgnUlVvIDyodSePmrnUTUInv2p01ItbukWst+Itw8vfjH2Lp72EfvcM8PcCOJxXb5L4Cf3Vv2d0IQyMecR39kVTifUT2gjlCi0kGTcyngQAhS/C3SK6insT4Z5eEUSklU+hWXaLwYNAb5EmNwtDVfsMQABAWWcWWtuPl3jUVRzv+9rC/kmg4iRRUQcjifvywZipvwcteeiJ2WjdnUun5I+lx/jr0xlTA6/jtnLmLcWdje1RekD25wGf6EAAN/uwIuvVyJo8RCAT2s5Xt+Zwhlrnzum3HWPbFBjE0jYpEZlIBUQhcdD+VVQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(18002099003)(56012099006)(3023799007)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s3M9iXsPcX5eFgcKPMNQKFXb8kzqN/ywDgSEbfbTESZbJV7ygVRQzp+jUHfdehEu/UrKHQfmIP+DEs2aqJkF8VcpdEXXclnypLLLheaX5g1HE3ELeZrIGJCS2z7CdXphGMiTfO33LpYKfJ37yg5f4x0aYdCyotoUGB/E32sR5wEweTSq54TfzUSJ8p8XRknB3eQOrzfzUj7OLIhFlEtaTR9cJUB4tCXOd194o4btgsPkTsLZTe/1+IBaonK6ig16MdXwc3hdLtdiCv6Cg5RPAAN0hRDbkUvEZVXd2DrSkkbO0mbsyBnhjBOKQULC0drF+qfZTRM1H0nARHn+6QyIkN0q78tnpNbZXOCk2BLanpIQRehnEFPOjQmfHK9cNPzq43BlODaUOMDr+LuzEuZIHG3ca3b8fB/adfM/JK8Xa8avQrnlZETzpQzaxK/WUbUY
X-Exchange-RoutingPolicyChecked:
	YgLI6rMmIntwPCJqFyHBSWYPpHPHPmM8GMZ18Szyu4HrJ/AIApZ/z53H13IJJHcAHT6eQ3Mmbm4dowfwkuofA9qepkAWOrmIhSmTQT6lXJhkMucJ7pqUOXdSf646qlhlNslDiLIyYCyStglwqXPZsnk6YokHFlDlbUPcR0EQMCAYCqIpAVB+PFncoXwJ6lVpC0Egcmeq11oXAN1vK1Xzj2d/2vemkeZyKI4f9Gkq/c+9gBGtQFAxL2rK2ipvfZ9PNQizccRgA6pVXXz/17X4uSPu7YcFaWtrCKXfbS7b2YBpkhXgMam35bhcJFuVDNET8+sq3mE9pGnII7E3Qb+MFA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 04:48:10.0854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 507ac753-e2ba-4245-f966-08df12e48aed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6213
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA2NSBTYWx0ZWRfX4iZROwhi2H13
 AQ/IdMWZIZPRdp8+RghZ6IdyjWOgEWcpAoO+Nx76bk6NsspGI294VV2/qc2Rx9f3UipXsesXB9T
 rD5JoAN5y0qAPLboqV1xbpxN57pZ8vo=
X-Authority-Analysis: v=2.4 cv=KvnYSmWN c=1 sm=1 tr=0 ts=6aa8ce13 cx=c_pps
 a=e7UpQLGcWimQYEoqUdNrWw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=ws6CleEZF0jA5ezxqNUA:9
X-Proofpoint-ORIG-GUID: iUIHzY993AwOG1jYmmMviVapN_UMoR56
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA2NSBTYWx0ZWRfX+EvrBnd6KYSD
 KOTzblVkTe9UFRRcYkE7FSQ2N5Tf/jS+FlCNKiuHyQ81cfHjmZF/W7bsUSKItxAs2bXaXijOCIU
 e1qaets0qjJZzc2VwhHsi03MTjjsMpxqewrmlLQRNdFjTOnuubhHS921DNMv+05SRDhvTKCrdpP
 kAaFSj2CqSkrQUUm6rC7vwqYSb23AMWDXFIXpQDqrQT+gypdHmZUdnrit+G/i5MEiKax7gy9Xd4
 75wfDxuOGx8bTbruVgZPGpoZQIMXMif3b85KKlHnDwmfxJgEHXz86X2i1Wug9cFg9/j8G15N2uv
 FdTv7/weimqU6m6tQs/RkFxjZENbmwjCLuZ/tPcaWJlLIADYJYD2dIaW3op/pH8z4B5j324bupN
 KxOoOTFBXTTd0QFk9Md437rSbiWHlyNDVv0bfcnzKxrSS9mQD4+RuWtF69owbxwwRVXHEG04xOE
 J04w1GqJxf3yaevuQMg==
X-Proofpoint-GUID: iUIHzY993AwOG1jYmmMviVapN_UMoR56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150065

This patch adds complete calibration workflow support for TAS2573.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v3:
 - Our customer requests to follow the feedback from the Linux Community. When there is no
   dedicated special configuration for the calibration feature, the corresponding parameter
   should be set to -1, so that redundant duplicate configuration work can be completely avoided.
v2:
 - Add comments for tasdevice_rca::calibration_profile_id, which is primarily designed for speaker
   calibration scenarios with special requirements. For use cases without specific calibration
   demands, it can directly reuse the standard music playback configuration, and its default value
   is set to 0.
 - Correct some logs.
 - Use proper kernel error code and WARN_ON_ONCE in the tas2573 calib_start_put control.
v1:
 - Add TAS2573 dedicated calibration register definitions
 - Extend firmware parser to auto detect and store "calib" tagged profile and config IDs
 - Implement TAS2573 calibration start/stop control handlers
 - Add dedicated kcontrols for real-time speaker impedance readout and full calibration status dump
 - Refactor calibration control creation logic with per-chip switch-case branches for better scalability
 - Extend firmware ready check to register TAS2573 calibration controls properly.
---
 include/sound/tas2781-dsp.h       |   9 +
 include/sound/tas2781.h           |  24 +++
 sound/soc/codecs/tas2781-fmwlib.c |  36 +++-
 sound/soc/codecs/tas2781-i2c.c    | 320 +++++++++++++++++++++++++++---
 4 files changed, 361 insertions(+), 28 deletions(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index de087f4ca13f..3380dfd526de 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -146,6 +146,7 @@ struct tasdevice_fw {
 	struct tasdevice_calibration *calibrations;
 	struct fct_param_address fct_par_addr;
 	struct device *dev;
+	int calibration_config_id;
 };
 
 enum tasdevice_fw_state {
@@ -210,6 +211,14 @@ struct tasdevice_rca {
 	 * capture.
 	 */
 	int capture_profile_id;
+	/*
+	 * Primarily designed for speaker calibration scenarios with special
+	 * requirements. For regular use cases, when the default value -1 is
+	 * set, calibration will directly reuse the current playback
+	 * configuration; non-negative values can be customized for special
+	 * calibration demands.
+	 */
+	int calibration_profile_id;
 	/*
 	 * Since version 0x105, the keyword 'init' was introduced into the
 	 * profile, which is used for chip initialization, particularly to
diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index b763da613769..7367c76959aa 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -91,6 +91,30 @@
 /* prm_TE_1_Beta1 */
 #define TAS2563_TE_DT_REG		TASDEVICE_REG(0x00, 0x0f, 0x70)
 
+#define TAS2573_FCT_INT_LATCH		TASDEVICE_REG(0x00, 0x00, 0x67)
+/* YM57 */
+#define TAS2573_FCT_OUTPUT_R0		TASDEVICE_REG(0x00, 0x65, 0x74)
+/* YM58 */
+#define TAS2573_FCT_OUTPUT_R0_LOW	TASDEVICE_REG(0x00, 0x65, 0x78)
+/* YM59 */
+#define TAS2573_FCT_OUTPUT_INV_R0	TASDEVICE_REG(0x00, 0x65, 0x7C)
+/* YM61 */
+#define TAS2573_FCT_OUTPUT_POWERTOT	TASDEVICE_REG(0x00, 0x66, 0x0C)
+/* YM64 */
+#define TAS2573_FCT_OUTPUT_F0		TASDEVICE_REG(0x00, 0x65, 0x18)
+/* YM147 */
+#define TAS2573_FCT_STATUS_CTRL		TASDEVICE_REG(0x00, 0x68, 0x74)
+/* YM148 */
+#define TAS2573_FCT_STATUS_BINNING	TASDEVICE_REG(0x00, 0x68, 0x78)
+/* YM664 */
+#define TAS2573_RE_OUT			TASDEVICE_REG(0x00, 0x7A, 0x18)
+/* YM952 */
+#define TAS2573_SILENCE_DETECTED	TASDEVICE_REG(0x00, 0x83, 0x60)
+/* YM954 */
+#define TAS2573_OPEN_CIRCUIT		TASDEVICE_REG(0x00, 0x83, 0x68)
+/* YM955 */
+#define TAS2573_SHORTCKT		TASDEVICE_REG(0x00, 0x83, 0x6C)
+
 #define TAS2781_PRM_INT_MASK_REG	TASDEVICE_REG(0x00, 0x00, 0x3b)
 #define TAS2781_PRM_CLK_CFG_REG		TASDEVICE_REG(0x00, 0x00, 0x5c)
 #define TAS2781_PRM_RSVD_REG		TASDEVICE_REG(0x00, 0x01, 0x19)
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index dc1c552206f8..e8ceeb027e1b 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -199,15 +199,22 @@ static struct tasdevice_config_info *tasdevice_add_config(
 			dev_err(tas_priv->dev, "add conf: Out of boundary\n");
 			goto out;
 		}
-		/* If in the RCA bin file are several profiles with the
-		 * keyword "init", init_profile_id only store the last
-		 * init profile id.
+		/*
+		 * If in the RCA bin file are several profiles with the
+		 * keyword "init"/"calib", init_profile_id only store the last
+		 * init profile id, and same as calibration_profile_id.
 		 */
 		if (strnstr(&config_data[config_offset], "init", 64)) {
 			tas_priv->rcabin.init_profile_id =
 				tas_priv->rcabin.ncfgs - 1;
 			dev_dbg(tas_priv->dev, "%s: init profile id = %d\n",
 				__func__, tas_priv->rcabin.init_profile_id);
+		} else if (strnstr(&config_data[config_offset], "calib", 64)) {
+			tas_priv->rcabin.calibration_profile_id =
+				tas_priv->rcabin.ncfgs - 1;
+			dev_dbg(tas_priv->dev, "%s: calib profile id = %d\n",
+				__func__,
+				tas_priv->rcabin.calibration_profile_id);
 		}
 		config_offset += 64;
 	}
@@ -314,6 +321,7 @@ int tasdevice_rca_parser(void *context, const struct firmware *fmw)
 	rca = &(tas_priv->rcabin);
 	/* Initialize to none */
 	rca->init_profile_id = -1;
+	rca->calibration_profile_id = -1;
 	fw_hdr = &(rca->fw_hdr);
 	if (!fmw || !fmw->data) {
 		dev_err(tas_priv->dev, "Failed to read %s\n",
@@ -632,6 +640,17 @@ static int fw_parse_configuration_data_kernel(
 			goto out;
 		}
 		memcpy(config->name, &data[offset], 64);
+
+		/*
+		 * If in the coef bin file are several configs with the
+		 * keyword "calib", calibration_config_id only store the last
+		 * calibration profile id.
+		 */
+		if (strnstr(config->name, "calib", 64)) {
+			tas_fmw->calibration_config_id = i;
+			dev_dbg(tas_priv->dev, "%s: calib cofig = %d\n",
+				__func__, tas_fmw->calibration_config_id);
+		}
 		/*skip extra 16 bytes*/
 		offset += 80;
 
@@ -1412,6 +1431,17 @@ static int fw_parse_configuration_data(
 		memcpy(config->name, &data[offset], 64);
 		offset += 64;
 
+		/*
+		 * If in the coef bin file are several configs with the
+		 * keyword "calib", calibration_config_id only store the last
+		 * calibration profile id.
+		 */
+		if (strnstr(config->name, "calib", 64)) {
+			tas_fmw->calibration_config_id = i;
+			dev_dbg(tas_priv->dev, "%s: calib cofig id = %d\n",
+				__func__, tas_fmw->calibration_config_id);
+		}
+
 		n = tasdevice_fw_strnlen(fmw, offset);
 		if (n < 0) {
 			dev_err(tas_priv->dev, "Description err\n");
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 6f349f88f194..995bfd52f5fc 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -613,6 +613,39 @@ static void tas2563_calib_stop_put(struct tasdevice_priv *tas_priv)
 	}
 }
 
+static void tas2573_calib_stop_put(struct tasdevice_priv *tas_priv)
+{
+	int cal_prof_id = tas_priv->rcabin.calibration_profile_id;
+
+	if (cal_prof_id >= 0)
+		tasdevice_select_cfg_blk(tas_priv, cal_prof_id,
+			TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
+}
+
+static int tas2573_calib_start_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	int cal_prof_id = tas_priv->rcabin.calibration_profile_id;
+	int cal_conf_id = tas_priv->fmw->calibration_config_id;
+
+	guard(mutex)(&tas_priv->codec_lock);
+	if (tas_priv->chip_id != TAS2573) {
+		WARN_ON_ONCE(1);
+		return -ENODEV;
+	}
+
+	if (cal_prof_id >= 0)
+		tasdevice_select_cfg_blk(tas_priv, cal_prof_id,
+			TASDEVICE_BIN_BLK_PRE_POWER_UP);
+
+	tasdevice_select_tuningprm_cfg(tas_priv, tas_priv->cur_prog,
+		cal_conf_id, cal_prof_id);
+
+	return 1;
+}
+
 static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -621,10 +654,22 @@ static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
 	int i;
 
 	guard(mutex)(&priv->codec_lock);
-	if (priv->chip_id == TAS2563)
+
+	switch (priv->chip_id) {
+	case TAS2563:
 		tas2563_calib_stop_put(priv);
-	else
+		break;
+	case TAS2573:
+		tas2573_calib_stop_put(priv);
+		break;
+	case TAS2781:
 		tas2781_calib_stop_put(priv);
+		break;
+	default:
+		dev_err(priv->dev, "%s: Chip(%d) unsupports calibration\n",
+			__func__, priv->chip_id);
+		return -1;
+	}
 
 	/*
 	 * Set reloading-firmware flag after calibration, the flag will work
@@ -983,6 +1028,13 @@ static const struct snd_kcontrol_new tas2563_cali_controls[] = {
 		tasdev_nop_get, tas2563_calib_start_put),
 };
 
+static const struct snd_kcontrol_new tas2573_cali_controls[] = {
+	SOC_SINGLE_EXT("Calibration Start", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tas2573_calib_start_put),
+	SOC_SINGLE_EXT("Calibration Stop", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tasdev_calib_stop_put),
+};
+
 static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
@@ -1493,6 +1545,182 @@ static int create_tas2781_cali_start_ktrl(struct tasdevice_priv
 	return 0;
 }
 
+static int tas2573_re_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	unsigned char *dst = ucontrol->value.bytes.data;
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned int i = 0;
+	unsigned int j;
+	int rc;
+
+	guard(mutex)(&priv->codec_lock);
+	dst[i++] = bytes_ext->max;
+	dst[i++] = 'r';
+
+	dst[i++] = TASDEVICE_BOOK_ID(TAS2573_RE_OUT);
+	dst[i++] = TASDEVICE_PAGE_ID(TAS2573_RE_OUT);
+	dst[i++] = TASDEVICE_PAGE_REG(TAS2573_RE_OUT);
+
+	dst[i++] = 'D';
+
+	for (j = 0; j < priv->ndev; j++) {
+		dst[i++] = j;
+
+		rc = tasdevice_dev_bulk_read(priv, j, TAS2573_RE_OUT,
+			&dst[i], 4);
+		if (rc < 0)
+			dev_err(priv->dev, "chn %d bulk_rd err = %d\n", j, rc);
+
+		i += 4;
+	}
+
+	return 0;
+}
+
+static int tas2573_calib_status_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	unsigned char *dst = ucontrol->value.bytes.data;
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned int fct_status_regs[] = {
+		TAS2573_FCT_INT_LATCH,
+		TAS2573_FCT_STATUS_CTRL,
+		TAS2573_FCT_STATUS_BINNING,
+		TAS2573_SILENCE_DETECTED,
+		TAS2573_OPEN_CIRCUIT,
+		TAS2573_SHORTCKT,
+		TAS2573_FCT_OUTPUT_R0,
+		TAS2573_FCT_OUTPUT_R0_LOW,
+		TAS2573_FCT_OUTPUT_INV_R0,
+		TAS2573_FCT_OUTPUT_POWERTOT,
+		TAS2573_FCT_OUTPUT_F0,
+		TAS2573_RE_OUT,
+	};
+	unsigned int j, k, val;
+	unsigned int i = 0;
+	int rc;
+
+	guard(mutex)(&priv->codec_lock);
+	dst[i++] = bytes_ext->max;
+	dst[i++] = 'r';
+
+	for (j = 0; j < ARRAY_SIZE(fct_status_regs); j++) {
+		dst[i++] = TASDEVICE_BOOK_ID(fct_status_regs[j]);
+		dst[i++] = TASDEVICE_PAGE_ID(fct_status_regs[j]);
+		dst[i++] = TASDEVICE_PAGE_REG(fct_status_regs[j]);
+	}
+	dst[i++] = 'D';
+
+	for (j = 0; j < priv->ndev; j++) {
+		dst[i++] = j;
+		dst[i++] = 0;
+		dst[i++] = 0;
+		dst[i++] = 0;
+
+		rc = tasdevice_dev_read(priv, j, fct_status_regs[0], &val);
+		if (rc < 0)
+			dev_err(priv->dev,
+				"chn %d fct_status_regs[0] rd err = %d\n",
+				j, rc);
+		else
+			dst[i++] = val;
+
+		for (k = 1; k < ARRAY_SIZE(fct_status_regs); k++, i += 4) {
+			rc = tasdevice_dev_bulk_read(priv, j,
+				fct_status_regs[k], &dst[i], 4);
+			if (rc < 0) {
+				dev_err(priv->dev,
+					"chn %d regs[%u] bulk_rd err = %d\n",
+					j, k, rc);
+			}
+		}
+
+	}
+
+	return 0;
+}
+
+static int create_tas2573_cali_status_ktrl(struct tasdevice_priv
+	*priv, struct snd_kcontrol_new *cali_ctrl)
+{
+	struct soc_bytes_ext *ext_cali_start;
+	char *cali_start_name;
+
+	ext_cali_start = devm_kzalloc(priv->dev,
+		sizeof(*ext_cali_start), GFP_KERNEL);
+	if (!ext_cali_start)
+		return -ENOMEM;
+
+	cali_start_name = devm_kstrdup(priv->dev,
+		"Calibration Status", GFP_KERNEL);
+	if (!cali_start_name)
+		return -ENOMEM;
+	/*
+	 * package structure for tas2573 fct status:
+	 *	Pkg len (1 byte)
+	 *	Reg id (1 byte, constant 'r')
+	 *	book, page, register for fct status (total 36 bytes)
+	 *	Data Start Flag (1 byte, constant 'D')
+	 *	for (i = 0; i < Device-Sum; i++) {
+	 *		Device #i index_info (1 byte)
+	 *		Sine gain for Device #i (48 bytes)
+	 *	}
+	 */
+	ext_cali_start->max = 39 + priv->ndev * 49;
+	cali_ctrl->name = cali_start_name;
+	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	cali_ctrl->info = snd_soc_bytes_info_ext;
+	cali_ctrl->put = NULL;
+	cali_ctrl->get = tas2573_calib_status_get;
+	cali_ctrl->private_value = (unsigned long)ext_cali_start;
+
+	return 0;
+}
+
+static int create_tas2573_cali_re_ktrl(struct tasdevice_priv
+	*priv, struct snd_kcontrol_new *cali_ctrl)
+{
+	struct soc_bytes_ext *ext_cali_start;
+	char *cali_start_name;
+
+	ext_cali_start = devm_kzalloc(priv->dev,
+		sizeof(*ext_cali_start), GFP_KERNEL);
+	if (!ext_cali_start)
+		return -ENOMEM;
+
+	cali_start_name = devm_kstrdup(priv->dev,
+		"Real-time Speaker Impedance", GFP_KERNEL);
+	if (!cali_start_name)
+		return -ENOMEM;
+	/*
+	 * package structure for tas2573 real-time spk impedance:
+	 *	Pkg len (1 byte)
+	 *	Reg id (1 byte, constant 'r')
+	 *	book, page, register for fct status (total 3 bytes)
+	 *	Data Start Flag (1 byte, constant 'D')
+	 *	for (i = 0; i < Device-Sum; i++) {
+	 *		Device #i index_info (1 byte)
+	 *		Sine gain for Device #i (4 bytes)
+	 *	}
+	 */
+	ext_cali_start->max = 6 + priv->ndev * 5;
+	cali_ctrl->name = cali_start_name;
+	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	cali_ctrl->info = snd_soc_bytes_info_ext;
+	cali_ctrl->put = NULL;
+	cali_ctrl->get = tas2573_re_get;
+	cali_ctrl->private_value = (unsigned long)ext_cali_start;
+
+	return 0;
+}
+
 static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 {
 	struct calidata *cali_data = &priv->cali_data;
@@ -1504,17 +1732,43 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 	char *cali_name;
 	int rc, i;
 
-	rc = snd_soc_add_component_controls(priv->codec,
-		tasdevice_cali_controls, ARRAY_SIZE(tasdevice_cali_controls));
-	if (rc < 0) {
-		dev_err(priv->dev, "%s: Add cali controls err rc = %d",
-			__func__, rc);
-		return rc;
+	switch (priv->chip_id) {
+	case TAS2563: {
+		rc = snd_soc_add_component_controls(priv->codec,
+			tasdevice_cali_controls,
+			ARRAY_SIZE(tasdevice_cali_controls));
+		if (rc < 0) {
+			dev_err(priv->dev, "%s: Add cali controls err rc = %d",
+				__func__, rc);
+			return rc;
+		}
+		cali_ctrls = (struct snd_kcontrol_new *)tas2563_cali_controls;
+		nctrls = ARRAY_SIZE(tas2563_cali_controls);
+		for (i = 0; i < priv->ndev; i++) {
+			tasdev[i].cali_data_backup =
+				kmemdup(tas2563_cali_start_reg,
+				sizeof(tas2563_cali_start_reg), GFP_KERNEL);
+			if (!tasdev[i].cali_data_backup)
+				return -ENOMEM;
+		}
 	}
-
-	if (priv->chip_id == TAS2781) {
+		break;
+	case TAS2573:
+		cali_ctrls = (struct snd_kcontrol_new *)tas2573_cali_controls;
+		nctrls = ARRAY_SIZE(tas2573_cali_controls);
+		break;
+	case TAS2781: {
 		struct fct_param_address *t = &(fmw->fct_par_addr);
 
+		rc = snd_soc_add_component_controls(priv->codec,
+			tasdevice_cali_controls,
+			ARRAY_SIZE(tasdevice_cali_controls));
+		if (rc < 0) {
+			dev_err(priv->dev, "%s: Add cali controls err rc = %d",
+				__func__, rc);
+			return rc;
+		}
+
 		cali_ctrls = (struct snd_kcontrol_new *)tas2781_cali_controls;
 		nctrls = ARRAY_SIZE(tas2781_cali_controls);
 		for (i = 0; i < priv->ndev; i++) {
@@ -1533,16 +1787,12 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 				}
 			}
 		}
-	} else {
-		cali_ctrls = (struct snd_kcontrol_new *)tas2563_cali_controls;
-		nctrls = ARRAY_SIZE(tas2563_cali_controls);
-		for (i = 0; i < priv->ndev; i++) {
-			tasdev[i].cali_data_backup =
-				kmemdup(tas2563_cali_start_reg,
-				sizeof(tas2563_cali_start_reg), GFP_KERNEL);
-			if (!tasdev[i].cali_data_backup)
-				return -ENOMEM;
-		}
+	}
+		break;
+	default:
+		dev_err(priv->dev, "%s: Wrong chip id = %d", __func__,
+			priv->chip_id);
+		return -EINVAL;
 	}
 
 	rc = snd_soc_add_component_controls(priv->codec, cali_ctrls, nctrls);
@@ -1554,10 +1804,17 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 
 	/* index for cali_ctrls */
 	i = 0;
-	if (priv->chip_id == TAS2781)
+	switch (priv->chip_id) {
+	case TAS2573:
+		nctrls = 3;
+		break;
+	case TAS2781:
 		nctrls = 2;
-	else
+		break;
+	default:
 		nctrls = 1;
+		break;
+	}
 
 	/*
 	 * Alloc kcontrol via devm_kzalloc(), which don't manually
@@ -1610,12 +1867,24 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 	 * it, for the default value is 0, which means the first device.
 	 */
 	cali_data->data[0] = 0xff;
-	if (priv->chip_id == TAS2781) {
+
+	switch (priv->chip_id) {
+	case TAS2573:
+		rc = create_tas2573_cali_status_ktrl(priv, &cali_ctrls[i]);
+		if (rc != 0)
+			return rc;
+		i++;
+		rc = create_tas2573_cali_re_ktrl(priv, &cali_ctrls[i]);
+		if (rc != 0)
+			return rc;
+		i++;
+		break;
+	case TAS2781:
 		rc = create_tas2781_cali_start_ktrl(priv, &cali_ctrls[i]);
 		if (rc != 0)
 			return rc;
 		i++;
-
+		break;
 	}
 
 	return snd_soc_add_component_controls(priv->codec, cali_ctrls,
@@ -1822,7 +2091,8 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
 	/* There is no calibration required for TAS58XX. */
-	if (tas_priv->chip_id == TAS2563 || tas_priv->chip_id == TAS2781) {
+	if (tas_priv->chip_id == TAS2563 || tas_priv->chip_id == TAS2573 ||
+		tas_priv->chip_id == TAS2781) {
 		ret = tasdevice_create_cali_ctrls(tas_priv);
 		if (ret) {
 			dev_err(tas_priv->dev, "cali controls error\n");
-- 
2.43.0

