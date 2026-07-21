Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0463FDBF8
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598186; cv=fail; b=XOPs0zIzxVEhPDb3Bdo63OlhJQGISSXzdFgyz17Gu9DS7KXG6IbicG/y4GP0yeEDMJM3Dd08aSVpFstw13XE2yMAXnlrwV4BzKj49zkFbuz3sd5gNKgoUtnjcRYlrJtY9hVzoSL04XyxRfArDvQhn/kyMUEH/hY5jmcfbO6ZZGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598186; c=relaxed/simple;
	bh=HDXa10rcAttVS4HNOBvcNTrLP28mruPHgc94QglWkSQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kZyBc3we2/LV7WpNJo4tDUrCnyx97z+sjo1OjpqtXNvVzo62FS+LGbO336c7swPFlIi9YV9KUQ2nLm81Aouimzp9twPANf649g54WQZHhXPVSVLl+7Q6JqzCVB10o46q1aju/Pgf/ak43vUcu2uOGgew6aof/25DOI6lCIskc1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eHM0E8Al; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eHM0E8Al"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmEZs+TW3de7FXKiCM420kQu3dbDuKMHNhCXTc7jjvZ/NT6pWHvgHajUWpgctvi63wbuk9XnmQregYPLPmVwEq7bta60ew/yUFL4P70LTN26bn/QAkxUN8hGkS5PNa9SnfTvEbB96QaeKhR9PULQ02bNLeoLSiltaZceaRWpY5Bzhc9JNZAHyyMV1ETQ11CwYVyeGy3XWg7qn64ff07TfGzLSY2vaOScvRq6VVZbC8lq6jc2t4tlPBBQoh4RH8RDvvQnPyZzTyZZWekHDVqM/pbVybb9GxGr8qGgwWCfbpjOHJ0tDezuXJ8K4axNLIjnx8HHaeqV/702NSpuTpWWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KACVH/ZFuSqSg2qAlbYO1xNL/7zK6+QRc1MREsOx//w=;
 b=gNQjLzMqjNOvMP0Ax1qJgPVf0sl5DJ2AJv4GRlRvSsHpIlAT5OxDh6rL8S+PwpJXWLMThEogPzW0/SFsyEcBIbs2SeYSVQiZQqmYwLp0FavDtbrwHHVxGk0VV8UsYmsn4mDtVtpWVbd+Z+pqORMb3YOOqLWpRyUyFPEvLK/v1VMQ+2MPbPa+BlKOFNYZ0OS3ypwSjdut1fqjnOLVswOsGVY7V0t4sGzEOJlVHGIyp177krbkES8ZqU54sKk6o1wa7n6BC6IGSoKxUe2u6QLxGuk9YY1/eu/wfnPeR/cdlpHwqWi7SQjsoCUpTXdKs/BQylCyJVkAQRFLGN7YdX/4Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KACVH/ZFuSqSg2qAlbYO1xNL/7zK6+QRc1MREsOx//w=;
 b=eHM0E8AlvI2p5LU7OhQrx5Y23+NY1KHEnY89ebPoqy3fQzKjPpw4hhK88mktt7bpD1he9zTxKpEDoGObKqJlI339RB1kFHSswvn0Xl3CRjVQhWxgqIkxfRgVm/Tuyk0uRqF8GSH399+H7DlCT3y+WncoVPlPyk1ThesstwaPjRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13531.jpnprd01.prod.outlook.com (2603:1096:405:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Tue, 21 Jul
 2026 01:42:58 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:42:58 +0000
Message-ID: <87jyqpi0d9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: ti: omap-hdmi: remove unused *card
To: Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ldb5i0do.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldb5i0do.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:42:58 +0000
X-ClientProxiedBy: TYCP286CA0213.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13531:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc3b030-cc36-4ac2-6997-08dee6c964d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xyiW3aNipsSQy/C7MBo2pyzeXGaNyh+5jtYm+Gk1gytzKbTqBSmaDqe6QmNRSMVVx9DrehYeUfs/AaUNdwfnTm9MiH9J0JyLFgRsHA0GF+EAhu93UrO393Ql6EGoB+04pPjLpBEjj0YtsMkqCmzncc9H+Y1kJ4wrkUe/nFnCLK7gZGTt1y0YjCOw349hFC21PNbolcEIwshU3sItDpQpR9ZnK21fbSE/BBt5aaJjjZ8osXjivqK2y4n2Tb6pZvmYLImTspQlXlAJLbex+xajyjStyus/K+e1vtJYMbMyPKx1gJjKknNe+8Lsy2dyEQ/8/Z4cxtKjRjVW09y2mm6PtfNhHKEXIVffW0Za+mJ8b/K6B1I9RUqHNMWyW5d4xpZo2ye1IHWNvGYeRxHMEDYcqyLl+2KF91VEbqYqTwoLgZw9noTgzV9ncZAl5BMaAD3FchKPFn/vEmtp5GaTrSrRanD+WFrMXseHS3hvEZUv6fs+v1z+RaG3RUPLGcMFda7XXrn1TLVu/a6rrLh9/9NLxaDSUb0epvcMXB7SQe7HJZ/VxTKhF6gXvy5hhzJwr6xReyyb971jXKxBXkpdmJxfVKXpJwiSUoeiZNNzwivDIB921dGXKqUO+XftjuWhEOV8YRWGFNPR9vQfJSUM4yfEvH5G2q+SC413g7cXIoFniSPaPR4X0snY1o2riV+VRJ0ZCmjs7eHGdEEYa63V7kXSuLgbn1zWXMgiBjkwlNKX6+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uDzwx3gf4eII/ksOiJu9Ok6sQSVBuIP93MwMXfMyr4Hag6bGZk1HJDgX1Q0/?=
 =?us-ascii?Q?ay4VeLyz5x/UJ7C+cfJOspZDgjrF0+sBh2mBo1kpHWTdW7jZ6Er2rinVDgZN?=
 =?us-ascii?Q?gGOUlxHYl9DhBMrBkxFZ49A7y1jIX4s2zdthkQSlNOrD9EZs7HVlIIl5KVCS?=
 =?us-ascii?Q?Y21NDHqdZU8SoLQE9/23KEAjFEqvjg4phZoEiFyFcqlmEJ4CaLOLRoRgia4o?=
 =?us-ascii?Q?BtF3R/Dgivq48EaHZsmm4SftiHpInj1I1g3vKZsuhXlom3zvWsl9k4ZmnWbG?=
 =?us-ascii?Q?/0c/vsVYOZZs45MEZgP7j3G0HLOqbtgL/2XOECx2JA4MPYd4EPvjy/Uc3I2K?=
 =?us-ascii?Q?fX6TIPowGAzb6IpD1jPibjVkVy7T/sjTBEQp/rlDv4JDzQN5fnxPBCff3HxX?=
 =?us-ascii?Q?yb8k99uolS35FwuX4ySPhcIY7hXlHaU3i4YsIsst/IfGfWje+AjkTF1IQVcX?=
 =?us-ascii?Q?tzOTOAEueFisI8hwrvEFKel6jUf71xdxjlwrEAbMo6Bku/w0knZ6HYMmY/vU?=
 =?us-ascii?Q?Ji0WmAw/Z2TVMzXx2bPHUbfM4vZI6KfTGKj9ccJVmMI8KaB7iJznfJtZy73r?=
 =?us-ascii?Q?EJ8p/Scad+lR3VmMuSBT7XdhmPX9Su7LzacCTPtRvH8bjndQqmnrYetTHyDS?=
 =?us-ascii?Q?gXKRinqhTyQA9pjI+e7ATsa/85zsPfmc6Bjis0QTGtqywKvf42CO/5Gc+7av?=
 =?us-ascii?Q?I3MP21sx47LKPD/VU6nWfLR7YQvluRGArdSj6Pcosmj92s5Ah+fenk/D7Dyu?=
 =?us-ascii?Q?fXMA7DUxFAX7IZJBXHkr3Wa1UWaYu5Fb69FlnU/VkCHBjb1x754ch2M1ext8?=
 =?us-ascii?Q?AKD+jafYOJK71/cE8oE5AanM5D/6ngxZn0B/tcs+IxQ9HzdGwDDAYd4VthFD?=
 =?us-ascii?Q?bCMsEu7NWCsS40rdn7jeqOOm97bhkrI9zs9vgB/lIIX6xSKC2cHKGcRPWODR?=
 =?us-ascii?Q?WyugLyCWRnB9NYq5z7hzZ7Rl1weJuaSu6ukh8dcR/PBXoZ+geZPgdnHtvdPI?=
 =?us-ascii?Q?dREyBM91TiRLDILyIvIu9IuEV8YhMcRHVxbyTBPnGxOqksDFu+l/azGQF7wI?=
 =?us-ascii?Q?8EuI4EiGEHUvsgbOZW/20QLr3QND+fQSO24tU6EXinzxt3hock+ZoXh9Oa4y?=
 =?us-ascii?Q?l101iY3cJqGzH5zyMmy/rfCsYNvVDeFjL5H5qwttq13Ko2zPVp6yMZW4s7Gx?=
 =?us-ascii?Q?wCtA+qmrUoWOrEY4+nS+qUxGiFHxWBHasI9NvA6s/vRzIV97KTk5vXtu1Oo1?=
 =?us-ascii?Q?C/9ty/HnwJQfEAu2wxZrzf13L9B21mMOIvbkmoXkTWEvnrV987pEpnZD6DOc?=
 =?us-ascii?Q?QVt+loEChNY0SM5YkB9CEeOnk2kthL9KUMYLCnSE6lOA5gpsCvplJXKuJWWw?=
 =?us-ascii?Q?Qc+A9DyGJEyFhi9enfkfKLJzZKTWPdUHxhdbl0atobZNp5Lr5PDsiYSa0paT?=
 =?us-ascii?Q?grdcNTZKN/IaA8Qr6yR4Ul5iLn01OOZOpizogIwnvGQNqTqLr821AbSq4Tiq?=
 =?us-ascii?Q?bGcBA47Iz9AviWc/TH9FTNpFLhpIyFe593LvVFooJOZ3+hTej/2RY2JwI2er?=
 =?us-ascii?Q?D7B6Jse7i9EMbM4jz8chPhYH4M9pMx0szp0dFBaB9/bSxXpkG50RUIvxcDm5?=
 =?us-ascii?Q?eBiHBhI9a6q5G4HF6m4PJ7K/zGpgWYI6MHMNlRYFOtm64c+raZqqnTJ2/Nxw?=
 =?us-ascii?Q?sry8/VPjqB4TQhs1qo4kEfxYlFsrkSO0Qr0MoIQcTtsYZ5avSTJ4lcUNEYNF?=
 =?us-ascii?Q?MAQJ/X1S3YTFycsybcWlCMJjX+e1KKy/2cr+2ZfwGwbmUJcM8wBu?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc3b030-cc36-4ac2-6997-08dee6c964d2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:42:58.8544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlB3xPCDBRzz6MSJXVZJ6YVq+fAOmBA3+qzTYx0/iqz0NtlLSEFKW7wBjNjBuKhe8lXvEmdhLQNDjNicFXBkyIXJJkaADGOCLuXClH3S/S01EER/myMtJk/PF8Eg8syz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13531

No one is using ad->card. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/omap-hdmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index e60f5b483fc57..d6b7a97a1fd96 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -24,8 +24,6 @@
 #define DRV_NAME "omap-hdmi-audio"
 
 struct hdmi_audio_data {
-	struct snd_soc_card *card;
-
 	const struct omap_hdmi_audio_ops *ops;
 	struct device *dssdev;
 	struct snd_dmaengine_dai_dma_data dma_data;
@@ -380,7 +378,6 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ad->card = card;
 	snd_soc_card_set_drvdata(card, ad);
 
 	dev_set_drvdata(dev, ad);
-- 
2.53.0

