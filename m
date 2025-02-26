Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9EB19049A
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533671; cv=fail; b=oF7STJXDsiKALTQWFkt3hRug1whGEDQhzYL4mp2KGrWLieNWB4t8Rv1LEDTSiw0c0O/j6aJomiAJJfoVLguioYPXpF4+wCdJPMegfUc2FVH430VlYDAkmMy/9xHov1a0hNSihewoF380d32W2WcffmHUodjeTOQm6BqOvYSS83o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533671; c=relaxed/simple;
	bh=u02WQtugqa9gkfVIfpcgkmVmST7QO/AzJOaqJmRJj3c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cVF2mRHl5nxCnQuFIpSB6KEe4QU8VMK2/va+t0jmRWW/sKDrqYyC3rJgYWnHPdbUzQYJt6fAqSURYxmABaWcBo+cLYOX974CmQnMbLWu5rWfhN5hqaxtet+Hr+98VNnRmndcp3NUrvHe5s5KCKOMSA6naiZa0sTHK5SnxaFQiLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MarbfWz9; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MarbfWz9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tfe+Tve4VHPN/jYrJfdeNNmBSBflMG1R7MDEAMvsTk13PObfLIxnHWviP6jbc5mnLciMT/wr4x8PtoWpU1lQaocRuDrN1VYpAh4ZhUgqen02Mm1840SOFMecwpm+5trwvqty6zkdj27e+DO9jdobP2acVCaHtZea+QQQI713Diaw/Itv18ng+qIrsP4+NA+zcNr50yLZY+GKr2UC7B2HKQGv/y01Yxtn77OCEQBnceU75a/m/OcvYINhRhFTCeNKSauAgVf6bVh1LZweitsnFZrQtwC3V/wqF+mveiCvVVmiRmeYR0Geuy7FAeCOvt/yq3Xh/8NBWFliXMfUfL7K1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftY2jH/MVFhupP9beCLnaTs3YYNFDNLihSO7SB0DdCE=;
 b=CaVcrpTKaW3SLQQ7BE89Ah4PfIO/5D7iAY8En3fmA45wOnwYvUxqalw7CkcrEiwx7f4zMZzrtLXfXgeEMUV9xPaslZk8GdCRxVml7n3VwAJt46hPq+rJOsUX5Xivi/VDB2BNimRJuasfcaKtstl50pSxjd/tATZSwaQA8fhGTOQ4jf71BN13cpx0wL6FD04TN3KVEOa/VVm+adfMrCsFM24+vh7idR9XOauifZ+pE9mSQYyWo5OYE/iURfVcAmCn+oYUbl+OEMksgTZgCKehZsBbRoRQvRhVx5JEBaXkiByPOUMjvCsccdsPuEZgO71MkZnP7lz3vGNgVkyq5cqU7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftY2jH/MVFhupP9beCLnaTs3YYNFDNLihSO7SB0DdCE=;
 b=MarbfWz9dHeUHckkeKEPZyUY2d1fV6lRnxm2Cem3KyBOmNV6r/ouK6eNYlqzURKp/JsXwyrYtsz0msnw4XtuTn9iA9ImKMeDajRGgCXrooCB4wXNgxBfQX3SolGruSFVj0tzf0RxTJ/xSayCsMKo2whw/8Z7Ka3+9rT9ertRoj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:34:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:28 +0000
Message-ID: <87o6ypcwv0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 069/157] ASoC: codec: wm8510: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:28 +0000
X-ClientProxiedBy: TYBP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c17311-7cc8-444f-b6e3-08dd5605b5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OPaevwVUpG33G2muoYr5cCFLbhW2TX7qBXu6BrFBVMjd1AWAmXt0NyiN/Dxa?=
 =?us-ascii?Q?cXnjIxvijM07onX/MClf+uX9MgKwWtTHrAOcS/Jemzw3Jiy/B3jq67x7fNmT?=
 =?us-ascii?Q?OkTquUl7LcoRAm7GPtMFd+mfHOrl4M89GNwacl8MOoIVPdShqDGhLjX9PZ+t?=
 =?us-ascii?Q?YHNDYDwRXhdWZPMuKuk+dFoO5jS6AHF0+3bb1BBlx2c75o3PDMzCEFPl8nof?=
 =?us-ascii?Q?+ytmGRnQ7wMG39uPQ587f2Ka4N8kvjatDMrITz6nfaTpr92vyT6yHH92QBrw?=
 =?us-ascii?Q?+An8RDqJEW+hoVBO4cRl5arowWeBYbBDNX6yJRHwdnbtYCAjRuSk1CT7AayW?=
 =?us-ascii?Q?bdyy8qdq+hV9nYMZtWGrn8QBkQFr36VrH3TUWDSxRmPxl8Lie6U7F1sIXcLN?=
 =?us-ascii?Q?x5QT4Y8GVsQUMiuzZGJAArJXJaXq+H3+a7ap6PpVva90afPaEiW4KNrxoeYI?=
 =?us-ascii?Q?zEeZNF6t4tlkkW3lK5Jue1Ky+QjDzst9Jp86qn7Su1W9GwiXLqciHYKDw1qi?=
 =?us-ascii?Q?gtLIg6JmNghAb41JfLLd6qZsO9y/D2tnt2y0os84r8jg946awBUa12jNl0JH?=
 =?us-ascii?Q?BI2WPYSIhJS21BWyc0DV4TUKxzdzd1ftcGNrlaCIsB4VdMU+TGUxNXRG/XVW?=
 =?us-ascii?Q?V5KQo3Qxs2MhYOPUAKDatc4KhMdrOklBAAH5DPY9YuxpauJAFfIKeFQey+QV?=
 =?us-ascii?Q?wCVE4A6pe6BFEpPfkx6glDHFcip5id2plhpGIOGafw2inYXnA/nR9yO9G8Hi?=
 =?us-ascii?Q?hKdSDuzBmCM7xgY7r5g4aqeHy8QYa1njQrLpEC5bEc7rw7a5IKatEb62lCil?=
 =?us-ascii?Q?XdD9JnLbh2b9hkBjjzrOk7gDnWufOF6V6GCTdjD1MOr2kc9yeWNQ7s/kddeV?=
 =?us-ascii?Q?T/R7+SqMVr4w5hWksRIx5lBl3Qoz3L/wbg677SHUC8IY62H9CI8AHSbU+Tt6?=
 =?us-ascii?Q?XSMm/u+O0LuNNVUhaljgWh+UzmJfGXGwcYv6OXCKtcRFSwn8BWvf/KWNBZiS?=
 =?us-ascii?Q?e5zZ8zTWpiPYzAbPtiZOkS8JHxwF211hk7Y6J3QzF6LG9MbocdR4v9WeivFQ?=
 =?us-ascii?Q?rsGN5PrOg2q36Rj0nez2LL9/vN5afCorHNDYDyp1tu8AiYJpWQRVJaDE7QLv?=
 =?us-ascii?Q?NRVksWdnesPLnIywi5/iNJtUxVIBsmOd2LM1Q4IBS/WJTbXzfDEOL5yMnLS3?=
 =?us-ascii?Q?hD0wSMh19BDn+H6rnQvpk2FUeW75m0SoRG7zyQKUdsBeKlVU1ggdcq4stx09?=
 =?us-ascii?Q?PkwRU2XEx02ikEzkuLmXz/kVJHLUXQ/q6OOBCpmIHGbi6qAyEoEUZHbhhg28?=
 =?us-ascii?Q?MkRb5LzRYkk45JmlVJoGc/ytcQBB5WjfvoceXKNSaH59WnRC5Jy3zDKocHJL?=
 =?us-ascii?Q?4v7BfS6D4EGnCBHnBk7zTLcFPb/8/ZuINR5yA1U/c8vXxGih/Qha3CaacjaJ?=
 =?us-ascii?Q?97l87/o1wppqu6N6FqYQvRRoLEaRXmFH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rqy9L3Lo+NImAc0OqYKwcqz9xFDoq0mjKrWYmmmVQhOQRhkCQcOrwdepJcE2?=
 =?us-ascii?Q?kut3+ivGTX4OShdXEPKlOgdBTB0UvYq0E96eoxY/sgAuzs+izfdhPEmBo6Zv?=
 =?us-ascii?Q?za6/JdyLV3PUQtJvXb9vknwa/IzvnhvKJBhKsHZMIvj5OtFWZ0oULOzEfYFz?=
 =?us-ascii?Q?KfNr7adlnXI1b9m4sEnoiKxYSigOGOHPT6mqVDvJpLmVbMOeaeFD7s9S83U4?=
 =?us-ascii?Q?pGZyxNywJdDeaRtFs8v7FeN3RZhkEbn9EzgsR3RO4h9dvUs3XJZirbwNaCRY?=
 =?us-ascii?Q?0wgQELVv+mZ4z6gEygbBCQXXcORgIg07jZSMVH1jpMGONHdrLzfZLPuqIq+3?=
 =?us-ascii?Q?liYWjr2utNRfzAqKtUwLtilfaA+VNEcDaGNJSSjE07c8l7HIAWww0ALQ4Wqu?=
 =?us-ascii?Q?3TGBc3SpFAEM4NII49XsKHaNMKC3Mzk9o+wYGAgm6PJLE0H2zEMDyEYVyDiB?=
 =?us-ascii?Q?JQdWwRopFYS4S8sf71CmVOCLGeQaRD2gitd0g8XN8yj8EiiHn+NbSl1v/Gi9?=
 =?us-ascii?Q?OqQoXyjFx26YnFZfx+xeHMd5xJ8VrzrW7Cbpuv7BsTynLoyh32nemqukw6tk?=
 =?us-ascii?Q?yPF2z9Ql8J8z4TfY3u8neieRz7UFqwaxegIdXG5qRG09km3f3gJ7eChkd4Iy?=
 =?us-ascii?Q?IteIMZPu8/gJrIVX5i2hmS5F0/uf9L0G7s2w1ssCZxiWcZ6TkF2e8wf8reW9?=
 =?us-ascii?Q?gBtGc3GdnTfr8VfxAbfhrUTANnpEyGkaQxxef+MLzj/RPFiQX+ibmmw6BlkA?=
 =?us-ascii?Q?pl9GDLP4AXvD6rGYzHqucOFUjZlLYYt0IC1amRbUgu5cpiI0CJPpfH+EJgkn?=
 =?us-ascii?Q?OvPmdmD0H9alrJjmG00eU7KSYCfP4QwBwfNY6Hw5Trthz26K03SdjZK+wamr?=
 =?us-ascii?Q?cbxX2TQEiynyZU8Hnq0kbOq4qlQoHzrFEF3Oo/mK5e7f2777QH7PIHccDqjt?=
 =?us-ascii?Q?+DEYLu+SO/VEZrSlLaVNclRc14Atvv5bfS/RoK+qTi9/GvWUxujF/uTgpsH7?=
 =?us-ascii?Q?dXk9y3h0mxtuY5Z4uLsiLC/gr4cwuOm7ywzCiFHRsfxYOnOZ5WGtSEtzoP6c?=
 =?us-ascii?Q?CprR4LWuLyBc7MPwfAMlL5fyAkSCEZaZDnpFtXcmmIFxGcxh967ePgf9bAN/?=
 =?us-ascii?Q?QVxhcXubdlR+Nq2Voa+6LTW1+/WXxPZ19MMSNJ+vWgLCU6Zo0fZCTisomp6I?=
 =?us-ascii?Q?BD5sh6sLBpEslEyXUoWlbhoWpvzUD94WiLWaE6HxZJZRFS/zd+VKnxPGyic7?=
 =?us-ascii?Q?+WBBSTiCl0CGSgWwtjwExbBLUhoWLVWDWkK8xfboHNRKInyJNaeU4XPA2wwC?=
 =?us-ascii?Q?+SxwEI5wNpzxEiYdpiXwkMNEfDGoGJQmI3YjX/D1Ca0cGgzP2HI65nksOuwd?=
 =?us-ascii?Q?P5ukw4TANzjwy1XwwcqBc+IeLuUkSp0fynb1yhngjwWyB+uMJuokbzg/bIiL?=
 =?us-ascii?Q?rJVFI/3NqF+xZ/T1TXmHTFwKohYs7t/soO2dYtO7JjechI3HOrlbR4KwIN8S?=
 =?us-ascii?Q?jFOqAhD8qCAbGl/Dgrn9BAamYwN9fik0RZDYhyTDxCZlqfuuc+MEtmw5zVOu?=
 =?us-ascii?Q?cqrBvhgIxgA07a5A7jejFDTzasa9lF5/u54Vqu31ogW1mX7f8aRXZVJK2Mft?=
 =?us-ascii?Q?2x25CewbEt4t/8S0XPTCQpQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c17311-7cc8-444f-b6e3-08dd5605b5d9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:28.3746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iF/nTPFmzmAzYvlFiTLHQ2EyK1mqcMKugtU7wXQLrHPiFqm9ODFDPT18+Ss3aub8WouX+YU7dau/ISIZD0GEkyht+GbEmsPpP2Bm1ncmD/atvZAlkk4a+dfpJbLCQ8HW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8510.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8510.c b/sound/soc/codecs/wm8510.c
index 4a31d6f89502..79adbcc90d4a 100644
--- a/sound/soc/codecs/wm8510.c
+++ b/sound/soc/codecs/wm8510.c
@@ -389,10 +389,10 @@ static int wm8510_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		clk |= 0x0001;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

