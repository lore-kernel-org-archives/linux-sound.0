Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796D248880;
	Mon, 23 Mar 2026 02:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774233070; cv=fail; b=abM1PzuPll4GJOpsUy+zutGTpPGzkKBqtIBDV7urXS+Jpb7xDNMRjicsEV0lKPkYk1bjikyQVP/NVqCZs1SGckftpjQpRx7UGDfvgUfBCwWBtG9LSqv9Hu019Bh30QSed8dICe9+FMiryvf4RrYl0JngVzbp/td+40LCKFtjSlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774233070; c=relaxed/simple;
	bh=qYv5QsreJgHgaVF9KFWfUx/HpTRcnpIJD9jo4uPMCLg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PgSC2UEERYaT4YWg0kJOy+QxV7fW8zlX2EE8KTIlPX5VtNR3ims9AJafaIOdq4SGe40pc/pfcmNaKTqCI1EwzKmjTCBZATfByD1xXIMQFHQLDfsOrFVb0JriONSSdU00sgKGi5mMW2KNEY4oky6MhaxODUiAK7uBA9G2BeFZ09M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TvZ9+qTh; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TvZ9+qTh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vd/vGDnzYJVQrRa6A61gra8JWhU2E4029koZVs6CJkxLzSGUa2QshID+J49EG2hC0xpx9KNTK/UtrgMAZg4UFXRb4j4wkzb4dYKB1gtI8sV+X+x/dq+j7I0BU0wGdEfE9Uszy0OS7N9T/FcVAXpa6evqKgEs3Vv0BBDbuV1/Lpi8Ahmt9Lvd7NvRBdG7K0BNwH3Xup6yMCFPOadshQqb2YW4x8iqz64GFzBp/lIIehAM8HorVbxWmkciKvzvyT476sobFJzBmBkncsOVhxhisEq05rJBsBjhUWMk4fYTF/T5dggVjmToFJLHxmLnzLVfnrCJ6lIMNJTqLVTHJGA44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0yz5WTdLgW/OJlrifJCjZOdz9+qTuzWCNyWWAUf9u8=;
 b=uQVs+gveRJEwJkV3gJmbUWE0EidUkVjAd1ZF+Pl55RxuKG6kZPVxCuXulZURiCTIyk6H7Khx/fDAV9iJLRzu39UN5K/5ptSHmLViBZ1pGCgpgpgSWd8PAhjKTl9EulQZ+yX6CPLyVKmStAC7DHdmQfTkBk29eyCYyDVWmMCCt522tn6D17kT3aKt/PauetUaFQMTMBOaTJn75xczF6L7lqvxBOPhkq21clxS4f8MsbJtNbCgWSXcUsTOJSKud3WTOl9mUo89dYLu92mjPcJEk+VsA4gAc+8JMTSbfkUsRK6FdhU4paj/HUjyxokGXReqQQF3ljP9nA9DeQxGkWi9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0yz5WTdLgW/OJlrifJCjZOdz9+qTuzWCNyWWAUf9u8=;
 b=TvZ9+qThaRMyoboMXZcOePejKX+IwEB+yEDaQADf0BPH30y4nG5egoCjTovVsywVmnLAhpXpyVpHQ1W27h0WWCtvQZ9xwL7Cf8aFRnuJQ5e2Gw1Q9wpEIFErqt10q8w3WyI/CPFcCDymOn7PXML+3k814RH2rAeQfzLGoeN1cqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB7107.jpnprd01.prod.outlook.com (2603:1096:400:c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 02:30:56 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 02:30:54 +0000
Message-ID: <874im79t09.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: Re: [PATCH v2] ASoC: generic: update outdated comment for removed soc_bind_dai_link()
In-Reply-To: <20260321115018.9481-1-kexinsun@smail.nju.edu.cn>
References: <20260321115018.9481-1-kexinsun@smail.nju.edu.cn>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Mar 2026 02:30:54 +0000
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b524ad8-4c43-44bc-e8b8-08de8884353a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	396A2V0oHCwipUYin9hobzx+uuWX37aBQncQUMpL8TczW/ZpX8bnHi977qn8wamr2VYXHrcA353G3kqy4Z/pjxkZE40ht427V+am/JYVjkjTwj4ErY57oSwzlcK2joUyJU2OpvAbgWYU1WMz7nZOHi3CmzNlDpzkLkF6vPSn/fsUQibUrA4feByr+2LxTIq1v+FkVhX0o6/97of86Tjs6FPLKOYJlfvyPJ/HqENguIYppiRZgCNTInZ3j9EbF3NcA23jRhjP/t2sg6509FLbiqjmJcL/g9yAsGHId19kLkWpLrgVHWmtNpUsVoyJGpmYX8mcPJ2g8Ern4+YJjX8JHNVCHN7Y+9U1fKiFRpU2G9WwnDU+yX9sooClCJjaN8CFCbY1AdpYmJd89aSxTwKzT34Tvg3MeIEl6auD6RhvtxCW2BZiFVRVkgDXBWhgLbyHQDLAzM75eBGxliX6/eKhp/0IG8ZWB/VyXuAoUo7JwiE9IarII8nlsX1wXWuq2g26F8Fm5NyN/PsBuuL1dUBRCuHNEFMI09mmX7KmxsvIhzb9YsV7T2U00brqqw5J+HCwY6Ha/7fmCegO+NxNAYlabi/sKqFmB3R93kFrHqw4pPfBfDmFOG2COrBrwis16qVAOpxousGgv1v1s0aEsg2gQyQwlqNJKx4zNmDdmVfjV2zNGwnlxbVNxN/xibIHxcBhyJeADUvm5jMzJ6qmEAYwq+h5UJmcKQOFr0G7j0tCXqPB1u+SSZNz2WMuaKxInJDur4J/hTUsWNggMnk/FdJl1oVOJF+0nbKMEaPuS/n2mII=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cjQyma9kJmWr1EhYvQ9uM9yIPbtrUraiW/bIE462oicCol32oChEEGFAWeR1?=
 =?us-ascii?Q?LdXnKhZFDzSTTxD93SPwT6XuoLM/6u46/cvu3zdPQljct8Sao3zmaXbbsInm?=
 =?us-ascii?Q?0Kf7YlTtvxbf5WwW5o4WdEhbeilNxRJQiUCJYH9TXDlOE7cw4aDDjhPNitJf?=
 =?us-ascii?Q?l/noGtDhQ6bGDXZUnmByzTEMV+MDOBhBWkOwlQ7k2rW1SBm4wmF8gnHA7kSe?=
 =?us-ascii?Q?sSLV3473weyN0WolklaTlBouHHTCyv31lprmQ/YuhsrGeL2pwbgc2ihS6S/Z?=
 =?us-ascii?Q?u9jPCNg0I9WF2rQHbL0uxxjKL3r/y2yj1ftigjwmVnW3vhAgKuSkbIhM0QSC?=
 =?us-ascii?Q?Pf+/4yJmQ4CjQNRmTDT7A9belA5qm55qOwhmE3RQWMwA+pe5DTvLjsPF1+kB?=
 =?us-ascii?Q?goKRA8xkolXxM/oZvnAY4zW6gkAiuhG4Qyl/p8rOWAi4V4MBwaOO9ygkKWBd?=
 =?us-ascii?Q?BXecYzWbPkACAKGvpnslVjNkVj/Ggxv4UxeLwmZUSBfm0IwMqpkXkrB2kaJQ?=
 =?us-ascii?Q?TYJTN51OByWu1+nFYcaC6zplSmhyyNc91tvF5nm+EXJPQBnnNkzkF3bZyZMj?=
 =?us-ascii?Q?QgqU2NE1hw6kI6onFt7xhgwXH8U437ATV8ghlW/0CjAriOGzz3mpu/ojejCH?=
 =?us-ascii?Q?gt3CKn6YZ30C/YwKJQAC5163GG0Y1ic7eJj5iBkCpVmLPcacCeMr/dIBrz0m?=
 =?us-ascii?Q?9lIXk5ajZQZio+vALk8wNPxDot80PCKMq94e+zEQrD1qa1zFmpC3TBwdBhk+?=
 =?us-ascii?Q?JEav1UrwdJBNuNvxZfc+qAWd0fAk8FjQAFjfBYktIcGeuwrFvG/NP8o/TJ6A?=
 =?us-ascii?Q?6Y3DkTtUKwysN4F/BzE1kEdkWh2Gl2IKYo9psg8VgmCJN3KhDdkiIhWHBX37?=
 =?us-ascii?Q?bZvI5vMzOVaaqiLw3wsdV2LZzYAHvGnlX2Hi5rSBn7Bb2+O/nA/4i0AJ7NIp?=
 =?us-ascii?Q?LW8ITE4bWQc00U2EjwtuNplVCc0VuTeiYp90PRoatn95og9BALtdvVxqil1c?=
 =?us-ascii?Q?jdd4/bFPiLSC551PsezdxgIEXd7vqm8+neKztwxQ0kzULuWkfewN1Qd01Zcg?=
 =?us-ascii?Q?ABAOeUMqe9aDceg2B1H4HggjbV9ZTUAOB25W0irB0QbPtflqwz+bxeeymOxa?=
 =?us-ascii?Q?Pc33x/Nb2UE+dZUGTGzUfOHYVoKb1Wwwwp21gMPKBf0FvXZk+L5HHmXBb8yS?=
 =?us-ascii?Q?/fG6EgV+28K/rTgK/UjkFmzeHXlX0oGXVKdtx32uJnpix8VZax9lcy6nSzx2?=
 =?us-ascii?Q?/P0vpdtWKD4WppAlfUBcs6ykVoKnYfCNfjLJEiKhJ6DBUwkdiVoLn2lH6X5C?=
 =?us-ascii?Q?okaSPZqtBrymbFnFnh9LDJG1HpD2uaT1YlfyvsAjm0qPOX+qrHZHitVZPBJ6?=
 =?us-ascii?Q?McpvFilclgWCa6SqYrmyn7E2i+q8dmBejh+Si8g6fJkbiyddLFrP/x3vmiNB?=
 =?us-ascii?Q?ouRYi9c/8/9qTZaB/cICpJbDOmGjRnIN/6KYijo7x1xgO7vin9N8PTxQlqhR?=
 =?us-ascii?Q?oNQRq93mnOD2J5uV/hzJe2wI5P+tmwxJKWLIqQbnv/vbVDnpk+7Nh8hAlq81?=
 =?us-ascii?Q?m3SKS7MGIJWrpkU+TcAUP9OE+xclkZpNenG/+NGCGYSb8SuDVXYAVyuiq/XC?=
 =?us-ascii?Q?JjKmR5lVC/+DWZDEmAf8+OZi/KzX+cjllxN2V3sZARYc2kJtS77TcEGvig3C?=
 =?us-ascii?Q?7s6hkahebhhVnaAYKkEg0T0XWK4NEncdZBEok4FiS4ewJ0+PML/FWBR42g1Y?=
 =?us-ascii?Q?dHyqd1EMv0ScfPJSQ8Cl+SLPBa2hOJW1LMCv4QQhzxOSJJUY5uWC?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b524ad8-4c43-44bc-e8b8-08de8884353a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 02:30:54.4693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zoytd5gJUTsizbpt+8XP2vlzkbnzNkvJbwk9qGwd3836e6uzoPQoaFOMquHqn/VwpY3jabe13pl2W4I+RWT6OknV1HbAlXPDRbyde8KZ3DgAhW+WRBrq7Ka+9C+1SmM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7107


Hi Kexin

> The function soc_bind_dai_link() was first merged into
> snd_soc_add_dai_link() by commit 63dc47da1f39 ("ASoC: soc-core: merge
> snd_soc_add_dai_link() and soc_bind_dai_link()"), and later renamed to
> snd_soc_add_pcm_runtime() by commit 0c04800424c4 ("ASoC: soc-core:
> rename snd_soc_add_dai_link() to snd_soc_add_pcm_runtime()").
> 
> In simple-card.c, also adjust the wording since snd_soc_add_pcm_runtime()
> no longer uses "xxx_of_node" fields but matches components by of_node
> through snd_soc_find_dai() and snd_soc_is_matching_component().
> 
> In simple-card-utils.c, simply update the function name to its
> successor snd_soc_add_pcm_runtime().
> 
> Assisted-by: unnamed:deepseek-v3.2 coccinelle
> Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

>  sound/soc/generic/simple-card-utils.c | 2 +-
>  sound/soc/generic/simple-card.c       | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index bdc02e85b089..4e0c6d207a4e 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -699,7 +699,7 @@ void simple_util_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
>                                   int is_single_links)
>  {
>         /*
> -        * In soc_bind_dai_link() will check cpu name after
> +        * In snd_soc_add_pcm_runtime() will check cpu name after
>          * of_node matching if dai_link has cpu_dai_name.
>          * but, it will never match if name was created by
>          * fmt_single_name() remove cpu_dai_name if cpu_args
> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
> index 06638f9a74b8..9937a991846e 100644
> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
> @@ -48,7 +48,8 @@ static int simple_parse_platform(struct simple_util_priv *priv,
> 
>         /*
>          * Get node via "sound-dai = <&phandle port>"
> -        * it will be used as xxx_of_node on soc_bind_dai_link()
> +        * It will be used as the of_node for component matching during
> +        * snd_soc_add_pcm_runtime().
>          */
>         ret = of_parse_phandle_with_args(node, DAI, CELL, 0, &args);
>         if (ret)
> @@ -76,7 +77,8 @@ static int simple_parse_dai(struct simple_util_priv *priv,
> 
>         /*
>          * Get node via "sound-dai = <&phandle port>"
> -        * it will be used as xxx_of_node on soc_bind_dai_link()
> +        * It will be used as the of_node for component matching during
> +        * snd_soc_add_pcm_runtime().
>          */
>         ret = of_parse_phandle_with_args(node, DAI, CELL, 0, &args);
>         if (ret)
> --
> 2.25.1
> 
> 
