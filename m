Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCC9145A05
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820426; cv=fail; b=MlVnfmF6jtKnXAJJ4zfFBlJCytDRi7Vc8W/tRUKsjHMOf+xXDFn4WY1sikp+xWTphFV4NEQX6KL/Z+BlRSkAdISiSpPHaP7s8UKHTtRuwDVSddqDhiJNTL1R3uGXyc3JjU8qkdiTvALeVAPUoqcu33CIsZbttTs15GDN82Wn4m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820426; c=relaxed/simple;
	bh=zZ9RAQh2/7E4F0toEPF24Hi8wThsEMy3hcSUvJufTtc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=u7RWr0AMlp6TMjCKhMsWxw4kBhc15N2vgaCcAUBZmlAWO677i/PL5gR2/QdQg77JNgfMj+c0u1DBnUFb8V1OTyGVlS5FwG3iYpJ6T+qM2t2RXITd9ooqQmdp5Lso7MtqK99v0PTWfltoWjckES1iq7elG9YYPlXtqZbwx0fUNn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eUC3VXOE; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eUC3VXOE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7LFgSrIFcK9molCpWq3uGJ723mVVt8dv9CqEbJ1dtwymRrhM9nakXDSkO2zW6Te25CL3BSwoFKiImTdqsspnGNjLR/xpQI45CbinnPSMkKrtj/W7u8d3Wt/wZJvi/y+QeWtADQyX4mLp4yXEL/bXFWatxLeqqRJO4TxgKncvRQyB3zYNvf6gNU403aQf/kYo5zTOlDFJQH09MA2KtdIxbfsPAID33Nxaj25KKAAMRIVaXSemvPGV0N4xXtqcXYTsizN4lFE8Kqo4MQpDfZYWIZHlV6mET1PEunOsOJVr3tLyZbSscYIL5Si+IKBHDzS50WgF9r4PhUdbyD151QslA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUAvm2BOjDnzuxhluqA6SWttBiFsEpKnzK/0dpCQjlU=;
 b=LT4F90Khp/cZ37AMWlAdQyeyQW7aMaKfcoSkZuTW8jtV6ewn+9+sxxYJtd3zuniMS39aWvlVZFvbN4pVACVnujeIzFO6+aaKyiaWGHz+f+JkU9uotxMWeCHoeQdNfQzOJ18AMYbW2kH/KLk1UBqKO9BQ/mVmds7nwwszrlaLSQa2eCbbWRGpUVpabUCjwdNuRJnd25rbJLoGWY88ccnA2VpMl9WrPWcQySFLEFNdaoz7NznSjO2i8fFn8DX+sESozR645htDUSHf63eJO5Dn62fpI4PwX1imIaYtrANwKaq99DFrXlHbNw8k+gEq6NSBxMoVU3FJFXpfI2wL7P7Iug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUAvm2BOjDnzuxhluqA6SWttBiFsEpKnzK/0dpCQjlU=;
 b=eUC3VXOE4q8vAJzvxppczX5fFxo3KBTaA89ypODDP+3n6ESiLtBRt7KIINRVvNHUxIn5p1RuJCpQZh9fregNaoUkqDimH1DGa/xBX3k9/izO8B88VO/SIZF5NI7CU0HJu1R6aDtfa0ElEASabDCDRh7Ae2ZrVI3ctLpcHlty1cU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:22 +0000
Message-ID: <871pm58loa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 032/292] ASoC: codecs: cs35l41: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:21 +0000
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: b857a8c6-f2ee-4208-0683-08de20b81a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?inL36aQv/kwhyMOkCucxMp9pd2oriNnYlm2Wbz8nWMlVNUXXvyflyps2Vi/N?=
 =?us-ascii?Q?sHxtpWL69jFHZaTVGSx/MZcwUncEdks4E246vUu2CZSkQ7Pn+TvyDNJalnvd?=
 =?us-ascii?Q?erOR0n2iLHqpPxdnkRVdWBKxwbd2F8Vg+Qt/qWxWNeQbdKDHkm4uzjpGnsvG?=
 =?us-ascii?Q?vOZAMFB0o1MziJKwJTprnR8Id77KQHz3qY2fP4y87R6fasLqAnXPjBSl0xe0?=
 =?us-ascii?Q?KYPCUeqbLLn3nicmkPUPDtFL2z0Maj1+w+DBXZzCANrj8Az3eMJndRIJsTye?=
 =?us-ascii?Q?StP2Q621c0oqlR+QsYSWd7LT3RC5uKoMmZJhew8AA7Mi8TmLNX0Ptf+k74jN?=
 =?us-ascii?Q?uD6JY83GBAJenQ34EdCW668C9l7qbR4u0SYsxLDwTrs3TP6tRFgzBP+zULTt?=
 =?us-ascii?Q?RY481SadTDnbWcG4o1DOWdTJV8ahfzAvK6mjfcOxzSqzMG9KQ7T3wgY3dkgf?=
 =?us-ascii?Q?Uyst8kMoZtL4hKTsez4ywD527gYDGe80ZYsYuv78MJBmYMBceKzpnBiTGCCn?=
 =?us-ascii?Q?PV53gnJYIhwTT5pWcHmIXkaY4g2rOWsgpA2jfXtZBZv+3DBljU84B0FD0nfH?=
 =?us-ascii?Q?AB2negCzwhsuYeMwe2HXeGgX8qPnJZdjoC/Y4ISR1/fjYGPxmmFMFHRlexTV?=
 =?us-ascii?Q?a1YYhI6mFM6aUj5Y2y+nUWFpBlxqnXU5UwqVFvgwop7At7f0gHo0G0YfeEWp?=
 =?us-ascii?Q?8/Ddtc1UvGusy8V/5qRb9Z7DPhaVTgRagyrFvD5eVZi+1MCtmoeS5qD4tpE7?=
 =?us-ascii?Q?5g4hA+svbP+ydGrrFKv2uxifLKSIY8d+TA6gk6MRea+A/+vaI5VgomuQRKZq?=
 =?us-ascii?Q?hbCYFxXbjvRsAbCkJs8VlSEQTdYnOe8+ZKTp20eqbx2GajMfYT9B/JlRkGN6?=
 =?us-ascii?Q?I4cTaI/gUbPIkbvNew8tcf4fb70qrkd0PCuGh+NCd3huAflnK5Aa9sM4nx+G?=
 =?us-ascii?Q?O7N4oYwr97OGMgctate02+QxLx8D3qEANa4FA+UBWq+QyDTigUQs3xrrh1rq?=
 =?us-ascii?Q?hDtVyw8Yn1AsPEA1AOCpb1qmCtYg4xyQi4OiKbwilfSJShLWqJUZuxjGYFmZ?=
 =?us-ascii?Q?SU2bxq1vaKdQTg2aQ9VrnIRxx1OpKVKSXPyR4OYCVdJ7J48PyxSFMlnKME9d?=
 =?us-ascii?Q?GNJBwNrFobSJRQ6hyyKLZf9+0xlPorvekyz//xhkJWIoNNFCBovDXU5HBfDJ?=
 =?us-ascii?Q?4bsn4P/TLrI2Xiq3+Q6YaKruD+Hpl7SaEGmppeaNtjWH1SxVYkFpzTxXkz0s?=
 =?us-ascii?Q?CpVg6UqvMDBr71B6qPoKbbF4ERdic55MvoUZ9SPbDcmrOPVQMx5a4TdhUXfX?=
 =?us-ascii?Q?rKjFp/MtPH8AXB0bGXqbszlRK00e41DFFHTZ8UzQQljEJgcrhKXlzMTzhBkR?=
 =?us-ascii?Q?PUuVL2VsWXI6r254pX89pdLwoVdMEYDrRawV/P33VCMDP1g4cSg0hvsma2CW?=
 =?us-ascii?Q?OwqovGgneniOh3tcXNqWwt46HyfMcnpSL3fI7e47fPm5EYrkvX5kumWPQp3M?=
 =?us-ascii?Q?TLQlMT4Qmhw/5SEBuixydf53TiVx3RQjaI32?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TTCiu+Cd8OhjZ7+FYoF8PedmD0UJIQqrB3GaAvu3MWqb7gcW7KoXJq2TqnJT?=
 =?us-ascii?Q?Hk+rOr02sqqGmzk2OikPpCG/W4dDV4jR2Tk1ZFzpKSAHzZqmwbNZ8sO7dbCp?=
 =?us-ascii?Q?E0ayMWw5wWyvkl9TeoxqX7QAEtBuuC/156VXeA6AGyJG2pENijwBmUXTPgcF?=
 =?us-ascii?Q?jiZwejqUlg2nRKpK8yoXd4b+OEy/JjB9w6KGy4kjgg6trHs9Mhkc4TD2iu3R?=
 =?us-ascii?Q?O6QL4n7Quf3kVfMyaaafFoNBfZyScpQaup79WQHcRc8pbptZjQxZQpeD2Y2Z?=
 =?us-ascii?Q?GAsrDrJaEu95vyrE7mVsgoUzZqo23nASD9jyvLcG5mP+9OYLYoA/spGi16Sj?=
 =?us-ascii?Q?wjtBbshk+u0L3Fb24ihRc5Zs61RA0hLPCmYkKrDAB2bfbwox8vuG2CF6l8Ac?=
 =?us-ascii?Q?kIF0UN0BU6dG8WQlxbLwhYlupBDbNbv1Ra6JidnCgHdLUXc68X2t3IRuv1tM?=
 =?us-ascii?Q?PWGHwc3hM2D9dBwQUryJNQFTh2P/fAzIfczmRal5D+80btHK1ebu0zcRCRvO?=
 =?us-ascii?Q?88qUlU4qQjrQRaBhKHObO5+lqsnR5qtxiShy8x48rMI731B05CXeCviIBAPK?=
 =?us-ascii?Q?zF8LgUYgTn7dJNB1PJp2ifFMDtz+zwLNSe2rwRkOMhwVIcfd+vp3XjzyL/jE?=
 =?us-ascii?Q?NCuyPRWBxDyGFfJ78xMMc4yZtTGZ2EhojvUtc0XRydTzy23yIR06rR1gusxx?=
 =?us-ascii?Q?F7gUQkqQE+rhSa3pvcSDpjUWSSGFc9b3/zQojitqqoJG0DKuKJQoM2za25Wa?=
 =?us-ascii?Q?GRH7tth9u9KWrObMUEh6/TQnADFXIQXTydJAEl/koW8E2+Gtq+RnXVve0uWA?=
 =?us-ascii?Q?b8P+Rb/qKmytn6fxPUBnu0OfRYZ9/54StKkbKpkG4IP7or/KSxDjb7DyoLya?=
 =?us-ascii?Q?QMxLuElUkLo7al/zjnmrHJPvmjkrwXMYKYOMpg/IPBe2HTyEtWRiuRAgSrL3?=
 =?us-ascii?Q?gQ1XqBsEJ0wqTOPg8On4XNmxAf0CJgo4jouAEWunzWOD5dBBuDtjN6qFkleS?=
 =?us-ascii?Q?Yin2pI8KLor3VmAUqL+8Dk0Fsq2Uy4sOhntrkVlgqDpn8tlZDuoLVwIl3P7e?=
 =?us-ascii?Q?d9IVaq6/pdP9vZhBC8RgO+v/DZiJTL3wGJLHHm5IxlvxfFU9K9m+ruQ8GCW2?=
 =?us-ascii?Q?JUXUul7S3FhFfk07dSUqvcvMDQq9l+908Y90hN9sbg7XmpfLXNsKFYotJe01?=
 =?us-ascii?Q?5Jt6d9F/UbnT8YLDNhYKQWTOAqfhVcAX+vBUOaOKAuGwfT9HumscMkr3SsUC?=
 =?us-ascii?Q?KP4opOb11TmBW8eArfWnFE1gBOaEbcNZPTnhNkl8gwt/RElEW2V8R6VGyJEt?=
 =?us-ascii?Q?vXSjG+lO+A2kTbOna+8hHS5KKZJiF6LJMJS3HNCdDMZ3KFGl9dnCfd4wcrhy?=
 =?us-ascii?Q?DUVsdn+cGeA+qsHAYZlL7ffq/YvgNFD0y51GMJwNeEOvo2qGyKlHyPEzHwLn?=
 =?us-ascii?Q?ZcUJk86hwYpsVqWc6vIjrNM/BAfXxSHLtxVadLXmoNu7T37CoooXa2bo4fzP?=
 =?us-ascii?Q?vLr6u5jnfumqz8kNmhl9K3oSCEUBK2CtDlJqSucylyaC9WA+JzYxyTCiPPz7?=
 =?us-ascii?Q?NB4W/W3dJQQHPOcC6mMNu5iUTIscii5hmvkGIcTLkhOLytECwp/2dRzJOm5K?=
 =?us-ascii?Q?RHTspAiGMKtrQMFg8Q4crH0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b857a8c6-f2ee-4208-0683-08de20b81a36
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:21.9934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FG3zrSRlE6sDDIcYHrWWaOdUe0RhMH6fCiVmgaWFQmxaZSaaz9ricuFqDYdVg4UJe6vTiIW433PrluZ0XMC5KIx5bD6rUK2S98kGuH3OFHOsYmlvvpErEg0JfhVbYnHd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

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
 sound/soc/codecs/cs35l41.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 173d7c59b7254..3a8a8dd065b77 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -928,7 +928,7 @@ static const struct snd_soc_dapm_widget cs35l41_ext_bst_widget[] = {
 static int cs35l41_component_probe(struct snd_soc_component *component)
 {
 	struct cs35l41_private *cs35l41 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST) {
-- 
2.43.0

