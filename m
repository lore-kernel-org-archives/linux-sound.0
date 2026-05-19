Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB4C3ED3A4;
	Tue, 19 May 2026 13:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198896; cv=fail; b=Scz+zvTRyzAIH1H/1eMVJFHH3zOp1k9ZmiLYklXgO76YXX104E18o4PWGrU6j9Q5AOhYNFT9wKtBkaewAK0Nh+i6Ift27zq0fYAxuSJiKPtMXfaP/yTyTLVubrzHb+n/EAHZ1MWth1PHeN6oqVWaCR9/jb0v79GrpWUcIceEsfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198896; c=relaxed/simple;
	bh=DEv9ZCbfG473xzv0h9eQyMGeXfxsdv4rF4JHIhBhth4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sAG/GyEroTfNwZhEFnqPORFuQjy1QZdF/Rj71IXpWGvtpRBBM523A0ex80LOsJ4ti2iwDCSpRKKDZRe0DWQL56U7tL3S1vXjSkBviLSixN2N8Z5TOJGh+CCROtn3ADdiUeUN+VphkIB1l2/erPfst0EltPzncSCjXYiKYt7EpcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dk//2h51; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=D2O6h5ik; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dk//2h51";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="D2O6h5ik"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4vHNG1263394;
	Tue, 19 May 2026 08:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=whra669tiCHQ+poCDj6EAIbsU08bPNAKOf/ImM/atoY=; b=
	dk//2h51XYC5sJEVd9q3jLu0r/DF0FYnLgavz2pr7tRcKgkR+KA99dMXfQq8aiVR
	OMk+rGBzljuXuwcbtYVSZruUMCd5cjZzMV7gHMFvomFcDR93URZDteP0yZ5bPjh/
	yUJk6kfwn+cGAT/38V3pGA7RpPCzg5xUaE3GSsf3IESsdzSV3NYodVWGtNn5RG9t
	nN0syF0R9IPVC0FBg5ooJWWHAKtEKdfvrhFL6fzBO8QTkuwIK2jR8cmQPiwYYy0J
	4SZonVNt8ByAtD+YFEO/20xOlT0mO5Xz5cVTCRMUPzFOyQ6990JM8jRtF0yRGuCX
	zILW6ilCxRUS99dXpgfJRA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022114.outbound.protection.outlook.com [52.101.43.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e6n0hbpm7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 08:54:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9yS7sb9N2fpdLCr2eiFZ7UEru1Nke7BIlzgNhx+/vL9UUgaPv9VTga/fdN2x/ZVOb4cs8z4SHHu54q+gfp1Ev6t2PWSep10P61GPM8ccq2QW4ZTCoQltaVA6+eZAXIbZowOdlFoyuZjq1izO+/aPiO0J7DvIVl6xdht11JHaWwWauHdAZBAQv9LiNxb4XujjtpdBG5kWcBMt5ffB9X2QGj9XdQ5nZoApebCcq7+VkFgq729gVpFc9iy64d/4Pr9IFMuWYimkMavshn68c6s9FUBQ+jtnfAVfGlCx0ymR84Nx6RY/BVhrLFT5XkJiEIVH035GA3+/mEPomM4pY/Bsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whra669tiCHQ+poCDj6EAIbsU08bPNAKOf/ImM/atoY=;
 b=Lr0u4OOh/ZnokEpfxkdBd6DheMCFVNHSPWLqiqpbzTrPYroAYi6XV9QtPytb8CwDNmPC5eRiECRHT1AvznNXjOs3RK/kSC5FzLyJeTCZE+4jTqgQzxGzu8fkuu9VH+Il3cvUOsC/uC60d6yeps4y/KL8yMcEsjwWd3eswZjhz6P8u99XqooyDjwNA8JLzkjs+m9zdeVL1C9kLdGF4bHJSPT5LrNBLnHomFNjzkun92vKr1HJeHd69UEdnpDUQBFR8oqCoeuj2ueA99ys3jize5wK8jAuKm3uNiB30j9QDVP2ibwTxX9YBPDIj130xISi5C/FS7UlNnNm+AQ0uoBsEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whra669tiCHQ+poCDj6EAIbsU08bPNAKOf/ImM/atoY=;
 b=D2O6h5ikNi1iZrti0kAktDszts64r1+T98LAaXCJUHxJxkmzZ1dzZewpgqCnIHb2iY8mH9dQ9Tj2UnUYEc7emrNf0ZEIjCuV5BdAzViDa3wlP/UKkt/K/a616I+2RX2qJpc1L71w/5aWDrqsGZKvOsWM7Hph/K91S5eEsJuyW0M=
Received: from BN9PR03CA0170.namprd03.prod.outlook.com (2603:10b6:408:f4::25)
 by BN0PR19MB5261.namprd19.prod.outlook.com (2603:10b6:408:150::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 13:54:36 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::10) by BN9PR03CA0170.outlook.office365.com
 (2603:10b6:408:f4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 13:54:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Tue, 19 May 2026 13:54:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6225840654A;
	Tue, 19 May 2026 13:54:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 496A682026C;
	Tue, 19 May 2026 13:54:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 2/3] ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
Date: Tue, 19 May 2026 14:54:34 +0100
Message-ID: <20260519135435.479949-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519135435.479949-1-rf@opensource.cirrus.com>
References: <20260519135435.479949-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|BN0PR19MB5261:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed959b16-9acf-4ea8-9164-08deb5ae29c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|22082099003|56012099003|16102099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	b1mGJElZnPC9MjhpZ76SmPGY9/UVA9T5Y3hERNoMp7+9Ex3KuBdmWstVnZxUBCuSl8SNmoEhlJaH/Ss8sDnEMaGPfSSak4DZX/yXAK/zt8svJgT3Nmt3Kk7AkSSSarSSFrK1T43Snt6N0rk7T1pc8OWGYi3/8dGpDE7Uver6zlhzn/svOPe6/iQIpIRkYQLFaNi28qNGuDUVL147vZrSgONjxJxYwsJ+cJDKAcqiM9juXD7kgl4bmZH0F5Zz40ysWRNOiU9t8LHHgPIZ5ZjMYfJv+rWm7Oke12d4oqPs/n08n47lv95XrGq3CbX6q/M4ZoGdatP6FTOBYm9GpI7gXBU+R/Nt/nSf8EdgacdvNGcs7eyAYHbpfOB0YnfbW4fKpXxaeU8pDBQ3o1GVUV+QVdBEKgFi/dq5lVgg19JtjB4Rf1WtDFpHTG4pUIIT1yi9nJkn4zSCcQAtkDu9+b1xbAvzJVURL7mV7vs9ueVCQ7xwTwWRw8jtYvr3IJ9YQ/lBmsXlLb5tfiGzlwW2MZjVqStNACHNOzneAI3Qy2K4WBxATpkQ87wXOSbNXh4pPdu/SFeX9fGuKsOEyRD8EMxA9CBUAslZQc7B7+oy65zD9Oh8euVyQYoTZZ7Yyn9J4INrAKIRZEZsAlD7UhmGl9jSwf1WHH5hJ5p9/+0ZcheUV5Dwpjgf2AzFIZuW5d0ovyTGin8LL9deDFQHCpExpnaMtgVZnJopBSe/n7YoougPSaU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(22082099003)(56012099003)(16102099003)(18002099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VfHCrMFrfe03Xynev+4A4jt2inN+DcZdpg++gSNU/b0nllJaysnumAh8atvfo2KDy2GdX31eNoHZ9YSCe3J3gtKgGgAscb5IOmikb5wiuxiS4PLRRpGelBB6F+g87g5XRc/iXkfhFgwjbFCUe670nZws4xR5Zz3w+mujln8OD9tBR6In+Qj8ERaMGrBfx0zbGgCTjL7E4oUccyypKWlFojGbqCBUk9W9EborwK4wwGONAUp5kw6UoLqmQ3VcgodZYTLADLRg5GIVu+11v20kAWLmtdjCsSRICT8GhSGiRhOgvjE1MUHfd23AEoWOKZm33TmQM31l1ubWLn5215iAk0TH0SngPbQSWLI7J3DDq5+zr5Gx6ydQ3tUd9nHgTjz1go3TljiST6QfGSfvSXvKcqS3vqf5ph9GRN9JVPNXdqmGDwK6ggZ0AD48ulb2NhUf
X-Exchange-RoutingPolicyChecked:
	IrdAird/9z1lfKivjLCt9Z0ueJ0HLvZKbXXuJ5+vgucqkuyRwQw4+y53fPOisElPoSYT5EuJmWJGTa/+Ps1qU2sdl/dQCrcqjo3EZhflECdG3QBGAOvbTps1o5sGoAomJmSxI0YiTxl/NbqhXnJc9B5lEU03cGDwaR0H8PVGIIlo0jcDDnstoBjDk6GApxM4IU3FvbJcH50UwnoMh/rZN3ui2RmJ9VYiHmzURN6lcVD6dqWWojZCYmBRJJ7DmM6qacR4jX+PNE3aDt3tD+7+a9tiQHB6z5huV8/s4p992QgAANI4fvtL8TsejybWd+a+xC1p6UIX7b5Oz92+0ivRSg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:54:36.1154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed959b16-9acf-4ea8-9164-08deb5ae29c9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR19MB5261
X-Proofpoint-ORIG-GUID: _BGCZg66VbewT2r--qXYYlQ0nE2f9mnX
X-Authority-Analysis: v=2.4 cv=Cag4Irrl c=1 sm=1 tr=0 ts=6a0c6b9f cx=c_pps
 a=ZQLENUxQXoe8E0vMiJlD6Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=3ATER5miuquMFiRRYokA:9
X-Proofpoint-GUID: _BGCZg66VbewT2r--qXYYlQ0nE2f9mnX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzNiBTYWx0ZWRfX+jaYhbmSF/oZ
 vrJZ5PiD4gOFGkf2dt2h4fZxKehUALFy+mlaIHCi3moYT3Ksm14wPjGBhZbEAJyJpNiONWd18ve
 XOhbMPeyqgggeCHBRPt80jKGLJVOEv+cr7YhQ3O68LyZ37fuY9DpVGWqIPB589zeonbE/vpDRPj
 SV8Sh/uP+KZCpdbl8Z+AEU/wrQHwTwhQMy3+qLQNMWEUcfbuTf+NNUhqfY56lLxMnH5chcMAbgC
 UOBatl2IDpiJ/+N6omjOS+iayOJiZeC9UKLAjfxFcwBCfWA/l1hIapQGlA8JB4JV+wOVjnS28xh
 YqPi69ISoBra0S5+pRdtHaXfqW03dBfqxkitwWVMWnY319DnUHVuJK3GIrxrW/2TPfAq/KC1/kF
 WlppSxmoZz+AWXUYEWGcETGU1Cq0Q2DyuCZH4u+Zm36B53sQvSrHTT32cqaqlSOWc9aLdcd6e17
 NeXnrimq8uVP+IXDdyw==
X-Proofpoint-Spam-Reason: safe

Set the reg_base member of regmap_config for SoundWire so that
the regmap core will apply the 0x8000 offset to addresses, instead
of doing it within our low-level regmap read/write callbacks.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
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

