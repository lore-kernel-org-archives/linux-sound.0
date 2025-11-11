Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0DE1C84A2
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820797; cv=fail; b=Vi061LoC/wq0YL+2Am0CJ6QlppKvHybYd3qXuc3qeougFF2TXtqqaLJv6JPTup89arT9v+HSlzR8bR1M02qsAfCe4bwG2eD18DaR8f6JZ6BG6Lqkoh6ZIcJ5SXarx5p0Jen7MxZn6oVFJEjrzfZMaIFXkMBHzoWHtVQI1QBgzQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820797; c=relaxed/simple;
	bh=4HDKtcvaPQ7d5kIyJA4fJwMSb4JdfRoZXM5aaH4/NcA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JciMOmQXsrz7Tn1vdsYQlqzjnXuTeH4uSMDWTcdrT+/MycGEZMS8febgKMI1tnAj5y5hUvnI6FnLkC/NZtdFWZDmok8gOrSEwZaVtpwldKbII7EJclLOXy25bXhM7+vqcVygunNJ509vJuChjKt1SJzMpEd7MyPlBDv7D76Cmb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GGrFFqa2; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GGrFFqa2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6VKbHJQk88PrYkLjfX3TazRqfLKD+CtYvL7cxuiTQR1D589C3GXAwd9ILZGf+kbIPGmn4QJ9WOm0LjP7xUwRZAbIvrkudrjlz0sahcxE4nbvoOfe6DatI+buaUowfeko+l3FDeejR1sp2lP8Fpj98Z2h8nFkxAwx5kABQG6+EMO23LSSIBrlOFs8rkBysI0xQvDmJekpunrV+nRjXPyJXOylZh56HuCghapNvpMz9qjod8xqSKR2B9yAweCiGF7SJLSjHMscTPFlTEDw5TYzlc2qyw7YVssTXRGoYeIH+274mz9AFyfUisF1QK1YfUVPLW3B/ixPXmyZqBhxWxQCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LArPYFpZBBlJH3tNtBHFxBzzpB7xrqaEL9h1CGVpEsM=;
 b=PpfXWWGWbpm285QscHs+4nGxjOy18/AWUljhJbJ1/W++gfVzxiLfbOcP/CHXtjvRZaHbVDDjw/+OtLWM8FBKWylEEFUPhkI0iWENPS6dvbTdFfHfpOMSTctcSG0YaVP3ZmZTw9OZFS7nB8lA7tkrcC6xrM3XK78w8ISHW05oUiP/josKqm6pNjwOjyJNa3q3zoGicEAZ1Jjfl9q7xugOdEUZjhvb8tmfwnKBQFOTQUITcq1Py9KPqrJposBBqwBYD3JswnS1lbPEOxxbntzW7b4zZVkSls9zJIYFx5FjqCf/5mPgHj+Hcd67bn4jmYRfgWw7gpENI6MZ0auu5Ze7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LArPYFpZBBlJH3tNtBHFxBzzpB7xrqaEL9h1CGVpEsM=;
 b=GGrFFqa2AVdrvDcrbLnYRGxvdSM2NcN7cARMkWN+PHaos2zSj8nCbJRSthDlCl5p7BWr/9AEjNMZuA4LDJ8K7zzTiWi1x+doIig61O6ouLbdPpia3VwiNVkD/5tQ6f4YmtfeHH3d4XQiC/U2EArB+MHJuaeLJGBHUjl4HKgtbbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:34 +0000
Message-ID: <87zf8t1kjp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 133/292] ASoC: codecs: sta32x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:34 +0000
X-ClientProxiedBy: TY4P301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fad10d6-9ea4-46df-a896-08de20b8f855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e5JDuCiqHM4YNneVW3K+D8FFPhyFVysse0sdQUiZQOFYfzxlsA3xWqs3aAD8?=
 =?us-ascii?Q?XmnqIVfwMvj5eYyKGjzDTeU4YCvQWUNeWrf0oQuXeGJFaEKPgk6Q+0wZb3uu?=
 =?us-ascii?Q?roctichJCWDLsOMOd5yQPKQVgQ/tMakGjlR9/YIECxP24/Aua5/YP2NZeZov?=
 =?us-ascii?Q?+s1+jSRVAzoUuHxa8bjivLM85dXyq0SBma0bfzk1iwjfucwgyc+PbNOJso7g?=
 =?us-ascii?Q?781Ei3BJ15A2HCvJeICd6FXFeZtogBP0GPh8t7IcmGq9KVh3goAp2anNYjU5?=
 =?us-ascii?Q?2lqlGZ4PSzgoLzuo6zb4esnul0Pc6idqpJB+V40wuDg1DUZtYcC8sNF2lyNC?=
 =?us-ascii?Q?66Guo4pyLDm/2Yb06Q1Z72pXOUIFCLjv07DhanJJKsLrb3LTFfB/F9LfkpG7?=
 =?us-ascii?Q?JPd4wmMzxNiAn6nHx8lMpoK9cMKjVTGiOlbjCKqUN3iN5sgAzuoqLkolIRcq?=
 =?us-ascii?Q?hDFpAG+YjtdRE8cTMJZ24WhZ2z6faFTt9BfUw0+JSLivKPzPlHpZ2aJx52WQ?=
 =?us-ascii?Q?Hpwprnn+o0CfCsQcPjQL0yqKcX9yHBmZp06UP1FKbP9MqqZkshzQAVohRc0b?=
 =?us-ascii?Q?fzoX8avCR0GmlxYpz4HhMbshddvjeYt/GnJhbxmxQaLrDgwWFlcuiYO91U0H?=
 =?us-ascii?Q?h8H6YnTiLoBK4zuUYiA10Mc0NKq04OwrDYwNetDxg0LRQE0OTXRc/xTiaex7?=
 =?us-ascii?Q?k2ZVZYFaKzrPjvkfJ4c4aK7hMqC/P64AS1CpqEnQEoRxEWXnBZ2u6qgFocFg?=
 =?us-ascii?Q?oUKR0DQSJMcPW0KM11NXJU6v15oQw+tt2NIfpefriAg/Cy83K7Oz5OTo10WH?=
 =?us-ascii?Q?DWuHMl9zGs9KlTyQ7aP1JfNXlB+7jr+mvVtCXwn5s3vBxJkLdtuKqRUzV+qI?=
 =?us-ascii?Q?CPDK09B4CD3HTAw3Qw1ClE4iHoG5uVInFvs6GMasnWpvFYj3Mr30qHln7ReF?=
 =?us-ascii?Q?R+C36Z4QmUG7lbB6UIGPH6qtzEByM6G7fY8GJb8IbAcfiD9qSqSEKYgHBR3k?=
 =?us-ascii?Q?Y4ixXK8bWBjUTcjnVGUqV0Np7Nof2jvwFrzc0ccE4jkpNBU7qRS1gW/w0pLE?=
 =?us-ascii?Q?HXQWgPrjUV5GTs9fMJBIRd+Z3V44dxIjF2laiSQPE7ghpcHhDwB1jb0aMHcU?=
 =?us-ascii?Q?/Ns2/Vk0p/duDW/iSyEQ64uqePr9JVpJfBvWaibyz0yAn3NwA+JsBPTqpiyM?=
 =?us-ascii?Q?JWTCiR2mWC03Bds8J3p6xeFY3qElzkJMGEMuyaV0c+Obu3VzdZlxBoFM8q3W?=
 =?us-ascii?Q?XAzmMaWrdguiXAeYh5hwt06vyn+zzFd4nuEloE+rRiRg3MTb+COEEHQR2IuO?=
 =?us-ascii?Q?VnGRw+FhtJJlsU9sV+uoZ6U1K1i7p20TzGU9wzINX4nTNh/Op4J+HIPntC9k?=
 =?us-ascii?Q?VJrW7TlajX/naXeimeMIV5rY7tYGCs8nY7U4XBrbJJz8v0tKDOQ/AMHpU/H/?=
 =?us-ascii?Q?gScz1UPwfijO0bDkI6wGHdP9OQPj8zCYGFS65viJQENKb+8MYTyB7hcbCHnl?=
 =?us-ascii?Q?ud7AOejfa8jlKgecCwyu/G+eJxArZ0N66+4F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mKX3+Wm+zUXfkrs44WiG7VenNhBOsOc09aj670/O2pX8k/jT0NEv0N/0Qcn1?=
 =?us-ascii?Q?Hp71qOyd9y2cVEphxX3g4c4WizqoD5zJHS1LrzPlwaKIuRggik2Qx9k7IG55?=
 =?us-ascii?Q?YnqHeTJbybf70Ef2DSLG0ZOGb4HoNQ82t6NqNL1UE11Yo2kszb/Cf3s3jkp2?=
 =?us-ascii?Q?mFoaJpovwYcAhVZeQYlOjL/0CCrpQGQ0VM2x/VIvaU7nVlPhZC9qXDeF3EHi?=
 =?us-ascii?Q?JoeXVxjhGOItpr/31EADI/qCtEUu1SROzx+euZ9NUEvpcnBWgbQYH4isAJ3S?=
 =?us-ascii?Q?E/FuWyERRYVbgxsfjw+VU3ND1lcfRd2z0kbGdN07Qs43apVWBqtxaBHjT8bs?=
 =?us-ascii?Q?qn5gk1k/10Xbq9tVSiW1voMsZlXaiqkRVXUIrSE2wvnC+09oJeDo9/hi9OzF?=
 =?us-ascii?Q?LC5SKGaP00SeejQPYfj94MxRi8Rvn1gJtdopMztgnh8aEg9uAcJehNyXaYlE?=
 =?us-ascii?Q?XQMkk0ZEihLyf5VkF+ipgrUagiMrRM7dN0Gh9iJXJ1ddBxgKHe+nhB36DuUt?=
 =?us-ascii?Q?0oPKuJ97VZXZsCialBd6eMOA3EwJe97BsJPytGAksgslE0miuczGwn1+hjTM?=
 =?us-ascii?Q?P/a/hLyAWfoxSkeSZArxLaGXlajafXCeB7uKdM9DUxijsqRgsesN3dBdMfti?=
 =?us-ascii?Q?Q8U1qGUyhA6aR+AalB65PF1U/PkDU03hrUTQKVmcgFQOfDjdh6V9OVAaP/i5?=
 =?us-ascii?Q?zi16g+b1919XwhgYCIDJLy7Cjn/v89H1mK3wvb1wwFLsj5W6pt5NWU1E/fSl?=
 =?us-ascii?Q?XremqbhC74b4LMpzLQSrJ0lbAnPZKrKD4QTi+euIWKp5npGPqZTigeuL07hn?=
 =?us-ascii?Q?kTYSWJCZ9sOOYFD/O1yRicbmYYm50uMi/3rfsgH6Vx+C8JfbfroJPUsNUpQH?=
 =?us-ascii?Q?rY59SBKG0Oq9pMvNhXRPqMJrMZvg7vmCWpq+iOnNIWvsf0WlrUHnqStF/fvS?=
 =?us-ascii?Q?7F2hYv5G3qkxfHbxbabcq++y1o5RsM53GUCkkEiaPRaync0yxebZe/y4saf/?=
 =?us-ascii?Q?62m+mzan/0SVp0ZMm25GWfeZqA4xbhSTwHsg69TS2YXBLod/i98Wqf8f8FFz?=
 =?us-ascii?Q?5FQphlOTKjBli2gf50QbJBi3mHXT2QjDQGnm031DHMg5aHjU3A7bH6+ckFUW?=
 =?us-ascii?Q?DZOt6t0H6vhtR4hcYIj/4tBYYtt2cIxq5WxS7nmjrj2IE7NMMHrhRlXUQyMP?=
 =?us-ascii?Q?sFwVCjPeqxcpsQ5R6jX/l1fDNi0unDDfR93Zip1UcAk2Y7i4tDNjUBTfB1lE?=
 =?us-ascii?Q?Z2IQb6SVeRYabCrBapXxb+v83X/QBXAtliNcRu1Iib4Axra7T9vgMNOfpjRm?=
 =?us-ascii?Q?o0bod1bMqFm7LmbfOZBt5SvFhIl1D0FJPrTsIZrcL8574aB+lb/IGOnN2VdA?=
 =?us-ascii?Q?YGMYqDF4c2euIWvP7Rm8IdGaz/UU/Mu+xYpvCFyo5j7JLigZB3jsKOD5FvLn?=
 =?us-ascii?Q?LTiH8WI9+MZwdsieMwyWwEnFbbwF/+AzxS6IpKDQKDvZ/UmDiSWzEWbz4CRg?=
 =?us-ascii?Q?+gH/qsbkGACXNg37A99CrPr4rG06TYmL4ehH8iK4b/ltNtlAY2MxpJYPPgFO?=
 =?us-ascii?Q?1BpPPOacuL8BWpgVahn2CeI0h6lrY/Eo3Q3tpj8Gb5uuMrAcpxRRhMPipKg9?=
 =?us-ascii?Q?ZslJrIYzyFodGzdRYe4hr7k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fad10d6-9ea4-46df-a896-08de20b8f855
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:34.6424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKgbK3PgaX02j2Er5aeOP+ZCHu+NyTTCLl1PtkzCb7w1O4mvH5si4aVTyQQYBACWhSfei2tiN/ViUNAQpu/xMH2f9ZAVU8x2w8D5OJF5SIEi7KZchPYE1wTX0i/2GqpO
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
 sound/soc/codecs/sta32x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 97f55e556fa39..b9f9784f51643 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -799,6 +799,7 @@ static int sta32x_set_bias_level(struct snd_soc_component *component,
 {
 	int ret;
 	struct sta32x_priv *sta32x = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	dev_dbg(component->dev, "level = %d\n", level);
 	switch (level) {
@@ -813,7 +814,7 @@ static int sta32x_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(sta32x->supplies),
 						    sta32x->supplies);
 			if (ret != 0) {
@@ -870,6 +871,7 @@ static struct snd_soc_dai_driver sta32x_dai = {
 
 static int sta32x_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct sta32x_priv *sta32x = snd_soc_component_get_drvdata(component);
 	struct sta32x_platform_data *pdata = sta32x->pdata;
 	int i, ret = 0, thermal = 0;
@@ -974,7 +976,7 @@ static int sta32x_probe(struct snd_soc_component *component)
 	if (sta32x->pdata->needs_esd_watchdog)
 		INIT_DELAYED_WORK(&sta32x->watchdog_work, sta32x_watchdog);
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 	/* Bias level configuration will have done an extra enable */
 	regulator_bulk_disable(ARRAY_SIZE(sta32x->supplies), sta32x->supplies);
 
-- 
2.43.0

