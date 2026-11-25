Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570968;
	b=sKPk+Q4fXM/KvRKXMApgeOYGc+dY+YrySA1wYFcnY4godeMlRuJokGdCeky2Ni/GmVrE
	 RfkZluU529LnUo/ELA4rYV7pHgwMxSdaKWgbUF6EGOqW8fKpQmJBgzldMA1R3jEDz+e/y
	 kLEiO2bXtD2QsR3r67fYhwPR5/v/WDD15irTKrhGebzo7HTO5nJZV3ELMZ/WYRwbMuExe
	 XCDgG9cjcDBU17I7n4OUs7BJ3vQP1m17ey1Gn0F0eGgJHzxSaD7wsEpKEKeVCxiN8JyFU
	 5hWebDXV1qzbd5QNAqMOaLe1Pq9pTSFD77ZpHYYYP/g3nwVJs+OHxYW0s3/yUPmO4mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570968;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=E745QoaXyvNJK7K5y032bMNEqEjWLwZTIjbad147BGo=;
	b=uUg5mNbTv0GINjTi0KhB/rs8uTKKTDhh7NkjoRWXtMBDLQrgYHGGI6LqJ038iVGr6mJm
	 X7HOub32BQcmCvI6iuFaWsxdlmeSm5pNEJ+rjEgaZMWspxAWb2X9LZdoJNGiuGdfnfUjj
	 iyCcG4G5vyn7qZizxM6WoyG137EAITZTfJjlwSm8hqTwIles4x67zEz64rZNmTAh9uUHc
	 XZIC7hrw5Or9JZ5FBgy5x+IDqJoapBpHc+RI8L2rn8JlC5QAQf5m2z9ftVzdJ+LUkdnmv
	 pJxGNrjnches7ea8/m0ah20WUYOufxwueGdD7oQ3iLEUXLf3kPhL/n57hUUKjhb+97g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b="bGaTxd/M";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.46
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BB0606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44BB0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=bGaTxd/M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gG8BY+TJNAZSQy2T97Dofk/5dw16qTN+zWIB1/XWMhk16f6rRlHjAcNcfgUXarv6JZpVXmIge99/LDebnt/Q57JTasjEuTrdDEs1oQSVEc3OQ1wJQH+3xivr7gLhAkCUwd1PE1Xgq/ZUDOInKA5EYqV3IgdND9wZ+7DPGfB9p91GEy0DpgXM6WezVMSmK/VV358f5k9HxUIA7dwD8H/pLI3OaCKdmAbLkQt9uSLEhwCW2DMvTNflu7NFeIo4g2PH4VmdjfbH6n4La7eJe8sbFmf70FuEL21WTICbl85+IH134RXxziw4gAvViDead0t/qIbwzYQSkoozYro+9iW/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E745QoaXyvNJK7K5y032bMNEqEjWLwZTIjbad147BGo=;
 b=d4SD6SNYn0SQkC07GsBGK3zgSKH0EJVXJyJnZ7QYSOCI5eW6CfgVPGGFc6j13SD4X6CuKUdL+j2/icmH8RBTRkr+bpR3745fhuMNXXk+Y/zAoIs/q8Djetqp0wKe4c5uvel0sVK2imqsOIO99OmJlSoPtWQ8Rr7aoNmq/NKNXA+G3wmTwUCr0hBidif1MXQBe21cp6wd3HbaYnR/+8RBNGKQJkY6WEpIKBDbWz4z4wq+WhRt+Nwt35MsJGt0V8lINf7ti5fpSRiYaSl3ijKgY5A+vxC+oA3oT048TQFaHQt90LXzdGetUd0KeROmYn2VIko6wRtbfQrAs3XFgS0M4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E745QoaXyvNJK7K5y032bMNEqEjWLwZTIjbad147BGo=;
 b=bGaTxd/M6ePC9jDvE5rvOHAF6QBUQL2AoADEKfLbXitCRftP5YNeyuV5gQs11iyGmOGN8FnlHFRvwyFXPmM5nuJ4aLXe7CgRzgcdJc2ko7BSNCswHyfjny9ev5AfsLKpTqBIV9UdftGGnwMlnSBJhKofW1661sPk/H6H7SgB6xc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYWPR01MB9838.jpnprd01.prod.outlook.com
 (2603:1096:400:234::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 01:42:45 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:42:45 +0000
Message-ID: <87wlq1eley.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 09/27] ASoC: soc-devres: use snd_soc_component_unregister() for devm_snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Nov 2026 01:42:45 +0000
X-ClientProxiedBy: TY4P301CA0051.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::12) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ae401a53-2acf-4e8f-fed2-08df4a95677a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|261009223027099003|56012099006|261028144727099003|11063799006|261021121427099003|261022105027099003|261102123227099003|261102130727099003|261026121527099003|261021123027099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	n9CdaQEZ1CDo55k2NgpNwl9nGKhFaVee1BYPhRr9R0ffJXMi9z22AK7TUEUk5B9W9BoAnwG7KpM35CC+j2RO6CWq8UfY4+J8MHv5ETyPoJz5t1f3oOZPSvz/93GvZVdcl6OfLbZCI/3c83IlCTs8YozGxlXPhJK1p1KdDvOHAVwnSU9rnwTlughIqGH5kAEpUgHbtJPDvS2bzq1ReXsujB/BxCeTmruYktB+QBywZuJpb/N8qQieBapFQhNKu15Od05M9e+ZvYqsBv+ppJNweTImNS6ihuCo8Je7vX2jExrYeA+rhmC8GWGuSZiq8lKrfQOkq9RaehtYNuspJ3I86Sz+KB4cG9V4R35ZGWCC64qbQp4DVoSJsIIhKOCdJ3jiS+jLobFG0KW1lP1I+DtXPRnSPxC6c1AnQT+uLJ/BpAju0cHajo1cox9zg3u5sgrNvxaOOY74IRIDL6tADMb8JV79qhsf4ZeaVfKvhKTEowBpqeBggzFx1/uecQikfo5bl9Asyfwfp7k4osj7pCntRIWjHl5Zt7p7QCjt58tDd+D8TrzdOm47V6RQzkiMS6L3Lmo++EzDNUg95Z1IVfUk1giUkEsVla1e5tlthYGJYjPdKgp6taMNBJ59Rl7TIatttkCMR9wId8NI4MwQRglX9R9lvHfJFiTjDgHjTjtA36rKWv9FcFVaIGgnm9Z1DilstYzeBJU1b72nwGpnZHB3Uy8b6BQtJgFMjf+ZoWiSerg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(261028144727099003)(11063799006)(261021121427099003)(261022105027099003)(261102123227099003)(261102130727099003)(261026121527099003)(261021123027099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1F0RIAVPxaaKY0zVYBPJwUkLNJY99gmPzgP7FN8nkZ6s0rhn6p6hDFIyUzlE?=
 =?us-ascii?Q?UqRGIc8pSBgGr8PjNoHpzcVvklNFDlyFUSTtOzshyyYcmHbftcJz1rpzg0N4?=
 =?us-ascii?Q?avYK59xQciNJQzIwR2NljDomiMcvVyYtNGd6OYoH4p2qWD9cmYmkKK93UI19?=
 =?us-ascii?Q?zBOq34DvIQLnp6njV+IxjnvVpCyTkRZ7Wni8q5dCzVdRV62wEQGf+awAeDSh?=
 =?us-ascii?Q?GDwOWuJOHbL1uuXydFec7GfE37Fso4P0bWJiX04goosn5TgzomK7eOqDH3Mp?=
 =?us-ascii?Q?5WAh/9RFu1jVWl8yMx7x6yi3jkT6UWHTsSmh3ye8NbGXqvMGtu/SQ8TxfAC7?=
 =?us-ascii?Q?WeoTafS5Xd827MXawq8EDPTkYp6VomqU3sBHmnbOYRYl4vxuafn5iX9gTAya?=
 =?us-ascii?Q?aGhOCe4G7rrZLpcVt9/FSka9C4UcnaLm/nuNtdUaZ1CbmU34/a4KygS6wIQ6?=
 =?us-ascii?Q?pOWK5kkYGGheCavYBGAe7kIid3JFgKmCBKuSP2rVJv2IhnVA9CIQlRmoWQ+t?=
 =?us-ascii?Q?Rs78eoYex6kR3oiceF3P/dOZd3eZsCAP+OC+gYNEbgXpD1hQzMKHJGHQtQrJ?=
 =?us-ascii?Q?bFt0dMwYmU7eemxSSFKgdGrbEiZkZw+xQ4J2Gxv7gbxu1kEjwGTcEgGoAisJ?=
 =?us-ascii?Q?NObI2vL/9MJ+o78RK9JQVNSYF2/uRgCRDuIjguymUJtpcy2rL7zKXHjd/jNV?=
 =?us-ascii?Q?pK6SyE39ovMXu/tZsXDgFSc8KUj/A2TbvvoKB3OSmxniBLqYBuEBfURFiH1r?=
 =?us-ascii?Q?+bnKVKRtGXOAaSrd1kGXbc+7y3Rm14auoJoIUBd5ggKs/PMClHIAFsKgZ7+x?=
 =?us-ascii?Q?qkFijji0GivT2PNp9ButMzNPvil9Tk912WWHVJiiKMLEqFMYIdmQ3FPQjkMZ?=
 =?us-ascii?Q?tHeyK4kp1F/wb8gmNUpd5lC1inrGz+8DuyUS7RLvzUgNFfio2t0VNHXzw4Hk?=
 =?us-ascii?Q?W97ISnDuXpjMQAOHU7Yv7ASkS4ky0vTpMQcJ8FRZJ56QKXxCsp9CQQ0n/Jqw?=
 =?us-ascii?Q?1/WbsvTPxQYkuE7sr2N/qkW6kF22VN0hp+gM2b/f7/TnNqRBq3aZfEDgMJGO?=
 =?us-ascii?Q?Oxe/rNF7jFhVBuWLZlzhHYMDraBIXWXE0asjdSIPdBATbbukfSF8L+MJs1ki?=
 =?us-ascii?Q?Q84w/wLWF9A2OjPKM5fqrvW9nuUAYcYNsj51NANBpdJO+PfYJj8ZAe97n0c8?=
 =?us-ascii?Q?OPCEUc6h9Ayz5A3KMAokICxLTSBJhKR0p4reLlI5cWc3chK8sacV/A6978uY?=
 =?us-ascii?Q?TuEJ8oeevJjTrO9zZkZwD8JI49GGskfP8Z0lZTXtnFhfBS2wklTnKXcs/MGB?=
 =?us-ascii?Q?mXMln7jzb398zjtmzRWamx24tgP/UMEQ55I5bAGnQM47FiIur4PfVL20LuYa?=
 =?us-ascii?Q?CM5vtzL/NZbMVQkbhSjnup/gFTkQxLiEQ1e/xoCQC7s/xH6QL90rZekk+ah7?=
 =?us-ascii?Q?PrHeFhNhMyWwT6u8JcBG6fCFbv+rL5RYX2RLBwZ2Sj/tJ3PPZgrrDhE87+Kf?=
 =?us-ascii?Q?FEGod0X/uOmE0Xr6Azy3y3hV5B9QSiUU2V1ZM/3xY6aK5h4Ug0jgVRqSz1FP?=
 =?us-ascii?Q?kCUbm2y3ePBI+8PY7gUXvHZmQp+C9gMoVrs6T6Q+n0EWwSWIO5p6CE5NA3fc?=
 =?us-ascii?Q?30ruSavprIuBpJqTlpMDfaTGSMEnmnAA02jgXFwwwDY2JmP9wwPw89iUqvU2?=
 =?us-ascii?Q?82CBJKGTZWLqOkn1tfuEA6ZAGqega7o/iYT7bL6T0RZgzvC26jXGL+rDLPUA?=
 =?us-ascii?Q?W/TGr7IyUlLEj9D/TKLuuUDKeNnCHGo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae401a53-2acf-4e8f-fed2-08df4a95677a
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:42:45.7643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2K4h8i0s6klYrYtz71KD73lkYY0qbuu1uIHbc5Dux/7vwVjQRFiRJYjwFV0HbJ+DS4WywX/QJ5KLXjkfsqy+H2EEonF3ade0Gii6nSd6pgEb8x29DSONWPXa5YPKFpC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9838

Current devm_snd_soc_register_component() (X) is using
snd_soc_unregister_component() (Y) to unregiser component.

(X)	static void devm_component_release(...)
	{
		...
(Y)		snd_soc_unregister_component(...);
	}

	int devm_snd_soc_register_component(...)
	{
		...
		ptr = devres_alloc(devm_component_release, ...);
		...
	}

But now, (Y) will removes all components if multiple component
were connected to dev.
We can use snd_soc_component_unregister() (Z) which unregiser only
target component, not all. Let's use

(Y)	snd_soc_unregister_component()	// unregister all components
(Z)	snd_soc_component_unregister()	// unregister only target component

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-devres.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index ca6c29b54f6ab..0323897c664dc 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -11,9 +11,9 @@
 
 static void devm_component_release(struct device *dev, void *res)
 {
-	const struct snd_soc_component_driver **cmpnt_drv = res;
+	struct snd_soc_component **component = res;
 
-	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
+	snd_soc_component_unregister(*component);
 }
 
 /**
@@ -30,21 +30,32 @@ int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *cmpnt_drv,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai)
 {
-	const struct snd_soc_component_driver **ptr;
-	int ret;
+	const struct snd_soc_component **ptr;
+	struct snd_soc_component *component;
+	int ret = -ENOMEM;
+
+	component = snd_soc_component_new(dev, NULL, cmpnt_drv);
+	if (IS_ERR(component))
+		goto err;
 
 	ptr = devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
-		return -ENOMEM;
+		goto free_component;
+
+	ret = snd_soc_component_register(component, dai_drv, num_dai);
+	if (ret < 0)
+		goto free_devres;
 
-	ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai);
-	if (ret == 0) {
-		*ptr = cmpnt_drv;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
+	*ptr = component;
+	devres_add(dev, ptr);
+
+	return ret;
 
+free_devres:
+	devres_free(ptr);
+free_component:
+	devm_kfree(dev, component);
+err:
 	return ret;
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
-- 
2.53.0

