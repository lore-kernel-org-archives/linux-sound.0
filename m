Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B333B47C6
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418161; cv=fail; b=Pp5ptVu8BDV72eMCc+38y7EPSRVz88aSbSvmZ9xPRmy9+hTHVz9wvd6sGlloAlRB8WhEEZKbXZGXuVQLjqiJywgnJZfVlMZmT1wRyxcMdWxTtgxK//gMXyAUDw5JoYMyaqkMhAWDOxAYseDqa7u449Cqo1P3T4KV3E2TvCgPdhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418161; c=relaxed/simple;
	bh=rNfcTrJ24qwEviRcZC5KUbt7kSQdtRZA81ri16a08O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwh8oJIGq3VrwIKvC2RiH9zj7YO+FiuwUJSv/yJCpvE7f9EkfAM4YiHwnYv8ID+vcjIK540RQ6U1GjCP/zKPoZVqRHz5xW2mW6H444DPx6PVhTol/fqRDfFxM0unceKG4DKUP2eyB7YG1yctFHWcGADD1YZBrZO+dZ6IfVAJ/nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=n6T8xKI8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TPy98Mcr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="n6T8xKI8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TPy98Mcr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D4x0BR2074754;
	Fri, 13 Mar 2026 11:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=D1Ryw4vllNZ8GNRjFUHlIT91AKvJOYJK7H73N7LM/mg=; b=
	n6T8xKI88TLUeDVSVxXWDUeYOYq9E0d/JnqnIVFQPQzZqQ3StzCovIe04Mqn0hYg
	jfNnaQYKLosj5M2qd72g2OpyOfdFN22onqLnyg5IvVkgcnjf4KE+fu2X6qBoC2Hn
	4WmOqiuDjHqX6CbLKp7az2CdRBQL9Tk+M3EqKMYHwxIambFsVMcV2nQj9Rb6ne4f
	qeQmPTmyseqpK2izJYa3cBQ/OlMhp3f8j3IXrOSq4MzdPhIUXk6L60ZCa2AZ3P+w
	Z3BlovLSFpX7ZTF/6uFN5BW9C17GVdHgnNbZGsnQynnzU7XpDLCaXoNBVjrItRUV
	VVC+9srJ4i6bBXuSmEXi+A==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020074.outbound.protection.outlook.com [52.101.193.74])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cuh78tmbj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 11:09:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXOm75STYqdJ1w4dp6pjlYm8BpmcMkuu80NrmdU91Vb70Fo8JFgJtO0b98SD3Pf+mH6EBF+fTzGU7oJ/euiVj0ZnrOOJlhK2q/5+1s1FD2A9EbFk+1P5WquyjeppHbFX2q7zwSqA8BmQMMgH+b6WQkrN0XJ6KdB3ZPMFIqQlVELE0BaI3UlU/qWiYXz/MnR4hJzWPSZbjDaabTHcfVV1yoL/dTI9AdKWGTfZaGzUt/OUO/1kH4DZvqSUIjITX7z5kiHLYm/S/M4slo9yobrDocYwp2KG9SD8KxcIN25OCl0JO83weg9HxDIhwR2Agpj46BeX6WCl2VLMMmPnjguGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1Ryw4vllNZ8GNRjFUHlIT91AKvJOYJK7H73N7LM/mg=;
 b=L9ActnnOiBHptLnl6PStE6vh6ySEuvSchUdmVxrJF5cx+wPaH4/S99dRF2R8+k5golUgYtYoq3B5/BtH7zwJonAZm0t1+A7xKdOwdyYGSMrqN6Lze9BYtsmLRXccLqhoM7t2uMiVp41MorNA4sgStc+nPwVhMW5SQLMLoETh4DkvbbGj8Lr6xsNfoYbIJJfoc93rItyU7M8p6tQ+fwM8zp7K2qwMv8zpXV7/8oPY9EOlXkkQhujxNjytg+tlGsNRGXgowu2YW00NcxaBq2EeqFanG4L7vHPn16TvWQIqlldf9Q5J/fsDebJZZbUigmjKvVowDmiTj+beDzi2Fc/D1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1Ryw4vllNZ8GNRjFUHlIT91AKvJOYJK7H73N7LM/mg=;
 b=TPy98McrJhPFPP1ZgJlzvchH4N/viOgf1gR+vq34oitYckOQrK8Oir6vVbP8G07IYFjIjdP9pBs8uiXj6NKYRlCm6Shdn+K8Fd0EO8NdS4b7NJ6qlyaLX0q1purft5/ErFY+xQxynV0oUcN8PNL6aLCSnOvulKXwDv3lxj9EPf8=
Received: from DM6PR04CA0029.namprd04.prod.outlook.com (2603:10b6:5:334::34)
 by MN2PR19MB4109.namprd19.prod.outlook.com (2603:10b6:208:1eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Fri, 13 Mar
 2026 16:09:04 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::9) by DM6PR04CA0029.outlook.office365.com
 (2603:10b6:5:334::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Fri,
 13 Mar 2026 16:08:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 16:09:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3A48540654F;
	Fri, 13 Mar 2026 16:09:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 34957820258;
	Fri, 13 Mar 2026 16:09:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: sdw_utils: Add codec_info for cs42l49
Date: Fri, 13 Mar 2026 16:08:58 +0000
Message-ID: <20260313160858.2022849-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313160858.2022849-1-ckeepax@opensource.cirrus.com>
References: <20260313160858.2022849-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|MN2PR19MB4109:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 237ba89e-19e5-4014-d50e-08de811ad89f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|376014|18002099003|56012099003|16102099003|22082099003|54012099003;
X-Microsoft-Antispam-Message-Info:
	W8eTICPgdkyjwxhGnO53PVaRsS3NK0CyHOIXSDaLXqIr/IOHiE/451th0caj02GOspvS10mxVfwBFbh1MZyyLt2Z2lMNF0+X8AhRIsiUwDG6FgVyTrSzcUoyLMmXPNokPziVhTFypvVBRcz2xyey1qFxdCGJJiCPV2pKWoZRFJFXn9Eda5AYLUQIFZ4YeeHs1ft91ZUoJn1nrjmWwJxM93zhv4LqVDwE6wJ48IajY1IziUbP8q4nf5CPSoJAwr1D+TCI/+f5iG8In61B4UvS8nDzDY+m0D98uZfsl4417tBFnKczofBSYIjVZrT6DacNwRQfMHp5WagOHqIs5ebiIhQATCixT0sJQM59g3M86xrUG+KLlo5V/NivTR9h0GMC+ue2dEUbJKHbO7Yo8BHIz6/hQHZG2ynuX9VL5LyK+7z9f1+5X+GNqrs17SItayejaf58zqYYW5H7ymic8asV6K6X/VbOI0cutzKGcEvUcjOJR/tHDQoASE2TmXf557AfEecglQ1TZJ3lo/lQa0zGU3VyDXb4FcD92TtqUeCGVrgxc4vsg5fVTUY05kQi3+QI919uUwUMPtvhOdSuCo8uyQWtxxPknHVN3vP6gli9hPu9NFoGXWU9OYRZ56l3PQxTt8oOPgQ4cgra0RA6DKR5c7cTSTMpUblzYvQajh9q2+f247z0ExSs1zISACOJH5LBGQ9xCp4ujaZ8DmIuGMBopsoV+njksIN90Bmeym6QeuDXAf9U5L/tfQBwtcBzOyZwSjChfCrqIfsRV+/zC2Zzhw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(376014)(18002099003)(56012099003)(16102099003)(22082099003)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HsC/SqnNxFBsCFkKG+Px2rCxSt2L+D0iIGiSmtKbgbj8d6qYlLzptLBsSNzINhTpwNE5cqCejDkmWWLb/ggXFgUqlrtjYGv4as1oB9aneL2PxhNJE8Ss0sACM7X07GbZFA17aJu6wkx7fDVYzGCEB6wZswFNTPMMKw0G+QvWCpR7487LY5Fm9aUL5mroXtOfza0ykdqzBrLRVbcmP0PrIWS8gYwyg9MbYKNgjTR6KOkPRfHRewLkEeI4cqHhj4qeE41970UK9mN7OGf0VGMT1DPu4BQW1T8pJedY5iCn5ztCkM6aLwGHbpcgc7nXbx8okc6pkLGCpX1a+7QX1bLU4MCqvmR7yOwIKX+373Qi9meJsY8LDx8SbU9oV795Us48sPxbnOpTYGicXRy0sGFnw+6qIzGJmUuxnnuECYahWKgb0iwo8iSltR3iMiRddcVu
X-Exchange-RoutingPolicyChecked:
	T1umpLw503CrEgq2MBNb8q8LfvgTSGK/bvpWiocfDO7J2f4PrPZMPmg8nL0Z4CdZjCR9aM2u+Ox6mFGtNZ+nWtwmOaKkq74zrUgUsEBemz2kPSvSquQqp/0G+uIL6iI25Umr/eg3XrDK9Q0wtiLb6afc/tBPzWsoRqQniH2XcGomWmi03WDZ3EExUP3GN5zXrk0zsWX2J4JNrN7IztUN4Hkdo572s+2xegBwWVOXckYbhrIoPnqa5Qm3rz2/FZqGNR3igvm623X1XC0YUDR5HBraUX55gCZQynJS4/5mGhz95Fq3+utUoazVMCKM56l5+Vm5gGjIFYHhjkDdxHZLqg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:09:03.3884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 237ba89e-19e5-4014-d50e-08de811ad89f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB4109
X-Proofpoint-GUID: 8QOOWeaYW2MmAmvuSXS6ekkxKPIx2huQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOCBTYWx0ZWRfXwkWZ0ACHO+3+
 hn1eOzeKdlY8XrxQvAJ9mNvVDVQo8fsz9mWF4DtqiJGkpi+bBdkxjFiYF7xE6uPBnSVeawLh1U5
 GfHGKeBftfsS3Kd82z4Mb4oFYOhc2WCx8LWK05X2dBEqLyA/7V3+J8pzHWcFS1ZYRJB/2z7Tk+Q
 uqBa1f/m48/uJvHxUex0HGtD+P4R5dJdvlUY3vaEwhqsO1FHWI6xu7H0d52xaOmCH0NPmc402LR
 AHMUHq+PYXdMCrjUcIPYjxtVC8F/NA5xgD4K9krDSEszUyRN6/GU+Q3LV7TjQpNU5AxQ5qo7BNu
 gIxgzNxKT/UaeYEigLfzn0ToydjEn46NdFvpjjfIFd8wh093+yOBReS9ZazftQYxgUk+U7zP6AW
 Y/P5Db7DhiIgA3ohwb646immg4lIv7I3RygP8Ol9JTMopRRqtKIxw1Ykd2Mu0BBp1L4MzUDqWzV
 24K6FVUA8mq/8WMqySw==
X-Authority-Analysis: v=2.4 cv=NMzYOk6g c=1 sm=1 tr=0 ts=69b436a4 cx=c_pps
 a=1AroyRkDHmFDIQmzFtfJ8w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=lj89cHpOfW1hPHQT6FIA:9
X-Proofpoint-ORIG-GUID: 8QOOWeaYW2MmAmvuSXS6ekkxKPIx2huQ
X-Proofpoint-Spam-Reason: safe

The cs42l49 is an audio codec with integrated MIPI SoundWire interface
(Version 1.2.1 compliant) with SDCA v1.0 support, I2C, and I2S/TDM
interfaces designed for portable applications.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index becc223282300..d1e98f95735b2 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -813,6 +813,42 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.aux_num = 1,
 	},
+	{
+		.part_id = 0x4249,
+		.name_prefix = "cs42l45", /* Use same user-space as cs42l45 */
+		.dais = {
+			{
+				.direction = {true, false},
+				.codec_name = "snd_soc_sdca.UAJ",
+				.dai_name = "IT 41",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l45_hs_rtd_init,
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "snd_soc_sdca.SmartMic",
+				.dai_name = "OT 113",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l45_dmic_rtd_init,
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "snd_soc_sdca.UAJ",
+				.dai_name = "OT 36",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+			},
+		},
+		.dai_num = 3,
+		.auxs = {
+			{
+				.codec_name = "snd_soc_sdca.HID",
+			},
+		},
+		.aux_num = 1,
+	},
 	{
 		.part_id = 0x4747,
 		.name_prefix = "cs47l47",
-- 
2.47.3

