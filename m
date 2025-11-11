Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61AA1E32B7
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820940; cv=fail; b=BA0m7tYLE7dw+ytKMesG7B6E3MGo+DCt98TV27nqgoxygc9ShWe97vjd8rS6sFfyNba76B1h2S9nNiUX1Nj9kXTyT3I8d7dp5kRnOhMP6v6vtOJf9o5kcgKhz0dqPbDarWtrxXUiF4L5x3EifPxN/sCAIe76+cgp237kSCrargo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820940; c=relaxed/simple;
	bh=jqR7bkV3HJSEZNAN7Q9Nstr7PGaxIjzdXeGy3uU2bos=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CQn+64Fpaa8XqGvnbBFz1pOCXaa6dmFGDcrLag9Q1V2w6sM6eKvgvOX1aBaWaKfPtsoY8JcWBPMca3QnUixuJEK2s6u7beqetlZtwVCGLWK0UMTEJwJHcIzTzOPf6ADu7PgrrWlVZKu01cmeI5ZX2Gy/yl++96XS92D/1Oz6cQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E+pSxfN2; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E+pSxfN2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6mo5/2K6DsHYTbC8AE7CuQBNn1QywEnDUDnq9Hr4MRnbS6oju324torNKDG0cSuWXBOuy3L8lDpVTJqV2y564HeOG0bj6uUl+w8U4pQWGfnfKJvslqdds5FZsFSCVLGtIFitcY+8nT7l6VLKVQXFIETdPCaMbvIdxIrwZ8M2TB2+SZyKm+Qsd8AD8Ii3dY2fMAegyzR82N8GSFkQY3ZZa9jzmeROJESMzzaVI/Ptgd12cHUGTbCUczaHk0/5VjxF6o73JsSCg1GRIodfpxShJTsMpq9Ph+y16JfEKZpgYQwLLx9SlrwVv+bFxraAKIFNoxQUWvxkzodPTlgjNiIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNjDwnrG+d++qE0usauEwVeK+2Ir6mv0Mq2nbGl439Q=;
 b=goHs+y4W8tQEBVyCwZTjqGq9C5pyjWvgFfEScDlekv+qnJs98VjkehS9mrq7sRnvOSjx44ZtbnUgPPLQ1ymwgttY+uyGIRWax56Mr/f3KdlFKhanwbCpzh1KqFM5MKxTIgbuCsu8EtiGf33/4smAXUXCXP3Vg8Gzpb4dhjHtyo3aQaKEXCAlFZ6/CaRANdpbS1lu5yqR7+d9v+fNc11UyDugShWmW8+k1LbLYegMisARCGiKos62PdLNBcNpLlTAtD6GAaceH0x42KP2kuSYfqycG1VFXLBj/EUHKDALkw8bwUbFpNacs7/YXMNTHbM2BJ57nMJvFIjxfJn1hmxFcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNjDwnrG+d++qE0usauEwVeK+2Ir6mv0Mq2nbGl439Q=;
 b=E+pSxfN2iBE5bj/zEYwKIZAuxDwldl6rV982eZ+K+bnir8F2XS83z6idmvURd7rNYrtfxCRxjnfXv2BUqG208yDm8KJee5QrThW0RMwS5BXVKMGKEV8CI2GjjaezxnUbCIVDJfEi3s/lU5vDYTRSl1QeD1eiM3YveaAx1M0PhRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:57 +0000
Message-ID: <87o6p9za2e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 166/292] ASoC: codecs: wm8804: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:57 +0000
X-ClientProxiedBy: TYWP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: ac55ed21-0ef9-4edd-d15a-08de20b94da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BJPk6hKuZ6ZFj2XdR9NLAw396gWe813f0L9qiduxo7XLqxY0odSDWMSbmVoB?=
 =?us-ascii?Q?Y0v9WsNpgOl3F9y+d1sqwykpH12OU2YUlEuaKNYJDEelqQ8XGBgyS/Y0pvwU?=
 =?us-ascii?Q?8RVeWl3bzsGS+xbA2kZcUshTFlSKqYX3zANJDDSjPGjO1i/zp/g0CYQ700Ye?=
 =?us-ascii?Q?ED2rmnFLOR6W5MTRMJeL+y0R4Bhce821QhgbRFUi6kDkFlSz9uPkJBDWfXGG?=
 =?us-ascii?Q?QD2PeDPlS0mbSmo7CkEO9TLVcGryG/icJx4gKzGzqoznnmIv0QYCczhfbHps?=
 =?us-ascii?Q?95l2Lp1LWW0ELyyHWFZ3sDkeBBOXHL8IwOt1T9t6Gl/bAOEjXNV/PE1u/fej?=
 =?us-ascii?Q?jhb0xX2/Rh8FcVUXbflyyO4JqeGrxy5qqZ1ztWfNbTAtgOxnguZlYhJ7hZ1B?=
 =?us-ascii?Q?8L911FLiihVDj/RqAnVxzqn47KBtEagIAo8sogPBtwseKLjTsOWvzY717bEN?=
 =?us-ascii?Q?+NyWKUtjowjv+Q9LznK5J0v4+F2x6pgwSQeHQ4UAxOiFgTPtWKB/8XVWTLKM?=
 =?us-ascii?Q?LMIXjYZMEu2pkdRcQMNWqOYzdaODYO/cqoAdls+ipHA2GRz3Kdqq6tsO1tMs?=
 =?us-ascii?Q?H3R/8y/afy/luDVOCoEQF23m8PnkbRSnO7CSaTb6SxqHsU7xUC0Ux+gkTopD?=
 =?us-ascii?Q?nFEVyHm8X21csShp3CO9MT/2WsukfT6R0oFEz7Cl9FgmjxHk8PVuBoI9oRPc?=
 =?us-ascii?Q?XBdFvK1PmKXm11hJpcqfwMxKbBiUr8PslKXwlCTRVsob4qj7ACyqbr53tm28?=
 =?us-ascii?Q?Chj8XVpQLOt//d7xu3Z+3JHUBak4c5jJrayIIdYsMnqx4l/IqLkcjUbBksk+?=
 =?us-ascii?Q?RDftfA6gL/Z0s0e6pSUzy//ql+Semd0fQjg6o781EhMa3AdfMIx7MVZ2+84P?=
 =?us-ascii?Q?4xYX+naa0YrlYah5QjiNE2/gmrycntBmOfc4ScCGv0r06wQcUKps1uVpKhv0?=
 =?us-ascii?Q?xTkFLjtaqub190ODuYCo77KS54qGPOeG02cX9hQKcwjhOvqyw8dfLkHQze8T?=
 =?us-ascii?Q?WwwGUM77z5MEzEBI9CxQmB0434lnwmCcoRYuIUtSMNmPZSDBnWXiOCWe9m9r?=
 =?us-ascii?Q?mJuvMJLlJ29K7ovAL67ENiWFl0JsUksmyNgscS3YhsxzotM2SfdJ1GVqy5O9?=
 =?us-ascii?Q?AOSTt0pd2QM3Y08y3XyGbwgasFTriAZYx39XdEI0+eFq1TeEqs3nRcFAYEnR?=
 =?us-ascii?Q?st1/DUMk8q30HyrPA4Dbp6TDk2Zamn8cisrorio01IMYRBw+s7jTAbPZdjWk?=
 =?us-ascii?Q?wt2qZBON9FsLtmPISEO4teSdsyQwqDeGxaWyZpXHo9XXVF1j51sZARam/UTW?=
 =?us-ascii?Q?4F7n7rZHWu7GT8BJayM76f76b+O0GIUMmscD0cQ9+eAUE4jOiLttfJrPUqYh?=
 =?us-ascii?Q?F6a5fBbLdesXb9M0u4oIW85+/dNnu7C2i56O4NbKmA3PplIrrAcCGCjNx0sg?=
 =?us-ascii?Q?p24K/0xT1ETRSo6dfD/jJCyk+4idYY04xzuicVUHPs2Ek/hdoeR62HUHdMxs?=
 =?us-ascii?Q?2cyn840ZOUR4TUznuGws3497eE7lG22BQhty?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DgB8lSoc2Q0HQHSpQx8UyMovE3I2FHSf1uX/RnxUrfkMCdazfZqIKdIUneBb?=
 =?us-ascii?Q?Wgrb6CSgPl473l6/G5h/JjY54QSjgE7a06Lx/JrsKZAU8/fHzQmiOXFvdf22?=
 =?us-ascii?Q?wc+Dea83w20RV7aV+9Q6rlBIG6Cn9bJh2mOGHNWesVTA/fTCHufqOaQ5wMNa?=
 =?us-ascii?Q?62YLnyjGGk1MXseBK1FnFYdJmqpMuCexAI4jazS2USRKSgB2NtedBIor0f3V?=
 =?us-ascii?Q?AT5MA4LVM15ryESaBdCrmmVXmuanxU7shg6nQNmuPYCbHsSX7Fmc8GBxrgQt?=
 =?us-ascii?Q?/JjcOpoo2ZXvObUMD2JgXjHOVI2vS/JarxFJc+k1VVDerrXkb06MFs6JZc1V?=
 =?us-ascii?Q?qLC1z+PJYM2EePaS94xD7RYvGai6Vn/gN79CBAV/6F1RkB2/DF+J7R76qZ+S?=
 =?us-ascii?Q?NSyZ++3QyU9D+cR1dloWHwseuSwMW/H++aTAntGYgdrdDldOXCGplgKzrx8T?=
 =?us-ascii?Q?AjB88LSw7dj7i8a6MbTUaZ7ZjGJLDgJ+v6kZn3oqwiao3VLZjs8k1+OFteJf?=
 =?us-ascii?Q?Ve38ozcGwwkVsGQkB3VnTJeRjO/hMZhl4Qc7SKqmaJqT5YrEVx/C0OFBZvcL?=
 =?us-ascii?Q?cd3zA0ACLCrDXaWbiRimwInxXB33twrq67CU5O44DyiOMyNkCXnmxGiLKKDU?=
 =?us-ascii?Q?WidX/jhpyHOIU6B2LEC4ZQmHqzDq5wgLHc2bHEEIi1mR+E7jXyYwZn/VtBzL?=
 =?us-ascii?Q?8dG4RWxTAciY/+/XFyyAwTeprbk+BRS261Gc0KxtmJUBRv7s30MN4XnY9OK0?=
 =?us-ascii?Q?nCv4YmFgI4i6Ieb6rnTKqo7uX5hL3dxNzzlEqiOX3qSX518KnrlHs7lCMOx4?=
 =?us-ascii?Q?qAQjOsj3dLbrjo58HLNhQAPtLCGWN+YcAo/Sh/VMMqF2afkZSf45C1RrnUy5?=
 =?us-ascii?Q?N1UFyCcsOBy2XYXHRBodIzMuiwX1DerfbQjAaQ2lLpqgVK9AcW2dIOM8Ymib?=
 =?us-ascii?Q?qr7wuRxcmHpheINlCisKJENMiFda60fjJWGu1niVaLr8gAJUk+Z7kq1TxRCz?=
 =?us-ascii?Q?55QyK7V+bE71ucP97bys6IqNXvX9tZr63oVtLmMh0IeyvJ9yPxkWD7h02+Hn?=
 =?us-ascii?Q?G23NCvt70XrsepiZOC7Mo1krwmUU9pHAFIC+bgbmGXVaiKWc6Hg9D2s65MmA?=
 =?us-ascii?Q?YYFzUXCfi/Fl63abUEJKMQdXpnaAwEOU+WtMnXv0n3tDr6wl4hR2vQSEHSWe?=
 =?us-ascii?Q?OQSNTPajO+bHlcobBA8EaQ101bVBVVVk4E6GJGAYknBaG8pKPxMUuJVt5/0N?=
 =?us-ascii?Q?UdTBYAFuyPPPWMjnjkHAfMqIb3JIe7W5CzJsfVT4lnsYcuvFAFBtwmFvqBSU?=
 =?us-ascii?Q?k9r9tAmQrY5SHgcl2sAaBFimh0emE4357VD+eKY/oLzX2/M6nduHmO93nSph?=
 =?us-ascii?Q?M5vOKuNVIZ4a5lRnAQRyATznyA49Neq/igYy947dZ/XC0cvXI5inMPWzSwzG?=
 =?us-ascii?Q?Aux54gcLaXZa/cjPeQgkkmgoaP8xGeWPMccvBkxejrjoOpM0e/S37vmN0WSu?=
 =?us-ascii?Q?tqfS6Lzi1J1Dm9Kw936A13EtUuMG9wd4WbSJ+CmxSwr8Zuk7c3jaa6LSN4zP?=
 =?us-ascii?Q?gxDagyKsA2bvjuhkA0GEGh7qvumGMX5+pmdqAW+q0Eby3P0agjfaFMIkTmhk?=
 =?us-ascii?Q?x70rdvR82uZFBWLYPQ4t33E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac55ed21-0ef9-4edd-d15a-08de20b94da7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:57.8541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfGgv5TysTzUgPH6Y6LruFquS7VISGlZMO/zGwJUc14JMOfwelvPe9KbhirJaQooMJfS6uOZVy1jpK6C6y4/6nucaY7iJB4N6S/rckp+g1euv8jfiAqTX4b1UTuMDf3o
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
 sound/soc/codecs/wm8804.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8804.c b/sound/soc/codecs/wm8804.c
index 48700cc25cb08..94aa3c8de0ab6 100644
--- a/sound/soc/codecs/wm8804.c
+++ b/sound/soc/codecs/wm8804.c
@@ -157,8 +157,8 @@ static int wm8804_aif_event(struct snd_soc_dapm_widget *w,
 static int txsrc_put(struct snd_kcontrol *kcontrol,
 		     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int val = ucontrol->value.enumerated.item[0] << e->shift_l;
 	unsigned int mask = 1 << e->shift_l;
-- 
2.43.0

