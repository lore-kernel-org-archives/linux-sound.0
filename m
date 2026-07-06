Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011038.outbound.protection.outlook.com [40.107.74.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596D637C0ED
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303369; cv=fail; b=i1dVZF1/Ofyrn8DJ1k1LXcEBQWV2lxqmg+ey8tKn2ESyTU5Qg2IdF1wEueStQJBbyVEzxqK4Ve51XaAxDh3DcPATtsU+ps103MvPEXxFdVw5HnMZ3JoTdEyV1x9Y/kZWFZAja4fGq4gaUXHHm+PKbc/k29knUjccrdKqH3L1Nb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303369; c=relaxed/simple;
	bh=e7gMYORS5YSp3z2ewgtBkZ5ENuIJsDojnrlmu4QIsXs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RSizFvECM/eKRkOC40gm5/4obWPHwCjL0AXNVmgyw7wvXtCNDS0a/4KiQ8zMc/WnF/0jFuAmtKe7wqnWFx9Hydcgr6hJ0WeOVSYNW1gFUudxsLHZvDR/g/jsZyOEzrNBpqs7F1c0WNPryZL0K3UsOk4HYZzZrZJbhc+bktN6CDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IL44mIMN; arc=fail smtp.client-ip=40.107.74.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IL44mIMN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRF/sIVZQtohmdMHeeigB17KgGjMYTwfkJl+IiIZ1bVsB0EEzFCFTT6g10HaPM4HYwV3Oim/TAdgk4YqHqvo1W+82QIV1/CT3VIFIPVRjp3rFY7UGsylVEYaPyoNNf61k9/KXoZZA4Imf2oEG6CkqWrao3U3hU8EHRRummHk2FXpFRO7uMi+m2msyoFweU2S47El/d0quqavPPYBy7FVO1bzrMi69u8h11z7zOi59tIzcFa6lRA1xYyU8zmflIxt1hwLqdq/+BQT6VlMr3JFNXMMs0UXfV1jCPO2etDFxU8j00xs4/KUGVhRuL1B/Vy9cMiqDvTrAXYowOp2QaeAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJeieLn69KN966SAaFH5A7Jfd9vq65Y7z3t6MqKDS40=;
 b=GuXGdgX4SBADc5bBg4AFBAjSf3v8wDJgGVVF9KKdWpeRfJ/SjD4HbImXYRkFVTOorkyp6uEBb6MEWo7HInoYvqhn8Ea45EtZFEByTxcyEf4UyNbyXt3afeNZCec1sCPKb09oKAofLX5iqDNWrbHYrea3ZyLBA10XkQ3IK8X2xcv7kmqkL4RmkiKHN+PBnAHbcve+t92NwF4wGx1xW/uz16663luGCwqQ+YnPsKGucH95ug9pqUBi+mfBUJsMHhf37DWmhGgJFODEjgqNKxRAN/znvB6U5q4em82SM14NOY2p6jaYbhQls2CLDtd8VlyYjsEiQ36+tjG/cf4TWX7zEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJeieLn69KN966SAaFH5A7Jfd9vq65Y7z3t6MqKDS40=;
 b=IL44mIMNn3Glh9NqJtkclLoBdU3QOGR+GHNUC+NzX5eIiZp7PTu1GtGtDuL4gliwYPuJLQ4FUf9Sbzexe/4qvEONx7VSC0J7lQ3gaMT68GyP3Z/76WTCQ1w3avfS8FiOrKnfCMgJD7+XcVyf9T+ed9QqJ5XPjMRZXPRBb2LqE1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14075.jpnprd01.prod.outlook.com (2603:1096:405:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:02:45 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:02:45 +0000
Message-ID: <87o6gkc1tm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 08/12] ASoC: intel: catpt: pcm: use snd_soc_register_component()
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
Date: Mon, 6 Jul 2026 02:02:45 +0000
X-ClientProxiedBy: TYCP286CA0322.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14075:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2210cb-87a3-4e6b-c7fa-08dedb02ac0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	STM/FXHvCsOoXdoLIgIWk2oH4xUc3Z0QdNdo9ZCyRQe6xm9NY/ZPOB4DJ1H7N0c1lJ0QtVYN4vskgpJM5uXtrHpmeiNzroQzvN6oj6tsz28hYNrre7L/DeTtXiMEb8z8ExycDGlsNC5tlgjVqurbKw7F+A7dVCLTuA/rkF32hb+Uge0xA3tqMmXjQJHsOi38twtGBtUqEZ6FyOsislJlx0/jYMXUFg42G4WRGiyLxU3fCkb9Hzkgg6DK8FjmdDA+ip/UB1YDql0Co49ku817nxWG+frPOZRj916Y4zj/HGUBKcwLKn+kptE/vAcYhNclybuUoB6jIYuPmDQY/qtRVtgrsuCYolBghXnkwCjD3d2hZnw50ng9tmI//5YpL9msxduPccuBMpPJ2E3t1w4ADaXfg5eG0l17gyUfo6W79YaT/LBOAqPKPM9w9rgPAu0+uDwbRISvnKHd+YhOrgC1/dZNSJLqpWZUqEt7ct9yCY44SCxvAYATWdKI0s8bOIS87ol3cbQsdDyTBz5/vl25gaV3a5vzw/+d1XVDZz9OkyYyXOBW9ZFySoI2n36NBZWoQXpaKTHj2qFUIrK3mMk8MESZtB7spBy8K6rSqbh8uyOHz1xXv7+IfuBYF30ysv0Ctuw3V5wunq+9EKy3Vqzu0P5A/5+p3yUUNBJHt48zgtcrCAfKWc06+FGQp+m64y+iW+HELbwW3Wke3pdyxfWSJ0YGl8MILVxoe5u0xadtsy9Ip+adw+7IP0oelStfbbMX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KnMeGjUYcxDKmu53zCT2IPfq7BR3lpsV/Lu83S3ESVMGB014nA4m9GcOsULX?=
 =?us-ascii?Q?HA0XuENtMci0eqQR1eqDdb74n30i7gOtVuXvogaolaJdEvqpSawo9f0lxrAm?=
 =?us-ascii?Q?R4W/3iud0x9rIzOiA37mAvpgZoJ87s1hCC+9yrpx9R8vtKjYjjZOwjQzb7ov?=
 =?us-ascii?Q?FBlsUPPgDUB+NDhzfRxJVfk3tkCLZPdvZC6V6c3fSfl4Mp6iV3/kjNr3vlrW?=
 =?us-ascii?Q?+yY2SUMvL+UWq6VnwCC+GIRBmIy5sZC8u/ZMuRo/Jp+cHWMmc7U8A7twwsEC?=
 =?us-ascii?Q?omW5Vyc+mWL6PbxmTiLTKJ/vN2+ke463383uTVcLeeJrwd82eilstWSnDNUs?=
 =?us-ascii?Q?eJ7CywQ40CatwvB2+naYjgL5WCTYpSWVFL1fxbHqFx5goGhRRVTKJVhCl6V8?=
 =?us-ascii?Q?pKievbqa4Qk9Uhz2ii8znqbszm/YXKTrSaQxi0YXWCBrW1IT+0OQXt83zpgE?=
 =?us-ascii?Q?Vfl/wvY3BJQZ2EeaSOD+uilZkiRH702vctT3k7gUCBuUxitzAcxbqlnyopCc?=
 =?us-ascii?Q?WMICJtZ1jSuXnQEwhyznv5LKO4Wz7Fp9l0bTTBOoeE1X4+Kavt0urYMba0Cy?=
 =?us-ascii?Q?JFTW/7lu4bta9AquVgo5r3Z1D5fdT8fMMu8SQo9nrCG6MPMPpQ6rsKtYlBJ0?=
 =?us-ascii?Q?pJBjVYr4H5P6H8aRfLjf7VWfV6U3NGOeHLM2kaEdJDmTXm2RmVd/RbjOah6n?=
 =?us-ascii?Q?A1BPLtd5lOgWWiWiuxX98kTSklFGgxMBaV2CX5Qyv+Y2HHA9n90w1ZCD7lt1?=
 =?us-ascii?Q?Mp+vaURnunYsAHMl/RsY6gY6fuB8aGhj3aUV/xSyubqs5lj+9SZZQueTyZrk?=
 =?us-ascii?Q?h+ZGaj2ynC/QiE0lMznnLvCXN2xzAyprFGXoU+pTTe2xql6NGm/K2ePedr2g?=
 =?us-ascii?Q?BWRbqijcQfxvbH2yu2iYjfRGIBRj375B70Ky1p71udy/usn2G//wZRVUH5V2?=
 =?us-ascii?Q?NkPbse9sdvK/z+aQshjR6Js1GMHcWCfeNzA3IVJFG9l+sMYji2/Ijyqr8E4h?=
 =?us-ascii?Q?UTbM49VMWs84m6l2lcJPbtSPEaRnXU9/Rt9KOjz+GH/yH0SHtW09nQEHc1xG?=
 =?us-ascii?Q?IGI3+KAI0b12IrFMNYNeEJHifNUKDkfrQLW094CSnxfofZbrQ9c6UGGvhune?=
 =?us-ascii?Q?dQ9L4cUu/bFELKxnAuiMZLe3ZXkq6HGt2QXd0sd1WF033Wa1H1Iu7ZLMF7mu?=
 =?us-ascii?Q?Usouy6KfydfDW0zrtSIC9E1Gyp1wa0rJoAphqB6/SzNCgC7XqSJhJ/yLJ01L?=
 =?us-ascii?Q?U3b8WZazRYPL29EbfuCp8B+9aKljpHfUcL3n3yXrclPC8sYsNrqaSp7MZ+9I?=
 =?us-ascii?Q?mG8EAYnpe3HKG91JtXP4WwwlCEa3DDVAbvF/oHEgEwQFZQ7myK9nagcDRzq9?=
 =?us-ascii?Q?9NQn9ZGEfOM1OGst+jzNzJVaMTm/u//XvAsDQhT5T3JGaNM7lDJM9C9iNYGz?=
 =?us-ascii?Q?DJuW3nzt2hjHoAIVOkL/D+FeZLPuePLD2xLNXN+KbQoonnPULPDSBEAHWt/z?=
 =?us-ascii?Q?hL3k7oZP6OcdVnzQltykciCGV99/2WmEiqUQJrs07a+z17XfOaDX8vRqDaQG?=
 =?us-ascii?Q?b74RhNmRReIQK0lS9vv+V9Wu6QFNf8ZWksVqWwwNl7AxFwOagElbrm+leBGL?=
 =?us-ascii?Q?tyGjnYRy83nk8BoGUyqJXnG+xWHQI+d5BsKDEUrgnNLG0D9c9a0CZNthuFX5?=
 =?us-ascii?Q?joXAwB7hf1xOGiBXjpVgK+M4dnSIbKZyn7ZS1iVm6FbZN9783000hB+12MOj?=
 =?us-ascii?Q?Be527esT5NdNjcoeJNICBxH0Cv2fCVbWpGQLRmFRh77Uid9UfxTY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2210cb-87a3-4e6b-c7fa-08dedb02ac0b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:02:45.7806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8+h4oH8kgp+kztyeUiMTwebI10ZLLicatOYjQoE+UJKMnVnOmvLa6KURXHQCbe07xEMiXkwJIiPgmKwFdhWk/gJrCjmpH8/knC+TBRS2VQnjxf2YA7RLFE25txGyN7M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14075

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/catpt/pcm.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 8fb0efb67eb1d..6c1b87d9fc4a4 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -1073,18 +1073,14 @@ int catpt_arm_stream_templates(struct catpt_dev *cdev)
 int catpt_register_plat_component(struct catpt_dev *cdev)
 {
 	struct snd_soc_component *component;
-	int ret;
 
-	component = devm_kzalloc(cdev->dev, sizeof(*component), GFP_KERNEL);
+	component = snd_soc_component_alloc(cdev->dev);
 	if (!component)
 		return -ENOMEM;
 
-	ret = snd_soc_component_initialize(component, &catpt_comp_driver,
-					   cdev->dev);
-	if (ret)
-		return ret;
+	snd_soc_component_set_name(component, catpt_comp_driver.name);
 
-	component->name = catpt_comp_driver.name;
-	return snd_soc_add_component(component, dai_drivers,
-				     ARRAY_SIZE(dai_drivers));
+	return snd_soc_register_component(component,
+					  &catpt_comp_driver,
+					  dai_drivers, ARRAY_SIZE(dai_drivers));
 }
-- 
2.53.0

