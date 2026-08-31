Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629DA3B05BF
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152831; cv=fail; b=Q1CLd29QDKcEUWDHprNOYuSdsL+Z0GkyYFbDLlHcjI/f83p7ugPxaG8c7MoBz2vTGbJt7PekORq9Cg9nBLWdd5LcM/UVyfAfk0wBzd4k5oRHeKFK2yLqDB6qNq2suRtOlzzyPEUxsR/oXX2sMGMg7CD8cvlG7XOM6PiyY8WkXZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152831; c=relaxed/simple;
	bh=rBflxS9kV+1PTBdhx0sPi+2GnJuCFXf3hA8FnYzd6bk=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EwiA/KfuBzJM3L1YMbNrmaYqG4wsY2g44fXj8ICjdc3bfoKGdxvC6k3JThRvU9GTMye3NTc4NmtrE/sE7MUAtDmf9b72wNpO99++6H6j3KrhHfLpmBAQnoy4D1uFySyI790uXp8KRzi1mzIeS5lLLIsyEWvJEWy39ilaDRH93qE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JSTYMzxV; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JSTYMzxV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3wXT7yuAFmlx3DtdfL/P3cqWfv7oZXNE4zJ5GycnFWMx3o9RwtS420SqEI9Re4fvt8RqNUbUyYZwEnrHrJK3QRneV534qwqJbvsqM9UeRb5+Cim6NZn7hGWJTUvEQQGEcwvNx3tLioztWBSxc1jAuf427abXE7+fano6zrL7qTAwI8eKAj4E2vrAd7ScEH4P7rUFBj6vkm1t2jF++zQQPshhhORqX4at9rRiaYKK62a7cXWEmwzYVDEQof4qti1dWWTCZMi6Nz9Inaf7IaWgRg+EGe5Y0nf1dkBeDTXDSGja4e279koFDWjx/I6uYRVKa04DFCHUK42s8BsjeULEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7Ts44zNdc9hzWUoe9aiNRFCL0M3SnOyj2jyAWiXiUk=;
 b=Q+Kq9E3kAuk5MNad6HJkzkljx7IyThLCR82fuM9nmcP+UfcC/PQL2dTcUNYaC7STq0/lUGyjpbR11BKA+nfeh1ibOFjpuGcBZzNFZcbPA2GeO2iL79juB8Sbt8MiJt2NUTBk29OMhI6LGrLj7FJSCoYxgqDJH8CyEuBrvzlGHT+181DVmnGvk/ZBJaROWn8E8Rt1dmaRuR7o2u2odqh4Vew0VZKtymR6haMNTDSoimz5oDkOb41feaLwi520kLejHENBtBe4xECPyHgsFZl2768Bh4CeV836W7L+mSUGQnPWuZFmhByHukVjfkDQT7U0m2lNDgpTVnQoHMIUe7uqKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7Ts44zNdc9hzWUoe9aiNRFCL0M3SnOyj2jyAWiXiUk=;
 b=JSTYMzxV3qP1ecjnVVI427VwYDpRR9crIe/cyYY15yRZEdOHe73gZz3Fcfuz79rMfQihecey5+7aAwaosM6RMajScsGoXlh7ogAM5pIaWPeEn+kGbrvvctp/zttya2826a7XckIPxsJtWzesxueLWkIBNWIC3Rrzq2a4lsxgOtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS3PR01MB9785.jpnprd01.prod.outlook.com
 (2603:1096:604:1eb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:08 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:08 +0000
Message-ID: <87h5kavpxg.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 05/39] ASoC: codecs: ak5*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:07 +0000
X-ClientProxiedBy: TYCP286CA0190.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::10) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS3PR01MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3ab583-13dd-4cde-8bcb-08df071db4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|52116014|3023799007|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	qnTglztttsDF9yLMZnUK9TWDZ7VQEwNF/g2k9MYMAQE/ERPkGgVmPIHaiKQIPZvOWK6ZSdoEa3vXZdTT9v5ttdGpblmRR4cHq9VRglwa2A++uMUvYFZudfZ8+eP8wj9kMunFQGKfx9GgTRqjI3FsW7wfX/Jde5JeZuD8UHHJecWtNXOpj0JfN432LDo7GTQvdQFruGml9z0TpuyPm0Yrdt/OpsbI6impHRO5YSZg2TrqgmlX8YlUP7AxwRuQ0+uh5OT/jYmLDcdqjgmj/uc8SODWvIi+l7psVbh9NmodYqXj1NVj7uU6+Lfbcpjkdxz2sL2YmDb8rP1EXfV9YDo10k63kefDve65OoVnAjiyhJDMU/w8NLXerSPl8obEPxiRadCZFmwQmWWzaAyOskzawNMOl0+JgmEcLHuUKzwnzfh5cbDeQA6PdkhRrbhVH2VJ7t8LskzNRhndZCt+9Ub0VaKmzM6+rtfu+4Qm+gJdegXXnCBAutHKKKWGu1FQRAZy81zZO6fqJwiXmuBoYuFZk/wNjgSOIuXfjw2tF6fR1JaXLrOUCi4HtBaUyAnCt/8jNQAGxe5KGN7ZgVS2IdrnU/Sv/KPx7cQihxCCxg8OBlC1HvWI19+X8T1TagE2lrfEbP0x/7MaeI38pIpFOeXpQ/DTsxuJJxQmSzhiNnz1r71J4t2zRB6hbHZl8hPd+CglkWtf0BrSzNt5qkHk7mk6yokgyHRKt41RV8rz0dcZUgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dwgrQoB34ks8OeWD0T7x8OA/R2XMVp9KgSgFclno/BdCfNWFYKa1SV/bO0OX?=
 =?us-ascii?Q?hiXRv7TWxj5y/t1LauVsNWMnwQyCLfM9eKN66KzD5x9yRahcdKlPO2FvQZZ9?=
 =?us-ascii?Q?vm4Ow/gtPwJQfaPRW8KXwprt6N0alXa4701+XomdfSO+D1ULoBTRJaX5YTeE?=
 =?us-ascii?Q?ki2lIw1zcQzRE0L7mNNFtid8+e/FLs9CJ9q8mjzbdc9VHhiYgD7kDCso7XY5?=
 =?us-ascii?Q?aySMh2HadsfTItepPS+18ryN6iyS+bQ/rewuNJM2cHzDW7+xRTixx6SlKXZb?=
 =?us-ascii?Q?vmlLW+8bVZYD29H9Z1cxWjqox3k4A/yoU2UfxEefIpT79IjF0FnJ+LUeHO18?=
 =?us-ascii?Q?MeJpWQeeaYT6I5kRwcwv5g/TJ/vmS5mnFOP7PESj3jErfe0+u/f8TQSkWRtw?=
 =?us-ascii?Q?2PnCycq+GlCrBuuS5DVJm3NEWd3tq0ZLiQzAWMxKwbGMD9DkQqoVTu2kD/yc?=
 =?us-ascii?Q?/PgXDEiwVM9xme/Pt6PrHpfJ8DX+EkxK2svVDWugwkO9+cIBZtDYTJgSN8wI?=
 =?us-ascii?Q?Gvo9AKyGbIDz3gLKwcLltKPoQ/T0mof3szp4T04cZOl+iNI9ogW82PxbfMHH?=
 =?us-ascii?Q?ZL4P90qA+nFlISGhSHhWI8jJz73DYUe3DiHJ7riWATO4FGKHRcNiYk5ejoMg?=
 =?us-ascii?Q?GrbGqFVOabmr+WOWc9fR9E1b/D1/JelOmR9Ch7D73tE2e5/A1cceNsetmrzj?=
 =?us-ascii?Q?doHbO2RO6qzpq++ovVijtPNM6/QUYl9i4vhWRRymImtCXt/vAnFFEKVEGCRQ?=
 =?us-ascii?Q?jAkkMkgxCsjOwLsX/ft8wPU2rmXlu4euBx6QaXrpnfAVbPMgBPPtpHHh9/Nw?=
 =?us-ascii?Q?QMwA5v7ZBXqhlI9txREDArWN52IADE+E+MwooN9+NuLKgguIdxPgTZdWyv3x?=
 =?us-ascii?Q?5oLsSVKlvHDuhoYPjy49zXG9c2vq66fGHAqtglWB5cj+KLn953DsdJU+6R1d?=
 =?us-ascii?Q?Vad7FZBwtFbVloQCG1Yi/ZFHGLcMJPwhMHeQVNHP8S/8UpzJXkMAON9FWwDs?=
 =?us-ascii?Q?Exk9+Df9yiIn/38eV4oaAKSZAVEWZsxG5W1IL2IejP9F2GE10YrqmL8CICdL?=
 =?us-ascii?Q?XMeRLYRnPvAKfmenhXlbHlyRpSq4UiLzX1fjWRmRfub4c2TezxTPgliElyaE?=
 =?us-ascii?Q?f692CUlkApCUI6yG/oDBxmF/h4QmH77H+vKNF52tL0Fd3OpBgLpwBA1seOFM?=
 =?us-ascii?Q?gIlHEepV+o5wFod3epGvzyhzP/MA/z0rmz/SpnLUWr5v1UKBNVXdaJs3qBQ/?=
 =?us-ascii?Q?Tt6yuchyQJ2dOaQNlR7uEHJnAmrS1jnfWXse9pB8i/v4J8+bGaiRCebw2BTd?=
 =?us-ascii?Q?ibKyqXzNmdnqeulqpGE4UIBjk2/n9hLWimO4rU8uS8p3z0rMiPBxt9hZRbwl?=
 =?us-ascii?Q?CXHcvHPiWokK2KZtzXjzvX1GYiXtRRkjkYKHd5a3y2bVMe7aP+fqj5S6IYg3?=
 =?us-ascii?Q?lJt5/QJ/nf0Um+SHXyqASW0imsIJa3oXFQzhyZQ0qqD05eZyrNRaqNkfGyEp?=
 =?us-ascii?Q?K9HBd9YQbzNE0W5Yyn+oYBb5lCG/veBZdzXwyF1B7qG+BMWcrTvrFTWpJ4NC?=
 =?us-ascii?Q?jUAkIxsS+4hmmTRlZrSSevPNjSYZRpZyJmDWeulzMdzC61GYSQrGLOJJOURY?=
 =?us-ascii?Q?KIh0SuPH8syCzH4swv6Uem4HSOdfmLg+qPJJ602IMyNZoS25ds1U/Lb9mB6d?=
 =?us-ascii?Q?WAEDJskbwFzRXmg3ytpiKHyFQjBihQnHmsksEbr76gjStrHJdu4W18nwb14d?=
 =?us-ascii?Q?5Uq/dwonkZLtfOcoGXqkymcS0YSM6Xgy1EPa2nO8pL0/YTGvKPPp?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3ab583-13dd-4cde-8bcb-08df071db4cd
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:08.1286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4oz7pnOaCAiUnM12CIc1t4n53qwchHgELF6jrWNgLxe+LU/0QVJJ3SuGTJB7cWCkX+rMa3+XtP/mXku2f3g48IJdLSSK+qFdIGYDjSkQTqjwOgYWamZabuRosKlMjvU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9785

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak5386.c | 6 ++++++
 sound/soc/codecs/ak5558.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/codecs/ak5386.c b/sound/soc/codecs/ak5386.c
index 6525d50b7ab20..933ca90b7e287 100644
--- a/sound/soc/codecs/ak5386.c
+++ b/sound/soc/codecs/ak5386.c
@@ -128,10 +128,16 @@ static int ak5386_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 ak5386_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ak5386_dai_ops = {
 	.set_fmt	= ak5386_set_dai_fmt,
 	.hw_params	= ak5386_hw_params,
 	.hw_free	= ak5386_hw_free,
+	.auto_selectable_formats	= &ak5386_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak5386_dai = {
diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 691db6565c20d..0c9cdf9a53bb4 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -285,12 +285,19 @@ static int ak5558_startup(struct snd_pcm_substream *substream,
 					  &ak5558_rate_constraints);
 }
 
+static const u64 ak5558_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops ak5558_dai_ops = {
 	.startup        = ak5558_startup,
 	.hw_params	= ak5558_hw_params,
 
 	.set_fmt	= ak5558_set_dai_fmt,
 	.set_tdm_slot   = ak5558_set_tdm_slot,
+	.auto_selectable_formats	= &ak5558_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak5558_dai = {
-- 
2.53.0

