Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792658445;
	b=pMq6vnje3doVwTWPOie4v/R99mdHzbogl7ZDcfKW58dYQL41gtHvWtK5tiL7RXXpE62r
	 Zz+TVd5vzKCF53y3bM1UF6xP1EoPpqtqcC6BNGB3x53wwOyqFFHEyWUh1CAolNTrJtPf5
	 8iVT3jlsgysMkjnRxpCTZHYLfu8sIrz7LwD53robVF20bcIZohHX9mY/fhJMuzwjiyFr/
	 l8SwNij3dCMpK6zpV8SKx2EfvAhiLvqaJZUuMiYa8n5w58d8SLvaW6hfxFqnNiLJru+Hn
	 CyESa9/D+4GLtQksvy0qMsM2VvQ/UuzlMYt0arRxTulKnUrM4uUPclC21lBUiXCm/BQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658445;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NotSetDelaration:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=tMAapvwauBpKJ5VRpE7h+U0yfE0jozD3iiw+OwlxKdQ=;
	b=gV2H7uq2GwusZxA1pK9MiGLR7xfMyl4wsotfiwiBmpmSVTHZSFuDzLHyEdpOxI2CXj7r
	 jcgp4l77Rz9JBRaumr3AxSTeCayPTCl22pMLw5jmlNd90PLk0ZYUFPllouI7JBrYKOHBw
	 nVy/V8Ml/QEaAvxBsX7FbekzoBe+YLDuEbKqzCAcLLNBAcEqONuVQeWRXEMsk73f642w3
	 brsZYdeOqeDXlPuEuoQIg+Wm5v9VprOjTQW8LJ+hjaAclKE5eQdQsHfYmzJnkhkLg4kLF
	 B3mXJvygvJfdIZYhHF47gfH3vk9Oye1u0SLwICYlLnJ8CG3lFqeaFUfB/7JbLrU3Juw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nuvoton.com;
	spf=pass smtp.mailfrom=nuvoton.com;
	dkim=pass header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256 header.s=selector1 header.b=SbR86kih;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.68
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012068.outbound.protection.outlook.com [52.101.126.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F4606A31B;
	Thu, 22 Oct 2026 08:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202F4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256 header.s=selector1 header.b=SbR86kih
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pb0wPVBQGV/0Ukl9PlUdvtBgCmSuLcGJaM6jHHJbijxuuh0c4Lhsa2cT1lSRBfUhUMHA7u6WeRZHgNZsBgBk6I2t5oJgxbCNjZbmL1smGR1BhcWjMdfctE0MdgNgugmvUoCqTa+LS3NqXhSA5A1o6TJHmc/x01DXllm6ebPJszBfJuMA4s5ttJkOybpQ5vpvo+AekhELwo4J16kLBxHCxxg1G/6qwKP5oeybO81+QvAS3E0tCNLQyAhLMaAl3bJ5evbX2b2J5AsF4y9fOcwsssyQ8JczNO0npyQzk+2hWwXZsFMpVw6O6ON1lJyIPMdZGT3guc7SVSS8Ut77r5atJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMAapvwauBpKJ5VRpE7h+U0yfE0jozD3iiw+OwlxKdQ=;
 b=V+rCfvrapgyfibbr0Ti5NIFeQIqIq23NIqPbnNOfcxBI/v4Nemyal/TzUWTgNQQiRoPoa6lZDp21Jh3JzT/HWRYlar8LzN/qDCcZLHtn+wZw6kHL42sZdRkr9zO5yJi4B/WtccvXxrz4xhq4LhVh9REUQPCCMah+EHOiusFUAHtrYhJUcCNTn+Ad/yprI9AyRFEf+WuDcPSmIo5au1FY4zbuu5k6ORdv3NYEvzeROppwEc0vObgqm0Ao3tTp+mbn6z26Xhz9w3iJqZn3mtwPT5Teiuj38g9tQQH+kZksOvNmVvWKdqEwtk2hPRIOGM2W0yXg1DmBaVulQNJDaJmsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMAapvwauBpKJ5VRpE7h+U0yfE0jozD3iiw+OwlxKdQ=;
 b=SbR86kihzZD0996GIHuclCawvYf5sTfFxQXjjSVd4dds6zj67FImB6unMZMH311WINpFE4+DJ9I1XLd3aEaO68mtb+GQgpH36zq/3CTBefbufunHo7LGoApL7lRAFLy6K1OSdDMDfX8ZdKF8iugb86SCsm+623TdGU1o1uxF/A2npOTMQhjj40C9LVA0IRwMY4GeeRjYVohrmIPYq5Ym4MztF9cM9nZdI+QgWY6wGmcXY0ie17MeuL99tovBO0tuVkfi+o5wSWJCirJGzrFqa0dED2SeHeeS2G5nHVvW4xFgLotn0UTI/Ir3oI/oCjJZP7h2NXUoazwRih6dRdDSdg==
Received: from PSBPR02CA0016.apcprd02.prod.outlook.com (2603:1096:301::26) by
 SEYPR03MB7628.apcprd03.prod.outlook.com (2603:1096:101:13d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15; Thu, 22 Oct 2026 08:40:40 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:301:0:cafe::8e) by PSBPR02CA0016.outlook.office365.com
 (2603:1096:301::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 08:40:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 211.75.126.7) smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 08:40:40 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Thu, 22 Oct
 2026 16:40:39 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Thu, 22 Oct
 2026 16:40:38 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Thu, 22 Oct 2026 16:40:38 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>
Subject: [PATCH v1 0/2] ASoC: codecs: nau8310: Add NAU83G10 amplifier
Date: Thu, 22 Oct 2026 16:40:35 +0800
Message-ID: <20261022084037.259983-1-YLCHANG2@nuvoton.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|SEYPR03MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 08130c10-cfd7-45ca-1f98-08df30182702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|261021121427099003|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	rQvxEPWhYvDxrw4TW4Sl42YD0SX9paYXsMc8EYl0iisGfyShn0d0SAwdISqnmOdNmZCgoRpkNEAlVhanW2i+8KnIpg1DAVVpZqT+uPY+WIy4LoiAu6WEljM7GmOXh9G9hRN4qEcV6NRZbyAaImCJgXtnxcP1a4cs7Bf399UCl543EdVKWXEsxR680L6JVI9D7b69+YhtzH7HCnf2O2Uu1rpHyRu8eH8pxcCdS4ncQS/JfqGBOyfQeOh/LIeK5lja2CRgBCR5GbrlNsI/Qdi8GYxzpUUVx+kam/kIkaSww0bbA273VEzHvt4+dNvis7oBBUeCeGykgcOKP9fJoo0+Puz1aNMHAJHulTP80EVJT09ULIP2KSqxRNPygPHWI4hErtr+Z6uavKoyQIxebxtbsbVu9s3NiOuVkAdzkT28EWxpQznqoJsYj9lQytn03bRORrfUwqqvLeuAmZf9/5L3wKw0RhdXs4sWHdcp+X7kz5kLlBnk7If4Kmgf5BLuol2AWxFjRBFX9u30J4jaB5x5IfPnumJVTXnSR+URrEIcITH8o34CQmQG669vshgADyNgSeNuJxRE2jWpCiGZzWZukzQ/jmhwoyb//74EXGOS4KSkMGk9T1woFzzw+1+xD+zoENJARZX4ApL1EFshhLodNQBLCY36Q/klP+h8Kt2yfZB+xB7cJPxJEOxkJvm0oliq
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(261021121427099003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	drh+bgfXeQIRzq5rvPYP9DDl/lYXZ0BkpbC9/zHEwKAcG35jfkdCP7wpAlYJWV8s5e2fuQV7R+yid+7fBtKn0Re7uBdgRsFtrWn+X4gydGcaAp6qkxwoMT09TuTtBm9HbN25YT7+W4tFssv/+DWXzGK86IUwHCztURjN6T266bUVzqgKcUh/PWM1d7EcXZTQ2/ERM1sR0OoehGMVbIFA7X3M6I0Nb6cQdQvRjcum9MawnIR/WMGxags9sH5Gu2P86+BBUC4THzHaH06gIWxMrxB/jDGuZ/YNyZpTr86C4tkkmYTarba3gpT3CW/nAwIP+ebLo7mYTy/w2/oVSzvxH6aY+t1hu7SWlmPRPiMHLBWhDAZ4fvWVTqcU1frihab6i+AmQHIHsVKKKKoaeMDKaVNY3z0Ww82QQiRUrHZ7eAfDVQur6twL6WrSbCDPrjIF
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 08:40:40.0758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08130c10-cfd7-45ca-1f98-08df30182702
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7628

This patch series adds support for the Nuvoton NAU83G10 audio amplifier.

The NAU83G10 is a mono boost Class-D audio amplifier with
an integrated DSP and I/V-sense support. The driver supports
I2C register access through regmap.
DAPM widgets and routes, TDM interface configuration, and DSP firmware
loading.

The series is structured asd follows:
- Patch 1: Adds the YAML device tree bindings documentation.
- Patch 2: Adds the ASoC audio amplifier driver implementation.

Neo Chang (2):
  ASoC: dt-bindings: nuvoton,nau8310: Add NAU83G10
  ASoC: codecs: nau8310: Add support for NAU83G10 amplifier

 .../bindings/sound/nuvoton,nau8310.yaml       |  200 ++
 sound/soc/codecs/Kconfig                      |   13 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/nau8310-dsp.c                |  690 ++++++
 sound/soc/codecs/nau8310-dsp.h                |  111 +
 sound/soc/codecs/nau8310.c                    | 1845 +++++++++++++++++
 sound/soc/codecs/nau8310.h                    |  629 ++++++
 7 files changed, 3490 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8310.yaml
 create mode 100644 sound/soc/codecs/nau8310-dsp.c
 create mode 100644 sound/soc/codecs/nau8310-dsp.h
 create mode 100644 sound/soc/codecs/nau8310.c
 create mode 100644 sound/soc/codecs/nau8310.h

-- 
2.25.1

