Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D133C3090F7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415697; cv=fail; b=IEeGGfleTuJfj89aLFDj2yEv+DHcj6JsO0h7yNgue/1SmSvsneX2ksSydMwYD+y6RrUszdG3mvYfZXXiOp6Y1xLJbda8z5EeqzasWeFB18u8kYwGVMm/sxeunJkUNdCWZUXRRApvYseG/gEypjoiRf/M5qOfYr2bT+F8Fr8u97o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415697; c=relaxed/simple;
	bh=0jUbLQF0e41QF0rlwkJb0Xlx9f/ad/WFJQ/0jdZYJ8U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gHSrNPaV9VFcta0Piun+Beu8qci6s4z/kXAIW5wujPKQeqyO99KRL84NGOzQY29a+uaETwwpyx2XYfBFSj5+cx6EUEsmdOPUpgg32fT9pAX+oIyytqULbX3lUcqO5S7GS7Zh6fJDtScHAaJLiMZ4USqhN6Qr1W7FTU2+anp6kKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jgbF8or+; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jgbF8or+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bclp01KSd1vFeXjZX+jXxNinCbjadRplIDpeQnP5dn5E0occK0JtfwmLx/cWHgO9kHQ7ZzkG6XCIYiQeivsz45J+700EpxQluHKRK/R8YOJmeCJSlgs1ntFIR5VY5AIuru9CB7PM9RYsOGpmBW+xQnH8S6XJbESRJbezSgmqFtEFpFH8cEXGV56APZEwn9teCCRwkRNJs0XQPKt8/Oh02yMd+R9BjROFtoQEADyqghyQFtIlp2hcRowiqyAPPMKZrMwCJDxCFk2gVn2Ar+g03lU2Za9Liw4tfeToE1uYfd2ucpGSYRSHU92jjxf7ttBO1ca9HpOpMJ0OFfZW4xpklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rlq1ciaBoFSJs/g09UQ4wCcfnnIHxqCCb/GcEqh+OW4=;
 b=art9tMHDtrdspDafXGblMcFZpLQeZPB8TT7uxj96Zr6ebIUKodA6pwULrUFmP5PNzq78OPlFbXQkdC1H2r/mOx28pc3j4vJEpbDuUqr/XbfoOni7pjK6EX5flhYXBB4Di17JEOrjyEiJbFhuheUcKyqD/9zHHqSXKgaJASXjx1BmOzyw9roAhUJtwTvEqO0OSyHm64gIRaqt796+YKkr7fLlF0uV1Id2CM6CcfAH6TEk7YjSfM1PpS4TmlUSZQu2nN2HjVoJf0g2jzfi+HliTCvM22bLVrjs4Hiyv/qIEV1fGm96e5cob3SIsr5pTyL+SarSZ6+N+0QolbQMujF05g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rlq1ciaBoFSJs/g09UQ4wCcfnnIHxqCCb/GcEqh+OW4=;
 b=jgbF8or+1oqvCOlfcDOmrp6+30ihp8N0uhTYK0+fBakIjIY1q2/f6qXN0uRQFoVJaLuoFSospA+PhfIgp8svGtZMiMJIe2JOEcIZk48ohxW/7WTXVnkQGWuYiCQuhOkVeKWHu4QHfPW1iT2wAv3AYpnFkGpXYw0yZY7U8veJTMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:33 +0000
Message-ID: <87ikgiru42.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 034/139] ASoC: codecs: da7219: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:33 +0000
X-ClientProxiedBy: TYWPR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b605197-5d32-41b3-6bb0-08de0ad92860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iK+EP2kI3vlEYFMc92dYU8AV/rlnfd3B1+uwvsEhBu5gcgAsE0eFtVYF1g0/?=
 =?us-ascii?Q?mQxlrt//k3NsiTtU2XS0NS3NLFr8GHGMn4qQEIhpLqANmB31IrVpVck88CZn?=
 =?us-ascii?Q?svok+RSBC50vJUI2c8Ux6OByNrZvvIjYusNfS1dkhYJZf1yrkYQq/fB/Dtye?=
 =?us-ascii?Q?SDgNy2hytV0flCuCO2GtPKzFqmInOqRwXFXK6MCd5wt8wv8dv+fM569a1XAb?=
 =?us-ascii?Q?cCiB/4abRYUXPgzbkEwHv07CxzxpP3JrfooBaVl7JP2lDGtqH5+njRXt4rm6?=
 =?us-ascii?Q?9pJmv8Roou7h2mMhgWl5lZjRw8GYgRh3/gTxXpvhemhxxCXOl1NTtB0PlHhJ?=
 =?us-ascii?Q?XDWVzRHB4/R+xUMZumvhGfMQSXiqdbRQGrk4nMA1w4v1zt05ilrqliAztgj/?=
 =?us-ascii?Q?4L1x/wXvgVMz73SPYkC0Hy+emBK7puJaAEKjo5db+1jFDx2MSxv7SyQZZVNw?=
 =?us-ascii?Q?myoVpkQImJxFu9rKWCQwI9R6nMg9cVgEnYFCMiOxP1POFDOtvPkTTiChJoqJ?=
 =?us-ascii?Q?vz04ycC2KnsnD4UmHWfRqe14SH16saswnHQehEG5LzD64rOEK/6WW3CYYEVS?=
 =?us-ascii?Q?wlXlZLX+w4j1Y3jehmz3bKwZUbCIALCKtBtUSLJwWXTz+M2nTP+6wpdpxNfB?=
 =?us-ascii?Q?eeW1+Uh+X5VePW2o6FZ21mxMh23j22j3ycRWKJhuxYCjDY6i+xOhwi9Fs4ht?=
 =?us-ascii?Q?pYPDtoxL4PhUey6LYJacs02czJpBP//0s3KlmpuDZG9AyG3nn7LoV7NnEC/v?=
 =?us-ascii?Q?p6BK0z6SWO+3qfRVO+WJUHDcY71aCaky7kbuEm2ndSYMzESpbMWCmofDPoX5?=
 =?us-ascii?Q?b4qJ65yET+YC549X2bRo+bVSoWPoi0YYDW+M/kpH9M9gccG2FUV22pplWf3o?=
 =?us-ascii?Q?YTviPbreCzDBQxWRx+/2e9eYCBqNC2rBJO/vFZC+tAw7PetlseBXQgjusXNU?=
 =?us-ascii?Q?gyiuvyqkGE7rhNQ8IGyDUWKMOsG6NnwBjZTOrJdi8bivfQG8dOQDL2VcayX3?=
 =?us-ascii?Q?mY0dPrFufIJrRo9bsfYyPj/3hiJWFtfAekIu1EA+j7EHm/gA6QTZGanpC2iT?=
 =?us-ascii?Q?o2uWKX54FbeqfWWdfT8qs5DJOPf/IT6JzceF4ZIxlKdWXUFUSu9Dx7Gkur9W?=
 =?us-ascii?Q?uKnpNl/fVJVi7uzyDVEvYK2fU3eOvI6TlZqUeP8qhbiwhUqcgco1YU02xhKN?=
 =?us-ascii?Q?EaEcmxl1LNf8fZcXKlMnB56KWbc82ndNyZZmtyYK3BnOVhBw9Dm9qL4jzNhv?=
 =?us-ascii?Q?tSC06/j50pKVMdRALxMaAoEt67BZz9G0pMIjQ63JUU9uFJD/zZ2FKl9m4XOx?=
 =?us-ascii?Q?9z5OyujU2qEaPmMYJu4DrLhJZsp2bjG7mp2lmAGyYNf7Uptr3q4S7rAL5k3V?=
 =?us-ascii?Q?H5KneVTAlhZWhpZUClI+rBxnkaHaQl3Ox9e7PLlGU7f8T3r4rHYKEQVG8YfI?=
 =?us-ascii?Q?8zHDTvum9wRkW4XZ97niUt/NcYefGNLgzOgbZD5NLf9gl3jmYFmTDq+hkZkU?=
 =?us-ascii?Q?1dgeJFlUNtQQrLvyDX33lUsd1NqG4t4VoZUj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l6sde6w3JkNBiFw/WJXstHOpemiA2Iv+rkxTudHdc2fHl8IQEdoEFfY22NSH?=
 =?us-ascii?Q?OOvFS4m6O00EwdrFDQgSq8zAA5O3vbOmgqguwYYFSlK5mFU9mP+MOyQXiK+D?=
 =?us-ascii?Q?Y6h/kAOkIPt8j/0LNwSDpAnJhcRkB4hY8+FM4W3vmWeJDouIGt3dXVY9n2wS?=
 =?us-ascii?Q?vIio6lpuZwYpAuSBN7voQ4GStW9OODWUu2xp0Vpe7jeFZ60qwKZcnrbwPH5T?=
 =?us-ascii?Q?buOohYfgWn/whHDu8m/H9khcZXbcrnOpdWZIABTBv69IKMxmGh9sFXCm8TML?=
 =?us-ascii?Q?PdXNXWOhIYHbqk+TOR4CL04wge1Fy9MBJC5+FtPKooLm0Z+TEJo+lusHr2Pm?=
 =?us-ascii?Q?FvgZ4mpXwIf4iOnSgXwckAKPNDSEUTuF0jzsgi8tyYRXiBXX4if96wCyE439?=
 =?us-ascii?Q?wmQXmhOJYTHFwfxxfw2zoK9wtthwn5oluaw+bZVKwGg85r9NUvX87mZiYi01?=
 =?us-ascii?Q?cLsolw6dwKs4geQ4nqal8aWIx4wE9qQ5+YeNDHu6P4G1zPSOIFJ5wS6RjX65?=
 =?us-ascii?Q?f6GHfrD/IrQdydvu694N5SZBHGdEOOCKzbaLDESwPgSrKsGBIkAJFyJva65+?=
 =?us-ascii?Q?k+tbX+SDEZPqakNfe3BJEkhfoOYRPCXZPtaHCMAI/uICiLKLpwDf7bvIr2xq?=
 =?us-ascii?Q?IJz+7zWc5f/k1hqw9S13z3xQee6TYGYdsKNKEEjVrnYQBckxKAGdUED3CGP8?=
 =?us-ascii?Q?TeQUyRZ1C3Qvj7SGn+bmuAAF+9JklE4tbGQtBpob8VNJMcioMaMWTm0QEn4e?=
 =?us-ascii?Q?GbG2fe1qxFX+sv7HMbTa85qRjZysS2jwZyRIqdei1zhFTR5RfZg6gucDuYdg?=
 =?us-ascii?Q?HT7pzFVvy2ozntwhN7qEKrR67Quq4QqBVT8q/tr7yRVFsPpqYhrJrhlK4FcC?=
 =?us-ascii?Q?cS4vyguIaJJyIPpnxUGFyZbP951tS3UHs60wWqSV3cJYiMAIJL8pWZb+AN9M?=
 =?us-ascii?Q?9ocrsYynTD5D2RplSnqja17LTGd9BiDpFszkxAmcQbbpZ3f2H/KgThKikLpD?=
 =?us-ascii?Q?BRcc0y5X7oWKUA0/54G+wug2cnNqJQ+CeLvE/7IKI20h9ExMd/PxSa/YDsVf?=
 =?us-ascii?Q?dzY4Hp4Vwp4m5kLgx2mKL8PAr4guDMTzxNCt74bFUVTsxFGT/7UMz7ZY0Xgo?=
 =?us-ascii?Q?2W1nxsYRIR+uwO5JtnVMhZrnr3q61IPRB3KQBvbbhWfDn7zovVECpoj9mSnA?=
 =?us-ascii?Q?KnA9tG2ve6swTSabi4twk2rEb49q4+FhHiuUSy0Jg97IKA62x87pJeWH7kVg?=
 =?us-ascii?Q?fo0J4gcaMKyObtt3Bv1tX7wmYabVBETHRF9xeNzn8UPeaL2an1QcjUw+j+lm?=
 =?us-ascii?Q?v+C68xG+/wdUQoRNyc+ku25I0s+UhIY8nSMHF86HWJGn1mtEJsJw18i/04pN?=
 =?us-ascii?Q?+lpnsnlyMscFIO4shHax/mB0tVUfaH4aoMulGadhnnOkXaoekGWl18dr63Ov?=
 =?us-ascii?Q?+bgAGCkb70FD2MECzGAKmIJ86PDIpm0yV0WYTI+9oD39rklHJHej3ndza9DP?=
 =?us-ascii?Q?9vR9mOT4Gl3TWRJIDbW3nCM/HH3ucugMkNmDyuKyVPn6EWtE1urpj4uJQ1Zt?=
 =?us-ascii?Q?q8Bnw/8lOoip+OC2I/ll+/zsULrG0qxkXI2drmBO/419xviwmsHH5WBrbh6P?=
 =?us-ascii?Q?wTSxkKI2MBDChhOMCIiM2II=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b605197-5d32-41b3-6bb0-08de0ad92860
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:33.6455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEUDyKp/oElB8+Nkc1S2hoNcodSWpCMEjJ/DrXDS7kYrbxT6xh/0utwGTPHrk9hBwaj/K0NLA4qS0ZWg7WLCLVDYxnkg2qnCGU8IWd12Rgl0Mv5Bk/AZ31cVSWCjcWML
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da7219.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 1742f91c788c6..2bc6b03488105 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -254,7 +254,7 @@ static const struct soc_enum da7219_cp_track_mode =
 static int da7219_volsw_locked_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -268,7 +268,7 @@ static int da7219_volsw_locked_get(struct snd_kcontrol *kcontrol,
 static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -282,7 +282,7 @@ static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
 static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -296,7 +296,7 @@ static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
 static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -376,7 +376,7 @@ static void da7219_alc_calib(struct snd_soc_component *component)
 static int da7219_mixin_gain_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -395,7 +395,7 @@ static int da7219_mixin_gain_put(struct snd_kcontrol *kcontrol,
 static int da7219_alc_sw_put(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 
 
@@ -414,7 +414,7 @@ static int da7219_alc_sw_put(struct snd_kcontrol *kcontrol,
 static int da7219_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mixer_ctrl =
 		(struct soc_mixer_control *) kcontrol->private_value;
@@ -441,7 +441,7 @@ static int da7219_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 static int da7219_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mixer_ctrl =
 		(struct soc_mixer_control *) kcontrol->private_value;
-- 
2.43.0

