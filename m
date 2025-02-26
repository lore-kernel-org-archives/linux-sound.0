Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695BA29D0E
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533389; cv=fail; b=JsW2tJrY05OqKYNSy69VBRjKRT3WJLRmy37cFfCzZ73Fs9XJKExTqg7XhFsFb1x20+iMgH/4h0GDEoS/ZsAfECP+YY3G6FmUCQfE4dLcwmywNfgVUhfit0FXwvLdxdMbR9rXFeikHD7fyyghBRzhOp3J1OBIOLboiTlYadTaRec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533389; c=relaxed/simple;
	bh=Vmpb5dUwi8bLk2hOGe8lYEyXRWEp53a5GrtMd/Zh4Qo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R/SpRXiqKbOodEov9UUiETdkMFnDbMUK3kqjLYA58DmCoG9FUjWgsXXTLSElBcueimoiOL5OerTL7BRZpbIPN65xOnQZzjM6HoFscV4gtuIrKp3bkHbsi33N/xhX1NCsRZB8GhpUz3cLA7EnvYs7TjCXywOHAAZ6YL03ApT+3Yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=os9s9+v3; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="os9s9+v3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knlDmEsnvis8P4XxIZZxjjfMkDrzNQEHExzgvUE99iQ6aqUIrn1M5xeeB12hwL4S8QW0wj89HxOjSPD7By7RH/V7frRhilDS2cBQ0qnD67Fm7av+OFHfNppvhRunlIp58FzvHxAv8H6s+mEmuyB6LDkOSgjDNDGgcKvUD/zujjdW2BrnCQ3l/YX5mm61P+5tv2yHiOQake5HywIjjn0HuymgMx/ThR5V1k7r6plaQ9m+vp5OaXCfxuzW+3qy2FqSyIF3unK6LCJS9EvrxJuhzvXmDrhWtsxLoy1FbEr3C1mzTNHtHeFvi/1GxEXSKCAWT3n1SKCwstqxck9Ix/QpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEwsSpUOnHt6MALinFhhjDC4d8677ndXMP1kjblLVjI=;
 b=Kw8GsBJvfyaPAHoCtJ0CB1Zigljiw7iMEBuNH8clzO30zjLZQlVDPIAzaBDBeH7RKivPtYhoe8I+yEEe3NgFkpOTn7suwWMw5ysd5yaZOyjP9tlGRSV5qdWR9Mi68A1bg7KhZZynbHcLbd1i3oREkDeYKI0m222ANmPMJLbn2DhZhRA/67iUCur85YOkto8cxjRKAgRw9unR/hJSK7GTKr2OzqB0mauje0PJyPh4DHzs0LbYn73QquKDlvB1Nn+C2pZ3Bw0wh3p6xd77X5LOYUAfSIEcQkwnr5qCRDlhl8gxZQ847oHjgbGLaSz5674+RBEzljYanhWLu6zczk01Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEwsSpUOnHt6MALinFhhjDC4d8677ndXMP1kjblLVjI=;
 b=os9s9+v3DEqTEOAYalf8rQgyOo3kgSxUc8DZ+zAssap0RLsM2JU3+o6+LxIMgW8hjta3y5LJ81WeQREeZ2Q8Std48UVDTgm1N/yd1NO7am4wMh44GugenIdhBcDrdP2GjpQeYuh5hgSHbOHQPaWYNVPqH14zLLbqn3fBud0QTlM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10735.jpnprd01.prod.outlook.com
 (2603:1096:400:298::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:29:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:29:45 +0000
Message-ID: <87eczlh4s7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 001/157] ASoC: Documentation: Codec to Codec: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:29:45 +0000
X-ClientProxiedBy: TYCPR01CA0086.jpnprd01.prod.outlook.com
 (2603:1096:405:3::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10735:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2b65aa-39b9-4bfc-31c3-08dd56050d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eiLL4tujXoSfB6NgakyaB7fsAIjRvTW40XY1xie+jslyZWE+H9to1CkXs/Ul?=
 =?us-ascii?Q?F8fSTbRoF7v8TW2gb46Ev8FoEyntDQJviYgJv6cXLg6nO8zphm1JJygE7qRa?=
 =?us-ascii?Q?xxPhNjnj6dfnaJlmf+48eO1PEqJsM9LJkG1+PxTGUz/orgaMJ2XB+vlhLvUA?=
 =?us-ascii?Q?rEEhg07GYxH2Y9V5C8rWac+AmYr/GTOL/3Md2q+gGAqwYLyfdWy/cMkvVWgG?=
 =?us-ascii?Q?/RCNgtOwX+IXlhrR7FMBGUe2CZGMqIsw/Z/62jcAKqq2P0GuTMNjBGTkwbYX?=
 =?us-ascii?Q?ID0M0POVCX8PpZ9+XGB7NAS9ASbnF6RDl+Bd3doSFWileouFdVpYma4IYC2w?=
 =?us-ascii?Q?3YPz1cibyqD7rrcu3dm301qzY3CgKDWCcafC9RbiPKsnDVCA6vAAbLJoAmwo?=
 =?us-ascii?Q?89ihp6Hq7dIoOLqGby2mS8dzvRmkmaK76EvbMKP7hjYELpSPgl6YNhJZYqbM?=
 =?us-ascii?Q?qA7/Wof9UQjdW7jKlBhI/Gpw94t1larUiI4DZszrpJ+Dl5YylFzeiGhkEEXE?=
 =?us-ascii?Q?F/3g6pFtrXZH0BqezsfUoxJZr2PiJPMR9YnwMs/2XuEEnsFkTgQoWKs7ryzP?=
 =?us-ascii?Q?/r5UXYAQMM1G0/EmKyaqcautCFZHd03xNzuA/G4ph7T+eXCKIwn9Z13r1mT6?=
 =?us-ascii?Q?qfNmQdLR0DP1vw3aDEoo1qbHBlMCZs4A2oliAMm/f/CAXLEMQhWhbEU3RHry?=
 =?us-ascii?Q?IR34FX10UN587zXL8PrgeOFRCX4AJ/27Wt5zHC5aSqzp9V+AXZjwJk4OM3X4?=
 =?us-ascii?Q?SMSOW4LwQb6z8kDIXdEMzY1awe6yPDr8xTrTK9gCjk4u9abDWA95+IPA90Nv?=
 =?us-ascii?Q?kUYxecuIowHM4RsIWxOZmQjwULe3iHvApv5RkuaaGRr1xYkrwmAdrZfvdvYU?=
 =?us-ascii?Q?s8iYs2i0h32WEffviW4mqq205hoG97TrphyjE4bSKDKFfN2NFTtbOIcpAnCR?=
 =?us-ascii?Q?V2LY6TKy/8nVyznYbnEVD/G4JCOQAON+Pt+4gRuncC4qjrqWg+Jog1XoYBN/?=
 =?us-ascii?Q?g7nLFlHotZrwWSZbxeU1OpMj33453BpqFmSh2gWyek/FJFqV8eUaxwmrVYwB?=
 =?us-ascii?Q?w+6hvYw9BB3foZ3yZY3KnngwFaAgMKEL1illC5C2YPPbb34g4CNsuO2SyroB?=
 =?us-ascii?Q?r8u172XrdNgoqQInh/Oyxhn4ra/8DMcnyNT5phBqiZ1i23kPlv7bs+B/7PSR?=
 =?us-ascii?Q?KSIeCXDJDVTtTGErmEiPSyGYQegg9qZX6SAUG3gzZafB2sqZTOvJtlItNw92?=
 =?us-ascii?Q?hpHbY9rf1QQIr8ZumWFJHyUt4PSQLBTiAIZi0rnqxrx79PB6URusCIphRJrA?=
 =?us-ascii?Q?WEDdjoKxLuPlkQls3Hx7Tc2nTz992oOlnEljwxcDMSRrJ1iHLtvKI1jy2ChC?=
 =?us-ascii?Q?I+daEJiTn57rzV+UFPKa/f3cEjO5bBUlQ89gUhmtJEcYM9ZOrZZy4q//Sdyr?=
 =?us-ascii?Q?mSxdbjRhAjpvliMstKGN4XIhfOCHMpRF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l1b3iu3kvcT4533MarWNOMbD/EtH2vr7T8pPiA+epBri/0gY0ZbleNFJ6yqs?=
 =?us-ascii?Q?4E7T/m/En/J20YXgvT3LH1Q86pb+K6JkPSpzYDy4R0cAP9rZJPySjZyMRU+9?=
 =?us-ascii?Q?GiOAqCP3Q0UHO/aNhRPUQFUwI5+85EgSTS9uRIpBp3fHvib4oMnrvQJkxTYW?=
 =?us-ascii?Q?LxFlTzzeFREIsNJJRqnsd4p/y29vYP6mv2FxhVMqDPg6IeylUzM6yAwwupxP?=
 =?us-ascii?Q?1DogCI4vLJFSrMSFXyYOh5l9qhtTOLLgAbM4WYZNPtYvqZ2LnkFCQUREd5BS?=
 =?us-ascii?Q?VSRP7oeYebxuHX5h09A3H8Hdd70etMzPomqEM+r+L7eHagZ7qdYWXvnFXKRF?=
 =?us-ascii?Q?u7CKZ2rnVVOtVGuxtWQPAm9Fc17clXIPVyvGFPRMnDoGEwSom9nOhfvU2udH?=
 =?us-ascii?Q?WGinoQOzfVUhmzquzpim8GI3ISLh2UPR7FAMw2cO4YYkt8AyHgAoajwigPak?=
 =?us-ascii?Q?3kCL060sGMdoZ6GPCbRWANi/wtCipFVIMLSZjBZnoe3XaRvEnwR5bx8SYlZc?=
 =?us-ascii?Q?bwXZTKNxrcPk6rP+RdELd0sbcMzO6nZayAsQccmKY0gSknixjRLMw2/SaiXs?=
 =?us-ascii?Q?cWf8nMaaOtHOV5piEJ8la9VcO7qkP+aLJR2XUgJfXTQaGvACyYfKCz8BhrNc?=
 =?us-ascii?Q?ryAahUWMHKSZ+q6Sk0RWdlVXhWf4dGyETWoqyOqLSfw06ZGUeTGKP9vB50Nd?=
 =?us-ascii?Q?hK9b78Hhio45ctqAdqmlKVUwpLOyrFAdmSQx50KDi1KvpMDdmbyeOxbcCVdk?=
 =?us-ascii?Q?bSW/dcrPYBGyoh+kl13kcN7qq94ckP69AVuXzP3sN06fzCz8PCMSwCPLe/Ee?=
 =?us-ascii?Q?msgePqtxzt1Wo3mZ90TzZW7r93eQxUeKlAX4x+1a+BnoE9Ub9evcNdLPxrRj?=
 =?us-ascii?Q?Fvzy1uS2WE6LvNsrBM5waZf+pZEBc4xoojejoxZJsptKcbVgKa3eWSvyTiaS?=
 =?us-ascii?Q?oBNRqyQNzhlhYEuuXLkVtmf8YmA5t/AA0QoGSCvvg+UuvYJaxet0yOiYyNXY?=
 =?us-ascii?Q?aRGH9nk7v6JFHwBhjGkcjEIegN5dH1gQk4AUGIvuwEQ/zQbqponUJqJVIZji?=
 =?us-ascii?Q?zgcztTDmVfuWBH93NdYNHMd7vNUM0ZapHj4PhlfptCN0hwG4xo8MoY9TpTUC?=
 =?us-ascii?Q?WYCMPENU+v8WcPip19xO5DcFl8sMJPeqoCzWay+VMXeUVfyOJ/nJgR3AsCUo?=
 =?us-ascii?Q?wI3dMLoplE1zTwX6O+KwET/zbwnSaT5JQW+bjEO7W3fLCKswWFI7rTWkpAPa?=
 =?us-ascii?Q?klbUvsCyu5U3YwHgWzkgUJx40bUwxVzwfJD2/t0e93D8foXul52/r3+ZFpco?=
 =?us-ascii?Q?SeCBXlvxdyrkP7gapn9mkNbGDQ8ewwztlt5bP5GiO5Th/Mm5zeW576LaxfEw?=
 =?us-ascii?Q?3Ujkqp0MlMaupgDLI7sAJMfrYLJE6BS5SOUAAHETQT2BNFnzvTj8x/B04g9g?=
 =?us-ascii?Q?fnrPLLMOFEGzy3yxEQc6pPGK8IXtFLOLHWvb+u5AR/1wJKINQm5a/PLhGU5I?=
 =?us-ascii?Q?fa+kFc2n5mJNXs24vdfdPdiJ5OMsW//LrPEe+JtveuamIC2vmEuCjEYbDGsL?=
 =?us-ascii?Q?vZHEa0GKqip2RR8ro+WIM4CoAKJ32Vd8HvMbS/xMajB0t1aE9hWNKvDSggxl?=
 =?us-ascii?Q?uwdcae+RWtZmKQgD5Vn/Bc4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2b65aa-39b9-4bfc-31c3-08dd56050d34
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:29:45.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHR1E4yKNVNI6sJzHBkYBRVgVJ2e0RXbMSYVPBv1dmmnCcotAaG5g8dS2XI8mwn1tLOOp9BLJCTAx2Hl0R+DoZ1S5wPnpCxP1BxyqIZgHJ+ydIx5uVYvTKT/mhxA/RZv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10735

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/sound/soc/codec-to-codec.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/sound/soc/codec-to-codec.rst b/Documentation/sound/soc/codec-to-codec.rst
index 0418521b6e03..973c147d9d82 100644
--- a/Documentation/sound/soc/codec-to-codec.rst
+++ b/Documentation/sound/soc/codec-to-codec.rst
@@ -68,7 +68,7 @@ file:
     .codec_dai_name = "codec-2-dai_name",
     .platform_name = "samsung-i2s.0",
     .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-            | SND_SOC_DAIFMT_CBM_CFM,
+            | SND_SOC_DAIFMT_CBP_CFP,
     .ignore_suspend = 1,
     .c2c_params = &dsp_codec_params,
     .num_c2c_params = 1,
@@ -80,7 +80,7 @@ file:
     .codec_name = "codec-3,
     .codec_dai_name = "codec-3-dai_name",
     .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-            | SND_SOC_DAIFMT_CBM_CFM,
+            | SND_SOC_DAIFMT_CBP_CFP,
     .ignore_suspend = 1,
     .c2c_params = &dsp_codec_params,
     .num_c2c_params = 1,
-- 
2.43.0

