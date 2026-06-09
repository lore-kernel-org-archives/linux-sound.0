Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1228548EE
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780965252; cv=fail; b=cUTBiEGBxQnWZgqkR6coxgpm7HAAVXebPxPq3KFtcD7DfIuh8YsoiwLUTgfyzwAYi6cF9kB7DoB0p0TJKZZ71rLBUSEMK5U6zE8iMmCGto8Kgs4bPIrKRML+7EypndnucUytCJz2FdQYouIvhf3ryOHvok2ldV7K6oJB1aYcCAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780965252; c=relaxed/simple;
	bh=s1SjY7yyQ1y27fAsReBSPUQ25l10NqEinRDby7MB12U=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AFtjadHvSeO/+IV+4u5LVxZKsOvQT5aOWcAjx3ECJxKsVy4uFnTEqLMvHh+I5b59m3oFY4qcv8BcB5QlPLtOZG0ScXY+FglPNLjWe21/NJ5JfbRbLtc5p//hrQp6HKKknjaW7qEb6hm+0Llh7D5oFlJc+ltOzOf/5rbkEKskuZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=G2qV2Fz6; arc=fail smtp.client-ip=52.101.229.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="G2qV2Fz6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPDQ8Uz766vmsuA+QYc5lBtHpeUsB82cdIx6eeifae9UT4Rg12sReUOkAxKRZy+xvl5jIMswyWyHY8xEUvEYSJxAVKeBglzHd+o4mtN6zRgeAVaR0x4JcG9FCWrMv2CzBhmMI6Y9dZz2Qb0Bd7gi1rS4o5XQbClNnBf6d6qwdA1iy+s1FMgBakPeG8WlLO3FMSLqgRhqruxenAz7+WuiPq3QBFX2G+RpM+SIr4VYvW6qA8hPqpKrsgJcn+CQKboexLoaDMgp37tKxjgmBa6EwAtSlC1673MgM2oirkCO8sAC1/AdGN4GW0Lvo7uDY5XIoq2mDRzocCDmpnvIYW/0uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vidA4ARxzFzUvGWqLKkhmdkeZmD/A8M9xQC445IfvEs=;
 b=AXML3cyMiVwG/K51wpCrUWGpyFxk0fxZXr5GdTYU3VxUyChZp+395/ivO7FZe2on59Kvta9R/++woE7qV8NQsXXxHc2cKyPclefs4a2G7dtRm+VyR3q+ZKh7wRHkpRNFteTwXC1kgNGal4hji2XTW8FlEILqhrQU+BRfO7TqSssT7wv4WGkA6mYFO0B1PBI/KXbw47ekxTL8p00fMrJBY6ltJ0x3RF1JCihmFHgqxLKTgYm+GWF13E0BmCY8CZW7OrEihJTFef+LlM9RnwHq8XjUu6ZBBkM04ScvPFfzrk11i5YytpPUEjg6LdQryXwZQuRdncLqTUNgeJrxWBQnDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vidA4ARxzFzUvGWqLKkhmdkeZmD/A8M9xQC445IfvEs=;
 b=G2qV2Fz6UWTHgx1tOHV8a4QlfLnGyGWL5Pumv/Bu+RV8wgXxkcIV22VODukc8YLBAJQSiP68icw9J5tqCBrrWcNKkI5R9r6ztVft2qH1g13uIRnwih2zkApM8MHvqzMHvL0Wg91sTTw2tDXEIioQ/XrMms+FL9ia87k5IaBc+eA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OS9PR01MB17156.jpnprd01.prod.outlook.com (2603:1096:604:458::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:34:08 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:34:08 +0000
Message-ID: <87fr2w362o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v3 3/9] ASoC: codecs: idt821034: don't use array if single pattern
In-Reply-To: <87qzmg36ky.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
	<87qzmg36ky.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:34:08 +0000
X-ClientProxiedBy: TY4PR01CA0104.jpnprd01.prod.outlook.com
 (2603:1096:405:378::9) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OS9PR01MB17156:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b437fa-ea9d-42e8-c4fa-08dec5bed199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|56012099006|4143699003|11063799006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	YXmvEhjCQcd33iTTekk/sAKioE3viZXxt47uE5IWz9AnwjIeln0m4Gd47JfVPhYjIyiuvUhD4GqMV4n2NZEW/IyHWdp7rXSWxJC8Azx8I5AOh68d5DVJRsUY9/68M1FoJK+Sdr/bvRUKabuqnUaZn28KNx1z5soVBAlVr9+XhNL6XhBKW3mm98idtopJ7knDJKHD9lMueVnJde74b7SAlFw8rTvYI1diNUr44//eYAYdbteOuawc6YEzKYkKu+HuiimVtACHVXsEDJKSWY1+e9sfFj807k894lQeh04v9YqccjnfVtmBZctPt4bonTmjk65MpX5B4VywhU/mYT2oFw9IUG52nQQ9YrBMj6zcwphnmLNSKsljeVssIL10Ve68Qj3juWz1Rw7gzPQ/MzbPK8zsxbv3L9EuqqXWCHDIv0gVPdEgz5KZZ5pSOa2O3p9emKZL/dehIDOsDtktPKeGQuoG1hG5GaDLgE4UgK21YQ4Pj2KW2MURnx3+jQHHJYAjsHWxFZlnhiLwd9v0vOJflZi4yoPTLK/5nLonHcqvx69wb9W+JXRSRWUbuHQbGMbdnqZWIBEAqb/tylEo/4vtfIjVnsUNLqmWyGzNaOor0o04/jii3rctyKxzwxb1Q348v2jBMnTyvkRg09czO4yeQ4wkjEN8l9Nx0zijqfFPxeyTDM2lJHq1qBV1p8qsQPPwBGguOSG/6hlgfM4vU6x4qTG6nfHTwJVZB96oepiKmCIoUAo+/vdhEP8AyeLuXIjcD2j+S3UtIuRrmRBZwRNwWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XV0qfCV+7/ijDh1LV19GqQRrpxQDD8vSrZmh946srLgoYIg/dic5/mkCBBAN?=
 =?us-ascii?Q?nliNmUSu7Oeqrfs+sHNIzDWRZQVi36HjbwNFbX2nmoPwZrD9rs4cCHuIiuxD?=
 =?us-ascii?Q?/DisCbCKM5ciG5pDLefGxELq12rLdKuL6EHSfbgLfHNrFBP11YDU0nALZonh?=
 =?us-ascii?Q?+dIE3l2oNxH6IJJSKR0wQ2Aqx5m0opEs8PYTqF0R595b4jX9JFVwjrFYGPkY?=
 =?us-ascii?Q?07L7dGW+1YthEEBTqrVfX/v6cEmaECfshCEvOVG0F/QlcZUmKH9pqmCNnohC?=
 =?us-ascii?Q?WhYF5jz4KRfB5KP4O0rlF+Ex4HBVSoej+HOpBZGpGGJ/trQtNn9tOZ6qgdga?=
 =?us-ascii?Q?5cHwSwAWAkjrLLFWckCFdkf5k9aS4OC/zmFAlzl4VXHcCZJXffJXSGEK2jEd?=
 =?us-ascii?Q?P82agMHn2scvFG3GQYgH2Yrc7MBIlE9tbP0VJKWcXaowKHUbjKGFrz0b5c+C?=
 =?us-ascii?Q?38X1OlWpVbOLn/uTlGnzKEmKKjCF7/R15UWe+DsH8IfggymEIY1Ah6If3WRp?=
 =?us-ascii?Q?JpUge7eqtHnQ5RK4KzNZ2bvu9xCCzpGpbF6qSKGaZvIQ+ppgFWkHolUiHgm+?=
 =?us-ascii?Q?NnNyCtjeIYeHGecKsDfHBufYeg9ASJ8OA9uPudXm7KS86FGEXbwW6EpEP1SZ?=
 =?us-ascii?Q?eH/eJHJYvJ0YfFqfgCsUZIFr6/KSpU+tx/QqK1CANj7+5Br0ez3uXsPn7uv+?=
 =?us-ascii?Q?Mn2twyyLPbEuQWyfarvIKHoHB+gwv4syC1Ikjag9HvQFLqzM/e5o8moGj4F+?=
 =?us-ascii?Q?1sT0nsExD5BAPCA2XSa8amQ3PYFpYuaiX1cT/+P4NL1/4j7ZYt1EU4g1DBbt?=
 =?us-ascii?Q?+fBfiIcw47Q5Yb1OzHg4qqyH+csYkSujxq0qdI7KQtoE2mMn+iokteALXt26?=
 =?us-ascii?Q?wBIrRJPBCW4jkyRrXNu06xJbAe3Jg+dziCTQrvwT3cQa8fLqWt/f/w29CFlm?=
 =?us-ascii?Q?Np7gVBZYpLyWI+EPmMQ+d1kO8vqb4zCgr5RFpN9UXX2iwHQS4tjN7FXykd0+?=
 =?us-ascii?Q?COlf/t5tpFK8nOqB/jUFLeXeER1mvnwb2wo7fGNHyO9+uE6qIwic9yMdZrUl?=
 =?us-ascii?Q?1/Cf9uYyro6hXI4WFL0FYUF0BoiwYpQtgPI9wk4wD2la2NcrFz8mYEVDfsWi?=
 =?us-ascii?Q?3tenWFtVouzbU+iYr7XVR4EkvMuQxKrBLry8Oeruir8CllYQ1vERhWMKSpdw?=
 =?us-ascii?Q?qu5j+4CTsL4o8bEp8hDZGiAfEa5gGi9DFzl7ger4Ly5sZDMnWSOEilKTUyOm?=
 =?us-ascii?Q?KLPPeLO+iu7+ZYGakSVw8svfeO8eQ1EillYgm7DVMiY59mFRHUtBotYVN9je?=
 =?us-ascii?Q?UGBsNx+de7EgDzZ5wQeMHmxzknmPNGEJZ4JVmVwosAFvc2TWOQnGzBt02m1i?=
 =?us-ascii?Q?gpKM55ZaNPuzTfvdd4UDSKUTptYMDtY0lXgAXWMXSglA5CjZDXtPPJyqwuKe?=
 =?us-ascii?Q?xlFNMoHvWIsPQMXH0cTW55ctPnpQqbPqwzaWtwCPn4nF24X6UE9ssUl+zOmw?=
 =?us-ascii?Q?TA/uKWyvs7Tmog4UOEw9JVHRR8TyjerL0fg8GSM/TaYSniqBMaruouJOl+hN?=
 =?us-ascii?Q?aeIzmKUdYqPIkbGM38CXgAETR4LhgfUggqK1mJNlILwhbpiDqqYkPBFmVowb?=
 =?us-ascii?Q?qauidSZ/t0R3wbjdzZZ0XltDBiGx4hjavt0HMrAOkksxMWpjqnVjbS3Mibwd?=
 =?us-ascii?Q?6W0kNXzAB5Eiuk9p9dcpJYGeADDBy7SuyU+uLl/0b1G0vW64+8dAGTBcq2Yo?=
 =?us-ascii?Q?Nh132zdX50LEHOh54epIMvtUeQyhoL11uYXna5psLFd4qvzNwH20?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b437fa-ea9d-42e8-c4fa-08dec5bed199
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:34:08.5251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EvPaZ1MHr3LLS0pZI9USf+cn676qD3qSW4lSuiTivj3Ajp6C89vQBSF4K5PIumpjXNOpT5M7sL9HyOzlPt8e0XGv9cYjRMLJ5rSPzlomijbdFiCitDy4twa9j6dFCzD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17156


Hi Mark

> Because it is confusable during debugging ASoC FW update, tidyup
> auto format style not to use array if single pattern case.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Sorry. this patch already got Reviewed-by.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto
