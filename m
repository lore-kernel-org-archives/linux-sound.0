Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053FC23FC41
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 05:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782970912; cv=fail; b=IWMf7BVPREUQlpvyA1C+4RapFNZ2Hfjkmu2wmbmqQOqK8lKC78En5BuiDIXaPyAGROW28xDgWG/vlQa97uV1izT+KnOjgtWbYvTTQYKYXSwD+qlc4r6KhgJkMki2mNew3fvE6L2QEy0ymQIEQwnF42RmizVKUZdqluLRvQYfjY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782970912; c=relaxed/simple;
	bh=NaHM3fTTrzWSPLjIaBZNHSJiiGKBe4RhzTAzOJ5Rh7M=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aS6jI+wa4kXfPeY4bMaKPdE/x7ZH+6Lmk+SdGkReRof23EeLN1EIKuodg+TUmejuM9vwKCKR/QJvXiVqaeS+sg7GZ3asblxv7tI/OTW5OaCOC/nzytrMylnn3g+a6n1yl/S4uvQOGQiScXygKH2bJL9kiCX6Esg5tmHxLYCHJmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=puJa3FzN; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="puJa3FzN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6rJfdJ1B7434Lx6Yv//ruQSdllAB1E5MoSoKtyCvS47z39wwgj87C7gaL5HgBWbxXf2GW+DcJgdWXdqhIhaMO6jL3Ww6JjUqgTXv6rTipYyHkekAMxcBMD9asZ86fDs+bKlgl1iAn7atriKVVnt6FtqyyVXbOY4eXIQLy9WftNKN2JRloxZKdcI9xZT5oerfz6NSOjAldNjM7mttbRQWRlEO2ck+IvIAZG5+yzOadZzoUIFzpxBPCdMBBxhPqIUWx5zLcLtsk5FCkYzw4s2Vi1gkVELxE6ue4//drA2jN58RXH+rSmxFKtIdm7v0iKzQTREh44RHQETkMZC2WbiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajL5ugIkIiXsxGKEOF0J0w3GjMDHCcFawBK67oaidnU=;
 b=bk358/4IG9wEFtHVjwUmakChOnS84ZDG0qxLcwD2uOEhTu6a3295/cVwYHnTtDPFB69Os3gqzDecWgv77jmBtXVi8aj2/B/BQvBMef6CUoc4nLNjPwAQcAMc9fcI/pDN+UqPFYFZP0jjXmTIeDDjLb8AlDHkNOb1akrCM+ycvoSOVHa2EPRd8y254E9/osfVQSYJ9XWCUFXp7CZrVkDUBxQcxU5WUJ2cFyfUTwCqvJLfz8SETYQUJVPQHHGSxc4Z9O0uHBMeUWwgeUeiIporkiqgWwHO8TXDEs8/GWxLjSBSJBe54iYB/WHJfYNREtkohm/WThWnvQr3ZjvfZpadYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajL5ugIkIiXsxGKEOF0J0w3GjMDHCcFawBK67oaidnU=;
 b=puJa3FzN3uszhp6ooJL3KvLA+/NN6adjTmS0uteABx1XWK9Dr/nQbKTZBvHy4SE/6aDmlzEXVJthXNkdUcWK4yXbaB5zOnOOQ+Qi6PQHzVppaarDo3R9T6MZhilaJk4Cf+hYsBR2au3T+xsJkRvfegK+o66tw0o6pyaPnwx2u2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TY4PR01MB15833.jpnprd01.prod.outlook.com (2603:1096:405:2ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 05:41:44 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 05:41:44 +0000
Message-ID: <87wlvevtgo.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87zf0axr11.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
	<d5e3fc22-8a17-4672-ba5f-167d8cab2aa8@intel.com>
	<87se66dyqp.wl-kuninori.morimoto.gx@renesas.com>
	<2965d6d5-6cf0-4fba-97a0-7a97861fbbaa@intel.com>
	<87o6grd4ol.wl-kuninori.morimoto.gx@renesas.com>
	<dfb5efcd-6c9a-462d-85f7-e8fff3ded624@intel.com>
	<87zf0axr11.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 05:41:44 +0000
X-ClientProxiedBy: TY4P286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::6) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TY4PR01MB15833:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef240a4-6d8a-4f47-84eb-08ded7fc99ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|23010399003|56012099006|18002099003|4143699003|11063799006|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	IA/BYU6vvDd5JgcfH2G19Kgaj87Bqo8sECEBLdAiqrLGd8Yf/N5ubW7ktqXQBHnbSnBZ8y2bpAdzva6wNv+o0qtfziz+rmWU5TxlVIXbNwqyc9sPnjza/AT63GBQ4VDkNmhmFMQgy0kZAAsFpadm5aPsVqZAtlWtWhjFgo2HUr0R690caFUBiFB76M37jFgIPJmM7PmZRGVtY53H/f4ki3UBk2Gz7FsGOsN/j1NYvpYWBQ2ZYKGGDU3jdjueFsqzFQ42+XpAnfZQsO7DpuBt7tyw1ifZ3ALcyvsCC/NlT7/iagDUzY8Cye60RVcjskHdx3J+Lojt/YbsOCGdP5hahLyy6E11/EgKNaa8IBFTIciafVvqm4WT4/wR6I5+VySUW/QoeY0MnaBAWfRu8hx1gcv79De+VpJ0uPIZhbXuM0mNX8FscMKckU0HtwePhocoBvbixnwzbwzaI9jGRrDbNiSIrTmNjE7vurj1n/99W015q2Ra3KezXN9V9zg54QAXSmFPwouLhztepVHIKM8JYS3tyUWN4iEKsTy63XJ2tCR5SvBEEOP1AGwVEl0vIAETT5NrQF4aeN3BgWBFWeUdCPOCbh36WFQJ7wjMuA/hYnAv4dtakUA9YoJsUan3x3iMeRIgwMm8t1+HcjTL7qH/Fzz7mdEYtAdUuyBUdRZtbpWPvK3jfnvYfVoVNLzluzu2cP4hdOtp02/ZlOME/eC6TsaCb7bauMlZF2uFU+ctdC0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(23010399003)(56012099006)(18002099003)(4143699003)(11063799006)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fBLInJJiZ9/heKmHsFueM9aK7YvfdnonxtwlmT+l3cn6kgzcm8ahaQYby0/g?=
 =?us-ascii?Q?6eoQmyqrOnDiSMt7iYDfcwV8SG0ngaPD+pdriZXDfcQ5FQseT/0aOLgKIWN5?=
 =?us-ascii?Q?oV3VSp8kSBzpevgZMQx4hvwVHhMqiAfX1zKBxaeD2G6Dg67QdfxkRWrrY0n0?=
 =?us-ascii?Q?8c4J0D0dte4xtXrnymUJgSTLxm8xzP3JzemAaQUPtZLBQ0XITBMWVhpvh0fz?=
 =?us-ascii?Q?EO7XyUN3FFXm8IzdY1Kc8btOMLqw7IFHDDeaJFMYFHQFNNzOyJL7IHAgyWZK?=
 =?us-ascii?Q?+Yki4ZURPphwuxSTTedCRoDOZr2TGegcuf9KoAc3su/jNq2sFqC4A1yw6jHT?=
 =?us-ascii?Q?R3TRQrE+hFFjET7WaPAKJNkGqtW0WlgYpQpjmsE2yXWny3cHl3Y8Ub9vjGuv?=
 =?us-ascii?Q?2Wuux2OosmxdlmTJ2+CcVoMNzmiwdmRDqopYVYLqGpj36u1lA667nA2rMeB2?=
 =?us-ascii?Q?FhLNX55XMsEz2sp50xR3lAtDZJEgrY619sH9sSTmTrao38fzKhIgKxtSkjyi?=
 =?us-ascii?Q?WkKd6spIHymW5gibEYZq4HdBLv8l7ICcTQIHFb09MoHFFp4ZM1mHh34jiCAC?=
 =?us-ascii?Q?+hbmDbB/CchilJB7IR0ompGhrIwmjLAvDYErW03BjOgA3C7DRb2WQYf+gsdp?=
 =?us-ascii?Q?gTyS2RDK6Yctppi9NRMzYXpPJnfTNouriYEkxIVPR7FSTBsvfo17ziBoSUan?=
 =?us-ascii?Q?Q4ebaecVGdajvzy6p/FI9UvY4fLYP2bgbGkDh6ABuvdbsA3d/ZaJXh2Uaxfo?=
 =?us-ascii?Q?N72HRNzzoLqN7Jx+LUJ2AMBtpX2ppIEf6MEhC3ol8bOWkaO2nnnwepAbfcLR?=
 =?us-ascii?Q?PxTwSD1o2omqqC+0v2EEtrh0lksiI09gr5OfUelDwvele+ekna2tSlICZq0G?=
 =?us-ascii?Q?CFoBvgtN2NtA5O/W2UxNbz74ep+Adoqc58JmdEAJrJN/NN0KkztXPw5fdFE8?=
 =?us-ascii?Q?rDz93zPh+WdYxdspRKqZjqKZzxPehZnD1qaWPVhpc/+aV41tOkCxfVv+nlNA?=
 =?us-ascii?Q?9fTIuP+l8tCMxo0IYn9dFZ+9yo7iqIBlfk4z5iV2RSK2ERBvXdWsqCgCBskQ?=
 =?us-ascii?Q?YMf3a+arBXHmof3jwnTXWOiwkgqSSKGsDj7/7jYdT0fmeUs01hzzEQVN0Bz4?=
 =?us-ascii?Q?xXTKPa1SKM7kHxLlDmEKUUs4qd+4A6/vYgIbX9kYKCRDbQItn4EKKKT+SB6v?=
 =?us-ascii?Q?cKKGGsySOY7I1Hf36F4JEJDSl0LF5kH1LllFn3z2kq9DObah02x7nVlRdRSi?=
 =?us-ascii?Q?qNba1u85xO9xbw/TxcSX+0I6ooYO3PRgRpGoOgYESUQNsKEu5ylBMwXWSqRe?=
 =?us-ascii?Q?ThtMipEmTH8aKYcPyIFUvFy1DJNm/sUmj8hkz/LigReN9IPihzm7l9bWyqDU?=
 =?us-ascii?Q?eSf0vxCvNHF1g1c3ZyQ01t7a2974ETAISlrzJvdw7EoYmPQmOdVXYQmRjPTH?=
 =?us-ascii?Q?aMFaISMQFPa1Q9mqSUYvC0m6JmjXLiSL7V3TaEotxAccxay6CTXOrfzCOCoa?=
 =?us-ascii?Q?GITH10VEeoBKL18wwYXn258pfANyAuoRLHham27f6S77bfskjXRELMgt5Lty?=
 =?us-ascii?Q?28ITuDRcXU05W/WikqjA0ez/RJQtKzjf/HDYrXvSGGdN7MKUANO0N3jwkili?=
 =?us-ascii?Q?Nc5QlYd5xsB016BxWEUvNyglKXEpHIxvtn84Kb5ro2WaSLjnfKflxJfWDO1K?=
 =?us-ascii?Q?J5L4CuBp4vC27g4Il2SPbeTupTqyNw6yw/uYCL2+Lw1X3UsidQgH+u17f93L?=
 =?us-ascii?Q?wlrYDLOL2UJmIDb1rP7VXoxB9grJwksGH89qfucqyn2nuPbFXNJw?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef240a4-6d8a-4f47-84eb-08ded7fc99ae
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 05:41:44.4891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3oBl1B7ULdbqTf6NAUv0BbIxEWnZszwooCIV9olfsOAmiVsRJEGYmTEblZWCaya1xRU8G0XnQQV1sUIL6oRYSnkAaJ0yD7Wq7GgOZ+mPghPetA7hp03/vBxw0AetDzk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15833


Hi Cezary, again

> I can agree that flexibility is important.
> But current flexibility is used only for adding component->name,
> and it makes difficult to read code. I don't think this is "flexibility".
> 
> This patch trying is not removing flexibility, but removing waste.
> There are no drivers lose flexibility by this patch, for now I think.
> 
> I don't 100% understand what you are worry about.
> Could you please tell me more specifically, what kind of "flexibility"
> is lost by this patch ? And what it makes impossible to ever get back ?

I reconsidered about your opinion (= flexibility), and is your concern that
we might have new component->xxx in the future which is Component specific
(= not Component driver specific) ?

If so, can you agree to add many _set() function, like below ?

	component = snd_soc_component_alloc(...);

	snd_soc_component_set_aaa(component, xxx);
	snd_soc_component_set_bbb(component, xxx);
	snd_soc_component_set_ccc(component, xxx);

	snd_soc_component_initialize(component, ...);	(A)
	snd_soc_component_add(component, ...);		(B)

Here I think we can merge (A) and (B) into one ?
I would like to have like this

	component = snd_soc_component_alloc(...);

	snd_soc_component_set_aaa(component, xxx);
	snd_soc_component_set_bbb(component, xxx);
	snd_soc_component_set_ccc(component, xxx);

	snd_soc_register_component(component, ...); // = (A) + (B)

And more, I want to use _Generic() for register()

	snd_soc_register_component(dev, ...);		// exist
	snd_soc_register_component(component, ...);	// new

Thank you for your help !!

Best regards
---
Kuninori Morimoto
