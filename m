Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C69B339381
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909529; cv=fail; b=tS36X3VdmWzS97e8dp1LVbBw9nlxnlWoTQYSc4BEakWzv5rsTWRC9qz2bI6yjtSE7oYuJWUaHrVMiRbkCUP8vTZ3DjrlJv0YdTnwiAbbQd4vhgrDQMnEEtOZOdtzNu/nSX45PEiz7NZvGf882ICRHtaLDS47JJXc+PczZ9cw6rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909529; c=relaxed/simple;
	bh=uAb4VCHnYq4wiW4WI44Gr7d/WsasMnLYQhEao8Sky5w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CFb8KHBBoyFDqNcSukhJCldYs8Ch3+sU6BBfNXeQ2XqdZ56JG4OX5E5AL+Y9ZESf7Z0xRaGF1+DmV17YxLtrlVLFB4yAHF9Yn2vwpZznRlqrolS6QRqnmJMAe30p8x98/vDEPUtotxBU9ddREJuCw4LNNRaOgqnLlv2oh2R5rI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RXbH4uqc; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RXbH4uqc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4V3S1xIiSkH4avMChVWLOPqdDFSEfgRHBNbqrdkzxONwq6ghxtMZtPjI6WkbdB5v96PIDLhBpA7/qo5lcXvCW/iO8uBTv3ixllFNVCFTCZqjNFJJsnCFpdPKveeVPfIwjCJmySkWuDEqIhlbpgRNX196o8ixqrKeU7M61fRg8GcdB6QH6yuFlSrLeposp1+vV+xIsGBUPe0BHey7igRs+yiT9e3qhhcTFU3pShQ76SeohUi52xCtAwugKa6hnuVkg9EUw9nTjyzC3mgIqSIHwIb3L0CxTVLZSFDwdTE5c5x1f3NzOPx1ccedpDzKE79pCYEh6T7qhf8S5PE1J+GLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nemZloa4IBZl5qbC+2Akq4v/11eyEVAjP/LO8C7CJwA=;
 b=EehYHFW2lzF6Fjc002PrEbFhGRmrnBdEZrdLuGpBG4YEk48fTIbolaAqiOI4iGdisUlxbtCBP7WzX2sb2xGEDcbdhEsr1SYotSDYxPRHGNn5D4n23TfCOjphESHJrGtpF7o9RrkgMPlC+h6jIbZmAvRTYdkdkV83nLJkF77uo5dNaDqjUoiUmwbIgcMb/FoaejhP8Cu9FgcwpasUqIXJ/1af8w2GDWUCh32xYHgbaht+mqCDHpGzeQRXHm36eyL8+vtftPZIPjItOXGpChhMjWHNFKfBlFUCIheOI6PBxD6Dl599gS5CXPBqfakdDW+ey00ZBHEjIejrjeMXZloRZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nemZloa4IBZl5qbC+2Akq4v/11eyEVAjP/LO8C7CJwA=;
 b=RXbH4uqcCcUPhnIPXqJywZbP/tqR9SrQXhGApWmSm5jrZdm5HfIoTmR+l/0SCoH9EPd1H5Uh+oXffPag/q0w0kFbuwbKEot9i3vAvHzh5/EuPHVTTX0GUBw6u4dcp5X5932gAdTBqTE4ZSKWHez+cB3ml8EGJ18EBSLRif2yhAg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:52:06 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:52:06 +0000
Message-ID: <87bj9c6ch6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/13] ASoC: soc-component: move snd_soc_component_to_dapm() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:52:06 +0000
X-ClientProxiedBy: TY4PR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:405:372::14) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: d77bda4f-f65b-4482-9979-08df20302502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HChg51oRIjPq2KeK3yQLzSgl7uBIgdVk1Ak0YqDeHFdomJn0Yb4cV5YVUYZBSsIURaSbBb1f8qUEtbYBPIpuu5NwX0HpsIbl2hSSWSZvn/JX2KTJNBbbQ+LyeXHOsb20eGr9XjpgR7o5AGDSl8qzP3Z+wQA6GlpfL76cg7jnfLhdlpzjD9G7y+ffyoOGwZf1cHE+FTZME6Fj0ehpqsEnUAQT1li1BA3ZyZ8Xcmha2n49Bm/Tq893CE0D061oSfadHTZMNJgiAVVBGInfxIUAE0RsHB9KAP1kHN+QX9EGT7EMokYEGxNytBBxI7Sy4vZEUn5Ay5y968g74uQZq5eszU4pAjec0nAc8zUqJ9GcpjJTM9G2fjZJK1YSjP7TaNsbob1dJpVegxDDWyHW0OQPn1rcfHfH7ZxRQmFcEhT6WPqD6OyPZhWOyUArvAeNKKOf7cSjHXW3w67k7xvUBLE41S090mJapfmu5MacgvT8b7OrTOZ5kq+o3tcxouq6rV3QsJBkaxGYegEr56ZYa975clGQDTfcGTutDurGSkNyoOvH5dhjafQ2UiqXL8km1VzWeL11uq7/8xinaHo0aZsNpfsu32qKUTrwZFT2H5h060YyXmdGqG3Bmd/zoDBeGIvnDf7+7clS7GKOJ7+GFVvPrsK206qWBtJNb3T5ZatEFGqN+lfhm5HX/RTf1879Ho5KBHW0R9+KyNs7+0zo+Uk5cF8ryG6qU03J/O1eDneWYMI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?JbExCgFdDpOkfy6uqu3+vA4F3lT6FUQE6Gce1+FyJfb0OH8VId+qOUyoMR?=
 =?iso-8859-2?Q?iC+8BZtZ+Dq1R7xpONzo2a8BSBITKOb854AQmqPRAoF0hDcZHor4WzX7O9?=
 =?iso-8859-2?Q?U1eSSahLtoEwcsHjfRKfp2V5ZtKTNjPGJJAXJcP1HLRpyp+JbZofbfSW+I?=
 =?iso-8859-2?Q?2xLTuum73Hk+HD6/eFq6HLRJjWotzs7SekOShzgeusZsiBrKjMbKr3viEc?=
 =?iso-8859-2?Q?We1Bj5CtLUZoQwenFcFEAnpE11ST3AI/97VlwCGfbeg8b0r8S2uivck0No?=
 =?iso-8859-2?Q?mNZcchQHH/hIXnqFsCppgBTt2lje0eg9efqT//dMWU7bycojxDY/EsHgWU?=
 =?iso-8859-2?Q?25K2tN8PtTbWYksFNSCXI950j9c+amtwVrumT6z9rgMEnYXRMgH4D5LimU?=
 =?iso-8859-2?Q?7i+Tz99LVsV2clnomyPEP1sriKngTL5GUzqjmCP2V2m+nXcTPu68QFkVh6?=
 =?iso-8859-2?Q?a/E9y1mQAulabPLkcRPlIFNsFgIULMOtiFTd5XxxZt/Rl9V29QOoOGAPZJ?=
 =?iso-8859-2?Q?Hhay79N+lcWSKC6wlvfMrDP5mqk24IGbCxzwHtI8pw8p5jTYuVmClku7kO?=
 =?iso-8859-2?Q?4gTm5sZtEzBkq7ACipDn/5b0pJQYrCln1jj8DWsPMAddJB8QdQh/2RwgVC?=
 =?iso-8859-2?Q?MriETGYZqsiBwCtdy85+3YYT5V/numb2JZZM1t5j36FTXZGDOG/jw8mj2r?=
 =?iso-8859-2?Q?tWzVDCEuRnNfXbVs7gvdFyldWbnT4+sRIqVH89jYohUQ2ZdWrcEVTp11fw?=
 =?iso-8859-2?Q?+Hk/GYUEXsAtiri2R+SFmZx/BVqJ8AHPx2Che6bzuj3uponmEeg0taI/hZ?=
 =?iso-8859-2?Q?Gqd6C/o7lTZJi+kbK+DWJmj+5cmzb+ZouWXjRGlCnOSl/tB3RwBHRsWJSt?=
 =?iso-8859-2?Q?WQQ0fvOgWMF3MmsksK/Wv3tHe0EOviUvrUKf6+qByEUgd7J4hkGi9tSdVI?=
 =?iso-8859-2?Q?OI2toTYOp9F4S4w3yLVtqEgWpwZwhNLS4gEwZDkziriUGdmwvfq6rls6lV?=
 =?iso-8859-2?Q?zPEdqnmVLwB1d9OgZOK0nxctSmWrgWy+VT2yNWOSPoPrQWDPmYTl8S1TAo?=
 =?iso-8859-2?Q?wp37/jd2E2DUruz4poY2YGzApry1lfu6HUVl/PJEIo8CWZTd5kuBn+pmvd?=
 =?iso-8859-2?Q?q/wri11bAk4m7iLBsbWJnI1VKATxkvOoonrbTABol2LTmlesxk0g97aqbV?=
 =?iso-8859-2?Q?4YvHY2aeIIPLsI4f9tgouBGvnI0UnBrrZmJq8EJ6gKHxCqf0ikWsIiAtcW?=
 =?iso-8859-2?Q?rgui1qwENWkOLjmRNwEA3N6RRWSOc8QivFI+z5Ua/OESndjzm96pQIujpy?=
 =?iso-8859-2?Q?lxYGRbcHMinKSY2qktiFlFh/WPM1LXt+DQQSaBJ0fpe3aozYn8pwmrvfC4?=
 =?iso-8859-2?Q?diZRugCdtQA7cQy+7su/2HpSceRkMdHd8eTFN9t2KCSlYVNqJWvo9M7vyu?=
 =?iso-8859-2?Q?FMqaupfFpANfqDIKKFU7oAyVBRPQ3wCv0wqbpWCD/0ZMqQhfFowz/Oyd01?=
 =?iso-8859-2?Q?ig977fxeHoeHTHuiQIJ1lHRZvri48FQvdpMun0Gk63LuF/6DgEcKhCYYKW?=
 =?iso-8859-2?Q?k3hYbbf60GtX3D06GZLL05YstYwI6o0SICMh1lmUY3kzpnSQpHivwbf5aE?=
 =?iso-8859-2?Q?lobunZuNp/2V/xB9NZVpUDIJ9P0frqa4rxkZkRRLGU2rwTJ/grsuKHOjid?=
 =?iso-8859-2?Q?IYCfE7NtbV55xapanfqHcrC2qtyK3ywBs8pLsCIVvZv63ONTDK9NbVPHUG?=
 =?iso-8859-2?Q?D+nazZx4KIEwPcV8gmfU29ABcsE7S+XehD0sRtAhXxfA0iOLo0nKMhF0xI?=
 =?iso-8859-2?Q?TDYWy7+BR+XcL8u5j28fGCduBYOXtMomgu47kziBtziu6orXEY09?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d77bda4f-f65b-4482-9979-08df20302502
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:52:06.2550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7MZ3CKIXUaCRwxJP3lhVbjzfKYhh+GxLlIGp37jQqF9nx5KDwshloiZrkhN7oxWxK3iSh4VsRIwjxqXuaPOzH8SSx4DCu66FWSyiuKTM4f7Ufhzv7tqXc2OTccDqiMj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_component_to_dapm() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 11 +----------
 sound/soc/soc-component.c     |  6 ++++++
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index f2dccd3c9ca8e..306d61b2cb5eb 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -272,16 +272,7 @@ struct snd_soc_component {
 	     snd_soc_dai_to_list(dai) !=3D &(component)->dai_list;		\
 	     dai =3D _dai, _dai =3D snd_soc_dai_from_list(snd_soc_dai_to_list(_da=
i)->next))
=20
-/**
- * snd_soc_component_to_dapm() - Returns the DAPM context associated with =
a
- *  component
- * @component: The component for which to get the DAPM context
- */
-static inline struct snd_soc_dapm_context *snd_soc_component_to_dapm(
-	struct snd_soc_component *component)
-{
-	return component->dapm;
-}
+struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component);
=20
 /**
  * snd_soc_component_cache_sync() - Sync the register cache with the hardw=
are
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 91d30ec9a8fbd..1d7085cb4a141 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -68,6 +68,12 @@ void *snd_soc_component_to_priv(struct snd_soc_component=
 *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_priv);
=20
+struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component)
+{
+	return component->dapm;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_dapm);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
--=20
2.53.0

