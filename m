Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571035;
	b=1pDVOVubgyZwwayEQ10UT74COuPzb4Ilp0/yBKybLXCoIeF+KmlsCDueSV2Zf4v7pUPg
	 bgJQhluFmJd/4qmZ1qFg5ignDF9AOoqO6Bs7L2AED932rDXUkHsRvQ7eXBbyoCeQT2hne
	 kQOamNv2l6rQFhD/qisnek7uVs1VmDm754ER7ccnza3a3tXpuCE92xxolxvLelyAd18za
	 5oZt6WvILHKYnIYmyiz02bhxWnfiz5ZbQNDzSqetHOH+vZU8yNF0owCPKA3IQww6QOfwg
	 ryqlOQM4WEFK25QdWqf+ew4nW6PQ9Fe2RG7JdsDsXgIUxFudMy1jtYOrMn5GbUBwq3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571035;
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
	bh=tMezYcwSrAadC0GknTV3IcQrP8AD17btjKQIsUVaEf8=;
	b=FkFt1e4zaWHdQCuDzg8X7k0/6FYLV7kalFQd0MLzPoXsDsiDcZLMpns4u4wWSD1p9sU3
	 FPYAQuvF7aF3v+mopSw5FgnwjIeZAPwFi3x/bocemPmt1mk5linnPbxTArsQICxny/qiO
	 dN7PBU3c+Y96UEKDMu1OgIDJm8mFv+Fu4zu/XXlZISFc4imuSpWHpEOcyC0FprABbDWmG
	 h9sc4r1pUPQXXJVWwZhyKWrdT4QRIUcQiIo068t4uOH2TUiubJpNNBsmcMgddDG/AAIuf
	 ZLBTdvxckZXguZdRdambUzLEly6oRJP7fFf3oR8wc6Ly+H3ozh5rP+T7NcCy52FnTeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=j8Rdw9vb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.60
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD738606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD738606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=j8Rdw9vb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArMHRG8yPTbvCVXeamstQeegRVH+6m/ViAWhR8ZIoYezOJ+nwTWSQfjS9vnwMd4ULw2qVylvTxtfG0APZ4Kw+iJSRdHoOnAEWLzHTQi+5NkR5PJWUUXKVSlZkNMMiKMB+5Pd31s5Opb8PByYpKqNpL0oHZns41QOf6ymT7mSnnS/PdrzA4LLXv9YBgstwknSc5JXhQHajf6hFXmU9EF97rXOYWhK//b06uVYyR7Z/ugJSOkXQJ8vcaBIouJbJPKwRIJlqFa+ukZFMTAKVZSxnC6G4Hm7zR1HDh2F3L8Pkjt2yVHW+4zU362b7ieuaKrNrna6h9h2NRUsg3/07JvKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMezYcwSrAadC0GknTV3IcQrP8AD17btjKQIsUVaEf8=;
 b=ybGf6EEmxPzd/06TDdcZnMuyCGDesIf/9AdeJDYouFnNIzxOt7KiGsQ2Z9QJboTNkVCmU8qWUaONnHfK5u01MYEc2J3jnmkzkVodwv6DPfsqpleNPv2sQiVlnbTkfn+RhLP+Ucf4O/zQeslsReiNkCDFLIsXRijoQzX3+1AwWJohsc91Iiq614r++SX9UMJsen38ROJYVbmKKfYqYNTDd8s96EAzaWJLmwG8yVxLxWosyJRsJzxus4I9sLsLGYeGX7VYN9AYz6ORAVTn0ApV4G9z8GZBVwfZJnzu3QNkDoZ+y/pG7XO8Bup/ciNVIQdVkNGTT964XCVc+0SWZMxoNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMezYcwSrAadC0GknTV3IcQrP8AD17btjKQIsUVaEf8=;
 b=j8Rdw9vbUCCXvi0LflsWnEEf6V5B8z4osbf86EQyo3yOWllB3DMdnhTr2KgsKItSrBaEQcW3bTc1MR7NBKdUI/5jHckZgWsWtuwmu7BYwpHTDwHdclVGN6oseEJgvpl9q5RHdSMZDlmdIUoZyNGkQtpQ4mGQ4UX+SnLEAL7rMpU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:43:53 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:43:53 +0000
Message-ID: <87ik1leld3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 19/27] ASoC: soc-component: add snd_soc_component_to_regmap()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:43:52 +0000
X-ClientProxiedBy: OS3P301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21e::15) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 55b6819b-3c47-404a-b008-08df4a958f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261102130727099003|261026121527099003|261021121427099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	0bjfGCu5XFzGBlaQtpYT/BV3ZzwTusRegDW8olKJBDxokiA23gAM1NeGJszh0yPMYwTyKKoxbxdDbID7sXKRxr7VQvmfWnKmNMBf4ArmlqTk3IMmoxPu27CdNcvUVxGIowLwYjWB+7UB5hdFqb2m9AdioXq54NbHWTKpvYKeZty/hxjNxTFcQgq7lKUfoDnSdwqUmp4bPxXeEwhDgEMRLx1LyHsD/Q3MNJyCYst9WSshpDWY88DueG5kh2Qa/hQFknds/+Q2CudNTgTqde9KZ2w8W9LhO9+lth/eTj+Us+wrVVT4mJazzIEeWhfBZnXbvDor3X7voeMepdq0+/uwhikM2ECh6oX+IHsungF6M9o2dKaf7FZGsdERQKfGhX58nio0+06LCGzof4lmZl7ivymucnRct3TvY2tkBX+JFv7oP9zGh/3V71GIVH2XdPZ8lwRQ9ywdH3JmVLhJsBYdsB4FZhlTzbw7BXii4VPYRxtpotklYVJV8hicEjHuEU1ziB9tuC6OkBF03lxxAQXHf4LRtMEki0INNpf6FF6zi9GVKgGzPBuF3zlI0ohsbdPvc3a/TxF23RCg480hP51pffkMS1ZbU2tqnY7t3Ywll6T1yEKcxx2Z/4qrFeR2OQPQrC2hVavItlb85jTWzEdG2jG8tKY6ROK+hIreBpfwkH0/LCWi41CGy6JDqXjJwUWz9TopZCYYwZ5EiDjtxT5J9zq1s9C0YG2lupLITaCqdRY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261026121527099003)(261021121427099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?qcF6snoHZ8iRvYuO4kc1jvAU866Xp5xccaKmA+BxNOOpInoGBBzMoZcp+5?=
 =?iso-8859-2?Q?m0CNrt48i4dos0gbsj///ltontH+LPNvjK7uOjts2u4EdSOAE53DaJ9JHV?=
 =?iso-8859-2?Q?nNDDj4+RejpEbL8DobewnL8k8AWoFjO+GHGz8rumgrh+E5RlP1Z7sTHq/R?=
 =?iso-8859-2?Q?cO6VXpkb0c7tjfkkwXWOpmVj8iTX2ATXRTIsDul/WmClvlsz8wdTxEysdl?=
 =?iso-8859-2?Q?J/BOkOk3vsUdPHrEpp1CM7zltIOjRLT2iise2BHd6QdsSDX3V0ACS4ITH8?=
 =?iso-8859-2?Q?LlQz6lOxcx3wAM2NB44B+Z+FMvXyxCaQTrrV4NzRpNpfrAZWz5Dk5ZXezX?=
 =?iso-8859-2?Q?mtVp2zu+LzK3//NcnRHRvugb4vInqKesMnT7sFroqFDxZBYnYoJAaLKPYd?=
 =?iso-8859-2?Q?SYVJq7rXJnME3JbDKZmNrwxPdAoShhrilfYbNuhBbz3ybyjaSEt7RUfsY1?=
 =?iso-8859-2?Q?/4270bDrGSY1YqmJ/lrrQcFLJP8bICKF1qySqesXNaE/MQ6H/hM9l6mFpc?=
 =?iso-8859-2?Q?S/QC1ea4lOW4/UfeSFV8HnrHk6gQ1UADoYDIOKJB9G7pd44F5+StfexlFR?=
 =?iso-8859-2?Q?NhyCBD9pqnIz6JB7io1tg3lLtGg5HqiyNDaVSqPnGqHyIv5UQFaxIRJQbU?=
 =?iso-8859-2?Q?fLFDY0bonnAgFYAP52o90tSSSl1+Ok+xwc9wCcu0Ngf+PZTxVCHAOjyOXD?=
 =?iso-8859-2?Q?DaFua4nn40VT2xdQJAM2kcrZY9cSkqcMDAmtMr+gvql/z9XkuSLpAPi5mf?=
 =?iso-8859-2?Q?hMHq6Bx6IqSrsKAs4sSRfzm+EpVhMusJabCHL7zT44ekgl3VQMrQ7mEoOq?=
 =?iso-8859-2?Q?Sw0mnSCiHyq3D1BBley9/pKLG4sGqD8mPW6lgl6t+oHwZvMZDZC6itJV1w?=
 =?iso-8859-2?Q?54AoxrejroftnM3A5k+AIynNntyq8ikfWGcP5kG2uPX6mnssNbH/8QB9QD?=
 =?iso-8859-2?Q?dxL2NuLvcVlKe5Wp3+P/WpZ/5bZmPz4S7p2qOmrEKDHbo+wm0Kl5EThVir?=
 =?iso-8859-2?Q?7gQ/Q7hKk9R1Da1z2pSf+pzgvI4F2fL4ioVJ0rZ2mq2QHkBRMtz2Atvl3s?=
 =?iso-8859-2?Q?RXKJRL6GWBchWV0iQP1LIH3Bhgwd8N9N9JA+ggqcvxoVQVUH+ckde8ZPLx?=
 =?iso-8859-2?Q?r1+PWECzLjBZsKh4q18ppNClfqIoMyWUoe7EjZl1llweYYqi5U+NTX1kKO?=
 =?iso-8859-2?Q?LpSZNAdAv+Y6Dm7cjaaojR4I6Ub9RPEpsUxtBdWBqtXhNJGvzY3+UqHqHZ?=
 =?iso-8859-2?Q?AbL9c+xOu9mJCwEbZik8o3s18zqqK0Ldw+cBhejKJ2u/rf0mBsJpBrk7wg?=
 =?iso-8859-2?Q?BFbYrSPhhrtvaD7Aspfjgg9c/i4jeOeOpORzZt9+XWzhIRz7PfenWDG9uV?=
 =?iso-8859-2?Q?BnekX7DnEc1O+3h5GUde57Cn3kfONLtY/qoGF7AfKmub4o0nb7WHr5Lu8k?=
 =?iso-8859-2?Q?3Kp0vDPLu1HjJDbMWWdU6AwIc6ngL6Tszdsq4237u3iJbf6cpby47I6bbY?=
 =?iso-8859-2?Q?lI5n+qomnaBYq/Y9OQWj6lPnJ4hpYvyJbShFUmd4xiP0RNuItKDGOaYDWs?=
 =?iso-8859-2?Q?se4E+uWTTSD2ZkYZktfQoh6WJipSG/TByXwRLdSksNqTXdDwyHU8c1E9SK?=
 =?iso-8859-2?Q?5PiGosBzh2VtAcFzYQ/RJNu5UCX6gjmbTbts70ltLN2JM3h7n+iXGQOjrB?=
 =?iso-8859-2?Q?92kcKw7S1rkHfrWbssaCj5cKU1pStZkG101GCeBf1ivf2GyhOcmNLDgp6K?=
 =?iso-8859-2?Q?Xlhazf8wNCCqQr8hIvdZkwI+DrIpnzelAJ+cXOWH42oErClkfGcIBJzejr?=
 =?iso-8859-2?Q?LHuCdaURm/O9cfIrOcW6VqRktM7UD2XLqjX7+TIxBJvgZCirE5WT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b6819b-3c47-404a-b008-08df4a958f91
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:43:53.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwHLXhTabwpnKmtdGqDlj4LpcGIdaCBgL5ovVnTUEyT9UmovkNnXmSX1ZBA9LPLY5OpWU1zTMB0kr5/S9AaiUlXJzC/Hy+mbX1X+U9o88CGwvE8yQszY0jsSju+j7mQA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_to_regmap() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0bc84c9c0e7e1..0caea23da4fc0 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -278,6 +278,7 @@ const struct snd_soc_component_driver
 *snd_soc_component_to_driver(struct snd_soc_component *component);
 struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *c=
omponent);
 struct dentry *snd_soc_component_to_debugfs_root(struct snd_soc_component =
*component);
+struct regmap *snd_soc_component_to_regmap(struct snd_soc_component *compo=
nent);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
 						const struct snd_soc_component_driver *driver);
 void snd_soc_component_unregister(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 110f4d60d4a4d..f1ff81412420e 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -92,6 +92,12 @@ struct dentry *snd_soc_component_to_debugfs_root(struct =
snd_soc_component *compo
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_debugfs_root);
=20
+struct regmap *snd_soc_component_to_regmap(struct snd_soc_component *compo=
nent)
+{
+	return component->regmap;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_regmap);
+
 unsigned int snd_soc_component_active(struct snd_soc_component *component)
 {
 	return component->active;
--=20
2.53.0

