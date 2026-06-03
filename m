Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77AE39183B
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 06:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469409; cv=fail; b=E9PSWXlU0OvCwGsnI7Aa754CD1GLlQikPWKT/MhW/xIXtZwCyBiZyaQXppPcGpIMMTuduK7cNYYZcdo2yc7JUPKldsJJJPhxAMoaI2/3tOAZU+b1XQZqa1UnGtFp5OfbsTwtZP9XMVf+GqDVWi6bYQHSXLF5x9uEwU1OyhqR4D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469409; c=relaxed/simple;
	bh=IarYQQveJFu78d5o+gnkaG1+Ph3MTxKz+jU21SfWtJ4=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=StM/9UGC3sCgon/6RA0Ff+j1xCtzf1vuvL/hd+uftCdX8LxWXI3S+OJ7uMVgdix1FQJ6jf6LtM27S91jxBmJJ0/2mKW8UNZnV6pC2qmb5JMLRSFQtwU+IeoX9EwKtdapnPh3D3ucs97hf8juvoW/01fPDj60wORqLRy1gZql+/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wq/fh9iA; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wq/fh9iA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lw0M/lFfOdRjeK/YXOInNu63gLtLhNIG/p/VgEGb+ZnxNUXHT/gDtaHFDJsam80r84EMtDHhOO/MAMbeUFVrWleGYtCq05qHdgg/ynG7Clhjn4qFdV0ipFWimzkHGd7j1Z1bcB7i+O7G3P2R+5Ph9ZJiNaoW1izoXrnlJTrk5Dawomk1L5ehHPlMmK7z4JaDJZri+PLUVO086F2BkwPzDDaASYQHLVgxENkoNmvqVHwtBR4BgJ4Acm4qidi3e5A21GSCbvIzK8CeoFPSjFdyRd9dLvS5/fjbk/v9/8Yt0lwZtvsrG/2wqHBIfErXcHZdZSKJvyFlsuCtwOOI1MBiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJPX+IhJJEODyhOA/zPKBvBLPQP0cf1+KkgQ1WnRyuk=;
 b=PT42LA9/4NDAd8W5OIqF2tSXC3DU2UHpffB/kZhZ9zzqdj7Iws37XRNRjgyaQu7g42dH4gTVFx1xIy3dhC4kWWr1eccTsccVriCPUHEae4nW2/pwxnVjGVoyU1lP4UKz8qqOV9ky1eJV57YKUorbg0DKCZFqipN2I0gPMYseGfNWryXtsoSwh+N9cfdL6ATGqYmT5Avi154yqspVm/M9i8BgwFEVso/sH8oSOZ5q65LBwrkrhjI3UKdGt4D1mN8dYz+AWxF0sLk8O3rIXw5aE3l4qrem1uKPROxHKhfoj7qn1oH+vWGGaG2Ac5Zo2G77vuIDwbUtm5w5NB5dulG7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJPX+IhJJEODyhOA/zPKBvBLPQP0cf1+KkgQ1WnRyuk=;
 b=Wq/fh9iAjM3dUw8gvR5dA0KgmwGbykAVOSyFjs0W1kSn2uguFgSNZO5rE/io284jt/Jp/x0cvNv5Pbq9OXUnrQLLZ08hvJDrnLKRUsbY3ALEMaIUJywDkaipo3pRIe2LjE2XzpmYPeMw/oHfr74NMWRnSjxpRKsRNC1jddkoyYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13496.jpnprd01.prod.outlook.com (2603:1096:405:1bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:50:06 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 06:50:06 +0000
Message-ID: <874ijkce3m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: amd: acp6x-mach: remove unused machine
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <877bogce4k.wl-kuninori.morimoto.gx@renesas.com>
References: <877bogce4k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Jun 2026 06:50:05 +0000
X-ClientProxiedBy: TYWPR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13496:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf97c48-a9fa-4db8-a57c-08dec13c5865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	GoPSGtdp2vTBJmgfVFqeiqA95VAwIffIN91BzcQ1IRgK+Hy7xs49ym9CM4MvVobR+aHhWNTelF24v78eIjcvrHw7XCSE+/d10Lf4wgUyr2sGW3IBB4/VjodQ6GspHalCkN44K3POiaLS0hbJhDOI2j29PT9xraLQEkdcmUYjAC5hhJ9sUxzD5YEUfl/siNCSWWubJtFn9UhWd2qujXqKSfU1Qo7Q0+s7sKq6y0gqpS0o6CVC3sKMIFrmBkFPUj1xRejWwwTvFtozMvkokPSc6VrzOZtoAxKhBVqdxrGttpOP1lVb4Qa1FGE62yYWxUxPHV5lJpR+67FbJKgwNVGfgVqMQlx/Sn3IWqrw9WER3Bb6TEoBCWUEj3e58ewe113Q10rulmHiUX5sjJsarzY6Bd994sIExekVTwxSS8PxdYuMUWe4QEVSatI3YLk0bF7bb8JkFYM/r/Cvb91aH5I54AQmgvjsmQYx/LmTU0yVHbWYYQUON2OPKXuewofEmUj6IP+2+Mt2nBiqJnmXUusDEKfsbV6tHnvAn0zSTmzvAOa6uJ5XWZdIXNYqRnoVL00Yw+LYzBUFiHQMXFxTZkHNfOUANIBU78jCuVIyVpBhyIpE278uOC3tbQqU57mfiYnJBG4WHx+/bZ9aqnNNQyTxLFCP8T9h1xX41E4znptgx/QImhOah7FycpZ7l11ZRf93OiNOGxqPoBIRmUX5wcjQfqsRkW8x41LxTd7t6z8puDA/g0KRN6AKVnYcyilon9SF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SYLTOvJFTv+FJn9XZaKCvFmPvBwJZPFeFgewcyBwX9G/HWmneQQQqKjYNqkM?=
 =?us-ascii?Q?Ce0hb2c1c44qhFPyVWG8d8FdgnjLjK5Tp1gA4H/tZ/UZb+beCFpMTeac1xhU?=
 =?us-ascii?Q?5ei0oK222OMBNU85tW9GaWbn4F+B9fVZ0BEdt3s+8qy6y1nYGAoPxhWC8CvI?=
 =?us-ascii?Q?wpBQUvNBHYGqS0Civ+5d0adx8GzxSsGQGahHB6SoETSedZDNjzFYUuWatxHz?=
 =?us-ascii?Q?AZio+wlK4qhZ/U1hQkqNPX+IAiZOcnM6oomEFfaOALFAHm3qz8hD/i1N0qDq?=
 =?us-ascii?Q?1DAkqEsYyGbYyQgkW4+KmBAXQcHvVV79LN4mk1Tdl7UA4PDA3GxLEcI367Op?=
 =?us-ascii?Q?i3PGpzZNIIwP/ek/1JoJUBhAvSTqw5Oozv7HJDwLdCE1LcWLIr1rBCdwr5lc?=
 =?us-ascii?Q?wdkiizim2oCLVqft7tBe8bW8cgyfxrn03vVzt6j7ZoR06cyWUIof+tDjS381?=
 =?us-ascii?Q?Bz2hUCL4Xs99pEvTrMI6TkHOBTTiGdkIHpEukXx4iOL0LURMbBlG5NzWPbLa?=
 =?us-ascii?Q?zkhiYiThiBRbMIEk3cluha8nf1FMBAscipm/dpgKQ5ZN4E4+23Dn53g60aD1?=
 =?us-ascii?Q?p+Y8jBsYoORHmQ9yRGPLmlosTfooqkS6j2UN3iGWYCq9+f878xvQVv5QfwJp?=
 =?us-ascii?Q?GbJW0oVhFNhOk3VF3iZI4fHR7lGwHXGdXy0fvFRsVGzy80yA6xpSACjnqkDN?=
 =?us-ascii?Q?QFrDVzWl5XP6ElAGugzDcwT55YJUDfWNzPGTcGakl1D5SWxLiYg6Gjgp+DDd?=
 =?us-ascii?Q?Cxg02Y1Aqm6lUgsu8Xmz4oW9bTyBytcRPcf0pFF6qPSD+p1bl12JQLnug1Up?=
 =?us-ascii?Q?FvGZVSHMojA0U5tb7kF+gUi1lEwdjZLjIeuFHieasq+UiGDd/Vp0MAJFGXgi?=
 =?us-ascii?Q?AZ42JjaaDGMDIWRuPLa8TzicCoikYqVcoaWgCa8JC7Wfoms4rpX8PlDSFL/t?=
 =?us-ascii?Q?rjO+4xvcsUXOrGIE6aGYBzesW6oe314M3hxE+i8XrNgmZ6D6ShINss/AUrpg?=
 =?us-ascii?Q?eAE5wPF6O5aP2kZqViD1i8bfdPjlqvisS8IW3yHpsxJgTQX5f0YQJ5+CEOKB?=
 =?us-ascii?Q?9aMVGHrKbqYQc3Dkujd8KiAmHmL/j9GyZtWTXYNuZKD/y6E3ygJSHKwe1jHw?=
 =?us-ascii?Q?sTmJSAv5h7YMbf2yPiGE51wT53zcMSh1gS1IeYF8xF1av5bWT5cwQ4fkjoCu?=
 =?us-ascii?Q?Q5kk9+B/okUw6oU9HcMQMhmdll02j+Oa6rNnxrBrhZdUGMvfhOREk5ie6CwS?=
 =?us-ascii?Q?epHzVfsdVO3gaFWGpINZQg+ykUyqW93Yu3uQ+SlOqLzB2R3u+jIkRHXxYMT0?=
 =?us-ascii?Q?eo1ABGnTPBcwEnnuzO4ZmxQhOq7PIrkv8Abbwp86jeINMW8c15hTK127C5TP?=
 =?us-ascii?Q?75kKVXuHunra1So4lTyuWts6mDq9SrPRduBCX+EsPhXcQhPGOcILySUVIxyC?=
 =?us-ascii?Q?OINrnhVIM4Vg+SGDYulEjwM4oPUfBE/VZDF3MTfCERoghbnNfVC/lsBxvejt?=
 =?us-ascii?Q?nNHcWzIiapxEmsBkkUHoaaPsxVsu4/XlETBWgckfmdpPvnId9abQRkN4KKfc?=
 =?us-ascii?Q?U8TezpEmDVEzEDRb3+bMSuf9sE5yWBYaLPB1DUOJLco5eZ7zRdUoftD7wY+A?=
 =?us-ascii?Q?DFHfCDBpsYBZfJy/YvI8msCBB0TSMkmcUU9KVLZHgAjaMGTPSapQWEwP4nNE?=
 =?us-ascii?Q?ExIFx3ny4BJCZb6naOX5YrPkJ7u27ETzvG3hng4RSUum4p/gyq9SKc9ZEVg7?=
 =?us-ascii?Q?5A9O5DL3aJGzDmC+hMW4JYnsSwGy9Dq6i/yyb/BRsFXeLEgp2QfP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf97c48-a9fa-4db8-a57c-08dec13c5865
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:50:05.9586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H62NsTIPODebjuEjWy9HXLR1Tq69jt8GWdbOQFNUm/UNGf6p61+S5hqjEtTOaRFGiuJxTs8corOS+3gMpmH1ojQG+yulVMVrej6sLtTry6kasfEZuUJ/ZyB2u+uLF8U7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13496

Not used, remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 7a637d6b55764..63f2b39f78b79 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -800,7 +800,6 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 static int acp6x_probe(struct platform_device *pdev)
 {
 	const struct dmi_system_id *dmi_id;
-	struct acp6x_pdm *machine = NULL;
 	struct snd_soc_card *card;
 	struct acpi_device *adev;
 	acpi_handle handle;
@@ -847,7 +846,6 @@ static int acp6x_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "Enabling ACP DMIC support via %s", dmi_id ? "DMI" : "ACPI");
 	acp6x_card.dev = &pdev->dev;
 
-	snd_soc_card_set_drvdata(card, machine);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		return dev_err_probe(&pdev->dev, ret,
-- 
2.43.0

