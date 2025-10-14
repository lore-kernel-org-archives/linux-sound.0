Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5DF30AACC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415918; cv=fail; b=QqZSrm9RyYTvWkE3lxvZ3JPlreYmJ0lBe/YgnUdjGazuQmWG5VOAIYauXznGaByBPDEkrfmU0mTeSEoN0It423GdogHU0dlku3qGN/jFqpClTYirNYnHmtpQ70cAY3dvT4vnkhZFt/lqlu9M+g2fZjzsBtEbP6F+h11D3j7kaaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415918; c=relaxed/simple;
	bh=UldUO6UVbjul25A+A7VeROXA5POma68GxNOr52waxTU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tuVTdQo5NXE9uBp5TSaRUOvrn9jJz0CDuklcB2Ecx9MlGOJdwYp3DBqf0oYMiPLpLPxby0KCQ1I/6uneZFEqnzN3FTLa7zJMqAxOcdMUISSH8zG2QM6FL7yKN1SxRO+DmUG7Hf5HSTnLDaL6eHYz1WICfQKcFRbxLRs92vGh50c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PvHjJb2O; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PvHjJb2O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdRb9Gb1ROu0U/bZQoZwa1NX/0cAvLX6azo8+cemLSI9GDYdFNaR4i3P84v33cWzdhxWnlq4iDhyfZDsmS4bYmkz6Sj9GOz78mV/IzIFZkissDD+Qv9T2LZCiqzMHtnqehjRMHD9WQYE5hW/GPsZ4S3f07jxRz4rlAldM7hx8INN1DxoOFs23hXI7XsH/3wvkvg8Asqhmt9rk/NR1QCBNZpF8e5fzbFEdJwI+LpoPxAqr3J1fs2HFe6ZIH08EZRMOwZJxJaWruWkev64ts4CaZtA2zPOEmk+CP7Y09nbFi95S5405F3aM54+ra0svkBXhinfbdU+k3CvS0hSWrKy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQvQhKieAlzaUZsGOcrPAiGIV1toqx3glWHr3EaB7z0=;
 b=M+3WyRffqO8QO1s1oyo+TiiGMVqRQxdCCRm9l2QUhiQYkJ5xMuRs4zCgSRX/t81tKX8e/IkNpSekYBuFnaOTco1058D+e9cM0Z+wuPrrOedWxKJsYBkXyv8d7TCQebuJiKYEDk58QUk0ht0QcqAf1DQEIIA4nbjkyirwGQfnzNIigMquyd+xjB1/mgig9QY7n0lRvFwmWR+uUhnqI5lmXz2dRw0/sBixGmfoB+IGbTYD19A4mplKqRQ64xbZ3uByADgTOf4xKpodcOI47D59TwGx+w0K0eTQYrbVUQmBCzusOsnOvKZWqNQGDqV1n3MTKv36LjrClpKy7odI5Qn01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQvQhKieAlzaUZsGOcrPAiGIV1toqx3glWHr3EaB7z0=;
 b=PvHjJb2OPZ9Gv6MQvZjyxY/wtuF2MNJYuIrD+7qT+JoddWPtZwLJEA5bXVQNiEDogKzJk9d1fan0omkuebGZLA89Afi9R4fEW1hfXugoxZqW2kdOHI0DWbesrI+ZoqSVthd7HaAkqs90+ZdNWQVbuwlbopI4M3OpCyhZwcHlLVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:12 +0000
Message-ID: <878qhep0t3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 091/139] ASoC: codecs: tscs454: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:12 +0000
X-ClientProxiedBy: TYCPR01CA0185.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa6490d-b37f-48e8-4909-08de0ad9ab12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qfU+d/n9+uh+LjsqEpytL+bJAneUTpqw9ujhjzuyMxlhsG78fc7zMAMXSab3?=
 =?us-ascii?Q?kZNPkLUzYt3qvdUq0PPWfI55XYwhhNK1BcwCmrhcsYmNzNLeAev8llYeeBLZ?=
 =?us-ascii?Q?2uHyTapipZjI23ZPIuQuOOxrH7JzEg8IkeCJkgJftWsmv2NKHlkw0vwhDtQd?=
 =?us-ascii?Q?P2cmBlF1Sf3v3dHbS5ezxupSanUiuc3GehOQuR5ueuAmjbPwWp+E7E5FLVru?=
 =?us-ascii?Q?efGDQHmg7lbomL0IQ97jM87pIBc4/2RvEQqfn6EWkLgVnNPwZMoWxXZRP+EM?=
 =?us-ascii?Q?v/UF8WOMR2yRVh0MCv1BWCobjPq54rEXZz1IPE9ayWOtWm2N19EMw2yThYuE?=
 =?us-ascii?Q?udHtLqIZ5H3Zpyh3vciYfZmpzP7XDBMujfQIGvgbgHpY6Ij/Y8shc6oaJZac?=
 =?us-ascii?Q?iLjgfc+h2l+jJR62H97dXFYuJOPy9h6A1M1zxMj2UhTQa8H9c2tcAcj5k8CN?=
 =?us-ascii?Q?GozPU9jUUgkCnob4xsYviYcq0yQT4OqS1YL3fdCZtFXR60V1+c3Q6Rcr69wX?=
 =?us-ascii?Q?s9sGqJyZIC0WlafQ0OPIQH66s8qxVyuIEQC7nEHWLLQDNZhFEGPasQbeUo+n?=
 =?us-ascii?Q?FO0n3XJKZQ79fgpzWJy+qMQamCAxvQOsPsjGTvvRi0OImWFbfnJoCfZUJiVK?=
 =?us-ascii?Q?+F4snQioR6g6lgnhtu7jh+It9FdakQqJWDqkyni01KM5Akl/cU3VLBqk07nB?=
 =?us-ascii?Q?pzqZXDnoidtONHzneKB9RUmsqvmMJoLZN4G2cUBB4dIjTT/rBugE4cboCl6z?=
 =?us-ascii?Q?7RAJu/wyeZphfhcB5eI9BRh79S4c3fmtG76OTM8hNfOwD/cqIhmsgG05rHpw?=
 =?us-ascii?Q?kT5y85hHcyTtI4KScCPSuAAW1I9x+7QA75xhjrVnJuuKBgrgr+UiM8WHfQ1F?=
 =?us-ascii?Q?zTAcBhWbIDmZ61VSjUZaqgk7I8vr0KxcHwUn7NkPjkZJwTvF2fpmPtlapsXO?=
 =?us-ascii?Q?ncALOoOX08rMoq6yD/uDXa+V/y4UcU4bekjn06Yf8bqTnjAfnZS3+srz4j08?=
 =?us-ascii?Q?7AJXHXYSVAYT5/j9iiHK5DW8r9BlsSvYZ+xMsHkNrrexrD9hfb/hcnMWWHCs?=
 =?us-ascii?Q?UZz2Iiyedx6FS4uSM9eIhh0r2jh0DBvpF1OKguVncAK4YSMQVkjHhNQqpLsr?=
 =?us-ascii?Q?9kjtYSn6TyFrbdJHwpMFU4aOlO4TBJ2N6xncc3i4G29e2TzXTS+mrbpGHUW0?=
 =?us-ascii?Q?gNrmI5LJubNuBSkPCM0ExVIN5R4OhWEE+aenrIs9FCTmSQnU6IhWIE1tB6RW?=
 =?us-ascii?Q?2xFg4f0VFg0zXsKL25Scx+KuDaYzwaALTe5xiPi5G0dqVgKzu2NLmSNV5Ajd?=
 =?us-ascii?Q?81U6sy5j3gn0MSr9+Q9ObDRRyK/Hf+Jf5RzVCxVNsR1J5Cgv7Nx/ly9jNsxE?=
 =?us-ascii?Q?l6OwvXItJkjIevD2H+kMpncT3nGSKpxcG7YNlqJoGHOO9f3Uj+1GkJpaD4ZT?=
 =?us-ascii?Q?9blO70XJMpKCtr2LRynC+GdoMSn4r6ibwgt5486xXxWvsZFbH6E0FKkgTJpT?=
 =?us-ascii?Q?5TJj5hIbj6BAS/YfUjzCONDl+ZXH4LoxRmcF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c4eDIrUr12b+2YeLZNqgFrcA2KVEqt+R9jXnCuH9uHuevmC6SQ3dVdU6iUvH?=
 =?us-ascii?Q?6lLSny7jzHaggVH6v7DKZ1dE/cnjq6cm84+GSuPh9ahgJ98CXFCjLJdlCbTV?=
 =?us-ascii?Q?m14uUe2rjC6Q7alsNKod9+WET3f29E/Cw+Y2h1r7xWML7lyMh+wbmaaLjqun?=
 =?us-ascii?Q?imWJwyGaDdTX4LZUg8tABM8+X+45EGos+p43lVaBb/G9+tOnYH211NhND+Nr?=
 =?us-ascii?Q?87uv22+qSz7meqHZNFW6DUSWN09TEAhyiRjSiaWVktFgbaOFmYYOV9LmiX/u?=
 =?us-ascii?Q?Vj1dWAX0TFnJ/ZHZUQxaaj3Uf4QMDnqC8rkmtiU8kOjzvo92gJ21L2QmJ0Kc?=
 =?us-ascii?Q?/WNgAbxLC5tBCUIa2aKxiSrum7ExplNo5uBuUs5mBk4/aRmbOgVGFQfpdFbp?=
 =?us-ascii?Q?GnZfrhsCSNnxket9oXyOg2BmgUBumEXgLIySAJ3rzocn1/OnbeDjAoM4I9t2?=
 =?us-ascii?Q?jZeptch9WzbBvdTpjZzjVVAwHyE/G+LB1lbnAO7oCLCynMp1PZ5prtxqwMWK?=
 =?us-ascii?Q?oNdcdMUJS0LGppg+xBSvtKRkVcLHzV5VSPpfpk4gIv8rcl6iW8rbZgriKh+/?=
 =?us-ascii?Q?g9IWuitAAawYCeLtWjA30QcSzk1QvaoMyuUsY5aq6BvEybVmDqIBnJ9cQ0M7?=
 =?us-ascii?Q?sYTmlM/kwWBetY62Aq/hBdUg03e01PqdNLK0vEoEyhBLN5diO4RIv4mzB2OM?=
 =?us-ascii?Q?dIKIQ2MiSt2Ipaqr+2NRjL4KOWmFTLJVga9OI9GTiBk1Di23PvlrWJ0oZUNd?=
 =?us-ascii?Q?7o182KoH6vFCk1MdPe4/auKZ0ktCdIIZa67/E8bZ83XdFUzMISVh/jEzeHa3?=
 =?us-ascii?Q?shNnJ08YQrLNLS+976hByV847xtKTBosar95kyhD4yba+nugEIffbkwbaMch?=
 =?us-ascii?Q?8nmt1qDMbNKkMg076QVuu9Zwp11YH6HL5UF6O45C+v6t5WZhhlE5ew60QYFP?=
 =?us-ascii?Q?zQ3tD4lBQkoKhhI3hHMIU7/MEwEKVV/ET+N8eEnCsJ//NrDJxcxjmPtMUcCW?=
 =?us-ascii?Q?EeR908qaOv0EZZxOPKWAjmRlY+VE7cbHOWgIv0yemRLClJqpt3sxEZIJFkOE?=
 =?us-ascii?Q?ZJVt4nL4sfTPJ73FZV4wW2OzgFm+0dnZj6WRfm8nqvHa6vrvq2bwwIBudCw5?=
 =?us-ascii?Q?SKmIe8RKLghFhNhJuU/GiSyRUYF6LzoN9xh/VL1feLc8Esuq1stM935JvUs4?=
 =?us-ascii?Q?nw4KtyULk2hRZDejY9oPSZwvYSIvvwuoN+kjbcQSG8XeWufepoHQjDHMTsLo?=
 =?us-ascii?Q?Dx4nRs4DrPwH49tsBU2t5+mA1sWjmeNZ4jDrq2gE5kyCO2Rtkn2z6UqhsQP7?=
 =?us-ascii?Q?3bVTtlSGrWElBeOgSfpyEQ22Qy0KttwLcBW9QyMvHdHapQ0xjB4PWS2GI8oH?=
 =?us-ascii?Q?qUgaZSIdzDDDC4inKcgcyYGgXEbCf691/fe+6SDKr3/ta73RIyPtXbcKsSOj?=
 =?us-ascii?Q?xEqjfNypC0xytfcpn5lCdnjacaqQbhuu6jK+7pe0UlAC/fxtNSv7C75pWzO1?=
 =?us-ascii?Q?/pYuWalre/ZihVBu7c10cH8rqHxuplX8T7k0pdfA18udeKlLFsY8Y/rt1bO1?=
 =?us-ascii?Q?W17bkFlq1uWw+pV9vLYynAtH8fmmVvUshLn1NCgaFNSU0p0H6X9obaAqm1AX?=
 =?us-ascii?Q?hmmKyIo2L+qoUGfHDyJHoT0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa6490d-b37f-48e8-4909-08de0ad9ab12
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:12.8391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5W/mvYnZNEsVaS3pyb9EJpKSOLy52NihoewtHkuoHnR5vhYzsSZ75CLZb4mtamG89IrfoZNdQUFBgLnlyaZdWaDONx62uzl0zx+VZNbxhC56SZO1XKHwog+FU5IdK+xw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

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
 sound/soc/codecs/tscs454.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index da2f3cb1cd130..64d0da40fbaff 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -308,8 +308,7 @@ struct reg_setting {
 static int coeff_ram_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tscs454 *tscs454 = snd_soc_component_get_drvdata(component);
 	struct coeff_ram_ctl *ctl =
 		(struct coeff_ram_ctl *)kcontrol->private_value;
@@ -389,8 +388,7 @@ static int write_coeff_ram(struct snd_soc_component *component, u8 *coeff_ram,
 static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tscs454 *tscs454 = snd_soc_component_get_drvdata(component);
 	struct coeff_ram_ctl *ctl =
 		(struct coeff_ram_ctl *)kcontrol->private_value;
-- 
2.43.0

