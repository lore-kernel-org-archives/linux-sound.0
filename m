Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC0B19F421
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903946; cv=fail; b=OLw32jBE2BuP2q/pWv7dZJNPqZCyz6fbHkDuW/NmsKDDYEDpAQrgy8B41HO5HnMULV8M8vSITQlp/2K1lvbeReXSG7uH0up1LSn9FhCCDjK0IbTGeHPGIFmvjEqrUrQdzMArvsuHHr2I/nO6zjMVqisz7lr2GxUk3jMBMQXlnMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903946; c=relaxed/simple;
	bh=F7iPcf/2cwEZ/uEKt37L+7quhewieVk8vExLRx30YXk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eykpdAhmelxySWSDaza9ANDCrd7cpp5kbmMuXO0p2bKYNTm2MkiNlZR00/l5yfXiC60RkRBIzUEwIwLAsvZNkxT6CRpZcs4Q2fWiAFsaRTffaobW3qJKB82/2fv3r2TJnrw0h6yBj0lqx+qNomTJbYM+xYDzWCDmSBf+Voh5g4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AKCakgzq; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AKCakgzq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0YuVea1S0qHhLwcVhsWaD8HP4VesXAzO54AgydoNSjTUToxS4Jd/+vxtTNulIqDeKcsJ2WasWxPyh3R282ZkfITS+uMwntwhUPgqvHrD5xtZeqYKF3FCSDm4YBfjawjZwXamcGgLUrPJKbXxWt5bTnNQIR6CyGqOqDHfyuppUN1goJTk1sWxf8xusba9ktL0bCy8F+w1Y/fN1pDK6YgcWTN7dK6V/WNAhPwwqKWPr5ZlmkmgUngDrZJxnmGypz3Ful+U0hE/VIrUT08g+2oFkocLnQY9O4K+UXcuD2kjBhIKSWAT4C6d4s6Wtc7fg3uuXKeECt094+0eN1EriRSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4jKxxZqCMuboIJkBBAgoMyBrxtji1SAZwjwsIgVseM=;
 b=f9s9FEnc2GBUjbfocwN6CWtdOCIB+aLa8GkpgA8G3iN9D6pnnAPu6ML2r3kbQNubwdVKMRjrppnfj3ruuvRpqLSF2e7QKuDmhH/aWP/uH+c9nBi/DtTt5KuVApMN63EH2T+v8SrNrtaGXFMHSwDRkh4kII1lSKdkjj10fXP/MfcyhE7HEc9gmQfqfeSmUxAQKPfnDxND3+xCYK0j2XeExYidUepSGlh6Sd5PimpO+CzhSY3EUShe8KbuzaZfqdy/TVsBd5LjiE+0vp6EFe28XWmEIBaM9vGhgfK86T46tErvChlS1XtsC5qsr4ewTft79p+2cCt5W0+xR1tE9meuRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4jKxxZqCMuboIJkBBAgoMyBrxtji1SAZwjwsIgVseM=;
 b=AKCakgzq+y/PvLJkq4unRJ7pdyFc7iPAt3JVwAK+pF8zG1iAd48lp4BoE/ICudSGFfLuj6ZXck5tsu9zqj+Sg3n5h3eT+DDNi1VLRQsfG7EfqxmNtFnkXcE6pJnt5J+M/0d8Vjlc8xjgZjx3DJop/S25H+HmO6JNkK+JiRYTldk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY4PR01MB13972.jpnprd01.prod.outlook.com
 (2603:1096:405:20a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 02:12:21 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:12:21 +0000
Message-ID: <87v7oj1caj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/11] ASoC: soc-dapm: remove EXPORT_SYMBOL_GPL() from unneeded function
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:12:20 +0000
X-ClientProxiedBy: TYAPR01CA0231.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::27) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY4PR01MB13972:EE_
X-MS-Office365-Filtering-Correlation-Id: 9322d436-d44a-405a-9d63-08ddb456e220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jovcVVu1GoJmcE4Pze/BqanHTv5yRJT8f/04vm0QimllJhaZ0tWMJX05bG4P?=
 =?us-ascii?Q?R7y7jLteYvCEwO++q3uV9OOf8E4G2G7SRUJB/pwy62cBqpG3pX7V9E90jVKy?=
 =?us-ascii?Q?RUh5c1W2fxC6r+E6x6qbS3QsA+uwrG2UgOYx4/fnM5NXP1YB11AXEp1Liv+s?=
 =?us-ascii?Q?yQH+0Fnu+20TKRtCGuObUVjJPHidMfeWZxxpvlAoa8LZy/ygW5sekykqFCCy?=
 =?us-ascii?Q?VEdSKZlBX0xb4U2PddFN8sRn2/0Abwle8yN0kjoFhv0eBNJEH/IF0QOpDAOe?=
 =?us-ascii?Q?+HnUp3F/sNIcsRRWnMg9Q/EgemUVcMCev4h/yRCDk7e43lBPH/uYhc/Zx97N?=
 =?us-ascii?Q?CRvWqz+miqtGY37WLytvRoGy1Lay3EfQAkii5g4EwzBvKPWJsbmqP5Jzw7T7?=
 =?us-ascii?Q?TqGRb4cgxxI3LtgnC+JwFKx64gtHCiqVVmcgL94moPG5mpVPyMCA5MA96FY8?=
 =?us-ascii?Q?+JLdRjJxzfdq93ddp3UQVo5jGN2IvzNDEUfBfz2MB8YtMB2VVXNM3MmljCHs?=
 =?us-ascii?Q?G6WKqeMGqJHViiKFEV3nUNPn3ofnCtI/Kwize7YFQW6JYyl8kUHDSR3f8xTN?=
 =?us-ascii?Q?0iygFWeX31XEqzyIp+M4zxtc7bRI3m9tw54dVwQh0z8SlpI9hJpqBBdt4gYc?=
 =?us-ascii?Q?35W5ljSoOeQ67FGn3yqwX61Us+vOOOaYTZcuKXITlq4eWQHwbNrNrfsgUt/4?=
 =?us-ascii?Q?YYKTstlapMOCQgHwPRgzqte5gTVbSlHoRwzDnwXwpk7IeC5CovmPxn86c6QG?=
 =?us-ascii?Q?sNOXuS6wPLZGrFYlNPHrT08O1c2zA6inm84e+rJ7RBzHLwz64MsfcOPV3ECc?=
 =?us-ascii?Q?LHqPYZYRkw3JkOxuzslWydA5wYQzlhWrJ/e2vu/Q/IOATuxMJ+JSZdL3Mqb+?=
 =?us-ascii?Q?hqR97Mj8W7v5JZRyAmixaaaMVStp32taNbhQaGiqyTJCOjaztk4Y+LysLc7L?=
 =?us-ascii?Q?teTgMn5/SVmBlCxhID8JXQZNRsmqWbU0+LtDK3nviojZWJAuCspDRYuWBqkc?=
 =?us-ascii?Q?ZacgkKUxM5k0381T8UrhmSkcQALSycjksmCGyq4bBVUIgzH3KPUNUDsd+EEY?=
 =?us-ascii?Q?bPyuHRy0EQaNJHKRSRSy930mYfOgb4u2bE09OEvnnT/eaFC85bw92JZRxkyE?=
 =?us-ascii?Q?byFBgB1dd1bTQ157Kh09nCCCTllPU0odB4IR3UDK7UOr7aYzZ/yavpsid+mD?=
 =?us-ascii?Q?tqAVxm6h5itIqvd1eTpbIE7ldWK/go3VFRiNKLRYH9G5hyCskm4g9YAXidBZ?=
 =?us-ascii?Q?j/TOfrZYUrOUueS+gkSGitU26d7laWzHa9W9HtTJp7ZNDtd3+4usgShSsB6i?=
 =?us-ascii?Q?NoqdXDda4Ad2qXZQCvEFU1s4Xb6kNfvVFTpTOTZbdJMcPfynQWpsAH1HY4qc?=
 =?us-ascii?Q?9KZsE8LD7Iv6XiE6x76kSxXt9raEr5IVfcNIGTEbgFTLIAyUl5ffikQS4cwc?=
 =?us-ascii?Q?3bSvvUyWn60XEY3kt5XQob1RyBI+sh2/8KcgNfYgYxY/61LW9Sxs8g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UosKCHWODAseYqC5CyZvi44nRGW9T53PR6/UBrEQKEAESEOnUfHBviGVfdGc?=
 =?us-ascii?Q?ldfVxx0o4UM8x5X+Omv6wlzv8zpkagXPN7uOez9l6/tLhFVi+8Q/WaNHddJv?=
 =?us-ascii?Q?hwSXdINaD8sBf0ze4PJXQgT8cUZ0PFmqWB7CgTT10UGGWlAtp4uWGfqyRFNY?=
 =?us-ascii?Q?7rN85SgEjWTgsqGPxppYDp0DUsCufriAX+iZR3XI6J25gsmbx5gIJEP2l8Fd?=
 =?us-ascii?Q?ZRI+VXJuu2V21t672ZVc5THp722V6KJumHsmYSWopTLJgO4Enc++nvT9jQSD?=
 =?us-ascii?Q?7MfsqNOt2/A1zoR3EGuKBo7TxoOCSGnHxapBa450ccJmhFiFAELRDTB3FcVS?=
 =?us-ascii?Q?g+2Zy0o/WiSEb12YbMfysyL2Z/wHhT/NNCsD/1pM/ysDIijjvc1/bnyuMT/S?=
 =?us-ascii?Q?5//4Ng9xVp8VKj9dnvmQhUvPScTec1tqKFL1LHkpLtfiRcPpruH0XcDaJxrx?=
 =?us-ascii?Q?AoSPXXF+gSHiOuAMU4Lb9q9ZhkkZtCvDG+8NPpuZAgFNnbHTmhD4Xm73v9QI?=
 =?us-ascii?Q?HwCsxDOTMh5ldYgMAk0UY52aSZ9WlR15qwkfL7tWrxlaSJtTP4mOCu7P66hq?=
 =?us-ascii?Q?0XLuO3C3FXv0OlV7c0giAOolkDxMQ8AHDFQstScBK3CA4B4l2XWi1TDVqBBz?=
 =?us-ascii?Q?w9JRE2+8kj3/JY941t8nqobhY5mN9kJxLrr++1o0fecigy+9KigRrUQHJt9H?=
 =?us-ascii?Q?mndd7Za590z1vRxaqAHxOofPmfCQwMSoyqX/fYFBV26JFg820mcVZibUT7lr?=
 =?us-ascii?Q?ESJRFoIIInHkQy0juvgjE1uaQfCXKkJDevkaTiSn/QRP615vucIaWhibNJlg?=
 =?us-ascii?Q?ib2R8Vn0eD42PjppNgG1Z8Lm3tE42vrvAiIarkZg7Vjg92tC+z0IKbxbNE6D?=
 =?us-ascii?Q?6CVmOW+1OFGpgV/i4tpgEEwojkdqzbS7XuX+H63nSri3WuRkaQbh9QilGsS6?=
 =?us-ascii?Q?811iV8yXIPn/ACPOYJEAbix5ZsBQ0Wu9mKmNIDPqavtTBQ69+0Un0yrCC6vV?=
 =?us-ascii?Q?0/OphCKYEONertkBBNcMaSo12TlDqKICNSg6eTsSODS95abKGr1fb+91uQOU?=
 =?us-ascii?Q?yZhCJowGFFViXD3lyXyeOkfLFPD9TJKHuKeVzzmcoepzMqzv+xN3jcKx1gbj?=
 =?us-ascii?Q?ubyyFwDkotUGulYdCHV4USTQPB+DsW0FmZHg4l2Iil3z+Cwn+T8gsEGJlqER?=
 =?us-ascii?Q?nKU/6zp0L5/y1enM79QPDI/pzJBi+J1oG+X/4vzvDwc2HBAcN2o6yiSGJt9m?=
 =?us-ascii?Q?iLTApzvlZV1oYBf9zDrCdr7TF5IG3B3uKyB0DBZG8Xl2a/0UZRnWlYegGomh?=
 =?us-ascii?Q?mbEjW795OLt80lGQkqN6LcysCdoXPPhcdnOmd8s/TbBRQauQfd/FJEqR8kx7?=
 =?us-ascii?Q?PbMHswqqOt/6IvoN467XqRaIrl0jK47xdJcLEZo71ESkmRF6EGDZN46a1w2Y?=
 =?us-ascii?Q?lqp0nG4VvmBD6c7ayNNONFenh311zsLgRV0lYhvuPn5ePY3R0NvHHUwDfdha?=
 =?us-ascii?Q?ehzOl8YahFmf3Dkdn6eLITRFVBFFO87lmAwiGWaSsiH4vC9YggfCrmVT5hDr?=
 =?us-ascii?Q?gKyqTx+aHYVpuHaDCP7/scaUz6XG/Ukqd6dudCTRLtOvxyGCLukruNgBSWVq?=
 =?us-ascii?Q?4VRVkm15xMi9PmEoGqVpBjM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9322d436-d44a-405a-9d63-08ddb456e220
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:12:21.1756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rM7PXslpvpJmAPP+tYzAjmI2oXHJHiFQoSGXVEfW0gfE7Iwy4E4nmrgkIUha17ODeYylA4tYYQX5s/fURj96fIlyaYJ55qXN9zwvA19OoKARiXyqfVdzm4nZmMBL35ww
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13972

Below functions have EXPORT_SYMBOL_GPL(), but these are called from
soc-dapm.c itself or soc-core.c / soc-topology.c. All these are compiled
by snd-soc-core-y. So EXPORT_SYMBOL_GPL() is not needed. Remove it.

	snd_soc_dapm_new_control()
	snd_soc_dapm_free()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 091ab31ae42d..752e8fa8ec52 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3883,7 +3883,6 @@ snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
 
 	return w;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dapm_new_control);
 
 /**
  * snd_soc_dapm_new_controls - create new dapm controls
@@ -4883,7 +4882,6 @@ void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm)
 	dapm_free_widgets(dapm);
 	list_del(&dapm->list);
 }
-EXPORT_SYMBOL_GPL(snd_soc_dapm_free);
 
 void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 		       struct snd_soc_card *card,
-- 
2.43.0

