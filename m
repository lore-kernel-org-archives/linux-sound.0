Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5178A1D5ABA
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820863; cv=fail; b=Pzn4PyjVujLDigI7pj2CcSPZd5W1lfNL/3eh+mPGzcBdIFqZgt48GPOvxrs0UsFb5irztCRPFxak5WCR3lq74QlvIJAFB7EpdYVA8IOiR5R0drfXiyfzO/0KwNJLUmRUdYjglRLgmVIuP0VCcQw8E+pDCyKlddMqxnn/wFHU738=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820863; c=relaxed/simple;
	bh=xJbfDblFhSlRmltY1wSgRIhCYAEH5bMXTjLfo+nawJo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Iu4966yGzNQ9mrUMIVHG5u8mOo4ZKJLeWT4E9rTdbRLVeV5Xic7Tv92Od6iAI3tpynVJn/ozMojSJNAVAObDNdmvEYI5BCnMMnj4DUu0Cc2gX+9gEG9vSBq/fDGZ+4pYbaWCwdbMLFD/MQs/MrWBTlYh6UEeaCZ9PCJnhKLydFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hvB7ZedP; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hvB7ZedP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlisaGmYtMQRhd3ULypT2KGb1SloKBKyFYrZpnVJUH52epWyo/eIZHrOF78ILqRxpmpg8yVo8ACJzzqbPM+HpOgYJdbcerbSdcpMe3L2GfeUKOZqJeyInWlEA9Jh7MFW3Z11xgA+Ld9TF8uv691b5F5iOgj1/5/cZHTWN5P2LUxXCh4uniLe3AsFp++uF8+sBnHF7XWtm61hoCrbhIpmI2HOee2GD1hWBn23H0hRMbUu8GueHbhdavNHQBqRJGieFncID79DR/qozOEqR7uKQPMyHSe0igmStBka+C9ng/oET9mYtLsZAuT6IuTKBnZnD1mwvOhT1hTIEYjiMbf5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUNFXBOPmoqD0s2y0Vd9qu0S6ClfGf3QO2bBSq8YiE8=;
 b=B8HyMxaEZ+K2n++3xbbxf4aw8YS04+cn2i80m5f8p8XGU4MJ2P12VIjBLu7eV4L+xIEscJw0zDa95Csn4/BJ5bzbWnQqW0yKFcH9vdpvDcitRhHjYUmCVUO5a8prqxMXMH/2gkUgLVsrdfHHy0L6vzGmdUR/fK+M8yEmCtEDD+PSEAQVc+OVNLK3zwoxzTk55dgqPf1IkchZinQdmk5ZdVyCQdpUIr+Ke9MsCFBujek3tu1pLs4FVmtFHdmdOhb/p0BEHXVW+0s/t/oR+yh/JKc9cYli5XpbbDdHvTkqQ4OrfjI9OGp1kpl2/S9eibASh4ocu9TmF+8DIk/8RTfneQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUNFXBOPmoqD0s2y0Vd9qu0S6ClfGf3QO2bBSq8YiE8=;
 b=hvB7ZedPH9nES2N9ctr43bwiE/JLDKYN/ykYfqkjVTqikmwxPicpAzU8IPW7f9letOYuhSMzQg9FYwbCU8KVc5+8/Errsloq1+6OM/KAwArKqT4YbnTZpiPXrvmO2PheoeNga/bMql4uNgJUD+307qSfjgeOEBjOFaJYFaw0gvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:27:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:27:39 +0000
Message-ID: <87ikfh1khx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 145/292] ASoC: codecs: uda1380: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:27:39 +0000
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 140e2a8a-881c-4921-4038-08de20b91ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nvwU0llZ7aG1/rsJK1SGSW2TRVXOwheKbFChGw3Tud8GNI5uRGzF1ip/1Q+l?=
 =?us-ascii?Q?e5oX0oSDggDOnTwYRj/1SWX6vUqjSrTtg8ZRpWZGaAw4E+zVXZ3PPSUtPrDQ?=
 =?us-ascii?Q?qNX0SYtBwEAPjQjE/DGc/FPZQVg4FqflK7JZX/MMEs5UW4D5McjU1xkM9H21?=
 =?us-ascii?Q?vNR0JqK7zJpkcLq8XEECbFhe9w/kD0taaciSDC5iQYTlQKEELPYLQy58gvts?=
 =?us-ascii?Q?HiBgpyyShLIG/5qh+36NaV3X0vqHIRsNG4dehszy8M+ALDEaXfkoFUx2NxC9?=
 =?us-ascii?Q?Fjf0qg5TzUKjeYqobzAftAa37w7JW/iGr2y6CMb38NvS16ub0xk1hj75C+ds?=
 =?us-ascii?Q?jXoRgPNaYFH2RU2uOBiB4XFe0nKLXIv3q9dNkVjs+wE4TzmDe8uRQzTWs89S?=
 =?us-ascii?Q?fG/gtXTpZEvgBdNhX+CAcQ7nIRitqXR98peWAlrDjfYJlgQHi++OXVWQVL3d?=
 =?us-ascii?Q?jBqD9C/wH1Tz+ZsEd85EG6iIsJHLDiVzVV3ZvnoK+UlVQkGHy93cQ+0nJCxC?=
 =?us-ascii?Q?CR+ODI1RixIfva0zzgxciwTbTXPPfWeALZBcT8zKpu28VRDJD6LIpZeOfIWh?=
 =?us-ascii?Q?XfGM9xc4MtWQx8CovVEUFQjw3lq5rvKxFnFWu2xofp9UTtq7992SEz4TQtLP?=
 =?us-ascii?Q?EzBUiTOJD8GcvbLvtLBtf6+sq11nABLYZ43VaSr4xwnUJXBJ1j0w2rCSjpzY?=
 =?us-ascii?Q?4I4/5NQQ2jwKfDpZprdCWo4LgYGR50/Epvlq/labfB3dgqGhdvUJFX55lL6A?=
 =?us-ascii?Q?W7WUlrEH2Ir46zlAsnjZKRv7o4coLi+CeAXCAxM5wlLTa70uTXblEepZkmLj?=
 =?us-ascii?Q?qOq42m4AuSGPMDJ3FFAgnMo7vlOT42M0azwt+4Q+agrh9Dg5nIPhaz5PczCk?=
 =?us-ascii?Q?4Ns9v1ao0CZUEarSCr0fREft40l2nA4gmhu+atzAq2B7O0pBKCYJvaDqYjOq?=
 =?us-ascii?Q?qh4OtDifYw++9GbhDdhLYrw0UAGAgnyjkkdR3EKJgE4oijrUXyrfMcZ+287U?=
 =?us-ascii?Q?+hjUnKkNaj3mfKMf+w7X/L8CxiKiG/p9edycXbItNxrskpqWqdf6HuKurXmV?=
 =?us-ascii?Q?oAqyvVprR57T20nG/+ILy6BLOvt7xyHRD7AFdrjBIbOOK01jMcUNQEO+/qF0?=
 =?us-ascii?Q?M7dmLjVn8L3a34w1C8/tRa/RvH9Uzj9/q8S50g31LqH5GZ90VrodiKmlmaG8?=
 =?us-ascii?Q?pgVWzsVR/BfMaCmeojkHctFfFM3kZKKM3rdgOM9DgX6aXeT4LdtzHl/h5fpy?=
 =?us-ascii?Q?nawPO/noPRvIXcILQe06XmA1E6MA2byTjOQ5QfGDmW0/9bl7AKUyeezkoczn?=
 =?us-ascii?Q?mkoAzVySdsVDzW65K9xWU4A0rit1FL1qER356ZlT+4DvgeQn3gQtSvdp3Ccz?=
 =?us-ascii?Q?1ch5d9bGGtoCpaIkPx+rr93ez7MuMT+R3EUBdcivyCEWC3VyHCfqps7SG1ob?=
 =?us-ascii?Q?2gdln/Edzdy9zRniv4UiqoItZx3QKSK1n0IrzGTd8o5cd5Mwz7gpnD6jrLj4?=
 =?us-ascii?Q?acRpZL/DDf4oBEvBFgo1kxpFcgXVgjr6H9Pi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9SJQ1ocp++ZYPBr8ynkNl/4L+nFMISG50R0Cz+U7cYZirBYIo36XBhhHuL9P?=
 =?us-ascii?Q?ODRElFuSwVULVWoxYbGwPLfk5hxJEUWiPDRbuoQeJbdj2lAJBp6UQOm19qLm?=
 =?us-ascii?Q?mW1hqx+/fucOOgDPggs+8Kj1HsHHWR0G/0zxJL//5Xqm9Y5ClKEZxSgRVK9P?=
 =?us-ascii?Q?esw0bo5zs1cEQmv7G35vPVwYvv9+4OhS8DrMToAwItE8HalPHrvWYpUaZQ9V?=
 =?us-ascii?Q?u+4FK4E11jt5N3DfwLbYsW8nA10Px9g9wXaEMyxcg52VpLMwcDs3FzOZ00Qw?=
 =?us-ascii?Q?hFlmQzXnTuPAGqJf+F+Edk1e+Lv6J4NiRgioRCRrFo9BYfHwMS2VzOmq+ynC?=
 =?us-ascii?Q?IEPuxvZww6u8OU23niVvBELieMVV/CmI7oXu6pw3XhraNRtD5wgBKdU7Fy89?=
 =?us-ascii?Q?y29dWKvyRikqeRTq7sPbt7UYHcsuaS5uqxB779tZktrh6vSKKdGyymPPmIWx?=
 =?us-ascii?Q?zfsIab2SeE7StuRaNuVzR6R9uy2N6p5w0LIbknqkzlCea8i76YUtjH4PRoyk?=
 =?us-ascii?Q?oSA8G3FXVjcEy7HmNgJR5BtLco/enx91gybNUWOga5PfXmWiK9chMP3T666M?=
 =?us-ascii?Q?fDyEHckCGkgs4a6yRinA2EurwO0C+ua1oC/Qh8u5UPZ/X9v5gpipG03Oymfi?=
 =?us-ascii?Q?N4QzZvhBznVnBBfNK7pQCZoNhqR/a6kCTviOfrNd+TTS+NDJBS9EWRyk0mH1?=
 =?us-ascii?Q?Z/502adhQ8QSOuUOeWJHIapXHBOO2tccDpbk7N9NVn716TYhFRwv5E6qEyLg?=
 =?us-ascii?Q?OFhGhl0RE4038i45KahcN8Z6Kz+fOuROvJwRGOOKShefNPCTRg0DsMAmDUJu?=
 =?us-ascii?Q?4AQkUJ9T3FaA/HIgyIyVugLLZODDJ6zzOfWq7c21yIiKGG7qdrFC6oKeN67l?=
 =?us-ascii?Q?uCUdTlV4rjBbDhMqut8wldkupkxy7CdFujvIoEX3S85RiHhgnYLAGtvmh2IJ?=
 =?us-ascii?Q?HLVZeoko4uFOZdIXnIwFgAnWLZ0hxRSMxaGK2Vp8I1kCRB10T5N+FLWQ/r8G?=
 =?us-ascii?Q?2Sp12QRV73nmVkzPDGYvGHd9K/Cl0ouEEo0zdf68Hr5kjXU1tHtkiftX3Hdj?=
 =?us-ascii?Q?mkFrM5k2umWR+xPnfdtr3xAgAiCWtCBaVT2ZxhGTwORg33vZzGxGuCeP/yTA?=
 =?us-ascii?Q?1+QaxWUENI7jZxWOVR4U5LtpqldcK0Fj+B8lYH2F6je3cUKh9EEubXnVTdIG?=
 =?us-ascii?Q?sqoM4/sa9UgfEVvDEbWnVkQkxSxDJN7qexKoWRZFii+dGTsEnRenbi305LoT?=
 =?us-ascii?Q?ToQ6lqQQiOqhZzcENB0srmEwPR13JbyRUbw8GTsPcHKtfcxKfBHmoRYe8BBt?=
 =?us-ascii?Q?sY0KEqq/3Qswulp6VvNuBwNbA1ufJHR8+8v550LwGjroeayZQYrCFqjlSaMd?=
 =?us-ascii?Q?GlMKqtF7l1gyC0pnlNKbCG+smEsQukVrSof6tux/NjrO4Q2PzJolqIBw3a8m?=
 =?us-ascii?Q?4ATrTjhOCCiqON6jE0/3O3DmhxlHnAKuoDgPoKW7TavoM9YjsqOWtl+bczDC?=
 =?us-ascii?Q?WM1JwLwngQuLJCyCLOwTSLx7MHVq0DoD3MjlJpXXeBcqqcY48lCVdg5yL32A?=
 =?us-ascii?Q?xqPf8Xq7jXy/DvmcK2WT8PWPZWiDtnqRjDZ4I5PBVD3qvnLauAMCJ8VugwLL?=
 =?us-ascii?Q?XhDd9XRQDnLfrlCtotiEM3w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140e2a8a-881c-4921-4038-08de20b91ee0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:27:39.3325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0eyE0zqZ+aHStdyoyskqK8d5hJj3Mnnl3NuRlJ2smhCdvN84fd1RPbAq+XZ7/uMVb2hV9ygusXyTDmzh54AZkeBRQV1wfx/nsmuFKdr6X2bsLJLSO3o8yBDHf7C6D6i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

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
 sound/soc/codecs/uda1380.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index c179d865b9383..9e9c540a45ca9 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -588,6 +588,7 @@ static void uda1380_pcm_shutdown(struct snd_pcm_substream *substream,
 static int uda1380_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int pm = uda1380_read_reg_cache(component, UDA1380_PM);
 	int reg;
 	struct uda1380_platform_data *pdata = component->dev->platform_data;
@@ -599,7 +600,7 @@ static int uda1380_set_bias_level(struct snd_soc_component *component,
 		uda1380_write(component, UDA1380_PM, R02_PON_BIAS | pm);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			if (gpio_is_valid(pdata->gpio_power)) {
 				gpio_set_value(pdata->gpio_power, 1);
 				mdelay(1);
-- 
2.43.0

