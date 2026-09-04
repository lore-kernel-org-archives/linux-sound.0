Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013030.outbound.protection.outlook.com [40.107.44.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0266390610;
	Fri,  4 Sep 2026 06:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788501661; cv=fail; b=T3pdvSJ2z6qVzTy9OLLr46sS9XvwDWcoOJKy/mPKbnsiaywlUvjiIYxN2b/nvmcMgdhKrDQfzE+Pvsi6uX2yaJHggFrY2IR1JSqrCbwJP0rJyuUgqLQunTDFSh1exvtq8wnv3+1c+bSXIszTGu6tCYSf2ZncppnmsCjuEg0hp0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788501661; c=relaxed/simple;
	bh=kG31+1O0yStJP+OG8h/YACHEuIOR8QC4Qic3m6VSOis=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iLceoTGJN/EudKr7Thpd+n35mACQvQ1QhRpKnhkoj1zBnkqk2RsZGnq2p3zzOmHUgt+mC/oYZTWZvgLHB99Si7K6bvEC1XWTgdltLHhXM/WpNDBDB056r4akSxI1Em1BYGWE0VebIRo6FAwGXj/OwVqXUjAbOPMh5UDF2DdpFZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=YG5q2I4J; arc=fail smtp.client-ip=40.107.44.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="YG5q2I4J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2zI52Zja7XgUjvPsjwzfmzzPYpcA2oE50kmJhCgdIUEuIx1fz62q9WOH2O0H79fRIigSlqPUHlsebUSSasqe6+1zqtqE0ZCG6QkTwIlef4G4b3lh3BtEn6JoXebAjwnM5Q0KoV1AHMBlIHVVYsXOIZLosdvbZt2RciNQNPZldN9VU5IdSHkooa3cM7QNB/N0IWd45B/k4MphI/TiXq+Xr5Ka7wLAASmOi/btNCUU0DZ6zohifuuK1hZtxuG1cS+wpcIeqsHS4pgji6ITeCBj90OUpDZ2LV/2iprwek1zEfXH6nl7oF2AgYIbbUb8ARBOhh0Daz0vPOoMGcIGhSu6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ofc1XQVLHenHrhb9JsjZWxefrnTXPq6wTPO/WIGPpI=;
 b=ZUeKAJgL/tT5/dRojaurWHyvGOgbx9g/5SIp4lpCaWbYuvurVHLn5JdxdmpMCiM66B+QCfjRuYJJqJ5zTXO05jconn+2CnfRdliKzizUAT+16e0JsEo+MnSISNIdPfF91z1JwgYUgQ1KB+m1Go9dHT2JOHT8bGNprBFRKf3Ry+XlsYPR+c8cGX1sqt2dsVDKMa0eomP/G1eAz+5crlKQV+gQek7VAIwZuvO73LrQrxgMXTl2OscKRHXdu3SWI2kBmFHOhG8lVe11FaP476AJm+zYbqRBeJaPejY5OI7dbBQ35T24SwbCXvCO8tLInp0PG689cMIamAUVnxv6aUXNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ofc1XQVLHenHrhb9JsjZWxefrnTXPq6wTPO/WIGPpI=;
 b=YG5q2I4JoCCWXU6KIJPhTAbAFf9/JkJZRLWB3ihp3qhgPoI4aT3wVn4a8JiSUjY2u+8zsiHddX6ANmmdOlrt9/EzFQMwnQzbW5V3vvJjXEnRxTR8hSw5WmpE5EYzeNZvXAVlVhxWylaXbzwWCjcgGowbR9pAtc3JoWcuhkQFVQudYk9mO7YAb/CvKPxuR5+9mzXbyDtO1Zs5MG8gpi7olyantqdSV462kb8rYu3wGHh0edgF4K1jYv4N0Db030MhRC+jkHMHW1xzFXXCsXJ/g813h2QTsiG9meFPmm/tprUAqdNlZ4lxHiBA5wt1kmFYfH85EfWR14yYTZGBjQ02IQ==
Received: from SI3PR02CA0008.apcprd02.prod.outlook.com (2603:1096:4:295::16)
 by SI2PR03MB6712.apcprd03.prod.outlook.com (2603:1096:4:1ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:00:53 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:4:295:cafe::67) by SI3PR02CA0008.outlook.office365.com
 (2603:1096:4:295::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 06:00:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 06:00:52 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Fri, 4 Sep
 2026 14:00:36 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Fri, 4 Sep
 2026 14:00:36 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 4 Sep 2026 14:00:36 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>
Subject: [PATCH v2 0/2] ASoC: codecs: nau8360: Add DSP fallback and PEQ band initialization
Date: Fri, 4 Sep 2026 14:00:33 +0800
Message-ID: <20260904060035.196399-1-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|SI2PR03MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e18c0ec-536e-40d1-43b4-08df0a49e0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|10067099003|56012099006|5023799004|11063799006|3023799007|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	sKNZmYxzh6HfmIFefPq6GLQsfNeshOLSqtudW18nOaRKJp9ErFfUQH9xCG8En0+h0PtiED01yTJHzNSQZsrTOaWs+4i5Ba42s0PF+1boDOUfVofzk5xdbGij8ObW7pYIw9/B9PyXS4KYFTDZzPSw1hLj20l7uBwMuMpLaQxjh1YaR/5PgEaBW2aaRf2HChBEUsW9XSK8+gvSt0GqyawNEOBClhHg7AHATwzEOqZGk8NBtPkC8WomJlaD2BpXJ4CdjyaJ2qvX07mMmVH4b5T8k+te5T2B8WJbsW/C99H5HqEjvtisqCLnIusuLICNDtHtNyWmdruXi/tpNnNnKeWXJaU8DOJefOdcxbCcxnn26R/T7fdm4RZQGRdjKE9Vi8NRlceSHB9YMSIFmuRo4dXbNq/ZTYzMYPV7Y6mrcgJyYWSmnYzFRVjQzrq0QRMYe4rk8+bqs/tdnoZJwLPSS+myuJyeKs+RBWHUaXElrLrDTRthbY0gPJ9zVodWQan1q09odgwkKQ4a45jv4lWbGl6zPBGiMJdPbTClCwa73qUYNdLdyE5eF5jHreoTBunTx3AlIY2Rae58o+AxAO+EGzQhM4K6gZHURwHz5hGSF9tob/LYuRY+meLU94RKZpPfTEP60pSCjPNY8JDhqc6bYx7j69Wfx2VoHY3CVlXCYYt7PY67X+QYfKugRm97zkKAocsK
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(3023799007)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q5qEgGGSre/CETmXMGosEzS3AR04DkwYZOi1tdHkWBBQ7Tpy6th2WAb4BrYgT+WzFl7q2oBW07yZwFRE42C32OZhsR6sJPE5BOTRaKv9ZhVYRUw99uIIw8HP91Vx+PK8UZA9EbtVXlWIqnCaQKy2+S0Jazfj9224okpQc7gqe8lV7LHYjzrhxiIXAj90pbIQGjq9il111TzLnn3g9Al1R0MUK5aj1ejoJPBKflmdAQ0oLo8w9QOjS9JHJwx/GsiWwFklsbbNFz56vosafCHHj2ApAA9RivSd4NpqkwXMIWr55IL2mokcrNeop4maSqLpEJMhTsxxTtHaudRebwCfoxWm347SMrM0YO4mcswV0O0A2RpMraFZ9OxDU61q9LZV5zf5pChPzPdDUAUJ6WyLnXhEPqWovfPDSV8NVShdwmrCL5w1BnkC0fx+1p9HD7IL
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:00:52.8393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e18c0ec-536e-40d1-43b4-08df0a49e0be
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6712

This patch series adds a fallback mechanism for the NAU8360 DSP during 
firmware load failure and ensures proper initialization for PEQ bands.

It includes the following changes:
- Fallback to bypass mode automatically when DSP firmware fails to load,
  ensuring basic audio playback remains functional.
- Set a default PEQ band number during DSP initialization to prevent
  invalid state or uninitialized parameters before user configuration
  is applied.

Changes in v2:
- Use snd_soc_component_update_bits() to prevent register overwriting.
(Reported by Sashiko AI)
- Fix missing bit shift for default PEQ band. (Reported by Sashiko AI)

Neo Chang (2):
  ASoC: codecs: nau8360: Set DAC path to bypass mode when DSP firmware
    load fails
  ASoC: codecs: nau8360: Add default PEQ band number for DSP init

 sound/soc/codecs/nau8360.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.25.1

