Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2622233A
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 01:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774919965; cv=fail; b=WL/0WiBuuvr/VQT0QGoZiD77+7UGMrTV2f55E4yE42c+XlE1cwCPp4N6FaBxmBHJCkt+A+tBVOmA4uxtLqlS4poMeN4iNqMx2PHEOy+JBuHl3G3DGW+t/+chw14CSFGC0CvGdJfdllmTbU1TdCshpDKwRF5hP4uxYpxKNe2wtno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774919965; c=relaxed/simple;
	bh=Qxq5m/T1hGh0XVAWl6wS85LTtVdEUbioSxDQnI2C828=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t73RmNZcHsZ2aXEneBj0XElX1fvSXW222msZk0IwZazQNp2W/ztNK0AORapMNZZcBksB1+1sN/DqJZLvoJyQPnXMD1Cac14tOGdgZJpsw9Mdjdw+uSfeOA/Cy99vhYBC5Ww6RqFx4k9mgv7k0Vo6fnGaAo2XQWwV0lssSAczH3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Peq4WQUu; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Peq4WQUu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZG3nJ88OR1eAvS9rKzkh0XrAqo2Q4B1bhiqxPi2fxlX5LDlvwlrzHJ5ho0vYThQ5Qn6duuXxkvsFwFrpx1T6Q78jmn5EzHilHBUx8F+0WL/wJaJBHzq7OzxYQP8vo/nC8Y3rSYOJx/VliAkev5Bt3P1iQJrjqh0eAP4W2ykhW8kgG1b4SzRtFqruHxBwpKZCjd3PBjlrrxDafRNt52/9FZW4MR8wJa8eaWwyIugA5RJ1xUf3YEixWaXQtPhnboLlCGR6fC2xdLdVy8JY0PUBiP+IInT/D5VkjRakVD87ncdogD8cFJ9/jPM50YP6pF8hMptKVJTuHH8chcIv38uXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MIATXvqV/Ud2qBAlBpeL3J2ncIHOhaH7tBOI2J/6Y0=;
 b=c9O1OCe+sVy1fr9oKSbjcptMERJvrqqujj64kiPXjqvPzB0fJEn7j3WN4mGEBPZ64G8QpO7tyZqieHfz5gq2jXgRrEZGt3eope9TWw2Xp2r8SuQcQ57JuIFM9N9oXEeL+2//Dml9U4o8nlq2llEmw12fRaTJiYaDVzfHhP5n01E8idLPtN2ucSTQhi8+8ULhtPIaJ03HwpZotaQLxjFevrcAcIZHN9sgIgPZQfJL9lL6jYh7+fVstHYRQKlhxvsRkO1v9hli81cscpA1A5WTm+GNFSeunRucOjqztbVh+uBRFlb0w/U/wJI3Xz3CXyYwsCtZWNstjOfZ9dufyL7dJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MIATXvqV/Ud2qBAlBpeL3J2ncIHOhaH7tBOI2J/6Y0=;
 b=Peq4WQUug11hvUy//w23MW65olFZ89qKLcEs8lmtWsm1TTZQl20ZzNGeRdKIv03M5JlmIqQk0CMqROg2q3FeXreDuSjkl0fXdrYuz/JjPZEWHukzqYPFIemLoXed6cXV7rgl6D2x638JAv6I9ZfJYi7fF3V1YfKrz8ZzqChXrJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB16111.jpnprd01.prod.outlook.com (2603:1096:405:2e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:19:20 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:19:20 +0000
Message-ID: <87ikacdcdj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,	Mark Brown <broonie@kernel.org>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>
Subject: Re: [PATCH v3] ASoC: core: use Complete rebind cards by default for all users
In-Reply-To: <a53ac4b3-1774-4e78-b88b-4316ffe73cd1@intel.com>
References: <87y0jsibki.wl-kuninori.morimoto.gx@renesas.com>
	<87bjgaxkdb.wl-kuninori.morimoto.gx@renesas.com>
	<a53ac4b3-1774-4e78-b88b-4316ffe73cd1@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Mar 2026 01:19:20 +0000
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB16111:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f0541e-0cb5-4281-8459-08de8ec38948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	e3xG07qT5wcoP3dHAwtHNuZfGhQJ3BGpDq8jAjCIGjwb56hoW8ytE0bhyIV7fvhus70qcxRU8fRZB9gLwdn2JEUUz5YOoG8QTDSvzCaYEFJGXBmdRLpZEO2p+U2E0lkjKfSNaH+xxjprfRH+m83RBD2kdBj0YXQzzT9FSokRM+hVwmBQriOXyQNZRHvNxlBIOhVJuo7opelK8lZ2APsdCH8mYVakWn7bYX1URDhvBmN+fMa3JTpSFKBEej+G/PJnAZJnucfRHz8E7v/a9FpToYtwMVDkWvIkGo4lnDTyzx5HtqRRzmOR0q6q9OSfkw35JEtNPM9nQjUwk7En5ywiWSvPhfRshIBAAAA+sIzLxqGUIFewjZIdrd5yi9rK0FajPg96IFi//aCa8olmOKkKwBf41YZBkx2bg3V85Ar9bZ7y3GbPxI4Sydp4BgyVPs3euygh3ajCmjhvbqV4mxVsQT7LmiiCAU4+cDXfyTQgP77Qvwveh3TC+TnXWoVE+3YJgsYJYH0JUzciXxKhCp3AeRlULQeoICOrPyj01R59mIlXDPkZO9sU4ULiwn32G+LEsh7jSNtrah/koX7l2c6983fVr/Uh1xxw5FBTDyE/K1dVEVYvBywIXqhvh6rkMReX36iq3fa8Tec9FtOJoPkYyT01Tnz8emiuVI8r4eI7QqlKuOAQgz0lPa0fnXvExwc7HznHZZwdWY2yYaMHA4edFwW+93nl6G+/vik8oNBsvqe/7288WimIO218ppuUHt9jkC3OuJsoiTyN5kzrKWDWh6I84BgRT/GQMF6lTVR45Nk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LDCbFQBAxIHCzylENH91JHkrp6167J4EIQZH70Dooe3CBAup6MKHX/riQoxU?=
 =?us-ascii?Q?HGJc6RzmTjQu1HK9zGKUsO2WsgQJQ+U3RjEurAL3yAspALUdHYoX6+CRgIHy?=
 =?us-ascii?Q?dsacMQe8Oekq+9QQhrh4gLU1gZUoe3VZ/uuHuzzvzOisrkyAG2CAWg96GFmO?=
 =?us-ascii?Q?YnUzqA0OLtEbko2Z/88VHJkHX7Tyos+2I2qhk+Zoqr5Bymm5HyynNKd7MR9l?=
 =?us-ascii?Q?ndNJzpu/kMMxIKRZkHB31n3vxw61TX3vVghIHMx14CDmRtvZy9+4KML5VU20?=
 =?us-ascii?Q?PJUKIouCxGK+v3u2ureRyWe/GXo9ZhEjOhF9zSOonK9jrLlH9WBOSgp0aS9a?=
 =?us-ascii?Q?kYN1UDtaMw0+Tf8DuTt8/JF3+z+pZNb9hSlhsRde7ayobHPLjjS3Dk3bNmU9?=
 =?us-ascii?Q?l87krpdrInJPfUeqhlPRCFq9Z3DCWDcA04//O0ujHcYkAKfxUA6z1QYXkQ9B?=
 =?us-ascii?Q?b2du5uQuJY8eVOGQJ2wzdv+L0LbKYb1b2/cWXwbpIgDj/Jzrn6aCPQLG82cZ?=
 =?us-ascii?Q?3bLG5syLOp8OSMiREtVFWq73JniC7cgOrxAPq4ZMKm1r8xA8rF7NQ6ICSaWC?=
 =?us-ascii?Q?7XpU3eLbwYnOLmDXjAceMaKVyyzSq42+0vVoJHTtL8qoU/Usf3WBhOarLvnL?=
 =?us-ascii?Q?uyAKye9lFTS2KZJfHdvzKur2CbY273kf9/yT/DTnww8mPOL83Zk9vXnsld4P?=
 =?us-ascii?Q?U6ycPTviF5wmdmw0PDIcWZuG6t+cUJSQQDvyXjz/M3XPA9rWl6etz8j9f4CF?=
 =?us-ascii?Q?+xrXPno3IaJ7v1+3K0fEPdVuihCQc0kW4wVbaoaIa6CVGtO3gcSVDtPr6rJB?=
 =?us-ascii?Q?upalQ/gvo1lcRAyldwD+vXRFqj74U896HAf7Sxb8jrXbLlXtrf3xdyYsdiMo?=
 =?us-ascii?Q?CCP6/kTMZ6Ho5CTe+fnPYu5wkysDupftwIYpg23xnJUMsANudVof9gFYtbRL?=
 =?us-ascii?Q?PdxUP4TGZVpQfV5kEG4iMR8RgBVZk9P2lBdvP7rDOXdfAptOUFvM4Sn4PM7b?=
 =?us-ascii?Q?6/j87wRjCGJFPOEnjLYwkFoxKKYRmO6ughYN9jtEsimALZu5blOyvbqx0Clr?=
 =?us-ascii?Q?m4PwkXr/IJoPkJHjWeRgr4T1UULP4LkLl2qsMrIecrX8T4+wN1I2WptN72MZ?=
 =?us-ascii?Q?Lhf+lfeODzf0QlDJeMwNBi3j71gQtDalnwX17c5wmjpBnXqKRikaOnFQaoHm?=
 =?us-ascii?Q?sDxDzPSR/AxuaVs0SK4F1fA3nPhDkV/18CNKUUZ/rsQyccuQ9mluC5ilDAW6?=
 =?us-ascii?Q?Dm+S62+mSPg1QdXJD0XWjv9LFsT018S2G5hLXkjnoYMlOZDUbGqZxdwd/vNB?=
 =?us-ascii?Q?rv2EqsqgcRpVkOQbwtHxe31e6xuKgcyouhVdE/IiYl8f+7RHGqQqbYmS13G5?=
 =?us-ascii?Q?wSiR2nAvIR9IsjghdeAkqRr+n8nmnL1M9UqQ7GWpxLilyiUJwou8e72kqPh1?=
 =?us-ascii?Q?+aPSUjMIum8jpW0GehBhffXcCDm1Iuh3JGLRyk61ZlimyWSvBVioGkiJ26jl?=
 =?us-ascii?Q?yrlpleJkNrkYXHz1dumdGsGQ4ybmBSaAL8et6zvpyA+J9iVJZvlXNg2wSPr8?=
 =?us-ascii?Q?ffKVeeRZhn/tKFOJuNR3fdoylOBV5Maa7ILLtl3IO2f2cMZejDOEzEdXLl+u?=
 =?us-ascii?Q?Dr4C9ExqGZW+d9VJUmy10K8XxAsxYzA7AhBZ48RqV6mZLkplNj8TzZTMucrv?=
 =?us-ascii?Q?ap6MjrG457nIBX2nimdElOkjKCebmHoHUOeEwU4x7Y8R0F6W6F19BJ4i7jzl?=
 =?us-ascii?Q?rMLyN3SN3n2LVIqNTCLSfIfoXhcQuBhUiCqyg6ztLYrXiEfIb64q?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f0541e-0cb5-4281-8459-08de8ec38948
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 01:19:20.7800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CoWCVhYl6XiMWsODX4FlTVdBPMuze5TL221LocKM5O9iplXtN/INtIkFPGJ91HGTSEW5LGuSrcZalXC+B7t0qtroAT9VmTMB4PKH98NuIedWDt2VGpSQMV6SdhMndJT/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16111


Hi Cezary

Thank you for your feedback

> >> +	ret = soc_card_bind(card);
> >> +	if (ret == -EPROBE_DEFER)
> >> +		list_add(&card->list, &unbind_card_list);
> 
> This does not look good i.e.: squelching 'ret' is required in 
> EPROBE_DEFER case.  Otherwise binding deferral is not supported, leads 
> to KASANs and eventually more serious problems.  I may have misled you 
> in my previous review (v2) as existing code has explicit "if 
> (card->devres_dev)", whereas in v2 of yours the 'ret = 0' was moved away 
> from snd_soc_register_card() to snd_soc_rebind_card().

Yes indeed. Thank you for your feedback.
Will fix in v4

> I've attached two callstacks and summary of operations which I've used 
> to reproduce buggy deferral manually - no magic tests needed.  If you 
> would like to see full dmesg/traces, let me know.
> 
> - case#1 is patch 1:1 as is
> - case#2 after updating the code with 'ret = 0'. This means there is yet 
> another bug I've not managed to hunt down. I'll continue debugging v3 
> later this week.

Thank you for clarify the issue, but hmm... I couldn't reproduce the
issue... I manually uses -EPROBE_DEFER for card, and use rebind().
After that I unregistered card, but it works well...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
