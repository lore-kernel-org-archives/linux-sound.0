Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613A735C183
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762946; cv=fail; b=LgQuSFCQW9CwIxvPEznVv3Zsilg/GpB6H95XuWFSQo8Gm49Nd7lFvEno95DIlzB068DMsrTvaDh2gcYsM9JpgATwD/37hq+JzWCIl5neL7ZhYgOWaCsj798+Wx5ZiF0wS+C/YM8HmoFF8tli9ceaAvOJUWZ6iSKaebHbQC6DnSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762946; c=relaxed/simple;
	bh=C3Obg31kIBYJV7ilz9t6V1Vtgvwdjg+UIKnZArKPO1k=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fcJVvaVjJIdBz2RJvBdvNnmGddssZtmfflozXIlmlubbpSHAbDYF1llhOB9wNYrYh+2nIMSS/H8v0f7Zfnnl2HlatGqDS2qnlVAwMFZPHjJX2fvwEpPJm0oJsCX6iq7RwHIqaPurCX7jqW4AJZ9PgY/vSqo12yd1nh65NQptp5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QOg4h+5D; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QOg4h+5D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSJNZDDLryiwqNiOOuEomTLz7Q6wvnctcwSj+ieMH0oxhvYEOZFM9cBJ8dUXP7sn+2WQ+EGIg+I7l6gLeUXRevYaswHuYyPo4Yd/oUJr2t1XTzUBwJ5SgxBpkkki4Cr6LU6rein+yNabO97XJeUTzGvF19Cswg1QzTpDRYbab2drPikg0Ceo0v2olo9kw+5y0k5d9+jb5/7cMilc5j3nL49pNUQfYMTZYE2tpq5cOE707Tdtkd+M+CW0hvts6jyX9nfI6Wgl8GcpKXkWTf8wfPowifvUXX0zHFr4BpWk95X7jfseUDQDW8vGBPyDmWDpVYVN40soWYDqpQQjv57S/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMNhMpfTvtiCDEm4rJLm7QUKCwMkbGWGGleUWUbp09w=;
 b=snWe85nZvuWD29F1+an7PdGFP/lmUEfCNk3uZdhXW48PMPaexmC7n0jQ8dG6GP/E+oU6hruRVbd1vXPg/irdc7rFaAlLXD9WLbekcXN3ifZHjEemZn6KefbutnnlNRIEjaoEhoXZQ0LNt2WvdOgRZdMqIwJRnioaV9VPdW83x40uXp78xyA4HF7uUQIhKj6VIhyJNHkR87VosJzFKijPpRyceg1LvVb9MaNmqi47pADoI91Bw1QcFdeT6Hi58PtJg6byfcwdKJrGdV1SK9LmwO0nasY5Z7UP3CLLrFWuR9MXk8HeRpNAhham2YeSd8TaIoVyO/qWH2NLB0Po2x0vhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMNhMpfTvtiCDEm4rJLm7QUKCwMkbGWGGleUWUbp09w=;
 b=QOg4h+5Dxf0ZIX8yXgaqlWixZ6a24Y1se2MlZm32whd9JnvvVqJ61ltRe0z4khgL/yZXYh0tbPfQPjL+EL3qao64ZBmqhcrSvhPLU8pAHm1LTmwtI1b4gQmBp3I5jPcR6HrGrnKL+nRhlFDJK33dD4Su9J+qUx7y5SA6o8ur9T8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB8171.jpnprd01.prod.outlook.com (2603:1096:604:1a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 23:29:02 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 23:29:02 +0000
Message-ID: <87ecgutxhe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH v4 01/12] ASoC: soc-component: move soc_component_field_shift()
In-Reply-To: <b0e44e5d-7649-40ed-8f17-e61b654c1733@sirena.org.uk>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
	<87pl0hjg4g.wl-kuninori.morimoto.gx@renesas.com>
	<d2670363-bbfc-479b-a214-62aec13dde7b@intel.com>
	<b0e44e5d-7649-40ed-8f17-e61b654c1733@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Jul 2026 23:29:01 +0000
X-ClientProxiedBy: TY4P286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eae0bed-6ab3-4b06-166e-08dee849033b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|7416014|1800799024|4143699003|56012099006|11063799006|10067099003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5v/QqCJM33u4j4esN6w2YP2v0JGbYkLhit5EEcibH6g6k3qDNDtEzDJTnuyRMG0EfD8O+jKlVT2obLcfm5HOwVwB3TJMrmpqpwaM3MLWiOByOiceYEmHDZLZNGP+V+s2jOv+QfiZmH5r8m9tYv3fdz8o2BN9k3nHdXfkxdwHCXmLqa0zCPTCfNEvGbuFqeiZXwX+bRR0O0qIQ2FJErbprUQS1AmU8B9ojTiGLGtH59fKgqt+FPq8LIWaGB4Yoi2UrLyeAL6nDBDC8uC6IdltTV3WClzFkSYdzyRV7KVSoeTft24fCl7drOn3tbbdG20XjqTNSKG/RE81Y1n4FGvp3/L+a4ZqhGdQ0EqXMBTtjoqdf9zbvhn8dV5cPneziiVBD97SGjtsuHCpNyoLzhXvC1sVX2T16Jj1hAy6zzKMI0x/Bo9ZJ3AF2mA/bzUAnCbXgen6/VAgRaSvkx/xxTZk/27cAgc4MSrSHD6Xoy3ufxRXj/Y0vQVfwZLhzkjVvWAvBTi+25c611C/VnlWuNpd9ThP8rgrAicypsDMtMMmbAE1sztuWSdAbCXylK61mv6qKacXEs9kCA8Pt/ezc152RGnMDxHmnp7xH7+jKoVtNl4wWkbb9yawduUMTaUoQ+sqbkmJNkfhc75Q4s057WvRblD3vn8/DaTJZbKG163IRJgqwZMEYMSNaFSjNqLqdYNGF9GjOGrj7m669O20HJM7XDoI07HFQJn3/wj2RgWZBkU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(7416014)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3C06zRKuDGWleWYYUmRd2ZZJYaQ2+/lJiGMUhXZIqZIRdnrPN+loal1exBPt?=
 =?us-ascii?Q?lOQeyJ7uBLEvDKNZWPk8sKTjlKU/3E7shSeC2spFBFvP00NoCwzuIYZsyWza?=
 =?us-ascii?Q?3hsPbPX2SIQpzGmNdt9hx0gjrYNYMP/R5J2RUrL/Trz/rj79gbrgUWCoCcQu?=
 =?us-ascii?Q?3zjny3oCTa8y5y9YR0Jg4kycCBI4AsEkPWC7NNk//6II0rEyXgKDENsJ06AR?=
 =?us-ascii?Q?h/9m3qg44i2Ke11t3y2TmlhlQfXCq6Gf6Gf0FMdRwefZxpVnZ3jN7T47PG4r?=
 =?us-ascii?Q?EImAxiBMqhHmZ54x07n7tvphIkSgsdtxHQ9zQ7WUulHF1gTRCo6Xlnm+tamw?=
 =?us-ascii?Q?8HCJ2VyHGd/KrVE+NTrKiAPUaQHh6UiHlDtTOUNFbH/c7k12jMwnM+wFHEl3?=
 =?us-ascii?Q?izdanmmYGgHchubUKRHTiY7+CqxM7EolpwiNeLRNiLWqLlpwH5XVI93F70L5?=
 =?us-ascii?Q?I2phux9j3gxGFmYovR1i6QiHzi/HLZaZZNh5GszMdlpd09YgL1R/iInHILDj?=
 =?us-ascii?Q?xt1Bep2GOJxCZ5dk4SZgOlhromKcFpYEjJRUZRMIC94dGeMWhw8pbmmIrQqm?=
 =?us-ascii?Q?wfgvrYzUYw1ouve1PbsPR9GM+NvnOz1M4+Y3RwPnxZyq47rbkIwocKLlvDU9?=
 =?us-ascii?Q?FNRjSNdcQpilxxug4s4tjbYBT5lK2Q0gcDjMi/CxvIDAqEMBJhR46BFEaP4G?=
 =?us-ascii?Q?2BGYH3rOZeDAOZOtlmE97fS4oVlOHNWNnBm6MP3m3/Tg35ApzCLB0j+Pi1GC?=
 =?us-ascii?Q?n/FszL97iguix+ju0x0epy+MOj9l8ilckZ3dgF/Es08KUli4CPDsLHDx8ScX?=
 =?us-ascii?Q?uWjYFqqZ4T7XGInyHmzCiCOGD9BNmy83leeebMVEc5QDr1Hk9eWzqQlSbD0F?=
 =?us-ascii?Q?IQ58DVp73qwt0TVoPE7/NrbMeHeLL1YITWXNPzRPn8VUT7lRDF+shar0fDWG?=
 =?us-ascii?Q?4ZmjGMJu3m3pShCt0xofdrY6oyqexEXg38RipngJf/Ty/g2YLIj4X/mZMsCQ?=
 =?us-ascii?Q?tvXj9h+FT4og00Wtrlql48DGcmN4ntd6enaSHcj7A5W45kqhVTiSqPgPtQDC?=
 =?us-ascii?Q?45TDB5/GRHzgyq/8lYK5FN9ZcFKBss6n827xpM3MYAPQfd+bXzinGOMfSY5p?=
 =?us-ascii?Q?f717IjcDo9sLG+el1h3sCVcp9JS7wtUDbXeaDTAKbh/VyPSAGDA3gyUt0p2j?=
 =?us-ascii?Q?LTrWkNzPlvl3ouuvGKk8v1oe9gTCPT7gbmZ0MtkpemyEI2UtgEYE/2nPZQ7W?=
 =?us-ascii?Q?vmOLndcgjmsjyLxcKgc7gsmWPJb23iPN76iwupdrwrB04znGmjyz+lx4UwHr?=
 =?us-ascii?Q?rejLaH/pxmABWPVdzdOmeKcaDmvx1WbRycwNIIJaFEaPJRC2PiQ+6Vy/zW2A?=
 =?us-ascii?Q?Az+dpDkidgEnX6PtQKek2w3JfIorfn5lRXIvFowl8r5e9S5cQ0sZsYhx1qlA?=
 =?us-ascii?Q?RwxL9yQkuXCJKDPSpPFx3D9r7g3JPM8m4zkPGTScurRzfvjzyCKDmVUwKkV3?=
 =?us-ascii?Q?SD0jvAmh8orG9gO/suSG70Wco+Dc9ntr8KN1o9D+Bhryyj2dYOV2iMCBqGTE?=
 =?us-ascii?Q?z3aRFtE7hXcmq/cmAJQ0z3nUo22AK7Szyxpp4SnorUJCD6P3JuCJqwdWeDyE?=
 =?us-ascii?Q?8ksBCSwANOkSwrrcWDkDu0ErYyQcvIPVSRYQAhnX/9QlcVtML62UKuHjzV4t?=
 =?us-ascii?Q?pLb4uvSpSCD54yhl1/AHufxxP0D4w2XtKkcugnAD8tsJ2B5IdtAg5OCYelIw?=
 =?us-ascii?Q?H/xwRwvEyTTZF/32bOcRphWNSyMx0qc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eae0bed-6ab3-4b06-166e-08dee849033b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 23:29:01.9023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsdI6r/dzN9PMGcM+XU4M+AKRnO9DfETP9Ufk+/vDEZ9sRuTt3tQAuyhxRxjR7ojLCsJxdxwxBMK3oiMINT+NbXIc2VCAjBdYvLwW8WY+M1r+yvb93VNh/SjWwjNRL0f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8171


Hi Cezary, Mark

> > > soc_component_field_shift() is used from
> > > snd_soc_component_{read/write}_field(). It is better to located around
> > > them.
> > > 
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> > 
> > Shouldn't the sign-off tag be the last one?
> 
> Yeah, though it's not the end of the world so long as the signoffs
> themselves are in the right order.

I'm not sure this is correct, but my rule is that the tag is added
follow along in chronological order, like below.

	- Reported-by / Suggested-by
	- Signed-off-by
	- Acked-by / Tested-by / Reviewed-by

Thank you for your help !!

Best regards
---
Kuninori Morimoto
