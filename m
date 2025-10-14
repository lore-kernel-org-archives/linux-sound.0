Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010034.outbound.protection.outlook.com [52.101.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEB7309EFE
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415837; cv=fail; b=ACJmw30FlRyepHVlKOsxo3gVohnFAigBiaYkDmkXw3aOVtJJUF56j2y74rG8QT1GgPS/CvEivsTREQzVEQv/E2UfCarOG8nM3CzP3s5zjyQS6fw30fWOHeuNMTTGX5Gqbf5ghYLqFGd3Rka5KyeUuZAXkQXOVi3iJXnLPBdbzI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415837; c=relaxed/simple;
	bh=mIXINJnxxLb7gsbBxZ979Tgwy0ADX0GAD8tKbYb4Rqc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZLLkhP1SKoH9s/0pt5aYo19OrL17w15R95YRVvVoiMyMNv5Jcv1JUKqilY7EF/BtCYD59eGPvK63/rusv96tYLBUQ5u8qPFQ0OrUQtZ00Jo7qyDuGeQkSVGxmwdSruEFqM+RhgZ0Jq6RlEJN0qETAhPwrXMGQAVXRP6nwcsqXiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MeqTAf3z; arc=fail smtp.client-ip=52.101.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MeqTAf3z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqglSCB3UlJpZD4LJMqfd3/j+DzChkJsKpLYwbt8d39VmndQqXQ8TW1ylZY0crHlusTwjga7CeTBV7l/OFnVoWxkVYag3MrXr+d6D+AnlgE21EzW7m4oppBQUUK4eZWnSg+07k1Dipp53N3KuEM09etrTyLu9pf6nKoq88Ajc8mdQkxFfYsb4eKYyU+IjPTAmPlq/uaf5Uh306uRXKVY9f00lq4cvz9X+/yxDW93Wstnm/k80HtClObJ8+BFw0h1zEIzVaaXLgw2Q2A+67NF9MvTs6i69wXTgYU9b3k3VvU4s7/PYTzrY5zMKHR3x6D5ogNe9xtTGxInVmgPfx5HCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQPVi5vZiJmuwj+2IgRO84dPaEaRSRHV+tGUbDyOBNs=;
 b=ckfq09YdFei0tmEf/N/BGid0vyta/5TK/sU1N9R38QvBlMJ2njT3dGbA/069EVRcQ4WAWAtwDvBSCFkYUHiHwToemJB9cJaxbZGquD1dxK/zdcQIJeJelhzBd9kIGQD9vG+60Sbe/RManQOnbUIj2Zz070TluARel9z3Z33QviDIhLu0u2QrYoOveG/y7n/jJOEveqAyhREfw+VAiU5kI0GbVSKG3lWSW1SgtqoPJppnlEktR2hhEFP1w4EwCoXGFsJa6zCW9EAhy3Tg79K+c28YPwN6Zrz7cBO5RF20wrtfdk4mf7C3W8q97q6//fzEtFMLUlMOvPrWqNsI5qlQzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQPVi5vZiJmuwj+2IgRO84dPaEaRSRHV+tGUbDyOBNs=;
 b=MeqTAf3ztsoWB3Lw6SdeVB4VU8+9Lks/coQP1wHnRfQX6lOnFZHsTeplUX/PJg0Nzsvid43vwS2rAg+SWBSTd9agLKcoJ5yGoNaaW+BRfBwr6w1XcVSJ66ktmeIv4Po0Ic+8t8oJPYIE4Hq+pyNiIAHc8tIhKJNp3nozoJI8C5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:54 +0000
Message-ID: <87347mqffq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 070/139] ASoC: codecs: rt5665: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:53 +0000
X-ClientProxiedBy: TYCPR01CA0137.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: fef693e1-cd9a-482c-21fe-08de0ad97c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9EAr+ecY7sxrX5+VaeqLILgjKjdZHnXl/qn2AONJRUXVhC8hGIuSlnNdNmaQ?=
 =?us-ascii?Q?FF+RHSvb2OdyKZNfmpNeNVeC+5KpKPAfdWWl30sYq2GoKbwhLQExcK4W5VMp?=
 =?us-ascii?Q?XXSeI4m9GSxXDj5k+din7akBYPxOMVSy437v6GnaRPZAdVea0BQNP6wHUaCf?=
 =?us-ascii?Q?qe4RPWab2l2jq2W4uzQ7jKDq701UJrR2VYvnmpKkWzNNFYVg5NdMduRqffUt?=
 =?us-ascii?Q?g/VI/r5eLiLfUe57w1ZITW3trngUoAk02hi9OJLTbxS10e+i7zjgj/dq5h6a?=
 =?us-ascii?Q?CeRoIUt5OtSaRaG5biLnXciUgESSp4Y+CUig7AA8CEzJvJPVkaw4teZyEXrK?=
 =?us-ascii?Q?6xUy4N3FvjqZJeS9+hmaH7whswaOMpqKqPqFqZ4DGESGhAkVo1Rp2xvOM6Bc?=
 =?us-ascii?Q?qy97kN7RDVrttkZ2HciXuYiadtGiBzL9htat0DaC8Un/DG/razoooXEu9rE1?=
 =?us-ascii?Q?nxAriiWlMzG9epkEVmJ5fPIXcDydO1kcGfbJ+W61DzfkOiNrOTLsBsOXYz9f?=
 =?us-ascii?Q?zXBGo6dm8BeVJaiqKx6fCxeZ9kz+HtLDHKUppWAmBaWQSn/ic0zz7JNTA99t?=
 =?us-ascii?Q?Cufwa7fYf02dDlGTC4R8oM+Qye3iC8/Yo/fHhS6M/7UD1U2LvF+TCufUqQxC?=
 =?us-ascii?Q?bKXsm3Sd8wJqL2pD+HvbfBrkepsv+e6TolhB1VB/92n5ILIkLfNM6NiqJ4ub?=
 =?us-ascii?Q?e4qjgypaqBEyMPHjEHuRM9BuEaAZhSH/j+wcXLQT46YfqM6k87/jgdifEEwb?=
 =?us-ascii?Q?NVcskUKC1hO5XbtdEF9bzJ6tyq4tghDHnHH6BRONu7Y0bJ5pU5Y7VCo7Fk5p?=
 =?us-ascii?Q?4KFGC8S+/n3KjkcwbZqwKzI2NIR1YT+13sdyGtc7RPtMWA9nyj6szBJe1yNA?=
 =?us-ascii?Q?okxSz/1YuXVSsnn38FsWMLklNNHhco3QCjqMG9gxaWjtwdEHfwzKdch5Jsr7?=
 =?us-ascii?Q?E7mx0nHkiLjvEnDO92yC5Xgc9Z4H6pWreYw6b4iRaeFNPb54KPzLuvU2Lb5Z?=
 =?us-ascii?Q?/P6oBQ2PzNrtX7hDk71+vx9n87CPcLx6ahCdH5F8X5g5KRoEiigy5Uk3RqEU?=
 =?us-ascii?Q?Z1krNU3LNHnzDzAdJVGafGF5nFwJ4mUsv4DWLzrD6QqTwr0xYXr6oBYARQ66?=
 =?us-ascii?Q?bD/5Mbv9MOS7tuDAFNrAEg32cik2yKhejoVWqNZdz2e34rXRbaYC+MllZRoG?=
 =?us-ascii?Q?0txnK6adN2yLy+U7nqPOhOdlLUgyVfGa5L8CmK9oVYgL3qR7e8wBQPg6f2vL?=
 =?us-ascii?Q?DHkpPcZi4OrKbu3r0Yc17kVrGA3JLyWriULAS4gNTVA9ImJpYfGJYeCysp0n?=
 =?us-ascii?Q?3KZ7UYKv8qB/UxqumNBJBiLqSsyai9mOkhjUEgOh29FpcGDvCglKB9z0mp+Y?=
 =?us-ascii?Q?VwAtGWK7cvXPT8fvHom+8nHyHk0pnQ/IwYB3PboiA0apRfpi2LDCIeNG3DH5?=
 =?us-ascii?Q?OEZlBep8UL8BKzENFrd6b115tlni6bOGCTj5MGcmVBRG10LM9vzI+dIYtaD8?=
 =?us-ascii?Q?0dfK9L2KqORtrSbF6A3/Fqoxxcjv/EJ5Re/+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bvXNc0iE0xPlXvJeXohQvpUmbOx7w/tyLZxF14Ka+qpbIDpS4WYyaMptPjAh?=
 =?us-ascii?Q?tnjVFEs01vm+psgmQ57Q1I/pCjY5j+TxhrqWs/WXvzw4GsqJzIMG+18gsiYc?=
 =?us-ascii?Q?9i0FWCQY3avcGI1fg9JxnCa+XTUXQuG5NuoX4DchWXJYF7s5H4ZG/WnXsMag?=
 =?us-ascii?Q?vYiFXdAtNNdz2yGOc/FF9O5m0vDvw8Q+ss/0wlBixea7fkyKhik9KWtjBWpw?=
 =?us-ascii?Q?L9qm/8mY7xYAZXz8AcsQN44JYnQJi7DWkI7I2aXgtRVe0Kk2rVfHnYh8YP+3?=
 =?us-ascii?Q?/COSkPQsXDunM8EeA0mdcdjofMhXySbt91N4ZbS1tRLWpF4a9OmBBb49LQHm?=
 =?us-ascii?Q?LEmbd38zn13dbav2Dj9Q1aYB0/cVKIudGsghMI3zq4iSeyX2Uz2ke3hq1e1c?=
 =?us-ascii?Q?7fJnCYnG/hC8wDNcanadNuSNdckc4Hgr0q0ZwGCM7XBu161VXpi4rrjq0mh8?=
 =?us-ascii?Q?eLUao/+ZeORan1KgNi/k+BLa+isGXQMCz9bD9qM/3RYdIuxpt0oHacvQ6yNK?=
 =?us-ascii?Q?vMz4UYly05wi+Ou3+wIblfL5s2fp8dY6aU+hajpRxqI/70ynjK+9XMXf6vMY?=
 =?us-ascii?Q?H0PMh1e1sa6x9BsiZCY4icr2dBfOB4GDJQrQlezSKJnzeFyzt9uPRhL5bwuq?=
 =?us-ascii?Q?0Ls5Yq90Z1zmJrr3kWkDojG4nZITCohllQhfRmTrozYYa+cOh2v+acvYWgas?=
 =?us-ascii?Q?+Hc1MvDrZYj6T8WMSTSwZhrdtt2xmPjmQiLTiS2M6lZiKO8oUKAXX7PC7Aub?=
 =?us-ascii?Q?ZVaVQc4we/zuhnnFn8MvLKZQ5M98sdHTgy3YjHDWIRwmTWQfsUBl8UWcCDv0?=
 =?us-ascii?Q?Disy3yML1ya+bgld5IkIjw6WnyP62oWbZvvTM7Z+YIBa8EoXllocG5fQwjQA?=
 =?us-ascii?Q?dxUF7tbpxC7EWZa0Bf05SO1nVnvTOgNicKEhjWZFZnAj4eGECeavzu+3tplp?=
 =?us-ascii?Q?VXej/4G0NCcawOMTv3PXdkF+oUqRNUxRmduQ/xqGWefA0dxl/QwCIs4oxRyo?=
 =?us-ascii?Q?46Hq/2kNZfgDm6nR0G6maqCD3ObFeZzhhF0yXVf/bcw/fNsBJVL4a4XDAw6b?=
 =?us-ascii?Q?SzIbMCL0wAIpZxSDwdX52OkKxoZMNiCybtgU5VtDVm42esPk+OlNuoUce9mD?=
 =?us-ascii?Q?6tHNINx8NwkOHX9ul/rDyBW5tGpolwWsN9LBOPD1YM7sSxrPzhdjdeejWAQZ?=
 =?us-ascii?Q?SYXzOOtzmjlJB53fU6ScKUocLMLxVaQ3C1zsQyHxKyq7jVOb4TEyYHvarwaI?=
 =?us-ascii?Q?NGra4huBWZw3zNpWH2x3KoxOvRrMJgLUsUiAKrO8qIi+bryVb+Ldazxm67Br?=
 =?us-ascii?Q?ZtAQIRf4PBJvnzoouRHIuHVEZ/hEWweG44ysKLCkvvbTKQaaKePUXlaXC5Nj?=
 =?us-ascii?Q?mY8DKnoR1hWux/0sAgtK2Hh4emZSCZrR0VjQiTKFFBuFt9MWHlmYxKiqf8sm?=
 =?us-ascii?Q?/4+0qU2wiVzunasZCHpIUE3OK16/TvAtMWLidY2F/JVujHznMT6lamkNZNcP?=
 =?us-ascii?Q?V+lsCtfp1c3aozANdQ8mPZlGddIkx7BT0oHePO7I3Dv2hY3hB86xmQKrz2ut?=
 =?us-ascii?Q?CGq9M6Vt2pwrU9l0eo09RpXoqDbAUX2WELTOUknsK3nOTf1l39nM+tJWrPMu?=
 =?us-ascii?Q?rZsdzVb4ezbj0T7IY0vwz00=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef693e1-cd9a-482c-21fe-08de0ad97c18
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:54.0482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ox7yjUbnTdlggUGVHM21Yo+45eRe8i+2Dp2ccp+KRALgr36azINuJAqdydJ2vSnnW5k/D1v3xZCcR0BX0XTSPG55+INsleieA6HVm21k2Ea9EQ6cvS5t38FU27i544GP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

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
 sound/soc/codecs/rt5665.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index b16b2c66e754a..ca0f0fb4bebaf 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -993,7 +993,7 @@ static const struct snd_kcontrol_new rt5665_if3_adc_swap_mux =
 static int rt5665_hp_vol_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int ret = snd_soc_put_volsw(kcontrol, ucontrol);
 
 	if (snd_soc_component_read(component, RT5665_STO_NG2_CTRL_1) & RT5665_NG2_EN) {
@@ -1009,7 +1009,7 @@ static int rt5665_hp_vol_put(struct snd_kcontrol *kcontrol,
 static int rt5665_mono_vol_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int ret = snd_soc_put_volsw(kcontrol, ucontrol);
 
 	if (snd_soc_component_read(component, RT5665_MONO_NG2_CTRL_1) & RT5665_NG2_EN) {
-- 
2.43.0

