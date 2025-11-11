Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BBD220F5E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821201; cv=fail; b=b6s4K91tWdhazrq+QQsQWjtKMXFVye6yPSvk9jwNUA/MyZVRfgNG2giNiKS1QEdDUrcMIz2z7qU0jbpWDpCFT5Kpe/Ii2gczwqB6+acJjjYViutmw3hDbikNejazVJMoATbRLt+ycXAfb4wggHekygGqZG53/ockSN/5BPv6AgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821201; c=relaxed/simple;
	bh=y2gu9p/lgR92k8HZKInzGhYbFZVZ+lt997BlPvT6kSc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=T78ZoGS0d9STVpFa2ZFej0WLwXtRFugDN5JOqUuMXbMz5z3XtK6+p2RFhiFUd1bM9AfASFQVZW1JWpf3UDkZgN/CpuEpNCktRgYiUPXpI++pGop5IMhV5gcu1Witb2CBj9b1QM747/Rv8m/QY7qoQ+tPosFZ/GST/eS8NvvQAEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cNqlmecI; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cNqlmecI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIrGmG6vokPxX2fPiGb+3fNSiQZQWVAGRcA00dC8rB7F8pgsGFIJjlAt07uB88jMUP+vnQGFdTdTYv0hMU95KRo7I+BpztLfNT0gAluKUyibGkyuWnYOX5WdXf9ZSdTaLj6VIg6r6Dsue3goknMNrKbHpz45zrXuCinCXoaYLU6Wd3l9D8gMHqkFCwjjVUM8MRja0Bmq5Gwr4MvcANhnfgOemfapvLuZ1V/mxR6OEPD73VnMrjWYB7y6IQkNoLIA67kNUNfvHWOUjeJw1L7kpgZmORjU0NbJfMiCn4aWDG+yYZfmXAoA2oaT6UbLW902FVDLtLix98wA6TuhLtrl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAridLuXy9QBsQ9WTvA5A7ka31rfukI8R2xfzZ8XiCI=;
 b=XlnZgzqW5ZkrcpViHoi0x3pFhxFLbkNBt3t8PZGYCzeolnO6Z6TEBeF77f6lGSgBphz50lisfzu6OodY2soOSQSJLj1iIjNHZ/g2c76a48AyTfKJcMuGcrwDSLZBvSgD1x6FB3pbQ8enUO/gAJZDabxGBvvweYYmKto+koOe/YRH/Df0vEXO8gmjU+XOJ3o2ie07xQPObfTMQAMNkkOkMkzwzu0xGOAOg26JHjii/GMZQYkmHm0QW8mzYdQJuexM5B9F2Wlpfb8hXAklJLUbLzhrEsliEAxyfo95SaXmnAjnTZ31Id5OYpdsMxTFedvSJLtA0qoeAz5hai3gXeKzcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAridLuXy9QBsQ9WTvA5A7ka31rfukI8R2xfzZ8XiCI=;
 b=cNqlmecI/NrXRO5oPCyLFEY+WONIglJ6ZnHNFzXTKTcm3Rd9Pp2GddRr4DvxpEldcKcAPJwpqdNFWirDg9z1tbB3h+4SCkkYcJAlXn+vH/m7HE7/aww9faZwFo1JP47Qtay0rcmUCfIH1ZcyROqRQavugv5I742Al8DjYga/U6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:33:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:17 +0000
Message-ID: <87cy5pwgqb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 224/292] ASoC: intel: boards: sof_realtek_common: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:17 +0000
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2911ba-31f9-44f7-cf6c-08de20b9e86a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OobNa9Zm8cqayTCeyjOm7TzBlPDo4oWbk98jSVgIKyhhMR/VYXFk7UKWf0Ao?=
 =?us-ascii?Q?6XOw/Slz/4/TYEC4vW/+IBp0YI51skJRXPFNtYt9gFW8I4bEZEAN7DWvDE2S?=
 =?us-ascii?Q?H4WGJ7LCRjM5HO45tg5Bqngqmh66yHB8VwMh+DVF29ixauEfYo7m0moXsE5U?=
 =?us-ascii?Q?vbD0N5yr4/nYtjPcn0S0ADRvmt+YDy6fE9Jo5XKcUpilRbNTKDExeicu/kP8?=
 =?us-ascii?Q?eI182i7GlUxRsE0zwEgxQPl/EZOl5zndxM/5WeCUSsO9Ie2B+Izv/sKsLd7L?=
 =?us-ascii?Q?dPqT5zSqwrKaLJOIDaEf8JjB9gcwX7h8twBj18r4kHqe69gHIaKaP7ndhBLw?=
 =?us-ascii?Q?yt9NzezJS9Zj0CIqN0lLnCTFj0qalOTbOlsqa9f4aC+uU4kB9k5BVUD0kIn5?=
 =?us-ascii?Q?t5J8qqAJ85nhgjVc5FlqmeqXiAxTVLaGOQXTjVuzBNKgGUOEXxMiVdU+tXji?=
 =?us-ascii?Q?296GFaBAEvQAEAQNGAs5nsf8ei8C7BwswXn6IFsSvu0+jHMN9cIdxxKKUc8P?=
 =?us-ascii?Q?7QWJRjG+kPivuJp4xYtb08cTJVAr7snIjz9Q8QwNJRumzgfRLqlxfnGUoMTM?=
 =?us-ascii?Q?3HJ1gkdYSE5dTSZ5/yll+Tibb0Ar4u86lRE3kAUQ8W4dd59izjhRrGL5jkWP?=
 =?us-ascii?Q?kx0JVWuFxifWlx/sFX4liYE3VfyrqZF6fmB4lePLGH7OGk+APsOhoHZLqrW5?=
 =?us-ascii?Q?lCqJsK3GEOhHTz3mP3WtM/Uh25y8GEXWNOeTuDPOA/XKwzcw91gqY+usa2Ey?=
 =?us-ascii?Q?MgFLIV4A2jSzRHbATKKy7JSwfwxl29CadY7uMpA/01yKeMR4XfLjQkktO64i?=
 =?us-ascii?Q?nFUJ7FzHgtnT2iguJBD0QUbVS0oD6B35rfOJCYHjLpOgqM1EFaXf/tutsByL?=
 =?us-ascii?Q?CdaevWPh8W4UnD5yXtW0bKeYm7pmn18+0ea9mTKSvJ4N0FgUzpQJ3bZRw6vc?=
 =?us-ascii?Q?uSy++Fig0mXx0m6MTLr/l6NhDX6xXJNAVcsUJDB3XZZzbrm1buTz9J6LQSdH?=
 =?us-ascii?Q?F8uF1Uq1s4ME4NZmRJ1bhlgwziv0YfMLf+IsFno1Ok2rdIM4vHect2jbLsKH?=
 =?us-ascii?Q?OCzf53gg/juq/CiMi+y1BLyyfACYCtHzRM5tuhYPqT+Msw/QjklZ4aOLD0NK?=
 =?us-ascii?Q?s2II9puR3TFQzw2vqHoOb4+Li3QIFPOEiMHqXva25Knd515tHa6oCdUgmptw?=
 =?us-ascii?Q?4Fz9IBoh49pSVtWiPN9ZcMn/LbIVRFQGJlHz/pH8ldpO0LVv8fc7tdPuUAG3?=
 =?us-ascii?Q?nkCirO202XZM/MrWsxShuge1vNlAOsKtTpGfdT2tKpi7mbisscFj/Bi6fuSa?=
 =?us-ascii?Q?lM3xbLe6ZPXL0Iw7LAL6urhjt3PKJKXRHEEI1MiVtgsaorTFV7AHvDE0BsKV?=
 =?us-ascii?Q?khLHH7SXT2aHdO0seygOA+wHzaQJQk+DFI3wbwExvZtLoKtACK/jdpMG4JD8?=
 =?us-ascii?Q?RpVzr1NAwhanisIcBxNuucWzunE7D6EZWwOOdtu5jh8MYhC0ct0shfQSc1Jy?=
 =?us-ascii?Q?YodfWfDh5nPqJfuvRqlTf8B8IlqN9z3K6022?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rqfOGEk2EytQWRFIXDz70jtQfrhTrZhWPSe9FOjkRaSFFnKXqno9xr64b5pb?=
 =?us-ascii?Q?b93bzhtpsQLbXPcdRcy8Ogdsaqt78Du9mp+RR2SNbnvaa3cphiLCi0KOW8Ya?=
 =?us-ascii?Q?tlONqK/MXEqqY/CnX4miqSrB9vd1FfyuXLclWSSQ8/IF7E056z5W87oUmLv8?=
 =?us-ascii?Q?mB2fnEorlHoYbppiEeL++Cnowa0mG/j1I7b6S4YrdTnhdK1oKjLG095WzvK6?=
 =?us-ascii?Q?oPgkNQdfBDAaMYnX+rwwPSQkyojWP58hrslJhqdcxtbwQXZcV/2NNvXkB4sA?=
 =?us-ascii?Q?KuqiO2cAL0jVYh+rlCCzuEqsF4Wz20eH7bVwoi+ZDQWDB5NZJZmsPBioo0RI?=
 =?us-ascii?Q?rJXrWStylRr2LdbBt6pIOW+zQ8mkRe2fenxGnMbnaJJltSbg6dsz0mmGQC4I?=
 =?us-ascii?Q?YQHcEgQhfQvgtxowxleRILdELfHhVcPc0b2Ox7qeP/pnOoaewThV80CfcV6L?=
 =?us-ascii?Q?KEvvl1Ox+ev0sYWNULrgwYXLDTSj5QePn2i1Yq8dLELr0jR1CFNb2x0b2Vsp?=
 =?us-ascii?Q?2IEQHBHuGbktFCUrIZ6Q1ZH7hI9xD2eE/iZR/xFsbF8wAFVC7EjKtOONzlJh?=
 =?us-ascii?Q?kGOE2F1ROVZgKaOn+oOBxkLh9Cnca0o96ILu9ZPjMfHXXWf5J5lYjHRm9LYH?=
 =?us-ascii?Q?DkuC8wEm9wUwX3KvlrOsOaaXW/8pmTpoOs/+H6XxuIvO3VaVa0cuQA8pXI1m?=
 =?us-ascii?Q?Af7nofvN+Zj3GQqK4JXjPhUDsKVVFPLVJTyQzV5mX67cYp+lTrkCY2VLh2Rv?=
 =?us-ascii?Q?6unYl+lP1O3pT4uWLqpszvdxudFWRbyL1IzUYcNK+xkuUXMi13MVVQPHdzJe?=
 =?us-ascii?Q?iDyf8skcZIZPYv6AfjU+BQ5UyPmPLqWC0CyBA10/lHVFjh++nxrmmWfgglrV?=
 =?us-ascii?Q?E/NZdj3rBnV03qlCF9ggsaHVdXBK9Jnvenp3VdskHL4MO7A5yiNnS8mwo8Qm?=
 =?us-ascii?Q?/SyYSXu/XDjvwQMuIwiFEI5jYCJrUl2KmCvJSvzvxv9T0aJyCrS9WAbvNLZy?=
 =?us-ascii?Q?W/wF7kL4uLiZphJK8WyiBK6XvU/7d845/BH/emW1jfJOaZjXkAWF6TilgOIH?=
 =?us-ascii?Q?LP1wGBs9g4+gfnvtJcwr+mWa2w1kOHyyZpekXWjZDpIIv1AWGo2FWCqZOZJm?=
 =?us-ascii?Q?E/ealghC3OjqbLD+wuvR2gEAiKusSO5q5nipAFnb8FMeuip8wrKqnr9ry91d?=
 =?us-ascii?Q?WOerFjRlakhXtKqEq+29VTAk1xOUFavedq7WSXR3O44MZ7D6Szaj3Npy12qv?=
 =?us-ascii?Q?22ZGCbTZdqKUzqpadXk6imBpPqXPz/ZpGpDY6Y6VqM3y0H6E+Tpqdl71PBN/?=
 =?us-ascii?Q?eQtKlOOGgAM8FUXrAjv+lhunVKQCAlOQjw6s6YIH/7anWS7OLTc1OK4hpfwl?=
 =?us-ascii?Q?zmTjR0x+wbVVhJLKSenrq7Ypj3+QuXlEf/1jfkFaiQfB7JYQLlydfp5fO/L7?=
 =?us-ascii?Q?II9xKjO9Q79MptVkp+96mfLCGx4UiC4Y0dtFsxm6zQ8sWDkXBid3LSEwupPb?=
 =?us-ascii?Q?jfgd8VqjkwSnxgmqNRYlgwMBJX3Hq+EOEOSpMkObzHqcvckI4+f7RO2BhVa7?=
 =?us-ascii?Q?6FzDkx8JOyI8r+ZWuVeChNpsNFaFn7ZuKFWxu9FTonW674lzISbcXGuIHMrN?=
 =?us-ascii?Q?jyTCxeqMr3lAY7Jy7zlNgDg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2911ba-31f9-44f7-cf6c-08de20b9e86a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:17.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xP5mpZu2cENHdIwl/Lf5RZvDpe6YgmQ+ARTZt86dx646aq9j8bKeOOB7mRpU5ZEkYJqRn53ANwDB4DJQqSL6swgPWz5Uzk7Az++sKW4dpeb1Mx+Js+BG8ZCINe6g3O6C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/sof_realtek_common.c | 34 +++++++++++----------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 600707d403b9d..835186cf04d02 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -186,13 +186,14 @@ static const struct snd_soc_ops rt1011_ops = {
 static int rt1011_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	unsigned int num_codecs = get_num_codecs(RT1011_ACPI_HID);
 	int ret;
 
 	switch (num_codecs) {
 	case 2:
 		if (!soc_intel_is_cml()) {
-			ret = snd_soc_dapm_new_controls(&card->dapm, realtek_2spk_widgets,
+			ret = snd_soc_dapm_new_controls(dapm, realtek_2spk_widgets,
 							ARRAY_SIZE(realtek_2spk_widgets));
 			if (ret) {
 				dev_err(rtd->dev, "fail to add rt1011 widgets, ret %d\n",
@@ -208,7 +209,7 @@ static int rt1011_init(struct snd_soc_pcm_runtime *rtd)
 				return ret;
 			}
 
-			ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map_lr,
+			ret = snd_soc_dapm_add_routes(dapm, speaker_map_lr,
 						      ARRAY_SIZE(speaker_map_lr));
 			if (ret) {
 				dev_err(rtd->dev, "fail to add rt1011 routes, ret %d\n",
@@ -225,24 +226,21 @@ static int rt1011_init(struct snd_soc_pcm_runtime *rtd)
 		 */
 		fallthrough;
 	case 4:
-		ret = snd_soc_dapm_new_controls(&card->dapm, realtek_4spk_widgets,
-						num_codecs);
+		ret = snd_soc_dapm_new_controls(dapm, realtek_4spk_widgets, num_codecs);
 		if (ret) {
 			dev_err(rtd->dev, "fail to add rt1011 widgets, ret %d\n",
 				ret);
 			return ret;
 		}
 
-		ret = snd_soc_add_card_controls(card, realtek_4spk_kcontrols,
-						num_codecs);
+		ret = snd_soc_add_card_controls(card, realtek_4spk_kcontrols, num_codecs);
 		if (ret) {
 			dev_err(rtd->dev, "fail to add rt1011 controls, ret %d\n",
 				ret);
 			return ret;
 		}
 
-		ret = snd_soc_dapm_add_routes(&card->dapm, rt1011_4spk_routes,
-					      num_codecs);
+		ret = snd_soc_dapm_add_routes(dapm, rt1011_4spk_routes, num_codecs);
 		if (ret) {
 			dev_err(rtd->dev, "fail to add rt1011 routes, ret %d\n",
 				ret);
@@ -344,9 +342,10 @@ static const struct snd_soc_ops rt1015p_ops = {
 static int rt1015p_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, realtek_2spk_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, realtek_2spk_widgets,
 					ARRAY_SIZE(realtek_2spk_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "fail to add rt1015p widgets, ret %d\n", ret);
@@ -360,7 +359,7 @@ static int rt1015p_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt1015p_dapm_routes,
+	ret = snd_soc_dapm_add_routes(dapm, rt1015p_dapm_routes,
 				      ARRAY_SIZE(rt1015p_dapm_routes));
 	if (ret)
 		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
@@ -481,12 +480,13 @@ static struct snd_soc_dai_link_component rt1015_components[] = {
 static int speaker_codec_init_lr(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	unsigned int num_codecs = get_num_codecs(RT1015_ACPI_HID);
 	int ret;
 
 	switch (num_codecs) {
 	case 2:
-		ret = snd_soc_dapm_new_controls(&card->dapm, realtek_2spk_widgets,
+		ret = snd_soc_dapm_new_controls(dapm, realtek_2spk_widgets,
 						ARRAY_SIZE(realtek_2spk_widgets));
 		if (ret) {
 			dev_err(rtd->dev, "fail to add rt1015 widgets, ret %d\n",
@@ -502,7 +502,7 @@ static int speaker_codec_init_lr(struct snd_soc_pcm_runtime *rtd)
 			return ret;
 		}
 
-		ret = snd_soc_dapm_add_routes(&rtd->card->dapm, speaker_map_lr,
+		ret = snd_soc_dapm_add_routes(dapm, speaker_map_lr,
 					      ARRAY_SIZE(speaker_map_lr));
 		if (ret) {
 			dev_err(rtd->dev, "fail to add rt1015 routes, ret %d\n",
@@ -561,9 +561,10 @@ static struct snd_soc_dai_link_component rt1308_components[] = {
 static int rt1308_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt1308_dapm_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, rt1308_dapm_widgets,
 					ARRAY_SIZE(rt1308_dapm_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "fail to add dapm controls, ret %d\n", ret);
@@ -577,7 +578,7 @@ static int rt1308_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt1308_dapm_routes,
+	ret = snd_soc_dapm_add_routes(dapm, rt1308_dapm_routes,
 				      ARRAY_SIZE(rt1308_dapm_routes));
 
 	if (ret)
@@ -650,9 +651,10 @@ static struct snd_soc_dai_link_component rt1019p_components[] = {
 static int rt1019p_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, realtek_2spk_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, realtek_2spk_widgets,
 					ARRAY_SIZE(realtek_2spk_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "fail to add rt1019p widgets, ret %d\n", ret);
@@ -666,7 +668,7 @@ static int rt1019p_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt1019p_dapm_routes,
+	ret = snd_soc_dapm_add_routes(dapm, rt1019p_dapm_routes,
 				      ARRAY_SIZE(rt1019p_dapm_routes));
 	if (ret) {
 		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
-- 
2.43.0

