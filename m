Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83761D63C2
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820808; cv=fail; b=ASzOqNU1kf6fRMhHxS2iF8BfxB4AFujh5kVAQonKBAnuI6nEhRn4KhTabCaK8BMFsMi1/fpoce3Lw+zMAdCaamSwETGBZvX96Hi4KEMvIqmxn5AKBFTtSKcelcjEHG2PDlmSB13oi6wmJ9cpcMePKMD6sJGGdJoCO458v0XDXe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820808; c=relaxed/simple;
	bh=xbFR3TE3lDGjOvqeIYLB+fTrv8p6JH9c1KZYC6XlXNE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pAguSFB4yhbXzcBdDlUMU6P6xQ/yDLzdmwJvI6fuayqD4VeYW7KIxpDbkg+HCO9fah4xrIWtALHd3WFWDp+Y8mad6Pi2UFCdy16WCL0zbhvpwJC9HcJuW00ajexHWmw8X8XblFukqIN+HCUFihhOlvOKeIyNH8oJUh6euHrqRbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=byE2RAXr; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="byE2RAXr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAoLw+ztIINKb+sreODS787ulC6VgIfWF7gJbiT8zcwd4d/8tLibPDfpe1VIdTpPpMVQLUf4vYDbRySEn/7xgNhOgogfRbmiUnRNBys9Ggnz3W5t6hcmIXFYYhgSi6q7bzEoxIT3se7x/M9mykYJYrBs1pzmZMioppk+1O57autXO12BdX+FgsazHOQoSgX6rGfz4kNxTGo9qGuDCtyc9EE4TQdJR24oRDDXLoGabK+UmLb6YBi8Jy4ajUAT3s7iR9dqZ0Y9n1aKZaYnWBmSHZ4TlXrn6+uvKmxkUM9ICVOE1KU5Ud6D/F8KutYb5CGm4wnTAyUpm2z/lbzJXwvdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rq7IhwffOhSo8nfpm/gdh0TofQsvRq4hcOvVCZ1Gpks=;
 b=ZdxBcGZI0+TkxYLy4gGrnp/jMD4gdP7e7K4LyleAnqH8i6/AzX/NHWH9cjX5wbP6DDx+up4XvImutTVqbFZKa0Uig2T4sht7kiOjJrvQHc6ehs+x7ZCEDPPivxQFyOlh9KCukliRLQ5OG5J0Ceq5F974/y+qStc+qidK7qkTVLGbfAqFa6vWlkiGtIWCmog1NFSDJcZMf8OfoFlTz8Enx+O76NexkJq1EAGxvULxOg2aidlolovoduSkBXlguSorhDzAwll0nX8I5d0jFRYftHKPwRK3ahan6a5tIMLwYoy9lPi30wr0EmqqFX4wuru6s6J94UQ1PNM0Dsdydm7SkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq7IhwffOhSo8nfpm/gdh0TofQsvRq4hcOvVCZ1Gpks=;
 b=byE2RAXrdnrrkTrfIkr/gBzVNgYXppOVeqUN4ca02Q/fPY2hz0sB1laRwJBTz37tcqEN0E9yVWL+Srl6tr9HKJGMoM/g6bEwdBatp3o8leUJfwkSSVo1yQr6tRd1QN04OvwYpz9X7rtvWo7AOy31g2uDH175OpcDujnpf/x6EOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:45 +0000
Message-ID: <87v7jh1kjf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 136/292] ASoC: codecs: tas571x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:45 +0000
X-ClientProxiedBy: TYCPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 9273dbdb-c8c5-4d2a-3d19-08de20b8fe9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a5sGG8DRroi8lYBC39p71pAqq/B81ZNNhW+lXos+/iAxMC1LzXmtiq68T/qX?=
 =?us-ascii?Q?xnJAGmORb2WdAjxz2qiSQa6vyLOIHWRrwdNK5Vh9pjgvHjw/pjRJ7B1uSy89?=
 =?us-ascii?Q?sdFNrbpXrQsENXH8Z2C8wJSPFZ5WbhQoM55cNJi/uJ2MckouxLT7Ac/PDGI+?=
 =?us-ascii?Q?yEy8FMz/H7z9nz8V7JZJon0zPLUPM/uIu37OkrqEA2ZDulHJJj0jBA0R74k+?=
 =?us-ascii?Q?sIKxbIZaFVoCdHKbv6+crjOIPXD1E4xPQuNSKZz9ELLwU2xRQdgv7DcHsA2T?=
 =?us-ascii?Q?TfILWAWyOsr0VDpF8c6SReTRB1yPoO7zPt+sT52RtR0IIzSIOrXEPI40QWOZ?=
 =?us-ascii?Q?3AD0RXF6HitwYt6Pzye12uRXo+cfqAeR8NpCDewI2KpSHxtiwK63YVXdQ+QT?=
 =?us-ascii?Q?Bmo5mEyWIZpAVL5AjBjLImxCQeJaaT4D9DwUXGaUytzF3jE2h8Rk7dRUFGIH?=
 =?us-ascii?Q?jZl/NIidpvqxTeZILAq4DXj1u44QycupsacQiQAWyx9uT1s/ZNK7ps26VNnR?=
 =?us-ascii?Q?dC7YES6CWjUiY1IMNgno/I0ChM0vTJ83aMGFvUK/z5PJbjImoNLdOedFj+0v?=
 =?us-ascii?Q?oGVmKsZpfaxAXMU5zMJvWb/XS1MkXt7zEluKtU/1Z4yB9EJOUlKZwR9ULfyD?=
 =?us-ascii?Q?a4viLl44cP28yujRoJWf2Rhx2tdRIQDlwi/Q8v01iPxX2PsZUQHeC68mMd7d?=
 =?us-ascii?Q?cRP/0xq+yxqj8bTY8I0qpkMwI7DL+BXKQ6yQwjp3XwRhXIr2BCHCJH6DOsIW?=
 =?us-ascii?Q?ZkOPhFhX9eZsLKjRmkkVmThJBYAtc8nRQ3V5duLqpUq+qMEg7Px03pT7vvEa?=
 =?us-ascii?Q?OX6DJgYRZAbdChZkoNIBXokqPEDJfUCGuKWeNppdrbeY4tREM3kT5B+Cpo8v?=
 =?us-ascii?Q?li5BLt2/Oe5P4K47qiDtbxOYatdoIUOaFn6bz2R+/+Ec+0rdTnlm3dpWI5CY?=
 =?us-ascii?Q?NtbF0bCzFd4STYoJhTWp5Hr1Nx8U5cxnAtFL/0xrm8NTzGO2qihWiNgDRT0l?=
 =?us-ascii?Q?Iftq/YK/UDmjOuXLNJR/EldKKiFmpjo4StbJpZpuC4tEngxjJwzPLFgsDVmb?=
 =?us-ascii?Q?oDbL70qTZArO3mR4ze5EcOZzUOBOAvy5W8h4VS2t4wIXirbLZ87Gz+BUIROx?=
 =?us-ascii?Q?DhKKt2eY8FjcyHfXzeseq46bQeaBrDfrmPXeKlRvuru/xPqCBwjqOvNXjiiQ?=
 =?us-ascii?Q?6g4MJ/Vq+6SQ6VE2+TB4j0PGSwufZz3fHm+AGR0L1UE3kP23MJBD6mvApEQI?=
 =?us-ascii?Q?9Z5/BgSkdB94gdq0cpVqml5DjX/qyxCkgPXAdXbWNwfsD/1eUkUEA3UOb3LJ?=
 =?us-ascii?Q?0B3qd0jBw0KLM//ymKX0YIDClOrJecY5/ho97kEsgHYTlnTa5B+SP5lQVZKf?=
 =?us-ascii?Q?xfFAs7QmIompPazIL30+mtYMEwyvinc3QxjETUFha3pZeYRau9NUp4ZyoyI/?=
 =?us-ascii?Q?HVNCqm+E+p6TThxmGFldoOpuHf4eoiESQluBMHMpF6CCTo6FoMSofjAJUk4b?=
 =?us-ascii?Q?Dw5GXO/WprvBYCmcxXU34FQ2z/er270IBHaz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kZiiWniwKk94wagkffiRdbFX7oxQ3SFMG/m8hMO8ttWOvylPROu7gte6Wc4o?=
 =?us-ascii?Q?I/vidxn8vC2SlYcAJZVpv5hrf2ZDzu/zVT6aPxzyWrFwi46IiAzdy4Q7sIYj?=
 =?us-ascii?Q?BRtGlEbaA68hnP1W8m0zFkl3DvxGJo7Bx94rOWeTSu7bC4XwOLD2FWLfFCia?=
 =?us-ascii?Q?zX6HPGw19sqIJmtPQSHczsQx1vEj/kGHasChbvCUGeizFsE3F3yuTVkHa2dK?=
 =?us-ascii?Q?eyKsKVo0oLb49z4XSoNVEv95QfVoTsrhgfyZr1H/xBgjcqnfQLQnehTEFg2d?=
 =?us-ascii?Q?h+tFekeSemZR4lLbevBRmUuQGPLLU3KqgyDn2/DXd2mZviuX0OyqkVaG/fY7?=
 =?us-ascii?Q?040M5e+2feU24JLQnq4z+eFE5HJIxvLoo2sPbWP20qXrfSwRm2g56jnBYZdJ?=
 =?us-ascii?Q?UhFQCcLGAI4xYQ/uda8CxLp3HbCZZoc/hT9KvwLx0zQNSoFrZup4tcFkHduU?=
 =?us-ascii?Q?dqSkyMm2Hbx/J4pP6T1zprtdSM38M/+Kq3b2TvGlEooZcmnR0k/LdDkDe2EE?=
 =?us-ascii?Q?324BfHd+KL78GHrwPmClHuzQLmuJ4FilEqnwUeumaTgsV2iZItDK8Cb1a9J+?=
 =?us-ascii?Q?UTN2VmarqT+4aH1TSEWq/qOogMUwexztBl8+OhU14xWyR8d+eD/Cjw6A10xQ?=
 =?us-ascii?Q?xlounKccWZhOWWzOjghSNgF2ymwYcboHy1rRzU9ubxXVF61VQhlec58MO3tC?=
 =?us-ascii?Q?rxr3GOfae9Ojkmm/eL8U/nKslgl6LsoY18/SSl4mbc12zPgPYxgXeOcgW3bx?=
 =?us-ascii?Q?q0+Ks8Q9HQVfNdtqAxR5JGgcgwnKKSwVAJpV8EOKLTORptpJd8GffCgrF90P?=
 =?us-ascii?Q?r8SGwf0mpoc+ZsdyBxSgaNm3noel7bs+gh+MJEpRke72hcbdCNQhHtli7yhE?=
 =?us-ascii?Q?/HzI7KsJEVSkQsP1NNVflgudV0KP0Jw4X2pDuzX/P6sELwm3wBDsgW6ZLzaa?=
 =?us-ascii?Q?kK7ooBnHcB4F/mMTXl6hjtoJbLfCUu+ba1ELD1O0qDM+0VoIPz0nYuUrRRnW?=
 =?us-ascii?Q?3brhBhVndDHKW/C6eKDtXShZPvxOfRoVrx8WLHMkOwGgXLBjytGCcfy8EA4P?=
 =?us-ascii?Q?hhqLHF4mgifpYf83+smXQV9/bqIZcIEY7bd5yUuekK3pux2M2OrmAdDo+LFF?=
 =?us-ascii?Q?8/PwJttwY+2NKmTMAG3D6K1HW405AP5lgLlvPFubEu2RcxmRA77AQ3W3rPSF?=
 =?us-ascii?Q?+P5yQO+4oa0+DdiAapnSP5qC18Kz7Kod4JGq5RT07TunD/RT8vBmqp+hWsn9?=
 =?us-ascii?Q?VNitzIv0CIwpYdgwvqOLJq2EiL7uFbw0EY7qDDoyywm7n3G714R5y+K1wRaQ?=
 =?us-ascii?Q?wzHWc45NXhQBOczyna7x7LolJWOUcEAQbO/w0IQhuvn1c3UtWDVNI7SybNFV?=
 =?us-ascii?Q?zGdcR+2W/hDCNbD1zUpEN4996TljNgC/jJup7tVcP4h573jTWcqu2f2uCwJQ?=
 =?us-ascii?Q?kER4twTNHxNSstciCqgoR14ucABLyYvBBU+8WbMwjLtXn0mOP8V6TmFPb+8K?=
 =?us-ascii?Q?X5UFm8YdHxVqBNkuHJN4rQdGnoB3lgVzJaePwMT/laqVgz3gbI1nLQWI9pzo?=
 =?us-ascii?Q?ItCnaZsKn/6Xqy7N+GK4WhBp+cmZJnJgB5NR0a/eoendpeiHhzs2pnJNFvSs?=
 =?us-ascii?Q?2W/jkWT4d2w5cftQftnfix0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9273dbdb-c8c5-4d2a-3d19-08de20b8fe9e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:45.2349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQW77AKy5XldTbUIZzed0STNpGbglMrpzQnU5N5tQhU6U0rRMzeS/U3L2ISYn0nY1ySNuiZ/7WptwTITpP7TWQdNlTcSgtqElz+e7yoEdGfj+qEvs2MGTyzKd0t7Px7W
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
 sound/soc/codecs/tas571x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index ca68651e5f756..19ccf8641e16a 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -322,6 +322,7 @@ static int tas571x_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
 	struct tas571x_private *priv = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -330,7 +331,7 @@ static int tas571x_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			if (!IS_ERR(priv->mclk)) {
 				ret = clk_prepare_enable(priv->mclk);
 				if (ret) {
-- 
2.43.0

