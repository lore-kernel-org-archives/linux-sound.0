Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE6578F20
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820307; cv=fail; b=Oh/+StWY8SC9UMXl55QOUZLUibcKfNyQmr75FwiC0qBduanNl4l9RxLDhtwmEHZvGhvJ2fO8MjazpeIfXXKNuzTTq6IpgJ9NN1B1q67sWYqTtZ+eMuRyELUxVsnIPaCppnqTmTn8C3pVVvspKyHcyaetrLnPQNAEeWyCtDY48fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820307; c=relaxed/simple;
	bh=zMRyYH/5YdqyWlNwXAG3jP064HETp8eYMwCe+IAzjTE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mSddkmwuoy6lnM3ly95+xpZBQ1XjcgpRSPCregZn2ITMcPSP4NIE0lUuXrWI5BA6lxl72ZHW6AiuyDbMzWy3n516WZrqfUrSPfJJuLmCGjDJrAgV90y2V5vTl37WXMNcbs72Jig9MxjOUZ3TUs1bu3uk78HxPwWew3UmeeacvzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nxWSl+5j; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nxWSl+5j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brt51hN0SHNv9MB020m0rOxJV1aKdR73QUHrXuFawwVjU1wbJiET+EDf5JqTzq+8YjyxwOwIgJFg3fu+wu6XLAx0o5UnECFbvCzYIVF5Z+UpLso/pJ7YqBpcZ7K2eGQoDsDAJ6ygz74Dii2WikZy0F0dA3qIWykqvsat96TygqWaI6i2Jji0y6Acfiwbw245XnuzFVWAX2ScRwAX6cJQ2OO2Pex9mj995mOlx80ovrSAip0qNjsv5nCdWKCi1HP9JW8sUJ2aV3mjm3JVq7/vaNnsWjBizsG6AtXJz/QIQbCsdPd7/plZClSP27XFLJwUgeDib0/GulZZbtc6cbNdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+SDWZA1AHa7XhuvkYsMirXlXz/N7xPTVy6SD0OsEeI=;
 b=uN0xly3BEthcGF1QkbikM7Sos/AuRxWFXgUjFrMHEbWMzP9ubM3nNpmVJNQBYT04u59CJWbk6NyLdOQs9Et1DlsDV23SKygsT3zqCspTmYStpCBNxBb5eIB4ZnRpYREWlmb0h0ddjN6nqQVRW/zqINQzq6zVc4nU4kscQaB7WhQJTtG+5pzDv4Gu5R/PVgHinZbJ06X3irRLKNJyLIah3mV+vwUwTp4zsCW9Vq09+Ea7v41P+oGM7g1ynEzyYoLaA7Tcq4MlO13rBfSPL7gqtOMGse0Le38QXr4YRCwXA1TMuL0bQKiZhtqfvNH3tlG/g7GfN/7wa1Ir9nj1RZGuew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+SDWZA1AHa7XhuvkYsMirXlXz/N7xPTVy6SD0OsEeI=;
 b=nxWSl+5jNUk9EGxSb0mLM3FxsSuwIzRSn8qFxIOgSEXTcCW8JrUprYJI6zyLLch+Rx9w9ahFjxl36fYeCvEPoiaFMsJMHiBei2CRLfZu2Jhy6fvN0W4Xs9iyRvaq+dh4WgXzbUaraARohbMBJOO9vho0dv3OHXAxlhskl1RC5GI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:24 +0000
Message-ID: <87pl9p8lrk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 016/292] ASoC: codecs: ad193x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:24 +0000
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b83be98-2edb-4dab-daa2-08de20b7d3fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s0a2iFTNVcrz4B5YqAxLYNgxB5URxxS7B8mqffYJr2oqO5O21bE9QSsEUDn3?=
 =?us-ascii?Q?GMrK1sHBP3y8KJIH3Fcswg+3Tc+ApfQJyhkccW6MUzhkC8P6OmdVtEYlnGTh?=
 =?us-ascii?Q?3w1QtZk1s1wDHgh7EDxEa7wxEhouMyMYEetCcw6JgnGDAb/ajdQ5tLetYfmt?=
 =?us-ascii?Q?xfn430iFlk+xYfe/pCLFij8ccUAafjWsvsu5RkhAv20ad48KxYJm5gRbagz+?=
 =?us-ascii?Q?J7KNUiLHPv20CwQs6i0ayTQRm3GOSjeFABInAtP3w3q6FG4IqZnNqQPgRZWk?=
 =?us-ascii?Q?gcj4WjtWXukxkT3DaYzWDzlMnUAhqRqAno0lCZp/xa4LYPnbc5PajTgo4Mck?=
 =?us-ascii?Q?yL9RgVOk2K72PctnyF+zyxyR87F0065rjqTgbR0VEX6o4vday6Bu9c9eEDgW?=
 =?us-ascii?Q?ljATJk0Ghgg2WvD1wwFB6jiNDtXO7e/zYokmEG6Y5gGFefCSKeBFBjYAJf37?=
 =?us-ascii?Q?hPtsmLaq1Kg6vsQFUTrdI2VcyePoM/Ydh1DzsZvY+ra2kLwcaXw0gO6vYnmJ?=
 =?us-ascii?Q?aXeHrc8V0gLi6J5kbf/pt94hNfm85dlf4fmJCq/Ttx3pc3XHgw4B5fI4gSHr?=
 =?us-ascii?Q?XCD+PnoDq05Hg/QVBUyLG0x7fZXH0ZZtPGEMyfcKViZnURbqD0qPaBL9+ogO?=
 =?us-ascii?Q?QTrAbFfjZKSXE4yuwPNWQAtPcLG5wnbrVhcMDfFDNX3Oysw9cuR66ovEiT2y?=
 =?us-ascii?Q?LRy6jEwq4oP+8mTJ1X9o0y4CTl14eFgD3sBxQ+mY4Do/pa+EymygQufSvk04?=
 =?us-ascii?Q?UsvnP7f1sVTaGzz86rhkja7puXkpA+T9iG063DisT3TZ5k4nlOUS15rRMZxg?=
 =?us-ascii?Q?r4PfcEfHm5S8ddH/PhV3nTiXynZ27buFC6AUwggFwBYsuyTghJvzop3v6mix?=
 =?us-ascii?Q?C4/x4sOPNmegsxLTxosCqlpOz6BXG5TaMbaa56dNNqNGAdmcerFaulJE/pYB?=
 =?us-ascii?Q?YUiq7Av49bGe8dH1joCJxn4vNRYqPsgaL19K+2IKJSrZhnQhoKePhYuy1bBm?=
 =?us-ascii?Q?2atyZY0ac7fc3O+Jbp1Vgf7+a85JNZH7WfegDnG8k/MwdOn271d04nKmHpqL?=
 =?us-ascii?Q?V//J7Uae44zpR9Ae1oWz1PM9B5w5XXtcM4cJbW/HhwzXk9CxTcxoiA1biEwl?=
 =?us-ascii?Q?dUZzvKAPRYB7xlZMQB3Af5bqL4wmmjoIchh6+X8EmE0kK9j2yRHKWilPq/p/?=
 =?us-ascii?Q?rXHrULHmQbb+0Ez8GYvXGlwGKwBM0XlcoKSGavxH+9XukoGBd1akTzyn23ci?=
 =?us-ascii?Q?7Tn3Iw0/T1tHFDDPIoIiwD6ukDva299dinEjcFSCVbG6O7+q6V7H9t90zwrs?=
 =?us-ascii?Q?cEGA48Citq9CyD7smENIOMAqgklA40ABkr1whhHGH1FJ0NtddTYQRRFo4XGd?=
 =?us-ascii?Q?+wxbDWi/TSFFLlRLHeFNIRu5FUgIaCLJl34wH6BIdWoqc2hLryzy1mRYhy7K?=
 =?us-ascii?Q?/WdMixuAbwAqS6t8fNtsd1VUyoizLo3IXJPAE8qpiXZRoO8eQ7z/LrktkgRc?=
 =?us-ascii?Q?NtRgJ9aoPXiNiuQjf6f4Iw6Ukrpup9Px+Sfg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VSoxtbePzOIL7EbeA+HmpgHx/1gDyU1Sz53Yt/dY5ht9DHkBByV95pg2zzJa?=
 =?us-ascii?Q?DngMdaKbx4UaW+RTv1IQtdtRDNCJt8Y8p994ReY0C9cT4Z0mNBwGWEYDQPQv?=
 =?us-ascii?Q?Bg3vNON/AMKXu++YS9N9Vmyi6yGiZpNrpHK3mACO0u6rWjNEZJQjtUedu9Oq?=
 =?us-ascii?Q?2FmUINBcN7Co6ndfhwN99h+X02lGaFPaP7XXfQzxdkoAOSkle5OkV9Rihlno?=
 =?us-ascii?Q?uyxYJCJ5GLV1tuBkof8pYXiN+sYvOw7XWhD0yNTJBpgsOvXCt1wEPdhGMqqm?=
 =?us-ascii?Q?gs85AkUij1zjUgZKQreI4SLSDlo0b9N8FGMj81oFjm4QgvwBVl2K7j9B9hVP?=
 =?us-ascii?Q?ZjG2Fdy/vBDc6hI79nlm+rssIaaMLVkENH8TlP88PqVHUDiA6R/3ntbZu6RF?=
 =?us-ascii?Q?EDJ4NNVvXq+MDXI25zpq48CUDhP4CMMNOhEuQnU3xoNugJS6NwEHr1aEH0Pi?=
 =?us-ascii?Q?QgeaRSU8u3NRhM73C+uX8Bs3o1eJE+l6IeVbwcBxjkrXDazqdzOfXej3EkYd?=
 =?us-ascii?Q?+KVfKaY4KlL47EC74HsJorFe80bdSd41hWrl0nieikcR6CiRZ3v5THspRGB7?=
 =?us-ascii?Q?UedesWCebfIwQzJ5MLKQ3OXSYGMCyXmgnpSdYqbElYZu8zyD0ePfN/xW17zA?=
 =?us-ascii?Q?Y3aVVEjFexUZZ5px5erDTpQ1KwScBEIyAtkG057JRjzSRL3iZXZcXgiSUUj0?=
 =?us-ascii?Q?MocFNUI0a80VVUW1eqmG0jCvo7tnI3ObQP79/mG8XRHWJPGHMSQrOcEBROB7?=
 =?us-ascii?Q?zzICWpxGAq6XaJAonmesHe60pK+TUYVUo14LknvZvTDDwpYs3FekBSDJzM6r?=
 =?us-ascii?Q?66gUQK7i2L0mSZK5JlYlLG/1XeDN2QFZVkIVepXiae0OoGCy0F0/IDg/KQVl?=
 =?us-ascii?Q?9nyLgjBRcDRLP5gL+OHlEDxEGDflCG2JDbmVG3xrAfs8HDhfLSmP/CXs5bbd?=
 =?us-ascii?Q?7tcf/jyIja1CIjHxezTJOqBY+V/N8w4CyJBeg6dgyshqH4ygkz3XxWfnkl3o?=
 =?us-ascii?Q?bMlHneu2vaFvVI68eLtkRmJJac+66i58L9pph/mjqaj7uMYxa06ouDFh2PJ+?=
 =?us-ascii?Q?S19BKRY9V2Bivgcn2/lG5akDZw8tmkv/hqToUMbKTi5OiSv2JAR7rNSTF8P7?=
 =?us-ascii?Q?icY/Nupv1ujL/y1r889OkKrpoa+jiYA/fAx8FaGDVZbjXiISjGATomrFiOUJ?=
 =?us-ascii?Q?r3UvrufLd5/d2lPMuH/fL3DEdes2nVLlO8qWa584QvD/HZGdZyrdAVnAb8zi?=
 =?us-ascii?Q?32PGULjRSfFtw2d7zxBs6q7G3d+WoqAsy7frlVhtia8RhNF3rndRgACVVSU6?=
 =?us-ascii?Q?LRP12qg7nGygB4uw3qie9FEOAGEZv6MubwDCriBljLqpIg+V2klNwNfDXWO7?=
 =?us-ascii?Q?4MNEQen3+4nDdNmDhYPn7prQqrNlY0MGiRmt/S6Dl9WRKqUyRTEcwVFolpsr?=
 =?us-ascii?Q?3UxuKT5BpVf6hATozPSUs1aWicYq7cgq/R4QhhtVzDQmrQNBr6Kpr+lrefZv?=
 =?us-ascii?Q?VKAJpjwyuFinwqwcPyTbfoFU+Jcn++1v8NG35pL8ryg+SJ8JTiZAEbJRuBYW?=
 =?us-ascii?Q?+TgmogOkQop05kouzR5PoiBqsII6Kg4iZJMTTGn44Sya2mi+e795QhzkYC14?=
 =?us-ascii?Q?OiSPc9yQn/yomwwKXJbsj3Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b83be98-2edb-4dab-daa2-08de20b7d3fb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:24.2003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTjU/j0f0O/qCtFZidaZO25mBFKTYHpnMKI5oJ1EGBGiaWeqtBIt8RNgfLghhJhWMKq6SabJfPFH0KaYkQIc2/lmXbB4B1GLpI86keeFWRIRNYSWTgYUd9qt251saQag
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
 sound/soc/codecs/ad193x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index 1d3c4d94b4ae9..b93531c3a9a40 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -282,7 +282,7 @@ static int ad193x_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		int clk_id, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = codec_dai->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct ad193x_priv *ad193x = snd_soc_component_get_drvdata(component);
 
 	if (clk_id == AD193X_SYSCLK_MCLK) {
@@ -476,7 +476,7 @@ static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
 static int ad193x_component_probe(struct snd_soc_component *component)
 {
 	struct ad193x_priv *ad193x = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int num, ret;
 
 	/* default setting for ad193x */
-- 
2.43.0

