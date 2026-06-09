Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2EB221FD4
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964612; cv=fail; b=FsgnOABhvHaK0mqrwt3weZWqlr8FcnBshcx9pVcftzqa6YsG4uNRsUYrr7fgXPOXaqUDKJ11ZmW40Bl9LLsmBK4pdgRm9AVB4GZq+cyXgp0ZP59s9T8c2tDLkO1R+P2kYc0Qp+OjOJ9EbuFOwbQNPjH6tbcCFXA3/DJjPys+0wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964612; c=relaxed/simple;
	bh=ZYmkfv0sTdzTafRKDdI6w4frh5JDAE37e3EJwx+usP8=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ayF2k19HGDEUOHCU9MLOM8vXW9NWrfh2Ri3pjcARayePjpVlxBp5rv4Q0AyeNv7cut30atLnj/DNFrsHpcGoJoQi1f4XGxNpVcYxohT64h3FXJN2z7V7hu6TfB7r0K5t3IYpRuak2cQmZXFrKVzTKGEbbhqrB29PyHXAYoWIfTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YWfzSSIA; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YWfzSSIA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suij0Y8wKQNHSMceZguHBYQAjXg2+EFXkJVuTqeXdA4kJ8mr92loZKypGeUDgJvPADcUUXIqRFdsdiOykFT6NMp+hXQB+m0F8qGwtfBdyBgUN73Q8CHJUNVx1f2konTAdUthnaoIWxQ1b5e97MpUM+Pl5vFkEahe2yEvor8dHxzH6O6QEfQpxE//4dexil9449O5wvietJoeDY+Lk2dklJcioMkf5LD0L0s7Ly1Q+YvLGpiaDn+kIufR7rOyoZqkD9CZp1aOS8DmpCZBpDGhTclX3Rp7fbgp4S297LcPxvcCX4qC3ufvR/szdL6f90HsOnGSy+bi3UqwLPfKkYD/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWL1wz6YMVzYziM7ji7ZRfr6iS5QWwHscTCFtdU8PAg=;
 b=JElBcAKxdMhvipA5sbDBk3yqh+pMlbXmOPBvQe/SDhDqY6E7iZ8YUAD4AVci7Q/Weu7o3R3GaLm5BM6DOFAybQqmvXu4r2B+GngcF+mQNnGzGz/iPAeg7Qjl+kj8K184xnIPZjklhD15k/anKFKhooUmQdEtjWnOz4ZrOY1NWNatRpAV8ppFqAE6gvDJSIl02CNyUj8al4X1DRSAeAVIVtJ4DXUYqGT/Flr5HRA3yAJNYrygVEZkgiBo2Znzjhv+cR2Mxpd5/jFNsqZphTVkU9EQ/LpEg5wMhMS8Uum8oMKfMiwDE10UxPX4RYe6Y3OloxIRJgv4OQygCgahVE4dPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWL1wz6YMVzYziM7ji7ZRfr6iS5QWwHscTCFtdU8PAg=;
 b=YWfzSSIAoSV6zDsj8na3Y9JGEteCCDDlcIwdpTektNaDTvtP7HUp4eqPR55x39oQosIX9sFfOLjaR+Q+JSGoAfHgKRHiH45vhU2b/KM0d46EsxmAS8+1uNzkuR8gqH85fEGCyYPkg9faFarDvzO1TOPAK/jgUt+kGJ3XQ0n8i50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB12760.jpnprd01.prod.outlook.com (2603:1096:405:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:23:29 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:23:29 +0000
Message-ID: <87ldco36kf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 7/9] ASoC: renesas: rcar: update auto select format
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:23:28 +0000
X-ClientProxiedBy: OS7PR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:604:256::15) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB12760:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f7493d-95a3-4e08-7cfe-08dec5bd543c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	8/jfiNyzsAzVyjd749PZ6bwX3uOlaImKZopbuD/TuyOIDk5svc3FYlF9K5hQi+nRLUQ/tPT2fBHFZOq8rnpg/mUxn0MCJIyNk4KBpQoV60VszcklCjHQBud9oTG9bW+kT0VtiTX3qG1btS9OtXWVPuewHvvFpIBxOSK/dBOgPjmfWpgUeQbD4OLiJPjbEY2+UOKPiK+DSDmrxUbtZk26U1ws6OLpDUVOAB64DcKyNqOShfGWftFHIX0Bhhu+hUb1JBT7ss57qAhYwWdE24va+LW8BdsJnRQFaAeX2JuftQIYpjWyb9VIbOkTQKVEBbpmfPov+ha8J2IkPGq27KDOl1pA+pkKlyeHpvZomc+dTu4YVQLcXt1daB0Vgz+ZFY9DKH/y2pXwXThESNXA6X0guEOnVoKpJWnnvQ6uEW/AD6oY+BcdhkFodJvaSGgFa+taBEkRiPiEyF9LBo6USxKEmJbS7yrMJ8oWmJK/l5C2z/4EIHJ50XcAZE1pOu+uiFBcSriHsEH0/P+wy/pOpllNrkm4YoGj5L85h+3ZVqwz/QY8EFFF+c2NSOS/B6mKjXwfJITODNE1NG9utQLKhfMlD/s5zuhbQHNxCOZ4cda4IOKsG4WE9GNQeQRNq+vZgVZtUDgrtyghur5KmN4gpil9gj97A1MELtnjnNOBrPK3Cr+cfJ3wmbOHWoJQlMXDmkpBZRUsohKuHEC3Qxk85E5zO2MKuw7UPRcmL3G8HX5x9ic/wu7Duq/d5XsG6HSZoWxndntPgMDVFawkSZDfqDgMoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9nwIzVht+nJ7soodbubK9oXK+wAKqDcBtksaGZUvRlO1nUMo9ExZXAL1ARTt?=
 =?us-ascii?Q?v/BPWdv+mCnOEKdJ0kyzheJvI/k8aM/lFRUAcgAlXbhUjdy72kiUMrEHun/R?=
 =?us-ascii?Q?qjyPWFjTD61FbRF2s/oEg6T24FdWM1M6mJ7c6v2QGIeuvkst5PoszMX9/6Ci?=
 =?us-ascii?Q?7FoyIfNrB0JnTzB7fPfvcPXx1ZN4rn3lYCXckOk6BBRZFnGfiihBFBd0VtoR?=
 =?us-ascii?Q?4R6DpqhDwB6MY/POcoVt+z9wI+UziZWLAQQgrz746V0EONF5piyKSU1NibIc?=
 =?us-ascii?Q?hL03V6zSrOOlFHmyqcqfjdx5rUxFGCELzh5SxR6yAPjMx7Zvk4sUwP8jDRYg?=
 =?us-ascii?Q?7PiehKEisda+g8nFg5HS+PA8674LLQJS3Sa0c/KxzbDQ2m+ioRfONOlJTX3b?=
 =?us-ascii?Q?vSxRZLWzwMfZVIe/JUMOhLBlMPXjDU7/rXDefOwcKDl9RGX4O7IcIoS5Dr+4?=
 =?us-ascii?Q?HapRtkOfT6zUIVAPIz9339/yxrPTsSyuAsxONSsEIojOWq2xOu5+u40MDqEj?=
 =?us-ascii?Q?cts3ZBYi5k6mSyeYXZj8Q4Pp/SK+EPxsBtWOaS7WC4qkRZ//zcB5vhspx+Wz?=
 =?us-ascii?Q?+Up6FNsE4i7AuooXo1Pg45m9/tiwp6Tbr9MyuW3fbKTXrfv60siFoMjm6It/?=
 =?us-ascii?Q?WSnJ7Iw0H2FGlUKiNI0S6jWP+jTR92RLv7JpvSI+OkMyPxuCBbNWeWX7Ys+Y?=
 =?us-ascii?Q?iAs5qF/J+qLL7tkVllV6v2i5PWaseIs97JwYsxUQhMUvmXwmpNz9FbR+T3+C?=
 =?us-ascii?Q?+kagUyoCwS5je6ECnx7/hVW7EdbD5SpRJHh3UgvDwycfmUyG0VUz92EUBCx4?=
 =?us-ascii?Q?pnMQ/xl92SxWXhIlRJSY512V6a/mT8MAgD1WeciwpUjpaZMbYLn6ssZkUw2C?=
 =?us-ascii?Q?l/YXoZV+9V1VnX0tfmEHTIIvGJ23RX1jb+OptiyCgowvuffHLFshyNYx9hNV?=
 =?us-ascii?Q?F/i8CkY+qO5ZIR1UO2m7IWEqluay0GkiU/KCEJKuc09Q1YRtoJ8LRs5huzFR?=
 =?us-ascii?Q?I9G9lOJCUmI+/S3ozbI3F6kmpIM4SOsgYqSDVbWAR6srPj6qeXxkMAclpC0o?=
 =?us-ascii?Q?eQsqUh18d55c007Ozm0UuLJNnTRU1fMP09Rudb9UgA0v4Qm3rNZha5bVlOUw?=
 =?us-ascii?Q?VZ2LqalrK/wJRcpFt/eXkMjR8yB64882gStN1bfNy453CINRoueVYZHq7xoX?=
 =?us-ascii?Q?mhaoepi9+m4dsU+Y5T/3UhahbacUX3ty9fC2Nndq474jDSqLu7c+f6LX8rWK?=
 =?us-ascii?Q?znkTsEhDdqGcG2CDU0lXpYYeGf6SOsnA4cwJDkesR44lg+/Hh87WzC/nxlbW?=
 =?us-ascii?Q?FCXBHE3zcHuBU3XdpJpbSmrQ0tRYYgwXZ5BFs3vim9EnSVcrLClVJzoT1rT3?=
 =?us-ascii?Q?+vSLiTffVkmuadDVKTQiZ2lKMZzz3cWMCeZk/eFO5RgVO+tDWD5gZ7kqpMFr?=
 =?us-ascii?Q?wUsldaQA+TClwKwUUR5Mh7w8qUDqfsu7b8C7EKdP6OZG0G7FzxivrUumxwpE?=
 =?us-ascii?Q?JULuOkmprEl8BG0eQBqOQ2rvjMw7bRgzTmiWDUTLEhUW4AqleUSaIPxFPkpZ?=
 =?us-ascii?Q?q5gb9C8W3ZYC8nReZT4WmwpreKS4aQyELdyNP+kfuIsqelK6bMwOMgrRRfD6?=
 =?us-ascii?Q?5betKx9/lCf9KD4E8xjgIrhVNQPOd3Y2Qc/HQ3KllaQ/8pYYdiU2EC/J56ea?=
 =?us-ascii?Q?tnJw6jOOlIEdCP3wPRoBtJTxk2hCD4jBK3vbcEFzvg+78GuLwMT0bTsladba?=
 =?us-ascii?Q?afpa+AjohTEvxt41Iqf3RmHIj6A0+wsTKuQZyn4MP95LbNjqGmbH?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f7493d-95a3-4e08-7cfe-08dec5bd543c
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:23:28.8465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GazMtr+c8ScYw7pBOFo+KnQcMVkoe3PjjrZWVsCZpUGGypv67jJYMdsEeijbhYe9M6FQoSkFhvQWX1QCkPNA6spz1ovHEqvrG/B2ym86G7Xiqyj5jHp/dQK4UGwEK3g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12760

Current auto select format start with the highest priority format and
gradually add lower priority formats one by one, and search matched
format. Like A+X -> A+B+X -> A+B+C+X+Y... (a)

But in this method, we can't handle format if HW has some kind of
patterns, like A+X or B+Y etc (b).

Current drivers are using (a) style, this patch switch to use (b) style.
This is needed before update auto select format method.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 82fbdd550714c..b7954746e9533 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1071,8 +1071,15 @@ static const u64 rsnd_soc_dai_formats[] = {
 	 *
 	 * Supported, but not well tested
 	 */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
 };
 
 static void rsnd_parse_tdm_split_mode(struct rsnd_priv *priv,
-- 
2.53.0

