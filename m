Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3381E0DCB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820946; cv=fail; b=rNxZUeUyXjrJBatI5UQuyXPX8TsuXVr1wg9OvMFtab+0a43npvkcYku0uGelzPtH7PC5jsMfH9ipj0iSTc6+V/PWzW26O5gFFluTgyoIh7oOcUNgQmKW+ajvij0Mq7pPxDt6Z2ZkGlDfkFi+Qg3enNz0hymtRQUBBtGB3oQApKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820946; c=relaxed/simple;
	bh=s3x/6vxgdHbbuZJW1rhRbqB3xK1alxQPSl8jVXj6YEY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LljKhhD2cjgA56CUjCAqfTcHaAT5qru2hkV7oOZab6YqVfpyFHkkHKggmv2d0/bL5Qu1nXpIz1dZfO7ThLBzxV7LEIM2Y2NCM4oBpVJvXIRgW8tFexTFglLfeitn7u7w0qyLDs2kssH5+J6u14NuFxm4cPRa/CB8xMcITEzZGgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X9be2SFq; arc=fail smtp.client-ip=40.107.74.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X9be2SFq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4tjZwWgeE6CpAEMFgPsPBbkOuv72NnqYKDCCOmHGzHTfk6/o6vRK6PAo2FcP5yhGBguzpkx/MkPSviN97Luk6o+mRfOJ/wRM+j2A2eswVLw95eCjZ7iL31IULioGE+zFN4Cf/c/tHGmpEx0L48GBso45PIA3kRsLywZEQ5vP4sEkEqqHfxJrdbp5l9ebLml47j5yUSmlTyz/tlqZdUjVaXc/A1z7QHetmjr1ifX6PKnNt31h1CsW5PBBZKshhH1gpU3DyuQ5cUV8G2U+m2YHVtffJ26OFQ1AiqLE3teUzDf2541JB0N96HO6DiO1vyPYfBfeNHHNNTlEv0bpP6rWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClYahlvWDAZ5caXuFHbuxL+x5a92XAkfW0OaxlmYxT0=;
 b=VRbPppudIcjYI/ksfkz/0FXoUCkb9mOfY9/JnyIb/QCp8HArzZ58an1GXAskrv+8Ims5++Mz51+eE3+jF2NyQAIeqOavVktFUW8mDAOdyBaVTf5kS42bu08uBGwerAKuCSMoaFJXeQuA7KY58HGatAOe03vs3d7p7MI+I2v4sCegcDW0AIK6FcC5O3/Hm30X4jSsML2kIKGzF5pAI/UA39p/8lysrN8iW6Zt0t7tFcg3en9CT1gep/yq78vqAFTrci855ybfAFYrA0nogVAHQlZnrB57ji8WmHfsEC2p4BB2BeZDbAWvEIyrRWzOYrE69LyuEXAjfj+nx+xECY4reg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClYahlvWDAZ5caXuFHbuxL+x5a92XAkfW0OaxlmYxT0=;
 b=X9be2SFqQzuc34HgK//sz3uIdOtnzyRpyPh5B8XiLBtckhC404k8btyzef4wGbQ8Tr4X1/y6m6Wd+dkURQhrfRLonMS3PfK2wnfQeFZlR+PBeOcloClChpjgsx2t1rerixUInnXhxFkidC2CMTjTtSRqaYNfFBoYlYuqSHBZb0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:01 +0000
Message-ID: <87ms4tza2b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 167/292] ASoC: codecs: wm8900: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:01 +0000
X-ClientProxiedBy: TYXPR01CA0064.jpnprd01.prod.outlook.com
 (2603:1096:403:a::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f924584-476a-4944-7d27-08de20b94fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5T/1vNKEbNc9Lp7qZ0JN9goO59ML2DxgeuhiG9EzRrkaVV3uvWYcEUy4LOda?=
 =?us-ascii?Q?ki7XNBe20uLbTq03FK2IDVfrFMNXbM25qFaNYnL0NIwaaWshrc4OQHNIMHq0?=
 =?us-ascii?Q?Vwbj7eHLQRPmJSWDvnsLZPKeK9oJ8IrZrgBUSv7ChR9Cx3TXxoKtx12YWPrA?=
 =?us-ascii?Q?zEUz7U/XyhOFA0t0ozSaUFhLVJqSts431hN46z0+tpbnjIUY9vxEWIcuhBZX?=
 =?us-ascii?Q?W3sPkl4L33Rszg6uU2h+j8QSi6SIkvX+4n1cmLGcH5KJW/tBGj8PWU097vBg?=
 =?us-ascii?Q?DBptHGuF+BMaqSefZv8fhJOaJwQ5vOl1BUPlxjgbGW4aqUQTCvPPPmgY5I5/?=
 =?us-ascii?Q?yGw3drYKDbRFA2AYTksdoy/DofFicUpyufw1EUkxbJH37F5g+E9leqAAdDjS?=
 =?us-ascii?Q?KhbVjHMScLhKblAXwasFvVEoA+7o+w8vIfdLslieZuhqhUHeSkOnofC34BmZ?=
 =?us-ascii?Q?LhND3d/06sjUQQYAOWSWU2SznZeX7FiXel17BF3AxBFPAcJ7pFHI3i5yYwJF?=
 =?us-ascii?Q?T4hu/L2Ths5gIqysRYv01Vz5OmQvFctlBSMxz/co/ZNofEgAYydokd9ElEJ3?=
 =?us-ascii?Q?5nwU9iYcFBppbrS1hcJZwJa3At2yIWggq51eSdegUU1pZBKKo4PIMQ81uzZT?=
 =?us-ascii?Q?UE/+03fe/I8ce5d2F5k6fNpePlGHP58+CHnpLvIWi49Fq/A184xJ4gtpiQjN?=
 =?us-ascii?Q?lf2b6Ns6223i9vtryjx2aHufIwEtufzcM86amcMnKEEhQyGwbjPDXSM8OBQ9?=
 =?us-ascii?Q?38tUZdKz1kXEtZValIxP3LlvHJqe23yH7wtzpfGdnHuG9j+Nlldn5kZtTI/W?=
 =?us-ascii?Q?Y3lzzGMnYZsd90W8fKMou2yln+/YHzR2hanDI+0xkfMmo7eT51YwOLMYsZbY?=
 =?us-ascii?Q?HZWBE4v6sDtKONhuGRVuuPQn+zR+vNezksZjdYhaXgbwsSzYeyMnLa38CKl7?=
 =?us-ascii?Q?tzcX/t/RBn15xgYsLfz7Xz9GTX9dzWERSG+n8ZTwLICDs/1sSgd4jVXvjebM?=
 =?us-ascii?Q?1gKyERE3oRzacYeRpNRILFkBWx3h8Hy39hdJ6FzrZ1LDG7MqtWCoAc227XBp?=
 =?us-ascii?Q?PEx1X0gYmbqrlOsqSWLHFH5/swWZ+WX/oPDnUYQIB4CZuqdouG2YuykSnfD4?=
 =?us-ascii?Q?1Kej8SkdHUkYqo8lRVHyZbaOiWNfBirxvhA0Y2ni93HukXGsGBlhdIBjB1b4?=
 =?us-ascii?Q?AzeguOgyViPo2Pi5N16Gi9YPAmezuFU32QMJLg9MVGFVQ1HGcx2y45Htdrdo?=
 =?us-ascii?Q?jeQ4HNGECZak8YTZZ/8Bv5WFuIG6EdLC3Q5TYZzAkK02sfP6FBhuuPVRltf6?=
 =?us-ascii?Q?WXR7O0hgtbhTGFWyFTbLaLMWGwlQ8NPxR+Fc+T5GM7oD0RZXHrVj8acil4D6?=
 =?us-ascii?Q?FYGMwzR2QQtI2kWIdm9tGufPm4PCrbA31Z/VMkh11wc+2dWoXeyatIRbCHlY?=
 =?us-ascii?Q?AAq1x5mfB5HgAg/nvWDvUK/8u8CDsm7bog1mMzBOs9iUz5DFAw8PTFb+9yqU?=
 =?us-ascii?Q?7+7h0+v3OKrDI1LBJECEb9Zyu3XJPKrQUT3M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ixtJfL0nhxtirI0B1HzXwSHr0zpiM4GQhW3ZgsbDK6kX+3DFLVE5fqnpcdTI?=
 =?us-ascii?Q?K6wY5JDNh94nDt5Z/VI1pz5g01XnLGIjsD2Urnr/NI6N5UlwhdXVJD/utXHt?=
 =?us-ascii?Q?6kNpwtSipHCUIcu5vF/pYH8LR/NVNCu0o63hnCIvPggRJzb3J/ytlyJ0rDjc?=
 =?us-ascii?Q?WZ1IAb6Uv/jUw96Qe6UUExJNnEaILj8HTCXO/HV9QGyQlPZQxNlAeLfW5QsU?=
 =?us-ascii?Q?OIPdoYaSTH/vidkfUqm/uRuISla3cbQhGG3vA2mDTJxXUr+kQkSjBrBMS7YZ?=
 =?us-ascii?Q?SKFdr/ds2RcS+bNI1d3c1QYAL58tTmQ0+19Tbk0sZf/PFnKmqnm9XPHuefPW?=
 =?us-ascii?Q?GDpqTgn7Z6kgAQz2zdj7w9eS0kTQM9pfvbKqa5bHD56LQmLuzpwGyn4doVuL?=
 =?us-ascii?Q?GR4NoPHkcBtoPLOP6BqnJ8yppJ+L6S1Shtq+C+6b1PGvxPvRESYq/YUddnZj?=
 =?us-ascii?Q?QBd9tVkoDbmDZvJMy1Fm0cwSQEcT0gPILCkNLbuxEIKpFjKM7o36W+DWajOg?=
 =?us-ascii?Q?BX7lbdKr8zz9gWAVJoRRy+EGWpWYCV7xvUXCx6ndVUlZIllJa/Pf46c+kPbi?=
 =?us-ascii?Q?y3lA9XyCJrf+pUGPQw2KraIfYd8mZ1nBT0Eq5RlFeTYe9GEuGHd6L4Do2oMz?=
 =?us-ascii?Q?wyEG/Qv+LnDmqgJ3CUgBpza0FwuKBpN0PjHeldhISXAbXBA3dQsDwn4KELbz?=
 =?us-ascii?Q?Wfh9KG0eAHYp+XVMC75wL0CkRgYyGOqZNX0wytZIEQoCZKuIt9zfyk3MtOIV?=
 =?us-ascii?Q?ZSGPdnjRIcCM2z9vcBgT4gJqsHSWXYCXMhCIqkNckzDqZ2kFr/RVCT5FmbBZ?=
 =?us-ascii?Q?C/1r6MzlSZGChvn8MR5u2rIC/eeKhxSjzLtkbBVWBj0heWTE1zzqLdPfNPbc?=
 =?us-ascii?Q?QpXoGpsDJqul1IZ6nt6eM/J4j2YOqSOeuUNgLh/Pwlo6KIDKZS//1+wPezXX?=
 =?us-ascii?Q?rRA524ygA3gNQwOpBQjdTQVgOgPYQN4utwUukGKiCsy0E7izN7O5u3O0aavm?=
 =?us-ascii?Q?kCeCbnn1v68BwkCulRSBilZwSbETdBZ4G5y6/NX4GgPdf+puZA6uj+0FKZ5Q?=
 =?us-ascii?Q?TjKpiq4IuOcFKT857qpGCI49Z0opn9dvJn0ovJoOQ2ynz58GF259BvHjA7+v?=
 =?us-ascii?Q?WTIBlS6gQWrpv+78SiQhRKClEwVENj1VLClDzjW/HLCz2YfdganuKavqiYR3?=
 =?us-ascii?Q?hTUfHGJSR0Wq12cL/cMHdiEuPXw/NOAGexzK+R6DkWTiqnnA7p87aCAjFT1x?=
 =?us-ascii?Q?CqdE/T3bx4ULKtbiZ5lPAPCTeHxf7rPKcJaNP4WCiQjmFznAZwkJ/hEpiH9C?=
 =?us-ascii?Q?cITUb7efyVeXexWQTFV0JimF/iKvsrQfHtbI1VbYoON0ikVBV4cj5LGT3g1S?=
 =?us-ascii?Q?gH1oaylv7pP4FAQlKkqctl+R3NT5RI5iiXfeu1hHTc3tnPR2IRvIp7biZnCh?=
 =?us-ascii?Q?qs2QWuzOs+TWQCZ6JTZtdPvzvZhRhzGw6aCRYH2E1Qj/vHoJRnhjm2G6CH2M?=
 =?us-ascii?Q?Up4w+ZaMU+YvLU79I9zFDp5LDJet+DiQcgmZHV8PL/9I4nneZlncy16PARWz?=
 =?us-ascii?Q?jCRv6+uXtnD6RfqR5di8a8H3UGIL0BJP2o/3ZdsXiLBzFgw23Ya8sv9yo2Zo?=
 =?us-ascii?Q?2f6VgB/eiAfrsEjzarJXMfQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f924584-476a-4944-7d27-08de20b94fab
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:01.1944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GckBuTWhRK/Hc9/XWrxkqKlThmnpvaWPhnm9SZt0VDZleCww4tLMgkGxWesQJJx+FaVHmYQpJ4OZVxga+Hz0yNjV3WJTUgHye4MvU/Nbzk6gythEWFehl0FqA4UdzSPF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8900.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index 6fb25588ca819..fea629541acda 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -1023,6 +1023,7 @@ static struct snd_soc_dai_driver wm8900_dai = {
 static int wm8900_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 reg;
 
 	switch (level) {
@@ -1041,7 +1042,7 @@ static int wm8900_set_bias_level(struct snd_soc_component *component,
 
 	case SND_SOC_BIAS_STANDBY:
 		/* Charge capacitors if initial power up */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* STARTUP_BIAS_ENA on */
 			snd_soc_component_write(component, WM8900_REG_POWER1,
 				     WM8900_REG_POWER1_STARTUP_BIAS_ENA);
@@ -1115,6 +1116,7 @@ static int wm8900_set_bias_level(struct snd_soc_component *component,
 static int wm8900_suspend(struct snd_soc_component *component)
 {
 	struct wm8900_priv *wm8900 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int fll_out = wm8900->fll_out;
 	int fll_in  = wm8900->fll_in;
 	int ret;
@@ -1129,7 +1131,7 @@ static int wm8900_suspend(struct snd_soc_component *component)
 	wm8900->fll_out = fll_out;
 	wm8900->fll_in = fll_in;
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 
 	return 0;
 }
@@ -1137,6 +1139,7 @@ static int wm8900_suspend(struct snd_soc_component *component)
 static int wm8900_resume(struct snd_soc_component *component)
 {
 	struct wm8900_priv *wm8900 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	wm8900_reset(component);
@@ -1147,7 +1150,7 @@ static int wm8900_resume(struct snd_soc_component *component)
 		return ret;
 	}
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	/* Restart the FLL? */
 	if (wm8900->fll_out) {
@@ -1169,6 +1172,7 @@ static int wm8900_resume(struct snd_soc_component *component)
 
 static int wm8900_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int reg;
 
 	reg = snd_soc_component_read(component, WM8900_REG_ID);
@@ -1180,7 +1184,7 @@ static int wm8900_probe(struct snd_soc_component *component)
 	wm8900_reset(component);
 
 	/* Turn the chip on */
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	/* Latch the volume update bits */
 	snd_soc_component_update_bits(component, WM8900_REG_LINVOL, 0x100, 0x100);
-- 
2.43.0

