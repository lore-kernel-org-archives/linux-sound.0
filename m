Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B0C28E0F
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 06:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750053782; cv=fail; b=rfT8qQBdmUUumhWkYBRfXYgYel4cvXjRRXI3ovOFGicq6z9tfwPJBcnwsza7cw85DwjM6Q1Y927HJAW1wFr2yEBnA8lLd1Ae+BlzrPRXxNkzkorHE1ZQzEc04U/98d3u4XXZerU2oa8p2YV+5POM/npFZwh+GMjhFHw7FtMFwHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750053782; c=relaxed/simple;
	bh=Lib7g+5gS3uLEPJO6tEnhCrQA0b9Q9SdoYvdCkD+GIk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=T2rFA16Jjd2cCZdlzmHGzWiOB90XCEkxEycQTOxzWPH0uyYFzZZIQdV9Bkv5KHTLKLaJwlp6TlN74RVDRmTngoqcZLOCpETzyv/pd5xEJFWTl9Fzg83OLS9yO5jHrfsxom0TKPHDaf5LUP86UmJrnrjfNjrqKYVOQRj4aiEEoLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e1qbtwjQ; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e1qbtwjQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLeOndpy4P9cnvptUiRn6sD6gou2ElixeMqzYkJ79X7lEB1AuRYOJlIXLzvgpajf40aj9Khg7aZLshWMoDHe9BSbEz9CSz2cEuTDjjyvEbHA+mhaf5olIxpY/jZVRY0vcL4cqNP2AXM5peZ2bwo/abcBagLX2c6ktTwlrx9QP/YnYFUt91rUayF7l0IUS6zHEEZQEV++4OwdXsDxGUVpY6TBx9O8enLFoN9e1amd94lW8HOP6TPLCyA6K6NrrqL3JQeVD49kUPwzaPH/weeBneTE2REi9EYf/x+ap97C3Pm3ewKP7xL+b5Esl36o/0RTiHOgyPzWFUlrhHJfgRlskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5ZaAaRj0TBFP1LcCtvoEM/mQ4bPA7uQmDtNDwqGApg=;
 b=NF2oylVqPukfUex08muoz060n5KUWXe24Ry5Vr2fDymXZyf9D0Kt+7I/mFT3WMz55WfZWN8iWgkMsKMic8sH7TNf9h7pIA5kiw7o5EinTA8ePw2NJgeFL2DHo5waD9/29k9o2bXG48kOYxSQXWCsLiZbiA8292SIBzpS0b7mKIputKspGEazsKVyMdOdfntUw9fPVebkmZslLspff3TsQOS3Er65Ek0i8Uxh8DdRYwtJ+VV5fZj6z04T4W0ve3NUI+q5SweqLQo+N/uEeZ7XNxhDsOF19wAVUwh/+E+dW/n6ZusYHiZcSuC7QuhjCSdCzAUXdkGK4AwrxukeEZxixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5ZaAaRj0TBFP1LcCtvoEM/mQ4bPA7uQmDtNDwqGApg=;
 b=e1qbtwjQmf8KKPKiNGadrQsorukEjzLB+qnwEQ8edAioWGd8izLbBdEs7p7sqXD52LcSe3P1OU0+cJIzbmWyK92VHLvQHdxSnjTfRG6M7H37T+0TcJQsFzDJX+q0SNTThZaOTsi8724A3PWY8SumWgsv8Vk43KE4b6RUaOrIcH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10214.jpnprd01.prod.outlook.com
 (2603:1096:400:1ee::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 06:02:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 06:02:57 +0000
Message-ID: <874iwgp6jz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: soc-ops-test: dynamically allocate struct snd_ctl_elem_value
In-Reply-To: <174983355578.217351.13383396626687362293.b4-ty@kernel.org>
References: <87sek489l8.wl-kuninori.morimoto.gx@renesas.com>
	<174983355578.217351.13383396626687362293.b4-ty@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Jun 2025 06:02:56 +0000
X-ClientProxiedBy: TYCP286CA0178.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10214:EE_
X-MS-Office365-Filtering-Correlation-Id: b047955f-1ac2-4da7-6c8e-08ddac9b70da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L0Crhiy22bqJkT4uvJqRLQksfYI/H2Uqsx/WDeuYIl6XkZG/EWBRsGiVT0Kz?=
 =?us-ascii?Q?gSDbja0Kgnw/NBS0+ENQxIawkSY4FqMfCsz4Vu/y82pMJlLAIj6vpN90HTHq?=
 =?us-ascii?Q?oQCVZZ2PDKu4+njU6JcsUNd3rbXCwsu12V+ZHUNEX3mxtMMM2eoxMG2UowwK?=
 =?us-ascii?Q?M2cCvfnJr/ugGzSeJyNDLcCpKvmlsEXsm7fbVs501oy1MA5515TL7SkJzVn1?=
 =?us-ascii?Q?Qr0QwMAp8JHN+z2c/iMs8wmILZSWYWljaRN9le+TGL4vpZKKDWCr4O7uncgF?=
 =?us-ascii?Q?h7LJNHqKnhF5j+xZZDxN7YwWVuVwoiMHi/fYdt86LUea3pOBaYCWmJPSSlrZ?=
 =?us-ascii?Q?NzxN79fVJvmM3oVwzROvlg+jRoWO7LUSijZG/eoaIphEwdVNlx7ASgcLPPA/?=
 =?us-ascii?Q?1zCeTXwm7jhCMl749Od4K+3vtcwP0LyjBwOA2ISse0MIg/S6ZnUT7b5f2+op?=
 =?us-ascii?Q?x6Ojo2QMHNwn+v0m7eQbASG6g7FSoOa1mixz2LcX7+86ceopU+3/bSl0YO89?=
 =?us-ascii?Q?KWbqQ3hDJNpVymbQPgZ00tiBzgPVJkcHbpcaw88wN8D+ZsKlkQw3qDpJ1nR9?=
 =?us-ascii?Q?pGTQLMF5VQgBt01JBur04aRzjLlzsKX9/Hn8L5fERngYRVM33Eu3WxXcwErT?=
 =?us-ascii?Q?og2uhc+TT5jObasds4bysM0OLim6AJ32oujG+VxCBR1yjpEg6nrLc9MrZ+j8?=
 =?us-ascii?Q?5lnh6tjgBXVUrGZ53MQXN096PEKuo2uY0sezPcqA675Jb9G9xZfVry5/u9xk?=
 =?us-ascii?Q?0M9NtZIm2V1kpqXJPrlLMFEN5RXwXd86yg8CX7r/yEqdno2lhJdjHgckGtOw?=
 =?us-ascii?Q?LCLlmXrYxR2uL8w9Iri3n4ee9/PWB4jvboB31BwjJNbDoYDpd+INwGGNGW25?=
 =?us-ascii?Q?FKPEivo+YKBTebxXNUZ8zvT8j9WDwHHb8vrUlVbvXqx6IJySRo6mZuFN68uw?=
 =?us-ascii?Q?+jT4opz/9pwlrizWX9t1s7X6g7kZ77hbqBvoD7Hub2u3PRlWfRiVzOCV0kYp?=
 =?us-ascii?Q?X/SX+ivZOmaSJ7UxvICo4+PRBSxBHtww6VXLY+XJ8iFGAHf1rf1FkaAwxnMT?=
 =?us-ascii?Q?Sz0g19N+eWc7V6Lizo0Zae2naHTESr/gAPsd+grwYCkAqR+JtwLUyyiGffB/?=
 =?us-ascii?Q?S6QNJ8gtLspSJ9fE1QfhZ4TTontFUy0U0l4WOPF38H/m14V19oDcAfQK3ZIw?=
 =?us-ascii?Q?8ZOA5WjEGySoyebRafFhOtfmplCvRBqP1ZdX7AFdhmh10qam9ZrtK0Nz3i5H?=
 =?us-ascii?Q?/kG1y1gsAQrVR8nCq6CF7E9TsxXh9wJYBpXeDUpYGx1mF2oJSC/+8YfzoZZp?=
 =?us-ascii?Q?YdU5ATWnzMpwKSCRWbxXhQDX+c/oA6SSZsTVuhXfKbAfYsQnpokEPUeJujgb?=
 =?us-ascii?Q?VOA+mddUWLoaibfvuEiXcLk29bSLUlh406rNfYfBwPv1Jod2LXA0+1VORIl/?=
 =?us-ascii?Q?caWODLrLMagxKGS62WQYg++XW47PXoin+SlUSXwjEa6SwdZKq0cFlA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lFQ9yUxa2IAPmzrwH+0SfoleYbDbhOTUNog9uzO5JgWTxNBuOmUC/HnXQNDr?=
 =?us-ascii?Q?cXv8AQyQIQj0MPoWlR6UuMT/tK7seOp2HCwdX5nuGORdC98JAIYZlb3RUY6E?=
 =?us-ascii?Q?+dmaKPj9qMwSbdvbfnuYmFgOp47OBUm7PDdGEYUwsK98m9ntJBbJcnVN5mJu?=
 =?us-ascii?Q?y6JpwSw0h2htNaq5u5PUJaQA4aSPKZ/ndlsUqwAVOV/1t+Qww338tAW0NWqv?=
 =?us-ascii?Q?2Og4ZA5eaBZZOPsjil/UA7hqnc6v24zjf8Y//Ti3XZZwWnULJnRBBsRxq3mx?=
 =?us-ascii?Q?X1XwKeg7405LhWCYVDOEk1YG46nRs3gVD5JhyXybYfdMkopqU8UjW1urRHb9?=
 =?us-ascii?Q?m3r1kWbl9oMsgpz7WrCZaFNRhs49v1EpqePD/qavN+7Kp3qNTca3IQ7Akt/r?=
 =?us-ascii?Q?dfjtpdoh0QsRa559kgmiqlqsMYMAkl6CLsH6WTtrI4SFaMJorQvF4TpQkZlp?=
 =?us-ascii?Q?l8r7Cy0heBZGUhmXQ45uoxRgN775CEg5gbhTkWdHMywUErHCy44X/ncldryZ?=
 =?us-ascii?Q?6jzHepwSv76RwkEOLCZrz2BRyfaQS4YsOsA1/YEb6IYQ9zL3nZRfhb1T48Rs?=
 =?us-ascii?Q?+xUt/Mi+vPPd7+r5FzRgXVPdS2yihNFyjaUbgXA7PEKfOCHREe1/j23AjpHw?=
 =?us-ascii?Q?JkgYsmhp4ThKbBpAu5JpBuylf9AEhFZblTLSprUlLgGkD58CJpEip/vMj1WR?=
 =?us-ascii?Q?1uVBKFTVT3F4mJpNRKBj7x5SP6EwE8/gHfRIEJqtFqcH8ybRUw6ThuhgynA3?=
 =?us-ascii?Q?CIi7fV0cxXij+WRvZI+1x9+qy48MoVw0JfuU7Ix6XKk1m/PfHH10FxvtafIX?=
 =?us-ascii?Q?GLuxlfEKAY8oIqcMHFXq7RmI4NkMs6VVy4jY07cQj9n0iJc+QMBll9Xr8Tdg?=
 =?us-ascii?Q?Vyv2yWLCGXa5RnpioTCmnKTW84xbvWTvp1pZRD2aycx9OmsSsd04D2BtD/fD?=
 =?us-ascii?Q?M8RSlS8Ivdp2GCNK8Lc7ZySi4T50BCA8PUg+xvx1N1/n7DO9Ny8SlA04v87T?=
 =?us-ascii?Q?jc7bt4JS40GxZIUgrmc8TjPBZxKnsqu8VadPyg/jmPRY92yxbS6yk0D8DdT6?=
 =?us-ascii?Q?sQcqdaoQL+Ix7oq17QAb+QAQy0Kim2Ea2Ii7+vv96m9Szk9Yi/8yTKmHdrVO?=
 =?us-ascii?Q?FLpSlayl2cWlcwFI4eqCZ7cI88A4ofALKLusJM6uk7j4YM3ZWOFvoJAcs9Jk?=
 =?us-ascii?Q?6uQJhbMDR4KjzVI7RjyCiA6PfRHZWCBtspjpu4BCLDGjcZiAXRRRHP9/d5Rx?=
 =?us-ascii?Q?1XYdjcBd6KmtHzOI2sx9NPRrMJX6CbjpH5IiU3zq0WqtS/q+4R+EXbfSbiLN?=
 =?us-ascii?Q?l+hJqWnzVgR4RLeLD7j8UvQXVPqOBMNZwrlwPzoXu4ONDfSAQNx5GhlbRxUX?=
 =?us-ascii?Q?ycA/A4wqhsWr2pN1e4cLqk9+Twmyu8vSetIj5xT6qX3CBrfX9iNl5ASYXFXC?=
 =?us-ascii?Q?9pCF7A12s76xZxtQ0dGM1+DE5WmDlOAHn6rp+2WdbQAqax5iXsFmip4PYxr6?=
 =?us-ascii?Q?iWGjOgCt+oTes+8chfg1fxygRJDj82SMWSYVxYs+ReNdcQw0Lw90pQdxORyA?=
 =?us-ascii?Q?21QZddwl3OloAjwtUkj/V6HgVoWOsKru8J6FhswKt11SRub/x8edx7x3xq5L?=
 =?us-ascii?Q?4NuwzvZcEyUbuhpH9e4D+ow=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b047955f-1ac2-4da7-6c8e-08ddac9b70da
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:02:57.1760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9SFIYgAiOTjP3tjRm1e5t9uAci/EgJLVJTjebdeJ3g8rXMdlnKbDyoU19+CGwwC9I/sOpIIfSstvs0IZG4baRwgiVmN+/+rrt5QqMC+OoZF0yof0IEmW+k3S0cUzYOT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10214


Hi Mark

Thank you for your work

> > This structure is really too larget to be allocated on the stack:
> > 
> > 	linux/sound/soc/soc-ops-test.c:520:1: error: the frame size of\
> > 	1304 bytes is larger than 1280 bytes
> > 	[-Werror=frame-larger-than=]
> > 
> > Change the function to dynamically allocate it instead.
> > 
> > [...]
> 
> Applied to

This patch is needed to latest linus/master tree, too.

Best regards
---
Kuninori Morimoto
