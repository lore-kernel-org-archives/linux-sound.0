Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA5240682C
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 22:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782946297; cv=fail; b=adJpSjwlIhxeSt2fLPY5Snuk6pRbNxGXihQT65t0rNlbLVOOXQpFrT9Dkz3GfMRZK1C9DfWsygs1rpg3G8IPFuGL3uvyoQEmnkvT+cwghJO/wtni6ue7aYP+s7fZCFSf7VXVdMClm6hpJBWfYqI5/ypp1unVE+ensOJo7Gh76xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782946297; c=relaxed/simple;
	bh=UgAMtj8OXg2m64dkkP9kHqCE2GXphDcrpvTJxAPSTZA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Q0cgVlr2oWT7KrNXmkICpwbLOsQf+PmTmcW1M7SfS8Lq8imQpp1ZlBV1yee9gS7uAgTSkv1gz6O9NhZj+ZBEhJ7N/Hbvg4V0lDNihmwA6r5MBPvUamjDEi7GsqpIAld2wflhr73Ka2ZDSXit4Ao0ghMH6FSAErCsNes3eN/HxIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CmyCvZbH; arc=fail smtp.client-ip=52.101.125.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CmyCvZbH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZA0NB+w0R9EA1RibdBI9sMuJAaGH9BWPAvwcgLKJfNv0A5j1vCnUdUmISBs6v5FUS0eFNHc4mVPqLpynEkOvgnaXaLemN+iKVt6jOLGYeo2NjCNarCzh21wTnBzgLyx+HrKIBhbgT3ikUnelusmdrDO2Oq7WjOuD5CNjxIsGzLpRNccZmZwBJeYXs636sr1Jvz1mhhhqkCala6lteOGzqRmBuZBJAr5AxFE5KrGlu0ZwrQ+KNp+7SoSBeEc/Ckt8FGtiZ/uZTPZAHJqkZa+1L0Ag4V0hKiejhIpFCvuvinvVnI/ynZMnsD3z9GkRX3NG0s73RQLjXiEnFwJSDh8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+6dv8CBz9dewF2XwvE/T54fJvDeLfUYrCyXmY8qN34=;
 b=EY74S8kn8twynwabMLRq18cBqfQtvp53k19QifGUl5dAk8ZOpP2NfCTW6MUd5vrfmGjhbI0e8t9miTgxBxgRzMRg/ZI3SKXMMrm7Vv7jPkFhSTsuQXKOG5+vHVIA6T8gO8wlrVWOv85X/Pk9xKkwBm+v18WMHx8juFmwmQw5eD9K5vvQ6HFUUORsyapTed2anzHyRi8mczla06eNbgm5cMnM1kchPaLjFcSRYzoEZg6svKVwtOLeLxDC2+V/ms2mQe73DVbcDRo1+aER+MoI+93DFFIRrNkPwiylHeDJn0WDZ0IiG13Z7dTjwp/6Tw6ZiSnWHCOL7EYR3Ey4vjSITA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+6dv8CBz9dewF2XwvE/T54fJvDeLfUYrCyXmY8qN34=;
 b=CmyCvZbHzjNdCNp8txsEGsBFl7ZCOPOIviIoiCzyi23meimnxgQKVU1Mc7c8EaKTpfzuoDSPm6m5ef5kwkF0YRprGImmES9xzne2DPW1Feyub5Wmvc8hbMKAw6CrJ8jm06SgmAyrvseXILiTRY576txBkInQ2+b4tiY2PRD4iFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSZPR01MB6582.jpnprd01.prod.outlook.com (2603:1096:604:112::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 22:51:28 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 22:51:25 +0000
Message-ID: <87zf0axr11.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood
	<lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>,
	Mark Brown
	<broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai
	<tiwai@suse.com>
Subject: Re: [PATCH 0/5] ASoC: intel: use component_name for Component name
In-Reply-To: <dfb5efcd-6c9a-462d-85f7-e8fff3ded624@intel.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
	<d5e3fc22-8a17-4672-ba5f-167d8cab2aa8@intel.com>
	<87se66dyqp.wl-kuninori.morimoto.gx@renesas.com>
	<2965d6d5-6cf0-4fba-97a0-7a97861fbbaa@intel.com>
	<87o6grd4ol.wl-kuninori.morimoto.gx@renesas.com>
	<dfb5efcd-6c9a-462d-85f7-e8fff3ded624@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Jul 2026 22:51:25 +0000
X-ClientProxiedBy: TYCP286CA0119.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::18) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSZPR01MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6f3657-36d4-4f09-12b6-08ded7c347d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|52116014|376014|1800799024|11063799006|4143699003|38350700014|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cBEJcyfO3J2IRlLutUsCOxDW023Bck3ZpBPeYEaP2eicutsk3g6HjzRA7HXsGlx9bDTi/HxP0BkFbjq9zchSiE4frPiAFLuxr3SvflQpBEeakMn9PoKdsfmRqeY+wSu0tispAeMbXKmUqLAex9r8/yrI0mQIIUoIG5SqB9yCseSnL7YiP1O4eB44mCfnRVi5mnKBlbahv9ty45TijQuyVf0DZBaODIFM3lKiEIvqx/GT9Z2UF3Ew5ERa5KrhO7iQtFPDLSaGe3h+rIuSihvzha5ysf1BEgEe+EOxXusVCFwEDhCJgD2s3A33fPsketV17Btr/pS9rOhSC/N8OU3RWi04xq0arKTKFvrotuq5/oAiyPLizIHE7aqNpIi4Ozdx4YtfOJxVXYv9cK0P9zRE4gY2ehHB1Prj47B+e05K82R9T8e42vJhrK4OCQftYIZ/gf4X3wN8Jj7HfyyXpcIhvGkaPLwt0ZKNmYPB/jXDLabNym8b1zJrG7PpQzrmn3y6OPSNmD9sonO8+dGzJQRXrMGlX2wJDkeTV20FwOvoMeVwL5ZLbJA9e35jOe7bX5QZelLowvFUx7s5Vz/I6jjU5+02uuC91j5V0FU97xXADuh25qiF1r9u+vLSo5SJMyYcu9lKKODKZH3hSHN5a/oldD6ydsA/EBhjrpQgJF59KPC7BVUWjqcHaUcfT5nkeg9OYp8Sm+o2utsFxeKnOqDtP3MRT8wIIU1Lg8us1aoQ2P0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(52116014)(376014)(1800799024)(11063799006)(4143699003)(38350700014)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ZnXiBE/NjLQcXiHGteDodPUVm8XOBaRn6QNjhKIqTusQwfYVkbkzrnfbkXf?=
 =?us-ascii?Q?GmiucjQDUsZJFsNZuwOw8O7DXk8exkgwdopF1Lc7aXyAjqakZFwE5gXnWo7y?=
 =?us-ascii?Q?lp+anypbE+1Uze+kIa3MAO6RSdPsfb9ysPOQt2ueHIewEwwshbj/2SzDjkBF?=
 =?us-ascii?Q?OB1x4lJw+3ZB863Sr4V3CMva/IQxbk8YISY1Yn8t8ocQ0AqfnsEyvsiPQrbo?=
 =?us-ascii?Q?5Ugmw8p/0WHCGGVziyyvEtmrDEZFmPP/5dLGUCR1LNQKPmZlUiZt9I0QqgEb?=
 =?us-ascii?Q?1TNBI/eDEyUorRpQVS0Dls/CjndbbnII3/eB+gOIFNcMRG/zQKPnASkUQPXn?=
 =?us-ascii?Q?qxpqxQg0bejtHBCsxshwqpSVkpzfkjIsyIWFhLEbaBgN5GOoILqBPp7HqdzW?=
 =?us-ascii?Q?hF5mB34udjS/1T4Y9x3N8XnhTskYhjWSO5oM8gQrVlqzI8F5WaTPCevnrJRO?=
 =?us-ascii?Q?hF8hJ+QWnViG8KOlUMN1+GXi9oKcevdUP18ZIzFyTRUCs0c4dMMen3U2Cq8b?=
 =?us-ascii?Q?aQmRGL2XcvD5FI5JSo8S1iC8n1f7FVkSNonlnJG8KMeaNfxvTwaRjICm7aNb?=
 =?us-ascii?Q?/SIJZIotvSBFfsOBy+G0SnuWr7hd1J8n/RDFVSdEZZ6NSSKw+L6/VSJNcgL9?=
 =?us-ascii?Q?MtrvqX94bBPHv8klxfQN+wuAb7KA1HXt/vFcveonbOSqaAxjsWzQlrzf0qGd?=
 =?us-ascii?Q?OtomXBkHNdvQV8AmQrJ3u+UvLxkgHBqyNwm9arFlRr+EL1bgg0nBIPYczz9P?=
 =?us-ascii?Q?sQJuyG8xRFme8EAj/AqtYfmJA/rFBQuxfG6B07pXH+kH/+hM/5VBf6L+Vzjx?=
 =?us-ascii?Q?E+J+cchPR+iEsud1hdSJAqo4Ei8sZ/5QiF/ZIDaHCc2EZ4lhYWwAmy253GvC?=
 =?us-ascii?Q?2Sp6TD0HMvj0JRMW8lCnZW0Pn/aijaIeIERZPXLw57raIyGGZmHZdDY9H4VW?=
 =?us-ascii?Q?CDitzv7YpHNyVmGyXdNOTrn12xjSWhxt3uZyoccujS80Tarul0bOH/C31l9S?=
 =?us-ascii?Q?XlzVrQwmzr2cE7ujTBswaiZ6N+V7I3/GVAFthUsstzAzMT6z67DStkswJ/zY?=
 =?us-ascii?Q?LjXW0vGTjTuutotSQiAvNa0zrF9kqhgNydFcvlL7uCsA6ryA6LMy7JewbBnh?=
 =?us-ascii?Q?JGJA/4J16JTTYqx+VjlDyX1e7BuEWBI4roZTaoEUcVAoYH+Qitx1JFVFzqwU?=
 =?us-ascii?Q?9NiUe1WPocSH6+ysTlPoTioY2siAJfO+dWooczBzFBpvu5JpGhu+VRVyd9S3?=
 =?us-ascii?Q?XC2wM7uF4PNpSba7uNzBy9dD/0r/h+B5/8sW45+tSMdK7vShnMaU8FwMWuop?=
 =?us-ascii?Q?sRNRFYFwO66vSEuS4izRxSdBeWusPqJUw4vu7B24opVr+WcOFDF6aSB76KBW?=
 =?us-ascii?Q?PprWVAHSPhLzT8eHQXxgZJKb2w9eBTRxKH8561sf708PJ5QR5MqV8jH3P3bM?=
 =?us-ascii?Q?s4ys883h+deILacl55bUlQDxzMurX7DCKLG3Fhgyrzfhg9CJzBznUfOVBIDB?=
 =?us-ascii?Q?TktzXkqVy/GSstKw/RpNoNlPExrTeTF6hrqVd4mCcbC5oNV2/yniWRUTBPTk?=
 =?us-ascii?Q?5+etClUtGm8+MPSQ8EYydjC6MQUROFOSJScLfdrthMuRQTPsrOISW9t4XQPO?=
 =?us-ascii?Q?NQHJUf60Z4dRSNLauFVA6fOTw7sNxfloaMecosikPZgk/ivGjuZVN9FLG+lz?=
 =?us-ascii?Q?F62vuEhVAy4+2lbTgwjxMwBLqHO9NhUxns9xdfzLE9z35ae/Nc7R3H1NUEsF?=
 =?us-ascii?Q?1UcDcSEOxs5rIUbqwVYdpQikI7jBmBrrxPy3LmFdBFPiaQXpnQVL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6f3657-36d4-4f09-12b6-08ded7c347d1
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 22:51:25.8254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqqqYUAWxixHFxRwaou2bjuqOU+g6az0OJH+FVNLOL3/pcz5JM8IT1ciKze6BWLOziKDEUZYsgX5pYmTFBQxFiu1UM+vVypuTwgLEQjA6ePk9khiWlHMHWqjrIJlwsuo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6582


Hi Cezary

Thank you for your review

> > 	component->aaa = aaa;
> > 	component->bbb = bbb;
> > 	component->ccc = ccc;
> 
> I see your point but that's very close to over-defensive programming. 
> If a developer wants to break their driver/configuration, we can't stop 
> them anyway, no matter how tight the API is.
> 
> Why over-defend?

The goal is not to increase inconvenience, but to prevent unintended
actions. I think it is called as "capsuling", not "over-defend"

> Meaning with this you break a) flexibility b) alignment with dd API.
> 
> The flexibility is needed only for the name, _currently_.
> It's not _only_ the soc-component which has such style, device-driver 
> does too.

I can agree that flexibility is important.
But current flexibility is used only for adding component->name,
and it makes difficult to read code. I don't think this is "flexibility".

This patch trying is not removing flexibility, but removing waste.
There are no drivers lose flexibility by this patch, for now I think.

I don't 100% understand what you are worry about.
Could you please tell me more specifically, what kind of "flexibility"
is lost by this patch ? And what it makes impossible to ever get back ?

> >> 	snd_soc_component_name(comp)
> >> 	snd_soc_component_set_name(comp, str)
> > 
> > ?
> > You can set name via component_driver->name;
> Asking about the getter part too.  How, after privatizing component 
> _and_ component->name, one accesses the component's name?  Let's say 
> from snd_soc_dai_hw_params() context.

To get name,
before capsuling, you can use component->name directly,
after  capsuling, you can use snd_soc_component_name() I will add later.

To add name, you can use component_driver->name when probe().


Thank you for your help !!

Best regards
---
Kuninori Morimoto
