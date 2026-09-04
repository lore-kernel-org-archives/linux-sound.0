Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012008.outbound.protection.outlook.com [52.101.126.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEDF3A8734;
	Fri,  4 Sep 2026 02:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489909; cv=fail; b=VxBU/tKpSoDrgTnvYrovemLXK0S9uUrP0LLpaDwjhmYaSZWvDC+GkEOCMn1YXs+ocMbf0GqG3+XjU3/D3DtHveCwJ/Gz3BziGlVmyf9oDMDGZbazuCUDeGIitlC8LrPNb4spbhVcK8pZN010P+Zu2lfVyJZx4T+oukMDZn0/vPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489909; c=relaxed/simple;
	bh=sRZ/CxG7F5unuvv5j0HIBZUgTNg+05NfH2FYCZNFyYc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hWnhHxG0NOqG4IPL8C7QPpKBJUh9wIzPRRYMf/OleokJTXy+7mtGWAEQFJUfung8EWk6u5vQxP9dLnh31x6+WBmp1I7TtaJkmGASQnbp2qtbpj7IXGsAwQDXEXBxe+todgFTKaxaJ3Ktjivsm3V+7tG84NwRj7YFbKRekXjF3yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=gEQeoaNb; arc=fail smtp.client-ip=52.101.126.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="gEQeoaNb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jU3oVLPK19iByAqGGOYrfa5ZHlHBSQHgEPfP0POlkz2fTQMF45GjAfl7tdi0b45QHpO2iBOr6vPJ+E2gmebl55ob9FMd5UzRK9C8bBu4m+7dJvvqon5pAh5qgvor+xI8e7FuXMY/8GGCpv/T5UvrgzEcpKwCEkSMNFXnNWhfWaeBqSjbds+KK55mj9nKb7jyBqRE4VkpnpmZ4+3ByELxBpYQS7vrtOsUhU+/xZ1y/phLGbVGCrdKVjgF4Vq7IXXPw7xzAOrdgAdhsL/JD3wM5oTGAILdFeWSCguL6Oh9uUy8KkxUR/DNLgTHo36sfoUKrj8KJklAnOuhBOLKxitvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u645JAEptkktINqUTloinGIpfCrfT5WkXzEsBBJ/+r4=;
 b=JtwY68aaHPVH33GsR1WJrLckMFVAy4TDBkwBV97n00D8VI5rGvjC6WeblVaWgveqiS2Q13eIjDZtAWkyWOu9xhr2CXvZS3D3CJZRwV+RkFvHD3wXcju/tdURSg4zRgMXpNG88CmYgbE/iZe2ad+LxnGNL6LMMZWlWxnGEasJwvYAqCUWfWoa7eF2Y8A7QtEkZ+kwhIGaS9K/idm/8FSa9nmfgwuyfB4jfOPc9sKPMZ4lwU0jJOABP3CJynYAyOL1saxpcHJ/RjlIbS+ZgMZ7b1RyQ4GEcKhfkg3FKa91q9JjJV9FUrwkhyRP19PO0N8oW1260wv17AVTrgLJk05/Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u645JAEptkktINqUTloinGIpfCrfT5WkXzEsBBJ/+r4=;
 b=gEQeoaNbWfxTs730aoNOhYpJfIVVmaFpLnqEUBX+1boT9kq9c/Tbp8s/cP2DBdwS5FtvU0fLrP4MbnhSD8bx2nlsq9z9Ajfv5CCEeEUUD9QdbgT/9D4SjVtTM0D932/9Zv/HRLOyWUUeqaVyMjK+mT1DusDwJCaSQymfaVC5nwJ12fCh+XrpesVzYHRC7fpXlHWglGGbSx7OwjY8N0v0NKqpDtFQV8FJ2eVpwjrNg9l+omEi2wl+97+qBLPncGnRGu49GnUHpEw8+GGAj9yFJoG2K7jQwiyAiTmpESUELAQPWqnLv1EVZJSaetv3oEKKAg7YAj30PRME+zDPahYNmg==
Received: from JH0PR01CA0139.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5b::11) by KL1PR03MB7798.apcprd03.prod.outlook.com
 (2603:1096:820:f7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 02:44:59 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:990:5b:cafe::a4) by JH0PR01CA0139.outlook.office365.com
 (2603:1096:990:5b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 02:44:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 02:44:59 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Fri, 4 Sep
 2026 10:44:57 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 4 Sep 2026 10:44:57 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>
Subject: [PATCH 0/2] ASoC: codecs: nau8360: Add DSP fallback and PEQ band initialization
Date: Fri, 4 Sep 2026 10:44:54 +0800
Message-ID: <20260904024456.193528-1-YLCHANG2@nuvoton.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|KL1PR03MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 0837d16e-95d2-4ff0-2138-08df0a2e834f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|10067099003|56012099006|11063799006|5023799004|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	4Bq2tgjsN8dhK3y8mI2s69gQYGwEW1KsSMcgcPRjvyxRNircI1zzC0PZxg1s6c5Z4AFeo63jg3huguLe2XFE6ugPgEhZkOvcVf5HjBZKcDFqF2LDuAxXmUKxRrrox+ZsYv8nPn8c+FNN6YhjvhvnGB99XznjhhRwiPTJtlsJ3QkBVfMsn8k0x2VRvaP5Q0R7lkOVPSTEinKfrbDTs9bieyeqGgVfqj3WV3qm1qWFyM7JlNQZ5TGI7B9C1KZC75smPkBuXQsS58TL1xiDTL4lFWzvu2YQ6yUa45r8HNVxJQI6CBRmvpoaRVCAxruEisCkuhMsuQjhT6yoCdYXASFPmC/q93s4yoS3CnyhjX2bUoDI5Z5kw0xci2JxemSmxzSB8VsuZKQ8Pi/81TqTZgHeWmfbxElMXUHoegxhKou0d7Z8/Iqs4/3zIq/u8VDef4AKkVbmVmJQNGmQQEuGmPpfKZXXjcp798I2nsc9zjzl5OpflkkaaNvDSK2H9ziy17d4zNpXzFr23tFip9LEM+c2N7c6SuAdjGMnq9UQ1TEFBp6aTlt//7+H2Z+ZJm4T0ouvU12PYXxDh4KYSKITKJUeyZw4m7DDTZgU+0cRxAIHUmaFK2xXZNkkP9Y+J49rCwfyfeEluSpZjL2kFoBVrykpCrR1SC1f1/47ZdwHkh7htY/G50VZLOvxRZFI6iB2It3I
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(5023799004)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	59oyeREmj8zNYkyCH4eR3cpg8bbZpZOLdfhwQef5DQLeGWg90sIZX86yOJSulEveF5tlRN7oPFNkyWeLRCkBzrHkQAoZun8SvSWbqUDvzoN2AC+/aXAgytsWQO3LOj9pEcxzPVMsFEbWMzwzKMGlSzxcbqQ1nUDEmKXDGo0qC9wZKC6zWNu7/AcRyP1PcspGCnnYnmA4rSXamfxtq5nuyWsKMdYJ1d/Idl4wg84LDNDcr6QWyrQAuiS7Sf/3OGL2UxWO3Y64JfpyNSi+X9zMs6GW2IAIKVhgDxKZkeqrPkxV//FzLI6OFuq1a0GX1OSu1DzXeq+sbyV+gRmtGHFTCpemLQbam94b7Hf5tBDguIQLWFNbeSHj8Y86unBz1+3Xjbx4yWFs8WIJy3SvmZjktGErodJz8jHUp7RhnbijJlh8fngOOnd8GhbGCLS7TkKp
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 02:44:59.6389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0837d16e-95d2-4ff0-2138-08df0a2e834f
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7798

This patch series adds a fallback mechanism for the NAU8360 DSP during 
firmware load failure and ensures proper initialization for PEQ bands.

It includes the following changes:
- Fallback to bypass mode automatically when DSP firmware fails to load,
  ensuring basic audio playback remains functional.
- Set a default PEQ band number during DSP initialization to prevent
  invalid state or uninitialized parameters before user configuration
  is applied.

Neo Chang (2):
  ASoC: codecs: nau8360: Set DAC path to bypass mode when DSP firmware
    load fails
  ASoC: codecs: nau8360: Add default PEQ band number for DSP init

 sound/soc/codecs/nau8360.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1

