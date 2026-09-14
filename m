Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC535294E
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 23:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430204; cv=fail; b=LgsmcElN8WX/KSxzw7/RNurk6hJ3w/YhNx2lrav/gxDDXwtbwLGKQGA+3ES59kKYeXUMZ9wePbrsKuVAqQ/0VaBLKgX55+ilBOYtYNBq+ynPhadRvu3KUenHhDSvlDKUR/DqIRkkE1GdsR3pk7+GalN7v3iNR0T9F/GeYK2Tkbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430204; c=relaxed/simple;
	bh=PqPNS/S4q1xkhvQ2NIjIIrJptny6lTqmEWoBhI7fsPA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=e8aKZF4wyflcZHuysQDJxqNSZF9/bwgrijCojf9R2ljk4lRzCxXmYfzKsLdIQIQZf3cmIoYeq6eIVp/vGJc4dpZc99n5G2X7onK7vv+SxgHT1ll5tokA4Dh7gsYU5yzgL52PXOfVfeRA6cLF+UTvP7HkZ/NBzrmPAgsAexf6ttg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SXTcJcz7; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SXTcJcz7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uzm/mzhtOTQSIzyW5ceMRF97KUqudy9580HxKtUaVq/P+p4rQ7B7Zhff1y7akjupHdFnk1G5DxoTXUIDLiXgQWQ1gLEwu2kwIKxVWwxIVxAT8KDM41dXp2zD8Y24hnKQxCgnT6Ka9KdmoXre/0khNVuEFZkNGD/Afd92BB0aqHLYckiBOip9c7ZdkRGjNSi/a2x/ZlUoUcO22J2UziAuBJ/49GzBCHUSYaSR9V7ebADdpbamjhcrcmE5XEo+aRzb0XI1FZ00/+6HV00jqp6+1q8FFBAPbm17ZJeS8KBUb/Z9hqtX202PsbzKgSAOd6X6gTDRukYgSur9uukAUghxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIbLJM+7U9i2s2cgU3+gQ5wSc7Jdd4LAGX/TbeYZ3pQ=;
 b=h8jX2ZAjKrnlKuq0xvOQGzsu3nulTjR8hypbO/KGh6KNQCZ8W8Oht4EqP7A+Au69+5uEOSbPEKQQEP47RS9kvmj/qceQng/GLsKu524Xv1V89C4UXIGiRnAlejn7yUVYc0QP3DToxuVEu1JoxLNB5/JdJfkxFGOTA9RpmrgcvGQ7iytBSELJKord9baPj0ypseW5R4XCT4Y3I+uRrMaY1kWnnMRvG7A50TiN5JphMhOLAUqAQBMoXfh3NKpQvnRs5Cnr9WQxgige907QUupvezmv00gCVgMELsaEzZn4oQih52SMcRCa1NYuuu+wRWtFLVALoe3sni0algNR0bJW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIbLJM+7U9i2s2cgU3+gQ5wSc7Jdd4LAGX/TbeYZ3pQ=;
 b=SXTcJcz7ck3u537kDi0UC5EzVT1OPEQKYHZpqVUcBgR097fJZ7dgi8wScfFvgF/5/cI6ITNhyiuno2PL6G0KDlJ02anlLuGQttBcrPamvQwPjwvLYbGECk0PIKLiN2FTub0W5WKcmvX7A3AH92RL6LeeHLx0OWEsvA0/W5DnJVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYYPR01MB12998.jpnprd01.prod.outlook.com
 (2603:1096:405:1c2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 23:56:39 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 23:56:39 +0000
Message-ID: <87ik47s7yh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 10/10] ASoC: soc-dai: add snd_soc_dai_get_bclk()
In-Reply-To: <aqf821dqgbOzUP4L@sirena.co.uk>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
	<87cxugli2d.wl-kuninori.morimoto.gx@renesas.com>
	<aqf821dqgbOzUP4L@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 23:56:39 +0000
X-ClientProxiedBy: TYCP286CA0206.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::14) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYYPR01MB12998:EE_
X-MS-Office365-Filtering-Correlation-Id: f236bc55-5fc4-40c9-4134-08df12bbd15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|10067099003|4143699003|6133799003|18002099003|22082099003|38350700014|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	SWMzzhBPjlNfNqfrZbDtBu4zOjDP9K7rOF30zNRBJbgZ1hLYg+IeSHZFZSAPz8NMpPDHGHlJ7ae92kZkm9o85bZSCAINvfAkSo46UewhnAIAjqargclhKQ1C7Q2pRfmshtUgK2yF2xbE4Jrbp/ep78N5K1Woi/08DHNsw6EKC1wzkfZRCDmNF31PgobKgghrSBLJAQzlFexvYOmSoahHho+n8XCpsH8ladS/QTmRrtK/zR8Rbd+jJrrN7JHo+sx4DVhKvPZnMk3drU0J1XnCWUP1sI985+zjaqsUVZ3jjRkZvFAVpePprSIeSauTxC3Vnb8RuIJ5YOC4B21oTiHYdve9Ec5Ff7XZ26AXrzcw08MKQSmacyqp6ubvqrmmr2xRuTvd+DVUny/AeEyhnuRYeCyF8oe8sfWYimLPf5gKOzWJy/iU07fnC1yPe2QsaUwn9OR5xRz3ln3t/oelzl2H+JN6ybkDOW1UFmxee2ivZynO76vhTzUbR8Mp0UjuEQTt8ti9rDpE9nFN7hcUXyxIWPFgkGEYNh1BOmdjw6vBdQfi3kxCvRBOOqCElKHkquqkr1xZ0Wnrs+G8LgBSQcBQkldnX6DoRKD5kXmsEfo5Xx4LAi9SZy0H32GpfjnD8GlYo2W0OrEZWIIaIT96mJUoF/n8HOQUCkyfv+2Syjl0BcWerfL7YLdubPODZyxYa6lthARHk75vTtlUw/gQMGXYCfdhMZyXrBQa77PFa8Ugzgc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003)(38350700014)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QbkVfnxWwwOJHsczho+ivqsHwP1unHycDKTtZ0HeGhFdqFJzFf0DnseN+JNL?=
 =?us-ascii?Q?1Lo/4BmAQhpKWPpJB6XkOANImHpuGhOc4vXiSXX1pa2CSO5xt+H8nMI8rIQX?=
 =?us-ascii?Q?N++V5jjqFSjuRgSyEef+VPx3QLn1IB6AcBQF/D1RjaCOmDL9D3EPhsEdHF+3?=
 =?us-ascii?Q?+YFhZjFt8bTeWCkuFaT+6EBF8jd/GPsLLMUD9/BVrEEwvqbG0TPL2KcmLy/Z?=
 =?us-ascii?Q?vsYmJ8zjBxmnfUzU6pGcGWpeLBbie6/9gLg48hi9JYDEAUrUAyGzb+exTLlK?=
 =?us-ascii?Q?pQKjoosKgljN0hb0xHOXCm2/BEfhma3e++DLCvxB6pMJHfdFaljuLkpHUy7B?=
 =?us-ascii?Q?INu9VXS/Hxosb4vSNUjuR7DdzH1B23HQkGK/15zyc6TxmPsP9tASPwb18h7/?=
 =?us-ascii?Q?2vh9iWDJz35f5UnWtZpJ7OFESgWHAR+NBVEQRMivPbkuKCPFbEwIUSQOWR0J?=
 =?us-ascii?Q?Pf6br54lE33ppOY+NVBPFHfRT+TcHDa4F4aFXFoLHpNydTm+CShBO/+AjLDk?=
 =?us-ascii?Q?1x6/c7Pu2CiIjc6WnlLwva/arFObVvGDISAhHnzsyuoqQOPkgVYl85ApLKZm?=
 =?us-ascii?Q?4ltTkHeFcsjLYOv+LGbyPZCAkyGlBcNPEasjSFpjpQHAsUWIm65txXbn9gE2?=
 =?us-ascii?Q?FV2Awdi8aImEDQTJtqkvnrnWEtFEdYy+4TGiz7KAOj3UXLMvjC6KwYWVRLz4?=
 =?us-ascii?Q?I3oPVp+N9rNYkAilRoJn3z4e3vvdGcd7yDf8Pdf7es4HGWnwmunaMSn678jA?=
 =?us-ascii?Q?wMIWMzSIun/PHcNCNThsu73lJ2uly0wgOOWMNvH9uMgH8fbH0E7ZhfvoJug8?=
 =?us-ascii?Q?ru75LeJbdNxX/+PpQmeyQlTnB+yaCQX2E+Gchvy1kOf1P71597WEOouRsxHW?=
 =?us-ascii?Q?Q0z/248w8nD19s7wL/lzRUtgHU11hn5XAJyeTyB+bSOS3YK9eCBWt/dBjbQL?=
 =?us-ascii?Q?ORICxNv7UU0zM0tI4S5sFp3ikvaAn1ux1RFazrdbbfN5GCUX5R07lNIPxWCt?=
 =?us-ascii?Q?vC1H4xfZot82q+locnbP6kDmfXMbfsRNYgAmFXdz693AiV7XYt93LhNmBOmg?=
 =?us-ascii?Q?1w/vx8/NGsLzlV7oOsPClFH9S5qpwqVLO6QXDPOlrFULM0GJ9Qg+dIDooSDF?=
 =?us-ascii?Q?iB6BLq0neQrpe24Pkynu8FeZyMUkdhxWg8Htt2LyKpuRJNbDe/fFC74fSLMn?=
 =?us-ascii?Q?o8MXF058anDHjby13w8zu7r1vrBRlXyOQZ+4+6XJxDFd6vqmwgzG15Iiy68Y?=
 =?us-ascii?Q?0XcWtitPyvxQwY4O9U0rC5GaCNBwQHUBJcf+HQsobT0NcNfAoAvsjm+czK/b?=
 =?us-ascii?Q?7SOaLRro7xL0IHj6poI0clPcc5ffkA+vRTQ4u9iEf0+1TM1l6KUIFtyP2V00?=
 =?us-ascii?Q?1Uvz4ETPcbcgQ0VjJVjkf6NhOIIOHu+wybvOAg+ouu14uy3tPeKH1gcHpTQs?=
 =?us-ascii?Q?uEBQ9oA0tWKSlG8jYT55mN9RTDF03vGc6i/hErpNMV5ZBp1gfYFb7wQarNk0?=
 =?us-ascii?Q?V2m6p6wnksGCAhmkZ4RLwCvlnEu/n5oC7UsBbCFORNdo1mAPeD4b+FpSa+2x?=
 =?us-ascii?Q?JHFnCRrclWUiJpeBxEuq/8vooypIJdMWynzaJmg479S46VtwthC1+c9kmtZg?=
 =?us-ascii?Q?kguIioOEgZ05ZsnN+FUbBiZ6MrHMb1UFBt8JTuU/pKSiYNDp5nbcJ2YbJ/D2?=
 =?us-ascii?Q?PAaKxr9464JxL5FllL3rGxlC8jHUPVLEPMGdHExx9R59L66RI7+CXm+2tuDA?=
 =?us-ascii?Q?U1SrgI/+MdRI/Tp85IoE8LzkAGNxJ1Dos45TvpHb3DYty7Vlzgmv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f236bc55-5fc4-40c9-4134-08df12bbd15f
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 23:56:39.2908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1JIsSLxyqJ3DJs1+n6i3zQepUVIRvfeQknQzzHTYTdiTZ/lGFyv4cwen85sbEhYQY0kU0xOgOagov6NR5TY8zRzb2uopauu58FQHAqQXmvzLrOUn0j38a1BoNdFoxgL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12998


Hi Mark

> > DAI parameter will be capsuled soon, will be not enable to access from
> > each drivers. DAI priv has been mainly referred from SoundWire driver.
> > Let's add snd_soc_dai_get_bclk() for internal use.
> 
> Weren't we trying to move more to snd_soc_dai_bclk_get()?

Thank you for your feedback

Yes, I have tried to that. However, since existing functions already
using xxx_{set/get}_yyy() pattern, I have started to worry that using
xxx_{set/get}() pattern looks unnatural.

That said, some functions are using that naming.
But it is very case-by-case. if you ask me "do you have any rules for
naming ?", unfortunately, honestly, I can't answer the question...

Best regards
---
Kuninori Morimoto
