Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013067.outbound.protection.outlook.com [40.107.44.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19C430D3E8;
	Thu, 20 Aug 2026 02:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787192983; cv=fail; b=n0nyPr9qXEvLUKgly/6+d8zkroC2YIPchsytlgPD5YGgge1l6BJDvfTtosUXw+lJIFcV1qYk0iBFEKeymTmjF2W5GwrZ0fKjG2MrKnsIB11SVv8S5FDke9GPkKqcVRO52ikX6G7Lmee4Zavt8nNZOl3Mpul5krLDmQcUhXT6PkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787192983; c=relaxed/simple;
	bh=kg9n4DMy+Onk7tG2XnatKthetP0hGI4y4FsjhQcOz5Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=olH7hsLnzsFfA70MkqrwDOC1pJJ/hCtxT9M8MuyDaC8UL6PituxjvlyrzWrCz4XPxlxlJ+I9qCLbA2nhCd/o2BOJ1TIfEMo4QUpaRURyttvwDCRj6+ksnzmMg4/0aV4kZcfxe0tM1fErXErOAeH5S4OSd+reSVQGdypzwbOG9L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=xSOAdRUF; arc=fail smtp.client-ip=40.107.44.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="xSOAdRUF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SL5QmVLL/OTrR2dHbSbIhqIjHy8L/AWbWG6WaWO8WZJLs7/+yt4EUsBB1rsWQEvIlusj8DVA7d3cBfR1Mm5XF/xmOC7xYaaQ65ui8sXuwdd3HMTykPsWP8G4WW/k89XV/vBdS1suVlYLti70vjhMwzMr2LqmrhkP0LWZqaSbjHpP43IxPsDiDJonOX96i6rAH7GPWwdO872RfX/c4TE/bxK65LQLw5IJUxuz6f5WdxmMuY7l8p3k7s0RBnfPmJz/Otjs1kZhaOIEQnkax+DoK025yPZAQHPPl4xdFE/iRkc3dZPDkUzKP3gShgm9a20IHtjusbFrEN+aJI1V4OQ+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mry83HCNZItXR2sgBIZsaSTuLgSoon5WRn2oVE+GyEM=;
 b=wtLrsdh1LkTfqFLWw/QgXRyaQmHnkTp7HDUDFkdsOjttGgdf3eBF2wYVlZDBfjgw8HxkWsXkXgFHgK8Wa70JyG7RNF1x+TxBkz63IRrSx5IZu3SezLYNwW3XXE22AIbnAFNiaGyknTj0KD7zQvvJTiUMXNf0VrW6IHmEwx7UWmhHeqQ7C6E3sL4oRI3MFsrvYfWD1nk0Aqo2zi8uRf03NU8WeerWxDtEuMUukKFu8bzrCSeQnhIslqIXgG6bg6aNNoE8ZVLSwvF5IFu1f1gv4cLc915gPOcCxu7N6ust9MRzfuxps6fIXyM1Hi91q87+wY5emeT3b0n58h43428oDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mry83HCNZItXR2sgBIZsaSTuLgSoon5WRn2oVE+GyEM=;
 b=xSOAdRUFBXpYHgGguP3UsEaMWfr2SExF/YXIDhxxZBb2E4LBHJdTP3pJpgkEsiR/FHUKOBAlm33mPgnuaU0+E2SnUoJQui0roicBRLFN7Usr5zik36VpOy9VqUizx2sNYIAvwt/mI4PdlC6/OsYYjT3kBNoEATa2zcw4ExxuIW9WM3oCbyVSra+rbZmkGpuvwRiAYn51gaZSB0GIiOcP+K3+RKji7CvGZ1XO+iWTkSzTx/KNT6dr6d+OgHzJ3DD1Ld7DVS0gK3QqfS6/5gLEXdFSW/bzlK0OGhaPxgdHRi8J7M67k93Rj/e/FE/TIXh09i3LnXjR1UT1BE66wbdbxw==
Received: from SI3PR02CA0001.apcprd02.prod.outlook.com (2603:1096:4:295::8) by
 TYPPR03MB9580.apcprd03.prod.outlook.com (2603:1096:405:395::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 02:29:33 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:295:cafe::9) by SI3PR02CA0001.outlook.office365.com
 (2603:1096:4:295::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 02:29:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 02:29:33 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Thu, 20 Aug
 2026 10:29:28 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Thu, 20 Aug
 2026 10:29:27 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Thu, 20 Aug 2026 10:29:27 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Date: Thu, 20 Aug 2026 10:29:24 +0800
Message-ID: <20260820022925.1174132-2-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260820022925.1174132-1-YLCHANG2@nuvoton.com>
References: <20260820022925.1174132-1-YLCHANG2@nuvoton.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|TYPPR03MB9580:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba570a8-08a8-4a80-5110-08defe62dedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|82310400026|1800799024|13003099007|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UTtwVDxub30TQYkq+lScCpqIYbdWHaldc4laThQD8KZlLXzbYe4FssYMf5JtBA1pbjW0fGxj4H+Xvb4IN4qQtRtoEDkTRWKnomtwSWxEEOUdJhPfWiJtVVn61xOkIW/NyS/HESGOGmx5SwGk9Hu1SADZBdLEffOEj8Gcp2oo54/bQsezegpZvlYHLDm0aJEZVZ9ytj1XYcgj0eilFVuQsQV7CKRd6osCZbOMaOURmBz76lWc9bG0QFQZIFYNJkxm2V2OUO1s4Vb/KRzcn9XV2T28fvp1DVOE7rMPldhP584Cqso2GtdZo1rQtoLyh7NWhCZjP/X2FuHXxwwBm+hULA1ZYy6OJ9xtaRK5nV3QJQBSRRa7y54shlupNY8aoDhWLLyEskPuMQWhYJz03fWcb7JjZpBFgu3RLGWVFX+8nanynK0IFEiu8teKaU7ktzNbNVgPrtQefkzyhehq2VNVN0An+Gebqhqanf+XxiGYM69qAZELDr7kHIDmYq68yewJHogRP3MZMzn2h61HUmGbtLwWie8UCo3czuMJ/gOZ3B4zhNhlO1VSnT9jqVeStcA7ope3XMOhhbIkOLd8KR/kHzzKyhEs1IKo59FUNzQiT0cM8v89XY4oKd3VsvyI1VK7NyV7m02bWzcyDFbJGXvG9g==
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(82310400026)(1800799024)(13003099007)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	STOuW4WdeOxivDZMnNYC4GMDK4ZPN/XDmFKF3lHz0OShxM19UnkpMwi62qVV2ofeqyJfAzDGAjeICVPX2hPvRjgJlObK/BmMw3bNBu1oZg3blybe8C0MtxQCp1Wg+4HRoKWibEPyxbxII8V/LTASITsJf8raU6vipypwqxSDvT0WrvycrKSm4FQ28dgRJE52Jnvl054O+5B8WQumknA0X34dYvf8h5aW+2K7FYRBcjtGu/ZMl29hytcWLx+Mo/+9SOZgckxwv1Xv9uPUjF8/lab1msu5r+pp0AhG4poyLR3sX5aQL/wMF4DW31nRyjxqRTow++w+zRcc1wjomY0ddbkixiKcl1GWuuyKXQI2Q730Qq1pKvvMeF7U8sENq6M7ZOO21Wg8yStXajb7D4EYG6Md6WyBeBRGlDcuLvZNtcTh2dMtgUaOpMDBU3Gv4Xhj
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 02:29:33.1350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba570a8-08a8-4a80-5110-08defe62dedc
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9580

Add device tree bindings documentation for the Nuvoton NAU83G60
audio amplifier.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
Changes in v9:
- Correct firmware-name descriptions for Left/Right DSP binary requirement

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
 .../bindings/sound/nuvoton,nau8360.yaml       | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
new file mode 100644
index 000000000000..3edab944a4e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
@@ -0,0 +1,115 @@
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
+    description:
+      List of DSP core firmware filenames. Both Left and Right DSP firmware
+      must be provided and loaded. In PBTL mode, the Left DSP must use the
+      same binary file as the Right DSP.
+    items:
+      - description: Left DSP core firmware filename.
+      - description: Right DSP core firmware filename.
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

