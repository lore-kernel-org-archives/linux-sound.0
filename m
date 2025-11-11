Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B916214A9B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821102; cv=fail; b=b140TrGeRnOdge81/ObiXQC/UzPceMDvshcPqnS1w/IV56yHiAInmtKymvfnZ14FKAtPZae/6LlbmbJvjoBcesGSgPUWnrJcyMNs1KWuc2rRA8LlzbYg17+zBISVvCiebGr2VK8P2kW64bcFv8JQUcEEGlNm6RSv745DXbN5hn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821102; c=relaxed/simple;
	bh=r92Oe5LGhBgiJJ7BxMTIslfxhoGm4XC8WGkmUdBStKA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JwevEsu2vndMoHQkrUmuWxgyJixW0dW/SoAy51kSSz5HavS2AA2ZRen1LfTCsV1NHWMIGuyD22B+atLHZFhf/gmtw6av0zsEkJjqpYScqZ+ja8nH9MIA0kZ229FbuG1Rze7HQOhuoJqYb3oz4T6A8rJiCdxpnrY12V9ik+vvNCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PuaFD3JN; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PuaFD3JN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddOfv8y8HWtzPmQ3+SDeKoPMnLXAzPEoKcV7+FUuaP6M0xICUu0msRVKwYojr1ae46PwBUfXKN69SqwdwdTK0c7QSgIMhqeuEr/oNLp10LQTuoKH6EyoYfkPPzradaOwJBM2Muulqx/8/ytw9kMrWW/HM0ARjU+vPGvXxC7FK8fAbnCMQ/OL9Uxii4foGcCYEjWAQXdJfEgJyYf+5WRAJnfLtUWyXepk11PEs4tje72aNfeuj1mKrmxSAxnFBW6SfY4VLKl04uHsy+HgXSI37rRvkYTwk0n7dwS7Qu7tA0oIg3zhbXeLpENkUZcVT/5+Bp/ism4PdQIJES3dB6ITPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mh+X0hQLlYXXFaOeVXbp1C8t44dZC0tVV2M8dMh+9B4=;
 b=dIt6yE+1hNI7CO8Fo5N+mtg6noDlvyKPolL35UgeE1S4/s7lhw+uUA6yUZi0+oPcNZ9cn+6e5TA2i2YtHgsL8ttVJr18lGUvYEzsfuaYCsr1a+cJvWiaTDlcbUxh7ff6bPxFdPbn0Fb/kBeO1VOjypy1dseN1/re7pJFB7bgExSnd84n6Zas+RaS5EsPvdwgw/aeBVm0Jmx7PbzcfT0IJBP9UHGNY017zaL/xnAB9r4NS1ynZZEbP4NEYC3+83GSMWg+KlE/06FtiedSwGJbCLX9PoLP61UL2oYmRyxrHAvITIqmW9xGoaLtw+dgZqB4d7646UodNIQM2YZbpDLqEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mh+X0hQLlYXXFaOeVXbp1C8t44dZC0tVV2M8dMh+9B4=;
 b=PuaFD3JNyBlxzdjMdARwq7NmJ0bKPMK3YfDszKxdliUMAPBar4C9s5LoZPnd4bId8vyIIQxvems4/BLoT8Hux5kQT76n/Qg0sAQm2gOLvLGCdIvaj/97BCPLJnF/OuCdTi71Rbaa5utG4nNTGtc+GND2YrPw9eCqkCNxRVv8USw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:31:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:31:38 +0000
Message-ID: <874ir1xvdh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 205/292] ASoC: intel: avs: control: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:31:38 +0000
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: f648f724-8c6d-47cc-85a2-08de20b9ad78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xl706o1GeK/se4kA1PSwi5OOIaq7oSztE3xk0xA78YtrK0Zd3aXr72lLv7fc?=
 =?us-ascii?Q?Xb3plWOwpsWNWXHqxaK4Sq4R2l4nvY5VCjaGP2BIXI3mG4eQNWMpPPRva5IO?=
 =?us-ascii?Q?YLwvF92S/QmB119+36Mbr5XjddDSmx67WJodlf0/U0p5EzPTQrKNTGTtj80E?=
 =?us-ascii?Q?uHRrV4hOgNqp8LLmwlzNUadvO3Ow6/r6f5XDZVI9wGE6djvSUQTpxxVmY7WW?=
 =?us-ascii?Q?ItboeEJJxiIEwp308eROwDSjH0KFX0q26jIQBWI9aSk8PT6nbIZ4wFyd6xsY?=
 =?us-ascii?Q?lskPC7AdZK3FSe9BiPKjlvpXPE/RilEd/HA5miD2Ivlz/8yaMv+WeuROYpT1?=
 =?us-ascii?Q?t6m3Vu/wumGnro3vDaQgDuHSoWcau1w63MCIoe1LcOiDNS3szwXh98ctM8cy?=
 =?us-ascii?Q?y3kvfCjrZpLUPz9PSD5SUm06yYxrJ83gOuabK/5oA51i6rvPZKOghWjbYr/j?=
 =?us-ascii?Q?mrUzzoYWtH47WYrcSyfz9sXwtQ2B5cEof/jHsQUZyEsCVfNVksCO6IL8qPFD?=
 =?us-ascii?Q?48C+8umtaFS/uJhOkutvgc/E14nCIZgXm82v1DtDujUWiui8wrOyl4Ir6F+1?=
 =?us-ascii?Q?YhJF/2L5yfN2cQi0riIPzXZb9Wu0JEG6OjLFvBoF+nDEd087qVByhJOaYNrg?=
 =?us-ascii?Q?+UmPLejPC7SJ2qSLMZbV62ZJwKNPAb5aXyqsh0EVmAoXvh4P/FxeDGmngsFk?=
 =?us-ascii?Q?iUzpMuCCatEG44/3DRUzOaz5jvsBPsZnA4d5c+8UFf1qvSQ61mu1kMpJoiqh?=
 =?us-ascii?Q?cGO6rDKh2yWUXbIAw/OaPC69jOXyYyB+AEVha6lGwSEQZr6+FV2EyQT3VG8G?=
 =?us-ascii?Q?gkBBcEZygeHLQ2LProtVijtC0cJjHlT6L/2+slgHjVGQcLaiaudhTAwdM/83?=
 =?us-ascii?Q?koPfpvjuOs0yeaLbkK2eUPjUGsitQ0xPEoNcQBygB8ebb6RdMHEOLRTCzxhO?=
 =?us-ascii?Q?X5maUYY2yMLyZXCC8tkr9RmYrBtuYqZjvFONsaQlckOjSFhX2nV9XC/p3pkk?=
 =?us-ascii?Q?1U6gIBuN5Rd74zJWxCPYpE6b/sgbzdLsAyOiRC6h070XwNdDLVrlNrFqKBcM?=
 =?us-ascii?Q?U3SfKH7+c83zJ3YbdLWCIk2mNMWJ24wSVwbGWgCPQFa/U68y2SpiKvTLfDHR?=
 =?us-ascii?Q?f25NnW5Jt16uU4n1YLP7XVMUnWw6Anje39du20wcrJ0mjZgh8QOY6fA5huAd?=
 =?us-ascii?Q?NXgLvEUG+Cw7GrqKtYiKaF1uniKrnfbzlqH/dhmgbEAjMz6HMmkN0R77NLV7?=
 =?us-ascii?Q?iiBLP1r9B+7374gbGD6Sb1JvpVnf0AoJfpEdHR5L/8zl52dc9Y3gs+iPEQfA?=
 =?us-ascii?Q?Ea2sAc9swYSNvn9KmGRkaYwTK+rmQZ9eyriD7NshyV9WZghbWC7ubSkJFRqK?=
 =?us-ascii?Q?9LK2nvME67Dg4Df4a929lhR5j61ZdTqWPIOGhdZrbaBWytEkwp/feVCa43h+?=
 =?us-ascii?Q?XCi3zddHl90uWdz4+xgORiwXEKwvKjMrxq4iWGk5roxpCfUb8yupl1RZe8Ay?=
 =?us-ascii?Q?2CF6gnUoL5zNnDwXIq5FegTwRRXFMOqIsoju?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bf3vyeDypNeOh3gGJcRo28VoVOVHcjpqHS41ReUa0okxRnTRS+Cz4Xdp7TKp?=
 =?us-ascii?Q?TVxZR8qR00bYWfm5yKj+qKdn4W2sDExPfef7YT1lpU1TBFkGtX3/IyCqrsAB?=
 =?us-ascii?Q?AIse86ZJ26ql5cgGncAiDSriPyxcrrnFns4ukQrw1WIbGAWhqpnKXNGzKz3C?=
 =?us-ascii?Q?agGiEuYTWd5tiqOcxjlIHqojhRLqvhY7SoeKELHBpwb5Bcny0GT8DoTygM38?=
 =?us-ascii?Q?gLALONvmhvYoSAgin6IUhc2pYoBMtjYRPTKuKKN35gFNaVDgUzQYDnpF1VxM?=
 =?us-ascii?Q?tA87nh8SI88Jn+S4QcGZh2zY4f+5YeYkhaIXAU1p0rwOra57V9Vc5VePcf9K?=
 =?us-ascii?Q?KmIliKbqwq+PgNptR0+gyNkWStJEmJpZu5DjTzVq0ujoxT3kkwG/Rp1Qq5Mr?=
 =?us-ascii?Q?1dHdi3WVp4mWsJSM1ehUNr3vO4U4dLg3O/erz1qdTP7BXqZBBZWJHpsEIeL0?=
 =?us-ascii?Q?js04RM8+DKIf8cmM7mIOFv90k242aj7ti5ymGP7DuZ3udEpUHBsoa+17E3VN?=
 =?us-ascii?Q?NZI6b0JyXadIz6uJ47ZIrXrxdHuBNfMePP2BTkq9ncbQcFnRBgKm2fL6en8F?=
 =?us-ascii?Q?szNZqUWXywrg+/NJqV77vgaDjMuq0VL2RQJrwPYCAH3zmcUC6S8jI8J3G+C5?=
 =?us-ascii?Q?EFwxN2LfULhugj0Uv6eWLYyzOndOd2Xcd4OZnooNARXhuzVxhgQ948ilv1/m?=
 =?us-ascii?Q?JrgONWwltpnDnyjtoWrGTNXPOHusDySMCk5mnRrwDZI9DYr9T1Am7e/NUTlH?=
 =?us-ascii?Q?ZxGCsclatQZkm/Q7BfHqkhQz4wdyHx2VI/pnpQ9DsEEqx+SEO6NHSPYA8e85?=
 =?us-ascii?Q?9uXH3EYfrvBYH0xA+caLCWPoIELE+URP+kbWijcZDvK1HFWY9JXAPr0XlHma?=
 =?us-ascii?Q?3zjbUPxKwuPx+snMDFcvw7GxUogaUBekrfQfKURDb1BkCGzjaX5r6287iNzN?=
 =?us-ascii?Q?nif9q2rNumcjX6eHTCQuQY8d/8/Hwb2eFD0jvoAxpqpXToj1L4R3AvFJW7ry?=
 =?us-ascii?Q?KzUGAFYuUqZT4NeB8Dp2OTJXfnULkJYnC2ezPajQawEKiaQoMKJGLr4+t+TA?=
 =?us-ascii?Q?BGG7IKXS+CANEatiHhgpVygt3FRItp6OEOtyXqdO+2xzvVDTFsXRIvMT3VQI?=
 =?us-ascii?Q?uFFtuYIIhv/q0872ZpuesHHrMyPGHD6LDyCtDMkVnEc6BOSXGJgdwzUF6W3w?=
 =?us-ascii?Q?YG+arY6JUDzTKo9Wi7PhV6J8vGxATeBhz6HMwNsS5BNgeEurg9BmVRgTBETn?=
 =?us-ascii?Q?GOVH0MqO0O4V4FW8Rd7hTuBsGdyqU6twvDSSfHLm4TV1PnwxbggDRD+FBJQA?=
 =?us-ascii?Q?ymLazc1aCtRP3jniM2vbPyel7zp/4wPKAJgozJfGTO3fZ2ZtqGET1HZdoCTX?=
 =?us-ascii?Q?h+DCXHSxxul4QZPXxWJ0r9edGMczpzG6hgv17NNxvrEaEnRIRzveQfv/vz9w?=
 =?us-ascii?Q?2CzWyz/SywXiNHkns6A6l0itLKZaunQaoGSk/8BR32TEWBnrp2fArQSUBSeU?=
 =?us-ascii?Q?2FHoFslBvQESdGf+W/pDwTmnVQarzAoyQdx8nRruo42YOCH1MI+h5aCgFITy?=
 =?us-ascii?Q?3Kzy/eJTA6AQU39Le5dvQmKS0kFZ3P4Wr+zTZcI11T/ja7RBfCoIRgrfxfUX?=
 =?us-ascii?Q?FzvmCP9bl1muiLxN7sCcJMQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f648f724-8c6d-47cc-85a2-08de20b9ad78
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:31:38.5969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSmSt5U3CTIziMXa9tYq65Pk7b41oFlN7hLk2/a5JWoPDTSi11aL/gvVhP2ym/Unii6dEwez03drRgD36CQEDVFZOfd9wKLluza3KluJ4Vq2VwCwKj4JAMlyMIlasx/l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/avs/control.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
index 2e01dc75a15a7..a8f05de338e0e 100644
--- a/sound/soc/intel/avs/control.c
+++ b/sound/soc/intel/avs/control.c
@@ -15,11 +15,10 @@
 
 static struct avs_dev *avs_get_kcontrol_adev(struct snd_kcontrol *kcontrol)
 {
-	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct device *dev = snd_soc_dapm_to_dev(dapm);
 
-	w = snd_soc_dapm_kcontrol_widget(kcontrol);
-
-	return to_avs_dev(w->dapm->component->dev);
+	return to_avs_dev(dev);
 }
 
 static struct avs_path_module *avs_get_volume_module(struct avs_dev *adev, u32 id)
-- 
2.43.0

