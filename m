Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409E13A7F49
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 01:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695721; cv=fail; b=n+m52BbJe4a5+ngDiMELpLVUZcYT6KNc9EtR9MF2A42KmRdncG+6p0eG2i7dPCZgJi9T0HAhpOUzStw2YjFW4g/FEFKx8M2rxilYnm22arfDs6X9xHARjM6qN41aKsAVfrMykjzN6QPEiTAsR8GA4X6j0FG7vRyxFcykeY5ZD9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695721; c=relaxed/simple;
	bh=L0MYwaz33xZnB15V3ULCYX2b11aOR5woAwm4xHti6cU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cxFcpRaPeV0leg+6FNmO1tOsuMthWTDRuy04qX8QqgiUmgn+7qdvE8t1wsaktU//HcfyD9TmsNCeLJdHdcDw7XyFOyZ5MBFBCdiB5tjpXsep8vEjyOSKO5wybSN5wua4O2Qd159Q1E8Dvu/jRkUoGtFPYLbUDRynbmWNFW0J7vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n8ci1rLt; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n8ci1rLt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCIucAQ+YZjb+OA1KX01npboUqNG1/g7KRG31GvGlhHWZyUDhq1rCi7jWDHCmkBciteUeFRsGS25H40ZH0E6fKYD+6kyxu5hTn3T/4rjTnFOjdSGDuc0rx8TRmkKBrbA+qhHrzh/Lr23P7Mttx2KUGyRUc8lnXm5VsZHnKfSlUtedtq+ebQOI/Ai9NZ+2ltUU9blK5ZxyhZkz4A8ocRaFBJBUtQfy5dsc0X5LyBGtGy7cZKzqhWxslbwx2b9Lg58uDssOxqfUF/AnKMCDoojkiquCcSOMYLNUFDO1ZJu5V1fmS5y52yBvxzPW5PLusn1ASNVxy+WiR9y7DGrgppofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHWdztzHdANxGa0iW9vTlvH0D763QqT5+uhIMVz9ImA=;
 b=Q8jOHcWDvKGP4N5SSRc1tz30IyBxYyZwqS86skjw5LkqOXI/5cZ7AFXYtqWEBd+UZ37BAjsW8q07qdbZJq2mJPzkw8AJ4pt0AcCDwvJ6GhsB4YQtDgUvhJFzHwBMi9qxMWtK1IWbxhkSvBI4TQfD27bU3sL98cZ7BfZgCs+qEB3SR5Y5EhBHPl377mrG8HkO74CflUQqLLuIiBt1j+iLs0D2IRI6qDeRtzDq7UQE02GZsFulBnQnymVp1DZvIS1DTU42ZMF6tBE+Z4nUUJ0GVBK9Jr/QvBLaxO3aMMr8fY4GAbDkExRGbEN2snRvtly2ljs0m1nwCoPDbG5IQUPLsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHWdztzHdANxGa0iW9vTlvH0D763QqT5+uhIMVz9ImA=;
 b=n8ci1rLt2OJONeLx7hUp7iUdxzdhJpeDT4jE33m9F99kVkUsh+ztQfIVK5sSZMeoSHfA4+kIWsoQNTWDWPw7fUnBFH8Uh2taDTdDT+u9vp4ihqj/1fR8/KrNGiPMBxBkG5CXwGX0MYebav33qt8EIcTYOwABpxoJNbi5lD92S00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB18388.jpnprd01.prod.outlook.com
 (2603:1096:405:3ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:41:53 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 01:41:53 +0000
Message-ID: <87mrtfjpy6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/9] ASoC: soc-dai: add snd_soc_dai_id()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin Sipraga <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 01:41:53 +0000
X-ClientProxiedBy: TYCP286CA0202.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::10) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB18388:EE_
X-MS-Office365-Filtering-Correlation-Id: effed1c4-75c9-4391-983e-08df15260450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|10067099003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Pg4Eh0ZncXFaGRgG5QahZCKTWe1bZjGQXsFU2N7YbVglGldDSsXb8e66iTXgx3ojNGQKFb9zlmRHYReYF+MTjy8aY6xkVY4vhIdBHZnHn7JXdQNbtoBs52za7ClPqzGMAUZ4TLKGrVsKZ6YGveMO7AkuNY3CQsj+K6jpKoXUcmlpEB3Z7RGL0GTi9bI78Hc3yg2GwdX+bmULD7juf5Ijaxv6/RkcWJn1XVNCNY0escDhKgF4434taSd5oTEECWeZbDuCYoeetAmXMqsOturn64yKy0pSNLecnPpqDPfrCrkKSCPg4oTm1/xrkvRk1onyKAPqSQQZm2GQ8bYPXTHZQoKDxQYco7JCUfqon7WH/j0DxJJnHYooJv/ctVonQEKDQrNJ9RYvXuYuKULL4bVc1sysTI3XB5OqwBlki02cM8/4lLRLncAiMz375CWqMlgt0JZM+PfwlD4zzw+9SIjtkUJC59qwTz5Cj/DDwQ/j5tvRVFFC+mCehAA8nb4KYIl4Uh89NQruF7ccz9AOXHVD3rtoSIYriCkgPbtmNIp0rWO5DVfLKiSSlVLiv1TgQrKSj/+tUuRWCWVK0p9m4URyoDj6fwVOf3+eeZksNv2xh2Qqef+JE5FBmMlwHYheHCynKkpRXr0n4RcbLxTbCuyLsrsM8jX9CuNdvhzI0sc4wKB/jMTRgXKyMjs3Dd3oOYjtaOdQe3zRBZiNDpbPBuN5gDCt7nSupCNdaBlLJZ9ZXIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?OH0NCf0UuE+oj8uEmUJ3/Yufrau1tCjtKm9R82PTIWoQfjwdyMJVHh9m1R?=
 =?iso-8859-2?Q?louRAWFu1tH8fBTi4eNpV30XZwFyBoPok7A9Az3FZnxanFLKmzq9pynQj6?=
 =?iso-8859-2?Q?YWJLOfcwhtDffk/sFdHqmxmm9c5a/g+X5368APt6/E9d/g9Pm6haY7b6HG?=
 =?iso-8859-2?Q?C+w1cy4WbjeeZwj2FrirCDRL0cemuij6+5EerVcOpifpx0jkm+H+xM6aI3?=
 =?iso-8859-2?Q?CRe+bBC7tEo99M4mL/UQGDuiEHTi7Cu5MIXRuaxYtfP6aGchUThqwNo1rM?=
 =?iso-8859-2?Q?xRJl3UIpYE+Metje+UnsshFQG12Z1gE0W4GrfyKJbI0+7AYMJzVjjJAhzU?=
 =?iso-8859-2?Q?c9PKryu8L69Gt0hD3M3NzlXuIVROOvVnnP2L17QvKX2MCCFNTmpjCx/+v0?=
 =?iso-8859-2?Q?ztijGIK6sijLMWzb9b0/OMugWfEJtLq7b/LLGKBguRBnLufOF3PX2R/RJ1?=
 =?iso-8859-2?Q?xewt8PPesFvPykrQcb+XvYLyK4DxX7Zu1j/riVRN5fw7ZLjliqwZw6yIy/?=
 =?iso-8859-2?Q?CObFcSjFcI17B7k1g8JkCiaWW5GZb2QcRbytoQo01Flu5ZOYooB+EBLwmW?=
 =?iso-8859-2?Q?7TjEInFuPLeRG2tN36CP6cffI3GTgdM6chD1/GOpcQiBNt545O/7TkOiQw?=
 =?iso-8859-2?Q?7DQIlaX9Jb1bUah6CrZxR4iLEg8N+xz6a5bJwtUvGuL1X+mn4JjpCBbqjt?=
 =?iso-8859-2?Q?ydkBzPuJkFv7spds0up02dfMK74rW+3BgZIFg7Adf0WZLiYDCxTfNMyZd4?=
 =?iso-8859-2?Q?B4gTrufZ5NaF1H07ViA3ns+3FV9VZECnpmJchKnrx03XWm0vUEHhBxEawG?=
 =?iso-8859-2?Q?E6OQ4YDgB6Sd8+YHJnu6tmXhefPi53YbCPpzdI8S0jYwTB9+ZbhoWXAN5M?=
 =?iso-8859-2?Q?mBqm18ghX0KQSQoQaDbY82/pSNLc9Cem+gz0vv4XTUkFi579OGDW3i2HEV?=
 =?iso-8859-2?Q?Vh3AiqI4jdREkHZ1ngrNAEw+MuXBCAWypWz7suz6F34xQ5YB3GROGf0/vI?=
 =?iso-8859-2?Q?0cz1efpGyduWUW1ORkby8b0kcijyZEDv3hTuCq2Zjz58W9fdk9yxYlqnA0?=
 =?iso-8859-2?Q?nfu5G38tP7Zdm6vuHrlz5T0T6yyg4m13VRBNVj3UN9RoknIMYDO4fcHoMI?=
 =?iso-8859-2?Q?bJv8GsS+wPaLViMh9S77CpYJVzovo+m3bEAufT3/CzwAXl5EiP1jSDldWl?=
 =?iso-8859-2?Q?5xvkzztkz+AAmhVnN7pAQ4y31HgpXijtZ6lizu6ve1nkZmXSqEyOMKiq8z?=
 =?iso-8859-2?Q?QmXUTRSsuW0SusHZwrBqC4btmPecqFhToUKwc/NmAZZRzV4UdTjbujq4Dz?=
 =?iso-8859-2?Q?CQ01UmPbs3Lall1GF0+Q4p9V1A0fimQ3STIMbHNrteW6tl8HMshinar4Oy?=
 =?iso-8859-2?Q?bDP9KKf5EZJsShCeM40oAaTIEsk5iGSHxQ5ui5O7VPMfe5jsCXKg/YXrIe?=
 =?iso-8859-2?Q?is4UUDEWfHsdZJ7NnDHI09u0UwYqkXZipsTM7tBGV6CgtTVgOhfXp4cHKS?=
 =?iso-8859-2?Q?DQEb+zNAJ8q4GQ3EeUZzxbgNHt6lFp51WkN10Hg+PkuPtAWe1O1GDccMXQ?=
 =?iso-8859-2?Q?i+NgIgwJEZqHfbcgfeiQnrf91PK/A/n0082seUL1Fim1sS3gGrTUIFNqi1?=
 =?iso-8859-2?Q?S1rHlQ6y+mLS406kfyWpqDrLeWSFj/IX4ALXKRecO8tZh1w8E8zFgFKj/k?=
 =?iso-8859-2?Q?9GMjUloR+fnYL0XQS272DaFyZ5rQbIhcNxMkYd+qtymnayNFIeVmQ/u2Fw?=
 =?iso-8859-2?Q?ZPid3QbtAOGKJuTVrjP2IpjVseSCJuyYjHc9/v60aAtalSJy9Y4BDX7q6E?=
 =?iso-8859-2?Q?jBtlky0yex8vvxIkgGh1ZLjLX2q6DnkfIwsGIDlSPIds96memOhT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effed1c4-75c9-4391-983e-08df15260450
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:41:53.6628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GKIGUHo/giuUV5qzT9JZe1GKMdHR5kK1Ka6niNBUMuDTKhGJt2mwhdQZsvE3HWR+ThLgOxSBTeI/YSYksqHE8706MnbL6y3boKZf8AHIdR8O3okZtyTZmkSIdGpPHlU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18388

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. Add snd_soc_dai_id() to get ID from DAI.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-dai.h | 1 +
 sound/soc/soc-dai.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 7e64e049d71d5..02b52fed97c9e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -283,6 +283,7 @@ int snd_soc_dai_matches_args(const struct snd_soc_dai *=
dai,
 int snd_soc_dai_matches_dlc(struct snd_soc_dai *dai,
 			    const struct snd_soc_dai_link_component *dlc);
 const char *snd_soc_dai_name(const struct snd_soc_dai *dai);
+int snd_soc_dai_id(const struct snd_soc_dai *dai);
=20
 struct snd_soc_dai_ops {
 	/* DAI driver callbacks */
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 0cf70f0903dc8..71de29bfbbd0c 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1073,6 +1073,12 @@ const char *snd_soc_dai_name(const struct snd_soc_da=
i *dai)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_name);
=20
+int snd_soc_dai_id(const struct snd_soc_dai *dai)
+{
+	return dai->id;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_id);
+
 const struct snd_soc_pcm_stream *
 snd_soc_dai_pcm_stream_get_i(const struct snd_soc_dai *dai, int stream)
 {
--=20
2.53.0

