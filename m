Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABA63090EB
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415682; cv=fail; b=YK2QbuA2jjD2/M5FDvyINGTJTfFtrqYLiuTUjQMDOE5y5uFDrXM7onUvs7rN2/wXnhM8k3gp45YhR815H+AdWCTC3EtDznyzjQw/su1t9A4wwUr7YUAncP02zBvR5cNWxhuHA8yLeu+u+o7hwUSL6tGVc6AJ+MZqA2OjlVmDRWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415682; c=relaxed/simple;
	bh=JdD9H5MD0C0dvhlRg1WS2Jc9onvBP4lmciGJ9wxvo/o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NlgM7mWB7vBkjuSw1ydjy5pMf4XRGLgd7iGmZZnRl9fve2uheGAReCdn+QnkWDI7nNnn/fJWbHVbhxK0Q1CSWXZhWdcKP2ufUVVsQV8xxRynveQopYltm/3CaAgRy3jTzQssh6VhRxL0UXdMONMYVCQGNKQ3NMS8tAOkqUSmF78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C4v9zXm5; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C4v9zXm5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArP0L9hbKjD1Z34Ay7kImrQT3wwFlts1QKToe+5ExQZbIE+Hi59Q40A8MhJkmGBwHUVBdnFOgzWc1S7BTVPzs5WqyKNGBIVv6lYJf88wmGpBsgwU4cQ6FYdQEfcCal1fqYpbad+OnT/QHA7rt97U7zs4zueXqpKdjK7SgnxQfDPbSBA+n9p9rO9jQ5BINzieG6PTPHd5Suvc48iVZ2Lyn0OMBB5gv0lCceEGT2ASQRPOMXK1bDKaybL5VT/1VhkTrZkUJdYdUBcAd1s8irtxn7R/wWOikPobvF6TXzg8jq4iDTlVQbuHV314a1Pnk7kq8MeVt/GWAIX5VWWDFG6ufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT9D9lbrkxI8YwPwlOE6xkVONN9Fxx9OSlx1YlTeQ3o=;
 b=l+U0RcjDQRBN59ue9mmw+8sU5KEakzE/yDyQ5I3oHCkEBVix5A8sa7/hes2tqSYpWlchRDkKSg8G/iX2oxkBbWljn5LkZA5psxq38KCjXOsg2jKwuGU8vxC7K4LRwbbQOAXXNlDXwoyFqllP7kj9eDo6icnmaCfY0GU1CoBAhJw8CqAXf2832vCYJYnZY4FL3h9RbIGQInQs4bfPANbutIXMy3zpc0J9dF7vLfHfjh8jw/q7dyqqbBSeKXlH35OPPxNlA+nZGYreHqKnUE+4wkkxS2/60QSYVomPieCfzsaQWuCcq6EfL1xf81ghEp91dGgE8Q4shbK5Qu4m4+LlPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT9D9lbrkxI8YwPwlOE6xkVONN9Fxx9OSlx1YlTeQ3o=;
 b=C4v9zXm5lfPfybG78iqPYyLXqeh58mTCqNk7A5djcJABtiuXczAIt+2meyc2m+jg7Udv9LxrYvAL5W1mTHuapSgD3qwqOxrqX5bC7c+7faGzkUdY9JuyLQ3AZKCfT3/H7uGWs/wIhcPWvZmq5CtQlboyEfnfREmgdwCmsq2TXkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:16 +0000
Message-ID: <87plaqru4j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 029/139] ASoC: codecs: cs48l32: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:16 +0000
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e03cfa-c843-4d9a-6857-08de0ad91e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2t4mKBgLGwbAYMWDxiEWUO4DaFfiTW4bjbvLkxWWQBgyQZ3g8dVZ3pqq4Thw?=
 =?us-ascii?Q?tKM4rNW72F3G9BXZgnboIQthWOWQHkc40B1m+hKOs18WuTsB3UpKsHirkY6Z?=
 =?us-ascii?Q?KdQigylZYLBa+EXpNAYhnj2k8Aml0YNKC5qlsE0Nvsw+4ruW+v+hhtrfmmTc?=
 =?us-ascii?Q?ef/kANDHqtDeitpDheTnCrzRcw3ZJZuH0CN8bICiwcZ0QdY2kL10Ckca+d2v?=
 =?us-ascii?Q?+MEUJ5XR+hZ8s3zLc6soz2+KXCaqUA4ZncTXZn7JrPMwSEWXWF+F3h4nFaeD?=
 =?us-ascii?Q?5lzUVq1uR+2Z7m0yZHHZavkONJ3lKTdAKe1awKEW7fnKzspFoAe/ttCYmokd?=
 =?us-ascii?Q?9z4lG6BqBDfbMkXmmo5Sat6rqzg6CruiNG57Kez8J6W2S4eMvn1lsex56neE?=
 =?us-ascii?Q?/AkTsl013N4wTZG7uOcGJsdF1ESLubTSQsjMwu4YV3UgQP/6m4qYNRo4ym5K?=
 =?us-ascii?Q?fERJGkXVWwXl7np9hZejI4/7CQYRxF9wVx7EM6vEpry4hvFHbvr2oetuMhgt?=
 =?us-ascii?Q?W05T8MkeEetssanVQ2roG1++v1lJo/hgZCzRrnAbG+AR6bWOchhmQanBfrDu?=
 =?us-ascii?Q?tw3lm9khnUZHeWwiVWHfLD3fY1LSCSDXgWdvTcHamX7vLB/QdFv8BnrnBfuF?=
 =?us-ascii?Q?4u8B0hCDRTFYUQSfhqUCpbSHSLzmHZ0UgxWeUgPYe2iPzLFQzshR+nfsAEdq?=
 =?us-ascii?Q?CPTDLfsT8IrDj3KIqcS1t+dAFs3lKD4qQMGu1YqgJ5ElOnKlZKOaJf+hFgf2?=
 =?us-ascii?Q?8XoxFQg8Bh3AoeIL/4101iWDJCkg7u4SiTeCsra17A+c5KgEY9FcSV2y1+Ei?=
 =?us-ascii?Q?ypHRbj0a9BIyS81fmmIXAp4SMVscna/OQfmBWbfKJGRTxv7gLnB21ln/EZRM?=
 =?us-ascii?Q?z0Ku7l7ToByhlISJd0P+2bxyR+N7WZ1k2My9HL90G9o55nONhi7Dcd7fz5+h?=
 =?us-ascii?Q?Xp9dV+TEji8G9htP/vhwREcMMP1qhAmyisbpeikx6s3m1JMMu6i+SNcNeTlI?=
 =?us-ascii?Q?MjwNbmYk/0fljBi9XYdzyPdGUzetPKbvRxt1VK6MMOCbin1ztV01fGt86PTh?=
 =?us-ascii?Q?tYi//CyqvKW7XNN+x5XK4GpXMGJGZCwKNLMWRBtVAWtfhKc5xuRzm6AFacN7?=
 =?us-ascii?Q?k8PowKLeSqLeiRyhzlzLdFWrOO5QHxnNo7z8FQAaGfYh3S15xCNRIH49NMid?=
 =?us-ascii?Q?sqaUNpwJbchQB/dYkv1timkgitOuCA57Dw4tJQaAjHhIXCytlYKBOVUWh+4E?=
 =?us-ascii?Q?aBsI7umjm1P0b0RuY18H/55iqfkXRIUQMYYLevRQpTRuu8PTiR7CdPEg0jJj?=
 =?us-ascii?Q?UWrXdbwi9QzV6JeIAIgMyDmRVL4ZW7JqJAytTka+x+Ip/tBmc8JEfgwOrxKZ?=
 =?us-ascii?Q?SS2AjE1TBY8T+PthucH6xLmp9D0jW0y3I3NmFkB2wmLlJG2qjmx/KO2HzgSZ?=
 =?us-ascii?Q?fAlWP7EaY2VSen7Jd+8cZZeOjGFSGiR96ZbmlrSduLvAXnKvSV0P/5tbh17e?=
 =?us-ascii?Q?DUKPP4esvEnxvJYGHkqEYc2NqGhwlkTgOgeb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lIcfm/Q3CJTIPF7XI6kDEzQ9aVm6/Il37uGo15PUzQ3LN1vahxM/HpSHjlYt?=
 =?us-ascii?Q?fUccPTewlvTGFCjNqC/q8XbEWHicP9an0d22EUVmuRt25gdrwMty29um4JNk?=
 =?us-ascii?Q?yxOgju/omowEX2NTpEQruXfOthA38ngeNZOsxJK5PLt+W0W323YAKtlc8MPv?=
 =?us-ascii?Q?IzZkCRIhlBYaIJWSRIyE0U/PHjk8dHMD8DsW81JUxS4Y/DMq5tBpzUKXOljn?=
 =?us-ascii?Q?NXTvkRBm2MQwD687mJDiKi3WThm0sloTwfPYVJfjwlkOBM7IoekBP+l263jO?=
 =?us-ascii?Q?tvQ4CwHO+xTJzapF7YcJcvZJvL5qs+pqLN+uVyk+iH4KSkfaEmh4/btTu0vt?=
 =?us-ascii?Q?wwVXcQz8Zy/OoG9FGObpCdDLQhypkvT98XMPzoChclqksx0Mz0Lfek4UZRBB?=
 =?us-ascii?Q?yafR0OwJRz2CBxNknmFXrrrYOMikjOQjX0oQgMFMtaxonLslcBe1paQmD5MM?=
 =?us-ascii?Q?0AoRizMpB9yN/onbNWgrkEHRjnktFy6+Df/TFfw0YWQ3e5GsxDmOL1fT9b95?=
 =?us-ascii?Q?VDb3dx5/VKlsUHMpMSDT4Zvhzuz9MK5bfwzB2ABeCx2dR2j0Ph06loBiaXdG?=
 =?us-ascii?Q?Glm0hBfQwJ37IVNwr/vfqUAWGzvt9m51dc6jFFfp7Z6myGTBch0cH+Q7hVWO?=
 =?us-ascii?Q?/jzoi/J/FMXwYo+3i/xUD81VG0sgymiQ52djlIQWUX3rudCdAeppOiHxPfTD?=
 =?us-ascii?Q?LBVX6TK2cSNwUwh/vACyc/BT4WZd1HYe5dUuQTL1CFrbkc78DnlFTEUZykOo?=
 =?us-ascii?Q?Aki/bV4XKGYO73BPs3ZNBUw5lFNVUev6Z2GJrBU0gLtD3IJ2QTQ3nmTk9aZU?=
 =?us-ascii?Q?UWVQLHcxzNraABBzLadE/mP0l9S8vyR1jzDvlq7RqciCTRDHVDhPTcETGBPF?=
 =?us-ascii?Q?cOkTnT9d/xiRmpuEmU+MNv1570v4da1Mjr8pCarM+0WQNcNdFC71Bwjpnav0?=
 =?us-ascii?Q?vHMvoYrV5Yg//iHaww/hhc5+vIsZkNx30+gT7GYpQ1Q34GYk3Gm2+OOzVnx8?=
 =?us-ascii?Q?eWMv/9qLiFiuTL3TeKg3DkblMWtjaRAU7MyrqCfxbRneUFJ+kU/iiCP5cu/6?=
 =?us-ascii?Q?nX1FWdVvImhovFVAhkpaG4hMMKsTlImT9WNKmUw7vwDR5q17oP+5B2LKBUrL?=
 =?us-ascii?Q?8hVCmGsRioH3ku0t+aywCeud4N1PC28aSonRVcrIjptYlNyWXBw3Wjo2+P96?=
 =?us-ascii?Q?IGQS3m177+84ih/z+82oqZDC0IT0q36eiySILNNCW5Z8igtYdkTdzcZjDfQH?=
 =?us-ascii?Q?KyQ/L5tHHtUZ/22bXoCOg8v5HpiOrxb2Q6ZRChrWk4d4ZgF+5jZ65bbh5NkV?=
 =?us-ascii?Q?jD169rozLrKMlGbalEBtXlU9efGT7u2VxvYtWdhDXPa70Zyz/09kIVJDgFe1?=
 =?us-ascii?Q?9lXdKrk72pIj5T5aCy1nfYvzAO8H/fAvQr96+KgB4I83erL8vKktsZgBdMxm?=
 =?us-ascii?Q?YKlOh7fW1777rf7YaeRACp7DHyagdEFYDAO2hU8SLNB/wCrum9impWO3s4L3?=
 =?us-ascii?Q?O/f10vWgH1umMLDrZV1rh5GjAjO4PF2z/xpNjAe40rAjhQCpN5bZWlUGiH0J?=
 =?us-ascii?Q?bYV0fDtseA/6ElI9rj1vmSi4FLzVHHMpyxNUYBSM6zY340+THZQhqr4WN3nv?=
 =?us-ascii?Q?cLeYVsgedCa7ql6c/XPI998=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e03cfa-c843-4d9a-6857-08de0ad91e25
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:16.4348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6UHdrKUyixWAT7gygSU7qC7CN51yhsn6JF7+XqZTsbDUaD6qY2H7RMI2iUlQ+FFBWj8iuzNJvgUsCH06yiVzkfYL6X6RkeIyyQYfNeLQ2sqraLAqYVNwp3U49/m7P+/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs48l32.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index a306af4289adf..657f0697e8569 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -231,7 +231,7 @@ static_assert(ARRAY_SIZE(cs48l32_rate_val) == ARRAY_SIZE(cs48l32_rate_text));
 
 static int cs48l32_rate_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -704,7 +704,7 @@ static bool cs48l32_is_input_enabled(struct snd_soc_component *component,
 static int cs48l32_in_rate_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int ret;
@@ -755,7 +755,7 @@ static int cs48l32_low_power_mode_put(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	int ret;
 
@@ -912,7 +912,7 @@ static const struct soc_enum cs48l32_lhpf_mode[] = {
 static int cs48l32_lhpf_coeff_put(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	__be32 *data = (__be32 *)ucontrol->value.bytes.data;
 	s16 val = (s16)be32_to_cpu(*data);
@@ -947,7 +947,7 @@ static const struct soc_enum cs48l32_eq_mode[] = {
 static int cs48l32_eq_mode_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *) kcontrol->private_value;
 	unsigned int item;
@@ -961,7 +961,7 @@ static int cs48l32_eq_mode_get(struct snd_kcontrol *kcontrol,
 static int cs48l32_eq_mode_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *) kcontrol->private_value;
@@ -1000,7 +1000,7 @@ static int cs48l32_eq_coeff_info(struct snd_kcontrol *kcontrol,
 static int cs48l32_eq_coeff_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	struct cs48l32_eq_control *params = (void *)kcontrol->private_value;
 	__be16 *coeffs;
@@ -1025,7 +1025,7 @@ static int cs48l32_eq_coeff_get(struct snd_kcontrol *kcontrol,
 static int cs48l32_eq_coeff_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	struct cs48l32_eq_control *params = (void *)kcontrol->private_value;
@@ -1062,7 +1062,7 @@ static const struct snd_kcontrol_new cs48l32_dsp_trigger_output_mux[] = {
 static int cs48l32_dsp_rate_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *) kcontrol->private_value;
 	unsigned int cached_rate;
@@ -1082,7 +1082,7 @@ static int cs48l32_dsp_rate_get(struct snd_kcontrol *kcontrol,
 static int cs48l32_dsp_rate_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *) kcontrol->private_value;
@@ -2465,7 +2465,7 @@ static int cs48l32_in_ev(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kco
 static int cs48l32_in_put_volsw(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	int ret;
 
-- 
2.43.0

