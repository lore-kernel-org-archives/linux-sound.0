Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6E8190679
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533622; cv=fail; b=CZCsQL3CPhPNXf+PeJoUnD1eYGN/4BHqtzbQJcX9HhZysqfai/HBLWPgKRrcPzqJBjk2KbDn3FCk8KnZANwhZcOnSsbkU3C4IZuCoopXDsmE8XWveRJx3dfIl62D7be2MywekY32Ht3k4rD0sftUJu0G17TYp/qv+GRTsXRtnl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533622; c=relaxed/simple;
	bh=G4gcQnrh1X7o9UAmzWITMn1Wdf38WPh5fnbdgMsF1L4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PiJMjxWVCIvspIRAnb80IUl/iBWWmbfKewQGu/l0UcIv5hh+SHb/HUbzNa42jBkADutkSJNGiVgJmPj34WlEP4XGAMRmFYUOTGN1qqOzdEWVbIsFVLSMUBOpqcgHioYg3Jy/QTOkLnReS6JTUBfZeIViJNnQokfY32BQaivPEMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=c+0xQM3i; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="c+0xQM3i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpqsXHJPdWSlmWpy+rmcMh3w1t3dkJc+K1vDYDts24QWAWtJjSywnaSjO2flvw130DRAGKI9tn03YFDvsfBlWMmfse0IZmNfXl0zdnqy/3euURRJ40AC9j253UQX/BZffsUbrfHOQPUExf0rYyNFliKQLPJzpHlYdOoIYjXlxKxe0onWb5QX2O8DJhfgklHmsyO44TXuLH0sIXb0erphC4W11YrcJlaMizmTuRP7qLB5Y+yz+2h7RfU2REGw+NR8BX1aOVz2lGRE5XBwI1fMGMIIkei3ypM11XmYeU+jZS/LxIUYuqEkmdAvB2mtO2e0ac28/RaBoSEmgODtrJ/kVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAdlk1IFxM4pk1/TM63SRe6lbhlmW4PYEgKqvjRB3ZE=;
 b=po/4ZoiRfe1sx8ZY1VTWHBzJkipy10ArNANGNPHq3Z6hwFG9gt6jXo2RBjmiIGKvjYxkHktujTe2Yz94tR5k6vAXmgW7KXOjpN+EQ//8BwAVZkL/JH9SIuFQT09OH2LLd+gWAceDcEtcL4Tye6uUzDFO4ayEETKIt2Xtuayq1ywuiHD3sLXDJPQsJjGe7egjK6PMAUqU34kxAB7MBbfBYigTgpRCAL1SXTtNsJymKLxgo+VW2S9JOHXzNCCUZCa3Wi/kfZpOnX1KVeswYYHgcn7JYNXFiLx24tkPXxLeultKFHb1PtDYLdjlt5FHtlmuOsM1m/A9QZyTZcLgf8y9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAdlk1IFxM4pk1/TM63SRe6lbhlmW4PYEgKqvjRB3ZE=;
 b=c+0xQM3iHi+Fq80iumxxgAz2gnO8/0PN9OtBbbcbBj+L71LMrZ600PTB9kMH/iO7gxTS3PN+Zx2FkxBJFwOfgiZNtwseBvPJFV4u3hgb7ocJcCKEKx6VQZc+xm8Nox3FGU7SApxQXd9ptyWd8MgCu/HqJ3CA1qfGo6RwqktFz1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:33:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:38 +0000
Message-ID: <878qptebgt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 055/157] ASoC: codec: rt5651: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:38 +0000
X-ClientProxiedBy: TYBP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ba08fc-f67c-470a-e35a-08dd5605982b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QKA2RPSHXIKEbJcDy1Hi1x/LoUshmHwpyC21uh+lFC2oLiO35tBJUBEnwx+r?=
 =?us-ascii?Q?1t+CjGEK8VZ7MaG9OTfDKWaM/lxhcNY7avoozMlBJGO2fHGj457czoKfN5xV?=
 =?us-ascii?Q?vDHasY8siPAlLuSoCoEyb5/yXdG3CGwCORRD74sRj+kT7yx+G96xWkctkakX?=
 =?us-ascii?Q?66G4pWXHfRttFhHag5uSu6x4cSH+yAUaYGGA8AsLNEqSLoBLX+1wMRgHqK+R?=
 =?us-ascii?Q?Chqka0EXjTuzXDpLmEkVIeVGrSDuweFwQ4JUxBopBvv/vTV6hzX+agJ1sLN1?=
 =?us-ascii?Q?ap71LDZK9IV0dUgPTQwt3xC3M2KlydlD6xSYLiDyCpRheQwJWoCgpHqkiV4K?=
 =?us-ascii?Q?x41QNjgYvlvGyh896NdfK05KCBvHxVfOLGMGznoveahwxaPdBTlE/Gc/6GjE?=
 =?us-ascii?Q?pmh7cWNpUJmEpmKIyjaQeQt/4Cv/beGYrfWc9X86vGZYDPtJNwtuFQ3tJxT7?=
 =?us-ascii?Q?FIciGF93/bvZC6oo+e/0moaXLxJauyT1Ac+5l9NIshh/5vZDkycG9z3MbZ/A?=
 =?us-ascii?Q?SS8YZ1arooIBQKikunETzZ/wlZ7w/KtGwObg8VCQb26pWv0R65QJhyDI0NDH?=
 =?us-ascii?Q?lFG1oj8fG6UyiZ0VA6sjluoSkJrCHg/EbpcsbxwrF1GQPdnf0A8GZKVDfQAi?=
 =?us-ascii?Q?jd9AYGv104BaXJKuUMtbDs/kMVcBkRyZ/7yfa48j+hi8DlwrjOi5a3uybAR7?=
 =?us-ascii?Q?29fKwmzeHwX2otciXJO9PApstdEcKLD1t6JKFq1H3hMgt9DaYDy23105dhZz?=
 =?us-ascii?Q?pzEJs6+IzfpYnwwXm8XPSCXui1Swl0zP0hKXOl7VM0dh0US19Ruc77iN84FU?=
 =?us-ascii?Q?MdOXLBTkLwQGskn98PLceGc5vy+KGJIwXK/FHyTLquO6Sz0rz97vHOAK4VT1?=
 =?us-ascii?Q?temnUBYZESN4T5I4m3gGYMAEOfUv7rlDJcOjrjnScYOPHXu1orhQvLFAcS4w?=
 =?us-ascii?Q?mZMuf+6y1MNsyFmBN2EGjGq7/ynDpTtHl5TDzBstAT8tBwX1GB4+F63Lrk1i?=
 =?us-ascii?Q?VuEfFZgw6kl1kkdd6tnuCSclQcm9z6wKUk8zHeA0tmWSvccdidFRmwUIgwEv?=
 =?us-ascii?Q?VxpXuT2u6DMkchC12TeOSknmMSURxspIkZptPTVQjeTtVGn4qQLA32+x+hj2?=
 =?us-ascii?Q?+jJ4oE7EqCsMErjEQdYjy0xwc5gFnN7jcPlN3Fl8Jx6wvtzVhmq8zhVZTEO4?=
 =?us-ascii?Q?YYaEodvhV3GcdAMHWYSUK2zf6LaGXNusbCzUWGAv50nNj8nlxozgjTEIlovP?=
 =?us-ascii?Q?YZNjV5R3Euy2eT+LQintk03LaFaUGrTVdHr9m/qrVG82bQBFE6ymNWqUGf5B?=
 =?us-ascii?Q?dY2papLidJzZQFgIGncESD3V9xBsla1hgEcyICZVURRVv9BMF8oH+3Pft9tM?=
 =?us-ascii?Q?sZEcfqzum4N3nKCoyya7pyL9mpuBDnkn1ffRNy/SNz93niFgf3z9yBNfCq9T?=
 =?us-ascii?Q?3UKCxnvptpnhjyGJZntj4QfFOXcx7NDU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lwNTV5bdm4LeUwSEasY0EhHWXiI/ygYaHlZyr79df6TS9XGAb/6LBBITY/xI?=
 =?us-ascii?Q?rrU2V8vjSyp9zGb3+2c/UDU0PuD9bkyHU6+/zBT60JNsJmrPGF757f8vdOlG?=
 =?us-ascii?Q?yj70Vwv3w1xI8J5rtVKBRQV+N9aKgsIKs8ibJtSYe91zmaRcxO1UHDciypJE?=
 =?us-ascii?Q?YWX3wWI5wk5JitoUSBZd5KtyIHaE0W6hPr4PrFHsStxPZNMPqittrCy+6mCU?=
 =?us-ascii?Q?CYNv6+pjwyYN8oBW1Uo28YVO3/dTbniQzU7B3SGUEaXwpCfED27diWhuY/Ex?=
 =?us-ascii?Q?+Mtnl3ty5HowNfHYy04Z5qZyGAHT8FRZPdeI5xqwd2ptbWVZoy6gbiAo+2Y0?=
 =?us-ascii?Q?KFug/nMIrMdZn2MLZ43CifbZN+6+IwDuqlMP2owie5aPKIIdxh+tg7aYl9Kn?=
 =?us-ascii?Q?Yt98EHlWWVzMItTOrwgX+yM483qSUzUdCBtSuA+jCaFid0EAkgX9dBwgN+6w?=
 =?us-ascii?Q?K3Nf6AyvnmImZ/nTOfUg3jVniF31EkPwB2Nd3W/xeUifVpQ7F083tuO2mq1S?=
 =?us-ascii?Q?43avIP0n4rJbkgBl2RakdUoXfdy6x1Ma+5eoJhZhv/XXdpPMk+bxUW4Dsirp?=
 =?us-ascii?Q?B9PUABtsZi7r+D11AimIVFAXtwx+6t96SAi5AAOYUVGPsz2jidCmwyzbLJBe?=
 =?us-ascii?Q?KeFDsy2A2U7s//F3qr0FDH6SDFjKEjbdFQLxa/LZev3SjK7MI39jzgpNr0w1?=
 =?us-ascii?Q?wbkoNxPbYooffR3zD3TV4a6elCulK0SF1x7PfU4o3oQ0FbFXVJC917aio8kr?=
 =?us-ascii?Q?QgDI2GHAYGJqn4sC30Dyv2R0b9YFbC0u1PB7UYN0N2RNsdBNTy09xeLQiP7x?=
 =?us-ascii?Q?sJ3QTfRJshD5U8FLLe+va8wkhIfyuwcTFwEtW4ncpivE1gPd61WoS8GAIHWm?=
 =?us-ascii?Q?+350ZGfoCDKltrNDV7NWIDiacjPXHltE7Zc3y+ugtPJRqHsxXG1qcfPxEual?=
 =?us-ascii?Q?haBoGly24D+rQs0Kkb32njk/YofLQyEyu/W+RBrV5mgEBE0jplo5aqI2bTvs?=
 =?us-ascii?Q?QcTpbcGTBZjs6MCfcKHSncsUpeDSvQCfPEfylaBMxkk/mLyRvdU++jmX0Lci?=
 =?us-ascii?Q?EvRLYqbw8Zmzqi8kKGBzayHPQwLA6oppqU3wFLr106kZ6bPb9aZVd7iEOpiI?=
 =?us-ascii?Q?ZugEqSIN0/OoT16reLlBqVkAg/oGhzQZR/WaoQlx6GEPjBDg8135Pm4J1XdL?=
 =?us-ascii?Q?vrPV/vKTAzZP/+dwwugVCNMnXIcDOGlztDu6eFytU9x9jkmRTLqPRzR5CT6r?=
 =?us-ascii?Q?+6Wd/0dq0vIJZCyHFGR+bXamVV20u6eZ1pwHnENLI83Pj1QtleB4on51jXl9?=
 =?us-ascii?Q?1zZwdR/Zv41rUbPQJnUha4v2yAfXajJD7Zf3ffmcEahMftOJcLiqgmh8vdIi?=
 =?us-ascii?Q?SjsUCjszUmvbxtkU3ngRwUL7GH6JWrQdz45SrKPD8zB6M4eNPUy01lLIjITA?=
 =?us-ascii?Q?E/VXEOo+J7JAEdD+V60SHQ9upOYcszTOD3aMVglJSjdmKtlmv2Je+VmvyYsB?=
 =?us-ascii?Q?pxeM0VCbVA755FHADv0ZHSbSsk5/kZccv9AW7dhLgHDlu/vhUZ8T//zl25Df?=
 =?us-ascii?Q?pWp9RbPN3sW/YEZXvdPA/zPHZuXmApjK8Z8U5ueTuLEKfo2viKIpBpybB74B?=
 =?us-ascii?Q?SO1tzFv8DVWjiPkPSnJbT1E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ba08fc-f67c-470a-e35a-08dd5605982b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:38.5929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hifCgfzTqFLQEinFLUoMYnYo3OLs2nWoeVpQmWgNA3Ajcr0sOXcJyh/2E2xrIdSfUE/6EfiWtwMbeOCUaDILcFGIHwS6tNbsEtuEPvvhFTu3VpvmwwauQITkOHHYaIM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5651.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index 00421a1f54bf..7be9f9f0f34f 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -1352,10 +1352,10 @@ static int rt5651_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5651->master[dai->id] = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT5651_I2S_MS_S;
 		rt5651->master[dai->id] = 0;
 		break;
-- 
2.43.0

