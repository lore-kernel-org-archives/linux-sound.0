Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012049.outbound.protection.outlook.com [52.101.126.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFA73A9DB2;
	Fri,  4 Sep 2026 02:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489910; cv=fail; b=bwPefmvXM4jdj76UcXF4TIIhnMRNR10BaSo7RfnGlGPJ+vV+IZDNoya7+0yiHJKC9m6IhpzAKx4yl8R6hZvSQviMcPhNDxro01JcfEnqjX1VuO+8EDUlyFjN/3rRFeykI3teT4G9TcqnBKGBE3Rc6f+1ditTcChKiOvZkuCH7to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489910; c=relaxed/simple;
	bh=MyvBh1oD0Br8rukTlZHllGS28v2iTBrN9rFdmtIc+yk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A8YVwjtXyOQn8FVO4R7G7nBpJddZPwWxod32rZuPwOY3IRn3yLW6o/UkICOEoLITvhWfAR/MPIKe+qgApWEVwVXPg5mf15nNP2MSfNnYfT8ozf5efmAhB0//KxJrI80hzqo242k2ImRFS1PJqW/yWumbBzEU2QPYCDUbONF0r5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=GEQidIeP; arc=fail smtp.client-ip=52.101.126.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="GEQidIeP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3BgXPe31ODyUFsElk3vAyI50npePXWIQAgCAS9JQy0oGOvzfgl8RnKVjrpjiFFj/skV2R2brJ9ay0hZ9M+7li9lFyl4c4vYSqqo07lSCo4MsCEssSG1K+BN3PTkaiNHuK0TkpoLU5Oclptdi8bvwmkueoYWeCY2keYmGdeALM853zpeTNpwNmUEyXhPmo13qqitvuqqvEMd/ZR0InvGAfym36Syv1jmaCYeOhVA/jJlmXAMo7DldJCcyVKestZk8dwTsxN4wzyJoOz8og5VASmKylNh46ZcG0pQSqkzsU669jBtCvcjxi1rylPucibjUHZtaXI63DG2wiLpcJ8EVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rFK36kMw2U4sWlG+vfhHAzJ2dK6rFCSBIllSD8D0/I=;
 b=g1KgrGx5H4wazp62f7T4ZJ0OkYxPLrnkxdPHrI435YQBNDOhJMS91y0tQ9JNsDLx3i1PHNQDJBOYR7UKel07WpvgjcIblcklRt5k/O4ger4HRCA/UBjU+Dxht8ujDs49Z+n2Bx1hwiTxEkAElTgY6zBPsewNdfJwa4jTeI4rDhLROc1icdFx/Zsvnz9R07TFePS90yGc+NlzpzD2AjI7OV6EueZhPTfEd5Vo3aqsCdLWiBhIRl1qsR8X+xO6aTB8t1P985skniis9gjmErBGtPMTiGBxxSi3o/FXroCoQP/6Va06RqtPSob9mA7ouS2yJuilo02Cp6XbVbvphtOuPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rFK36kMw2U4sWlG+vfhHAzJ2dK6rFCSBIllSD8D0/I=;
 b=GEQidIeP8QGccoLVh9CInq9hN/nLXIT0sWelkmSzphWBls6Pt7JWEyaha3LDVyUhvviFb+ADfyr3aBowZ+ch6DLrQqOOW5lp7SBVhe0R0AOvBXK0Bnce/AmbM/JHjlGCWRbhm99sub/TFeH/h16QTtaK64ygjdnHWx9G+nEJuGekt4T+xwanssgfx0voBncYozm1LGZ5W3gVEzjFlm4MEDIKRZ1TJ96NUy/CBT4flDe4W3fdKWPBdCLYwzldlmkvT2JDME8+/a7hhB3jpo4I/mUH8SFYWLY27BeOzlOT8Zpes8pzXp76NjwTUNCA/DTpm78w+ajXxN83fZvuDh3Mug==
Received: from JH0PR01CA0146.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5b::14) by TYUPR03MB7162.apcprd03.prod.outlook.com
 (2603:1096:400:346::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 02:45:01 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:990:5b:cafe::4a) by JH0PR01CA0146.outlook.office365.com
 (2603:1096:990:5b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 02:45:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 02:45:00 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Fri, 4 Sep
 2026 10:44:58 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH 1/2] ASoC: codecs: nau8360: Set DAC path to bypass mode when DSP firmware load fails
Date: Fri, 4 Sep 2026 10:44:55 +0800
Message-ID: <20260904024456.193528-2-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260904024456.193528-1-YLCHANG2@nuvoton.com>
References: <20260904024456.193528-1-YLCHANG2@nuvoton.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|TYUPR03MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e1ccce-0b1e-4bf9-54c2-08df0a2e83fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|10067099003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qI735DaghGLrlFckB4MeKIDxrs1QmEZ8RUjplGMZ1nvHGx8CG2QJRLTSyVsvdw++80ZTZ6HVMEYeUFgKAuANbrwVffNgBscFFAYwojy8AJ1QAiaGx2UAM4KYx2Y9Ai5vNH4MdfRmv+sdWsNFybvpy+EMFlQqHUIaRP1XivxvyTaNHjTZjJaQRmumf3vt6n+yOy6yuue4fY3y1rkxFJjo4OkN0pN3KtrJhuMx7Km26aMJXrHszPJPjhg/jokk0aXyK9VN9DfBTUJsbgM09gMQzHrbR7ct+V0Wh52GyuhCgoaHf7ozCR8KFz47juYn1shPGZd+Tr9fAIbZ5tKXvQaXmf3n/1hXhbdrVkDnhBLPwqvgrJDUtD6Gl92eAp7CX2Fgj4Pwy3/hutFGccWy4FtqTdzfEe27OtEfAPGwZwYPhyHA8CG4rpXwmRYrbF4d0fT0zX8L0+7YP7FWF2JbLuOJ9pCRzEee+64nCIoD+7H3QVJAsTwR55gD8uVTtqWDuiCPg3ugepHinzIxPDjvJWB2dYs4vbs+DvesNMwztNyo1Uxi32n6J7Flfx1/NnF/qrpW7J1tmbDp1OEAs59DmRjPEAXkgwgS3CYBm9u0ztUeKqXSBYl3f5Ca9YvGGECoqBV6G7iGOrJyW33Zwsu8WhcaVemCHPrVn6vCcqOK5I/Vs5hJM9Bp5T01BS2Hks7Apl14UCUCObEsrKplAZwg3dBtmw==
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ewDMe6wFNEg5fPJfy2TkVmVfI3j0gs5cMJxhfyps1uq/H5HdSFzmV0HfrxOgUxiqoFbyI+I6e+PZKFO91BIEqifXMS/2Ia5rEyvyKSRhtQxvhVXmrAa2zh/eZ30giapeXJUQ2tR+auLznN5zZEzcHa77U7r4Ah/5JTJKkvFqfAJrisSmIDdILv+O86xtjku2LEdboQv0Xc0d7yI8Kh0wdFtbkaHupjMeQ2Umfs8Eb9Mrfg29eAXj9JRBls/Pxt0FnFazWfHvBT8dXnhjJN2K3q6XX4PUDjp3SfND5cgrEoQnrb+Dm7R/t6iaV1OhlyfY5x9igA4HHtX5yxuuTa8Q/rBCINRMBj+xR7kL9+aQdLwcLNJOfgBo4d1MogxcZdUD6JKNF5BHHh/RgbMGU1KUpYTIpiMXqErVuDz2lhCwFkjeO+WldeZF58dKb39m8P31
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 02:45:00.7610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e1ccce-0b1e-4bf9-54c2-08df0a2e83fe
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7162

Automatically route the DAC path to bypass mode if DSP firmware fails
to load, ensuring basic audio playback remains functional.

Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
 sound/soc/codecs/nau8360.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
index d7af2dffb749..b3cf207eea86 100644
--- a/sound/soc/codecs/nau8360.c
+++ b/sound/soc/codecs/nau8360.c
@@ -1702,6 +1702,7 @@ static void nau8360_load_fw_work(struct work_struct *work)
 	if (ret) {
 		dev_err(nau8360->dev, "Failed to initialize DSP: %d\n", ret);
 		nau8360_dsp_enable(nau8360->regmap, false);
+		snd_soc_component_write(cp, NAU8360_R12_PATH_CTRL, NAU8360_DAC_SEL_BYP);
 		return;
 	}
 	nau8360->load_fw_done = true;
-- 
2.25.1

