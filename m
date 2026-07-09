Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2785937E2ED;
	Thu,  9 Jul 2026 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783613550; cv=fail; b=Nmeh/aaNb5TqBk7BEWwTXnpCALHgmBn90hkuzIvvmyWlaQ31gHQgdB5/3M/CT+w8ZTUnMqXVJrUn5kKAqlpwfofwM5TXQdCDmYuP8y9PRp6NN8nCvUenPCQb65HO3PKuWF3Q+YzT9xvy0uU6kBMO6utu4KD44WhbL12AiRUd/8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783613550; c=relaxed/simple;
	bh=KxITrxDS5uTTzii29pHS6cNeRfP6BAgq4JzdIHkjtQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PRTwGTBg/4U5OD8intSIIx/aP+oAtIjTzKV2hNIYFBDC/8CI5BSOjdBo/47q6WYsj/isykA4vRRIh4GKDSbpqcXbP9fcWEk6NVOgR4YcsCWTGQuBDCTFvqZ33MIOdHkI2mw5HwwnA7OgyAAqE/sTjwHPpmy6fSe1qG62gFedKK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FZgWes8K; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=h2cvix8Z; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FZgWes8K";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="h2cvix8Z"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Edma24010533;
	Thu, 9 Jul 2026 11:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Lu2k7DAdRFtz24jq
	Xz3GKWmatgDZE6qwzlwAio5eOZs=; b=FZgWes8K/sukkLlAbmFXepdDjtyBuTqi
	D9ErfyCqJb2ap7+C6JGpvZIboKXvsIQMrz4vy4sTdh5Zbow9Sl5BrykYXsKF5DN3
	hXWk6n/BmFYyU0nYq2j+YpEPP4jFaED0rqG6PHkhpjEh5SZOkc2A4OqNXWe4Xz92
	vTtGrDuyFUW2yKux7/06Ucg/4kcP8isyTzrJId6pDmK+D3JXmNcgettPa/8Mn/xz
	5qgs40fAKv1/X86OMUYHvooi2gI34Zt1qqmS0eTn0eutQgT6SqO4/sOK9OMIPlOc
	WqermU/2lTxuB1fyHn7MwvGxZbcKc2okeguzgOmj+KR8Wf7CmFpjwQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020086.outbound.protection.outlook.com [52.101.46.86])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxrh25-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 11:12:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgbyMbg9dQWCGbzfFI/sKlOySzQi4hSQAHwifF96nO+s43OITBw7TYp0vcSp35xgIVx3cpIxHgOXszE0tPOnZSwof73VrFRmUbK18tiyelAeoOIFKYEp6VlOM5Ej1i31Fp4cnowVRtmLkR+gfkqZ0cBU72lJHckuW8WNbW5VhfMESnOXrQ8wrsRajJKTP2+FeWDJXIu9bNCkETChXFe7FxH9K0jlSTCD3BSRpOI1WqB4qcogVNG44pzTQtIUk1V+Dr5SGumJiXIVKrrvPbv5wPB+3AQ/Tt+pPPCWATKpV50woUF2TUYctN1Bd7MFbTlVjoXgZCGaXSfleLwv0TX3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lu2k7DAdRFtz24jqXz3GKWmatgDZE6qwzlwAio5eOZs=;
 b=CPX1xH7WPUnftKhkU++/Z9PVPyU7xsJRc1p4VSqFXVnUlsgglRt6qEuCraCRh9py6lqfG5U8ojOne7SpA68+cqilI/E5aNmo+5FMaiHLR/+eXq/FNp23zgwKEGFxi52PXWE2fis13yT+GDyhiOi4KXbOy8GWNi0mppfequ6sT3Aji6FCDsRG6YrhnffmH/5x7hCaIl49Jk7wooxoQtktw7zPl8ZNLIGRtlhb4TRaGP4BIOIGjlggaV7zEjLijh8DYQ4Dhyw2qKHqYVU1kC5pdg2+E112RtOfKZ/PycnCYHORiU40D52bZv85/OlPZW1czBTL+O9Sg5Nt4DkH7QT+Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu2k7DAdRFtz24jqXz3GKWmatgDZE6qwzlwAio5eOZs=;
 b=h2cvix8ZLCBv8Urea7IBBShwmAN3H1k7Mm8RUOFEBbQnaURVDbTag7dz+Nvm8xq870VP1tLeiQ6dtKMH21A35dO5k5vEcBarmpeSwKbEutfdJaR81bp/Z1cFE/u6tEAVTxmhx11p4xonwy6M9aHf+ez2hdYFmzpgnmbeAF7rFu4=
Received: from SJ0PR13CA0110.namprd13.prod.outlook.com (2603:10b6:a03:2c5::25)
 by BLAPR19MB4484.namprd19.prod.outlook.com (2603:10b6:208:29c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 16:12:20 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::d) by SJ0PR13CA0110.outlook.office365.com
 (2603:10b6:a03:2c5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Thu, 9
 Jul 2026 16:12:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Thu, 9 Jul 2026 16:12:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9E1BC406541;
	Thu,  9 Jul 2026 16:12:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 870B4820244;
	Thu,  9 Jul 2026 16:12:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda: cs35l56: Fail if wmfw file is missing
Date: Thu,  9 Jul 2026 17:12:06 +0100
Message-ID: <20260709161211.686498-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|BLAPR19MB4484:EE_
X-MS-Office365-Filtering-Correlation-Id: 2984e314-b601-43b1-1b61-08deddd4da36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|23010399003|16102099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	LcPuvoFt8W8DJgwzNSdVRxVr6MKuMCAQVWTZ7Q6Z6tCwCFOp2cbLtq3YccqIlj1/WfnhCQ2MZw6Qx8hfOAxmVEH6kVVC6a7b09IWAYY7+35aaox0H8O2erzXxZC01IDWRs4C1pPR8XI3bjf4JFLAJJs8GJPaFWjLPjEPxT2c3sbzIuyQCfozXkcgyCMjcp2kwJKnQmDr6u0mFHa87sgG2Eudh6KWEGzxZbCshmtECuV8VRPNLQlkW+9BXJZ6yNya8VMq5GttdVm13MfYnaw6lvRZRtDHB0tY1AYE6ORaAbt9UOW/dW8JVrmt9K6tXnUiYrXVbPD/Kw71xiChA7Q7UPxqe6Qi+G9XMQUVBvv4cPOLPBjAMQgVgu6k0fV/RKjPyP05sCbUkWCJBmJvVZd8jpNB3OWzxzVx18k1XeQ9Z3hhP9VJ4uhEQKqcW1B0nJDSvolmIONR84vJC2+mDkUNZZLqM0NqHOrysy8aLeh7i/zguw+2gCn3m/guC7P3rWZZt+qXSKEkBrjUiiRxR1M2Oq41LxjtEnu+vYVUhv1BukB6IJ1C3hcmdr2x9f2h51B3OeNMeC1yzqKKcPJLFHexB1PhlnbtV3GtCnHkbpT6lrmlqz238/0pRWKw+YeNG9hNM9aF5KZSo+uwUSc1lt270icTvPnOQiaVljHaD99tkrTEfcHkvdX7GDwDl72o0YGibsXDVBXH/Ew26CTGqUwLcA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(23010399003)(16102099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sVGGvQbyJTJEn8Xj5TO9vtEl46Ed3SI/IiphwYUZrDKkTvv/+Dng7yFwrUI2yNIxSsG705pYUZa2jRvDfATD9e9yxEafhho6goEmNrowwEcgB8mC1X/2KYdr98AwRklnB7dPj7q9tiInEPrhyNut2n2FkY//CvYC/vTCdgjIotFlQJ/UGOCwbolICZT8t3P8gxicJGe2egr3OE/Ij0+bKYI2sYQ7DwWnoYLfLkA+6Vf2EEE/IVNnwLlRZ+0hnoi0ZOsEukIGwgRPYM5jntV+L3KZvTJg+lVoCBuniCK7mV0nkyDU+G8BPhn7H332wDNbPJjP5ORVI2ptuMOs2BoywxTKRxmnwX4f6TO1W64EP2VtyRe1sg/uz+6a6gH0lKMmsp57J6CmoZoMrdmiA1wfP/QFQVafGrZgfBzudb2VS3U8Fiawgw1o1MMYrCUWqj8h
X-Exchange-RoutingPolicyChecked:
	mRA12ZCQwwCEQrKekvEqiddc/vaNUqeDV2Q2WVw2PyeRZAOK1xhh7MZd2UIEXa/qYlLpUJK4HGcksLRDvZU+gWe0PMyB9Qb7U1+MmVeCT2QjQkEvB8jZWk8sF5SB2B3a6W/vxJ8fZkVGTdUaq2mhdMjblHpQBYIFRxQCJYXynyUWwatJur1ZUdwnRUotganLkvw3xMgKmsRZgktER2V5WUOTHhPhdg1ZMfRioApTNio83uQk+OB+b2HNvVSenvmrxJBorDkFXHD7YpSezW1lxKvOXDUDGc4+bGJju3Huq+T/3mybqwHSXdl2QU0tYpr736KNwAQmoSRvFpVRapG+Uw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 16:12:19.3674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2984e314-b601-43b1-1b61-08deddd4da36
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4484
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4fc86a cx=c_pps
 a=FJjcbeYznbroKK2DnCisOA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=nDuZqVMwRTUZC6J5UkwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE1OCBTYWx0ZWRfX8zoFgUtCGGgy
 g3ij4ws7vjtRMCZcmBWwZwQlwbazO/ac6hwb1b2UuOR8NCNIEQPSJunHnwqtwRgQYsgekljKxl2
 WzGBnpS7LI2XtzszxFASlwqBrMg7WWo=
X-Proofpoint-GUID: GEX2VtWPaueGWRdijuThAxfUhS4C6xi4
X-Proofpoint-ORIG-GUID: GEX2VtWPaueGWRdijuThAxfUhS4C6xi4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE1OCBTYWx0ZWRfX/4Es3NoWno9J
 iX4SocbDy5iYOMnWxnNSd6LqzF/EGCKZ3tf9qCnKVl95Y88bo70C0sf+UqHgE3SSaTBY5WxLs/d
 KczN1BCwLKnYs5LHaarWrP7flj/vG6FfPibjO/aC3RIFOFfbuh+5QXmON+s9cmdcCtITH+KhzyP
 liOJFaPu+RhCfENaryyUFRnNB54tXtdTmzVCKEQMSjuLmbuF88H3xFYDd55DsUeldG88Cv4/Tyc
 kOyilclYX9HMgdfkN11Wp9mks5BiNmE5S81XrkuylXBIdvyE8H7QdO46V48UDDfZPNh2++qpPdl
 D4Cnu15PAj/uiGs7Q62JUZiTHkSro2XXGYDn2EJLgZDD9SI5bEu5MYofQYAT6udOLVuTOjaPUBE
 Lt2lX1x5ledO+RFI9pKTBuO77xmP889xldHciffxtVEHis62BkcMAX6aCG2YpoS1vBOh9cYg0HS
 zRx6aEg5UCTZYRYScJQ==
X-Proofpoint-Spam-Reason: safe

Fail cs35l56_hda_fw_load() and log an error if it didn't find a wmfw file
and the BIOS didn't patch the firmware already. Also remove a section of
code from cs35l56_hda_request_firmware_files() that attempted to find a
.bin if a .wmfw was not found.

The CS35L56 ROM can only provide default audio in SoundWire mode. A wmfw
is needed to enable I2S audio. Also none of the customer-specific .bin
files are compatible with the ROM firmware. So a .wmfw file is always
required.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 30 +++++++---------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index a0ea08eb96a93..78c2cf387a001 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -512,20 +512,6 @@ static void cs35l56_hda_request_firmware_files(struct cs35l56_hda *cs35l56,
 								  NULL, "bin");
 			return;
 		}
-
-		/*
-		 * Check for system-specific bin files without wmfw before
-		 * falling back to generic firmware
-		 */
-		if (amp_name)
-			cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
-							  base_name, system_name, amp_name, "bin");
-		if (!*coeff_firmware)
-			cs35l56_hda_request_firmware_file(cs35l56, coeff_firmware, coeff_filename,
-							  base_name, system_name, NULL, "bin");
-
-		if (*coeff_firmware)
-			return;
 	}
 
 	ret = cs35l56_hda_request_firmware_file(cs35l56, wmfw_firmware, wmfw_filename,
@@ -616,13 +602,15 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 					   &wmfw_firmware, &wmfw_filename,
 					   &coeff_firmware, &coeff_filename);
 
-	/*
-	 * If the BIOS didn't patch the firmware a bin file is mandatory to
-	 * enable the ASP·
-	 */
-	if (!coeff_firmware && firmware_missing) {
-		dev_err(cs35l56->base.dev, ".bin file required but not found\n");
-		goto err_fw_release;
+	/* If the BIOS didn't patch the firmware a wmfw and bin file are mandatory */
+	if (firmware_missing) {
+		if (!wmfw_firmware) {
+			dev_err(cs35l56->base.dev, ".%s file required but not found\n", "wmfw");
+			goto err_fw_release;
+		} else if (!coeff_firmware) {
+			dev_err(cs35l56->base.dev, ".%s file required but not found\n", "bin");
+			goto err_fw_release;
+		}
 	}
 
 	mutex_lock(&cs35l56->base.irq_lock);
-- 
2.47.3

