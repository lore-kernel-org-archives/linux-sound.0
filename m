Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156623;
	b=O1CCkpxQIJnA1VNIO0iUHPGmbc6+4lQTAfPZoPXCMVfqk9foXVDQqjC6Rk9mPA4QMBKv
	 LetsM4c/UVtkJZDgzgufYFjA6ZxxmWEWWhcLpPBcmTpqJpwGNpUVQkfZ07RnrlC/jRXiD
	 2Oz+3RExXu1JAOFkdmKaKaDaub3U87u+xCCkh7r2pBgriv21UHBhNo82lBaVp9pWNLu64
	 3AdaFqCO6zoRBpno7+VJ7yWufH9LU3C92/FqHYR8fxeHTZeUBw4iEK084sx1dEaR8zKAE
	 geTN11fa4knCBGXC1v/a/oUK1vkr/haYeE/0o9shMn/EyyNLpjodPuivT0CCBSwUYMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156623;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UPomQO3sxGnmILSNurtwTG8I9bj8e+fuXy3VOoda8K8=;
	b=4YaC+mtKGBhlpe2Zk2H2LHc1tAs2BFYWKX75jlgVBCKTfxw6Het/UCZUh50+I67qZnTP
	 b9Qk4w4NOIJjwZPvYzMbpDUlCddYaVrzY1umNaO40K/+iax/CleOHPSjndfKNaaG6QbAG
	 4qotfoh67fmKEjoCK68Z7+BlcCtfTWu6V/CLXL3UCWNzYGlEv50GZYLSP1y7VMYdum9V4
	 WWGUfZodtJRlM/Bva6pTAjJJYQB58AVOlRtyyvCunK+SvAzm6ewzcASLRlUSoOvdeyinQ
	 tTjlIAHgtUz216f/5gIJB0cJdlCAxK+KsYKJvfzpzwE6ChH6O4GVBUybzMWeMQ6LTVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=iOLnL6oT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.65
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE91606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=iOLnL6oT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/D3PihenCcJ03+O+9IfHCI5QaXq++lnz/HaHopWWMV8o4jyVep+rWPArtyZqGBExsaANSe1OFru9sqAxRR3pQOXjsz1IoppNFTbsV74yBzApF/S2ur7DVWVv/YAOrl34Dl5mgA//xLKCbAIBj2z/8hrZq+vxZToe7R4woREBRrTuGyUJiDu47/+pF9nbs0CBYpKHPvSykdozuChB6rNWXV9jSIGaYg5DSK4Ndr3APDl4KZD5K0CwUihpHr2tji4DyAbDZRq34/bHq+ciNE/uyPcfMkQ8uOlxMjZV0JoYCghSGPN17YrriEmSBtsCkDcztT9vdkhMM8yle9qI/CpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPomQO3sxGnmILSNurtwTG8I9bj8e+fuXy3VOoda8K8=;
 b=g+/fuY0dtZj3EIikcBGJejLiNNWw7N+1lgHf/7vgY6xDweaus9uxxd3xCMElVN2aQxYqeZKzBN1n+eoXLAbGHQN1ZBDlasl4QDxZ9uSaCgjWFve4RUg9DaP/NpIVsUAQauplOC3Bl8m4FO/zbO9rTxOkCSUDiv9no+3LMmwJP8S2DVgTI3EYn6Gb5gcawmITtUtcIPqQBi1vJe3dPIGv0Kl8LeuhUzfvZP2ojO+ygag3e1Mpul7Iv0HMC0JlJ8ZitKRYOBtNXBkhD2sHrXf1RImGS58XPRmNS7yVHgSz8dMz98zDy7dLU2MY1mKmy0F5Rreisqefh0as9MghugM6ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPomQO3sxGnmILSNurtwTG8I9bj8e+fuXy3VOoda8K8=;
 b=iOLnL6oTaXWqoozn6CufO/eCfH9kWNlqRamiSVSkhAd39zx67xjTRj2aBhyYp786jQ3B4llHvV7Pd0gsyoFuLHcVPYg6xjAjTavcfGqoB2+KJSGJAMNjJzfF1t/RYV2KLg567ur8/e9MRmk8/SiX/15iu88zo4Exl5CHfI1KV2o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:40 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:40 +0000
Message-ID: <87y0bisf03.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/15] ASoC: soc-card: move snd_soc_card_aux_[un]bind()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:40 +0000
X-ClientProxiedBy: TYCP301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::7) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 99132663-73a4-4f7d-8091-08df34a01199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|56012099006|10067099003|261026140227099003|6133799003|18002099003|22082099003|38350700014|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	A0VgmQAI/7FfLFdL25+Gsm1yRIuNPY6nfKMS1798OW+c1EGmOCTPmqGbbpbAEyXu6KqlSLGnvm/USa7gXqPJgzDryHACt3/w7JWv628orZTONR09A6OXWuX5QDCLmBcJjSk0F7fRmCOpKbii8yhrBqpGicZX6HS+ucwijjMkHZg9d0wSDWaQZkIBE33R2o7VpNvRglsbcNzmiQngf6W9LBkQwZ+e65yuQwPPNZIoSrGlZzlJHTLGW0uiMSEhlW+D4J9K297QFmTmGeXDnmPUs/qK1YGS4PI4jQHszmw1h9iiq3+rQYElEw68uWFcx+qR5RaTisJpJiY/NL/FCSDIkFWGVmkDBPe34O5d3VFjXM+9WCBbSE11Tk8Ney/iqxMQLTMpK37jS5fKVxw7kUtlE11MxCGZYA295d8PGxLtaICBLrRCUCESkHZlEPhnDUnFFHa56fBPW0Uy1Q6Ex1yI31+UeArpFmN14bzU3TyRrh/fz5HgTrJNZQ7lfUJLOMwKk8J8lM+zHapI/DC3J/TuOv8tKU+3d7zfAIPnsFLv+7iyqFoTktLgDvPMB96dfAL2YoMxwU9Ybpncpr0A2WbRrlarWeRY8MEAfONphvmV9SQnXNTH24cOYMRtiG3QHui4f4AQn5zg8eOXlv4OMqKsB8WHt/NHfy3AOsAaypjk/KLmHX8Y74u2ZQCxc8UJxzAKLZ0Yihh3uYGD5vYNWEwhC+3O7XNzEOAj1JEN1PZdOCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(261026140227099003)(6133799003)(18002099003)(22082099003)(38350700014)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KnlvH9T6z3xzcWxAkFxaDr9yHpdErBwyn6puq8e6awny7hIOnkCcZqkdvhmw?=
 =?us-ascii?Q?rOuid784gSRnJYfWX83dX9cG8W7F9YDbbtuj7779dEOKbCTDnixby2cyrZ+Z?=
 =?us-ascii?Q?RD6eaCFDvWeGaX/uwtsS7jNGN5YWnTYJuq9WX1lvx4cf9Gm08YR892BOz2jo?=
 =?us-ascii?Q?FsXsU9EMbtyQcD06zGbi5FSzi2AimmxN9JKv9ns5p6rNhdXQ9UXG/wizADQV?=
 =?us-ascii?Q?4ciN7yND/pyUKBNQYC5Y9MFimHBYjuVcbm9l6getCPSs+r83DRk1Tn7Iffw9?=
 =?us-ascii?Q?c63LsHI9vURg/E7tUAEnE9n3UAt0SahzHGXQOSIZaZUCmg97mcHJbaY7hhz3?=
 =?us-ascii?Q?99U5syr9dxrLa+PLpBDMJdI4Pombi4rMijIO0whIkV6de2gyfCNGX+jIAwS+?=
 =?us-ascii?Q?+ZlIDtd59YAPARaPLIrFporWXyJm6ODEwQqfHCT9RXMA7XzJheWQUu6ZNYX4?=
 =?us-ascii?Q?okDMNw0qyJBZNVKuD2S5MmdpgHn8xKSrbG9zGd40Rfj8YLim/JYObzNfiGhE?=
 =?us-ascii?Q?IXhpq5DO4ReqHLS0z6+twzke87iwptnS9SFwzVeCcQ62FOYnP7g/GxyYCtaP?=
 =?us-ascii?Q?6oiYvUMMHJIeZkNfjDA1Lfuo4I5ZdDppo1ZTsrQW2WYyolk1QVptjgy8Vqny?=
 =?us-ascii?Q?IyDZ92gpflH31Y1Pa2UYbDIJjDggSnKIeLcfolbd5J6aqSQ4wf9Q2IgRaUc5?=
 =?us-ascii?Q?ciFsdZL8aS3pWrlzy4nQ/o3iXyDNaa7qGm5ZL4ejJEkQh8/ymoPdzRuyi1FQ?=
 =?us-ascii?Q?j4BM/5G4H57mk0jlcUoSLwVgwdMsY6Q3ky1nLgVG8x/R6yJhG4YI9MKBt5us?=
 =?us-ascii?Q?kLT3kh5kzc2ZqUa4Qo7onHBFB01qVGp6Upm5TdSWwUJhMxw3mPrfrhxBn/n0?=
 =?us-ascii?Q?kmdIrGOb7lF7RLQnJPfBNKmL75udQVz2fA/6NSbY0Qs5jFW4L0jGWCtOlrWx?=
 =?us-ascii?Q?wR1PJXGqjBoIoJT871e6JjxNChR2YBdWURP/YAQXAvKlxEAFBrCvs/hgczNI?=
 =?us-ascii?Q?BWhd1q1M7bjehsfM7O+TQWtcjIiK3pzm1JU7ct6kfmw5WywZsML51jYZYzcP?=
 =?us-ascii?Q?UDDbJrCh8H+mvol32EtmbLktwsGTkOx0w012+A1Ku4dp0ArMzQUbdG0FI2hH?=
 =?us-ascii?Q?Fcna4AZkWnWPeH1PQB53D+GlC/Sq/fJ+z10UY+uysgtlASK+KM/yF6FsPHNZ?=
 =?us-ascii?Q?wVkv3U/DOiqA1wK4qZgZ9D6wZN6VGwQCY2uEZ/8pqTczaopqaNuerWWDiEBL?=
 =?us-ascii?Q?J3nmeqsWKd1/7qjEGInu9YEGiCp+x/xuB2XUFHfSmBH7S783R5Rl/pjm/9D5?=
 =?us-ascii?Q?/BfTBUMMtOqVR5IzgoerItNcEihQIu/2nZFkoxIrvdecncrEnah7hicwx8Nu?=
 =?us-ascii?Q?0gYemMn0X+QXTVrBfkjq2FodeAYRwRZNQxw/22uT2DcHk/IZLUxTpsitiNGC?=
 =?us-ascii?Q?SroH+sbWCoDko+zPGylPsQLCtwdyDlG1EpJq+tqQhldCB/sbMHYetfbZiDW0?=
 =?us-ascii?Q?sGAWhKKzrxdgXd9iphG90XHgzLDmFvQ9waQDX8esFP2NNDNUaXxhoaCJIcta?=
 =?us-ascii?Q?Jnk0x7wCriDoBEDie/hDZdphobQeDWN/mbEQkfr1DtLcyjlFPreOsmjE3aT4?=
 =?us-ascii?Q?q2LW+8WxKeqdvrGaXeu+/lN+2l2s69nBWpzP9Wg2y8sPzrie274jpaIsSAFE?=
 =?us-ascii?Q?m2iJars/pMHGLYadD/welbQXj7b7TtDhvYh/9FrsvzZxnXFAMDgnjpmqvVbP?=
 =?us-ascii?Q?dLGPCqH7/F8mPLJGiFsaY9MBPJxoYYwNvVrlHIyli7lPPFLtw+u+?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99132663-73a4-4f7d-8091-08df34a01199
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:40.7220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huenZHx7nuh4FofaaejAVvDveLvM0Blj4qJbZPfmqu7W7cPqH248PR6oqs1a+LXuitjJu9mSAq/K3tIHpvNRAhnYt87Q7nicocKpCGfaNbJgTHkorUk/+LgZrH/yc/Bg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

It has too many local function dependencies.
This patch uses temporary funciton define at soc-internal.h. It will be
removed all funciton were moved.

It renames function name
-	soc_unbind_aux_dev()
-	soc_bind_aux_dev()
+	snd_soc_card_aux_unbind()
+	snd_soc_card_aux_bind()

Below function is used on above functions. Add them at soc-internal.h
Align with existing snd_soc_find_dai()

-	soc_find_component()
+	snd_soc_find_component()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 31 +++++++++++++++++++++++++++
 sound/soc/soc-core.c     | 46 ++++++----------------------------------
 sound/soc/soc-internal.h |  3 +++
 3 files changed, 41 insertions(+), 39 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 65217ac4f699f..dcfecec486570 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -236,6 +236,37 @@ int snd_soc_card_link_components_probe(struct snd_soc_card *card)
 	return 0;
 }
 
+void snd_soc_card_aux_unbind(struct snd_soc_card *card)
+{
+	struct snd_soc_component *component, *_component;
+
+	for_each_card_auxs_safe(card, component, _component) {
+		/* for snd_soc_component_init() */
+		snd_soc_component_set_aux(component, NULL);
+		list_del(&component->card_aux_list);
+	}
+}
+
+int snd_soc_card_aux_bind(struct snd_soc_card *card)
+{
+	struct snd_soc_component *component;
+	struct snd_soc_aux_dev *aux;
+	int i;
+
+	for_each_card_pre_auxs(card, i, aux) {
+		/* codecs, usually analog devices */
+		component = snd_soc_find_component(&aux->dlc);
+		if (!component)
+			return -EPROBE_DEFER;
+
+		/* for snd_soc_component_init() */
+		snd_soc_component_set_aux(component, aux);
+		/* see for_each_card_auxs */
+		list_add(&component->card_aux_list, &card->aux_comp_list);
+	}
+	return 0;
+}
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e1779b2b91476..0e25700688696 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -609,8 +609,7 @@ struct of_phandle_args *snd_soc_copy_dai_args(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(snd_soc_copy_dai_args);
 
-static struct snd_soc_component *soc_find_component(
-	const struct snd_soc_dai_link_component *dlc)
+struct snd_soc_component *snd_soc_find_component(const struct snd_soc_dai_link_component *dlc)
 {
 	struct snd_soc_component *component;
 
@@ -696,7 +695,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 		 * Defer card registration if codec component is not added to
 		 * component list.
 		 */
-		if (!soc_find_component(dlc))
+		if (!snd_soc_find_component(dlc))
 			goto component_not_found;
 	}
 
@@ -717,7 +716,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 		 * Defer card registration if platform component is not added to
 		 * component list.
 		 */
-		if (!soc_find_component(dlc))
+		if (!snd_soc_find_component(dlc))
 			goto component_not_found;
 	}
 
@@ -742,7 +741,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 			/*
 			 * Defer card registration if Component is not added
 			 */
-			if (!soc_find_component(dlc))
+			if (!snd_soc_find_component(dlc))
 				goto component_not_found;
 		}
 	}
@@ -1076,37 +1075,6 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_runtime_set_dai_fmt);
 
-static void soc_unbind_aux_dev(struct snd_soc_card *card)
-{
-	struct snd_soc_component *component, *_component;
-
-	for_each_card_auxs_safe(card, component, _component) {
-		/* for snd_soc_component_init() */
-		snd_soc_component_set_aux(component, NULL);
-		list_del(&component->card_aux_list);
-	}
-}
-
-static int soc_bind_aux_dev(struct snd_soc_card *card)
-{
-	struct snd_soc_component *component;
-	struct snd_soc_aux_dev *aux;
-	int i;
-
-	for_each_card_pre_auxs(card, i, aux) {
-		/* codecs, usually analog devices */
-		component = soc_find_component(&aux->dlc);
-		if (!component)
-			return -EPROBE_DEFER;
-
-		/* for snd_soc_component_init() */
-		snd_soc_component_set_aux(component, aux);
-		/* see for_each_card_auxs */
-		list_add(&component->card_aux_list, &card->aux_comp_list);
-	}
-	return 0;
-}
-
 static int soc_probe_aux_devices(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
@@ -1441,7 +1409,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 
 	/* remove auxiliary devices */
 	soc_remove_aux_devices(card);
-	soc_unbind_aux_dev(card);
+	snd_soc_card_aux_unbind(card);
 
 	snd_soc_dapm_free(snd_soc_card_to_dapm(card));
 	snd_soc_card_debugfs_cleanup(card);
@@ -1495,7 +1463,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	soc_check_tplg_fes(card);
 
 	/* bind aux_devs too */
-	ret = soc_bind_aux_dev(card);
+	ret = snd_soc_card_aux_bind(card);
 	if (ret < 0)
 		goto probe_end;
 
@@ -2795,7 +2763,7 @@ int snd_soc_get_dai_id(struct device_node *ep)
 	ret = -ENOTSUPP;
 
 	scoped_guard(mutex, &client_mutex) {
-		struct snd_soc_component *component = soc_find_component(&dlc);
+		struct snd_soc_component *component = snd_soc_find_component(&dlc);
 
 		if (component)
 			ret = snd_soc_component_of_xlate_dai_id(component, ep);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index c441268fb848d..df3c3cb783fde 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -27,6 +27,8 @@ void snd_soc_card_link_dais_remove(struct snd_soc_card *card);
 int snd_soc_card_link_dais_probe(struct snd_soc_card *card);
 void snd_soc_card_link_components_remove(struct snd_soc_card *card);
 int snd_soc_card_link_components_probe(struct snd_soc_card *card);
+void snd_soc_card_aux_unbind(struct snd_soc_card *card);
+int snd_soc_card_aux_bind(struct snd_soc_card *card);
 
 /*
  * In soc-core
@@ -38,6 +40,7 @@ char *snd_soc_fmt_multiple_name(struct device *dev, struct snd_soc_dai_driver *d
 int snd_soc_add_controls(struct snd_card *card, struct device *dev,
 			 const struct snd_kcontrol_new *controls, int num_controls,
 			 const char *prefix, void *data);
+struct snd_soc_component *snd_soc_find_component(const struct snd_soc_dai_link_component *dlc);
 #ifdef CONFIG_PM_SLEEP
 void snd_soc_playback_digital_mute(struct snd_soc_card *card, int mute);
 void snd_soc_dapm_suspend_resume(struct snd_soc_card *card, int event);
-- 
2.53.0

