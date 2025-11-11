Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7622178372
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820568; cv=fail; b=Ot+JWtSH18qDwyFGZCd/Oy/+srK2ewEKVGV7VW9AL3RvXZzFO/omItox8BoJdSNz9G+C0QTzumaxx9lnhsbS4jkyus3EkQS1kaw14hF6Rl4l+NgKvZEx/GAT4LoprlUguSHvkhuKa1vOjUR5HCeIAV4ty+Z/OmYaSEDAtPSlZA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820568; c=relaxed/simple;
	bh=eiEKzD4olR2VrRTHvk0sXSu/saX3dLQ+oSdmMViqyvI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mNCNZaRKlRcWCNgNpBOzj5AHmNBZLk9qqJ9+SCVuiD0UEVN+BCoBYjQExl5YAaGtfN7pPSqho4oZfsRU7GLesKpO3ClBF68uZ0RJtquyrrzNj5MwiqMvQM1cXtm7y0JDefT0Hm2ZEkf1P81uJFP9KMzp3nLU95jFGPITLZaGtps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=myklQKLs; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="myklQKLs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxTFFlitwdQIK8vWq3CXPc9Buv/qZ1zK0H6yTD3jydaUjmiTkVQbLwgOGUn9UlN3XiJBhcW8Xi08VdyYWvZ10p1svb6u64fMWl10gOw/qavGl3k910uG0ekYLqvoh4a8q9LZXVfl2SZS4ncNqodlnyK64XsQDD3uL4OarsATITinawA3QzoxvYQDNiIdjC7ApBiQCtonWmwEgKRfPkec4yxlLmGRJ4YH/336703DDGdAdOGXDskBzQOtTfgBDf/F2LUD0jQmRM/Cn/v2f8BVQ8+x3AjamzEdOoGlr/AgvWtdGm8iDGPVi8sAhup93ToM0aBWEFL2VJiPOH2uYcURyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW7ccIkVAYdWwo+4FjvN7nl2J2ZdHPpxzvv1g59M2ws=;
 b=BWrneWo+VsW7Vw6UMlGdnGtWB2NHIK80H8obHHI4spPDY7pcobKTaKWnnNHIbKIMhj2yon0ErAhZQfdhkMa3kq0B0XKAgBZMmJrKJoy2ZX9NFzHiVnYv8OyhYjgMzTn6G0SZpC6pMrGfB7fdJrNkHRXgQk+GAdM68hMxpO9q1b6zYJN4LQqM4tK77ihC2JuJTCH1qFV5i4xSequ5ki4tyn0m8RWJ8TxXA2tVg808Uz4mpqybLnTgZN36NlWFl3KQ3e060yuswYnJTE8AqN7LpoXvgCAgobh+D+oOrOmvn4sr5+hrI4N4i4cIQBVjVzbobBkDPfDstJzADt47ipQhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW7ccIkVAYdWwo+4FjvN7nl2J2ZdHPpxzvv1g59M2ws=;
 b=myklQKLsb7biLQ7DEO/EVuP+l9P8iWErLA/UNwcZM0cueKrnzpNcrcXnDQ5kRWlvWWtJFvaSeENZWbp+KmJYgPXdw+F/oT5naNIQ+ekOh3qvZfrQAZRwr90fC0N2V6gfyu0TaKfn8KUCEo7A8n/0i22Q11A1sY2kgXGwQm0OWj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:44 +0000
Message-ID: <87ikfh5sfg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 070/292] ASoC: codecs: jz4740: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:43 +0000
X-ClientProxiedBy: TYWP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: a021e291-70c8-48fd-d99c-08de20b86edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QGq6in6IpqJmuKEcmjtbGdeJfaDlzdkGWdc/cwXcBiq68kT9W7iqv6JKjaiZ?=
 =?us-ascii?Q?Z4ukn5VKnrwye5Za3dkoZuK/E/kZl3fw6xhuD3654GlCnR2Zp7qH7qMmd4g3?=
 =?us-ascii?Q?SATqOywfu11AvcMo0fQbdRrYv+uHcZ0KXN7ClNmN8KrZhgehYZLQh29p9NB0?=
 =?us-ascii?Q?kZniYjKYXAKtVqZ6OOsH8bwN65DRAjd/8x+3XTYg1E8gEplpON7IuF135D/z?=
 =?us-ascii?Q?cSULy1jtC/bpH4mJhZK6+zTbwnZHguwoAEHpNu75W07je33pxgIAKq8zVqdD?=
 =?us-ascii?Q?3JS2FPNKB1Ut3/CFKmah4Qo7dzNfnCidX7DT4nudHTBw4EotyisLUpPWKPHo?=
 =?us-ascii?Q?QE2EAeGkrZV7hbLestq9TF8SEfjYmn6P85Lfr9Zre/6//2kmMSvZOA6r8Vkd?=
 =?us-ascii?Q?5r4TgEp6wppsb5+Ikg+8S0yax2wmN48VOdEuJWcdZv3HHI6Yq1i2gJCCLEAv?=
 =?us-ascii?Q?OZDE4ZAWLWeLk50MTsRDdrO61pQctvJEZdgi4z/Gv3dCt9Csxw1PAsXbF/g9?=
 =?us-ascii?Q?94TzwnchqzrTEH1JXklIU8IXDIwYN3G4gLVPDp5QNtQH6EccIEP3WC3WVN6u?=
 =?us-ascii?Q?kr2W3zvNvDHWpq1JY7VToxHXsrqDE5toaQi6DCYM1D+Cjvne1/X+QMJy+XiE?=
 =?us-ascii?Q?+qUhzCSZZ+5vfuBFQ+ofv36oxiNCujST2/EMVWHQ/9B6zLZd+Rw2MfnGb2c9?=
 =?us-ascii?Q?4HlYNFKXlNI1jiNrimCzQjGslMk8boZs71OAsDaCwERM2ZlAstcyeunThlAU?=
 =?us-ascii?Q?IbEC7wHfdh7TDMdEw+6JHXNo1cLH7wh7+Mv5+hzBfgdXRoxRzlpXRt0Vi7Wg?=
 =?us-ascii?Q?NXsm6IB4caigMPARzF/l/xE9z/mn/vNlEGxQrgNXMbQqAfnuM4umhZ2Yz/Ot?=
 =?us-ascii?Q?bHOpzFeVZomG6UNDr6arXSxzRjnCQobbn8hs+qDNe7+k0ZlVweiYzEbI4luH?=
 =?us-ascii?Q?+wFiRxRqOwVwI7mX1oUFBx4qhvabByUOhpfQGWUSHyJgtDSvtLRBBbkooHvD?=
 =?us-ascii?Q?WbEGRCjKJZQ2tYTW7KgV4YsEAWWtgJGVt1j1aTZvIMDFN4KG0KzsM1NBo1Be?=
 =?us-ascii?Q?jeHGHS+yssRtv4lsK1hSJtaZpg7yD09WsEKbkapBbNXMOLmiRRkmfDEdkuil?=
 =?us-ascii?Q?ZnnGi6IaSwvrgHxbPYbUBHN6sB0oy4e5dvybvV3Qoyck1V1/XffXYId5kutV?=
 =?us-ascii?Q?tUcF6ivhdzjeXsYRfSnsdOlTIMqCJJvnINOKzAwqvTuXZOa3rgJ1g4BJQT/L?=
 =?us-ascii?Q?wAEOfakFwuPfcF9QEASSIleZC16QyFc9qQvetoVudsUm7aSyZNEJIjTozakV?=
 =?us-ascii?Q?moqrGHKtTOHQmjIgTbgmXO0+BSgRtCHC7mdaedffsn3tyKQrzaOL27nXBMVq?=
 =?us-ascii?Q?+B3hoMCNlTd2GQ1zbNMxqhjleUiEkSR13FQbTSYeozkM5GPgXMNzvBOVc2Dn?=
 =?us-ascii?Q?3chU/FOezT30rXdvSuLbnMwJeHfJgeMisC0j1icYJRhn71G8/OvfcheOvnxD?=
 =?us-ascii?Q?19iFAxA4sbjqaHcRi+US8JB86ADdd4ZKoMHi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mf0DIqKr6ch0eUH13LBJendqg7Os4WHUYLQ4veYb4a0zfZOn201rwsU8EdX9?=
 =?us-ascii?Q?4xPMBQOt/ILzHVEzqs16D956cPL6G12nKoyA5t05IvcI8Pmu0gHuaM4eiqhf?=
 =?us-ascii?Q?fHdu3jzz9cpP8oYP5fXJ5jIHLf8bt707Esg0oxDIlofHSllLSFzkCsXzQG88?=
 =?us-ascii?Q?FLqj0Us9v7MpmQs+wQxsuwUp28+hfYqgcvcapd1xjW1zL9E7rPciF2rwVBH8?=
 =?us-ascii?Q?EOGPzJ20VcK6r+hNtBtgeE+aVOsvKlRpPmsO42qc/xUltLwTY5/1XxQ+OAAe?=
 =?us-ascii?Q?Sn6fZaAr3U0hoU33AuL+cSh8V4MTAI2tQpPoPQ3YStvpHXoK3G5BYZ0+tW4h?=
 =?us-ascii?Q?mPzek2SBUhHO6UFjWORNQhcr8wYD/Y0iHgdQelW07euH1LjK4ZevRE73eUGL?=
 =?us-ascii?Q?GYPC+Zv+86ROCM7TSNil0lDzWmm8cXvw4VOLtUfxWTtpLtaO3i2xoJInakch?=
 =?us-ascii?Q?txnuRQ+M2hovHn4u12/+qHKVNgE5F4nXCPlWXC0uxkYz7F3vQQJPYZiXht2a?=
 =?us-ascii?Q?YYm9I7io4hmyTBPgxS2GrKkDO8dbKtxIUcKnvGrzcXI0tCKsQC0YdZ+Qf/3d?=
 =?us-ascii?Q?+MVA2P4b7ui+cyLNyrz8zce3q/2YghcuU92litoWd4T/W3/K9uBA94HYqKDu?=
 =?us-ascii?Q?2WvPfjLc2+XVyjDlX5BUaLYt/BbCple07nsFhuufum/NPomr/QlzhX14/aCq?=
 =?us-ascii?Q?3hosf79w2CZnBLn0iEVEsqAof6sEUO3WSZJ03E9A+smoFyjXMldt4bs5HxGD?=
 =?us-ascii?Q?XUEgETDGP5b0SsrlaO9JyMALzqOPIrRCRCDQCC+vx7GRtrlNobvQacVLA70U?=
 =?us-ascii?Q?XG7kh8Inqze6yhvaMA7628DUS8zK8Kp6ScRV5K142Ld1RcQx3U39oDru8WJr?=
 =?us-ascii?Q?kRjuEiv6+Rc4EOMvor/aseF82qHfpxAV78lPkhgN1BeLwGk5jr50kGUqFrBF?=
 =?us-ascii?Q?HQY/PrP347/74n1ndrUJGizqou6IRDFprNk8zTmQiEMsQdXZXNp+RgiAuJkj?=
 =?us-ascii?Q?yxJgKJFCRsoXE0VlpfUvJMzGH4uFwOjzHgS0Sf31qIYgXpsLis1lhar1Jwiy?=
 =?us-ascii?Q?TOpqJ/WmBBV/KzC6XsvAUzDF95dudNoZCMHNW/thJFp5mSX05kHwXH7NXKUx?=
 =?us-ascii?Q?zmWwIUnOAnrVJ3Rb9n9sPzPzG9PYVjduFFHbZLMv5XsO4BxYIVh0y2sYiGdE?=
 =?us-ascii?Q?2Rjtx4YlevMi4YSWBiLHDwxUXV+Ef/wPvUjOz8by/1J5laxp7b9Pm6mP8NCY?=
 =?us-ascii?Q?Z46htD1shHjhJkRNS2WxVbtJygTWXvY3Jy6mHhFWoyxgyRh15pL+wAwg3z+B?=
 =?us-ascii?Q?xe8OlcUEP/mknmB1RPue0WSe3IgYCifyIHjffLc6aXc0eIcuFO7KSF4YS2Ht?=
 =?us-ascii?Q?HxaGzpZRVU6UCLH0L5sLRNbEUCbdpH18evdb6B928XQutKENvtVAtEpmeCG7?=
 =?us-ascii?Q?m7Kmle5NCdfVUthNqnh5+/9Xdq1Eyj814D/aHXMUrOAH09AtM5NWE7gDl28G?=
 =?us-ascii?Q?pA/vPIRUxklFWMt//jLz1PZY7bDICaL36tyWtcf5+cYrBJrC/e6I7Bd4A8TZ?=
 =?us-ascii?Q?yrKgxUiXkvgQeRQcpT2Q7uOuZAq8s/UtGjgnao8WnIVHF5TciGUCy6J7p8Nl?=
 =?us-ascii?Q?SSYhVyAzAHYZgW1dhbCxBgg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a021e291-70c8-48fd-d99c-08de20b86edd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:44.0376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8Nb4M+hZT06e7pCgxqE4JHD0H7qHiR40jsU461w1d++3Xdj0rhdiLNFDGno1xVYHPvZyyA99/Zs4P72jlYTSKjkRxBkHQtD9uFG8EFELwFAu68gVPydXB5tIkU0wYQv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/jz4740.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4740.c b/sound/soc/codecs/jz4740.c
index d1cea93bdb598..d3d801d850a16 100644
--- a/sound/soc/codecs/jz4740.c
+++ b/sound/soc/codecs/jz4740.c
@@ -231,6 +231,7 @@ static void jz4740_codec_wakeup(struct regmap *regmap)
 static int jz4740_codec_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct jz4740_codec *jz4740_codec = snd_soc_component_get_drvdata(component);
 	struct regmap *regmap = jz4740_codec->regmap;
 	unsigned int mask;
@@ -247,7 +248,7 @@ static int jz4740_codec_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		/* The only way to clear the suspend flag is to reset the codec */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			jz4740_codec_wakeup(regmap);
 
 		mask = JZ4740_CODEC_1_VREF_DISABLE |
-- 
2.43.0

