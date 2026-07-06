Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262502E6CB3
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304331; cv=fail; b=E6siYFEMHHZhNascBjr9AzSKdomNAAsN46R6ECfK7MX+Na1qc0Ut5HJqXKN5cnYzQwHmnFfKCL9nYN8x3wOaXgBU53J3+R1tYkxkzWT0cnhI0laA0cB6ooQmLw6fp5KnVtYuD5fqR7druRcfY71WHZDXwStkKn5+rN3WNMm5ya4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304331; c=relaxed/simple;
	bh=OAl0RqQbyV5JZahWrDgBLd28VH/gx9RjCg6PuZPpqB8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JlBGJvypXFJuoXMQ3eMGjNE7IhfTJH/YYj3HXmGw6WCFUrdXsY3ljPi3fYTCg8yTC1SzgsbqBvmlhNNWI4TyfutP9cJTngROq49idBwCoT6bg4jOyvuH6OfT+VIX922xpUn8fT58JWaYcs897Xe4c8CajpVb1SbxGwAsxBxXtUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eOxd/ydw; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eOxd/ydw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9BTUAA55Jhu6wgHMEdBwceBAWc+K8xPNvvxtvcEEGrWDYTOlE68+p17Bsa+VZpUhbXQ8JmdueuXvBIm2aaX/ycOF66TRKLYc9bZQilSe8+ewmUyqdce5xgFysaEZpeprja+tHivBHpSshhrnQFziHmHgaX9kb5oIsIpf13Sg5q3Js/sbOJt5hHRLBK07vY2ayPmMCXAhpFcVBLgIlB+hzl3tUPsW55OYWDnLO3vYxTyDqkLdVllyhogEknIdr+9p8cBTTUBA6E31o6MRF3BDppJzWuMXtlK5gZUW4YraQNT9oEBtEaHvNnnk+Zq6p0d0pSVeDBHIbqwJX7VidJOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pae7dVSs+ARdy1TkLwkaS8Z/QgRJsXRAAydROzoK74s=;
 b=RoIrt3K8LMdX8XayWf7jAd22+AA5KJ6qBk4uK+fuIRYdmI2zu+qbkx7NOeo7T7NHDomg5PQ8W6UQq+idYPxVcybVzYFw8FO6BOBvjoerkFrcNJs73WpazUcWhQBJ2q8CLgFtdx7JKN+H44IF7aHXpNpI9AcRjSnNmA3i/3T2w0Z6vZWWbzn7sXOm2oXxm8FY02SUWtPOiVyTDM+WCEkgbM5eWV0bfjCMcM1KQBJw2UYPT6UjWQr6yaXuXHGidhueBWEON00T2eP1MqCH4OyxUXCIMDs+90FFJs3eaDZcAQaUyxlI4jvwDkPQskTb52pDjp4pDz0CORrc6BZxUR/KnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pae7dVSs+ARdy1TkLwkaS8Z/QgRJsXRAAydROzoK74s=;
 b=eOxd/ydw05Q1U5+WaBz84bg616sxBRoDhagN8bkD+mOzTuNrGaaNDcFkmP/oKLZq4vFYcDj1aoG6/XzIbjnylXyuNzWAA10cbZ9a4xIxmIJG/s3Fc4/ofh1Ft/fgzqQAW62J6Q3FWKVYW0ZWqtF0akAFbE2tfoI9XyurPVcXMHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6963.jpnprd01.prod.outlook.com (2603:1096:400:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 02:18:48 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:18:48 +0000
Message-ID: <87bjckc12w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend v2 3/4] ASoC: meson: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Kirill Marinushkin <k.marinushkin@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
In-Reply-To: <87fr1wc13y.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr1wc13y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:18:47 +0000
X-ClientProxiedBy: TY6P301CA0010.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 159f2fd1-1d5e-4691-c284-08dedb04e993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|366016|1800799024|38350700014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZnfMfuSl9p5skOe7PEQpnNpfekuZiXLmuoIhR9fC0rmARQIWcNncf8pvScbrZkJMgnNz55gKoodZH0GMKMlfgqr0q8nv9h/h6u1/cn7az7TFzIGh199rAo+OETQ9Ai78WXn6S6jAlwGrGxmduXNk3RBtUSAdhdlRnL2K0xqf1x+WVVQ06T6xGRNhLwdiFG5fJaF77TSAfUW/KnZW9Kuk50THYObe2OOf6yyh3NW5DbSA0f7k6q/OLNypNIDI8Li5yztPne7Nrmh4wbn5k7hugTsiQ9U9wx3xhcnao2dSAc0ORRr5avqomVWXuVfQDxfkVY6pOGqMKFqFMwOvcGUpytdr6bVoDuqBRjauUi6/p8iUHsNrYZd1OnyxxSB5FKp/EZ5Z02wmz+eD3jAFR1CbrmHarw2oWokLB5dAluZHzWvZvWrazq8adWKLgf/FGESFRddzhbYY61Ki4E74ebDhQAt+lo+vjP3CFXxzSTTTUkh6JCWHgpxEF8fzsp/tyqdvDVY+it4e0HJhHIkJBs6uxTHpikwrbXe7W/qxpYWD4Fclufksx7nUTa7+04JHxGCnZ42eCK/DWgLWcTP2KN5Q4BZ410UaG67U57oZOp0A1/TJ+D2NK+/0XDM63+w4bY0c3O4+lQ6Kks7y/4or8z4tRb+oJptKIVy4+akzWWCWdeP9J+mN24k45q8ZQqzyTolD0ySn3T01ZhwlKKT2dQcp3D6a6+aM22IAKUrzADJjsyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u5pvqkLhvFDT8ihG8FJjzX9J6sBPtQFjTjXsYh0W5xAsbdNjEqNp4ac1opj+?=
 =?us-ascii?Q?o11Y2Li7h0/ZvtVhz5rJx7L7s+zLMVRzcZRleo28Sly1UL1lnXSxHxCrmIOT?=
 =?us-ascii?Q?oNvW8+YqTyMMApRyiXlrcvId9y6rAPeIEqyDhxpSU7svRpfAeRo7iz++4T78?=
 =?us-ascii?Q?5wmuxhMSdfJS6t+8BXOYvVn5hnm3jHeEWn9zDfJtmNT6VZvZTKH/R3LVJWLs?=
 =?us-ascii?Q?z9Apfxi1D3QPoKVeV3PD0QCIHlW214GELqNNzJPKztgxP4kjq3+rTE9qd29O?=
 =?us-ascii?Q?9uPSBST7HJ1paKr17LfArOQG2q9xeOKGIaxHrO01GiYT9VURVFtGFpt+NOiD?=
 =?us-ascii?Q?HxV2uIt77yyOqDX9kQQNKn7ZccaSXIeR19Y56e9Dlhx1+3dOT46RcVIebwO5?=
 =?us-ascii?Q?UYlfJ7wabiNNWUeqettl9xSupQgDxYv9Ao3xvpD8RxqGrlCvOmTDF4htUUx1?=
 =?us-ascii?Q?t3dZ4V6nh3iTcbDissKl7MRAKd4dKhJk+mfjazkrmlymB1bGYU/ShBl0GeWT?=
 =?us-ascii?Q?rUx3/r0bBn93Zm1KBa7iR2alVsglNowkgHX8ArS+IpXEtTCq3ek1z/Skb00s?=
 =?us-ascii?Q?vlL+qeo5VY+KxOKpBNUwAmCcsbDZweONPV9mJOpiNwtWt/CyFsuT6uVbR6k+?=
 =?us-ascii?Q?8OeGkz0x5voOE3X2bzv1mrAFBzoDSjTjVSSMFGlphV2p0OmvLPeB4qJhwkwC?=
 =?us-ascii?Q?XEDUHInTIBls5OdUV1GNp9o+zPNlipQOrjyXTlzkyAicwJaOjAVF4q3Bcwad?=
 =?us-ascii?Q?kHwFe7zksDMztMsfik6HgaOftaUFe96WYDtF/JSaZf8+Xw43ZW+43G4+qDZJ?=
 =?us-ascii?Q?7IvIklsIT1Jvt0w/4NPreihFhBOBWyYu6LD9ZbOeDNIt+CFhTE6uoLOxY1hn?=
 =?us-ascii?Q?rnafjjJlWmWibjtdxKli4J+0nh+95tyWhdcpO/mLBff6azvvK68vTEAy1rPJ?=
 =?us-ascii?Q?L/6NlgPrY62mEGCk1GXplHN9KDGKBoXKkAoz7b15koNn1Iarj2y7C5DqqPft?=
 =?us-ascii?Q?x5Nwk+4BbE5felXVr6vlBvb+8/As1v4/YvIxf0a/evHoZb7GZPSt9EwicCc5?=
 =?us-ascii?Q?e3XJzTV5K3URkdvlnuybx4dPdKJKn1+yJ7GnGH79fL/X+ziE++l58i3xhYnU?=
 =?us-ascii?Q?4Gvs/1a6wS9R3I8NxECtOMIo+55QSiMGWNB2P8OJCTwfFV/vDWOdcTXla8Zo?=
 =?us-ascii?Q?oI3mtS2LAXVoOQMzOYbIzRK/tS9FXl2rEkd9fWdWNOWJthdl3a5pj1MK5EZC?=
 =?us-ascii?Q?jHUZg+qfLM6WVyE7NHtGKcsadwz8dxYUT6HNM/Ja13Ei7KyU4W4QBH0hDKXC?=
 =?us-ascii?Q?f16QjFg0mJDcy9TC292MxlbJvcw5ZH1wcTX+LU1ZO85V7WR75iWlLfKfJplK?=
 =?us-ascii?Q?cq7gZ393lqVAomFbr4hdl3mYMSFQ0DBbZJvQsRLQxprjJz+SVkkfLZ9RMfl+?=
 =?us-ascii?Q?4hc2HOOtdCUX5MEYyeTkW99WrJtEplJLTPRDc69sJnFIL+kCgZvtJYhFcX8b?=
 =?us-ascii?Q?5qf5o8rwO3xAPDBVfG4FQEn1GfPsVNkOmj4HkhgosPEsTb/N4dNgw/RiJr7U?=
 =?us-ascii?Q?XywAutCwbtKgjC/V9WaMHGQG7KUYnamwVUlHImh+uk02LkCiDV3eKktxs3iO?=
 =?us-ascii?Q?8IVCO/5PgZq5Rrw8k3dyuy3rSb0Jpnk88Ou8qC7Hu2DHuBZzYrrKPvPXUWby?=
 =?us-ascii?Q?nMru4JS5B93ojlPnf0UbXoj3gxbgxY6NfCKStscmIc5lD4pAx98bnukyjiH5?=
 =?us-ascii?Q?+2Wlmp9jawLsmRjl1W/Tq7b+zdUPHwK+p71YUBGqJ73G7HQbBl/T?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 159f2fd1-1d5e-4691-c284-08dedb04e993
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:18:47.9772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpNr9MEHgcHNNMVD7dX8QHyIjRZaNpO6dMD8IuGHQtsEabXIdtZBlEhsf1YAUOI8J7QwXu+0eXHfY/CN6Dxkl4aDQGkM90aHeDJgfOw8VB3pWkPhUL8OXsLijUI5xkIz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6963

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/t9015.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index da1a93946d679..085f771eb244f 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -78,8 +78,14 @@ static int t9015_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 t9015_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops t9015_dai_ops = {
 	.set_fmt = t9015_dai_set_fmt,
+	.auto_selectable_formats = &t9015_dai_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver t9015_dai = {
-- 
2.53.0

