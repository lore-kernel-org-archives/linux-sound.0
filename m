Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023125.outbound.protection.outlook.com [40.107.44.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF82299954;
	Tue,  2 Dec 2025 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764675102; cv=fail; b=c86nbVKM63dlUmMW5wjdSRKz+fLa/zIWyG7XK9G1zVtHG5c/SmUqNV3dZv/+4HlrbshQ54rN/wwmUs76AOggi/3WNeMD2VelSZjKnDWXME/7fPSUK+96TOQiPYl469TR6R20MWhGQnGXRmwbn0sxC9NW8u1k6ym5cUSuuKlBV94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764675102; c=relaxed/simple;
	bh=IXvJ0DupNObAnLQX6fOQdeShjHj38gvJwh5ngQFc2JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NE7O895XoR8dStCRez9/+yyQhsu87FREqRY3Ngp+pMtVZbpuC1c2G7e4+5gC0jDy5bvz1UkH9+vgNce2eTFGD/Uy40VIhw2u21gvOKFjOh9hu5OwfIgwvXKitP//6Fdt95nm0LXYToqnKRjea8cK7k8R2G1oBlIifHDgqcZ7pqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G15nEs3fMZXS/sibh/tuvqR9NFBHfNdMQs6nR4Ry82ufWEs19StLHhZhoysYyN3XepjslsUwgaR2AWdTlOT8OQyLZdBw5MX5sswI1DvCOvCcoUuDQogKhRf2DogshV9YenS3Q6QeemvhmdiHUoBse4Ma0iMKvNPD9t55VdmX5EIRQwjdBqpVq/27jUxmqPMzhLHntiME2HdtamTDlN/JXJxw0e+N7/lJ3877NFYQ2LNDabhPGiWB5uQwOYu2YM6yvHgj8NEf7tedhgJQLp+/Lm0JaWQooYlUTTZvFu6YO0GT3XJOEpRHfoz7EezX/UUmDj7wH2jkLsGLdhLF7RBZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI2kRmtguZlGWbBBZjchuwicG8THkn8F3QqrhZykch8=;
 b=qexDpDqmEqRojbXRVADnzxW1j3dbuJfkercDWxeCUXfhzKlokU37VwSRolCkqIbXOrkyfkZ8T73YhrwKxLdw1JE8oPciDRP+ieRQxR6PDMAdTSP1JI3nJaywXTpeR8CsTaicZfVRIhMlLENu4EV0eNF9d6FJ1MFjMCupMjhKZP8GM9Vng+w9DRt077kfjU+iSMFdMUNEdeqYIXIKBBREtxOlKVWrKySPmwH1iJMyxcnElNnY2ZF4D2fy60biIK19D+xBKurEH8B4fGiKykn+MM3Y8QPe1Yx2ese/Ng7gT1WNp59Tn+IJCQ2Z+ZXIVf+MfQURlC2ZabiskEhIgF8gAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::26) by OSQPR06MB7183.apcprd06.prod.outlook.com
 (2603:1096:604:295::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:31:36 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::de) by PS2PR01CA0038.outlook.office365.com
 (2603:1096:300:58::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 11:31:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 11:31:35 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A05F14126FFD;
	Tue,  2 Dec 2025 19:31:34 +0800 (CST)
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
Subject: [PATCH v4 1/3] ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
Date: Tue,  2 Dec 2025 19:31:29 +0800
Message-ID: <20251202113132.1094291-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251202113132.1094291-1-joakim.zhang@cixtech.com>
References: <20251202113132.1094291-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|OSQPR06MB7183:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 354fca30-eea0-46b5-8348-08de31965a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TrZTu3uEXmzZqXuxFomXZXhoWMaMFLbOmkiN+FR7SN7FyKRO7KVCX//qlQJp?=
 =?us-ascii?Q?CYMr+8CnFcrywIfwdr3EiautJix+Vccw94XmtEKvHpuSGuonmVGoOOxcIT73?=
 =?us-ascii?Q?iilbb2+ufsG3o2nqQNrJKqLXq7EXe9qQeKKIgU2dqwLgbloKxSvHFXKk0GfA?=
 =?us-ascii?Q?IEo47NA3A96PXy7+5N7cVCZjmlic3xgKnUcYOmiMSmtfIh86JVWT2nzXX2Tv?=
 =?us-ascii?Q?kxnWKNx4nzlnqHgHcvMZ/BGckcccXWYC9laMKP5Qp5USw5AiVZsHjFthzDxQ?=
 =?us-ascii?Q?2nPBMfvlr68Z9GUR08bUPqoZ/5f69I0gcIAE5hUu5YOKYcvgrvGUgi/CwDyT?=
 =?us-ascii?Q?uYf4M1nKTqVf2qWbcvWL5z1+pmj/oE2x6jpCHzm1meB4ws1YRx90iG7aL7dc?=
 =?us-ascii?Q?BLR3St5RFtGGxQZggmr95UWeQBab1WRhh+xIHaYbfNan5pyRaX/WDq4KDaj2?=
 =?us-ascii?Q?yNhurzjrXx7dIWa68CKJVqBu6wg/1J+AEhkXhW13igTbSKIahrHDTOowLIHS?=
 =?us-ascii?Q?T4inT+HtStH2tQw5Oadok3ruc0AiU2InAglJZSDUomzqiRiJG9OnEol+QdO2?=
 =?us-ascii?Q?/JGkYvoElv9xMjVJqMQs9KWSn9ixOPDSuvtQR0TnMgMzkk3WfWSEFwDBUZT/?=
 =?us-ascii?Q?N+i2vwuYERO3mwuyQd4FWY5hhKac0jCTyl9OKwBi3a2pSuZ/6oBmFzxGRplZ?=
 =?us-ascii?Q?FXKQNL/uxD7fqTFZ5SoLP/XoV2xX8uFvbgVCxATEvXNnXJZT2LNsmgsvEmzq?=
 =?us-ascii?Q?iSsw8HAjSwZIsUdK47H0pcqiSUabaN3wG+5oiUZa7gje6MjSqtTVC5VCCTCa?=
 =?us-ascii?Q?RrL0w1lW1GOUmyP3mZQXi9NLPw8mIDNN62Q8f08qAQMEg97fyFRWdFH75lHT?=
 =?us-ascii?Q?D4yF5fiknIKHp2aMZ7xyqj8Zp08R6ZB3/orGJblhWmNb6/cNK0AsxtsSv4oI?=
 =?us-ascii?Q?wkBAepUna7F+Q6AGCdJP/7QrafMTCVFwDbsn5OLpTP2W6bsWA9/HmRgOYrWW?=
 =?us-ascii?Q?R2nYdnnpfLX43TxNCOCMz7I/nSSUrIA91hOld+g0JJqe7fs1iaanI015bOSW?=
 =?us-ascii?Q?GJ9Qsv5aNVnjWnwrrvZUBtXF/XjsDmQEY27OVuOF6Wm0KsuG7ve0D3Erjnv+?=
 =?us-ascii?Q?b22wkMT7PfsSk+3fIHSOW3mhecdYEPQSkfHX6PEwAFde5u/ed9vhsma5juxD?=
 =?us-ascii?Q?C/vsM3N6nOsdV1RrcHaHF8Ykinlvyi8Gls/PaABZVh3lEgWp3XtsIvZbn/R8?=
 =?us-ascii?Q?O6nE4BkYDPEZps+Paa82qkJDLVzbjqbCZBh6la26ETEJfq85bGBPIDMO6IlL?=
 =?us-ascii?Q?KqOU/+/LRrjcSiorhyOI7Utjd02qWRYcqDy6UYkDUVbzTD0zCyYRG22sTi38?=
 =?us-ascii?Q?fMdTAtJu2He8LBqpv7Tby8szoVbL+RxbC1KaLY4PmiIeQcaXfVFB65P4rqA3?=
 =?us-ascii?Q?x82w9H0CjIOQ83Syy9PY9Bl0z/YZ7Nt3UCX8QvCXbM76w/NEJWJ2yDV3dW9o?=
 =?us-ascii?Q?xxOPnQqDF9JuV+So3r5HcRpHQE/b/2JRJUEU?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:31:35.6242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 354fca30-eea0-46b5-8348-08de31965a0a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7183

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add CIX IPBLOQ HDA controller support, which is integrated into
CIX SKY1 audio subsystem. HDA controller supports 64bit, but the
audio subsystem can only 32bit transaction. Use jack polling mode
as there is a hardware issue, lead to interrupt strom if the RIRB
interrupt enabled. Host and hdac has different view of memory, so
need do dma address translation.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/sound/cix,sky1-ipbloq-hda.yaml   | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
new file mode 100644
index 000000000000..b27d47523af3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cix,sky1-ipbloq-hda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX IPBLOQ HDA controller
+
+description:
+  CIX IPBLOQ High Definition Audio (HDA) Controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: cix,sky1-ipbloq-hda
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: sysclk
+      - const: clk48m
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: hda
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex
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
+    hda@70c0000 {
+        compatible = "cix,sky1-ipbloq-hda";
+        reg = <0x70c0000 0x10000>;
+        interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audss_clk 7>,
+                 <&audss_clk 8>;
+        clock-names = "sysclk", "clk48m";
+        resets = <&audss_rst 14>;
+        reset-names = "hda";
+        model = "CIX SKY1 EVB HDA";
+    };
-- 
2.49.0

