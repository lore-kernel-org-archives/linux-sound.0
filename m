Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FAD362134;
	Wed, 11 Mar 2026 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238943; cv=fail; b=H4tcfD2wlyG4eOPxRABIzd288OdcHPDCRbPyCckaEi+jaMspqXG0fQLHIxm/x6aRTZZskrQYIH2VYkqyMlml3/Oc4IZME/L53vu5EGe9Iu69dCPIYrMWi923gf7A8GLlIFteQgdhsuv3rgAxDh8/Qe3dgvPwg1GXHfhWuNMTKC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238943; c=relaxed/simple;
	bh=wi0oAphitFPvCW7WDT6EPiZCJlGw/J3QCZUuFBeSZ6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JkLVaLgEiMgZ49Q1P4DsGTSX7Jm4GTVC+6PAxTx/tyqSs3x2syviD9AsapHLGeq7b7YbVEZvyqYPL+6zZ+IOrqD5pU6Du1VZvi06obHJqZ8F2XjGV9s/uiYj/CQ5yt9CUQ5yCURSqBFZCBirg8E56H24AH5o1o1EQPD2y2NR1/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VXXnYXTN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DtvtruPb; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VXXnYXTN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DtvtruPb"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3xBEi3223547;
	Wed, 11 Mar 2026 09:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=tRGZ5CFoZzH70+dh
	Loo5RqOfyKIc0zmqq/WX4BUnepA=; b=VXXnYXTNrvIkX8b4QO0AkXFb3lhzVmIm
	woOSIlClVpisrE2EU9n5gRtwx604NsRDokchcNRR4xI5g8daBwMMP/B1GqcAf2m4
	yRr12Xf4Tih42c4rFyOhzu4ROMvBvSK4HZjPSOzC+cLHsqMTIT6axQ/FfC3obkfZ
	CoBlJvFJBuV7isTHRnHQCMwZ3tV5uAlJaQ8g6elRcgTddmLuBdRfKFLgoOc/+Kal
	lYsHR4Z0MgmJOv3MtShMvZxYbzxX/VFIMP5kJwb+QDfIVBvHy//hPjIrvxTxmfwc
	QFIZsKboek2Vkd2JzrLZFtBs+w0hZp73Kf+OeqQ12lItC6tml+H49A==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020090.outbound.protection.outlook.com [52.101.193.90])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4crhapdd08-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 09:22:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2rI44p7glhCj1fYpaIfgQly7xibxxZ9+pL4JWyICYH7PbajdPyWTX4IJ0qRZBBFo4/k2XIw6Qz99jNv2BFwNw/Z2fT7Zk52b+wT35NmKPzjgBxxt8wjzw3WNam1IPpAfG33syjwMwUjOHpKMWxxKO9CiIs4im51vXySZdCdbezulSn3yBjXN/yrlDV1OUC7z+Y0L1y895tRCpD1Ui/lFRHBnH4A1V/bsOVnSVcXv56RUQV1RwbJsYWaDnxyg1sb8AzAQw+8q4JaLOiwmL/2oJscYQkdDn+5XwtRIYRhMShX7CiExYu9tdFdyxMPiSMlxwPHeMgs04dM3v1yBcghSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRGZ5CFoZzH70+dhLoo5RqOfyKIc0zmqq/WX4BUnepA=;
 b=WaMm+hSMdkaND5TcW1nPjm/hrRT1nVr94KUSIggHj9M8xsSzuODpcGSQcMG8je0Cm5hxa8I0jQqTcv0MuJgP9JhejMm3as2mnCk6h0xKPCmNcjqwcVUFlwiUEdLZsXU7qqU1qUJrMR8PwROi7Z5DL2ZkRznvTA8F/HfCiP1Jk+3ljgxaQp76+2T2v7Fo2HEW2FOy7Qugv4AFaPh+qtKaHQsvvBpJATzEreu2g56LMu3VG5k+pOtNyCi3hi0SV6IutwQOHWFnyDmPjG/2F6BMztq8LfMod+4L2qICOLlfaQkBxm+vpMLOeCQUORnzoRXa2v44MlBBRoysm69fY8p36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRGZ5CFoZzH70+dhLoo5RqOfyKIc0zmqq/WX4BUnepA=;
 b=DtvtruPb/FcRdqZoovCUOeOm+20HHEPzPyGEVx+wALc7TxL5j9qtQjOHDNOgwPX7IniJByRzXQw7rUSpf2d5+/Ew+zuJJwBlqz3yknu6pJveZaWMZlK+deTEx1YAHVT0GI8LLPLGNmGsl3new8ReAy2pkmKOTVorzC2JH8DxrZ0=
Received: from SA9PR10CA0004.namprd10.prod.outlook.com (2603:10b6:806:a7::9)
 by PH7PR19MB6634.namprd19.prod.outlook.com (2603:10b6:510:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 14:21:57 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:a7:cafe::38) by SA9PR10CA0004.outlook.office365.com
 (2603:10b6:806:a7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 14:21:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Wed, 11 Mar 2026 14:21:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C8865406542;
	Wed, 11 Mar 2026 14:21:53 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BAF5E820249;
	Wed, 11 Mar 2026 14:21:53 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Support clock stop mode 1 if enabled in ACPI
Date: Wed, 11 Mar 2026 14:21:53 +0000
Message-ID: <20260311142153.2201761-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|PH7PR19MB6634:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 10b56c89-4268-4716-0ab5-08de7f798c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|16102099003|54012099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kksLLRvhUsulB33cHUsl4CEkzw0GuBnczCqAjriTlub6D+x8UhWyWL5YxagxI5njx1J4n96Fu7CdGStwojPr/TnwsD/3c9PvcK17JeTr7jaNS0YLBAxdZmFS922AanbfMGt6463kOFAiwydIXUNPE47yyH3aRbT6I6jFsPe/sQS8e5MhdOHN8ul85GfljBTR8i4hxdjAFqwT6qzqA9hMQpoQw3EUxReMtx/FKkcB6NpdJuEmSRIsSnW1urWwaj9W0dgveLt1kzzWP8gaPP1OEoFSsa0b9BnJgvDhsO/ArpZXcPTKd+p/kws+oddRDyVogX+eC/H0R0k5JdYHSTZz3BXgvfoQOHHfKpZbQ9xqTFr21MN87dFAujcQ2DmdqNwxdpVwYtTYlVWqCjcuT/dKlq7Q+Yr7qs+1frEog8cLK4L7CpuT8DSAybk2qupa4vKALke9r+Qz6r7bwGGh/PR8Gdd4qzR0fVN7vmuVkNXWoxQc/tj0YrhObrDFx2LWeByfMoV81NglDOZP7k9xBNPmOTBjsvtLA5AIHDd9e1Im/R3cCPXoIbZVTfGRBj9lEWIJmhi8VnagSdyf/IIZwDae00YzI9wkYb5Z+DgcXVbaawMSpNNpiscv4ufxy4z922vikWG70P0Ei/rphKoHETbmnaga/HbnYS2YcxOks6Rw55+XzGqJ5ATwc/rDsm0It9QraZXndNrVRpEywXc7hglDcxdYdOSUnnpkJsfOgYyChQlIomRbZmXZ97CDeqhsnRBRnsE6UBJysVcANXlmssjp+g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(16102099003)(54012099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OF6e0QcmFOx0X6KTT1LY/ls6n8D/JfkBW0oblEn7xIrM7PlXykaMDj+YgJr4X8xZdSltfHwiNW0r6t4LEuiJoflulXfadBUuavVJbsFCm4tYpS5Ko9ubcyGPgHSoXw1fcTahw0bJV0M7On13g0r99j93lVmN/nN10He2ipIWWs21YMOxnIJauqTLlryQgMEI0bvLaZw4mL/Jb+dQV6GN9PD+4mi/h+tsx5Rx4tHO6MP79qAI27ea/hpvJhYwE0ApOHHUva9oPtAKfdwRtQ8wCiVPtgoLS+4sn+5TjNqynckwIKPcIrMhSPvtei+za79bYOGNM4MLR5IoVk4VAMmqvK0bOzO6VahEGWutdlr0o47MtGRtPqPBD57EvBcgINJX+8wbnpffSSJ0STwahUS1U+i9o9Hpf9Gpl1EXI28ObfrD8E2f6lf98JPO3FJXgHim
X-Exchange-RoutingPolicyChecked:
	ohZ7YrlQNNPQnki5iNnVxIWOyt9eZalp1DMLz9KTzLMW0xfuxtfbG3LoVBJh4WR9CUXryKdK7K9QwRZaz+tCR8deOW1rkQPGKKyr5Ig+UZ8bHxJsUbStHaiMYF3br5yBR2+puFHrHGjtV9yKXOSt/TTbAIdrm1nvtjCzJtpPkMcvOAyUO9u493SvKztiAieEk21ZWCU20isakY1fUGjQaA6h1s17b8E3dLaXk25e5mbf5ZeDURVv3PCSLMZTwH+nWVpmVJeOM7UebYwdW7DEv8wtKQYo8uQQsdqiNs1VXbOOBAUlDiLPQhqFk+r8f3KuALWhU+Iy5XQPVrRwd2QQ/w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:21:54.9718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b56c89-4268-4716-0ab5-08de7f798c2a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6634
X-Proofpoint-ORIG-GUID: DklA670q3oGsCZ5wml_XzUDqE5cjouxs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyMSBTYWx0ZWRfXzOp8d9Jbudh+
 /OqUsDEHrn5bhHtMwJcPLJ9CPb2MJPlck1+/zytHfPW150f0gNInMlkLUmFdxLRvt0KB6L4bBSS
 pJZcFziQz+arXxYgp2O7ieg/K4LmKMXe0cPOAmYd3BsmEN9kBVNkkRr9lodS40i2iwInO5dKXuC
 KNWxvZSdRM//mJSUU7BRiuhlH24S/ga00EyDzRwtXzAg9yl1RtBZiHTPNWsF85cMNIOp8uNjy+x
 q/B3xz4gR3Jv8hwOINdRAOVW/riZGg7IJu6WQRRxVuEAFh2Yd7XiP7uD0sfsZv4g0jDh+lGTSx5
 yW/vBq9J1vQgpPgKnK45kDDCzBp1X0taOdh2z+QIP4ru4BzxYbBjvzfhlBet/nMcnjWjUPebzUD
 hEQNC5obSQk9fbgyoIJYaW2uz99I3uWrnvkkAtGK9/WxELooD5ug/VebQh0HXnpNgb5NQMy74zT
 nHVNe/Bao4+c38Cf2QQ==
X-Proofpoint-GUID: DklA670q3oGsCZ5wml_XzUDqE5cjouxs
X-Authority-Analysis: v=2.4 cv=EbbFgfmC c=1 sm=1 tr=0 ts=69b17a8a cx=c_pps
 a=hTY5Tzxx0J6bc07E+BihHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=uaOD1sLeJ99q_xYCTbIA:9
X-Proofpoint-Spam-Reason: safe

Report the ability to support SoundWire clock-stop mode 1 if this is
enabled in ACPI. Mode 1 allows the device to lose state, so it can
reduce power consumption in clock-stop. Also add the necessary
handling to wait for re-enumeration on resume.

This does not use sdw_slave_read_prop(), because that also fills in
other properties from ACPI that were not previously set by the driver
and this has been observed to break some systems. Instead, the
"mipi-sdw-clock-stop-mode1-supported" property is checked directly.

When a SoundWire peripheral has been put into clock-stop mode 1 it
must be re-enumerated after the clock is restarted. A new flag
sdw_in_clock_stop_1 is set to true in cs35l56_sdw_clk_stop() if the
SoundWire core notifies that it is entering clock-stop 1.
cs35l56_sdw_handle_unattach() will wait for re-enumeration if
sdw_in_clock_stop_1 is true.

sdw_in_clock_stop_1 will be reset to false when an ATTACH notification
is received in cs35l56_sdw_update_status().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-sdw.c | 34 +++++++++++++++++++++++++++++-----
 sound/soc/codecs/cs35l56.h     |  1 +
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 30b3192d6ce9..9dc47fec1ea0 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -14,6 +14,7 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw_type.h>
+#include <linux/string_choices.h>
 #include <linux/swab.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
@@ -340,6 +341,14 @@ static int cs35l56_sdw_read_prop(struct sdw_slave *peripheral)
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
 	struct sdw_slave_prop *prop = &peripheral->prop;
 	struct sdw_dpn_prop *ports;
+	u8 clock_stop_1 = false;
+	int ret;
+
+	ret = fwnode_property_read_u8(dev_fwnode(cs35l56->base.dev),
+				      "mipi-sdw-clock-stop-mode1-supported",
+				      &clock_stop_1);
+	if (ret == 0)
+		prop->clk_stop_mode1 = !!clock_stop_1;
 
 	ports = devm_kcalloc(cs35l56->base.dev, 2, sizeof(*ports), GFP_KERNEL);
 	if (!ports)
@@ -363,6 +372,9 @@ static int cs35l56_sdw_read_prop(struct sdw_slave *peripheral)
 	ports[1].ch_prep_timeout = 10;
 	prop->src_dpn_prop = &ports[1];
 
+	dev_dbg(&peripheral->dev, "clock stop mode 1 supported: %s\n",
+		str_yes_no(prop->clk_stop_mode1));
+
 	return 0;
 }
 
@@ -374,6 +386,7 @@ static int cs35l56_sdw_update_status(struct sdw_slave *peripheral,
 	switch (status) {
 	case SDW_SLAVE_ATTACHED:
 		dev_dbg(cs35l56->base.dev, "%s: ATTACHED\n", __func__);
+		cs35l56->sdw_in_clock_stop_1 = false;
 		if (cs35l56->sdw_attached)
 			break;
 
@@ -399,25 +412,35 @@ static int __maybe_unused cs35l56_sdw_clk_stop(struct sdw_slave *peripheral,
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
 
-	dev_dbg(cs35l56->base.dev, "%s: mode:%d type:%d\n", __func__, mode, type);
+	dev_dbg(cs35l56->base.dev, "%s: clock_stop_mode%d stage:%d\n", __func__, mode, type);
 
-	return 0;
+	switch (type) {
+	case SDW_CLK_POST_PREPARE:
+		if (mode == SDW_CLK_STOP_MODE1)
+			cs35l56->sdw_in_clock_stop_1 = true;
+		else
+			cs35l56->sdw_in_clock_stop_1 = false;
+		return 0;
+	default:
+		return 0;
+	}
 }
 
 static const struct sdw_slave_ops cs35l56_sdw_ops = {
 	.read_prop = cs35l56_sdw_read_prop,
 	.interrupt_callback = cs35l56_sdw_interrupt,
 	.update_status = cs35l56_sdw_update_status,
-#ifdef DEBUG
 	.clk_stop = cs35l56_sdw_clk_stop,
-#endif
 };
 
 static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs35l56)
 {
 	struct sdw_slave *peripheral = cs35l56->sdw_peripheral;
 
-	if (peripheral->unattach_request) {
+	dev_dbg(cs35l56->base.dev, "attached:%u unattach_request:%u in_clock_stop_1:%u\n",
+		cs35l56->sdw_attached, peripheral->unattach_request, cs35l56->sdw_in_clock_stop_1);
+
+	if (cs35l56->sdw_in_clock_stop_1 || peripheral->unattach_request) {
 		/* Cannot access registers until bus is re-initialized. */
 		dev_dbg(cs35l56->base.dev, "Wait for initialization_complete\n");
 		if (!wait_for_completion_timeout(&peripheral->initialization_complete,
@@ -427,6 +450,7 @@ static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs
 		}
 
 		peripheral->unattach_request = 0;
+		cs35l56->sdw_in_clock_stop_1 = false;
 
 		/*
 		 * Don't call regcache_mark_dirty(), we can't be sure that the
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 747529be3e2e..36d239d571cd 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -42,6 +42,7 @@ struct cs35l56_private {
 	bool sdw_irq_no_unmask;
 	bool soft_resetting;
 	bool sdw_attached;
+	bool sdw_in_clock_stop_1;
 	struct completion init_completion;
 
 	int speaker_id;
-- 
2.47.3

