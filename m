Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011037.outbound.protection.outlook.com [52.103.39.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610031E520C;
	Thu,  1 Jan 2026 23:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767311634; cv=fail; b=tee+Kmx0nzI1Pcmk1pC+xJvQ3NaNYkCSKWeN2F+De/Fr2DuR5tb8ZvSlaK4fXoOEaswgrCWxtNjTqYjGnSa74/IVndlQsuFeAPiL/fj15uh+Izzg3F7x70QOvceJ1ZDSKIpL+kaf+a3TNas9ph0TUx6l3+9KrHLsvL7jSZyd4e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767311634; c=relaxed/simple;
	bh=JA2F/qqqDqTqDwfRijyuq6UC57o2DiSEetBEnfIdmHU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cVIf59Xy6tuhALB1e1vMRMrJprXyuf4oGe5IFSATlmKs9cHgY3gzZAHAmzT/yqXz1/VTLWf+V4142fkqQ1UbO6V9GR+GPwkrU3qQFi2lIMUZWZNRSH/zOHQQyRb5wCJQ4LDV4Zje86lw/tESz3G1Ozdlsymd1svwsO3DTFRozEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nPyRTAbX; arc=fail smtp.client-ip=52.103.39.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="nPyRTAbX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBnlgnbaNyrybv2pKYCAvcuehYidvBk7zDjbSBiRFXVKTaM6F4eCMP0aiDg3vIRLjhNL6rzAwykjk2fsTZo2JCp56TW//f/hqSFscMSKpTRNtY4v0RIWwZV7vNuhgsvJLDbETKmrokdYPNP2nh6FNqujaHgi4IkMcnIkoIs93kAeTV4YELfU53pW36Ecc0x9730j2UMDQ0DzYVBWU5juauwyWX+/yn0DzhDvMufAzh4sf9gflg3eGXv/RgDeuosh0WlwbNt6c8GmbHCY0artkj8GD8DAYU5gMKq+aunOwgIMT/vkLUxUOYxT1tOWEaoQ89jhu9u5X06omlv54tD6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRgb7KqmGWQituDcEVf19gWV6LpqfBIfz3gjE1UTGG0=;
 b=vun6sYV+97gI5UTaFc1l3IH9Ljy75JM9SuHBMguvgjYXqR4iduSA4RUhiTUPrBImJWyBxFqeQWXup8T/tXoP5V8oSdOhvsjVno0K7fLMecXZkQW/N2CZHrAO4wWGM5khkTsa9H7HvpVNKMmR83tZcxtiJ0Tfs2Wu4nexbFotoGEX5cQCKUkt+BSE/oHP3LXIUK6i4jIyN8x5MD/Y+RdhI68DFEnJKDGnuzG50Nf3ULAG2W5tVnyhC6nSL80uRn5zKubCOGcg84qnRmgmWuwqqzPgERsPm8VKgcq72bXMCVUSgeCt80tBBkCemxIXiBN52BEVSRj2OEhK19jM+eTngw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRgb7KqmGWQituDcEVf19gWV6LpqfBIfz3gjE1UTGG0=;
 b=nPyRTAbXKqBh4K/0TSUQLFakqAVVcJ7kyEacAlzD2bQJctZ4Hp/pBWYjt8F0Dp5l9QXsLah6qMbboxN2KRdUuXZUJbRsIUF5Npn6sD6r1uqQCpP8vW/0D9lTz2XwXD78jQfSSdB8ARbILMsKug1Le01V+EKxV6/jiv8BwXQYR90caQwMItTzAAfRpVG5zXyMJN49iwRqEWgVOhPiLNB+wfPg6G9MPLdUjgHV0tUYUOCYzTVvSujw/jF9gTBWuIl6RtGaZsI7AeSrD77cO09bpTqV9rJQYwxUziQc6SEjSckumQm/RcE27tYHe/gTfG1uFdfJfjnRIZ/J6W9IujATPg==
Received: from AS8P194MB1128.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:289::22)
 by AMBP194MB2692.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:6a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 23:53:50 +0000
Received: from AS8P194MB1128.EURP194.PROD.OUTLOOK.COM
 ([fe80::b514:63e2:ed31:c9c5]) by AS8P194MB1128.EURP194.PROD.OUTLOOK.COM
 ([fe80::b514:63e2:ed31:c9c5%4]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 23:53:48 +0000
From: Ruslan Krupitsa <krupitsarus@outlook.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Krupitsa <krupitsarus@outlook.com>
Subject: [PATCH] sound: hda/realtek: add HP Laptop 15s-eq1xxx mute LED quirk
Date: Fri,  2 Jan 2026 02:53:36 +0300
Message-ID:
 <AS8P194MB112895B8EC2D87D53A876085BBBAA@AS8P194MB1128.EURP194.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.51.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0019.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::13) To AS8P194MB1128.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:289::22)
X-Microsoft-Original-Message-ID:
 <20260101235336.19733-1-krupitsarus@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P194MB1128:EE_|AMBP194MB2692:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb4d763-1a42-42f8-7194-08de49910204
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|20031999003|55001999003|5072599009|8060799015|39105399006|5062599005|23021999003|19110799012|461199028|440099028|3412199025|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7xu2NHLZW9YDywZM0J+5SK+qh/0lrkWwIU89O0XaGliCtJzotlzlrADJmUPR?=
 =?us-ascii?Q?Fc1DHJpB/juEleVHPneOr0X7tA3KbLQGQEw+EaL+RMCE4eH4BektzncGo9nv?=
 =?us-ascii?Q?8M7HQcKtlfvyuXVMi4C3AeN71qJR5Hc6RthckEhAFpTsWQs8cFWMp5UaUapv?=
 =?us-ascii?Q?YJOf08Hws+WBfWm8VMXqNn8Aq5ixAp8/UShAoFJpcnc6vI3aFNcMb4uXs6Ua?=
 =?us-ascii?Q?ryNrqxKRJukRV2sBWYLvF7S9jq3S0wyWzN4A9w8XCQ/NL6F87CYf5UWXEZAk?=
 =?us-ascii?Q?aCemNAyd+HXBXXFdWWZ6GllVijoT9+ldcVgs3n0TP3CNJEXvbWnqvv5Nt7OG?=
 =?us-ascii?Q?T99hWqwPdF19DcQb/0VSVXUbGeXLWafJ2mKRfXYK2Mb1SFSeh80L0HgD/9Wp?=
 =?us-ascii?Q?PSxvwJ8BeG2rNau2DcGM0MyFDTv+ERWAfK2HYDyqXTT+2DoAUPc/FSC758kQ?=
 =?us-ascii?Q?ubuYByiO3Rqub5cgRmYmdGiW0ChSFe8kpTVq2wEd9zQ40mA0T8KFQCLApzZc?=
 =?us-ascii?Q?Px04AoK28JFW/8pdWQu6Rn8Ban1OcONUSskzPFVKqPmHZZ1tyVYHAIo00qNZ?=
 =?us-ascii?Q?FBcwPyTLbp1rfBLD7SYr8Y+SO95oCjS0Pdjf6QSZVYcStScuX9dqHxfJ8E2w?=
 =?us-ascii?Q?aZh/Nv2Re/3w4TH9Z03sU0g00Y+6qNrldqtnTcA5Bz7LX0RfwIVtgu0Ecrej?=
 =?us-ascii?Q?aT6+EhzzKgH5K5qEUHbk6tmjHe4yDRVwDVQR+zNEEW9O5Dvyageva8rupa3M?=
 =?us-ascii?Q?+FU7q5k36uigUTgYbqRd631n09OncUxtZ3oKAE1cuqrvpP4TsPFViLyH3OVE?=
 =?us-ascii?Q?+DZsaRMiV+OEkS8Ym3TOxiESjvoPn7SYrerG5ogvd409fCNk7S0PLO6ZhE5a?=
 =?us-ascii?Q?P4CmFb3DcRwbYHY+mrLl5+C5uk2qNFypfbxYe2x62lL71N8lHSTHE0S7ZxxQ?=
 =?us-ascii?Q?RhOH8YfW3AXqLJXTghNhtX3Ijv9p5qnxlbjEFZFBL2xibZv3Kbs74SsoyOWi?=
 =?us-ascii?Q?bw3yP/OGbbKm26MvP7rmcM/OjtkddYmHFjwXCebEGH+gauLMXlGyN4HzH/1G?=
 =?us-ascii?Q?D3uoChnB7/k4eQcR509fejjx1q7YzTTAuBk2IE2Sp2bpHUzZt/3BeP1Wd7D4?=
 =?us-ascii?Q?wagcLXPGfYE7nHSg/3nzPW/5fRCJXv3llKBmNDMqhM8EgEX7Wm/QfCXXdln/?=
 =?us-ascii?Q?0o9Uy39YAPhDzzZVYZJSVPH7W56o/d+GE7QN4dSH6qFbHJMptY6saDKeg9vj?=
 =?us-ascii?Q?WSuQK1V5TACA6ZpNfGQId05DsqHPmyj2mm5l9AKS0sj+I8LyIljEI2Shv42l?=
 =?us-ascii?Q?IIg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6lK6IJLqvfiRsfzDfJpRpyCMuypJefPISj1AejfnQnH7sYMkzIVfJrp8mCU4?=
 =?us-ascii?Q?Dn4GwlsBi38Y33qv43jaViMwjzIzVNOKLC9IxDHG+2AZpm3Te7mfs+pOfnqo?=
 =?us-ascii?Q?7rzsD/n2bS60EX/BrHVVzdmpaQh0tAhwecTakI/s4394fPKwq4bCj0G5z93z?=
 =?us-ascii?Q?ZmOn7nVqSsrU0cwQ4J7blb/92Bhg5PMt5CZj3Y7n+dOzrIonmDtoSqJvZNLO?=
 =?us-ascii?Q?JlM6CVhZpruAi5QdK96Y5sxa7tR/7SiWS02K/6uCgBCy/zA0mWeNGEMmUhXO?=
 =?us-ascii?Q?B48OMQ1KztfDdsEFE9yO6FQ0xHRTt6+hQzDlZjYrdw/YvVr/seXtdYSwuy55?=
 =?us-ascii?Q?kiNDEJNJZIh5ifTvsuygDDnLRsvxnm5/STvS19/zxN2y7axasutBi9aT4Ok+?=
 =?us-ascii?Q?nTuMdMgQQH5if6sSpAP59YEAAohbdWvw4vZwoO7KtfFC0KJ5JlyUag18Q8In?=
 =?us-ascii?Q?HClcyT166SSDhTqbLgxuiJeGa9y/2NCYKUT61mfncR39Xv3014dBjpqi878r?=
 =?us-ascii?Q?pj7BJunYmd+ja+RB8ZuMf51BSJSg12PvudupwUK1d5EwJTI9bHZWEX4E8B2a?=
 =?us-ascii?Q?MzlUpdkrPCWOQEhruCH1QF3rmvhudhGqKyBDE9bGQUc2d80jzxtAfAwIZ1jT?=
 =?us-ascii?Q?b238wYTLP+B+xbqdyRiE2fuDvc6WUaRRu8fyD5+MnJwns3oaqQPRLyzw1HB0?=
 =?us-ascii?Q?uKY5VfXNnTGeYmFu+cmI4urdL1zGk8swY6OIzgQ9AxmMdyyI526+DmMOsHTT?=
 =?us-ascii?Q?IdqfE801FZ/9MjkNUWN/0A7GTzymkxuYWacm9Dhqs8HFrzljIpOgr5oI6yiG?=
 =?us-ascii?Q?EuLIvCtWhasAtqkYca2jhmTNmiq6a0aoCVBNoj691LaWi1iPRHz7lrOnFOMN?=
 =?us-ascii?Q?mg6k8VqJXUGYgqj2xIaVslzT+kR20La5D4xX7U509KVI5XB72amV3UwL5AQG?=
 =?us-ascii?Q?aybFxUyAZZ6iGKHNjNr5UFgfJNN0kvwrkZR2cgYLyo8RFR7XoeG60VSgQNAg?=
 =?us-ascii?Q?h8K4EfuAopnm5POaVsgN8+xfUB6rZn7Vq7uhJbtVAyXI2GnKp+LlhDFZuAxj?=
 =?us-ascii?Q?GcQPRGTEslg+f5XezNpGgbHvxg2oeOcPYmpFrUQv6/CJdcJyjHV7jJ36UBoC?=
 =?us-ascii?Q?yfOcQb9A7un0w8bzEXr0UM2fYhOWsdFkUqQ4I3GsPahG7V4ocuRJ3fWRN6dj?=
 =?us-ascii?Q?M/97I1aCjsuWtiaMNozNUR4tpiWtPceDPrQ4Z6EXSJaa6yMocDibZkh9Vrj7?=
 =?us-ascii?Q?lGB+jFDj0QccFii8C02W5/c4f/nacpjRi5Bo5KUjpeSCxuflLoCUC2Er7Ljp?=
 =?us-ascii?Q?0qgpMo2XKRYrMaEqynTBa+yKl+jTnrD+By4DAchFeOhfqxqMeK7VY52nUDDi?=
 =?us-ascii?Q?0Mt172nXSv9tMFvIfJp48L4XPb6Ozl41jFcfwgFyXRhdBMPFEg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb4d763-1a42-42f8-7194-08de49910204
X-MS-Exchange-CrossTenant-AuthSource: AS8P194MB1128.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 23:53:48.8993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP194MB2692

HP Laptop 15s-eq1xxx with ALC236 codec does not enable the
mute LED automatically. This patch adds a quirk entry for
subsystem ID 0x8706 using the ALC236_FIXUP_HP_MUTE_LED_COEFBIT2
fixup, enabling correct mute LED behavior.

Signed-off-by: Ruslan Krupitsa <krupitsarus@outlook.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1de46c06f8c2..c92776a2f6bd 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6508,6 +6508,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x863e, "HP Spectre x360 15-df1xxx", ALC285_FIXUP_HP_SPECTRE_X360_DF1),
 	SND_PCI_QUIRK(0x103c, 0x86e8, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x86f9, "HP Spectre x360 13-aw0xxx", ALC285_FIXUP_HP_SPECTRE_X360_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8706, "HP Laptop 15s-eq1xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8716, "HP Elite Dragonfly G2 Notebook PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8720, "HP EliteBook x360 1040 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8724, "HP EliteBook 850 G7", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.51.2

