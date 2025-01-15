Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5F33594F;
	Wed, 15 Jan 2025 02:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736906933; cv=fail; b=irTwPjCszLukTlwEebVLsHQRAADlt67G0lAVbHQQjs0baCpNAPHRpf4Jf9ooh8vQEisRe34CeQE8R7Bf/eddaM1rjcS7NEL1xQ3ZLxngkr5sTDrmcpdiWRRVl1XagYYpSLSR7czbQNuI/DNvTzS/Hn/JacaRM4z2hV30QwcA2Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736906933; c=relaxed/simple;
	bh=PW5sl4/untfCq2F9S3U+Ubiw5hjq3uvzjkzl1DllqRk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BQ/WerBcWKcVwepYY4kna+WbSk3MEYHCo69M421LM983B1uBJJKt2+3aTo/SYSGi2rH1fraJtEyU/E3MeNq+wOjNAMhbpFBO6OSHcRvVxlBf7edsnt6eCTD6nq4EiaOYJL0yZlARSuODYFFzG7zgB0/H+ppPh7ZjLnPFB509yys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I/Q5VwvJ; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I/Q5VwvJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xElc/z2wV11GWyWPmApP3sE1trYMfo+Lb7QQAv1DaZ7N2LjH6AmJp5otw8WpptdfyPpcdQ1wfyJeSRZcBDydIpyx/jd9TcBBxfWtEVv6h+BBgVrayAxsbRuWAEZHdvRGGjq+yGKoykX2XnYgjY5x3nKH7VjKJt+d9+VBbywizwGdsW+7ueCul+kEmMh3h8ukFYYUZro6hCZFgeGlWmxlwdF9JqaIwN3lJ2R9Ort6MtaCPDfbDUkgIXnIvvPZtzcJVzuB5aKmR1oLPtRGzb/4FRYi1KhC/Oe37e2Xlp6/YVhLQ2pfZoaHXvlSxk4shRiGzk7ESEfFxRJa/JQOzILZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsVu+tc5K5yk8hbFykMqp6T69c3OTfLoHw7xXd4b3KU=;
 b=CSPu+VtfBSKw/89fp7Ds938m8ULlon9geyZ7G89Fxgx3QwLRRJrYl2cvlChzcX5hTtHeaALrYCyRJnW9CTlqdqCyLTDXU79uybjrvKX8DbzttzO5Vxk6zDVr+5HoCBHNwXnqXhoBkOm7fkhAKFFwtt7md7SvvuiIIFnYs0aZljpeRYU9GIal5J0ztyXkWd8Ch9eQRAtx6xA/PSkCtcnbs0cnDdGM50KksprCMzBCnHyzaOUSJ68q/PhryjkTK3Varqvs/hkDtkw6AXimh1mrdU4JBN3sfhLbg6jWSqFfBa8ums4Uy4YcuyzEiwgsS0nx5yz+9GnA7IPbf0b9aeKjlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsVu+tc5K5yk8hbFykMqp6T69c3OTfLoHw7xXd4b3KU=;
 b=I/Q5VwvJ3SQndQ6reTFqIqYJpzr+//VM3nRT8vcgzCMiABA1IQFhkTPIjAHLkEVZsVFYh/JLiJ0kRmQzwnkQFaxnBxvquYuBKQ3w6pKGHgydGqbnWKGshFWLZyFaCQYKH9Xam7Hv4GM4xYE3Wlzfc/eAJzot+kGDdwT/tnz9lBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB13153.jpnprd01.prod.outlook.com
 (2603:1096:405:16a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 02:08:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 02:08:47 +0000
Message-ID: <8734hkkevl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	ckeepax@opensource.cirrus.com
Subject: Re: [PATCH v3 1/2] ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
In-Reply-To: <20250114215617.336105-2-martin.blumenstingl@googlemail.com>
References: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
	<20250114215617.336105-2-martin.blumenstingl@googlemail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Jan 2025 02:08:47 +0000
X-ClientProxiedBy: TYWPR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB13153:EE_
X-MS-Office365-Filtering-Correlation-Id: abf5452d-4372-4a12-b21d-08dd35098bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hKVhI6tC4gylEqsgu7xSFNr1usTtaMLq7xPVEyjzJwZc62n1UYZNsR2RMk4m?=
 =?us-ascii?Q?BlBq6ccXBwnuCURlprMmQls6oSoZ1e3uJ+s8bVskO3kZgJEpoKgXotzTbdaf?=
 =?us-ascii?Q?Sop4ZgyLq1EOVFu94tLVkKFQVcHlHV2hk1H6q7pYNwTZswmz/uP44jHPGm8v?=
 =?us-ascii?Q?uJATVEaL0Q7jthNlt5fkacEIaCV8Hk4iKwYoP2Nf9joGDkqVCpgXqVja1jR5?=
 =?us-ascii?Q?dT/VY8+bNrCtAJ1Z9jz/j2KsmPlXPW/KG8jIrGJyvQgOqMDztoFRfi10RcNt?=
 =?us-ascii?Q?vkcyHk0NcX9dYlJ2qSnqjiv6bJtB2NVfLYl2Xes5OuUZ77BgREJ0pYSoh2Kl?=
 =?us-ascii?Q?zC5Zbt1wpbxho7h5hliXozTWsBl/s1Y0oJAcY5pvCPXIR0k/jwhBNKZPuZWU?=
 =?us-ascii?Q?QDpGL3o+WxqlmgZ9WKHpOZ99YG5+e+I9v0TyS1Cthjm8UU2qmDKKXwXbNvrY?=
 =?us-ascii?Q?mgjEfTiKVFpmxNavhMBg45KJNjaOC+Urd9+xvfzS7lgB7QiHT1LcDlae2WYj?=
 =?us-ascii?Q?KJ9qKhyU8saP1bY4UJhRJj6p1au2avvNlo492ksVSxsmqq3yrBFzZTl2gBth?=
 =?us-ascii?Q?8EbU2VBLVtQcHThcVugqtZ79wAMu2vk1cmYXlwjDB12NKMukw8FrIkeutqj6?=
 =?us-ascii?Q?X+Qt2+oU48ZAL0rESlBxvZUAeEQHzY7BT2XeQFwl8PRw3sPWgJUCYd4W0p/9?=
 =?us-ascii?Q?/M4JO91aPlq+w5Em7oMU184eHDoQTRSAja9xnCriF78z45Zqly3+rtSv4DOY?=
 =?us-ascii?Q?0VYmdOCEiwzzE09OhL60mmXwZvFb90ssf2NeCG+ZvhG56YydBgykV1GINwuM?=
 =?us-ascii?Q?6VK92fbbQaEKxxijSwbHMMLAMaZx8V2NF/6IPB9N0ft6/xauwWaex7FQEigH?=
 =?us-ascii?Q?+inwmC/he5KiQvBlCE0JKvCry4ZgnSrYG4Yd10J3zTP5itFIExh6Wj0aUweY?=
 =?us-ascii?Q?liuPRevxBxkAfBleLM3xYj9SMB4IxyFvcFblFyRBI6Dy3eCoY+WJBNUUSeOy?=
 =?us-ascii?Q?DCKLy1fqWs9Uz5qWKR54JLyw8/yZ9k7V2KxrqShuNiUr2KJUKO39wbPECAQu?=
 =?us-ascii?Q?MzFo6AUXVSpeUW2kYC0r8PQRw/BFhghZnNyTijm23KCvMbCMvaYfMFpliujo?=
 =?us-ascii?Q?8ETPoiHqLBHgAA1v3KLfZdqORiofUDFkh//16vkNnIvLumWU1vF3A0BiiZpG?=
 =?us-ascii?Q?d46rzi8pROyda/ltHfS8XUdLpLLmsa/PIx2J/dZhYJ8GJprJ83cPMKFmOP51?=
 =?us-ascii?Q?Dpe6FTvgLDz1vl02B0HbT5yLzoC0bV9mQ2qLYnD2pLDysJ/Lub0OMx6UXcYY?=
 =?us-ascii?Q?OtC4kztxKFf4Hk2kNhMwdAcpcqI54ahfo9mqbwu9dseDMM0Wzp83h08EOn2R?=
 =?us-ascii?Q?glZKM/LkxHNJx/JWYr0yahzn4n05wAUgRFfiM6FuwFBEx2DBnitH7U1PEJPr?=
 =?us-ascii?Q?6eP3ObmzzYlwSCn6YoHM4WoSnovjMVbX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZZPVRfvzKAf10MtE/hMRb0kY+Jf2ibPKLRwvAz/u7dRVQsHZkdE67PxxIMx5?=
 =?us-ascii?Q?U53my4YolqA0koSEdlRFZ1NJS4JbUmxaTKEyLzAdDw6GFkIUd6FngNGDOyDO?=
 =?us-ascii?Q?zewdtXd+aoQkyVEXtzWcZNZGqrBueGGk76MFUSBshVFk5w2z6w8V497ob5i+?=
 =?us-ascii?Q?AHlHy0RCjzTal3Z6QHsNVm/j5R1IGFh3wGABtlbyw/INZEt8/WMRGJni5z3r?=
 =?us-ascii?Q?Ut3SxQNu4XcM34QW33me0vUK77m3beAujqkTR1PImvaqts01PTs3GGuO/jjD?=
 =?us-ascii?Q?HjgjrqKlUf8OGfS9gMQ9XaNat1NvSEwptBSqI5ITa3P62/DH+FKgEstioVEd?=
 =?us-ascii?Q?qoIS5hP2PF6lnHo32fr7D77fmTSkml8xCVBq7wm9p3jds4Hwjfm8XtGwrnPa?=
 =?us-ascii?Q?XWB+F4/buTTLq2+tTKHBt47lBcHAs7puoVIJSWUqv3EdvayDDqgcWSLq7N+3?=
 =?us-ascii?Q?UYMYe4HL4jK01W3nyXI7kM/j80mg++KqnXq0GMZ1Z6oCoa92OP3BL+zyjhSa?=
 =?us-ascii?Q?YeshfMuKfSttXA3Td5I1V/5LjiUOohQGZcykTcYzQJ9LWnnb4X8vEtJvdt/e?=
 =?us-ascii?Q?nks6QgCrZOB9ExZyiEj6e8cMGAg7UrjEXPDySXBjWqSDQVRy9vKg8JwofNQ3?=
 =?us-ascii?Q?4dAJ77bqe2EZysYVLmL7gkqJcIF7+h4SuunfT8npYwnY/GN4GJDPkdh43nav?=
 =?us-ascii?Q?8l4c4aCZD+MjAsBeXiMliZnEi7RowRQUZOWYujfSAfeBfJH+QhykbRbnRPXx?=
 =?us-ascii?Q?XMLImkjeXgfohg1FAB70ZPnAOdrfR4vSji0rmXS64JOW+Ew/g/QFoTuAgq4C?=
 =?us-ascii?Q?3i8wdVOtHrgnQoxeE+XCDpUsgXAPLYBeYZ11n4tb33mlMVvsk2lXviEccNMR?=
 =?us-ascii?Q?/f8BjtXWyKr9LTOWTWV+Usyf7IiSWw2S+ix5W1u1MRgPoQMzFIb/UmYYXsQ0?=
 =?us-ascii?Q?i/bt8k3YTKH3Dh4dfwLemc3iPdW5+MFzH3lb5kITYHXuQosrODir+8Gf1wdV?=
 =?us-ascii?Q?IzjDFdd8tv5uWpsJkKf6EYtmoUEnBvfEzVtfRLJKvS7n0Lt7BaGtQa4PcFYS?=
 =?us-ascii?Q?qfMl2/gF6yUTPPwZPR2l0X8VI+2YomQgnAEFDePmTtkbzOfKD5jVNfq2kklb?=
 =?us-ascii?Q?VCCIcYtXxQPZnS0X5Ygxdbh54yqjEQwf1dXrMTicdZYDQZc8ypIJvS9+FUsQ?=
 =?us-ascii?Q?OD+l+z67d9btbgpuM2tPbiuZ/IliKk3Yu3kMkJfJRctY/arwhQDqXaArR3+v?=
 =?us-ascii?Q?UJ8YYQFJ8nrQPCcnNq5AzjuSRjwgR4bDdS5/+gjn/dhtsYuoev+rkWZ4DpIk?=
 =?us-ascii?Q?gjrMQXSdwDkF+hJVdkNfZ18YEkCIgPNo5cBUVXRnixLmZK9hdkqezrA54QL5?=
 =?us-ascii?Q?IunNmXKUU2n6GfuNGJhV3APkvtODPk2IotP03rmJt35xVEyX1DSyLWs4zsIc?=
 =?us-ascii?Q?PI96uOGIdVrnSlPWFVn2j5K2yg33VpMyUUEfUvBgSLMuSLaU0XojLcbzIqH+?=
 =?us-ascii?Q?burh/UVMovAt0u9xVIzLd2aWvoQ13S0wtKoy53z+ZYxP8DXBsjdrYvG6zZtE?=
 =?us-ascii?Q?KBgGfhVayR396kdTalfrH2pbxNLTCibkkhAaGw64aOB4QKC5zndXvUrqfCu9?=
 =?us-ascii?Q?TBLsXNOd1/7hYhT4xizTDx8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf5452d-4372-4a12-b21d-08dd35098bcf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 02:08:47.4518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsWiKTUD7Z5IZOl5sPYBTzispGswRtVn+5o2YiisbqeZbhGr9C+8rmzCuWa5vqwsJSr2Jz/TticzkXlDNzEqJuitDHtkahYhj/oJv0hBEcG1ZdQw0wXMHmnABhOAxr1E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13153


Hi Martin

> Add a new snd_soc_dai_prepare() which can be used (in an upcoming patch)
> by soc-dapm.c. Use this new function internally in
> snd_soc_pcm_dai_prepare() to avoid duplicating code.
> 
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
