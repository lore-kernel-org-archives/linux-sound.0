Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF623090F7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415719; cv=fail; b=ibMgVfr/lttg0dUPOC2hY8rg4bXLS9WLqamNbHx1KgQk1FwL4jnl733GeMij/r0Uc/ckRhC12k78ILgO4DCMJb9c1KbJeOjVtYQTAWT2EWJ/5X0n53Z2N6pIyXJTFJhTLBvOMC53GNtojEUh16XaJvijC7XWudUJ0KVvVjGtNME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415719; c=relaxed/simple;
	bh=4QPcSQ1cgBYtWwjI4F3BOpzVWdtR2XYo20y/gCBuaN0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VkQvkN3/sOwbhGLpTBRzbMbA0z52Pt4gkdl01GqrnzK0f/0HT3fRFNifN9pIzqECkQoUQnGfDTDB8WTSQDTOW2L91EwC+FekexEtdWiqzuLiQ556jRpe2WVRLIzOGBrVTzT07OX3y1v7g9BY1vSXv1f4+wbttRxWk/uRBYLvi3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fqaghDaw; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fqaghDaw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iA3rsKEgsmIqbDK5tTc2hmpXzlOLNP8b4i5p7ZzA517sG1ES65To83kWR+Ny94JRKbc01aeWrdi4h7SnHUQUaVDcXuybmZtEwGbdlOMEyJmouOBHCnWeMso0s8FIFBbj925qQ8rRsQVzWoYhuY/hYQLzMJNBy7ws2T8gwd/HWUYTixwgqwA3G678srNGzMdkmy8SFyy3TUd4W3qp+TAHnVMshOqmaIqxqza/dl3XgpcJxMD+IkitUGAP/A0W7DijdiHvthu6o31qPci0JYqR7iN62Yxmj+IJKcB7CaPnprzrcBkij9UzQ7HPpiiUmYUcqzlDaYfoTK5vgio1W3eSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10679vHx2DiXGWoXwHtBNjQrgobpyLefu2wdde2lxYs=;
 b=S3D6/BJs04w54Imj7ps4UCd8khvQqOOi1MxczxjlnfuRHBEDvlvMu11RisT4zoZDGbmRyRk4RE02jGS1fSbRyKWBzdOR9lNzaZKxM+cjqUi2TaJvQ9BOTERPAgn58YuDEugCEshYYohFZpefY/2JmeFEeALeAikBYSTqtpgPlVY4VqfK7Qo9HMQdICusCG0T774EecJfuGehm6FNix6BqwCIYZPzjGdQ0Xl6J2Bv231if2rg4P85Uc3xIYDy3Lq7d36eNd0vDh0ywmLedSp4GSXM/T94wcaXPC/dnAXFV4ElC8QnpiaUE8o4SUGJpUBes3yDA6Bbd+nw+tLS6W+0yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10679vHx2DiXGWoXwHtBNjQrgobpyLefu2wdde2lxYs=;
 b=fqaghDaw1Z4XYRZqMSpMGJyRKT0W4IQmwCGgnlsEm1r+Wl3P925SFS8w4g5DoLj8btehcgEfLBASuuSYvQta6sIsKsGXTS6XmQAG9xXuHGmWAv3IJni3YATQ4KGkls0TG89sYRlREt1rFWpQ7fXbNDeowh3lp+2V4mRdl/P90nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:55 +0000
Message-ID: <87bjmaru3g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 039/139] ASoC: codecs: idt821034: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:55 +0000
X-ClientProxiedBy: TYCP301CA0078.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 790dc684-bb1a-44d3-99d8-08de0ad935a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xsksky8Wf/LUj0uFfkRFmWcdkEkkz+PqAsLqMWVYghSEiZ6euMSqbmH2RoAx?=
 =?us-ascii?Q?pNuRl7iLs0C9/FkjUjzfzoE7/noHrRx4L3eVhQB+b1+oenPzTxWsLOZ0E+FO?=
 =?us-ascii?Q?B3wHLHiCn2luP+uvhRj0QUamBZDPPVENQa7LsLDoB6awoaDnK9qjRu0qPMOR?=
 =?us-ascii?Q?74lW6ZLwpDVgMplpJN4AzoJMq8d8t1NeAPPxRhxyaN0TXE8HU0ZvsGfxQlx9?=
 =?us-ascii?Q?AJ5RtTB7DwEOT017EsFCnWhitQtRhy9Jt6gPkz/NP/gY4dw8As0naIszSI12?=
 =?us-ascii?Q?BX4FTN5Zoq+OxeBrj1tYTkwKndljwZTxXDm/vN+AlA3q2afwBwubJZs54it2?=
 =?us-ascii?Q?o2tDh+hxE/dngI9M48TdVLtEiMed42KfzyGwvKQsezO89iGWiaDzliqsMGtO?=
 =?us-ascii?Q?2K1uxDxErochbFuFrmrMxFAXZcOIzFtxhD44gkEtSMU4L945JmUYR4C57Ajp?=
 =?us-ascii?Q?55LqVJP3g0+zFGNS44cDP+Nb3GHilmFq/ljwgWcP7+0wBcFOJrXAyplsceuV?=
 =?us-ascii?Q?v8Zztuv3ivBaXNAuFX17+8srYFOttNSIPcU1oWWT2+yhQIFHg17//N3Fgpqz?=
 =?us-ascii?Q?FjMSQZmhkZF+VCSTApzpEbWCYYSMWtec4GO2nGqgV6N5XnkvnRgKEOwQ+PwE?=
 =?us-ascii?Q?7kTai4IJS7JjYHPej3Xjj/MH2utUZeElfSihLq/5s90V3pKWWlqv1Pne6ybb?=
 =?us-ascii?Q?1mpoSGgDybtpaHDYpc7L0kgDwKfuB+p/Dok20LYb3wI2UwQZRUqvptk5nZwK?=
 =?us-ascii?Q?3c51id6uOg+gudjtGByTwwWYGMvCALwNcR9aGc85+/XsTNEBCIFwRr58/uV8?=
 =?us-ascii?Q?qsqiFuIlLSfkWiERoHxFHJWn8ZMPy0cIwGG4OfFMsz+kaTT0zjut3fDKEK9v?=
 =?us-ascii?Q?NDrpkzENa5MHIvplsM2n7+lErb4SVI3OYPAotNLpJMNLQgLeIrqwYCRXSXMS?=
 =?us-ascii?Q?9Uxh3MVK12cun6nHcxPJy3v4pucNPKGGM0+VG6cqR2PzxfKHNhbWu8aQJnnH?=
 =?us-ascii?Q?wmCY9bIgsefuHzGGEp7SkvEnYvVHDC4Ge2D+qn6UlLe9P09qSIhhS6PKYFsq?=
 =?us-ascii?Q?zQnZ5YhQmDzEFQjFR+eeqnFthkUmZh/lVrbAhGJcXo9IHQaf2N3c02j+08IF?=
 =?us-ascii?Q?Dwje3XSBU1vCpoF3F19sUW9nKA4n2FIV+0VJYe4J5Y6HiLa5stywTHP2IfMf?=
 =?us-ascii?Q?xCUpqdKOFReL4aGV3uALDxPTh95/Muqq0+rxrnwCBVLSuKHarGwwVVvmkoZT?=
 =?us-ascii?Q?VYycSocKqYO92e777f1dyOna+ojFJaNkkHbjB8PVAX8edV55T48NmB9kE+n0?=
 =?us-ascii?Q?APsN0K5dwpbCIzka5RTv1Qy+1WOQDlSk3mi+WiBRUh7RlwNDKbabsfI2dhE3?=
 =?us-ascii?Q?HZLDi7z3vc53NpeVkfeoFZwwnlzyzZ7HqnI6xRDvMUApPNOd405QjaT6zfSb?=
 =?us-ascii?Q?Ld2TLtUHid8H9/MQbONAEyDfp2rHQ/BckSEJvCbtIX3eXUPqbbQdY1wWremj?=
 =?us-ascii?Q?r2I79T4SwJ/E+xymtJSYwycrpYhtQ0qq2+Pw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pb+89GB/VXmgDzyCWYl6yG2tu7J3sX38BY/I3tZtPcRWf95VWyj/1VYf3TDq?=
 =?us-ascii?Q?ErYZBGqtB8x2Fig3Dbs11l0kA8e2aer7OsiMBRr/A7PGjjlx/9WzpGiLnlSU?=
 =?us-ascii?Q?VnrTSQsTqEw6BMp3vO2H+S8Fn73UF/dFGQVW4Cs+C2Oo20V6REpBRE6V/+IA?=
 =?us-ascii?Q?c0m/WcvaIiBHOXYcBkVtbKkt4NCQzct1aqK1Nd3ejPM3BEcRiuspuZjYSalm?=
 =?us-ascii?Q?bOZSkFKHfn58e3FPWc896JML2n3Z6QKjoYbfB+XCkzw4aaplJmHmsJFbFY8c?=
 =?us-ascii?Q?NSO6FVCGYCVWHVNexJ5mAWq56ekL9GP/hpmGd4TuZ0eVugUK+uEhQ5WAw+Mq?=
 =?us-ascii?Q?rZ7urY/LvYLPTMmGZ9ZbiizRi3w8B9l9JBvSGJX+OfcOVE2dR8ymB2NZ4X0S?=
 =?us-ascii?Q?8zTXp1vpb3MUhICrxBgK1e3mZ4IvHpPZd1B7+4Ki59fmGwf6ZwkT2bBZZtp7?=
 =?us-ascii?Q?dVXK/F9pt4pqw5VRHj4/Z1ki3ojWkJGj44Ba1xe06v3EZstq4LNvXoZO5i2G?=
 =?us-ascii?Q?QcpkNPwPkptV5m0kdYDBkIV1ofuHv43HgwgTQrVVeoWOH/3eXTw9x9iC7YI4?=
 =?us-ascii?Q?8jDjNzeHAcCeyzJ2xD+zaN4ShQ7GZ/Dvr3HgTyfOr/2xCPiOmGnuNZJJlc/A?=
 =?us-ascii?Q?YtuUJuLcoRGy2hCJCHWk2EetmuyymEqtFMqdRQ6QsLceWUXtnkR1gOvIpEcT?=
 =?us-ascii?Q?O++LEHIeNx2hqZQX284NOOn1w9Ean3yCWxqxZ7C7RDlFCJKfMbYBuKp9/IIa?=
 =?us-ascii?Q?46PMyMUTWIgsRU+XhCcXRe8KjFfc5fil+lEjTRF6G4LC8/l9kkQCglN3YOex?=
 =?us-ascii?Q?HYyVwA6V9dU6RZpg0F37njVQK5I5SU+lRuRrdfBXp/r4sOzMbcUVqR2QUU/P?=
 =?us-ascii?Q?eLBhcaUUIT3w6ChU8WrvfBCQv7DFMFUkhy3Wk4V/bx/OLCP+r4oGtYb0vBBi?=
 =?us-ascii?Q?FXbWCF1u4UMFLbwdLAAZFZKDL+A0ZiPvUuOomJFpzNsjJGtuHCArOsu5XcY0?=
 =?us-ascii?Q?3pjqfFy08pB6zlsC6jI+STVGWnxyUJn8ES6v+wS6wuCMlp80U20eRoLsX/Q6?=
 =?us-ascii?Q?Mic6fqep+wxYVMxnizgq3BJhxkaP6U7+F9i8dXDfzj+xpg0uDVoaLji3BL+a?=
 =?us-ascii?Q?bBOgHrxnyrbi2RqWLvqUMtvUNVTu9v6uLSrU7wJ+gGkZqokRfIPtpXo681AJ?=
 =?us-ascii?Q?bpQZRelgYQgnNhQQkViSpkKceb6yyXqtkwkCZviMXFsLiKozTL8Hm+QCZSuR?=
 =?us-ascii?Q?tiUbxEo7YEJ3ySubv58l49TnVa1EThWAXwkOQRbAPfe59vchJdNlXVyK7VeS?=
 =?us-ascii?Q?eYbFstatIEPoC3a7FGBl7X8ZbMMb/yk2gALN0OW7oio1Qy+hPpLL3hzrsfIL?=
 =?us-ascii?Q?GyP9OwYJQiN0F5roCw1Wbj7RzBf+HCgDxFJdNpqxDYLHgg14H16/x3bi9+2H?=
 =?us-ascii?Q?a24yM42Anso3v3pctk5wKjBBgG47f1aqigydwafgrahhy+ueqxOsAipplkUo?=
 =?us-ascii?Q?ohtepmxQcNQPSkIA1Lpmh3DO0LjjGRlZ7WBD8ovLEYTRGawuKvJ21fjbquQ/?=
 =?us-ascii?Q?lflyb/b/Xz+zgpZxH9b9+x9tm2ivOzkpX6lPTdlvCpVCicsVkWLVwYlHgObE?=
 =?us-ascii?Q?cS2+aYFf9a2ZSz5FIUOaln8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790dc684-bb1a-44d3-99d8-08de0ad935a4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:55.8392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkS5Mx0mejLv7dQXbddXw/AeHNdj1pxcE8C+fp6MZ/77LbJec1c3pJHdCeSxpO8hZHxxzsy/k2yTPwcYkzxbZR6tIqE1sYSlCcd9yOCpov9ec7QncJNRs+ebM2CktTpC
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
 sound/soc/codecs/idt821034.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index a03d4e5e7d144..c2b7697544773 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -402,7 +402,7 @@ static int idt821034_kctrl_gain_get(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(component);
 	int min = mc->min;
 	int max = mc->max;
@@ -433,7 +433,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(component);
 	struct idt821034_amp *amp;
 	int min = mc->min;
@@ -487,7 +487,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 static int idt821034_kctrl_mute_get(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(component);
 	int id = kcontrol->private_value;
 	bool is_muted;
@@ -509,7 +509,7 @@ static int idt821034_kctrl_mute_get(struct snd_kcontrol *kcontrol,
 static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(component);
 	int id = kcontrol->private_value;
 	struct idt821034_amp *amp;
-- 
2.43.0

