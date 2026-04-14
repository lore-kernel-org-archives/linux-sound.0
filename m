Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E40236E470;
	Tue, 14 Apr 2026 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148674; cv=fail; b=CaBV5YUhkpkOM4S6a6Pemp5JFdrGGARUfFJwJGok9v7UU+23UyrNqBx2SbudfscywsqmcBv6Ez0hTN49jhocLSUsReu39SxK/M4Z7wKiCIaUZ61f3JqZDFi1HNkZeF2ZxiWBXzdQ4Q5ZJDBFEy4HAmjT9giJ7lASN1daGyoa30E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148674; c=relaxed/simple;
	bh=dcw8OZ6H6AMD1vZpEHzkvIj+Bpff5WMQNWaMMtH8pxY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eQhr9jgvHuCZvLeIOT1/Q6HPtOzkiLoombjgIj6dNIqK3n68nAyxFP3AbGHBrw1k5/gojZqneTm4QFAHapp9sJHtHs4cDERf5plmIByA8ybBX11l52rd+QmWWN/Z703LdMNxcCYZ8hreVp1T9KxIqLSH/IrUegYJPuxJqCzczVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Pb9FUGwU; arc=fail smtp.client-ip=40.93.195.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Pb9FUGwU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+iAKXh+uFbAboAtJHayOPyRVzqAtk8aXesd7psgdtKiGcC+djh2zTYFR9X27M2Z91KUYygVpIcMwLDd2aVn4kNvjJfIZYeZ6uojC/Qwia/pLpoojkA7b/igqZOl7Bj6nMR7gQuCK1c5bdDAOVJWWYerSlfJQuJnOjI9ySCPjd4IOoh3WyzZTvgenD1KbBuVEE+DVS2GlR033P9BqC9aRmDsfuun+sJA5R22Wuzrd6k/dDETG0zRIh6qyk/eN1o2idu14CJ2hrMy7cQ/QxK5NIdj/92JxCuCp0EgNPMJHlK2D9/HvfWtt7rvoqmEfr3aoDtUmfoKhV73Wc6Qxfw+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXiG8+ElcI0qXwu0gb2DoE8ccKd5PKVvPi+92/JKsZg=;
 b=vzXofKxi4HfmDQ4zLV+4UHM06+Z9cCiXF+f8aHUYFztIhjKs0isI3YGjqhA9HEdNVfjaWF1NeETInb5w9DWw0/Ixi0vG35JGK2Hbjm218KH/gCCE5tUtO1AJBkGTzxq1nNYTFvqw9lQxDaL+/8Qx0pApZWPSVnoa+0ECMLhVXs8zGvS9Eo6tbZUo6YMv62IOd0L/xTLJ0a2WeOb0zLHeTODYXJPr5NuWJLv5kZWf4yD3eeAWnpuYL/SUbavGUq29B6WBsmdR+vrMaqxTPSf+wSHz19hQUKWhCmGzBR/hbbnMaENYUI//uYy8BC3WPEQsTuwXZE0weix3lig2XhFeuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXiG8+ElcI0qXwu0gb2DoE8ccKd5PKVvPi+92/JKsZg=;
 b=Pb9FUGwUlOBOdZscGkrt5cmv0nRsIF5nEn5NPbD2U1UNUH3mS/kwCV4NWTqMRwHIW3lUiDRVZ671m5xlgPyQJ37XmgilNWr0b9wQwVYmb6orE04KHKNGr9n8cf7MP78aiBdkaF9PnqheJDN52Jrd1UgN9SDhoiJruhmbBff6rCk=
Received: from BYAPR08CA0042.namprd08.prod.outlook.com (2603:10b6:a03:117::19)
 by MN2PR10MB4125.namprd10.prod.outlook.com (2603:10b6:208:1df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 06:37:50 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::fa) by BYAPR08CA0042.outlook.office365.com
 (2603:10b6:a03:117::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 06:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 06:37:49 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 01:37:49 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 01:37:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Apr 2026 01:37:48 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63E6bfQo2327872;
	Tue, 14 Apr 2026 01:37:42 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [RESEND PATCH v2 1/2] ASoC: dt-bindings: ti,tas2781: Add TAS5832 support
Date: Tue, 14 Apr 2026 14:37:18 +0800
Message-ID: <20260414063719.3467-1-baojun.xu@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|MN2PR10MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: d4165820-9e8b-4f3f-4a9b-08de99f05906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	x85ytoMv7PBmwrYHoMhXouG5SFM113CTOmB7eY2Nbktn3lc3MLpm+RhW2jYKe+MidIBZhZJMfkBwfBgo8vRaSwscVhjDogBBxUUwMEP1M66EY7suuSMQwMDBtl8hY2bnVm0/SB05P0nJDxkeTJZ9iapAndDfNGYWiHjJa3v1RaPn+RKDdn4HQJ+qu+yZmr7v0I3ZQ2sNEJCTeK7RdX0sJjUST6To7FJrw0oE1dcXYez/HoXWBXUAaJmRhjo3avHQtdO5QUy3OA9o8QSwgd065rM97HrLSFAS8hubyccBO64677dFMQSQx6Cf8wZSBJiLi3550WdfgkxBdYf/iV4NyoTh1OTNT2MA5Gjntevcf+fs6K3QGxULYYQkmGPtY7rRsav3P3DWIg9oZOnHvqKQyzWJ5WgSkeQCqVMFzxcznTm7y4uzp9iqhUrAUjpf9H9qBbMJK+00KNi8MW8NNQX6Bk9pqOvaMDJ9RDjdqE2rlwJGywFXa0hzW3ALvVvnZwsUE0GL2sN/MzXAkPmY3kOMwyuL0IovVxau309oskb9PQmwiDBBts9I3C7ILGia/wyg0wYvax+XPaDEhYkpCh9q3/BzQ1kT/L5PUWKEbEOk/DPTW5wTQ9nM3ST8e0XHvH2IOMqcHtbeyXM4/yIgr30ViGU07mx4VgpAWXgNMJ6EPblF1jd9e+YtGc37RdYkPG2KWJvw3s8eTVBBmIoZXHsS+hatXSvKwZ3IKIDUGxPv2PA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uojuyuGBfLB3QU2MOYYpyQ9YpoSHz0GYTtjj+4kk8DM58gOZ9RrlLlLcjsIGe9BdMrjTk8Fkr22Erk1JwDLmjIsr2s0NBPOOIa5B6NfhHP6Wk9KwAirafUpkBXY1gT38pzBuxBIgTftVwKn9+r1ORQm1Va02yCRWdW/QuSrNzifONPTTFxlmmhN3utExRInPG2KB++BJ7rcCYifHBTMd0sgKARQwLgkiIL3h6QZd2f7xpJhbBbxDwwpFQ1Icr1EjNW3UJzpvw/YUFtnDUeHf4QyXq3xZ3d1hL/Vw9hJsOxd8HTAL4auvzPz9nxt/BOPx4eI1yZbduqRvCFq/zw6qDR1UjcCqD5Iowc1vrK28htQkHsHoWXUgfpaGbXPnUPGpW404QptS9GO0yOgpPRex7ZdfYpxP4gTpHfFckBMrMXF7f2KVVn4cDOpnQLpWNk1u
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:37:49.6612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4165820-9e8b-4f3f-4a9b-08de99f05906
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4125

TAS5832 is in same family with TAS5827/28/30.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2:
 - Added reviewed tag.
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

