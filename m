Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD1F7E9
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 03:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527842; cv=fail; b=UTwwng4sfet+l65nWawoacTO2rhAkXZ5D2IHya9y8lymeRlFIaAwIDU5mVPx4DpVQ+cXaidTg9PC5Q29g5+/DjmPEPYkJG1T44xT5/XUK8032CDsCZrHpTPKX9SCmV5kcfFfFfEKuSbCS/LQGOkyVFciaj2vrj8L7nbNNtGybl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527842; c=relaxed/simple;
	bh=dJi3hIA6hZPU9SPOxhoB+JCymAP30PbVjIL+Cl3CoQU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jJmTr4P8Stp6HHKv1K+Ys1FtDWePw017DJdCiJbxnElfIk070aHiaY29xLWcy1d7uqM3qKgWj9ntndvHejbyZfR7CDvEKwU+WUUPSopftgH1suf3mzuMpChWXkNucyeJnfYOvGc2M+gDf8HpHAu+/wYGoQjOJlAvzhksoLim9Iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mmXOLJTK; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mmXOLJTK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7IkqrKSvLN5Rx0EAWM9LVlRwp4TXfakOwRIzOdLghHk6pl/Nvs/SpIkJ5Z22XgT3lK6nUpHwYC/JE3AyB7Cw+VQ2dglLIEFQOmSeqs5anwa795Eif+7Eyf0yKWxJxCNEm2LykG4/94R30EcQTTGjnfc+iTkc/wy2hh1z3prEWXg7nlFCHasoWhOCeUQ6SC54OpH6++pxQkEGgnEuMgeby2LpwuX6vnRTyVQewCpH9klKa8R0ovJRcgzydHFS6sCLzI38H30c12jmDYwzERPE7xlPxemwxA+f1JnB24NTQuZo0eQP9yxirfoG4aRM1ZBm5v4J0pmXYJ9/zNE3atptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhPcOXNdXIIMtGjSKl9uH++yODJUCJx/b+LfXrgNN7U=;
 b=TyOcmgN2NbiX/cwnvKqnHbuK5XCZfmzgUvTSsU89iuTYRGB1fj30qaKGl/XOL9jbIgwHM7xWAwG2N73ASYh6+AVbGDOy1ktTWWj3OI6ULd0EjhFIKhzzVJPxiHOT10ECPKKXeGcLkWVf/toxFCLpWgu9sbcqpO/pGXRxrSY+QPLOaGHyjc7uu6xddqjlhdgHzmOohYeHpdrx26HamaSIYMb2cW15PqzB8anJN2pDAQwJi5h128QpZniSRw/HdtJzoP2wKbcIWlbw2jlbUtiW5//HouhVYUHn6t7T8ARdW9Wx9lrF43tBBikm9S9NssEfZMoIm9KrdCL5iwf3/82ZOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhPcOXNdXIIMtGjSKl9uH++yODJUCJx/b+LfXrgNN7U=;
 b=mmXOLJTKvY1G2qPZGwLCm0KlsfG01ypjQaLXj+gOUJrUp7NqfWrG6DHy4cE95iniLMa5xW0zoD9Ly81OmDIKQTJ/HRIRkAGVv3aUHQn/p3tx8oAnJt2fThGzG/HFBeSIiaNS9xNvwYjfanqfSTqQ+ld7mmdXhMHfd77Hy/8pOYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB16003.jpnprd01.prod.outlook.com
 (2603:1096:405:2ca::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Tue, 10 Jun
 2025 03:57:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 03:57:16 +0000
Message-ID: <87cybc8d0k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: wens@csie.org
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
In-Reply-To: <CAGb2v66MU_Sz6bVPrvMacL-wX_XU+JPWxMWjsfN=vPkzRsRoAw@mail.gmail.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
	<CAGb2v66xb9duevXtZf=YcUM8WvoopG76_yud8PHXOnYD+i=kQQ@mail.gmail.com>
	<aEeqsul4gzxde4Mx@geday>
	<CAGb2v66MU_Sz6bVPrvMacL-wX_XU+JPWxMWjsfN=vPkzRsRoAw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 03:57:15 +0000
X-ClientProxiedBy: TYCPR01CA0203.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB16003:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ade8303-bfbb-4210-eda4-08dda7d2e39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U+r7Z2f5txQHj3vA3M16cbLgENiUl4df/wtlnlTCzRrc+l045HKLMWuS+dal?=
 =?us-ascii?Q?H/SpoeF6m0tOnVZtUsTgg6xYnG7nejDplr5FXr3SsBB/LQ28ku2ohgiBZayW?=
 =?us-ascii?Q?RnF55QmP23+yU6b8C8SSiNAUH0ohmUu7qIMwsuV0s6ur1RNJsYguwKnlfS+3?=
 =?us-ascii?Q?BLQHqu0HcZ/4KzWTvlOtymBqh+fXLSWS/nLiSrJp3qRxWYvyJb88jZ61TGOS?=
 =?us-ascii?Q?Zwkyiw41Nm1jv/jgXcjowa6x8N8t1fKgzI/BIiX3o+5Nma9xaHxAAD2bwIBE?=
 =?us-ascii?Q?UYhqs/+8tsPOr9FkeEgneyQwfFwvnpgGQvAiOVGipnITstu2wiihs5fT2S3+?=
 =?us-ascii?Q?+nklmtst+OnMNU57D8hDXJHe7J/mbDKiVfzY1ZZlK/2u1AJhbodyYc2uljDg?=
 =?us-ascii?Q?OVWoquzitscqHzo/W7hxLsVu2EtC/+Ncg/7cio36aqURbMr223CpKVSA68bR?=
 =?us-ascii?Q?DT9TfmfMDfwUINVAeL5mWHmsKmmv6auwvSYVvIvIIF8JYYYRcKKeptLr1ZPG?=
 =?us-ascii?Q?wnjyrQYIWApglIXqo9j4bInARdJ0HuhxvWQIsjXNNaAH7RW/ujsznND+WkuO?=
 =?us-ascii?Q?q1Tp8Zh0C73/g3CTmMDv5Q8qX9y8qRB45uQpcNbJ20or6cKUqM9RCtOkQo4T?=
 =?us-ascii?Q?K4pVrjSVnyN67cSNxH63k7+8nyDNoSWmGoRcnji49yu38ZJuvwEspEwqUIvh?=
 =?us-ascii?Q?kgrMhBF69wxc7FEt2jWkJ5hINl1XQitqjwBjJ2uI4fZklIo8Niq3XBz2yh9g?=
 =?us-ascii?Q?L3Yu4lLNBi3cP7Ydm9NgttinSrwO1vJachC+N1TQ3s7EGiTSbLiS3kwm92jR?=
 =?us-ascii?Q?uKvn3TEepgFOccW1z+HLiQFSmlD+ya5aYC07AlcDSWEBESFsjs/O2DZtNiZq?=
 =?us-ascii?Q?eBwSRY5Xf0yPtZCsGjRG61+pTMW1W4XiKFkmtYP/l2/kP51x1b9x7SCGRD7e?=
 =?us-ascii?Q?Fm3pqi2n8yOPCE9cuIBHq3yGtsrP/pJtOixU2l/s5oyw40QCWzQWNVq14y/X?=
 =?us-ascii?Q?dDzM/4+xe2S5R0NGOQE2Qh7tGnNeo4G4WbNZflpfVEegi0N2/dQ2c6d1O8IT?=
 =?us-ascii?Q?JZFBoqOW8jhFPt20jrQfoq/aP70NFZxFahoQbsfldIMRBOVdJhiEaIrJ0siv?=
 =?us-ascii?Q?jwZNdxiDj/diiYnQL9euThYsLIIM0cPfdSaJL1pZ6er7Pkw0DPyRAtUQDVeN?=
 =?us-ascii?Q?yh42N9xa4eEIlu+Rq5MrNnP4iuEZ5e6Ju4Bj/D1R3t2IkvFflss4A4iSN2uy?=
 =?us-ascii?Q?SyDPIaDtCKWjF73yQ0hdTNEU4R1MfLoDd4rkX5duAbiNM3NwsfXmuiQeGPI3?=
 =?us-ascii?Q?jmWoBN1QbuYu42eDcWMhxSoftKvX0wep+bmDyY5y7gaT0UZvLI56iGmEZNL9?=
 =?us-ascii?Q?NBw8e+NtJcC3CYkl8RoGMT2hVSDho9++zKDCnkvLiOyRlh3ClBYvqZDgZswY?=
 =?us-ascii?Q?pGmYBmlNj9jrdKhXWqFVvfIsHqInq0uty1xlbBp936NXIDVSGPtSWQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E3Zp8lnY3ODhETt/7rPhtRTLpP16G/kvu+Te+KX+czm6iMyaf/o1vXhV7/ZJ?=
 =?us-ascii?Q?aDm1Iz5ga+zSHAPDYaycXNK6zE+NtGg4RrCpBj4EuJk23R9oA6oEKQW6WWB2?=
 =?us-ascii?Q?vDfdqpr/Nu2c3P42cqSYRcqsIiYv2guEiUg6KzfRWzaP5wb9Dk2uzGziRjSw?=
 =?us-ascii?Q?mxeKjmGD7DBbddfP9C5s6yo2zkAIdLYtO5iXVdctQTcdvkmj+S4KHIIaZJEx?=
 =?us-ascii?Q?7tDpWwUES7FemXe7So1NISFPV073RY6z7PxHFxSt8r7mM9jD9HXVYNFRLql2?=
 =?us-ascii?Q?YjXsgz48m5t6uyGBITmFgrfWwCqpIJ98QXVhkgUA+ppCcjMo4SxNU7ufdQxs?=
 =?us-ascii?Q?9Qv3M0YjM8sAZS/ESmRrJ7HEHZk6qATlPJUs/qs9+xBUqX9SFOMwdLcKaYDm?=
 =?us-ascii?Q?dBFx311RXTS3EThmUuTOJYz8c3fzc1WJszoeXMNlrFE+2M17bUButcO6lCdG?=
 =?us-ascii?Q?iUbdRgxb+dsyEEPj9J6aO0UhPeQs8z0MyUIm212U9ZQbVMRIw/uJA2t1NZxP?=
 =?us-ascii?Q?T3571pXvEYpiILmEwwHbC8OhfTYHvVPpHEXYA0yfVN6y127vlamn9GUGvnfJ?=
 =?us-ascii?Q?hR2VSyySRdkgcTvsqj5aYcE4VEblYaFaNSSK4KCI+qq3X+08INtkM/xf+FDx?=
 =?us-ascii?Q?CERsM75fsltio5gAqABOaf2KS3h17s8H31rYEYFQQBndeDxeJJrtdIYWDWuk?=
 =?us-ascii?Q?5CHw5aL0t/+1i/XA08AnV1IgeFx3Ok3VdV7AfQVZ9B8w8DDuwOBPWz+W1+HA?=
 =?us-ascii?Q?LNQU9yF18y6DfmCdpQAh7T/Tt3RtiubmdyV63U5z+tbGqZ971M28AJxPf6bg?=
 =?us-ascii?Q?ypIF7wsAY4zXxMfZ1ibEfeNiNNA3WKbI110PNOMZaPiMHKrMcs4AvrBHV5ki?=
 =?us-ascii?Q?PNA9HAQ/xQmfXxGpqUZGQ4c04Ynmst+KG69U68fVtxN/PGuQ09HY9rll2b/9?=
 =?us-ascii?Q?UVMN4gnuwn6S3ZtM5bVVEH3q5dWX4gCYJfezywQR9TlckMGz4twAtgCoG0S7?=
 =?us-ascii?Q?XNqrUbdLxmjZEpE6Zn9xfpFelPCesQHuJgIeWbcf2nwcK7XUBT7MWpaBO8Vr?=
 =?us-ascii?Q?y8WLghGLcvMf4NQOl4adQHGIYwfzzyAH9Zo8TfirH9Zqqs7p9c+gos1flnfT?=
 =?us-ascii?Q?ZoM2/GL9RQ+KJHBiCHpmTMuV0dgLUG0D6ApvNQ8wNQZ2fKM4BWBLe+UmgJy+?=
 =?us-ascii?Q?bxdgYWH7+rx/gfWfXC31i2Ybz2tUYnNxXT1b7cvtgwfVptvY9Yi4b4g2W63h?=
 =?us-ascii?Q?uP3aeNibjHmpl5E9M1P7LMSUk07V2cVkaa6bATLVOrCRiVhdbZm0YCzRNs+U?=
 =?us-ascii?Q?zT+sXTHId4/r/+gDNmaWW71iw1MwWef4tZuk7ZfV/0cFPZVxV8EcTavGgUcR?=
 =?us-ascii?Q?jwtVePsXNOS2XNa7aXIyCP6ZOeBSgTrf2QDuxtBgBhQhm8Vsm/8SYZ6SlR3t?=
 =?us-ascii?Q?zPFEpPMZ/msWPF6S6QR2gS/Mj/l8/OSuGkKG3v8+oF6AqVb8/KMLvTZRA73q?=
 =?us-ascii?Q?P8Hd5EjbrixWpm70nb1oV4TuljpIQO6SCokMKMBuO/VlNhwR0nJUOVoa5gW7?=
 =?us-ascii?Q?iLIDa8RrfX6VaHoQnbhE+ae7UQAg64QNpgGQbiO+PngDEpJrgz4o12zsWeAJ?=
 =?us-ascii?Q?ERSt/AOPjf0RClizyMvbpho=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ade8303-bfbb-4210-eda4-08dda7d2e39b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 03:57:16.1300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5TKeIWd2zVscGi+5w8l2PkJtzXtwsCAjY8K3oFlTeiVdoatgYwupg8jXJrvRPob/eutoXtfkMDiU814meYQnnACMtxsEckMNEANm0nYk9gx9nDOpCkiAGe8cUs/OByz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16003


Hi

> > > It seems only this cover letter made it to the mailing lists. None
> > > of the actual patches are there.
(snip)
> > Chen-Yu, did Morimoto-san forgot to Cc: list or message was dropped
> > silently (like by spam filter)?
> 
> Looking at the Cc list I believe it's the former.

Hmm... strange...

I have checked posted patch, but all patches includes your mail address.
One concern is I added your address on "To", instead of "Cc".

Thank you for your help !!

Best regards
---
Kuninori Morimoto
