Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F671D63C2
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820788; cv=fail; b=fD/wUJMAhefdaoAkWZWMNQxNvl2toFfkjlTBuUvRv1BI6aVuK0P/uwsgrznCIA4TgIlR80VOvzRL6IPrz861vU0iUBcJia2MGzUWmvSyM7uoaPDOxqgJCguK8QAOF/z0/H6MTnQElL1KQpGoYi5yvtzQQP3UEm/zj+W/MHu6lhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820788; c=relaxed/simple;
	bh=aZHFouda/Z7t5wDFtmnXIq/KLWlVJlK5nWKb8lhihXw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=D7dd5PYT+HWvfVjrmvwssfrELm3QtAz0RgovwYUOpru92A4K0xCYFRdRm4NfxDVEtwcEI6HINNZeOweYHB6JNoaf0OeFqj50LotzF31Ku3E1eeOVkWnum9Fqu1t3ZVE40Vm7VyEw5dRPSkXfmARy5+9X4r6e9OpBxXrQAgI20+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dDykND1y; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dDykND1y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRqjza0EQ888pQFKyT2+R1xYNTSa7iVi9WuKG2oM9nOA5WAOqunKXiwk9AFFPGjF0BiTP4EkfdiSbLv9Sglz4rnlYoOD4eP2Sm/vaXUUk1L698rYcPJxME3L4ag9snE4waErKxwg5ZAO/7yLHm5l/fBnsAhTNnuSa9qXY/b7EUQvUbxBUzGruNdKFvtwseRABkXmi7C5qf0laC6LFYJIZ5AQBIoG/BnnWnNipY5vqFSETmA2s6LreAVa1Jncsdfqkpg0HEub3yhBIJ4RkgBG4l20maH03hW2G4F/LcVvzCoZUJSz1y9qWLPu1xh2Ld9YUjOsWrUW66TtnkHWt3w1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOyJ0lN0p7o3z3bJJ2YEsS1YLVm2GiHTJCRZ3i4EJ0M=;
 b=EFWp8bjIEcIxbGuprH0ZoeDBf5YPAJDcQRVSP+KArF3k2aaEzpG70neNLUHEBWb0li1bInpZ2FEKOjpvv6gqIlG8MO/5UIBTwCBSNZ1im5Mtt6u07M7y+Vq7xn2H31hkEq8ERgCMiSNxClhvKn0WfgXSHteeRDfyyeIbOnturn8wa+FJr3p+2zE3vMHT8BWDcECiMiPWTuyca6DqtBsVCjjPjVlLOhByFuJ5A5N62TJTwe0uuX2wA66MG6WIDM0EMjxRf27AlT2Tncwu14p2yIHn6P3w2k7p3/WQn0+90IbZvZh+YeaweNAwRnHh8KpeZOQ9AjLyZ/q2/G7O6wanqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOyJ0lN0p7o3z3bJJ2YEsS1YLVm2GiHTJCRZ3i4EJ0M=;
 b=dDykND1y6LpOWkXnlNCgPUl79Bo/JdLTiPFglRkecvA2fmocEuXIudWOBMwwF2OI+DkbGgWB77HDS06dKobcGFjQFYDu1L2LNKp8xRtCEIDPG3OV5QgD2ZnzL/nqFH0lK/mKhzV+cgpITGY2MrJ1ExyH8m5W4Q1uo+O8rVWZ4HQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:24 +0000
Message-ID: <874ir12z4g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 130/292] ASoC: codecs: ssm2518: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:23 +0000
X-ClientProxiedBy: TYCP286CA0153.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: ad956161-daaf-4729-5d52-08de20b8f206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jZXmvdmnLviB8o08dbeVRAYO1cQqoQxTM6fAw9mPx8DPxvCck5s3cp9Va8/3?=
 =?us-ascii?Q?1X3sLimnzXJbFbuZ9OiSX7ef7RRVhELCrphd6KbbddnEOsKtmTn7Dc5yu7cS?=
 =?us-ascii?Q?GDG0FKWSnVVXB90bm4iBBKef0PQle+qknZKPVKC5zSb3r9p7kf524yW+6UZk?=
 =?us-ascii?Q?yQsi8dF3YWV33t7R7KHePexU2w30vhvwn7m2232MjZgCXcRoGmpvC8v5zQdP?=
 =?us-ascii?Q?AKr9AXfxK61x+WarAr1RupCC9MkVjfrPgD/8X/d+0aXxFbTyF9MTcBfOK0s6?=
 =?us-ascii?Q?yc9FwzIjbtYcQ4ZGucIAiyr2n25QG+Q6d/CCiXQadzwvcXLSKkoX9r+fukQc?=
 =?us-ascii?Q?UMYZwNt3KQ6bwZHYX220QFq6Fmn6sbJ3Ws2XPbMbOh3jkBEopxQtz3G7jA1y?=
 =?us-ascii?Q?xS+D88eg1gXpXV3B5puvnUmH6rLs+xhrwXffdr+kr/2GVXGVbizBF40WDnFy?=
 =?us-ascii?Q?rPNuXgFbsXOI6N2R2LS2PPb5TtAhl/UczQjLWp+FNGVtnwzwlwqoPYYsMiuh?=
 =?us-ascii?Q?zgTdClM3NEXF/kLmy3QHb/JdiqQ+UKtpl/hYiMNj0g/HoX2NnXfGTtClbZwZ?=
 =?us-ascii?Q?YKMCdrFeXGi6J70dyCpEIyurGsGYUnK8H7SXOp5G1OzlQP0cjiwEMFNYMmRF?=
 =?us-ascii?Q?/Jt328vWrGGMXPjctT1fm7zqJYU9cdMCW3K424yLRq/K1EYZra3+9YXoE2C/?=
 =?us-ascii?Q?kkIAd+ChZMu8WdZ4XDg95zhCGW9Z8avUvd1oaTev5IkgJWWyLE9wJCyDeL2M?=
 =?us-ascii?Q?zplFT/gpaAtMzybcQ6KyUTReIOwo+g+JpqSgrOS9KLjD38Vscm7ZF3r8+QX8?=
 =?us-ascii?Q?hPAaYsGfyrNlqKKgqDxq+uXVR8X/6AqSNWjnoG0SPYTjN9X6T1pyqFJu7Ax6?=
 =?us-ascii?Q?z5+ZaVjogkiRJcQEeu81ZJ+6VCHwHCWzRdEQpmICAZRGOXIfwPfIJ3s90CBO?=
 =?us-ascii?Q?5VoEKWUHCvFj3auv2zcnNG687kT+DILi/5t3ERos1md+ESV1iGsXKUT2hx9J?=
 =?us-ascii?Q?XQ43IT74rH2hdvGZkOvP/GyOEdY/FpQpeLvLmxmBno0vUhzyk02sZuMo952k?=
 =?us-ascii?Q?uwqDJAlSr8pjmfZPVrA/wA+fohmtk5ggdkx/dU5Rrhnhf9l6k6nVHOAz3Asc?=
 =?us-ascii?Q?sWIaFqDdGBg5mCPdEVNSZJd8QzUgH+ySZIPhmZtDFAL9GKXfurPQUxnNjHhe?=
 =?us-ascii?Q?DLA6IsHsznT4hq75ydnSkjBbwq/d78OQPKGNY3C9Zrn+rlAp8u6ei54oWTOJ?=
 =?us-ascii?Q?0Mu+ii+dhSo7zd+usENeLFHBWyZ953W8TDxSzB6teOuHhfsEiR1qV/dI2Hzl?=
 =?us-ascii?Q?zrihykWQ4082R1l1gfUtS4JMHbHr4heaOWiMOlfFy2Ok0JBFRujYaNzaOYOk?=
 =?us-ascii?Q?Ip+U6JF57zm7mabzU8iz4nNNoNoUNco2+wYZmKtj3WqDkcv07GbQ6WPQSliJ?=
 =?us-ascii?Q?G/PeIanHctZ3KMtzduFWRp/PeZTGfUUbQvHqdvwYTjc6rKyl+IwKSxoLC9tn?=
 =?us-ascii?Q?cc6NStBGFnCIzZNEyHkyMLE5MfILEhSfrNz+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8oLavSlSeivuDlpNBJn9j8OTd+NOnC645tlMKUvR30sdv9YaqN4j6XZoQ1Ck?=
 =?us-ascii?Q?ta0jaZz7jhbavmY6MWl3azTIrJPRS9zIpk1bIiH2qbe0m8YOaHEMSbmQvP+W?=
 =?us-ascii?Q?WXVWryyhOr/4bvgsBSZgAU2dBoNzzjZ5p/toTvqcpk1FLkhAYzxYi5XnB2ej?=
 =?us-ascii?Q?OO3JCKHlLBi+EgJY4LdW109opuF28lc6zN7lQyPyoPUuH0v/U/QJtNcPq7vk?=
 =?us-ascii?Q?Wg/bMFOVMSFexCMwi7UxTa4U+ddJpq6ACG2+omIRlqXcvKbmshBsnNmSJydN?=
 =?us-ascii?Q?lyW5YWCyN9qenvtqz/Iix2A5pmZeqY34SSHFNeHaqSKTqi0QTZ/VDbmlwKzT?=
 =?us-ascii?Q?SBAJ5Cnv1xNrW0llMKZB641gEjGuG+PCgOX4EdMWVf34BHqkqn7Ghwh4BV/U?=
 =?us-ascii?Q?cObBMrliRZ0ou7HhsfwI14sJcPpVeNpDlv5XK2zGKFqf7sQfmhavBz+kKBSp?=
 =?us-ascii?Q?1P0uyMarcg7512MHxK5e7GAQ7mGFva+HknBwjH80fEb1xu/DAi5vqsfHQBKF?=
 =?us-ascii?Q?UpLwrdrRocHPHQP9l9v9XLKLLbVg2D2kzH22W4JdMWRAm1LXMxBd0EuNMY7d?=
 =?us-ascii?Q?bAISEcCI/oIyv7OxgQaJivI4RIKgwNbvUt/eve+KlQE9f2/Xds2lWte868n2?=
 =?us-ascii?Q?Y/kvW2OaXJq8KFi98OlGRU1bye9uFgoRngXYe13/KnXQaTbuvcN9tyhOAoJm?=
 =?us-ascii?Q?ZB0oZ5QPuYi42JYcnrlnCfBLlur2EFuhK4ByOKxkYy9K8zi3YT5HxdZWntoG?=
 =?us-ascii?Q?e3lyAWS3KsnnUHsUR6KKzZZ2Zz647gs+bzGuxfzLTgM9BYqkVmy2f+3RHjnD?=
 =?us-ascii?Q?QQUZG6CtGfxxKNrlEZzIUko/TSnEA37sijcEF+89MeeuTUZo8wwxfN8kg9zt?=
 =?us-ascii?Q?uV2gGHpZG78739cVIBPs5pdNG8ddJndngRQECLtdEQZWNanOBBJ+xS3OC2k4?=
 =?us-ascii?Q?JblPpXSFBD88hfxQJHUcCE2do4kwdFuUWnYhp7cOiLeRY+NEk2u5dhTjnVGw?=
 =?us-ascii?Q?CntLoDOwzNogN1hovzaEdvmkVIypsmc9pw9SLwbhlO7it3Nt9HZyk7F+Yij8?=
 =?us-ascii?Q?ijCK/Nopa8zfkXUxR9z6X2TmWE/Ca2fhOsYIqJ11OEjVshEgQ+c7GBysoSdm?=
 =?us-ascii?Q?gFQ0O5cJovwjgdQkSWBZS/g4m/GTtTrywDfHbY3dpdqXueTPKopoJ2eJiAB+?=
 =?us-ascii?Q?Viut4CG9b0bzwlJRyDFw2QTrdjGjeoojXBQMwi9H8UkkFN8I1DJh7H1NH8Cm?=
 =?us-ascii?Q?tRD+gXvsSSDySts7ZSq3W2iTRZWP1fUIRIUd5xIVwQcSYM9WahTeeI6egAaL?=
 =?us-ascii?Q?qpVM0HNcTAR+wm4Q0H+KMCmSZC3mNEhsdndJKmdb0S/mQqKbPvZdGguzWzH+?=
 =?us-ascii?Q?67wBdQNyimLvU4bjLARwASi7tUgc1Buy0YKQWjQhciKuFzoLlaiZ49L5r9FX?=
 =?us-ascii?Q?N78dcDqiqG/extz7SCLX58OdoExntj2pK3+twg0cMcxiJVAiJoBYAU8peNTo?=
 =?us-ascii?Q?wp1zjX2sb9/Pb8qrkMYIotsXuzkSPEDZhHBiTQflslKPbh3UVW+6g6EtZHdN?=
 =?us-ascii?Q?gyPAHs+6xNUncKWay3tuv13uOFgDLRDgqjD+3wFRjQLeYrtUjUsuugEvOBLc?=
 =?us-ascii?Q?cDHn4kxsoCCSs4LbmPXWwh4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad956161-daaf-4729-5d52-08de20b8f206
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:24.1100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTUcU4HZbfdzD+5ABnZSgsjiv8qdVLN++1zQj65JKF9emOTY9idguxWm0n5JSaqtLd+dBzaroUfB2gVWZ/QBUQPZR+/n97RmIldGCNuFn4Xsqt8Q94OYRL3WUiTxXQ+T
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
 sound/soc/codecs/ssm2518.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ssm2518.c b/sound/soc/codecs/ssm2518.c
index 06016e88dd270..9008e5416004f 100644
--- a/sound/soc/codecs/ssm2518.c
+++ b/sound/soc/codecs/ssm2518.c
@@ -500,6 +500,7 @@ static int ssm2518_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
 	struct ssm2518 *ssm2518 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret = 0;
 
 	switch (level) {
@@ -508,7 +509,7 @@ static int ssm2518_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			ret = ssm2518_set_power(ssm2518, true);
 		break;
 	case SND_SOC_BIAS_OFF:
-- 
2.43.0

