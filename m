Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F056F1D5ABA
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820867; cv=fail; b=GL3IpYnDrYEBS1yyMwSYOtMWjAaPUspSH8kkWZkug/Ae45dVYSP4ao8P+2Ioq49KzJFWW414/2n3uY3WFLChLKeWcMDmtZuGzZhxmJgotkdpps+S8x/t4Jn/hDrjW5t79kbnA+v1MxXCb6x6ElZztP6cofn9okVSe6AzSf2mcWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820867; c=relaxed/simple;
	bh=84R5DngYuxZcnKF7EXuLZ/QWFecWXpChbr0F8W5v79A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=o9ZAzSSYRl+hSZX06Ws5Xe0gVgcGjxigWQazbKPeFcnZ8e/jbkxw343nfIgu7LtJ7xPrjFhCuQmdEE9rXuR8ojThSb0VZrgdE//t1lykjA3pFcnCxRxsN7DTT5+YK2kJBGbaftIvnnf07qRWQ5OPx2QOmPmMAdFXCil4lUS09iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cdpmse1h; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cdpmse1h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4c0RTLqRM/lDuum5ndHruyjIZEAB9GcFLV1wtBPwCtofBnsgykJnYbxeOcrCsLn0ZZp7mQseOZy71umnarSC6IlEqzMN/6RWLfhz8DcA4pyvzgvTKlWo/IhOz528+qtR+z/s0LZF/wkfK+woUZOj4EOdrW8d9Zn6doY90GYTynX6frw2Hi2WCkkJXkSJVOeNf5ii9nwlUQfwbrZWJHxv/EMTphzRVu40ct9qHFrTiX3Da4hJBhbxr+5C0etnXjCHve+0ehbvQFNjzNDmsDr+TWVy3+OlEeT+D8/VI9CONdK0slqN8MVjXP9sh5/3nmmkzhj8oiIf+Y3Pjk+8Tf70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuY5PagRcKmSook6aqccSUmdmSsJbJJO8z1+pJALSbA=;
 b=yqcTTacARwzYtA5l0BjiH9Xa7ekatB5z4gGwdHta5yRTEVq7Qmi2kf/B7Whr7/Dfpbk5IgfpdbOfxK5r2mHLs8zwlSgaUudXuEYkn9GPkt8F6XHo/VfNqx8xJw0qVe+tgAKo57uFxaxjzvfq9+Ioxh2kaazGma0ZHP3xNGj0CTeTqNZrcOf8VGNM8FWfMBDj6sUGAdQOjdocz65KH0dV7IJ5fTGGu9/S0WTTaV1R36oriOTGqujQ1AEIiCcgHoA8m40i7wuk9JFDDwSkiwHk6jMLjBCD71WnpJXozHnhnzfoaM1eO1rOxmyfIKWNezAonWvczkDnSYIQc7x1TEC8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuY5PagRcKmSook6aqccSUmdmSsJbJJO8z1+pJALSbA=;
 b=cdpmse1hcFIq8b+42hQIV8KnL0YqONBq7jDn3myZWRdZ8vEhA70qRK5hQ564vYjyYLloKokqAZ8vE1tSnm4TMmZXBKynPHH/Y0u1V9a51hkItg+KJHPBfWG0N4tO5WQ12w54FNqvdxG1gBbat10wXp8/U1dSqsMgjKgQHO89BYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:27:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:27:42 +0000
Message-ID: <87h5v11kht.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 146/292] ASoC: codecs: wcd9335: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:27:42 +0000
X-ClientProxiedBy: TYCPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b14fc8-c68e-42ee-dbe9-08de20b92101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2vonTy7qhMcthcp/QzD5r2ycr5OPkc70Fr94JbSg2jfZWkJ50J8DHvb6cRDR?=
 =?us-ascii?Q?5b/p/x33QMCzT/shK142Ghn+5g37gyn2Y+FPSeTpmJZmERD34XffqD5oF/fM?=
 =?us-ascii?Q?7irGBHIbqPJ/pO+0NqciVEP2doHeD7tk+1r64Y4OTIrgI3XMyH8ns0yPg4AP?=
 =?us-ascii?Q?o+86nDItsnmbFpX1wE8SMEjXO+TlF3+p2cSkUf8yNz2lnisJAwi6y4E2XEBY?=
 =?us-ascii?Q?PgQgYEjnHubYwBrOW2AELwX1Y8r2IR2pLefsZ6gShzUgob3UxeIz88rs8gyb?=
 =?us-ascii?Q?QekWN3jn8r5aycFuienI+4jST+tXSiRF2LwNa1/8OwRS9/5esCb5g+hsm3/j?=
 =?us-ascii?Q?UevHvLuqff0lDFGcK52bBo0Qd/vMNhjYhyh/FdRbZENBHqCne3O90PEyeN1G?=
 =?us-ascii?Q?uVKE/Elh4m+FHgTmx3+PwTfsqoQARkRbHKEhjRmwdVdGvGoRjcohit3WqFK3?=
 =?us-ascii?Q?zVFe7Hzu5f0yryBZRNaujZ8InbW0TbmeruCw/27ICGDmlqm8nHIjD6Ge2Xb4?=
 =?us-ascii?Q?qKbKkpsbk1ebSX8uqxn2t41jnc5ZZ0Sr6E+BInCh9YYqQ6phnuEt3anA7kKs?=
 =?us-ascii?Q?+WAXJVvIEXgVYC513HPYuTxpCjpLPcH6mAXms77wLaD8vuRTNHidQuEqsSb6?=
 =?us-ascii?Q?cOZA44K0PVcHF9ab6mithPGGAQ256Km/d62y3j3No4uuzrVxC7WRMRvwCZEy?=
 =?us-ascii?Q?1kzYxCsUsl+zqCTgN08pLmWiqDYZe/xPFVxWMJWJLaUfFLwdTry1naQtO/Js?=
 =?us-ascii?Q?4G0xeRP3FfFxYVZvjLnf+Glm6+o/KO3FrONq9RiHRxHS1Gfr7VIfZcbV1qoF?=
 =?us-ascii?Q?p+hJdEMAoBH+OoDsIw/7YE4LEgnofcK3nHUMyJk3oz0/Byv/aaoCht7v5iLi?=
 =?us-ascii?Q?PR2Ib6r4hs/C1xLWTsba0fVl4qFnJU86xOvJVmXE2qaNmPsMiLc1Tys+mMlv?=
 =?us-ascii?Q?hNB3nYylUSEO+0oAO0pCfnAS9sL4DP1Lk/xqLadnYTpwjkSULBwq4CUO7Nze?=
 =?us-ascii?Q?Xj8lrvZA+qUXIKumvcsIuovDCb7lrnUt32uD3xvJUyo8YwYW+4ZZjG4AB6LG?=
 =?us-ascii?Q?I7LT2avSElWXWZyxjo2PRYkb8kYIgRI/qUNW+YXHFxXxu69Sm7Z+/Nhs2aMj?=
 =?us-ascii?Q?5evxaMgbzVIY7YfEL6Hff8bH5z+fcat6pjKHbccgysJvbF/YgQFn4A+oZlGW?=
 =?us-ascii?Q?jWAYMWToE2gaG0JbAVLhO0vlQiR7pcZlgGEWrNDKsHdUHESw5R33n/1+HM/6?=
 =?us-ascii?Q?GciDM4vdYcbnNwp4U1aEjAkKhEvGj6UhYLEjJNHct0HGcM17oXNtPZs39mDr?=
 =?us-ascii?Q?qUE3gMwspW5xYAEbcX1U4zTrhrUWvN2XtRCK9V36/JKLhIonqGfZ4vMt9nDN?=
 =?us-ascii?Q?KSWjp0XooIo0+44qzx7Ef4TuI8zPqgkAbHwc1IDvwYkcY/18mMcowuvP6mS+?=
 =?us-ascii?Q?iGT+QcYyvAW7mkRBuCovTqcjY9kwYI7VBBucBa7IJv7J/Q2isWkQJZEIvVCQ?=
 =?us-ascii?Q?PwaP5YvwsCfKnZC8ZFpJbm1wSSUbJYMRBHnT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tRhBZU+8sjDaiYaT//AqYm2pSKqoTFylsO8F9idCfcU0aD7iGxnzOLE4r5Mo?=
 =?us-ascii?Q?9UhGuuwhBz5I7IETptXLbRrx/0hi04tjpWxyGCTVKWg1h/hIvH7+DG1+tV8N?=
 =?us-ascii?Q?RdhyckmKocsIBr8JCwJJAD9GRWG2XhlsoaeK0LNCupgCaPrB7I/O2lCof35a?=
 =?us-ascii?Q?UvzQ1SC+YWSeyxZ0hLCZrrmQ7+/Zd58yd3xjAl7lsLb4SPNFO9cYtNByW190?=
 =?us-ascii?Q?bExIYPrcDVXDiR/CbXOjFD6sD4UanUIKDR5ecoTsNIy65ShrlhEwaYUsMrrZ?=
 =?us-ascii?Q?6QmsN+7xDlYz6J0/stvQMEusfh0nm05tyGEoUP+ePdB0Q+WOMenAVGDk0DP2?=
 =?us-ascii?Q?iVDebWsijiMR+AHsV3dFB6oigc6qacp6ooUNeNKui9EOcAQyAhH4crlz3tyF?=
 =?us-ascii?Q?WKLXegh7cZX6uruDh74V88fUUvlB40uu9BYXrLJuh9AdsZK4fbvTfcsm+m6Y?=
 =?us-ascii?Q?bDSjvKqeO04jWnPnvuut5Tf1GSTm1zPApWrs3EExGOIwqrbpJ6sOVs5Po8XY?=
 =?us-ascii?Q?mKSQsRpFQd2/jehKcWBEunCdErnMd74Rxwcb+Jc7uUKIGGK71q7rcMJgd9a3?=
 =?us-ascii?Q?jZ9/g/2uYmmELG940WWu0JseZ0YbpvO9CRgQhnesiSpBpECNRl0+Jb9eEYae?=
 =?us-ascii?Q?rVbOOGPVTE6/jjcsvLx7R96zjL5Kg77cva4OobZlIKMn26JuaEUN0mi8WFoe?=
 =?us-ascii?Q?qPOGZwiKucflEiZkzDTF2SWzGK9DwsXk+suOZwSOLPuuUSPhc93gifG+zc1Z?=
 =?us-ascii?Q?mHsjxKii9z3GCe9vm/cq8ILD1j/trQkPPZfT21fUbP+0Bi0kYCW168rP32BW?=
 =?us-ascii?Q?tgb41uXGJhakpW22JDgLdtulfN28HWhIH8Qaj/nOl2w+dX+epVs4YyXU7Viy?=
 =?us-ascii?Q?k4X4yGP1O86ohFBVkBW6kbbYD+/fxMtSNmZI3LfDh7DgNvunHzhcXNdY4Q0Y?=
 =?us-ascii?Q?crALP5pPmeySh6vzsWUuOLD8JSijorJVMVmkjvajC2dKzmrWRrcWM8fPgAQa?=
 =?us-ascii?Q?mSU9/85024N3gqqEtOQCJIF6cKMw5fVPBPJh3VhVWiP6ozJkYEAu8Cvp0KjN?=
 =?us-ascii?Q?KyP3iF1modc5XnZ6F7rabAMDfEwCZWdpgZjJclSD9F3oa1HqT4bhT2gD8dpG?=
 =?us-ascii?Q?Ruqidy7BEbI3jQHdIg+wgdIdNR6mYziX3fGVVRooGx9+NBUr88NygFPp3EkI?=
 =?us-ascii?Q?iMtRZV79FE4trcHj2nMZtoPc51ZWZV2Rt9qx7Eu2mr9CcfEeAqqIfKXTaCON?=
 =?us-ascii?Q?bAzvZpgbRn+7L121S6bAbZQO6diuxU3IH1S64ZZiO0ve4n5O+wuWupj87Qeo?=
 =?us-ascii?Q?dYvhuVg5gLy6B+0BP0Fief+ZM/9YNB5RGu4fBvoNLmztcwdrzf3zk44ybMyb?=
 =?us-ascii?Q?EpOoXNfQlmF1bbZ3S16lmXYgJC3nNl6Y9MlKLeXem2wjshIHJkmDRaK1bm/w?=
 =?us-ascii?Q?no6Rw/lBvPvKCIPNQyw8ry1Ia6MLe9NDaoi6SWH16CaATEMy2+yFsD1FyfM3?=
 =?us-ascii?Q?zbqp9N7F6ihVP8/X+Q6Vl79E2NqVCW1cebTkTh63K3rEq20LuD+IGwnsXyGY?=
 =?us-ascii?Q?a1I4uIAascVrahZgY47TW7ElOwqQ/l7o8wiClqbkp2QrOezNKFK91q3+OEcL?=
 =?us-ascii?Q?uVEIGyLQ+AzCXVFuWpjeakk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b14fc8-c68e-42ee-dbe9-08de20b92101
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:27:42.8981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+C43aihHHYlyetv93MwS6AaNxVaIrFA2deoqEhZ1AFMRNyaHoTt5CEvaGSkJQGMVP4z1uj+7cSXg8ClHpZKLrGvZ9okipwcPJLokzg8COnkH+Scw0ChcjobcI11xvxG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

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
 sound/soc/codecs/wcd9335.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 5485c558b879d..640e43ee19751 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -1260,8 +1260,9 @@ static const struct snd_kcontrol_new sb_tx8_mux =
 static int slim_rx_mux_get(struct snd_kcontrol *kc,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kc);
-	struct wcd9335_codec *wcd = dev_get_drvdata(w->dapm->dev);
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_to_widget(kc);
+	struct device *dev = snd_soc_dapm_to_dev(w->dapm);
+	struct wcd9335_codec *wcd = dev_get_drvdata(dev);
 	u32 port_id = w->shift;
 
 	ucontrol->value.enumerated.item[0] = wcd->rx_port_value[port_id];
@@ -1272,8 +1273,9 @@ static int slim_rx_mux_get(struct snd_kcontrol *kc,
 static int slim_rx_mux_put(struct snd_kcontrol *kc,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kc);
-	struct wcd9335_codec *wcd = dev_get_drvdata(w->dapm->dev);
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_to_widget(kc);
+	struct device *dev = snd_soc_dapm_to_dev(w->dapm);
+	struct wcd9335_codec *wcd = dev_get_drvdata(dev);
 	struct soc_enum *e = (struct soc_enum *)kc->private_value;
 	struct snd_soc_dapm_update *update = NULL;
 	u32 port_id = w->shift;
@@ -1323,9 +1325,10 @@ static int slim_tx_mixer_get(struct snd_kcontrol *kc,
 			     struct snd_ctl_elem_value *ucontrol)
 {
 
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kc);
-	struct wcd9335_codec *wcd = dev_get_drvdata(dapm->dev);
-	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kc);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kc);
+	struct device *dev = snd_soc_dapm_to_dev(dapm);
+	struct wcd9335_codec *wcd = dev_get_drvdata(dev);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kc);
 	struct soc_mixer_control *mixer =
 			(struct soc_mixer_control *)kc->private_value;
 	int dai_id = widget->shift;
@@ -1340,8 +1343,9 @@ static int slim_tx_mixer_put(struct snd_kcontrol *kc,
 			     struct snd_ctl_elem_value *ucontrol)
 {
 
-	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kc);
-	struct wcd9335_codec *wcd = dev_get_drvdata(widget->dapm->dev);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kc);
+	struct device *dev = snd_soc_dapm_to_dev(widget->dapm);
+	struct wcd9335_codec *wcd = dev_get_drvdata(dev);
 	struct snd_soc_dapm_update *update = NULL;
 	struct soc_mixer_control *mixer =
 			(struct soc_mixer_control *)kc->private_value;
@@ -1474,7 +1478,7 @@ static const struct snd_kcontrol_new aif3_cap_mixer[] = {
 static int wcd9335_put_dec_enum(struct snd_kcontrol *kc,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kc);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kc);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct soc_enum *e = (struct soc_enum *)kc->private_value;
 	unsigned int val, reg, sel;
@@ -1529,7 +1533,7 @@ static int wcd9335_int_dem_inp_mux_put(struct snd_kcontrol *kc,
 	struct snd_soc_component *component;
 	int reg, val;
 
-	component = snd_soc_dapm_kcontrol_component(kc);
+	component = snd_soc_dapm_kcontrol_to_component(kc);
 	val = ucontrol->value.enumerated.item[0];
 
 	if (e->reg == WCD9335_CDC_RX0_RX_PATH_SEC0)
-- 
2.43.0

