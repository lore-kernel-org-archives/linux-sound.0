Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6C42DC32E;
	Tue, 10 Mar 2026 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152321; cv=fail; b=Fu56I9s5lFatYoKMHeBbb5KpIIW513xNrInK4IVF6W5AVQ4NV4WuWOQ+/ne7XQoj5TTifKrMM5oE9nYQxvcUujrpFUIxuFms63FbkBbdt9O3eB/MBpHPkM59g0unNlafTktoNUp3fTdL9RV3C3qSuajgWlkFnlRS9SZR7maHuHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152321; c=relaxed/simple;
	bh=RVa4liRSQFjR9DyEU9lYjA9d5wybKTL6vCgbuAd3r2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G9hGKSLTJ3W5FUhZFBcbrgl6uS0pS8+gWphPe2ZjHaeIPH78jC6ewnwliYBO4y/5Drr3tbqeLfUpsm4TlwWKmxNiGQriDLUj4czCZ5hdNmBsgXFrzpHS1c4yPUUZcGsKpgqTNdGYc1b2x8PTQfQM82w23K3Vqgis85JIC08ypEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=menMKX5u; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ah/5vcHV; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="menMKX5u";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ah/5vcHV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Kvbt72288204;
	Tue, 10 Mar 2026 09:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gSy5NgDEaQZ1apyUvzuaQYURYRvbJHlM95xopGdrJCo=; b=
	menMKX5uHy0xysJD0nwtVbDrIaqyTuJ040Dbw8RCcO0ysxWpt2U3/Jql6U87m50W
	6W5pqJkpAcJ/N9rzXOtXgETadWGpIi9T1QjeUATTMOzlesQsk4Fi9PcWlhV+VLph
	CyVz/8QIMSNCZpLegSjVNjY83FvKYHMzLKS6DdBchcqj6sbL5YLm+hljuW1QU670
	uOn5KaRWSmjvBBIf/R+u6VP019phsppUE3wkx9MWqTwGQP8ZnYbXMH4dtp26wxus
	2Y97ndcRp1w0tCnIqt54uY8400lk+Z4JTzlRPnz8qjFEg55rjQam8cttEg7Opbu5
	py3lAsokeKzZhdtr8rTAaQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020073.outbound.protection.outlook.com [52.101.85.73])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4bk28-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:18:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GP5B1ara4SwI8uu43jzqrfyhb+zymMe0o6ChJslCC/peEG/Vz2ZhY9UKh6AQfwKHrZrLin/1XyaBx86gGCJFmjiCOYMuU+cctJ5StAlSCkRhFA4PdMlJZoC7qDfOW+RThjyTuUPJyN8NCxKxwAgctv37wQ+z7LOLxCIaNXXGG5oyvml/jSBPA2TypOu9ixTR8OIVA95OScuRUEr7obWYyLcz60Hr482mis0CrKEFx9qrm4/PbGcI1Edt2gpByN+VFPTEuRzuNxoXcTyhcsQcEDhtyqfpSGOub2GbblPYCg9J+QCelVfaFPcQtx3DWZWwQObTkant6fvb/ZGROJHyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSy5NgDEaQZ1apyUvzuaQYURYRvbJHlM95xopGdrJCo=;
 b=awTKnOZHFT8TO7CZxYx0jkwRlkCga76sRZ0IY1XRDSPnIxzDIgTGgSTMRjXvsF5UKbypNoeQjr8xoEPom14iA2vHsNvgGKDGkCFIiYrju1AcPp4by1njX5V79ff/cXjh3x9AT0ILTA4zPXWDFim1LQmnTaxZWfZM9BdYR46c5tAar0N2PDpBjpu2d3F7iokbAzuZ3TLKRyWDirkPtEHam9CkOqS767uVKnHEQGU2Rnrtp5KPGGpcq8zgGfoBhyH1qPCC7N7xbkiWmTM5lcPSqZ1IKChEGdJIAYVOiiysNtVvF5Y3xTG7qtHLK+1SdQi8Q30vGuBtuDeoaQ1060GsyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSy5NgDEaQZ1apyUvzuaQYURYRvbJHlM95xopGdrJCo=;
 b=Ah/5vcHV33lIqA6/+0JCE9cSeUS3Yo3zURN7zyZ08RhrC26YcwxTPosVeiPP111Nd4HXGlhj/vAK4awQQT/hMY31Ug5GaLCJq37RrcDwMajEF+LtHNxxPdL//QEYZ9kSo4IZXL8DhLXt5VLfFz7Vqe+LvqZ+mgBKi8vOTuU8CUk=
Received: from SJ0PR13CA0208.namprd13.prod.outlook.com (2603:10b6:a03:2c3::33)
 by CH9PR19MB9466.namprd19.prod.outlook.com (2603:10b6:610:2dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:18:22 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::64) by SJ0PR13CA0208.outlook.office365.com
 (2603:10b6:a03:2c3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 14:18:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Tue, 10 Mar 2026 14:18:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C1E91406559;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 94E3A822544;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 06/10] ASoC: wm_adsp: Use consistent error checks in wm_adsp_request_firmware_files()
Date: Tue, 10 Mar 2026 14:18:13 +0000
Message-ID: <20260310141817.1871794-7-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310141817.1871794-1-rf@opensource.cirrus.com>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|CH9PR19MB9466:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3426cc30-160d-4639-6462-08de7eafe23b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|54012099003|18002099003|22082099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	0tE9L5dnZwhPwgtNNsuNI7+0GgnR0P2V7R6xkwPHHXitKM+EDe6gu3ZuQ84eNgPfXYoT599tOau8I4+yDZ9hfIin0nfYRFt6D1OV+CxfPNUJNeu5Jif1ZyunRNGf1DQlCoyvqHMgQp8l9znhmGe47dz0Ueej1mmD+DysI1fXAlteHSleYBDAnp7O8OIfMOeZ+pi/SPNal1j7pgv7oVeN7RMj892f6BABDi0r+vUQcWz40rQbVzp65vX1KmrxvGZeOMQlE2SopP+xV9hCnlmGeKrHwyDNYE7mlPXHXqoHp+oRVhyu3dht221dTcU9vzOFLqTuLDyF3E/xUAAe+tHo4v2q8dksXAOFW3ICAqCJMThC/C5VOJdXZdEUGz96GiIBoWIDBSLvAvJOESYmtc+yaUMUcrpWRmp8d+DMrGIRz6/1yMIR+DY1lPYHbPgQ/X7SvDflhI5iUlRXciOYDD35w2hI/SjcPYRFMO/k7QkaVpP+11T38kCDgjdlirsijDTEf3no04VhyyaF/js9h/dvgIyGACcRyqBWeF3IC3F6GK4HwyZxVq8v0KfySv9gv6Uz8FlWt4E7wJhG4d9WfHjvDkBzuroBSr5P7w6+94t4PKjZt3KCWXk1oYiSV9PMhAwgkXaxSCbfXV3spk3KUJh8D8zScFuC+C4aCGm9oyng+kpz4c58G8jH+/mL1T9xaeQLS57eo5GLzI7MKvnV9IpIuifqTRDJuze2KVtWzRLrnnFHFHb4OR+BXPQq23PZqlB14+1w3wWqQ95O+TScoPJCWA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(54012099003)(18002099003)(22082099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kwq4INd3vv+UXZYyNGVG4Jo27N4rY0g2bD+ne6EmO8Y0XzeczFYG0icdmnphFEHEhxDyJBAiGoRdRVhqM5jfy/dRfKBT05rm73GncRD0T0sv9qYieDAKkiaJJBXySpIh6t0tDK5JJVdRQ3gPgsCUFD4RlBH+DKe6AWuS5vtcoUFR2+ZG89b2gaCeaOcJbwAPj9HENcVNwn6ScVSzwhfLQIexhK6uftKzqWJlEEVnoJDITQgbmdiQZUkQ3tmNEkX0B6C/97y1x8ePgEzW/eGY5jz6nDqOCpIsoqhhoWz9WZD7u7JKOMhSp7Lz3uPb2yBxbTK9HwHbC/I9OGBvDMdnzBkdk6GtIgozoiqc43g5p9IpN81ks2TKRrcWF7lMQRfMrljcpDJzMe6ZHjUiNWGHAI3pNEIw5uZZB3fz5qIeXXz575zOLGcwtpBmNXk6Zauz
X-Exchange-RoutingPolicyChecked:
	Sm+VoJfl0HieAhNNvLxzjCTFhNq2g5g5Q7iGzKwlVGhGnrFntbHwmdy99tMlC+wDHDYa/wjbC1wm7UQqsOI2GNxlHaS4ewoOtPwPVUVRQEKaioVCaX0PixVM6VA239WuBpywkOCF4D8qGo80VSv+HcD+RyXWCZmmqTdBPJuX9atdyh8hurwqfZINW7dVboZXh3JzKUhdRQ1ip3zF3FUZzxvp+FABa4uYXazMcwtEZKFgNJVJbE5zAojE0Q6l1Jn+2VSYzVhA1lQhDmvULxmfYnVkqKUzVo3C5zmWnJzqMq8p6XrrFbv6afqw0o+aC9Bpo06Tz2TUj4hN780iM3aoXA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:18:20.9892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3426cc30-160d-4639-6462-08de7eafe23b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9466
X-Proofpoint-ORIG-GUID: UWgnhNCH2LIzboSowdd0Y3jwREsn5sf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfXy6sb306NiLpw
 6D25pLCCnBUHm1qPtVgMNxCT//viK70sNDoXCaC/U2NuB5cS5gucfiUcMTsC3w1wnkx9CljxOyM
 I7wq5ioJZ5fQ5IKXPxLVhqPrH/vXAXWA0aTxaCjHHmryN2qKrAJer/iu+GfOjaHgzG3diYPqwUo
 Tq4UHmg/ORlOUd1tmOVHa4pGMyqdRBxvNh7grorZ/aOvMquZ3vjwTBCf79+XuvPMG5te74hWPAc
 +IOygsu+VP3vqQYswGPRyf+jiNXkICXRJczDJd/rk5cEzLKXAqlHh7Q4eqACegUIa7wI+fk460U
 4I4cyQdUsBc2MmHfkCjeYiD8tyKmr47+JcN7trhqTcTO1Snaez9yogD9E2zOI+VfrMXAt9fgCHi
 fFyTlsTJTb0pFtDb9Nvnf3qbtvwRBv3NZeioM31OmJrFKJSivZvQ3RBv8tkhrhT1xQGfuaEYFsx
 ydTASjgwh7XHd5SX0wg==
X-Proofpoint-GUID: UWgnhNCH2LIzboSowdd0Y3jwREsn5sf1
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b02830 cx=c_pps
 a=n24abkD4YvNTwWi8vj4pqw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=HnQOalp4NFDXykVO3PAA:9
X-Proofpoint-Spam-Reason: safe

Use a consistent pattern of error checking in
wm_adsp_request_firmware_files().

- The integer return value of wm_adsp_request_firmware_file() reports
  unrecoverable errors, for example -ENOMEM.

- A NULL struct firmware pointer is a valid result. This not an error,
  not all DSPs require both files, some may not require any files.

Previously wm_adsp_request_firmware_files() was using a mix of checking
the return value and checking the struct firmware pointer to determine
whether a file was found. It wasn't checking for unrecoverable errors.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 92 +++++++++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index b904d1e1b00c..69e573507df3 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -753,7 +753,7 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 	struct cs_dsp *cs_dsp = &dsp->cs_dsp;
 	const char *fwf;
 	char *s, c;
-	int ret = 0;
+	int ret;
 
 	if (dsp->fwf_name)
 		fwf = dsp->fwf_name;
@@ -791,15 +791,17 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 	}
 
 	ret = wm_adsp_firmware_request(firmware, *filename, cs_dsp->dev);
-	if (ret != 0) {
-		adsp_dbg(dsp, "Failed to request '%s'\n", *filename);
+	if (ret < 0) {
+		adsp_dbg(dsp, "Failed to request '%s': %d\n", *filename, ret);
 		kfree(*filename);
 		*filename = NULL;
+		if (ret != -ENOENT)
+			return ret;
 	} else {
 		adsp_dbg(dsp, "Found '%s'\n", *filename);
 	}
 
-	return ret;
+	return 0;
 }
 
 static const char * const cirrus_dir = "cirrus/";
@@ -817,12 +819,19 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 		suffix = dsp->fwf_suffix;
 
 	if (system_name && suffix) {
-		if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
-						   cirrus_dir, system_name,
-						   suffix, "wmfw")) {
-			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-						      cirrus_dir, system_name,
-						      suffix, "bin");
+		ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
+						    cirrus_dir, system_name,
+						    suffix, "wmfw");
+		if (ret < 0)
+			goto err;
+
+		if (*wmfw_firmware) {
+			ret = wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+							    cirrus_dir, system_name,
+							    suffix, "bin");
+			if (ret < 0)
+				goto err;
+
 			return 0;
 		}
 	}
@@ -831,16 +840,27 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 		ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
 						    cirrus_dir, system_name,
 						    NULL, "wmfw");
-		if (!ret || dsp->wmfw_optional) {
-			if (suffix)
-				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-							      cirrus_dir, system_name,
-							      suffix, "bin");
+		if (ret < 0)
+			goto err;
 
-			if (!*coeff_firmware)
-				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-							      cirrus_dir, system_name,
-							      NULL, "bin");
+		if (*wmfw_firmware || dsp->wmfw_optional) {
+			if (suffix) {
+				ret = wm_adsp_request_firmware_file(dsp,
+								    coeff_firmware, coeff_filename,
+								    cirrus_dir, system_name,
+								    suffix, "bin");
+				if (ret < 0)
+					goto err;
+			}
+
+			if (!*coeff_firmware) {
+				ret = wm_adsp_request_firmware_file(dsp,
+								    coeff_firmware, coeff_filename,
+								    cirrus_dir, system_name,
+								    NULL, "bin");
+				if (ret < 0)
+					goto err;
+			}
 
 			if (*wmfw_firmware || (dsp->wmfw_optional && *coeff_firmware))
 				return 0;
@@ -848,19 +868,32 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 	}
 
 	/* Check legacy location */
-	if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
-					   "", NULL, NULL, "wmfw")) {
-		wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-					      "", NULL, NULL, "bin");
+	ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
+					    "", NULL, NULL, "wmfw");
+	if (ret < 0)
+		goto err;
+
+	if (*wmfw_firmware) {
+		ret = wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+						    "", NULL, NULL, "bin");
+		if (ret < 0)
+			goto err;
+
 		return 0;
 	}
 
 	/* Fall back to generic wmfw and optional matching bin */
 	ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
 					    cirrus_dir, NULL, NULL, "wmfw");
-	if (!ret || dsp->wmfw_optional) {
-		wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-					      cirrus_dir, NULL, NULL, "bin");
+	if (ret < 0)
+		goto err;
+
+	if (*wmfw_firmware || dsp->wmfw_optional) {
+		ret = wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+						    cirrus_dir, NULL, NULL, "bin");
+		if (ret < 0)
+			goto err;
+
 		return 0;
 	}
 
@@ -869,7 +902,12 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 		 dsp->fwf_name ? dsp->fwf_name : dsp->cs_dsp.name,
 		 wm_adsp_fw[dsp->fw].file, system_name, suffix);
 
-	return -ENOENT;
+	ret = -ENOENT;
+err:
+	wm_adsp_release_firmware_files(*wmfw_firmware, *wmfw_filename,
+				       *coeff_firmware, *coeff_filename);
+
+	return ret;
 }
 EXPORT_SYMBOL_IF_KUNIT(wm_adsp_request_firmware_files);
 
-- 
2.47.3

