Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012046.outbound.protection.outlook.com [40.93.195.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CA635972;
	Wed,  8 Apr 2026 05:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775626322; cv=fail; b=SCnCRR82dhyWFaa8K75ORQQFXZZ6PLFru7cFdrLoTdLDepy21lwWmtNlQybVlqSCcPZSoNvf5QCn3ypQGPhXrTdY71bX1CpZZBv42Bk3YivuVUFfKiTMIcv7ec07UedtMjOcbOGdOL90qo3kEVD0tirHOWstqhm4mQnYN5FGd9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775626322; c=relaxed/simple;
	bh=+T5gKlplSSxsGckNyMt6P3IeK4u3ql0auaxSNUYdR/w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CN+dz4mfjivTHUG/1Up7Mv+vVkfXFKz/KGAbN+fuPolRMJD3on4z4kBLuqh6QC7BWNS344aKZw5OHlot6wJmBKtNvfKXvCZ7JyhwQrStGB/vmqKbWfrn/hz0s/uGeUosJGGh11S+0/FgprO/tg7whdtrUjnIiAJlA0EXUvKFBro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=e86HRAjt; arc=fail smtp.client-ip=40.93.195.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="e86HRAjt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dt2wUhBeT1G+HEZi66ZK3klYuX4VqeWGSOeAtqi2E8doc1WJ4DWKf10bJcw2b9UjmLnljIdSLoyj5nDU7JkZvTQi4mxkCSdIvdbIxu+Wmz9ADUb1yB5PHtXIXYd8Iz9gdIMURz3niQixBNas4AD31KrP5AxuvDbkYNPVscs0RjF83Cxk9Csh46Lr9pAvSGEt3LmklDduzo4s3oPwZ1t7+7Z5vVGTZ/Qt6cy/040YpIGIlvxKK2kI+vcFeQcTFeNlFOiWLXg4QkNw8TrDdwf3JqYyIu4FgTLOP8fJUM4efj2RTbWPeq0+7NXsW1NI5V51fFibWSTkimBArNMhEICbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH03qPbqlnxlPe+jCSikFL7z26LqsJ4or0sn97XVp6I=;
 b=IuqIHz8iB7kXT4b9I0XT/FAW2xQSoNFVeJ/ar5VuAIbDb+8nqzTSxF8ofIb9x0BIzc65VkXLWdVchaQoTqzVz4MZQONBTIweOr2kmD21JkWYx9Mh5JHQe1LNz+uzcQgl4p3uboPpwDEVDC+xQkfpC5Endak/A0wt2H0AZRI/lEwka7A804PAoRd3t0nphE7/LJpsCeJEI6ObVGtpbMortry9GAjppMCgdbrLJ6qpbIiFXdyTiKa8FSKyn+KnjoXrvHwr7tgqU7XMXrRixr9OhE/EW0tYwd0uoE8ciWkpm+D9waiX6rULRbxCD2tGdZLHEEbGM/IbmFmFGs22eFJcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SH03qPbqlnxlPe+jCSikFL7z26LqsJ4or0sn97XVp6I=;
 b=e86HRAjtOQzWNMbBV2w1aEEmjMu7b1HV4PjTcDSPArng1VTrR/bvrcxrIKmucXUPRn3WaO4hHbT0EsXRUBt+S751Tj5AVpgOsikXS9FTHQVtgevf2effMJ6e+KCjNg3oKaxajqxHpxqu7Pr/lqeeryEblouwZOM8kGiV/sScy0Y=
Received: from MN2PR05CA0033.namprd05.prod.outlook.com (2603:10b6:208:c0::46)
 by LV0PR10MB997615.namprd10.prod.outlook.com (2603:10b6:408:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 05:31:58 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:c0:cafe::86) by MN2PR05CA0033.outlook.office365.com
 (2603:10b6:208:c0::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Wed,
 8 Apr 2026 05:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 05:31:57 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 00:31:55 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 00:31:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Apr 2026 00:31:55 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6385VtpW1351844;
	Wed, 8 Apr 2026 00:31:55 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, <sen@ti.com>
Subject: [PATCH v4 1/4] ASoC: dt-bindings: Add ti,tas67524
Date: Wed, 8 Apr 2026 00:31:45 -0500
Message-ID: <20260408053149.1369350-2-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408053149.1369350-1-sen@ti.com>
References: <20260408053149.1369350-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|LV0PR10MB997615:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe3aa6f-fd8a-4c21-29c1-08de9530270d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OiK1zlCTBlx4Zq3vwcUWWM/0cwnKyqzRxG7IXyoKIw9ADB84F7Jnqe1MnZz6EcVyPJx9+zyg4QnylbLbOKO23ZcjZKMq15atRSkPh/YyeHoR4C8atIY6H1vnf+XWYcZ7gCrLC7UjCZwJo9xXNfZOPFJTFVzNg+gPNSErbVvxChX8xxuPd+8+YDx7cFjpcpRZMndBRUxuoFpJZV8bsMPstZ/G5egfByjAyhVZQq9ckuAIrziTOzn0TmVdL25bkFPDUnWPW5Kjz2eeyk6v97rpT4d894BAxhwgvv1BXZc6qCk8+xmM9erOxfKEA8HEgCgCHRF4Bf0Z1oTiHCkM9XsbIQ6DSAT9RL+Ag7HxIpGLIRndA6rlHkc0HqT2QxNCwAOKorzgBGI0Be7uGvr5vKbt4qZ93zxa4IfCPQK84XIJ6jlvFDZuDYkrxgqTwdPineNLagoQB0qNyRriNGztYLPdohs6zIxfhn1zeblyL/VloHv1f34tk9u3GKN76BbOdY5wxEk9SwqSrpHm3LNoxIG/XhlGwxWG66Rldxa/MrnbAlh9dHyT0j6eh+LBlnGebnK6w05QnSiyfIklWQKtu51gh/fhHBAp7TSNGNg/9fPbUQGl1/OvGX4qgskAYjG5lZpnujr83nuLimSDzv4qlG10m+bLUDyOJveHeuC1yPVr2ECWMY1IGM1TdTrNSQoChS/oCU6ku9Fr/5VpnsZG1e2Vt/6kHn0aBdJqF6ro8aeV0vY=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H3CfShKY7Wb0SfQSLaW+m0yscYompB445MJFxVmXXNQO01FEo1ScNTJlRC2F4xFmDmh/zbR6jmcIWDdLDptw7cIHV19BVjMYjsXCKtXE/naho+DN5G1N4QsR722wO18+glId5dELkE3x0OVbJEQtSifXtsMv/8nDq959ccWms6fYytepsS3oDrKjqrvdwZ8Ra+oD1BjdX8tbmZqB8IGuXXuwIiXlDnGE2QmjiahXGIUQYJYxZbfM70LNXNC8F97RdqTey7IfP0zMxY8PwlKt8vyqcgcs7NUIUrL+xjnnTz59bvTFhFat4kJXo3ib58eHJ5wAZ6j23ilfspH0whp4AekVBufADdOcvYyNz8sZIz2Pzwmd4IY+1tbXr9+hlXF5A2yLrr8GX01eQtb558c7skOFYRpi7IV8K1MX/SyKiLDWBdqv9HV0q5oVYwbo8wUY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 05:31:57.8110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe3aa6f-fd8a-4c21-29c1-08de9530270d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997615

Add device tree binding for the Texas Instruments TAS67524 family
of four-channel Class-D audio amplifiers with integrated DSP.

Signed-off-by: Sen Wang <sen@ti.com>
---
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

