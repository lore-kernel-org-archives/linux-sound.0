Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD292E7394
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 01:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350372; cv=fail; b=AXxJ94TxO18eilcWZctPrErRAGyCIJWzM5cFZZKu9cGpin8rG4xqiEzTGoJlUB2jfl8cOpMvQBvk4epY58/f+8umM/SJ4pglkXC8uFqsWe3pWx0A+UpajSW5zrXJKrO2wiEsYGAhXqshNWP+kj4DssvPPNN7wDdyNOKjB0g5SjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350372; c=relaxed/simple;
	bh=QRzWCLlP9dXY12Lp+el6FLDkzvoFIuDMUs228my7U6g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lAdpbONt6GNd65ozz05TcTMVIk9cCY8WoMIovPpX+4WazMN+3FaejUZCBvem6owtPYt2dglu6/36Oa6qwA7tAFy0wdJ61KZVkehTIyVsAlQyI8uNR3n5QnYxwaWrAOri99D+otO+5Uw6ak83z+h/rcs+yelueQrGVW3NNnX6+Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZhXvIYpw; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZhXvIYpw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUFDSIw+F4fNdkei5CslpTRpr4Hfeh1ft5ofTCA2nS6KqLVJJUaT67+tAnwStFT9d2uBb+idorP8UFeiQYQpFrnsN7Hcv6AcHqkh46mVtzFgzDEdAH2ueS6DVEbw4+NpxAcT2gqdOlgDwEOafXr+FkU3QLf2DG9iOh4VsVxzZyjnel7RHR460XS1gGpMSegCh13g/W2+IQh6TCHuNCC4U4rlS+Z32D+wvqbNTxm0HLt49jVNXpZykI+SSgYfwt2N4oR/XVt0ZiVargQhHcOQX3nj8m9dlmPfTfDKaFCS2flMQbBAM+UYTzz3+bc9/CXv6/Q0JhAYYvNPAuDArnyQNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrAVgvaPeHgO0LZovvqKlGPIsaLIMwSVPs7jpxGJfTY=;
 b=N8lQV8Jli+XiK0S3gwjrhXJOcopESUsFZeHtsHpSa6Zua2duoI5obapSEwHwZUaCwgD8KotNDixw1CKOl+IJ/x9EP1gg1IjzZ5t5y+/EkWl52iFdiSGJkJ8mZ/tKRM7rC7OsvJEzsOfreLlnQ8F2Pvykzzf5gh5eAG3UI5Y6pwJl4G4NKvWHJMN4m3n3WAdacZca3bBqLReiEWMEMZTQyKILuSO6WtiJpwrdB/zYiEoGvhiGdZkO+/hI3uRQaFS+lUarsyqIhAtVMFLW9dt7fIOPD88+xvLg1lZvBrbVhoFwzzfG7bUxHKzYvClUEUmvmjfPW81H5/co2VAHnRq8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrAVgvaPeHgO0LZovvqKlGPIsaLIMwSVPs7jpxGJfTY=;
 b=ZhXvIYpwPvJsTlUUYx15dfxRxfylgj0av2oHEOQnclhsHKWYEvg7HG0er981bvF/oIlUduJm9np3ppHV++qyavQQhXzcUtCVBC+rEnqmzxuHhwCMGEzVf/L23U5kuGNlG3rxW5T+wEvNfLJiYf6f4ZD8lz6+V86fgkkrRRwgTAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYWPR01MB7202.jpnprd01.prod.outlook.com
 (2603:1096:400:ec::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:46:07 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:46:07 +0000
Message-ID: <87ik48li5d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/10] ASoC: soc-dai: add snd_soc_dai_{set/to}_priv()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Maciej Strozek <mstrozek@opensource.cirrus.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 01:46:07 +0000
X-ClientProxiedBy: TY4P301CA0114.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::12) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYWPR01MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: d245e1c0-fa94-4c2e-539f-08df1201f1d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	/9II0ACAeilOE6pOeyQHX1chDmxLYg5UnGqCNFiKLCWhuSZmXBWVQq2tcmPnkoyzulQGBMvvqpcG0V7eMLhEOaph9aAwEBmzkxOumLjU3ilkIRmVm4w0YxmtWuoQT8/EbyzQwCsORCrZxVFlcpn4Cj11Ui8MZHDNabIpR1lhXuTwbBOPS4JC8wrcxeWCqCejXBhWLTSYs2TA5gyukv/gu7x5PeIC60wDL/UPg0b/myfUg4Y9Xsttbd8BzDd1gd020McWVxQRf6PhUz1JR0vULN3QArJebhFa5VIuwZXsDsqWvdeLGELdXUsnJao0xgKH55xd9NcYZTQ9wHbVqYvoILWXK2gP1QtnSEGkVkwpepIF+QQ2/H2AVZCT9onCPoRJiVaeQILaYNkb5iVgUDtAQ+vrm3oADek5EOaaYb6K4WmlqxqcATgap/5KobXZpn8DUk6txocV4spCci7kTaHL02uBVtVx0EtYaZyNZvte9dbg8lEFhntbOSGUVAH0tBcRfRxyvQEWj6zQQIRKAWwUT5qrTPSZr4JLaecMXwbf6iU9csxt62in6ruejBH1L7QxGoKRAQ86HG1f/RATgB5WZwvm07JbzjaqkIttOwDE7prHrkoxe+f+siBxGxwAsn+5z/N8Z3ybHxZyTAH52DvdC0VVv0dntMcKCdACr2qsrDM9q/e2VGXBNR0o9C5i5JrncOGnrYxGC9PoOqJT3u6h3jX9hIDQ8MezleP4//sFGqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H3+TKuQPi5ngJZAInpLT7ccPGl6eIuzx/IoJdwfCcIaVF58sm+rk5ItJ0xz7?=
 =?us-ascii?Q?80qazMeVKq6K2ZP1jlBorZEF9Z0UWaHNlAg45WIb2acZHHDdzt8p6/xLnX/a?=
 =?us-ascii?Q?C82l0bpH7N9vFByr4nz+g7gLagjfigOmITPBPv63fCwovSifwMo3DIN9khLI?=
 =?us-ascii?Q?lPcGo6mUVzK8JwEK2lVxDbLdfNXteI7XZ80Png7E6qZRyGH0jD+Gw73iRIjW?=
 =?us-ascii?Q?445RvrRMs76dID0dTU0XlaF7/YW/hwpGaEYUm2If+CcgHrT5MJODnkK8olUZ?=
 =?us-ascii?Q?r4aFk347zXKPwcbMP9uZVkEmzVCopAnnd+lmeX4gyIRWx6Sy/22CFIuJVRu8?=
 =?us-ascii?Q?W0v9OeGY4UIO13LJ1J3ZIPK3Pn1ezqxClB11S3Q2ufdfDyOi7rVIxxC+LyO0?=
 =?us-ascii?Q?MhIzU3GIUk7iRtt6TXZ8bpcGS3gFUNZ6RL9CY1gkFJ25bOqwJc8IhZ4bLUnU?=
 =?us-ascii?Q?BytacqU9K3s3gOvZyQmJeLdCSXe3wMP+iow4UqfitAVAa1jMx/oIfNcv2z9U?=
 =?us-ascii?Q?YvxH6y80fmeTtY1vChcCdJ23jhBILWDoWzESQ71MiJTdaGXj9ccBV8iIAfvZ?=
 =?us-ascii?Q?QCyk5RpMshpChVMJTGq74CApYNu+tvsl5uKKVAy/n565+j99DggtcaAxE3wR?=
 =?us-ascii?Q?5VXBujONWue9pMYne+Lg2etjAES+AyXN/EFyKYcvp37GcLiNRppNl9kSawRE?=
 =?us-ascii?Q?BcKhN7eY5Q/CiOIoJkwIfosXT2YjMpSZ87N1U33orVExBaZhxiyhHXrgWNVG?=
 =?us-ascii?Q?1tfRu5IuGHueVlhlKDOZqePomMqXv0DdbunpHKHrTCcxKZS/XWimd3sLINd0?=
 =?us-ascii?Q?l53FVzcHZjpRoeiivMQMgt717NQkjcSNpmGGWfvbhE1EtYDbUmwDTp0bcAGc?=
 =?us-ascii?Q?RvyN/tBafCBA67mlou4y5EnoNKhE7qEQusx22tdSt5bHGgQxW/ojRCuJnuH7?=
 =?us-ascii?Q?5JIupZUCIFaCX1C9qkgTaUx8JtdtW7KR3kjbh49YGEkpRm4lGggmCooTO/uq?=
 =?us-ascii?Q?zc1HimjaO9IUeHJ7wJQet4tYwImSBVoIQMeDb0MclTZov74HwaLMStNxehrw?=
 =?us-ascii?Q?HD8GRFEXGsvNHjF7LMENuGNbaU+3EIAMuhtLFIDUlYVG56I4NQ49uJLKbSAd?=
 =?us-ascii?Q?1U/r+PpwCokYG/24X2XkoELUjecLZDdSFxoK8g+kBC62nc0NE9lPE7L2oHOU?=
 =?us-ascii?Q?DAS7IDN5moMUm/ZUdl+N8a2kn8/ZnF9oD+T9hUg3KK5dQVw8YNQJKDgaHncN?=
 =?us-ascii?Q?YVv+AOxQPZvuTdwqH4DS/51eDn/6eImEa5TMSjxyvtGDHiynrYeg3iqgm5X3?=
 =?us-ascii?Q?WPNJw8xFV/S/jncZXMVouDoCLW9GoM9aLElRcx/375mJYZsrFmigIvo62JM8?=
 =?us-ascii?Q?PfqkeaJ4WcuOIFTXopxnRUJK8wSVU2x4n+NPdoNKkEPtgEk+PBL3mQ7ni013?=
 =?us-ascii?Q?R2HCiEGs1mA8DMT+rxadVzVWblutIOU8fgquiYOgSDXIjuod/PSB1v4JXL+7?=
 =?us-ascii?Q?55LQHcfdCPVesosSUrHIErDabXk93DKVp3slgiC0n1ngRL2yypcEW/q7w/tx?=
 =?us-ascii?Q?Go1xsX6XWGujjux+6mFDPdY9jOkS/5IrkLeKhIQbRa1Cx7mPvcM6ixp1Mebq?=
 =?us-ascii?Q?C07uVwNQbeogaM7C1Yg4AC8y+3bMilDMi+GxwUI2Ndy/QjdnQWyJhJ9Ll8GA?=
 =?us-ascii?Q?l7wpyGntvHfqBRv4Ke6bB1mudPdxf4uIL9i7oZ/ScJcRuJYFNTLms+d5RH4Y?=
 =?us-ascii?Q?ixGNFErd11Mu+d8mq+0gpEiKZxRSlDGQKhq29iJ5ABctMhzfEM+r?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d245e1c0-fa94-4c2e-539f-08df1201f1d9
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:46:07.3589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eg1nYRX6zFcfeVrO+ACPLcdopVv6r83GMyn+TDOHokvFHgOaegnsGFroY9VtpcA2/xwzWfNqiCAyzkWI7T4nG0rIlkqeQi0yudkXvyDEsAkawPjrrxSLNcBgQjcD6Wen
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7202

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. DAI priv has been mainly referred from SoundWire driver.
Let's add snd_soc_dai_{set/to}_priv() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h    |  2 ++
 sound/soc/sdca/sdca_asoc.c |  4 ++--
 sound/soc/soc-dai.c        | 12 ++++++++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index c5544f1789425..e91f87ca57689 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -567,6 +567,8 @@ void snd_soc_dai_symmetric_get_params(struct snd_soc_dai *dai,
 				      unsigned int *symmetric_rate,
 				      unsigned int *symmetric_channels,
 				      unsigned int *symmetric_sample_bits);
+void snd_soc_dai_set_priv(struct snd_soc_dai *dai, void *priv);
+void *snd_soc_dai_to_priv(struct snd_soc_dai *dai);
 
 /* REMOVE ME */
 #define snd_soc_dai_get_pcm_stream			snd_soc_dai_pcm_stream_get
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index ce2e7c2707657..ccc579f878ff1 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1507,7 +1507,7 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
-	dai->priv = constraint;
+	snd_soc_dai_set_priv(dai, constraint);
 
 	return 0;
 }
@@ -1523,7 +1523,7 @@ EXPORT_SYMBOL_NS(sdca_asoc_set_constraints, "SND_SOC_SDCA");
 void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct snd_pcm_hw_constraint_list *constraint = dai->priv;
+	struct snd_pcm_hw_constraint_list *constraint = snd_soc_dai_to_priv(dai);
 
 	kfree(constraint);
 }
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index b9a3d29d60914..1df58861c8388 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -32,6 +32,18 @@ struct snd_soc_dai_driver *snd_soc_dai_to_driver(const struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_to_driver);
 
+void snd_soc_dai_set_priv(struct snd_soc_dai *dai, void *priv)
+{
+	dai->priv = priv;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_priv);
+
+void *snd_soc_dai_to_priv(struct snd_soc_dai *dai)
+{
+	return dai->priv;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_to_priv);
+
 struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list)
 {
 	return list_entry(list, typeof(struct snd_soc_dai), list);
-- 
2.53.0

