Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3CF374197
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605337; cv=fail; b=JhPMZxzrN0ltO5ZtOGfhTvUL73fgcyyeZXTb8uPwNu64OG1U9jRD3QrRno5TZVGkH9HAs5mrW+5qWdViCJt1xgVT8NEwv0j9qR7BYJ+IfL6uwyhz3qp6Rqvfv3uWSKoYfoIi1hRgTvlWWtSdd/iJobxUW8LN05U+LfGOwtyag3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605337; c=relaxed/simple;
	bh=N1pFaq/vJCwaUN+hNpgUkhU/OT08bl+HICgOKNJTzxI=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=d1UAeJcYL4gRSi/2ov3xyLchq9sT5tFyso330xaOxaPcSub7oJjirX2NLrOZiIg7v/5dNzSVq5+g+4DycemWWTnD9acDhValVxqdc1tkCPFLuWZYzc943Yz1McdqGtHr5W+5vnMQPQh9Xe/B9Nw1RdQhfm9ZS5PbbYHnm73IJ10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VL0vS9wv; arc=fail smtp.client-ip=52.101.229.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VL0vS9wv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StOHgo+/iKcOnzYedLsgxNbIV+r02jcaqejhYC9vtA54YXdRB5RBUkmOhk+RUY86nf2wSV6JhjGLHY7N9zfvlKyonvGcsdw3nsZArby8PNoXQuYJdu+auhrcVcA6GiGus2XKNY4UAw0a5/MoyyDLk/Z+mkhG7hgwJHUBzFF6ncZ5Ca3yvMebMwJemAuMJ6Ob/faQAODKSYAAOiBQ2sCHKBtdsHa3Z76z83buFTKCq9lgteaw/MEv2cGfCyWcJRe28mZnlBNAMdt7qNRBQ2S13JGCjsTjdPHdOikwV3XNX2eaURvzq/j5zlnIZFx+at3oxssvRB5OiFgK5Wg9MKxitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVLwHSxcB1M/ak0YlyMWY9HjHAlrUnvRwaEs815q+BE=;
 b=wFd0GhYY785rlpTy8Fab2c08rPTPxfIVaFFr1BWOatAO0pN7wBXQgr+/9odgxDtLXAkPhA6JGypw/SH+aSkkboeKj+HAc91ZwAYVdQRfRCFbdKpMZWdKd1AEZEs6qfZi5J+wOD96k0a2rK05pwNeQ2HFA6gsiACKdg+KMZxDQFjxeFIum2kDaPnDihW3ElFsg3xRaDqtz2vcpMQYSptUebpT/VcDMW5ty5VxLBN8vZLf4/aYyQJl9aV3ytFRzHpndcRzPUZZCjRbRaQhCyN1biYyy4cONP943EhWoyDtalB4QXzRwuwV2SVVijBQEWm6AmvDPrj8OIsj09IVO3OjIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVLwHSxcB1M/ak0YlyMWY9HjHAlrUnvRwaEs815q+BE=;
 b=VL0vS9wv05Jy0GvCF4XwKvMcDXpLTSQJewz7T7+V49o1Q+X3AjQSfs00OanNuHm6R4yUEMiqmC3yyT/habRf6qJ/w1b2/9OTm3y+dtu5/qg8zhGLNhR4OpIFlvKKQK3QSGB8ivY7WIhfbn8JN+9q7ZPE2MXB2yRQwVfox3uYqZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB8193.jpnprd01.prod.outlook.com (2603:1096:604:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:22:07 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:22:07 +0000
Message-ID: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/29] ASoC: soc-component: re-add pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:22:06 +0000
X-ClientProxiedBy: TY4P301CA0068.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::7) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbbe897-cd0d-401d-10b4-08de79b65c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	Kdgix7BtPI1bwMMwBMaPly52Z9p/WEZknA6R4ObX7CzeZ5Z9HqUC8uYJjFDi0AdILx1ljDuNU3Gg5Ys+UjG7sejyahr6qk9ZjM+6/Gv5FZ9dFPdseur3Zo1KBXR7dGSeKNo5iDvsSnCLtPCfu8o/ySesjeYUOIsbrSfw07Mja9TF6/Z/9PLh5C6EguaQmOn7QATMO6iY9sYuMWhIabPosdjzYAfPJghuCbWl6KjlG2mPgs3t47jQWp11serV2CaIuALVQyrAyBNdjBw5UzBFapzeb5zt/TIejQpPpBWpwsBceB2EEKqbBy6P1km5xCcxJVEooaXUXSySFYQQGY9ZxJD24VtUuc3VVewC1eoj0NMMiOKu3CJ5qJGBRybs+TwhTiPD8e+8PDSltt70KOyFDbaHuxoY6nl7mjjnWhV8o2bq00950CytPiCnt0rsr300TMIuUOPiPwD61yPW5c6XGb5vbLo/uL9y8kM8zLD1a2Cv3LqSicI5g5MyKKVUy7dsQkf87yMuasrLcXHIbQrZUCtq+BH1Bi9ryjZK8iTIs/unKsqhk43T7aWoibiLBfKBur+CzsienAuxvOSO9THTrJx9E+El6G6SGFHIOGdKnWXIaTe99FjUqj2lqZ+bfjpsfnVs6KawJuL4KoOJY98d+6Ev62HCxrFRyD0V6afr+O016LbJpTJy95B74oVFmvLfRKD8bNBiSgvPsy06iPpVtUxwsAVj6P/yQy/ojBZwiCnVB+ZhzxCoTBhgucvjo1oIPI+D42cLaJ8sjMWrnptm1VZgw150/lzl080rXJRPxIQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lA7UXJhSWRykPFUjj7ke3GN9nn2wXMHGKN9uiN2X/x3crGTQj7PUO5HFxLIc?=
 =?us-ascii?Q?j/5aDFBJYdl1dnxwbBpcMxI9EJX5Kz4q7sShbb+hXo/k8DkCMpGxyjgA53Pi?=
 =?us-ascii?Q?LI+IR80wBvMbg3rDtA7BJV0dVSAKQnyzfvn7NcS0OvwmOXpZI50RsrnVK2K+?=
 =?us-ascii?Q?iP/MLHW9zMH9jLUFmUDs0DmGj4FfmLt69zWMWRAKCwGOnuqEUS3uKu04n+AE?=
 =?us-ascii?Q?p3JA4kTyxT5k8HdoF9vBA0cw1HQVmNiVUrIxK5PakD5q6vcyq2OHZU3HJJCc?=
 =?us-ascii?Q?BGmivEtYahHQyeW3NZzaOzMEaY4HcNA+4nbo661JZ1iICjZufmE9qf1BGsYO?=
 =?us-ascii?Q?oJ+9Bkpumy6jwhmVCSHv5wuS97f3OWbjMJAHLcA59S4glNnC1pAF9WyGUh7G?=
 =?us-ascii?Q?g4JRuOoL57qOb2OJlOwgL+1uvz2SgdQaYp0tHQSy1xffqQgOTvrofTRhzJSk?=
 =?us-ascii?Q?tQj1ufV5DBrhT/QwrIBL2s/DiwQPrInbt+Sq7Gnv9iMxOaVrijyrKdeu1rbZ?=
 =?us-ascii?Q?E686wi3WJe4Aa80BJVf0x4h2zTYulCwps8KRgpSS0x/9V4jKpNot4TdzKIpR?=
 =?us-ascii?Q?9jJBae0iT9+UX2VUdlB796tOOJeZQi0z/97Q7eTc1pN2am2NlXesskaEcdK2?=
 =?us-ascii?Q?I6iDe6vmDdvIqpklZ+3GNPOPh5t8ImBtc7jwShp0INazpjJX5bfgkB8pAzkD?=
 =?us-ascii?Q?3fdGGtH9qdApjQjUFmpKLQJUeHvl12s1kR5g6bJIXXnHf0CxHmRielxK+nLk?=
 =?us-ascii?Q?/1QjYL6OV/13hokq+YBOnT1+jKr5BETF6YQBOBH9ywfW3lwFLwQFkslujVX1?=
 =?us-ascii?Q?mDL/6UncboinVITHGIcwaq/TUwK/Fzv1w1yEHiaH/2fdbKuRnd9WV3NftYWz?=
 =?us-ascii?Q?WFn4JcBpNu/db1rc9pfYo83uQzj1UsFmfUxAT+Gd3u6nBrCBedSTW5nxbXSW?=
 =?us-ascii?Q?mR4CSX/CVjgIQu7qsc/WYykETLRkcLm0Tk+2nL15M1CiEToEl8bRnN0rnnyC?=
 =?us-ascii?Q?dFrBRrmSiGq/rnQZCKreqH4iOoqcpMuUYkAGD0/aD9JUQ1Z8q/vTVlXyJlZm?=
 =?us-ascii?Q?07zwqCUagnlqB62gen8/tqloevDJIehwbOl4ls+kft3/UtoU8q/leNFuj08k?=
 =?us-ascii?Q?uFJEUos3bdRoZGfiHL1bJdNecKMM3MB/jNEty4ASjtmiWE1tf586YONk7RbG?=
 =?us-ascii?Q?Gh5VuBOto5gdi2lGKVtGnLfvqykB/XgiQD1yVgCSIkG9sf3SB/HWHxZ/ukNM?=
 =?us-ascii?Q?zztjD52wruCFCB0YGOn3MdBwpUFt9I4u33EPlJ3Fhze3s3e28cFrawAFzpWm?=
 =?us-ascii?Q?+djMGFuwoHvYquTx2mN2y4M9EyBF8CjMDlP2NG/T3CBGSYNywi0AIFoPwPud?=
 =?us-ascii?Q?Z4xX3Ey+ev62sW/gpO20BazOj/zFUExsvZvRAbSAAFrzidkL+FHgqluyaxWT?=
 =?us-ascii?Q?H23leNwj3U0JyzrTgQsj6yWOrfDl8rGMRktxm4F5z7fcbN4viUVO4nPs9dtE?=
 =?us-ascii?Q?RxJSF5xlRWEtf7SNqc3vXgshOVFtyoQkJFKhXREJCpc2j8/+VKyv262EwXK/?=
 =?us-ascii?Q?TkKgBhXdZnEx8ZQSO3e3nTfViI5kMT94VWHfyqoKbb178ceOkxFwqI2xjH2T?=
 =?us-ascii?Q?vjyd8v5TemANYUUJ5eHPSgCXdXzAey9uckw1sbKKu0xxjEHksh+cp2qbDmbM?=
 =?us-ascii?Q?O6ES3ep71BXmEZMDTIUwtNFibszwqc8JvYpAFp8BQ7V97bv21sGND9BNIh6b?=
 =?us-ascii?Q?qFXXTvZW7RPE5tW+RvNB6kwVhYwbZYJXmWmzPZhUW/8JJZdxZ4IN?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbbe897-cd0d-401d-10b4-08de79b65c26
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:22:07.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IVpNEKrmhPooe6AGwNpI4AUJ+4uhgSxfDv47AHz1+JbhMoXvwFrxzjpICSsk2MY4mxPDn6ROXz4IU/1rEZKYYWNEJabX9i2blxn3sH1aUcILv6TvyF8CoE3+zgEqRyu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8193


Hi Mark

Because old pcm_new()/pcm_free() didn't care about parameter component,
to avoid name collisions, we have added pcm_construct()/pcm_destruct() by
commit c64bfc9066007 ("ASoC: soc-core: add new pcm_construct/pcm_destruct")

Because all driver switch to new pcm_construct()/pcm_destruct(), old
pcm_new()/pcm_free() were remoted by commit e9067bb502787 ("ASoC:
soc-component: remove snd_pcm_ops from component driver")

But naming of pcm_construct()/pcm_destruct() are not goot. re-add
pcm_new()/pcm_free(), and switch to use it, again.

Because it has no functional significance, 1 patch is for 1 vender.

Kuninori Morimoto (29):
  ASoC: soc-component: re-add pcm_new()/pcm_free()
  ASoC: amd: name back to pcm_new()/pcm_free()
  ASoC: apple: name back to pcm_new()/pcm_free()
  ASoC: atmel: name back to pcm_new()/pcm_free()
  ASoC: au1x: name back to pcm_new()/pcm_free()
  ASoC: bcm: name back to pcm_new()/pcm_free()
  ASoC: codecs: cros_ec_codec: name back to pcm_new()/pcm_free()
  ASoC: codecs: rt5xxx-spi: name back to pcm_new()/pcm_free()
  ASoC: dwc: name back to pcm_new()/pcm_free()
  ASoC: fsl: name back to pcm_new()/pcm_free()
  ASoC: generic: name back to pcm_new()/pcm_free()
  ASoC: google: name back to pcm_new()/pcm_free()
  ASoC: intel: name back to pcm_new()/pcm_free()
  ASoC: kirkwood: name back to pcm_new()/pcm_free()
  ASoC: loongson: name back to pcm_new()/pcm_free()
  ASoC: mediatek: name back to pcm_new()/pcm_free()
  ASoC: pxa: name back to pcm_new()/pcm_free()
  ASoC: qcom: name back to pcm_new()/pcm_free()
  ASoC: renesas: name back to pcm_new()/pcm_free()
  ASoC: samsung: name back to pcm_new()/pcm_free()
  ASoC: soc-generic-dmaengine-pcm: name back to pcm_new()/pcm_free()
  ASoC: sof: name back to pcm_new()/pcm_free()
  ASoC: sprd: name back to pcm_new()/pcm_free()
  ASoC: stm: name back to pcm_new()/pcm_free()
  ASoC: tegra: name back to pcm_new()/pcm_free()
  ASoC: uniphier: name back to pcm_new()/pcm_free()
  ASoC: xilinx: name back to pcm_new()/pcm_free()
  ASoC: xtensa: name back to pcm_new()/pcm_free()
  ASoC: soc-component: remove pcm_construct()/pcm_destruct()

 include/sound/soc-component.h                       |  8 ++++----
 sound/soc/amd/acp-pcm-dma.c                         |  2 +-
 sound/soc/amd/acp/acp-platform.c                    |  2 +-
 sound/soc/amd/ps/ps-pdm-dma.c                       |  2 +-
 sound/soc/amd/ps/ps-sdw-dma.c                       |  2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                 |  2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c                |  2 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c               |  2 +-
 sound/soc/amd/yc/acp6x-pdm-dma.c                    |  2 +-
 sound/soc/apple/mca.c                               |  4 ++--
 sound/soc/atmel/atmel-pcm-pdc.c                     |  2 +-
 sound/soc/au1x/dbdma2.c                             |  2 +-
 sound/soc/au1x/dma.c                                |  2 +-
 sound/soc/bcm/bcm63xx-pcm-whistler.c                |  2 +-
 sound/soc/bcm/cygnus-pcm.c                          |  2 +-
 sound/soc/codecs/cros_ec_codec.c                    |  2 +-
 sound/soc/codecs/rt5514-spi.c                       |  2 +-
 sound/soc/codecs/rt5677-spi.c                       |  2 +-
 sound/soc/dwc/dwc-pcm.c                             |  2 +-
 sound/soc/fsl/fsl_asrc_dma.c                        |  2 +-
 sound/soc/fsl/fsl_dma.c                             |  2 +-
 sound/soc/fsl/fsl_qmc_audio.c                       |  6 +++---
 sound/soc/fsl/imx-pcm-fiq.c                         |  4 ++--
 sound/soc/fsl/imx-pcm-rpmsg.c                       |  2 +-
 sound/soc/fsl/mpc5200_dma.c                         |  2 +-
 sound/soc/generic/audio-graph-card.c                |  2 +-
 sound/soc/generic/test-component.c                  | 12 ++++++------
 sound/soc/google/chv3-i2s.c                         |  6 +++---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c        |  2 +-
 sound/soc/intel/avs/pcm.c                           |  8 ++++----
 sound/soc/intel/catpt/pcm.c                         |  6 +++---
 sound/soc/intel/keembay/kmb_platform.c              |  2 +-
 sound/soc/kirkwood/kirkwood-dma.c                   |  2 +-
 sound/soc/loongson/loongson_dma.c                   |  2 +-
 sound/soc/mediatek/common/mtk-afe-platform-driver.c |  2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          |  2 +-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c          |  4 ++--
 sound/soc/pxa/pxa-ssp.c                             |  2 +-
 sound/soc/pxa/pxa2xx-ac97.c                         |  2 +-
 sound/soc/pxa/pxa2xx-i2s.c                          |  2 +-
 sound/soc/pxa/pxa2xx-pcm.c                          |  2 +-
 sound/soc/qcom/lpass-platform.c                     |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                    |  2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                    |  2 +-
 sound/soc/renesas/dma-sh7760.c                      |  2 +-
 sound/soc/renesas/fsi.c                             |  2 +-
 sound/soc/renesas/rcar/msiof.c                      |  2 +-
 sound/soc/renesas/rz-ssi.c                          |  2 +-
 sound/soc/renesas/siu_pcm.c                         |  4 ++--
 sound/soc/samsung/idma.c                            |  4 ++--
 sound/soc/soc-component.c                           |  8 ++++----
 sound/soc/soc-generic-dmaengine-pcm.c               |  4 ++--
 sound/soc/sof/pcm.c                                 |  4 ++--
 sound/soc/sprd/sprd-pcm-dma.c                       |  2 +-
 sound/soc/stm/stm32_adfsdm.c                        |  2 +-
 sound/soc/tegra/tegra210_admaif.c                   |  6 +++---
 sound/soc/tegra/tegra_pcm.c                         |  6 +++---
 sound/soc/tegra/tegra_pcm.h                         |  4 ++--
 sound/soc/uniphier/aio-dma.c                        |  2 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c               |  2 +-
 sound/soc/xtensa/xtfpga-i2s.c                       |  2 +-
 61 files changed, 93 insertions(+), 93 deletions(-)

-- 
2.43.0

