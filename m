Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C7C3A9623
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 01:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695795; cv=fail; b=jJnLYoOzRZ4ZxTU1UVxMiQlypEmRKNe8VFG2Gw2yW5T1ZNb2AjDQOKCESa3YR20nb3zChTh4KA2qrLj6ibPWVDnk7gq6mXhPFelXb2Z+iDOxPuguvVVViy8LiPEbmGgIssmhWwc1BEZLKuKikVl8e3KYqbjOOZVZl8cr9XMFpNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695795; c=relaxed/simple;
	bh=nZGfH/Eer4hNBlotdAbuWlgEItVljZF0VpECCMCPTD0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R7Gi3Kx15QFlTCChMSTROHBsHX6/+lLm4q5IK/PBfGpvWoBj08jFyZrQduXt3FqtC7LjkKIAi3CwpRZXWxPApo9xwYzQpG1rFcOApNnJQ5eyAKxebqnEiA4OFt/0n8EaYS2/9Eh14jGlssRPUCVpAPGeGNuS7Tey4qofPSQ1JVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F9onsHkp; arc=fail smtp.client-ip=52.101.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F9onsHkp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPxTtnOCuL2XT+7WSaogYXZJJfLFdSooPJJBpMzg4kafRPYi/hsOXBEnQMY8D8UgSOha9oCwVoaea5gkTXT/coVoY/nLb8C6VZMQzwFE2LXpMEcqezs4uOLsxcnnCccJ4nZd3lbNY/X4n257BWoaegEp/SWuJMGTpA1TtkIMYNEgOMrfKTdmZWuPVkesZtsXwY4hmSZgchfsY+oGjyvnhBJ1hTYcT1FlO7LGU5u4SVn7NxrAn3QW+4/AJcX8mp/R1SHmZ01oqmSClH1dDFJlilvqBlv8YvNGHArX9BwnbLENujYdCB5FTBkG5IjyWIV1aF11llY2hNCZ3OEm7YTi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OTUefL1x/ftu9nQ1mhE9eB6mtTNBXX2OqfG/+c9iq4=;
 b=ZS7EIhOrIjFW8ssXbS3nSqFvx7ssldc7W6qa6WvkqNxsmNWbexNYcw3e8ibVRHNLL0UCJGGFiT6kfWE/PfGZMb6syz332Vw9ar/6lTzutlfQ5eB5wlng3Ls7cytw1hCuQrLhQNYozcAaYYlmD8tqbysPOA5JKvfeSR4j8b9yrlBqllaDFzE9RdGy/jCNSYDuO8lF1VbBvHi44MpsGv9yJJ87AxZ4hmYvT8oP5xzYfyCkrOsa59jqg1ToIUAjO1jHylewcxk8QDWxc6bzTyNABi8Aj6G6vachNgQ+ynKCfvw8W3cU9POL2qu6m68+rgatiXpMopyL205gs5uD/TR19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OTUefL1x/ftu9nQ1mhE9eB6mtTNBXX2OqfG/+c9iq4=;
 b=F9onsHkphRn02ianxoUYNjTt5RCwYOazFRvsNeJKPq/h1Gs4RFCHgPVF3jqY3CXC93QvSOm8m+l1PrHEF+n0kmIVEr50SGCVOIrKJWPz4t/usdnkbq5YZxNLTqeQMApNCC7/f3dxo9gHasnMcNOA61CxgMlzKf+CR0Lht4IX1bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB18388.jpnprd01.prod.outlook.com
 (2603:1096:405:3ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:43:10 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 01:43:10 +0000
Message-ID: <87ld8zjpw1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/9] ASoC: soc-dai: add snd_soc_dai_to_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin Sipraga <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 01:43:10 +0000
X-ClientProxiedBy: TY4P301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::15) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB18388:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9437d5-0c50-40b4-083a-08df15263214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|10067099003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	4JW6y3Pw3kASO3sT+TZXZ+vidg6hoiu3OHvuOX6zuleLVAlc5OZvEsfNJiSbxSCfZHqqJcO9SvjxTXdS/xMWHzNPYiiDaysiTWhGDbFXQnuNCl0llamknzwIcVGtM8uGAY297dlLAoVvmVLzY8+YVXZafgEH0IQteDJgyZMPDfkzl/v5fGxLfdkqTY/l2eHL8SaflTwuLWR5CMb5SAq08Qh4ujgAiCwiN5IoCBawe8zpd1uyuceyHKrpIKK3HmB/ZD4XQ6b4CLlGtOGNECIpULFULOrs5jQ2bv/aP7Wa0tXW/RkEw9D88KWVcJny++NAUfcEDmvRLYn2zqfJgNDR0pWtCvDLUGMAgupP8baPd5Tyh32PpUGOvgmAbLbi1YuLv+jkTVkuOdDNHk1nkJn07OFfILi8oQAav4sAlfKSjyiDuH0Kt5hV/DAdgrg2viI1QQ1gFctoPzVqZaaokiVo4tpxWgBbklbTuFXXxc7VGrmq98TcCabyvjUgP5EhIL7Oeb33XoXA+4EAZnYnSoQi56HmOl0sp4THOnwrdaxSFF/YjVwbRMfZapZtqnQ5W70JVlIj8mDZfkIPCeb7tmXi9wbiJwQuIxUIkG7YtcaJOR/tC8n+Fu+ZXxptA8eZ5jADGJ52DgeahWJZkMnvTJEQFGLKPqNP3dr/FZbP8yqWClSIJWg6/DTpUnj4lZIrlIH15C+sfYujPIeG5d8B6gp2BGFBpKu7nsJ0sNu6tYJw2mw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?Ufg/86T3z7fLW9zhoIVro38QLRC1XBzoLoYlSE2SNT0G04gDP33I7SER90?=
 =?iso-8859-2?Q?mN/9MT4ydHiAvTL+fcTqGuEEAUgMx36shoHUMUgpFfXedjsEOTkaEixbgq?=
 =?iso-8859-2?Q?+ItsKeByuVknjZG4RN0tbTXvhzJRf3zcQCK4f4Ji1uq+oz73n3eFYtYyTB?=
 =?iso-8859-2?Q?BW9mvc/Q/uFu22pu9DN1Wm6T3J+FAn5fXXddC3JaXRI6GMPmUNlE8/NYwb?=
 =?iso-8859-2?Q?/W6bCexWCFxsrOfO/RryJflkvb7LM+vJxsndNptUiDP3n8WKjUXimTvMaV?=
 =?iso-8859-2?Q?WQtxutXcoEUVTdf7GTbjf8STRI2LnmMBn4Sw9erBZaG6ZTSTcsk2WbJ0TP?=
 =?iso-8859-2?Q?Gf3/l1FK42oVDnlnV+3015pKo8QZkBHhfEwPSJnN/MnCrD4oGIjaElD9OR?=
 =?iso-8859-2?Q?wSq82BmrmOul1671mxAoR497o6DTzgysb9DvCdXmeBAPL5aUvQrJrhMVWJ?=
 =?iso-8859-2?Q?2Q7U3l85d4wC1lko3uiI91pwv/EATjaSGPJ3rKV54d/KXaXhmhQ9NLrJTM?=
 =?iso-8859-2?Q?n/feDJ+PZ6wVXMnNcdYcU2rs1b7T+Vw6LoQCJfqVFRMiVtOQafzTT24V5U?=
 =?iso-8859-2?Q?GBfvKQRKvAlhHCUniQIdDk4ZF7biIKbIal31uSCOO4zWZsaP+BY8rri2Uf?=
 =?iso-8859-2?Q?VNCl17+181qhtI21PZMH+afqxzN35cGP/y1b+gwwpIG2RDuTFftSYt2vPJ?=
 =?iso-8859-2?Q?Y9uYSe6GjmpLYC4AsYPkH7qzsECngRUIMQpqCrJjBq5vbu1gDKOGx3L8bY?=
 =?iso-8859-2?Q?iScZa5ujBB4HTBEgE3eKiCQYn2bvMu5Mr9I/KNMxLFbdr+EHUvaULMlkk6?=
 =?iso-8859-2?Q?rbyPyqDYZ4fcUAv6dkDDCxg1sCWzBI7LVM8uciFXLl20jzQ94H1PrI92AM?=
 =?iso-8859-2?Q?0FSg+j62ID7YUKzahMY9E//yaQd2uwGE+Y+5bhosuleEa++5oGFh7eioA7?=
 =?iso-8859-2?Q?HdVAkprO3bCfjHvKXRX8pvW7qKW/n4Dtltni+ZwQQgS0wt133W5vYzMBS1?=
 =?iso-8859-2?Q?tV88E631okT5ZoNW+fcp4EP2NLbcV05EGBf5PJe4NvtV1nLWa5raqAxgaC?=
 =?iso-8859-2?Q?4GteR5EYn2DeYhyTXH8mkkxrW0JrEzD/oq0FcdyZ9VYR8qVQbhu/BYihLF?=
 =?iso-8859-2?Q?JEDDkGYQNeX48apUstWt+Qvzp//b9lOZw4dmSEosJ2Ry499l+/ixb8BLIQ?=
 =?iso-8859-2?Q?IKFCky+R78EF8a9u7hTFzMlB7Efjghd16eaDDMG5XOldkw7mfYJTTZ6Xh8?=
 =?iso-8859-2?Q?/z8OA17EArmS9gY+uqVJaw6hzuLtcgWcw5cid2W0LIIurPRGP4rfJ5B57i?=
 =?iso-8859-2?Q?gMmCeFFAy7FGAMZrN+u+DXJmTzmcUznutAsTrn6YNHEjROnEkFtwsdoXCg?=
 =?iso-8859-2?Q?n3s7nrpiyuDiaIAejJK+PssFI/DRauw8tvrtDT2zQuKP1CzQYJL3V1H+eY?=
 =?iso-8859-2?Q?OeWF6PDNCfevid2kqJNyIZlsynsKZQ1YcbvPZX8KKoH2VODvQNsai3pto/?=
 =?iso-8859-2?Q?mNUY6TFmZEZG+J72K7qRJFI4J1fgTKJT/KCkG2tIDEEuDPJeyWSXYoBufG?=
 =?iso-8859-2?Q?hwxTbGr94brvp+BABQrPrujdb0C+eQbnnV7lycotWFqD6/8nLhXcRaByTz?=
 =?iso-8859-2?Q?b+NBX5MY4JHZEajsWfVyLLpqvtvOpL/+LtKSkwgSMwPYPQv0r6U5Y4O/ZG?=
 =?iso-8859-2?Q?/tYk/sc+FIQbWq+7r2RQj4uriA9paOqHwGVwK3vKlvsW098PKSJh7NefMe?=
 =?iso-8859-2?Q?AfJaoY+RILg1+fW4M2QeomFE/vx5j1Mf2hGhHo/HPaRFawx+sFPVJ+JZ9m?=
 =?iso-8859-2?Q?8n4S6fHWVQ8f0WezcdUwcJdlTEaCaCyceSQ2Fp8MExc2lfjlKVaU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9437d5-0c50-40b4-083a-08df15263214
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:43:10.4294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMEcwIOzeU+5jesFGQPt4gTuzPyIHSNldKK6MiLSEGuaBx6k0Q0EG7fdT8T88eJuacVw+qU1PnckO8o1r68HGmwCOv2Oi5pTg1bXXg5U3xnE++JG9P/htgGor3Qo98ge
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18388

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. Add snd_soc_dai_to_component() to get component from DAI.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-dai.h | 1 +
 sound/soc/soc-dai.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 02b52fed97c9e..7f8a64db0dc7f 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -212,6 +212,7 @@ int snd_soc_dai_get_channel_map(const struct snd_soc_da=
i *dai,
 		unsigned int *tx_num, unsigned int *tx_slot,
 		unsigned int *rx_num, unsigned int *rx_slot);
=20
+struct snd_soc_component *snd_soc_dai_to_component(const struct snd_soc_da=
i *dai);
 int snd_soc_dai_is_dummy(const struct snd_soc_dai *dai);
 int snd_soc_dai_add_controls(struct snd_soc_dai *dai,
 			     const struct snd_kcontrol_new *controls, int num_controls);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 71de29bfbbd0c..a859acc4b28f3 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -20,6 +20,12 @@ static inline int _soc_dai_ret(const struct snd_soc_dai =
*dai,
 			   "at %s() on %s\n", func, dai->name);
 }
=20
+struct snd_soc_component *snd_soc_dai_to_component(const struct snd_soc_da=
i *dai)
+{
+	return dai->component;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_to_component);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
--=20
2.53.0

