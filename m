Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461A61DED5C;
	Wed, 10 Jun 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084082; cv=fail; b=YTjkcB7UxsPQFlomaQGYTBqN17pDLeiCWGvhBKhJTGFgowXMuMbrbdFXmwy3lPE4kp6E0ViVgCLFKEsdo/vgY5TmB1HUEDmro0xJwRnIhBDnGSeRhkGqYK5lWILZVk28FE+MndcnlKSdgxGnx8o5Q0xUCislwG5DD1J5GMp3Q78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084082; c=relaxed/simple;
	bh=lOQtEmDojlSMuFVLN2f4zHgzLwvXF4n+gvQqI3F918w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=grVAp2Ne/9sciu1Whoes3utfgcdNbnI31RTaGsHHO2GKsQ/YHUT+zmuipXSwLWB+C7Ewnrrx8V7qYp71NOg7J7NE2JJ5iZbt3P6H3HbZ9quv3iBMLG21h9sxnfaj6+kCmet9tEnigoNG6Dvda/hGkg/sZO5E1H0mpHcMX+M26kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iMz0Nfj7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MyQe6oTe; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iMz0Nfj7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MyQe6oTe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659NMmn41999339;
	Wed, 10 Jun 2026 04:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qZclqcS2oL9KtJFSkYiVVuobRydEipSt/K2XBKHPuCo=; b=
	iMz0Nfj7g1NrBtiBDDsNGa3/UN+PU3SoDQrTNbd9HDiGjbrRBD47nQCkqRSQ++Uy
	LUqTWw9frmHJJ0tgRZFgnr8wbJea0WF0lW22DvrI5GIAliW7bDLjX1/kxHdTvFGk
	UQNXmqhjBnE/RwGHubkeqXBKfFlHsCZIWaXfPEIebI6D6IOmTP0q/6TmTgmR9DDZ
	7FD5Hx1xCWw2PzHWIJN1ceIWzZ7Dl3SyXmKk/MCQWogvwuRw4JbcdR5bnRBKivOx
	jW8EX7m3Wp3s14+8W36onuOAddtRPvBGQmE/o56inloQnSrKnmUI0wMcsNfjMrd+
	w0GC0OTXYHnwl5oJbu/UUA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021105.outbound.protection.outlook.com [52.101.57.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfyge1vn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 04:34:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsCAw0Jn1AAOHyb4hy8mgp1XgR4zo++uH5Uea1F6p4aOrEN3N5WiRQkfJwFo8ni/LgoRBPEe+Bm6nBrnCoLFAQXqbAQMZHgcCDu2VAjkpXM/msP8YrqdDFqV2FjyuYKwd1nRZO7zGgF61suHYoRkc/c4xvY1fAk4bXV+WSEDVAEMcgdkqFHuJmuXILPBoLRu/TGh7wkY7CNtJ5nybRbD1F6sxlV+IjqOKVzDlNq6lD8CqAIxUm9RS/NHzn09vtzoLDK6qZ4/HMtN0YJytiG4S+oNxN6TiQ5vOjhsEH4uP3w5JPuKAIe8FH1hgMydV/bex4u2h1O8VlTaAfcukTcaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZclqcS2oL9KtJFSkYiVVuobRydEipSt/K2XBKHPuCo=;
 b=ESKIIwZNXHefQzrDTqwSQNOagKYlo3lq0EKqcAzXEFx0/RsJZwgBDF069hr17hLwQzJGqsKncdKUQ8s/etskE5dlHdIR/k238i7RjYf1mWXsrDj985L/XPoKRPlFO315d7Mf98XPylddDXzzOgfQyC3SvrvC0DQieW4Bi4DboKUV6aKdT79wfLInPpnHN9xXf8PAV3CaMrO5QjdSBTjoNU5FNEOgJ1yCeZWS8owa05div6QzgYrvn44e7kJWFie4zbQY/riMcwqrtftnJteGLQhEnf3Zuu5VFvcl0KJZL5fNWk9geuQ4SllneWMmoBvcV7ZNJGsaLnZNnfvjzTUSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZclqcS2oL9KtJFSkYiVVuobRydEipSt/K2XBKHPuCo=;
 b=MyQe6oTeJno/TtiMmU9XCl2axKzBBds0hnTQAM+NEC/4m3WDZ66+qEFywOD4Gsj5462pj2/FlfabGTvw/MEWBOTQMW4ePyeU4nMevGi4StVQEU5PjQfHr9ifoTfszVHXDtGtToF1mn6jH9ddB59pVb7ycmIQ3UMMz5sGSB//h8M=
Received: from CH2PR15CA0017.namprd15.prod.outlook.com (2603:10b6:610:51::27)
 by LV2PR19MB5816.namprd19.prod.outlook.com (2603:10b6:408:173::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 10 Jun 2026
 09:34:34 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::4b) by CH2PR15CA0017.outlook.office365.com
 (2603:10b6:610:51::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 09:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Wed, 10 Jun 2026 09:34:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E544E40654E;
	Wed, 10 Jun 2026 09:34:32 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CE67882024A;
	Wed, 10 Jun 2026 09:34:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/3] ASoC: cs35l56: Prevent double-free of debugfs
Date: Wed, 10 Jun 2026 10:34:31 +0100
Message-ID: <20260610093432.557375-3-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|LV2PR19MB5816:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0ef354ec-b06f-4b23-f741-08dec6d37b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|61400799027|376014|82310400026|22082099003|18002099003|13003099007|56012099006|11063799006|16102099003;
X-Microsoft-Antispam-Message-Info:
	VrP/KeJw3hNr9v3aUr0td9QV2i8FQiDjXZav9woZJqU8L2PzdKXpvloUjlHH3CmLDh40/pi69g7AkokdAy2G4FhcmGCO9sRwZp1VEwM3mLStxnpctlGuRI8fxvbxVxALdH4BH8fkrYo6D8Zv8U2PCNMYm2LZ9igUgZtGkRzREJY0tMOKcEewT6WeZ2K2CQJCQVoVkqCrdpsS1EDjDAyvXqAelYt5Ta2gEKCXeL2Z0kk1pdLrAAlSKhabAaE7hQWHqpeqelurknHncNGrM+weUr9ZNVV64HwQCAja8gK5lhXfnDSSylcFgvZWe1VCfgOWa4qWY2zTfWzyUFGIbbopyEbct+87aZnqCkpSR+EwdqFoWNjye83L9dszU8r7Ekak7zo3V0/3Lhvt0z9djgbLFcYebx5nK+pKHJZtAJg4Rg6eumT013RsdcU+dkjQdWJ3oq7LXXDl05RyCLtdp1lMsBavISo7IALel35q3fdckqRwr/0y/GYV0yPhCEbp4PM87I7BnAmwhhhbYlLIAUMGqNIL0lEO8ycx8ecCZsYs1DwI9T8puz0XOE1heW/dIBCmAk04gtFT4KmhO0PZMIkWW3vbTAfFwom5zvn6zmqtDOgl7tuvRbfl4w8of9rBnYe3zdWPqEAHho6yisTOlys3n8M1Q0k+EqJOb3/UJBkTZXw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(61400799027)(376014)(82310400026)(22082099003)(18002099003)(13003099007)(56012099006)(11063799006)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dYbzMkluQ576Z/Xih6Ny4C833331MQgoRnJFZZ8Yzu38TnDNj7/CABsYij6NOOJDQfyRLM7Ccm9LOYg5rbeUBIl+WjpL/fXnSO+8rVDDRuYGNYP8UezughS3rorVUBMyZV0FU2R1LO/ODx8zr91gTBrKPIiyK15tjrKiyN9dhR7TxUecSAHyMp1afMQyogg45IdJ3tHMIAW/RNr0vKmOp/ldL+txqsygWCtcUZPIP0ou0IRWCFMzO5NW4eJlAB6GtS53KRnBLIgu8WRdp2zdwT5KVvA2AZCJ4NpRxHRbdWtjHyRdhdhvtqBQmsx6SHeoke/d4QjbW7Q+XR5MSA6w1x/5Tyg6Chji1G/FBGIkC7+h1kPDYcXkt02JQm6GRjB3q5LO28CT1yBEboTqOYLhiews0GOMOv2G2yglisaplGmIQwlqp0C+v8lDVFeIqhsc
X-Exchange-RoutingPolicyChecked:
	AgjKbpXH4KV0PE6jD60XdFrBSZVsoDHpDbm/2q6yH7x8z3ULcQWXRnOKafTka+eODsdF6VPLY1Iu5f1nSL8FGMhd+rEkh8rxDtv4hyV0Wsnc/OH/NCq4IBE8L0JnQN8ChofXywWSMF4nv2krFId78Ht5kzIhyweS5eSQ15eFFvY4ktK1jKX7U+O7ItH94De+Lz7FxP/8/U9ATr7XIPXkdK6mp9ELEu6ffbA8fL/ZkgmxyB6KEVIqVcPr1IQXNWlDqqAmrVDnK3Mu+G4kmuP/rxY1cnGfhNykIwIHi+EYFhz83MbIhE9NFbmhRgU+7Ytv9mioQUDqFhB/BtbNHM8vtQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:34:34.0318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef354ec-b06f-4b23-f741-08dec6d37b59
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5816
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a292fae cx=c_pps
 a=QniOnCxoPMGPekFym24INA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=c92rfblmAAAA:8 a=w1d2syhTAAAA:8 a=aWhAjFa3aZ0QmNUXdHEA:9
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: HPZi4oxPAEx-hIIBEvFf3fPstQickwyH
X-Proofpoint-ORIG-GUID: HPZi4oxPAEx-hIIBEvFf3fPstQickwyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA5MCBTYWx0ZWRfX+LHFPnou5OhJ
 nD74tJsKueHRo3VqBkbHTqAZuH9h48jVcON2JJTBH1qmuOSW3cAL3EijOSm6COB8clvmA7e3/Xr
 lZd7IxAeFmAZrfVchY/Hab+BL0ns2PiESwon+gWU+x+cys2tQo09kfmS1Bwq1aUM/lcZHQ157fO
 hFG/SU111oMnBtgnkhIhl6+i9fe9phq4Nj8Teo0GM4F/UZmvgfQ1KJju5fVRYp/YpaOlrwC7i/T
 d2ThqWHAwf8AQw1ZSO/Mfvf9cyAOkLvHI1isWjCiH9PDy2WsrZGpUXp1fiL8+LAV3ipEb8peFJ9
 b0oeiicYunJmsJ2AQVSO0BDkEuv/qpnVGxI26L8Bl382OkGOLbMs7Szvr448ZopWbOvLahhpfce
 ys5jJocElTz6p4FSH16on7q81oK6O6nelRPvdYHUS4VD3g/xh7LAEt8NYFAm5sM8/TyeiWVHlJQ
 D2DviTjtYJFf38HRlIQ==
X-Proofpoint-Spam-Reason: safe

Invalidate the debugfs pointer after debugfs_remove_recursive() in
cs35l56_remove_cal_debugfs(). This prevents a double-free situation when
a future commit adds proper failure cleanup in cs35l56_component_probe().

As described by Sashiko (including the future cs35l56_component_probe()
cleanup commit):

During a normal component unbind, cs35l56_component_remove() calls
cs35l56_remove_cal_debugfs() which removes the directory but leaves
a dangling pointer.

If the component is later bound again, but _cs35l56_component_probe()
fails early (for example, if the init_completion times out), this new
error path will call cs35l56_component_remove(). This causes
cs35l56_remove_cal_debugfs() to be called again with the dangling
cs35l56_base->debugfs pointer from the previous lifecycle, resulting in
a use-after-free in debugfs_remove_recursive().

Fixes: f7097161e94c ("ASoC: cs35l56: Add common code for factory calibration")
Reported-by: sashiko <sashiko@sashiko.dev>
Link: https://sashiko.dev/#/patchset/20260609120738.284770-1-rf%40opensource.cirrus.com
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
This patch is new in V2 series.

 sound/soc/codecs/cs35l56-shared.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 8e3538e28fad..90e52a678e71 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -1293,6 +1293,7 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_create_cal_debugfs, "SND_SOC_CS35L56_SHARED");
 void cs35l56_remove_cal_debugfs(struct cs35l56_base *cs35l56_base)
 {
 	debugfs_remove_recursive(cs35l56_base->debugfs);
+	cs35l56_base->debugfs = ERR_PTR(-ENOENT);
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_remove_cal_debugfs, "SND_SOC_CS35L56_SHARED");
 
-- 
2.47.3

