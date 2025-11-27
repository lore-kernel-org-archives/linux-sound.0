Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F1231858;
	Thu, 27 Nov 2025 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259119; cv=fail; b=gKcSXKLqAeMn12mP9vTphUyVG29ZlyVB4pP4hP6rhTuDUD70K01MH5LlTMaXqhjcj7QBtX11wTWEF+cMnMtg1sf3tGhFg6oWHiHVA/kLKCRXUyED6idxwIeJtzcmnbIpMJoEORUEH92BO6NqLVL22deivZHE4+2wy2cbC1+/7qY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259119; c=relaxed/simple;
	bh=VRsyrN535F4V+NnfVOrudyoaBQvZkf1ogO5Y3liFOVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qJRAla51JF+VvAJTJyBmCqq539TlgU11+6+LvcqRzThT9AlfIYOVT4KnCAHVLT8X16il0qS6KrbxZD5MDkU4u+KG3WsvieGBKOG9UwyNk3TL9jAJnA64lWaM5kQtYawsMAfgmITM9Hn3vFoDoqTSZst2P+kbgp767fcHEYfhQmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=m2paj8cQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ODx74Aks; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="m2paj8cQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ODx74Aks"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5NNSY624890;
	Thu, 27 Nov 2025 09:58:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Lwcx+Z0+jqjhGQab
	6TsBZOn8BalRuRUmb9SFughuyC0=; b=m2paj8cQtkulkMIaCTY4e/DCEUwYD1kw
	4WX4bVDT9tZ51FbxhHIWq/M36f4McqumwhGrj+nZFh660gOS6YlibvCNtulVjP59
	EI/pwObg3z1yObVfNai1zg98XLr/urOljbDkskPkhnEWVJA4c7ThBO80h1+lkX+j
	waBBMJU1ixAfmI40MrM0xp3CyoMU+gcB3vAOycjdRdGj4wc5Piijtz8VwM0wO0oP
	J3wAtRazwgSPMZKlQI4lchPs6RVtS2Z1dJ2NuUJB851gKQ03Kr2Hm+C2DAAHPBnH
	zIjB9pKGPA4lfFXFbqJaweOlrznXLiFhIDC6aRM852+qU0QBnnrteA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022095.outbound.protection.outlook.com [40.93.195.95])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwtd1g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 09:58:23 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP2mJXsOphnJQAgBUVA8I/qDwwE/XeIuwREjdQ1rpOxZH3NABr4REzDqFSGABzz1D5exV+rM3tKkDDOT7rKv/aAKjut5PF1nYMnuoGYcra7cA6PG+Hxp4hZQXd6uJyIjtWn333gJjMpoVUXCezHAdg9kVkmB6xchp+xT6ovhaLmozbQhCBCZH3YE0rz3MFH5+h7dRe2uKSBeteDmSXzF5H0D27Jbz/opaINRtk0AMPd8eHWfz5efQEEC58ojhx5F/ZYQQ3dlFzyRaVa+g3rnaOOlj+6LRpQCbxsQ555VxdY7ZQakQvM/66FMSOjAuBSH58+GLro1OUihJav2yp+9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lwcx+Z0+jqjhGQab6TsBZOn8BalRuRUmb9SFughuyC0=;
 b=x9TwwWFnz+f25rCKWv7WYBdlgUwHfcGQi+kOqDeAEzt2mVVL294tHpGngsTBAhw3lPQS5IT6XN10VPiIpdj2z31CMOkF/nSkwIVUi9NQGFeWAIpB/U3p+r89za9b/uHxAykk/AaQkqOmT6Dy66pPzdAlXJKLA1FUj/ls/3OJtBinybzXnvl/C1H2CEb2ATc0IzmA6iXGDiJfVqIUP0garYhM+nSWKfZ9QhM5W1eJpU0wdDDOpQyn15fy6YDX1eZOxSinnPWQYNjHCij3ut/TcEc2U/wft6ubEpUfrEBYPtVTsZd8524rrdd6CwfdBbvuQ/sOiZTHj6odQ65AU5egew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lwcx+Z0+jqjhGQab6TsBZOn8BalRuRUmb9SFughuyC0=;
 b=ODx74Aks5kio0kjPvV8n1q4oPlzzMSGqYEYkQ0MequQbHEA8KTCqdqezo7PgaQ3+QMw9Fht5BW0fWGibNH3q2Cpm/Z/e5lHAcoW1kZ1A9Yd12MTZPkKhyJoMoBzS0w0wAxuOG17/L+zvLmwd9XpgrVwpSo4q2SuIpypVEl/LlNQ=
Received: from BL1PR13CA0318.namprd13.prod.outlook.com (2603:10b6:208:2c1::23)
 by CH2PR19MB3989.namprd19.prod.outlook.com (2603:10b6:610:a3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 15:58:19 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::67) by BL1PR13CA0318.outlook.office365.com
 (2603:10b6:208:2c1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.3 via Frontend Transport; Thu,
 27 Nov 2025 15:58:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 15:58:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E9DA0406541;
	Thu, 27 Nov 2025 15:58:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CF5D682024D;
	Thu, 27 Nov 2025 15:58:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs-amp-lib: Use __free(kfree) instead of manual freeing
Date: Thu, 27 Nov 2025 15:58:17 +0000
Message-ID: <20251127155817.1374079-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|CH2PR19MB3989:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fbbcd51d-ed09-4ba5-ad1e-08de2dcdc8ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YjakpYUQmXOwxRT3hWAPNqlibvZqDu4B9snvx2xpClG/pzMoXrFif2txFn3X?=
 =?us-ascii?Q?A6vTYi4ofbawpgBPUkIYD9w1FxvXQHoryH40AH6CrM/HttkfdwzdNmdouEUb?=
 =?us-ascii?Q?3wRqrs21e3ecbHIuSBoYLHlcNbiyzK33KILndumDwGWPq6VEB1MM+QyrJLr7?=
 =?us-ascii?Q?zluZbF8deYhKJwV7be9Yx0aS5U9uN7CvBveRUcuEKZNhoZMwyZwkV4gKmCDZ?=
 =?us-ascii?Q?d2mjb4zItKUZv4hB+kD3MXqGwgBsNthNQ3gE5hC0AwsPm1nfWEBhEFS2sQW8?=
 =?us-ascii?Q?etVcL8kAoncyJB4n5AnJq4/Zl4RGaisUlRC4t0ohf8C9IRpIimn/vtXdQFIO?=
 =?us-ascii?Q?KZVfgnJwlm19kj7YNpLkEnrpC0Ih2Afz1GUeAzOoS3/BlRStDaqvEGe1Cl69?=
 =?us-ascii?Q?qLy0RCZ2vDo+X2NetZ1458Jx9yrIqyQuWUKO/iiaVM3LbRQp4fHXqv/LyEhj?=
 =?us-ascii?Q?+UIGUqSzQUDoTdJJp4p0XXnFanc+dAyAvDZpu7QTsTGpVz+rSstWdKrwgoMA?=
 =?us-ascii?Q?C1vssgdKx/A4cwa1c5WDUinHkc9X1I5Zwlp+T5Oyv+/bwDFEQyw/9HI4Cp3W?=
 =?us-ascii?Q?v/qSOAIRLfFEuTvetpyHC1NFBs5QBwQgW8jG6HmFq2NsWLBkNlTuyf0f8/X8?=
 =?us-ascii?Q?i77I8v12/CfUgFNhHpkR9LMuAgNc2p+z02/d5sFyqzrprmLW//jzX3P9kS5/?=
 =?us-ascii?Q?B5MB3TOTKE0pOR4QLgix0fSNY1Qwlh8dDejCvAbFsM02FW0/sfEwUiEWDTyX?=
 =?us-ascii?Q?VMUKeERDYC81wnPVm/kE57z3i8LGIa5tvOagaW8n4OZqJHHx5tY4pRt4iZ12?=
 =?us-ascii?Q?OW3miTtj/2kec1rLpTYpY2hGqTygSiZrhavOJAxt4Qy7Lsv8pwMSd9JBqU8l?=
 =?us-ascii?Q?56fMGSJFLRoamwXXeaTX3teDP7/S/8cNAw0BnEcjK7rD0jUbA6YeOoMDZ+dj?=
 =?us-ascii?Q?zMXhLS5iVZbxMghwVhqa/AczN8zEHf8qLgp53r6MCu9ekaqDyyEvDTxB9BRX?=
 =?us-ascii?Q?hlxr6Zj+nF/zogqXNLNSmc0EeHhCJgzhlanis98fHOL3BFNnJWQVl0JO3pzm?=
 =?us-ascii?Q?43Lh0OHO7Nrdu6eyrQj4Hh0sMxx9cGoLpcqGGpz+PaYspa1biWeCh8ppjtXC?=
 =?us-ascii?Q?8FQ3QlZjAaxfOfBRjxVCdYQiwpX7+p4eCWk1oPHUPKSO+Mrkw8OsHe+/XQbk?=
 =?us-ascii?Q?0GwzL3xpSaookQT/YxDIUI6QM5yU0UzTZ/RUfbhAgEsURKfrZKYo4nyWF5VG?=
 =?us-ascii?Q?3YKtPSfsjwfh2yyuWCEsZepCB3XxqEaOneWuwdPR78Xd6pihyoYQr+dHyaGO?=
 =?us-ascii?Q?r1LB7yKJ6x+vprJNZNwrozdHOBSCO0xYqlwjg9URKy4mre5M4aViXJwDuD4X?=
 =?us-ascii?Q?HDdCqvtjlg5Z1wZVDmSFieHwYu7fBWEq1f38bIEHhUa7L4lfpvPLk0EoHOce?=
 =?us-ascii?Q?6xbr1ZqT5CSjOWMHnjNromZ6t6NbbgzmuCOjwH+7rHsECfl7efY9l2gDcDsq?=
 =?us-ascii?Q?aM2V4HrTi//FLm8Nx1wyEVeIVdFmIDi3gqaGYrLG5++HHHHkiDzQN4QwuTDy?=
 =?us-ascii?Q?CaQGKKMXRRGjK8lFMEE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 15:58:18.9347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbcd51d-ed09-4ba5-ad1e-08de2dcdc8ae
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3989
X-Proofpoint-ORIG-GUID: MOCuvW5BSfPBVAgdUFD1dSubVCRhB60Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDExOCBTYWx0ZWRfX3sBOJGi91Fdj
 QQ2etMX8YG4iYVnriRy2VKQgS9HyebRDrIyNkY0mRDq5mKwuysbSiqN/h1LK55TcvapoucbqWNf
 3o+O2GuhNs34DK2B47OpRqgAw8UPEVzaCsqQX2FxlVdgDpb+dMH0qgH7m9lH9Qeyl0Eux4y+K9k
 T/Qklt+RfbC6nmX0AFb5wQnG0iBzNylgu9T2s8eRABItpRp92D0Fp6N+C9GV7yYHoTJKXjxNNnZ
 RyXmfBzTzmZxIO1KLnTwZbxY1TBmhs23urItkzT4Dixfl+4welKCYFudcG8hkzHDuWJBiEw8sJa
 c+Gm9E/DUaRgYIEdPMKdox9+4QnyLqNW6CVOGpiRAgiQWIJJxefsHT3XMvH0hMO9sEEJk9LPW3s
 wfm7OOBngZRtVbgwPYx9upIHc0XgcA==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=6928751f cx=c_pps
 a=ZO9zLbrfvwitr87ojz3Jng==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=DOpYuz3GLBM9jLxhA6AA:9
X-Proofpoint-GUID: MOCuvW5BSfPBVAgdUFD1dSubVCRhB60Z
X-Proofpoint-Spam-Reason: safe

Use the __free(kfree) cleanup to replace instances of manually
calling kfree(). Also make some code path simplifications that this
allows.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index d8f8b0259cd1..8c9fd9980a7d 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -7,6 +7,7 @@
 
 #include <asm/byteorder.h>
 #include <kunit/static_stub.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/dev_printk.h>
 #include <linux/efi.h>
@@ -309,9 +310,8 @@ static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev,
 							     efi_guid_t **guid,
 							     u32 *attr)
 {
-	struct cirrus_amp_efi_data *efi_data;
+	struct cirrus_amp_efi_data *efi_data __free(kfree) = NULL;
 	unsigned long data_size = 0;
-	u8 *data;
 	efi_status_t status;
 	int i, ret;
 
@@ -339,19 +339,18 @@ static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev,
 	}
 
 	/* Get variable contents into buffer */
-	data = kmalloc(data_size, GFP_KERNEL);
-	if (!data)
+	efi_data = kmalloc(data_size, GFP_KERNEL);
+	if (!efi_data)
 		return ERR_PTR(-ENOMEM);
 
 	status = cs_amp_get_efi_variable(cs_amp_lib_cal_efivars[i].name,
 					 cs_amp_lib_cal_efivars[i].guid,
-					 attr, &data_size, data);
+					 attr, &data_size, efi_data);
 	if (status != EFI_SUCCESS) {
 		ret = -EINVAL;
 		goto err;
 	}
 
-	efi_data = (struct cirrus_amp_efi_data *)data;
 	dev_dbg(dev, "Calibration: Size=%d, Amp Count=%d\n", efi_data->size, efi_data->count);
 
 	if ((efi_data->count > 128) ||
@@ -365,10 +364,9 @@ static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev,
 	if (efi_data->size == 0)
 		efi_data->size = data_size;
 
-	return efi_data;
+	return_ptr(efi_data);
 
 err:
-	kfree(data);
 	dev_err(dev, "Failed to read calibration data from EFI: %d\n", ret);
 
 	return ERR_PTR(ret);
@@ -391,9 +389,9 @@ static int cs_amp_set_cal_efi_buffer(struct device *dev,
 static int _cs_amp_get_efi_calibration_data(struct device *dev, u64 target_uid, int amp_index,
 					    struct cirrus_amp_cal_data *out_data)
 {
-	struct cirrus_amp_efi_data *efi_data;
+	struct cirrus_amp_efi_data *efi_data __free(kfree) = NULL;
 	struct cirrus_amp_cal_data *cal = NULL;
-	int i, ret;
+	int i;
 
 	efi_data = cs_amp_get_cal_efi_buffer(dev, NULL, NULL, NULL);
 	if (IS_ERR(efi_data))
@@ -434,17 +432,14 @@ static int _cs_amp_get_efi_calibration_data(struct device *dev, u64 target_uid,
 			dev_warn(dev, "Calibration entry %d does not match silicon ID", amp_index);
 	}
 
-	if (cal) {
-		memcpy(out_data, cal, sizeof(*out_data));
-		ret = 0;
-	} else {
+	if (!cal) {
 		dev_warn(dev, "No calibration for silicon ID %#llx\n", target_uid);
-		ret = -ENOENT;
+		return -ENOENT;
 	}
 
-	kfree(efi_data);
+	memcpy(out_data, cal, sizeof(*out_data));
 
-	return ret;
+	return 0;
 }
 
 static int _cs_amp_set_efi_calibration_data(struct device *dev, int amp_index, int num_amps,
-- 
2.47.3

