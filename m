Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62040211A33
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 06:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740551365; cv=fail; b=XRo4LQm1vva0Qubqtm4abK0iqq3gAx1QmAUETiiqeO87lBJyZvQojXnk34vzfoRbw4/DKGo2pqKFh9Q9P6MU5ugkKPDiCgmttuIuKATz8bdMDNneFFxK0Ynbmc+28bKao3bFTR6J+AirPkkX/yXyPK2dkIpKj/JPfun6NcG/kTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740551365; c=relaxed/simple;
	bh=X/kC5CZR16uzVDcAx3+79T56hrtTaSawuO/rIOgCLPM=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=k/f6Zxr2RMXTOeIW6cNd9/HpuBwt9sfIusKSs8G9HT6rqPpmza0meG8amuoUi58L6eff9ZP3aB9XiOk3ka//heQT/k+9vCHQk/02uRLO59vB4Fc6i7l1Prn2/c3SATzpw7jookRg1NxHSU0kjBdnVOVlt7QZYSo7jPH4MaWC7vA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=njkaoLci; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="njkaoLci"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bkqg8U6Yj/4Gh4cNOTFyE2Jzada5fgqZa4tH0QcIYGpjXDc95QjgW34OgD0iD94pbguvZMawIrcIDAqP5dcxhDkPuZu7dQ5S12JEfcKER3qQN6MqLaWGyz78JUnklEgA96IKFSLbVOgIADA2uoN6ODajYrQG5FRyluaAk0KMDJCyp8A5bv9z0kqwMzR9a1GxM8msInOSWxkkqZl0m+/NKPPvC9JL/n1xVmY+z/Xwrsv6xdXyDwLTKK3Hbav9SyGpwQ9Gx7v1/N7ZO1gf3xPlWjSV+gTAK2G0lvve+UAZs4QVaFCAYGFneWsXrjb5Q5ilNdZcGrsEALdvT5wdXXk6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvRX5oYHCXf+NpAa3oSzxtYbBOVksrz+QASZe6HHf7U=;
 b=pFaqZIBtOyMT68UKCsaXB84uVOTldVeML+nnGSGEhHwIpV03QjF1GgYWCbnr8wG9hVwAIy2wgXLR46l+HE96/l+BJwXO+UULlgUWr8l0NTkPleK9icj3uo89UW+fVJp5A4HGXQN7WyrJFtciyMYyFva/lIPtQxkZqx38LKLwZ9H8ia1Pg2K0ljswGFmCc7lmuh50B8ckXGxbI0F2VGe/k9rcxKWPbKsUZzZkX2R1bQlqemSn7J+ZVUQdvAnpwXs28q5awJIQw6GcV5pDz2C5acLH+kzsXmF21WBJMq/iOP0y1Cj25b+VlTehI85zl+T4tnAmtxk9oUwZ78WFTXdYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvRX5oYHCXf+NpAa3oSzxtYbBOVksrz+QASZe6HHf7U=;
 b=njkaoLcinqQuiVvVUdxaqfDCwMe3I8O9cPtmD32pyW2OL6X64XJBvRQoHesOnW2G50zhi9+oyEtKe+CHA8q8UnXkr8fe/RvHfsh90yuMaqTHPTS5XEedctD+t/1M2dan6whUfEUes3mxUkceO9J4CbSINRZ8Gd3oyCUf9YToMcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7993.jpnprd01.prod.outlook.com
 (2603:1096:604:162::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 06:29:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 06:29:19 +0000
Message-ID: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: bug fix patches
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, Detlev Casanova <detlev.casanova@collabora.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 06:29:19 +0000
X-ClientProxiedBy: TYCP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ff3daa-f290-44b7-854d-08dd562ee66b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?cPhgHDBVUnT8oR4F/RYqwI0qms4iAIW9vkFta+ftaf2dBKptFmCGmqait3hJ?=
 =?us-ascii?Q?XtwUHPxy7L9VJJs2r8oxi3bs9Xrj63Pmdqc2cbeb6LoDiaQhH3TKldq6xDkF?=
 =?us-ascii?Q?ZNyt3niBYjE9Qnf6Kc8y+qfnrUvK4k8wfeMCu2ZjlnijOcX5QYsRGVVIluA5?=
 =?us-ascii?Q?gGkQdC/psOO7bCQKwY9oF/QIx+NJ86fRryaHKF+fcWqS0dN+gDCmrOsx+f9k?=
 =?us-ascii?Q?ErMrqvctrmtU76lWVkb5wrH0h+nnCKllRHVhee+CCkoYz1oqfFksvFkQlpko?=
 =?us-ascii?Q?xCm/vU99b32rQJTiNIrfADRbzm6XtcE2wZumCpM9CF+jTEAuySMGcgEjUL18?=
 =?us-ascii?Q?I7Utst/gSmVtp5HtUHw7C+vsRBXE7BhMkWNEOe0UEnIUU8N1Q8x+QZF+5H5+?=
 =?us-ascii?Q?cKAQRBSMqXADN4qTMGBQdA4kKQjoZNikR5xPo3VDAgX8jxECYacIOqRXMn+5?=
 =?us-ascii?Q?DPSfuMSpO4jMwzlpoMy345f04W6R1hClB2CxNzzCnHbZBmvKzev6bFt8n2DK?=
 =?us-ascii?Q?qtCBemhR/nYAQMtLTiXoOdyzev2TpXRhrmbxLGfxZxUCgWey87fviiDsVtSg?=
 =?us-ascii?Q?0pxRAchelO1esXeilSWliiXSckoVcWTDgprOhowq68v8alJzAgOphqmjKGIE?=
 =?us-ascii?Q?xurxhMZU31BpPE/qaTKF2k71KortbkASjzKb4JZwW/70l989g8A6bOagTPGj?=
 =?us-ascii?Q?aBt1cjWmBtUxRHN1My+ew7SP197iBPNDCZszTBmd/EYaqxwqL6xyNg7SkN9f?=
 =?us-ascii?Q?XVWaGnbvFgJmSGPC6WWvmGGIHQ8zSiJM3GfCUJWTCuoswsxElF15fkouifn8?=
 =?us-ascii?Q?Tq7qg4p0K9QZv5MxPqPD86ezpOSlu1g9nj1qybEsmEAaNICicalFZtaC69Zz?=
 =?us-ascii?Q?ezHgcZ5BXuU7vQ7ViFwNWWgHiJeBpf2tYQ3AujUW5ihBeze7xcPQjzOqT6TN?=
 =?us-ascii?Q?/lFdHfgubB0qZm3WFbaC/d1DAbdX9WncKCYJ09YeAG84s40q3UtKwQczhXxF?=
 =?us-ascii?Q?uJf82hmhl92xsgh2+YzAoxJ3NuXSG697qeVu4LAqVgPf4eTL4bTkzH2bSO9g?=
 =?us-ascii?Q?d4waATym2lAxtYQV0dibCexdjKQf/mjHhwO5sFZcbHgPuqrvRGYTOWIPFOg9?=
 =?us-ascii?Q?hSZcrwIWK9m2fTnl7j9JoNNLoEE0/wV+qryqUhlOUjlrHon+yaaobwzPdP2Q?=
 =?us-ascii?Q?gOW/OM4tpPcegNgnLqJyCbrepH/CAuiumzjoBdCP5/mAGb/izgmlzwgNk/ZM?=
 =?us-ascii?Q?vj66W3uo2/jmuG6Rsbq9f2xKABYFrF13GHRUDFO+6r76jQovbJ0MjLCFdaTs?=
 =?us-ascii?Q?HbR7UPcntEjRFFk+LX6lrjvxIqE3+SdBHMK+xAHsJRtC3v5o4riFC05Fe5/g?=
 =?us-ascii?Q?9qFvOVpIrUM7sjegVBgMI+bsQepQUmzMY7lKikoRkQOiaMh7X68MmaNrB1o3?=
 =?us-ascii?Q?C7HDXsP8LzA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?zc8fsAZdzaqSGVsosppNAr+qixLq06GwBtEyacLKalMuB4Ju6tknl6gsg20U?=
 =?us-ascii?Q?tez9fAZVo+oxfhBqd8H+DA8irvzeJcNwAWPD//FLUCRlcBcknLZbeXXgSXmP?=
 =?us-ascii?Q?EAkB9M6jCbl6Xpr/AZKFTev61jkXo+1y354m345NbFdoz/r1lNTMHYNo2843?=
 =?us-ascii?Q?7ZGD+XR6kuWZvEHIxSIGsVGb7FLdC+3cfex9tPdRm+8aegFitoGNbpG+6Rfr?=
 =?us-ascii?Q?tIcgVMHp9l4xuSq5XvLu8DfDbPwOz4YjB0FS4vyYX5PyDgR9VouYG9N7ZmZ3?=
 =?us-ascii?Q?tQQYarY+/MBlbZr3DG6/CkTglfrXF+7C7gkUJFZ4FeImQXhzwnigOqvM0bXs?=
 =?us-ascii?Q?YgMzHxNIEr3Im9h5tgPkhzvcVZT+PE78oUbOX0HG2s4kpO/YXcthbb97vWJG?=
 =?us-ascii?Q?cgp/0SY7xrB187RJbzno0zGwzP3PKLyElZ9yF8G+A+ywBpmJPauvhmgQg4qW?=
 =?us-ascii?Q?d85dUdjyw8lEkVTMGJGHOEzxUFdBadaxqoauiIZjO09qxixP6UA7Xf9SmtKQ?=
 =?us-ascii?Q?lNo5zBJcTSxblNgRzw1+lkdkFtfiU63Yfru6lFQR78dslQhu6hJjv9uc3/Mc?=
 =?us-ascii?Q?B+we8J2NlLMg5JwapE4oDFO/VRYvdszc4cn3NoV4ZsllHbZERRU8uH83CblU?=
 =?us-ascii?Q?habk5eoWCYETghLgsKF6EW5xSzyu63XPrHKKBWPaN8m1IWKpOe/sl4pZO9zX?=
 =?us-ascii?Q?nJLkigzZBVOn+ejiaHcEgYGhPVD62pM3qwmvs6vhfvdOL6vgyu3YZLle/EUy?=
 =?us-ascii?Q?d4ZfZzB8+5KXv/XMn/8GIHbA+PjZDAmMZnzNLBE8tLTVTjRu48KGXbX//Ksl?=
 =?us-ascii?Q?emOHT7/70WyatH5CBSVg5vk8owMK70GzLA0Mzv1/7d63YcalwnPZ5YmhkPQR?=
 =?us-ascii?Q?EJ//+8mA3Ph2SFQ9PBTd0AWob1DMqSejskRLHQIxRBtcSbZN1dURwXpngD9B?=
 =?us-ascii?Q?R5Pm4yQF8g/XcWPUpnNJ8sNK6fQ9XmRl9/PpaXLpFPo0MBurzFCTRZswNSGa?=
 =?us-ascii?Q?nh0HnVQ8Vpe3S4pGKhLqptMFBzebKkoTNfSwmCOb2VP8t3OCRvRqQUdM4LQh?=
 =?us-ascii?Q?WTQkccTUNTdmd2VVjwPSgdmkSus4XTwZ+JOCO6/P5pZ3HYsc0/zNqKZzn/gJ?=
 =?us-ascii?Q?jLcDRpoIsP1ExWDvXKJGCjm473eVIKTBBhWVgw6S2Ra1TmWxnp/6+FVx8Qe4?=
 =?us-ascii?Q?DrfJfMByA1DdvjbAVCQggtYjJ6ELwAFNk0jtv7Tvajg1Jpc8OQ9mbx+vY/q5?=
 =?us-ascii?Q?KiMu6Hc/3vO1jyIXbDryE3RHNdVnPmsbDjLaxqBzKdjJplqUEd07NgkeyfP1?=
 =?us-ascii?Q?HKGc5Lmt+HNUD1fI6m0sx9tcP8ycXF/kC8rX5MQIYdtmO90HByU13KRwU/Lq?=
 =?us-ascii?Q?t8i0YWGi/jY7D2s+K+yT0tiSXEebOIMGQunpUCSfYcVoBn+5LPG+Htz7lKZ4?=
 =?us-ascii?Q?DgWXv8AGgDSsfLTrY4FxLsxn53lTyO3c05dpA/z49kQpnNcUHjqGvI8C0PTn?=
 =?us-ascii?Q?3ysxAfibEpnZ4nFyGmCqqwyktT2VtqwgCWN85qurCDfPr5lGsmPdL7pFG+g7?=
 =?us-ascii?Q?bzFpd5FWlndNtRfKqGgoefxMYKSjo4iVqe1KmikP6V6DtwaxTluX2Px1vaI/?=
 =?us-ascii?Q?iz+sC4XoMjwD17ttr42jNNQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ff3daa-f290-44b7-854d-08dd562ee66b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 06:29:19.2056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFaOGHSbl0KvGtP46dIREwaEAfsW58AVlzhu6yANTj2jMcIFekg9T+lGX4Nw14iw3RbRKdfDEyhun8Wx+TfZ9Tihqz/U8WmpZY7LGlr0Un/pAcKlnQREThbvFd6AyDcC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7993


Hi Takashi, Mark

These fixes the issues.

asoc/for-6.15 branch includes my patch (419d1918105e) which uses __free(),
but because of it, it has of_node_put() count underrun issue.
[1/3] will solve it.

alsa/for-next branch includes patch (0ecd24a6d8b2) which uses procfs,
but we might get "already registered" error.
[3/3] will solve it.

[2/3] is cleanup utils code which is based on [1/3]

Kuninori Morimoto (3):
  ASoC: simple-card-utils: Don't use __free(device_node) at graph_util_parse_dai()
  ASoC: simple-card-utils: fixup dlc->xxx handling for error case
  ASoC: hdmi-codec: use DAI ID and Name for ELD entry

 sound/soc/codecs/hdmi-codec.c         | 22 +++++++++++++++++++---
 sound/soc/generic/simple-card-utils.c | 22 +++++++++++++++-------
 2 files changed, 34 insertions(+), 10 deletions(-)

-- 
2.43.0





Thank you for your help !!

Best regards
---
Kuninori Morimoto
