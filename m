Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010010.outbound.protection.outlook.com [40.93.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C362EDD7D;
	Fri, 14 Nov 2025 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105695; cv=fail; b=P8ndvT4DI+wgteS5GgLHL5Vi2pixKWNmTYz1iZEuXT3lJphSTUbZpRQZJCALblcNV8PfoZ/gZ/tCw2+GtdB+rzWzvy2J0Yt9kd1Mc4D/y0T1fum8t6FXEwdb663Jj2WkJ3peXxx1vWEj9aY/RNS7LeDdXhdJy8MCbchknEQvHhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105695; c=relaxed/simple;
	bh=gPr18a0SN1J09XfsslTwhudOlJ91DlW5wzxVzFz0WoA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rhZ+E/rF7MhxlhkBBHjskuTY+W6LduLYU8oWPTTlESERs3ief9wjIahsfBX3+r3BUyxZVz0+SCS90yYFdQnLltXSRn+SYGcyC8nw7s/qlo9LQlpKyBvBJHtvl9L8hFsxhobaFpSXI4dSU9dx63lx/aOiDRlIkrLiwm6NU4kfHyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iVr0SVhM; arc=fail smtp.client-ip=40.93.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iVr0SVhM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4afZnDOhEDhqTVh2/Fbuk5toE0fxf6LJ+nYTWLT2IGTNVW+v1Xfln+ylT5R29IRVFkTSPJ4KqMkakAcbfiFQFCRaPuNBl8DL5ZbXCPVso7xazTzjiIzIPAddUA4dM0DQJA+hLlgY89B0NCtB3iB+dypNcqoUY1H9+8rvxTBhW2S1ZVohe8Vd+nqAMNZ5lQtYBKX42UVkKeWF2ZexrIjRXfDbBEIXjKmlY9OaeD+sJE8NyXor7VWivviRXFXqiWQLuM3nV8my5VY+9GZgGD8ckPbYd6vKTO0EQL0GenYG7f5RxdoYzYOIXUzgRON2BAuiLph1wHH/v6uxh5Bz6vaqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7o1vOZR6jJQD+rJQaZ8Pgf8htzuh3RncR1tOOYPw0Q0=;
 b=POXxdkORxZG6rSK9hzxc08uG8qqc5FetGTXJ1K0SpPVl4pN+cq19j/0f6CTzu3Tq7LdSZF0ceHx4le8L27nnh9hySnNV+PWSxMQLDW2AOdYpg/VwHW4zqBTwDPCZfbjpamU+J3IrtXpZE/cB27JvPeLHSgO2GPs/WYNci6MwZprSZrSFLnjZ4iiuLAJUx7NI2S64qbHqrj7VXJyxJm+xX6WPUoDdBv5hvEpHKsCyMWsQ0RF7ypstJGc5A3C1TM4CDH/Q3ivihQdY7HuEKqPiRM0uIJ5GSfdb4Ey4Q3TamUhE8ideFIoaCQ61fbpvd/+8UvDrawGdcxiuq1PXUNtGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7o1vOZR6jJQD+rJQaZ8Pgf8htzuh3RncR1tOOYPw0Q0=;
 b=iVr0SVhMlGAA0SXZzz9K1lYfxzAoqgjGY/ScJ+D7xzvE2zmFgcM4YI6v/DWVb6O/S1WNwiuZnYyP9fi8AwlCSzVXW3oecU28YUE7BY/4RXLY07hRsupFMufRfqT6g4zoUqBwiuhCfiifLAx3JyHvvY1GcaDeWUdT6a3FI79O+dI=
Received: from DS7PR03CA0290.namprd03.prod.outlook.com (2603:10b6:5:3ad::25)
 by SJ0PR10MB4749.namprd10.prod.outlook.com (2603:10b6:a03:2da::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 07:34:51 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:3ad:cafe::62) by DS7PR03CA0290.outlook.office365.com
 (2603:10b6:5:3ad::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 07:34:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 07:34:49 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 01:34:46 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 01:34:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 01:34:46 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AE7YPVM1606594;
	Fri, 14 Nov 2025 01:34:36 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: ti,tas2781: Add TAS2568/2574/5806M/5806MD/5830 support
Date: Fri, 14 Nov 2025 15:33:58 +0800
Message-ID: <20251114073358.23046-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20251114073358.23046-1-baojun.xu@ti.com>
References: <20251114073358.23046-1-baojun.xu@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|SJ0PR10MB4749:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcacde3-9741-4d9f-e70d-08de23504aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ggZJZ2G7oyYss9U+4n/Vjdq4zHMVAXSnHTIiD4mM5yJAor9f7ijIrGvn16/3?=
 =?us-ascii?Q?fB6oCidXF4DL7u0MX/dlVHC9LqenYYNN49lMd4CDcF9vqHJc5j2tElD1OK58?=
 =?us-ascii?Q?Obh2FdabDYOUAo9LTO9h6OeY1moj64KUkNpBVUGl1IrXIqHqnKiRc4aW5HXQ?=
 =?us-ascii?Q?Jx5WKHEYYfLZrYlyfI/NfvOgLP84LTLJFetou+vpVAcaLrCetq+hcvjmY3Vp?=
 =?us-ascii?Q?9ycjKLQqaViDtgJOK1eaPwB36Aq0BwN9XmQxBnnHIIq/zmnEixXfyq/E7J1e?=
 =?us-ascii?Q?xnFnWOS+5msJzb3kiooGHT7AyoSpFqUEupNpoFkVv0XnyfdbE5LiX5nw4H4J?=
 =?us-ascii?Q?ZE2xa7UVHCAjYWY7noYn2TzyGMeJL8zPoRV8DY/giwyAcc4wtO0J7Pp4m1o0?=
 =?us-ascii?Q?NB0liYJoux13Zm1DzWKSm3tTjUedzSrLnVZmb9y9VeyJ6f9dyd2H1Ua8Uqfx?=
 =?us-ascii?Q?d/fS4jFW2I0Yyzmr2iJvyWKTX5cfTVvvZCsyTeQGMflGbRZVD78qv/4dLS0+?=
 =?us-ascii?Q?a0DniXPR3+qK2Fj19msGWqWOzcaLCnBC6fShl2q15mIOdmUZgpvl1ss5tkzu?=
 =?us-ascii?Q?ko2LktAT3eSaSqLaaghLcDqo61E+6QuDawiAsIye/3nSxys5dh/FmdDj/q72?=
 =?us-ascii?Q?toebiQ8Fbyua53tfUI4L/gERJzxtEorfjftiEqJSg/2Fv1IEUqkQRjE06T+p?=
 =?us-ascii?Q?nYArY6dm4VKBthb17w+w/ORfmFfDezSHXPeEc5Unr2J6EDU+7+E69ZfNp4EW?=
 =?us-ascii?Q?S01V9nWX79VpoFhBudl3jg5QdYOXvmlJlMFCLkztPJbFZwOGaFCoMbIWfKyz?=
 =?us-ascii?Q?9Vca8/X2I9M4Pr2v5murRZoejHQKG06cpGC18pkVrIH+Rbi74BDXirUmS78h?=
 =?us-ascii?Q?mS5NaHg8c49m6vgJ2jDw/iV1R1NgkI7AFF+tabVEZEr+60kCA6C42giz6pgj?=
 =?us-ascii?Q?ZLywmSM0gSgsLA429zlKjFzgS/BMWwC147jxfn2/1jJKjkDSFQ3bDD90ps83?=
 =?us-ascii?Q?U4RCugIm1qhoQbeDdOp979+G2x8LmRJDvQF9qnQnxCf+2QYmXwKkqhBf+9pZ?=
 =?us-ascii?Q?1TxMPDbRemOubmovDdxtUhsNCxrB1r8bwVgpcKJbbt96X2sc7vwgnOrBGdLe?=
 =?us-ascii?Q?Pw8Vc0k46u+rxJhmtA0RjZqPo+7l+b/PWurtt2O5V+dSrrNRo0dEsRrXPQkq?=
 =?us-ascii?Q?ar/4Pf2DOdJ95Bea1pkWivrvXTw6qnYMTUHl1n/yBDN/wZMvEaXwiHFvtdwO?=
 =?us-ascii?Q?RGKLbRYK4LLfjAi7udVJJUE2AlCxHQHWF/0NOpbniPM6nTgy3a4D6tFgJMPy?=
 =?us-ascii?Q?iNibc9AVN8WOYNLfKQB6P2aD50Hq4t3JaS8v8UBJrdCe11t8N/SXX893Zevg?=
 =?us-ascii?Q?YFnjBnBZKKjiQxYcguGkUVh9+LoUwGKtytnzZ9anWA7wQEpYoB5g/Gye/T1k?=
 =?us-ascii?Q?zFr/nUew7VIdt7tSs072/uuBJKpXlD9U1jPshy6PhD7fzp3aam1aXiqJ2Pgs?=
 =?us-ascii?Q?Aplu1Hp+7VgTlU+lh6FpCAhWoCvjSfLML94PgodBqwbcf5nQMuXYzh2Vsh2O?=
 =?us-ascii?Q?7OqLiVRpL695QFOb+cOXmgpHapLRgy5iHBI3b+jY?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 07:34:49.4701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcacde3-9741-4d9f-e70d-08de23504aff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4749

TAS5806M, TAS5806MD and TAS5830 is in same family with TAS58XX.
TAS2568, TAS2574 is in family with TAS257X.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v2:
 - Add TAS2574 support.
 - Re-organize the patch, put compatible in front.
 - Combined some chips as the reg setting is same (0x48-0x4b).
---
 .../devicetree/bindings/sound/ti,tas2781.yaml | 103 ++++++++++++------
 1 file changed, 69 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
index f0bb5faf55c8..224999ed6529 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -34,15 +34,61 @@ description: |
     https://www.ti.com/lit/gpn/tas2320
     https://www.ti.com/lit/gpn/tas2563
     https://www.ti.com/lit/gpn/tas2572
+    https://www.ti.com/lit/gpn/tas2574
     https://www.ti.com/lit/gpn/tas2781
+    https://www.ti.com/lit/gpn/tas5806m
+    https://www.ti.com/lit/gpn/tas5806md
     https://www.ti.com/lit/gpn/tas5815
     https://www.ti.com/lit/gpn/tas5822m
     https://www.ti.com/lit/gpn/tas5825m
     https://www.ti.com/lit/gpn/tas5827
     https://www.ti.com/lit/gpn/tas5828m
+    https://www.ti.com/lit/gpn/tas5830
 
 properties:
   compatible:
+    oneOf:
+      - enum:
+          - ti,tas2020
+          - ti,tas2118
+          - ti,tas2120
+          - ti,tas2320
+          - ti,tas2563
+          - ti,tas2568
+          - ti,tas2570
+          - ti,tas2572
+          - ti,tas2574
+          - ti,tas2781
+          - ti,tas5802
+          - ti,tas5806m
+          - ti,tas5806md
+          - ti,tas5815
+          - ti,tas5822
+          - ti,tas5825
+          - ti,tas5827
+          - ti,tas5828
+          - ti,tas5830
+      - items:
+          - enum:
+              - ti,tas2020
+              - ti,tas2118
+              - ti,tas2120
+              - ti,tas2320
+              - ti,tas2563
+              - ti,tas2568
+              - ti,tas2570
+              - ti,tas2572
+              - ti,tas5802
+              - ti,tas5806m
+              - ti,tas5806md
+              - ti,tas5815
+              - ti,tas5822
+              - ti,tas5825
+              - ti,tas5827
+              - ti,tas5828
+              - ti,tas5830
+          - const: ti,tas2781
+
     description: |
       ti,tas2020: 3.2-W Mono Digital Input Class-D Speaker Amp with 5.5V PVDD
       Support.
@@ -58,12 +104,18 @@ properties:
       ti,tas2563: 6.1-W Boosted Class-D Audio Amplifier With Integrated
       DSP and IV Sense, 16/20/24/32bit stereo I2S or multichannel TDM.
 
+      ti,tas2568: 5.3-W Digital Input Smart Amp with I/V Sense and Integrated
+      10.75-V Class-H Boost
+
       ti,tas2570: 5.8-W Digital Input smart amp with I/V sense and integrated
       11-V Class-H Boost
 
       ti,tas2572: 6.6-W Digital Input smart amp with I/V sense and integrated
       13-V Class-H Boost
 
+      ti,tas2574: 8.5-W Digital Input smart amp with I/V sense and integrated
+      15-V Class-H Boost
+
       ti,tas2781: 24-V Class-D Amplifier with Real Time Integrated Speaker
       Protection and Audio Processing, 16/20/24/32bit stereo I2S or
       multichannel TDM.
@@ -72,6 +124,14 @@ properties:
       Audio Amplifier with 96-Khz Extended Processing and Low Idle Power
       Dissipation.
 
+      ti,tas5806m: 23-W, Inductor-Less, Digital Input, Stereo, Closed-Loop
+      Class-D Audio Amplifier with Enhanced Processing and Low Power
+      Dissipation.
+
+      ti,tas5806md: 23-W, Inductor-Less, Digital Input, Stereo, Closed-Loop
+      Class-D Audio Amplifier with Enhanced Processing and DirectPath(TM)
+      HP Driver
+
       ti,tas5815: 30-W, Digital Input, Stereo, Closed-loop Class-D Audio
       Amplifier with 96 kHz Enhanced Processing
 
@@ -86,26 +146,9 @@ properties:
 
       ti,tas5828: 50-W Stereo, Digital Input, High Efficiency Closed-Loop
       Class-D Amplifier with Hybrid-Pro Algorithm
-    oneOf:
-      - items:
-          - enum:
-              - ti,tas2020
-              - ti,tas2118
-              - ti,tas2120
-              - ti,tas2320
-              - ti,tas2563
-              - ti,tas2570
-              - ti,tas2572
-              - ti,tas5802
-              - ti,tas5815
-              - ti,tas5822
-              - ti,tas5825
-              - ti,tas5827
-              - ti,tas5828
-          - const: ti,tas2781
-      - enum:
-          - ti,tas2781
 
+      ti,tas5830: 65-W Stereo, Digital Input, High Efficiency Closed-Loop
+      Class-D Amplifier with Class-H Algorithm
   reg:
     description:
       I2C address, in multiple-AMP case, all the i2c address
@@ -137,6 +180,10 @@ allOf:
               - ti,tas2118
               - ti,tas2120
               - ti,tas2320
+              - ti,tas2568
+              - ti,tas2570
+              - ti,tas2572
+              - ti,tas2574
     then:
       properties:
         reg:
@@ -164,21 +211,6 @@ allOf:
             minimum: 0x4c
             maximum: 0x4f
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - ti,tas2570
-              - ti,tas2572
-    then:
-      properties:
-        reg:
-          maxItems: 4
-          items:
-            minimum: 0x48
-            maximum: 0x4b
-
   - if:
       properties:
         compatible:
@@ -217,6 +249,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - ti,tas5806m
+              - ti,tas5806md
               - ti,tas5822
     then:
       properties:
@@ -233,6 +267,7 @@ allOf:
             enum:
               - ti,tas5827
               - ti,tas5828
+              - ti,tas5830
     then:
       properties:
         reg:
-- 
2.25.1

