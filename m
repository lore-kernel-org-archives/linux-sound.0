Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0004A31354F;
	Mon, 13 Apr 2026 10:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776077437; cv=fail; b=ivBfWm3CFzOiWqNoBXoem6kIWxnK3jrGIwV3zmOf4eiWCugzAm5p0SiEGD4QZy/Ha/GMmLzhq8ECYC/2T1aICEoYBdrfpo5ZIbR52y/pMmWC7lbYdK7FLV4LgJY1hIxgRBtPWra+NzAoLNucEOGbm/8hmo+48ef41AIXZlJCjAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776077437; c=relaxed/simple;
	bh=tryoQ4TvoNaVyXC/ado7JHEKUoMKik3IXnD6bgrCl+I=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=MdBSN41HSNye55PNTfvep2U/Byg5Xq/z5BM8BnPca1EKxhoz/Od+8nYg+2ArEbfQAGcTKijzKEessCOwpdPXVZExW2Mv2Q9af4ggeS5sq1SfEWyLRMOQtZZ67zwya0GuYAw4t+xNgvG76cE2Jf8eB66HplBl6UFXEI+trB46tac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aFB3WLln; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aFB3WLln"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy/tyuPOvaQieD3TfYDXaMXsEH7W+LV64ERoN4W1t4oJjdCJjvyxzHEiYFTmmYeqBayiMZ13ZdMNXnhCGIDolXShnLqZXMgQe6foNnjZq9iNKjL1edLj1k+1VDQ+PunLCggPtj1TgrajYTU3fZoOdh0gLhnuCTsfjyi43kU5XmbU0SdXOjMHHlifS20Rma7gl6/TP7cUBEgFHeEtaNdYsBwQzqRRccfZqaHOnpRVcLDBLjfogNKxN4FzNielIC73nxmRnSlXt90p9hOogb1xC13+FqgpZHZkd3mJ0H+2meAx0//0P48OFNQER0J2AoRevOrwjaGNKj8j4yct12iwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oeKvpLoIwX0D2jORLmERdw0ELrxuo/MOedWUT29oW8=;
 b=hEZMp3x6xHKJmzwl7gvXJxhSvltEVDcwgqWSGeWrfqKeC7kuZOxCqAX0NNmH+wNqPcsHuk/AolzkUmXEGnXtl5KPSJNtD+fcLv0KGIBL2dI0UDuBdyLkEvieCTEVhCAbjpYicOHyux9h2ZVTToXq2Gsvs76t6MiQgTLetvv4K/R6jSx9c/DtIACjo8LNiZDHWWOLrwqYqkmonoC23vfsuCFfv8LpG0EtlkdYg/j4OMdEih9NjdkQRprk+I0nfvVrrdU9TnA3DZ5cYxPR4XRrRTRcTh9gPWp3cQVEjo0HNjCnCoY1EXsLrNy98mkwGOCmhRGNJjdHOTM+A0mH2GumTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oeKvpLoIwX0D2jORLmERdw0ELrxuo/MOedWUT29oW8=;
 b=aFB3WLlnwKJwpb3vKC1qv9v7ziSkQgEu5/twRFHoo/A6Op5HTIrpcjazX0iDGHmJCzs7vYA8bCeZ9kP8J3e9xfFliqx+hz0ba2BKutbi0kj+uZvF+fjUafcPeYYC0nAIslmj/yY5vV254BuqEjE7OcCcq9/pzJUc4exBMqXI5rGLc51I1U0G81EHGads8bSl0gl/4Lac+3G75UEQl8khUCACzuXz6ZZT/dUnfvgypK958dt0nReUSMZyyt608XUjFiF+hwws9+o+DyehckcXeh0UuDCBCIWRUTDeVE7W28pZz6GTeaWmU/GjEATciW/S1w3a2GjNA6gAcMfdhAHWiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DU4PR04MB12276.eurprd04.prod.outlook.com (2603:10a6:10:629::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 10:50:32 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 10:50:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 Apr 2026 18:52:43 +0800
Subject: [PATCH] ASoC: pxa2xx-ac97: fix error handling for reset GPIO
 descriptor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-ac97-v1-1-b44b9e084307@nxp.com>
X-B4-Tracking: v=1; b=H4sIAPrK3GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nj3cRkS3NdC2MjI5NEE5PUFGNzJaDSgqLUtMwKsDHRsbW1AHTjAWB
 WAAAA
X-Change-ID: 20260413-ac97-83224a44ed37
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DU4PR04MB12276:EE_
X-MS-Office365-Filtering-Correlation-Id: ce0442f4-a3ac-4238-2655-08de994a7c38
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	dth3sF6EBJTeCHFUMEKmXaraHmHF+6LMUJONKuvjjObPiV7omVKrwQJNfbWhiCZNp3oLPBFwuNOHx0ayI2yOpIXb9Frxgxr6QwuHsZ7FZn4r/P3WDfSL6GkYEmwYCCPeaU0TMNFJgsItAi9VsSk673XN/Tet1vkXw9hJpsvNG+XnRh8Eh9fK6nTvrTWTBsdZ5gQMQHp6hAAJbRAxlCKVIbTrDzVE2pMarUCcePIVbg3e63tKS6hRIaCpcVdTDkLecivgqHew+5muA090oGFDCPbLjvoxeifmzyri2owYMvKWflZ5JoRz53kKYTxzY4CiQI0JYuPAHa7eaLUvUEaHY31q50j9ChWNz2zSwnJRIDhn6RWTF0viH25ie738iiMb4/qhwfwe5jlEq4JTzoSTeifM9Sr/7JnoBjtYd92MoAVUdfsKgP758BncmkGh7YmYpMR31TENs7wk6485PEWrS+dwn3x/5PLY+WHbop8dgrKAybP2sTSFtfXzXjNcHsGdoFKIKq7LJYJCG65N2g+DwU0MJ9ZdkIC8I578pC3srXedtehbKTF4IDVu0FiYRDtk9rIFL8enqVOpC2vjT/CkedgWdX9L4mf/atVWvM0C/GnLwzpiq3oo6G0O40t2JgaKxI/2aufHgXNIXNrBNJhPMZQ7vP4sidzPWcStxGNxSzkuTGit0IPss5BW9kk1/uwUWzhjeIxhrFI/rb29My+e0bBDODL2jQgB9OtOKY2d8hR9tk/dqNLEcIjyuqGHQt1YmHqZOROsNG/gNNSxTgmrcNcG4I1jUtU3FWHm/ivsMGyfTX4ZpOhIQWncvedD2T9zkq+rGc34LSthkTd3F9Xb1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVlENk1hZmRZZFhiaUtZTEg3cTNjNHN6R2hUTlRlM0pSOWVnbC80ajFaNVJa?=
 =?utf-8?B?a1FnWDVuVHhoMGFhMHZRSUF2a3oxTFVlSGVVa0VJaklQMUdzK2VLK2N2bnln?=
 =?utf-8?B?LzdZOHpmYUFkUyswZkhMdHY1RkdhRzZKMU5rM1ErY295MkZweXdCRElTcjlX?=
 =?utf-8?B?Q0pkT1VWSEd0TGpEeDBQRFlYKzBKTHRoZmJSRFBpdHhQRU9uVjhhUVVsbmZt?=
 =?utf-8?B?RjA1V0h5WDVaaWFmam1EUUFEN3JLZkJVTDBYYVV3cW5vaTNlYXFaVEtsSEhT?=
 =?utf-8?B?Y3FKbG1jTzJlZzArUWQ2T3Zmdy9lTXAzRmV1OERvOEpjdHpubFdXbjJPZDJo?=
 =?utf-8?B?eTlUL1R2Y1VCNUFoUkRSc1BFdDBhMnJmTWphOCs0VGpwZ2xmQVlnc2M2dXJw?=
 =?utf-8?B?ZGtwVmd4ckhuOFJWK2lmZkkwajdxc1Z0NllYcy81aVFvZ2lFTUFrUXlrK0Jn?=
 =?utf-8?B?aUM3aHE4S1B4YnF4WmtJYmtkejNva2ZzMms0QmhldUNJTlBXZmF6YmVnc242?=
 =?utf-8?B?Z0t4WEczS3lVZ3J4RTJzVXNSOU1RL0NkeG5sOXAxYVRBejZ0bnJYbUdwdldF?=
 =?utf-8?B?TzZkMlM0U3o3dWNTYy9yL2FITEM4NDhOMURiSUxaM3k4d3JQUjhPaWMvdldR?=
 =?utf-8?B?YzZFQ3NMa3docXpIdXhUdkFTNFUwQ3dreHBicE84emJnQnMvVjNKVWxTN3J5?=
 =?utf-8?B?blRoNUlvM3FtTWVMckFPeDN2dVEwY1NvUWZzQkNKR0ZzQ0RKRTRibHJuYjlu?=
 =?utf-8?B?VkdId3hLOGt1K0JTSHlBYk1PSktuS1pqS0ZaeFoyTXlLeUM4VnVhWFYraEhJ?=
 =?utf-8?B?WlBSUFUvdmI4WXlVbSs2ODgzS3pQLzE3Wk5XTG04bytNL0FheDlDOWNhdGht?=
 =?utf-8?B?bXgvTFJkM0pwRGJpbkZ3ckNMS08rbTdmdmVWUmtKL3ZHOUNJWlpCRnBJR1Iw?=
 =?utf-8?B?RjJJL0NlMWU3WHNEMnVHYlUySWw1VnZ2bCtrOUw5WmE3NHZYcjgrRnU3cXhW?=
 =?utf-8?B?SGRVajlXRjQwM1VNODJ6Z2xNd1d3b1BxVTJWc1BYSFBKOWNQKzVNR2hNMUZV?=
 =?utf-8?B?emJoUFBDUFdaTUJ3ZTNsbFExNENWWW5BV3Jrc2dJWmNmTy84eTNUR1grZVEr?=
 =?utf-8?B?Sks1NXRQN0tjVFg0dXlsMHErR1JUN1ErclZRT1lNcGFabWNIYW1Eak14TFhp?=
 =?utf-8?B?ejdOSUdsV25mbWZ5OUN0ZnpGM2pOVHA5ZXFQWEtHVEQwQ1RrVnJBYlBMbTJ1?=
 =?utf-8?B?NnVXR2o4Z000cjd5YzNrSXlqbTlQM0srYWZsUzlsTjJKUWFPaXVEeklXWTY3?=
 =?utf-8?B?WFlTaDg1a2FrY1lpdTNkTGt3cmhDWEJRNkhHcjlhU2ROTEF5Mm41a2JnbVha?=
 =?utf-8?B?TVVYdS9EeHg2aEZiTGxBWTB3Sk1uZE4rWXFDelhJYURhaDJvcHFCSHNpVHRa?=
 =?utf-8?B?UHYvZUQyRyszTTBIWm9RQ01RR0pRNnZ2YU1BeERDRXN0Q0FobEU1T1NIYXdR?=
 =?utf-8?B?OUVCM2UrcWpMMTdZcDJYdmMrOFNXNm82c2FEckRZdkhqUTI1REwwQTE1WVlI?=
 =?utf-8?B?Qk8xL0VxcCttREx5WGpRNEoyUkY4QStRRFdaYVhFK3ZnL29lQmlnVzgvUXdz?=
 =?utf-8?B?d3hNditiWkxZZlNkUzhuWSsvbkt2QVZiM2FaeW0yU2VHSkR5S3NpWU9ESW9k?=
 =?utf-8?B?NzcvWk1MckhJTktqb0MzcnpZVngyNUdMaXJaZVU4OStPRGs3MHA4SUJrL2xV?=
 =?utf-8?B?VXlSaStSVHl1cGN0aElZVyt5R0ZUV3ZOQW0rcWJWM1ZTRTBXOGJORDBTRDN0?=
 =?utf-8?B?cW1sdGRkZmxyUkV4dXE1NzJ5QWpVaGxlbkp2Uzk4QkJHQjVFRmFBOTJDZkhI?=
 =?utf-8?B?cm1pNmRVb1VGWU1NM21kM0hTMmtJdnY1MWRTMi90MVVjVExjZkFXMkJsRmFI?=
 =?utf-8?B?T0RnejJTNTdOOWJ3cmd2OG1RNmo5NE9SYWp5Q0t4VnFDZXNCSGFLem9VNytH?=
 =?utf-8?B?YnZFOVNjcUEvbStxNmhYandxNmJadWRXeFN2Z3c2NVpnWE5RKzNIMk1VUTFO?=
 =?utf-8?B?bFViY3FFZFR5dVk3NjBlWFh6K2M0MnF5WmozN0ZoQ25Zb3kzZ2xZdVRPVzYr?=
 =?utf-8?B?UjJROEdyZ2tNQ1BsdDdFNG9zd00wamlia1BDZ0Q5UG5EbFJmZ05qeWtCWFFM?=
 =?utf-8?B?VlNxT1lMbWFya3cya3FldmtUNVJHc3B2c1k3bTdsUVF5QVRtaktYcVlmMVQv?=
 =?utf-8?B?L1FTaFNqMHJWdmZsQnpyVlpTUDVxb1RaUGVmdlZKeE05ekN5emZJbjBNamNm?=
 =?utf-8?B?SlRuc3F4V0FOWTlrRFJ6a3oxVjlxZFd4YkNEV3dodTQ4SWlhQnRmQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0442f4-a3ac-4238-2655-08de994a7c38
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 10:50:32.6685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2E1j0cSrVSEl9UpnMirYItQWz0uTLyVG3OyK/gKpGkoE504gYwgTyn78NWT6IV34ILtB3rGGGSyUApkYoX6Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12276

From: Peng Fan <peng.fan@nxp.com>

The reset GPIO obtained via devm_gpiod_get() may return an ERR_PTR()
when the GPIO is missing or an error occurs. The current code
unconditionally assigns PTR_ERR() to ret and later dereferences
rst_gpio via desc_to_gpio(), which is incorrect when rst_gpio is an
error pointer.

Rework the logic to first check IS_ERR(rst_gpio) before converting the
descriptor. Handle -ENOENT by disabling reset GPIO support, and return
other errors to the caller as expected.

Fixes: c76d50b71e89 ("ASoC: ac97: Convert to GPIO descriptors")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202604041426.i2C1xqHk-lkp@intel.com/
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/arm/pxa2xx-ac97-lib.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 1e114dbcf93c94ef30b7b81c40ef9aa30d1271ff..79eb557d4942f19df843d057bfcc0cddb28cf4d8 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -331,12 +331,15 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 	if (dev->dev.of_node) {
 		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
 		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
-		ret = PTR_ERR(rst_gpio);
-		if (ret == -ENOENT)
-			reset_gpio = -1;
-		else if (ret)
-			return ret;
-		reset_gpio = desc_to_gpio(rst_gpio);
+		if (IS_ERR(rst_gpio)) {
+			ret = PTR_ERR(rst_gpio);
+			if (ret == -ENOENT)
+				reset_gpio = -1;
+			else if (ret)
+				return ret;
+		} else {
+			reset_gpio = desc_to_gpio(rst_gpio);
+		}
 	} else {
 		if (cpu_is_pxa27x())
 			reset_gpio = 113;

---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260413-ac97-83224a44ed37

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

