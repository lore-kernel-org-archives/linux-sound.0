Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A081E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820975; cv=fail; b=imowkX1VpVz0uQ03zhyy0oO8Cwk4ncTs2qb+fPpZhIIYnqAmUqO6HimeKhVIVPeWZd8v90eXryhMkC86aqKhbm4hpSroc78fBRj3otCk+ePpL2W7Nu+G1SdL76nOj2KsDC6iJ79UC5tMx2A284ErssR/dna04YS1zzQExMUNIF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820975; c=relaxed/simple;
	bh=+e9F8FvzWpZyivDcc1pRZwzCAjM0rTVu6OJEdjC7248=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sJqygxygEHwd/oljO0L5R4gHZ7FEWHM7F+R20fwnQ4EzhwB8V9f6+illFnaFg6CFTh8qKHBHgH7Qj0qdT985qm7JVHjwGp3MC0AIvpQH9kxaCaDlzmZiIbmNi0Q1p9EUGOrtsySk3rySUsHjhmGi4ukaJBfj+veBKg+Nru+0Y2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K3SHhbfR; arc=fail smtp.client-ip=40.107.74.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K3SHhbfR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcTRVAdjm0FRAcVPoq+NCi9z8ijn4XNCDqCZOm+wkbqqSjWnZKubS6x0cSoshXMtYsrozaSzkZQL0DeCwCRVsjRhGBAI/rfpLakcdiXJsazeq+4UNIeG2Y9d7S1T98EIch1F/M/zR85r2eUU9jHKc6/++SJiiErUw/L1TgB0jdiEX4nq8BT+FT8UkFSLu4wukku7kyNB0I2U/F1qoCLIEAkRq1nFhYrsAzE3MmBFrXcTFWoWV8zYOvksd4TrOm/ItM65vFKsl6OYIQVFIx3DMTCbhwJA3JHSbd0UWZoeAu+38FjHh5jk5TczecjNGg9R3vLFEqDtLecpIZrroJqpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGv5rZn/z/GxmNb55fqckwUN1OP28m5ho2YPSiIIafU=;
 b=wk2OO0LONnNQCcTg0d8J0ZCUhA69D3pNzjkgVP8ETzuNymaEX1o2+caOb0lssWiVBHXCeoUzsDtASh3mB+hrVQOHLoIAsEf6AvpzkhSvLZLWf4JEHwIFrmQzgjVTVixP9zBS4cYCLphWZBSOuO8shKQMcCuzzZUREv+claLsQUxEegq+MLHF88Mw2P3NHw45LSvNNhMP+P+Oqy3A4s69erVCsyaQ4+FV2yGHcnlOR9lFbqCp6kxOaC0aajEmQWuUuLHqqOgLce5b3mZjINVQd/p2Km3ix/cZD0iyMtCuiM0beaK6HWme08yXbSrHgVNln4p/0SuQnN+o8Ws3r33TEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGv5rZn/z/GxmNb55fqckwUN1OP28m5ho2YPSiIIafU=;
 b=K3SHhbfR144GNw6q25oJMJm7g8N63QcZpG8UEDhW8Jai/HrKQW/DqpuZpwPCzsWONU02K+pej40nNUaa9LN/YS5YQAtAxtvoJbWNqkN8Cz+oQtJK0xlle600yZejXSF0QY82H18AnPKHHtEYcRnQRrkvArw4IlXOhV5nJvDY7as=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:31 +0000
Message-ID: <87a50tza1g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 176/292] ASoC: codecs: wm8974: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:31 +0000
X-ClientProxiedBy: TY4P301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: d2f47b30-5ede-46b4-062b-08de20b961b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ay60ImEuEdFs0F1VLgy0C+wNJngk302AKtY+f7ieQKacUZOXbUHHwJrcsm5S?=
 =?us-ascii?Q?c0a51te6/l8b4jQreu+pWp1ZzR03W5VzKqL34PvLHL1fybaHnIKBWezJFMcL?=
 =?us-ascii?Q?b35HCpxgp9fADGppI7uAWMdQPP55is0xaXdgYJJqZjO0kkQeaXZLvkZjkGLk?=
 =?us-ascii?Q?gp6s+uJ2swqZzB1eHEDzShe+qLurNS61K3VDvA1FHNpfcG0RjhbhwUwfKfWw?=
 =?us-ascii?Q?FVZWh98ID1f4GTsQOuQzduK8GL1auiYRv0RdIPD0X5dwjbFs6EDbeUL9l69P?=
 =?us-ascii?Q?+vxj+UhT6us2Oxz+BtAwkX8GEOHoWV73YW35NnHhSc4aC+O43Fk3X1V2fGmm?=
 =?us-ascii?Q?a6zf8xq0ap0VN/yWclYRCUatFA2yEqUv8cJb0BN7TUgqvJD7YL45mcCWxqZO?=
 =?us-ascii?Q?CKv6PKpz+2ndrN+nf4xO4Vji45wylYvBuIgjbEc0ZlG88+XJ2jrCUy8bOLDk?=
 =?us-ascii?Q?qkJSZvyK/ny6Jh8GnL5OBQz2T5qqATweV/876xgmw5Og0TTzJ5YEIEeVDxRc?=
 =?us-ascii?Q?R3AoatXKLQuEo4pjjY8PkSWv9ezgCyUHUWR40NKwy2JqprnZYwxy7KItjxoe?=
 =?us-ascii?Q?9IRaB93bWCBQCFPzGP2wR9vCb6iRGispdTdOd0noKdskHTPyeoFafucW3Egc?=
 =?us-ascii?Q?E16ap6P0RtYlJKQZXiP1cRa/jJ+L7nPC+ATh1RQaDZ8XUOWEwHW6TjvJxARF?=
 =?us-ascii?Q?oJZTrsiQrJJpT0czpffpB9jLCO6hj5/kRMUVBfL0ZYP1KCKf6/Afkq0BkyiA?=
 =?us-ascii?Q?QNHszTZLdxuNTKqzRfw2ILnmO4uvlMGTkcSm5DLu5c+UsslfoD28najA2jyI?=
 =?us-ascii?Q?MWJa/yhqOIiAHyiH6hcvGfa4WWy7AIreMILExDPa2PdR2ViP4x8kmpktL1Wg?=
 =?us-ascii?Q?Hntsd+9hbv3aQ9aBz0m4aT4rElQAyRyN5FGlMWi6L6N8BbaCMbCWW5L0xX5G?=
 =?us-ascii?Q?kwrtnuKeb26NoJIb+W7Ths0I/iUtzkn6GgEhKKEkMF0piBVur+hI8Pm2Xhcn?=
 =?us-ascii?Q?Su0oVN8sQZclqgyg5WdwMszSC4i3zIfUI6vHc+48WTYLKGfoEyfVqb1iDKS4?=
 =?us-ascii?Q?wy9E+rgC9i84QAQMv9zBUC6bJOojkibTPGdN+b99uaFZI4jfCzHvXfRTa0j5?=
 =?us-ascii?Q?s4l6u+n1cXuMXywW6Q4UYk+Oj+DlLgcbk56vux+dPYqxpvPora3e+UiVXSkX?=
 =?us-ascii?Q?nfACOip7ANwqdEwEA3fF8yvFydJjMG8Y4vaj+lyg9x1rqPOR/eaiyjp2zXIl?=
 =?us-ascii?Q?EV8SkdlDT3hRcV9XqHTBGcOTofdjakFtF+PGzAyfw/+0eOCQuSYRpJIhTmSO?=
 =?us-ascii?Q?h/rKzXvosIYaJccJiTxuMuovpNLM+4E7ojLptdP6HLVG7MjM7Ion2T0u13to?=
 =?us-ascii?Q?uJTJoKDXTaWZWYGO7UumpLERPDOeZsGZZEDQnR4qgc460Zmlh9W62T6Z/coF?=
 =?us-ascii?Q?w302S+zl1DKCtYWalm+IkpkyDhp4nlMMQ6oK8p3RLivYJ4B4mXtLhgohPW7K?=
 =?us-ascii?Q?0eKrjqHuq5SIpejAUku0lUl+ZPNnkjQeEPWp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pgHffcSfJIdFcXJdVdBiRvzUoYFtfebLUXS7jnLgglhgPkMRki8hKhcpEn7Q?=
 =?us-ascii?Q?qC8tqoda8cAXipUb1l8lV/0aOvAaAbM5XCOOtNPFA96GxEeFcyLS46JJWPjT?=
 =?us-ascii?Q?VeuTvGp5/m3IQQcABlkOMJT0/kxwSGx1Vvc1ESBeM7N10y6A2deLM5TTCxmn?=
 =?us-ascii?Q?kQzvPwcg+Ogz/Pd+bqzU+MOgAtdExN+G+iJCpHuCfZWANdVeFEjEgjD6qsvE?=
 =?us-ascii?Q?jIcns+PI5WopAvh6KYjGJK6q5dizLI5Uuflcc0cg9SEw9qGJeU68Rpj97CwX?=
 =?us-ascii?Q?4GFDzqs7xASUpEXYxQGzF6x5wkYN25yI6bAI8egKA3nTSsAAzL9oC0+F9NK4?=
 =?us-ascii?Q?vg0YhDEKkAEwNT8dy0gNZj0vFfw5jl+fw0n7YTG34xbnbi5/1S/MXjZFAa3F?=
 =?us-ascii?Q?C221qP8znux6iUq7kI6On4H1hyPv4ca9JNfl5mAlDM0l2BiNKY0VUI5UqNxt?=
 =?us-ascii?Q?5A86iGJgZ1af6KXqr2w83yTAhjNvmUb0vqO3SpXIuM1nCTDBtBfnmiK6AVJ+?=
 =?us-ascii?Q?mUo5jzFswVcm0Pe01HAPxiUbmpzIjASVkpNDlVl/iSv8SRCSfdPV5kmNVUwi?=
 =?us-ascii?Q?USBAMR+yPli+mh4fYQx8oZbJTjdCPCWpDr0vkftxMGC1Q7hfiCgSq/gUm7Zy?=
 =?us-ascii?Q?LT146P0BRrshgr1vnwN4OUqwrJIBjuVdLzQnSGbslK1IWLEZoZRnmy1OzX9X?=
 =?us-ascii?Q?/SvCEi+BD34B2xf53oCTgBeJI6vZlViahoetMylcOqrzdGISW9Rvp50/XKX4?=
 =?us-ascii?Q?YuYP3GZe7w1+9ukxyCKfB3OMH/vFZsPAgwJpD189/zZ56kgsMxKs5hD0n4FJ?=
 =?us-ascii?Q?9a3YFoi/4KYBBRj9B67DYFJKHRPDD1uT6BxGjd+QqrrbJuhD/ikXD83Js/wT?=
 =?us-ascii?Q?mU5Nwf9mw2DhvwNcjlrwDrJzfLbLxsFAga2s0IrkS/rP2PdNjHvgKKR75OdQ?=
 =?us-ascii?Q?lovnUNpQ2QFzQ9Bu/Z6xJ/RryL9WZEwXv76r11A/dBtkNa7vfJaeCV4T3ToC?=
 =?us-ascii?Q?DBaquA/3y0AGcm5i6WI9LNde4QE9eHTIWSAZaaJAHaJSMCYNqLnwIyYyG90B?=
 =?us-ascii?Q?Jju3SGmjj9DIQuo8DaeD3n5xMZoFn4s3YGcbSu13RFzaa9jkgExbE7bOysRO?=
 =?us-ascii?Q?fHSmpapbo2AdUbvPrYg4dhDwEitDajY8jJGBUxAsLGqzBz1wrFUchVhKP9V3?=
 =?us-ascii?Q?rHioJGgB6P+Qcz711Io7l7v7Os71+Md2GFcaaiwtA9hUhvNM40AL5uT+2JGw?=
 =?us-ascii?Q?3DP9sb0K45QZRGLZKtSh+QiLWW8X5vtOFVWZ3eyAx3RewWHvMOuyjyyupLtx?=
 =?us-ascii?Q?6HlnaFxWBp4mB2AcmpDFg++R+3wcQXZRYa0NS1IzZ/5BIO5lHFQ/izQC2bqr?=
 =?us-ascii?Q?B7VB6e1e8vLL7oS+/ihSiBBfzHiRDhgSAOh0dHyjlW77z2yY6cD4pnteyoZ5?=
 =?us-ascii?Q?oO9q+WBevbWTrZg6s4dvfwC1f1Lgq70SRm2btfTAgSDWhFPSsQBTuX89hmWo?=
 =?us-ascii?Q?1m888RbAoosAGogjGpaFl8V0zmszyUkFfcXWRQC2MoryXEw5SmchotXKR40A?=
 =?us-ascii?Q?w+chhGpR3+Gw3utkEkUp+g0yXqT5/VqVx8dB2cl6rTIswSs2LyTZfj8XdM8i?=
 =?us-ascii?Q?gCLA61Q6oA3qF5Swus4pxnk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f47b30-5ede-46b4-062b-08de20b961b6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:31.4949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJP6e7VYWW7MMizCfnnzcwtS8gfo3Er7nc5+EFpLkojSMzt2to8Sg3+Q5UjwFip8x8fer9/nUyJZX3MbR1wx1opnCsC2zhISvrCB/IcQBajUeNvsra7uY/HNGn8+2QBw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8974.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index db16d893a2351..0bb5e947f46dc 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -583,6 +583,7 @@ static int wm8974_mute(struct snd_soc_dai *dai, int mute, int direction)
 static int wm8974_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 power1 = snd_soc_component_read(component, WM8974_POWER1) & ~0x3;
 
 	switch (level) {
@@ -595,7 +596,7 @@ static int wm8974_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_STANDBY:
 		power1 |= WM8974_POWER1_BIASEN | WM8974_POWER1_BUFIOEN;
 
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			regcache_sync(dev_get_regmap(component->dev, NULL));
 
 			/* Initial cap charge at VMID 5k */
-- 
2.43.0

