Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD2C190055
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533636; cv=fail; b=NVPoQh60uLipQoOe1LS1/qcoTr4dokY6OoVlFocEe2jaZnYbIRNcUMAyhr6yA7EprELJSWh02j1brUKk8OK6bx17B1rr7Tg0+S24nGTEPSgLopPu9u9nyyDC9gWxJQ0fvWYrzm93OPfJwbxu3hYJ1fYkMVBJI+LDcpmSrBqUB58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533636; c=relaxed/simple;
	bh=bTlL+yIMFhzollOCkAgAUT535hhgVdbsAprK5/86erM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hVZ0WsTONYtkclqMcZ9KFquYgsQTvJF0sNQyuMFdmqUtaxUfORcX4H0YxTwOSWYZbr3pYfv6oARnTk9HfKenNrEMwA+IphZGB+iFGZeMY2/OYVcJlVLgoEd2i2byJvdpa9cjfxkdyJKMTDUvLVsYj2Kh914yiobxQa2fsnxt6iY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VLh3Tpgi; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VLh3Tpgi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EG87KnxdEceuEnTL1q0A2ezeXbGByTZh3zVP27EdFxvHyq+GeuK6AGSbo2c619bzUW602dvDtKIBG+ym0jkldirphli7GRa61zHjku/GHh5idhSGwPhoWATp7WfUjfQ12eKRT9CeramjQ9cFMy5UCaj/z+Xb79DQpCdd09aO4g2Dw3GIILG5PGN3qjR+oUENZBq7xsBPysJAcAZzTCUyWjcm0IzeHU7E8KxoALS5O6t3TWdLl4m3PitM8jJoNOS2wYBSA528C5FIF7M/UK8x8eWF9KDs3mNnJih/nZHaOH5rY02ftjPSIfyoGY3WSzStj/FgnQjb7PoBGzBtheRHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT7i0XlhZUMMyb2h4L+4Xm8tKRWl9TpzubCiTb1qJsw=;
 b=kLEAnEWDi6P8ZjInc3t7tI8tKY0zbaAUg2sqsdq+wTvBJcXyIdnWrOjF3DA/lSJD47fIbmu0F/+ogmtNi1dZQWnN2+jrOBznfAuUq8yTMXL7Z57yCD8BVOjoYMdw3W/Uucdmx36CJw9cJkdvrU8iLJjTPiP6bm2II7z3tSYLbSWKsD81dPCaQ1sl+Gv3YZGGk9H//kYariSoenPPBFb7KQX8xwdnCgTJ5mCKKDQubfqHoQE2Sobn+vwTeXZUTEdXjmDzh/FuhcgciMzwQhdGJbeQ/qibqx/Svg4mhWDTNxVBi0Dr/r9hJIK9Xx42cyDUOp6yslTcP8gCoNh4Mzyoig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HT7i0XlhZUMMyb2h4L+4Xm8tKRWl9TpzubCiTb1qJsw=;
 b=VLh3Tpgiju4lgfuiFNZex3Bt3yNohLmI8cKHPMjcJ7oQ423NPZcxVJR3pdnwlzlG/VBT0hkVDxDMsjy4zqlfwYVPxRtsaqYt4q0OMrJ3wN40puOX0gpyEBGRaqYmZRV4q/M14ytkX0Cg61yvYMtbyQqmtNlQD8DnJxk6T0nruOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:33:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:52 +0000
Message-ID: <8734g1ebgf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 059/157] ASoC: codec: rt5665: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:52 +0000
X-ClientProxiedBy: TYAPR03CA0013.apcprd03.prod.outlook.com
 (2603:1096:404:14::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a67e27-6bf2-40e9-a6a6-08dd5605a0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yoTXpeLAdKeQ3GtdhVQqYNhYNn215R+SwbSbFwy1KsfMNyiSSIvn5+VH2ZDz?=
 =?us-ascii?Q?fLrvG+IG22AOLk/JBVZLfiJadacASlrLdOcQCPU+vzELVlY8PYQ1+ul/1jXj?=
 =?us-ascii?Q?V2ckxr/EakxxsVycn8/251KgIXE9mQs1nvxeOLnOb/jySFZssC+wanxjlYFc?=
 =?us-ascii?Q?L3feTt/1Sf148TQSZ5JqkH8zedh3+iYO2jowPLcJ9ZvPB5ldGODjirMqxdY5?=
 =?us-ascii?Q?Vw2avBFoclpDZTwpOi73AQZqPHIggk0tBgOMyxrIzAinSC0XR7QPIH97bUyN?=
 =?us-ascii?Q?H1O0Olfnnl7hyHwOnzokUbcvueOOzMxVlVAmxPF3+msBv7ep79PtVn0zW4mr?=
 =?us-ascii?Q?mYmA3ctYJkhggq9EsOo0c1re0qsURZC2Sf1RJfDqFUVqkBIgTpimo0KPV44H?=
 =?us-ascii?Q?y8s6kQtxunOpkE/WnrSWqCP7ZmErbtqChtCfDoLuC0X//uh/Uext34kHt0tP?=
 =?us-ascii?Q?Dzt3yKfL6YRMcut+c7AJK8et8g5Eo6Jb8hg5XdbmQNA6tZtUxXKw+GrSvlTO?=
 =?us-ascii?Q?CWWjhiOLTeBhJ5S4CmDuvaaOTekXjw0pUB2CE2O91rvG2wAw0H4rMRyZOxFz?=
 =?us-ascii?Q?LZqV3FF3NBrtuL5pVLtNVUeVgTB03f7MKWDlsdN8PJ3kXLkVcbJ+IHhtrab1?=
 =?us-ascii?Q?DBVFXedxZR0tB1lj2TvcEyOmFxTav81gBRPNBe13Vr3JWHnAFiLvCa/TpE7x?=
 =?us-ascii?Q?f6k8ALPkUoByqbecadIYTcusWw4N6pkt31p2QfwV/GN7iKk1YbqojL9fgFBZ?=
 =?us-ascii?Q?NAKm0rmOZGTsrnF4jRNC7AY8DVGRZlFTnRsDJrBkSYCwXVslEcQ8Xgkj+VXn?=
 =?us-ascii?Q?YyZb7MKijidGbd6veFStDgrVGZUgxJz6Qw9wbWqju0+m2RapkPWQdC37yyXT?=
 =?us-ascii?Q?JWUfm+E/27NO6+nET4qW9L4N5fuCXHbusfv/ykXvckh8baDfh4gABP9Tu4pq?=
 =?us-ascii?Q?b91tp/CP3yWATeZn/YhmtKPpBRNMUQ5VF7HoLNSBtGCXS1pcfCdlp1PWmlOB?=
 =?us-ascii?Q?1Z16KbCEA7jB0zNhUqribVrUSgJv5x/NvII1k1KSFKjgAKMM3CJ+JS8gp6+m?=
 =?us-ascii?Q?dl2H4upHUyJFPAwTJVjqoktilhywyrM9cq/3n636/8v+nyLsB5XjpSgksAnB?=
 =?us-ascii?Q?9OPzDOJWm2NQyyI4eOMIQzSe+uU728h+MPjbcWdrRMQIt5XLl8Jd+/fNxemC?=
 =?us-ascii?Q?4TSNkXWtQ1Mx5GIS6tOx+hLVw2bsf6AzUx9Mmw5zRklrqfY1MeyuYaLREgot?=
 =?us-ascii?Q?2f2s2D6GPHAq7QHICUBxP3ChR1QOcG7kunJiKJ/b0oqa62tt9OlWatNDZDAr?=
 =?us-ascii?Q?rtPgw8O+x+wnuBc6f0q2or+WN0GacTQ3WzGozFg51QGshOS1llN8jeirSnIo?=
 =?us-ascii?Q?eSrUhCseozLzKmqG+euOxRQyH4StJkp921xGxYrQqVWgJ2JihW+YslFS0Mhf?=
 =?us-ascii?Q?OQgyBrREnMJ1TFI4YXnwvIqKh/xNEfgh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?09JRfWJevt6zo26tDLVWYFYgzC4Pqj978TG4DRnIRvOSfn72toJFitaGAPVT?=
 =?us-ascii?Q?teisFBrtG15eUYWlYdSzi9S0Ci3GHpoQVjW2t3RJd5hl3CvvEffZZ0TP5aBK?=
 =?us-ascii?Q?OpTwA8Rxbt4lyODVv0m9XIWbLj7o4CtEbNmVycZJ2HSoxhnDazZcaXUCgnTd?=
 =?us-ascii?Q?dvOzyAaqwGU+MR08bQhwkCKdHtlCnEE1HhODq9u4eDNJYH+OZkgVebV68mFY?=
 =?us-ascii?Q?yYe7N48CHsGqg20vMFv9oHnjg69Y1WESIcNUF4XHA8X3ooHY5lGNOIzcdUut?=
 =?us-ascii?Q?1risfH70YN6Mq/yfAXKApC4VWRwApLxz82DsRZstJ0LpYMXwoHEshDFr7c4a?=
 =?us-ascii?Q?tmhrBAnObwKsQaWGtvuTfVBooJGhrqNUdQQ5EyhRCT83oYODzjW70CUKHnsQ?=
 =?us-ascii?Q?QRQ5pcoHXPbVmup8RplSOB9espHIYX2xmA7km2i4+SXFJwXpPQupnmsiBugA?=
 =?us-ascii?Q?YRsg6ANMciOcMs6OQGJiM30qY9dR+6Y7G9dxjAkR9LlIXiRAU129K/D3MWx/?=
 =?us-ascii?Q?YXYFZfyIx3tXz6nzDPikruwP8TLTgdXoioCDWG11ksqcY9b1pxNyChOMpXfg?=
 =?us-ascii?Q?O39hXg3GddxOcXN0ZH3Jhob2oRLGQT8zv68wSAs8mbR1g5F2U6gBmbgTabPg?=
 =?us-ascii?Q?o6xFBUgC0CYcfwzbosR7p8VTpWOD4+mIZpc0RdgU9mxgxxfxjko+J5j+xvyh?=
 =?us-ascii?Q?Uc9lL1IEwgzGMpVoEea9J4cHyXp/ZmtIpjMpsN1RQURaZTxNT2eRjb69dNa1?=
 =?us-ascii?Q?hTKH44caq5jXvN7b6q8INSMnFORmwq3cLAnheTKPRKVhFO8Cqv/FEtQ0NLtZ?=
 =?us-ascii?Q?d+rFKFudFWtVWtjw8oM7fM10c1WXxCrvMZErXDin/ZFBlcikGHBpXmBw3gRP?=
 =?us-ascii?Q?HKsYswcugaMJcaxul3nN2WWFyP+Xx12Al3lJfBCw6k6lwVHRJWr8kf7fh1te?=
 =?us-ascii?Q?rh/5nTCz/Ywj7soS5I4qg3eeN1GgNwBPbC0ai7g9vJ8RpCHuXXwhZV06oZ4a?=
 =?us-ascii?Q?GbLb6b1qhtpdIABFBvhEBmOeXcNfBx1VIIE8RMGSFP5PyGvmwZLfyKmqX1qw?=
 =?us-ascii?Q?frJfKaKUay/mZiyjBqk5CgyXFMn95hV14eOd8sEc5AOuzh2TdlUiOZd4ztV0?=
 =?us-ascii?Q?LDzEFEBT1v6JmpdyjoRCoT9uLAlwVgbNlTQV8JEqTDVa7LdJEawrsnIgqOoW?=
 =?us-ascii?Q?On3TF9N5DVV9cPI+AwkWQs4GUAetnPQ/gflZthVUzlRM/SnfR2yVdkeF3ObP?=
 =?us-ascii?Q?JM9pz5FYxlYlRYCXL2V/ryOzfncNFe4yA4O/a9vs4FOHytdrGBICzRaKPDYd?=
 =?us-ascii?Q?eVfwIi1KJB2/cjZ5M6098pGFyQuqUN1F6JR/W7KiemoSqkttREq20QtII0RL?=
 =?us-ascii?Q?snbjvSgok2CcX/IPA91u+7vSk7X8rYhPpQqgrcMuyRMhZEyKCmm5uMXf+oWo?=
 =?us-ascii?Q?8U/xZbKylxSdZm6NRua3EbFJ0zbF1a1znVq7vr2OwxoJK+SkJbmdD8InEe9f?=
 =?us-ascii?Q?zhr58Q4UxhMT18EFSsTCCYM+TTTGPOxDTKwGBexOoMFr8Ly2wuRNcYC9um/1?=
 =?us-ascii?Q?pTUIeh4uIh+W7r55lKVu7jSKvOYYwftiNehmR40KLQP13pi9ixBbW1+Jw+hW?=
 =?us-ascii?Q?Rk8G492WMr+0QYSyGmb9lmw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a67e27-6bf2-40e9-a6a6-08dd5605a0ac
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:52.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSHbyUwNJ8XnQCa3+0ffS5mbhY6vesUU1j3RShH6C08K5sT9VDaP/DbKjsH+TzQUskvDWEdcamH+4RXLHAJNLPvs63/j7CO50+hebVVLtNzsg+nVj33kwanTvlAPF/00
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5665.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 47df14ba5278..7c5a03b0e918 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4219,10 +4219,10 @@ static int rt5665_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5665->master[dai->id] = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT5665_I2S_MS_S;
 		rt5665->master[dai->id] = 0;
 		break;
-- 
2.43.0

