Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443597;
	b=pQSCowISJ8ihGOAth2Ks9q4hXaR+E//kxI9bgIdPEmZJuXATa9fxGRJP0T8Z9FUvu+gl
	 pI9kIYvdlUPUJDKtyP4JCy++F5F6Y/ZDR/QfJONODYeadHBcldisyl1VIG0ebYYwK9bUa
	 yWS+9wvhxnczBlHVdg7K5L3k/E9ltpUGM4mHvH8E3TrgfYvsPXQjSguiqLcYyKBBlRok5
	 826IenRVZRRMCPJV5sDmGgY8bs9TPsq28k7yhAkg7wRCGgZNi3Gfhpoi2Tpbc6Kxs9Jm1
	 EFP5JLZeh3bHwPwvtn6GrhjAsphwJMlfg6D8wIm5NzBuE4ZZgEOiSKA/j+AhJdlUOQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443597;
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
	bh=bOgfcvNOqEBSLbU6mCvcn676LJjZI81HuRhwXtsDgOI=;
	b=eVGFvrdxdfO86GS39UjP5tRXPb9wMv3JDxRrRHiTMxW3AFdbokXlqKrNRyIQ/0erWbVf
	 g8G03nxXIn0FMZLCtHaXkH3fVQal48FdUvsWujophJRebdGxGxDv4qdZ+Urfve6wH1tIV
	 /e1scI+jBSIM8c7PiVpGewnfTQizNWPROJZgwpsaZwdYp+VBgVgj6M/meRBMXqNDt8UMz
	 hkV85yczwGnyr3na/udjIr9a4X1dWzLpKh2Z1jzXCdTqT2aD7fwpZldfiXbD9rmEaReAT
	 sMMZH7+cngBpM1P067syxYmx6FfVdx7W1ez1ARvFilmzX/FkM71zck1h7Ga8v1b9+sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=K1wYolpn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.61
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E640C606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E640C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=K1wYolpn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZJE9ZwMaFpnZjpoRoU98GsYlwpnHnxza6S4a7E5iYp8VzP46hi37XrhgRPFXGemsLkoiE5VNUBs8DUd/iKJ6OMEvZNt892ZMrjE4V0RARuZtorENekLqDLEI49q7h7vhNTDGHLMHRC0+pegjDeuctc6YijpsadZfhgfNp6fEobOLGPvBRlB99VjdsIYRJZMbxVDAHF8G1YfB29dsSzs+5hkjQ1HcuevgdLs6CYR5k7U80/7RY0H/ff0Oz5mrVcKuKGxPmI2WvntxlFCWhgT457M41JofUY6ynzXaqypoFbYshgGOPBiOQdmbLCozPlpk8Giyif2M9KBLKhR4pi5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOgfcvNOqEBSLbU6mCvcn676LJjZI81HuRhwXtsDgOI=;
 b=YNEi/oriifsaWunSG5LAxuOs5yEQ6PrDsVCzwpq3iow2RPol7dKj3t0M9qg5iCuWJGeTGCC7cRTUwfXPA8K21oonmZMiMga5CFbyLDjg/UwwI4kQJjRLwT8/Uuybg8j23CxPRKVLO/dQXP3/OEIflrKL9cm5Nseqf5IzUppqCgNO6oBvBcGvUBnjpAjtczJYe8zIOEN/yuOcYaxTqnj/c0K/1Jkv9O4tQFeF5PvlICgauegnNVEJ69RTnJfNCiuCAszELaeoNS8LrzWNcEGjUid9SRIS2hB5s1L6r8aw0GWaIeRqYPXNPvKuuWtWxckvn9cxq7SPSz0/vMLsPxKaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOgfcvNOqEBSLbU6mCvcn676LJjZI81HuRhwXtsDgOI=;
 b=K1wYolpnjY+h9MxkOhL1FMv9B8osMGna/Ld2wUdX4e9iaWkEbWdovQRFPIgU5452YRwl7eF87HgV1QdjGb82Hw1X2Mto/p4Jk/SCbgaIzjGicCDwpxr1RmJnsmR2xyL01oiq1l6+RS0qvesyLrEn0NxzFQiz38MRp/N1EdFM2x4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB13263.jpnprd01.prod.outlook.com (2603:1096:405:16a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 00:33:14 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:13 +0000
Message-ID: <878q2y28ja.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 19/27] ASoC: soc-component: add snd_soc_component_to_regmap()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:13 +0000
X-ClientProxiedBy: TYCP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::16) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 6be5d3a3-20ba-4d8c-0c7e-08df40548956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|23010399003|376014|261009223027099003|38350700014|11063799006|56012099006|261021121427099003|261026121527099003|261102130727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4FwJgr95DRZM/CDsWS/RElFgI45ztSsF4aRf4RqK+b5D3Tjh2xSEkKDE9QR7uWfeIgX7mcgMmFDz37gNbauPyLgkguMKKrapdP3nHclso2fKFziZnG0AU9rM0me4b6/Y32E444ld8ezLgLdjgYYo5pbqAXDBepaFIYHTWTqBCJyezl/uuQw1n9K33+D1CIx6dThToaw3trc9a/VCmJ3sB9TYmETh13UMmG0IdcP9ij/6HKg0zt+/g+ISIyySWLJFA5f+6Bbvf7XEcDAbFYbky1zsH3peUzoRpXr/R93snMwzQFCVX9Sqy+PgenO4rpwuTEoPlG4GB2ACihLLRdK1rbOimWVnanMHAcFEqGSuklfYTdLgkjLdQA3ltw0tA6qjCMLiMTQC7O18NwN2K1/eVy7g//+wFqx8B93GeU6L7l/DdcZ6dMbD29Q/Lx7SVtUUNZg6lWuhDy/ya3Fa90FLj5yDDpGOhzE9v0qEMDncMamfnT+UAdpjbIwwhxURw0yZ226AZq/1VwLkDHpZjuWwmQF0D8kUWJEP6+bQlQOjuoxRv5i/UAuDVaS0AnthV5LYBqgGa2bPa57br4ultXjUPcUI7lAGxj0IAmhIugTusGQa+I9BhSWRo+rUXQEsKAv9uWZQ+uKljObfmsN7KO2h+HN1x5HcxGqM4L9Cnw2Zdm/kYVAKfb9mbIkJuLmCmYnqH56tnaMwbXLmgvmanju3b+ZOIwCAJpxH9mojDkis20s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(38350700014)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261102130727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?B9sO7j2aQS5GVSzXyGygfBOY8fRn1WLcMHwPosaFmPFXMRdioPEnxLPcJV?=
 =?iso-8859-2?Q?634C3pcgtbElnFujjpWn8imbHWRTVD+/kpDKmHiTRoqCKquV1JFdz6UCpp?=
 =?iso-8859-2?Q?7HYY0RQIZGDWtmVtTyihKs1Jpl6uXd+empW0pRtS06UWKPdY06z0AUvP+c?=
 =?iso-8859-2?Q?PdrP3fLUL0+dQ4DbPIGSmjzQjMkKJ0c8wu0loZI/PMg6FMzOkboCvOo4ep?=
 =?iso-8859-2?Q?0GqxMPm50km2YQWLqEazqEzRq2Sj1KaVm+x5ooK0Q7eHGVTpVpSYRVNh4V?=
 =?iso-8859-2?Q?0TSwvlCcDmryBy6hyvLGPzQSOa/i/hQQcSnuWHA72PCEvkOml7FypVt9cF?=
 =?iso-8859-2?Q?OfrGXtDwuBiqqkKiv9ww3kXjJmNirh9XiRTe//HjZxQKXyyo46DQFAzPkC?=
 =?iso-8859-2?Q?w9tnIgqpTcTfrgmg9RTjA8YVqVoJlvZUuQAuySn9+UGLk3WGB7Z9lSucH8?=
 =?iso-8859-2?Q?4XD2E7BearQlT/6LS+pqj1YSU9ueO0NBgQ3mrphre2/Sv1VH+EtZ4FKZD4?=
 =?iso-8859-2?Q?JRgdKTDNcJrYvFQZCrqXevb3qut04OzraCwd65hF2sav5z5gjsdsDi2lZN?=
 =?iso-8859-2?Q?dI2zEbTmqJTKp6l1+7Z94mLQ3zXH/N3uaS6hBo3wC+7J9dsZIDEDDTLFDa?=
 =?iso-8859-2?Q?IOfXce5x+4tj95iqiWYn9fIhkj8yIgfLSEOxftwvP7y+vW4nJfL6KGqa7w?=
 =?iso-8859-2?Q?etegB94kXs8wnd3YlOT9xnQeQ1Lzu3Qpo0Ypi8B4wqTbzujl9dJ6D1Frt1?=
 =?iso-8859-2?Q?L7rkKjDOTXqZ6UdRZFX/fetWs44tO7kKSPhioIanpwa221DNPrEduHaWBS?=
 =?iso-8859-2?Q?cyLjOwyGHeY58neJ0tLBMlh2iZ7Zb55rKIRKHHj0kY9vKHJckcLW3oeT9m?=
 =?iso-8859-2?Q?fGSjootomNTdMQJGCKr9pj7DpBtRiDKHFY78UvL7NGpfQAHMzwQL690Ubi?=
 =?iso-8859-2?Q?BG8QBSIV2NPBR/7gLFV9hcN2tbR5/o0qOoH+6mNJbvKfXwartxkkfndnik?=
 =?iso-8859-2?Q?cqSUASfttSKs+GeOwFpnh9fLdjKC1wmkDCxUHFoQcaFl90YQBb4RKi7G/j?=
 =?iso-8859-2?Q?7afHrduHe6dNpP6AmjCxkk7PfuuvrmradB4QItBb9kUj7cFYWga8W/2AHw?=
 =?iso-8859-2?Q?j2AxKuJC9onuiVNodZcknUATCkXzVS9e1dQRQIqyW9POo5Fd4qyUMOtyLr?=
 =?iso-8859-2?Q?9/rrL2YWomEL8Nr97DKBSrSYMYzz/ukAYmzGqVHFfp79mg5fVynvqWrQqe?=
 =?iso-8859-2?Q?lnQhZElxA+1s4hCDlB4M/dlafCY6+jmsliUeL53qWvqkKJ8/jUiAPsiB64?=
 =?iso-8859-2?Q?ZseQxpwFP8mbvy1R0Ta8OT5xUIY2S5+07xs64+HavLtECs4/AqGxaNRhPY?=
 =?iso-8859-2?Q?EZhE1CEsv0CdtTYnLp8IZ8cH940CeMlwVWFTVpQcDZr6ytzMhk5poijiR+?=
 =?iso-8859-2?Q?3oco9DYTafsZzhkQl0Z4G91z6Q2mwJAaSbi9KNghIU5g9O3EcDLaJuW7WV?=
 =?iso-8859-2?Q?cush1f/g9VAD8jIsvLAmIt2+CXDdssLhgqlGf+RvKPWf0PG/MrXAVx82CU?=
 =?iso-8859-2?Q?MNV/v+CiHyfFJfveA+n4fbZP/Wwwj3P51B/jALOXlSz/Evsea61AGPoLgT?=
 =?iso-8859-2?Q?YWj/2YoIfioKT06/v/YGX1oMDHSYG4ZSflQPWdLeiYv4VI3C5DoJcLIVvz?=
 =?iso-8859-2?Q?/hAVFynvcgHUxgzhCrrpEXeWHgil7VQvADwUeu+0O1klsjP9xB12ac5bAj?=
 =?iso-8859-2?Q?ZheixZlhXVI7KRGEjXrpnzdEj3oJWQBTXcWL9wFAvsG83FLCJuLxXQZsNE?=
 =?iso-8859-2?Q?+xzKJOIw/k2pMkPMYWc7A6s5f7WLjd8JxZH9YXcF3FuzRVQyFF2k?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be5d3a3-20ba-4d8c-0c7e-08df40548956
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:13.7214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKWzOjnEHVolVLffh9CVDnxpYapqRzP9TKuMpo6CNP+TD/IswIj3HU7v6Uns66De+AKoSx9o45rQVE1k4FeGszNPF8/6JsWkZfMp/htS3x0de9lMwJYCDSj4S48qihOC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13263

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
index 88822e0879744..c84fb65732efd 100644
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

