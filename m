Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8977A1DD889
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820893; cv=fail; b=d+6cPijfcbx994zIsZy6u9+7BuMe/uxrX95W2sixMHBBttttu5wHPS5w3cNYGVOUTQBqzljm1lhHYsWlpURZU43AlBF4ZRSs3zaI6FnFtzp/jdUH2pUHSAYvZ0PAP2A3x1ySimXWoHgRokmwb3NUGhaFj4g0sQcZqzE2barIRRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820893; c=relaxed/simple;
	bh=PMytluEe/KoQkOwxXxLlOBiD18DABGOvg00I17FkTJc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fNTf76uD6O5MxRjOIUQHO17IfH0QiZKWI4GJPR3653CP5GovhzF+bV7/Uz/4t9RgQkDniti/g+AAx2YAeHi4g74neIfdeUhPstDSjSpErZIIUvnXjJ2zgB5fZ8lVF9JrzW+cHOU78Cjcm6k2vnJY05cP55+cVv/foGtMxZ3NgBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CJLSkI5G; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CJLSkI5G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYReIE/Ur7DcSauXkRNCsgZ/dIjL2t3efTH8K8p1+XM6RMRZE4QlqyQxJJcJhjFFBLwQuECYL+npirU/NbBpnWLzj89/4vCOq0xgMfBAfpMrVF3CEITby+SgLl/hlKAm9kT6871zRcB+VcQWRrJxgdW/eY3dzcnheV9Cxu08+9YsH3dKn8zHHj5J8pi/4rqQAitj5Nr2cyUXkmwGCpjvztDEzdP8vKEZIPEu40n18diodhJVopr5H++cwRSdrFoXKfBYFb666qjcLcAQFt+cAzjZm+gqmvQ4KaH3GlA/7MvZH+ahxfPMR2Ee1lNlYTpW2dAZoUQ5oQQz8gtis+7jOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBrKOktnxZNiI6BjdmzkIBeHdVHg3r1VKTstRd0G78E=;
 b=TKyvq7n2osdfDof2EhSGwo8aJ0o3W7yrJSvjex/W4Sj3Z2fM5Yy2dfgvcj7GN7yZqa93SzD1tLuQPOHu/FqbVqhMCsMDsVba4yI/DIYSUE3+daH9MlB8jFI/BR9+MzBuPCs7UHXm9cyURWl0uYmQsNVQr81b1c8tpV2GWx+Nxx3ks8lCMmILrsdI1JVZau17cSXWA9abmhelMC+W+NNwseRJbLdYUQ2/ynq2yKhMM7+UMSsA9LNiHkEABIjaIdtvum2mRPNWhDuAoPI2HE4N+8Tvq8DaPgzWs1Ko0inpvTguQIQ9xqvHdMSdf+78f8IC+zRINF2u+Fg9w7ZewPG4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBrKOktnxZNiI6BjdmzkIBeHdVHg3r1VKTstRd0G78E=;
 b=CJLSkI5G6n7JUEXjghDfNFRfJR8GELfPssRZ45+dNGgggRC1OwPON89hSTxSFNoO66u9KFmRLtiQAQpEVYQtZvNWMtcCfJWXfmoF1fkT/L5LAv1cDmBDhSQiPrAyX6uQmdTj0ePWVQMDVkawFXSj1cVGPdvj6pmKonrUFK3hhWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:09 +0000
Message-ID: <877bvx1kh2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 153/292] ASoC: codecs: wm8350: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:09 +0000
X-ClientProxiedBy: TYCPR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: e0bdb69a-0e64-45df-fec9-08de20b93109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8R2ygwDYNBI218+In9lhFhPWNxT6TyGL+Bs/qjqCYnHgGa1N42wYC0enDuev?=
 =?us-ascii?Q?JDkC9CroS1tIwnu8YJHz0sK8TkYMdFRQMKNLDvn7154abeWpQ7PPMpmxSLdl?=
 =?us-ascii?Q?7kmvwCkjfYgUpVnU3k+7bBm0wYlnig49XVoaWpzfrU18+zW9FfVeWkLsnXQQ?=
 =?us-ascii?Q?dvCgbthcWddjzj3EDAQrwljT5CXrU8WdJaM921WTMqzugs0n7Q9Ta0/iAwNY?=
 =?us-ascii?Q?z1TSv+hm+92YhwLg241NdlyKq3ft7OcoaSUtNWy4tGNlAzvN1xqRr/nSOPlt?=
 =?us-ascii?Q?6otRGCTJWkejuSwzfw7xTDVWOco5akx5kCQiGiClYzOfkMq34zrSR4udZMcE?=
 =?us-ascii?Q?ULwH6ipfKF9/NU2snlLvK7XldTDW3mRIQulbMvU1DYpYABuuSA4FGYwtx2SZ?=
 =?us-ascii?Q?inBksYpL9B8VxWl+bOFb4dbOAg8Q1ei4h4WjNmqk7u240CfNlDkUYcBzrSSh?=
 =?us-ascii?Q?04+AFX5vXhYlc9uVTeDjmZ++q3zR3SbMUw/89QOvaJ9FH13dMXftxkt3nrHY?=
 =?us-ascii?Q?a3OTYFwMK3D79IFwTeI2GMRiw9UviV+p/yJJIErvMtpSwzFZFqEVVfkIQ1Gf?=
 =?us-ascii?Q?9uBP0VPiH2RoBPFmuaLp/NJYdkVHqzyg0HgULX8KJ14J4xVw8YczZ9EBn8H+?=
 =?us-ascii?Q?2NIp8tD8T5YzxCx7asLpdvuVn/mHKNLrpBJMtabli8IQ/sb4wFLou7J7W3MM?=
 =?us-ascii?Q?ibO2/uN6vaBd6KT/bELwiixOF1jeHK+kGNUChSOpXdn5szeXhZ0OfsG0+p6D?=
 =?us-ascii?Q?qTbUE8vCYWT9Y55wj+SD34sBkBcvp7KO7X9K72d0mGY4Mdu8eMgCE7SJ17fR?=
 =?us-ascii?Q?MU1CGGct14iMuMFCKXkacjPSSU8v+MY+IpmTFjWPwdhYzkFPH/T/TxtqUbEN?=
 =?us-ascii?Q?CX7D7dKd5UNsmOoVQwSV+mt95XyYuEKMmvUAnv5foq/bVyVhC9XIZf+SmnxB?=
 =?us-ascii?Q?H5EHY9j8J9KPqbnv/GU1NIiHfo4wWuAXtr9OhsP8tZJQC8u5SZBTCmwLYOAU?=
 =?us-ascii?Q?tNLf4YoKzdLKNhne4oDoAkhk0pGieSc4DiDvx0fVCwyTRG5wun4323mUWgdB?=
 =?us-ascii?Q?zevJ1jhKWlo/iHEmr2Osrmyx6rfdWp1man8Jb9kARrLbiH4ztq3RWiOalvv9?=
 =?us-ascii?Q?iYSxRSwvGyW90Z5L290RtVSH/U8DBbWkGJcMrgbbaTRxiUNz2WE6Lm3yEw4L?=
 =?us-ascii?Q?GNA6ao07hvjHB9GAGhqjRBfd6H+04N72c6lkLl82phh72KN0TMiDPQgAvgzq?=
 =?us-ascii?Q?T9/onYiVfhH5YlTMRMFapnvcwhKe/HKdyXB0fy89vOu+nyueKXVVoLqI46TL?=
 =?us-ascii?Q?/UFw2wSQCgV8shF75TXYvf8wBuTepRKa8ze4vtueovmkWu1bSZ32Qy4TYfhr?=
 =?us-ascii?Q?vrxcUYDvxjKa3CLs8ZQeG4vol7sdEMnZiTHGLengVHM8g2sEnyFh6pDs0Yzt?=
 =?us-ascii?Q?YOvTiEsgIrTCLBehiNUSWcByoy0INe3vrrImDnZKw9z7EB547+k526xj59Qb?=
 =?us-ascii?Q?UvTTrSTh+AOZJ1i6Hh7FF0LccBqqlctz+9aP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rD+JK18eM0w7Onslb+gzuYxB0SyDYka+ckjYNemwx8iU8AL0SxQX2Y9cOHso?=
 =?us-ascii?Q?UYE8xhjiNMMaqxj358zZtTrvpTybTn0CElAgKvFG/9zpgwkM4ITPEFn5QNmm?=
 =?us-ascii?Q?bdJV1qHe/E5Jl8XySEaVGm/QmSVKuTumBT0YOLg59Lomxur/9OiVAB/Fj1ni?=
 =?us-ascii?Q?hTMC1taFXIaFw+N5Wu/gM7J0PVdDbbqFdBXSjnVM/vUoxWPae5cDa178HA7t?=
 =?us-ascii?Q?Gb5pgQPHqSrYprwgfLvV36Fr7LSKeXNxRGqgpc5HiGzJYH6NZdKFSfpNupZl?=
 =?us-ascii?Q?8PVaGeLG6HxPKegj+/WTMYLUfAfLp4GW0xEClRP2OFcz6oOTM/ZMFaOk8/h0?=
 =?us-ascii?Q?0QZvEbfplJONUbXLxVYhQqJ2YkWDKrzN1/GCrCx7u3VDhCzTo6wmA0OPOJkU?=
 =?us-ascii?Q?TU9gBI/dFpPI1weEJ930xf0eyrS+CVqj4S9OldBIlNKgxWecMCQoaJuXbROC?=
 =?us-ascii?Q?mhdGZPVgD10byen09kiO9vm6jziKrsQf0Q3efJW7mUzA3NWaYS8DnfzxJVPQ?=
 =?us-ascii?Q?a+IdcYV8JuqS5BjSr9WoXPvSAK71SSYlYsmiiw+y2jWoZ2rvAzrAckiObY28?=
 =?us-ascii?Q?F/rZ8T4XE/HZ3ghlyp0PupavVu+KSybM/Tc2QN7O1s6DoEapnEJjhz9cdc+W?=
 =?us-ascii?Q?GKj6jE1JTUHU26riD4K4rZyz100Yb+/hkNJxqeptVCcNMsaLU7xbfWMRUvEw?=
 =?us-ascii?Q?7U5h2Ma+EyBtrZm7UEEHoD3f6FEWXJ8ioAvFIw2hsbJ0MkaHPXUN3J6CIi68?=
 =?us-ascii?Q?v/icKTa5OCMlGjp5693+xd3PoJ9in6fh+9tjUchYqCLn1C2cqq/3F0/n5mbx?=
 =?us-ascii?Q?1eEKlV1PPjptdX4n0224uusqqMCKlaxh1O6NNtBiZIu0x6BI0Fp4sc4SriIS?=
 =?us-ascii?Q?7pBKar6QyvqAH2yqS6UlktmmBuzRJRORcOX1PQoRjLijXS1S5hgDt60MITVL?=
 =?us-ascii?Q?HkFokEK0naDdXrzPLTA8HemBsFlpsxVsh3xm8BxeLqJuEZy5Yf3B1tvv0p+0?=
 =?us-ascii?Q?2rr5/e70xIMP3qgGlx7nkzWaO7IL9/ynSQKPcWyv0qvkddL2rtD1J4jYJjeb?=
 =?us-ascii?Q?Fm0IPnqYbxNXN+5fIe04xmF2zXzx4WPF7Fi4vSEQizEbsdb3NujAaXPjNdL2?=
 =?us-ascii?Q?Gk7tJb8DRmL3HU4vikJj5EEDnTPcLK3mKT79b1J735sddT7UbENoz/BUa3T4?=
 =?us-ascii?Q?mLpz5bSn2mCFDl/ksXLsxuhH9FE7ZEunmoeBhA7JDQeTKFrpDDyrMdIRSyeb?=
 =?us-ascii?Q?w1I4k9bnQwa9X3gLDtBUO990R/9CmEm8ILKCR50YHiOeF6bL9fB+gIiDa6+0?=
 =?us-ascii?Q?bdB4DWz0J1U/MbO/dBnVk0PrzOPXzKkuLNMldmzKs+SiTcAXicJK068TSS2A?=
 =?us-ascii?Q?U+GKrfz5KTt4/Jus7kPzlEh1LcG7buezm9dY79wWqWr3qatqeFdctWC4jpsL?=
 =?us-ascii?Q?nDr8WfSec3cv980iYDNieWMomJstrp4kvPjIP5ET3N6E64xsvHOqSMJIl7xb?=
 =?us-ascii?Q?LtVOA4olZ4a3tQhhm+YbPYPslDBeLqRS6Jc/qTTcoSQdWS+xZN+JF4+ILvG6?=
 =?us-ascii?Q?6ahFK9+tsvBKxx3k5WWzWEQVw5wMASn77xQ1ohLoevQn9A1K3lbQXGUgFgs/?=
 =?us-ascii?Q?efQZmQaTEuqqx7+wUcaXuMw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bdb69a-0e64-45df-fec9-08de20b93109
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:09.7981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5MJLsVZAmN+wJ2YpNIPa9k2bjEPVclHkVLj1yfKVdXJyW8ZC/RbaIuQNsQEgjeUff5MOP21d1S8Hgj6CpPueINOdhWuQHuFFXk1W/zzA6nYjw3kY7uAtYhdPpaoT1X/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12798

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
 sound/soc/codecs/wm8350.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8350.c b/sound/soc/codecs/wm8350.c
index fda753152a68b..ad68ff1790e01 100644
--- a/sound/soc/codecs/wm8350.c
+++ b/sound/soc/codecs/wm8350.c
@@ -1075,6 +1075,7 @@ static int wm8350_set_fll(struct snd_soc_dai *codec_dai,
 static int wm8350_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8350_data *priv = snd_soc_component_get_drvdata(component);
 	struct wm8350 *wm8350 = priv->wm8350;
 	struct wm8350_audio_platform_data *platform =
@@ -1099,7 +1100,7 @@ static int wm8350_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(priv->supplies),
 						    priv->supplies);
 			if (ret != 0)
-- 
2.43.0

