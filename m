Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8039217F29
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821046; cv=fail; b=DS9p3HezDvpyTdTNAecVrqhF2TKUNa9/H3hqm1fmhgXPfhhO1AFVdgkkVvKM5nDxBy19s6U9tBvwApCMxsHGpbiAvpc0aiZXI6mrLe9sAbsFS3kCVClvpEPuJxBme1k16y9x/QozvuBzpuxMGCOkfT9WHAII5VaH587x61Bu2Co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821046; c=relaxed/simple;
	bh=tgg52FzWiNF1x1yQ0MKal3auWhEMlpTWAtK03RD4Hag=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HArWg+iSlsYoAuRB4yzFGnjFGEPCiQ9qiHEslBHUbzdEgdpvikZx5Yi4LL6UBl8Z3yF7U58nCVbVDN+dsz3rU0qnwy8ku0p0bxAudyzOxw+lHOxsRtzTX/GrHEmkdJZ+y4RKNlbkamT4hN+yqRun1A3bFYvRs4vgmUBoi929YUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Hx6lxwpY; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Hx6lxwpY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvAC1TGKgxBt143YxTktkPk8jT3L4or1ucWCykQR8KwCTndiAovZE1ILtA7FZAlj/LRAxmScLYowzRt78zcVt/lhJ01K4sIToiA3cvXjRv7gQaWB5//nU4ah/IuMihcJWOzr6BAnoNGVpmNENKEBEtUELGqeUNhNazQ6ozY2BMh/wM3D8RblfP72y3cjdpSrQ/qGBkkX7tZdl2Tj/qBQR90N7oPGkWL9eXkGSLicaKns5ghsQmoK4juSKNF2weFzjrq3c17uX3VVCJNsQujKJ6tiFW7JfRn2bBQEd2qQKUBPZVi9VujHqBp8MRitfdLqqrdtj62hL4MU2Ev43c+INw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8wdSIwzmYNFFytZxGioWh5A0dchWUKvb2+a78p3/zw=;
 b=hflT7EYzmMcTKCNPumvOXUELuY0Aa/bNcP9b/jcJEM/28NX8QjjyjEEykkAdc5SFmTjsCCNzzczYtwnB6XtEnNGCa/WP9hnco9SXDba6/RKSmz4K86I4b/ZQRhm0TvkHhXR3RBr0jP6YIDIixBXghFaeDROKifGMSmRg7WXz4Penw9BbLpceWYZUqrQdaNKAzJdNA4N+z9TVkvs9JOU496/brc0CGip6eUFm4VwGBnk5yi+MzYrPaKhyPd6wWMVFIzKgvOvFFwdjfbY9MBuhR/p37KlooPGcpz+goosTGg0oqIMktpDfUURbpf6IFQT9LgACcnWi4Is+5xzxswIoHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8wdSIwzmYNFFytZxGioWh5A0dchWUKvb2+a78p3/zw=;
 b=Hx6lxwpYO3QUxiBzSh49jUpOYj4NwGvqkSmJYIqCrKgBdMK82+bp7ON00v0kmh0ChGju6Ym/H8+5vNXABGj3jucDdq9Q+RoEIJTjt8yM3fAPLn76WxsQxLgYbvR7LNKfRBEjJYhxirF4J0v7rd0BtZNcTXlBLPO6jtsY2wX13DU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:41 +0000
Message-ID: <87ms4txvf2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 192/292] ASoC: codecs: wm9713: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:41 +0000
X-ClientProxiedBy: TYCP301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 0498e770-93bf-47bc-5783-08de20b98ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e1C7QR00vqs475v7aKcGEfrNYiXNpaszYqUfFVq5fMzqaYRW4mCAfrgQDKNQ?=
 =?us-ascii?Q?sRu/VCqX+sErU35bUWCzcmkfTkIgNtNkbTrZSbUUVWtgWlIcHUrrNJFE2TKX?=
 =?us-ascii?Q?EWi0I8ufAeWQ2nJzPZVRSv2ZAgwoS/g6Och66NfKWBXAP4P1WvMxPJ86orTh?=
 =?us-ascii?Q?c0YQUHZGbt4IzI835XQGM/XGUULKHfRTTHA0wgi79qNKjFgmH6B5kZNebXDp?=
 =?us-ascii?Q?cmRnDpJ4aV5IMgfV/NBiEf6DRo/YJakAO/MZfgd/n69rmKdrZEgM/sSjoUtr?=
 =?us-ascii?Q?sQKxFm2Efzzi3DmETfR1AS+wXkIV4c+sygXfNBWPtUefxTvu4DpP2e2x8Ynx?=
 =?us-ascii?Q?Lb48IkWeeAj3BDJkdFYWXcwc99mGpT5NL6/Ou6rzOjBNFvgSwtop4LwX1v/L?=
 =?us-ascii?Q?pybB20af2FvrFZ1VGu1tS2B/zKQszzvYHXpEp8+tWwWAoxxoxvynbBSeY33f?=
 =?us-ascii?Q?rRp76TGKfHQdOdUR2dp7gZ/nWtiPDQ88Gq5eAfqbBTGhPdiHheTVdV2HpeL/?=
 =?us-ascii?Q?CAjEanuJBcGx3RszIWUtPyOgp0h5clfnD95aa3FTgCGxzSjC1MbVQfyU1X8l?=
 =?us-ascii?Q?1W2IrRcBxObU4h9D374XbOHtKM+bekV6ByRB9ikB/MPsBldxrXRr4M9BQksA?=
 =?us-ascii?Q?hj/cJTugMhJbzJfwY4rWe+SlPMRLHE/IxmnbJPH/uDppXxz3Bt+l2WU42sJl?=
 =?us-ascii?Q?yXJReTaV25Kp2t8usWN/1RMSq8eP5izVWM/zIVCMi3HyRLsnF6L/8nb33rrp?=
 =?us-ascii?Q?8Oz1mtwZy2yWPsj5ewMIeGpNG2n50OiXeLp6M722CysSAc9vuJMvGn18MmJy?=
 =?us-ascii?Q?lTFcMOOT2kbbYZiwB8HA6JD7nVIp5sUmf1WJVS46++GQ9oV/87kcMTMfBAun?=
 =?us-ascii?Q?Q2Kg1jpRlm81KipphDKpUMJ/GrDrLthwez2jwaC8ghMADv/R+YkTvU5K6/de?=
 =?us-ascii?Q?ok+42uutKHoWOvQfU17mFUpHMU7gons0b36FjlNBh/YueE1K3gTbYV+pGyhP?=
 =?us-ascii?Q?M5sC88I9KOYNGrtkRzY9FiJOv8OmDITB27BAiR22ceYf12OZZhgCa9UD2WYX?=
 =?us-ascii?Q?n9NGlM59zefrXUegwQohpVVB3poBvQWy3WhC+IJ7/nfAb4QhczyfF6mxd8VR?=
 =?us-ascii?Q?Fj02V4y8zrJnXio+lrdIyr66Io5Akbj1v+aP895aqE8/WhUpmtgUGff3i6+7?=
 =?us-ascii?Q?zZF5bd/NAOYTeh5LtrlYq9UwNYK+D7U0M87YKqKYkPpExXREBTLTaO6wUuQ8?=
 =?us-ascii?Q?7nVX74wRSQ4ayGe1GiNjGWi6Gy5woa7KuYLh0TTJzG8PFeNHnlm5HNmWl2qi?=
 =?us-ascii?Q?AMyDdD2+/ikEduk7REz30sRRXjW0cIGx6XX1pKei72n+01+iJuQ6q22p8O+M?=
 =?us-ascii?Q?BiEZzVHlHwMhNzKidMu1XONRPqiYTKYjzO4Ij5Pf966ev7vEGQWy3gVod9/G?=
 =?us-ascii?Q?cy6lJcX1gCsxpcP8fEnIl4G4sKlcna1Xq0ytdEIkwP36Umu4kB8EO6wzxkwO?=
 =?us-ascii?Q?Z+gX1Tq6XptYvo1iKFOiPwBwYYvukV0eFlpY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rdjgut53X4XNhjB1vlc40PkjCfA07ZjzpebTBWR8+KPPsDGlq2jggYx01siI?=
 =?us-ascii?Q?CW3AnpESlyJT7lt3zmM4fkPB7ulIwTBKuzURzwk2kkCtMpgv28z07B2Bzk/g?=
 =?us-ascii?Q?+bqKnaYGt0FOPqozKPREziNNd/Z9CEd2aZmh9hb+uwuQakXKjmWy2nUD/rG3?=
 =?us-ascii?Q?KvXlY4WLdrbw6OyCIvphxTjGBoFEdl+WeQeJ+p3cOkykP1gA408ldqWDVtCl?=
 =?us-ascii?Q?jNqVplUwE2cgcK1nLt5WLJRGngVY8P3epC4OFAJPEVkYG6ftB+agUE2jZpFC?=
 =?us-ascii?Q?H2Q3WdgDcvAbwCtDYilTPZUDzgOS4miYmhvzF22Cl9GJvD1aB5yS+ueOpHI6?=
 =?us-ascii?Q?2G91ERrNRw4XTcvBN9wBUICIadxaeH0Tgheu0RQReMrj9G/K0maFfcOAthGL?=
 =?us-ascii?Q?mMfPZD94Xz4P9VbANRR3nHHVQS4Hl1z+tq9HGdZL3tuxqSs8DHm4D2wNaSgC?=
 =?us-ascii?Q?rOV7QagZ9Td5LusqgHofE8PPON8tR8bMHlUYnA1gxKxFTPDiQrqmhZdy+hr+?=
 =?us-ascii?Q?m75qPJC8f8S2sR1O0axRGdkQToQFNgjh85+FwN2nvNLI+YcjdJfgvNuTMcmV?=
 =?us-ascii?Q?/MHa7YU3Dzj84z1La+YBWxyNUyqieqbXfHYJiP45me9BqYyVWu+hYBfPwHT6?=
 =?us-ascii?Q?gplRFNOp5rpI4ArkfEraJjfQ7a91HoYOGa4SyFeZO+Yxx6ioz5qXdQoxSlaj?=
 =?us-ascii?Q?Idctg0fYMEiAElzJ4D2RrafebiEEoS4DQwLxpY3GCKCOq8s/225n24AxSIga?=
 =?us-ascii?Q?kJqtJakCiU1YFP4mcLTvd+0CHKjkc9ewk3pzA0hCRjiKca49W4vRUurgyF4X?=
 =?us-ascii?Q?VCW99jEaauOjObqTW0ZBeIGpDOihJ1LnMqiTGvkhxd7zqMN/YqPtXTE/aeCd?=
 =?us-ascii?Q?Xd4ZFtG8WlNgnlTHass8zDM5y2TQ+zE6ArzE09PsX7CRZ1umHxRforKztQdy?=
 =?us-ascii?Q?buqoRnblnxXESRtGbukkmLyqK/sQSerJFJNfT5ZJFs+ZnjpKkepk0lHQfbRH?=
 =?us-ascii?Q?pqX2exRBOjGA3smipsizbd6zkmKlf14fStiWQMiZBPz8ueS2DAuPf9DuxJPF?=
 =?us-ascii?Q?IJe6zPqJfH5eDdazlSCeM0fITlCOBokxADw9QUTBQavbVw/sZsmZiEXlDTV6?=
 =?us-ascii?Q?1PBJlXeHoN5UE3zGtQlxpXRq/XQcnfeNYpCERFpZmIUS4Nfn9JIcBdBajQyL?=
 =?us-ascii?Q?WQq2+/ySSVY/wWhJcK1zZvnmkjO9uqsVXoU8XzMJtyzb8Vkwbn8MPHWE7mVE?=
 =?us-ascii?Q?pvaipBZy/eoM5CVtaDFtBMx8cA/8qSnSK+IEY0rdqlk1NJdKRaxb9JVbnJcT?=
 =?us-ascii?Q?Glomh33nAfLxdaEQeu0TZNFy2gbXrGKnLydQ+sGc+TDQstrsvT5NT8QRVZj4?=
 =?us-ascii?Q?bGFgaOgjIJFM3a1PU94Ah4KZsi7eHphwDRaBKbWejfbSZpH+D8WCPbqgJiD5?=
 =?us-ascii?Q?UFw7BceiSGBX6Ulvr35Sj/asgyW57+O05RRsZh4Sc33Hsn211kWwO/cyz/Ll?=
 =?us-ascii?Q?FugX8mu+8nvtBI6SeBG8nzDCk843mVnm8kswgUggu6ERRbZcAz+i/wueXc75?=
 =?us-ascii?Q?dYEEBSVUiJ88ZN7hI3zLOChNehuVQrc8zCkmd+EIdcMlgMafsN6yuvGuwou0?=
 =?us-ascii?Q?qLF6kxtmtb/vhtcz+oxQ4Kc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0498e770-93bf-47bc-5783-08de20b98ba3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:41.8387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjC6qopMbG6XHGvQ5lQuhLC+PpMZ4g4e3/8wu+O5OY9DiYBAy9WqTwCRbUbuHt0+jDWy2Lda+ld7CrXS3aq2GRv2q/h+YQbOv9KokOihgJajwwzleZ1oCWqKvdPhnrZu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/wm9713.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index 5f1b0f5c1a588..b3bbecf074eed 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -224,7 +224,7 @@ static const unsigned int wm9713_mixer_mute_regs[] = {
 static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct wm9713_priv *wm9713 = snd_soc_component_get_drvdata(component);
 	unsigned int val = ucontrol->value.integer.value[0];
@@ -268,7 +268,7 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 static int wm9713_hp_mixer_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct wm9713_priv *wm9713 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
@@ -1176,6 +1176,7 @@ static int wm9713_soc_suspend(struct snd_soc_component *component)
 static int wm9713_soc_resume(struct snd_soc_component *component)
 {
 	struct wm9713_priv *wm9713 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	ret = snd_ac97_reset(wm9713->ac97, true, WM9713_VENDOR_ID,
@@ -1183,7 +1184,7 @@ static int wm9713_soc_resume(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	/* do we need to re-start the PLL ? */
 	if (wm9713->pll_in)
-- 
2.43.0

