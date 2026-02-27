Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817B122424C;
	Fri, 27 Feb 2026 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772197425; cv=fail; b=Sfhp+M8VCnq81U7fOfvfkPZxMnthpc446yFqQgpXiYta+/0YZfSB7iVsF2TLVAI84c+FHCw05qk9ZotLUaW2nHNkzbwo7qkfHslB6UFjcs+dPx5aiKEg/sLvO6zqqX8gqSZr8EBvp/+WoI1RGnv7rjt73F/T7mViRCp+mE11fCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772197425; c=relaxed/simple;
	bh=eCQzzQarrowADTgzpYIjTmihHgZj9ckI48uMeghQWLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWv5FqyVHyvgfZtcDRbgB1fV+PDNaqBKM0V93fmXqRr7ruJu9X9/xKzTAuFHg9ISB5LOSBO4PLxjKwgnNsJIKeG/uJs9iw2n5bWv8mW/pKWtFUwIgDwHWRrTp6kq/8w02oGOXqmE1i5dYz/5K3+UOWMHrAKmm+ckBl/m4T9qu8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dk6UL390; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wCooMY77; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dk6UL390";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wCooMY77"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R5054P2382702;
	Fri, 27 Feb 2026 07:03:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=F4emaFBkL/nARGAtVnUWj08IqlcvM6Fah8cKxEvNnvk=; b=
	dk6UL390RluxREQVZioHJZGLRmnZtxZB9sHgrucZqVmbUC/vW0W8VqAODa25KYwZ
	66Pvc3zLZThHhQ47hJeTTjs1N9/W8XylyZC/63OASh0MIlUkVSScE8cY4bzItFtu
	7T1Zcx/vlVj+3H+dGQC8sbdnJdWvxgwFVfkX2oqvdBsH/1XJ0Qny6yGQaAa3Lty5
	l48ejlActv6uBuzqdtHJQ/8o81Qe7ehOo7ywUeLKb1ANBWVvSJuwFvao3i4EXODS
	DkTn7LPyTqU/KZBRcefgTf43NuymeYNykxBPzEdqaFkxZDhm5fBBVDSetXrctG8G
	laWuv1TL5vanGA++7cBiLQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021074.outbound.protection.outlook.com [40.93.194.74])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cjmds1fjb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 07:03:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gD+Vh03uEBn5QKtHvNLhsawQsL2xVhtje9yLNmqYwoygSt9y5Z4FBan3uQBOqk0t/YDUIfnTvDftX/pjjUpGYmXhopi6r+meBZk/fEzNhg4ukghSw9nMwsbBHZ+OnWus0QfuFzIY5MSlLZvz/14OirAJr3hl7nLnPMKEq4U+f7mzC6JOYaL/c8oAzoJPBho8TwMHKzGuhOctGeGcLW/vaGhG/ESBFcgsTNNd8WJRvcHngbBS1rZigoR1oueAaJ5Fpf4i9cWv+pkhbAxQSTwbTjgvCzO6aKCHUY+LytkJ0DskWSwhHkTw8SvKbV1mGh0ZqkGHpM7PtRx1fJttakohjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4emaFBkL/nARGAtVnUWj08IqlcvM6Fah8cKxEvNnvk=;
 b=FZougWDX6OlI5zPE9HeJs/n4yULtkONMhuMvVj81XC/xCv0h0VQ1qNYJSMHjlH3eJJsRFR56jsmXK9GMBddxX/oN/EEdBO/MdVo1bcBz+adqt0c4SiTuD4Pv07R5ZmaB9LNfSbLxYbxVnfV4v08jiDlFx7TBSX5VClXkNDR6TWQzmlpOPY+ywUVL9eepAfx96/hiHHSfn1U0c0oPzfl1aaO3kRjug5FEZTAlxT0I833TA3XmjkzjsM9X+wSfTeeQSyrvth7GJpoPcI9729qFUICmf91O34DZvrBGf3+xHPY69Mq4AOaApWs/WV2Rpfj0Mn8MVuI2c/vzEzYxe8c1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4emaFBkL/nARGAtVnUWj08IqlcvM6Fah8cKxEvNnvk=;
 b=wCooMY77zN2K329pobN2XPVA3WZIjFFxDOWSlFRBrS9HtPN2XdZ/GKI++lIiWn/a5BEytfQvszfgqSsf3UGZi5vDgy2iXHbhRHeCZ2gU8Dtl6vjwnzA0ozef6AnedzZ75ZCvthZOqFhUsmMkfgWbzV0jf/vlp/31c+4miwIq4VM=
Received: from SA9PR13CA0063.namprd13.prod.outlook.com (2603:10b6:806:23::8)
 by DS4PPFED68AC8DF.namprd19.prod.outlook.com (2603:10b6:f:fc00::a5e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 13:02:15 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:23:cafe::2a) by SA9PR13CA0063.outlook.office365.com
 (2603:10b6:806:23::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.20 via Frontend Transport; Fri,
 27 Feb 2026 13:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 13:02:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B08B6406545;
	Fri, 27 Feb 2026 13:02:12 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 79136822542;
	Fri, 27 Feb 2026 13:02:12 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v4 RESEND 3/4] mfd: cs42l43: Add support for the B variant
Date: Fri, 27 Feb 2026 13:01:00 +0000
Message-ID: <20260227130120.3070893-4-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
References: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|DS4PPFED68AC8DF:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f1de8d3a-bca3-46fc-060f-08de76006d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|82310400026|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	WSB+RcGNh9G94WI4McJRmWVuulJBOM0ACs+gMugXL031IOTHOL+87q5LXZyY3h3XhCetssM3/W9s5rheZASbYqVpZJIWZti0Iq009cXjoHJGQdD4yP6x5Nis4ruoQWWmpQob0Ggf4NEvwig1eWNAVVkEtet3p0W3PCxDmztBACVk6R4nCKL8dsN7ypwbwvoByk5K9/xPzWH9CXA6lOxzrdWqt32if7DFiY+8CJX/3JGiecmqtE83k36yd1Mw5X2nuytlomwfZS/11EQH5xtwat9Pdpk7sLJDlwH/a/R7xYEK7RS6jQgDhtX5yJKVGPkxAQx5EYwhiP2LHMYTvs501BnJiBS2wQqgHjjIBbT1ZcUUQpsqRAwukZot3dkzfWs8FiQ5Hlj8KeMG4nMp54QEabtvUfL4pAt6ZU0PILc7I/tG5UppIUFfEGuIy8008jGUhtqXwBpPcPYxmpNMu8aICfoXvZrePG5PoExO7gmE5BDFjD/JtH8ARyceGJAlzWcmcvL+hAJNzEyWu2ifxxli7C3FmsuDQUf4WuyVybfW1/cTBydCBkDA481KktvnvBinUlgKltHuQm6TExvTklH5k1/i6aR/kzHsljCrgitOQozPnUNdvhOkHIy3PO0tnOm+Vpeu9UDv2OmMwNkYR4AHGQMYzRPsnbhS1O2zvl64hQ9mfX0a51NYBv8J4o5fmu+yhlHCRbO6DVW+kK2UURYBFmXIc2+7BiWciqpes42T6oeTo7UDi6oEok5bL3Z1FTcrx3wEfsfkndWaYRT9uOoRMbRGg+jIirZDcI5WvWed8UbkI4ozOl4XtwuyjOMZ3MstnCLPbsOyWgCtgnoPrHmK8g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(82310400026)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Lt+T4fSnQ45DsslqRlYDaMAhQckIrWmxg2PQt+Ql3eOchn3P0gI06n9lz1jCCaW/IIVikROirvZw4J+nE9/34XxClGQRy8FTONEtVDpQpPefCS5HD9feoiw+P/GMVK0dsVWRrQhrqj3XSdAUhIK+z/Ua2R2LDfLYHpyxhwvHRR66UWyxu5MgpYOdSzTFN8W3b1QYC1Z3rN5yAZlragdfmu6vrBRmqiDcDg+14mlluEbH6RbEvnPCJVO3gdRYhYQdImwgikufnGIa7x9G27VcZW/wFvfSwEnHI/WMj2B5I+D18bgajAym+OWXGGr2DX6g1wlo5/lUgQIxyXttr2ptg/1PB+wLNwXTzCYJt+AqvJgVdidnC1IltgOq4wsh8sWjduH4No33Ax2k4hCOdihUUYPNyIpkx12eeFMnSrVhXNhzKjEYH4H4kKl2MS5MBRlA
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:02:14.1443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1de8d3a-bca3-46fc-060f-08de76006d9c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFED68AC8DF
X-Authority-Analysis: v=2.4 cv=dO2rWeZb c=1 sm=1 tr=0 ts=69a19625 cx=c_pps
 a=pHX0GuESvmlUVbyXmFftrw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=XPwATKmoEvXA9jVZorMA:9
X-Proofpoint-GUID: pGN-aQj0BmuH99oe2jax0pqlqQG_oB1a
X-Proofpoint-ORIG-GUID: pGN-aQj0BmuH99oe2jax0pqlqQG_oB1a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDExNCBTYWx0ZWRfXwXI6xY7xfrpU
 KONl9zFJogUXaj4HHWHSotA/FpML+NTE/qhcl1svFN0CqLI97GPL4SmsYpe01TkciJtUMHhPCwW
 uKl/ur+E/WX+HEGXjUBStN/jRh5Giy/2C6XR+34ISYk5dflY3o6RtGLHza7iSN+xQefQIxZdYeu
 K7uRfm/hji+9DLilQlqCe5XbRW/qoYTMjxWPVf8e1qaOx1//ziIydQS6heI8oMNi/Rrtv+1HBnW
 F+OXVmH5o53GcCGtXVtlIv904woNs8F8yUgLix9Tpd+6VKV36YsLiUngC2k2yzoSxS+g3U+cU7z
 3AzWBZreCHqTOWxQD+7IMzZznsRbj4FBmeL1Jd4z0Fq4fhXFjDLO3nNXUVrtlGwGY/VNMZT+XD3
 pTfpMg6yq5w9mC5FRSupTRC22TokqpBgBfDFx7HAakBweUGhTuHn252/3sAMrKIMRE8Uxj6dHYY
 wMwuaU9lXAWCn6atN2A==
X-Proofpoint-Spam-Reason: safe

Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
the same driver.

Changes in CS42L43 driver specific for CS42L43B:
- Decimator 1 and 2 are dedicated to ADC, can't be selected for PDM
- Decimators 3 and 4 are connected to PDM1
- Added Decimator 5 and 6 for PDM2
- Supports SoundWire Clock Gearing
- Updated ROM requiring no patching
- Reduced RAM space
- Each ISRC has 4 decimators now

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
Changes in v4:
 - change variant_id to long int
Changes in v3:
 - fix incorrect type cast (long -> int) in cs42l43-i2c.c
Changes in v2:
 - Rework the mechanism to identify the new variant along with some
   error handling improvements.
 - Added some comments in cs42l43_readable_register() for clarity.
 - Add handling of the I2C path for the B variant
---
 drivers/mfd/cs42l43-i2c.c        |  7 ++-
 drivers/mfd/cs42l43-sdw.c        |  4 +-
 drivers/mfd/cs42l43.c            | 93 +++++++++++++++++++++++++++-----
 drivers/mfd/cs42l43.h            |  2 +-
 include/linux/mfd/cs42l43-regs.h | 76 ++++++++++++++++++++++++++
 include/linux/mfd/cs42l43.h      |  1 +
 6 files changed, 166 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index a2ab001a600ae..0a0ab5e549a5a 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -47,6 +47,7 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 	cs42l43->irq = i2c->irq;
 	/* A device on an I2C is always attached by definition. */
 	cs42l43->attached = true;
+	cs42l43->variant_id = (long)device_get_match_data(cs42l43->dev);

 	cs42l43->regmap = devm_regmap_init_i2c(i2c, &cs42l43_i2c_regmap);
 	if (IS_ERR(cs42l43->regmap))
@@ -58,7 +59,8 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)

 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id cs42l43_of_match[] = {
-	{ .compatible = "cirrus,cs42l43", },
+	{ .compatible = "cirrus,cs42l43", .data = (void *)CS42L43_DEVID_VAL },
+	{ .compatible = "cirrus,cs42l43b", .data = (void *)CS42L43B_DEVID_VAL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, cs42l43_of_match);
@@ -66,7 +68,8 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);

 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id cs42l43_acpi_match[] = {
-	{ "CSC4243", 0 },
+	{ "CSC4243", CS42L43_DEVID_VAL },
+	{ "CSC2A3B", CS42L43B_DEVID_VAL },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 023f7e1a30f8c..794c983781750 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -178,6 +178,7 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *

 	cs42l43->dev = dev;
 	cs42l43->sdw = sdw;
+	cs42l43->variant_id = (long)id->driver_data;

 	cs42l43->regmap = devm_regmap_init_sdw(sdw, &cs42l43_sdw_regmap);
 	if (IS_ERR(cs42l43->regmap))
@@ -188,7 +189,8 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 }

 static const struct sdw_device_id cs42l43_sdw_id[] = {
-	SDW_SLAVE_ENTRY(0x01FA, 0x4243, 0),
+	SDW_SLAVE_ENTRY(0x01FA, 0x4243, (void *) CS42L43_DEVID_VAL),
+	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, (void *) CS42L43B_DEVID_VAL),
 	{}
 };
 MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 107cfb983fec4..166881751e698 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -115,9 +115,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_DECIM_HPF_WNF_CTRL2,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL3,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL4,			0x00000001 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL5,			0x00000001 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL6,			0x00000001 },
 	{ CS42L43_DMIC_PDM_CTRL,			0x00000000 },
 	{ CS42L43_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
 	{ CS42L43_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH5_CH6,		0x20122012 },
 	{ CS42L43_INTP_VOLUME_CTRL1,			0x00000180 },
 	{ CS42L43_INTP_VOLUME_CTRL2,			0x00000180 },
 	{ CS42L43_AMP1_2_VOL_RAMP,			0x00000022 },
@@ -155,8 +160,12 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_SWIRE_DP2_CH2_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH2_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH3_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH4_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH2_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP4_CH3_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP4_CH4_INPUT,			0x00000000 },
 	{ CS42L43_ASRC_INT1_INPUT1,			0x00000000 },
 	{ CS42L43_ASRC_INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ASRC_INT3_INPUT1,			0x00000000 },
@@ -169,10 +178,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_ISRC1INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC2_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC1DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC1DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC2_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_EQ1MIX_INPUT1,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT2,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT3,			0x00800000 },
@@ -269,6 +282,8 @@ EXPORT_SYMBOL_NS_GPL(cs42l43_reg_default, "MFD_CS42L43");

 bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 {
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case CS42L43_DEVID:
 	case CS42L43_REVID:
@@ -292,7 +307,6 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_ADC_B_CTRL1 ...  CS42L43_ADC_B_CTRL2:
 	case CS42L43_DECIM_HPF_WNF_CTRL1 ... CS42L43_DECIM_HPF_WNF_CTRL4:
 	case CS42L43_DMIC_PDM_CTRL:
-	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
 	case CS42L43_INTP_VOLUME_CTRL1 ... CS42L43_INTP_VOLUME_CTRL2:
 	case CS42L43_AMP1_2_VOL_RAMP:
 	case CS42L43_ASP_CTRL:
@@ -387,8 +401,16 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_BOOT_CONTROL:
 	case CS42L43_BLOCK_EN:
 	case CS42L43_SHUTTER_CONTROL:
-	case CS42L43_MCU_SW_REV ... CS42L43_MCU_RAM_MAX:
-		return true;
+	case CS42L43B_MCU_SW_REV ... CS42L43B_MCU_RAM_MAX:
+		return true; // registers present on all variants
+	case CS42L43_MCU_SW_REV ... CS42L43B_MCU_SW_REV - 1:
+	case CS42L43B_MCU_RAM_MAX + 1 ... CS42L43_MCU_RAM_MAX:
+	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
+		return cs42l43->variant_id == CS42L43_DEVID_VAL; // regs only in CS42L43 variant
+	case CS42L43B_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43B_DECIM_HPF_WNF_CTRL6:
+	case CS42L43B_SWIRE_DP3_CH3_INPUT ... CS42L43B_SWIRE_DP4_CH4_INPUT:
+	case CS42L43B_ISRC1DEC3_INPUT1 ... CS42L43B_ISRC2DEC4_INPUT1:
+		return cs42l43->variant_id == CS42L43B_DEVID_VAL; // regs only in CS42L43B variant
 	default:
 		return false;
 	}
@@ -597,15 +619,27 @@ static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
 static int cs42l43_mcu_stage_2_3(struct cs42l43 *cs42l43, bool shadow)
 {
 	unsigned int need_reg = CS42L43_NEED_CONFIGS;
+	unsigned int boot_reg;
 	unsigned int val;
 	int ret;

-	if (shadow)
-		need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		if (shadow)
+			need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
+		boot_reg = CS42L43_BOOT_STATUS;
+		break;
+	case CS42L43B_DEVID_VAL:
+		need_reg = CS42L43B_NEED_CONFIGS;
+		boot_reg = CS42L43B_BOOT_STATUS;
+		break;
+	default:
+		return -EINVAL;
+	}

 	regmap_write(cs42l43->regmap, need_reg, 0);

-	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_BOOT_STATUS,
+	ret = regmap_read_poll_timeout(cs42l43->regmap, boot_reg,
 				       val, (val == CS42L43_MCU_BOOT_STAGE3),
 				       CS42L43_MCU_POLL_US, CS42L43_MCU_CMD_TIMEOUT_US);
 	if (ret) {
@@ -644,13 +678,25 @@ static int cs42l43_mcu_stage_3_2(struct cs42l43 *cs42l43)
  */
 static int cs42l43_mcu_disable(struct cs42l43 *cs42l43)
 {
-	unsigned int val;
+	unsigned int val, cfg_reg, ctrl_reg;
 	int ret;

-	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG,
-		     CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
-	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION,
-		     CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		cfg_reg = CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG;
+		ctrl_reg = CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION;
+		break;
+	case CS42L43B_DEVID_VAL:
+		cfg_reg = CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG;
+		ctrl_reg = CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_write(cs42l43->regmap, cfg_reg, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
+	regmap_write(cs42l43->regmap, ctrl_reg, CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
+
 	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, CS42L43_CONTROL_IND_MASK);
 	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, 0);

@@ -740,18 +786,32 @@ static int cs42l43_mcu_update_step(struct cs42l43 *cs42l43)
 {
 	unsigned int mcu_rev, bios_rev, boot_status, secure_cfg;
 	bool patched, shadow;
+	int boot_status_reg, mcu_sw_rev_reg;
 	int ret;

+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		boot_status_reg = CS42L43_BOOT_STATUS;
+		mcu_sw_rev_reg = CS42L43_MCU_SW_REV;
+		break;
+	case CS42L43B_DEVID_VAL:
+		boot_status_reg = CS42L43B_BOOT_STATUS;
+		mcu_sw_rev_reg = CS42L43B_MCU_SW_REV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	/* Clear any stale software interrupt bits. */
 	regmap_read(cs42l43->regmap, CS42L43_SOFT_INT, &mcu_rev);

-	ret = regmap_read(cs42l43->regmap, CS42L43_BOOT_STATUS, &boot_status);
+	ret = regmap_read(cs42l43->regmap, boot_status_reg, &boot_status);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read boot status: %d\n", ret);
 		return ret;
 	}

-	ret = regmap_read(cs42l43->regmap, CS42L43_MCU_SW_REV, &mcu_rev);
+	ret = regmap_read(cs42l43->regmap, mcu_sw_rev_reg, &mcu_rev);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read firmware revision: %d\n", ret);
 		return ret;
@@ -918,6 +978,13 @@ static void cs42l43_boot_work(struct work_struct *work)

 	switch (devid) {
 	case CS42L43_DEVID_VAL:
+	case CS42L43B_DEVID_VAL:
+		if (devid != cs42l43->variant_id) {
+			dev_err(cs42l43->dev,
+				"Device ID (0x%06x) does not match variant ID (0x%06lx)\n",
+				devid, cs42l43->variant_id);
+			goto err;
+		}
 		break;
 	default:
 		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
diff --git a/drivers/mfd/cs42l43.h b/drivers/mfd/cs42l43.h
index f3da783930f53..a0068f6572e2c 100644
--- a/drivers/mfd/cs42l43.h
+++ b/drivers/mfd/cs42l43.h
@@ -9,7 +9,7 @@
 #ifndef CS42L43_CORE_INT_H
 #define CS42L43_CORE_INT_H

-#define CS42L43_N_DEFAULTS 176
+#define CS42L43_N_DEFAULTS 189

 struct dev_pm_ops;
 struct device;
diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
index c39a49269cb7d..68831f113589d 100644
--- a/include/linux/mfd/cs42l43-regs.h
+++ b/include/linux/mfd/cs42l43-regs.h
@@ -1181,4 +1181,80 @@
 /* CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG */
 #define CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL		0xF05AA50F

+/* CS42L43B VARIANT REGISTERS */
+#define CS42L43B_DEVID_VAL					0x0042A43B
+
+#define CS42L43B_DECIM_VOL_CTRL_CH1_CH2				0x00008280
+#define CS42L43B_DECIM_VOL_CTRL_CH3_CH4				0x00008284
+
+#define CS42L43B_DECIM_VOL_CTRL_CH5_CH6				0x00008290
+#define CS42L43B_DECIM_VOL_CTRL_UPDATE				0x0000829C
+
+#define CS42L43B_DECIM_HPF_WNF_CTRL5				0x000082A0
+#define CS42L43B_DECIM_HPF_WNF_CTRL6				0x000082A4
+
+#define CS42L43B_SWIRE_DP3_CH3_INPUT				0x0000C320
+#define CS42L43B_SWIRE_DP3_CH4_INPUT				0x0000C330
+#define CS42L43B_SWIRE_DP4_CH3_INPUT				0x0000C340
+#define CS42L43B_SWIRE_DP4_CH4_INPUT				0x0000C350
+
+#define CS42L43B_ISRC1DEC3_INPUT1				0x0000C780
+#define CS42L43B_ISRC1DEC4_INPUT1				0x0000C790
+#define CS42L43B_ISRC2DEC3_INPUT1				0x0000C7A0
+#define CS42L43B_ISRC2DEC4_INPUT1				0x0000C7B0
+
+#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
+#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
+#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
+#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
+#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
+
+#define CS42L43B_MCU_SW_REV					0x00117314
+#define CS42L43B_PATCH_START_ADDR				0x00117318
+#define CS42L43B_CONFIG_SELECTION				0x0011731C
+#define CS42L43B_NEED_CONFIGS					0x00117320
+#define CS42L43B_BOOT_STATUS					0x00117330
+
+#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
+#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
+#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
+#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
+#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
+
+#define CS42L43B_MCU_RAM_MAX					0x00117FFF
+
+/* CS42L43B_DECIM_DECIM_VOL_CTRL_CH5_CH6 */
+#define CS42L43B_DECIM6_MUTE_MASK				0x80000000
+#define CS42L43B_DECIM6_MUTE_SHIFT				31
+#define CS42L43B_DECIM6_VOL_MASK				0x3FC00000
+#define CS42L43B_DECIM6_VOL_SHIFT				22
+#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK		0x00380000
+#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_SHIFT		19
+#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_MASK		0x00070000
+#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_SHIFT		16
+#define CS42L43B_DECIM5_MUTE_MASK				0x00008000
+#define CS42L43B_DECIM5_MUTE_SHIFT				15
+#define CS42L43B_DECIM5_VOL_MASK				0x00003FC0
+#define CS42L43B_DECIM5_VOL_SHIFT				6
+#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK		0x00000038
+#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_SHIFT		3
+#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_MASK		0x00000007
+#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_SHIFT		0
+
+/* CS42L43B_DECIM_VOL_CTRL_UPDATE */
+#define CS42L43B_DECIM6_PATH1_VOL_TRIG_MASK			0x00000800
+#define CS42L43B_DECIM6_PATH1_VOL_TRIG_SHIFT			11
+#define CS42L43B_DECIM5_PATH1_VOL_TRIG_MASK			0x00000100
+#define CS42L43B_DECIM5_PATH1_VOL_TRIG_SHIFT			8
+#define CS42L43B_DECIM4_VOL_UPDATE_MASK				0x00000020
+#define CS42L43B_DECIM4_VOL_UPDATE_SHIFT			5
+
+/* CS42L43_ISRC1_CTRL..CS42L43_ISRC2_CTRL */
+#define CS42L43B_ISRC_DEC4_EN_MASK				0x00000008
+#define CS42L43B_ISRC_DEC4_EN_SHIFT				3
+#define CS42L43B_ISRC_DEC4_EN_WIDTH				1
+#define CS42L43B_ISRC_DEC3_EN_MASK				0x00000004
+#define CS42L43B_ISRC_DEC3_EN_SHIFT				2
+#define CS42L43B_ISRC_DEC3_EN_WIDTH				1
+
 #endif /* CS42L43_CORE_REGS_H */
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index 2239d8585e785..ff0f7e365a19f 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -98,6 +98,7 @@ struct cs42l43 {
 	bool sdw_pll_active;
 	bool attached;
 	bool hw_lock;
+	long variant_id;
 };

 #endif /* CS42L43_CORE_EXT_H */
--
2.47.3

