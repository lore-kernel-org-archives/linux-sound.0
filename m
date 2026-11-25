Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571024;
	b=hYAuKWVs/Mxi4BzXvRS8S3gxO5TCxCteVqj0YGoDe7ydgx/msUXvvgF9ais/NHlBZON6
	 dp75qUv4q6AGXns0eGPUW3zBWaiFOIiRCO9W2Rag1xrXrdWcg0hGI8kM8uzO2vhs5PhbQ
	 EMMSPsQphMG1mhBOUPqq0epTG7mvk1JDFXiMV6wLHC4pH63MEKYgnRUxg/Uyb3RkW2mga
	 MpJmmyCxq8PBznVXY9w1B3kNftJfX2uCCVNPdCOVWXm77mXC9byft/CQqA1Y8CIp0ZEX0
	 JhBbrobObWxCKYC3hpMuckr029zdOXDqZ3+i73Fmt6v37mmSJHjfH3ocu1NDTDglhZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571024;
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
	bh=4sGUXcS64yt6ayBiwLCIaTA/5x4PmhLamw57sjBFooY=;
	b=DFg2tu3sijue2JdZY4dY4urdqKJQTn1XwQ9w/ZQ44DMOStDwb5dRUHSfqtcQjJIbvEUE
	 JMKRbSY4gl8lP54kEV5ofPvTT3QOqAtbBc2fAmG8Y25YN5YcdLaZbRwNDjzAgR+Kd1zJg
	 0OHCs3udXenHhcFPklvpaHqoCIV6z1UxUox2hdflSTkukL93KtrGylH8+/sRBRIeyeRNW
	 HQPwgkaqkAUD4irKH0RrFfFStf1I5KZ5i0cwpB4O8qGCIGQtoVEKc97h3nI1CFr6qJ5kT
	 q20A0/sfXsoshUaZaVoQxLj201AvaUkupldA+rsk6o1zOAhPpOHec4tWPt9f+ACGPIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=J0FAUozX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.32
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E82606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0E82606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=J0FAUozX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSzwmYlhY70gKUbWpQK6dgnd7F7w+exYG1Db+Sz07l8YrNk+UPE0yP+3Cm+9gggQFZvbsMiK/uuM8DYpT0lt6vdjMdyNIsqeu+PQxAAjjmunPnpESuO+GET2lnWxPkVhTL51mRwTvu6UucYmswlS5eAgvdjdFahKNEyhWX5zeicdYtPYR/ybH1e2cl0ZYUvg3YdFFp+YhTKmmqhKI6++2qP3tjLwo5X9/lNBJo9KHwkw3xKvWpFaBkR4ZWlxrHrwgnk72FsZSopaND8AM1bGk8ztg3pGZ3SIR/fqV3fYVuw2O+gUGwf/UjvruOD+JXJSF+K6mUXWk1wHyjP+QDY3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sGUXcS64yt6ayBiwLCIaTA/5x4PmhLamw57sjBFooY=;
 b=SBamhNv38DY0uiwBru6wQlAAal0K4qEU5inNgRJ9XRmQXinVJh4pCif82d420UZi3ofXlZEEAUNhFNj/EyzYteZYyIOnI7NPOf+/c9+L4n7CuWXOClMLQ2X91OpbP+Sbq/b4HvAVGWb2dWa4vd7E1oUKHCZRsWEpYfFxNjnWBV2EphPJUMvmbFizsGDUa7RSJJXuhsqOg7KyWoK5jPbbI+ZHfYJqz3e6Pq+bpG2lZwrMS5vm3pThXxOjiuhCb0hEGnnrkGmSxhUdw1ss8XgMmtJSTJbHM2vqKPtIDhci+Jksbcm8A02UL9ooiIzX3obLsgOS2QjFkpl9i2y/nm5UtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sGUXcS64yt6ayBiwLCIaTA/5x4PmhLamw57sjBFooY=;
 b=J0FAUozXDGKy3AXbrZVWgHQi8yDYUrf7VrWiXJaRVxuYLpbUSpKmH+YMzKntoa7DVW9A2GEuk2VqoQcPP8i8PvgRputxCHC8sA7Q71SVCD+Y/o1vbtHCPB0ALScrEOf9Wa3QWpMIOJ4P+BZ88bQ0kTGjUXmOGdzmzpU18uIILmw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:43:41 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:43:41 +0000
Message-ID: <87mrqxelde.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 16/27] ASoC: soc-component: add snd_soc_component_to_driver()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:43:41 +0000
X-ClientProxiedBy: OS3P286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f4::11) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TY1PR01MB10739:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9b27f2-057d-4163-e1d4-08df4a9588bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261102130727099003|261026121527099003|261021121427099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	uF8DdJdKa8bpw6vzNL5+YMQJ+Gjhb4vnl6tDeKcbxWJWA2yUZlZppoKkoJwkyO5eO6m37hYo+cCFsi8g4ZJaOJsZKYzowkmv034wytXsmF7NqPviq3k3fCF0qHHnfVBLcDHwmVlTBQdQSbt1pXlpKHB4o0qE1Te+zJFW6SCUgPyvv/LSOolehTpe6Tj3Ek9JdO3WRkfSKuZ1+kCMirICjWszGiCZdGQroe6usZLo6sZGS0YUuqdwsI0Q6tZugxR4so8+H3qohk5Si4PHHBKL3hIkJro1UCIm/J7lrPLK4mzpQr8+ZHM51wwqFSuj98qVY84C/D6yWk+U3M+Z0oiUOUCE06t+v1dbM/6vvGivcEu15UAcJmOWf/0AUcCx0nCytMdvR6ScULn5kn1jDf/4tGwU+pf9C7rYEGrL+phmFl0Q0w+wB4lrq3IXjaG8VUL12Us+DCaHLFs5wySQ8GF69KrunGPBRSSCq38gmYA2Fc0r5R4MZedvHzx4CHu8+FevwtXoT3233vIToXvYxXY6hq1093oip5GSdwIhbJLBf3K+/HsgR3J5ZTNESiFc11JqX+VX6xUk6eXA7vfmUdwy5CMNawgCWA53gGVWbPaI2hNa8nXPOsliShAbWwMTP8XGX8/xcpdlyCcTQvHz1iMbXM+PXvZT1hKr5kEudNjO6p4gokZhqAX0R8p+1Jbkq29KycQBcF02ckeuQC62I8atbDk3JC+D47ksbpwG9hZAmto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261026121527099003)(261021121427099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?FMD6WM3VKIDyFLUqF6vouaETe3+Sqio/IqM2fm4cnFyU4khoFzV1gUILzq?=
 =?iso-8859-2?Q?26uOUpmxH1oVHfuMdLu+Zw98CZabB6XQbVEUnLewjmA/XzempcPH2t2YQL?=
 =?iso-8859-2?Q?OqEdFZh5bwJyi1XLchWm9gUfdmeR3ufWu65E86sLscSkuBaVoBrfp0waC0?=
 =?iso-8859-2?Q?+RNFzANrgnUxtjFcfzVTnFrkLtdAh76Yix+gNFN0P5hg5yKHO5gTByfNxl?=
 =?iso-8859-2?Q?XtnI4NOPgloOKCvsQj3aRptHWZ2GyB1pWDqHzpE1nshaH1AAUO4KjZ/Od6?=
 =?iso-8859-2?Q?k9s/H/3qWuwNwbzkFYN0FON7o3+n/Cfk+giulQNQmXg9eaZMCNBR4ufPHB?=
 =?iso-8859-2?Q?d0fmEhLumEIMrA4cv7eWMZJ2IjdhxjFlhttjTiSybfKuW/bSdv0sjX4rcq?=
 =?iso-8859-2?Q?p+GxuXTs+lWwHum0ojhkKKsMOJ8M/4TQ/uoZYJO/fDiX+nJN1l61lXZRfQ?=
 =?iso-8859-2?Q?61HUgygCubww+foaopodzQEnxBUpRlAUhVrOtBEGlg8Jqv3xFuDm8JBC3s?=
 =?iso-8859-2?Q?EogWSmEvKwY8lKu8Y2B8qky0Uiw0C+Tnuik7w6nIGoWmElcQFfVqWmzUZR?=
 =?iso-8859-2?Q?lNrl2OKyhP/9fvpqi4jexenUgyYYo4/y0Vt5vnmRpMaRCt6/S7Zjy1DXKj?=
 =?iso-8859-2?Q?6SJHhxHsQjFc8SuZ01I2uljXB8s+HVGRqr0AETEolSA6NFfQfFVNlSBowH?=
 =?iso-8859-2?Q?6E7bpy2/9I8xJGmyWos5z+bTvb+1FrWuflmE+GDw0Dmu2t/nZQa5HUx2wF?=
 =?iso-8859-2?Q?2OUCUeKB4CWbisCafcH7xKm/SdRrZF2B+FF8QzK6M83XANlxwjFwe+aeq/?=
 =?iso-8859-2?Q?CHbK9BHgrXLnaa6q/dPax3OO88+Q5LqA34L0n+qDa/tKGWVj+70AAD3Ecj?=
 =?iso-8859-2?Q?mBt44wI15Y75zE3dFZylxL9YbnTPwUvX0JAWfy3fEY/MuyAP05aLtv4AjX?=
 =?iso-8859-2?Q?xuAa2NjztSZi40HLePPhrl4IwTGrbbbYO5rhGy1xS7jKwqVWZLTzHs+j2T?=
 =?iso-8859-2?Q?XuKGzqe0sAqTf1JvjkFEGgdpnKcbP2IU2uyLVUQ7+HvX29keyz4D2N0FZc?=
 =?iso-8859-2?Q?WpmKpx7i0Db1UW03t+4cmESqAlFzaocY7uzCO32q9JG2IUxAqqqcVjdNZb?=
 =?iso-8859-2?Q?TN8Px2kfI+aZ4vy0Co3195DapL92mrS2yx9iNGwcAYnu+NajrnXNZ72N0r?=
 =?iso-8859-2?Q?r7iBwmt/RnCfGyLjyT/QYl8suWJLu7amG33E+YtymVIsDo4FtuvCH4pVDE?=
 =?iso-8859-2?Q?o2bQhjrGo6hfSPIa1+N1i6Y4bLd+zp4T7/dz6IrHqkZu7qqymks9i7JQBE?=
 =?iso-8859-2?Q?POtr7AemAFNhPFRSoyurKcA49SMCSb/1M4GxmsLthYb7grDlsr1I8uDOaM?=
 =?iso-8859-2?Q?BefW13fhxEuztNT6/xY6ENKg5qIj+1IvgcEut4NizlTL4780I8VLNkZ2KV?=
 =?iso-8859-2?Q?Yz12vvgLYFCR3TFm+2+B3xUSKXVP6xD0oQWLWOafF58Iwo/RMSBUWdQY1F?=
 =?iso-8859-2?Q?d1cZt1yfF8cjQdr201mdgwyts8R+GmKEiXcE7PbEPQ7ZQsHCCqSAFnNWIX?=
 =?iso-8859-2?Q?78750TGQveURki4C2BC5eGb/enFCoawxklI6sKf8AjWvMVKv9Te5RytUaP?=
 =?iso-8859-2?Q?XyhRgDyO6r52/9b4sCBtpa95qgXRejSTXFuGirix9We+xunYRF/OxGaGzK?=
 =?iso-8859-2?Q?sHTElGF8ba2XnQhsVoYSza2WrmaLUj7yfA9WzhrM/Fkr8OblsY5LhL1ZLL?=
 =?iso-8859-2?Q?vEab6EKv5hv0bl+vRa+Qdvt1Suy6Yf9C4tQYD0C6w/qyh68wQSMF7isOz/?=
 =?iso-8859-2?Q?4WqkwNf/kMat9NTLwZcrwmSuKQzuNF/Haeva4R/QZCeW9WAR1cLY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9b27f2-057d-4163-e1d4-08df4a9588bc
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:43:41.5636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBokObA4gSSAx09s7nQbWmtsvjfSmTFqbt2cu8HGKWVC2fRRGCl30vD/yj9FI1x17/JBk2qLUIjCAfB8ziAFROrfYYuvzJtuyaY7OAySTmlIQieWGtAkFiiorMsmBlyh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_to_driver() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 2 ++
 sound/soc/soc-component.c     | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 8a03730a2e54a..d0b82374f2801 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -274,6 +274,8 @@ struct snd_soc_component {
=20
 struct device *snd_soc_component_to_dev(struct snd_soc_component *componen=
t);
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component);
+const struct snd_soc_component_driver
+*snd_soc_component_to_driver(struct snd_soc_component *component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
 						const struct snd_soc_component_driver *driver);
 void snd_soc_component_unregister(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index cb0a75901ea5b..3bf1b8691bdc7 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -73,6 +73,13 @@ struct snd_soc_dapm_context *snd_soc_component_to_dapm(s=
truct snd_soc_component
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_dapm);
=20
+const struct snd_soc_component_driver *
+snd_soc_component_to_driver(struct snd_soc_component *component)
+{
+	return component->driver;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_driver);
+
 unsigned int snd_soc_component_active(struct snd_soc_component *component)
 {
 	return component->active;
--=20
2.53.0

