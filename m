Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD771309DCF
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415807; cv=fail; b=CI5SgBjBPNhIdumRuAbQfK5phAeK2ZhQKze8WIkMd1ghGVD2+rbsDVTOXMxP6uKX2dB72z4496w0gEHyMyH02jO4lZkFhWt8HA4l1yPNvC2aMlIJ0kBsAiEm0sJA8b6xt60iE1T8yGKtrxF1HneDPR5nspdWR8mzGg8HYl1Oq/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415807; c=relaxed/simple;
	bh=jkk9IptyTnSqInlC6t1gNmsnnb+Hc1z+jCwqvhY/BTk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aUuE5+RIqcCmPO8JuXlXTkSC8Dxml3ZC+u7LzmyrS+XK2GOdBWHbmpgxI1Z3wXDXnITSK5AQftqscxeLgHExHXVRy2kAcEy9BShhkR4ZmH7OTeTPjuUrhHtcwUBd11BB1SIn6m7qDL8JOBhQTjOmS+R41jwGbc4XUJoHkNOB3x0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kLQZESPy; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kLQZESPy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWlbOWpAQ2qlil/qdHEii1haaaKqWF1fSWH6k+XAK4MH9lvcObYolKlJ5p/WPLpFqPq0iHacNX39zhyyOmPvM5R4gUtGqNDs6GgKVo2uf1wCZOn+OD273eRYPayp08aULdq98uWGCd9tK7i8dG6vhO3WvxITjHtFcCqn9SOYkexiqjPTukUJNDr4+GC0CMinG/4eKDVwv7xjkoa+AUrzck1RnsXUFiL6+vMQRAN9VJMdlxEgFiKm+Uvt/pcC7BMi47uqX7AV5UpYSa2MVyq95MNs/uJfwEEZkwO0CR3n5smGSANbNWPxDxOFjplU/y5aRmo5ubXqRspJ9JmoRDi5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XhiyrthLbeaWZk0eRqeH/Nxt2SkjxAgOjQuIIFsi1Y=;
 b=cl/S/22A6y4jRZy14btLZgUyJ/Fq3CfqoO42gyI8Y1/6RTLUyTHcYalmXuGa+ms1ot5ZCIZKmCZpW0SMJC7Cx7tRy5U2NgCXOJjIMeRurHkUpzo2DbxsiCzmi5EK9AdN/azBh/XJxsNeEWblip/JHRRUvf2mZZQYWHJrAyofA31FHG7utOPRVvZGCX7kGKaBMteCVIxYlAu4e72CEnFupEMpWzhFj+pxyq5VQ8NcX249E9Ltrw2S3XlJAHmtAJhkQOMlITPRUyZ5NxGX7UIZz01nFqz8zavu9OnHNqV/1/gkP90aclMqBfmAaDRzX0A7aVgYQpGz5pQgeyAUJTUfrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XhiyrthLbeaWZk0eRqeH/Nxt2SkjxAgOjQuIIFsi1Y=;
 b=kLQZESPyrKv2HDSquglwibH9Iu/KjXXx+lbO4jFo3GKrqyqcUkvuaaCeAjMmvGHTpChM0LHXtW65m5/drU7DRFHgx0LqjS4Q5KBKFjCOjf9uuK8SPuJv1XDa4MO/JMro0HE/X2bDb1jhjep0x2CF0Ly1PSUvHVWgthfQyvIJ+ZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:23 +0000
Message-ID: <87ecr6qfgl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 062/139] ASoC: codecs: pcm6240: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:22 +0000
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c38e41-fddf-4c55-3c0b-08de0ad969cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hjZp0zPnSZf1MegCQFg4iMyrPc64bkpySQuGMBJWA5TzxwxExqVme6Qf/L8F?=
 =?us-ascii?Q?4i5APkTvbO3iAz/+TK10LUzHwEXziWU7P4fCysK7BR0t0H6s1x3kGor44Mmr?=
 =?us-ascii?Q?My8tPhXa97WW9a12RMyJSw6paVN68QbMHHzCUWOubPVh1XQnE5/Mj5VwqQLY?=
 =?us-ascii?Q?FDvZZruKrKdwX1L4YfbCcwsRVKvRLlvuM/LkVbfPTaTAXSi/LgCFYHdozT8l?=
 =?us-ascii?Q?Cdigudvi3VcJS4zQleMTF4eva3FXJK8/SPja5/iRbAf73j/aDk0d62/KWmtq?=
 =?us-ascii?Q?7KUpOQXnDf9vN+WU3Maf36McO5WqcFP6D2XnYCi66O8Abw7qcnHxCfAtVND2?=
 =?us-ascii?Q?bWfMVPvmSWK7WFRI3FzfJRJ3FFcTgBKWQaJGMvRaPOGwrOL5RRZRXKkzt0RX?=
 =?us-ascii?Q?xxL0oO7/MK/rEfGatMszyTrrClSaTLBeU5Vzb5Y605hgIOVizxE1pW+mW+1M?=
 =?us-ascii?Q?rvTBd4MGc5O369bX+LTl0ypysvNT4SIZNoI/45aKiE0bWpARd7JuypNiJ+n3?=
 =?us-ascii?Q?brqfhi5fTLchxsGHqfDWkjV93Fx2xrc3K7RyM75FVvQJCN2//OW7w0xRA62E?=
 =?us-ascii?Q?yXMYRLMdURhReyt7mlGYPrX0ZJ7Hgya5lYQiYREEeF2ixvxOwb3NTq5ua8zb?=
 =?us-ascii?Q?asDVQjCUAiDwV9gfw/Xqu9ICUnZ7luEcO7hhVJlFvqwVzCCZtbmPSjKdo04f?=
 =?us-ascii?Q?r4B2bWjA7Ko4dDQku0C3NnQg/GuGr55fpLAhBZGlxnhJbIy0MeX8iWSgx9kx?=
 =?us-ascii?Q?rz42TBQk4i58XnPW+d4AnAZSnvxu/THqdBLtV+kEYP3AQ8T1NDbG0sQPyfvX?=
 =?us-ascii?Q?TCNAaaLvfEnOzd8HXZ02LB5wqwz834vb/Re1UTKQ8QoAd1OAJNdB5qLYTSkw?=
 =?us-ascii?Q?IVd0yLpg3McjtvDkNwId3n5O7nb1mPibYBb0ucEn0ttXZv8u+JJcM0Aqm0WU?=
 =?us-ascii?Q?t8VYYZ29k6zrHgbKpD8GlyngZ81U19FUhql4SVxNoDTAJqXPRZw8xsppS3qM?=
 =?us-ascii?Q?Ji7RTETUOFIeTfCrdGaLvolIq7FeC9W7ZdyicgCWDDWQCRjJpi5aiCIxXJJb?=
 =?us-ascii?Q?v6981ZgbF1Ft/q8LBdgxQHls2rQblC91VLN4h3LULe2d4WHXtiN6TH1qhTE1?=
 =?us-ascii?Q?FmctM1OYsGF14kzAi0GI8MRFChBlLYWAflMBBgwIRRakjZUT+niyUQec2Wn1?=
 =?us-ascii?Q?b/G/whg994rHGhvCdxxSnq91x2T0lFKEYvxG5J+42y+o55eIgordpz0LsQkf?=
 =?us-ascii?Q?/BsqUd++bz+bZyPxp+QZFXWaIVr4SoEDfVaCmgr5Avpyy+7EAizpezi2oTla?=
 =?us-ascii?Q?ektJaQm5XERp6BOOMJeamSk3OyjwiSGlKv/hqftljuH2TbSGQA3r32kwgQZ2?=
 =?us-ascii?Q?n6pv4kG7c3GXsY8eano0g4ArwHhQMCWsmRZaRG5XWVKGeHAExhRG8ja5QBDg?=
 =?us-ascii?Q?3NqlPa0iAFtsQ+9k0XT836KbRCTzjdGJH8nnBfAOFPkKZAwa70yXr3Ss8DAC?=
 =?us-ascii?Q?ZSBTmd/7+sKeGQqj/Xr2RcuQsfBWub3YqyDm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?adliV+qz8YmPzaJd12KbZbaDkkmwaxd58vPhehE87fxHxejYKfK/zrjYFeY1?=
 =?us-ascii?Q?0Iz0NaMC1TKAoMwa7YBQ8+6GNz9wDtXSVlTyZCKEYunRBFAjvMgLDQeBno7y?=
 =?us-ascii?Q?E5w49YsOykZ1ipvlNqrGkUsPfYaulUBLFb2x5LSaNDgk9zbTfay6Z8BJyIdT?=
 =?us-ascii?Q?cyJRZTfMANWFbYEtWzs0Um3Jfba1bBco79/wroOLOX4147XgsRqf0QnQLPlX?=
 =?us-ascii?Q?Crd5tFQmlxxS3BSnecyaTi/HCv6PdecybdXY5QrLRaLts9w/yZ9rhEaMYQLS?=
 =?us-ascii?Q?Q19xg28b47ZvCshqHoxCcCI7Fa7vkqNC1aPmGcZyKbIfQdUiSC29xI5fGgtB?=
 =?us-ascii?Q?qWrhhq9pvy+pARUre2HryzwDg+yuVYS8O9Y/JqJEagLhgQY62dFaPP17pGnO?=
 =?us-ascii?Q?5PoHRxc0sNfYUYPJ6gMPavew7IFb5LEM6O6AGu3bZhjMEyDwZTVADXwNxnxl?=
 =?us-ascii?Q?zHI4iSOyK54LPoBB4+AB080rxch7x08NYU7r2fD5T2j+SEDStkaLcgv6YMDb?=
 =?us-ascii?Q?dpv6CO9bkgd5+f51GWDj84gbYVWh34/b0eFxoKdQP7ra3hPfFCu8PGa0u0kd?=
 =?us-ascii?Q?L6kXWFH4OhFvVJpvcLV173A0r0eXNDjRNn5xH4SF/BXTL7jp2+qb9KOTsuzE?=
 =?us-ascii?Q?11CF9tE+zBVysbca/jtxBp2+6aE//h3R7p+XeWtT9jDz8I87SPsuBlPnaLF+?=
 =?us-ascii?Q?GdOgp5XRmHp81Nl5+baroYbesu4hV3C3kXyP3WFEG2utpQ8fAivjFWfTg8VL?=
 =?us-ascii?Q?xPOZHGraaLeRPNOxwS0UNTEul08Ku0bLF0O2pnPIxVQlo3eaIDNLDW+0ITSt?=
 =?us-ascii?Q?k12xWOTbtIH8wkvDLiOwHBhqBlIe+cRKY7O4H6VyRpfSORtJp/apv28c+3e6?=
 =?us-ascii?Q?C1RZ1ZuNRQD6RiMugYBMeEutQLb9REc79zN6TwC7SMakU9hYNsJtHw5zH4+a?=
 =?us-ascii?Q?lUApoTeHcJ0ZVH9k4j67opX07ls73qHcRsp4BeaKQB1v5LE/Nu+p9rV2vp0j?=
 =?us-ascii?Q?IHljw+kcCbUNTOLgAEWrpVr3YktNlfpz10dMmscUK7CkO9evm/0UlPbCNurQ?=
 =?us-ascii?Q?YxD7cwuDLmpKav9BA/hBvUM7VpCsgs1C7hhV/EGVvjYJ3K0lZU3veG1Emnt7?=
 =?us-ascii?Q?DDzd7H7rpddESrFklWGT2swAyC/qZ1ZYHhkdKUGGKWnCmNLqi4ycQpM2oUYk?=
 =?us-ascii?Q?GFqhUi40JAWPLXL5fmSLmND5fcU4UG9Z9GZU0ZBpc7nrsudeKpGfn4TXfoTm?=
 =?us-ascii?Q?W9dMT7XbI+lgbTo9qgyF4B8nILV60hEZjys5LcOEF84TW/Je7jZIbQ9brVM6?=
 =?us-ascii?Q?Zw/HuGgSw3kwBEeNHlkjN4DHBaP4CZkMcTRbQcsccaTb0w6Ynh3edew++i6U?=
 =?us-ascii?Q?WBvtLJvHZPOzfTijPi/VS4LY1f63jBfk9amEl0RCSVgAtvGnfuwTGDZqw0SC?=
 =?us-ascii?Q?Uq/6fEi81VH21CR/+FHmV2w2uEdEP6MBha5kmT2hSEBujIrgqz366R2NV25e?=
 =?us-ascii?Q?fwvvPqalaG/ZZE9HyqbjHgiW6Xk3NJeVrLDFmNgrz6EfhFXyj1rD2ugftKau?=
 =?us-ascii?Q?WnyQR7dRFfZkSoJn1mv0D0xwkmxR6GcfhItUsKbkSPl/fx9aikiaKjhokw1b?=
 =?us-ascii?Q?Cy7zKhJxn8Qp7W5WUVUnYDc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c38e41-fddf-4c55-3c0b-08de0ad969cc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:23.3459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KyE9M9Usa8S1aqUJvfqsT6NZ8UUphY5d5IZsK1wr9Ngqm/h7P6WCtdvLSuuRAFGunkJ8wZaEEPqJquR5dkPki/Ui2KFSehtSAzn4/+M7UR7NAypnCFVmMGrcrqhSlv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/pcm6240.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 08cc52b374a9a..bde190a659b13 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -1139,8 +1139,7 @@ static int pcmdevice_info_profile(
 	struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *codec
-		= snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct pcmdevice_priv *pcm_dev =
 		snd_soc_component_get_drvdata(codec);
 
@@ -1156,8 +1155,7 @@ static int pcmdevice_get_profile_id(
 	struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec
-		= snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct pcmdevice_priv *pcm_dev =
 		snd_soc_component_get_drvdata(codec);
 
@@ -1170,8 +1168,7 @@ static int pcmdevice_set_profile_id(
 	struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec
-		= snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct pcmdevice_priv *pcm_dev =
 		snd_soc_component_get_drvdata(codec);
 	int nr_profile = ucontrol->value.integer.value[0];
-- 
2.43.0

