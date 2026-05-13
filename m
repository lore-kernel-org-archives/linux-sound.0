Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638213612DB
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 01:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636902; cv=fail; b=Xn41ps6GztgsuRRsJjXgMMCKXPKJoxhgCE9Kf6RGvFspDmu42J+NhiuL2jit66lIyHgDZQN/5GfsTkx0XbfPPaOVZvb889CLGOlyO34hw83aFpsVkxXWEt1vFqvTeN4LLSjSGyczDRDBejx0S+eLi8rxTG86I6c2Yiz7rbLsWCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636902; c=relaxed/simple;
	bh=x4csFzFwY5zDoBk+9eKdVfGCpjfsYxg5KZPZOyOZVVQ=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=cc729Q5/cz2Yl6v2mXAZItQVuQHW3c7IeU0aqBUJ5Y+AnmAptGfdRcsaBzp/1378WvQ2c+ZdV5rkV2apiTTiyuUm744plUXqwTV0NDz4YOaw2I/n3I602WkOhNKT1V941Dg+E+pY8kIFF+cUVYxNucQOmN+lJW5qaCYry75lb18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gRY6U+W9; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gRY6U+W9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFHBKMZqgmzoyu6wUGfZieZeClIXFMhurxh9+oE6C0XEqFylJ3yeYRTqMw2m0LykQtNf3hHVtixAa4aFZPDgtFGu70QmOomQ/Uk4Y6FO9FcpMTrexA+iiaqnh0FSyrR6mRJndpE9TNqcP5vI19FyB7g1R8xde05yFCDQxern5UX7qWqijmIeE27Gyu4WDeEgKK2h78UkowEFCIxjM9SzU0ILgjNfscALcvt1coiSoWro4eQ19SFi/y0EYWsX73dJt3FUZj8jojlT+Bs2TOh1tc3v0BVyGdPTst5j+oZBy/QQUQupNW7MjZ+t3TWyz1Ar+GAqHEQorlfs0gXjJU1Nsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uo/8nOfsouTwgx1upCN6mkFAKNuwIvNT0Ff7IISVt0E=;
 b=XZXKgolDM5Lrr567MK9stcNheToh4GsxL9vECaMxl5GAJXcyMg+vJptTQbs1XcobQUxu32bfV3RDc5zuuDXiZbyYw5YqVpdhl3WRbZDRkuARv1Tp1SMvgGaSWldgN0FB5bpBnt2QrOcEk7krZC2bdQBj7xSN9YQL+qjEmENgVEaqPZoIRF52W9W0DzLNPw5c03+j+zgkAUqm7/+lR2rCtxppCc5RHNjm0dQE5kAtY6jIgKikiddLLKhedjThMyd2GMl9qtDbinH+hGhx9cHIn1QqRlGAM6uORIEcZR56jlcqtuq9lZ7er6PHxOMjqnGWwLW1CA9cJzw0t3nzW11Dyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uo/8nOfsouTwgx1upCN6mkFAKNuwIvNT0Ff7IISVt0E=;
 b=gRY6U+W9x/uZD+rm8QTnGiy9k0GwNqPtATmLVJJAX/nXTcmsIue4H/2TPEA/MUi5NEguHmjCSzTfJ19sSHWonjFy1CvQYE1xVp0XMQVz8mOTZdsLGWXT3dyW7zVHEMDOqUIq6KXJobcJ1i4X7hGT3iDAfOhb4N4Nh5omQD2IKxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16179.jpnprd01.prod.outlook.com (2603:1096:405:2aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 01:48:13 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 01:48:13 +0000
Message-ID: <87zf245bc3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: tidyup card rebind functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, "Rojewski, Cezary" <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 May 2026 01:48:13 +0000
X-ClientProxiedBy: TYCP286CA0284.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16179:EE_
X-MS-Office365-Filtering-Correlation-Id: de2e43ee-d93e-47cd-6c6d-08deb091b1b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|56012099003|18002099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info:
	0VXbK4zDWJRejHjy6aNET1Hlq9+JRAnDAS+uCtaDFR7LhtkmJiQBBJgoBrirq792NV43Z7ByWkwm7Yg+zdfjf4WrqVRJR+zC6c8f4JSPlDbtS+Y5Y7og1iF6SwwRU7qyhmCE89PiFb2Xzpl9ePHnqG5fXubOf2QTcp6s3FYSnjXfG27nNKIxgkWN+ZTMXrHvIdEsV927rKlmh70adwUm/tFFdUC+Iu48arZaOmP+XMuAaTbfotlXyFUFOdjtuWV3GjfATu+w0m1WDwfbISSmB5VmabtBmbzQy4Qd/C9bHLc3H8sHHGYq+6iHVDGykze++ZKqnIWMx5ZESOXUBE8UMOqWCrlBXNRVDML5dPUBLLCQWaF7HwHbIfA1GhluVFz1in1K2hGGyJUwdAL9/bm+JbVLIrGq+0i01mDLyKlyLgsqXltewrHEOufpkya7Vet3TZgQqi1w+pRdBHZttLJMnHUsdKiM0GLBLV7WkA1z5O7AzBluVudXSqUOr4ypA4H+URfI0AsPMT5josKaw59xGG3wEjTNrCsh4wdfKnC6sXkaZClzwH3NgZSwAInl+MqTnLfJjoDIrHEVMBbPjlRtKhB6DmYx7P3GnC87F8ApAO8l7uiMoTrKWeCpK3789IKeceQ9ROWTyTOmm2d8s+HSES4VpHnzseCHcMdnjq5E87Bx3VYM9YmJpFjhFdOGuMCscy9tn6AKtX6BQV6ydOTYZxuYFt7lweaATsSd3AZa6rmBvn/ITM9IBGkGtgOHbMNB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(56012099003)(18002099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AhScn5GKagRfjq+PFn21g3h4qxNw1hjvqx17HUuZ7nYKWoe+ZxeSFd7SZa/7?=
 =?us-ascii?Q?TvA6yV/orGW9FUAPI0yaR/L1hdzfpSYEZuANtVmRbopVNYoEINamOq4soZQ4?=
 =?us-ascii?Q?0rY48jgwtdDQBp3JwSS4sG1DbbTiatNQlVyNJR0cU66sr4mDgWxX44gHJDrX?=
 =?us-ascii?Q?mS2ZTKSjQrqMywynD0xakCnawtnMICvVWK83e+nyP8Y5OFfgddzm9cBoD8t7?=
 =?us-ascii?Q?/nJh0Ou3OQWtL+zSp3IZIVQi5gOjSwDMQQvQccyKuZeVIHASzX4bWC0aul7k?=
 =?us-ascii?Q?d/xwRfPlEgg7hhLy91bEK+e9s6eKtuhoagSxeZLhn+cSNmQP9CJ5jcT1/uwI?=
 =?us-ascii?Q?Drv4sSv+D7RBlMedsup6kl4d/A50QUNucU0wA45+sf6AWOFU+X0cEh2AMXz0?=
 =?us-ascii?Q?Sv5pgriGFySgUPXo75/7I68jiUiWuJKh7BbngIEKgQvPavpeziJGhPrQm5AM?=
 =?us-ascii?Q?XlDQNzewMPlYQuJNPGSjG70l0+zPRZ8L92eKLfXkbzX0QuTxU0/gqhS0D67K?=
 =?us-ascii?Q?lcSOFngDd9dzkDpkuLVfPxGtShGpNTLMTj3gBwIBVEkJOZ09B7iFUH3i0x7k?=
 =?us-ascii?Q?xLo71IFPWjrd7qwYQ6XFaMRSHB/kgCeK0ZPPnW4F1Nz5cD6f0Et4jVUAQIrb?=
 =?us-ascii?Q?din5zru/IbdLcJJ3vWTPM63L6pQv6QUG/1KXgcfQHT4bPGIv3OMDQ/9DZKZs?=
 =?us-ascii?Q?O+06Refo3fakfJ3WDHDwwRaALkz27dH8W77TAqeON5db3M/UWP9yrFbaZlJZ?=
 =?us-ascii?Q?vSmSyH3hpFpWe/q2DdMf/KTqezR/Uo+nPEGpVg/9mIhmEGxQ1Ry+K/lfxFuw?=
 =?us-ascii?Q?ChT7EnxKxSwoED6EuZNZiyD5YPuuGmYfsDuIfvpp6CZraGSIvKeXL/GCTHXk?=
 =?us-ascii?Q?APogc/Mc1gHDUP2nJXWKjrSZYgMPobYkCOVrNBXsaQ3N02ADni+MVrOPCr/p?=
 =?us-ascii?Q?J/KXzAGu7JywJR01bJeP0K43CzuGwgrFaP/+skPrIMboxwBC9eBqrHfkV6Lg?=
 =?us-ascii?Q?dwya/vT5MN7iTbRZcOiykH+qTKRkH37pbLaZqabtSdMMURh9MFh7fiCS4pIs?=
 =?us-ascii?Q?VYMWMcd/7+IAM41Ff7v3ub/8AesjEhSdoQFXEb+0l37DNtP60xMw9gzkw06c?=
 =?us-ascii?Q?Sp71nKU7AvH+9XdzhNdE8bnOn3+3oNyWZgh21OFxZJhEFB16rGZUx8NyZL6P?=
 =?us-ascii?Q?ht8E5LEVDh0lnLQ65T6DuCqZ+UhiZd3/OcyDnIfHoVOoXMaUykPKVHUXrdkO?=
 =?us-ascii?Q?WtLf0AB+yMViRePXSzn53LwOu9I1ZIvj6z/6rLBXD+pXlMKHByfw9vL+8pA6?=
 =?us-ascii?Q?IinKWIiHKoe7z+VbPZjcnjQ3mYKbG7jmH/3zVIUH5HF58r5RQ8IWgFRJiTqg?=
 =?us-ascii?Q?waBBgGHune2CK2earjwM08GQdoVu7qzZpK3DTDapkMjOeP2XPh7aUuY/PPWs?=
 =?us-ascii?Q?HyWV71c5Jnz5tKdunMXy53rEyfqBuF2lTPeGHSKNGs7IpTLZTzeJ+J6T4JmV?=
 =?us-ascii?Q?dXgpKwMe2OuEE/JRTzxI6bZayYms3OnT3uJqX7tAK2H55HfY8Ftm7uBtJiTO?=
 =?us-ascii?Q?rbTXPoTdBNGBbH6uF/bB/xRTfK0un9lZPZDSXY+5P6QvrSo0yZST981Nvvv5?=
 =?us-ascii?Q?Zh+jaezV82f1l/cQNL35QlyEcxpjny8C7kVnjTXRIv6Vl9dD62BLKl1XJ9KA?=
 =?us-ascii?Q?9vPApuKsrkrJOvAQ5lM2TLq8gmpVsmky/s4bm3Zh2F9cVL5j60JEePBCVh5o?=
 =?us-ascii?Q?nULXHmrN/RmNO+7GIKiaxoDxn4xp91KalhMi/rY3Lt6XcLuC8idA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de2e43ee-d93e-47cd-6c6d-08deb091b1b1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 01:48:13.3043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6lg94r7kSRh4ZZE8qRc7NdUI6Sh+nIyOTvUEZzVREheqZwX/sp2/gruRgiyNEm3d6PbOkDnvGT2X/7M6Myqs7jg/hk3W8rP14jgqspI0UKKZJYweMqghTfLoqNNCUiB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16179


Hi Mar, Cezary

Now, all user can use deferrable card binding.

Now soc-core.c file has handling Card/Component/DAI randomly, so I would
like to capsuling these into soc-card/dai/component.c files.

So, I would like to handle Card related things in xx_card_xx() function.
It is easy to move functions when capsuling.

This patch tidyup deferrable card binding. No functional change.

Kuninori Morimoto (2):
  ASoC: soc-core: add soc_rebind_card()
  ASoC: soc-core: handle card->list in snd_soc_unbind_card()

 sound/soc/soc-core.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

-- 
2.43.0

