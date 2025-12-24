Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A2C224F3
	for <linux-sound@vger.kernel.org>; Wed, 24 Dec 2025 23:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766619560; cv=fail; b=l6AHumFyK/aKGLbnIjhWSILLQXRONEnZ62nhML1xbPGx4B8q0/DEBug9Qas6ihQcRCAvPj8VzKTXhth5W9xo0Zl6QbPAEWNT3HZQ8RN3vDXbKVxppQp6ejGqBgHT3CSQQg5ufSehMt4Xl8Lk09hZBgQrRRhTvAYiKNFfVhNphF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766619560; c=relaxed/simple;
	bh=xRaF8sWIIrVB2dGPLf1ElvrOw9uoUebfIE1cpXANFs0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=l9UwZJ9pMvGFjOL0mx0yIDj5538uSMP46Iv9fSoyJU+IAdvcwA8lRbLXoerk58IdczvWMCzDwjpE4fqd4HIna0Xo0xJtwpR5G2URxDoOzLxwKmnUCzdhkjV3cFA/0vyeKz91M11cgo5xNLP+07ac0Vl795f+9j6rvDAMpris3yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JMAOdsEo; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JMAOdsEo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nn+3NW1ZuqFOZyALXR2nzdmw8r21IasAFofaJI6/3wd0kuL8pfrUmySbrPRpMHNGC8AddX6Wu2XRbW/VVdY7hayhWhWV4iqjSbMfvDD5yv5reL2N2O3rB2N4NiVPWeGS/WKTTbmH+coxFXJmyU9aK7hnEkxCScvRug3nciZBQYavhxGRobKphQi7ME1IeYqNUwVrHRsgP9RJSthbAoUOqPsVOnsd6OS6Edjs5m/X722/Ri+wo7CZiuyEfw6SqqkVgoEPADoRcI+qXuJI8OzPhUIKOoXx9NBHCfRPsyVsK5x5RAe/G9UOIbp8IisD5+sNpDg6mfk3qdFvYoVpeWu0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrxSOXWn/mEH9FCZ767NxiUK8oVCUPSUCnrQNwyW0sg=;
 b=FNUO+yFgf+pPCvJVx5N22lCAIO76A7EKCCK9bCJJhCy2A4KWwN0/Ez0PU1gJjl1UboBuu9eR8jvb7Qbh2q2Izz5vhZUVtROTLrWBvzvbpJ/lxML3BgXRaonSaKwiI+bLPFKNyHRuIVhJNjyPw/ln+mnab+VxMw4HhPa9rjQMdCInT/J32Owd966v3K0OZQg/e/lgrkksDk6T5VgwK0Lj3AuAL+WWS150vgJYa163OcGqOxFYfJLt/vm2FVtnaVXFiytM70XPT+hiw0vo+zJ3EH3AZqa6BRKd+/bFjtzp7/QTAXnoHzJuebaILyW04cHCE+7cuLBsnITH+AZKuX1LhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrxSOXWn/mEH9FCZ767NxiUK8oVCUPSUCnrQNwyW0sg=;
 b=JMAOdsEomonYYFhgtA6VOaA614UadOCZDW0K3Yp9FxjbEmT6SEo8x/rVxpyXnr3OFRNIS49Mbr2U9QuSUoETJA/GmXBJLP18P7kJc8TF3Nn9KtEDQSP6zkcfDNXKfA9/r3wTaFQbyrmYWPF7PLmpS/pBmBvNMravgZrfB9HTwHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TYCPR01MB11524.jpnprd01.prod.outlook.com (2603:1096:400:3b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 23:39:14 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%3]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 23:39:14 +0000
Message-ID: <871pkjv49p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: alc5623: tidyup clock inversion in alc5623_set_dai_fmt()
In-Reply-To: <aUvPTUs2ESeZao_d@sirena.co.uk>
References: <875x9wvgzi.wl-kuninori.morimoto.gx@renesas.com>
	<aUvPTUs2ESeZao_d@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Dec 2025 23:39:14 +0000
X-ClientProxiedBy: TY4P286CA0134.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::6) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TYCPR01MB11524:EE_
X-MS-Office365-Filtering-Correlation-Id: 361f2623-404c-4e19-c89d-08de4345a5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K30VVVZtnIxFhQb/dTF86YgtAWW4aqDQpbpfYxlmNiIPvZ4MP6dZtRN5J87P?=
 =?us-ascii?Q?XWExucnJUQsw2IZEb8d+bRuIxsIHNRv3VLu1Iij/zxknj0FcKWZl7IGuW/oW?=
 =?us-ascii?Q?/JYvsckAH/AyRobL4ARE+yMAvJsoEFRiFFpD2ip9qUKM4ELDEn1WUJHOVWKO?=
 =?us-ascii?Q?99KhM0bOfbxTZOk/qB5VVSBh2YyTn27KV2gTt9bPzeSiv1OxKZ37QULcQzVI?=
 =?us-ascii?Q?3UEUdFQ0iDsklNZqkfPWzoBB5x96dOoeZKITR5arw7Xjwd6npEcvh6NxwdNq?=
 =?us-ascii?Q?rSKTitF9Swt8O8toIa38IYZ59CMLMatsvPQaNRhYmADIoY73e1pidEHYlL/4?=
 =?us-ascii?Q?x0y6TJlPCKPpYtM54f/VHtA7vYcnZC512xf4AY1YWhPdkHpqTv3vsMXdg+UV?=
 =?us-ascii?Q?1bcANr0nR61ri40TOPjgGc1gL0n/0gVSJDBzX0IZyg3Tj/TFITDMEDzpz8zP?=
 =?us-ascii?Q?v//n9urVBqq9JuF5XnotBhXnR/quN/xP/Bq2YYtcbzDSWYpIV177NhHTrfsT?=
 =?us-ascii?Q?hGgMWPeMhmsvQgfmIixEmEEkXkWWp19QWjJTyXU4C/rf4gXBu/VUodKMmcjN?=
 =?us-ascii?Q?5xEXYTOQ6eaN1WDJSKtytnlcepQWx/hM1A2o65+moPKbJvtNcioGEvHNszr0?=
 =?us-ascii?Q?HBi97A2BT2UfzhZkGTLN00WMzG1yvmVDSSrAb156iyCkSgkKArFYGPPZLLlS?=
 =?us-ascii?Q?RMkbLkiKlzt7eOlwQ99zgJCf8MPtjIvJPClXcWZSw/lRLHS3qhFsV90RG80C?=
 =?us-ascii?Q?6h4JRrc0CEvtGzLLg2/ZLeYfzoCAeSJSmIFUL0/D3Lbr+712xwp3yVvMkwX9?=
 =?us-ascii?Q?RyIO2xThw54IiPGUtYpoaU87vBaC4a5cGVHLSLFPbh51Fj2OwUcHd1iP4atp?=
 =?us-ascii?Q?8+PxiFqxxpfVgwyTB/lln0MIdIVjdvMwxk5bvNgXZEqwGdJTjQTRGP9Wd8as?=
 =?us-ascii?Q?ibevfziGeCmcencD1wcpT+qu6MV7J0tExFfxgweIgtzi1l5SWcdZuRx9rbL4?=
 =?us-ascii?Q?ARimIdaVDwScdnZpoaEA/fTYg2CjMBDexdL+CVlMtBcYMoNoMtPXIZ+FzOUJ?=
 =?us-ascii?Q?BbgidlxuM/I0bBMAyzLekfETew/3dQ87dcpLMh/0g8kOi0Lqb9dH1L2Ejre2?=
 =?us-ascii?Q?28AVCNK33Oa3qj5u+FeCv4BnzG01q0Zqb5xhWRqslPmCNFqKlzZ+awaDT7Nv?=
 =?us-ascii?Q?q9iX5mns6Jsv7RaeS6LEsf4ESc5WHkG3ICpNj487QfsXuSrCQ6NVSOWV65Qf?=
 =?us-ascii?Q?CculBGLiLjc53x1fHT4nbztORrFMmR0kDXqinSkjiWVHw1wGsZUqOAQx01sA?=
 =?us-ascii?Q?VQCq1rhwMWavUB+pmkt2wbyCId6SzZn4ladllqt/9xi/g+6QplkFY0pte9Zn?=
 =?us-ascii?Q?NkLm9Jmg0XbXwGKWkUdKdN9DsCCpiDUtdjTYsNZ5lwCwsNjdvQnKDXKS29TV?=
 =?us-ascii?Q?42cY++Fgvj2NaMVqRqtyWCSonN2Z09kdvt2HySyMuu5L9k1lMdEZAAup5UTY?=
 =?us-ascii?Q?SOlmlgyJ552Asx4sa5no85VPLBNOkATZRQrf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gbrbo5LhmWwiOA1eNISWncpyu3ABZ58D92HGFbz5tfE0uaD6mXadAqUWPtdQ?=
 =?us-ascii?Q?MZIjhgBoxV4J+u49kt/QW1R4jhV9Yexmqhunv7Rzky0lPyeVThS+ZZoRAyz6?=
 =?us-ascii?Q?RUsHOZqU+kHzFRSP/hcMVB8NVO9Egw+ch4v8joCYzgsPnzI7p3m9LYL9Kj8M?=
 =?us-ascii?Q?OtDw5zVXP745utwWBKzAtJjoZ3bsYOWfKs+AoLDCzReSR6Wu95yaG5YBwpcn?=
 =?us-ascii?Q?eFsT+V9/6SnuEMVw1E+N7SXX65mjoH+UYexI43zPrG6qDPo0XAlokl2XTptJ?=
 =?us-ascii?Q?5yEtGnUdB+k48wkTDX7g746yJhmZPIsvAwyYPEfbkcoAerAAsMO8tfj4xYBZ?=
 =?us-ascii?Q?34OonfmeG1I9PcjcWZW+80OsPp8wk1vndbp81JvcanCzBEfoWmO11nqlbEoF?=
 =?us-ascii?Q?Vwot9tK+vnNyBRvhhdTQb84gAVSfR1Ca4KSgmS04EBDuhz/9ThtGn7aRR8np?=
 =?us-ascii?Q?Z1xvQhcbsSYHqZ0SDJUHenuQSq7zTT7B4460k20BRp+Sd7y+Ic/AzZN9mkdy?=
 =?us-ascii?Q?UtDhJJlnFJzJqt9LQl62SnbC8pV7MTYClFkZjXe5iuLBxZSY9CM3/IZ6cZx4?=
 =?us-ascii?Q?UUr/xlUG+js+LfAZ6RJcKqFIZiOfh/jHJXBg5FoVvIR/8v82IHxEa0jNhNCu?=
 =?us-ascii?Q?hQIlAb/jMOvT5UqSKHmcaCAUemcP05xeo71uJ8WjNEdThXLsD1QVwh+p37Vg?=
 =?us-ascii?Q?pxTvK7nRoickqjctgvwDbs1uGF0hKEkvD4J9SxGZA0KVUs0Gc96n2q+ZxcIt?=
 =?us-ascii?Q?cvQsF57Wz5I3qx4pox3FRTi9QhRknFbyVT3kGvyEav+BcYUWBftfAsSdDllx?=
 =?us-ascii?Q?ezbynne6BqcPkQngIvGaS13DblWmY9r/Wv0Y9BvAV3lahvfVygHwK7e5dpS6?=
 =?us-ascii?Q?Rj1AyYGnYbhq/Nla5aR7242E3vSrpCGaIVTKx3nqm7tKyLt91aUM/0EC0fhJ?=
 =?us-ascii?Q?KbzNBXpPIG3cV4vXyE4Jo+tDSLGXwPFSEaqH0OvHO++JNWd8uKFgIG0txWKi?=
 =?us-ascii?Q?Kk26xdpEa+8BCJmqhVq6bGxslelrncCbOpzPAS5vS2Fclx2kUTqqQTgMc4Vi?=
 =?us-ascii?Q?QNTguahLr5xn7q5XoWxa+6s+BOc7zVAqgEmt+8/e6sbVhOi/63uOP04nXbl1?=
 =?us-ascii?Q?d8U82zX7ebcq14mBWNRnyQW+joieY3DG/JSsFuFkZMWUMk7ATEdg0ylojraL?=
 =?us-ascii?Q?fL+anrXC/ETwbu8fOys6FOyHXqmUX0BPsM5GRvJNQkzvTVsNocvf2fnicOqM?=
 =?us-ascii?Q?+a9EPpwnyafr4cSC5vfaQ15LI+v98ooVCtAKVBRdk/R5KzFBqU17PukLTJCh?=
 =?us-ascii?Q?osDRck5znlYb6YZ6+7zRobDP12Q4hQVxVrBTjmSV9DSjtXk+l9AmHPNpHQdv?=
 =?us-ascii?Q?vA02Y/3RsNum25bvSALiE2czHzueZUT0vqNYRM+WKAHaz5EfeN514Vc6tZYA?=
 =?us-ascii?Q?5VUJ/a70619AEwKX0UlmCyMvNMCyO7AoQuIjAfzxudLM4egfD9xyfEgMdukG?=
 =?us-ascii?Q?7m5keK5hpKSJEWInGCm+fOs5c51bSuQmn0i/5WWGkHDBj1D9sTASk4irlimE?=
 =?us-ascii?Q?PHMaS8tSncY6+6XHtnH6CvaL+KN5ZBZn7zoNz5peAcPnB7K9EKtQZ1/XqBb/?=
 =?us-ascii?Q?QK8zZ0EsLlltpnEPYJmMVp6I2z6cmc8D9Z2VuwHaKeOZ4mJuYI47CUfQnNcG?=
 =?us-ascii?Q?rpl5cM3Xgt1wF1SQHDoOAxXlR4wNKmN664E/Eg1XSA99T19oV2EkeJDiGh/g?=
 =?us-ascii?Q?sVvJfV2GN0ro3qouV0TWbe2QQqNG9rVozFRoN9/XbPIw23OL61fx?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361f2623-404c-4e19-c89d-08de4345a5a9
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 23:39:14.5746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ww2tOR78gC6os9XsYvFnkFYaNS7sSE0u3xyuE2t1dTRBXeJS+Jy3xI6n9F6Q1ZIRGw2+vbXLTKgQ3qlqyRalqvw4c6cFL8Tc0Ae3MHqeuFTMVyFtPXzJTiNfRSDNgqG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11524


Hi Mark

Thank you for your feedback

> >  	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> >  	case SND_SOC_DAIFMT_NB_NF:
> > +	case SND_SOC_DAIFMT_NB_IF:
> >  		break;
> >  	case SND_SOC_DAIFMT_IB_IF:
> > -		iface |= ALC5623_DAI_MAIN_I2S_BCLK_POL_CTRL;
> > -		break;
> >  	case SND_SOC_DAIFMT_IB_NF:
> >  		iface |= ALC5623_DAI_MAIN_I2S_BCLK_POL_CTRL;
> >  		break;
> > -	case SND_SOC_DAIFMT_NB_IF:
> > -		break;
> >  	default:
> >  		return -EINVAL;
> >  	}
> 
> Looking at this I think the issue is that the device only supports
> inverted bitclock but has no control for the frame polarity - the _IF
> cases should just be removed.

Do you mean remove _NB_* ?

It will be hit to "default" (= return -EINVAL) if we remove the case,
but am I misunderstanding ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
