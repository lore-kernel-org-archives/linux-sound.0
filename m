Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156620;
	b=ONhDOQS6JjFGbFRV+VGnNIbE+LyuFafZMT//IUPKPIx4AYGM/YOkRn2miGS8XhvcP3Ff
	 KpEe6sps8voiMWEdvHQEhFknbp02wJ5XdRfk8Z9GFV67wXpOjWwehwgY/BeNRAo3n3kk5
	 a+AOW6MsEqWFFiUI8Z8kMHOG3W410EIOsnlHHk8cyzck9mdkez7kTZrO8HO12CB1eGB6L
	 n80RLFQATgmFz3/WcZ2eEnfysTrUkSeDnNttZbgt9VGkWtimWTK/LB5ULoNxKPPGnKgao
	 j30rc3AxmBIsjEgZoGwN7OVzTsnmztdY1Ft204riCS+Xq4TMYNYXNr5QEotPzTA0uOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156620;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WJ+x8RRCbHiFR/YafKTdK/0YFRFmZDw9YlFbLQiysBE=;
	b=GRx9xL1EP6uHhzc24QLie6R3F6QHVl33m0C0sgyy/Vmn1F3qivbdaB7kR5hYaThS5L7H
	 Fg6rEkRdFyEW8G9XL7mm5p2xDuqQuWJji4gcVBxjo4u+FEAMXeDm9PVlQu32B4LCy7Mcq
	 e3W/JOR/4E1vBqJUyVkxrVh7ig4kgT56LleUr1RHGxbvCl3TXikeCqjb1+pLC0erpqfOp
	 VhilMlAbFvvpPM54Cg/K7ZE8sDQ5x9ddX+a82dHMkTCv2+yWY47EmGt8VYptPKqxNWU5I
	 J95yPDlpaPu3ZKHZZmddQbBEI20GT7+Xd9pQQsFTRrMn1U7sH2BI4CLsbDo5+dtudYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Za6QAeWa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.39
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD769606A31F
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD769606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Za6QAeWa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLcWxVU6NcUzpcCajT8ly7/wIZp3UYTmyhapzY0PxBP4CHEQfH8qOrPT9pIKXHLD8Z/pg+ePw4woDhrQunZKCyC3RCsuidOsvipI5LUA5utMTrDnivgOnxkHnMJ0TnD34sVi84GhNLaT4af9MrAVeQrmKKnVvaXaHZWQAUs9GABk3fX0hPZAuDOcrbdswsXQVkeiSX5aRycma9qx58LWq1zX9QYgOE0vL5aYkg1m3VBTWDiToUySuJ+v2iE6bu+tRIkLNjhbMMkq1VSarZSICQG0JNQyuKoTLxJe/Gx4HeXZdCgXn4GGtFu1fB+/S0X+k/wQyXVWJwYpGYMhBdzwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJ+x8RRCbHiFR/YafKTdK/0YFRFmZDw9YlFbLQiysBE=;
 b=oDL+pLJIOLL0W26B40RcAztHfnyK2HYUwyy76hzGpv232/CIWXbNBIlalttr7AvdSHAI1a9C1p4Z2VAJ912XrCLWRwT1h9x5iBlNPvYEuvh/7ny1Ty9+CpCAGjTkr+VmQRmu0z0yIPDubT0RmFDYJEWiS/ekB/zJNzAJ7+ouSZ3cA9dVGVmtbIlwZxCEIwlY+ihcbXDK3v0DD5ruiQXvJg8rDoBx8TvHMyHAcp2MHbhgI30cj3gNoJeJAtx2RcHfsQGqzlUmmnmluxS1yamKF7yGa/0RMady5yyczF8vb2zqQgBqF753/Lgjr7kioLov7Ij717iNOQa5h2Iqn9WVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJ+x8RRCbHiFR/YafKTdK/0YFRFmZDw9YlFbLQiysBE=;
 b=Za6QAeWaR6i262gXNQ5XYgLyJoQJNu3usG3OJ1PAD1kb8SwdY/buKTGWFLmjum87bwzcIif3cIy8bR4WVavj8ta20mCy4Tyd3x1WFiDL6pLH4meCUwdIe3QEdSbi1uuNg/uoHLHwG42eVccE6l/ywbxT3pCBVSAkDsiZT66i/KA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:37 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:37 +0000
Message-ID: <87zevysf07.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/15] ASoC: soc-card: move snd_soc_card_link_components_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:37 +0000
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e32d90-db04-4c7e-ca44-08df34a00fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261009221227099003|56012099006|10067099003|261026140227099003|18002099003|22082099003|38350700014|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	LFpJHwA9Z++JinT6XdelFr0zPLPl06cTzSTDXZq3mgZkTWLIN26i6KNgGuDlFfu9b9fiWgv3wfkRQ/Hu3yYm6lQPM32IUt1rZjo+ZKzSEMu9wJvdssnVIb3gtGfVJAmsM2Xfg5HD0hOFOtqCsmkQzGy5ofrUOb0ll40O5dRpXNtsVEx1sLq7Wx9c37f3kEcZ1OdnTiwKbl9ioZbHxnPhViPdM9+W8DUqYr8JB5G6u6AyAw23ns/dknrtqc0oXfhtxs9W7qeOerSy7oCzhQOkGpQSM1aPQMFNGai8aiL/g5tUtz0rPryl9wwCdsIi63Do4GyStJn5Z7adYzTgfv13H/1i52A2GBLsxuH49RKClfD5CUvM3Zig4V/3svtSVomFEBvfSxUZnBELqmqPgyI6sU550LaSUdnjOl1412RPtOAUTL+eAJZ6dql3MuQwhwajB1TT07JOjOq3eEArlVL4kjT3V+WuoC655J/C6/jGSPotQE6op/4+fxyMKD4uUUgURpCgtrRlypTtHhZb6YTyxMlpx52hapHTQT9Js72y7Ti1o7hlln5xkm63ttoFN88fVJLVe1tVKSAhaFj8WL4eUFnjm9GlBYM1b0vOnCLRIGLvfAOaVf9up23sCYOlafyheR4aiZJyTwWcGaryqiY+Jeclpd54hgrQ3CHz4pIaWqGgvfbgNEc+xzk1owkOi9A0Bz4aq4d314nlPwmJkSrSVcP2+hVMeQxGXE3t9hS85Ss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009221227099003)(56012099006)(10067099003)(261026140227099003)(18002099003)(22082099003)(38350700014)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ijs4yuu3SPmniHgriFMQwkoXmpJWnIgridTT+Ks7PMavwhA9MU+ho33/HyBJ?=
 =?us-ascii?Q?+cdvsthRc+Wcxh3YZQWecOkkDF+rGIkP2Mpm7eVwl7QhM3NK/D+VWTreGCTo?=
 =?us-ascii?Q?SGf9a5bcpjZaO3eZcI2BRotO41wxb8OGRv5WLFFN1K9WFgPWcO26yUO2ZEKP?=
 =?us-ascii?Q?p4AdYkr/U6GLBoKr2jl7QLyLbVfcs0Wuqh7zC3u4TLRIBpWtAdx81DlEOT7r?=
 =?us-ascii?Q?6BM3rGPycwg+7Opye5R8QBwenVsgJxrataTEe3cSNeYetr4teubciHBygVPg?=
 =?us-ascii?Q?YTHVM0Ytr/lqmT3p9KD8ye5Iq1u1JVFIk9Tnkm9DwpcwMHtUsrghDRKyHlUl?=
 =?us-ascii?Q?8jS+spcAYFn0h7ggeFzxuyL1BXM5ZmWdQAPuX6VZ+zKwDYF0AQEh9katvcU0?=
 =?us-ascii?Q?fhlCloq73YU3vdCnvo/XUui8swr49sGjWUdLBDAqq41zZkYQ4kgjdTdppgmU?=
 =?us-ascii?Q?2xm8GXYSqTCJ/yVudm+StU7AgLaEvs+CT0alFDMMXQwNfzRIM0/yxruuVpxn?=
 =?us-ascii?Q?ehYlYv06MACvOiryupCxS0mAahKlQIpi1TwMucjsD1QznMigBawe03UAjstB?=
 =?us-ascii?Q?odkxFw60KLSg2xsavU59Vk9DNBDgQvt8rWhTr4ftzNkrEx6Gj3Iiw7oJDMtq?=
 =?us-ascii?Q?BumQxc8eUcaHFPzokw9neE/RuD3jqr/6vOWisgFr3efbHaXtrV+lIF9zmPhe?=
 =?us-ascii?Q?TwLBFtzrDyADeF0qYvxbM9p3/CUh7s6fSrtE0Umr5dIfI5YuMf9ZTU7/FGbv?=
 =?us-ascii?Q?ZEZZ3PcAH90mFvjjTg4lFteYHqDGIpEnDqlYsRhv2/ZzrNIu/DSR3AFxL6rV?=
 =?us-ascii?Q?jz/TESxD7Dqwhm/6h96Z1SGWUAz1ZT4cKxyCKy2mBMMMCTlhz1NwtJjuHnPD?=
 =?us-ascii?Q?RfHFEhv2zj4RH5tOzuzqhnp/9P6++o0I4HMhwmMoGwU2ERplziv66L5zovMK?=
 =?us-ascii?Q?R3Z7234Ngw0fWymQ+WCP3Zcojt8oxySK+XBi+gdXvoHPa1tCtw7MeojLtpK9?=
 =?us-ascii?Q?em0+IPB6vSy6CgULVfn1Z5NwzUbJ5KyNc/PU4E25Mu2fY6h6q08vVpPEuhra?=
 =?us-ascii?Q?uKgnls7XKDNRmWBkFuq6n+c4Ym+NQLTOxTpXvN5X2p7cVNUV/B1f5dvDeb9g?=
 =?us-ascii?Q?MvCuux/ZN0KOwUyrJQfrJwDpdn0VD3bv4Bp2lfDiaxVS8eXQDYE/jKqgmB+Z?=
 =?us-ascii?Q?4Xewpfwb46uI5HfPefC82Ycje6irEWMe6dgSa4wXvFh5HS/GvvPzxyiBuae4?=
 =?us-ascii?Q?UNylptfFiwH+glNDFp+bglVjbMuJMoGAKZzDqLr4W2F9t7mD7UZYl6u9Xh6N?=
 =?us-ascii?Q?/YV/AhJNtKsAatLWIaFUANzoxz1KFIY7KeGMbmuH/9JMQmtv/r5vqbpp/JSC?=
 =?us-ascii?Q?uR6u1rbvybpS9mMi/oeN4VgjsheYMJIFj/np1z2R8QMBaASRlRWxhEvf0340?=
 =?us-ascii?Q?2YV59WUifII1Zyre41MKtTI9xzdTz5BJ/p0oYPF36WH9jzvhI/Ee30eIAnPV?=
 =?us-ascii?Q?JEA0AIQg+mm9I5hUN6iA3tRgY6yzDG6o7u2ffxvziJ2HSbN52ko/vnFW7YRM?=
 =?us-ascii?Q?Rn6TLPmnaQCtbetLyNbeAoNvJyIkpocTFvLXfCAQ0nEY/NmCqmx74GaaDn/p?=
 =?us-ascii?Q?3aW+kHV8sU9CJZI11xq8YC1E8qrua4OPjLlZvWUMgN0laYkqdYhW37NPX7DF?=
 =?us-ascii?Q?SVeYk2nHoZwokrFEKSbUEDYo1DxK1JSqlw8zm0HUAub83yQ73u+UHhJk5knN?=
 =?us-ascii?Q?yvoubrDqTEHVDdpbZMUlefr471Ey+uLN45Az5GOH+cAvdNnehze3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e32d90-db04-4c7e-ca44-08df34a00fa7
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:37.3337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTcJj/P9V9WF0SXwfK8IIlOAn/AkFhyL0vBH8O1dyvFoVGqgtMAEhTmuO8oeWVXJalT6F3YfVpd3TQvGWAPf4YJ0CzvTZ0rdGMMdEs0yxXCxz6/3WCH/J4qQnaG0n4jV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

It has too many local function dependencies.
This patch uses temporary funciton define at soc-internal.h. It will be
removed all funciton were moved.

It renames function name
-	soc_remove_link_components()
-	soc_probe_link_components()
+	snd_soc_card_link_components_remove()
+	snd_soc_card_link_components_probe()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 40 ++++++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c     | 44 ++--------------------------------------
 sound/soc/soc-internal.h |  2 ++
 3 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 1d16cd74eee90..65217ac4f699f 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -196,6 +196,46 @@ int snd_soc_card_link_dais_probe(struct snd_soc_card *card)
 	return 0;
 }
 
+void snd_soc_card_link_components_remove(struct snd_soc_card *card)
+{
+	struct snd_soc_component *component;
+	struct snd_soc_pcm_runtime *rtd;
+	int i, order;
+
+	for_each_comp_order(order) {
+		for_each_card_rtds(card, rtd) {
+			for_each_rtd_components(rtd, i, component) {
+				if (component->driver->remove_order != order)
+					continue;
+
+				snd_soc_component_remove(component, 1);
+			}
+		}
+	}
+}
+
+int snd_soc_card_link_components_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_component *component;
+	struct snd_soc_pcm_runtime *rtd;
+	int i, ret, order;
+
+	for_each_comp_order(order) {
+		for_each_card_rtds(card, rtd) {
+			for_each_rtd_components(rtd, i, component) {
+				if (component->driver->probe_order != order)
+					continue;
+
+				ret = snd_soc_component_probe(component, card);
+				if (ret < 0)
+					return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e3664cbe67059..e1779b2b91476 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1076,46 +1076,6 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_runtime_set_dai_fmt);
 
-static void soc_remove_link_components(struct snd_soc_card *card)
-{
-	struct snd_soc_component *component;
-	struct snd_soc_pcm_runtime *rtd;
-	int i, order;
-
-	for_each_comp_order(order) {
-		for_each_card_rtds(card, rtd) {
-			for_each_rtd_components(rtd, i, component) {
-				if (component->driver->remove_order != order)
-					continue;
-
-				snd_soc_component_remove(component, 1);
-			}
-		}
-	}
-}
-
-static int soc_probe_link_components(struct snd_soc_card *card)
-{
-	struct snd_soc_component *component;
-	struct snd_soc_pcm_runtime *rtd;
-	int i, ret, order;
-
-	for_each_comp_order(order) {
-		for_each_card_rtds(card, rtd) {
-			for_each_rtd_components(rtd, i, component) {
-				if (component->driver->probe_order != order)
-					continue;
-
-				ret = snd_soc_component_probe(component, card);
-				if (ret < 0)
-					return ret;
-			}
-		}
-	}
-
-	return 0;
-}
-
 static void soc_unbind_aux_dev(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component, *_component;
@@ -1474,7 +1434,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 
 	/* remove and free each DAI */
 	snd_soc_card_link_dais_remove(card);
-	soc_remove_link_components(card);
+	snd_soc_card_link_components_remove(card);
 
 	for_each_card_rtds_safe(card, rtd, n)
 		snd_soc_remove_pcm_runtime(card, rtd);
@@ -1575,7 +1535,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		goto probe_end;
 
 	/* probe all components used by DAI links on this card */
-	ret = soc_probe_link_components(card);
+	ret = snd_soc_card_link_components_probe(card);
 	if (ret < 0) {
 		if (ret != -EPROBE_DEFER) {
 			dev_err(card->dev,
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index e95b34a7869b4..c441268fb848d 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -25,6 +25,8 @@ int snd_soc_card_init_pcm_runtime(struct snd_soc_card *card,
 				  struct snd_soc_pcm_runtime *rtd);
 void snd_soc_card_link_dais_remove(struct snd_soc_card *card);
 int snd_soc_card_link_dais_probe(struct snd_soc_card *card);
+void snd_soc_card_link_components_remove(struct snd_soc_card *card);
+int snd_soc_card_link_components_probe(struct snd_soc_card *card);
 
 /*
  * In soc-core
-- 
2.53.0

