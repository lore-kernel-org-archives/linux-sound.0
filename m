Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2044.outbound.protection.outlook.com [40.107.114.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAB825C83A
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 23:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757548563; cv=fail; b=mXBj5PG2vQnRNgd3/yH94qwrtjhEh16PthFARzpXaLAtmg8qap+eb9TE6N48dcnJBq8ITr46kKT2Mq2U3wPssv/jD5tzUYtKk19aViO1FLlAEBdUXD9frGylFoA+1JFG6hPGSQ65B9eHCYM/EfK0FDw79PH8MyFLzJqyrlVoq9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757548563; c=relaxed/simple;
	bh=dtxGpiDVxaqEGaQSWwndk7/3G+hFuZBerHN0T0aRaww=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YK6s4HWsq/EcJe9N+y0qJc7b2dKEC1CkXWWKzd8PUXsxl6f7R8lXgxV5DMMAHKcfeMijcfBW7nb5GzySeUE6F2yEWvwsNzdsf3aW9fPqW5BKXP7qhddYe0o0O4n55lP86UU90O9Lt/O31TSBYHzw577TXzXj3MH9UD2b+j1PgZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eHdyDeeR; arc=fail smtp.client-ip=40.107.114.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eHdyDeeR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i23IO7GantR9e42UsJLtaoUEbRnhtNsnBl72uVWkzUo/iS0fiv73sjVw8jD4AVLzvgMM5D3+Mzb4H1ATwpSTCwEZ7OvNz710Hjo9RUQDWVDPa4K8WPrvLs2w2hdbjepyGd7qEYzKHjXecKj0TuhwEgqqjnt2w2zzmuCRZ72rvWkO917sYxXgSedsBUrdRR4ylXwK3+ple4dND+DIpVEZr8HYIqu5lp5BIwstXKG8UH20J6S+MfGQstb2UKuela8omJCooxmZDjNqiqEe6bzZKhlBb6Pf8p201D69HQZZpyPsR8HpDnpL75NWx1Qd7B0Sg+PiiSvW7iYEO1TrovneIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTvziSTtjzXrd7AZBqlWsBdAomj3oSm0ZR5wJL+NOn8=;
 b=yJb2CL7yc6B40Ou9N+mA6FwVeI/kx3bL38c5CITsBIzKJq1VCIb8EtLvoJh8eiNblIRYjRmF8vWk2PxZ0JanX6QdDio9+lEB1L8OM4vVP1HC5/2/C9ht2Um0U0Ktljr+KTciMeQwMGNL3z/yl+tUtPio/Ma/fWvIAE5WJ5mQPnsGg1kmYmN1+Ep6ANvnDv1FX4P6RZTx+mfSRw1NpOdN/Rmryz2dVxsa48AGD9lB+JNd5kyOmBazMG/s+xdWiT0ptSTvUqrvQoz4MZZWT0eWUQu4mmquyUOisHlEjdxfTW6whTED8dZ8SnRSBu8XX86fpYTHgqAo5YTqspVK4YWkEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTvziSTtjzXrd7AZBqlWsBdAomj3oSm0ZR5wJL+NOn8=;
 b=eHdyDeeRG4+tKRuMn7cCRrOnU6a9er6tpyg7Mihut4aiLQgl9x1iO9+LleSxzbkI2TNrr/C2W0cFQYVT3OIOHok6ZTpRj1ECjgVj8YlWrzdKYjvt3v6Stx8Xz2BXanEi973cN6uRY/WeaaTLX88/vQ9CTdgBfBC1KUutsiLSI5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OSZPR01MB7916.jpnprd01.prod.outlook.com
 (2603:1096:604:1b9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 23:55:57 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 23:55:57 +0000
Message-ID: <87ecsddfqr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: broonie@kernel.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH 1/4] ASoC: renesas: msiof: Use guard() for spin locks
In-Reply-To: <20250910084736.3336686-1-geert+renesas@glider.be>
References: <87jz291yrr.wl-kuninori.morimoto.gx@renesas.com>
	<20250910084736.3336686-1-geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Sep 2025 23:55:56 +0000
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OSZPR01MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 824f9bda-a329-4555-7148-08ddf0c595ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lHUHXGnv8L3qNJ36dnJlemZXVS/N+Oe7I6WGpsV4aNZB1ghnB24byTGnCWS6?=
 =?us-ascii?Q?rT37Yknqhu1Fz+9UxLnz0yypzqlw6qHc4XbVWgqZ8V5VWF0GQrFKEyuDbsG9?=
 =?us-ascii?Q?DpAYTcO9vRiAZ+X7we6sEX2ZOv1fyXYtaANnhU3Qxk9UBqtD1WnGiGzxR9+e?=
 =?us-ascii?Q?RpmPabkdRWscpmBPA2OehFHzstBUO7v7/2ujHID8O9roYxyMxD5P7QenKWHm?=
 =?us-ascii?Q?QaC4T7tquEjVe4vf4azzDipf0pRdoklBaUYgHJRl+AJNf3KAtCia6fw4aIlz?=
 =?us-ascii?Q?MYrk1+hS79WjusCXmzxuhWdQEI8R/eFG12k2Pwk8TWVEfsEYu7C5mCS0hCVf?=
 =?us-ascii?Q?kTM2SODoR0MWnbhH+XvOHq11ogL0M9zGl3SMqkC1jWyLljFJbcTLfz0UvSkm?=
 =?us-ascii?Q?UrOnNczhsDdPnTPycuz9r6eRQvnOAH2nwmkgOJ7MeclT2Nz3IKwYxZBURp+F?=
 =?us-ascii?Q?04k1A9W61CFrLGzaArqOaOcuu6He4LVBgokNjWf8IRD7rb5Gk8wDRPec6BCo?=
 =?us-ascii?Q?I3yNgazYXm/0Z41ll9xn3qI+3oZVtTV00hF+uwpolN4da27jcfBoziynBzdE?=
 =?us-ascii?Q?8ph6yQ9kmnlAKv4urcadRxxi4oMBDSZAIg6CnGVjebD5ml8PCrNULxQH7Oir?=
 =?us-ascii?Q?eMVMz/HOi9gUPwpbqlKl3tdpU2YCDn3ID5cHEkQmyimB0AgziiO4QJSTG8Id?=
 =?us-ascii?Q?XOAnwifei8mP4/9Jp1e4IJciJl58XOTJjRRTDVJaqn7xrnZTiqzZFF7qp3jA?=
 =?us-ascii?Q?ZvqOzX96jYq4102bNjoKiJuUvFVlD9A3AO8soqHCqZPPPMLfxZychmYy384L?=
 =?us-ascii?Q?UVlOrzc5S8TqKnX4H8DnuTc7PWbrBZg2jOidq+rpOTEYSYDjbGI+U1au/VIY?=
 =?us-ascii?Q?WmpMdiGtdRAJUCg+UN7njiD6mUWeLY7l7lKbhM3x11Ov4uwhYmn4B5uDIpTe?=
 =?us-ascii?Q?D3k4e/d6ecA6KqxMaLujXwMVUdBO0BpxehDenlTL47JQY4RXazBNRdTtUA6i?=
 =?us-ascii?Q?3uCfwjPE5QD55ATMPYTJ6g4falASOTR2T44dCYr3Z44AgYY7ljEqYVcr4nZO?=
 =?us-ascii?Q?e0En/6jnhEsefXA6FJy6Y7hb5Srs18ohZX39tJI6VHPHa+7U3BAZU8TTv+9S?=
 =?us-ascii?Q?E/LVZkP1q9TG1i3MHzkauewyYoi4lGcqgKMV4+VNt3QIi0DJwi3FZ0bTnuDM?=
 =?us-ascii?Q?vRRd6Fn30TwsnDVGxBTV+uIglPGx3Ljo58pPmBVdUKc5NOrN1kYKYqbCrGvm?=
 =?us-ascii?Q?FOXS7f9JRpwvlokFwR/LE8sG/DYmT6yRP3gZE2yutSZNf1NdNynpWh0/Yi3R?=
 =?us-ascii?Q?4NwlAGJvR5gRMnPAvDUfywxH3OjRXJ7f6eQCJ3bbSR9M5vZogGRGfNxH79Cj?=
 =?us-ascii?Q?8rBP/OURgQKcP66bRWfTZ2YrPsBsemSalIdrDSsikD/NZfxI4vCHDbzbLxdH?=
 =?us-ascii?Q?AHnlx9Z0ijxJrFVt5gkkGBOon90tQcjshkMPprSLVN67bbE6WKWfWtOc82e3?=
 =?us-ascii?Q?T1lZmEmi2BrbD8k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qIRCFUvjSPWFMAQPuXt2sAQUnldY3W3SnP/MrcLjivakEDG9GHI1Y/CNMo5Z?=
 =?us-ascii?Q?6AjYn+mMrH0YC/NqI3gJTqELSH95fiJEmfzyTqiA+rQhuKnvemFAfDdA7Maf?=
 =?us-ascii?Q?IuOa1uRfgMoJJtnwrBgH6yC6QWMzhWaEvGUkQ0evqH8UlmUgz7NvMJtREuVq?=
 =?us-ascii?Q?VPrQUEBPAnhqWDfybNSUj8Vj5AXexMI0NILCcgBWLdAx9rcTRPPskU+i+GDs?=
 =?us-ascii?Q?Gno+2kOC6hJjWUg0n7q95c5+/VskPr9K22BeTcC0y0t9aE2AOaRzEmCiqHei?=
 =?us-ascii?Q?gzIzg48onOQe1bBPGBhfllUukxGpegq4GZmc97baAmz73glmXYk3gTNjlk5i?=
 =?us-ascii?Q?xDsgwsZTva8QPCd8xlUxFYGjvIm/ptlTe96fKZeibJnMbMB5TrCfreS/K9Rh?=
 =?us-ascii?Q?EpAE8LNjOyGr02n8ECPHAtrcSWpX5Vo7woOIyXH2PlLXihzodYTFZ/mwBo5x?=
 =?us-ascii?Q?+xC9p6WpYz4TF6uspOwg8XyVtLqmcPtb1g7VEt0JMAomXJME+4E7egjNI8AL?=
 =?us-ascii?Q?q3IAU2e2YSuIUrkG+IV+lmIsz8KXb8vL1PQmu4pnsrNTOA9ohHvYYFaPADFT?=
 =?us-ascii?Q?fZkzfV7JyamDb0M52BWVl4r+SOtNl8xttawKAJ9WfAflET8MuIEYVRB02Oq4?=
 =?us-ascii?Q?aKcuPXuhFoQDxCDYPpgHW121pjVUOCpGRekCicqGe9DDWX0QFsLrtwfIGYqo?=
 =?us-ascii?Q?O55tJ1iVrHDpfQ+VvW3P28R743/Zx5M+q7+4tdQvd7Qn4DGDzZOpSvhd7DSv?=
 =?us-ascii?Q?CAh9pgfN5vGJ5ZYWiOMB0bS0UdxPG0cBHsgFa/y/BUefSWIi4u7A3dpkyd5m?=
 =?us-ascii?Q?rBjX8NZS/2dOoMPOwyWWO6WNGnQMJl6bz5NRXypZUMPsyl7TOSauCcM7kyUi?=
 =?us-ascii?Q?oNUPlWVplViTW7UfYZ74DFb7vnTcgXrNnYlzLiofdp0DVkajFPEvanNxJ9Dn?=
 =?us-ascii?Q?AFyCx+VItMPBbpHqf10Kg6jf0mAu3IoEHJyDTZ5mGb2yCQspFPEGYJQlRR/z?=
 =?us-ascii?Q?FDs/9Ne0WVJiwq6TWAbWSNMY9F1UnSOSCjRVIHHpE3I0lWzongw5M/G5DnM6?=
 =?us-ascii?Q?W6lsmiW69Ml79C9tkIfz58U2Ju2m+9gICm4n8Dy49V483gPVU40/vWdiWBWH?=
 =?us-ascii?Q?5Vnm6SB4geaIItq7MnMwhXOGyOriJJaHJFAhmAfxd932d/QYyn8SsNyEqAq7?=
 =?us-ascii?Q?+MaZ9EPc9b5S0GpKXsHuIrmiu0LVTqbNN+dj7mE6AwfE59r6o0oFAB/VSmBx?=
 =?us-ascii?Q?+12aCFzemQp1LIcBD+Y3hezru+erky1e8mEopVreCSVim6+cYU6ch6fq+jOQ?=
 =?us-ascii?Q?UUMgf9AGIaZxYrRQVk3K95tFkzRewbWsBL+n31R4h5762BMOTDvDZLR0uJCc?=
 =?us-ascii?Q?kFXRdajagOSEaFxAGiRgfTz6EVP8jMoNyvZ7q9DpMxM7R1vDRfzem5ZR3qZG?=
 =?us-ascii?Q?b/pCh1fcFxiy0mlqR+yuDkk2stYquRjTeGgCifyxfwQzUDEBsF2nSgE+2oZU?=
 =?us-ascii?Q?U+6gwnk9I0c8mL2ANHh0zVT/gTahmCRjy2LqEc6G+60LmA8X9RRrRUmkY2Wa?=
 =?us-ascii?Q?q/Gv8K00saJg8YqSint4MPX9aIUs7OqXPheNkfhiv1Xgo9c5niUZ0qOFtlqL?=
 =?us-ascii?Q?cGGdK/+ltz0JRQhKRA6ya6E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824f9bda-a329-4555-7148-08ddf0c595ce
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 23:55:57.0227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zV/8NoX9dVcxJobW4nSRP1i7AqKyyKyrOdtfDz8ipTwCxmnXQgqFK0QeGFhcUtLadBj5VN+N5Z8NW6pm+0297CdSOekc+bKtRlDx2j27ba3stB2WvLfUmhSHF4qSFVH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7916


Hi Geert

> > @@ -372,10 +372,9 @@ static int msiof_trigger(struct snd_soc_component *component,
> >  {
> >  	struct device *dev = component->dev;
> >  	struct msiof_priv *priv = dev_get_drvdata(dev);
> > -	unsigned long flags;
> >  	int ret = -EINVAL;
> >  
> > -	spin_lock_irqsave(&priv->lock, flags);
> > +	guard(spinlock_irqsave)(&priv->lock);
> 
> You want to include #include <linux/cleanup.h>, as it is not included
> implicitly on all platforms.  This applies to all patches in this series.

Oops ? I didn't notice about that. Thank you for pointing it.
OK, will post such patch.

... or can I add it on <sound/soc.h> for ASoC user ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
