Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D5FA59
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 00:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880281; cv=fail; b=OyU2iXLBjGibeKTUAf7gYfZspOL+wxITaRJek0rRnveed3Hzd8qNkEZtdhME55sIHML0vet6odDipH4nrAdL7rrFS3XRqhnJS5qLxs1VtMXgkilB96F601xz80iEsNAt4D5CNvrB0s6zMGDfIN1xwEAmiGuS+coTvmWiktQiaHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880281; c=relaxed/simple;
	bh=FWsKiUo7JvSxfNFc6i0ooICE5Ol/oXAB5tewnhQOfks=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cLZgiphEfDxVHWO3jal13cM9lcdVbR0NAEaLOETGs5A8PuHDmlgVJBXjjffqb0Tp9LEdQmoWE3Tjw3Wvt84wEwzJvrqEaqQAqlVf8+1bh64p14Zrzxmh3yJ41k5G0+P9TOguEvMtz/9RuwrEIaNEA7KcTQcU5YPRW5l1rZSHRjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P8ETwLZE; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P8ETwLZE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUZn5Xa0HZ6jlU5d7BeEOeR+E8LBFAz1gHBepj30xqPmkkYq+mIPCSPpCvrPjDiAOCTQBrYpQZ5LYqEvFnOeuJh1QipLhY6C/WzMvugR1JEBE1kgEpFiVGXzTtLn+10CtnrtyGpePw6ZG3uSfGDa19/rBfEVeP4Fl5Rpy6p/a63OKLoq/OL/IG3dyfk3B5SF+WHkxbmjHSEf+oyUQPQdr6dPj0wJzaVNb2jZBWES4wms6PSZtXgM291vMB/B6X29vpohoonmoT53ScvYQN6jCxrbeCuPurdJGo5b/cjDSKEKQA1TfiNPuJq+rd3pg+zwH9aDbRjnjydiacqdyNTR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05/fZJ+fRPdUcx6zuq1xhlQW2hYKyYhgpWE/ytPRZtA=;
 b=m/J/tLIhtdcjlsWXm4gurhxsXbgxLoQIVUBC+rwqMbJd4AT2SG55zs0ljlztaiJ0lH4Js78JBeIRimA+scRnqToI9K+d13uOqWZiRhTlWmkKD9mYCRANf51iJ+Y/uhQ9Rb5+7JAVgnR7Kgd3KxdLsCl0A6WAOz1tbCUozD7/Fz723Qn7fMZ4+iFvvO44N4akTmJb73+dNiUSP1aANX9fsAuVFVXn8q+GLpDpH6uTUqr/j/4pmSCfrpiNkTBtSixucdAOa19BmmKbZ9xbAOktkgLc9M6udxdVzoCrH6BICw893hBJXvhzg6ONju93+EVk6yzQuUW3RwUXySIeB0SyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05/fZJ+fRPdUcx6zuq1xhlQW2hYKyYhgpWE/ytPRZtA=;
 b=P8ETwLZE/PtAU4BjURGhug2qUmuaOuQIkE93BHhScvb9gIOX3m9gOlsHD+UV220OvyOwlD7us+vxGWYjcEi5+bck3q7d2g+4F+JVKDo48WkATc3267aCmYDbuKorOEBjFBkICZf9w6ptl8j2oz9354j48W6Z/NjWJdDNv+TJN7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB17966.jpnprd01.prod.outlook.com (2603:1096:604:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:57:58 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:57:58 +0000
Message-ID: <87se6xetm2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/9] ASoC: codecs: idt821034: don't use array if single pattarn
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 00:57:57 +0000
X-ClientProxiedBy: TYCP286CA0347.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB17966:EE_
X-MS-Office365-Filtering-Correlation-Id: c040fb77-838d-45b4-3ded-08dec4f8fb3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lxKvKa0TU8AUXaA1vcoAViMEwdEFaRFeAu8EUXSfs2iTtG2e0XlydjxmcdGEDB2v4qhwTGQvl4comBH3GUWaQ0+3Ws+jegvTs6vYYhfAVZr+9zvECbQnOb8w969MYuehY/EB4sL4Lh94ge8Uq01upX3m0nr1UbX7kzvB1rTL2Edo+9wn3vu/CLphIhbRKTUX0JFLDxHX0Q1SAQvffgILaLugWzha8xnmAfbAYbPoqs2OC6N6z8ObIK0POFIq/VMCk4UBHBPsixS2x/sEvPH48eJEBug1kJhxcxVsow7QrOP4oycFa0w1fR+kb3jEkI5lBSzsn+hOHB6y0lmOV7ByEMTp2ONU1oMxIy71qT/shP20JgNID/erAE6eUt+kz6DwfwLIC02SgWZKE9ik2tUGRvf1AqTa7I5OrBY4pz3kUQNnxzYOgEorEMg9bX2hoUxIf3Mcz1kKhp1Dv9xsElj/YXUPC2eHH2n2KwGzXGdgDKsiA4dJ2iAMojoVBa94ae4N6FsKgXehmQCdqtsXTlLJSl4m1Yyhya9FC3c3Uqr8c8FlQsYC8RhKZWCXYG4awwKJ2w3UePg8ybKlU/r+t+LVnnu6qxM9Lra3GhpCxyQm/eti4IEWsuwyS0PKfYVLEvzeUjMyYnMjO+BeEMBhGWG9L4LkNOD/QXYs1T4v5dhpkW64kSc875bH0T9qXImA5GQjhm6TVOjDgHNhfCiWsF5Ibn7y8CJOEim8/cJBA34cxBETB5mk9InD//LbxsPxewBEH4dPXEOMH4XAMMYwsvL3sA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p61Dh1loBDzmH/Wt0DG9/gsMXQPJrlefBlzCQQN6yTDwLaKU51ydDFv/7DCN?=
 =?us-ascii?Q?ZBzV1WcBVakx01m+FY1j9z9luLQmTIZp61M8XbqDnafkUw0GQFTl423EsKIM?=
 =?us-ascii?Q?65SFowIilxWK8X9WplBvOZ3NTkNVbHwpGPPhpxvUDboW4ak57grzS4iNiSgN?=
 =?us-ascii?Q?fwzgnmCtFJ6aNiSEpPEK9C8FJBW9va5WWqLb99ytAz0apMjTVBQZLGXmqFQp?=
 =?us-ascii?Q?peL1ZWkuKUTLpCKOJ9GTOnr2cVdDXhneEPEUqyXNUxEtr5rkIjFYm4RHNvaF?=
 =?us-ascii?Q?vY+0BjCcZsfXhvwkKeJjrBOXHJlZXUkZFCioeEUS34Xp0RP69EXaH2fuUMUR?=
 =?us-ascii?Q?JXiE6BJZZ1/6N9PAEqERq+niddX7Axf7U3RkWJZfod5fjGRTRPNpGvtAFZdu?=
 =?us-ascii?Q?eXkfDeFR/AdEWR79HSXBRw90dpfNeEh2C6AzVeY8HLuSZXq4c/xj7QLdel0Y?=
 =?us-ascii?Q?C+Gp6Vwpmnw4iejn0CGS/RC1YrBK+3nFVs/FxAJ4PTCcvB8WE8x5VAIGAxWb?=
 =?us-ascii?Q?dnSmCAmb5wTTXAfKW54vdYpiGtrjS+r8ufTG99HhIPONJHrnnHXr+lMtSsMz?=
 =?us-ascii?Q?MmX8Bf8Td6e++sz23tj0JXzOd3TwlBAA4dV5qopaczjhArEMQbfvK6D3Vu2M?=
 =?us-ascii?Q?e9pA8ZDHoWAUezoHvbiROWUZnZ1/gckcDY+aIwXHOX3+1LYm+/JxzVgS2r91?=
 =?us-ascii?Q?2nj/mXYmT+ovCw2MKxqHIj1nkft50IfafYqf9FuR7sZMuLO8V1dNpdwd74tG?=
 =?us-ascii?Q?18yfbxD46XfkCpP4fDCJzktpG50YImxYdzjmRLfdaZb2k7yX+blcp3c666Aj?=
 =?us-ascii?Q?qWAgrtIKklGq8CV1UzPea6XkrKKzOOGQpoJVBuYxrVCd953dClR1IBYhZrbS?=
 =?us-ascii?Q?CliJIrEhc/HlMbh36GatyDkQpsZWkXDmCl7w5B6lJKW58usM3eKKcdMpChHH?=
 =?us-ascii?Q?gA57Ib+Dy4B7vl5k/F9R1gRd973N5J32DBuuTAfIH4//aXLMncJeATJUzpAK?=
 =?us-ascii?Q?KjOpAj0IM08pqqS09JPOFd11Zv69yjM4kvDctzgMawglO2qae54rYc+ke11k?=
 =?us-ascii?Q?e+TmTcSbs+G6zuwy0ZDlGpbbXNcTLAlhWsug+lZFw/DT7kLBm+ARNpHTCSRF?=
 =?us-ascii?Q?UENxG8RcBB54QL2onh08NPzNcl1zzBAYzMbDDQJHcadZI9RsVFar8bs5D3U2?=
 =?us-ascii?Q?RuTtMTBbTP28+9fuBPBId2uN/V1lqtOENJ35ycMBw0bj9KS2aHZJPA72UlJ9?=
 =?us-ascii?Q?miTVvwGuAILUp0/zW4HYMqZENMDy0i9+SoHKW1TEAYZWiLfkG0ZcHKGJs8dJ?=
 =?us-ascii?Q?C8/XpmSsD12RxBpg7HB7U1XOOoYD5XDiP34bJkpzlfAWg3t29468vzZKWURP?=
 =?us-ascii?Q?zZGC5r/RgLqr+2CwejeZVMxhgjeiUBzIY9PBuFtqsawFcKcjJpHX8EvCWkrC?=
 =?us-ascii?Q?PrWAeXQc+2wkeeP/wOUDPqiDaOo8zaS+G/9xubO53RxB9jXTE/YhveCQLbCk?=
 =?us-ascii?Q?YertRGl8+7rogFeMDCs7ZS3cfWV6yrRhzoIniyUHQw/jG6nlNwZz+0XYySLQ?=
 =?us-ascii?Q?VTity9Z8rYFoP6tJGgOZojrff+leqJUHrsTDd1lkxEyD2fiAQJ6e2WfWNBHA?=
 =?us-ascii?Q?dzyIPwnN8XSin1prDRlShfKCHbMc+vNoLMmr7uJP5ytv14iVqORUKjdOXuQV?=
 =?us-ascii?Q?bhMxvr6RRciIBElPMOubTFmrbIsEqfYHsdFQcsJlJI2KNDf7Y1JeF8fL0RLj?=
 =?us-ascii?Q?zPad2+gXXL5mlg+DWzKRfhdrFj9K3B4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c040fb77-838d-45b4-3ded-08dec4f8fb3d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:57:58.1698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32Dp4Cmi0v4bAot6EvbkXeQtWJ64hH81qh05i4BDafQdT+SofKijRclfoV1hvTVyHR9HidYRcXVGLlQ9Pw1SO4MLemOWie8Xb3vO/8QPJnCwHl6l81sWg/ioUCAtxVxz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17966

Because it is confusable during debugging ASoC FW update, tidyup
auto format style not to use array if single pattern case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/idt821034.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index 39bafefa6a186..084090ccef77a 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -860,18 +860,17 @@ static int idt821034_dai_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const u64 idt821034_dai_formats[] = {
+static const u64 idt821034_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-};
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 
 static const struct snd_soc_dai_ops idt821034_dai_ops = {
 	.startup      = idt821034_dai_startup,
 	.hw_params    = idt821034_dai_hw_params,
 	.set_tdm_slot = idt821034_dai_set_tdm_slot,
 	.set_fmt      = idt821034_dai_set_fmt,
-	.auto_selectable_formats     = idt821034_dai_formats,
-	.num_auto_selectable_formats = ARRAY_SIZE(idt821034_dai_formats),
+	.auto_selectable_formats     = &idt821034_dai_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver idt821034_dai_driver = {
-- 
2.53.0

