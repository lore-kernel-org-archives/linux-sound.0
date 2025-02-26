Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DECB19C57C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533872; cv=fail; b=lb4e+V44FqUUfFkPOwf4vT3tMXXdh5v4CtINDJP/t8sKgaMBImmcZ7TOSgG6IEShlpgi8PH64nxQ8Q3LLkF+iVVnoyurtP7fY/1DXQBziJrFibt7hZ8avpTRlUPet6F9NB6ElqFX033IdUFyFuH/Oz8QVm93qCDe98RgC0AWQH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533872; c=relaxed/simple;
	bh=eHTnTnuQU7gyj8neNOgsjgYDyj8J1vumD3e3XqFJOeM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Qp1KqNwU/jADxMikKvjIZxjOT6H/k3Yf26evOBMxEoTVjjd2Lqe/4de0DL+AGJYtLgH9vFXNa7+Vm6rgQs7PF9mIUyt6xfyehfqk6dU4G2lVBUAj0I1xOriTB8aZAwUQ/6h7n080VD/zFYuZUdgp/495100MDHvgmlwyY2usVkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hmdkGur+; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hmdkGur+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohbOjjXkg6Mk9OVBXPG0MqJJfQKYIbZEeu9F86B/fPAxFHp1eKnqaMccf96XLkQdEM4Vfx8g4Zh5sumYYomBHzpUich/LO4FH0IrGqWqLQHtcGuAHocVEmS0tkmefCb7EptvKTyLN2ieWs8BuWI5rqz0WaSA8RRjkhC2l4BqAs+zS4J2gjZcGR7Ev+oXS2rAKhO6aUOXGLRXoARPAz9mYxu9GriJlksaCOiY9TDmuMJQc7hoG5c5oNncbgKimjFZOpgN8YReuqARvj9g6UqqFeMOO1KRw6luWvWZKBvRPgkUWiVlVXnmOx5HjN6dumkXHcapJwRqulr2etN9Cp4wjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfK+MejD5BZ/I5exdy9PXBW7zWkGUT7U/6qqZFOL11M=;
 b=ZFb2hltkZ5wVLKKXZQvv59acRtctbEB1K4jInw9lS/cqtgIPPithjb0aCU467indaMrWvi9Jck6siIXKPWCmnZ30ap1H6HxEv8eyhfBkzJ/E045k2lRx7PAPz1hJzD1UY09UkVNCnjAnn4vbGxTFD4qmm1nvotohXdFnSsWNL/KiUI6xlHTq8Ew+VVvGwbzhLMjWgEpRrIkDXTtAaIIS1mnI7I+6C5G0ayu654+MkC0S5BA6GYl0l0f7/0zDb6bDJ4DYI2QgNR963evL2Q+2lAxO3hDQ88BbOqUv+1JoJq3lbmwFgRVME4/IKQgur616oTzQld47uM4OREp5RP6cBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfK+MejD5BZ/I5exdy9PXBW7zWkGUT7U/6qqZFOL11M=;
 b=hmdkGur+vAgW5wL2W4mNl7MHluStvWdQX9QKAOa7kPV/iVynahndhT2Urx866Z1EXR3+NwEfIhiJrZvkTBjpS9ontNy5SmsRUIl10BoIh4OUdttd+vNnhErjHwNiMxVEgjgsD7iSXlo/2gL1FS/bWwrNwroWXSfweGTqMPIB8vw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:37:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:49 +0000
Message-ID: <87h64ha3ki.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 124/157] ASoC: samsung: snow: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:49 +0000
X-ClientProxiedBy: TYBP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ef2ac5-83c9-4f2c-e04a-08dd56062dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uw9Qu3EOfU/pHSfpUWywtwwmPDZ4JelczFRzQrsSrU1MoDeDw1TqKsINpXgY?=
 =?us-ascii?Q?XuBxsP8M6nixR1SK3/dg45wEGTaLtqkwHx1WThxy8Y5vm8O1Trh8UK0nVfXH?=
 =?us-ascii?Q?j1lfjZbsmzd0rUm12Xn81qA34w/X8xkNYJJKgOZLKGxgzfS48+y8MXZAO2k4?=
 =?us-ascii?Q?hB6nfL1WpeJhszMApI+8CmD9KnkR0aVVTmKTHP0JJ7ppFgob1tJeTxpDYU+Q?=
 =?us-ascii?Q?wGlJU0vnzc7zo/D5MNQQU0LhHp/Wuvk4vnulyaqFRmkTqYhfn6ttIWmAYGdy?=
 =?us-ascii?Q?15zaJBuAvDLi+6t3/l07kfnadeojkhJIljTKJireM0tOz8RDPoCxY1Y8eGre?=
 =?us-ascii?Q?HZmJMhdDx0Qzl7iRoa2mAE9kvTOb8xRpDegn0MPys2BPFUMomVUi29IuP04f?=
 =?us-ascii?Q?x3q7lscScXF2/oYgGPcci7+1MypHd8zyo9z4G40cSp6Zk6dQA/AbDsaNc66t?=
 =?us-ascii?Q?pYRvenZv3bkOQjCM2rupvTYq7tzqrYBBh8BqGcinXqtRhrbIEtpiP+Sso8By?=
 =?us-ascii?Q?UYX1XRw5MBW6LZS+fTUM8gWK+q5zLLXCbeAp8mAvKOwxIXKgbuz1gxZy0haL?=
 =?us-ascii?Q?VQapxh231D2NKpTC64Wu83R6FDH+Tf5CHZMdgOSyv+JY6pBQTnOYQIj05s+a?=
 =?us-ascii?Q?qu9MeMXR9p7D3Y61pOmbIfHu2j+o90L4nTySWofgP5se99BJjdpbP0Hh0+gg?=
 =?us-ascii?Q?sXAZ+eaiO4kSMyOYO0P/vfJc1h479AoQwkW5VWOAkXle77arfOKXH27ZLC+A?=
 =?us-ascii?Q?MuceJYttNGC6ckclZoBbGo5AOVlyWQQ0fOTw29RTF2VAuUIiaBMZeWhIfBdE?=
 =?us-ascii?Q?KxX07CDzbDZ4dH+Y4Yb7wrIL1XiaXbCpJjQs71cjQdwq+ROWJVYmtV7+9Ta9?=
 =?us-ascii?Q?MOAIhCDDT1RZBqiVhiy7UAc5MfMZyH7TBsLPbxvjXQwbfsx52ZJIvJbLTJbk?=
 =?us-ascii?Q?YvV38mdLmnJ030kyXn1i0jz2Agq9SaXOFww210K8VRtUxGBO7wVbWdDk3/xk?=
 =?us-ascii?Q?cTC7nNKxaxYjWNqURJlJKbvcQoUqb6AXtMXiGYL2CnyafyZABzKTdxZae9KV?=
 =?us-ascii?Q?6ly6dJxkYmqZTmc0TbO9rlVPkgImPXY/QOX4LTXqERbbWfQufaxQsAvWmfH/?=
 =?us-ascii?Q?r7t/7KZzUKeeGyC3dG+fEq9nFvy602rpzSonFo3QuUliGPEca3A/rwd/O8Ps?=
 =?us-ascii?Q?CSvqHpD2a1MFamSG6vwRlgIyN4B5HEnxXFfRGmU8redn+ox7t5/ybfdxfDMD?=
 =?us-ascii?Q?p06v/6a9euUbTUzFFCheeKmVtvVPUHkWNeFT3HrVMAaalGxQihiOFAZ47Jpi?=
 =?us-ascii?Q?c6a4O6QmktrBC5vg8p6Itdljaxkrqya3bt8hbuOIgt7E2QPsPxdUqEYCYGj7?=
 =?us-ascii?Q?xRREWc3VzIZioIfiROc5xLgN+cyLlx4TcG2+3UHws+OcfryHTUcoIfNJqF+i?=
 =?us-ascii?Q?hFLk+v4B6tS/dqlUR9KMtGxCu6VPj9GX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cU7EUk6C2p/3nT1MDqnkuWgwlg81BahUEKv5tnr03DOFVG7j0v2SCCfvq9QS?=
 =?us-ascii?Q?uulaL8E2bCyCwabRnLjxuPmL2za1pnpoExhqsTVbw/8hBKxmVMHfle6+x3dP?=
 =?us-ascii?Q?GovEeu8+jYdgheXDiYT/dsZoGdCqgVfrGXmW9LZkRYq+TTICuT79bHl1eDVw?=
 =?us-ascii?Q?bjw7S7EkzLC4Ev6o4CR2gGSqg5s3JV3fuDobfmQuU3O589coODEju1K5NHY8?=
 =?us-ascii?Q?XsCEkftpm5OtwIxHo0AfzVvm6u6LESUoXjJxjrPYwlODJJYzl57hNP4ZLFc7?=
 =?us-ascii?Q?b/Q9fkL2X/hpLVjgvgQ5/Z67gjH4Djm6stNLS5o5hEl8wQ5RFMEbjIbO1rhs?=
 =?us-ascii?Q?o0siXov2EpttnxtroF2DB6BWoOTpnZeHylXXVp7tbJTPYicpL4jb6MZvGvlT?=
 =?us-ascii?Q?NJc28CnkkHOF2mBs6PiTe7ySHBP25LlnZ+rVFqE9B3YfRxhT4odnZZH9kdRf?=
 =?us-ascii?Q?SpW4phvYXkwRohOfFs1XE26SKvemcwqiphdiOfOJAIFWH58MBvuDHYgnIuG/?=
 =?us-ascii?Q?2H3MjgkaUVRL8vm9sAQIJsFksA2PoePTFpac7VZxStjuHJE3cnohys+WS/wA?=
 =?us-ascii?Q?/Kuf/JXCjiXIe4JCyBpiM6yUwIemrH5JRD1N3e0nyKGYLmtjYKy8YLWq99Q+?=
 =?us-ascii?Q?P+Deop4AylVKWGxj5NsBKTI/e2QU2/CbivydED+xyyn1FJc25kY+weNj572d?=
 =?us-ascii?Q?tYciH75LNpvvdngRnnNcrOSQb+bQlIn7lsu6KDozm4quCkoV1RTsHrN3YDTj?=
 =?us-ascii?Q?W/kD0SMJkUQ/vN5OW38Tpp1qOoLijcDqr5MUlVGOB+7fkGqvA0SDLR2c5DAv?=
 =?us-ascii?Q?rb5tKIktRqInNzYnHTYnHqyOqhPKkBYIyI12sAnTyVh5ok0c52IIAvs+PYQr?=
 =?us-ascii?Q?bIC8WaEu5GA3krguTi/pA2fiRFqfoKJgsT5HAn0cfpcom/nd0Gib8tKYyJOZ?=
 =?us-ascii?Q?KhyWsCnr0Jo7f/0vFV7bcACPmIHYasYhDGemeT6mFavUHWOvHMCT17of2gfH?=
 =?us-ascii?Q?sCQMPvG/I+d/fTx5Fhuc1+v5GjfZ9KBOw/iHhCViNyFGkS5q9qMXlozukQsC?=
 =?us-ascii?Q?ipfUgQiHssRswzRmfPORo79bJKLKh94OfbYaHIm6z+mPxojsIUS5ZUXjgPc+?=
 =?us-ascii?Q?W1lQnuCM1oOZUb93RTpTBOI/felalKNdKiYLW/WNEL1X11e7UQkhk9LOyHWe?=
 =?us-ascii?Q?5myjmuQA6iCIhH5R1/DpvHpbH7NCeBZ8cIK8giQxlFhJHT2oMrQXokeGvrYR?=
 =?us-ascii?Q?9L6rIbynvPQRCRiKrY/baEkQPyt+BuML3PKSBtYzyrBeV/dqvxCYyQsQyqOH?=
 =?us-ascii?Q?7j3LXDtaMHp6DqsNi8hcfF+gDrlOQm+4LIbziC6bQYHCE2hHnwf/4DT/tkIp?=
 =?us-ascii?Q?WnfxjVSjx2JSq6Y9k+HPInRc3YfDfGYYzeJPW6qbsi5hPYEY7InEot4E5dmH?=
 =?us-ascii?Q?CjaDKQjIRSwbSddIR5ret6hkN1NX9uaKdcKPgm+t2VLIcat7XyrvxWO1rHrf?=
 =?us-ascii?Q?06L0SPx0BuFWY2K+oL6+ojRQ7gi8QQgbJkGaUb2j1nyTVJHjX3MYFkgyPlUp?=
 =?us-ascii?Q?FJcjh9VmHpeWWRrv39q5dUSUWJ6R+Kq6EKmvRjtNWedDD7SXJbtVNVxD10sW?=
 =?us-ascii?Q?ePpYDoYwcNeA4cbFyFE33E8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ef2ac5-83c9-4f2c-e04a-08dd56062dd1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:49.6281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moCPXITH9YVlr+gCauepl47nka9ZiA9MdZ7XbT9rxTBhJraSi7BQDwPrgXEZ5aRf3UPF+IQecRF9dtc/OrFNPTUuqN7bZbeVakYYf24TcCHXEvtgU+/7FiyKi0niGI2h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/snow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 4bbe7bcdb845..66ef49dff1ba 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -137,7 +137,7 @@ static int snow_probe(struct platform_device *pdev)
 	link = &priv->dai_link;
 
 	link->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS;
+			SND_SOC_DAIFMT_CBC_CFC;
 
 	link->name = "Primary";
 	link->stream_name = link->name;
-- 
2.43.0

