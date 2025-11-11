Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051181400C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821026; cv=fail; b=n/JlTyEnqTBuBctlcXaVwO9Kz+bVBZO7X/U0bAyovV03ogQ7f+U17igAQJI61RXRZ7dZJpKAW4sTQviHbzjnmrFF7bBlU5FfSSfxkGFA4keIpvTA+jXDoXq2ATGJnO9YL/MjuS6AUfE46ppybwXJBTB94ChfLMmPzQXPBBY07OM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821026; c=relaxed/simple;
	bh=BexmX0Y0RuV5O0I5Cb+wR3szSIiSJXBNVWuHsnImBn8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HP8Sy9ruz/UQidqMCqyAetQPDu1wcTE+9/lfgz3WZ7PIkmHynmoMObZQ69sXGa1HE2uj8jZdjLswfmGeISuysV51Mzw5qoWObaAn02fid3aGwgyQpJ6LXkJVtkiCiILMRUMd7UIbVgkEyfDNDWEsuuMm+05++/eeHPT/EPKjDoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GQe62XAh; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GQe62XAh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9OpN5pMLp4PhLiOKEPci3LgIwDLsPup1pVX2p4bPKPiP2lZfecnoAQI9cFb+kbz+4LG/pscxZk3OdqZ4y6hU1F0XuTBlDhbnQpqAwsX1f8Bu7i3PoHaXJe8PYT+ct6+r4wRB29R/HjTew8MxRoq5HzejwFAKncKmdGRVyVKlUvQGxCOmiC9hXGswdgYwb4p4Y9zJUN9lIrzVSAaGOCC67mZ+IDRZO7ulMFLTjVnHPqdN0cb4UpbfDIrl1cKXGNRt9iinhjrs/2F8d9bBiKMgZU0D1PwfmPmvWhIeCHn/leMdZvvttdDF2YxVqVJzeIznN/uZ6NXgSaeIpVWddP9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9rqqdXjaMzGccOTb5cY8kygTTTImgD72LKZQenuDuM=;
 b=tUD8Zo6Y+SED7dgkpIdydi009qPgMnLq+AV0mNOJhot4pLGHSJooYLZFApVleGFEp49+MDRlqbmrSP5ht/l5oyhRhgxMQkJdu8AcEY4TDU322G6SZuSW98WHnOj40YTgIMs5K7cOSD2K1+XXxY4kjh0JH1hslkdrOb2Fg1ml5Th7boBwNr+tb6SP+JWBU4O5Z8jwrol73iS8i4Z80XBwvrUbm88P7yLXBWzGRcia9kaNS/P/aOeTi8/sBrlijIpNBmAWzqNPwwODB3Gk6SmspGNxJw0q4BiqOSdKLZSDFJcO/PeqinVl8s/LDjHe44NEeaMH8WLnuoUzxS/o5lb29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9rqqdXjaMzGccOTb5cY8kygTTTImgD72LKZQenuDuM=;
 b=GQe62XAhBTcr1fZPWR586eUCaZf+ucoS3elEsmRND6yfbnkDAfhcXCWf1rbgoskyuodp95I6byIFgAXV3JeP4i/yVwmOSgzQ/k6wfS7+ESQ1CKFGFsDilVQ8c63XeOyOzeOV78cgr2x/3rpn++7axaJXCdxT0F5i4q3LNe8/tNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:23 +0000
Message-ID: <87qzu5xvfl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 189/292] ASoC: codecs: wm9081: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:22 +0000
X-ClientProxiedBy: TY4PR01CA0086.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ad260a-d393-49ca-d982-08de20b98069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R1pPkZ+t6PPEQnJDstjnoEy7R3yVY+xq1pXQIHRWyVIBP8DTC5xIcHPFCDK0?=
 =?us-ascii?Q?NM1PEy2GWQAPVTgoW30xlnKBZvwQMAm1Nmkc4/1FwZtHvUUdEhDmyZa0g7SL?=
 =?us-ascii?Q?skHvUfGswfbYlm6DBBJRB4hOL+qwcNU8c3Wrz7PMe901lVq5dIA6dakJjTID?=
 =?us-ascii?Q?7ZVuhEuQkh4bY9ZIPFvOuQnlNC8j7ltDYoTlzCRn/0SXpVcV0XB8LEDEhiY+?=
 =?us-ascii?Q?GCorNxWOv5+tmczrTtBmtS1bBNVUxf5QYig5w78SGu2p756pQZaafcFeTqIV?=
 =?us-ascii?Q?SxB6/mRoB11ABm+Uh9l4E2n5PxPvG3l13putgrdJa61bMZJUt+pi36K8Dlix?=
 =?us-ascii?Q?ZmY5HweMkZGD3ObXUJfR2nifXaYBFupQx5zCYcGbQpL+2r6f657gtROOddSn?=
 =?us-ascii?Q?5Ri1rI2BIJZaqVkxn8pj7AGQeR2aHTXoMpiKNtjCKUV94zD2ssdFiUeNq/m4?=
 =?us-ascii?Q?9mShWuhanNdexE50L9WecuMDWIGhAOwjiLQnAMSJCST0mEAqN42UPNBtvMYy?=
 =?us-ascii?Q?ueozk1pPhOtKS2T3O2oTGrrJWxUV+E+GiwK84k2J4cuORO5HGSLTAFws8QMA?=
 =?us-ascii?Q?8JWSZms/xJgW4Vk5fOH+A/qf3qbyfycLoR3dzEiJ5UJCKa17goLPClPv9YuU?=
 =?us-ascii?Q?hKxEfUlMLt1CaZwy/AyEVy7oIUyhPuQtBOvuCxiEN1YnUSNqqiKHrxU2uHeb?=
 =?us-ascii?Q?KKNwOZ5LWcUHz4S8vFv3eYTBDsrshhamHfO+ev5BIc7xXrm8yUfwFLmx5euJ?=
 =?us-ascii?Q?XOwZzHnq5U9LobHP02+AyReu/8A1tw9SyS8vcKAlqyT/31xwFAMv/BlnfsWa?=
 =?us-ascii?Q?GHXfhDpmsBdjsLQ4DMoP7T7WH14oSlpeF5Llx8CgmjKmb+LI5BgqrIdaq6Ae?=
 =?us-ascii?Q?QfQvrMqVuVAeNDuE4Q1AhhJTlO5NEkvV8ucZLxiLSNsNBPZrYQ9zqpn40rdl?=
 =?us-ascii?Q?OFsstZqIxhjq8ttuhnj+M0xOaVY/7ZFXb6BpFofycx2T5k3rPOKz8UEGOJQA?=
 =?us-ascii?Q?Qx0YMkNiDLrWk+Sjdb8hr3AsYaezA2ENhb7OvTHLRvwmVxrVfnnF/Qi8J2/Z?=
 =?us-ascii?Q?xrGY6wEM12vTeXyaKOSLovOIIk9W8phua/VHDP4ZVeQ0KhYx9NBGMKjO6zfl?=
 =?us-ascii?Q?euijKqHl1rfjDOAX8r9dyzcwFeO6xp8sB8qftzy0mRQVBPvi3LgvSVHFzacx?=
 =?us-ascii?Q?KhF1UGSIoulwLlXwcNYtklKTHVeVIf/6zApXe4g5GxMrGgbSHohTDxqHIbj2?=
 =?us-ascii?Q?tfFmhvGWC/fnCidMzi6WedPJ9ow3BYkeW6cDQifpslRKZSxdhrXLfDX2SyEZ?=
 =?us-ascii?Q?NaR9ZGNlVd26M5MNHqproBEby8BnZUoM5iAcWHfE8q2rTc1HGiAvExXPqcRc?=
 =?us-ascii?Q?Wtm6/4/ex4xOG1rT0OZVydBfLgTvNph3Kmh5eEzC6HSvcRB1/K4JFaOV39Pw?=
 =?us-ascii?Q?ZSuRq9JRkKlzTSeVIpxvo42G2v2ZsVeznnb2nB2+lL+ouExCQfltW9PjTec2?=
 =?us-ascii?Q?tx/Uxzmtszv/iVTJUBU6q7qlF9b16+C4352P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HCph8Je2xGd1o49V1RBTB3SHxQn2WigNFpyzjPsKoX1slRH/nZx+pt7BbKDU?=
 =?us-ascii?Q?HyjUavsKzCUQE/aHmcMLcyBzOXrjwURTVjhp3x6eyk/KXztMxmEFIBWVuNU9?=
 =?us-ascii?Q?1YkkSZq35S5sY6QdHXEFprM38NAn8/UHXoXsURLgAwMVV4HGTFnvpTzW6o3R?=
 =?us-ascii?Q?tzhCkk665/+qB6PoP4nBe6BW++5nEYFsNBVHfp5xkZJbNMtab7qXsFD2vvhu?=
 =?us-ascii?Q?FVoAGqyG/LPyMTBOFyHMEwGPaSXvoXhYnwZxI4ZFIpyYeBj2Fx6jFHCPqdGq?=
 =?us-ascii?Q?XeBvXUIbQIRtWvxuiafWr1O6GXM2JyFUX+1eqFzbM0eg3Um0k8fPgIVMpxGD?=
 =?us-ascii?Q?Ru10w32j+ciju/rNdV5BWyPGE2ulgB5Ln91LVX69qC7BQrZX4BldyDmpTXY0?=
 =?us-ascii?Q?FjXN5/cGnSMka/xhmTYKhYY+P+DHpGp9NV5BuvLuEaDod25gblX3Mm9NkgbG?=
 =?us-ascii?Q?aMrFlb+0nKQ9LG7qAUkKJrQ4m/oW3/vteiGhkrsxF/SgFMXTrxEbwLjnsvjw?=
 =?us-ascii?Q?CPEWT/jAXCkyaM8+g6weSS3yaeycFffrVFi55dS2lU/+ducOKsSOSSAu0Onw?=
 =?us-ascii?Q?rDQFoEencKegtoX3ufXauKxuc5h/TlL0i0eUkYgaZyrAbsKoya4FoRQuoPbY?=
 =?us-ascii?Q?9pm2P66Ui9tY2VE+ktuskbg0vuv/VoJfp3dB6SfPKasateGK4oLMug++RXs+?=
 =?us-ascii?Q?EqrJ1gAkISh/UsimcdEdUfvKqoxZHn6qM3AaUKLYPuUlY06Hfepz1bFjgt4T?=
 =?us-ascii?Q?PQwr7Nrmf5G/gaNmXV+57rRHDN8bykGmu5iC4xheIW/Gy0dOvkdgbX7xiFWx?=
 =?us-ascii?Q?u14vu9I2HGw3Rh7ZYi58W333qG3yf3SO+kJqkM179fqXeeXQ1SPOCsFi1XpJ?=
 =?us-ascii?Q?7h/E/qvNrea83AS3WMty1Cilvt3PFHuwWSknsbUdmpnVk7V5/BwG9wYyQ87/?=
 =?us-ascii?Q?86syJI3Cc7vkjZ8sn6I1C+gr5dJByfYWa/m5hJeZIDnEPlSumpQ/OEnxEXMC?=
 =?us-ascii?Q?9F7a8X3rD5Mm/J8ZyFN9d9aiPivbt0UrnIQX1dSl+Omn7IUSFOrc+XCawkWu?=
 =?us-ascii?Q?JRcErs86uBXq2gsA+Ej2zEdVgOs9HF20YB0GoH/PY+Z0rTZWVZkTfS8DDlNe?=
 =?us-ascii?Q?BFG20ZLgCFR5jQycaCyusvQCkLBpbGVFAcCPu38UeFBxlUIVPbMb8/J6Kfcj?=
 =?us-ascii?Q?C73ijCy14Qc5liA0rc6K6VY99zyqMu8i+ysjFRr9XXHdAmKgCj48rCpIeNgS?=
 =?us-ascii?Q?6Yfkx7uPc4OiG1HgpbqrtzLsC5NyMdC26z325X3G/n4bi9FEJcQUByCiO4QW?=
 =?us-ascii?Q?2y0DqhUmuinHmdbILs9oX8j7doqs+T7pwKpOHY60gwqImZiybLoNYd/6vlQW?=
 =?us-ascii?Q?OT8/n6zNYYEtN6Ry2h8w8U2lURSJeFycM6VK5xFmZQgrrr//yBvntv8HPtVn?=
 =?us-ascii?Q?ixBdk7kqyzRe9vgWdrZyX1V3FQQG2ghGv8rL9mA4ZPSHibRn1FxvVc7cnoIN?=
 =?us-ascii?Q?5QaTES9saBpU5ELtxHwyHwlNTRxjooDyrfHqyg9t5TJJsf+7kPCvAE6zsOVj?=
 =?us-ascii?Q?5WdytzyCk3jO00eMBn60ocsItj25SwTCuKUeLDnjai8A1OlMZUlN/a6yCjni?=
 =?us-ascii?Q?eKE/bf0RJPkiqOKvH3DXAmg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ad260a-d393-49ca-d982-08de20b98069
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:22.9912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVazajGtSDhtW9c/P1WLJ4UCrzB/R9232KYIF4mlBvxNu54FSuesljrEFjuz2NVCVV5zYGLZ354TadFxKgS6AUgkdY8iir1qKExxPc5xSe5YD7Bh4De7fhgqHny3RyYi
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
 sound/soc/codecs/wm9081.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
index 9b5497a128e86..5bfe43c6c1f40 100644
--- a/sound/soc/codecs/wm9081.c
+++ b/sound/soc/codecs/wm9081.c
@@ -816,6 +816,7 @@ static int wm9081_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm9081_priv *wm9081 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -833,7 +834,7 @@ static int wm9081_set_bias_level(struct snd_soc_component *component,
 
 	case SND_SOC_BIAS_STANDBY:
 		/* Initial cold start */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			regcache_cache_only(wm9081->regmap, false);
 			regcache_sync(wm9081->regmap);
 
-- 
2.43.0

