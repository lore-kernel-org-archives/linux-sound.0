Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613D4278E53
	for <linux-sound@vger.kernel.org>; Wed, 11 Jun 2025 23:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749683751; cv=fail; b=S9Nowv82A1ibjheRxszQh3duDeCerDH5y185jbLGPVDbjjCsXL3HiHRbsSG1DB9hdob2jeCxHZol0Z4YJSLypbtNh5kqh5UOrmMsFleqj/HfxDQpyhsXjS3HOKU6WH6JHsS2YhiM6TIluLE42/2L0cdcBs7/br4mieCFwYJvzlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749683751; c=relaxed/simple;
	bh=2iVewniKbuUleIwA3upA/Gi2oNVhUoI6jYk4rstLnYY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QQhe14NNlewJ3bHea6rWsHZ/AnHfQvuNaJEZOGq1UBRUjyLDRGJBypy5+C3qR1Eb/dsWFSeVhTN5lHFISsXCRdkLr9u5J74QoEmiZQdJ1yDIN082sgoJGmzGiqfc7zJK7PA0KuI10W3SBQwSdLRXjzEvvn1Mupl37A+C+St56fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VpoDkQmm; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VpoDkQmm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSVnkCqBr0xcyHMw8jk9jh60zgGaw3dt3LkLOgDEl+tkqyUKthAAl0+HK3x0k09vtuYWwdMPfJRaia/SczTsWp+xpaxI2HdEhfANHfJ2gHR7Vhr6sxeVy8Svfe2+7L6Rf0FkUAspHpqxkQExKY+ber92W8QCc1mweymvWpafAbGvAspPja6BTu2XyupX5ODJ3xCMso3E3oO6ZypTklev+TVCUGvzfzHWwuiWjo+kXAfTsTrCnlQ4yNiuWdw5t7I9jbu2cl1KONRbswZcSys5R5FwOFNFyYCYdz9EiK8u28Q7D4wn78uhbhPOyyyjQghLRh3DATuqcBuRHJ3hVOwQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgu0ZpvwBMRghazZnwfsI8is7sS5sZ2oVimLaqRupeU=;
 b=RLe51sNYM6yYoZT0C7hHTRHhs9s1/H//zaVR/sx5lNbsMkHk2ONMtvND4FrjfNisR5P3rIoNre4B163XmED0f072W+ghul5qQwHZd27xGL+CTpReVnQf+Tp065V/6feSbEpDIMu6VQjGBNShDnOdBjTPJUWGIrMUWAZIInEx7TjcfUSqJ2MpBnZ7pQwoGjwodNl5kzCFQzjIHynYiTgsZnr6GOWTHu9C/j4EhPWel2/4E5TegyW/dccHwwUPuxmyDrdDk7/Iv8kEUSSjMUrXNlWnoMNa5NlMrxWoTa0WNmVASOrr+2ohcXg5rfk9tXIfAovBAvOot4BiNqy8Ob78gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgu0ZpvwBMRghazZnwfsI8is7sS5sZ2oVimLaqRupeU=;
 b=VpoDkQmmtIQf6IFLNmdW+Ocxm5HSFuixoJhqk8KWjfYQ3B2KDtjpc9roymmoxqMj38tSVvzUt2oxx39a0CavsmeoP0qrNYjfLd/mQTOyQyK8j4W4fqiqeFAspp3hMYomPykJVFNdS9jC7vF/hyjROOYFpB7hUlO5Oni0Q7LrIWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14915.jpnprd01.prod.outlook.com
 (2603:1096:405:262::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Wed, 11 Jun
 2025 23:15:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Wed, 11 Jun 2025
 23:15:31 +0000
Message-ID: <878qlx27l9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
In-Reply-To: <80f629c9-cc51-492c-8a8a-6a1076592319@linux.intel.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
	<5835adae-5dc6-4896-ae04-690ac6893f02@linux.intel.com>
	<cbef2f84-9f83-4cf0-87b3-39173099d136@sirena.org.uk>
	<11029ccf-5128-4fe8-bef8-9fd6de316e37@linux.intel.com>
	<08c118aa-5aee-4eac-8d9f-2821fc2bb970@sirena.org.uk>
	<87cybaj0o3.wl-kuninori.morimoto.gx@renesas.com>
	<80f629c9-cc51-492c-8a8a-6a1076592319@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Jun 2025 23:15:31 +0000
X-ClientProxiedBy: TY1PR01CA0196.jpnprd01.prod.outlook.com (2603:1096:403::26)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14915:EE_
X-MS-Office365-Filtering-Correlation-Id: 03774102-ebe3-4b02-7914-08dda93ddc69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?EP+Ps0ka1XduXImRaCy2AqHYwcWCkXkNhfitscueZBIf5gHLPcmZjWpG40?=
 =?iso-8859-1?Q?E8W+xe5MCtSCzDSZyclsIiJTlY06JymW/lSUOaHpH89Q0pvwyonAJf6i+V?=
 =?iso-8859-1?Q?V2flHs8vv5CGabRVXl79+ghJ1HgVBEpNSYtEo3bh59oxu64m+HPQR1c/Dv?=
 =?iso-8859-1?Q?GCD8mlq3aoz0LnComnyvlcYTOXpErsD/en8lwZ6KY8uaYOOCN1uLEF7BRd?=
 =?iso-8859-1?Q?MsJ2uIcNuPWSfyEGzMmj2IaXjd20oVArvz7NaU25NFbWIrSHBvxmSgHCQL?=
 =?iso-8859-1?Q?YfMs0L3oMBufp9XT+0NU5tUa/HRT1jcaBVrl4z8Yyn9j1TIrXAM7+cKi3g?=
 =?iso-8859-1?Q?JGsjg0yz41Z2daApAJDipqAhQiFogH3Umd+e2EbixdsRSyyvk5vBE/T4D1?=
 =?iso-8859-1?Q?DJ4ZTP9P9IL9RsVMjFKXdHPbQrtM0sshx2RklBWTs7dBDsTCthOqZ9r2Yu?=
 =?iso-8859-1?Q?1avfG1mKdTw+UvOnVNZdBwzO06AfGHmpk7nDP/bMNRbi6w/vQZwpmAPKm9?=
 =?iso-8859-1?Q?TtwIMvfym/awhIbVI+FxdO4A9xDUgoCS+Kka8cEiEb6x737D/ZAoDZ1wTq?=
 =?iso-8859-1?Q?Y0kIYdjxEg3VrCdfbxSfCkvpkvPsWHe/xvviwo0gRxJjKAsC6UN/94nF6G?=
 =?iso-8859-1?Q?VeRcTozes18L7rxZW27UGHct+LuQjdzIZVOZTrYBuoDZq6W8JqJ/tQo0R0?=
 =?iso-8859-1?Q?n6mcOwYjGIwfk7t/Ysww7JZKhu04y0u8+tXheJxFohOhuSrN8CszG6jPCt?=
 =?iso-8859-1?Q?CKcAllVvLpQkuhO4B2wUmSXTpsF10Nlgi8zTvMSMhddXriPk/xduFk7/eq?=
 =?iso-8859-1?Q?HDmPFF7ATbYQa62VYs77UfM+gE+hQK6GkAFcv/axFzQsUDcXxrecMvq+7l?=
 =?iso-8859-1?Q?nF7iMTP8syfNkIDD9EufpQmYVRUM3qrsucmuoaGZAbfHjxMYGjpYYf//OP?=
 =?iso-8859-1?Q?LRvW9MpH8Ai7YeIViOyGSyEbSxhnOGOeO92hFo2tOlQsj21PeNPMF097e1?=
 =?iso-8859-1?Q?YGkJPFX3WZFK2MNWAHGPNGhodRkquunxRGhDL/kd6ea6H9cKW4MuphEApX?=
 =?iso-8859-1?Q?L/efXrukJK9jTTRp00SYhAsgAguZpPQ/tAM0ZkAGAW1TFqOYZvq6u9xNwi?=
 =?iso-8859-1?Q?oSNFCp6BV+wTVbaWOKzTYSDikIf9owHFRgEG6vsFfN2Ahwwer5jIjXcfk3?=
 =?iso-8859-1?Q?MnaMh8dqdoUb8SnGptEfn3vDM+dioqikIKJvcoimwN0uq2gzU7J8ZsHWeR?=
 =?iso-8859-1?Q?y6O26rvA0FwdDKNjUZxnu8Yj48ZqhzsH8OINM85YHqvohm1BdOCOZAVIZY?=
 =?iso-8859-1?Q?IFaLALsyuRQaU2662onRJxoyDBc6lNFPzfb51g3FYK4Ge1YRURBVj5cg4U?=
 =?iso-8859-1?Q?tJii+UlG4EruQY5zT5cH2mVOEDJ3iKKyUl+7CoaGc6ws71F3CCc23JLQMg?=
 =?iso-8859-1?Q?0CWmeMq2vvpPaVBn9sIIvqKYZu/6y4rrS6g2IDMgCT/IB+67DxUuTi/BrA?=
 =?iso-8859-1?Q?OcSZyKPL6A5fBiO02G81PVSR9LQnBrtQJBWlVHzMJMRg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?JcPwRSpsWi2aQGFUWaXMPNWwT5rBSPxeVKY59Iw8i8VLmjoDQxMTjR12tp?=
 =?iso-8859-1?Q?LawtGx7knNaAZTqIUzJwcka9pkA0/HZ7DNadsm/ImfDeuRlSUJPuyjryAH?=
 =?iso-8859-1?Q?zZWpo8KM1Sn5+fgOPWcve3fM44NjhnFKULrOYVnIHuTuLYO/Y+36nDoGoX?=
 =?iso-8859-1?Q?Qz1jj9WJEiscnzfWIGEl7LkcbSafmThnYnkx8xolFTdLO1+yiS1nsc880Z?=
 =?iso-8859-1?Q?b8Iw+aO3zAM3Hr12CcFdR2CLWzts63uRaCkFl9UTqnKvtnfH2kZdJcKrmx?=
 =?iso-8859-1?Q?yp5VI/YaThqxZ96Z5uW1PULPM4mAP2drRTsbXYSqF9YN5q2sp1wnLPwuEA?=
 =?iso-8859-1?Q?rjW6kh65A+rUwrSOpcMyW5UHNroVIs6TNbuBawzjYBvBOy4ozn3eCyOm24?=
 =?iso-8859-1?Q?dNGSliMZdF/3Ht4PI1Y1sQKMS9eeYzwOzY44vw2PYk26yRYojoiSdVe/Y3?=
 =?iso-8859-1?Q?UqsbcnWd6pJHqI/ktIQ8XXQ726YfyjKzuLIfhZIaJz/q7682Z5mD8HA3gG?=
 =?iso-8859-1?Q?9EwJg9MBhXwglaBeElV9epzV3SU3APw8Lu/UrKN3qOy+AWXUEubiMocXv6?=
 =?iso-8859-1?Q?YYevOqSfMgXMkxy3QsYG2ZTkz2YmTkr5rHjgL3UDDGmvf16WhFD6D7X89S?=
 =?iso-8859-1?Q?FOsZMv8eMH51CFfBQz5jbNHdulVniBdl57epFBtZpzUp2u7Q+0vYrnOZJF?=
 =?iso-8859-1?Q?a6qXyaDc2vp+K+Cz2O/2Kx8w5P3z/Dz30L1OnVFlNdjzkoS9TMkp8wNRxu?=
 =?iso-8859-1?Q?q8wP4UOug26ijI0w5PIiUAAQfjfj1ZEW29+x+SJtwHK5jpk194cS4N1QPo?=
 =?iso-8859-1?Q?388VzleokCUn+ZVwk+dSSf1yA83y9oCUMC9G7rg/TNkhSNec6THKWnQS+b?=
 =?iso-8859-1?Q?KAjBUYV4Md+qX9WDRah7RNicU7td/bpnxtGSn+xWZ5TBWDeRZD9mQcK1aF?=
 =?iso-8859-1?Q?RVikjpAZ3Be2Jl/JbvsTNMu0fyNY199R8OTUPdLBTIiV0cP9f99AEE3JEO?=
 =?iso-8859-1?Q?KwJql1GfFWRLlDGxuqBrr1ohgAu5muLTNFz2vGzG5CdWFionDk0a7LwFLN?=
 =?iso-8859-1?Q?FeE+KsGu6hbAE8o4vtJyo1D1fU7Fi8oFO+E40HowZ845+DKNlaGGfsk/Ym?=
 =?iso-8859-1?Q?VG/33A7m3nonzsAHJGe2OG0mB3ag7BytqA6pzmJzwFGo+G5kPGDLpOXhvw?=
 =?iso-8859-1?Q?e37iOVzJ5u1Ji6D2rymqWjQXjI//seB5be4BhIVOX8ZtQ+2ha533/652+b?=
 =?iso-8859-1?Q?rTfMJeY0WLBi2PoofxOWAGbUAWR1wbU8BtKCh39IllSXu3y1bXP4PA8fN4?=
 =?iso-8859-1?Q?Dzf4T2NR7roe8c4enPfm+plek8pNOueZafjiUT2ruOUNINqXnqB1y1iR64?=
 =?iso-8859-1?Q?sfQ9UQzFIKDZSRDgpNd8RiToIf0KDsh/DtDros0Xh5YohZJJ/8pn9kLVbM?=
 =?iso-8859-1?Q?vCsih7D/t6TBGw8f8uGCNPth320TYTMWWGS0YBYPpF4DSJVqrgubUg/EM2?=
 =?iso-8859-1?Q?peGQT73Kvkb/igQgXsuC2X5JMXcuSh8ORhMeRq0vDnGwB3QDAaPVUGvOZh?=
 =?iso-8859-1?Q?Jwp+o7wJcJ9JWk/ychVtpzodlY5tpqJCzqdrO+Pyp6eIObW4oXiWxVxOkp?=
 =?iso-8859-1?Q?KTOp+3NPN9RPggtvskFsISvsJNRQMW5RV5wd+MW4bwFdxp5K7xw/ieDl8A?=
 =?iso-8859-1?Q?l02zP77AjCmPBXX03bk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03774102-ebe3-4b02-7914-08dda93ddc69
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 23:15:31.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fMg/R6URO3fOQYUvKnFv28FJYoCXlm7drFABP0bMO2JZ0KF2EUsaxEDlI/vfJKA5Rn1QlzR2Y5Xnw0irC8TMbJQXaV+qP7oMYmOr+gkTRfbgx34D2+qnBAvgfZnXkD9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14915


Hi P=E9ter

> > In my quick check, for example Apple case, it has only 1 item, I think
> > top menu can use "depends on" and we can hide it for non ARCH_APPLE use=
r.
>=20
> But does it make sense to add a submenu for a single entry?

Hmm...
Current Applie has single entry. We can replace it like below
("It is using "ASoC support for ..." for now)

	config SND_SOC_APPLE_MCA
-		tristate "Apple Silicon MCA driver"
+		tristate "ASoC support for Apple"
		...

But, apple people will confuse if they want to add more driver ?
Indeed it is not yet happen, but can be happen in the future.
So, I will keep current style in v2 (so far).

> > But for example Au1x case, it has many items and complex dependency,
> > so having "depends on" on top menu is maybe difficult or maybe can do
> > via Au1x developer ? (Because I'm not 100% sure about detail dependency=
)
>=20
> It might be possible to aggregate them to show the menu entry if any of
> the entries would be available for selection?

Yeah, I think it is possible (from technical point of view)
But unfortunately, I'm not 100% sure detail of Au1x dependency.
So I don't know what kind of depends-on-tree is better (from politics point
of view)...

So, I hope Au1x member will update it after my patch-set.

> > I'm not 100% sure detail of Intel dependency. So how about this ?
> > I will post 1st menu patch-set as v2. And your team will tidyup Intel
> > side details after that ? It can avoid my patch-bomb
> > I will post v2 if we can agree about this.
>=20
> Sure, we will figure out something for this. Better to keep this churn
> as mechanical with as less functional change as possible.

Thanks a lot !

> --- ALSA for SoC audio support
>       Analog Devices  --->
>       AMD  --->
>=20
> At least for Intel (and probably for AMD/NXP/MTK) the later looks better
> as not stating that the ASoC support for VendorX is _under_ this menu
> item but you can find VendorX related options under that.
>=20
> In context of SOF vs VendorX this translates better, imho.

Thank you for clearfy details.
Will do it in v2 !


Best regards
---
Kuninori Morimoto
