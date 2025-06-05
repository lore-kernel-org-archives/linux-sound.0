Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B073209
	for <linux-sound@vger.kernel.org>; Thu,  5 Jun 2025 01:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749086913; cv=fail; b=aOCe9CTUSZ5UGw+3ROldYmz9Mrd8HBe7U6Prh/D/v4AolANOzGBRkPq0Wpcn+ynMR5oG8jPntENWGEl9sybbILOwlg465uBK9TcJRQ6yoGo5POZFkY8w5Zs4GcH/swaOUDm2Oo6cC0bNoiBUgdNI+uqA17PpnGs0Eh6oQTvtMA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749086913; c=relaxed/simple;
	bh=b1DJo9qG02jhNfRN8gLKt6ejXWK1G0TQBCJEcOH6bX8=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=PsceSr5pvRgS9DSwmXDLkcIawWR3o1uPSMp8BUuUdgIJr2gtwwM4rcwJOgabrt/ne1me7uLD/VAx6dBfB8klDxeTdIlhI7L/HffQzUIvH1KwUu11bqh6WpTMJNuYQcubqztdiqI0POAceBm1LYIHHtfyX59u0ITut7SyDENIWJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jHCS2zbK; arc=fail smtp.client-ip=52.101.229.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jHCS2zbK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0FYYBnpfNwD4woMtQ292OXSmCPwymTLdVPDCZZGfUf8WshSIa+m7CIbatgCL5KGH/aQnthR9jYbnDrhIlFdUtlhJ4Iiyhiwo0ov5FB7iq40vfP0JOMvHQp5hgcXXTh0R+b4cTTTahwqGw2jNyHHOmnQnzb5JJKOR4nI1IXu5LJoy8AuNzl5XfrRZxuZ/IVWLpuc2pHfoh9k4whptj3NC+67kO6sEECy32Se3QLE9upX+DDDsKuvg0Yn3V6iCqf1/qdcubspzlSdo2Xtd78dAlq1HoUH3pB22rQC52MO7pc9Su7qk+Z60fvRlx2bjTx8Gp8Q3BxTXg4mH0pDT8l65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmpW+PjAtiDnQS3K/2Lq61nNribjxDI2xFMA7jrshkU=;
 b=s2qqG3oAiQ+WIbEG574eeqDNyMmPuwQzFYFjsJLSHlL3kKBm3l2Rx6z0CCIqaS1CMF09nxRnADpIr8CdyDvX+4BOJA+H8aajKLrGTb7rXNsU+bbAt/2WNFU35N2csHKVky8txf5fAJRoxWgBnptyvIZoXuWFXX/Wd0WyVy0cQG/wVSZ5BQd2E2oP4Za2V4iuzeE/bV+AjSLrW+zfxeRBldKyQFJQ14AI5IntAnRfkE9DFqp2F3f0IOgKo5nMY7aH5hvRtvBJ6wlg7wfvCHMV4p8vHHLjo4qwUxLEC3+MnZBXpzy2bsPAQ6Vtx7ADBd/X/lxjetgbQziiqAYe8QgY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmpW+PjAtiDnQS3K/2Lq61nNribjxDI2xFMA7jrshkU=;
 b=jHCS2zbKtksh3eqHYBghRan9LZ0lh/fIIr0ukqPqVtP/gxvyILH5Odu6wIjbI+bhekruvXg2I5weHND/JssSRTgdMK3JiVCRA4OnHz6kw731xGiueiJ0LKc1FV2RXw8N6+DKToaLukRYP8Bgo9flNZuqgpc59sRfelEHJtKggT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10428.jpnprd01.prod.outlook.com
 (2603:1096:400:244::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 01:28:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 01:28:26 +0000
Message-ID: <87qzzzj7t1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-dai: tidyup return value of snd_soc_xlate_tdm_slot_mask()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Giedrius =?ISO-8859-2?Q?Trainavi=E8iu?=
 =?ISO-8859-2?Q?s?= <giedrius@blokas.io>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Jun 2025 01:28:26 +0000
X-ClientProxiedBy: TYWPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10428:EE_
X-MS-Office365-Filtering-Correlation-Id: 0799307b-0182-49ce-0ac2-08dda3d0452f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-2?Q?tocmTmFgjzBJQ9YA6LmRCfTwueUFkUaQSdDNg4jqPY0bSnSkkIMD86tg6Y?=
 =?iso-8859-2?Q?f6adwcvmiy9FdaJIzQAo2jFCde0sLct5hxqWZagYkMH0/eWkBPMH5qblQS?=
 =?iso-8859-2?Q?JIvIoiVRCtnoHk9+eRdiQvFGxZTrOhyXZgfEKAUnL1/ZnE+2lg4KlRCjvL?=
 =?iso-8859-2?Q?nn9++M1eS5zt74aREo515DEReJY0iY79CfBjPw88Txd74Jm3v+MczvYCTy?=
 =?iso-8859-2?Q?rvcND+zONBe3EyzoW6FvCUlij0qno3OTjArrRKZ03nEsCbBF+dNhiPvlil?=
 =?iso-8859-2?Q?9kti+BBD0RESSFGPvdboLZ+bByfe/qJnAt+3kw2C2cD+5mgRmaKx1aIipq?=
 =?iso-8859-2?Q?Cirj8pJ7dsFyix7liXMMK7q28cdmv1L7uctVoqolHcL+w+ESFuTCEx/59j?=
 =?iso-8859-2?Q?enfwsGR0BdP1Cq4bfvk5D7WdqoI9HLs7hP9tccqC6t6aGJwW5BygIK5LL3?=
 =?iso-8859-2?Q?M8TdRgtDx4uN4Ij9xdSsckXmWYd5fWTAvyTAwXgM/3QAiSyFl5VBdXqtbm?=
 =?iso-8859-2?Q?pIuhfzizHbOWlOEY/V4SXRmOBJrr/p0alzwTGUa+HF7G5H8m3o8WCN/hoP?=
 =?iso-8859-2?Q?P8TOWQiYplIwRJy3LvEPTUyXVMhiOKt4E5XvoRHk1x1eVWlxWyP1Bn4bt1?=
 =?iso-8859-2?Q?jZ6KfUbfXO5Z+jTb4QZQ3cNjcBTwE1YTAW250Il/yGbioZML4ohBiOjyXu?=
 =?iso-8859-2?Q?QvWC4RqzGNMs7V5ylOYVPSvAoadjLF5XPMxFgssMmubd4//PGgijic6fP0?=
 =?iso-8859-2?Q?CzQdkBmjIiNP5NxFFWzTLmhenzF4q8+xYC5uT/w5RTDbgfEvuRxy89tJuc?=
 =?iso-8859-2?Q?6w57SLNdOkKWcM3CWW1d7GbjjGnQjpFV/9qRchFT6iO9PWtrahIv88qtmz?=
 =?iso-8859-2?Q?BALXaR9ex5KCsfYdaClqmMvFrCF06jYnGDEyOCallB8lY6tPCoOx69CYhG?=
 =?iso-8859-2?Q?7GbDY/GuMdCfr+7EfXewHRjNQk3NL9jaUdiQYlSDtplB5x24bSaQ7NIWZE?=
 =?iso-8859-2?Q?vxtoX+rADzot6J/53hgl5c5dLr3LRkfZQf4x+b2xKw2oGGPF/FWtdPa1uu?=
 =?iso-8859-2?Q?mhZuEIo36QGmeMx8TTeLTveAdGZspycRAdOtMbZLcdSXbENG8MoNwJSIs8?=
 =?iso-8859-2?Q?fNeb+/YXZ1HDZ7P6Gyncc4RGQCFtE7d/MO6QP03jDoaQKk1JLCvorF2rnY?=
 =?iso-8859-2?Q?XE4UD9Cdh3AY0IQUZD4Y4ahWjD+eQ1As5ANjEPLCv763kzQmXfP5cQcjoS?=
 =?iso-8859-2?Q?8GD3JKwKn6Z3dPJTBEZC+wKw0XAMuehN7yEy29yhGqdT7NRBLNzQj9wJM4?=
 =?iso-8859-2?Q?UMq+nCZ2b3bgHH+7BhfvLiNau8tSNgfnDP6kPzCAY2IVgKDzo6Am6m6M8g?=
 =?iso-8859-2?Q?++vc51UVe9Nvf+v/mSY9wkiMaknDCtvp0GCv6gMyp0IDX8pTfsq8nxjkgZ?=
 =?iso-8859-2?Q?07k20DShf7svApFjpBLhehZo+oVtom0SYGqJBFx6eRw0dX7dKcE+772qx3?=
 =?iso-8859-2?Q?U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?AHntC5DECvy3NRn2AG5dFzpo8kxKEmb5c4r/ZnPxsUhpIbDlzXopnvRf8c?=
 =?iso-8859-2?Q?/U15LVj8KcAdEwSYjnqGP9YTQLj8vlHmIx9JJVAFb6tHlHq+wyjRBjLH1c?=
 =?iso-8859-2?Q?h46YXeG2N2WUBuJTvbV2UnznEWEiL4jWCc3cnGyIBy7qegmuWfvgiz3U0/?=
 =?iso-8859-2?Q?auBgGs4lV2kOTE5rIeRiTcH0RSvO5xWRWju3GYlFMkV5pZY6wm3CVdGpCC?=
 =?iso-8859-2?Q?N6dW5H8nFqNDz/njBIfwRuNipGVYsU/lYKUdco/FxE7hih2Q6HOwwp4fiZ?=
 =?iso-8859-2?Q?B+6xjUiaAhsCKe6nbDjwN9Owr0GLgmqC6nkNBozvgvFnt11CAzlGxNsqmY?=
 =?iso-8859-2?Q?B7vUDlResWgf6BtwI77mmwsX67bmVfxWzGJlJZ7N9V5Eh4gWuB4GhXasgt?=
 =?iso-8859-2?Q?tqkUrFdvkclIWeW8q4QRLZgD+KrzvsM1h9QK1141vBSz22RCRLQFresa14?=
 =?iso-8859-2?Q?pNYKOYrIijx1vwTlVCdYURWtnQvHVs8Af0nFH+zObwtsOBi0CZWxNFtY/d?=
 =?iso-8859-2?Q?ZhKcRz6rqh5Qyro0th+gEPSe2xWnIuIXinCAQRwoZ3JG472BBFZztYaVnc?=
 =?iso-8859-2?Q?SD19F7RgP42EErr9og1N+DJ3np2AhDwRd91tMTTSySxKcY48G9p1tAsRlR?=
 =?iso-8859-2?Q?EdeB6WWhTYYQ0noJ3VR/+WvMZuUMUaUtHt6QJGYkoiPulr5Xu1cQm6Y2PE?=
 =?iso-8859-2?Q?Zy2NJfejj2dkgz6f4YGQv80VkQ3cS/joPExIAag3c/c2SR53C64Rf9Mucv?=
 =?iso-8859-2?Q?zxmfqe28r1cPBqS4iFrbTqb96sIrFYQi20W6aYCxmFJVVPj26f/tQULLBR?=
 =?iso-8859-2?Q?NpXJK8J/71mUc/+CdG/E/bm9bVRK6Dr1XAZGu3ECr175h9fcKvlpOhyrF6?=
 =?iso-8859-2?Q?vJpMf+ZraXA9HjfdnyutJpWNinaUsCi9Y5mIh6XeHo58jCCQou6dmKv60h?=
 =?iso-8859-2?Q?YNQmogJKQJK7lCv5f/fGm1lovIhjND97WKlk7Y1r7NSRnZcnvjBZoBr+4v?=
 =?iso-8859-2?Q?5C3PntcFstP+TkS08WS5Q9SXRC8prDyar5h/TjMavAu+lBDy9J8XtTmZkf?=
 =?iso-8859-2?Q?6NIvPfLHfz6MXYpc17WGMEP5uBIo1Cr4yqj0i418ZUXzfFEclTkiJB5TG5?=
 =?iso-8859-2?Q?4liow/DiEH0JdudgYqYcqySrfUu9OK6WcB7SqNgSGtf3vZ8YS43/RaBzf6?=
 =?iso-8859-2?Q?cVVOhdOziRSqJixm5RNpP8zMdAWbOSEuH58q3vs0iyT3IQCtvO1Oox2Xj5?=
 =?iso-8859-2?Q?/OBGtbZbtirwlfHVT05+we1jVhJLT93pXG/jqV2OdEyENGuP3YpfRW+qOk?=
 =?iso-8859-2?Q?0ZjYQV0YgGeZp8VIyrygsfd0sO8WmwQSC1x0ZG+UjpFHPo979owluJYy1A?=
 =?iso-8859-2?Q?T6YNy4oy5cRKzc8b1j0lLsHpissNgkcZpen6YiX6qA2wY3jzzHoIk0ZSoF?=
 =?iso-8859-2?Q?icA3GW59VNFIyN4g63gZctq8KoDxYhj/ph8Ss4VB5d0VzMlgJCAQh2F+RH?=
 =?iso-8859-2?Q?zJeHBR8FlfqPOmmuqd86W8o2tezOkpC5+1RDWsjZf7H756dSt6IC7N2KZT?=
 =?iso-8859-2?Q?O1f/UdXF/vU8lHctBTiRMS+2hYGyZMufjBJbZ3ZXy/wFDmE1kivaGiM29A?=
 =?iso-8859-2?Q?ZE0SeszU5v5Gf+xqOHeSQVVzEZsWh7478Ynl8z4XOEAfMweqFX+x1vS1yG?=
 =?iso-8859-2?Q?4I6ESlmTsRQtF4Y++ds=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0799307b-0182-49ce-0ac2-08dda3d0452f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 01:28:26.7254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kDCge+azaIt28+7YgEDuRH4Ez85zg3OylqiFY6KcozvZnLlCTG/NKFnp2JCuI8AM2MUVkXODos/ObwCQXYWFTWA5+vdZrR2JATiW3+5AP+gZoAKE6LCdUuUUWAingc9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10428

commit 7f1186a8d738661 ("ASoC: soc-dai: check return value at
snd_soc_dai_set_tdm_slot()") checks return value of
snd_soc_xlate_tdm_slot_mask() (A).

	/*
	 * ...
(Y)	 * TDM mode can be disabled by passing 0 for @slots. In this case @tx_m=
ask,
	 * @rx_mask and @slot_width will be ignored.
	 * ...
	 */
	int snd_soc_dai_set_tdm_slot(...)
	{
		...
		if (...)
			ret =3D ...
		else
(A)			ret =3D snd_soc_xlate_tdm_slot_mask(slots, ...);
		if (ret)
			goto err;
		...
	}

snd_soc_xlate_tdm_slot_mask() will return -EINVAL if slots was 0 (X),
but it should return 0 instead of -EINVAL, because snd_soc_dai_set_tdm_slot=
()
allow to use slots 0 (Y).

(A)	static int snd_soc_xlate_tdm_slot_mask(...)
	{
		...
		if (!slots)
(X)			return -EINVAL;
		...
	}

Fix up it.

Link: https://lore.kernel.org/r/CAMONXLtSL7iKyvH6w=3DCzPTxQdBECf++hn8RKL6Y4=
=3DM_ou2YHow@mail.gmail.com
Reported-by: Giedrius Trainavi=E8ius <giedrius@blokas.io>
Fixes: 7f1186a8d738661 ("ASoC: soc-dai: check return value at snd_soc_dai_s=
et_tdm_slot()")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
It needs Tested-by / Acked-by / Reviewed-by tag

 sound/soc/soc-dai.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index a210089747d0..e3a7972b0c73 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -207,6 +207,9 @@ EXPORT_SYMBOL_GPL(snd_soc_dai_set_fmt);
  * @tx_mask: bitmask representing active TX slots.
  * @rx_mask: bitmask representing active RX slots.
  *
+ * TDM mode can be disabled by passing 0 for @slots. In this case @tx_mask=
,
+ * @rx_mask and @slot_width will be ignored.
+ *
  * Generates the TDM tx and rx slot default masks for DAI.
  */
 static int snd_soc_xlate_tdm_slot_mask(unsigned int slots,
@@ -217,7 +220,7 @@ static int snd_soc_xlate_tdm_slot_mask(unsigned int slo=
ts,
 		return 0;
=20
 	if (!slots)
-		return -EINVAL;
+		return 0;
=20
 	*tx_mask =3D (1 << slots) - 1;
 	*rx_mask =3D (1 << slots) - 1;
--=20
2.43.0

