Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF8032A3FE
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 02:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785550155; cv=fail; b=XHA24pfXuZNsIVco+WryRBrHhu2wTw4Wri+q2hf6lP61Up+Wwvqb4SeR5WLd6NXx5acym3jeNO2yr7AeF0TxTzENhoX0dcfX0bdm0uVn+ykChfm4vEj2KODAMDHuMQjkv4tGXKoa4QrhL3gJoHxkQ0kUjbTOS02mYZ4D3WJoXXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785550155; c=relaxed/simple;
	bh=GT5Ud1UaCQxvAKgzu5sQqlm8cdiWU/elwVwzKhzoDus=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AqTf/vUUPABOBbRcoNr+YSl60ccDc3PYIW9/e2YdL48YWFYSXhQRzmrLcxUGgQoSaym8hg11Z712QXx7WsPRt4TQN+ouxp5zTPZ74iw6MnEv0aii7zvmy2oD3Z1HZm2lHxR+dsGxZhQ5keHksgZfaU+6cfkwUEVfGcR2lwsxUjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Tb34EG81; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YRM12RMz; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Tb34EG81";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YRM12RMz"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66VLxnP32400153;
	Fri, 31 Jul 2026 21:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=BXnCTY1DJvHwe
	gFvdUI4IDqw6XFavlc8QmznO8DF6WI=; b=Tb34EG81wTofkvz4fvbuwlbj9Mr0l
	pchZrJuR9is5E/PBWLJpQ/FtyED9/ws93iDfL0TWetvxaBmjbrl6VG1fG8JQ1w3r
	nixrSaUvVhNJFnrgEbJ+5szX0x5PPFlGdFhUeVW26v3b8VSZhR46kLRckZVo3MHh
	FN/vWBtVP2ZU5zqnHFhf4zldT1+b8grrPEPy0J03o0zrv6DJXXcNg0UDhI+6i+rf
	L1QJ5SU9WcQip8w5vEbRmB8cvfe022LJDc1BsHJYXiczaNjMt35/AuN2/CRzTz6I
	OSwE0hWo++2jcS5wDZU95Im7cWd+Kh78ufftNekrj6RChZDsBC91Q4CPw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
	by m0384305.ppops.net (PPS) with ESMTPS id 4frur8m7u7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 21:08:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHttRJvO8hs0aTnCLj5KtQ/ccUQpXgl4kVKlmJ+bmrC5SmdwSNr81Yx0Ylltjm1hdIKtomtsk64f7SiAmA3NPDzKXGJTrMaupKfQLq05xR/lLIBxu4XrzRUf9Ptp982VPq5Q+1UYDSMGp/D8MYAFgDW9qn/ee1LPGmTjSNCr9ee8Up2La27QnB91Tt+T/1x7TIGFW4nkiKg/x69A8yb/3JLYRwOhgxrr8dVPqrT+ZXcgwfuMJvrC4G5aWta5kB/KuFdEDm7H9rLyBThQNroo1YwJIsoOhquPNNKCCmAEAbkddOWVzRvE7RutrBKf9puQ7IgG3JiYcDOoHfTVQwlzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXnCTY1DJvHwegFvdUI4IDqw6XFavlc8QmznO8DF6WI=;
 b=Crb/1WeO6yfvb3XnGJZD0GiRWNr9yEiqfik0IIhlf1RD27H2RWXwR+nZ0iruG+aieYl5p39WwM4zhkIbPPFl2B5CnVBeCNSe8jbqfkg4Z30u+VfaT8O/ZgGzKkAHFcMuHd4fePr+3uWTAl1JPfmXkk0qdNkoqfYflCQuSTWIeTH9h4LtheURKbDr/2kRXAGqjPLoPXHZFTPo3Kdzl/zhwlxnDTg13EJzBIYaRS3/qMXrUA8IdHmaw5T0TkT6wH7Wg+KlHxFkWURHZYw8YawR4wHMkbUOYda6Bx86z4ppJwOzOkXM5o7eMT8QUGuUgMm3o2ZLQuqHrv2XIn3dx9Dh3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXnCTY1DJvHwegFvdUI4IDqw6XFavlc8QmznO8DF6WI=;
 b=YRM12RMzAO2iqZbRiPUGmLOBjplcocoOc3AHaoDSuA/ibEMXvDuemSPV1oJ8aliacAYNvIhNWjSY0m9spvSkDbFWEaWP1lpPn5RcnL9pjo3uYSuLsh1CPayj+J0gdj9llBvvyNSsfXhi2EYR5U+MRGA2vpfVL/2ypj0RbmtjuP8=
Received: from BLAP220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::33)
 by SA1PR10MB7739.namprd10.prod.outlook.com (2603:10b6:806:3a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Sat, 1 Aug
 2026 02:08:31 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::97) by BLAP220CA0028.outlook.office365.com
 (2603:10b6:208:32c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Sat, 1
 Aug 2026 02:08:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Sat, 1 Aug 2026 02:08:29 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 21:08:29 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 21:08:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 31 Jul 2026 21:08:29 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.253])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67128PhK2329859;
	Fri, 31 Jul 2026 21:08:26 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1 1/3] ASoC: tas2781: add capture_profile_id field and new tuning_switch prototype
Date: Sat, 1 Aug 2026 10:08:19 +0800
Message-ID: <20260801020821.2016-1-shenghao-ding@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|SA1PR10MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 6465e768-d189-4cf7-8926-08deef71c7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|6133799003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	+0gzMIb4E2mav9lwEA3iaDTdjqSuKB3mxS7kkNy7b+mVm/3m36EsKJtl3fG6YTHw7lnyhZjKPIaO9C5AnGxWLMFCLGChlVbyq9NDAHt2qM6YdqKWJjxMnADWdb3FekSB0601JWLIsdEPgcW2mSbNKiFqopZ2F0kEwjMVhddWK7plQDt8WVQgkOdPo82CKLz87H3h5vieVReQMIIL1yFiv9y6xbDI0kpPqDv67Akh2+n2Hjx78/Y8uKrZzI3AV3rXVtJKFE7e37SsoHZEd3bKGZ77ZtfQ3dO568MPqV2fWC8SVU5cBrG7cH1j7P1pWfPh2yipHS56kLs7bRvELrQxxymfyfU9rp9/2Xgsx5jtt23Pnw1YdHnpEnD/7WD4C2wEYhl2cYJzoLTPD34n21U9YS9h1xtcFPR8FHvbIwddho+socQLglvkCoaAdzUba3PIPmeLyrvWPn1cN/hiMWjCax4g7kQFePqdCtkFhGqtsum0F2Z1fUGQfQpYtAAqWapnzYK+0oXgx6DVfFlb3mVHK/0R/n/2YzdEiAnvfkrI24v2b4ErWjZVSv68rw9hnC32vXzIyzkA4cimMDqAMyS2KG+lHwFHINOQt6E1uCJqkAkufSs8wDuxkFZ0Dk5riqMS9aY4YiCEPEf6Y3EMqkMKSgTSC6HMgALPXV0LYYz5PSIMCNCvp+zGAU+P39TtsRqTsHt/dKgTva4F3JKkjBXGSA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(6133799003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t62t0iWXOnJUvusa6jwH5nQ3fcTnJg9WEmZsM38BrjYo608zMBYqHM7btp63BNRJiovY7QHvKYJKcMU/9a6nnLcUVeMlGNGSQuOc+0jGw9Shj+BwLsTl5lMRYPWMI1xYuLOPQK4DahR0qVMRcoODfBXxQlLuNaAZwei+pn24WlWqE3A2CLXn44ScPSzh7xWNkCzKbTh+qNI2MvdnpFPiXK8CEVs096mjh3ONfyGfMaxkWqxgBgOjec810/syalAPrwM9vUzw3l9vXylnAyYw6vUU5XbGAfHc4zjItTBRJ6CiVKc9MtHZressq40/VhEJnlO1Bgfj+T+qlk2BUD8o5FcHTSMjggMAJ6HJbo4gLJg3ZC+kh8403rp/AFY6lHaN24LLCLG5Odssu5C4Uj2QX06b6nFn0vFufUxDkt4oI8B6mcWhOupfZ75juIaRD10U
X-Exchange-RoutingPolicyChecked:
	kUfgCF45zqKNB8vXnWj3Z44eshEUkkXdgg89vTZY4RiLqx9L2FWodncM5oCPpNti3HWUEntgeIwNWbcBIzPNXbY24BNuECg5rP6W+NIPvAGyi80NSgFbebPRKTcDH54vPBbkTz3fCrWSAWPeJ06En7Az3pZWJqiYsQipfGTXpnyhpVGzUMcP2TRfrlc/Eb0rmaP0i+Yzyfd74ijMf1iv8Gj8zsUQeGYndrXOWPmXaHn93yBxhfcT+YhmMDdC16ANx/voXBAwqiZ/9kuww7wr84dPXl+PtfJ6Beu8M8rWT6yC/WfJYAL1Fa7gQwJNfCGH08xq4F+g2Y9qMtiI2fisyQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 02:08:29.7540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6465e768-d189-4cf7-8926-08deef71c7fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7739
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAxMCBTYWx0ZWRfX+aimcoVU20Dj
 vYbY+W3rF6nPDqHuPFOOhy7S0QnM3tg9altBnZ0T5FlDOcdXwRGlG89A8X6b9WV5p2nK7WAadL1
 uQVAsqXouKxCg8WMlkl1CzO5w51N4iehf4njrojlJer48NdW/8HRue0rB8Fb2EcgDFbdOQhX3uU
 OcDJ7g1IMwbeGhGT1XvczFcnjDf4x/jWNTqQQlCBW5gcla5t27Z2yUKJwwqyIE+/XaP3qx0MGA9
 IepjfhAxlZTOxsUeEK8iezzMF4UY+hR/ubSJEnueB4alTV0s5N7wgq2aqfC00fvGaYLgxEZ85IZ
 BlhS0nWMHCi2dYCqJ9pprVZzTa659oh7LRkTi+E59SxbiRr7HxhLzNY9JQfGZJAdOHIMoI3Lwv5
 SxXyFC1auuwmm2V9C4NxHFtskk2EbZ9fxJxu0J5trwaX2tP5nD6CS+8onWll3RF5j8h2bQq2z8S
 1+IFpKhpb47ejC77hog==
X-Proofpoint-GUID: g5vG4d7USKlB6c8WKbe6twnnTjVqyfxO
X-Proofpoint-ORIG-GUID: g5vG4d7USKlB6c8WKbe6twnnTjVqyfxO
X-Authority-Analysis: v=2.4 cv=Dr9mPm/+ c=1 sm=1 tr=0 ts=6a6d5522 cx=c_pps
 a=cMqFfNUV/FaVxlb8CdtUVQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=EmB0Fp-ZXSPyKw-ceckA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAxMCBTYWx0ZWRfX4uq64usNclu5
 j298lA36FyuXLkJLSnarh7pgO572QVYO/YZKMH1tYgK1CW8IezNVHPrQar8JuCN/JaR7M439RIa
 mj1Pu8OUEkzevAE8tcl2uHkfzYZES2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010010

Currently, the TAS2781 SmartAMP driver uses the same profile ID for both
playback and capture scenarios (e.g., PDM microphone recording or IV data
capture). This makes it impossible to apply different DSP configurations
for capture and playback, which is required in real-world tuning and
production use cases. With these changes, capture and playback paths now
use their own DSP profiles, improving tuning flexibility and avoiding
unintended profile conflicts between SmartAMP capture and playback
scenarios.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 include/sound/tas2781-dsp.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index dd6ee45ad096..e845687decf9 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -201,6 +201,11 @@ struct tasdevice_rca {
 	int ncfgs;
 	struct tasdevice_config_info **cfg_info;
 	int profile_cfg_id;
+	/*
+	 * Used among SmartAMP for PDM microphone recording or IV data
+	 * capture.
+	 */
+	int capture_profile_id;
 	/*
 	 * Since version 0x105, the keyword 'init' was introduced into the
 	 * profile, which is used for chip initialization, particularly to
@@ -222,7 +227,7 @@ void tasdevice_calbin_remove(void *context);
 int tasdevice_select_tuningprm_cfg(void *context, int prm,
 	int cfg_no, int rca_conf_no);
 int tasdevice_prmg_load(void *context, int prm_no);
-void tasdevice_tuning_switch(void *context, int state);
+void tasdevice_tuning_switch(void *context, int state, bool is_cap);
 int tas2781_load_calibration(void *context, char *file_name,
 	unsigned short i);
 
-- 
2.43.0

