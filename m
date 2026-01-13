Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AE1201278;
	Tue, 13 Jan 2026 02:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768271402; cv=fail; b=bsh+zphuaVQpb7bDsaEGhaMhqlCiPJp0wt2G0auEwHZ4zU8i0B6wdZB0AQ2pbd/I5OPjWihnnI7rImF5SoDtZiAoDMDIknZtKo2qZEtZ8iuv+U5s+KhWYQpXS7N0b5vqGxSlLfYBzHFDAFTNXa6cJrzHfAGzowvonTUSRneejh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768271402; c=relaxed/simple;
	bh=wqGqZI29+S3A43LIAIWcTskkpdvmn2a1YeSu37KI9+8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Cm12xoxx+d9UsxolC02IVRFOqCG8XVUe3r8wS8GvcNYobmLbcZdp181wWKcyEupYElojlwNh+Yvjupj1xPx51g4LwySfH8O1voXkZOS4/ZBPq+lnxlOar5ajqQA0YYN2Se9FmykWJPWu7jhyV63mq0BcxFmFJKvrhjmgkBRnivk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e88szDjK; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e88szDjK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOgGjKFTG0hBgjmOX5JbuqTZ4e74GrKcD/nPVUAF+Iifkbvd0ZJkzluAMoxW7pfff96h/qxMEL27aba+JTwoDcwBEQjVk95cwz+ntD+SI2LFzBTVqN3pSwzWW3AQxvsyZ1bnHlkX1ZJZoUzwjeQ7pJtFpxSGHkbBv5+k5SbSJs9ScoyLckDxsGRbJqqGfMnWYJg31OaRrqmegqZGCOWmGJEec9nN4q2BWjYnTVBUxomh8jF4mmFZAT3NN9lIudQqKk33SGkccp+uygvzndL6RaLV62UBc3+EvoaxSj/ZrX9qzwYCuhJ++ILizlNqvD39W1uD55AHv5bOtT58n1f9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0tlxHDUKiIE7lF7vTEizqenClYr5p+MF/0YOyDeTRE=;
 b=y7wEgIw7kP+gnG/T63GYGTItS5KE4VLCFlqHMzoLluu9RR9mg4luDF8ymxP43qrcjbjpVZn2cnD8TFSMIP3idzTdQamtWNivy6e7e/RnwyR6oiqrSGm9FuPBqirctPD/C0oXL2b+Lb95sKdsqBHezpbgW2cBGkt2OiLrsihuxxGMX+e8ey/UuBEtGWZXxS3FhfgbhDsAJlV/lv0+vHHZoJvwMJqVDzLFvxnkLVzZaSqF1MowEjXlXvXpmSwnmrK+hxk8DRUZNTnfNWSPfR1lAVD5TAroD1VxnjuItitqb7zggxXjV5U0vgCnW4Gm8DzgzXNO0uVm8to9O1QfS6pJqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0tlxHDUKiIE7lF7vTEizqenClYr5p+MF/0YOyDeTRE=;
 b=e88szDjK+gouyQjgL+J1jQh6U1f/qTBFTO4ELvbh6Pzs8Zl3llF/uoD9cS5qSaRfhJDbMRhy63StvMTuh4FtShShE3ULpxRjDA0Uel2i18/XTaqkcXFy7UkZd82WqOqZgwz/GRcIjXqynXe3BVv/syp/cLCP68pOhgLbxeezot0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TYYPR01MB13155.jpnprd01.prod.outlook.com (2603:1096:405:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 02:29:53 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 02:29:53 +0000
Message-ID: <87v7h6p7mn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Fabio Forni <development@redaril.me>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/3] ASoC: simple-card: Do not print "parse error" twice
In-Reply-To: <20260112231855.193030-2-development@redaril.me>
References: <20260112231855.193030-1-development@redaril.me>
	<20260112231855.193030-2-development@redaril.me>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 13 Jan 2026 02:29:53 +0000
X-ClientProxiedBy: TY4P301CA0122.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::10) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TYYPR01MB13155:EE_
X-MS-Office365-Filtering-Correlation-Id: 1375b84e-fb7c-40f3-8781-08de524ba251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PnaDO/j11azoNdbMHzxteaLOj+UK88t2W+Sy1rUozzwBQ+qhZTCvZzGFdp2t?=
 =?us-ascii?Q?dRAf++uB/ManmqLRY7Cs926VT34tyxbC0fFIXl7gcbSh094YZHRygT4pco90?=
 =?us-ascii?Q?9Xqd0TxjNd4fB6zFktLBrHDACbw4bL2Zt+BNTcvdWLOBi/9HNQRxNC9jhVwc?=
 =?us-ascii?Q?yW/6ZjA9DZw3SAriVy9wjHt/9saGTe1X24pTkXsptQezbVyXFvnJsL+zX0Pa?=
 =?us-ascii?Q?yOPPMfw9dLIt8sw7T0KgF/m8fKeZ9izqE6iMrdrY4FIrSiPypofJq4mAc/hc?=
 =?us-ascii?Q?JkOa4XEeh7YZJruRFlVBo5k4BBqHmAV2gIkycYBapi/PwDbCt96GUmWk5oiQ?=
 =?us-ascii?Q?S/zmpocn4sqtLIKjioGgmWy1oAJUzyQbrC28j956hzQXdy1KSljk1GQgizz/?=
 =?us-ascii?Q?DwTCAfs6bfWLRz/2/F9p6EPn6jwaMqrRGl/8RIJqwSikAbozqNAZxLrAgWbu?=
 =?us-ascii?Q?RxvH1F3AvErRJWSoCjFLZHXeebXUmnQ6pPq4xXfc/l6otaftulQaaGlLTiwJ?=
 =?us-ascii?Q?ze81tbd2ICTRLXRhpy/D9elG2ePk5pbzepS+cjXfvBuu9dXAWPwHrRJYxui9?=
 =?us-ascii?Q?Wp9Q+1VfEI2yc0ojo0hDnObKoQoSnRcLyounfJDeaBda+7AifIuEQyUZF/23?=
 =?us-ascii?Q?jM1tVFSh2cfQ3mws+e1rvq09REJNRLYem2HTNHHupj0wFQZVIDilYwQ22Xbt?=
 =?us-ascii?Q?/Ozb+1puN8ihewN57ikzeNg9+NpQagyvbuf6oNglrVutcCVyjqdEJ4oPAZ5z?=
 =?us-ascii?Q?l9Y1e1ImkfAf1kqHuLQ99a8iH//Ec5Yy7M6MiL0gfz3ptEqpIaLV7kbCb0vK?=
 =?us-ascii?Q?jJIOwyyOA1QUqrwyK+8l5ShzPyBjxsnFsk+qqPpTtHFnGn8Q9DZwuCIu6MO5?=
 =?us-ascii?Q?OM2liisyRc1S/K74ang1iqN129fPrVEicfU2k9Ltr0k+Myew5IFo8WldFVJy?=
 =?us-ascii?Q?uWUNUthGC6fdfZdqTef5enawf/PyvggWh0wzY5HdU//AKIpoCp6Lwj3CV1y9?=
 =?us-ascii?Q?xD6F7EEf7cdJ4eHHbyU1yh9MJ46pxx6AGHomBeiT9l+GFAySoRuXGE54w2KT?=
 =?us-ascii?Q?f39mRQWwQ+tzsY27MPHhjRX2aMfKWUkRK5urF0dQX4CD1Bp0h5enN+yXLUio?=
 =?us-ascii?Q?UBg50AUgTnGvGXRjiqA/UV/3KyFaN7mA3sek5z0HLN5+zdUHZ/EQmtPYejd7?=
 =?us-ascii?Q?AFloQC219psvw91ft5BKjKYsQDqnSMSFSkV8DECWMUUIIGt7LgefnaY4/D0v?=
 =?us-ascii?Q?j1Z8rgtSxLLU0we/WXlBJA8tjd9sxJd9lqtl57UfsAL4EHd3oHE+EJy0r8wV?=
 =?us-ascii?Q?xEW6x+wsT6zeiJ1jeUknqPkjShSwBkQaY56gvTV0Ow3CZEXZHQgbabT4iYYv?=
 =?us-ascii?Q?TWImEaoPPJunIaD4thzLfi+UU8dYIHv/qnmf36gmcHmIxHVRo+NbCWbxzHWH?=
 =?us-ascii?Q?qchHoR3rKil98wXIGtls04gsc4H8sRkWRcUJm8n6Mek8e4W0XDdQ1Tq9Ouio?=
 =?us-ascii?Q?qho1HxuzJMad/AEiJ/kPJu/GCjPSZRJUoDXz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ODkRphD/SAPhEgI9O0PuarZqV/Y813fjp+MpmMqbC1u9SEM2OkcOCKasXxyC?=
 =?us-ascii?Q?5FzlxAXoCCM3XTox8SaZnRGpzNl3DY+zzvKJsr5qNlYxDNVoxsX/ENRhdbqR?=
 =?us-ascii?Q?nxFfpIyoF+MpG1m/4iijTFwDHw59s3RFwWfiQZLYD68Zniu5M9JVPZoUjI7U?=
 =?us-ascii?Q?2DfyrrjSoNiPK8IykZQu+HnvV3kRI/G5dkOW0oyh4uicCerHhGbdGoR3C13u?=
 =?us-ascii?Q?hqc3+rnvS5nzdfHOBi6TalZVgzu/NEdK/eF9rItADvdNR0nlxbxMN9eGWC5z?=
 =?us-ascii?Q?vTxL2IGNFk59VZPrpbVsxkV/IXUhf36qb2NVOt3n0Rdb0awwQrF0qzCg9AxT?=
 =?us-ascii?Q?UU39+wY5rZwntnQItJFSMVvESy/vRqwr8JVSJVezjY/OOerIWtJ0vqht58hV?=
 =?us-ascii?Q?j6wiA/7PFB+9t0x28JoB1NGmfFcB66A0lzrjF3x5mbgURwPaGCuSEa6VKqUG?=
 =?us-ascii?Q?XMN3osHTExxJ33mDQ6lkCWrKXVbDyfUG0ayEquNu9UgKZYnPbRdkdG4LCTcx?=
 =?us-ascii?Q?cmxz+47q6kDJFphKsN4b1Uv1iA1x2hc/EogJQnmGJ8P5zR7c/xtfoD/G0Z80?=
 =?us-ascii?Q?6X7e/fo3GFPlFUYNE7UJhpmgPBLEffDE37R7ao3x3Dxu+wsI+0XOcze7EF+H?=
 =?us-ascii?Q?oW3/oIV8TawVKL01FUvbc/9fOzp6q2PU3GCQyvhjKF3BNSFtZ6NKzPLdd4mi?=
 =?us-ascii?Q?GU2mPHjXnJvy/Rms3cM/Sh89YkQHL6mdtK39lKPbqykdmEI0fCLFqJU4mKED?=
 =?us-ascii?Q?JC9MjnP5lEd1yCCPkN9uDJStK6NIdgaViTkVlzlEPycyepViYZBGCu1Cf2s8?=
 =?us-ascii?Q?Ma2DLGKthKPWhZ8tEKXzwgZoTmtVMA7iLmtPLCnb8qDzY/SViGPx8hnTaqkH?=
 =?us-ascii?Q?767+T9Fj9T0DQZIKhKI7mFTLvzqn9rFZg3j8X2/YO7AWIfNyx7GmiVfXoKzN?=
 =?us-ascii?Q?jRSMNG82dDz+sVyugQzV3qrzSRrzzaAh36m03+cKU3xpRb9z1OGJiKDLnOM4?=
 =?us-ascii?Q?M4MBHHlb5gYzJemikX1M862zT3o1YwLuBXU32hoQd4VvkqYKP2t0RTVAy+Ua?=
 =?us-ascii?Q?Xd9qfgVeR/ndTIlcuim4CEsSO9KOSZYR8Q/ZciQ0MzQ0jq6UKRhgeiZzEBG8?=
 =?us-ascii?Q?4XNNO6vjGklEDzI9oP5/IY0DNXgen3PMl7Fs/LaLGdHg23RiJx43pyvAIPxz?=
 =?us-ascii?Q?LTN8eSDhf5MB6kFjPghAl3+vpYh918oLetVPFPy8GDCCYeiQyXrbOAs9BuUY?=
 =?us-ascii?Q?wBYjtyXvdQh3u8Ro5SrE9o8o9WVkny5/HFc+fJFTEhBc+1HEjnorkhrPGFeT?=
 =?us-ascii?Q?xDhBhn60Mpz/eTRCB6Jb3L0orF9E8g1BBBa9ctTkfwWnhVAwrkmLvsDARb/J?=
 =?us-ascii?Q?UW7yQhfPrTikqIU5gmtsb34JjCsAPb1KrXq9kXg6vhhqYn/YVLwT90nsBgMR?=
 =?us-ascii?Q?YuaF8sIFQ7b2u0nprAtUnnRHKgnzXRFrxBzF074Ji+AWm3p2AH56VdR3E0+O?=
 =?us-ascii?Q?RYaEu2wIGB+XbwvWgyZMLjAVAZ1ZvDzafpp92DV8W39/b2f2+JJQM4ZYelT9?=
 =?us-ascii?Q?Yi4Adn53ECTTy1YNwJ1qeyMBd8SDN4WIK/lIY4oIfZxMQOGoOJdH6RNy8OIv?=
 =?us-ascii?Q?7gG+3G6K33g3A5xNMO3pa5NocLvjtsVhb4KFzX6QVsN3I2iWD/wbtJEozAYQ?=
 =?us-ascii?Q?nzEVIYMuIuqbAMy5NSXrqII5PRpntKV4Fs55zUsUxOS9cWkWFkutoUKQ4zSo?=
 =?us-ascii?Q?OaO0jjrB+ZwmQv/U1h9i7UpX+45J5a024QoW+jAn4LsEgUhAkwMV?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1375b84e-fb7c-40f3-8781-08de524ba251
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:29:53.3763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mu0eNihN1FfOYchHzoMnpFmHzND5QXz/V24JjT7CBDlWTWMGNSD+jO6Xegfx3AHUBGGzv31lzaZg3zlk3l8t+MWyl52jEYiqJfmIrz7ItQJbl3TSyYfu7nL+rtkoXv7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13155


Hi Fabio

Thank you for your patch

> If an error occurred on line 747, we'd print "parse error" and then go
> to the `err` label, where we print the same message.
> Let's remove the duplicated print.
> 
> Signed-off-by: Fabio Forni <development@redaril.me>
> ---

I think this patch effect will be removed/freshed by [3/3] patch anyway ?
Same comment to [2/3] patch

Thank you for your help !!

Best regards
---
Kuninori Morimoto
