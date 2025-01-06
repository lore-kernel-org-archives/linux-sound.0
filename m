Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21FD23A0
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 02:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736131677; cv=fail; b=eJ0K1qSX8H0BsaJP7CM6DK7JhmFRW6IKrq0eTJZJWf/TnI2oyNGTJJhhujLH3YzO3DkuKsOY9GA5o3m6KIK4fEGGg7hIyWyBzXgvlf3k2oz7T2pmb0fE/LadpgQkpdDh+L+nnuJrwmBEl4DCy01EbF5oiRRQlH7qNVDlur94ZfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736131677; c=relaxed/simple;
	bh=OA93N3wCZgMB2QCE69XkreGX1Xa/gGP4gAhozq7OH4Y=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mymR1eTQG0Jzqc3N6E1g2bjRSf+OtGq0dFOv61B/rPxmsWv2klsAnm8+47HCOFq6XLNDN7LwBrJTCTLx1sRe8p5Ng5IOsq574KoFcYW9iq0VXSFYFsevCrldwqYzktjl40pmtUhCDSnmK8FdzSSO+ZAqj0s/kerqeOBCQ1rfUNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CbuV2qP5; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CbuV2qP5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckrqda9hZ3yTQM289yPmi9+NcCvnfL3Re1SxxXf3Hsk/UGxyID0T5ptW6xQno5u08XtPJefXkcEzQ391/WUF9zQwdsXQVnAoU19ortQMjTCA+13cmzuPssZilR9qxLrfE/f1lDaL2GkjvHOl5QvW/+9187SjBlrDtTS0E480TqueuNX669DzcEt8lMMRaWNVt2N9vaEG3rpXBh9F/3OHYeFiYAloO/0oPQNIIDP0u19fEbaDZs1J4baBGfccU4UIoH00w783kEjNlx/WoJxbwdeW9dEIz76R3EGLwnMuMunCJEHMscyiCoc9fp+hE1NCNeYNNXSENsmyyhKwkgG9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygwFWXOSKXEmwwBbAcsQLL7o0a/f69wFyspRJ0YINDU=;
 b=giijbuj6eEpACJJkRmzmBSBYXxNT4ou158kE0rRi6WUIZsOVn6H8ZMdpf8CYNeL95XJa32dOWLacqLiq8GFcJcm1/9Br3I1buMeOR/xsdYWFvBBIMkMrVXGI9lgYiMrD3PsSOsfV2Z614Iz8P+9svKt3PvT/mCnceIZ9vUsQw0IgLNFP/dKoCkL0ANnUPo5bK425TJEEvd+lN821LbVDS/PpKhIvtpdObqqAiWWfY/Hr6Q8ULCt2+ghGif+FbYgkcjn2Ui3b1vpQ4PawwnSdbg3gBIRq6hXVIW7avYJMHZjzRSUvtyIdSFI9s0Ih8WNY3W8lK7iZ7y7eZfh1TGqRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygwFWXOSKXEmwwBbAcsQLL7o0a/f69wFyspRJ0YINDU=;
 b=CbuV2qP56MLyoCZyATD2DN79dEKeKvHbIlNc98R9Ahev2xFxe2/u0Iw9CUh3uRBsXv9EGcAUkI3i90DurJ30D4ZIIen7DmnkIqjzpev7ttzflvjAp1o/YZizGYSfJVMo3YQjbi+RLbvRPB7U1AMcd8jVi9Aea0AmOETRRoFTDyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7127.jpnprd01.prod.outlook.com
 (2603:1096:604:125::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 02:47:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 02:47:51 +0000
Message-ID: <875xmspsix.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stephen Gordon <gordoste@iinet.net.au>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] ASoC: extra format on each DAI
In-Reply-To: <a7abe121-bb5e-4fbc-bbcc-157d54ea2a70@iinet.net.au>
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
	<20241220110133.2e8f1986@rpi5>
	<87cyhj88dp.wl-kuninori.morimoto.gx@renesas.com>
	<83a2706c-1b30-4ea4-94f9-42353f64a653@iinet.net.au>
	<86c91aa6-f185-496f-b4d4-4eea1e67fa27@iinet.net.au>
	<bbdced52-a155-4c9c-9afd-187200fa5371@iinet.net.au>
	<a7abe121-bb5e-4fbc-bbcc-157d54ea2a70@iinet.net.au>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 02:47:50 +0000
X-ClientProxiedBy: TYXPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:403:a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1ea3e5-9554-44bb-ef3a-08dd2dfc82f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ep7SRJvoS8MkeytQvedY2aT5iB+ItznNc3jyCtEZzQH8LlOAtNei9VEpgoR7?=
 =?us-ascii?Q?dX8zSftGefaaR3rhSoQtAfJtCoOc6Eb3UfBANIa7DobBnyzPX9CYrUHgCSs9?=
 =?us-ascii?Q?EtgRHwqzgop5Zkasv5iDrjS5j7SqyPUsfIwNgLNyx9y7mpHpmo7v6Q61L3yF?=
 =?us-ascii?Q?FMEFWxutD2bA6FacTGgfhykwyKTMzur3E6gs0j52vhP6Fp8b22R4w+IJgrj1?=
 =?us-ascii?Q?8yILSUg535h8LW4BVRFcnV1Wwq/GKXjbUZknoMbCxPym6T29eXPksnrpb19k?=
 =?us-ascii?Q?p0NNeOFtKgjDu5K6ojROuHYnGVAOwh66dS9YG5g5H44p+HNp/xka30ChaTrq?=
 =?us-ascii?Q?I8Y4ZEZ1Wp6b1MV1QjqUzxsegaEIrZPDD8gyDvgQO7pI6AzugogXVyoXhHil?=
 =?us-ascii?Q?QAxIKOTy2EsS585G7n27ougr4h2u1NYFA8nQ5s5iS6xtaM8AyC/gCk90SpuK?=
 =?us-ascii?Q?fR2BqxiMKlGeMasKQNPtCBM1nNTnp9wQ/+PpzqHGxbplumKQ5h3YipXQt5+T?=
 =?us-ascii?Q?noqPDxiGdboQLf6G3squRsu2i/7zNcfzfzM6YNVfYBVhnp+UHgLysWSXb/+k?=
 =?us-ascii?Q?JiiNVssMwOPdqIopAW8jwfooVjRUmoKxiYgymcNWYZPF5NUH+6BHNN0bcEDV?=
 =?us-ascii?Q?KGTceANMQyUavkde+nLEvmkSfoEggU9GXjiNL9OvwEAhZOnYJUpe4Lxmol2s?=
 =?us-ascii?Q?mOuzXIWDsqmZ/sIXAw9l1Uu2eR7I1kvsnuHLTG4SwF4JXRK0V1h9u+GcVS3e?=
 =?us-ascii?Q?ISqCc/WVlFY9bJOBmUhCpke4NAQY7DnjAGSLCGmG0xOmWaxGp4MaWWpRD+iP?=
 =?us-ascii?Q?st9r26Hkkqo3qQtBGkiSxoGbZDmqd0m8lxO/SKC89pUAt4AfU+YVWMdOv3e9?=
 =?us-ascii?Q?+ihVjuNGjk/4aAd10w6eHAunectVZxwgrLuQkADrhAIlHT5LBPbXDQN3d+e8?=
 =?us-ascii?Q?2otQrb9jCgqt623GK7C6DAmiLFQPLG4ufxaeD/+plVlbMCZ/XPlyih7iVmYD?=
 =?us-ascii?Q?l1pf0rRHieuX4ish9IOznUn/P7vy4K27MArDSRJA08TESl3vseEju7JWqhsT?=
 =?us-ascii?Q?x/HV4JloOBHwQvheUG4j7IJSSAPOk1US7VJqCloOMW+ZYCWIh1bXT4ByxO01?=
 =?us-ascii?Q?WUcF9736aQaj3c2KovcCVxqch7JnCD/gzn5OJSkxYhC71XViiAg+IKq63Q68?=
 =?us-ascii?Q?BNitIP7duo5mg3XW3YsQ7YqdgTp2RCa/oX10AqoP954g9KERiJ5J022PpG+h?=
 =?us-ascii?Q?NuF6eqbM5yR3G8Hm6V6NB/RjBqOd23ty7gzDMl6kFc3IjvDzWpAikncfAZPx?=
 =?us-ascii?Q?zB4opbUOP58FWTXffn+R6YI294M3Dm9CmFnZ6jGaStr4DGbSALIgidfuYj6M?=
 =?us-ascii?Q?rGhfwXRstX9kagQLnw30M8oLVbqWP6gjhp3CcHNl9NYYFZX1CdrIOWLWkGav?=
 =?us-ascii?Q?eMyyStj6yVlUrP44fJ3/aH7t6u8NYWNh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3MgOjp5Uftx424gC9Ci0RvBl0eLzHqLe74pQivudpXI7o5n++KmQ9WnRmKj3?=
 =?us-ascii?Q?X/Nk6NAJlvHcWc/JzqQLTsb2EWzFMAEhNqwgDoUFfLgr6watt+rQvnUi0VuL?=
 =?us-ascii?Q?aYW8uRNRj+qgRryGnDCMGIvuudcXNMF3mT9OQpKHrIEH2453jEy0DNDPbGNS?=
 =?us-ascii?Q?zs0tP6HYP62rGML0XncoHrl/fwcm1T2yI6KNiQAFstWeu1VHmFO6kIuWYPTw?=
 =?us-ascii?Q?gQe4d3sF1OKNtOox9KZ0t0hxlKOtWiBm7jvgdah4o5ISwEwZJJUSn9ZtBqiJ?=
 =?us-ascii?Q?aO1s7bEPJtApdcnOsLQdYVilBXScA5jcrg6d82BfWm3ioeDJj72BBnL0uJO6?=
 =?us-ascii?Q?MsUqh90rdOeAeys1OxA8v+Nk9XtdLuiyo8K+mRZGus2hsPZKTWFFPIxhq5dn?=
 =?us-ascii?Q?CIKJrSeMGilzsvZE3DHwizHsoSSfan6H1rav6I3WSDgl4SRO806ponlSLk9C?=
 =?us-ascii?Q?dmqU6861JzjhJUzxebWDjZVFVbAofHwjOQZkwuEYHnugfe2bgIxeraJD/B8F?=
 =?us-ascii?Q?u6rTWRfpPqkl+K45+nNC1czWpjd+gGCFPUduQP3QLO/X1nQU/wDZWgtHqPlp?=
 =?us-ascii?Q?tBWfXKG6kkRQrboquWAAVO8xruRqTY01fTTZKrJmp9sS80e6rp8SnlO6naQ3?=
 =?us-ascii?Q?iiZM067BIEOxH5iOxkQZgRuAUJaumqE2+azHYNYwHQ1YrDoXKenZsFhZYj7d?=
 =?us-ascii?Q?HvWxhYasoPVnOh+VEgu7Q+ROYj9Pb82NtrC3/PELcSjcsQlBmi2PelepjRSJ?=
 =?us-ascii?Q?cV+a2cYniaKTIMZvDoH3XKH8mS/vDN+x2gC1PlZ6l1zC4bkljwxSARPL8GMz?=
 =?us-ascii?Q?TXYBtGNQF5VwqUnoRynPRE5/0Q1thz6RK/CyCPRPU1kL29jBdDrO979e4ld5?=
 =?us-ascii?Q?DBLxMes5V7cCK6rAJbYo1NLtK/qc0OXALsyzDV/TJEdQn9vRFAzmPmXRDaFF?=
 =?us-ascii?Q?q5YTUuy2lCkq2VFOZIm85Rbr/k9dWdgy1x/lwqvMo+DL5qt++y6MaMsFPEue?=
 =?us-ascii?Q?ALv/fq9kJLMYe5LuhpJER2tNcZPGGBLYAq8maJNljZBIbYevGJQioj2LydVX?=
 =?us-ascii?Q?V3v9J4sVRCIENMZ63S5jSpX6KVTRaK5cEr0t3P7+Ek39faTxDO20gAno6Wj9?=
 =?us-ascii?Q?HTpsU5oSlYTCqI3X8WRs0AuHzeW9aXTP5VBXxgXe557gtSlwYY86TC/Q61Bv?=
 =?us-ascii?Q?w+ziszEA2szmJDjNQl4y8JUaESmXw9yv3EEOoE0s8pWvtqtk0Lub+zSTyK3M?=
 =?us-ascii?Q?8UcwLWOSNoVtkWTB8udiurPydoxrAa9KX1MhBfnj6rHfjbYG8gHf51XssEQW?=
 =?us-ascii?Q?Etu+NHqLckJ3hy+PNXgW2EHUQEAVirsk30c7MHckhNIoDE/d9lKdOdiGDysP?=
 =?us-ascii?Q?fkVAtHeQvQoVJHo3PnMe7nydkKkBjnwtJRhSDTwSIGWHQw8nSZujpCDZgbSR?=
 =?us-ascii?Q?vlBr6/iK7kDENbP+l2+psSB9sSlGzFjzfKqZy08GIOZc4DI7T+ZsOI3sAPpo?=
 =?us-ascii?Q?0pNHAdzRDxXtyDw11LmBAc6aSlN4f0gr9HJotmzz/RhfwDzgPXaoUlrlzaoJ?=
 =?us-ascii?Q?RgaOBdjaFLc7HxkJt39XILCMK3fFNglf35Wg5+OcdK0DzjZi05HycvaWPUJv?=
 =?us-ascii?Q?VVpODSDjtVBKeSclIg6qa1c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1ea3e5-9554-44bb-ef3a-08dd2dfc82f8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 02:47:50.9909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhPNnmVUmiTzTNFn9sji71E/Dkoct6bNK9lhWVcFRIDxcJZy1HKjLXDkcYSUn3ivG8G16kAouWiVNAZ1+MIFjzwRDShUjKf6NAhs9yqrgtbhWbV97R34uxXsFk8RBWpr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7127


Hi Stephen

Thank you for debuging

> > Anyway, once I removed those flags, the DTS works, as long as the CPU 
> > port is listed _last_ inside the 'multi' node. This is equivalent to a 
> > requirement to list the CPU port _first_ on other platforms.
> 
> FYI, I just submitted a patch to avoid reversing the sibling order when 
> updating the devicetree. This patch makes audio_graph_card2 process the 
> nodes in the correct order on my machine.

Indeed current audio_graph_card2 is not assuming overlay.
I guess it can be solved if graph_get_next_multi_ep() uses
of_graph_get_port_by_id() instead of of_graph_get_next_port().
Will update the patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
