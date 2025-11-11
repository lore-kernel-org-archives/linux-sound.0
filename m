Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B655A1E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820958; cv=fail; b=trYVl1WU+Yi2uEWlit2tU0Ao02qcgM7OwQg3tSsAfNuOxAev7wMyFmSM4fkIgQB9DyRBHHFfkmrqIznR3Q22fAWZpWDpUbWsKC8dhCzBPOetdiPUm4+YE/nS67ltKBc9QQeMbMUqn691nkhg3gh4UekpgObGr+ndWw1hTIReI4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820958; c=relaxed/simple;
	bh=Hd8k1iEIh3tST7Hxg6k4z21I/xiYhIIBm+50syaFSjI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t6D0txMNsv4W6aClotl/yjexrhGe0+6hvwl6G+363OLtHnqGsUfvKMGg/lB3GDR84J1XSxpc0rHwkXtcZHFyVt9VSJF04NW0UKA299Xts1ajDPEqFLmsHuEIEDLmYSQMweyk7cSU4RFy1anvnbHb3G1NMVlPsGshGMkPCFZRUJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CUbgQ3u/; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CUbgQ3u/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDGXNU2wJb5NM5X6ffnzszm0r15k5obiiWIF88yR2gBPudgt1ZK6cI3mS/HSTicmcpZ4l1Meo0F32P6GCxtHybChh1/ST7TZFjT6mIkEH9OxCR7nX0AqK2al++bBfPEtJoVTCPrA0E5z25xB6bK5m2z7coxGn8d6x5UuzgMVu5vzH0Sd+vUQg/CS8ipOEml9BKybw5Wk4NOFFnA6aoNk6ZOWorObD5E2K85lOxKQ2Qs3Y2dcKmpULKqXDa1p5zHJc9jhNmh8U+IXqZ/orA58FPkkDPDwoCAPX+3pkpJSueBN27Qw0sCiqjQQnNAaQT0lR7qL3OT/7ZNWVZ4njnfPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8QEzvVvNi1NgHz2J2RTe3RgOSLcGKS6AQAcglKO/GI=;
 b=I1UT5YrOMi+7P63zjoV3IONZq3rR7eLxKfT9B1jz9D4wYcIzgth+1Njwpkw1FbSK7MLjPYeEG7lxYmBfCP3QzjwoS3wsAjVqEVVz+hBBYRAOqNh3XsVWFhZeF8htQda1Sz3Vs4QwxMoYXvydVtj1nyoe0o+pYrUQxPL0zRt7HXlyDLXPFMNbYQc6ggYjpoQbpj8Wg2z2rnpg0kA1/oP3m0lQyT0xPdmfQENmy0NWomsF3QYMUxJExU51Hiy9TTMmsH2+XUoh4G3i7NMrKpSEgPquD6xadBktXm7AdpJ+wuM4t+KcXL3rQmuuK35Y3A//rTQZlVeHQuLZUDb8muTuFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8QEzvVvNi1NgHz2J2RTe3RgOSLcGKS6AQAcglKO/GI=;
 b=CUbgQ3u/EZOcxM/nuZykkCmsdzwBplr5C6Z0t4Lk3El10J8MfeMWtGxwQhy2Es1+6k81qMomv+Ak+WUbtCOF736NbkdV1PZorywK0m6Kcf3swbyPUwzQnK0YySfXYehf2S8KyyvT6ZKJs8OrmBT5sJby1NfCehqU0DmNQWM+lEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:15 +0000
Message-ID: <87h5v1za1x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 171/292] ASoC: codecs: wm8955: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:14 +0000
X-ClientProxiedBy: TYCP286CA0269.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: 67924b61-dbdd-46fb-b29b-08de20b957df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R9irxslsbqCeHaPdZDNMS3jOaBb305FmwPGze9MBPMC78SLrWXGRj8PZ57uh?=
 =?us-ascii?Q?ht1fR77NFSev3nFEf5FlWqYw9HfEBAMNGDCAArJAYsoCRZdPfXtQPbW8yMY/?=
 =?us-ascii?Q?NJj3MMN92GIOxMXWbyuLIAg5ya8GspRkIs+liDIwjOk65DfTfCYgFPf9HICO?=
 =?us-ascii?Q?C32f+t2hlYF/8IrN2hrpKjLEnVk08kytamp+HXIKuvOkSIlBTOrxe3eKqgMl?=
 =?us-ascii?Q?aI5CXgFi8Ye7jY4syj8IgaLi1lWqfFg2a5DbKHof9AbgJpw1BaTYbDE+Y97B?=
 =?us-ascii?Q?xL/g7sfz0KJdqFCqYShkRpLiTUhpQyAQCkhqE/u4ICT6ipoJI+E3Z2M5o+vc?=
 =?us-ascii?Q?7k3ure8W07Ej2oaapb/YUzdDOCk6zpZLDd1VoYVco61/n1J+osRrnP45yLmD?=
 =?us-ascii?Q?wPOFMIuyrK+6+YDnwj/Pww9DyBDobUVxxMj172uGj6qW8pYB0IaZevQQ6dKJ?=
 =?us-ascii?Q?RgAF/FvlXjxgcTWNpKRCpPfgoX8hc25mT+6FAZfQqkeKeIuzbAgTZQg6raHm?=
 =?us-ascii?Q?F1NhMliIi5wZE++YarqACJy31Lq9HYnc5upmGDLx4BODGu+2r3iqQITZbKIX?=
 =?us-ascii?Q?aQ0Ay26gU4gHXfe8Ry5HNXCetkcZld8z0Bz9HNm6JJvLANeSy+z5nCoh10Sc?=
 =?us-ascii?Q?JinOYQeVow+FW/NYL2j9o73wlDRz/UZ1sb0pCgQM77rioWqJAj5NSOC82RTd?=
 =?us-ascii?Q?E/5GAQ/NFNtageQQieE3EZTXb4h+G0q6nLzr+p9fShFi6/le8Kl4RslFBYRh?=
 =?us-ascii?Q?deZSWtJRKTIKE/pPKe/V4amAhF54r/27+P1W/a/BgOgcllr6W9WPNkBxfdKK?=
 =?us-ascii?Q?tRJzHtc7s0id/u3Iuetlo2Ke0SIGCasxa7KoOD5cj4Ehky+Cb3u9/BQaiduD?=
 =?us-ascii?Q?c657JwgyhTFTHsHFkNbJJiVzbqFNhp2O+1O100Gm1Nfz8FMXblIDt5R2oP7H?=
 =?us-ascii?Q?M39UlntnDp0OyKs8ExWSDs9jcU452TQJr5fNFJZOFuK3tm9ELlJN8geKEO8/?=
 =?us-ascii?Q?NsBaE4JU6HOvLbvpjo4MzwZEA2y9w0PcMSsIOArB2XR7h++fTe8m8RM0iN5E?=
 =?us-ascii?Q?rrmM+818PHIPJ8UGncfl3RIFuEOb4wUXq0ijDBQfJUzzeauWpt5PGCDrsvvX?=
 =?us-ascii?Q?t8LqZ9S1XhOfuCQjBLLdtF82DFFPbQLfB+PB+mvoHLzHynveHgjaO5DjXMvY?=
 =?us-ascii?Q?ATeTGzHxQdmhayVf/KlDAveSVCn5yxrn4lfRSVYSBtXTmHoQEw5w7dLMDitM?=
 =?us-ascii?Q?mw1d5k+EBUNnEjjN5WnFA5wBQvQxk3YTdczZarDAxb+aSI3asEEIwM1Xzg7V?=
 =?us-ascii?Q?oD73VNJE/qr6oBN/8XCqHLfrBIr1rKO7bXAQbiadhKbj0Y+G/st2DXkpSNLv?=
 =?us-ascii?Q?R+dqXfFq5MCXjWsd6ffU1tt7R/w+0J6J/teUP/iqY0+W9mTKCTxAQqNCGxGz?=
 =?us-ascii?Q?lqFPkxtV7Z4ekKrhOKbditFBfhqwwV1yA/6wqBgXqfjBLPx0+aXQWraDtv1X?=
 =?us-ascii?Q?7DaG+pv7M9+Ut0S7sgnMIYG+7zfxKRitB/4+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RtTacgl8Eytn3a6P0tsVl0KJZ6pJbYNUZtlVl3MU2msxnpeYArJq1HNy4RzO?=
 =?us-ascii?Q?eR+7TzpQbWvdYTtUfNMhFqkvP2/fF9Z1AwCTA2TS0qai/VHNgPz2NbwgA6Hl?=
 =?us-ascii?Q?vtYwdi6FRTbv4mHmaqlHaFeHJ/q2PuXUmh0cWNyXHs87DwMs+TzPfrckMSVg?=
 =?us-ascii?Q?zJZwjwwtn5MZ/XyIsNzCxFgJ5/rXq75MAkv5ip4bTfOlipVu1sBxw3BGDNXa?=
 =?us-ascii?Q?yITMxvwdIzYpiXCHWPCGMsMhQh8w/+dgLCFUv9/BKX41n56vBvFw0qIRyGig?=
 =?us-ascii?Q?hWN0lTt7hwX6WNTk9dDlYq4bAQpNUpOAL83K6CWJUZCcGzTKDXDeDpNkp0OP?=
 =?us-ascii?Q?i62IHdZ2ugd9cKCZeyebHPIj/X/KojVsnRU46Fn68flyP3PCh+FUq051DNNY?=
 =?us-ascii?Q?hby8G1qC+hJ4Ty5TxV538YSwXHpKHyUOB4ZpNCCj2G2Ei/wwbBI9wSvrm7XL?=
 =?us-ascii?Q?cSDZQ5fwKCCGkH9+nIa0Zvq1qo1qrUeWJF/f5IarFUi9VL25YhqwFZe2Jrul?=
 =?us-ascii?Q?VDAw53Nefvdg7htvh/ru1b3D0tM58cdXxthK+ETSJZXCKDY7csYMdlXk+Ztt?=
 =?us-ascii?Q?ukRo0smlZzf7tYjpzwSWIJcfFkgyBqGZTmiEvxjdgXRNySb3DPlxfQ1Iap1j?=
 =?us-ascii?Q?fKmmTAdgjYwiBvDXBEvdwmRgRZZ1YZWg5JeOmI+YjYNS/cKNLLDARGE/F3T/?=
 =?us-ascii?Q?iWyCoTQ5P3JDeCI2yGGVW7LQShWzouCzzIs9XgJvbgNFaLLspvI2iypD0j4a?=
 =?us-ascii?Q?EEhg8T4X4M/cdGSXq871aTO+tfYADTWsvMs4Cu2vlXiSidkR5ANuRG2YymSg?=
 =?us-ascii?Q?9byVIbqMizqOKhpemfilvJCRo9M9p1aBesk48ZTxhdA9WWKE01gbEPu1Ge0G?=
 =?us-ascii?Q?ew6KERPk4K4OVBzf1Il13czlhPIakBakiOMaJ7ADllENjwX3DLgmmTmC8xp0?=
 =?us-ascii?Q?Ykjm1rTVZ8PgERvqYr6AEDlw/kfKJG5GdZqnEbCSWtiPn2ebm42VaxIUnphe?=
 =?us-ascii?Q?gImKEIPs6fpLmu9vjbWakLqAo9Zh3OgNtTjhPt85c90LazvDzeNe3N6pEBhU?=
 =?us-ascii?Q?DD3yP1x39DDuY3qhNSRjUkDMDy/pJST84aw7Du68I7nnBc2rawoCpXFszQb0?=
 =?us-ascii?Q?GpQjuNJmZNv6H0AQ/6gpMLrtjVRBrW/g+/D9uqf782cFJZbAAX5IAzoxNMJJ?=
 =?us-ascii?Q?F/dPEq+1B10gJTwZJgG6LdZwpRYf0rPGbD0QRlCbzYOCtA4WOK8j1X8y7BWK?=
 =?us-ascii?Q?W/RYOFudLddyIsM8syXc5LC+4p1/ODxK7m69+7wUiV1NfDzwqoLRqj2jFYI2?=
 =?us-ascii?Q?rMOm9obHhOCXqUUk3yYHKM8dG6a2E2uhHUeMf+o4q0jPwhZc0lpsHHc0woVb?=
 =?us-ascii?Q?r1H/175DqWgSShWQJetphuLFAQ60JCnyTIEZ8MFyZHm7XEMONJ1AeAfH5e9s?=
 =?us-ascii?Q?NUxX/lMbe+V59QgJCg/U52NuSPfnKENVRz1xERT+oPJc9mKInENA7PpSfOMA?=
 =?us-ascii?Q?2QmQBxmCKFzr8ywkORfs9lXlqrxkgaDS1MCN9MqK7tvNu0/Pxd80g8//LJPK?=
 =?us-ascii?Q?RVh1Q1pF35xOEYQEpLAC10PrJe4tMmqBG1LZ8OIbVZQAFLDpeAezYya81Wjv?=
 =?us-ascii?Q?yq7Nk48zhls7diLcIZWdnSo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67924b61-dbdd-46fb-b29b-08de20b957df
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:14.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvdVwolA5L5D9wgkZPBsbkTlbcCp1sV2Uj+m2C4V/Gp4V+JHYv83ruBis4+OM2dzS11UvwNUDTC+IYPAwp+tNJ9TfNkDQYPHeJB9CG81cegNTALKKqdn29ijPGb6HzYd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8955.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index 82944cf6e3cf0..e1c61e026cbca 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -764,6 +764,7 @@ static int wm8955_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8955_priv *wm8955 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -783,7 +784,7 @@ static int wm8955_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(wm8955->supplies),
 						    wm8955->supplies);
 			if (ret != 0) {
@@ -866,6 +867,7 @@ static struct snd_soc_dai_driver wm8955_dai = {
 
 static int wm8955_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8955_priv *wm8955 = snd_soc_component_get_drvdata(component);
 	struct wm8955_pdata *pdata = dev_get_platdata(component->dev);
 	int ret, i;
@@ -927,7 +929,7 @@ static int wm8955_probe(struct snd_soc_component *component)
 					    WM8955_DMEN, WM8955_DMEN);
 	}
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	/* Bias level configuration will have done an extra enable */
 	regulator_bulk_disable(ARRAY_SIZE(wm8955->supplies), wm8955->supplies);
-- 
2.43.0

