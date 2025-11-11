Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F1E17E4
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820265; cv=fail; b=DkPmSVFzlmDbvFg0sezqD6SOx6JJqXWWm/SAtNe0rw1rhwKGc8miub1x/RJB7ID+Nqi6gOjyjonld6BY09qsrU4GAtNYYgoTXp7qwF93d2VYSTC5OIuy0K+p7Vy29JCmN9/gRibtBRXseAfbjf4z+VZl5gsZCHjBEuyFq7PC7U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820265; c=relaxed/simple;
	bh=3td+kjS5eUob9IKGNJz7lqCsRRHkboV2d3ZXJyxzeOQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TRPZkVhrpauSXfR1kpVZ2JWNN4R4piPO3yQCiwPmCxI+GWWU4iKz7prsi+B5NDR0cNzW1iIJO/xQ/SJs/LkSMcVlqhiZPdUwPL2SpjFuK2v9OrWpmdo0bi71953BBp7viSRqC4DHixLAlwMVNXhTwvN1u8lpBt1OumfpeKSIAAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gGZh/Tpz; arc=fail smtp.client-ip=52.101.229.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gGZh/Tpz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mp9YxC41Op4VHJwRaB57FjU3OmW8jw+hK/nS/wJecPKAiHevCC7+Ls9mIDAE0znoYX2Jgpkpf5eQusQnZXqpTPtRYC7dNTkKczm0FTJRBPeJa1IQahAjAkpnHmoG8eTViLttyf6Q9m0YKevk7FAjxHq9/3kvNJOD9RBMVAussqsXEX3T2Gk1yo2fWmeYK/BREL81jk/kEjbxekIVN8LCV08MVaIxhfeO3IushFXq/gGPNowJzVkBLzClxS+OS2UFjftChdF9q6rYoDd7tIwNe8qeMaVuFW35zuww5sTY5JgF/QEGvdc/BY57eo2jHBwry+Wiwd71p0RKpwoMpZTLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8egJZ82HOZcllt8c5rCABE4oDq37KBtOZ1RjysB7zck=;
 b=vGalP/6XOiO9YpUtOV2xHRjXrywqpvQ4v6HPQHqgCXwK4aCWSr1fVmjSSrmpudL+xFVjucCFJ6yCzMK12jzcUPSD0s+CjgPwq4+qBZqwCdSAJ93Z+zItVgwZF9OroyI7pE+jyrsFF8esmut2Vxvi/lyhlHPGFp2mOUPgdFXVlY66Ow8LsQ8+zyE+H80DH3aDtAgrLlrXV8r4X2vXiDDsrOQNhZfiXLjv9uCTHVihZ6e9GvYl3YAOqXOhaFYt4I33QkfGSvp9POiDSzQPZ24s3n9VwGLk1noN/dvkGXXCJTCMaNDa67xg1ZCleajeRZwTKbKJqKdZOHbxVx3W5XHfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8egJZ82HOZcllt8c5rCABE4oDq37KBtOZ1RjysB7zck=;
 b=gGZh/TpzMVAlydn0/yToUOEpOTTdj1vdQUkRsBQ7rzj1HMoAQFlmvjBEbBUb/fLXOmjb1McK81cwIxOYO46+Ecyj+kshLG2XUvY1jCltcoq4l5w3P9zuNEViOG1yjV6VtEsDvmx6UdoeevgqWmyQKAxh1TT2lWEvYoeVKr0cJcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7893.jpnprd01.prod.outlook.com
 (2603:1096:400:182::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:17:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:17:41 +0000
Message-ID: <877bvxa0d6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 004/292] ASoC: audio_helper: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:17:41 +0000
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: e895371f-2055-4f38-3133-08de20b7ba7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Dt75iITj3hwQq95sD452BihG6TaSLqZs7EtrNDaXgDMvAHkvl5jeyM5eChG?=
 =?us-ascii?Q?hJhh7BERV+DhjpezPR6/TFx28kylhmSXY9WExMh4e7Dv3O5j4AbR2qEc8nzi?=
 =?us-ascii?Q?DUpmN6WI+lpc9vkWtaslDyShGrCpWzForBkWcScVwI2VTreWQ5z4ldP1BJNw?=
 =?us-ascii?Q?dQLcdBaCvfYmWWeFuC5diXq9F+XadrKpB4fCK3Bbw6hX3gexUXTGlqURe/tx?=
 =?us-ascii?Q?y4L+N0jINDqdfIjU8i/k3EeIoDUvAJZKR/dVikJgvous6vKidfgIXWEsG1nM?=
 =?us-ascii?Q?DzA2O2yMYN2AOCwg8eJpmfwtLEE2TDskZeXltQ2BiCcXHfjl1QFC2QjbElDa?=
 =?us-ascii?Q?MiXC2RZUrd/7HK/C+G6WL3/TmS/x2hZWRTZr3KadUthPiZhcXbqu3rvsZLxI?=
 =?us-ascii?Q?IA6OKKQQj96ZKPuExTEBYaT1Gc2PCwNDRjsMuP54+uRtmJKAW9YPCyXtRjaF?=
 =?us-ascii?Q?qyDx0y3jPeXaIDdr7xiU4uMtuzBTB9csmnl7jw1+JpJDM8iYiBZjzHblXInP?=
 =?us-ascii?Q?13PQM8CKN9JlfRyn9M8bScA6KtD7mJwUaI1S+hwKBdQP9OK84hwYHzwthHv0?=
 =?us-ascii?Q?SLGoIIeW0PwH3hR+ApryQYqnVmfdDqa8EDwSD9AY2VvPI3nkHj/07PysI5Up?=
 =?us-ascii?Q?nfGwyTeC09uaEvjoVWCHr+S2Hgoe2TqKE09+LvKRiAvUrDuv6mIuBJR23/Bh?=
 =?us-ascii?Q?Q2XMGFpgWOdtVA2kYXA/mpy1WU4FX8NZklZliDVA8AqS3Ay7wr95sy33jxRT?=
 =?us-ascii?Q?4gsitOygMM2EZopVdxRwPLh8yNeH4NFzkYPkLUc4oFn1BdpAxAKeYEdifhW5?=
 =?us-ascii?Q?jcBctGiJjcXittPMbP2Fe0+E3c+tMIWYuUPsHjYknvjsJRvx5ZBnChASy5k/?=
 =?us-ascii?Q?TgEwUDDH59TvhDbfiwXSBK2UWclNzqBT707akdW5V1dEEEeRnq0daIih4hQr?=
 =?us-ascii?Q?9N0m2sHl0xkVe25u2XYO472bRSl3RG9mojFcSuscUMNVoFLkQQAayg2qiVuf?=
 =?us-ascii?Q?MfZvMf34U6iKyFiwXGuci8tCHKneNqVNGQGf3CEOauipzFEsDmKNbkWcTRS4?=
 =?us-ascii?Q?Y0W8lfsE3tXh3i+muIc5sYPWHFGxYRVfmWsDISrXHEdZxqH5ZRmECvS7rwyF?=
 =?us-ascii?Q?L04s0FcZz2g3CwsfQBCQWwJiIwLu+XPM+2yLN9I6W2xFBfFrjc30qWiPZgfl?=
 =?us-ascii?Q?0+kzBj4mK71ulwJqOoGHx8h/xHVPJQmu4OKPKT5MEUl6QTsAL0dZB6PS5or0?=
 =?us-ascii?Q?I7FmBvRTo0O7Fd9LDcpGWK4+6EiZb/Be/A+TdMRkoi8YTBTidI9rcpvMUszf?=
 =?us-ascii?Q?cr4wHd/JuJTys2LeLu0QNDT9ZmVRfXlLhFqO9DTfdiKbBi8k/EmXfSQx746P?=
 =?us-ascii?Q?1Fl8XzyF/VeEYfGtinzYb9TZZ5nd6+Z0ReK1giSJFP4vAz5D1fMug+zICZvA?=
 =?us-ascii?Q?qtrIaLvIB31altjA3wiY8K4N1jdKc9m48nG5ceQIGYdJIkYykwd+84HztPb1?=
 =?us-ascii?Q?CDFIMPXZyTH6wxhe8fKlzcIvJ0J31kVlA2x7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YL+MsHOGrVqaJrcLVfn2C+hXMbpuqCu4EF3sK5qUBZKMAyKupwH4KL4ivAUV?=
 =?us-ascii?Q?sqE8MPvViePQ+6pvjAzJ+p6J0P2kUXp3N5NDJW+en6swZqW+CL0u2gooJcUO?=
 =?us-ascii?Q?RNBt+Laypxy9VQHzEMUosoKNfl5DlJTSxRN2AhWSAN6q0yyY0Ltf86QjNIWq?=
 =?us-ascii?Q?rscJlg4BuLshCpVa7AapfwKgyi4FSW69dXKMLz9V7fWe4NrukMvuUJFNgIKo?=
 =?us-ascii?Q?em4CD1MDpHzsepH+0hyxmncQyLPppbCyepKzBtYFJP6fdz4l4u7nRVnSSyRe?=
 =?us-ascii?Q?uhXs0OqtLIDIQANtnl2N9dw3OhNeZAxVx7Dgk9OinjBIzoAbh04jFexfCQOR?=
 =?us-ascii?Q?wKD56PJURoTxrf7eyCHwRMO0YTOvSB3eiiEdPUozxxyYIzAuzPqw8szTDmCm?=
 =?us-ascii?Q?TKQEXC4+96HWxax9fgXf2wzfUiQt7SD9OswT2AfScRrDVl7JCGc1WZjcJQYB?=
 =?us-ascii?Q?F4PoE7Y/TU1lviWvphsbY4dQlU3EUbmf5b+qIDvoTCUdu1coEyzPNvvqexHf?=
 =?us-ascii?Q?BSP0ncdYez7haL6RvhVmd1YDxsusCDQTRP+yirnsBFtBfIYe52zNm19TlRS1?=
 =?us-ascii?Q?0gregN6YJM9p1+vE4NBlRqKETsfXKLtm+mdAL0EmS3GgiUBjpZztxykYCms5?=
 =?us-ascii?Q?97bAA9UxAiDVpx8GvYRqIfo/bXCzMuFgc6nPPhsOTWR8Yu5BP+UA6wxKE8LU?=
 =?us-ascii?Q?uzeWmvQ/YcNUvb1OAP7INKmRgs1+WMeBuo7DSXyIxh5FR+45LbvpwrL8/pNO?=
 =?us-ascii?Q?6/dN1A9PMqbk7CoymmYKpiaiMJn4qoaGow0PSjmbyhF9/KmQz84Fk4yyVF6C?=
 =?us-ascii?Q?/zBweUDNj5dTgF9k2qYkfNHoVnkojHx2KMYFK+loINLMsDwPmTJ4MhkpE2El?=
 =?us-ascii?Q?ysbDj/h2ERDKbh4gZkqlzDVnyAHrQq2a3XSyoh+xtN6YVzfD9iePgyz4UN26?=
 =?us-ascii?Q?MUCtocvhxLgEsL23OfJnIltqFuDuQiZueL1Q6v2JwCxysd+QMEGHQhvp9Xp/?=
 =?us-ascii?Q?XDH0m1l68BYPYH4+3Hdnf4a0w3HLuJiBDHPpDTMEbuw/WhrXEImOB1YRPntS?=
 =?us-ascii?Q?tz1OpaWpENkW6J5XzYHfyXQIjTthjJWZiXo2BvuclJcyRZDm1jPyeyfuL4Aw?=
 =?us-ascii?Q?OE3ALxzQEoKkRKdi32SfwRvl96B3zqkPkIomFlv57VEECrI9H1YXKA87PJS0?=
 =?us-ascii?Q?BKRhOLwEo+j6YGM3zHECzSnxruQxbqEALI4N9L2VcUWTRhMWdL5B75vrhmOZ?=
 =?us-ascii?Q?Ck3L8QVWaThYLnU5F6tYhzhveiBU/6VaRa8tu7bwCzce+bYFcURusywUoNDf?=
 =?us-ascii?Q?WlDk3/BtGLnDlvXQEgM7EF1gM0cyncg3uiwvNYHS0trzXBlaEdKKAjAFDTC7?=
 =?us-ascii?Q?o9cj+Uu9+V7hM1OxWslPYhWTCrVtwcQZJvPm/eyl6zwsqcfwxLK3MNWvHhqg?=
 =?us-ascii?Q?MV4DoeAk3Ow7HI3DOLGMxeoJgRX2ML/5t1XwAA0FB1yLy2zC3YCAs+NTd0bo?=
 =?us-ascii?Q?PLprdpPMfOwL6PdN2tQCDDcYyL2Xx9/mI/5Ws/RYPFW3kDwwqe3tZ+webcS5?=
 =?us-ascii?Q?p367IKx0+z14Cy9/ky1rwKe160Bt1yLS454LQzrjvQDkhAmwmr3WJa885fqp?=
 =?us-ascii?Q?+ZdnsrsBocBod0cG6HS3MoE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e895371f-2055-4f38-3133-08de20b7ba7c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:17:41.4253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PdkEsNAG1E+ZeXK7slTV1HeAtHTK1DXC0OXTKUKhWLFIyImbcsGNigT8oX2So3OAS5B6Un598JW0f8KNMl+hjYa9+rpVO2A/E1eOOLNyZ94xqM0NFVaoDybXUVA7O3h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7893

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
 drivers/staging/greybus/audio_helper.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 97ce5b9ad7fd3..b4873c6d6bed0 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -115,12 +115,13 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 {
 	int i;
 	struct snd_soc_dapm_widget *w, *tmp_w;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 
-	mutex_lock(&dapm->card->dapm_mutex);
+	mutex_lock(&card->dapm_mutex);
 	for (i = 0; i < num; i++) {
 		/* below logic can be optimized to identify widget pointer */
 		w = NULL;
-		list_for_each_entry(tmp_w, &dapm->card->widgets, list) {
+		list_for_each_entry(tmp_w, &card->widgets, list) {
 			if (tmp_w->dapm == dapm &&
 			    !strcmp(tmp_w->name, widget->name)) {
 				w = tmp_w;
@@ -128,7 +129,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 			}
 		}
 		if (!w) {
-			dev_err(dapm->dev, "%s: widget not found\n",
+			dev_err(card->dev, "%s: widget not found\n",
 				widget->name);
 			widget++;
 			continue;
@@ -136,7 +137,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 		widget++;
 		gbaudio_dapm_free_widget(w);
 	}
-	mutex_unlock(&dapm->card->dapm_mutex);
+	mutex_unlock(&card->dapm_mutex);
 	return 0;
 }
 
-- 
2.43.0

