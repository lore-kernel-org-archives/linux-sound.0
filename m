Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD771E515
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 02:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776132546; cv=fail; b=LAFfZ4a6BcIwY8t5cZzQ2VeDc6E39Upa+fyIAs1e7YeTLQM539DA5fVUPq1TeKd3ErTszSYzLj6e8FE4+dYr1bPuGWly29u7RnzuD3BWTfoLLWfpD5m8QubYd4Ss9Xf7itww8XZ18ZvmIhV7bidQaM9PQJ7wR010Jd/01BodCzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776132546; c=relaxed/simple;
	bh=Yg7j3MMtVOHvPqIegzpJ8popJi1BltXIX75eBfJw7Lo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Mj0U3/plbsW7dKSdSvl8AbReOUAnAHcqQowtSuIZhmtVWuDPUAhMHxdz9iZWGuWdslFCOUw2Dd+TFxtvEklvaFQJ9WXmpZVghRfLzQgsPpNSU38uThQwH0ehRdnbny5r78U9cSv77ZXVN26jAzzUZ2//WLDkEjOAFLnYYqrEIg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C+WNQq1t; arc=fail smtp.client-ip=52.101.229.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C+WNQq1t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lm+9nUTzOHQ3F0pYeM6kfiTjpqPRIpmRdthZJz3xpC5wrMfNwQFMjqJ2m+QCsmVGnWwGxR7T3jDTL37xHl+RCJRrcRR0r6rcGwFqzXDz65OAGppEpBAm95dqZIqVL4uQJxdaFKOjvapNala8O9JpbXCl0J5PJawMnOf/lhVUSmLNueh7YMGdIFnKRiZs/1IuqIQvt542+BvM0yXxHxzCSYjuQBcIe7vQjhepSSaYB+CEIy4pehbuQ4gb8mrQOE4XnJnoeDzAWGimS3SzwVm8uDbuydbCPDNfsQxSty6iQZ9wdde9iQ9RUe/dde6oSELS3DFJRwweF3E9QozW7UYUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGoYpjFw2lqGDZmwGS9NBaSNWmIKq92P0noNltCVCrg=;
 b=vuVYs7n2A96MQ4EHSj1W6exbByJDe1V0jUXug44nui7yWSL/DxJbu4vervw+JsJZSB27krl+T3+W0zj6uzPCLkc/dgOP/hcqunWL9yW2p4eWvdl5t+dImZZBEqxjPO89W4uJpK8dA46gZPx7Uq+gdXj0M2FThraRnTorglmULg0gnnnihqG4Rx4EVpjBK151tLQ+2B+RY0+fGuraPmIP0Rhw02DeFIn7dQkhT7pt4d6ian5YXF4OfJ5ji9tvhfuwNwiSku83QLjoxmRxKcfvhIsMnNp+UvHZmiZr7VNB8L75xAl5ybz1HT8ssEczTyp6iNFAECvdJhtCkCm10a+H7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGoYpjFw2lqGDZmwGS9NBaSNWmIKq92P0noNltCVCrg=;
 b=C+WNQq1tVv4QkeJuDnPKOUPINenVRLfjO+P1FNK6b6c0jt1x3P6LNzYUoNHs2WGUZkFwiuh0pujGzyXYLucIMySqz+I+Zc5kYIvvwPlpyCs3EAs7VuTTbuiC4XqJ8SU9WQ65aAc1fzbzB6r4tLHC16i32IoTVfhnrbmaESZayfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB13413.jpnprd01.prod.outlook.com (2603:1096:405:1dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 02:09:02 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.044; Tue, 14 Apr 2026
 02:09:01 +0000
Message-ID: <87o6jmpa2q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,	Mark Brown <broonie@kernel.org>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>
Subject: Re: [PATCH v3] ASoC: core: use Complete rebind cards by default for all users
In-Reply-To: <c54dc8ed-18b7-4914-835d-a17a0e32bda2@intel.com>
References: <87y0jsibki.wl-kuninori.morimoto.gx@renesas.com>
	<87bjgaxkdb.wl-kuninori.morimoto.gx@renesas.com>
	<a53ac4b3-1774-4e78-b88b-4316ffe73cd1@intel.com>
	<87ikacdcdj.wl-kuninori.morimoto.gx@renesas.com>
	<87jyub396o.wl-kuninori.morimoto.gx@renesas.com>
	<c54dc8ed-18b7-4914-835d-a17a0e32bda2@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Apr 2026 02:09:01 +0000
X-ClientProxiedBy: OS0P286CA0067.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB13413:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e03c407-c5a9-4d19-bff6-08de99cacbec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	In+kPbJLhIZu07Sdg7mCpWgrZEjvRwcwNGywXQ0Iks/m8hUecEnGnvUc+RL8CTptYpxByQ9fAn+27nlKpDHis+Ha2wUilxxqtp3BqvgdIpPO6GbFizxmKOpZhaJ7Bhg5F+Q5rNKhxOLfBpzmtY11dzxVbsg+d79f0mjiZyNDQeB5q8ZupBMlYgBSIyFKhoO8kNxtm1yLZvBsHEIdkjNRUNsr/N61iNcsIAfkUszkOGcKL/utoBLF4YDT1welydyfVIiBXHaUYDTE6Dmx5ucRNiZz9eja/HcDbC0Av1crJYi85HeWtWSSxthinpJUvkMSaU9NH0nKIyCEQs6Veuobj4GJenGwDKsXe13oNRtDJSu9JPSNUWQ5UQ5Rc7voAbUe1npqlHwmTgJANcnAJCpJqJ+eJzF5i6L8zgDHx+5fGPJPpFGzcLCvPJ88xJI3KmgQNl5ccg+TKN5sST3twuwXF/fYP8oCfcl6VPot+Q3B78OFMO0aPIY4qNTVGOJ4TlgPUgeyJNbt7WZMaA6/JXV9QHK8L8DJOWbM8SR5XMPx4tIOt2TuWr8vqWm7tUqIjpIA1jJRm2XW4PTRGaTigBTmfV9/VrM8h3+zclfUjTNoEDvcTKICzrdILKKzN6105qPhScLfxPKB2NjW9eV/4lmKViNcxjx7LnMNexYH3fyUApQHr+vjtUaDf7aP6WlrzatV3wUK/GgKKPBkRWOCMUvG1N0qa4PDlNdbRjGIlolCdugnTzkzC8fVq5mf7rLrjBvFZwTN5J0EkIvQmBZgVPRAaXl1AkxbSY1WYN3rOKVu4Fc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZqLwb9uHorb3W36hAu/6VOhCJcl4IaOCdoS5kZHmC1rrtnMO/e8Zn8wj8f3k?=
 =?us-ascii?Q?RmQQOWt06mvkt9Iw00qMeRszyFJYxif0njtRaphs3EHlMdNNyseLpYf2vCHH?=
 =?us-ascii?Q?6S6eld8edEWWfyNiTdbdShP4sPxfoh6ulI/3WSGq4d1VN08jNaVF7S9Y1Qes?=
 =?us-ascii?Q?DfA30v/t629o+hm8JxE2XmxFtvFt5rNxDK4y8Yoxsxic/twPy3fzc/QnsVcb?=
 =?us-ascii?Q?geEsYAc2CIfmvYCEuwG2SkYKnO1A4d/zUoXk6p/qaAJYjTXz4c99jgYUx4Md?=
 =?us-ascii?Q?OKwRqofWwIAEg0V2dL/A0NTgzjauhAHzjeV1JX0ilTXRvfQIMU9vgfHxvSvE?=
 =?us-ascii?Q?tc3tnl6Z2pVZxUSFdODEgIayPquj4hyJJeY+em+FNLqo5E4XFSJJhU00T2wZ?=
 =?us-ascii?Q?BrhVf7FHMuOFbNx52OaUnVVZYBjmDUF5LQj8V5aSHdRU5SvQgm6ISOmGS/W8?=
 =?us-ascii?Q?dy6rFjHdFYKmwYQeMUk1d6QkhDLSMPs8xFw6wRDoTEYjETd5YRruP+HWZaDX?=
 =?us-ascii?Q?JTTRy90ZJSAD3/LCFoCE9me0jQQyHI7GRIOy5K3xOudLpIA8dhqOcFztilXB?=
 =?us-ascii?Q?96RAdsWW+tpIp2xCnrSgrOVcFvpEHRIupgGAzED6rF+VipPXiVjwa8AtJgW8?=
 =?us-ascii?Q?jSeixR892qjZxQej8LX4XSdPyjYoybd+s8BhLYfjHm9LR2qKHr5+b+RKmnr8?=
 =?us-ascii?Q?oS5+5xvvfVfL6nCsbUgiZjri/69yaEDMCGT1dFQlKl0NJF+lGFkxi1Cp3I2f?=
 =?us-ascii?Q?YmUHz0u6NpcqTOKIkEK/8aAW3S65Y5xctc+gDIAUds3akj4c3A5v0VD1KG/F?=
 =?us-ascii?Q?ZAqtYgFEGiyrYYAgtddNMOWJzKz9XRwvpvBJZ1EIk574cwPeDqBmFmxvlm63?=
 =?us-ascii?Q?evxZo/xTIYOiKPWrvEZiVdPDrXybx41WTD3W+ggCHYerqmwUbr9RL0X3oVK9?=
 =?us-ascii?Q?lBkiuXfqNnNz2YwEpsklw/8EwiHF+cJpHeYJO6RBqPYCNpz7rVSru2TrtFEn?=
 =?us-ascii?Q?Q5OElXoRMY05oFYMOe74TJo9FUh7JbPHo+MmXvbxccKM3q9oAafOEjHvDie0?=
 =?us-ascii?Q?Avmt6vNO32xNP7+Baz6TUxt82y+0BMjbciRhxMPGxi1Ti0JmvDcf1PmK1gOQ?=
 =?us-ascii?Q?QD7dEXOpxcaBtXRngdQk3pZ9vD2xU0jAWN8M5EkTTtyzKP1cYetva4oWDGur?=
 =?us-ascii?Q?16cMauHJqbl2z4DeA8EiJ3L+FZ8CJ5nz/mevTdvFYC8zd61H9TnNc6M+9qhI?=
 =?us-ascii?Q?WjOocGNzvVjBXzRez/5GbT0fzRvxOlzY0PRYxbRp+cQCL++dv2nhwt1cIjPB?=
 =?us-ascii?Q?NXyuNfSSBJL0KBqj1OhzT+M+V5k65kCJciAfw2jZMEYjozoQfEnXS05uLo7o?=
 =?us-ascii?Q?/WjNvflkxkFV60D2VRa12Irog7OmqmndEu9aA5/9GiiCDl/Hg8dZq6PdH7cj?=
 =?us-ascii?Q?cGecvissnFGBG2zVE+hOQQjI5khAsjgqEwybbpl+1dgi/xd3WBAcZyHg5PSN?=
 =?us-ascii?Q?uaZKzkCGQBuOJYBpK/r6wAlBKo6Twuloa57iyMzchFpRzeDCpdedV2IY1mO7?=
 =?us-ascii?Q?Zai2vzJlY7FeYnVbN/8T6DYOHSoI/bYcXObBiuBmd3ihFl2v4L3jtOe7TC4+?=
 =?us-ascii?Q?B+oLrMzlNGrp9PCubpcghf1+fUkLKu+709F0TMt1MBPtxM0TDUawKCLDedPk?=
 =?us-ascii?Q?a1vyWAYKgEiUlpk7FRD3XOoFdigy8YZVtbF+10SGMrbAEq9Mosgyfmfinpug?=
 =?us-ascii?Q?YAdRxrZEibEAx3oIiOknARZR4wk0eRJu8GbhStx8LQH0lm9MF4qq?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e03c407-c5a9-4d19-bff6-08de99cacbec
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 02:09:01.8459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPjk1gHWUS/hroSBzzMEzSSG884nzbxrO1IcwjFWEpkRUQ9DRoI/DrSAn9tvtn/YmSAHufCmgKBIBy3Ia+upH6vGNnlNbUvj62UoKR9UfHH//Nf/4+wJiF8+pksxKp3S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13413


Hi Cezary

Thank you for clarify the situation

> |_snd_soc_card_bind()
> |__snd_soc_probe_component()
> |___snd_soc_component_tplg_load()
> |____soc_tplg_fe_link_create()
(snip)
> So, after applying v3 found here, we end up with devres-stack:
> 1. devres with release=snd_soc_unregister_card
> 2. all the devres from topology
> 
> Teardown sequence, LIFO:
> 1. all the devres from topology
> 2. devres with release=snd_soc_unregister_card
> 
> The unregister call-stack:
> snd_soc_card_register()
> |_snd_soc_card_bind()
> |__snd_soc_unbind_card()
> |___snd_soc_link_exit() AKA rtd->dai_link
> 
> Boom, the dai_link (FE from topology) operated on has already been freed 
> earlier in the teardown sequence. And that's the reason for:

Ah....
For me, this is because topology is doing irregular operation.
(= adding dai_link *after* card binding)
(= used dai_link should exist when card was removed)

So *topology* side needs irregular operation for remove, not *card* side
IMO. Otherwise the balance will be mess.

The reason why snd_soc_link_exit() (X) was called (and hung kernel) is that
rtd->initialized (Y) was set, and/or card->rtd_list was not empty (Z).

	static void soc_cleanup_card_resources()
	{
		...
(Z)		for_each_card_rtds(card, rtd)
(Y)			if (rtd->initialized)
(X)				snd_soc_link_exit(rtd);
		...
	}

This should be solved if topology calls snd_soc_remove_pcm_runtime() (A)
which removes rtd from card (= Z).
# rtd->dai_link will be used after above in cleanup, so remove rtd from
# card is correct approach I think.

Hmm... soc_tplg_fe_link_create() devm-allocked link, and use it by using
*add* function (B)

	static int soc_tplg_fe_link_create(...)
	{
		...
		link = devm_kzalloc(...);
		...
(B)		ret = snd_soc_add_pcm_runtimes(..., link, ...);
		...
	}

If you use *add* function (B), you need to call paired *remove* function
(= (A)) when it gone.

It seems *remove* (A) is called at soc_tplg_remove_link()

	static void soc_tplg_remove_link(...)
	{
		...
		if (!link->ignore)
(A)			snd_soc_remove_pcm_runtime(...);
		...
	}

But is this function called ?
# there is related comment on remove_backend_link()


Thank you for your help !!

Best regards
---
Kuninori Morimoto
