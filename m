Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E414C92
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 00:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741134253; cv=fail; b=QvFonFB2V9dLAnElswTmbcBsgI5Rr85JGLE/YJ1xaIXrAGLbKvADsbXEUh10DRa458tgZ7wAPLcUJ3bjx9O72BMnD1IxJNV1h6tVZ0UiUlqXP4LOQ4YFKKAddD74vsi63h+11F9kRDwtKs/6G/LzYBn2H71s3LJiYr5558FHhpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741134253; c=relaxed/simple;
	bh=VOTRHPeihGZoUg9kY0fcVMlOtiRWP9OlwxTzQrW5U6E=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=VsglFKxcsICY0GJEjaA1xxZJOhHqrxevvO677J/kKgZMUfhCdHdDuMxuYvyzJEUxrEv1gD6YANP+Xsk+ysLMQReKbPNP2rWkBmy8TDQSCB+H/aKh3G5Y9HHQ1ed7QLpTcD1XqY64IFy+dMzAFuH/H33rXGbZa8Jt3sXDoIkG8nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LOGBg9K2; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LOGBg9K2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SC4Ij6NrL1XTLigIQkaWguAZriWw/sZfSLFfp1zCQXyxP3qcHpHuVX8YKNscMBk43wGPsyy3fWZBnyfP8C/pJ3Ah0ttKNMwx5oMEq6/T2K6YP1/RotXlqKO1KTbwfsTQH0zZThHh2cMOxBJDjoAgnGFhaUYZFD7EsIuNLhB/RT32u9eTQgyVs5/wQARgVd01+HvKe5xufR1BIieM4XIOl1I0Cg41QknLrH5HJ13yzhD0vXC0CWzB0ro+Gc6L5cvaPgTJu0ik52K/Fr9JTytsp5svQtdl85qRBSNJiPZnjN+nUxWFlhclmgynQGnChyCCU0zCIyEdwIsVj1us5B6Wow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OU2PlR6x7f2FcMmiE80Cc4/ohOHJovDtMRJThgc6hMQ=;
 b=YiWttdilbyOBE3A1oK/uPWD5iHhuLbofMpVsUotLptMrTRf9OexWNXfoxGkJrxlf33Ov+km283J205AXoYhwNn0LEsLMwkQAy48QxjPXSzgxBGG74wV1pZJIAD/26WRgp79O7l/7mgto3BPxRTY1gJ9jlhOML718OQfpi/2zPkFnwykq0lt9mIABZk8wTldnSxwOUEoi7eWs/TS0H3Zd59Fa7IQ37oUws0W0u1tLkbUQdHm0aRMykQpiSirtE7FPLd+fPpKPNH4jWXf9slOYqTmQe6GddspoNc/GlnQVT6ZES1AVDz64WCSN2F6GRY/y8MFhh8oqxEohVuBRmD5VBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OU2PlR6x7f2FcMmiE80Cc4/ohOHJovDtMRJThgc6hMQ=;
 b=LOGBg9K2ei+kvKD46SesiVUTu/4lVKwr9KAkFn/x/m3FyMEpS6RuXkqkgsbSQ9O0CQ+zI/VNS7o3l7OetERfdVx+hl0SyhXupQySCDAq/lay0CjBWc1Y1gu2b0KeYM8jGw3rLUq8n2iUvI4wzFrCbV9lYJdPnMpDnB04JH/RY4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8378.jpnprd01.prod.outlook.com
 (2603:1096:400:161::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Wed, 5 Mar
 2025 00:24:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 00:24:07 +0000
Message-ID: <87tt88z5nd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: doc: use SND_SOC_DAILINK_xxx() macro
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Mar 2025 00:24:06 +0000
X-ClientProxiedBy: TYCP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: 9666418a-5e34-4d5e-9de9-08dd5b7c0aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nnPlfl+ySghIB8scTpSZpH0Xc/DO2dSoOzHiSm0btmmwG3XdeZmoTADsuNw4?=
 =?us-ascii?Q?2iMS3V3AV9IVLsWPtjnf1jaQLLom/UcNPNPhqq+ngcftGleSweTXGW2McoD3?=
 =?us-ascii?Q?lQcPY026BL0qODMSawIE/bzyqs+pEAAWaZmG6mqZ2diz4/UIHEt/BDbT9dtf?=
 =?us-ascii?Q?tIRtIHhPDpN9ZjkFtq9X5GleWUX1SU1PvseHw7TDoB+IgjjmWD8WNqy3Oprq?=
 =?us-ascii?Q?FVw4kDBpA9rrdBDP8mN+NPlBP4vwfhOjWr5X8tlug8TRM4VftEMsYMKX/UxR?=
 =?us-ascii?Q?3wPzAN9Wd9EReJwDR/csrD07Qg2I+yzjtw3I+TSyNjAgRNppd8VNB00k6CD5?=
 =?us-ascii?Q?nEfV4/Yv0KufNo1AQ+Vo40a6mRTbETbkzRIVmS6HQJxsWbuF5EkXR1YFxjtV?=
 =?us-ascii?Q?GrVIhklZyLEIbED9nMv5AkqX6zzbBjGVGplhm846EUz/PyfyqarG+mX6F+0c?=
 =?us-ascii?Q?8SJ6fux7B9r1+f/tV/nNPB3b/U8j8A5MKa8fnVTNlFupXUuvmxePNxcFzNA+?=
 =?us-ascii?Q?GgLiAb0ojMdRSMCLAo9OWBXX5UyxC1Sc2Bd9dK/kvYg2+IONJ1mE5hC+bI3a?=
 =?us-ascii?Q?BREiqPu7toH1tbMvq8cVnZWYHL/OEV5ShtosdMGCPM17yF7OXMvx+5we3Zix?=
 =?us-ascii?Q?8c/2bAvib+sa55rkZ+Nf1mnLN7pKecYJchPfgg6wGUKNWaSn4D7fJl6dNmCo?=
 =?us-ascii?Q?M/U1pzMF0Eebe/ISwzjcHcRYFdS+dmxdT8yKUzwqzga51R9mwaVYCqtwiDG9?=
 =?us-ascii?Q?UGdL0jhBpUxVWIuKfFTo+9yc3HBFXphi6MnryqW74HAF1hTuGRPussLeTvMX?=
 =?us-ascii?Q?EEsAU58WzMwA0HXKnztI3ccDTWrG0FyReHUmPY3W7xxqs8zIGrh//a5X0rMv?=
 =?us-ascii?Q?iDmoPeNhrgQouCHsmEcA0fQn1bna1vH5RXYk+Pc2VOTuCNhBfMmitS71W6+z?=
 =?us-ascii?Q?eiZhXqksLdl/TDUjUvEbNWzMogAMm6CPYT2lFGIx6C0yB1AwhvGMs/NeYyhZ?=
 =?us-ascii?Q?O6wXhqBAte+ia2xgNXfVMrsOW48207XgURMMDUL/QDGDaDLAEEC87wvSmrFR?=
 =?us-ascii?Q?Dc8Ji7dwXahs9+TTcExcjImR0K0jc6DK6qwyogLcmSx93DAxUjk1UAVHAOnu?=
 =?us-ascii?Q?n/xVlorwSNx0f1WBiuuDKTEMqBGvQhvWWavm277EQVyPkivMFd0xpg7AEOQi?=
 =?us-ascii?Q?9dh7zsB0bVNngJUPZOGjPUlmo6rcw6aTx27oAW/BQqidOrEoqvvRkBxkiyMO?=
 =?us-ascii?Q?4IC3mXvSMWjlQxIPCm/QZYujn319C7VEk/TysFjy65QxRscwkcv1EtRfs0LQ?=
 =?us-ascii?Q?WORAclfJkbd8EUqANJ9B3enwZ8dyLInxBQXiNdkSjLcz+6c60djVmPLvBOwM?=
 =?us-ascii?Q?hhYqVEMj3VR84WT4nhlW0QGIPNU3EwDuMgadHXtbbVs6b8iJPUGnZGd1kpvj?=
 =?us-ascii?Q?CluasP3WbWq4P0Tk4EfUAD2Qfjwzjbjn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XqypsXm9GP3aq2L/dZld3UsYQ3p6NbEImb9fgs33r6ZPrihV76JNTC9ySErk?=
 =?us-ascii?Q?nqbd/Sz+sGFDHuJuqi1duDaw1cdTsyQHSjEsTdSmTI6G32KV4sXAWJY5OUKG?=
 =?us-ascii?Q?tJhsto3jRVPukFMiF7GM6oYX2h6rNjsUlcW4/R01N9UzPrCNsv9yH5nKUeyI?=
 =?us-ascii?Q?iHJoUga9hMXwY5RTM1QKi4Ph5laWjCYTnpE20ezFs3pQUXS5gRzFcktj77Ty?=
 =?us-ascii?Q?qPx2393xlLDr+98RaNHO2L9y6TWIqgi09fsVAk3MP00Yxpl6kjdtWJOWOe8E?=
 =?us-ascii?Q?vzElxNHTiIkEw5KVlKKebX5PkNJs4u1+UkVDOimr+fMLE6ALU6dlHNv+eMIA?=
 =?us-ascii?Q?7Yr0xYtqwDuLmNXQSSWshx2r3tDvNjTG42m0fOTRxIaCEykmSDbLu9j4cTJB?=
 =?us-ascii?Q?rPu0XLEIYuC4/PjuMxVwaElAIjA+OrJZ1yu74E65Fxf3v5Xi/fxE2qA1llqW?=
 =?us-ascii?Q?59YOal0/VSUvpSFQkRulscnX0gCfLw2mQaKexohXpuFUnA7XsPp1eOvuwMwa?=
 =?us-ascii?Q?BGYCK0sbzQdxtX9kOAItwheRm0+W54JgknkwqZTzw+nIjGpmT2WIokIFvkZ5?=
 =?us-ascii?Q?xSFD6T7wSpBubrluozI7fpwgOMfFfXKZ15adBNOF2WmFlBNNVHHwr/nFa2L5?=
 =?us-ascii?Q?feYV+1mkNDgpaU6QeGph/mvFKVl82qdvaZvaUiJPKh4/DMlgqjvm2uPv5Pzn?=
 =?us-ascii?Q?7JCm1jWIkaPAQN8bNdAcU+1u/rC2fPE4Ghp41IQ+mttcgmJOtKD1/Lde9RSL?=
 =?us-ascii?Q?vDJ8gWVRTRS0Vj9t5r1eHe4ZlN58ScRd71FvLAgi2Abg/ai4r+r1WaOW1IsX?=
 =?us-ascii?Q?bj3G6X8U9CcfMBUpseNbxJFcGDlLQCyKIWPU2stNNK4twX17qxY3xRMAOez2?=
 =?us-ascii?Q?quN0tuyuaxEdJJ2xYfsP0XphDgh3xOJhe3bdn4TlCzLMwi9+LQSYI7Q9uNaR?=
 =?us-ascii?Q?9cOpBHebeBMcFmw6hleDkXBuHyQKK4cMjxKKB3YmgWX1yyez8OqLjTeiM0iB?=
 =?us-ascii?Q?ZldA3jJY9GFhfuZTgeAJlly/njWFxoTYJJ9mDS6njUVmqeJaf59GmKyj3IBJ?=
 =?us-ascii?Q?rM3iUv7j9VRSLH6d3i5G7x5ofo7KhPF/YtO+pVcn598RhsYzryKOXPOxMlqV?=
 =?us-ascii?Q?xy29KHhiANw5wXnJfsPU2yvsUoC/t2J/f25VPFS4ylIzkGueAx/pJgPqnBBq?=
 =?us-ascii?Q?tPGwm+hpLjqc1kahPgbbR+zsPQY04cEMxwOdE9fXY7n52NTKTPSNTbJTbPfd?=
 =?us-ascii?Q?1vdN43NyKweFfhaOEZwGg6DeeZp097w0PAIaF7aUEbpq1syyQ9nlvg9QKLtm?=
 =?us-ascii?Q?MR7h1cWswydKhkR8AHHavgmD7oUp/j5LVxwtP+6oumJUKyFiqMiA+IjZM2cb?=
 =?us-ascii?Q?NebNH3PcN4f3NGqXtc+gOpIQ3w7kEpdVHAnuSvWP1SYTR/+yv0963Ta6TwbL?=
 =?us-ascii?Q?m+Vb8E1sXL6Skp3Hc6zEGGcaXGKX8doMZ0PrUxWS0eaR2TO37JqmZQw0nMf3?=
 =?us-ascii?Q?SDtpfqrgDefYZgp2p/S4VQDdV6lbbx0q3lskQnO0Wvw46rAnwP/iRuYHrpA9?=
 =?us-ascii?Q?C2bzYSjHQpdHNLoQDwagTPiuRFXErgbBPwPhQH/cLBXDiQmEHoKsdA6UrgqU?=
 =?us-ascii?Q?nO/1Vej246gpEJJjBOpnMVk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9666418a-5e34-4d5e-9de9-08dd5b7c0aa5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 00:24:07.0407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Nsgc/8ohFBq0U0EKWCKSe+1Z4/C7iAFtSQIg4/RP6Odxq/Mk1Vvu4x51FZ9F2DyoL5U/ZX54jIXUx8lZ6bYZs7zaAfNOYP9k4YAafsf3k41jzn7+3DD5V+YAb2qsN4w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8378

We can use SND_SOC_DAILINK_xxx() macro to define CPU/Codec/Platform.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/sound/soc/dpcm.rst | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index a12636552f50..7b6aeab3c207 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -147,14 +147,16 @@ For the example above we have to define 4 FE DAI links and 6 BE DAI links. The
 FE DAI links are defined as follows :-
 ::
 
+ SND_SOC_DAILINK_DEFS(pcm0,
+	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("dsp-audio")));
+
   static struct snd_soc_dai_link machine_dais[] = {
 	{
 		.name = "PCM0 System",
 		.stream_name = "System Playback",
-		.cpu_dai_name = "System Pin",
-		.platform_name = "dsp-audio",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
+		SND_SOC_DAILINK_REG(pcm0),
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 	},
@@ -174,15 +176,16 @@ dynamic and will change depending on runtime config.
 The BE DAIs are configured as follows :-
 ::
 
+ SND_SOC_DAILINK_DEFS(headset,
+	DAILINK_COMP_ARRAY(COMP_CPU("ssp-dai.0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("rt5640.0-001c", "rt5640-aif1")));
+
   static struct snd_soc_dai_link machine_dais[] = {
 	.....< FE DAI links here >
 	{
 		.name = "Codec Headset",
-		.cpu_dai_name = "ssp-dai.0",
-		.platform_name = "snd-soc-dummy",
+		SND_SOC_DAILINK_REG(headset),
 		.no_pcm = 1,
-		.codec_name = "rt5640.0-001c",
-		.codec_dai_name = "rt5640-aif1",
 		.ignore_suspend = 1,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = hswult_ssp0_fixup,
-- 
2.43.0

