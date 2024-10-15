Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC1E482DD
	for <linux-sound@vger.kernel.org>; Tue, 15 Oct 2024 00:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728953773; cv=fail; b=LGAqplybzkmpldqrV7ysPf8L4gI4xYsF42l2dcwNZKR5LQOrovdnWNSbOhOi+w5eOLc7sHpiOP7Ea1qbJdX997L9Hr2n2v8j42YTck/fUCdw9FHw18RQVH5fpnZcE/M79J/xoAfaFr4qMzJG41mNbO5wGhsylTGI2pSna3AS0E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728953773; c=relaxed/simple;
	bh=GgGhujaI0woWlgYqdJG4tJyAc+dIuukpTkAfJ3dobUU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZFEyGnMYlwlGKVbQtStVfXiPOIlh5T6tQWnYdXtR7XbH7eeG5+/CKgsui6akaXe+BO8MgUCFCwLnYMncCi0MVVcvsEGPjCagNS1UxDkJh//C0kie0C8LHnO2ViTiVtkgNcQFSh4WRyaifVeMMJjOp5775IhQJu8fwxFnRhfPYV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e9e5fa5P; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e9e5fa5P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywUiuzxZ20CP6yvjeG+Djueewim+AVxJ/dIdld9y2aGLmWn2IWfZ5+1qkN+Id6lt6j4LqEMoOXtL22wFc9ppm3AIFliys+7YlFKckEoAXoOYzeTsf/pZ54xdYhDu3pfbEfpKhYUOXSwgy2az+CPLBJPkOYShmZ8gWUaJKctBiXMwEptvc1usRB32iUaQqS7h+yH/OaIN8CqEkmHDZbAPQrzcqZeuwUn+5dtJumI3RcaP+jgcKZRtcFYM+iLg5Y52o2hHVcGxCkeLpsDXxUJDXOuMGOkkbLQx/pR5eIDB+8+GDuJQyjqbffud9+LJ4h7GLy/0uaHGGzgVM2kM2dFdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZAxs4yzTaa6Dg7lirfzVAAaYESTfbXLM12N5GBpcfg=;
 b=bFPCVvCqEaplnGllzfQVC0wuZeNCJbzUJhBRJuH+fk60mi9pW3LtRNcCWCffKwbgBMCetWyl+44pYBnR1ESOpsDJohC4hWf0uB/MOdVm72CDCdGPORrHQkVjH2PXBaGkE9uQmDGXBb+B47RwdVVSXe9jcqOy86ANgXFs4X9A50rGERSHNVqVneecuiakDXDvdEYduRES/y8XE320BEPjEhhf3BEfZ/ngE3Go8wtJwnmkNcHwWFWSu/qXhD7oJzRuoPFb/FkKnl641mk3yqKn2simMlEcv+oP0SiDRGQbRI/vCPleT80ZspgwVKXX5xkPcBArKz9+u+tPXISXd+tu3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZAxs4yzTaa6Dg7lirfzVAAaYESTfbXLM12N5GBpcfg=;
 b=e9e5fa5PfpCED01vqt/nl4MAuqUxtAYuEDDLsCNpwtdeqlV0dCCkHzUUHwHsdw+PsIgeMToQP2bNijvkgJQe+jbzwXmiBNeKsjvmmxlJt5UBnBGgdjxH0PzY0hSy9c1HBWEb0eiaNg1Ppl4wXsPZPUpr6i6SnW6k5F1nj3ptZzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6130.jpnprd01.prod.outlook.com
 (2603:1096:604:cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:56:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:10 +0000
Message-ID: <87jzeaqj4m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 03/13] ASoC: sof: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:09 +0000
X-ClientProxiedBy: TYCP286CA0288.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bbab7c1-77a2-407e-7c26-08dcecb42884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dIQdUl6ErXiuCj/z6JhJYZAnIBocg99KLtYJMgs7MfXeR7SlN6cBzSbYGe4b?=
 =?us-ascii?Q?DT/Qq5ZX/eI+l47NueHbZq4sz1qwNoMBm94SfY2Ub3suIduv7dpdbn2BOxVr?=
 =?us-ascii?Q?xLuzJNn5I9oqrzIEyWY6MKKha0KFdmSQesh6Xi5A2l6xspwrLtOSns6bsyWM?=
 =?us-ascii?Q?2H31mLKgx6aKbyaAQuwO3KHQQn7+N0XTpOIgQqnvC5pmG4NwgeRSnvbD1/Wo?=
 =?us-ascii?Q?82stsW70d5sMJCJA1wP+k0uz/iM/tk5Pt9lM5i6YaKVu2QN+lUZReXVUJ8oR?=
 =?us-ascii?Q?AnR4OL2kbTx3IoNQ6H79te/9+4z0yibzTZ02zn4zKGhS4gwHy5UIRrEir/UI?=
 =?us-ascii?Q?P2LPglphU/fae60u5Wgz5Q/CHqFZZfYzt0p/Ac/BzoRnHtsaJ+eSVxJKLZiQ?=
 =?us-ascii?Q?FEu8jPKix+Ul1KH0LUEnEUWJP2czCTm8D5hKP/XRFPh8G6r28xzmb02ENzJQ?=
 =?us-ascii?Q?ELyWLjXx065t2E2vqfIMgbapw7/XRZFReCUCLPV9xFLgurMLWWyqJPyJdM9U?=
 =?us-ascii?Q?bYKbdrg4o4fy83m0LLf9K1o1nqT47O4/HqTPMUKjtHnohB0+zPGdjj38STxK?=
 =?us-ascii?Q?DHbgl83f3DNCOlt5Q2VK1LO+Ot1RGiXzI9cpPmEjn0HvLdcQ4k1A8IES8S82?=
 =?us-ascii?Q?eOFONj0gIahpf4o0ZeFcMFhqt0dvt20S+HLbpKmSGaD93sf8+9S7GAimRmH4?=
 =?us-ascii?Q?61+q7rxpPMq6PJ2YWucy5QIZq9oIku2KESRkCeTSbigE6WcxV5dMv/rYSD7+?=
 =?us-ascii?Q?w76x5PSRTRKDL+mb+OwLECHx4bIYfNJQhBFbRxb8C3oYXKkwnNDFyaGLCUgu?=
 =?us-ascii?Q?gYv//Xa7zBnrewEcL9X3aTiPp1HGL3vpCM45esKUEV/sIzxXPxX+k8mLXU9s?=
 =?us-ascii?Q?WBR5XRxMdPA0C1nxYyjphKJKFyWEVCjNdPBJvGHTptX3MfDwN2vlG7rOatOA?=
 =?us-ascii?Q?TAKdq5UDC89VaDvuOLs96jobWT5UzyZP9r6pQ2cfVISKgkVgD4S3D+IqbQgB?=
 =?us-ascii?Q?8JmZ3Sqofdw+P2H7EthllFRf2nEGuc7nMbUvYea2NX+mw1rCuWc/Ea1Tl8nX?=
 =?us-ascii?Q?9Or15uUWyioyzSIuHYV4MI/DO2ru8K+sQF0fTqr4InMcbo51UK7NCOF6cq2o?=
 =?us-ascii?Q?U/eI4QYoFuLWqjkA0pOjDqsaJlRX7RUNhE4KeSr//upI1Yp1g7GKWLxu0wep?=
 =?us-ascii?Q?JyR2jLdvXWjPBo11CG2XFT1kz9V0eDJjiVjwvbtb/clOv3+opfaDnSLkUwfi?=
 =?us-ascii?Q?pt66DxzkP2TFxpPHnlN3RZTkd93aNt0hDuSJYQPlamxqxLI2ki3vFj6LJxP8?=
 =?us-ascii?Q?fZgl86mJe5Zx/vaqhZ+WIlqDoCwedRG6PCHXxlXsY8MLCA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f4ETCx5mU/1AOOo4tDIf+j6jcqQBy27QPysuZVNEyQ7kCPgf1zTpg6AXZM3w?=
 =?us-ascii?Q?o5Om4AcBi9MYNdbX9RLrXZOSK7IZ3fYmiEhVZBSWe9pnszEd5dx8LQ4YgfdY?=
 =?us-ascii?Q?B2l2XmE1FawtnsKKv0fJfehX2ud1ifRy1S8g5qUKTb+CbPbpN9qi97laMfwp?=
 =?us-ascii?Q?zvffqo8a99yoXqnAse5HZexO4nkQaWf7Tt+eXIi1Ufq7hZgZQRLLmwXw9KiV?=
 =?us-ascii?Q?X6etgAoAeopu0NPGAkBcXTwVnS9Pp5E9SsgQJegUyMBatnqtm+MVK32yRSDw?=
 =?us-ascii?Q?ZJzwzOzy93+JqxiVPZA5xalLjYclTzyU7+gAlvUSoM1H/D5J0XSXuFFffDNa?=
 =?us-ascii?Q?MMonO3+Nx/qNuYSOHat66FAa5gJpAJO6RsXc+6Qru6VMap/ZAsozyRDuYynv?=
 =?us-ascii?Q?f0vcxX/dOAGO9XZL4wdcCRhQtUDlYBw2BUBPwDRqoXe2KGPAxCOMEVmBRmyd?=
 =?us-ascii?Q?u4OKrFna5RUwHYKsmJPIFsg9eBa/hURxnGc+1rfPTle9kddoZRm2HgGVotyT?=
 =?us-ascii?Q?/ydzFN6Sgq7AoUEXKViwD7/fD5ElEZGlUc1HxKO4B/xbkgIjdqDeuOvD96S5?=
 =?us-ascii?Q?fMrCeuXmg5JknvwgMMdALhwZlAl7AR58WgxOTzyxNlaLaNK+It9tAm//NnVG?=
 =?us-ascii?Q?dWAJtQHIl1nCwkdi+pA687ny56vPfdkgRpXEXerlPsq23x2yFCEDVu1E5EOS?=
 =?us-ascii?Q?/YJg+9psbuV1pD/YI4EmZfsyXR1o3yw89pxSzdi5cKOuzCpzquPoVmSBxKT0?=
 =?us-ascii?Q?6iWqgiAKB27MkWN10sw9nP6nL/oWJ6qczpPlHQAeSuVXZlxJNOam5LQMQ1uT?=
 =?us-ascii?Q?/kkKU+ke9R/2k5Mv4Q9urrfURkWnD1M7EOVz27DNO0UZcdr7dRVu++HAJaKT?=
 =?us-ascii?Q?UAqXESHCqbyM0e6Ig4xizqIkaP1VNUpPLIIfJQ1kDiXwvlTfmj0wfAAOBRr1?=
 =?us-ascii?Q?81WTuR6/v1AEzhWItg235IK5wmReH1h43Mxi4TEWmxZfAC87fIeYfxW/dsBS?=
 =?us-ascii?Q?FQdMuR9iwIlVikqiJ077I50h4aqBkN0rOW2P3uGWjy+Ilbkr2JYwi23EYxmb?=
 =?us-ascii?Q?Q1L6hi1CvRBALISa42Vm87dT9j9s8DOvswEVSjR4XLrrUxb+nOTtLzdOFGjQ?=
 =?us-ascii?Q?wNzYo5yVyLcLEhxTWUUqrrEoZAe653zuCfPlFHqScaE27ecj3jguQvYdNRxy?=
 =?us-ascii?Q?niCCkV/OX0GFVgPzAgkidVlO/tvmR725wykFtXbwPYiErl3vQSgq8SW46UeQ?=
 =?us-ascii?Q?bT7rY93pvgPhG4bD9axzqzTNvIMk7LQhpNHUuScpkh/1jsXKJ1t5UJ3daaAJ?=
 =?us-ascii?Q?HgjrASO9djlrm7v8k1SuBP0El7FxgVjxNRJ5m76sgT2VDvnJn5Sow2vkCks6?=
 =?us-ascii?Q?lPL/y0oKNuSiOhrujpuMUdrk1hu6k2RpVG5ccsf2QbZWW/G64TMpcYMqIcXA?=
 =?us-ascii?Q?RQ10REW6lEY5I0hSuRb3S7EQ7diAWc+o9gSpZ2Xadvz9ovaP8CicayS0uTL7?=
 =?us-ascii?Q?kYJGgs7m3UojILSC2syiCOAxiwnaO+656u5aCkLUThAcgxtdgR31RjUS7PLm?=
 =?us-ascii?Q?aQDdbWG8O783ZXgSD72ar5Tllu92w2xMbjNrhAvlaz4fcqrQSTC9fepTdrLQ?=
 =?us-ascii?Q?CHTaxmXmMs4XD+OOyEpncF8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbab7c1-77a2-407e-7c26-08dcecb42884
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:09.9066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVudaRAb1XEgqMjhmAcZQ3SPl3jnM7xTORLW+4bXMJxlDnd1Mo7p3heYzcUZ6b2aiLZ3Z+1tfk5vGN8uOPCjawkiGK+tDqKXbE5pRs1jyKPZ9BsmEYJgek9LZbZMV4Zh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6130

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index b12b3d865ae30..c0c906a78ebae 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -55,10 +55,9 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].no_pcm = 1;
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
-		if (drv[i].playback.channels_min)
-			links[i].dpcm_playback = 1;
-		if (drv[i].capture.channels_min)
-			links[i].dpcm_capture = 1;
+
+		links[i].playback_only =  drv[i].playback.channels_min && !drv[i].capture.channels_min;
+		links[i].capture_only  = !drv[i].playback.channels_min &&  drv[i].capture.channels_min;
 
 		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
 	}
-- 
2.43.0

