Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011015.outbound.protection.outlook.com [40.107.74.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6613803C5
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804145; cv=fail; b=PRdMSBtMk2otgyMAHUhOubN2K0Xv4n+7fXMJQKzh6j0XXb+02AlEfzXNX8IEsroN5U/72ONiaICgD/2dRCfXtKRHNhwLIrzqcB5EkddWPcQ9SvqUUFp6lDd/jz/tgjA5QasVp71glY9KE0NiizmWmF1uC7CHKSbPDmqDsNRDOno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804145; c=relaxed/simple;
	bh=IEyGR3sij9SJj7Oic4XpFCOyGHzsoAJbKpx0x7K+tR0=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NwaSSoCg1cAMUO/gfqQoLHndBul0VOTZgUlalENj6RA5ZFfpRHBGZR0GJd7SA7ZKpN1lzkk0ym3y2WYYFoil4WTmErv0hzlzCuQKNNwAb5nyEIw809yECYxTjMWFKlzKwlmzMh3kwc3Of1IBpCnrmaPFya2DLoIc9drKLXay3Oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hMVJT/4V; arc=fail smtp.client-ip=40.107.74.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hMVJT/4V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EH+79gwF44mdWt9DChPl1RRk9aq0fKr1nzAksjLnCBaC0E4mx/s7uTRYXBEPlh2wLKhEQFi/X5goqjw4OWc2sOcC9iij1XsBCyg6ASbPfwPTUq+A5amFzHZeC79WWnDlwJ9kNaSnRXwugyyjplkz6nLpDbgH3euj+b9RqSvwFLHmN8zfYeqASKG+oiYn0uN13Rf6Nakh0IIIDBlOCWEfzeY75Szot2nvRvLDy+KR7Pk4xGbKyXiNmSmZVWBI95Cevug+/Ut3aBK9UoepnMPfw5MQr/EoYTVP90YZI9g4XOZBF3hE5Ja0iJf3UR6t6oShhtw5e6RSIJcQl1cBLZXUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5P2XpBNwWR2qKBBVy5xF4G9s9gEMySd3ZUolPEIDJY=;
 b=yWXBNka+jV5FRpunh+nAUDPMChuy3yJsuTduTHLkzFsH74yYdFbahl/vu7JyH1+NMvrrL1ECbCSyCjE6xjDKKqT+OzqHyX5/+xZjKaMCzmtyItfk3USSagOIYUEtHClYZ55kOlI882fkNbvabHa7Vizc/FTGaLJxSs4LmH42LWPTOmrCReWKYXJ/mNKhFIohFsvh89Ik0v+lQK408Ti9EETz9MEy6O6/rVeuWVsxtXNd1EIof2KEu5DdlaSGOvbF3nJk8nEVCWvkqY1yMCy4xrya/D+n6LN/OB1K35rvZvDKHzYA6RSIe+wFMCbqOVWdqOv92uU38qLQsUXH3ePH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5P2XpBNwWR2qKBBVy5xF4G9s9gEMySd3ZUolPEIDJY=;
 b=hMVJT/4VSImtSie89GqTJrEchVMuV0Oirz8QXyRx3A8hNAtar4EMYCuXQ1HYX9TM5x9AVmbSCqWPeSn8OhkUcpRira6Z7icXbI/yLP6h7ctg/ToYc+02HAqQB+kY/agfqVBAzSJec+/0n2naCVAOMzh++YiqDsyQyqDODnVL6PM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:42:21 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:42:21 +0000
Message-ID: <87h5lawwb7.wl-kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 22/44] ASoC: codecs: madera: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:42:20 +0000
X-ClientProxiedBy: TY4P286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: 597308b9-8d40-4919-041c-08def1c13e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	B6JpLR76EOXqbYoifGlxsCbavbP0ZSUXI3dZrIMYtSmwLfAQBDthpIxf6o6MCinxLl4eowNhO1zY1lUzgwDpuNlVCmNu25c2cwFwilcwxN0cXfBYFxCfHcMbviD7HzPo/82Hmeutugymb1jn15Vvuq4bKiQ0/h9ty8+aq4Rx/EVk7oduP9HAGtdY40phk6o40sIujc/jn5l4uGissln1bypRnfDoCoLT0fWhBChRUljdnnqgzzhDTKC+vR5hfaUARpMbfD5J+MKUHf5fUBTQWwNvzr/LUlxD9urP3gpqUK35Ifux7KoPupzjiVP8Fu342JffNKDHiwWNHvy1fmF1QzogZo/DwU8FgEh5m2K6hx19+QavJuxu9cErRju6tZ/b0qDMcDUxVAWThZX1yFOK0J/c75BHuWhumk5oEvLEkw4NNKMp4iy9Qjapr+oYouwEdQuYUFNs3vVoNUmQmD0WxTGxGIbnT0zblWcOJ0HnomeE/2VLm21eChzKFvGWPIzjZyW0SK8jHBAkaVdIczzqRJ17DMWZbWJj23vxyTyF3acK3iWA2Y6togpqmC/BqXcDC64B6cM/TIf3hq0VHYi4LCTwkiFZJwjqmbY6sFqywRGlp56AO+7G9pYujh6CcekS5+mG0zN7a6YSy9CsUZCHqq7BKhrohs+SsjKWPvibrdrNDQPjGnuHFb7mPgZjLjH7MPjL59J3tc9e4S0V/etXACXOvkQaYCRaGa91lqgwfLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lvaU9TMCsOg06/AzylDquTYtG2Hb6f5sxsiUKuBW+vfe4zDHftxukco3Go0k?=
 =?us-ascii?Q?ifbavSAjg4YDuWKxwVnpkGsnCa1YMjqKQHTQ3D6gEZnXUK/6bBJsAq5dBChs?=
 =?us-ascii?Q?hNP1mM0e6aUQ34eScH+MOGZM1ROHUF0pNC0Ooa+zRx11bvKITxaO3BlhPYjH?=
 =?us-ascii?Q?47ZLk0bohGUqrPBtg/S2RgKO5eXoOBUHynElWygY7RQmrNdah6xb0KsQMSZX?=
 =?us-ascii?Q?XKjNvAFPT23JUU2frHm/+lVZqgPcrGHkfOCRpxORhLiDpf75mHmHtqUn5yls?=
 =?us-ascii?Q?eRCS5+gt6rZuWUkuEnMdNdG9rxpshuL6X+dguaVGVjtcmm2WMTz9dnHNfwyN?=
 =?us-ascii?Q?GkhnyWek6o5d1nC+WGkJTD3wOgUgoWr722kqR3h1mnNGMQuzhzdemb2FYl5y?=
 =?us-ascii?Q?7TrcIMEDS5iHh3W2Sdu+n7V32FRzjo80nugifM6vkKHFepyWVWaxWDMMzqqi?=
 =?us-ascii?Q?ZJIpFImNKudVmg7b9DI80B4e4WHG4bItbg5RbR9NE/gEaidHCCnGj/hDTv/m?=
 =?us-ascii?Q?MYm4PdANzO+HOqHbZIwwLY2QG4KcVkNubo0x8grz9EZx918VojlgTHt97cW+?=
 =?us-ascii?Q?pLo3l1Q2b+ZFseQfgwra0FJxrRj2cmfNO5xSS6zuXZRIUIvlZdWGgQx495tJ?=
 =?us-ascii?Q?Ij3X8Qa7I3WU/o3x+bD+e9CnXs+KlFP4onxmGTq/pCi7cMDHLtlNQzQxAzEa?=
 =?us-ascii?Q?a1N59QTqDE0ZkFA3bObbN2+jHKoDowlx1de70RqK4pTgkhnd55aWyb9mO7GY?=
 =?us-ascii?Q?KrsenMQ2ya3UeSM3DyznocznMoGlmUz0Gi9tqh9JHzAdHbORKrIouBuKz8lF?=
 =?us-ascii?Q?ih2afdLlsbzuTaeiiB6TK9Hw5PIM1PI3KYVZHaf0mQDa9ya+IIS/FNr4okep?=
 =?us-ascii?Q?5BAf4dVS3intFedSze5ur0rgNqlCVl1JOEt8gkTlU9tF+F9CuLIq4IIfuH13?=
 =?us-ascii?Q?9UA8/zmuDU2UxE/8CuYs5GoPqhx4i5qluRGmcQ7HvQfu+DQmJE0dbCtCywTN?=
 =?us-ascii?Q?6NlY9Xn9xs/Ojgej+iMSaMocIWa9VOu3otA1EKwJPmGzaOh8W61yhzzAtdJa?=
 =?us-ascii?Q?4Ke3Mb/uTlBb0snQlnvdUd+oh1gaPnHXJskiebVn9KF0MRWTZOZ86wk5x2hE?=
 =?us-ascii?Q?1HdadCYun+Sv0u+fO/9/eZZocy2HdZIxKTQ+No4OW9Q5Dtmw/YyYLEIL692M?=
 =?us-ascii?Q?dX1as391XypZOvYlZmTK7t0iV2JICcTcyAsyRyQ/boi+aQnu0NH4fxJnpc2F?=
 =?us-ascii?Q?QLd+/KjuH/vtBoH1BZtQgJUfChi9XU70q0YrkQqficPMCPR4sREDs3oWdgcn?=
 =?us-ascii?Q?cA2b0Kew03RL4bh316b/AGdmhwa/dnjnkfcPJ3DO6Mmanps5Z67N0O+H6Adt?=
 =?us-ascii?Q?XX4an5N41En6iw4u1P7kuraK6hNdqf9KIMEFkB2nx0fmqy4cXCYbBAHVW2kq?=
 =?us-ascii?Q?0+bu86i3TxdITskx4Fz6En4OlHhV95CHYr02+zqV8Uhbil/W7LT8K+4m0/IV?=
 =?us-ascii?Q?Ksu9jbySdZEY1vqotqRnH6wU401k2ExykdEyib5keTop7p2NMBYIQeIo8U6J?=
 =?us-ascii?Q?4Bl4jrifeKAfjQaAOwmO2y552YjuHeKYs8zsBwEMnF6a6igmfcQQarNq9NV+?=
 =?us-ascii?Q?sWhcyq6lzrwZklW3+nzJBrZbfMqseO8railyXaz3Uu92xfoGfPI0itTL9rKb?=
 =?us-ascii?Q?FlFlkADnUbBHeDKkyNkxaE3HyouxKHkhB1yzn1w4eoUWNs4WoPiAhEO4DSCI?=
 =?us-ascii?Q?w2IRGAXGH1WpnVtrjPyP2mn4XiwHC/2oWEukV89F95F14uJT9VPn?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597308b9-8d40-4919-041c-08def1c13e60
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:42:21.2588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZyPN2v6fkS8O+QzCdwUD/Ap0VXGj+qQXDx1daSI2k8KD8O6ZMj2SKOAwnE0wrL8CXzlvbtyxN2hCbGg0wiEQvwb47/JptGI3dn44bqn6d2dWFvSRqCI7T1WOzpmWl3w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/madera.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 55ea6950ca906..58255844b4df3 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -3332,6 +3332,16 @@ static int madera_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 madera_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 const struct snd_soc_dai_ops madera_dai_ops = {
 	.startup = &madera_startup,
 	.set_fmt = &madera_set_fmt,
@@ -3339,6 +3349,8 @@ const struct snd_soc_dai_ops madera_dai_ops = {
 	.hw_params = &madera_hw_params,
 	.set_sysclk = &madera_dai_set_sysclk,
 	.set_tristate = &madera_set_tristate,
+	.auto_selectable_formats = &madera_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 EXPORT_SYMBOL_GPL(madera_dai_ops);
 
-- 
2.53.0

