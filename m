Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010059.outbound.protection.outlook.com [52.101.193.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728F11A23A6;
	Fri,  3 Apr 2026 05:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775192804; cv=fail; b=MNoEmAV7GL3UROiyXgorui/cmY0Q1iXQi7caOEBKYaCXqQ0pR5Qi6UAQWmbpbBVfzFFWVn/c+OW6wyUqAXPeRDeyLkr1yUwV3abV890cQBQ/7RfqdM1CAZKVYEM3MxH35xiwLUp/VBqSnW/CmBgAOZUEVwQIkLgA6jOdF4hQfM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775192804; c=relaxed/simple;
	bh=slVKpp/gvjycgvG/xEwqkLSthvwmANsnoBISOcMv2qQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JJTYbuloZOuJKITrNp2JgCNPDrFunBUGVdIirRHeLucW6Lqw4LF0CbhbMMX+76YQtjMn7hHCh26TXjVR4CS+vn2ZSlRtwDWZ7P+rDIzZ/tGLaFo+wZdvSgAfN74bX461wfAFkT2NW4c4hdy4RipP+fHJP+qh6AHqnR68nLUfL/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=im5IWJjR; arc=fail smtp.client-ip=52.101.193.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="im5IWJjR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cln+iYQfxJM7NDndAstwqoEvcHU7+RDyOlUiHW/Kojb91eF8mMHz1Npip706NH3s8HildVRtDIN5tPFH7zUYfWFNMin6Yox4nVZ7czf1haCZXgu02g64Lz3+ORGhhvpNmahk01tVWQbM+dGKTx2qst2SAp5RwtgY3Six1r0sZ6y+554m8QjpzNgKy6FqXnr4KVEVGyshBPcVYJ8XldXoeOe0rhn/mm9mc65lGFRLdhIznT61i4oVO05mJ6UPx5EF7Bh5ZoUK+FDGxWhLh+jdAaKSAOlF84YVpXILdqWpkh7vqJ2jYGqDQYcco+ryISA8ATubsQg6F6M/zCRWk4K+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCMFStph61gpNqlOUlWZEfWux8W2aQsnNc9SeSa+a5w=;
 b=MlgvwK9Zr1CgRID5eOgrFI1L2oJbdIBo1QjSop/53fXOXEg8/VVUT3QlObkTGvcHavVo8/kXY5ec1LecXh35Hyzc6Cx14JUgKtJ/RtrYJKoi4dWueRHxQaRwKDKdbk0lUO27i82i2qKCA690dJJB+Anrnxpe5FG0xt8hBWERQUJKMytvxoD3RNm409F2EocNaRKW7vxUX224Ta5o5KBMeYl1bZ17xptPo0sHY1fWjLj6m/BKZj8XIsELaAikB+kF6KeofBwso/Euz0dHnKmLPWu0GT2Rdy66sslNC2+fv7FNAQi5D/zYy67mtKbKkMuT+b708ZP007d4AwyTHMXTFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCMFStph61gpNqlOUlWZEfWux8W2aQsnNc9SeSa+a5w=;
 b=im5IWJjRneymsxuUGR7dr6xNUab3utoiKCA9/ga5HH0XztuCsAO/F3WFCDLnY6UVAUnybkpTgAlNs0F0sZq4dbeLTr91ErSBZCvTe3R/33Ytr1P/hi1jXDZRRpABZZW+VJBnAw+8TvmfWmE6a8ORbfp3VFK8Oro95V2JYltfng0=
Received: from SA1P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::7)
 by SJ0PR10MB5551.namprd10.prod.outlook.com (2603:10b6:a03:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 05:06:39 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:22c:cafe::a1) by SA1P222CA0006.outlook.office365.com
 (2603:10b6:806:22c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Fri,
 3 Apr 2026 05:06:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 3 Apr 2026 05:06:37 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 00:06:37 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 00:06:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Apr 2026 00:06:36 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63356a9r3847734;
	Fri, 3 Apr 2026 00:06:36 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v3 1/4] ASoC: dt-bindings: Add ti,tas67524
Date: Fri, 3 Apr 2026 00:06:19 -0500
Message-ID: <20260403050627.635591-2-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403050627.635591-1-sen@ti.com>
References: <20260403050627.635591-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|SJ0PR10MB5551:EE_
X-MS-Office365-Filtering-Correlation-Id: 0549dcf5-83ea-4c0c-ead7-08de913ec90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	knO8V+Hsx3MFRo9KDYQeGIBXwUyWSqrLfgoIlOd9gVON/PZ7bkcNNZwl23nm5pOtOCyu/saG+hdTPA2Y/BYy+xyDfFSWZ3zqlreJedI14gg39qTZhrUsSN68bOJwGgVzIXH2xdVGlDuSDXjMFb4wTT4I16nOoCJg4tRzC6OzjMX4IK48ye0bbyR6eA4n2+5pcDin4FB5V05V9vjg2bW7HxRf2eh5yFdoqcCgDjyp2fkCarl8+h/+2O9VblUt1gen/pLE++6Mf0xv3kl449FS2cQMMKDhGnNd3cPbcPNM38RF9tbfDQYBBAjMn1xaNUyQmZS6GygtLSBgo/SXEoTdcs+GhCxFN32U8EEaIaP5m2WOpokJibOkaUHCFDmSBWcFxL6bj4JZ4zYmZK12qIu2wVvQSIlIi+y4+sbW/T7HXJP7w0CdwYzbG78lPFRtLEHzQZNrz9OQ2GogZs23uPBekXbHG955UP+GA74AKk15mxFUkqpvwT+GZAEjkGM+pD01DuOWAI70R2s1kSpzK86FVC+uSSAjXQgMieGO8D8LX75KVPECGE8t7Fns2JJc9Kd1C/BbstPBa2TIfxhOEcXmcsOxB2nvKidYQOy3otCQBwhnWg6aGg/hWDIF854fNdZnCP6xqqF8LwpH4KwND0N2VTptFEmyE1hEHWLmpVeB4ROq5fUADSO4aHhIdHq7g9X1w49dmo4UilGqokV48LXLaeM/S6owG7uA6P+jftjIsHs=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8E2VKPXYYL+9ePpLEAkN3ap1ZC7vfcq1+QHD0ZwMVcsl4UKLm/H5ayK/moKBNwou5ETAhU1Ff0Gk5smBWbUYT+1ToiPSQjV535weD++I+nslvGyq/MPMsmRrrzCEZaRrTHMEPz2XvT6CHZvVEeFW1hgIvqmTbJhlsjKf8dyyEKz/K3rgZ8D2ldEERPI9sZn1UgnXHzVu7MOz2/NikD7GH7NiyLIiSV8EyFEh27Ls05Nw8fivv7PE/S2FYepfQU/4jVQvmM4jTMYPUr0Eh3CyISQvoD42PzZxSIxvAr9bYZ+2Vh0Q7+PQuncIFrCHzmuHhfZ4Y9CMPkzdr0NyIpuuvtl88isjzE1LAoZYavzlwYMyEkE4CehbdfMsK+++c//TS06wJnlq7tiAdFVwlck06Nfaz1Z5GWC8pzntoY4ebbLjXBIiWLI3zber3HpC7tpW
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:06:37.9816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0549dcf5-83ea-4c0c-ead7-08de913ec90c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5551

Add device tree binding for the Texas Instruments TAS67524 family
of four-channel Class-D audio amplifiers with integrated DSP.

Signed-off-by: Sen Wang <sen@ti.com>
---
Changes in v3:
 - Renamed ti,tas675x to ti,tas67524.yaml
 - Removed tas6754 compatible instance
 - Changed pd-gpios to powerdown-gpios
 - Cleanup unnessary "|" formatting

Changes in v2:
 - None

 .../bindings/sound/ti,tas67524.yaml           | 277 ++++++++++++++++++
 1 file changed, 277 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas67524.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas67524.yaml b/Documentation/devicetree/bindings/sound/ti,tas67524.yaml
new file mode 100644
index 000000000000..b8da1360e698
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas67524.yaml
@@ -0,0 +1,277 @@
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
+    enum:
+      - ti,tas67524
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
+      By default, all four channels of each DAI are active. Runtime
+      reconfiguration is available through DAPM widgets.
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
+      - low           # Output: driven low
+      - auto-mute     # Output: high when all channels are auto-muted
+      - auto-mute-ch4 # Output: high when channel 4 is auto-muted
+      - auto-mute-ch3 # Output: high when channel 3 is auto-muted
+      - auto-mute-ch2 # Output: high when channel 2 is auto-muted
+      - auto-mute-ch1 # Output: high when channel 1 is auto-muted
+      - sdout2        # Output: Routes secondary serial data output 2
+      - sdout1        # Output: Re-routes secondary serial data output 1
+      - warn          # Output: warning signal (OTW, CBC)
+      - fault         # Output: fault signal (OTSD, OC, DC)
+      - clock-sync    # Output: clock synchronisation
+      - invalid-clock # Output: high when clock is invalid
+      - high          # Output: driven high
+      - mute          # Input: external mute control
+      - phase-sync    # Input: phase synchronisation
+      - sdin2         # Input: secondary SDIN2 for I2S/LJ/RJ ch3/ch4
+      - deep-sleep    # Input: asserted transitions device to Deep Sleep
+      - hiz           # Input: asserted transitions device to Hi-Z
+      - play          # Input: asserted transitions device to Play
+      - sleep         # Input: asserted transitions device to Sleep
+
+  ti,gpio2-function:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Function for the GPIO_2 pin. When omitted, GPIO_2 remains in its
+      power-on default state.
+    enum:
+      - low           # Output: driven low
+      - auto-mute     # Output: high when all channels are auto-muted
+      - auto-mute-ch4 # Output: high when channel 4 is auto-muted
+      - auto-mute-ch3 # Output: high when channel 3 is auto-muted
+      - auto-mute-ch2 # Output: high when channel 2 is auto-muted
+      - auto-mute-ch1 # Output: high when channel 1 is auto-muted
+      - sdout2        # Output: Routes secondary serial data output 2
+      - sdout1        # Output: Re-routes secondary serial data output 1
+      - warn          # Output: warning signal (OTW, CBC)
+      - fault         # Output: fault signal (OTSD, OC, DC)
+      - clock-sync    # Output: clock synchronisation
+      - invalid-clock # Output: high when clock is invalid
+      - high          # Output: driven high
+      - mute          # Input: external mute control
+      - phase-sync    # Input: phase synchronisation
+      - sdin2         # Input: secondary SDIN2 for I2S/LJ/RJ ch3/ch4
+      - deep-sleep    # Input: asserted transitions device to Deep Sleep
+      - hiz           # Input: asserted transitions device to Hi-Z
+      - play          # Input: asserted transitions device to Play
+      - sleep         # Input: asserted transitions device to Sleep
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

