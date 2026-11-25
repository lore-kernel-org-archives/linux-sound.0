Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571011;
	b=Va9j5nq+K0PfOz2/bZiqiX4Ir37Ru9yDKPv/F9MZvnr+PvYOR/6LkKLhxTFdW4yFXrtz
	 ldw3BTg5Bl5nZed+zraS+gLUTtRjpRcs2t5QWSXacRtnfsKh7lrFKcCjmPDftxSU6NN9a
	 9N9fhsqQWYRhg6QWHCYyGXEFlv0Dz2XDVqpV5ZD1Gg9TqfFkmXVmV47up1IRryX10BRkS
	 wACPB7hS83OlFQrhmqdeHFKow93BfrFgU+KlVLdWh2E10cpjXv8TRTqMacPu44KT1jYuK
	 s1yYieG3h9KY/BuMK30NlFJIo6gBJMKxwqV8twcZKHIA1//wsHvSgmxPx8LCUlSnzbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571011;
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
	bh=1kqVbWSAuMY7IwdXqKlMT4i2BI6AhiUv2eEdgMg/2/I=;
	b=ykA9HPf/cGLRCuB3ailDaiUhBh+/xZQXdmQxo9WjtBL+G0jCcXDBCRY3stej2C36/7t3
	 o+I207BLcwDRYmw5Q01kMSvpE51VBj47sstMHlBS5RzVhX/RQlcc8hejM+c5sQXtKdAkV
	 rPENArxWdLQD8ZVO0bTo9O5FnpzuGz49sdN34s0i89B3cmhvCjylPwzJCXXMrHxp5nrzb
	 bD0h8uNp36InlmQd5tthrhQAEcs9r1J9eQ55Gaz0vR5ElQ4bcUba49aR+xPZAT1eS5SA/
	 Sz1bCokMf54LP53wKYjakMPeW8YnpbR59KMz4smxT5//nFh5oJ7xPQZ1sXBIBRxTq2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=UkYV4jpJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.25
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620B3606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 620B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=UkYV4jpJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSt/vA8hOq85rvSDhTFG8nlNY3XJKKNgDCb7Hoafj+DLYOgUoZ8AX1kCgVuPFRhFdipdN0rnYN9Ir29AEYgl+ft5qXV6UyUKR2l52saVVJQRKQttsqrSjUS5FR1kdYFKfW0hp+kmmUyiK/R3OKaQfMR9fWa8oZpTvh+EfrlyygaUfiiOfQ9XW3mQGkFlWFyujUmZZlun/I4Btrja3JEnl7kGUo724Dq3Fo/Ft+50f4bQxdZaOK0dy4ckl5tomBXv0SxFN9s1FVnlvZJmuns+us77McZmRF1owFg+NntcptT/NmEQYB2r9W73bORfz7eCVif3wgzjnd1BXXC7AfArSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kqVbWSAuMY7IwdXqKlMT4i2BI6AhiUv2eEdgMg/2/I=;
 b=hXE26gNamSGuF/jxahQADiqbyz1JA2kaAfP4/rd9A7s4Gx0P5+zs3PiFn4XaehzqseqH9YWkKbPH2JH9PqvyyEjDi7LfYAWmuDZZYi9OmOVtLQACoXn7/ZgKonA66TIrXecdfdcpyyXoTPs2vf2Zu8N3A4qY6aoTYxxrBx9+EFTSvsja/Fh23okGiW2zbLccikDLeuPJG1H/8sh44eFK8/CvheNwJgiIzyW09+jdvpqJD2on9Lp+TM0eZD3d6Zb+hGmURSSucWG66jDJEbzJsAkGHytmb4ga1meZAHfQvp1olnRlFbZbNtVewnPU5Ru3pMYqN1YEzdHIOm8+i7hEoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kqVbWSAuMY7IwdXqKlMT4i2BI6AhiUv2eEdgMg/2/I=;
 b=UkYV4jpJEdK0YBp6C5kH5NS6opUXAxxQouoCqyySeD6u3hxg8Zdn459O4Es4PG6gz/tPCaiu4sEKw3DWH48bedaGVT6WAnL14rILwj7o6oa5eEM7FOqx7nR1a5uOEMyQqdkAPOD6lhKJGRu348qdxhOrk+M65BhpHyW2JhDykn4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:43:29 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:43:29 +0000
Message-ID: <87o6bdeldr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 15/27] ASoC: soc-component: add snd_soc_component_to_dev()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:43:29 +0000
X-ClientProxiedBy: OS0PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:604:24::8) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: bed09e13-4977-4619-986e-08df4a95816b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261028144727099003|261102123227099003|261102130727099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	F7J+TYrS6ik6xulMKRVB6S3mkokwMrGJg00/lgxou2/jaIxF+R6gldxCaOJQCAcqw/sFKDNBY1odismR4aiteOlPb4SbUMkvXAyvA+N5oB0wLFttKbJo98v3rJBODKWINr6v0T8neecVHLQ+yQJkE18RuoHpBtZklcqGAJgfTFXClYkHx2fVLhhhvIZkEXRcKjezodlBvqz+RpLRzlPfb1753rdkLh2Wk7xl6PPVdBa5DMeTpLc97F4iL6EEVcKFzGMrEZFRxXzc7r2DSXypSxSkEG5Gz/CDf5uU5fjGnLcLJvlrn6SV1UDS0I7i+izyV4D45gte9AXwsPsoQpgH9AmBka6H3pUhC8BFkS+WSZyDE+UcO546+nqwVgCHBmK6W7oOpGDdi+twkZI4myj+H1gpeMn+Vh4dXo1I5UNFqAUj51QmBMNUKfUKul7HejR5dDeOka9uMKlyv8KRN+pVzZ8/ICsM6CxF+0jnDIb5kyr3XLA6JEjMCpWK28DAZ5PQlnwbTfLen+SCf5Qs4WBPfJkka4gQPXWxnlo1cIY82QBZz9zmNyJ0azCKmzDCSV++gpHOKj8eHlJwiWxVWPfGVMgC0pm/oc3C47ll7cmlFCo/p+mc1cHPfBGtuskEAjg12fSxpKwRJlgf3MIaiXOs36lnVXGlWpHjBhstQ5GfeAOzoIR6CUKSnBFiviTl4nF3J8X3wGk2ewWIuSfAb8+DLtnaI1WRu8/MYv+TKFEgxHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261102130727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?z/c48BvHv7geS0d5fH90vZk+k4whCxAKGJ1VAtRXE7CwASaOwwVfrxG25Z?=
 =?iso-8859-2?Q?aPqWpAlUISlO7xCY4Exugh90LQncTDnSwUfGYM2WURLrcwk3lys5XXADz1?=
 =?iso-8859-2?Q?/kuaJunifcl517yBUsE3ZNVfeBcRo9vJKUFZgEDxee+orzqWP4/x6q1jHu?=
 =?iso-8859-2?Q?PXhV+ZM8kQsDlNSXb1EQUDqzCn1Lgpq7amfmzjozmzrQs/gIbToLEIIrfG?=
 =?iso-8859-2?Q?4foxPmUFGw66bsvo5o1N+m2huG5CsYafo2gBb1sFXIVALWfSRFcJOSBUFF?=
 =?iso-8859-2?Q?EVjmCI99904GFj5UZAh6QbUlB8bGDzxEUF8zE/ly3IwsiRmFFcVebtN7mA?=
 =?iso-8859-2?Q?6hnzfArOmLeukg+EXGXksEzFYSMOJCugSlAiTyYr+WLm1Wrm6iX2OZCU/w?=
 =?iso-8859-2?Q?CPd2qnX/9CYmrpLOi1y2qJjuoWnRg16fhcwMLz3tEjPGA+ZfoWEexiRhFa?=
 =?iso-8859-2?Q?K6kAiw9sDtgy6iVg/KVe0G0AIDmmCo/rx9vTEZzDaWFKYkDvjgJKGUi9CC?=
 =?iso-8859-2?Q?xz/nxcCqFft2tlFBW5IWvaHSVl/n/he89hWfMKvUGl+x+exxTS6h3QysqB?=
 =?iso-8859-2?Q?NSyzGBjhYC+Y9q/ibRUVKbn6a71j6onAZxbzQXVX++uvJHMgvBx/CS+NAA?=
 =?iso-8859-2?Q?jjKITQyrtj9hogQgR2LGJWDv6CR4a81w/YuKqxOLoM8w8p4YXbxETtKO2j?=
 =?iso-8859-2?Q?J8hPeyPu7c3fjOEYdZMHZZmknk8tB3Kn+Ncrf0zKQW69BPfOFknR+fSZkv?=
 =?iso-8859-2?Q?D/H5UOi25ORhodebK1mgJMaTOtGbnEUYmrToXH80BIJ3/3XWl3m/1jzOdp?=
 =?iso-8859-2?Q?0MQ1pE5Meeru7dwnOERjQGh5WluaK8sFHWlwT3C1odsPUH9jTQgMtLzRri?=
 =?iso-8859-2?Q?8ZYUrF9+dlrdR4RG2y8jvuWMGwvgzZ+2Yex5q0o6Fwl/4SQEAc42/cHHhK?=
 =?iso-8859-2?Q?Pqiv6gyZDdvYUAEsgnl4xoLBuitZeqkMvCodEkUojDdrX6MZkkQjJFpJyH?=
 =?iso-8859-2?Q?OITz3J/yNyAbAJxFDjpFeO+eztLcW3o4t5SaZgRkF4ItFU079i5WINAKDS?=
 =?iso-8859-2?Q?N3eNkwtyKxYdveXli2wdt69Zc4qGkMPKLt+sKu+ph1MFpTxl62nVAgsWvz?=
 =?iso-8859-2?Q?JLYb7uRwNaEob1hg9ry0xaR/m+osPOfGOTXaJJMKFt1Bsjstec3hXuidaa?=
 =?iso-8859-2?Q?Rvqox3wd1sz2LRWPgtvCP1W0UJ7xrZRaWL1kn/+zb4GcSPF9IrM9C0YZkE?=
 =?iso-8859-2?Q?EGP0/xUyrEWQYxaPFmkTqzqUnYqIMk66+ygP6V7SQVCKe5dMrYGfWRsJ3+?=
 =?iso-8859-2?Q?IbXpBYSnt5r83EvK9kQNgB+LX6VgII6EnuXPIIIR+B4Zd2/IS4YsUCTbBx?=
 =?iso-8859-2?Q?gkP/vYV/uUvQDKRP71OAVtQFlIBjUjGbLg9KRFWhWUsmK1H+QxYKwyfw1P?=
 =?iso-8859-2?Q?/NSmWJCeWnEN/Ay7Jxu+9xdA2QxmQpevnRK8vt+Yp4Xv+G05ZfoyjQi0le?=
 =?iso-8859-2?Q?I/Wkd1gDKLVHtygGTuLD0cAgETY2PufuSjNSzJf7gi+j6J7eZ+iVBONN2P?=
 =?iso-8859-2?Q?ZcnWeNmlQaJUizta2eRYMeZ1jocsx9Opq1p2Z9spYZwTjjqnqkmqekkQtj?=
 =?iso-8859-2?Q?9zKs+1tVaBglznV2bsMicsb+5FrlHSAQgkr0KuNzZ5plzNkwW6nhff6njT?=
 =?iso-8859-2?Q?LsbGmyZlQ6a0/r3YfDABZSZX8F0wVx7/d4hbA0pLk4wiIWVsz0ixieEKBp?=
 =?iso-8859-2?Q?eZngmeFhkw6nMsKUAloVLNeT0akTBmp+k/xPMw97z7lh5D9DBcywSYHOyk?=
 =?iso-8859-2?Q?/lxAWg1ZjwzOae9h6zOK+kghg2LK9Gkq2st7JFVPBDRTG8H0nT1t?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed09e13-4977-4619-986e-08df4a95816b
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:43:29.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAFlZckqLGS1i/Dafc4RQe3q3jQ7jNl49saWd9yoxAZEUMXpkLhzYCB1VtiUNlRHCQti9fCaOiOf11K9Q/Rd9+91p7AFP4mcOJH1yvWWdSJmfKupGVlOWP/9SmZkX9EA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_to_dev() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index e78e0c9cc9d0d..8a03730a2e54a 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -272,6 +272,7 @@ struct snd_soc_component {
 	     snd_soc_dai_to_list(dai) !=3D &(component)->dai_list;		\
 	     dai =3D _dai, _dai =3D snd_soc_dai_from_list(snd_soc_dai_to_list(_da=
i)->next))
=20
+struct device *snd_soc_component_to_dev(struct snd_soc_component *componen=
t);
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
 						const struct snd_soc_component_driver *driver);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index e6c0a66c7314e..cb0a75901ea5b 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -61,6 +61,12 @@ void *snd_soc_component_to_priv(struct snd_soc_component=
 *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_priv);
=20
+struct device *snd_soc_component_to_dev(struct snd_soc_component *componen=
t)
+{
+	return component->dev;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_dev);
+
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component)
 {
 	return component->dapm;
--=20
2.53.0

