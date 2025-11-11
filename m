Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8D919CD05
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820652; cv=fail; b=aFaAGrDeEaHhmj7HI612WPXqGtZP/LAHlPjTgfQ2A8BOfWQEtguw4wraix9TekSWSOwkSfS5KSN0gf7T9shvMEQ8MUwep2fiWJ6dkTFn/mQBbpbcihmE5KgdOydDCq7g/6jGYIKpSmk5S6KxNgNuA/wl9Flzt9msi9xPm1fC+/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820652; c=relaxed/simple;
	bh=eg5OOTZm1jamoWKX5qY4xx4UzFQgg0pkLEkPnx6NpyM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cYgbpotq5Xw74xdoSBWYmT+J0gDk9od6d0CXM0AXxw6n1LIxm0JdPdCiofxM9y54VZGKNT5zqgcFcN0gVit3+NDk2atS4m8udZfSmuZkZ72fztYyP8JAmSG1rdP1BO0zorpwxaYqL9dfK2W7jCDCXH4rMcp8ehRvG0xPP8bkMgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UsBR/Y/O; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UsBR/Y/O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNguL3f58SXZkL5Wttj8IybBmPzojNAJk1EA/62sJaYFJZmhoDpAc9QEd2W3b8DeaNlBhtk7RL4JJ+O3kLRhiFnDeVAgtTEpJVeWKyeQqvnrFeGjo8drbXzW4Y+PvyqqsvF1e67BcDFXVkO/GCc14P9MrvtOfwExGL29XT1nvN6Sl31L5vzeV1yQHE4mMjNuirT63lCCu+4LbN19lG61UBlIyRInvS0HdVeg6tznXIYaM7DVhlpbSPvths85Y/pY59XQqTvEHaH3dBK5wH45AH9bVOjvywnzqMuxtfRsWxLQZoNP7l+fYJ7wofQgE1Bjokl+rpDYJ8QIwRQEnFAUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOL2FQ77ZMt7BTP/lXWWa3doDZdqjCc1vzMy/usP8Pg=;
 b=t7bqd5jctKyxwBJSgn4RqfAriD5GTxza1kBh5mSaAzBtsvUMp/VPzc+ZZt3B8zLvUD6lSPtaLMyqR8OTr+Q7PSX2lQucE4WTt7LXkcdR1wXtYOcd7OMIkCP2eNOlRvKadRlveWYHN1/WHzwwOayF2lpEMAuPtaPAu1U+vjYNrONMjdZnnKdpDdPlH6ZXz3FltA2HSmpiDsU28xuYGjlUdRBxoK6ckFXVawiZLJvuFGhHf9Ur+sbszVmH4yPB8T+l5m+RhAwWpt5O8nvAUvGF4Y8eIav8xsi9xYQAwyQR1/HynzGNXsAb4VQka+LfA/orwQmuXtiQO23kbK9TSR9dHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOL2FQ77ZMt7BTP/lXWWa3doDZdqjCc1vzMy/usP8Pg=;
 b=UsBR/Y/OeOCb3vl7LP7rlNFLDZ99uF4rTYSs5wxpSf+Oer4oBltOmEgBKzg1+8mN/PZvgDOVIP3LWsjc8gEkrpUrxQkUtuIGxW8or2GvF745B0BHLlJRSFHvRlrxJj58ek02B0mvv8jTI9sZTW4CcdwO87PpKRSmnm3bmU86cjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:24:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:07 +0000
Message-ID: <87ldkd4dsp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 093/292] ASoC: codecs: nau8822: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:07 +0000
X-ClientProxiedBy: TY4P286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: ec228ce5-bf94-48e3-7f6d-08de20b8a083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j/OW9E4zdangX1gP5dqMaekQiwYNFSmRX3mD06slA4cPIX4z+dRlkZnWp27H?=
 =?us-ascii?Q?6hG8zXBxwQGEZwIErQ+eiXeOEOzrPRsISl+/F7fwA2YHhfmCtHeA9iUnv1cf?=
 =?us-ascii?Q?4ZZu5a3EpVw44xG0Bz9EwSSXyj6T/ur1hiZTe/mywJi3DiFUra83U4CtE0RS?=
 =?us-ascii?Q?n8q+fKUxpnas5DVC/UGYTLmf15X9P41TmKwwwUfjoaU7c9bz8Xt1IqitUOHq?=
 =?us-ascii?Q?05yigteJlZcXzIlO65Pgr38AWWjPO+nKROHCtVD1Mh4Ykx/mMelbCSg0prhv?=
 =?us-ascii?Q?0NCwb8RyZW6lBnTB6793a04PvqsoHDeodg5qilBYEv/Cq2g5je77IwQQ68f2?=
 =?us-ascii?Q?KHBFF+gFzvIp4w6OW/GxDOnXImr43GvtNraJpc5MhlZF/SSAPEBEzH6hHpg/?=
 =?us-ascii?Q?fSe+rQiiRIPOuDW0wXLgaSiFrkWdQRi8XX4rJa/ol91syr7MKigi8iMHOG8M?=
 =?us-ascii?Q?ggjitXtGC41Vbkvg5rO2JiVb+4oorYR3pMc9DqWrIavtU3fztlolyjmFHvci?=
 =?us-ascii?Q?wTqQA5AYYuK/U82RBLuy50fRVKlARX0WCnVLWFOftwo/Sq5OcpivEHFmKV4l?=
 =?us-ascii?Q?Q2DawAkbLyc6zMWoGP+0evSBIN5FKJGU83baeF/SLbcItMFTH87/NbQmV/oT?=
 =?us-ascii?Q?ONN8kkFEMqLzI/hin+Dq6yD/6pizTQyrbCyMSW5FP3mNN3LDc1tcgJhCwcfQ?=
 =?us-ascii?Q?AOe/jqSY8YEMr0WRiFcBw3d3ZuPhkefTQHL7KyEYOzn3BA/U7E46Ql/7cx0/?=
 =?us-ascii?Q?NMbzRLVnhw5n1wJU8E8BTwd0lWxpomRcFr6ynPIHONmPxBpuknuATcYmhYZ6?=
 =?us-ascii?Q?6aaCNJMjBgjT4qtFBICEk/Cs1zesV0va5zh6zBgHd6MWWajSYcqHYJN6yEXe?=
 =?us-ascii?Q?aP2gLbp0zjeTXt7YDQyEmlATgsSanmSiixCPBfGaDWn+o0T7biBHeztRaXqP?=
 =?us-ascii?Q?jPwmgbJbvdvXxDfcxMjNwwOvyOzXa5SnS6BiNwiK6e/ASz+z8bLcveG5ELTp?=
 =?us-ascii?Q?01mefp1+aKJvbNx9LGNIieQguF6Q1l1FAqa5Tprv0Mk2oVVxC/jUiRcPvirN?=
 =?us-ascii?Q?XozSNWN/2tHk+D9YwM+hgLN1kCxJAlghf6jId9VR9Lyym575Rzfq8i5wFJbA?=
 =?us-ascii?Q?TtkOxG0hnUiNcwEyUQMq+3MFLuCCtZWjdM1egl7XOQu1Pz0WynUdCgRL6t+3?=
 =?us-ascii?Q?V4Zf9K1EvtHtZ/2PYA2C3FGCfBV0MN5bM/sFNrP4fe5sY1YAvY+hFZrB2GSu?=
 =?us-ascii?Q?DWa9IKlqVxayksstUegYh3XtY68GhyH4VoK08lMXslIK4SgCxSJgTVKSgexu?=
 =?us-ascii?Q?VpZlj49n/zEVYQJWLd/Vg6pjm6A8G5IyMUXg4oSAMo5nIsUaQFN02c8wYO/Y?=
 =?us-ascii?Q?YFIE2lwxnnvlZRFi0AtRrsa5dJe0wBhOy6sk7F14DdHo4AnFYYWe2bCFPIcO?=
 =?us-ascii?Q?aNhxFDu0wCKre4doJr+BIO2oAq9DyPqgwPP93vU9UBYxQ3tSAdckYnukYvAT?=
 =?us-ascii?Q?/jk021/92r6h+axyYAnUimAhIB+8yCaacbTU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uEd7imZBr2mfQyDSyf6AXrqmQzUbrxDiUH/RSNTKYpkwN0baOiTlX6d1RNUl?=
 =?us-ascii?Q?d0EVH7lGOIUwcgXGRFYc/xsAnb9i5sMVqTlBrl10mH9AZqU/YOB6cXzBNp3b?=
 =?us-ascii?Q?tEJyX1zFzh6gNvlIIyv9knihTQYlBDI6s1ThLAqvW3pwqeFx4P/fUyR83Mw2?=
 =?us-ascii?Q?vAsDSJa+t3CCJAhN1UFp0CJfLbje1AHMUB9JwjquVFzSBCdODT40Fhlch3rR?=
 =?us-ascii?Q?mzsBrj4kunBGT0J+RUsxUoCooBFhBUkOc+icdWmKRTe6OeyyMDIKHG/5YwZb?=
 =?us-ascii?Q?bXBY7y28euDGYnwVS+9Uzj19RONslIYJ24cJkuBCWjI7j81i4983Tiv7HTgP?=
 =?us-ascii?Q?yrN+kxEhJGTDYNYWRGM6M3bbU5xpun86gauO7Vp/Tqi25BGEVIEH7S1Vb7D1?=
 =?us-ascii?Q?Oqd+eXtxwayXn2fdudVEi2VKKSymZ5hHkzd7iGGhhYlsQwYZg6YcObIzq3+G?=
 =?us-ascii?Q?Lplf05HCbZUX7+/hug9PlVli1/XObn9WRs2rEd/CxO8GhDm8CZgp/udy90PV?=
 =?us-ascii?Q?IPh4aNe8yyro6oOcM8EJ/qpLYHjkz3xWYXIcAXtWpPyyKC1FsPP+ZgCTetdi?=
 =?us-ascii?Q?XmeZ1lqR4yOJCou5/slnstk4g9SupC6xhWfiTT6LZTbye6wowmSSoW184oOc?=
 =?us-ascii?Q?xqmwVe2I4pDxeAfWpthjfK58ZavH5sFZe+vgHDn5Gku7uNEcxhwt9wRiiIxZ?=
 =?us-ascii?Q?OzMK0VreyE4SUDq/DJJRsxsdoHvSZYSX5h4tRrzutzTdYZeFO1z0FOekLcTn?=
 =?us-ascii?Q?De6iYQumP+DDFt0nOTE+p8lvn8EZYZ2EiKrCU9C9YOrvBd4mWExcoooaxOMu?=
 =?us-ascii?Q?rRPy7RxCIvvIKV6w4G3TpPwV/CCW76LB0Gx7HbedsQlB21gCP1PfyfhBo/Ys?=
 =?us-ascii?Q?nVWHnCvKqAk20AQhle6WAS/cx7DNHh/VaJdLYtyJOyeDKtn1FCYRHcvxxpm5?=
 =?us-ascii?Q?UtadEMOrlahjtldG3Je1xnPdDiUXN5hmqauIPeekZabrlK4bBsE73uK7P+OX?=
 =?us-ascii?Q?i5EQqxA93nFIwM7oClbdfgQ5LI+U42nzbvzzHWsmivM4U/ZlUbDHfhlyVB9d?=
 =?us-ascii?Q?sc3Fmb/AI/U1Bm1YC3DJ5tLuq7URPZLpOD6IuS52VMAOBqLKLq5QVlUMvvaE?=
 =?us-ascii?Q?xJ1Hv5cPxYcwQCShrXlSnjM9oQwfzcmFhzs0ngm4Rpu0PHrz5y3vbyWKtJqj?=
 =?us-ascii?Q?wf/UjU0qcsJw+DDu59ldcGiCL9rufFfVBj5OZCnxBP2bdkOxDWPB+dZYE6tm?=
 =?us-ascii?Q?evE/B54CWbhG3BZKW6yfWNk0wHXKd4VaWx82m7oK9hM1913f8Y0BPGC8ewEq?=
 =?us-ascii?Q?vC96gtYJhibtkmmxA0PfLBLRzFD0H7AoPhOVbyzJ/ePI62uKBPdwTDP1DCRx?=
 =?us-ascii?Q?ErrVEdIbf6nUQtPZ0Huiojck2Ex5fJEsFeGDkihg1txolHz0VkuOgh6rj2yU?=
 =?us-ascii?Q?A/DPmyF0OoLEK7zCQ1upZkyZ5tt5DmOHjscCsxxPgAevZlqcpiDLIf2p9wsL?=
 =?us-ascii?Q?jmLNupZXnqRJeFJb4o+aKLFBpXc5MudvglS3KS4sU8FihJSq+Lz8tC8ygUjB?=
 =?us-ascii?Q?6qyRGGuBrMUqppNuZ9FzSai9r+VjI7otmO7v7l1OPXOAeVe32/CGeinY2eXl?=
 =?us-ascii?Q?y6OrBxWT7nQC2fOeANYrnK4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec228ce5-bf94-48e3-7f6d-08de20b8a083
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:07.3028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1h5KRdXELwD3AqlCkpWc8jB+Wv2UDC9o3t7//27ez7tssbIiAYHnq3fuKK0WncLeSog/hntcvv+DnWgvrxj+/EfEPhKwvNnKiOBZQsV4n3sOdI28Wxgz/+ucVHis7d8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10376

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
 sound/soc/codecs/nau8822.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 0373167c25f44..a11759f85eaca 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -957,6 +957,7 @@ static int nau8822_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct nau8822 *nau8822 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -964,7 +965,7 @@ static int nau8822_set_bias_level(struct snd_soc_component *component,
 
 	case SND_SOC_BIAS_PREPARE:
 		if (nau8822->mclk &&
-			snd_soc_component_get_bias_level(component) != SND_SOC_BIAS_ON) {
+			snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_ON) {
 			int ret = clk_prepare_enable(nau8822->mclk);
 
 			if (ret) {
@@ -981,7 +982,7 @@ static int nau8822_set_bias_level(struct snd_soc_component *component,
 
 	case SND_SOC_BIAS_STANDBY:
 		if (nau8822->mclk &&
-			snd_soc_component_get_bias_level(component) != SND_SOC_BIAS_OFF)
+			snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_OFF)
 			clk_disable_unprepare(nau8822->mclk);
 
 		snd_soc_component_update_bits(component,
@@ -989,8 +990,7 @@ static int nau8822_set_bias_level(struct snd_soc_component *component,
 			NAU8822_IOBUF_EN | NAU8822_ABIAS_EN,
 			NAU8822_IOBUF_EN | NAU8822_ABIAS_EN);
 
-		if (snd_soc_component_get_bias_level(component) ==
-			SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			snd_soc_component_update_bits(component,
 				NAU8822_REG_POWER_MANAGEMENT_1,
 				NAU8822_REFIMP_MASK, NAU8822_REFIMP_3K);
@@ -1053,8 +1053,9 @@ static struct snd_soc_dai_driver nau8822_dai = {
 static int nau8822_suspend(struct snd_soc_component *component)
 {
 	struct nau8822 *nau8822 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 
 	regcache_mark_dirty(nau8822->regmap);
 
@@ -1064,10 +1065,11 @@ static int nau8822_suspend(struct snd_soc_component *component)
 static int nau8822_resume(struct snd_soc_component *component)
 {
 	struct nau8822 *nau8822 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	regcache_sync(nau8822->regmap);
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	return 0;
 }
-- 
2.43.0

