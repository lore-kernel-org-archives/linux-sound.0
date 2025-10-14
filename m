Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87EE78F2E
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415576; cv=fail; b=j61to/0d5Q9T7QOFxODXfChP3OENzBCgIt8HW6RPGsWJrh5UAZhgVTVWNxBRz4/kaWT0USXksh+gwir9b9F0igMdAxbvvHOH08pMSgbLaYqWjs4OsqoCNbQ57LBwmRGUYpiCBHkk9w8Pi+PU6waHq+18mpnxOaQ8YUPHh+ZVpuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415576; c=relaxed/simple;
	bh=H8kpx/J8VSEGehmY8qqSbS8A2INAU4Qg9tn/KHMoBug=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LOauNYHPQpwv8IcT+BV7k6Ze5828O9dTSeK9KJEuvRqwt7jBTwCTlZ0fLpn8uHISg8ndD0kR0uWrp7ue2TImoKW6gPWXZzx6T5rQCUDWaAj6y+LHTMF3mTBKH8hbtDB4qlBtdoR6Lq3czPBG7Wvhmq9j6k4AGwwF20421cH8mMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fntby31W; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fntby31W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skT7LpmvLBUPH/RWE76wGf/lkNuRZTpv85tTeUx44TqelBu/zUAeQv3RurflXBkAGO1kmJ8X0GaZMWhtT/xGqC/JDOnTLGR/6AhVrsy7pgy4gYvwEdGbA2++B/hE1lXmAHPxMYiT+PQj6I6D+owglON5DOqbVYn91sqqu5AvFAnKzGXcRFrna0cs4QWTzlFS2TPHTh00jwwNfyUykU60HRLB5y6HhyMXi4b65Lx2YBuUltGMaLanyOwVv5y1fCxkejoGWjUcTFg1/Nctp3hVclT3sXCwvdvTSV/wC1Z68RYRKS2p7eqLNQDl6jw3KVcP3u80q5JeqRuN26wCfKmPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1koqiO7Ptr4OaYh+TSb1AoxnjOG7wdx2MDo6lpFE6s4=;
 b=V7vg/7fKa7fsrT1exY2tUPmNODo4JuI6Z/tEAyxFBhjRRdC7ISKMEhVtcEszY72OOvfeqw+dahvwiXCo8Cqe3tLj2GKkbnEoP4JZwyzcgGMenU0dQ9F6iy4bZMafFpA5kuOmk42uh+fH9vQnVCPi6akXq29B0N+eMQJFXSHRpYiSXBzCBDwqZ0aDWsox19A+d/YlOvZbo2lXkQmlL6sGH+JzzHoIARnakDTOy4/lkkf/qSFxbyuoMujaGZRo7PNH+2a9vKoFtiSmZh96KHmNkDKG73gSaPreAaR2FKIb1pv5qy2loFPgaulrV85YuEE5mYndg0EDNMUbBSert567pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1koqiO7Ptr4OaYh+TSb1AoxnjOG7wdx2MDo6lpFE6s4=;
 b=fntby31W5eEX3jUlFqahMXR+GHSazZh/zv/sxsq9obDgDZzyTcjCy2CaK4/ZnAVYZeciCQMJW5h47Wnl9mwM1/mdDh6iHy40rTo9ziluhTw+vo1/h5xm86nvdV4O5sdU72qmJpcwgcvF5V8QYaU4JQETxNLQCWJb+YfHS+0mp6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:19:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:19:32 +0000
Message-ID: <87sefmt8rv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 002/139] ASoC: atmel: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:19:32 +0000
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 858d2911-ac25-4cce-545a-08de0ad8e02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pfiepZyuWYURP+xcL10fnFYI3po4ZzBbm2CTRmb6amvTReZ9iEk1DmNA/VbM?=
 =?us-ascii?Q?tnznni12YbgtAtV2y44VbF9dKQ2cSoxGd3oL4qRuqg9AdH39xt5h70YQb9nb?=
 =?us-ascii?Q?iiwyJkw3Gsk514O88dH7btPXj0bmR7hq8b3J6tkn6Yzft0Bk5MSmixbjcOpp?=
 =?us-ascii?Q?lgPWEOz3F/51e6q03mu00iuuYv09TOhpoRD2hj5Z9VjssmqYkGJw7YQB5HCz?=
 =?us-ascii?Q?CYoi1cRJaV0zH0UI+HZMntCcJ9cg2NYEHViPK1EPZHvunLL79mbpQJNvewtt?=
 =?us-ascii?Q?SOSV3b8j7Fwa3UGwLHNKvz+RRFKIlVoGQiKd2ZWA7GIQWFKqENUo2CHkVh2o?=
 =?us-ascii?Q?/LRgvC8f7Cx+agugOb2U2YEmPHtZS80L878jdNr0hjz/7RTBYWwz9xqb9xFM?=
 =?us-ascii?Q?H2TqYPpXMdrL1pZ6oBLjrBdvI+dRGX+lI8J65QzpddhNLFVxb2vsOODtT0nZ?=
 =?us-ascii?Q?Mb00TAgGpP0wjwP+Pz29IG4vJy0N3q07tKIG0dxqdH2+OCR18AGSFbgZmW4O?=
 =?us-ascii?Q?iX2og8pxqxM2BmD7VZAiR4e6hXzIoTyxehhIKMolFwJvsS1bYhZGJ2cY6Klm?=
 =?us-ascii?Q?zw6GNYuH0ZSrs5KM7mzhQixK2EQIcLYAfr0y5KoWRfQspvxlUHHQZeUthMYo?=
 =?us-ascii?Q?9bDgg46u/T1pTu/ZKL4NnCTsrjcfoO1PQiAD/CIAVdsY1/bNTuxJ1IBrG50B?=
 =?us-ascii?Q?HLGk5LYr9en2FZ7Trb359nSY4HduWPaPaxFa3XdfxX6/cYRZY7CYPJ3IDqaR?=
 =?us-ascii?Q?QE4dt2/7AH96ULp4SUETEyouNKXoZWpZ85JTIcxkfJkoZXh9RruD7Cgvakkj?=
 =?us-ascii?Q?M6HfwFzjpQ1QBvXV+AIC44ORC6fvxnGhNYVbpi70nGwQbl44h4XKEForAI+R?=
 =?us-ascii?Q?Z8UUP+/pLiT2qm9uSnk9sGUqIvkXW5WMarKOlv90HtnFsU/J+UKakhGLCW7q?=
 =?us-ascii?Q?/gJAv1fKKSrBRYQsh9kqsGXE+P8+kDSp/1XII/kZ0SQBSeFqxwC0jgVnULUi?=
 =?us-ascii?Q?ojetwj1G5KNJF1iBF+bSYvzteT3UaL7FNiEtV1lpL96XxgzaE1tdcsJvHRNA?=
 =?us-ascii?Q?V68UfwJHoH7qwwQorqhcqxjvXkIke+pFJ9ZjwPTJYr4Wpcc+5AWHS8fmq8s/?=
 =?us-ascii?Q?gralM5D6srCFflpyPCkX7gU1ffclzgfRDaDKG8gP49JAGxWhbB+3dZOetTZM?=
 =?us-ascii?Q?2OjwqjwLIWgS0+UimHkvwsqr31H81YZSV86R7jPExEUOwIRs9KpeiGGRsCCJ?=
 =?us-ascii?Q?usfpL2pb6uH3tgRusadXY09QUZRHCRsAtMbCyo0rqVyU7tuN+h/CzECTxq1Z?=
 =?us-ascii?Q?i/MrRQv1Ln3GWAYXrq+bB7yzQODL2sHJADHpn5QQPXovijcCKBd4hBbeO4Lr?=
 =?us-ascii?Q?Py7W25t60YJUwaApXXeaintC8QPFP9L1DNt7riG5L4OlQ/Gj0QIdMV1N6gXR?=
 =?us-ascii?Q?Rn9vhALnoMvQjBgj6rqFWjsR8SAQWYHMGXI4o0LUU3KDtAlZWkWGkts/6+EF?=
 =?us-ascii?Q?hPxxbcvvEGt37lVofhB+CesAi4q+OgWwCesB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Iy8OK8Unt8Qdifsn7F671g/CmzX/ir+B6VZWwdJCRM6nHaD3RM+kJ4IjDt/Y?=
 =?us-ascii?Q?8bYKxZCwY4Mvx19Ht24OZDlmSoIWybqK2yLt0h+WMesSZgqWXI41Qy7bBzD+?=
 =?us-ascii?Q?FwudUelIbySq79aC1RezRbkV1QK1TEnwu3FHJ3pAhsz9K4cdIxAIYguvXeYB?=
 =?us-ascii?Q?CVgfLZfUPcqvrVJwXrQ4cCIrEaNg1ITnQdlgwSqVJej+Ud6XBSNJN+UU28EF?=
 =?us-ascii?Q?KedUTifTEOsifmdeiY5BlGta/tBss08sR8z429eTXsvKdlVNeklB8ryQLVSC?=
 =?us-ascii?Q?5zAY8LdruTNJbr89D5PZxvTi4VxuVr5rXScnMr4O7+0aExuquz0REBRZaJGZ?=
 =?us-ascii?Q?SvX+uV+KsntV+j8FIZNMDUlYzfV8hYA/vpyC7ukJgpMrosyC0XxwLEBhiYZl?=
 =?us-ascii?Q?438pc44II2hZtx1LcALov9QxQP891pINlSiLWI8g7KaeBnZywhYxWSKP+Gye?=
 =?us-ascii?Q?Sv0fH4iyTr44/dMNEE9MbPEr8PrlicGr0SUSHhOYuU+r7Cu2tmyWTZOns42w?=
 =?us-ascii?Q?iAQDULYVk1TY90erHA43U9RfBzz/eI9H0qVOxu5uUsd6a0GmWQQJGlxn6fr+?=
 =?us-ascii?Q?CW2QSX6OJzyp5CQd717ZvL8oPLLt0zNJoWAR0HH/8ejReNqlX3RD/KZhS2kO?=
 =?us-ascii?Q?LgSLZLK7cVvYUvBSK/e5/o1eEqA6vquHHaa/lrQGJwCx+CLR6MADi8hcjU7F?=
 =?us-ascii?Q?/M1wsJQDiumTb4Mk8Njddux+QYQsR+qtgCA6gYEJ1HPVYLELWaSlj7OLFdkh?=
 =?us-ascii?Q?ggRA4ah6t6kigNBFAL/V7yBo+5jbpS72+EM1JraYZW4SzbbITVlWsXBRgieK?=
 =?us-ascii?Q?wajtuErIZCOLzZcUusO/Cn/HNWwAQQeHdnzNsmnXWXc+SeaVJ5DK+88B4JIO?=
 =?us-ascii?Q?xky9y51JiNvC1wnU5HUpdBJ4SXJVJjYhiuZEbwTBYE4tkWqcqr2fM+DMX/gI?=
 =?us-ascii?Q?g0XuYYawHS3TyEtDEl6kinNa0IIZZOLesQwioL8z8DA136c31gy6PtMu2NO+?=
 =?us-ascii?Q?qQ9Unfn2Jaecqllce4qBU9/QqhVxR2j7Dm6ol5xkYwY5AgS+TO8i8EEYvzpW?=
 =?us-ascii?Q?gn25W9F3Y6WR4VY0bvbNMtQbI4c/1ax60pNS+o0vtaMUe8RrunJLEPH0d7vl?=
 =?us-ascii?Q?Ab+bV60csgQX77sijePyRHoL0yQj0Qvx2lecJkBTHrTyeZFVDg9+zxv/lCYJ?=
 =?us-ascii?Q?14vTLWSHnYJUqCQTsAUjCmDWwSCO2poF0ybrL1G550fOlBg6cwXvfByqA7BN?=
 =?us-ascii?Q?5Z/8veOyt849HTjlIemGobFWJ8RQJ3YHCEJ7eToWD/niHjrFKd/D39lUszUa?=
 =?us-ascii?Q?5kSpqIGVk2VxzQFZ/g/ZZVDAn+GhLUwcJR2yjAl3NYxU7GWvDbfv1TOekMyO?=
 =?us-ascii?Q?+HHv5fIJfOnqm1rlywyE6DWGN8rLK892Lmt1MrP1YrLoygtifzYopuWwYNRX?=
 =?us-ascii?Q?P/eEgYQbfWaD429MwL1oxhpIDLPj18uH9VyB9zuHDe34u/IQdve5rjrQjySG?=
 =?us-ascii?Q?EptUWVrVxIThhQEMPROcbAuIhIK+jpz7nFsh+DLtnjvlDthc1WL7WZtLawWm?=
 =?us-ascii?Q?RvR4G4zqUSO+hm5AnYISjTXSANr53AxRnR1JaJ2XeUE0z4YgCXmRhszAKzpE?=
 =?us-ascii?Q?VzcyCx0F6PEpLnLizo1unGA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858d2911-ac25-4cce-545a-08de0ad8e02a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:19:32.4223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLrPZ4FiKbnA4JhT1GTxd4NSvlepXwEIVEdDPQdUysI8mCW0z09Nl4njmahTvaWabQ317+zyt1E9/ClCNHnla9MdlyG6729WT/EPR0GpSL5ks0qlEsBipcljqIOPBvyZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

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
 sound/soc/atmel/atmel-pdmic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index fa29dd8ef2089..4dfc7e5ca8ff9 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -280,7 +280,7 @@ static const DECLARE_TLV_DB_RANGE(mic_gain_tlv,
 static int pdmic_get_mic_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int dgain_val, scale_val;
 	int i;
 
@@ -304,7 +304,7 @@ static int pdmic_put_mic_volsw(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int max = mc->max;
 	unsigned int val;
 	int ret;
-- 
2.43.0

