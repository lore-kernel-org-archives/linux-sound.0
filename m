Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27585341057
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773639007; cv=fail; b=HCm985CyZ362TWEaWdZQU2H3kyfou6PhRzWN86G4W0dui0JBzLQqreFztrpUmjIw8BdGdqQGgWdgP6LlJZxVVmEGSCNf/3oK17TVeDjze0eooaK0ZdsH4uim+azVkTOwcDyE2JRMGFZBqLxeAshbIc8Dmj8tAUv4H3Rf+Iu1RAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773639007; c=relaxed/simple;
	bh=BlZyAcij+IWlnSQwR3tOnxasFisr5Tp/TNc/V9wruRM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CJav9KDwF9WclxXmTcYUr4/grJnwPOFvRgmfVXxnWdClhBsYndC45K3IBUejpPYukUX0iUVSTs0ve9B54twhodGPPRLXs8EPX7JRpceISvwMuZRgxn6ESuWVdmTewd0LhNMknO5pEno1HZSB9KMXuiLqbERyxyIxIQ2Tee4jkX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=T1F9xzDw; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="T1F9xzDw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oj/hciLFsJUJL2zP0lk7dxTEaX+Et57P1nGkcnFCWM08URhqI4B2DK0jf6Pf1SlgaaxlPIpyEBR5lClWjFpSZdJw/FvaPLAYLT3HUVGIhxMsa2bcu809Q94HEi+Xsu2OS8gN+EFYThIY7FjhlMSSnTBcjC4WmIlFEWMBI/D+48l0U2X0Aqr7Qb8moCACwqgPxX+Yy3WXRK5wndU2bhvMdj3LtrFHZRVmXXAHF4ZmGMQg8dvdFujGOSu3NrGBdxJmCOHV5jIItvHQoMk55lL3UPCToZGO6aRXdbfEh4e0qu0/Ai8z0egj8QrRAXzzu8zJd52MJKw4FTE3Oda5rCGitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dusz6n9pf+2oiCYNcxCkYWLE9wY4fMQvUAEjBFrRraY=;
 b=mENbrJ4mK39I4zm7FtKdlgOhypb12LpeNJs+9UuoQB5VnuDNi0y6xYSS1mDNgu42sKspJ6zTK3NCotXgTuQWd7d2T/EFyok5LYJg5GsObvmOogGocPjn/bYYEBQvXbluY7y+ziFS8v42eII5rp4ta1rNWfR+RGF1dz4A5Ga9TE+TYoEJO2HLcKd2/d/yTU1TZYR3neqabwEyBNxtWVBmqMsHsSmSy5f4+4t6VWdjlNbSN2a0FEgXjSyXfNfo8NJbUMDwvO8zXlmpqUah4U0+q9wLXUMdg66YKhahBWE3VL99sXgy5hrVj+aWmHTQkaRqCQLfI90UVKmIjj5znEHUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dusz6n9pf+2oiCYNcxCkYWLE9wY4fMQvUAEjBFrRraY=;
 b=T1F9xzDwUaX0TSjQFv+lbfrXD2nkeUf1FTgxqKY5tg03E2X0BNh4MGeGjxAGclINsij/yb53rTRXVZeWhXhn+4vHLyZVNUB9sH8PP6fxTl2U+qHWb6MQblxO6aP9tlHfY41576kjm4pPWflK1cnrO6zAwwZa9asLgCuBD6YKixU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYCPR01MB11093.jpnprd01.prod.outlook.com (2603:1096:400:3bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 05:29:31 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 05:29:53 +0000
Message-ID: <87zf48ibom.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,	Mark Brown <broonie@kernel.org>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amade@asmblr.net>
Subject: Re: [PATCH v2][need test] ASoC: core: cleanup card rebinding
In-Reply-To: <bfc1db52-2549-4216-8834-e3a68f084900@intel.com>
References: <87y0k8p6ds.wl-kuninori.morimoto.gx@renesas.com>
	<3582df07-8d1d-488e-b76b-b8c288d35ea4@intel.com>
	<87qzprywbh.wl-kuninori.morimoto.gx@renesas.com>
	<87ms0cy37u.wl-kuninori.morimoto.gx@renesas.com>
	<bfc1db52-2549-4216-8834-e3a68f084900@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 05:29:53 +0000
X-ClientProxiedBy: OS3PR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:604:dc::16) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYCPR01MB11093:EE_
X-MS-Office365-Filtering-Correlation-Id: 81505009-09f4-49cb-db6c-08de831d0d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	BTwcMMbb7GhGbASmdMvJEDsUOIAIysLB8eNYTjfzRDyW8al7BCkO/wBeRKFBMqysn/PdBb8i0kO7mPvn6b/cCWYihmzyQ/3njizMAx8ldh8wIeKFAbP8T1/DIqWP9nXib6AIo5ASYkd4Xl+DKWLb0uLxGL1zINJHs3+tv5fbhLUM7AhIJm4BdK2z193eoOlIQwDpGgNatBuF6iWo8tBK75mp3InavRbwJcJf5Fk1T80M5HXyM3ns2EhPGix0j8fQj+rLHoL2vunipZqN48s9Xh4D/ajigdbhNW2ryRBiyfyE44PeRWUpnHYjChPVYcNCoeEBJxgLOms79TSFlz86/Jy1Kb8Mj28wLfbAiI3uUdW7M3KJq8gQPG4suFxEM7zlYP9iIIdR608c+C6/R90NJHVo1wHucGdLGwYnGDRw9Q/PStaX/5acrHq6sYlerxHV8rLUUUuBm9GFKbDZSU/Ns+TC3T0EgzZxCy9EtXSYtplLj46djZBs0MbXMEUW8btCf2sui0jw/WMt9NIP58NEMVTatYu/gBZEuDSgDj9LddlF85A+pUYbxH2tkQg+2b+RehJQQlfP9dDBkL04eEUp9DSyoeNkpodggSLuY7PA7g/KbVeu2o+ZbQZxKypvanK0tJMA4jyckH6iL0riXnnLGfrGlTJ8dVEwrdADRc36qXYdieLmwY2lsuK2NWTi+i7zOaSL9hPh2BI+qYA/0TR4QE+DquugGEYg1hzWVv9gBRbxcZQbOmAD8o7/8nvLVeotVg6YDP+p0VXsxUmFSg7bmt7SrX7hietlxkLQ9GF+qdw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jXUUTRwmvBMHBnMMDkBVlCM14UanP2zIUFrfKMpQLmJ2PpfF2yNJC2Yk8mNF?=
 =?us-ascii?Q?9tnfGTbOLwGX58AAQjfbZ1xpsItceenFKKRoyqZNNYi+wTXy/w4a95YOCHvg?=
 =?us-ascii?Q?aQ+LDVFxRVtri4fITRDG2QL3ZXy1nHoaR+whJUbT5+tLNuIuCBRPHyAxN3SR?=
 =?us-ascii?Q?BhiKTLKWHXQMzbD7RuP+ppM67tT6GLf1WFqNejdfApld45zn5mGsGWkcrHx1?=
 =?us-ascii?Q?uOZ3V2Cmkv4qPHLbiyjE3v3TTtsfHglksDlnrpNHxs2fJRirUVWqt91l5Apw?=
 =?us-ascii?Q?5dcGbTwJYow3wPGeM6raAtgj+BFt+sqlH3kJnanS02z65shszT+x/PX+dICX?=
 =?us-ascii?Q?9Nmdj2Acq6AUyNjWE1dS13ryhNLcX66bnydhSZppxN3aGMYE3ZxlHsHJk0lo?=
 =?us-ascii?Q?93w6X0r4wO703Wh5elViPAGgV8oqlHRmvDsjyvii1Ui/zDECHwoVl1wM4Dk7?=
 =?us-ascii?Q?PknY///qYah6Tk1TJm67RpD4fSuAKS6C3rL2S2as6nNTI7lKXsyohuqetIht?=
 =?us-ascii?Q?FnHKFgjbOhUanhKDGqDBvHQRDKWkY+1mxe3edK91hXESm7UT5mR2iASLwWs1?=
 =?us-ascii?Q?ABqXE4zeJl65Fmjkd/oVb3yOucmu3dfzF4aF0py0/vJDKaGp58vRmdgjnqXv?=
 =?us-ascii?Q?UyArnVWb74rYWLfzPfao9Ua3hpzQgnFCUswd+G9PMwOU+2OwoMrhcNEvcpox?=
 =?us-ascii?Q?3TwXJXHJxljga+F/fV1OvAxYjZFPpx1fLSpE/9702lmHrIEShtW0o8XXnutc?=
 =?us-ascii?Q?OPNzLVH5h3oW1Z7qcAiLPisOJS7q7aQqU5qBn9+tPdjLAmgskmOXmS/s9Fpy?=
 =?us-ascii?Q?1cN1Se7oEbAeA09GsJ0P2bHEK0K3WaIWnUeB5G2gt6V04YThKMRPs/RoxPaj?=
 =?us-ascii?Q?t9WwRVRZDB/04AmYFmkkcPYFiEcEzN+xsGytuRdYsspK4k64bjcsC7jBi2/7?=
 =?us-ascii?Q?Syo5MisQpi3ntpIf1BJPoO32ar2xUyeNF19D9CXiOHENFTWifcWYwqC2uOXp?=
 =?us-ascii?Q?sHQTsRRWPTO4dzlX1MruBptGVNjh8V/kUvVWYx4Gaz4RdWzyaxYM8IfKXRWX?=
 =?us-ascii?Q?KMEernlrNAO5XLeKgSOWzVwTM8uKfg9KOzp0P9xjIFgYUBuH6if+EjGoBgfw?=
 =?us-ascii?Q?ImokQyfonFAkCotIkLNuZ+RBZcfu0UnEGRdfNZZZyQyYYWJAjiMabSIrS6zy?=
 =?us-ascii?Q?LMZcQ5KKZ5KdSAjbX9+e8RXUIiw+1VZddksl2Sj9U9WvwtTjhT/ee+4FqjZQ?=
 =?us-ascii?Q?v7H384Dgq0NIbk5LInT8gbOslJXiXuGM4mSQpdICWmJ4UF1mwp4w00hwWubH?=
 =?us-ascii?Q?TFUMFx+XknVxQ/toqf1VE9qeMPzhplw5rb3t9DuUnEDdyq/Wp8a5mLN4JjPJ?=
 =?us-ascii?Q?i/4VU91ovdX5kqqtvRTlFT1OOBGppbEYLt2DHmsxqzfimGx/2z7IzYagd0IW?=
 =?us-ascii?Q?HI6Colc56HbiWU0Ly1NVq+Pnoa8ZfmZdKDjs/XSWfVB700uaLL9jj/lyx0/x?=
 =?us-ascii?Q?nkOP/+ACSzt/ZUmZ7pePiYAIjDam3uSh2PaeKfGc9E0ybUV/eQCruOMGD4ys?=
 =?us-ascii?Q?h7ASwfaZuiMVB/fB27ALdp7zkF4eiNSAHxlgmLGkn/GqXjhxwnqptArARkHa?=
 =?us-ascii?Q?BxKq3PMZsy2Ug5gTsR55ZY8ORVLi75ipAWr0D9uGZ6+r/t45Qdb3Yiin+wEx?=
 =?us-ascii?Q?pkYkKDhzUH/S/hTJdorbq9b6TngungGdeiUlrBU58m90pOAba0KHPwKQZU09?=
 =?us-ascii?Q?pEaas4PdZEx5Z34l6Ji4sCtFnrDUca6TQHMvRdgjIVPTj1ub7kX4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81505009-09f4-49cb-db6c-08de831d0d52
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:29:53.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYG3qJoCCN/blDd41DTH+oElZo579cp9RZBh1L07fOLXpLPbVv7fHXlXRsUw6ZgM5G6KwvMVoA0/nceEqLVUgdIYO6GVGhXAHSd0Y1BD6ZjXcewwcHek7I2A3bpxW+RE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11093


Hi Cezary

Thank you for your feedback

> All functions manipulating the unbind_card_list are responsible for 
> holding ->client_mutex.  The (re)binding procedure is system-wide 
> operation, not card-wide.  Now, the same ->client_mutex ensures many 
> other procedures performing when (re)binding cards are done 
> synchronously.  I don't think there is a need in listing all benefits of 
> keeping ->client_mutex held.
> 
> I'd argue utilizing word "rebind" explicitly makes the things easier to 
> understand.  Current word of choice i.e.: "reuse" is misleading in my 
> opinion.

OK.

> By the way, I did not see any response in regard to my "squelching 
> EPROBE_DEFER" comment. I'd advice against setting 'ret' to '0'.  Let the 
> caller decide.

Ah, yes. Will fix in v3

> Another by the way - perhaps we could start with listing the functions 
> you would like to see AFTER the refactor? e.g.:
> 
> snd_soc_card_bind()
> snd_soc_card_rebind()
> snd_soc_card_unbind()
> (...)

I have created v3. The diff become very small.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
