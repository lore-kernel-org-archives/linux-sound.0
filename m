Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F0C247DE1;
	Tue, 14 Apr 2026 01:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776131715; cv=fail; b=mPLOlAJAFJnd2N0rdv/gaGRcSx697Xa5hOWKu82l13iVK5oPk0KrtBOZad22xW/Nx1t5Vz3Emn7JePgftvoyh2h/cRhgf4/+h90lsDmtEAPtZXeXiguY3xjV9x+BPop42ZhvN/FBxP4T7O3V4aa6eG0PF2a6J4lswAspNMxa1k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776131715; c=relaxed/simple;
	bh=IxisfJo4GozhgCLRHcfFn/o+neufO3GNeUTn/uykgK0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AXPKgH/vNm2sCfe/POPPUv9IiDyeeRntDOp8TJ6pvBIzLG5IIzrgySY7dI8UwcHUj4TRStSZsttG1gzfE+T/EirCZjLhXXwr11dcncTpHsTCWJXCmOvfIsib9kknmoSJIg6WTzGodH7IBsX8gX2qCDqhjNeMI/GFOdnpgaABPAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=glQcDSqd; arc=fail smtp.client-ip=52.101.46.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="glQcDSqd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUtPdN3DqQNLhbk7VB96Son5dHvh5R3Hxyc2Yz8rjZqoCecNJ1XlkCrlh8qQXCY9my5XPbuEN9qTYPX06yW9VIpIr+uQmUVLGCq6QK5r4ts+blF7/3mmYRfKm+ryr9UolsDtCvk6gSPPPaH3+qKSrv6cljBr+L2iI7lRcANjFygtrRkd3f++nvG37XqzJhbyrArZOJQudS8z+mDEpSRAyf7lTLEdBfHLp9lk4r8gnTHVMyMXriPJp4ANJvNU3yZKdQc2dLjFLgNTAs0qWuQZfVzXZ9EM70udapuL0smUtMpNJv6UPP4yhDstPanJnG8ofbPDrbTzgIG8c9aCd36roQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEsnbqE4G4fT2hREOu2iOkIMihWRgzRyRSDvZok7mPs=;
 b=J/YdWd90YyS1sjdjfYmYm7OpBZDKaCmmMo8yJThblNM39gk/Zj8ajl/P9IWuaJAVw94m4xFvpKGpg609QYYpp87+9ZvbnOx3RskYx2R+E/nOP027FQNzDt0xTGlmKKu96iPtChk9HvPnyhRHN/0yKT4qMfl0DMpb5Ut//HBzt15rxwGvwP750fzV/QlUjryTD6cBQYcigrffc1i/sCUuL/D6HEyYQjLQ+NIkc7ye/vnD33Jc4KfVhf7JjIpqpHz7jdqFd41FAFPwRuY1jPURMvyaYMjLUwpWVE2oI4fQGgPWCBBGZgSzr879/LtJnvrhiRfWuqugegGvpvcuSbqY6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEsnbqE4G4fT2hREOu2iOkIMihWRgzRyRSDvZok7mPs=;
 b=glQcDSqda3kzbsae2EGerzxuMBzDbchkzAOH/IHnwEC3abQvk++0y62DFgZZxdEd/3otcmFsHk7nzvt34VAgTY46FCMOWxoVmQGbEFkADrFz1P4UD41nn+mD6zz+CJfzrpDyzNq6XQatIbBmgKVhvmq07qdDXnkn3ZdgnYxqq8U=
Received: from BLAPR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:335::8)
 by CH3PR10MB7493.namprd10.prod.outlook.com (2603:10b6:610:15d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 01:55:10 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::ba) by BLAPR05CA0026.outlook.office365.com
 (2603:10b6:208:335::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 01:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 01:55:10 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 20:55:10 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 20:55:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Apr 2026 20:55:09 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63E1t2hc1944973;
	Mon, 13 Apr 2026 20:55:03 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: ti,tas2781: Add TAS5832 support
Date: Tue, 14 Apr 2026 09:54:40 +0800
Message-ID: <20260414015441.2439-1-baojun.xu@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|CH3PR10MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 8afd1691-89a8-4409-94bf-08de99c8dc8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|7416014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LmxcX1OSTWszhOksIgVSCLfhiYeLHFSi2WHs7qclaw9ApZc90rJmQFfC2KG5Y+gqA26NT020Fextlur8sAUDk7F9/RzCWy0FNajNMpqABX+QdVgdwM7GmaYezIfhSoZ1EvQFwFXgW9/fFgIL57pqT2yPmTJhFaMd+wNsZwb8kxqLpgPFI38D+V1Ok8zWaXw3YuNoVMLp2iR0p1zIDagdsTwMWlnJFPEqF9DLqB+fC1tUNaGBBEH0diJoHNq2eKNd48JBpT3gg9rcVjmKWmkx8fBP7qy4DzTnNA29R7t0MoDhYUn/kM6PHWTfm/XU55PNp0vDjDm/zg2jXTacbRvUBvAXtSA2NFLC437yO5EG02N/YO1nH+vu8Gi2EgupvMB7WIsYu90F29jne6Y+ZNGe8mB76Lx+9wonlcsXWu+tQ0oXHn1ZFUqk3zUEBLS4O8j3uX0MKOlykrvirtwf7An6g8WeK3x+GJbkbIYb+hlhOD9q0jvtjVy3yNz178LMwery0CdQX/CJZpHZbI/EkXQx39TPkhZwgQAMcZR1uNvHVLoMeRLTSjFiJJf/T1UtfAJq3ZM1U3DdQ48uavNfeBJgpQsyaXZ0MeU7imoetcg2o+PUKicrOHwcNALMsLHGBLCUQDg41tpNx5uL7WbrabkpH706q8Y3SAV8k+m5qJ+F9l0Zq5KKj2dgQkjAsWrbCbR5R8qD28hIFYcpOcBVEu1PpK45KTyuvG3MemS21/qcLzg=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(7416014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AP2urcWYfr9IxyvaJJ3Ocp+7caIVfugl0hgWDha6LQKskhX5e5WHyEpYFplLyOh4P+JgDkMalF/y1qQ+oZy9q6o2hq9mJsTAOP4TFodFJXQEV+F/T2J+qygcdf0O6B17DoFlKGjNfB6ovgEWZ1FLXyZBEdvwpZNMPJn/aPGhIwx/t7BmjhM0lQrjuIzvHtOEpU9iqL2mMIwwMcSLNFVsOxlPO3dQQnLiyibQHELODF5x7hdU1EHCppb/LCOypgvm4MNRnikD9eouMaRQnsbOBCtrZF12Ss8X4nDLRmTPUNZuYx3k/KNOSiFABMDfqPH4xg7hrsU/9eqihH7IyjvwqEim9MRyrfN76bDqRVg3tRKgmTkDm/xC+FoScwh6/jVl/G2sOQHzUDHgN4aK4n7e5mJ5jT+Wn0bKlIefa7Z30hDtG2h5CqXA9rBfkNqdNfrQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 01:55:10.4860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afd1691-89a8-4409-94bf-08de99c8dc8e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7493

TAS5832 is in same family with TAS5827/28/30.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
v2:
 - No update.
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

