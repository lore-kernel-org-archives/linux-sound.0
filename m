Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0CB307AC7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415622; cv=fail; b=EdQQ/+nlQHqF8S1D8UNlt+nWJvzLKC/Lp3qXn4QPCLv8to3wRopfyW9nXzGLl8lgqRd8YxPm9R82SWQzImSIAUq2yiLN5X/p9HSYyi8wEmyvJxuqZyid+dZ19GNqtc5GYZoO2T7Y4bJz/7ukuXJxt38/KdpWwSE6avi0Un4bQ2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415622; c=relaxed/simple;
	bh=9cQniHLlpGJfS1n/B7/pY5VAQ8HK6FZsmMPoDU1LHt4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iRFIb3M6XYlR1rXyTepIJqr5Hs1/9tGsVXpKWiRtFPYJ+7Bd1UT5c+jdQPXrcVO1FK24Z1zy9V/VWrwSirvapt8gAd7wMQ2kmGlIm1jY4sjusXPZmEmU1HeC3+T63gIv8zuP70xcGs95qtJo7mFv6KG8IN5T63VCAjgKWh+yDPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gVsd4V7q; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gVsd4V7q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWoYNJDofOgY6LPUE4/AUi4S2IgkixyLF25m1w0I9aebz01xSK6JWQ02bymfbl2juZ7nJ0uQ98v2k+8KRn9rVLod4MzhQA0jlMUoYkgHm+z7+Nt1z2ScO3rT/RZphTM0ptdCmgl156DcSf3uCUljI9UfxK89OObjC3XXoCnLVQMIwourzKEyXXuOrg+tFKLTQmBUKZOUWMGsIO8H6aK8y7F/g2ly34YwVXAoMa0M9nmo/B/O2KTvginI5/4WGXkutC+1cTOD03fdhu64taytmBYO9epP3thsLvwXkpAwoPHq7N1amFKWJvLDKaLq0+s3+qbdyq0RNhoI8yi269negg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ucj1kcPghPiQhCHNorfBYJEN1YketPcPSktzJ8nvHJw=;
 b=C68SFj4pyfJPbWjssptjeeyhp+eVcPUHG5Kqp7cE/LhRtJQ+arbxKuOpXPuKYNziM7/FFTA3HWfXCyxxiF/CX3bOEBFyVcJj5nk/ui/6eG7lVi4fFGL70Zd+cPAmc0VOCnQ4ko5OI4h1MVs7PdEU+llGj3Ik8bDUOavU8trloYdbU9wnqmbk7uO5cKmzQDiKe0UJKBctU59pqb8BYhYr4DBwogldY2Wv+BkU5gwBWmS/exMVl+flOvB8qg2VLMsvalVyG1Bagb9xoyIu/o4NKQTAON7e7Bz6KRp2vjOFFZFaJi1PwsDVfO20W487tBkGwOnrFcw9LVTksk5cVwbP+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ucj1kcPghPiQhCHNorfBYJEN1YketPcPSktzJ8nvHJw=;
 b=gVsd4V7q3Gl6i6E5U6qnWn2Hhcyo+pE9HFoP+V9z+GlBtYLXiQgxuCjTNfRhQOQLBZX8xGlsiOjlz5BWex9uMrBLoG5CLJooBUzQe4+4zCd6vHDYstjj9s5V1vuodVqSakQMPelvbWhEAeDixVyJ+h+Ukv5/hrjVAkk7lK3jmSI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:19 +0000
Message-ID: <87bjmat8qk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 014/139] ASoC: codecs: aw88395: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:19 +0000
X-ClientProxiedBy: TYCP286CA0193.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 61647d93-0745-4bb0-f29b-08de0ad8fc6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EYYuQJJXOhbi3apTTuLQD3yqJMoiwST/w7hs/9EUJruP2da9cpBaNu/WIDiA?=
 =?us-ascii?Q?4wzlTT3bS1ZwYGySMmDJcmbpnXGTY9KFKBRVqs0UjxYBk8bz/hyBM5/UBQmA?=
 =?us-ascii?Q?myvkpJlESNXstn8vMs0QUygGxWKdHSlsSqDKCXgCIioBS4Y58eD0OzuwPbsQ?=
 =?us-ascii?Q?zYxUVsXfXZ4uI1WKzWGRAR5XML5H6ZIixUWjG3WMqxWqXKo/ZJ3HBThORfPZ?=
 =?us-ascii?Q?B3dlELoFRLup1jeT0PZMwpf3C5NtLa3Hj/tDHsiwovUGd8XJZSgfK71VpJe9?=
 =?us-ascii?Q?M6mSHz4haV2Cyzq+6a+MslamY7Eg8ywNvEe0U0xcwXt40RwSzOGCeNuDggmD?=
 =?us-ascii?Q?weRB8+SsKnhUTD/WPniCHCsJaaCy19uT3Lwpi2as3/SJCQmWPemz861s/3bO?=
 =?us-ascii?Q?5tHM2YRoOrsIFNZu+oIH8oVtmf9kXTxIxVO+XJVeSn5unLPWpOWrOYMw39Uf?=
 =?us-ascii?Q?kmZax6APXgghOCIH5yTghgwiznuOhFr4GQv1f6bt6K+cxopaEeo9GmJh+Nk0?=
 =?us-ascii?Q?RX+OsNM/te0aRQRhPDUziG9tzqzcIaPtUXmhUe3TYO/YjLPz9u4ndWnr4djL?=
 =?us-ascii?Q?5vQodcw/ozGZoJobZyk6t7DStuid0IhgZoVzrS3CWn4nD0jzot8io0Qu0rD7?=
 =?us-ascii?Q?PkGjCvBBF7tSWL3jqDmpdX4oKrfNh5jwiyDlr403CdTDpVL81Qoy8g/Yypla?=
 =?us-ascii?Q?AXntvdB/+xf9oeNKVNLGDYEC71jAedoRfLib58J6ZAvYWzWMxhOgnyQmFyTS?=
 =?us-ascii?Q?1v1fD0r2jPLIeU3Irip+MEi8lszsRqruj47FIAmtv8o9Mrs0zFTX7Ls636bk?=
 =?us-ascii?Q?E9iD5RRE3G+Dp/acIaxN8BK5W2LwUHy5iZRBQwpv/D3rJ4SGgqmGgAUi02eB?=
 =?us-ascii?Q?Iayln5iqpk+ER0ZTxgQ56OVTUUqzhtx3GXiOBHBuheBteUh/v95AoNHRCr3U?=
 =?us-ascii?Q?SwHsxJj0mgX9ZoQl4ffGIOcK6RqlJpqozdvuCavtXMr226jgjjUuIyaKROK2?=
 =?us-ascii?Q?12OMPnLIwZGCYkZFmaujKMyIYfIStF2+DbYBuVay/S4BVKe4MEZk4Q6E3buW?=
 =?us-ascii?Q?996l4zm6F/jmteP0GJFD2/k5V14tm7wZn7/nuTnAPeViC1qSc1ajiLNiSAEl?=
 =?us-ascii?Q?6j7P/wQMeLSuaseOUmxVhuX57BDAcZSCxF2xU3EQlQzAn6W7fmv7C7t6tRqi?=
 =?us-ascii?Q?bDWdhhFVlpYkLdAjt8puShp8E6NOVindpFjNlwjwjjrFHRCU8l51DO3sPjqw?=
 =?us-ascii?Q?Sy3lQ3zosV2tNRHabN974XQ7Q3lsUQzS6oNEwyh3ZmgI58BtD2CTljUsuKJb?=
 =?us-ascii?Q?cH96bkNPgDEZwzau8xptUoaoObILL1SxRQPOUPeftmboe9WwfgtSmFSjizty?=
 =?us-ascii?Q?db5XvdJWCzbQ/GEdNjQUAYixRC1ILzTgQs6w+PLiHHFRyABDUbDX2hj4+RTY?=
 =?us-ascii?Q?3Ci2bc+hOKw/R79QVk4zYs9GFfRo+e1aElS7E0onXkyVOhRVY1O6F56q4txj?=
 =?us-ascii?Q?R1UMgdLUnyGOJL5ehnnl0XWqt4u2aeuDKpHN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hnT6tFW5LD2p214Ko34GBAWI2y6nrwmtPRK5K6S3mp8kW2vzrRKQTF+6qokp?=
 =?us-ascii?Q?++KhPbjOYqIwPOtH1MmYu83buTByqJ7vamOIxqtCpM0C7FyMsn7UV/lM66sK?=
 =?us-ascii?Q?1k/NN4em0K4OzRX0Hw3A5M40Gadyk5DHeYf2divh/UPhVLBPEnUuZv9O/VVk?=
 =?us-ascii?Q?2khniGI4W13x0WrhdCXvaWH66+AZdffAf+a0rLxUUBvjlWQIHJgEZ66fOVDj?=
 =?us-ascii?Q?a7YikBuZ4aKeyn4OS63gk0DFqxmIQFQ44A6a1lkwJIrDQJ2Tyna5IDxuzipR?=
 =?us-ascii?Q?RpsORvNWNJJGLRaFpA9fsox8RInNkbYIElUXRtNIB8N9BEFRx30DPAjxCOM4?=
 =?us-ascii?Q?zQcm4mMC34be5ahNzLURVvUqjKgqcWWVVWzyN67Qg1Ft3DcT0LIgk8X64wnx?=
 =?us-ascii?Q?zsAn7rrgn0wGoHkbh22tld1j4U7Qx6ReAdx1XNGBOBISXKrxLPNZ9UxNLG6/?=
 =?us-ascii?Q?Bf2iChVlEXLxXYR+NtPdxHA2qiLpAJtiJy7Nmh7LRx9LfKS6khpiFs1ZMOtQ?=
 =?us-ascii?Q?eCY3+u+b6tnyRg/tS9yxs7lr0YAgtP3m5i1BcIrgQoBtkl7a2QK60+BDYZLI?=
 =?us-ascii?Q?ZRnerBm3cade6U2HojTXuGX5ajZOvFnbKuHvmcBLC3fqIcG2hP+MVpumTk35?=
 =?us-ascii?Q?2FCjWy2w6pUxZBtUrY7e5i49JsPpJunf1Og60MihM+mx1m41f5mZApLw9W2n?=
 =?us-ascii?Q?TZTmOEh4jw7Ty78/HrdtOsgmv4upEXqVFl+ernTr8OhnmHCvfSCo+062AA06?=
 =?us-ascii?Q?jZvLImlY39F24xnwQlQi4KXgsOsO63gosbrVEAGd1jk6CVrNZMDLaxlHxYsS?=
 =?us-ascii?Q?gLG7Hju1WDBWrtZINe+xOJU8Z3f1RRId/8kmlqL8Q3tM7NtxsdQlaZaKRULt?=
 =?us-ascii?Q?nkErkmDfWYLxVGlnpsIiuiAm1on5ZzYN0t8LruIIASkVKCeEx8zebW/knbJo?=
 =?us-ascii?Q?iLNwLox6GqGW9S+dxtkdyX0mmAqVDu4rek+c3RjJ5SjxQYfXdqE5htGt0rIf?=
 =?us-ascii?Q?AlsYj1OaYZw/5Jw1bxf2/8nTtG3OUxsIZcH7wOxBPDNWkkhuPinXqHjLCBNx?=
 =?us-ascii?Q?G5cJaVJtcEhS0yGjEYoa8gCGZh9yvV8/NLHcwAPDuNm8HKjFVvQ3HA3uz3Lq?=
 =?us-ascii?Q?rNwZAqAyP4EFvx6OMj2vazpYKvWiQdjlXU31k9lahGa1my0HaLXVw8AqrVlZ?=
 =?us-ascii?Q?GvdtOzv5Eor0ErCdv74i0bkYM8B0lHQfEfKFfE/lVuPacr/tP2YNu6IR697s?=
 =?us-ascii?Q?cHEbyvAJCslAWltO6uaGW/+tM//tvNgI27h4lmmQmfMqf04rAtPXHLTMyira?=
 =?us-ascii?Q?fqwwUxkRfppEaleG57JMJzAclDDU9GQvpPBMsEYQ7spUVfeLnneZFWL1IXZD?=
 =?us-ascii?Q?Yep4+/L24z0KtMN3bHVjfFHznFyt3SfPT7UiTgYqItNPC46S7dxNWrJkhQy8?=
 =?us-ascii?Q?gGOJ8I89tG9307PGiBkYkn83sbDGORdWgeTgsC5CRWJVNY0gxD2V2wlr8/jY?=
 =?us-ascii?Q?04VvjFu/VldHY1xcYEb7nBylK+ugO3QBVauSnOIIf8DahG5UWHtpl1pflqbY?=
 =?us-ascii?Q?FdEWN6/mir0n/D22Q3rKY8fLR96+a5u540iwCto4qk4VtWqulbatudmyuBR1?=
 =?us-ascii?Q?mECFBScG+g0Oo0UNz1edyos=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61647d93-0745-4bb0-f29b-08de0ad8fc6d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:19.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNSFepvPpFhwCO9yuuj1IjtQTGYuP8NfFS9yx46r7nnEfbIxDH3BwhUWGhlzqm31A9ZgoGEgeEBBD/ogMomrwrQwhbXknnAXYhtYUFFjrRdHez1GyLoa/Iz1i710gjxV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

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
 sound/soc/codecs/aw88395/aw88395.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index fb563b4c69718..a827ddd5c9c34 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -104,7 +104,7 @@ static struct snd_soc_dai_driver aw88395_dai[] = {
 static int aw88395_get_fade_in_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(component);
 	struct aw_device *aw_dev = aw88395->aw_pa;
 
@@ -116,7 +116,7 @@ static int aw88395_get_fade_in_time(struct snd_kcontrol *kcontrol,
 static int aw88395_set_fade_in_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -139,7 +139,7 @@ static int aw88395_set_fade_in_time(struct snd_kcontrol *kcontrol,
 static int aw88395_get_fade_out_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(component);
 	struct aw_device *aw_dev = aw88395->aw_pa;
 
@@ -151,7 +151,7 @@ static int aw88395_get_fade_out_time(struct snd_kcontrol *kcontrol,
 static int aw88395_set_fade_out_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -173,7 +173,7 @@ static int aw88395_set_fade_out_time(struct snd_kcontrol *kcontrol,
 static int aw88395_profile_info(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(codec);
 	char *prof_name;
 	int count, ret;
@@ -208,7 +208,7 @@ static int aw88395_profile_info(struct snd_kcontrol *kcontrol,
 static int aw88395_profile_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = aw88395_dev_get_profile_index(aw88395->aw_pa);
@@ -219,7 +219,7 @@ static int aw88395_profile_get(struct snd_kcontrol *kcontrol,
 static int aw88395_profile_set(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
@@ -245,7 +245,7 @@ static int aw88395_profile_set(struct snd_kcontrol *kcontrol,
 static int aw88395_volume_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88395->aw_pa->volume_desc;
 
@@ -257,7 +257,7 @@ static int aw88395_volume_get(struct snd_kcontrol *kcontrol,
 static int aw88395_volume_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88395->aw_pa->volume_desc;
 	struct soc_mixer_control *mc =
@@ -281,7 +281,7 @@ static int aw88395_volume_set(struct snd_kcontrol *kcontrol,
 static int aw88395_get_fade_step(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = aw88395->aw_pa->fade_step;
@@ -292,7 +292,7 @@ static int aw88395_get_fade_step(struct snd_kcontrol *kcontrol,
 static int aw88395_set_fade_step(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -313,7 +313,7 @@ static int aw88395_set_fade_step(struct snd_kcontrol *kcontrol,
 static int aw88395_re_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(codec);
 	struct aw_device *aw_dev = aw88395->aw_pa;
 
@@ -325,7 +325,7 @@ static int aw88395_re_get(struct snd_kcontrol *kcontrol,
 static int aw88395_re_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-- 
2.43.0

