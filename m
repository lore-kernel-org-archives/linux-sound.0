Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011050.outbound.protection.outlook.com [52.101.125.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2CD30B503
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416039; cv=fail; b=Ll4z9q21WmjYHJj7Zepe1CpO320JWEoSLu3oNa/QvZRw2Fl2l+0NMG4Q58jZt6Bj2cstFFE45+Saj75FLHIX2MxT9jT02lk+mKnbEoI6AWJRY6m9hyTi/zrE4M+AAYf0lqZ34B9fSiRMLypWwRP4SCFS0aVUS6Ntj3s/CMibA5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416039; c=relaxed/simple;
	bh=w7K3rrEEXjgd4Ge9MpPh+Uq4W3+XqIQ8OPz/q2Wj81Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Gft0oAjudqdCTgmSFQELC6BRw8jsgXGO+XwILtpj1Ssaq8gjidBAdCfsTSkexNe2wyG+hJXNyWGS3YOHQyD6gtYnjYrBO06fg2ueQr3FC/MofGpT+5xBGSoI8tFJZU2cHsdAn7o/dsYHhwIcJRrO9e9ffy/CElc6oye5hDgljN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NQMq7jP4; arc=fail smtp.client-ip=52.101.125.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NQMq7jP4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dt9k+yMx6UfJWtYaNoOglKeGohZWwOlZk28ZMSkXUHdOcMJxOP/eNsTvRL0yib9+HsHcY5lWy9RzKG70neIEajBLg5VOA982WHZ3kqvFW3K+nJ3t26KHw6YPjXPBkIPtF+CEwE1g+xorzb/qn9uK5PS6AfacP0PenwYRZxkOhuT5fpmyYOVr5NyTmUGmvYJ32J6yoAXgHQ3A/xoSSy8MOvv1Osd+mT1hs2ULaiCgqxqDETyZFXhE12F1twElJuILxZ9oDkdf7GBrXAQwlv9r5DfbrBaVq6tQYUtxKpRQFosOYXCG6JdcDACLQ34TERlUJgyCTwC9S2CqtZTZFOKPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW+lozFI4MSsxq2CdBgmqUWYifDQsB0oIUgH+9CtcBs=;
 b=cFMOxliZB00wgbESySFn5VIbO8zmYwPTwzbuDzUIkWLVESS5p3VbSHFNNHOqK/P4I2QraHy8ATfBIKX5nr1gROwymPTGkD9fjBAJBfEldgdJRxmphNpjbKornyD5Kmb1Zg+Lu6onmPJA0PpllgBuiYbe9HCKMWEf8NZM1gSmkz8yrv6le9bvTyjGl0yWzhZQ1iIFQP0rWCqS5w9CMdaT61vNrP9YyDLE8iICA6AhiTWexnoDyK0ri5e/NI1o9AICFi3HtaAAe3SGdYvCY5x6TIiuFmtOXtxU+enOzG1ZYO9pLfG1Ke2yXsrEvIqYl56VIxqVyr8sYpzaStSF4dv0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wW+lozFI4MSsxq2CdBgmqUWYifDQsB0oIUgH+9CtcBs=;
 b=NQMq7jP4SczPgIIq4qQ9Gcg4pTHfiPLAbcCetcyHrcWu8Kk0yRObwo5iHlbUWB1mnafkVMGOo7HA8h0uU+d0s5DLvuqpIS+oKmzkZPauCY9SiNef4gZrFkuWe6o31X7DWSxTlkLo93JBFC/v85eccGNmTJ9esXW5smvOXFRnd5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:14 +0000
Message-ID: <87v7kim7kt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 125/139] ASoC: codecs: wsa884x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:14 +0000
X-ClientProxiedBy: TYCPR01CA0021.jpnprd01.prod.outlook.com (2603:1096:405::33)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: 394843fc-3809-48e5-e637-08de0ad9f3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gx9NgNqUIHmPejV1cGylkOmCzLuXe0h1mQGcYjb+otYEYYuPaOWEI0gVfczM?=
 =?us-ascii?Q?hpgU9bOcww9wfL0ZMOOQ9bkgjA2mQPzqwG307A+x96aqPcG3NjfoGnRjvEdo?=
 =?us-ascii?Q?yDw7+lkLwls997JrwHyMw/H7iM6yZJ1R9adnHWd1e+IgJ3rdlwaheZeqfQmu?=
 =?us-ascii?Q?LsEld7yvFxC276y12eQpe7zZOsjm/mBCiVdW5eTkg5e9YTAb5+gk+//rL7F6?=
 =?us-ascii?Q?wmiV1fDhP5NMaGJds+FE3ganHs0INRilnkAs9qfS+JrG3cc8OpFlQs1jtGND?=
 =?us-ascii?Q?Vsd+mq2GcPS66HQwdXnZIuok4SoW4peBbA0F15/Sn1POIzZLNIgN1SuewIjz?=
 =?us-ascii?Q?3s12SD+a7Rjt+ckkny/OGNhj/fWPARSPxPptFCSmdjK/aWeYvT3UmqpFG+sq?=
 =?us-ascii?Q?DgIrTrj3L6n3U02qO2XpT7BJztwSFSk9c+4Gq4xV3Hn6ekKk+uynHtQIqYZl?=
 =?us-ascii?Q?hN2Gam/cNnxRh2oOnPq+7e46rY6g2jwIGldOVibq1gA9VQK0CzySysC2vjyM?=
 =?us-ascii?Q?lEBaxKrFyrKZR28pMFCLL1TP1Ag5P2Dd4rhVvBUWoZr9fgRml817Ca9ELC2V?=
 =?us-ascii?Q?cJhvqORc8grTGKlYrVdlGYqWsvFuYyy1/0rwwF2HYhduNe0O4xbHFa0QXD4B?=
 =?us-ascii?Q?VYacU6XCrKqItn/ciMh0NyYCxgnnCVuc1QXZLfUdEAAb7T+Ufz5tCzjKsI8a?=
 =?us-ascii?Q?Wdm1WkDG/rHvVw1c3T4n8yNBKIj1B95eJEzycmg974qqaoH4rr5RlN+59gcA?=
 =?us-ascii?Q?HZdMdPlpAczGnSOEe7TVbS1KPtm3OvfIBj70TOOkayS03Qpu8G53cnGGZzAV?=
 =?us-ascii?Q?hVXsx4XPQnES806Op8cR11kljkwuyyLJ30uELuoRlgxfcz9zMHqPJ7e1B3IY?=
 =?us-ascii?Q?BUM3EyCzJatLvZl9lKYgXDJwtAlcy/E7kyytU5Dhq1S2aeN57N1JMMHsZxdc?=
 =?us-ascii?Q?uL6eaRh/DhGhgquvDP9XLy0uaQEfSrm3BtJmRl5/87R2hXvUqwmdBtGwFX89?=
 =?us-ascii?Q?YGypVK3uAQO3mUXJzGr9hfw2TaVuUBxGQmWlhOu/TiTuKeSp0aViKReVlrIf?=
 =?us-ascii?Q?WXBhO78lbECq2zNZ8lC0ay5UYiCS9SvIGy51wU5OM1rx3muZUePkVC7DKRx4?=
 =?us-ascii?Q?q8K7J6QRP8Dw44gc4UKckcqum+T/rwORvJUWM+rWI1BzPdr+fc0zCtAUQFcN?=
 =?us-ascii?Q?bcY05J1R1lB+JaazDAxWd1d3HU7KfHeG0MYdnxaDUcCo8DNc0UxP6a8nNiaA?=
 =?us-ascii?Q?KzGjkGE5WuRquhuV0J7/7ZYxTQM3C7D4PprL+OWAScEnom+AD9YwIYwknFY0?=
 =?us-ascii?Q?OxUp7fdIIPij9U/9pWzyFc0AxyTNZ4Nap0Rmo9aT4SS4uJ9BCTU9pjOiv9bF?=
 =?us-ascii?Q?jTmeWql2n4EWbJDaP7XiUnPE1oSg7gFD1eIpZBQRTfM113oXzXhSLK9Ju6+i?=
 =?us-ascii?Q?rGbRstiNAyyl/0cOfDx/urkjGkoALhSnYw10T0EBkgdy2TwHHPrk2wdAvA1x?=
 =?us-ascii?Q?ElIttvNw5W5OOm1O3Q/3G135gBPmhIP/wCTB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vgTxyWlPGfV/eZEvqDyO7m07+d/EfKkyhchzUeuY15sIHoXb8d1hv8Wcwger?=
 =?us-ascii?Q?XiqWqBBI9bTuKrTZVzB5BbIpBxC80eiGjJplw9o8YKpS8sx3i5pGrEGyfv6D?=
 =?us-ascii?Q?sDaeGU9sFs8oQVX3LKLeXEYL5dmcI8mQdZg92GEGx/mXWOEiGrX37gGgbvmm?=
 =?us-ascii?Q?fln2BBoUNs1qoobaBjUTyabSo77UdeqBwhh6cGKscOjtA0geEtDK6LqbYtia?=
 =?us-ascii?Q?z5vfQjsQ+UgPl/5c/oDAtPixfUTDVoQwp50fTLSh68U5hX1fxyJsVKqLzKaq?=
 =?us-ascii?Q?BrnDisxJQUJGstGRGH29UfhvtivDedapdULAOm0Sd5AKm9PJt4P6vtWa6Jjq?=
 =?us-ascii?Q?UvRj253eVwPFOERpVIz2xHGEzvx0zBYo1/cCYhQaaGubw/jfT8QGU3wapPUc?=
 =?us-ascii?Q?IiH2dFyg936sMW/Rpr6JKiD4a9OOt9Zh0dRm054KEKSnJUBzZC+ZPfW5omYG?=
 =?us-ascii?Q?ubC5ysiu/ngerfd7bILnTFVILuWHxmF5ZEyA4+Pb6bqdmX1KUY9BE2EvAZkO?=
 =?us-ascii?Q?jTIexaSknEFn/q//ug5P0HClFT1Nkkecrk95PjSqIBhpTtjVTV/r36PSYH7v?=
 =?us-ascii?Q?q06zKmOzNQoGo2OIwyVgj4KuoQn6LnmI5nAGL3tfSRsiu88i/gGNvpqWxTfI?=
 =?us-ascii?Q?jv4f4g0mI+P1JL5jmldz48L6TnWFhF8ks/sV7oNpdPwegpg99ps7u7ELNmZE?=
 =?us-ascii?Q?HtnnIzm2lTTeClk7CEUr8+bwQmyWwooY8jIfAvzUscq4ohDYo8MHeDjB6LTr?=
 =?us-ascii?Q?mIAGL7NFR3Ys14JW/FieYo6GJhZOL+vHAiRLEEytUUszwGXYLURsL2wlWyoQ?=
 =?us-ascii?Q?YMXhaLmqxmwX8Z6ARRADA6zgJOEVea6lS9X33HbV8RYogfsacFwAULQW31te?=
 =?us-ascii?Q?RMpMyisVqR3lbbYSoIJRM4Re+xzT0jvNrSYV2iCuusPwMPb+nYmFp5Avm1D0?=
 =?us-ascii?Q?R7I1ti0tQlWc9Uvm89ziXn9KLWp98Bl8BninNgWq5voEgtVEk4QHWigumO3d?=
 =?us-ascii?Q?WW41v6ymj0DnNf+1VCPA5VRBNX3wCEzyJha7hYFbjsAYpTUuWzrcJZapia4P?=
 =?us-ascii?Q?3ai4gmIJUrITr21lrVN3gjp4eEAYiTppzyRxK+Dt8v074naP0e3o/S5xdG1I?=
 =?us-ascii?Q?9DpibJiyXh0xxA/0t2J2ECU7nH2Sch7tck96HvRX+oE+k1i+ejJGi0lg90iV?=
 =?us-ascii?Q?UnOIZ0jL8VB30Fom9LJtuqTSzXP3z3JJTnCbiTBTGT7iRaZ+Bj8aH9wUQtEa?=
 =?us-ascii?Q?Q4IrPeGRlAEiVCUY92D0xdfR8hG2knyG/RoOYYM/NgZWtJaKIonh/1BWJJRR?=
 =?us-ascii?Q?LTuPMiqn0tIjqxpshipP2X0DSN+jlN/L3YSv+ddXTLWqCJbRgjoFH6mDyuBX?=
 =?us-ascii?Q?xbA9/Fs8wJJnYCdqzG1/MPrnCXjTpK9S1VA1tDIcjoD2awNw+lLPe3RC4yyH?=
 =?us-ascii?Q?hywSz7XlVSk6y/f7yV/sOl+NpIGN/fz1LIAdzeH9ZJCnuij/tLBd84V2kJ2d?=
 =?us-ascii?Q?tNuq70arSGGEWam2Sxc18KKV1ArGq3EWCXC8mAHyDalf/M0xsX1eQN5zMqQc?=
 =?us-ascii?Q?4VYqqxN45Xww8rfChUy67iyHV2yWA4yBYWf8Z8mYAgRyee+OHosew4YegSPR?=
 =?us-ascii?Q?2r2y6DTm5ZqVuaFZDjPyU5U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394843fc-3809-48e5-e637-08de0ad9f3b3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:14.7588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rjoRsf5LMVxd+Y4agRvLYindzvJyRS+sZpUaOjP8qvzEuUukWYufP3QUxBgF+LPI6ApwD5VlYjxLqyRCQoKOf5DGgsvRifR83XOPP72ueYu31VF/oWWcjpEWpoG3Bi4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10584

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
 sound/soc/codecs/wsa884x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 2484d4b8e2d94..887edd2be705e 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1587,7 +1587,7 @@ static const struct sdw_slave_ops wsa884x_slave_ops = {
 static int wsa884x_dev_mode_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa884x_priv *wsa884x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = wsa884x->dev_mode;
@@ -1598,7 +1598,7 @@ static int wsa884x_dev_mode_get(struct snd_kcontrol *kcontrol,
 static int wsa884x_dev_mode_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa884x_priv *wsa884x = snd_soc_component_get_drvdata(component);
 
 	if (wsa884x->dev_mode == ucontrol->value.enumerated.item[0])
@@ -1612,7 +1612,7 @@ static int wsa884x_dev_mode_put(struct snd_kcontrol *kcontrol,
 static int wsa884x_get_swr_port(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wsa884x_priv *wsa884x = snd_soc_component_get_drvdata(comp);
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
 	int portidx = mixer->reg;
@@ -1625,7 +1625,7 @@ static int wsa884x_get_swr_port(struct snd_kcontrol *kcontrol,
 static int wsa884x_set_swr_port(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wsa884x_priv *wsa884x = snd_soc_component_get_drvdata(comp);
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
 	int portidx = mixer->reg;
-- 
2.43.0

