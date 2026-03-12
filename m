Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CBA322DAF
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 00:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773274523; cv=fail; b=cC9aM1CJPIRuwDRvgTh04DB25b/6iEa/0FE56hKg9F61D4zU4og6MygHIk5yulX0tYcMf0ER+Tv3QvSuJ3D19w35r+RMHGLTULT7bn2RbGnbDsB1MaZxd0Q9X7CACnEijOVRQaMTTgg9sqJg2XpN6lpO5GeESKGGr0orgAuMh+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773274523; c=relaxed/simple;
	bh=ldH4vNpC7B3t+K6X9KKoYWzmcKnPOv9w9h845Pg7yaE=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=h/ByaW0dJVeb+wbahPs0fmZ6S7utkCu+4IqmpA90dhMVo5iM60KJRbNJHhUDa7Indw0ZwZBDp+SqT9W0MRqAHENbSOavdIQdD18nlyIw/sCSkcTCR/qOKSYwAHePH5g0qKh7uyO0THO3oLK062ncvrqjNDIjs/pp6/mwb/h196k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P0LjXqvL; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P0LjXqvL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j835uI7b3evdFluLroFYqDTarl2u4CaOHfCohTT4liWCMDOllThuJELx4Pf8E6pu0VbCFAeQlkt0eOCF/mB3aIVHaFAcANHgNKbYmLdwh8Pgx7kq1n7CUyKKicxYDaxXiWXyjC5hF8Xlb//lHsX/pWYpMke/Wn57pzdf6yPssZN29DxSjHj+iekrys/RjZL/yaCXgeywScGhwkO3BbphZiO865WSwks9qCe2d0viyrY9YyXSlj22/fgYkb1w+ouYar3WYCgW0sq3T9sV1jtnAbH35Kn6wztEgeJMKwOjdKEkeblKYehtz70gKc01GlRAhhkijn8cjPMo8YkVoTXgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyhuu/JiYL7voXwUa3ABGX2ohP/j+54fuftiOCE2JhI=;
 b=p83Yds2ecYoSjfIPsxP6XAYMi9NoytkpyOHkrhDSHsQapy15weqTuoDlJ97wptPVGESpjdlcPlWRo+oXt7NgM6rcxcn7doihby5+EvXs9Nfbq9lr6bPbzhB4QUFJd6/ZX3Ks5aPmE/1riNxwyDiGkXpc23IdHXbmcR73JHhmpDkZDszHd64TAAousZ6m6c00jhRWlJh4Fn9T4j42QAR/OJIlAx3dulmFnIYPoUagT2rxfJPpRGcVyrypT/2aoAL31GyUh5Q9fD0QghLtIMKFKVEI6RfBuEvJ8rRkQPsxlUup/e9tsxDfKbI3MNXUvcpL71nytMgNRyDQV8RNf7ciFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyhuu/JiYL7voXwUa3ABGX2ohP/j+54fuftiOCE2JhI=;
 b=P0LjXqvLWOSvXQePdW8SpDZSa+ax/wvR5dRWr3GvTQsq0qKBIwm26kB4BskdMYPz7LTK5xnvwdIYzntC1yPFC0c+1e7L0QdmOUzEEMtYZxf6/XRIU9RNyyN9OPUwCDamdCnGonVNTySSmFflOwgPLOqe0O7fqV++V27a2IfNgHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYWPR01MB8282.jpnprd01.prod.outlook.com (2603:1096:400:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 00:15:14 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 00:15:14 +0000
Message-ID: <877brhzywd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sheetal
	<sheetal@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-sound@vger.kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sheetal
	<sheetal@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 2/4] ASoC: tegra: use snd_soc_component_regmap_val_bytes()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87a4wdzyxf.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4wdzyxf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Mar 2026 00:15:13 +0000
X-ClientProxiedBy: TYCP286CA0318.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::6) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYWPR01MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0c1d72-880d-4cc8-86b0-08de7fcc6ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hLcEkj96/1Q2WFv4catmvrVonxP8UhAr01nh8NGt228k81Bap9LmFx0wlQmWZmN47YOYTFBI1k8LS6UxzLs1mdkAAYUN6P/fOVMBWklmxncUI0+Pum2fKo72GSjYe/7FD38FtLF+V2OufE2d9acV/W76r0H9TFI4+79yheZvkQS5ctIXDpjMmDznfc5SuByQg71OD9cOI9m/Mb0efgExzWYa2tRD+IZ2slP11kpYzQc0v/qCTU8Tsr5TJoQ/bMlsBNFLABr7ufhL3zykpnmhuaIeroAp249lHmN76XyPOeLEpqVKrf2FAht0IrpsEKZaRT2zYlJbZw/WcTKP9hNmhl1zl8ymkFA+u4eG8FIT5rX1bV6e1M8YNYIp7NtHRxiEJ3SiS1jt2/jUEse3RiQZnSgbzaOAYiLoJa04cgRFLoLE8UMajJRLOK3+txpGsny/MLD8YeAfA500RF4Io1V601l4l7Tf7M68QqF1ykpsae4H2QD9ioaxEViPLotmANhXv+ykJhZelGCcBr5JHw3dxw9lUNcOWzrvoL7hCGZkCn6aML/aeXVo1m/ybMFOaWWxjKYnQd2nT2FPNIVrOOjsnAdqaWhv/anS1DQy2CwSNFhLoPGcuyyMfjQ+Zhe+k+qclD6DF/oe6Jnk6T2h6Pa3mubtv3QHa7X7W2tDD1SXDwwH5Ta+yhS/fDm5EG8QuOvCdpdOE98oWjRsXnNVU8LQWOXtuWsgqXvTOWXoJ3qjhyU0eruJRo8uB7QjvobFmNa2IT5yEajNnSIlZW2Jjo47UFVbyDp4fd4np7LKoCtEuv+VmD+u+A/YX4h0X5Kdj/GS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HNE0mlqW1Fn4bTeDE6zC7JtjTw09OJUh30weEH8e+4sMgu243ORXHNo34BZi?=
 =?us-ascii?Q?WKncm1AKisChdzXPLIAr3s3ycUMMd1YycDxFU7XbHXZWhhjQgLqEo96lb3nQ?=
 =?us-ascii?Q?GABccOFX7ocT2wMY4j5D6dgiY5fd5l5lPg8er2dKPDdhffjSauQY62gW58Lt?=
 =?us-ascii?Q?L+mQ7SZqW5tYVnYNBiSpzDR57J7MaBspdzBEsq2WAZJTHg1l/F0fgBQcxu6J?=
 =?us-ascii?Q?WVZN+aUcnWX0hFa6kz/bmfZbzq3uPzxrKqT1iVCD8MMjUMm3kmWau/IShg89?=
 =?us-ascii?Q?JaaV3gOzu457iZr7Uqe+zlmT/bGBgp2Hej8Hlr1jKmrAGszNR/W8WQxTHzkc?=
 =?us-ascii?Q?LbTiiS4ZpEXRwC+Uo0WrzAkhJusllcsLXFF5o6GsbbxdrFhKsgFZF14j0x04?=
 =?us-ascii?Q?pkqGa2l9om7XOny+Q6Iw+DPk5IFLsNoJtmHXqGY/RckIUvB9Ev+bQauKy0GA?=
 =?us-ascii?Q?X+y26mQoiTeA80kdOIHfgfwuxlEVw7w6l43eDzpI9Kx58JsAf/tOfagnI+3U?=
 =?us-ascii?Q?p+5ovx6DiiSK9gHwMKD+4JbQ0aXSEHizoKx/LLpgGSTmpzaOiBCNi0QeNlqk?=
 =?us-ascii?Q?3vucRk/Ls4/SM71+RD/IWa1AmWZGBIZ6DxGoFk3mxVL5I2Ub3DD7CGGXGTJh?=
 =?us-ascii?Q?pW8IqJXe7fE75+vZqgcPfyuCHEPwKaR94w3r9owCpA6iBBjG2vrMRJJlcCYc?=
 =?us-ascii?Q?sLWd2ubB/ECOh3OU4N5UAoBtk6Fg9ATaO5ldWB0lmGEZrQxpjsrvhn1lLdji?=
 =?us-ascii?Q?mUbC1+hYmXXffYaXmVq4YGD4d1Q7YaLGk2OTDM7+6gSG5MD+IrdNsukcCnRq?=
 =?us-ascii?Q?8fmsA41Nw5MAtf8KG7UEiXNkx9DfaPYKEdd9LucdNh3849zWxI3m1rdmtAbh?=
 =?us-ascii?Q?V6AJnqoysRc82DtAn1NC6WQtVbbaWcSfW57QgF5kf8JZocrZe6kJPgtnlWsV?=
 =?us-ascii?Q?StWvJUdkDQissOEVCEW+ee999Ge816SroVWQBblwsXwlYL14YMj1a45pCIs5?=
 =?us-ascii?Q?gXQjwPr56BUWvNr1ggzHWqf4Q+c1UuWDUsTczg0o4F8uYAoHymMODseje4xa?=
 =?us-ascii?Q?YoCW3fVEwfcGmssOk+IXTI+A4FtgoIwY0C6uCV4My4doCoWBRoY2ETWoMK3K?=
 =?us-ascii?Q?FiylGFQW4o2IKrw4UEv2enxc92aDprOxeHJQhmOSZCf29nriHbscw7czqPJO?=
 =?us-ascii?Q?O0DRMmSxk3w9pYuxOwhpJ6P0FqzbaynO12KWNk9L+OhBxHsGW46iChVGcrCS?=
 =?us-ascii?Q?P2Wkw4H1/2xgf6cjvCZbMKWiOWV55OIzK++qn7Urtrf53JvWngpdxB9afM5w?=
 =?us-ascii?Q?+XZy3r8NkaHEZk16QC8eAARNeNx6Yb+WzrKlGAJNcq0F//ANritorLVl9Meq?=
 =?us-ascii?Q?d3qs8qGfavZO+ItEXY506zXUnEiZbDpLdBUoawCx+HLDFXQyQgwLXDkynFGX?=
 =?us-ascii?Q?TRNlMPQw2OfD41UwX7Hr1AhGPyh24fbDcl1L8qd00woAP4fY4NDmKoFGIz11?=
 =?us-ascii?Q?BS37o+jf/er5aMD0PvFPyGlouNV2pHX+m4uM8vD0gkkQ7y0ZZSyWRIMJFYib?=
 =?us-ascii?Q?KXVeiWyDy66eDUni7fuwL2Y3w/ubUigPz8blQW5jx3bp/J/elwKCTvvyoe4o?=
 =?us-ascii?Q?72vWw1XPkVKDb0YcuKr4eojWyXLZEWfPlUld7wV7nB5aLhHLqo9vOHUAdK/m?=
 =?us-ascii?Q?gGTftf/neXRCHtm6K9OQQpv7xNribTgpGBMCmgUmH3ZtriFFYN9PekhyY1Es?=
 =?us-ascii?Q?9+Mxl9rc3Xii2kNWPojx72hAecy23Ln7Z8ChOun0GtgTmThUNgrR?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0c1d72-880d-4cc8-86b0-08de7fcc6ea0
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 00:15:14.0997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yb0ukKsS/O0g6evPgY+LvT9Va6yocNckYL7JUnmJrSvg//HoUWkwCC2Vov9rXHEmZWm0d3Wl7MjdXCbRcf1WyaAaBNmHy+Xfav0ANDiLJAm+HGn0cHQECej8fzCWLZwY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8282

component has component->val_bytes which is set via
snd_soc_component_setup_regmap(). But it can be calculated via
component->regmap. No need to keep it as component->val_bytes.

Use snd_soc_component_regmap_val_bytes().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra210_ahub.c  |  8 +++++---
 sound/soc/tegra/tegra210_mbdrc.c | 18 ++++++++++++------
 sound/soc/tegra/tegra210_peq.c   |  6 ++++--
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 43a45f785d5bd..a4ed02617472f 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -20,6 +20,7 @@ static int tegra_ahub_get_value_enum(struct snd_kcontrol *kctl,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_kcontrol_to_component(kctl);
 	struct tegra_ahub *ahub = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *e = (struct soc_enum *)kctl->private_value;
+	int val_bytes = snd_soc_component_regmap_val_bytes(cmpnt);
 	unsigned int reg, i, bit_pos = 0;
 
 	/*
@@ -35,7 +36,7 @@ static int tegra_ahub_get_value_enum(struct snd_kcontrol *kctl,
 
 		if (reg_val) {
 			bit_pos = ffs(reg_val) +
-				  (8 * cmpnt->val_bytes * i);
+				  (8 * val_bytes * i);
 			break;
 		}
 	}
@@ -59,6 +60,7 @@ static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctl);
 	struct soc_enum *e = (struct soc_enum *)kctl->private_value;
 	struct snd_soc_dapm_update update[TEGRA_XBAR_UPDATE_MAX_REG] = { };
+	int val_bytes = snd_soc_component_regmap_val_bytes(cmpnt);
 	unsigned int *item = uctl->value.enumerated.item;
 	unsigned int value = e->values[item[0]];
 	unsigned int i, bit_pos, reg_idx = 0, reg_val = 0;
@@ -69,8 +71,8 @@ static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 
 	if (value) {
 		/* Get the register index and value to set */
-		reg_idx = (value - 1) / (8 * cmpnt->val_bytes);
-		bit_pos = (value - 1) % (8 * cmpnt->val_bytes);
+		reg_idx = (value - 1) / (8 * val_bytes);
+		bit_pos = (value - 1) % (8 * val_bytes);
 		reg_val = BIT(bit_pos);
 	}
 
diff --git a/sound/soc/tegra/tegra210_mbdrc.c b/sound/soc/tegra/tegra210_mbdrc.c
index 6a268dbb71978..64f1c91646ce5 100644
--- a/sound/soc/tegra/tegra210_mbdrc.c
+++ b/sound/soc/tegra/tegra210_mbdrc.c
@@ -307,13 +307,14 @@ static int tegra210_mbdrc_band_params_get(struct snd_kcontrol *kcontrol,
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	int val_bytes = snd_soc_component_regmap_val_bytes(cmpnt);
 	u32 *data = (u32 *)ucontrol->value.bytes.data;
 	u32 regs = params->soc.base;
 	u32 mask = params->soc.mask;
 	u32 shift = params->shift;
 	unsigned int i;
 
-	for (i = 0; i < params->soc.num_regs; i++, regs += cmpnt->val_bytes) {
+	for (i = 0; i < params->soc.num_regs; i++, regs += val_bytes) {
 		regmap_read(ope->mbdrc_regmap, regs, &data[i]);
 
 		data[i] = ((data[i] & mask) >> shift);
@@ -328,6 +329,7 @@ static int tegra210_mbdrc_band_params_put(struct snd_kcontrol *kcontrol,
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	int val_bytes = snd_soc_component_regmap_val_bytes(cmpnt);
 	u32 *data = (u32 *)ucontrol->value.bytes.data;
 	u32 regs = params->soc.base;
 	u32 mask = params->soc.mask;
@@ -335,7 +337,7 @@ static int tegra210_mbdrc_band_params_put(struct snd_kcontrol *kcontrol,
 	bool change = false;
 	unsigned int i;
 
-	for (i = 0; i < params->soc.num_regs; i++, regs += cmpnt->val_bytes) {
+	for (i = 0; i < params->soc.num_regs; i++, regs += val_bytes) {
 		bool update = false;
 
 		regmap_update_bits_check(ope->mbdrc_regmap, regs, mask,
@@ -353,13 +355,14 @@ static int tegra210_mbdrc_threshold_get(struct snd_kcontrol *kcontrol,
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	int val_bytes = snd_soc_component_regmap_val_bytes(cmpnt);
 	u32 *data = (u32 *)ucontrol->value.bytes.data;
 	u32 regs = params->soc.base;
 	u32 num_regs = params->soc.num_regs;
 	u32 val;
 	unsigned int i;
 
-	for (i = 0; i < num_regs; i += 4, regs += cmpnt->val_bytes) {
+	for (i = 0; i < num_regs; i += 4, regs += val_bytes) {
 		regmap_read(ope->mbdrc_regmap, regs, &val);
 
 		data[i] = (val & TEGRA210_MBDRC_THRESH_1ST_MASK) >>
@@ -381,13 +384,14 @@ static int tegra210_mbdrc_threshold_put(struct snd_kcontrol *kcontrol,
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	int val_bytes = snd_soc_component_regmap_val_bytes(cmpnt);
 	u32 *data = (u32 *)ucontrol->value.bytes.data;
 	u32 regs = params->soc.base;
 	u32 num_regs = params->soc.num_regs;
 	bool change = false;
 	unsigned int i;
 
-	for (i = 0; i < num_regs; i += 4, regs += cmpnt->val_bytes) {
+	for (i = 0; i < num_regs; i += 4, regs += val_bytes) {
 		bool update = false;
 
 		data[i] = (((data[i] >> TEGRA210_MBDRC_THRESH_1ST_SHIFT) &
@@ -413,9 +417,10 @@ static int tegra210_mbdrc_biquad_coeffs_get(struct snd_kcontrol *kcontrol,
 {
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
+	int val_bytes = snd_soc_component_regmap_val_bytes(cmpnt);
 	u32 *data = (u32 *)ucontrol->value.bytes.data;
 
-	memset(data, 0, params->soc.num_regs * cmpnt->val_bytes);
+	memset(data, 0, params->soc.num_regs * val_bytes);
 
 	return 0;
 }
@@ -426,8 +431,9 @@ static int tegra210_mbdrc_biquad_coeffs_put(struct snd_kcontrol *kcontrol,
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	int val_bytes = snd_soc_component_regmap_val_bytes(cmpnt);
 	u32 reg_ctrl = params->soc.base;
-	u32 reg_data = reg_ctrl + cmpnt->val_bytes;
+	u32 reg_data = reg_ctrl + val_bytes;
 	u32 *data = (u32 *)ucontrol->value.bytes.data;
 
 	tegra210_mbdrc_write_ram(ope->mbdrc_regmap, reg_ctrl, reg_data,
diff --git a/sound/soc/tegra/tegra210_peq.c b/sound/soc/tegra/tegra210_peq.c
index 2f72e9d541dca..022a20f1ef7d2 100644
--- a/sound/soc/tegra/tegra210_peq.c
+++ b/sound/soc/tegra/tegra210_peq.c
@@ -148,8 +148,9 @@ static int tegra210_peq_ram_get(struct snd_kcontrol *kcontrol,
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	int val_bytes = snd_soc_component_regmap_val_bytes(cmpnt);
 	u32 i, reg_ctrl = params->soc.base;
-	u32 reg_data = reg_ctrl + cmpnt->val_bytes;
+	u32 reg_data = reg_ctrl + val_bytes;
 	s32 *data = (s32 *)biquad_coeff_buffer;
 
 	pm_runtime_get_sync(cmpnt->dev);
@@ -171,8 +172,9 @@ static int tegra210_peq_ram_put(struct snd_kcontrol *kcontrol,
 	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	int val_bytes = snd_soc_component_regmap_val_bytes(cmpnt);
 	u32 i, reg_ctrl = params->soc.base;
-	u32 reg_data = reg_ctrl + cmpnt->val_bytes;
+	u32 reg_data = reg_ctrl + val_bytes;
 	s32 *data = (s32 *)biquad_coeff_buffer;
 
 	for (i = 0; i < params->soc.num_regs; i++)
-- 
2.43.0

