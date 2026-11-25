Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571028;
	b=Ueffhtw93upEgN4/DwqtLcNBx7fPx+f71OUYzMVZ8lyoR5pIxQAUnOkLD8wi4N/no+AN
	 lSuV5GQj6Db/Gx6wS8uuL6GbC67JRjDtWSPGPXdNGItehm4b39vPCNI+coY6U+mSHkdeY
	 nhx0fgQF3ZO8fwuTwfmgtvH9/u7PujpwgggMeCwsvrvIe/GA0Uxb/YoWt1Jq/pIGs64Fi
	 pHRq+wxYyycj5D2vI+cPVCO5gAS4Qdb/fe/khqWBRXCVno9gRaxjE+znOg3MSNMAIzPJD
	 jL4bB5FtuS26e0N5wZm+ye6kFsl4dF55+rV27kA5BtJZJSXoHPjE3im4ufMpf91zWzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571028;
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
	bh=9bIlEuq607GAPACNKzY2+M/CfjeVKBvZVrqmeTJ5b/U=;
	b=XpKdk3VqMTRgKc3xoIMe5bgr+BYkrT0R5b9TylAPIFxQZeSHBV2L81oqLkoc+VT6gp/D
	 H3eWfKGuibIyGhJrypCt5m3+/NJJyWqq96ZmZ92Qj8bB8/6bmdtgmEhH5pKADi84wjCh1
	 O29puiQXsrg2ZnI6aoHGJdO02qjVHv65YpFQYPDqVJYyjcF5IpXzGehY4XioM2eFz1Oua
	 dzYGM702Ueou8vdxnBfIqa5HXr3pDhNtCyHHhG2wuISu/04D5hepbuXW1lomNvQQuPVOv
	 bqrspmzaEqk1UVIn7sCKb/s1tJ1EwdHZPBA/LjI3xW87jbXWoOVorewqclPpyIN+mtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=eGA6p79x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.62
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A464C606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A464C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=eGA6p79x
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hr0/ojgMsXPCC5+OJ8HyMa1F3aXnpSZ00ufAXGaJi1gW3/cEiun9q96vhH3WbxRxbdm1yD6VTXZAx/dFt2LBORt9V+YJn0iMJONvDJ0Hu7AMtZfCBhfMFqYspRG0Tf3UMKvKnAT7rur73NTygUgdZXrR/Zoy1DJcvn2thK9o+Yoh2tUIF685zgP+jtc6X3qOCDiYvk+RLPtG6z1X0PzLWRyLHC4zoFVgfUlYB7CF6ArdOPKz1cbwVX3ub5hmY51RxebUj0k/o+A+0af1hZd53na220VI1Zh+2Da9qIgDifDPOG7lIxrYUrJbwhtfLxc98AOzM1VSPVgb7lKXB06DqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bIlEuq607GAPACNKzY2+M/CfjeVKBvZVrqmeTJ5b/U=;
 b=Evcx5HrHYzvmbQa/JZ31i/X9LnHLWGIBG132vjaeqVjNgvYI8ceZyHkp0rszpgdEQmW0je8mEy7qE+jUD1KBEGC9KpIMOKiqP2b0+rF5+lErmKWfdO/xXyR9ZkccECejowr80Fe6EXSMyOlyDgZhQ4FUpuDdW0pPGsOQ3j13Pdwq21oKGUoXEI7HbqmO+HKVLUEAdKlV9FIASAzSbFKnC4Rg6LR0iCd3YXnCQeUnkuTbHp7Yt6HqhK5p91RiJO/qPnlv33B/wtfGsyp3Miiy817igFanp4VUFJknQ8fceCATa3bnKXw/UkcxtB+FGG6m35ILDp9z/o3Ei4VqcWHlmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bIlEuq607GAPACNKzY2+M/CfjeVKBvZVrqmeTJ5b/U=;
 b=eGA6p79xB/lDCaATWL8wsX1DCgRvw6DuODHcZzE8HM76b5zQErCG3mav4ziOuChBUABq2tk98a8XkAdDUkoPUQ2pUn16LLquj6XyfP6bJ+qcInwvSdwQxxSOqAUBdj2UauYq83JPcOezhEcjXFJBnzDh+2VIMjr7suYDd01jPI0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:43:45 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:43:45 +0000
Message-ID: <87ld6heldb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 17/27] ASoC: soc-component: add snd_soc_component_to_card()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:43:45 +0000
X-ClientProxiedBy: OS3PR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:604:db::12) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ca14ff81-0fa1-4feb-1821-08df4a958b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261102130727099003|261026121527099003|261021121427099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	dMcJpnf/rizIVBp2uyI8HcSTBYxUZlzh5yy8UckHkHA1I9zSzKwyi4M7cwXQkm8qaL9sym//vmVDYT3fripBqkSc0k/ydG0U3yxUyg1zPHELjMmyTnFUYuTaX/n9fLKUFVtcoNUF8Nc6mmG6tIv1kqAsATSzPKv2ILJ+cT11mNu73e2n4TwNO++UL0IhIqavQZGE4Li8JF6Vuak1lRz9tTY+X3WeG5Qq4xC8cwbQu34t3MamsUdX0bFiLKE8ytf79m7SGUlF9TV16BL8bVKzoUvA4aTsdSYoJgqcikwQvMFCBRMY6dg0vBflReXG9naUDW0mQ24rAyCceR2EHmqyjFPRUM0CyiiZd+vM7Jdc0eDQRr5/5wguEHYaQMcxfshYqcjDVL6Gv7JQjYZEVRtKpIdUvSmmRQuSb425bMlITqJmZYx6abg7EwgXN9eBciBuGdXGBjABXQnaUWX8NniB8HlqOzrpavzpkSk5974iEU9IESvh5nKWDC345LL8FUzn8SWEytCp+RGkUiEG0ShXZVg+ogH2qYyqjTw9vs2DEEr6vt4oBaosH47GZ3eDGH5hSJqXjL2/dqRBMRIig4ntl4UD81tGz5oZ4OmskJXTwXR3psnCK5U/HEm52pU/YBNj69bFFd7yPHpMHGL8Wg0CJ+Zlw6pnIX3ZdkyVAkxoNZEkZeJZ4kpXZKA1Yj6vtXbgfrJbx7gMlLN1Cx7Gl/6SaLnHnAQaOESEKJqhhnU8POs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261026121527099003)(261021121427099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?JPY9+xXWhrjOZNoGhKluiEey00KuFjF+3Xjw0kOyPuoNtxFBnWmhaK5uw1?=
 =?iso-8859-2?Q?L/gBi8Z0hndQawTbHlsHRg+NziHIMOw+RGDQec4buDVrMaXnGDg/RAHXNC?=
 =?iso-8859-2?Q?kgAbBt7xbvBFBthtFG8l3HNmCptfkUmfay6QQd/iIf8x+CrcT5H3v9iL29?=
 =?iso-8859-2?Q?ywFZzzzIpDvv++GYePX/ms1j2oAzLBEPJxMmbjYS8mycu33Vicy0QgFwbl?=
 =?iso-8859-2?Q?tZ7sojHedqiz+pjz9hqPPehycgiasb8MsjX/6E6W2wy0GnOn2LDBXlU/0V?=
 =?iso-8859-2?Q?5EPwdaeu9MuZvAhHBH1XFAiKVWm7x0GLPPyyZHfODkYR+cRxie6apBmcHa?=
 =?iso-8859-2?Q?HASgIsUPLWi++S+ln/nywV0QbRdLWWDGn+mwKltbSOgF42osEs7djrRyXh?=
 =?iso-8859-2?Q?ucBfSRGVD4uQcDqhj/Y272Gc+tWgUNmwU4DUS2dzrMgtcJyXuKnM6D6NFR?=
 =?iso-8859-2?Q?Qc7J+H9E5DmYyXvIryrGcDjWvjEJeaN/s8iKvjBwXhTKt93iWwUbr+SwjL?=
 =?iso-8859-2?Q?HkBgMDnhkqib7cW0hG6levRIoQDKpH6ChG17gP0EReAYqRBCdo2+foEWlC?=
 =?iso-8859-2?Q?lVaBkcTcGWHvNYK+6xT98l74d1DDZ9JHRAFROsAnhPFeOUG7Jut7RNwtpE?=
 =?iso-8859-2?Q?9JJcMTUcgAs1D6F2aabh6+UL3KxhB4M7FqSVLMuwswb+x0LclVjGCdudWl?=
 =?iso-8859-2?Q?QJFBgcRDIl0DsJ5P38DKTXVoCnJ/kE9al14BVzHtePKh6Boq7UpHyPyB95?=
 =?iso-8859-2?Q?a9j0d7AdPw1PC53oUed4XJ2yfYkFdkWSo1DEoE6r/JavqbozHvhZBOWohL?=
 =?iso-8859-2?Q?43OkB5ICeVIQPGdJouQlq5BivzxeR+ZrcA5+6p/XObaQEZYzqw9xRc5eUK?=
 =?iso-8859-2?Q?iPZofhzSas//qvqz8Os+DD1RpxtNduio80RAHbLgTByTop1F2its8K9d4K?=
 =?iso-8859-2?Q?nJyNd2B01X6owaTXDWbF2tpggDCtij6SUdDmGkVHaVPyqxGbrky9axnBGU?=
 =?iso-8859-2?Q?tA1RdkvEQswGNpVq60oevGmL2J78u4TLy/hRvTnvDc+7y1RzuKYiiNTN9l?=
 =?iso-8859-2?Q?sbqZO7m3zMp3M+lIUYw9AFFrMd2zRioYPf7dpCcrWuoPpf6dmBjtZo07F2?=
 =?iso-8859-2?Q?7le/dE/Ah/dCbZ4aEdESvVZ9ENxveecZAxfZk3BXTebJU2lBPfP+JSLPz8?=
 =?iso-8859-2?Q?xnyKAWSjxfYruVAaTAv2j2qIj3nH8K0J82yS3hzQascF6P6uj8zn5GEwhl?=
 =?iso-8859-2?Q?F0cI8HiG8oFZgG4SZBkXapsrY0p5Om4TvUCGUjAzaFcpdCoY/0RT3G+zL8?=
 =?iso-8859-2?Q?MsXbIaBU5YXLkSySrekLHRT1vwY/ljfbDQw4Pp5dGNUOund7w/4rBwtH2W?=
 =?iso-8859-2?Q?bJbi1jTQ/PkRABMwHJuFnogqd9Fk8ZfvdAdNYiyOspDqP6BzESWBMSZm5a?=
 =?iso-8859-2?Q?rho9X0GP0XqmTqKi1QpDoogVQWbvl0smY4Z0Lq2j+FaFPm4nMSH15o20hc?=
 =?iso-8859-2?Q?Qhyxy+qwXzeFEIc1H42wCAMWNOXMX/B0fJXsa153w9Dmz27gcdutd08Kez?=
 =?iso-8859-2?Q?ZUUTgYyG7MXtuWlfCzcfCHTg4q9aOK8GRSp780ohqzFRgHwICS/k4u0dm/?=
 =?iso-8859-2?Q?cmWz63Fpzs1AD0jRLPG6yslSi06DQDKA9e8lIw8VXSkkH5SZ1En+MwoU/9?=
 =?iso-8859-2?Q?j6aJzYKeg/3NPYUHzA3LNHhqUFUGhmXr3ZDzkOcw28PAbuX1/GcysqRzgd?=
 =?iso-8859-2?Q?IpPk+qyqir9th6n7+FTJz4IhgtNKcV8AGPge6ZDc4Q2G4F7m2WFlPKqReV?=
 =?iso-8859-2?Q?u6/o7vBfJL1m1+BjsV/4k1NH9Y7tG+j1xhBsGSVcU59SRDQ29mou?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca14ff81-0fa1-4feb-1821-08df4a958b17
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:43:45.4958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVut5WUcxsGrWXsPLHe1fzxe6ct0x+dz1iXoB2RRpC/94chxsorR0YJTczpJLZsKQmpfyUxTuv6GjrRXCi6QVLArL3LlkXJOpi5Dy6iafPw4ELmncDzzWSaS2qFsklDs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_to_card() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index d0b82374f2801..ec0e3d7264cc3 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -276,6 +276,7 @@ struct device *snd_soc_component_to_dev(struct snd_soc_=
component *component);
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component);
 const struct snd_soc_component_driver
 *snd_soc_component_to_driver(struct snd_soc_component *component);
+struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *c=
omponent);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
 						const struct snd_soc_component_driver *driver);
 void snd_soc_component_unregister(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 3bf1b8691bdc7..2d666bb241223 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -80,6 +80,12 @@ snd_soc_component_to_driver(struct snd_soc_component *co=
mponent)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_driver);
=20
+struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *c=
omponent)
+{
+	return component->card;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_card);
+
 unsigned int snd_soc_component_active(struct snd_soc_component *component)
 {
 	return component->active;
--=20
2.53.0

