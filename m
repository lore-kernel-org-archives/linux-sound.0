Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7702E13B58C
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 00:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782864754; cv=fail; b=mQakFSQEw0HZrzVHoioK4vkPwSq0v/6XprEuwiDqrj5MATFiZy0s8In4E2Y2Z9iwgKB9ZSetJl99nmVZyj9pptTCNoEkMhUOBO9so+cHKYX3AHvgG6XXO8dFovrgNlSm7Wh4XecxZxVJsllNS3pXNE61mIj3ORnHS5FSy9VKc2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782864754; c=relaxed/simple;
	bh=ofmOfLJimYLIheZzR2RkG8l3/joESk6eJvPAEv05cEU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=P5O1SrE+xHFCx2BxJO5Y/jRLUZLFsrYvK/OKe1SGi8jiF2uCFSW9n5KafkbkmYzm/CR058FnFvWWdO84WImL6t2ZmMQPj+BY+gkNoOdVIcicwFdVNwjC6lEcmKRGcb/uTQ8nL3KHQP0U3gDVFhVOV0/w58Vo4iJwcY2xwLaTWrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gtjBlBSN; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gtjBlBSN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZE+Vw11WWB5pUvf1qlQfP1vJEh6B+M8WXdQbt5UuYyAfsPjgr+vTdEylE9hHD/cmD8eO5h5fGWiSfkW64GNfWUsZibfLYmeHnQMiplEGF7Gkzbom+veOG4hZbiYNNwesYPJ1oQyeqiqp7lIoBBXGt6gIAE36RKKTEPG+m30MQG2iC5fVqveb9QIaIUOo1SJqZIi97amgolKuqkPDJ9zn27o4LxGo4s1ZwpTqpiL10V3Wb0XSkxBKaqTSc1PM5ncQ2fpIFtOPpQwP1O4ItwO88FygAEumES8TRzoBKXCiYE1fCywBCVCRbJ/fMc7cxPXGgwX8G9UtGI8IckRDrJYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clhmz0XuOLSWnzwtRIn2yk74bTB9zgcjur9ltbAml8o=;
 b=pTf12SGoHvQMm7uYU9LnJlkVx/oyfq427Vk3pkohFhU3gRbCOLL0BhAzlh/pg69x90ILUizFBzwLYJ0KiP2CPNNQUytRwV1buXUrS8Wge+cCjeg/x14Hb3Fy3Bf1F/LIgXCZfxHChPxgLtasgjT/seoXvTer2pZZvKyNnwrWUBc5bUVQE32yuKz+2SWZYiK1txBnBzkMnGllSxN2KNy10Z9h3F6QAKBC9pcvVI0sySnSwaTOR2MCY5z/Io3F7M5WMa4OngBY2cNWwIE+Fv+z/wDnDDmeTzqIBULihAzr6WSwqMjZ0EI6jaognaHher4KrmJZSwvUJ9De10N/2QNv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clhmz0XuOLSWnzwtRIn2yk74bTB9zgcjur9ltbAml8o=;
 b=gtjBlBSNgRjWkbgSiwEFop74IqkR1HYO9nex2BEPwungEoTa3mx9fUYpN492nBRVPBa0/bVeZL4dSapqanH7FMjbhpcOeGMkTgOUbTvUR/6plJww3nuCGQEHWeObC3Z2Q/8ODue0qJd20fFY2twh3E2rAZcQWk6GPMHBzblihqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB14076.jpnprd01.prod.outlook.com (2603:1096:604:367::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 00:12:29 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 00:12:29 +0000
Message-ID: <87jyrfd0uq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 06/12] ASoC: simple-card: tidyup simple_util_parse_card_name()
In-Reply-To: <d1fa5017-9df4-4479-a9c8-cad124eada38@sirena.org.uk>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
	<87y0g1dddl.wl-kuninori.morimoto.gx@renesas.com>
	<d1fa5017-9df4-4479-a9c8-cad124eada38@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Jul 2026 00:12:29 +0000
X-ClientProxiedBy: TYCP286CA0357.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB14076:EE_
X-MS-Office365-Filtering-Correlation-Id: a30173e7-2d1c-4eac-5b0a-08ded7057061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|4143699003|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	wEbNCMeDrOq7V+1xB4kkkePo/VgJtjo4FajB43OwzQAXsg4EuqN9bK0w37O6fiUy/bGbKjQ0Tzkvrun7l2W5bahDhKiA9ABI61YsnJzqBZRFPjde2ZvrBON8W5F7e7OmMFHCofeWWBRanZRde6nYcVTnoAttmHK0ZHw55pe7O1a5ytiYGt63dM9fimliHr7ShB0xhjT4An4CXlAkvnd+K6KXwrKWg7VOc//bJNryg876t3mR67HtusA0U4Kx/Dl2+WOYoPJBG8Luifjk7WC49NQrx99gB2gdAMUES+l9kRmTdOSR/kCVJBplVut8CtX8/lX17iREmaK0kzHjjDl96Zt8uP1S8mxYVcuJV0ZVO+3lhXmxkG1Vb4/P7Ar7F92lPbiM13DWbzHG9xS6hb2oJmbAOhLdawmBSKFeYUht9IR7OT7JjHhjv2cAmoyN5+ARN8El3LGPQ238H5T5Eo+3mma5RFOZCYauPtHodTskbD+8RudX/EO5zrdWOB3XCr4mL/NxKwVlZ1MGMVEzpfXwwoo/heKF+ebKSrGoMOYQqGjmlX3SCTmI/ZM4ilN/059/8jwH+9LC//0lkgsrhDwv23jYrhm3CXBR8OgpVn0+211Es9a86PbK7fajImjfOtBASALKrAnD4hi+evAFN7E4ScnRNNBRv0hbCOR8sMtO1CxteGaKuK8SiZS8/lFTQOeIOEcytNXeuBEAV7WOAXM0RI662RjCOZTWVx3aS/EE9bQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kU5OZnYJvIW3vWKnvp9u8BkRh2XyNmXzy/00ATRZgweiw1UjGQLOI2wzMzhb?=
 =?us-ascii?Q?iqms+pkvrVmzXnbyTKh02NOBngqDYF9U5qLMu85nAU5JrXGMSwQi30cCH7ZT?=
 =?us-ascii?Q?/qoRsIXnc/el577+C5OeNCB5QsHmyDMNeR9ZJyM8rJ9aPI25r8NHbxAi3H4Z?=
 =?us-ascii?Q?/rkDWNMdIdjpSq8ZVna0f6hAIVkH5GLXHHFb1urFaqR69XW7cf5Tn/LrDRpL?=
 =?us-ascii?Q?L01pr8TywlaCeODWK9259k+X2KFlaCR3LcWz8VrclU3SdvjxTd84mlgm23Rl?=
 =?us-ascii?Q?Sm17HxCZj3XcI0vhMpH+8nauH43qhfKZ9EZw+u9bKdjRUcrNAWGRsOcoC3lb?=
 =?us-ascii?Q?9adP1lLIattMyf52KgbqANesYbYl6EGFOshtw5dd7cTmW/IhCrsXXNlCxdfN?=
 =?us-ascii?Q?TYKWoCs1oUerdu6BWoIg9XMmFsxQUhdxWTk2vJvKzd+th6V7X6vDv70fWpUp?=
 =?us-ascii?Q?cVmPcDcxfVYMVBNx+NIQtmrhluLnj4kZdz1KlsBWbcY/4jbHInVhs7IO6Rqn?=
 =?us-ascii?Q?7vizvEipvRRhNBF89cCjTQZVXssasNSBQ+orEd1IkhKGZIWlJJM1fcilC3k/?=
 =?us-ascii?Q?WY54hiZFReLw5ncVVDI8ZUoreCAhjHK/uDSLCZ60ZcZVJa++A2C0EVgFr4Xe?=
 =?us-ascii?Q?O6Ce+xdZZzCyg5z/hq2b/vT5q5qStnMRNf3iJfXt6bM/v+6QNP/R2KTNg1n6?=
 =?us-ascii?Q?/YVcHU1UarO7+Auv6cdmBajnztI/2TGV0UHC2RdLy2hs6GkXNEfIUPnJx1NY?=
 =?us-ascii?Q?ps+2Bq5u6xpXTy0pySO7HSM9GURh3RQfIGdTU+DzaDrlzJ2iGAhs9FZO0z4J?=
 =?us-ascii?Q?u+9qKrSwtOxktyy6+DmmqbeAXVATYdlFt2YpcniokxB5lpbErehnSq6Z0Y5m?=
 =?us-ascii?Q?+/4UFLGE2tcPwmNTIzC6v72kifawf7KHnc5TIafOIoRlkidOzSwEfqN4Qipl?=
 =?us-ascii?Q?/IgHp2x/B2U+Gmko9o9mXJdTaRd5VKLn3v8vURievhUOpxTiRSg0XU9u171/?=
 =?us-ascii?Q?dohUfgwXgmj/gFOFoaBeWscuqfKktTWQYmSBmh6L8B4ku7Ez598oLcFJ5Nag?=
 =?us-ascii?Q?KXltg6wHg9/y3lvKIhdov2PBh9pUlN7xM+OSTOrB4mDj8wIUdtJPI4qVJnTT?=
 =?us-ascii?Q?047YnU8hVyecb/CoqDXuJ6mc1NhE9CkVKZV2xXuo/TMzNhKaqDlnIIIy67eC?=
 =?us-ascii?Q?71WPPiTQcHgiTdSkGtwYlRdE95i9YPqmOuEtN1Cx1GPEuKPNvZOjg0MgvSf3?=
 =?us-ascii?Q?YirHRplOhYugFvYcNkN28Ed8KaSWtRbk7cR9l2u/eUrJ6TT+jqQ9Lu3n9RMR?=
 =?us-ascii?Q?BLCnir4TP2vsb/0dKrVSceR2WC9P9SI6p7PFFq0goctWLgPHYpw4pS2LHmiH?=
 =?us-ascii?Q?qLmk67KhKexXuPDG17n8PkWlJEcqb/noPn4ijyHcPpQ974xGJEjTEMm2YKuH?=
 =?us-ascii?Q?DRA4P5kP1MEaxarAEKVf3JWvTFoRC6kHnvdGLmx2XFx/j+ySK+03RvHlgCO8?=
 =?us-ascii?Q?fcE7FVFRjeqFDIo3FYIaj867/Al0mQXHt+4XHW/MrwBWpZU6TgRYNEOWaY1d?=
 =?us-ascii?Q?Y+MQyVf1dNtKSgowopgoB6Yi4Y1bp4FpPar7W68PsFVlDMJc4BGIZCRSjTpy?=
 =?us-ascii?Q?VZ358Rh5W7a2QNRHBJmT5E4VpfLq2t4FMNjDVWXmP5n8FA7O6eXKDUfv1AMr?=
 =?us-ascii?Q?2f2tAgbIIXQYVDLvVOJE7ONFTqSo1VwGPDD6KZ2wrwR64KvKIQaPZ1Ud3ZNk?=
 =?us-ascii?Q?VA319pfRZsVAyv1d+Fzd9dxg/TJ9gcA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30173e7-2d1c-4eac-5b0a-08ded7057061
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 00:12:29.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnYtZckkZICLLt7hPHZ+YNiImfdxmqAqCHafIBLNu0J/y0hNQtEhCrrMcFWYlXJ5aq+H1qBVze0unp00cTg3HsUIfvWvCwDxb8raD1j9YSPWB9uCMdpghstDyIfZmm2z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14076


Hi Mark

> > We can re-use simple_util_parse_property() in
> > simple_util_parse_card_name(). Do it.
> 
> > -	if (!prefix)
> > -		prefix = "";
> > -
> >  	/* Parse the card name from DT */
> > -	ret = snd_soc_of_parse_card_name(card, "label");
> > +	ret = simple_util_parse_property(priv, snd_soc_of_parse_card_name,
> > +					 prefix, "label");
> 
> This now has the prefix applied to it when before it didn't so the
> lookup will start failing.
> 
> >  	if (ret < 0 || !card->name) {
> > -		char prop[128];
> > -
> > -		snprintf(prop, sizeof(prop), "%sname", prefix);
> > -		ret = snd_soc_of_parse_card_name(card, prop);
> > +		ret = simple_util_parse_property(priv, snd_soc_of_parse_card_name,
> > +						 prefix, "name");
> >  		if (ret < 0)
> 
> This already had the prefix applied - we were trying both prefixed and
> unprefixed names, but now we'll try the prefixed name twice.

Yes, indeed.
Thank you for your review.
Will fix in v2

Best regards
---
Kuninori Morimoto
