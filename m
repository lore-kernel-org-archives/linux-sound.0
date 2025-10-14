Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1FB309F13
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415875; cv=fail; b=DaW2jATVnBPV9I9R8sNk6WpzowwyXMppxfYnbLlIUWby8S2HjUNo8j0J4NBMvZiFy4B4HOS0mENN7l01x1MpD7bVZcD50yXWb5JRQ1S2ymkbti3xnJhnVw9LMvCgtoafJ7pxd3I3LBHH9QJeVDXawovCrWrJPS/UifVtSFt7QUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415875; c=relaxed/simple;
	bh=OVnr7K/toUvdkBg3BamOZrxxFBvaxTtHM7027MiMERQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kEstvlInngpWZ5kCjC7mx1h/wg/SVbkIP9nQCvLYwLkVniPhey0mO2BLo9BLu9y8TkGJiO8jm9jRQ+VLpj1ZjJ0plSlJCFnpFfPIaluSHOfaKH2utbzc+y5XpX00AALFHrR4fD4Ig3ay+GXM4Yrq8kiIx//5ZpTkWLdubeDlwds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fF71hm28; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fF71hm28"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgnPThngQgGuqVwqTW6aALI5VTJVpyyXgf5sKNddxpHkAA83LBWCgghZ4jtagjANJlVp54FD2SHzWSaM+beItntMeRnQFmNVJgZAm54taKqYoKLVzE4o6Fdyd5m92KWo+LgxTPCcwxfOkGCpd78s2ALT9cYQfUyE2qzoTj35b4hrK7dASoT1HoAuk/wavsXGnXtEjcI1Z8x/YnA31v267rnyGzJgIzT1aPen7LJY5ga2E+aAMayh1iuhIT3KPNmInRqwvPV1BA1FQSVZiUFVbvK4i4X1Dj/7w7X5uiID/Gsl73dFfmhjv7Iq2scxuRzgyWzaXz5o+yiRXlofEtqTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5Azd35MBsK5khyCVsgmTQilT0UDDw4RqiYbBsZHR3M=;
 b=xipFGbuHX0SaNcu+G8G/KFLb6izmKG0+wuCm92XV+cw2oabfI1yeMoCFX7MbqsqwMpYQIc5IJKxvWyefsxY5gQ9EFrBfdpU+6srywzkAVWrC00/EVaAtzz0de3PX9m8QVhRcMeKRYqNp7anidmFtI/uMBvCAgsVsJhwWDJ6+5kmJUyXX3EDvhVHkuMxsn1H/xkNBRybW7Lu/NVYDcUI8Yc6YqqblHsddK2IHoS6unO7YC0o+bQ3e/qOru5TcMRODf8LCiIHsy0wjO9iaLuJJoM0UJvZcYnDLHCVE0Pmy5F9TnNrBu02vux5lkow7eoogav6oww7le/C23bHns5bS/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5Azd35MBsK5khyCVsgmTQilT0UDDw4RqiYbBsZHR3M=;
 b=fF71hm28gtc3G4jAgASIrq/lAhMYZk6Wi1E9mMWRjUgFPriBO/ZS3KVDHdG82KIF69VnzdTMOCs4eWhgW6Lk6s1i/df/c9APqV5wl1QDvm5hNkCSdBctO6JMZvwOqMI5nGYh9PhcltpsMV09w6AUZgltghpjZL/69U9F9Nb98dk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:29 +0000
Message-ID: <87o6qap0ua.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 080/139] ASoC: codecs: tas2781: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:29 +0000
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b9b8955-809b-4f71-2fac-08de0ad99149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ct2gHyD/+8xF4kH6dBtWvxFY8VLLTbiA0R1NSZR+D7aT9f+w19RzqIXU1JbH?=
 =?us-ascii?Q?1D615XA4JC5RCjMsQcN5xuGoNgo5FU8wSB26QlcdqIGBlr6iO9UHX7DOIzPp?=
 =?us-ascii?Q?rEQfs5uMEVcBv/VNSYUsWk3ngSVBIEwvXwX0vu/maxfsRGGvQOo7LOKan2QK?=
 =?us-ascii?Q?mbPPDX8ITB58WTbvACooQ+miq7OrRBtGoGpNLge8JzEOqxcPLNN9dZQmTyMs?=
 =?us-ascii?Q?mzYx84iz/6UfEotEqh1rLdDPPJ+zpJkT0oAhXcXhuCWLK5YuvcHTvkGTpqpM?=
 =?us-ascii?Q?efsaLeSgyTbzHUkp+YtRB3iLQ9HaPaI/nN3DVFOKtdAiVHWoCHQWZ7M/ZHPU?=
 =?us-ascii?Q?2ZX6wWHA8prP2+uGXsrk2aAXFxc0fViM6bxY6FBW3UXOgC7cgBjX1KFydsbL?=
 =?us-ascii?Q?U/QMM9oorYXCWFscSryR2FfQOPbM3DawHIroCu5IYYGcuH5O8AwXEeIn9vMO?=
 =?us-ascii?Q?vSiyhMyY429JPU7mK8eKb4Llnn1/D7t0lga2uciIqpZOZUjksB9Fz4w2UXQe?=
 =?us-ascii?Q?wy2dW6eENEioly9qs/zksj6N/prLS9UdiSnpWbJ7bTLJpy7qE5WkmBOmIsa6?=
 =?us-ascii?Q?u0GramneVwc9pAXplu1VEPoJkhEJKJi81GHaG858kre08tSHo7ijV6joEH56?=
 =?us-ascii?Q?bXO4IQbrUVpW+NJo/bF+VsjAaieeVJ3OuQDbDOkRygS5li4J8AprgvJ2snI4?=
 =?us-ascii?Q?MsRKGsUR6q4Ey3lyFL60zFjNARWNjKC193c6rdrlcg8SFHOE+KJbnI7PVrzF?=
 =?us-ascii?Q?AaRzo/oIK4nVxDBuzGbM2IaUQ/4yN0g+AHVpZYQrbaqAW379yJHOswvqqPRh?=
 =?us-ascii?Q?bsnYYuwKLIFYX0nvzsJhqfO7kzOC7Pe3c7Xe3tR/VqRRuenmXQvaha9scAzO?=
 =?us-ascii?Q?gJyqaEZqE/uflBZl86A8L/XH8HL0s9Of4DTLZJLu+jIkeRf9RBSkCkjOPJBi?=
 =?us-ascii?Q?LSXxxwGSwcoXxVSlhHb05KHcFGrXsB6TB5r5Ru2e8kxZSX0Y8fnknThybZlI?=
 =?us-ascii?Q?cA4UP/2jmSSH0SABoA1YoLscO2Pg6zd7wsqrFnkzlUWxvJvl69ckNLdvJ73k?=
 =?us-ascii?Q?6jeWJUcEFzeJZBNwHVE3V6HaZpVCmoAjKeKlzYm8OHjRW0NmBo+shu77+ebT?=
 =?us-ascii?Q?toP7Fr6r/Tmld5h4M3UX59nY7GiLSBs+uYaXV2RLnyqbU1Tv48DxhQz0b3MH?=
 =?us-ascii?Q?etHUUma8b+OeEAbvFZyriO3tIAKNOyQ81vTvT+eJroi1JyocneAljLSNI3fd?=
 =?us-ascii?Q?EhE83XFn+GD4alCqNsdJuudsnE0xOtilaa2yBM6ekcF2q8yRGfhAI5fGaPMO?=
 =?us-ascii?Q?3h4oJvhAC4BKuduF4sZ7fJq5IK6nAVNAubAi0uLSRYo0sGpL3k3rbu+UCyCB?=
 =?us-ascii?Q?cbL1C08frj/qVVS1cuikGvPnSZ8qiB1o4ssVeJ4BCWRMZfuLJp75wDa1vLAE?=
 =?us-ascii?Q?ekvdZY2gywae1l9fiDEiBRoQmp1Uk/UlkgzzJeOJB5jsdQZtmF9lP1KWK1dX?=
 =?us-ascii?Q?GEC/BaMEtl540TWmYMk5Z9yyUfM6zV4Yd20/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zBZ1GDdwzNMtGrgY09unHk/IH4mIo2M4vQqi7KTZIjfLXtIApHVPgFtFaYL0?=
 =?us-ascii?Q?u8xwnmF6J3zeqLd1keeuodq0UoU/HZmxJ4P4w2EJIfrudmeokRxF+pipQwif?=
 =?us-ascii?Q?azH1sTXZU3DzYsRrhHgbIEo5qQagsVaS+i9h/ek0ZKT5Pr9xEZGBK7YzeJ9i?=
 =?us-ascii?Q?+76Xj4d9X8q2EHHEl39KFWLFTe49dES3prMPjEjwdRIkDd0qzQYybQJRqMwb?=
 =?us-ascii?Q?ReFQWry3FrUnpgohzZMCjOKjvNUzBmtXlXGCYeOu9rWk4DnazvYyUpt/CZMi?=
 =?us-ascii?Q?tih4dtdUTQLSF0S6bfkGvDOUy3JBekvR0ky0r9/JmZeMb7coJLe5rKWSiygr?=
 =?us-ascii?Q?dN/14UTCeLMM1aPsgIZO0eNTMkLMNEAEXur+lS42JoUzaTf50ji0yW05FrY/?=
 =?us-ascii?Q?mC7FtlzbZ1b/i8FF7AVoiM1R/VoW9NeBbSKV6ctafIf6XjdxTwV91cM4rjZU?=
 =?us-ascii?Q?4r42y+T7kg61XVRzgxGdaPcEfc3FDrbCgcY4ICSxIJC9qdFQrZCCb0l69UJS?=
 =?us-ascii?Q?JQgfUHRLpftOueeo98W0LAzgHPSG4GrLNn5BbLLk3L0xT5lea6eO7ODTYgue?=
 =?us-ascii?Q?cTkfzQKuW7PqH2JTv8rTrYKhS39jd+05mXDagnkMMb4VxpDKo+D2lIx79wE3?=
 =?us-ascii?Q?nAgNqOXkOTLmCq9NCSOUAtOmeVNRqeatbwgTBCuvkedSCb3FcC+Aj/0rq887?=
 =?us-ascii?Q?7TzwFIudA0WBxuB5sBeRC6Ai8ZJHjmRALf/Kc0aQoBRPhZS7hpGZZDznQ9qc?=
 =?us-ascii?Q?vEREMyukLUGiNl54wEB3xScZdZXN18r0VkF+wjVBJ3W5AyZN3VRBkP98fBZz?=
 =?us-ascii?Q?eOb1XKG8NQMb/DEjmcdHfbqNCamOltL6cz8VC7+Qhnmc9+YT0DkdKDCzMiB1?=
 =?us-ascii?Q?vzOu7AiUt8b1kvFzmY3zQK1ZBywJvaSX4YHJdQDhC4LX2JZUoAGG+7A8P+rX?=
 =?us-ascii?Q?gl95gEygnxSzgP6fc3Ywb4M8X2I22syUvQRbf4qeJT5RHAGSK31VQQITC03y?=
 =?us-ascii?Q?ww1kvDDFadr6PZwGZHTzGEMMeNMIqWCDiIzvvJYytSXQn59m3/0393oA5/fE?=
 =?us-ascii?Q?5y1bAe/3t9i0/0qQ9aMFYh5ctl+lOt0V4ZNjKCTldWt06H+c96cjYjlbm1E7?=
 =?us-ascii?Q?3kDD1/7uN/1tjuGht/DZv2uJFN/PvxK3LZ1ajxzwDrwE2IFdEoTSwRwicxU+?=
 =?us-ascii?Q?GbpUIpKMUe3jNWuOt32WO6vWbgjzKc6oid98lIoAYee4iWMH4Pnh3jVt3D7n?=
 =?us-ascii?Q?Rgq6x6SiMPtP8y9oEri5mG4MHskMGLFaflu5OwtjcXoMr+nv82NbhWZqH4sK?=
 =?us-ascii?Q?WLJuzQT61devqc0i9Nu9iEx3zgBYGdgTMl/J2624F81DnSwXhJ1E62X8pKjE?=
 =?us-ascii?Q?zbGXZnYaz3cs+LvJ7xJPPXybD/P7CX3sXtc3FSAvwXG/2HpYiqzbXEL9RlLA?=
 =?us-ascii?Q?fKdcjzIyS2QkyDHGI3yKYQa02lEMXZyi+SzUFKpdC8UVpy1UoiJswzlykQ83?=
 =?us-ascii?Q?lhvJ02xmEL5M3kIEpoIIRw8elCydhmwRnfvePAm0K/UMejWrLS37QaBNffxJ?=
 =?us-ascii?Q?CZEGza0k64STo4tNgCS3uc48OeJ52DQIpv45FevPpmTf/wABrCVEjvWstRUA?=
 =?us-ascii?Q?ficZLi9nvJkLn+zqcvSxZpo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9b8955-809b-4f71-2fac-08de0ad99149
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:29.6149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcl87i3hW+tUOQuz6PM5WpSjTaOpLe5v0y83sL86wrADaCTBBU5Lgm5/LmxHdeM4KFG13exLHAFVQNx+qLMsDr3ELJVUYUIIbwcOotbSx42BuxHZfR5Cw9iwjGJ/vsST
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

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
 sound/soc/codecs/tas2781-i2c.c | 67 ++++++++++++++++------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 1539b70881d1f..f8b5f03910c89 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -145,7 +145,7 @@ MODULE_DEVICE_TABLE(of, tasdevice_of_match);
 static int tas2781_digital_getvol(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -156,7 +156,7 @@ static int tas2781_digital_getvol(struct snd_kcontrol *kcontrol,
 static int tas2781_digital_putvol(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -167,7 +167,7 @@ static int tas2781_digital_putvol(struct snd_kcontrol *kcontrol,
 static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -178,7 +178,7 @@ static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv =
 		snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
@@ -190,8 +190,7 @@ static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
 static int tasdev_force_fwload_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv =
 		snd_soc_component_get_drvdata(component);
 
@@ -205,8 +204,7 @@ static int tasdev_force_fwload_get(struct snd_kcontrol *kcontrol,
 static int tasdev_force_fwload_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv =
 		snd_soc_component_get_drvdata(component);
 	bool change, val = (bool)ucontrol->value.integer.value[0];
@@ -226,7 +224,7 @@ static int tasdev_force_fwload_put(struct snd_kcontrol *kcontrol,
 static int tasdev_cali_data_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *) kcontrol->private_value;
@@ -463,7 +461,7 @@ static void sngl_calib_start(struct tasdevice_priv *tas_priv, int i,
 static int tas2781_calib_start_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *) kcontrol->private_value;
@@ -536,7 +534,7 @@ static int tas2563_calib_start_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct bulk_reg_val *q = (struct bulk_reg_val *)tas2563_cali_start_reg;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
 	const int sum = ARRAY_SIZE(tas2563_cali_start_reg);
 	int i, j;
@@ -600,7 +598,7 @@ static void tas2563_calib_stop_put(struct tasdevice_priv *tas_priv)
 static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
 
 	guard(mutex)(&priv->codec_lock);
@@ -615,7 +613,7 @@ static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
 static int tasdev_cali_data_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *) kcontrol->private_value;
@@ -662,7 +660,7 @@ static int tasdev_cali_data_put(struct snd_kcontrol *kcontrol,
 static int tas2781_latch_reg_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
 	struct i2c_client *clt = (struct i2c_client *)tas_priv->client;
 	struct soc_bytes_ext *bytes_ext =
@@ -695,7 +693,7 @@ static int tas2781_latch_reg_get(struct snd_kcontrol *kcontrol,
 static int tasdev_tf_data_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *) kcontrol->private_value;
@@ -722,7 +720,7 @@ static int tasdev_tf_data_get(struct snd_kcontrol *kcontrol,
 static int tasdev_re_data_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *) kcontrol->private_value;
@@ -748,7 +746,7 @@ static int tasdev_re_data_get(struct snd_kcontrol *kcontrol,
 static int tasdev_r0_data_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
 	struct calidata *cali_data = &tas_priv->cali_data;
 	struct soc_bytes_ext *bytes_ext =
@@ -771,7 +769,7 @@ static int tasdev_r0_data_get(struct snd_kcontrol *kcontrol,
 static int tasdev_XMA1_data_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
 	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
 	struct fct_param_address *p = &(tas_fmw->fct_par_addr);
@@ -791,7 +789,7 @@ static int tasdev_XMA1_data_get(struct snd_kcontrol *kcontrol,
 static int tasdev_XMA2_data_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
 	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
 	struct fct_param_address *p = &(tas_fmw->fct_par_addr);
@@ -821,7 +819,7 @@ static int tasdevice_digital_gain_get(
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_dev = snd_soc_component_get_drvdata(codec);
 	unsigned int l = 0, r = mc->max;
 	unsigned int target, ar_mid, mid, ar_l, ar_r;
@@ -865,7 +863,7 @@ static int tasdevice_digital_gain_put(
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_dev = snd_soc_component_get_drvdata(codec);
 	int vol = ucontrol->value.integer.value[0];
 	int status = 0, max = mc->max, rc = 1;
@@ -967,7 +965,7 @@ static const struct snd_kcontrol_new tas2563_cali_controls[] = {
 static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	int ret = 0;
 
@@ -984,7 +982,7 @@ static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 static int tasdevice_info_active_num(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
@@ -1009,7 +1007,7 @@ static int tasdevice_info_chip_id(struct snd_kcontrol *kcontrol,
 static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct tasdevice_fw *tas_fw = tas_priv->fmw;
 
@@ -1024,8 +1022,7 @@ static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
 static int tasdevice_info_configurations(
 	struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *codec =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct tasdevice_fw *tas_fw = tas_priv->fmw;
 
@@ -1040,7 +1037,7 @@ static int tasdevice_info_configurations(
 static int tasdevice_info_profile(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
@@ -1054,7 +1051,7 @@ static int tasdevice_info_profile(struct snd_kcontrol *kcontrol,
 static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
@@ -1065,7 +1062,7 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
 static int tasdevice_get_chip_id(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = tas_priv->chip_id;
@@ -1111,7 +1108,7 @@ static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
 static int tasdevice_program_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = tas_priv->cur_prog;
@@ -1122,7 +1119,7 @@ static int tasdevice_program_get(struct snd_kcontrol *kcontrol,
 static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	unsigned int nr_program = ucontrol->value.integer.value[0];
 	int ret = 0;
@@ -1139,7 +1136,7 @@ static int tasdevice_configuration_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = tas_priv->cur_conf;
@@ -1151,7 +1148,7 @@ static int tasdevice_configuration_put(
 	struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	unsigned int nr_configuration = ucontrol->value.integer.value[0];
 	int ret = 0;
@@ -1167,7 +1164,7 @@ static int tasdevice_configuration_put(
 static int tasdevice_active_num_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	struct i2c_client *clt = (struct i2c_client *)tas_priv->client;
 	struct tasdevice *tasdev = tas_priv->tasdevice;
@@ -1186,7 +1183,7 @@ static int tasdevice_active_num_get(struct snd_kcontrol *kcontrol,
 static int tasdevice_active_num_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 	int dev_id = ucontrol->value.integer.value[0];
 	int max = tas_priv->ndev - 1;
-- 
2.43.0

