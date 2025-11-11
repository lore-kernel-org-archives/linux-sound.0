Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9532A239E8B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821370; cv=fail; b=ohH3U4IncY6/SUsmh2JEpgtAQxX8O4vhU1ZtzSgTtp8SsmBdyD8HnzUu5kIPWlQASJ+XQu0lydMme4x7cL0uq1J/dQ+O+X+o5rcIaq5DStXbq0JJsUrYuVkY1NcCwpRHvo6jjZxLXKjQgFVYhIXIWYyLwFBaYxPItBoOPWjBF4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821370; c=relaxed/simple;
	bh=AD/XG6IIPf45rB1x2MTKnA/xdXKpod8Sm7AFRvjrDec=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=u2V1tDSh6iPOItLs3QbQLvVvO+8wxGoNUEYefXJRcadbvZSQWx/p/sNJ+Fyk/vO01tl/jOuqTRTZCoq97HPKbH0Q53YPv9DV7nY0sJa92V9qMob6ZEAe+WK9lVWDtCy0XV5JE9nANZ8a2Qfo/VYc6SS/rtAcr78sd5Eg+42iH7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dhPCqxQ1; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dhPCqxQ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mihb/LzMT0kAgXwUmu2B0Jy2cixQnk566ZVcW8YbjaAkW/5LZgD3wJ9GnCOrk1kRa1mDJURXf+k13g7IXbFiS0PmoOjnYPJU4AnS6yfyCiFBr5gNujjsut7mbtOZJKUWKYbFohaiZV2AxiNEymBZMoTxnmkmC5hC1BSvMKpxobXDbzVShdIMHrX1Z+2jxq/wsLm+7s+sjD4rhZk4+yPl9oFpm1qbRXwQLRI+r04vE8YV6Kuilw3MwzBVLqNcCY6DTmbmD7v3RzNk+5i1x0iE9s0z77ze7b8OWWOLWGZ7+eIXrjb9XZFS9dmBAQAZwSHWv29xnvO1m92yFIbbNZYIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qShvqzFfATvyH6u635t/mjayGYqiXG8SJqUcdfldrl4=;
 b=LsDEHGVvLKySjzp7JuzJjLPnML+/Znwtfx/kY8A4NI/+h9Xo1MyQShdrUFjGUluVMu/0Qv/DbNjyvakNTIBKsgF6sgvh7W8kIKF9n2VwQNuKfrb6ypKxwojLg6BoWH4ZMQUwqYlG2uG8fvtrDk5uWQ1/bS8RO3pfZrP4GuQaPS8jWwoQWqTuN0v0+/hzPL2mH2IY8IuBLZWiWpFKHH5VSj2IGu2+Tmv2VJ1v8IB8IUd4wZP4w/71y/ZA0awVaQS9i5i4FArSRnpFZ2qi9XbQfigIrYfR/wFqROPL2ws6agihmsi47Avm9aWvwH+SBlVvYpo3JImm7oARYl+2YOrEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qShvqzFfATvyH6u635t/mjayGYqiXG8SJqUcdfldrl4=;
 b=dhPCqxQ1CrAByemxTcV2KH1ueCXkuyqyXDuTz1JYoqZCQOmJIx9Ki1FJVuJSYv7oHFet51KhHJ/il1nsaq4mRF98h83GHGRH6vss2oGrECYSDzdGCWqSckZdz9+kNBUuMqvaAUnSiUMyBt6Qp8BZcXIKi/FPpvQXN7SoxPlh9uU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:36:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:06 +0000
Message-ID: <87ikfhtngp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 270/292] ASoC: sdw_utils: soc_sdw_utils: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:06 +0000
X-ClientProxiedBy: TY4P286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2da182-7241-4cf2-397f-08de20ba4d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vZJA5ojs471VwPh4Pnp4SK2TU4v1Iy3IKz7x7Y0tRjcD06O408+pkOijw66l?=
 =?us-ascii?Q?bupyPxXXjLR8IQfb4T1J4jakFcT/xb1FqSNBvdqzYzE+QpvMzmuw3Wooaude?=
 =?us-ascii?Q?8+r8InfLNVBBUcdSDR0FOpMKBbdOxgG+lQckN1lj4djcnAj8fd1BNRK7ttXY?=
 =?us-ascii?Q?vj/8NCRzMykkNRfjcyMPuIg80ieOlxKidvnqEb+NGsOf+N/Hl1jJJPOsDMCO?=
 =?us-ascii?Q?GxZaxAgT2VqCs+oeji/0Y+jjHCyNlnHrsSeSjIeRlZIwiath2rgqTkBk/gaU?=
 =?us-ascii?Q?/Kvx07hqK1ZUIoS+r5q03xhd5ZyiDTxlnM7wG774oDGnnO5u2eKRtVQJDLOa?=
 =?us-ascii?Q?2OkNeUg6Pwar8vDIFFCiRKfMp/J3gUo9UTT3br9B5OPZRnTI+x/6dcnUq2r4?=
 =?us-ascii?Q?fCpHv1RO4imxHqG/B4BEqJqwatmi1VdkaFt+VBSJx9DWhDceY1a8aeCJbxjy?=
 =?us-ascii?Q?Sz5a+TYLACmCpzZvSSssnAQiNXOyvwMjCmfKAaehI1TCx760MOpKSLN5Vib7?=
 =?us-ascii?Q?HKHC+18zXoOqD1OwrrBvl4YsrxZ25u4xR3hyFIXacD/H6baWDy0L4qM7nDC9?=
 =?us-ascii?Q?CXXJRQ2dA0Q4dTwMo+76ZiBOheX5zdqu+HMzCoXOkOWMH9VimCgTMK9V0Ic9?=
 =?us-ascii?Q?s2stNkthDGltJ9xGAuI4VN+oWGLuL7Dbwi+HPNHvr/olQHCawQva49FumRF+?=
 =?us-ascii?Q?yvWJkXaos6qusLfKpO8tRLZ7hntHX5TeWXok5dP0qI7xevn/cfGmQsWdKdY6?=
 =?us-ascii?Q?4YiMnRtIIdbfwpzMaVuLK+VIFd/Wgc8mT0JGl8rMAQSA/G3ClbdIii98zrF+?=
 =?us-ascii?Q?VfoSNd1BMh4i4KN0RGBks4KEsDBQmn+1SdqFlwm0Ee+WKARvqiBT41QN8Qbx?=
 =?us-ascii?Q?yfMJt5udsg9GZK+ifXLGYBpx1z96G82+cA3URQl4DLUAtcpCXUR68+yo7xIz?=
 =?us-ascii?Q?l26hJZxPM9jgqZzf8ZM1tEstt6y7A4uXAvY0FeiQZ7A2bJoM/TJ58BFAgirk?=
 =?us-ascii?Q?jDuTLP8T7iX9aW0rh+iHAMBesn73b+MnxK7NK64E3FUB3wu2d/fKC15XQPsc?=
 =?us-ascii?Q?3TjERldNlIvqpLIU6al4/+9/4XFxWNGT89bZTQkkPgmsYU/Aas2pp/tPYZSl?=
 =?us-ascii?Q?sZbFbhrFaR0wJQJGVOCDenO3WsdGUAVsq18TNceskkucLzuYsI2pLtSCV7sY?=
 =?us-ascii?Q?QEGqLU1yq3ZRDTSZVLSoOFvIrGGRlVR1Wtgom3LYERuVnYLV9F1ePirXy2Gu?=
 =?us-ascii?Q?WAcEPxXfexpvmfT0WxOZTnPRdaBppRxsrcxvc0TD9fyi+RqBKkJ5FAXkYt7Y?=
 =?us-ascii?Q?q63PnG5at+NJYRUBsGB1qVnhIsJSXHL/RZ8nBBfpQOvTwwamV/CqEOSLtXJN?=
 =?us-ascii?Q?Ya1KTvPcB6rDTI0TXwaDmTlmNJ9UHA+fXZSUd4oN9pbMldSi8tdVGI64noLU?=
 =?us-ascii?Q?khUTUK/Ma1NCKZedCFEAq1pbDK+CVsyG1K31JltMGd9l14WHpUy60ZZ7gjsC?=
 =?us-ascii?Q?uxlZBwj5mHn1Wa82lCvSAmG2y4b8JT2lCRDA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ul1w1XKWQyQWehK9rPVV1SPJCYzLSOencOEPWLQ9UJdr0Rwdv7xnMXeWgOFT?=
 =?us-ascii?Q?aSNnW5uEvf/xTGClhGtyXJ9SpPVLqmFeBQmYamoP5J8QjCceswL/u75I9PDV?=
 =?us-ascii?Q?EzC8OyfUzZ0V1jp1TBSuva6uMtrIcPYSPVcei7Ey+IjSU7APoZJQqQpJZWN8?=
 =?us-ascii?Q?6ztrMYUMliuNaX5sFVRPmXoACrV0fx6OL82q0w6K/EkbrlkstAnJqWgWXoUB?=
 =?us-ascii?Q?LnN3HuTJDHNe+tr+3+Cim9cUcajre0TPaVzFWUi5+Y4WDGW56XQppNLiHUrc?=
 =?us-ascii?Q?t/5qW7zAlYBU0qIKtqyXEhaX5I+GYSlleBPRD9BIuT2H17ZuKocbe0BjWldf?=
 =?us-ascii?Q?PCYflrb5qj9O5GbAFp4cNj9OVf+1qzAX+1bITLx67FA4sMVl+6BsGRdSVO0n?=
 =?us-ascii?Q?+GnOp9PPnyTAff7O/d7ADXpGANE4oxOTk44xxxc1VPmkTQ+81dgmCtYy30aE?=
 =?us-ascii?Q?4eBJVVoA0od0e83HPK95V1+mb7idXUrSkji/wgRtQwslUY5brxlfxV/riDr2?=
 =?us-ascii?Q?R2LjuBl8E8r3TLr12D39wLogURYgUBhayTZx3uzKmupZODpI2wePh9K3AmT5?=
 =?us-ascii?Q?pxpFgHhpfoNYR7QT6vT5/c+jpJRnqc6QXTmWQjlZyjzzGIpLgFdfMFuW1x6t?=
 =?us-ascii?Q?AMcnv3BcOqEFRrnDFo5yUB8ujvVbXMVjAYBkEigvwntz/t0+vLyxDo84Rimw?=
 =?us-ascii?Q?2fLxi6upNuYGCwf+0BSEG8INhlr1dyXuwKvlhbYyAqZDPzQReHjk9v107XGr?=
 =?us-ascii?Q?oIC1qvXOUWzHbbb+oY0nIEPIW/kBAyQH+UmOmVNQ8LgJCVRWYvgierE9wuop?=
 =?us-ascii?Q?W59IHl5IVTQPTiupVl89Xye29MBvfAAn+Ubvfg5OQ8Z37wWJJm6TiZSJ8mkK?=
 =?us-ascii?Q?TzaNJATo55LRjznom+j77QBKtvH0wwnaNgsGlMKMoH4VSJMl4WenkZWWoJHh?=
 =?us-ascii?Q?fL+iHgaPLE9vppiKRfKPHrPrZoU/rElZzC9V+d7CQuo6s28HDabeodM9DKRP?=
 =?us-ascii?Q?/q969nn2bqutytW7V4pA4K+PijvZ0mRB18XnnVo0zb0pk5FymGaIskTExAId?=
 =?us-ascii?Q?qof+ABC+HckBwJHcRvv0LufnEfx0nOzAcgTv/zASfB590NlXNkSaG8Bt+bkE?=
 =?us-ascii?Q?ldws+46YYIhY4Mj3zQfCNfPwTdJBIyNo9sf3y8IkLCNDUx+uqkl0Y6XJftuQ?=
 =?us-ascii?Q?5q6ZVNJIdo7+MJnG6QB9Z9qXtdZOor6nXP+KDlEAKtrXABfrep1NAZROs2A0?=
 =?us-ascii?Q?QHL8TBmxlO6qhd3lysuzJeZlYeaXXEese7qqPj7JfPOTf36xUR2YQtFal2cF?=
 =?us-ascii?Q?YUWL9EaF4VUgZWNABDj77EBp7QD+yMNNJnGyJKeaqJri6AFGqi5S3RkMkhKI?=
 =?us-ascii?Q?8qeuvv6yqJwYrFGPt5Y2yKsNJXWGJ+EHQFWMs1fnWnO6Xcm2CbvwOfFxjvcI?=
 =?us-ascii?Q?DJHD1ue4pbEeQWdc9JJqGvYcInSUn2BWyjdsOyPB/CM/Yj30VsyfvM9izsWV?=
 =?us-ascii?Q?JEwvWR/oCtyywClhMpe1QkFndxic2WZa5cWrf9Jv/d3duO+XL1Xp9R3FgkjH?=
 =?us-ascii?Q?eW0myECGRGCZqw3nOt/wwi0/mWW9msgLzkyx6bVdJHxxMa/MuC7fzVcAzMEd?=
 =?us-ascii?Q?mz0MtrnOTjC9lws6PhWqfJs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2da182-7241-4cf2-397f-08de20ba4d58
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:06.7882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJqni/E1jETl1Lt5EkMpNSOgdWfdnBDAv0EdxblCAM1ln/+AgIzYjIpM+H+FiBQeFBx2XmD9BwCJCb3Lt25wwdm4ZWYQLfpatakDLfScPmFP7nMb3VWgVNTXEsnDScvz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/sdw_utils/soc_sdw_utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index d79e6d1dc0645..824fb613c4869 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -837,6 +837,7 @@ EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_dai, "SND_SOC_SDW_UTILS");
 int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
 	const char *spk_components="";
@@ -876,7 +877,7 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 			}
 		}
 		if (codec_info->dais[dai_index].widgets) {
-			ret = snd_soc_dapm_new_controls(&card->dapm,
+			ret = snd_soc_dapm_new_controls(dapm,
 							codec_info->dais[dai_index].widgets,
 							codec_info->dais[dai_index].num_widgets);
 			if (ret) {
-- 
2.43.0

