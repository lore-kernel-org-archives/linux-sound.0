Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022081.outbound.protection.outlook.com [52.101.126.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45417201004;
	Mon,  1 Dec 2025 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586634; cv=fail; b=nFxNJsnsKDYs6AgyE32fWg5xBgzxkoJsorCr0l4FqsmuZtkAnkbpqOcQzjhBLDdFBNqgBOHd45bcCIRw4tlKqD39I5nOJAJKTGjNjQqC3TCD41RmWtbjNBmCbqpOgLNjV6lXH9YGGypwgtJYIOXJKN35+bQ4Xk95h3AJ/cwv4MY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586634; c=relaxed/simple;
	bh=bje+Kxa7tZzj3ZkPOCaT6gJUkUQdzYRhfLseqZYCDh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tYfSoX3ixGlpkhGSwYqOUSqcF/MdZBsicw/RnS+dTiVAC6U3nuNFnz4cbayTQkt2LuD22xiFgCmnVEvaWMaFa75YVz4jvXqQa5pxEx1CjDQPi06aEdcCXhGFs8zlH/uFaQxHqkqTsN8aUtTWFQBxRnsEbgEhrmjtgHJ8DqDz+k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuF8aDuL+HM2geP9JNNyyv42OqYudmN5/z2cLu0rRtiuX+eMjLvCq2hRnRhQoC5d32SyJO81ZdwOC7bGBR17vTzyLdSpekw4CFx7XnilF5Z2U0nkPkjJz/ryWNiz+e4dhjMkPCXF0UiDDvMuqxRm0590NOOew535d8a4DZHiHF+3Urmg/KLa3QepkgoLoAnpJrDwnt/ypukJBiGE58pu5H/p2/5vbb71/jg9hNEf0L5jyicxlN5pEbAxtIwbtyIVvawjIKCMvbKc1RPUigBoJ/ZZ+vKZxyrv2i04VWYZaHAht4E7XC6Jqbi1irF8ApLfPeK7x9sWlVv8CwMdZW9GVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuxeMOsQ/HI/D4S9vmQVNAi09JgHLKANeozTZCB5leY=;
 b=XSdbiBfgQQTTY4UNNkrdx07kTLUqhMkT51xgRwMWOb4mYMeDpBHcgnfYDR74REyIECzGe19xL4ZwvzNHC1XrNYZCba30aj59nkVicemK9GfVeuoD8jgTtLtQkDEKj4V3QN1RaCPRATKqZy5SJdzDtqhS6w2sDoBPyTsRS5tPsaYvjFXNPuHGEXfIuQYoxC+KFKwUzPrybXnt+6RbHOAOy+VJtCQFhy7yp5C1PfMTnObL/mlaTHEtrYavTKMhn5lBtfQ9ExRyyMQJvrkWyuCe10EN8Wnn1XRxSX1XYwvcIq/8sipmaht/FZrmlVSvsCdRrmzIN2z0BZHsO6K/FcIdfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PSBPR02CA0009.apcprd02.prod.outlook.com (2603:1096:301::19) by
 KL1PR06MB7285.apcprd06.prod.outlook.com (2603:1096:820:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 10:57:05 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:301:0:cafe::de) by PSBPR02CA0009.outlook.office365.com
 (2603:1096:301::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 10:57:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 10:57:04 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id ED82141604E2;
	Mon,  1 Dec 2025 18:57:02 +0800 (CST)
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
Subject: [PATCH v3 1/3] ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
Date: Mon,  1 Dec 2025 18:56:58 +0800
Message-ID: <20251201105700.832715-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251201105700.832715-1-joakim.zhang@cixtech.com>
References: <20251201105700.832715-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|KL1PR06MB7285:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5cf0eb7d-9ab6-491a-1494-08de30c85d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OzaE5JD7wYqIUXxy5sH+yF+CMQZvGRA3MQNLcNtwP/hFytoffxA/blzdIphA?=
 =?us-ascii?Q?4TWCuwC9ztpJnY+3Q//ntrEe383mEj/yRnWI/WHp0xLwjhnDYZb5YNfxZhkU?=
 =?us-ascii?Q?fdHWHc1ICrk1mdlH745kgDYjYJi0BTBNVx/8+M5VjvxLG/pNwNJhHUj0FQFC?=
 =?us-ascii?Q?ORrlDqJNNtPAC5ZcJCz4u4OrC92F9sL7iMR6LR5z0tRbQ8l/y/DBln4Iaf82?=
 =?us-ascii?Q?EDngP+WylEQgWUsLOX1P6cyAoDLaFJyHFBciqFkBLUZO9Nc209PCpW8RzmLC?=
 =?us-ascii?Q?gdDVkOXBMJrC6MN8IqF1cGWHQ0QykqHI47C0xZD6Bl8D3XLD1liklrZp2vYt?=
 =?us-ascii?Q?qA8IREyoKc8EBeahRNkyMElK3l25TFgVWEoKS3JDFn9v66nhbwc/4L2ia2d8?=
 =?us-ascii?Q?LsOop4qTYbJhH0Rcv2jhtNNDe43PhAAjyHEsWju6CHtrpaxjt9csBExX1Iyd?=
 =?us-ascii?Q?mih2+tB9RCMuScZq6vuVwf567Yhgk1kVaYCXsJiXJ25SR4C+7fSfB6RwEiSR?=
 =?us-ascii?Q?g46bo9SnOSDf/11EVz2VmzKJ4Z5oE7OURpPDIA6+v/q812oXy3A6AH+ze58i?=
 =?us-ascii?Q?pDJ6JsLKl8D90DpYzjuqJwGbqcJ36RnXeUVEtML54Ep/6S9sY9Ds5tX7JWSj?=
 =?us-ascii?Q?dwFKO45C7V5xKC12Uxlm7R7RqMgD5WsjxT5oxeUOlcsexKYOi3o14dZeb8Oz?=
 =?us-ascii?Q?/f/DUEQVMBCQpryp3AhreKsJmDivPQDBtuGX3Vt540X46tPmmn7oLp1UJ8oq?=
 =?us-ascii?Q?Czt29LjreOGvwy8ovzd7f59CzfSux4dFpXh3qFRQ5BXc6V6rC3ceR/eYf2Y6?=
 =?us-ascii?Q?bgdtN5enD7wk9oOk2c0EHV0dEL1RkvI5nH5kxf/QSjAalrELqw4VmHcTDMuI?=
 =?us-ascii?Q?f8MQLX62vlkHygbu3BPrnTxtIbPm0pDAZ8DTF0vggKd5OWKVEYYDIVwbAfSC?=
 =?us-ascii?Q?6jcRZ6DSySJCwwJzhUwW3VJV4FI6yUk9tr50kvnIv2K9Bmxpt/7jgNu8Zmyj?=
 =?us-ascii?Q?X9GZhMs9Yr/5OjDkNtPCZQG/EAGMkYt1Ve/502lPTjFEUnNF06EUSAzjrA6W?=
 =?us-ascii?Q?Uz9jFPZdSVRoL2zFzozdKcCCU3jo7p6WRFCDspVgXS2wrI5qGx2d3X0syVMV?=
 =?us-ascii?Q?3/1dBIOrdH4PIBY4k5D0ldlzb+QsOcb+rIsebVolo3q/5FTjDD3j6MIDDvQg?=
 =?us-ascii?Q?sjPGU4b6MHge6euhy9JRJ0BuGRSeetQWff0xZdWsVuO34B8M5F4PIfXDNzhT?=
 =?us-ascii?Q?tFMWIiceVle82BQA3EWZ6WBigZGwKUZV7nE6/o6kyil6nejTdPSt3zHdzRX2?=
 =?us-ascii?Q?5HB0ibYTLlfZuBUU0YPP9tsRww895apcfCOC+aan5PtIfwWLedLu3rSraMEa?=
 =?us-ascii?Q?zZF+QmEV3Z5Un4KwfWg6WDglx/gtZ0cD7XrtNqqoYoRwX3wQbuzbDPxthyjS?=
 =?us-ascii?Q?QQWojbDZSC5KJD2yEylN0lF5AcncYpeYWE2NXa8TPaOIIyxCRouao6bMRBfU?=
 =?us-ascii?Q?zVHyN8iU1sHfT5AnTzYxQkralQsea/Hxpgx2?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 10:57:04.3358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf0eb7d-9ab6-491a-1494-08de30c85d0e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7285

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add CIX IPBLOQ HDA controller support, which integrated in
CIX SKY1 SoC.

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

