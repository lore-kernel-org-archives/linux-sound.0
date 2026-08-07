Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983DF1CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064015; cv=fail; b=h2/bGIUHcoWb4IilNZSSFC/EYiIjIqNZy3vMW9B7gPT8cSSnIB76Xovu/7jGl+WCAvzNbdwDvd9He1pcsgjnECcsOT3A2lk4+SmG5kHFA0f2Vu6afsPI+iZMWqkn4oc0qL/Vq0Ps82TdNRXNiVyI4b6kp8lG/c/xPsHl3YMr0Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064015; c=relaxed/simple;
	bh=rBflxS9kV+1PTBdhx0sPi+2GnJuCFXf3hA8FnYzd6bk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GYxezmdxvet6ZF3XQNPAAT53uGVA3pJVnJp3oVN75PCS3iSkzo+vGdI+UaJK/zv9ApAOtFgsnla4H/ljEQ73VFZyVnhD3k6JA9uQAQw3MU3/4NcHPA8Cs4TX2jouSgebQ7EQBKGR825nswWJD8P/1wScmuoH9pmyysURErtRHHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CL5MXei/; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CL5MXei/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGexiUnmh0BBb2YOB6uZ+gCkgxKGAGjcGbqfO69AQbTzMPflgEU8PLskXEOkpKh4ZaXoXcEBciy92Anr4WyV0z8BV1saBa2NgObKqz9gdtgYVIaRcB6DJrxJd561LOwy/BEYe/jK7N7JLNsyNnG6BJUBML1m5y+uqWgAV5xBnsm44qjWHzHmGn6t+PFc3a9ok5KZXJioG24u9yeOROXm+YKQAvFASONUf0sRrl3h2XT+JUAvNUme0d3TUUh5wt1ZfvKmMZSn+xgMbBf0b2VJrdW5nSdifjb9tEOcTx9QklPRMo/E7bEcfM8MRCq8yNdGyyDK91VpCUmhzNUEGzIwgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7Ts44zNdc9hzWUoe9aiNRFCL0M3SnOyj2jyAWiXiUk=;
 b=ay48Jeizv7YUwOjI6yuJGWqoYOf0iORI6g1K+7Qdeweff1dWcpPlIWmLr4Yh9yeM6usf3jS8yGzukyN/4d6p9odZMco+652TMCSmBBBd6rMMYmGhPMQ3sbYSapJ+nKIGxkdJvtVuym+4d/wHujHh9Kaa3vpaXZTyORkVWgJ9XSqcHwDBlfMc3OWJcpU9/rMtexZuWCNag9on9fiP+VyR55AME4NwpLRBKPbmbXfm3c5CIKgvxBLQehRVrgoXmNKxE3XVX2jElpmuotChbtl9ZFT6tilBDDU5I/0vdQBrTIwPAoHXBQR1Aw0ZmfBGVCmi1Cj6hJJnSxU3Ko4gp9/ubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7Ts44zNdc9hzWUoe9aiNRFCL0M3SnOyj2jyAWiXiUk=;
 b=CL5MXei/Xx07CnNkXEF9i82ix8kjD2EytZxZLnfiLgMY22yj84DivAinPJeoh/XmY+c99u1D2ugk1h5vPWH21WLgqD+vwpeRAv+dthnArSfpIDGbWCdawFwCTZbs9IUJNqZV9Rf2wnF7aLHFYXe7YYx0Sh5t8jVivZ9FnSqxtTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:53:32 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:53:32 +0000
Message-ID: <87wlu2u4xg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 07/44] ASoC: codecs: ak5*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:53:31 +0000
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: e72fcfba-3423-44ce-e5b7-08def41e4d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	2zLIK/+hFB39dlkMZ5Zk1Fk1SaRZuazTlheO/7bZHihVaT5I91wYbivlOZcA4etLlBwEMFiFkeZsKh5ftpxsOca39zKbwrURpZP7/+QvpKMplqUX7qsPdh2kjzwnqv7KeJczy/+CBg5teGhorOVIh2voaf5/QvT5Ei9GBd6GkQKiTBAyGlgmm69Q05rZcfaDPm1wdxqedJ9qAnLhxpQpcZpZhRE7KG68TeHx4x0FpU9Fo0vns7Dh0HnZerG1dFNRCSMPzQOr+zyTGxPSS3Or7Z1hK9r/8FJgxeW2JufaS8S4ZGa71I19TDq5lNUr0kbRjE98ELyBeCUM5+nN5C1UNagIOcYIQJY0BwHSz81YkyhEZ6ju0pu/cDX1f2jn4hHHayH1SqPQT/6z38229qcitSUO4rtDAnQCh1IDNV7zoMyVM+2PiB6D5SH3q/cb/ckFzx6Al6OtObSDUlUL5OqpDxNZ7TjwJVGg+Lilg2148/HGByTkVEbmzJY+Atp2PU8yAnRdP7mcph5k3I9lhcDR/udzIvEGJKIe6dIQye35/eh2rD+M0TrP7LQjODOS7ba9Ge5fGOoelm3+wfiVVVlKklfwcCxVxJAYMd1sGeFHZPAO1j/c3/ntcSO6SqvXVdhc6YV2/kY3KkRIe/sLD0k0G9S2rQ5iWPTliQ4tr4Tpojd26dd80SXRz1Ve04bzbtmQeTWcq9SEMkmjlZz0y/sSjPmAsk+lwHqy3V+43XxrG/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X25Qvz2L6E+KXMf6yvFkMR+l6qkY/uAWS9wgbwj9lPXmbAcgcoj6+m0U6LhV?=
 =?us-ascii?Q?mS6+7kvtzPAle3nukQ9rD8vIJFrZBtGC9k711AFQ6is4YzpRcu363pcY/KoK?=
 =?us-ascii?Q?aY/ymWpO2L002/dbY5945BZn3thLtGKsWzQFkEUbmTWA4qUdFnUMe1fa1x9D?=
 =?us-ascii?Q?sExxawuyImZEfWn4TFGSLJPSUy28Ds/bn2cDNMBJUVJN3UR9VvdKdeISmfsv?=
 =?us-ascii?Q?48n8Y3pPMR0ox+VK6vbg1qOaAkp2dqirKHg8XvC1wA5edUdNF/9ksfuWe/07?=
 =?us-ascii?Q?EP0YL9gC2VJyCAhbVBFpV2Jdn4XqBVw8hxsdMh0vMPLHo9EFDZsjbi8QIPzf?=
 =?us-ascii?Q?D8JXeBV39DsJ/2QKUzs7/rApl1Ofnma4HxKUX4X2P1ipC81TWg0Sr5HVZStY?=
 =?us-ascii?Q?Wl+PPbZKaC4ySQFyE3pNm7FvLh9moZ4SuYpe3hxnPmjHDbFNgyhor69gzfVy?=
 =?us-ascii?Q?0SSVK4YRQWC91bfK/N7eLSZ4xoGsDc97ix7yaPS16u64gkz3H6scfgHqCy8o?=
 =?us-ascii?Q?SK6ub6MRo9Y2hvsPwPMdQcllYupeQRxVzOLvMnx5/rEd3qOYaBvCi91DvPFe?=
 =?us-ascii?Q?xVGOa4dY7Wc3UO943KVrzo4i4AZpV5dXY8XWOtY6ox+GDi8L0rZrHa1a+DV4?=
 =?us-ascii?Q?G3iN3/akrtNMuTx5ItUH/+B7ANwk40u6iZPj0m2cVCjq7jD/Lzuz9G/XM8ll?=
 =?us-ascii?Q?9VS8B7Uox/AINNJF6EZtWj0G6QHnj8iFsdJivgms+YQ8jfbpeMLgu4IlcEUn?=
 =?us-ascii?Q?2OEkC2Czdf+ROglXqf/GPtzdBq4tZfAaYBhvdfGJZKYf7ZYB0uwfvjXwp7D2?=
 =?us-ascii?Q?3IG7pbSZYG00CoqmF5Yq//4xAYdqNZNC6900e7d2egjWtvWOLYppcQWl30PM?=
 =?us-ascii?Q?PV0gql9gtvnBeuqB6Q/sWUY3LGjT2e3eJaHoo9Cal6OGQQlcssSM/POQCuN3?=
 =?us-ascii?Q?7bOLHslElV3KNxCmmH2jJuwQT619O0an9qSbdxfJnFWlwpAJAzBKB7GPczbi?=
 =?us-ascii?Q?GK7b1Ta6qXc2ePPGK6TMFULUPPbCB0403D/6UlD24ZDvF/fthTpFpWJ/IZGU?=
 =?us-ascii?Q?h57fZ8r4uzdL1uh0Z7A+hSQdmD+r63VsRrG38Rs+lumPD3IUm2crJ5Ncn5pb?=
 =?us-ascii?Q?t5ARVYzQv20ZXy4pSY9s5pSje9PTnCEpziuX59Mh3f76Zi6UiawkWpQS7aU9?=
 =?us-ascii?Q?7MdavPrnXh3rIXDut4wn6JaobVesTf6iWFYi/6gW9m0RywdiNkWBqco174Yn?=
 =?us-ascii?Q?+Z9X9IwfX7fkj6orZF1gRTQwaixV977cZMbjrUach3dQbAL2N/yc3mqKM2by?=
 =?us-ascii?Q?PKxdmhb4/BSOPiLHKSTYL/eVVa8b9srqzfD8oEjqcm/2OX36temjsfXeSt/R?=
 =?us-ascii?Q?EK6S4IvANzcUMJ0oSGF0YQqQoguyDaG84c8tQXmrq4A/4LlJ1GUkilcSHGuw?=
 =?us-ascii?Q?uvQ+lQxbbzQtfjCEqhhb7Gugg8kiCKsmXjGQIEv3WygrO8v4/0L7GtR/24JZ?=
 =?us-ascii?Q?0Ux0voiNrEBERhGYyA4gC15gWeVwE/Jhfk3O3BHv8m4bIJarECGRMIGSG8Va?=
 =?us-ascii?Q?rFZo01NDRayVUqve/dM8cRnpxI3gXleuXKU7dbxqWpaddmQCeCuC8j+GoUHB?=
 =?us-ascii?Q?ICWaLlaH1V6Mnzep5fd0wpnALdWWVWmal2SAjYcLV8GCLH5bylqPOwrNZxAu?=
 =?us-ascii?Q?Z6UM+pRRH8HKMM5eIlMv9b5qdQcbBfwjc8omD59VJA55kC7Z7jcqoXLPi5Qe?=
 =?us-ascii?Q?h5kOn474Hsb6csrM5oL/taq4LH4VW24TZAji4H4I8PCl15XdVFjZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72fcfba-3423-44ce-e5b7-08def41e4d82
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:53:32.1231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kn+RtzbVAB+NcYOPzYLBvUWg1pv6WtqjxyqiIbnMvBUSpCjXiQhoDx3JeJsXzrASwiSLtD3b53Wv39Pq2vrvDF+6sWM3A6uxCz9mg/qGz/3d/5wriRQMmQ5mmoKNIap9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

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

