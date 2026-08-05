Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B5537F8CB;
	Wed,  5 Aug 2026 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933754; cv=fail; b=QZQuTXoxrTFgzfD+JYG23P0dTXdrOLtasAw1gxvfqdILcXdhpZE1GFgvqoQeJ8S//7q0FKWumpSdNvz/fO6S+uAvD7MPKy4rjJDC/I/AL0r6LUdxZ9daZ0aPNKP/mRv0WS75gmbLbo5nquUg8TKdN3mYJ4a+trbCmwl0Hgk6X7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933754; c=relaxed/simple;
	bh=bGXvDz/YE2707nVxGk15vFEE52cz75Wirz8plv0beHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=abnkzYjtHvccl2DOzoI2HE3ea/NqxwZ6k/RbAM3CznbmK7BExVqQFFTtUMoYbBZhrzFhkJgLUgEmZyHEr0FksOmm+LWvvOehC389C3FOMnP5SAFheGrJa9j04zTXBzAZwINzpIIxbeVNakLvkJxsHCUypzhw+IDQc2l882VlyuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MBm/Ywfd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WfW2PDy7; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MBm/Ywfd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WfW2PDy7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67558q6f2591634;
	Wed, 5 Aug 2026 07:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5442IP5J+oqU37hNJ1IhE9rHKbfoOQplq/C7VWL25pM=; b=
	MBm/YwfdJNFSL7jUnDulat6V3HCUjlH1zx7li09dazJg7xkouEUIHf1xFqdHk1V5
	rb5LA/0vLvD2q3hRxXG24QB0hdhJIFkATQW/enzU1EXIYRoaMA7HI0D+z9RJ9qTi
	+oD9lztoM8hZQjtFcUqOGMeNvmQN6eouXNRde/xMGR23fbzr3qaJ0spkGewxm5xw
	TgPVybzPLInpBkGOX/5OaynO8v+jGx8N1qGnGuKfGcmg3AXnLGWqRTEuwhO/pIbf
	PrkO23jdvooyyHEQRLKw3rGFdHQDfm1T8r7A400KMjiQskb6ReGD62da5GuPWBzW
	EttHe+CSaeG33AatRQO8qQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020135.outbound.protection.outlook.com [40.93.198.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fsd7h5pea-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:42:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPU40Cq5HoL9xXcjYHULgN+ZTmxjhRWipI+Y5V+mDWfJBS40ZC94X11/Yq3mFHKIUZcxpgACPOdLhG/oYVS299nqHka5L5AV3hPZe2YjP2moUMbtbaG1rCUaAZfnYinCtoXGkcDvSR+2z7N4TILe8Fl62+Z7S8ju+CKU9Zr6EGjKb6thU8eMFV+G1Y+J+Sllm+jIcrp4XxEu4sw6/yp0fhP8XFpGLwHqBF3sOvLH3+Xa1yngaAha/48w5OOO1qFIsqapsAHXxPfZ89AwLo/M/+jG6lnaD8B9+8W6hn2Rcdr8iurO4P6/jdxXCefDvQcC08J98LUzLIykm84XxWljNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5442IP5J+oqU37hNJ1IhE9rHKbfoOQplq/C7VWL25pM=;
 b=n0rH5XbS96Oqdaj9SioKeJ9UnIZ37roQn95ARbiKe8g8gE3igtGAQ+zy3bwiMKGpvrog5VEDMSFwKRFEOvmoOAHvdvwdwIs8LYYBUcxBjC72DD50i+p/nWJRv0EXcl0D/9ciGNDyyVOVxEEprOBWs97lg9Id9WcKFoeoSGU3Ygs2s6cLmMTxTZK+vxuVbiIYi9ekixOm+A1GowUFFNsRcjn2nwB0REzS9Ndp0cqm2B1t9uQqPQDTu5ZVihw932tVbEETwWYjeGy4DaRadlv2xfMP1nGDNwz3RJBSidS4vw31ZEmP34+E0RPEN4hDRRWSNHeglidfWgO7+oXWKHylGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5442IP5J+oqU37hNJ1IhE9rHKbfoOQplq/C7VWL25pM=;
 b=WfW2PDy7bda7+L9VVEd9c5tmBISzrnpJcYtdBvybLRImN/uDXeJQriG3bpZMnLBhb3hdjKzyMSpPV9ts711bl3H/8jxxT+6mA2NtkoZxThR9WJcI7sYYbkXZg8oyL9quZdN6FrdFDmOkeQuJOUgvTAIupfweTtYdIW2IyQ3NyeY=
Received: from CY8PR19CA0025.namprd19.prod.outlook.com (2603:10b6:930:6::22)
 by MW4PR19MB6627.namprd19.prod.outlook.com (2603:10b6:303:1eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:42:11 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:6:cafe::ac) by CY8PR19CA0025.outlook.office365.com
 (2603:10b6:930:6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 12:42:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 12:42:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 86D40406550;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 705B982025A;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, niranjan.hy@ti.com,
        oder_chiou@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/8] ASoC: SDCA: Remove unused dev pointer argument
Date: Wed,  5 Aug 2026 13:41:59 +0100
Message-ID: <20260805124205.4152543-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
References: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|MW4PR19MB6627:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fab4cbd5-14d8-4c6a-dba5-08def2eef7fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|7416014|56012099006|10067099003|11063799006|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nLL84ln5IDLAxTU4xaqjHT2ND4RZuv1KohSmCXrE4b2rqH1F8EjaNCULwrUDavY71/slnqGj93LY3GwWCNIVI6XnA9WGUDyY0lskbUlgGwed2AoNjAagPGgARXHHhV0qe+pt3dfPt/pGNOoJaooSBtSvUi5Ne0YhJsOsK5Ob7UaBSZfcsJR1RzhRLu+KtE5mUAe8IIsGBViHZhwxJhSCnXlMfYAC3hnMVboxfDKN3GXpMgLo6HbfvGuISyKp5QTDBnkvwilyaxJzm0YfmiW3yFHu/IahpZeO1frWCL6v/+4zmh4zK25yTWIo0AYS3MmUl0ol4qgp3r1G8ZdzPScGvnTFNjEvvbgmNR3DE8w0mjIuUOxjLbnSEHJstQgleuGLNZnl+hFfKrxDXTFoQe7E/9TjcrrWdEAtx0k2VPaMnBVhZiVPHBCRAckODV/tcqj6hysZwQvh5hrFJUfnwIWtNJft1m8iIvW5alT8fHcEGq6ySNc/iTrELZre6sXraeo+h9Y68r4fznYvGBt4UiXTh0QKHmMDy6Mtoug3S5OyGPDDg29DNyk8pZJcqNwhL6GCHkfFUFZTHBMrpRptehdV2KqccudhNmWRB7tCE+ishdPc/Ks+ZxVfKOlovjJpRLVxZc507MuvpuJb0+9Zjv/pQaM0e53jhaqLFN7PBipruM75GYYzNUjgyvWHP0QLci6J/v5BVPNwm8hOblYOTOFGvg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SPgeJP6BzKVHL6Z4FVlOsPezq+HjF3ovbsZQrG+zrAADYhn9Kgqm3D+zTwZcg38z8YzZiCR5XPXR6vBdLhPbRQawe01So7dEmx6r3nTw+oalIg2BeBwTkfywHsSIac72s3tjhhoe1jN7Vdo4DMhKkW7SqG0r/SXpMUaeF9HJRcdQTLDIKPFX+2ldOnZTsS0kYpm8ENtNgBG58obzUlDAJK3huCwX/wCGFLhnB0UauNY/2RE6PfTOCJKi74PnauFf/5q7Ak9gogIXxc5zh/lGF/i6m8eFRx3VyxqUeMRXqI43vJGzmTFuJmpPktu7/XZM5us1FSE0BdQCKn8FuT+LfKM2vuTem1ekkQXwAK1IjNoV2ILjOmxlVjQ13kDK1jRMRos9J1oQ91nKHHCl8DnmZByLZvaqc5J23E9xhCCZ22lJmV0vCLbFaq3Xx7udOsZ4
X-Exchange-RoutingPolicyChecked:
	pJH+azWZ1KEFEmgAcs1Yq59EoD9ejoIjcdMUJF4Hr/SgkezORz0NXpyZFZRCw/Nf3FxGEKyDrFXy4LvDy/Coc4XrkkdvpAXLu4fZkaC9Hi2UJrRDMKpORVaaag/JihXqgnpaAl1fYBLJ9vkYhltSVQPRxYzsJURuzA+rVZyiLMuwVLKOZNPESNwwbIH3T52zMFPyqe32g4gg2Ga91qy018HDDfgNUHslYYHwuw6Qob3zCC6nxYQ2iGchqMlwjJmkd10VJTYKK8ym9M1MtvTxxJR8KVzRFRNnp0gIQEudKTfPt1gvAMWS1/GdqcH2l0COYJmSy5lI2CUn4C7qKbe9kA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:42:10.7096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab4cbd5-14d8-4c6a-dba5-08def2eef7fe
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6627
X-Authority-Analysis: v=2.4 cv=ZK/nX37b c=1 sm=1 tr=0 ts=6a732faf cx=c_pps
 a=xM+CCxkBm3QG079K+XzSvg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=cEkl5-0BztOq5w2XeIEA:9
X-Proofpoint-GUID: 2ho88HtzaOgUDNZEaNY8coM5XOvPEzbG
X-Proofpoint-ORIG-GUID: 2ho88HtzaOgUDNZEaNY8coM5XOvPEzbG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX5ioAKx0/I3pH
 uOYws4wYX9a5lvz3wa1iN6TSE33kLU9ssHeAuPBWdOmHN/D7z/m30QSvb4VwX/oPFvcL+qd00Fv
 Izu6uT5kddDcZn4LJlLAZGR0kHEfwS7zwDhUFAFXGdFsCh7pjN7EVTd5O3I2nh1dHcirxfVGqJk
 v7rQbDJjuiUViMlUjrdG8xspO0IAC1wLS/VUy0pvsh+Zc6zGXLpVJ4IOhd6tCoLHTvLYZY2HQyi
 +Y1hLjsbH81r8bZwrO3P8DsviwIUKrCNRexSYuU6u4mEJ9Hij9ZRMWAeUKeq5hg7xpJRGfDDzWb
 XdLjxmGysJii1Aeb7U+pcw0jYfP7zT8ELY+En9g4waGdthrHea3CKj7DKi+wgjKOUKDBy1rejyW
 qJjLMiU4Yy4xeq6q3xO8PUd1mbJtjz6uNPULAg9ZBGTREj2Ny0pyOSErfgfWK/Rvk5Lr8W8EwmZ
 zmNJEonKAhfDv7nQxHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX6iPebq0QQjDH
 2HCeJmP80cAiu+aM/mAp3FfArYGyw69jUMg7JKzGtXGhS0C5FbFiQ4WjMd4Uy/7w11UYQUgl555
 vZ5XCgLt5i6sJe8VOQzj42Yq6nA5Pmc=
X-Proofpoint-Spam-Reason: safe

Remove the now unused device pointer from
sdca_asoc_pde_poll_actual_ps().

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_asoc.h      |  8 ++++----
 sound/soc/codecs/rt766-sdca.c  |  2 +-
 sound/soc/codecs/tac5xx2-sdw.c |  4 ++--
 sound/soc/sdca/sdca_asoc.c     | 11 +++++------
 4 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index d3024c3b38b9c..599a72f335153 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -107,9 +107,9 @@ int sdca_asoc_q78_put_volsw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol);
 int sdca_asoc_q78_get_volsw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol);
-int sdca_asoc_pde_poll_actual_ps(struct device *dev, struct regmap *regmap,
+int sdca_asoc_pde_poll_actual_ps(struct regmap *regmap,
 				 int function_id, int entity_id,
-			    int from_ps, int to_ps,
-			    const struct sdca_pde_delay *pde_delays,
-			    int num_delays);
+				 int from_ps, int to_ps,
+				 const struct sdca_pde_delay *pde_delays,
+				 int num_delays);
 #endif // __SDCA_ASOC_H__
diff --git a/sound/soc/codecs/rt766-sdca.c b/sound/soc/codecs/rt766-sdca.c
index 49ee9cef5c541..4c5acd950d70f 100644
--- a/sound/soc/codecs/rt766-sdca.c
+++ b/sound/soc/codecs/rt766-sdca.c
@@ -616,7 +616,7 @@ static int rt766_sdca_pde_event(struct snd_soc_dapm_widget *w,
 		return -EINVAL;
 	}
 
-	ret = sdca_asoc_pde_poll_actual_ps(component->dev, rt766->regmap,
+	ret = sdca_asoc_pde_poll_actual_ps(rt766->regmap,
 				   func_num,
 				   pde_num,
 				   from_ps, to_ps,
diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index ace06f5ab58c1..ea0408b71713b 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -800,7 +800,7 @@ static int tac_sdw_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = sdca_asoc_pde_poll_actual_ps(tac_dev->dev, tac_dev->regmap, function_id, pde_entity,
+	ret = sdca_asoc_pde_poll_actual_ps(tac_dev->regmap, function_id, pde_entity,
 					   SDCA_PDE_PS3, SDCA_PDE_PS0, NULL, 0);
 	if (ret)
 		dev_err(tac_dev->dev, "failed to transition func %d, pde %d from PS3 -> PS0, err=%d\n",
@@ -847,7 +847,7 @@ static int tac_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = sdca_asoc_pde_poll_actual_ps(tac_dev->dev, tac_dev->regmap, function_id,
+	ret = sdca_asoc_pde_poll_actual_ps(tac_dev->regmap, function_id,
 					   pde_entity, SDCA_PDE_PS0, SDCA_PDE_PS3,
 					   NULL, 0);
 	if (ret)
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 03486d1c1b2f3..ce2e7c2707657 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -364,7 +364,6 @@ static int entity_parse_ot(struct device *dev,
 
 /**
  * sdca_asoc_pde_poll_actual_ps - Verify PDE power state reached target state
- * @dev: Pointer to the device for error logging.
  * @regmap: Register map for reading ACTUAL_PS register.
  * @function_id: SDCA function identifier.
  * @entity_id: SDCA entity identifier for the power domain.
@@ -389,11 +388,11 @@ static int entity_parse_ot(struct device *dev,
  * polling times out before reaching the target state, or a negative error code if
  * a register read fails.
  */
-int sdca_asoc_pde_poll_actual_ps(struct device *dev, struct regmap *regmap,
+int sdca_asoc_pde_poll_actual_ps(struct regmap *regmap,
 				 int function_id, int entity_id,
-			    int from_ps, int to_ps,
-			    const struct sdca_pde_delay *pde_delays,
-			    int num_delays)
+				 int from_ps, int to_ps,
+				 const struct sdca_pde_delay *pde_delays,
+				 int num_delays)
 {
 	static const int polls = 100;
 	static const int default_poll_us = 1000;
@@ -451,7 +450,7 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 		return 0;
 	}
 
-	ret = sdca_asoc_pde_poll_actual_ps(component->dev, component->regmap,
+	ret = sdca_asoc_pde_poll_actual_ps(component->regmap,
 					   SDW_SDCA_CTL_FUNC(widget->reg),
 					   SDW_SDCA_CTL_ENT(widget->reg),
 					   from, to,
-- 
2.47.3

