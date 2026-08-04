Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3081382388
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804158; cv=fail; b=ZgRhwL6wb3Fx0KJ1+KvSyq6HSjjEBpgKeOxmF6oILFJ0hZUOemPxoJiSy838V3TFe0Qpcwlhm4yqOOf2HMoNCbBQI4nTXQJlCWwYmdw/kdNFee9idj8y+4hMPOdX5c7/76GvcOxvWCmTjvIAAtWdkIOz4Fw9WgY+iHY6vrZkJY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804158; c=relaxed/simple;
	bh=m4p3MRrSsMFGgCvj8rGFflyuoXBDHlF5SARUfcLymS4=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RKaP2h7+mL19WDbNdRcEzF4lIVGM6b7L4F2FG4QWo6NzVnG9YFfC+VA5Vix/cJbfRdZZVPNm14UF16GMkOJ3Tn0G053zaPXDv/Yxjy0EWEzeRGlSnc7Z5E36wdZgOla+aO4PKBRW3XFUCkOZcFyHSApzEA9TbIFeymBBaezNUwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SPenI60d; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SPenI60d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxCoWMvwgy2XzS/fF6pD2gotKVfuYu5i5LAfeLnV9mrMEVyYIiFxNCX8F31Cp0iLh7YqJO+iNcY7VMKMa9oXEZXNP3qiYC4IYC01TUm4Q78EBzdGq0xwmb/CHsBUhBmdmAe0ch4nMTYb0SBX4RjTuvXlfz0IqaivrHUDAebC+CQQF+uT/+b5hqKkNbojST1Wiaav7vFzbKv7yM1RmJcArWIbU/2b5yDOJeUuTel13Zhw+xY4ZfhsXhu5Q4QSxxyTs1y6uk8HlaZCETzjV03ObVSOGDIXfjWyVktO1d2UkhN3giUuAZeahs4XYI6NXTqslktrxErrFYZQrhySjmVl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1O9L+PcuQ9HhmDXXFkNFZ/MOPiehJZNOKjziGrg4l9I=;
 b=L0tNozs42Q1/6gj5Kwy61rgF4+TeggkpSAYjgLdpIO3GuV7hyETQbqUoe49cpWd+mc+M8WmFqePY2x7xeaylnbmhySOrkKr502UB5vAScGaEPNzh9995NNyCsoj6QLyiMDDnKO9KwMBimeQmzadh497V8U4tUiTFksOXHtriMQzEy/bH3LmCKGXhVnhQ+iW5Qx32Oqwcm6s6mRrd8pTlzCiWLYMobJUT6qhOA0d8eWzna6TCf8KH+SB0JnJCccCaSUL+nV1nuvsW0zbLQrODK1hDq9cZQfh3KRhw2aGQFtFPllgfjmNoJ3h0F8qwGugdwKMZ9thDxrgVRr78yX5Kng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1O9L+PcuQ9HhmDXXFkNFZ/MOPiehJZNOKjziGrg4l9I=;
 b=SPenI60doYBoRbwbjh87lDgiOBeT64kJlI9G/W8Sono5CY/1BSk3qJL243FNKHJj7krtcwupy7WWhjiXczVzDqFW3SOge2NLGSJSbA69mYJn7XhDasMoCvQsWdTLVIYOhlZnt+Lx8uvL9FeLcijbq8xKQ65GSDbE4T2gesmGW0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18168.jpnprd01.prod.outlook.com (2603:1096:405:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:42:35 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:42:35 +0000
Message-ID: <87cxvywwas.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 25/44] ASoC: codecs: ml26124: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:42:35 +0000
X-ClientProxiedBy: TY4P286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18168:EE_
X-MS-Office365-Filtering-Correlation-Id: e09dfa73-a121-48fe-d188-08def1c14710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|11063799006|56012099006|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	kp6xHAcMqQADwN/MWItvv72ncmYWcPb3lpItTAlhKclgxk4+sKXXMHk6NF0qQ53Rv5ZYbU6bPLZoFJeLzRnc6ZrRlM2Lf3SFOE+TxWfle7xuY835eGfgdTdngQx6aqIx8NUN9CKLrLcyqaBHBmLFNpMY424d4L5ICgPeUu2n0+i90YnOUOoUbvmDoi54NpokVqD3vw8WYuFdx7ipFxV8ycHLjvLfANuJHKn1zNmW9PXyMy8edExkarats+K4H/3Sex2QmVuLgs5vq7Ojq+FI1lLv5jr7DM6LHD1MJf/hOm9inwEfV7YdCGKtHZTFrZAl3KEHi+U4NGFk9rH1ITRg9eAfP8OJ//Yxc8WG8RRWnYnDtnBTBEKiE2AiMJNxgkBMj1wMAjx9nVfY4cfm5o60pOIxwKsG9jZXEio413FpbZl2RkgdLTHYOsOGqOPtp1LGnlkEeRWsc+KEappkKJXL/DdbIDU7o89jHyM4cpErZJVKdyrHQM4tbbUaSzD/gXV2SWPHmypqATP6on00JgHJSoeO43CqP93XvV3WI+neh7Ab3lxqE+/zD9m6iO1FqOoduW8F6MtjFq6cyuQ6VkBpFPpJ7jXkrBVC0qwUKseVZ9SPT1WUl8ihwHaN1hk3AMUoF06NDQi+jF1Y2WKfIzgSnyI529X0jAf1TNH6xdEj5pxFdC9yAcWLLw42Z1K5AzQizyAZr0F3nR4lEMjmktHdPuMT7FF8pMXMu2fY3mvSwS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9xSn77FNKhpSGKE3IoQBHEh8k3qHo3H45Y6C+umcp9cRBrwm2T5RTsY/31/g?=
 =?us-ascii?Q?xOQfuzaWzKEunnsez0i3/C8apObibiJapjV649bzkNUR+Zvlo1aXtQBEoz6s?=
 =?us-ascii?Q?/eWNiAPz/7gOuLcXxP3zGNJfmSqmtuyPDxRa4btDW67CHI2IF5p9HWSNx+Ai?=
 =?us-ascii?Q?DaxhaTMOvecfPjVwMxNsO9GxDC83prHMDqT5DnC6PbwK1CnUO1412PVCJem+?=
 =?us-ascii?Q?ef3w0y0YLQZdpLOWncQU6sd1aRbvSkuv1dPkUJOQDq4J2rWyc+WnOllxfOo5?=
 =?us-ascii?Q?pUHzaZFZNwth603ZUuL5mUgCXGl+d8vEd2K7HmJbHr1QlI9lpinbkGHkLqJn?=
 =?us-ascii?Q?K2DH9SNlzdWu/eADyn80g7rYs0xc7TwbAzHrlKwmgR+Y4zYQUieLlUc+UiL6?=
 =?us-ascii?Q?Bp7I7rPAMDZrivLj1n4vvakuLHUwXKSwbuaDFA+Glskc964cksvgYNFSMk9U?=
 =?us-ascii?Q?UDL4c8/U/CXXuydHKr1pasC9DS90Ba5q9P6NNQWqhjmevWsHhSHCW4IgdQHC?=
 =?us-ascii?Q?6h6pWzLHE4B6O88CDFUxFJ2S/5hQ7yjkJ43XJ4pfWm7iS4RwvK8KM+kicOtd?=
 =?us-ascii?Q?EcKn9XZ5fNZoOrz8v5y/5xPVl2bgqhLjNCjArzMgedSz2SWQnJANtcLWtDmR?=
 =?us-ascii?Q?5AEabCx0B8sw49CWT+dMNJgvsoAVtzscI2dHGi6srcbbBFXkdp/FBU7Uz3BM?=
 =?us-ascii?Q?NAhonPcuBKlCoDpam8T4GT3fSXNIRifa0myMhhdgk3/SG4LnHLo7kugBg5cR?=
 =?us-ascii?Q?gjx7sAMl68dSV8b1hco0DLG3yAnMVxEVu5PKuPsfHiS48dtGPxVGLfngRv9i?=
 =?us-ascii?Q?/Ky4lA1/KgPUDn8P6fQKqEwIzuKG1GOjGZUatEv9gHPlb26DlLnFaN/xYuuc?=
 =?us-ascii?Q?iKFGAvQHV8nwpDDBcEoFYO9ul2xG5ugEhd+ORiacrgZUOCxKJFhsQDxTHCIz?=
 =?us-ascii?Q?7nbWejS1q/VSXsWP97guqiNAyq9LTuQu0rcaPZlaZTh2us12PY+eu90p9c6h?=
 =?us-ascii?Q?JDvkVLIrzljUx0iLqIFpHWtjjWit0izq1TxRoQQKcidWxQPQ8lGRRCNdgVG8?=
 =?us-ascii?Q?EVZnrNa6hE2vwbpE00fZBJ6A40IrFdmGgrZL++Yp5Ty+3Uf7PSrc5fnPCyfp?=
 =?us-ascii?Q?ls4MEak9jHxIsr9a2pnVsG4mchT6A2oJUxRFGb9bpjOLpYvSbhujsOFdcKWX?=
 =?us-ascii?Q?V3OC7lnPg4CE3oHGUAPTAspD93LBQ1bocTfhqyGcWpoXTiIP/bxz6scjsEYW?=
 =?us-ascii?Q?WGlBQCKNR/anhWbxnf2vQRYE+lkbh8f7FyhQQ489aC5bY5vwf7oDFPm5mjkv?=
 =?us-ascii?Q?w8Sn+GyvCiuY4oCN2Z//I0rpRAPxGZ5aCj9V5YBTwDlgR9WRURm5hBGxRXQc?=
 =?us-ascii?Q?U9jT/6lBjgIaMZuqZc9OD6Q03uZ5m3cFJNid/lgdrxy3byT7OpX4OBtWnBzF?=
 =?us-ascii?Q?IOTb5YaHrYSrjtaZjnIL4McmwjW2yT15miHsOHFBr3KNvaRMybryteYpbTSG?=
 =?us-ascii?Q?ZWHY90/v0OeNtSw66pYhvRM2hUJs+T5vncKGzz4hiUjI1l2UXTYw1Memsa4P?=
 =?us-ascii?Q?8FVon/fMfllCU3jWFSnQYxDqFypgru2Wuz7FYA7EdMMTaiwg11VvI+/Y83wN?=
 =?us-ascii?Q?cxmfxe4yIvFGwjP3Yy7GNxArNAcc+aiCTlESRjz74WsfBZ9I5MmwmrkAs8fo?=
 =?us-ascii?Q?eTI3t/caXbdLD8tjRvn0VUXRMum0l7rVZa5FOdYQLNX6yEWpvCR1vcHV0hk1?=
 =?us-ascii?Q?UAYj9vaccjnsLxGoD1cIrZ510XB2ynM6LO/thxLDvEp58yLGfD+4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09dfa73-a121-48fe-d188-08def1c14710
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:42:35.7677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bAzzumBN9x05Eitl5N+6ze0sil54K23T1briaC7nKgQQ6JIhQ+jonuDnJqWK1SnRNrpHthzET40MgurBtpULoy/144tkye/2GGwXeODs4onvxGL3RIbpjsApQzd6KKt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18168

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ml26124.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/ml26124.c b/sound/soc/codecs/ml26124.c
index 8a14626d43ffd..ad111d92cffab 100644
--- a/sound/soc/codecs/ml26124.c
+++ b/sound/soc/codecs/ml26124.c
@@ -490,11 +490,17 @@ static int ml26124_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 ml26124_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops ml26124_dai_ops = {
 	.hw_params	= ml26124_hw_params,
 	.mute_stream	= ml26124_mute,
 	.set_fmt	= ml26124_set_dai_fmt,
 	.set_sysclk	= ml26124_set_dai_sysclk,
+	.auto_selectable_formats	= &ml26124_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

