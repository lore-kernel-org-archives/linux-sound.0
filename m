Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB013C8194;
	Thu, 21 May 2026 11:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364471; cv=fail; b=i0vcRL73pPL0E5s8XnZBdxeaJeQ9hL+xEgwO0UOSos8Fof+t5QLRYCj4WSz3MkAXSHansEv4s4eRbO0eY/efT6DGCQOPa6GA+ubIcdikf9tY3aNIr2Dr7Hvy4PcYVTy6WLoRvB1+LnS3d+JbBZTnUzH/l/cxElnI1CHe0Xe/49I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364471; c=relaxed/simple;
	bh=Q43h4MkwlHCRfyWOco8Ax4vmRTZgzsS2Mcsr0tDi2nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kv3c1MNy0BhQ9BCIHOOeoS4U8ht7w1sRmvr6agCqRMd5OtgWknxd07kH85jYemeRKTAFErBbo/HielcuDZHUImq0ri0XRAF65bABtuqhzXpzjLovNeytfFGIs7tbWs3XSOc1dr9iPhPmWjaPiL/BI1fHVJS85OxIPBKbr6qGPr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=L/fHh0d3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Jgelgldt; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="L/fHh0d3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Jgelgldt"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5BlO12850731;
	Thu, 21 May 2026 06:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9TDi0ksFes3iCNBpQ/MOyFKmo24NOJ6A9sL3J/2Sq1s=; b=
	L/fHh0d3zPPDBZJJDvXEo2U22/WW8Lyw7lcsXBstNKHr7NaMFbZdglLjulgorwfP
	Gb2Zrwz46vR9LZtFw6aVAwz0TAlCEtw0KUBpc+Zwaxz1q8wo30hayg5yv/h63c/2
	/5wTlKiiE08ewfDE6IUABcKW2NMwXQlsRxtbRq+edUNVPAYUnUi1Wh0mGPMC2VL3
	MD7zBDe2SO7PEJVwMZnqx4MnCa7lIe4118DT2LdOVoOy4MtOPlUWrt6d9b1q8Xa5
	oG/Ilkes/fyBIdxhCcOh+Po5Q8P5KBE3l1EQuIn3BnOkDjRayQO7Y5kzSMbNgt30
	6Iz8bKijRRyVl518/CZFww==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020135.outbound.protection.outlook.com [52.101.56.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e93g1jaht-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 06:54:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMczYhb4W7lKaLBz6ZI4SBoz8pUVvlrf5CTTlo90ohBTXkv7hBkfcWXkhq6LpLx/1591rVn9TR9VW8GOKQiqRCQOSklu2oi/zqBK6og50yuZqeiQlcw2ZiPYNvAy0TtU290Y3d57z5koJLopcUKxA6FW/1Bt8Lwh5JUrkEZ3zhn/qaTPixgyLC0A2lROCD37GMpyEM7vEGs5nuxOt2siTVDQ/1pApA17h4DG9lRx8Id5JE3ElysRwf3YsXwwutbzLQrBYrxQ29g6eFeLtyiX2zI7kdeWUvo5mL3Vk/h+QeulIn4RTmwexXjdziwdEnswyPtaiR+y0Qii81Di9IErwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TDi0ksFes3iCNBpQ/MOyFKmo24NOJ6A9sL3J/2Sq1s=;
 b=Cnst2m0n82hqZbVy6pxMxYTg8u/YuVtJJeDZMlHrc6lzE3fCP9NXPkByaBl2ixD94nlio9AQN9hGz5chv2w139coBLIGOE1opghJFMScriK8/cc32zfi5/eTrtcl3ZprSQHAGZCuZuRcRgnRhgoQdEGnfEAlchDXi8jRNAK8/YzVx1rlR2dOA40bCGdtAUtuHYhdH3AA4hCFl2tF0sU4ObWPuU2vANkZFXHkDCAglwOZXixvL4mTxY9Q74LL7BfqBmIRfxt1h4UahsYjxdOw7CAMpbMOLVToAeDBovuKTdO3zUQO/Ilza/61hdc3WoO+gYJpu0CiCN15kXgK+6ft1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TDi0ksFes3iCNBpQ/MOyFKmo24NOJ6A9sL3J/2Sq1s=;
 b=JgelgldtMR9z++dvtziXA6GEWMdxlDc5vLDaKqbs0VAygtoIDr1EC3tA1bJudmOaR+eww5c9OK5fgQf2bzKircJKnKF85EhZ8mmpA4O9KgZy/7g3+PGAyglpHUdjjNS/Ciu4WBWxME6JKpmNpESC8OfhSBDTRQlRwti/mkKM3gs=
Received: from SA1P222CA0085.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::28)
 by SJ4PPF0573E29E2.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a06) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Thu, 21 May
 2026 11:54:23 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:35e:cafe::18) by SA1P222CA0085.outlook.office365.com
 (2603:10b6:806:35e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 11:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 11:54:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 838E540654A;
	Thu, 21 May 2026 11:54:20 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 720DA82026C;
	Thu, 21 May 2026 11:54:20 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 2/3] ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
Date: Thu, 21 May 2026 12:54:19 +0100
Message-ID: <20260521115420.978616-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521115420.978616-1-rf@opensource.cirrus.com>
References: <20260521115420.978616-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|SJ4PPF0573E29E2:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b3085683-72d8-4ebc-4acd-08deb72fb2bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|16102099003|56012099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8wnj3NFjduts7qHZIiYR0DL95ALhANcgosUbCHMzddrc/AQ2/TlvG7ZAYNZ1QsP8JQR6tkyMMeAUZgIQEGQyvOJDR5o5mZIKx0cfWDDzmHq63XqduMaaq319i83uCmlt3y9fuRKGzhGnnBC3TgWAvobPuIeaprr1ynuE9CROj9vcF1H/hX/ZKgTxIT2/ub1qRmet5ObeWF/sBXvKN6InxVTqdDMUZFIUTQFmZKQjzBWK9gUrkH1oRwTIi8qyUOchF1RpEMXY2DQJVpuGofvTSoBaxVpKsTr/ZsPazod5cuHkTIozvdJVmsMcPqPCtUcSeR+rlV3ZYkzqUbt8ekv52XoTwUZlAPYyUqn7Myr6kOASHw7ujmHgRNq8SUhVEZH/f3SMwC/RKHK0BrYZn+S37GrFSGgO8/Q+fXbqt+rBkJ1sfnPDq8qVllWoB7oAeiKy+iHoEy77ZztmXbARMDV6OEiISIzE/6CD4FS35mFPGiyX1TDRFo/HOwN0KWGz4m5W7dnarWDu9ksmWGUcQbL5/Bj9OkOayxHWaCRjSgECi9Tt+WIDYtzotCEWrbCp6Yot6DDitKU72O+QxOXxcGgVaOp3q1rslkjenMuw+YyzsZPjW7Z1cBTewnlVrhBwnzDAUpRLzlQ4ShrbZMNvAjWCEfNn4oIA4A6uUV+K9+y5TydXWztnmcnP1YNte20njpnRk0YPcerKx6/gO9ol/SyPncmRMG5bEHHOSuyDAA51fuc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(16102099003)(56012099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	014O13Ryel+1mayY5+IREoBto2t7gA1kEo67lSaKoXDKwmxnHV90Gt1mNyGsm39fisMbu3rc0FOF5dfLgQef7bHRsE0jlGvhWhPjogS8F4/x+NLjHbEx9TK7CS+sc45/wMbI+XGukczXEFi/ziGB6db3STOpfdVH1dFeAQnku1t+orLhZf3uAaXLUYCw+EeyzVqYhG77C+I4l4O9pzuD+dy4s5k0cadxDdZKzOfNuaOyG8YSucOPuQpTXUJ8dOrrkKh598n5HxiDETOGIAAhl0J7hueXJcigjjw98R9Ttjcg3p6A6tTslIz8A7VC/4i4dpzQecOT7sy2vd5VaO2C+ceyeV9myIlIaNlTL7MUkPH9qatG1+Hafkb6K77Mzv+apQ7Nbs8io07m3jVNgPWROk9g0O+pt9KHBpKbaxyTf0AK19SC1YJ9x+0Zphchk1As
X-Exchange-RoutingPolicyChecked:
	dL37Jf7OdJcZ8EpeZfuS70cNDjxWC/Vr7sUbt9rCrRHOFwpXbatTUYJOygOnNw3LABjc0d5voo05oqh8Kig3VKw6GogAT0BJSHApgD9RzSw8/xESIuq7OMv9KmgANJjTykZ+Mkl72Z/2hyqPolNVMo8MeZERYLmLQoCUMBIWSh8kjqxZwdFDcafyTSz5JTB2lG4BXlOOF7FzCEefIvXBwzeplLGLLNqi/rjbREma1qkgflisBGl2nwP1ENG+69XHUBjXYSxRdIsSSBUiVFukJDSiiZuw38SRDOU55fjo42GOG6B7S+y2BVngxnXpCdXr4gy99Mfm37vywujmgX/n4A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 11:54:22.0410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3085683-72d8-4ebc-4acd-08deb72fb2bb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF0573E29E2
X-Proofpoint-ORIG-GUID: 7LWnvyqNwdxYqTnSwAJpS0W64AbUSKCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExOSBTYWx0ZWRfX7PSPrbTEDcYu
 +ZMDGXYWL+hfLZuhR9O6fPPcY38Pt+ADZMJ6SBqse4K6ujCZxyFFVyKZVVI4IgeE1QWtpbN5PmT
 kmGj42nQTUDjMKNB/DJcPAMQIVxml4o8uALI1WDBF9qmcXhICP6wDO2XFX+MrvMaFEECXFgzsME
 lB03pYCmdkrkUdJOsvmJ+tB1dZs25PdEMoFVv1+2yUIKxDchBM7iH5yIoWHsfYFU/NtOaKaH9BV
 mHrg8IYNHFo8EuyAVdICOxkaHj9lP9iphZoGAIfDHOPtq1+KYQioM3fBSwQQ+TslNALmUh5KGX3
 HvMBLdGWdh1vM3z59Tywcn76NSGeZAqdixwKvcMDsz9ZDe3L19pUmDMooPWlM93v4nB4jcpU8Qr
 f6cRZQgpegTxxHF9sxgKfX9LR2OBlt/beB2luef/zzB+VVB4wbT59VyrseWp327bt6XYN3sK6+N
 wjplvVdio/IAuCAdgrg==
X-Authority-Analysis: v=2.4 cv=Wrcb99fv c=1 sm=1 tr=0 ts=6a0ef273 cx=c_pps
 a=7RdxWpphQ0FXUQ9+5PcytA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=3ATER5miuquMFiRRYokA:9
X-Proofpoint-GUID: 7LWnvyqNwdxYqTnSwAJpS0W64AbUSKCm
X-Proofpoint-Spam-Reason: safe

Set the reg_base member of regmap_config for SoundWire so that
the regmap core will apply the 0x8000 offset to addresses, instead
of doing it within our low-level regmap read/write callbacks.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes in V4
No changes in V3
No changes in V2

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

