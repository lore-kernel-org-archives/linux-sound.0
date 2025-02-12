Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872D8F77
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739326989; cv=fail; b=CVW7KTS9XWngfygid54j0yPW6CcYkbtL/DifeGCJoRaiIdSNkoTA8K/8ZhD1uL6tUFjQe8xn8Ef0I7928L2mB984YuM06tl7FPoEBn6tHlJKzv5QYCe8yHXnjXUhr/skXY8llr1FPmQZjQEHbN8BVLk3fgENRQAqVL5rjhpu3DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739326989; c=relaxed/simple;
	bh=X2kOVQGjBOnlmCaHICSrCZdCIZA5P3sj12h1asccWhc=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=Xi+3NgAs0a3vDNu8PadIpzBoaer3k4war8gTzcsnmQ7KGz7w/UojhwgcOvWHFy9O1c0HrhsrVs7RjDXy6DrowKLJdCRIN1Cb2CWw90Gh76IgnxjIU56n8GpSnXBV2E+/FmZnEkj6SDtMWKZwSuSVZmr7fO+0e5n6o6clD2WWIrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cHmj/FIl; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cHmj/FIl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuIm71JBQpMCOw17Z1tL8g8KahzBe/HC+I6E1Ub7VdpWpgw332ZoTvEnlAL/jenTg8gD2LMD6wJCFE4hC/Ofx03HeflWCl6vnx58hcWVHOmFfBpJ/6KZb86Me4U2WW81uiV1Ra5uBuP5ByE/tHgD1GJUzbDU2Nw5EQ7+W+suRY8zOyDWdE4mW1DMzUluZzvFiXgV7cmAd9tq2Lv0HoyFlOmYfa+cBjEmXnnB3P8Mn8bhKE2TSRxsOVemkKv/fInKzvv1R3bi3fhaHZc+yzpxLykPAqpvrzVF8MZqFMbzUlslx9X0QHHqUETravhQCTcfBpbGA/ztvPzh6KtHBuy0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJk78ZSotR9P3ioJx5wWQwTuC069rVjdpbHzL+qiPnU=;
 b=LFNBOi52nCsTwuOchaNc0kHeyRurPhWuHOsltk8ZCAmoksNy6DzSUEatSycu7yv8gZk11hjZovukKJpQ0qkS2jMIshI3XSSjOMqrMHTixvvNXxf/9PBP7W8wJrgacUj4v4LY5SOOyEhSrwEGeq/DJzNlFECfV5yevK1HFUiJlIC45MVJPZW/xUUfxxRK0aB8ITw3TP6xrnmZKTz0ZW9nhq1Qnlsr4qo0D132gFRvSft6yWrrEHFReNuWEo/E79+C291shnZqFan7tiYVkAevt25l9qJ+R8imQ8T2GUCaRxh1RlVc4AzV4wD6BlIzv9lDWD1tLVI7rL9rP6yiRwKatg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJk78ZSotR9P3ioJx5wWQwTuC069rVjdpbHzL+qiPnU=;
 b=cHmj/FIlvYyu0VMEpe8OWkZoNxAiA4BbFju9u88O0gS0catNFKvb10XUsckhxOex9O1wTpVqxgsjqDUwxHy/jzevBxs9SY5EDsxjkLpbOg1zhMSZPW+jPHOYmCCucvXi6y7L0ikC/wfu6YYw11GHtJIPlcm/6pLyrqk8mAOM5nM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB13706.jpnprd01.prod.outlook.com
 (2603:1096:405:1ed::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:23:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:23:03 +0000
Message-ID: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/12] ASoC: random cleanup
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:23:02 +0000
X-ClientProxiedBy: TYCP286CA0054.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB13706:EE_
X-MS-Office365-Filtering-Correlation-Id: 4438333b-847c-4fa4-53e1-08dd4b0c2d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pmBcPQwMe9NNJv3ur6+l9fiGXm1qfviofKuOom7QB/urx2RhcLKjHK2qcAVx?=
 =?us-ascii?Q?8c4rhogvrZUSI363PEyFmpWNt2m9Vjr5oWDaoN7wzUe3sFGFJlVr7dbX9gVF?=
 =?us-ascii?Q?0x/gg4YcRDeOxyho/ulAkEWJmPekXy+hf1aJteHJnRNto3gkJ6L5MKwyN73U?=
 =?us-ascii?Q?4V0GHD4TdAQlxQSe/hKvwGE2IBPKGY7eBOsGKy4BlqtMwvfYMySiADaAjINV?=
 =?us-ascii?Q?IwG1nZUApOvHZf7J53e+0dRD58nIEZJIgqQlHQFV4USuzmQFS/qaXSYsjgG6?=
 =?us-ascii?Q?abLKKOOOSZP/cpXkVdycWfNwRKv25SWUQhdt+/CtatVIHiXu9qmmdE+bWQ07?=
 =?us-ascii?Q?lj+451gM2TPtIR0f4J5wBCU/Td/db3wn/vgDBwdrIQyniuIOtGI92VBpkKB+?=
 =?us-ascii?Q?KpK+GPfDLWl63cDUV81LUPfgqBi+U5S5qro/ANjVEcalmvyHmXiFztZeh6AZ?=
 =?us-ascii?Q?obKI9wnbETySUNYpNujm4RgIHAtH+29XafU4vcVSjeHSZuWK+vUfa/gLINnH?=
 =?us-ascii?Q?S231uln0bcU/GrY7+ZWtGrtBr+8ZF2U9xheN87VvCh3azR1Usw+Pcuup9l/6?=
 =?us-ascii?Q?cxKHrj9P80+32RXA+jm/9k2BI9ttKtI639dolPkhga1tlk3bVZ7JbTqg9oFP?=
 =?us-ascii?Q?17F1HZEkB/jcabHsF52pBuXpQZmV+IdRHYrSu0/AlAcL0gULtIQ6VZlZS4ib?=
 =?us-ascii?Q?HLqujtYq9hmCdX7ZMyvg3A0htlacmaIKy12kOUG23z6m3Kpwv2hQCB/8MP6h?=
 =?us-ascii?Q?1H4wfUPMEJjDNWLBr200SsrcVNrHB3qG85O9gyExp9U/pkG758NyoLPOnLHW?=
 =?us-ascii?Q?YFkAEIUh7NUCuD6tdsOnibUVe6JBT/tHheoqYIlBT54It9HETYtrWzggI/O8?=
 =?us-ascii?Q?sO1xBG2nwI8hr3BOvVcyUnSdZvyOhqZk8PqFT+VzcykAk8NcIllDFVGX7unc?=
 =?us-ascii?Q?XtaQhquu2ZhIvhrTG2yc9QlMDm3rPswG5DAz/m2Fg9G0iNZqImwWKmcuMPD8?=
 =?us-ascii?Q?NUrRTi52CDuEtjtrQ+JcT1BiYFX9dgwX+elBpb4XngRaW5/v7XcTwrI3TUJo?=
 =?us-ascii?Q?LZQPmz4dxRZi5VdT79GYtdZI2ReVNX2kVYn86iIwE17DRPbiL+DvwKfXls7Y?=
 =?us-ascii?Q?3LTWOXsS4FulMfqIJ2c2Wt+OnQ6dGkA61zPXDE4Bw1dX4W3PscsrpxxShzGy?=
 =?us-ascii?Q?TsWWivvqxAqpRfhLjjIfGbJX/dCQ88jajQnlH1bnU5ae0PAyAvSoLRFVW9in?=
 =?us-ascii?Q?KtvHC4X16JI/VulnYQrKHpQichgc4pElTk/kHmHXD08+WkuhNDmey+Lvmty6?=
 =?us-ascii?Q?H8XrLWusC9qRMmpFx3SHPGre3xZKfFEw0T0FvKf5NYJsaZTnOCQ6pAgYFsF2?=
 =?us-ascii?Q?C0AVdQMTDFivrcKqV2lgZ3oJYlH/61Xy0KHp/k2N+mKlSQCOcivpNVME2ZN1?=
 =?us-ascii?Q?L3XlYp1D/hl7U4ApmI7Pmoc4vpZSpANM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hbChcDAuqh1PAzpGU6IzQGhXNWKoXFPqy5nbE4rolZ2Kke+n+UQuAKw2/Xjc?=
 =?us-ascii?Q?dtxkXR61eVdxnhyKGTKBoEYL3ZCiSNZ0ECvU5GJxEY8AyxQ6F2wr3Rxf3rO8?=
 =?us-ascii?Q?uthMVykmMR2M5AWxhu7b7XUYTT+2HbnwSwGNMNb9/tB8sDg48sSOvWuFMTMi?=
 =?us-ascii?Q?bt2MHwIGTumqc0kMZleANNGmmmkPow+JPGAFisnJMUonl+iaxvsWklx46JQA?=
 =?us-ascii?Q?KPgws3XyHxNgg9bjcPj/gZkKiUwS/UmGra/g3l2w0A2TQ+9mnnxGdRlqJTzg?=
 =?us-ascii?Q?2TL5bfGsuYV0WXawOBv8HHKtg0rpxivmodTzEZHurDRfJG3pnJ8djSfSupY5?=
 =?us-ascii?Q?Y9wWckQLakI9r+VENoSysWATdFNFZFyzq33kFhnD8p0Kw+398RReGju2pTvC?=
 =?us-ascii?Q?YOwKO3cGPa12OSg45a9DSvaSLvmNJk2rPbLfFD07Ee3LigdRElPFa9Ec0Rgr?=
 =?us-ascii?Q?DvXxNgJJmjBESfVgfjje2Y8yOWDZv/v/5nilSCR0Gn0wi5npmHHphgj1ujxI?=
 =?us-ascii?Q?XxzAxBCGu8RRY7KrGWhAbXUtEMnsRw4tqp8w8eKIDteyb6NMJIl1D/MQ2kD+?=
 =?us-ascii?Q?Mo93kPaQy2LTNnRrmEkQzAB1DJPBAjX9/FMpe6N+2cbp2jh/YeVyRkVGfTM3?=
 =?us-ascii?Q?PN+qitVC8Qh7VKgNj79nDv1wSvG8mDmLNfJgqPuhbYc8udcB8IVZPbQs3JeK?=
 =?us-ascii?Q?DfcAHmUaM108pxZAhtzlpynIFO2gECXqKDRCWqvAIXRlbB+dB2VNw+fRA/wk?=
 =?us-ascii?Q?9hFw1raEUPfbkjFc8u/JBVY+Dz5Yhec2RzxrKot/N2hLY3lL5AeIgkRAUFMo?=
 =?us-ascii?Q?2Es+gzkla0oUgddIhgII14pVi2ianxdkTztoce3Xf3b3WseJJWVXzLMuno9p?=
 =?us-ascii?Q?peaUVaLQwbFkKhVKmqkOP6dWpzE6fs/wooM1OHRc5yOJ+KaQCt+lQCWU6UQJ?=
 =?us-ascii?Q?4jsPpJTbdPYR3R4jC2bvVKMeFUlkenZL4LPYmZx6XLM3vJnd2HDpeayqpyeF?=
 =?us-ascii?Q?OOeQYzJqGNHAlqUGGQggyf0dcQWxxZefaexlgEjSZkUAlcGrOuur0yLsQ4m0?=
 =?us-ascii?Q?3kxsPDNlhZN/ecDTqBEUds9VYi1LZK/U/jdNNYw7JkZ86suc9YCKCY60SfRF?=
 =?us-ascii?Q?NKaKlGOivBAlYX23e6f2MvkLJgFEssqaiV0zPLubBmcFn9xoxwt9U6txH/yJ?=
 =?us-ascii?Q?3KyUmCycAnmWbeDFnUD+i3kgMhR1FtR4LmdSQ7LA3JIOlHrjcHZwszzw+lFC?=
 =?us-ascii?Q?HD3nLfWT1hDnbXyzDPyI2ltgVrUUhxysPGM4rrec2ixARBma5w+lFehekBOb?=
 =?us-ascii?Q?hlHMfquC6AKDL1ruToHr+G0jjgorAvpMhjREWbUNYEVl9jUO0KBLmbhx1MNG?=
 =?us-ascii?Q?szV/KNmy+1Scjzola4DbtPNFXPp6K9zhtSy0IX41JuO/tOA/nnPGFMW+LR//?=
 =?us-ascii?Q?9ylD83xyg7wnpfY7SBSzcaoEhDEUv74NOFJOY4JDedVyMZY+Ryr/QXETlq5C?=
 =?us-ascii?Q?7xZ38Z1s1EjYJlwW99uniAicPZQ2n6a+Cn3AEDsFfZthzX+WlRMJeWaXiwh8?=
 =?us-ascii?Q?Ti5xaJGeM6t8X7RedGc2JNKHij4CAfRHgGahBI1jVOIRfL+dbg1XFycbm/Bt?=
 =?us-ascii?Q?g+H6RxOVxkIu78db6kAHorw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4438333b-847c-4fa4-53e1-08dd4b0c2d6a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:23:03.1255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqcnTpAuWAutO1aXs0Zve8fFAA7/jPHX6I9Dd0kVUAQe/ukGds96MlaoREnkrE9JepRFLdwh9x89TXSf3x7AsT2qesUdBvP5rBFlGXFMMXbs83yp4SkoYJFulfIGrpt0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13706

Hi Mark

These are random cleanup patch-set for ASoC

Kuninori Morimoto (12):
  ASoC: soc-pcm: no need to check dpcm->fe on dpcm_be_connect()
  ASoC: soc-core: makes snd_soc_set_dmi_name() local
  ASoC: soc-ops: makes snd_soc_read_signed() void
  ASoC: soc-pcm: makes dpcm_dapm_stream_event() void
  ASoC: soc-core: line cleanup on snd_soc_bind_card()
  ASoC: soc-dapm: line cleanup on snd_soc_dai_link_event_pre_pmu()
  ASoC: soc-dai: check return value at snd_soc_dai_set_tdm_slot()
  ASoC: soc-pcm: remove duplicate param from __soc_pcm_hw_params()
  ASoC: remove update from snd_soc_card
  ASoC: remove dpcm_process_paths()
  ASoC: soc-pcm: cleanup dpcm_dai_trigger_fe_be()
  ASoC: soc-pcm: cleanup dpcm_fe_dai_do_trigger()

 include/sound/soc-dpcm.h |   8 +--
 include/sound/soc.h      |  11 ----
 sound/soc/soc-compress.c |   2 +-
 sound/soc/soc-core.c     |  26 ++++-----
 sound/soc/soc-dai.c      |   8 ++-
 sound/soc/soc-dapm.c     |  60 +++++++++-----------
 sound/soc/soc-ops.c      |  23 ++------
 sound/soc/soc-pcm.c      | 116 ++++++++++++++++-----------------------
 8 files changed, 99 insertions(+), 155 deletions(-)

-- 
2.43.0

