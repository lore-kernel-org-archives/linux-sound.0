Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B9D395AC7;
	Tue, 30 Jun 2026 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782807120; cv=fail; b=alBUz7CeFZFaPCd8QwGpuA/8X3ietJkUJ6MpvOjk5FqKAxYe7tocaxYbL1g8Zt6TAecYgZloxlJFEsGf4Cb/afpfAr++hK5TpowyJT7wfViaBTzE/6uo/TCWcxsJH13jC9dVqFcWrf6uuLhvje7IDrsRAg1gCDZMGzjxuihe3ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782807120; c=relaxed/simple;
	bh=8YCleVW4uD4gWRvUHxd8OOdbk+mc6z3TIcD2pkgPJ0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oz4GdMJZTN7oSA2ajUJR5wK/9dCy6dRhwGNslnTXOzx3QyoRKKT9gXhPmI99GpDJrOLeXFkHPauXC1O5+mSmEpyOJiNJLB5EMhN90QC+VASlpLvXLcTifRk85bfsfbYKMc7QfgJNkVYUxozqI+i+Y43ZPE2QTXPlHtvG+blYKCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jme4HkAF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=S6z+OjKY; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jme4HkAF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="S6z+OjKY"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U4j3ZL2851849;
	Tue, 30 Jun 2026 03:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=SDp0k6Auh5/VMMAB
	SRSoE7WSNWZTZq4lNRQVRpebogI=; b=jme4HkAFP1/BEj6YXm/7nI0aPmtlOvgy
	1Mp8QozhqFQUksux+bBWpmucGxnGdKr5W+ZMpWbVLKT8mktCViZZbdJ21QT9f5tj
	HLoQ8cYiSdIzo4rRp9ZCRNtaUykDxZEegIVXKwXFDJKxJsnX2swgKc71nxnoGgx7
	rKDQSnGc/9yrDaKEd85LArh/fwtRlrE3SQEciHZCppxX6zWd3E1PphkWCnJo3aRE
	/RI/dRJpbNxOrJWHonjFg4ag27LvzKagHS3HwEQbFtV1kSqV+c/kKwECd5Jx+qdq
	yejvCFTStnWvW70HSp+M77YJdcuFU/eNil6NfFHnsNa3NCI1Mg+ARg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020138.outbound.protection.outlook.com [40.93.198.138])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f2bwvuvdt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 03:11:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2E1NMXm5Atan0d10PFPiekLGGIqmZzynapKQofQrq4Y/z/LTBpJqj/dGF3980Lb95abTcOacW/jVftaNpmGV9V+Tb9s3p2Qi7udZOkFkyq5DldYdV33VxPmzNXCbk1kZoDda9ZBiQ3rhF55DQjQXtp8Q7ig5e+lweWEixRx51YhoXoluVoUONUu6xlUw2XcShIMeFq0fFqCCKnHrBfUbgWjnQstm85mkGORbmhtkKzWH3SdSnacrsEbA+xJbx59yIIgj4lrTKcm4yh42yf8rsild9FNgIZhznIlv60ZCIdGM7vvXrL/v8TDm5rnUnsIZL7+v+1+cTs0QN+clWJXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDp0k6Auh5/VMMABSRSoE7WSNWZTZq4lNRQVRpebogI=;
 b=PILBEaQxPZObRvl4fn8mv+4HE03ibBclZAca3Qme9IcYOJ9zThXmbVJ2+fgW3Fsm01qIOwMfU80B0laUx5kKsEV9YJaN9/PjOVRYbI9osVRNAKFyvIF+3mLgV9yIAkoO4djDDPeloTq/t2O8ypPjpJB8mQxdX1aFmDO8eiMWTvR5i6FygCpg7mUXHq/CBJE0tOCFaiPw6oMbsqNVOUJ+/johqsres/z/SRBtqQePgu/5GHgH91+luljKnGfGAJEakPFgwWONRnwDIXEbwrBKGQoU+enJcHwPrrErr1vVQouZLwiFFxJCi7HU0cDD8WWF+YDE1VWxoM9gNQ3dHaHUvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDp0k6Auh5/VMMABSRSoE7WSNWZTZq4lNRQVRpebogI=;
 b=S6z+OjKYxGCd1kGICzTMfXdZsSrYYe9/t6oJBUTESsuuvTiBRJQk8C1Jfcc8f/ezvsQsEbVO6pNXI8GakHE/SP/MBzb9iXbqyqBjqlw0ogLNcdJXbv7esuyF44y0wdkcueLY8WqSACz4oSL5C0unFUZcpbk0OrQDTw7Mxpg1nTw=
Received: from BLAPR05CA0032.namprd05.prod.outlook.com (2603:10b6:208:335::13)
 by CH9PR19MB9202.namprd19.prod.outlook.com (2603:10b6:610:2df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:11:37 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::3c) by BLAPR05CA0032.outlook.office365.com
 (2603:10b6:208:335::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 08:11:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Tue, 30 Jun 2026 08:11:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9E5E4406541;
	Tue, 30 Jun 2026 08:11:35 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 92282820244;
	Tue, 30 Jun 2026 08:11:35 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: dmi-quirks: Disable ghost Realtek on Asus Expertbook
Date: Tue, 30 Jun 2026 09:11:32 +0100
Message-ID: <20260630081132.3294488-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|CH9PR19MB9202:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: afbf0d20-4416-4159-24d6-08ded67f350b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|61400799027|376014|16102099003|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	T7+MfA1Mdu6/q/cVo1GGsMVlDc5lOStnhSZS2U+RNbPPVkmuqgMQnYRxTY3kgVEFGAB9/X7+fJyfE83GpgeqWi9wfJvy3RqxQl5fI2qyQiBMmd978HV8HN1c681ldc4SrY/k10dcs0aEPNOy6gfR4a3CALq731VP5S3JYni3a/0p1S2pPgGq0l0ypMcITlRod8cyJ1YmkILKX+R28WCmvvdTCEukh3AoW9lBRxEOfub0C1ROIAloPYNOZiN1IkPujFo27tx1UnSRa0hW+TmFNH2uqR/cviVfPr1PTRrSoUkXMvKrOMv/56Yx1pyHmyZLzQpZu6noUFpZ2Qb5GLs/zDBGXLJkGHNWzDMupyi0y0Wa9GsTyoOCfDR0ZwmuamGFah0TJCAWDleLNliyswWNhRwpOl4LlFoDwG/rBmhqN53IhsXB2EOPTSR2ZiTOdfc4meGVDk57BjEUuR7ztUzb7cpPHfDy11cETsPR5eB1ZFfCEtyshfYMRfpC2yR6p72G0sLREAcCeUen0JbzYBeazoYCdQaGDSlTgErv1rVpuMaIl/7eu/tKTLMSZiMHbVmrDvL7zMv73xfFVvfM9Cj3Nd3iQDduiYsJOufhwUGv/W2kPjRiGoN0U6T/cU6CUwm01llFueMCQ7eU2bhif7tvPdoxBVheH+HnZ9FlHcMnD9USN6LJOfdyk0o6LaA+Q9ikBCHs1L98aFcxsUJTZa3HGg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(61400799027)(376014)(16102099003)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hq6JVoafyuQkaLrxJgXEP3SGSW6U8euX/2z+ucBOLpGwUHRkiv8K59dQZSsQ9zrZ+Lr55JQ6680uFDP/b3wA2Q3LvGNeewiUmufAVhe7otul2klux04DBs+bzGy0a2BwgMK1rCpKD/cp1qNsD6nC9G4+r7Cq38DoXDMUlK7Oe7FCStRmHMy32xTW8vrcUe5x0dTiDd9dzzj+BN9aWV0wW/0OAWkaXdOlzU1cSiAld6G3Af0ZfyzQxSmbh6xfh3Og52rTW6UzCHZS189uK0MtldZ5KsBoSQam0tRYuO5S3mXtjXsNfzwnB7UtuHEKMHMPE64YldHDNitg8S4yX+72up49twgdh1ZMuQZ4IHl3fJamyDpkFjovV3189wkcogL4r5MSbTXsVzSE9EvNQ7bWWTMWe45GZ6E3BvTJUfOt7UH3ANTm9ZogpDBKCyMFdkPp
X-Exchange-RoutingPolicyChecked:
	LfRxA3wsc/BZwzD/77Ei5S147KgBjEAqKZmT34W0Fxzmjh3OxykVnyvoNmQGLmtSOKMQhlxKWpS8eX66ODAb01zPSA+ciuzgz4s0djGEphpnB2arSbC+aRpXZ/FcBZjs3d0ZrXzUsAHUIH031VuDTohhJKdz+wA6cnlU86qRzbwtslU7Aow3gGyMZr91O+cW0Tr6TkzkAYP1+4wfMg9+LeMLG8bSN0zOjTNAVAQC7zDO87OqKCyrwWUoq5EpxHmXNq56qG76qwj71NbAAtGr+oRsiaUd+f9Z/t31INbBED6Fnzm7H/u8jN4jFfaZ0F6kO0immlfDCUSz8b4zrYzEBA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 08:11:37.0260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afbf0d20-4416-4159-24d6-08ded67f350b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9202
X-Proofpoint-ORIG-GUID: uofIrn-yfwIf4VJmg2p6eU876gftRxXR
X-Authority-Analysis: v=2.4 cv=NoHhtcdJ c=1 sm=1 tr=0 ts=6a437a3d cx=c_pps
 a=33nGjHHVSK1XMij75uKlEg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=w1d2syhTAAAA:8 a=zoplQOvtXAa43hM06VYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3MiBTYWx0ZWRfX/2LekhCBCMOs
 SL1vAYyF0OndqG8GpGLxIGl8RNumzp62PvvmcHS72l2KGCjYg/ERQAw25sWeiplpzYoOnuiOswI
 E4xfpuVU10sBhtCYiphoJ1JH+s0ZXPd445FJRGHcBCDCzyb73E35otdPnnMi9kJvOiqnowNZv3Y
 3N2RpQM7hq0C2IBUp1t0UcnPV+Ur9aJqIAhqjf2p1LNd56JzZKYy1DmHKZE2/JKSKd26JVCwG53
 BzD88yPu7w7TjS3avoHAsjUvgW/KjslSVoZyMrWWODGdxdiBXG7Mmbv7KZgwpm2YwYRzLVOlync
 goVRwPKHIxEklIazNMN0CVdLBT+FjtX6XGoZJvwu5yygcPsSDa6/AEbQJlpwFuSMv9zeQeT5FU1
 PN6yyf3vJ2NjNXsXtTC92hIg6028JJcdAz8YCE03VONEwUVqw++dTc6lmrSOYEnlvoiobqj/TOn
 KAlZZGv9vv5zRCyXSGA==
X-Proofpoint-GUID: uofIrn-yfwIf4VJmg2p6eU876gftRxXR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3MiBTYWx0ZWRfX6/i2GAhGsp9Y
 Oma/wUVDBX8Gs7Eq6Ky6AdlHfh6ALS/kfYPRtbkBVgihuhgX0K8uecIjczwAAho2Fa5RARdesit
 AUn0M0UDVvDZumDXhy+hjsW8Y+1vMg8=
X-Proofpoint-Spam-Reason: safe

The Asus Expertbook B9406CAA also has a Realtek device in the ACPI that
doesn't exist in the physical hardware. This confuses the machine driver
into attempting to create DAI links for the device. Add a quirk to
remove this device.

Closes: https://github.com/thesofproject/linux/issues/5828
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Seems the last quirk turned out to be unnecessary, so won't be resending
that. However, to make sure we didn't get bored this one has turned up
instead :-)

Thanks,
Charles

 drivers/soundwire/dmi-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 32a46a2d90f7c..2a98fc8c104d6 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -178,6 +178,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		.driver_data = (void *)hp_omen_16,
 	},
 	/* PTL devices */
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
+			DMI_MATCH(DMI_BOARD_NAME, "B9406CAA"),
+		},
+		.driver_data = (void *)ghost_realtek,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
-- 
2.47.3

