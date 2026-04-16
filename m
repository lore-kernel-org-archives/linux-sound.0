Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66A33A0B38;
	Thu, 16 Apr 2026 23:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776382120; cv=fail; b=qhjdd4L9bN3GcopPtRwbse2Nvq2oKtFIRTbdGHBdO+d/9/CAi1gg53nAVTQfovLOITjG5m6fv7mFi15O8aSLPU2vgCuM4go5rmqYVUTAekFbXB4j7OfYoc7UO9YatVLwQzbKPwoBwrdc+b+UQtCGNWeX71UuhfyQBOCl3iK2JPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776382120; c=relaxed/simple;
	bh=sXbxPQHT3+KOvusQIgfTtNjzj+l0Aht8/K1r5aLdP9Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fzN1Ecb4aG40w0qdTzTGVLRqogRD6VNWI9WwuKaQ2m1i0UuA5Lusvx5jTnDBtc7UgudjVrOXMXUMR29leuXsuej0MeWMYqfMUuc+VfREm294WOfEtxAM63Yp+bUhZ6d0iNrkoOiHaoJDmtiHMZJVpGo6u0e7Xyewwin8ftM5pbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RiuRwRXP; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RiuRwRXP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1bhKBh9xy7sgwpra0r2zM8M8G4EXuzxOCCFcxLrWe45xlnfVyMvi+Nu15DEmta3u0s3jIL0HMRR4XtNzhVShBzvKe6GRFWW+4+l2wuWT2BxFFXHffLB2VTkij4iKqtgQHokB5vCwSfiXDgkasRZwj4aJdgc2+yQ5lm65EbWhGGM5Y6u77nEjvqf7SCIpRm3ucIRxsJiDPTA082Zl/3dyCnS9N2a2Hy1m7qsky+6lMgIHc9j/Yk9RlJ7UXSbKZWM+MVDCQ41XUkTNSJtk46sBDGPNnkHLvbaQG5Af2l92Dm937UZGMfCvlB3iQsJY4lmjs6g1W6/ESy+7Bd46lGMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9HvOIKQXTXPsF8+6gA3Vy5YE7n2PD40/WMO5n8ngQY=;
 b=u7SR2vvmUl55KtiwGhZt1aa3LDle5lyK7khS0JhIfWGDhvI92c/k4Hnu1jeyykGl3lblgohSGqTZI+fuDFnPQG5MLzOq4peYaCAyh+5cVHWUBS3c0SbQBbXomCZih5/1sgQijnI6hHluNMyjhYesADeol8pLuz3l/rY+Dlu7h2MrI9TqqdjEYNqSyduxQOXR++tqnEHW7zfY8C4rbCpFvAXDcJdvfFg9HbrFK0rwk8tF/sFxcPqbHTKWTetU8Z4JiJwyVv0a4tJQYUALVAAvqfrNK1faiXP+1wpD2h4nPbBvCZfdY7+iyq98ulX3/YAjQNWgLdiIcX3ZFH8f+KePmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9HvOIKQXTXPsF8+6gA3Vy5YE7n2PD40/WMO5n8ngQY=;
 b=RiuRwRXPJue0MIA7tE+P6nZO6tG2aSO+sVg7GMzFWr5bTHSGGd46SHeNoGyAM0iONUYYDKnRrHcUjPFlykVtI41Wo3L0VSi9AEu6rkqAxmyvOzab2anm/zQ5JdpFbP337tsuasdY+9QzuS0z6VYWD+uPCLS7bk+xG53zlTxTTD0=
Received: from BLAPR03CA0176.namprd03.prod.outlook.com (2603:10b6:208:32f::26)
 by SN4PR10MB5639.namprd10.prod.outlook.com (2603:10b6:806:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 23:28:35 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:32f:cafe::33) by BLAPR03CA0176.outlook.office365.com
 (2603:10b6:208:32f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 23:28:34 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 18:28:32 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 18:28:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 18:28:32 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63GNSWOK638800;
	Thu, 16 Apr 2026 18:28:32 -0500
From: Sen Wang <sen@ti.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sen Wang
	<sen@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/4] ASoC: dt-bindings: Add ti,tas67524
Date: Thu, 16 Apr 2026 18:26:32 -0500
Message-ID: <20260416232640.3084132-2-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416232640.3084132-1-sen@ti.com>
References: <20260416232640.3084132-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SN4PR10MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: 664aefca-7550-42be-083f-08de9c0fe125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RczvDekvfVHehP1w0YpLHj3QvqTI6HxV+PgsUveVHwSiAvvcvHBEdiMP9pIcdt52Bvh4NiIWkV2O+maiXhXMtv5iUU3yGmK530kwgBSSZrn2o0r0YFzi3od7XLSiflHmJ0jXopqgP925CKkpGUnGgsCO8ik2FbZMo3egJ6vBvZsFamQVJoDDcPdqPrIiDuDDY6IZGsEEmFQ7dzV1fcionpMOSF/lecXMEZjzVnSIjWVybGtVINEJVv+QLW6+Iw6HM5o1Ml8iJk2fT76OnxCcQYGZP7rA8sFZdHghnbMLbV5z2wmpHGZhJ+Wm0wabaDvNa1Ol19URR16JvkdfMVhAR6SfumaTKHzRPEvgC4byAUVBFfmZ7fdPA/iPfMYfXEHFWreEu0gYw5U/wB3Hd5Sui7NJrBheCq36dA+lmbTBNNr/PUkfRc0ZA738Pg4jxYCvV6IYHHy4WVGwkf63gg6Xrwr7SOtcUpb61Vql+zDP6zPgjsyUTgGeNSnbBz7P8LVsVU5Ry7ZuRCz/UPmJiI2JkkXkLBphmX7z/tEyOYuqMr5GgozVMhLAxVhYaFCsaM/WHji/89xUI0LeD7L/iY/nMX/OTe6jANbHmZmGrnTPkan3gGFPl/Je8qxSOy1tBh8v9fR9g+3lX/I+Xs0maV6Cstf8/sBQq7EhkLL/Yyuoe7ebUvRgCZJb1rG0OCL2eaJMhjsXpebej3zTMokkU2uvOj+qkIzg7GGA8tfBAmuqwyE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YHozYJ1dxA3m7bDC8bcv1i+AZEAa3QvngxgrfPNnQXcd8tBdAsPpS7JAuo/QpKOX5FLEoTfmBZPpfOeZnL9MLC5XVh7o+18FGEQO18fnbuYjaLWbLEKbxu9u0JIKnFsXcVEwMUXI6BueBnfnRvy2WB/sr/G2OjIlH2J+OlveB+UO3LqvgoT4Nulyi90ZAaj9qRhzEX/SRokLrjO50DoDOaVicx88hoFDMjwihS1F4G08rfsGAVSAcfi+Cfz3HNiNASGyp1Dt4Ibl8g9KAtw0fCBU3/j3/j3LWicniuQ6z3gBuPnmA7bQJb4LbndaC2TlbNFyqMausUg6Xf6NPLF89kGoK+9Q3eOe43ZDvrqZikSusmt/Kzme1lArk1BJWxHfN+fNojRfhaT0YgrwfVaGsKflnrjxvjgSbLLW5N4s2CONIfx2TWCviX4qnvBAUAh5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:28:34.7730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 664aefca-7550-42be-083f-08de9c0fe125
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5639

Add device tree binding for the Texas Instruments TAS67524 family
of four-channel Class-D audio amplifiers with integrated DSP.

Signed-off-by: Sen Wang <sen@ti.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v6:
 - None

Changes in v5:
 - None

Changes in v4:
 - Correct ti,tas6754 compatible with a fallback of ti,tas67524
 - Correct comment spacing

Changes in v3:
 - Rename ti,tas675x to ti,tas67524.yaml
 - Remove tas6754 compatible instance
 - Change pd-gpios to powerdown-gpios
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

