Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C9F192B75
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821136; cv=fail; b=QLAIinJ4B5k6do/eHvyrtnbQM0OT5njeHWSE7RJeekbsgGQrQtVDpjuclzpQyw47Oxur5VtXQcUwf3AcFERa7Q4tEhuNiYrjaGjziDZAubXDaKUPbmtU0zPdcKlzD+Qpjmk3UoVOGR91RRsnLZKiSkjLEFTQgIvX2/cAn1ILiKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821136; c=relaxed/simple;
	bh=Q7VWgHeIkYt+Un7ZWuDPwT89vjeFVsU8rj5v/LSKdHc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VAN8OyfrbtLrkBwDTzqBXscRsI488PXqNf8XwibrG9XdkGt9tsmfnr/qvAKRGoGZ+F5yyktfmKHXkwMJ1v2FhExIEU6MK33bIlXCXPjbAxfsOkAhauJcveMHc1JMvPMNTiXeMKZqkeS51qQjwrmJ7yS/mXyE7GaT0+pIL23g/6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nxSEqZ0h; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nxSEqZ0h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPtK4EF+gHW7FqU4Oe4ms/N+ZxVuR4HXTIBFw5fZqxjOjman0iFQQmCcYGH3zAOW7soHROE5LyNXVqNKWF0sfjLGmEpFjOnJGVs1SbCiFw+3IffpYv59j/nSbFSsnA0XROwIXDmoxatEYdkX9KOVH+nBjT3zOdoEKrOXirCA+drQ/I2RSA+nXiySwl8EhqKcotIwhfy9VW/2ZF0iUBWF27BszJZx0d+hXNLHKAIjUuLlRjkDwXLVECzkCWogfaDhQzQJvVkUdTK92JhZTPLbaIE7U/OAGGSy2YsvNJKZjoJto4vtKGduBqOp4stVDkkBRyBFThaQBTtT8Mv2uUiaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqoNSBFwjEKuW9Utwuat8UzwdWmcnY1ZgV95htdresE=;
 b=FlOBGTVvGEQzCL7C5eMKEPcLsYQyoe14hzm21P0e/Le+CzeZCOw7y+nMwsJ8FZhuQVMdbV7ArnK2W0zJnvwR9XWi1bEdsQNYLeLpVp2yJFG9kwAzuStSpM5K6Ymmu+45EHRklyWpcF/5Fywsl91YfuFpOhEMAzdhovzApxPbODQWYxiCWTtP6AIFr46T/6PimbK0zC8Cu2s01cOubC1wik6Vx+hTaEBwAyfmrPvFkH2abVJQabeRiByk7NcD7fpeN4655DsiLTrlvhfcsHBo35WOriBxii2oYp1Tu0TTjnTLvmaZ7nMC3iKYOp1z3buUMn/ROGtk+RjKLIRS0Dzo0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqoNSBFwjEKuW9Utwuat8UzwdWmcnY1ZgV95htdresE=;
 b=nxSEqZ0huqL/IcU7knR1GvFh5AzQXHMdHjjGqcR5Bz6qYLSSzXq52sRcOCDVqJ46Jxwdz2rnWFYe+F0eSIBjt6OskbzxBkrsE9I/oShdqVGMyXKJnDm4LhwsKFTf0B44lF5RxsnDI6jrEDZ+eY2G8O+lIqNytEPusG8EjA8qk2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:12 +0000
Message-ID: <871pm5xvck.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 207/292] ASoC: intel: boards: bdw-rt5677: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:11 +0000
X-ClientProxiedBy: TYCP286CA0218.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd9022d-5959-46c5-601c-08de20b9c176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fkIsIKaSr+fVuc75ajWsv6SPLlgbehSXTod4/LaYdg2BNoZGrdToHqaxRqff?=
 =?us-ascii?Q?hVT5vvFdLrGNC9S9DE4u6aRLj3qy8kdhdZKNd9ge8rw1PEMU8wMqcPfuyl8j?=
 =?us-ascii?Q?AsamU90eqVRpF3s4XLK+52gQQ2vLX6J+WFKIsTTm9oxK7qPptYKibTH0dHhT?=
 =?us-ascii?Q?2Li6DRWiX0+Gm28rznIqFuaAYsj+0x708uILwIKKT/JQhImmTaBV2qJXoUXC?=
 =?us-ascii?Q?Z22ypzcNOrZJNtU7405bC3rRE+vn2R3zXm+rhJO4Y4L2bsa35ZXRfuUgNV3P?=
 =?us-ascii?Q?T2Uwe7qaSztTu+1sLxXKwqXJE4sTKhApjnevXE0Ybe/zujxAP5W2LFDmL7Se?=
 =?us-ascii?Q?FylEZY1eda2fFMld9BGWSCDY/FZy71LpJih26p69SIM98wGZQ1T+2aTBCbco?=
 =?us-ascii?Q?YLh1fYwY/Oz25OGv//NW5jGl9XCvimWbqJx8vO3vg/Dgt5ydDRvVxof6Le10?=
 =?us-ascii?Q?2oMXS6G7D+L3n7eKLx4kpdGwM861326DB4d62IzjtJmVUasYDrmUCtyDr6Bi?=
 =?us-ascii?Q?0UUhkM+Hjo3oRpJH+AWOTHQQa1eThtz241C0LjGHEf7ocw9qzDpDrNYinhBK?=
 =?us-ascii?Q?5knaTdm3I8Ty0eBNhr9ztF59hDEw3FXLDqqrwt+vb0d5KMlxhoONQ4q8c4WE?=
 =?us-ascii?Q?J4kbynZ/S9SqHRKzV2MpQG4qZHcD1zQAM8mAFHhV0WXqZ2hSxCDv3vsQcIUi?=
 =?us-ascii?Q?403FLLr87sVjMstvsDbZ42gpfMe3qM3fIn2+GRmyDFCkIW39t4sPfZ79gY+E?=
 =?us-ascii?Q?CMXCwXH2QHsNpCmN4vXW8Vv/jqHWzF+6vQCx4EO6XBe4idQEbtt0Y3CuUBY6?=
 =?us-ascii?Q?FTTQ+ba5P4Q5fi1HXILncmL7d99c97PDqoXUxbcJQXl+oooHvJh1A3qsYthc?=
 =?us-ascii?Q?8Lhioz/laLu0Nh2dKnR9MJ77tBtG6uVM8rgpUtv0Iao8/+7K7smYnZTN0n5W?=
 =?us-ascii?Q?28dAdL/ZEajTbYjeA8YrtmQsUw3Ai8iKdU4MjuYB6DqDIE1ixYGv/afspUWG?=
 =?us-ascii?Q?zIg+pFIqPTshGVjw0x1sfZWDil6TgurY9wPZHVgaSeKeM3gzOyrDClvIl+aB?=
 =?us-ascii?Q?Xxh4yZAu8oqoXJhKj936HH+4+Lq28kLmhPF2GZJrwvMjuK/ch48Wc935igKZ?=
 =?us-ascii?Q?hxU9V2BpgDHvV9sGlBtgkQaEgCNM8QHHIeFQp5iGztonatGhu/o1NdnFLCaS?=
 =?us-ascii?Q?c0nHKGyRDMxpGQ7zObwwTCVPsSUxVmKlVFMDUGJ7yWAJR00qgNfUZJM/UVtB?=
 =?us-ascii?Q?Fg3TmWwU3cj1p8TV50IvlcXzx5HyawwKX+NugQw6p+O9fNYwZU6vzoE0HTL9?=
 =?us-ascii?Q?FJpbrIM6ZDqv9VGjD3ulDxUvWQpWJBOfaXDbp8QLU6pOh0/yPWff8aZhkSF2?=
 =?us-ascii?Q?Fenpnio8Li9kVCK0qiUWRmYR5ZrOkS2eGBPRhQ6wwsz5jg67uOYvp5jycfDC?=
 =?us-ascii?Q?6jEPlKHpODK4VzTMqDonOqfETMhU+CNjeXc3EiJE5A57S1YtzxCANYkXX3b4?=
 =?us-ascii?Q?FnGKddwjq2roH6cbnYnvbKHzdH8eYTkBJ5N6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IOfsiWhcjXi/BZPNglttplUiqId1qrKQFQFKuu5MqBEEvuq5uxd3nta9Hc5f?=
 =?us-ascii?Q?02rcPHDSTkHjY/IPEH5QYgdLrDHPjmB8Yq9UbwuaDkf59QI4LLcpsXlGoCS7?=
 =?us-ascii?Q?3PHG8n9CtxW9LQPf8fW4YbZzg2avZmJPyl593IbFHVF1oKyRDGY3i+MD1u1A?=
 =?us-ascii?Q?OEAYcRc/ISA+iifft3t8sKN7FNN6cxOUnzn0RTCL7/gCsf0hnccaaepmyAND?=
 =?us-ascii?Q?mCryWPqTOjmvTsiemTaNM3kk1zwhGXkmS8IroS/CcLrnboNh8zo+DQrBUB2W?=
 =?us-ascii?Q?ClUfrPF68YvYHZycxeYK/LS9HmcofrisvyVPtabAjOhNFsXoVJA4q6OaIc7U?=
 =?us-ascii?Q?zE08gefhAzSpmZ25Y1zCN5v21YEusLfdBH+VohnLwFa7NM2zLpx5TG5w1C5J?=
 =?us-ascii?Q?YX6Hi6K7+PC9qsCYK8dnbyvzJIDW6WMH8HLvtmmD28Y4j/r8z3lt+fHttKCl?=
 =?us-ascii?Q?Izvu0DaQc8PoDN84wsGOsAremHnreCuPOmPNGzzwhuTsktLfJnlBIAAL1alc?=
 =?us-ascii?Q?Wj58zMTkSaOecrTfzK2eLaJNpk6cSQfixsjO34HMDhRJ1Ahn+ZTe/4zypjKL?=
 =?us-ascii?Q?nlhQjGwWifkBY3ffSGFclF2MQzweufVOHU7mqxw/NRqmRoyHA2yW+iZsFh2K?=
 =?us-ascii?Q?iVNvNLH4Z4L/o4QzC5+iDWdXYiG2u+I0nIRxV/0IayXLpb5kLvYr2MHZrEFV?=
 =?us-ascii?Q?eS0Nd2PMgxKhpUPEhqhF9A3FcLBJb8EwwcZLQfCHEw6L3+CYqwBuvUtqGyE2?=
 =?us-ascii?Q?rFnWKaNCcLwUD2hZYIEctBEa5ulB+1k4HS6fx9Cl0NunDMXrarpJeSy6xYGy?=
 =?us-ascii?Q?JDRw75N6lr001SzFu2NHw/5UE17LxhYzbWzeDEf5RkQYsb2LcloiZEGhoLBA?=
 =?us-ascii?Q?peJNM0Wmbgrg0iALBVUOS3YT7tu9UDaPTch54Lz7guakB7n3LKEpYZ+17KRT?=
 =?us-ascii?Q?UdJ7ZNGcJoEhq/xvjQZJf/tiWBwSCrFRv4l6iIfm0V0hQGSVBKzeb1oPM4RE?=
 =?us-ascii?Q?MLgMWKmpgWo6tfa3Q0mjvmdD9Mi730xTvsJVrfp3S1Cvpb97DqM8StZRZDIB?=
 =?us-ascii?Q?LQsCg6sOrter6crUTU/iNW0DNE2g9vVMTdFr4Ae4WbUFMP4ofYws20or9s5z?=
 =?us-ascii?Q?hiAs3X0HUMz6D9VO8YTFc6TYpfY3cTtq50GrLq6gMIg7lUEXh2ag6b4YO412?=
 =?us-ascii?Q?oq9YzXx0B6cZI7RR3JmP/Idx2/arTnD3fy+b051ftdVH9FLwEQpT72TnKT8H?=
 =?us-ascii?Q?7urjP2ambc+s1/G/oBB7kFugZYx4bcxW9wh8AX/XgPn/2qfCTlYVtWnW4SEd?=
 =?us-ascii?Q?kck66ZtJBEI5xqNWmd3RMYorY95LS/18cYKwxuvYLN9XXq0aX0tCUSsFPHDP?=
 =?us-ascii?Q?5oDntmskfeQ0aqcW0CODRkhnlQu0ESpCSbfxcSHVRoKOyzyPc44EkKS74aQW?=
 =?us-ascii?Q?EiKT1KYI0i51I8XZIi2BB9aMll/qWbSlKoGBa7TXLPm0bhC0Q3XN22SkIIZ8?=
 =?us-ascii?Q?qQ9/0Lh4q32GqUw6o/y2IJF5FL1QeAXrK3XSuv/TWtbfUNXXzMa0zUV9ZPzK?=
 =?us-ascii?Q?OB2sUpZfAKt7CEjAURKZI/0ddTbX98wXvZT3VoExs1dU8J8Sc7ITWAM5PzXw?=
 =?us-ascii?Q?OXwbl+zg9H2ZVrzUKA2IFyM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd9022d-5959-46c5-601c-08de20b9c176
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:12.1112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/qDFunGxGFe99yr0i9Yj2EH6WrO537k2dXw7S5tqUDv7Hd0UV5Av0nGwGUPEp/kXUVlvbhA/3E/xIX+ltHh+ViIq7JyazyxVMEBMldoG9XNJTUs8LqV190aqimgXedb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/bdw-rt5677.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 9484f34107876..408d20ed8cee8 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -27,8 +27,7 @@ struct bdw_rt5677_priv {
 static int bdw_rt5677_event_hp(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *k, int event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct bdw_rt5677_priv *bdw_rt5677 = snd_soc_card_get_drvdata(card);
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
@@ -228,7 +227,7 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 	struct bdw_rt5677_priv *bdw_rt5677 =
 			snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	ret = devm_acpi_dev_add_driver_gpios(component->dev, bdw_rt5677_gpios);
@@ -366,7 +365,7 @@ static int bdw_rt5677_suspend_pre(struct snd_soc_card *card)
 	struct snd_soc_dapm_context *dapm;
 
 	if (bdw_rt5677->component) {
-		dapm = snd_soc_component_get_dapm(bdw_rt5677->component);
+		dapm = snd_soc_component_to_dapm(bdw_rt5677->component);
 		snd_soc_dapm_disable_pin(dapm, "MICBIAS1");
 	}
 	return 0;
@@ -378,7 +377,7 @@ static int bdw_rt5677_resume_post(struct snd_soc_card *card)
 	struct snd_soc_dapm_context *dapm;
 
 	if (bdw_rt5677->component) {
-		dapm = snd_soc_component_get_dapm(bdw_rt5677->component);
+		dapm = snd_soc_component_to_dapm(bdw_rt5677->component);
 		snd_soc_dapm_force_enable_pin(dapm, "MICBIAS1");
 	}
 	return 0;
-- 
2.43.0

