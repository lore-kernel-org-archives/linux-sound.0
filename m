Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazhn15013036.outbound.protection.outlook.com [52.102.140.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009A26056D;
	Thu, 26 Feb 2026 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.140.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772092704; cv=fail; b=lioCL6M6k8J+zdNVVleGjGP8tkzPTj4+gW6G+Nhn7qbs5oz9G0binAzpwTQ2hsKyFvW+Q09BEo64bqo+8e1w0vR9QHEgjJc3Z0fpV7qQRHr+yyoXPMcXYHgSjpLnsR2gL73cjiZvu+ITDyRVHxs2CN+n8FNXYLVqamYE6qY9ZVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772092704; c=relaxed/simple;
	bh=2gbMM50ufxZU1w/aDkEUOLFDz2rl7xLGFhRDj5ywlt8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b01A0fl9zj3upYtmNoK0V1dCWwrWmXu8c3w8BDX6bMCR75Brsmfb/XjKguijzfmcv8RDpTbQ4E6vRoFCXz7RbHWxr1H7blEkPVu8kZ59AKSe2zHY8Kr/ey26S2nOeUQEL4B5Mdxx9rprHaNvRik6zBKTCGzjU6ZGBfm3t2U9Jqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TverSwrR; arc=fail smtp.client-ip=52.102.140.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TverSwrR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRc+tgPHvRQIpT0qxtkZXpSGcO0D3njsOd4Pr/ZsF4BP3kI7CkK/FE7ZaUeq+hpojMYAPKt7tfYlK6NoGKTS0Zn4hY9OV2tg3MtemJJFuIK+yGbF3HK7S7gViNSDgUc/yVs58qYpWEc1ObyWs8CL752ksxoxXj2Q5+xCiqVeP1rBspWJJ0xnWNeOSu/ErVVHAd7naRSW7o6ITjSAHvWRSRp7/E2vn9vrV/fiEGiPX3+Kuy382Or8Z4qDkKhQ6vGEODhRHOMNWxyHypNdTmCW9V9hwDhQiKV2v0fnAItFRcckyF+75rA77Tqd473SLdD8qamXvbDkJKEg7ifgnAyB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTb5U3NRBIIJewxf7byiYfCIqDHIE6ARvi4oP3+o6/E=;
 b=Yn4ZKALqFNiPhYpKZHDJ4crxNqMBwWuT4cbKpCIuJKqkxPP2/EgNScAj6QY0YuKe6HHYK6mWCTdc/B+2fUgwHxUm8lsGOhGZ80b61N2n1az0yQT1lYjzUqtBV8pAq3Pj3Bvm0PBzpZDA7JDQnN4RKh3vqDXFTt2Bv84Mmmv/Oc/knDMAorDA5a1c29BDi56K+qu8fg85oXlLMVyoj0lGyhe3ZLAj1cDllLOhOsyWAxF7kp/Vs8IjZ8CayhIyAbQav2MPE2gv8zuuP8vCnR44w8NZKPtMB0Zl87vSrbd+Yeu4WkFf6ETODdXJ68Nf3lMVp6kCQHdWq+BHyi/i4HcCoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTb5U3NRBIIJewxf7byiYfCIqDHIE6ARvi4oP3+o6/E=;
 b=TverSwrRWMtrrbv95Nc0+W2lWmRhPorePGYV67TBTOJJEKg7Dj3AnosLv3kmOBsxgyGwWrcDrHy2ud17MNcp3s8+SR3m7xs7AuqvsVmdtz4RtHr3yUPuSq0NXcMkJA665TZt9zT2ghcEDU+KD662QZBX5zUF/lJ5lBo+f8fDraw=
Received: from BN9PR03CA0556.namprd03.prod.outlook.com (2603:10b6:408:138::21)
 by PH0PR10MB7100.namprd10.prod.outlook.com (2603:10b6:510:28b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 07:58:19 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::45) by BN9PR03CA0556.outlook.office365.com
 (2603:10b6:408:138::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 07:58:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Thu, 26 Feb 2026 07:58:16 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 01:58:14 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 01:58:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 01:58:13 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61Q7w5L01501104;
	Thu, 26 Feb 2026 01:58:06 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>
Subject: [PATCH v1 1/2] ASoC: dt-bindings: ti,tas2781: Add TAS5832 support
Date: Thu, 26 Feb 2026 15:57:36 +0800
Message-ID: <20260226075737.405-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|PH0PR10MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c653d7-50a2-4bcc-0dd6-08de750ccc97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|34020700016|82310400026|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	X8SLixO935WId7tyXrm4jtw029oPIwIKW83CuXMuEJgUvUcNRaznWsvKWyDp1MGAGQfWdMrFYDpiEPYGI8ygmOop7hymz5W5tLmpNtKbC8nQ8k5jlEfCViTBUSXB8/K7rjHaTz5jv6uLHpLv/On8POYrOKMAZ/tScPu7t4hQc4A6TKvyLaADRaCjgSBD/TwEjT3t+LccUGwtfS7YRfADmWRMC0npvEebZNKwb722mudpXm4q7R2b8vOqNBv9vCm8OWg7RachPaPeXAjYKt2tZAtbQ8atzl9DHizMx07Z/KhHssDH6ukR4Fy/P7BgZn3iA9yC6uZnZ2AAvUAovN7e2cb4vJnkgzZTiNKzogqcESclrD59zcZZqemGJYpg5YvwtN8ValDOjzd8QN4zTQeTvIsy6CPsep6G9mP2aqkknATETKWOLCf2OY78NoqSyb2VtgCLVEPyAf3i7GwwjoGGdhQkJNCV6ze+r90ybgg2thw+1J42EkrxoE8rf23NG4TXOVsa2u5WrkxcCz1dG2aPd5aqAKqVjX+gXeF3a7h9GGKun9BdTKupoUuoDztRwHNOuPHjXNc9eQqyGAchxo4fdFOWLvfHkuwFg6/wdfCEduVKqGykSmZu/1PBRo9rAfRmnFSVGac9SXixTHimeYzVGW8uQRz44G427yX61BBOPKGb18mlkp9Z10ZPYclYuGpKDSSXrrs0BrQyHuKTyxzI0/HCotrGaPGdg3vaYZu/8YKbqdcPsgeCmO9gH49RG2gCBry+d05jwFgFaLSy9v1yNe75tr+Ck8SGgV31mCb1Kf3CZE5mwicKnKpRtVmssm/bQ8Y+Lc8+v5Y7RhLzg07mlQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(34020700016)(82310400026)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yBQjH61MqAnGTez352BOlIECgDnQ9N1PaAdM7Dk7Ygu6nlVQlwfBkwH/GFYC2TfFGwZQcGm8He4Jwt9zr0mWj8kjTS0EgtL1X/XctOYuVi7Mfiyvz/aOnqR8510YdqrSSJ9diZYauxEX/P9brW0lK+2Ur3KvRCKc5u76+ZdBQc+cdbgd/nNSezKnzo6xaFQ72Ph6rsfGB93eDRDvQu+l4ggmpyEp0s3ls4rkl6S9mQCly2CRDBwXkwxcKa0pIay2O78mpy57E8VeVbuJc53Pr/OYwT+s2Vb9jDT0gpYw6RBAV7Xam51YbYSRkEMX1K4uUcEssj5K4VJfI46Je1yEL6bKyxxSdtPfDMuPbcvk2Ig3koe0iCs/JsYW3iXptIPCocccmsrWAhOkbbbV2mu4Cad696p/CPXVkEguUF9H2zvvaVmiTIr0inGPgQsv0KDv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:58:16.4500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c653d7-50a2-4bcc-0dd6-08de750ccc97
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7100

TAS5832 is in same family with TAS5827/28/30.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 Documentation/devicetree/bindings/sound/ti,tas2781.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
index f3a5638f4239..b21466bb0730 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (C) 2022 - 2025 Texas Instruments Incorporated
+# Copyright (C) 2022 - 2026 Texas Instruments Incorporated
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
@@ -107,6 +107,9 @@ properties:
 
       ti,tas5830: 65-W Stereo, Digital Input, High Efficiency Closed-Loop
       Class-D Amplifier with Class-H Algorithm
+
+      ti,tas5832: 81-W Stereo, Digital Input, High Efficiency Closed-Loop
+      Class-D Amplifier with Class-H Algorithm
     oneOf:
       - items:
           - enum:
@@ -128,6 +131,7 @@ properties:
               - ti,tas5827
               - ti,tas5828
               - ti,tas5830
+              - ti,tas5832
           - const: ti,tas2781
       - enum:
           - ti,tas2781
@@ -264,6 +268,7 @@ allOf:
               - ti,tas5827
               - ti,tas5828
               - ti,tas5830
+              - ti,tas5832
     then:
       properties:
         reg:
-- 
2.25.1

