Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0540361DAE
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303344; cv=fail; b=ob849csCSgBydRXLbmP5zdrzBEOv2WuK82ry8T8hNEv2/2g6/OsHqxP9nEJyJX/XRgpxipMFIfte7PJwCs7fsnt9K9rBeHXHcFIJBhYAzpJ9rixHH2jGR+YIB77rv+KXuwDVoiAli/s31dIPL8QuAYfxX74Oo2Vtq4KQvOwV4Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303344; c=relaxed/simple;
	bh=X+5zrKVi7GI+71KuC5LJsndS+cOpGKIySxBKas3mYEo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mdXvdG/7tlwPWw6XwljRqS1LFZl1gSuZJSIkJbV51+NHa5Qvo0nfD2ket30kg4dCJaHbtAbie5AdpPx/UAkOrrsZLRiQ+AoXGiGojp67ifamI0/wwz5WhmcXWm+kOshlOnIGu37XvClFhs9En6CB4cTG5A5H2uCjVUMLfoijvMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o+/71vti; arc=fail smtp.client-ip=52.101.229.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o+/71vti"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcUE+FZZAmb6Qdw1zHB6ZtBtUuuWu6YM6B5AGg4nuY72+wglWvb73jADz7qo2GZqiGJ1Htb20E+k3GgOOx63pXAYTdjB9skAb4T9MFbA9FMTDQDetsOfEvi8o4YvkgKRygy8RB2Ne2WzDt4aELj2hASndUtFrJl8+zUKMyi8h+3OK3GeHoRoRSXdTCEBzRhbN6h6xoa3BnCho6cZ5CXB0AtVsvex465Lq4TgoxwJEC/zZRUmzvBp9gj37O8THlPk8r5RdOqERw/wqudVYEunacfb1aLCSI1NcUIWCIaM2SDFd0yIwC6lwvhG8TAhP7Bfk5VX7s5Lktd2qXgTTIGoBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xuTRpquRaEiRSH+ZmxoocJKaKTWDoD97lDK3vyXAfk=;
 b=KRcNlVox/Stt4SNl5P/GsU6Pdbq14WQUud0H3ptoyUdINv2qZqCkrU9ykzIBj2yQ/8YmAIQJ8hX5fAp7oOYsn156OGByBmo0F1PUrasy+PyjOqAyfjp60xsjxLX1c+4tZPAy3B6olQEcpnjFX2GQw5tqqQ3/qsqWDABKE4bG46e+LM7uE6P1w2WKZimAugBW/nq6BxCJtplnncdS8l8BYPnbzo8QPkR4pdoU5ivJFAIJjE7c1snQ2YVXbyLI4AQ82WxGo9hGzhhK9QLoWF40sSeoW1RcKBwAQQqcxT5JK6TGqfgO7aax277S0LmZaxojH7zXVTCb+HLqLBdAND7b9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xuTRpquRaEiRSH+ZmxoocJKaKTWDoD97lDK3vyXAfk=;
 b=o+/71vtibn/9oArbAyGZH4Pci6bqav5P7EXE6mbvFWhGv8FDdo+HYYrxNgrKsohERWv1KS87PLSkfGx8A5Icbc5HZpGF1lRXqN5xfHmfbThyjZcHPi1j03AnNlI9K3PUvGzmkJxMlN5UDm/BH73W/WZFz4awlQrfk5amsjY0XT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15874.jpnprd01.prod.outlook.com (2603:1096:604:3d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 02:02:20 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:02:20 +0000
Message-ID: <87wlv8c1uc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 02/12] ASoC: soc-component: add snd_soc_component_alloc()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
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
In-Reply-To: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:02:19 +0000
X-ClientProxiedBy: TYCP301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15874:EE_
X-MS-Office365-Filtering-Correlation-Id: 37af94ac-8afd-47da-59be-08dedb029cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|52116014|1800799024|18002099003|22082099003|11063799006|38350700014|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	RaIhSkdVL5nn6BdlKZGPKh4j1vdEkCHrzM2a/xiRbT45NEHo7QVFFIoagdjAWwUCH8MkMFaCPthYbmv66WrIJ9GdZrz5yoZjs6r8/vGCYPKWjrxUlyhlFGb+UU6lpw5vnDd45e8K3VUsOZpuIMq/5RCyi6U1sfYJrT4yun589VvFoz3cEAKy8MRHxLF5gitaxxL2in12B1iVanmriM2QP+ks5KN/uSC85dYe21/oi8snQM1lRxIWc69sPcQx9cxbltu509UIbbndW+md+zz5xuR0V6CzqmppEl5aLEmXbbEt03y/j//RZa2xenTdksJTi6IoofuQPLtGPIcWAjmFMFdDOOlNtysYEDoVhITS2j2WKnBuzNXw4vOj+z8+CWCwjai8N/GviSsq9R8rnqXSb9YkiUQpuPPQcy60A/7/RCdrCVfOnQDABczA8pNQz6x7sdNL7qzvDyhbi99E6GX+z0hfRJf4vQACVSQINXfJgLfd2qdl1kSyp9bihQzrtqzlWJGGRAa6uvFIXnlBC5rHwnZLkGKCYcOJnA3OXrTM3349q2b+EHFY/kng9VZ221gKkO0eVg57CQWbLiKwKJ8cw2v0ult3Qn2EuJ0xWJ/+IlqR4EV/vypNlFP/0GmcbmVJfaFx+LwwsbnMBg7uazNi7k3OU5lmeRPKWP9MuMOdhn+DF7no0GKryum6OwIB710Py+zL+9WoGSJByi8nlWxY0SW6w0r5oODCc+kbCuLBmA532FpcR1rUFmJMBfBtykwV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(52116014)(1800799024)(18002099003)(22082099003)(11063799006)(38350700014)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?koLtH53JIyJmAkUMtAGbfTqSIJ1cUy85JMmVBOjegFkaag5G1u/o8/2kBjEu?=
 =?us-ascii?Q?UGbDXwETSammh9XLT4qfyjzPLFL8FgMTkBzejtNUEcT/86TLilqNrEEayp7E?=
 =?us-ascii?Q?HTc/kxu1R6OKdQeNbvKrqAtCbtP9hb2PwVcNgTNkQm0ES4cfczIeMHA5mV4h?=
 =?us-ascii?Q?1uBH4GaITTQCJSf2Sxne30w/HaFYSHS80nxuhXd4tQYuSxh3smpfQswl6iMr?=
 =?us-ascii?Q?nKB1NABhWO28Uxaaxbj0nPQJoWuZFdGQzV6UfXtsteaw+rfO8nGWEXiEriIH?=
 =?us-ascii?Q?14eiaN/x6rEs3BMvi7HJsZhZcGrQE84UbBKy6uasIUTBFCL+4NNIAeP/tG+s?=
 =?us-ascii?Q?0TWFpD24UhQbEf65FjS5jScb54qsYQCPjm2YEWh7SjZZgAbS32sPZC3PHKAg?=
 =?us-ascii?Q?yA3JJnOjYTYgRJ/4nmpAck5XO/AM5kEAKmzHg/URa6qsCFTwKbrx9tKLhFjG?=
 =?us-ascii?Q?VBjVe3db/e/lcu07z8WiT3LWTa8PRJaob85fEvQ3y3cyduEOMKX1DOc5srV4?=
 =?us-ascii?Q?t69I9GsNIa/aZUfKbjrlJJ78O7WgjGU6iVf3yxEhwM8wrKB8tul4KleIgCjj?=
 =?us-ascii?Q?WyovhYUuRYUU7rXOW5Vh4XSwg8BavZ/PLvkWMxzZR1cJwQpJvT+Gx5hWKm4R?=
 =?us-ascii?Q?otowz8vQ04ehgNy7WG1A9jVapjKbv8MHarE1Ch93yLkG9o27j7idVIr4BMxn?=
 =?us-ascii?Q?1hskADvJGi4LJmqMFG6YGG3+QTbSp6vSy0efoBDUgVth58mOHfQBzuWlCmKt?=
 =?us-ascii?Q?qAAppMwjuKLQgCj9Z8D3QjO6Cx3bTGcaB4AuCQKB8gwyBdRclOxtLAAqWhqA?=
 =?us-ascii?Q?IDk/e7SQZeB/+/WquxSiCwfmvokFkHfPIl3EePhbtt2GML23gdRVWzhqBYMX?=
 =?us-ascii?Q?UKQQ5MWOg2DTcvsu2En9bG9JO89ZWWqxpsju3jruOh+MgRJsvbhcdFYDRpri?=
 =?us-ascii?Q?E89dnb9dFwHhL05V2pb52ICpAENNefEH6Hzp1UkSya/NJXvHwp4QRxP6/fvQ?=
 =?us-ascii?Q?enZP0uUJ+gx79E754GBE3MtRxeS5sO5desUfsXVmy8H2aE7zfipFTn9KhH5M?=
 =?us-ascii?Q?RFT2Q+upnWbKJjRsvUgjxfyBpj9qTHgMmFh+mAbiviZ3iIUxgDOmoXFkpgPi?=
 =?us-ascii?Q?COU0HJcgFX8wki4148bimdSkUDp+s7oUiiHRQTSFBo9E0WQsZ4/P/XChAVZ2?=
 =?us-ascii?Q?QPQ+a0vTZ/KjvbHH05FRGVPfS12xxaDJsgO10rfrVXpHU9ykFM09MsLKnPsg?=
 =?us-ascii?Q?y9aAMHPReAyqexZxP5k79uFw+lDD01uQxSgfqOoXSSZ3V5aLrGLYz8hVRLJZ?=
 =?us-ascii?Q?NqJtwf9tS95aHBU9g9JSacPaRgC44kcGnLrfSLaxTJ8Cu/bx0Ki9zDnZRSr5?=
 =?us-ascii?Q?jpxTNOTS6Ds6wyp+HsYVrfrEK4Kl3pdg5bp0wBt1j8CWPh9AD389G0a0GSXq?=
 =?us-ascii?Q?gsJbEFkNKFco/sNYRvipU+hYYDB9dEk9yxzPxcoVnqnU5SkKYXJNI+OL1+no?=
 =?us-ascii?Q?DZlBKOk8oauHwVE0jZE044VJfCNekEuWAP1YIqs/M6KeQ6j4Bx7NUIZzJLRG?=
 =?us-ascii?Q?J2762Wm78+QiINrKj9Yia3tPpqmlkX2FAqhuXi5IjmwNDPi50iBf0yiRcGgm?=
 =?us-ascii?Q?SBFLCnxwwCcwaLr31uhicvlX8owbaVTGt+jdSglak2ZYZgnbT3wYgnjQn/Qv?=
 =?us-ascii?Q?kBrhCZLfGjdTrT2/V3ckpxVTugf5nukkgvdDQfnuUshdSOGVjVrP0AhpTDm3?=
 =?us-ascii?Q?s3MT48adj+rSgsRcoG9LoqWQUE9lvPo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37af94ac-8afd-47da-59be-08dedb029cce
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:02:20.2813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hD5jHhsc2Glw0IJtoY76c8Pj3MzNP6TCmnphJP420bYTm7XPfs5uZaQoEeT+M+Br39PdiQOAAb8KHxOfBCGFobPFnjKADOPAqWxY4HRGsmDP9cpGnhUuRrp80B7OXnF5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15874

struct snd_soc_component will be capsuled soon, then, we will can't alloc
it. Adds snd_soc_component_alloc() to alloc it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

