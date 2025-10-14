Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263F3090F7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415702; cv=fail; b=HZ/AIiLXYK4/Ie/h13EUG8xEamzih4E72zN6Wx32at9fIehLFM2hg7vim+gJ3t6AQm+uRdmw4dAjucZKlQSx1+tP0oymbiQLrFdLezcbdJZSP9xKCGmo798h3z6DaCWyJNURAPb9jjbKf1wapqHrdoF8KsONwANfCIkcTMfnslE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415702; c=relaxed/simple;
	bh=Ta2ih7nyRhC2QEw3FEIYbXIAnGWFBePpb7jWKGAc7NM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IDYvLxBw0WcaryD0irZapguH1yvTcW8jqdGQp54+X+Y6kq8wQER+54ZAPVEtXfJGwAaMWpUINlIrBMJp6nymkpFZ3cJ5CQbeBumHj+xSp5all/DMNS48crl5QuMp+bDLUpNkhjT/wW0IdtjIApWwxzNqUwwWGkL5mY1bL/v2MeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jPnH2KBM; arc=fail smtp.client-ip=52.101.229.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jPnH2KBM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dx8D+yr9Dyc0T1WOxZ2wRGvlzB8ChWxEVxNNCmOuIZBAR9kCECiL4+uR2KTGRn50GK3wKLYJT4Kkq/sCexa8IKjuGWAdMp4Olg7ta28AuJ8cE/YRD1o57JOvjGQZOa4x8EI0yMWt8p37Uh2wmU2Z18iSdrCNCDF4N0INxThVdN2H4cS49ZIOOSuXgSgv/sjYFWDAsJD7I+8QF5eZG4iAjo/sOo9uDZEhLseDwQzMHp73lM74w96GZ6Z4A+msMU6Ic+Sj039jYm6XHAIgIdXc+P/qVeHRRT9rAL2oUfKacgxCJUJ8P581zfYor2mh9q4FxiOs9kg3SPxrSQ52Xjey7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kf3gGDLLwwgZF2TQSfdjckcU0Lxp5zUIoimkeXRmT3o=;
 b=qZbsrpLZRHJHN1FB3C6VoC0ucyl+QtOLgw7x54QQSpD9vEXf2lRHTBqtJXsViu9W3xgUgY4QVNMxsXx6N4yBMbdF6Rf5tSgFUo6djiHV404UggblvFisQ0Z2WqkGXvGjlUKPZ9LSGtaya+PQdwiAQwl8xVsTaV3IIgKBOIS4cWfkS+95eyF2/duULrmxAB/a2Fv6HhcCYoXT6KduCbB8J0xvpl5YIggA4ydMbKT4gelufPnqufvugIHKX8YkDdDOcwm7Fpebmbf2SNAQD6KOkpFcZU6P8cFk7imWsDpkODUubr1Pu2ZBCES1/F6h3zcKQGefkeJ4WQ/QP6vcCXnRpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf3gGDLLwwgZF2TQSfdjckcU0Lxp5zUIoimkeXRmT3o=;
 b=jPnH2KBMVE0ZqM/z9tiL6cgW5OuHUP7urrCSQUVVSfG0YICMr61hm+TLzQA8V74vuuEqkvKAlI2Gi/20hacYuOnQgVwEAl07EDF+3jQP02FAjHIjEESDQwyQcjKQrDdsKvkD8/cmpL+xku3XiAfkNlINkNyhtzGi3brLBhF/TU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:37 +0000
Message-ID: <87h5w2ru3z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 035/139] ASoC: codecs: da732x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:37 +0000
X-ClientProxiedBy: TYWPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 329e0491-97a8-49d9-adb8-08de0ad92ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fQf/DAwWTKejH9gYXU6SIdHCkbDIDjr6lfmvrn1TjT4Zh8whXdEA8/smKmpl?=
 =?us-ascii?Q?k9R3E7CpO2VGPwVfYAXjIRkpbxkIgupbpeTEN3XrJfcCbllDTsi59L7Gjiwm?=
 =?us-ascii?Q?frlzYu4jaEpISOXMAQFuWkOgNeQAELPBuKe3KTK8wPTncUJnljvrxKnGWBXI?=
 =?us-ascii?Q?zR6LloMNffLTNXoT4dMW5x1v+AB4edpsb33ZvcjURKt9aRPKqF97huCiUhcN?=
 =?us-ascii?Q?o/g1p8b7D8AHSPTG+vAswuCpl21rZmxTVl2uKmbylHt5pvHqrIo1yew1JtaJ?=
 =?us-ascii?Q?8/cWaeGyWpLmieZfCwFpUb3LrpxEyHPjXW4T9RVeqWyeYmfUWdO8/O7vpCVp?=
 =?us-ascii?Q?ONdEDBET4NRObZoISR/tgytHz4KdjMpEvNo9uAm3DmGK4NaLHvh0k3HL69TR?=
 =?us-ascii?Q?LPtfVLu/vZ5uNivXlilLIpoeSQhjVnHPuueWSR5LXD4J2n2gSyKMPavk9EVY?=
 =?us-ascii?Q?UieTwMRivjBUyx95/S8/b+plh4nzwnxwOELlaNSmntYOEXkmSM35iw5ra9Tv?=
 =?us-ascii?Q?/1Kf165oBGrq46T5ZY6f0gI0Mg8aik5j7ZZb9iLLqE4TzYE6B3q3Zm9+BOVM?=
 =?us-ascii?Q?K9cy9PKOeOUMGsz7qqSW/WNS1mUJLinBP0oWQd2MRMz6iUZis/pUKxuizLoZ?=
 =?us-ascii?Q?zjXm2fr4W8/VyK9vYkb37NhyIbkQUsFzcM39VSUQZ9wr5MwLTCun4X90Segy?=
 =?us-ascii?Q?fhqB6IaZOePUZfqfMeHfjY3FlN2YENrqH7rIzmzzGcXSII/flRcbLQ052vfi?=
 =?us-ascii?Q?dlL1pjZaKV2m1LypDAFvCpirrp1lY2+cG1FAwbhYemBkqybgIVrBTx5VCAUF?=
 =?us-ascii?Q?rz4ryZWxhQFMjmXhLLVE/UyMwdJRGpPNHVzz/XkI+iRUCJaoUAq4lJvAPaXi?=
 =?us-ascii?Q?E7r0SUQ0Wgu1NOQJgnK+9380fWE6s0JSjOK+9zxSSAqnJs63G+PfX81uxqVV?=
 =?us-ascii?Q?bt/TWAy4pOOsytVnFDEwdFIsbsElAe/RCRZZAsuC/zx01kbXltvpV3vSJ+Ax?=
 =?us-ascii?Q?S5rMxM6WNwxdbgUx8rM38MZvuDTsrN8zRG+Lz7HyacTzFNv5qkNq5uugvVBO?=
 =?us-ascii?Q?nBy86R/CXe1X+XEQhybMIcCJ82lxwkwvfu9LHdS8xQUbilI92QWnQ3fY1KF8?=
 =?us-ascii?Q?1IpbdYkIVFcfY5M7UPyvmziZAnT9FGPjSGNZkyeOGJJ0OpKv1APFgzHMD/0i?=
 =?us-ascii?Q?jZSJcm1A9X3VL0pyHM3bGeRxpoFDUD2cswC9lAMQGGE53ZrPPgg207m13N1A?=
 =?us-ascii?Q?2ho4hZhfJKYyKiBi2OsUs44TeMLUdCvEqLKWhVX+pzy4sBCfgEQAL2csyCmt?=
 =?us-ascii?Q?3Zh/FiQt69kWnhd+hrGBWSX/sOJ78REKCpadale/y7w/cb3157MHsN5ez+7m?=
 =?us-ascii?Q?yc5gZA683lo9Vtz0rN6LE28l8WcxCp3CX7/B+wtmt3zcxtNzPhbUF2uQGRp+?=
 =?us-ascii?Q?kzRXEyhAaMb8/ozUbOm3s2h8nqY/Hr5pmB1N/rW9A+NOYMV15CVTJSDsxiBn?=
 =?us-ascii?Q?CdXCawKOF4fjFD1t0rbO4h0W+yDmYVz7TsC1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H8bGLJvG5Njof/uzH/r+pQiArFJMJqQpEQLV5QuWdIBi06ajbobWPh8Ye5Tx?=
 =?us-ascii?Q?78oPbp6dpXSJHZOkLYBCnAMb1dya4Zd9LwqOl3VP+UTuT1IYXeHMexBC4mXo?=
 =?us-ascii?Q?efuQ9GaGDkCzlqyT1qnIFYruV3DZ5CAEQe1lGevmYDEG1ubigWPgsTxGyWnY?=
 =?us-ascii?Q?1/Q/IqXDFky+C/7lDNRjPtjihpb4Unblq1V6gl3sHz0WEvZrffutdnDQrxtV?=
 =?us-ascii?Q?Hk040nvgzOXs20hX7cNfdVTtNLpKGcHzeVjWRwuNuuVi6Rt4+9TREZs+nwVg?=
 =?us-ascii?Q?k9PKEnWeX/8wfwJXEPnhkgZQEEFJGr6Q23kS9NYxas7Ts5sh3eS/z1XgNGjL?=
 =?us-ascii?Q?HtizMvzZ/fKtcyeRB+cE2gR+q4zlN3P9WMYQwPXVF/r0ag6dgcj2c8f7fybU?=
 =?us-ascii?Q?du7MU65RUCUDrOFX/p89XDmNYefoxfAKVAvzdLexqG9eVuoLPgWChyQ6r5bJ?=
 =?us-ascii?Q?Z4GPEIP00aJBcm/ev6LbtF+B7i0NexeYHSo9FBgvotz9IDMUGw9ssABX4X43?=
 =?us-ascii?Q?njMxQ0qk0qGZyBFjU+dHq0+7P/R9SYKfkTSJc41BR6d9WPcIkHz6i93A71qR?=
 =?us-ascii?Q?qKYeT0ykCuff6Hq2+1T+Lwh/0r3l34cFr+CK28fGCkqYaVyoOxXmqZjvc+L7?=
 =?us-ascii?Q?WXOwQ722SrMFgWmdDaIzxxyykO+UXDZGe8NN35ddvX7NjpgNT3JZJA0ONWC3?=
 =?us-ascii?Q?W4hW7zRIRPYPoj4J7yFUY6plkjqQHaYtB8PdTx1Ja7Vw+Arx8eIBQpBthzlh?=
 =?us-ascii?Q?+G6TlTG0KOkC+5u5fYPZXdxUcqH9fO1C3d/C0wAA0geINExwcm7M3vDgX40n?=
 =?us-ascii?Q?/npmknfpPJW8fmqMYHC/BADJrb+7LDyrDc9VGDZTKDtnfpQvK8+whup7DEvn?=
 =?us-ascii?Q?9WIuX4uVOHEFKllihBH2eAReubyIEmQcgRFKq1g/3tD3Iu8kJIiRI31P8WuE?=
 =?us-ascii?Q?Vwe/ObrRWSG54ReY3t5Pfla8PyHf8xH94sGAmPrieinluR5j/TNLS/14umTs?=
 =?us-ascii?Q?v/mHYxqG4nSDqJ+RFvDIl4xGVMJyEAd0UCGNnbDea2MaRVAps61YQ5SYWRMA?=
 =?us-ascii?Q?bsVnWhA0NyM6B5Rkh5jjHteMlTJT1Fa2YRBU2MFSL/WJTHKpHKd9fk1cLhF+?=
 =?us-ascii?Q?5eVu4A2g5dM3c6BvSKarg7RGwT25K46I2eExXSWfOuatIDSKrdffF0MvqnxJ?=
 =?us-ascii?Q?SGcNwK0TyIYwRXLhXUpASZRsxSeoIHpf0ZjtWpBwJOVy5ERBg0MjGA7fD5S1?=
 =?us-ascii?Q?KhBHDYrbsaHdpx3P+OZ38AiaiSaVJiMlZrGSBtI0Gsc6DPh1AGMfyCIAlhH0?=
 =?us-ascii?Q?8AgxAxS/SzrKcyJaJhYy/du2elxULnBFCMyPdw1pWd88IP/hQp8gYo2+NtQp?=
 =?us-ascii?Q?/nanUlyPqbQKP0RDtMBmsmPf4LkkpfVJp99LknaGVD1r2YY/J43jooQDrxHJ?=
 =?us-ascii?Q?pqvZBH/FdWiWnWbC5UmS0l1J1A0Ssvz92bPzpjq/52DR4AqTHWlDY8avzEDO?=
 =?us-ascii?Q?aQkHSmtfVQAc8xsWJJtPODLIFhJVNmgcJVmO11GEhtrXWY06oroGQTCjKYyV?=
 =?us-ascii?Q?cWUQBtiwF0C3D6PNU/jRlyFePyMDBQC8XaX1jp/n9YXycbEY9hkMpyfjbZU7?=
 =?us-ascii?Q?a6ZazN/qXB0vRs4JbAKtfek=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329e0491-97a8-49d9-adb8-08de0ad92ab7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:37.5285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfWLY89BLHjvqqh5xKFn/ReWlCLAaX9b64dlJ3kv9nsCtE3E7Ppm0ad5zjqSoLmkg+mRUtMtT360nz/qPHnBh7CiLsqX+weSqKfd/7Cf9YTNfajWTrFWj3GkXh6nyOCp
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
 sound/soc/codecs/da732x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index 016c9be3ebdaa..8ff308ba73846 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -323,7 +323,7 @@ static SOC_ENUM_SINGLE_DECL(da732x_adc2_voice_filter_enum,
 static int da732x_hpf_set(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_enum *enum_ctrl = (struct soc_enum *)kcontrol->private_value;
 	unsigned int reg = enum_ctrl->reg;
 	unsigned int sel = ucontrol->value.enumerated.item[0];
@@ -351,7 +351,7 @@ static int da732x_hpf_set(struct snd_kcontrol *kcontrol,
 static int da732x_hpf_get(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_enum *enum_ctrl = (struct soc_enum *)kcontrol->private_value;
 	unsigned int reg = enum_ctrl->reg;
 	int val;
-- 
2.43.0

