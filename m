Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793768010;
	b=HNvytLuunxtGzZnuh+pqPSFH3mx8tPEzCfjkHdU+qgVOVFoQ9xCT+gnqmYVV+14YDW+G
	 tR7Mdz/o79xiBSkvJoW653jmSWIHsWBesNNbiE8cRCCwqqxs8w8NM7tavBxoDNpgOPLCk
	 vDt4oUgkSU4pZY4i3erEQ9izMIyEhpZDl5El2EEK9lEspcjWee0TV4ZDpzDLQ0/u7Tqcz
	 pnGc3+7l8RrobBVVBIYXv2hYeyAqq1Acb3skPOdXdnkDqBsUbFmpR+fpLH90q429bsyYC
	 kdUiiuyhz2j4qgsudTYY7wtJGQyL+w0JHLX+mc/v7AYJ/RfuE1nP67/57XGSCNDMSpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768010;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KfUgXXwT5Bl5rzfEC3gdR3eYuzwd0JrIctT5jFmnLzE=;
	b=2fDmuUUCDK91jrd6ukU/D1dnfl1Ej9IllvyF1FQg2ZlLhI/dmjaiTdCQVviuAQVW+OGA
	 FrLy/yaOrEgjioJ+ZmczcVC+CBlFJJl3YyA4QsxPyaPTyJx+DntszQuzdsg7y4s1fQYdS
	 0qA2Aeiize5q2z32g5jiqggBMHJkX6MuUX8lxKBEd1H8bxV2wEPS3eejt7PqOqor02Ore
	 Yu0+iR+q6A6wyTwVclVv8ugzISh2RUAMZk3N9d3yBjt+DtJ+WGjmyLOHSHz15qTlQB3zC
	 lj9ZZBaz+luxQtnuCvsOZ4i3nIFVdd+bgbeGVz1fkvI397wsAzGm3btHTPbP+DGB5BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=IXAkfeZz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.9
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D98F606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 04:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D98F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=IXAkfeZz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0Dm1UtlVB2g6UtJaCbjEW6etKbYR3WX9SAc2YbY+7WN0ja9RmMyjB63YHsFdmPZYHjiPlXUsIqt7XN0CBu/RY5Z9MCFQ7FMuE56TqU5wiGWAVJ/WR01iI3MxVVbWjO1a2AM6qLxxn99KAszG7jYtab9avQGQC8EZz+yBE2oCEB6xicI2SHNXg8pgR1Ev6EmoLzOJRzvnEh6IrEjFourtZxK4DNM9Jcd9j4rByPoqBl/reEM0VfPZO6sDBhUuwxqTpfw13Ftp2LJ38IOjF3HK/e3SnNuHjNz0vM6jPoUbJXZIDVvUndTFLS9kpVhXyqYPu66o5HyQlbMuTkJVz8Wkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfUgXXwT5Bl5rzfEC3gdR3eYuzwd0JrIctT5jFmnLzE=;
 b=M80a2hsloURxRUt9qVZ7yGgHn3nuLqgNdTJz4PXuZXDZYOPf84POQSlEGB94/WhBDeumcTsvRD1ZkkvdE2mo5heQ+n/GWl5PyLaRfD+NpuxU8QxCl0fmJmzLjLDKR1DgwG7hXIg0JKq7Mr6oxxyW7xY0o9WU1l+rmIZQcBo5m07wy6h38i1FeAnAcpWb5bIDmN3uCFdBdnHTRFtgrDuqw0+kEHon8An6DIVzP2EVGSO5RJm3myco1f0KXq4JZwu24AWj42TJJNu0jN5YkFPQe6mE9f7M9coGrWuZU8J+vdm4VsP8FVNfsBbTANf4N3ejLzUX7pTDv1AVdIPUK2TwSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfUgXXwT5Bl5rzfEC3gdR3eYuzwd0JrIctT5jFmnLzE=;
 b=IXAkfeZzrUkblcDLx7Wb+PyoAGeIdgR9R98m3pIKORoavXMiRVkmVu/w4n0x9MABaI+CojX232lWogxyBv+56RXunr+//xy43CneAXY1Bt9qHowvfUGmejRENlC4Vc4gUvp2lZrNxbxOb1ZcyYD3euYJtwav8AnMhyJ/cFCzK00=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB13615.jpnprd01.prod.outlook.com (2603:1096:604:37d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 04:53:26 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 04:53:26 +0000
Message-ID: <87qzh12o56.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: audio-graph-card2: fix device node leaks in graph_count_c2c()
In-Reply-To: <20261104024055.1508771-1-vulab@iscas.ac.cn>
References: <20261104024055.1508771-1-vulab@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Nov 2026 04:53:25 +0000
X-ClientProxiedBy: TY6P286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::13) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSCPR01MB13615:EE_
X-MS-Office365-Filtering-Correlation-Id: 4260036d-6742-4797-c7b9-08df3a2f8fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|22082099003|18002099003|38350700014|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	0kdXkhFFGrGQXvJaFU1L98ROJVCwPVuu3sTz8cXrGy8JTuvRjHOJDQTKR2RwVnA5SdyIcFXZ0G+nIge88yQnI97x3uPzmWoQtEiwpG6y0MmYKBKcWmc2qD966KNm51/PlcJaZy6q4t0niTnmMLZbp4Z+kBGi5lK40Z3uUurfBqAF4pDXXqmlvv6Q9fcxABR1K8rB5o5IoHljx8O9oV0kHB2K9nIP1A37MV8wJGqVfk6eR3/OMSBD8zTYu3nfBBoHczosNHDslRfMuzK+v1DyLxo0uEzpKofVHeTb8Yq5JgSk2k3TWQWumtSym2B/vGKYrRj+itqGOnXo6fISQyXyHA0VJGeeaoqoSqJ0hzKU4ZdAd4dWxetkgPUSReqMWhuZHUuY8jkSV0VYZGUcnB29woM45ojfg03LXdEXwGg3MC7twY8xSyxzSHXzdqD0mm6d9zteF9e7HzZY9JYzxlI1t+lCB0oELX60GH4i9ZHLvsZEGD2Ip2JAHpO/8JkUOHARrbQEepyVGgiOcDSPpAgEUeUCb4wqn7mMkpulCdWvj7K7irPUdlEcua1Aiwv4ev6YhgjOnpIP8bhlHux32/ux7gONL9y/a3ho5LA6HCBwP2YnetJ1to2l02CY8I9M9aoAdFLBMcIIlv2qHPqHqzV9/ua+hsvNhseK/Ef+M4GJPDzjGeUeSX46jaFsHxIDHEdQWtDkoBPo+VRtKHQyoFKMZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v4XVJSKTI8zNpZy0wWbJe5UqxWlnzNzMb8H0U6BNOcEk4+jh97/tivu9Go5z?=
 =?us-ascii?Q?XJYvzwmxp1+EIEEJva/mBWHt/6uU5L7oOdfFT6Wk+azk941DHzpNHQvrY1fS?=
 =?us-ascii?Q?xiJTVuYQCw+e3cmOIN7UPlgo9w3bSYM42TwagyGATqvM6LBTkhoh6IZDPbx+?=
 =?us-ascii?Q?IQltqru11BBHxhai5JLtOQ+Ex4MbhZqXeOWsvV8egT9Gj9RQKklVtdLFV+gn?=
 =?us-ascii?Q?CCRMxrJrR6zz2pNrgOc0gDw4M22nD4g0qE15Ud+8NHgHC+9GUv7r438rawyr?=
 =?us-ascii?Q?U3u7g+9X0pAyySk6172doBdJPR2iAr6vxbBjED9ig37zZ8k6Dc6jJlfynFvx?=
 =?us-ascii?Q?ml/F18kIOlOlPqEfiTo/lxTA5d73NkcdmQkBwUGYAPj6u1UfXwWDkpwRhmTq?=
 =?us-ascii?Q?DcW11ucOkSZ37SbnNtPRS45exkp0+avNH2ApLdaBnjmllumKlUHavCJfCq8q?=
 =?us-ascii?Q?N9hA3xinTFgiik0u42alphDCZ2vPh0zJ9VdhWlTcxdRO1fqIgYSwcTCqOI6J?=
 =?us-ascii?Q?wtppkEerOeScir50cOX0m/27z7dQBRy0riFLETxHpItnbaD2lMvNynGRBsUz?=
 =?us-ascii?Q?mfDN29ixujewCQKRARfjAueluVPxrHYfTh+SMADwePgtraP9QP8fHT3kjaaf?=
 =?us-ascii?Q?AJC7ekCEylmGiZnbEkJdvh2yUZq95P6lS0Fnuak9WFxjiAl/6hmCaqssVV/g?=
 =?us-ascii?Q?PKp3pv6Q/aQwLNap60VsLY+86IwPwQNOUytYyMVihPKEswrqEh1pEKzxBLrK?=
 =?us-ascii?Q?gyNg5bXRK18Oy2neAESfGqtPUAeCzmheaqKfSpQ68JZ4aBVE34/3rMrfw0it?=
 =?us-ascii?Q?QNN/8N+NG65xk2kIDmZ70VvwgMtG1LuRzN6mcAYf0PKc/4upJypP8cGfslNF?=
 =?us-ascii?Q?Qfs6llU1N9DjsLkSjTHwk2MMHWkPqAIHkdlOvb2Bc3IDg6pyvWKBfdNTfu1q?=
 =?us-ascii?Q?SFSy5zogu77oyjqU9nh8Cj7eYbL7dpEfgMrpvWInhElWUFJPqFnpCOwlYmpJ?=
 =?us-ascii?Q?KuMpjWfkl98ysbbrWwSk3urRaUsUXTbX+DefEM3RzG3vXMRGbOfPkYbUp8Lw?=
 =?us-ascii?Q?2ZQ46Nswx78q/r8jPHrliFDw9fxP+nE8qbrc0f0n/c3Uz1IlMMZfS0V1EV5L?=
 =?us-ascii?Q?95Gg/qJ/PySVpf2epYq+IZaL3PSA+S4dP91JJX7hLQQbCquccpCH2ssLoUD8?=
 =?us-ascii?Q?MCLbLeNUvOVZq7B19UNQr95EFCHiqJGR8ermSThqmWvFqXzo+e+crobZHL8D?=
 =?us-ascii?Q?B2sTIGYfBwv6sxapeRa9a8mgs+H5rw87SMwxzovxtZC0LQLzC4s0PUjW34ii?=
 =?us-ascii?Q?PC6DnofdCs/xQv5iGsIRPC11bXDyD6iDEWW8oNyVuZMxaE0xpv0mosw2AjXG?=
 =?us-ascii?Q?E7w/6D448hJhANx0TXnP16uKGGqQZ1AICZ7Z6OLPgsDnRS3TVolBrGUg7ein?=
 =?us-ascii?Q?BebStLLjSHA15+pdvE5SFhkif6WubF1+LXyB2j0xoO8X+tys7lLOPZAu4hBQ?=
 =?us-ascii?Q?Jgeyd8j87nR0d/bAtwmVwVmBDM9pdA3M1sS5+mqOkdt53W3uA+PS65CxDXsQ?=
 =?us-ascii?Q?FO/50hYmQSm9M0Eqpnso2/ekfsNcUHlJupkm8I8wYRTQLtf+dyI/0jBIJ6Eg?=
 =?us-ascii?Q?fbujDq3TRYNCoBaMu1XLOJ1l/GXh6dnxlFYqFnRhLY7l1xDeEfIEJJQ4ow15?=
 =?us-ascii?Q?BQe0qxXy9E3ErmLnVvJknPLeyl43hNTwXfaxgLhaFA+xNOJJHtx53uzMMt1F?=
 =?us-ascii?Q?TB0eI8SRUmRoCX2oxH+uHctzHHPD7kCLQBdjSnK/aOBW1HFaveS1?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4260036d-6742-4797-c7b9-08df3a2f8fbd
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 04:53:26.0966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: al/5XOdXXzq9xxyxKlBHdK/uK78YMXs2TjfURBQ6D7Ng6pNSAIRvJtIu6W8881kdZ6TGRzIMeFFzocUytQxjh8OdqiCkd8iJQ3soAaK0xgF2aNKaHlQTFIVGu7SHzJ90
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13615


Hi

> graph_count_c2c() takes two references that it never drops: the one
> from of_node_get(lnk) stored in port0, and the extra one added on top
> of the reference of_graph_get_next_port() already returns for port1.
> Both nodes are leaked once per codec2codec link parsed at probe time.
> 
> Release port0 with the cleanup attribute and drop the redundant
> of_node_get() around the port1 lookup, so that the cleanup attribute
> balances the single reference of_graph_get_next_port() returns.  This
> is the same ownership model audio_graph2_link_c2c() uses.
> 
> Fixes: 5f281c3e82b1 ("ASoC: audio-graph-card2: use __free(device_node) for device node")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
