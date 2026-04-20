Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D01B38423A;
	Mon, 20 Apr 2026 11:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776685738; cv=fail; b=cPuLfq4cUeX/Xf/bXCbLvH9W5EZfG5NkGVLt4+eIwV7AKpTzlhgafn4/vRl66/9Dn8wNgvZjpWNwIscMi5TU0Of5ItfkOSBEWw5YIInWcfymv1rB1AMsppHl603kYZEfohF0qbcUcxyn73YYOslWTedDBb4TZ5AoyaDIS6CY1Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776685738; c=relaxed/simple;
	bh=dwqJs+Exb2Pp8PBLj2+YoTMf+1VLFIc0XDXCbYaFYtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EG0u6WBGVB1Bmt+7LSw2dSB3SVMqLfNqrZP7CvQsYuPa/+Y3hCRyJK+YYUi6Tvt5TGN8fhxtYtKekC0nimmiW+7kbOeEb1cBTh3782e+mGevLZRRIE8SrVK7yTMreWIvrPbCN5RbTHQjPBSbp/QHP4VPsf/ihASr1zZAoePCkWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ikMgXhky; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cx6chzye; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ikMgXhky";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cx6chzye"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K5fHrE1613041;
	Mon, 20 Apr 2026 06:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=eZhQF12D1MzgNZlV
	S0D14Dgh1TO9gnUAk4okuPny9jY=; b=ikMgXhkynjeuqA0fDipPbuVUoeQv4mJr
	M0JcBMOC+A0AJcJxNx83wEgzOmnEaT5zKOb3Gjd01GzAAodXl8Hw7psgY3lL2DnE
	l7XDzE3i4rJMMth6NetzMlsD2+GioO/Q+7vHUhOLMr/RthKEwsl0b92xJT56S1z+
	UwXjwTbyCAZcHr5Buw2/0a6N81nyPliHkU0oiasHZY/AXPf0GxtBK6BmUg9UUXkp
	agwd9uDy2etboMV65dHFjwjBL+eozyCGKl4Wsx7SVuEDGNkecdD44fSEOerGynYh
	G+aWTlJOkPgnfTQKsIqrKI263RiA295qj55Hwcuvym5Fjvq4ZKCvaA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023124.outbound.protection.outlook.com [40.107.201.124])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dm6cfjd41-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 06:48:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2/Yq2jJ7W8YhbM5djaiO+c/E9IN5akfeTB8vWO7/HS4BlJEKvZng5KhNRM/6iZsoj/j0vS960rjLcokLEd/D053oFl56on7yjSeFj6sCUnrUyeDe8KkZ0NqKvyieeuXIdUILWnSK5tsmQh667uo6ltdXsGB2AECrkC7jBNrfjkKw8Xr6mvyf4zvkzJ38+1XdO3nCMnFzPPb13Mrk8s6qkXMYKsnlT6yTUx890fSCsuwYVx4tpSqkg2YEdxG1v7+cXNwUAn08509sIbXxw7MJ88fKOzjr1h4x67WWn2mYul+pou/1u9pCf5/qQohsy5zSY512kyYuhwx0UFrz8cOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZhQF12D1MzgNZlVS0D14Dgh1TO9gnUAk4okuPny9jY=;
 b=cjl2m4Rd1yBLCGa7HcSBAc2vAgy6uUM6Jh4jxcuJ9fHkJFWjaKNwvjsne/2jN3BVxQLRdjck3HEfQfPXqfos4u1xYrYyqRMP2EOyNZy7mmNIh2il+eAB5e3CFB3bUJ0+nIorZb/ldrg8840dUi//me4OntRwbV5mGtHPv1oBG7S0Lyp/imrfYHLmsBB+I9J1pxcFoMMp6+A+uEGUbGY0/rQOdfrFZHsXZxz3/2AMiFI6L8HQEl3oFB/53AQlKP02uK6+y+zwljfESNtQxSxcNYsRAmkUsQ7LbppwVSOSIDUcxcRqahnv8QsXLwDcJDR56EKhCMBnEAAEC+zHW1Sz7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=canonical.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZhQF12D1MzgNZlVS0D14Dgh1TO9gnUAk4okuPny9jY=;
 b=cx6chzyeJUIDkiPOmANSXjABy1cChbl4B1xrZSrq9FrmxcfOx4Bg6Ip0RZdGatHcO10oRk/4T40lqt3uE1jjGESBgbRHNJtW6ladY6T+2VoRqaINPioQcUGNJ9lpOJJTBFCVv9176v8pqAGSqhfT1N/hePXO44wrRebCUfI13HI=
Received: from SJ0PR03CA0365.namprd03.prod.outlook.com (2603:10b6:a03:3a1::10)
 by CO1PR19MB4968.namprd19.prod.outlook.com (2603:10b6:303:d6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Mon, 20 Apr
 2026 11:48:42 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::3) by SJ0PR03CA0365.outlook.office365.com
 (2603:10b6:a03:3a1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 11:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 11:48:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E64AD406543;
	Mon, 20 Apr 2026 11:48:39 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CD0E982024A;
	Mon, 20 Apr 2026 11:48:39 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Aaron Ma <aaron.ma@canonical.com>
Cc: Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v2 RESEND] ASoC: sdw_utils: cs42l43: allow spk component names to be combined
Date: Mon, 20 Apr 2026 12:48:17 +0100
Message-ID: <20260420114823.194226-1-mstrozek@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|CO1PR19MB4968:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 93dc1f76-f01f-4c94-6aad-08de9ed2c4ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|13003099007|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	jIPAr3SyRMia+nNnBegJvCVD/BHKmvy3qFL8L5vGJ4VIosjbX0mRD8dNJNVXxKkALHYnt8Rm7XL8fubFcn7ENcXF/io34IAZs8Ch7NWJzxwxQiGN+ZYexerzOsJIat/hjUSpfFUMKFFSso3XqWtnxN6Mvbo7DGJ3am1xqX3yHsyv+1KaoAPPc7WXLP4Qj0i68tupUOsjQADDXn1pxc5jOF/3BSXqzQ29zLZhEMajX62vOVWe6hnBXrIoToiU9dUON6hUS2uwOD07iqNQajDMACwSkssZ+6pFMKTMee7uKvA/TiAJhVHeWjm8TUjepJyn7ZFvNMUZ6IDJIFogbKm2I1ZjthHzLnE3qCSEt9atC+XFw2TmxASesCjLURtT/ap8bOJbw99cQ8DiRCT0dDsVofqhBB8xJhY7HXgy8cNKKOA0AyDLiMzoPDBfyFoqc50jzISpSwBCage/e3jKGxPfVonfyeCtKYEsVIe50Yr1Za/RjhO8EQbZaxGgMJDNLuW9FqKi/3RxLYCEprmvzQF4HwHSRQLrhKTkzF/vzJLbgKF9ivRT8b9iwLyitnPQB1dcS+r7X2YNkvHbAbf6UrPe1ThRFSnZtcSTGzsYuR6PU3LObCt5LpkoCGbAdOPiwTiOlA96J/TmV7xQuE/03vDJUmO6i1kiOY8B6S568gKFA/Rr4fHaF62LAWZuOlDswuLkLJFo5PC7yHSnqVSToO1JRehpwAao7dV9IF0Cn7HxgTwb0rk/PjfCWeios4S0Vx1Ca8QTLmvdeiNUPzCImlCq+A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(13003099007)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vqsvzs4O8cE76pmlvtpQX/SEzSOwJumcC7lsZrymNMs6HFdqBrGXotXq9N4wMiAC7HL5SSNVQUFLrk8RfRbVENHspE/gX4cM0UavMS7z/QQ6IvEexoQVIPo5MKgyhJlGpQx719SjmWNdnHbdnVChRrrDNxWN2YLLg3F+fWwgr31euIuSgEZJQXSHeT2cw9i6SkoNtVkatll+hTIt3WtJso31mTb+s/Tl9XOrV2ypmRrV+mt1i5viiS8eRJjYJnhpUDeId1DyeIFGDkl6zfV2UCOa3Y4Wdc5Of2bpXQ2R8y0RJ+eW+tVtjJUrEnnnxOHDSsa8/7XfPNz72h2hofISpg976aGjjLHBe2kM1N8I9ZB4QHOy1bDm+DOYlYWwPgpxQnzOSYSbcXxsxTFjABRM1ZHS3Qr+csmRpSU/vLdb091IG7lbt7SccVAOv3mJc4iu
X-Exchange-RoutingPolicyChecked:
	O3D+aL+aL94W3sFZQH6p8iv914BAJ+7RjY7rBi087PhU5L0voLgnuMAahjZuZRaCrha2hcgxFNzN/e5UMglsxvFz9UY5S5ue1iZ7IckBTEc+tyWa6dBjxFowKdWv1KwatSD7tm5QuAF6iczLHHq1tQNQtCIPrB2kI9lAjTFA3q0Qth9unZKRmlsDDYmuVbjHzdhuwi73UWXN1XZ6+I1nSRZeuW/nXcPupZXFRD3iztyQEzlOD0QG5QzqX0ZtOajEnG8lbaIznR3aiRRysYyRvc2N6gdQD2LvgQ+OqnMMvrUzp9VdmrxBe5NRS/Of9Dub99hDb2Lhtvmdc9l0tXxgOQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 11:48:41.3752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dc1f76-f01f-4c94-6aad-08de9ed2c4ea
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4968
X-Authority-Analysis: v=2.4 cv=EdT4hvmC c=1 sm=1 tr=0 ts=69e6129e cx=c_pps
 a=6mrLUOsRrbGUgCFc9Veheg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=NEAV23lmAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=lDUFhbT0FZI9Q2P5P-oA:9
X-Proofpoint-GUID: 5gSQ9VOC8RwUgl9EBv6xIRo6YjLf6Y5h
X-Proofpoint-ORIG-GUID: 5gSQ9VOC8RwUgl9EBv6xIRo6YjLf6Y5h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDExNSBTYWx0ZWRfX2dnnB1etaO5s
 ZyNIznefLq11MW8HhAijrbgFvzaLIMpQnZ5+EVa2SMAv0kN2lsJhbg41cOTKU3OKzFCdCVPPqqr
 f6jwqzL5MDlcxky4cuZaOvkRxhIGGEQXxArYIU6MR+ZLqRiXTtZ4Tcf+UAeamzVCDy8dEg58Ps4
 FtGRzq0BKkEy+0/GL2yO38h9SOKVcYQyDU1zFbvc4+jK6sldGbgnR4q8zUhXZHsfOM3GhDW+CfG
 nAX13caZiV08GHdQUZ95saQ5fsFrdnLUdoSPbdZV8ps5eGnnNXEZ0XLHqq9d5CCekSb6CyiMRxJ
 HHC6ZTpSdB0DSxTw1O4cSoYYAQl7MH4Ti8w8o9YQLOK82gcEim6y9QAluOCqzw2GIbVbwVCi0Ik
 b2Eyv8hZU/jSVNehMtJLDP4sZT541t5lJ0SrEq3lmoetjmZtIyyUjOmxlKahH0KBWFsUs7F0OEq
 C4IcuDEoR/f7JKRuM+g==
X-Proofpoint-Spam-Reason: safe

Move handling of cs42l43-spk component string into SOF mechanism [1]
which will allow it to be aggregated with other speakers.
Likewise handle the cs35l56-bridge special case which should not be
combined to keep compatibility with UCM.

Link: https://github.com/thesofproject/linux/pull/5445 [1]
Link: https://github.com/alsa-project/alsa-ucm-conf/pull/747
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
Changes in v2: use dai->component instead of snd_soc_rtd_to_codec(rtd, 0)->component
---
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c |  6 ------
 sound/soc/sdw_utils/soc_sdw_cs42l43.c        | 12 +-----------
 sound/soc/sdw_utils/soc_sdw_utils.c          | 20 ++++++++++++++++----
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
index 2a7109d53cbe3..e0e32a279787c 100644
--- a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
+++ b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
@@ -40,12 +40,6 @@ static int asoc_sdw_bridge_cs35l56_asp_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;

-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s spk:cs35l56-bridge",
-					  card->components);
-	if (!card->components)
-		return -ENOMEM;
-
 	ret = snd_soc_dapm_new_controls(dapm, bridge_widgets,
 					ARRAY_SIZE(bridge_widgets));
 	if (ret) {
diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
index 4a451b9d4f137..e99ea3c4e5dde 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
@@ -107,21 +107,11 @@ EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_hs_rtd_init, "SND_SOC_SDW_UTILS");

 int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = dai->component;
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	int ret;

-	if (!(ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS)) {
-		/* Will be set by the bridge code in this case */
-		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-						  "%s spk:cs42l43-spk",
-						  card->components);
-		if (!card->components)
-			return -ENOMEM;
-	}
-
 	ret = snd_soc_limit_volume(card, "cs42l43 Speaker Digital Volume",
 				   CS42L43_SPK_VOLUME_0DB);
 	if (ret)
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 2807f536eef0c..1637cc3f3d598 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -758,6 +758,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.codec_name = "cs42l43-codec",
+				.component_name = "cs42l43-spk",
 				.dai_name = "cs42l43-dp6",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
@@ -1104,6 +1105,7 @@ static int asoc_sdw_find_codec_info_dai_index(const struct asoc_sdw_codec_info *
 int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
@@ -1179,16 +1181,26 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 		/* Generate the spk component string for card->components string */
 		if (codec_info->dais[dai_index].dai_type == SOC_SDW_DAI_TYPE_AMP &&
 		    codec_info->dais[dai_index].component_name) {
+			const char *component;
+
+			/*
+			 * For the special case of cs42l43 with sidecar amps, use only
+			 * "cs35l56-bridge" as the component name in card->components
+			 */
+			if (ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS &&
+			    !strcmp(codec_info->dais[dai_index].component_name, "cs42l43-spk"))
+				component = "cs35l56-bridge";
+			else
+				component = codec_info->dais[dai_index].component_name;
+
 			if (strlen (spk_components) == 0)
 				spk_components =
-					devm_kasprintf(card->dev, GFP_KERNEL, "%s",
-						       codec_info->dais[dai_index].component_name);
+					devm_kasprintf(card->dev, GFP_KERNEL, "%s", component);
 			else
 				/* Append component name to spk_components */
 				spk_components =
 					devm_kasprintf(card->dev, GFP_KERNEL,
-						       "%s+%s", spk_components,
-						       codec_info->dais[dai_index].component_name);
+						       "%s+%s", spk_components, component);
 		}

 		codec_info->dais[dai_index].rtd_init_done = true;
--
2.47.3

