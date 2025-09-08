Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2019D8A8
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 02:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757297424; cv=fail; b=Q+C32JZV24QX8g114ITA9rR4mNwPap0Ht9HH13VZ2i9SCFddUewGH6Hz4VSM0Gg1mCBjFLb+wkL/aQQ0bhbA3rEdWfBVxofciV3xfpl2HQeELcB5RYfhU8DYkZ0V78rPpSYOEKyeIlnmUurpLi5UNOj9KzGjMVPaEX2c9OzoAK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757297424; c=relaxed/simple;
	bh=B3sOhWM2DTHY8NmVXHJhlX5SiTEckRfyFQZWKp4mupE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bMz46ofbGgnVDx5Y3qAhw14y2P7T3+cw0xbpITHXRrHkL2cKrkli8mlFTfn9c3cNDNuffY3rgW9pMRPjngG4fzxVDRD6YAhgd2YC9GOEr7cxAPX+Ob+VU7LPuqef1MxqvwvwzIsSvXA2Hlm6n3/TPYfyHMJ94BVE2RTUPDITH74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IP636aMa; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IP636aMa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=My2tMjgCe2/OShsdW65ngyzRw0CweKcnQI2vzTpQg827y9vR8QXzhj4m251TDjC79DdclLrxFUCtWK8RJCV2tQNk2CoCgzQS/8FZpTdK3EYlRNHdLV9qqhvdnjqnUJk6lfl3CSIKGAl2RRqauQYYtfHW2YfQIN7eCs7i0bhhuHr9hUEr0I4m8+17lVyKcXk6pViFRf+H4JqP0CMNIHrplcJbsQl0ssc/pNMEI2NPopjRGaiELrhRT4waq+YmkvkWPXwHkOUaXZLhF6QCI4i62MCRtj/nWn4t4ySe26fyUY5t8HpP2d6Ka6U1FCkMZs2KJ851z2Sr6PGWiMQaikWRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfsrL7Wv7H25JB6ZjtqJ81Q97rglfJ1x7e2nxKMk1ds=;
 b=GL4fByaEPrwqfe198qJ3eqwNPWpRuCpdNRodbSu8YE5oDvvLHBsyiIIm7zTUo9jfQY9iARCVZGQHY8yqAzPN9Trc+6TylP904OvUwUiBNIJgubhPKdntfb4V7DHl4hu707XGmbDkCnY7UYQ316/Kej0ywOd//YUjg9Ap9DhuiwKPqw9sbzhS4373yhN9LwW9kVpdyzD/SbE/3O5CEMyl8zLR69yBk6IEvKCfJy44ltwwAnUAYTub4j8ogsxx3KcLuBKxPXSJMdDJQno6ZiPKN/yUJrOeHGF8/SwLII/kwG/xf+LDoX5csT5Ciw06IYrxnIpEWenk+3Ax8XkstMOveQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfsrL7Wv7H25JB6ZjtqJ81Q97rglfJ1x7e2nxKMk1ds=;
 b=IP636aMa5cqFZ1PnJpKQBqhYLvjietRTNbjvd2IZBHOujsGuh93Rr3nU2YIFjAIwahmoxLtT6EFbjsds8WN+xEqj6k7hjr/g4Ynd0dcoGdkV5vkQfTYeLSc6y4vGVCP/c1f6w6Q6yU1/nEkS6E6vp0qmF9W48mEM4XHX/zFvkgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9666.jpnprd01.prod.outlook.com
 (2603:1096:400:228::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 02:10:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 02:10:20 +0000
Message-ID: <87ikht1ypg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] ASoC: renesas: rsnd: Use guard() for spin locks
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ldmp1ys6.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldmp1ys6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Sep 2025 02:10:20 +0000
X-ClientProxiedBy: TYCP286CA0301.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9666:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d853d3c-79d4-401f-f7a3-08ddee7cdcb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uT9/pj4F68QoEekyOsTQFp0cl1Ea8NY4S9tt5L/SrRe5UGY+4O+oS01RjcMM?=
 =?us-ascii?Q?r2jb9vlfgvbq+GOY6vH6toPojiE/M109U5IPSRf124mB4MjM0N/Pow9KZCRv?=
 =?us-ascii?Q?Cgq09ipMyalmWaVs8WKGhBMBOho4T7vCrCxpvD61TIT9GJNK2nCk1GurC/WB?=
 =?us-ascii?Q?E6NSMyHj1BKVs761kZpRFdZxunzaLye3nW5t3lFuxxOS0qylQ5n8tRGfKxdh?=
 =?us-ascii?Q?3Tk1cvhb5NqDvTx90Le1q7Yt5blAgeF9AHgp0DobPDjKB6TDqQh2k8IWfESu?=
 =?us-ascii?Q?hMx4UXPzBeQcqdur9P3BqzyOABB89Q8ru8J1f1C1QlRbeOkxVNSkHtKMaGzX?=
 =?us-ascii?Q?/BSnaG+i+Wo/3veJ02gshojAiPJm5bn9KNyMV7rirT+OlD/99od5At4vh6g6?=
 =?us-ascii?Q?Aq3/lAEtBNVKeZsv/0x1cSNdd2OH2KJEmDe2birMfhwXICq5afJmfAuHkvc2?=
 =?us-ascii?Q?/TIdCiOJi6oRtzyF8BI8Kw8w8RdAEuhxAzuiuP6L1xDFw5b6guo2/elTi45I?=
 =?us-ascii?Q?ArR6gBtWBMI9lS9Fa+fXHvByNP2+PkDU5IB4W0cgDUwUuTVSfKJv+Y3NIJvd?=
 =?us-ascii?Q?NTNHMdS58OESC0E6TC8AFCs05KAzyHSjmZZH3KDLVkKMnsKnJcqLAps7aMbV?=
 =?us-ascii?Q?2zkp0ZSSNDy9Umbar7ATwLc2NVrA63533AZ2Dkdb89lDSMYGJhJBIeDNOU6B?=
 =?us-ascii?Q?W/Hfs0+FrGCHqrC35Ic/gIm8XX2xliDRU/CsWRvZOBDx2DO8zlrZZUhwpHkg?=
 =?us-ascii?Q?GQJhTfeojRAXbm+0fQenBUyUYvpiw8WEzj6CLz0TU719sG8+6/1Dso0gbODz?=
 =?us-ascii?Q?JdV2WuJaiMR5YUSxpYuHdzLAgrXKlUXiL0h0MiNLMVCmnGO3NgshEDkCtM7b?=
 =?us-ascii?Q?Fu3637h+BOT6v7kXP+gsQf/vko/by+b1p23d4OiYTp5yNDS45X9jHRLQE2xb?=
 =?us-ascii?Q?TeDFw8Ow0eDJ9HBDOpBmgfJq5pgqsg7+IhDCEqWuevbA7pmcMeperJg8kdAT?=
 =?us-ascii?Q?cCDOgblzpw8nPqgacwk71obn3qQkPFcdcLrrViFGGpVEZvwjwVtTK1vzidve?=
 =?us-ascii?Q?o9+VpekiH5fWDKZBf0NwHxc4uFMqExbcaMFQ2TR3QpTa/z4XgEkDKzXhC+3l?=
 =?us-ascii?Q?3GNPnxYxQFGHEMOqGw2W98Psv5FV8l/iqiligjCcmQCEgxJ8LiRcMF4+iNwr?=
 =?us-ascii?Q?CE9+3qgxacH2fPiskXZwJlkNQfGKs5Uj1nNrch5iqv5726r5Q5qC2o0PBUG5?=
 =?us-ascii?Q?q+nO7fPit8Y4oQfQHwPVKz2UtVhBylKPF72E3TAUHC9vKwxACwpwGnGY94e1?=
 =?us-ascii?Q?CQpqhUPQteLNpDQssvbiqVUm+DA6tlx8Hncv7iVYIyK+HjU/5xCWvyVFa+AS?=
 =?us-ascii?Q?RRVr9xJZ2yqaisbIFRV78NUXCKztAu081Qss75acCPOap45XXmn0cSTALubJ?=
 =?us-ascii?Q?aZccCxL0yUdwY0BTLzpz2JhDbN6f6KkA+/QqAzn1yO8dTsz/63+CZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YAMl2Ee2F6SslOt3OOxZbukeFAuNbwx+SJI9qTHa4w0eoZhOTu5q+wCaaWmP?=
 =?us-ascii?Q?2TaW8Qp8yLFs67LtKL4yTEyOUbH11GAYxJfuc0Ssk+OORr0SFUHNkDrDxR6d?=
 =?us-ascii?Q?dlDiClGPcQEJG0JouQ+DjwP5hVQ6Hz1P8ZCGzzEWizOWZCrVuroD42/xuamF?=
 =?us-ascii?Q?34ZXtxAzzyvLsfaKaPTfmVZZoy9MrbrALO4S3u8wQdgIe1q5ZD8sWS1fhfTx?=
 =?us-ascii?Q?tYiuZeYP/msyqezSXBs+Z8SGGl9QctKz+b0UntdrR0oBBrOjo5N0cU+MoBn3?=
 =?us-ascii?Q?jZ1qiw1SEm+YFZdXbLJgVZ3Di4lgt0/XBYbVzNV0ulon1Y02uAoviRw/BAzW?=
 =?us-ascii?Q?KO+OemsBkdprPaV11QAWuQCfBULunosYO0fUX6HK8g47tKj90oxJcyWAehJ0?=
 =?us-ascii?Q?eoaWvqA/71Ny4W4wvw1n48EPvVoJPoibDr8mgNKKKbUpujeGvLYopXdomEF5?=
 =?us-ascii?Q?4p9rT4TlmvUEFOwIZY4EJmLTN68TmmTscmlFTaTgMJnjGWi9OLC0gL9/tO7g?=
 =?us-ascii?Q?b3Em8Ms4YLWfY1c06G3dG/MUzf/aQ5vSyUE8S43DNuvAmJp8hFEU85xRGc+0?=
 =?us-ascii?Q?WhR2u+5NSX4r9wnKl4W+eOWEJ8FExENLGWX4dHsEUJUNBu+hJQ9XlGYb1eC/?=
 =?us-ascii?Q?lcW7Ejwbqy1inwnjSKHrrI9yEVqvxi8hjn+ueMi24gs2wHS1P4SR5WAp0Dlh?=
 =?us-ascii?Q?ITSgzqqLS5kowncQUQZcfn1xFI/D38AE2aE+dVqfih8Ag9aLCZKA1wFKA/a5?=
 =?us-ascii?Q?LrQQVbGYBOmsz3+8A3A5dFmj3OfIPBnECuHRyOT6LeCCfRii4y/QuGe4CyPZ?=
 =?us-ascii?Q?VdCbrwPPIUA5hQf6cq1EW0y9DK0d4bhnkIXNs398XGygT8gvVIoFRxpo5O56?=
 =?us-ascii?Q?IAn0ydhCVvdPW4U7HYozau3n1TZUObuxQYp3GPjfCt6bNYPfsJgqjqKCM1NV?=
 =?us-ascii?Q?WkLCtq+41S+5wyG6F1b7O4lEhcuJJTOCQqhkLuCcHQiagEztFaVbm4PDHZzh?=
 =?us-ascii?Q?e/59cqP5gY/hDfnvIJgylsn3xZvCwmmBtjoUFRVaAzJc9nhQ+WgecD3wilv9?=
 =?us-ascii?Q?TccTvcmvi6vzXOO1qxHvLGxbab9yLXdw6Zku29Nf8D2crmEGl3I8sh2YnMhR?=
 =?us-ascii?Q?cibZ+fpLBoOvMOSmFIgL+JNF5zwGsvdbZgSjE9benY8feEbm1/54brZWg1ug?=
 =?us-ascii?Q?BGJTuDX3qfJnGphFGAYfqb1UYlIMWvyM+LgILkrcLMNR1P7L4ZFxpDG7zLKL?=
 =?us-ascii?Q?nyAr7vdbaeK4ChEhyqy2vaTCKthpGpJAhm4/EhmNrxjE45ah3PbA7Vzmlc0Z?=
 =?us-ascii?Q?8TQcCxxndk5yehjKYhscvXf/iSHvErG3Aq4t16nnkGoG1f3ZbcguWdd93alf?=
 =?us-ascii?Q?VVP8R1hp8CLyQ7R9D0WnOk8BH1izPL11CQ4ZoUN8SQ0amqQjru7+6K/Alaj9?=
 =?us-ascii?Q?3AlOdU/GaezmJIWwwLXyL395MiKn/oajbMGsNRjTtCtzbmucCTHOiDe6JCRt?=
 =?us-ascii?Q?ADBN2JRPxHlpnQoypKO8JXEF1E7JToRfwUoFBmN7E28ck0+2Yk+RmEi/qZHy?=
 =?us-ascii?Q?VPcDFQJpV63liN3MjOh78Y+hqN/9BzVvwdFI8Fm/yZ5QHE2eiMlN3VpQDBwV?=
 =?us-ascii?Q?lERD1TPjrPYMM+Zx9Ye6cu8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d853d3c-79d4-401f-f7a3-08ddee7cdcb3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 02:10:20.4353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkfGVfERQx+IBDYlFiJYQvrTncymCeh2n7MX5Xo7Q27eA7BOhP2MABIB2uXqfDALcQMkCk2sA8x66kK54b0ps+nsOKA7hhY9lwQyzSSizMNLlw3tZClvvYAVDxWjEsTu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9666

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/core.c | 18 +++++-------------
 sound/soc/renesas/rcar/src.c  | 19 ++++++++-----------
 sound/soc/renesas/rcar/ssi.c  | 35 +++++++++++++++++------------------
 3 files changed, 30 insertions(+), 42 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 37d954495ea5..00225690da33 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -696,25 +696,21 @@ static int rsnd_soc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
 	struct rsnd_dai_stream *io = rsnd_rdai_to_io(rdai, substream);
 	int ret;
-	unsigned long flags;
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		ret = rsnd_dai_call(init, io, priv);
 		if (ret < 0)
-			goto dai_trigger_end;
+			break;
 
 		ret = rsnd_dai_call(start, io, priv);
 		if (ret < 0)
-			goto dai_trigger_end;
+			break;
 
 		ret = rsnd_dai_call(irq, io, priv, 1);
-		if (ret < 0)
-			goto dai_trigger_end;
-
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -729,9 +725,6 @@ static int rsnd_soc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		ret = -EINVAL;
 	}
 
-dai_trigger_end:
-	spin_unlock_irqrestore(&priv->lock, flags);
-
 	return ret;
 }
 
@@ -1545,15 +1538,14 @@ static int rsnd_hw_update(struct snd_pcm_substream *substream,
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
 	struct rsnd_dai_stream *io = rsnd_rdai_to_io(rdai, substream);
 	struct rsnd_priv *priv = rsnd_io_to_priv(io);
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
+
 	if (hw_params)
 		ret = rsnd_dai_call(hw_params, io, substream, hw_params);
 	else
 		ret = rsnd_dai_call(hw_free, io, substream);
-	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return ret;
 }
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index f47bf38c2f94..6a3dbc84f474 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -558,19 +558,16 @@ static void __rsnd_src_interrupt(struct rsnd_mod *mod,
 	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
 	bool stop = false;
 
-	spin_lock(&priv->lock);
-
-	/* ignore all cases if not working */
-	if (!rsnd_io_is_working(io))
-		goto rsnd_src_interrupt_out;
+	scoped_guard(spinlock, &priv->lock) {
+		/* ignore all cases if not working */
+		if (!rsnd_io_is_working(io))
+			break;
 
-	if (rsnd_src_error_occurred(mod))
-		stop = true;
+		if (rsnd_src_error_occurred(mod))
+			stop = true;
 
-	rsnd_src_status_clear(mod);
-rsnd_src_interrupt_out:
-
-	spin_unlock(&priv->lock);
+		rsnd_src_status_clear(mod);
+	}
 
 	if (stop)
 		snd_pcm_stop_xrun(io->substream);
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index d52056caa3ec..0420041e282c 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -680,31 +680,30 @@ static void __rsnd_ssi_interrupt(struct rsnd_mod *mod,
 	bool elapsed = false;
 	bool stop = false;
 
-	spin_lock(&priv->lock);
+	scoped_guard(spinlock, &priv->lock) {
 
-	/* ignore all cases if not working */
-	if (!rsnd_io_is_working(io))
-		goto rsnd_ssi_interrupt_out;
+		/* ignore all cases if not working */
+		if (!rsnd_io_is_working(io))
+			break;
 
-	status = rsnd_ssi_status_get(mod);
+		status = rsnd_ssi_status_get(mod);
 
-	/* PIO only */
-	if (!is_dma && (status & DIRQ))
-		elapsed = rsnd_ssi_pio_interrupt(mod, io);
+		/* PIO only */
+		if (!is_dma && (status & DIRQ))
+			elapsed = rsnd_ssi_pio_interrupt(mod, io);
 
-	/* DMA only */
-	if (is_dma && (status & (UIRQ | OIRQ))) {
-		rsnd_print_irq_status(dev, "%s err status : 0x%08x\n",
-				      rsnd_mod_name(mod), status);
+		/* DMA only */
+		if (is_dma && (status & (UIRQ | OIRQ))) {
+			rsnd_print_irq_status(dev, "%s err status : 0x%08x\n",
+					      rsnd_mod_name(mod), status);
 
-		stop = true;
-	}
+			stop = true;
+		}
 
-	stop |= rsnd_ssiu_busif_err_status_clear(mod);
+		stop |= rsnd_ssiu_busif_err_status_clear(mod);
 
-	rsnd_ssi_status_clear(mod);
-rsnd_ssi_interrupt_out:
-	spin_unlock(&priv->lock);
+		rsnd_ssi_status_clear(mod);
+	}
 
 	if (elapsed)
 		snd_pcm_period_elapsed(io->substream);
-- 
2.43.0

