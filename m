Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011038.outbound.protection.outlook.com [40.107.74.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6519212C544
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820321; cv=fail; b=mqM9I2YhlXx1rulw1UPqzN+fOxx4Z392dwaHYlqbGzwIjo/FoGJXoI/D3/JoOKCCeC63d1xX58022F7oHeVO5K0Sikdk911lZvqHSLqH9uJyX97kHudxh4dIIds4ctfZ/+X3GOSxaVlqB6kxHuAEobuSo0BtQuEdjJmppSZnwXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820321; c=relaxed/simple;
	bh=bMKU6dKKPdrGCN6mm35ZtOKEue0dyX/5vX0yUDUj1JA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qM43vghZ7A0hyXy9T+Djn73Vb5fxDrf8hy79bUVCcmlyEzFjP30GczJH93/VwVdChYHqwa1ToaXqcI/+72uMaZCVgSh1l87kK6Eg2fXrJVsqqJnkVvgIuPfTbGoFlpH5ubwSRl5BwhUiCQocGU4dSa7xBsK2tCF7TOqhO8RoFVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=M42kTadt; arc=fail smtp.client-ip=40.107.74.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M42kTadt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OerH6hIQ2dESLSginFDqzJQogzPjmsQvrnjmbKJsmEq1RCnAvpuI3BXDynXgDxhEkZreIlOlHhfUO5yTZOxFrZOfbwO09XimvOfrX9PGXxjvAqvaxVBTT2vHsmGOFRfiVAHiMVyEpPhAiKJKNGtNrsDnL2otc+KMrEQzPs6tCr2nzQABNx60IW/boYix5KYId+C9maIp5cXOOYFQjw/ApwKr7sts2AkN+G2Fu4OAU5fDlveM4S4cNS5GoBzm0POf/O8BDIXIyvwxLeU2v3SaOeVLzaBR1lLht60NWOjnxfoYXm8kLhwo44Kcrum0ulTNNlsSgoDJdeq7qEFtmDyMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe2U+LhScJdLs3SLVSEMDify1Tq9UX8BcdqYYQxzCc4=;
 b=YYnuaLWntrbHC+T1PXqME2XhoTjDPIs3+2B/63xQFhnhKSe11Z75EJApAPOKhW6au2PjGLdmqUBg8zTIyHFTyJmfDv2yft/BM8FnkzlIMp3sRaveWzKaStwATqLi6NlOtUxjCHOgC38I3luNzB8I9OK5QGYCYUakEbLXPbSZO+T5r7aBaRzHD6ACiZZ0pcbaGi2sadkOGBBgzs2BSha3Kw7EGH0L9c/dC/NPyFc/hxmxxVf8RVw0nltXhTrpoXjjGWE4FHZj9Xn/3LUI0kOFoo155BNiWo/n9hxoatPuKHZCGOaitc/UvATVdCgZuW4po7tL3RdL/ypethTxXfn9GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe2U+LhScJdLs3SLVSEMDify1Tq9UX8BcdqYYQxzCc4=;
 b=M42kTadtc8wUtOT+Ip4D1APKM5b/jFHYmFYXu4E13OgFweKP9/dZT3MhHOyTVq0rAYvqyECmJPQ7kHdiSF0wo26rlu2hidInyz28hS0LJhHMSfujKdvkREvjHD5SDqUdSJ72EOpQNb2TRCpFyotAj4vgiWVfZUir/xKquAK5suc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:38 +0000
Message-ID: <87jyzx8lr6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 020/292] ASoC: codecs: adau1977: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:38 +0000
X-ClientProxiedBy: TY4PR01CA0109.jpnprd01.prod.outlook.com
 (2603:1096:405:378::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: b4219a57-1c78-4099-577c-08de20b7dc5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mrGpC/s0gUITULq7RxJGXmZG13VGdnK0XljnCmkO/Ejb4tnNdhIf7zyfV4d6?=
 =?us-ascii?Q?lNWK+tkpYp3W4LUm4vgFUtqbKB7YHf/AUD5yPT9cUUqUSsW4yAkaQYGcKk70?=
 =?us-ascii?Q?RALvrOeNgszvnp5KWg8TbKzb1Jv27VfEk57au5K93DNKRc2io7zCpRDYKwBg?=
 =?us-ascii?Q?QoFy63KdaonhY4ne//1ddHVNbL8GplHNGEqebUkpXaJRSe+wVx7TdlyJvB2g?=
 =?us-ascii?Q?zwQMNhF6iqFMxJiLokPMo8PsLXFYVg8nyDQB2Kz/WJKcLKsFaSsn8slRzRbW?=
 =?us-ascii?Q?zXlBrk8/0YnC982meTgnuc+F4LnFnYwoDGELHSrySauthXQDP9PnGnmkx57K?=
 =?us-ascii?Q?lbzq9do4TaBzrv67CIhYehmkPcAwYZ0b89I4DgHC337IRuYk5cQiY9C72QJM?=
 =?us-ascii?Q?VYxJEjV8wNrN4kb2NgzilhC6xKqHf09QfvDDOcCjeX2GsC+WFVPPz9ZfJrFm?=
 =?us-ascii?Q?ORxyf1Fz1lnwXNLiHp5/jc6DMRHvnOM1q5y5JSsSxdrKurik2YWakbe+3ulE?=
 =?us-ascii?Q?VbQkxcsuZyUyBLENY+vr4LloHaEoAOy3iN+49yL+RgSnox2MpjBmm/7wzr+g?=
 =?us-ascii?Q?eNpYHy+SGQi9YVWR8zGNnfrpAiMeXxnz2YEcGL56fDo1aGsnZjNajn9QYqNU?=
 =?us-ascii?Q?KfcOdKCVkfWScqy79DbWNkhywNx6h+IIBd2IsMyzcTPo3uXRqtzF4NQNbKgn?=
 =?us-ascii?Q?dLF7bqT/3XMSutcN2LKdbVdAQ7tz08vcQPmvTXFYZGr/Mxz3wY2IZr0B98Xb?=
 =?us-ascii?Q?0uhu+uNWrIkVwel8+X0TWjrW/2Jz9LJxvwKVljX2lwpavBBQbr1exiPbpk4w?=
 =?us-ascii?Q?DStLgnPiG8lEkgUJNm/Uh1UDk4bfb1ID8kMeuyvGpk7AfgrSHgTeRED1uWMn?=
 =?us-ascii?Q?Pn7736LU9dYu/fwyfLbhyjFFBBHrg+YZWYF2jSaWigqRdVyUBDk0AuX3T5Td?=
 =?us-ascii?Q?TAkxieURXFKATuDOlwj7oBPDV/w0OW5+oCLKrf+CmQhN7W9hKz5OGJ5cgnlH?=
 =?us-ascii?Q?JxVqPz6Xvvuv7R6VJ5jo882vmW5WZo6TKc7nZDhL3AuS12hBbildUEQQwKHj?=
 =?us-ascii?Q?kcvt1lt1eRJP1u8HkfCMvNPmEkVEay3IUstBtjCz8NN4+df9ZRNLAaxBCWFS?=
 =?us-ascii?Q?OBO5ROGc/86mxL3Q70cgPkmIi5XRzRMj6IuBtsKwTxkaQVfvlazjzG5pjvDv?=
 =?us-ascii?Q?T4gp9PW584g2r2GwL3lpq818rlzbBEGa0pFu39vr+38mlLKDn7ZrWiqtwlfZ?=
 =?us-ascii?Q?21INC6EtSvl7qxsNFYEFJQ1V9ukHqhO2Y0ZpnXSJCjpGTndpMnOPLG+cdzr/?=
 =?us-ascii?Q?jP1eqDFfPgb8evyOU1mVFmSx9wygm/7QLUv7931Hbmre0bNDt7RU3NAY3Al1?=
 =?us-ascii?Q?PcuualOZ6vNNKLV/7YLt1ujWaKqQsDD6ATBZZShlNJZDfjShDW2I88hYhyjU?=
 =?us-ascii?Q?VwlSn+urTN2gQ7cVQoQzyBtEidRC42pZTFCP8RdfwencpSzBSuUHvHbV54IJ?=
 =?us-ascii?Q?cogu/bU+7lpbTgZYhHP3jYXXpdS+/jKkilpy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?utY/1C1LHMKQGKFJVxk2NkfHKU5udR8LqhsUiDB1Qo2NSLSD+QAP+aE8YB2Z?=
 =?us-ascii?Q?MMovBlvp1uzg2+mfhx85x3Qw2w53Xe7aGC2FUALCcJtgdCg0TEYzEEyJZS8I?=
 =?us-ascii?Q?FYkjt4g5YXpiWLbkkyTAIKeE9r0LGOYEj6GjLerPRCMI+Bwzi1k4kcaXe2Zx?=
 =?us-ascii?Q?AjzzdDHW2SgWLbwrCGIjfrJ4Z5MEsHf+PCMvUqUXacIjbALEvALTtzvMaz5X?=
 =?us-ascii?Q?Qyrgiy7ktMMAZXi3eHjM1Z/Hf8hrFlRi7Ov2EBWsqdAM3MRn62dzSXY/i++p?=
 =?us-ascii?Q?js5P8A92tqSGw1kYsLpBWTHfX8Pb7Wz9VjnIiB1Lu3jB4xQG5Sk8dd5c60u8?=
 =?us-ascii?Q?nF6fhLs7Pu+cs6ZotI+u0UEHyaNoQsb3bb2zMYDlhPVYoK4OEtXDkWAgGJTt?=
 =?us-ascii?Q?4kdoNJNtXbURDIkj/4YLtq6PMxbf/doI42QX16DYAXrGJRPWLJMp+N91Qe/q?=
 =?us-ascii?Q?fkx9lmV/PzNJqzn+wGWBnrqPSDmQUHZ7XfOtj5+ydYGatXu96szM3oDTOAJX?=
 =?us-ascii?Q?lYTVYrinyuZTXdyn3tA4oSjkAicknvNlvoMdMfJxqD5OwPg5RtiCx9JNTHo3?=
 =?us-ascii?Q?PboBySjVgu6UcwODuSyjHBzWhb/Hwi+zaR9C9ywKuFL4AmUlahmuD2il3Uvi?=
 =?us-ascii?Q?ZQApvZDV0SL1n+K0ya9fufZC55vwrDrZOuy3BKU0kqxZVP9r3sRU0Yds2gZG?=
 =?us-ascii?Q?3S2fV2WaZv1Aar8nTsSX/vcyxzc8DRE8usRAY8IQ7LvTxAHAquT+tgQsFLpt?=
 =?us-ascii?Q?Q7pMDqG1O3rJsy4rO6m82wffZJcwArbxDZFdMwA4qsl44cuyt+hDdOzlCp+k?=
 =?us-ascii?Q?R6W9Z+pVbmXO/Djsp+1Hx/exi9bXMucWOrnYi48FceznQ8dkncVDLpEfxIEt?=
 =?us-ascii?Q?j2GB4W/+4KpVG+j2VQd5JUaMdhN5BrKeNFLbqpjtdaKe4G7hUzmBZO4xeR6i?=
 =?us-ascii?Q?KjdghYx72NlcPKQcwK0txDvChiSBDX2BP6elNOIthIR5JxToiDAMHQucqEnj?=
 =?us-ascii?Q?VKbtske6yQGZyumYlmTpkf2X5wJPYn5LNQRMSoYgo/+vDvpDPe/a7qy4Qz/J?=
 =?us-ascii?Q?tBdmtktFKy5KHa+9O8F4B/aOOtp5y4IScaPsSNmZiAHd4sxuxVp8BbXIXo61?=
 =?us-ascii?Q?ppgZnIzH8qI3kgvZ3RwzN1E1AhGVwFpEIe6RI9yYpWC8aknIn6v4t5LW1z82?=
 =?us-ascii?Q?Se385yIUQY7pv4WLxRiD+4914z8XpVwphtjSpEyUprssQanRfbIKDIiheTWl?=
 =?us-ascii?Q?uYkeRfmlzPzAgAx5MQvwijICmyvL0hZ5LfYysLt5q4+5ErH8WaCBTbO99Fug?=
 =?us-ascii?Q?/5UdEmbbQD9Z7GOyYv3R44vDayO7p0WabHJnmOIsc3Pmh3WCf/2JKRdbS+y9?=
 =?us-ascii?Q?L3CDpUdYkNv/Ii5E4YUJ9k7wam51/79LrH8yw6a5p9D5cls4dHyad5vXGxwa?=
 =?us-ascii?Q?4negI3u6XOzOqgrCtlmeYRiJ8yGp4ohOj8JXLmZvn85Qwzd+L6mUfKwl4juw?=
 =?us-ascii?Q?EjUVLYZHE0KHGE5h9JeQQAhkHNjHJOcos9/Yft5x833ErPqNArMyJ69qWvum?=
 =?us-ascii?Q?lxyz2+HfWyIrOsLHmB9R5mgXWId6K/ECWRqhxFXPF/dNdo5dsASIV4Y/63Ar?=
 =?us-ascii?Q?Gj4rxbiQK2MVIeRngsF6v4U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4219a57-1c78-4099-577c-08de20b7dc5e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:38.2660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3Szbb6XEFB4IrNTgJcN4TVjmxMjAg16sb1ETMhAuTmZO40ykpx9WgAQWuvVXZXAfF8WT/RIsy36jWH2ekWzziAW39kdKxufrL6hSYcRP2nH2NtGRLAV9GAXAZv1Mkr7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14299

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
 sound/soc/codecs/adau1977.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
index c193a9f22f590..b42f35b1a6036 100644
--- a/sound/soc/codecs/adau1977.c
+++ b/sound/soc/codecs/adau1977.c
@@ -473,6 +473,7 @@ static int adau1977_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
 	struct adau1977 *adau1977 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret = 0;
 
 	switch (level) {
@@ -481,7 +482,7 @@ static int adau1977_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			ret = adau1977_power_enable(adau1977);
 		break;
 	case SND_SOC_BIAS_OFF:
@@ -845,7 +846,7 @@ static int adau1977_set_sysclk(struct snd_soc_component *component,
 
 static int adau1977_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct adau1977 *adau1977 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-- 
2.43.0

