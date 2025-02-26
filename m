Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CF21922E6
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533719; cv=fail; b=TMD2pp0OhNBVbAs7TJiyjy7+2wPv2aYDEc7oP3ELBeQp60gDU37K/Hlufh43pZt1q7cKV3LYNibK++MJvM0w7oK2cy/3CNLco75vDAcvAN9EcQ80p9CG8tlQy/aPBMSJL5RvPNwMbTFag9hp0hLqEQUTnkwIabAKJj+iTi7Gnd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533719; c=relaxed/simple;
	bh=NPCqwTKNOxVtKdv6YJgNrTXj9b2uEER7Ne8Vaeqfjkc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=O5QWqGgYPLAx1HHFRGR3k+d+L/gsILkjwG4g/0ak37a9+S+Q0RSRQgtWimRcr6jLrRGEjOEkEpop+OW0f6jt2YCIQZwQrJXIRCHVzNEcHiFtDWdl3t+B94I/yu8b//ip7w7AcI2xSA8BWMLbbwkABXD77cTexVPM2UbBYB0zHBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K6/sgnjq; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K6/sgnjq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRtqlONEcPxb6qoH6Ji/DLeyp+Y/08s8uJHWFhdbOXQ4dRs4AF4slRxr5a4vup9dIdgJZN0TF1bn9Szb2qbv/0mjWMw39p6vasvHfcE0IUBju2XVOUjeXfPhXTgYoWsmiV3CtMjEaNmGZsK5BwJBCLu9ztcoX+kRFoiGEPQDSh6GwcUYAqY10/F4tLZEo5mzAJ14HRP5L0rMD8lfTo238+XQZ/IR9LH/DXx3i03V57aFnZpqWjtqWkeDkx++Mvfuh4Wx5/xXHdtGGwiNiQU1RL1FuY/7yhygH6q+gaTSlq0nHqFXS2X2lle2zKlpj/fcv/Sd3FNSqWsY8ia2wgesyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjYXA016ImpoUVND/72qHZIsE1Ye/ibMcHhtgHn5mpo=;
 b=rTRu5FXxvyrBOvkcuXOo+T28RIK3rsWGvNUum9Ynt2cVzLCdqAMa9ZWBel6LkG5p7p+Mk2gWW/x5sPOrrJsBjvKdg1t5A+TlWqz2EMTO/4XUUIGkiDMFaAD5jwJUSdrWb2CPiTMg8bn7+rL6eJxTQ/YcT0VKdi8g7m/646cG+toEc0LYbBtkzvUTH7sQgm36OEFXU/xDGeRGJY4VtQsMmXLm1YlU9NLX9qDGgjCps9YZxgQ+f2Wk+zUI42NYHKbwVh4W5qLPwBPC+LxL+w5iVcdwjZ7R+ANpbymFgRG1CnflWbadJh1o7JOPzSDAgW12MERTnRkTVhTKYYrSI+G9eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjYXA016ImpoUVND/72qHZIsE1Ye/ibMcHhtgHn5mpo=;
 b=K6/sgnjqxXWyE9dgDxSevWsAz5fTg9O/jwaVrOyzm6YJ4PszaOet2RQzQTbHU9GbjM2ldpvuDLiilzyANgLvWd77Lt6TxpOkz3o2hCDkzKk7jCRiQrbjKoolPlp2I4Ac3CvmDJcer0B3AnkOQot/xq90d6S2vNU3380op0Sxz9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:14 +0000
Message-ID: <875xkxcwtp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 082/157] ASoC: codec: wm8900: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:14 +0000
X-ClientProxiedBy: TYCP286CA0325.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: d556ed50-e6ee-4ee6-1d52-08dd5605d179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0GH8Td+kJphPmALAW8gp36MZ2/likpulJdCSUC1QruRFnPPqve91CvMwHekN?=
 =?us-ascii?Q?abuG9K/ToDaB3qUJugGOPdTK320z/CrUaZA82kOgQQ/BI7XSNwFpYRz8L+kR?=
 =?us-ascii?Q?t+D9dHjTYmT1gjCeojU9IkCh/hMBIEJua/6xHD9ddbs2L3qcmgIBG4YBLClR?=
 =?us-ascii?Q?ZvDxSwfyvfPkzrpfJosQJPA9frfQesl9+D8QfLfZwMwxavTA2nDhIz7Bk31o?=
 =?us-ascii?Q?WbqSKcBD8qbmxgYUXNni5kcWRO+MDCUa1oP68mBDqjYUFMKwRGFU6aXOvQ17?=
 =?us-ascii?Q?wYSnXM7/IPCJvPzBDzf9wRhJ4hkqQh28k/kjs+I3Ld+dzkx34KwTnDel60Vs?=
 =?us-ascii?Q?AP9UWr5/WesSccNLfc0vBEcC8hXjP8kEVAkK9Hr6/26ZccqUvaN7GRAvFgvF?=
 =?us-ascii?Q?FrpYTOQ88ovy3o4GKxY63LIjpH/o0xHxUtGlKbKAbib+XOry4urgkyJEmAfC?=
 =?us-ascii?Q?5FJyAp7hPq3e2rxpKl4s9rj4TmPZd8W8+XafQzVYnmq6z2d1vnaqkYsvOUM0?=
 =?us-ascii?Q?U+4FS1wv5s992nvEo19blodUp7J4XXIyuEdDeeAGOwLXyxn4r13M6lMmn56+?=
 =?us-ascii?Q?fIaPPA4N3fkD7noZEDzcDBZlQOEmCD2R2zzIlp4fAy6DIVWklTUodJwtk1O2?=
 =?us-ascii?Q?OVoxgFfdcSkWgY6N9Ujmg1Ipxzzzr6n9VBlnpPjLhDNt/tG14BG2f24rUOHG?=
 =?us-ascii?Q?RvC28qNgmyYJPBs7JAGdNBQcmG2hagl9g5Su4m2khJhCsquiwF6Yqu/qWcFm?=
 =?us-ascii?Q?XIUSL2NP2PD9jcuqAmsk2sGP3+AgjlDLxu9jDLiaX4MFdYgs+YHhdOfLd/cs?=
 =?us-ascii?Q?DxAXzNhv5XkU3bcn3qSxq+ZvcjsjWOp6blrh4ZnvqtkNPyu9lYCP4rjN3aUV?=
 =?us-ascii?Q?FqT8O0+9UsGCNwB7Fagc5beV1KtxNCQ17XKpzaHEKsynfKrUyZyUwQBSZpOk?=
 =?us-ascii?Q?qwIW0yrPmtlzoaNfZI2LnQsvSyv7Th4TitRdsFt7EPmtDhj/Lj0a1hJzZfUd?=
 =?us-ascii?Q?YPnbKmB6kV4kBdVJ4qoC+eJGI0rxQZLvJtC5kHp8Z6nFszUBpA/1Q938XWFs?=
 =?us-ascii?Q?K7IBRgz9vv9ZSDJH1XPaid4S05iZljDnvvTzkCmq6BgxvamCr9+GVXW8LTwi?=
 =?us-ascii?Q?MqXxSy1mprttjU6acWcNsBlATsRwZzVtTCzVFt8iaw6y2MOg7s19Cdv6dZX4?=
 =?us-ascii?Q?0f5DM4GJvYi/HRsvIYvBIa9KMD+4SQjZTNiT7Nz8b32cpz0EVXCaJi7uZ9Dv?=
 =?us-ascii?Q?DllkNK7SjeCHZW+eDrx1DagmMaqf1FA5s/vwwqg18BVv+DM6gLlfEXFUAiVB?=
 =?us-ascii?Q?zun68GTtPDFXbo7R1iDmhRXKTUwSkOaB5ZF4HTa0xOXO4k9U3BThZywxHk0h?=
 =?us-ascii?Q?pHVGjiY38GQ9jRbFc7umupYdhRuzP6T5Q2m2dJBEw8g8BswotAPhdAVvvAt2?=
 =?us-ascii?Q?bWBZKrV+eDWHE9ye7kebE/IKJaHs3hY7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YbkB+cbylfGVOiuU1ar0XzxSFXUSmxnDW6BcqUID7H4jFre2dTSbBmnHcjoQ?=
 =?us-ascii?Q?fqQs2UXcZaX9LMUTl0zUBj7XAq+p44LkHS2LDnM9ZQK4EDnVwVq4DvZzGbef?=
 =?us-ascii?Q?hxJB80DhYAJI1ijITpZaAYQzlKE7uT8xXWA+hysp259H865q3zNMIYjYlKej?=
 =?us-ascii?Q?c5rhBW9OEsl4WVSeYUT2pMmBIgm30a4znuIiD0Zf9TEcalK1CguX3rQ76LVH?=
 =?us-ascii?Q?uMX06tE2mSwodthXyr5WLnZZgH9Bg9xfKJb0lV/nAl0mW74xlqngtPHuQyZI?=
 =?us-ascii?Q?QnddmVcUcEhd6zhe2UlqGuAt1JzJjqjN7QEj9BJj+VeXjcApYYa0XmDDqDgr?=
 =?us-ascii?Q?dur6sEe74v4Pwl5Tp7DM9YqvNmbBWM8/Qz5c7CZfl5zSeEnMJI5mDaxOTGAA?=
 =?us-ascii?Q?+8cl1UkSk6/glG2nHX05lT1z2zt8Z4e6MP1vQbR0vcqeq7Dsbfq1vb2Ovg95?=
 =?us-ascii?Q?loUUAiGt8j6Bi43TxaAH9QaB8+slGQipe8yu/SiUXuh4uV9uKyZZTQKm4Yo6?=
 =?us-ascii?Q?MPuORlrFm6y8IZLQ+KdUreAbpOqqbH4bJEqsaC63NQG4F0oePzZOVjSgNIpQ?=
 =?us-ascii?Q?PurX/y7b5pZaJy+LcKYfM1lwLWXsy/3sQF1hCmDS4M1laShbx3fUutRzeXgN?=
 =?us-ascii?Q?jhwvbxmPrTrXhcdvxLLW3ap+eNbuZpIhFeY8eK25oDNL6Lf2uCUCNMjcvpls?=
 =?us-ascii?Q?igzYgdrMzflIjsnW1qIAjTtII30XErXptwiQzL55rdyoWr5xjZwyHNPl1ZgI?=
 =?us-ascii?Q?IWncYa3VrnvtsKZ6q/TcuA7eJl19ptDYWyv2EYZoCjRRFR5q1E15+t+d/LJ7?=
 =?us-ascii?Q?T25BdqtWSs1m0+LU0zkDuJ4JbOoECw2XCGLoVPUDym8hmi9/SJnqvuSqZpZ4?=
 =?us-ascii?Q?g2uxfk81zgQmI/B+xRBjwbIYq+DR4dMaLElxk0CaZV/T5hQquv2T+sY1JNcw?=
 =?us-ascii?Q?nLs+RuzNjxWK626RuQLPsNnK6rrb04ra6/xIy3L8y3KjYQi1Dd5NSjB9ufR5?=
 =?us-ascii?Q?o2LMxsjUJvaYXp/YvMS+c3keNMzpHMogsbGIQQhbFfQQjc/6wW2KYB6CZCTx?=
 =?us-ascii?Q?NpaPjIarDrFUWTTVPHY5HzC/8Mj8O019l3HX+9mhxycifa05qPdjujAAq51N?=
 =?us-ascii?Q?ZrPjL9jEvzMl3QsEHjoNn09JhtaMwdetXiSpnxK94ZKNRXbY+uJbV5TWnLXC?=
 =?us-ascii?Q?IP+Bs83KiFOAyBGqXPUQf3Nfv71Xjfvs0zJ7Dlzj8eEyrGZSGppr4AzsdkmC?=
 =?us-ascii?Q?fAp6ZauhanvHBskj3xRB2NcOlDV4VEVEf6DApiIDT3/gqxyDd8/MTyiq4smI?=
 =?us-ascii?Q?z6gUnRTBh1K8qKNw2/EBLVTpqdUyf9XraaQIuXtooJ24ELRiLMd+QBDjwX8H?=
 =?us-ascii?Q?yP6jVPaMB6aS4mjh07mM0Vje9NY9A/9NXRKaEPxay/PzdCPDJaTjmlHO+dHh?=
 =?us-ascii?Q?Nzkf9TQjbAyYCVALf/UoPR2z+Ba035KA/4KcoQse6zB4ErEVwYpMnvcza0xB?=
 =?us-ascii?Q?SSPA9V9iQpJtCcHNyE88d1LdqJcmf2pQra+0MesIK7rBnUGyGhDQ4nx17wVF?=
 =?us-ascii?Q?cJ9/7rSg4lJ17UVxwYi/EE7UZbjBcnk50I75YMMXdS/rspVzXL1JYLd9+dfO?=
 =?us-ascii?Q?fL3e6Jj2ybfi1YeViJRDdVw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d556ed50-e6ee-4ee6-1d52-08dd5605d179
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:14.6971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JF5hLRJ4N2iNidABZHOiB6/VF5dyEATap7TDOfXiF7nXJZPjpYVTJ+wcs8oVdXL3QnOziRroN0Ml6JVTMaSLfXxxi+6vqmV+KFR+S4kZZrcuCm0tEE0exaaPZWAuYVvH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8900.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index e44fdf97796f..6fb25588ca81 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -867,22 +867,22 @@ static int wm8900_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		clocking1 &= ~WM8900_REG_CLOCKING1_BCLK_DIR;
 		aif3 &= ~WM8900_REG_AUDIO3_ADCLRC_DIR;
 		aif4 &= ~WM8900_REG_AUDIO4_DACLRC_DIR;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		clocking1 &= ~WM8900_REG_CLOCKING1_BCLK_DIR;
 		aif3 |= WM8900_REG_AUDIO3_ADCLRC_DIR;
 		aif4 |= WM8900_REG_AUDIO4_DACLRC_DIR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		clocking1 |= WM8900_REG_CLOCKING1_BCLK_DIR;
 		aif3 |= WM8900_REG_AUDIO3_ADCLRC_DIR;
 		aif4 |= WM8900_REG_AUDIO4_DACLRC_DIR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		clocking1 |= WM8900_REG_CLOCKING1_BCLK_DIR;
 		aif3 &= ~WM8900_REG_AUDIO3_ADCLRC_DIR;
 		aif4 &= ~WM8900_REG_AUDIO4_DACLRC_DIR;
-- 
2.43.0

