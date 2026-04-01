Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011044.outbound.protection.outlook.com [40.93.194.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8593CE49D;
	Wed,  1 Apr 2026 22:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775082795; cv=fail; b=heQV/TsWTmaywKbLNjVs8iV0GQdlE/bze86si2BgVup0uxQPnSGsB4hwbiMjAWycQNcPuPECtg4930+PlbDKDmWnx49TzV0at5Z+LCz8umqp5zdibsRNZLtgmyJg5bbhFahRxPEfC4mOQXFccx7uLkX/2JpwZRwXYB1s/HfQthc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775082795; c=relaxed/simple;
	bh=qajO+3fmBPsI+4dL9jkT7S1JH8eh1SPm6U/AN2/g2XU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxjL7hUC/LFD4aml++iiBl443oBfCTWiEYcI47FYRgXnSEJP0tyOOqBocBxEDrZ3HGbG5vWM8H4SFhmTP49RNVlG7gAcvJ3cJXyjgN/oIwGdRx4FIqhNN2dskhnJ0uQfBGYCMNv8n94CEhkEAFObwkcqryGG10QmBnxkICwqRvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Vf0HrZ9G; arc=fail smtp.client-ip=40.93.194.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Vf0HrZ9G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RG4cioTDLwbIIyBA6MzNZLrmUtdbaKDdzuUnrSLvTh8VZl+uWPp7vNFiqeyzGaFAL8RxVDUxdnKu95HAGHdh1zDTuqV5D6FWddhgJHW+EgV67yBR+kOtkegTwhloUTgk7hVitZQ1QWnuNOopkLjgjNfln+z4RyghDHW494YqvftOqOQAApiROQVcc9dlZ+n4DhOjMMTsDrMjf1T3s+5upX0s26hm8fFOJojOPmpPehAtkynWdmOhom7+OkIGtSYkM+16uFZJxyF8cvsyszww16fasK7S21X0V8zRFvdALJfYKkn8JOOM6rJJsFFR5amIcqN/XQKmc5cRo2CIQ2SCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkSxadPlX+ceW9TliS7LuElDmMTuTndw07ZjRSoItF4=;
 b=EuzsOPQmbwYzA2LGg6JyQotSqXbg5/uz+CZNLzKWSECTArhtgBq+X2eRgGLKjsu3pZLED5s5/imrRrHEZ/757APo+JveEfS0mKLj47Dglbjmhnf+IKNzYBTVYxbbxXMTFWEiB25ZQFcadbHs8AZGgiNYZ0Wdgp11qA8xw6ruuDV/NRVQUlfy1R4AdeltL7aJhrOkDyyeEnaMMKmDU/tyqxZxy8oPO8ozfcDf595M9nAoFMNA77mzVWyAKxwuLExV4M+vpccBr6mSuere5Vqso6/MglyEjjeQ0gnV0+wTiERwhU9nPk2crieN5qiKkuMnfsV9OqemVrPbgkmWi8w2fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkSxadPlX+ceW9TliS7LuElDmMTuTndw07ZjRSoItF4=;
 b=Vf0HrZ9GWVcyLvF+wB6TxqNXM7UROG6LPRZmqff/f7l+pN7k0fafzibmw/scH82IDBwJ+6dHTaNgN81n6V/rGdSTCJcxioZKPv6ZBc/X4QWJArb3JewDMVyFFMU/YidG962qnBe6CiUScPiSEgAJB9XNp7F3p5AulgUg80a1faY=
Received: from CH0PR13CA0032.namprd13.prod.outlook.com (2603:10b6:610:b2::7)
 by SN7PR10MB7076.namprd10.prod.outlook.com (2603:10b6:806:329::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 22:32:53 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::aa) by CH0PR13CA0032.outlook.office365.com
 (2603:10b6:610:b2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.16 via Frontend Transport; Wed,
 1 Apr 2026 22:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 1 Apr 2026 22:32:52 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 17:32:52 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 17:32:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 17:32:51 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631MWphH887154;
	Wed, 1 Apr 2026 17:32:51 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 3/4] Documentation: sound: Add TAS675x codec mixer controls documentation
Date: Wed, 1 Apr 2026 17:28:44 -0500
Message-ID: <20260401223239.1638881-4-sen@ti.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|SN7PR10MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3dff39-6213-488e-7f88-08de903e9cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8+yupC01dataCJkbCMImQgfs+koIixpjI5yimVuT2jKY1cH9CpOq3N8M6kIjlV6kflfxWQuBZJeXv//sGhDUCY9A13W/Etize5rkAt+Ip1u8wenbMvaDT7oj9la0ZQmp3cBgJVvM0VswIM/VXearCtwcQigk/i/39TclCEDAHP0dKScYcRxDH8X/BNvW6Sf3898KoCtLO/xyUxMKBUMN5JblPw+hbt2RGzjkTCrIT4fCbbFQEHCxdHDWuGYE9rijDKYXNZ+1E+GbjFMnGrFnNK2ErYb9W7mZ1abcgkFc/E4kzDTxxF13R+VJyherfb6apXzTf9RVPrZuYk+y0WYvrCFJE/AEMQ8GJP/QVRznhnWIcLXYwgmQlBlKZtP5edWOY5qy43ryKpc6I+UU2BCdTrwMc9TspcfwZCDKs84NgmlS5K3ZA0A648b90i5lfb5MVld0l8acEWDByIV2HSZ70VcguVdZCjwko9DtuMrbPZgXxXzhuhqQ15fLJmoRiXYNUEiPRe0ioF/pSHTqOJi8MDm5J+zpXkzheGda9AB0h1s33PIrBwXPUb1eFmBd1ITy7O/aJKkW7IMkw8QXHaWZsdu8Ye7An/1sTcXoNLc17lTOfxljCwB3uAbOHDZqQofn2HnJwXylL/eeQQlsF3hRlDTtyriQFA6NlZNcfw+1ev3Dt4dT/SkKRD69NPGR6KVUjg9go4eKumQncFjGC23YnC91xXxi2VP0CAjZdPhF40TbTTbDkilmmJ0Ro2oH9OrFzWKggZ3ymBD7eoZ/vAjgEQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/IzMR/X9RM5dRjFZMbqdfdtQa4aUsge+WOH9pji2dp4O5MXqujF4ToONlD+1nOLyVRG7PUYMFJVrU5KwZ8QUCK2XhfnYL1Jf8QfxV85GsaZTxGP6yEfJ0dqfgQgTvm5DSStbUVxBj5DygFofprAEKleWcOXquo44uzlrNeRkFuRk/wy9utKkzr8uVjA7Hbz8T0kC78Azf3NcJoSXZJwjEEIKaBTrbimSIT3tRmrbm7C5Il/i2NJmpo1ACFbj52KIa/dV0z0nwIUReIDyiELqlCX1W8vMATBqDTZ4/t/Zbw2jUwfYqnBM4yTanvZl4QiYjsF7ESxcQIm0UbA/ZNE7iCvI0L5j4SMUVVpOgbSW+DPiGm8Bi6jL/lyRfzeHSTeiMZ9QuGgPwWa5TJ7NoHMcUtYXidouXh/TxZwdXGbaiqRi4TGy7UtE+P+3o4w5z8Xa
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:32:52.7253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3dff39-6213-488e-7f88-08de903e9cea
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7076

Add ALSA mixer controls documentation for the TAS675x driver, covering
DSP signal path modes, volume controls, load diagnostics, and fault
monitoring.

Signed-off-by: Sen Wang <sen@ti.com>
---
 Documentation/sound/codecs/index.rst   |   1 +
 Documentation/sound/codecs/tas675x.rst | 618 +++++++++++++++++++++++++
 2 files changed, 619 insertions(+)
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
index 000000000000..334b1d8be3ea
--- /dev/null
+++ b/Documentation/sound/codecs/tas675x.rst
@@ -0,0 +1,618 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+TAS675x Codec Mixer Controls
+======================================
+
+This document describes the ALSA mixer controls for the TAS675x
+4-channel automotive Class-D amplifier driver.
+
+For device tree bindings, see:
+Documentation/devicetree/bindings/sound/ti,tas675x.yaml
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
+
+Analog Gain Ramp Step
+---------------------
+
+:Description: Anti-pop ramp step duration for analog gain transitions.
+:Type:        Enumerated
+:Default:     15us
+:Options:     15us, 60us, 200us, 400us
+
+CHx Digital Playback Volume
+---------------------------
+
+:Description: Per-channel digital volume control (x = 1, 2, 3, 4).
+:Type:        Volume (TLV)
+:Default:     0 dB
+:Range:       -103 dB to 0 dB (0.5 dB steps)
+:Bounds:      0x30 (min/mute) to 0xFF (max)
+
+Volume Ramp Down Rate
+---------------------
+
+:Description: Update frequency during mute transition.
+:Type:        Enumerated
+:Default:     16 FS
+:Options:     4 FS, 16 FS, 32 FS, Instant
+
+Volume Ramp Down Step
+---------------------
+
+:Description: dB change per update during mute.
+:Type:        Enumerated
+:Default:     0.5dB
+:Options:     4dB, 2dB, 1dB, 0.5dB
+
+Volume Ramp Up Rate
+-------------------
+
+:Description: Update frequency during unmute transition.
+:Type:        Enumerated
+:Default:     16 FS
+:Options:     4 FS, 16 FS, 32 FS, Instant
+
+Volume Ramp Up Step
+-------------------
+
+:Description: dB change per update during unmute.
+:Type:        Enumerated
+:Default:     0.5dB
+:Options:     4dB, 2dB, 1dB, 0.5dB
+
+CH1/2 Volume Combine
+--------------------
+
+:Description: Links digital volume controls for CH1 and CH2.
+:Type:        Enumerated
+:Default:     Independent
+:Options:     Independent, CH2 follows CH1, CH1 follows CH2
+
+CH3/4 Volume Combine
+--------------------
+
+:Description: Links digital volume controls for CH3 and CH4.
+:Type:        Enumerated
+:Default:     Independent
+:Options:     Independent, CH4 follows CH3, CH3 follows CH4
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
+
+CHx Auto Mute Time
+------------------
+
+:Description: Duration of zero signal before muting triggers (x = 1, 2, 3, 4).
+:Type:        Enumerated
+:Default:     11.5ms
+:Options:     11.5ms, 53ms, 106.5ms, 266.5ms, 535ms, 1065ms, 2665ms, 5330ms
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
+
+SS Triangle Range
+-----------------
+
+:Description: Frequency deviation range for Triangle spread spectrum.
+:Type:        Enumerated
+:Default:     6.5%
+:Options:     6.5%, 13.5%, 5%, 10%
+:Note:        Applies only when Spread Spectrum Mode includes Triangle.
+
+SS Random Range
+---------------
+
+:Description: Frequency deviation range for Random spread spectrum.
+:Type:        Enumerated
+:Default:     0.83%
+:Options:     0.83%, 2.50%, 5.83%, 12.50%, 25.83%
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
+:Note:        Applies only when Spread Spectrum Mode includes Random.
+
+SS Triangle Dwell Min
+---------------------
+
+:Description: Minimum dwell time for Triangle spread spectrum.
+:Type:        Integer
+:Default:     0
+:Range:       0 to 15 (raw register value)
+
+SS Triangle Dwell Max
+---------------------
+
+:Description: Maximum dwell time for Triangle spread spectrum.
+:Type:        Integer
+:Default:     0
+:Range:       0 to 15 (raw register value)
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
+:Note:        When disabled, manual fault clearing is required after OTSD events.
+
+Overcurrent Limit Level
+-----------------------
+
+:Description: Current-limit trip point sensitivity.
+:Type:        Enumerated
+:Default:     Level 4 (least sensitive)
+:Options:     Level 4 (least sensitive), Level 3, Level 2, Level 1 (most sensitive)
+
+CHx OTW Threshold
+-----------------
+
+:Description: Over-temperature warning threshold per channel (x = 1, 2, 3, 4).
+:Type:        Enumerated
+:Default:     >95C
+:Options:     Disabled, >95C, >110C, >125C, >135C, >145C, >155C, >165C
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
+
+Global Temperature
+------------------
+
+:Description: Global die temperature sense register.
+:Type:        Integer (read-only)
+:Range:       0 to 255
+:Conversion:  (value × 0.5 °C) − 50 °C
+
+CHx Temperature Range
+---------------------
+
+:Description: Per-channel coarse temperature range indicator (x = 1, 2, 3, 4).
+:Type:        Integer (read-only)
+:Range:       0 to 3
+:Mapping:     0 = <80 °C, 1 = 80–100 °C, 2 = 100–120 °C, 3 = >120 °C
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
+By default the device runs DC load diagnostics at initialisation before
+accepting audio. Setting ``ti,fast-boot`` in the device tree bypasses this
+initial diagnostic run for faster startup. Automatic diagnostics after
+fault recovery remain enabled::
+
+  codec: tas675x@70 {
+      compatible = "ti,tas67524";
+      reg = <0x70>;
+      ti,fast-boot;
+  };
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
+:Note:        When enabled, affected channels re-run diagnostics after fault
+              recovery and retry approximately every 750 ms until resolved.
+
+CHx LO LDG Switch
+~~~~~~~~~~~~~~~~~
+
+:Description: Enables line output load detection per channel (x = 1, 2, 3, 4).
+:Type:        Boolean Switch
+:Default:     Disabled (0)
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
+
+DC LDG SLOL Settling Time
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Settling time for shorted-load and open-load detection.
+:Type:        Enumerated
+:Default:     10 ms
+:Options:     10 ms, 5 ms, 20 ms, 15 ms
+
+DC LDG S2PG Ramp Time
+~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Voltage ramp time for short-to-power and short-to-ground detection.
+:Type:        Enumerated
+:Default:     5 ms
+:Options:     5 ms, 2.5 ms, 10 ms, 15 ms
+
+DC LDG S2PG Settling Time
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Settling time for short-to-power and short-to-ground detection.
+:Type:        Enumerated
+:Default:     10 ms
+:Options:     10 ms, 5 ms, 20 ms, 30 ms
+
+CHx DC LDG SL Threshold
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Shorted-load detection threshold per channel (x = 1, 2, 3, 4).
+:Type:        Enumerated
+:Default:     1 Ohm
+:Options:     0.5 Ohm, 1 Ohm, 1.5 Ohm, 2 Ohm, 2.5 Ohm,
+              3 Ohm, 3.5 Ohm, 4 Ohm, 4.5 Ohm, 5 Ohm
+
+DC LDG Result
+~~~~~~~~~~~~~
+
+:Description: Overall DC diagnostic result register.
+:Type:        Integer (read-only)
+:Range:       0x00 to 0xFF
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
+:Note:        See fault bit encoding table at the start of this section.
+
+CHx LO LDG Report
+~~~~~~~~~~~~~~~~~
+
+:Description: Line output load detection result per channel (x = 1, 2, 3, 4).
+:Type:        Boolean (read-only)
+:Values:      0 = not detected, 1 = line output load detected
+
+CHx DC Resistance
+~~~~~~~~~~~~~~~~~
+
+:Description: Measured DC load resistance per channel (x = 1, 2, 3, 4).
+:Type:        Float (read-only, displayed in ohms)
+:Resolution:  0.1 ohm per code (10-bit value)
+:Range:       0.0 to 102.3 ohms
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
+AC DIAG GAIN
+~~~~~~~~~~~~
+
+:Description: Measurement resolution for AC diagnostics.
+:Type:        Boolean Switch
+:Default:     1 (Gain 8)
+:Values:      0 = 0.8 ohm/code (Gain 1), 1 = 0.1 ohm/code (Gain 8)
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
+
+CHx AC LDG Real / CHx AC LDG Imag
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Real and imaginary AC impedance components per channel
+              (x = 1, 2, 3, 4).
+:Type:        Integer (read-only)
+:Range:       0x00 to 0xFF (8-bit signed)
+:Note:        Scale set by AC DIAG GAIN.
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
+:Note:        Inverted logic — control value 0 = enabled, 1 = disabled.
+
+Tweeter Detect Threshold
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Magnitude threshold for tweeter detection.
+:Type:        Integer
+:Default:     0
+:Range:       0x00 to 0xFF
+:Resolution:  0.8 ohm/code (AC DIAG GAIN=0) or 0.1 ohm/code (AC DIAG GAIN=1)
+
+CHx Tweeter Detect Report
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+:Description: Tweeter detection result per channel (x = 1, 2, 3, 4).
+:Type:        Boolean (read-only)
+:Values:      0 = no tweeter detected, 1 = tweeter detected
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
+
+PVDD Foldback Switch
+--------------------
+
+:Description: Enables automatic gain limiting when supply voltage drops
+              (Automatic Gain Limiter).
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+
+DC Blocker Bypass Switch
+------------------------
+
+:Description: Bypasses the DC-blocking high-pass filter.
+:Type:        Boolean Switch
+:Default:     Not bypassed (0)
+
+Clip Detect Switch
+------------------
+
+:Description: Enables DSP-based clip detection (Pseudo-Analog Clip Detect).
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+
+Audio SDOUT Switch
+------------------
+
+:Description: Routes post-processed audio to the SDOUT pin instead of
+              Vpredict data.
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+:Note:        Requires I2S or TDM format. Not supported in Left-justified
+              or DSP mode formats.
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
+
+RTLDG Clip Mask Switch
+----------------------
+
+:Description: Suppresses impedance updates during clipping events.
+:Type:        Boolean Switch
+:Default:     Enabled (1)
+
+ISENSE Calibration Switch
+--------------------------
+
+:Description: Enables current sense calibration for accurate impedance
+              measurements.
+:Type:        Boolean Switch
+:Default:     Disabled (0)
+
+RTLDG Open Load Threshold
+--------------------------
+
+:Description: DSP coefficient for open load fault detection threshold.
+:Type:        DSP coefficient (extended control)
+:Location:    DSP book 0x8C, page 0x22
+
+RTLDG Short Load Threshold
+---------------------------
+
+:Description: DSP coefficient for shorted load fault detection threshold.
+:Type:        DSP coefficient (extended control)
+:Location:    DSP book 0x8C, page 0x22
+
+CHx RTLDG Impedance
+-------------------
+
+:Description: Real-time load impedance per channel (x = 1, 2, 3, 4).
+:Type:        Float (read-only, displayed in ohms)
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
+:Note:        See bit encoding table at the start of this section.
+              Reading the register clears all latched bits.
+
+Known Limitations
+=================
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
+- Device Tree Bindings: Documentation/devicetree/bindings/sound/ti,tas675x.yaml
+- ALSA Control Name Conventions: Documentation/sound/designs/control-names.rst
-- 
2.43.0

