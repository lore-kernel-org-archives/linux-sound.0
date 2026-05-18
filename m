Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D1C4508E0;
	Mon, 18 May 2026 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109807; cv=fail; b=jSoY6OuO7CA7zPUdOyeEOEwlwFSMl2E/xLlJ/1/iUIJOew1b7e/p/P9Nmjt4GAEgrrG/6P6xJwAF33MX3tzLYRJJgGpazgW/VpO7FFzC+HJyBy+aNVLmjkttaEubDRz7M7qAezIS4jvwyp0MmY85V6ny00E1V1aslF++Me1fxD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109807; c=relaxed/simple;
	bh=AxMQeHyg5aYsBywlmatK676qlu9ZvsuJd3UOAU+qGEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m8hCQoWAj6uW88jmnUSYoU7d1sxHszq5tsJhf+YT6f6uAkOFZRgx6OuXPQVBMhBabTxjQ+RbldLlklsUMjPZ/UdsbXp9an2f+sAR/LELfwQLoJdnVFEOCbEAnK9K6wKqaajfdZwY0mG98tK19CNNJxlb3ipwHacVStWE4iJ/Guw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cWKgpqWf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LyL6zN5Z; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cWKgpqWf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LyL6zN5Z"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I3tHYi2951708;
	Mon, 18 May 2026 08:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=QImIwyN46Je5HriTAK1Cc06uHZxhO87IcuL49mm3Lak=; b=
	cWKgpqWfGhPAgBCHCBS2d+Vbo/ey7Mle87oWtywgRdyvMzAJ54mr7f9sKL9v+kSv
	ygIShWmrkmO1dnDHo6XXHh8dify2m+x+1zSCjGSumRRJ/5GERgl7yf/+gMBTtnyK
	V3K9myZTAm7XLzKPiw73Wz/3yF4Dok2IpllSVU7Uj06/JGwue109uhmjn32llsfW
	Qu5oG8dxSm4Xd15eCAo+cGImMoZUMgUH99NX4XNV5EFYu5/9WNdGaZz6pO5JqHcG
	7UNpuKv0mhvIs2sPjw9/sRT7wlwlqPebsZU5by+kiqbAJFkkavemDVNFOaQLKJ2n
	w1F54BzP5+2TvTIiR4hh8w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021127.outbound.protection.outlook.com [40.93.194.127])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e6n0ha058-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:09:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3GR6ifaZI/rB3/Icutt+GgLhELSegZsCsLeb550meLvm3J9LD21We20Oiqb3rcNIMYaqUsGEeNXDb88cZtVP60nazveT0+Y9bFglvLlh100Kyx6EGCNeamHTfNLoW4idkktZE5n3RfSdc8A3ucFvVzeEVAjw6oeyeh+Qp6jbr9a+CONreQaMBNCNmxAX4Rda8v6mNZLeLaQZjWZxGFdNSa7MKrd8KC8CNLHGXubBZ1aA/sQWndOKwCh5ij0M48H7zEehcgONCf5n+hOMLWdfMuV3nxETjwc0UpE8hcoipN//iC6+VSVVi+tL7zQiNemaKtPlN4cLzone2UvpBOx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QImIwyN46Je5HriTAK1Cc06uHZxhO87IcuL49mm3Lak=;
 b=amE51r7nnqbkAutbcrkwkpl1b0vb+UA0Q7FzQxGt2mgV1WWPcMqCg/BqNP79j1bUeZWyGDnr/zoZ1+LACAFUdD5tB2ZI6BqNLhDukU2mVLmK1dSg6od/TJJn8Vu/V6G1eqFSRTKNmfbrz/LUVUkP9HarK5hqQ8JrfOwzDr2sT1ekBwEKnhtIoPR8ExNga9FyFrBliEjtjZCcpLqxGvUaRsPwYdkpzcmp+pX3CtJQupC/E1xKrMM6O2Cx08t9gmnhr63xa6X5xJ+umC9WJRu2bPbpRFaSKuwNo1Qz+6VFixoPMASh/SQUppQAeW+BRLgWIaFCDbjnzLpNTgLNVkF/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QImIwyN46Je5HriTAK1Cc06uHZxhO87IcuL49mm3Lak=;
 b=LyL6zN5ZR/mVD/jma4Z697tGhaq2DqrHNqENYasaVjjx196qEuXwDzER0sHP/wrOJeVouTEV+wlascCsLlX1tolB9XuitZatN07UJ01ZYUxyvt7MwqoRJVjGbbTmHlCu8PGOyaqCi+T92cycwwdDsXG6TTH698gGssNIiAafDBU=
Received: from BN9PR03CA0766.namprd03.prod.outlook.com (2603:10b6:408:13a::21)
 by CH2PR19MB4104.namprd19.prod.outlook.com (2603:10b6:610:a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 13:09:46 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:13a:cafe::ad) by BN9PR03CA0766.outlook.office365.com
 (2603:10b6:408:13a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Mon, 18
 May 2026 13:09:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Mon, 18 May 2026 13:09:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 06D5740654A;
	Mon, 18 May 2026 13:09:44 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 08B7682026C;
	Mon, 18 May 2026 13:09:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
Date: Mon, 18 May 2026 14:09:42 +0100
Message-ID: <20260518130943.82485-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518130943.82485-1-rf@opensource.cirrus.com>
References: <20260518130943.82485-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|CH2PR19MB4104:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 029667d2-4793-42ac-c27e-08deb4debb58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|56012099003|22082099003|16102099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	oSKQSrsujzUh2F+bJ+bDDt5dWMnaNSWfB2K8sresR6fsLaraXdYzpMv1gqlqlZvFdVtrktqsoL0/Oc4ElTmP6a0p4Oo+Z4q1ltcYk9BkrkLbQCj9zkMsxXGdLn3CiwVTt7/lFVqFfLfhTbCDqoM8/ORfE1AXGJavp0Hk3Lx+K0XOu11AbZfuo0bMrJCTVoF9z26yxxM3Xr0qFe1chmiM0wfjmt0Tif3HsH5BhjU05CuDFwWfl/9vPV5TZXOaNwo+uHcPTEZC9HoVohZBSM6eE53MqlA5XXWAWbr33VBW17pf1DBwycsp/O6UviJG4OqtbVkq/yJcwUu3RjVuoP2/hvxmsrw6RAZ+KNtqL+kK/N/ptwn5k1tyv6wAx2TpC5Am+3iEeTnnjOPOXdVlEhh3hPo1wbIDVgTUiXKK1APR+kDKQ3Chm2BK/64pLTvaX01qweVHrfsQiabqDuYtPwzQ49TwBSPEccFKdxUyBrwQr6TOZ8YQZMUo2Sm8f18FO+KBToxA4e/pYunRjsd+BeadoC86kiaB1uAWAV14LwCAjaR2bpapKkzrKQMWyRtMHv0X+ozssg0igvhpFIQ9NVyJtkPDzDPfpllmcyjZjpj0eEypgw1a4SNPnFAZmpY21LtS2/13XLqoAI4wjvjw5zS24XFebo5CnVEcNgKQ8sVioaZws377Rb4E/a5TTOtkNGpvjnBGxHnL55jvhF2ITfQMpfOQWhGqJ6XpyZt7vLAAias=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(56012099003)(22082099003)(16102099003)(18002099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e/Djjpj1HK7ZwDuaLbYGBFtJsGRwtYDhcxZFG7eeVWlYDrqcx7+Vc3Kpdz0IMlrEDrdSMUjd0CtUmPnxVLzOhReqQsR/5Lk6AlcePZOhSFG30w7SLdg1Bo86P9dmgonMj0HdvYOEq+RAbgtQ88HFQm+QdWWufXYjikJQyoUil8d7HywQdsbinzhPqSQZWNGK8BKNOAN7BuZZkjBWZNuZxx4KiDXQXAaRjTmZcqzwagOqXIHI6CfdBimR+nsUg+UEJX/1in9GYQB+KP0MwstCZzimXPhIVR8J4+egKyJwUNdyn46Phe+GaUCqXxICYBf9uQvBDPUns1CU+D/PvC2No/YDmU3gG93ZK52S+5VB35/93Chtqqd90nWC8tmyKpW4ywBePPWXiqKVw3PoWgNEYvqMu4Fc8PFPx31ofNb8wG/32FhDxp/rnhPr0YFqiRvP
X-Exchange-RoutingPolicyChecked:
	shvpRxFh9l7GNwLVtPQjxz5eJgT9+YIO3D1f/aQOflO97berLzqqY0xHprpFsEHsCsMumgbOMzpq3qpnpt4og6CJuDs5ONwbYIf5+fVzWpEG70o3aSdUwhIBU0xNbAdiAjsEtYciVHDUHzfRhPaWFRVkdgRqYpsaMcTDC6SjdLuIwW7KSNcO0qNw0EFJsdyAqwQPEBYNvnR9u6IHYprolymLW/fK16/77n6GyRQ3jwEufslIBH7owyT5BK+Xy3tPoqApR6d5aRJLqSec+koiCzDlrmqc0LimIPKGcLgdAXNupf8jPBsCpaTBMRIbYwEaBvsky1iMTQ6HeDe2m/BOuQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:09:44.9953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 029667d2-4793-42ac-c27e-08deb4debb58
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4104
X-Proofpoint-ORIG-GUID: rGC4ay2IetdqmTjC44Ps2TXpd4HKdrc1
X-Authority-Analysis: v=2.4 cv=Cag4Irrl c=1 sm=1 tr=0 ts=6a0b0f9e cx=c_pps
 a=wuCIV2M2hcCPwYkL8T+rjw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=3ATER5miuquMFiRRYokA:9
X-Proofpoint-GUID: rGC4ay2IetdqmTjC44Ps2TXpd4HKdrc1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEyOCBTYWx0ZWRfX/FqIBUrOpyfr
 wrOZZowAXCBTq+UzcB4fh5SZx9o+rtZUWiiiJVVdGu1YBHJWniuZKTyQrWkenzHKWwkVEKRmElC
 MFEO4m7LOi4fqKDdTJS4YSsfbMolMJGK/dWX2DmXWeDhwYWdDo6PcYsNR4sOFDJsv4yKcj217Sk
 vUALLNL8oo3WXJwtxXdpSohg04EwW+AaM9dCU6H24wddRPsN1yPhLXKxBKVBkEUq4yQPSKuzTlr
 IEbvXTVtb6SvdM3XvdFCBc2XBLIweTCIJcC+TFCANBFAcXalQwp81fEqClRYsPNRMjDm+96tW6s
 wdjxNK/3dk9Pd+0aHWdGjGS0Ska7jxV2OJXR8yu3HNO90zmU32CluyOofS3fWxL4aIZszcWadsQ
 f8ylj0LPRJ5+vzFqneKYhqE5nlEycO5BxHFqm1euNol28kx/0lQd+PtBi47Lp6ODCzKl9Jpmjgo
 eOwvo/rx54lAuxg9f2Q==
X-Proofpoint-Spam-Reason: safe

Set the reg_base member of regmap_config for SoundWire so that
the regmap core will apply the 0x8000 offset to addresses, instead
of doing it within our low-level regmap read/write callbacks.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
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

