Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A73C8C56;
	Thu, 21 May 2026 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364472; cv=fail; b=P4E5+ejF8afcUNTbuWD69AxEH2KQR/0u3GXGtOEZLgysbaniBsADSylr+q+XHT1536ttK+OvR5wpXKZkcFXQiA+8THn5Wc+B0Lqe0w+t97lQvoaYsKCPYiWTzyHabLjpJEQbgDzixk6IS3qAQqD0+7JCNLjqKpK1yupPNiBgFZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364472; c=relaxed/simple;
	bh=Qloy6bM7py7wtk1RBdQab+gnIofk5+l9ZJwPeQz2D7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UNewGHMU9j4Nxy85xdRNeSztphn0y1JK8dx5AGQn4juI+CwLTQ1ISLYKkc/w1JuWRUJ72nMJ9y/pkx2ZUmYXQo4yPIRwicbqCC7mkAku0VA5xqXQbwDJGCdpolhWeH/sRZvCPcPvM/2u6+OjfCbwtTt0peWCGtlaOy6usCvTr/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XTNLvRoY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UGBqju26; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XTNLvRoY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UGBqju26"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5BlO22850731;
	Thu, 21 May 2026 06:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=puG76E/M3P6gE6D6h52sannTCaa3jcuW03jbZImvu9s=; b=
	XTNLvRoYz784X1Cq2dCL3dZ4J46q6PMWQCyqaWzwMCwwGvBBQeyoK3/lyuZ49zGg
	DYRPTuad7OSgqA2Dyh9jGJ2NqQbInQGfmNFKyKvuRzyzn9SkUlYxC+80ileejVAO
	M5ppX/4S9VKTs0RPO4G9VEg28qrzE1UZ39c04hQcMmbBhOBcRPSP8rNxbl5kyv+5
	jKcaOk0huNcOlClLebnpUtz5SrMFEMJIJ7ZX9EK+I2MsWc54xh3MfkQq5rabUqwg
	CfSg1lM4Wl5F4FYi/UQRLMTAuhrXOhwP133BAWsHr5/NZL0AOrXizPNbV/PU+5Af
	FmDROXbeEIASqtagGaV6dA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022097.outbound.protection.outlook.com [40.93.195.97])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e93g1jahu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 06:54:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKgxXjcJjBwZhMQEWxPN37Nvz6SEz7buX3fhwqYD1MCaLEUWIrOryAg2qZp9K/u/vDcbjK2xwaTaRb2wdpbgspNKQEZ46/WceFHzJ96oB79Dn9F2kswBBiQLHR0BKtWxIS6C2fY6FFa3yv3hgMkFR/cWQ5NSVDgo6+qGIe4qG6a4Q0OxWrAihSQEIw7C+t6ekvcNuYKHuM6AuF6GzwOldv+bRKrLawzs98aUFpfaYOUvmWv/3UC4+mIU/5r20wf7az/QVTyaaVfCtwRAhBSYVw5CPltWqbKPe3dU1rg0jhTi8lRvw9OaAGODGtlv3OP4ZodXzG4Ox+sYMCy5K6Oc4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puG76E/M3P6gE6D6h52sannTCaa3jcuW03jbZImvu9s=;
 b=kutwl4wGJ9ko2VlMk8lKwbzJHXhcmVZI3rrnUCU17OVGaBF5CU4kz8Zuu/5cr020iAvLjSyAUUL/Gs4/vYxPWlXXwXBSjJc7ra+a9LcfF8P/iiG+qxlIEUhbEa3Zv6DrdutVDdVqZjc3PIA9TMcEXgUWCFV5KIxRtYsvxKh6fFsdF5vqgWBsVXhTNYQ9EHbHO7lFFU/bZpxn006fM2+d3ePWbnhuIHGzU0LxK29AUKlmFWP/FJo6WcC9pSa4nqoJF8eIVVFyEiMHimrBEkN4YVO+Lbc++RZ1RCl879/dPu+nOiW2ro66VHCotQIDHbHMiMHgIoe5zv00NSbW/rTUlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puG76E/M3P6gE6D6h52sannTCaa3jcuW03jbZImvu9s=;
 b=UGBqju26NIWfSxx6GqKPOMqdTGTt6ErW035bubLWl4K/ogKOcdp86+gkcH00fbjntAL2Lgj9WFnv0tUKk+V8T3IW86Ly/b162YleFQegZ54xXQrcWo3KGW95cGzX2ql91uBL20Zrqhtkd7wz7jMkaTADYvthLjz5RgQ7pBP4x3M=
Received: from SA9PR13CA0036.namprd13.prod.outlook.com (2603:10b6:806:22::11)
 by CY8PR19MB7666.namprd19.prod.outlook.com (2603:10b6:930:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 11:54:22 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:22:cafe::66) by SA9PR13CA0036.outlook.office365.com
 (2603:10b6:806:22::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.6 via Frontend Transport; Thu, 21
 May 2026 11:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 11:54:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 85341406550;
	Thu, 21 May 2026 11:54:20 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 74ECF820244;
	Thu, 21 May 2026 11:54:20 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 3/3] ASoC: cs35l56: Use standard SoundWire regmap implementation
Date: Thu, 21 May 2026 12:54:20 +0100
Message-ID: <20260521115420.978616-4-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|CY8PR19MB7666:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 36cc33de-fb5c-4c75-9748-08deb72fb280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|22082099003|18002099003|16102099003|56012099003|11063799006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	8CY21TSjLvU7014JL3bQPMhjxQIBLejW1ofjlcRS8M19Oo94wNCPN+JkmHwHiEyFa8GzSUCRLCWWZS1Z6IMGymne0/xCp1EnYE5nNoEtlSpZmaOhGrQihXiBD2wDYp+VtcDuJyWDLbNuZXdrSEKnHBHTq3gyUDpy30KifpD6YerXTpH1qCFrGiflxzAQ7vlHzvw10o36TJag4/u9MXa2CtoPvJ1r5+kOm3s3Eg58B2NzZt1M99/As3+QZirLmXTR2NA+OVhyGuWAKy+HCl6X9fLxzh3MlhS+5P2OACtKZRpSn/VW05Vw7TARE8jhDMdpgIpDFu4JUTNabFChN6CunM03b8X6DOCZtlTaBAlzvSCjf7FrdXEEYv2spFAlzvOglBJWWdjX6GNCOXSbjp5j+8tD8WRHEPlSFplrxCpIgmPMip35rTHEG3h/2FSAMTySj97IgjNgdneJAzKReGUtsie70W8CzkkAcer5dS0OGO2YBPvcQQapw0WSGwZ1/PhIqzdO11PyqvPQZttM5LYL+63csw/jMG0DcEpmXnR1+N1UKs2rSBLadWiouASJRFSi+h2JCtKD9KjxtOy92O8QK9Su6q88YqKb+UBXAaeWUD69WSJpPtIZFM7o1RMOke5Aa35cc/9JAIN60R+O2UpDNVjFsxSVsDu1WVNde0m23ayN9C+9Rc/Co21Avb/OsJ6q61req4Y1WXd0Wk3VyVG+s7PIEXaBsFv399ULr3vj/aw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(16102099003)(56012099003)(11063799006)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wp9tEDIga+3iWBL3DG9Z8vdJ43b3sWI44rwHC7OUE4uhFYEFE2ImbPGVvUbLXpJ8p2FZvll4tHdJFLv9SGtFFj/8w7L7S82Y6zXR1enAUA9XhiLGOGfUa74RfowJD9EWuCqbITkknqlZNC504/PyRHOg3VY5+ddnBzBZjG8tvcMselQlb6bhRXUzYvNlfEzskefp8Q2yahdCBIMGduXXbD6eal3J2lhBmgUj+i7c0OYpeb4FzlELZs72fjbtiReSrGwDG3FH9XyMhFjD4NwrcQcDu4CXfH6tUDQ7+cakMwTPuwN7Lq/vzyWcSykHSg9QZTfL8o3ytxDz6W73D6npGKl2cXYfSIMixHLNWQukJmOSCQUUbGaEWUg2+YhAj8dENyPpUHmqmU4ZriH0xQsZt+ZivD5Lj9GRVMho23+zppZfijWXEzTucvqC9qEMzuDi
X-Exchange-RoutingPolicyChecked:
	pPf5Ve/uJKjnNQZ2sAME1UgkJG4uoSSV00ETQ6fJfwDJcVKpbE5RnQga3pTaWirJ/neZdzVZtVUHVx4LVaYms1cCG6H0sGdaqnLXNGqXxoCq80KNbhGQ4JOmgjRlWDK4FiT2kIpp1TiTYFwRP0mb2A9pDg6FmZ53v488X034IR/ZwarSfvlnsVzAnvSlMmla0MRg4DkUE7VJ9vAHdHPksm/PqW/W7xwaF/00J+SPOzRaY8e8vKAQIMUzZPj3st6X0JdDgSKF5mNGwXChM2lJB2nY/F1mlnrLUnzgEfzPGJHMUqsHcz3alhQmC4cHznWbtK72r9aD3nvZC/En5jpT/g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 11:54:21.6595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cc33de-fb5c-4c75-9748-08deb72fb280
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7666
X-Proofpoint-ORIG-GUID: moCS0U-v9fV8J8BSMtFra3GVNB2FdAGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExOSBTYWx0ZWRfX9iJPRTpXTC5J
 ttwzh+eSr15l71XokLaNjZsiNWf9Bg9BunpI/ZTPNHWR6pnqUU+un9k6Yqq64weKGNWZYtRA1OK
 E3B4nsjsSEq8BNYRwdKNhgQhskzOjBQYxsb8mlPDr4KT1PhswSZqq1G8gGEp0aR7qA/PyOmG0/r
 mjnNOIZvXcheBRIaChySESo+P3BO5hlR9n4gJ4pgH24PWnGhF2+lINt0FahtWWcWkJYYNWkiO21
 KuRKOmAT2dsbl7iVaALMo5WklxJr4BNf7d2wyKpafxFfA/6EF1cqdwLLULmSaH4q2kq/+zqvSre
 D4KAxc60G4ylcLGGXWLPB/JWHyFpiwwt8/wJWg1r8rJJp/K42SmqEeHGyipR1bt0hQPaea7dO2U
 4qFJ7BAKpKs4AZMUge9TjjcjUapODVAmtksJPwIh4WgK/CZfz3znJ3KkZuQBeGQTGP6H1RcfGk4
 uqeaUOO9mAN6uHc1OpQ==
X-Authority-Analysis: v=2.4 cv=Wrcb99fv c=1 sm=1 tr=0 ts=6a0ef274 cx=c_pps
 a=YnstAiVElcvMFu1aLrgWsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=52NS7YWLYOiMMeI0TnwA:9
X-Proofpoint-GUID: moCS0U-v9fV8J8BSMtFra3GVNB2FdAGV
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
No changes in V4
No changes in V3

Changed in V2:
- Select REGMAP_SOUNDWIRE

 sound/soc/codecs/Kconfig       |   2 +-
 sound/soc/codecs/cs35l56-sdw.c | 132 ++++++++++++---------------------
 sound/soc/codecs/cs35l56.h     |   1 +
 3 files changed, 51 insertions(+), 84 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5fdd0334c355..a7c61f7c7f4c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -887,7 +887,7 @@ config SND_SOC_CS35L56_SPI
 config SND_SOC_CS35L56_SDW
 	tristate "Cirrus Logic CS35L56 CODEC (SDW)"
 	depends on SOUNDWIRE
-	select REGMAP
+	select REGMAP_SOUNDWIRE
 	select SND_SOC_CS35L56
 	select SND_SOC_CS35L56_SHARED
 	help
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

