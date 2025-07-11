Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011038.outbound.protection.outlook.com [40.107.74.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E3F3FC7
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 02:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752200843; cv=fail; b=c2nrDe8q3Vwk1SUh9GiFz7EncSVe1NTMKGBNvCKIOoGxWqKaKoAwa3RJHLh3XRDhxUWEmkXlhRCdIXX1GEnA5BgXXTmIGkM9JQAROD0pm/Fg1GPPoc48P7kJEtg/GXl/DpjjD4IukHsmgfCvDNme6KPupUxt6qVXiDCmDSkLImM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752200843; c=relaxed/simple;
	bh=AwB4C8SmiLZJE2FQuWEdc1ZvYW4LA93kO3lM9JyBKVg=;
	h=Message-ID:To:From:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=AqQEY7fEr3flz37v1PKfq5i0HJvHNcFC4cUtDlxSIq259cheRfGi7UxCUrwRukqNknS+VimuyM4y7lE8h0yJt7QVLSk3Muy7QnXqHJl8FvfOHkberlaU+DygVsV+no8Dpq5PBXLIiu/g7TAberabJfxk3r6tUUtcAbQ0P0BADNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bAaqXIgq; arc=fail smtp.client-ip=40.107.74.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bAaqXIgq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGciXkCDLnthwgbFqQxc5M6DDQWIm9PggViFkjZpgrtdDDtcbCHsro7WljvFgmmwe2DufqLo25woVHGuFoiqJlmwsd8t0LcJ7dV4U97Ao3IYhfonM8iJ6tCsXhk+rj+byi/RLMZCPNnq6VpCB/27W0H4cdEuPdBo5gFh0NhzlTC6Ae6Fphbi00Nj2uVDwxVeCCnGuapIDsHnulGJS/oCbTzcMzjTVeQa3M6SohXyDugBhFaCR+1wv2NV9nFEd+Pwk3zMFi+A0Oxk0e6Gfq/JsPVOL+OS2AGvlIDtCaR0dHasL6H/8QOCiVMW+Uof2XctrhO1/+J/G2ibnHKd6n/mUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gaChr9q5Vj96bJGFBFAzCiExEcT1RzFHnz3xI0rp8A=;
 b=TOwukjvJRkwrHJ/edS4r/3v8OAx8WSeYEI+k9rGNHfII7RM1YmVTTFLGWcCg9nUdf/LGaOBw9N29t4lezrTepJAtXUKpLurhJeNyMbcnewmTl0C3bqPM+n6QfzLsTrwPmrfRHXqPp+82agkIpiB5qHxcnFtRY1tTw7D3Df0mmZSGb5RfROOabcR9f2t3jFcOtQhOqpezo8Pv3vhCSgzFwOvn7ZTKhdp6pHb4OAnX4OZxzsaPyci896mgYX2djk7tPCkCwQon+W1Cslus0kxIf/tHBS2FOusUUgQlIIMj7BkmxGVHVyMuWG9gzU/AcYvGTXb4Qe24Rwg4JOjKUhrG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gaChr9q5Vj96bJGFBFAzCiExEcT1RzFHnz3xI0rp8A=;
 b=bAaqXIgqnw6nU3PniHQR3CM7Kpyib/RsejPWDkxFRvl5oEohQQ9Pj6isQt51UJictCU9zLde5W5hLL6sUJVUpRHBYLOmFV+O6bDvWQidvzMZaS9x4H0oWtMjQ9qYvhOMoZyHzJw7PKlTQIxOUqVOxZjsSljAysTjdj+Nl2Vosxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB13586.jpnprd01.prod.outlook.com
 (2603:1096:604:359::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 02:27:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 02:27:20 +0000
Message-ID: <87ldov4g3c.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 5/5] ASoC: samsung: littlemill: don't set dapm->bias_level directly
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 11 Jul 2025 02:27:19 +0000
X-ClientProxiedBy: TYCP286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB13586:EE_
X-MS-Office365-Filtering-Correlation-Id: a93bca2e-7c5d-4d25-74ab-08ddc0227626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wiVIOs9JWlMn0BebX7xR5nE0pS9/uG1iyk4dRg41yTd8N9kNpYDCAfRbnAoF?=
 =?us-ascii?Q?kOcfSp9YLYHiOzwt2PdX/nlPQxmhRy1b8ovZI1BvLOG3wfLK9D50gFZOvobq?=
 =?us-ascii?Q?eTiEoXyFGR3GlLYQqq7aTtsVaxY2NCb1VY+B3+ylpBord+NuDmJeyNwsGKHM?=
 =?us-ascii?Q?N6BBb+ZkfjIKOoAebJ9ZcNsS7ZhQdFP5pmyYrhJj8D+m3Fj90z3hn3WPLbBg?=
 =?us-ascii?Q?/buXQhPItkBhIsV5af/bCou8ia1VJa14mDeTSVYFcBi2NJBWf+tblJPqIHaY?=
 =?us-ascii?Q?JLtgTky/eIYXna8wlK6b6/KQyESNeA2gScaktsyZ5VR/u8DDvI3ycjrLAm2S?=
 =?us-ascii?Q?zyAMbbWpADpVy/opAdXbOg+j9byn7YWcR84yjRKrOB3vox6ZXIAUhWw9CgFK?=
 =?us-ascii?Q?fcX1JwQJ5vTLa3P0g7Hx7wB9Gni36B01egQm+GecmbzmstooK9M6aWvKoGBr?=
 =?us-ascii?Q?7D95iu2IlMp4b3pJ2Dxu4VXSGJ7/4tMoTDZiV9VQrEixCJjp2FrZu/6cbn+u?=
 =?us-ascii?Q?1TJJIxWiLu1HQjxhMeByie8eKKlTHfQK8Lky4nc7vK0D68G3utoNpSvYv1e/?=
 =?us-ascii?Q?5srY5PU/ML9+DhsK7O/wGPrtkLjMSUI6Gplc8Mfm5lGTbFn0zn+FdyAhmFzE?=
 =?us-ascii?Q?94nhsBk+EcJi3F0oOWQZHdoxLHsY2ScXa5tYgSmeqMfyjBtI9rKaN5ZPWf2q?=
 =?us-ascii?Q?STqjjTjRFUIYl7fZp2CM0nmWVLb1AGAAvrG7syTbB0aEke3vrlNJgn2FpXyF?=
 =?us-ascii?Q?aolLbdJg4V3FqW8dIQPgCddt5RFItNEA2m2mZ/z+l4VoNl9OYHTtPn34QS2V?=
 =?us-ascii?Q?Htubrg4laxud/7iYH7mmO6W1uFtnTdGILrNrYQsVIDtjUHUu0Xz9u+2QarJA?=
 =?us-ascii?Q?13R3A1LlEy1YMaW8fTZSNHauVNNsbSFUaAgmC1zQ2zNG2heI3zwI/lkXeIhd?=
 =?us-ascii?Q?RYDmTxpojK14OzwUgFjsMkzYL/Wfl83Va4ONyY4NIhcpRxMyROjIwEpGwgA3?=
 =?us-ascii?Q?HDqJrVqmG85RqZW4XGHHgQiqpIbZo+ZfHpDpwYliwNHShBTSToxswjJ3IYLA?=
 =?us-ascii?Q?fiUuBjiTMd3D8nK9FjpRezRfH7+ov/nIFx6tHd05Z931btvKaM/0XCaq+0lp?=
 =?us-ascii?Q?nryAuZuO2oyR7bkYtBhNDhPr9Hw1CaabRf9rE4ycxLiUNTV4gDwLoZ+xyIdj?=
 =?us-ascii?Q?FrGIol3H9OSYQndUhz8NvzAGEU+lTJGuXAhvSuORcKdC7IGCCN/6nxUVOXbo?=
 =?us-ascii?Q?oGtwuN1VfmY9HlbhqqzNkCtgVHJRcvPf9ZPwTzrkKPmGG/LC+ebfggtt5MLa?=
 =?us-ascii?Q?2DytdJ590+JH1oHdzrcl0XmayS+0Bh0odvIB57CnxTksSHwD+6NprqZuiirW?=
 =?us-ascii?Q?83vjZ5AkiZs9VW4j3LvfIjHDLSnPI4a1QYUSpVbBtcSeN1YGYUF49GeT3cfG?=
 =?us-ascii?Q?ZOnRQ109Sm+2H5aOPUYMHP+kp4j3HF8doThX7DvEUyxVxo/K32ax9svfa++7?=
 =?us-ascii?Q?3iem/jm9UJc93bw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vkm1mLSooT+pEltXdylBecdI3TDduW5RSrNDmD1pMfkedn89/jRnacl44vV0?=
 =?us-ascii?Q?SobWyFXlE9xEZH4cbOmW2HQcq/+4yWYX+PQm97sUha6p9imD08fLIdVcXoYd?=
 =?us-ascii?Q?gNdvdNtHTGSe1JLqWIeNhCEHVZuRYa77v/QpQGPdK+LApol78fqD4e4+5TtO?=
 =?us-ascii?Q?RXvkDjNCB1FIOQ3wwzlSIal2GONszqsvWkAPaSmNRVITcQ8hIDAhWfHBnPYE?=
 =?us-ascii?Q?M8YBfQMk360zVAIzsLoQ9SaaKMyPBXOFaUbmZxrNvs6POIjoNxOF3kRbgYM9?=
 =?us-ascii?Q?uy5suRQngosXVr/aJSEHLyvJON9p1qjfPPtFZkW4GVndGJm8M4sh3l5Xqh9w?=
 =?us-ascii?Q?FlAQLzu98yHa6ALWmxtBN4mbe0mOS19491vGrQNt01P8T7D4FF7bFd6m6rMJ?=
 =?us-ascii?Q?qaJAaAkCCseggv/30uJyk8Lj13XeqXjoRr79+wg4pXG2b2GVu4ThNPQ1W3lL?=
 =?us-ascii?Q?UKn1kewa2RIR5MK+F/2Cd+1gAdbX4hPTyS5Cvr8Fe/LHGa/TOIHroagGFx8w?=
 =?us-ascii?Q?ojRKCz3fumX0nZUkcGRI5vRgccsRd3aG/ZJTK9+CdXUwSbHir9bbN8uJDw/n?=
 =?us-ascii?Q?OCX6UIzgq3AaY1yve1wubXAaMlOJmfpMfnj5L5JYdBSYuRB4vEpRaOz/4Oyy?=
 =?us-ascii?Q?t38JzkSgkcGHCD2HUMBkf6Z0fXqVEODJxt/HIhH/Tyfb+vi6mkAMNPwWcbWQ?=
 =?us-ascii?Q?9YVi7cq8sXfzn3wjNDEnZS98kuHb7I4Mekzy0zgU+ft9ybEhmCVinIrIPPVn?=
 =?us-ascii?Q?8E74Hwf2HaP4TxKNWvB1ELkKfg12+q8x1Pzc24C+vnAl/QAuOGaj57tNibv3?=
 =?us-ascii?Q?XLwfgEP0Usio0oaXZh2HGDcWD1rqPwH7LWv0vq0G6IJu5icfF6fnb0mzQjZ1?=
 =?us-ascii?Q?x3bRAPNkQE7ELMugrD9qZKyvD1eOjmP+E6e3C0nCuOCqk5GZPMlqa+KJq7fe?=
 =?us-ascii?Q?IKXtLzW2fjoHeXG2LGme0R5EPUY4I/6tG1zbnaUB+GO7hxBbYxumZLLlRauP?=
 =?us-ascii?Q?WdC+ZTHqKPIrWmDyUfY1xwFcmhWFvCKFcHCnxTv9nDbGiTdOvunCHvbvCD2U?=
 =?us-ascii?Q?DvOk4UDBUDJ+DcXXFu+jJSEylPmApheQoz20fz3q1kg/zyMixIK/JkPHB/TY?=
 =?us-ascii?Q?Dgn6tB1VwzWTslKtBzHJqT+szsv8xhAkCA23Jdbjz2535Zs6/lhmUsZkaz4V?=
 =?us-ascii?Q?l87X1yDSeoYuo1HS6Py0ZDVK3R+0mtj/0J0OaW16BTKdz7GjapWkpYfTgrgN?=
 =?us-ascii?Q?GmB44zUwoyscynSRMx6SXKC4cJjRskks39lHfsxdyEVqsVm7FunfeTBMiQlX?=
 =?us-ascii?Q?qRZFqkleDwkbGVm8jw3ClRTddijuJGNwYL4WYYKbsXxz+d3TS7jM86hWn6OG?=
 =?us-ascii?Q?vniGMjFA6C0MObl0IQiQOwp7SebgjPYy28kSk+O06Iy0jKH/K0GKgvu466SE?=
 =?us-ascii?Q?IqbaCWzfeW9WDyn2JGJ6QoD91rpUUaSgQCJK0DFFxjOxgDLbHtq5wxu3Zv99?=
 =?us-ascii?Q?93xvAdah4QoxYxYHYTgqtpKiw6Fgn18jdYSum/GUyeZII19DxqqtXgG2Lqys?=
 =?us-ascii?Q?PvFoDDkj8whrX10S/9UGrHpeeqAKE4njPinI1TDCikQ8Jvc5CJh7mkSWmb5C?=
 =?us-ascii?Q?sXfNSl9/7B9aCevI9qVEx/Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93bca2e-7c5d-4d25-74ab-08ddc0227626
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 02:27:20.1460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n85/WYvB9Eahq5tp2HqvtB76oCYnwpq0iCDUFSpRM3iFF1Y8XaLBLk1XubqxRTQAPm4PGyw24nCaw9Lsv0xnoJA9H63mx+OIGHG6PsEwjZ1RkaTL0N+8R+LiNx2g81LG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13586

snd_soc_dapm_set_bias_level() (A) will set dapm->bias_level (a) inside.
No need to set it by each callback function. Remove it.

(A)	static int snd_soc_dapm_set_bias_level(...)
	{
		...
		/* success */
		if (ret == 0)
(a)			snd_soc_dapm_init_bias_level(dapm, level);
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/littlemill.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index 5a02aac9b423..c8b06894ac88 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -95,8 +95,6 @@ static int littlemill_set_bias_level_post(struct snd_soc_card *card,
 		break;
 	}
 
-	dapm->bias_level = level;
-
 	return 0;
 }
 
-- 
2.43.0

