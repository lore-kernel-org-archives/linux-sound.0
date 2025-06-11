Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2364E24B29
	for <linux-sound@vger.kernel.org>; Wed, 11 Jun 2025 02:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749607220; cv=fail; b=n9B0Z6mF8UmCZhxV9vCGa23Pze3iyJNmnq3r5h4Oo1ENUtz+9ybGnM7+FnAdJBCHaXjD2rQw6oUpJXDv9fOmomG8uuf+p7hn1YgvPOy0L775GcJy2P4nNEd3ka37qgLEi7brZhufQxvPs8xDfC8e7hOGxMFr6P8pNy1eiyRE3UM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749607220; c=relaxed/simple;
	bh=vDTHHZAw4wFsPv6AhHkNhtOhVcrRXMYtTx+un5z4Bv8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=i9nrgUN9O+ittQiq4pGHO5YrBVf38WpyTDpIayNNtp6doXycMmsdJM6Gcr9vFEE3Ruvj2TOV5QXNLC12x6JVDJKOLk9iLqbu2T4GRY51lvD1JQr2wlyA7c58yo2xFJNELILWXflHo5ifuCMIs/XWSH2EEZYBXTZkf0Rjgedzxz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cmx39Sk/; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cmx39Sk/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2KVAGQzrpkuvMYP455ZHy127hNJnOVQN+vPR0MWT/irTor64/Y9axVlnjxf8uzlH985zD+3Zf2x/oC2+tbT2IBLChRFkMl8ptU7mlgM6zRhQqMg/ELiJINqhBBX3auC1FeLRhwOoJ77Oti1bsVoOkWtm1f8kZ1OYgNWQpwrY0Bpy5SVY2zxK0XvRDESuz/zkrAR6GPXr97pn8GBQMTgRLVm0wUho2YLndjm61720dDWNtm/oHuiQO8pZ0tLVVcekdtCHH3CrHZqEyFgZa1ahqWyAFpizOtt544B1XoCxR8FjaApoTUOhiJCB8RkU1a3CLdEQMBxgCu9hJYGnIBDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+Lc+yyOCL25155dI8z9IzfJAkxeRAPrUC+3r4rwMH0=;
 b=ZkkFeZ316bcssABXWB7tUfFIG1ekMoEpU8t7txMz+9Y9AVyhxt9EdDYeyUWM51XgqSifhEhrbL0EwJPuixkQalAFLE4GvSvypYpzycLch87IGfzEVS6ScfTVoHubUv4V6sanB5h7ZSYXHNqoqHBexI+CWGOab5QF86wDATM+lGhlDZ5sHwbxhfqM2qWInzL7EqPlPeE1MwBQcj1ddOWoYGjIPYfxD19ZxBwBtWymHbCNFO4fbUEDYONPOX77IuhFA79sR7X8/AkgS4Ue1gsmGW2yckbVshetD7wwWyVkvCq//d78KVu0T7VEn1v1o0eJl5JQ/c8oLNtc9iIS8gsNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+Lc+yyOCL25155dI8z9IzfJAkxeRAPrUC+3r4rwMH0=;
 b=cmx39Sk/g41yRlyqAkYK2SFvHaUCIJO3wTxlnuL6+Ulx4jeedttMUZJZKTHXD+WAG3O5OHgc4ni3glSdl6fEwav/eE2CGagMSXJDTxRa5m264nz8KFowhGx0edv4yq/Hz2lkWiF2fq15ujlekBIAicP6IZY/hz57jvv1y6l4wp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY7PR01MB16043.jpnprd01.prod.outlook.com
 (2603:1096:405:2ab::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.32; Wed, 11 Jun
 2025 02:00:15 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 02:00:15 +0000
Message-ID: <87jz5jhwbj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>,
	wens@csie.org,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
In-Reply-To: <0ebf280a-ab8d-4993-9d32-b4013c5cacac@sirena.org.uk>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
	<CAGb2v66xb9duevXtZf=YcUM8WvoopG76_yud8PHXOnYD+i=kQQ@mail.gmail.com>
	<aEeqsul4gzxde4Mx@geday>
	<CAGb2v66MU_Sz6bVPrvMacL-wX_XU+JPWxMWjsfN=vPkzRsRoAw@mail.gmail.com>
	<87cybc8d0k.wl-kuninori.morimoto.gx@renesas.com>
	<aEet9HP7WWBTdz6P@geday>
	<87bjqw8c11.wl-kuninori.morimoto.gx@renesas.com>
	<0ebf280a-ab8d-4993-9d32-b4013c5cacac@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jun 2025 02:00:15 +0000
X-ClientProxiedBy: TYCP286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::6) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY7PR01MB16043:EE_
X-MS-Office365-Filtering-Correlation-Id: 382fd82a-77c3-4127-140d-08dda88bb584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9utvz+r7AaOEffSOqjn4LkxcVs7bftZ6KqnBjmlBj1xKod8l9Mpy5m8Razq5?=
 =?us-ascii?Q?haDHHnp1RONMv9R9CXBC4HrG9RPrA8O1pxxjHBpwggomlYVvKUNuqtpcG8bh?=
 =?us-ascii?Q?qgI/YWBOufXOI/wXg8/MSoessQoI2EUjr2JJsBXx3LI3LHl295jN2me2dIMp?=
 =?us-ascii?Q?gUjqwTTy4Dsa8S1rqFW7cYJP/tMWKbwkMFMKyEDO0q7R1ZBb/FWlbJ5lx1NL?=
 =?us-ascii?Q?YywvoxjrY8YOeTwcS/ZbCdNnvhaxjZ1zHJnZr3/5cl1ozCwzk4l/BsacMpcf?=
 =?us-ascii?Q?pwZedpne6eMHRTFIAIUeXP3zL7Kn77aJyD+v/rzRsBfNMPxcSaxL+U+PDhyu?=
 =?us-ascii?Q?UtmtgpEnsAFdNx4+UL9RId96B6R4m2HuOSVv2DkFzJSLJf3TbgFLdQrMArQE?=
 =?us-ascii?Q?5YeIi8l3kiPuQheKyvFds0ydviadJ5xuSXmRYfilQ3XZifszRBmr5oCkQDpn?=
 =?us-ascii?Q?trbooQr6WK4LnJ2KEVbZFnQHpsnKR1qk5vwgOYlmmRteLZyIyoS9m0hVJWM/?=
 =?us-ascii?Q?WboC09sMW4eQCyLim9hasraFPOtMiooLiRWGAeQqZc2PEoJuo/33pVFfJLwK?=
 =?us-ascii?Q?7rble5zpoxua8fCoKqpvuSFZYYk/BMNVNz7RsWt5Z/wv7l94hI7ohcun1fO3?=
 =?us-ascii?Q?7c5kfIAt3Atxaom0BflRSt7QP0wWCpVtjP52ACf+wThQ+ROgqeQxMVFOmBey?=
 =?us-ascii?Q?CBpXofYWV4ymXZeOAAmIdiuRPr5uWx57VpFvwgF0xeDCDCP8n1GoJWafNNxp?=
 =?us-ascii?Q?eE5SR3gRHPwP+Zhqqb7uZ2L/aM7BuFNjiYli6ejyP5tLpcP+SaW/sPHcndSt?=
 =?us-ascii?Q?Zwey6rvHt7FAVqcaLkEVTAcTo1rHmdiIMdWCJMtJfaDid8Mqt7N79KHm620k?=
 =?us-ascii?Q?j75quFHQXVZvo6OpoQIjS56OIpdAkQexVtDUP1EYkK/Kk36AD7XWW1yf3GYe?=
 =?us-ascii?Q?9l1dizJbMZWJue9nZU06flucLEz/d+UTjH9uZzYcXCsM+yiBbMS74NsBo/C8?=
 =?us-ascii?Q?Hsq2fF6Vxfm/EtN/jXt+swzdmPqar1V3t5OJW/I1SOyRhSiKjhwzNwD2V/I+?=
 =?us-ascii?Q?pnRjkztkHVVoWKCsAl97jd4eYRVDJ5atNl6QswybTBeTwS8DQFg0KiwYzrYK?=
 =?us-ascii?Q?UCtZWBXScoG6AH4BxrJge670W7ED8MWDWCzvf/VggTw/I+VFMpzaqKkPoaNU?=
 =?us-ascii?Q?euGojvPkbsX4UPSAHbJSpka4OvejRBayJcoKGjUdtWnWG4YMn+7MrCGLoRfX?=
 =?us-ascii?Q?7Lphd4t2ee4Q8hrjAMGtPqJeCJGHL+fsejCIUazAPb6oopqNE1iu9tiOg/T7?=
 =?us-ascii?Q?VjD0keoxkI0ID3eXhfs/MtT/AvsHddjOYnQq9aXcLxfI6Iyqwgqdvwx1S3id?=
 =?us-ascii?Q?3/JvKH3FaPpGz9aS0IKVpZUux0WvFWLXB3ppisilmGSbRrz7w7CCcJDzg7SP?=
 =?us-ascii?Q?/TvwCapICnKu5JLIxiYFk6ia6Aj7XF/X46Li9SKHEyMgSXBXpgNzwg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k2r8bj7bLH/crbayzZbZbY6ZuvdyCuJTIPpZw5Eir8vn44U8cU98l/HC4sg8?=
 =?us-ascii?Q?MW9/vHO4XvYUnzVe/6EWXBz9PLpZCdcuxeqdpX3HWyRIU5I8K9ymnTbpO1vP?=
 =?us-ascii?Q?kTZFM84qyO/LC0SFEvTSnxZz4VXviBZGXUxmSc5glOPGHo8yUjk452x25bFM?=
 =?us-ascii?Q?qPB47ox/GIYYtjV4nTxRhdyHlMb/u89bRW9BU6l0zBS7miuEQ0M9AgJ4JfR4?=
 =?us-ascii?Q?Pl9qB2NW17VNea68rfGUPU2B+lHxvm9xy4Y2d5pL7iOIY1RLX+Tt4FysUiaD?=
 =?us-ascii?Q?QwMrcDLxLlp7VE7QgySKK6hYRxy7ZewAsrkHFe5nSXVU7ga0tYRow97z0q+t?=
 =?us-ascii?Q?LnQo0BBfyaTLjodjiaCiKimhppor+yApuWhZ04JKQvuofuU6A1tk6SZQ3Ron?=
 =?us-ascii?Q?VUuzGzBItUrVBOACOP98QuSkaCM43p8/pR+dhiJxKZF8b7bZc26vhv332XJ/?=
 =?us-ascii?Q?GpbxTFFCn8TFPaesP3VtsGw4Md+LpEDraldMnj5Ow/aFLP5JGxj5hTdyVG9a?=
 =?us-ascii?Q?l9vhvCJfAzmi168I28GiKFGHF/S3lr865Q9kXonl1RbX2v8yd8/sipx4x5jb?=
 =?us-ascii?Q?o8mC0EYRLSFcFP3GOd3bYZY7/Rx3ml5jOTLLg8rxZ41AJw7KFB/rgq1L8GQJ?=
 =?us-ascii?Q?Ab5JJzMwjbH8sBpMZyR0VcnQrAzmp5hWqqRQ2oBaNFdyn7d0I/Ot9CxkCqoI?=
 =?us-ascii?Q?UrdzoRlgbrkGYENtyoo9BskmnIwMkNEHYBXBDIAcK94N+LDWWRjEq8231sT7?=
 =?us-ascii?Q?lSYagtm1W55MSKDdtnbAtdtl+fTMvkrGwajALYatVzuC+NUpdfXiikGIJ/Wz?=
 =?us-ascii?Q?Z3Xj8+1TLrmEnC05vTaAm1aQ/1EFUhG/Br6rg2YMPcA2B0YWtVGLZ500Lrjk?=
 =?us-ascii?Q?IeZEk09HlAfBWJQXyApGZwpm8DGfYDCfxNu2+CU79N3/FGTQ12O4KRqfoY3m?=
 =?us-ascii?Q?uw9uz8rENToNogugzzOce0pRoa4D8iwcL0LVSip5ZE4jGoRsNoqEoZogbII6?=
 =?us-ascii?Q?2Xn7Nlc4T7whEewdr9QvYtYAdfkJZ+t7NKPR6wzVfUpBTZ4bqd/ygpru1VhG?=
 =?us-ascii?Q?nbu4v0PUC9ETWWIl1KtBqOOVeQj3vitwxCdz5cD+OsjxkzotggZ8Xgt2sQx2?=
 =?us-ascii?Q?Ea0h+J+sy3fJLXuxIFSqIVo/jE5O9KCHvv2gPnnnM5m4ddyTF+ouaDHLBkJv?=
 =?us-ascii?Q?ma/gzyi4YzgjT18LE35jOR9UAChQ47q1olxmkmDOPH5/0A4d1XRdkDfKLazt?=
 =?us-ascii?Q?PBrQXWhyZd2nkB4DRCVLMpIhGg4otq/XERRGJBZfG/rNA6xg+QF6VL6iqVBu?=
 =?us-ascii?Q?7l2sO+S+bzyKUK3tyeakmk8wSjqAoOa6PrOXgqncYkVJG7a2XMoi7UKm1Ish?=
 =?us-ascii?Q?Rz4T5ci1uuneXFpW4rd+LxOcPJ37FKOTpW3yd8vPHACzTvZrKAfIRP8v5Mh+?=
 =?us-ascii?Q?cbbepFdtsgJB5RLjEP+lDVc8HQzgJQNOb0JeTiPhaEeYXm7CP6b8OyCeaZVi?=
 =?us-ascii?Q?7U5KQoF9Gsqy01SwZSROxKB88vpDNV3UYqhTWL5mG2+rYCqE9V6SmBPSxjTp?=
 =?us-ascii?Q?LvfE382RbQ7lizS54DpzxcZa9Uim/ZpSEnvyyj9+zu+TY5R01vFLaRCG/Qa3?=
 =?us-ascii?Q?g7oxsGDXMhDlcpwzlLO55DM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382fd82a-77c3-4127-140d-08dda88bb584
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 02:00:15.7833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lmj3+I2NQVvXtsat+cC3pPO08AtUY8NExXNtA2gVqOKG1H/kD1+/L2lD5ZjDGdi1cXFfZfRYhib0hj3RM4MFtiaDMcScPuAjyBZhj9NFDnXhzjUOF3ZV3u/46CtU0iJq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16043


Hi Mark

> > > Sorry to intervene again but I think Chen-Yu's concern is about Cc:
> > > missing to open list (linux-sound) not his own address.
> 
> > > He was referring to the (likely) fact that you forgot to Cc: list...
> 
> > Oops, Indeed
> > Sorry for my miss, will post again.
> 
> I do see a CC to linux-sound in the mails I've got, and lore appears to
> have a full copy of the thread which means it should've hit some list.
> A bit confused here but I think it's fine?

Sorry for my noise.

I have re-post the patch-set, so ML member got full patch-set in final.
But To member have received same patch twice (with Cc: linux-sound,
without Cc: linux-sound).

Thank you for your help !!

Best regards
---
Kuninori Morimoto
