Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1444540D585
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 00:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782692882; cv=fail; b=cIYkcPncmBHhISSVtCq508D3a5/XagUgta7tA268glXGWhp5bnqa5FTDNmkpwwt/XwOnwf+PiRV/hlZ1w0Kdje22XrjvzDM/uGqgWoinkkxcUdE8NSefJK8o4Ji7IEiiqVkR+RMYcVbXmD7GQ1Gz9qGP6k6iLiEiNhWTRQt/29o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782692882; c=relaxed/simple;
	bh=Eay8DRjxgIvxcnuORir7x6f93sQuvhGNkqDGaJxPlxU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GecnG0p/izzAAfxajwvlXKEzdimVyy3jJmHgqrWqGEYEXeMhvYzrTbzNV0vFX8cdPqUbFDYc8MThzVqYHSI0lScApnQhoenlifTuHAZ7t4PjuOFCh6JCfOz2WFo2Bkaqway+6nbzzCzN0MUL5YI36ZhFcigp9r6JpbMS2sUOZpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TZ3T+615; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TZ3T+615"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVos6CWr+dxheghiRhIvDMLnzSkppAZD4eIgK4ejB1g+3r+kzbHCLZK1gXoOehh/ZLp5kChY9cmvDQuj8Hb6Vrh9rPwjvI2fOaGf3ufsUzO6XkLKVUuwHeL9fVyXEUuoOIWv+d0HEAym3fizkeY+jnGlq517XqV6Ded6KryNsOr8by7Ua/J46vS/+bnB8Kyld6w1w1ke6FnWXmDafMbcmV9AH2OIc+YbOPBc6P2PpeEOgJKyZwMuSc0Jf+7MbV4srZ66bDIXOkqnZQuo5/qORm3tlNyRM6koMFLU0I8WkW4zgcDloC+YvKrZk4/QqTQK08iIxoZil7C2Hy1pKaedxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQPYP3IFqFPiw2/NPYm0C5FNg7sTzRJv1US9za7fueM=;
 b=oDd82FoNOgtOSb7ZldoFX64jXcg1ihjYr1cq6nP8PtrEMHhOdL55RnzNEo+ZFHxWLlppeYDc4lBanh5ZouO1CeyFdlX55O0Sfq7ooVea1HwjIBpAjs+eReR4E0nTcqS+jQxWpYvLknpFa+2DtSs0cINfQstAMgS+rMV2IRlt+MM6wiJFztN4FDd7ngk0fXDkh8KBymu9UhVqN1fYKKZjkgz7DoXL9GD44CZ8XVr8+xzYFn1fRzMxbTAc8iVspZmcDszetEn4tGlUq4yZGm0b79UbMUed5o5YQ7jGDtn0W+UK1JrgqMl4/1ndkk9MOA5nK5A9ePd8ZhoOQhgRfPCmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQPYP3IFqFPiw2/NPYm0C5FNg7sTzRJv1US9za7fueM=;
 b=TZ3T+615CMU/KtipdBU4HoIocgp3RmQpcnRy0LQDAWQZ7tHiUuvZRC8efC0AWLYfpzw5eskAwiZxT/JzvujBbmMCmDSRsM9jd/aie030yO77Qbc3qOJRfjAVqYki5yfZ8MwTtWjg5eM5gbHJCVqCwKfgsOEHUSt4/ZASFpVqvno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB13906.jpnprd01.prod.outlook.com (2603:1096:405:1fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 00:27:58 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 00:27:58 +0000
Message-ID: <87ldbydwco.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 1/2] ASoC: sof: nocodec: tidyup sof_nocodec_bes_setup()
In-Reply-To: <580ced97-a4df-4466-a4b6-aca0da2a9ebb@sirena.org.uk>
References: <87pl1deu34.wl-kuninori.morimoto.gx@renesas.com>
	<87o6gxeu2m.wl-kuninori.morimoto.gx@renesas.com>
	<580ced97-a4df-4466-a4b6-aca0da2a9ebb@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 Jun 2026 00:27:52 +0000
X-ClientProxiedBy: DU2PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB13906:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1f4edc-e200-45a9-4943-08ded575450a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|23010399003|18002099003|22082099003|38350700014|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	HUowZgIUNjFewutr1JJRFDf9N01oq/KhbK6LkVLVmO8SxofZ7n1KR+JQFtuA+uuhWDQw3yIf/bcY0a8whvUbsCIwr5JgfLtXnANi0o7S6iRii2MjgbWqATrvo8C4HZYSXOqpiTqDbWSqN/o3hSiip8qDVxsRL8VTrZYqt58+Sqn2r1dg1Z2nwJC7kvjvLk1wTMnpNtIp/faWaolJmm0D/BTDekfKCp9XTba9KEsrKT44l3djRwCC3JEupiD3YeZdKWJ5J/Wsj/7w2Tytkt37XjbSrptxwtlO9ukT52Jqv/dHtVql/g4SBK+7nyT7JO23qqOuKcBXHcQJWyIFgHlwD38U55D27h+Gz1RvqOKjc8qKagVXzqVCaclbP9GjaMWpQXKGS3KFhQn2IV/Uz/ZNc1899JukA3n24OGrcOLat9IyWsRcLIrXhY901BAIJK9bYj0lxxXraC02kIuXYMfVvriqti3wQ3Keg4gB552gQlzOJPsoALpxsr57kwb/gxhhepjElnJsY3si/2SwkksPXsT6qFEW8GnwZK3PB6pV9m0mqDnxwbBpeDPJdxcvBxjKSKXJTd+n8PE+eEqLOroqpdP/oIsPlllK4vEvU+xlvDGq4h64xMtidzfGrSqf+K1T/8hpKE4WC2Uf388atPdnnSfD8Tl08v958DreyQTf0ooW+8uYuXmb38DVfe4pD5cS7a8eIKy2l/dBwyvM0ltMYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sZ9uc+Ng/OgBUKVXiGzrRMCFDzpeNhtZ0FRICn11CrLi6cWUx+lvRdVn+MTT?=
 =?us-ascii?Q?Wtr/YLg3fsosF+2Jnb4VRiD9GsT9SheP6RIq+nkskbc67HDvHWsSEBR6Q3Ri?=
 =?us-ascii?Q?gxY476jwq+gQOiVKjMIOloGbf4dAz52/PsaOBl0pvhCIC+yl3CcngAuTZp+d?=
 =?us-ascii?Q?0uII6NJFJenR0DnvcRJNU2cC7VzOLfgrPKG6Ji6Z/EjlCuR3C15QgS5IYLfS?=
 =?us-ascii?Q?ptr2UY4lxRzqdXjFWbfPKERJUzjrwTb8AsAVrxMEt1lTrdXFG5uJnnL0bOIW?=
 =?us-ascii?Q?mwlOYzA9aUwFnbvbqhx/fvV8Jp9dfWIjoTwwMGtMh3vKKOCqC+Mufc9UO/84?=
 =?us-ascii?Q?OdW7IzyG8P4t5tpZM99OOlKbElJvXs91g6gYZolRsrMqn9z9A/VpJzOTdUtQ?=
 =?us-ascii?Q?v1rTPyCk+tYqewCPNJv5+D7HcZHKllg6hSb2+4TT5cUkL78YGuEafYbJNUwr?=
 =?us-ascii?Q?LwG7z+mqI5S+kyOGKSafTK55N7LDYyBGTErYGEHeaZssP0NilF0Vgv24ZtKS?=
 =?us-ascii?Q?vsDQ2U3c1ZexBx9u3NkOUY3SNmUZiNAlWuMaakpBJ5bLYezN7JhSmui9sn69?=
 =?us-ascii?Q?0C2yUHQXhXRKquE36P8zn61I4CuxT3nBTcllwxg0GsWXeR6a+//CP4V25jEI?=
 =?us-ascii?Q?t0h4P1kGpauPuCRuDGHTrA+kZzbG/ay7aloFYoi5nE9xnLPN5w1DdoOEqb+b?=
 =?us-ascii?Q?FfnQuG4kYk+HL/x7jQdajYQ52u0QZjaeAHThwLXG54oOV6uKGXz7R9+iU3vh?=
 =?us-ascii?Q?iPh/nHbgw2la3NnTmMGHi8NpC6xHxS2rEfEx55yAIPNgnqqzyhxWOPwLStDU?=
 =?us-ascii?Q?vgNcXnDRShyz4Krsr0DZ/eO4Mi7hZm2mCRK9fiLrosOCECHNG5K3+dM3Jxjt?=
 =?us-ascii?Q?4XpGVoOw+I4np1dI+GSMepi/RlFNPEH0DwKctjmOUrjcUP2OmP7EFlU+pl8n?=
 =?us-ascii?Q?LTm9f9/JtkfNcnL6dFU0FaCFDZ0doF/y37PEWkS7bf5YNRtgFIoGeLbSXG5R?=
 =?us-ascii?Q?L44m3Dx2bUsYMQ6HNnHvG8AVZW5Waxn5q5HPz/j4aApwBI2FPmwH3UkXBRuq?=
 =?us-ascii?Q?FgDDE3awgXlPBGV4SpQ1zzJjQnY5y744nPLI+Wg38J7bVAFKYGaKUbn9bqcG?=
 =?us-ascii?Q?Eis71Aa4AL2KpB7QTmUypetLrvRR5tl4klzqTwr0oHeWHpezo9VHwqiN32S6?=
 =?us-ascii?Q?FJ+iw70nThC0JERqo7vhUZDf+04JdVUKoThux+EXlTgWIb/LBGOVP+4E4wCG?=
 =?us-ascii?Q?CJU9584Prpq28IbnAo4L79M+eSDIcJSx8px+ZTAKzhdUFCIlvk5w8fjtPl8c?=
 =?us-ascii?Q?bhJE1+Tkl44Ra6fhb2b7nA13I42svpBB5VrlNLsLAI/0FHH20eSeOlR1Jr0y?=
 =?us-ascii?Q?Weq3DhEsFT4o2EFynw/SMHdUXlvBr9JYkjy3MqwxXY17vCnK1Bh7ZenUbvke?=
 =?us-ascii?Q?MiQt9a8hd88iRDxw5hGnGF9BGIWHIsRo+s4UxovTFj/dOaQaCOsBVYCbjpUN?=
 =?us-ascii?Q?qTRq03QFWSoxszGEW9jkEsV4oS3/MXtLKhprKresE4Fq0vwcIwjbA0UzbCvT?=
 =?us-ascii?Q?aQ2XNqHn250jBuhscOTOS0GKBQrBIzWiGzRC8iTZ24tugsFaEOzjq9cslF06?=
 =?us-ascii?Q?bhJzPZ9fgMHaj6bud5l0vvWFYKpjSUOVg/Ffu6jJcm0lTiliHz4/JfwYDUL9?=
 =?us-ascii?Q?1ZbtLPmLeSHJL+zEsHvJnuUtE4lTMTMBR4B+7P+hpqLlfzJ6DQGhJmgB8zbP?=
 =?us-ascii?Q?380uaoH/1UfJwefna1a1AdANbzmeKzuVih9iVLNxUCngsw+nOFxA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1f4edc-e200-45a9-4943-08ded575450a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 00:27:58.1211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiEBEjSQ7hmsgoXoOkj4f+hJOn50oZVvwgvdn8kUgEntfBgIIPlYWpQL8NXCHVs3xApOF1o8ELB0pyUvKe6CvzhGG7Y/9DxZurGUu1dviNr8sjgiz3xhE7cmmPDLEhes
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13906


Hi Mark

> >  static int sof_nocodec_bes_setup(struct device *dev,
> >  				 struct snd_soc_dai_driver *drv,
> >  				 struct snd_soc_dai_link *links,
> > -				 int link_num, struct snd_soc_card *card)
> > +				 int link_num)
> >  {
> > +	struct snd_soc_card *card = &sof_nocodec_card;
> >  	struct snd_soc_dai_link_component *dlc;
> >  	int i;
> >  
> 
> The function still checks the card is non-NULL which is now redundant.

Yes, indeed.
Thank you for your review, will fix in v2.

Best regards
---
Kuninori Morimoto
