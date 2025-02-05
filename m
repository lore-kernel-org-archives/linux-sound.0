Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0D74C6E
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714585; cv=fail; b=kjz7x0FKEmg0wficOlZQrP6lBfMBi8rqg3e2/nUPREuB/0lhi0Z5bpSql1BZ6nwtCZ+8cuOJno+ePzsjtf8gq/jUojUxUj0kcGPduMZetPUKIdqGj4wdnXWwQHNqV1R6DxlhFC28xbtcZ4Uasssqt69eoHbJiwnL3mL5+woVdfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714585; c=relaxed/simple;
	bh=A7YiVsue5VvvxZlhlCucooQJ1jqNZtS7Z5+RPKEt0Ng=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GROPFvyqihEgyKwart9En4V5jHtYvJe0qbggX9gBRLYlsuI2oMqAG8URLKomturiw7Zdo5GFuNE9/WW3KD+kGRVTzCNJ4kH9ERaip05wRUrhttEhwVNUEF4Dz180uhNyaBqbuATqBczF1YIGkAQ1Ucm+DLre205Uf4+mOEwporU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Td9aoFZc; arc=fail smtp.client-ip=40.107.74.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Td9aoFZc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cODk3yJW74ADfCbTR607PlQidrIZBqkHTsHp2h0Ic8YEtGFC9FG6fDB1Js4d+iaqeHJbADpDZvJ8KWvlszBg8RxxDURFCYkcyGw4/aXzpZE2AVdtSmsexuPqAV1Hg8JQ3leycOk830pfIu3oGpKru09EgOSrXoOrJdPybgSn2SwzYBPU5+oWbNhKsKQmqOxt9gyaNY5qNPa+Ezu/wCv5XAb1Q2ViNee6VBBQKLqdw+TeQF6DR87eSc2wgADB0O+LUOzhLwrPra+tkZwc5K78Kl6YPr6Xtz5VnY0DXb+hGzijo5H4Jg4J207+HFiQEjO3ZsvbiE+4SMBuLO8gFepamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSZXzy755ku0916s7MgbRyhMd/OhV2SyZkbnFN3OOlk=;
 b=eE3mnzRWHDHst6v1W6PJqnV5ZOMMN7g17JuZvvSZzjl8Ko5Ie0/YOXc3lVDJsQjPDKbCqzvbzCcOB5wfUKsoh6jfet2XiAijfl2zhR1yQ+NmKRzqjBGzJGiAdM3GAhsTxMH1BzxZzUiOmbsRZRn2pzbLtO2ZJHVcjhfAaL288JEzJA3Y54/4T53mJyzfoHz9rtL0m91NbsRSAOEstmiFTQbLnCRjvDtLb9bH7A5OMFBiqOdjdbi/NDJ/hHCfotNru+LdxSW+Z4pIUrDwTbl8tXWRDrPJlJlTwoIkQOWc8WEJI+lu0JPaZcvTy7NrZ2w16CE9uAD6UzZjXomB+MLmUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSZXzy755ku0916s7MgbRyhMd/OhV2SyZkbnFN3OOlk=;
 b=Td9aoFZcjdey3L/gmvRhCk1TXgHLGGrqp58wdDPMaMMGlEZ9BmF1EvnrcISsYAEID0hEMNQXcbOToc/q6gs8E8CDwmLs2Ez0yknCDYF5BRXWuJBSuS4qqdzPtL8S9O/s5ATAQFYjx/n7cVuEigFAOkKI7eY5tiGB6jjjkpcwtqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12774.jpnprd01.prod.outlook.com
 (2603:1096:405:1b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 00:16:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:16:19 +0000
Message-ID: <87cyfx2qlo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/7] ASoC: soc-pcm: use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:16:19 +0000
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12774:EE_
X-MS-Office365-Filtering-Correlation-Id: e6482107-3b67-47f6-72ad-08dd457a5096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vF50EeIRy0y7OV5I90mUspIzHelOt/z2jGcyJzqPHu/NLjxiiatAWMBmdYQZ?=
 =?us-ascii?Q?+U9DyPc1myuz7Wa4z1ndcEVP/+lsmn4Q4S8ppdHaN4sixM0VQ9XaWz5U9Gse?=
 =?us-ascii?Q?20WKSNY5YPztyEkyxvNEvQWMAwfwi4xNNjdUjr5xbngSHvP8aVWvYH8ZLzJW?=
 =?us-ascii?Q?sSreWqLYdYSPDwhFxZzSObYyfAQIRRpLAmQW1JcVqL7c02pgM3YOVDdVtLO4?=
 =?us-ascii?Q?gnW4GaQuTqXn+cgT6XVdxI2gv2oRgzlg8pgVHE1iuPBSFvBiQ3tINywO0nbi?=
 =?us-ascii?Q?ZF8NvNyW6kgrZwqUM81ixiHt88oC3xBqPJYsbo8Ll5/7OXYIEnuqXswTEzK9?=
 =?us-ascii?Q?Mk9m+soan1ZEYYrjavBhScUWNce5fiHzp9XWxAV8uztCKcmccmRwcnaelma6?=
 =?us-ascii?Q?dD6azNjyZ6xBaiV02uuUBgdgrZGdZg4SQMcrx+eYQQr0Dl7KxuqfAqEFVCNG?=
 =?us-ascii?Q?FShoWIbM0r27u3k1+5eTgD/pNJuQHKSQxTO5AnHy6oyikPDAaLHCmuYCPzid?=
 =?us-ascii?Q?Rjz8FbAZkmti/jXNpNFjcAyOSFAEIWFYidzJznCck2Ce5XYrCxTxfuJcB+I1?=
 =?us-ascii?Q?triy+4TYxm2HgYBkr2TS+PF9LwMvV4dLBqBuNMYuK/J1RSMlZnM0fsOQLHYo?=
 =?us-ascii?Q?ffqqm4IyUTdMJRHK8TE3s731ZRpnEUde092vO2ATcme+jh8PVYmSnsxuXHwz?=
 =?us-ascii?Q?1nsVRKY2eqkrPQ8QuwtlaJ3cz3DqIYY4ec19ufncQcJ1GoanFrYgTKrxY5tI?=
 =?us-ascii?Q?rlSpazh5zFCXBAPgLStd6I19Q10FaW5CA81h6hBRx4HKDz65nXseVH/6HodS?=
 =?us-ascii?Q?LBkeAHewwGdIF54PgW55JiHyb0APFn+PZ06hPT7NL4L9hMjWUlA6RPm+BdZG?=
 =?us-ascii?Q?S9ZcF5c4e5cHnfzbZmwxfKrxORFJEObpKlUK50PNFju2KmhkeX2AZyo6pnsi?=
 =?us-ascii?Q?F5SksbwDfpoB5lLhlQpWSPSupjgSPfe45TmFO0HXMwchBul5HWHeLQPthe+9?=
 =?us-ascii?Q?Sx0Sb8vbXuHKxlYgdkO6WLKTs4MqrJgbeszN3+oxA0jHIfNZBos1TE3W8HOH?=
 =?us-ascii?Q?aYFki/2B30NQNDs9hVBjRT1XuU+KRHGBJoQtFyRf1a/AjhEDBuPTrbuxLxaa?=
 =?us-ascii?Q?1yj0eVZgMldDhvGXtE5k824z9UbA74YUVnh+ERdiWFf83bIisye5EFq7oLEo?=
 =?us-ascii?Q?CvLGWYDC7qdgM6/Otahnwxfd14kkjQLr8FzR2QKq9Rjb1gFOjzJfYuqPZhGY?=
 =?us-ascii?Q?gXMQ7JfQKo4JKQXbp/p8/3zwaKMlA0+xSzYslymkS9emo/mR9l5nSmRNaM+y?=
 =?us-ascii?Q?dFG0WlAZP81eeIeYDsF+JPeKs+2staV61CTRcp8zlcd3lOJ1VayDZ+bOWxdX?=
 =?us-ascii?Q?dIYEcs29ODCAojgqnN9+I4wFkTAojDq/XwpIMZ/BjzCd1ccgyKRraFr0jk4w?=
 =?us-ascii?Q?MvP1eIPGJ8Ga+hvKlmx/BkPNXXALsdpJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?By2x97ggIwOMy5NGw6iwQrShQry7WLh2iekhOQJH2zR0WVR9fltLG7ErCwC7?=
 =?us-ascii?Q?wK7M/FKwbawhc0QPifU6PjyNMjUOOTXggEcK0l1gA1JNszzlVBmRmUEtY5Ym?=
 =?us-ascii?Q?reTp3PXF3Oids1rHbnUZIUeEC9wNP++jVKQzo+0FBLHNr9fESPjQzzW+PROj?=
 =?us-ascii?Q?tu5de6djnA3JkvuDtsjGbAhx7R6QEYzbpvl5+EKDZyWENsnwrwWubo0d8SlN?=
 =?us-ascii?Q?SkEgjTjDZfWC6OPrGX8OQGG1FEjhFC/p7UBJVeNyly3Qg53XmluenN41eGbC?=
 =?us-ascii?Q?w2Uqg+cj2svfyCu/yEXJJB48OgvR7yhzzOsllki+DJp7TBDB4WXM7MyAPcEL?=
 =?us-ascii?Q?kbpRG69HNzfes2+PY7a7LyJGfFHs3PGLuhl8GKism15HkxHhkhk0+tdibkmM?=
 =?us-ascii?Q?04u8WI7hgDZfNMkE8yysWhrmyTpKo7gUip3yIeE03P2Zp2qsG+6GOOsVIdkm?=
 =?us-ascii?Q?rkCpNx27HP7OzazI2l65IIA3ShYULVKXdMgEJbvEzLh7yIiY2MVr3YOFjhKj?=
 =?us-ascii?Q?+OOeaVuLFCHxbvP6nUuzsnGPYfVwPwfxWWG4MqJShznc7AaAt9vhXbfMWC7N?=
 =?us-ascii?Q?ulqn6z3m/cIBNAcxCWOjecFdKDVEht7P6FTiL92sXmes2j6juWCzn6n3DpJF?=
 =?us-ascii?Q?/FxoG4Cd46NonplfbTFKVclnN2duzdex6bS9slv8uGNjHl3VIBQZcHWoucRH?=
 =?us-ascii?Q?ngyollibj8uQ6duAhJgY6+6yVFjJJ8n3zAHU0DmPfMbCFzk08f9ZOsY7KX+G?=
 =?us-ascii?Q?3IvydAJsterMmpZEc21Uq3jZFiZYCYb3Ay9rxe9FPYBtmIb6ogumnfoURUlw?=
 =?us-ascii?Q?vhKX9po9oW8bt5jAU01ftLhoVudGu4msxgg8bRybMWxtL8T32lS+NPRu1mp5?=
 =?us-ascii?Q?BxXsyuvnXM1oW6FyH9KiTE1U2iCXhdHVI4bhyk4VtTHK2bz1bJDN8LgU/TX9?=
 =?us-ascii?Q?w5ftgr73AYk5Ckbe66sjAFNBKxq/OHf6mmcAd+4bbhIjT/dYMv3/+0URWXYB?=
 =?us-ascii?Q?mv0sdl3ATf2DNprCHFAfafVOvMm2QLpROVBF+bHjCsgNy8NphxJHszurZGJX?=
 =?us-ascii?Q?GV4ZWwCdYiNK0pgtZenBdEaLNXpkOv4FJ+oSM4rZ+F5ynLIAMXgWVJw0oFd9?=
 =?us-ascii?Q?lpRweIeyEERAFupcgrbFthPAg2KZ4BsXo+w1c3YcwiLZTVaO9vFJ4cGvU0om?=
 =?us-ascii?Q?3lt0bYArof1RUs4vgp+Sgpd+fO4BzZtz3jzeRF6CDSrwn90JpmsNv5VjmSw/?=
 =?us-ascii?Q?X3XNvm5P2QSRxBvEoEdVn/gDFGsti2vwJC6tMrucOWIrIxvyW8NjJpA5za5g?=
 =?us-ascii?Q?fgy7cnCdsP8yY83C6XMdVo60+eWSLLesiLhZ5CqBGWHMPRByz2Oh2lV1Z2Eu?=
 =?us-ascii?Q?81+94JnDjRKUtb5ZAjWO+ZUrCW8Zw5fZku1pN6M8R7aGq4R1zYxb743eAgVv?=
 =?us-ascii?Q?D18eLgnu9SnmF45mIi6N1qvweSfxVTlFDdiAfPyRP4FREhgmvqzorpsKhmmx?=
 =?us-ascii?Q?xTfUR/ClQ9pX4z1O2GH62HRrNg8//F3ZP3XDZ6jhF8Vsf9kW9xwCNZR8hRjT?=
 =?us-ascii?Q?WiF1Zg5x5C5fys0gV9zohCTDyuYS0a1BkOlHistAlmHqpx9FXLRfEhJutbSR?=
 =?us-ascii?Q?2U2Kso0ViHFjcCUYuTOozkI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6482107-3b67-47f6-72ad-08dd457a5096
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:16:19.7749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzYfz1uLrZ4Xk78tY2vWdk9uIPxtBM3FrbbA5H8EbIY9UFigH3uSplFEpHWespX+fpYXN3oUFMRT/rD3Ogz425kd/g3eZ0olr1XAJ4sS2B/8MdVFi9GN3ogGXPIFufIb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12774

Many functions uses below style for error return

	dev_err(dev, "message");
	return -Exxxx;

We can merge these into snd_soc_ret() which can use same error
format. Let's cleaup code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 96 ++++++++++++++++++---------------------------
 1 file changed, 39 insertions(+), 57 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a2caa146cac2c..ebe99d369ca9e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -238,11 +238,9 @@ static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
 	int stream;
 	char *buf;
 
-	if (fe->dai_link->num_cpus > 1) {
-		dev_err(fe->dev,
+	if (fe->dai_link->num_cpus > 1)
+		return snd_soc_ret(fe->dev, -EINVAL,
 			"%s doesn't support Multi CPU yet\n", __func__);
-		return -EINVAL;
-	}
 
 	buf = kmalloc(out_count, GFP_KERNEL);
 	if (!buf)
@@ -460,12 +458,9 @@ static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
 		ret = snd_pcm_hw_constraint_single(substream->runtime,	\
 						   SNDRV_PCM_HW_PARAM_##NAME,\
 						   soc_dai->symmetric_##name);	\
-		if (ret < 0) {						\
-			dev_err(soc_dai->dev,				\
-				"ASoC: Unable to apply %s constraint: %d\n",\
-				#name, ret);				\
-			return ret;					\
-		}							\
+		if (ret < 0)							\
+			return snd_soc_ret(soc_dai->dev, ret,			\
+				"Unable to apply %s constraint\n", #name);	\
 	}
 
 	__soc_pcm_apply_symmetry(rate,		RATE);
@@ -496,12 +491,11 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 		for_each_rtd_cpu_dais(rtd, i, cpu_dai)			\
 			if (!snd_soc_dai_is_dummy(cpu_dai) &&		\
 			    cpu_dai->symmetric_##xxx &&			\
-			    cpu_dai->symmetric_##xxx != d.symmetric_##xxx) { \
-				dev_err(rtd->dev, "ASoC: unmatched %s symmetry: %s:%d - %s:%d\n", \
-					#xxx, cpu_dai->name, cpu_dai->symmetric_##xxx, \
-					d.name, d.symmetric_##xxx);	\
-				return -EINVAL;				\
-			}
+			    cpu_dai->symmetric_##xxx != d.symmetric_##xxx) \
+				return snd_soc_ret(rtd->dev, -EINVAL,	\
+						   "unmatched %s symmetry: %s:%d - %s:%d\n", \
+						   #xxx, cpu_dai->name, cpu_dai->symmetric_##xxx, \
+						   d.name, d.symmetric_##xxx);
 
 	/* reject unmatched parameters when applying symmetry */
 	__soc_pcm_params_symmetry(rate);
@@ -846,9 +840,8 @@ static int soc_hw_sanity_check(struct snd_pcm_substream *substream)
 	return 0;
 
 config_err:
-	dev_err(dev, "ASoC: %s <-> %s No matching %s\n",
-		name_codec, name_cpu, err_msg);
-	return -EINVAL;
+	return snd_soc_ret(dev, -EINVAL,
+			"%s <-> %s No matching %s\n", name_codec, name_cpu, err_msg);
 }
 
 /*
@@ -1319,11 +1312,11 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 	fe_substream = snd_soc_dpcm_get_substream(fe, stream);
 	be_substream = snd_soc_dpcm_get_substream(be, stream);
 
-	if (!fe_substream->pcm->nonatomic && be_substream->pcm->nonatomic) {
-		dev_err(be->dev, "%s: FE is atomic but BE is nonatomic, invalid configuration\n",
-			__func__);
-		return -EINVAL;
-	}
+	if (!fe_substream->pcm->nonatomic && be_substream->pcm->nonatomic)
+		return snd_soc_ret(be->dev, -EINVAL,
+			"%s: %s is atomic but %s is nonatomic, invalid configuration\n",
+				   __func__, fe->dai_link->name, be->dai_link->name);
+
 	if (fe_substream->pcm->nonatomic && !be_substream->pcm->nonatomic) {
 		dev_dbg(be->dev, "FE is nonatomic but BE is not, forcing BE as nonatomic\n");
 		be_substream->pcm->nonatomic = 1;
@@ -1493,11 +1486,9 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(fe, 0);
 	int paths;
 
-	if (fe->dai_link->num_cpus > 1) {
-		dev_err(fe->dev,
+	if (fe->dai_link->num_cpus > 1)
+		return snd_soc_ret(fe->dev, -EINVAL,
 			"%s doesn't support Multi CPU yet\n", __func__);
-		return -EINVAL;
-	}
 
 	/* get number of valid DAI paths and their widgets */
 	paths = snd_soc_dapm_dai_get_connected_widgets(cpu_dai, stream, list,
@@ -2388,23 +2379,23 @@ static int dpcm_dai_trigger_fe_be(struct snd_pcm_substream *substream,
 
 		ret = soc_pcm_trigger(substream, cmd);
 		if (ret < 0)
-			return ret;
+			goto end;
 
 		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
-		return ret;
+		goto end;
 	}
 
 	/* call trigger on the frontend after the backend. */
 	ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
 		fe->dai_link->name, cmd);
 
 	ret = soc_pcm_trigger(substream, cmd);
-
-	return ret;
+end:
+	return snd_soc_ret(fe->dev, ret, "trigger FE cmd: %d failed\n", cmd);
 }
 
 static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
@@ -2460,11 +2451,8 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 		goto out;
 	}
 
-	if (ret < 0) {
-		dev_err(fe->dev, "ASoC: trigger FE cmd: %d failed: %d\n",
-			cmd, ret);
+	if (ret < 0)
 		goto out;
-	}
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -2693,11 +2681,9 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	if (!fe->dai_link->dynamic)
 		return 0;
 
-	if (fe->dai_link->num_cpus > 1) {
-		dev_err(fe->dev,
+	if (fe->dai_link->num_cpus > 1)
+		return snd_soc_ret(fe->dev, -EINVAL,
 			"%s doesn't support Multi CPU yet\n", __func__);
-		return -EINVAL;
-	}
 
 	/* only check active links */
 	if (!snd_soc_dai_active(snd_soc_rtd_to_cpu(fe, 0)))
@@ -2768,7 +2754,8 @@ int snd_soc_dpcm_runtime_update(struct snd_soc_card *card)
 
 out:
 	snd_soc_dpcm_mutex_unlock(card);
-	return ret;
+
+	return snd_soc_ret(card->dev, ret, "%s() failed\n", __func__);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
 
@@ -2842,10 +2829,9 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	int has_capture  = 0;
 	int i;
 
-	if (dai_link->dynamic && dai_link->num_cpus > 1) {
-		dev_err(rtd->dev, "DPCM doesn't support Multi CPU for Front-Ends yet\n");
-		return -EINVAL;
-	}
+	if (dai_link->dynamic && dai_link->num_cpus > 1)
+		return snd_soc_ret(rtd->dev, -EINVAL,
+				"DPCM doesn't support Multi CPU for Front-Ends yet\n");
 
 	/* Adapt stream for codec2codec links */
 	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
@@ -2887,12 +2873,9 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	if (dai_link->capture_only)
 		has_playback = 0;
 
-	if (!has_playback && !has_capture) {
-		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
-			dai_link->stream_name);
-
-		return -EINVAL;
-	}
+	if (!has_playback && !has_capture)
+		return snd_soc_ret(rtd->dev, -EINVAL,
+			"substream %s has no playback, no capture\n", dai_link->stream_name);
 
 	*playback = has_playback;
 	*capture  = has_capture;
@@ -2932,11 +2915,10 @@ static int soc_create_pcm(struct snd_pcm **pcm,
 		ret = snd_pcm_new(rtd->card->snd_card, new_name, rtd->id, playback,
 			capture, pcm);
 	}
-	if (ret < 0) {
-		dev_err(rtd->card->dev, "ASoC: can't create pcm %s for dailink %s: %d\n",
-			new_name, rtd->dai_link->name, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return snd_soc_ret(rtd->dev, ret,
+			"can't create pcm %s for dailink %s\n", new_name, rtd->dai_link->name);
+
 	dev_dbg(rtd->card->dev, "ASoC: registered pcm #%d %s\n", rtd->id, new_name);
 
 	return 0;
-- 
2.43.0

