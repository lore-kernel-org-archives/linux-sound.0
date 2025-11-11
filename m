Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E5C149E17
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820485; cv=fail; b=VEX6BxMG99m23ZmLOMUJWv/F4Dfet42yr/D8zA6ZYGi21AzGcS83Z6bZebcFZ65B17CyqF8/6lX2eWU7940EufO4kMaW4lz0SHEbL8mZC7mTR0nS5iJPN6zQ2zVxtKXhHziztzem/Bj7NEqvthcWSROR8Tii83Bysqr6JOpoK1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820485; c=relaxed/simple;
	bh=6qtoXA/pvow+8HgeOQ96wQ0/l2eotNz2hgE+j7cuVwc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=S6pOLNZKzKo6U2CerYYTsVUFGdC95Seju9kk7QuwMqDcy/gGB8z53lTTTxxIYKht1qm28SUG0Ps1+qzAVRkM7Ipo/mdDe9jsbjpUefFaO6t4hiYf23R2AkAjc7GfsbaP8WaYjChLR7f7l9mruq+05QaE9Z2OYwPDZPY3R3NO23Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=V4tVE6f8; arc=fail smtp.client-ip=52.101.229.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="V4tVE6f8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnwbuWm9oUwIvPZlGnUROilS8/wlbZmTynwhkLpkmEm4oyDGwLMZz6UhJhOyWsbftxVgGQfQZbYkgAEAGJaNc4t0fzLzrAF8VQBC9/pKIEdbhQMRhdyJgfbu2drHpAyNor6S+AbMBntVfSWKFyIxEg0MFFHT2QlflsaR3mT5W3P6fqkzV8jHYcIJC95oZBGamPStXGlAf8eQW+KHJUmQxHN8NKMZclWRx8sn+FIjjd57S9/GMfNYdh77rAUmNN2+nRUxO9tnBshje1vTgKPxewXG8Nq/xb3/PnFxJgECmVUlrrTl0TwllyL3a30GYzkpPj0PFyNhHZt9Gmj4f6p5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7/pAXkkuvKFOtT3Anc38Kic6U640r++bbiPihmiLpI=;
 b=UdNaHPCDTp8DaM6W7w2lUkvnLeFjB4JERt5VqEyOG0GTetCT0CCeerS6p1q2CO92RtC7eAy+LNOu0td3iPbg2A1FxbVTNqhy1XITmiiX4E4FERWm8LIruTXhuE14eECCb4GRH7I+GXzZG3PGmJfdyG6qXoQUj0PxxRXaDNEHl23b4qTKlmlO5NcE6EjlPERZ85EkRX61EuM2AWV6Kul/RvEx+pJQBtG8GJ4ekbrr1sJupuAc1Z637imwZOwb/7T9FltBqMu39l1Oma0q8uhLbqJB1Y5uVoUpkZylEkQQQfHXfQkNmrmPY4DZucoywK43IC5dbYTbV2zHhbSogvMg4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7/pAXkkuvKFOtT3Anc38Kic6U640r++bbiPihmiLpI=;
 b=V4tVE6f8evC7DV2yMs9krAmB0rDAMszaCwI2xvnc3gcIj0tZntID0Cn73IM8OMMGaWFC3aCPGcuMsKvnU7XHBy3xRGs1pk0qJKd12a57VII5ZPzSIWGfmwyCOzN1SuZEKdLxEzmCzdZG02X0QD8VnCtUIpLJ/3Bff2q4MMfeX6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:20 +0000
Message-ID: <87ecq57727.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 048/292] ASoC: codecs: cs47l92: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:20 +0000
X-ClientProxiedBy: TYCP286CA0162.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: 559eff99-49d8-4306-60f8-08de20b83d35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gpRkyuXtw52XTTt+gh0o/9EHJu0U39riWJmTJ5B5dPtfSiSXjIJ46QD5TAbP?=
 =?us-ascii?Q?Qlb0ErboBp+Bt7WgFxaKzPVCGvec9T64RMDpJXUnExMk8f+aMPw5jYIJkeCB?=
 =?us-ascii?Q?JAvtin6hK9vnZgYcK+phFWlBAA8uDAW3tqvRXAgoPC8lU3CCE1ovM44EgVBd?=
 =?us-ascii?Q?J/ZeNbCtNr/9+gJ7T/QLr67iyxG9pgVrsyHliFcOR1y3iD4YTq5VvgEEw7R9?=
 =?us-ascii?Q?QZnABsEqwJ+ogmo8SgC2OcGZzlwwAslQgJkIhSJGsL9iGHV+gojx0sYGD1jO?=
 =?us-ascii?Q?pvSnwK9ri8wO9ezfCrMWWJKPeYrF+8xRcR41V4rXyip+Ykb5xTznt//dBeJz?=
 =?us-ascii?Q?iO0uU9oQnZ+LCnfmZFnsz2uawZHy6Ns+zzVp6WsYUqDzmiL0iv15J+5uJAWz?=
 =?us-ascii?Q?BqcdZtTx4Qr6sXQvPL/azxBV1j1qQS7kJFNqql0O8gfYn9UaDvcat/JMdyuj?=
 =?us-ascii?Q?WCo5NlLKfHgS+AIf/pLXClFByTspJZITQ/3DaFEIjVfLu7bRqVHfR4sI1y6Y?=
 =?us-ascii?Q?mfa2V1DotSyYfkKpO4DAbSEgDQXiuw+aCXTW41HxPoZpINx93o8xoyi/NVCb?=
 =?us-ascii?Q?dgNkUZ5Y5Ti3boo/ZYQ0sT1cJ94/H98InDDgiVhLSb5l5qcjVdzIbICHvyOT?=
 =?us-ascii?Q?wvSs9/Yb9Wxm2gAmrq/acjquFUJ5dZaa1hHQKneJMi8P5drjUgaSDQV44pfZ?=
 =?us-ascii?Q?+dAXaMgof8hUzwiIwOCvvcAlYaa/LVdWyhGfOoZkY4TGuDleB9poNm6TmOgx?=
 =?us-ascii?Q?/xQbrDlCKUjAutGMR0hOx0SQJY574Zi9kJt/oFGpgnSqKFEQWT1GL+BNEYn+?=
 =?us-ascii?Q?zTKpbfgOBGPLNrKyh6ArF7mlfZDRJHyIXFzaEMQKSoInRZDtrtBl5xBNLYfV?=
 =?us-ascii?Q?u8dQa8XUYuadcnvquiU86CKMth6xFq+WTk4GQhTWVlwwnP3tieL7VbbNsEI/?=
 =?us-ascii?Q?u9d8jnvvt3+/EOqQwG43AmGIyaIQm2+5QEfaPrB9WfKbpiKm562OPbmRp0it?=
 =?us-ascii?Q?MlqTDI9YI/GVECmROX4Y3tOP2DlpD/PoTT3xiqAbVFNgs3w0R4oo1jrmGtyk?=
 =?us-ascii?Q?8fbxFxfDyJvNjp+HB3u34j8/kQsXjaiL0P5+Mk6vZGYfbiPNLh7Gt1ua3tC0?=
 =?us-ascii?Q?K+zWtbS3QV0MEW46V5vuUMMzHdqfN8Wb2h1FRDJta1Qlg6Gqe1rvr5FQYAmq?=
 =?us-ascii?Q?/VnsMOTwZk+Z2jUAZeqfzmKyw3zG6XPj57EkRf3p+bjDY7Cj+8Kwr/TvHX/U?=
 =?us-ascii?Q?lWRvlKp23FMW1hOcUaLZbVyC74FiIZidsMv79nCXhmJuTzzq/z6xN0xVZ+67?=
 =?us-ascii?Q?I+/YCaPHJJJmarch18QCWcU/BTK1pJwevBt6Eg7TIYCqlX0+EAdqEwk1m9TH?=
 =?us-ascii?Q?rB5x1dpxdzWK4HMMu2BBMUM3AoJMJuf6B8bd60jh4DxFwZqZLseCZtTrFqX7?=
 =?us-ascii?Q?zSuDsI4ZIrAahRXUsTMPSYFHSwtexJ41CKqkZS6JtdufzjdkeAAjdQstluKu?=
 =?us-ascii?Q?ei5VDUTaJMRlEUe2tiIuixfxxupDNxUlWPuh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3b+9hQUhpBUG1f4iO2NCp/AwG+J87a0Ssp73xIiTs1T/yJaU/bLi+KfQ71v3?=
 =?us-ascii?Q?UhuQoGBqTmPSCyk6bzjtUYs8c3c2gKMLpV+PcCw/f8wAabhzIPkJ+3iUr2EZ?=
 =?us-ascii?Q?XWPms8Yde2G4wmOqVnEVlfwW0uFkJeIXp3zywwueW8Fu4dymfBZOcmuI7qao?=
 =?us-ascii?Q?7CrDoZ6pXcwwlnn0c25bXD2jfb+CyGkdLnX4v4vfVY5mx8Yz/Lmr4E0V1Ek9?=
 =?us-ascii?Q?aPe3ivtTzouY7QRZcXF8SHYlmawgwM2AXgnSCz2mi9PEaRrbT0VARq21fixk?=
 =?us-ascii?Q?Uq95XFhqAFGSxtvr26TbXWHrGWUlqJ3H1eFfoFBSF9kS5qPyR2N1rJRAnes4?=
 =?us-ascii?Q?g4pvo6Hf+8lb8v5hk7FLkz8EzpnrKKfcL+yGpN463kX2WpBuT97+/d5CZ9N7?=
 =?us-ascii?Q?M2of2pLEcHSzk2aI8AF7iH4fG09uw6u1AdEtTrNrTCuiJwY4riYS8esshZkD?=
 =?us-ascii?Q?iUi19cjRi/BWom/FOu6pXIB+v41hfsljT5nT4S7oUHXDejqk1lhO3/XzU0zB?=
 =?us-ascii?Q?mo4Mfjic6a4gvjmZVbc1lH2X6sT76P5b/LkS4Afxb6HQMHtyfDIQxU1+iwnU?=
 =?us-ascii?Q?NXNnGQAwCC0dGTdOtoDu+OY+yoz2p/uWJeVWCk9vvYYWUG8EwRh44n1jVCfg?=
 =?us-ascii?Q?TYCkhc1nQBwIOEE5zJEaRCEShl5t/am2QDxJN9SZczqzIvvoMa3ZlM3eLGVV?=
 =?us-ascii?Q?3xwghdcfZHUgOm+c3jIsd+wO4vyH9sN42dHjOxcSH7lNqigtaaprKU9rTdsX?=
 =?us-ascii?Q?Z+C+ZQ6zquRquWpYAeym1A4nU6GsgYk8BuuChtxF59Aldr8hl56yeMXnQr8N?=
 =?us-ascii?Q?jprq6w8HvD0Sepmu22TSw05hr0oYGYCeF7vT5hUARg02V/mfnj+A5zcW6Z9t?=
 =?us-ascii?Q?hI7WZT0uVSv5VPdFGFsfWCPbD7BE8yUBDNR9H1/cezvjt8v+OJbg6R6OC41q?=
 =?us-ascii?Q?d3KDMx0f+SpEKKPERn7u59d7R+/58LYO2rxdJBhaSgpUFBO37FekrOS/5+Tv?=
 =?us-ascii?Q?s6lmOW9vNycSSJsLGhKnPaMSCJrwHRMP3G1Clcbh9oM/w8i9yfKWh5mg/EYB?=
 =?us-ascii?Q?0DafWstu2AZ11UJD/bJHmGRP+budP+9QQdXtAEV/ysMufw8lAerv0HCHwJRr?=
 =?us-ascii?Q?P0K4v1kBS32bXCzFQjr51/ulGcWSp5rjtptRmWOno1GrObVbpcvnRZGRniul?=
 =?us-ascii?Q?I1RJzUCFtutaa4tX+waCwSFkixdy0mAaU9WLdVvH91NQbpIy1yKwIEi3G8Rs?=
 =?us-ascii?Q?e/iKVtmrp56EpnzYEOZuvApFbA5l5fTvnAJy7h4poaXfmpiAT46RmFe2wcRx?=
 =?us-ascii?Q?t5+N1bBOavJb2bJtJOHvw2O8LxJdjVuAPhyeb3STXKbG15Nc8k0FqbYrdv82?=
 =?us-ascii?Q?JY8PpXUKVFdUP6Q++7EP5Cveaw2UIPgMB6JY+wucldllOr+Dtx5O9xOjS9fA?=
 =?us-ascii?Q?8Pv/V99Z/zt//E3/IHr/kNqJ3bWUJ1ZRd7C3ThhUUq31sCGkqktYtdZOJ5/f?=
 =?us-ascii?Q?xgnKFTxszgoaciN0e1/B4YriGv7bRwbcuDEsNur1/42yrFLFGMyG258dZS0y?=
 =?us-ascii?Q?U/LoxPu4XaFqOp+7o2mggIYw3bHO7+CXGqoq6hQ549GoWV58SRQghpYcqNLO?=
 =?us-ascii?Q?4TYA5b7+H5yEBFJkHuKAGWw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559eff99-49d8-4306-60f8-08de20b83d35
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:20.7644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkPyPo7a/lOzUH6RnD5CsrPwxvH1wa41CALcb2ELA8QWF/7e2RPg3q7tbn+xJzSoKn6J05ht6/vdHw03ZDBdCVcaX7xQwxFatJx6XLEkAo81EuUcuHPewKYo6z6yCs0N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

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
 sound/soc/codecs/cs47l92.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 2c355c61acd8b..868237bd6d910 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -52,10 +52,8 @@ static const char * const cs47l92_outdemux_texts[] = {
 static int cs47l92_put_demux(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera_priv *priv = &cs47l92->core;
 	struct madera *madera = priv->madera;
@@ -1887,6 +1885,7 @@ static const struct snd_soc_dapm_route cs47l92_mono_routes[] = {
 
 static int cs47l92_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 	int ret;
@@ -1894,7 +1893,7 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 	snd_soc_component_init_regmap(component, madera->regmap);
 
 	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_get_dapm(component);
+	madera->dapm = snd_soc_component_to_dapm(component);
 	mutex_unlock(&madera->dapm_ptr_lock);
 
 	ret = madera_init_inputs(component);
@@ -1907,7 +1906,7 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	snd_soc_component_disable_pin(component, "HAPTICS");
+	snd_soc_dapm_disable_pin(dapm, "HAPTICS");
 
 	ret = snd_soc_add_component_controls(component,
 					     madera_adsp_rate_controls,
-- 
2.43.0

