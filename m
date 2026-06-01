Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA0B640
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 00:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780272088; cv=fail; b=gJhyZMr3eJ0+BrV8fRnOM/Pi1LqV/h/jTIQBukFS6uwLhSlQ+YtixlwtoIcHqRujQWoTDdNZyxcnQOw/sOAR/T587kXOCacMGyK+42B6hK533d7pfyj5elejPqRJHNkDSOgjKIn/N7jnntwGvy1kfGhbCNGKl8U2fhKwb5gPfB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780272088; c=relaxed/simple;
	bh=5RG0z7KXqRO6QIXHjJBndZTDWIbUnaNatkC1df6gvFs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UBSEqjkgtt7LqiAUwsL07ZJrYBubfhypMB3JZPgM1/YqjxdOsXkd4gbZvn4MfOS+CGp59hczQ7u3qcvFIohkHT9SN3DQ7JA53Z9aeeMFmgV6QDC5OQczQj0tdwNmhX1TWvuFMWkpGrhtDiWPTIwzvVt1VC4uPfiQAwnP4W8kw5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AT5/1+nQ; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AT5/1+nQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b77pntcYYfq8KfrK9rdnxn26Wz0iunO8y32z08Hwhv9ov4NNSR5pIy5fDpJObUlEHRf0TUcStlDQ/CPN4qR0tgIxlvjaVNJGiX4eZ7Bmm3oiNB4zPTXI3QqV6zjHy9Dub3VnxSYmeKcEPwObdXeBCrGeLQGLTBXji0tsgGmBQ9qt3qZaBtXtrArFxAetVQIkZnawQUIT/S5PeWyZNk4iT8k120h5vzxDRcc1M8FHHA5sUg460crMg/rlNNZ1fwXORznMHNVGrZWUaAGGqRhjNN9Q7qJwJylV0Z/Rkjx64Ybi9G/vti3l8VK0LoP6cIYbjHhZBNF7DvwRYmN8LXJWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsGJysFjIML+uD5SITkQ0g3HPAylPsFCtNfpF+Uh+hQ=;
 b=vFuDgXoXSmYqWuImKUoCrcBldyM7V7zqoAbIJBR/bB+ujwwnPxBhp2hWdMqlpOruzeerNqz9qD/oaQSZdPom3tI2lBO0sGXpYRQAL5VtbHIVWkyquogtaPHxr0hX3UdYOvi75BlONdh4rmNxjYWtYkRTGct4P1dEWSp/u2ab1TUg42fPPCyZp2w3zMFqwdiMiJGuIkj/B3TlI7YSByFWmyATsCIqG4oXRUdehPCFKF/DasUgm0vZVzcBe2XIe2eMbfqW45CEox4yC2JQuZ/ZnTo9a+Tjk83/zqiauvl0G404xEXZgj2EDBdR9KgXXFBBW7p/4Zww0n6jKN/D4b32Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsGJysFjIML+uD5SITkQ0g3HPAylPsFCtNfpF+Uh+hQ=;
 b=AT5/1+nQ4uJAGmEj8m7CjwTi8jIxNWjhIwmQ1qBZlfC7V3BIiETJ17OqW7r8n7hmC+97YN/UZIT4Cb6hp1hCZu5MnQjvFF3qWl9iDblzisxukmPKKJ9KbYu/XTyF3OsdvhhrEUuHsu7TFE1xQJom/APLUgk0zvg4VaFcqPF/jp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB8695.jpnprd01.prod.outlook.com (2603:1096:400:167::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 00:01:23 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 00:01:23 +0000
Date: Mon, 01 Jun 2026 09:01:23 +0900
Message-ID: <878q8zb030.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/83] ASoC: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCPR01CA0180.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: fced25ad-ba09-430f-d90a-08debf70eb10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|11063799006|18002099003|56012099006|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	scOacQ0LKn7/Vt34//diEfNzxnvyuMS5AYlJf2v6El05BUuUBWW7JuJahUjx9KClKTeVTaQ7NfCMCDp987SnecjajU6qmgjb5EQcZhT2eeVFPpHTNpWcUxwT7vdBhi/MRBrwnKGG95ZTTaAY2A3HxHMDnDOHtXL2bebF6O4YfJ4mXGr0qy6yEYI+YOCEN/Y6TzrQLCQ411aZ3Pmvk6iUMF4Qluk6OTQcnoUacY1od1tL7W6qWVv88QmH7IljRB7i4gkYZZM19h0st0aJBiVKEYhycJF2AaCI1HtoJX9C2+WLjoFslijlGD6+YQBYd8zKe+fpMW1x6aF0twPPCyYuT798K5qI0T67Hf9Wvvy0Z84h8oSo5h4JKvf+LMMyQp5aq+vy+9ZzjbmPoIPe1/2JARqsp0cS44sTOmsKuTdI4PEtU7p0Itp5z7+HudYjcqlYu6uRmWz1Qh3MdYMyHzN9ocrkcxrjVRYiSc3drVvnhWVS1zXTFa1UJton6nk2xfMp5uOMVylESwA0wLrEL/L1R1DN/Z79OR9+dB84HMP9tk8vqNO35rUKgMZqaDVIODXLrcZX0NdMtFFOjs3IWNNG0yAimzQLaZ375VogQd/LZbRKkWnqEd0aeWPX8ll4ivE2XhtQAZgBGQzKT6BFlPOV3N9et1zGIngAFLRhe83RKi14XMmmkXAJ0H9n5ncybl0mWH+PIDWPVRHnmYT92JE45yCW9teJhxRxUuru5oSi8mRLcIY8Do16w32s5fy721CE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(11063799006)(18002099003)(56012099006)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lg2jmUM3AZlDtlbNFTZwe6gZ/ORBqJPws8Q1ln6DSs47Wk66RC7aq48VuInW?=
 =?us-ascii?Q?WnL9giSKQk44Y2Z90tD/JZHpdti+sH/TLhmOxji3n3h7MqQU/JK6HuC0uNNw?=
 =?us-ascii?Q?guaAnzRHnrZotRqONuA7dQZi4QtCDlHbpeG2Aq85KSHx3XSZIfpD3Zo5JR5t?=
 =?us-ascii?Q?OuiH7KMAl3//AGaw45cCgkAJGWoOfCVRVePXUsKDo7diHkjoSP9/xHmeCw/z?=
 =?us-ascii?Q?slMjNpAPXAR3gkrFuy6UI0u0loZgJ+JdsfahaeN2en2E3Hdl0azy1GenPxV7?=
 =?us-ascii?Q?lntUzCLjmsHRdNMcJHNaAlwOpHE6oAqhPRj/LaAhlfUUMOySCuuxcHQgtMJt?=
 =?us-ascii?Q?OpVQ3kFFMwuluxynFvDND5/ORFcmSvCyFH3tMoKDglmYTgym/jyDVLdiXoOI?=
 =?us-ascii?Q?Qg8J9DktNtqELW8AysHA/QtTUOoYzIAUW6EqFGPbOvA819K0h3816M6cIcf3?=
 =?us-ascii?Q?kvE4pVxmzIEjuGFKFi5dFwJ2vQuo2UKiv73WlQBRJzqopYYvu/Ph16Xifyco?=
 =?us-ascii?Q?dxMs/W5/PKx++q4NjQUu/8T1l3A8vNySwTsNVUR2AK0vI4GjJOld2xgeKsHe?=
 =?us-ascii?Q?ExsxuPDgamQ4uCE/EYK4oEiqZC3sFLqtHZTjDIhMiSCIjiSD0Uohezlzc56I?=
 =?us-ascii?Q?CvyuiKAnXe60Ns8XuGx2zZCePwhBYx/5iXvyCHhp+D7ucPcyE6O8Jeq6XAQC?=
 =?us-ascii?Q?OfgqhjETXAw7Cu0RuthOmdzPnQQIxs2NGaudBhWvFT40dabHuPF6VmBtudWp?=
 =?us-ascii?Q?wmK3H8KbUjmI0thNIcuQx9yt/bytvkHgvwlGyhbDkNh1fhuZYBK19uqpssK3?=
 =?us-ascii?Q?QVOkxcQ/sVcy6YyG3jXsHm3aE5N6KAxyOlQw6dmIXLLAZhHRh7/HnxgM6BZH?=
 =?us-ascii?Q?zA+EMysLh/sxECdJmjGS+urBSooV4NOUb2gIqcr9kgrb5+QS5Di09uneqRpl?=
 =?us-ascii?Q?lEjbrkeGRKK3Da5UsWh3ulKl2ZLITydcA7vBze1PMoixwuyqa8ztZu72jHO0?=
 =?us-ascii?Q?RyM+cgWs/MpeYY+Ch4OXVNryxum6Jo+8vm5XtPJhdw80MPIgKF7OcVqrfbGf?=
 =?us-ascii?Q?CN5S0jTJhZcVBsBCURsXsy6BoNURnpY07yXvASZOpd/Kb+b4tV9UbfzYlSJu?=
 =?us-ascii?Q?MMaAME/2Zf/cp3rkqvJUkKY7dbeLxckkzvFzzDf38R4YGuHm4i9KlPnRTcVk?=
 =?us-ascii?Q?GWnEWoQfR8dhME3R27IWGAF+kXt5QyKvBW+RwP59Up4dEW3C4nNPYGD7J/9/?=
 =?us-ascii?Q?B8z2+elMVkqUoSOsYSylmvrCKj+nFYJnDW4lcQpzf+OP10IzhaSfzIdioON3?=
 =?us-ascii?Q?0m9uIZpN08EY8Cn57XTzWCXyX3+KPepnUiE97PU6avYaBbF/N+PLqojfdUJI?=
 =?us-ascii?Q?UtBTYuA/hMApjpHZrPiIAhryxN/URRE2AheM71qMeHqP5aCL4Gqz8XmAObLj?=
 =?us-ascii?Q?2VgNtmk9AHD5DxuZCzrDO2Xxhbk9kZ9lcAG0SK0RraGzunW2FBC8447VMYvn?=
 =?us-ascii?Q?EexP4daQUqCuCN8ckiL2Jlb8IIZJM6E6TNH6OmkLX1DZHoNEbkxLozJpUwHi?=
 =?us-ascii?Q?5sIh6dLz3DMXRHum5b/IIZ09LJ+oFmSpWLWdQAr2MLpnpEvbJAC0mTBf55ar?=
 =?us-ascii?Q?7cBtdC80CoEPaw2zc6jnLxktF5WxsuEvfeD0bZXwmbzvB7OjEJDI3w1K6eD8?=
 =?us-ascii?Q?FHdM82YCcCbB75fklSe1nPUKUnxdqFSh7E4vetZWycKtDwTqX67c/ENytkIA?=
 =?us-ascii?Q?4hGPoBAAptgEgt4JQPR8dl3Y0AtQdLQTxKM5/25NVK6xf8PCArbT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fced25ad-ba09-430f-d90a-08debf70eb10
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 00:01:23.6025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eA1Uyx8etct7W6AzCoJZl2JttG1q7E3mEqDPSsCeCMwFliXB2pKzG51ekliQWaviALkHdjHPnjcjAkMkc0s2uPv2voZ2QbQGXhJWhXxUPUyHYmowoJG69PIEdgBGF8Fr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8695


Hi Mark

> Kuninori Morimoto (83):
>   ASoC: remove SND_SOC_POSSIBLE_xBx_xFx
>   ASoC: codecs: framer-codec: don't use array if single pattarn
>   ASoC: codecs: idt821034: don't use array if single pattarn
>   ASoC: codecs: peb2466: don't use array if single pattarn
>   ASoC: codecs: ak4619: update auto select format
>   ASoC: codecs: pcm3168a: update auto select format
>   ASoC: renesas: rcar: update auto select format
(snip)
>   ASoC: stm: use .auto_selectable_formats
>   ASoC: sunxi: use .auto_selectable_formats
>   ASoC: tegra: use .auto_selectable_formats
>   ASoC: ti: use .auto_selectable_formats
>   ASoC: uniphier: use .auto_selectable_formats
>   ASoC: ux500: use .auto_selectable_formats
>   ASoC: xtensa: use .auto_selectable_formats

I have posted the patch-set, but it is too huge.
So may I suggest about this ?

Its first 7 patches are for updating existing .auto_selectable_formats
user/driver. So, we can separate it into ...

(A)	- update existing .auto_selectable_formats + update method
	- Switch to use .auto_selectable_formats format for other drivers
(B) 	  - The patch which got Reviewed-by, etc
(C)	  - THe patch which not yet reviewed

I will post (A) first, after that (B) -> (C).
I think I will post v2 next week.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
