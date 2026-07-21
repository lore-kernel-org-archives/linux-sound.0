Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC033FC5BE
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597411; cv=fail; b=MRYa/9RW6zoqoTUf9tE6P2pgUkRfkwTMRJkSGoxiSyrdQkmMG1QQlfDX1myQqqZbD+fY6Idb1/fvMNavfHqR5WT1cS9JdsvwHJLSUwyBv6898YOp/cI3UgePq4K/dq7KjbReRwZqWKzyHZCq+s1xSX0PEbzaRMar9gCeib02fxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597411; c=relaxed/simple;
	bh=l9j4xwLJsCf58fsKKtoYL2S+ZGazIgF32ATHHj/jDJE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V3W2WcGqm59FobKwq9W67D6Cx8dTsWKmwTGWp2BpYEQ2EcbwwgxbkjnDRIYXRi+trost8b7WzapLPK3ZQefTXv9lmrNvPq+BIcbOgPmSO/jKjWqTyotRRNEM5wXYZ1dekypr8okhRKFnRlife0NVVa65BHaiHhG8FZklkHJ8XcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=V4L29w1+; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="V4L29w1+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJ+md0w5mfbcJQ1C/w/+aTRJYnL+0c9URvxuMekoK9DbR5ahNG9iH3/jGyEG7jGFKPHwhs+vGZyWuO7MpgGNRhc8gPMNhR2uJLiSribUz1oDi06vq2HENeUbhmd8AO/LsI/ZHaMHzYjtJVnsGxXCLURYc0WQHaUhgnX6xntXgMftLTZ9aM1P3G+sLb8yFyHdTljvP3XahZ6a29hmBKrhU/YgMmDiA9mmpHZinQP3zEqf+RTScuobmuxJXvM3wfetucvt9kLqfcYEPo9WxoVgKHxKpMasr+iyWgPgwLAv8/m+xYOzBXLNKYLg432TSlSF6Ibcaf89CE3mDbCDtdsXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=373VXzlMzrMFCgfen1JyTrn60IF2TRqBHZ/wunokmZE=;
 b=ZgyQjqBC42RSGN+11nigesV+sm2GxNxZSG+8TfN9iPGSD+IEVQv34x9tW9lLX99VYmuPXgdSeTIjbChrwvhh4TyJHqt1Kif5qzMzmzqCn9winmO5mma7p1hxHofoh/lnMaNx7SERQcSh4Mn8x55eKSRE+FEYBeOq1U0nzMWzFgwdJ2vTYrDeE9rl8oMgV/emP9H0EtiNl99zNGVFSGSs31GEtOurEUWR8Fz0B/Sb9+/jgs3HAYrYj0hcuhtYaLfD8D/SrcyF3siJJ+7AqpxtUx1kuEN3vjPlREMKFhjwB/PAstEhcGCb3d1K0Qkrwkkjzm3ZvhQcT3Rp3yCZS9SY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=373VXzlMzrMFCgfen1JyTrn60IF2TRqBHZ/wunokmZE=;
 b=V4L29w1+oWk+0dDK4z4tjE7+AOjNKABxpw3oQ/5uvZLcqLnXh51tkaz0t7W4BmuJgQh2DradMzM5jZloZaPYY/JFilPZEh1wGEbEsptym61J+JdbZB+wmrgYFHO+IpzAJ//uj98hC86CoEj/jUhyNtTf5RbpHWYNirAH4MKW97Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB11070.jpnprd01.prod.outlook.com (2603:1096:400:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:30:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:30:08 +0000
Message-ID: <875x29jfj4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: fsl: p1022_ds: add card_to_mdata() macro
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bmpjfjz.wl-kuninori.morimoto.gx@renesas.com>
References: <877bmpjfjz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:30:08 +0000
X-ClientProxiedBy: TY4P286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: 8449340f-43c9-4027-71b7-08dee6c7998b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Hwv1V09BkV3uQV/pCv7HBeuXdvETEgSoUPGqO2LozCt7xvsPxUCd7eMOLcKi59cbjd490c+/pGFM/HX8JsEcbKobS7m3Pb+EuF5r4K2ef2myg3+FkjYZfQ6KRkGISfxwlR1V6jBGBCKtf9VMXwPajbcwK4ntMaA4oSEqbarjy9Injw+m+SHs/MXiJZVcmIRJOtQwujN+UjTr/tVo/C+1rrAF1MNMrUfgicCrva6O95+JqjDjV50zasB+dgjtJlq4iXEmkrLP8RkbtGnFThF70MbiyPB7yFVi0+idu4+4O8fJ6QmnmbocNOYtYCXOnqBUYHrsZ1dyATFjdfpfYGMM928nhw2PB9HPNhKvERK7wOpJmAdd97SK4hTzwRSDjNT32PoXETXAOosYN5irs5HP/vK2EZYRZWzeZFCTvqFzlJ4AaBFzPfa2b5iWmmph+v6XItJ23mav319knRw1NLBNxrlof4+GC/LAAivgTckBpMh1X2og4YObojZVmSIolW5OXCAuM8wAV+KERbG/ubL0pq/K+zW+PVSPzB3OL8/SQkU+fmWd/Pblq1c/gtmZExCCuYMG/yBRJEaeh54Uhq1TXdrFpj5Xq1EP7sG9n/Wi4v//4aoLvsyAjRcxo8Ge6Pj4RTGup6H9Z8nfeyu8xJ94RErzzXjw+kbNN/EWiZWWBKdhwzMLmncouS2yM8h5L7ywbwb16Gq4J6l4gkii/RG29kjnOwyTNDwaS2ruwWmHSGY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/UP5QBLEPjfwMOMniKFWzDOdypp1T8fypDnxMnCEDYmM3nP4CNluyeLN+rFm?=
 =?us-ascii?Q?2UlS+xy+b+XAuxlM1emNWhZ7Us/Zhm0XrOqhjvzzzGeuj/6KmWggscrvIGzc?=
 =?us-ascii?Q?Mp6X1YbVIRZzCcSVz0m3ktV19kfzFz9i3amGwUXwcpIwYnzvCcmd1RDcdZe4?=
 =?us-ascii?Q?K7NJy2UHuBkToXI3GD0Spxc8XbspaMazj6NyHrY5cyBY4DR32y5hhK4r/vys?=
 =?us-ascii?Q?Qe0ayQqbglm7FdESsxb6Irda+KXYPJWtq3EiJIk08t0XDxOhplcJKBZO2T7L?=
 =?us-ascii?Q?W3K3TAVxyxwRsnrVtcD2O8zgA+svNEsVbOEzAydwO8NyL8vvOMa/Hev/9xAe?=
 =?us-ascii?Q?XQ7pRYsPOEC+xbPxs4R/n5046/7D1nHUr/IKUJa3Jfq2j1/GSKYcQaTnS3UT?=
 =?us-ascii?Q?ni1WhxDMXEtLDpcHgOtKq8nJdqF2i/82Z10HxPEf9nrnjTnWp9mksG9MLpTZ?=
 =?us-ascii?Q?hGInKbttKDZrBzq+YI1qAT/L/rmlH6Jrvu3RWjoB7zN7uOakQyJOxdDTw9zM?=
 =?us-ascii?Q?rBBlZXjQfNeONuAljV47IAJiOATW/GUQasR67ODH1d/UIn1qnjEBKQVnV/gP?=
 =?us-ascii?Q?/c0iK23P/tVcuoEGXMGokANfbh2n6NZkTYp1IpHKfdN6hzdq7WsRMYpBUZcL?=
 =?us-ascii?Q?RhYIP0CeCFur4babillTN2u+QPUiqKb+qLg6nnchQ+Y4xYUmbqnDKC++jvgs?=
 =?us-ascii?Q?Myd9IpSpEpVOfM0B2E2GDaJ5EoKP4kFLQ1F/InHN9oT3tleLaD3p5tVzDSno?=
 =?us-ascii?Q?JTyxt1RbW+iCZ+wld2UjeMkqBOBcb16dr+DptQ1MNZNuTdEjzDuBaDptihto?=
 =?us-ascii?Q?Vem9XD0JmkSZxDEUQfe+XC2ZgUpBQ9ZqbJAnUIIHTf8ff779LHz/34Cbv4km?=
 =?us-ascii?Q?6XDudSCbfwm6jE+A2vQHQukMXVBi++jzTirmZTysuZB3Ek5gHBfFourDpUPN?=
 =?us-ascii?Q?eTvKnvohclxKQfl1Czp912GDzDMNqxkt9xOmwPqHiLXwytB4vRiLjsWGUaqo?=
 =?us-ascii?Q?xVdZ2bhkhNbdoRp8S2BbijMjnTpWPtf2t6Q9RkaAGV/HrCnmxFUe8aiQHPSu?=
 =?us-ascii?Q?gfxQrD5lJm5OoCwhpMo7NzTRvpChw+vjWe7UFn9PF919a6uHooq83C5a8JTj?=
 =?us-ascii?Q?Z2MChZs02CauMDHwAgm8E2l9GP9UrXQuWYF4a/n1HJs7lxJPtIo9u2KCvpLU?=
 =?us-ascii?Q?xv99jT7ZgJq+MbeoZexEIgyCrjb3zv5Qcrvm5VYXoLkUV+loqXwha7ufXFtj?=
 =?us-ascii?Q?//J9HHkG9h9DhhA/GM+f5XpbA+LVeLvcC8TQCLL/eNTH8mTAN7eRdDgztGMR?=
 =?us-ascii?Q?n8lRN5lS4JlsZ29l+GTh0B6Db/IROs7UCK9MpQm3j73em1wFIczCoBnQ0Igs?=
 =?us-ascii?Q?cif4s6sgTXwPsshCxW71tsyhaAKai4mn0EgAoovfId4VMiNuXZS9HbwQ/9U5?=
 =?us-ascii?Q?3BEUAqxlesu8auTLkjg379USGPPYlwpbHOl/HDQeLMyDmdVDOfckebhdpyUo?=
 =?us-ascii?Q?1ERlU7YUSV21AjQQ6fezRMAn66erHOi+Eo6zJHTQLdkSz8ZjHhF3SP3uQHqR?=
 =?us-ascii?Q?id1j/GM4pK3sV7UXqiQ9YZDMlY6lky5yWKTMRsR11UF92/N8ufyllvxpu3oY?=
 =?us-ascii?Q?NIYgiysRi/f2d0SAmYuv/Yw2if54iW+SVWUpaYYOU+wG4/Q5TGN+6FVwxDsJ?=
 =?us-ascii?Q?IrBA2T1QgQROZBaqTiOs4n7U9qbdm6MQV/v+7YI1TrCGnyFMAmFQykIO/QYr?=
 =?us-ascii?Q?Xp6tKfKHCZXbpmbRZh45HQV5uS65dkadpipUb4W9sCoVpDO3B81P?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8449340f-43c9-4027-71b7-08dee6c7998b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:30:08.3534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPex3sjH3tXi+/fj9Fvd0SDpPJ1SPRyz4SByZrx5lEkAoRXa35P1aJKvRfeY8HLDeQe1fW/TKBo1CeUbr+ufEqZs1ahcHDGhyf+7t4Conz1VvX8jBqXpf/VqqjoQM8HP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11070

p1022_ds.c will be updated when Card capsuling.
To makes its review easy, adds card_to_mdata() and useit to reduce
un-related diff.
No functional change, but is preparation for cleanup driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/p1022_ds.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
index db07817a80244..98389f53246cf 100644
--- a/sound/soc/fsl/p1022_ds.c
+++ b/sound/soc/fsl/p1022_ds.c
@@ -73,6 +73,8 @@ struct machine_data {
 	char platform_name[2][DAI_NAME_SIZE]; /* One for each DMA channel */
 };
 
+#define card_to_mdata(_card) container_of(_card, struct machine_data, card)
+
 /**
  * p1022_ds_machine_probe: initialize the board
  *
@@ -82,8 +84,7 @@ struct machine_data {
  */
 static int p1022_ds_machine_probe(struct snd_soc_card *card)
 {
-	struct machine_data *mdata =
-		container_of(card, struct machine_data, card);
+	struct machine_data *mdata = card_to_mdata(card);
 	struct ccsr_guts __iomem *guts;
 
 	guts = ioremap(guts_phys, sizeof(struct ccsr_guts));
@@ -122,8 +123,7 @@ static int p1022_ds_machine_probe(struct snd_soc_card *card)
 static int p1022_ds_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct machine_data *mdata =
-		container_of(rtd->card, struct machine_data, card);
+	struct machine_data *mdata = card_to_mdata(rtd->card);
 	struct device *dev = rtd->card->dev;
 	int ret = 0;
 
@@ -156,8 +156,7 @@ static int p1022_ds_startup(struct snd_pcm_substream *substream)
  */
 static int p1022_ds_machine_remove(struct snd_soc_card *card)
 {
-	struct machine_data *mdata =
-		container_of(card, struct machine_data, card);
+	struct machine_data *mdata = card_to_mdata(card);
 	struct ccsr_guts __iomem *guts;
 
 	guts = ioremap(guts_phys, sizeof(struct ccsr_guts));
@@ -399,8 +398,7 @@ static int p1022_ds_probe(struct platform_device *pdev)
 static void p1022_ds_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct machine_data *mdata =
-		container_of(card, struct machine_data, card);
+	struct machine_data *mdata = card_to_mdata(card);
 
 	snd_soc_unregister_card(card);
 	kfree(mdata);
-- 
2.53.0

