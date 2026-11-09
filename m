Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794201181;
	b=TuAi7IFR4VBPfZd/2K0CzwD2uUgxE0NMGHBfPexxQRml7Ovo72YXOb6U5PCzp8gMcqvT
	 87MHhttXzUuT+PjRus2pTZNRAIgs1TJvzuwIfHRQU9vbe7GPinYAJOD5hBKRKW5jnss87
	 0c0hlbzcBbRAIczLuVqelXg8BFJgfCdRjUUIV4TZzeSlzYnBQ0RrRvBaA5hSARF9oMhn1
	 0h86MNAZfN8n8v5nQJ5B0vqam4pRIQS8cJImqtPOTK6j7I4WWl0Fd8BsOykgPjO7X0FwR
	 cnDtHenM8Js+Ne0h2yAwef39B7x8yE8AuoefA9Tr1bk4qOlQKXlpmzDHdpOIJAyx3Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201181;
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
	bh=Lqv15ldo8oynBAR3AvwF5E2/9yg1oL7OEXtAU7DaCHI=;
	b=N0Dl1xC0UpSAW5WcpKDPpQtXYbMTD+gi6RT/VV4Lm4yWXD203/bNuFepJSHAgHU1j8d+
	 reh1Net9bzJlwAAe6rEcDiNiclT9iVO5XpCx8Ah5qT4Za5ko0ZlOkF74w0g5CD8eAfMtk
	 wJEykIPnknSJFv4XasJ7BjftEwFzszwW0ntQu9nsF3Vwx2V/FLK5yk6TDW9VHNRuX/+9l
	 aw0Dc1hF0pMBjIfyARMqAWCuGL9XudfWxs2O3OxSL9GJ08mg2mOhnG/pKC3MDgI+WyHZG
	 HKoFe/LZCZkQhTrggHRjIGk2R9BQujOTXGWJWoZ1BNLxDVvVlzigaMPQ0PXMQw23TXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nuvoton.com;
	spf=pass smtp.mailfrom=nuvoton.com;
	dkim=pass header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256 header.s=selector1 header.b=Lw6U0m6c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.8
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012008.outbound.protection.outlook.com [40.107.75.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84E606A31C;
	Mon,  9 Nov 2026 05:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C84E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256 header.s=selector1 header.b=Lw6U0m6c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gl27eWOa80G9umD8G4+jWcJzEHy4eGWbMmikkiQgEDzERM0fDRxmsKEPH4R/wevwAYd3mnZP94py/ybeq7DDJk0AvKHKzYd8XboHBOYHPgIScIVbVCeUSW5oQfGcJ8f8rRb+Xy0dgg2rP5J7jatoNjgUc2cgUEedNJ8oi4B+OOSLV8SBW8IeISpZWvRpaswKSK+PiLbusTG14vPrj3T33BqqptK5qu24Fe8nx0SkAzw3q3NFRVCfBeQLygudX8nTUOa8FFhtcbG3bvDFO10AsVver1TcC8A4Ael4A+SIEWEc5OIZq6G33UxlnGg6tVU5l+glUVL+OA1Mj2QpZhKLUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lqv15ldo8oynBAR3AvwF5E2/9yg1oL7OEXtAU7DaCHI=;
 b=fFDME4VWutVqv3l1NauFdWTLcfZbkJZcs4PQGs0QQzzWSvZSSdbvSp4sEYcYLCe/Nec5nw07Q5OQletu/czbSC+GUAF21j583jtdqc2ETRD7v2pNbztuHpstogXZCIZUaLB0raGCZx3ANo3P0iqlP4ca08EXjOSOUqlFFbBq9w95zO0UJSYZ5UEfD2azLPcjIXPDrnaOTbQiwa3nH4OpUSmHVHImrCJkfwDZ3/dREoOMkcvK6q5vfMqV6pVTYLu3XtrBoNZIQNdMCfdH/P72IvoEsQvm4xuCNB1+RMSpRhok1bEFOc/Jf5skBe8rRjZtJRdpA9b9W3NsWaTfOM3Log==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lqv15ldo8oynBAR3AvwF5E2/9yg1oL7OEXtAU7DaCHI=;
 b=Lw6U0m6c4Yua9EOp0TfEH1fzWrN3Aw8oSEJVorvR3RuwPWBhGz12+zTTCDzCUxv8OTvaZNoC2mt2RDIWIljnNQ897xYLwD/n4K+3cnFZYhq1lpBS3A2GqcUKS7dv5AoEdQ6VvUJ8ZqGPAqLc5UOk5+rs2TZlZZRyCWEWyXtYTeZ1Ig4jxVGyt152ydQiGNNIAV1Oc/TgBhax7cMYgmdtSV93GE1f/i2KBWQxNdHmKChC6sSPQsYwMWs973+T73h1QSoSLAxYDCczAcb9Uw7JwbACEOTX2IDA33Eb+FT0ktqWUmLT2PdsstJL8h1uDk3GLbMmIQzKiIXqo8XAyHATaQ==
Received: from SG2PR02CA0136.apcprd02.prod.outlook.com (2603:1096:4:188::16)
 by KUXPR03MB10028.apcprd03.prod.outlook.com (2603:1096:d10:9f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 05:12:55 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:188:cafe::60) by SG2PR02CA0136.outlook.office365.com
 (2603:1096:4:188::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 05:12:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 211.75.126.7) smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 05:12:55 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 9 Nov
 2026 13:12:52 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Mon, 9 Nov 2026 13:12:52 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>,
	<lkp@intel.com>, Neo Chang <YLCHANG2@nuvoton.com>
Subject: [PATCH v2 0/2] ASoC: codecs: nau8310: Add NAU83G10 amplifier
Date: Mon, 9 Nov 2026 13:12:49 +0800
Message-ID: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|KUXPR03MB10028:EE_
X-MS-Office365-Filtering-Correlation-Id: 340f8b6e-e57a-41cd-1936-08df3e201cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|7416014|18002099003|6133799003|10067099003|11063799006|261028144727099003|261102123227099003|261022105027099003|261022075727099003|56012099006|261021121427099003|261026121527099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	NUQGisnynmAQmSEaFehKkwCATKdT9gwYi+hCRsn/iS7h0FpzroYraI33gK7yMe8ceiUCLkUlVduHcPKZpv5Yohc/iDDGCRUbB6aeN53jzQLE006IqKB45RYc9UmsCqb7j57iNG/TnzY60kbgyM++sXHdgh0enEta3I1z8OfLK6NFrStiWdtoOSld8OpvXo43mYG8JPAGco8sI+FNzO4QP+rcSaCw7o1M6VvhQ+hQXZEM2fi0Ir9pg81yQNg9EKIihPvquPXKmq2LM/DWrrrfYKUdkm9Xa7E53whPda2Oyb3UxXDhAgtCUnCFn5JtFYS42giZZYQbD0VS8xjBFwfllx+udS4o3OShNxg9tXn09/GV3Ej0cvs0Ej6DDwQCRj7uIucOLTu6qbaqGZmnePUxe0qtT+yynSQ5fwYfov5WPoERVhlBKP0EcAoj1jkbZlvPoYcvG49+Dl8ygXZ9e8ZhL9qiaVl8xAXW05oP6hEo0FXxkJJ6E5SLXiyt0wuix8CRzGSyNGYZ+fE2cMtOOMKX50OjjabE1RqJn/6chPiFdtkoZQHKtAx97lmEpjQtVZAB3KlIFoCpRGfelEDXSEi3a1sjaohdoKblAl55tWHjDIhTRchrcQeD75kff5oiJ5AIHXtnwhOXgAeOGEI03Lr6BVBIpJYaKfrz3r0YurXdyp5PGGY0EYZMR90eUUmDOPn98jR+fkMk2qbJHY2X5912ew==
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(7416014)(18002099003)(6133799003)(10067099003)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(56012099006)(261021121427099003)(261026121527099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H/qt+lnA79kvaBXf6yYBKnMvNWo0Nte7K0etsN1DaxcHQEFQZoUrPwMpmOoHAZw/tgJ9pNjHinihhBlVeEF/n60hg//C+bftoyVQtWdG5VrEDumMNPAP2JaEoabhpYw9wiC6u01+62ND7CZ0GwYf1ybMZcZznKvuvf8u0BOddGpfsHOquzgCFdIg8kn+uryfUKoNFpaTuVmzpbFWNHhkdeXFRHulEPh6XTbBU6K+3Wktg1D+B8s+RM41jx+6+7EEerNM8AnU17I3tU4cyXZUhFFvHiiehzAKVnKtSoM1Uh7dNWcQW+BnFVPodifRnqBRwBLkORoLQgjimhUVtKxeuKoNqE5fjuUl46gX+qPUhMW/pkZHBxh1jrhUZLtJwVN7T46opeRevuDU7/9mTMz7rjSanI8uaOAD4pXreV0X9ttnT+J/UWwoYeEKTv5+KoB9
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 05:12:55.1846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 340f8b6e-e57a-41cd-1936-08df3e201cca
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB10028

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

 .../bindings/sound/nuvoton,nau8310.yaml       |  200 ++
 sound/soc/codecs/Kconfig                      |   13 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/nau8310-dsp.c                |  695 +++++++
 sound/soc/codecs/nau8310-dsp.h                |  111 +
 sound/soc/codecs/nau8310.c                    | 1828 +++++++++++++++++
 sound/soc/codecs/nau8310.h                    |  633 ++++++
 7 files changed, 3482 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8310.yaml
 create mode 100644 sound/soc/codecs/nau8310-dsp.c
 create mode 100644 sound/soc/codecs/nau8310-dsp.h
 create mode 100644 sound/soc/codecs/nau8310.c
 create mode 100644 sound/soc/codecs/nau8310.h

-- 
2.25.1

