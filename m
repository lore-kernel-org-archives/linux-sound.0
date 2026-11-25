Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570915;
	b=0mvywhL9I1N18J5lfCyrsnijfM4/+OgfNawC3i4joAoNgHSvi85qayVCyR+X8ZNFu2tQ
	 +zJMGxIbWEwr9W4c/3DVvJGn/Q5X1BqESQOvPvfu/0H37lo6/vlL0B0O0XkxcDjoyPDOx
	 adxLQ8uoWXGroCL4bQ/7pToYjyYsLhpTlfkNu7tOnOrHscOKQJZWJJY4nd7C9WoVchxf/
	 l3P95atvIFp0h/b9xGR09HrEFX38JzKqHdYJWElB23jnvWRdQO89+2r55dfs08IsIfmKT
	 J3YTjcrr7m0SWURi84zt9ODTx2253i5xQLLWXz4jllfDtADadEqdgTSRE0W2AEQFe1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570915;
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
	bh=cDalbT29jaW/0bAy6f3Fe0xLtiQjqDmfOG66ssh0/eg=;
	b=b1Kcu6Wcnw4cmRQHS4gDJ39hs2JU01G7QGmLSXBBHRnMz662QvKNLSBwG2zTiXh99TMT
	 NCWoy7FWSHqVNjtdmH3aqV1VQ+M8DO4gBDTqKsNHFaVhjhreZzjB16lro54SCmEfwYqff
	 IEDEgk20h+4lonmbI46bXutIFEkd+625HbhRzMlYWt+/Y3UyCOceZp4Z3BwbpIh85NyG2
	 gNz+55X0rU6HQl2Vy7CldBWkxQynzgTfTBI2VQFzJ1xHUAMSAFgjLeZgrTgFvBFVml5qz
	 Rro+eLKkusjHOCPESDLpEhR+tpI1KG8RK52avf0I4Voi/HQccvYSmvcBzStHFWJVTyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=e8T+0uTE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.24
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60904606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60904606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=e8T+0uTE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjfa6eE+8STECYLt3y9gJawvM/RnUZizOhV9ZVdnL2zGMlP9xKnoi4TXuvPkvNL3uj2d99xLO4m+uCvjXBC6eWnxwNhIm+9ws9NQhMUzuZvA9NUjl67VTIOPfPsjHnnweJ0IvP2PaP1uGry3k3ww2Ti7lf6hRr4som8/ecFCCOKWzRVtxAUiM9e+PJrJX7CqjiR9/+dkjszzuQZJaJMC2tPgHqxYykkKSq15zkPwmCIJY+HcKVc9W2hLh6jlFhXJFHJjRqvY4ONZWajPBpPdynMOtZP0XcsxyqeE1hQ0rVfIGQftuXg2uoHrvNk6M3bLAniyYBnleeZeGGPOdGthrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDalbT29jaW/0bAy6f3Fe0xLtiQjqDmfOG66ssh0/eg=;
 b=QHw4xtnaVh+XsG+bmVWNrdFBLKlkPwYPHHSebW8Z0ywBtoMLkPVJoGIxRTtX1eg0Pfuo16qdOOWwv1Nl/XJcxHtGsxdeZsXiayOXbxZFCcjzWYaYs2KaJWgNSaNjrqhempQ4U+/px4/s+Stm4n4yh1AxVd3lQxEvcJ4DiqOvymdrF36G2OH+8eyhfpcD+kNbWBQ9akQax8pvqQkh5GUwG8f0uHXKpb1UsISJqoCSYClJp56jRy626bDbytk54z+UcM7/5YmYhRqT9kcEOd37lGgQlyMqWF8D1Ih/eULrHuzDFJMDf67mJcb/z0zXOCDKNuf7ocatXxC1n72UPPZZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDalbT29jaW/0bAy6f3Fe0xLtiQjqDmfOG66ssh0/eg=;
 b=e8T+0uTEUMa68LWaGxiVAa7aNnKef5XnpGA8V2VH+UYpk0PZ99LAXPtSTm7zBrbQMMCyx2OazgelGWaO0opyyT8YexduhGc7ru6lElVmP1KeRWruT0nAedl44OFaE0xliM5Eu9AMwxnNCT1O1JSPF9QTO+VGU7nhv/PJeP3ZQs4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYWPR01MB9838.jpnprd01.prod.outlook.com
 (2603:1096:400:234::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 01:41:53 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:41:53 +0000
Message-ID: <878q2hg00v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 01/27] ASoC: soc-generic-dmaengine-pcm: move devm_snd_dmaengine_pcm_register()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:41:52 +0000
X-ClientProxiedBy: OSTP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:219::10) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYWPR01MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: c87aedf9-2e25-464b-cf3f-08df4a95480d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|6133799003|261009223027099003|56012099006|261028144727099003|11063799006|261021121427099003|261022105027099003|261102123227099003|261102130727099003|261022075727099003|261026121527099003|261021123027099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	fz13vLE77vn6oGDw803WOdWnGnvkoFQgRbI0uo3wg8BESL1TmrafSHuN9/eje8liEHGCTp4xH5Py4y6SN5tjCXzvcHqHrwBlBTDz0GCaM0UzGeYeZ4d85kTXerODc1lCeq7c3wgU9F6rElrkwCmQ8QiFCWnhrQmUleaEJK02UwVT8yVPVECzGGtFEj84OWK9O6D4chXRMagA7iPV2lwRBdSCVdK0nBJJwYj8XmkJh9HyRtSNnZRe1oOnVTezDC7MaQsjH1QRJNh5Iq5tGpgV6Cx1KPyqX7bTko23R0zE28jCwwT8djp2JInAZrZBUdwdxDNr95ksKuR/Qr//UX4go7wh/vm0SQ8dMzQXQwT2QACjnc1DwmSwhlZSDOz3qosMMMVT/1kq1uEEPAN5EDxec8gAq7Qtfp6e1WpUdsuVSO/yQqyxafKmlSeepqw4XOP+/IYfObBq1gf8KcnB9jw6jbQaiiAtgbECXPfnHrBGwtbJOXrB6aQWMcNhcK6fLiQT9o1spX5djolCFZC+P+7FYbERl3uRXvnGM7gFtkfKMFbRHuu6fYO5nWdM+szK09h9xzCnPD1pPS1mifE24+FU2KWcJ1hJIlqv5PpoGVBuieuVzBqZYRP7j3K+opXMYn+pPnHWL+DrjndzzzK9teWyPAowG4+k6C+rBnJJsJJUoKFEObamN+v7n0RMiyn/Z1kTcAyOhc+2JapjVNDG2hqBcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(56012099006)(261028144727099003)(11063799006)(261021121427099003)(261022105027099003)(261102123227099003)(261102130727099003)(261022075727099003)(261026121527099003)(261021123027099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?dYoi95MiG6wpO5ic0/HI0VKHhTdcPj3Z2eSXq+vW3r9Yr73aIGCxqXZpsB?=
 =?iso-8859-2?Q?G92ySyXC0/DW+yllQRua6MLUIGA859B9a1zu8zU0I9FGQNmPXEW39wFozM?=
 =?iso-8859-2?Q?+O6ht/tuM5KBw9WTe5ZFDHxU7lMMx17Q8GXW4uUuylgbkb4VZKeJhMgPDl?=
 =?iso-8859-2?Q?PNIx7LO3q7bWO1RqNe50m8iHJa9qGxabZqe/k8L/4I/MMMriSZzOFTtxyd?=
 =?iso-8859-2?Q?hjBdOJ9iA5Eu+rl3sX2E3zG3wspxdo4QJP2HjfMrzQeXWDcxpYbhWs9KoU?=
 =?iso-8859-2?Q?ehWfHD8Jpz9YXEKYh9He/3hUCzW/lryi3WH9TGcd6zOWQ/l/wcn3S9NJjS?=
 =?iso-8859-2?Q?V8g+x+MGjELrGBF6DJWxN/9hgaemuzbOEYTPFJS7btROTmYErnpQHJhEVU?=
 =?iso-8859-2?Q?+VByvwsEs92UjxHmw3KTusQBp4uvu5/rb4TE2NYNrX1uNBP67kw5qsaNt3?=
 =?iso-8859-2?Q?55TBBLKM1RBgehl7mUn0jpZ1foOI7WQnuzvObOCNrKxD+BkwSEPJTYo75z?=
 =?iso-8859-2?Q?jISMUoHbIGoWFWChl6ctyjBT2cdSTruqOrG0g1mojTj1lEcugDqXMbQFy+?=
 =?iso-8859-2?Q?A2im0j93J82EkTOJAgZcjvnYeRRaQRvz4mJ3VCFCksuOoxCwnx84sM83Be?=
 =?iso-8859-2?Q?K9zhVrexHQP2BQqPrwwkAwcTKrT/aU1Adw27W/ufcQoelYfiRbJBkLhkf2?=
 =?iso-8859-2?Q?2y0hD4rjhgHkSfWss24GAbgEPcLM2UyIlXjYW0/WoYhyI9O9iuX+hbHSz8?=
 =?iso-8859-2?Q?9ncMH26AftFQMp69usfaXp1M+1hvDsrzIMOeYhGiAr/aughJS7wGJzh5Hm?=
 =?iso-8859-2?Q?pyPC5ObuaMMNdKNTPFgd0TXJjWf5YGGG5lQoG9BJGBvHAb3Z77C44Egclw?=
 =?iso-8859-2?Q?I+df4oAnZL+sINJ9XXIvG5veYPm2YV7HhiArv346jOw7NUFyLHXvtT3Ha8?=
 =?iso-8859-2?Q?GygXmpDukLnVS69PAzYltfzezfW3cTOJwqfPCXjjPy/W6q0TN3ML31Slr2?=
 =?iso-8859-2?Q?KgZqCZqlZrQFfPGi5I8XEaoKXIMGWbAUKtUJQCuOjDnQFc9zWRcA9Lt4bi?=
 =?iso-8859-2?Q?iutcT2qG9WqK0Dhd3ASPWix9MKWM8e0Re9FJPK77S7eD8LcJ453wfEuEFd?=
 =?iso-8859-2?Q?2QDKNZtyMmjWnbIOZ5w+sGW6OUKZXm3A78YI/q/bBoS91vVOoWYDOX6qKi?=
 =?iso-8859-2?Q?KTDRxb6ExgQlWxudps01ooRmZiQxx/amEnRFIKEhtOaH0oWocg4Yak90X9?=
 =?iso-8859-2?Q?1qYVFlyia+pC2Jt2R5/7PqRPjYPg0HlrC0bde/rifVXwnoL0eohKyQ+CUV?=
 =?iso-8859-2?Q?2wTGsNd7wrk2FJFVx323KDfqec60CudDLa9FYtjKWPMuh/wgpsNlwWD+Lz?=
 =?iso-8859-2?Q?0EDe5ra95HMyMHHrwp70gHnlFv7peilmAbIt9V4vKIyYbNhAZ4S5yBIx4C?=
 =?iso-8859-2?Q?8uVIDs5K+djiJt9H0pweBL+/NE22sdOnW+Mhm5zqp3iq0r24xmkuweJ/zw?=
 =?iso-8859-2?Q?7rivnUHwqyfNIHhkORZV1WLyjtcGoezxkZpmKrT1cYFtzTFgteSVaYzd1N?=
 =?iso-8859-2?Q?tiW899K9M1zTGqN5pQNaio6TaSmN/4tsOql8TUD50RJc4EfuiuAyyyhT9D?=
 =?iso-8859-2?Q?ES1f6CqTjIYjcpjndK+WkzmExvLUaAnOVprBmw6kG5z33tLUqY/t5FqsER?=
 =?iso-8859-2?Q?03Cy6JgN/b0Jt7eecG/hyDH59Z0lQzDe67oVu7MGnJGI6Jx8WoM+Zn8OG2?=
 =?iso-8859-2?Q?W8oMzKHuBMs4zGmEIMkiT0vMoq5m59uIG3DIolFs+ba2QKQ8srxTdbJBZ1?=
 =?iso-8859-2?Q?p0k9H6kolhwJgpWbpcwthwVWiBXS7WE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87aedf9-2e25-464b-cf3f-08df4a95480d
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:41:53.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mL0hyq7scIOllcwuAIX9SOSnlHI+Po0pijTAxajlqwikkyDk7J2xMqNo8da/Zwnd9OW19oKggceq3t62mU5im/KXuJWE0esFNXUIRASzrulxSM+J4fv7Bpp6cXDMMFXi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9838

We don't need to have dmaengine related function in soc-devres.c.
Let's move it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-devres.c                | 40 ---------------------------
 sound/soc/soc-generic-dmaengine-pcm.c | 36 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 40 deletions(-)

diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index 718165ba84ac8..ca6c29b54f6ab 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -63,43 +63,3 @@ int devm_snd_soc_register_card(struct device *dev, struc=
t snd_soc_card *card)
 	return snd_soc_register_card(card);
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
-
-#ifdef CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM
-
-static void devm_dmaengine_pcm_release(struct device *dev, void *res)
-{
-	snd_dmaengine_pcm_unregister(*(struct device **)res);
-}
-
-/**
- * devm_snd_dmaengine_pcm_register - resource managed dmaengine PCM regist=
ration
- * @dev: The parent device for the PCM device
- * @config: Platform specific PCM configuration
- * @flags: Platform specific quirks
- *
- * Register a dmaengine based PCM device with automatic unregistration whe=
n the
- * device is unregistered.
- */
-int devm_snd_dmaengine_pcm_register(struct device *dev,
-	const struct snd_dmaengine_pcm_config *config, unsigned int flags)
-{
-	struct device **ptr;
-	int ret;
-
-	ptr =3D devres_alloc(devm_dmaengine_pcm_release, sizeof(*ptr), GFP_KERNEL=
);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret =3D snd_dmaengine_pcm_register(dev, config, flags);
-	if (ret =3D=3D 0) {
-		*ptr =3D dev;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_snd_dmaengine_pcm_register);
-
-#endif
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-=
dmaengine-pcm.c
index c7523bae45af7..1ecf3feb2bed0 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -520,5 +520,41 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_unregister);
=20
+static void devm_dmaengine_pcm_release(struct device *dev, void *res)
+{
+	snd_dmaengine_pcm_unregister(*(struct device **)res);
+}
+
+/**
+ * devm_snd_dmaengine_pcm_register - resource managed dmaengine PCM regist=
ration
+ * @dev: The parent device for the PCM device
+ * @config: Platform specific PCM configuration
+ * @flags: Platform specific quirks
+ *
+ * Register a dmaengine based PCM device with automatic unregistration whe=
n the
+ * device is unregistered.
+ */
+int devm_snd_dmaengine_pcm_register(struct device *dev,
+				const struct snd_dmaengine_pcm_config *config, unsigned int flags)
+{
+	struct device **ptr;
+	int ret;
+
+	ptr =3D devres_alloc(devm_dmaengine_pcm_release, sizeof(*ptr), GFP_KERNEL=
);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret =3D snd_dmaengine_pcm_register(dev, config, flags);
+	if (ret =3D=3D 0) {
+		*ptr =3D dev;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_snd_dmaengine_pcm_register);
+
 MODULE_DESCRIPTION("ASoC helpers for generic PCM dmaengine API");
 MODULE_LICENSE("GPL");
--=20
2.53.0

