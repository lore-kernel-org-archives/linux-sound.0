Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14AF17BA1
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 22:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620047; cv=fail; b=CfI+MjONTSwWUufqhAk6ghwrTEaZwWtu49ignISyvTGZ5hFJS2mEWpd0yHCFWdM3oR6oDlzc8rVA9AcvRqN3FNyCyqHCeg+5un94w+FpcPQ9Od4cGAJAXI1RPXc1Gf76iIp8ku96g3LSqU8FO9UoN/cRY0ElbD30JD9HHMdz6Nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620047; c=relaxed/simple;
	bh=M1L36F0aWIqVVmdLDG5I8LT6ZIC4xl+Bm+gZUomDN8U=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kBO7x+doaS9fgLNzPXcR/UTqF7DP8Lr+wsETWoR5XazMAzdb2KQ+F8q9j3rICrZzoKYmpj7R3Ty56VuCEioZ6RD4PMRDHV4QB89maAJ3YYE3Psh++HVMOxz2kwAozfzJ2fBvCX6xBSQg/0MhY/xTbyMDMYNWehnxXo7OYIqSIoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F74C0Dzj; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F74C0Dzj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQwgwBdubfYrfg0freps70Q2ZVgNkfYzmJO5ti36MO/IrvByo1V1LkO7wThyDQM5OY9lRnPs8yWYVRVJqVDby0jMSjtfLfpKLX/NuVGzOuwK9lv++Evkx6cIBFsW4NpYKf2WC0GE6UfqPSb+kioy/RAcPfrVv2qHNMea0oJ5SJbhyJTMjLObKrwRz6LN9DPDfCD4ZAW+51ZlY534pfw3YcXgFTu3GIhhEskzcQjAG32CRvuVu4fBL2+UUcjSOXVu7s63DFZBu9cvagKyVtaGg6tLBeVhM2pTT+D/mTPaEP89oqTn7FCfCdOm/TopMzo8ld0uZp6XmzBx3gmnx7KXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hszN/AyHyE0hn9R2K82wsp1mqqX/+m8+hJPTu7jbBVk=;
 b=xoSWddKAdimqU0r+2lbRC29o30j6MVcFQ7UiVT8EOcHjGR7Ywc4sQPwvZNsHtrU/9Y3XZIJsYYKFr0XoPQW1YmpdLP5ReJ3OoWo52M1iVwtCK8cbhyS/S3mcWrkUo37tJw2wUSaqZMorvvQn+rjkAhzoy1A0fKaomRlQhOL1qNko3bCPnySRA8HQL/LZOwj4CfpeE4u4bji7gZwsCd1uB9DATBD0krX4jjdofjpCtx2mRKOO5W5M1My7spDxzKAnG5Cs4WeepiiIIeBJFuHzv3zrr275boL5LUAZ7FHuGoZZ1YH2zajPK2rtY4BMcEvFoeDXkeEd3VwVH1EZqyxI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hszN/AyHyE0hn9R2K82wsp1mqqX/+m8+hJPTu7jbBVk=;
 b=F74C0DzjbUilMRqKpYEPuTZ+/jUawrC8QhfkaOEcbCpjTbgrFsxfc6ZItB3O+95ayMglqCAbIH4JpH2Nhfa1y+Z2CstwANOV0dAO9z+/nOzftu98IlAMPNr1SdZWUpvXeElD9c30ZTPKMKR7LW6qB29Xubtg011S8JBpmWuJOms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6923.jpnprd01.prod.outlook.com
 (2603:1096:604:136::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 22:54:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.023; Tue, 15 Jul 2025
 22:54:02 +0000
Message-ID: <87a555njzq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Mark Brown
	<broonie@kernel.org>,
	<linux-sound@vger.kernel.org>
Subject: Re: Question: how dapm should looks like ?
In-Reply-To: <27b8d825-16be-44d0-924c-2c83b5e83bcb@intel.com>
References: <87tt3nmork.wl-kuninori.morimoto.gx@renesas.com>
	<27b8d825-16be-44d0-924c-2c83b5e83bcb@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Jul 2025 22:54:01 +0000
X-ClientProxiedBy: TYCP286CA0265.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3e6f6d-640d-4579-9917-08ddc3f27df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RZ9nUEX3IdrN6x9fe2qXWz2+fCffvxDxD1C7F08ZIcVOVdfENwfMs2ZqGJ2y?=
 =?us-ascii?Q?iS+cIjoz2aY3OSqVp3cJdt7Cc33+wbRGGAEUd9WSplyoyE6AMm6s2CC7VxS7?=
 =?us-ascii?Q?BGHnWUmf7ISomTLAMZCb1Af6GjgZSoPnkESJoTt3ZLUEMEiIOVZo+Gb0rCdc?=
 =?us-ascii?Q?DBnUHbRjhVBWMD8lsrwYuMZfSTBJPfQygk1GATQDA66dygjfxdNv3896vWMe?=
 =?us-ascii?Q?F1RpskEH+gmUug8uHaawsW9sqf2uBFCl8tDPxr2spAdRYC4DRSnP9dJdLQh5?=
 =?us-ascii?Q?8tUCXOiHVBnTd52MHUY4n4d6gFFVXkwqv5jeZPKLhjMxmHbkjN9w2/IENQWA?=
 =?us-ascii?Q?ERI4kgFOfcVJBI9UTL95ln+pDP8Kc78hCNGiEFsomX4dT+INf0D0PD/B5e4B?=
 =?us-ascii?Q?gR8N9dltyndv6kOZ2JplfRdkEbS7S7m8VKbYF+eZ/zPgxLisY36t59gkMRKo?=
 =?us-ascii?Q?/BbCZQIjvm6c+yHjofeaK0LA+gSiKaKrhIsWC5yAJw6c5z75nY7gbAOtKoeV?=
 =?us-ascii?Q?IoP0RNRe+mAIqJxFPfOLcFBwQldp0NMWZF87xT2ZqvmytFLcYg1odvyRY7D0?=
 =?us-ascii?Q?FcnLnCkgruFzRIm60mNN4VpxCZTgKXLAeVL2WTg7hfSXNJAJ8o6y4anOzYle?=
 =?us-ascii?Q?cNHwHnI5YEiXBglz0mMltphc2J1HX70XCBgGdrb++3bmnq0PWFQBgc04/LOM?=
 =?us-ascii?Q?yws2tm3uji/i5+fx+a7DHPz4XSzV3lC17VfdfmOHhiJrGydkUYmqvibpVKYo?=
 =?us-ascii?Q?9mhwX3ZwtnVE5/Hdt32DYPfUp50gP2RXjWz4khhknJTUWC7qy2dtFSDuAzSq?=
 =?us-ascii?Q?eo0K0YkiD0I4j2ULWYpi6aozqY+HsXXG1nDHO8xNBndiU9mFO83IHkkE2jxS?=
 =?us-ascii?Q?oVVzZPi6mu2RO8h2byAO4agE8minwJA5c67bGZXLTNPpB88hkimIrVa13zcn?=
 =?us-ascii?Q?5u1urGkzB2TMcSYruf5xod/dte45Ma2kNXkGywYPsWjP8T66b/PMvKbQu5RR?=
 =?us-ascii?Q?x06mcZU74mA3bxjMxqRsJaRm6mLv0EEV97flZPOJZEaoyr4K9G+wGGnnvwsF?=
 =?us-ascii?Q?9iBV2gNAoprewRUgVzM01/r3FHM6P4UvAP4st/8rmndKGSvyyoLaU3htux3P?=
 =?us-ascii?Q?Fbfp8YSFO3w3Pax6dBewY1CSMzjcKkTAEHeeGbdNvlwv4cHvohtN9bPnHnWU?=
 =?us-ascii?Q?4IRZkcu6T9i0DcOxB5RLE7HzP8A2QFbgObhrcxs1xoBhXJRchXuiyfD8nPFy?=
 =?us-ascii?Q?w0BqQhyg176G6HuYVIFJOFX14YR9c+etjn1CqF0vT78uzlTw2QFdz1N9lKCW?=
 =?us-ascii?Q?57vkFa4n3sHYH7rUg7A/Psa5nuY+y+Z7i6se/cGXQsN80VxOu37lDo6itXe7?=
 =?us-ascii?Q?GTLGlC4DnqmaGOQfV9yXim1H0cQHytaQzDnoqxv2C0wCdOofBUGL2FU+ZUNL?=
 =?us-ascii?Q?5HBZl+DzqXkVqA3nYrshzGv3YZg5EMc2aQQdnUdECmhkWU5SDgUMKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E2zmEau+P4efZmOutSfJhP7WwzRMT5lCjuCKK2ZaCvIwnbGGAbisfQG9XieF?=
 =?us-ascii?Q?DCjNGbgjRClS16EMAZUdlRKf7WtT1nUDtaYb1vpkRqiqcVmBV6o7gAEXNT7w?=
 =?us-ascii?Q?uTAugBjlLPMvr2YYBO/E22keE709IMNpkYphZcSgYpN5Q3fmn+OMf1YzQ7Nq?=
 =?us-ascii?Q?VpMPvYWZGc4/7lJecKEPAeAHiyrjg5ZrH89zw8+TXQNq37MdYNFgCUNvBQ8W?=
 =?us-ascii?Q?MzOhti9qsWTq2u7PiJh5uyWLq/mvfwS1/iIVP6l2D5220OIEPdpdCwAxbnHJ?=
 =?us-ascii?Q?FTgnhkQ93aVvvr4mVENitYXGOVTtAvEp7OnkJ1CTwkPxSCoJSCaauolYtCL/?=
 =?us-ascii?Q?cqqecaSuDB/33STpqq2v1NjNYS05IHIidmnJlMxwiIdc/N6/5JLdObJa4BLP?=
 =?us-ascii?Q?1Qaa0ScFvXy+5vyo6kzPI9slHmBz62rkaSjdOtxFib3b/PmoWH4YDAc5Lt6S?=
 =?us-ascii?Q?ntuUMFZ4cdksZprMzMITmkwV2niW/lXO0iUXKa+kpbTvW14LQKlXPezllYHt?=
 =?us-ascii?Q?UtruKx4uvQn5G4fLDn1b7rnfw+vBgDbttca83+BHar5kUbMG48CQmfXziCIM?=
 =?us-ascii?Q?7m+5Bxb0ux6M8r6s9vX039EeoG292uXuHMFJEdb1R7NKwxr/ka8lJZKaKLig?=
 =?us-ascii?Q?3ZehiVXCyvcNReA8fPl7r1APr21KUQ6oSFxmw2PLLy1kbrp6YfpIfVOP+7H7?=
 =?us-ascii?Q?aW1RHl8MaD+kmpeYEYX7NkD9Oo4via/w3doQIhtxc6p6gC6E38Dr0hz7qa59?=
 =?us-ascii?Q?LRlLfBiDbQwMCeg0UOyzUbx2ULMJyLmjBchmMw+uUVHLK3UjTjq06F8o3u3Q?=
 =?us-ascii?Q?1RW+VUYMq85iEQ1xx4yGIwRyOAVHb5mARpiDI84APhMOxp9k1OWjW7BcWDoP?=
 =?us-ascii?Q?VpOUpZCfwLe4mZrtghoitDQWqAeoUzolE0LqdV9pPXiVXEi59tiKrYm2Mx6m?=
 =?us-ascii?Q?wtbK2uz1C4+q3hcimQiRagfW0g+Nz7o7/QgYywgKJjZwAC5d2aT9uiz83yYb?=
 =?us-ascii?Q?XUE2Ig+6CURsUJK1Gekxgj3v1BZatXYBRw4FGfBVhyTp+qJcvg3pIrS+Ib2k?=
 =?us-ascii?Q?iTDtl658Y7pjidSGkqwg/oAfvzWNU84h7IKm5H4RIuBcINpOeQMGHTNlY4jp?=
 =?us-ascii?Q?7w34d6SWkd0UZuZVG4uscveSd/RoKBwDzuUcys5ON/mQ0695UaNgR/i3cJtJ?=
 =?us-ascii?Q?qtGlz7IH7odOarr9jrjgua3FzGRUEb15SPvL3J/oMVTW8ekJPgA8UAm5ZAxr?=
 =?us-ascii?Q?RaJEbuhJrvnryjolsCxTJyXzExLv5QNGar0S6D/LAP5hZjZfDJYjTuTVNovi?=
 =?us-ascii?Q?menR8Rcr2GThJn8qF0tOyc8l4CbRyFmKHH0tHorocxP0FUsbdz7k1ZcKxen6?=
 =?us-ascii?Q?sSn9k8ObfsZ+pxO60vfdW2v9WQadu6r1gfwSzQfUJoiLeHUV6BZdPtHsO8S5?=
 =?us-ascii?Q?BhrmefFCsJttGiXnhzbAsuibfVkWUIQ8fL/YxzxeuEgQP81b9JnjMgNzABX/?=
 =?us-ascii?Q?Yjlmzk20vzKCpY9C4yedFzsczTAFDQZjbBJQwPtt8NJ6qyGiAul8nBO56gCK?=
 =?us-ascii?Q?uHyspR7J4QGJuHGC8JMtQ6Skz9B4FzI2J3JIIuZ5xOVm/+mcVF4/prPkTd+f?=
 =?us-ascii?Q?b3DbC6EmEWVejkW2FXq6oCQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3e6f6d-640d-4579-9917-08ddc3f27df6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 22:54:02.0724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCy11722Ex06JqcTq8Sv2RlhcH9otys8i2RV4nzJQDN/O8oOtmrlo2u22oOBIzhOS1rBIMf37UbWcFSnO4FYjumGNHgrEjIJn17ood8IsZ6hOemwDJSvzr+m8kTeMAfX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6923


Hi Cezary

Thank you for your comments/feedback

> Thank you for the upfront message with high-level overview so that the=20
> direction can be decided before any code is actually modified.

Thank you

> > Pattern-A:
> > 	User driver should care about existence of "dapm".
> > 	This means user driver can use snd_soc_dapm_xxx() functions directly.
(snip)
> I do believe the Pattern-A is the way to go. Mark provided good comments=
=20
> on that, my two cents:

OK, Thanks.
I have created patches based on this style. So I don't need re-make
huge patch-set again :)

> Be cohesive. Dynamic Audio Power Management (DAPM) framework has a=20
> (distant?) relative - the Power Management (PM) governed by Rafael. The=20
> latter is commonly used in the entire drivers/ and it's not rare for a=20
> driver to manipulate its PM directly. Also, for someone new to ALSA/ASoC=
=20
> or coming from a different part of the kernel, it's easier to connect=20
> the dots if both power management interfaces share the pattern.

From user driver point of view, basically, the names of the functions to
be called (and/or its parameter) will be changed slightly, but almost no
change in its usage.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
