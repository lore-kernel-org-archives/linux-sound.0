Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285BD1F4CBB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821052; cv=fail; b=hPzOOnLQBpxQPebG94unRcSLiFDFEYGwV+x1/m9bykkKySj0Y90l7ofDvFK6OaF1QSLWY8U0CySrZivM800MB2RaS9+FeXFjpIu6b3o8ta1fERFXA+9goLPf8q+/fBtr8irH39bnLtAlJL3OxWllZ4AF3Y8ms7bOodVnsF65gU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821052; c=relaxed/simple;
	bh=WptT8EmV1FNcI+yzu1FWxI6PFfoLgp83bVOD3437rxM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ovXi+BH1eg3xqncOzeiDSjWdKI633S5o893ctuTvGZB/hrUhHvsOmj0iOCLXe1COt1mmEygIuWa8h+nL7xLWmgxG0rcpbV07eo/LqwH1Kx1B4Pvph59Vues/xwlizzTS7/ElPIJyflRnEt6wbrKDrkbIQLxTkDxkh82LTBZwLVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cH/oJkHE; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cH/oJkHE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOd2kZVDij4tNfsloDDxpEH/VpqNLUb+W22xXXzNY+5FOtQmg4ltnLqc/6cMOfHykluPrcYQ6214jlRfHtDy8oHv2V98wjbu6uAhJNwbq+FYErtA7E6LYYWdzvCRYCevnuSj6x7DJUJXMV3+SGKdgQ/JtPRif/KxLJ80ym2nkk9dYzMU1T2pAp7dhLx9Zm8JvWeoHKTzTMNgGhkbv4Ov/AJ1bKtFiQeywlNaUChoJ1rB/uAKAMk+fHSngCnthO8Ykc2cYERgq3ptc/RmnFP/FxkHBu70bzpd750FdgDaoiiVx5R0958BLO3uyrR5QB2V41gtAy2MpXy/EL9H7GRcdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SATpLmVogJ10Evgio8ip1QT6bPg/G/KVdc6AVjsMvQ=;
 b=KmI5TCIwQhCuxM+WV3kSj9HZ9aqqooj+VJA9v9JgXWj6X9lyIEOiIChYd4c5xKKwaRWJFIu5sL8XzMTzl1tJNXEMdmPIi0LQkt6/jmjcaA9/hTnKq2CIEobT/OfTKFdjmhGqzgwMJNLaP/QEk0R0l1x67r/0ZjDQJGuWenxifyoeIgYvkxdauL4MKuR4KhMQ9sDrRRMJmprxYVS0/gb6fatHmjFc4xCzpLNL283YmCGXFWl5hQqP6EIsKExHU0LZU8kEvYZHRzqMgjqxlQXuilA5Q3yY9X7xguQEEWUI1Pe426Sz11b3Fr5C4vvb+9gnzV2eSwPim4ceni73ExLS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SATpLmVogJ10Evgio8ip1QT6bPg/G/KVdc6AVjsMvQ=;
 b=cH/oJkHEqOL4NQmH4tr63J9LH9mdC8QiQ9MMWbJ7QDffC0iHgyFA23bj4RRuQKg9BS07i1BpUJuax5LpjnlTzkEcSrgDY3t+7fDCkpq2XhJLYwiiyzuX7znr/PrED7uVS7mR+LMKkZsp6Wa13UZPERr0k48y2H0vkKmaUcv9JSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:49 +0000
Message-ID: <87jyzxxvev.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 194/292] ASoC: codecs: wm_hubs: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:49 +0000
X-ClientProxiedBy: TY4PR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f850e8-c134-40b9-925e-08de20b99023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P7pkJNm9sK/O2o9XalJa/1x+Dmj7nHdUyJ8U0D2W7Eu1whnRwiQJzFQIpiVc?=
 =?us-ascii?Q?qkAZX+E6fgWxBg6PMydySTiDBgZjbkHXLvBs5h5ix53lUtect0myeChaNZHS?=
 =?us-ascii?Q?RtvJ3iXnHx2vVL3kleWU566MFyiandQNCmhl9GaWWK8jKdrf/hKL90OEFWw7?=
 =?us-ascii?Q?pYfG/qBqqZ/AIyLQvz8Ef2snMkSRERuQrvDVbixzql7axYy0T5Z53KXEYRfj?=
 =?us-ascii?Q?6z3bJ1tODv6ksB/qbZgWmkHcI2YIijYds2rDpX+XOA+x9r+p0/iJ5u/lpRYp?=
 =?us-ascii?Q?x0BgYNBhYYGgXad+oGKROlTxfC1wLgQETvIU4EZxijERZAEjYzU8t0hVO+Re?=
 =?us-ascii?Q?63iHOYjvVeG0mrFB4VuUlLa4t6JeLLq2gb+Ak7dWxsLKZezn75MaVDQQni71?=
 =?us-ascii?Q?wdd++JcQQk3CnmTuoy870/5oqjeRdg+PabXr62LdYOYA+MGL6p+JWplgayv8?=
 =?us-ascii?Q?oSRqpBlJectPsqfPf9yRb+QdjJ5VENKI+0oFASPCSfQMuAlnOY57/oIpaba7?=
 =?us-ascii?Q?/j59EJ+y2G3kBp6sgpEmDf0edwNIx6QpfvJcLoTAlFFar6JUmIHLWPguWNx/?=
 =?us-ascii?Q?TYp/9IhB2yXk6Y/Ah7WJkvoMnlVOW6uyhBFBxTGAkQUfiYLrIfb6a3kr7eMD?=
 =?us-ascii?Q?EeTY0KyiLUInrWXQ20S9oCrfs+ZdaPLnD/BUYOcxxjbH4XGfhemHMOx5P1oB?=
 =?us-ascii?Q?SrUVim1PA5RvVF1sd7rdqrL+wqCg43fHzIptJYwaCECE1vWCTyQbatyr9hS4?=
 =?us-ascii?Q?D7eS4VjVkR0LmtQnSPcrEg2UZlsHZQ0vhy58f8dF5So79fFRsKBXgKYR/4af?=
 =?us-ascii?Q?KTjeU1BJvGec7HgfGiTGGOAWkWxJ/drcOEv6mV7rovb5pfcUR4tl4dso3Mst?=
 =?us-ascii?Q?nURWAKge83esGYLemnGhvzjH6wlW61ami/YqEtQ8JqY/mYPXEX+tUsBnCez8?=
 =?us-ascii?Q?ULVqOc1LahUOVPM+a8PLtiIqO52LuRxKFJUYeIPnRTMgwjZlhnGcOWPhHHH6?=
 =?us-ascii?Q?0H4hdGC2nUPG6IbjgL+wHvIJCEgxYyKwBq+rQIwUI5X1WxG788QKoWyrSBUn?=
 =?us-ascii?Q?vOIZbnzzDLDGQDC54w13+ojyqRIzQNfTWiqwK2IDRVXKX2PxAi/i8c1saVqK?=
 =?us-ascii?Q?rNXhqmAL9JfoYZnZb6rG6kQ4urlm6j9O0QZusHxo849QUMEIhGRMtisW9e0A?=
 =?us-ascii?Q?IKVCX8jlqKr8ans++gnQ6VnuDDCtO6o+0HCf86QMHGZd66o80cdsDQFBfVnD?=
 =?us-ascii?Q?tFmhScY26maojTqzeoq7eWz3lk/1ZvwTUOW9TTFhywDdXNcTrlUjFDoQZpB5?=
 =?us-ascii?Q?T93KKeoAuwhINsniorLAgCDsprK1cpo9clhWB4B35gY7OH1VDcOmJMv9oWRQ?=
 =?us-ascii?Q?BONmeRY+zbo7T4SQeNV5IkbrdJCAiv+14EJ961l1gzEBBBIMn2PyevAc8NzN?=
 =?us-ascii?Q?sATs0nan060KIaiNLrbEXgcg0jr4j6apDnv3lfRgx6BaIqrdda5p7gc8AZyn?=
 =?us-ascii?Q?XGaaY2fgrvCqEQFGBIPEyo67SAawOYHJJXrM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rbp3cZASbkSueD+aqlHXTL6S2M+Agg2Jni1ypEsTOa6rlc7qnUvMZ2wjEPpN?=
 =?us-ascii?Q?0j5HIcyEHtEF//Q7OvIeQNkovKKJWkLu7zmuI6n3S9NzT9KNxzNHNRz4Zsvu?=
 =?us-ascii?Q?PtP1GBdsLnIk2uWtu712HK/GLM1d33EVwR5JEJxi5OgAE+6Bzpzg0iErF8Hb?=
 =?us-ascii?Q?xRzQLaskMGztdIM1+vgLjUYChlzy1W5bmRTCbC/PW+MSejvfzeea9i3qsDn3?=
 =?us-ascii?Q?LIFpm4fRmKOzYuUMBB0fzyGKFLKKjBdIxbWypfKKFH+fmu2uKWvTUXvfYt0a?=
 =?us-ascii?Q?NKTOk96XM0KVJlWH/sbnDV5VklYZJk59d/TqEanSwyjo57Q8Qnwk5lPDJvUG?=
 =?us-ascii?Q?KxGo/Uux5UMOZ5NfPa38P7HXANGREBzIdlJsNMMLoJLMTN6dbHd8m/1rK3eO?=
 =?us-ascii?Q?L8Oifz7lpmUu78aASirjBiVqBhFjYHeV+U8LwuXcnohfLcOHbYHKmMheFdGf?=
 =?us-ascii?Q?ww4NHA5b8rpxMNPppmxQBHZ+to1DNupdb/7t2A8A9VUqXKI8TuuheGE0IwaT?=
 =?us-ascii?Q?ywxs6M8ZztYRZFzGeQrBPOukQPFrsVpIqXNbw9yIdDEQF6Ae75DH6SKh5RIZ?=
 =?us-ascii?Q?V+LlPY4AMaWcnM3a+/JILL99xZh03AjDzdsZXJ0G9VTXAomDaYS/IX2E5eTt?=
 =?us-ascii?Q?rm2ECPDhNvMCKz1MfdTN6UbXnyB31iTS5QslPz7kxvrvMQiY7f86mvEo7Z2p?=
 =?us-ascii?Q?qS/TBHN81MDfIpTHdMlb1NYUBx58ibAWTQCRL50H/UK2gc0Hpksf7ADELiyD?=
 =?us-ascii?Q?EmDymMbMNhLo9PLBPJ1x+dOl+jaUeQqenPyo/lJm3er3Istc9RvbvlbqG1cP?=
 =?us-ascii?Q?M0Ga+vb3Nbxv0Mv5CPC6gaD5G+xiUc7pGHbyNDPmErJGE8aKGP4TpXPgX5MD?=
 =?us-ascii?Q?cPIjvl88/S3cUjsTEmr0gQLzKRHgLuZS78ImzZ/FMDm2Jdxncw2PEH2BiW1+?=
 =?us-ascii?Q?OpxFdQIiLbA6wzByz6Xhu7yXqg9VYECf7ilLwzbzCQgsU06Phi7mUKhYgsso?=
 =?us-ascii?Q?J0HL4jYstjRKsmukvJ6Q9nDfcedYQStcdEz2nTCaDBOIyEgvtBtgWah+KK7N?=
 =?us-ascii?Q?0GLD8QZ/nlsVouH5TUIDsHIcSAcANYLNNyh1QQCgYcyzO9KdUjtoY7Upf3Fw?=
 =?us-ascii?Q?J6uAWN4jZBvI5ARwpEMjOl+116IBlUFzGpZ8iA/VvMX2HCT3AGmiYbEYWI7n?=
 =?us-ascii?Q?EFe8VWd/1Q6QkIT65H7SRF0xVN7hyjluzCVxpySTk4Ugw/FnntonRQSFAUlC?=
 =?us-ascii?Q?sdHqz7LH0/cGWuGppv87ctEPXzvbRDhLb8JGdpjOH8iPWqbfk/Vp5Z6K4Q0b?=
 =?us-ascii?Q?nUsv6tna8MAutUnhUw05ypE3PrdrOcTGbakM8r8+FVB6GFZSU/7dV5EEjqql?=
 =?us-ascii?Q?wqrSpZHp+Wnow05PruQyiBMv+B2GS/0Mo9/Q1SGq41IcXNFD0/NQ98ZWmAs7?=
 =?us-ascii?Q?S1A49vQLnY8uvXg6GSa3OVORNNgqbMNzu/EnV8OaWdJilLDb0ADzX02sCqIB?=
 =?us-ascii?Q?zkOnAneAvveIQcCoGKV6WiGdSTFcbzHSN3AD0tAOz3wh/9qP0gFX/1/cT6xz?=
 =?us-ascii?Q?Y2l0LQStj4VgF+S+FvfbrpVQy7NWDInacreF0EkntxkHC2OFSj6SvFz6r/Xr?=
 =?us-ascii?Q?maHf8TRqVYcKuX8k2GmwsAY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f850e8-c134-40b9-925e-08de20b99023
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:49.3517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2gtGKfYTisuFIBHjZtry0K7CAn/HrTLJGUJwL7hJeUdZ6GUhjXFn0SKUrabYcniPBVj+z9jJN0nm5Aymg9bbonrt1MmvR5t+kzkNEntO9IF9dU4BmrcGIvBX/aguG2w
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
 sound/soc/codecs/wm_hubs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
index ecc4835a7ecd5..f80dfc488e3ce 100644
--- a/sound/soc/codecs/wm_hubs.c
+++ b/sound/soc/codecs/wm_hubs.c
@@ -694,7 +694,7 @@ EXPORT_SYMBOL_GPL(wm_hubs_update_class_w);
 static int class_w_put_volsw(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	int ret;
 
 	ret = snd_soc_dapm_put_volsw(kcontrol, ucontrol);
@@ -714,7 +714,7 @@ static int class_w_put_volsw(struct snd_kcontrol *kcontrol,
 static int class_w_put_double(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	int ret;
 
 	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
@@ -1112,7 +1112,7 @@ static const struct snd_soc_dapm_route lineout2_se_routes[] = {
 
 int wm_hubs_add_analogue_controls(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	/* Latch volume update bits & default ZC on */
 	snd_soc_component_update_bits(component, WM8993_LEFT_LINE_INPUT_1_2_VOLUME,
@@ -1156,7 +1156,7 @@ int wm_hubs_add_analogue_routes(struct snd_soc_component *component,
 				int lineout1_diff, int lineout2_diff)
 {
 	struct wm_hubs_data *hubs = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	hubs->component = component;
 
-- 
2.43.0

