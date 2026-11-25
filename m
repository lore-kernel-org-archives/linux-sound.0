Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571046;
	b=YVHGI35OTMUV8Z9aBGUVRQ3eYI/awSV9eP/tYjBSw8mjUPcZ5EkD4jSyFruPizzbT9xc
	 tJM1AoIV+II4/MRy2sO79tzmLYeinPLmGd5BEgTNnR/o3dSZsOOinBaOmSV6nQLM/V1YT
	 SBnwpFLaAHwpKZKNVIVfiXVq9oEaZUC47IQ4nSfTUBNPTjZeFeG99Y6c9V1J1kv93twlK
	 0WgQqNzh6Li4CBKi/REN/62KfyHCd4yAZV7ddZjjNpQu/ed1+rpPoHQ4NXikxPXPOE/k9
	 mZnhyyfwCX+Aha9CV6PoqCAo0p9rJVCTzJe74XoEheKMoKPNDKnZV09ejpSKIR5rWnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571046;
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
	bh=PcD3lUrOjFoYjBEHi0Rr/A+9cMiNa+FZavfa4FWPmUc=;
	b=j1aUFB7/jlYBE1jI1JsJuvtCdusTaAwZHYCRjCnw+Nohm/AiSe0A5x+ufiJgqBfb0pIo
	 MBOZuSxe0phEzf2OQjwtkWl1xNx9GDvIrwcAtGizx8WIkwI1/Tiz3RFDNSpq3vLY4WfwW
	 H21Rc4JcTUNQTs5hy8PL7MV/yqo69EJMCUM0YuHScQVAyCfN4Vgmvur301CTbwTWdHWvA
	 ZpzcH7cd9Be5PbVhN1vFjHi1uR/ILIaKDI5uCw2n9mNFtYEygW5OWTFjQnxx1/hlHWN2D
	 KGxhSUpCO43T5do2fS/JwkCkHpVYBw2rnvLx3A4MUuOnhYYRqMWpVjD6E2at1JmIXzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=IJSC3EuF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.5
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DEA606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70DEA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=IJSC3EuF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlFF0G+IM5uXKu/ZzXCkD6UXZ32mAP6CeiLoJZi8SJks9HDZMcN3imw0gXgQ55yjyiB3XxRPYeFA8C20RDlGmLhyEsYg4R3P+FJ01+s29wFAt+CXFMZGTiZEW+WFEG/7lwP6mq6oGcqh8Mzepc/jg1HH8c9nfkIPIh+AIovk1F4HZzJintgJ3AfXJBgapy5JxCyyr3K9IsPoZR56daQEfxUsAX6Dym/htVqf+ve8KB43VJcD/oBZ4MEXJKo0i1vTeQCaHSawY/wvBHy/A9PFe+/wumYQ9sbDB5FoKpiNe4zozllTAsfunTV5hT7eBucmL2hGxWksaEuGhQmNfsCC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcD3lUrOjFoYjBEHi0Rr/A+9cMiNa+FZavfa4FWPmUc=;
 b=DJM1qRemjKt8cDuvJgRmQ40UPC1D4NcoYoim9nDlL0DlJSrq9UhMSXT8Mq8K2JKEYhgrtoX/lYWvdAA3Tq/ds+88HwsHKnAfDp58EKDEw0DTJJKvBDGIW2VnWV8WzyNF3N+kFQ12p9dO2CNlvFZjWMXTFQJMQHlMm3a5xSXMBjbGVYsMo0M+og4++IS9ddVS5McFqfAKusphQYyLQBDxx1XGVU9+6fHrc73lGgkcnVzByqLfFT8jy6nW6bDl5eYHK954F3yBCbOuefzuL0RH1z4uuTeTZIj5VzgJWdnCG5I703Nnvjsh0w2xk48G2X5fuSIwuXi8VIQrC0/B6ThtOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcD3lUrOjFoYjBEHi0Rr/A+9cMiNa+FZavfa4FWPmUc=;
 b=IJSC3EuFgwLt+OShFTDNCdT+J4cj8lfvzezQB71JmbppWFdMjNRT5znbnx0SiYvzmemOpSKV1thFm7W0Hb1DDjoHz3h11mD3UkXWcjOWl2AMO5pL1HRjMyn8XK2vPFP1wEGjqknKzVmLvTHQ2a4eHgZrZ54f8C+WtbjPN2RaD3M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:44:00 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:44:00 +0000
Message-ID: <87fqwpelcw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 21/27] ASoC: soc-component: add snd_soc_component_regcache_cache_only()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:44:00 +0000
X-ClientProxiedBy: OS7PR01CA0263.jpnprd01.prod.outlook.com
 (2603:1096:604:255::18) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 9eb58220-b9af-42e2-ee9f-08df4a9593f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261102130727099003|261026121527099003|261021121427099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	Rqj0yy8Y7apQmF7X41LebtwC8LN/J7Zf6FJHPetZr5hdRXdeZ9FoXYBfrfEEb60oqKgNMy6o20r+HDpuhDXi2C/Z7KwPBwZWM1LBo0w5n+JG5bOcVEkpb5FQMccbkcJXeTF9agOECY/9aZ+iTgztOxLojpyOdzvCYZT+yi58tTPLDTBcNYDbAF8qNvQ9Xp2pcJcn16OHDIQXHqgUkmfdwowOj0MKZ/JsfkSJM/o0ytCk3rAOc3MiAuxPpRjZhyZg9DIA88ahL5whTSIKFWU1+tniRxeUpk7ZZKBK6+9XsHGShru7xHLkHJ/VMeSzWQ32UHFmQfpG6bY3m38pvN/DIk7LG7ov2XH80s7j/Z7ljPNL2/PzySUwDOx2PCruuCgqE9zeZ2Xe6RQKW4JR2Z+IuuYfLgkueInTyXCgnAc8LidOfM9D24H4rFjHRULghwnz7KBNubfzzGWlpVvWwnJZghC3VjwBlgCl2XY8tbZH0si7f85gPZEGbHISP65GdkLMm3nSsXUXcn4Qgvn718XXOIzrcg4M2hnrFWYpg5znnqhl6iR1H+7VDs24Yqlfbp8Bp99QTOtnk5DCOHQhIPF+m+Y6/OJNdQoFWysidbQPDjka+dVe0lAEvJLKV4eLCx3tAG1nkFHzrHFf8aOlFvSDvBvm9m+636TN8rbjvbN32l25Pme78/lqhdxVQX53LHffPxC1FnlTOMVU7xfkqh2Im/u9onXlNHzZvBcVd65xZh8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261026121527099003)(261021121427099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?yocCAHE+foX66LM1uUUUGtysqg9wOTa1PcegLU2GZuXAJ8MOcrukVJDX8b?=
 =?iso-8859-2?Q?zFblwZkcLu2H+1mJqWCT2oLIMo9LfEtYXdYMTcCUfK1BFFs7+F8nJb++j7?=
 =?iso-8859-2?Q?n1rOmAZqYdlj8qMqF9bCN94f95DPWPGhOhorshJ+PaFiitx2rhlVqBz2bW?=
 =?iso-8859-2?Q?2HoPouHH8Tq1gW8WLIbAxmwnqzLRiHMQQQXgb4Hnq1ZRzSbLUuwgvNmCgI?=
 =?iso-8859-2?Q?pOVI9NPGASFnnWWWTmngNwNW84jvUqhgbPdQdM2Me3zAW2jIhVByvkI0U9?=
 =?iso-8859-2?Q?WcNpj1tUiieAHIx4wlsG0B7byH1HHQUsOgeXZJHenH636bW0nnoLhZoz1I?=
 =?iso-8859-2?Q?5YzYkyG6lxFYMJ4dZK9HTEu5J/BZV3MkJmMcN2mHRC7CdLyem9X2iYxcqn?=
 =?iso-8859-2?Q?oiqf4qnoyEfTrB84G8wUoCNSsTJ3iK776k9iIeUlUeIoVIgHjf9VVtYUA1?=
 =?iso-8859-2?Q?5OrjOxmmjZ3PEXwSvkwZxbUObPrJZaE53baIyzBfPyJ0dAQ5SFTaHIwEIB?=
 =?iso-8859-2?Q?3z+g0XwzaqNUb/LUIQyHHbKntBkXqwqyJX4M991DmfvR4LznrEoRKMh3uG?=
 =?iso-8859-2?Q?WcGxxtKIGM/wH5shNFWYAwuGF8TKq5cqfvSfu4qUP0IkTD03ppMUDyLrKC?=
 =?iso-8859-2?Q?EgpxcNQTC43ofAeL1eVgIxuXJ/HYGmvI1XAY4Hxkz7ACuAmKpMYNXBja52?=
 =?iso-8859-2?Q?LDOKAbJjyf2+c2MH+NACl5Les3VfKmoqD3cbO8n1grzeQOKQGERA2dtCvH?=
 =?iso-8859-2?Q?aHDdwXDfbZj/H9uGZxg6vigDc41tNRDZTMLDIgiNwaeyPjHv4m3majujAx?=
 =?iso-8859-2?Q?R3tZ/pCiS2fglzPSp+PayF5H2Kdx30c/Nzskmh9UGinr9iXV0K3djj5u9o?=
 =?iso-8859-2?Q?nfD1/NHZdAhoGavloc5r8mOou3MoS1OFIXlb+ddXm0s98onVSGU+v278d3?=
 =?iso-8859-2?Q?swjvcDdQvxl4oIRcVGhlG7USlMAJD29TIIvLDjehT7unckQ1mE2xGGhslW?=
 =?iso-8859-2?Q?23q40bNQ+9iaAmTA+jp7rLBjkIw0HfzYYWIbKMdbHPTOQlazTEnFSvvshM?=
 =?iso-8859-2?Q?duP7+zoakLeDbEzjuvDjCZRrHol9waPK6g+/MowDGeVEhFjtpwTwnNr0Ml?=
 =?iso-8859-2?Q?ZW9Wg3rraIexrIHfIRXsNoQP6uVgusiPVT1c+qa0ZH4QQyaXA9CqNlo9sn?=
 =?iso-8859-2?Q?VW91wL7+f/WyE7s3/LIhPnkKvHmjn7TLtgJWlk9fhGM7HhHQnAARhJXo83?=
 =?iso-8859-2?Q?NbCXuUpRH47L/zMT5Nd/bcnXFVaYZrp2AsO11MFfVsV4915if8ftXpDvhn?=
 =?iso-8859-2?Q?WOjlrHeTFXC7pPX4DNW116/7fp029p0CKfEJpnv4vyA0NoFGo7/rWDg6T/?=
 =?iso-8859-2?Q?TLnOC1TFJiSFLoP9pZfqCjtcP8vMDwQysX2WjcWDHLogM7H+w5Ooe4Rh4X?=
 =?iso-8859-2?Q?18Q1lf+OukRkkdS6UKMqZ03+uPNNd7aLu1R58rEiYu85yQ+xRfQIJ63ZWv?=
 =?iso-8859-2?Q?2nrRWA9F62AYvoSAgxxOAXsYvtK4PL8E/3t07wUFYAAsKP1gn19fb9pS1y?=
 =?iso-8859-2?Q?KkbAfSPXvZXDC3xBehuNC9qsZURVfhRQ2O56zRGKECnE5WTEOtLM0yP2F/?=
 =?iso-8859-2?Q?o+h0kYU7wub58aLZomFtInqObdfsoxtZ/0DrBWfwTY3TBFBzwq4qgNnrTx?=
 =?iso-8859-2?Q?czVGbdzj6x9VldWBUwLWWLgUB/LqfsVv8GU3hqN6aur2xDUhi9+9ErRLSm?=
 =?iso-8859-2?Q?YBxJHbzTVeMY7POAFfv9a92oNGtGDYjCMlXJAKJixjJLiYc1nux0vN/EBC?=
 =?iso-8859-2?Q?6KNoAzYv35rqW/rLaWf8L3aznjDnAwyUzFxpPOae/XP9/bNT0GQj?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb58220-b9af-42e2-ee9f-08df4a9593f6
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:44:00.3981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Ho6/Z1NZQaQ28Ftj47DMHouMx9PkdZdn4egrim8mNAMzQEDOUwmDyDmgLJNmD2MCz8yVX/7y4yJZ8BGoAK7RhvD409J9Zc0gHlThayF4fv7qdCIPns7QoSkkDuPdzB7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Adds snd_soc_component_regcache_cache_only().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 9b799cc300f48..3427f2f094956 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -358,6 +358,7 @@ int snd_soc_component_regmap_get_val_bytes(struct snd_s=
oc_component *component);
 void snd_soc_component_regmap_async_complete(struct snd_soc_component *com=
ponent);
 int snd_soc_component_regcache_sync(struct snd_soc_component *component);
 void snd_soc_component_regcache_mark_dirty(struct snd_soc_component *compo=
nent);
+void snd_soc_component_regcache_cache_only(struct snd_soc_component *compo=
nent, bool enable);
=20
 int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 8c1da7dbcbc73..3c9c22e8c282a 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -518,6 +518,15 @@ void snd_soc_component_regcache_mark_dirty(struct snd_=
soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regcache_mark_dirty);
=20
+void snd_soc_component_regcache_cache_only(struct snd_soc_component *compo=
nent, bool enable)
+{
+	struct regmap *regmap =3D component->regmap;
+
+	if (regmap)
+		regcache_cache_only(regmap, enable);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regcache_cache_only);
+
 int snd_soc_component_compr_open(struct snd_soc_component *component,
 				 struct snd_compr_stream *cstream)
 {
--=20
2.53.0

