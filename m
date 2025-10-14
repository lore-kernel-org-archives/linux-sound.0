Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471CF255E40
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415909; cv=fail; b=p15DJWgnOW+LbSXEBtxosALbo2+4GBSlHlN4E7avoBSJXakizREzk8vjHR1lH3c3ztsNSrLU6094r9j8lo/48DYCYbgYpcDS2A5Z31N13Qd06ukSB83IOUvEvOp1xeitvndTtE1Uy145SIou84qBtMml/+MNHWQKXxFk6Sj2mKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415909; c=relaxed/simple;
	bh=+YflOcQ7rW9HGrwGmNwwajvQgyinJozj5ybIpJz3N/k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eH7rQ6HK7xYCmnsvCF0wC8m84UU6ufDDAtb4rYYNoIsnLUtocsmzdNtS0p7Y2RO+gsP5I2fmtQsnd/Pe2Cv8Cck7L8duDkF0bj2vQlmnO1naox4hPWn1VazuK/497S6SDDyrnRNf3N9AANzMOqvq9scoVYIO1MdVLeSAgBb0ybs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HI74yE4O; arc=fail smtp.client-ip=40.107.74.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HI74yE4O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDdHz3+1Z5KsKK753OPmaOS6JfQnnrujCQJKCHetccdA5RPHQsUU2XLpy1gUgSySHuvK0tir27srfFIz8syCsGks0W9EBvjRpTlfDgkqhV1RLmXwLWwthaotWgUXc/78JHoEx6TKP0NO31YR/WMLVE9zHZFNTGdQc7jl+Q+Qd8G5yC8MtljtFQs3OOW/OMJxnKIlK/r8T2ZLb8X59mf5PhAMDyfgOHuhv5CwvrfNnu/bk9hvDYjzPTKTNkdp5tHNpN+vBxPySCqFa4aeYcXv+n6JFDD7cIWPk0UxP6ANwW5Sm44ZUPWOjLhub937l0AzbrnablWw/VLAHoLYgfJfsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQq+3VN9HFpP661eq1ezmM7bb8myxuJ/tPztNq55oeE=;
 b=n06TMe9a9cYAZnLidsMwIJUpcpCHswztMdBV6sOZY/d/Kk1aT8vQj76tfiofresYdXigi926Wzh2WY9WibUnzcusfEBCuwqAxJLHI19IJj59HJbpvEL8dNgnUoYrs/TcNsqMjqWGLCpcpSuXgNRYuALisGiT45qpW/3ptKYNywYQUuim4FI0afKfh4UGYBLpvGc4SKbM/mcD6b4sSOqqcH+MZpgucFsO7MrAE0fjUwVK5q4d+FN4FtWZRn7qCumqHGnwIb6+Z3e63Q4wnji/0LsUIzqM16soNbcTUFY2ypr0aadVOzT5bvomQxJKyRO6P3S+EgisQe4kAxiV8VZTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQq+3VN9HFpP661eq1ezmM7bb8myxuJ/tPztNq55oeE=;
 b=HI74yE4OU6tvXJZAXVK05zE6bDUv4maWyQ2ccxuzhra3pkBWEQ0JDdBJ7AKS2qW0kCp5MNqLDV4H52+P5DjBlHZs8GVzR9le0d2NMwTTrhU53zb5AkuyjkbB8n12kSj259oAeGrKkvX2iptajcsaHpAAtNSlFlEP1hnTV+qNktk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:05 +0000
Message-ID: <87bjmap0tf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 089/139] ASoC: codecs: tlv320dac33: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:04 +0000
X-ClientProxiedBy: TYCP286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba77255-a8bf-4fbe-0fcd-08de0ad9a65d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f+zWOIk6cnXVS+q98x2Nw2B+WNE4pYd68xNV6L7aKNg9rg6LRDs0ZFn1Eq3B?=
 =?us-ascii?Q?Z01Vtkpx5BgPtW2H/HC4GbSz6BkBUDrRBm3EL0RsbNtMYKJwtg71TpcXyipf?=
 =?us-ascii?Q?/tjSWA1Qr0n3NP+Rg7TCgwdTQcHvJXW7Lc6ANRVgVDDK7MnM+NVRxK6Szcpi?=
 =?us-ascii?Q?03com72PU5dbVc8v82djAf+g25XV5CoyvwTbfOxWwAH8sqnPFd+eiOF8bArN?=
 =?us-ascii?Q?mtgSV2lEnWE/9NuJwND1gikewYqLaVd1Q7D648loZlw5pcORlJDxyTQ7cztZ?=
 =?us-ascii?Q?yKCm9I/epqa9JO9NYRXpRb6DS5erz6M3jCN3Msf7IMQUBMlhAkWFpRUURh6+?=
 =?us-ascii?Q?xi9GpHGPmG3NvI8/1y2oMl1bR9ZSd7cLk5B4bqm/PIlGyqOJQ2x8H+nZZ9rN?=
 =?us-ascii?Q?ZmRJQ22PRe1+G84CadiEaW6qnwPcDc1C7nsmI0ebgyt2QX91Z/DtZyUnamYO?=
 =?us-ascii?Q?U0wCUbX689EuMaN/NXCIPpdFx6ESuRu8ZLGtExl1RWazsMYHVY5HCmnMBEDB?=
 =?us-ascii?Q?Hu3DWOINvdqjV7cqRrHb9J/60UZKQYZzLrRmRJ9yNlVu7spKiyGfmLmT8xi/?=
 =?us-ascii?Q?hBtM3SmW2O9Ek97iCNnGoZaS8PY+VjT7NPBa8nxJw1JG0vhut0fTzzfF8lCF?=
 =?us-ascii?Q?muAQIOn00uFKpRr/eBUGaOqPjl9hFlHwcQTrGdeMqCnrr09pGrBxLmQJlDG1?=
 =?us-ascii?Q?sCgFlQn9AAKpyM3AXAFrGdTZxenor48SF8xKq4b+td87OFmGlFyKZyVv6ilH?=
 =?us-ascii?Q?LObfTWGwR/5ROl2DuSJUOIdPyt9U/K3LkRMDWiX1Kn44E6R5mr/ZSGEDyhxE?=
 =?us-ascii?Q?kT8Ck1yWwxSb+ZP7Pe7zwtvasl1H0BzI4KXD6Ur8v27S6fnM/1Kfhibeu2Sb?=
 =?us-ascii?Q?qYfdOFOU1sHvdlunICyW64AK5y2PuSFrh3jsLk3BjtIsdaSpEUzpDriKmPS9?=
 =?us-ascii?Q?ENuo0gNQMWdjJ9TindKswVSnCrM4r+widTH5rX0CwbP/3Uq+GSnB0J+1h2wD?=
 =?us-ascii?Q?Q+yV2T1jU4izxwda+4TuhMoMvP6NHyn5uXvB4ySlK1iUieOcGAAgW58rY5Mv?=
 =?us-ascii?Q?n7vQA7ZZQS9G2jsNiptKgo4bOoDyxRsxBiQB8zlV5FURBZpaNowm83CQKlZh?=
 =?us-ascii?Q?HaCA6/jeLmSg/dxKPV+wSWmjNQdJeYbxQWbbSfD8g0FiahFx5XKbRnBL1oHM?=
 =?us-ascii?Q?dvBFjISQF0alS5Vc+oS+icwchUXvv/YfnQJjB2wq+/Q/L2Se3aE/QarKlpd2?=
 =?us-ascii?Q?ZavbjOnQ8l8GdCud1mauovDhdB9G1oHXmb5z09KD1lVxAFYSNCP5MR1O3lWi?=
 =?us-ascii?Q?N9glFtsHGqkwHeRoEsqJetEyuy+ovILSFpa2lyYagqQpH+ZIrMMcJAY9Hv42?=
 =?us-ascii?Q?bbGBW+Ke/z4HfReXLACz3SD37J64qmWpjGKGy56gc8RJrxZ7j2AOukq7J7e2?=
 =?us-ascii?Q?d6QV1lMZWnHwSQePClr6VytM0COWn7NuR39FhehCqt+grx91NRAxWKQEgneG?=
 =?us-ascii?Q?JO3lopsO2XK3+uNgrCpnG7aLad3aM0y5aprw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?URI/qFlZQNrCtD9DgKLcQ0k81GOB+wH1AzjT5XENpvL6SQBKUzuBimqTuY2u?=
 =?us-ascii?Q?iAZYjVjoCrNQc79VEw/oyb3KN9Xn+clLVx7ePbfG4bHB2TBGL4wYsu2JDRTv?=
 =?us-ascii?Q?AcRmFLCz5FD0GZ22wn/TO+Abr3CZ3mTxFYy+JyIDIzsMU4zb6F9Hy4SST3Pv?=
 =?us-ascii?Q?49nYvrzpPaGWDQVRtCY2Fo4R7kAEpGMOjgXHp2wHKnGwB7ZEvXOtmYaov0bT?=
 =?us-ascii?Q?XBi7lOG5AgiaqxMWArKtZA3mxTD615478T8K+qXYv7hI9jm/V9l+9pES9Uz0?=
 =?us-ascii?Q?nTmHlig092YBI53VtLoPwqMaL5gDhxDc81XimPaluEHlnseTfjZViWqDPqZH?=
 =?us-ascii?Q?R/TsOusg//fExWibfjM7b4ix+oA2OiZVvgLBIEzkjr+u/xxQOAu9FdZlbinC?=
 =?us-ascii?Q?BAku2bgJtYQuvIQCxNtvMwQthNloM9Gm7za2l1HvbioA1QOHgbgTAbXtMpiy?=
 =?us-ascii?Q?4dU64m6GBwAZ9iPHrgsCxLfp9btTAZfXl7dwetLNYKR3nKm1fOGiL9b/+8og?=
 =?us-ascii?Q?CqBY15myR0F90gefJpSE50w+qA21duB6kRLbMdlmQ5Vq/BucjhFgUKxlDgzc?=
 =?us-ascii?Q?3TNloDaSf0F9GH7yEtehr3ASNMg1e6Wg22btYCZMhbmcd8pgMVhWaWg21V+z?=
 =?us-ascii?Q?bpNs2FbCIcCAjdsJISH660M6BCqatDvM4tXoGbMoMRNZG6DfGRkRp/oocpP/?=
 =?us-ascii?Q?Uj7FgfyxdsgDkU3+s+SKytcJWK5BBKwyA2TrlYMcLcD+OSaNnzyOTn0W8XSg?=
 =?us-ascii?Q?pL80DIcZX5ixGFt0m07JIFCjPZzLyiAZYr5sXMuat9BM2lGhuKKSsGtRdtcP?=
 =?us-ascii?Q?PkLuhnTqCUOwdca27hBx7gEkwwPWKSXkU2TDjhdZ2RRgRzvAtxIOc3azyFkd?=
 =?us-ascii?Q?rqB7DTEH2LEkde4j8oFiFdhb6eo5+X1syBy4tTrlfnkqDk2j8g9CfQA5kG3K?=
 =?us-ascii?Q?j+QyGUwAe8Pa6xVmrYZN5oS5LkHyRyQvANwxQpoPqrtE6e4snrZNDjKHXKGj?=
 =?us-ascii?Q?IhFJr57sAJU0+E17fdFVcMwJukjTRg2vwY7bOeeQ8yuDmmzCucfQdWRMWHEF?=
 =?us-ascii?Q?Jh4MEMX6O8JpTCVV/cnVHIqr3U2/DFDN+SevYFxuU1UVEw1v+WiGjsNarAS4?=
 =?us-ascii?Q?p0p49JrM3duMjsTpBCM29YjQ1U2BXAxry7qFs+3k1aCwRqnZpNRQtspcaTfx?=
 =?us-ascii?Q?KNdfjJl3P4uXr/8fNHXESJ1k1QKrPJWk2jN9luHc9UjIPCvqQDlOTFcVvWdH?=
 =?us-ascii?Q?HSLFBhLL7gBq4SBTVUwkclhVKiaGSgM3AbXwEt3Dxx0f8L1y6pkMuvuhyLgc?=
 =?us-ascii?Q?aE0rrzRqtagVLYeYThg/SbIEyMjtFShBX6emTuKFk62LM5ivF4ym3fky+QXM?=
 =?us-ascii?Q?21Zz61AUYZvNkk9emJjT+qotgmVcVcT5W8H0g0F4XiGwljVID5/QCQMmhy4n?=
 =?us-ascii?Q?I3D8olQIL70/Oyd5GF7gaZuz9oFrP1rIAvjt5urkusZT+tBSjkAyqlqKKy6f?=
 =?us-ascii?Q?sS4/F8GHL+oeXIBYgaCadL8EBi9ug0nMuoPw9GY4TCcapWJ5zq2S68JSIwFc?=
 =?us-ascii?Q?usEi+l4O1ioNaIlrfjPH7jqeM41Gc2qRQLqfAcUBgkNVA1zA8NJaNgUUOPiX?=
 =?us-ascii?Q?1ANN+PjXIe77gdPfSmq8Jj4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba77255-a8bf-4fbe-0fcd-08de0ad9a65d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:04.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4i5543j2VgfDFWIma8ejsDBr0N6KkZZCf7gX1Jwlcqjei9Q4C9lKW6ShypygZEyerS326FMm2mI8Rq3buirjIEm5zxH7ggmpDSumdn/5ARv29bYDPZoHg4WFI18ZqpH
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
 sound/soc/codecs/tlv320dac33.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index c495be1cf2ed3..210c11ddd5a81 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -442,7 +442,7 @@ static int dac33_playback_event(struct snd_soc_dapm_widget *w,
 static int dac33_get_fifo_mode(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = dac33->fifo_mode;
@@ -453,7 +453,7 @@ static int dac33_get_fifo_mode(struct snd_kcontrol *kcontrol,
 static int dac33_set_fifo_mode(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-- 
2.43.0

