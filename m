Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022133.outbound.protection.outlook.com [52.101.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E48429A33E;
	Fri,  5 Dec 2025 15:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764949596; cv=fail; b=ueorREKNxhv0QfkfFkVVxkGNEHwu4aGATRd/L+4hCv2TXT6jingAlGKKgP6c7LQ9YbQFLIaET+mP4UcqSM0KHgKtQrymxo0LIs93MEQZ6tLNZUfhgTdg3/LlVzEJb1abzyNV1c/xTE7zXnwP5xdWXtsPo9YYfSfMt/MkHZfpzx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764949596; c=relaxed/simple;
	bh=A02Rq+a4eRU5gwhm/Jdq0KUOKd72XdUjfiMMVo+cnPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pPCzHLQ3e9s7FwTlVst7BCgaVgE7iN4PqfoPjG4TZbZ1s7u5eAbbfZbffBtd+7cLT2APxx6tnbG2SW9QSMaj84ScTcR2JF1kSNX30WKlWKb50fnIl+2AlIb31c0rtsWos/xSdrGcfvh5qXBmQHiDbnd1mUH9i8noDasXt7QM+3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpUd772xzzQVhBmUH+u1a+MCcR/4uR1PnCr0AY9S+ore6Knly1sBgXlOpzz6MSq8GCT47y2g7mTG8ir+A03EkQ1/hfO7m9d4vL3rVix5ogFaB3JTmes6J7QhcxOH61I4QUMgsvg/LTWluOxZ21swMTn7+IAWrXEdsEVhysawSdfc5LN6Ik8aW4tuY81OZc1PBAgC6Qz1YK7TBPXeE48ZBCeCinnhrYN80Fgn+08yfmJZunkKXufNsc9tJRUIPiOR3GRSvx7p0ndJFx0A0aMrBs1yDB93CJCtmpX1ugq/BVd1c4VGFlNeGoXvO4Kgif0VAI1GSI4KawVIoEG8+12ovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcmJedPMMzk30OFyAqkrQzQE6qb3M3IWMoejfIWI5yo=;
 b=WUxv4ez/ixFwnSdlEX6UFraUgfQnCfSV7yGJYAYPzEE6BCpLugVCXNFMTa9nOA4aqQagA0826U0giHvJ+Pyc4D3UWQds8sz2K5FWWqOhjpcVGSSJepdwOLW3K6ay/wD+0cUwK4Iry05vqzloXd6kgiVioJM4jhQ1DCtD7ofcD/5GT+YG7ZWjp6iyj3uWV445gXNY+ifTaNQycZQLHoNQcQWoBs8454q0kGKZngX2CMaX2uJKcWjB66zUCeTZrUuh5+HN3MQgPMMUO4YZqrT28xpBaLDwPZoLEUUKPVH1ztk6akAKEvXd+QWm28vsA15EuotA1DBvZ38VgefD1bQDPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR03CA0132.apcprd03.prod.outlook.com (2603:1096:4:91::36) by
 PUZPR06MB5828.apcprd06.prod.outlook.com (2603:1096:301:e8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Fri, 5 Dec 2025 15:46:26 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:91:cafe::9b) by SG2PR03CA0132.outlook.office365.com
 (2603:1096:4:91::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.1 via Frontend Transport; Fri, 5
 Dec 2025 15:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 5 Dec 2025 15:46:25 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5C1B341604E9;
	Fri,  5 Dec 2025 23:46:24 +0800 (CST)
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
	Joakim Zhang <joakim.zhang@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
Date: Fri,  5 Dec 2025 23:46:19 +0800
Message-ID: <20251205154621.3019640-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251205154621.3019640-1-joakim.zhang@cixtech.com>
References: <20251205154621.3019640-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|PUZPR06MB5828:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a177ed92-1c6b-4d47-653f-08de341572f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TtkzzdbQ5a3mF3+GNklQgvw21V989ijjXKtONT4q1NAhDxaHlZffui+K66T6?=
 =?us-ascii?Q?AxxFjU5cZULRn+T2/kjdOeu3s6IKCDGnrMuT/tJUou3gPcXTcVxROfbmU+A3?=
 =?us-ascii?Q?LMkxXv4ANXojbNqA74qxp995RXdBIDUT6lyUTx/y+JDhAwB8Ga79j+5sYz6K?=
 =?us-ascii?Q?RhXZLKBO2WL157hUllF8pCRJGOLraqVavFleJL4gUVUVrmSeECo7k+ERMgf3?=
 =?us-ascii?Q?ycsZAJt9zkerXccxQY37zj/JnuR8qg3OR8aWT+Sgg/LVsrz5uz4UBF7VS1aP?=
 =?us-ascii?Q?LLi0hWxRyoYRRXoMi6R6Tl9V+VXZjAhMlAsZkYGT1492nyP0cCA5dKREYbUe?=
 =?us-ascii?Q?Bj/laJRM0otVMeNxUw7njSrUxLnCcAl1aJ0tx5l7anjuMgQ1zIHm1MH6w50H?=
 =?us-ascii?Q?WkfVaSxlPr1Nf2EKC5a69PB9rx6kMDWPIu2BQ3HbwSjwn1mHuGHDgODzhwEa?=
 =?us-ascii?Q?09cww6wgr+rEzwjklCt1Fpjk2XQD97hKx5MP8x3i1ZWIfXDqx5ec7z2z9TwX?=
 =?us-ascii?Q?zqTRpHiOUvBV5T/38syShv6al3shQejhVxStP1X5SOHk5GoKvqXLO60UhjDH?=
 =?us-ascii?Q?p3yDqeZ3KSqR41BpTrlixg6ClmaaD/lvpT9YfgUvMcrxUmLouEJhS3xpXdGa?=
 =?us-ascii?Q?1q5AQtKuCNFmsz7Lu+Rr8jYN5vmnMpGT5TJO8pyscNcKEdkK4m80TCQ+ygth?=
 =?us-ascii?Q?q4lp7SIYWkyfZeWjQ4kzyV0CUN6stTr8ClgS8sR3JTXY5h1rRwlQy3+hvCIV?=
 =?us-ascii?Q?eJKR19XTXpyPZ8fxHxj4b2NqJFsLH5jquup4a4I9gqcReX64Zoij02jjDBid?=
 =?us-ascii?Q?KpzbsAfIy+5WC85qtzvQv+YcIi/XWoHEr+UVsgl9LaF3+pfhIt80077JEQ4U?=
 =?us-ascii?Q?8+5Qc2xe0NjBaAzU+rR0KYNJqMjKgOn2Yr3Y8Lp5XwdkWPNbAbE9gLeiiVW1?=
 =?us-ascii?Q?17BEdtF0eUKgFblSJr5+9K2/AeYJpVWY+LWtklhBYPbsgJJ15y8rnjEFA19G?=
 =?us-ascii?Q?Zm0SSBYwlaJGtP/58Dlpg5FGZ3lEu74FT74I96/RZV/+WBazpMFCDHUtB/Ku?=
 =?us-ascii?Q?QFOURvEqYSIAbvxtP7qyMv5wAxrFgW0yZpgSqGKXu1wotX6AsJ+jHAo3mi8e?=
 =?us-ascii?Q?ODU9aeaXr85e36xM7iujc3cWEEeByjV3lK7s7ST613u/+8MHVYH5fDHCANuc?=
 =?us-ascii?Q?MNDsO6lXi1fi/c3RY28lCnQ3CDe6mhWcwWFcFDeW2Djyj6Jx83B1oeg515Uh?=
 =?us-ascii?Q?ZeCTTZb1UIlS0SHrI2Q0YCNscTFmoWCLmMjyq91P7LS/veXNKauK1J13yv7b?=
 =?us-ascii?Q?tGJBPLvj2VXFTeMwQL/3DMxzU3ZXCSK0ogUwY7aGAJzbrW1YbYXKYxa8Crea?=
 =?us-ascii?Q?4fOpfdzsfAJUSZ2JBns4XWrV9RUis6/c/2jDx7+2vvv+CMmIL9SDJRfJ1chZ?=
 =?us-ascii?Q?sM3294KI0lXBhaxzKS/qIuBotzSUNgt27mZcPqWacVFcRYm1LHBvHZcZa9K9?=
 =?us-ascii?Q?na+Kd4SbHp864OjmA9j9flPb9QM5/fPExOtA?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:46:25.8789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a177ed92-1c6b-4d47-653f-08de341572f4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5828

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add CIX IPBLOQ HDA controller support, which is integrated into
CIX SKY1 audio subsystem. HDA controller supports 64bit, but the
audio subsystem can only 32bit transaction. Use jack polling mode
as there is a hardware issue, lead to interrupt strom if the RIRB
interrupt enabled. Host and hdac has different view of memory, so
need do dma address translation.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/cix,sky1-ipbloq-hda.yaml   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
new file mode 100644
index 000000000000..02ac5f1aa926
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
@@ -0,0 +1,62 @@
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
+      - const: ipg
+      - const: per
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
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
+        clock-names = "ipg", "per";
+        resets = <&audss_rst 14>;
+        model = "CIX SKY1 EVB HDA";
+    };
-- 
2.49.0

