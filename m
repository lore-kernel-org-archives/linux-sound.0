Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90B32E718B
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909616; cv=fail; b=tA5Rbe2YwVZ3BhekMNmkFij7Rd6+yfJZ9zm1b9TR+AngDLE0WMtyoSZWnsyqK18JkbKKi5Mfek9gBxpcW1hoKw71ltfiY2V8umum8xZKM/vRDOs4AyZhOkUGkMOtwOYGs9UPGVW6DLtvBhHHjOQOnC9Y3MVghqo6Rdvrx2Hpees=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909616; c=relaxed/simple;
	bh=Pu7iy4MdeW7bbCpUOQVQA8hjbkXepp1sifVZnCAGjrE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QZ1lLHEEv/LFtuTJsh9ZLIPpMdNlZRfe4vV5UgYUlezGQhuKbIViGBbh1pn5xJ/BX9pZrtjp+A8V06Zwi0Zvowa3Scg5l7rHic9cGx/PYqHGHj+UTC5aA1fFpGzneU8Dad2hVNE4HZclA+eBge6RMQ+i+eIWGNpxmhCwsM4xK5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=XL/7jz4i; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=g+H8CLR2; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="XL/7jz4i";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="g+H8CLR2"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6922L4Yt3745314;
	Thu, 1 Oct 2026 21:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=LI0xBUOrL5Bl2
	tfxGdfMsF2yWzEkkTp2PuNXIFXtOxg=; b=XL/7jz4im2Ido1sdWDsIioIu58yTP
	lu4I36/Pl35HmG/lEE5xtYBRzuSLupZ94IQaRFFbFuSuZR96HtCXzWIPnmGi1MDl
	EHz5X9Pk2Nu0cbvc+Hd/mRd2zxcijWmjympPZKpvP8SN9ZdWlE+nXNdbScvcajDm
	AY485BHZh/dkzUMoD1MOWc6a9Ka7vus/2Q481E5b9ZBmk/oPg91JCoCWYBohYGTQ
	IqzU25AH58n+iRzDmIElgGQM1nOfK54VkVXoJyJG4ENyVDs3H0NnOdzuY992v6HY
	4YGqn17y4y0KWVS8NatRENk8fqMn3D0vNZmL5QnKrrhAMqO8E3GtT+LdQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h1kufxd69-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 21:53:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8TYGQ07vrTU5c2EbXBGDw4KnHAOmR6p8R5JcmK0OyI4UqaspejOCSwg5TJm2xZ/0S9roZSUwi5JrEw44JLoQQVrTeUGKc7qwCLQzT1WpkSPBtZMpLlcGMEBKDQGNaYa4a+FYhC3NYeDcnTD4OSBkSQqgnFy4CHq2Y85thii8E400+zyBf+SsmkjM6xO68EO6n2zH86gKzK2huWw0jxTngmKEG0gn8tC8HjrY5WHytjreUfBUEZ13kfNOp1qfdaekTCim4p9eSdNoyXqp/5GTTI1SRxa0AbrQdxR6pRv2ZoWq0vWH35Z2yvQXsCm3n7ewdfaJZ70gJwhQo5W/DzFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI0xBUOrL5Bl2tfxGdfMsF2yWzEkkTp2PuNXIFXtOxg=;
 b=Oayg1dcm94dP5q15KoF4vu5Cv5lE54U2ZaVaYw/avetoFqQEEFzaqllzKU0KgPFpqF6Qv06OLnLz4V+hCM9hYiZvOri57as/AD6BBSKdM8NXb2a2FH29Dx8AFRCyYdwLUcUA5X5tQIY4Lq4uEg8cJ3oUL1yF0FOaDRmPZeAB9n8uAFnJGSFSf5H4Iot8pYLYx5vR/YE4Sdkx8b/rmXBSpAQUoK+DgiXHGI5+kwx5zesBRNw0bxJvFx87klDvaR49fXL5wOqTPK9SpntNYDA27E7zrMUh1k4Rll/LMWPVIYnb+nJmLVnrfHgRcWf9mpZrXad9NZc8aSQiWW4r4I4GJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI0xBUOrL5Bl2tfxGdfMsF2yWzEkkTp2PuNXIFXtOxg=;
 b=g+H8CLR2l2cSAJKkhWCrLemuzwXi8DU6qK7l7IuIfj+OIOFoCG5NZHRwJ3FqHrS8dV8IjFJjOPUwnytQdETOcpii3BDOL2iyfyw1z2k+dT428lzWcF8of0oqPZsgrZOfFTPRVw1tcA+SICa5W6zLf9mfe1KiwucxauAeZhhJ9vI=
Received: from BN0PR04CA0166.namprd04.prod.outlook.com (2603:10b6:408:eb::21)
 by MW4PR10MB5837.namprd10.prod.outlook.com (2603:10b6:303:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Fri, 2 Oct
 2026 02:53:00 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::2) by BN0PR04CA0166.outlook.office365.com
 (2603:10b6:408:eb::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Fri, 2
 Oct 2026 02:52:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 02:52:58 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 21:52:38 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 21:52:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 21:52:38 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.163.117])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6922qYim2195052;
	Thu, 1 Oct 2026 21:52:35 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Fix TAS2781/TAS5825 PPC version logic conflict
Date: Fri, 2 Oct 2026 10:52:30 +0800
Message-ID: <20261002025230.1959-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|MW4PR10MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1fd263-4ea4-49f1-9e83-08df2030443d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	0jh62eomS1gJA3rrWhYmFNsG+V8jdlmGXdAdA80ohbRJR6GYzRr7n5oqEFaH3cgjBeMJJ7SyCrTp7SnRfXt1YLy0zVrLwFMcmUEVMwaHqp+vy0CUVJdGMp2EgeNePQJPEH45IRqHH0pJ7wH3fKZF0U+M2EivaRUqaQGymVw+Ab5e+qsuKb3gKByGgYHx/m8+6shiqy/mHpN7orvjbzO/F2+g28sxvUAxsonj/T4plAD+Or9+vyfab+xhaQB+qyR9pUHiUX4IXv6qHAwPREQijFFlomhhK49giLz76nh9dabX6dsdaqPEEDZWN3ZOoJPiVNhwf8dDZuYdtqcOsT5h7c/USheiZPmNLy0rJzT0yS0WroCU6jw0hp4n3nEp73iEM1DoYnQgUMvVZjXpzuwmvIM30OIYBLTkecqGCDLG20blcWbRzYdMIAdZ7z1Z0cdVHOEMc6/4XchwvZY9l27q1VjFrWGlqdI9jq4xvjM3A16HgErXgyzbIKwoCi2GUSsgk/qlc4wf2bJDCvGkt9cQjqIGneUjxyF+2ktNTnp4cRZBZtnZEWpFs1jTYOSKlRzLxvjZRgYFflVyOqIdBCzSuDeLwjbVXdivq+Q0GniqUrVocjhEzqj446z1Mgw0hq1AjliCPEfiA1lOOpGrABq2gMD8fgJGR+Jyumjw8pJ/ofcPLYr3+aN/L5KYXb4CEbxmYh0ahus6Pry81BVtjIfs5A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	up46qpF8coxCCMCQuLqMJxpG/oyMzv96HxD1/y/cBgckZ2lRXua459AYFp2ExkJcPKGuTVHCDd4NHEtWA2NOS1Uv3OGLrYLyZ3vvLT/JI+0LePVFCU3JiHoFWIvZL8LGk8hL7G+AEGQVDTlmxyAgrLf0v1KKAWCb7HKnKiCAj2ATllm4lr0THjhIC4yHDeGDBjJ7Mca0PbTBrhPjWqwFiF3qrKwPDurRbFlrBu6d+MrYgOCxFnR3q0OT1igSmL8CvaMOSA5qchQJV2Rkac+kpzvyPR4aQUb4X8csGTrRE21quQ8mZY1JTfpNOUEDFnZCJj5+kSF17Il5Q0uK45Z0SdvUWGO/E0DYA67On6809rtjG9VkBPlQkgbXaFAJcfSYMzGJjNckIeXt3mCzQZ87tmWb966vNpyNUibp6787crO4QNs+zsvAt/DUM3qcuDab
X-Exchange-RoutingPolicyChecked:
	A+a//9lgaGUeTPoCkS5k/PXFcc573057yCUhLCLCsRWhnlIntwQUwWsbwQ8W1cteBOTq+Lt3O4ePDr31RKeWHaV+jTZA+Raee2PiGz/ogk7eM1zCykzFDwzi4s/eyZUK1ONl2qCMv2aPbea+YEcUAHRooxnB09VPbVY1OD4F71Trqc2eXIXJweO5vdvKCaeYTIBqY+J7R7+dNGguvwM95nDiIi/NHBDJRCdalU3rhljig9hVxvtuxHuXC8a5qCQlFmnQvK3mAUiQIy9xZm3oooWhPLtogosox4nTcGyt6YOJjuSv1OQXUo+OKvYiNWjLA+OieifBdW/I3ClPqhFMyw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:52:58.4137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1fd263-4ea4-49f1-9e83-08df2030443d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5837
X-Proofpoint-ORIG-GUID: uJiMcOD1-BqLp7wy1bxGws8yv4qgoP8K
X-Authority-Analysis: v=2.4 cv=I+Lw19gg c=1 sm=1 tr=0 ts=6abf1c93 cx=c_pps
 a=CTIJcRslT32CQvadRVAfuw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=4AERNLdnQ7DUtJ6yAokA:9
X-Proofpoint-GUID: uJiMcOD1-BqLp7wy1bxGws8yv4qgoP8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAxMSBTYWx0ZWRfXyTLcFsf/PooE
 LtT0VTXT2v+pOf78xr8U7WLpbSEfbKpjfor4Ob5d/6YB48EChipU/6QKrpj1ct+uk8HZpkIyMqo
 TbAPNLqqMsiVrbLdjqoBOTFx28KrC5mJvy4w3SEZfeX4/MXQnoY/+xVMa9ykvug2u8frlFJm9kz
 PeCrv7z9nemRG/9ohN3gLn+D0euvcEOBbF/rLVrfwfHC8L6BJBdJ7uZ+t/VK0YXHO9XAhHSFqeQ
 kSQh+vsOCZzcWuI7l/DrskwlOBijzY7QKRc2uwrWTUMSdYz4xWMqMiMD1+b2KN3Wdn9WPW2050t
 XtU83z35ykXUBgcONaqsQKoXQIdtAws1JRrPZ+LNuqaMBuMcwMlma8etYRpBJpk22fazw+0PFVP
 kDQhfA6FjAMYAm3Prf+43IpLF60f0RkFGDA1Mhft/6mo182K/pBaU5pnD+R0sKCu+k3jG3Xohj7
 E4M0QP5v6S6740LTgug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAxMSBTYWx0ZWRfXyOCxhS8ZfeqO
 iblQ625sFe7rLrxVfpEww/VYP3zIj3f61IqP5j07JwOBQXamjmhY9FvNZnreDZUhkKXyEr1OOhs
 fgsrZeGCmj1hzJu09MAC8hAMHImDUTI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_01,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020011

Fix cross-team code conflict in shared PPC version check path, ensure
TAS2781 and TAS5825 apply their respective correct firmware parsing
routines, eliminate version matching misbehavior between the two models.

Fixes: f4ee43ae6ea8 ("ALSA: hda: Add TAS5825 support")

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-fmwlib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index e8ceeb027e1b..3f12051cb0b5 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -1992,7 +1992,8 @@ static void dspbin_type_check(struct tasdevice_priv *tas_priv,
 	if (tas_priv->chip_id == TAS2573)
 		return;
 	if ((tas_priv->dspbin_typ != TASDEV_BASIC) &&
-		(ppcver < PPC3_VERSION_TAS5825_BASE))
+		(ppcver < PPC3_VERSION_TAS5825_BASE ||
+		tas_priv->chip_id == TAS2781))
 		tas_priv->fw_parse_fct_param_address =
 			fw_parse_fct_param_address;
 }
@@ -2003,7 +2004,8 @@ static int dspfw_default_callback(struct tasdevice_priv *tas_priv,
 	int rc = 0;
 
 	if (drv_ver == 0x100) {
-		if (ppcver >= PPC3_VERSION_TAS5825_BASE) {
+		if (ppcver >= PPC3_VERSION_TAS5825_BASE &&
+			tas_priv->chip_id == TAS5825) {
 			tas_priv->fw_parse_variable_header =
 				fw_parse_variable_header_kernel;
 			tas_priv->fw_parse_program_data =
-- 
2.43.0

