Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AB410E9
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 00:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744591571; cv=fail; b=m1lRHM7oeS0KOfvHD8kmY/ScJ6GTqS3HMms4yM5KWg+ZCOC/oiha9MzBquceP54zVVeHwxbDGeE+VK0JEY0tVXtPyhYIYhzN7d6BnjjkqB5d9qSaJAhCAdmVivgZBRCehmw47x1+wta/5CwyYsqr0xVqqvaA4MWY7zsJjC99x9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744591571; c=relaxed/simple;
	bh=sEm6zWR1BVlKuIA0pbOeIUOMp2ZF4xFrvGnSGmEEsOk=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=lxcwqzslIvOZpDQehCzMTfYwPSJcFh978cypxSlmMXtbYKsdB6HgE8sQxjBzTvH0baf3algub6s6QemYdQ8XL7eigaO8yXvgTHM891xPut4NBYPyPs2Zf0FnfMuvY4+3s6DCyxP4JbDexAtWO1+sEXIbGfK5o9d5a8UwTPqdQl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bmHmS2aK; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bmHmS2aK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhagTGoK1RmvUm6h0EzLJWewFFBnvGMB7PUyE+zYt4RQqbbhKszfaB1LMj/1+AMbbN7uUsbesfQLU1XL28R40Th3r4a2lCijD4SRyLJMNeggefNeHE2Lk+6wFuT0X/H3QzenQZTI0sGWjYB/ZCHkvsaxfr4uI48K0ZEqdFKSBw7CjdZmOTAvorMwg0sMerQAJ3C+0FSFPgVofBB25Y1mz8X1NIpeWfCpYIl0J5HEx3Wvv8x84jmCe8bBABD80+hlYXEenk0bkutCnVzvKs6J9r6KB4RMxt2LB2UZYDOSP4qF+0BWkePnNIo3HT0BjdXPC5WZkm5SNugXosuOwu6ZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIDfbAGPh3BgaWSQelOTT6QMTyfm13SA2cz/dUszw1I=;
 b=t/Lah2hle5v7T14ZJB4XfXQVtZzoe/R0d7WO4W0/5Yj/ndmQxjzYPv04p275paEWRvBuNmqW+k4HNzcrZaPBOwHox+v1eoAEFTBVl84ereIC7xCmbqJVg3LSeoBAKB2AkLpxgOLvfX0UATH45QBv7pnwgGVCMFsHS/YmWI0blnwp6Ypvf26962+Ufw/ASLjj7tyLrgbRQBODB37pnUq6BtZigX/zWerjirVWm9UAKgqDJiTWiMXBzU8bWq3VMjdPj6RGPyAr7vcHo9KMhpI48oGTi6khChCFkSLuMJPIOpkUWne9VWLaBv61He/qz6a9PyMPY3UHBmXWRlrmnF7I3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIDfbAGPh3BgaWSQelOTT6QMTyfm13SA2cz/dUszw1I=;
 b=bmHmS2aKFJAfYjiTNZORup8SS9zPEosL/32Kdspgta3U4+A2zhv5hqx4kzE+Cx5JiATQk/Z7jmHMraK1DO9g42eQOraQgTSLP3f/OiBNE7T2XKekzDf3J9ATCC+CbJZhCCwyjv3Oubrq7p3NThKeGMF5yAn2vlrmblC74gbtcX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12910.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 00:46:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 00:45:59 +0000
Message-ID: <87fribr2ns.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: simple-card-utils: fixup dlc->xxx handling for error case
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Apr 2025 00:45:59 +0000
X-ClientProxiedBy: TYCPR01CA0210.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12910:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b189c5-2338-46e5-6c0d-08dd7aedb9b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rw8x4B2BXsdHNpLLejKCZlz4+5LWlSWRcoE8pu6QFMZc3vtY+IESDQqng6Ic?=
 =?us-ascii?Q?FzBqj07ztx49GzPpmmTnRWP0CtCrRPTvVQijbNzaUNyeytKaYM80gFuOS4Rq?=
 =?us-ascii?Q?sgFmuNMb0L5FQX5z5ZKLJjFNu7L3IllbrGKOmozbizJjZmpyMPFFZtr/6Pyr?=
 =?us-ascii?Q?nzu9aG64y1miLw5ICFGvYmFICf/ykpimNNpiktkhAPD6wpGQ/UpP8EY33Qrm?=
 =?us-ascii?Q?UuxgNxvvkMcyAwvVhYHyOSeM/bTBr7zgY8xSzSbZrgpqv0BU38e6QL7+f1+S?=
 =?us-ascii?Q?k+AUiQQMn15wj106eWwc1GrgFVLTjrsxMTFjEQkEBIgT7kFq4FS2GJ3XSBSl?=
 =?us-ascii?Q?mjQl58baq/Iw1oh5UUZ9A27mzIWELU6IV/uikEa36YdDx7ydxbWLh0BMTA92?=
 =?us-ascii?Q?vmRWvTQVw7oLyg40D6q5qTntpNgJXYBGGsrs6RN6ioD3fxKsvDxkBOByzhhd?=
 =?us-ascii?Q?/PDBfwJoSFgnoVbJfNy5qDAzI+mD9QqPjkF78VMIznSaOaQSDotoCCwZ/acT?=
 =?us-ascii?Q?bpRzaAtF+Py6LSmFPFkdzYwr3QcIHYqOEv9C70Qgaajan2yaaMU5Kap+rq6C?=
 =?us-ascii?Q?t+vkKUGqUwcPayq0QC3cyMRoiGcdspuH043GpqKMqaGiQltDpj0I4Se4P1lO?=
 =?us-ascii?Q?cnee0YP0HYSKnRScPwsZJys75/D7eYH+ViRogkzQUaWHlKwnQVW7hbTuDtW4?=
 =?us-ascii?Q?lVvMNK4dfQflRMwhaQ3BxVK9d+AETDX3warxSgkFB1KGpTlYsR2RUViZ1oc5?=
 =?us-ascii?Q?DzPGzGUl4r/WSMdjin4KxlNQ8e+erZQ3jgzNptZ9d03jG1Cmkzb+7IMZcvIx?=
 =?us-ascii?Q?YCUx7FBSNd2nL7grPmpUgID2aIo1qNsjcoIBkBKnp4UboCoFjm3zOBKuQpu1?=
 =?us-ascii?Q?iOI4lHdx1zOH+14j3OwtvNP3ICfTM5AO2o5CTPiW2+elrZBNi75Sm4C+JDaC?=
 =?us-ascii?Q?USOOG1C22WOJ7ZtZKijxAYuYiochYyXcPOV8rAQpL6tgOF+xiCuS4ad6IZ65?=
 =?us-ascii?Q?yRJkGZz3BHe7Syzj/b95dWqS8QTuhVEgXiYmKMMi1qLGarp93TLWYZeE5XE2?=
 =?us-ascii?Q?uhl8mztvf5iD9nUFdToLVBkaJJxTr97U/jwAmZA+W+IseeQZH5SS106vxNzT?=
 =?us-ascii?Q?Y71S5FMDLLyibNExHlBCzW80opRrhQma70Y6pWeDpHKr5IhbAivNi34Zi9VU?=
 =?us-ascii?Q?h748mrbMJWzsK1eLiPomE017TMtG0XSPUnKCPSk2o2dvOrNBFGIMovxzWCFf?=
 =?us-ascii?Q?6SmVlMoQRwfWEQ4BHXZwk6F9hTBEx75yCnPlYnBi8OHoxxX1eQZedPHmlbbN?=
 =?us-ascii?Q?xmm3Dsz4+FwUUUeWXkSR1JV6AFKzp3iiEqDy0xCmXFRpTvDrZIuwkgxF3CnN?=
 =?us-ascii?Q?qboW2lxbvmJ8JmML/+UsyAp4zTOkKS3SOt97NL8YlfMz82BadpO2g/uXPCvd?=
 =?us-ascii?Q?IXtVzH+F3kex4PBgz/M451KA9Wzsa8awKMmwJVAkM8C0wz7OunEP7PGjgc6C?=
 =?us-ascii?Q?7WWvL0ujqRrid5k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p3OnSptK0TQJKs0Bc+c7YMCFerlahB9k2OY2F7DGRnId7sNMXjDL5Rlu4ci7?=
 =?us-ascii?Q?eaAC9NUVkGgzViwg9MPjMKNyepn2jx5eGOq50cmQ8TqGI561IJWuSC/MmGi5?=
 =?us-ascii?Q?yCLIq7BEz3hMq6e6liATg3CFmeIhtul7qEmNF9Y6Sz5jdNwc+KyEYHQN0zwz?=
 =?us-ascii?Q?jP9FKF3q2Cx1OFhZdNmkgN68pnr37H8xZGYXuoclXSDH25L7mo7D1eTBwhXv?=
 =?us-ascii?Q?/1j25FFYdYUXcADSguJ1XdQLBl7GBG/uQLtnKXMTr1quBxgEhEv5URrEmHPS?=
 =?us-ascii?Q?3pSvR66ZBjTyBlaNfcpKfAU1FcxjiQSn/Q3ExYc8ng0aEj9HcLwMkW5ITrva?=
 =?us-ascii?Q?V9iESTMUyMORxbQ7HMGOAv70VDmTxQrT+94u0LKbh77+cZK8rVm4+8HMueSd?=
 =?us-ascii?Q?0YP/HkCUIHWUn18oanL3zkYh31CtBsQAsSeV+66m/5uYn+Qzqy6jlm+alcS2?=
 =?us-ascii?Q?4p56iK01yhbdoRJtnbWO0ulfIPLu9iNq1Vt+FTgbY4ZIBSq2TCJoYbz282Eq?=
 =?us-ascii?Q?KHYuYRGjd2d64dr6QN+D8YEG+ocnrt6W3dQwhrEzWKC8c+I8skARdEP6E3da?=
 =?us-ascii?Q?u/BDs1RyI4ipR1zaPCCi2ix82IiEh12x3tzUYtmIPaDE9yUbKrQ+YwDf+VOB?=
 =?us-ascii?Q?denPuOm8FGPv0/VisGRD36iWAofr45TI8CIcf1FKhKpYtFGSHb2wE7MgYkkB?=
 =?us-ascii?Q?/UOZrUltJCBh0S98k2DCqhJw7G7lQxT4yN1hXTPkDAwwgk1vq9yeQ5ZEilcU?=
 =?us-ascii?Q?h/C7dzhj7aLJW0kiRIsaJff2itJ222tFYvdXmwlj97gnk3r9OUSB+wlbOQiu?=
 =?us-ascii?Q?TXD/2xqvbJQELeBEIGztZVO9G6JwBHjB0Jp9IIaCmYjT1WEexYSVVKUX8/w6?=
 =?us-ascii?Q?+Sodw78TkjxzM7lQlGFB+wl34ynIHghFuThHLe9p8tl5STqisQ4KvY7EJwIr?=
 =?us-ascii?Q?P3WxEdclEvfWvJn2am6TIOWOQShdXj/dRwE2ab87eidqxGJuf8lGRIKWtemU?=
 =?us-ascii?Q?8g1YbRUOo2nVPF3BzLH7eg3IRIGnITq82CnLLXslIXin3kzWzPtZffI3lObn?=
 =?us-ascii?Q?JympOm3tIWh3cyDa6Ud2aQy1SCPqcbnlCVA/osm9nMdgfkWLZlYwSEZ6/JSS?=
 =?us-ascii?Q?JtMnrosr20cXQkb7oUfx4bN+0U//RhJF11bmGjx5cO7HEkBK6XY7tCWzpccx?=
 =?us-ascii?Q?U8x2vHMouTPxy2mp/B1vqgsClu6iHCvO53lU8Fb6y6FU3xn/lVD4rzU2U24Q?=
 =?us-ascii?Q?5S5/+OtS8wgwQ62z67qHo+bn6GE/WIx7np3Uhboz5wYwhNVRE/P82gXktlPZ?=
 =?us-ascii?Q?ez/EBF6TVLZ4iwXUClrPmmkPINsHkG+nN+n23vUyBt09J+0AFbcvE8klqAdD?=
 =?us-ascii?Q?eAht4ThY2hzorc3tDmjnaaaKXJba4BVc9Zsq2CDjb4UHLPhnZWMnVwKnQW9r?=
 =?us-ascii?Q?MH63tICSeoiQCUZBAq1Y43of+TUKW7P6g6b8ag6ZD1m3lncCqH8cys301DrM?=
 =?us-ascii?Q?iVuRMNvy+12gTYWYGJxjQKz8Prxzkl2z8UKTqMXX7I8wnX1yPX7Rr3M5MDvk?=
 =?us-ascii?Q?N0C6rR+BlKQhiHddQTgIdnwY0hsgNEGb78UIjLIVCvJt8Iq7S6g3wAsGKpca?=
 =?us-ascii?Q?F9TcBr3cvY/qDUfxBhNeKiM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b189c5-2338-46e5-6c0d-08dd7aedb9b6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 00:45:59.9325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jt0shEmq/X/o3P+nxnrwpKz619oaUZ3kV8tduABoGUL8UJQNQnwLR62VNNIfgF8ZDWU9//cus5+gXGi346XvGxxDvKRYavII/5XSy6cmb9HADL7iT/4ihwYfcVw8XeT4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12910

Current graph_util_parse_dai() has 2 issue for dlc->xxx handling.

1) dlc->xxx might be filled if snd_soc_get_dai_via_args() (A) works.
   In such case it will fill dlc->xxx first (B), and detect error
   after that (C). We need to fill dlc->xxx in success case only.

(A)	dai = snd_soc_get_dai_via_args(&args);
	if (dai) {
		ret = -ENOMEM;
 ^		dlc->of_node  = ...
(B)		dlc->dai_name = ...
 v		dlc->dai_args = ...
(C)		if (!dlc->dai_args)
			goto end;
		...
	}

2) graph_util_parse_dai() itself has 2 patterns (X)(Y) to fill dlc->xxx.
   Both case, we need to call of_node_put(node) (Z) in error case, but we
   are calling it only in (Y) case.

	int graph_util_parse_dai(...)
	{
		...
		dai = snd_soc_get_dai_via_args(&args);
		if (dai) {
			...
 ^			dlc->of_node  = ...
(X)			dlc->dai_name = ...
 v			dlc->dai_args = ...
			...
		}
		...
(Y)		ret = snd_soc_get_dlc(&args, dlc);
		if (ret < 0) {
(Z)			of_node_put(node);
			...
		}
		...
	}

This patch fixup both case. Make it easy to understand, update
lavel "end" to "err", too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- rebased to latest asoc/for-6.16

 sound/soc/generic/simple-card-utils.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a1ccc300e68c..a26487dca764 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1119,12 +1119,16 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	args.np = ep;
 	dai = snd_soc_get_dai_via_args(&args);
 	if (dai) {
+		const char *dai_name = snd_soc_dai_name_get(dai);
+		const struct of_phandle_args *dai_args = snd_soc_copy_dai_args(dev, &args);
+
 		ret = -ENOMEM;
+		if (!dai_args)
+			goto err;
+
 		dlc->of_node  = node;
-		dlc->dai_name = snd_soc_dai_name_get(dai);
-		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
-		if (!dlc->dai_args)
-			goto end;
+		dlc->dai_name = dai_name;
+		dlc->dai_args = dai_args;
 
 		goto parse_dai_end;
 	}
@@ -1154,16 +1158,17 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	 *    if he unbinded CPU or Codec.
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
-	if (ret < 0) {
-		of_node_put(node);
-		goto end;
-	}
+	if (ret < 0)
+		goto err;
 
 parse_dai_end:
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
 	ret = 0;
-end:
+err:
+	if (ret < 0)
+		of_node_put(node);
+
 	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_dai);
-- 
2.43.0

