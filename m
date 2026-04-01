Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D0E35B63D;
	Wed,  1 Apr 2026 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011358; cv=fail; b=pHqkv41jIbKsUurWZ/ZtbYmwztMI4UNrRXSFwMBNfoeNYxVInBiIf6n1dopPcJ0x7t9v420VptxwAWSFQbuV4E5tPD3oKvjLHSZEdNKPjWyzNzBz9rAsKuJutp74GIHLbrnkGjadLKovHkGxak4wH1d9WCLPLheYgRh4j/eiAZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011358; c=relaxed/simple;
	bh=JuHd2GgdK2HSkTZZfPjM1XvwWEWf8MsDnvE2quVKkmQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JO+5cAOEU6zxiTVnK5r9TMv/ApC//Vgp660haQCsz1gPbTsUo+FKEZyhGH0gi4lhRTDg7//4Uf8lLwYnC7hzqNQL6m43dxA8SLUC9I0n7Seyowjo3129BGhSONpX/MBSz39MvGQMo9xvrSvpv5Nb7OZMMCL3IeTuJhIaBZ8H/XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uVmx898C; arc=fail smtp.client-ip=40.93.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uVmx898C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adu5uowAXdAqfCXDduHx2GrHuNgQkpc5/5EwJEz0NyNVLf2b/YcrGMPPrwTQ6hbjtcox6PqC9VJS77CmHCQbl+XmhbwoF9ZJk2ms99LMtx82rxOAtYseqwHeZG2y/lNJn5C9Bc7W+wHg9oB7JPPk0b/IglcOEGzRCEvGpChFcLyBtcCYMvQeaLgGJ7n43TLM9eKzEclJjssNYHdUb2eZlOspKOmTAnN0YiKKBrU+/LGOBUo9B4cWaUFCvzhgK3wH7exgHhuqIKvF5rcKdVWW7jkFBGHkJiyQ5xUYyZXtEsskIxqSE4qy150JHIbCGwWJj3OauW+nJnzI2mT/2RVJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmwZuTujvRx4D7SsKvAskxGnQj4kuZ9nF03UvVixOxk=;
 b=uMVqWl2jlCuskZEclA5EAq3NWj8pvEpwhmzAyxAN3pg5RlkaW5UdeeDAWdqsCHkcpcoSxTfs7OBcpNNrnXP8M8ZbQCk/bRpoWxbRTvVnZ9Pux0+KjfGnQTsygEKOq/jPYexWLw6t+rc2RsC2X6+kaXzHKSbfxMFrl6ujCqJK1fM+ki4NeBRmn6KsYW74Rzw6+siOgjcePGxReLB9JQBfn6Hkpac2ek3hNlGw/XUfA7FxgQArFTBYA/r/z9vdD1edjiFZJdkEyQu/UnIMgTRmN/up02hf9VhEYbyb4eB4d30VIYaMgbgZ/rZ3Ql9ZDg5AtjUeYJcVqwW2TAYl6/F8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmwZuTujvRx4D7SsKvAskxGnQj4kuZ9nF03UvVixOxk=;
 b=uVmx898Cd1efs1IajRgPJ3tK4VYSmVGFI6iIs8IExIpYreBYMrm6NyYjS2sAecrHzyokSsx8kJnahIM+On5GZc+ce+TLf9q/yyAJT5yblidueW68vvS/2iEGrSqIZBK+pUi/1kM/UcX0lpzDe7+oLQO7NZ91sckUgzDaMAIa6J4=
Received: from SJ0PR13CA0030.namprd13.prod.outlook.com (2603:10b6:a03:2c0::35)
 by IA3PR10MB8563.namprd10.prod.outlook.com (2603:10b6:208:571::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 02:42:19 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::ed) by SJ0PR13CA0030.outlook.office365.com
 (2603:10b6:a03:2c0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.15 via Frontend Transport; Wed,
 1 Apr 2026 02:42:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 1 Apr 2026 02:42:18 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 21:42:15 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 21:42:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 31 Mar 2026 21:42:15 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6312gFK43899100;
	Tue, 31 Mar 2026 21:42:15 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH 1/4] dt-bindings: sound: Add ti,tas675x
Date: Tue, 31 Mar 2026 21:42:06 -0500
Message-ID: <20260401024210.28542-2-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401024210.28542-1-sen@ti.com>
References: <20260401024210.28542-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|IA3PR10MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ec070f-4215-4b69-cde8-08de8f984ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XGpPgRP2zR+Gkigd7wwzn14zDzvQ7uN3CSGMLzQCdjyKvAupyEXk2inIvGZS/s6lqzVb3tS6NK+DqtpaRzybA8DNMy5xxtusjh78P8rtz2TcXGMLfTpsu7Tu6GfxWbsZiqYPxzck9L/rcaJ20P4+5McJ49ZhCLe7bmiSPvAj8exlZcjBpB8c6WankfJVldU5Hcc7rqvDm1nE8F881dVxDtuQVb7hAHBWgNKVqoA3SN0rqgdoPkL4BBQWx4e0KAR/rj2Ik1M6o5S1d4IXwqXonJJXAsdt7IixbwlBMEfqdSPRk3vOKnRQFNQlyDkdp+AtIN3NW/kXb6An6W5JSuqOQu3OM5nI61iRtvMb4Kt1vztmG59tm5ZPEsSIh2HiFFH+NA1BzL1wTo2PizN8UgQzULkwwR9gidzdzWjDIxc4CunY0z6ld8mSvblbo2RUtrturTbulnf90j2n6yRALhdTCN1IrzFBUg+GgkHdtuuBEVjDJrVQZwqYlFHgCB/1T+6JR0LClliRvvMF/kenkNOHo+HA6zjSlQyn/QN6PwCazYgW1PuLGCzI8hhbNXSj69KqPMvZ6hoe+yiRy19o52Ay3wn1ILPW+uhWVQwPWGoP5UrEnxiaZ9q2NC7Ccta98+CgjP1EjiwN5rPr00Tq0QEkV5Q+OhoBqJvPivgMTMxinQ7mPc+1u/T+3m+GYTBVhpzwWfp1HN0HXTvwgO3P04RAU3RDZQ1J5cLFXmtnL8o/KLM=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gcC283PITdOMxw6f4NEHU5wy9XYsYRX8udKuZuyk1JlvCOiewJbPbX/ir4GXoFsOr98UXsiov2pR30G+tnZrSTLyyLmX7DhvKQpSWmolVYT7Sho/Bet1Go5FociatjbPY/P1sB5oq5/iv1+l+Czmglmg19tyO0dumw66kulemPeqFYc77ImxxKJ8T4jY0Cr5Ejf64J2nyVw8jqjMfYid6qL5dIs1k9MoeDeGSYEvUSYtjp03biu57pqYxQ8G37hQ/iJdBnYHzZJDFHSWn2AtrrGlmgjwI3IU9dXPXj80ruNl9hfv0mgHmatcKek8jn7z7DSM6EJHp2UA4EsHSj1D47AQn3W19WZRIM+d3CDopmB1tMOKE7kuuhXzdWo0Vo1tx+tFjQ6yRawpYhcvwaTzccwysFNc2eu2hSUoAupN+HDDmcoGW+L//BAN+Aee1YvV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:42:18.4409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ec070f-4215-4b69-cde8-08de8f984ac9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8563

Add device tree binding for the Texas Instruments TAS675x family
of four-channel Class-D audio amplifiers with integrated DSP.

Signed-off-by: Sen Wang <sen@ti.com>
---
 .../devicetree/bindings/sound/ti,tas675x.yaml | 278 ++++++++++++++++++
 1 file changed, 278 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas675x.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas675x.yaml b/Documentation/devicetree/bindings/sound/ti,tas675x.yaml
new file mode 100644
index 000000000000..23e4cc77b4ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas675x.yaml
@@ -0,0 +1,278 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tas675x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TAS675x Audio Amplifier
+
+maintainers:
+  - Sen Wang <sen@ti.com>
+
+description: |
+  The TAS675x family (TAS6754, TAS67524) are four-channel, digital-input,
+  automotive Class-D audio amplifiers with load diagnostics and an integrated
+  DSP for audio processing.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,tas6754
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
+  pd-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the power-down (PD#) pin, active low. Controls the
+      internal digital circuitry power state. When asserted the device enters
+      full power-down mode and all register state is lost. Can be omitted if
+      PD pin is hardwired or externally controlled.
+
+  stby-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the standby (STBY#) pin, active low. Controls the
+      analog power stage. When asserted the device enters Deep Sleep mode
+      but remains I2C-accessible with registers retained. Can be omitted if
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
+      sdout2 for Ch3/Ch4; without it only Ch1/Ch2 are output. Mutually
+      exclusive with ti,vpredict-slot-no; Vpredict takes priority if both
+      are set.
+
+      Irrelevant in Left-J and Right-J modes.
+
+  ti,gpio1-function:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
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
+    description: |
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
+  - required: [pd-gpios]
+  - required: [stby-gpios]
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
+            stby-gpios = <&main_gpio0 33 GPIO_ACTIVE_LOW>;
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

