Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE93124EA90
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064115; cv=fail; b=hem5Ts9nad6RtrWVrBknlb6+5cjCfSMJpz7CzKitPlKppshWQPUt1+Cpmko+rIRHnkIRVpZPgwma2JTopOXIvZAeYX1/8f90bIZbIwnGme8MoyVLTLzRvIdLVexgkMRVoZg5wlCzODHH/RWEOY5P5esFT8HUzMCYbhHxJ97hWoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064115; c=relaxed/simple;
	bh=IEyGR3sij9SJj7Oic4XpFCOyGHzsoAJbKpx0x7K+tR0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=H4aIE5fa3WeAwWBkrpGWGQU+KWyuxKMWNAda63aQOcS/m4irxWSF0nNc5+4pOaIVcjasFlqpn8DwFhoAJgjtWkosFiqqrRF3yZhC6GaEvaQAWKAeUUWMlAswlIMrl1wTeovngGJq8pkKJ66HunrWW1XR3Uzr5ROg5sfpMLvQ9eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U4eW7/Ph; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U4eW7/Ph"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhuyFjqEeVXVGNQsBE8WA87BhAMwX0NYcZDwE0Ta7NBgJcPZM4O2aLL3oD++o0Q4MABiM+GW8LaLFaKt5zVdHN1VnYbxKkdMeDTxV0FYF537qEXLin7asmjSuv1+VQMXvv0JAik4PhT4MbKHtNzpx8eFZUN+qVG7ihDyrrRa5wgew1tfRuN3xKA29EziIwucSRTuyFADlNn58tmIv+AymYTFTwTEPB1woYOtwiKkkGdFYieQH0rz2FkCWOI3XJV6n6H1tuIo7KDwFayBMuiEjmJBv9/SE2NEpzW/LqeMHtiR3TnGYogcbCj5wpvgRGMRCTzClRQrP/Iyv05rWWbTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5P2XpBNwWR2qKBBVy5xF4G9s9gEMySd3ZUolPEIDJY=;
 b=zKZTkT9TC53CCi1mAJkZtYyY3SzGGf2T7Onp9q+7JKGwUPMjOZm08TWU0TVRglfRx2A5HCYQtqYdNLIQ93GkEac6iKIJwCvaiQjf4svOm2RajagUH+0pjaffAyuUt2Lo+tY71BFcn9240PCW8RzD6hCFc5GViQ5F2o9Qih1Y3Q+Z7Ghdt0wfAQDgPxv8jhsVa0Ee7CPZHvDTQERjXqIxu/oRR5tfaX5GXw67A2brHYU9NvLTPnh98BSAdAUpKiFR+MzZ/XgNcubXMvHDgusMnP/+thjsXYhISudWpfxGNt4GEgtZTWfVZZ4gOYX3nOUQ7uM+8gO4ntmPC5OuePoIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5P2XpBNwWR2qKBBVy5xF4G9s9gEMySd3ZUolPEIDJY=;
 b=U4eW7/PhRi49Ac9yUh41/mKI3aZ53cJhfvxla+gSo8iQcx+TWgumsklLMcSddb7Hh0GZnIy5kfIASCxYSjx+4pqTHJa/IQoDoJTF+vEPzSADcJtnx8GLv/hcjgvIPjWqvHQvKArW9iYCtEs7LjgPQX6a+08F5PpagSu7VXBTYRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:55:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:55:10 +0000
Message-ID: <87bjbeu4uq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 22/44] ASoC: codecs: madera: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:55:09 +0000
X-ClientProxiedBy: TYCP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: c8161b1d-34fe-4679-dd90-08def41e87cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	+taWcDFtH+d8N3+vPYMKHNbrU9h1mRbY7FrMB7YPw4Wd/6HGL+vUK5yBo6MRTpx26yUA3Sm0+Y0VBBKF08eACgmcfE5xKws3/MhMTr/pJ2ehzkQZMVZX3TUCTJsHYZC9Bd/gMcmpmsAh9sC5R7DzB+flBdyhBDU2jikdKxfWHZvagT2+STpOduQce3a2P7WAG2Xwqj9j1Qg98i+0OdQ//hndxc4qhzACecgIeUdibAu7HiI2GHiBWtY0F8UA53MDiecHfXNKNBJtMoXaitt/tvV08mW/8/3XubIPQQbEwpTYue6tQBJvUEu0ryZZOxilJn/Y7kXS3jR1buQX6L6CEDD2Cx0KXNSxCbx7MbC3w5T6jX5xyJQF8M+Q7/djZaDoyEbFnrhToiuWOHY3NLsvwdcG+jg9SYmdBoHktu1P/59hlEu+atSqb7ktot53Zoj/RH6tjBJ43bETAlYfOPfZS6r+p1DbcRdMiDclwvvw0e1SeYQfML3rE1fdfmOKMSnjXL3u5bV/N1e+Le4o5lHPqCj56hmrK32rF5bgLM6CRWqaihR8FKqy5GFyJagY3hHdIfiuca1LwycLS4Y1m1RvdtG5Luigd1Y+U4ZJt/3TqIXlScWChaMnAflJZ+TPD9armmFYt7/wxszxxmCY8zUOWpVTwGSSjVccYP9+qaMVvsY2eEjfBXdYSf+N6ZCysylyq+xYFXggB8xRJoasIStzt6DbnyyV+B5coAoGBcVVgPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t8rKhuOTYFW4IyALUQwZjQcAE+fG2l7g+XXgr4ysXoIJga5O+RrnhhFx/mBN?=
 =?us-ascii?Q?rqWxlhCZnOAE08zR5uKCAQNOXnAxE9ggi+iE7vP4amHTk/KOY7lBgchNTgO1?=
 =?us-ascii?Q?s8dO99dqnkp7dX/kcOnmVsetFhT2BSncQH5VLQIPCOrAXS1csWY4XrO9OURE?=
 =?us-ascii?Q?sATzY1GtqZUB9LuZ+8UXCyb/Lc9q41ptX5mnw818ntgC1Ll6MU71cJx4Axns?=
 =?us-ascii?Q?Pqdjawe0tVx35sTtDW+7XwtfecPD6/Jbo6GPtsp4d2mVlNf0GrQrKd/kHRGQ?=
 =?us-ascii?Q?AZTE4tnH1aPaezAsK7rnK5WXyTElQ7mdLI4IGrCr+mu+vRcLsECPJAudZgBt?=
 =?us-ascii?Q?y5msxDc7yrxYDXO8Eu0ASvHYPJAPKck+WK4PfblfQeMQSdBi4YRzkP8ZFwji?=
 =?us-ascii?Q?npNukUgFk1vfasNlLxYUTGLrdzmdHEkSWgubPUbJM9aJCuGbVvRTn/2/twFM?=
 =?us-ascii?Q?HetHdshZmQvz6nyPaj+/kfGmuiJ3pyqJzT/TzoeJT1haI7uo4OoTUsCaZ4ml?=
 =?us-ascii?Q?5CPn0rWMQMSLQPOOChPmbsAwMS/jQbhbPglUKM9J2pZN9ioRFrQ+Yux/74L+?=
 =?us-ascii?Q?9wP/AiHaEwnaNznCgwLuF5FGNC3pyRX2/TcsIVF9iL9iLhdSxwaosc2qKeuM?=
 =?us-ascii?Q?HBgkkfh4YFLOikKBtG9+s1OkvFi/xT4fqzjPvKffwjkKiSsRNpeVDrQyYOAC?=
 =?us-ascii?Q?GmlLdmg9C/C2Z6dUiHGykwt37LaXmyiITBhZ6nFvedNP+kpwcScEvUlOL+lf?=
 =?us-ascii?Q?b3Dnh5CpxbHfuQBkcZeVNPeSfB54bGVRonItKe71fu5gF2/iHh2v2bSNJZ5S?=
 =?us-ascii?Q?2nmkPsrAIcO1wgIFSBil4L5rBlhhPEIYiqqFD/4wKjrsFRp+1pE9Ulq1e8uY?=
 =?us-ascii?Q?mVRmCt1u51yVJTbN5Ky/OMU0ZAB/z3bo8H5iNrLerkWM/Nk3K7y4ODN3JW85?=
 =?us-ascii?Q?87Gf9ATHy2bZNGdK9Mjq55iqTIC1ffB8joT5t5Dar7mpprxC/kAEtSLHelef?=
 =?us-ascii?Q?Op3zkSnTFVwR4+lMvf1HZrC4bD3hVtQKLYL+VE8f4H7ML64vw9s5p9+kYo+I?=
 =?us-ascii?Q?flGkkDFI24EAACwcZ+h9XF1mQ+xjaJyYcytzvWPuOb2DeMfoJjy/yfZu68Ro?=
 =?us-ascii?Q?INr+u+gmGTFrdKEvvI6FZsgx6Zt+qKLmsLXuY/XDF4W3kVTvGPAPQu4mbiem?=
 =?us-ascii?Q?A5pTZS5+foE8eY3V54lkVDCFiRTqXjBuM7HZ9P40eI2JmomrUv0i7eZPp8wH?=
 =?us-ascii?Q?AfzHKl2rBtkhLISI0PinEeBDlp2rrW2uolpLZeizbZz2c5WPVeiz1vZxIcrw?=
 =?us-ascii?Q?NIgybgu+rslCT8uyE9dUgoJaOdzRY2QE7GUcoVeJ/TGO+LV9YSgvTbxJOLln?=
 =?us-ascii?Q?D3bxmdORMPt2O+RcE35IzU8WmU0zgjPzD04tLMGjiyJKZ0QW3h3oy1nTnwwB?=
 =?us-ascii?Q?G5iBoBehk8DdQIdYkAmrD3KFTjmhDNtfmlLu6umbjNPi3MbUazguktwD5ENM?=
 =?us-ascii?Q?5hyi/Z8mqV59Z2hfbcPvRRL0CfWB94egwu5+1+3fuXkWN1Eao6z4Nel1vue0?=
 =?us-ascii?Q?xeVYCDl1jFzrAvX3qqK+2rBtlvU5mT3lJuFk6tYratjlMeH1AMHkHBTwNVtA?=
 =?us-ascii?Q?KovtrnDZR6nOfuklJwc17sAmygprdKW7T4aCylKU8XrVCDcZMgISZWCyPlLG?=
 =?us-ascii?Q?DfrK6BR8zPnLoTBHNGuJUHqD2aVKVjV53w45TQ80mh+lRAtnVta3dakIzDkq?=
 =?us-ascii?Q?3ql92NiDspl6Nf5mXZESobSAzDufL14PBRQUcYhmxdwrc/I3t5pk?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8161b1d-34fe-4679-dd90-08def41e87cb
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:55:09.8933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPHUPCayzLiOmz2sc5EKlKs7XJZBnR9y60xW4rrcbmGr0+BDgoOIoAh7H2YSCJ4553bkMYe0CHH+BtgWQJG18VnndlUtuzDQ61woRSvUSsuEf30Z2x4K++/f+T5O47QD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/madera.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 55ea6950ca906..58255844b4df3 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -3332,6 +3332,16 @@ static int madera_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 madera_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 const struct snd_soc_dai_ops madera_dai_ops = {
 	.startup = &madera_startup,
 	.set_fmt = &madera_set_fmt,
@@ -3339,6 +3349,8 @@ const struct snd_soc_dai_ops madera_dai_ops = {
 	.hw_params = &madera_hw_params,
 	.set_sysclk = &madera_dai_set_sysclk,
 	.set_tristate = &madera_set_tristate,
+	.auto_selectable_formats = &madera_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 EXPORT_SYMBOL_GPL(madera_dai_ops);
 
-- 
2.53.0

