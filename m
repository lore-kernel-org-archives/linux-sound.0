Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607338;
	b=n3PspPofMGzkWEniSxz+rKdwd82V7gKBETCbHJ1g3p74AVEiqJE6s+sR/4HzmFw98yOR
	 ZEO9ONooNaYF4fj7y+AU5Ztcs3FHU6YIs0Oz6mjgR0GPgwF/WXevSqaOXpgOGQSzGt7BN
	 Aitl12Z8LIj4kVzNi6qXHwgjAiS9Q56/5rSTc4jhxVUSssBZ697shEU9XYc5PrERukGUE
	 6/HtH0l2nE7R8zdHb90FK9aMRaXeV3wxdqOlV2bewqdL3KpqGTMUZA0M10MGTflwQ0OF2
	 eyWZrHCnFdVhLWs7VduGAYrVzy71GMSVfw8wglmlgjXDuinhMKg2cTViTBBhhJsVuvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607338;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vFQGX/NP1dmEeUOMc9zNPpM5KF4wF2/df6yb9rrW5J4=;
	b=L3IXq6rsdZevhE2siKfwLB5X+zzg8alWxENGLtBA+J/IrXF9+b7CRw+3R8pCA+ckw5WE
	 zg8VJfQrw/bxgupbB8q99geJsW8b/0Ht7BhbDor2NdbwqE9wbeuhFEXcs9NhYcV/YRCUw
	 QfSibXmL5MK6Toa/2ENSfm8PI4BWHvtUWuYxDGus/JLextsBGLjQJw2Q17oX55sb0LALD
	 +S9OHhZabaD/a1SOR9/JFi5D12j+tj8kS9SPEegl7Osn4pawa9CxW694PHDoZU8JnV4lK
	 zcjjsxiWNdpqgN8xa0nXleZfJC6DkKRD9rsQLO1xsi1ZkS6jJwG6z2jhVoISgqIVyrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TVkEA9qe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.15
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012015.outbound.protection.outlook.com [40.93.195.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78B606A31E;
	Wed, 25 Nov 2026 11:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F78B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TVkEA9qe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdHgVNuoBLB4zp1awYvEirmoqaEWKPWJ0kmZ9w10UgVe3u++aOGlwKVrTLovnMhmHT0emDcZhWh1LH2ER1Vhd4p364c6JqUOiNEVWSOi9tOzgGhjQ8grkNqvhJ1nClTFIcC2KCWAGLEVnCGPJMWvS0wX0H2VzR3mIci7OoS+vYHjwPFOpj6zkbM5zWDwizH3U3hykwlZfIax4qVK0iCSUuU5Xn8vU7zyjd+7p9Ca7Exm50HloTG93uAa/ib53yqlV/CS6dqqvTtb6Lnx5z/0O+VvZujK7ohuKCPvA5BUWNsdUpCO91ah3eOhqsP93i00xcwSFyvZeCj3vHQ2LpkIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFQGX/NP1dmEeUOMc9zNPpM5KF4wF2/df6yb9rrW5J4=;
 b=KNPFDrwbKHsGukEIyWZR/iU1qLmfp+lD4ngpEIf/vuHlXeJ/jHp7x0kuRQc9sXgLkdP2R9E6OluWyWSliLZC4EcGCNGMEId+RkUOmIqo4Eok3+WR4JywJIUbH+gsVKjdoYPiDeChDbpT5guCQIaXCxDE9WZM1TFnGBPElRq/sFrPxwA7snHDFioJ0XTMuKd7JaKqWOifE3kEr26XCGU4qRnFc9QaK/+aOdzlvhP4hxld80zb5c6kpmneBHUqk0lm//Z0xquDCbjn3DtPHm8r78a5nDSlfQOCdktlMAEGqU6a0kjofRLHJH2NyUtu7bAY3PONVAkzgrgc6mqa7baYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFQGX/NP1dmEeUOMc9zNPpM5KF4wF2/df6yb9rrW5J4=;
 b=TVkEA9qe5EGWHl7I2vt5JxCV3+evORxOYSpvUherFLoBeaxtIb+A5N/6irFcuTJQhoqdXTcGdsO1Kxmpr78MzoXwjjzRcZD3eMCwUPkXxyTOWzt0qGJIW6HS+UYMbcE9bc4rCPtkN4NArlOiodaZUdBNAXMLQ+Gk9WvtX2bv0lw=
Received: from MN2PR14CA0004.namprd14.prod.outlook.com (2603:10b6:208:23e::9)
 by CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 11:48:53 +0000
Received: from BL2PEPF000352CC.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::17) by MN2PR14CA0004.outlook.office365.com
 (2603:10b6:208:23e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:48:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352CC.mail.protection.outlook.com (10.167.249.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 11:48:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 05:48:51 -0600
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 05:48:47 -0600
From: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michal Simek
	<michal.simek@amd.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<naveen.gaddipati@amd.com>, Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Subject: [PATCH 0/4] ASoC: xlnx: update audio formatter support
Date: Wed, 25 Nov 2026 17:18:35 +0530
Message-ID: <20261125114839.3642735-1-katta.dhanunjanrao@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CC:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: de880f31-8ad9-4981-1b25-08df4aea1402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|23010399003|1800799024|82310400026|10067099003|56012099006|11063799006|261021123027099003|261021121427099003|261026140227099003|261022105027099003|261009223027099003|261028144727099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ytemWjzziZr5ot/OQBJ4ZB1MBLAwZsGawVcoVPZhHbwzlP3EEdKmgN+nAnQdL2w7PqoVuK2TZqCctizrH4O28Lk/hcm68iRVrKXzX92jGb+kqtAH2k0ufVsxNeTVX8YLWJV515Ec8hryB6Npaa+EECrBSKSD5w4i+4XqSipnfPHs0xo9xWnaUFV6QT7lWEtSUG2xwtLqebYpQoncQYvX42PHAsV5ZSUkJ54Q3hUVtSe+ba6nHtywOfuVQLhxqzNA2X9o8Yw8oPDziZfBukfH+FNDttOezd6A3+79uENVYV3YAJozCyOkcvVXSV4ehSqIeKtlZa/f2dFHEWuHANinxmTSq2JcL958aAbOR/OOsAy1ncLVCzZe0nwUp33vcx19G7ae6+XgjaCoa7tFXsuxB2tX9ecOMUwh0SDxh+BMpzeJMEKOK1w/4Q+FFfMpbDIZmnIrmlo+8TGgeGnAgr00+dhRRLEdT1VTW9U/3f7PK5Wyj1/SZJ9Z9YM2x0PSb+90dMcbR/zTL/lTJ7gj2dsiBIkWIsGvwnrBIiq6AHGZ4mKLlnxmCdx2NC2jMCdDIBQDYWiZIFkN98cL6ZgdYEKt+Iw8tV2lpDi61CJaO4c8Bmpn5Ya2x9im5rWlVE3A3BD6T1XQaDiRIrdEjyEwHuSjqp5oT8ScoHaCZ6wQu+HzLoeRDCohgBGwus4PpVkNEXNT
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261009223027099003)(261028144727099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	86L3jEkktkTc+rirhGRBIp+CJNQzJVz74MV9dJTJY5V0fpOTDrx82C9cQe9iWwWvQ2fDNz8rEnUBRMbILqDfgurVi4qmZgrwmhkv4pazcLLsfsyvgMOOERbE2CyjnDZ8A/EdcxHYYmixcfd7vn/IKaHQsVSAaDKzF+ambmbCRPD++wkZ/wGsve/+at6NXCFiissqiR58FhNqfDCMB6MuGV27PQrnxbNBKrgHSncS0m1Lu+R62qBhCsB7Gsu5fzBP9H/E4CnBzap91zmn0OfAuUelQZlpoxguXSEJOASCHGrqg/TSL60B7gsRCG6jrTCAIj7oet/phG0beK6MWzWRkriD6yCn1TMGJpL5NVkmrgTkurDWqMeuxFkI2IWgo93K1UjQplo2/1892W+NW75TbzA6IsL80iQkepzJvpfH+uQCfx+ZDv2K9Ka1GGMrngJA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:48:52.7959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de880f31-8ad9-4981-1b25-08df4aea1402
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740

This series updates the Xilinx audio formatter driver and bindings.

It adds the AXI4-Stream clocks, enables the required clocks in the
driver, sets a 64-bit DMA mask, and adds support for up to eight
channels.

The series contains:
- Add AXI4-Stream clocks to the audio formatter DT binding.
- Get the stream and audio clocks in the formatter driver.
- Set a 64-bit DMA mask.
- Advertise support for up to eight audio channels.

Dhanunjanrao Katta (4):
  ASoC: dt-bindings: xlnx,audio-formatter: add the AXI4-Stream clocks
  ASoC: xlnx: formatter: get the stream and audio clocks
  ASoC: xlnx: formatter: set a 64-bit DMA mask
  ASoC: xlnx: formatter: advertise up to eight channels

 .../bindings/sound/xlnx,audio-formatter.yaml  | 22 ++++++++++-----
 sound/soc/xilinx/xlnx_formatter_pcm.c         | 27 +++++++++++++++++--
 2 files changed, 40 insertions(+), 9 deletions(-)

-- 
2.34.1

