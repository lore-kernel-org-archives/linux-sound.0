Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFAE2E06E4
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 00:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773362240; cv=fail; b=urLmUKYWJoOiiKzfHGJuK5ECRtOAbgME+JQ7o1BYiwKh0SyeO6ViBFztksriCvghv0IDiGX55T/ByUAmkFkXgEDADVH9wyyYN7kz3X98es03tKJspdWu4PVhTbpeCiYdg2FT5PM1SwNzUgu66w9SvUDvgLBTvdhXap1FRBs+YfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773362240; c=relaxed/simple;
	bh=FPgMaDRP0z57b/fVFX40EYr2vh39aQiR6ZxtMA1RfQc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XpdCbTsHsuKfWrzUf5R59QnFqqfq0ZtL6bcN2Cb42sMjnxWQVNmJ462B31w7F1NZMRk8G+K9tjgZqXyywFxj4+vKQ0jJClKtWpI7f3mZQNW7Wwo1i6tEEBeQVpaQPVV1fOXVwa44ueCKl9ghfs4WhTms9payfkwHd+kgoezPqkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WrhxXS8R; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WrhxXS8R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nv3JiCbZ9bMYqsMPtLpwcPG395RNB0C57b8tnZqcjSVi3E3+ekBoFpJtCrhx7mF2rPAcWYEn9AdEin43IDJZePOPODrDjHGo+XKOYuYopcKqqtE5oiJFaSA3DNpmOwM5dbCBCu1fLFjsIOe54opwY1JAP9fL9bg8o7WVt3QulZDyZk3vsMru2389gtmOL6uSzjK64eeI7cpGKa29TsZzILNlLUV1SPWWZl0ZkpH0dC5d/+lwaHRJI2mn+2BleSgtpJLquEMRzWYIIRAoT9Du+w52Xs24INnMI7XXp1xPtU5xX3tadURsQRqmDGIHhQhNuvckdc0l4EsqlikzB0AGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqmjgweYny5Yk/Cinr2OnLknUwl8aLzcgjnob+2fJ1s=;
 b=CD2CdxcqvlGTsfg7DC/TicsPgcTlvH3CBy05ptUBRY7Cm4eghVKn8aRRuaAaTdlJPr24TVcM1a4A2RsXDqWMAtYydtCgCSu7OZjb4d7m42R3BKL/8n+EdNt8Sc2mWuqaDFja3eEZmU5vq9heFQE4Xb+ZYEmaSxPdyyZMtGWPzIrTYYz6pc/vkHLkG7P6lhF2WumEyLyW05vgnZP6l/Zriy+46VSpw4n66BsVqXLV/3C4CYn3M0EhrmyMYqfCd+4yov25pHSLNDX4IoPRIIOEdxV7Y+1/JuPrLgGIe4PoSpLG6KtGNnqyvSrRCNbqjhqq8ItqBcq51kTJFz3FCkZeKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqmjgweYny5Yk/Cinr2OnLknUwl8aLzcgjnob+2fJ1s=;
 b=WrhxXS8Rrp8X+XUHBSJ8Kim9ZYbqc6qLDe/cxpNtRqb5+0WBOh0gnCL3O41k0ygM/bUH8kbibCOzVDTk4/mMZ2RXuHj/6K0QFNR+hF6VdSx7QyO6L/m2lGdmscj9CZEOgUJ28gfIh2rMws5ADHNvbdBmVEo6ChHtDQyCwF2DTl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TY7PR01MB16178.jpnprd01.prod.outlook.com (2603:1096:405:2a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 00:37:03 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 00:37:07 +0000
Message-ID: <87ms0cy37u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,	Mark Brown <broonie@kernel.org>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>
Subject: Re: [PATCH v2][need test] ASoC: core: cleanup card rebinding
In-Reply-To: <87qzprywbh.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0k8p6ds.wl-kuninori.morimoto.gx@renesas.com>
	<3582df07-8d1d-488e-b76b-b8c288d35ea4@intel.com>
	<87qzprywbh.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 13 Mar 2026 00:37:06 +0000
X-ClientProxiedBy: OS3P286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f4::7) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TY7PR01MB16178:EE_
X-MS-Office365-Filtering-Correlation-Id: 424bc75a-26ad-4d2a-1f35-08de8098a7af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MteyiRv6SNpNx8HnpckZtved0q+G5RSRWk84rLn9ImpSd+dKSY9FN3TxP2ykraHij0Z3I7K8sUvFL8zqwLhSVA0CszBDik4BjPYXtIQR2N0a9dtppcnI5jkjgCa+H1xRMhh3uUDJCKVSTD34I5PVQHEaMFDHXe8c8X6jXiW50idqqO1fb6wGSZOq4tNS+5L58Y+VYFfHFVukXwGV3qx1RQNqryQtwm1xnwN1IxQw5qTlPC75IzCa+gzr50EOR0Ehqm6HxkzJ8U6kXqY1NEn0LqLPKEPwafZvvIleUyJBwTxAkqpiVRHiW/T3theYJbhSbtL56AfPlBUVBqRN0O5cdDQXWlxSl0TitWM8HFKtKS4cZBOdE8IukDywipDr84CaeOh099fuJXPPN2wXn/adO0CQep+lOS8Uf7eS2DskUoCBV0V5jFR73MIyKpkCFhg/nfBzA3VS++zKx/BL9FC9oOFfkifWytSu9qqzFHy4BHSGo2ZAo1E17yxOSKRRzjlqTg5/ZUXyElPgtcpXPffF92NRoG3ByfvJNTdIqsokcSgPFjJzHl3iMGUv4EgDJXHk/z0eLX2yntNil+y5EdI5XVUTa8necJGNYhDYQBhjcuXztP06tOpZILFD/5kQEjJFyUi10cicgv+0MJkLVEPu7W8g0zMqRB70K64PUwaa2iEpSpRFNGeY9ISWaynNrbv2EJXVf8Ov7bv617SSp3EcX4szhBAJB0JPo9gGssYM1kYoctMZOcoBx/c+Xx4NA7gqeMzszN2edi5c77CcDaK2symRYs09VwUvVXwp9go7ApE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qhP1/9PtxfH6kdpx4T3JPH24+h3chSK8sir2ouSi2dcVIl22xc81RcSI2Xo+?=
 =?us-ascii?Q?EVntEEHvv90cyaDec8igkfAc/4R2LUwG/u/TwLc7ec0exyg34RoMY2vB2nDO?=
 =?us-ascii?Q?8/CWINmsFOpV/zsuZbEoM/Fs3sZefrAjqewBgPJYQoOVouGON6HJ0IXrj1Dz?=
 =?us-ascii?Q?ss14QemMf8ODNKyDKeo0Fuh/x+CiqPWgbLASY0gpWFGzD0mXUPent7wUqbGL?=
 =?us-ascii?Q?o2VRw1Kv+UZx7p3wEnA7P8tOvHPPrjd6VgrnEcEAWLupfB9JZCKcxuVgOJul?=
 =?us-ascii?Q?Ich6b0pEcSROqlib7I98T1hLIguk79R8yqOYhqSQtxkBshXfnoiYU4/GdufD?=
 =?us-ascii?Q?byjAAG6C5DWW98O5HBAGe4ay9xoXnDEhcEF0CCQIO1g61DAEBf+daMjsuhgw?=
 =?us-ascii?Q?+nXfka0EDucS/PJmJRiSgzHq9Af2KHb5WCq1DQLrOVXsPdXR8z5XBjj+DiEj?=
 =?us-ascii?Q?vNq6C6d/9exW6JuBD0BF9k9OtZVmfj+1vC+PhH0dzXQFpYOA6IVjfRWce9zo?=
 =?us-ascii?Q?e7khpQ5BEdOqUEPvns+oU9FwbWBq2vgA8hr4V/WP70HpcqS1B+2zhwLGAf4g?=
 =?us-ascii?Q?Q7q1EcmbH5nvIjE5kK0yDCSIaQmcUjjL++5ysZli9tZHsLVt0ptR05r1/RTC?=
 =?us-ascii?Q?5cRUWQGIY4frGq7QV08cV2GwbVVDylMrmYFYR0xXSay0Nhzw5ENY+hsJD7Mw?=
 =?us-ascii?Q?EJxmoKeCrQ4/2/9Paf3EpRlrcAIslTgGh0Z2jqanwe7dIgixUo7ygDrUuAXD?=
 =?us-ascii?Q?O4iVmSSHMGYbq1TNVXJFNsu0uZxrs6RQDQ40nX/6QCKVmNvNHeZO1z8Z8KcL?=
 =?us-ascii?Q?0GSeQYjNg2jMWLQ6Tn/xVrv9RiwcTDxLYZM2DyM8sLs7IaH35PTuNtlYz1Md?=
 =?us-ascii?Q?jLGmMQDGDioetcNVr71nSZDiiSWACpxwHCTeIJGlfWQwVyNlcWZk9Q5rshZl?=
 =?us-ascii?Q?lKu/aE6s9w79uBQI5CtJUCqjbymQ1o8uF+nO1dRbDSqagEOFomdYJtq0QCHU?=
 =?us-ascii?Q?HdpZJUgRfn0oeBe2d5EKrJZooDr15zacIpoG7ZwNjmXZVL0AEGQkvi0QH/vd?=
 =?us-ascii?Q?LgKW+spEah9+AMTGEVSbnYZq5CwpZ/sADYjjTyEpx3k1XXthbYnKZCUt3eiy?=
 =?us-ascii?Q?hozucMOCEj8Y1Xq1tGSyUECls1E+FFL0LpGX12APArkK/6/C0fH3LhOEEj9R?=
 =?us-ascii?Q?a5RrSG49pLiAm5/jrsaiHfzRVLCAcFPRWFiaaU+OARRnm9iHG/3SGIi0JESC?=
 =?us-ascii?Q?gm6zOHjC55Kqc/s3a0qCiEKHk27rdDoqiEJZrmyBWJDBoZq1Au+JYyUW/7Cx?=
 =?us-ascii?Q?7vkzyS9CdEUVAXoKuv5s4Uncb7nR9HjTxUe8vh7c8ZXJkf4MdJGFtdiP1mVQ?=
 =?us-ascii?Q?XBV73WE4ZlCnh/HvUObOU9TtKKpRW6yyipnYZ4vUcSXclX7bp0VZ7gVhxGcR?=
 =?us-ascii?Q?CRKfoX4YLC9enFVupWUCpUKZGuycrR15hMHGasNW4yvD8Te1tDaz0uEkGjTd?=
 =?us-ascii?Q?WYymukSaSA8uYlfb3NwQNpAwZXYPSqQjsdd7wkDJDtfpUbJ+bY9d0hGe56+0?=
 =?us-ascii?Q?/eQ3xNjkeyQ+idDbD2SrYSiTaLsxH6wxPrlmqPsN+pYCguVCzRA0jvdyzkfj?=
 =?us-ascii?Q?8Yn9petcbSuiUKo/r5IeZJaiwgDueTCjsS+kGrnQHqjyt/Zr0Yqw1QeAo/Si?=
 =?us-ascii?Q?Q4W1UYMFhitmYqkzjXwCT3pMmAf/Olc/y4PH71y6tCXzqtDVgQpjbtbjgCQD?=
 =?us-ascii?Q?CLmKgkN4youATCZSWu3iBoFyaITetS3xE99VLjLWXssJsEQA7Y3G?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 424bc75a-26ad-4d2a-1f35-08de8098a7af
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 00:37:07.1810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJIuEB5i3JfJYYNMPP3wGuHfF6Tej2nDNVegKBXXZjpeHZDOqDvGn8xB4ZOSnuQGrYRlwz5Bt2/tjnzSGYf/cLfNDNVKuEUwsZOxz0MzfNs5+xthVXq2Fy+ufSSGXeu5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16178


Hi Cezary

> > I'm against modifying the list unconditionally here.  If the bind fails, 
> > let the order of nodes on the list remain at status quo.
> > Right now it acts as a "protection" against possible follow ups.  Either 
> > there is a need to modify the list or there is none and don't touch it.
> 
> Is the list order so important ?
> The code will be redundant, see blow pseudo code.

Still need feedback

> 	snd_soc_register_card() {
> 		...
> 		ret = bind_card(...);
> 		if (ret == 0)
> 			unbind_list_disconnect();
> 		else if (reuse && card_is_not_connected_to_unbind_list())
> 			unbind_list_connect();
> 	}
> 
> 	snd_soc_unregister_card() {
> 		...
> 		unbind_card(...);
> 		unbind_list_disconnect();
> 	}
> 
> 	snd_soc_component_del() {
> 		...
> 		ret = unbind_card(...);
> 		if (ret == 0) || reuse)
> 			unbind_list_connect();
> 	}

If my above understanding was correct, I have one concern.

[un]bind_card() and unbind_list_[dis]connect() should be called
in the same time. This is rule. But we can't force it.

This means, someone might use [un]bind_card() without using
unbind_list_[dis]connect() for some reasons, someday, because
he don't know the rule. It creates a hole of rebinding.
Actually I found such code many times before during cleanupping.
But difficult to notice it, because there is no way to warn it.

My suggestion here is, include unbind_list_[dis]connect() feature
inside [un]bind_card() for now, because it should be called in the
same time, and it is the rule. We can separate them when such a
situation occurs.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
