Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7BE25D537
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 06:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740551390; cv=fail; b=sR6yrE+xtHKLxFjo3Sk+gA5XIa/Nx7QCYzt09OCy29bnOhaEuQQtoDTcRFhlrFVVEBgTe69Byj7ImbdeZTOp0IEHh1P3sOMurIrQ2irrxyH42bCag6PThNbHCOjDCPds0LYZIlyHl/8/2gVgVxcgRbqOLsl3cuQfBymK38xlNsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740551390; c=relaxed/simple;
	bh=Ybvmtsf3EwYSXljs+IodMScBBp4zXkUCBQutI25mMck=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=P5qVO/hEk438J2tdJxgRtle3v6m9rkGetIc45kKCb6RMeEC8R0Ho9c6v9BsWnM0XI+lYhfPr5SUJVxp4R/K4Rjsej75LQVCJvBSleNxX66pRY3KprQrizevC++3B+TO1yOLfG6oY06JpRWfzBAF1YmH6XJNNmRB7vP0Y0OrAGTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bzWc+qHi; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bzWc+qHi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFwhpNyzXXbmhrUnsobeVjXKkKsoWIrcUGLJZyIPQ6Z6zGGcGmbsOAD+A+X3kOgiWfhSPnAWhMxeYM/RTq8wfUM+GakoUuOp2f1IvR5Q+P6w31BsYMpGHDkBv4wZ0kgv1kitB3jrNd80UzUVVtw3mlPIr4KYJxOwbsAWvNR6B4xzieOrspo9dMIUcWiDY76NhVYYjJgY7rq0dHCTpWih/gcnUuom2NpDZM4IIW0/xpRMHL+zRttnGBd2xMBiUuqJJyOOjVbJtBcmug0BOP2F/k7XbIFRMO9yZhBjfKgCjdTbBFH8Z+B6CAfCwgrwSEUogR8wXpJG8ywMAZy2inpbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bygZW5f8f+ulaiemlJeMo7TXtkQL6KL4dLgTxQnXuVg=;
 b=J7f/zSHMLqfoocuZZqXTfd3Hoj94yyUe8Bp4a3ZZdUKdJ36fko+7iB8Sd20lbfdq+vnoZCR6brb6Gv/W43TxA9tQ2op4dMOQ8WvWIl5/1VqWWdCKjOwZ7feC3bQyIl27VDZlyIIgfsxpPN1hlGUwJyqFQ11fbG31OJr5UZv63QVx1Xr8unMMAQpsZVWSBtcgJNAWGzKAebplaacRg3H6nHGJXr9lkJk/6baHT5Q3gKxpDlvkfTymjaMOS+f6wIWmkiMT5E0t5XoIpahMOe2LeHK8C2VMTQxDdjLldEsfqfnqmZuPSDZAb9oNjtIpjmIISMS/qdgKn/gWitBqSlqbVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bygZW5f8f+ulaiemlJeMo7TXtkQL6KL4dLgTxQnXuVg=;
 b=bzWc+qHiT8Qnq50nkiIB6deXml2/6HNesmp3afFl7H8n1cW7mtdwDZjOVKlvcGosgR0J7BicctC4TKLRt8X1O+akrstARN0EZ4PB4xstoWm38JWVoB7vsO/CoxNDfcxKkh2aQIsjS8ySXGMqeVzXTBDZdkEKQFRQLxMrdCDH4GM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7993.jpnprd01.prod.outlook.com
 (2603:1096:604:162::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 06:29:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 06:29:45 +0000
Message-ID: <87bjup6wx3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: hdmi-codec: use DAI ID and Name for ELD entry
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, Detlev Casanova <detlev.casanova@collabora.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 06:29:44 +0000
X-ClientProxiedBy: TYBP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f01f602-011a-4f5a-2452-08dd562ef5e9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?/hGnBvCjPpPWZeuVmbCEIU+810+CK6v+8dEj1pApZKtHlAQ/2QM17k/Qqnwc?=
 =?us-ascii?Q?9MHB1V9BkGNmH+iuCJy+Dc30+XAhM4RwfgunPDXLCwDFRVPwQbk4/UgcCn0q?=
 =?us-ascii?Q?fvUkk+4gc8495TxY+I4NyrBdJwCyAOmmDyEIfdjFjwCYDLd7rTDUKVZJs+sN?=
 =?us-ascii?Q?kMOckGMuLyMT/ydR5i0nBIWPhdZL8ykA0PD9H/HiwCA+QbyqJxor+Ct3mnS4?=
 =?us-ascii?Q?o6BwwdsMb0sakOHOYfuF/kXmrSs2Hl1zbmMJ5DNnKISyQKmNiz/03ysn4EHN?=
 =?us-ascii?Q?qV7pK3+64CdOxMhfJix7ZwMkYHAbRLQIZ07N+pSnA1cMjm/Vzxo3ACo9SAhj?=
 =?us-ascii?Q?BmraYjkBHInlRz7M6LvFT17Zp9CHqsGW8OZgb/Lz4deBFD1jcr6N+PXD4+kj?=
 =?us-ascii?Q?kBKFnZDbl3Zk8h8ul0TsGZ9LGdaWeauGDbdx2uayAIs5Ic8o4ks4dsPOTnlP?=
 =?us-ascii?Q?5QvMuPwWO5HVInIwYR3TwB33+BByriAtv3CpGsQN2odiOWz13j7oY1eig+Bj?=
 =?us-ascii?Q?kL9yitV6NgS4PSJytK4puKkwySb1mQi0mARGJxp2L+1GKkkhxB5sqOKAXLap?=
 =?us-ascii?Q?IVAYptu+ef/XKDC0uro3iw7MMCMCBR7A13eEIMGdJxDho73ZeyAUZTJ/CgJA?=
 =?us-ascii?Q?1iQIrSaDoRA+T/GXXzNvApj4zfC9fj/B2UZTnDfht5Km+6jnAJcFG8jqEclS?=
 =?us-ascii?Q?HrPOFNNvQ8lDO5rwBfYWlCnTqTo55+UmUmczCo0IHIhFkq9Qm1ImBIcMnLkH?=
 =?us-ascii?Q?3wu90JdJj48nLjLEhwciWp2mxan9f9qunEt1bbPwwonAh0nEJDmZ2fJ2/Jfn?=
 =?us-ascii?Q?91qPYFxprxR0WWMp/k3r8Ed36USldYPOuYMxBNtluk0CurakI8FPEr8HS7zv?=
 =?us-ascii?Q?iv1AMwuuYe/bEkX90OuymCXAZT8IwtoYaJlQDgXqjEZoS1qS7kAbA81Hz6dP?=
 =?us-ascii?Q?FAtqh1j7qkxjFCKWQUBUsbP/vVT9NRCeQ9v2qtbbuLH6ciqf5ySVT6paoY3E?=
 =?us-ascii?Q?2X8PcClpztBzd0MWAF7uXEYoGnnFPTA1aDaESbfxM60YY3hEm7esdt3iqUUB?=
 =?us-ascii?Q?PBnIl7BmXkFrMQMjKo9xOl8KHgt9lTDZQ9aNAR0CVPJkCQOzxCEJbdRle53m?=
 =?us-ascii?Q?Y2EBnzABJhj/fnlR5PZZzNF/NF/y+5yFEdkgPJ+PZ9rXxRU9a5x678Wi5l4k?=
 =?us-ascii?Q?aD6fJXi/DdNLx/KZiRr1GEyaH5OGkOSulF0/PwbOTfZdd5pNrYDwzbHrlDj4?=
 =?us-ascii?Q?PErLLvwTQWRqMUAAGSlIY0cBdCgGB9KzE1dpqocpCrOnD8pXEewiEjxcN9IC?=
 =?us-ascii?Q?skek27evjGX2WlbAYLLpdTmhKMtrz06EVcGzhsAKUq/6+tqvTL+mZTNFreS0?=
 =?us-ascii?Q?XwchMHFSTVtwpnbx099NMZRxGIKo/yNs968dxpumo/Md4nR3qwsiMXuZmMmb?=
 =?us-ascii?Q?G7FcfcvwlfGDZ+N3g+8IkX3NY/n+6MoP?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?N2ZwO93EWmK/qBhAob4DpcZEK362O3TJW6rTvAL9DvvWNsrC0nyBBcYyT+4r?=
 =?us-ascii?Q?t20C88K7lgNEdVp0C7ByCMVkIe+0d+lSkMzYtoPT4ebnIEzzde3gconenKnf?=
 =?us-ascii?Q?3R6EHugOZv59bYmvAIaVlbMYUgWHAc1eVWmDBHFuur2/ilQv6oI/m6IVaz7n?=
 =?us-ascii?Q?KqW7RNVaWUS7k+JNQxov2hjCl20kJu3g+WHgg7Ie733LoVtGgVelXBCZL/iQ?=
 =?us-ascii?Q?ix5lyq4hTKc9uvZ1OQgipHWco16J3segZqyP7LBrTdJqDn8jADxUOhcsDaeM?=
 =?us-ascii?Q?eYw/khygdUs4m/6vGBEYft//mdoFGtvqKnKLIJumC312u+AepOYZt/WHwviu?=
 =?us-ascii?Q?0e7XW5n3K1WxnBcl9QmSrkF0qT3FozR8N49QD4+kXIk2JQZnkWyXUxiRnL67?=
 =?us-ascii?Q?X8Gou9bbbJuMLmHc6eg5tDXUcOQ3TAvKfzTfQ+Ve0GhAwOekFgG0Ov3QnSMI?=
 =?us-ascii?Q?9q8u5S95J4Az+6xiT2zg77FCahY1uMVzMBiL3BDBpjTAu1YChi7NjOJ7UZQ3?=
 =?us-ascii?Q?nPGd0BmAay8przXHw88HO/UDkffBDn/2pq23JEZBKSkl+sFyCgO7i2GgYC2g?=
 =?us-ascii?Q?BwJFsnjWN/61mp/j4kw1Pfsc2dLxyhLVKV9XopcQJVX/DPx/uCpSTlE6e8gB?=
 =?us-ascii?Q?WfViPu2Mc1aMxLxAyAeNfmdF4gVGOa7Z2FKW3G3Phd7G+DfW3JsIe87Lk2vG?=
 =?us-ascii?Q?t5/d5tSvXY/vPOMwESHawTxI3w3dCth9PkOFhudOKsg+qJy6xwhqYakJdRPz?=
 =?us-ascii?Q?M9/iTSXleEMB94Xbu1orTWTQ8jDYeZ/GmHHTn/UUFWaBIdiO/+e6AwDcIcpr?=
 =?us-ascii?Q?9AVDu/CBXNTGaXqeMZ1pHGRiYPqa2+4tv/ZNdSda0aQNNrpxsW6SFEzgQAhc?=
 =?us-ascii?Q?csFYo21ntVZP4+32X+orgrv+/WE2JNBZ8mKCnubUYuAd+Joqp9uiAJcWopu0?=
 =?us-ascii?Q?V85Yji02xU+rjjyInYlGAeXUAuByUlXftMFiJHG8teNcWQgZIMGodl2hprt8?=
 =?us-ascii?Q?d93AmY2q7wwLmDBM50yEf3gwR4rcZfBqUw7s+o+CYs2+G1Dy+d8eeuBsBUtQ?=
 =?us-ascii?Q?YAAAEngZJFfGHsAamgDT+IOrhr6HQngnqqGGl9tC5W3prCG7OXjrZxc4sExD?=
 =?us-ascii?Q?rWCUh5dVDPO3XGKKej8H8EWpl7GHiJSHjfTCxjHFhEumaPu7wRJU8HY1+vtS?=
 =?us-ascii?Q?zMgK78KAH15fj/pQ/i4QHK5saBnCXehDJoFXe6gX/5kYvfQtOYoczsomsenZ?=
 =?us-ascii?Q?NzKVyWDJufjCGt5uQ64Ko0I230hO7tigNZUrM84hW4tw8BzQgde/GywYoJ3H?=
 =?us-ascii?Q?BBc9N0Nb4q+EMfhbHxazTrJ7hSkyX1+WveTUdCuiEbLoRHC+Cn9IzPsCrTOq?=
 =?us-ascii?Q?8KcgVtY/Sh1Zl8sF2TvEjTtrcZTEiW6p6mQOJGhKFtKP8wZW/DabdVMM53T6?=
 =?us-ascii?Q?OAHDszh5UzUnXLx7sZa2+eNuaw11bIhMoGpCuug4sAqs3GREZW34VC3w3utS?=
 =?us-ascii?Q?ieEyWUmpC8PjXEXOUHRSr6Ebw43CTugrcY5ydUxWsxeSUP6SQD3MU756nj5f?=
 =?us-ascii?Q?ttRv3Wtl7EP7Gydz1vPk8STFAz83mRfKqbb1wJPhmQgWTkNWwzEG/vdUXqYY?=
 =?us-ascii?Q?GAuCs7KBPaCxkeYDAx0t6lk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f01f602-011a-4f5a-2452-08dd562ef5e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 06:29:45.1709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lRpvtK7aLHQ94l7X4fhkmnafhNVCtEaOzBM4XfXCJCM9pIK8q8NdzocAHw17S4Bv0kfqn3FsjZV28UYJ33ZotEp5fyQ5fRFmos8hER7HaUQVw3LgaP8Vkt9eguD8mU9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7993

commit 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs") adds
"eld#%d" entry for sound proc. It is using DAI ID. But it is possible to
have duplicate DAI ID on same Sound Card. In such case, we will get below
error. To avoid duplicate entry name, use RTD ID instead of DAI ID.

	proc_dir_entry 'card0/eld#0' already registered
	WARNING: CPU: 3 PID: 74 at fs/proc/generic.c:377 proc_register+0x11c/0x1a4
	Modules linked in:
	CPU: 3 UID: 0 PID: 74 Comm: kworker/u33:5 Not tainted 6.14.0-rc1-next-20250206-arm64-renesas #174
	Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
	Workqueue: events_unbound deferred_probe_work_func
	pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	pc : proc_register+0x11c/0x1a4
	ata1: SATA link down (SStatus 0 SControl 300)
	lr : proc_register+0x11c/0x1a4
	sp : ffff8000847db880
	x29: ffff8000847db880 x28: 0000000000000000 x27: ffff0004c3403c98
	x26: 0000000000000005 x25: ffff0004c14b03e4 x24: 0000000000000005
	x23: ffff0004c361adb8 x22: ffff800082f24860 x21: ffff0004c361ad00
	x20: ffff0004c14b0300 x19: ffff0004c14b02c0 x18: 00000000ffffffff
	x17: 0000000000000000 x16: 00400034b5503510 x15: ffff8001047db447
	x14: 0000000000000000 x13: 6465726574736967 x12: ffff800082e66d30
	x11: 000000000000028e x10: ffff800082e66d30 x9 : 00000000ffffefff
	x8 : ffff800082ebed30 x7 : 0000000000017fe8 x6 : 0000000000000000
	x5 : 80000000fffff000 x4 : 0000000000000000 x3 : 0000000000000000
	x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0004c15b3600
	Call trace:
	 proc_register+0x11c/0x1a4 (P)
	 proc_create_data+0x3c/0x60
	 snd_info_register+0xd0/0x130
	 snd_info_register+0x30/0x130
	 snd_info_card_register+0x1c/0xbc
	 snd_card_register+0x194/0x1ec
	 snd_soc_bind_card+0x7f8/0xad0
	 snd_soc_register_card+0xe8/0xfc
	 devm_snd_soc_register_card+0x48/0x98
	 audio_graph_parse_of+0x1c4/0x1f8
	 graph_probe+0x6c/0x80
	...

Reported-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
---
 sound/soc/codecs/hdmi-codec.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 17019b1d680b..bc01ff65bd6f 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -842,12 +842,28 @@ static void print_eld_info(struct snd_info_entry *entry,
 static int hdmi_dai_proc_new(struct hdmi_codec_priv *hcp,
 			     struct snd_soc_dai *dai)
 {
+	struct snd_soc_component *component = dai->component;
+	struct snd_soc_card *card = component->card;
+	struct snd_soc_dai *d;
+	struct snd_soc_pcm_runtime *rtd;
 	struct snd_info_entry *entry;
 	char name[32];
-	int err;
+	int err, i, id = 0;
 
-	snprintf(name, sizeof(name), "eld#%d", dai->id);
-	err = snd_card_proc_new(dai->component->card->snd_card, name, &entry);
+	/*
+	 * To avoid duplicate proc entry, find its rtd and use rtd->id
+	 * instead of dai->id
+	 */
+	for_each_card_rtds(card, rtd) {
+		for_each_rtd_dais(rtd, i, d)
+			if (d == dai) {
+				id = rtd->id;
+				goto found;
+			}
+	}
+found:
+	snprintf(name, sizeof(name), "eld#%d", id);
+	err = snd_card_proc_new(card->snd_card, name, &entry);
 	if (err < 0)
 		return err;
 
-- 
2.43.0

