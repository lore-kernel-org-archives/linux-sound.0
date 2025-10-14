Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E1E2288C6
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415731; cv=fail; b=NThFXRWvp4Jl1Pav6DmY8GnQDQLLMtRvlRdJU1l6zloVYotHzRZ+LG07chXekJiGPm/RmU8/UbV8kSC1j+33STHar+45i22cXoWAT++7KZ98bJvx8LCR1iitmql/WNhgzovGO4AfbQf/mt3n+gYFFiV68Y4bG7GuuoptCvIzNG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415731; c=relaxed/simple;
	bh=DXVchFBn/bZSsGunQNDiNNkOgDFziSMaKocXoASAT/Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=drBZ8xOx271fclDeE93fYqabcokkTVIXZgVhLdflv9kEPd/pKrl9zaq//v9QWD/61GuJ7iIKrp2WhixA2+NBqmHHrG7IkYghNArQzLoL1FQp5i49NrnV9pq3s/x53cq73Cq2HFZjp1sXHjVxPpB4Ff9tXuuT59GH7esfGHxvCXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jxj0xLJ1; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jxj0xLJ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6Fqc+2gJa3Q+/Sn4Z6QQjBLlD4phjX5lzu63CyLqLddH3AcGobcR3RGfqb3/VGhfeBoIFczmic2T3zkevwVnQq08kLsB3IWsdQYbkfQGydgN7TMrQzogZJB2bLXRCxBelJ/Se3jxB7Ukn9HmQQzorCwwqB/QSRx0elXjM/+VsYNrL8w6ObowCq+HY2pKYGlbjkYo+Xsd/STvmfgXI9VbcTvNHcMvOk4FCccEi+fvvnvCeTdz+z6hmOcliGvsT6ND78KsLKdOGZoJSbwCDwC7K1NJG5NtLTsBob2z8feewDbfmKy5TruSgfXSIDoHarQNHIymWh+P9qbyvo9/uKeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VT34GgY42YLTZL0+F9iRyzByCqORqZY6BjV/gwyBkE=;
 b=Uo/pfZaOmEz9Lg4dpbPvx+BoBITNsAwzzb23tyR3zWAeEGcd3QQH68qZgjR3d5EAJ5mnvcFKki2VMIAeKT/IMQwG1ukPgmWaAey9OBoHqvD98obY1QBjeI2BxiUVxosOvbJr1ZWbMdSHrgtVRJFcdaFlUp5+SM5ebCnttZgjON2HFEc1G0uyVoaSPaa61GicKUHARljiS7xW65F3fjMfdNlVqT4CkcT5Ll6/oN0/aR5e3XzO/dIqZuUiGSa01plj8ijVj7s+uU0a6Fneoyg5PUS1NH1k4kP6yQxbL0fKYkvmuf3pJ7oK4GA41xctfjLBD9EstskbTgvpZRh5gyu+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VT34GgY42YLTZL0+F9iRyzByCqORqZY6BjV/gwyBkE=;
 b=jxj0xLJ1D7X6FCzyfRTO1sgyB7zLsJK5VBs/ZA5vmnGHtw3/1e8a616K8z+nFP3Ctr69qO3m4FFKodoojwRUUZcQkOKx+PBrinjAKJuPq+Dd+6L14I5eTB9u27OwY7rKg4KikWybPRFBRpfUDC2RwH2a/GQzTw2WifmsoAxAXbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:07 +0000
Message-ID: <877bwyru36.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 042/139] ASoC: codecs: lpass-va-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:07 +0000
X-ClientProxiedBy: TYCP301CA0061.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: b3bb8f06-3e92-4d7a-0725-08de0ad93c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j5r78AswhOYuGSq10gOmOx6Qk5muIU+1T8s4v8UHICt6tb6nD+Ga8RVTurxH?=
 =?us-ascii?Q?rexjCGnQdPBQSUAjTPE8S+mo6c4NtALtcUUnTF3M+3DRk6ygafnxIeLZuOhp?=
 =?us-ascii?Q?2WiypSMbAJ1Dil0ygkPj5WJ05U92uHdWsT7AG9tWu9LkOylUe+Y57x4x8rb6?=
 =?us-ascii?Q?gJXY4P/Ol7yqplj05VaCYWjBDXQT4HFEjZC6T8ed8Fy+b1HsQTjJI+bp0XzF?=
 =?us-ascii?Q?Hcciwg/cHoC2COxcfHLKl+gt+1V4NZJVW0lvd3qRR3OCnC+RXJSGU0oz8zKY?=
 =?us-ascii?Q?JfNMXHygv+gTUr4lXMD0USA/8kLbGOaxkN7tv/fb3QoZ92N4+8LcpI1eXNgu?=
 =?us-ascii?Q?T2st3nI3mvLLRiy1MDLm/SLy8vA4fOcf3ApdapB0zNRTuSASZ5CVXtuvYiOY?=
 =?us-ascii?Q?zJ7orSDvA+LBl1nAN0NnqSdcL4ht36lANCxMYyNpgTJEE834Iyh2vHKCM8af?=
 =?us-ascii?Q?o8E2DUndJm6LyDCV2neSTylxVGK771Z7vCM/KTHn5yYStfhVjCl/y12T7N2M?=
 =?us-ascii?Q?mX7dTIj8aopOoZ6Itmd2L4crvvds+jDLqYo167CbB+iucavwSVS1Er7fJ5Ak?=
 =?us-ascii?Q?RxxJpwVXcUIOiUbDVW+XWJ/EbMbLuRtKpyCe6evo+uwwLSdQ7RsdoQbXCSWI?=
 =?us-ascii?Q?o1Icbkox7Iwi6/1ZGVgZxK5KG/rtMR3Fb5KYOZ0MvLhb0XeNrpujrPp+E2MF?=
 =?us-ascii?Q?WpKGKa7Vw1PE9g+6uRNz3Jbeeqalla9L2GTiklkxWsfdho2yJlCQ+To4fPiG?=
 =?us-ascii?Q?HustlgUaxGCEVx2xjschsNAlf/F92BtLyTTdpxrxDnP4nZ34b8tiHHGKaOen?=
 =?us-ascii?Q?C9Z4eWHr1jV9u+ncoThEbDPlRUzsSh1EeGChhEjNbvwO7/h6ANKWFnJbQtjp?=
 =?us-ascii?Q?L42JLHW/nNdq7oNvHyMv73818NeyyVSzONbu860aHFMdWRB+8QvNlJGKsoXI?=
 =?us-ascii?Q?0o86womOiwzA5ZBYT17EOD10M1MV90+fgPzfL6b3QvjmSb9YCc+XkrPwadOw?=
 =?us-ascii?Q?Q4/wl64WG81xvNhoMcoPsFfVhsX0ZWcvheqmUP8cyFxqMizkIuYMWBWj0RYR?=
 =?us-ascii?Q?YiytZDme++A+0d5POFQFIPNRnO1+Xs5d339eAkotYL4XAhHYC9fTtglHQq4D?=
 =?us-ascii?Q?Mssd6eqVEJm9WkTR8KDVblQh6IFlVtGwHrPkF7AAAJ4AV3WnXXDkvqjhtQDJ?=
 =?us-ascii?Q?lXLZtOb1chhXOpMWSOd17IcAGryCiXr6pn7J4heubQHN187cCzjHRc6eQsyv?=
 =?us-ascii?Q?XfhlFLTxLHDwjgbcpZYZjKVkjqVGEUMHVTZ0+a7LJvuS43gaVCb6MCCOw4GD?=
 =?us-ascii?Q?HBO1N9oYU4L0gmzqFesF5qmu3NGz5q0E4Y5R1EGrqiCWHSrUwNrZq/8Xul9C?=
 =?us-ascii?Q?IYCP53K/5YBcTKdAhlzP95zY7BBoYFMjcLZlyLZXQV2d7ryoi7JZLN2XYl7M?=
 =?us-ascii?Q?B3UZqZfabwCt10kjVKBisX16FQH1prv0LcubDZaByfGxUNrB7vx+m+NYNFEJ?=
 =?us-ascii?Q?ViDPiu2+2J4jyFj7fbh7JWrNM4zbbG39wCTO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?juBv0yvtlUlicoURjN0sSYxZmuxhE6xw7QFXX1m23grepey3ijmv40OfYJT+?=
 =?us-ascii?Q?bj7s+xmnvYq+IiC6HLIZZGq/hpg9LDsbfAGBSjAbLOaCWiTEsW6ItCjiXxVt?=
 =?us-ascii?Q?WbDXVY4IEfWCJuoq9ZPbOUoRVZmzikHg3k/pvhDrrBTX0LgezhRJUf182NQc?=
 =?us-ascii?Q?m/7WjdPcmzEzf16UvLWe92yLSYbd6wJ/7fvUAcsbSRe69dESnoGL4imn+ZUq?=
 =?us-ascii?Q?LzmXdJo4gFFD5RgM73gR+jrXOBGABA0ozs03/93t9l2agEr7Pdqf90QJUiVO?=
 =?us-ascii?Q?qeyaq9BfnEumTzjOUukJEBbygy86DBJ3g0s3AUZcqWyBrzKGb0c26sxYLBXo?=
 =?us-ascii?Q?0bbLjhj79Nl+B3AJ+G2LLiyPQlnJwkq1U4lgcPMkp9adxYWaAfZp78uZtupi?=
 =?us-ascii?Q?JoZhYgSU2QKkasyu+1/ofnC9ZuWce2Wpel7MN0h/UiJSp/ecY2E5TvphLI6o?=
 =?us-ascii?Q?/EzhqghoK6x0g5Ho/Q67Nv5SLg30MUD+quS6OgWO7PA//cCxE2/jSg6zsEhK?=
 =?us-ascii?Q?kG1A9MuE3HPQ0v6QzC6Ma/UJ+cr7wAwxSmgQiOuAtkxMyjD1Kx/woZd8PjL2?=
 =?us-ascii?Q?U3xMloMLlum1Tct37c3gkxrSB6d3kXg6/GMRUfK3GHnlFrkz7ePNZVTtq7Wq?=
 =?us-ascii?Q?EygKoTzi0V1qRgCqJgJ+uDz1P6ANaDyJSTn/PA3lwjI3K3xtEcYzwi+jVyLV?=
 =?us-ascii?Q?GTYTfweBifdQfOgRMIuH2KPL47ZU7GgE1umy66rWy57hVGU2Gm8pNgAynsa0?=
 =?us-ascii?Q?yIiXsCKY1HoDHCBmYasN+85esAtFapTXc843cO4eVSxy73MBi5SdE4YT8SrQ?=
 =?us-ascii?Q?sCqXmzYVKgFYw6q/a+mbGJY5A4YKFSuOfyIe1KzibDyA49wnK0wnDjS3oq+7?=
 =?us-ascii?Q?w8EuIJgvg4hx1BF0CwV8s8LO4jJBkGqund1fk8R8fbWe2DJ+fRzvYXDLzfbf?=
 =?us-ascii?Q?JnZ6EsSw1x9jA44pKof4pAEDFnQYnoXJt50PCIHPRmQgQKFmfCY5SWS6L7s3?=
 =?us-ascii?Q?gjC2Z4r1k8CjYcB1oA7s91rCe+YQymOWIxH5zMhi64xGSqDFVnrDIL54TRV/?=
 =?us-ascii?Q?CdWC6hi9go9Wk0tqOOXJB0a0d5yWd2siZB7SvSbxo1pjjzfIUy/KIEG3RVDp?=
 =?us-ascii?Q?5Qr9Mwbq6oD35kbvkvr4CE0po4CQ8iXYiVeblTcmV+tnqWmIG6PGW8Nt28hI?=
 =?us-ascii?Q?aPqo0YR/WF8lJWwj+lkbd4gJgVcWg3gUAlV2lI8iOfPLg2N3tFyAWhyLya2C?=
 =?us-ascii?Q?WUZlyrwHCJXmopnd44TqtbyV3aY3sYW37M8nNLDmxu/y5og8n5S2puHmf6jz?=
 =?us-ascii?Q?Lq7wlFr3uVvZxjr1MDsxEHCSY9Ck29H6l1ShLsjmWECjSzOkBcpO2Pr4ERYz?=
 =?us-ascii?Q?OsQNfURqp2ohiB/Hz/lh09ybnxKahskEkJBbvwsudnth/j7CWAGHBBLwcyk/?=
 =?us-ascii?Q?a3ac8+HlB7sQO5DVsVCfUQL57eAsqLCogTs0CNxBjS5XjBV2FqBcdSw6y3OX?=
 =?us-ascii?Q?ruJd8olQOuk5Mw2SCWgUl1NwEBjpCVzXHrvPh7Ydep6aElx5B+ejBz82FkHH?=
 =?us-ascii?Q?/f51iG5N6jcyOgZv24i3jT5U5K9m6/Ti2edNVcU663epOBl/vCUmIF+7VvRF?=
 =?us-ascii?Q?sjMSf7gaZG8igTGNtbObRg8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bb8f06-3e92-4d7a-0725-08de0ad93c85
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:07.3696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fn/AKmEUAfspYUMwD4P4CzUP6m5uTkbgUwGgbG+YopAqEosgvPP3lUZoXKgHZnDVj2jXyFQdmQafy/RY/MyS8hK4wlWRYpoqnI6qpjHPm4PMIzc9rww5+WnxBHAiaqI7
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
 sound/soc/codecs/lpass-va-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 2e1b77973a3e9..14156f356378e 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -819,7 +819,7 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
 static int va_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
@@ -832,7 +832,7 @@ static int va_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
 static int va_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	int value = ucontrol->value.enumerated.item[0];
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
-- 
2.43.0

