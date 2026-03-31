Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8B13AA1A8;
	Tue, 31 Mar 2026 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963186; cv=fail; b=YPhsUmNl5Iyq2gAiVSm+E8gkF/CP2D7+iQ7QUq/OMVKIK6q5lMmk4t/Ng2m/UAbOr0hB1c/GNwI8llZ3PMNRs07KmZ3ExloVnbwI8PbSP89eT7xhEMrjPQ3mr5n4tAVuP93MOX5tZxGwl7moOw9JiNqSJRhmyq77Njk+Am3vTBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963186; c=relaxed/simple;
	bh=Sug6xTL6LOxI/GeKfP0u8FbtiTP2+XXVQKhQZX4MmIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BJS/WyaRrHgt/WjMcv1uDp1hDgYfqfW7GXQEhiCsMyv0QnI1cYuPuTTndEUgCxWw5+0lbI+zB0XIddz9qG/kr4izbbmkxglJYOt5tj83z/WGTYTOBHq81btx3EpH8QS53uPDSfy7zaBWzQRAxFzbff8ZFKgSJvv55XMEK5ZJ7tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ekpu3RJp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PHQiQ7lT; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ekpu3RJp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PHQiQ7lT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4aRY11605297;
	Tue, 31 Mar 2026 08:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=fDpAQrS1bMB5ry51
	bym6vOZCtOvSuBamP7r6Y75xQ38=; b=Ekpu3RJpkSPegPTTlu9NhQeT8SjRHUt5
	rnCWbePNTMECXTbCF+LoaWDLkpJsrL7uVIoQQfkuYoO4oshp3VV9KbETaion8FQD
	uGIUfY6uPyNy5MkGAbXys4BmbEwU6rXEqkhZxQ2S/E0n7wO/MseyF310CByfhnBp
	/BshDyGI/NN6rHoplUQBhQRC/URunlfEHcPax6VNBrn+++a1qthlPMW/Ruj7p3XM
	7e+f3d4C+WCr3KVEeqyJ486J3E2my4YSdVxCat0eRO18xRDPsZb6c+4NacxsWVaQ
	Q+lf07UmHj9GLqtzaFJh5xCRTmJrhDLMs2gbOwAh6lhfH7r0gr3CaQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020117.outbound.protection.outlook.com [52.101.201.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d6bdh38cy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 31 Mar 2026 08:19:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avG9mgdXlpVqJPmb3yKvDF1951lis1WECoERQrbOE2NkACoQnlUkQhrqEwpkYj8BNTZPspNzMZPgpxG0Ev8/E0eg+abXXQqyz9QdFOnIyheuogYxKjDfpxtWxlKHPOGopUnMbje6/EB7iSoYJxjEnJucVgFYS0IBJzOJ1Q42is0Hz+dpNw5B/gwZYSIEawWIifX+swlPbJ+RhIm7UBjtluzlVsuhTf4GFvggGD6VREsTxdUY4erhV7QWrHefJKVshTC5O8DNe/JqmE/1pWm5kpw9yuoIfSznitrVCh/YcrTrNtdngJnHM8jW+OeU/VB+O+Bf2b8cTp+ME3JD4wEMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDpAQrS1bMB5ry51bym6vOZCtOvSuBamP7r6Y75xQ38=;
 b=VoVA6heNKzXPV0YEEewbGsjfxIzh4IuO7ptoTvPl8pLWmUJGMEAMz1aSuGpEv8LLJWhWiYYPGehdimaVc0dTDGmbkE4IjbluFYK+eOGzbS2uwh9oU69r1xUb+cToJ6RvvlmoV8fT3sxjTw1rgy8RZYVn20GfaBEQl79lfhxKezF9inke90ZlJi1y0YXManQzomojuyG4wDKCpHIvOEFZRmB8yMR4X1ZjtEpcuLanq0CF+hMcBVOASEGcB3qlKQC87VedQq3ltA261WoStdcca65UfGUN/YdS+Sqa8rUf9V7yTDG0RSV4FLMj3NSNqVrDhDmerjvseCE/2MIrr8mj3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=amd.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDpAQrS1bMB5ry51bym6vOZCtOvSuBamP7r6Y75xQ38=;
 b=PHQiQ7lTNsd0LoorJ2xTU647oEP6U/cDfa9FLe8YzffLrrVwpO+iRMt1ipILqTnhEUR/uI9VPgsfv8MrGEZVNrXteuylsAh/7PQ85y7Q2dn1HgELvggEJmaGvtTySQQSgKedOJRnGneU/0uX2nw3PfllwufdLoiGn8H+Lu4KgoM=
Received: from BN1PR10CA0006.namprd10.prod.outlook.com (2603:10b6:408:e0::11)
 by SJ2PR19MB7413.namprd19.prod.outlook.com (2603:10b6:a03:4d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 13:19:34 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:408:e0:cafe::1b) by BN1PR10CA0006.outlook.office365.com
 (2603:10b6:408:e0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 13:19:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.0
 via Frontend Transport; Tue, 31 Mar 2026 13:19:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2C2D9406540;
	Tue, 31 Mar 2026 13:19:32 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ECB7F820247;
	Tue, 31 Mar 2026 13:19:31 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com,
        Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: amd: ps: Fix missing leading zeros in subsystem_device SSID log
Date: Tue, 31 Mar 2026 13:19:16 +0000
Message-ID: <20260331131916.145546-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|SJ2PR19MB7413:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fbaaff1f-1db2-4388-d228-08de8f282604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	syBpZK5X6Sha5UFBKGcGf4FErZ9jiFEufFyrKZc2hW2FluyWo3fefpcTvy+wz6W4CVwC3tiCqbUxtpfzVgIppf1PDDBFXNlHLL9uWwyua2NqzBq1FSSzE1zrDN8AmzrLxtOey4XhTYrvTCBefYqz/JP2bTVDF06LQ62b7RoT9Zy+ClhUeDnKlh7HRHZgoKXjp6TC1kH+DTvaQ7+p0ITj/TvVI8HbqeiKh8daUywZZtWH4f3BylgUXAdVYAUNfq3ZMdN7fBrOHTDhS8x91lszgPVA0wY1pT3ERwUWeAz1UFUYwdWnIAOAtK9pA4OG5E0sbVWgZ6XJfMlJ0lmObTnkIBERZHQYp/u6fVgFiHzlm3pklL/Ko1T3NQtNNfMiXw7CS1GIN/8V95gYo7tkxtN6cJxJDA0k5frTNVBLamyQSAUw/z3JNVGfmVuPMogb/iL2H6hH7EleVUjnmu2UtgfZf/X/36Yly85/VCK0uzQSZz9BQMRLTtzHAlV3L4IBv/lg6gUgdiP8hcfBbSVH6PmAjqmAp3Mu9JL9tH7De1wlJ4tfVWnOQ5ezyDclCqa7LKHUfwLhDiINgUPuIYsd/BY7GFBuisTlbDaFKwmIn6o4Cj04Rmr0rO3belIAu9FxLC3DDAE0GEYv1urGrpLD9VAfuGiaO+Sf4x/bqBG1w+Vx9/rH0W+1Mu0hN6p8OU5Ppsi0SApwXPPDeS/7TMTRnmedV6sQVcN0V7slsbnAxsA598nrK4PBxwZPfA1NUSEL+rnpkG6wO5k6135APi5jF1i+Sg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rjUylUgzx2ReF+piRnnHZnMabKj1USTZ865ghTsXGDtjhqYArsTBWiu08UNkIo4D5g2ckmOgCOCuz7ZLF7UKbfY1LYDn4NThD5D+UdBxth3Xp6BGVWWZQ/KFDVjTABLFdcwp8ctOEOZzAHx0t75MNrht423TfziKMDHYyWaML4cENtAXHdWm1ldU8IDEqjwE9W3oBgKOkaqBC5M+aY/Ny9vejZAvlhKcw8pl6566yKYzrJ+8OQHY2P34T/oTY2VH/EcvXLiN2ljlCoWVoEePHG+uhVuf6y8AXHvAezx5j5yZBKt8a2ee8jtB8Uxjmyx5N7WBiALWJD0vy4mtM8kqSBdzsB+Ti0o5mKZSzsxnR9hNCKlLeJHSXIKi6oHV2r9AJo3XawdnXjnvxT0CU4vo0zZnuh91d8RJzZ3iDjRsb8yVB+WC7Zt4mF1n3k4lfMbi
X-Exchange-RoutingPolicyChecked:
	a8KF7EIe3cKXN55ExlLvffZ7ktNW4eXlplz1FdvXkScby1rCwd9fbjfGje01T1nLI7nJFT5lQim5Kp62M/drJ2Qzba9XnbrR60VzoY9chmrmgWsz9/Yyn9jhNP4k9Q5rRvwPfmuaMb4cfW4lY8D+I7T0d1u9OL4hvBvqAyVGVjGuvKzOiEwW1oK/jPpo/PAreYPwkis4TspQ04+NNLRABqTidZWfG5juZn8AvK7TA0l/0BBjJj8zzYUsdNLndHG3ohpiGSgwcotEQz7o/LslFLE7yXIXDA4ILXTg4V4c0h8j8mq6S4kha6tr5qFlSEs0hdZtGVf7R1zVq5rQDv9bKA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 13:19:33.0378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbaaff1f-1db2-4388-d228-08de8f282604
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7413
X-Proofpoint-GUID: E3uG6zY1lJZwvX3q6U_C2A6h9HDoFBZe
X-Proofpoint-ORIG-GUID: E3uG6zY1lJZwvX3q6U_C2A6h9HDoFBZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEyOCBTYWx0ZWRfX+KV2r6JqiMlW
 ERZDhBuJETJsjDBSsl//ulSdQKFRykEmIFkE3fajTm7Roswmf5t7P315+pLnAs+IWFOJJhPg0jv
 mTydm6tloEkLze0LAT8MqOydAKUPDNBqinneKFroMiTyzw02colhDnyRIb9klkRslZ9JjN5VAjJ
 hGYJ/Y/isyDUBYv54xfk/shcM2pCvqeGzb+1FjnD1CjAqXZ0nNT+6khOJERM7wgExRPgvW6mnJP
 7KU6XOiy7T3yfCAVy5tBp7Nj2s43L1hwFgyxxF5kZ9wNSK6/0oM5tD39IuBdrPgdux4T/bVIIbq
 2FmRM6BSQF3dbXvOIW9z5gvIC5J9weQFnWgApfCjyON+kYP4OBksc332RIAn5Bh2Fa1iMoLE0yz
 f/D+0aQ7OnYahw9JpmuXO6Z80URhVgLEtGJTlJslip/wvO09BzMGM4h+gKx0vv24pS3J4G0VFiw
 FVwZbxSZ179Ki1Ij+cQ==
X-Authority-Analysis: v=2.4 cv=GK0F0+NK c=1 sm=1 tr=0 ts=69cbc9eb cx=c_pps
 a=DiLq/RQzOYCy0eeu/ZkwIA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=uuR_QIuzpPcrqb6vyKIA:9
X-Proofpoint-Spam-Reason: safe

Ensure that subsystem_device is printed with leading zeros when combined
with subsystem_vendor to form the SSID. Without this, devices with upper
bits unset may appear to have an incorrect SSID in the debug output.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
v2: Correct mising width for the zero padding

 sound/soc/amd/ps/pci-ps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 3a20cc10d61f5..9751cf0784a6d 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -339,7 +339,7 @@ static struct snd_soc_acpi_mach *acp63_sdw_machine_select(struct device *dev)
 			mach->mach_params.subsystem_device = acp_data->subsystem_device;
 			mach->mach_params.subsystem_id_set = true;
 
-			dev_dbg(dev, "SSID %x%x\n", mach->mach_params.subsystem_vendor,
+			dev_dbg(dev, "SSID %x%04x\n", mach->mach_params.subsystem_vendor,
 				mach->mach_params.subsystem_device);
 			return mach;
 		}
-- 
2.43.0

