Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991347;
	b=zeKqUvchPyxPBQMZsqAgaVJzqUJk1ITHav9CNKUWMpEIk2wo4dSuk8XfKbZAfiac2nDr
	 DELexJE/sRT1tvewI31j/mVrrb6fPr5qsffZ4yeqxlpr803dHcX1ZX4OTdAUANXq/C3uZ
	 uZHBVYSjlJlcJGcSWtH6FRLg5O2QPNhSzz6W0sEXL1nmvYyNUADkZuMoUgG0KaUiSY9bw
	 FPx97CeA9K9Ro4CCFoTLbm2vspoNkrh6dZfe0N1B3jBOgkPDxm70cYAlviK2g/7HGZu6R
	 GAZXp6h0ybrl2C9XudCDqi44wJdaL49nz/OLO5Uo0bs6oIXR0yppk8AGiXvkO2NiRyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991347;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-NotSetDelaration:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uJLZ8z54W7FSywt7ESFfpP5iF3nGotPh4nJLiYum6aM=;
	b=r/ef5VRyD+Gjy5B5cDSv582IOzVAaI0ubiV5mQV3AbwPp1irc/DFtDqapxo+EbCHHsFu
	 oaF/MHSsBSHTNxH7ZU/enbRnSpqvSx4QfwxjNH1/c+whcCShwx8n1VgCPP1q1SPmVf5tf
	 hezGf4ZdLR9dJN8j8QBrpyjntg25QriNg5SIOJgp+8uq0dWzNh6pwfy4n+NiDXsmVE8bo
	 S+zGKiiqL2SOTMvtLhQPmbOmhJrvUH62g58L+PRpiL+pmehNIAJFHXrPNBGDEwX3uWvjS
	 NMcECR6V/TaXmMjhXhNAmOIlTnBJx3eUXEsWqk6MIAQhM2sDUr2K4G4VpkJfo//VWRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nuvoton.com;
	spf=pass smtp.mailfrom=nuvoton.com;
	dkim=pass header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256 header.s=selector1 header.b=qLjPWWdR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.1
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013001.outbound.protection.outlook.com [40.107.44.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D9B606A32F;
	Wed, 18 Nov 2026 08:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D9B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256 header.s=selector1 header.b=qLjPWWdR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNth8SXwfnUof3sXlCD/+GYdVNwId1odmnTJthSHmdu2rqmqe4e1M42B+ttu/AXYhRIBWQJN6h/Wv2HkGx0lF9+zIvXCRrQM0ufdkrk5X9oQApdNB7n6mtmL7ZAyLXj/J/Nljzreu8ZDHTIMiR2OVGhwO5usnrjqVOqMi6l5b64NA4qskUXAPHjcWuPqvOXwJQZbcfI0PlxmRgq7TdQ0VUSc2IrcvSYWPC1vHq1UbuEw+l2YuN7lcdG0buS3BPGxWxqLVtq6xLykV8a24Ow0OX//KTfQwhIMr7ELL/Y/2ZXwdaoi9EG98AqZPFpyJghUeiPKPfDtkj9pvoOS+yCDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJLZ8z54W7FSywt7ESFfpP5iF3nGotPh4nJLiYum6aM=;
 b=tDQVwrknjWKYn6I/lhX4H9nz/dSg9Le4+hyPUQvtXxOOK7zbgcA0ZbSL15nWgoGewAmBOL9gaRT9gegK3Suifb64fQ/oxcsK1cBlM8k035GJpbfoRtrENRlXCty/PzvOY8SzUzTapDrtbIjydaVjwZjl7wYy+MGlqoTvu7ublKtX1y2uz3LRWrS1pwlNTJw65dKcc+EGqS9QDhKMg70p8w/1da/T39jdDg+9ru+5S8a9vp77Jy3avbhrzR9pSo5HHR7NrCLDV0cA5lNP1qhK8jPDuVmD6+c/1fSD9DlqUAOH1KWYR8FY/7bNR9Y4KbX6CfCvuxJg3LNVHshUtCakqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJLZ8z54W7FSywt7ESFfpP5iF3nGotPh4nJLiYum6aM=;
 b=qLjPWWdRNsaWEtE7TiQpX4tfZ07RVfeQVrivTC9a3szH5KBrHwvLs+DfPNzCo4LOb/a/vCzK+NusR3ZykEWX1wulYdntvaT+S/w1w9ZcKgi0trUKt5EyHJy0JXVCyX2aHxmlIfEuveGO28ufU323xqCmoreg4iOFEaZ2wE/NrMqp6iSJDDgQtAERH0jHGFJBcXbBKxo6GM9QK0Ib7dQkfrLpR17HKxYZLpOXpdmeXpKGrGfo+rSunM9khiOsj9pTznUEDLZCp+w4n3k9by0wMGl/HDQ37cJQ2bJcEBwjFf93hnDY0ltYKZQkY5TYdunZuKRySVtGboY92F5UUh46nQ==
Received: from SI1PR02CA0015.apcprd02.prod.outlook.com (2603:1096:4:1f7::18)
 by KUZPR03MB9413.apcprd03.prod.outlook.com (2603:1096:d10:4b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:42:20 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:1f7:cafe::61) by SI1PR02CA0015.outlook.office365.com
 (2603:1096:4:1f7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 08:42:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 175.98.123.7) smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Wed, 18 Nov 2026 08:42:19 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Wed, 18 Nov
 2026 16:42:15 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Wed, 18 Nov 2026 16:42:15 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>
Subject: [PATCH v3 0/2] ASoC: codecs: nau8310: Add NAU83G10 amplifier
Date: Wed, 18 Nov 2026 16:42:12 +0800
Message-ID: <20261118084214.527804-1-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|KUZPR03MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 1366a1f9-c7cd-40ff-943d-08df454fdb71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|18002099003|6133799003|261009223027099003|3023799007|11063799006|5023799004|56012099006|261102123227099003|10067099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	skQdCyJ9LgjijmFKPKRT6L3l3/psZyBH/F06xcYDob9vYA13gGngc+eL4BFtWew3kkJGO55YGy7G1j+507e+wXbLIFpnaeielUtlsY8YUxZ4DAxA/+M28yBfdU+7WyE2M/E/u9e5Xaj1DU8TSDlywD1zPZAdw6XGfWeZWWVzp82VbzZWTloMQzOHtfoFOYdJXiIECLYBVZGJkUw2m0x7EIzwYRPpmTaX0LwOwrKP1tdOgkvO8eTYwP3rQnTZ38lnYPlUHQl7yxPxiq0sj709B0O8zArXXXWbFCliTWBLIQQMPWp/o+5ZlbAfhz1/NRek6b7u2lQj1amLQv93COQ3rM2evxqjfV4c7HdTtDpkYt0T7APZWN5iwhp/2P02WbvDmftHJBma27mPL4zptbHynWLWhz3DpQF2kgWf4tYXbWPo9aN2hfWHXBuldDfsdz196+QMi41QtZztKdKNOkf5kCiHqlZHjqqPy8IH8GtJcwKDXyy40vlpOiIPgemkCoifX3SmWAZdekSSFOb0a2uNwre1gtltM31RlHv/KhtPalTVxeSYzM0CVHwPxxdZmqQZWLeEPiLciw2nllV74mWzfDIVKbOKIvgNHC9Xw13MkOJq5zii6dY6JU2NUJLi9aI+fOc6FlNv/qv6Bd1x4W59/ZTUIpY1vgcValhvDfFydJbTJf+i5RoxUzWBZe5QLX6Oz66KDPBRmeCUyzRN8NM9wA==
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(5023799004)(56012099006)(261102123227099003)(10067099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CTsQCbEkzfkugEYeQRBJDi9gvLUxc7ch8phH2UN0jMUe2R8skycnu7LljcGWAotwswRll3/XY7yb6hGKjpbkhKNfchGajyuEavdO9TNNo6EeTyW/40DVWM1p1CICfI86S+VX87qzn4h2o82KuFz58He0tgwBERcb+z9gSVPlT6Gw1Qr6GMgO2PS4/eMenivrs5iPxBNFPrEeFNZp7WcuPg037TNOL+xqZHvu68Iempm5pmaw5dDtLr/y3mmA+7Ap0W/p0sqD1pl08TGwDRzwqyHindxFAk5BGsDSdO3UzxP26pygMQaROMYpvxdMWSReiqvCCrYyUDn1NY2VsJ3QOYnRa5OaM+/0VWU8ejJ43BCiTkD2Vwe4T7OYdbT0IJGu5gqed2I7tYcFbzLfk73FTc4fB3YqNDGUuTDI0W6NCS2OcrRrQ1rsaXZ+Os6gGjLf
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:42:19.5388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1366a1f9-c7cd-40ff-943d-08df454fdb71
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9413


This patch series adds support for the Nuvoton NAU83G10 audio amplifier.

The NAU83G10 is a mono boost Class-D audio amplifier with
an integrated DSP and I/V-sense support. The driver supports
I2C register access through regmap.
DAPM widgets and routes, TDM interface configuration, and DSP firmware
loading.

The series is structured asd follows:
- Patch 1: Adds the YAML device tree bindings documentation.
- Patch 2: Adds the ASoC audio amplifier driver implementation.

---
Changes in v3:

[dt-bindings]
- Utilized standard physical unit suffixes (e.g., -microvolt, -ms, -ns) for
  electrical and timing properties rather than exposing raw register values.
- Corrects the description of the clock detection disable property (disabling rather than enabling).
- Added an 'allOf' constraint block to explicitly disallow boost-related 
  properties for the NAU8320 variant.
- Adds a usage example for the NAU8320 codec in the dt-bindings yaml.

[codec driver]
- Core & Probe Initialization:
  - Updated device tree property parsing strings to match the new standard unit suffixes.
  - Replaced i2c_remove() with devm_work_autocancel() to prevent uncancelled work.
  - Added device match data to I2C ID tables and verified hardware silicon 
    ID during probe().
  - Dropped obsolete of_match_ptr() and ACPI_PTR() wrappers.
  - Resolved uninitialized `kcs_rst` variable warning by handling empty 
    DSP replies properly.
  - Fixed TDM slot corruption by preventing bitwise-ORing of encoded TX 
    slot selectors, and added bounds checks/warnings for slot configurations.
  - Updated Kconfig description to explicitly include support for the 
    NAU83G20 amplifier.
  - Removed redundant nau8310_sw_reset_chip() and sync regcache after reset.
    
- DAPM, Controls, & Power Management:
  - Fixed type confusion in nau8310_biq_coeff_put() by replacing the 
    incorrect snd_kcontrol_chip() with snd_soc_kcontrol_component().
  - Fixed race conditions in DSP mixer controls by adding DAPM mutex and expanding device lock coverage.
  - Enable and disable Sense pin control to DSP playback streams invoke snd_soc_dapm_sync() in 
    shutdown().
  - Removed nau8310_adc_event() from the "ALC gain selection mode" widget 
    to fix ADCDAT_OE power lifecycle issues.
  - Cleared the firmware loaded flag (`load_fw_done`) during system resume in 
    bypass mode to prevent DAPM from routing audio to an uninitialized DSP.
  - Removed incorrect DAC unmuting behavior in the firmware setup error path.
  - Removed redundant clock source switching from nau8310_dsp_snd_soc_dapm_put().
  - Removed redundant check_dsp_enabled() function.

- Clocks & Hardware Constraints:
  - Fixed clock configuration for 64kHz/96kHz rates, restricted NAU8310_RATES 
    to supported sample rates only, and validated `mult_sel` before executing 
    register writes in nau8310_clock_apply().
  - Added a lock in nau8310_clock_event() to prevent race conditions during 
    system resume by flushing firmware work in DAPM clock events.
  - Updated DAC oversampling control to use SOC_VALUE_ENUM_SINGLE() instead 
    of SOC_ENUM_SINGLE() to prevent exposing reserved register values to userspace.
  - Fixed the maximum ADC volume TLV gain to 2412 (24.12 dB) to match the 
    standard 0.01 dB ALSA scale.
  - Fixed the maximum DSP KCS payload length to 1024 bytes.
  - Fixed sparse endianness warnings in BIQ coefficients controls.
  - Fixed code comment formatting to follow standard kernel style.

Changes in v2:

[dt-bindings]
- No changes since v1.

[codec driver]
- Sort SND_SOC_NAU8310 alphabetically in Kconfig and Makefile.
- Fix uninitialized variable 'kcs_setup_comp.set_kcs_offset' warning reported by kernel test robot.
  Cast 'data[i]' to u32 before bit shifting in payload packing to prevent incorrect sign extension.
- Replace deprecated SND_SOC_DAIFMT_MASTER_MASK with SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK.
- Demote DSP ready status log from dev_info to dev_dbg to reduce log spam.
- Support requesting DSP firmware via 'firmware-name' property defined in device tree.
- Use snd_soc_kcontrol_component() instead of dapm lookup in standard kcontrol handlers.
- Make clock configuration stateless by passing 'fs' and 'mclk' directly as arguments.
  This prevents internal OSC switching from overwriting active user configurations set via set_sysclk(),
  ensuring stable state management during suspend/resume.
- Acquire nau8310->lock within the clock event handler to prevent race conditions during
  DSP command execution and concurrent firmware loading.
- Add NAU8310_CLK_ID_INT to set_sysclk() to properly handle internal ring oscillator configurations.

Neo Chang (2):
  ASoC: dt-bindings: nuvoton,nau8310: Add NAU83G10
  ASoC: codecs: nau8310: Add support for NAU83G10 amplifier

 .../bindings/sound/nuvoton,nau8310.yaml       |  186 ++
 sound/soc/codecs/Kconfig                      |   14 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/nau8310-dsp.c                |  678 ++++++
 sound/soc/codecs/nau8310-dsp.h                |  111 +
 sound/soc/codecs/nau8310.c                    | 2068 +++++++++++++++++
 sound/soc/codecs/nau8310.h                    |  635 +++++
 7 files changed, 3694 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8310.yaml
 create mode 100644 sound/soc/codecs/nau8310-dsp.c
 create mode 100644 sound/soc/codecs/nau8310-dsp.h
 create mode 100644 sound/soc/codecs/nau8310.c
 create mode 100644 sound/soc/codecs/nau8310.h

-- 
2.25.1

