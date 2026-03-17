Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD72367F28;
	Tue, 17 Mar 2026 23:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773789215; cv=fail; b=Ghrpc0OS8OhPxrnR7NE1+UYhu77e8DuhIDVxwsD2l9QqxayBUngbFWEkjOL8R8p8a1asXUowFdFNNrLA5VMIUwUxNmFbC+4tkBi2pD5DAJluY0y9yr/QCol45/B6qR2tnUPGJKLvd5GG4TiDUOZAxqHUBTzd36J3CG2auQYVssc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773789215; c=relaxed/simple;
	bh=uvXNJZDxPQWAmJfkqHa46f/quiUHGovCIfUE+z0scYw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bB6+2OB+2cUCra7e1/jh5+qcPD2MKNGDcu5xlRbWjNTgSXtcTrz5/SVTFy5nYrQdKEmV+mpT/sM4pNtguW7Fisdge+8SxvuBo67cckh0L2dWSmWz5nHqp3ViYjWr4RlcmD8foGMX7VlG3JZwlWEg+ss0srAYFFQz9cyG0+mxRhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Scd7bCq7; arc=fail smtp.client-ip=52.101.229.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Scd7bCq7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jf7ajVqaaydLtnBupU4GStyxyNioHzLZWvCPEQfzc4uuYEzkEu99HjcLq0ixjFr+atfSK9d/4stjHsqJq7ak3MUWobcY01lXoV52l0vVPej9PtRkSQdayONO43C1jNbya1qnZdNHR31elFQGyFDOQswnBVHQ8Von+fx+X4T0XaTAZs98wbnO+sCncgE10PQOfcitnyghI0WDryvoaVmllUS/piFCUisE8/SSufB+afUDV7KOY+QcjtS/lo5osXIzZ+8FwXBtHVi1vPNJ1Qnb/ZsLRFTw6YEjlCaQog2nKDNYa0h19Cdax5Ady1SmL5CS7UOV59WgBV+KEkGIj8sj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+pQkx7kN3uhEPc8pdTvbCn2wkyYbqOxn4qtgjy0t7s=;
 b=isJhq9WLvZlhVrU/veGqci+VAHVCd1PK89TBYxR0O/M1S8mXgbUdYss9XzIWWM3NffMOJdyNLaVufr+WWVdGQEbyZa2CtuvQLdZ3DfR68zqi5I7q6w84e45rUGDBD12oq7BQCfkhxLSw5V+gsmkHIW+LIlGjy9BfvMdQtW50sxJLmUO2XHJtJuQDwogyb3W13zA56WqfXRNsXdIgYM4AJRdvbxdq+HS+aqrMokug2kbTJRvO6wnZ8D0rvcMqrjxwxRnOUVUcfrD2srZU6XUPSEVNLw+oc4xYl+DK3SBCqoQqmAhInUKJ6GAlsDwJvKaEAzuNYLkVsnenLCRHp52COw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+pQkx7kN3uhEPc8pdTvbCn2wkyYbqOxn4qtgjy0t7s=;
 b=Scd7bCq7wExR8doSU5zt/np9fmYnqQGDiTuYHvZUVyzdOYFvNT0qt4hea9rM9t0VqVh986cZbK9KB4E6hY6j3YBw/x2Zwuc9JQuEpRqPaYkRZD/wjxYm4Cmq6kpgU0nAPpLYkOBmkib4zEX1auiX62eVyqNW14XwcRDcr3aXjII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB10859.jpnprd01.prod.outlook.com (2603:1096:400:26f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 23:13:30 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 23:13:12 +0000
Message-ID: <87bjgmhwx2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexander.stein@ew.tq-group.com
Subject: Re: [PATCH v2 2/2] ASoC: fsl: imx-card: initialize playback_only and capture_only
In-Reply-To: <af97f536-be17-4173-83d4-3f3f052514ee@sirena.org.uk>
References: <20260317033952.462209-1-shengjiu.wang@nxp.com>
	<20260317033952.462209-3-shengjiu.wang@nxp.com>
	<af97f536-be17-4173-83d4-3f3f052514ee@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Mar 2026 23:13:11 +0000
X-ClientProxiedBy: OS0PR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:604:24::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB10859:EE_
X-MS-Office365-Filtering-Correlation-Id: 22322854-60c7-44a1-bd3f-08de847ac2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FEOPtAjGjfkHBE80N5hEMzsgu3+NB8Kaq5lAQ+UzjXVm5tLfNp9xckCSkhcUC+YcFa09s7zPZU+guoCh4aH/RCSlkha5Xd9mm2pXOh8IphD7kovaofmYa5Ck/skiWqqeJpEGr3yuxtRrlwBPQRwtlQ/bqUKh4TOgHutbEIkIDfxTPgLtSgfkQP1OqMsOQWPDch0goAL0jcwumKs/1MlqGeoxs/q/WPh4brYliayAXHvE+SOZurNwoDvokl8v2KQfGC0fa2dir2TCdVxU2EG8pK8IX4LeiYaS2z1uHXRIgxo8IJ8fwhS4ETX5CYPjTsQ5CGzWugTVQKdYCWYjp9FhX3h+WWdfYcXYNuJIjDE/UfdpliN9SllIpwCQJSrPNimKzVqdDj6ZyU0F4ByLMZcx7tIjamn6OOeHPtITAlfvi382Wmq3z96ltlE8+/sJOrn6LcU/jWsWVt4kc5fRpQt19JO4b48JvTcOp3a/7MQ+t91q1ulil3hZHyPGS8kThaRj2l6kKzXqv1+nBFMzWyThRodUWtz/eCpY2JEVcNldNxLI0zav8EeNk8k0LZ6Sv82N/nX6a42i6hWKSKsbJdeKfTQM7bJc8ck/puispFR4wSl9Z/dtoGCgcKnO3XqLZaM4dJh4Oo2K49G/fKSwVqY9FdJfbNX02pwZ7GfP3xPz4yZdQqwFDfiyPHqckm1uZpQMAhxAmCUl7L9Trp0O4UX5nmO3v06pYYETguPmcSYlHCl8bxxgfF6+HAqcJ6hP23OSrDV8rFXLVk1xHGnSnoP6WeecMPorZJJFQ/rJEBl6Mm4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ud/L3sDUmFUaVBl/7DAHbuIPDT3J+wvK2jlbWBvnKyX6/kL465yB9ec6Gwkn?=
 =?us-ascii?Q?4pDTgXMy6ZQiiklttBiDOwNpVINUncKc4OO9hxipxtWfYZaYko9rvqmlbQt7?=
 =?us-ascii?Q?KbALskYsdbuzfsKR1xnHMxglXQxxb/T6tMkPGHo7HjBmLSej8fNenh5e+z5a?=
 =?us-ascii?Q?RSbgf7WZMMjsA/7PSVEYSqJXAUuo7jxoJ/Z9YCZPl5p2uXE5aGzTPCH8uDn8?=
 =?us-ascii?Q?BD1kDvsF6oBF5QUDYtCrZvHHDEyjn69iIJsX6eZrpfBCO//IZmb8bUiwMghq?=
 =?us-ascii?Q?Ls1JQymtDe/N0E1JbJ0ZqvVqKZbC6mnx4WC7d+nrHivjut9f41tNbONEQ4tH?=
 =?us-ascii?Q?TH4z5uzruyJ1q9kcXT7Tswyn6BWy8Doiea/089Ruva4y1dzP+Htx3zIh+40k?=
 =?us-ascii?Q?WVQsZQhK1syqXLLNWqgLaoAOP1rAXmg8v/sGxce+1t7KLynZ115VSBIRszwh?=
 =?us-ascii?Q?9YKAfFcQNekUIlQj532oxXJ2qVmbZk6xZXCBZKB/cPpCbXzKczhpsa9tdlnA?=
 =?us-ascii?Q?RV4bS9GZoRaZTboXjRUfhc9/6ahfD1oBoI+fnFwvawZY0xhElTxec9SHiDJZ?=
 =?us-ascii?Q?e6eZHoBCQdZgc5KXkIDJbulS4QuZ8dflyoNJfGUkjLRKg9v/sGN4guTRt3RK?=
 =?us-ascii?Q?xdvrQDYt7VpLYzjIDxNb4A0+xjRyZplL6aEgsPwzpcDnSYKmdjNg2ee0Hjrk?=
 =?us-ascii?Q?Z/q2XS3pgg4cnKSsRRbA1E6zbuRDHl94+JLGPJ3dcpatXDQgDCdGygR1vjjt?=
 =?us-ascii?Q?H6zkad+q9xkZ/9cg2bSIal8WFaNsIPW9HvXwOsj8nA+8fOM8THmN1kfo4TAh?=
 =?us-ascii?Q?RYbondHFDEAh+5rnR+fHPaliK4u/3G8GwqwCnIvyCTGctfvQ9R1HTqZmbDha?=
 =?us-ascii?Q?eK+i+SZ43H8veruHmeVAMsoeZqRbbtOcFxy1M8NMqbKg/9qR+gWH9WGL9Hua?=
 =?us-ascii?Q?1E6emsatnGUUy3XlcAKMjdCs/C2666CbNpKb7tkGbpZVvUo3n/+lnxMeFhSX?=
 =?us-ascii?Q?6govh6GpmesFy1A/XoIXpiYVXZyNCmH8IQ1+etW+FLDo3i7DFYiAuQZA1IYs?=
 =?us-ascii?Q?uhnSqv8yEUUSpa+V7dbGYFLr9RM7aqnvZ9v4ijHGn8Azf0OMkeLSvxAnwywq?=
 =?us-ascii?Q?OVUxbypBPItHiBHF6kHrAENso5Ga1Oq/EXyPXtPkyU/dqT/cf0ZsfRVV1c5B?=
 =?us-ascii?Q?dI7wOrpZEeVOcpXxWRsd++d8KkaImB+YK+Gg3d8AkghZDq7dqlYBr4zVzOTk?=
 =?us-ascii?Q?1zj2ikfDtT65f5snSCi6qiI/LfRzkvQ9FAbbaIzmDwZz2zqtELZl4gd4U2BN?=
 =?us-ascii?Q?NDW7oIt2HCT24YrY2vY9UtrJmKUktiAo+ToruD+oUAnY8AwBgSdxtvLOwdag?=
 =?us-ascii?Q?sVFB+Jrjh7b8Q2+EhILDgOimOZbYiWGbtxXp96kv3Pex5VRtVlHHldaAw76a?=
 =?us-ascii?Q?NagYPbB9CtPbI7S3X8nV9+c6f12h0yIGMe5mwj8pTZIp53CufEhfTAbkz9+M?=
 =?us-ascii?Q?367W/UaN0b9RzyUQFGkwTN5y3SWTZsyWE30MIk3s+VDd1YUmlgHvRGPMk+AK?=
 =?us-ascii?Q?e5rLZSVDpuLpKDmDXtwHXCo0aiFrsO3XZNvgTQJnBKXJR1DuH1rA3m+r7phs?=
 =?us-ascii?Q?VFdMk6r6I2CQy7m7MwYX4GWC1YPiyJ+kAmPXIzkkZSEee1eby45FqblH3DjV?=
 =?us-ascii?Q?zywG/8XYQynSlhhcVBjaDrNs2MVIzx5IJz198kDECnKeW5bsD74+SEwGKP4W?=
 =?us-ascii?Q?5Q59YVrRUvsUmj+Ci0+eXpX0pcQh1fMPf/CkJLLHbzMXgFhG9dcV?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22322854-60c7-44a1-bd3f-08de847ac2ab
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:13:12.1075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHCDTl256sql/faeOp9IEzzPABVsOtj0ysN3XeR6+IXkEjLFKd9q9CEgD+CrjzdI3qHoPjrGkmYhPRxY2ddI8mtOLiPccUDYWClY4kcycULiTQnWBJlgLFEK64uAaV0o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10859


Hi

> > Fix uninitialized variable playback_only and capture_only because
> > graph_util_parse_link_direction() may not write them.
> 
> > @@ -544,7 +544,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
> >  	struct snd_soc_dai_link *link;
> >  	struct dai_link_data *link_data;
> >  	struct of_phandle_args args;
> > -	bool playback_only, capture_only;
> > +	bool playback_only = false, capture_only = false;
> 
> Don't we need to initalise these once per link rather than once for the
> whole function, otherwise if they are initialised one time then any
> subsequent links will inherit the new value?

Ah, yes indeed. It is called under for_each loop.
So we need is...

------- 8< ------- 8< ------- 8< ------- 8< ------- 8< ------- 8< -------
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 05b4e971a3661..a4518fefad690 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -710,6 +710,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			link->ops = &imx_aif_ops;
 		}
 
+		playback_only = false;
+		capture_only  = false;
 		graph_util_parse_link_direction(np, &playback_only, &capture_only);
 		link->playback_only = playback_only;
 		link->capture_only = capture_only;





Thank you for your help !!

Best regards
---
Kuninori Morimoto
