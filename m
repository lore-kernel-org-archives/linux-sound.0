Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABBC1F872D;
	Mon, 16 Mar 2026 23:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773704827; cv=fail; b=kpLIhCool/L3TCecV/CQNqQi0RkQGlRm9YZdAmxQRWeH64ztIjkL414SICU1iW75Mpr4RDaj2WLGnW08WKimTZu8lFCzs0MjGK3J2rXlI2nqtOcrY6ZCRJhgKJdYGwjMdfWfmh/9DGorOmqxUUBAaFOanDVz22+Qjxnrdv3AfYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773704827; c=relaxed/simple;
	bh=KiAtPeWcx+oKkz84TAmdpAGdZSVVsyR7Z3N7+O15VCc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PtxCeS9L7dOkyB1y+YCq/8qCEiF9EhX3mRPPBp613tg4dOPgGxS7xwR0j5YbMebT7Be0uyXNZ2hgIUwL6WbU+4X1EJUK+lnT/mu4KimtXvbFEZNEFnD9hDyfPJAn2a6uATe4GZkJxahEW0v9KYtSi8tnlzVtrBsGHYMX8RkJhno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HjdpLYrL; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HjdpLYrL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvV7WcicIZxcCEgHsBf9OILHXvjeKq5X9vmTq/ihQWt8wK8Lal5/TwuiTYWMMDeZckRStZZshjA8Zz1tMw4/vaSOSB7wvt8AAvPhOteXbvahkmsKqQFlYt67hOmJId+uVw7tuhnRNf3vNE8Lj8bhhO4gn7Y+FnRoect+rrMZLKw0Q7F/nFMhuk7in48dqPvfmAyJ60zhdv0p3VzWyt44dKIgFpn6rQAZ3YeNGeQ8VsY+p9CH0Q98zDy6KwxRk+0lLOQl7EbVpN1+xmgHPfwVHFwpWj7DVBMAcpCfIXzeovgPRZhz9CuGT7WjZVbiaa8tjlLJG+pn4FA9TbzSCf0BdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYkhLQg4uvZQKIJBUnQ1x+Knm+A8KBzRxZAZpZipUr0=;
 b=Ccfv7nZAaFOpv9kGBzOmp63bZGQ73NjVFj7/yQej4boXhRNrUeR3XaAPGclVi+TJEv35ODyFugQykYRLuko3oKeFJXBwdRKsbO7reW2KY7380MOdbDxFAODZxR0Rr+RB7ECCgAoI1TPLD3E4Gmn3RMS5BKXA6TAlPmiJuT0vY1rJ3zIC94T/h/PW1hj2sI8FyTrYtlZ8WvExexK8xGNxwo3M4TvAKGhHOzoArg1ji3C/7IW5l88O9aslFiPu6Ccc0iwwYs+S25nkIT6mxD7C3uL+MjIFx4NygRnhjrOmfb2n4I4symjNcI47A4gaNKPhTQyXK9/r2lKVpOlm9xxwpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYkhLQg4uvZQKIJBUnQ1x+Knm+A8KBzRxZAZpZipUr0=;
 b=HjdpLYrLeLTdHnnooF3mrRmYPUiQYwCpIdpR8sop6mQGVUVmh2Zam5WkjaT9KcQ49YkNYHJDTbDMO2VS8BvyhHX1eCVnkJbc+NMz/PuCacdEuALSwQeatuDeAQ4Hllomqmy+/z80eIDfHYsSgXv5IyBzHfw7wkHk3839yHh11YA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB7069.jpnprd01.prod.outlook.com (2603:1096:400:db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 23:46:45 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.20.9700.024; Mon, 16 Mar 2026
 23:46:46 +0000
Message-ID: <87qzpjibgr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: simple-card-utils: Check playback-only and capture-only input value
In-Reply-To: <87tsuficas.wl-kuninori.morimoto.gx@renesas.com>
References: <20260316095156.3913910-1-shengjiu.wang@nxp.com>
	<87tsuficas.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 23:46:45 +0000
X-ClientProxiedBy: OS3PR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:604:dc::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: c70f016c-bb00-4609-f39f-08de83b648a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7053199007|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	4raqXzMMUCH2vjbrYzh7Z9NnoqKTUvlObY6Je3nW27zG+Axr6Uw6dpHH3hmnCZPNoYbrdJtD4RsxsgyHf19SezcYfli6bCC+Ue7c76sAfg6JELVFmzsEXA9Oz/T6MLA04y8Szh6H/BazUIvhEWyENRG/rbp+mKJQbKFh5FSB+S/JZk//KuYuhXOwU77bxdG3GDnRH19nXxARzBl9K2Tx+lqSrNn/cNMtIeRhS2ajh5jG3+GKeY0R/ppdTguak+D3JFUHsTFzc9k9ZBgC2HYvePVrTFrpqq1mnUukf2RwDrMy7y7wt7XBHgG+rl1nMFAtf6kVkEDFC4PevTaqPfyeA5IQ7CXPDCeACouM3PgsVyIQhbhgr8l5X0wCckNAAARYdoTbmnrPMGlD2on7773Nk/umDtTorrnGKQpyojLarehfWaBISTw686UQl2Q6aAuuEjqZ2VhbDV7oc0oYiSINpyYx3r1OkAZzoFSxkb2JnxFn8v8QbbLvDyxPvUBRxAeAwrK8OBPkXixvwLIsignMGyBjDSQqnquSlMWRiz7TDF7Tb7H3S9Mg2p4ggUOlH1LiluRgXo5D7oevdRxXyqQSMRP8Ay/dzYKkkMzC4y9x0uJsj08DRKa7s7iH8C36Y+FZ8UKgTlTc0rLYaLLOHqRNVbGDqB/lvZuGwzP72m5iaTW5opCCmzlJbHGLd8aL1pOppPAxRQMoi4eRsx8y0UMdn0foLr61H8vHsuu544sCW8N8GCIN4/JuMr0GHw1mkPf6cj9ofKK5cw+aHkCrI1N7TOdz+VYfxf7+YHUWEkhpA7w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7053199007)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sjGpSawWPtUsFUMyH9DlUeC2U5nwIrFS6NaQpXLdLJxvPHrug5Ua8iC8PwtN?=
 =?us-ascii?Q?105pUDmEDBtWHlwOGOnkoxpneFBRj77NW5WOfpKl9xlqMvw1NWIThF/cLuWt?=
 =?us-ascii?Q?+wuii2R+jnppLJgnYSSrVBHKVC0k0vMeqd1KOclJujLoDMjC+Rm+ys6E+zGg?=
 =?us-ascii?Q?Nk3YAtmaFFjXb9IVViyqz3J96HzNIL+3iHcZOev3yFW33qtggwDzBH+/A7Wm?=
 =?us-ascii?Q?Mzkm4YMPY6nEkwsYcng0Sac0Lbm1BidDyxU5aH3c/qM/xSe85ZiUEJOb11q+?=
 =?us-ascii?Q?Zrwxdi4tEtm0CuydFn1Ysh+nTgn6e2eOSGbINtBSkyyc8JMNVSoAkjAmuMhL?=
 =?us-ascii?Q?AId2ouWcMJZUISi99R9IaZ8MmTewZ0Ren4CLmOb9/OP3Z4/+KDbDBxdXO8Se?=
 =?us-ascii?Q?+FDO9WmwFlAxQP7CQs+lBW8EDgyZQzMQ3zFPotRXrm+1U7OkSKoMfMtPKD8H?=
 =?us-ascii?Q?iWzl78q/VfB18Qnb25Lc+KhfGMMeyPdf1pwUL/ctIXFuzSI9DJm/O6v0QQFq?=
 =?us-ascii?Q?n/C0YDOH35ya51zrgmiulIzzGY244UwWKVXA2N7DM8m1Lr3jIMUGSsPGguiy?=
 =?us-ascii?Q?4HOIJCS8PDu4exZYPp6J2csarZqLqM6g/zeD1/elEIkeXwDaSApP8Hvzfqzy?=
 =?us-ascii?Q?vz05IPQjltzq4Uc3Zcw+sZin2k6YEQthapmsfRzHM4EgKbhLNjqNCm3lx7Om?=
 =?us-ascii?Q?9svASC7PxcbPOZFeNiUWylIvLW00nSf0SI5zKD8TKfCQ8Rv5+UYwa0qC1Sh6?=
 =?us-ascii?Q?3KcYh4sEQHRo9NbDh0OG4z9JKcRF/D1ZYPllq2HEXlwWtd1tIe96UxU8Gwo4?=
 =?us-ascii?Q?tUU+QC+/01uWSzbzV49mJfO/RlwccdDUojTCOUcvItPdOedJOScwv9OeG79F?=
 =?us-ascii?Q?aeNPVVZd11b6SBjgCvvhC/i5/sz3WmCbMq9aK4cLEo4vjPJIM05V+HJpzlcB?=
 =?us-ascii?Q?1d85JFsx1acitwOGLGQeJCeNUbylSDHOgd4x4/HpXHtC61HujDQUGHwDA8gD?=
 =?us-ascii?Q?d5DTwVxPXdrpON0hYCXVx4qI93Pce6OvGoxAq/Ov4T51K/Kv5Ii3tM+EWGZG?=
 =?us-ascii?Q?EhN2pc9jDiv5Z3nZGYZr9ojmyCwTjfSuW8QU6B/Ssviie3DDpiPxBjPnWF34?=
 =?us-ascii?Q?dMt7S+lBac/jVj7zTkuhANH9Vq6tjsvcxWfxm9bmcp24AZjEKnNdd3u5CI/T?=
 =?us-ascii?Q?EOEpuVdRC9of185ZSEswSzE7RXCwRBC8UJNxcY/Yd3REDdvFVwLNs+ffmSDg?=
 =?us-ascii?Q?HsR8xpF14r6A/V96Vwx8B++eUOrMJsJA7LyudpP4j+UDzidURC+fnc/XDnA1?=
 =?us-ascii?Q?+kHzIaDd+kJW+39DbQE3Sf2khUhpNCVXZ5KOVAOu+ScWK7TJsu7MPMFNYcCZ?=
 =?us-ascii?Q?yZm0KxNUEWiEhZkU4cyylFQWJplf7+/Q2/7lFKjZY8q1p6CEoLmA8JesLqmp?=
 =?us-ascii?Q?lclTE89qKguARgGUWow6R3PLvp1tKPsDbgHj79FYPn94DP7IR29GOeGjBAVP?=
 =?us-ascii?Q?w72ZygabEcTd8uNJOs6XJjqK6YKXTV9SGUNhdeYxu7PY9/af2ecAXEr2kjEB?=
 =?us-ascii?Q?5zSzBdXx1X2wO/kFwGjTFhcpLWh4Qes/C55ldWwfLSplKvHOwbjr5TpVGZYZ?=
 =?us-ascii?Q?8Y+jcQHmprmQJXStBEF1CLSsjj86/7rN9iLQW0rU4x38o85WzLVhpfcSCiFQ?=
 =?us-ascii?Q?txoFucoraxQ2tYfeVhOnS8gw8l6OCsvqnDy/ZH9Pb5CBYjCkk9FagaKPkwej?=
 =?us-ascii?Q?ESSGbkK+VJhUeNG+zLlhaVM1V9l7BZc5Oh/Ex8AQoqYBVLNnDWK8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70f016c-bb00-4609-f39f-08de83b648a6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 23:46:46.0948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSJe5h4f2jzHI2a7T8UtUIJ1iaQ5lqlNwpffwwIqjaYUIGWRHCPtmyu8wOPWs6yYcITkbFt3ezBcpoJAXllj8DaDCrJVwohy6ESufgJqdBlh68MKmRPKxyFrGwXH+nlj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7069


Hi again
Add Alexander

> > The audio-graph-card2 gets the value of 'playback-only' and
> > 'capture_only' property in below sequence, if there is 'playback_only' or
> > 'capture_only' property in port_cpu and port_codec nodes, but no these
> > properties in ep_cpu and ep_codec nodes, the value of playback_only and
> > capture_only will be flushed to zero in the end.
> > 
> > graph_util_parse_link_direction(lnk,            &playback_only, &capture_only);
> > graph_util_parse_link_direction(ports_cpu,      &playback_only, &capture_only);
> > graph_util_parse_link_direction(ports_codec,    &playback_only, &capture_only);
> > graph_util_parse_link_direction(port_cpu,       &playback_only, &capture_only);
> > graph_util_parse_link_direction(port_codec,     &playback_only, &capture_only);
> > graph_util_parse_link_direction(ep_cpu,         &playback_only, &capture_only);
> > graph_util_parse_link_direction(ep_codec,       &playback_only, &capture_only);
> > 
> > So check the input value of playback_only and capture_only in
> > graph_util_parse_link_direction() function, if they are true, then won't
> > rewrite the values.
> > 
> > Fixes: 22a507d7680f ("ASoC: simple-card-utils: Check device node before overwrite direction")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/generic/simple-card-utils.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> > index 3115e1f37c0c..e1564c1f7d8d 100644
> > --- a/sound/soc/generic/simple-card-utils.c
> > +++ b/sound/soc/generic/simple-card-utils.c
> > @@ -1202,9 +1202,9 @@ void graph_util_parse_link_direction(struct device_node *np,
> >  	bool is_playback_only = of_property_read_bool(np, "playback-only");
> >  	bool is_capture_only  = of_property_read_bool(np, "capture-only");
> >  
> > -	if (np && playback_only)
> > +	if (np && playback_only && !(*playback_only))
> >  		*playback_only = is_playback_only;
> > -	if (np && capture_only)
> > +	if (np && capture_only && !(*capture_only))
> >  		*capture_only = is_capture_only;
> >  }
> 
> Hmm... It become complex more and more...
> 
> I think it should check "is_playback_only" instead of "playback_only" ?
> Oops, this patch changed the behavior, and it is the reason why you
> got issue many times.
> 
> 	3cc393d2232ec770b5f79bf0673d67702a3536c3
>     	("ASoC: simple-card-utils: Fix pointer check in graph_util_parse
> 	 _link_direction")
> 
> *playback_only pointer check is indeed needed, but *np pointer check is
> not needed because of_property_read_bool() will ignore if it was NULL.
> So maybe we want to have is
> 
> 	if (playback_only && is_playback_only)
> 	    (A)              (B)
> 
> 	(A) pointer check
> 	(B) value   check


commit 3cc393d2232ec770b5f79bf0673d67702a3536c3 say

    Actually check if the passed pointers are valid, before writing to them.
    This also fixes a USBAN warning:
    UBSAN: invalid-load in ../sound/soc/fsl/imx-card.c:687:25
    load of value 255 is not a valid value for type '_Bool'

    This is because playback_only is uninitialized and is not written to, as
    the playback-only property is absent.

But I guess this is because he didn't initialise his playback-only,
instead of graph_util_parse_link_direction() ?

------ 8< ------ 8< ------ 8< ------ 8< ------ 8< ------ 8< ------
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 05b4e971a3661..fc1563fd21f17 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -544,7 +544,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
        struct snd_soc_dai_link *link;
        struct dai_link_data *link_data;
        struct of_phandle_args args;
-       bool playback_only, capture_only;
+       bool playback_only = 0, capture_only = 0;
        int ret, num_links;
        u32 asrc_fmt = 0;
        u32 width;

