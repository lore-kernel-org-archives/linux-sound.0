Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571039;
	b=Jpyw5YN55js2MBZkOLcLsbV2VpGF+VbHvMihFbF7TBA/HhXAddA/8fwitZwIarJzJ6Yc
	 ynF0tc2q3gojf+DWoVrPg4Wn8OMWCjS6C9KmTQ76wIM8rLb2U8rGL3PkQgx5B73+BMfwp
	 07eomtZOC8O3VmZmXuQNMdsZyEQ5kQDvcNlqOZ3yz1gpZaBKQ0xUe/QgbizoDx4DKhxo9
	 XHy+57TsMG6tUz1QajrQ2UV2MNSrjgrs6xCQOVRxwxnnljawjO3hL62PXE1HhKkf6q42L
	 SoMbbwA2B9wV2QIJm2XYDrRvtvgsVE8pKlpaQqaT6RwPNS0cX5LiwPZKf30NBauzI9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571039;
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
	bh=eV0XOB2KgSBCtmb8hz+HBvHOuVPgOKVkuH7IbMIDAX0=;
	b=P3L+sduApV4CAMs3FP5G5P8Srlv+d6XH9YwJETTi9rJGtEV5/0TNee+gwWIDx/lwdIuV
	 PQf1Cp/Azbb29vjgoREfYPqVYvTc4R7p7h6P+XqgWFj4i4sjUnJ1QbXn5dRsENqHRWvA+
	 e2QLiBz7bdVDTO2/TAvvmfHoJ9aFAADizgr0ip+1pVyDEaDrcAh71G8HRwv9HxkcJm0pY
	 14xX+yh8uIlFkYWR1DpGs6Pf8n6iF6khe/6Hg2Lp0fIMCf5dWx7jGcwlD76LOXoXwIP1O
	 Azq0ctZS25oHUvd+HtChIOzvxWGaCyslWEvHUS013Y3Kr/ExVYGWmYywIEvZ399ArdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Jg8xCCQa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.16
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02244606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02244606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Jg8xCCQa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPI5EdsPUPYE/L20BKchjU/BewV62hrgtUMwLIFe/qZrRpA/HEj4WK6iptdEDImaUyfNuZ84UbMOQ4UWREUZ2TuIEwjP4Ezv8WO48AJlgM9zMyweLOcJy0HfIh5l/wP/A3cEZdTxykRkw3moYkP35cg4PrUrS/vkz7HfXU8zTDud0fEnGcH7RsuP0dywAoUwk5qSwXI3XRxgtEnb400lPGixXRa7Iugpx3zNN28rh7g2OmSqAfyjV9uLnR6UikriXgUC9PbtaLBOrMgFPqn9z8uq1orYQeLfG4qbHF2KFk7BvavQY3Pwray4Lj08TqCNuLyfvDxk+bALMopy/sXV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV0XOB2KgSBCtmb8hz+HBvHOuVPgOKVkuH7IbMIDAX0=;
 b=A6QtsPi2gHSDlG0kRP1n0JCMHOtW7A9k4KTsZy3I5lJn7Nmkf12OKU+m9qdLvQZKjF/RtRe4XOOMrpGB33NC4xm+MxU1wWl8nWskL+YSBT/fJmh9zbJzl7JoqcGZt98WYOta7kCgdBc5bXq+RWLyevJ4I1mcJP4AQWOPWukJEqGuPjxlkQ6sN6BnQVzdcFtuiNGr+7r0su3QKjBbFyckdkq56P5/oLB87s7FGRqT7/I2f57ITA4Qs0CQ4jaSWYnnrONvhh1Hj5lH61u7ruYirJ4WIS+qWg4/ZcymOgJg3p3LFQ78yx322OQzclWsWI+lPF5dAdfg+aLLT7qTW0vnrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV0XOB2KgSBCtmb8hz+HBvHOuVPgOKVkuH7IbMIDAX0=;
 b=Jg8xCCQaysCOTz/4Kihe+L3JjX6xjmPRry0IJlkD0dRTdwbfv96FqxuHXUdzzEtTYddQFFJHgg6Soboeqlc4KP5FKI2xsrqN7AaIgIhC+9/SAiVYaIlZ5Fuv5ggL5NMWdQF/tpoHO90K431G+Zdw82kcZSy+pan8M5R1xoiYJME=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:43:56 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:43:56 +0000
Message-ID: <87h5h5elcz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 20/27] ASoC: soc-component: add snd_soc_component_regcache_mark_dirty()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:43:56 +0000
X-ClientProxiedBy: OS0P286CA0162.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a::20) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 96bf4a18-d50f-446d-41fd-08df4a9591cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261102130727099003|261026121527099003|261021121427099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	S4pRajV0b1UF75o/+kkHpNdQ6AfhlHU5ltaqC0O4+tMHZlGcvqDD1uK2wI/4WT9MVwmJxOcuTy70CkT725+YZTDPWSxiTMdj+28oiQxXz1NQvz9LTuk1COgr2/KM9uMxTEkkUBY1A1K3rgWuGZEn7utSpsz/xvauGkphwmmFPEXXGbK7rvDfHQkemDKuCRgTckLaFbb+6DJY+75kYfMTLnHGDmfbqfw82LShxaXkmQowz9T4sLNpk9KClWEWpIdaVk/JbXtQJBnwl2jsHLRjaRkbyfKH18CFAV8fQ+xCzZA2wVCYGSEGTDfYWQTVEZwwhC5SvGq1cpBVqczFobvdTm0/JEWlFIh3iazinCGWnn6GoC7RX42JMwkqSaSJPG1WNEShNNFQdjxnaDCIQvi9n0l0oazAFlenpp8gciesxYCUF6wmRAcRn4f34crVrG6t+q0JGxPQW/GNJ6JBsf1DKGefNNhRyCwzLpP0/f7Pg6rjNiM4s5FcPPxIfQA1fXZSN/ka288Y2BtHYitq4H1ZqCTLNCMxsmvro8XD/8fMO2Pp5AWjtZkbD94tjzHX8STgrxCOWJ4dlRDEvWt9jwL0b1bGAyuA9u8nDL3WTX9GBT+0u1GnPySyBo1fn4Eg9FNNYgwDLUWGUcVeLMxWUQSqzNUQAAdFaVl+DW8XWQR59Mt2+ri3138k2pyOJ8j97DLsQJwp+3YmHKyurhE2kiCRIzuTsuec0MlTJ+ivXiBoY7o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261026121527099003)(261021121427099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?S4Z5fxLKCOyvdriWHyLB9XmDfcJXQiX7XVJCZsGzORPcQ6cf7QLP5z9elO?=
 =?iso-8859-2?Q?0j4Vjz20ggrnte/SvB7ltb1wLV7julSjyf7kcvqhznDJudMvnY6WhiwhnP?=
 =?iso-8859-2?Q?BibR69uJs2AnuEaQKFaaDiD20JC9ejMzFtilgt9ZULoDrE225qF4ySnF9o?=
 =?iso-8859-2?Q?KNqi9UzWQdek0xaG4S+i0d7xQfMz6+kdJz4xwZTa874NnM3kOijHgIExqf?=
 =?iso-8859-2?Q?4FHHWT40QAs67wr5Ff0IxKXgK70M46ovpXKaH0G75AYqKGS3fZxHQf02xQ?=
 =?iso-8859-2?Q?kv7czNfTceo2JCiepRL3CnVR13t9FkTgdgH0HEOd2xXl9wik7csKISGiCi?=
 =?iso-8859-2?Q?PBWRSZedhOdH32gNOvOUz8V2xuvWi2L4uSdd7rr6JtSIEDwbml+rP0rnow?=
 =?iso-8859-2?Q?6bq9qWH8W9lDa5JjjGon/fDV22pT2BAQjJc7sU1GbFXLwApYy8ZOlVe4zq?=
 =?iso-8859-2?Q?97+N8pBprjIDb5IjvJK4kSJeQ1XjmLzpmdUWiakLfPqUk9g4+8IEG1PbYK?=
 =?iso-8859-2?Q?mmVSpDr27Qf9VD2+Q5RzMUwQCWFizkcUHMmhae6v5lzTYJMeXlZ8QgJrQP?=
 =?iso-8859-2?Q?uIsL1i7qzIRrmZId5SUfAx5n1FsWcewYHlJmxWVF6vpSjIga32dHlsUYKS?=
 =?iso-8859-2?Q?IlU0zjAMrvNr14twJPbTE5ZZBcfw1sPLsZB7ixUsDLGQbzJx+nxnjVJJkx?=
 =?iso-8859-2?Q?VYYYh7zpHU5t9yvXMAid2y1ZibrszLXl9Lg68v71ZVj2x/LeW8uCNmV4yk?=
 =?iso-8859-2?Q?LYJvyYmsK+TzwClNAsDtUZwk/H0mgUZfwTf25RRRPAey3jTRz0vw91ri5A?=
 =?iso-8859-2?Q?nLNtbcuGSzx9OfBD64EDZa7LpXjtWfiJTtrKd9IqWRhYP6MqBMTh0rqsMx?=
 =?iso-8859-2?Q?IPv/wogxthEUL2vDyhR4ugj25d3MqZ4Vo7fgzepAnDWbLvJWR2E1TG4HRU?=
 =?iso-8859-2?Q?L5u7qQu4smpsOCkHhlcEiu/7ftKCRKmFTDCPPM06T/+LWdvCJ1Vj776Kkh?=
 =?iso-8859-2?Q?1K0KpzUTpKJoPa5qKP4sl8SPkoG9ehNb9glCeZ2g/BHV45pFTr2LwqsNhb?=
 =?iso-8859-2?Q?r9RhF7TLDx66vs0HKoZYXwS0IAoQzt+rN1gESk58jXhYuUKiDCQpr3k4Mt?=
 =?iso-8859-2?Q?STrDLQlYPxYiRQcgxSmQMf5ozJeUZ0v1j9kGmeQ0xQmw/M1G/jYS2w1ru4?=
 =?iso-8859-2?Q?pb7lyQ884XXcusOdVymzm+w8fzz9qfxjr/WmJNmsc97V83MXn5QaFEFump?=
 =?iso-8859-2?Q?ZT/lmQsvS+c3SMUplJUQ6pi+EMlVj4y2C0jat5N9Kzhi4CPO4mIdU0QLrV?=
 =?iso-8859-2?Q?D+vUW/lZUIqt1p1VGVeNa4uE2v4NDlXrB2uxBMJOdUZNsz8AcdJTOVeTHJ?=
 =?iso-8859-2?Q?jhFjMsWlbksu+tO0lUGugvPJvFFRP0xcnvaGmh/B8K1B7vttNOtjZv6joN?=
 =?iso-8859-2?Q?d2rNZUI/sxS4JNpfc2f8aRcOii+HkIj1PkupyX/QvyknU3woeWlt7BMT+A?=
 =?iso-8859-2?Q?v3bX0z6YGfWMi3ZJJMwnur8mdfJUoTIRkXDS/oxEGmoA7vHeA5q1u+KcKy?=
 =?iso-8859-2?Q?FqN4SyRQOVJDmvPVjwc5uGH5uhaq9gf7XkOo5zOneneRewzHc+QDgPvByU?=
 =?iso-8859-2?Q?+11ob0w7vys6xtV89b2NHc1drhAt6xVtnWv1UvWnWZ2lLLZr2OuMMhnWia?=
 =?iso-8859-2?Q?TVEOHDgEYyXDSeAj+LxCRaHJ70koVrOE7GJhrQysYvElJJ7DK+E501mmB1?=
 =?iso-8859-2?Q?GTuFPI8tY0Xfwezb7Ch6YKz3WzOO6QpRYvmrwG8Zn5IT+oxAZqWveIWxIA?=
 =?iso-8859-2?Q?aZzqObX16FqV/gKX0qTfDw0t1KCIoJM6EpkEXJ9WOBAR7hD+lk44?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bf4a18-d50f-446d-41fd-08df4a9591cb
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:43:56.7457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFjrMOFbBgcCy+bqJtIHOrRk9qYpZVUa34oPRAiC9vOZuyUWdpJM8HMXPQfAOiGAtbqco8lLIQMViXAfUQT1nW2/WWlYaFUjfu2IJysWSXxG3Gqcz+7GGqNEBkxw9oBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

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
index f1ff81412420e..8c1da7dbcbc73 100644
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

