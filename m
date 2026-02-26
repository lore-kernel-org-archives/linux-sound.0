Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B227332EA2;
	Thu, 26 Feb 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103714; cv=fail; b=pI/y4T+EiCAFZKMwHn6M/zw18x/kDXD+jjEcTga4J3aKImdTUozshdyn6tG0Z0yyS9kQ5G6RcjcimdUSRGzEmmYDCJcw6cvx5Mhu7KpV2henM9wub6S1AxOWxwoKCrPq8bH2rR4AVK0lg2DZGZm5mbxDn5v2I3tZHHntc8BQ6Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103714; c=relaxed/simple;
	bh=dIcCiJ/pJ7ZdIsvhT57GmX1zANMZB8w6Pa8DqqgJVIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NPGS/SgyQaPj/JPRAGSo7+XyBngBjeYpQ58VwMbypNsVFkfM9XatzlrgCiruCWLdUyMwrthRKqdxZnK5aAo7UmwHACZNF3A8PQYHtcuOpp77gg7brVDMxvmb//SUZzh17U0aGdURkkC0RaljDuT/IDqZvQnsr2JkvYIyKmAAVDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WdabOB4z; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HUV5DSLW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WdabOB4z";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HUV5DSLW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAQ7RZ574561;
	Thu, 26 Feb 2026 05:01:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Dq804sGsPjucQh6m
	W28HHvmzgAPs9eYOBCjrnINTwTw=; b=WdabOB4zGh9Hgju5WbzgFIjPKZa+e4A5
	+mBXmednr8z75hneD3luJV2E4pEYpDkpNFHCXRwHuSBgYjRRRE6sYyWcRmLDOGQU
	5CVkCfuVSm9dCfSTFRqpdDftf46/u0p2skoN52Iz6GdetE1JdSIVk3Yk9RuBwdJb
	ws1AGpIBpPDvz/COEMKv3ufJ4bVBTvYRxVFkmmPGOixZ7q/WxSlAgFBS9c0LfiCg
	25qLzfblPE9Pik2/7fH2Wtp9dkXaPMAMH3IZWjZO34JYJE+Sp63IaOVGyY6oKFjh
	v217oz/ry65G9WluBkpJ+e2rWqL9aX7gzVWaeaoHsFidA9oE9qE3Mg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021097.outbound.protection.outlook.com [52.101.62.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cjmds0197-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 05:01:46 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGNtN3EZ5agtr7jLLr1VGKmFT5RuA1U06HDzm/By4LtB2qiJTBLzh4DSb0L7nweaqMV2XRtl349VO9Y02bbLfQ8bZsZ53YLPrjdW7+rudQyUeZd50WUPqXMqcr05GDxi7W04KAt/U82rqH8Q06D2ybQETRmGx6gAA7CXnUVDly65QQDJZfzsXzId1S2QunZtCqfiFfAEVqXUEP4b6H0fX/A0Igi4FWjH4ijB9VpO5XzKuiSOFKiyii/nv/BX5kqHWOr1TbyK8njDBSpM8KlVCxb6YzfSEEgPy5JzdKoZWPGFUEVojbPF2BGW0H4SzrpjQjbtwPsjzQFwrxc/ZBlILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dq804sGsPjucQh6mW28HHvmzgAPs9eYOBCjrnINTwTw=;
 b=GqxuatJ6MPRgFJzHW1y1CyoKzX6Xp1pU96FOQQRu6Kl237kBdI2KbTa3Mg4G154whFZ2jFeI9w+vYpWZhsrAInxHrf8vzI1Yo5XFP3+paDEQ5KxFAtZRCFmVkP6r842lcQTKGlG9ND4AKOuC3e/NTQSAVzXpxAHDHhbtRmKERFLRSi31W0AuOFWJOhPtOKXKxfpdX8LNDHYc3l38jg9gVkTgTWM3RYICec/3/JvcnCvH+zv2YCXYbdSBt1IEIoKGeXB7GcTPwDuPbUOd/TQ3WwnFkh3j5GjUlgVjE8X/XT3xhdoWo4k0/fmxYXrqgd70adopy75SrpksRCaqWXJ4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dq804sGsPjucQh6mW28HHvmzgAPs9eYOBCjrnINTwTw=;
 b=HUV5DSLWrYATH12iRNejF4q+pvpJx0eiU0dFQdbPvu8TBWvhVsxQK3SsHUDzgmmqgznpUohDi3nf7/ZvX4BJ5R8F8CV0R23IaUQ02QkfTD3yOvmid0TXppWv9TxtzaFGRXCtOsVOntyVwoeeHLJlL/SHY51x8WswmePlAWCRogU=
Received: from DS7PR06CA0047.namprd06.prod.outlook.com (2603:10b6:8:54::27) by
 BY3PR19MB4868.namprd19.prod.outlook.com (2603:10b6:a03:368::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 11:01:39 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::17) by DS7PR06CA0047.outlook.office365.com
 (2603:10b6:8:54::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 11:01:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 11:01:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 84C3E406541;
	Thu, 26 Feb 2026 11:01:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 66FF482024B;
	Thu, 26 Feb 2026 11:01:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Only patch ASP registers if the DAI is part of a DAIlink
Date: Thu, 26 Feb 2026 11:01:37 +0000
Message-ID: <20260226110137.1664562-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|BY3PR19MB4868:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f5ed7a9c-0bd3-454b-f1c5-08de75266a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	+MjpI08qZH3XqSACpfpzsa3IT9CH6vq6IiwWUBFuZTwfjWQnhL9F8kwOyS32rVS8MKlKYUkbO/NKgNCtVvYjWs2g9NHksn28uSv9dbVlXTqKXANJJxV8BEn9vEM+a6JSoe0ae690zI8HZpGI55fZf0Jvcjc8K4g22bfJtMlxvvrI0ly9GS6oaEiwlGLhbR/XsFvaMB62klVoTTWwPZfoIuhQQW2q44mg3ifTL01RbC+vSv3/aZ9Ilk/IlJiIjJcrt8vDwTQ/wWCDeHwwGYWGUzkD5LMQCYY0bJTHvG2K7kJqx/1UKrNCpJdA1Q5XCzHEtEQLrDhizTtaQzUXNdlVAwmCmSqQr9STLN31OPLeSq2TU5lJ+Yd+bl9I3xdiItrV/yfrQHXW/VROVhiwswl1qSG+QXgUQ8Odrhdis/GvIulLXzsCWWD7XV47XCcmhsgXQeWYCaodKBSzKk4hFejuHA5PbXwayLBYnh7sXhenCZ4JyEhnk3IF7olZSYIgWkPl7MQAM+0e4bluAhaqvcmJE3dO3zMx+2sw6pSdlnnIVeinjyEpf2vGhgWTApuzqi2rjQKPiBqpt8ibaxXLaiigNxEQa3i9drNdNLCsgzcawtMjhurdi47PPqFVhjlE9aYKK7L6t0i3sAVemJHRcrpB3Acd+rEK/bYPrSY3YSmK8AexUKtccspEYC63oeGF3+MJjBv20E1SABY7UhPEXleqlHHnrGf12c/y41dPYH9+fuCjgv66TDU+quBtt4Q4eMqXLa1zE4Gxu0YF9mD4qMI+E6pwsJ/lE8Jg4haNYVzU8c5cLaCEhw4pZs7MwHkQ6eN7fbxHmurQIx5EXwZYWzzd1Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OYwFAzJlPzOuZ5fyPN8nWMfnU4oJPEfJC7H2ZJMoodiazkR7pbugeMhpyk/Ev+Hp4fE7+1i36ixgduQyBG01ju2ofCKNFa9U4ZnUCPX1Yp3dmg7JrU5HFPXBz2QUZWsf69IRlEBCVKyYxNP+So0ZaqB2BKnx+LT97IlCKJLjN31zH0v8VdsvabctOf9Md1EKLgFWflwZMAnkuXwgNU/8szy6D3SLvQ6+xN0ZkKDPBhNZiBDFYimA8fTxBPlfd35FPvf8CvoH+fYVvJbIugDx+5ZvMhCNaHxEqtHyWrU3kr444uIuuxA+4hkjlgEfW4smIHKey3X/TBe1wkT/aj/+Een2wNPUP+ro8a2q17/4emY4BKmCFny3AaK5oiptO1U95xXQxBwb0T7JizN7RjGShrmoJ3/WnxluAK//GB6aqK8xUDr8HloEQeyrTGrskOl6
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:01:38.8302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ed7a9c-0bd3-454b-f1c5-08de75266a9f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4868
X-Authority-Analysis: v=2.4 cv=dO2rWeZb c=1 sm=1 tr=0 ts=69a0281a cx=c_pps
 a=NYXyQfpeTqPs5I5uLp4fKw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=mmK4Pd7qel2wWiG4:21 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=KvJwkTUdnJGue8wfITMA:9
X-Proofpoint-GUID: M5WkUECOJtnUlkFDalNFODak7Xc1dhQo
X-Proofpoint-ORIG-GUID: M5WkUECOJtnUlkFDalNFODak7Xc1dhQo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA5OSBTYWx0ZWRfX7lbBWtl4fimu
 nMTiliDa5I7tmrQcsR3W6Y3ZxxCwX6pZbVanTfKVm9h8R+yV5WhavGGoMurjLLjmDxD2/j6Dh8c
 nIAZZgRtcbw5XWhvKusRDdk72KzC0bshXo4mfLE08uMvAuaHm9M++763c7VnPYQM1M2+WgvLm+X
 zmik55m5UkQ+GrxoBjEjdACmfjxlRbKW7iZYvFYNxsnGdkPkR22sN/IMSuxBIDDvhawnYSyMI1Z
 T78WrAZ0kTOnnCossYm3GplrB3+XflG2LfALetQpWEsdMhVFHem5/I0fQKujTwDor3txogtKgod
 rWuQQ0AdR6x6eB8DdUO6fboNF6lgiB4BEaQTpwmO2wju6wKWfnfPvLIsX4Ud2pCo52ans1JPgYh
 gZUOEJmcNkIH0atUdRx5IWMw1eHAq0JtW4vFv6MzQiSFbhAI7Jx+ss3WQnXsFKi/nsdXrh7EKp0
 XaM8xYeyKP8pxTkA1kA==
X-Proofpoint-Spam-Reason: safe

Move the ASP register patches to a separate struct and apply this from the
ASP DAI probe() function so that the registers are only patched if the DAI
is part of a DAI link.

Some systems use the ASP as a special-purpose interconnect and on these
systems the ASP registers are configured by a third party (the firmware,
the BIOS, or another device using the amp's secondary host control
interface).

If the machine driver does not hook up the ASP DAI then the ASP registers
must be omitted from the patch to prevent overwriting the third party
configuration.

If the machine driver includes the ASP DAI in a DAI link, this implies that
the machine driver and higher components (such as alsa-ucm) are taking
ownership of the ASP. In this case the ASP registers are patched to known
defaults and the machine driver should configure the ASP.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/cs35l56-shared.c | 38 +++++++++++++++++++++----------
 sound/soc/codecs/cs35l56.c        |  8 +++++++
 3 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index ae1e1489b6710..28f9f5940ab6e 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -406,6 +406,7 @@ extern const char * const cs35l56_cal_set_status_text[3];
 extern const char * const cs35l56_tx_input_texts[CS35L56_NUM_INPUT_SRC];
 extern const unsigned int cs35l56_tx_input_values[CS35L56_NUM_INPUT_SRC];
 
+int cs35l56_set_asp_patch(struct cs35l56_base *cs35l56_base);
 int cs35l56_set_patch(struct cs35l56_base *cs35l56_base);
 int cs35l56_mbox_send(struct cs35l56_base *cs35l56_base, unsigned int command);
 int cs35l56_firmware_shutdown(struct cs35l56_base *cs35l56_base);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 4707f28bfca24..af87ebae98cb0 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -26,23 +26,37 @@
 
 #include "cs35l56.h"
 
+static const struct reg_sequence cs35l56_asp_patch[] = {
+	/*
+	 * Firmware can change these to non-defaults to satisfy SDCA.
+	 * Ensure that they are at known defaults.
+	 */
+	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
+	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
+	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
+	{ CS35L56_ASP1_CONTROL3,		0x00000002 },
+	{ CS35L56_ASP1_FRAME_CONTROL1,		0x03020100 },
+	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
+	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
+	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
+	{ CS35L56_ASP1TX1_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX2_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX3_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX4_INPUT,		0x00000000 },
+};
+
+int cs35l56_set_asp_patch(struct cs35l56_base *cs35l56_base)
+{
+	return regmap_register_patch(cs35l56_base->regmap, cs35l56_asp_patch,
+				     ARRAY_SIZE(cs35l56_asp_patch));
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_set_asp_patch, "SND_SOC_CS35L56_SHARED");
+
 static const struct reg_sequence cs35l56_patch[] = {
 	/*
 	 * Firmware can change these to non-defaults to satisfy SDCA.
 	 * Ensure that they are at known defaults.
 	 */
-	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
-	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
-	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
-	{ CS35L56_ASP1_CONTROL3,		0x00000002 },
-	{ CS35L56_ASP1_FRAME_CONTROL1,		0x03020100 },
-	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
-	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
-	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
-	{ CS35L56_ASP1TX1_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX2_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX3_INPUT,		0x00000000 },
-	{ CS35L56_ASP1TX4_INPUT,		0x00000000 },
 	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
 	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 2ff8b172b76ec..3bf9e8fc34a22 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -348,6 +348,13 @@ static int cs35l56_dsp_event(struct snd_soc_dapm_widget *w,
 	return wm_adsp_event(w, kcontrol, event);
 }
 
+static int cs35l56_asp_dai_probe(struct snd_soc_dai *codec_dai)
+{
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(codec_dai->component);
+
+	return cs35l56_set_asp_patch(&cs35l56->base);
+}
+
 static int cs35l56_asp_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(codec_dai->component);
@@ -552,6 +559,7 @@ static int cs35l56_asp_dai_set_sysclk(struct snd_soc_dai *dai,
 }
 
 static const struct snd_soc_dai_ops cs35l56_ops = {
+	.probe = cs35l56_asp_dai_probe,
 	.set_fmt = cs35l56_asp_dai_set_fmt,
 	.set_tdm_slot = cs35l56_asp_dai_set_tdm_slot,
 	.hw_params = cs35l56_asp_dai_hw_params,
-- 
2.47.3

