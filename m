Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4094A33
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 00:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717059; cv=fail; b=QcV2IOhycXyycmUQvjEKKJ810R5Xe2+daeEe0ubKh7udJM8eODczRbAPW/qlIsCtBohh6DIQ1h8mKaMNOy0SIjefOY/Yk6v5pBb0VKVNzmriMJXeSq7YSOYVe0a6PsDcmnfmcC/mZW7Rz38xkFFriHf+w9aliNh361RCBSC83zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717059; c=relaxed/simple;
	bh=vm+Izl0BVXKLsXiRWhu/kCrZ09p8mU7JSymYuSfonBk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SzjaBV/+rG6hFGTU8AyII/O/3ZwI00rveahXW6+BbEN0OtZIB0nCH8ofHG+X+r0ncwXaM7a02LdvDCKn1JeveraShIqz/i+6lA8YYzv/qX4DVQDAekna2oWUy/o+WwDxbeOVsZnxf+fyqSmZ+EMhhTv3fykCQKiCU9MB1i/ACnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p0vNqVj+; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p0vNqVj+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIPekwjY74sG7APfwUwWS73fhDYv2kOq8ASTXcnRmBhZNi1Fzlr9rbILsLe1jR80eeHdky/RKD4og/w3YxRVHy+75LRfSJv3ipeIlWw8o+YyxWfT24O9XiLh8EDy5wW6p6oCOInfoxYk+c01Qw+Li5qJqnxAvnXlCAoRK+CJvJgpYyCWBEp+O9CR3P/GYIqvy2X+0rCqj8BoS3Q30NoFLCOVF1dKxokd3LKDeTmIcB57riinGjm6gFy8C+GCuPNFPIu0LuhAig6G4GBjUq3uGCLI1FD0WjFmV7ud0Ya/llZEIpAQ1S1QP2JGmMXFkxEqlVMqm5Qzt1rQ84ZVvC4c0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/bRT8D98v5q3PiCIYX2SjAA+5UfC0G0WOIMAP0su6Q=;
 b=rJNkde334FIhfJa0n61APB1z9Q8YJq6NLOeZ48wklvmRjyIobsPK79B/yojhqKBd5I5OKyVva6o2EyTNZlQjR2J3MPmBlaXin6TWgpHuQb5jUiXTmceVvfhqKVq9QA3Gyic+AddOMX0HBUmsh4mmQNi8+LmkDbOouFV/h9k6dGGL6rQlFDAqwqjVsxeb9clwsjXn7zq516Nj1ckRbNpJEiebPhndeHqPKvyf5M0qs9AFE6azN3zVeK1eHgWSO3K1/PiOp9hZIPnUYjhp06JM3hL3Dq9+sUlUccWgzaXeasjTMKxk/tsQpT2N4d19i6XifhtKLbUR6ztkNmmIvxJyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/bRT8D98v5q3PiCIYX2SjAA+5UfC0G0WOIMAP0su6Q=;
 b=p0vNqVj+6BOuwhodcQEBSbg7HJkcz4AcG9CZ0QvjTbNPkVDO8ddLib58aZX5dooWqvSWRjjbQ6rt+5pHNQEpVEb4hSynN4PlL/NeXuDTphqI9m6Gva7lu3h046vA+d1BjtFvZ6HmkQSNCfc05aza5tS0H3Ut3b0yEWTl8FgvVHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB12009.jpnprd01.prod.outlook.com (2603:1096:604:23f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 00:04:13 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 00:04:13 +0000
Message-ID: <875x4q97rh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: soc-core: handle card->list in snd_soc_unbind_card()
In-Reply-To: <a9542a23-7a9d-481a-b93e-04f1961e9647@intel.com>
References: <87zf245bc3.wl-kuninori.morimoto.gx@renesas.com>
	<87wlx85bb3.wl-kuninori.morimoto.gx@renesas.com>
	<a9542a23-7a9d-481a-b93e-04f1961e9647@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 14 May 2026 00:04:10 +0000
X-ClientProxiedBy: DUZPR01CA0115.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::27) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB12009:EE_
X-MS-Office365-Filtering-Correlation-Id: 35af2114-dff6-4a8f-bc18-08deb14c5508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|18002099003|22082099003|11063799003|4143699003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	WrYiYwl2TbOrf4walUadCiWNqSWZX0PhZMEdElDcJxWiKSFeMBE1hw6j72KkktneI5F9nG7isTkgHUk1/LweP0ywo4XO+/CfnyFhfFJMGt9PrMfUuEY3t7f834qWmAecGWmGfOcU0d2uji2IvWmSVUJ+IzLM2t9zhczOqunGDL9X4SqDD9augi5cBlGGJZcHmRTxRPOS1cRoWEwG6lboad9jCtg/NINeCs2wPWnxFrszW11VN5LKffnVms4xGjxCSiqt8Wls/xNmnF8m2j6Ti3bXw7TMj97c0ZimL7BicwHgo61SLSzfheSYk2J71WtAjLVK+aIfxHue6crT1acRkI3PjzDK6Cag9v4ToAIouEDtiyen8D/nIUkS9qQh3ToT8pVzJvMRbBRWnmWDAdxT81IPHdFoqY2orCqb+4WA2f16ZCdb7b4z2/yEEXQbOpmHJhAYgm/HkOe86EbTrcUImuwhf3tuWI2Y+1c5vR7AVzJqnQXtoA2YPa7OGHj3feCGBXenUJNqaL7ZvyIT3YVv2wVU+ViSp05V8SD3NkGUmavVwv5DUBIavipdKH0eHM0wwzuTJ6vGcf1EC7dEvntU/ZhvHGMmfcJeiO5IoTHFM1H/4jjV5TsEN/o59MtEz7F4RjHD1BXxC1iJ7lK7cYK87eyQucJLPBJn+/wqm3F6jb2EQsHNI3seGC/OnTjVtH4iIZ0ZTLQIRxbqUpAXV0RlT4aUbMpDxPCipQgMLAbaPITaoZQVQeKRsRTy+AdbQ87t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(18002099003)(22082099003)(11063799003)(4143699003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l7wrgEhO2gy8dgF7d12bobn1tWDhJYzf0tgMcm8IPjH6/wLEExJau+OfxN06?=
 =?us-ascii?Q?RYOSaFx1jUeg8HIvheNOmpcRe2amHfZG4mPBKzAWuXzu5BleTOxD2Di9N5mk?=
 =?us-ascii?Q?s527LETr8mJ5agCvGjwxEZyQsHHm2KjkAS/8I+xxiurhZLmTGoSDe9IPsawn?=
 =?us-ascii?Q?oSwQ6BejmkuqFdj9BgViEV+Bebyi89gf95cmhbgTiEptp3XrdqCfsqXijzjQ?=
 =?us-ascii?Q?1x9ELj4Z8ZI1rHfAcaV6/m0v5Vwm2T3EdqZ4Xv8ua3gP9jjKaPfIeq62gTj5?=
 =?us-ascii?Q?4n4yRFq0649HcQqTB8sX2rgQl7WzQLyTFtrOR5mZWxRZ0RajV+qNhl8jZwJc?=
 =?us-ascii?Q?o43CWb9RQZivT757dLw8+t6UQbTO2Zose2xRTo9oqGMx7tGGxl4Alk+MltAH?=
 =?us-ascii?Q?eU6kSTF/e1VQ3/z6CawpeRXPQyQo6Ydd8BZLBu9K8u0gWAv5dpwFL/JwyfjJ?=
 =?us-ascii?Q?w957qTruMF6sOC3ZxSnZ1YjPDiz8agwqDytrQy1KEEW7VZxogoAMC+PvIhpA?=
 =?us-ascii?Q?awPncRVa4oiQf+0ed60eGLy/mAPldX4rOQPUukLTFm0bseJ5X1n6f2QQDsgP?=
 =?us-ascii?Q?3vFfciYzMYAZsRisoh+K/qqUQy38FAYKjwXs1sDUNZb6lw4Q1DXtD2JafnI3?=
 =?us-ascii?Q?DNYl8S3zsLsB6QgaaaoZuDJYu08y5UrcPWbi0EN3nk4Z3YqNRTpQ9h0m1X+b?=
 =?us-ascii?Q?QG3T6PbX1n91bINT7mkGaahLvWKDorppItT1kYt8Eaa20aI09vlxEmw8okIa?=
 =?us-ascii?Q?r7NSISZBc1MY2UVXkXJiGEfCbR1RUW0JcZEXLPkZRRTrBURyENouAfY70MH4?=
 =?us-ascii?Q?Y0ZvSbSRytYqerfkbpycCDU4f5L6jlhOudrtA+dzHdb0PlBEgs/k4IKOgQ1e?=
 =?us-ascii?Q?5NV6M0p2+HarqG23UHZOdduOy31NkNKdfgkiPQnfKXpOScfIQ5jQU3AUDTig?=
 =?us-ascii?Q?Xnbjs0sSd6PcJ4OiuyCDPlT6bxPLWejHxgP5rTvWQw2YNo8jTTw0AXCK/IHN?=
 =?us-ascii?Q?mA+nPzYsVc4Q2nd5ig+lUVns35zVhwLhWdXmnIV6sznAvRT9wMzoen6Z4lzW?=
 =?us-ascii?Q?H38It4LMa7H7DtECP1mzPHFfyXlVlAd2mcOW+Aop0MGfdUba4pFlItfQ6QxW?=
 =?us-ascii?Q?OyRbFuaSIHCCxcgzVKN0hpAih7wE8L0WQtqbsHxYR4I6bS/j4QooI9HBvcXe?=
 =?us-ascii?Q?F45oeVUEr+iFkIwEZH6i2RhO5ZLmbcJ8P2MiSx9x2B3MtpQDVrpjpYB+RIpI?=
 =?us-ascii?Q?TziZCYffktZES0kKm6INN9oahYcy8W56EiHf9S044HjKyk0QvfNQr/7+BJmJ?=
 =?us-ascii?Q?nZJDsshyWE5vFPYm/r7zqKcj8miXLDoyOcCmc3J/02JsgS9JpdYyffOSSB4L?=
 =?us-ascii?Q?33eeA8K/xkOFbIV3oUlDp1vTn6KxR/mLDCNOEqgilx76xf2bZyio7tO0EMlG?=
 =?us-ascii?Q?tk+OLWpyXkD7Neseb2j0Kn98aKme5qcQ4rihAimIFzf2O6sKdV4GK3j9CqaM?=
 =?us-ascii?Q?N/8DjyprRcqGO8nO6ucHJHasZe8PzgpU4f6boDYB1lPuXRePfygi30ifEzF0?=
 =?us-ascii?Q?J7TWZZ9GaQJ1fG/9g+B357N545TY+v6tqu6o0kQifhMQB/x8sVsKitXh4CZW?=
 =?us-ascii?Q?9Y6LOL82GGSAiMVeNtRfU4fdNcgeFW3ZaM5I5IK5lqr0ibvnpIZm7R0zX6fh?=
 =?us-ascii?Q?1JxXEFa7JyPdyqANPxcZdfwCgNeLdLoYyAsUACnkf/iWd1gzeaLrWjOegp2U?=
 =?us-ascii?Q?euggooKEsQTk4+hlELl76r62CJ3DEWAx4wha/SXaCvXtYaY+Rrku?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35af2114-dff6-4a8f-bc18-08deb14c5508
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 00:04:13.6983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mVowMeBLCtziCZjr9P+Z+Kz1ZRQweWk/6YfjvVCARuMgaDS2GRnHaTG91kqZsP5zAeHoTn/O5SdB7PHrwKKYC316odb8qu3haNVCXvMXY1hsFL54q6pQY+w9R9WkeBC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12009


Hi Rojewski

Thank you for your feedback.

> > +	if (!add_to_list)
> > +		list_del(&card->list);
> 
> But not this.
> 
> Moving card-behavior code from component-related function to 
> card-related one seems intuitive.  However, snd_soc_unregister_card() is 
> already card-lated function.  I'd keep the list_del() there and avoid 
> the second if-statement.

I can agree if we focus about "whether card-lated function" or not.
But if we focus to contrast/balance of functions, it is...

(*) hadling list

	register <-> unregister (*)
	bind (*) <-> unbind (*)

This is not good balance. I like

	register <-> unregister
	bind (*) <-> unbind (*)

But indeed, I can agree that having bool in unbind function is not a bad
idea, but not so good...

And, 2nd concern is that snd_soc_unregister_card() is using client_mutex.
It is soc-core.c local variable. So snd_soc_unregister_card() might can't
goto soc-card.c. This means we need to include card->list handling inside
soc_unbind_card() and call it from soc-core.c.
(Or maybe we can share client_mutex on each soc-xxx.c, but not sure yet).

But what do you think ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
