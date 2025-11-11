Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AC01DD889
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820911; cv=fail; b=fNIGHsIcP2VYgMnj0DE/9OJZOCTeFeuPd4use4/84cO6Si7hMFl4TCXdvBgYiUvPNGXKDp6M4IFzM6jXHdjF1G6QFTIiTGN5lI+Ta98rFRtHSn4bZ/OWqFDdxj/baFy3Ncify3Zul4YkHP/VsoIem+V5fKolAfJB/kwSOvl2n7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820911; c=relaxed/simple;
	bh=NltlT0s5cUi45XyZjyAM7mZ23nsqbUU7+paullEbvxw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=d17Maourf7HULY8ktrlly13EzrVTlMokYNVB4lCm5sucrUdQFBwr8Auq+qL3qHRmS8YomwSAKguytcVIywCB5wFbeatP6GGxn/XBx+QvxLBtREKrSrPPo6wb+KyVrY4AvVf38CqEl1sdLjvCVXfwvroUdbd9USHePI32Abwhvyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bAPGrLyw; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bAPGrLyw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7mSmQ0fwwHWlpM3Ob/4EnOH5GEee1t4VORRCQ5VpmwYdpzLeFFRTAcRRYtCO83yOdmbZrXYrjyz3TPi8t8UIIQdg3VCzFx8TwvSyM52Efun5qUoWoK5dA5pnmNzT0AAndG8CQ+2dfIBVHnh5gCEzj1nH9snCgFYkgeqnjAhMuHmF+DFG3MkDIuMwGutBkbz6r/F5yOCd9uznLA8WIP8aGBisAFLCNxa6KV7B/QVKHK7CcYrbpDgGd1LLbPu2qzwdsjVo+7txBRYKUYuEdRli9Z0NMl6Kblkp+BZ/wVb0rBI9nNZ/CSFB9Dz33VAQWk9m4kfzbrvwQUANRaJcEv3LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhqVCDLI46AFO11H4db7vBKONb3/Y9y8CdpQQHJct2w=;
 b=Mwh2zWTd47em3VPPDu4MufnMhKaOe1AX5P+aSxJT2p8TcYaymLHNpqunYmztViJGXz8DlgfbchdtS/05ID13/YayjFaj1UcVPkLiuo10XWOoKXsduUtLhRGgBp5T/Ftr8745Z1sbZxpC+tEgoEto+hUXMFkvsKUFxFa51OfsZMWBZ7rjX/UAIUszYp59RBODUZJPEu3X9k4/wgKppXa2tlOAWJd17AEgsxaErydy5A7spR9lSRZYtLxboW6xt9V1SghUOsxyfNhxYh3PI48bMSgcj8gjUaq3eIKeIiaKgIOniodK1guONBHkuXbbRVRPppRHoxkmbOGVBP/+zyHL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhqVCDLI46AFO11H4db7vBKONb3/Y9y8CdpQQHJct2w=;
 b=bAPGrLywoflw86uVIVt8P3MKBGDGP+lk4u0Ed4Z3ADMYKZ5FkO5PZkX8L2ceLkaNQeBBRIZ8RZEbEFfVohQvYFPrCb7TvdN5EY/MztuR3M0qDqHlzcYiwgUNJfZqXlYWq1WF9yb7r6n7nDeADTpT1nA5Uf6HOsqySixrXZXHJDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:27 +0000
Message-ID: <87zf8tza38.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 158/292] ASoC: codecs: wm8711: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:27 +0000
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a2dbe1-ddc6-4ddf-72fe-08de20b93bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y3pF1yhOWL51BLTO/okdNem72OLyegwdX5KW4QLqbW0L0ty5fyXeR568TDZ4?=
 =?us-ascii?Q?W6rE3SKCll1D/UPEPtTAWjJxrwHte+LBH8AOgOORuX79EXIpQqWjLU3eA7dk?=
 =?us-ascii?Q?me7VH3iT/gz6piCilKlI2NT179aQ5WXwQ5rV+MCsbA0w0ifQseudeQtsfZ5K?=
 =?us-ascii?Q?2lLiSIkx8ryYapPCPP6EEaYBBMa8HUMBP/gs8kffn/N9cop9O4LwI3kYdeiy?=
 =?us-ascii?Q?Ri0zutMrY+1Mgsg2eQ1aNQzBZGh71AsEBdwx3nF+1P9kniZ3gj8x3U0DBVNB?=
 =?us-ascii?Q?JfTMkFdVXlLpnJnGjF513rDwzq74qn8WCQOu06Ye9cs8UmQaOufTnaLR4H8q?=
 =?us-ascii?Q?kUlVpeCxrQWv7i5phqqyf2gpbq1W5+eLL3kU1skdm+UZcPGlKUDQi9CdTyxf?=
 =?us-ascii?Q?s+jJFM8NNY9o6PwLaSiwKV9cybBQrqyWDp0VCnhRRd7oOlXNK+ip7sdXqToC?=
 =?us-ascii?Q?BmHaNkUJvbMEW+3K9M6dlMWXJT34UItxoey7G85r4ZMF1HuoPFYDz3n/yQDk?=
 =?us-ascii?Q?9f05FeKpwq+uWDQza5x2zFLfWu5UsOqO2IbOzFuponwVIR6WT/Snw1uWZ+mO?=
 =?us-ascii?Q?MbKal0zfnqGrODwGHbHNEXbDXeypiEQiS1gFt0pjrJDJ5MpHySMkZthmJPa5?=
 =?us-ascii?Q?yfqML+LnaHvYYiI0/uYK2M3wwZ56N9+1ChVu5tIIzhgRGFeXeDsLZwKw9NSb?=
 =?us-ascii?Q?I+asSuvbcX5lObD4mMZ1Cjvp0TCzoki8XdNvIUeRh2GKwJQrtdD6zidg/ydV?=
 =?us-ascii?Q?84WFrs1n1QGHBiiqmiPoyFmSOa9qIqiHBNhGjMA+3c4RUk9g3Wgt4c1KbL/E?=
 =?us-ascii?Q?j+xL+/TpLkGxRmzsJLd54kEMac4Y2JPIohRpD5sPjtuCniT4J5Jl6ldp0ost?=
 =?us-ascii?Q?9MI50KYJCN0N53NS2joSaFBqLPP/11YncvEZFvQlEqcN8zWctRLCT1IbT4zk?=
 =?us-ascii?Q?gC5daJKlQ5tENabhxjrhK9jGe4/gcmAB1FtN3zop3B6Zn7NH36lu+Pto41Sc?=
 =?us-ascii?Q?wW00bXnL/bR/2FnIYLIbdYrSTuhWeZuDmtGAVhZcBpNTCXlkW/OVeNH2HuvE?=
 =?us-ascii?Q?bZiF17iUSbPM2B9/b8jWAai7btZL3lOrTzibcE9Hb4Ibi1aYnQq0SyQdsMKa?=
 =?us-ascii?Q?6CBscTIRpLQhd0576q+nbuaet61QQfqzacQQ8yq8RgiLM7Qmg4aOb7NXXFPp?=
 =?us-ascii?Q?4M3VIaJ66OokVn5qivoEdpwuy8sYWVH1p7zCwgbthj5RysHTT7DDSVa+Eohr?=
 =?us-ascii?Q?zLfe2S9ZCigN4nmVqjZcwuBKvQYCYE9EE4LlxS+EzHmIldtzcAKkGgxQk6Tp?=
 =?us-ascii?Q?rHv0qwyA3owKf20sfnOdKyEeUW5jbViNLW7srtPMXWKise6o8aZ4BqzoNvWM?=
 =?us-ascii?Q?cNrDpZKST3CW554mb6hRH38e74SNiJ5lb6RTYVJxy5EU1Uf0C8WNMyNu3DYR?=
 =?us-ascii?Q?R+ylIlHUCkkTRYYNyViXBJoXHED2OVfSQxUJolxQEWzxO3ABW2Qii2b5p32Q?=
 =?us-ascii?Q?//1Etgno7ZpZsQfm107A5amf2FGg/+MHp3UU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q9jCxGq69vl58DLcUduw4zFUzieRvL3q1Yh7U0Y/6u5XPi9onMVrDoevFYc7?=
 =?us-ascii?Q?5zywjBcXS583f0Y3LbaVj4WCZf5r4E/e5JCVptyFzSa5jWmo1+zinE6uD1Yb?=
 =?us-ascii?Q?7YfTd7j1WR9tYQIkPHhArzVMyu37PqUab3RR+WeTU0OXz5b2DZtYlc8vMmCr?=
 =?us-ascii?Q?/w/MXh++YFu5aWVPpaRGNoSUgsn2i79IMEY+iH1qq2TwnNicj1fbJVNcPsYK?=
 =?us-ascii?Q?84GjLNKZ8SXoZd3JsHNbfNKcURwZzFb7lZjgXxPXEXUBWOeh1W6X7F8PzUGN?=
 =?us-ascii?Q?hdzAEREiXM6/2G7ukXbE9Ery3OQjyRaqtnli/o7r1Q7zIZ7+5HKu0VgzuVRt?=
 =?us-ascii?Q?tnQrB0eh6nwSO5t3xi0qIeErTi9yYMItntm9avS6pSDQwEz1Dnt/QLfjYUvm?=
 =?us-ascii?Q?RFqxIvkV2zL/1f1TnLzPkjXM1c9q3enc9Fd8XWyAqC6FNRGW1EFv89teb/zx?=
 =?us-ascii?Q?k69ZjXVH3H/t178RWXia5DfLTkVh2j+gR3InK8Adw3AnU+r3+zufopgxS9Jx?=
 =?us-ascii?Q?qpMuJILWNZuuFcjg0q72ZAu45rjjgrAF1v2QeGkGdkhRbdblPpmI2Tlznytw?=
 =?us-ascii?Q?aFV+42jVqdeS3EJcYpuhYum90QXwoQO+MgyUf77wNrWeyTrBNof+A0Z//0Zk?=
 =?us-ascii?Q?WyBwGXqVszDwNSSVaRacVg6O7eSUCUVv2Napx9TLJg2ixmjlJIM8sgQlZXCG?=
 =?us-ascii?Q?NaERGMwl0hQraTF8bnCulh0ZtuUv6jyFgrvHxp8jo5qhyHk8+UtLeZ7Agu5O?=
 =?us-ascii?Q?9ZgP0FCZDueEABQpKbDL+Pq8+CWPBiHnmWOnxlQWIT5n/XMrLL8+WNNqAQhr?=
 =?us-ascii?Q?5MzSaUwqTLYdNySoXLzQQF2n08QRNlUR8phKRGDe0q9CKnt/FSmaFRLvhzwV?=
 =?us-ascii?Q?BQ5s9RcKYtzZdneH0z5R5uJRaNRBaerPWRSvtM1nghzaoGaYlWojdv6mNzx7?=
 =?us-ascii?Q?uWYDd/f6yFQbw+knrl/a6N15YXK5zfzFp4BzMlAaBlZbgBTWAPyt938if3h/?=
 =?us-ascii?Q?xpRyRd35jcBzFy3TF0fDeI1mRSFyPicQoFgCfJ5GB04wj3gsfxZO/HBujtWD?=
 =?us-ascii?Q?/5XybQdYihXZ5c+Dbm1WNfRNyW4KJKfD2jczXEchUsHLsA15hKlb7b8bowea?=
 =?us-ascii?Q?kxiQBt291zkqTO7ZqdfsaCt+HQ9Q6QMaZPDHGp3X7GtQcjiPjBkUu/imKHce?=
 =?us-ascii?Q?xpcFJ8QGquiVjJ3PgUSxMQbP0wcsm9RKFocpGMtvmFEk18O2h00sNrFeN41C?=
 =?us-ascii?Q?QyTXk0ICunhORICyR9T9eZYrODSeFFmvSfHumnB2ueXYEXYFEITPqCvX5qX0?=
 =?us-ascii?Q?Sag1G8vYgY7oOoTDPnoSV55IEa5Z54zV72WKPvNzs0c1Ajo3dr9bAwYexfwn?=
 =?us-ascii?Q?ysPk2ENVuNWC6lrx3IrIREr70QYUdHRwqi+Lr1n0uNHME+wBbc81+eYq9icZ?=
 =?us-ascii?Q?P9TXP9MS1kqiPd1cTowdQT5s/+3pI6P+cH1KsVsdCbqAXSeWIsn4NSHvECMy?=
 =?us-ascii?Q?inWrBg/8eINgsWo5dd6umCbEclDsKMjJMzRGEf/XyHmAGYJ5iKIbWTqncyzl?=
 =?us-ascii?Q?QBY1oPQBXfG8B74qcZX1uOLhhsDQG23TtfLoFetnBBelKp5Qpt3S/8zXllFO?=
 =?us-ascii?Q?BPvpsvFKDVdPLNNlchlnArI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a2dbe1-ddc6-4ddf-72fe-08de20b93bab
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:27.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMXQ2mkJixuhGivLvqHROblZntgnprj6+m9lS+nZMIgP6MCTRJIUxGTqSJ7whzXgTKcDnuM9Iw+QBcXqfpr90eE9KbyIrc3ObpCkvP5m97Ku5kvsskwZTe9Iul+A0KI2
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
 sound/soc/codecs/wm8711.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8711.c b/sound/soc/codecs/wm8711.c
index 481088987742a..2bab9d189519d 100644
--- a/sound/soc/codecs/wm8711.c
+++ b/sound/soc/codecs/wm8711.c
@@ -298,6 +298,7 @@ static int wm8711_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
 	struct wm8711_priv *wm8711 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 reg = snd_soc_component_read(component, WM8711_PWR) & 0xff7f;
 
 	switch (level) {
@@ -307,7 +308,7 @@ static int wm8711_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			regcache_sync(wm8711->regmap);
 
 		snd_soc_component_write(component, WM8711_PWR, reg | 0x0040);
-- 
2.43.0

