Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464B33E373
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 23:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780960373; cv=fail; b=JffbNNs6iissFWeiV9nIo+FmIReEfb7zzRmdFJhDsyyTNRALG55dbcbyHKjMMrJusJN3nXite0eNynRBbG3T5Xwu7a94afZlNMfZr4oneZI5wr2R/Y5kDfzZBr/YfEa5OzFia7J+dSTIGLn+xy7yegB0a3YfCTmLByqDuOYQIrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780960373; c=relaxed/simple;
	bh=E13tAA6zSE/lX8wHxMFBfXJfYVonyAX3N1H48GlxPMI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=E/CLf5jq9VBpHD9DP1m2oxRTS3iaZMeb5o/o8/8uNOy7Kr9hrdhyYmvqYsPAEn96KfLMNaTUKxBWqgHu0a5SznomE+kVPKgJv0ujPzL7cSkvObiZFtVdZd+UDUd3LByoLfcXefI7wKnCjXFeRO/t3kbvWeWsjUMn08wKMQh9sMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WQzvFBUB; arc=fail smtp.client-ip=52.101.229.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WQzvFBUB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzWYTtUfAOSuTa23IB1NxRoMyR95FD60lnITxqq6ydIeLtW7ckM7+UM06aA9xSvcIZLRa3hwuQHZTy0CAOrgRr7qFQU6eOyY7C9a4ndfvwJATrxqNkJlIVMMiAnrmavf4pGuFMsqcmngzlwAUnON9uAqKK1OyUGM0bonqEQqnBD77Lp1C0s5GVerLJWpPfcjU1+iApZH6WbZCsYmKgxOTnZIdHZ0RkJikUTnHWv4wR3OiHgpGBrF7ktmD9tEd6VREZYrDlAdDnUkqBCjfJU+u2hflqv2HhLyjPMC2XG+JztE1vPl4b1hVamHJlUsgtyvq9FOfE/cx7qyg3sCWohmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E13tAA6zSE/lX8wHxMFBfXJfYVonyAX3N1H48GlxPMI=;
 b=kF//9mrgGn1YdC8stPcizrOeQXNMkl8B0mH+ecyzpSPjIzlqcG2GFcg0d7WeVvdXDCZ0PWyFZZ0tIV79bFLCcT+2DjjY06tfCrUWqbR/LLhoh4mrXBi6fa2BjfWfs4vPktx9Iz2byl9VLhE7mX25xqxYtV8biKP5eZnjwQ5VUmeplUDoAD8M7NhNuyNcNBnPQMMDY9gcW2f9WqPD8IOkMI+gNm6eNJiXqcVKHzGyfRQ1xc9uf4p4WEKn4LSUyx4MWHreNS9mORuc1YmtdEzV6EjviwuQV0cd9MbBq4H2EeaukGGnlSIHxOwhrOsj4A3G6Bkx0ktDaQ3ZliO4+oqtUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E13tAA6zSE/lX8wHxMFBfXJfYVonyAX3N1H48GlxPMI=;
 b=WQzvFBUBiYVUcafRI88b2CMdsCMSE/g0Z76LMv4ng3+jsK0J5ig5G4HhBznOGBMuWiYXMOI8ZNPKeCijZ8kEIIWx5kIwisIwmjf+ZLIHL9ope0RKyE7DNPYasf3v/hpyDnjx8AT2SfOY3UjZAW42exVnnNfUpyS9uej+W0QQFa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OS7PR01MB17471.jpnprd01.prod.outlook.com (2603:1096:604:439::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Mon, 8 Jun 2026
 23:12:50 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 23:12:50 +0000
Message-ID: <87zf1439uf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Geert Uytterhoeven
 <geert+renesas@glider.be>,
	Jaroslav Kysela <perex@perex.cz>,
	Kevin Lu
 <kevin-lu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Sen Wang
 <sen@ti.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Support Opensource
 <support.opensource@diasemi.com>,
	Takashi Iwai <tiwai@suse.com>,
	"Uwe\
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 2/9] ASoC: codecs: framer-codec: don't use array if single pattarn
In-Reply-To: <20260608153300.19716542@bootlin.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
	<87tsrdetm7.wl-kuninori.morimoto.gx@renesas.com>
	<20260608153300.19716542@bootlin.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 23:12:45 +0000
X-ClientProxiedBy: DS1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:455::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OS7PR01MB17471:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e9dd77-076c-4b08-b257-08dec5b375d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|4143699003|56012099006|11063799006|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	k1U+gBbATvpPxyXmnzXrhxavRt8JG7qAc+1Pc1bl0mssvULsZ/zZZ6bDhUG4029WcpZN0Pi7pBC1YuBCndm5uCH7C+g4f9r3uKCbbMBUiAe8zWZIPi00+UqzQmw6Vc9d0Bbu9zBTxlpS/XSWD3pmqbTvt+tX+mxkPC42D5deRHNBMTPfGsx1h0CrZjhWpszNdLq/bDRODDmJQiTjFwKQ4Z/Ed1RBORgyY5ZXsrEAQ5aoM2IDUfE4Rqc7Mzt1+4L/1AaqGTtjIs2wp+Kc3Jl18W09Hf8IxJHSMT5SRV8oiEUTRlRMtrhsFrhoezSEhp7Wi8gUchcvx+22RhkRUQJNoYItUvYe/h27X1ENvm1IX6gM1lIPv2atNr3ooejGVnzmccs+Yhh0P1gJG6fszq2xvO85QG4t5s3nT4RXUG4MOEOM1tP3kVyUIzPRZLznsa3howdUdNhUOuwYEGkAx0TRcFAsDjoKlphQhSl8cuYf4kn/xXuOxAt+dfh5NOWekuPLsXXlEvDeWjLcR/99XPyG+5aa+bUHsHpg5AbEfPKTTwIpVNRcB3iKbFDzcI2EZCSMR7M9NaiQjgkLrE7zp6qxeKE9uFBh5ugET/a8EUylnqKNIOUPy0IVszzpE4m2uYmxnxkqeWt4GWjN1DgWQU+4mLSdWHiPj9Izd8koLFAxx228GVIf+3MjjeOz9MqOms1SZ88ONBaIc8iNGwDIBDDOQTtS1lC/H6mZsvvJ8DrI76/oteVwSl25lAUgtXPJr/g7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WKX5H9oNZgVXo/0WOwAQtQhkLdMANJn4zdP7QGLD9qN2cpufvl8m4EYsAkMG?=
 =?us-ascii?Q?dHgQIF1rv4tnuOUcz7ZoG+THEyqf/zI9FWT4Ad3ZMn1uCsxHP9urNJq6D8KI?=
 =?us-ascii?Q?NyBas5mW+TgchdWlLRz8GHUTZmlIaAl0v1SA6baXf2l7PdJX5AZLxcrYp73E?=
 =?us-ascii?Q?/2IYVs4+bdKAvFccKPcglep7P0hpQyGm76k8qR9Cl4XW42F3jsQJnfvCHrVY?=
 =?us-ascii?Q?QGx8acEVitLWSibM3qrEcRR7Dzibu5/PoA0GLKK0QZXGKk65CBjqD2YUD6Gg?=
 =?us-ascii?Q?aT3S88FDqw/fOCPQB1jwmaFKkeyAAKqAeiphcRjO7BsFyd0Zd6AgZRMprrkn?=
 =?us-ascii?Q?4iVtxqgHswQ97S0Dn4N9QJn5F36y1Uz6LkvtlxD950dDcLX9yzYK7FPKqsCk?=
 =?us-ascii?Q?6gs8ZFCQH8Z5MHPOdXiSWrdAxoHdwpVTHQSO1lew2eX4I2abfzNAoQEqa89b?=
 =?us-ascii?Q?E8XmV52enxSmMOCPtbMcpe1TnNcmf0OOLvEmc3f1O3B/NK7GjL9KTAcwSRn/?=
 =?us-ascii?Q?d8fgSgsIa+mjtxpd+k1kYEEk8LBKnjyYB1Cx9Icb3mIMpzMroXPyVOChPNZv?=
 =?us-ascii?Q?YMQUT02hYKBUYf10uzahQE5lplnQf4ir9GasNUqZjCj5gdhoyQEneVfZQG8/?=
 =?us-ascii?Q?QYuBu4tZ4H/eUs1yrh5AayttY6X6oMr+z7uWFsWZDxXyMbnyP7jEj5Ze1wYJ?=
 =?us-ascii?Q?qjqcjlYQqS+mirPmrVCSjHdwIhkM5qwA2xtcBseEHSb8E/WuMvqdPkXuaQyL?=
 =?us-ascii?Q?3VaYimsllTQPobbxY8vEPoxZVNktrMtxa3dhuEY57v4rk4h1n0Bb38u5wsFU?=
 =?us-ascii?Q?Aom11/6jAnEADl0a+ALLTR/7YNcSwVpuB16MI6cFgzo+fd+ZKKMDWAb3Gftu?=
 =?us-ascii?Q?uz2mw+Lxfj6stSoxjBqn65TmImdQi62++y/A6aDtA5hKetbVJcow1iPN9rIs?=
 =?us-ascii?Q?V6ze3WmLbIuZEGzeGTN2skWIZKE2AHHj/NnqjNuSXUuwcL5z7r6xibbvBlJA?=
 =?us-ascii?Q?Q2LywG0ZSrKm+gAdLmiOH7IZymkfS/VjsNWam/Spo5WPZFCHG+RiD/MI1UO0?=
 =?us-ascii?Q?fEjEQ03V8An5i2rUNkYwbQR1sO20lycyDC0uGCC6hYC1+++aINi4y1a3QsBI?=
 =?us-ascii?Q?84i2nJUVSxSt5VQCYBZvYYeTCBRhvMiRw8CPRU8ydbXway2udDzNiSnSrQoL?=
 =?us-ascii?Q?i12IDqZgTOGXG2YNOl/QvGQab6vN5sItfM0Iewd3nJSZA7v6AEPDrtSttkfC?=
 =?us-ascii?Q?5Hfsl9MOy7a1yrF4xUwnKDCez9eSbDQRDhJ0BAZdDtTt8ZEKVcUnddcVaRZj?=
 =?us-ascii?Q?TaStOsjyCO5spUvExa/2f4T+qsm26MBxL8lrw/O3AvO+x0PKtUZI03k84aRz?=
 =?us-ascii?Q?LSiSgzEL5K/9yocNXt3lw6WYSZCHUZFvn44htHneoAOrtY8vOCKTcKKnlcXv?=
 =?us-ascii?Q?EQtQ3K6bkhK/npNTDYoiiVOrqxMNEiLvleXQ2Tuv/PdINC9ixu6daGbcqkm8?=
 =?us-ascii?Q?RgXVhr9v/whHcK4OiVkuSeg7NgFpN2/HKH0xaa0kA4GK9w9m4n9UVbJdGXfa?=
 =?us-ascii?Q?Ig2ul/8e+VopjVteasje6U5OX2y6eheXupPSSLLrMa7I19/sSTxRYyl0X2gw?=
 =?us-ascii?Q?w9aH2aEbopXDpoX0tv8XMMMbDQNLxqxslr3bexyYYCflxFNBNM+fWZvSIbgq?=
 =?us-ascii?Q?mYsNUDAw5OcpnDeTEJSBhO+A+waFWxXx1nZAwTwSnbzFblDmTkK38vtikf5+?=
 =?us-ascii?Q?2qrNImZ0y+ZFDlhIx6HIWV9p793F7tTyU0f7j/jsBDmKSTfOWzef?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e9dd77-076c-4b08-b257-08dec5b375d1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 23:12:50.3739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AY9eGOhTT94zlB/YTbpamiEWoJbgNDeFxe/BDmx7h5C6Y5lbbwLuEM+HZuZhK/c5yQG7JkIioPL+2y0Q+r+ez6fQX4hXb+mvQ31mGGIdlwaAPBsYHmJCgtXmiKIK8l2v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17471


Hi Herve

> Still the typo in commit title
> s/pattarn/pattern/

Oops ??
I have updated it, but...

Thank you for pointing it. will post v3


Thank you for your help !!

Best regards
---
Kuninori Morimoto
