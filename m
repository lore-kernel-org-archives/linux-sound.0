Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011045.outbound.protection.outlook.com [40.107.74.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C42882DE
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398029; cv=fail; b=TAFF07phb8qiKPlzijSbd/so7vt8NIf3dX663J6NWMmYTD5APHYwSHu6Jf0wiF7s62cJ8tA7j7wm63NVYsKbRVbLW6ZFzFw9I82U/Re9XbSv1wiNLaBmE5s8wtSZytMOm2jCCeyWw9kP4Qgvz4GlzngbU1q1UsMrRdWLBFnAs2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398029; c=relaxed/simple;
	bh=VWc4OvTXQcZ7NqJD3IPv9ijLRfheStK7UhGAyzsIwT0=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DHB+YNfk4+vECCrO1pslAJtWBgPtlPnjDxqUQShxX5KYaGSQfFwelL/vSQlsNAtZBpz6X2kx4X5FanzNkv5Waquvz2zMmg5kiFDFcICh010kiaPEOUAWwbmEO5Wz/I26YIj6q7HETojRyA04LhUZHvSwhUSTveatqu2ZnIkzSTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WnJ+vCGY; arc=fail smtp.client-ip=40.107.74.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WnJ+vCGY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugR4UKTK6yJkdPijTFnxH2bnpqDoicnwdnsLZsohIkxpFQfOL0wRnUfwcCMJ3g7r/+PbJHEb0FvwW41nBrXuEFEhTIJckjfpD0rhfs2UVzbIyEbOCVp3mPLsl3hb8fE6W11kIJLex4JrAeIgzQezvdV/wnK7aWSFAjc9bINoF1/QDBgm5vkKl/p+HSOwmsQPgxcqSC2bc+nDOZnN7WuR3xXvbr1cmhoH9MaiTENbWQzTEAuHKUgd04v4qhFi6W5Mo9N8WQnSDISKK3D18B7G8GDlwABZa0d2AJSqalIZ9c9ZwHCJ+MEdGfdC6icnTXaN7jFIwSdVcZ/2mDod5FEEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPJD7g7FksGIA7vX9WPKjbEmhp7qi3NJ3WRMr6Vbmeg=;
 b=ppVH9iIS7PDYqF7v32sFtD5fm5ANXzO8ilAYUXy5ZFtUSygjtKG8D6iFbOqn4avkatuIAZ56oIzI7gpal2kqKqTn6IYUDaniVDYqcGtzKa/ienKgppcLmUAEIfWIsPclIaefsNMV3+L1XMDgxLSGgXf8XaRfcnVVHsoVxl3cPLywzMgmHH9drKVjXQyxx5E6lZsPv8gILovxnIPeTebwHQEPhGDaelikJXH6XmGPqboBth10ypmN8E92Iwc5Agb45g7g0xquAx2dGJJsgfCnfCk0AdsHaOdW3cIqJjjRqPEVk5UxAkBoZQJPwmKMwv3MX7Y7OXQo39ofPuu6kTtUog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPJD7g7FksGIA7vX9WPKjbEmhp7qi3NJ3WRMr6Vbmeg=;
 b=WnJ+vCGYcNuSia+6zUjkl7UpFCtakPksEb9qDC21PIA9GiM+fNATBZM1fGfS76Op15m+OxWugXqpaZNn4C1d57FWbnXOy4FG5YS6Mk6iTmR3PAUykAuARNOy4Isnb7y7TFppUpcqvA1ohyhYt8AzAM2QWWr34jil2LlrtSGIggo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:13:44 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:13:44 +0000
Message-ID: <87tso7yw53.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/21] ASoC: img: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:13:44 +0000
X-ClientProxiedBy: TYCP286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::9) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: 3124ca89-56d1-492f-c7ac-08df0958994e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+cVXBW/VMbmiKR8r5gniUvKT1RLVqammEo6MErbgBNDv5IWTAYsPh0zUDNXLGAv5rjyGu5Tsr9q2BWnnaoRpLK2UOWcDyUd7TGnhNzFxnC1FwSmIrOy1Q8pftwzq3PGmFEQe8QHBMPRYBgy37kIveF71hx6akPBDpXHlXCUO0C3mjqsoLyABKhHmuu3zh6JV/AfaGb6f1QJhfZJJh9lOsn4FZUPe8T2ZAN8xpVJr4XXyY216gum6gZKDaIj0ty4NQx6E2Rjy+p6/BffoqhM5fW6r45cd0swOAjMKxvY3CVBhP9l80M/yus0WbC+IJIfI1+lX+JlpgGFdeiQIxkra+1Df1lkAYMhManrJQWdk8cwaLkZc0rzBcohe77sHmrVuJUOXEvrhE3sdswbnDs/wP8Hh00Bzu4T7M0K0lhxXt9siqBCFibqXMwOinXGgFim8D9uGWzOHFec9pFyrfOF15Yh4O1K0j7d+fkOUhqgVgQY+12qqMEMxt7hQQURQDHFMG8DTMINO0Hg3JElsW7K3AQNVaKEiAnfqy37Ihuo1Gabokvit+3k2M9k6L8957XK2xnpH3it7SaPf1yVp9JSfTvll/RqJeY+OPDMKEUhIuiM9j8pv0u8GQbZrPr4pTtktPPsUepuFTZ1nvp19r+njx0kra+FP/+4aRoSZwTDY8Agq6Wrpu71Izr8tZui/mJMdmX62JrPHoHROYaPMaeCltSr+9eYCDVF5mAC9Iufjebo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WD11Yghe6CzBhaGdhbKYY+VK4v5yyPKiMNFbvV14+b12vaG3M+mPXiM+/3LJ?=
 =?us-ascii?Q?jBvVOic5SJEg3nhW77UEDuYYKZJqilQuPmzgLiOYTAdokeGbK5ozxTAr0eD1?=
 =?us-ascii?Q?Ux5j3tdGlBgi01kPPhzkxklSUUO+7O+UhihpJ+UoZj0PI8Sv2w5AhFBYfCdk?=
 =?us-ascii?Q?SBvpW614Py5CZ6mnIm8dw6fRVCLIjCtctC5n9g6MTgrW7RwzIJHLNyhv0KnK?=
 =?us-ascii?Q?zuLk+Q6cJTIJDT+/mUkUtIQN37ahA79Wm2W7vuCpFX0W9hrewflCYCRlkxOu?=
 =?us-ascii?Q?kRHLwwsIbD1qpUA7JMV0CAs7Ocw0PYjL4pXwNQ4NjB/dp48mFgeCmJopS+T8?=
 =?us-ascii?Q?u3lwe+7ttpjooqDJUCHJCPHKNyBzTw1aOPYPVud+Q5WqvKdtpV1tJeV1D9+S?=
 =?us-ascii?Q?O5j0PE1HO4iYGUEpKmUifEEdDnRd/LlgWkaWNl3zEoyjvzoaZZNUpxJNaxGC?=
 =?us-ascii?Q?CtM8OxNsKk63+wBxGNsyCPSfX9XmdbsTDoe6LMta0yEaTXkgnJXNuohs23hR?=
 =?us-ascii?Q?3g9mOYXNIBO6olGp6A+wOwQOo/14308wVFxDWrZogtb4AJwzN79gzJhw2QiJ?=
 =?us-ascii?Q?yVcAo9PSLmAC58BIPPbNTfqh1jD47rNp05eGEdtIiY4ylWU+QB5q/K53+Z3/?=
 =?us-ascii?Q?PJYiA/etboSpvN0DByDSIA3dcJcurqn5ZTebufC9Qt4OvabOaXtmNGIP+jET?=
 =?us-ascii?Q?TIShY+Je87cZl9tzK/2AXdEL5RDZD96sspVSaa5YZZPBrm2PhWAu+JvrPqQl?=
 =?us-ascii?Q?uUDyHVhUUPGTk90ehs8dfxSyCCom/WYQJX/VI8r4B/4E6jeIn5UatqDiH4l4?=
 =?us-ascii?Q?WIaC3jLswzgZ9mTpF56qLCGivkgvEe6y/byram8EvtrIXgNFp4hsHnBmHVJP?=
 =?us-ascii?Q?fkg6As1/aWj5DDsnH5pePVuN6YihOIfUl0i6RU71oqbvrbB9YhWEvyEq4wm9?=
 =?us-ascii?Q?YsFzgLZ7Ek6mY8FyckNlBheahu4Ka3dzOAeLpQDu6amxgx1o9hzXQlY8nI4L?=
 =?us-ascii?Q?0cQmnyHN/WGiMRxWTJ9VQIoGNXIfy5ow0MpSYhWrI/noIoETY/qhaVbif8va?=
 =?us-ascii?Q?LHWjInOUHFjeRk/lZ8LzBoBf1yj1Xv4SheNeqohLPFWDrUCv+yidaGe4mEJg?=
 =?us-ascii?Q?9AREUDcZNjNeQAeKOSxLQmT8m7HPD7v9MY1kH7CXRptIsenGMvT/tcd1r0u+?=
 =?us-ascii?Q?n9VW82eLJFzSK+EQ0SncmC8zpq0eGbGDJIsSR5Xung+66EZme7ZWMnxe+xCm?=
 =?us-ascii?Q?4Nii8alfaRvlsNvhQ37r2AbXP6oYHAg4+iy7IIt7bD0JXJxQbLfd+S/agzE/?=
 =?us-ascii?Q?xrjfip3WMO1P8Pgg4HZTdKws8kmPNsuVMXLiE/0iG4LN+HTFzQ9FLd5abe49?=
 =?us-ascii?Q?dbO8/SjoSwWJkUjw+0QfSiYswqKBi6z0YwFfCfjK0VT7QPAvGOVNQYQS34Y+?=
 =?us-ascii?Q?eann33MVmlqWoTxQaEvjSBXcQs34t00woTmeps7Jw/dIQONZnrv6s4ckEYHF?=
 =?us-ascii?Q?e3NPWALAM9WGHZ8/6WgkNFg4yNrY8a/83pxufB6GP4mxb4qCiQJpeeeR94lR?=
 =?us-ascii?Q?5lV7Ib0316WF27Y1KeHAhws0M4C+DEynxguv8hj/DQUV6j2Ygrdhbd93qAu9?=
 =?us-ascii?Q?TtMjOFicmKyREgxRVoqdzUaCD+jOu2fE6cxV2MzAXsueCh7Hxp9Lbw0+Sxzv?=
 =?us-ascii?Q?seh5sGt1j1c9QtItuPXEaFczVLYlK/DU8YuiiP1lj+tl8ZH9TS0vLJqXhTjV?=
 =?us-ascii?Q?ZqSXlPPEyeD0h3p6nXMcuHIfocd9NK64M8RAiuGoGjF/M+T0mXHm?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3124ca89-56d1-492f-c7ac-08df0958994e
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:13:44.4764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gls4dNeTpdD6htjqDwOvWi4+KcYCnZKuM2BFCY9zlWCFImYdhXQJ182pKhBYueeCguneTBPQMzzOPef/57/xaq6V4swtfrp8+DG6vYZ7Az4lHFEgpJ7FBbAyV+x/kt9I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/img/img-i2s-in.c       | 12 +++++++++++-
 sound/soc/img/img-i2s-out.c      | 13 ++++++++++++-
 sound/soc/img/img-parallel-out.c |  8 +++++++-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 98d2ab68883a4..a0c87e2a9b30b 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -379,11 +379,21 @@ static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 img_i2s_in_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
 	.probe		= img_i2s_in_dai_probe,
 	.trigger	= img_i2s_in_trigger,
 	.hw_params	= img_i2s_in_hw_params,
-	.set_fmt	= img_i2s_in_set_fmt
+	.set_fmt	= img_i2s_in_set_fmt,
+	.auto_selectable_formats	= &img_i2s_in_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_component_driver img_i2s_in_component = {
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index aedcf56a5359c..caa7870dbec6b 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -385,11 +385,22 @@ static int img_i2s_out_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 img_i2s_out_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops img_i2s_out_dai_ops = {
 	.probe		= img_i2s_out_dai_probe,
 	.trigger	= img_i2s_out_trigger,
 	.hw_params	= img_i2s_out_hw_params,
-	.set_fmt	= img_i2s_out_set_fmt
+	.set_fmt	= img_i2s_out_set_fmt,
+	.auto_selectable_formats	= &img_i2s_out_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_component_driver img_i2s_out_component = {
diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index 86b60e6dab38f..89270913ab352 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -183,11 +183,17 @@ static int img_prl_out_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 img_prl_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops img_prl_out_dai_ops = {
 	.probe		= img_prl_out_dai_probe,
 	.trigger	= img_prl_out_trigger,
 	.hw_params	= img_prl_out_hw_params,
-	.set_fmt	= img_prl_out_set_fmt
+	.set_fmt	= img_prl_out_set_fmt,
+	.auto_selectable_formats	= &img_prl_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver img_prl_out_dai = {
-- 
2.53.0

