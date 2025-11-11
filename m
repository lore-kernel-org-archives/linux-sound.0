Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F8319D074
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820685; cv=fail; b=J0rDp/rlQO75AR3knEmUyiWDGj1ioukoemtUgdau+F09A+stYWPWmaLuZbEIvLWnt8JF2jdGxaxlidY1Jp159AlYhd2lwp1mRvYJrvhsfC852A8wCXrqdu5dMs7JiB+yoxQBXulocnZwB+4OrSaSVl23EZ07mjQ9/U4AwiIBaxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820685; c=relaxed/simple;
	bh=OcYVoQyrtZyYpqllBeS/7/n+mgI40RyXfM1DpTBqSaw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UMszeHQwVgu8gjYUhIgi5FeMlI5RffO/XfGHcz2oKY/a6B7nFS7yyiMTgI4FujKPc0oIuHZtg0NkxylJjjm2dnBS1aUSqllZepJfwZRhkIX71yCIKNlhqtaiphJU0uPZ85UzN04/d2Tht1TRvNUSnMH/HRpOoI2wudKDyezeKuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dMcSvEBs; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dMcSvEBs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5lidjyV1c8Lok9RoszjH1fgyIGFfFQdFQ6IdkbLKUoEW/vPGrtsvZyjYaqme0oi4rE6wAPwpsZnQkl1Mm5UPfXJvNT8/4h5bxs8YP96tr+aJMDPGKjwpf7Nw5mWV+RjAu+RMlZzTTZwGkZiDsfX79gg4oEimXjiays+3ydgK7M10c8Vv45mttLt76KhtnPufhLJaAhMRZJmQea+/1yrtVbtuPT5T0O3vBVkw+M0oc6pPB+m++kEaW3WBjxXYr6HDsqi3DTupPdq754smRgJxpXcE3/e/MjxsItY/BWUEuc9TACkU5wGSpbhlZVR5e5DDhoZ8atg0n1yQZshcdnVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkIrHClvwzHjMyFasU7u9BD9Bsmahw5tysQ+KFzGHUY=;
 b=X23FTlhQEjH9bXhwAsBp+MhJIYva8E9DsXDcCslwM6MDlRamAmO0K5QitIbSkAvUgvSBP0fIqb3z0SXTQN2rDk4JjQ66Y89ztlqsY75usaJlyOMF3g6DcW4/xle9nfWWzGE3m+n1yEq05u0MuQN7WvCeWjVXUwy9ZWkWx5QWJVa7EsfiRjxUAWzTd6PdrvCIcmdo7kDIsIFtgHlaaVofXPqoqkUN+RMf/96koX+zPOq6PCldiBedjWcAy31yVjtFh7jTljy/RCWKDXwodtxyZDMaNonO/iBm+7WgXD0Qo5P+FJZ0HLq58dgB5Yeym0kaLaVfpFjesYoIgOsYEGw1gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkIrHClvwzHjMyFasU7u9BD9Bsmahw5tysQ+KFzGHUY=;
 b=dMcSvEBseaPlMzoxkyYV2ji1mIaerBBj8avgtV+kCdbPTBn558oEbdgqVjkRi3fNnxgCVRGMO/cMd3LY9xF1VuXIYZEPal6Eecu2QwwgXnkpA6B9kSwEHZrLe8WbjUD2QyRY9L59L7MEeYe4CEt9FbigXSvFTE1tSy9CaqYtlBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:24:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:36 +0000
Message-ID: <87a50t4drv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 101/292] ASoC: codecs: rt274: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:36 +0000
X-ClientProxiedBy: TY4P301CA0012.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: d35a1b8f-031e-4a3a-1292-08de20b8b1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1zcY5CDGUCs7SFUZ2z+WoEf8gW0eHrSOZG4PYIIWg361XJex4e+lp4NODLZ7?=
 =?us-ascii?Q?mxtnQvbyUsth73HkCtbOfoU6ETFzeLdI3dISy8h2TiZ+UebiTOQpATYt/AD5?=
 =?us-ascii?Q?V1xLyGXbXAc0EVzkUvhv1GBqkGE7NuEQvJ2sooB8zvTMzRuQpUMJh1Oao8ru?=
 =?us-ascii?Q?lF5vwJZcqdQ67CbzTp3uL743I/XY4gyJN1On7yMH/TCvHMx3Tu3qPWM92Hh3?=
 =?us-ascii?Q?GNxHGwO+x0sUSRWVyW3hYUuE1k6YiKIBzBcCGBcX8qZt5FwLRXvA62v2MdPd?=
 =?us-ascii?Q?St6RhRy+BZ46myChBGxRxJzFxCHqAjQ3ZSLpcKeBHBdd+tor2d8PH3xT3T/i?=
 =?us-ascii?Q?pTRRmh+0vfaF+xsjCpWHiOiABsqKomvNlbOKXEGY3WhW6NlFGcPnNRtRta2K?=
 =?us-ascii?Q?/lFVYfrBlwqbKsectNNKoPzbKfyFpPOOTrnKg8RTLvu4wZOIAX8v0pXOfrvE?=
 =?us-ascii?Q?fXCzEnn1UxdFU+I25GH1OP83F4cB9gLdTjfS3ps7lE7GX+vad4EO8/7yJWJR?=
 =?us-ascii?Q?X0Z2kTkV0UQ+3OodB+AugjxdHv+RF/BpHM8ubwL2kajDjuCphFD8y1dhgsF4?=
 =?us-ascii?Q?RojZbH95pSXmsTKhAXfwR1NpVeuRC9qUPZ4744TFliOxjnm4Cax7ZDdqnvx5?=
 =?us-ascii?Q?63bDw/EbmMgZYlSGRTIDtUqhrXW4nKpWa1vWv7eUYQyBlavBek60YSidscWs?=
 =?us-ascii?Q?/3E3aRXTLXgBvkPOfPStk8CXkUjGjd/S/PtwpuZ26L9OZu5NgxQJDw92KXI1?=
 =?us-ascii?Q?f6hz622thnXW3ACM3cZcpB45L+9sUf7yi8sMIO2k22ObmUuIVsFw9DKA0fTW?=
 =?us-ascii?Q?iSB+oGk8WpL/MSZB9Zli6oO7yDQfxZ6QAA4SuFwGyEOt5FLazfa3jOXg/NHW?=
 =?us-ascii?Q?zwq84/5B+moJuE+TiUxOw3zYXZeEHDcikrBCGJ2nrZKSqHPI4shUPPse83Nn?=
 =?us-ascii?Q?YbZWRG7ShsUv3f2ssJrwxGFni+/9ciKhtRbJYkhi2T2TIgvEi5J1u7tBbrml?=
 =?us-ascii?Q?di0ksYgoQjn3rNdJKtqf32kHa8Z/V4UWb2E5MZTiniyEbqt5k7NH8orQYjH1?=
 =?us-ascii?Q?BCrUwAyztEOMbWkakAbE7jx+QYX7UVzFTj3I4cq/5uMXFTrnyalC6n/1B6o1?=
 =?us-ascii?Q?vLUDt2/VB8cAs4iz8zP30eSASqISuv3lmhgYN5f21N/Q66R+hMOniZRLeaYl?=
 =?us-ascii?Q?xIbvjYRurcaW/iO3h7RqY1m6KKOjXRiCoIUWz2YOuJrPoRVsiygfoX9br3ZY?=
 =?us-ascii?Q?QoflMD9yN2DU9YbuyKkPz1PwHDTHoh/SEuGj+xvS3sTBmlGq29hfCSk69wN+?=
 =?us-ascii?Q?LQNncKFbnDkaR7oL4RwZMHXTD1whjpjX1DSWIeaOsoCEBe4w/ys5jSZJI6nz?=
 =?us-ascii?Q?u6aLPgnF3tRCUXR2VGwUBbTVcDy9jSwLlKHmoYdnNB1OrgTcaxe9SaYfwfBO?=
 =?us-ascii?Q?SzpNS6ai9Lj9uJpJ/JQDsR9R8TrGTIF90ODJDa6gGAb9VZ9fF4T4bUfB9GiB?=
 =?us-ascii?Q?0tMQ8S9dh1S20olbABcc4Kcq+DkxFI3Gp6Ld?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gc/e2jWhoiZVPMsdnTgS17HkQij0n41vzsI+AyimW1QjKgRriDuYixce2BRl?=
 =?us-ascii?Q?aKVRGAjFhvTNwUTtVz/b9x47zXjj0w9sW3ehlcevn+HsdBUlWOrawPB/ErD/?=
 =?us-ascii?Q?bqFyqmgQMn49NoEJ+158989LrgnUpRxzmCnMBc383b5BrrjqQAElzn9k8nnr?=
 =?us-ascii?Q?ZtV1pE88cNJVsPC65YFmgLGuvzv8Oh3IicmuNk0Dy9vZ9yBPBCWpFt0wveOB?=
 =?us-ascii?Q?GOuaUwhPUtIfEKYW/FnGm1FYGy4yJtTwIwgN2ygqrbBLeQT/LuivhcIPQqSi?=
 =?us-ascii?Q?hEzon/w7Jx4aC7+XHfpJkQFd183VJrUmiPaYAUBbkZ/w4PY1ZUd1rRq7Ko2D?=
 =?us-ascii?Q?VL8cxKlOE9NBzxWR6dSThIQml+bdaIxv/Fhg/dMQ5ctr98dYDN9YMY/PxW5n?=
 =?us-ascii?Q?FkfVB6SNilkN90RS/UjNkhoP3AkxEJGICvZxcg+gHCSXnHqMEz8gUmRdWZOO?=
 =?us-ascii?Q?rhHTVABl2Qf+Om0CsFa68yn4fWnkrdL/F0uq28svmUnZkt+QQX0YhLvnA4sD?=
 =?us-ascii?Q?UUr6T2+jheDwQm1GXq/ydn3CER+MMJrX+VtbxYrpV2b2QfE8FvMckguYy1qy?=
 =?us-ascii?Q?2XkjlVIjASeJ8y1C4eu3B14PzYLZPa2KRxDrp0NBOoPBxtva/fRoC3dfO4e+?=
 =?us-ascii?Q?vizu0c5EK1X+qFS+RjU3AEuJRsBXJ1QIIU//qV4lUcQ8ZoyvILbTLaP9wtjq?=
 =?us-ascii?Q?KflmfOt7bdIv0oTA1vpVkbWJ+wCJRaqRPbROj7nJv/uL575QfcuePJjaC4qH?=
 =?us-ascii?Q?/hgydQHyCTGcLfuifbGN/XDu7uxXKbX0xGG3V9RJG9Rx+rbLIF6K0AwnJVle?=
 =?us-ascii?Q?Sqgp2O84vzz3dCHmodUN9IS6FjfrfUnFJrr0BB7vpzkbU8Hrr9sUdzVEeQOe?=
 =?us-ascii?Q?CAjhV9I0ZNMQJEF2wPxyhysxd0UIOo6iFCoWExuTp9akJSsZlYQoCUHFLjiq?=
 =?us-ascii?Q?bS2wxbN6OZZ9MEMv3GyVzKVWBD1UlF42OPzV7c9UTbc50/CKFB+qt3TP3Zso?=
 =?us-ascii?Q?5BJr9NiBv3aHSNifmMdcKqRaxFaKzT5mbS+n80gR5gJ1lhP/H2fWq+9YpgWO?=
 =?us-ascii?Q?6jmGV9kSRq7d4x0PoRCuzdQpuAUaIYl46U8JekBzgJEWn5pExFOmiDMWJqrI?=
 =?us-ascii?Q?OMpUC9StDRVsrFvZzfUm3gWmRBKTGMJMIEN1l52nwUJABuCdRNmAnpnWWV9n?=
 =?us-ascii?Q?Cd371tXzezVh8LmpbuN2f+JUij40wdSWBV9EDsLO2edM93x/r1DIzXTqHrr6?=
 =?us-ascii?Q?ww7nwZyztuPHA9dH2N1PdrDpLHKZPclgH/zCqPS+zVr/oux3zpF9I6esEZXu?=
 =?us-ascii?Q?PcCpc7fYFxjhDdCVmuQQjfFSOSjUtVX5q1tCK9EH+WLwrQXjY8PigmhesWnQ?=
 =?us-ascii?Q?C+HsZuYufm+lXt+1v4LeFx5wzGBDjHSGL0aNFbu4ofHT61uQoD7jJpLyCG+2?=
 =?us-ascii?Q?QM4lQ5olDjT8T+mqSoZiwW0hiMzzkDHWnZR6hiAHWs3oixVDmWQkeBjP6QJG?=
 =?us-ascii?Q?a8mmA3lrP3eI2Q3w8bp/ix2F+2gXdMdA5Cb3BYe4xRLAojOMxWijvR2aZwl1?=
 =?us-ascii?Q?aVNBjACjG+ZM+7S+z3IO9nrhqCUhPdM/UNkwJJSb9idKt4e/k04zqGC5Gqn4?=
 =?us-ascii?Q?8rALB4voTC6TJndfhcIv+9U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35a1b8f-031e-4a3a-1292-08de20b8b1f2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:36.5735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCfbQ7edBz3GdqWbfcLZaYI1ROMU12zGAB9s8PUDaQkwitO4gqicZMqd0R4hUjLGyWH83z0+/a5M0HVkoqUgITNJvpC0NjCIAW/djoH+b0v8cBPg6oHicWn548R7/iwY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/rt274.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index 2c055c45111f5..5c33aeaced2fd 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -925,10 +925,11 @@ static int rt274_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 static int rt274_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (SND_SOC_BIAS_STANDBY ==
-			snd_soc_component_get_bias_level(component)) {
+		if (SND_SOC_BIAS_STANDBY == snd_soc_dapm_get_bias_level(dapm)) {
 			snd_soc_component_write(component,
 				RT274_SET_AUDIO_POWER, AC_PWRST_D0);
 		}
-- 
2.43.0

