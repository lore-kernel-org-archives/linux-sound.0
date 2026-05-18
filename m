Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AD6480969;
	Mon, 18 May 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109809; cv=fail; b=ovzB3LZUqarj+RbXVwN8g1dqVeqDcqH7O9b5sVo2jlGrAjIq4uXJ+p3zEw6wz4/B8zuyRD3OEt5GnOaOXshXj0FdOTh3JKDl0+CsY8O1hcvr3iZlpOb0oDsOQa6iVeL9wjp7a1J43UHG2U5UrfIrMaZso0VypO6aGaNUYTlyPoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109809; c=relaxed/simple;
	bh=Nq+lTI6X1jJl6OzCw2665BS3gzI/duEQjUyDk7IeReA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H3f/I+eXYOin4nOuf+292CYy1XS78k7PGtavJ/26KNt0aPgyb9ttvSicC3HgLVrBtFHhPdTXt7YpdI/Qp99uCCjQBvJgd/pMYSt7BbGnXRrJHgTE1fqb9qFOY/Ng7a9UOLUY3LE4WBOqQaufyrf395nXdLoS26MUE5Ft/TAyMdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XJQUjZxR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xRlcN3X1; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XJQUjZxR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xRlcN3X1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I59tIU3211626;
	Mon, 18 May 2026 08:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=VaG16WDvHkXTVOPiJLCu/3qUs/Emkn7iD7Lw1dqyWZM=; b=
	XJQUjZxRwKy+SpcQszPl1OU4rcSkyiz5aM6Qkt7sGz5qw/Hyl2T6w/Z1Ku6bdBVE
	fkBszGI6Y0T83Wq7cpK9oHMKvVMurHBt21D5ZUrtVigcOpXW+3ozmR0O2DWcIjpi
	sXHmSLxZqvBnr/FHVpejvCU/96hKqrE/+zmP+6fSYfhY8MOZQe9zGWCwbVWIpgNc
	faQsWScC3cPXdxT6iUMsifVwBXlzAhop3BjIUQYlE7LgjoVOzpmrfhNtB2JVy/VP
	xvTslCe/+UDeOoVHeEfFrchSWjt17mAK3r0ZAxbq88Daj/UwPUVpu8qHVaJFvNjn
	yJiFXx1PijVHOl/3cABjcw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022121.outbound.protection.outlook.com [40.107.209.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e6p00hxp2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:09:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxXBx3JpTslhq2X3jxlTbqGX7wTbNKktYFLbrib1In7te0Z3V7tZiH3M3yC9qGdU7bPWwGvdsitA7r1fsYGFnz3GBbl6pZ8I+0aDHBssnR7srsTYqZc5HhjhyCKbouK3jzUF/D0nI0rDRTK1RqEpuKSloruhCjOlk5FBiDA53v6B1KGX7qjjyhDWBvjVCxI3Im8WrB5hwhdG+sCqKz9AAfbMYFMKJ3hEkw/BHFn7BWiFFzLC+5wHi9BGwX2JJVGiTXBQJ3vgwu2XZ6TYJFue5zLIp2MJKrVIFIGC4oK/7xd0MvY7ahqS2MUWShKChHE0DVcrpR6A9sEE5VPyGlSVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaG16WDvHkXTVOPiJLCu/3qUs/Emkn7iD7Lw1dqyWZM=;
 b=VB3QH401S7hpbSCWqArOwQZU7ecxreDdRQBQ9Nuo4f+QK9LVn+ZMsPLl9FyptgD+0CP+2h5NWRenSGdoBJP3nPJA2neYbR2dIR7wREQaqct1CoKS1tKu+f2nI+En2y8E9heszcrKT+K8aYWf7eRzC2q1kQwTo15A/kUzY2bm5WTD5ffvxf5RaafyLGPJQuGh0nzmyKZ7P04AqUPqK6YoHb+cHWxNvM9EH/poIWYIWfXvUbY2M61ug/9R3yjkJfFnbMpLfO2t21wwRAwWd3NfEq4qAwTyN9rK+RWJlFU9MUTXujjCirHFo1ZmSkkLtzeF7kyZxNT1vKSV/SIaRR8tUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaG16WDvHkXTVOPiJLCu/3qUs/Emkn7iD7Lw1dqyWZM=;
 b=xRlcN3X1TWu7knQuCernmm/Vi8+1kFeJsrjobyI388MKHXUtVDmTsvyLYjM0UFZ7RtiT0NGR27BMu3JoSEb94yK0Yf9kzqRypp+5HZYLZDjM3GP33byFH7pH0k/EzYZDyB02SIv6AUbltMoqZRGsBEte62YM+GFYQtj9nQBHb3w=
Received: from BL1P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::22)
 by BL4PR19MB8880.namprd19.prod.outlook.com (2603:10b6:208:5a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 13:09:47 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::6f) by BL1P221CA0006.outlook.office365.com
 (2603:10b6:208:2c5::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Mon, 18
 May 2026 13:09:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Mon, 18 May 2026 13:09:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 06D35406544;
	Mon, 18 May 2026 13:09:44 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0B569822542;
	Mon, 18 May 2026 13:09:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: cs35l56: Use standard SoundWire regmap implementation
Date: Mon, 18 May 2026 14:09:43 +0100
Message-ID: <20260518130943.82485-3-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|BL4PR19MB8880:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2fa5c144-7344-4b17-bd58-08deb4debbaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|11063799003|56012099003|18002099003|16102099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	JnAaG+Zq+YgLdFAkyZqVD7pJMLBIBTe1oKfoSX5+IlNIs6slCuidkvOTTzdJsvf91AgKLEjjE2uOVGbB6+8NskfQHwoZgxwOBtsk+EPD03Yk76tyfbRnZruZ+iWZ7v0mcr8rvfwAH+HVEfSgVQpzWZUGOqFDKsmRIRXH1ruxN38BAyxVF9c8H/Gsbx+xQRnMRgyLCSLdUzbS82rZpoj5lMNx/Ik8y0Qq9FZhMtmmjIIqYMPcG6aNNTSpDROq4TwO7Ff5KWhFDSJH2+4iXDpvRV3yMZzMgfB89y1H7xYSqs8KnJzQLOXnTT7A4mFgfR+1HclsVYRr6/vm3HVyAye+BQ9cjUPVF6nMkKVmJDSTBLKndqn4RZDcdotN60RR4AAm98qecq6S8cMd5Vqsu1hclyusSxGGtUMooB8kGw69PDFBLHiXvIdUfVozQvrJfFaOU5kWPl1l5EZAVPNgRqobrEiojcL/UZjTYfYd+JgQaZBIW6gpyuTx3CRcvDYQLyvaFtG75qbjK/eA6XwMNDhatEXC4hpOlYp88nHuwlGpykE/9ghTgQU1+3C+LDLPv3/OHFS1klCsF8WP7QiK/w3REjq1Pb+fU8WmOiWRHJjpLNwOvyb+C3NeIo/OlyyeZrZuC+XrN9Ulw87ebJxCQPZywdocUpyXkZoJDVyuN3MCE9rwMbWwjDEh5mdiuh/MC/m+mc9CjaDBx3sh4nFsCxn4OXIzqR94k1P46h5xbRu4Joo=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(11063799003)(56012099003)(18002099003)(16102099003)(22082099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2kc1HjnxaSkW8ASErxpG857fTNy4x31s+8j+bIoE6v7pwBkClGWEYnSjo4dWM11AQ189uYggka968oqyrs0of19VdRfj+UeeUXj4t7wVSiphm4W1eXI9pA4uMRJX1/HkCu+evdzuAL5WlD4vfqrQeTES2eOD6EwoL7tLhW9eaXM9V7Cx2dq76csqesl1FYcJ4tgwqeGmS00jmSk/GV1I3Iay1ERozd5JEktHmuvLLIQO4fMCSW69w5ONbmTuamEn5bhAiCQ8ECZO8f8zyTq73APIbSiksZBONJuDdG2PmmBamLajoAIJ18UxNd4iaMql3lD8oJZQR744s7np+oMOiB9s/aF3G91s7RvmIDFRTQAreJheCvSMKtelb+mVPHOZ+7uf+45nFvtwWUMUsbpac3p519mF7ncyx7ME3QcDGHGAAA9FyFL0nSUqDLvFZ9B2
X-Exchange-RoutingPolicyChecked:
	Fx3Thm/blzF03uwJIjQddfZGHQxI5kk+7VLw3JejAetoklrOtoYYAp7bbQP0O4hL6CPNNmGHDzJFJ/yJ2Y7C1FDb4x+/Fewiv7/CnlDKEBtVtgDH2YokfYFuW01S9IQ+MwsHna11g1Jnih8Sjp/Fnlyl95YoZ/wxiH7ircLs+AszrnLSg2m3tqB0r2+PFh4KPGTFKmYmvavYp9D4M3+VnxFoJuSF2eyiV3PeXHPSfzBchT+5cElJvVwP+M2b8/Cek/IOOmKnUybB9PHNGZQsRd69bLTJ8eCLNF4r5XFD8sXlkS0zBbL8JFZDJnAU9nJYfkRQ+ygzxoGxqvAGjmfVnA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:09:45.5742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa5c144-7344-4b17-bd58-08deb4debbaf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR19MB8880
X-Proofpoint-GUID: TM1eaFALG9q7SeENCqoOCWPtPCz4CZju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEyOCBTYWx0ZWRfXxhjOvkiqZFqr
 oZLYQCGfUoHuS2nkmGoaqoPP0hWUQTumr97Zt9l0IFsS4+H3VxTskM/zh3TmjbQUjAd837NKFqd
 70gdgD0stt/GnO78RMT2R/LtzKZMZy/y6DKIgNS95wbigvVfqkUmyKsAcxxF+mMIgbheWdbR4VR
 0k9EhlcCvBHGjS4L9D3ZIVZt+9w+uh9jdOwSKgw6mq6Vr4JoeAcTVaIPNeTSsEM2EuTPvslqAOT
 cyJAW9Uy91URk0/JaikMs34meD8YtUM9QNxZmj94fdkGQ1z7bJ0KdW+o6Db5dzUpPP5FAiE2VHr
 bCc3l+G8ui916WhT+ovKBEATsltFtkxdk5QbvS+jaW76BImNT5Ewae4uiL3efQe5mPX7aHnc9XL
 Y55VZo0yo+X9rlm6S5CU+wq7qaSF0KGCPjAMNA/fdxr+IRiDr8X33QoEpM/d0jhWbWdvGOGsXRI
 kzNpgliHGynIsUj1uzQ==
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a0b0f9f cx=c_pps
 a=lgq80kZn4F/3L5fHRNAplQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=52NS7YWLYOiMMeI0TnwA:9
X-Proofpoint-ORIG-GUID: TM1eaFALG9q7SeENCqoOCWPtPCz4CZju
X-Proofpoint-Spam-Reason: safe

Use the regmap_sdw implementation for SoundWire instead of
re-implementing the low-level bus transactions in cs35l56-sdw.c

The cs35l56 registers are big-endian on I2C and SPI but little-endian
over SoundWire. The firmware files are all big-endian and contain opaque
blobs in big-endian order. So these must be endian-swapped to transfer
over SoundWire. A custom regmap bus implementation is used to do this
endian-swapping.

The original implementation of this custom regmap bus was a complete bus
backend, performing the endian swapping and low-level SoundWire bus
read/write.

This commit changes the custom regmap bus to only perform the endian-swap.
It uses an underlying simple uncached regmap_sdw bus to deal with
transferring the 32-bit registers over the SoundWire bus. Although this
adds a small amount of overhead, from passing through the regmap APIs
twice, it avoids having a local duplicate implementation of what regmap_sdw
already does.

The slow-read handling for OTP registers must access 8-bit SoundWire
registers so it still uses low-level SoundWire bus reads.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-sdw.c | 132 ++++++++++++---------------------
 sound/soc/codecs/cs35l56.h     |   1 +
 2 files changed, 50 insertions(+), 83 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index d9dcca1e952f..d2b82a846ae8 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -17,6 +17,7 @@
 #include <linux/string_choices.h>
 #include <linux/swab.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
 #include <linux/workqueue.h>
 
 #include "cs35l56.h"
@@ -95,55 +96,23 @@ static int cs35l56_sdw_slow_read(struct sdw_slave *peripheral, unsigned int reg,
 	return 0;
 }
 
-static int cs35l56_sdw_read_one(struct sdw_slave *peripheral, unsigned int reg, void *buf)
-{
-	int ret;
-
-	ret = sdw_nread_no_pm(peripheral, reg, 4, (u8 *)buf);
-	if (ret != 0) {
-		dev_err(&peripheral->dev, "Read failed @%#x:%d\n", reg, ret);
-		return ret;
-	}
-
-	swab32s((u32 *)buf);
-
-	return 0;
-}
-
 static int cs35l56_sdw_read(void *context, const void *reg_buf,
 			    const size_t reg_size, void *val_buf,
 			    size_t val_size)
 {
 	struct sdw_slave *peripheral = context;
-	u8 *buf8 = val_buf;
-	unsigned int reg, bytes;
+	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
+	unsigned int reg_addr = get_unaligned_le32(reg_buf);
 	int ret;
 
-	reg = le32_to_cpu(*(const __le32 *)reg_buf);
+	if (cs35l56_is_otp_register(reg_addr - CS35L56_SDW_ADDR_OFFSET))
+		return cs35l56_sdw_slow_read(peripheral, reg_addr, (u8 *)val_buf, val_size);
 
-	if (cs35l56_is_otp_register(reg - CS35L56_SDW_ADDR_OFFSET))
-		return cs35l56_sdw_slow_read(peripheral, reg, buf8, val_size);
+	ret = regmap_raw_read(cs35l56->sdw_bus_regmap, reg_addr, val_buf, val_size);
+	if (ret)
+		return ret;
 
-	if (val_size == 4)
-		return cs35l56_sdw_read_one(peripheral, reg, val_buf);
-
-	while (val_size) {
-		bytes = SDW_REG_NO_PAGE - (reg & SDW_REGADDR); /* to end of page */
-		if (bytes > val_size)
-			bytes = val_size;
-
-		ret = sdw_nread_no_pm(peripheral, reg, bytes, buf8);
-		if (ret != 0) {
-			dev_err(&peripheral->dev, "Read failed @%#x..%#x:%d\n",
-				reg, reg + bytes - 1, ret);
-			return ret;
-		}
-
-		swab32_array((u32 *)buf8, bytes / 4);
-		val_size -= bytes;
-		reg += bytes;
-		buf8 += bytes;
-	}
+	swab32_array((u32 *)val_buf, val_size / sizeof(u32));
 
 	return 0;
 }
@@ -157,57 +126,34 @@ static inline void cs35l56_swab_copy(void *dest, const void *src, size_t nbytes)
 		*dest32++ = swab32(*src32++);
 }
 
-static int cs35l56_sdw_write_one(struct sdw_slave *peripheral, unsigned int reg, const void *buf)
-{
-	u32 val_le = swab32(*(u32 *)buf);
-	int ret;
-
-	ret = sdw_nwrite_no_pm(peripheral, reg, 4, (u8 *)&val_le);
-	if (ret != 0) {
-		dev_err(&peripheral->dev, "Write failed @%#x:%d\n", reg, ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int cs35l56_sdw_gather_write(void *context,
 				    const void *reg_buf, size_t reg_size,
 				    const void *val_buf, size_t val_size)
 {
 	struct sdw_slave *peripheral = context;
-	const u8 *src_be = val_buf;
-	u32 val_le_buf[64];	/* Define u32 so it is 32-bit aligned */
-	unsigned int reg, bytes;
+	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
+	unsigned int reg_addr = get_unaligned_le32(reg_buf);
+	u32 swab_buf[64];	/* Define u32 so it is 32-bit aligned */
 	int ret;
 
-	reg = le32_to_cpu(*(const __le32 *)reg_buf);
-
-	if (val_size == 4)
-		return cs35l56_sdw_write_one(peripheral, reg, src_be);
-
-	while (val_size) {
-		bytes = SDW_REG_NO_PAGE - (reg & SDW_REGADDR); /* to end of page */
-		if (bytes > val_size)
-			bytes = val_size;
-		if (bytes > sizeof(val_le_buf))
-			bytes = sizeof(val_le_buf);
-
-		cs35l56_swab_copy(val_le_buf, src_be, bytes);
-
-		ret = sdw_nwrite_no_pm(peripheral, reg, bytes, (u8 *)val_le_buf);
-		if (ret != 0) {
-			dev_err(&peripheral->dev, "Write failed @%#x..%#x:%d\n",
-				reg, reg + bytes - 1, ret);
+	while (val_size > sizeof(swab_buf)) {
+		cs35l56_swab_copy(swab_buf, val_buf, sizeof(swab_buf));
+		ret = regmap_raw_write(cs35l56->sdw_bus_regmap, reg_addr,
+				       swab_buf, sizeof(swab_buf));
+		if (ret)
 			return ret;
-		}
 
-		val_size -= bytes;
-		reg += bytes;
-		src_be += bytes;
+		val_size -= sizeof(swab_buf);
+		reg_addr += sizeof(swab_buf);
+		val_buf += sizeof(swab_buf);
 	}
 
-	return 0;
+	if (val_size == 0)
+		return 0;
+
+	cs35l56_swab_copy(swab_buf, val_buf, val_size);
+
+	return regmap_raw_write(cs35l56->sdw_bus_regmap, reg_addr, swab_buf, val_size);
 }
 
 static int cs35l56_sdw_write(void *context, const void *val_buf, size_t val_size)
@@ -226,7 +172,7 @@ static int cs35l56_sdw_write(void *context, const void *val_buf, size_t val_size
  * byte controls always have the same byte order, and firmware file blobs
  * can be written verbatim.
  */
-static const struct regmap_bus cs35l56_regmap_bus_sdw = {
+static const struct regmap_bus cs35l56_regmap_swab_bus_sdw = {
 	.read = cs35l56_sdw_read,
 	.write = cs35l56_sdw_write,
 	.gather_write = cs35l56_sdw_gather_write,
@@ -234,6 +180,18 @@ static const struct regmap_bus cs35l56_regmap_bus_sdw = {
 	.val_format_endian_default = REGMAP_ENDIAN_BIG,
 };
 
+/* Low-level SoundWire regmap to transfer the data over the bus */
+static const struct regmap_config cs35l56_sdw_bus_regmap = {
+	.name = "sdw-le32",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.max_register = CS35L56_DSP1_PMEM_5114 + 0x8000,
+	.cache_type = REGCACHE_NONE,
+};
+
 static int cs35l56_sdw_get_unique_id(struct cs35l56_private *cs35l56)
 {
 	int ret;
@@ -555,8 +513,16 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 
 	cs35l56->base.type = ((unsigned int)id->driver_data) & 0xff;
 
-	cs35l56->base.regmap = devm_regmap_init(dev, &cs35l56_regmap_bus_sdw,
-					   peripheral, regmap_config);
+	/* Low-level regmap to transfer read/writes over SoundWire bus */
+	cs35l56->sdw_bus_regmap = devm_regmap_init_sdw(peripheral, &cs35l56_sdw_bus_regmap);
+	if (IS_ERR(cs35l56->sdw_bus_regmap)) {
+		ret = PTR_ERR(cs35l56->sdw_bus_regmap);
+		return dev_err_probe(dev, ret, "Failed to allocate bus register map\n");
+	}
+
+	/* Wrapper regmap to simulate big-endian ordering */
+	cs35l56->base.regmap = devm_regmap_init(dev, &cs35l56_regmap_swab_bus_sdw,
+						peripheral, regmap_config);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
 		return dev_err_probe(dev, ret, "Failed to allocate register map\n");
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index cd71b23b2a3a..d029fa3f8656 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -37,6 +37,7 @@ struct cs35l56_private {
 	struct snd_soc_component *component;
 	struct regulator_bulk_data supplies[CS35L56_NUM_BULK_SUPPLIES];
 	struct sdw_slave *sdw_peripheral;
+	struct regmap *sdw_bus_regmap;
 	const char *fallback_fw_suffix;
 	struct work_struct sdw_irq_work;
 	bool sdw_irq_no_unmask;
-- 
2.47.3

