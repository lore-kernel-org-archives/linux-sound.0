Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB352DF128
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152854; cv=fail; b=QQ4a3rRwUH1kjPDP6XDOXmsHIRgY3EYPnBN/G9WHac2w388MTUZGwH68orXp6xOf/clCrvXCSLHTSik/9r5hjQ2OAIlTluvfQ5+WwDJPIcNv3iIxdtWW+1BlnRCe1YA3Yi2mUClRsWoUN30nrY6AzXWyKRzKMOjad6zIjZgl5aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152854; c=relaxed/simple;
	bh=UXsuBaaM0faHkKBIqeP/V9+SeBAw/UDYhn9gq7jbYOw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oohyUT522S+NhPzpmy0Vr2kE/NPhHeZhCwlbCfmOq8T619v1vsSzENiMGIJvcrLVtcSAgNnOTSWX08OACnwtpm3RXS3Nb5i9dsNL91oKAkPQ+VGSkI3m7oNeO6orwyT8Vwslbjw38OHEqR3MIZdkpHYVg0z/MDnPUtP4FXaFSls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CPuJ/Qh/; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CPuJ/Qh/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoM4U9N+iZZ1/XeQfjnUF5532Vixt5VMTRF7wm3Hbf7qA0U70olpQFPu5ifz9uYj8V0kYyaTJDSzUFVEhFgHtRXhhclH+oTOtIlhdMZgOhHgiY7zlzbafxTEEhSAnURnbvnRv+joOdSzpxhv6g9UcfxkF7Y7m8FaACSZGrzq9kCcDpjAl99Pa5BjngRi7wcemtQOwkZnPyH4FBvAawlu38wBwA16b/aXkXJgp/9V+d55ZFdjGTitTIkW20Co/REQDEK6gciMB2DsrsOpLVgx1rUypY0/a0FRyQVcUX3XL9jzBanqCc7VX+0nFInqp+QGvRXcp3k4RqytJX0dLPgJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuqihgHavHMeQOndzGsNrWcPq4Y0OpZql0FIqPn8+yI=;
 b=Jh80OGMk6pSosIAl1WJqcInBsPDvCR4FmMs9tWrO6gKwRg9k73kvZ+saSvLV1pW3ssu0YCNGhoJ6WppTnBnb1IDI4ZdcnAA1SZc7we7Y5RLLwvb8gTSJNn1cvYaSVmMc4o44Ca8yPwBoMIjYG70l6iP9gm52+j2let//mFspbwiEhU53iuMCbTLoCBblogQ3870oMhTZelo8ODn0i0LV7O78G8J307NhLqypRPBXXQdrFYN13Xz/h7ufe3Gj7t8IXwlqULKoO17KhebPiAnspGaWoPSWDa5+dpNzV/5+fptZojJKwftsdoJg4Wuyk/di50RJISMDrvHxGbtMf/sXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuqihgHavHMeQOndzGsNrWcPq4Y0OpZql0FIqPn8+yI=;
 b=CPuJ/Qh/INu3eI9S2GDO365HHIJcDGA8FXEMmEyUvTxma4ymXuCuu1g0mw/qefr3LJLt09jELKqFKsjBdQuXm05bJ5k4RWTZtWhm7EN+8lr+Vs/ZHP3v/iPzJimyDqMNq/r6OySXP5aEwccIuBLoo1eeyGzO8h/32R57lCiXKHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYRPR01MB13019.jpnprd01.prod.outlook.com
 (2603:1096:405:1c7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:30 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:30 +0000
Message-ID: <87a4q2vpwt.wl-kuninori.morimoto.gx@renesas.com>
To: Ben Bright <ben.bright@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Fred Treven <fred.treven@cirrus.com>, James
 Ogletree <jogletre@opensource.cirrus.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, =?ISO-8859-2?Q?=22Martin_Povi=B9er=22?=
 <povik+lin@cutebit.org>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 10/39] ASoC: codecs: cs42*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:30 +0000
X-ClientProxiedBy: TYCP286CA0330.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::19) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYRPR01MB13019:EE_
X-MS-Office365-Filtering-Correlation-Id: a51006f0-f7c1-49bb-a430-08df071dc238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	K/wc6LzXaSaLMH/Bkoxy8AYMrK0MhdTMOiR//lPqEyUZutdIoaCBxad+J2DYtfiNFkljv7p6pv6GFny2dNIlAG9HSUcOZ2Y7U6pOOFyxTf/wxaC3MdGnhDBOK6+vR/V0J5zAdYA79R2oUR07VSq5oA42bJRLOImb1ZiXxnwTJ7POKlnbaGiXvV9B9qpVb8GT6sQfBvAlOUbe5iYnzmqNZqfNIUYkfHzo67EMGbL6lYHnUW/vj3O0CAimOXSm5Udxxx+KevXDHISwq+jAOLxDdYF3cQe3Zuofx0EFZ5KupYH7lq91r1Ry/TLqYCBjq8jZvm0lkxp6uS378dCOmUWwW09vEWYEZw5cfs9kPkJBiBUeB8TxaG/me5R39E2imOt+oUyXeVhE3HPW8pa/qAlnERai33LXGAwtTNPVA0v6xj6UF2Ms/25VE3/ekuuoTHg/LpTCmPaPsVDsr/JQBbeFKdekSEpUdZP+oUeIk3DNOie0guAOD0oB98iDhXUuikjmMAt2aKcCK9i8cbcd64jOSq62g38o9oLog6ZZ1YQpgCM+fWMFNmH77SHmV2+/lN1tCB3ZvN0G/nlKjlazlVLgHoVEqe4W8wHWDf2ryxipp6DwJcCKbxKcojhhjEjfeqLtyGQuxl8U3W+05FVyYO8kmd6rDDQS6P+x2PocFBUrwiEn9dy0RkmhqYbB2qmT+kdoSmiNOVNdUieELCd86ZsE8RyO53iIR8HjJO9oOyr3/x0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eOSomHvvw1ECdkokaDBRNkXAh4I7chVDACZAcQ6Y0OTFeL33RY3JDnoqsWpr?=
 =?us-ascii?Q?/3y/iPEGoJGLq/+DItOIP0Fr4BKLdA5J2FcQ+btCwRumtTz+M2ApD64nf9No?=
 =?us-ascii?Q?BfejaNZXgtYBy6xiBkHu8Wy93VPodA782qGtj46nP+6nmmSaNO5LxlNiVdhQ?=
 =?us-ascii?Q?iktjqf+NSw63UjiUBnln8vHkvUw3JhY3e+ybOIcZYPMmz0fZmZ6Jo8yvuN2Y?=
 =?us-ascii?Q?CnK04emDUjy4GJvraKlMFyiPUp6r/A9FYEYzOhCogyva32RZFlVIP5xybU7Z?=
 =?us-ascii?Q?XWkJgI24s8Gqa1JqsjUXyC/8nOW4lMlWPRfeEzFcdsbTtVkClkdsZU67FS70?=
 =?us-ascii?Q?3oNpRT+jxIYPkfiLRzNe2cJe8B1i6e4rvCcl9c1d01k9hCYvs/tOXBUyTVoV?=
 =?us-ascii?Q?3f/Xw0s4YrxNHDaDu0QpG/mSxDi5Baj01soZJf8vJV5OB7TNL/aPHVCLSHnP?=
 =?us-ascii?Q?iSU8z3XH6CTu/aLCesOeQdIZQdim8ELxh0GEkvC33Ok0Tse5eLabhxvQokxc?=
 =?us-ascii?Q?d8vdXaf5pm455Ardz7nL9X2uHuwbuYBMssloqDOPd67zC0XzW+w4nCCTYwe+?=
 =?us-ascii?Q?bdtrTOCuaUznbm5ZTAeTAqOz1qM4BhxOVVd9Y82RK5N6p6gIrmmP3Zq3lsFH?=
 =?us-ascii?Q?3Vz1Zl1qRX6WkbSwva84s1ffBnM6wCouuZAINK/8c+WnV/KcqYoEtJ7NC07K?=
 =?us-ascii?Q?abEbFJSdTYOMpcNqsP9Prcq+wBcqXjkljeY6muOTNzk/6HcrXX+o/Q8OirPx?=
 =?us-ascii?Q?kB24g5i7PFciq1GThdHGGn/caVRJjgC+h+mnECeZFnqeI/IqgolEP18n9lT5?=
 =?us-ascii?Q?mi4Kkm5+kKjwpZAu7Xu2PGVLZtlxwZJ60bK3QnfUJUEmMv6Qx8Fy3icnV+S8?=
 =?us-ascii?Q?1+P1o5rUvs/jJiyaWmLHdEjtL5DQuSU/LDPi010gIIZU3rLRxH7SISgXDP2O?=
 =?us-ascii?Q?FhWGPbjD/DgJs8Zqu12RV0SIuTplvRP/FKy2tx753rLQIOMHtXuzqfrUa36/?=
 =?us-ascii?Q?WUNifCrZQpKC9gjiHlj3QA5Z1XFOW90+UnxHIBLrTsXWt06aI8QOW/zXXV+x?=
 =?us-ascii?Q?8Tab9dkHANECP2zjlwOV0DNLInfbOuYIhZGnS7QvEY84cdyqpytySULRjxJq?=
 =?us-ascii?Q?i0V9nys9LZUyg4iRM8VusXI24SbGzPKP6Ac/zBVjRBYBKuTL9tTzSLQxKcwR?=
 =?us-ascii?Q?Zr6DLn6DoEe/rMaIpTQJfvoNrkSsDUUJ+Tna0/subFt2t7IvzachuFJbKYNp?=
 =?us-ascii?Q?ydkMKdqwyNA7g9F/U5O7PyPX5CykUBhkuYStQ0ZdPFHj8xsXNd+qU8zMkiqP?=
 =?us-ascii?Q?6rKWxEfk6+/Cg2ukkukB6ReuFLQY9KPPeVl3R2FHWRWI5vfckAI5XK236l+r?=
 =?us-ascii?Q?6VGV3DIeJ8Ta35qz8JA0x7EXx3jW7UNbyuVGIQg6jbdc7WgBsmQ1LT6Oeq1P?=
 =?us-ascii?Q?1q6jboJV9vHcVIpbesJ864KSNfhjEYQs202TYa6gNNienN7lVH8UQLCI6EjP?=
 =?us-ascii?Q?TWd7gQUvDG1Wc42wL7xsz6g8ILBStFL4wXoW/IFFp07m3fFHtHN18ctkpzoA?=
 =?us-ascii?Q?hVIWhzPzqo+ljrsuvzHiS+MnfvusAAkYAaNb7uGj2z2t3fXB3u+vNBqIJlAg?=
 =?us-ascii?Q?SqM+grp2TN25k975TLR8DxJ7egVv6Q0ZvgV+d4epn5SxmT5RDt/sRcL/EYcv?=
 =?us-ascii?Q?ui0gAJFdS/k6MTgO5EeEvQXNJFL7lVv/bdRAr8q5uL/7a3x6luAlJmP7SxYI?=
 =?us-ascii?Q?b9H0sTQKkA0DYeYsbUKxS81WbVGZcQlz2KahJ7n7GFyd6cafzfKA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a51006f0-f7c1-49bb-a430-08df071dc238
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:30.6986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZtKyxyZv+d/HPH4gTLAYlJTOwFcpPUcbDBb0zDHfhl1JeP2fKIsO1fWl6SrmRFo5Og6fwSdt5oDEh4agLnmzFqYpQBkqu73A5RPhR8ectYwiWm+HB5aSbkbL3jFEqzD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13019

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs40l50-codec.c |  9 +++++++++
 sound/soc/codecs/cs4234.c        |  9 +++++++++
 sound/soc/codecs/cs4265.c        | 12 ++++++++++++
 sound/soc/codecs/cs4270.c        |  6 ++++++
 sound/soc/codecs/cs4271.c        |  6 ++++++
 sound/soc/codecs/cs42l42.c       |  9 +++++++++
 sound/soc/codecs/cs42l43.c       | 12 ++++++++++++
 sound/soc/codecs/cs42l51.c       |  7 +++++++
 sound/soc/codecs/cs42l52.c       | 13 +++++++++++++
 sound/soc/codecs/cs42l56.c       |  8 ++++++++
 sound/soc/codecs/cs42l73.c       |  7 +++++++
 sound/soc/codecs/cs42l84.c       |  6 ++++++
 sound/soc/codecs/cs42xx8.c       |  8 ++++++++
 sound/soc/codecs/cs43130.c       | 14 ++++++++++++++
 sound/soc/codecs/cs4341.c        |  8 ++++++++
 sound/soc/codecs/cs4349.c        | 12 ++++++++++++
 sound/soc/codecs/cs48l32.c       | 23 +++++++++++++++++++++++
 17 files changed, 169 insertions(+)

diff --git a/sound/soc/codecs/cs40l50-codec.c b/sound/soc/codecs/cs40l50-codec.c
index 6763671630676..698aa59194f4b 100644
--- a/sound/soc/codecs/cs40l50-codec.c
+++ b/sound/soc/codecs/cs40l50-codec.c
@@ -233,10 +233,19 @@ static int cs40l50_set_dai_bclk_ratio(struct snd_soc_dai *dai, unsigned int rati
 	return 0;
 }
 
+static const u64 cs40l50_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs40l50_dai_ops = {
 	.set_fmt = cs40l50_set_dai_fmt,
 	.set_bclk_ratio = cs40l50_set_dai_bclk_ratio,
 	.hw_params = cs40l50_hw_params,
+	.auto_selectable_formats = &cs40l50_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver cs40l50_dai[] = {
diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index a889fbd519a86..a6ead1ee37081 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -560,11 +560,20 @@ static int cs4234_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask
 	return 0;
 }
 
+static const u64 cs4234_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops cs4234_dai_ops = {
 	.set_fmt	= cs4234_dai_set_fmt,
 	.hw_params	= cs4234_dai_hw_params,
 	.startup	= cs4234_dai_startup,
 	.set_tdm_slot	= cs4234_dai_set_tdm_slot,
+	.auto_selectable_formats	= &cs4234_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs4234_dai[] = {
diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index 0b7d6826f4e91..97e32e6ccb843 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -495,11 +495,23 @@ static int cs4265_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE | \
 			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_U32_LE)
 
+/*
+ * NOTE
+ *
+ * auto_select doesn't include _RIGHT_J, because capture can't use it
+ * (= cs4265_pcm_hw_params()). It can be selected via Card directly if needed.
+ */
+static const u64 cs4265_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4265_ops = {
 	.hw_params	= cs4265_pcm_hw_params,
 	.mute_stream	= cs4265_mute,
 	.set_fmt	= cs4265_set_fmt,
 	.set_sysclk	= cs4265_set_sysclk,
+	.auto_selectable_formats	= &cs4265_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 47b2f903a32c4..aa3bbb9519451 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -456,11 +456,17 @@ static const struct snd_kcontrol_new cs4270_snd_controls[] = {
 		snd_soc_get_volsw, cs4270_soc_put_mute),
 };
 
+static const u64 cs4270_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4270_dai_ops = {
 	.hw_params	= cs4270_hw_params,
 	.set_sysclk	= cs4270_set_dai_sysclk,
 	.set_fmt	= cs4270_set_dai_fmt,
 	.mute_stream	= cs4270_dai_mute,
+	.auto_selectable_formats	= &cs4270_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index d8cdd37e9112b..398d8c24a9ce2 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -455,11 +455,17 @@ static const struct snd_kcontrol_new cs4271_snd_controls[] = {
 		7, 1, 1),
 };
 
+static const u64 cs4271_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4271_dai_ops = {
 	.hw_params	= cs4271_hw_params,
 	.set_sysclk	= cs4271_set_dai_sysclk,
 	.set_fmt	= cs4271_set_dai_fmt,
 	.mute_stream	= cs4271_mute_stream,
+	.auto_selectable_formats	= &cs4271_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs4271_dai = {
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index fadf688606014..9e40c03ada4e8 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1122,6 +1122,13 @@ EXPORT_SYMBOL_NS_GPL(cs42l42_mute_stream, "SND_SOC_CS42L42_CORE");
 			 SNDRV_PCM_FMTBIT_S24_LE |\
 			 SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 cs42l42_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs42l42_ops = {
 	.startup	= cs42l42_dai_startup,
 	.hw_params	= cs42l42_pcm_hw_params,
@@ -1129,6 +1136,8 @@ static const struct snd_soc_dai_ops cs42l42_ops = {
 	.set_sysclk	= cs42l42_set_sysclk,
 	.set_bclk_ratio	= cs42l42_set_bclk_ratio,
 	.mute_stream	= cs42l42_mute_stream,
+	.auto_selectable_formats	= &cs42l42_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 struct snd_soc_dai_driver cs42l42_dai = {
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 1b817e1a6ea5e..b6238f89c789c 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -671,6 +671,16 @@ static int cs42l43_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 cs42l43_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs42l43_asp_ops = {
 	.probe		= cs42l43_dai_probe,
 	.remove		= cs42l43_dai_remove,
@@ -678,6 +688,8 @@ static const struct snd_soc_dai_ops cs42l43_asp_ops = {
 	.hw_params	= cs42l43_asp_hw_params,
 	.set_fmt	= cs42l43_asp_set_fmt,
 	.set_tdm_slot	= cs42l43_asp_set_tdm_slot,
+	.auto_selectable_formats	= &cs42l43_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int cs42l43_sdw_hw_params(struct snd_pcm_substream *substream,
diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 0519affe0ed8d..4b964c7133982 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -533,11 +533,18 @@ static int cs42l51_of_xlate_dai_id(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 cs42l51_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs42l51_dai_ops = {
 	.hw_params      = cs42l51_hw_params,
 	.set_sysclk     = cs42l51_set_dai_sysclk,
 	.set_fmt        = cs42l51_set_dai_fmt,
 	.mute_stream    = cs42l51_dai_mute,
+	.auto_selectable_formats	= &cs42l51_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 9d6bcfbbf0b20..10760816a5f91 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -883,11 +883,24 @@ static int cs42l52_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_U20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE)
 
+static const u64 cs42l52_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs42l52_ops = {
 	.hw_params	= cs42l52_pcm_hw_params,
 	.mute_stream	= cs42l52_mute,
 	.set_fmt	= cs42l52_set_fmt,
 	.set_sysclk	= cs42l52_set_sysclk,
+	.auto_selectable_formats	= &cs42l52_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 4d9a22a1029c6..9c6448ebb2cf3 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -960,11 +960,19 @@ static int cs42l56_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S32_LE)
 
 
+static const u64 cs42l56_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops cs42l56_ops = {
 	.hw_params	= cs42l56_pcm_hw_params,
 	.mute_stream	= cs42l56_mute,
 	.set_fmt	= cs42l56_set_dai_fmt,
 	.set_sysclk	= cs42l56_set_sysclk,
+	.auto_selectable_formats	= &cs42l56_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 6ddc6549492af..72076ccf4570e 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1163,12 +1163,19 @@ static int cs42l73_pcm_startup(struct snd_pcm_substream *substream,
 #define CS42L73_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 cs42l73_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops cs42l73_ops = {
 	.startup = cs42l73_pcm_startup,
 	.hw_params = cs42l73_pcm_hw_params,
 	.set_fmt = cs42l73_set_dai_fmt,
 	.set_sysclk = cs42l73_set_sysclk,
 	.set_tristate = cs42l73_set_tristate,
+	.auto_selectable_formats = &cs42l73_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver cs42l73_dai[] = {
diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index a545730b7ed97..77015590368b6 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -662,11 +662,17 @@ static int cs42l84_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const u64 cs42l84_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs42l84_ops = {
 	.hw_params	= cs42l84_pcm_hw_params,
 	.set_fmt	= cs42l84_set_dai_fmt,
 	.set_sysclk	= cs42l84_set_sysclk,
 	.mute_stream	= cs42l84_mute_stream,
+	.auto_selectable_formats	= &cs42l84_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define CS42L84_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 5b689549c74ed..fb9f4aff6bd84 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -393,12 +393,20 @@ static int cs42xx8_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return 0;
 }
 
+static const u64 cs42xx8_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops cs42xx8_dai_ops = {
 	.set_fmt	= cs42xx8_set_dai_fmt,
 	.set_sysclk	= cs42xx8_set_dai_sysclk,
 	.hw_params	= cs42xx8_hw_params,
 	.hw_free	= cs42xx8_hw_free,
 	.mute_stream	= cs42xx8_mute,
+	.auto_selectable_formats	= &cs42xx8_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 48d88dad4ceb0..7bbb2e83a1ffc 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1609,12 +1609,24 @@ static int cs43130_set_sysclk(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+static const u64 cs43130_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs43130_pcm_ops = {
 	.startup	= cs43130_pcm_startup,
 	.hw_params	= cs43130_hw_params,
 	.hw_free	= cs43130_hw_free,
 	.set_sysclk	= cs43130_set_sysclk,
 	.set_fmt	= cs43130_pcm_set_fmt,
+	.auto_selectable_formats	= &cs43130_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops cs43130_dop_ops = {
@@ -1623,6 +1635,8 @@ static const struct snd_soc_dai_ops cs43130_dop_ops = {
 	.hw_free	= cs43130_hw_free,
 	.set_sysclk	= cs43130_set_sysclk,
 	.set_fmt	= cs43130_pcm_set_fmt,
+	.auto_selectable_formats	= &cs43130_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops cs43130_dsd_ops = {
diff --git a/sound/soc/codecs/cs4341.c b/sound/soc/codecs/cs4341.c
index a44e6b3c298e7..74544c58a4159 100644
--- a/sound/soc/codecs/cs4341.c
+++ b/sound/soc/codecs/cs4341.c
@@ -171,10 +171,18 @@ static const struct snd_kcontrol_new cs4341_controls[] = {
 	SOC_SINGLE("Popguard Transient Switch", CS4341_REG_MODE2, 1, 1, 0),
 };
 
+static const u64 cs4341_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops cs4341_dai_ops = {
 	.set_fmt	= cs4341_set_fmt,
 	.hw_params	= cs4341_hw_params,
 	.mute_stream	= cs4341_mute,
+	.auto_selectable_formats	= &cs4341_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index 9a7f701757174..28320951e3090 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -228,10 +228,22 @@ static const struct snd_soc_dapm_route cs4349_routes[] = {
 
 #define CS4349_PCM_RATES SNDRV_PCM_RATE_8000_192000
 
+/*
+ * NOTE
+ *
+ * auto_select doesn't include _RIGHT_J, because 32bit width can't use it
+ * (= cs4349_pcm_hw_params()). It can be selected via Card directly if needed.
+ */
+static const u64 cs4349_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4349_dai_ops = {
 	.hw_params	= cs4349_pcm_hw_params,
 	.set_fmt	= cs4349_set_dai_fmt,
 	.mute_stream	= cs4349_mute,
+	.auto_selectable_formats	= &cs4349_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index a9967771124e5..c11fc1a588c4e 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -2361,6 +2361,27 @@ static int cs48l32_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 cs48l32_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/*
+	 * 2nd priority
+	 *
+	 * _DSP_B / _LEFT_J can't be clock consumer (= cs48l32_set_fmt()).
+	 */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+};
+
 static const struct snd_soc_dai_ops cs48l32_dai_ops = {
 	.probe = &cs48l32_asp_dai_probe,
 	.startup = &cs48l32_startup,
@@ -2368,6 +2389,8 @@ static const struct snd_soc_dai_ops cs48l32_dai_ops = {
 	.set_tdm_slot = &cs48l32_set_tdm_slot,
 	.hw_params = &cs48l32_hw_params,
 	.set_sysclk = &cs48l32_dai_set_sysclk,
+	.auto_selectable_formats = cs48l32_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(cs48l32_selectable_formats),
 };
 
 static int cs48l32_sysclk_ev(struct snd_soc_dapm_widget *w,
-- 
2.53.0

