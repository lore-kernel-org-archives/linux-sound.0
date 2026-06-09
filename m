Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C71386C9
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964581; cv=fail; b=QDPCQAtg7xZLS8NuH+Mpk5tiMQf6OsfxczG9oS7j4j+GdQe7sj0UCWQ0+AvoQgSPVYuh4Y8Q01CDnmKCNl1hG/Y+7O+RNt05lj8SUJRJOrQ1D2Cn6YQ7HxLzkWjmVLgOXXL6bLbdpcFnKSHhKTL7BO5nDzt2+PmnToz73UG23d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964581; c=relaxed/simple;
	bh=9oiQhOWzTGu9EgDfvfvyURePKvpIpCDNVFheBeXvS/U=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sYPLHwXa65mgI5kh5hKnADRugto4dguXSytBCIjUU5GQtaY0qjR6E8hnX9SYYuoXXF6ODvnokLMk66a52IIzwEXDgU+zLaHDZRmUMe1SmcBMIGgamw9LMev1LBpuuxt6pZd1OwzweyA58drNxreHmr9ewb+eVtGUsh+F6s2j/3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nOQAJ1aH; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nOQAJ1aH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbsAU/UKOA/n0Ecw8dZs/NFdbo7MycBPKiRa9wCcOysdcdmmkt0Mkzuk03KoydOVgy73BpMbrF1XZbYwsZdWAYB7AigmyOkJWgrKnVwI4e9EJBLzY1eopuip6Bc0xTDeQ+Y8IpWuFvQgoMVLhDNZVQIi8CS62TKMeTVohluDniouNz3EqZDNX5hXaFPMh0OeEQW1NrA7k2gD2PedYMm86PR+fuzyJ7qGjQ8EDij2Z8z9pWNsuiF9WwRoFVnP1QnsdmgdBOsBN76TINqHm5XXLP4diZtOkgn2fLhbNfJ7gTpTxOluuXmQgZ1lF5dcJ8EjriVNIGFBiFVfE6nT17pwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko/aR1P9zjKJkoFNOMfiXBW3kmCuwjb3tEtCBvbg8BQ=;
 b=wyxSjQLFWs/3drWExJpV7SCfAAacH6jnsa3uOVO+m1m8qaYUni7qvmZDjP8toMUNUzd5d80nEOVEMRducLEsRLlgWW7OzQEKkiOXx9gEDH+ZUVM2Qzj+4DijoLAFYqmi5qfH+SGRkvU8bCpMi4iAvORgWuHnEmKsbZxTlxGEOQEZOuwjYgEKE7AZ6weCbZs2s+w5p6RKRzHK9f0JRk60IfKEvUspxOnYZw+uWGxka/eDPTxCiJYITSjdowAzjAHHz1JWE/P1eYalL+ayv6PbG1ESyJ3AkeMYMhdDL/h5NxD4AHYJQIA7y0+ZGbS66K9TDmhoZi7SP9nod0EpVKp6Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko/aR1P9zjKJkoFNOMfiXBW3kmCuwjb3tEtCBvbg8BQ=;
 b=nOQAJ1aH+eWxR0bZYI4NckytticVdSwW+cCH6yZRzs7Wmhajl0uCh35a/sMc0X13D5gSvgG+y10B4qs+YwBNJUc7qSdn+gHr1GY6bB216JBGw/htPxwk6zHD8hamZ829TJQMfKDHdJaEAc5CU/6XFFD5dbPJhhxbFvfVFbHfewE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB12760.jpnprd01.prod.outlook.com (2603:1096:405:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:22:58 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:22:58 +0000
Message-ID: <87se6w36la.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/9] ASoC: codecs: framer-codec: don't use array if single pattern
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
Date: Tue, 9 Jun 2026 00:22:57 +0000
X-ClientProxiedBy: TY6P286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::9) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB12760:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a3c74b-dfc9-4a28-4c1a-08dec5bd41eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	8F/e3J6WQoWJ5+pTObGSv9iXqQSgwOmep2nTZZ8e1aFLOZ+2uVAdEMslarZpqTzQbypBO0868DN9xyPZGMOhqBCvJn3Q5KRwFmGA9xWtcAi+E6j/1b+vbW+BgC0WrG/Cx/k3j744k06nPRqe30BPzFPd+XN8KpQD2wfjqsLiAQDpqnc8WdpfrRh45Uws09XfsqxWryHYW+yBgmUP0p2yjPB7pCGVU21n5Gmqc9Eu2qRxYc5uoOCPG2TpDHS/3apnAxjrggkh94mlOqOKbcWi8qBsejj32+bHaQfSEd+kacOAEPzj/pV8Bhdr/Bvq1dhaFEHgzp+mUmbarQv3BTdL3WZkIGunFZuxiNsPGu03ES8j2DlOcsAPU7WMXAVuSlcBks2oppOBOVhQDHcItHk+ZH04qOe6P5fOF3YE5cUrRyys0v9KHY/V9WsM9B0vYpVZaHh9Bzc1vOz3u8nJcYsC652yedJuB+pt7QXJJ/X4fUf4Up1T57V+dH3ZJh6o1KGJLAbjaDshf/dwynW/JBUKoLoFycDE37iKYHYQpUziQ4X0rADuJnTmNrXe7fLit6VUc+VViYJZi3Hv/T0WUKfHkv1n9wVKDOMfpH16Fk/CLTPUsOVZkD39eoyldYfNY2hvN6DtKPCmmW9sXo8bNUDl7xMCg26Be7V/c+CmaUJ3PBY8rt7gzXtZRfexnt0E7JDDQZaiZBXmNRumDG58AngVBv9NDQA3wiy0MYewS4KSQcZF2VsNaJxJvK4MWdT5y+h153hn+ZKuQEwrwPOIK8fKmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L71i+kMrEb4kTHAYxwH21BMC6ogr3Y6N7o54xNh6EzG1MO37I7ERuGdchIo4?=
 =?us-ascii?Q?lbfBTlJFTDDDjNAoeq99BJV2B7AqqhE9pOdxO/RHgYbNBWx7T1mSEFqVmH/4?=
 =?us-ascii?Q?XZuOF0dbYHNQMPSNHBfvy1U6hlH3yFgsCmjEa+3iocT38vUTwnl+RSsxTvd8?=
 =?us-ascii?Q?cUWBkyTXA3dNs9KaTxbS3zezwssNfzd/MmKVqHY4TCX/nc2fSDK+yDNufkeu?=
 =?us-ascii?Q?0dc5tPF6/O/6cqxXlaeUDSdNjR3hq9yWeytaYUX+U1e44bugLwvl86mxwQf3?=
 =?us-ascii?Q?rFLeHTwkLBlOYtgt3Dc8jsh9jX5aSfM7ryN+pBxRLvlpiLwISnUq/v5cZp1T?=
 =?us-ascii?Q?kp8S/3wehpOdsxjaYis/N4ml1w3fj4d9bFmJ4/sk4ryOdktvZCbISn+JcpPc?=
 =?us-ascii?Q?0CHoZ2cjP9uOcfIHUNUuzpFLn3BkfSUQ0u29t2F7ntmpnDVKo5I8pKDz2Uxy?=
 =?us-ascii?Q?aPiLILhyOE1mBzc5uMp6WSRwk/2v3Nk/Jeds9oyf/uJuTDqoxmfncr4TOKXN?=
 =?us-ascii?Q?NlDze+RTGGzUGbK5IpM1nFrD6oIMdr3Igf2ZON/2sbX04sz3Rq9kEb++BNTL?=
 =?us-ascii?Q?buJkP7P5kgeQlrmaWZu3RQsHt8VaHCF4Fjh1qHvhna/e4bClJAxx3hKuSgvu?=
 =?us-ascii?Q?iySwXdPsgbqcMhtt4v2EtTKvMoi+66IsZ2LYRHDCxcpz9HgC0sY1yahBvmBP?=
 =?us-ascii?Q?P0V/g8KD+xA6sci+kodGRk2ifnC7COKeQwM6DE70Eaedft3URuuN109Ar1wr?=
 =?us-ascii?Q?JNjN8BOa/5OtP8GOjNr6lPtQn/rFcwI7rwI+rW1ZdopP1HFCQEgf90QJYtT4?=
 =?us-ascii?Q?LAAjCGACorIMJjgdD9ntDwboi8NbjK9NZZCqJ4HUJtPj/ezgm3LqWgdl2rNW?=
 =?us-ascii?Q?MYXAshQ2Wo6ImBeC0FeCRW6w44wpowompLKikb6WoHMv/JoAlRiu+0WTlNrm?=
 =?us-ascii?Q?+eUdDnkPHYJ3zOvOVXVrLhHi0qn6mVnPH/9hsNx3YdFAG+yO7bIMVxbVRHLj?=
 =?us-ascii?Q?hNt3ekQ/0yu/Q6uEKZZBSteCQaqqKeYkCqARF77970dK6YqnF7QHWaTeLNYW?=
 =?us-ascii?Q?DIGBtlYivHoPFbX0wHQxOVucnp7v85Bk4wY+OEdOXC4XqOBSxrcx4iRiKqD9?=
 =?us-ascii?Q?Qo6dHVWRdzMRW8j0lQtOpfE8hogiXKmddAbOmKRD4xgXDJsnvx3jTY1XkV0A?=
 =?us-ascii?Q?6zOlIezLm8ZcjRFTrDiLCvR+NwLC3pmE3Dq0ETvBIo4KAaiAqBnmoFkANMfK?=
 =?us-ascii?Q?3vVYmrZ5b058g16TuQEtd3RDw3J3AUkDtBDrtCRHJbh68lgBVrN7+jyqdqCK?=
 =?us-ascii?Q?ejGy/Ko7u+5Lu3ToEL+Baf2nGDGl5nS+JGwluVYs3gcGQGn5AU/lIUfFhEz4?=
 =?us-ascii?Q?UugrWTKhmVfTGAOz8BEMN1P/ANoGZJ/QxHbfqi8OciNMtn/4Bf3CZM91qah0?=
 =?us-ascii?Q?pEKRud6NsdwIvpcYlAZBkx84N2/HDQxbUuz7FLobhHc2xW4drNEsqkV9wxiO?=
 =?us-ascii?Q?rPIUY66HFmLJAn83pbzp9WNEduBwA6vtJ9iDgSuP24RxKcr25wDByaLpDrW8?=
 =?us-ascii?Q?bb9UyludbhD4SbYzIxf5+r0izQMn9pdBRmcEzFJ5tAjlgLR9yN5p7XJsR61x?=
 =?us-ascii?Q?pucOZmkSwXJbDTvT8c4nk5IVO7uvVJWPAXlXpPJIGaIS2nUYYSdA4xjfDhj0?=
 =?us-ascii?Q?yGvjE4p47xj8/KXxIQg+fDQ+fMhZZRicF2pyWBe7ceWJ2KQ7/V+BlGbLbRqT?=
 =?us-ascii?Q?pK1L1uLxNbnkDo8zKgHxeXCbWiiQjdXXrAUmD5zTKOGwfOvzEfIL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a3c74b-dfc9-4a28-4c1a-08dec5bd41eb
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:22:58.0414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eIz1L/DaUfA+MHPUzek9QggL2gqFetvYx9dfbbt1tVfoi01dTJBKwWwfBugmZ/RwknJ+B3TQcJzKsRMpdlGM/f8tnThXiN6D+aLNvmq4wr4iDG2bLQs0oR1oaxe4ELi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12760

Because it is confusable during debugging ASoC FW update, tidyup
auto format style not to use array if single pattern case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/framer-codec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
index 6f57a3aeecc89..a87a78390172d 100644
--- a/sound/soc/codecs/framer-codec.c
+++ b/sound/soc/codecs/framer-codec.c
@@ -238,15 +238,13 @@ static int framer_dai_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const u64 framer_dai_formats[] = {
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-};
+static const u64 framer_dai_formats = SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 
 static const struct snd_soc_dai_ops framer_dai_ops = {
 	.startup	= framer_dai_startup,
 	.set_tdm_slot	= framer_dai_set_tdm_slot,
-	.auto_selectable_formats     = framer_dai_formats,
-	.num_auto_selectable_formats = ARRAY_SIZE(framer_dai_formats),
+	.auto_selectable_formats     = &framer_dai_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver framer_dai_driver = {
-- 
2.53.0

