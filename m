Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4FA33438F;
	Wed, 10 Jun 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084082; cv=fail; b=DBAhCyH8Wv+X+iXvfpHFE8mEqvKwKDJkFtFnngtERvtZGpAeNxOEMXSPQuG2OyNX6lb3TGYQhvLrOEgyABL/yQjsPY3BgMixiUvT9t7uk9qz2E7yuilaHXeRnlX0JxJZxz1/uN9AwV/95nYwwc4+qezkNO9b7KL/WETNTVOPpRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084082; c=relaxed/simple;
	bh=ch5leN8M0NNFF2IkZS6b6mDk4r0mJ7ZWM3CkgNFm2ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jo5W+Yd77BNiGt0PGTusgD2lCUNx7gtk/ZHY74sjMsrFTHdxyjsH4P/7Ut4mr9yRdkpz8lHM4tW8Lw8pcK11nhhCq1Hajbw6mXxNu9NqO5sm+n5ma1koq/aMydt0zBJT9LDSac0xamQeXL4Te+UCeSRaJZg/P8XlpYFGBuxcw2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hs7X0YgE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WHIvp/kQ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hs7X0YgE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WHIvp/kQ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659NMmn21999339;
	Wed, 10 Jun 2026 04:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=R1VKEzQcoG29UgooLqn8jhEAQk4asvDjM6qYwsCe2kw=; b=
	hs7X0YgEJvwwg5tHuNB9qI5DuKWfaIl2RPnVRqB55W1yj7o1vVU0P+8icDcOgGPp
	OKPDbXYWiQ5tZLx4CAz9wvxmQ3ts+jjRXWbJh++IUrolbUuCXlU4MsMpxC7PhGKU
	fKVBTu/lAzx0vwnya3FKrQHTenncqYpaLAG6dJN7cuTqYYW7TM8oyQnt49AHE+g3
	0x5jduRLUVj3xIZgPea42ngP8hrBtfXnbwwjDJjB40OA1ANiD6KORv51NRzN7dsj
	/EGNd7oi+vcRQdZ1jf2wxXljN5vIQnSugoUkVDfhCMilQ2nSduA26NyRm2KdL+YJ
	SLgIISf7vcfNEa7rzuC1EQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022076.outbound.protection.outlook.com [40.107.200.76])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfyge1vj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 04:34:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYc3Pl3IFQ4u110gVt+j5Z+e1F3Y3G59FIPdcGaTInQfNfxoI9f899Q0UXst8vVogqjzk0KiRMom7gzX9/srF0AjWkNH+4YKMhtAraPnrtz9XMe1YrKsOgqeHA3ByQnA9IMeWuDZHVjiD2y9bX25BkgTQprHleZ3CzZjdFVHBnyfWro4qD1N8NdHIy9UeOJRSkeQYhf9C25fVp/XJz5wKkvSLAcl820vYucMyK2C63g1z8hsD4dDHsvU22yyzrXz8zwff/NQyxqMSRgGi+cYJVezZfcL7vCofj+wZrCUkpE/VcEUchFRm2iyLN1g7zu9Nyn75EDraYbRQTdXxmkZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1VKEzQcoG29UgooLqn8jhEAQk4asvDjM6qYwsCe2kw=;
 b=FYSDQjkKhvzdIrhqM9YT+azrq1rwyj30bec2EMyq9mo7JmS+BIYzB5AWcRio/zIhKpc5tCTr75mcX7wKultbPgoVnHevj57HZV2S7rXf9ytr1Iugbuti+xppLI138b+iKf4gFqksMAY6LLhfTo/583B78VfQlddQyNRfDmNLyKcDJJxEkXXEhN7LUcNqyzDblZZNlZ9tuJg4BdtpvByVXD9AuTcEydC/CyHWTa7XTNrfUP0n3nbiXvUODYLWSXYsiqp6BdDrbyKtojZAf6vnGlr5nfeHexkmJk7nsIleplkMHsbue50AKbHbGmYh6dJCfa++j8kHYOcNNuXCUks7aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1VKEzQcoG29UgooLqn8jhEAQk4asvDjM6qYwsCe2kw=;
 b=WHIvp/kQhx19qV703sWln2G/17/vBdZaF4qIh+cQSjaKSZEOcB6J+ZEB6Vi7SnQl4i84iDJvqrg5F+Y8/k2ulTBZhnScmDH+adOPVAGFOiZiShV1epSCpFoHRzi6becGwa4y7eOCHUYeWQgpMc2I+zVvpjHrxBTKCF3XWqkkUaQ=
Received: from CH5PR03CA0004.namprd03.prod.outlook.com (2603:10b6:610:1f1::6)
 by DSVPR19MB694306.namprd19.prod.outlook.com (2603:10b6:8:37e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 09:34:35 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::5c) by CH5PR03CA0004.outlook.office365.com
 (2603:10b6:610:1f1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 09:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Wed, 10 Jun 2026 09:34:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E86B4406550;
	Wed, 10 Jun 2026 09:34:32 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DA4CD82254D;
	Wed, 10 Jun 2026 09:34:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 3/3] ASoC: cs35l56: Cleanup if component_probe fails
Date: Wed, 10 Jun 2026 10:34:32 +0100
Message-ID: <20260610093432.557375-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610093432.557375-1-rf@opensource.cirrus.com>
References: <20260610093432.557375-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|DSVPR19MB694306:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 60d2dc19-8f03-464e-2252-08dec6d37b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|61400799027|376014|36860700016|11063799006|18002099003|16102099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Itn+IKxD+RsodNFcGY1YLHrCaCwDkxnG7Il5FdPNz23zJn9W4zkXxLapQQr6iSIG8LVGtIgzf0qAesUB/KcxSY44PdoeEMiyEMfgjdgEofnUwMw8u1UboBolEMFaAfiQDjzDMtpuxK5AnHQYstn9bSao1goTr+mBiM9CVtOi86GJGwcyFX/vvCJJYci5mhCaGJeA9eDROSyuxgKPyi/COFurjxIt/Vs//5XPJtHqHL/g9KkYg2+PIBCIsVVaOVIlDAVnnMhRST4UN53a9CWczlBzBCBJU49okeqV9Z1JDxXiw6f85Vb80PfLuUwaJIk4Bj71FeKiHsPyAGPvMvGoi5vhWR9FW+KaKundTRfGJNpy2rS/WOCUVrOR3HrHxzLgyKvti2tIp5oyxn7lm0ZoBXiId0vgVXVe+mcgK0NbtROoanV7mfMaij2tdakByBGfHrN14NHluu1TwsqoZhjqrjjjQv4ZPvEErXPQnZ+xWTISBFHYVkKdMwcgF6HQHjyU6uceS3h/xOs0mGbStyxd07W4ZfxzOhtUdnzwku8KsDdHqreIHienkJUZOIcy4SA23Wj9puNulFaGKOpPbI6Gg2LwmyFR+wV+hW6LTd6zJ6UgKoZMZHaN9X4gNEjv3mu5zynnuUcbmGP/oRfUdvyUAxjTd1s9Ie4Jhf1kbD+qvhshV9+e9cQPK2u29fuD4VrFgJ8Dj8BzlRBkv1CbmwvytTOlz+FKGw7h9OvujYU2lB4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(61400799027)(376014)(36860700016)(11063799006)(18002099003)(16102099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hoUlP2DLeLPXZu/OR98+eZ1YuoDnV5ovSeg2x2TuPIpCblTJvwcSS+qDHe36kK7NezfRuU1OpVl4Ylnwl2jdVdJo08fwSlokV+1Oy4D4arW+v4iXSlpqEh9X9760WyXRfjohdSzey9XR16PF9PClK4R+VhiNOXg7bzHbjPFCsvaB+L5gn4nYBN5yP+E52IVjxb/sIJb6QXeGHU4r8P3gidEoyY0wbmPgiqpCWLwbCNeQfw/ML5F4Ky+NqRVBUFL3XI3f0ARDY0bsV1q7jbTzf53Te8gRN2Rnu9GPLln10JNUn5FH2N934U7Q6KIS+TIZ8q0CjE9g+/WcN2Txe4H58z/nUKa/z75O5AiYKko3AnDLBUAprpp2mPAFtru1UqNsDQRr8Xk6KIKaTmd+Z6zJc8FFLB1zqQPnoZgCj5AycWM8BDSSaUG3+Xi8/QR37tsd
X-Exchange-RoutingPolicyChecked:
	Rpxol/23NfSkgiYD22xGAsVSwS7dSYPXA+jzWGmKHdtInLV8NAFQoDKNgt5+VNqOepvVD9nOaugeOmU44ftPe8eeLNgB2yIrDNHjhPFjlMwJbdPOV0/1Cxdv+FWhpbV/JyFEkjuvoZ2EkB8H+hWnJ5M6etWycwlsQDdhqrvyN0aeZpeqg2VbjiTZs8laaAdbW+POeuNBLYvQ3rUEYUxihNyGjHil1I6bwn5SLnE9q17xK/LWJOhifRPCv8wDs4wIMhVMJWU6Sqy9a2kR/u5OlFyAqPnQ22sSzYBZWYtA4j+5ndqhrnuUFqGGG+fCgmFuABN5r3MefpdkhhTsGxqPSA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:34:34.0453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d2dc19-8f03-464e-2252-08dec6d37b5c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR19MB694306
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a292fae cx=c_pps
 a=6VYWsXuvEQJVY5rZSrULAg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=oyzoAeJN7Xihzii7b-EA:9
X-Proofpoint-GUID: zhM9vN0JT8DOD52wm93YPEW3WVNwZTPh
X-Proofpoint-ORIG-GUID: zhM9vN0JT8DOD52wm93YPEW3WVNwZTPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA5MCBTYWx0ZWRfXxQFQROkLs2JU
 avouiKQPUceblyNxqHtDqFMqTlPBqw7kG9PFsWN/jUvO2zEaVxwBxNdVzGwba60B8N46Q8sq4p1
 lai3Uhp3+SrlUI6/PaNxjrRRTu60i4B9S9uZaZ+fPi/zWCzu2Zoz38X5ClM5dfoYO5hC3T/MUOu
 5JWUcV/qSgDH2D7UMKQ8VGqRZgZXEB7CtXWPnjGX6Td0A/cA4CyqicNziBXfOUkcFJNpJTt/1dt
 y4iv53MxNq6tSuEki4ZZ7c1slIRTiXRPqD9TBfa8ULCtVQfWszJnceEdLijrZoPWE2sA2z2d6Bo
 AXvuuKcj1yHjrk4T/T+WFIntBOHOvpwiZYgkZmYjSbvV9aUqmfInW3P7e4DCENHHhTw9YCnNT0W
 X7ZKUla5Z8xxJL8dOHvhokSM9QIPWCLtm706TUaCwgBKBQEUXmOQOd++MC7I1SJeKFCG8oUm3CI
 eyzlsywtn6YdSM3MFUQ==
X-Proofpoint-Spam-Reason: safe

If cs35l56_component_probe() fails, call cs35l56_component_remove() to
clean up.

All the cleanup in cs35l56_component_remove() is the same cleanup that
would need to be done (at least partially) if cs35l56_component_probe()
fails. So calling cs35l56_component_remove() avoids convoluted cleanup
gotos and duplicated code in cs35l56_component_probe().

The only action in cs35l56_component_remove() that is nominally
dependent on having completed the component_probe() action is the call
to wm_adsp2_component_remove(). Though it is currently safe to call that
even if wm_adsp2_component_probe() was not called. However,
wm_adsp2_component_probe() has been trivially updated to check itself
whether it needs to cleanup.

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes in V2
(Note: this was patch#2 in V1 series)

 sound/soc/codecs/cs35l56.c | 13 ++++++++++++-
 sound/soc/codecs/wm_adsp.c |  7 +++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 9dcbdf8c8054..2e3b5f5e33ba 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1359,7 +1359,7 @@ VISIBLE_IF_KUNIT int cs35l56_set_fw_name(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_IF_KUNIT(cs35l56_set_fw_name);
 
-static int cs35l56_component_probe(struct snd_soc_component *component)
+static int _cs35l56_component_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
@@ -1459,6 +1459,17 @@ static void cs35l56_component_remove(struct snd_soc_component *component)
 	cs35l56->component = NULL;
 }
 
+static int cs35l56_component_probe(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = _cs35l56_component_probe(component);
+	if (ret < 0)
+		cs35l56_component_remove(component);
+
+	return ret;
+}
+
 static int cs35l56_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index ca630c9948e4..baa75e7ff53b 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1170,7 +1170,14 @@ EXPORT_SYMBOL_GPL(wm_adsp2_component_probe);
 
 int wm_adsp2_component_remove(struct wm_adsp *dsp, struct snd_soc_component *component)
 {
+	if (!dsp)
+		return 0;
+
+	if (!dsp->component)
+		return 0;
+
 	cs_dsp_cleanup_debugfs(&dsp->cs_dsp);
+	dsp->component = NULL;
 
 	return 0;
 }
-- 
2.47.3

