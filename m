Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741771922F3
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533740; cv=fail; b=N/WU0cX60/JgmRT3X1V+JcZh55DEW29ipAa6ecmtrvo8FUFLkE5SJhWuijUUgZERN05yaPCfE5kLS83dVRIUt5OgDB4kBuqNq5uj1D6KGHoAG4581p3qbngG6KOG3aF7WeCG4oLwf060uC6b6i7q/XdqxyVkFj+QNDLSD6kcwcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533740; c=relaxed/simple;
	bh=5nlaUMkYCeq6eD6vGoIrjDkkrXR2DcJ8XmDhNNPxjHQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fyZZTGb1BV1cs+fqXcYLCUcIQ8pVbydEE902x48Ik0nNkNG9ks1ZNMOuMTMqHIpvC73YDvXMm3dQF2qsAHeEXAy9gYsYzUNPY6KGZvBy1r0HdOihyjq1E0LzumQiBZ+k78CTGwsSQPl7uuaxRLMfKWPfoUHVKXhBwCdQsr0jTGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oFOFsDXD; arc=fail smtp.client-ip=40.107.74.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oFOFsDXD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+JkI/LGT9FqL+v38JiKAnZ8d7y2z1NaNF7OvfntFEkWki9ZH2FE+l74GucFNNBOX0FZeQecc/DtBSyQHZvfQjVXyP5VkzBy6KvPRvcNwCB5kW1BtPDYI/6EvmXn/u+J9xkR4avE9SXye51MO9moZCBcYNvhysqs4V9f+94mvP54skZfcdWxo3j4Ho6p+NNg6UopryxFbx4PYS3LOE3t9Mq93+XzFDmsWg7d7qlCy44ZCw0ghaH2IJVdyC4pkq++R5tI5QxlT02a9wkT32vsJdGLN0Yj6hIwM7MhVLeyf3+2SKL7LxR3n94ejlymip+LhG81JffB5qpN1ovWLbexVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3Fe7rANgUJ4RV6/cR+MGc3JDkatNFF0RxcJxd3wSQk=;
 b=wWQQtW916zJstTiyj7wIu4/cDMNmqlCv+Z9R9CfETdhDuW3ROt9Phax370TPjwxqnwhDu/OMQVcpjagtzy5U+IlOtYsaqdwCcXQ6/NAz5PMgiHoHvfCyQfP8gmRh6Dc466oHc7k3a+zjdXVACzdaToYyFE2ii6wEpbY6DFNOjuDROd7TQzN0cpd8WF4VgxBaaT5pQP9zPpv72qO2VJpeH8g1WFaxXmaVCCFoFuQZ73s0r6sTu3nvHAW2R1e8JHH89x79vqhwm5EXq+XP3yXchdf881AyUQ2FGg/6zmbfBx10hgaIlP9wQ+h/bHuZeF1u7Gw7JKTtVSfR7UYx/qJRvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3Fe7rANgUJ4RV6/cR+MGc3JDkatNFF0RxcJxd3wSQk=;
 b=oFOFsDXD+2pw9e80X5g/tczauXiwIcLcUhebEJEUEhaPueAxtyoF376g0+9Xcj9jqASf406IeMnObwqe2TaNTRBALCsY5QIx4W1ybFxMEl8mUl1L0UDrXp4o9eWf3DTbE+m9sUkvx7/fRWTH27zZOinpQeNMcTdfTswjDjs0iPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:36 +0000
Message-ID: <87wmddbi8o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 088/157] ASoC: codec: wm8961: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:36 +0000
X-ClientProxiedBy: TYCPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:1::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6a9ba9-cdec-45f4-2a70-08dd5605de5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5RrP1UXB/13Y1gWSrrPp9bjeGqEmK2+GF6L0ZhFvaeNMcfQYJQ9SwB0Fd//l?=
 =?us-ascii?Q?r6WQ7AgzYAuLplkn34LsdfFz1YY1xryxfN2zq8AqUxYp5q3UhnJqIU4WKCDC?=
 =?us-ascii?Q?T5F9fVjWZDmrXQ7ovl1Dn+F/0o1HNBisWZDOJk6WXE9p6EWpdaxUEg1sUpE/?=
 =?us-ascii?Q?j3dBjqqYOQHWRq+eT2a36wLprinxX1N1k4bcr9flEaQuqcemW23CKpe+Ds3r?=
 =?us-ascii?Q?kFGFATok7I/0hnZVJkFtjyx7RVvXGb9dm5buW++LRTbWCHGEk7dM5SkLcfov?=
 =?us-ascii?Q?goUXHhbA9eK6zBXlJ38n68gB6H87kp/8waOqhZUkfXVpV4wz8s9dkaiYh1vy?=
 =?us-ascii?Q?8mJXLkUBsvDZMncNE5VFaS9Iz+la2oJPwY6bwK6tU6BBAKQh6wkBGnzemQMW?=
 =?us-ascii?Q?DlWRrxZOxWuxie4dCeYWRfj+C8pq2DXK0DcGObe8H/5q1OI5zOtSfS+u+UT2?=
 =?us-ascii?Q?M59uPiIyv3+VVpyrRvl2wYa8Pcl74slqQG7jUYYtbl6Es2O1e0dfjioHLav1?=
 =?us-ascii?Q?gTWt40pkKn5C7eUTaY0cy57rs/kGQlF/nAhYGGjq6bPo4X+oK6f7ABBK6v5v?=
 =?us-ascii?Q?92IWCZ7d7H19e7t29/9+OfiIryqVJBGWMZTasct+N8s+5gLuVAxUq4hgnEx9?=
 =?us-ascii?Q?J+45lK5Eb6Q+jWIpxeBe5uKMKAHCNjipsot/MR5W3uBaN/3BPCYngZbS1hoW?=
 =?us-ascii?Q?0U+isAl4KycAuroQTAIpImZYZp6zhPgK+tgUWGiPSrDYA7yzBR9YfQmNEXld?=
 =?us-ascii?Q?ZT0bm4BIMYcMBvVXZwNSYas0DvODBh1ubspSSSW1Xca+KgVGJQGIY5AjaWuV?=
 =?us-ascii?Q?s2Aj2qNtQ0BpNqHCubioFYXOIDdLkKqob1fCJCAA0somocG8leautjtAjcRV?=
 =?us-ascii?Q?6N5yJO/wFPueZj1PP/lftgfJB3jPvSTDeIPMjTjriEH/jHaaVHOAp0c+Omzy?=
 =?us-ascii?Q?21fo7czqDhiLrgtuFrTqAEx45DkyTAgNX+RpV6iJgM1wYPAY7pEkTtwEMN8Q?=
 =?us-ascii?Q?gqiuhUj17JC53O2EDD2lelruxlMpHZ8+TCFZWVcdZ4jSyP10XK/wZ3m+4dGc?=
 =?us-ascii?Q?YNnZJD0837iV83uTIqAufCWUda1MHUg9JW/2t6XWrKATBiBMMUfbGLAb2z1e?=
 =?us-ascii?Q?7pvO3fSUHQgjxOmN9Qjnj8Y6tHViUa0mu/fQ42nd0lCb47Bx1r6OftCxDw6v?=
 =?us-ascii?Q?FM/qVfGGociRWxT6vGAmKM3WM9bXgImGbQDD/5txPaq2QuqyXTJZ0XJVxIQ2?=
 =?us-ascii?Q?gMPMWJ1xxAS4eCj9TKjS4PFLBsPhM1dNh44qIq0UkLxZiFKgaNwYg5ie8pGZ?=
 =?us-ascii?Q?cJrLx+miakarG1KFHptd1Bwd/t5RFc0aNziTh6zJ2rh2SjJoK/zR+QlEHOoD?=
 =?us-ascii?Q?temCIS45J5ufnRlqEHzyTtxFQKukeqdI3gTs4Nn7SGyEr0fT8afhrDzHqqs9?=
 =?us-ascii?Q?vGP6TEmNlzpQ+JPbzayQhud8lib7vtjx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S3s7GFztkZD5+1y1jNyozxQ4MjWqI/DBa4ccnOrpGP0cka2eFLLusA8EPxKR?=
 =?us-ascii?Q?l3WxLhFahqewy1AWCYMcOmCKyoWSWs3NHsFepReauLhlzJMTe86bj7FsGOCK?=
 =?us-ascii?Q?iAbJFLU8LKNYBMttPv9JscO2lrG7ZGrjb9ZD9loRC5vGKzX/72vGXfhBZWxT?=
 =?us-ascii?Q?nViq9VcAQll6oaiymQQqN0iHaS+yX8qH0UL6bYvSCnB+P4NSiJIW+a7JpVqA?=
 =?us-ascii?Q?I04A0p1WcGNiZyYhGnct93bvmNbPnftVaYbJ29dKv0UxFlHTTUFjG0gmSwq0?=
 =?us-ascii?Q?aMaVd8+1YE05l/jUkJh8jBgiylRqiBvNRyxxJF4tA7N3ik/4ABt825C/Sge6?=
 =?us-ascii?Q?Sp2MlQ/GnKiCt1MP/CHG0ivFnjzbgUx6Ykh1ho8k+ZBuxDM1PzpnrY49cAga?=
 =?us-ascii?Q?hJ2yMwHW6jxVxjzQ+gfRNeK45rIjN/ussSG+HgAOOIW73g5OwloCI0rAtVJv?=
 =?us-ascii?Q?DoNtJWygyaz+Qxi0PfTU8J4jr6HrH2jozvMIKvF2/mbB/76ZST7HjM5tBBBM?=
 =?us-ascii?Q?xNHo2SQavbflcrEuDF630awHo4lIrAocS9/xEj+091zJMnuab/UnFrQqs3Ct?=
 =?us-ascii?Q?vdB+2SdDAahPOFEYtORhvT7mid1c4Eca6kYskBtEtgRURew014/Sk6P2ujsI?=
 =?us-ascii?Q?tx7ItZLrzUCoTr3rgSWZQaIcAGWoQm5AwH+UJJR//03CQM5GyURL8AulgSWX?=
 =?us-ascii?Q?5fwnRg/6otchlMIi8GIatyZid7JOf9cuR1S+6XftTdEUOjXKW11PP/0WA84i?=
 =?us-ascii?Q?oG+CitPCB/sAFwGmYltZw43eek05wqFqFswOjS+v5aCUhjkFbvmGB/Z234NY?=
 =?us-ascii?Q?BeqZRLY17K+doRPlhnn+bTqyjVOm0TKSvykUF91EUHZHkg1fxxydtec6+2Lu?=
 =?us-ascii?Q?1HNsCiD880d6yu133ixa2J/Qjnf4soRe7mwzLVmB4v1cHnsemLHJJsW1ViTe?=
 =?us-ascii?Q?peSesQ4qZex/gadRWanYIqsB0XdOEFIjUyH31WJhlFbrg3Oe9P62m3+IahGU?=
 =?us-ascii?Q?/FZBPjj0avhM2Ep5dOpbxtvojpxopkRse8mpTkHaOQrn+zi66pjrMl1GQuUe?=
 =?us-ascii?Q?TbJkyhVZsgrahSOjZv8T3/t1zqQ3qlq6cohkhaM3mE5vH0fYi1lDNGMJ7Y3T?=
 =?us-ascii?Q?jBJuSviZon4bXa1+MWfk/kOBi7gA6LAaQzqLgkXy8st2qbduy1rqj536E+aT?=
 =?us-ascii?Q?7ZimEwpxxdU8O4F+hV/v+vGU+d/453JVRJlZPd3ODHBEStiR18Tq5OfZh5lT?=
 =?us-ascii?Q?sRHNaKH1YSeGwXir1SY601GlRGlkcb82+jH/73y2JCET87LFjPAclJ7eNinp?=
 =?us-ascii?Q?1CWo0GE2yA4V8OkHAFSeVR2jhabswT4mn1pRK5GUyOWVlJdGACUGrW8f9+ZA?=
 =?us-ascii?Q?roabE4Y4rf53LfMN61SR7UP9Z9J63DO3hJFnacrLUBQYKki9OtDAhql8KbPm?=
 =?us-ascii?Q?BpUmj+Ji9hBm+/96aZBgl0TMkUSJZYNqRfxThacoJyDgAGRXEBJbs7GWhS7A?=
 =?us-ascii?Q?5c1HHBQbP7BcYonmadU4rPl3ul2ASJUAwfcXbwrVr59UryJH00MsulSGyZvh?=
 =?us-ascii?Q?bgW4ANvND2aCR3cwFkEKr583QmrxHMxSPu+C8CWAVYSgB0keFfH6FiNHPipq?=
 =?us-ascii?Q?PTx2bVLLz1NZimr0vwNrMtc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6a9ba9-cdec-45f4-2a70-08dd5605de5f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:36.3314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqgKk3YOBqL8o1cC7G4zwkaNI2cLT7+8JNgKa0Cnd2XanmhduR46nwytYW6PhvViv+TH/nPZwKyTgbSBASFGQB63V3uTmolJXamswlaY2msDTtf85OHcpqGm76274FhO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8961.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index d1c731e25777..1ec7c5e8fd69 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -627,10 +627,10 @@ static int wm8961_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		 WM8961_MS | WM8961_FORMAT_MASK);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aif |= WM8961_MS;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

