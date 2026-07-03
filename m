Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470AF37B41F
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303336; cv=fail; b=t2AE43vStp4EEfMkDwihSB5ibZHm/RUnhmgDi0oIlUNW7z0mD0ssOYhxmmLqDDYEipAC3DWuAOivps/yfJQAuPfk5q0EZD87wLCU0t6IEISfnxEMbeop/MneNc3SlsJTwuhnXfWH61j8dR44s125yGjX8T8evSEWJteIgJvBy1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303336; c=relaxed/simple;
	bh=PDy8M84x2ZG7ASn/4elVysI/gmyZcy4ptwV+roG7eO8=;
	h=Message-ID:From:Date:Subject:To:Cc:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jYT/L6Ij+gVnTf3awS/FSgMT6/hefrzBa0uFup2xmdke+SXC/yLU3FHQcQ0A97uswqeu6Vdu5YafrlAS8v2sMufXjN32quF/Q2yPh+rnkZULJv1qTaVny16daomygUZrC4z4MuzEw/da5R5khxNiqM/flsCu4exONF/ruUyuZzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lTtnTxRS; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lTtnTxRS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHgu50KgMmWvdCQlxWohYkyFh5l7yUJ0RpsQDbQsDBHhYAhbGlkI6Rp5x625BJz/G6e5OUwHTMT1qemhJUwEGsjRHPh6S+jajj69W4bOt8RphH4HgH6vqsKFjll+4O5wgIXyD3vG1SCjZ+Jb8e3u55CDq22oSikkPBrpaBzfYH1QZdwRicW3FzPe+tnft8wEk7EfDqGBjGdD8PhwQOMCaYy5nGauhTLOdEfBXdzDAku7XMD+HNkj6eONffVKI02tcgcA1su6lbEIQHZr/eWRtblfnAp1XWiZRhOKK/9gpWz41CMRFqgFmYNyXtPJvhMWpOoeIA5Wwkls2aqyfZ85mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaXAUi577KEpeA9hA9pYzdrehCKjo2q4Tr8olo3clyM=;
 b=EdlRGYtjBJpQVp5FnbERenin5xPi8j+DbuTL+c3ziLjiHT1ZSBLn3yqHIPuoC1uMT2OegAJqvwPfHuGIPJkfJEg/Pd/44Oo+9nVkVa0IRrf85i2Mj+f/zm5MeYEyRdsxb/Lrw3n5meCOfREpso//Do/B+JkfesHTnVdS4JV88sy+cAMgEnqdKMX8Xt0P3uI4Xocm2wt685mKh6pJNoq9XEDeMgzMuK1tfMbAMKCrr8aav2dpHJDOL8zsfg7rV5i6EJoifsWtkDXfjzrVdPCobGk4DtZwgeGvOYhfVl1/rfMa3Qehyd64J8R8vtpaiqWec4Ma9vN+hu+k7jtkVCn9rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaXAUi577KEpeA9hA9pYzdrehCKjo2q4Tr8olo3clyM=;
 b=lTtnTxRSSmssEcmtlE0WEi1HKDimw5uD+OigGNDxjuH3vaVwKrcZaWnTbTFopk4bPXrLiv2mizVP1pj4dZL3cQL3GQfT548cXrz+o1nKBEu2RCguCNjOgWVOO2YxUuoCmo26bWTq9o3Ow02w8TpWENze2YAjRwKCDYjWxIS0p1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15874.jpnprd01.prod.outlook.com (2603:1096:604:3d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 02:02:11 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:02:11 +0000
Message-ID: <87y0foc1ul.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 3 Jul 2026 10:19:26 +0900
Subject: [PATCH v3 01/12] ASoC: soc-component: move soc_component_field_shift()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TY4PR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:405:372::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15874:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe7231a-c986-4216-d1ed-08dedb02977d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|52116014|1800799024|18002099003|22082099003|11063799006|38350700014|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	JFu6BtUYtdP+PnSoL5D/qSXAi058yAUovGZhn3qaSb/cjsnMCrr6X0fBftOqO4yXIiMmLVvaJ/tI0s3XsoPxuvXh/MB8+Odqci2MkgilOwCZ2jc/riM704mOWdOzsJPgjbzrQy/OOTh3EtSGGGPmprFpTNv4s6ylCygPvQOW1/HR9POZ0RvFX7Q56gXYSfDSoR4zHmguJy4TsLc5r+fa8mu0A5v8SGD53EwiH5U5uzgDUOHVUSP0sl/Lw6XFoSSUVD4nsDMnEVGM2aOgbxz6SbDsF8u0PolTMxZ7G0tV+f3MRoSDjOtZQqcpK4wQuDURO8Erc2n2KBh+6IA0hX+518gnzU5DB0/p2XMmVNbK0w/ijvI79FqhAIkRkEBoAMQDB4LizmTTPymVTQKIHVpXxXEFR/g7+M6zWK2ZzB1fHIqejU/w2qngO9bXGUQNuq447Ie0gbhtyWcucQNMIU6gb/WI8eVyvP3PaDaFlmq4dZYR7KJKrFMHuNByxWJF1Q99kpXrw4L+rg1P5Lac1txidD9h2gpFvWghSAVkZLyHF8Gk6i5am94iRWXE+qfNNlVRFT2rZhJShOj4TQkASW3aiLZP1X/eu9FhTk5qTMn/3aL/6Xv9fuqbf7c3CS/8eHvrOK/nMQLaI10TyiCBS1J5fnBCXtwDp+Ws3SxLs+/M0MHn19qY9tcAN5MDyIaDxsaOhzzkt1Uxo2ipr0qxpUo4EfEt5+iZimX+/67CHCjQjZL0eIOtfjQkjZt/YDG2fpPo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(52116014)(1800799024)(18002099003)(22082099003)(11063799006)(38350700014)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zdfo47H/jtn4wcNSe9bVtlVodPaOX3jWP6Qh2UfYehfjo6ERj/qddsB8x6xh?=
 =?us-ascii?Q?haP8HqNOLhXx1J/97UM5ktgFVku+vsRE13EjkEuWT0PONFkBOECP7WAWC3go?=
 =?us-ascii?Q?VtpftblggJLWonfoBZ9ekCjKO7UZGUUp+mRJ1PmlPq1oImMx0l5aYJiap1QZ?=
 =?us-ascii?Q?kPn0XKoq5XknGmHCgtowoYsFh7lkbUql5svmvqPskTynuJ36osg5kVe42BIt?=
 =?us-ascii?Q?az5lM+zDFYrnk55OBNO6b1XrHAQWgKEf/bM/UAFIQlmZQSZ4viRqynlyXb8M?=
 =?us-ascii?Q?p7yEEAABtOn5GWoCI5RFbmzGLd3fxCuKLAsBoSWpI9sH1Lbx7m17D8mx+VHt?=
 =?us-ascii?Q?8x3ZIedL/mvsxNnpG9ifuhmt4S+I+JEKtw4vzE71P/HzFDC5/pT0eaFa8OWN?=
 =?us-ascii?Q?FgSyNk/hm0v7gMKaoaO5fveUdDfj6QtCfjkWZWjPgjlv8UJt3VOxrltm0dhu?=
 =?us-ascii?Q?jelK11ZV662glLjAtiik4u4n4r2lYqMrdnpQfCg/+25yLqS0exU/DJyKeDe9?=
 =?us-ascii?Q?nDLo/FxQHatQfJGscQCQC9PeMTbVTBsMg+1P5nkGbwZBlzUyBHWIfx5rd353?=
 =?us-ascii?Q?yvdfnID9GzahHPT1LwkiXhgLcNmbRbazbBvOjRYznejc+xAX2ByhbSFswuwm?=
 =?us-ascii?Q?R+x6zbABBaEX1To8xVzMhXajuQmnQh4yW1z1xhmfUWII/iYmEu4Jj0/aWmak?=
 =?us-ascii?Q?sU7S8YdYkC3mDzVCpNUOOIfoUTa9GhwIJ21FXgkjcCWJAVg8+PoaOEmUZyhG?=
 =?us-ascii?Q?GgIrkbHLRIlG8yNFZtFaINOI5RaxeHyZwc7OEngxUBodKnfzxxNK3AcM0UA4?=
 =?us-ascii?Q?zKx0xuEFGQktCaPMF0aK4ZxWQtX4ZIT9JUI6xR6BcNKAKabBSs1m/G7Bud5i?=
 =?us-ascii?Q?vCV1P+2KtsC0+9o42/gBCtUMREh0qKnOF8DNRCub9clklx0MAzWGnrqEt76i?=
 =?us-ascii?Q?lvBpx/8EsFI0hVw/5aMNVvv0Oc25Otok3wNmFEGgpqsqikE4GpI8GuJgL790?=
 =?us-ascii?Q?a1l2AU6tbmX8MLPV9m4x6I8FNSAje20MYotayIuC8UyaSW3UAgkIrCHcocbR?=
 =?us-ascii?Q?S1Ovts2IAF6fyYKS5NDdEN3OxhgmJ6a8VBeJq7VZ26316TY0mevNdfkPoYUe?=
 =?us-ascii?Q?miV1xFaVABJpzvndrgT19PQXyKHXBSG1SNFBBjWhjhgZoqBEODL+G/lY0gTQ?=
 =?us-ascii?Q?lgT1C6591DDHiH08X0K78B2M6p2mPxkC8rqDE+sIEaBZamr03cNOrf/JOm78?=
 =?us-ascii?Q?VtZdX1RdNIcdU8eH5+QKI5DJIuyIqJgGA8fAyfg7HDTG1UbAUUd+zO2jZJku?=
 =?us-ascii?Q?kYpN4vaiHrrkB2ShARP5Vn5TsAuVP0F+JLFPQP/hIA176WzgfPAzwmpB4bho?=
 =?us-ascii?Q?Sh274qGfAUb4ryuKlzdSLyk86FTrCANb6bxi43xSgvSdn2G9tfc+pY6zd9Ti?=
 =?us-ascii?Q?t4l+ejjYbjyG1DgBVoWKn9kuLlmULHv4p90xnVgOMsdd8Y71OtgrfKbSvON3?=
 =?us-ascii?Q?pxY7FLnb70M6mHd0hoBRe7BS9ma9wt9syGN7nKXjagcYY1vwhk3/N4Fj67mN?=
 =?us-ascii?Q?KcuqUeffNMUIp1sLKHsb0kxuZ2rkb+95TJYBXUosLLB1JD7kUcpebQzF8GGO?=
 =?us-ascii?Q?ZpH5o3njFgtoBLJWedqXiDkSjgZgxEpvFQ+g69D0CQS6O9ww7e7UzILU6U9G?=
 =?us-ascii?Q?dXqXg7OQBy9RqCX/9z3Ki2vtvlN5YLfIsda/26/pFYWS6AD6P3B7keh043+X?=
 =?us-ascii?Q?OvtHIVfU8o/wRbcK+wGh2gl3Oaxr7uQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe7231a-c986-4216-d1ed-08dedb02977d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:02:11.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJv8OR6HYjW98MrJr8Amfui0ur+kfhULQGuL2qOrGUgasLBAcSWXg3fKzoEPWA0KKdO/VSvRyU9qxyIZC443choXau57MGfmHsZD0xURLBdTBAUkS8Ze9wXjK+2PSug1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15874

soc_component_field_shift() is used from
snd_soc_component_{read/write}_field(). It is better to located around
them.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-component.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 21492d15833f7..718246e53e896 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -29,18 +29,6 @@ static inline int _soc_component_ret_reg_rw(struct snd_soc_component *component,
 			   func, component->name, reg);
 }
 
-static inline int soc_component_field_shift(struct snd_soc_component *component,
-					    unsigned int mask)
-{
-	if (!mask) {
-		dev_err(component->dev,	"ASoC: error field mask is zero for %s\n",
-			component->name);
-		return 0;
-	}
-
-	return (ffs(mask) - 1);
-}
-
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
@@ -810,6 +798,18 @@ int snd_soc_component_update_bits_async(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_update_bits_async);
 
+static inline int soc_component_field_shift(struct snd_soc_component *component,
+					    unsigned int mask)
+{
+	if (!mask) {
+		dev_err(component->dev,	"ASoC: error field mask is zero for %s\n",
+			component->name);
+		return 0;
+	}
+
+	return (ffs(mask) - 1);
+}
+
 /**
  * snd_soc_component_read_field() - Read register field value
  * @component: Component to read from
-- 
2.53.0

