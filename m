Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D583A387564;
	Thu,  9 Apr 2026 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775772422; cv=fail; b=fynbcvWzwvUF8Iznz3jvJ95HI4C/hS6zpShXIOA9hEe5NNPjhnBiS8la3bjWiTqbdNQYx+1W45sNa3/z7t/YxPJJiib4MWP0BJTzBoDFkeHnkm3T/ZtTOW+VKDvpXw0Vd4xrYULjaq083+0d3HupOq92v0tIZt6ZF5RuteTrc88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775772422; c=relaxed/simple;
	bh=0yCkjPdO3zPg+8ORRj6KJxaX+ix7N3pa+veSF12jwIc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XK/spCcr1oD10BF3w+QZFt0EgRL2yz+iLuHmn9f5biO4KDOIAXKWIs4nx/2pwmO+DZvgXJMIreKZZbZc/6KX96NtDkmUWEqjJf8L5BwdHM6nQGeLRL1yeb2JaUNYLkaoj4fOzbCXkJse8suW2WPywUSzeDE49CmF8QwYRpTJS6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EwbN8D2t; arc=fail smtp.client-ip=52.101.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EwbN8D2t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juCqEP0ELBQ+PJTovD8oCza3R8csQ3OsGWLPlwZ9s7BXmFmC9cOtcJbp+x/Krn5V/1Q4DdBWDo9qLaHHC8xc1eBun/r8jph75dePiU3alHO6kE8ibZFXEJp1grDNGynHL+1pi3g0/qfNgUxtXQ6v65gaAD+Ag/VHLNiwMd/90C2ZVX2D1mvdc2lzZpjVnAjt9Y9gOdpbCHOxyIq+Luj+uEKbFf5CVwGjmeCSEHh2O+wlmwtFFxdRv7iWUfVP0/DxkQiCkb/lRpAMx3CrgUWNlQaypEr7EtrKjdf3MtJJZNHjAzFx3HtR0ek71AMLnMnatFwjcl7auZ7tWahc30Fvvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efP2CD+t0Km/oZalMfishsc/OEwrOCmF6ss8HfXazqM=;
 b=UdLnzRD9e3Jl54YGVJccx8KE2FAi9UyUCSrkda2PvAeDw7TxxKn2M7i4jCVxAAPkQCXtsxBU2rMT5DUEp2Cn/KudnUmO2yki4PFAfEpOieY0EMO0eywrdaCg8Py693acfePxMsSq5v0B+98ErZg3ft6zHmIx7AfjW5DM/Vz1S9DRlUNE/R3tSWnCp+l7MhQ6s53k19y0AG1Yr7dSXL9gvrRrK5H7CxRL0QZK92SaBBhA8cSGCQ9UgF4KB1hDGinbQflSjo1ZAJO0orhYxkqtYRq3cqNc1zZU91Sjy1/GGc/Pkw3r1A/vctU1wxRmbSAl5I1hsiNHKZkIOfuqNH9jXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efP2CD+t0Km/oZalMfishsc/OEwrOCmF6ss8HfXazqM=;
 b=EwbN8D2t4D/JrPfFD0tmL/bGrdBqu6ncyxL3yTOoSgw+CxdTSqd58e/TzKRBOgrMiOV5tec0LCA5kX9kZpJfZpinZs1oSQhZxt2KspPW7TsTBq3VmsZ/EZ7PMDUPLvhs96TPp4BlQx4PyXCVnu/9fI8cQti73v/SJHnXENiKqM8=
Received: from LV3P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::33)
 by PH3PPF46347F8D1.namprd10.prod.outlook.com (2603:10b6:518:1::79a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Thu, 9 Apr
 2026 22:06:57 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:234:cafe::96) by LV3P220CA0001.outlook.office365.com
 (2603:10b6:408:234::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 22:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 22:06:55 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:06:54 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:06:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 17:06:53 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639M6r9I295509;
	Thu, 9 Apr 2026 17:06:53 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, <sen@ti.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/4] ASoC: dt-bindings: Add ti,tas67524
Date: Thu, 9 Apr 2026 17:06:03 -0500
Message-ID: <20260409220607.686146-2-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409220607.686146-1-sen@ti.com>
References: <20260409220607.686146-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|PH3PPF46347F8D1:EE_
X-MS-Office365-Filtering-Correlation-Id: 81bbb479-d0d8-4afd-9ec8-08de9684504c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	s+GXS+/icOk4O7uwixxq+VgHXCJfElC8Ec2NmxJzML+v+g2ruEWY0r++uGTbZjP2QsFikwas6Tm8zb1AgzmNc6XJLNc/fX3OlVUuf7Os8GTPTnFpS0wwof+fFJYauK4AjvyXHSXqGErXkrvdPezOb0C6/XDhsLNAnVN+v3jESpum114Q2zFQuZBoRGE+IqJDewmsV8tCEnhCrmYmN1VXzq4Br9rS6yiAWZGd6GI9/oqNc/gf89dqBed0DS55NyzEtCgaZSzKahmYeuON9rKx0DO6ulp6zQOgEO9j+V76QR5LrPsabEEDx5E+KlhiD8v7q0RrUoD1wPxZBk+0lHKg3X8s2Y6xux2PZZBkCLGx1jmNLCBRwqwo9xRf6R8CEbaZAUryuVvlLKbqDZSadOy3LJeVbtdn6d28DZs9rW7oXBFOMzSgdVQTxYNKrlWMbBXmDKATLqSOR310ujyNLmVUpDZESQ/7Pz6VTp+ftbfB7Ci17igi0QcTL/HuNPh5P9hF9AHZOInV9La0jhgoXrcoSGLG0+b0zKTXwQh6d7SoeqmJveGbax9YuJUJg6PIjmES2IDxMg2imNviBhYd+JvEPf8aATmt8B3VHGaVx0yS8p31SYHvBbC0DEifVGJKs9+MwsSxufAxv5r7Shwlnn9ZSjrKDfrcDGUUo5+EoXcLWw0WiLvl6lPzDYLYH7AWq5+EYOucogei9VWyyOcrUlTp5+bo6vpPvR32tRjQBmMVzPU=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/82EfL//XuiSgpwPf5sa4FRyGxzRGECf326VbhycjlGzNq/PGurhELPca24cbl40/2oGQakC1cyHdv3ukWlofwzdidPQHvsXlAaRdiykgbvQWsErt0JnLrSfsxyWQ1QPCzVSx872RZmSdIML6IQKYCx4KZrNLsmqVNaEhSOlZn1y40GT6io7ck7C4IfHNYmJ82W6EzfzqHCxVlLCCaNbL+LHDb521beYbqce8AC5021H/8eqgUM3EB0iT1H3kzb7Rf87DzBvlful0a2iU6Uz75uSauYNbsYBB8TVKxU5qH89EOO3m+ECUUlWV604d5QXqFlD2EeDg5wgrnthBim843mbp51ZLkHit2ZcYlLkxQUrAZqBp9i6Gmt7vZ0CWohYG7GotT5Li9rplMH/wm9nv+e/ZPbTQK8OC3jBDr88ncLacl9jxS3YUUVK0T68ywF3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 22:06:55.9072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bbb479-d0d8-4afd-9ec8-08de9684504c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF46347F8D1

Add device tree binding for the Texas Instruments TAS67524 family
of four-channel Class-D audio amplifiers with integrated DSP.

Signed-off-by: Sen Wang <sen@ti.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v5:
 - None

Changes in v4:
 - Corrected ti,tas6754 compatible with a fallback of ti,tas67524
 - Corrected comment spacing

Changes in v3:
 - Renamed ti,tas675x to ti,tas67524.yaml
 - Removed tas6754 compatible instance
 - Changed pd-gpios to powerdown-gpios
 - Cleanup unnessary "|" formatting

Changes in v2:
 - None

 .../bindings/sound/ti,tas67524.yaml           | 280 ++++++++++++++++++
 1 file changed, 280 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas67524.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas67524.yaml b/Documentation/devicetree/bindings/sound/ti,tas67524.yaml
new file mode 100644
index 000000000000..812a4d39e2a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas67524.yaml
@@ -0,0 +1,280 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tas67524.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TAS67524 Audio Amplifier
+
+maintainers:
+  - Sen Wang <sen@ti.com>
+
+description:
+  The TAS67524 is a four-channel, digital-input, automotive
+  Class-D audio amplifier with load diagnostics and an integrated
+  DSP for audio processing.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ti,tas6754
+          - const: ti,tas67524
+      - const: ti,tas67524
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+    description: |
+      The device exposes three DAIs, selected by index.
+        0 - Standard Audio Path (Playback)
+        1 - Low-Latency Playback Path (Playback)
+        2 - Sensory Feedback (Capture - Vpredict and Isense)
+      By default, all four channels of each DAI are active.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Active-low falling-edge interrupt from the FAULT pin. When provided,
+      the driver uses IRQ-driven fault reporting instead of polling.
+
+  powerdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the PD pin, active low. Controls the internal
+      digital circuitry power state. When asserted the device enters
+      full power-down mode and all register state is lost. Can be omitted if
+      PD pin is hardwired or externally controlled.
+
+  standby-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the STBY pin, active low. Controls the analog
+      power stage. When asserted the device enters Deep Sleep mode but
+      remains I2C-accessible with registers retained. Can be omitted if
+      STBY pin is tied to PD or hardwired.
+
+  dvdd-supply:
+    description:
+      Digital logic supply (1.62 V to 3.6 V). All three supply rails must
+      be within their recommended operating ranges before the PD pin is
+      released.
+
+  pvdd-supply:
+    description:
+      Output FET power supply (4.5 V to 19 V). All three supply rails must
+      be within their recommended operating ranges before the PD pin is
+      released.
+
+  vbat-supply:
+    description:
+      Battery supply for the Class-D output stage (4.5 V to 19 V). Optional
+      when PVDD and VBAT are connected to the same supply rail. When absent,
+      VBAT is assumed hardwired to PVDD.
+
+  ti,fast-boot:
+    type: boolean
+    description:
+      Skip DC load diagnostic sweep at power-on to reduce boot latency.
+      Automatic diagnostics after fault conditions remain enabled. Hardware
+      overcurrent protection is always active.
+
+  ti,audio-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      TDM slot offset for the standard audio playback path via SDIN1. A value
+      of 4 maps to slot 4. If omitted, slot assignment is derived from the
+      tx_mask provided via set_tdm_slot(). Without either property, no slot
+      mapping is configured.
+
+  ti,llp-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      TDM slot offset for the low-latency playback path via SDIN1. If omitted,
+      slot assignment is derived from the tx_mask provided via set_tdm_slot().
+      Without either property, no slot mapping is configured. Disabled outside
+      of LLP mode, and only relevant for TDM formats.
+
+  ti,vpredict-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      In TDM mode, enables Vpredict output and assigns its starting slot;
+      four consecutive slots carry Vpredict Ch1-4 on SDOUT1. May coexist
+      with ti,isense-slot-no using separate non-overlapping slots.
+
+      In I2S mode, enables Vpredict output on SDOUT1 (Ch1/Ch2) and SDOUT2
+      (Ch3/Ch4). The slot value is unused. Requires a GPIO configured as
+      sdout2 for Ch3/Ch4; without it only Ch1/Ch2 are output. Mutually
+      exclusive with ti,isense-slot-no; if both are set, Vpredict takes
+      priority.
+
+      Irrelevant in Left-J and Right-J modes.
+
+  ti,isense-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      In TDM mode, enables Isense output and assigns its starting slot;
+      four consecutive slots carry Isense Ch1-4 on SDOUT1. May coexist
+      with ti,vpredict-slot-no using separate non-overlapping slots.
+
+      In I2S mode, enables Isense output on SDOUT1 (Ch1/Ch2) and SDOUT2
+      (Ch3/Ch4). The slot value is unused. Requires a GPIO configured as
+      SDOUT2 for Ch3/Ch4; without it only Ch1/Ch2 are output. Mutually
+      exclusive with ti,vpredict-slot-no; Vpredict takes priority if both
+      are set.
+
+      Irrelevant in Left-J and Right-J modes.
+
+  ti,gpio1-function:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Function for the GPIO_1 pin. When omitted, GPIO_1 remains in its
+      power-on default state.
+    enum:
+      - low            # Output: driven low
+      - auto-mute      # Output: high when all channels are auto-muted
+      - auto-mute-ch4  # Output: high when channel 4 is auto-muted
+      - auto-mute-ch3  # Output: high when channel 3 is auto-muted
+      - auto-mute-ch2  # Output: high when channel 2 is auto-muted
+      - auto-mute-ch1  # Output: high when channel 1 is auto-muted
+      - sdout2         # Output: Routes secondary serial data output 2
+      - sdout1         # Output: Re-routes secondary serial data output 1
+      - warn           # Output: warning signal (OTW, CBC)
+      - fault          # Output: fault signal (OTSD, OC, DC)
+      - clock-sync     # Output: clock synchronisation
+      - invalid-clock  # Output: high when clock is invalid
+      - high           # Output: driven high
+      - mute           # Input: external mute control
+      - phase-sync     # Input: phase synchronisation
+      - sdin2          # Input: secondary SDIN2 for I2S/LJ/RJ ch3/ch4
+      - deep-sleep     # Input: asserted transitions device to Deep Sleep
+      - hiz            # Input: asserted transitions device to Hi-Z
+      - play           # Input: asserted transitions device to Play
+      - sleep          # Input: asserted transitions device to Sleep
+
+  ti,gpio2-function:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Function for the GPIO_2 pin. When omitted, GPIO_2 remains in its
+      power-on default state.
+    enum:
+      - low            # Output: driven low
+      - auto-mute      # Output: high when all channels are auto-muted
+      - auto-mute-ch4  # Output: high when channel 4 is auto-muted
+      - auto-mute-ch3  # Output: high when channel 3 is auto-muted
+      - auto-mute-ch2  # Output: high when channel 2 is auto-muted
+      - auto-mute-ch1  # Output: high when channel 1 is auto-muted
+      - sdout2         # Output: Routes secondary serial data output 2
+      - sdout1         # Output: Re-routes secondary serial data output 1
+      - warn           # Output: warning signal (OTW, CBC)
+      - fault          # Output: fault signal (OTSD, OC, DC)
+      - clock-sync     # Output: clock synchronisation
+      - invalid-clock  # Output: high when clock is invalid
+      - high           # Output: driven high
+      - mute           # Input: external mute control
+      - phase-sync     # Input: phase synchronisation
+      - sdin2          # Input: secondary SDIN2 for I2S/LJ/RJ ch3/ch4
+      - deep-sleep     # Input: asserted transitions device to Deep Sleep
+      - hiz            # Input: asserted transitions device to Hi-Z
+      - play           # Input: asserted transitions device to Play
+      - sleep          # Input: asserted transitions device to Sleep
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: Standard audio playback port (DAI 0).
+
+      port@1:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: Low-latency playback port (LLP) (DAI 1).
+
+      port@2:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: Sensory feedback capture port (DAI 2).
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+  - dvdd-supply
+  - pvdd-supply
+
+anyOf:
+  - required: [powerdown-gpios]
+  - required: [standby-gpios]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        amplifier@70 {
+            compatible = "ti,tas67524";
+            reg = <0x70>;
+            #sound-dai-cells = <1>;
+            sound-name-prefix = "TAS0";
+
+            standby-gpios = <&main_gpio0 33 GPIO_ACTIVE_LOW>;
+
+            dvdd-supply = <&dvdd_1v8>;
+            pvdd-supply = <&pvdd_12v>;
+            vbat-supply = <&vbat_12v>;
+
+            ti,audio-slot-no = <0>;
+            ti,llp-slot-no = <4>;
+            ti,vpredict-slot-no = <0>;
+            ti,isense-slot-no = <4>;
+
+            ti,gpio2-function = "warn";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    tas0_audio_ep: endpoint {
+                        dai-format = "dsp_b";
+                        remote-endpoint = <&be_tas0_audio_ep>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    tas0_anc_ep: endpoint {
+                        remote-endpoint = <&be_tas0_anc_ep>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    tas0_fb_ep: endpoint {
+                        remote-endpoint = <&be_tas0_fb_ep>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.43.0

