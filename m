Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B119C556
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 00:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776904306; cv=fail; b=eUYU9sk3Q5Lqbzh+OOOQ48vga9D7q5cca398H0ZsrTZK/b8+56qkhJFhg3Lyw9FoH288LGcV4Z2fQ0hehSDFGMZs3uokMXOQFAA1+aVX3kn9TCBBdrhpU2GD7MmBx+LmDCw0wfrxp+/DtZK/dU+2Gl0ApNp9xJXK4YP20h9JbgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776904306; c=relaxed/simple;
	bh=O3Bo/95eSF2rccjGu/vYrGNtGkvuXpY1JWEcV0MJQis=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JRNhl67Np8iXmseV9+LQqaDmhdWsJA2kyv7DO6dxvUWGhV9F1tEo1ild6RcHVqWwiZYgveGpHqZTCxYepldwSEhNJmisBUSLPuIBKa6nrgpPN1zsq7mXve757HCkFCk+WrGGavmQfdmbqVpuniszMi+s0/w2ZtXNbC3xf8n/jhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lDlG8d1v; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lDlG8d1v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRA6bGiVx27aKm9SqjW/Hu2KhambdzpNeu/7URaaD3rwa2iWhZXaf3PdEU3sLfUFVv+Iphp9qHWR9rJmX9YmKT9hG5RgB7HM5Hi4/ucJ/RpB6Vwhl7ooV1n+57rxC3xfKmqYenmxDKcCk8u1ubMhr7d3AZx1XzM2GYgpDC3kdkQbQCW8rqJsonV+HZvJthNydCwksrUOBiYaSAABWGzsNvrj5kDCRbJ5UJpELd9DGEA5maM+Zgsz0QHstldoi34+kKrVlB799okVWFOfoxo84ZJR5t7PKs/rWhO5aI7nj6svMri0tbQNJ/1zFFcv10yimLSjde0vOQ+L4gAZc+8Sxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGlU2XWUKT3VVUZAGJEbUepAWTiPqzmoL3ugL1SDQ9Q=;
 b=TJ4XfxNVUqIWefG/YHejl8kQKbTTykcxO7I3g040VaVFaaQSHioCDN8IKClKcgqH0r5ZJiC3D/kPcY1DAk4wPDW+8DK10qjFViqTwF7VB4yAvD6XRgI/f6HNcXL/84u5NZiS3Slw6vTvbS/xg5tyGEcTPOhtlo0Nv6kL2qv1pFAM8mpMy3UdeXQ2/j25lPfrHDL0HcibcFGtvW/yUWi8pJWflpQHP8tYLfqj1er8i4MKgKz907kTXGmXosZYlcdO/vgUl7CCeWtqPa5BhlvYWefqqdZijeQDYerLBkFg93HeDUR3vNK/x/7tV/28UQeHzvVLGC/oaWZssRx0PncAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGlU2XWUKT3VVUZAGJEbUepAWTiPqzmoL3ugL1SDQ9Q=;
 b=lDlG8d1vwe2Xo4mmpRZX3pMoKLmIKsgvNI6qI/xqJ4iW+8BHMGpF4iZiEeUA2o3skaQabiB5ufmFLwaB8DYZd/D18COOFJquwChjRvD2ZRZHnKJfJhfBdTafwxqw4XeNRn+ffxvJoUHdDU3nH25KoFCH63e0GlW9krYkjmMYQz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSRPR01MB11584.jpnprd01.prod.outlook.com (2603:1096:604:22f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 00:31:42 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 00:31:42 +0000
Message-ID: <87tst2bjq1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH 1/2] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
In-Reply-To: <9xDiBMSWSvmvMeBrronf_A@gmail.com>
References: <87ik9jk8kd.wl-kuninori.morimoto.gx@renesas.com>
	<Q-gEHDxFQKq1L_9pbbzxnA@gmail.com>
	<87340md2o4.wl-kuninori.morimoto.gx@renesas.com>
	<9xDiBMSWSvmvMeBrronf_A@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Apr 2026 00:31:39 +0000
X-ClientProxiedBy: DM6PR02CA0134.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::36) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSRPR01MB11584:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5d79ac-99ad-4b32-201d-08dea0cfb11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	658/8qKw/hSdhBuVOisVfno9xzxyTjtAo1XllMts5HN4w1wQaDtYCJp2WXFr/W5HY8opjl8Wv9LoGj6gGGvBKcjkGZMX29/5QE9WD9ruKsJZ79fDL9G59MorvQ27ZqFUvsH/9PIBYNAxMCY15mEhXUr3qKM5fYNRORci74mIFfoTrO0M3m/XqUTmFu+sw1jWCSStPif1ww5Ybgiy31uPp48/8Y1JBTipqfvuyYa46h8pODUFbZ8/3GXCuTLgOc39ue/BNSQHUxL22ryINwB9jKdWxBxwbaSLDDF2VNoxOot/8VyoknweUEaPJT6Oe6i/vIsGqcJRgmBkrp4CiWzSJ4awU+z0qt6YikmPVYaCTz9wtfrdg8GVSOssgbKBx1CsCPYuMOev1+ohzsdzblnuNtYwpFxngyRflIRNXwHaHR/0WpgM1zYbdi9Z7wbv0okfWoyj3L9vwxH581ILr06YUFl48xyYaPETo4KJy1LdchNTXT44LLGYLROw6yynAC7l7Br4zX/k6cpXCYBbaw7cvxAf3LSa3lh0x7dlC8zIOkbC4wQSnYR3ZEV1xR1uNVq23C3/rUhwcZdUGAJoq7AaVnWPO+yu6ik/j/rGF9lEqaqop43WIJw2kM4gYasJgUIgVacBCCtzP4jrMiD6GlnSV5MZOxqPvg6o3+2owl0cgwS6Lch1W0SS70VT1UUCZPK5V2zLqZkW3EgC+g0ORJEQjfKBsZhOmXPfj1rvV8lV4qXL46q+tTT+sro5Ru9eLhVyw7RvDJRbzo09c6ptbovoYcdayjLYkVuh6w4GHAziC4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kHgDFdbf7f634fKtwYReW5Qq0FRuaA/85oQX41havCy94E/kCndF6zqn+4pI?=
 =?us-ascii?Q?V3W54PyAyBQ9XvaG6wEu50xHmGfs0vz2eYxpHhFAYWm/led1hln/JRJOaM8m?=
 =?us-ascii?Q?QdaiI9rIipvEsokQRrMHHe+/VUqnLELhpa0NvgVU16LRx38hFXZI/fOIVBB4?=
 =?us-ascii?Q?c4iRF4T+lC1gh92U+blk3sWzBvTO3UR9uZqEGA5m3HNrOyq0/7EFVj27O5iL?=
 =?us-ascii?Q?tATWFHHd53c498wfilMHC+OaZ0JvhYCXQcMPrAKU0DYmVY2X4CpQYlfP37ka?=
 =?us-ascii?Q?AYqmKwYH7cAjrn6QG2awuRgRSJL42s+pyUJlGXnHymlZH+7dP0Bm4XMztZap?=
 =?us-ascii?Q?iKVOTc+G2wIz93p83GUBa2/oyP0bObFFHgFj+hpf+uNk+ZiiJpg2aQ2vSMyc?=
 =?us-ascii?Q?a7B2JGcMNuXfANmKttAxyzXiM7R923+txak/+UezdbkeK6yXBXyC7ZYzYlWR?=
 =?us-ascii?Q?FgSvnPSXLjM0BEivUEX/emB8pJeE1GzbJa2numhrxeoXBmQMjkGANIJXOsVu?=
 =?us-ascii?Q?lBXbqP8hIeJ+v5+EduRGLSWqoQ35Ur1qivHe2iA/KyBkUoSCSPqRl2u9abh/?=
 =?us-ascii?Q?s8xaoZA2h3Nu7hnwOEzrMtnt80Eyj6Hj8EuOz7yo6c5jiQQo0AmgLdCHw+Vi?=
 =?us-ascii?Q?AzdVFnXJ52P9tnadQf/i1ISSRWkz7kY/54ysGi3IQb5qYRknB5w0qh1RVgxI?=
 =?us-ascii?Q?XqaZV1pC52aKkgcHjZSWenxF8Z1vh1V7xdtmCaId7X68QdIgzm5VqcSpAMfx?=
 =?us-ascii?Q?V4IAhEAbCRN5an2qqNSPivI4bhgPgB/5OVCpWAp/hSGwg22ieIPXb2LXv6Vp?=
 =?us-ascii?Q?KygksFQN5k6XDlf4khetvHlSmp9ABspFhLj1qthJ8jx7hktavN1b4G9dTOEd?=
 =?us-ascii?Q?PmePnSr9KWM9XXoGWeoJCUJodklR69+wBxDKjwYCJrNQOd/l+CcZnLPNJ01Y?=
 =?us-ascii?Q?juoJO5Bbs44caZmbdaJcJ6hFOydS/lDwmtSU20osiTqOpxtLLCzhGiMayc1W?=
 =?us-ascii?Q?JmGiZqcq27Kdya6mbw4idSeQm7EjkDKdEgq1czsLCsADlbL5M0m9ZbKcYYtx?=
 =?us-ascii?Q?GKRVeG+EZ6zBjgrlZiLUag70AWdqauWGyd9N9snI6U4sychrSyMaUhAXUQM0?=
 =?us-ascii?Q?NFVG30rHA514ctAUbicYudORWlwH6ESPzbvLO5VJaDXjTP+zB57XNreaEmrW?=
 =?us-ascii?Q?wOSI5idEHF1G4a5e+ZcucU5bXtH3tZU1WCywYRDGOuMXwpRzR03mKeQXx2Jz?=
 =?us-ascii?Q?ceN9nO9nlCRz1yZSOsHu+KSAeWkHshgqa/DYVfpLjLLn/qm0qx7pd4B3enf/?=
 =?us-ascii?Q?wYU7mZGhT35cWapQklMaR99616fxfedfuP37TDX2B3ZcjbB+e1wy+6d6O9Zq?=
 =?us-ascii?Q?z4RxiZdnvcjxayBe6fmELziJnSC69f2nPlpgOHxtq7WrmYuW9tCq2e9T7ncv?=
 =?us-ascii?Q?edwj72WlvTxS/CSu3FyBWSpXzdwfxQrZCgkzH8+3cOeP0l29Idx1wPGcHFg2?=
 =?us-ascii?Q?XT7nkUT5lM1GpvJ9DD3Nn+VPfeL5KdfTMryLCmOB51+oiYUCL1c8ceEmEDUO?=
 =?us-ascii?Q?yPi5+Fg8v+urdBehZV0uF6ToK24ittvsWMt9aL1zVVG9p6JKCrKU5isczv28?=
 =?us-ascii?Q?ujRCLwQukmFB1ChgQFq26bqKd+HCDe6diNPmW8Fk/LiG+L80LNVTZtG6pz39?=
 =?us-ascii?Q?186v/KG6fP2UM3EZnxpbX5Nz9c8UKuMNH+0b3AhqRGSxKP/1L1TN8JSOcgvR?=
 =?us-ascii?Q?UeYz++rB1VbcYzdJQe2UDZvbFt3sag2H9lgi0F7V/BOTdxpRIwzC?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5d79ac-99ad-4b32-201d-08dea0cfb11a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 00:31:42.4307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMw553zgrIbKOTK4YtrLvC6yrZoZg4navTNiNYMfN/BZGCp6hm77dw6RiP3wtlV6YCSJ2uJmXI79V205eUrJo/lSCe89RHS7Sh9nF6aWa+pK9gyLxg96P59inRG4dh1V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11584


Hi Janusz

> > > Thanks for spotting this.  We should now get the component from 
> > > cx20442_codec.component in _close(), as we do in _receive(), and return if 
> > > (tty->disc_data != &cx20442_codec), maybe also WARN_ON(), or even BUG_ON().  
> > > Sorry for missing that.
(snip)
> Yeah, that's exactly what Mark pointed out as missed in my patch.

Oh, OK. I have miss-understood that :)
I have posted v2 patch, please check it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
