Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9BA7DA82
	for <linux-sound@vger.kernel.org>; Wed, 11 Jun 2025 05:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620450; cv=fail; b=JHf9+wqUburUOgkaDysOOgyMpXcxWZUGyC5F5bFANee/SSAjCDp77aCUbRHzkpvKaVvMd23Ext2ZCsVB9PzqXivDiLsE29reS89Xw9XYWEY7Vjju6Qh30S8gOzrW/7Ey5ds/A4PaY5MNhZjXn8bfvDXR02vHS3yMPs4cLG8lHrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620450; c=relaxed/simple;
	bh=P6JGAEqkb+BS5vnM8pB3zrwQZxjw5foqU51l7RKr2ek=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iwcuK7exSpTZ2ex+AXawp1SqumRbLvjgvR+6FGNFeW6oauR6U+r4vwzNmiUHj7+WClVqYVQtGKIj+vE8WPMZqumO8Qei4RNFW/UbD6y1WB12nfB015toRuR4KOgzFQxo0sAdkEaUWD6LeEdxDhOA5dwnwX5/0fGBFYxzTrPhtEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LHjXyAKs; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LHjXyAKs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cg09x24Np1n+AmCpX/IEHCD7+SPvWKh5fr0/g5U5HSL7i8ZL0VWRc8wli3BRU36hYuViEkZ/c+zSV5rFJtsrN1F2RnkFcD+j4XFi+pn4bvn9JNQvf50zSwmFdMpQ04H15aFiu4D9TfpynULO8zUbMnl7FAt/COX6skugtNzPFszXkuA3rlclMMlAWMjB4AP2/c7gO1a21IHeeljE5BKm8mkt3I2FFmVhqVtiEV0AXOb5YjIQwkSUyAceXvKnEWCdICDXN5t3T3lUr/xHrsjY63PD8Io7cPw6Yyab9NrNOaQuOx73nfYaf0jVZEcHERZTP7+2BC+e+icVZ/aFvjuMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC+lFd4mrl25D+01gtovqrb7+fZ9r/KCDG/CFcIVvsU=;
 b=YMqwQKqhiZMfCZXqnot2Ys+IqvSan4M2oS3dCJ/+nrwlGYqJT/hvqdiRsAuaRr/2mbp0GurIx2/8Df3mjGfCOhREqITSGaJg0jeowNS86See2ujHu2l+rSEnTfZZ/gJRcGkTJAK0hNDAJJ3gVlLRx+C3HorsvU1QWmrBo45SLyXBjYy2tsPReOvI/cq+jW0LavDceZHoVDFtR+7A3k88JeuUIiRUTXfB5x3BcXeR4tSa2bujKbuQz3xJJb3nUJ9bieagi/gTOGszr8YHld1iPdRliDTUKkttLJz9yBWDYvDevwDISowRMdNgqR4YkPWHvmvxzMBcuvlvL1iKRIw8/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC+lFd4mrl25D+01gtovqrb7+fZ9r/KCDG/CFcIVvsU=;
 b=LHjXyAKsk2z1Uid340CB+f0poX0RWdzJp4U5rGp6x321OXVvYKAmpOx9SQodEYIaKRx8sYmSRRommDOVrlieSfR2s7ZqtObzDn0JdhlpegJKjG22TkSqU6YkJE5VC0FQDAI7+N4ySGrQtIFaHAQCrDSkG2Ux2i5TKNm2PAvAjYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB9768.jpnprd01.prod.outlook.com
 (2603:1096:604:1ea::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 11 Jun
 2025 05:40:45 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 05:40:44 +0000
Message-ID: <87cybaj0o3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
In-Reply-To: <08c118aa-5aee-4eac-8d9f-2821fc2bb970@sirena.org.uk>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
	<5835adae-5dc6-4896-ae04-690ac6893f02@linux.intel.com>
	<cbef2f84-9f83-4cf0-87b3-39173099d136@sirena.org.uk>
	<11029ccf-5128-4fe8-bef8-9fd6de316e37@linux.intel.com>
	<08c118aa-5aee-4eac-8d9f-2821fc2bb970@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Jun 2025 05:40:44 +0000
X-ClientProxiedBy: TYCPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::13) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: bad06321-5a95-42f2-a46b-08dda8aa82bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?LvlmMZDIOEHKBidJI7nQ4ETMs3vZCQZG5h6AY9y+iIA/8j+Kfy98LOIjNq?=
 =?iso-8859-1?Q?zR44f3+sNQjWKlqJ3lC5NaW04cg8Buqs94vAlSY1MNWOUE0lDpkeXzBvjf?=
 =?iso-8859-1?Q?y+Y5GorEFBU++9S1fM1XJK+roUV9vMPTYv+fAF7dOkHf5Woqka6KWBnxc/?=
 =?iso-8859-1?Q?7rOHoyXY/1v2SZGRqg6jNwPujY4mcjqmx5vxx8IvhjMTW7wO/L9aOO+U3O?=
 =?iso-8859-1?Q?uKCYaAFr6BMFSdxb9U0oNL2ShGNfG982aAUlOiFEHSH6XUCGjPZmDhhLPF?=
 =?iso-8859-1?Q?C5v0dwfsjg+feMuAr1ctT6MaKxIA7WNKM1I3MbJFShuDQFDZ0zMIzZjhzK?=
 =?iso-8859-1?Q?tcjifzGkWE0LkgajAZliCZZl9iocGVGOIV9KxHV5jFj0gwvyhMwBsxmSGd?=
 =?iso-8859-1?Q?KwWdaH9M0J1E5cLDNcwpL1LbnAwWsWBHm2OZWPmE6XMDv0vO1P+W7BSaEE?=
 =?iso-8859-1?Q?/UO5tMkhmUmjI5zNt+Y3Ys1CrWc16BxGgpAwsFkIHx5x58zMH3BfR9ah8t?=
 =?iso-8859-1?Q?9EBWvD3jkBtTwEUXFqzvJX8r6qNNLHOt/VHMdVX/7YvPAckNunxImKntJt?=
 =?iso-8859-1?Q?4ovZFqJOkQl8VZ8HaPcejzTup+kHlA390gQuR+lENmBh6BvgieXTlFRXZ1?=
 =?iso-8859-1?Q?HRMqQTYgo+tCl2w/ZXfl3LEP48vfEZ1q4pBcpDTn10F72kzYz4mbsfwPeG?=
 =?iso-8859-1?Q?HA6iR7BdIVm78Br1bhSmO1q4Dep2pLC1X/poLD4qW1pgGY/Gk+dDuC1qyF?=
 =?iso-8859-1?Q?DOb2jANCPtN3yS50j7YPxVbET11e/bj4WBFM/OhtFxcVcNiRemSt42kltU?=
 =?iso-8859-1?Q?V3YoarzKy3lCKFeW2Gsmy/3b/iD/usonelS+FfX6TDBwZdG0FObiMysjJt?=
 =?iso-8859-1?Q?++ccuIcr6k3T/CmwwbtCiNEZ/JX0BNVXSHmQvu7e3dMbQ+/sWbLZLsEM9c?=
 =?iso-8859-1?Q?YPbGwdNfYL8bYeBUhB8Tsr0O/c6e77DNPkEGFqRz/1x242+QmSXH9WbtxL?=
 =?iso-8859-1?Q?TRIgQX7UgYqalhkvHp2gdsH9mqIjVdfi893LhvPKcyzHETGs+/K9S1AMci?=
 =?iso-8859-1?Q?AeNGQsCCecDs0Kf7kbZr2E9d4kl5XWlzDcLhbjg82tKvEUx8e/BspZbibZ?=
 =?iso-8859-1?Q?bPGJ12g2Lr4BhVx6Kv7VFqygNouSu+WJK9kWuVz9Ym4H12uvEL8avCDsiT?=
 =?iso-8859-1?Q?vWyJyQD2zuj6sl4k8Bg+wnIwWMWwKTcioc5nPcWGblKinw8xc6jAS7Iug6?=
 =?iso-8859-1?Q?thPCI+jJO0dG/DHnC5E/efE56onrLpdoIURRLVMg4r2bq+a7/8clVphQxL?=
 =?iso-8859-1?Q?3rK7IqB/xz6pJ2RI19fjjFAMfaasuytXpDk56hoKP0kpGSF4wWFIJGsoSa?=
 =?iso-8859-1?Q?36972NsngM0Z0/5Clxh6MXu+urac/p5VkiHPX8anTteLg2IUG/nFwFFURj?=
 =?iso-8859-1?Q?462TgXtsDpQ96zp5zysGpDqFsEm+GG85c3RY8/aUcqh/3fOp3/GffS75tg?=
 =?iso-8859-1?Q?PcgWpIo52JT5FYSJMrFsqu2BfXvVJuqa00o64LTZxxzA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?0crVDUSsn7TPaxLG9nkWn+zlj7KygKybLn6MtPE52qXHp5bv0kFdkV40KP?=
 =?iso-8859-1?Q?C9eiqndhjot39A3LnUhQ3VwTq6AwKckVFjkeni0H34xOFNNPCicbIaqK52?=
 =?iso-8859-1?Q?qBPQZRoKj+o+qNYd3FBKClDokr5bDbfw3pRI+QQ2VuadgAu2KLAmrt4j7N?=
 =?iso-8859-1?Q?yDu7TWwPD9z4H3uY7Z9pnQmiEqzc9i1OuTvPfX12aRHD3p8hObBGnBN+sS?=
 =?iso-8859-1?Q?PiPltFFq5SHWFo2S5tma7rRVHMcxgPQmtldk1l1V9R5k6mbARuT5qDJ8Zo?=
 =?iso-8859-1?Q?+MFJniYpyXcqzaOCw4S4Ai37P51mFLmfa+XwNjwe4jKcsVRpD0YjRR8lFx?=
 =?iso-8859-1?Q?ubdBvEtrAnDhcd90ecoDaVwPFgE5OOBc71dxY5sEScSC2id7VPL9lWo7S6?=
 =?iso-8859-1?Q?IU0PWHaLCkTIvjfjNmDU1T9BPOevQ6yjckc+cuZw60mCR1tOcHy25AT2R7?=
 =?iso-8859-1?Q?FwyERkhE0Ue3R2dGEkcQYkCLLIYeW6IaUQF2tLjds8TGbfnijrw/ORaCVE?=
 =?iso-8859-1?Q?W2GEOtPdwojwpBOt6CbwKnXJze6XELgmc2HMn6xW0ChaQ8FUh+d2afSf5K?=
 =?iso-8859-1?Q?SYdhOT65GHNOSbMY+okzqLhtCJg+hlWNuKOBorC9QNqH3EXg+sECexU9Aw?=
 =?iso-8859-1?Q?3R0Ec11XRcNZfe/0yaHeTo8dZWQ77n3sPcq5wM/KCfW/wL0YZnR7vAZLbg?=
 =?iso-8859-1?Q?7OzWJ34WHafAWMVKrEsJ9aFqWmcM7sInx63GZ5bXvuSZcHtlqshruEEkjx?=
 =?iso-8859-1?Q?S0v/TxUqDAnf6NoR9qQm1Xj+WARAekRDc2dNDJjHjpbbJci6YRVCrfWYJA?=
 =?iso-8859-1?Q?UbH+w/ibKVK5kubHXzab+malL3h2hhKtcDHlqHi8alqAVoO/Ia9E8uUxOQ?=
 =?iso-8859-1?Q?W9RcV4qQsHwFA6N/q0yB2bWms4hiEPRb8cDbnGayN+92HWz2OopRHri1Rc?=
 =?iso-8859-1?Q?H8nrL5MXIGkwr1sUuoWX9EPM0+Xte9viWPi0spDreN6kYySFBT7P57nz3o?=
 =?iso-8859-1?Q?xoBBJ9n1cUX/C+PlkZskL9n4wb0z+dp+ntV9RkTj21BImNJMaTCDvoS4l7?=
 =?iso-8859-1?Q?c7HFsjyIRTshw2TL83VfeZlBEbmnhPIynIfWRTNQFT/s2vhbzycIQ9ZWqH?=
 =?iso-8859-1?Q?sNaUOnZK8tAnH0RhPC6QNzTrXnLEJXpBaX0B8c+VuZTFvqD2hFiS3NrDWt?=
 =?iso-8859-1?Q?5fXYtnA9+GgYLarArtgDJ8zn9kVCzz23gOytDohG3jXa+p8AWCktYqAEuU?=
 =?iso-8859-1?Q?0bCu18NJCeAM+bwdXzciMfn3XNxEZ3Ji2z02xs6yq+MdILzIRP0Yzo6xdu?=
 =?iso-8859-1?Q?bzwul0e4WIs3D2BaGjy6iiPtFemmhy51+dl4fvyS+6K7g1X44o/s3oV/hk?=
 =?iso-8859-1?Q?NcFA4awUakDWWWLJDtFM/RSt95zkN6wzPH9INBgotBBpDVCj1PlM4AbZmF?=
 =?iso-8859-1?Q?4oifJLOrHqLRSgdXJ6i3jHRTLNk1b8Zx2y+90JbShJPQj823s0fqIzs9sz?=
 =?iso-8859-1?Q?J6vs6jXYDyvEXZa3FLh+I7h4t14ZOFATGvn5zz1J74nihOd8RhgEA5webA?=
 =?iso-8859-1?Q?TNUCcJxXlX3AuPilyZN0hmuU6iUzMlQGpbsjNFeNT973lwmKC4WPeYwbs6?=
 =?iso-8859-1?Q?MzWCjFImXur/2BOc+gizuRJ5M571ljJ84EgkeApUqKFpZhv8xS/R/zdsWf?=
 =?iso-8859-1?Q?qr1ioRWw8exiDN41KTE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad06321-5a95-42f2-a46b-08dda8aa82bd
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 05:40:44.9339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6oLbdnt/s+aRP8vsYVK6ve0FIloyojuRJTwRkT0BNpUYA3rD21UeHwwjAir8f2+eqPrmy488GEc9LKBYqXNnWLHN9/0cgJyDw5Rqtp5edM0f1cuTSAq5jvJRkQMAxI+d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9768


Hi P=E9ter, Mark

Thank you for your review

> I personally would prefer to keep the 'Sound Open Firmware Support' as
> it was, probably moved above the CODEC drivers. SOF is more like a small
> subsystem within ASoC and the stack supports various vendors (Intel,
> NXP, AMD, Mediatek atm).
(snip)
> With some internal discussion about the menu entry name change for SOF,
> we concluded that it would be better to use the following to imply that
> it encompasses multiple vendors and platforms:
>
> 'Support for Sound Open Firmware (SOF) platforms'

OK, thank. So it will be like below in v2...

	ASoC support for ... --->
=3D>	Support for Sound Open Firmware (SOF) platforms --->
	CODEC drivers  --->

> We have quite menu empty sub-menus, partially because they would include
> something which would not be select-able in this arch (Apple, Au1x, etc)
> and things that does not even have select-able options (SoundWire things
> for example).

In my quick check, for example Apple case, it has only 1 item, I think
top menu can use "depends on" and we can hide it for non ARCH_APPLE user.

But for example Au1x case, it has many items and complex dependency,
so having "depends on" on top menu is maybe difficult or maybe can do
via Au1x developer ? (Because I'm not 100% sure about detail dependency)

> > >> The other awkward thing with this change (which was awkward before, =
but
> > >> going to be double awkwarded) is that the Intel Machine drivers will=
 be
> > >> quite detached from SOF, not visible of hinted that they are now und=
er
> > >> "ASoC support for Intel"
(snip)
> Apart from this, we also discussed that from our side it is OK to move
> Intel SST, AVS (and it's machine drivers) and the 'Intel Machine
> drivers' under ASoC support for Intel.
> This Intel submenu is going to be a bit unorganized as it will contain
> only a portion of the drivers for Intel hardware and some of the
> platform drivers (SST/AVS), but we don't want to move things around at
> this point.

I'm not 100% sure detail of Intel dependency. So how about this ?
I will post 1st menu patch-set as v2. And your team will tidyup Intel
side details after that ? It can avoid my patch-bomb
I will post v2 if we can agree about this.

> > >> The title already tells that this menu is for ASoC.
>=20
> > > I don't have a strong opinion on that one.
>=20
> > I'm not sure about this now, probably it is better to keep the 'ASoC
> > support for' in case one searches for symbols? But that will show t*he
> > path to the menu entry, indicating that it is ASoC.
> > GPIO for example adds a postfix, some subsystems do not add the
> > subsystem name in entries.
>=20
> > I guess whichever looks better?
>=20
> Yeah, the reason I don't have a strong opinion is that I mostly edit
> .config with 'vi .config', people who actually use the UIs will have
> a relevant opinion here but I don't really.

I have no strong opinion. Let's remove "ASoC subsystem for" prefix in v2.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
