Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3481991BF
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533886; cv=fail; b=jzPXsyte+AgSr/gZX7aBWqNAGmaLg26J5973RA/eQhfjtLMkbA1CMt3+bCna5/XZGc0BR1sSh4qBWUvr2HXjnhSnFhBGIjsr6q3YuKcCOq/zqswwuwFQmxyWw2i+XTX08teuD4vskClfrbupFzSnFh74LrsJAkZm2k+hVPq5Bx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533886; c=relaxed/simple;
	bh=9AWlZc1/gzOBtZ7ninEngasfWcUrCbZAyaY62oD0n2Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=e+AxZgfns2fh0AQl5ZSTrZ7TKMQ2ZN7hvX6iJ9dHPoa12tBUJxKOYzSpCMEq0Zrt1GNVJwUYO2PbtAX5G7HFthX0HgoUoH9L+zbQnxkU6gTxtRv0hiIS0SBc8ARL9OauAcY+urxqtZvJmjbLPCtIVUpQMR/Lo0tuEoWl+AzyZZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=c7w/3ZHa; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="c7w/3ZHa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UArSfrCqO0q1lu6LkEEWFjB6cpWknYoohjCjnPM5LMayl6NZT0yAiFlcyY/16miQGxlhcwsvPCrsHcisaSw0W5zreTsZq3559qgNkccqtaatgcgvNDx/qtf7sFCIvXP1//MzTyXsHmjWc9PG7JB6kfE+C4QFAII8GcZzVlHUnieWLLIgn2RWqJykuV4522O8dEHiuyK5lwwK5AxDT5YvjW2k+wrbHAXLAIOiMJ+jSuHm5WOIqcRvxQbTX70aFZFVRjhyFaTbwwjeJdCpYEkMICZXDgymxcLn7WPVsT51xRg760+C2ZKGB3BuC044FaQdkE0xMm5uwL0hBoD/I+0aGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGNo0sGkdmok8ZdVpBr1L28YkLo8MH49zf//LgaMHPQ=;
 b=tRpUKxUhG9BzhAVmctzX4KFbVPDHLIdUpR+sOscaX3HhwUZTN92phpe96DphPhRNgUJLSQ6U2XzbftM0Lc7gGrcY9Ili2BIlE7uNNaKRoVy/o1CBfhtijAVY8EuMzwpLvytyPhkXwtiSgMNcrzP2k2yrm1DRe0TjlVuTI1EUrCaFqtdZBIW/6oHD7sEW8BmIbo1yTKevpAebUQKdChk3EOa2IQkdX9i0AkcBqM+hnJM/0QxyOzajgsDtVzNA9V9WUM7L4pXWqAh6HqlP9UPae2Z/2cHsJ4MUIw3y/CDWRLOXZrCFeOY4RvmgXWlkw61g4V7qZBCxsyMLDt1ocYKzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGNo0sGkdmok8ZdVpBr1L28YkLo8MH49zf//LgaMHPQ=;
 b=c7w/3ZHa4x9KMx62KTqPRIpjYl1rSMosQRotGz20rcUmWN6yFD2kbbBWt70bedmyIZONdwLWxyye0bhCByJ5KuSCaKbReGBtloRtK2IU1OR/8I5RtXgkK+KyXSDHzXOwlZ8KF7iccQxWQzXEqOE1MhfcQl964lC/CY4e1+/NNLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:01 +0000
Message-ID: <87cyf5a3k7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 127/157] ASoC: samsung: arndale: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:00 +0000
X-ClientProxiedBy: TYCP286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e15fe65-e97e-4ecc-161e-08dd560634af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RgcZWaiOVAUjDXYawvEGyvLEkngz8Ru6OtTfogW/1yjQTlzbbcNKIv4qOsaV?=
 =?us-ascii?Q?imalzovx36mp3Oblj8yRb3hRI+TpK+0D5813VBN5iMHhg2+8HqNot2VA93TO?=
 =?us-ascii?Q?E4vCdfPcwtuPxX2fALN4NWJ89dKGLqoGi6fH/pQhYu+o217PZpXZzR3Nzkw3?=
 =?us-ascii?Q?M+IjBxEdsvFvOHVJE2wM6P302Bedcg2vVB/0gQpLW8NIGS/5iUYpQZQ3Iy3g?=
 =?us-ascii?Q?m/HwVLwhnZc65AGz8zm/E8v1dJmaV7Zanx6Cj8dygLfqP0PHsIwVSLAWcqiN?=
 =?us-ascii?Q?Eh5hXnWGzZZOFtYV0O/ugAoSehYByq+VOdOpQ29oWISjE36OIWxq3FsoBFHL?=
 =?us-ascii?Q?7F4zdGyI+RGFzk+M2mXbW/nSKs+mw4V3DST1k+h6y2XWrtV3yE5lVer8SbTw?=
 =?us-ascii?Q?GTuNhxfp7SGOL6Fvm4ywP1/ikL8FMhRE7yDCa7rOj6jq32ghJlGUvUgxLFXr?=
 =?us-ascii?Q?DGCJ34clFMt5QEd4f6Pj3dR0X4S4Vp1FXv129VQFEpJHSjtwq0oAysHj5qjg?=
 =?us-ascii?Q?f43LajS7lf36D4i1Sn9phkM9+nBQr1OPwY1gL2VDkk9XqTm9LU/d7tMEtj/v?=
 =?us-ascii?Q?F6KmArrrJRHFyXR4jYVCbDUTYUQy/M+tiGlJGzGtLduBkv/kDldxfY4jkyr6?=
 =?us-ascii?Q?5AzaakqFMXb9LJC8s+K4LggBzL2jIVAYNXg3QHoX3ottFV5hqJONjNk9ui+T?=
 =?us-ascii?Q?lZsOCAhEJkvEWSQac7satYmRA3i4HiMk3MNBsoNYDiucUs6mNUWAlEPgy3U3?=
 =?us-ascii?Q?VElHk4cD9xEBs3GqKA3y9xnU4X1tyss9AavihTd0+f1napgGAcpmdE23iXn/?=
 =?us-ascii?Q?TJlyEukLUcT/KXhGymG0oA36k6wdKjb7nOOHYJ09M5LhNk7Z6lRsghwDgEr9?=
 =?us-ascii?Q?+o23Cu6OWSrFQ/X/VsHz/Cfa15JLLPfOzorbWKea1mUmHvNnxCRW8zVJHAWO?=
 =?us-ascii?Q?08HhtU/82rjIPUpjbFsR8Ce0Yspjz5wbedeXEltBkjUApUx+T+UHXSoppRhv?=
 =?us-ascii?Q?Kolbq8AEj/K6RDqHleSMILOBZxUWvNUiBVfsVHAia48SiW8s4BKmcYLJAooO?=
 =?us-ascii?Q?gPiy/epACvFeFTmrFRj11RmYv2+58Az1rCuXDql28PU/kwje2o27O/FB4X+Z?=
 =?us-ascii?Q?wnl6wQiiqyCgTk12BU56fF9JgxITbUOAAbdl8tQKVDhsgchuE4na+m9SEbRq?=
 =?us-ascii?Q?Y8gCOqfRKxl2ZKB+kuo/ktqVOsHiFpqqz12JAz6HZsK8SJz+J0RV0ZluEcgX?=
 =?us-ascii?Q?OgFMiJSFqORypgFvA/t2qYaFyZMTB7gJBnn9P3N2KyOll9u+8IMcpXMTj9vd?=
 =?us-ascii?Q?nc4rj0/pxXr08yfvcHfryyKFP/tn7LLvGdSZGTK6Be5hOAjcKLGT4LpKIZ5L?=
 =?us-ascii?Q?B6LsT/PNUTI8eZTl1JsLzv9KHUXRmJrVqWI26bqx5fL3yoX55pwF1sXr3KzE?=
 =?us-ascii?Q?h6O6hIPDqopqKCv8s5YpqZPbCUcxOP1L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lx2GmvvSGScRiB44NzhenA3GTUY3QN8bvz4MQBDfEjngYVTAAmGV6xWhAFRB?=
 =?us-ascii?Q?OSYzK8nSwrb4WzR+CNMYXlAqAja2FItlFLENavLvD+azArjIXnj+0Wic3+F2?=
 =?us-ascii?Q?xvhCCYy7KDd1CvsLVMG+yJWRR75I6taZCMvxKBRDUWsLJwnXc0+uDoCVxrJV?=
 =?us-ascii?Q?SO4Qsd1IrJ4PE/vfCzGes4aQ1ocMEZxl3Tt/fdwH9X+WK/C9WL5mDB6wjDkh?=
 =?us-ascii?Q?+HUqdsfQSiRgXx0rSL203MC0Uhzn5GtjFwQ4yuaKj8BYYwEv/VtUleS2khuJ?=
 =?us-ascii?Q?VkX2XvGaJHbytzIvuicdv6ejhbl2USkIaRU4Ip/9kYFwCUN6OVW1sOBxtqnP?=
 =?us-ascii?Q?8cyPYq+CnSwt4OW2g5WJzVTob13gDQXRiBp9bL8d2YO/xhl+unHFrZoT2WOq?=
 =?us-ascii?Q?+xBY9G3kxgMRPLtbtifmVM7VtKiaTfFsttG7QjAiSahA9dwEMQqJl8dVCEQo?=
 =?us-ascii?Q?27ShtKSW5UD4sqfyCC0kvc19xF19+iYnU/Me278ozHZ/ekuGCFAPcODbqFC/?=
 =?us-ascii?Q?Jwpp0Kx5TTfkqtldeFlP591ReeOpxUeQtorJu+2TYPL2TvBCXVsgGKovpMN9?=
 =?us-ascii?Q?eZA3H4sqCUQvamfkLotOHs7DZ9i15gH8NugdXwRR1UvGakZxrHzsiIcIJaEk?=
 =?us-ascii?Q?HJj7zwSsWcOHzpAzhCmfN6W8aNOdbEOP+3T/O6iwjItTj+/I93VeDMRqcVA2?=
 =?us-ascii?Q?zZPYjGkZI51G0DAOL2/DJPzxhqDvEx105LTjQAvF89WOT9jlZPxxISxQgeWC?=
 =?us-ascii?Q?MYnf+qIYQD/4oviZhkPeSfk3AMBHJhpc55dJGtPZC7bb9ij+F0Kz47Gc5iH6?=
 =?us-ascii?Q?D93pFxs8RRAuN5ROKrBQiDLl5YfcSM/myA+hhBBNguaYuIT27lhBFYGEz/Xd?=
 =?us-ascii?Q?gT1zCOa89tI1awQ8eZ11Vsa1URfwdloZKf1EU1aSmDFrFvP/LspR6Rh+gWH+?=
 =?us-ascii?Q?CHrFbmbBa6aZROB1XfWmMCuLWK0PVIQEbv7J0xGpFeFqKLxhuOu8pNs6q24N?=
 =?us-ascii?Q?k+ZSPS+zcH3tTvJ/HevTs102jabUwEB7pH38ubseouMzKXdAfKcclJvBFRAC?=
 =?us-ascii?Q?HR8DHcLnXPApTfBaanWG8BUxmXRLQA093nreRhg0ag9mGbBfScE8cpBRSFwR?=
 =?us-ascii?Q?ugCdWyP2kPWT6gykb6HroL2b4qjpd3MG9P4/1odskl/IJGgEDX0gj30Uwoy9?=
 =?us-ascii?Q?3Osh1wqTlKo27x5qAJHRmrRvH46wLfRJASIqpUXf4Bw0IaZv/EFs80ex9YhN?=
 =?us-ascii?Q?/9gT0sCiWtcL4Gw058t3a1d04OAwUKhpGsgZRVC37J90akimNM8HMQCV6Pzp?=
 =?us-ascii?Q?nO8+2RtpzyKqy5ZqFzEuMpGMZA4KoZGRdbaZuBxMUA/amQCNjeRkTnhMcYXJ?=
 =?us-ascii?Q?EU+p5OWA5iesagCK7ENDSz7BryTLkBxupaPCVZiWx32vEKC0nY5bYdrCjEr+?=
 =?us-ascii?Q?YVQ+HSD2Pxusu7XZ/8HfyI9tjDRA/Hm4NBprT8IBpHai5EJXynLpfRoi92U/?=
 =?us-ascii?Q?QNxluoav4ba18Ygxf0gURNsui28MkFuYaTwEKmXmZDYMnBFdSy9yDKj2qQoW?=
 =?us-ascii?Q?IkPefwF3ayFX9Q4oN8VG8iqIJo2AgfAvz79q7UBVaAi1eHhlGIGtoab8CRCd?=
 =?us-ascii?Q?c3qWM1MbmgYVff1QEy++ZDw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e15fe65-e97e-4ecc-161e-08dd560634af
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:01.1953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agSr5IKiv/ImzKUwIf1qhdV4T7hgeu8mz3UnNQbuCUg+zIluaajfJjp7INO1iNAJmFhgK1LnTu5vOeCSk3qcFUZe4jWeexC30QQX5DULjmlDWBZBR40kSlna7UWiN7SM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/arndale.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/arndale.c b/sound/soc/samsung/arndale.c
index 9619f550608c..172943bb3b24 100644
--- a/sound/soc/samsung/arndale.c
+++ b/sound/soc/samsung/arndale.c
@@ -95,7 +95,7 @@ static struct snd_soc_dai_link arndale_rt5631_dai[] = {
 		.stream_name = "Primary",
 		.dai_fmt = SND_SOC_DAIFMT_I2S
 			| SND_SOC_DAIFMT_NB_NF
-			| SND_SOC_DAIFMT_CBS_CFS,
+			| SND_SOC_DAIFMT_CBC_CFC,
 		.ops = &arndale_rt5631_ops,
 		SND_SOC_DAILINK_REG(rt5631_hifi),
 	},
@@ -112,7 +112,7 @@ static struct snd_soc_dai_link arndale_wm1811_dai[] = {
 		.stream_name = "Primary",
 		.dai_fmt = SND_SOC_DAIFMT_I2S
 			| SND_SOC_DAIFMT_NB_NF
-			| SND_SOC_DAIFMT_CBM_CFM,
+			| SND_SOC_DAIFMT_CBP_CFP,
 		.ops = &arndale_wm1811_ops,
 		SND_SOC_DAILINK_REG(wm1811_hifi),
 	},
-- 
2.43.0

