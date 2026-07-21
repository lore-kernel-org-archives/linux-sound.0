Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233443F7AB4
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596650; cv=fail; b=AxYRvqWZwOYFRX6IUXL6cfcRMIuhOYFhdcCQApng83lbnRhNYBHkpf3WhFWf0AMygvoomALGdAXf/T3NIsUGtUfIOr4e/NU+UNzIoyhX46oOF639WKPigwL2xPOa/tK9IEnaXcPAZFdZE+yzdNMSIjXkYSNKr28GNNy1iyO85aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596650; c=relaxed/simple;
	bh=Vk/aFgOzn2kpyBSyzTYjl8eu/jkmCfFTDkZbEWQf2t8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=H/yDxRmUhaE3jS6AqkAVr71ydoT99o79pYzRgO54Fm92jYzELPbHZ3OkiOzVgjDP4N8wr8pl7t/VaGqo1Ur/H+5Cz1w4sLGngkshL8OKV0Ysons/XGEiQZzUqvJCOdbLagD2VO275Uc89zLddtQEZmPRF+I085CYLyaQqQfoJfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jerje3Vv; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jerje3Vv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQF07MMfl11YwMRFsQjn8pgkoJCa91zBTkDk7Wf8bGzLnOKTakaM4wIBrc9gu8F2Lz/IZl/EOD1/1BXzcw+O0frcMhj/tkw9Gg4E64LefzMbeXFOO9WboBUscwt06SAxLYfaw0C+afHcd2jolO0cYxjRUTF1YT4IZHDrkquWUXAj68CxHmYCXNF7BoRWsK4VdA+4VMgDMfU8EwscmKOH0larc/mIFZYTmdWoGyTSPhRyT/s+GbdXWl1O9c/79b3wVyx6KduMMX5/d9WGWKTUGbbZ+NpfVL9q8tNRDk+ezWABQ0gri+4HxFbl+DDiqGa10+vjflaHM6zxRQmv7ZlcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7Tw8dJupkbd/jte6Y8C1radPLhnhS7SzArMU1G/RIY=;
 b=rScTz7WJL/vO3jk0byAMfbPG6iTTJIFeyMXvKlU2hzAR44DkLpvui3ccN/8Jf1H3vCk6+58fovwrEpdV5Typv7GFJmrI7wb7gnP9bnwKalCAJuZ/fGKa/JXnJesblDN1JEHjktSHCcQSjhLAtgeW/3euojxzU2xzm3yNkb8Xxvxy9OTjmffjSl5nNCNrVAoImgRkNLAGoD6q1E2gmsctshiEhD38XPRE/hdiYqWsunJCpOS9OyXayFolPisvCbwE9Rr7bd3nzANTgFrI0TF3Y85QqZ9pe6hNHF5UQELzDe1xI81o7QSIdhL5Tg5UNerQ+OdNwEwSWzHIg5DM+Cy4PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7Tw8dJupkbd/jte6Y8C1radPLhnhS7SzArMU1G/RIY=;
 b=jerje3VvzE5FzEArBRJ8oJ7Dm0xawWx+JTS6Ldk7cm9NaMuN1Ix9inq7bXuZM44ZOYldMGKE2URrHWtKzblj9t2LDB8RnKaEO176SUbwzJLiCERHThsJnmyJaCAN0/41hjMnFS2myZyP35gd8cQf2DHaqGjnoBJLRo3azNtABUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB10810.jpnprd01.prod.outlook.com (2603:1096:400:297::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:17:25 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:17:24 +0000
Message-ID: <87o6g1jg4b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 02/12] ASoC: soc-component: add snd_soc_component_alloc()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:17:24 +0000
X-ClientProxiedBy: TY4P301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB10810:EE_
X-MS-Office365-Filtering-Correlation-Id: ad51e9d2-6a8f-4e23-52ff-08dee6c5d27e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|7416014|366016|921020|38350700014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	knnB7kHnQWKtRdWX67BIrXtH8I77dOpM52bORsvKM90f+Q72tPcEqjTFq3fRY9lPnR5AQLk/2zMUGXBpdCPLBnkDYTE/Ogtjf8uPSiHc8mt2SHE7PqxtSo2Ctqbe+4aSfo90MDYF8dYoJPeFIANkgi6HD3LnhWjF0f5sRSHsrs5vV/xFbYFM8FPdjbGnS8Yca8xBM4xtDCYMCQR+n6kh68iCO31iof0cbxvRvdsbEvG5iSTtN5q1qClZco2EBkMlE04BNrRfTLtAfbeUsx/UB4PnuljpyYaoxt5Ts1Z9YUUyZ4AzCB+Akf4bIBxgDOuOPNCKZcSV9gwabSAxUOe+CtrDXUp0iEGte1Q6xKOtC3dH0VcMN34n/P2Mzbjx2XhlXRT3W4ecKSxfbJAU2/dcRuQ9pkIxHE65XTqE3GUD9fEyAw0nZRZEjGf1BLsYfkup7dyA3sd28PMsBo/6Yy0URLSXOScEuLtTrrhjP01vH6TEuKI9aD2pilpx85kr1h53JmF222WMkdyjSbAj+J3c2/OyNFtgOzyeg2ehat0w1mmxJ1hKSJ8ou8SOId4XBo8drb/2R9neFq9Cq6VYnWJwslLQzxgD6ORTYepQTcrs62smwGG/Cu4ggkTvkG0jcTsgLXiD8fuk006+RuUjBfNbNHkUndkwOSNwbKKvMvwPUNc6HNqTdAUL+k0ccDmWoFOEEXmpsA1yIznwBKeBJicy9rmqEURKlMz9HDCOjFMKNt9wZN+Sw9SVQ7sahdRBaa0c
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JqRM99t5yFXuGL5zdY+MHQMiWrV5MH7EeEdjkASq07t7sRKoO9Pg2P9w9BGl?=
 =?us-ascii?Q?wcMMbHJ0D6zHOmsqLN55t/0EaZLcdI7JNYIqx6rJAKVhiggVdpS41Dicb3/2?=
 =?us-ascii?Q?OPDeqWhm+t+682SHAjP1YEycR/2k2+yUThBTfdYUvoh+XF5tVTa10v8hBdEM?=
 =?us-ascii?Q?rCPbgxDNuVn34ye7ABNWz9PS9cd+glOLnnuk06v6c9/4GiajjTVQdDU+L11g?=
 =?us-ascii?Q?DW+39Pqvq+Ol+q7z6TckvKXQuNSNpxr/UUrhVc/xBHBb/KcvXMUwHAw6KKE2?=
 =?us-ascii?Q?R3c5ztArFb9uC5rVy/uv2KRTv0iuRsk1nmlV+x+djnw72Wn1VNq/GvzVqWP/?=
 =?us-ascii?Q?DDDAdu82lu3KvnYoU4aL6UlQ1cItFgY7CbqBU2EfiBAXqgYet8hABsxHluhr?=
 =?us-ascii?Q?S8tkq5+c0vm9cghpd/I8sucm6eL/dxamM/mivbjA6OXztd/zce56u+uGjlRF?=
 =?us-ascii?Q?wjYn9rY0vFslQ7ONHTEvdt5SnSvm4BcpbXcDCLvAWYBtCoINCtTC5fSuXKhT?=
 =?us-ascii?Q?dKmgil8jG3u864CF9RYdvUCOlow6S4o/sr6vkZWpuvQP0nWDH8ew9bB019vA?=
 =?us-ascii?Q?Y7epM6AY72nDGQOyi4y0z09AlMyzZi/vJreOXOdwZYFBz3u9cplEcF5Pu9EL?=
 =?us-ascii?Q?WwC6Dg3slcmaaUtGn5cZM38fAqpPoloT/DOIZwgIz+Gx4B/lktJoQ1dFUtxv?=
 =?us-ascii?Q?Gcy1TqjU311cX+PbGmJchFghJoNCJmSGi2V10QXzW5fgHrafZ5d/4oi7ENV5?=
 =?us-ascii?Q?z+CxE7rVGQowsYD33q4nbmoAV7ngrTHRXZna+0BzUYAPxD6yIs9JlosvIkjE?=
 =?us-ascii?Q?oTf0s4aQY+0++Niot5uvav7NwRBIgyFl/AoewQ+sIg3cxx8OsanZQiNn5+Ms?=
 =?us-ascii?Q?x2cJXvzxx7UlXy3Tc7u5TV7bBVQnlCoJlJOL0ciNERs01tkcrpU32Kx1Q/Td?=
 =?us-ascii?Q?Yskmpc6tpJfHUjgBpgCSvahUdPPaI9w5VxUcccNG+ox9/VFlSBfTNhyOP70b?=
 =?us-ascii?Q?w0f/mFngg6fGx0Yaf/pXNDOiE+VsgsVKSh6efBvw+hssbPwPwDxtxIZ1Ny3j?=
 =?us-ascii?Q?HmYWaTnv1uX4GvVZo2T42mIYFa3DdA2UtW1CIjNCMh6YxBX7SX91t8Tnjbpq?=
 =?us-ascii?Q?XBmYlqRbK2c3DDkQt12wDcFYKxHRUmU6L3xHvfjmXZ3iO6gzUWwoyjujxbyp?=
 =?us-ascii?Q?pPBplNjkxIAKYbduUEUtnwNBlE5dqPOO/H12IrPpOe04wkM1v8I2g+WZxk5o?=
 =?us-ascii?Q?qao1gHAHM8Z8xA2AXsELDIRGzvc+/7A5yE/K2OMb8em5ugTM4wROMBZPGaIi?=
 =?us-ascii?Q?zEOVhXPXTuVveKVcCyZAo3z2yRqDe/+SLXB0DzY1jwBxPMDCHb4g+NpVPpsP?=
 =?us-ascii?Q?16FbUSlKfdVZjBBqpi48ynnJTCkvaMfQZxO21JwOLpMaoniP/FSQdHC4KT0/?=
 =?us-ascii?Q?Cn/aGD3T776zy183yDz2+IBt/v0qaDkdXsOa8C5blKUlZ0F0PRsYN4NsI1mS?=
 =?us-ascii?Q?n8ATS2JPs12uCvuMLivdGHY04V5ZGXSqnWS5KQwdvJm/pzd4A0QHDbGgvsdB?=
 =?us-ascii?Q?ml9YqfQLreaHj4yzV4MOLWWidgBcoUVDOrw8lfHeO3p/TwcPikb4tiIkGu1E?=
 =?us-ascii?Q?HwBtWPt88yPHnf4cceVZFN9I3s2RsXRMOpfX/MUJOK51Pe/fjdtpkCVdo5rd?=
 =?us-ascii?Q?xieS5JiiwzeSbajpGL1CW6gKff+VdYLdX5eT7MnL0mSdiGMyqfAxaGzUXyNv?=
 =?us-ascii?Q?03LDR1YcSHaS4JIUy28xEHxowomV5+YFGTKLViwprPuR+d28Ui5C?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad51e9d2-6a8f-4e23-52ff-08dee6c5d27e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:17:24.9243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0cHcZLpoK3kAGYBrK6wtJLXeLjsAAsmqE0aN/En4d3upTd/oqNdSiSBweqBMjMBuktJkkBBIimjJhxPr9yYdIm0u5H48A59kBYqWsV+JxDl5n5k+xdDCJBUTyTrUa+h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10810

struct snd_soc_component will be capsuled soon, then, we will can't alloc
it. Adds snd_soc_component_alloc() to alloc it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-component.h |  1 +
 sound/soc/soc-component.c     | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index aa423865dbe7c..3c628402e289b 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -282,6 +282,7 @@ static inline int snd_soc_component_cache_sync(
 	return regcache_sync(component->regmap);
 }
 
+struct snd_soc_component *snd_soc_component_alloc(struct device *dev);
 void snd_soc_component_set_aux(struct snd_soc_component *component,
 			       struct snd_soc_aux_dev *aux);
 int snd_soc_component_init(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 718246e53e896..f0506a9c36ec9 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -29,6 +29,19 @@ static inline int _soc_component_ret_reg_rw(struct snd_soc_component *component,
 			   func, component->name, reg);
 }
 
+struct snd_soc_component *snd_soc_component_alloc(struct device *dev)
+{
+	struct snd_soc_component *component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
+
+	if (!component)
+		return NULL;
+
+	component->dev = dev;
+
+	return component;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_alloc);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

