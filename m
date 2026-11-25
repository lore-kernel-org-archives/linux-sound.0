Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571057;
	b=h22MP91XM1hRO58gIFO/TTidFQ5Clep3Um6s4vi44mYsI/wprQt63qe1ZOqSloiQVEgf
	 anAfBHYKtmdXI08lGW3gpI7HrVP6Q/3Dh2mdlIQv+rZgxl6Q3QprFPe4N7rJvh/mZR9LR
	 HyaPMUSbJAWNFgGtyIgd0NGR2A/fQRKLo+8sZOYY/yGnInlISJF5MO2w0ODrvEqiOdu5+
	 5rVFQK0OIDA0ai0Zxf9/6dgLyFnIjPieQcOjS/AWYAbyNE/pwP0+zKbJYy+TllYR+n4+F
	 /oi3GyGMqWXmPk9JB9VRvo1xArO67LY1ExnSALmDNx0OX5gPj9OcDJTdzpJow5EtdpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571057;
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
	bh=PGR4SggN/a/otfN5YmhA9UgZxLqlQP/cBygZlCGt6cs=;
	b=hH4LxuS+OoyIg1G+LQ/bstCj/15VsP+LnQD2vQrGjWxEw9d6RaVAHIfFUxIdBajFHih7
	 8AiCvodJbFbd8LKwxdb1ZljryfOtlKQxzrazoq4Ea3rucOH2rudDdLwl0WiXDZhBdBATn
	 Cpculoq/oaL1GV7Qy/wDCUZnNjozhkWWcdJP3yDPoMHc6A/qMw69goN2rm1d3eXQHls16
	 GQCoO+UKVx/BYf8c2aoQvp51uuATGkSTr0gIWaxYY20LAJ689w8A2TePTEXV9FWPJ8RdH
	 rar/Md3jFqZevgDiEFJ4bXHtd30j3uRwiAp9Q53mFU8GTM1+CaQGsQ32VLmmFqhe7og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=joq8e6jg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.4
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC54606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FC54606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=joq8e6jg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axJmxJlVepMaCWo/3dNEAMyaojZQvzoLb+yxk3CDBt8jifsWDfxHsZ8xWXXG5y2VXnAEaSYymmf3Xtyw/YSTnN8H6tbZhCSGNauKN6TU5dBnuO2i9BPyIgsRHS5ur354OQPONINjaiRiPylSFY5Eobk01w8Rhg4+lXDYSx/5RlFzAEXcd7K/6qoTdqHusjRb1cYAXSWwUoMorwbVEGuBiMEizKGnpVR0rusbpmE40kJ7uIdAxmnw5PBLTwG+3OosBlOw8gS44YuL+lEP0OhtSukiA3gRWKQsIHy1GPQYibxqeWuORSyNlNnUrIU6p6169r2KDpC9LZQ4PGOIb1WEzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGR4SggN/a/otfN5YmhA9UgZxLqlQP/cBygZlCGt6cs=;
 b=cqaiQWwWW/wnoyeosPa/OGasB2/XWyF9OkhrFO6bwySzrsX3cNoEpfCnkk+BS/bcAuNK0ITneqay6+yslV7nTKV+w5okA5Pc1ZasA2eOqxd2PXEjgcu5SnDo4Pe7KOs0Gn531Y25/Iu8XOoI0tL6qoFg+ZxhzSkqzly0+7hoQQXqLRM1q5+F0f6y9OhaKzTg0++/0AqUb5HlVCu/REyIx/iJF31KzjdqnlTuD2plrYjkDrO3GYnUPoNAze7l3aFZS2k0UwsATcFXDTYwZMnHS+rNzq4B5zattu4nbZT+h1ecCcxqo1yDAvabG5voykcRyngpNZzLUaseMPcpL0iAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGR4SggN/a/otfN5YmhA9UgZxLqlQP/cBygZlCGt6cs=;
 b=joq8e6jgtUMFVmpLWYkUaf8FE1hxSEtUhqAUFWZU9W5NORokezPLF8kWIqhFCpV1u3QKWBlf3dE6BfYlMQqECM+DQhe+Vr0TUOrxPJpSn8cMZNII2WSfIrZgUyRrcrLba5KH5Gl1b8m4da6Gk5Kq5tCKZe41lJ53lWZufx46btc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:44:15 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:44:15 +0000
Message-ID: <87a4mxelch.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 25/27] ASoC: soc-component: add snd_soc_component_connect_dai()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:44:15 +0000
X-ClientProxiedBy: OS7PR01CA0081.jpnprd01.prod.outlook.com
 (2603:1096:604:25b::20) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: e77d506c-631a-4730-8e65-08df4a959cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261028144727099003|261102123227099003|261102130727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	sZBCgECu28Z2K8hJCCwiXCYv7xpfjnIBILurj8LnxJRzWR39a9SXnwuZcV//7Mgy4xnla9XX188sWKUVSOjiViwzkxFMMy3fQa6ZvJna8e1MP91DmjJHhQ1YT0qirZK3k+sPYfev7GPiBQnYqF+FehMyMPfjgyW+anZxlceJrJVEztTmnzAVLl+XzrVqq8DL5w2rFFNcsyC8QjOOewgGNt23x3CACDBK+DzOLpq54uVHa9dNJayEI9+tvackNnsS94jJCY/ugYu8MgB4wB9iUxoaoOql60CkFdlgJGqbLkNZTnygdQzwhO08xNdS0pbY/s4slzmkwOlRzy9yHnAx31ClBgAYSfw8gkfGRu9q//3xpCMEITVbM5JuNxt5IjwdsYxn9ykmDdpiIk7orRDAWk/1bAIqOQqWbPGXb4Vmql5OOakPlWmzoMCQThBE7pKgFmiTEiWTMy+bERqwoCpOmR71upJHXmfIopnoMH83Yf6ZCGIxEoNMacN0GVBIQx5tDSGR/86dgjnXnHsKfmolCc7VVLNIHX6iStfEtcCX0/EaDBLnxToW48uK7u8reag9Abi5ka2ADmGZEniWOApkRjD0LoOdX5UnGfLfilHRD/DwaBK09pDA9tuMsjZ5JpCqtHBgVgigD/7JfwA8RhkUjf7uAsp8QoRl8AtgNQtGPsS5Owq7eco0aPLjTCMWL9SovkNelqKBT/IEZ4hr1KJFbMneiKcGLieRckVKWyVa8hM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261102130727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?j8VeDPqDuCW0c/AJReEgRDpRDS5RJmHWLByXacFgQzbMPBdGe1YN4jizCc?=
 =?iso-8859-2?Q?+wNL3FJ9ywo52rKr+ttZz7iMAz9x1n82Q2dAdaqhwRS98wXV8zfG5z39RG?=
 =?iso-8859-2?Q?ehYEHc5BHkB4fbYZb0HB6vldEtuLAu9mNbmeZV86+rgmX5nZ82DEW6ShLp?=
 =?iso-8859-2?Q?ZclXYnWM+/PtpvwzIjWuShJeVZAbPlpTD/Ebbei+1lecbM0owWWQN4w76q?=
 =?iso-8859-2?Q?2jFMQK8YEHjkpQbHO6MxZ2ERKG34Gl8CitrCqVIY0guhoCSKsUztATyvm2?=
 =?iso-8859-2?Q?johXe8MnMOxObBog+NFti3dm9Cgfx+K8HSTkFr4Bz9GpUDoWQsUiN5FSxK?=
 =?iso-8859-2?Q?6y+RVFSN7FrkHhpQ99kb6B9Vhqz4MNs7EUgpc3+gOg7Jp+5fPNPUZfY18h?=
 =?iso-8859-2?Q?EzaKGCfbHRlkGupVoZVBsghfWqJU5aK1MF6lTgxrdbEUMeHk7kAY0KDQNC?=
 =?iso-8859-2?Q?0J3HLbqiFG1VIgpX9q4+pZVLt1Jh9B4KqfD+g2lR1GpfHPO6mwr1ziIARK?=
 =?iso-8859-2?Q?K8rhXoeSAbpIt726YxMtZ57kgPdBOAYUkgM/5yQL3N54h+enYlYQbLp9B0?=
 =?iso-8859-2?Q?e6pWHRivLsGj9NhkFKTSrgSOZffkpVifBWsv+1ilxwKLrFgnKz9orAru9F?=
 =?iso-8859-2?Q?lLYr+mazt+fvebqiaL5fRk7klYiVuwIPpnlPs+xHKZUtIh1v+voQehZuJN?=
 =?iso-8859-2?Q?DwP36eFbrco7QzmugogFcJvR4mveLt4Zxa4I4BoKSBsRABRopR+ndb5Dye?=
 =?iso-8859-2?Q?CPsCcppmoDb471mhn7ueHegG0a9NSu/EC2xTZF0o6SHiCtOp/3iizLSSaV?=
 =?iso-8859-2?Q?wfquae9ZU0sOXIY0t2s04bOuf/LXvSWK4QujgjcJtOpOSXvkBUuCaMwdQG?=
 =?iso-8859-2?Q?aC9Iv1x7XsbmONr/OYJPN1FXmUg30FqVVSLmh6io1IjtSemiHGXD3LSHZb?=
 =?iso-8859-2?Q?m0FMYOfijkth5YfwIWJ0uNC0IgVm0Q9Nrvdg87Bc2veKzhwVOhBNhQ+aMN?=
 =?iso-8859-2?Q?fIW9XIGehSuF2NUjHGyRGd5YLUln/C1hpyR1yAfFhqHr9awddgNTGoosKN?=
 =?iso-8859-2?Q?zoF5JPIajBvARjyVhQwjfbleXOxtKzeCDKWIbi1IWaKRd+RItJQqtpd3lu?=
 =?iso-8859-2?Q?kH3tvHNh6qcri8TWYv2qJjoeLEWvfIhj2nZ8O/BEYys2p648u92lDIYPUw?=
 =?iso-8859-2?Q?PNym7D+YQSRPC4aQcFqTTs6HkO1E6PEApwDTZAJK0u6FUCNAPsLY7YQdv1?=
 =?iso-8859-2?Q?ftnaRVK7XSzcwiWML+2pPra+t3m79233gfHt9OtNumwHPbjO7uAn+7TMmN?=
 =?iso-8859-2?Q?RxvywSnjSo85nR6wLOP1NiGqeM4DjyuUsU/5Ez1UlUsEqC4/TIBHaW5G3Z?=
 =?iso-8859-2?Q?7wusMWZel+7TYm2BS5o4kJOIaRIl6Sd4oNoND7PX1flLQiAHDVyK3wBn8U?=
 =?iso-8859-2?Q?4HZO6+fl5eepyGyyscR1WUhJ+ZSmMArDr/hOsSF31nZElZ42RfLmKrmkuv?=
 =?iso-8859-2?Q?xUREkR7bkRB4ppMlcYpuX5HnvZuzl57uYWWg5XHdlhi8gnsyTfjGWbHBt1?=
 =?iso-8859-2?Q?NT/mt49qTta19iKoG1/Fp3K9oPK6QbMF12flz0HucpLSeO1ZL+Kh1PUdOL?=
 =?iso-8859-2?Q?8vSgy413QqNsArTsfsWyaJz9C3vMKQ9LmJkJXRLOqFaiYPuRWyEg8/DuIP?=
 =?iso-8859-2?Q?fK3WSyACjlTihq/MbhX9Ls4kJBtl/UrSqFolsuCoOmGuzcDzLgrqaxbSly?=
 =?iso-8859-2?Q?wc30yN3eECRepNLhE5kGv4rJgpTBlw0SszZR5F6aChrJYC0FuZTViito9/?=
 =?iso-8859-2?Q?Q57xOMDCRA6fK5raTqg7YmbQa3XxI67hqSeGY9X3xQevuCZkOwxb?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e77d506c-631a-4730-8e65-08df4a959cce
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:44:15.2486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArQYKvC7H5NsHTt2xxuvUJr55xXl5EYwQmeUaZPjA8Y9btpXcIxQ+UIG78dHopz2OiFkDQoeqlWwVWsuDLq4kMGe3tTkRnid+JN2xoNGwkowjuVVFK5pFoIlVxSZmofd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_connect_dai() to connect DAI to
Component.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-component.c | 7 +++++++
 sound/soc/soc-dai.c       | 3 +--
 sound/soc/soc-internal.h  | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index a0e1a7648b818..806aa8ab66092 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -110,6 +110,13 @@ int snd_soc_component_num_dai(struct snd_soc_component=
 *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_num_dai);
=20
+void snd_soc_component_connect_dai(struct snd_soc_component *component, st=
ruct snd_soc_dai *dai)
+{
+	/* dai->list <-> component->dai_list */
+	list_add_tail(snd_soc_dai_to_list(dai), &component->dai_list);
+	component->num_dai++;
+}
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 9e34f34eac3d8..596180367d9a0 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1265,8 +1265,7 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_s=
oc_component *component,
 	dai->driver =3D dai_drv;
=20
 	/* see for_each_component_dais */
-	list_add_tail(&dai->list, &component->dai_list);
-	component->num_dai++;
+	snd_soc_component_connect_dai(component, dai);
=20
 	dev_dbg(dev, "ASoC: Registered DAI '%s'\n", dai->name);
 	return dai;
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index e09d283d443a8..98ff0e2fc2e1d 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -69,6 +69,7 @@ bool snd_soc_component_matches_dlc(struct snd_soc_compone=
nt *component,
 void snd_soc_component_remove(struct snd_soc_component *component, int pro=
bed);
 int snd_soc_component_probe(struct snd_soc_component *component, struct sn=
d_soc_card *card);
 struct list_head *snd_soc_component_get_list_head(void);
+void snd_soc_component_connect_dai(struct snd_soc_component *component, st=
ruct snd_soc_dai *dai);
=20
 #define for_each_component(component)					\
 	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
--=20
2.53.0

