Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509453C2D
	for <linux-sound@vger.kernel.org>; Sun,  2 Aug 2026 22:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785710889; cv=fail; b=kcB+OeTrZmmYW9HG31GGMuOD17uC2SnPPq6XGfhjs0laXmTKIeYC5kA32cI8S148oOWQryCmXR8TxfB0KTigNP4t+XTs7oXlG2zEraVF9r4VT/d08nDFIdSFcE5usp4mwtZlciN/2G4j1v2iQAQ+dvFlOf6maUVDELZanfigrVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785710889; c=relaxed/simple;
	bh=RhIvTcvr9zQmalDuVamoWhh/cmkJLK879wlQq0ytmsc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pCChZ5wkMj0ZUjrgTuZ1pdv8pdD5MxtVPwGE9DO6YCSsQcRF3xRFyxFTkiOwiZeqiHX2cjG0efXkMMLuzbuDJvDbwNhqHPD9nOwOn8E7wWkQbgjgXUJkjzHc5IUnYVo260vQlvHyuR42Sz4Yds8FGM6LZml4gynh4DA/0ljZ2ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IgBa1Ab7; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IgBa1Ab7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueU0C3sFXIqh67MBGXoANdALKHZdikn/UqlQ5j5OTIW4/D5L6VT3vCvPpgwyt4v6yvdfJiycJ9Skf31a/Wcfm5qmB3RiINhBdFiOWqtRwiVXn8m8cOL9BDx8YKHbpA/SzeWvPTbU0bf+F4EfuUexcLq0dfzCzLWHMqti1XqPaug3PwknU8peyz7dF6iXBoFqDKoaA8bnTP3THvJXO5L4q76aEDqwWbufuQ7sqPM70BZKbBVB65caIusE3uzGf7pRUz+GnqnUqnfUv6Eg43jARFzDOgQ+0/ERKdjiws/NcCuebZijsx8n4wYQDfsErHVqveiCf+Aslmn5TZTCwygCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mC18dnclPH6JF3hj+jyyicfu1D62dqqIq65sC94Hgxk=;
 b=hV8hmnuI9Hipbwdhsw8iE78hNGjYoNzcSCZvP3SVtsm5WxOc9atEWlD8fMi2l1rJCg0x5/tZZMbgZFmSRPHZdM4Xv4tb8Lnmr3bEB756Veu7boTnMBkiGVtaGGGJ1N7Jb73mm3aSI/uUWoSqbH60kiCtS2eidCyEqZ4mkjejfNw5oFVLxEEF5ggc9DfTo/PCl17h7RlmDl0Fc68i0YfkrBlMd9QDktKYJEyriCjCTHOtJsz2yv/zzvV+J0GzAbPgqrz44B+iNWKzaMwVOvRs9JxOoAhhZd4LkQjgJkg3r0P8GFJUbmtBKT+Cyb4/Q5Z8HAcW7rGugOtfWy53poenOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC18dnclPH6JF3hj+jyyicfu1D62dqqIq65sC94Hgxk=;
 b=IgBa1Ab7lPlrs8g2wHcUmdEmalUU5DAiFiU5FZXEjipo1DalZi/Ra/aFE/5/HkLtgClWYCxyVmLQU6kOsQ2CQG8069JYRVirIy3VEjypggT8L9PZmoXmcsObKF2AVN+IJ5IwpohXk7OhaexldKcs0oo7LuVXDMSSBb25v0M95Bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13260.jpnprd01.prod.outlook.com (2603:1096:405:167::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sun, 2 Aug
 2026 22:48:03 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.016; Sun, 2 Aug 2026
 22:48:03 +0000
Message-ID: <8733wwt9zx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: renesas: enable COMPILE_TEST for PCM SH7760
In-Reply-To: <b7dbea39-5137-4d97-96dd-2d4e08423dd0@sirena.org.uk>
References: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
	<87h5lfswog.wl-kuninori.morimoto.gx@renesas.com>
	<b7dbea39-5137-4d97-96dd-2d4e08423dd0@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Aug 2026 22:48:03 +0000
X-ClientProxiedBy: TY4PR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13260:EE_
X-MS-Office365-Filtering-Correlation-Id: 1392c642-005a-4200-36d2-08def0e81c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	C2zvGV+TjxJ8NvUfGUyjjnk91Fr8zoEGgX0JZ999zauE5C6efEy+thbnAa5GXlnemfIu4GvW3JjjoNGphOgITYzOxo3s2r8hXSRRjcZu6YVfPp3PylxDT5UVuv1hqSaUnIV5qFjpPNrowy8CLWJ0uHOJDCdAG9jYlOSDB0lbt5ppPnDUXC/4sG2YcvP34b83UOOjne/cmS70mzERxZwdIX4HGH8sVkCr5hINgH8sotkzwYnl/uwwg3Ek5Anb5l7YwoC8q50tUzuL4Cs+GLHMy0ydzkYcn0A8kTmu3awYI1TUg1LfBCv6TZPL2mPnDXoVD2hat/m4kYzpU/GzABSYXc/ngSNxvea3xKU1g6U0SFDlufM4rx5qU4PtFQTvcISmTnMX3YgeTB2lIV61tvPIkVcs5oGYp+RKY+Wb/2Zz4toznW58g28CIyHPm6rRQ66iS2nleHiF/X74p9T9PJeTwlmGhMctvcK6YDraKydTd0Asv+asxBafpJLWGXyWwrI68f3t4U9y6epTI4f/3dQxmhcrqnzBeecKDk9JmiUkhO4CUVQOJf8x7QeWR08eX3rLjxwsp6eMi6n/7LQjb1xOdG8ZqmQqJG0aphLSkSavwRVuWDwUCF1HtqOWDxS6HD4IWtURX94pTHjiC3f7xo8WS6XJP4ymzpRipgp+pcp7cgjqEwJQ5FdDmFEJGxmWBFpHyW4Ov8CDe9SLN8LM9nqLlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y4ni4KResNQ1tibMJ5xluW2pCqUPnkjNs1IP9GXdd3+lSkfh/ID+j3rxtoYR?=
 =?us-ascii?Q?strVbKw2F4pzr545MR6AZUggv8PLCoOWmHPXjXR5e323T2aUqSi7bYVjY7cy?=
 =?us-ascii?Q?lKrPpk636GJZD3dIUtBy7JzXhAqJMKj1cYzzMZGJdXENdFNQO7YsocXns7Sk?=
 =?us-ascii?Q?s1AqwbKwuM8gXdH3X4z+/n8Uxz636qNUy3p51BZVYK970ZeTawqOZQ89F0eW?=
 =?us-ascii?Q?XSH5Y6e+hECgtdQ02m+Gdht5NEc0meDvLkg0SokJsXjcDO4oEA+gfnXmQzDd?=
 =?us-ascii?Q?NsgqAi3dHYXQZnNcolqbue45W8yvkZkNxamDQVgDv/IEHRFYoGngpkr0UV/x?=
 =?us-ascii?Q?uM8rO0/ilP16Umxi7Erl/vy2BWKREX+8/M8FZyUjRdh32FKaF80/uPaai39d?=
 =?us-ascii?Q?z8ypnvyosgSzgXO5G/y+evDUMuP7cECYJufDoLVY3zxpt4dFyvlyUlk+cGNA?=
 =?us-ascii?Q?D3KeEMmovKGcwrv9TrpA5YkxptGcrNsXZfU3rr65LQe5jaGJIzep7ndjNuZ/?=
 =?us-ascii?Q?beXugxZm87SFLv68KVlue+Z+P159OVNoENjgvPZgEgKBISEvhH4ZUta3VGhT?=
 =?us-ascii?Q?OFWtfVshEK3GkzGds56NM+7lG7TcDpIFCHdlnvSGJbIAPZiiq4UzaYeI7Iye?=
 =?us-ascii?Q?cQqVgJLbThljzn3BAr75cOLTAPgF9zpcJGKZ8gSzkHOunmjA/iGGje/SGm8f?=
 =?us-ascii?Q?r/u6qPjk4tFP3GdxKs/KL2AiT8MRH3/ouTaLDzy5RU++qdFuwPc+HA/JQ9On?=
 =?us-ascii?Q?O5hZDHqgqap2lwRkdu7En5DHnM16r0phmp6Jzxrb83oYBtUhoJ1kHHDyYSxW?=
 =?us-ascii?Q?9gWK9qlI5435CVfD3sQXbOUIMsUrV+ApT9KSGdA0g0cXnvwmzhlg0mTgR8wf?=
 =?us-ascii?Q?F5BHOPb8mme674I1uk6PlhQ8FhEaEC9uBm4x72pOs/bAfGfqLDYmKuMMdd2K?=
 =?us-ascii?Q?yKiJhEmDvCtd8Ct+NcrV9TQK9TUSIiEDe1a9pq2cUWiNiYAyD2ZQi17GCRuK?=
 =?us-ascii?Q?7kbbFOK2GPN34BVYBAqq+woqb+a8U28xJM25cChCpAnIhRy5NMYqwjDzgAK9?=
 =?us-ascii?Q?SVDDJdQFFnWb2YZy8juDZzI+mGEmLj03qkPtud4xid+qYmuHd2H/sxXV+4Ie?=
 =?us-ascii?Q?IiTOxbaed3bnQyFJQNyzfp5dIUM/8IJlE9Zf7Oblr3Zs9GVoGfMlUNKbM+s5?=
 =?us-ascii?Q?LLG8HchsmYFGVX+m6jsxpZ81ZrDJBRgeoN6R19lMAASspqfm7StwOFyuqeWb?=
 =?us-ascii?Q?W1vBXkEslFhFT+MEI6AyPgJzpfbHmSkH376tZDzG/HI/BuEuvcV/JbXSxjad?=
 =?us-ascii?Q?Bme3dPFk6ormeAewI8bRgcv4AyI070wEo/XZR/Tv6tl6QWQf8x75u8/NOpnw?=
 =?us-ascii?Q?Sw7Qr9R/zhCGuXwnOtUUdaNnNkluWgsgx4/y1ByT/2LX6bHBGuebLJ/QjhI0?=
 =?us-ascii?Q?ptFKY+85dG/0+MiR7LT7Ja/tB0g4ID/ZrGDeymhEZDaBZYg9MUS2dH5nW8Oq?=
 =?us-ascii?Q?PdNsGhJnl2M1AEfwfqNUbQ8ki+27aFIlRVwnZAQ5j9TNSHAmRzftM5mr+r8r?=
 =?us-ascii?Q?wbE1sOCm5HxqSDwhS0OceC2EGZTrK0euJYsqvfoM7tCTllgoaXNiiqC0ISku?=
 =?us-ascii?Q?BhwYB9eUTv/GZ88vwKTAdHrC4bpWq3qyfjeJsZ/aqHbsrZlbxJnCvugEXWp+?=
 =?us-ascii?Q?4wttrlTCPjjNkuRghlvXxbDHtqlZHBJiKqtvmiOIsJRaPlJKLk/sjGh897Ed?=
 =?us-ascii?Q?J95DBhEaqYq7kgp9JBfTUUXgnFgJEjE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1392c642-005a-4200-36d2-08def0e81c63
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2026 22:48:03.3566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjSFmoCunrIg4wJHRXvkbIU2iOdSRAA1l+3Lir2+GvNP3/47kGUykoKirDNxfH7+WzclSOEU7Fqm3tJSMo0BwkK/lVTtuadW+86fVFd+gtK7gvrF9iS+YSKhJMcCNFH+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13260


Hi Mark

> >  config SND_SOC_PCM_SH7760
> >  	tristate "SoC Audio support for Renesas SH7760"
> > -	depends on CPU_SUBTYPE_SH7760 && SH_DMABRG
> > +	depends on SUPERH || ARCH_RENESAS
> > +	depends on (CPU_SUBTYPE_SH7760 && SH_DMABRG) || COMPILE_TEST
> >  	help
> >  	  Enable this option for SH7760 AC97/I2S audio support.
> 
> The DMA driver includes asm/dmabrg.h which only seems to exist on SH?

Because it has "depends on SUPERH || ARCH_RENESAS",
non SH will not related to COMPILE_TEST. At least x86 didn't has issue
in my check. But I will double check

Thank you for your help !!

Best regards
---
Kuninori Morimoto
