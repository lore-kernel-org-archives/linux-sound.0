Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ADE38736C;
	Thu,  9 Apr 2026 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775772423; cv=fail; b=m5AmvaNFkOc4Zl50OWkvY/INvXtKRciccfkzDwjQN1hyJ26/Xv5GB6ugcSw4llPU7MpECy2fGDEykLq2YdIL2b0XQ+edJukJd6vv6JoDuSwFGe9hs+iCNQYSkHoPuMWHotTiF7at5sgfVEkP9oqxBqxUjSi5bXh5ng6yo1JtOAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775772423; c=relaxed/simple;
	bh=pjQDYUB6FjWVJowbLEEOiTANsK2HSiP8GEex8Ux7nmM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ty/uS8+MFGYIRfNcr/R4n+qfOLZtIp0N1x8DsFwoRXQalGtCiLNA3bJ01kGaI5p0i81Hc9NF39SpJfS8qouy38siSv86Q+t/K+aso71ALiv7TZLOFWp3HHuKbfRvqi/SObgDKL4fAMrP3OMs6PXhjOkuvvHhATMaRW8qTJMHyzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TfQZCYfC; arc=fail smtp.client-ip=52.101.53.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TfQZCYfC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulOukv2ngZ3yz4R8LkKKJCG4V16qjwKLBAPhgsw/ro4MpV/7rQdEEipUuVo1tynShKx+ZopwWxvvRTJ8rUn36pcBs3qsMNo33Psii1kRiWbN0BRsYukzw+Pt11IN8BFwkRA3P/d5JHNIx25/VjTZ5u6wvzB+nnLTRaf2qra6o4ztiowLanwXXCls7ILQVt7I1RyiegvkHx9mVjwZIh/inTKwLCZW23GZ8pdhvsoIT1oJ6nwfd3T0rmn2LLUzd2v28crY6Fg6OfxodlJSagra4R4HjZx5RD7xSzL9t96cOal0Yo5x4hNpGPJvKBJteRozj7rBv0DNua5eF8vFOoFpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qx6y/+uPpvVQQN3fmrtfL1Ye0cCSRptcu03a3d+lbnk=;
 b=TZ/2MBTyA7A8myad2Mc88Bb0u2h5UAaAgNsh5dQsMsV1qOJH3XWodJdBucVKZgVrmH+ldWo6UVIb2OTIq5LshxfEWZXrTnr56IL4RvX4epMYuO/vZDxVM/xrbkV9W0VRBPkrGxBuR+L6FrvuVstwDh4LjOS0mA2Tmkh5GRI8V/jr9oG/zLA7JSbquZKXaQNZVzgVMJtngJL7ePLEdQJ9uUHtoim1czV83F40Al7GcU1xc2yCRtGSchO8r065s24BP0lGIuf3lfisFPRDRw/nD9pql+Tnr5aO7P9qybOWPNMa4Owtz4t4e9PxeNNv9aUyJ9NO2PHTXjjKKzlfsnIK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx6y/+uPpvVQQN3fmrtfL1Ye0cCSRptcu03a3d+lbnk=;
 b=TfQZCYfCi6O0anCm9Od58vl2olW1cGhDKMmeSWJt3ksO8qA8JqWF8U+T/0cmUWar6nncIFsqgr8Yyfqo8MDD4dV22JWiY84Rq1kDeuZTV6z7d/00pk4gDYjepRnKNu3epGswEksvwRnUvHbVVAPWBhrADP8BZ8XNaOIKbEhJIqc=
Received: from DS7PR03CA0351.namprd03.prod.outlook.com (2603:10b6:8:55::16) by
 PH0PR10MB4614.namprd10.prod.outlook.com (2603:10b6:510:42::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.20; Thu, 9 Apr 2026 22:06:57 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:8:55:cafe::ff) by DS7PR03CA0351.outlook.office365.com
 (2603:10b6:8:55::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Thu,
 9 Apr 2026 22:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 22:06:56 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:06:55 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:06:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 17:06:54 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639M6sS5295513;
	Thu, 9 Apr 2026 17:06:54 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, <sen@ti.com>
Subject: [PATCH v5 3/4] Documentation: sound: Add TAS675x codec mixer controls documentation
Date: Thu, 9 Apr 2026 17:06:05 -0500
Message-ID: <20260409220607.686146-4-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409220607.686146-1-sen@ti.com>
References: <20260409220607.686146-1-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|PH0PR10MB4614:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b96ee7-84ec-4608-13d8-08de968450e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	l3Zhz/P9Bgmjg0z7wS+xbsy+N89ROaY6A2KR2Q7qg48mfCk4EysykF29NSdA5MeVm6izlb4gLBfP1t/KY+/qFhrscVgfWMCxvBLkQcvxcVoYcHLA7Zfp6h6znZukJ+WrqTmYhVf/kvPPHml8tCUsloiCNGkMIc3U4xYKYq5Qn05XlyQ6+37AWAGE4mNenRJw5IP+qpSvfSihl/qHr1nlq0V6ZY0g+v0K58jeeWgvBc8PsswOPkk+rDYB2Wb0W7wCnRgvDRh8js8BMEQJmR84aJHSLrIZWumWnvxXIY3BeD/EcGOneFWj2UNIU/+a8GcrgGZOS+4dC1uMKb2lLyJvFnC4KFKYyvrj1KjfKUNq9o4m3ULpfdbUEseacYwg2w+IziMifSFT6KuOSIz6mWbXkZx6U78GEZueY+Th79JLumhw0hvTUADyOHCximt31pAIpmWtA5DZFxf7Ykn6qDi6jiJInG+gUieENR3dXJLkEhM5Jvpl37vMfSmCiMtAwi/H+wDoDudfAamyfrxDoHyq6VKKTCbvGaJSbZfUD80UIEHDocHGpw9RfsiWyewJdc4icvYvyUO2a9A9LtHUphcKj5M22UW5Q44Zzbd+G0exTqPP8coCS12w1Ua6MHJItPF7GkRb2fm5uZkJAT7fXG0M30uqEF29Cac5tuX9Xu3f3HOlvSQp5QYf8tuDz0Ygzrf0zil3lOYFF+lcA43RGBbcFal7r15tebobJOSNyvEmrpa/xxiLTT5/ioHQQkTJzGYz3vDNXVoB+8twJrs0QEU3yw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UmF921M/gSvvnO3Gaj8DmL6xSnFDakqUDFvRGJOoCOQvAXfWkoh4gUmE3RkU/nmdS6J7+tKY/V+rsxjrqoct8VIKUwPTetOPMd87uY6a9YKD55p+M17sKt6H7sBXZOgdB+cfwInGdPuM6hjFJ9Sr008mfsDydlExEvEd641rV0R44CWKtvK94xRZeLLbpamsRrq8LNbJa0tXTXHhf423JOty32zOHTubggCLdUQLNqhU4mqf26tIUV8THuyEduYmRtC8KADtjMbGvDs/1I21hQ8M4lU5HsOX2ak/IMi8ttX/cOWw7oRKj7rBj8uy4CritG/dWgIFKf1TGA6jRePIfGGsz8DhH2rB2VHuIRcPVxQ6ojYQWO8YqiTC2WfDxZf+kgbqKG7VCsiSxTZNgLVeXKcEWz1ExSuSYgbF2hs0E3AP4H5VjHV/H+sTZuQeyYAC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 22:06:56.9428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b96ee7-84ec-4608-13d8-08de968450e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4614

Add ALSA mixer controls documentation for the TAS67524 driver, covering
DSP signal path modes, volume controls, load diagnostics, and fault
monitoring.

Signed-off-by: Sen Wang <sen@ti.com>
---
Changes in v5:
 - None

Changes in v4:
 - None

Changes in v3:
 - Added register section
 - Added few addintional notes for clarification

Changes in v2:
 - None

 Documentation/sound/codecs/index.rst   |   1 +
 Documentation/sound/codecs/tas675x.rst | 686 +++++++++++++++++++++++++
 2 files changed, 687 insertions(+)
 create mode 100644 Documentation/sound/codecs/tas675x.rst

diff --git a/Documentation/sound/codecs/index.rst b/Documentation/sound/codecs/index.rst
index 2cb95d87bbef..7594d0a38d6b 100644
--- a/Documentation/sound/codecs/index.rst
+++ b/Documentation/sound/codecs/index.rst
@@ -7,3 +7,4 @@ Codec-Specific Information
    :maxdepth: 2
 
    cs35l56
+   tas675x
diff --git a/Documentation/sound/codecs/tas675x.rst b/Documentation/sound/codecs/tas675x.rst
new file mode 100644
index 000000000000..3b99c31593cf
--- /dev/null
+++ b/Documentation/sound/codecs/tas675x.rst
@@ -0,0 +1,686 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+TAS675x Codec Mixer Controls
+======================================
+
+This document describes the ALSA mixer controls for the TAS675x
+4-channel amplifier driver.
+
+For device tree bindings, see:
+Documentation/devicetree/bindings/sound/ti,tas67524.yaml
+
+DSP Signal Path Mode
+====================
+
+DSP Signal Path Mode
+--------------------
+
+:Description: Signal processing mode selection.
+:Type:        Enumerated
+:Default:     Normal
+:Options:     Normal, LLP, FFLP
+:Register:    0x32 bits [1:0]
+
+Normal
+  Full DSP with all features available.
+
+LLP (Low Latency Path)
+  Bypasses DSP processing. DSP protection features (Thermal Foldback,
+  PVDD Foldback, Clip Detect) and Real-Time Load Diagnostics unavailable.
+
+FFLP (Full Feature Low Latency Path)
+  Reduced latency. Real-Time Load Diagnostics unavailable.
+
+The following controls are unavailable in LLP mode:
+``Thermal Foldback Switch``, ``PVDD Foldback Switch``,
+``DC Blocker Bypass Switch``, ``Clip Detect Switch``, ``Audio SDOUT Switch``.
+
+The following controls require Normal mode (unavailable in FFLP and LLP):
+``CHx RTLDG Switch``, ``RTLDG Clip Mask Switch``, ``ISENSE Calibration Switch``,
+``RTLDG Open Load Threshold``, ``RTLDG Short Load Threshold``,
+``CHx RTLDG Impedance``, ``RTLDG Fault Latched``.
+
+Volume Controls
+===============
+
+Analog Playback Volume
+----------------------
+
+:Description: Analog output gain for all channels (CH1/CH2 and CH3/CH4 pairs).
+:Type:        Volume (TLV)
+:Default:     0 dB
+:Range:       -15.5 dB to 0 dB (0.5 dB steps)
+:Register:    0x4A (CH1/CH2), 0x4B (CH3/CH4)
+
+Analog Gain Ramp Step
+---------------------
+
+:Description: Anti-pop ramp step duration for analog gain transitions.
+:Type:        Enumerated
+:Default:     15us
+:Options:     15us, 60us, 200us, 400us
+:Register:    0x4E bits [3:2]
+
+CHx Digital Playback Volume
+---------------------------
+
+:Description: Per-channel digital volume control (x = 1, 2, 3, 4).
+:Type:        Volume (TLV)
+:Default:     0 dB
+:Range:       -103 dB to 0 dB (0.5 dB steps)
+:Bounds:      0x30 (min/mute) to 0xFF (max)
+:Register:    0x40 (CH1), 0x41 (CH2), 0x42 (CH3), 0x43 (CH4)
+
+Volume Ramp Down Rate
+---------------------
+
+:Description: Update frequency during mute transition.
+:Type:        Enumerated
+:Default:     16 FS
+:Options:     4 FS, 16 FS, 32 FS, Instant
+:Register:    0x44 bits [7:6]
+
+Volume Ramp Down Step
+---------------------
+
+:Description: dB change per update during mute.
+:Type:        Enumerated
+:Default:     0.5dB
+:Options:     4dB, 2dB, 1dB, 0.5dB
+:Register:    0x44 bits [5:4]
+
+Volume Ramp Up Rate
+-------------------
+
+:Description: Update frequency during unmute transition.
+:Type:        Enumerated
+:Default:     16 FS
+:Options:     4 FS, 16 FS, 32 FS, Instant
+:Register:    0x44 bits [3:2]
+
+Volume Ramp Up Step
+-------------------
+
+:Description: dB change per update during unmute.
+:Type:        Enumerated
+:Default:     0.5dB
+:Options:     4dB, 2dB, 1dB, 0.5dB
+:Register:    0x44 bits [1:0]
+
+CH1/2 Volume Combine
+--------------------
+
+:Description: Links digital volume controls for CH1 and CH2.
+:Type:        Enumerated
+:Default:     Independent
+:Options:     Independent, CH2 follows CH1, CH1 follows CH2
+:Register:    0x46 bits [1:0]
+
+CH3/4 Volume Combine
+--------------------
+
+:Description: Links digital volume controls for CH3 and CH4.
+:Type:        Enumerated
+:Default:     Independent
+:Options:     Independent, CH4 follows CH3, CH3 follows CH4
+:Register:    0x46 bits [3:2]
+
+Auto Mute & Silence Detection
+==============================
+
+CHx Auto Mute Switch
+--------------------
+
+:Description: Enables automatic muting on zero-signal detection (x = 1, 2, 3, 4).
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+:Register:    0x47 bit [0] (CH1), bit [1] (CH2), bit [2] (CH3), bit [3] (CH4)
+
+Auto Mute Combine Switch
+------------------------
+
+:Description: Coordinated muting behaviour across all channels.
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+:Behavior:    Disabled: channels mute independently when their signal is zero.
+              Enabled: all channels mute together only when all detect zero
+              signal; unmute when any channel has non-zero signal.
+:Register:    0x47 bit [4]
+
+CHx Auto Mute Time
+------------------
+
+:Description: Duration of zero signal before muting triggers (x = 1, 2, 3, 4).
+:Type:        Enumerated
+:Default:     11.5ms
+:Options:     11.5ms, 53ms, 106.5ms, 266.5ms, 535ms, 1065ms, 2665ms, 5330ms
+:Register:    0x48 bits [7:4] (CH1), bits [3:0] (CH2),
+              0x49 bits [7:4] (CH3), bits [3:0] (CH4)
+:Note:        Values are at 96 kHz. At 48 kHz, times are doubled.
+
+Clock & EMI Management
+======================
+
+Spread Spectrum Mode
+--------------------
+
+:Description: Frequency dithering mode to reduce peak EMI.
+:Type:        Enumerated
+:Default:     Disabled
+:Options:     Disabled, Triangle, Random, Triangle and Random
+:Register:    0x61 bits [1:0]
+
+SS Triangle Range
+-----------------
+
+:Description: Frequency deviation range for Triangle spread spectrum.
+:Type:        Enumerated
+:Default:     6.5%
+:Options:     6.5%, 13.5%, 5%, 10%
+:Register:    0x62 bits [1:0]
+:Note:        Applies only when Spread Spectrum Mode includes Triangle.
+
+SS Random Range
+---------------
+
+:Description: Frequency deviation range for Random spread spectrum.
+:Type:        Enumerated
+:Default:     0.83%
+:Options:     0.83%, 2.50%, 5.83%, 12.50%, 25.83%
+:Register:    0x62 bits [6:4]
+:Note:        Applies only when Spread Spectrum Mode includes Random.
+
+SS Random Dwell Range
+---------------------
+
+:Description: Dwell time range for Random spread spectrum (FSS = spread
+              spectrum modulation frequency).
+:Type:        Enumerated
+:Default:     1/FSS to 2/FSS
+:Options:     1/FSS to 2/FSS, 1/FSS to 4/FSS, 1/FSS to 8/FSS, 1/FSS to 15/FSS
+:Register:    0x62 bits [3:2]
+:Note:        Applies only when Spread Spectrum Mode includes Random.
+
+SS Triangle Dwell Min
+---------------------
+
+:Description: Minimum dwell time at Triangle spread spectrum frequency extremes.
+:Type:        Integer
+:Default:     0
+:Range:       0 to 15 (0 = feature disabled)
+:Register:    0x66 bits [7:4]
+:Note:        Counts in FSS clock cycles. The modulator holds the extreme
+              frequency for at least this many FSS cycles before reversing.
+              When Dwell Min equals Dwell Max, the dwell feature is inactive.
+              For FSS values at each PWM frequency refer to the "Spread
+              Spectrum" section of the TRM.
+
+SS Triangle Dwell Max
+---------------------
+
+:Description: Maximum dwell time at Triangle spread spectrum frequency extremes.
+:Type:        Integer
+:Default:     0
+:Range:       0 to 15 (0 = feature disabled)
+:Register:    0x66 bits [3:0]
+:Note:        Counts in FSS clock cycles. Must be >= Dwell Min. When Dwell Max
+              equals Dwell Min, the dwell feature is inactive.
+
+Hardware Protection
+===================
+
+OTSD Auto Recovery Switch
+--------------------------
+
+:Description: Enables automatic recovery from over-temperature shutdown.
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+:Register:    0x8F bit [1]
+:Note:        When disabled, manual fault clearing is required after OTSD events.
+
+Overcurrent Limit Level
+-----------------------
+
+:Description: Current-limit trip point sensitivity.
+:Type:        Enumerated
+:Default:     Level 4
+:Options:     Level 4, Level 3, Level 2, Level 1
+:Register:    0x55 bits [1:0]
+:Note:        Level 4 is the least sensitive (highest trip current); Level 1 is
+              the most sensitive. The exact ILIM values depend on operating
+              conditions (PVDD voltage, switching frequency, and temperature).
+              Refer to the Electrical Characteristics table and the
+              "Overcurrent Limit (Cycle-By-Cycle)" section of the TRM.
+
+CHx OTW Threshold
+-----------------
+
+:Description: Over-temperature warning threshold per channel (x = 1, 2, 3, 4).
+:Type:        Enumerated
+:Default:     >95C
+:Options:     Disabled, >95C, >110C, >125C, >135C, >145C, >155C, >165C
+:Register:    0xE2 bits [6:4] (CH1), bits [2:0] (CH2),
+              0xE3 bits [6:4] (CH3), bits [2:0] (CH4)
+
+Temperature and Voltage Monitoring
+===================================
+
+PVDD Sense
+----------
+
+:Description: Supply voltage sense register.
+:Type:        Integer (read-only)
+:Range:       0 to 255
+:Conversion:  value × 0.19 V
+:Register:    0x74
+
+Global Temperature
+------------------
+
+:Description: Global die temperature sense register.
+:Type:        Integer (read-only)
+:Range:       0 to 255
+:Conversion:  (value × 0.5 °C) − 50 °C
+:Register:    0x75
+
+CHx Temperature Range
+---------------------
+
+:Description: Per-channel coarse temperature range indicator (x = 1, 2, 3, 4).
+:Type:        Integer (read-only)
+:Range:       0 to 3
+:Mapping:     0 = <80 °C, 1 = 80–100 °C, 2 = 100–120 °C, 3 = >120 °C
+:Register:    0xBB bits [7:6] (CH1), bits [5:4] (CH2),
+              0xBC bits [3:2] (CH3), bits [1:0] (CH4)
+
+Load Diagnostics
+================
+
+The TAS675x provides three load diagnostic modes:
+
+DC Load Diagnostics (DC LDG)
+  Measures DC resistance to detect S2G (short-to-ground), S2P
+  (short-to-power), OL (open load), and SL (shorted load) faults.
+
+AC Load Diagnostics (AC LDG)
+  Measures complex AC impedance at a configurable frequency. Detects
+  capacitive loads and tweeter configurations.
+
+Real-Time Load Diagnostics (RTLDG)
+  Monitors impedance continuously during playback using a pilot tone.
+  Normal DSP mode only, at 48 kHz or 96 kHz.
+
+Fast Boot Mode
+--------------
+
+By default the device runs DC load diagnostics at initialization before
+accepting audio. Setting ``ti,fast-boot`` in the device tree bypasses this
+initial diagnostic run for faster startup. Automatic diagnostics after
+fault recovery remain enabled.
+
+DC Load Diagnostics
+-------------------
+
+The ``CHx DC LDG Report`` 4-bit fault field uses the following encoding:
+
+  ======  ===========  ===================================================
+  Bit     Fault        Description
+  ======  ===========  ===================================================
+  [3]     S2G          Short-to-Ground
+  [2]     S2P          Short-to-Power
+  [1]     OL           Open Load
+  [0]     SL           Shorted Load
+  ======  ===========  ===================================================
+
+DC LDG Trigger
+~~~~~~~~~~~~~~
+
+:Description: Triggers manual DC load diagnostics on all channels.
+:Type:        Boolean (write-only)
+:Note:        Returns -EBUSY if any DAI stream (playback or capture) is active.
+              The driver manages all channel state transitions. Blocks until
+              diagnostics complete or time out (300 ms).
+
+DC LDG Auto Diagnostics Switch
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Enables automatic DC diagnostics after fault recovery.
+:Type:        Boolean Switch
+:Default:     Enabled (1)
+:Register:    0xB0 bit [0]
+:Note:        Active-low, when enabled, affected channels re-run diagnostics after
+              fault recovery and retry approximately every 750 ms until resolved.
+
+CHx LO LDG Switch
+~~~~~~~~~~~~~~~~~
+
+:Description: Enables line output load detection per channel (x = 1, 2, 3, 4).
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+:Register:    0xB1 bit [3] (CH1), bit [2] (CH2), bit [1] (CH3), bit [0] (CH4)
+:Note:        When enabled and DC diagnostics report OL, the device tests for
+              a high-impedance line output load.
+
+DC LDG SLOL Ramp Time
+~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Voltage ramp time for shorted-load and open-load detection.
+:Type:        Enumerated
+:Default:     15 ms
+:Options:     15 ms, 30 ms, 10 ms, 20 ms
+:Register:    0xB2 bits [7:6]
+
+DC LDG SLOL Settling Time
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Settling time for shorted-load and open-load detection.
+:Type:        Enumerated
+:Default:     10 ms
+:Options:     10 ms, 5 ms, 20 ms, 15 ms
+:Register:    0xB2 bits [5:4]
+
+DC LDG S2PG Ramp Time
+~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Voltage ramp time for short-to-power and short-to-ground detection.
+:Type:        Enumerated
+:Default:     5 ms
+:Options:     5 ms, 2.5 ms, 10 ms, 15 ms
+:Register:    0xB2 bits [3:2]
+
+DC LDG S2PG Settling Time
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Settling time for short-to-power and short-to-ground detection.
+:Type:        Enumerated
+:Default:     10 ms
+:Options:     10 ms, 5 ms, 20 ms, 30 ms
+:Register:    0xB2 bits [1:0]
+
+CHx DC LDG SL Threshold
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Shorted-load detection threshold per channel (x = 1, 2, 3, 4).
+:Type:        Enumerated
+:Default:     1 Ohm
+:Options:     0.5 Ohm, 1 Ohm, 1.5 Ohm, 2 Ohm, 2.5 Ohm,
+              3 Ohm, 3.5 Ohm, 4 Ohm, 4.5 Ohm, 5 Ohm
+:Register:    0xB3 bits [7:4] (CH1), bits [3:0] (CH2),
+              0xB4 bits [7:4] (CH3), bits [3:0] (CH4)
+
+DC LDG Result
+~~~~~~~~~~~~~
+
+:Description: Overall DC diagnostic result register.
+:Type:        Integer (read-only)
+:Range:       0x00 to 0xFF
+:Register:    0xC2
+:Bit Encoding:
+
+  ========  =====================================================
+  Bits      Description
+  ========  =====================================================
+  [7:4]     Line output detection result, one bit per channel
+  [3:0]     DC diagnostic pass/fail per channel (1=pass, 0=fail)
+  ========  =====================================================
+
+CHx DC LDG Report
+~~~~~~~~~~~~~~~~~
+
+:Description: DC diagnostic fault status per channel (x = 1, 2, 3, 4).
+:Type:        Integer (read-only)
+:Range:       0x0 to 0xF
+:Register:    0xC0 bits [7:4] (CH1), bits [3:0] (CH2),
+              0xC1 bits [7:4] (CH3), bits [3:0] (CH4)
+:Note:        See fault bit encoding table at the start of this section.
+
+CHx LO LDG Report
+~~~~~~~~~~~~~~~~~
+
+:Description: Line output load detection result per channel (x = 1, 2, 3, 4).
+:Type:        Boolean (read-only)
+:Values:      0 = not detected, 1 = line output load detected
+:Register:    0xC2 bit [7] (CH1), bit [6] (CH2), bit [5] (CH3), bit [4] (CH4)
+
+CHx DC Resistance
+~~~~~~~~~~~~~~~~~
+
+:Description: Measured DC load resistance per channel (x = 1, 2, 3, 4).
+:Type:        Float (read-only, displayed in ohms)
+:Resolution:  0.1 ohm per code (10-bit value)
+:Range:       0.0 to 102.3 ohms
+:Register:    0xD9 bits [7:6]/[5:4]/[3:2]/[1:0] (MSB for CH1–CH4),
+              0xDA (CH1 LSB), 0xDB (CH2 LSB), 0xDC (CH3 LSB), 0xDD (CH4 LSB)
+
+AC Load Diagnostics
+-------------------
+
+AC LDG Trigger
+~~~~~~~~~~~~~~
+
+:Description: Triggers AC impedance measurement on all channels.
+:Type:        Boolean (write-only)
+:Note:        Returns -EBUSY if any DAI stream (playback or capture) is active.
+              The driver transitions all channels to SLEEP state before starting
+              the measurement. Blocks until diagnostics complete or time out.
+
+AC LDG Gain
+~~~~~~~~~~~
+
+:Description: Measurement resolution for AC diagnostics.
+:Type:        Boolean Switch
+:Default:     1 (Gain 8)
+:Values:      0 = 0.8 ohm/code (Gain 1), 1 = 0.1 ohm/code (Gain 8)
+:Register:    0xB5 bit [4]
+:Note:        Gain 8 recommended for load impedances below 8 ohms.
+
+AC LDG Test Frequency
+~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Test signal frequency for AC impedance measurement.
+:Type:        Integer
+:Default:     200 (0xC8 = 18.75 kHz)
+:Range:       0x01 to 0xFF (0x00 reserved)
+:Formula:     Frequency = 93.75 Hz × register value
+:Register:    0xB8
+
+CHx AC LDG Real / CHx AC LDG Imag
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Real and imaginary AC impedance components per channel
+              (x = 1, 2, 3, 4).
+:Type:        Integer (read-only)
+:Range:       0x00 to 0xFF (8-bit signed)
+:Register:    0xC3 (CH1 Real), 0xC4 (CH1 Imag), 0xC5 (CH2 Real), 0xC6 (CH2 Imag),
+              0xC7 (CH3 Real), 0xC8 (CH3 Imag), 0xC9 (CH4 Real), 0xCA (CH4 Imag)
+:Note:        Scale set by AC LDG Gain.
+
+Speaker Protection & Detection
+-------------------------------
+
+Tweeter Detection Switch
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Enables tweeter detection using the AC impedance magnitude comparator.
+:Type:        Boolean Switch
+:Default:     Enabled (1)
+:Register:    0xB6 bit [0]
+:Note:        The underlying register bit is TWEETER DETECT DISABLE (active-low).
+              Control value 1 = detection enabled (register bit 0), 0 = disabled
+              (register bit 1).
+
+Tweeter Detect Threshold
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Magnitude threshold for tweeter detection.
+:Type:        Integer
+:Default:     0
+:Range:       0x00 to 0xFF
+:Resolution:  0.8 ohm/code (AC LDG Gain=0) or 0.1 ohm/code (AC LDG Gain=1)
+:Register:    0xB7
+
+CHx Tweeter Detect Report
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Tweeter detection result per channel (x = 1, 2, 3, 4).
+:Type:        Boolean (read-only)
+:Values:      0 = no tweeter detected, 1 = tweeter detected
+:Register:    0xCB bit [3] (CH1), bit [2] (CH2), bit [1] (CH3), bit [0] (CH4)
+
+DSP Protection Features
+=======================
+
+These controls are unavailable in LLP mode.
+
+Thermal Foldback Switch
+-----------------------
+
+:Description: Enables dynamic gain reduction based on die temperature.
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+:Register:    0x3A bit [0]
+
+PVDD Foldback Switch
+--------------------
+
+:Description: Enables automatic gain limiting when supply voltage drops
+              (Automatic Gain Limiter).
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+:Register:    0x3A bit [4]
+
+DC Blocker Bypass Switch
+------------------------
+
+:Description: Bypasses the DC-blocking high-pass filter.
+:Type:        Boolean Switch
+:Default:     Not bypassed (0)
+:Register:    0x39 bit [0]
+
+Clip Detect Switch
+------------------
+
+:Description: Enables DSP-based clip detection (Pseudo-Analog Clip Detect).
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+:Register:    0x93 bit [6]
+
+Audio SDOUT Switch
+------------------
+
+:Description: Routes post-processed audio to the SDOUT pin instead of
+              Vpredict data.
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+:Register:    0x3A bit [5]
+:Note:        When enabled, replaces Vpredict data on SDOUT with post-processed
+              SDIN. All SDOUT configurations that apply to Vpredict also apply
+              to SDIN-to-SDOUT transmission.
+
+Real-Time Load Diagnostics
+===========================
+
+These controls require Normal DSP mode at 48 kHz or 96 kHz. They are
+unavailable at 192 kHz and in FFLP and LLP modes.
+
+The ``RTLDG Fault Latched`` register uses the following encoding:
+
+  ========  ==========================================
+  Bits      Description
+  ========  ==========================================
+  [7:4]     Shorted Load faults, CH1–CH4 respectively
+  [3:0]     Open Load faults, CH1–CH4 respectively
+  ========  ==========================================
+
+CHx RTLDG Switch
+----------------
+
+:Description: Enables real-time impedance monitoring during playback
+              (x = 1, 2, 3, 4).
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+:Register:    0x37 bit [3] (CH1), bit [2] (CH2), bit [1] (CH3), bit [0] (CH4)
+
+RTLDG Clip Mask Switch
+----------------------
+
+:Description: Suppresses impedance updates during clipping events.
+:Type:        Boolean Switch
+:Default:     Enabled (1)
+:Register:    0x37 bit [4]
+
+ISENSE Calibration Switch
+--------------------------
+
+:Description: Enables current sense calibration for accurate impedance
+              measurements.
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+:Register:    0x5B bit [3]
+
+RTLDG Open Load Threshold
+--------------------------
+
+:Description: DSP coefficient for open load fault detection threshold.
+:Type:        DSP coefficient (extended control)
+:Register:    DSP Book 0x8C, page 0x22, 0x98
+
+RTLDG Short Load Threshold
+---------------------------
+
+:Description: DSP coefficient for shorted load fault detection threshold.
+:Type:        DSP coefficient (extended control)
+:Register:    DSP Book 0x8C, page 0x22, 0x9C
+
+CHx RTLDG Impedance
+-------------------
+
+:Description: Real-time load impedance per channel (x = 1, 2, 3, 4).
+:Type:        Float (read-only, displayed in ohms)
+:Register:    0xD1–0xD2 (CH1), 0xD3–0xD4 (CH2), 0xD5–0xD6 (CH3), 0xD7–0xD8 (CH4)
+:Note:        Valid only during PLAY state with RTLDG enabled at 48 or
+              96 kHz. Holds stale data in SLEEP, MUTE, or Hi-Z states.
+
+RTLDG Fault Latched
+-------------------
+
+:Description: Latched fault register for OL and SL conditions detected
+              during playback.
+:Type:        Integer (read-only, read-to-clear)
+:Range:       0x00 to 0xFF
+:Register:    0x8B
+:Note:        See bit encoding table at the start of this section.
+              Reading the register clears all latched bits.
+
+Driver Known Limitations
+========================
+
+Clock Fault Behaviour
+---------------------
+
+On Stream Stop
+~~~~~~~~~~~~~~
+
+Every time a playback stream stops the FAULT pin briefly asserts.
+The CPU DAI (McASP) stops SCLK during ``trigger(STOP)`` — an atomic
+context where codec I2C writes are not permitted — before the codec can
+transition to sleep. The device detects the clock halt and latches
+``CLK_FAULT_LATCHED``, which asserts the FAULT pin. The driver clears
+the latch in the ``mute_stream`` callback that follows, so the FAULT pin
+flicker lasts only a few milliseconds. Audio output is not affected and
+no kernel log message is produced.
+
+On Rapid Rate Switching
+~~~~~~~~~~~~~~~~~~~~~~~
+
+When streams are started in rapid succession, an intermittent
+``Clock Fault Latched: 0x01`` message may appear in the kernel log.
+A 0.5 second settling gap between sessions eliminates this.
+
+References
+==========
+
+- TAS675x Technical Reference Manual: SLOU589A
+- Device Tree Bindings: Documentation/devicetree/bindings/sound/ti,tas67524.yaml
+- ALSA Control Name Conventions: Documentation/sound/designs/control-names.rst
-- 
2.43.0

