Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0782777F3;
	Thu,  6 Aug 2026 05:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994594; cv=fail; b=MB3tfg1xcSu4pgCVZHpxWy9G1MsFHpFB+H6fvFzM0DZH8xV1+Kz45ZLttrkCYU+ydsFq0t87m/6aRuYYyF89DSzwv7p65eVUSz8+qa8z4EMYCIohwhI+GVRWk0LWgY1q/UldQY4/KbaCzKg4VancwzIUt/vA1wqJ6r6KK2P+Afw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994594; c=relaxed/simple;
	bh=bovCYrDfURWRmFWOORR+SBPBDdNvcoyHOA0D9KA5HFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ffZxKPwgtqfUv1nhUDeth9TRzvDXivmVHMF32qflRGDwFzwB53kT9l0INUvXVYuUEoyrghsAX1So6F9kQA7rCksaXQFAPiAyQwEbptfqgvQwxJA98hnunX/AtgTLNfNq8i26txYVJGTb/q8uRwXgSWQOhDwnIGpJFVCKvx2JseE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=P8TDcZsn; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KMl7VZM5; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="P8TDcZsn";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KMl7VZM5"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67656etX2850656;
	Thu, 6 Aug 2026 00:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KHV4AwVPKoADVI1l+DQCoImpvkKitLt2UnmJe+qpa
	+o=; b=P8TDcZsn8885jswxY8s60sjvS4TzXeQdC+vvWgsRUcwvXIyGaWdowoBnn
	tS47NtVJru9nNThTpyzfnNLTXl8OvQK46g+D0jCtrItqH3oCLyPk1AaT3d71r7vN
	7hyltX3SWFugqHwlU2EnZvmeLTKyuLXJowLi7HaI+wS8PtAMxg//+20M1LP413MR
	hYGRMPyrzDEpr6y0MrHj1U/l/sHP6jH3k8UI1Ox3drXdAFIX9qjKFyjJPjeB2WMz
	zLiaB4B5PUZZ7sKKVv4BgcWBmw+zgbEPk+HLNnBir9mgJrtB3q2D0HJDjQYuCkky
	lvl2PhrPHIEoUpBrEDjHqzCHSOk9Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fv43f70b9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 00:36:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/dBgp2SBfzgQYZIft653WbEzuWKGXFD3FQTHbV8MwcfPAY4mpD+1gUal0AX6m0Cs017vFUDWfJyuuHridGwC5nv5P/v59l2t9gtF0BDhDYl4DYqwD58PieByBPLckqih5mWztDOJ2ZrBvz0IdOUveWpg+iVA/Fa+XyyJX/aekEwxINbtpBrjQUXwoWuc8FzaZv8g94vwL6bTePwNEOeO00NRFzdjHUULx8mOdKJ7rGjIIpDIccXKRjwxScimlvVNbFLiKvPpmyxnfbi4YIlIdJF4hbfbDah1Wrh4CUsow5N5DYQHl/A1kEHb4Wy8bv5nLOarNQOZOg/70ebwLwAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHV4AwVPKoADVI1l+DQCoImpvkKitLt2UnmJe+qpa+o=;
 b=zOE2/zcC+WaxX+CFfVNkPam/dXxbGrvALb9pOfor0WjkTfygtTUzL0KFoUWOfydTIBmkoNq8G8cV00g9IgFVf179/h1G6ttcESt9LfhXY5BKcDANTdq6xsy2wI7eSaptllz2mQOTHEgVJhh4+shDesgE6fMB8V5H5bArePTJZSncRHZo/DxX83U5VbJBcNadvjGrKycp7dz6WLWffzV1O8ysTZtzeZftxC1C69OQGjJq2C+67pM8aBPQ7BrkEKgzoI8dHZnAINwgRiCaZ+FkF8+9rBN04RkSBfQ83BCIuL9kivgi4kalFSWKVk38n+c8BlEWjQyxQ0BBm55ibSkE0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHV4AwVPKoADVI1l+DQCoImpvkKitLt2UnmJe+qpa+o=;
 b=KMl7VZM5DWMme1XH4sAFmLe4NDWjxn9FQ7I4tGzZLu0Df5hcShl92OAEtSCk2YsQb8ioli6sK6EawwiF1QdZ2I/Ur2VWqpt0eB4il8Nd9cdvkveeMbYuzGrmrWFcqAoMhHD+woG5vQtStSGJdrK1djCyALn6MrGX1h+Vrh2NTgw=
Received: from SJ2P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::12)
 by DSVPR10MB998079.namprd10.prod.outlook.com (2603:10b6:8:41a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 05:36:07 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:5da:cafe::9b) by SJ2P220CA0001.outlook.office365.com
 (2603:10b6:a03:5da::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 05:36:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 05:36:05 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 00:35:28 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 00:35:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 00:35:28 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6765ZCGv2746850;
	Thu, 6 Aug 2026 00:35:22 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 2/2] ASoC: tac5xx2-sdw: remove firmware check restriction
Date: Thu, 6 Aug 2026 11:05:00 +0530
Message-ID: <20260806053500.1955-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260806053500.1955-1-niranjan.hy@ti.com>
References: <20260806053500.1955-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DSVPR10MB998079:EE_
X-MS-Office365-Filtering-Correlation-Id: e539d1a2-b641-4833-0a6d-08def37c9c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|1800799024|36860700016|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UytwtwWub7+b9yHCeyJNOvmrrvrBG1gEYq2CRgjhAtugaem/hNAiVXfQ0/1C0pXKzOEdD7qacvpbwQdmrpngUACSzFotr9HuuKIV8fdS+ze1eNem3NiMEtKTxI9wAoYARvyHBA0d8aZUDfK5EY/32fZR2foQ1o8/6m6d4xY4HbSsnyMJEimHFAhCF/YH3m/UQSCOGMn/KmlOpggYchtZQBkkrsSnJTGshSd6MKUT3+46rt+zY/gJ3ZaNSK+FCkPjmDLYqPQBbRWUCuTi2CL+Gb1V+HAchSNt2U+Y165gf7bIB/cGQYI/QMZ9utSv72jwHSESkbKG42WUuZftfOPmhi3xMKkX8mcBElncN9Z+PrsF9CcRLySAaY0Afhn/3OpW79tCT4/vQMOKPSjNIpofCM7DP11ED7c4eFdzn7BqQf+ahkrBvQi5D9HctoIcmMv1KPu+6hmp8/H549HXwgS/uqfDc9g8pqzJ74TTD2CZSaVGVU/4Gav9Yke111lLUW6At8s3ErmZOd5H0uW+w4WZm5pndnpBxw6lTFclEdPS/9N6GOA9mKqDa3Xjj2EziTKlW8FrZkRfzmCuWaalhmCunqqtasKV73Ank/Cg9YBfm1U1fkQKEIdX+lNeDpHMAKNOn81YDRQDWjFil1iWbOMYRaosc6putPBBzf3l1Ciu/SuLWYYN2n5FKXbaKfNyOZ2+S3Lxn+tKNeatbpPTLbQ6/g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(1800799024)(36860700016)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	udg44mi6B5qmr1D74E2HUMJUYeEAtD717xStFG10kqmicWhTdO/cB+q8kjqCA3wZrQd+qT76oLAG2TwMMd1HLm12LOpf+9JBfCGJ8wowFjTE7ufmIGionY7gUHyvK0M2V4+pRQzZA/wmlfdhd+yp3VVsCfNfyeoySDJ9t658oIHPd5DQc+5C4wR/N/IvcOSr9Gvhx2jfj84MMPEVMi0PRuBVr6wQ7UZBMFHDsy8axhRdJYJinn7p4FUTv9T0yQDZUtf0ax+ZMZzFTu/s494vAO0pcEvEt77U4CutxioZ6+1Sy6Z9NMPzOa1HjDQrxEznMRZlm32qVGG1kgGkrx1LLqDk1qtZRjX8H6KN0+8mHrFBTuYal40ieGv3yMdozh1/l3DUeVjnTpPpdbezhv9g7HoodQ+HF8yCWYjvoTwocUKM+7jaeZAKIk/HTaQIcVZG
X-Exchange-RoutingPolicyChecked:
	h57NCCOzZ8uBd8K+0tSCqAIviHWY6SdHLpen96aMnyBdAIagZRtV980aTFzIfNlPsqcgtNQZ+MiZym2iXIbd+pNMVZpas9tIEbmHzzPRRAkTFP66Kd+sCv6jn52zunCybFGSTPBvgbyUV8HIQFNdwzoQagUVJkIZUOo9e4TnkVro92TB3qU3VYaMQU9Uk4Gq4y/txGneYbYwrE0DlJWjxcJw1D2dFHqA8DEp5xLcxYaR+LkQxrTA3XmwlFcJANkNIV+KRWMyJUc4GVepazPQUZuK2pTUedfqAi24w0zS6dCwMxOH0/eGh3Vmt/CzMkiWKxLGCCWIMT/1nwCvxoYOig==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 05:36:05.3437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e539d1a2-b641-4833-0a6d-08def37c9c2b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB998079
X-Proofpoint-ORIG-GUID: ym2sVP0SN5PDF-mYP9eWXOs5X7Y2hOfu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX/F7lDUrS2giR
 Q9m7BXNtgnabgIpRNEc9EmBLiEWuBdhLN5UXFJOU4ZuB4uJvoelxjPu5i6HWTom52e1mRJkp+PD
 cnjh1p/3ziBNc+ack37yRuuvY2914s4=
X-Authority-Analysis: v=2.4 cv=Ircutr/g c=1 sm=1 tr=0 ts=6a741d4a cx=c_pps
 a=zHP1L1ZDY46t+2XtVYLmoA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=l8eMV4tZrKKITlRnRYUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfXxPGvhx0CJohk
 zPK4bgacqJQWGhwQa8g9hRFInQASX1p7vA6RrZn5GSAUaPP5L3g+6ByjIhQ829LZS6UcoKEtLo6
 ABpnU3ky2K2A9P0f9dS1jAOl08UH+KxiCo17NxpGNPkhTRkVWIgOY0Q3pHGM99NQAf3kxEgOc8c
 Ki6gjotkvR5Nxy+frwYR24DvCGHewSS7+FXlqZfVIZ+MEZ1PS64CvnjaHsxez5aOvFndSyBaVsq
 r+diVOaTllj0oxP+lu3A2erh1pHB6Hhf/YrkwBrVk994lQphdFOFhE9htKqkE20R/bgr9cSvn31
 Heofrqdu3ltfzLurubEmT0faH09UcnumIVzJzMauyWZNzaN20A6Q2Y8UlEZcd9utlX/RW2ylQPj
 dKC1cjI90R/5JevUupDBsQpSIKOxhZd1NwIssGdta0T1dKTg6jpUoVeTEULpsigGZbssC94WKKq
 UPEyGusCKvZ8u+V6A+w==
X-Proofpoint-GUID: ym2sVP0SN5PDF-mYP9eWXOs5X7Y2hOfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060040

 Firmware support should be available for all the
devices in the family so that basic pre-processing
blocks can be tuned with the firmware if it is
available.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/tac5xx2-sdw.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index 8fedb5292..30cab16de 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -510,18 +510,6 @@ static const struct regmap_config tac_regmap = {
 	.use_single_write = true,
 };
 
-/* Check if device has DSP algo that needs status monitoring */
-static bool tac_has_dsp_algo(struct tac5xx2_prv *tac_dev)
-{
-	switch (tac_dev->part_id) {
-	case 0x5682:
-	case 0x2883:
-		return true;
-	default:
-		return false;
-	}
-}
-
 /* Check if device has UAJ (Universal Audio Jack) support */
 static bool tac_has_uaj_support(struct tac5xx2_prv *tac_dev)
 {
@@ -2016,17 +2004,13 @@ static s32 tac_sdw_probe(struct sdw_slave *peripheral,
 	tac_dev->jack_type = 0;
 	init_completion(&tac_dev->fw_caching_complete);
 
-	if (tac_has_dsp_algo(tac_dev)) {
-		tac_generate_fw_name(peripheral, tac_dev->fw_binaryname,
-				     sizeof(tac_dev->fw_binaryname));
+	tac_generate_fw_name(peripheral, tac_dev->fw_binaryname,
+			     sizeof(tac_dev->fw_binaryname));
 
-		ret = tac_load_and_cache_firmware_async(tac_dev);
-		if (ret) {
-			complete_all(&tac_dev->fw_caching_complete);
-			dev_dbg(dev, "failed to load fw: %d, use rom mode\n", ret);
-		}
-	} else {
+	ret = tac_load_and_cache_firmware_async(tac_dev);
+	if (ret) {
 		complete_all(&tac_dev->fw_caching_complete);
+		dev_dbg(dev, "failed to load fw: %d, use rom mode\n", ret);
 	}
 
 	ret = tac_init(tac_dev);
-- 
2.34.1

