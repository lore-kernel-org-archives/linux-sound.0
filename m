Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290B63C4540
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152880; cv=fail; b=PzDfWpBGCMTNycpgMNSWZUBuLtGXeURBRF2GLe47AFHiluQajkSQWXloOT8M+cSbu5ari8/MhIQMNfr7VDKC72BwSSBjkM/268Ob4o82FnzHGwEPc1kJyCcZmQHXtJYsI/cuep8E8m3kaeM649JpthtYp1PKanmZzbozPeTzrvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152880; c=relaxed/simple;
	bh=KBbNtTaU+PuKMWmrLoYMui8KPfJxXFBuWZ/gOEvJiiw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nn3y71bGgVI5ahgWFnYCYQsrWqiEkEp2GxRMb6dAf5cm5LmB3XGuo7KEdNQ21nyjdA3kWCj/TxWR1GfEsfxMfbj2enYrdRKSTc9PWr6MQoMZaHEt+qUDOxSCh+iavdATCSHFy3OgFyg8ct+Qu+Ql/BLiSbz6QzyqTOtXUAwMNrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B3QSn9Jn; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B3QSn9Jn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxIEieN2TlS+MoAqC7DTZECu3fJoR8436RcfqkWkYA6WroGykjWzH8LVrMcUmbZNnu9NHkzp/anD9gW7snQ6xW77G5NttlyGPcwb4CyubJHzOE71021b2qg103K4LnapGcYZKutIF4tb8ijwdfAviUHERe8w3oGrGR1vVOGk8LVTO0sT/QJQB0rKzd539jw0cWVJw8NcqPYp20OeKGoNpeV7yRt2IkDrKUDH2uT+N9svD4iaROdf5GV5m0v9h8Ii7pI6ivC4pA4nKX4CZkHi9kXhrhQcJYCSuqooA9sQzdIj+Tk0Dnm//FccJGvVw03hrMqg34fbaRIzCxgBMK/pFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiwMZ5udDGJEIogDEBaBoIBi52F0sCzAwmEC1Tzql9Y=;
 b=rIgb5ydr5ny4kqf6ijHu4mIL1TJHAkNNMvKUtNlpu66UkRUM3tCOZHhKy679N2lKOmgnZ1HKjyeLvX/k3fXp10+21GXWCSo4EFdX1E8Omvs0xanJ4cSPqBjVzVY1V24rTV1ZVeHpgvAizTJfY6LOUS6qvbgCt4z4Mug1BbZ7qWzu9NfamfIYqnIXEK/TU83mgTxJjmILIZnGIvLeFpwAj2TbZJfdQtm5lRj2g4LpqS1+zJjNVXqfo+ceGo/VIBbrD3qj/l11vgqiPIT19Q0Zwcz6iDPKIRg2tqVRNmI1wpvP06P8WzrbbiK2N+2rRhUrsA+5CqRq4QKX8FoOp20AyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiwMZ5udDGJEIogDEBaBoIBi52F0sCzAwmEC1Tzql9Y=;
 b=B3QSn9Jnwx4gQ4/GDZ6W2liNm/0bjbLWPOETjXY5vj9sEMHK9u7XOk/+nL+HcEWv307YJgJAmTLyuQx7JiS7MSnqyYQL8LSdFfTD1aCK4KJOuJuo59HVOHiEWWijEd4aXHp46RaebwkIn/+1u2mtNbcL5ikpDGmhR8zZmci4Ryw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:56 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:55 +0000
Message-ID: <8733vuvpw5.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 15/39] ASoC: codecs: inno_rk3036: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:55 +0000
X-ClientProxiedBy: TYCP301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::10) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: b30ddd42-3900-427e-b981-08df071dd10a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	l5QOj8TJqlm20qsvnq599/uEWs1sgCQJr/VBebF3qloeEUCoBD324pfJQXRSOS7vcgWbwFcxDEmLN3T/+vp+9kP2whjFxB7X8wlcxlaivxGOqOHUmHCCdhV7sqw4acwFmNDpbC7oA1IGwFxpnH2C3Sneb5g8wPS46Xa+1hGmsSMVLtRqWruCeWFonfaWIW7RUZkIcKRLzUMRIwqNPlPv6ZiW9W1pBmjb0bUYjDebYtjWsihgy0aoSt7XIf8NpB51WIKZioAtGITlxjNJVMedzbZ24bejp4G8RbYHQmsIZQwbTWEpqIQzltv5ZQDGQaEyV44u/ogitJpmJtlidQq7LO7PjgKvDQwG/Bu9mNBJBrwX4NIIfebmlPHBtG86PE8726S4MjuqmIKYjrLRCDkFaz3nPQhskg2c1mwF+CfIp6TpM3afar6KlVkdkveG+hFj2RN8+6OlozhCk34B3KhqTOCFErwaxReFUnZ2uQBcBDqkiDjOdSPCPTCrNhKubK3jzB4cM3ScEjsLE3CBlYDEHU/oAPMOGBSGBZQNQ3Easp11jhN6s1HvhWp1uQ4y63XLy8fcazG1prrJmx4LhcmmXZOYigH1UVGm+KYkoxby5Ts0YvmK0wIe4GLVAko6myS7ZV3ZEYWrzFQNuSUbmK05Zg9+yLaNgrVh75+N88e/zwrAgs3zjfMjHlMhRJPrtavrILwgjtyJCuZ3PzA6kgBYYVg8Qe0qxUjofqxBnwh06d4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZYLvB2pQ9GOlBQ4r1Uy4l2QLkaUP3qilMjwC5g8m7DOJAb9BLn67rkTQRoYd?=
 =?us-ascii?Q?qAqeT1LPIzG14q+bLwWhRKS/lsWHW63iZjK2iHJG0yKweC1OSeK5gI+My4qu?=
 =?us-ascii?Q?Tn/9pfwYPkVOE4iG3MRRPUWFi0UTlhFonR+6pADl+G4r7juu02yQAqUDwrtP?=
 =?us-ascii?Q?ioEUorhkA/1TVvOhvq5NNXhti4VLHjYLzdmqII2RFScbwXFNgE603AXueqh/?=
 =?us-ascii?Q?EIuU6SNsc+lweWFWjZhcgYVtGZyRBiBTHcUcz4Udp9I8vmzXthEt002iSly0?=
 =?us-ascii?Q?laKLdxz0rmhO+ExQq967KKkcp2jnewAByEsM/bbtxNt7p/L8kLKOb4MtUgTU?=
 =?us-ascii?Q?nyCB/yVf3CYfh6LHpt92aU1fFM3cwbm4sY+jJB9m6jRrBJ0MkKfQad2Xk0cp?=
 =?us-ascii?Q?DQuYq4E/3sM/lR5SjzpP5xjb4MracQNhNGC4RKaAP2HVhzKBsmGyVr94n2UF?=
 =?us-ascii?Q?Pus0xeIxkDSNSsVVG4eqelmkbDJQYqXdQWOHdqR1sDD0e3SrqF4AsqKuVoih?=
 =?us-ascii?Q?zKHnpZUl+AJAkrNbCSG3Tg6h78lNRdm5rVzBH5HiujRU/tt/KUjKcPAhR3Y4?=
 =?us-ascii?Q?SAGH4s1rGFgo5lUHHajaLbc+wGNFz/Nauj+CvryNiGZnBffFbaEz3zkej7Lj?=
 =?us-ascii?Q?/l7AvdMkZ0yF4/4FggAuuLjt3qDjUAmYuRVS25b2/9LmJ4e8KI3Ll9TVF1uJ?=
 =?us-ascii?Q?jfCbQjONFTqGxnCoK1SPgOp40p7uy9AqTRkPzG4+F2IZHwh1KFkyXYOo6nmw?=
 =?us-ascii?Q?d++wq4Sc2AGoejjifT0znZZ2eYqGW8eocgIdQ5HvQEnVMUtTMjxBLn3tBchs?=
 =?us-ascii?Q?KXl4RRjxZLgZG+j7M2ggobYtMECzqLtB/VaWCr8445+uQ2WA8+oj9QEs4KNW?=
 =?us-ascii?Q?nvxZBSuR5Bz4Kzo2EFQgDozY57/eG2gJOUJfipLSIeb5D03jY3rW6HS0uCYf?=
 =?us-ascii?Q?JBQJjzPRKVxgK5Pq1Aeps10/Zc8/Hnjw+PSvxOcUQ5IGHL9ECL8Os8r8qLLn?=
 =?us-ascii?Q?AdfxZtTJXyz+uyqGitjI6zVxKm+n3h5jjDOnX6zasr6v8nP5UG9b4VNE6eJJ?=
 =?us-ascii?Q?VDk010ncLu69A0TnpbR9uwH9IL3F125r50h44R62mUae7Bl0uc40fmKkjHxH?=
 =?us-ascii?Q?Dv6/BzPnls7jB9n3dvOUoB4QmOaorj33ErDrk22A0iqNJAfORta0lsnNJc0M?=
 =?us-ascii?Q?wOwKfk0+MfJbXsUIsxctcFjyGg9dFgfgY6OWlgJ/I5sYYzMZBarSnOM6TcRx?=
 =?us-ascii?Q?lj5ksRw2w4xFN21em6OoYFN2L1Tsoiu3fMLF4S+uaKpj0FDsLeGqqIz8erpG?=
 =?us-ascii?Q?w0QWZ1ubo8j8z63Oshb09TlEVuHqUK46MI1jIr0Q9nhAiN9UCLXh8tO7u/z9?=
 =?us-ascii?Q?WBX6bmh+xySfwIjzeFj51oblm8rOqFBJVSzbPKOGi9Dld6kWbq+THYmJCWoE?=
 =?us-ascii?Q?9anVOe/GPw00i4T1S7o0Jlb97ZPDQXt9+noSFvuvDZ1+4YMTWQjPdpryYsL9?=
 =?us-ascii?Q?y2g+HJUn/NKfQz+s6m8/7aF4W5o6SlZGWIbrcpc6TspdXHU1RNSxe+1D72YI?=
 =?us-ascii?Q?4BHkspXrhobFrDmjgBmd/TFczEdf0FDMmht0hXJd8LVJPud+JF8w7mNA9gn4?=
 =?us-ascii?Q?tIxoZ+EQzDlNkq4Q2Ul+vU5FTlD4aLyQyO/x496eu/ky8veKX6zMd028x7hZ?=
 =?us-ascii?Q?ys8SMM080su5HEE5LEgnKkzHznzrIUNZmbw8l3szL2MtaNcHnLW8g46lA1+Q?=
 =?us-ascii?Q?rEZtjUrnaurP4xiN46GLP0dO15v+sppX+vikv3bntPJv0A8fDouv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b30ddd42-3900-427e-b981-08df071dd10a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:55.6581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulBdk+iXQzPD6CJMCt/LHBiAYoKwnbGChqHuvUNS/v+1P9AyguxY/OUKliC7bftU1thkkUzUdyv3G4ciHfEAdKY1xVHvODuh7sEW1PvRZ3L1c6IOg++LJRhkTFlFus+Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/inno_rk3036.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/inno_rk3036.c b/sound/soc/codecs/inno_rk3036.c
index fdd19f8e88640..aaf03f2281507 100644
--- a/sound/soc/codecs/inno_rk3036.c
+++ b/sound/soc/codecs/inno_rk3036.c
@@ -309,9 +309,21 @@ static int rk3036_codec_dai_hw_params(struct snd_pcm_substream *substream,
 			   SNDRV_PCM_FMTBIT_S24_LE  | \
 			   SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 rk3036_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rk3036_codec_dai_ops = {
 	.set_fmt	= rk3036_codec_dai_set_fmt,
 	.hw_params	= rk3036_codec_dai_hw_params,
+	.auto_selectable_formats	= &rk3036_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rk3036_codec_dai_driver[] = {
-- 
2.53.0

