Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10B433B6E8
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909534; cv=fail; b=TiCa+OmVPAlFmSS97Ub4X9yytcAS+/4KvKON9075lfZTDi/XKi1csdkxItW7uH08+M+02MBYbgVvjTX8a1vNCxu57DqoiI3o3lyZ9UMP2DRw6XSzluFUJ8ozkh+TW3Yq9pyDscEU6pF/knQvsRyAFyZHYKSHL5C30WrOYnE/Hic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909534; c=relaxed/simple;
	bh=YRXkN+Kunaq/xyh3qiYaWDADwBZhJZsWgHZwrbh5eCo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ntqa+IWezDFcBbIngetCw1xZUWf5s09YtS0AQBo5LTcHIqatWdA1hmXKf4ss1SZAYRhcx+6DddBJVj5fQQeSCbCVYo+QSkRmrOuhp3VxgmjgSxUVEDqCCLX9ApZvnsmvv3nIkz1ajsDpZS/XDezrgWyEHtZq1eWph9JXs7d5YqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TXgTWenk; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TXgTWenk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxZdGD//aT3hE4RkTzKC7rLTBUN4LwIt+XHRgev5mOx2l8Iy5V2uNJlCz7/tF2IRVdTAJ/A0O/RgIzVG0MNo3pG6qRSRwh9K6tYLa/kmKZ9DrpDdoTnmSoBT2TaG399EKXOGy6cpXYxPPk/fJFQjxD/oWDVSZfXvGux+Hui1oRyIBR8rX1GRnir1olWgceC9Y8JlcTZGJMA3MnuPUdOYQ3Je2TvwKNypsD6dYDAgz1Fw2x4YbuwrTyWQPZkL+hFuBQBnx0rRV+xkDXI+G56u7ICxvfQdKpv+UanuM2dOvAmCNSHXTu6E/UQKRWzbB9yEJ6OSsnYBkn6g8wim36Fm2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yso0L608ocOJoueCKtifaTYWoKeB8PgWIonhT2uIdT4=;
 b=nDtk6V0jDFNeTdjR33Rd+rOiARJUYyYo1eOI8YFtnZkoFDm9u05Hja7hwruKNnpOJ1RDd9ijK0TIbdcW4/9kdgjKlnLvy7QDLxjO6WgfqUJqtGLqurC9bhMto4P1h72/GgD8pnSAlGXjIKPrlZPatXR5y+6Kl392WnSCDqOdV+F2wcW33x6qsXuKEUZu4WzyLZGOmSGUm/W1/AWGRVMgrFterrFWYe0IjSyNbTFb44Ow4tm0G3qodIV4wPEmJy4LqLt/GzaPVz7UvnaUXsVfonXfCKZaL6aCNlf4MrT3FM0/Etpbl3EcAnaxtw55T0BHpd3EqlfP0bxxUsH12xHPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yso0L608ocOJoueCKtifaTYWoKeB8PgWIonhT2uIdT4=;
 b=TXgTWenkcaS1w/q0/qzUjgowNf1eSciUnouGK3xFrwVogjpp7ptAMtwoG4a3jSNTcVVDv3bFLBp6LyEc3cpcfOzQ6IOj6sTMjBWVA/5yOkU5EE9UAXUHa6bjmMVB055lqZiDoZ+Rygr+tOvXEXb+XLtXJr4w0hRBXtUWocuV1WU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:52:10 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:52:10 +0000
Message-ID: <87a4ow6ch2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 09/13] ASoC: soc-component: move snd_soc_component_cache_sync() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:52:10 +0000
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: 5863316c-fc4e-4d12-0f22-08df20302764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GPagmCozVLjE9DS8dTWlP14ZQFHKLLvAeARAzE2UPlttWdFeoCXXtqQOp0KPxen7jkHD//8b0yLRR+v/Ux3Z1qQL+10tMNI2qdl6M+S1jU+7GFcO1ht3jUDoJp5gKpIRenlx7sloJGLl2WY1lx2G/hqUxoyd5G2X6y4uSl/feRvVz/TzgjjI/8YEC0qzcWV03bpe+Zl+zF3RC8gbzgxSknmvxgBGL0AKlXH0REeWRpbcpLbLytayhE1sj66qvbY+fzqSQJTNz2XYUSsIFzwj6Eyidk8ykCeSJrDGd2vV/+z0HYN+r7LAOP3xMnF2TjhDjbepg1v1y4S5BArRLS3K/jgWf5maGomkjdAJg0/wQ83L7ovEqvaHz3Hv9j2trZm6gwnaXTOBM8jBlpYx9fuXzki2Wj8UcrpllM1NtTzcHgJ+L1CAQ6oofuSA8c9GGYtOiMLTcUVgft0Jp/kQLjOthpW0qi1cQxOeSjMWwhNeiW9omxRSPLEXbcGuIcWr5IwCBBiNaOjnrBwEadGZW1s9MImIn5kcg4vFFlLsaCaZB8xHxpD0kjhM1y1nMKoc/ARr8/pzTz+iYbiI35to/OtoPTmq7g4DpDIGJ0eg9jPsC3Ndz6x/CFyLOnGZQJ0/rZw4z4Wm+7v0DdENMslHa4Bs6i6HLETJdA3AUw59bRkVcOtX8djw5BHHFWWbwI6hTH+4a8121xGmRU+IH6R1K1h354+5JscxKybguXXYMoyqMx4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?Fp3KefPx82xwRlbwZ86IHHXv1XDxvEXxzGIN1r2T38j+6yBReFh3E22fh7?=
 =?iso-8859-2?Q?o0KoySbdn7j0wWTqtP+iouW8WYBmVF8EoLbrXwiGV7kh0u3s409KnuVQnh?=
 =?iso-8859-2?Q?uWOPGoGUPoJgX7wS3x0Cj56Rh3XXUtz6tIBnQ0Il+Agy7cPw5DIAbYdeHQ?=
 =?iso-8859-2?Q?z4iCJzbHchPgCkHYveNCv3cPMCQA7oPFWM+DAMLNZSJ2owtngr8q83ociQ?=
 =?iso-8859-2?Q?8Li+iE2A0vi+xtO4asAhatBINtb5EOpkWVOE8sosbdOtXpW5C4mu/QtbnS?=
 =?iso-8859-2?Q?d+DwPUV7Tsc+ACcmeZIHN0gIDIOQLtPs30IL+uVzZ4W8gcBkjfWB+/Mwd+?=
 =?iso-8859-2?Q?37Kglp5Z1Tnz90OsvGhQBWnbpZxrTf3ofmSVt/mt1jdpQXDsxyVRz4VIMB?=
 =?iso-8859-2?Q?N3PGCbYri/sXugPB8aaksKj9fFT7KrjwTP045qTmQUosd4di9uGWKO2c0i?=
 =?iso-8859-2?Q?XL4AWtH0AqLJFOoodUhOM11eTpFIP1h4EKfswJXYasRIPRknja9ORt3ZgF?=
 =?iso-8859-2?Q?aKrtCH5CAv3dMwU4Y7zWeo/dhtU3SYMEi5gBJVHXdYKDGBwc49TIFFMST5?=
 =?iso-8859-2?Q?FzF0LQi0yFKHlREV4H2uiU+90zLTtibuE0tiloo7VvdPdt5pHsUN5hxM7w?=
 =?iso-8859-2?Q?VuZYumg1F3rK3Hg3UAFM+MOxxmd6aeCO1p/bI0t8vtY3m2jFDLpYlo/ygd?=
 =?iso-8859-2?Q?rqgeJ1uLOXOYErXW+XaavXe3toXjY1VpGgIKm8tYkRB8aPOeEh9aC1g0Mu?=
 =?iso-8859-2?Q?V/zE9Cp4JQfn3HsEWruyp0OZ0DGCJuCDwaxwNNxi6b34MvrPvo+8k86bPa?=
 =?iso-8859-2?Q?/Xzl9A0Gexm4tSrSGIdVlXy/HuZDcgqwvYzScMFC1yh77W2Dn0e0lKqNWu?=
 =?iso-8859-2?Q?jm2V7G9i/xXJ1IehCkTc9KZaImY+aQigRiqKCjI9hET7YqQv9LkjG5u/fh?=
 =?iso-8859-2?Q?WTE51JO5AlSnJTMhsMzwDLjnyft/gpjmtQVGrfVYqfDhO9Cl8mcoxs6u82?=
 =?iso-8859-2?Q?eqXeLdyR1O6kQT2Gc3X++YYrtnkgIrKuNI+9w+9IHp13jr3/zmfaZz6lKb?=
 =?iso-8859-2?Q?4FOxQNfWL0pfVQ5xsc4YuiQZXloncTNddTRizPqO+oFK55S6ofrb6OWPGn?=
 =?iso-8859-2?Q?EHNfvN30uZ2LBvPgMqwEoH0/lGxVsFmondN3NBXfVIMlkta2tvdaZyLfCP?=
 =?iso-8859-2?Q?b2R/K02cBhE8Zu3QSinrBRo7DaG+aImVXHrd8UqWNrOTQYytCUoyTv1ml5?=
 =?iso-8859-2?Q?wf6tB6cm0yylE/rB9L08WxrOg6krhCGQ94H7WMLMMpTs2j1bp2tNGM7Hxq?=
 =?iso-8859-2?Q?9mW6yN3dbN7x45pF1ncot7/tqN6d47dyGzUbJqlu1bXa9aSI5NYTWsMnSc?=
 =?iso-8859-2?Q?c7SdhKpLLftPFj0GQEnVs2xkp9wMWX4/gWePv11ka6QnACxGhpNXISsBVg?=
 =?iso-8859-2?Q?v8SBBkbKjNEqSKuN7SSPpyoo8Ym8eETAgxCaPj4g829ScnO5Jgq6D9THgV?=
 =?iso-8859-2?Q?HynmpNC/dqUiZ5YXEE+dH/tcV9V7GFCP7oHOJJtH/tr4NA7Q/LDIZeLltx?=
 =?iso-8859-2?Q?KLxWVCwPHCZh3dMl6DqKym99TPvQeEK5+i8E5DjXvaj/K4IS3bl+lrOMqi?=
 =?iso-8859-2?Q?kPIb/UeA1htDiEapUzSqgNWQr4DSKe/TXDi8MxyL+zHoFdSKkGMmSJsHNk?=
 =?iso-8859-2?Q?YVgMEnl7KCLDh22OHQAakfDp0An1dK8UhrSmpdZsbtMlF16PhVO1K3DlkE?=
 =?iso-8859-2?Q?ihzft+oMpxXwGnJei8jWuDdtuC+qivTFS0KBGvq0SdfXj6sgyuOOMIvSI7?=
 =?iso-8859-2?Q?VQjcxcdDDYJIzMcU5YPkUxVgC8JS9Zkw87XTsfjcHWaficqqvvGc?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5863316c-fc4e-4d12-0f22-08df20302764
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:52:10.2442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSXb4lO2Zds8Hl8ooaoyUuAGS2TKTRvBcDoxMzwfBIBPtk4k8Mk7tFscr2JmgRO4zbZFBFT6HO2Oj1d7NaINB5ybV/lorIL5J6II1k+1pnxxx2lw113V7D75OgcGYyLm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_component_cache_sync() to soc-component.c

It renames function name
-	snd_soc_component_cache_sync()
+	snd_soc_component_regmap_cache_sync()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 16 ++++------------
 sound/soc/soc-component.c     | 15 +++++++++++++++
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 306d61b2cb5eb..0f5738154a23b 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -274,18 +274,6 @@ struct snd_soc_component {
=20
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component);
=20
-/**
- * snd_soc_component_cache_sync() - Sync the register cache with the hardw=
are
- * @component: COMPONENT to sync
- *
- * Note: This function will call regcache_sync()
- */
-static inline int snd_soc_component_cache_sync(
-	struct snd_soc_component *component)
-{
-	return regcache_sync(component->regmap);
-}
-
 struct snd_soc_component *snd_soc_component_alloc(struct device *dev);
=20
 void snd_soc_component_set_name(struct snd_soc_component *component, const=
 char *name);
@@ -340,6 +328,7 @@ int snd_soc_component_set_bias_level(struct snd_soc_com=
ponent *component,
 				     enum snd_soc_bias_level level);
=20
 int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component=
);
+int snd_soc_component_regmap_cache_sync(struct snd_soc_component *componen=
t);
 #ifdef CONFIG_REGMAP
 void snd_soc_component_init_regmap(struct snd_soc_component *component,
 				   struct regmap *regmap);
@@ -452,4 +441,7 @@ int snd_soc_pcm_component_ack(struct snd_pcm_substream =
*substream);
 void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 				 snd_pcm_sframes_t *cpu_delay, snd_pcm_sframes_t *codec_delay);
=20
+/* REMOVE ME */
+#define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 1d7085cb4a141..35c48ccb352cd 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -410,6 +410,21 @@ int snd_soc_component_regmap_val_bytes(struct snd_soc_=
component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regmap_val_bytes);
=20
+/**
+ * snd_soc_component_regmap_cache_sync() - Sync the register cache with th=
e hardware
+ * @component: COMPONENT to sync
+ *
+ * Note: This function will call regcache_sync()
+ */
+int snd_soc_component_regmap_cache_sync(struct snd_soc_component *componen=
t)
+{
+	if (!component->regmap)
+		return 0;
+
+	return regcache_sync(component->regmap);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_cache_sync);
+
 #ifdef CONFIG_REGMAP
=20
 /**
--=20
2.53.0

