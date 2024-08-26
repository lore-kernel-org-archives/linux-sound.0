Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013E635
	for <linux-sound@vger.kernel.org>; Mon, 26 Aug 2024 01:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724635368; cv=fail; b=AMvVQANclhgHKehvurQtsTzQnKUtctU0MA1pUy8RMgjgiCVrPU/0Lj1ZyLRzdavCQ4Hl3WeUMYjEoK/AxXaaPPnFbEYPaLACLb34CKElyLwjp5Y/MvvCpXzKpYRhx7ePfI+5RLobodGHSExuJ4adMVXwadckEe5ed6+FVCFap8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724635368; c=relaxed/simple;
	bh=0psDFT1ytAt054VZSon+Libj+6sewIKZW4oHmOJHQkY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ltFrUjLyNeiyiKB/WmlMmRDQNdgggiZDN/fntROQQWuphrKvC4JaJZXSt1Q0Chbo3tzD1KBhh401i61tcmG0fgjWo6rwZ9cj/5crX5c5GxV4OU1tQZAa3r6g4f8CanysgakgKqgQf1+G+6hffnX0+fSDpimu3Q8NAh5s+qOPx9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kohWfBDK; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kohWfBDK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOuyXsZTw/f+hgk5NRRNrZzfOyKPRw8uDQBxBbOY3Hr0m7PKM1aInHOOq1ZcTVS/TbNLExBIRdO8VoDBFgN8dLYoyhEJWhBQqiwxs39l8oHI0e+N6qQgQ0yHkDMXytooj2ZYpF0TL6b5sGUbKdBJ5c1Fq/2kaWlH6aPym05e5TzD1AxAg5nLwdNRS0rs0R2YLc/Je35BXaQyukmRW/alFIsFdYLHyUyvSQ0LCtieMTdlWFsLXTh+be6u6c8UunVFj5AFBPSkpaiCDgSLNt1Tuwm69ElQX4va0AxzRnSAU043edikEPxRFQilSoZnQZ9DmgQ+1kXC3VaGEB6ucORhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9amI1joMAJ3AUeDT4tk8diewl7SEZGv/nc/485WwMSM=;
 b=A1zuG0cmQPgQ/x9dkJ9f9AECPubYxeKi+W+HJPMtVLmUFEjZ08wBe1udQGjaqNyCAHsiX89R5L1ZajcAC80GRTJK0cw07OdcxGUoE4H9Q+0YvBk/LSiqLpKvGTC09vpv3v1dedbucZP6d58AYJCFc42JjXrDeeKkmlZyJ4ooAHRa/RoV+SO2tfGsKKoTBr9RlUutsPg2mIaGm06H++eb6L9wMMVpMYS9zfYI0KkqtiUOo8f8XRiB0/6kw//nrPW0MV4cQJI3Jev0t+9nK8mI3ZF3/m7ZkHEDSrf/zvDk2fownTKeV19DjPt39jhc9KQ3Olo7l8V6eMB1rPiz5N1sGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9amI1joMAJ3AUeDT4tk8diewl7SEZGv/nc/485WwMSM=;
 b=kohWfBDKBwZIcsmCL3Z2TaKn3J81nPpz/E85wzTAxoBZ1MQHMNjvwHP8BAkCKKZXVmxwystQA8U1Hjhf33thWHFC83ffduxKu/mQPyK9YD0Q+8Yzjw3vWj78Gy+kPwHuzPaEvOcwElhbwYaWNI5/1qGd7JxxtLuom9MtROjRU9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10475.jpnprd01.prod.outlook.com
 (2603:1096:400:2fb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 01:22:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 01:22:42 +0000
Message-ID: <87frqsqdr1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: <lgirdwood@gmail.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: audio-graph-card2: Use helper function to simplify code
In-Reply-To: <20240822112649.58376-3-zhangzekun11@huawei.com>
References: <20240822112649.58376-1-zhangzekun11@huawei.com>
	<20240822112649.58376-3-zhangzekun11@huawei.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Aug 2024 01:22:42 +0000
X-ClientProxiedBy: TYCPR01CA0083.jpnprd01.prod.outlook.com
 (2603:1096:405:3::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10475:EE_
X-MS-Office365-Filtering-Correlation-Id: 863c3f42-cd92-465d-ca52-08dcc56d9529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a/m992HrCLTcvl1CfVk3s8rU09zoVynMWCCfNZch0uNGRln4uqvHruOn4Lo1?=
 =?us-ascii?Q?+FymXtOGlPyaU6r4hg5FA3ylBC0LSAcmsMLTvjzaCtNOzZHb0W/k7d5GoYEJ?=
 =?us-ascii?Q?rqFQsSvuNVtinOC4B8NI+WvIN8Kg9K6LGTjAlv1dI/vkx3GxotbyFYysCR9G?=
 =?us-ascii?Q?aX/bnESaRHdvz5xsL6EtmhMYeC3SFPPvyJpOvB1wnInYIJpO0eQnmcqPgqde?=
 =?us-ascii?Q?QtG100PC7s7DCwYQKcPAZleMP1fudzOFiZTdasVxJJcbyFJhU6g6FRKGz0yL?=
 =?us-ascii?Q?Lcvi+7pdTRDHee6smo1zmUgOWipqSZOPJSFXViE16IrI+0lYFogBNvq89zmM?=
 =?us-ascii?Q?yzbWR6hcUCC1PugZ6B3DoPNIIHrRqYo70MtPXJA3IAHIgGnWM4cty8sSmhh5?=
 =?us-ascii?Q?TICdgJPMeAtbV/+dHnA4OGaHWaU6WvEFmOEg3Lv5jqpDYPYtu1vq8gmoYTT7?=
 =?us-ascii?Q?BMhVopzgM/53FtChF9jK+YgdQFF2YqKr3gLaUi5fcC1a+L2bH+OeBV/wr30t?=
 =?us-ascii?Q?u0leTwlweGycghxrI8JMeV0EiomI3zepX1ycgpVO1lTJSujF37mMQvSVeI0c?=
 =?us-ascii?Q?EgjMAgSCGfY663dv882ynRskSgxqSJtjTpDZtu7FE2rPpLnrOTZMP7I7BoYW?=
 =?us-ascii?Q?lYjzvJywB/ENgr8LWLoOsfA5qpqdefNsgJiG+fQv/gsoJgDcJkacckzCEhsv?=
 =?us-ascii?Q?EwBSiGSYXpLnFaiNehU3CWaeCuDdl4j3MfgA5/9QZqXjOI6YYfSwt2qZh+ub?=
 =?us-ascii?Q?E6DYZwLURNsXVRMGV7ve09G9c1xzxaI2PMhDmQxQg3kZHtmlZaZAH4vyNWfX?=
 =?us-ascii?Q?k6RU8opJuTBN18bEZym8ChHJXAM+IcNSOcazuTbug6zdNa506ibhqi3RQIcm?=
 =?us-ascii?Q?KifngeLHW+NrO0cWs84mFvGu7eNYHRsS3XGjqk59FDDXt039NTJ3sDg1Z3ZF?=
 =?us-ascii?Q?DIZhX/GEdHYaZFcwCsBjLxyn3BcH1KDW7w3r7sJJ5cZZ5YQh5NeS+LnxL9pB?=
 =?us-ascii?Q?+mNDAQsGNQ+r/E6xiozoU/W/Jre0Iji4xiJAuu19WgjQpuoUc7QZC5zRHMH+?=
 =?us-ascii?Q?U1H54Yju/EV8yvfwGa8OpuvzmeUAk6Gb/T3/kWEAQAJ2m2+vlqn2vTYITYXd?=
 =?us-ascii?Q?+V1M5SPOQ83nY/AJ7Y640GrYpHVBtFvF0vIHnYQsVaYbX3XqP/IPAGtFqt1n?=
 =?us-ascii?Q?swtHgjeugj8BRsZz5IUU/eASBg/bdUPAiWHPsg9T4bFAnaKOb3gWUYdjYTbr?=
 =?us-ascii?Q?R72aWRjkn5FbNEl3Sjz6lce8uJP0S+I3tD8Cf74sOQrfgi3j6/QkPjo1LvHN?=
 =?us-ascii?Q?4j+iMqx0tSTB4v4WrJCSJxklDz8bH3vmQwO1ALSN/Ud6EVabCrnJrcS0Nm9t?=
 =?us-ascii?Q?FPCqz96tWSe9ObgAL0SqYmxOVEUPbfK51OsTZTv9LN4tYXrH1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+vkpYDzx/aoPFyYzl/drDEtPPlwhFVBnBMp6SUwoTs2Z2CSyrc/54L4v6hZK?=
 =?us-ascii?Q?3RaAWTAuf+GvSJ520mhOms2udEiQqYc1YTMegdk7Q7AvMNKzNGPQ2AOtT2CF?=
 =?us-ascii?Q?DkFCs38r8pCvCoQbX6HgJDduK0uBoCxey0/J1h5eQG65vT4wie1e4T0arjXl?=
 =?us-ascii?Q?+G00rj1M19P1f2TwSPFQ5CScT/d8u5hiXxqzQtTZ0JB3Iq/Zvk85G2OmZory?=
 =?us-ascii?Q?wNRxleCFyLUYB45dnsNP89qMHclw5PMbl0HpeJphGiDNu4Nj+KcDqqfNohQI?=
 =?us-ascii?Q?9RrBa9i5vFGxXO4H0EKUkXV34qC2WOpHwVRf4aXPWeMg4TAI6JsO4n3mLbOs?=
 =?us-ascii?Q?xY8FKmztwzGGLiaYe3TZsQMG9Myhui1PNFzYU6u4cvEIfuoQlogOh1orxSQ9?=
 =?us-ascii?Q?XBJd20Y069Rd3vl9zRbPAmLvI1XYTSxo6eIwxLcXCSNgz6B9+ibzJDs/Wpy0?=
 =?us-ascii?Q?nXRjd3NydHT6pWdW2znvSREFomzFwsD1z/VaoZJJStgMSO3+BPGqgRx9MT/o?=
 =?us-ascii?Q?XtM/XLV4YIp3lfodcLUfarHiatQpuQO4yGHE/UG4tqP+qOX3NWh+1VF7xd+z?=
 =?us-ascii?Q?XRt6QQWZapGJBkXZJqWMSM3WkcprimdUaIgrYNNkWKGMIhR/rZgE7bzoROsH?=
 =?us-ascii?Q?vKpG6zbB4IlUuFVGNlskY/lM7pUPlsuU/gySAT0S+JqIp0kh0IrbQe0ZpRwv?=
 =?us-ascii?Q?ZtKhOIUkmdc9L2Neia9yAjv87egY1Du5dKPk860pdecoAJSAX8JmZRcuZjJd?=
 =?us-ascii?Q?J3t3pgGGUQHYTGOJPII8OgHany80cwIEA4zsdORZlRKdMYZFR+5GLgG9plEq?=
 =?us-ascii?Q?lzzmzasY/QVzmHWn8PzDV3NBrCb3CszDZ7GH+Qn6HCXfacaHWG4xuYFPfSLr?=
 =?us-ascii?Q?8RTZl8qJYmoRVKAuM9BCbhnE0HZ/k8wnBY9GUlcCRBoF3xUQwxCC7DHbpYfE?=
 =?us-ascii?Q?hSxaCOnicaWDQlNubPsjfhxpjLzv17Evr5vnPBmAl22cmvkp9AZt4PuHTWXh?=
 =?us-ascii?Q?i8KbReQPlaf7qEqr/8nNff/t9YBov3d5l/n4WGKIgEy/ObIbwwleCmVOaetx?=
 =?us-ascii?Q?dcqr2PD+MbRa0Ye63PnfwhncRpsqRLm7rQ5NkOcuMrHjAYAbxi21uIcos/ck?=
 =?us-ascii?Q?Ep16SvvkgD9RodkWRcNzAk5aTfuQsGeMaoOyTfgpOXOYqQGRjwTlHO4Y4TXz?=
 =?us-ascii?Q?oOvH9mJuiLukg/NnzumnQsFFjtkuBAEvY0x5/+QO2AB2k3wbByjnPgsv54zd?=
 =?us-ascii?Q?ZeYsL2YDZbxzstM/2l+aHbO2HW6+ZhQGH4jyqmSB3qXK8zHXJu2Ut+zC3WWQ?=
 =?us-ascii?Q?YlGkgf1km9oHz1sgNwHbvsSfD+KXZoUGtDCUZDNpYG3EKVy8k50finGIj1Az?=
 =?us-ascii?Q?UsZvYDJSI2x1ACJ6xp6EWUcwXcE2KEOO0QTVzTi+F37bpXqTi9PTED/dx9N+?=
 =?us-ascii?Q?4JTH+jx5PbtDk3LuEVGfIz80f5DZ/AvjR3QidH4hmmm9jcNfm9o4YvcJHkFe?=
 =?us-ascii?Q?gIfNpduzfXm1pIjYMhXoIPoPu815Ma1EX6Q9Fde7y3wlROF+i7ZNeOJoKGGv?=
 =?us-ascii?Q?RyzKCtOkBPrervrNmRqLDX/4eYblnAIvN31P4QlgmBSQj7cQtkhp1Zdq1dg9?=
 =?us-ascii?Q?Du+Zig/rBPx1u4LJzvO9rO4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863c3f42-cd92-465d-ca52-08dcc56d9529
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 01:22:42.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjOi/fpBJyiH5y4LqV9rFJG33jYM39rZerofx8sE3UkCPHF72DUCpHcU2aLuSIDlnNfGbVuh8LxSQuJArTaKDH73yLehZAWtM7nbHl+npA64WkbgyMW0vSoAUwBzqw3Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10475


Hi Zhang

Thank you for the patch

> -	do {
> -		*port = of_get_next_child(ports, *port);
> -		if (!*port)
> +	for_each_child_of_node(ports, *port) {
> +		if (of_node_name_eq(*port, "port")) {
> +			ep  = port_to_endpoint(*port);
> +			rep = of_graph_get_remote_endpoint(ep);
>  			break;
> -	} while (!of_node_name_eq(*port, "port"));
> -
> -	if (*port) {
> -		ep  = port_to_endpoint(*port);
> -		rep = of_graph_get_remote_endpoint(ep);
> +		}
>  	}

Original code calls (A) first, but this code calls (B) first in
for_each_child_of_node(), it breaks logic

(A)	of_get_next_child(ports, *port);
(B)	of_get_next_child(ports, NULL);

This function try to find next port, not for port loop.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
