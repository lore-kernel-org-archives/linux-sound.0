Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4F63FBA7;
	Tue, 13 May 2025 23:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747179496; cv=fail; b=r/usW+D1ViLYeqEFnw0E8LQxkdhy8kl+6mz0yX3k+k+u45aMzLJ3uPZ5EM4D6vBMCQhbS0renuC9Cgjmfo9h5w1eRKgaLrJcap/ahcbKPnL+jSUeVNa6OmtZ+vH5ZQBLIQoBy6gHfyOTjb+kOZkwrrUSx7cPUfC6Ci5SoKeISTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747179496; c=relaxed/simple;
	bh=chtECnlz8xK7lVop0OjMzKAwPPNdWgqrwaxALjvs3ws=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PlKSU95i03QNiwW2rWAMw/K+5hTwrgjrvM3FO4WvdfOid7SSMn+Z+tMM7BDO/QlQfqHGOc92IxS+T9jTw+sKQm7BTv+J7UmQrLuOFbISeWLeSkQyng+fXeteW1i2ul1y/a+9u8OjZO7CucbtFq7ksM2pMSEmfvItCu4LZoWKX7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e0+hfiZY; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e0+hfiZY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4K2i8pJRpFelSnb58JDMIAezdQCdsYn3ziJPzvmLbOaJM2h61mDk0Up36FIPwW8B5N2OO1pXJh/xi1GBS9+8jwn8+tt1tpN9LIq87bp4xlljgaajEQYnKnYxuWRE2YMHE/JJ8m9x4/68AfeF2ovPiiVYwrMailoDoVzNgwW2ae3r4SoZCv2bVdeUZFb4VqypzMIXALY0D4zaFhj37Hez50bpr7b2Hjopi5UatTqnPI/A7Z/HciexS/GOAAft3G1DRpSOfGbSbAObGc8E2Vq8lBvY0p5cSQwiSD5fYM0IO8AlcT4CvO1KS4VMILWEaqVhgJAE/eXMU0eImHSdktmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Vt38hb9xmh4Bn571NnTb+quoTHkTn5DtvzV7J8vXug=;
 b=l3K3Ya8uMYa1DHM3QWa6Zqn9Wqk+1MPG9DQqKMLeCw7S+ZUZFOnmdkujr2w5u5RprqNWDyDiOuJPM+9bPk6LqfevTAzrxWpehlV4YJ4Z3vFwnYwOWQ1aM+9cuYTxAmL7INj/7xuUbl+GhuWptkduOjr4twOKmbqtRKzXMV+zr+tpGw0geILPU+2OVLi18zfOMll9YcdBKWmNa6qyaOALPqCucBcc5oZVBh6LKlWjn43HIn7UrvUbInhDSDZxezhfEMsOqiZs+tym2IiVl9JhKOeAcCSS9M0AFs6lA0tzbgPGmx8PKXjwwWUbBkenFCxXOE+La6h+MyocbzKi3CNW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Vt38hb9xmh4Bn571NnTb+quoTHkTn5DtvzV7J8vXug=;
 b=e0+hfiZY6z/uPgJZ4gjHcj4kn2lqSn0dQnmthpm+WEER/bt/cIpjP6n2fewwYFJV/LAbl4VOPWCH5HzLUh4mZfgjQlJDhQhzuh+utz1eiV/hjXu19zw3qYFilF15smhuQ2eGoajv4r74eEQnaPnTl8ccgcD+N/x66UUrygsygdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10204.jpnprd01.prod.outlook.com
 (2603:1096:400:1db::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 23:38:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 23:38:10 +0000
Message-ID: <878qn0axp9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: audio-graph-card2: reference audio-graph routing property
In-Reply-To: <87ecwuy2sd.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecwuy2sd.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 13 May 2025 23:38:10 +0000
X-ClientProxiedBy: TY2PR06CA0034.apcprd06.prod.outlook.com
 (2603:1096:404:2e::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10204:EE_
X-MS-Office365-Filtering-Correlation-Id: 650415b5-cdc7-4bc3-bc9d-08dd9277388f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xtEZvI34858fqXTXTDSRum1PRlAiVtLmlkIpFVsYIwPxdxjsF4WIMazaYyQe?=
 =?us-ascii?Q?hFTbIzSFGGceMUERDBGYG7kbV2uet27IQGD07PMR/fgZZ4rtE7EKbqK0z8PL?=
 =?us-ascii?Q?DMsBS24s31ZgBGT0Dyj55B8SAdpcleHhg5JNkGE0WuMauW+wtZ+7aIfJSbBY?=
 =?us-ascii?Q?6HSDVRX3RTl5lY8nFpLjUEQEnGUQSfD/9FdD4sdED49VO4UrCYwe4501leYz?=
 =?us-ascii?Q?xux/27BSHcJUc3wvELqciFJYH2Nb1DYFStl+iiCwSMEnTdUZM6ge3DFylLpE?=
 =?us-ascii?Q?jrPxVyprxX5ysQIDy8gsPhVLJQDIf13ZR4xOYOMJTs3365//bGQKY76FV658?=
 =?us-ascii?Q?L1nvYVMtxJ5tDxURMDAYCw6bZGr1Nw4zOlZfNXDZFwdIsHoNDc2XGuD/Lfnd?=
 =?us-ascii?Q?+K8G8b3dfHuzoIqKC5RzsuD7Uka498CepLgATmOXsNkqDybypXXwXOFdR3p1?=
 =?us-ascii?Q?EmhCr8MTjvIMyMdexzZVQga8d16uLYDG9N93uL4aepRrPMjXOe8OmWdpWQdQ?=
 =?us-ascii?Q?YFyBdU6lc7GgHUq4Byq8yRF7ZElszSKl6qFjjOHYI2jd2KxHNxpuPMie7nZE?=
 =?us-ascii?Q?6XKCI1z59Wjusa12pQ+4acPYJBs8IMlO9coJmEf/T6mn3fk5Bm8YaQ4+2msR?=
 =?us-ascii?Q?4/ylNoLFUWh4Ld6TUk0hsw0lWdzVEoDRD2+UCoSJuhDh6/Rz0APalJqAPuZl?=
 =?us-ascii?Q?A3McPygGRrk1LNAr/sYOFsHOiSxz6a0ITkJXEqzx7pJCp4x14fmHmcC987Ja?=
 =?us-ascii?Q?aJBI3US+vYdto55NYIN3XXYo8aD0x6O8OVIDCltwfzZVs8HucVA7yzbyFaY3?=
 =?us-ascii?Q?FiECZ6cFFzupYraAdEWKsa14haJRS54tx+kgd0U3yJcYpQjblJxPQjgpmMDu?=
 =?us-ascii?Q?l0RKxpWWaW0/kAR7Hvc0FUS5XUd4H5jekxx/d9ANuUj24RYQRJT/97hFa4Dz?=
 =?us-ascii?Q?pfCh8CkEsGUKGfWdYAiF86h/rbjAp1jZ8M8ududM26Er84PCh0AEBYuhOkrU?=
 =?us-ascii?Q?qaSC8EMvm3ZyKiGi1l/RMDstWFChVAuZ4mOrM/Y3x2wiDQ81TDyGRe2CICdb?=
 =?us-ascii?Q?BAdLIKi+sczfOL6MvD+deHZYg/5hIRlR5Rbb0SYXe49eNLhRzrasKbpxmax8?=
 =?us-ascii?Q?ca5KHiXYKSjhDw16zosgZIf0NyIPuq23bwJF46D+wqjPejFzgiDGuKOMgcNJ?=
 =?us-ascii?Q?/ySH9t2kBEqeS9XpUMK9Peb+jydNRqWX7LHGP9FhLn3vuja9PmLukQ2yiLn/?=
 =?us-ascii?Q?TqAFXF9yieq0+waIyMI0XCde3NNmUgkDAAZVEWw5r9voFlT4dX3JVot8apAn?=
 =?us-ascii?Q?x3E1hjyaAdQWTgm9LcKi5RcY9eA+nWMNUG08KD2UlcpaV2C3uEhyIv4N4WdF?=
 =?us-ascii?Q?hCv+GXMaf8mkOqLGvN49rLIe9PD9t2e2Zn7SlxTIJA4GFhH6wmQHMSnK3IAm?=
 =?us-ascii?Q?FBfAr/5gp5gao8Yz8McB3XIgFVPjCqAJWXpMq5V9zDUNfMQyUk2/rg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uRMzI1wHUOxJ434XWART2Kjf1/qmZXIw3RopSKQcRH50r4Li4FfGqt6JyGvS?=
 =?us-ascii?Q?XP8hNwkgfeI9y3IXux5EqrO0g4bM5WUa0AvjTackTfUwTcbw1KRfmSpfzU41?=
 =?us-ascii?Q?AgMdM07YPDc9WBeGl+0akX2D7epBqdGLK8KwJN4RoT8N2G5XiArA0q5gPgCM?=
 =?us-ascii?Q?YnEfGyeTmxFE4owOqa0Gg3Aj9TtV4FKh8X/6BkBRTQCD87km2iwMiSe+tBxe?=
 =?us-ascii?Q?FE0/V6cqf+nLc2SrBlrsVfbwgKbY+HUMK6YOEcwW4t7hx3MC72fbgCVemOT2?=
 =?us-ascii?Q?/7RIUdx9LChSWmGgSMmduMTYVlYybanhI7GuyD8RODX7yg1rmLKJYIY3gJFp?=
 =?us-ascii?Q?b2WSrzjxwoDQ07AJ4nBHNQWGDnXcnzcgv3j6tErKugXILoHfAJWabvYrryfx?=
 =?us-ascii?Q?s+uq6qLskQ2WyKwinGNXe7eZRH2Pc1N1C6eyAJGTSg8GELc9QXULE3YXrF/z?=
 =?us-ascii?Q?YjXjt/DI5azXY7AQMrZBxIPEMVf6GSeCFRu3v13HAEpJVqvi5iUniOSAH3ha?=
 =?us-ascii?Q?me0A0WaPJ4Db/HzM6Fux6P6I1hhO36NNRonGOgHn9g/+OwKHTkYR/+PCc0GA?=
 =?us-ascii?Q?fEGpE7GEtDX8jVTYU1IVTe+4LbMhbxD5M8qnj/fn6B4XTkTurhbg56QNBBp3?=
 =?us-ascii?Q?3rGOD6ozpbPre7wzykUmT1sN4/kpQKDHdxk/U1ljEsEUkAKny3mgMHcocqVN?=
 =?us-ascii?Q?Ic1LVvxb5wHok5LmEhylbj2GajzpWY9FxzbGB3Mumw0Z2S8jHV7et7QrZOtO?=
 =?us-ascii?Q?N19tDNT90CrLWdGAOmm5urfzTLp+MUXHlRatHUZ2N8dYCsbDP9y2+SFcX4gt?=
 =?us-ascii?Q?08M2RKZOA9flE8aJVnKBguZQLzD5mK8tmdK7qafLGN0wHJ/UyEi5flRgOnuI?=
 =?us-ascii?Q?XsNFtfT32J6X2mBqzEHvyR6WPF6z/KHB3+DoG4k9sZN9Hm6VhAhNVZhO/e1I?=
 =?us-ascii?Q?a4hT0ZPplTe+C0ybZ2DhplqwzobHWBlLCJ8NzzGmaRfGlCZKIlNcgk1mpmEL?=
 =?us-ascii?Q?v9uTLrVyFHnNcSsB/O6yGvKCVBbMUqEJro+qE6IOXAN5pm7OIdaHsmFQXqQc?=
 =?us-ascii?Q?2WsPPrD83tBJuw0Sw/S9KY1XmAdBl0+s+TJWRYPUUznwoMWz2vCtEbHe9zFN?=
 =?us-ascii?Q?6V0v+WX6Xc2D+rqpVVFfg/OIHtLd0Lc6B2Bas499mydxvyADfrXE6d+4idjk?=
 =?us-ascii?Q?YlYHP43dtbt4PDq4rC582G5ubd4zdKZQ7Y1DkUS4JgtMPCpXV1rZEf0cFsbZ?=
 =?us-ascii?Q?ChRpE0UmpU7iUJNhWB6rVdhF1DbCl9vXrYkwx5rOHICcHoaX7cIxzdHnyUJe?=
 =?us-ascii?Q?VS9206m5s7cn9Nw+fqkiS4jo30rSfmfbxayIaPKj7Jvw77h16VTtnECd6RMW?=
 =?us-ascii?Q?D0/rpPhF91rlMvHjT8fr/z1zkxPrAaTIgVUDy/7jBuxsgPjlAyKOKEG+Ax//?=
 =?us-ascii?Q?bdo3VC7IoRBQs0Ta6qcsGn3/oJYaemYznWP3s6Jx1rOefNKbsbxsrTpOSMoX?=
 =?us-ascii?Q?5bD3b4e3mDx3KVhgqLwlbOMQk+6DOeMTNh4jZBCgvSdG+ZsUU9ODQXoV8oif?=
 =?us-ascii?Q?CE2J2278zZ34X9ULkeiBOq2is+30XkWYci0N+xITc0WNCwIMKQMpFBJGujVy?=
 =?us-ascii?Q?4MneUwW7ZHwT47hxITHAyT8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 650415b5-cdc7-4bc3-bc9d-08dd9277388f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 23:38:10.5404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnrzBpIrP+HV0MQJMI59gGJAs/BKg4xbUO/QBGfgzbSgIa3X+Eh9eTmRU9mY4v3Wy7LcZBj381LIpOCjifQCmrRsC69Fp8VO1OFD0HclAtgs+RIsjJYCG31459xbjU4a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10204


Hi Mark

> audio-graph-card2.yaml references audio-graph.yaml property.
> Now, audio-graph.yaml already has "routing" property, let's reference it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

I would like to tidyup this patch.
Please drop it. Will post v2 patch.

>  .../devicetree/bindings/sound/audio-graph-card2.yaml      | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> index 77c21733f9e63..f80273898421f 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> @@ -17,12 +17,6 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>    label:
>      maxItems: 1
> -  routing:
> -    description: |
> -      A list of the connections between audio components.
> -      Each entry is a pair of strings, the first being the
> -      connection's sink, the second being the connection's source.
> -    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>    aux-devs:
>      description: |
>        List of phandles pointing to auxiliary devices, such
> @@ -37,6 +31,8 @@ properties:
>    codec2codec:
>      type: object
>      description: Codec to Codec node
> +  routing:
> +    $ref: audio-graph.yaml#/properties/routing
>    hp-det-gpios:
>      $ref: audio-graph.yaml#/properties/hp-det-gpios
>    hp-det-gpio:
> -- 
> 2.43.0
> 
