Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADF3137750
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820297; cv=fail; b=PlTndPnDIV0onlja6+wvL6m1gNHcyv9NnPOHTgVgbgFwmjeOgho+Sp2pVbN7DGe7eG/R0RDFkY4HTngfUIMZmA8nCjde7AyW6clfm0DazdSYgMhP0To+u3Ri3e8fP+zmWMjQmJ7naqPchvXk94nULjy9/cbwD+mmhzm7ZkXrTAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820297; c=relaxed/simple;
	bh=6DH+XVn3nrvZ7BqzmljYF8vkbl7V62VvRIXMPDyiSzA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Rj78jlme67aQG9uKtZPTUzkHrLRlz10J0LzPaOI7b0JzAV4HARFuQCCwvawhMKaq1Er2igPBZ9yRqRBN86q2OK4cD9vgIzpIohub/YaK9ltK6u2fg4XSWBvGMrnf6hRh66DdcKA+wH376ODeTlUhCAeK6xCv7mb2FIBUNC0pKzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dYdhw6Ig; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dYdhw6Ig"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USu3jbHHgoTL8yiz/LgzIcTaceI9+SaBWNNRIFzTnWBT1GGwFXCiQvX590yUzr9+wIxCMxDDrGXU2+dtrdMaAdGz4MUctfySbKtJ0i2/p8pOA7v3+SDKFr4ol2x3GyPhZ4+tM5C2gPx52OwJJxZQPo0kCrUds1I8ixACdgsxMsKVUlu/ZNo3AvZkCz12DHXSmIt92wGYu5gaF6x3/sjvp81V5Bou+qz3Zj979TraYazK7LP4eVwonHkpzANxffztIfBowOOrnb+P7TdtdexbNFUY7SgRcTHHZF1tI5zGZlhHkWurnnHKxG75nQaIzj6t6uuIp75+3NbLuRcd3cNHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dcUtBaT/7f+yRdE3qOob6nnirsn9ihW35z0LvarZGw=;
 b=FiWQL+ldfUoc7hSVg/bOV/yrOE79kq9xKTy/EsaQMQ8QmmmoZjkshHJp26ps6FLn4u0iJSoSlgRK42aVu8tU5BgiYNdrAsk75wNDoyAZqycSMYHXSbBaQMMMltp9+D9ufuzqGZ3krHKmuRrHSCEIL0FqXs3dYM8qG82S7/P9GQidrOAFL8z2lur37H+JUZI/g3Y9fIoPCbYS6rx/ewP2+d9rZ+38CKu+g/jupoxZUg1sbYmxIl7xDyvAVDu8GtVYWfvUyVdrH32XCgCW5XX31xccWcAWbC7x0CqUQVH4E2W3dlmqwC7FNf0TBkL+8X6DBzo4Y4XOqghzGmRiG9UBag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dcUtBaT/7f+yRdE3qOob6nnirsn9ihW35z0LvarZGw=;
 b=dYdhw6Ig0NcyNf4dsiERBifuubVBIXrE85waY1kBhSNi79nx0JU9OnrBgsIG+ZiOpQf+5dBgk2MlIsxcO4UK4466hJya9kqgleJeAam/vNRnuDRNMLsqq9C2f5rtm2rB7IV22fMfN3wr74fm3ssdGotJjEiKx7ehwInGsTjtUug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:13 +0000
Message-ID: <87tsz18lru.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 013/292] ASoC: codecs: ab8500: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:13 +0000
X-ClientProxiedBy: TYCPR01CA0170.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: f7944d23-6127-49a6-ac08-08de20b7cdd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bBpDPvJXNtax+i1jvkIG4XBhe+BQYvubiw1vgbA8vsv2BOzIRJSNRW81JNjv?=
 =?us-ascii?Q?md36Row9KLA8FFZ2095aDVhgJl/IIZC0pq17ViSAXTqANtvQAah26VVi/V0L?=
 =?us-ascii?Q?e7Nh32svi4s791wW8qV06At6jTgrQDS3e3V3lAFqNlq7NdBlyGqpXtiAuXP/?=
 =?us-ascii?Q?Me+tHtPCL8Y0wKTR4HRrb3v0Bba/+6VZKph5HGhCjaY+1BRymM/E897lYwcG?=
 =?us-ascii?Q?CZwD02IPlHC0JP1iVHVTCfdxvSJT+OOr+rra3SXuajpVamB1ZsR6RSGh8cI/?=
 =?us-ascii?Q?LyNydoAqJZZx6u2iQCulPdjPFvmAuHsDRFJ2rmKvSLclj5HPn/uIiC0j8RGL?=
 =?us-ascii?Q?78OmTzbSVJsYUZI7XVoSNZH3QE9v4c4ZFbUGrSp8Rug6TBX1IoGYEcbTyy5p?=
 =?us-ascii?Q?ZZhERqni/g2kqesnubwulg8FUILO+hpDHlyg3q7+ai+/0sxBTtTmwOgFatnS?=
 =?us-ascii?Q?Q4OIQznsnlw3pBCnJPdpco/1Gu3rKgCFAUsTdECaOpFDV8nkd50ktev7gimS?=
 =?us-ascii?Q?hJt/C5BEhdcVkOMPPUj6khcXuX6j5g9/OsSZroSy2pmDmdDBIa9TjZHY3Zgw?=
 =?us-ascii?Q?v6a5aW7iaeBxYS0H6yXJlHtM7oC+DjKneDXNkKO/BtvCkzrnzKstkSgGbdxW?=
 =?us-ascii?Q?J+lxl72F5NjtOXJWTnU7hcbkcTQy6BUM0YxS9jXGDac9QpcV4UvuTr/NdQVJ?=
 =?us-ascii?Q?1koYgYwggNlU11SaHJ2EZ/0DKqISr0IJSEosjSdavZ/MCkW4X5JsnkmHGG42?=
 =?us-ascii?Q?iyDa0yMJWfIh8jJohEe2EtnjjWo3Qvzi6lM6Ayn/m3AmTIiWk5Xr+/EC3y+q?=
 =?us-ascii?Q?67Ase3Om/R5y/7hodMFcqoE9ezn6+eBkj6M4kY1F4spgyayZ9ov8gj/VjNgJ?=
 =?us-ascii?Q?H3mB3a8ohS7CmRV6TO+pMJba8tBEEUDQ+K9oSnBYoGx3u6m4uxAeUNlfotsw?=
 =?us-ascii?Q?BWFeSCrgRwBsP24BhtOY592dhou/NGBvs8c8oK5LXr6xouy+7nqM1p9vBoCn?=
 =?us-ascii?Q?cVm+viabsfW8/vwk2GMpwSkOFRZL+UjjdlmjHVbqMH5fbHE5nn41sz73D/aN?=
 =?us-ascii?Q?Gwn7qa+iPqHAH4B71Dp/oERpwdVpJQADZAtaGbLvuLLtsLgObTyC6HLDH9x4?=
 =?us-ascii?Q?h4voj3dXcfG/XealTLHXJvcOP/GaSVIyifXbUuoVweyzDYJJBf9USFSQ/Rgs?=
 =?us-ascii?Q?9zfGJagkptmlA5OKnYKk9MzmyfnhUocYvc3Ff+9AUIqiqJKChHQ5v/pUWdZ4?=
 =?us-ascii?Q?+e6kTHvfYDQW2rZTjRuknDLF+Co0pNpJrQOW/I5EqsmDlWczij3QyBzg6N8K?=
 =?us-ascii?Q?Pe/4tbHuZV+fDBahZGDFcmyoLLQKzMaII2N8DH4mR8XSZs6XQT7Zp/+SpayF?=
 =?us-ascii?Q?1mdM/1El96YK+6CF8NwpksUsaFcPMCPSpfTu39xtKLoWaCgFQiiZm9UY93RB?=
 =?us-ascii?Q?sp2VykJ8rfAV3gvN3K2QEKidizk6D3nalWeFuu0/afCDs0doremSK/PQ5kBN?=
 =?us-ascii?Q?gycLfK4/ShYw9b/bbAxbpWV2NMufUW+JbrNy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WgL1O2zGt+ixWvBSOaHAjtD+wI8K2eKkFpMzqQfSmfvWNsFWf/8ttFZqtOD6?=
 =?us-ascii?Q?LtUbiEtHOQru3yqb57YJnoLOpK9kHmV//x+zNYxGcXAiMeXZ7yB6yVtGJ0gl?=
 =?us-ascii?Q?8A8OlIOFn0bWWu56Vm7kXci6PrPtmGwuGeKKiZISnwJgMAMr+oQcfHQUrx2h?=
 =?us-ascii?Q?gI5QVyDK/rg2q/SblG3kR+r+ujil6N72iC5JgdNTP4Sbx8TeZ7g9BgoyFGQO?=
 =?us-ascii?Q?2L+I/ZhtoMBmTJOcCMUq9oNeWbz82An017H2vmscWFSTZ2BhScGAfuxeFovw?=
 =?us-ascii?Q?swTzlVhwit+PC0oZ2o1hdi15Mou6RX5t7ykoHbuMZotC7Xp7t/NSNaaiMuLI?=
 =?us-ascii?Q?+OTEQSNN5ZkQ/1XNIrufL1qJCvfYTYoA+xUVO6PW5H+KQcCNuVZtMaWVZGUO?=
 =?us-ascii?Q?xRKixGg6suyz1pgvn0F+X1Ot4/vtWY6N5LDR6R3s5Bhed9Jwk3LH8Jg0iJMH?=
 =?us-ascii?Q?JwYl1yw8g016QBg4AjyyS3hdfX2vEZ6rkeyiatTMujr4qI99WBngRzMmIwUP?=
 =?us-ascii?Q?7IjYGbEQmtEhNWq46QAaE4yLifdkg9i2WknZ9yD8Khdl+H5/+iejEmxb8czS?=
 =?us-ascii?Q?MfXCR2BWwl/GuyA5J+Sjt0LHIIv/yIHoi+fL1GKSE0SB0SnVwfQzr0+7jIx0?=
 =?us-ascii?Q?Qoodw6NYPo/e4b/7nrK68x5nG8C1kXebYiTsrt1ckOwFvYDvfTnD1wEon/TZ?=
 =?us-ascii?Q?Mx6KDfi/85jpf8ojEqaeoJ4MOxl0VQLwgjOnkphc1V2la9d8oBgF1k/3/lS0?=
 =?us-ascii?Q?a5KMIMYjVOzv/o75N+8HYAaRBBwSj3xtIi3hzq+gEyiORHjs5SGUE5nCAGLi?=
 =?us-ascii?Q?vCKQ4z3SOvzcUQS72FT4lhrV3Z9LQO7qTWf4zA5jYbgGyKSH0FDWmJrAfeUj?=
 =?us-ascii?Q?vCuYbftN5cQymOqNq5hF0cn0q5+22nPZ9me53YuOUmeflWxiXT39u+vynTuE?=
 =?us-ascii?Q?vhBoduPvaNVfWBelpnMJx7zxh+BYS4YT3bgVhlYS72kJl/0Zwvf1JFz00KQZ?=
 =?us-ascii?Q?4VoQkch0KucHZobukIdYNVN9YOHFv1/llXIUw9KoQhk/oDTuJTcQqo0ykBTp?=
 =?us-ascii?Q?fbgCDK8pxIOqw1ujdVyD1yz2IHcnjvZwlgb5jCSejnnsRD8XV5j7hCFP9whK?=
 =?us-ascii?Q?zcNqH9lnO+DE2IOCbNzGqNUS2tYF3C5gTvBLQAmhne0RhdCmK/Z7bxdR1+UU?=
 =?us-ascii?Q?xuoHFcaXP2U8BXBedq41CNyRgER4YF3N20jWavz43xcuvDM8Jhq5UpwMKtFw?=
 =?us-ascii?Q?GVHHRcWRsWp/rJ37IFVJinGNEuBz1qTxOcCDJsGGL2LWhBgQi71PZtbAhiFw?=
 =?us-ascii?Q?EqmMDxga2Td4ZUh8WmfDNqPp6P3HtHuEkAn+bk5nfBYFfEy8/upeeVXo0O0Q?=
 =?us-ascii?Q?MXYNH84uxCqXQDf7bcm+MDgI+2a8zHZuWPogmfgLh0Nmhd2ii+sUa+7/qf4c?=
 =?us-ascii?Q?1aTkFvZVM1xhgyeu0F6q3HsewNILIM3vbmRXLp3GwkpNNKHIc0P/Rye52/m1?=
 =?us-ascii?Q?C0XYdIane3IOa6laQC4xk8gQ1vLts/fe+ckAVTPctXziyEAkJGEyfjPHiO3m?=
 =?us-ascii?Q?i3mZYSbB6dJKVBY7T7wK9kR5toGZLbrzycPvm9Qid0PUkZKPlNh1F3xZ3fLh?=
 =?us-ascii?Q?Ui1jVjnqcP74zmqXALswC1Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7944d23-6127-49a6-ac08-08de20b7cdd9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:13.9546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGyBkNf4D525g7uwtfuAbZr7yR780OdTxDgN+VXilKlBBWU3epai7fd0yhEObMGTg66EtSZqVZcGzO93t5qY+6OftReBsJDOktydwoZrB1loQW+moyxKX2B5vOv0UBL8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14299

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
 sound/soc/codecs/ab8500-codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 14d0378bfe725..fdda1b747bf7e 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -1197,7 +1197,7 @@ static int anc_status_control_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 	struct device *dev = component->dev;
 	bool apply_fir, apply_iir;
@@ -1934,7 +1934,7 @@ static int ab8500_audio_init_audioblock(struct snd_soc_component *component)
 static int ab8500_audio_setup_mics(struct snd_soc_component *component,
 			struct amic_settings *amics)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u8 value8;
 	unsigned int value;
 	int status;
@@ -2449,7 +2449,7 @@ static void ab8500_codec_of_probe(struct device *dev, struct device_node *np,
 
 static int ab8500_codec_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct device *dev = component->dev;
 	struct device_node *np = dev->of_node;
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(dev);
-- 
2.43.0

