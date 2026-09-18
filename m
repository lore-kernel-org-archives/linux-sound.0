Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010059.outbound.protection.outlook.com [52.101.228.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEFF54705D
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 01:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695679; cv=fail; b=sf2ask7YdawXCaFgWqWLn0y9xBMqKjvZFdKYlyKVWT/xuraoaJsttYg2PN5cJPM1h2VDGgTOV8ZNf3hwdZNwP/lKfd6PerqE0NtXgtwMboG9O9FOJl+yTxbWl8CmyMPXyi3qudHs3xjJ9PfZegASA4iTFlxMe7Ck3dzEZqbb7KU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695679; c=relaxed/simple;
	bh=3OIOX5C/mNbUSMdKhlUKVG6XibVgx4yFfDdUet3c9uM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mUwvp4FrVkfmGND+3eXQLEXAMKxKnITLda+ZgKllfRGlIOchxo9aBUrgr50AlEfplmkoBgQhn3zg1lILNcHXBdBi5dqiTjkIMGLcmcntaTan3Y6QidcyTFbRGIQwmvKwTUq0y7LNKaFQsZbIAp4WYEoDcaN1B7JR7jSLFktVcUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HyUqvrGz; arc=fail smtp.client-ip=52.101.228.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HyUqvrGz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tC0d/iVBmnHuNT79ZlQNgTVcKC/fEQSFAOCBWbDc+eMc3nAez5GIuPZraOiG3wiCDJt9wQWVPa6448FIVdguxBTeg/2E5Ci8nT6U0XD+DBSKWDXEqYaW33wsVa0/NncBnvW4DKh6dLvarzMC+uBu4g+tNIdkLaS+B4/46xIK37eWo6mlmO7qjoOzc7WXAMc2CPfJXmgdaL2Y8dzl5LFYgReJHCBkeWQm0L6NmaX/394SBD3FlYx86poip7Hc+YeIJ9AMqWzz+xGfhyNIfI//qMSJNfCuSI0FtQTKpmoGZDkwXmDBWWHXzrqX5X0V7RXiqjCfa7tmP+ylTq/L9+WtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44kNurl6eD2CqH9wQZ3AScHIMEheHFJEQa4+eP+g1Ts=;
 b=woZZUwCFv1ty53qTxI8/ydCGcEJQR6/Ao5yWG3PouuDkUQPa/7qdHtkBygjwo6UMEASPIiSIx7bRpF5oeSSYZc8gaOlh5ohTWl2P5WV+mimjJ4pDbzIcVurH9k/4bCbnUUk/VuHhHlCishzs2kOiTZJpVUtSYe9mmJdcVkzSUKr63mZT2Vgj9h1VyTSPEdLMaXuksvWIUSdGDBhr2+6xGaatZIpGZG8rZPLolLgJTjwj1RjS/0qNkclhIikXgPE6oaOYkgBhkH6YozmyJbnItHoaM/KrlxPKcf04hdIInRNmFLZVMpzFEJpkZRaAGMTgq0gS0d2cBYqr7tNo17Obug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44kNurl6eD2CqH9wQZ3AScHIMEheHFJEQa4+eP+g1Ts=;
 b=HyUqvrGzrX2UUzRGtRbPal5gdl8ldtk51IuNRpx48CpsuyMEvP75jkfx/b3Ok+A1BL0SqynxrwfCtVyAkARi6EVamWed3bJnbH4mCvmf9Qy0XiOHEmw9KalAljWCbF1cVFHsAhZQNWpTD75koe0+WbqhSpH9sstIv7iXHOGxK98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB18388.jpnprd01.prod.outlook.com
 (2603:1096:405:3ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:41:15 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 01:41:15 +0000
Message-ID: <87o6dvjpz9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/9] ASoC: soc-dai: use snd_soc_dai_stream_active()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin Sipraga <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Sep 2026 01:41:15 +0000
X-ClientProxiedBy: TYCP286CA0332.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::18) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB18388:EE_
X-MS-Office365-Filtering-Correlation-Id: fedf66ac-4abc-41b4-6916-08df1525ed68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|10067099003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	/X0tghnjfPNJMQ7ImDy+r/6D+iMeqRhZBwh2xVIe7Jqp45z88mIeNOLtyT+B5PhUpEKD8albHZAcq+fMDMCSxWGpsbti48BTnjy8XhTLfw34rFuxiqt7cL9iDo0huUm+f6k2L/O3mjMHpOutJEXzJ8hPC68a69i5Jvaaasmgu5zbTAzuFSUcPeCA3ujSw6Xc0QkwrX17yaCpeXSDFjo2GMzqiFff+m7+lEQUXd0luw/9bQPV7d3dIQhgVrV8ybatfQTkk9Bv5Bz+KJeniBhNr5Opt9aZ8cHuWO3ED0hOONqPm3X8uLqRQ/vKeE4sa2KoW4E6B++hWXusa31Qo9e5rbanAWb52WryFmKx0I89xdCgdWlNZ5KRzsNJZ6DynF9v+dJSWJLsBUwVb/mxM20ShxopBgTCjV2I1xU1T4pV+UOZJVIjhHoLn7WtOcGCsRwIJYyIwCJhEgS+TqIRUwSwk9j3JGKBU4T/PQ3TQc19ejLyn/qy00e8l8D+2PW0LyxbEJJgwn+VkZTLO8wByIHvB/Nsm4vUn4yNLzwuHll0z8inYvwas68qujmcX95cy7y6X/89We7geO16+cjx0Q4t/93GeO0KEXLM32OmGbIaLAD09TrPu9/XgwyG4OLRHJ7KUcjXn1+/vSYMxKV3tni7RNDkKmcmSmwcmgrorB7E7pPpQGIvlkTEaSCQeywnTytdcFLGXtrROR7tmSiCHt3pP3qAEa/HqRPugV6nJNk14T0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eBYvNSqi3WZFPIjALN7o2jPQ6lW/a6ZVIKbM5pE8VucnJdQNNE9cBfZ7qBoD?=
 =?us-ascii?Q?FroD9EC52kwMTbzknjDdIMhko1K6HyxmKmeNqjPIqJIPjK6jYFHOiy5HdJoR?=
 =?us-ascii?Q?uPHpP9dJZ5GHzMLU7UxQDfUI/4SpH9P9MgZMY2ObApCoZuMjEutF7X5JAEGg?=
 =?us-ascii?Q?kQ5ryxGlOMqaFsveegnyejuHDQxtB+Fa13nPMIxJ1FL3w/Ft41l2jUUeJSV0?=
 =?us-ascii?Q?f6lY94sghLVu3gWufKmDDrPT7ArBio08/1CPPA41PDDaTs/11NCB17s10v9c?=
 =?us-ascii?Q?hUsmm+rJEdPzttVZOYQgTO55ECdaSJH+dSGVkuHFiVQuemmRXkEZqfp/VEyA?=
 =?us-ascii?Q?Z82WRvFKVGItm3VgYoX2lck+gmpnx/RqyaUrdKGty77aFVKtkvGbezhaaCiM?=
 =?us-ascii?Q?brOfVrLae0ueIS3BZO6DZiKIKo8zml3yd9/gKkZTWSd0ecUYYVi60Co0RFVJ?=
 =?us-ascii?Q?f1qjPACCLF+UAD/DT8UuXApYht+wy3xQKn6SRa39BNRyUcxIR4N4ajnInMiY?=
 =?us-ascii?Q?W0xWfLDwvqwKb+h1v9MKztSr4ctu6g82p4EeYSLDK0rnMU35zzzS2YNjGUtx?=
 =?us-ascii?Q?yJ8ZQW5EYga8x47C5JVc4ha2LW+FjyvTXynGIrevN1CHLagt+fLVJRehKmKm?=
 =?us-ascii?Q?sJitbqGIqFZhuSFofKtM/HbydLOmHA1/vXPmZXXF7JmcjaqWzxI3bhWoDrTm?=
 =?us-ascii?Q?vS/zEDT1u01W16Rs8hynHjvkqvy25fzm+oQfOz0q+a6GeaxwRafJX2FQ2jYS?=
 =?us-ascii?Q?SDYi1g6F8gQozNk9XuMvq0A40BCWKRaOcUPX6PijIW3D0TtVM2kr6o5+MlKl?=
 =?us-ascii?Q?xq/igLh7grMtv4l+aA617ewiJBlTBQNhOLQJE2d5TWYzSjV32a8Le4xLThRg?=
 =?us-ascii?Q?Az6rsXpLYkZz/EPfZ8XJfCNBEWfTFH802auYpGvdRi6LWBLHwHJXG1FDlCwS?=
 =?us-ascii?Q?AnMvsMxQlXCz7cGruRR1HCxKFenNpvIYkzqMHbPdAm9HaUhEqT00Htzr7w6O?=
 =?us-ascii?Q?aDh8zaP+BbM1MO3wx26rxquRtYsB8g3dYCJFaMo53odclnOcV8i/q3WoMyjZ?=
 =?us-ascii?Q?ePIitlrcicP3rPTLgPwE/H089omXn5Z80DQmokjLGrvL8gTxUILAa8Q+kMnO?=
 =?us-ascii?Q?zrQt1aeYWGrtRvcYLL03/cT88pIM3KcK9gAtzx+T63glGJ42q3YrfRuP6qFZ?=
 =?us-ascii?Q?eYuIZAYnokBYoF7MdxGfEihYeq+j1x0LQNZxUQncSbq5L0Tao27wLlvlLm8O?=
 =?us-ascii?Q?BfV4s9/9xq02CC3dn4KOwiLovcX3m6knlckuXCCBSurVhmLTZNteIvvUYpla?=
 =?us-ascii?Q?hIo6W9n0pREpyAkYFQdRkOv8tGPmhsDRcs17hiLEVeXW/yf6NuNc8YzKuRnL?=
 =?us-ascii?Q?YFqtdmzXe/BmT++pYbrtIl+KPlXOHdR0YYy1U6Is83NgGAWOYAyDkHvdwwMp?=
 =?us-ascii?Q?H2bj32aocUtpvLrn8DjrS55Y5uJu8/99g2J0qG/BspsR8SLF97vAYhrhf+uW?=
 =?us-ascii?Q?zt6qnyySI5sU9g07Tngo+O3uPXyR8G5sQgpscth6vNlTKHkwheW7LjslHhtg?=
 =?us-ascii?Q?4mcLlhwjAePZgNzQmC+qPC1Y+LVEKOPvJlXXdLCQCdKLjkEOH8xkHvraPLZw?=
 =?us-ascii?Q?ZqVeYrXgx0+UqkglUgkpFeIWyxEkS4Gp8Ziu5HGNClI4xGJiAjxEOcOwVPup?=
 =?us-ascii?Q?L7mw/JUsNUykk1VaC0EQr0KyIa9K8A+4xxMokZllH8iqM9xb8M0Xice66XZQ?=
 =?us-ascii?Q?c/+nuSdBWxWv3BsVe6rtMGA9hiyPUidU0rMvOd0lsRqJEZ9Gh9DL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fedf66ac-4abc-41b4-6916-08df1525ed68
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:41:15.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: noyp/kTjQklESfVDCbHwzJXL/HiQWK55029skRCKxjgyfiH7PA7KCdWXs6Kr45Wg6sszaBpZuwE1Ec8qyMCv/9fFGfKeTbSKTTXDiYTOqwsYTULsE5xTc19lWkaunlVx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18388

We already have snd_soc_dai_stream_active(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 83d030e14bb0b..0cf70f0903dc8 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -688,7 +688,7 @@ int snd_soc_dai_active(const struct snd_soc_dai *dai)
 
 	active = 0;
 	for_each_pcm_streams(stream)
-		active += dai->stream[stream].active;
+		active += snd_soc_dai_stream_active(dai, stream);
 
 	return active;
 }
-- 
2.53.0

