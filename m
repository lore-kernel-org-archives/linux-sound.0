Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140D88C1E
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 02:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744167471; cv=fail; b=ZwOXE7G1MU/m6YwJRL2iAioz8R9dsjoHCQjPk7bWZv+y8JuKuhLVhi+mKU/QpIBAANr7OVsI6zX4TdZjVy9LO0kwKzPNq++Bdrrs3Mr5UzVncmViXKXHYuTDrM2P/EB5LOLqR7UuGeXeald6f2z66YqZGyR29xHzqb6J803HcVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744167471; c=relaxed/simple;
	bh=m01s23qyX+q0KXKHtuqN8xqgyrVJAhpQSESVM4Adi/Q=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CrllTyqoGTwSPTzzkZi7Dx3F+hmad+w2pYoba7TWkGkQlMPnVIooqK5H0jrUtGvbcuph4OAsJ0fyqTQVzPwQC9IY+jqqMQ/R+W16xgQ69Rn8OTKHoxyFDUR5RNJDmUqmvtF5JY5zihk6v7s0GqAKyKezOlJAicvKU6EFTJaLHWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gBsmkD8I; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gBsmkD8I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cF6VbJ5MEIRSMORZ/VvQ7SjI/XSD1QwPFytdBcQaUt7LAlzsKVBlGGnkJu36nDiLp72SoTVTKlZTsD1Sa4CWeCtK7K+8rUMWGo2jSMahp4X9q+wlm0WSWiqosM71j2/PmHh+oKo24y8dwda/mMWx6gx+fjSvVsG4k2sgiA+WGokjuil1ap4O5bWf4N/Bue0k9+qVQB0zT2qbbiw7D80YaVp11MX6of9DMGnCr9h/1UOFvktVOe9dipV8U5ZOFJWNr77w94hu22swEe2zmqBD+F6QyIp0yIuswPq2TVGZcXQ8S0p1tx5d8oluEPNBUcDaUiFtbO+q+Pgqkc9ar1blKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2GalT5i4cebOtG+ItGxli5cSp9GgDCnVVQ8cdZW6Zw=;
 b=kpMVLzlZbENV4kPoTZeug31WqWomCXyTDFgZpIi+XWR5rTU0ZcfgMt7svkXAb3pJlNI+rk61Tq+7WPL4xDyS39w1CEE/fIHX1m/BYBVLIIVLUoZVoLH+weyNwwqoNWUu/Vp3qQhnT6COVB4ESORfHCnc9+gWLDKt/1FvlsidXBCN5nFUwPMSBno+nwc5RSnqxbwbFOBUyAKFVFHZen3PfHQi+TWktQOVfPmfOEctGIJvZvsM+AnwjZrh7rR+hZjK9H1eU1+/S4Yg1kf0LNwudtaNL0Mp1FoEJ7eaSYEjeQhSp2M/GFmAmK5BPExu7FPZM0ZDxbgnVCITqBsl1apwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2GalT5i4cebOtG+ItGxli5cSp9GgDCnVVQ8cdZW6Zw=;
 b=gBsmkD8IpyXKQsLT59H0md+j5BHCO48IN5ANV1W5AtK2KaYw32+FcEPpFU6s2MAdjFYA850m0NCz1NL6t08zdwtbW9MgLzE0h8FZ08L28UUGsvY/L26tf2iUQHDv1Kbv4+kE33mcJp3tnR9pOpR+VD2MY6mEJ9MPVnk+aev2ChU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11643.jpnprd01.prod.outlook.com
 (2603:1096:400:3dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 02:57:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 02:57:44 +0000
Message-ID: <87frii9h3s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 7/7] ASoC: soc-topology: use snd_soc_dapm_to_component()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Apr 2025 02:57:43 +0000
X-ClientProxiedBy: TYXPR01CA0064.jpnprd01.prod.outlook.com
 (2603:1096:403:a::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11643:EE_
X-MS-Office365-Filtering-Correlation-Id: e30aa144-58c6-4c4a-ce76-08dd77124cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Oe1FJHF8sLwnU4LbbpXZKq7A7Ru5lMQkB+GXBmC+o5oHSf5sQEFB/SaRekm?=
 =?us-ascii?Q?ayA1jvv0mqf1ACgagMZSeJl1l4ewzRs2ofP/mvzoWngpzlQJxYZmp6KFDcTz?=
 =?us-ascii?Q?9PpO4BGDdEiHjEnAiy7sZqOJsMIQ6lVAOodW6GhpU8wPNTnGPTeXTnJcrfdu?=
 =?us-ascii?Q?1t+hirZT/8+DCnBGAkDFLnKHrY8u7FGaUTgPVC94oeOUPs2oL7CBHxAUnksr?=
 =?us-ascii?Q?awCqE8hfIa5QA+NRGjE08PCt2vEjB5vUBIIKtE6uKokNRajnq0VjTAWOsh85?=
 =?us-ascii?Q?bCIrnEmRMEzJrG6hZk4EFN8rM+3Y3d96taURjxdYbgEufx7G8GopAxKZywh0?=
 =?us-ascii?Q?SCVsouVmSv3mJzgsr4kxleK8LpZVdkaRx9LL7mBtarMbHz7+UZRw3HRlQM64?=
 =?us-ascii?Q?FRBl50s89kAEvFvgDjoKhzpsM4SBr//KPBwu6Qh7jf6RVXC8EfqWKJwN50JF?=
 =?us-ascii?Q?AXcRrsPK4+LHqntbIAQI7iAK5mSSTInk+3JxkushbHOKFec5GYvISmmHuh7Y?=
 =?us-ascii?Q?yDyA044mzt23yHmgDYBgG2yxZ9Pbde1G33vAfGGVpULH5iMZSjshKfcBP/aS?=
 =?us-ascii?Q?mV6aXR4h/Nz5g5Phux41EtPBqG9Zx+aPGo9OhGJfyZFgTJpaVQkljNNe+XTU?=
 =?us-ascii?Q?ySMc5NHBM8MEbeSczCEqcoq84lO2bQU5IYMkE740/yRlkzF2yYunPOWplbqp?=
 =?us-ascii?Q?qq3/IM6mabpYVAIBKZS2gathlA8VqU0X2eZSbTwqE8pxOpTanRG1r1Yigeiy?=
 =?us-ascii?Q?poDGkTeVLdtE/BlAhhfEG7KaYX6/atIneyDQ6gpAybHNH4SGdDNayhE/AciN?=
 =?us-ascii?Q?Mmr1CLDS/A8wXHzoO3N0/myjROZAbP0mCL3tqK8hISYZES2tcc1lYOKVXWXH?=
 =?us-ascii?Q?wJxHXyCdiW5bga3gJ4uNkexHgc+9eEmklIWXa+IiCjmjCamkc17VA4d8oiHM?=
 =?us-ascii?Q?WWv1OMfzNLXqBEYxJMjNx7Ip5hDlsRT8ivePmyOBXhslN3IwA2TCGjlUawR6?=
 =?us-ascii?Q?WUbdHdKxVaWVqWdIrjWKZaC3fcsvwcSQhtXHlU8C9qt3gLbp+FNk9fg+Agvy?=
 =?us-ascii?Q?41j6a10DZ2Nv8j5D4YNMbFzg8hQeKA+1xEZSFhFVU7vaVMgfiqeW+7c0RRMh?=
 =?us-ascii?Q?pjLXKjvnbisxSvdabpfR9bsG9qjt1/QNxjSFoac+1jXxLOw1j58lk7XRTn6g?=
 =?us-ascii?Q?527y7kCcn1UZVSt9kB3sVO1CFOiVUh5N0QkT1wLgNj8XSPjv7XKi1kvSqqwT?=
 =?us-ascii?Q?bO7qzMQDPkoqoIowZ6eFj/kaDWzoeGE2iR0Pq7I4fBOYeNgZRBqpRTjoieKU?=
 =?us-ascii?Q?3qOrw8ITWdAaDxhqzVQ2oRvcDCNmkIJJcwtYsGuEuXSUPfUrhDxmEtXzWFtu?=
 =?us-ascii?Q?nyXmKGKNq2arKpx2v9a1gpCj6s4RC2ggh5xgruc7xecC9p7TfipKj5BBkeUH?=
 =?us-ascii?Q?Ttanmb4YhU0NxX5xTG/oByFaym3CQQ6v3L/dkhOJ05140ETpVlCUpTZG/vEl?=
 =?us-ascii?Q?W0etIXBvjql8u9k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wMBynzlLFHENoBYC8H4MdJ6KIvf+G6pVm4AKzVG8qHENzZ/bMaYgwVoqK6ll?=
 =?us-ascii?Q?IL4UWMn1yJgWuhap5NI/pXK2yygtjYXsAhlXL+qtTIEEFJ8DzI3bOBAWYEi1?=
 =?us-ascii?Q?ioeXNkeIbEid74cYq8xPYjV8GQgNQUrbX1M/xFJh3we0noPsPtqveDGjSuGt?=
 =?us-ascii?Q?mCRoodtHhlfb7dM2qOE2Kj+GiDSxflR8QQPea7u12dV3vA2G7ODl63pESbtQ?=
 =?us-ascii?Q?WwszlzNlFdEdjZ9t5/WrYdQTxsXdCPvX8f0T+wBkuHjyfmeHJcicTYcnaSDQ?=
 =?us-ascii?Q?yaA2HAsHFoKnTiXiX11hH5zVsGUsDmyZPV9Smz6/xy6DCM9AB4Tx9HVbpa1g?=
 =?us-ascii?Q?6DB/eZb10Vjr/ncSkmBUYQcF33XEHGHxvXARh8BSjn4Z62jO6LQ0lwC/tAy/?=
 =?us-ascii?Q?Gm0ZanlqT3j6OdLCP2+qCG2vt0Rv7bSfISj/UMcJQpEsaY1ghuGTOD/CRHyZ?=
 =?us-ascii?Q?DwNa4aPvs1bhZoxnvVf739aKrCdLCkKpHlVUXQy/CjI/uUPrkfR9srWd727y?=
 =?us-ascii?Q?D4nh1hqtrVDS+viq6ANkIjbIojelVvSvoydFtsopYKLVsa6q9AdzXBD4CsNo?=
 =?us-ascii?Q?C8OAv5m8s29ReRfu45RNHwGBmJOIafbICvBK/vaugUzaFr+c+lxVE7XwaM7c?=
 =?us-ascii?Q?yzemiuFyk5F1BRoAOdxrGq8Ty82fF54kdPizPSUTsmr6NRDyxhcuDY5yG92K?=
 =?us-ascii?Q?DL+XOHnlyTrglcHvTpg7fpoW/p+H4i0V8LCLA/nCndSXbd+w1SDSJZhgDgx0?=
 =?us-ascii?Q?+LwWnhhI99o+hwjBOANBCJhf4VA3Uuw2uzKgO4gZK3/s7DAaeDn9CNsSMRy1?=
 =?us-ascii?Q?GJzFhn/cwP5Xay/KZ0bKZ6x9xhUiK6EGWFxxcNsvEcTIyAc0I3fe7S8F42nj?=
 =?us-ascii?Q?6sg5D4MGin5W3rrbJzx0B67CKHpMTthp1489/ISeomcPAJW/ABwLcFOA21k9?=
 =?us-ascii?Q?A+k7QvGdSg/gJkGPyuI7PvI1kyCGfuY48Ul3v33/AJBwoSmVUzL7KP38bRIA?=
 =?us-ascii?Q?4fbgUTVgfv5tf5jpjYngSJXYmLROTtfZC1DDepFMAjWmhrLvjDtjZrnrfgqc?=
 =?us-ascii?Q?v/jXaWMNFtTeuehZFQNZu/ijAp0TwPiHRmZTs3Hni1WoB8ucNB4X82WgbkSy?=
 =?us-ascii?Q?TPBTprvk47awandEY3FkMJPCYLSUtJ35owiGBM3h+lsHOKljyAU5rKn9o74Q?=
 =?us-ascii?Q?YM5rfFNdNKVDx4rMho/F6rk++Y2OIG+EodHnxgtY6R7evGHyXBrS7c7zRqvp?=
 =?us-ascii?Q?zLmp1nCPABAAF2MUb9X1FWc2sroLM20X9BOjFztZJlC+42KyJupIsODuOkhe?=
 =?us-ascii?Q?B8eEb87EkryS6C5AKuvZPP+niN6Ga8tpQblIR/4gkq65Q+B5umgksxW6U6q+?=
 =?us-ascii?Q?VUlD4sO58AxsfQX2PZlropYE96i/ALzwVDGhgR35nBDiYN74NaF5w3e708QC?=
 =?us-ascii?Q?BVFUJtk3f02t1ywVDpwNrkASQPQd+9aFIIWN0dy1Kx2VmO6SZcYdI5lz0nVK?=
 =?us-ascii?Q?wDdKOS2mmOdkR+JW7nDXBmTAO9fDfF0HZFXCbBX5Sgn+L1QGLmlDgby19bei?=
 =?us-ascii?Q?xuyXnliVG9jFT2lxn7+p1oLfNBE0MWAUy6l4WWaltAH7gNXIjhBbhNf3xGqS?=
 =?us-ascii?Q?UdG4vrfKWJ//aKmUCrecktY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30aa144-58c6-4c4a-ce76-08dd77124cd9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:57:44.0060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXsI17DvuludTqLpxtvWCW/pL5w10rxNc26ixMQNId9RRll81PaMiJqW6jwFd7Kw/Yz66AsmnkywdZaXhgRn7+DK82QHgMcuHVr06MulkmZvkxIhsFIWFuaMu0QpV6LV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11643

We can use snd_soc_dapm_to_component(). Let's use it

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 7b0b8531bb32..df9673995f62 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1242,7 +1242,8 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	return 0;
 
 ready_err:
-	soc_tplg_remove_widget(widget->dapm->component, &widget->dobj, SOC_TPLG_PASS_WIDGET);
+	soc_tplg_remove_widget(snd_soc_dapm_to_component(widget->dapm),
+			       &widget->dobj, SOC_TPLG_PASS_WIDGET);
 	snd_soc_dapm_free_widget(widget);
 hdr_err:
 	kfree(template.sname);
-- 
2.43.0

