Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FDA374A1E
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 02:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822522; cv=fail; b=GyrPhZL+tf8R6LoPA4xwe3gMdlZxAoEySq6TDtK8bOj19C1jrsXcAitafoIGwgSJybyM1eGFf0vCh6crnP7pvInRzdT72vYUrwr2J52kqLOjXbSOraN3X0wUGr2eeuG4F5k1tHurinFXWjSN0pBm7vgHQZTJaWzYHxUlFA0zMko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822522; c=relaxed/simple;
	bh=Pu7iy4MdeW7bbCpUOQVQA8hjbkXepp1sifVZnCAGjrE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SykfW+NuSTczo0wWGG78X0Y4yYSJNlxN025awzxn5Nw30Hw/G7/JO2B4sIv1KRJZBgNfZio5MsowuGt7UGDp0DuvES65tPXLZrEfU3gf5UHQp87OHc+sebbSXleqDkal4PM5BHLchNrbzbjk+LKZE4FxtFqpEaxncdTFZsWrEhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=a/k7GsPu; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Wdo0VxM6; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="a/k7GsPu";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Wdo0VxM6"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6911NAPR944260;
	Wed, 30 Sep 2026 21:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=LI0xBUOrL5Bl2
	tfxGdfMsF2yWzEkkTp2PuNXIFXtOxg=; b=a/k7GsPukk2mpeXscQa2vQRaYVKUl
	nz+gA6LL1CUuxy5sNJmKZf3OOtuJDqSmmDqctwWVVy87K7BB/eO16UAWSoc6OrDx
	JU8IyPzUx5fDFD5xiUw3Xm9pLJPMzT0EPARISCK3nPFCteNekT4xNzmCtqUQ6FI+
	lQS8UX0qyLT2A/alMXnFh06hoOEYns8zqeC5m4n712qufdZO0AY3jD8R4hmEmtku
	ESD54mhgoZdQkm9YCCiXgu2VVx56i7UBRs1+bv0cxxhS5WC/2v6lPy6E/HnQ5p1C
	6K5xfHnhVtVOPJZzuqoLv7nkw102KwmQJoQ8kAKP6YwmTKh+iUhGEfswQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s251pw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 21:41:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwmBWpej5/gDJnreL7gD6V6IQtqWm8BB7NsRi2O/MeNFcz2YaLDA5ZxBu+iArm28p935ULwWkUabc80FT5NLVbyfsahVyH8ik7VDgzNhFFuNHebR7OuDQgM3tNTKsC6JX9UrbE8MvfINwpUFhbN/mN5ovw7JJ/2iRSQ+iHyPCPQsl6CX7rgkZlTV7akIZiHAuNg3eMJVWseXkh2DQ1Ar8vKxuz1/lK4ZaJ1sbfnqYcz4T31eDWUEYEnjKtFtXolho24gMyNiiw3jQqPXCG+qrQVQbjhSOjtpybUV2D+WKOFtSguTgKi2aeMEQ7RAakdA6WMGnqlmg0OW3g05dUnMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI0xBUOrL5Bl2tfxGdfMsF2yWzEkkTp2PuNXIFXtOxg=;
 b=UcefpQFPBM5nSDh7/HUcxxPvYu030eqdllzGLhIwLVJ1v0nX/3lzHHi+uOHqhxLSBZc6+ieCFYeyJLMHvbRAZZyjRdvmH3coB5dk7XsbMdGKluQj6mtBjqGXnQM4F5HoUMDrrfq+UoK9kN9rNisLK/8b4YZD1IfO+ZOXbhySKINyUNYzdeAG/Mw5QGBR4oD9fQBm0ulWDMQvglx0qRIhUfyeHztr+HZZSaenvPl1XbG80wKXYmxoPr44xXlrHDEpbKi0LscgrkWu7XjU2xW//J+CYOVeGVMjL+89tHKXC2NRsdcKjJ2U6s7VhlghnA0Pp1ucLM21m2BTutEff6cCZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI0xBUOrL5Bl2tfxGdfMsF2yWzEkkTp2PuNXIFXtOxg=;
 b=Wdo0VxM6j32cB30bFNWRgAUKnkpuIWNvMbhYzxPHWjlwzK3AGjse5/tz3Y8vrbsUVXM6u3nMuO7hVPrDmMGk/ZVZOBlfFZ+q4ubKEmFy+8Bl4lz5ya7W9n3xNyXTkEQ5kq9BCSv+9cj53l27Kg/jQC5g3WN+l39IEcGVCeOOnbM=
Received: from BN0PR10CA0017.namprd10.prod.outlook.com (2603:10b6:408:143::26)
 by PH7PR10MB6458.namprd10.prod.outlook.com (2603:10b6:510:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 02:41:29 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::2e) by BN0PR10CA0017.outlook.office365.com
 (2603:10b6:408:143::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 02:41:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 02:41:28 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 21:40:59 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 21:40:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 21:40:58 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.163.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6912esJb109828;
	Wed, 30 Sep 2026 21:40:55 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Fix TAS2781/TAS5825 PPC version logic conflict
Date: Thu, 1 Oct 2026 10:40:48 +0800
Message-ID: <20261001024049.93-1-shenghao-ding@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|PH7PR10MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c4c1a9-3cee-456e-405e-08df1f657ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	3v9OATSpxUrd5smGfDrgDc/g8fTZlg/H5xJvvXYOVLjdAAr5h4sRDIV1XluZckbEowz5qdmlfXrh0P/2gRfc8i1lOCFn/8yIYVLuVnzMKaLCUdnwkjbWkB3YksFwo9//oiM9mI0F3eYd2UXfgyv2FN4B33uvZ11H92oheNGHVBhFy69eMwDk9wlqCQYeAWNu1BeYg99qVDvKCu//0+5BSdlOlIPjcjtjefWTfqmDrii9tRUj9klYg+QGdSCcrf6xYoh8l7jFIDV24B9gz/ECKKCB8x1pbJtPtluneQ2EolTctLMXW3CG+jFtFsU/9ZL2JVtMBcjYNHIod27XXHGUgba2XdhsIHvYXICe5yD2IbEQlRZZnmVA0Auo34QeeF44FHe92828UbHmwm4ah4zo7zJVC9YIfFNyOi679T3r+zBNE8sMgmAfZLgfsk/02x62hg8L/1XjGyVbTtG1qdfA1VYT1LxTA2qaR1nRXCNCogYiDTB3+b/Mx1QDqRyQFYx+Xlu+hrMmqoxywCwosadeNYHyffR5/HHdPJ9M6+pATtaLCRssN/9NmxpTAQIh1/SAVN7hbJfKtY6NDFxBjqFigp9Tcs/frDj8W6MfCGokWmACyvctAY1XXtA9TpjpBEBMQkm+8JsZCwTkvzToQviq+pL7Sk9Gz4jLhlIKk70VIVnjnFlP8pzYK4eNvF0aIPAU6QDRfvn1SBZkOr+BtG2X3g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pzbpFHhsCgN4lbBpirC19wjS4gfdqxf2DDO/YgUD1QmvAHLL3A8QLT9cFKaBpcOTG8yU43tidZqr2silZhmGhfKkOu0jQllATfD1p+xEDrlgYfQwoJRlrEWR5c4LQhWAVbwfnMB7D2mVQ07Fw4lr6NWUbhemtoDB2tU0gsq5lRC+CRd+k+pH46n3giz7ZaulZPfdFHx3MpzWjRRJHOvaxpstLORF14EhqG+l5IHlr/xSs3DTbz+iGODUGxCInzYF16gjZahgkuuA8hKERfHSBkqRlnbtoavBThTN92IioqmCQHXSz71SpZz8dybTLz6K8IBdCZHk2Rcm3vj3k4OKE8onnlB4/UNo/Hd//nrzNsa50SAqX8DKH0vDBg/DTYce3OnxKdWnwp0BWKpIi83g/g7wCzUWWGxYCn3eJx8VvaQpyWagG6M8CyJxCm4U4mv9
X-Exchange-RoutingPolicyChecked:
	JnqAq2zSTfaLIC1U27lmR5nfDjwgZ5oXfe2wKAttmSjgl8wDgrXBDg5elCVvcNEAorcvCqohJqHh75vXNcobJuBDIYSSrfwwIBmXbMmk3mMT0cGSqnTXuk4wThN7fokv5x0CiI6xGJw4bfNZaexAlbl/DVnLMr+ojhcoNt78Tpdz9iKt9wgkuLMW17UYhtkU3gwZ/IgQ8ZqDY7nBPxSbG2+E1YuMqmlVs3X4xcZRu52fds8E8Htn2avNBkxmsG+dZYxvPqqon3l3cHpXmkzNS0m6od85SCE0brrzz5JCLwXp9gmpEc06lIu4BsXBAPImtHHaxVtQmkjyNsqNOhgbiw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 02:41:28.5431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c4c1a9-3cee-456e-405e-08df1f657ea1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6458
X-Proofpoint-GUID: 4gX8iUVAoPbSswJolxFb5NyYb2uZjlu8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfX7KjrkuDBk4t2
 5IDEDOmUndHm6gvuVuxO/eChnaiLlFgkJzWQHOuLCcoC6Y2JpcgagodqF2W2ZZaLaSVqo6LQqpz
 iSfn+IyVDglp8UYrLiXqABXK1KiFTqwaL8BIoaJEstypYWMPFfqoUDVqfGzKGmE1m+pMWP+u2n4
 VNCFla+ejysI/1lE10JBNPWpZP4aZ2jBGp2XSjREd9CmjMvFyeL5fSG35oczm+U7cYWL13hbTXu
 qUuhe2s5EkJUTrgleAoBykWlBJbqtDnB7zAwzOvRBm1BWxQv7Cklxv8sGC89Xs5lTVi8uZSxOTU
 S9X3C+xtZcIvWcMoDA1o7XdPbmKssaa2CQCcD+FrGkle+cRkz07qFBnt/TwCildamLdjcKegDYb
 mW+3HvhPieurAvis8+RG89jOQ75sPQ5icT+0V7Un+3BKkCr7cuuKgcbAOpvN+49dKdsPmopTDuT
 DeNtZoZOprZAPtgV6DQ==
X-Proofpoint-ORIG-GUID: 4gX8iUVAoPbSswJolxFb5NyYb2uZjlu8
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abdc85d cx=c_pps
 a=WWBLjRe7FI6dQUFhva+Khw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=4AERNLdnQ7DUtJ6yAokA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfX63TxMgJvz8/3
 ITQXkOcWSyNeVVu4pc8D97VE/Mvru/rJXj60PygxG3SQQBg5t44MQFtDEuy5w9zNh3BijnJj95o
 NMoPTX1NO44GxyDPaH4QpPhDsywyCk8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010010

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

