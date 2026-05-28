Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E734389C
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 00:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779927801; cv=fail; b=KmEWkuOBIDITCh0GpX536a5YuBI+d/CluAVC3XaW5DSESoYbB97VSG3T/LDpCc395b4NeQWP3xm7KSJgno82UTV0RRoIc8Fqt0B7PLpu9wMlJ5YlBBTW2qE1mmxHy4Ib/P5BcAIPpxmV9rFph1+cbMrWgpAJXV8wBMPRcZ++oQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779927801; c=relaxed/simple;
	bh=lirSShh+evNIQAX4HYFN3M8QDRsN0KXGoMHTGN3ZZko=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ndi5A2/aO8P8O7NJTh8De7lArr0h/bm1pe3Z0/8xoGRvE1pQEyPPWr+7ReVHSFaORt5LKI6eQNvWSWWDoVk4Sbh8cdV8AhzQlKhRsBtVIJJEY9qoVFl8cvpbAXKjokWBMseQEGWdbKIJpzx36qUECotXbvnXzKBC6CMK4MpeE/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZJqE97G4; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZJqE97G4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTF3LE61IMyHsdCmhIyR2+ggU7sBZiI9nfiW7AVMj5DzPlHgWSX56h4mQZU9N0siXAzZ3oCXpVvuvLcNUZVK6avfUUYUTa9XllS6b9xvCghAYMIKqoNaEw78+l5egrnQ+J3dnHyZ45Oy+XejfRSSiEJTg/e9IMLpl9K62pn+NjqAfQdjIjFigeJmncHkMz4nVV3oHPCEF8kfJWmZ4XzKy/J0vODBBYGeoygah5f/4uu+2PoKvuKz9FeHcGxcpVTSMA9D4WN1mp6MjZ9V1bYkvyakmgLVAY8wsNHnz71Gx+cr/+3VmMXFR9JMaxJlioZwSKFmdwVLV2qAsnD6puTD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+4xWWlRdnKLG04nVrn1ODUGIVJcwvdoJfm1CvByZaw=;
 b=eh+SKmv9BBQLqFblx+XSIockVl5vVV2pgY+FEbiW761RPtpCuIw/NSdSnjKmfeFMzZ6Sq0jzR+Q7U8BXOY64sXFTxlKsJz78fLEvCxtjA7kL3CG8CPf0M3WeAA8WsVqnZHY7yXvgA4/JIpoZm8LeibbaFHvgg9lUJrBlNas83ph1o/woN8IXK+xPiCne7/caER8+FRcAdBP+mQQAmfygr1MVFDjHUmmMcHEiCcFH8tWtp3tj592zePtYf+LkyMONuXWHlJVgjFu+04ZTFT90adxJ2wkZUeOtT5GwASckLsR3xuzNQdoJwEdxmPmOsnJ4g3N8tdPenNhM97mtc3132w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+4xWWlRdnKLG04nVrn1ODUGIVJcwvdoJfm1CvByZaw=;
 b=ZJqE97G4nMPiGEfxv/tGg6W5mSPWF6WAWQ+aABtDXFtkeQQb+IAgA9d+pA/XhkY4V6bUDTWVnVmLdVVODjg5NTM122WTnWFNq7vLn9Du+gRdLpUZ5k42igfn5wJ8tGJSFWWZQYXteXkFDCWKh7m+1csHD21sj5Ip4jlI76XiF9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB14224.jpnprd01.prod.outlook.com (2603:1096:405:21f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 00:23:16 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 00:23:16 +0000
Message-ID: <87bje02xho.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-card: add snd_soc_card_set_topology_name()
In-Reply-To: <87se7de3vf.wl-kuninori.morimoto.gx@renesas.com>
References: <87se7de3vf.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 28 May 2026 00:23:15 +0000
X-ClientProxiedBy: TY4P301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB14224:EE_
X-MS-Office365-Filtering-Correlation-Id: 331f6323-14c3-4f53-b5bd-08debc4f4fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	VCDHxkEinL8tubmXxx0ra/ANYQfjIVjFrxYCwlxcZkG6AZlvOGN05CUbdsu7vk3wnC5tNupnyJTBnEL8OQiHAGjYW3LQZgBkAcYB50L3E6ME/5j8Az/PYyq4/jWhm5d4H/gIAj45oEvVOXTAN4s0c41fVvM9A6uexMp+3Xh+crWsJpVEVGvyjYqHugqv9Xwo8J9sOwPrDEMDmaSYRJfyLYSwWz8Rp8iivNYVzjo1ON+TqLyZYSP+9fwcCig3oVSTP4jpdTidF2xxNZ3BCRFkTue7IhPVBbWKDwKL8DUvwO15H8UPkD+k9ivdB27vC02QFP9b4BniGzwjmR8MwxpZQA5vVJjMIIP16BFScNIWkb1CRYKM+HDIhAw34ChoaO4YlTTwZ7vfc4I3hoTzsuhL+LYOiW3QRCEdRn+D/zUTx3HPu1aZcZiYuEilfzNATYo8FbL/4VabZPjgGfO9gLsZxmhPBZc7abSGIuoh/kJ37NC5PFoQtI84YIrU6L/M/eXMUkC1OCmWm4khCqxxoKdGiWu5VlKbPlsT+SDEE0LmGEGXTES1tGHZ9xee217VIgL7PDQLv01jpTusAzkblp8aye88+5l13AQLHSCSu7p83+Z0h/h9jfSCmG2kz9MR1kZ8pW+ya2Tq3rIhDQ1aaFbhNCh6Ok3E13OKIfy56Trc+4OcxJmrGVEqcFgjsykaMmEcQLXQCNE+jY0s1L33zbkSvEl1n03m36u5e/RrGE8dfDl/dVUoKB2IFff6ZVoZRrPN8Eibn+QhOYKN1h7EMu7pAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NUBfwWqnd2C4YbNqSAeUtjfnyTSomGoauZHO0R6atKfmIOy3gfZq9cRVvNIJ?=
 =?us-ascii?Q?1MJHh3zrHxrhFilYL63PFxtfyWXb7idEdog+5LCou2EPz+rh+zA3zZJmDxev?=
 =?us-ascii?Q?stiZqMhKRrJbLGOPxobKtKW6yWfGbx9hgtZu5sbmsvhkeQbdlff4ItOnnoUA?=
 =?us-ascii?Q?NizprZETc8VKRQWsBOSuZkez01MD1Yqkc2FJL6EfpI8tf+P+dpVTYN37E0G6?=
 =?us-ascii?Q?qbCq3O3Yhsn5bjOmh3/E7w/yVprcFqH5M9RgIgDwY5c1vwEQEm8y1vNlov2W?=
 =?us-ascii?Q?stUSC9S3X0dgo4w2Da/CUUoFqzWxNM4bPcpLS9PGRlKp0juMJTGOAB68C1Xz?=
 =?us-ascii?Q?TMH6sE1+2EQ8C3uvWyzPe9nRTaz/D+TtklYVHfWYmbG17znHljUQ7ybeWx7m?=
 =?us-ascii?Q?JMSR/gLTkWSs525nHuOPmVBQPxxhM7qTZ7VaA8E66ivLy97xgQTM/Bz7InYS?=
 =?us-ascii?Q?5Yn+qyvEqCGdQEvnL3aOALXi0fKYZBIWvS8euOgdf4otM4stA2/pTtzV+UHW?=
 =?us-ascii?Q?R/Dx3UuCRLlD4KAoFC7k8bU3+Kvzu+//PtockL8Y8JgUW0HprOSuwcSByGYH?=
 =?us-ascii?Q?gG0nLE4qkr8LguUcbQ18jmQt0VmwwM3RYE85l773JtJdDL6trup1uLYGMur4?=
 =?us-ascii?Q?j6UtRloVegwAloyl5sHgoaCM1taRznvlqqMnFr3oRIvBOLKN4+G3rQK8+Qvi?=
 =?us-ascii?Q?oSueOQZu7Y+OYaIitAEr/DllD0IAJhgznKrAZlIqmIrEmtAdI60wnrN7Bg3l?=
 =?us-ascii?Q?znmPWxBY9MaaDTCjq0WB6T6T0JlF2wlOxKuO+VwM9l32zStecMXTuWXKwTAR?=
 =?us-ascii?Q?gsKRj8L+3PQ5rYSG7rGuY90e1Oa+ppOngg29ZIuIye2HcYSA6GSIVfNVH3Vo?=
 =?us-ascii?Q?RozG6uJ4XX7H7WFi4UsznF68L9q8pB6xeeD6AActsuwt5hsL6pX2NErQikRI?=
 =?us-ascii?Q?jBWiPLzvEfIhbx827F8gjy6IdXiWdOCHuVjm1rg3VLw4DM/srF2WWeOb6raO?=
 =?us-ascii?Q?e1RJQ5NH170HttkNXb2yT+3dFoJfWHYifH5yKTbYilASzijoY1M65WXQGGvP?=
 =?us-ascii?Q?Nv2UoPPQt9Q9IV2FiwxvqauPn6JZfYeZ2T3PgNjEpfquZwhUGUhuaCouk8FI?=
 =?us-ascii?Q?EKgQsfITXxSAlERUpMMY613zwVY9x0Bv97ijNJ/LzgpKkRZpnd5QultR8faJ?=
 =?us-ascii?Q?rWR52g98lvbhxAfJ4WOZhxxVQ2wxaTnL7eqk4UAVjOCsME04oG9IWUjDmuJW?=
 =?us-ascii?Q?g2tlG4cwFpZ8ukxrcBv+hA7nYyyUxZNiJq51rOAaTZYzcMo2Nt5BcIPLvWvj?=
 =?us-ascii?Q?JpdHgznJ1z8Ejk6ccItPbQy/faGhhlstMGfUwwWteHbS2+GwXW1tJR6Syf37?=
 =?us-ascii?Q?pxgCntP5niTXkAge43WRWWkcpyItx4rozY7Ik2xwi1pmNFz8KF1lxkZfp8g8?=
 =?us-ascii?Q?jPCJM5FLpYNr8iA2JAvYa6cbaGadDxgy0D5OKQ7k95r9vCwOoIxFSWNrkFik?=
 =?us-ascii?Q?foHhC/jJaMAIU7IN3Ixq0TBI2AGLpjk/Kxiw066GlOOMZgTpVSwfn95zTs0G?=
 =?us-ascii?Q?i+KvxKQBLd6JyKsNaFFCGQbrSsHAvqBK3e+LduE4nK5DsA4xks2gBcBLxwEt?=
 =?us-ascii?Q?aRyyDYUDbbO+FiJGiT65YkXUnowS2vB4yA/tQcTe0hZHEXOouJcp2oyMZ/Oe?=
 =?us-ascii?Q?xAquIEx/W2G3fabZj0X86OTSeO/0amKpyYH3Mnjqa+d3MUCPx3USnmNFQ9Rh?=
 =?us-ascii?Q?Kd8qkLMDbiyo9bPZovlxmaFyomMq5Pu4x+EXAiKKO44T96J7MTz4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331f6323-14c3-4f53-b5bd-08debc4f4fcd
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 00:23:16.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwZcoEHOE9Z3r8DbK59VeC8Orac5znbhV22u53UAudaWiAEIUc2C7Q0YC3iQoJZJigCbbdT16J16I41qBDSp2dyzPQ54v/yeuKZGyJuY9FhMFoIZd1902/gEwZwAHGVP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14224


Hi

> Some drivers want to use topology name, but currently each drivers are
> setting it by own method.
> This patch adds new snd_soc_card_set_topology_name() and do it by
> same method.
> 
> Almost all driver doesn't set topology name, let's remove fixed name
> array, and use devm_kasprintf() instead.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Please allow me to post v2 patch. I would like to tidyup the code


Thank you for your help !!

Best regards
---
Kuninori Morimoto
