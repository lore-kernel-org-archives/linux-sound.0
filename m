Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86101BC9F4
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903980; cv=fail; b=mxQ5r72HNl+JJDyyrBLZnPqx5/K+uCXjO4jlI31tieqweOT2lqVUB9Qn7DPtrrgVNPH3kAEtp/t1jqojawvC+Kh/p53JDmc0AxJ67b2rscxyM/KPcKGTM7TiAFaToYFZkwLU6aRfKL78OrSGvO11yPFHR6/rRhAfskhCD5Q0CSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903980; c=relaxed/simple;
	bh=Z3YTG5lgf9EiQRwMHBxhv7PGYEl4EdFwclisoOtE+UI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kc6DjYFOveaB0ktV8D2ewILUilZYvayNbKbudra8UQT77Pyiq2zWP0ZXGS0vM07y/1eB3rciVcNeCi6zfggV1/pyPkq+FQcR51rP7GVJNZgwVy2/yBfNredsd/Sx2vj82RQ8YSZpbsmibZ5dE4vam+CreLyJbXmGrUOw3JgGZTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eNAKrCu3; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eNAKrCu3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yh0LmgJVrmmiqnIsLwQIyZgjJEyp4RGLZMBG+XAhfBR5G3tBtT+3l6j0zX/I4txIMtO127PghTCjh7TcoglCd5SPELDk5y5+J4ii9SsBvwNLqOYOnrzq/dPEypT6W54dnhAWBB7xbcTp4dv4Do7alAjETUnd60W3hmpfwRphkR+jYXn2oXUA3/jdAoxmS1/ElqUG7ixHN+3EM6nj1MgLUm1rLboAkE+174I/KKLJonfaDoCaEhwf6Uj61RSf7n+eZYf4fw+riNjHKAeetUumSXShXt2eq6JFnnEEiOAbxjXsyB9GdzBNW+FuKBe8QR7rdKM25/ZmPx9iM10kT91I2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj0rA6A+M2fKQtSwKvQMsR/1z+jN5fFcE4ukxtsVA/w=;
 b=v8yHqv4fycGhhPmHc9pAyxwPas+dGXgApEIO/ymKAyFLIhTk93zyHNGscK2pcEk+J1/2d4pjyFO4rIyYflZTAzTu9sSvgmVYZ6/ZP7rMrJzKeBhdDtkK6xtTuuB+g+mbVKZTQ+27xrnqwbLkWQvKO0zcGBhgbM+gIkQdwR9M1oLngsHQMyKt2beW4PW5FKoOSUu+8dwyvc96OWmN41n0IQgGQOOD81mKF7/pXkRxIKhwF3MI2J0yFVY5tYlOihXvd4/BZwVlgLHaAbJTNqbWJan+RgZDTsrdfbwU2H1KTPFDVZGgx8wC/bn+r77QQe5MT/jiKuhHxN1Ah7H2lTKbgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj0rA6A+M2fKQtSwKvQMsR/1z+jN5fFcE4ukxtsVA/w=;
 b=eNAKrCu3TIA6RGFPGY0axqr+jtaDkwJGI7RRdxH+8bzVjdaYIXW3MW6iY0ecEJwb4rE3yPUz6CdYi65x9RfOZHFOLm5mu/s+IoMDIJDdkV7H2viMMJjSh8+shsRWpyQ4vPFBrqDNqN8XTjf/MgXTvtPRsdL5nOlOZXJ3CmJQBmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY4PR01MB13972.jpnprd01.prod.outlook.com
 (2603:1096:405:20a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 02:12:55 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:12:55 +0000
Message-ID: <87jz4z1c9k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/11] ASoC: soc-dapm: add prefix on dapm_xxx_event()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:12:55 +0000
X-ClientProxiedBy: TYCP286CA0165.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::11) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY4PR01MB13972:EE_
X-MS-Office365-Filtering-Correlation-Id: 37cdeeff-cfab-4608-70f0-08ddb456f6a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6blvyRjASburylqtIp7cm7cjk/unu90QrWId9lpO0LVIFk2bD55uJaPIQokO?=
 =?us-ascii?Q?Wql5QAg6Uh4BYCy+GYrgarGOxBpSQUUJYFsEriWdkXqQ7w65xyHqDnnBQ5Wk?=
 =?us-ascii?Q?NMFE6UzPJR9CuVM1hAv6lHsvDUqz5eN+r61ycCQ4RhqKsPCgJf02iybp9SJh?=
 =?us-ascii?Q?bZsjYtgJRY0CwFJ0MFgyUN9uhUQk9IhmWrP1VdliT6YLSo0qdaNjBI3Ih9Kc?=
 =?us-ascii?Q?J1xvEQON9a4NYpvqY/vzy0qlQekb1XWiHRthap3HNeiBkX/bu/lhrAAk3bY6?=
 =?us-ascii?Q?vju+kHqWmSavk9PpVBCRQtxNCotSrqMCIz9T/85/8gijPVb7unbcTKliZl5V?=
 =?us-ascii?Q?oVcCD3UG5zzi0yxfSAnIgfdzTz2MqXYbY7AF5Nshfuw/V4Oj7AQ2psknSL8F?=
 =?us-ascii?Q?LzxD1zntxkhE/faMKEV2N3HjBEA/AQ+jLG3cKhoSAfwSjNgn05J044kidEMU?=
 =?us-ascii?Q?8t/VNt/x7qUDHwsgZ8B5p3W3mg+y356YJhlwV1/iKK3mPwrakkoZWa3fG42I?=
 =?us-ascii?Q?neh1LEL2/dhzoQ93wfvUJaNGD+ckk9/pYAwBrs/nDy0RQjAoFDvk4ZnxbTUd?=
 =?us-ascii?Q?cB742paT98VvliWD+0cVK84hjDBCVfV76Cg8cVeLW13uoGM6J3OVGyl+NDUw?=
 =?us-ascii?Q?rSawDM1h++A8af8f+R6kG7HpJy0LCgfXB48Y8A1Kz4tjrIuTaBJykZe6OIZy?=
 =?us-ascii?Q?ema80yDBYjwSe5J3fq3r7c2Ci7K4QD4V8uZyIZnala8mYfacGiDGCRZsbtPj?=
 =?us-ascii?Q?pIE+law/dxZ4y7JoNqI1EdYHHWW6KlIwgOnsre3ef/b96oCEiC2jQy/nB7i+?=
 =?us-ascii?Q?g8ylqJk4ZG5EeHopl2BUmM8k0vczJjtZS0o/AruodO4/fDuebSJsAf1bqwF9?=
 =?us-ascii?Q?AsEq16BcS1bVrFikdDEIbS9kAQu+m83JdLkf2t4nKMRTxGVN+tqHe3SZZ392?=
 =?us-ascii?Q?3qq9Bx4BMCrzP8MQPT+JuTsqG5MSqDDlUyFbVm49cmcDOMevMPCnErr6c1VA?=
 =?us-ascii?Q?OTtLAJcr1Za1ovMRpkfiBPbGgI3x80qtlh+beEe+l1LDqQ9zT5QH8KlklVM/?=
 =?us-ascii?Q?n8iTKQ5L33DYY2c7WCHAD745hI6xXDRgSeJFr1fvnewOe5HMnhRpzcq+xlTk?=
 =?us-ascii?Q?R4BLcyVPyp86h017tXOWkzIaH2Dcb4HjYaUVks4zABaUILtOtVffwBBOe5ec?=
 =?us-ascii?Q?KikCVf9GFNpKYuCnMykJGJfpaBM9S0L2ApeYr4dILIci4E8H1wnEu/y8LhDy?=
 =?us-ascii?Q?HwWkUgt7s/iuqE6leRe/uKrLSyF19COtL5TslDVMcnKIkgQ/iHEHZ1yOgYee?=
 =?us-ascii?Q?wyxOebPh4ZlQsXViexb66rbLIyJdtRkVTTW6iJDHgFyDbw9n74uTSX//Gi4R?=
 =?us-ascii?Q?+skrSiAFzlRDQsYDI+nHpaE9qD04th0GNIZ2AjGTVXcC8gLmZfX5vctRg/6B?=
 =?us-ascii?Q?JAELfMhqDRD3NtwLDWTd9FD+Wl/rbXQfBtV8lYJNUe893Wqf8JQN2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PSRYd8VqH0wYOZkPjLcumSUf0UyFjRaJqpxV66DVFJ9HZNq/PE8jIpQtQM7+?=
 =?us-ascii?Q?8hbhMkwqOaOPdLUJLPVhBii3MffYEo06kR1fJwn4888vaXUWCmV9Sp+fFTBm?=
 =?us-ascii?Q?3xt7dX9HPyMVooB2/upRMoc/LRehR9r6TkRG0Ia4MkUFnNclaSR7U8SFK/TY?=
 =?us-ascii?Q?o+OAdbaMAXGG/xB/AiML2FgSDgFCCo5iUrfV1LtwpvVLnGsORw4FD6IyLBTu?=
 =?us-ascii?Q?p74DEHlnM9NXdmdOlHwoKbnZz9OZBrPsoyiB//xBaqcrV3EYk2iRapPFQkl9?=
 =?us-ascii?Q?u+X/04vTLo9OSPwrF8slwyVPOoupPr41sLgS4HV3XFAAF54XV89wuzy1DvpG?=
 =?us-ascii?Q?CMkRCtkaylOJLPqe9XYKJ4M56rPR1GnZBx7Nw8ArKp4ZijUs5hbLPM6+ueGk?=
 =?us-ascii?Q?Sjz1kVDedNi13YoHHuHdy0SXduyxxTPYS2h1oEkynPohb+kpgx5Z138dqrB/?=
 =?us-ascii?Q?pOcffzmEZzpE1Uz0XDKcXIdgb6ejAhganbIjs+gFTW2Tr/diZeGs/tLAjAFi?=
 =?us-ascii?Q?TbglBZmDBGJdipgqq5VwXRAlYxj0BWBSyINwnPyVSkcwQoguErlirbCHKp8u?=
 =?us-ascii?Q?IK+Pe4uUXxYfYQuXI3u9esWwwsuL5p9zqmotii0Up9YaMyfzfNrJH6ZBcUuZ?=
 =?us-ascii?Q?5sPxO2/e7uFfjjyusOQwS3pbg6ghoCl+17EzZZ/DKk3KiIKSWqE4YzWDobb4?=
 =?us-ascii?Q?k4ezobZy582UFwO5SLIBF/HI3SUF370ROg2bajqv26HVo9csHBrvrUpR5KlJ?=
 =?us-ascii?Q?IR4FLufFwrEId/aVTXUNC39yHdapXUuTr5hv7srn8CFmPs/zVNb7pcOGtzwE?=
 =?us-ascii?Q?/87IvEm4XbE5PuA9E/FMip3m8DaPOQJUXrDeIaYReQEZTvcoKTCj0r97T3/8?=
 =?us-ascii?Q?x/tGLs6QWwE6nQtQ4Fsx2NKfEVz70FZ+LNaInkLIIZyCLwEyAiKylO44fFp5?=
 =?us-ascii?Q?V81RtcDIwRcsFwmz5t7hUmy/jaNGR7OsORsxd/NIlChyyQH2srMcq/0fYmjm?=
 =?us-ascii?Q?B98a1CPxVeccSCycIM2ES9iE2mntb7HlKN0PdNQG5qiEb+fW3RmHwT+6VB2j?=
 =?us-ascii?Q?zZp9HAE0N7H3RCjrVVgijSUNGF/QncwiZG7GFWBLsNIOuQE6J4U5opWvCs9P?=
 =?us-ascii?Q?wobo8A17dWlsCDoueYA1bd7cWXUteOtkQWAwajX6amIzVcQMPKyHwleY+x4A?=
 =?us-ascii?Q?yNdh5G50/mXihjU/xl60vTDHhJVSg7KCci5P/CePF4VE/fLA0d3CJHIYfmsA?=
 =?us-ascii?Q?2svUcabVmQioi8Rxoeol2B9wCDUwpywFQZwxX3KgBC1V/y3W2lxpD3wT6quz?=
 =?us-ascii?Q?gV+xvsqyGqEMKg0URmiTCr5Is+mghkol3R6XGaZfEzikJh+UCIXqFKXR8wt6?=
 =?us-ascii?Q?FpO8faLM+3tqL4Dr09c0kcvuOAJRIQ+MH9Q6+kAydsqxB37jJIAxs9JQ3gsE?=
 =?us-ascii?Q?O2CFzotTABohv2Y9hRSIJBxbw/SIaGuvyLPDaw5Zpvwapqe6EfNfmSnytcmO?=
 =?us-ascii?Q?8qaK3gxIEwdEKzZot3bUac6usKX0+N3LiqfqV+nHNfgRDYpEuBSE2pqOL/B3?=
 =?us-ascii?Q?vSz7FgdxYgrhcxQEeURDC+jaOzXqLMhlUFd+5irAcfxWENCP9TunKKrMxcSS?=
 =?us-ascii?Q?aAXt35g13vKkoQSvwnNCYno=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cdeeff-cfab-4608-70f0-08ddb456f6a2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:12:55.5772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTCLOxSsMKwnB2yzq0IUPttsz18MOXsVXETy2VXe7VdR1Nnp1pZzVblT312iwH9IYcRcfUlfBJel9oeFvidBypBVGYkWPUIk7MzJH/91MABug9rLK/hb9U+zfptFoo5S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13972

dapm_xxx_event() is global function. Let's add snd_soc_ prefix.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h                  | 12 ++++++------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c |  4 ++--
 sound/soc/soc-dapm.c                      | 20 ++++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 535d2252d469..944e2bd80533 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -295,7 +295,7 @@ struct snd_soc_pcm_runtime;
 #define SND_SOC_DAPM_CLOCK_SUPPLY(wname) \
 (struct snd_soc_dapm_widget) { \
 	.id = snd_soc_dapm_clock_supply, .name = wname, \
-	.reg = SND_SOC_NOPM, .event = dapm_clock_event, \
+	.reg = SND_SOC_NOPM, .event = snd_soc_dapm_clock_event, \
 	.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD }
 
 /* generic widgets */
@@ -312,7 +312,7 @@ struct snd_soc_pcm_runtime;
 #define SND_SOC_DAPM_REGULATOR_SUPPLY(wname, wdelay, wflags)	    \
 (struct snd_soc_dapm_widget) { \
 	.id = snd_soc_dapm_regulator_supply, .name = wname, \
-	.reg = SND_SOC_NOPM, .shift = wdelay, .event = dapm_regulator_event, \
+	.reg = SND_SOC_NOPM, .shift = wdelay, .event = snd_soc_dapm_regulator_event, \
 	.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD, \
 	.on_val = wflags}
 #define SND_SOC_DAPM_PINCTRL(wname, active, sleep) \
@@ -320,7 +320,7 @@ struct snd_soc_pcm_runtime;
 	.id = snd_soc_dapm_pinctrl, .name = wname, \
 	.priv = (&(struct snd_soc_dapm_pinctrl_priv) \
 		{ .active_state = active, .sleep_state = sleep,}), \
-	.reg = SND_SOC_NOPM, .event = dapm_pinctrl_event, \
+	.reg = SND_SOC_NOPM, .event = snd_soc_dapm_pinctrl_event, \
 	.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD }
 
 
@@ -631,9 +631,9 @@ enum snd_soc_dapm_direction {
 #define SND_SOC_DAPM_EP_SOURCE	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
 #define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
 
-int dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
-int dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
-int dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int snd_soc_dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int snd_soc_dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int snd_soc_dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
 
 /* dapm controls */
 int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index a2a76b6df631..ea814a0f726d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -408,7 +408,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	if (pin_w)
-		dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_PRE_PMU);
+		snd_soc_dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_PRE_PMU);
 	else
 		dev_dbg(afe->dev, "%s(), no pinmux widget, please check if default on\n", __func__);
 
@@ -510,7 +510,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
 
 	if (pin_w)
-		dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_POST_PMD);
+		snd_soc_dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_POST_PMD);
 
 	dev_dbg(afe->dev, "%s(), end, calibration ok %d\n",
 		__func__, param->mtkaif_calibration_ok);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 3f94a6d974c4..72e26e1d2be5 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1537,8 +1537,8 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_dai_free_widgets);
 /*
  * Handler for regulator supply widget.
  */
-int dapm_regulator_event(struct snd_soc_dapm_widget *w,
-		   struct snd_kcontrol *kcontrol, int event)
+int snd_soc_dapm_regulator_event(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol, int event)
 {
 	int ret;
 
@@ -1566,13 +1566,13 @@ int dapm_regulator_event(struct snd_soc_dapm_widget *w,
 		return regulator_disable_deferred(w->regulator, w->shift);
 	}
 }
-EXPORT_SYMBOL_GPL(dapm_regulator_event);
+EXPORT_SYMBOL_GPL(snd_soc_dapm_regulator_event);
 
 /*
  * Handler for pinctrl widget.
  */
-int dapm_pinctrl_event(struct snd_soc_dapm_widget *w,
-		       struct snd_kcontrol *kcontrol, int event)
+int snd_soc_dapm_pinctrl_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_dapm_pinctrl_priv *priv = w->priv;
 	struct pinctrl *p = w->pinctrl;
@@ -1591,13 +1591,13 @@ int dapm_pinctrl_event(struct snd_soc_dapm_widget *w,
 
 	return pinctrl_select_state(p, s);
 }
-EXPORT_SYMBOL_GPL(dapm_pinctrl_event);
+EXPORT_SYMBOL_GPL(snd_soc_dapm_pinctrl_event);
 
 /*
  * Handler for clock supply widget.
  */
-int dapm_clock_event(struct snd_soc_dapm_widget *w,
-		   struct snd_kcontrol *kcontrol, int event)
+int snd_soc_dapm_clock_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
 {
 	if (!w->clk)
 		return -EIO;
@@ -1613,7 +1613,7 @@ int dapm_clock_event(struct snd_soc_dapm_widget *w,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(dapm_clock_event);
+EXPORT_SYMBOL_GPL(snd_soc_dapm_clock_event);
 
 static int dapm_widget_power_check(struct snd_soc_dapm_widget *w)
 {
@@ -3671,7 +3671,7 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 		}
 
 		/* set to sleep_state when initializing */
-		dapm_pinctrl_event(w, NULL, SND_SOC_DAPM_POST_PMD);
+		snd_soc_dapm_pinctrl_event(w, NULL, SND_SOC_DAPM_POST_PMD);
 		break;
 	case snd_soc_dapm_clock_supply:
 		w->clk = devm_clk_get(dapm->dev, widget->name);
-- 
2.43.0

