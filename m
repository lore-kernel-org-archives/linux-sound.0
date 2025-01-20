Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B96155A52;
	Mon, 20 Jan 2025 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737416163; cv=fail; b=r5gFp8SJ5aHFY2mjqWVnvxkwNdvslznKPS/b+1xValPwL6719PLdeA5dhKM3VHooXjjw945KEAUv+rLhXsZnPdBBqXr6h9eGR6X04m7SN3sGZo5FtwhRiZBPf57ez0neVF/rrs8vz9znKSk5ANs7kf+X+pAlEnG5A/89gs0+kzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737416163; c=relaxed/simple;
	bh=Vf0VTafi3o90wL1hv/reYYgavtLJF1+T3rcYNe/rcnU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kcxxRuKhxyrk8mNSK5f5W9tNCbR+1oJxflDVMr+RHqeGRzMSfWb3CsreAAPaSnx78UUmCtlJfEAQQHUzIbvEVK5v73Q1msF4dau2mmCe3WpqdyU2MfdFedP7LV48fH7owvK2nc01qrmUC8PIsggJsccKVgKspuPxIV8AdU13Daw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BhYs+M3Q; arc=fail smtp.client-ip=40.107.74.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BhYs+M3Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRJdjWAnKBfiGI7yPff783HgmFoRPMx89U2G9F5s8v1VxalXuh7ZonUoBEbOJNYyE0OBQXlcNZ+RMnX2iw/Kui0BuIkMRUdrv2POuzOOY/bpkP5KhLnsBFpQrwkohIXqLGvZ3zt1k8opOvnr2Tily7Wyv0gz1QR17uS4OfUWBFbEVksfFH1FrhZwLj4j1x6+Viy1tvt959O9qycNt14V3ws8iQ7PFGMz2fiH4ecg5N9G60u8HYcDK/zB2etewvnMCczFqYqHkEMRlt8nPLwPIpFaUA2B/hiUotljcqw78U1eqrgb6VKwk0OrSb1QukwBT24NpVGAZuVrTm7lzQuhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emA8EO3ArymRNW62EVqQx8WiaZMBvnf3OZBL/QevWuM=;
 b=gww35c6voW113xUmS5B6Og7WMuTMQ7EXfosGzMtzhXJ6+RH1pAwU8/qwIUx/5K8KsId/BEVkHawzIWy70x00SF4ItPnsMRrYlyN89TIe1OKdC0zZwe6vb8cDL3W2WtvzLoSVmRuO8w5Fk4AldbnOBAdk7ISFrY4TqOQ6ehY3p6i3/JccS5g8kmZjZ5dG2oHz5T1/Q64V+plluhdSETOIYl2/JOJ7oBTKhFVn49No3VFbFqgdpbd0nOMNn3VLHN71r7jtMdqSwnVZCQlLAu4Z2iZSHs4jA3pzvW3yQC5nNcG6m5aZ7l59mAHrVWzmh8bGon4ZL9Ied86NiiTLfS600g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emA8EO3ArymRNW62EVqQx8WiaZMBvnf3OZBL/QevWuM=;
 b=BhYs+M3QSQ6+e6G53yF6fY2ZiWm7FGGJb9t4TXGbyygjTsMvlGTa3YYp2rAFj8o+ADjkzyL2K7AmjZ2IFM9vVpettx4QJL5A7iDaamVUO45mEYz0XEkx1ngIg/7KloSYgoYo9R1qkjylNVp9ceVyVeVC1u3UPgvFbDA1GUX4DP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6123.jpnprd01.prod.outlook.com
 (2603:1096:402:36::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 23:35:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 23:35:56 +0000
Message-ID: <87h65t3voj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: audio-graph-card2: use correct endpoint when getting link parameters
In-Reply-To: <20250120162723.702701-1-ivo.g.dimitrov.75@gmail.com>
References: <875xmhj6s0.wl-kuninori.morimoto.gx@renesas.com>
	<20250120162723.702701-1-ivo.g.dimitrov.75@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 20 Jan 2025 23:35:56 +0000
X-ClientProxiedBy: TYAPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: eb832658-e8c7-4002-08d8-08dd39ab303f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WXrS9e/e3nYjS1qRMq5u+fMlBLWnvfcbHxaJEkrdtO04rVKQJUNzAGcJJvz8?=
 =?us-ascii?Q?rrK0yfnDC/auutwGwkSjs4eiz1k6ODwAv3+b22NcxHXIWhuj7Pk5IISD7Prv?=
 =?us-ascii?Q?/UN976BUrKiGczgisEwXTnZrmo8CX/ORMxhZcC77RgtElmvR/BGpcxV4IG9M?=
 =?us-ascii?Q?riMZxa5s3GZfBst8uVPrNS1muDgHNH/mMqxrrhyQkJEZCy3uWUMan52+KykO?=
 =?us-ascii?Q?sZcVz//lQ4lxqUPnWOVgjRt9xLsrxSfHGB2W9NsZAWfBFMMC296udAABTcWF?=
 =?us-ascii?Q?9miTd1zuht2L1g9jnJYe41UsDaVLkJ5pv+QCSy3eoEWsw5XiwUUjSqsCqYqT?=
 =?us-ascii?Q?Wzrmk6F6H5bJBKmLd9xpNJL/lal6A756KfaXtS9GiBDP7g9nfT3Zdur3dwx0?=
 =?us-ascii?Q?+zQbJ7nJHAYcfqIJMb7/4T/j5txmKu6kvfsW+1YS6OohowQkyRESAZ0Q24O3?=
 =?us-ascii?Q?/C1e9tXB3mq2ZVN6M/Qbgh2tnKFdVfkcMrtTp724nWGfhchGqKG6uEz6KrF6?=
 =?us-ascii?Q?T50KwH/K8oZ9ZuDcqew3X3opufp2/V5AZwtfh2m3/kgBdk7GdCE2emXY4eIc?=
 =?us-ascii?Q?beBB/BD/7n8BBqFQzj+7BN/Xsn3Lxf3X5qLxI/IRytJTGR+0HlNIc3Euvkrk?=
 =?us-ascii?Q?iTVeYX9bWxoGiZ+SXlrLT4Bxr3Q37C1h18wKf6Dqp5tOVry6cPUXQKgHQrDe?=
 =?us-ascii?Q?LgLGZNnUlGSayQzTDLRNcGldV3LIbDbe6Ip2yn1nPuX/382rcEAMaMBfCdyY?=
 =?us-ascii?Q?wC7wij64J6mcPRHEzIih+64zuOAfKNjLvFB8iD4mEhtt+FQ5o+rdr5QvT4Ns?=
 =?us-ascii?Q?qjdtBaSZAH1s6t9SCv8ySHIK5JZL2o8YRVwILVzWBQIW/IhUH0bRcNZfUGP3?=
 =?us-ascii?Q?VB5m6s0QxdlXYNusZkueoZF4/JUX13ayRsTq+es8M1UCrPC/ISEWKT40+C1t?=
 =?us-ascii?Q?PR84xUUt5J6gRMN8H5Ci1HcJ4SV1I9ey+1ePbUFaZNsIRT97MFUcBFgfWHgD?=
 =?us-ascii?Q?Hdv9tRLgUg0jvFrDHVkykRtCnEsEuoyFsJ2ormR28phML8ytHHlAxzeSpjR8?=
 =?us-ascii?Q?+dikDLWK8sw3dtUyjYQTO0809sHwDMXdf7egQIHU1Ix4xyk/k3JOKxxb7NSB?=
 =?us-ascii?Q?MOxxws7jidiH4Zd+rffujjUwcr7S/VylAus02H/1kf2DvAq6YhDgXH1ANjaO?=
 =?us-ascii?Q?z5vsRtWrUsXtonW2O4FESzuyNHtZ90sXJmTRTgoWtZTzPaVzdsEO403z1z4p?=
 =?us-ascii?Q?fc845f/p6B8su48gZRzo5WqDg5+mi3yuGGqDPf4MAqMle+Ma5YDWmG7BUgCP?=
 =?us-ascii?Q?aqo7qPGNKsxmKRyvGJ8EOJbM1xrsHvfNZup0hmQ+xrPhoQONir1GemiDamF+?=
 =?us-ascii?Q?5xcY9Zzw0PcDeMPdjHTuWYy7IfbNyCToNBHwB0HznnCeMWMCthCQ1uz08SNb?=
 =?us-ascii?Q?mMvDiIvbWAtO3tN/1mWDECYNVhBEj39v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s6I2jVQeXGbbwBhfOeKJmtwAsIVx+iDxUymVvDK23TW0FvgwV7vjDY5moSLa?=
 =?us-ascii?Q?woBPCFiySyzwowzkyZUDBkSVzwcwDKJCxPygeOTpWKUa6icQBLcZKIcYhiOa?=
 =?us-ascii?Q?QDdEQ0TvJcYfA3awvSE5pMWQ6KGh15pEd+cYfSN8KGsiT9UnSSJUY9Jvxi1Q?=
 =?us-ascii?Q?tGl+qmIbEdElmyFG1vSsHL8rlgAMoM9CF166GcNpsXxZN28ihFG1h2o/EUlq?=
 =?us-ascii?Q?C4P/bWXvMWL0I8447PKTlWpbE+pLU4PhfwXYs4j5MP0YYDtzXZSIKXw7JVxD?=
 =?us-ascii?Q?hH1/2K5NBH2IZxXegKFdLPz+zLbkSi1WUdYvIOeenfd/AEJOg6HWDWUx/2NA?=
 =?us-ascii?Q?fL0mLPw/RVF6LagIHaMFaSCq37DIdBXWmRkVJNRPl00mBVP6sJXhiWBILZfO?=
 =?us-ascii?Q?JCZUbZyPHu8M16BSk5PkNBwXtbiSpcTPc+er9Woid+DEeXYZYjVZONp7IFpS?=
 =?us-ascii?Q?EImDDfdNU80cnG4WsWss6g65C7KgHap4GWiA2BvkKkfbcTWzdDynPRA3LQct?=
 =?us-ascii?Q?aIWQ5DmhZcjLb3n179jdrHOncDqloQXhq7LnqsePrfgnvLMavsTJIk+MaiAu?=
 =?us-ascii?Q?iqRBOl4k/F64/bfLtujE1bAWNstVLjCyD48K8ZlQrc0enWtyrS5pDcuHRbnL?=
 =?us-ascii?Q?psn2xUrgQJ1uaG51z8pg+QVCMl+/6B3rMdjkzVxOt9yh1Euo2/tIsrO7nf4C?=
 =?us-ascii?Q?6TowzOrczdIAJfY4SnxOx+92XmvkZFmc8SQ+/jpPI3MTpGfmh3EwTwfU4AKL?=
 =?us-ascii?Q?Hrl4SnzQ3R72TssSwFUZUPOO8RX8EN2KDmChnr80+5zmcKRN/PAVle5rfWTK?=
 =?us-ascii?Q?D82DfRmsTdGvHc7opkkOZlIgRz+bhPAiGPbk0sZ/TR27WmbBF9rKKiCVPa2u?=
 =?us-ascii?Q?NyqG2lmpKxk57OUI3+ZxTjhYWECAwqUa/ZbBpjjHxocaMccYF00LO4POqhyi?=
 =?us-ascii?Q?WfD3kiszgNuG7wTRkVNLcIEWsMjziZV4yXANzoGGGBidJgbeWM0cHhAy3V1k?=
 =?us-ascii?Q?10r3/N5+c+Yog+tThL8LTK9V2rscHkRRrtpX1Xf7dW4QyMn31L52/dfNY1MW?=
 =?us-ascii?Q?PAwgcGbKPDRLCmd+J+oBXflujg1EvMHMZ+RKi7+j5bIHTUVkbnGJlZfxNgcB?=
 =?us-ascii?Q?K98tlU+pzqiaVCvH2kGFD0dKj5F7jnLNx66k6y/hBr481+of0um+fZDxOfSG?=
 =?us-ascii?Q?/Q1md7cOToBv5GZcAZPBapAgpMSoP8zgMQo2GQujkUHv0Q6ZDuRtagzaJn0h?=
 =?us-ascii?Q?/f/ik/hPdEtIgIlJ3UXmRB3b4KLl+xIjwli9Jq04SaC+C0VJJMYMxKoZrz7k?=
 =?us-ascii?Q?zi0Zic9rMl9zcSj6eUDHu2c4fTEDEoLsy1cSymMNPn93p30mstxEZrWgisLu?=
 =?us-ascii?Q?qDarKLtDjvCOa2Z45SHtoplAfp1Y2dWAeOXG8r1H4apH14sU3CJ/69KYFeV6?=
 =?us-ascii?Q?anzCju4+IJYmCIRvhhsFXUQexp5FPHS1fht7bLUSqywoqiL9d5LP0oX5iBGO?=
 =?us-ascii?Q?kggmXFOZI+7R4E0eAGDLkB8wjPjYoY62S6HVG4lFD244sKTYE6w43fK56SZ1?=
 =?us-ascii?Q?usmPTFGBgXMzmgi35kmLXiztmT+YdvYOExC4a1FWbyQ7n4Wg4VuLkDlEpOOC?=
 =?us-ascii?Q?Dw=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb832658-e8c7-4002-08d8-08dd39ab303f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 23:35:56.9035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViCTWNCnK0BjOYUrAVdyz5EOGu5RQ+ucnE5+tkeLwxZiKPOGqnw63phUTr5EtTis+L2QmfHx2t9lZlODXm2CU4v/hFNyPiVgkUOzD2a04kaQAVUayIrDvXY8UShTTZz4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6123


Hi Ivaylo

Thank you for the patch

> When link DT nodes are parsed, most functions get port as a parameter,
> which results in port endpoint@0 always being used. However, each endpoint
> might have different settings, but those are currently ignored.
> 
> Fix that by passing endpoint instead of port when parsing link parameters.
> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
(snip)
> @@ -831,9 +830,8 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
>  			     struct device_node *lnk,
>  			     struct link_info *li)
>  {
> -	struct device_node *cpu_port = lnk;
> -	struct device_node *cpu_ep	__free(device_node) = of_graph_get_next_port_endpoint(cpu_port, NULL);
> -	struct device_node *codec_port	__free(device_node) = of_graph_get_remote_port(cpu_ep);
> +	struct device_node *cpu_ep __free(device_node) = of_graph_get_next_port_endpoint(lnk, NULL);
> +	struct device_node *codec_ep __free(device_node) = of_graph_get_remote_endpoint(cpu_ep);
>  	int ret;

You don't need to change cpu_port/cpu_ep here ?
And, I would like to keep "cpu_port = lnk" here.

Except above
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
