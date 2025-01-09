Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891474A1A;
	Thu,  9 Jan 2025 22:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736463183; cv=fail; b=C+xe7wiQt/uOShi/OCtc3A3pcUzHfRQmo69o7XJPggGhnZb4+8DCmP0eWwkBQliYWYOHPEzRZd+cwgT46qJiujRV8I+HmjKlGHEzV7JGhnNhqD9SGsYxamigUvMBdQAjWiCVUC0jfaDnU8S6p3YxqGG8WMRyOtDWbhOZWMjNJP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736463183; c=relaxed/simple;
	bh=uGXGer8ePicYA6i1LMyCu74L9wXc834WEHk3MPCvUa4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=U+8xlLHG5gFzCjdkQaqUxD9jO65kEEa0E0FsLquOMWZs57GzvcqBQzexGNFpX1D7sgOhALiKvre+d+taTIyDEZL6xZy/F9FGQ3cmEuK8w5r/6mb/D9s+JT9u17ZcjcZ5U+HVKp4v4TvsUpOkQUSbvmq6owlqwpcBmYrXT7JNo0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XxDBrlXh; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XxDBrlXh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzhScZ5GRSQ2ajXE1fUeiSTe9Z62F7WgpPNT6k4z25z81BS3liQpjetmYWcJalogJUe09ESRHCSaAM1NvckLkr8AjPOpItjwT96J1dHl0Wy7g2FKKBGJ4RnrAPpKe9qwpaXb75Kc6Rd8hMBDo4L0eMXqyfmdaJ6YmKwBj1Q5KRHItgXtFH1vL+mWkjPey9aOn8THHH2zO+LJJZPppQHTuOrFbSixBHftL19t+tERXWWnGNkX/u6nJ5j1HT+ylBW5VBZSwLF3K9Rufio5lS7vZiOC10o+fUtsQ7ETokMC0plyVwffryKfPj8vRcmwrRXTtOfLMKjV4TZvxS1RTRFjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2X2BZHAS9W6sWOJzcd5cGrNYqMtLlIXZ5Bzye6gHQ0=;
 b=fHqHjw7hv7b8EZ3rJenc4R0Z5F8z/FrHlp+kPKx8KLvUJK++jmikmfj9rVbqvpN0MRcuNWu53naKqMO2mhkgXR0vWSPTX1VZNKgS3cQUdf5iCGWR1Qs3AXpAXh8Nqp75EcDK5qVWYvMjAC7VUZ3j1PCviIciOQPEsKTB3mz/ZKDOV9rKUTIftBKVMlA3aVJjcvykNj9zHAC8Yl37x2CSfexYTxoXCHzRk6Py4R0AlphoEfwgQz+T33Ot4u2DCZiYSYAbnUjOlLRNizDynOfgbO5fph4DbLPYP3Ns1CpHMP1+Df7JVttkSBQLaXiyMIzmBcB8qkrtqA5PONjbcEBD1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2X2BZHAS9W6sWOJzcd5cGrNYqMtLlIXZ5Bzye6gHQ0=;
 b=XxDBrlXh9dW9/Q10EYDaLXLHjmiokrKNmitDTcqLu+AQ6MfPAzWTEwD7kD/MsFvaHrMac11nEhvEQTbT38/XGBmt/obEZ/x8tH1TDnTdkV8bPHMvYzzdlBLGVfGXhVgT/b/Wa6kxN57r36mbMy183AnPXg+bIQEkLnqjew8KKlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TYYPR01MB12225.jpnprd01.prod.outlook.com
 (2603:1096:405:fa::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 22:52:58 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 22:52:58 +0000
Message-ID: <87h667wqf0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: simple-card: Drop unnecessary "dai-tdm-slot-width-map" property presence check
In-Reply-To: <20250109182202.3971965-2-robh@kernel.org>
References: <20250109182202.3971965-2-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Jan 2025 22:52:57 +0000
X-ClientProxiedBy: TYCPR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:405:3::22) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TYYPR01MB12225:EE_
X-MS-Office365-Filtering-Correlation-Id: 5884934e-3a47-4cf9-973b-08dd31005c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MbYqTuGLC1sXtvnnHLeEoCxmKFYMeKAj78gfaoKAKyxddeBXLItl+wI5muhB?=
 =?us-ascii?Q?HXeY53E4UBeWBsbF5IlpEx60SHl6MT2hLIPUp6edPO2h/G2YwHDsfXNzoqdM?=
 =?us-ascii?Q?dDVGZdUs+Z1N21er5qf9xqK6GnXXLiGkw3vcWpfJFr0u+Ua02MP1TtHwtfW0?=
 =?us-ascii?Q?oeiLhLo1W++0FQ/NVRHZbD31OcZDCwk4GDWDQ9uMZMqTBLLvDvQqcfc3Lg5c?=
 =?us-ascii?Q?aq31+vh96QQYu+DSy5wueHvE3ypWvgA1dcxhJ3PzrWXDaPx8x0SmMyZP4TNb?=
 =?us-ascii?Q?CguSRD/SupHABbrj+elr98pUlKtVf6TFku5FmwdDYEfCVI64eYV9kFaP1LZ0?=
 =?us-ascii?Q?Dzoq1f0dw1kiWJQ83OMnK9eNmrI5g0ODD8baCJRpJg2gqVo5F5udrENxWl5y?=
 =?us-ascii?Q?OeszK2hbqP6kWFpggMoh2OfzvzFQLpl8RHNFn02mXnErbd3DoXOeR2ccHd4O?=
 =?us-ascii?Q?Fy7BWtqyaYuVcUfrPBuSFHCDUZnuuGyQJWNfyMeCB7ma+79Tw+E74Cq5m42v?=
 =?us-ascii?Q?jc28MkYi5f477xEIqOO+5+47csKj0SA8B0VSLoWuMJlwMtwlf03m8M8IVY/B?=
 =?us-ascii?Q?/A00dDELGx61OPSZIjeYl/nGXZlU1a/EcNt257kvQE8RRl9EyMy1luvAsbj+?=
 =?us-ascii?Q?IVGb6zrRiCzTLUuceOLwBsRH0R3/+47ORDbvIwz8rgfpd2wUozqeBF6EynQM?=
 =?us-ascii?Q?G1miTeiy/UTaYoPXqyFV3spyCCC6shMRmoYbTk3qynGzKhz8I5o8xvdQYpnC?=
 =?us-ascii?Q?gWwyOdv3ff2vH5MwWCKi9/Zh0Y8a6iita8/ju1PyWwsa1+OZsBgNvde4beZS?=
 =?us-ascii?Q?NWkIpVLamCo/Ry0m5t0zHYlJKfAsaMlM9iL+30PBbxv/2Ox3AspkzuiYKurU?=
 =?us-ascii?Q?89H4UIlvqX7pBYThYn6MjeBoWMlmpaxYRery8HB2kYsUeMBsyRHGinyR22O7?=
 =?us-ascii?Q?0iWQO9Krj0rm3x/vvCoDfAu2cFRVLvA1b+NR0DTvzJ6ebrnQpl0NqEKLCV4A?=
 =?us-ascii?Q?iL9dc422GFvvY1euGkUFMlR3G8N3GfdNDDVMTHxs0asAavQg6vW++4v36GbK?=
 =?us-ascii?Q?/U4KJUnXdKzU3JaoicUKVgvpJbqfCKnU3xrPPnr5p6hFgAkTrZ3EWaKs3Jiw?=
 =?us-ascii?Q?WKCzrzdyrfZnu73Aj3XC2WlbTzCwMmzjtuUoqSITcpxIdedJXCIzrQ+3JlKh?=
 =?us-ascii?Q?M0bLv7l2AlkUkJG3zcqsolWFCXuhnPD+TAuzsANoZxnoyN4pipLwUFdSUm4v?=
 =?us-ascii?Q?KV0S7gRzYbTD/Mw5njhM7r21SRSbl87ABK64OE3ko+unL2BRB6wAZhgiBqZh?=
 =?us-ascii?Q?fpBDBqbp2bjkZcjgX8g1hk3E93mwH/nysirbMiYJAe1dADht0Qn2Wzdut4x5?=
 =?us-ascii?Q?Q78ApNmsNQcOMuU/3+SDV/NyDV210RVIruJtwwsabzU04kbWoQEnfIFJ46cU?=
 =?us-ascii?Q?k9eLbVh+GPPIYemwQLAG6rZhz1/Qo79S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QNSOyq6HrKnv0aln0fsmAPQzGdtgdlFCMnf6wQZ84tQpCm7MBAgAnBD/I+lY?=
 =?us-ascii?Q?jYgG8DpeumjaRqtGPqhDZlwBXSZJvTo+c+hElxFBAOn5qJ+BTefiUnmkW3p+?=
 =?us-ascii?Q?h/kMoHxDxypbodnrczz7g7rzFPAJ/X1ANtvZcfz/NxprW2gyG6Yz7+QAOLrl?=
 =?us-ascii?Q?rK5nLU+n7QNCQZi1WyaxQ1Gr4JDBCsq2HaVz9uvgQ9VhhA0T+VCLtuCgK5Jk?=
 =?us-ascii?Q?kOesUCOIugadtq9aPIVBOq5M0a4s71BYLxgYmrh2y4cJPQtKWBBdJ7/7gtty?=
 =?us-ascii?Q?dyfD0ZzkBuBsYu2x0Dvbr1Oxb4c7tNfcUvVhUi5Xp0iyVFdpCCmO1slzpi/O?=
 =?us-ascii?Q?16d1YSrS9C6Auh1zZlIGlmeDWh/JlB1DUEKQ0rkydDVvQASNbMmCuNr3jy45?=
 =?us-ascii?Q?KOS1yYYsYwo4umDrDwVKreCecpWsOwalSrVxAvMV2DfQM5EPPvQeGCTzlR78?=
 =?us-ascii?Q?VoNXpu0nWJuX0/VeNJNPtncwNl1IHyAF0rZKmovL4udcms6b71/QcmrAh+ze?=
 =?us-ascii?Q?7EU0avwB8yTi9kIoZpENUV+VTiw1tpu/sHnF1C5vNeE+qBCqQMsX+xpxj7FD?=
 =?us-ascii?Q?8QD+/6ZmfrQUqAaX44WyUGyPg1dh5DPAsA8kr/a+YXZoXHI/IXEToCpiU1gZ?=
 =?us-ascii?Q?pmy50nn8wLFPpPtrVWPjpOIowu/zsmBpg4rVPpHBvWvBYtj4q5UMEOnTP/Xq?=
 =?us-ascii?Q?wPWAcUR/hKdsjgqnvhLfebzwQkefppaVfquYAyOPiadhGT9Vw8SFrzXv7yy9?=
 =?us-ascii?Q?e1YqOAaE/sg5sytLogPoQZLQ8yks8VILlLtr/XJ7v1vi0oPSea/9PaUBDysn?=
 =?us-ascii?Q?JSFGMfZW7WP1EyxS4JUwpTfEcKHqej2Fro2ruzUsldDXB1pHocEhNkEtpYjn?=
 =?us-ascii?Q?eLli5I+G4PkhWA0MpWfJ9y/v+ZKb/66bU7n++zi8+wUt16S0nQNqm9IRinj5?=
 =?us-ascii?Q?J3b3MlLAcEfLLXFd+FGvZDfSUoigyYgoNWalpB5Y7HCXjACVY9somfiwrV0S?=
 =?us-ascii?Q?o46ZACsMQVKqOpjIZLoqWY+B+tnqAar/vK/1QR+Yc369Ps9L2wHqOSbiXRf0?=
 =?us-ascii?Q?C4M8AxHP/JRY8fYxdZUdDVceG0lt8xkRd9wAW5uBzUMTQQueEGehfROcF2FT?=
 =?us-ascii?Q?24f45Kp+FSUF7IKqjUSCXwYxzsCIthWNf+YtN+laUNp5jCdttTN8QPjAMxR9?=
 =?us-ascii?Q?IJcjf2la8JEouNJpwMLUN6Wp8aL/qSUc8s43gHRu8TRAEt/BqIdOALA9Pkfr?=
 =?us-ascii?Q?8PwTtxWzh/x/adzjLLoOgCSXSiZU+/OBx22HiB3jn9+cam9kIEN7vXbn2Y3f?=
 =?us-ascii?Q?lD78jiNHDwSJO88+oUyhAXiefWPgPXtFklqVKtXdjxSQCJ/1J6+MAIR6HiC4?=
 =?us-ascii?Q?3BYKlJtAe4q7mbI2K3h77OC/xhmQ/AB74h6+QP/tydjPPmzmdL13oyN+xwLg?=
 =?us-ascii?Q?I1yF6DecZa4chU6mWdzHwrkbcDL5RqiJN3U7rq8nPvv9hmw3OBZrwIk1/rQi?=
 =?us-ascii?Q?KrW+R/SdulljInYmOboe7uqnLOkTaCfg/MZWLZiUNqMvGWjKUc0fjtFzWgbv?=
 =?us-ascii?Q?r1XHjW0fdwGQknSUL6JHh6SvbV6rfhavrMMh7BqaRG/X7pP2mRzsDVpFlMH6?=
 =?us-ascii?Q?3mxYvQgrVQz4lLYb8uBt0Xs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5884934e-3a47-4cf9-973b-08dd31005c8f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 22:52:58.0048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSLhejYb0PaR3uyKwRlI6iL/i3Y0x2cqbnzT8zZ12QgAP1cn/vpdwwBr+pjzYtCUnntA54hdxLglrLAenxhjy/mSK5TOqxVfhEq6qYsL7R19eFpv+fmspp1uVDqdQqJd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12225


Hi

> It doesn't matter whether "dai-tdm-slot-width-map" is not present or
> there is some other issue parsing it in of_property_count_elems_of_size()
> causing an error. Drop the presence check and rely on
> of_property_count_elems_of_size() error return if not present.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index 91325286894e..e25b387a9776 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -139,10 +139,9 @@ int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
>  	int n, i, ret;
>  	u32 *p;
>  
> -	if (!of_property_read_bool(np, "dai-tdm-slot-width-map"))
> -		return 0;
> -
>  	n = of_property_count_elems_of_size(np, "dai-tdm-slot-width-map", sizeof(u32));
> +	if (n <= 0)
> +		return 0;
>  	if (n % 3) {
>  		dev_err(dev, "Invalid number of cells for dai-tdm-slot-width-map\n");
>  		return -EINVAL;
> -- 
> 2.45.2
> 
