Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023077.outbound.protection.outlook.com [40.107.44.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B66E325732;
	Thu, 27 Nov 2025 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236600; cv=fail; b=aRLOLturktpdGLtusaSqAhYSQoTImk5G4dDvD4pilSRjnMKFCgS2uak1h3NQpV6K83XTq8uug4qQa2fBm2x+KL911/MTkvldrDXYpdbi7rNcabAbLobNP4eznHFyboRf5xfKrcspq3ijDYPE2Ay2RabX2mS2dqqg+Kob1erzlls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236600; c=relaxed/simple;
	bh=oDqG1sNpXOn4XQbl4sNmA/OKBmJ26rJ3rUdkYyQmoRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZ1shGeTjd4bKN5FLxLee4QWSUdHOYh4YBMvtt2CDxWtUWu3S7d1o9JWMAojlfJq91JvyUsL0ZAuPhAspixYukugf6kNPikssUJqL88pHuGGo9KpmuiiWFvz/6Ie+2t3d/SOIH+xkssPM0kk421wMSDI+Q2MjvRHXwQJca3aMi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szNrBARfXNjdbZAKnNrrb+rjL1Wwkn3dfWs3HSalUL/VKIbZX+ljKVHRzIsjVF0vcVQtkKvM9vk0XDbLUF/vgZAnqxqHeB5QOjQTXbzPptoKk/U/UI/vN9ZHdNINu8EELTxa7t7NvZuY8X1RVvuQK0yzHz5gTAJ8ziE7zeObzjQGA2CN8b2hNK4dksJVNBJ3gdh9soecNZS4LXYLklpDwa70UGdfpdGcBusZFVAftvlH5Fo88qYgQ3ijlNM08qmehpA8ipJ/TmGybMxXbNtjDBV6MijAPAdRvwqeB0zvcL86PvQAdSXGLaNmgMxRzDVjqI8mkAx9YOQy/KtlbADLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dld8OVSxTlm3s9FuCFaOV3HggMZmXXlvrzb+RHFHgTM=;
 b=KzbmiiRSI8e0ToRVJFtmkUnByOGOzpGthQa4vrGPdB2nZKBM2KA0UFn158lU1wYheQ3f5l1lRfd1FzE1h42xgaRvVICXGhZDotTTZyieC9ssf518bnRGYMq4qpdfAo6D2wFg7FuPw8YjT0ApXA5GpBN+MiBZeb20Py36toIqQ9Z+YMvlQM9j55+zD5rk41FA2+xIDXJ6bArGf+9BNc40EYZgIkQm1V0xgeFl9NoksFRp/ZFiecHH6QWghIi8puQD9wzwYU3YZ14RfPunwdHdvy8NOyKfG5LDXI0A06QyM9vnhe0QP1HvO36irXNsmRPsKwWqM0B3/J/KYXfNE2MKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) by SEYPR06MB6983.apcprd06.prod.outlook.com
 (2603:1096:101:1e3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 09:43:11 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:8f:cafe::bb) by SG2PR01CA0140.outlook.office365.com
 (2603:1096:4:8f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Thu,
 27 Nov 2025 09:43:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 09:43:10 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7939440A5BD8;
	Thu, 27 Nov 2025 17:43:09 +0800 (CST)
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
Subject: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA controller support
Date: Thu, 27 Nov 2025 17:42:58 +0800
Message-ID: <20251127094301.4107982-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
References: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|SEYPR06MB6983:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9d7f5b0b-3205-407f-2784-08de2d996050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OwP+D+pk22tCX9WOUgPOP+x7zLJQFRdLq6yEWioXh2OhNp3Jv7pO6Q0QEnYu?=
 =?us-ascii?Q?C6BFGe1OwSEiSGDcxB7esFXY1/t4k1AtanB4Dy6SajkqqYwSgAfAHcGrp63y?=
 =?us-ascii?Q?Cs3UslUO4X7xypRg5r8j1GFNvEmCG03qIzZm0Lcugiq1XY78brTmL85I3z6m?=
 =?us-ascii?Q?DsleL3fJZnZj+F2POk00ikqwqVs1UxCoylFubWmH0dY0ARvl71ZL2OE2erCV?=
 =?us-ascii?Q?cfCHNZ4I3908YwApdMr7MfP8fOeVYIIiR9ySDFkzdA3BjtbvpsgV3tQQLpF6?=
 =?us-ascii?Q?rMav1Wyzo4jvJvZ2I135oEju79MCrUGF2cu1QqT1b01DBZNho89bzMwgJ6fD?=
 =?us-ascii?Q?E+2WYdyHj75T87xOuI12fljjabgiqTpzaItGug+z8fmV3hlTGZUvTRZT+gFZ?=
 =?us-ascii?Q?zWRCLpbCJu2P98JCIv6l/Bod5IiRWEW2Ad5k6YM+/Y0kSLEPOd7Vd+vmlvHS?=
 =?us-ascii?Q?tYyqmmNqwFhRAYgYjUAIgV6OQK8oOgcVfLIDPUFe6pkGMfbY4S+TabFP7GEE?=
 =?us-ascii?Q?stOlmaAK5jXdt9D3BbIs+p2nPJH4s6iDkfcVaO11HttRu6wWifItKkDeZRuN?=
 =?us-ascii?Q?nenWUz7N3vz+hIwujAsq5h/EqW+AlrsXxNwBufODeR8K8G0fs198D92t8gB4?=
 =?us-ascii?Q?Bv3B22+3nlBRlZZOvT6m/w/e5/NMth9h0MbCAL5Kn+YAHCKA/Q3DJozETv8v?=
 =?us-ascii?Q?RRnJ+fpyP8KKrDIaIU1V7/e3bapu2LuPPhXMK2Y3rodg+DX+a+XqwLFfs9ra?=
 =?us-ascii?Q?et/Yxp2e8BX9ZPFiOi06RM4Wpeq85tRj3POF0Vfjixd8UyxOPquEZVsiaRR/?=
 =?us-ascii?Q?EEVOu8g/upP8Ze5VIqTWdCCrxkX9Os4zXslf37x/UmuD4JBO9nlGxZbVl9L1?=
 =?us-ascii?Q?Llevt8nzvgVhQQd6Zlr1E4QqoSjdVbEkHEuZLtDWsfQg71kD8nQt/lNy1tjw?=
 =?us-ascii?Q?9fis2wpFkOZa0XWseZyyOsr6vAoUSDClFK4dBLZ+6Is/tyxhFD2m6774X4+c?=
 =?us-ascii?Q?NaG04LRCk4JkMCBXy9aGjVkaHOG0bz721dSoLuQawlHRGcCKafxdrYAln56C?=
 =?us-ascii?Q?uPvL/0xc37osjTO9aw2Icq5Tf/SE1H2afxZQvzKKDF2GUUCy2/IG0/dlewFY?=
 =?us-ascii?Q?NbExQ1ncRKU7OuYhhOtWqXD3Qb9yvqv9oQVLqPUKdGnQmBMATCAUjNtrXch6?=
 =?us-ascii?Q?P0oFQWNrizzEgRzr6AjUO4cwLGNm+hyKi3lCM0+thHEzXMmaSW5PUnV1Sges?=
 =?us-ascii?Q?1cG4SOBO/Pc2WcBE50cpcIDNsaR/7NJ6LC51mxwJRtv5FEsFGI/X0jpKd0Jd?=
 =?us-ascii?Q?bTlAJ1liedemYjaOhN+A4e90zGbEi8xLH9ql8lGCYuk/bqMnV2/ejyPLsUw1?=
 =?us-ascii?Q?pB0g19o7UoyRxEo23peoWz4n1HNqesH98PMitPpFd1ti2QG4nefwg/med17O?=
 =?us-ascii?Q?cz/JHsyJsKGpLgYpsvK7sfDmKOhC0nnMIhWUpqT+yZj7pJTcJwP6KRqYzlx7?=
 =?us-ascii?Q?QR7VaNj26AuI3wTEF0q/hm5hjBdY9hzMULGQ?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:43:10.0657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7f5b0b-3205-407f-2784-08de2d996050
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6983

From: Joakim Zhang <joakim.zhang@cixtech.com>

 - add CIX IPBLOQ HDA controller support

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/sound/cix,ipbloq-hda.yaml        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
new file mode 100644
index 000000000000..c9e4015a8174
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cix,ipbloq-hda.yaml#
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
+properties:
+  compatible:
+    const: cix,ipbloq-hda
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
+  cix,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
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
+    hda@70c0000 {
+        compatible = "cix,ipbloq-hda";
+        reg = <0x70c0000 0x10000>;
+        interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audss_clk 7>,
+                 <&audss_clk 8>;
+        clock-names = "sysclk", "clk48m";
+        resets = <&audss_rst 14>;
+        reset-names = "hda";
+        cix,model = "CIX EVB HDA";
+    };
-- 
2.49.0

