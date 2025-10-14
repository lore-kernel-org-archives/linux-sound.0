Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777C9308F3A
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415675; cv=fail; b=I1KwCr1FTCCa0duQJXy/2q49SMyYjrTdJvE99qcxw3x6MMGvZ3BM3++IGlAvt4ieKCWEiwJrjA5GnR5P651gmzzrZX6KKqtdG16+anxTT9QsxG18t5pS3aoYR6r3rnBiac3LZEXHJnb/wvA5cSlDfnHOZ/vP9JsWsAhcfu7h+8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415675; c=relaxed/simple;
	bh=AJaoY0byZq4m/UKYbIVaHziR6wNdtrNg7mG8ZwwIRFU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HU/dO8Ha8020xIQnvxTcmbrriRIp9UmlV8BZIR/aeFjYUPAzoCGACyEuH83jViT/RJhJyJvkQw1xWOBpjWjnoU7Oe+KSMy20uLe+6C5WwwAhcVD1pxS0XDmCSSAPkf3LgR4ip79O9lY72AnRrRg8Dk0MV8c823tndd2HQfxRXqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aDIHERRz; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aDIHERRz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLTIz30tSkYnOObFxE3irW6X9G7oU0h7Qw0MCq4I8sPuPO1iSzhiAk2tyX0QgoBzIiNzPICcfRqgbC8P4NevqAbDzDrSceJFtBuD1AFZmy6/uIGuM9477++yad21ZGD0cBB8lwAJ4skRI8imbs2mJlajaYtdbyCuPzb1g1ziWZHISwqG2LLTo+m6FpKl41hbPw92Lma9iAeNNR+7roOCdMR93qUYy/OpjA0mPNDxV6wpDIrOlcuNzwzQG68XHZI3E86tVXGwYThlRkM7Uic0M/UI9mFQGtRaogDa8vIs17l2dESmrUAO/tLP1Rrak7sbZKDHViYja2Je6KfV3PqpNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejCnIv6W9PdsIJMtK5ArI86+4Ebz8AXK72J+8dIga18=;
 b=bvcjOM/rP7AwZ5C/Mvt+UCKLIW2Rw7DNfZi8LALUkL6VzcywImHN48VcZD+RLgrTRBZrCrSglAyi6hLnGIXO1OtekOGwfJlTXhYYN5XkGs084jUma+rxPCFxUqiBxuyrwOHdgK69NEOUWUrjjNhQxyhQ8I8BlK3Q3PeHWr2qCdqGcTKroB2sSrKx8qpkI5b+yg08jHUrHECPct8r3sgBoiG7RsbqsFXVft/kdyTKioEPviRWiyI6fYc0Ps3ESfXQF7a2GIF8qX4R4HMbKGH/4bSWJJpGJDCdhzf/qF2qDqjgIZCbC61bN37eQ7NBE+oyN2DIllhivpHji4jCYUdIUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejCnIv6W9PdsIJMtK5ArI86+4Ebz8AXK72J+8dIga18=;
 b=aDIHERRzGkYIvOTTPUZj7UluEfcL0aByk2Jl2Kvz3OnvKpiGNMStlA5kP0BTyEkdQC5pPqrFrabo475sLCz2Yeonr3i6Avha5TxBj3KwDPA3ALY79Vwc8HdISbsKzrMrAUCjksVgO2Z1e2HwEh9vCM9jzxBYTDJYLiYwtP5oAPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:09 +0000
Message-ID: <87sefmru4r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 027/139] ASoC: codecs: cs43130: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:09 +0000
X-ClientProxiedBy: TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf31feb-cf99-41a0-7d18-08de0ad919ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gfxPnFEmSMgj25ipnIQtEnkjEaThH0IVftN4R+pprRTWHtQ+r69nebZNYjMT?=
 =?us-ascii?Q?aoggUVSiiYG5hrfs2PJ2aDsKQqfhOlJt9yo1C5eeUN8bnwH3dwdeW3PP90vQ?=
 =?us-ascii?Q?HEoZQZQoCJaNqZmBW4AbiwDpw7P5f5hYv1jqYycZv7/cT+/M9tOMnVX8eNgU?=
 =?us-ascii?Q?Z56wjSDaI/rf5c9FzrtEusniKuKrv/SDC+gj2B7Yq3MFWL52IeQVF4pP4jYh?=
 =?us-ascii?Q?qip9GFnTp/O4Y9bhBfthGQeFN4gU+t5iluJk1UzfljX7Hl+Tuvj8xj6Wohc7?=
 =?us-ascii?Q?gdQMvFTKIL5WPGD18/EZXSFuA8QwzlOWu3retNPpBkqGzZKIwKdQ5pfDIAiF?=
 =?us-ascii?Q?fGl+lpVNWkq8dRNwLMaF7hj8WJtDIvadM61hCJ2SLgRCvqHDIEN01bO5glpB?=
 =?us-ascii?Q?J/MHX+4T4aet+wkOdOOs3/KJZzfTL7eRv4bAiHfvveb7Y/+ldWDsdillFMV4?=
 =?us-ascii?Q?lsLd+AzQqzvROIDZWJ3/L62qfWcxVdSiN/ic/hGL1pBipdF6ZmITu8Xh8Lsh?=
 =?us-ascii?Q?2/rDRj/SpNxIcnm0R3o/UrnIGXVooXlJt9gzj9y6in/jSafsixXe90L76aGr?=
 =?us-ascii?Q?2wzpPaOGkK9zei9EPhtYaA+n8bdzFlRrgfmBO7JDpW6e2DSi80v4QdDDfqul?=
 =?us-ascii?Q?2LwnyxtAwvdGQEf3L1LlADXw/G+UcZ/R9uzTB6t6OnW57PQanhbNjqDe36lc?=
 =?us-ascii?Q?m9+CW3FM7UnmU2GZAXADeVFBrdaajInEYW3EDc/7W66L674WosR/CsFKkCFS?=
 =?us-ascii?Q?HwKSSivIa6B1Wh2QwtshHP0NOPmV39USkBzNKMhDNvVVfaYbytFZRQEXfbgI?=
 =?us-ascii?Q?w3Hzc9Jmc2Er3VbrecwErkQbRC3AyPl9+O5bdCNxEiiMYhuqSd4KsbW48l/1?=
 =?us-ascii?Q?u13/4Yu6HsFEhpfIUPTqNn6Hv4p5Z50qPVsz/bKuTklNClM8x9z1+NlkcAZ3?=
 =?us-ascii?Q?GS/ZlIydGVDoOPFI0byuyhN9N0GejnIZLXnbDCVUsmKXXE+29PY05AwFTTY+?=
 =?us-ascii?Q?52OxOkT+eCb+nJn0NPDjdaMwx5gz1/KK1FtykkXZGIWTTBfEfkoTG0s1TJ8J?=
 =?us-ascii?Q?LyDvBARbStVOvSnTLSPk+mHHn3qBb7kteRLtGbbKihgsxfepVMXMrdFtdkDZ?=
 =?us-ascii?Q?63+avQyqs0e5H3jTzwilmJhk6rBEwGwM73u5SAz0VJPn01aqHtFOLrh/nFLJ?=
 =?us-ascii?Q?6M0Hd2SbDADNj8lmUNFPYl/+9r1KMKCYDUdQK9hOnXDzhyGVdNLTvfJB0yhc?=
 =?us-ascii?Q?1jTcnWDAYaFjfzXn4M0a56edAx6EXKccPrTyp+N+/7uteZGdOwdzxRgnV1NL?=
 =?us-ascii?Q?qIuM5wOOgjNNCWelHRcP79g44sCpx/E8WizrsIglnXFK/aRhYfzF2nZCqUIp?=
 =?us-ascii?Q?GzDYYvFWVrNdf3NxKZ50uDBiMmuaBRuuJNV0HOs3t9HakD3i/rgXf68fVoY1?=
 =?us-ascii?Q?LSM9oYgPl9gaeVgMNowadRszDFkQE8jBstprzVOAD9KlPei1sHjSokWOnZHC?=
 =?us-ascii?Q?Mz+XCl8/F/uo1tdzDZtD9pS4HamwO1IiLcfk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Y73ZBKXCNc5uELMKocs3hzDf+4vAoxZHWI2FzxGQ9GC9yMF40QYSSt/2Aft?=
 =?us-ascii?Q?+82K5TdG6SWC+yWCEVARWx58sxKWtWbnAmyd1n5S3tqZAagJ7TXWnemgh8/1?=
 =?us-ascii?Q?uFuFU6zkhhHQL+0PXbZ93Ic8eYHrSeydKPgpAPNlqJw2sxQNQhvcHLw8PuCE?=
 =?us-ascii?Q?XytUl0iiYuGoLb236vizV737pTlRARSGKqOPhKZF9MkuI/LHvW6FshAzkoIR?=
 =?us-ascii?Q?EzUzJfSEegzOHikTJCKSkmex037rPg0KQCqdFSrd8BZ6qtzSMPTgZl9llmIx?=
 =?us-ascii?Q?jFzD/R/AyaYiW4qMjcsyt4qDW2HV4wL0azaHNl9Qg6/FwvTRIAL9tCjLvAEm?=
 =?us-ascii?Q?Kp8MrTPQeciz7bE+jDCijGagxhrrWHxk8Tqd5zre4lLbxeeqLpx1HE2miyLx?=
 =?us-ascii?Q?qw7RvLtiRL4YlnNTICI2Qihpatq0Ja8ZEButfnlaGeh0PispFB8P/U2d0plQ?=
 =?us-ascii?Q?YoxFozrg8GjtiawbmuYCDfBS74IwgPhK8YVk2r3UfMnOnnQmzBB4mjHN+6gw?=
 =?us-ascii?Q?Ptg5sAUR8CJyJN0INpAgWRbXpezcIu2Tsh96v4SZuyHjRkS772lP/ZwS+/34?=
 =?us-ascii?Q?sogYGyeUjHagPIiFdUCY/02QCKtq+6FRmkQ8AuaOHEzKg/oIKGkw+U5ACrPo?=
 =?us-ascii?Q?j9hl8DRgJfihp9UvxXMzKPJ69oz9hlnuDmT4NbO/MQguogwFmHM/6a+a0c5P?=
 =?us-ascii?Q?ugy2d3eUHxvVT6qzGlwesYWvGuGfN1wlnJH9IHlaHFqItRZwThljE4JwxVSq?=
 =?us-ascii?Q?xIntcJqFtgvqYL1D5bhKs0Jl+djEramNYgtY8uHg5DtDd9AR/8cdvjSRRtOY?=
 =?us-ascii?Q?dO9tPicj48y9sCyyy0lgXINO7YEi3k0W5ssoxT9AUy+uN9ZxhHAZ+DRoj9PO?=
 =?us-ascii?Q?CeABRzCMYmfupyEp0eWSLxlc0FfdDIDR7V8rr+/TaT1xf4IHYdwygYCaoFGq?=
 =?us-ascii?Q?CPa71UTIB1UseQ8yGTZNNuUmFXrvuexmFVvdwpKgh5tTFW15LY0RY1ECCRyd?=
 =?us-ascii?Q?NdqHT9NaeFKzkiJZcywVtD4a2kOraexfKpbsuWM47JEVq09u0gKnU6OIDYjk?=
 =?us-ascii?Q?yHm1vsYXfuCwnYMaYS/R3TjJOQpMysT7/Se0DjZqgEU67zNwQFCkNZQIH4RV?=
 =?us-ascii?Q?jj/czgE+ys1R5DkxZTXCsy8FXYXf+1nlU1lppZGGRfHu+P6bzd3jNfc02cg4?=
 =?us-ascii?Q?WK6XdChnPFP6Fb0cHXIGY3E6IaHr9EDnsEXORvSqJhjeJ7Qw4SBoVDfFjptu?=
 =?us-ascii?Q?VKP19VQxgJgMdEnowH6Wy3ur2sMa3hC72drzc38LgserCWd0ArQTrp6tlpAk?=
 =?us-ascii?Q?8TgiQ+HMiPDuLTzKhUHB7uGm8TcEe9ML2B5SemqCIa3Id7kmeLjWoeVd70vt?=
 =?us-ascii?Q?fzwlg5C+x3pF/zSCqiMmTEQobLXTvipqBIsJg2v4rzZKFqQooOZi8oVGZQVb?=
 =?us-ascii?Q?+DHB+3Oo1ogiotJ1IsbjQ1cOPRKTfBIYE7iulvQvf0wDX/PegEHM1tFVKCWT?=
 =?us-ascii?Q?id6cnAHnSsAeIon0Oz47b320EEPrUYPNjU7Nnmkm4Y5UgSpCJfx7aczpcHsJ?=
 =?us-ascii?Q?7JzbYkwqZ38aNM44KReK676Odmo7PHef9OBMgIpLmcdJHZJ7aTHX/lwirUlc?=
 =?us-ascii?Q?mz3SFmCP6BHH0nY2EZzk2A0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf31feb-cf99-41a0-7d18-08de0ad919ef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:09.3868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CG34RduCxpA59zYwITv/kDLNAU6ljSKbSmgMn4/8aJGRD8atQ/32e4PNGC4vypqMegoQbymyV+3Yk4O5eHhkTSm2vD/ZG1vXbC5tJuHb36kQ8fp+OxL3AbrcTiy9Yqpb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs43130.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index d9b3d73c8388f..a3bdaac9c0590 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1062,7 +1062,7 @@ static int cs43130_pcm_ch_put(struct snd_kcontrol *kcontrol,
 {
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
 	unsigned int val;
 
-- 
2.43.0

