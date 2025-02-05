Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC87D25A628
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714848; cv=fail; b=CTF4cBHKDuxZXC76zZrclk6CYpMPoeYQc+cVWPiGoC7KTy1GkbdDLJkWDWAvXsfqEY4KFAxqCTCAzzw0f/rPC2lnLOfikYxwdkT+hsW1u/0FXPxEk5pCVmUrZTZpm36rsPt05bGxxlc3ZrPfqcz+tvgCKCyDQ0PXRb8tgb5Q3bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714848; c=relaxed/simple;
	bh=+x+u9BeEgbUmXy7e43iDYxtTxH02x+Ik7l29YO9vORo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JMkiPYqGKZlZJ8PPpcaJM0GvJJnDhALNsTLNvlNHFbhZQsVfynW5nqJLwM1f6Ya0mPbIkZzwZ4Q61jQXgrPfYQoWNS4TOlEX8c3p7qbCgpbCDOr5gPqoG/DME+tX4m5i9ZjeVtJIYcBOOZaZE2PLxXlI18tmqfYV/xAeq1F1gTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dp5QE2cx; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dp5QE2cx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ph3zFYmNQ19LbTs082ORGY6XcjqsF9DK4ieaJoJjCfKEeqSWLF46D4irngMeUorvr8dHzPOfsdq6mG90oOTOGOfOQl/RdgLIebuz26/qoXsIg7EGGUblafq0GZoX9XAQNpicaAIWyxIs2l3XyM4VYdcFcQ6cgEHTPdb9zZh8FvDAypwjL83/HqhTYFUr2Fx2sfDXugMr6wv4HE8R0s5R4fyQJrYw0tioT66E7dXpBtxZXgBDFW7FxYmI9zE7oONcT7v+NP5+SI4rrneYSVRVNHmWDOLoiDlS43JTvGHvHFAJvhi7tG1GSTPW8vamLbg/lyicNmxHfK5180zOwa65BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yjyd71Fo4U/jUOandGzPYj8L0KjpWUliKndP/V2MsEk=;
 b=fEECPjkIo+sN9Yy76ja5soY2+Wpj/B6qT4TEwouiIZpbR4qPAtYzVZvlGU0f/oN0H1VF9UWF0TEuoX60gH5fwE4QWJbyr0Rea+4W64fWMhsYcmtOEOLZA+3VmSSbXYqUUTD0nTTNGJ/zZincZt49ucoSGK8eJj6tYLQx+Ax/rh5M2I9o0AUD3MADOkhMq8YqZ0Sl5VXczkdFc+C7fusuxiejEWqvu8fRm7UtthhYwYpWR1sYGIiHhb5ngMbbh5BveqCpUlCM64ubs9zIDqOxyMemKj/g+WsI3fRSVXOxyEg7iNvYaAHfe+CPiXupYrZaJ+h3OJqcXFSnBZG0lec2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yjyd71Fo4U/jUOandGzPYj8L0KjpWUliKndP/V2MsEk=;
 b=dp5QE2cxTiaK1Z5b/s+6BpWdOYhFl5w8y/SHfYErUG9I5Leq2s0aMRwHfwzEjG1bWdwFvTXf0jH4S2eBw4N3e1FejCShzSCDf3Yu5MZeLFAsoRfwbF+NVSrWwJD175TkwrtNOGW1CMBSg/OvujOlieZeCOmvzquYhBByZ2hYb3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6425.jpnprd01.prod.outlook.com
 (2603:1096:400:a0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 00:20:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:20:43 +0000
Message-ID: <8734gt2qed.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/3] ASoC: rsnd: don't indicate warning on rsnd_kctrl_accept_runtime()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <875xlp2qf4.wl-kuninori.morimoto.gx@renesas.com>
References: <875xlp2qf4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:20:42 +0000
X-ClientProxiedBy: TYCPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3af32e-a454-4ed5-258d-08dd457aed7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TU0zVBH1QPfdEoeUzlKHdbWcN8djb7JpBlIE3UNYjlzYPHUoJGkMAWkelu82?=
 =?us-ascii?Q?HX9l7vEW0q9d5aT/Meda1lkbjtfRTAk+BxJz8YpZtuFKNvTonvH4njvtuwvn?=
 =?us-ascii?Q?PLOaEPVcVGwhvDR/QgMcii6QCfjk9VcVcQudBe5FF3knWfudld2hsJs+d3KI?=
 =?us-ascii?Q?kJfHiX419A1Q19lsYEvim53wJOl0euu6riMVsqV2KHHiqGyntP0X3P6RiL2o?=
 =?us-ascii?Q?bamr1WweVZz5OBNOw6Z061YclKQWwgb8TvXq1vYoidz3WD4jCGQquvLzuWrw?=
 =?us-ascii?Q?KQ3RZwFnmSecLuEvuFNoMGMSjCB+YwSYVrh4M3dJ0exdLNb0BGnpmibjuAcU?=
 =?us-ascii?Q?AVyoguq6tbYqHirJVvVCg1yqoEdLmog5jhH8fuPZ+MGdsAJP7I8j6t5DlYTc?=
 =?us-ascii?Q?lxw7INNSsy+UZHDEu8S/xIIE8G14sZdFxQu5yCt2ZxRCsVQ9STjGPNw9ttnL?=
 =?us-ascii?Q?+D6BU0DYI+UgG77ITwO4yU/NRLv9k6FI0vmp9dIpGOB3T0BZYUnbo7oYIJ2L?=
 =?us-ascii?Q?biyARKVvuGyghTrQuK2dev5ePoiiGEkrQVQs9qYwNwBR5cUxa6Is8ydenKfg?=
 =?us-ascii?Q?yCdpkrbG76wYmLQILFOc5M028jwriu4RUkCYjMLWsoheuJ7P6pY44ycuAFeQ?=
 =?us-ascii?Q?oHd3mWqfAL7RugzhinAp0mbNZ5UxffB/2i9zPWD4aq6uEmV3x0vSSJLPTl5Q?=
 =?us-ascii?Q?ITZwVeDxzmwfr21z3Gzo/h+gdYT69ngJoZ20MOguku6mRq2V8E6+xjzpRzzb?=
 =?us-ascii?Q?/2+ROWVjDpwM8gc7uSHQzEud6a+e1FSSstW+1uyLU6oHActUg0JQnZ4In2MQ?=
 =?us-ascii?Q?bHaAN1/8bjeBKNp9fFUSa1IEwix9Ldnwhl5BwCUQUjzxFOr0TZH8vQZy/Ukk?=
 =?us-ascii?Q?QnqRg09rYQ3UVQKYuM9iiQLucYwNxYYrFZXGZF/YA8TXyTAdd+fi68hbPFem?=
 =?us-ascii?Q?aXUC+vFjR84jUGWglOAbE4T/nDxoXFHQ/87vXQeYxOTtt22IcmtNZTr0wczl?=
 =?us-ascii?Q?1ArJmn9QvvUyXV3HFq3f3uNMn8MSKiG9TsAKie77nXjXyYrAtOpxVkEHaDKH?=
 =?us-ascii?Q?6pb/um/nQyYonHwSVGtJ2OPD18XTExDSdZUFvxzzD00Apt4IHqZv+mZ5wpax?=
 =?us-ascii?Q?GX3hwIh9+S5ldI17x7e6sUODGPM3w8RuEdTwNdPzKIUdMiOckvenKpGEviPa?=
 =?us-ascii?Q?ABChmhvDT3K7Ohm75aiX/ms1W6rC5g25QNWrdsoWcJ8ZVffWmcKtzEh5Es7w?=
 =?us-ascii?Q?OmrOETa/i9Iez51j3VVxIHElQsvP3M8Osh/1NAsjMi2dF7gCxX23oc0d/dgJ?=
 =?us-ascii?Q?mi9Y6ryCQjczHPyh6D2bxki+E0ejK8HOVXRzTDFxhu4+1n3x4+73jj5xzRMj?=
 =?us-ascii?Q?u1ShmBumO+GZTBRKwBf2jxXNzzLX2Y4zSiGg5A9UmBNsCccYIm8NMk/uMLLm?=
 =?us-ascii?Q?xDw6+NUTKbDVI9aHPrgSmxGJngOW+M8G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jjWp7DEq61o6wshC+3CN+ix5/WgmHJIdFTW0HJyCMhdxYMH9V3q5chaGJOmF?=
 =?us-ascii?Q?ukvwrwOnV8HODthLVeDcPNGVJwz8w/sTRf1B2RfBbBayZQpt64HCrYqAkYq8?=
 =?us-ascii?Q?rycBzRtmlF/2+jNokwmeiXrvP+lXOO43+x93czax/oEOhHBfHuSVe1hUZArM?=
 =?us-ascii?Q?VQVzPcW1eujFhOHoGXF7s3EbQ3iq4uHqkAlQPQ1W9whV/7KZGwf6w23cUB8u?=
 =?us-ascii?Q?yGWW/xgQa6Ip7fSxJlTuEHR00LtcqAPCwJz6TNoK74zCxA5hrWe+8gYqu80/?=
 =?us-ascii?Q?ZjescjbH0JBMtx2lnSxdvYjmDr2nvZXheO/IOpvsr0hPrXWv2XVSxDxA2kQk?=
 =?us-ascii?Q?m8GaqseuTkWTmoSvphO79vApY0uST9Egjk7TDVr4/9MiNN8eFQ7zJfYCp0vI?=
 =?us-ascii?Q?pPZBLImNgMm8AtExP9KFGjY3KErlWlifNxXMH8VT4L9fJk2hLNnWwUXD7dTL?=
 =?us-ascii?Q?m9tDlL6MQUEEwIVyYOLcYmUj22DiSwn6XOB5xK8+GofY497tjkdN/hzwbKHx?=
 =?us-ascii?Q?vRS2aISet+bFhXPHUg8tQH2SZTpw9Uk1UTE5+/eikdxqMBR/+7ATqD+nZhbN?=
 =?us-ascii?Q?UtzTlcDbvpCfG9IecQWvgm3s0I6YBJJO5gWxNFGKQu4d9K8JSZHoUz5eCy2b?=
 =?us-ascii?Q?Kvkl+vMjPq4YYkqg0H2v5pDo8pXsW2kTjCTZxkQ/rX1GHXGvAHSkSVMjoxT8?=
 =?us-ascii?Q?FQOm0xEf2tZjotmHw6fQCHbE17gzyVplhh+mppv0c7s0jEX2s4+kgN0yu+1l?=
 =?us-ascii?Q?tQE1TQ7CuHo9TGfa23eh9ZaVCcb3uor6iM3ESyIBgBP6ywqORDyNGoSwMoGa?=
 =?us-ascii?Q?Znvsx+/fkKd66zznnrZSrBz3Nnh9gCGAMAU93Zya3T/dLUSmvtJKn9IMBxQ6?=
 =?us-ascii?Q?FIq5HCp74z87nt/zslepr/76uypBTIQvtpeViLLGwZsloroS23/PWB2B20Co?=
 =?us-ascii?Q?1oJM1ZYX+Wb6j6pCp3tvmaiBgMYzqv2g/xTBs5sAa1i98v16ATGZxKRLFOLc?=
 =?us-ascii?Q?zRWHXebLFKWOMFxZKM3X+9llOB/I+AUDDNiNSDL67vTGJLIVShFb4AespZEG?=
 =?us-ascii?Q?ccoUN/XSueR86vxCc4ouh9P9+kLEIIWW7ZaCASQb1lpYtxqmS+dtCpOnO2i/?=
 =?us-ascii?Q?8rQtGEyXmD/fCsnehzzqfHwRUW9Mga50jo88C9mlafPSfO9RP2xDCCkp+NCf?=
 =?us-ascii?Q?Bhzvl1oN0YExGYcREuR8KTK2WknUZ0c35VcQQkHG4AjMIfLxAkKjdd+GlUok?=
 =?us-ascii?Q?J6Jn7kxuTbkCOkhaX2wf5OubOrmgaG3IRNFpl12zZhv2BUuXq48RuxwtcAe/?=
 =?us-ascii?Q?94UG8ygdYuQSe7R8fPwrtUfaDSUDXD9CEvMOXi7r1SBKrmDxcBXq2Ek9oH5K?=
 =?us-ascii?Q?vztjqgBpRCzZMQfhpgyOljyEgWhkmhpcA7d69NoKFTBPD6aoUHVsJXxJrfVm?=
 =?us-ascii?Q?vgGbpe+Df0gQ2VAd/n2DSl84Zqv9NnR0nxCsN7uWVis2zvj43DRkWpAKDvSc?=
 =?us-ascii?Q?TR5t3gMbrXo14+ISGJFg9Yul+9ciY3eAEpoQa6hsmbUdOE5kSbyzjbucmsBs?=
 =?us-ascii?Q?iTE16/3qePHhq45ox8zrHDlY6Bac7Epvn9HNWzd+gZt7k8LvcgU6UnM4Lvnk?=
 =?us-ascii?Q?dK7aHpvEJBKZOPHAHDEEI+8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3af32e-a454-4ed5-258d-08dd457aed7f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:20:43.0408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ry0vnWrm1HKGfrH6EvFDJUbObukD854bvaysTI7KwlHx9mkgvepvS7Zq3NpgfqXu4lLQYm70/lznB+KFBbJMbSY5hAR6ZkFgbYmsb9gpcmT7ZvKcT6Ut5Yhnnv2RRtCf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6425

rsnd_kctrl_accept_runtime() (1) is used for runtime convert rate
(= Synchronous SRC Mode). Now, rsnd driver has 2 kctrls for it

(A):	"SRC Out Rate Switch"
(B):	"SRC Out Rate"		// it calls (1)

(A): can be called anytime
(B): can be called only runtime, and will indicate warning if it was used
   at non-runtime.

To use runtime convert rate (= Synchronous SRC Mode), user might uses
command in below order.

(X):	> amixer set "SRC Out Rate" on
	> aplay xxx.wav &
(Y):	> amixer set "SRC Out Rate" 48010 // convert rate to 48010Hz

(Y): calls B
(X): calls both A and B.

In this case, when user calls (X), it calls both (A) and (B), but it is not
yet start running. So, (B) will indicate warning.

This warning was added by commit b5c088689847 ("ASoC: rsnd: add warning
message to rsnd_kctrl_accept_runtime()"), but the message sounds like the
operation was not correct. Let's update warning message.

The message is very SRC specific, implement it in src.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/core.c | 14 --------------
 sound/soc/renesas/rcar/rsnd.h |  1 -
 sound/soc/renesas/rcar/src.c  | 18 +++++++++++++++++-
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index d3709fd0409e4..f3f0c3f0bb9f5 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1770,20 +1770,6 @@ int rsnd_kctrl_accept_anytime(struct rsnd_dai_stream *io)
 	return 1;
 }
 
-int rsnd_kctrl_accept_runtime(struct rsnd_dai_stream *io)
-{
-	struct snd_pcm_runtime *runtime = rsnd_io_to_runtime(io);
-	struct rsnd_priv *priv = rsnd_io_to_priv(io);
-	struct device *dev = rsnd_priv_to_dev(priv);
-
-	if (!runtime) {
-		dev_warn(dev, "Can't update kctrl when idle\n");
-		return 0;
-	}
-
-	return 1;
-}
-
 struct rsnd_kctrl_cfg *rsnd_kctrl_init_m(struct rsnd_kctrl_cfg_m *cfg)
 {
 	cfg->cfg.val = cfg->val;
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index a5f54b65313c4..04c70690f7a25 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -742,7 +742,6 @@ struct rsnd_kctrl_cfg_s {
 #define rsnd_kctrl_vals(x)	((x).val)	/* = (x).cfg.val[0] */
 
 int rsnd_kctrl_accept_anytime(struct rsnd_dai_stream *io);
-int rsnd_kctrl_accept_runtime(struct rsnd_dai_stream *io);
 struct rsnd_kctrl_cfg *rsnd_kctrl_init_m(struct rsnd_kctrl_cfg_m *cfg);
 struct rsnd_kctrl_cfg *rsnd_kctrl_init_s(struct rsnd_kctrl_cfg_s *cfg);
 int rsnd_kctrl_new(struct rsnd_mod *mod,
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index e7f86db0d94c3..3099180297722 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -531,6 +531,22 @@ static irqreturn_t rsnd_src_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int rsnd_src_kctrl_accept_runtime(struct rsnd_dai_stream *io)
+{
+	struct snd_pcm_runtime *runtime = rsnd_io_to_runtime(io);
+
+	if (!runtime) {
+		struct rsnd_priv *priv = rsnd_io_to_priv(io);
+		struct device *dev = rsnd_priv_to_dev(priv);
+
+		dev_warn(dev, "\"SRC Out Rate\" can use during running\n");
+
+		return 0;
+	}
+
+	return 1;
+}
+
 static int rsnd_src_probe_(struct rsnd_mod *mod,
 			   struct rsnd_dai_stream *io,
 			   struct rsnd_priv *priv)
@@ -594,7 +610,7 @@ static int rsnd_src_pcm_new(struct rsnd_mod *mod,
 			       rsnd_io_is_play(io) ?
 			       "SRC Out Rate" :
 			       "SRC In Rate",
-			       rsnd_kctrl_accept_runtime,
+			       rsnd_src_kctrl_accept_runtime,
 			       rsnd_src_set_convert_rate,
 			       &src->sync, 192000);
 
-- 
2.43.0

