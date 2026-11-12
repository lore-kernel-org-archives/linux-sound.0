Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443599;
	b=vsGbr1QweblJYDeuJSLBKzQzebM9tyb4ebCjLaUGmf3KK2lTaxw27jrByMT1AGeBO5Ik
	 it9g824Pm14+gKprudXhzc88YmgE8elAWEqi4d96ZXMA0w8EPpcykJYqPLMT/btdpbY87
	 YsMSLCyHsVMttQo+rvs+jABM91UF4DfZ5bgWzInmUzwu+2tCHgo+4JXpGcK1Kz0rGaFy+
	 dlQiS3QUkQw8pVdxsX5nKUsaLDR3hQTbwxi04FLJMxOYCw9NQmnvyuNuxBnadF52vtis2
	 EElZ4UbHQUzSUg9LsuXwWzXE/CF2iq0sa0KfECyiJcdxY/AsjI10H2chAFj0lhy1RqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443599;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wmLsdjDuqIZdyu+MG8L0oTk1i2suDEy4tQDkYKsYnIo=;
	b=yphVTcgcmiXy6dzcOX9cJViZdJjeB0xANnvcCDugpkkVYxNumGM3+fPHDr7+/P7ccnCP
	 zq+SBQUmKLy+XxFq6PC91J2g1QNi8uppdvslJtByZstHruBZICiHqM5YsOjezg674UlF6
	 X9f8QfYmTcBagg/DbQk9I19X5QsqXxkGYyj4ZVTbyXpTfEv+T9PBUn6s6/3NFPvajwOgV
	 IF1Dxe6Op2UZTx2Faj9w8rOOJkC2512AxX84eLUazGmrbjkq7sK7SObhvQb6dKVOqoH33
	 8OLbLamrZNCA1J1vwji5mjXSByfgrk5atAJ560OXkKJ8HeqcTo5MU/6vp755dt7s0jA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=N1wy+BSj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.66
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC84606A324
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC84606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=N1wy+BSj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nz1lQr95QPFHfEZOaqCrb23YYShFc0Kk797EO5jmBltJkWg2P4lw01xwXnT9jGrJpMO2VRJKg3FWbDf6H1awa7A1C5pzYX2nBx6VcF1mIbjBRDp5PgA1ghv13UvPgZi6fOTOjhHzd1IKf1dAY4uRTSk1Eq5ugVjjDspp0frCpoBUA6FT6EdzKeDFsLIYXnF0frRRjSbzv7fezW7tuLndmCvAiobUv6Y6yUSfdwW/FvF19pNzjLKy8Si4y0EmcXkak+N24AHptE8+RUhchl3NNmxNmkRsPS4j2bDpfawtoIIHH+5OzYeSLb4rUPwZrFoHEAlvXKrpJtveOK62NH19MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmLsdjDuqIZdyu+MG8L0oTk1i2suDEy4tQDkYKsYnIo=;
 b=uzGNjBFo/shyLZw80rhxytcxpAWsXoRFLhM9kdng1+4ckKA+DY2L2cPimM/C3KGk0QayRz8HWWT9RFElnu1WTwuQpAYU9Un/T48sqhkO9SDBboIukyDzakDCoDjuOjEg4E+FbIwO7GGs7wMlslt/rsOEZA8A8IyN7h+SJ8kE8I/QLrvm5YdwIj+5NvXApYDVbOrrCb0pAmbTrYhYCvvZVQNcFGNNeAc43/9tKtILI7WGJki9so3PkEcgsr/eiCjQ0NNZlJvEKsDM/5UwrZfnJSSMaldepzcrl7N0SRdYtqssNBLVlLx5Y0KuaP3nvtjHWc1SatI/Mm8o0sCS7eXQOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmLsdjDuqIZdyu+MG8L0oTk1i2suDEy4tQDkYKsYnIo=;
 b=N1wy+BSjkkZwXeB3Sk8rHj9aS8KB1MEeE/NXQjBbxKwJPIdG8j7bwIQIdhR4kBdJMua9yMoPBG/baxjA3oP3bEgARRWyhlatpI+uUBVrJFXO42Xtm61/lpDuzGsn2ZWMpLEuS5fvZDGwvoVTtBvjZHIcSoDmcnU3Wwc7tipfIRo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB13263.jpnprd01.prod.outlook.com (2603:1096:405:16a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 00:33:17 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:17 +0000
Message-ID: <877bii28j7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 20/27] ASoC: soc-component: add snd_soc_component_regcache_mark_dirty()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:16 +0000
X-ClientProxiedBy: TY4P301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::11) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB13263:EE_
X-MS-Office365-Filtering-Correlation-Id: f704665c-307b-4f7f-e748-08df40548b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|23010399003|376014|261009223027099003|38350700014|11063799006|56012099006|261021121427099003|261026121527099003|261102130727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S25vba/R3XvOSd1pB0CoGA+RmUCDRQ0sZuGEW3JsUzPup+9QtOw1OTRWsYTqO7FlkXzt/GvmZlCUd3YcQL07Zq76vbqc9vAkxpc5vSHY0WkmWCURbo9nCe/pVP0aTYFWBbh5SfwyLI6Sx2oRFBIr/X+j60kD+oiiu1FbByHv662ZTP7kWKBpHHaAXCPJ7LigmQLAmNgxLSc51D436g9aeKo6pBGZRvac6W+2JXOtN0mdo93+gcRf/+m+NmGG4V2sPDdiaM3/mvXNRczMd6RjPzSgapw2HVw6m1c5p5wSR7zHo5cUkSSoC45zbCdyptrRxG/wF/ImnAcqNYbywaqEh3qc1tkcOL6vUncdGyLd9rH3vjC0/DwMFxSCiOE+nsBq+cqDW1WMyQNkLQZT819HG8c0qSq9OPBBe6fTW1/j4Oy71np20VlE4m4M0KtWoU5kBQCkup2JeQnhgW3fMmTkpCZij2BNPUVeJDMoThgRgA38x4cbfC96ufG+vQCXO/YAsT4cfYC4c2JbaGYkPUI8KNQEMmBtJ+lGyhSYA9fWnRZTdS7rGtkZfoAkoHwh+EkyI/8h7l7JDXTab+xphv/lT5htmNn6rnKa1GZPTowgbGyLZqoLdewTJsiXl1zjaICXZU7tPR9lpaX1OvGa7eYYydKWIiHiWeFmrH8PW959X2uJMt79mhsoFcWSM2f6OOLdWTqkMfR4H4Svh50K3J7l5eZ29XBWgk/XU0ESsArVB7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(38350700014)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261102130727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?3WazAFfhwhdkbrtJSwcEpSocXYSw432e0E/TuMvpCs4/dC+5oSw9HR2t0F?=
 =?iso-8859-2?Q?fjYwQEB8RhMk/OAFMu8ZV2DGrC2DdUUTh9wOFSp3uXQuGjBHh2i7hDhPhK?=
 =?iso-8859-2?Q?/y+SWpTCOLQ43zja3yKDrOpfD6n8FP1EplmPXzCF2aHIpssfUrbkn6Fkl/?=
 =?iso-8859-2?Q?npncOJbV4hIfNw3OVC55D1B7r4ou8/7zuNq19tJuNuwgApg9c8iwll455l?=
 =?iso-8859-2?Q?sYbmZYFt7MUyV4ZBtIpAJyGoV0LC4IOeVRFx6ncZBVwi+c3RK39rwdaXnd?=
 =?iso-8859-2?Q?YAvrW5Kqmad3rQm2xViLmeZ4Me6SwM0t8tVWcBF5SRUWWL5Nj5HZmK6BlS?=
 =?iso-8859-2?Q?hGutK/3aIyHdS43p5M8fVVucFx6awEj140N59jg6UF+LnEZxykrIcglAAu?=
 =?iso-8859-2?Q?TwtKDFCRAO1WPA+pe8f+uROZMRX0jXfFmVGZJXv75PLssgBMsEMFfRyHR9?=
 =?iso-8859-2?Q?JfGpR9lQYqoysh+WnmAUJ0LmysMHoa5LuzVQ6gZXBfHYiAqxsPli0t7Gg9?=
 =?iso-8859-2?Q?pM+mCibhsmkWWXSjy//KbmKTIODp163h8T146/gI5AfnzrhMt/lpSeXjwN?=
 =?iso-8859-2?Q?TSa+alYyLHIBrRElwFRmvd/0SsYdgAGDUeRtp9NOEMg9s40IZMcq4FJii+?=
 =?iso-8859-2?Q?lgHg4F6pb4MAlz7M96ebYMekjvjNr2c43dnev2EmlnkQkYb7dSd8QTwtZ+?=
 =?iso-8859-2?Q?PMNbxFjXU+H3IIMozRLERGd9+0r4Y51tNton2mjo0Bi43gLt9bSlZv8anA?=
 =?iso-8859-2?Q?l5QLBHifRChVm2IAnoVp2hP2fRI9mfaYf1EbTlrOcqgMjEAhmJ7uDVVii5?=
 =?iso-8859-2?Q?cBpAk78z2RQ5WqRzTwJwIbUX/7sdrZwysXmU//W3cH5jeqNkCHjGawEGSE?=
 =?iso-8859-2?Q?dOPIvGLqm63JrOQQqdK66CaU+qG4+8ahiMM1WO/UdAfByOyB2haYpG1M5U?=
 =?iso-8859-2?Q?BahSOzh4QPfZ1n5EJSrHoEOZezoduFX+3Qg+hQFEecOXNV1nhCbR1IwdtT?=
 =?iso-8859-2?Q?N4yMudr+Nnganx2tMxfg110VDrxoknVq2TcmSLwxyAVC6KHmm+uezIhHfu?=
 =?iso-8859-2?Q?8W71xre6xBIqc94f92oM+BweMOJCr0oScGGXaReRNX+hyPXpQnbIG23wD7?=
 =?iso-8859-2?Q?9FmOF50jbFnMlUq6cW1WVN9h6X1/fUkWtpKDkNv/pofmTx4SvFTqbLjhym?=
 =?iso-8859-2?Q?evNuRuGUlGpkfI6eqqOpFV8mPT1nwjoxQRyG28yUSV7s4F+2J4lCdqD0gc?=
 =?iso-8859-2?Q?ohSeceYMYOZazksgz9Bll9fH7kDspiQKham3EbBw7Bnpwr5b/RaVpWbVwg?=
 =?iso-8859-2?Q?pQBq7GYhtikMhJdcDYv+m/T5PaPzjbI+mLHsFkPJmqYDZIRZG3z2HRKnEP?=
 =?iso-8859-2?Q?EWcPBlyRZUNo/nnG25H8h00FpapZqj66BZqdaRQC27g3XLrkfZK1VzC7er?=
 =?iso-8859-2?Q?pDsBCSU+aIOYVCdeL0Ui1e4P7qzWdYs2nUdfNqMDPh4JlrrPdQ7rIdi6Pi?=
 =?iso-8859-2?Q?TOIxjtEMaBkJG1CaekmhJl6hiM9dBGqmyrZn7LMJQwhoNXYredU57HMoyx?=
 =?iso-8859-2?Q?vht+7rrTleObX7oEVp8mGpwKsjaSltkOpNZsohm/FsGPIMYoPPozwMycDJ?=
 =?iso-8859-2?Q?GiXQWDYHGw46II6maEURBdKntKlnDkREbh8prZDHg8iebkopWpPCmL9wEj?=
 =?iso-8859-2?Q?+lC2838fuTg6H5PjTXrebx4yWKAhRDCIAj7VtzK+F45rBXJIgoTGR+tCw2?=
 =?iso-8859-2?Q?brJvZqd3CfoYj8pxmtvC2EJwuob75+HsYQ6agp2Q088dHPRtkYcJi4lsvc?=
 =?iso-8859-2?Q?pcZOsjQgrkrd7uyqnIO8G43lHxmqmJ5Iv45KNIuwgGJ84OLwMwcG?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f704665c-307b-4f7f-e748-08df40548b5e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:17.1334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2RX3FAQZ42/Er5ftaWH8rkjGo1MaRcTiEOMuqesPQCqv6fB31KFlfkWjQBWb6jZCE5GZwS5iYIiVYBPAwCHYn9W7E25rngw563G0Jo+9IJ3csOr78EPLh9X9i7goSaw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13263

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Adds snd_soc_component_regcache_mark_dirty().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0caea23da4fc0..9b799cc300f48 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -357,6 +357,7 @@ void snd_soc_component_regmap_exit(struct snd_soc_compo=
nent *component);
 int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *compo=
nent);
 void snd_soc_component_regmap_async_complete(struct snd_soc_component *com=
ponent);
 int snd_soc_component_regcache_sync(struct snd_soc_component *component);
+void snd_soc_component_regcache_mark_dirty(struct snd_soc_component *compo=
nent);
=20
 int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index c84fb65732efd..452c95a38596c 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -509,6 +509,15 @@ int snd_soc_component_regcache_sync(struct snd_soc_com=
ponent *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regcache_sync);
=20
+void snd_soc_component_regcache_mark_dirty(struct snd_soc_component *compo=
nent)
+{
+	struct regmap *regmap =3D component->regmap;
+
+	if (regmap)
+		regcache_mark_dirty(regmap);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regcache_mark_dirty);
+
 int snd_soc_component_compr_open(struct snd_soc_component *component,
 				 struct snd_compr_stream *cstream)
 {
--=20
2.53.0

