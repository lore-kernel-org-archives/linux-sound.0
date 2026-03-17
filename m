Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0D33CEA5;
	Tue, 17 Mar 2026 04:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721547; cv=fail; b=NrN7RDQYtJ0mAUuJMclmixMBxhUfcu8vX1Rk35Dw9Tk/ajJJMGxdCL2b6Wmdd++zVxfVyW2NJRPmQvQqIAAa/SYgfeREULZPpRYwER9SpLwx2K1VyH4YeJVcdyv3f5GXWe7qCeMsBZHjHTS48zAQ1stVfpruw9Cs4hKxFon4zik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721547; c=relaxed/simple;
	bh=F8HaRu6OSuadJsGNEWGl6cL/Z2o0j1gPoPI2Wm0DqAE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WvalMPhHOT0ryIjNZXLvVockUOeajKDSAWFbYkY6LtrL1MYsAV2wZHr95qsascJWK2zIUoEJxabN+4vjvQjN86m8KhM+o+swJ8lys/R/0n9V7E3Ydmvc7DoQn6e9tf5OUMC/xqE4IF8N/Jnd7ZtwsD6mTKp8M9whiTEf6EujZ7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lVJQmvCQ; arc=fail smtp.client-ip=52.101.228.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lVJQmvCQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kj88iK69ZSOrpUpfmoNHllfSKjo5ga4Bn4VIXtlnUOMXfDBfDeIrkJCR1H5xuidddxj70FEwB3O9ysSMJPV26eXCWSdG0aKgcIDEqrxsUcTI113IsaS3wPi8YdwhrE1pkI3p/LSyKZBwFwSOhMlH4gqE6HmL9U2FmzEBClVWi005kGUEwYiSra473UCgKU3rc8ot2UNmUVfQahsRNMopfbqv8e44RcFK+bPEpIvc5MsiAC0b9j61GnxqCXGROtSpORf1QnNZMTLycB2RC/TXV9fRGOpGjdikH3AaU+Pu9y1HcbworF8rKq6ZNPugsPVIeet9lEjyx09QrH09Q7O+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8HaRu6OSuadJsGNEWGl6cL/Z2o0j1gPoPI2Wm0DqAE=;
 b=s8LcsBefi2ktr9cgPrwgRCOFF0YVYTu/FUTjzUUSwKlAx/hHmrYUxL+j8iO6ZEUgFTxCnw9msOf4d9RsKjK+j05rt5WL4I/M0UIqoBLQQiE/LPaiOy5cg93vd0KESk19Nx5wi94lc9c2SDh6CE8NllqsX3USw4IL38gEAmx6EhqF61Y75oQUmkZiqWPkwfNj3q5rHo1sR1ISouwX0yIAL8x1AJSW6lDwg9t68eVUIUclHtWU6Fk2douVi1Uq18WzFs7WS8GVmQxe/plThsYR1w6agSAr4VYkKNNM0bEVSfN4Y7KLqCl1F7VMKqdNT4g84dmLCXr2wJsgkc48/fIOQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8HaRu6OSuadJsGNEWGl6cL/Z2o0j1gPoPI2Wm0DqAE=;
 b=lVJQmvCQ4ZAKTc1U4PvIwnmcA3y0wKbl+yd+x7KS+vH1AH5UQ/E7KOJRagfs5KPSV1CQNX0exO3Eqj7uLmCrwETOg3H54kQUskp9Kvx9SxnXHLmr0DPWta916aGyEedcpK8yh3nMSZ+Lj8UnK+difiRFGkWPbrmuB2AF1uv2szI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB16033.jpnprd01.prod.outlook.com (2603:1096:604:3e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 04:25:18 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 04:25:25 +0000
Message-ID: <87jyvbhykb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexander.stein@ew.tq-group.com
Subject: Re: [PATCH v2 0/2] ASoC: fix usage of playback_only and capture_only
In-Reply-To: <20260317033952.462209-1-shengjiu.wang@nxp.com>
References: <20260317033952.462209-1-shengjiu.wang@nxp.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Mar 2026 04:25:24 +0000
X-ClientProxiedBy: OS7PR01CA0129.jpnprd01.prod.outlook.com
 (2603:1096:604:24e::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB16033:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f78d209-7114-4fc3-1926-08de83dd35fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	IRHYITONGSa8B9qnVVP/x5oL4Y3AVieBTPEXgUeiQ1KuZprbI99NnExdBXxPEjAeU7QBqcDEeDFFj7yWQtX87GRrA2VSq2zy7IiNkHgJSbWEatRK6dBdKGuf5O1XlNpc9aGDzAmiEcM+RFMf96rfwZa/5JbVngk1vC5RLUZrDT1hNdZt9gwurYeJQRaJdfXK+4z/l9ZDN+/HuVzzP4m3GSAJcZRhHO6q7WvVqCmuBkhz9Te4a9PoN0FmI480GnYBJucVvO/2MXbPkF7ShzIKuLdJiChix0WboQ1J6TnaxOr/9QdbxRUktKpto2BDArNiAqNrOAdcAkZo7KaA/6K1xPDO5sF/sKmwsAAwBHwYRUPtaCAZA9L71tGB3wUkaoqjvLpzRmZm+I9wNDr/3w0+49DdLYTMtTZHl+UVGFMKd2/H3aRPloHYCmkK/aTD5CIoEK6tl/fFeVxPSmhqU8w6svYVtaWjTtRpXysSeJX5MOV+ezipCnwyNztF0u2Jpq5KNbcispTZFaQNSXfdcA4BYQe/E68xaZWh41wLPhT8XTsB3zJw7MAPQf6bPuv7pbM31B4qoSbIG5oFZMGs61Jq4z9RB3S0ZmcriPJRf0OlIZc2gKI/I2TCgKfdA1HT859mJVqYV+MuEdjkaR6aLHTEQqfLFILcyyeei7R3MrOLUoggIapRKHXG7MZikkELYGv4UCJRwi8PNzx46jPx9j4pqjP1sIxJ1qPyNitObZyr9DMBIbLvG39TgTePtkS8z7uHuRzmz9pjOusWQKFRfFgMIpvF1ETQFPjsfHvKjClo6bQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h5PtTgafHy35Yahnd49x0C6+zmIsBuj7uY6Jf03nm+MgvpVGSWwc+xGK1lgO?=
 =?us-ascii?Q?98A6kkxlYZhE1STlOZiUavP3sqhV2B27p2rhl0iLvxK6Z2vig/AIjQFSg9ht?=
 =?us-ascii?Q?AfPb4ySk0JOG3iH0sfNWJluOiM+EynPb9BzqmirdXAyZ90p/qArV/EK1bZNk?=
 =?us-ascii?Q?LUSrVMb1dAXt1LJcb4xoXXlrtIMKierlLNA3K/5GMIsOzD7n1GsPhzh283xU?=
 =?us-ascii?Q?mpNR6ihsMrdBg2Usb0fT+URWSnrxGPy1JwtMd+LFF3e38sYcwKCke0YC1Mpz?=
 =?us-ascii?Q?ufuyKWDATypFYSwTGl/TIdhTggpLGhzJR7ui9fXySGfJMEMNxgfao7t5k3EY?=
 =?us-ascii?Q?NWbr+GvM8uBbs3fm+2wAUK+HftjF+LrtUh3DkoQnF0z24Gv+xQuhNH/sKvRj?=
 =?us-ascii?Q?spbclDr81wr7Tvy7tjS+qfrmaXGB7yBpmOsGky/jxg1/dWab5SpCaZC0VrzQ?=
 =?us-ascii?Q?CCsXOsSx8OT5kKO7dX8tvQv63zdutqYDfRSL9hIxYA+2U2T4AiD3HbLQUqqL?=
 =?us-ascii?Q?2qtVX15PKwKhJR9+UE0sfvMTvhC49xDLMk8M8sJmfmqB0VTlICTF0Rv4lZqv?=
 =?us-ascii?Q?RJZPjk6ijIG6QQXrIPUrk8aAmlA45tkKsnkX7NyVBaGA3AsniAljGyU2H9Ru?=
 =?us-ascii?Q?1O3iufpXScTMrZLAil/pfg0YZSfYb1Qxx7Z9C2T3QNd9pkkdBEVDNF/3NyLB?=
 =?us-ascii?Q?/WWyR5xAbC9kiJMtyuyWFYqyH1iGRWVcylJJXNCUocm8+0TBXfKuLzYZm+iA?=
 =?us-ascii?Q?x48YPBu60IqHa5Ws0q0RGwWnYx8DglkUfQtOLuq4D667J6UPh6A+7e5PNa+P?=
 =?us-ascii?Q?tqAyydWuWdU/4ccUVJbck1Q5hpx2DIlfS7XFp0vDxcVKN8fVt0WsAHMg5yVS?=
 =?us-ascii?Q?+PROkVk3fj9Q4ct0PhQA0+vVyJUq6WfHWdB4SremF/3jIHgc3G/bfTLqXp4F?=
 =?us-ascii?Q?GkxPye6G/sXWI9R7p+xH2iof97RNWMl569dedEeLsG8YgKz9HwYGhjtK2d7y?=
 =?us-ascii?Q?b21Aai3W6ToJzoCNktk38rMR8xeVuO3Xnc1hFpqIZa0hdlNq4Y4tU1fIN9Cn?=
 =?us-ascii?Q?nnojaP45gXPpZdw/yZHQ3Mg9+iGKOkQGLWG4r/EXcizYw0hvfThPysnC6oGi?=
 =?us-ascii?Q?uvHeL014hBKVfyEXtb8Y6RfIpGS0qp9Lw8QgEiOf8+CDfMYuLSL32Eb1pLx2?=
 =?us-ascii?Q?JVV5TOJQoGjyAWYZndI17z63G4TKerqVhLYolduHXA0qfAUDd4lz423DtoYX?=
 =?us-ascii?Q?E0HKYZ4E5ucRot33KrIuWhjRezkkgNonTctvsgwwaTcXl4Ca/18p35XFdfzh?=
 =?us-ascii?Q?Z5o9gYrnaFWkW/ZcZ8Ao6Ys1FyRDcNuS6GfkNSKr2f9Aa5tDxCXfY9BSGcfi?=
 =?us-ascii?Q?+/wEU154CHj1xNlvXFDbT0INUr7sVIKmO7JCn0J6cw4SULywxzWfyvgAxoaD?=
 =?us-ascii?Q?emxTE7RzgGvnm9+ZCOkTOMW+9c8mWQh9AaqMSxi73BEWuikDlxUFGJGO0b9f?=
 =?us-ascii?Q?+xbx+OHeFlqfYqIe+UGp1jcTyJPqHRlomgXe8qVZQl0FswHOcYg/3umYk5xz?=
 =?us-ascii?Q?vdO3QPoLhVvNOe6o6uXJ90AVQ9yjOu3zytZ8G3VKCOkeZ7Lg23s1GqZblJ5Q?=
 =?us-ascii?Q?Olaov9YvM5kD32qZQDmieOwHuDru4ulPGbM6aG8WFZQjOZ1A4sWGgg7gasuU?=
 =?us-ascii?Q?7RY8FGYgV2+KlvwXf0q4sjSLmNnV5rjYcs9bZfl8gZ0MWumy5fo1WdWaT2a5?=
 =?us-ascii?Q?fWDrWuYuTQNWMgNxww4NsL4ie1vxZQMS6q3hW//WNPAoLaVqVAWr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f78d209-7114-4fc3-1926-08de83dd35fc
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 04:25:25.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0g2fWTf2+xzlNQ3fjtpylBg0YUOu2Z+SOxXVDb/SznUwnWzdZfhQ4MftP3JZ2Gvk8ZgB1XEreM8vGd6QziES8sSuKewQMpFBdbQospJdKqeo98kSewVEfXOLG5chAaWL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16033


Hi

> Check value of is_playback_only and is_capture_only in
> graph_util_parse_link_direction() and initialize playback_only and
> capture_only in imx-card.c

For both

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
