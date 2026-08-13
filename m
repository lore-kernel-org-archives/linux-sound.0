Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012062.outbound.protection.outlook.com [40.107.75.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BC7422552;
	Thu, 13 Aug 2026 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786603429; cv=fail; b=X9WFejJoGUST7zxeBRvzvzZTH+wlp+h/WKCr1Yy2c7vb9vl+jwYSAPlkUtLw+PcPt76qDksFhLBZM6aVny2zeqqiSYUvfWTgG6x9v1cXAjrtgnixsJ/aUJ7VfofvI6fm1NhO5sKfxLXvPJlaqzQfHkY2D297wrXcueSQDakMDpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786603429; c=relaxed/simple;
	bh=IE7MnV4aLeS0CKgs29+cJIyfn3Ia22BlOLdtgNhTM1M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oMOz8cvTj4QX9hJf7TCmVvMgL6eKM5KccGx15qlREHMxQ4G+B1b/5qw+XVFp/3juCRYz5NqSOdsUeOsenSwvhVkeyDZv//xneffCjL7oJAHjHZiSHjxZUafR7u6A5SQ8IXGABeCJzeIOxqIiWUkQ0P8d4Q8OT+bdFUoiuX43hss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=P7fYJP7G; arc=fail smtp.client-ip=40.107.75.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="P7fYJP7G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uj3MPv9GdvtQaZbdzKwz2sXmC8taJ51uTMBdiEv/a02YQyjl/24UiPDtvbf5SpVOYAVKq1usfwQx2fsLSLy3x5C9nj/0OdxGZIFhAQH8RPPCptevflb3YiLFp5exQa0eL+JYHDe4HXV6HdxOMlxjIEUqzKXNN9SnAYrI4Nx2RxdOUkNsZgYzhpodUJykCN6ElFs8CA7L1Gij2pSw/J3T7t5IOR0VNpN64bF2uUrlCSpSWjZrn1qTJ6JgeKO/hyOPq0c0D6OwUPMOA4pnzBuaegFnIIdRHyJAow5R/4l4Meu1v2cuEF5zcsfuHp2rR6Jz9NdAx7xu6r8MSLou6E+XFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOm6bP2Edizp/VOBGb0XogiJHjHd4kEwZxmAfX40Sa0=;
 b=ljBQtAWaOUPUCwWpaiv+fMw3vQXz/FLohSVpNqrC1qweto0IHxporn9OAuXY5y6w0ulrlASm2SvlTLvUJAbMYWoCwlvi6n3kk7iLiPG9yrDDhK4laWETzTETxbmDp3VjVy+Z25DcP6uZz9FwbOaO03NRasnuFwYcTqtKAleQSs0PZGA1GVgxV8Rj8hJY1WR2VZMiKapesBC4CzqqD8UO1LMtsWwPo+5QDz7BVsntFF1QlFhjZdrBQozncJSzSuO0J1wwSLtwpM+GgH6JuSFoNoeG+BIyCW4euGwB9ZxvJ4o4A9ATyU2T2H8grkQ8j3HZt4h9PmaHL2lNKXEO0E7B4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOm6bP2Edizp/VOBGb0XogiJHjHd4kEwZxmAfX40Sa0=;
 b=P7fYJP7GTjSiBqi/DxeSAblndCKyENEDKI6VfIhGuuG98002w0wayDQgJONarXKOgbaBisaXM4DtKPRXEXF/Sy3HZwW/BaVBQai3iloKHWpjLMtjDlMLqLTbjtWvROM+IyBw+nUMyR103vIUU9UlBZ/ADw9wXwLEoTHug4MAAkNMMHImcbUASOXum64Qo7fwrit9jbDHAJ7hh5kc/eyxSPmncw1koTiedCLGQP9l2lKcsqR9ZOH5SbbydGWSCeMKRkzJVkrDcS4Ifebwdo72tznamFPT6AeyBFyrfOtcpW2ozcSYSIUFYzf9qc4iP9wZ7aiqi2w9+ShcD87W50TbLQ==
Received: from PUVP216CA0005.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::16)
 by KUXPR03MB10050.apcprd03.prod.outlook.com (2603:1096:d10:a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 06:43:33 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::41) by PUVP216CA0005.outlook.office365.com
 (2603:1096:301:16f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 06:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 06:43:33 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Thu, 13 Aug
 2026 14:43:32 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Thu, 13 Aug
 2026 14:43:32 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Thu, 13 Aug 2026 14:43:32 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Date: Thu, 13 Aug 2026 14:43:26 +0800
Message-ID: <20260813064327.1127236-2-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260813064327.1127236-1-YLCHANG2@nuvoton.com>
References: <20260813064327.1127236-1-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|KUXPR03MB10050:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f2ab27-28a2-49e8-c397-08def90631f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|36860700016|82310400026|13003099007|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	t3Gw73BNNRHy+6dPm6zxa0kKt0gR4saE8JR+HL/eLcXCxz/E6HG4DmPBYAvL5n85LrdP3h8YEFMrp9CD/uaqpnmVvCpmLbJ9n1z2KL11UfHi5Q1tYcYABgtrOoSVpd/RBgNctatvVjtTosLTB9T3IePi8pV3t75Yvk4NuCWt3EPJm3FO1JfWvEkqqa9owK1oyAAeqfkyG5N/kNy7c4pSpdnCIi07y2065K33JHjlalAnbyKV7eCUDL0dZ9WvRqgb3wt7lY8/uzOPAfLaij8lMl17DPIV1Fxa/31lYg6lKXdE76ydlpOjcqdQ675MvvGdTjKv1YHPHCqiFmvUfrBVZxGUfzymjeqr+z4MeIvih2XKtqPYfU4IK7mrMDA5n7bO2PCGzxDqwwICrxE2dUDwnLu1Qes9JLzvUFS2NL3nyU9qlVGj21gw8VuJlcxrGvEntwc0Rg9kj/hPXUTZAqGDOBqrz99OQjn9xqgbYlPntmjojJFIJHP40UtX494+ddKXG7F+6yaCtKp4sFVadfDj749KGewD1qFQm6vD2TUS6tD6tqyOFi2+vmM0cQzj45LWdqmGYlkFdObfUmm0Lq/664/pBN6jJ3RFnW/tc1PRiRymIzxLz6J6GJTVesVVXs/P2q1pg5FkZrY2+7sx3h3+Vw==
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(36860700016)(82310400026)(13003099007)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Snz2fODlmGgoEj12pIlqW5z37wB8QzOyiGHwIX6KxIpO/vDOsPI4tHX6wBhTuaQN+9VG7Ipu5ExWxJjSf/oatRHT/WeoT1tIi4tLsCfyRXtyCTEsMzsQuVKxrCUaOtUh1S42lf/AV+8a2AIyg20+yYiOphlWp+euVWx/GNpfgvefOP5kuml9aAvDPJAUUMu47972kQn0UfW+ihkoKWEErAGAij16PDZTPlY1zQPMdeOPFyzpg5ryIJBa9ZN8dHVkImTwEIoKy++oQwfJcNkhLp9EFEw3NN30+6m5gFM3YICUcoZb5rOv0T5cCpNMdwsX8mRKWeV7HbbxNEr3l3kfjiEwWqw4Aqwu1n85NB+etrZiPRmIbu+lkLVqa4myaoN5R/hkOkUMeURLhP3p2vJ6yRUfBaB9ekVBt/257r10HxNvpQ2i0mnchQV07IIPjKxZ
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:43:33.5492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f2ab27-28a2-49e8-c397-08def90631f3
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB10050

Add device tree bindings documentation for the Nuvoton NAU83G60
audio amplifier.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
Changes in v8:
- No changes, added Krzysztof's Reviewed-by tag.

Changes in v7:
- No changes, added Krzysztof's Reviewed-by tag.

Changes in v6:
- Remove '|' from descriptions.
- Add firmware-name in required.
- Add "nuvoton,dsp-tx-slot-mapping" and "nuvoton,dsp-rx-slot-mapping" properties.

Changes in v5:
- Remove the detailed datasheet information, keep only the valid I2C address enum
- Simplify the firmware firmware-name items definition by removing the redundant
minItems/maxItems and moving the channel descriptions directly into individual
item entries.

Changes in v4:
- Refine the `firmware-name` description to clarify the loading order
 (Left then Right) and the PBTL mode behavior.
- Remove the "dsp bypass" option description.
- Update the example node to follow devicetree coding styles.

Changes in v3:
- Remove colon to resolve YAML build warnings.
- Fix 'firmware-name' property definition to comply with binding schemas

Changes in v2:
- Dropped the word "driver" from the description.
- Removed runtime/software configuration properties:
  nuvoton,low-latency, nuvoton,anc-enable, nuvoton,aec-enable,
  nuvoton,vbat-microvolt, and nuvoton,tdm-channel-length.
- Added missing "nuvoton,dac-cur-enable" property for static speaker impedance matching.
- Removed unnecessary '|' formatting from single-line descriptions.
- Fixed typo in firmware-name property.
---
 .../bindings/sound/nuvoton,nau8360.yaml       | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
new file mode 100644
index 000000000000..3aa3df0bcb93
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nuvoton,nau8360.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NAU83G60 Stereo Class-D Amplifier with DSP
+
+description:
+  Stereo Class-D Amplifier with DSP and I/V-sense.
+  This device supports I2C.
+
+maintainers:
+  - Neo Chang <YLCHANG2@nuvoton.com>
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nau8360
+
+  reg:
+    description: The I2C address is determined by the hardware pins.
+    enum: [0x1a, 0x1b, 0x4a, 0x4b]
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  firmware-name:
+    items:
+      - description:
+          Left DSP core firmware.
+          In PBTL mode, the Left firmware is ignored and only the Right is applied.
+      - description: Right DSP core firmware.
+
+  nuvoton,pbtl-enable:
+    type: boolean
+    description: NAU83G60 supports PBTL mode for mono output.
+
+  nuvoton,dac-cur-enable:
+    type: boolean
+    description:
+      Adjust DAC output current to match speaker impedance and prevent
+      hardware damage. +3.2dB when present, 0dB by default.
+
+  nuvoton,dsp-rx-slot-mapping:
+    description:
+      Configures the TDM slot routing for DSP RX functions.
+      Each integer assigns a specific DSP internal function to a TDM slot.
+      The indices of the array correspond to the following hardware functions
+        (0) DACL
+        (1) DACR
+        (2) ANCL
+        (3) ANCR
+      Assigned slots must be unique, except 255 which disables the function.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+    items:
+      enum: [ 0, 1, 2, 3, 4, 5, 6, 7, 255 ]
+
+  nuvoton,dsp-tx-slot-mapping:
+    description:
+      Configures the TDM slot routing for DSP TX functions.
+      Each integer assigns a specific DSP internal function to a TDM slot.
+      The indices of the array correspond to the following hardware functions
+        (0) AECL (Acoustic echo cancellation left)
+        (1) AECR (Acoustic echo cancellation right)
+        (2) ISNSL (Current sense left)
+        (3) ISNSR (Current sense right)
+        (4) VSNSL (Voltage sense left)
+        (5) VSNSR (Voltage sense right)
+        (6) TJ (Junction temperature)
+        (7) VBAT (Battery voltage)
+      Assigned slots must be unique, except 255 which disables the function.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 8
+    maxItems: 8
+    items:
+      enum: [ 0, 1, 2, 3, 4, 5, 6, 7, 255 ]
+
+required:
+  - compatible
+  - reg
+  - firmware-name
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@1a {
+            compatible = "nuvoton,nau8360";
+            reg = <0x1a>;
+            #sound-dai-cells = <0>;
+            firmware-name = "NAU83G60.kcs.bin.l", "NAU83G60.kcs.bin.r";
+            nuvoton,dac-cur-enable;
+            nuvoton,pbtl-enable;
+            nuvoton,dsp-rx-slot-mapping = <0 1 2 3>;
+            nuvoton,dsp-tx-slot-mapping = <0 1 2 3 4 5 6 7>;
+        };
+    };
-- 
2.25.1

