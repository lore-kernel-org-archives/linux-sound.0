Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D4D1C462D
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327098; cv=fail; b=WFlBMI7vrysoeBQ0HkurQcP09biwp2Kqg0QSOoi+9DBQCk+znsMrtfbHhkz6vQIYRKFUCWGruF83/oszecGCq9XNpYcgjwsz4R3Np29PLR1gkgrS1sw+XXKZfBRVPqDmnlffwayyVAHgEGkxdDHG2idHEEIcjVKuLqVDrHrY5hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327098; c=relaxed/simple;
	bh=Drx0c8+OVZwBpB/BqAaL4jcwrRA9LMcf9e2BpNrItS4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dpKfA66YB3Usso9HJAVrv4DdkyUCPzfUvAAlbVhJM2IFWxhde3/HE2WgSh8+Jm2VeJhfYMWoi5Zi762qG9jrfs+zgHJCpq1c57nAJJvqD7E1oHXYSqstODeziGw0hbttfRd0tCuTTpO2nSBRs7NJEqrQmpi1XzrUHrIfjV0QNTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IAjDUCKJ; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IAjDUCKJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXYkJck7O5yVZjGle7pS9mLKoTsI5ITBDrslYK4Zl3IZ51b0NwwSB8qEKfrKhfdvbC0fOWLmoa0g0ERY8olAiuLUQxLkNk1ayuhSwYYU3TcmoHCq1Xd5zgELuvHxEDDIs6iZim31hqPjl/vwgcNaxuTmOUcw2UNmIhkPI0XGptfPrQkoo1FOpFELvrak3mEyuz6Yq9cbv6dpjWk8qtBDBZHJDLfQvyiFYsnRjEVWYuPnEF+2yOO8zOy/7DPqBDc4jm+TXoV5kRx8e7wK4Got9Ju7vDmclszbpKeooy2pNAqVI3pAx6DHzqGtreBjVAjBX1Rypf4L4i9VAKgUKpZfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=984SSBlUcZ3GZ3ifLfSkCM8CJtOQP6hfyLjurOtBg9c=;
 b=cYyl5+/1v37QxIjVvRJjlfJ3I9lfdG0p9Fxh1Dks68aSxwSu7BdgnQh0KLICAj/sYEeV4AxgRvcY1dVCcA6ZQSzuAklhFStZHIgYDB1Xd5NtZyQPLCpt12WIO+Trg1wXfr2c/ppquqRjgFJ/2JV8t44o8ydOW28Qs45NyrkG3+qt4NA35tcM/8HLu6ICcsyOAnHFJOr18J6pbPzMGULdgHw2TvEEJ0oGFcBC75LgmV2YW/krzQMiEUVzmzbNoERb0ZBkeRsEuBnWMTj4yFRRZ/1IbuO6l7t4RcZtH9iCTX1TRykqDLYztTWkPQ84udH1x7NbkLt0BjaeVTwFoKiagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=984SSBlUcZ3GZ3ifLfSkCM8CJtOQP6hfyLjurOtBg9c=;
 b=IAjDUCKJWMV+OaqxlVnODYWCWg2cesnwTBE5ScGSxYpxUYOxylEFgBTPh2LVCemkVbHugDOFBp4YGC8BJf0g1iX2+qzvRiHeoMut4Iqks8OdbibAQ4/6vXrpri+5rvubak+ZhqHM1cBMxEmDvO6ZrdwuWf5fJPLeIPq3yfRTdWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB13706.jpnprd01.prod.outlook.com
 (2603:1096:405:1ed::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:24:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:24:54 +0000
Message-ID: <87mseryk5l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/12] ASoC: soc-pcm: remove duplicate param from __soc_pcm_hw_params()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:24:54 +0000
X-ClientProxiedBy: TYCP301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB13706:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a577e05-870c-4691-94b0-08dd4b0c7010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nh9jYRqrQSxwq2EEGSJyU7xBuCP2c8Q/zWCU7oJXQm4HSVPz0TG+PPLABTO/?=
 =?us-ascii?Q?qlhBNgH2GKrM1JdL0dvwdJ1z7leiXaYA8gHXrr/o8JqqWBj9rxw+uvPlTeU3?=
 =?us-ascii?Q?ls6A4lJ3+zdidkJou4+xJAPj1QlU0Mvx+3GInnZmCM3k3fVtFBsaNRpDnFGs?=
 =?us-ascii?Q?ylXReqx62xpev9zLP9tTOAnXwnQQA17Wizll+fbbGeSJsNmZcqOwsJJ6AFou?=
 =?us-ascii?Q?B6cmjMw36pX8B1DVFwk0zcKBP3GgcBUrIpTWlVUoF27NacmHxlMSYp+nVCO+?=
 =?us-ascii?Q?t4A9G0ID8PhjexZFVkMLaI7+L4T5XCfZOyy2zVEjZycofxufUNY3VVy2kLM0?=
 =?us-ascii?Q?ftXAZoQsxB+ad97hald8fdnWDysg4qQ2aJEW9zT+U9rxRACDm41DL+v7RQSY?=
 =?us-ascii?Q?3GqG1JQ9Q/ZA3elStZ2I1scpPFJTSWSFVNkOYugQM6MEwtc4o23yYbj0u3RB?=
 =?us-ascii?Q?3ZjCwbJzxmRdXo2/pf8GEpYluJLhHLrX2dl/HzYUWjm+CAnVqjY1NawAfYVD?=
 =?us-ascii?Q?0ueGSBKKKQ8ilG7LSgewhj9Dybnj89GGOLt7u17ur3GM9lO6mOhJwvJ0pBFM?=
 =?us-ascii?Q?PDABPO1/vTGh4kvCiRLariDQ8PmfQ45MfeumAdZlepFizEK0Nm+DyAYAOY/8?=
 =?us-ascii?Q?wmMNOpx9n5PvC2vboHwldRasIXyTyruGNXgzAdXfdL+lzmS8lhzvsKqHHqut?=
 =?us-ascii?Q?wuTjiow3xqKYz9/bqMsMVAyngE+I4eWSQycMFob7N2KENCfIWIdx+7jg59uk?=
 =?us-ascii?Q?qbo4DjAMr3DLVHtqODW7YyrSIvbx/FgW04we1tSq6sS0iiX/pp0QLKFtM2aL?=
 =?us-ascii?Q?7w6Va+RqeLMUKmXS81RntkJ52LFA5cPGF6iDlHaSDiNYPPuAKIzmMgpcbyCL?=
 =?us-ascii?Q?U3A37kpjc9N1oQjowr3fRlKrTY3rFmHN+HVShG/ZhQ97X5O858dNdLD/2nWq?=
 =?us-ascii?Q?SEAxc1bAFH6puDuu4Im8QyQoVGMgzqExcs0mLEOadx7QlEtrRM1KMg0830Gy?=
 =?us-ascii?Q?O03gRLRgUKybWnFAI/kBsglJ+Cdi8yCTOH9guREug8ecQt63NhgiCl2pl3Q9?=
 =?us-ascii?Q?XeEG1qzqbSAOXktzlZqsITKiBP4dfYdrH7/yvUtjyrD7PTNTy0XyFvyVVAev?=
 =?us-ascii?Q?XNiavEPYNe7dc3a6IFJoG84jhVpOesQmo+t3sgxz9QsdqZKj/X5aKaEEJwoW?=
 =?us-ascii?Q?BbUYp0raKPyzW9fOr7K02hJowC9XlV4d06RQ2sBXS30QzmCJMEdx8iFdGLlM?=
 =?us-ascii?Q?Pkuwhuv5Skq/UhUlj34ztrP5ZccNsjAfIhS187obuQaeKB7XbU2azawCWPpQ?=
 =?us-ascii?Q?ZgwTB6avUx3SzsbXTpYRa0+OCbwCNiehkuvfeR5DI7BqQ11ytmisXiWPC287?=
 =?us-ascii?Q?d3AQ1924Ca/kWH5JDpdxvpg0tvSEV1Wnqf6HLCQESqUfIXhauBRrfjLdgaT0?=
 =?us-ascii?Q?bLpLxLpVLBEpSuasXaWjkEeLeLEX4fC9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lGNL90A03DnjMGQ8oEzBrd6ngNR8IAUyHaNnSuD+IU3itX6XlDnOXobM56sz?=
 =?us-ascii?Q?tcu680YDkdYXwTSXLaw2MqaGwSP95cosCYtSvJgavZpVb2zo7Xy4qljZD3A4?=
 =?us-ascii?Q?j2dxTr818T3Z/KxR9WYsTbyp5S43Xff9fIYX27O0W6BOoou/POUGsOKERm/o?=
 =?us-ascii?Q?P71xRzY2j4pjxuuOQwogcS1AZkrPHFriFHDaDlpsIWQwdB0yu+ArOOdLmhch?=
 =?us-ascii?Q?ZGUY3nkd3JmsfRF/KXEBV9xpOnRHrJITOLFtHw5lWe/Oy1gP0HpQfMucP89b?=
 =?us-ascii?Q?71PtHQDpKE8/0Bal/EZmKTTjTlsrZ+RwzmE1vQAfGlFRgV2qxdN+W9Wt6jaN?=
 =?us-ascii?Q?XO402KWS+DXEsOXGXTikWrLGzr8uAJhX5r22vtVdCJKDwkQogo/nGJL4+/IG?=
 =?us-ascii?Q?yjDbQ2gAEQ7/CDLwh3c+ru5L523ORUXCPSmm4CKbHHVy6Nfaws8+hxt9omL+?=
 =?us-ascii?Q?sFDmgwT0g8npHgsCgrpMzLOJWYwMe5PC+cnBYS4bJrmZclaKWvHb0qRqatGN?=
 =?us-ascii?Q?JOSBwYNMoX2ZP6V5QTvgLxpqLue8Ta4d1jZH1Jby1nbzCikLXeqUsgoiEs42?=
 =?us-ascii?Q?5mTYEIKejbJbktqIGKst4gFyi4T65YVEGuZ2JjeNXna+gsO1VGK2xa93VV1S?=
 =?us-ascii?Q?ysRNLFZwRbn0+moJnnrKVbAPAF9v1sDsdwN1Rx+wmDJtovf5PJ2dInUvhPUb?=
 =?us-ascii?Q?yuPIJsPJO1DuyTeFKewep3mgB4D8whR/YSqa6fGTdukTzy9dEf3uHZFBrbmN?=
 =?us-ascii?Q?JaNlhooNbkglLlG9oaadaAy+6Mi0MKGmKE+OrAxPXskGIF1Rtn9R572dg7uW?=
 =?us-ascii?Q?x3T3WZp9LhbYmhtk7QMeH5+kw0vKfdVbrJfQKYD9hQ5yjhA15KJ5exjzH5qL?=
 =?us-ascii?Q?c1zIbMjfLmf85eAR+vJi0yokcrBLzL6lHXkVrBfT41/XHCCLoKIRtyYmRLYQ?=
 =?us-ascii?Q?Oil/WqadZWJsICB5yulpPTBbKN83eI4CM+AE/9Zi3MFNXuHC539C1k6EzVmk?=
 =?us-ascii?Q?kzGpX8JLWpxTikI6AdQ+aUdfEDmVfBR6KdIzekpFrJAlQefyOMMgP0bGHMvL?=
 =?us-ascii?Q?79hrC9hFWI17eoalpFjyzX23A6JOk2JVGJXNFS6lWC0mHjtxoNVk07G380t2?=
 =?us-ascii?Q?uPBLAMXx+dMczJThMS7NkQDNPZKAOKQH2AWNUUv6ny+JjYJ29QIZ+HZNB2z0?=
 =?us-ascii?Q?ontcLF274+VTAtzW5rr0QdUZ3efkN6omAbYcKh9njlXwR2OJ1SN1tJVo+VGW?=
 =?us-ascii?Q?2iEQeMLrbrbr99SrNPE2DNiALbVZuaABHCHAeuwSWMmdU/C4c6oLhNMtJhie?=
 =?us-ascii?Q?GtKh5ZuNdhbis4uc+oj3zw3JsamC/iY3ArTfgK9kgAXls7TMpZnYNXpKFLUw?=
 =?us-ascii?Q?8tl9gZhwV8IgyWliNZ7ds+WxomG/Z5GmLplR2EMRBIn4op/qagW4tCB7IPnQ?=
 =?us-ascii?Q?l3lxRj66j8PKm/U3v3nVa0mrIQS6pQAFn9vCloEXRqlCyTdUZuFlxfof5vkv?=
 =?us-ascii?Q?YmFLMbEs28paUeT993or2sjGJge+ObQFkN1lg5sLu8cPxD+Y1pcqI6aeT48i?=
 =?us-ascii?Q?EFc2Qec1ZI36AxeBkVqxh/2Jt8lPWYu2Vi5pp981EfUHR+ZLZJOdg8YTmFkR?=
 =?us-ascii?Q?jp5X76prt6nFyo09PoZZ+50=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a577e05-870c-4691-94b0-08dd4b0c7010
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:24:54.9383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9mT/aUhMOZVXCV8YfXuQtHlyHEQGLqz1oL1YwntjWW9OjJLKzH7nF3S5nfcKE5vxUSjZOgxaSAOBMaCEPt3BhaTwUKbsSv8qWp93ojYYfQuiA8dPnwHOfdnpe9hmbyx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13706

We can get struct snd_soc_pcm_runtime from struct snd_pcm_substream,
no need to have both as function parameter. Let's shrink it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a206a25451f7c..062e2cc467cdd 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1062,10 +1062,10 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
  * function can also be called multiple times and can allocate buffers
  * (using snd_pcm_lib_* ). It's non-atomic.
  */
-static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
-			       struct snd_pcm_substream *substream,
+static int __soc_pcm_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	struct snd_pcm_hw_params tmp_params;
@@ -1171,7 +1171,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(rtd);
-	ret = __soc_pcm_hw_params(rtd, substream, params);
+	ret = __soc_pcm_hw_params(substream, params);
 	snd_soc_dpcm_mutex_unlock(rtd);
 	return ret;
 }
@@ -2123,7 +2123,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 		dev_dbg(be->dev, "ASoC: hw_params BE %s\n",
 			be->dai_link->name);
 
-		ret = __soc_pcm_hw_params(be, be_substream, &hw_params);
+		ret = __soc_pcm_hw_params(be_substream, &hw_params);
 		if (ret < 0)
 			goto unwind;
 
@@ -2179,7 +2179,7 @@ static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
 			params_channels(params), params_format(params));
 
 	/* call hw_params on the frontend */
-	ret = __soc_pcm_hw_params(fe, substream, params);
+	ret = __soc_pcm_hw_params(substream, params);
 	if (ret < 0)
 		dpcm_be_dai_hw_free(fe, stream);
 	else
-- 
2.43.0

