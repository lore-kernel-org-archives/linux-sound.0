Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F08B21FF28
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821236; cv=fail; b=CiqcFHOg+AJM3su+6qaXOC8Pmb5sjrLaKrwgRgqRZuNKOZwxi/snjBQMqusbF6CMhf5NS+178Fa1f0FPWeGL+x2AJh3syHoHkF95lBho+PiuQgpwEjJWniuWr4wA2HfuftdpksqNzM8z7GOPloPw5VzCd4noKAqF097ZLtgamwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821236; c=relaxed/simple;
	bh=KVZuTGP6CtmsPhZWRtyHn8wMr+eHkBCCBl9bTzlkRX0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=U0TngMnRWed7PxoatJGA3tI+gzb6srhvGpb0eM+LOzisQ53qACRjR2JNI4VR5TSBNP/lvF/gkR/HrkSyv8QvHwNhbg/7aajdOsZ0EtiR3U7PL1bp1Mb7r1lcELD6dq8EhZg2mtGF0BEKRZv4fc9gbLTguOYEYXrWcdQgzvrG5RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Kdx8tJmI; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Kdx8tJmI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofpR47wTP1jeFpJuAxYdb+UbuGLnV/mqgUc/3PN710n18v4h/B4zKH01n0FqHz8V6hiVcSwO9q196GER6WFRW34z1aIRm752emkYzyYk3Cd4SQl69/x+I6wxfT+F6FbFxpWnOa7jWX98/t9VaEKuWkTrIqYw2rBX5DtFzJ62cN1cltwBdV9P/TNmRQbQtila9Z4ADlgHtwHcYRqrq4SjL/1oHQcX0Esbw0lzCGCUJ0m/qKNlFZgYMb3VELLv1Vcqe6hyDYOB9zj7gcf7xViGJNSIItWoUQUjzqmCbksevxAYpr1Hm1wlW/WsEERWBumE+H6LDYm29JsVv9oakCKKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HB937c7D+j2EzDCG4DicbxbRK6ogFwuEWpf7HuII6nw=;
 b=OHnidCVhMurwuUIZ+3M8WhKuznGbrbJm3pBZ6XuwRSrM3qSRRhE/6nx7nzdbYV3GukIeUIvE24tJg7XGWAuU4KIg2Z4ebU0JSqErKpk7Z6KW9lSsh8hsZKKLMEiyG0Epuhq8Zow9UkSm+Z+UghFlUN114oFm0p2Co/mxBqdpGrBxm/DCF2PMNNid8M97tlmqL2hsKoIaDAnjNwPhoYW6ND/waPmFsHAE0S7Y1RnyaohXbv/XkGFVYlxT13AffDxh1wFY3+a1GklM+BTKj7+Oj7zcrSwLTECmCsWoy66KBCDOwLQQDJ8FcwIFD//tLIxqeWzGcGyYjgciSwMrMaWAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HB937c7D+j2EzDCG4DicbxbRK6ogFwuEWpf7HuII6nw=;
 b=Kdx8tJmIpbDTqlWHQFX9YEPOBxAWL/gBXL6MvQncR4ygQhDpVm5j2kZY5BD3OpEgZhMVoNv5xxu/eL3+dJ34z7JgNRAwyj0GRpayOWjdEIfMV3Zy3sDhCG4t1/tJMd/T7xEoMzCCV51tOU44elaqoiDCMUnQFEtm7J2MmFk2Ygc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:33:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:50 +0000
Message-ID: <87zf8tv24x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 233/292] ASoC: meson: aiu-acodec-ctrl: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:50 +0000
X-ClientProxiedBy: TYCP286CA0355.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: b345cb54-f0c0-4bad-ac1d-08de20b9fc24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LGnCtL5zksyUewVCmlTv5P2S2NDXCwkq8dr+XLlhgRQTxPO1iCLLgfyscI83?=
 =?us-ascii?Q?SVkWxcxsMf6Ds/sYeLiK01KbIZQZzekwwRTwsM9oxG+zUHdrpZdBP93a+s+c?=
 =?us-ascii?Q?vt83BhzuSHh4dS1Ak9viknmLerYOynEz8zWRUup0ixYjHMvEoIc3JD2i29J2?=
 =?us-ascii?Q?qmqgvWJWHrdYK9XleZf7nVba19K1C0JdYqMLW1+ez3ajgeVttgzX05iDqJ5P?=
 =?us-ascii?Q?4XbmpfyrJcygi4LQZMlpjizHXvVRTsF8Rg2FovlmsXpN674ECFjfdJl164H7?=
 =?us-ascii?Q?3jGZP5Xos9jW8GYnzlgUallOuewDZX3BCuyDeVX0itn8R5gXuHOJtKVXx6ZR?=
 =?us-ascii?Q?h/L6vc4dSwnlb1gLDB3Q6RdS4XngUh7vE27NGOzN7jAhI76+WH+IjXKpP4j/?=
 =?us-ascii?Q?g/wbmCycjMiMzBZJV+oTU/q1cGxfQDqDHyxRNgjWWeBnnCSleZJ2/gLrGyxF?=
 =?us-ascii?Q?2gLdafwddy+VQbYilueSAxI4UYCZLKXTqWIIaOvMEbLxndKSVNr5AmY19JFu?=
 =?us-ascii?Q?VwtEapt/UEEsYStU7Vi3b2LJt1fvmJtNEPpKG84MAu2YE/N6+SX67W1yOq7Z?=
 =?us-ascii?Q?yvA+4BbzjMAOqJYq8WMoZzRhuEq1/7AerW0XZbUADnl/lgonjwSmF15dh8Dp?=
 =?us-ascii?Q?Yib4gbpH9K0cnCaFpRen2nVLtqdFcrbilRhDJBmPRspbDXGpozFRNYH6TNlL?=
 =?us-ascii?Q?Js4Y/KwZoHKKFLgkGhehgArQ767RcD0oWrzNLeuZmUXrxJzNu2jJpQcWsYmR?=
 =?us-ascii?Q?9xxcF9GdGrW71t2OlAG6eBDlnu57WcNqAqNH9wM10Qnukf8E1yKeD13l/uRC?=
 =?us-ascii?Q?3PHZTVhN2K69H4p4WFSxFM4AgXtHKUIoTUAdfDYCME13699hZjQAJi2lu2UR?=
 =?us-ascii?Q?su52ywnUorP/7AhYQ7ISnC5ArdGDorb8G1ekrZpZL7hqIyO4PTHdGiCWgVD2?=
 =?us-ascii?Q?hUEHmhUP8PtiFDuHuifnMEUN9c+/o2S7ACnc4Zap/s2JH5cwdKCXH6Q6eHrj?=
 =?us-ascii?Q?BQQVWvkRL9vDwkRlx/1j8hfkEmcYYzYDr+Oo2whdrnxdgkCYjiW5gqYWX8Kv?=
 =?us-ascii?Q?gVVyU3XYYuFBwp8UuPIdgc7tNdTQEb0iG8BSUIk1RrO/iz1kp7PQquh7xT8R?=
 =?us-ascii?Q?PaBLvXMSmqekuEDSlsOBuESr4gmKjkTeDAO/HTIL5OM8z15KQJrCI1Zqauh+?=
 =?us-ascii?Q?UFDQKNoLRDR79L/xinY0tuoKlD45E9a0qRr/0joUe8WfSY99NWuuRBDg2igO?=
 =?us-ascii?Q?PUOAainRkrUcCABtWZ6eE1JIX1Zf2yc6e8YGPqeOMoF9M1PVfSN9VvU42iso?=
 =?us-ascii?Q?Mnq51m8J+WvXu5DOI40zo8OtaIGJDBjHxPSzm8TpbQSueH/RvmXJJTnUhtRe?=
 =?us-ascii?Q?w4Plx9q9mBVpFF/1lBNfBfUE5URisjYi1aFRDtoHgNKMRt3P/mi1SIpEsWCj?=
 =?us-ascii?Q?PN1tyXHlupjQl/vcdV31baWg3OY6QTUoHkV12FrxsrDDPkkcCb/3qsCxxndb?=
 =?us-ascii?Q?c7QXSgbDB1tI6J9rsKE+N2BuCl+IS7ZRANGS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G4wj5IKOW4UvOkaON//U41HB/vKcJdk0seP2oByBwKty+EjMZPP+ivipvAFH?=
 =?us-ascii?Q?Bo98REwhwWZK/eJaIHQ9PdrDfCEXzh9Ybj+6G35NIb4zWQxH1QzOLIRkcer+?=
 =?us-ascii?Q?bvgYVbbs8j1Avko78VJeyrEU68/VxPXmhyeCjxwdnOPo0XTDiC/JYJDsxBzB?=
 =?us-ascii?Q?KVgmXQT51UohFi+hzjuceJVSPFcDluyRzcLuaLnHktUatEQdcglKlPR37xO6?=
 =?us-ascii?Q?qfehydFFcBJ23Yp9Fx8LHauczuTgvwMCTKSdhi2KVDImID5Yltb2MFwWMGFb?=
 =?us-ascii?Q?bpuY4hHCALStfjRkk0dXJCqH/1ooGJso/t+D8W3LZJ/0W3FsYI4ahUJaIBdD?=
 =?us-ascii?Q?6z+vRogpEdqrVZL+tR2adOiQBO0v0iBvc2JH55bMaZYMl+lqYBR0lfPxL2uR?=
 =?us-ascii?Q?IYdz3zK8Jlz4ZAz7BIjXMmgpxlmIzHDf5tbeyhr7mza+qUWwEod24307tGN8?=
 =?us-ascii?Q?jIwSRI4c0DumypNQdc+eVb19ZC59Sp5kIh/NI02ofjV4uasRt6m6p9fdAbI9?=
 =?us-ascii?Q?gmcqcOZgQ8wiFZPtt4J5scDwgX31bTk8rS4CbffyzprHSkr8FEYZ313bIZK2?=
 =?us-ascii?Q?QAlPt0MmRphp/ws81PfLh05lKSpJhfm6JsFf0LwIQ1P0D2uOD/OHBpMfnXhN?=
 =?us-ascii?Q?vUT3GOym15CfxifdDkI2bHRNkFUiEtdw059ieIORm8ascew3SSiA1gPgukYs?=
 =?us-ascii?Q?He4TuP2kU8tGfbTeRnckiCumV0oabY0Uc1FNjkA1idQzbccjpqWckzDRD6yp?=
 =?us-ascii?Q?5PEK2hluqSWSLsB0HGcxwJw7nIRauhUSCQ7V1RhOrrPTqQ5iUDzQ0MTw3rpC?=
 =?us-ascii?Q?DiVW10+sUdLKwKDz7qnKMFtUodlUZTeVc7+68YrqXv5W3wKnhNyz4IeTxRA8?=
 =?us-ascii?Q?WAQT4iIiLP/xB+I5ZawfYrHnsOa+jRH4WgwvcXFNQaw/5X1FVVUGV1pt4GCS?=
 =?us-ascii?Q?v9cxEG3pLFTMe9RF2JVGpzrC3GSY6KTISWwsN4n3XZmUafum6BcMwRPVRkBq?=
 =?us-ascii?Q?gi5kiZBNViNE8Ln9H+AtWgyGP3rINVoTYaP1zslZFraAy0KHRsqM7Mg+/RD5?=
 =?us-ascii?Q?/0sGZKTm/pYxit6iCMinbJ0JHvN8daf0EVVnkXX7HkAw+fJWPkTKfqRE6XDO?=
 =?us-ascii?Q?kLIJ8tvZzr+EM6mXNhHYRyZoX3JX4OVDcFgeklnRbZaY3i+uiBlcR1TqhN6f?=
 =?us-ascii?Q?7mdsbHSZ+18nvc5vdkcaUaMsGuZrCOCONCSPDO2nvodlH48At1XpoaIbzJ5J?=
 =?us-ascii?Q?h49F4RnBFqXbcsVU4J3d10iIELHEJMy3GkLzpo4UENUQxeaLQ1KM8sTwsrwB?=
 =?us-ascii?Q?abNcEyG2Bqs2leCGGlM6oXypfchixDSgZu2Howt0RPufcdb07pJr1gCkdk7d?=
 =?us-ascii?Q?Ekj3jAGQ9xyC07ZxmGwilEuvtEYZQMjeEa4/ValkreOxWpBlnFOPmGkQMWWd?=
 =?us-ascii?Q?nYqtKGikbcwshIOndnAoJztG5Wauy+sMVs6w141pcFxO0e3Zv5ikshIyIM7i?=
 =?us-ascii?Q?Ej+LkcNlK8RWQwlDVOE6+5DR/wmD/aLch5RFkFSpG1hwfiHWdAgxlrteHw3S?=
 =?us-ascii?Q?BW+PGwM7x9iRoyEwlLP+tXNgAkIy6aev4YV9VZdLuwmtrKp/tzgjUPK2PiuP?=
 =?us-ascii?Q?9lcZ2jrxwISwqqEnAwv4qB8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b345cb54-f0c0-4bad-ac1d-08de20b9fc24
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:50.5407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoocdYh5/EUmZ+eQmh2lICuca/2JCzu5nZPulLt0iD4jTKYypbx1i8Ye4APuNZklsqFAHMfBeq/Gp4dKh4Wu823Ft6CXFyQ5XbW6RevfcNrV4MbXzk9pvVCCxTL9Jdkf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

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
 sound/soc/meson/aiu-acodec-ctrl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 7b04b97f7b41c..483772ba69cd7 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -31,10 +31,8 @@ static const char * const aiu_acodec_ctrl_mux_texts[] = {
 static int aiu_acodec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
-- 
2.43.0

