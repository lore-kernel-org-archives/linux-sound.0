Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737470;
	b=jPy7iVSrneRggretMoIXayl0GYtsyOmzh3args6zHXrT1GYHaV8wad3jjpvUtC3IikMt
	 ADPy+CCWEGr2gg6J0JRVWge63xQzuOKPxSuX8KzCbmr8JFCUxUyHpvM61RG3vQCe3negf
	 /ZF1/hBgixEFU1fnvMP+Y/1ASdW2iH9tQb7KZoWuT7DjTMYc2VQ16rV1aLSYEz5+MfaTZ
	 VOMwxCUVhMkzZ/V/p9q23wJTX/9H1Nf6wTGarSp3G3xpMyO4vPcgg+rEwwJJbnG8byNFL
	 pKv3O2Ns5y80afHjenfhwnB5F0HECQHI7+1WVlvJ0z29i7KFT57VbU3Q3I/PFFPlAYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737470;
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
	bh=lr4rNbkwKmtMwkkxhx/HKJY32zBDz3V+4h+RufuyLj0=;
	b=b1r8wIuLMc2lTJ/hX1hCFAjfyhbMjSPs63RhhQUWq0Vvcv9MWjvofAWaGa+AMUGWic2p
	 nhf4pePUOGVJ69TsonBk191Rzan4F1otTgrAqUUUEl4nE/hxR9N8AVR6xuU/7e8ER0ERq
	 fotOruYmhaKjM0ek/dYZ5jUww48mySisL2Q++/S8kvihAJ3NwJi/mQ4Rby4P7B32+4De+
	 niyVG/WFAZAOPyxX/1KPHc6BDUgTIpcH6qYmdjxItlz63rMVRMOCCuhXQiZTrxF/Zvf7X
	 gnlN4gkdakXlS43kAxvjJ6Q+jhFKQ+6KXVppqU7YBT9bmvTbel/q0+4Lhs44KS92Vfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=YNdCLL3I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.40
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A632D606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A632D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=YNdCLL3I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRqWlNnEajLh/x4tZ2FW2Ac13/YrRuIKZxFFmagY1fZ2G7+tQ7K18xa0AGJHRwdF9e7cOAT5tDAN16GzM1GUXFU1vrsYTb0xVBUKDSL1jx/xGBNvEfYSPE5YqmxPd79ifhXt+aVKhmEMO+RNRmImipW1FubfCMkLcbsresrPkBkPx/MpsfurzkaoP7D/KEhgcyU+6UbHRcc4uTlKkFbACyEagB160i0us6n8mOZKEcftzvy4V0fVT2NaNhZXpill/xQLJqEz+UgojkIHozC5fY/uxa4o5B55ix236cRAtXgFYxRRIa+tB00FllnjQVxdBWGPE/Qxb9GR2uxJctuoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lr4rNbkwKmtMwkkxhx/HKJY32zBDz3V+4h+RufuyLj0=;
 b=efd0jkyGQ0PZss1JVsmThPguWD2hmhd/VDqj8tHwKEFRlzRdPwPC3rnv23IhRchLBjn4RSy7rslCEYARdSCMvNfiJavORrDvzEfDaSuCNlL6quD3QhPm/yH4qFRh4poSpH+8U/KmYsjm/040Qlb9luXLlHfoAzSjZGDuMCNnRBBmNtMT+xNHuP3MiP1H1GdobzWsiOHVEmIs0JBd0vFOROGkcttpETtA049qC/64llmwavB2hYB2Z6tVOV9Kx5bH5ZzqclahsJgugB3mlZGlq3L/R+Tn+9AyhRvFRoK+XMHEmKIt/XFf0C2vsNeItv+bR0cNsmsDVPsYEFQtY5JDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr4rNbkwKmtMwkkxhx/HKJY32zBDz3V+4h+RufuyLj0=;
 b=YNdCLL3IyI787RLEsVtY8R+J4AjjO81r2KyC1yBWfvUJsifVICQ5PSkzOFvwYrkCf1MCfqIFRR35pEyLMSyabmqQt7k/IBIU2hP5nYHKUQmzQ3eTVnWaS5qxFDWDaVf/xeySaBkt2Bsby63Ee+bIgpgCIhn22EdH5xRn1Mlb7KE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY7PR01MB17984.jpnprd01.prod.outlook.com
 (2603:1096:405:3a0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:57:47 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:57:47 +0000
Message-ID: <87tsl3qh6s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/11] ASoC: soc-dai: rename list to dai_list
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:57:47 +0000
X-ClientProxiedBy: OSTP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:216::10) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TY7PR01MB17984:EE_
X-MS-Office365-Filtering-Correlation-Id: c395c712-d3b3-4195-dd35-08df4c19126e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|38350700014|10067099003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261102130727099003|261009223027099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/KV4aGsbWH1gBoncZvr7ooZHEWegmSPI6rVvexcyswbbrP19OT+4+WnY3vY1V9gHVu8aFnvWpMGtMQ1rG5t9aL1OYd0/9fENzd35aEls5Q9n9Ut2r4ty0fBmukqIDMFmw6T1HtGYlz6rZ2dtVOd1kEMIx6/jjFlP30k4uHIe+l85g3qreFQhyGXypqqXR78dezWBqww13j6jtu0qD4DYQ4aMa6kaveNSyAckP3QPLRm/N4Sx3y5O2iyhoDIr7s3K+QC4L+BquKVqTT2ga8ikffo8zGJvq4kU74G8AHV8SrGu7b3Lwxz5cG+p/YvRswtpyou+nvnHDmG8sHma03pYvFY2XVdR2ZfiFxld3IjTF34lfzERYKheiuF5VQdsoIKfkQ+KZKMIIgerz+APa80QjGXnHG05X5tquq6yUgN41kkN2VGL1OXv4+yFDvVpqN3MHuxDjBcBYbG17gml6b2dFEA6sP4vHkMUvEWym4rfUXPuFn8wPVG/XMIsHC7IUk1WZ8xafBt4+vZH/woNtTJYcPCyVKGhFS23NGRvQp+wmYJ1gB8BJa14AykI8mI35x+l27kZ+z8L2NZCJVswIfOVfuF4VkL5qkxFOqB/7G61cT57kRi4QF01h735rUtJj1AV+T7iuSFfa9Ulm9fv0YMJClfz2giX9nLGr3ZFF3nPLu6zVmJoDbi0KFphEQ3w1sTNpwOMsoBCX+eY4EJjqq/mz7EDVWbCYNw3LULt2O7hchc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(38350700014)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261102130727099003)(261009223027099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6O31EN6bjKPdTHHPChin8y2CUNPwNVkJoKsgKRFJk7DLU50x/Ep58ASDrAca?=
 =?us-ascii?Q?wRdbDgEINCw5+jj3YjrcTCT0IT0P/IDJO8uwUMop/7XqkP76qD9Egxc/H57G?=
 =?us-ascii?Q?nz2pPmZJkMpaIo4YGKYx3ihC+D/0Ot0T824WcsLxhqI4mkMMMX7YcGFNwq14?=
 =?us-ascii?Q?GS8ubl8H2nzsb4r2QweWx4Dg0giTtzV3p+19g/+M4CttbX3itvjKhFoJMp4j?=
 =?us-ascii?Q?fh++A+ZhVncLsmoAJ/PYmOaWfjJv0dp1gEAxWslIGAF0UsEXQPHNU53VBGTk?=
 =?us-ascii?Q?J4/v5VMmjPeTIkiv6prermC5Lep0QF3fW+OB4PI2k1nhVqjxGZEKP0S95bEm?=
 =?us-ascii?Q?HYLhcu1BuqVeiSxVtv9KQ8lYEGUB1IVwO0rp4ukJ033jmrkkxvJj5JFS5j+h?=
 =?us-ascii?Q?Y3n8B0gwsWx1RuwETUSeFkNjozvBwmcfP4zuiHysZjNRCUtQpGBp0rvRQ/B+?=
 =?us-ascii?Q?gUrcXC0xq0l3M6Hs74OFn9Yi0bRHOBp42Qs4EhFQsL3YtZVjaQje7mNwVTs6?=
 =?us-ascii?Q?XRH3VBKnYnqJObHvy15rFv1JyFnZ6T2TK2UN6HH5MSttvvAePoni3SQptbF9?=
 =?us-ascii?Q?9NBdsVqNSYEWWpngJs1Z+b+WoYJW+2HaACjanUQEqnZn4ssNl+/cxTP0UKx/?=
 =?us-ascii?Q?DhRQXTgyP9sNi8a6XUj+JQrd6h3PfUUbL5XCi+YOYZBAtKcw0AX9am5/53Vr?=
 =?us-ascii?Q?ozcubBebGEKWeN0y4VRt3emfTdy9bWiydPDm3qyiuIA8iAQH2LsiDFze3hE0?=
 =?us-ascii?Q?uvUIvDGxJ0tqscyRuW0HRnE3EJ4FseDvn8HpSIAUYBtbcA6BK4ay8jpBAwtO?=
 =?us-ascii?Q?ZV2CktwgnwjRAnMfOk0NL+QJA3A3jB3aYIWakx9HzGduqQTP9Yp7k5XIVUna?=
 =?us-ascii?Q?V/UsEMAi+Hj1GJ3D9J5h3opTwMVkwYyOEwnWKIcLTkCA9pqf8gkChBGYNvrs?=
 =?us-ascii?Q?RQRcM0QgWe9IyCkHbZIRvmkpgDb9UMC0MfEY/tdp0BBHsJ+sUyJBEkDEIpRa?=
 =?us-ascii?Q?CKT9srz2w054JoqNj4bfZDzd2j8F52I/eQZU/XieZsrzF/boFqQ981ovfXpQ?=
 =?us-ascii?Q?zbjHQ3XheLHCdOVrw8KC2bW6Sz1T/kv6INQrY7Y1h2v6NWQ23ghd4MZt9uNR?=
 =?us-ascii?Q?WblfGF1ERCkmHUzsD+qpHJcTm0rTf99HHRK6D8Nhla+7YcrnqVMUka4XMUhz?=
 =?us-ascii?Q?m4JMDzEdek6hFAmDfircFHeo1pigYXo5JjiADS8U2C8Nbuxnh3sJkCOwCRaN?=
 =?us-ascii?Q?tiAzB7ZvETIUQBy+jUDipQGwpY3x7jiO9efpoUIOWbyac4/oJlyhCiNCiPNW?=
 =?us-ascii?Q?DFJ0mDcevrlmSYGJJ/nRTHYpCclKfd6kGFIeT/oxHyDNCFhKWTIDzwpEHYoC?=
 =?us-ascii?Q?W5pEgFHo82N9uIjwpy3lj3kc5v3OwqmIT85asdJdA3yh76gV7viHRcnDxE9U?=
 =?us-ascii?Q?loR6m83FZGR05uAPyjSeX5r/YSk8GBjI9mYIONTttDuSeIymvCJvNDO98Bny?=
 =?us-ascii?Q?h8eiCGbyGUlziHJ8ecPjnz/xjl9EWVnJ1EUHIbD9JgK2g2GfhtYG94xy5qUs?=
 =?us-ascii?Q?i/ONaWqwehu3XJcuWJmRQCQN3v3Vj9ZSpJ49g+KN9f7TpCXkVY51DbitgSU4?=
 =?us-ascii?Q?Ll9HfIMqTAaZZcxWZCXR/4C1SiJ3m8Vhl8hZHHRBiMsM0SGBW5oxN8GUIZ8P?=
 =?us-ascii?Q?Pm2LOiNgZFQ5lPCC2uhJzASVlQu3OH+UgWW5dx2E1EOFYLqI+s17nVrVIOJE?=
 =?us-ascii?Q?Q+Zfh2hUvrVwv/4qRfTwXCH1tCrI0Eg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c395c712-d3b3-4195-dd35-08df4c19126e
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:57:47.7879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOQ1o0PHcoFcOC9Cn7utJxe1ErvGjOOnoZNsVqenNx0bSbEf5zteauJucTdfJrN+pQx98B1eSlPnN9JilGAK4fYMeK2B16d7l+ndSXgH2jYQgFUaHHY/+Xl+Q4yl9QHL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17984

Current DAI is using "list" to connecting to "dai_list".

It is unclear and confusable naming. Let's rename it as
"dai_list" and "dai_list_head".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 23 +++++++++++------------
 include/sound/soc-dai.h       |  6 +++---
 sound/soc/soc-component.c     |  6 +++---
 sound/soc/soc-dai.c           | 14 +++++++-------
 4 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 8314a2e8df55f..a5fc083055ce5 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -221,14 +221,13 @@ struct snd_soc_component {
 	struct list_head list;
 	struct list_head card_aux_list; /* for auxiliary bound components */
 	struct list_head card_list;
+	struct list_head dai_list_head;
+	int num_dai;
 
 	struct device_link *card_device_link;
 
 	const struct snd_soc_component_driver *driver;
 
-	struct list_head dai_list;
-	int num_dai;
-
 	struct regmap *regmap;
 
 	struct mutex io_mutex;
@@ -261,16 +260,16 @@ struct snd_soc_component {
 	void *priv;
 };
 
-#define for_each_component_dais(component, dai)				\
-	for (dai = snd_soc_dai_from_list((component)->dai_list.next);	\
-	     snd_soc_dai_to_list(dai) != &(component)->dai_list;	\
-	     dai = snd_soc_dai_from_list(snd_soc_dai_to_list(dai)->next))
+#define for_each_component_dais(component, dai)					\
+	for (dai = snd_soc_dai_from_dai_list((component)->dai_list_head.next);	\
+	     snd_soc_dai_to_dai_list(dai) != &(component)->dai_list_head;	\
+	     dai = snd_soc_dai_from_dai_list(snd_soc_dai_to_dai_list(dai)->next))
 
-#define for_each_component_dais_safe(component, dai, _dai)			\
-	for (dai = snd_soc_dai_from_list((component)->dai_list.next),		\
-	     _dai = snd_soc_dai_from_list(snd_soc_dai_to_list(dai)->next);	\
-	     snd_soc_dai_to_list(dai) != &(component)->dai_list;		\
-	     dai = _dai, _dai = snd_soc_dai_from_list(snd_soc_dai_to_list(_dai)->next))
+#define for_each_component_dais_safe(component, dai, _dai)				\
+	for (dai = snd_soc_dai_from_dai_list((component)->dai_list_head.next),		\
+	     _dai = snd_soc_dai_from_dai_list(snd_soc_dai_to_dai_list(dai)->next);	\
+	     snd_soc_dai_to_dai_list(dai) != &(component)->dai_list_head;		\
+	     dai = _dai, _dai = snd_soc_dai_from_dai_list(snd_soc_dai_to_dai_list(_dai)->next))
 
 struct device *snd_soc_component_to_dev(struct snd_soc_component *component);
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component *component);
diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index aeac0de0c4f09..6ccfcd5002371 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -469,7 +469,7 @@ struct snd_soc_dai {
 	/* parent platform/codec */
 	struct snd_soc_component *component;
 
-	struct list_head list;
+	struct list_head dai_list;
 
 	/* function mark */
 	struct snd_pcm_substream *mark_startup;
@@ -548,8 +548,8 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
 					 struct snd_soc_dai_driver *dai_drv,
 					 bool legacy_dai_naming);
 void snd_soc_dai_unregister(struct snd_soc_dai *dai);
-struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list);
-struct list_head *snd_soc_dai_to_list(struct snd_soc_dai *dai);
+struct snd_soc_dai *snd_soc_dai_from_dai_list(struct list_head *list);
+struct list_head *snd_soc_dai_to_dai_list(struct snd_soc_dai *dai);
 unsigned int snd_soc_dai_get_symmetric_rate(struct snd_soc_dai *dai);
 unsigned int snd_soc_dai_get_symmetric_channels(struct snd_soc_dai *dai);
 unsigned int snd_soc_dai_get_symmetric_sample_bits(struct snd_soc_dai *dai);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index de3218bb2b2a8..21d6579a6dfd6 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -117,8 +117,8 @@ EXPORT_SYMBOL_GPL(snd_soc_component_num_dai);
 
 void snd_soc_component_connect_dai(struct snd_soc_component *component, struct snd_soc_dai *dai)
 {
-	/* dai->list <-> component->dai_list */
-	list_add_tail(snd_soc_dai_to_list(dai), &component->dai_list);
+	/* dai->dai_list <-> component->dai_list_head */
+	list_add_tail(snd_soc_dai_to_dai_list(dai), &component->dai_list_head);
 	component->num_dai++;
 }
 
@@ -1782,7 +1782,7 @@ struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *
 	component->name = name;
 	component->driver = driver;
 
-	INIT_LIST_HEAD(&component->dai_list);
+	INIT_LIST_HEAD(&component->dai_list_head);
 	INIT_LIST_HEAD(&component->dobj_list);
 	INIT_LIST_HEAD(&component->card_list);
 	INIT_LIST_HEAD(&component->list);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 73aea7291fa73..6db677df91b60 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -44,17 +44,17 @@ void *snd_soc_dai_to_priv(struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_to_priv);
 
-struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list)
+struct snd_soc_dai *snd_soc_dai_from_dai_list(struct list_head *list)
 {
-	return list_entry(list, struct snd_soc_dai, list);
+	return list_entry(list, struct snd_soc_dai, dai_list);
 }
-EXPORT_SYMBOL_GPL(snd_soc_dai_from_list);
+EXPORT_SYMBOL_GPL(snd_soc_dai_from_dai_list);
 
-struct list_head *snd_soc_dai_to_list(struct snd_soc_dai *dai)
+struct list_head *snd_soc_dai_to_dai_list(struct snd_soc_dai *dai)
 {
-	return &dai->list;
+	return &dai->dai_list;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dai_to_list);
+EXPORT_SYMBOL_GPL(snd_soc_dai_to_dai_list);
 
 /*
  * We might want to check substream by using list.
@@ -1210,7 +1210,7 @@ void snd_soc_dai_unregister(struct snd_soc_dai *dai)
 	lockdep_assert_held(&client_mutex);
 
 	dev_dbg(dai->dev, "ASoC: Unregistered DAI '%s'\n", dai->name);
-	list_del(&dai->list);
+	list_del(&dai->dai_list);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_unregister);
 
-- 
2.53.0

