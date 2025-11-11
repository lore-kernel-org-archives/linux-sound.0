Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17115220F5E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821204; cv=fail; b=REJNqwXQAzIPyD2xHChY9UjV5e/f0txvT3Bq+AS6PW0lDQ2Dh7REGaBxyo3c8tcu5sLwuuaNCuvl8uKKcPu7N2Q1xXyNb8Wpy1hWMl2RIkYq+0qtptmVw9C4B+gRyGXAz6FmciFAz828m6jTu5XcaKx8m8ur+h3DX+evE4ArmvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821204; c=relaxed/simple;
	bh=Slp9YEdUM+RlzxH4o2tnFF3lGvEXxPLLID/o/hmx2Pg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eUPJpFtSigKZE3EWV6LdOr2MjG+HP6l0Yd8pX/XI9cOmGHnshtbXpXQbFmIxM7/O8k7821uzqCfoyrKT2ZEt8Q+DnpW2g0IP83epSB42Urn8OiL4bpSa7Eui/t0k4OfOjFf1HRvwFwFl+Yyt62orZL5e34QE2K6rmG7bXFWUZKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JeHqZNYO; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JeHqZNYO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/Qy02JvXjegFr9W1zgwESH1CYjgKy9/QdQUxNYMBGGPgYQzKWKLTsbT+oTWtAMXXCiz6ZMoLVNfiHrzDLfWuD0hkN7z1tTb+NKyybjOYJ7fbwSstlsX9AOJyCuZA04eEtYIXsA50VaKnBXNeKz75t/yZVddH5QAj5fE+xSBDanbyN2Xpaqy9hlAxwNFPq5qL2LVw0PoRhDaQIao8EDSWvRdUuBJm2XozM7ZNBXyjT4VnRYdzg6hiEvLxkDgzaojPC3THRE6XL11D3dFYTxgGAGeNpqr7iqr3SfZVT203CtOvit/LltwnLKROZ1oWtM0uGKPjHt13fu+Df16oJ9qSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CO+4zVEzBXFQU+FryvPJ71dvMktvhTR8NaoDhiJkTgI=;
 b=QseEyOlwK1w9K+ulMXg7IZykZMy+pHJsySW2+9DnSBval3zN98ayt8spM6IVY/kYcb/cIP5rLPXHjH44MTzFULLr4eXmtWwviNZ0PxrQdbMSYUAmc8bfgpdlh7Y1KdzwcTwqzztJP55KQ3Zq8rE0M1NlUyHF4n6skRm3AlWw1oTb2m9fhGw1LYooUjqSQ2ceWDtuRXoZWMQQYkQKrw4AvM12zJPrKCPOQP/s4oK9zvB2mR1r04YnsGsXc+lG0zSWJpZOZu+1pAVjUPlBRrLQCEBJEPyD/ZOgy84amuq1Y/sWajsZrrsCg/SOu2pMgTigdWqLpySNmjIwKqs1weWhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO+4zVEzBXFQU+FryvPJ71dvMktvhTR8NaoDhiJkTgI=;
 b=JeHqZNYOm62zoL+NVlfYRvaKhEyXIUwd0Zjbr+AORbMJ1dE6cU9RP+BaoKpbWsHO1+JFto/YbGeosJJabSkjKWRbRftKOlUs8Dpy/MNJawhIZpFwTMvd3X5sq7SohEzZcohWzG4yQqGrZVCWgjZJwn78U2nLt2jIlkGUtKOFZOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:33:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:21 +0000
Message-ID: <87bjl9wgq7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 225/292] ASoC: intel: boards: sof_rt5682: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:20 +0000
X-ClientProxiedBy: TY4P286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cefb94e-e490-4060-c65d-08de20b9ea97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6JyKzEMolUZqAIdNFnJfff2Z7nyo47O30ZKSjTldd8a0lVXu8gL1y5poE4GY?=
 =?us-ascii?Q?yjM/nPXBsJltzVTKSzM+E8KJdgTKHRf3ZXq6BLSs1eR21FwIhjNp5rV4+kZo?=
 =?us-ascii?Q?AUu7S2UfbMU4w1xTqUHh3R+a98TdFQbe29h2se0KE+nKO1AHIjXb7zVPZzs8?=
 =?us-ascii?Q?w6lsw7A46ydDO+pWQ1+afIwZAOT+mOsmGHFLRFeJIe2r9Q0XokUe6vib7tx4?=
 =?us-ascii?Q?jnAmtRrmoTwydEoiPDL5bV8Gcn7utSassN5lnmzl9kkqG6L+5ErDuAialEEs?=
 =?us-ascii?Q?rD0nMH0w7Xg7JKN8H8V6rTgI27rmGbxW0+yHxf305Iv4q2xUFwf9D4IckyE2?=
 =?us-ascii?Q?4vYgL//Mwef93afAlDonX3DgcsIGIc6Re12/u0H2q3cglmR2LGWk45JCQ9cQ?=
 =?us-ascii?Q?dtJ1ycZUkgyMa62w4lXyW3MqizyaKFy/eDi2lSDaoaEnVcRE7jKx/FH5ftwB?=
 =?us-ascii?Q?2eliQC1Qoqiz5mKHi+rq64wP1G23Pmha3WDIghT39+eKwIwc1Mx5Nh2MskWl?=
 =?us-ascii?Q?w3DpV0sQ+kVcjYn+5C9OhAp7/s5YLSO/CzOHsSF2R0IuAPqb97LF/zKeoYj9?=
 =?us-ascii?Q?MGWBie/C+uvKJgwy3sUZHH7LkG+VQk7U85wpmRwARu+PvF49Z6UyjB57oo3I?=
 =?us-ascii?Q?NevF/aE3qU8p8RliuKaSyaGXTfUNPKcX+wku9sRFZu7mV3iw/lLv0N5XTYTQ?=
 =?us-ascii?Q?IUhA0qDeNNKBqG63PJSmXAxNcR7PrXUAlU0HILgli/K8RwcZSB8fpW/vd+fU?=
 =?us-ascii?Q?ht3LNgsV84lvPFvm50zg/0lApPW1WGS8K9ZvJB8GyeeU5l9zpJvUqII407kG?=
 =?us-ascii?Q?C+GcfrGxM1+oyRkD4M7GyrK2VZNDaUT8S9pk8JZQ+WuJ6asklEetpb8x/e5h?=
 =?us-ascii?Q?ym+IQj/jedGXqL0Z19DqEdbmO7TVosiKgHH5sq7sn4VfKf5+3aNRpT2GLGYM?=
 =?us-ascii?Q?W3fc8W6jvqFBBiP/CVOACsxLM2wuNP1OJcW4Pqo7Vnswv99SsW8uWsugAmFh?=
 =?us-ascii?Q?3Mdp1UKV4+7d6EHNk/wIY5Jvxm5ykPGHF2AHaPGUktxkVrw/rEGriN175GF4?=
 =?us-ascii?Q?Bv7/s3WAKIdASa6RqkjxYmmBlh3LD1KByEXS03cMUYVzzi1RrZDFjLy/6xzx?=
 =?us-ascii?Q?FFcAQGoP6CAmz2Nxskua7pptIxxA6EIWO7q5fYwkOcziMRzep+gyOT/XvhPH?=
 =?us-ascii?Q?R5JcBKyXFmrTr0PSsp7Xf2k7ngSpUiMNmF/4CvCJVF9tDTXAnAerxkXWis9q?=
 =?us-ascii?Q?3dawR2k4gFX6P5wdHLTZWT9aVd6gapAMlHBLySp/3jAr6x/TCAKLtNjy8M+T?=
 =?us-ascii?Q?MBY1USvePtMr/WAeWVXc+XfowjMcpBnutGq0KKn3qObG9Aebq9t8beBX4Qu4?=
 =?us-ascii?Q?wbEoBba3lSoVq8ABvfHBXE8XwN9284c0MlsrBxvJFIxksxKkwbEJmylChRkG?=
 =?us-ascii?Q?1VQDjsrYTHclTw88OD2U0weLk4Gzr4Egnu54Il3obH3fWVyc02ytO8JTb59U?=
 =?us-ascii?Q?c37gj/WJ3qngGvQwHSODCpRT+4yvfvHz1XDI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DbBHLJrjr8CR5gu3mvTqS38eaa2ohXtPoQTrAbwy6cMZo8sLL73R60lXEVX/?=
 =?us-ascii?Q?vig/UwQ00IEdL481spKKGuzN+70kU02t2w+8hIZK78zFmj+KBQBLqUk3jmd0?=
 =?us-ascii?Q?pTpxEP6qF1f1pUutkaMvcV9kRwt1aTFeLIYU78DNHNLcNvg7018/FoGiVlOR?=
 =?us-ascii?Q?5ZuPclk29lxJ5Lu2ZIyme1s1onQCtV32dk/LfLQpi7UDhv0CbkgRKAbgK0FY?=
 =?us-ascii?Q?z0eqEZrzVZty2dP8l/6V/4oRFsqOe33W7CPvX4FD1acOUGeo0QMrFwum0qpU?=
 =?us-ascii?Q?59V0MLodcX7bkE7vPwDegTqyO97lmlml9FHcaZebhY5u+ff0+0wgKO8rfD9c?=
 =?us-ascii?Q?0/CP+y0lemXI+06ISrSQV+9UYMm+471Z5mQmsnrl1vn9r5VzWCiyDtBDcC1D?=
 =?us-ascii?Q?TIMTNSJv/31dbQOFDIPX+Mp4dBX1wfYVmcM3eXHYW8zionnIRiThMCFigcjK?=
 =?us-ascii?Q?ZRfFWRMw/W8oe9GdSVLfphi0iGQhO4etq1Jr/5XnUbSutHASm2lTX/G1ueku?=
 =?us-ascii?Q?UY8lOy8JDpMUvaDQXv4ybOaRAlJpnFRbHXBIVjle1nzgh8c9KJMaosjfabCf?=
 =?us-ascii?Q?ge1OBaunu2ZHO0FqUIIMh5qPhMA6AzQd+gzWWqbqL6IzM5/uwgWSo1AA8afH?=
 =?us-ascii?Q?1mRzEPP3+nihAO07/w+VbGq5oC7lUH4FE4eBpHRSc4zvYKGlEZ7ZgZGrtbPL?=
 =?us-ascii?Q?/PyndBk9bJWpqYzbB8GeIO+Zz1ILcDnGXEJ9nwsnycPRkxMpPGCBCW8O37hL?=
 =?us-ascii?Q?jGLOJQN60X8DlRzBsK5OlpdVKuK+PHTRZOwS88h6BEw6t41xSD2ow6agz01I?=
 =?us-ascii?Q?ecGMKbhOG1X9CoSuwkmEvmQIxH/yJer9aKfKEyIOUYFS3uSNKe1Zw0K4jctO?=
 =?us-ascii?Q?01t4SQFoHS4VHtUaZCZnFYrFK/M76HB+qPgDVSaOn+p1bXCC13/YRKc60TTS?=
 =?us-ascii?Q?0DYn8tQC3azCwuB0vzhgG0kKRu8MZ+++dPxY+vaojWzS6po05+94ujvYuSpJ?=
 =?us-ascii?Q?SSm38dChdw6+tDN1QN6/MDKUZs72DD4TVk6z00O09mtWEkA31hKkYCIXvOz5?=
 =?us-ascii?Q?23LE87O5GtTj65iGML7rhSyqYVhMggp5HEs4b13Rv4MOADO4x2j5vk/DiNiM?=
 =?us-ascii?Q?qbEoIuKSG2bNT0RfNK3Sn+lCCp7Ks8wzsXh1fugD+EpCT9eopLxfWhVESldr?=
 =?us-ascii?Q?NMnlpmlfYYcR7pv/Ol8z3pG41UnMOP15xqa/Y63VNpMqEgRI3fLJJHcBGYjL?=
 =?us-ascii?Q?I50ogGmoI2sOzAulXEt+HVg4lxJvLIo7sROHKfClfn/jApEFw1zUK9XuVzQF?=
 =?us-ascii?Q?qdAM5kinzWyUAskEsXCWuRu+xWbmark3ndMYhMZ/KW6aeIYMnfv0oG+6Ua4G?=
 =?us-ascii?Q?ggLXAxy5MKTTNbff7/LSlo9Ecghkieh1bbr2PinIYGJEc5FwHClKGLKB/ytw?=
 =?us-ascii?Q?VYZ/tgPIlsH1DjvxVUNxPnWAjmwRBSkL1DrxLxLluBBJAHlIK3SG1Lhv/OOi?=
 =?us-ascii?Q?roRuUS4HXwAXvFWF+gfkvSnzec9rkWFM0tEnrTbnTL5h4E6lh7qHFfQ9HRtF?=
 =?us-ascii?Q?r4JnyOI/1qDX0GY2VEXqTcr/unC8MDVsq5L0RYpPCO3g27pYBEyS2S3PHbDr?=
 =?us-ascii?Q?GaQyQFq/H97/tGd8ikDElKc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cefb94e-e490-4060-c65d-08de20b9ea97
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:21.1021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfrGSxLOYiX2K8uBUWh4ktSi2InZch1NqvD+cxIgu4tpOX2Fi+kop+E5UWxXUZ4l43zoVK/SCD2vdyVHMeRYIZAg4n6Lx5E5PupxZ0yHoW5jQj1XmPrQzcCZCA0gtPpZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

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
 sound/soc/intel/boards/sof_rt5682.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 4994aaccc583a..a95bc6a714649 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -404,7 +404,7 @@ static const struct snd_soc_ops sof_rt5682_ops = {
 static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dapm_context *dapm = &card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int err;
 
 	if (ctx->amp_type == CODEC_MAX98373) {
@@ -458,9 +458,10 @@ static const struct snd_soc_dapm_route rt5650_spk_dapm_routes[] = {
 static int rt5650_spk_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt5650_spk_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, rt5650_spk_widgets,
 					ARRAY_SIZE(rt5650_spk_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "fail to add rt5650 spk widgets, ret %d\n",
@@ -476,7 +477,7 @@ static int rt5650_spk_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt5650_spk_dapm_routes,
+	ret = snd_soc_dapm_add_routes(dapm, rt5650_spk_dapm_routes,
 				      ARRAY_SIZE(rt5650_spk_dapm_routes));
 	if (ret)
 		dev_err(rtd->dev, "fail to add dapm routes, ret=%d\n", ret);
-- 
2.43.0

