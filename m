Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C12F185955
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820579; cv=fail; b=W13b2Xi7z19yopBZSeAZi1vXtMjzXvWADP8qyvbT25FyGERwgI8rOfxAVx6u/Ht9aTD2t7R67SOrfNV7Idjl1VpTqlV523Z3TTFKaFKMJXY20gkjn7DzmMgPXFY/7EHA4z0NbuJ+AmqBuSf50HxYT+Sc4z8JUbkJ/XUn8bX26+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820579; c=relaxed/simple;
	bh=EER4hOjcBZ/fhEQYqwif9CcxBcHDDyuV45hd2OkrQO0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lv3MtEBVXRBvKUYg5SOZeVyMrAI39VLY+HdukhylUoPf/K7vBdxeYXfZEeeIbyqLIJPwDdxZD3pet5985AnQKtS1ttNABwahwTnaIB5+T8Mg8uhfvOfL/F4MIwNKcOIHP9J6/Uxvi47H+9sezUwv99GDdPtDi4Gq3YP9C2wzqD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YDSzComt; arc=fail smtp.client-ip=40.107.74.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YDSzComt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzzNjhATRz+4Nbye0L441mT06UsLaVlhvwsO7pHZmXA9ZKL3YOIEiN1fSM0KDhljtGzvknVC3H5X/fn5ncaXV8sdJb6Bra+5BqNtBXkji2OFMIVE7t7RZreRUXNfwtJSVg17lIPDIqzE2F5EHYPsCBekDylu2t8pb3ZyJVib06dulwrqXROP1Jpog07Tw4G+7f5gaRkqotyFf6FfJC2/cmk7XbK7YufSzxIhfIIOTnPs2QGUMJbalFpNx/u0cSPyn3mzou4AUltAxI2m5qbuE6AdHg92v0wElUV8dDyoVdtwNhctp6gNuM+KrzqwDwynE31WIzrd25RoVGJxFkV8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFtZo9T3Y+TNkcaib7co+hYOcTA8kQvnU1TAjDGmmtQ=;
 b=NG+n1PK+UI/mJbiKSPs0Z7QfgaKTXU6W2d+3xfxHcbCRXxBBo1fL3+TGBDqrNsTX5gxsXekTbtR41nvlYhhzDurRySUpjRp5dXfNRomC7pVlqf1oHeqrd+KKp0/FCLfVakmIbeMo9thKTGm2OIMlaDkVbVLEoyEzkPWwkBIOMI+eMgrgoFwkcKQFY9tnXXc+4FqQIKsFkGJq/tAS5FZlnB/raV+N2oEFtEQGbQOh1BMQcUQuGTuaiQ/i85e6FaFdK3GC7GfLX601EZfMAu7KP6tyrL5EfxW1UHfFxbsZP0B50KGgqyOuITpzXhbEDEi2XaWwyH0cNpTabKp+3I9L3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFtZo9T3Y+TNkcaib7co+hYOcTA8kQvnU1TAjDGmmtQ=;
 b=YDSzComtkOXwSK/8bMhJtmul1nhSj97HXo/BpcEcVz/BdYJEJvTtABtjM5jRa8bqPi5tfV6wIt2JdVbbQXrv7Zwl8tIz+zGV4bfl4KVWVF1JEmNjufEbs5mWwO+WJ8AhJ+t6FmTnGrXN3tHZ8gpLbWYZx2DSrB/73nOu/6h3e/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:54 +0000
Message-ID: <87ecq55sf5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 073/292] ASoC: codecs: lm49453: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:54 +0000
X-ClientProxiedBy: TYCP301CA0071.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: 2772271b-a0b8-4f11-0d39-08de20b87514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Az2tn0R3ey3dSk79qqa81rxKxEFfGOHD5ZOPgeZYY15sJlc1D+yhtl42XR9Q?=
 =?us-ascii?Q?XVnGLrJwn5ko4BiHWuAI5OD6+OCm8jTW/6Zi4yW7xvuubOsujXGWXNHLcLDy?=
 =?us-ascii?Q?GWo1BkATPB47EkEdFvTkZqA48OuhNrQGRc4PscsPZE0DX+HSuUsB7TDl3Jma?=
 =?us-ascii?Q?5w5wAQsIjfrT7k8Nb58x8QWK0VBFG/QpmjahDDYUCfKK5Wm8sjBaMP7EA1Th?=
 =?us-ascii?Q?hf0R39cQIHdT6j2KMUBgUX2GHhqJL530vdRO1sRATS30D/p8r2zdYoHeeHcQ?=
 =?us-ascii?Q?kE0O1MDjxcmHPgGJb4UmmH5M3qDZLKwOH+C4CkcDGy7jybLD6twUWJ4H/5RG?=
 =?us-ascii?Q?6j1FrAGfm5Wd2R8OaWUhGVyGIz0GTt3/kXYF6ooKIbUd/eGoMsG9eqndnHIb?=
 =?us-ascii?Q?YpUyQbhERcEnenVS+SqmmfIajTPKi+Q4mv4xnxNevm2p/unoFjNLbKlvlolq?=
 =?us-ascii?Q?LYvLOzOrEkj3uchWslwOoO4V7jmXvG7dfKrMMVjiIiNJbqsL6KDW0lQc00po?=
 =?us-ascii?Q?60I5wUgBMSlHVDLMxAhh664Hgk3Lhy2F+xUmAYWcUiroQYYhX4YCU/9gYcCS?=
 =?us-ascii?Q?NIcgnxyDQl/NAx6i31ayYL61yPYSgNXLW90VR7vZoQ0H68BjZ5DUkcm0Mojj?=
 =?us-ascii?Q?5kbD6Qa7VMKSm67CTgAf7r79ZfzB34sOBZwtCggVHY7Qtd9Tr09jtIB27L58?=
 =?us-ascii?Q?cPa/Sm0b9W8qktQJYHX7c+uHCC6f9PlpE8MIUlNhtu4cJ0KhkStN5Hcpi4Yy?=
 =?us-ascii?Q?Q9JwSwHk6IJVb7IpnR67zUG96eRV8HyiH3QtNPI62X4OP2rvKRzvS8letNNh?=
 =?us-ascii?Q?8Jao+kxWSZ8g3ADyc7ALD1DWJVPou+HgtR8oywOa5XNDy+jY+Zg4OnMf2cw8?=
 =?us-ascii?Q?b+mhhr2t4GZtjyilMGN8DbYAaYq3ldUj2XR9m8X2/hzcA5uc6Hfec8hcg0d/?=
 =?us-ascii?Q?9bm/g3Sn2XGi1Ji8mXjMeKvVTM0QwUkc+irdzGrxcHLjXQ8kollKVZm7bBye?=
 =?us-ascii?Q?XlM33c7Wkbwv4NcRNbCOcFJp9rPKVtet2L7rw6Rl+aPn54zMdHdOsd6SuPDC?=
 =?us-ascii?Q?sW/DNbYhwolPVU2vj4tgHzDSkYcLIHt8sr+HSl0nxv6Nohftzl+QZXSCyasx?=
 =?us-ascii?Q?K3kHb4wU+P92iQta2FpjsUpMHcFlfx9F3EA7iuteUxuc6p5P3jbCf4HwpwXK?=
 =?us-ascii?Q?kPs6Fk22sZdpwTjvBrvWAkXdu531LpvHuRTogNpOZm0XBAllTBG4++RMPPeV?=
 =?us-ascii?Q?WOjTe7D8YjBaRImVhUnrUiZHn8FK8Y5HX28vUOEWZHPVciJyvbNVMmpLEz+f?=
 =?us-ascii?Q?hv93iAFu1H7I9KiOT+W363fw40CbpSEFiE8ZEBysU0iX8KSzGIXtE2AMtXJq?=
 =?us-ascii?Q?ErQNm6tpXBh6m/W0CvHTzxG/RSqLIwD1qb3bxxFHO6FQM7jQZ4N8NUvvdag/?=
 =?us-ascii?Q?8Cts0BO5PFIa8KVTwjeruABoj6DS9MK1H37F4kbspKcEeRNW3kEd1/wPfOdP?=
 =?us-ascii?Q?zJXP2trmMCCTs12f+0ZY2i9DKDGrZySrnco6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iSGDbLshdi89s1V5aJS749bWd1Fjhpf3ExKTCRFiso1BclkRWIRiOLfZ0AZl?=
 =?us-ascii?Q?cfng4H+/splrjPLYy+b+42o6M7NU45MqeGT1pJgUtVKrhlvym0RSvb4FUU+V?=
 =?us-ascii?Q?L/4zWk5giJHjCmQH4iwYpU2F5Um5C+7WXXIemBBFT6RxpxX2bZAPt6mdAw2h?=
 =?us-ascii?Q?g6VMfMWqdNVwoTkNP4gPPXg/ExCYl9MoM8mj0ahaa4Km2AYtJV+CoPcDgI37?=
 =?us-ascii?Q?CEjS/5A++SM8CF+cpHwVuqYl11yR3HyURTsZVkvt2gnCRIxDWnThe7i/VGFs?=
 =?us-ascii?Q?y4Q1Yc30VmN2ygwF6EF532e+8lgJ5Gp1MkwvQUjvxj1dDOmRP7AxhkCgoeZi?=
 =?us-ascii?Q?JQMOfxf6fJsm5xjAaQwCrb8yqIXvND+KzEpIsjD43Ggm+umg9yxscEQDEWQq?=
 =?us-ascii?Q?8cXpq2jExPF5l5um+0kctUYsGHTS95xmF3agyioHyP/zVtQxahMMIfdTjZup?=
 =?us-ascii?Q?t36Kw+Hi2SLpXMFXtV3Fdq3Wzc3UqrpLSJsNsE9Ut8pJypzVj/E/soCFNhRd?=
 =?us-ascii?Q?wB7K9t1PQVbFlNdcz/Mm33fPimskUW7O/pK/KJZDwUNf/FH9vOIMjvZ71eYD?=
 =?us-ascii?Q?1soQSpYT7LwDmmgy+NiWxDFudmZYwW7U6jIs9irGaXRJ1u/9sJq0Gt6HWMN3?=
 =?us-ascii?Q?ALo/fMqLHQsPmnkLH4I1Rf5Rbz3iKac4HlUscbNjM7TtDA37l44b/SHNL+ON?=
 =?us-ascii?Q?abZJYMUZJUX7a8ytUKNkl/7tIBDpTaglgXYNBJysn4EnNZGqEmLywjD8UncT?=
 =?us-ascii?Q?JE5Guq/2zGAEJuWZGJUNAdVJ9Tmx76IW811xaa/WlcBqTRzDOHT0PKil/CYp?=
 =?us-ascii?Q?QxsI6PvSqo8+cwGTk2OQB4A4t79FUK0YbKixrRLlbg5peyyOViDLEgfR8K8o?=
 =?us-ascii?Q?mYGmHPQRsbVSf6LL0WmId3tMbleePsJJ30RXmYjTmVAUarpM84bmg3waOIPh?=
 =?us-ascii?Q?04L+bNVIxOI033gSZdOqjZLv2vqVUWee0g+3oTnKvTLIirZuM3432b1KDsua?=
 =?us-ascii?Q?ne13uw4dkAsRI1X+ADO5JjIsDqMDwOnvuiUWa205180wGFCQHpFxwpqQJaAo?=
 =?us-ascii?Q?fZO6OHvZ5HHPpdCKQZ4A7l9EKxtKH+LdI9NM+THESj/b5lTxw8WfbniucSSG?=
 =?us-ascii?Q?Y5qbThrItzDUuzi8M9YaIKEdhRKeSU7qlzauSgiuXYrP3Ei7kL59Wq1oeXu9?=
 =?us-ascii?Q?3dpFbPYKRchpAR8xTeLNzF5P7f8U67UdJwqfRfYMbt8PvK9O8ZRG2NVm0o/I?=
 =?us-ascii?Q?wWqwj4q/VT/NmoVfkrurZRgjGyeJzZEEojhbEMvUY5I6dEythobProMFhAYL?=
 =?us-ascii?Q?YI3xBaZ32Zp1S5tVx+MCNY7o1z9kyOjs7YCGh4kdsOi1lUhqq7crOTSiyVHu?=
 =?us-ascii?Q?14K+spwxYauxloC1mDmv9qn64BkUP9X5iupHt+ZDV7Tg1ggaR679bykzNCK6?=
 =?us-ascii?Q?PF9hnL5Y1W5DZpyH5+pEQgfK1HRgdE2XjHEhd5CTt7swKozCpPrkSui7+tQ6?=
 =?us-ascii?Q?1T2m0AGVN3/KOh9F1LZtQUth8O42WeuFGuI30KB6tDJUnDoOSz2tOK4sbfxb?=
 =?us-ascii?Q?Mn50HZeMIN/zu3O11/8D8VxDQp8deVU/Pou1tiowEnUlHkgm2v/jbPSMrdIk?=
 =?us-ascii?Q?vFMYP4K+p17/Stsa2A/3b6Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2772271b-a0b8-4f11-0d39-08de20b87514
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:54.4713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TQYn3CY5xjOlAmAysQl0ZN9XM8U7VdwdCsWar47elmae1Dpb+Q0fpb45rguIApZKN+ZgFC3JY54Ceiqp+EA3SKTBkd9ROcHfrcs97NxUi98ksztGlgxdtlD5WfjENlQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/lm49453.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index ab89af7965bfc..0430305097959 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1255,6 +1255,7 @@ static int lm49453_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
 	struct lm49453_priv *lm49453 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -1262,7 +1263,7 @@ static int lm49453_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			regcache_sync(lm49453->regmap);
 
 		snd_soc_component_update_bits(component, LM49453_P0_PMC_SETUP_REG,
-- 
2.43.0

