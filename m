Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F9C30DECD;
	Mon, 17 Nov 2025 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374958; cv=fail; b=ORTccsT/MUN2NKsLWG3nGbuk/yxm7hBGPany2pxpLdNI3qs4d7Ak2ZMNkiPuI2Tk49UtrOAe3dQl1/j2Bw81CkfMm1IwaZjpSh5ve3/ZT7+DhOBLCTBvghSeN6cNA5m02H5SPcq9CpaQx56NYGYAOIqr/qiZp0Z0zSUqvEdoXEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374958; c=relaxed/simple;
	bh=EW6D1QB4tLAFK5AiCwi5ZRUtiKyP3P8q6vNyaYx26JY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mylxLKq9foIqR58XcUePbcFdOPcGTEDF+gdUn3hamtE1KkhU+/fuJbxCileKwwX9JZy+EEWC8pVUzviMP+T/wPwl6hAEO3VVCGaDmLFifjoecICHnusBfGjYkR8eD8Dhd3ZVc+t709uVm2mAfkZBLYlqDcK+PRSGobjRK0/m4OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nsY64Zav; arc=fail smtp.client-ip=40.93.194.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nsY64Zav"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwVKILjWJBPVUZcFxVs9GdSfb6Hr6EM/xVG3dfTOqloYbVgVX0KFwfZ3wKyB+VoKrsGu2VdDGtjYyPD6yds7Mxx1kBof5L1EmMLbq6kj+cr6QgcmqI/5TNT1KlIqgxzCXJa+6h2X061UrjxsJuKjb0gsSTieYY3EnbT8MTM47RvfecCn3tLVCdlZAqLnWhLoUMmylzLA3pRRFiwxzRzhyxhu7nf82LPrFOpzMwDhtDM65ZONWz8DjnrXEbbasLFAeylrVdQDVbpYaZ1jEAXUstCGoNUH/klf2qmFDK85Wb6qM0CKa45Fth9TIRzeR3qNKzd+4QT202ZKxrVPeFHHFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaqpoQ61Ssv9OMUMEcRuwvl8xTdORi5H2TJznKk6YC0=;
 b=ODcxwQo0uqW7CZb43m0MFFTqciwaQE5zeSAZdwsOLNZmjCE0dzQxznSpJfodHivRmIYU0Ntth3INizQMu3CJjaTXFk5TNqg9mSYNVaIxTBne2j+8qcrHkOnf5qd8uvBJfdR+HzQ2PlgHwRzXhZ4WcN9S23wz8oL1GjLx8XvdjGSjgC4Pgd4EhNgUozbPLpO6n7FffiHYlQ4OMkEwaLNS/2EV8A2WAe5sBeGL/6KchZ84sPnq2wRGP2971/8+ocfact56lr7Sk7GtjxCqLFQd3O0UsDgMM/j+yGrZ3nTtd8KhevHY2mqsk9hXfW7OnPgTGuj136drhQPsecoTS8jyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaqpoQ61Ssv9OMUMEcRuwvl8xTdORi5H2TJznKk6YC0=;
 b=nsY64Zavqtg2jzh3EW5Mmn6P693AicjZhdOrN60sgTaCNS79rTkXg9mYVjCvpOnOpP4viI7JB/AnkRXVt0mourw8l/9ShUSMfDjuVhTwDtCjNF0JubOK/uEqTGfbsLe/wRebOZYdJfimwonpjyxChZlltJM1/78jTqgMhn04hII=
Received: from DS7PR03CA0266.namprd03.prod.outlook.com (2603:10b6:5:3b3::31)
 by DM4PR10MB6253.namprd10.prod.outlook.com (2603:10b6:8:b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 17 Nov
 2025 10:22:32 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::27) by DS7PR03CA0266.outlook.office365.com
 (2603:10b6:5:3b3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 10:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 10:22:31 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 04:22:30 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 04:22:30 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 04:22:30 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHAMMnQ2289654;
	Mon, 17 Nov 2025 04:22:23 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: ti,tas2781: Add TAS2568/2574/5806M/5806MD/5830 support
Date: Mon, 17 Nov 2025 18:21:52 +0800
Message-ID: <20251117102153.30644-1-baojun.xu@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|DM4PR10MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a91443b-87c3-46e3-775c-08de25c337c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yamHjkdKtYg+/1tEKuibU9EpeBmTvCg/dmvcxaCk26Uy6O+Foo40ZL/4lVQu?=
 =?us-ascii?Q?aVs3qA80w7O2BZgfsUcepDnSHRePbJJPV5EEsOiN8TITWrzTwRH4SfqdjWza?=
 =?us-ascii?Q?2V9Sple+B6O/DXMRKYP3FlKAEcfV7a8cYwzyZBPbUhwXy+xJeTI0Ln45RVJ1?=
 =?us-ascii?Q?LRVD9hxTRhJ4IvS1oyZSxgBKZY/RZWyp3ekZ5n+2R1l5Get7IJFrhAer/2j3?=
 =?us-ascii?Q?QWpleVIbnVCYkgSHsgOHK+2sUmCMG+G16VB/yYnOwK+UQUvdRLlrVTQus2u4?=
 =?us-ascii?Q?H73jjHUii++sfit4gE4y2gIE/rcjePq3ycXSDUFOHMUwj4++wBvNL4Q155Bf?=
 =?us-ascii?Q?DNOhNAOu+V4Qq4uBbxPBhw9k7xnhvWADThUpyFEBeI9nVxzhB59qXxlVfANj?=
 =?us-ascii?Q?wtyoFos+5rc6pwk71IEQXWSmm3ifYOWFno9IRxAR4kFo/GtcrXoU0gar6TF+?=
 =?us-ascii?Q?c/2k19qMvg8+r+p88T33UO35dAK6wimMwtNch8na/PKxEknXz0bp5oj9k1YV?=
 =?us-ascii?Q?79ufe7DnajxbRiiYOeadlnBwp251MBCjwXqGmHRqHVmRk9IkhMkt83gqYbJV?=
 =?us-ascii?Q?JsVYUB41t0laDX3iJ3D7rdmey1px5IGaIQtZniRDprgNMelW3ri44mXb3WSP?=
 =?us-ascii?Q?3jhlfVxHL4lqTtlZNwgkx85skPnkGdddPo8y+VkMoloJ1oIdejfBRHGl+GEQ?=
 =?us-ascii?Q?8V3kT0vusiiEID5tdYNRHEyciso1EJrDgGh1QZT3Okf9bZFIcWIEW4YRY+Uh?=
 =?us-ascii?Q?2XebkJVbgf+vK/KGWLsFdbTkS/XHDxtoPUnJQx3GEUWtvnZe4CPhukjYgSpt?=
 =?us-ascii?Q?dHNR72owyVWJ8ivU7WhA/lNQc7rd1yypCCktkoISx/UMuNUSvLh4jUUaQnXi?=
 =?us-ascii?Q?xM3NuwUU6nD/L8032KSQzBVPXvKBpLU4HeSNWjVIN0Kmgo25gxzjvvmjWC5a?=
 =?us-ascii?Q?zIFZvevEwT9gxoX+G9bMXIcigTXprkahm3aBIvJB6xsWzSjmdhPZkrc7Az/O?=
 =?us-ascii?Q?B6yyowosVEeG1eHHraLP6ID5ZLQs9Qwz90LjoIsbaO7MbyPZx6ynBugPALbt?=
 =?us-ascii?Q?nNL0GCjyYqoQZwyW9UKFl8nRCttfiihSs5PDVj5xR+9gxErU5Kqv0gsnqf3o?=
 =?us-ascii?Q?DzuX7B9itfPCB6mIq8WS+Nai5u2mI2mcOLatdu3yFBPzx8Q1ifscGkw3scaT?=
 =?us-ascii?Q?XwyTv5rVJrasUpQzAEe6Dd+0YDoGvWO5BpYhcOWCdHTzWJPVYgWbaxktkEOD?=
 =?us-ascii?Q?/6OZNGIgY79uF7X7a97V7SM9AfrmYxHoBRRDVrfKYI+o9Z3msPTHspgNuBk+?=
 =?us-ascii?Q?dgRcq8cw4vEJD5V+wWNN4RqhGx8AiMsN/yNUkpiniPWXA2dG+jbh8Izfk087?=
 =?us-ascii?Q?z/aHbExDyEc8XkT6/S6RuVXtjaiSFiuo960kJonWiMzPpMhSmigqRlmlj9D6?=
 =?us-ascii?Q?/xDIbvTHkF9FDMrnpU0ZMk2cHG2+2Wo6XcVL+6G5w0H8sjebCMJPFG/jgD0e?=
 =?us-ascii?Q?CEYccGoVt6RrZx4DgNstB4ZZDjOCHFDddKRjm3BrOPoX6T4qyK+AxRZiqpoO?=
 =?us-ascii?Q?vPskvetmo9abMgD2Sx5RbqKf3EPkhX8agqtEQv8Z?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 10:22:31.6670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a91443b-87c3-46e3-775c-08de25c337c1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6253

TAS5806M, TAS5806MD and TAS5830 is in same family with TAS58XX.
TAS2568, TAS2574 is in family with TAS257X.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v3:
 - Restore patch format for ti,tas2781.yaml.
 - Put this patch in front of code patch.
v2:
 - Add TAS2574 support.
 - Re-organize the patch, put compatible in front.
 - Combined some chips as the reg setting is same (0x48-0x4b).
---
 .../devicetree/bindings/sound/ti,tas2781.yaml | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
index f0bb5faf55c8..f3a5638f4239 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -34,12 +34,16 @@ description: |
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
@@ -58,12 +62,18 @@ properties:
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
@@ -72,6 +82,14 @@ properties:
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
 
@@ -86,6 +104,9 @@ properties:
 
       ti,tas5828: 50-W Stereo, Digital Input, High Efficiency Closed-Loop
       Class-D Amplifier with Hybrid-Pro Algorithm
+
+      ti,tas5830: 65-W Stereo, Digital Input, High Efficiency Closed-Loop
+      Class-D Amplifier with Class-H Algorithm
     oneOf:
       - items:
           - enum:
@@ -94,14 +115,19 @@ properties:
               - ti,tas2120
               - ti,tas2320
               - ti,tas2563
+              - ti,tas2568
               - ti,tas2570
               - ti,tas2572
+              - ti,tas2574
               - ti,tas5802
+              - ti,tas5806m
+              - ti,tas5806md
               - ti,tas5815
               - ti,tas5822
               - ti,tas5825
               - ti,tas5827
               - ti,tas5828
+              - ti,tas5830
           - const: ti,tas2781
       - enum:
           - ti,tas2781
@@ -137,6 +163,8 @@ allOf:
               - ti,tas2118
               - ti,tas2120
               - ti,tas2320
+              - ti,tas2568
+              - ti,tas2574
     then:
       properties:
         reg:
@@ -217,6 +245,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - ti,tas5806m
+              - ti,tas5806md
               - ti,tas5822
     then:
       properties:
@@ -233,6 +263,7 @@ allOf:
             enum:
               - ti,tas5827
               - ti,tas5828
+              - ti,tas5830
     then:
       properties:
         reg:
-- 
2.25.1

