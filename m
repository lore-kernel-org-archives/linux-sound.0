Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E162C28373
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 01:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784423109; cv=fail; b=cydn3uKnwbGwY/Q11qq4YxGqhd4apQLW7+q2aDqxXTduD3hdyFMinApB4A87Aod3PbTfFk8RPyYeRoVfOBqBENqO4im2UgGmg/Je3bq4KC+NmhyR+mXFDFaJZaC6OIFcnO7ZepaReBsA1dk1nuvZgZYEL09VHSG9kvADRNdCwI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784423109; c=relaxed/simple;
	bh=acvAT3PLf1VNUMww0JS3udFC7Y142Y23YZAGHJ7hxVU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VB0wX4qRj0X0GBvsRusw3M6zcZvGoodiv82NxreaYC59CV6zlnpISD6MwCjqpmjOZ4rJKNtQu1mYwd88ri/0qE3JtcMENRadYTxemIVA/a3x1WuFAm9OPDdLADLcnGDh9mqd2sflPpKLV7On1/FKpq1bw5+x4b6QpQCH4JWD3Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=f0AfqLYi; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=St1ZYsQ7; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="f0AfqLYi";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="St1ZYsQ7"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IN37RB2132292;
	Sat, 18 Jul 2026 20:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Lzsm3koTrO2iD
	/kQx2qlvev4NTEiDFwgNpGpTIrf/NU=; b=f0AfqLYiRfCUYLBzPCDwLzGHaw9Zi
	eYizgxXLQLEKxCMHHR3bObI55ZT2I3gNKrHwJ5Ad9hhh7dfmt8k6zBUKgyaj8AXx
	Dcm/tIOSKVqIjd/iRpz5WRkSfAa2x3dcv0j0Jlhix9A8LLso39VI20LILuoqxtw5
	gwQRLutRUQTtThLmkfjUVTEoZBMhE1NvbpIm0pmdo6+JvPOmYr/F0yDLxrumKFfY
	rn66QLzmfkxfz8kshNtPiJTLILLSU0eU6eEMq5X+8Q4B07NTT8agF0NBvwToJhC3
	jhqDfK7wgu6bbnOtfgC5H+9mAjZOplwURwC7fGPJczIc4zI8Rmk1AKPCw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fg2shaprx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 18 Jul 2026 20:04:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaI1mxnsvGR+WwiY6FJSJi8Qk3m7N9EGH6nZDXcRDktvHHw1T1AdUXyIqW9elTvD8PHK89ypYcLGxRIBrGobBk3XxsFig4yXYAiH1pEvPMVkL43K9uu2JP0V1nuR2hnEFbxZpT+1X3r71cv86vmEWAbKtQ1n5P8H7EDl2sitrekgjSsZc4nt3BKHia9dhT2VL87IVjZi1+WFCyZdtl5U6U51drmRJvuLjQI0KkoxbE5rvW4VBIQmceb42fWS4KvolRgX53WKSjeqn5Q8hfAcOC7LJALUbKNIj78uJWGeMx+zIKaCUw2Gk9Lyn68QN17upWcmbLIDYZSY8cleVY0PkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lzsm3koTrO2iD/kQx2qlvev4NTEiDFwgNpGpTIrf/NU=;
 b=krTdf4GryBodv539dPLoH7PgBF3LnShzA+piPzi/ZBfbEOemhcYRDtvn8I8vICw1X45X0aGOq7O1ndWH/7NTMUZCf1UiSpdVWg7gQvzSrlT+5kez3iMEQ7H73li2yNg8iByVOssswCHaivHDQ7ramgfvHn8coddFWmYqMvApiviemnMUNbgA4RxG1l72fAP0CUHqJvUzXWAAVTQAkhwVJhrFEUU5YmACQS2rrXIAKRBdwunPhVCAlM8OoBAz9RIJJac7cZbJwlIgqa5YMmJghFryunfOHgQtW7AHs1nJAMCk1f7Dj4+9MVFTJaov1418oBw8lYfnwAssXQ/CNxY/hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lzsm3koTrO2iD/kQx2qlvev4NTEiDFwgNpGpTIrf/NU=;
 b=St1ZYsQ70NhVxoQq2NcxO7U5FGS3Z24x4nvAX1rmVcG94nJ+1jdKueNdSeMxZEN7j7mmbSi+fUph1wDqSWO+TcoPhOcy18xqX0qd0qwh7OlaGAFlB2WGcBLVt2P0t6j04g+IQVRf7BZrWtbvHcp3+xg4/t8zBn7/Pue6EiPpfOY=
Received: from SJ0PR03CA0070.namprd03.prod.outlook.com (2603:10b6:a03:331::15)
 by IA1PR10MB5924.namprd10.prod.outlook.com (2603:10b6:208:3d4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sun, 19 Jul
 2026 01:04:22 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::47) by SJ0PR03CA0070.outlook.office365.com
 (2603:10b6:a03:331::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.15 via Frontend Transport; Sun,
 19 Jul 2026 01:04:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Sun, 19 Jul 2026 01:04:21 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sat, 18 Jul
 2026 20:04:19 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sat, 18 Jul
 2026 20:04:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sat, 18 Jul 2026 20:04:18 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.253])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66J14EUr3138374;
	Sat, 18 Jul 2026 20:04:15 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <13916275206@139.com>, <perex@perex.cz>, <lgirdwood@gmail.com>,
        <linux-sound@vger.kernel.org>, <baojun.xu@ti.com>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v2] ASoC: tas2781: Add calibration kcontrols for TAS2573
Date: Sun, 19 Jul 2026 09:04:09 +0800
Message-ID: <20260719010409.1555-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|IA1PR10MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 16082f77-1677-421f-3242-08dee531ab01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|18002099003|3023799007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	tM6Ge6oaYpQSvuOlomelttVQQ4HoHd+jmE0vfdpaX1VRnebS7RrJnniYYw0zXu3JWHRqoUOkbWBmhmxjkoWYbhQHAawQx1GC6fBNt5usxRjuInhZyQyJKXglbauo+xW84bweve4TqhtNGwwSR0l+1gtRlU3QHSMHVvhlTRXs3p2qVvPkm+fSuu4iFIOg9Mrkk3vAn+esNqGbVbtF8nlymvIwkZiyQQVyDP/dhgSmIgzo609WdEEeAWt8uWPiHTwtOwBiZMqFzOqhTf06ircg8aEpJov9QsdIOaNRv2SDZ/KxfTh7YveJDWMTs6KRx7AndnAKI9zEnaRDhOpRXp0Ks2WWda8jKaxvmoKvVFi44UUDPM6Q7TiZNqaY3gy4BGE1XTzlGzxGMYpAybpg7I484cllCZs6nq8Cb7ET5Qgr26DoBPo8J2liI8JNOOi2SCdcb/nL3chnFer+7W8WXqVk3GRb3TD0VsM97gK303/5ny7fftzNOHwnWmpYmq1VJY29+YuhnBa/1qzKJ1FE7+isLzF0GspgY95K/Rei5dvt454hbce8/RKm4JCobK0aIga4ar7Mf0VAhhx4iEeFaNhzhBB+Rdo7C3xBWbT8IC3QzDxpsNYpM3iZedQpbYc6LZzoRkFX6iWNrMS/k3BJfPfA3zg9+uP8Lwqy3fEBsrijUp6b70wJiBQz7wanoqJt2AOBuvgkI666aaZDVwk78OP37A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(18002099003)(3023799007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GZQz7I+6Iq7lthKX/odUPFBVDELdCxnwKy0d7noy3JuvyPXp9/CbB+kgD110KUgDnAZQMmK79EsFoyADlCNZsHqcCXbkKkjOyJt+8p9898Tjl97ZJksSPbF57e14LwDhECMPXApZF/CBA2KglzRSrkZbjwequRj4a1mAsL67UAtEAnfWMy0u9Pxezg4/mPDyaMDnwkzzZI/6AV8Fh9G6ZGTAoxRMraUQvq4wzS+iGPup/1U/liyAO5vOxtiuyQOI3lI3cNddxqMI6qRvt8wAGH3WV8ASfR+viZJQWfEzQcB3AogHeINbp8srwvqbC7nH4ZnYnBsR/FpF8gyBNplHmAgZyPevtYM/WNUlWGRvII2lJphDdgGxd603QlmbvqU7UYq8qdys7sDPLXmElEaqEr8UeXjUhRIfY20tbrYqTmypJvqssL/toD/GysQQvLhv
X-Exchange-RoutingPolicyChecked:
	LZRYv04dvrHs1aoAXUI5FlcjH/r2P0WiAJNtbkl1Q2BconWh+TIpvYPMp7jI9tRDJRcXyeW1gx87VkjALEuNMe8Iqx6BqV0sHSeuR44f6JMKEt0VcVb8kKVPnQid0/ksk3ZOIlJKw141fCaRL4ViDmb4YfjlgCtK2xIMLfzW6j26ova/LfC86oMfS2Kc5hR6mPbN02/UmjeqzDsiJmswOlGzEvmxBfZFje1Rwbv6IcB2tuq+r7VGlNSFJoj/sfD/q7hekG5NCsdjEai3Y4MibplnZIOICDiV6dUj1Mk6wqZDEIcUL9ChbgmDvje6IjNDnf0Lg1HqM2JfPQKeAypHyQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2026 01:04:21.6927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16082f77-1677-421f-3242-08dee531ab01
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5924
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDAwOSBTYWx0ZWRfX9RbAqFw7n1cB
 B7DslxouVDpPzUbxBatQWt85uYQ+xvvzWhn+YLA5d/PJg9zas8sDt1Aoc+WkVVPBYQXAXWnxNbX
 Jn1vF5EDyYxwJpO9rp4VVg1QXsR222qC4JDSjkWOlltiDqTHFlv9Rgdppsz13BEOI4ttrB8t62p
 7CMTaT3rLDb1AkR4oS6Den2jDJw3mZbR97HYH8jCVzleqNUBa2d9lUzyYJh6EwV+CJr4/xtFfvd
 h55wiMamllsDLqPonWXHjA/ADNQkTNV+uvii/q2FLwGy4IGgJsnNV+UjE0rnU0pje6PrAHf5hnd
 7ptFcqK6qygDXG4vcZSFNL2+/mhkZ8isoz1IaYOdGPcftOFdUEkjMyS8M1aOujVKDts411XSD1N
 oHvYSalmjQcxRU8t6zih4aRUQlfhKfJK4u2Ta4NGTTJvJ5dItZfgTK+ibHudup9/6nxOyrFECcv
 yWb2z/Izn65qyvr/vaQ==
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a5c229d cx=c_pps
 a=TofqhMGnQVwdh0HkHXulOg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=VVzOVHXrmMk0pW585awA:9
X-Proofpoint-ORIG-GUID: 6ng4AsL_B8rUwzGrtnUbLlNwZjT5H001
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDAwOSBTYWx0ZWRfXys/JKTg2CWQW
 Rbt8q6HTiRK14elk4WlMXscj8ED3kwRtgX/Io+mHmu5X2aeRIEvwA+Db8GWMmY6JzOoAeXX/1QT
 STNMUYoAY4SHHGWXOMm95UlGX5/26ek=
X-Proofpoint-GUID: 6ng4AsL_B8rUwzGrtnUbLlNwZjT5H001
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190009

Add calibration kcontrols for TAS2573 in TAS2781 driver to support
device-specific calibration settings.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - Follow the comment style of the ASoC subsystem.
 - CC the necessary people, and remove unnecessary people.
---
 include/sound/tas2781-dsp.h       |   2 +
 include/sound/tas2781.h           |  25 +++
 sound/soc/codecs/tas2781-fmwlib.c |  35 +++-
 sound/soc/codecs/tas2781-i2c.c    | 290 +++++++++++++++++++++++++-----
 4 files changed, 301 insertions(+), 51 deletions(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index dd6ee45ad096..5f3197f83a34 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -142,6 +142,7 @@ struct tasdevice_fw {
 	struct tasdevice_calibration *calibrations;
 	struct fct_param_address fct_par_addr;
 	struct device *dev;
+	int calibration_config_id;
 };
 
 enum tasdevice_fw_state {
@@ -201,6 +202,7 @@ struct tasdevice_rca {
 	int ncfgs;
 	struct tasdevice_config_info **cfg_info;
 	int profile_cfg_id;
+	int calibration_profile_id;
 	/*
 	 * Since version 0x105, the keyword 'init' was introduced into the
 	 * profile, which is used for chip initialization, particularly to
diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index b763da613769..d9fa3e02bfd5 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -17,6 +17,8 @@
 #ifndef __TAS2781_H__
 #define __TAS2781_H__
 
+#define CONFIG_SND_SOC_TAS2781_ACOUST_I2C
+
 #ifdef CONFIG_SND_SOC_TAS2781_ACOUST_I2C
 #include <linux/debugfs.h>
 #endif
@@ -91,6 +93,29 @@
 /* prm_TE_1_Beta1 */
 #define TAS2563_TE_DT_REG		TASDEVICE_REG(0x00, 0x0f, 0x70)
 
+#define TAS2573_FCT_INT_LATCH		TASDEVICE_REG(0x00, 0x00, 0x67)
+// YM147
+#define TAS2573_FCT_STATUS_CTRL		TASDEVICE_REG(0x00, 0x68, 0x74)
+// YM148
+#define TAS2573_FCT_STATUS_BINNING	TASDEVICE_REG(0x00, 0x68, 0x78)
+// YM57
+#define TAS2573_FCT_OUTPUT_R0		TASDEVICE_REG(0x00, 0x65, 0x74)
+// YM58
+#define TAS2573_FCT_OUTPUT_R0_LOW	TASDEVICE_REG(0x00, 0x65, 0x78)
+// YM59
+#define TAS2573_FCT_OUTPUT_INV_R0	TASDEVICE_REG(0x00, 0x65, 0x7C)
+// YM61
+#define TAS2573_FCT_OUTPUT_POWERTOT	TASDEVICE_REG(0x00, 0x66, 0x0C)
+// YM64
+#define TAS2573_FCT_OUTPUT_F0		TASDEVICE_REG(0x00, 0x65, 0x18)
+// YM952
+#define TAS2573_SILENCE_DETECTED	TASDEVICE_REG(0x00, 0x83, 0x60)
+// YM954
+#define TAS2573_OPEN_CIRCUIT		TASDEVICE_REG(0x00, 0x83, 0x68)
+// YM955
+#define TAS2573_SHORTCKT		TASDEVICE_REG(0x00, 0x83, 0x6C)
+
+
 #define TAS2781_PRM_INT_MASK_REG	TASDEVICE_REG(0x00, 0x00, 0x3b)
 #define TAS2781_PRM_CLK_CFG_REG		TASDEVICE_REG(0x00, 0x00, 0x5c)
 #define TAS2781_PRM_RSVD_REG		TASDEVICE_REG(0x00, 0x01, 0x19)
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index bd16d5326a23..1c94e2825a88 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -198,15 +198,22 @@ static struct tasdevice_config_info *tasdevice_add_config(
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
@@ -631,6 +638,17 @@ static int fw_parse_configuration_data_kernel(
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
+			dev_dbg(tas_priv->dev, "%s: calib cofig id = %d\n",
+				__func__, tas_fmw->calibration_config_id);
+		}
 		/*skip extra 16 bytes*/
 		offset += 80;
 
@@ -1372,6 +1390,17 @@ static int fw_parse_configuration_data(
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
 		n = strlen((char *)&data[offset]);
 		n += 15;
 		if (offset + n > fmw->size) {
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9e6f0ad5f05d..88a675117485 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -612,17 +612,68 @@ static void tas2563_calib_stop_put(struct tasdevice_priv *tas_priv)
 	}
 }
 
+static void tas2573_calib_stop_put(struct tasdevice_priv *tas_priv)
+{
+	// const int sum = ARRAY_SIZE(tas2563_cali_start_reg);
+	int cal_prof_id = tas_priv->rcabin.calibration_profile_id;
+
+	tasdevice_select_cfg_blk(tas_priv, cal_prof_id,
+		TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
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
+	if (tas_priv->chip_id != TAS2573)
+		return -1;
+
+	tasdevice_select_tuningprm_cfg(tas_priv, tas_priv->cur_prog,
+		cal_conf_id, cal_prof_id);
+
+	tasdevice_select_cfg_blk(tas_priv, cal_prof_id,
+		TASDEVICE_BIN_BLK_PRE_POWER_UP);
+
+	return 1;
+}
+
+
 static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	int i;
 
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
+
+	/*
+	 * Set reloading-firmware flag after calibration, the flag will work
+	 * during next playback, then set to the program id after reloading.
+	 */
+	for (i = 0; i < priv->ndev; i++)
+		priv->tasdevice[i].cur_prog = -1;
 
 	return 1;
 }
@@ -978,6 +1029,11 @@ static const struct snd_kcontrol_new tas2563_cali_controls[] = {
 		tasdev_nop_get, tas2563_calib_start_put),
 };
 
+static const struct snd_kcontrol_new tas2573_cali_controls[] = {
+	SOC_SINGLE_EXT("Calibration Start", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tas2573_calib_start_put),
+};
+
 static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
@@ -1330,6 +1386,145 @@ static void alpa_cali_update(struct bulk_reg_val *p,
 	p->val_len = 4;
 }
 
+static int create_tas2781_cali_start_ktrl(struct tasdevice_priv
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
+		"Calibration Start", GFP_KERNEL);
+	if (!cali_start_name)
+		return -ENOMEM;
+	/*
+	 * package structure for tas2781 ftc start:
+	 *	Pkg len (1 byte)
+	 *	Reg id (1 byte, constant 'r')
+	 *	book, page, register for pilot threshold, pilot tone
+	 *		and sine gain (12 bytes)
+	 *	for (i = 0; i < Device-Sum; i++) {
+	 *		Device #i index_info (1 byte)
+	 *		Sine gain for Device #i (8 bytes)
+	 *	}
+	 */
+	ext_cali_start->max = 14 + priv->ndev * 9;
+	cali_ctrl->name = cali_start_name;
+	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	cali_ctrl->info = snd_soc_bytes_info_ext;
+	cali_ctrl->put = tas2781_calib_start_put;
+	cali_ctrl->get = tasdev_nop_get;
+	cali_ctrl->private_value = (unsigned long)ext_cali_start;
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
+	 *	book, page, register for fct status (total 33 bytes)
+	 *	Data Start Flag (1 byte, constant 'D')
+	 *	for (i = 0; i < Device-Sum; i++) {
+	 *		Device #i index_info (1 byte)
+	 *		Sine gain for Device #i (44 bytes)
+	 *	}
+	 */
+	ext_cali_start->max = 36 + priv->ndev * 45;
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
 static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 {
 	struct calidata *cali_data = &priv->cali_data;
@@ -1349,7 +1544,24 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 		return rc;
 	}
 
-	if (priv->chip_id == TAS2781) {
+	switch (priv->chip_id) {
+	case TAS2563: {
+		cali_ctrls = (struct snd_kcontrol_new *)tas2563_cali_controls;
+		nctrls = ARRAY_SIZE(tas2563_cali_controls);
+		for (i = 0; i < priv->ndev; i++) {
+			tasdev[i].cali_data_backup =
+				kmemdup(tas2563_cali_start_reg,
+				sizeof(tas2563_cali_start_reg), GFP_KERNEL);
+			if (!tasdev[i].cali_data_backup)
+				return -ENOMEM;
+		}
+	}
+		break;
+	case TAS2573:
+		cali_ctrls = (struct snd_kcontrol_new *)tas2573_cali_controls;
+		nctrls = ARRAY_SIZE(tas2573_cali_controls);
+		break;
+	case TAS2781: {
 		struct fct_param_address *t = &(fmw->fct_par_addr);
 
 		cali_ctrls = (struct snd_kcontrol_new *)tas2781_cali_controls;
@@ -1370,31 +1582,32 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
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
 	if (rc < 0) {
 		dev_err(priv->dev, "%s: Add chip cali ctrls err rc = %d",
-			__func__, rc);
+			__func__, priv->chip_id);
 		return rc;
 	}
 
 	/* index for cali_ctrls */
 	i = 0;
-	if (priv->chip_id == TAS2781)
+	switch (priv->chip_id) {
+	case TAS2573:
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
@@ -1447,40 +1660,21 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 	 * it, for the default value is 0, which means the first device.
 	 */
 	cali_data->data[0] = 0xff;
-	if (priv->chip_id == TAS2781) {
-		struct soc_bytes_ext *ext_cali_start;
-		char *cali_start_name;
-
-		ext_cali_start = devm_kzalloc(priv->dev,
-			sizeof(*ext_cali_start), GFP_KERNEL);
-		if (!ext_cali_start)
-			return -ENOMEM;
-
-		cali_start_name = devm_kstrdup(priv->dev,
-			"Calibration Start", GFP_KERNEL);
-		if (!cali_start_name)
-			return -ENOMEM;
-		/*
-		 * package structure for tas2781 ftc start:
-		 *	Pkg len (1 byte)
-		 *	Reg id (1 byte, constant 'r')
-		 *	book, page, register for pilot threshold, pilot tone
-		 *		and sine gain (12 bytes)
-		 *	for (i = 0; i < Device-Sum; i++) {
-		 *		Device #i index_info (1 byte)
-		 *		Sine gain for Device #i (8 bytes)
-		 *	}
-		 */
-		ext_cali_start->max = 14 + priv->ndev * 9;
-		cali_ctrls[i].name = cali_start_name;
-		cali_ctrls[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		cali_ctrls[i].info = snd_soc_bytes_info_ext;
-		cali_ctrls[i].put = tas2781_calib_start_put;
-		cali_ctrls[i].get = tasdev_nop_get;
-		cali_ctrls[i].private_value = (unsigned long)ext_cali_start;
+
+	switch (priv->chip_id) {
+	case TAS2573:
+		rc = create_tas2573_cali_status_ktrl(priv, &cali_ctrls[i]);
+		if (rc != 0)
+			return rc;
+		i++;
+		break;
+	case TAS2781:
+		rc = create_tas2781_cali_start_ktrl(priv, &cali_ctrls[i]);
+		if (rc != 0)
+			return rc;
 		i++;
+		break;
 	}
-
 	return snd_soc_add_component_controls(priv->codec, cali_ctrls,
 		nctrls < i ? nctrls : i);
 }
-- 
2.43.0

