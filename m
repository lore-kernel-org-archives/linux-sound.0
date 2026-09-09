Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013063.outbound.protection.outlook.com [52.101.127.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE1C2EC54A;
	Wed,  9 Sep 2026 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922801; cv=fail; b=dJfGvtm40CQtyyDsIcLacxhLyeP1+1LBMCv4U6pnvuJ1Dr2PHtbHor1rBUoiuNi7wigPnNWwYOJGNCk34p8gCusJZe6HSBuFA51PKu0Ge06ADVJmJCetyFlAvAtN9SAHYVpoSjXndSBR7dwltJIHJVR5YtR8Et0BByap+eqSTY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922801; c=relaxed/simple;
	bh=8DTzWhYQ1AR8KJ1v25tXascS99frM2SYtOC5CSm/Pt4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mzgzI4FS7vRYd7RNBQrepmQDd8LpXl3O8lEY/JLpsfrTYV75eU4DuY6gZshWL2mjq91NvPT8MS6EtOTbs83VgCQcpvgR2ETYP5lpIbSvRO7dHHkMcteSH40ANh699VKNb1Njh2/aC5kpJ38nj9vgL57ddOF99gQDPA/C5SAFlo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=vsRVwHaJ; arc=fail smtp.client-ip=52.101.127.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="vsRVwHaJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocvWDTpzzExkQbL6+0570JSc9FQFboV+Y4YBqKYuPa4V6mm0mcwwrmVFNLmiXeqj/v3DsolGiIHkAr3YZhN95jL0m2s1FFuON87RMnuKkCI/bOpMMpcOGJeWgCwmrtxTckd/dFaj9DAqanHYWvRTGfaAzeHKI391dDRNLYhn21Rjx+bujNnqpqLy5nC2RIY0jCdH182X2m0eb/QwlZi0DnJeZeUfHxy+XskS0K5IQF8zgHhxi9K9KeAAS2BpMUtPc2ZKztQpC5o/+RMiDjY5cJ1vOUipuOdH/Exz6N1dcu+lCsaauq6rEP9BzoTOT/qJ+P2LDFgqpqZC3KO1H+ZxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Lcawp/5hu66rfCKMFSqmYlmqYrP3keM12BFm7H/eOU=;
 b=CAbOFs0/IY4zqlP4ZJmb3ckSdkYl2qg68uLBf2so+UKMvKbbZxQ1yrEWE2Lp1uUsHUakTI+aRAjEbndfDo/jATp45oya1gAVbWBEzpCG38xNCtd0GTWTTGW3S3oQ4HTYKGeZ1mJKUC5tTzkZUF9+Rb+HpNkUGiWdXTcm12v4cONsBleTg4pQGYHfzdjInS9oy2zXA0R35tUATBsSmogJRDBVUbqeVSB1kKTB/sb+wgXAO9ae0iw5hZBRyLvGIfYCe0MtUw3YhT5yiHpK/+0WNqgihiQjXnjGobEali2PGb2k3AKf2rTDE7Y/e2hC2sMRd76sXw6XNcKDscyX/C8qjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Lcawp/5hu66rfCKMFSqmYlmqYrP3keM12BFm7H/eOU=;
 b=vsRVwHaJuP6VV6yXfRT0K4GgHJHTnevb4zkmk1N8f2BwDT1TKaraGsG87pzJ0/7wpphGoyclOkxDR07aNPtugtsgl2kowszLhSqmcgyDen899jBWiSeLuJRGjK1dQb3F5c1giho9OL9WK7LDqlVs8aDeQRy9aYq6AliptM+oue6L3A2WtJ5gs9Ti8Ezx+s4jAxoSw1YwuHMy08frVKzijzBBnMpCfSxpIXrf9jSN5KVKxKhgoYqQPrGekkRXt2E8PLSvdofANCGwF78qndEakhbNiLZtOcXkzD4sZc3mAouk8c9vxjQCNEQiwrTDvy4lkgLtPk82201FK6HwunXYFg==
Received: from JH0PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:990:7::14) by SEZPR03MB6443.apcprd03.prod.outlook.com
 (2603:1096:101:4a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 02:59:52 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:990:7:cafe::71) by JH0PR01CA0156.outlook.office365.com
 (2603:1096:990:7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 02:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 02:59:52 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Wed, 9 Sep
 2026 10:59:50 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Wed, 9 Sep
 2026 10:59:50 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Wed, 9 Sep 2026 10:59:50 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>, Sashiko AI <sashiko-bot@kernel.org>
Subject: [PATCH v4 2/2] ASoC: codecs: nau8360: Fix AB-BA deadlock in mux update
Date: Wed, 9 Sep 2026 10:59:47 +0800
Message-ID: <20260909025947.287120-3-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260909025947.287120-1-YLCHANG2@nuvoton.com>
References: <20260909025947.287120-1-YLCHANG2@nuvoton.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|SEZPR03MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: f84750a8-4cb5-4151-5fda-08df0e1e6b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|376014|1800799024|23010399003|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/jJJMwP4FuTPbi/KR7ywrkrXdbkOb15O44Mj8ccUmWNCsux/rcve4fdkHqGTfENFzWy3/e8cSiJZf6cbYeB2NrG2iwc2cprvaWMHs2BiHVI3/Y0yh78hXjBZb9FhZwKYb8vFZwv5n2xJlv06rhwjWfzMk93LTQ3J8nu2wo9Ttzekcumw5qHTqQYNJBluLWYwMeBTZyJKDvzaW5u3BRgpVbkUpgAYiBgIWApSmXsWWgQUrEJRV89kmFMMkDj3/E10cViltHyYBd6hx4KZWSwvpzCYsGcV19k/cu7DeXU43DvY7qoEUn8hpNTbcCnpOz2dtMj5nCXnSmrlGhsE8nOLVNgqX09Sux8c4RRcwwPdLGK222IOqC4vN/00cVAO3clVk5kJlhoZwGIvjF9RSPPGNFJdN1I/ZrFrB+aOameBt3KEASP8k0KDwoBzEcHMVw3RN5m0CuxzchrV0BiDI94SPZpioX/dSSYGBM7RJgupL+d6jC980QxP0m6y9/XsczhOovytdKjpaomCg4qRRV1jafcTnit+HsYnHGy6u0iSabSgnJsV1XFok2YSaBOGbTOH/twlSbhEg0kY9S/k/+L3he1ZGmcsObOpolJZT1ctAjRmWWOHWXxKs8kYyMXR0tQoUiOJ7cD9cKCxYuNAqAmVoQ==
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DRYROJHv72Z3qPFKOoEjyJJtVQwdfCDqx/8RkC30j0wzT6SIUGb3F8xRo/8knFuNtF4MZT6VgiCQTiViZEK673EkBLLtK/gPtlXbj56YNuDT/hgQCaM6UNbtoVA7JKhWtzIiG45OSn9EMVr7n2i6EYo2+JOZkiNaLN3FLTCcl44m+VgHFz6NdY0nG8xTasmQH/Ze+SFPitSbxRal2mWzgfLEYeuLctGKqlKxeo/lhubTk10S2crEDWospKirsDdXUtaEJ+cL/nbrSICao7Uz4aldMh58j711r9dx+iIdH+VYEO088QLBmh60KRMmr4U+d+nwifrTWsymkA8uznfdi9G1TY/zRSV6iRzKkBVN+VAEhORqto6KNW1hgpo+6dxBRsENx2ItVxwA/GuSH2+XuN07+B51HlJXr83z2wUTnOvqXxfHP9OvqZpLTOAZYtol
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 02:59:52.1227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f84750a8-4cb5-4151-5fda-08df0e1e6b53
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6443

nau8360_dac_mux_put_enum() acquires nau8360->lock before the DAPM mutex,
causing an AB-BA lock inversion. This deadlocks with concurrent stream
startups or mixer updates, which acquire locks in the reverse order.

Fix this by replacing nau8360->lock with the DAPM mutex to protect
pre-checks, releasing it before calling snd_soc_dapm_put_enum_double().

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260908030342.222655-1-YLCHANG2@nuvoton.com?part=1
Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
 sound/soc/codecs/nau8360.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
index 277aa982c341..7f83c737e8af 100644
--- a/sound/soc/codecs/nau8360.c
+++ b/sound/soc/codecs/nau8360.c
@@ -689,6 +689,8 @@ static void nau8360_dsp_switch(struct snd_soc_component *component, bool enable)
 	struct regmap *regmap = nau8360->regmap;
 	int value = NAU8360_PEQ_BAND_8;
 
+	mutex_lock(&nau8360->lock);
+
 	/* If DSP is enabled, unstall HW3 engine and DSP, loading DSP firmware,
 	 * and configure PEQ after dsp reset.
 	 */
@@ -702,6 +704,7 @@ static void nau8360_dsp_switch(struct snd_soc_component *component, bool enable)
 	regmap_update_bits(regmap, NAU8360_R9D_PEQ_CTL, NAU8360_PEQ_BAND_MASK,
 		value << NAU8360_PEQ_BAND_SFT);
 
+	mutex_unlock(&nau8360->lock);
 }
 
 static int nau8360_dac_mux_put_enum(struct snd_kcontrol *kcontrol,
@@ -714,27 +717,26 @@ static int nau8360_dac_mux_put_enum(struct snd_kcontrol *kcontrol,
 	unsigned int *item = ucontrol->value.enumerated.item;
 	int ret = 0;
 
+	snd_soc_dapm_mutex_lock(dapm);
 	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
 		dev_warn_ratelimited(nau8360->dev, "changing path is not allowed during playback");
+		snd_soc_dapm_mutex_unlock(dapm);
 		return ret;
 	}
 
 	if (item[0] == NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {
 		dev_warn_ratelimited(nau8360->dev, "Cannot enable DSP: Firmware not ready or disabled\n");
+		snd_soc_dapm_mutex_unlock(dapm);
 		return -EBUSY;
 	}
-
-	mutex_lock(&nau8360->lock);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
 	if (ret <= 0)
-		goto unlock;
+		return ret;
 
 	nau8360_dsp_switch(component, snd_soc_enum_item_to_val(e, item[0]));
 
-unlock:
-	mutex_unlock(&nau8360->lock);
-
 	return ret;
 }
 
-- 
2.25.1

