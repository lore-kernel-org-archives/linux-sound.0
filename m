Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8042405FD
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 05:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767763094; cv=fail; b=WppHLCngqhT265sbFqG3wi5Arar0pXeKXV4KKtQMu87LOLS0450AbkZ+sC3TLklUU+SBb5RwMCUy8uxsBcLaobca8k5dFKCxg3PXooj4WLlHmCZOsCeUEzS92fxM/b3vJrnEjRm2PEkaVocm+Xr8eyK+gywXbWMwj6nrbW5Nkts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767763094; c=relaxed/simple;
	bh=F8Jz5mqFEcZT/LpwBwdBxuIvJ9Cknt7UBPbIjSoQaSE=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=E0jInPhqP83OIrDZ6aXQmz8lWqAqv7tTaOeXIWxCOHdyi+vJCOg7O7u+lCvBHAMmSrbJGJo2waVslmoM52rZwD/9yqnVBWxKav7NCrck5DVtU+AK8f/CmIpH68vj2afhENkJzEXERdmQeGX5uG14Qsi6zJHc5h+gIVYP9kDNomY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=m8BFoc+3; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="m8BFoc+3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4W5TFkfWRIc1sNvjVHeS5F8IlR5cJiVVAatEGUXoc5eN347Cyy9GFNhGnG2ZXav0NkxECHQ1+LvIQKr+9PH1RCNMh1sAcNzLOZrrTZB+vDIoQaS6ZNJFVGFlDCQv6P4VIhNej6s/B33uoH8YMX46Q4x3YRECA4mfzIKhrknaaDwF2bmuOTuiVTz7GUqkcEAgMRXA1T61dsCCJgHxtVqmdYaMmuo4xPZ6OCrCzn//UKesqBVcQJkzFlIu3QAZBqTTnUgcNyFQrM0hEJuG336t6R+4wBxLz6JN4zlDAOMCzNYmlqN9eLDo7c5TFtRs/DM5UGr8zHl6h7qCOHgN4IwDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsJ642sHoY45P2SjH1T/DHLEJoGRS9YVsYLqzQ5aOCA=;
 b=iITQ1VzcWXRaOysfjLmZNqjUrHX1OZ8pxgK3jVu8rjLPxJEWpbRoHAbCjXi2dMPY2Pr0IEMpSsztj4Gs04kSaZDfDGGuBvIXIGF7acZnHA+1kEEssjhfn5b52Uy0Ajw4XxF5B1yfA3T5pzVJCygg+EtJ5tvn4/7ADAj4RCAAlC/coizXOJoqI3pCPYyS4sGMKr9biJyqJQiJi62N1fzG1v5tm2+9ybSrTDL25chwSWka6yCvDkNFFqBu77weeepUiLwTQFac0INFdng2Gf6nPyCyenUSyDUehFN3TivsoWX6MuuQA6z62l3Phy0ejy4HYnFu/glDXhepCnH7clcfMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsJ642sHoY45P2SjH1T/DHLEJoGRS9YVsYLqzQ5aOCA=;
 b=m8BFoc+31duynbygen+ALOvNFG7/rSAJbrZvnhDPB9ZN+SLefZ1gNHv5PBpgAJ6G5IM47kci3q7lm529wTinAjymggW0+sGq+WWEsycUWRxctBrCMCFYCqs48kICWevlUM6aJ813pu23dMG4lYAV1tWdVhnZhjVIp1dFJgLmFDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY4PR01MB13072.jpnprd01.prod.outlook.com
 (2603:1096:405:1de::14) by OS9PR01MB12135.jpnprd01.prod.outlook.com
 (2603:1096:604:2e9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 05:18:08 +0000
Received: from TY4PR01MB13072.jpnprd01.prod.outlook.com
 ([fe80::9279:1daf:ae76:4c0a]) by TY4PR01MB13072.jpnprd01.prod.outlook.com
 ([fe80::9279:1daf:ae76:4c0a%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 05:18:08 +0000
Message-ID: <87eco20zn3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: codecs: es8375: remove unnecessary format check
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Zhang Yi <zhangyi@everest-semi.com>, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Qasim Ijaz <qasdev00@gmail.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 7 Jan 2026 05:18:08 +0000
X-ClientProxiedBy: TYCPR01CA0067.jpnprd01.prod.outlook.com
 (2603:1096:405:2::31) To TY4PR01MB13072.jpnprd01.prod.outlook.com
 (2603:1096:405:1de::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB13072:EE_|OS9PR01MB12135:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e20e8b-66e4-4ba3-ed3d-08de4dac2527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rPSBcDV36dh2SKyxdHL0PkwhK3v1hKdtdQdIxE8uuUyFvVAB1Fg6DRmKGALW?=
 =?us-ascii?Q?FcaKQDGwkGYq7x+SlkpnGefXhPWzm59vSg6lSIQPlQHVedNnPLKHCxT9e1YC?=
 =?us-ascii?Q?DDMXI+5FadSKndJOA1lX1EoixgMps2RJF6Pex6oqVwM3pDZ840LGlyR8CjQM?=
 =?us-ascii?Q?r0c7x9Op32amrYt9xg8pIfWsRprUDcJ61gpESHI8H3Yv97ZzGw6aTIr7sD+j?=
 =?us-ascii?Q?XbBxUa3W4hS6q3epQB20FTfD769TR6dGlAVHlN+7ekEYykFgFmnrpV+nesNX?=
 =?us-ascii?Q?1IcPWDbLqgwFFY2GOODe+rP0/bV4JaH3v19G1ps8CL5Ukc3WOYvhRav7sF7g?=
 =?us-ascii?Q?GRW36SzzdR78KX7WFs5yVop1/gIJlD7+KfAgNPkzQUhG4iOJICVX4rQ5ouCo?=
 =?us-ascii?Q?9f6hPzThsqxQOn1QWB5oZDKRzmbKWrqHiKzGLDSycdNuqd5LzF2VF+pyd7Ra?=
 =?us-ascii?Q?c4my1IG/MI5gP8mUuParh/yVWq+dfnUVfM+qSwhgs/eBBvfgd1F2PBBADb0l?=
 =?us-ascii?Q?uctpO+GvKhqMpXHrpGRuV/QOVM3yst4elQe/vmnLYTrFju0fErF0Gv+xVVJ9?=
 =?us-ascii?Q?VIuYrTlEs7Ho5LLGCj4Tttp3+0D49NUj8ECwY8c3msm9jnY/TKx7U4rrMgUh?=
 =?us-ascii?Q?QcIMd2xXSKL+StEQvYeCCY1rQoMW1skImc/BB7vFZaSp4PTSSUDz5iKdTYUD?=
 =?us-ascii?Q?AMIMSrb5uC962XuT3h/OIEyWMtkYCh3qCvZRHgcH+1Dtd9aNZcdomOLHHbDP?=
 =?us-ascii?Q?srYVcG7i2qLXbwmNgPvzfm1bG7MP2usrbdwvBCNdER6acIbCgrfgtpAnNvhL?=
 =?us-ascii?Q?xpT2rAR2GgTP57hWIQY/3XbwCoUHaATgb/fB4wm6eZI7tECnhEWLcso9aAC6?=
 =?us-ascii?Q?+wQsOSzcWWn99Z6GAa5uPnDpUJJMX5qZ9U6Z6Dm276qGL1rcv2IUxO6QNhle?=
 =?us-ascii?Q?eSKoqa58R5ZEjH49VdvO++RueKZcCBD2TBsPn4HVI99cfkZI9uTCn9GXFRJD?=
 =?us-ascii?Q?KHeQ4dq1Y+WXqUvVAQcjgK0guuf2RD5Jjb5mN4a2yEsvrsCs0Yy1GsZSYrEN?=
 =?us-ascii?Q?zt7mlUpfNcV3+MctI5go6C7G15Hl0a+WD6i6muY9rramI0ZiXvUwyPQdvcjJ?=
 =?us-ascii?Q?84paqxNFeYklUNeQkkeUeMT67oSBzf0zVuvlIrDX8jONTK2OAqrW+w0y7fKB?=
 =?us-ascii?Q?ATsZfGPPPQuJKa7dIVeFn62dpOmHKFk6w7kMYbVu4S2rL0m52nePUQ6YW25o?=
 =?us-ascii?Q?WfFe4AJsVkk9RDbhMC7IG2ZdhAL4f0SPtBc+goDhbCCHYvREPcxU2EJBiWMP?=
 =?us-ascii?Q?WVESrIIVCZ5glIXcTPIhl9l/EImN5R5FPaKlbODLN6Zz5nO2M5+BQbdvpgS3?=
 =?us-ascii?Q?2mJCO6F3U0o9X42Yg68fItZN5w1aBkOaFqB3b/Cdy+1qGkHp+HQ7iYGIToxy?=
 =?us-ascii?Q?x56vlqxXp8v2O6ivCqszFmrVpYOktUI6E77YbgAc0y4FW2/T+vjHNgcTOuDM?=
 =?us-ascii?Q?ze11Ix0oxtOnmUORoQ9Ta1jkMLFRJYkkjI77?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB13072.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+asvNSU6tFtz1EZNJf/GWvZlfT+eBCzDWHDZOeYrOd+Jr6fjXfLRcOslZ8N0?=
 =?us-ascii?Q?sB1sjAKFI2RqV4w3l1A6pxdNQjE2eY8P7hCegsEr/5h5tvJ9mTtTzui2mP1o?=
 =?us-ascii?Q?rk+DuRcmuR1inFWk5GibseFvVd1WNNZiKMj/JGIQdTmd5LgTkEBrXlttAh47?=
 =?us-ascii?Q?2C3huVcwN42iiUvd3VhS8Qu7AyDJmtWwiF3C0H+BB28vWmN8r7v1UxxmX8aL?=
 =?us-ascii?Q?p33ACKCYJ5JghdAy9exLukyXT0ontK5nfC8CKHkWYFu1mZw/D1vj42DySQKP?=
 =?us-ascii?Q?lS3xN4U7ggiQuvGO62IAgi0h3YAUIF+xdYwQdNaHanXa3NZ0YL4ANwY8+87K?=
 =?us-ascii?Q?RAbwjmj/OPJFJZ8hCj+2d+4zyn/SqZkas8c9MywLE9wYk8uUkd+SrFrv6Cbx?=
 =?us-ascii?Q?XgCac33xmtCa3yhTDpC12/XagcsmAz7Btdt36S9lT9P1tHhQpobzIBpqMbqF?=
 =?us-ascii?Q?JbCI2Ih7zY3zhBz2Aj8ZxDHk+zMJZRRePdm/A7QS4L5CN8wptQqoSvgSViwM?=
 =?us-ascii?Q?OMNu6Cim/8XlU1r4hyIoBqiRuir6+psBkWZ9BdmVPWBjpfPrGEZX2RfiMvw/?=
 =?us-ascii?Q?EyRP8ZQifsq4TaB6fpSauWNCYki8kLUgFhilUn3nzYazRyCUX561jSPrF5Y9?=
 =?us-ascii?Q?fLnqh+8ozbVanl6ePNN8tX1RbwQl8hRdZCiUJIWVo4E+hCvibR2/HBFDLEMc?=
 =?us-ascii?Q?FTy4v1PaHEbx9lCy7O6ZT1kT3dzgwkjiUFbpxC9UJ4+9G3n3BxSdFsXb8P/I?=
 =?us-ascii?Q?gzanQeZt3NGR0o10cZOYbOEqGxwjiDLfS4BG8OjiUlrn1BmqLSDYzDgSiEAp?=
 =?us-ascii?Q?OtYuzXxHGPlh3cTnweUNp+Wg3Lj2sjbrSXDZ9vDFl6KNcW7qIuQoGR4X8A25?=
 =?us-ascii?Q?2EbQ5lXB/Oj1VVDhIhm+dws0w0Tj16nKDermsiaq/Ce99U/n3VY3/0cioai3?=
 =?us-ascii?Q?zgnmcetj+f2FxwbOCEPZezSmwzAH3Ep4ZTstnB3GPSSCrDaGzON+hPe/NQnP?=
 =?us-ascii?Q?tjM+0FRrMbEQXICMrjR4aFNOoj9OacjXy+FbzoM6OuI5jWbuU2mW6hFDpOzR?=
 =?us-ascii?Q?OtUjaFGv1EV3Uid/g496DZD9F9a/I0U1kllyd+G7d3Br3ZzKwuTvnYrB7Ktl?=
 =?us-ascii?Q?mFaz2QGDrtf7U2xntysSGiUqm81EZ/5QO6tnPG5yYO4uT7Dx58/QOvuBBCcj?=
 =?us-ascii?Q?UIJrCHVc0FDo2DPlEsIoYHm3E6CQIb8pGhPUk4uLaZLTCLYM369lOC+TWf7K?=
 =?us-ascii?Q?j5s8MgSqW0Uv/ua0JrecOCAQggNVHmSVTSkQ7I1nTenJbkOWNx8QV66RH6OJ?=
 =?us-ascii?Q?COIkFhxe/EGrvToP1mLvSyd0nZ0bFuwDAkZAK5d2ttebGs0Q0NuNEBIS5e5A?=
 =?us-ascii?Q?nPcWXL8pXgouSxGWjUt27MScduO3cx45PnZjbBgYGc45GdF3a4au2iqXvcFw?=
 =?us-ascii?Q?M8yntaCcZN2tu0XRkZpgRN69A4utgW1PtHlz0EnV/SRqeGnfKWVDvCqrY0b4?=
 =?us-ascii?Q?V+TwkBNOzZeCnh6YHpmR5LtULj7NuENq1+4FxAw5lNcPWRW9jQdozUN3VYlb?=
 =?us-ascii?Q?Xx3Fn7U1xM3dNJQ7s/thVVhF+0NkoSk4ajb5HwV69t3iaFiVHM0kCnrBZEQP?=
 =?us-ascii?Q?t0hU16citWrHs53rKMwObs2YCvzr0qPwIyao8MHCFrZ75ZhR8fP46oQauVOS?=
 =?us-ascii?Q?irEWSbTnaboxxIf2EqU6rTdatgF9eyLaroo0swOg7YRw+hPBq2bNtoQ5XEUh?=
 =?us-ascii?Q?iupk6EzdplyQj1AwTbqFL0hoO/Sc00/RvPmhjqBAgOmPgzjVfzdi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e20e8b-66e4-4ba3-ed3d-08de4dac2527
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB13072.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 05:18:08.7314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvRYaR6xC6840XmyjMhuGrqOhc4wos33nv2w8VB4kwG44aJOJuJdra5mIuL5sdsJHeX5IgFKl/0w555NTVXHSrFCZpLtnTn9fEEG/7JDADWBQDbq60Yjk12w5VydiCSA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12135

It already have default for error case (A), no need to have
SND_SOC_DAIFMT_RIGHT_J for error (B). Remove it.

	static int es8375_set_dai_fmt(...)
		...
		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
		case SND_SOC_DAIFMT_RIGHT_J:
(B)			return -EINVAL;
		...
		default:
(A)			return -EINVAL;
		}
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/es8375.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
index 36b0ebdce514d..0b9406e93c0ef 100644
--- a/sound/soc/codecs/es8375.c
+++ b/sound/soc/codecs/es8375.c
@@ -397,8 +397,6 @@ static int es8375_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_I2S:
 		codeciface &= 0xFC;
 		break;
-	case SND_SOC_DAIFMT_RIGHT_J:
-		return -EINVAL;
 	case SND_SOC_DAIFMT_LEFT_J:
 		codeciface &= 0xFC;
 		codeciface |= 0x01;
-- 
2.43.0

