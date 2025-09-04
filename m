Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E781D79A5
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 05:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963277; cv=fail; b=spZUFeDvMdc34kF0x3JKG9G/+tVr3DU/KgLs289IswH9Er5Fk4Zk5FZ2HbXcNp4yT6qpAHuJM2m9ONCE8v31mkljXkNdkaf5yf+p+X0UpGLdDf2LOAMwPA0voFyClp0IjcjEl92J3U/t3l5z/DItLi1YtHxEdTScdFE+aJMII7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963277; c=relaxed/simple;
	bh=J/MDvBHNGfJrtk9bkxBvG7cdjaMZi2nFITHM8ivCJ0Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DrX56S7FiVKu0GzHzBxlb5MqeN8q1zQsalbNH0veQcvej2So6HciCARtEtoqVmsdhr6vAH1zn9ZeAogK01J2UZFb2+B0YWj02OpfNMiEgXTq6KBz+WA7hZfPdD885HRbdehhB8a21SgBKdY9ZZyVV4kpNMMnljXCxIy5ScKfJaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SytB2UCP; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SytB2UCP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAwEo8HLqsn2VvNdtxvYSMxnNSaXETjU0q5tMra3V+M2+KsvppPACgZScwdgIJyqwEe6AuRXpWbbWJ280BLrry9nu2UjTbo1QSnbsGAzwVEf0hUTahCQFhmxnIsBDXk6W/s9TbX/kU+JhzaKKEEiO7LcyGeWfTroqAELDHVN+JxQwPKQW+UPDhZtthAdNFf/4hWpdH2/ShgZNurdYcG3Ge2jas+SIo8jZ0ftior88gL/NaoNHK1TPCHV4Um1EexLRpEZilLvJg6h+2nogzFDDjYOFOIYRVU8nJmPh/36L//f9mCv6eSzI9hdQFqCGyb2FiAianp6GT+KwRjVjPrcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qNHtZNO5Repoi0ICXuO6M4FOWQIjaDJ3GtwRL1F5qI=;
 b=abkpL9KZsE0ODbz6eexa1oM2LuRpoptJbfkV+AN4qR34netBEVvMTzZbR5avbKKRklQdAeKuyDZs4M+zVSfAAAiuMkJoaW/wN8kbrX8C4GNt+yGCPApiq7oJpXG4pjgJi8JeNl+h7ohuWo/a+WGdjB27lRfAc/21TXnLWzuoCUyNTTsnC9t4VtQeN1EfRBKRUCmWaA06CxWGK/YO1DtoRTvXbABYFcYbHuoM7wrV7jI3ozcBUPxIaC8SYDYpMJH7RllYCYHOwmV2U+RcqS+LOFFSoYoCmX8C/9OcBZ3s5oUJVnxldZjuUpXwHjOyEnT8EB8iB/74dB8hh8GRlCL3hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qNHtZNO5Repoi0ICXuO6M4FOWQIjaDJ3GtwRL1F5qI=;
 b=SytB2UCP4EN14X8wvc3KB0PS0kNhNyzp0tgAHEn9OXGElkPUSJrXV7XZTU6efZLsHCsgZ7Nq0kN3D5UWL9rfACsmi85l15eZm+2ayRt11MMHyhBi9v9BFOL4l0sMmji3IcZ0mP6R0eyhwNWkZOBjYeuXUOgc4McAftewHAm/T6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10672.jpnprd01.prod.outlook.com
 (2603:1096:400:320::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 05:21:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:21:13 +0000
Message-ID: <87bjnqx06v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/10] ASoC: soc-dapm: add snd_soc_dapm_to_card()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Sep 2025 05:21:13 +0000
X-ClientProxiedBy: TYCP286CA0351.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10672:EE_
X-MS-Office365-Filtering-Correlation-Id: 258014f7-af7d-4144-43be-08ddeb72dd7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fRklauFlbMIKQhRGiAAHemZHgrMZEj5c3ZnXwUSWZpjjDZIV6SbsJC1Zlehv?=
 =?us-ascii?Q?pYSkRhWW0W8eKbx3amxbW7ETTzWx74WBy5hK8jICrsm6vtwXJCt+IKvr/tw+?=
 =?us-ascii?Q?JR/rAsuCA5yprJwjNIdbWIRwr2vVnZkSBs+F5RmqV6DbOU87nc1dfTanjW3H?=
 =?us-ascii?Q?FSr2Cs8EKqTetclvWwW29nVLbZ9wi5AL8geFtEpxOVlp2Gkz90OA8uyggW/i?=
 =?us-ascii?Q?fgeZXEnjtlQ3hR+f+bIZxedSh6Ov711mh62UmW54nqenNkH1uxLfCWIEU7vN?=
 =?us-ascii?Q?lZnyuzNTnt/E3WMRhvyLJGsKtlxvgFdp7v+B78qPjfaDR70EqPS6ZGX+kBmy?=
 =?us-ascii?Q?jP1WjCJcBL7d4UtbxljO/NupN++INxpI0HwpMDC1cLmbXTOVXd+k+oSZx6fF?=
 =?us-ascii?Q?i0vUpVEgGgkgC51eUjM+jXwaZ6ZbWVkMtXRFtcnoplwqF9frOLYVKtFisEPQ?=
 =?us-ascii?Q?wyyAL3XqbmbMHVJbscm5XNO7Uppy5cfvaG1jJ2vqu7T/BXEqQrD1H7i95fTu?=
 =?us-ascii?Q?qBPMQFLglbYuf/0W2L5DaT1id4I0CPnYTmQUiGa6TU3XfzzRdCRD9GRBS6tc?=
 =?us-ascii?Q?IisXdwuTboSu0teEVPG1aqH4AsFf6SjzWiZhg8pVlGIcA76nASgLoxW1w+TI?=
 =?us-ascii?Q?SoTSint9ja8rfPUtK/A6ilPP9EqJxmRzGvaxDNezR4MBcdRHOTzcVy3drofo?=
 =?us-ascii?Q?4DW8OmahHnSPUvh5oCYzmnFoYN3Y2pdko5qs9hUlEBZS+0FR/6J51Q0BowQm?=
 =?us-ascii?Q?gejSmFIrb3TxKdqkP1D2tKClu6mXXv4Le4yCb9IucSj8VCYKyfnJMuYlmVi/?=
 =?us-ascii?Q?Xal6PpLgTp8YE67tFKwr7vDAKCtovajdLwR80pofM44pMBFnynLO9Le/dJUR?=
 =?us-ascii?Q?PiKZIr9ape76VX+muic6BPr0JSG/76xCrRojM1fV9gVtuIL6UAHK7rNIDX1w?=
 =?us-ascii?Q?3n/H4ZPlkIwueuLdcvkojY9uynTiV7oFlrXjrpA6A7k1Q4tf+qbr8ZJp3tTA?=
 =?us-ascii?Q?3oFCpFQAkUyPKHr/r/HAhO07tS0NAuDm8K/I6dc36yivis3HECEBP2g1E8az?=
 =?us-ascii?Q?9laFxgSPtGvxL3l8yh2MJTNYGJ4DVgSOcpnsmtVn2rFjHzmM942yzMQguFHB?=
 =?us-ascii?Q?axpckH0ZIj/VuepUDInZWKz3SsCYgMWvpTCbMRguArRb4A1wfftmSSbFjnol?=
 =?us-ascii?Q?sL3LJNRvLw7sXLGgeuAp1MugeLHrjPouR7dK+wJ4f0qx5v8xOxH19QtffJgy?=
 =?us-ascii?Q?FykEsnpYHvl0H2SL2UCzoy4bkF3k1yv0+H+YmiCfdC+nmcZWCuEt/S0P11dL?=
 =?us-ascii?Q?z9vwbLA3JsfXRp1Qu2Au6N6dzlBC/Wst7bCvYxgkCQEWFv2XrRmuOx/mSTuY?=
 =?us-ascii?Q?41XCJDAeg4T09xJfg41Yty2firy7/2lihRlmiBSId1BEi8soAGAZjBGuC5h8?=
 =?us-ascii?Q?/h59JtaXTwoGGW3A1aY0ffHdbmKF6JkE2GBikPoRT1OnoC600bw05w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NqmhDKTD904LvnE1VCQ1fhHzvRsinPZQj9VzgPD7OzyzeZbICw7ivlWT6aWC?=
 =?us-ascii?Q?uxbrXss9gma8DuvYsE4Zblttxz0J8TeB/IrfiFW8yzBlVNV7mxixkGeU9SmU?=
 =?us-ascii?Q?MYNnAUgrGw8hPOWXvx5q8ftQ6bslmO/gzaQNEXIgXDrH6wrkNeYso6VgfOry?=
 =?us-ascii?Q?KIEwE9eN3pCKqvOqe5jeVgD+8TL/sGM58qJChrDbV3NaYNvsjV1a3x6YUYrb?=
 =?us-ascii?Q?KNPHux1MTvQ5PJla+wFBf94LVooRc0LjOnUDTXvGFQ0G+oQG1KvuARpUKwGS?=
 =?us-ascii?Q?KQVKdm4RgEGTR5HYH4IdRellgbTUA5jj0AHMl1XCrwuIbwMkGBgDz7qGxj0I?=
 =?us-ascii?Q?FDck+mL/2mBseq41Q6b0G4dJNkX6S7A4VOQHGgwrwcNBAnuIoapMKNxWmqge?=
 =?us-ascii?Q?oSqYtP6lNSPrrjUUmND/yhKc0OKXdhb4IW/6K1hFb3A/kWvznabQ1LAslY6T?=
 =?us-ascii?Q?p5+imqdcY83XrqPKw926b/W8Pg+3Xo4PTrvLksMKIQXjSf4dQKRpwoJifU0A?=
 =?us-ascii?Q?wpcSFJ8yeuLP7G+qMeSCSXehbcxlcD0imyTHeI9M3lTpLylsLopnCrPBWm82?=
 =?us-ascii?Q?cv2Akz5G1wGnXlJfKnTbZwnKsPwCVBSE6uN/WEDKhI8C6Ng3cA7kNqeGZb3N?=
 =?us-ascii?Q?2mP9sh2Qqn1p7tfdQD646WR5QizruIQ0Akjut/+PDxn349fpA5tSFi6VcP7F?=
 =?us-ascii?Q?fRrC1YP0uGC1MVvb7o9IMW5/5uPXgvxFon1mvTRm85VTvJ/gDENh/A7Tpk3O?=
 =?us-ascii?Q?0l8Vfc2ytYJZToEH/Go1YaaY667oR+8+olLpbneRJHSMk9xliBBCEYNkHHML?=
 =?us-ascii?Q?8ybNwDnE7AlB3cYf4xpabqldSQ8cQxbo84q4pNw9+/HJctQzWH4H4mvrYynH?=
 =?us-ascii?Q?U8M2IN+911GcLJt3E3a5Cquc6Yigq+Ye2Xyy7R97LSUa3XZEeS/HuASBIN6m?=
 =?us-ascii?Q?DPXEsYrX6gpo6leTx6yTHFZWH2OvGhkA8yQSWA/iND9nqzDd8KtYvYL7W4oo?=
 =?us-ascii?Q?Wb20RGv8kcV1ITg1B3D79eP34nEJiyfzBXnyuQ9eKky+CehSIBfikETg+nNd?=
 =?us-ascii?Q?jMuggaTNIdLzy5mbtotuhcIUZyy2AvHlZMLHr7W0bixw3ruSEwtSNWFuGX5h?=
 =?us-ascii?Q?PKRUXaPjY6w2KQNUICYi+HdLfvsWJ8qVAb7T4pWQ2dE4t614OdjmduQvdtGe?=
 =?us-ascii?Q?AVJxIg5WkSMxD3U5A6e2DXkKA+xpxUlAld5sPqqAoAYStFMMGzfNdfesVTSJ?=
 =?us-ascii?Q?w3J0N57/fKg+82v/FbC1EyJwTy0v827T3lMgdUAz2VOd8p5W4gB9rpU8ZlO1?=
 =?us-ascii?Q?+KkqjxgJJDfTGElUB1THydDfi1zbuddA8kUlkZeB1tuaeoVPEadMADtkOY1Z?=
 =?us-ascii?Q?VNqlH631WP1IEyLO/x99HeZOKUIK9IVolV8PvEgbqq2/jI4AbtDGEZBPIE6x?=
 =?us-ascii?Q?JxdUl59O7Q6dOPaRACzVl8IBBmS1gyBMxWiR3juBaA1bnQxiuSEU4s2HgtXe?=
 =?us-ascii?Q?BCKuOEu+abSbU8OW/47RfjJPQcJ8NgtkZ1QKrCHkSnE7JMfukOgD35GPgK9K?=
 =?us-ascii?Q?flUogtIrjAF9hd3dt9WML9Z8bqlZ4cY1Pj/LhP9YbpYm3DXt80DiVrBr/HUo?=
 =?us-ascii?Q?X3Ixsnj4S3+nTpUjoJD75VY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 258014f7-af7d-4144-43be-08ddeb72dd7a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:21:13.2628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58OZhuQGaEls1W7qO4tU3KIZy0mJ1uQNlRgTivRBTp2AJLqX+SUCqLBxxVE7ZT/p6P08Cu8H/LEoMExDHWyomBc5zK5MNdlrnwVNHGEo6HgOKTYYKecP4dchlBRHWHQd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10672

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

Some drivers need to get card from dapm (which will be removed).
We need such function. Add it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 1 +
 sound/soc/soc-dapm.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index ccd36a198a134..dbb71e396febe 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -661,6 +661,7 @@ int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params, struct snd_soc_dai *dai);
 int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char *s);
 struct device *snd_soc_dapm_to_dev(struct snd_soc_dapm_context *dapm);
+struct snd_soc_card *snd_soc_dapm_to_card(struct snd_soc_dapm_context *dapm);
 
 /* dapm path setup */
 int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 83cdf97edb9da..cd8d385798862 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -174,6 +174,12 @@ struct device *snd_soc_dapm_to_dev(struct snd_soc_dapm_context *dapm)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_to_dev);
 
+struct snd_soc_card *snd_soc_dapm_to_card(struct snd_soc_dapm_context *dapm)
+{
+	return dapm->card;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_to_card);
+
 static bool dapm_dirty_widget(struct snd_soc_dapm_widget *w)
 {
 	return !list_empty(&w->dirty);
-- 
2.43.0

