Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F78A19CC0A
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533980; cv=fail; b=BcVA6xhNalHxEQhcofHfMvHnH4WcHYIJsYhiNPNl6Ydhp9mUKjn+ZvJoE6jek+kTileI8qK4AvTJBx2a/F/auTjzGFIAHa9/JiL0YN1deXXYhwO8Nvkt+PdmKwIrwpjyZxZRALajh8IbjYnoTyNUaeiqtwcOJ/y0edVneFW/eZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533980; c=relaxed/simple;
	bh=KMIUAfGWKzBzBPz2F2m19S8RWwvYY/+iH5XN5weY/aI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aJ7S46ZEAzbDU1xTr0SgT3Ikg1wgX7oGE6hSqrGDhKTJAGYHXgcW17yG4ILjbVNsiHJIK0hEDiZV1eTSq5n3hDnMaMHOO74Srm9deBaE6RTJa7co6pet5yoEFc6eKkgLD7EJ5Ssgb7Enr1jGy6FZ9CB7TV2PqL6RgoX0zQyrnJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X5cURUbM; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X5cURUbM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWItlroHVeW/Rgt9oTlNMPId/JyV0NHv/G+ylgQ1PF71rcWVxTOiFUQk3CKnsHmZh0Yb6tXQi24ndaNZFSQ2voJXtWQMUbj1XcWe+11h+/sAyJ03w/As2HVYOy8oPUs4qOT/n9cCTgc3oxaMwu4SmeIUYDtMgy7WLpkIlWVuWP/XJ84Pl4WDXUuye7T6Br93QHA0BsJKPijpKiIEtxDTaDK7XN2gDwV/8PgfSWFSzHPeduhIdJppR8kqH0/kBxG4/t3gY7/1y7Up8YR7gMu4DD5zMugTUaojRa3pdSZpOrwSD+Gg1rVtVNnMIiG5UTg2QqXbl5PYjCdDgsJ5MvSoMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RgKdRgIKjvRc8KM1vliM4TGk9EKEFxzdU9sGUHmp9w=;
 b=UGdvBVJrMKW7r0xc2Yx6FEyrer3xhFwFGPs5o//qgmpdYvSiCXSUl8Ebh8rsLqS1zkfDQI7oN6NZri90p/dEJqU+iqPMuxYso/CGNhzyvxE4F/Y8NLFaCnKLUGZAfBICjwRRzB39ugN7KMfLU7cEJOcndXHZLu+BHKEkopEp46r5mvsjO0+LINeFFrmJdxGtd/OhhXAGsYDKGQh8OxPpDSwpvP507cnBXhDY+OkgiwZV1zwkp1sq94EaPKBvmK+/7l9zg+jf45vKe/3gyHNoXSViZeYD0dn9ZmgoovRBJZR1Y7ABL3sbjucRvi1mi6SDSpdlchkpmMQobbkvZz9W7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RgKdRgIKjvRc8KM1vliM4TGk9EKEFxzdU9sGUHmp9w=;
 b=X5cURUbMdRLgFc22kfJRuYrEuqg0ckUSFZaIUTrAi+6BCWLxknvoX6QflU5PA8AnaSfDrVjsdzhNJiMoexVw0OqMJreBH6fShkTABZmXRCgcV1vKAczo/fhy3DByDdmv5QidKd5r9wPSHhgqdyS9xohBB9YQ/upzrJbKJOduXoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:37 +0000
Message-ID: <87bjup8ox3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 153/157] ASoC: rockchip: rk3288_hdmi_analog: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:37 +0000
X-ClientProxiedBy: TYAPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: b3065672-f85e-43d9-4693-08dd56066e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xc4YP1YTpd9rSlRQEobaiDjcMWEJXaamN4VdUfOdekd5tDkCbpZBAajlImVz?=
 =?us-ascii?Q?ydzxNwO/NT8Sh8kRqqzGMXWE67xDxCHKJn+PKbUfV/vTJziGTtXMJPe8Vv3j?=
 =?us-ascii?Q?JfMpabKFIAFFBEychvex6jrCS6ae6bl1xfGDeeThXTn0smGmD16N0kZaIW1J?=
 =?us-ascii?Q?To4HX3CBEGi+7qM2FynA+E45bkweWBy+yQy5owJL+N1KchYVfkldn5rCTRn7?=
 =?us-ascii?Q?vrFfgckVYmf+zsXdIGIXWW0M8A8G4eW7NdP5HKkkERz6hsNiG6qCcJFNcvSa?=
 =?us-ascii?Q?SkJVIerfzlLMnnCU6FJvZg1tpvoL4DuNPGFLnSszn8hjl8namcHcARS8G1sR?=
 =?us-ascii?Q?QAD7DL8M9Hy8rTOcQq8V9vY3fEGlgKQ+6I0Y6yygBSwMv1nULLXKBZe5P1uB?=
 =?us-ascii?Q?esH1tSG0rkUnCut3gQ894havDVA5p45LF236XGoyFW8YZzHrT5DdlKNaTWFn?=
 =?us-ascii?Q?q/IRnKb6QOW/ZJi0JB5RLWyNIkjx5iTru/XBLznVUrSYa0w6fbBidCpkafF5?=
 =?us-ascii?Q?jM4A53bVgpvw07/wOQw8/9J2tvNGNba7HtrQSp0AofTxk0nufQ2+0yODwOBC?=
 =?us-ascii?Q?9u5sIs5Eq60pwEkH2+HsFzu9wGiCKGmd6Saj+E7OvpTgThDnJlQt5E2jH8L5?=
 =?us-ascii?Q?5uE/yIzuaPDZNbjQf+FluoMkq695ctawCN5Q2grdN0oBXR12bDmRyQOsW/Cx?=
 =?us-ascii?Q?kLc0JL2MLSmRe+lJFIDtv/SCCWaT/Cg+ogIA0PoIUaNtPizdg+nlia7ZErl4?=
 =?us-ascii?Q?kp/S14XYtkz6FZjc0hHTsxSMN+Ap4gmNqYet0T38GT3IgbEU1/Zj+7GLOZ8A?=
 =?us-ascii?Q?qFoWlfMVgFSh8XHvaOQ3yyZWbfHbXQRJnTuGfOQgWEDY1QE8GaoMpiADYUnU?=
 =?us-ascii?Q?rdyrYU4p7yKNTS8a2CGlFU49ZKjEExuzseiKQh4gzz9Gtr87xtSpZgGJyMbz?=
 =?us-ascii?Q?zfJAaxn7n/joW6ldyBTelQJLIeqXqmeb75yYYHQLzAusBvtu6TlZixDY7s/A?=
 =?us-ascii?Q?mniS3bpDz2jz7s5K16U0n+yxGqrFq68zlacb4tFTPsHGa1gMUfDppBTQbKpg?=
 =?us-ascii?Q?keTyGp1WRsX6lFEudPS7ircyhPuJrAcrJx1qkNdhMLVMXMf/Jc0ao4RLa3cj?=
 =?us-ascii?Q?j2z7WCFuiAJN+x/f5eGNpy8TZibtsntw2V7Z1U+lW02AXZbn0Cv3kn5NsUp/?=
 =?us-ascii?Q?0Fujz2t/U8YYsCYoAfSYn/WaF2xvqT4Dc3IIcVUFBnsBNO+Alg+xNtQdgwSa?=
 =?us-ascii?Q?ew3fGV/135gkR6XYRgSsbBlYlT16+8Y8pKgapUl+Ny7x/vPrdr46MlTMgUjL?=
 =?us-ascii?Q?Mx6qDKkg9PNthR0zMw0o/4dPFDGah+s/v/TYRt5qWEVK+mIQVpfvdy1kiR4U?=
 =?us-ascii?Q?SqUqRynBXOB0wr0rUTjUfZkN+mif2CKScZOQFNFAQ1FzAw9GbnEl6Vt5TYUc?=
 =?us-ascii?Q?eCutajmRuCpwEqTj0EaPb6e0qvh6AOes?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?19vV5OIyJep/LVJ0668B7A9RAUWhypSv0ry2BkOLYpSRFI6kmdh2Mij9XjBS?=
 =?us-ascii?Q?qh17kVLrdumfRkd3t30m/1qGhYy2u77b4e97OH1LHg8496XnQrl/MI1E8/zk?=
 =?us-ascii?Q?UkMwPJTSIt0XzG3LFBonUyJzJF3At2dV51ktvGw7f0yTg2qPzbQUHpwMHv9l?=
 =?us-ascii?Q?Imt1kaqyq5QMRsYNjUWBtWbSV4Nvweg9mqaHYRAVAByTHsFx422ZX5peZQYB?=
 =?us-ascii?Q?ChCmpqd+cwiGSFlDz+I+NFnabN7w4hoLMuo4AykgeqpZNhIft4GJVRwRb4+e?=
 =?us-ascii?Q?zZbKmbTVqO6W8Ia+XmA63wNPmALqmUzGA5D56Cyx1y7/xnYu0XUHLkKeOC6f?=
 =?us-ascii?Q?X2OTYoBxTUg4QWYyqsyyWjHD4j6qyjceCFTPlZF+qmArmvGeQwYLnTMXq6PD?=
 =?us-ascii?Q?yQLfqmCvefpwTjl3FBBdohBfvsVYoMi2rPzbtvoikLEzvoIu0nfy527ly9ZI?=
 =?us-ascii?Q?tMwuSYzH7mtYEqTATGuY/zA1K0rFjtBk3fPs+JD5qTcgCWrCBjA8oKlAa4UC?=
 =?us-ascii?Q?Bn15hX58PhOmI6PaIXIjbnwT/QiPGWHUi0Ht7Y47/L9ZlRfDZgGy5uq2N0JI?=
 =?us-ascii?Q?3l34TgWoIIGd/lgnGjdcoKKgjv0ZV0UCYFBfWxj6smwfTjq62MprHqtWzbdo?=
 =?us-ascii?Q?7P7nbzoATNnI47VZS5Iipzj8Vuqst3IMjnsbPiR0Sm3lYllbG15zXUK/pCbO?=
 =?us-ascii?Q?F7eg/lYhX/AuaeImojJuiYPy6SIpO48YP/9giwhr/F63hNv66V0AFjAGrNFy?=
 =?us-ascii?Q?Cf2rcrsn50xkzHAH8rROIXdZfOmQug7iN8s1LEwVE1+WG6/o+jw0Xzx4iPYM?=
 =?us-ascii?Q?/vDYv6Mnt2smL0P6tT8bH6/rco9k45rmDTwkjScsLUDtWWX/qF/h1JH05xWU?=
 =?us-ascii?Q?jBNek2rZtk2+e/y67D9/d2k6mGAdMiBICYHdrAkBumRNB8SQ8AkjmgbaLXV7?=
 =?us-ascii?Q?cS075xxNMW9PdU+5vOPu4Jm5X5a9EQpTGJe44y7/9ZfbuR74MFDg+TCQ2q5O?=
 =?us-ascii?Q?L6PsEDmBjIi+ZO9xtI7OhmtnFX5fWcZ4gLCPvcjwuYt1JtC2HGtLJ5bojL+g?=
 =?us-ascii?Q?2k5OeNpTBtB6YvwI2ZP/LHWaPXyfbnGsgdaCpVnSg3WvNUNNZU+wFixlkww0?=
 =?us-ascii?Q?jmesyrBldu10ELCrFEUgltMezpNn4D15nveoUuF2h/pk1wywJLuEIe9goyYj?=
 =?us-ascii?Q?8x65wDiJ3PzJmBa0TIYt1WYRBDK7ZoJmSaaKVyMjqG5w7LxftgdmYj8lM5m2?=
 =?us-ascii?Q?7BxsJeiEv4x0gsQnv/sidm50bVbJ6E92BHsKjPXwMmb8dbWbmuzkhVinPNGj?=
 =?us-ascii?Q?90dfwAVQNqqBkaZiuwIrdyCD2EEKzDanwUEu9//X/qS0zn4cuRMAIEVU4DEA?=
 =?us-ascii?Q?HYKtzZ5TthlP7+x7cJ0U2FUCBKI+ETToDuZEer2NiWza75VaWX0SiWfunDH3?=
 =?us-ascii?Q?KyA2bxz9YiAFSyPkrXkWoM9xM3M1dpeAu6+yhlZh06rabAnLLrmQmopgVrsE?=
 =?us-ascii?Q?0mZq4l6ClFMIlja3kp61ZGVc0rdnTKrQA93IgMggNBNvlFdnBrWBPS8JQ2kQ?=
 =?us-ascii?Q?ZwCbG0wey3HsHQY1LAUDAmLXQfSUigF6xdN+nerF+uwh0isPeKRSWU6ZapUX?=
 =?us-ascii?Q?ZtOBue9mj3AjG0XuC5aw/88=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3065672-f85e-43d9-4693-08dd56066e07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:37.3330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQ3D5lDK70rFD8D3bw7zmSSrwBrjxdme0426SFfu5Wj+1fo+Cb6mt3x8TJhIqjDWdNX4SblSFs4pWlZ+mjJYdsYCnNBu3Kp1mF56HPY5zUVB+GHq5LN1A3f7ZI0kiy0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index a65d923d94dc..ffbc5a39b493 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -148,7 +148,7 @@ static struct snd_soc_dai_link rk_dailink = {
 	.ops = &rk_ops,
 	/* Set codecs as slave */
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		SND_SOC_DAIFMT_CBS_CFS,
+		SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(audio),
 };
 
-- 
2.43.0

