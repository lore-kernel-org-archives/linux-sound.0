Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB723CAE97;
	Wed,  1 Apr 2026 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775082787; cv=fail; b=nbK1fMR7E3Yduyxma3YQYkUTGRRfDfsMiyjvYG/UcbAVwMjtX8bDnNVd7QwIW6Tp2fNW1cMOvSvXvySJPTbRZgr0L9PX6N9kTJzBlbs3Rvssjb9z5klKbOtx4t0dr4n+Z3JBn+rdGNbYvuyJAkXoqj4OkLawNq0vek73M8IpF1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775082787; c=relaxed/simple;
	bh=JuHd2GgdK2HSkTZZfPjM1XvwWEWf8MsDnvE2quVKkmQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ca6pPPWjepyuL1KcYiqhTy5jtZumAcVe19aijdWThetzwtcbsBvKCtaDzW0+gidi09yy3nbex+FMI61SZ8Rn0tcDJEdn84j/FxJJdrb8Z5s3hCbbjcoyoXThflK8m5VwcYMUihPjU7C7AnvGeliagBm6JEUdWlbGYSetkArRRtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JoZKiUZB; arc=fail smtp.client-ip=40.107.209.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JoZKiUZB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJqVpX/wLRp+ukjMriP0RwVDtoBzOGCILx+0eOTFdgHDwwXpUAvjjoV8brpJe8WA3AqN/bD2E3CmvqYOS2jbkJAph2eyGtG+AipnHuQmvWJ1x47SGrqOxGPBJNXaEnUK6oj+e/RFtEhBGNDYColpbDHkOwtUi7k5NlWS/3svD9IlzBN57817QLHSjtgjwuc/w/nkC+JmgMr1clsS/kPd9jaayiqhE5tpQMXlW/kCNGYJ99kiGpSgCpfcnxFagQvZL4q8uxUq8QS2vlWkz9/zNgTKWqmp4rfeaZL0B+4jNU0fRttYhoeqeqDWJ1MqkWg5e+5AUCM1kRSLWGON28kQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmwZuTujvRx4D7SsKvAskxGnQj4kuZ9nF03UvVixOxk=;
 b=TxjagLHf+v5F28jTS/fUFEqNaI98M910ZMQ7PXocd7F9ancYSDdXsSbsQrfkpCOditYF5NVpOZ36PTcFvZQAg9zWZImDg8u5fDHIQOtQTcHltsWU9OGkbM9xvwZuDdun+Z7yRwbDpARIIvVLieeSCT4JBuTaKr6Uq8/Si0Mrwi0Vb9N8RhQu8I6rfYl/a2wtKyYd/nW4OeRvVDblVw9AChsqRUOj8LbV5AYlU/QM5t+othHEJEQW2lEpiUwNA+T/uaOYGlCRaL5SVF4R6z2r2/adc41Up3thiuF3GRWi6FP02ODSVI6zLT+b6gV8ZXcNKazn/NEF5/bgYz3FQKzcrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmwZuTujvRx4D7SsKvAskxGnQj4kuZ9nF03UvVixOxk=;
 b=JoZKiUZBELUPXtiwzEJEr3wI1r1i93PMysVO3Q0IlOnpkeL62kWFEu93niwFZ5CCSywpLSllILnLAgcfH8PkC3OWGf44ovu8x+NlffoQjkd19Ykd9n6LLdYnu4kwxiZFRfynxgJbGbhN5KQXe/82IVFfUIgIBgbEYJF02clrnd0=
Received: from CH2PR07CA0044.namprd07.prod.outlook.com (2603:10b6:610:5b::18)
 by CH2PR10MB4117.namprd10.prod.outlook.com (2603:10b6:610:ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 1 Apr
 2026 22:32:51 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::62) by CH2PR07CA0044.outlook.office365.com
 (2603:10b6:610:5b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 22:32:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 22:32:51 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 17:32:50 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 17:32:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 17:32:50 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631MWoJ41351051;
	Wed, 1 Apr 2026 17:32:50 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 1/4] dt-bindings: sound: Add ti,tas675x
Date: Wed, 1 Apr 2026 17:28:42 -0500
Message-ID: <20260401223239.1638881-2-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401223239.1638881-1-sen@ti.com>
References: <message-id-of-your-RFC-cover-letter>
 <20260401223239.1638881-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|CH2PR10MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1d5150-cd34-462f-d574-08de903e9c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JNhsh7Is6yjXfi98gfFp8I6jLtw30W/AsBNJz1XxJWnU0rbt9722azVhl10vzLvaFr1zJylWFFIl91AXAjwf9r2KRuZlFcpFYqfyOL3cWZn+9sleMNWDU5t2rXMjpXsHYtGKHj2LMSGAK8ZOh6fEFcTybNOBTSBmt9Kj8dSdFAnz251Xh6+ov6g9tiem6kmrdotVOarLMpHoVAL6Wr2jHgtGwgG8WYc+g7tW9we8m2JO5DJDCmVaFjJ1mBbMCrxAp19xk8C5NaXqt1hdm562AUS5xCsn0f8ueJKSpxGwkQZDMmdn8ugaexJmcs2HwALsO9z9ooZ9s48Bwjuhy2mziSGnQ4ikDE4m4NhN2gj8djmynk/cQJHnOWSPK406bePTx/Y2jfckYeRQb2akFXXiBbWIKt1dG3ggpNiU1XuloYWS8wC8rVm4P6/t9P6XxZWy6BDKe5T+T2vZvBFqOB6Zq1RCdc/nDlnFKmSpMQhYTl3EPc/IFhEpj7uZOw66jyfOJA5kJsJJ2AaU4T+1mHEFs8QyYqMWsJrTcaqj62LCaI054MIbUmUw0onEZFiJu4sN+7K4sOzTr3zinQMpaFiQJfAUi0xsOBL43FsDWvUZ+cYp60jZcWJ7fsR6VeUN7FiD1ds+HOL0Sona0xORPWuqba4GmYty4+/J6mX09W0i5QVpvSbyrleI5inMulAN74J2/Dhzip+mhE0nxtmZq+BuUDE/cK/LyA4zI3CS3pYR2RI=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k2EydAvCs2tBjLsOsWVdRBUYgl0GREFZRr9cKJ20wACwbeibBerPzG5QG1dHHM1QYaFsKRMipjEaEgGojNC75KjNwjo/H1JyHDVmYi6TazxW47cL51CmR6pSjscvjdizQV93ztQVHQQZdHzZpE6F70dsj4vGcpTeL8QmzO/QOcGxyOCbe1KpxjWdvf/edWImb9eEVbQojCua71ZXOOakFq8mfpVDWDWl2rzgIyXaZ+wcShaFVmJ3RMQ48Z2/6EQ4pcnPkouUvvDIST1MMQ05r8v5zwuftVWda6EN+g+Hk3eJyqecyo8l8N1YE7YSmhS21yiztbR0wDL8XHwYHTNCMbp71YFFF0b+l51/d3ffcB2Wp7ioqVyVTTynY5jsMyfi3M2YGgrv0/lDNXOJbbuUjz2ZZlANNAerFx6JxZTwXyY8+VV5FsY5TMGQofP0mCO8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:32:51.1383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1d5150-cd34-462f-d574-08de903e9c03
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4117

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

