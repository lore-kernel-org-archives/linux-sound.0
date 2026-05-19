Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD19335202B;
	Tue, 19 May 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190633; cv=fail; b=gTeV6GejyCXiRK588R/wQQQSJyQYmNNVISt9YyipqsM2KadYDaLaruajsKNPWq3Ido6x0tfpRQ8C0j6R/ZyCp8890fVdEi1UoRIeEVqWuPYXFM+8qGhgfzFD0iQSfaVVV8R3/Dhqsgu0Vog7Vj0+IeAr5yY4TbM3SH+lYbTsReI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190633; c=relaxed/simple;
	bh=33yagn7JdOX7stWmIFWyWFbISSIDRVgAhltm24qC8p8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sYUTvCZC0LvNIHx+D0PzVp8+3shqRQvOoQxTpd0CjXGSfRgQTxkk5vpQYBKCLC8oN4dgO3X/xsfnFIH3zy+kqsiVWbkvk4/ceSoRYO5OXOd0kC+Av6EVG/KRPOp/ufVhf3tvroYjKSnVRXj83hv4nmhVCg6mMC6iZhLFhalXDD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XjAYrQQ3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mCkfjSBZ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XjAYrQQ3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mCkfjSBZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4vHDM1263394;
	Tue, 19 May 2026 06:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XFWCZdY/7XbdLD3tWGwvdsK3m/FT/M4xoVupK70wpww=; b=
	XjAYrQQ3dOsvVxcrLtv/Sk/9t+ejqEUqLz16uxV53N5PBBVUd/vEv3+zz+2yHISQ
	JjDxR17udHfNS0rKIRY/K6TaBq5rjungiRnLm9lbKyoXxKpiARlFHH3ypb3SDjpn
	6xCpLN/twDvM3mI3aGisd7oSn+KA9+GzasY9por7mMzFvA9aeHWnw6lLH1578fwt
	3Z3fSUe8glppdTygC9fNWeBeUS8UxW1E46nx9ghG4HKRcH/hlCZ3gsJUIpQ3BBhw
	HwskrJDFS7gsiqaFPZq63PailnLhowR1mFCe8KvXjFJzNbR14+V7pWh3HgEQwAAY
	Bf62h3UOGxGyOF0NOVhO7w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022073.outbound.protection.outlook.com [52.101.48.73])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e6n0hbftn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:37:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJrt93tSTG9ArMnNQ+z9uWBvJDLSAUeNlE3hZ2T4V4QTgBahVseUMK6a6TpC2L9WnbSnzLrZDmPcA4JgK1Ixsr1FqYorL9xqPKB6IfzQa0hPmaZA1eStX9dOcP6HXYCjooCAdh6AcaQLgUHCiiAfWvKG+8ty/1fhO7uBOH/4ZCiGzRoNn7YpNMbtteOkTPedvlvqYUOZLfPsqLY/KQY89jq9F2lgQ4du9plJMTwkKLJtTUEIZ1+akKWefsBuSe3rh5xlMNLNwWKcbjq9qBzDHQF+Eh/RaN7OJ4pFxcjmWKWBg07WRhu+60aGy3rpXpgkFJze8XIQnDrnDsrid35wIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFWCZdY/7XbdLD3tWGwvdsK3m/FT/M4xoVupK70wpww=;
 b=lcakkFKti21mMM3g0YbW73jVIdvjYvQJOqTLDqEbs5iRXwCvOMaoRTYP7/olXJ0EqafsWbgKPsR/oNrT1HEmEWcSd7STUbEBFeuIdLWHu0wmFNJzuY+RSeuqiVFEWU/qZv2G8k7WZSrX2veDr3l1OCQ0U8xvYoNPWPgHLUs64j5gY81K2IuweZULSje6rfqc9RF4BOe6WXEx3L3vPn7VEsw88+/wFReUAASDQBhaJUOLwyg3IdBEVqX9H43c4jZ9cioy4Jlnnfw80gYnNisl4XebDCFvTqPhrjyAAUoXpoHIPHQFCLjqOYKYX36MPjptNvbVrI51iwc7jGC9ldFFwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFWCZdY/7XbdLD3tWGwvdsK3m/FT/M4xoVupK70wpww=;
 b=mCkfjSBZAJnamfoWxrRJKCg/gQoGIQ4W3FRlg4PpgdGmgKkHVsbQoGOob4BlEeww5xJUpKG+jUd9cJHR3vKP37MdnFF/2Vi+CyCMcrwMQWHvCT3XVFr4ZObiZieiqtUhgm01t7dSmEXbgEUo9KDNmdm2awJ6JtQe4ajnz3bhfJ8=
Received: from BLAPR03CA0052.namprd03.prod.outlook.com (2603:10b6:208:32d::27)
 by PH8PR19MB6811.namprd19.prod.outlook.com (2603:10b6:510:1be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 11:37:05 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::f4) by BLAPR03CA0052.outlook.office365.com
 (2603:10b6:208:32d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.21 via Frontend Transport; Tue, 19
 May 2026 11:37:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Tue, 19 May 2026 11:37:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8F9B7406544;
	Tue, 19 May 2026 11:37:03 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7C07082025A;
	Tue, 19 May 2026 11:37:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/2] ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
Date: Tue, 19 May 2026 12:37:02 +0100
Message-ID: <20260519113703.393210-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519113703.393210-1-rf@opensource.cirrus.com>
References: <20260519113703.393210-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|PH8PR19MB6811:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7c352924-5fcd-4645-9349-08deb59af368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|22082099003|56012099003|16102099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	VC60xI6xQpqeJv7ZYtNgDVju38wJ/EcZEhgnK2k+IygpfsDPQfOm4HiMFvOc6Zv2ogTn+S7tzF8Q+IRVCHMsUFZCJZrGELEgWPKA3ZqZJLLD+vWKYdIFQKkWlgmmq7eROMsE66PwER6tRVueaUTLdi9WMmVmP/dMVKXcUAaOqsspbBZvy83raXny2jv8lyjn00Uy9YPtMRfqxCMUC3kb0sA7FisUkatP0Q+SdydGG74i83vnQfBYiTAbJhJYmfktwKB6uhsMzhXvF8eLGOrbPuW8pa9N7X/+BWGvB+Sqq4xUWMtqm3pr71BZpIQ6ZM4gxCMPFMNFQtyb42NATnKwLndYUHZU99ZkCeSe8RAJXj35QnwEqGAJSWH152kkZPIQxIXPcQifTzvUSSHtMc+bny0NpUPnmV5AfZor0+9kpKDf1AFXJQYatd8DXgxdKq+5IX0TQ+K0Ua/knq2e1ehh53toSS2Jd+ldSxeLYiZLdIYe5z3jUtDOQiJ87/4wMsNhdK7WUlUjWBqVYu0H0LoH5GCiZTNOzrDgoDhuYuA+wonrLOEP7Tj8kFZrTE+5XfSAHDAvigEwksosI2vO9E4lJD8nhczcrhS6PAjroxba5/cj3rFYlnE4WOOB0ze6M6xYLY2ZivFs63zZVnWgcasS/xh3LSDbzi7sXd5kevODRNQLC/HjDReS0tLnpXjHhuPmYzn+jZqLYevCfKL3ZyBK6q/mJ2wdK5ALmKVOCl/ka18=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(22082099003)(56012099003)(16102099003)(18002099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4sD0mPdR7qSaiOkcnDpY5CanTvdq6vZRBUL+vuSMk32JyXzXW3D3mCaPwaXQFioxAX5Ld2AlV+gCCgDjZLgF0FsMcpfblOIPm//dqyM14TFDfx2DES0vhcIxzwBNAjjFJyDizMPBu8DxEOQVTX8yTv3FBHXaZkhSz2rcGS8bfoUXPz2T2K1WAPk/6JXbfz/kTBN/AuTNaBymot1XvAKLjSGBqsJU9FvSiCgyIXjHtswLbx1WAXZsa/oaCGBD0tcgsaJHu1wBqNdQQEIDkiZ0eJZD+lyH9UOtomRcmL370vNhUeJCeNOixluIjr/WG33p2puXMV2Jg2sNzO6Ba9l/OM6NUEENCNDD4xQ01yqEyUQBZH28jQE8JsaKX1eDfaTZVs36k+WzPg3oCjY0Pt2znuPKRCh+H6ovAe/cAIy0NCGPzqRrVQHFyldShmeUlSPm
X-Exchange-RoutingPolicyChecked:
	Nbosmt8yB6O6Z5CJOOswfC+RkRrPGD/NPkNkXrvovf47ax9XGVF8SssOz0kkqLDUW29EYMjUmWZqdKRSblLPo7n70EoeR6Hns6ZpTMiOrFNv+Mzoo4+qFJVaXi4vfyv4nQKVjI6FLvC4NDOroJGUS122XfNUuS18Br3FqXEnMcqhioXIqRLmBQTarP9Gg0D30JIf/k2zppfLD8GFU8DRQJGhpy3rCKf9DwtjluBh/sqogA0uPPhQlCUs9TwhO/6Q5D/dqUE9u7iX1E3ZkiekETxP2XO+1teRkki0mZ4HJ1i3UYf3NYtiZzl+j1QSJIb6MNES6o0LZrlGY3To2NGoCg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:37:04.4453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c352924-5fcd-4645-9349-08deb59af368
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6811
X-Proofpoint-ORIG-GUID: CvZx8NUB82c40L8_Gp-KDiAXmlYXPi5O
X-Authority-Analysis: v=2.4 cv=Cag4Irrl c=1 sm=1 tr=0 ts=6a0c4b64 cx=c_pps
 a=o5n9MpPAMAXLgzyrJXPTXg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=3ATER5miuquMFiRRYokA:9
X-Proofpoint-GUID: CvZx8NUB82c40L8_Gp-KDiAXmlYXPi5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExNSBTYWx0ZWRfX8Ky33GhC8WOQ
 XxNj2o37iOWLYXv8fCsAlCoUUjG3+ULmbcb27OBxRiA6hKNsNsqoNv/cv2dHhxIE7YE6X29kb/0
 DTb+AFw0/D/B5jmbI9VvxzqwvIouHjhribaus9Mvga04epb7L9BPBkEVJ+WPfPUoFwXYs2sbDbV
 g1wKU0/zWlJfrZz79RQUKrZ25+rBQ6a5L+TMRCXEX+Ev1lHSLalzqoceyJWMQXkRTMObmPNH3Zz
 WqUwxrR8+HVXNYf42scJqJ3AphR7GNNtIMgydy2TGKSHObwa3nKyc0MaCxjOYMcqT74jRvqoGfR
 LhLd2eASf1Liq6hg+Ezj10MFbq++Cb/CjRN03o3Y4SMZOVHM8sLcvXWmKn5E9Nl95WJGLxS092l
 VQvntEvOU+K+gsa6yQWiOSgpkus10uu2hEwx/sLqdGWfgazt3AzPsk4pOvTGixho1sj7PZoqvIx
 ZurksVUqOeibkl1KwRg==
X-Proofpoint-Spam-Reason: safe

Set the reg_base member of regmap_config for SoundWire so that
the regmap core will apply the 0x8000 offset to addresses, instead
of doing it within our low-level regmap read/write callbacks.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes since V1.

 sound/soc/codecs/cs35l56-sdw.c    | 7 +------
 sound/soc/codecs/cs35l56-shared.c | 2 ++
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index d5b9e5f71de2..d9dcca1e952f 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -59,8 +59,6 @@ static int cs35l56_sdw_slow_read(struct sdw_slave *peripheral, unsigned int reg,
 {
 	int ret, i;
 
-	reg += CS35L56_SDW_ADDR_OFFSET;
-
 	for (i = 0; i < val_size; i += sizeof(u32)) {
 		/* Poll for bus bridge idle */
 		ret = cs35l56_sdw_poll_mem_status(peripheral,
@@ -123,11 +121,9 @@ static int cs35l56_sdw_read(void *context, const void *reg_buf,
 
 	reg = le32_to_cpu(*(const __le32 *)reg_buf);
 
-	if (cs35l56_is_otp_register(reg))
+	if (cs35l56_is_otp_register(reg - CS35L56_SDW_ADDR_OFFSET))
 		return cs35l56_sdw_slow_read(peripheral, reg, buf8, val_size);
 
-	reg += CS35L56_SDW_ADDR_OFFSET;
-
 	if (val_size == 4)
 		return cs35l56_sdw_read_one(peripheral, reg, val_buf);
 
@@ -186,7 +182,6 @@ static int cs35l56_sdw_gather_write(void *context,
 	int ret;
 
 	reg = le32_to_cpu(*(const __le32 *)reg_buf);
-	reg += CS35L56_SDW_ADDR_OFFSET;
 
 	if (val_size == 4)
 		return cs35l56_sdw_write_one(peripheral, reg, src_be);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 795e2764d67e..8e3538e28fad 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -1880,6 +1880,7 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_spi, "SND_SOC_CS35L56_SHARED");
 
 const struct regmap_config cs35l56_regmap_sdw = {
 	.reg_bits = 32,
+	.reg_base = 0x8000,
 	.val_bits = 32,
 	.reg_stride = 4,
 	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
@@ -1915,6 +1916,7 @@ const struct regmap_config cs35l63_regmap_sdw = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
+	.reg_base = 0x8000,
 	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
 	.val_format_endian = REGMAP_ENDIAN_BIG,
 	.max_register = CS35L56_DSP1_PMEM_5114,
-- 
2.47.3

