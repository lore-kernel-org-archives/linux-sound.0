Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022085.outbound.protection.outlook.com [40.107.75.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FED735502D;
	Thu, 30 Oct 2025 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822662; cv=fail; b=QhSuJ4vto37QGbEE81UW4zb5pchCJwHSKn6GRa5qEoBLFkH51VEY6fX1QqK06OdyCIWviyG8+7alXQfxJKlRxCbzaqdoA+3zXOyrnw+6FkieAeRHp1OMf5WDNdIPus6LGIjH2+bWUjNX/2MM8Y98g4Kr30JCnPmVWMs7AmSyZFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822662; c=relaxed/simple;
	bh=xjoye4C/Jy9ia+SYgIs58fo+mrtsuimwSThZEfndTk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eKe5GPhUCsHVFPIZyEKv191mvM3K5YllylPNx0sAdLmH1ZEybRjY8fe5ooKwHX8Is+bwzZSYjwindcM/Uq+aY5v6tL/zesUT9lxejmkHOZ556KhRbXRxmvL/z4F1sODsH2gC7b3O+XhnBuU2nTtG9/lHFrUqXeN3IAxsJ3V371Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXRU9PEG41bIMrfrjxLob3ZrVNGW13rwQjv89+IWlqXgEQD0g+1Ebhg2U5HO/EIRFv2mc0t0tGbR8WUxnnM2GW03eQ3dCFj1p5fisQrvlnXbjusol3syTJblElOEXGEye2IaTqNsMl5QkWlwjG0+BIC3HxLR12jlx+XbVMOgwEW4FViQUgkcLJZQ4a406wQcwBYtLGy1GeL87aWzedJA3nToNRnKcyPt/T5Qssqi7aHe+jRI/QUl+BonduBF3iS0A5sntyiphx9AGHb/5VP7P7uRfdFRaZSdeUzx3qEdfdvQkz3jB9Qys4NBVlCJcY5qyff8lHFSpcSHc1/FthXZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsKQnC6iwhqaBUvjti/FKD9bD1qTDUPoqFpD4hff8SM=;
 b=sTIuonn3rIPS+LljEN0F0VniQJCQ2h69cCSPjt91AUpNQZ313BskHDPaye3tpNnUxBfgo13evBsDUW6EwrSxDHBm4gqNQTIYVns1IpYVgFuLLFBz7SVI6cRaPVOuGLlnGoOVvPiPfP2kCE/xb0WYbCZF+sPhNTVChv6yZGPcPr4XKNhSktQE2y+K+yRgPUo2Y08OO5VHlqQN2hFsROz4ZR6m/HuLjPT4PsqbeKYOYUerSafOdpSJM9udraP8BaLAE0S8kD600KhfkEz03mF3OJ/Kp/4Re/8AbFJ6pUZznxDXbOYJyBOBW7+tm9hL1L6SZH3eymKXvI7L2QImlVG5sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::15) by
 KL1PR06MB6298.apcprd06.prod.outlook.com (2603:1096:820:cf::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Thu, 30 Oct 2025 11:10:56 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:140:cafe::48) by SI2P153CA0012.outlook.office365.com
 (2603:1096:4:140::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.4 via Frontend Transport; Thu,
 30 Oct 2025 11:10:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 11:10:55 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6EB9D41C0158;
	Thu, 30 Oct 2025 19:10:54 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH V1 1/3] dt-bindings: sound: add binding for CIX IPBLOQ HDA controller
Date: Thu, 30 Oct 2025 19:09:26 +0800
Message-ID: <20251030110928.1572703-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|KL1PR06MB6298:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0f4bc1d8-42d7-45fd-650e-08de17a4feff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0MhvApWzd4FNpVpXzFkgxrt2LbzeB/fLrkG9Iv+yRDyvI5KLA4YZaZDBDFP5?=
 =?us-ascii?Q?82ocPyqxlcAXinwJ//o0StIWmcrvVMg8QXACCAVy+FaF5tM9xwuNH2aM6+Bg?=
 =?us-ascii?Q?4PJ8ql9pCOFjULLiEiy8fLP4t/SSoJ3Kir5mcNyMlNNi1B7SHo01Cri44aIv?=
 =?us-ascii?Q?ZmVYjqAc0YINH0OSjBXMBn0cVEbVA5ISsMCIEhqZUSEIEFeu1xV0/q20pymE?=
 =?us-ascii?Q?YpZ/ii7yjro5p5oukemKu34rDuqg2BsuCJYO8/+IqFEckXAcGZl/CgSDdN4I?=
 =?us-ascii?Q?9OSg5cI0TPuelCVD77/sNHXs6W/Uuiuh0mzAaqwboL5ddk+ozhRibHggaBL7?=
 =?us-ascii?Q?UsotfqKioGoFndsBXfqcqTw1oytosAyT5auYtgKqmYGfuO+ZGDGB7AACaMZN?=
 =?us-ascii?Q?VG4bxGRnaIA9iVuBvCqj+/N6zNMJr+R//fu97S3BYMTKAs5FLjhycFY65ERL?=
 =?us-ascii?Q?sp1MPrBLKlFY5gmafR8bCh3iio7YakjCTj4Oukw+2CTkgv18bspN+CVXIcD3?=
 =?us-ascii?Q?p9y8O2QVHeEbOaSWbXk753PUJ64OEnj6+qEdUvzCMNhCHs/8OQyV9vwqC0SV?=
 =?us-ascii?Q?9QW78htnyI0fOq9yF+6G+abkxL+w7K/CCpIWoUQqNxqlCTeh5MFRE40iMi45?=
 =?us-ascii?Q?3sk39+1GSBmhHzMk3sluI77FNnmLXjd7qXnaN4wWPEZs1/pC2RuubdgnEwVr?=
 =?us-ascii?Q?sGfl8RbXPH/h2P071PtP2yHx254+Y5yK+Qh5XxZjlloqdcw9Pyztghq1lc3+?=
 =?us-ascii?Q?hbdi/COgPPP4F+8kn/D7H2yjTYWCh2v6/oB4witJ0kCjEkp2xn4tel6bMk9g?=
 =?us-ascii?Q?+cXxYtkd9781hcXPRyclaCdkk04yI4Ye9fQY3+PTjvhkgPAA3wBoO6fUz7lj?=
 =?us-ascii?Q?jPsd05vvrzWHRZY7lNEuWfCV38Wv3lkvkiCMhwRRWet839SsRz+u/s5YFQn1?=
 =?us-ascii?Q?BNJPTWPXM2juXrDwvctqlMAAMV/JAk7P5AKAi1ZhSpQ0Jn4U5wWCD2rQYjJ4?=
 =?us-ascii?Q?RTSNdDccvoPFnrbMvQe+XGFWci98xjN4IUvenynnJINLGuDjqbN3EJeSlGXu?=
 =?us-ascii?Q?RzAIBNEkZ74uoY0WUBHvmM6kwt6nYevXPOR9bM8sg9RXdhv0yQWBgaMC1lXr?=
 =?us-ascii?Q?8gpriTVPqqdUVctx3/qdjFaTgqBtM3BOkXRFKyif0guGCsB8I9kb9DTHMLGH?=
 =?us-ascii?Q?TFuGXCAV4w6IpMkStwjfvosWwH81m+Q17YJeFoC4rH02GFL8bYMJSPuDy+Al?=
 =?us-ascii?Q?pW8BGfgL2urXJow56Q2TC+f+hpZGYboq68mWTqDr4/kQYpCBtWjZAJ1iZEyh?=
 =?us-ascii?Q?K99pn1msFVZUVeYRTjAa8QHefz3KjSotV3TWymIMRveBZxjWYdjSi8I4ZDQL?=
 =?us-ascii?Q?ov+5wHcuYLUBN9pq7CbYGImfGhiPAbjT3BTzk5udx3XFWsgMsIpQeqHauBno?=
 =?us-ascii?Q?65Qo34aiJIG9tB0/LMV6IGLqYcev/TiI2yDanLlBI6dy/XMbzKMVKi+NfP1Y?=
 =?us-ascii?Q?hrCHJVRF8Cj2REN4bzNULHWCjnjVv4H8K2Fa?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 11:10:55.1757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4bc1d8-42d7-45fd-650e-08de17a4feff
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6298

From: Joakim Zhang <joakim.zhang@cixtech.com>

This patch adds binding for CIX IPBLOQ HDA controller.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/sound/cix,ipbloq-hda.yaml        | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
new file mode 100644
index 000000000000..a4285d1e0319
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cix,ipbloq-hda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX IPBLOQ HDA controller
+
+description: |
+  CIX IPBLOQ High Definition Audio (HDA) Controller driver.
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+properties:
+  compatible:
+    const: cix,sky1-ipbloq-hda
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: The interrupt from the HDA controller
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    maxItems: 2
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    maxItems: 1
+
+  cix,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      The user-visible name of this sound complex. If this property is
+      not specified then boards can use default name provided in hda driver.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include<dt-bindings/interrupt-controller/arm-gic.h>
+
+    audss_ipb_hda: ipb-hda@70c0000 {
+        compatible = "cix,sky1-ipbloq-hda";
+        reg = <0x70c0000 0x10000>;
+        interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audss_clk 7>,
+                 <&audss_clk 8>;
+        clock-names = "sysclk", "clk48m";
+        resets = <&audss_rst 14>;
+        reset-names = "hda";
+        cix,model = "CIX SKY1 EVB HDA";
+    };
-- 
2.49.0

