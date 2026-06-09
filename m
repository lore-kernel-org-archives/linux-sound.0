Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92E440C5CA;
	Tue,  9 Jun 2026 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006909; cv=fail; b=VFr6snuxnPwKhtopgfhozdRyWwm6eocSCVkIZtL0Se1c5M/cNgXs3tK7N2gmEli0bLWY2545LR+TpwDCoLjVvECosI2UOCiPqPN0uEOEeQqXhAwtf03ZYm7VaQJgK9i95luXNvMHBJlgubrNj1zft06xsvlVfAjeKIZnMDLnboQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006909; c=relaxed/simple;
	bh=D8aehFyuQVOQ5ZP7oe5hdKLffHrRlYOjEr70/XPFaZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tRSdel9KMaebMbNI0wtTJ5Tudve089zq6V8KkI+34vc9hPURniqJgEkwFwS2MSRPe+g30TDz9kCg8BbkIdaIIsjU1ak/pxeibe0FgL+l+H0jXWJOGBOQC4Ih33yYZSetYWOYgbc5J1x+QIeraT9Q8Fq6dcIzZA6KTBQlUQavzfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=McEiwvws; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=I1HVB+Pp; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="McEiwvws";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="I1HVB+Pp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6594SjbP069109;
	Tue, 9 Jun 2026 07:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cFD1YW1YYIqSFp+DVtp0ab1VOOWvsuxdGs4rrm1flew=; b=
	McEiwvwsd04q+N//CCvoTv/k+2jScYn9vsap8evXnPeGhI7zVoBtlxt96orcnNdi
	7nSIfy0Msyx3YE4dcD2A7FJghPHjBPIBxTbqntTnhmlParvO4gkbyfd812CwrKcg
	OLHBzVJQbvirOpPBCu0diK1Nt75coekIG6Q1yfM9M0R9bd3M1RJ0x2TPtPQthaeP
	LU6hEBONumg/LN4dYVa8nD00Az4oDjYnT4IjqvZBT4p0j7QUBXRrVU5vTLgpG7g/
	l9hDpYbWrPtYnfDQpQrK/28eOzHCWZ4skuZ1YD+PMhqZw21JJfEo5DymGOBt+sTo
	PTeoDjS9zHFp1Y/KysaH0Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022121.outbound.protection.outlook.com [40.107.200.121])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfygc4s0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 07:08:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8Hi8DWxxDjbZYu2yO+9Xa+9p7+REl5QcqeNg+fg3VCQ5W6cGs+pJf2UvWSGI3KqAtguoS9rRRrjyO6x0oaVxOYEEqKQQapZXa1Bd5fJhFmFIFhiH+78xJEVch4b7HFXHUSYZyyyFEAe0fi9f3/jz/IhqeUjWNQ8KzbDojOSoxe0HlzqeblTfE7KwKwXFfPSh45B3LyDtY5LvU7r4dTZCWWt7oBawWaObXgRK3kOF0t/kshNwkCp4p1XwFV2WqMElVw+QjLSylMfdEnPlOGCAXr2wZCf3qVO5F7AhuNJZ6fnQdAJF9BPZ96zoK782ogbkBI5ihIQOOwNpS9FzHA/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFD1YW1YYIqSFp+DVtp0ab1VOOWvsuxdGs4rrm1flew=;
 b=dUC9MV5b6EarrKTllax74a8ani/XHjhMArxjiCczX4xB9RtbRutkaCa2y29zGNQ85UFzxZ7bkyrDym9cKvfq5zMEhWNRsoAoAYe4t/uLPuTm7keJVg6S7IuHZ7Gdr2K8tCXdCAcqDKgl8C5pynUWp/YqsuY9d8yi/HAHwGkmxHEaqh8sne16MXXiuwI8M0Qxs6CG0c6Le3fHoTGONN0rL6mRH5OMrhEAdwKdii1bZpoH44oyy9/YWcu1XUPcLf2gaShXqSfMHSNZ7XPV6jtruw7AUawwhztkgrFuNU6BokaAGBUuoC4e7wQSNuq8pfOBJ1e1A18K+84Sq+UthQRvMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFD1YW1YYIqSFp+DVtp0ab1VOOWvsuxdGs4rrm1flew=;
 b=I1HVB+PpQrOds+ryHvhxDxqYNZdK5GtUbHcV8HrGnOzChKbhibZooE0TdxsvnAflCjVbfjd0h8c+E5IWNG4w9yWLTNZ+y9P+Q8r7e+p35RLFfcearhZhw+5nJArrwFtHglyIS7UaWUVh/EEJEY+dWVQwdZOtTnJvwcc7gvBAZfA=
Received: from PH7P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::17)
 by DS1PR19MB8722.namprd19.prod.outlook.com (2603:10b6:8:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 12:08:09 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::65) by PH7P221CA0018.outlook.office365.com
 (2603:10b6:510:32a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 12:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 9 Jun 2026 12:08:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 296FB406555;
	Tue,  9 Jun 2026 12:08:07 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 153A382254E;
	Tue,  9 Jun 2026 12:08:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: cs35l56: Cleanup if component_probe fails
Date: Tue,  9 Jun 2026 13:07:38 +0100
Message-ID: <20260609120738.284770-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609120738.284770-1-rf@opensource.cirrus.com>
References: <20260609120738.284770-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|DS1PR19MB8722:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 40affac6-5ea2-4664-fd4c-08dec61fc546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|11063799006|56012099006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AHPtL4V/2dLyUDygk4EnDejXZ1mBfcDARfAxOSbJTgKzAftmEKMK+UmuqImOqTSFoNAuwU/k/ioaMLE6GJ5kFVVG1Q0RGZaKd+hiMnThNbUAnwOYMQ9HHm5k90em7U2zNAxT3//icMOJtYyNEd74cnFIUokPCw/124vhWnZgT1lW+BxQnbrXoA15phPhMjxjb6uHIN8gSCT6DGBsgrjC3TGaHtSmVu2QW0N6w69myaZpI9gLZwgY6iGnEnJghbvBOqJE+2P68eP6fkl7uxaY4fvigWNF38zJ8ltcd+lOBpXdyaTC+7cmisZ7sBM/FueIPIGn946zE6379bSrWurr6O5eEbDfaAUOqoO8pHCKkP7PDYr6tikzoRvW4LcRxLufF/mSkgl50+eoXqJb4VViaNt0/AEEzTziAF/PVqAvr9WGnYSKF85KWPV7E5Tpgz9VVX6WSNFxmXYMCBDEpGWnu8PkUuLIbAW8Bw1cN6hfDKydaE7hgdOwwo6b8qaNW7e6DIpsH02y2shbG0X2Ky5CFYF5ah4LLd62Os5YIH8nyYA45hXZo5uX7vj6jko2KTyoDRZ/d3N4ZV8556P8wHpDhlqoqM3b8bSZQ8QMe9V/lTqpjExbfxvrxQRSyGvC9KJV08ysXCmo5USQokV+8XcF7W9WSrwzXystYOZQ7TjFS0a8eMJ6Jb6KDRNw5WP9Egk7ywRD9vvhZN2MbGSeVyQgho0fXowTVqT8ruH/HC1m60w=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(11063799006)(56012099006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7zzj+9n055WRtu8zazsGWwnFKgqPLFtMcJ2IYgOVv67tuVTSA9O673uvObY00KAsiz+b7TnO+i15GBb0YdaT/kQyiFbc6Bo/ZzWLbT7Jb1tUeaO8Qgb68Iioe9Z2tN2PG5u5vXMWTprGAwa6zXcWkgu+Od8heNgRpPTXMKrC7dx1l+dz1rh9KjO6rWO2LNBkynhwpduATUHpMsWrK+r7dlWBAoK2WiUjWIhvhPseKrO6ebC12MAwXZpwHWl8rjLp2UqAGWwloAkoYbhduJNHSImGaUDyWMZZ1O6JpOKE3E1Bkfx+zfi0mq85JST5rYI9Lk1FgtGx8icWD4YHTfoZm+R8AIf3CQrIkPHFoH8WzVs7eB1zrStbv6xwxaGTHVSo0XMcSnzWlNT566lU9UhUnkzpyeqWec1TDNmgXWALLo6ohYK+Msvu2EY0S/hpiU7G
X-Exchange-RoutingPolicyChecked:
	mwXxpdhkJo/KasvwMyDbPECFmQGm5CdCgPqsYfpchFMcU4XYF+pRI/lNC1sVcqq8xz8KGJjOwSG1T+JeHKscQ2IdSRESDoKLiySMIuUHJyHdZBnpEuF4XPesJjT2MyB/IXKdrA3A5XD8oerv3aHMI+a8WmZejbR9L8GYeXwuWKYgRQg85nNC9gk/c/PtErbchwFwTFmB4kbKdgxLwHMuAive+zOjGZny+1p3GEHITOYjcQbb7s8+F5TL2xm2jrBspigdfOxgmXpeXkNd7yzoFu2OYKWXuWnmpcuwmLuAkah0TGd4vFlRxMNYfj4zvXEPpxWlQ6X7myC18w/gkWdOmw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 12:08:08.6435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40affac6-5ea2-4664-fd4c-08dec61fc546
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR19MB8722
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a28022d cx=c_pps
 a=PlzX2GN61/O3EU/AUs1JWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=oyzoAeJN7Xihzii7b-EA:9
X-Proofpoint-GUID: 2B74zJW2HHd6aQJoWwp4MwF9vTMzSJso
X-Proofpoint-ORIG-GUID: 2B74zJW2HHd6aQJoWwp4MwF9vTMzSJso
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNSBTYWx0ZWRfX0LXqa1lMJxJ9
 DJY8zc5BHajthUVeBMNWomf6t/PbVUKdHV5XKu8VGWfzqL2md+WbiE0oRKa5JgYxWi5etzVB/9Y
 WAE53rNkSsv7s07X7nwIFsoZn4sP9EWSrl3Dl2nGZqv2c3INkX6PqfJ0hmtmTQhVS4bvSSEEMpZ
 pPD0IUVdfxgQkYKb4zYvX+f6ohbpJV31EjkzoCd0EIre/FPMBSVd+BaPQBsLtGGTWLV6k5w+AkO
 kOeVe1Nvgjb1f946Wdqy1hQ0Ok5BcwYdqvtwRXkEVme68HNDhoxq4FiFGp7rLGwnmznSLHJifNX
 n/7Z3iBqyprJGoj5HFsBKc07vtLkaxlKX451AXNLxoeEaF/OOefRjWzdpNjsBj6GOF3tWsfLRYT
 OhCuqwOokaUmA+sze2FSG2XFEqMc9cGjdmEOHHhZrG4o5ljMT/vkQvAt1O6uZ6Gy0j1glcR6/1O
 95fs+fL/2mt0JvJxefw==
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

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
---
 sound/soc/codecs/cs35l56.c | 13 ++++++++++++-
 sound/soc/codecs/wm_adsp.c |  7 +++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 5de9cf3d0330..6e2d92ab98e1 100644
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

