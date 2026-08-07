Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19801CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064006; cv=fail; b=sqyhCPx+KkeiD+6HSuE1amL5Mm3xzhH4ZRbyPwc87OU58Kol8p42oA9ZsBk0DZOrO76p8LOd23v/hlLi9vL+6nV8oAIsHDeTIL6ND7xPJln3LM+Qk1ncbqiMviT+549/JhyPL4SWmwyhS8FJQQ3sRayLn1HJXCBJHM94tlgh7nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064006; c=relaxed/simple;
	bh=H8uOkRztOK/yHmyrN+tLXP/lgVNG4LaomG0l+qhfu9M=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AgJGJPOg2fH5twpcdo1QIk88hm8oiJu/048JxStMSnTtC5mP/TlLM+wfwKA0GPdinXWS6oOJ5XdwLEHX74PF/fY9NtGP/cFhrwwG04yX82Zzx+/4d/UkMAA42LRc3Ft2ucmHyNgkxdxVuO2MIEzqFpw+tBh9QWFWlrc2sQeiU5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YshoFq39; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YshoFq39"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCUIiZFZ5X2gGqaSsuzQZZudh4nlR6tzITsBPsV84qu0avcAF8a5jnNeYobGQett8JYdnLukg/RWXmpNxZ5Vi4diQBrdlyq82+srzKmbTSLmaSefig/tVfsCgpybcGSNIjTebGD2IrAIvJc/rEc8uZK3ph3x8+3HD43PRUg7AdQEEFSBpYeuz+6D0NXxonjGC2/ykncstVqWgNeoR1k4zxVxwATnM8RwlAUROW9MYXuTbo+uE/13+LTD8GhaiH8e2ttWQHcjSEOJQQRq2ECv6k3Xa4Zquc8VvbpkjCEY8aWsYUwBWnMpZkCdVa1BYIf1HMNG/FPH6E1+WSOsG0Hxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhwa3r9+Nww5ElIYHoWcLWGbmXC4sLf5lvB3sbXexac=;
 b=VywmNNg9qGbL/kupce9FRY6duPK3IxMRPOgLVFaQIdzyq3H9hbOuP15Kx+LT6kzWY2DWRcymiSKDIrwiab9Udq4d7xKDO4pacBZY9GAya706aCPCrk8OleUpo+UBk2KSfv8o5ZzpJz6UCyPPJzgm1DrW6W9LvSyo64NhrrFxzujteiqJXYXzuOfxZq6frgaTHPxNAwDBiG3y62djh6Rj5yf/OiJPZoqGGtw+eofR0Qa8SsDBQIfM42WbWbu315mx6TWlwXg0oo+vFdGh8OaWEkyAKyvjWkQzlRndRuHTeCaCiUKc9S96lg0YEbv9uIlIzGZpYA5AwGIHeSPA711tAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhwa3r9+Nww5ElIYHoWcLWGbmXC4sLf5lvB3sbXexac=;
 b=YshoFq39QGBeyj9vbVo2Svf4Sakf3RDnv3rQc/3XxhCHwUObTdCA969k7EoMy12NDEgFpt+cPsuucxb+JlPy374r487CcpYah+tQzx1reryqQ7QTE7wLsJAs1sc19dJ4bcROjC2wGrMDfRC2TEstBJQZbpqKs/UtCzxF2ABxe8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:53:22 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:53:21 +0000
Message-ID: <87zeyyu4xr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-1?Q?=22Nuno_S=C3=A1=22?= <nuno.sa@analog.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 05/44] ASoC: codecs: adav80x: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Fri, 7 Aug 2026 00:53:20 +0000
X-ClientProxiedBy: TYCP286CA0125.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: 0483caf6-6f33-45af-6cf9-08def41e46e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m7erlr8EhGITzWTDwMmXgEEED4aGEjjoLD+qrQmLmiAkpT/vy2i1uSh/t96ZF7DcS0f2xGTNtwmDVk9jZT87aaoXHD7AxWuxAYh65Hn3D20cMl7j6gWbCLPmL+whbheFiN5Q/84R7QAd5BHAzGfZ5WAV6cPhNKX6D1feQDHqnRu2akfLMQgNsQhQ4BzmxIROsWOyYh52y8gKYNvgqCliNk+l0M9FACHSW5Pb1yLIkrD8CNLIwaiSV6PIWqPCB0Rl62X/IekegssvSPA3MI/3bUTIagB+kNChD0rIiNCRQIXFtsZ9qBAQ6pkhZzbYltHgc11SOXwXih6p3hPKcmyO2hl1rH74s3UH6bPGVCs9qHrTJ9TQ4YPgEmVscO6E/QC8K8RzKRFTdDx0tIpj2dn7MLCYVjCi6LPYlY4J7oab+5bFZdjerWbxdhT53Lcl8SywAodIqkR+WayV5NoFa3CrDH3dTqZ0rE7xc1safRBYsC/z9vetQyFMwxpAW6jywDgNkxzsr4WlLl320qCDN+ozPFkv7qexhj6mjePubG0l6aWKEPV2NDKUkhxE1rt6tCNNUkK9p1ul3tePTQMvFWGAVQpLfbx5MjrYRyVj/+Jm6gNgcvZQqE+v7ZmiKlhaY2JDw1/y6kMP6lV3oCYqSc/OP1TUzHlQzqj2JNl6O8OTo8KVDd1dKzx/IjtFflLH/g+Z4BaNMhJJaoE9j6oE7borDcK71h/ELz/ipaF4CP3Q4Ds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?X+yJPKya/9XZsU9wrXSdf1GKGqLbJzfe8mXmOPwSICHf2vfrxQt0Vq76rE?=
 =?iso-8859-1?Q?iN1sSc+O3zBWOFwhfd8Jh0kPJhVU5jgZxyWkZnVDInf5VIgHCWawOSTZ8j?=
 =?iso-8859-1?Q?EOQQUgIJu1oWspc3kutPG9bQrQQvXI4MOW4Ggg250KtvGwIwdXt5UZSZbZ?=
 =?iso-8859-1?Q?AdJo7TOcMDFHu8eoDb/2i1L41GRgJg+m2KNJbF8/gU5YdlFI96cORPKZpT?=
 =?iso-8859-1?Q?KdS7MjNvsxz3b+UUywAnofbl1Mr+VMVko0gchZHTEOrERnYvToz8tHojMN?=
 =?iso-8859-1?Q?3ZzfHQVtOR7ywkfyuO5ppnQ+NqZeLSXalvaQa8UNEdXNzv9UAn3Bjpu+s/?=
 =?iso-8859-1?Q?OJqb5G0nxhd8BUEFHAAWK8cwQ8vgu5FIcoVdTSMgOUk3iGrCc/nOGhxX7q?=
 =?iso-8859-1?Q?MSEwICRgU+a6FxlBlBJU6Cxiuf77Cg1T5g7dbUtXcgokJkcgf8JLNGsmCW?=
 =?iso-8859-1?Q?5WFrEFDqf5A/VFbQPxAMaA6cWHiV00e7eiWouJWKUayvUS5M/bLYBdSN+I?=
 =?iso-8859-1?Q?NhJiMHjaAPtmy3BqdcyzTCyx5V4PUjH+ZBbjl67fBqb09aUm1SpFG9e4Lk?=
 =?iso-8859-1?Q?JtoJc0cA4Cw5x+QSI2sVrTjNdFqnLr2Z6TW1n584DDVoOHIR2n2OdbXW+b?=
 =?iso-8859-1?Q?QSpGTqk8x0uBHN5vUh5p3l/3QWFk/IqePMvw98jHcIJoQTuQf5a/LK0KY2?=
 =?iso-8859-1?Q?Nozc9XgbaZssHlTIpqb6ux+DiECLBYC+vp7TA1lrxet8W3KGr9ETIW/jTO?=
 =?iso-8859-1?Q?dOL8gN4+2CVWS88FSt8HpmOlC36F+Zttv6J5Sh6G7TFxmiabE+DIA4aCWa?=
 =?iso-8859-1?Q?ptn6J7C8WwtBOYEN9otMsHOyOjeN08XtwI5/IAourMUBvf9Liuzx3zGSkg?=
 =?iso-8859-1?Q?30Wt9I+oCFvYl+3boYs9sz1Q6KObKx7GivTIIs/8TVEaatFs0fxrp+9JlE?=
 =?iso-8859-1?Q?V750INi9XdZ6vmmG2TCgZxH8DFLBAKUzDDXeEtWGdt24skO3uc7wWrsM79?=
 =?iso-8859-1?Q?9Pu7WXG+xB3sxt+Mm9M8qKtxmhjEO2d1CeJWeAVnavME5VFi2P4yiXR6yi?=
 =?iso-8859-1?Q?NZXVS6rcLvTeu+s9ZyfvhnOeIpuH0+1ggwKRFGzBEjxQ8qll4C2nq1EKfC?=
 =?iso-8859-1?Q?ms+9N6GzjGjKdUKqoYBtFMvuoCtfLWDfm/YqD/96tAkoI7Hm3lFvps4gAu?=
 =?iso-8859-1?Q?lnJ7QGdxRVXrfCWlDogG8m5X34WpzlUQG8Y3c4q2ge4BtiG1em4tVaF4mi?=
 =?iso-8859-1?Q?TkpYWJziAqMXAGx+dTd8SxrtFexZmvEoNUjGBKj8ob33uD2GpFDHPeG5r8?=
 =?iso-8859-1?Q?h7eWOgZmFs5qqIEAM2BRw74qziWt2+lPzY//paOEoc4gZ1fyOdvG7Zw6J8?=
 =?iso-8859-1?Q?P5v50ldQ7ym4t8PQ3A+g43sPYgywAWveIrCMeyhsJT3s9YlUmoeMA5MiJI?=
 =?iso-8859-1?Q?w+21Ew4+McM357CzJDvhsY5hIW16faXo6tkxlyynScLNU4jpaNgl/T+EGt?=
 =?iso-8859-1?Q?qo++1KCgpXxgI0LU8mdXc5fkOg3pp2pPPtIb+uPNslTEf/bSy9lPPkvIyI?=
 =?iso-8859-1?Q?UHYqJmHLffVHyYfq0qjAAYwL77OkDB1HyRiSzNtWg765sboAO7vcPqCRi4?=
 =?iso-8859-1?Q?g+jXF8Q0dhawEBVodY8cCHyMy/d9DZFz6nHZNEGl8XVd8Et+V9jFTc431v?=
 =?iso-8859-1?Q?pTC5qfZ++F3rHcJAiadZ2T0XJUxnMau9moLxpfluGPql+AaDHmtzGxxdbB?=
 =?iso-8859-1?Q?SVGv8LUy3MQglrYjv8qRsjDqv9uZrjgP+45mIl5fL/pyf55T8hntuHJeqr?=
 =?iso-8859-1?Q?W/0lflmtQjkmV9D8TPtgOcqIb26CEgk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0483caf6-6f33-45af-6cf9-08def41e46e6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:53:21.1209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jX4bRZvYRAxx5dO8ZihuhR+6dy31znpEZod7JVuqqxtsqFmZ13/aQXfiNpHC9cpcgEXc6eVnFVVtbLgdE5Uv8UiY6hw+qwX0lC1CG0imIhJbz6S8GukIMlRpr9EKEELD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

We can use .auto_selectable_formats. Let's adds it.

Acked-by: Nuno S=E1 <nuno.sa@analog.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/adav80x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index 8a89187f9c782..e97c72ac9b2b2 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -743,11 +743,19 @@ static void adav80x_dai_shutdown(struct snd_pcm_subst=
ream *substream,
 		adav80x->rate =3D 0;
 }
=20
+static const u64 adav80x_selectable_formats =3D
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops adav80x_dai_ops =3D {
 	.set_fmt =3D adav80x_set_dai_fmt,
 	.hw_params =3D adav80x_hw_params,
 	.startup =3D adav80x_dai_startup,
 	.shutdown =3D adav80x_dai_shutdown,
+	.auto_selectable_formats =3D &adav80x_selectable_formats,
+	.num_auto_selectable_formats =3D 1,
 };
=20
 #define ADAV80X_PLAYBACK_RATES (SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_4410=
0 | \
--=20
2.53.0

