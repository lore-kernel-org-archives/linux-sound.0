Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AD5230BCE
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 05:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963306; cv=fail; b=BhmcavYDMQtlKyRufXi98n0nb3kUMz9Ut2m3dIkYF9A4lJdQyYcD7ek/FWEbHV4q9DORiO2tAvq1M2btwo5LVfW9ny/19d1Ny3y0er10I1UkhCITmQ++Lt8CwnmPLj40P+vOmDw7V/nubXotuJY3XD5w9likll95v6oUP/GoiG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963306; c=relaxed/simple;
	bh=DNfqlMJgWbil1bCZr02xzIcl52M/QxoDcvHLuYbcsLs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JOqoQYQqdeWBTkMxB4LW38EJTS+Ij3dSahhc3tPPTu+iUAcC2ulph+s6qhNIYGGUm6NKaKTU7MiucsWbciqcKLRmxl5jmS25UJRE2xwOPbhVWN80SZt8nHSqSIoERJC4US4MSdbAX4y0m/ld9oZ1JVZAlEfNrQZnxlvi8kc1H6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a1zgWgpN; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a1zgWgpN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YggIATB/oWAMxLND88XwH40HN3+AK5QcTVMgYfn87Adx01s4vZSjGGgdPBtPn7AvCAh7T5eaK/U4NfBQkPrx82QiZWFN7s9QuuywP6jG93w1ZyrSgTJcVLWLK4pg5/rMYOueUY9sOhY5T/UGmzfcfAtPCpZulgjFGfDUxZjWBuUshsLigvm2u1P5qz62IITzzk5F8RA8jc7+qGI8ON0Qa5tYE1bEVJOvDXmXUTcWgtZekx97F1TULneTZwuF5LNiA/vxT9vLgaE7bS6GMWcN4GNs4ySZHdRzc3iTLVo2/HTwQmHIGLcKx63Si2X8QlaT6/AMjaMX91DW7pMP30jRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsK5Y7tJlg4I+btvVdF1HAq6P9GFBOmdb5Cwn9/Av/Q=;
 b=N5w2rcQD7jqDai8p4okDR0iT1fGwzZCkaAgrPiqaB8wtJOoRHfQiaXIjyFVdIO4joWqhH6Yc6j26TzkWiFEL6WGgr29/tHdlb6KXk88/0nKdSmMcvn0arTExalWpKJo4CTrgvmTSEnJlWDvgov+5NKaDkvECy/DgsSt7fiUSNPWuVYnSE2GWvcm/MN20VXwm1R9rizsKi5naen4RLHvQTuM5jRqdJAoiNp9dsX8jO13ZiOKimY8l8MEK70I+whQcEX7nLfGesnwH0BKXIk4JFL2KL5C594EKU71hDP94jh3QK1TUiLGXOoO11Gcosp9ePW1WuGfj6lvYrjeQk8mrug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsK5Y7tJlg4I+btvVdF1HAq6P9GFBOmdb5Cwn9/Av/Q=;
 b=a1zgWgpNORGBApWFRBJ0vR+rIcHeW0tQVHiy/jijL457F0B4dn69pBr5AtF7CHLDz6bW1yVq9XqBeXgdhWaqOaz0W/kL++7RCQtLAvkZe1kgee94fG4AZ04NbKfNnBz6oE+XsZZYOTk2LnkAbzxblX5jw1aut075CdfExJ56+2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15650.jpnprd01.prod.outlook.com
 (2603:1096:405:288::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 05:21:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:21:41 +0000
Message-ID: <871pomx062.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/10] ASoC: soc-dapm: add snd_soc_dapm_get_bias_level()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Sep 2025 05:21:41 +0000
X-ClientProxiedBy: TYCP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15650:EE_
X-MS-Office365-Filtering-Correlation-Id: 07daa8a8-8761-425f-0cdc-08ddeb72ee63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uf3WZRU0IcDPEHLXtte2YaPRuq7hXbLM8v2cLcoUM7IJQj5Exx8ZP9ZdplRS?=
 =?us-ascii?Q?qcSrvIPaj/OJ32i1K8a745JEijfGaff9gs23Y1F6QVDK99Eje6XwFkyCNJzT?=
 =?us-ascii?Q?1XyOHe40z1BbGq7ayPV6mUUq1Ab3g812p09NGYyCtp/qbC1ZlIg5JwfbaULk?=
 =?us-ascii?Q?LuF7vYpyYbzZk1tWqsvQPmfcCKtIorN4whVyfmxJ618PO1Yr+EuXgl24FsuF?=
 =?us-ascii?Q?FHqiqLwSIdDYiDRkA/ilS7yf1ifNuSsCmB7iDMGG8KTzBOK5vbD6YChrOz0H?=
 =?us-ascii?Q?d1+uvKaZrri0jJVx8k7vh3UpHwWI+NWChX9Y5sUNrPgfMWs7JNaRuowJV7wt?=
 =?us-ascii?Q?Y+wY5rdJSVyCUdixUSrz9X5elQoi72x6L0ETqWdzOdJ10Sh1Y5HguxVFX2+V?=
 =?us-ascii?Q?tkl80ksS1nVV9D1bOMoXwFekPLBigzNWlKB0b4nErQVCcS/OqXf7iXEv4wEb?=
 =?us-ascii?Q?KvQU4VrhodA+7klu+aaFYNxildKINeNeEXMrEeZTJIKh9R18RpMgknuQY/ss?=
 =?us-ascii?Q?z86g/FtXKHgZsKgK05RAgrYddUQ3adWS1m85u0V5dqXNxU3jMwTsRgJXuezE?=
 =?us-ascii?Q?1+IYDk3InLLbeaDI3kNqxjXlIU62epzcg/Bh9fAHhMXMpt2Bfg7CL+VSvn+N?=
 =?us-ascii?Q?s7WDJajOjg1eA+62eSQ06+pKvIQrpwvOkk6Ud/T3PWWylzaYBPpsowjDySGH?=
 =?us-ascii?Q?XOVGYdaytDwxm+oA1/rA1jGDxb7QLaMWC/PSHRKNaSd4/w+cs22zX71AI3jc?=
 =?us-ascii?Q?d3l3SymibznX+nPmjv5mgZxN+6eOXrafzq3/wDbBJeZ/cySh6BwqzS63EUPQ?=
 =?us-ascii?Q?pJu8sEmsT9hxz+EBTF9icTVX7RxVQzbWKi/AZVzf8ag4TkHvP13JcSW3cFKi?=
 =?us-ascii?Q?Hj/NJu2OYBYKD1rmDaZOZgct1O8TqzUf3LFT6UJMGn3mejf2EvsxbCHMHLem?=
 =?us-ascii?Q?Tz++PtztwdBVb6I11Yy384SUyf2GsQl1Fo9Ks1ymfgm43F5CPvmmmN0XeXz5?=
 =?us-ascii?Q?iQ+b9slQwtZLQbYi7/qHjlUd40yZWLSRFZW9C99zykENW3DCz3Y6t9gH0oka?=
 =?us-ascii?Q?6cu6Md/8ax8yx8QLGewZNSdmFtLRWDbfMzHTbAKtXRlNv7aZUAa1NYgk6udl?=
 =?us-ascii?Q?2fgMbbISRbLrR+MlxwF36qDuPgKPynpvVe7fvgTuJcpQppLbnTMEqMSxbbjD?=
 =?us-ascii?Q?3A6k0h+vm+Z8ms9xZvHpIjtByj7o+aD3MYiEZ5v4VLpsHGSb8S7zGpYa/zy7?=
 =?us-ascii?Q?ywe/1Zrzmb/LZ18ePQIDZZtw6yQhBF5wyIPLAjEQEvEQFQUKTYfXsw2eAeRb?=
 =?us-ascii?Q?1pE8469o63gWgn52O2xD46FRUDnGPuzb5g9h2hdGSWZ3OCXS0qgxFObpw/pU?=
 =?us-ascii?Q?ZZEMAHzcUXoqRNQM9Gn8OYPwhmLE3o+lQyWRR0zPKBQF8sNr9xPmFsZsewq9?=
 =?us-ascii?Q?+Y1RMQ6pk2gSadWeCcCCSKFCA3OgNU0QktAfqZdvybIR92PypRO4MQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1qCFaiAWRgv/MSYcgdOAQj11DYJbLVyHN/v9Lbzg3P8yqucfgFXqGFodir+Z?=
 =?us-ascii?Q?wlYGrZ2xOLq+4rm1jUp/4Z2Kd8A/5Kq7jnNk0fPjMoBr5h86iEIYxvNxmd5A?=
 =?us-ascii?Q?jtJSvBwtgs+V73CvXJUUE7nyFhYPu37fX7SiY3/j9YcO5m7XwjGMgHCYxJnx?=
 =?us-ascii?Q?fg4NcEw01pxl1MBXB/3nxNbCtN1pzauIjwIL85JRmTv5+/QRKBWWQFcBE7AQ?=
 =?us-ascii?Q?1uC1XHze+SVljzyJX0n4OnQ8RLLIdTbkwEf9H7vxKCdfaqCEhj+uJhSU4KJi?=
 =?us-ascii?Q?26/9087983mGanTRxL74MrFJi8dyMd7Ph5v/BkMNrLxx8GsbWAXdNEWT6S+g?=
 =?us-ascii?Q?AAhSVXbqfATAcQhRT3QIJtzi4fJ0c/2dQlHphgKFocjBYfBRpiSMWI2Aukl+?=
 =?us-ascii?Q?q0/nmDn1CP/yu1l/WU/YJGqG/rERDBkq1h9TYJQrSTDIm7twfn5ffVVD0bE1?=
 =?us-ascii?Q?mrvdULl609UZvFaXP8uDVwJ/wMxl6s/EYoXieDaax3Af66oVYaeymaEKoNcW?=
 =?us-ascii?Q?OOSwply2NzrxIWaLzrOYUVm/SqkIugnm0sKQnpUtcrlyn9eas26Vm+3sHU/A?=
 =?us-ascii?Q?7xblKFADeaQE8mVtOsAYvYnKDwtJOGuKEPKpM3P2r4e8keZD8ZHYKqIh9wxA?=
 =?us-ascii?Q?hVwI6IqgpkSmbSJRPxobG92GmlArXCT3Zkk/kOakwCWcK6t3VGCV2e46jS19?=
 =?us-ascii?Q?rsRpOaHkouvxYbACImnHUlSiPYLOZp6lw0PCw82QXzTPTI/Y8BA68fGJn61f?=
 =?us-ascii?Q?SaAssw+mgCy1vnw+0EdtxIGXHhQBGDvWMzqqoCMl69MV0n77r51nMk4dl1G/?=
 =?us-ascii?Q?zSUstaDvssnDvBKRKoPQ4+rmK06D5dJB+PWAVeOJqupYfjC5ZEV6ugDcj1Po?=
 =?us-ascii?Q?IosP6NEOZWKB+JpFUY/0AM3oJD7f9ADDIo3//W8JKbLt5zaRbb0Iq9wYqipW?=
 =?us-ascii?Q?NdFQp/iQ/O0iLmQBK79csRCKyIN+z0+90U+oXVuTFeHeGOswp9hHzTV8EvXF?=
 =?us-ascii?Q?FCnpNGKn2ZOpoZXOrDrMOfwx6qXuHYsOzb0rd6FqQ/uPK5hrMvhTXtj5VM4B?=
 =?us-ascii?Q?aLl9bhQBkb0Y97rrE2yb7h6XiEB3ONPcQ4fZtKpaiZgIqpzexqEYYqIRT8fU?=
 =?us-ascii?Q?d9jLX3IPMqaDydyfu0IoqbecP0fPtmtt95gAI+0yRe/RT2jTp7c0h5l6DuV3?=
 =?us-ascii?Q?0yXGsBqHnVrbsUhTcb76b/h2A5Vdszdd2eDx7croC66qffA5B5WiLnSvmuuV?=
 =?us-ascii?Q?c6YJp5FqK0Im8q9oRG2Gt5ulG+c4iB3CERRBJR28YN8nO63sHG6W18p2ankR?=
 =?us-ascii?Q?QEtA/O3IgfY/90eChB5bAw/DxnkMJGNgSTQjwTepA6qNt4EOCfObtzZ5Mhwa?=
 =?us-ascii?Q?UfSlIFrjFTmakEiM8hH7h2rL640+9NT/24svKYXhhx9tY2zL/NCmPm6kQ0sB?=
 =?us-ascii?Q?zSke3kPrGcd3E2xISkKprBx1wCwAlMA6FVRKJKwg9RcqqFYdU1A/NPXvH2EI?=
 =?us-ascii?Q?Skxurc6Dld9GT/J3tfW9n88DKmxT32Y5JXfMCnk7REaBXFN0dYBiY81mXy5n?=
 =?us-ascii?Q?wc6dJjeZvhWmqSwjYPUMbXi6DVNC587jO6FeVgZ7NxFQcXbruXYroEW+5WtY?=
 =?us-ascii?Q?WjrXo/fVLAL5NBZVKaW3coM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07daa8a8-8761-425f-0cdc-08ddeb72ee63
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:21:41.7249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLmmzVaWvFZd5ttg2Xd6B5+GemsFXCCjrws3jw77tAK7IBJXXuikUZsNcG16bt4rMzu3a8MIJK7pveOX13U6JoC9flljrwWLLnWzNU8TrzYtmT3b/W9RDzxYQsGHgE0g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15650

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

Many drivers are directly using dapm->idle_bias, but it should get it
via get_idle_bias() function. Makes it as global function.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 2 ++
 sound/soc/soc-dapm.c     | 7 ++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 9618a54a53485..e978be4010b84 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -662,6 +662,8 @@ struct device *snd_soc_dapm_to_dev(struct snd_soc_dapm_context *dapm);
 struct snd_soc_card *snd_soc_dapm_to_card(struct snd_soc_dapm_context *dapm);
 struct snd_soc_component *snd_soc_dapm_to_component(struct snd_soc_dapm_context *dapm);
 
+bool snd_soc_dapm_get_idle_bias(struct snd_soc_dapm_context *dapm);
+
 /* dapm path setup */
 int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
 void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index a263696ef8acc..209da43bc023b 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2180,7 +2180,7 @@ static void dapm_power_one_widget(struct snd_soc_dapm_widget *w,
 		dapm_seq_insert(w, down_list, false);
 }
 
-static bool dapm_get_idle_bias(struct snd_soc_dapm_context *dapm)
+bool snd_soc_dapm_get_idle_bias(struct snd_soc_dapm_context *dapm)
 {
 	if (dapm->idle_bias) {
 		struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
@@ -2193,6 +2193,7 @@ static bool dapm_get_idle_bias(struct snd_soc_dapm_context *dapm)
 
 	return dapm->idle_bias;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dapm_get_idle_bias);
 
 /*
  * Scan each dapm widget for complete audio path.
@@ -2219,7 +2220,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 	trace_snd_soc_dapm_start(card, event);
 
 	for_each_card_dapms(card, d) {
-		if (dapm_get_idle_bias(d))
+		if (snd_soc_dapm_get_idle_bias(d))
 			d->target_bias_level = SND_SOC_BIAS_STANDBY;
 		else
 			d->target_bias_level = SND_SOC_BIAS_OFF;
@@ -2286,7 +2287,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 		if (d->target_bias_level > bias)
 			bias = d->target_bias_level;
 	for_each_card_dapms(card, d)
-		if (dapm_get_idle_bias(d))
+		if (snd_soc_dapm_get_idle_bias(d))
 			d->target_bias_level = bias;
 
 	trace_snd_soc_dapm_walk_done(card);
-- 
2.43.0

