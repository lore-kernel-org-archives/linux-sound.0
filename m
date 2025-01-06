Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE05F17C;
	Mon,  6 Jan 2025 01:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736127282; cv=fail; b=rlVng+XQxC3hFyrJHawfOW7P31Tp7XdImjwBc1EPVrp6mEJVw63yhmS23JYuyZr3EWoHPvfJ1e29yhiXC8FeyuTY1B0CX5gcgymfCzJcRtu9JMCra8dQHxDHru8rDCK1Jph66xCLl96tPVxdaqLXQzCYIE+8n/aA1EkzLgEV9cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736127282; c=relaxed/simple;
	bh=mnDZDrKSF9ng9MCdYvngf+l0SvXn5YUYRdBjoyNqs7k=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZPNZ8Pnq6HPYXhyu5B4NO8C4LVQET/BX6r3iCTalpZQNL4IFabzebuoqY49svBpuPdLtnvQ0pyY7Ln3dOnMA8kXFKip38KNwf15KVx/OHnuDNCJ1ey3gY2jyGzOFxUssxTfvh5QPPtdnvE5vXarsAaS0ErDyGLusFLHdPbnxaGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RwrcHU3H; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RwrcHU3H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLDLGi5QHZlrhH9vmlYYa1U9fm2Ohh8fWg2aL3t/hEmIvJm5htONrDGLVmLOGCCEVJL06gEw1Y/l1pWyo4QT/2CZpiva08i4idxtF7priVsJapmNWSXsBNHksQwM6jGp+IQyNFmsPTA5j+g/foBrhvX5uxtw/xbO10kPNi1usB1VbzvGSGtcEJazhQZleHYl2eqreQNM6drUBp6Iq0He4dvlvyhuOXVoHc+OC6nkz7xsGtH7lSTlfLVq/iFNdXUl+b1eUye4mURRX1m3EDhkLp3BDhtZafJNF8PfYWMDrx2THZHjGGRW0K4F2Rhg+uS1poBuX5zzf8Vs1UPKZeOmFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rF59+BsitkPBgWUa+/nmDdXsn0cS5d2IfrxYUhlNpGQ=;
 b=hwuha/YJ8uPxzax2/tLYUgSl7h01RjcHcvAAOa9jz5+j1reLhme0WXy6DCe4/6i0xwV2nJaJ37DFI/F39qA4X9ZcW8+GsarFcw0L9QtGGWO7RgeHD8E1h5BOmRngWpOY8aF7Ck7z7SyfcRbLlXBC2dIPCJolzG3oH2iWpVpp+xoNd3KWKn+RhOoNIgOsyjpp3T3YbqtqYrlciu2FEACD4eZLOq7e1q44fBC+XC92dFGT6j3gTYcjpzX1nREGn79DSF+EWvMUxhJIRBIS0ts1POHg7lefJ+lYO+jOG7SuoVi6DLSiXZ7if+s0gztahxs/NmTlnScOeCoVO9H+CSktYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rF59+BsitkPBgWUa+/nmDdXsn0cS5d2IfrxYUhlNpGQ=;
 b=RwrcHU3HQl9BhRllljhX08M3OwomJKGEStbXZXleCDPstRTm5ej3U/57y77oUOvPNYPuKfGutbhGn1wa6kYusjAY/A3BMgzdWnGOEQU6eaOuHOuS3c2zKuAEUQ7c7K92IXbvrpYT7ksy6MKNN9VfbrQVNso0DbXipv15+tm0pT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12918.jpnprd01.prod.outlook.com
 (2603:1096:405:1b8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 01:34:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 01:34:35 +0000
Message-ID: <87ikqspvx0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stephen Gordon <gordoste@iinet.net.au>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] asoc: simple_card: Improve debugging messages
In-Reply-To: <20241231033841.6213-2-gordoste@iinet.net.au>
References: <20241231033841.6213-1-gordoste@iinet.net.au>
	<20241231033841.6213-2-gordoste@iinet.net.au>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 01:34:35 +0000
X-ClientProxiedBy: TY2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:404:56::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12918:EE_
X-MS-Office365-Filtering-Correlation-Id: 260043cb-14ca-4ca1-cce9-08dd2df24717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Em6B/39va1r1m65Fq4H4kJWOAAUA3jK1qtDnwuhjcqEUqYEdQoYaA70JGhoV?=
 =?us-ascii?Q?Ewry1bx53+n01xNmTijZU9FTzEkGoLfCi78tB6NEYclBx5x1HQpln1uY6v2X?=
 =?us-ascii?Q?NcL6SsD2ZJ0GplcxkmfIRLLFy9KxQSbDqZErCediswPrVAsOKbUtUvLWvGfK?=
 =?us-ascii?Q?adM+G3D6ce/9r/3tiI2A5Jg/bUgt6zjwL6FO/Y2818Qs7OGqPpZyeqgZrJte?=
 =?us-ascii?Q?tmMnoQFHbli9ZvvquZNHUPWaiXx0ayR50rFQ4qwrLQb78Lqq5tUt6LRkXxDD?=
 =?us-ascii?Q?d64UkwrF4tLhhcX3WkbcJhNB+7NiBRyPMEJgTJaFIoWjsna4Wkubr3Xdl6qf?=
 =?us-ascii?Q?gi9ltmuV1ISzcPZMQCi9BZxcmcO6dSdZnSSLdEkTY+7xD984HcC4Hm8ay1Qq?=
 =?us-ascii?Q?sDmnrL7nPhKnIYyiJfh47kmwT6EDGbp2s1NmfB7+2/bAAV55zfVjP+rnS9Gs?=
 =?us-ascii?Q?0cD/IdN2qIj9s78FRkeJpO4Xt5c39yf/uU+HQ/577i3ofs4SB8LkBAkv7QGv?=
 =?us-ascii?Q?gRioN6OFGxs74vV8TizIBeO9zDkUeIN2MvHrAm7DOAWaIUedFkSuI2wg2ga0?=
 =?us-ascii?Q?0Fiuay80U+OEbeV+RvDesR0VhSdiOawP4ZptTG7juDDqraYfCubTDVhsF9Wq?=
 =?us-ascii?Q?3ftrhEoooktbaLmW9ERXp9khnpCeX3Rccx9WeZy1x4ERl5dCPxKBo9r1RntN?=
 =?us-ascii?Q?VYp541wwc2oGnAur/cfhgIsjLHiLCz7kYWnP+DWL6PjgPiy8qCdO/5k5eA77?=
 =?us-ascii?Q?LKwvMOhVa3f9iW81j450WgW9fxish3nMogDixpGDwdE/v8BB6eSCw7vNg7aF?=
 =?us-ascii?Q?e5Pgy4qL+WQdRIHc/H8ja5kbWDjanICOJkY+YaRj2FGy7Tmx04M6zWesrjXC?=
 =?us-ascii?Q?UcZ7wPobleMCzy0Df9XmwEz2ISh6Bml9DpTFZimiy4y4TsR3TXeydnIqKLa+?=
 =?us-ascii?Q?2H0y+rftZYNBdmdBOuDzB8pnDLcY0VD5oaze/s4Yv0FXuRN0PGfrBFEdbHbR?=
 =?us-ascii?Q?Ew72IElyfg3TQhPXQ9h4cVvXcqbX3zfeJD5qLUJrkywZb1gqZTve95ddAVQH?=
 =?us-ascii?Q?2V7L05Tlxcglsf4rcVorGb0Q4GVO9H73/Wqt7aGuIpAhYLmCWWIJvg4xah99?=
 =?us-ascii?Q?4NgqxrLoRmLccshL9TwGm3eIlj/rovblsDM6RhmakH3ijI5d5MbrN11zbzI+?=
 =?us-ascii?Q?O6wRaALypjNpQy9N+iK/AJZzX12OpGHBjsKVsCLCzxE7+YFpE+RfTrt80B0D?=
 =?us-ascii?Q?gIJn79x1pIYNQMGhPgyVZyfwTcNNXjMqVywotq3Dbp131MFwcrLKX1EKiwMk?=
 =?us-ascii?Q?A5KsxFL50ozfoPnRUsMnwbDdDutbrOlqCOh5lTGsQ4qXqW5pmiJ2s69nzv5e?=
 =?us-ascii?Q?UbS+v41qORt2n1p29LEo4Sehcq6KR9kpbSPozeWY4BQ7JzEpbQsuVuS5rbg8?=
 =?us-ascii?Q?L0zILhvfitzn6ezdWhSAcdLqfqE+WGK4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lyT+pPfp81zYCuV0IQOaSDBn8PYtCBKOJ5jrZ4ciO2S/sKrVaB/d9rZcfYYa?=
 =?us-ascii?Q?IzBIGJaUIFomt0y4iv44hwuBunYXXNYyVEm7GMIpmhYusUF2Q6L4ZzlKsgAL?=
 =?us-ascii?Q?YQaSHtIj8UZYUcA6pyG+OzMjonkvZfWt5LJ4UY6nnpvIW50LB3dXmkljA3qp?=
 =?us-ascii?Q?c6y6sMDjaf6Yw0Ww0/1yVtTKJUji5Xw6il0nbjbh+EyqRRpmt6TQ1V7MRFTP?=
 =?us-ascii?Q?rd6PfXFZfuu/AsihwPsjddwV4rqHhbLx0bQ+NOX3qPFNmLruY2eiPUKorQIH?=
 =?us-ascii?Q?VwIa0pltCyrmBvj17TRuZhe/xTsQQup+p790m7r+VlEvE4bc7j9bhpDiIJKU?=
 =?us-ascii?Q?4Dcfmfptg1uDnMTCiqo0EzOII1ElsNX7J5qQ/9skvqMySG3PdXK9yws+/cin?=
 =?us-ascii?Q?dOU01o0F+AQ1x1fNAQy8uwcQh325buJAnM7c4oLUM4o9eoZZtwc26CrFYOtT?=
 =?us-ascii?Q?cpIHz3r3uRhMw93TYaHZCO8EAFz1i/aCCgNj1JOCbSh3xozyM5cKBRFa2n8D?=
 =?us-ascii?Q?faC6iyNRJeQsARfuxJ/HvIHOWK4X/8PL+mi9Mp6sXhNHExHcsPoas1phxX/Z?=
 =?us-ascii?Q?IgFocR+40R5GATAxPtZXraM8WxR+tFOmVni+YdPvbwmPHTUZUf8//p6iPp4E?=
 =?us-ascii?Q?CTURpUsCzmFClBrE51BZD6RQVN7CG+iJaAlfbHue0En/CcsPOOuOGhhxWzlj?=
 =?us-ascii?Q?RUlsi9n4GqcMMP8Er50dz01G0tIqOfTU3qZpt7Hc397IAEpr6xmFBcWyrp/l?=
 =?us-ascii?Q?0ND9XSOz3Q3HETVwJ90bdFUvH0fSftT4W6oWNlJQ4JtXSEoMBQlEq0I7OES1?=
 =?us-ascii?Q?dL4v8Q+sd7iLkVRc9dnscL1JeJWlRmA8QkwjiuvPPCFT3D1Rnyse4fm7Eyt2?=
 =?us-ascii?Q?w+4bwXeLnG+in6IuqNdeg+thOOMVLvlQxrKelJkgkf0p9ReUtCsl6tHEv0U+?=
 =?us-ascii?Q?wMJmizw2ai7PvmiBKDpvC51PXC72FFgTvXyDu6j7Bk3giJWW1X985GCnAxQh?=
 =?us-ascii?Q?vJkRUMUYFcI73dDLJZZmwuoKiUM/Hdjfan83LJ9daco1bHP/LZLmnsH8CGvF?=
 =?us-ascii?Q?axeePeiSY5jzZUWkZlbzUzsD/I1jcNQHhr2Tcv+h5o9Qi3s/t43SK+tJ3bHV?=
 =?us-ascii?Q?uh6lr7aud7w5fnQsJJFpkhFLoamFiyHjClmWJYpIINXbdRMLdYM0XzQFrhsk?=
 =?us-ascii?Q?PkTp26bDYzq6zEcxMIIbK9/MWUgCYtbplJzZ4hz4YxP5iBAJLdc6SqnVY6mv?=
 =?us-ascii?Q?mSTfvf0As7i8UXPSw31bvy0xspgNWB17UIn3oUFnKMDEa6onw0Q+RjBb3MeN?=
 =?us-ascii?Q?34vOJw3jxOnxspWniatsDdtv7/RCmwSJEyO3GbfV3VzIJubTBitHalvr2DNO?=
 =?us-ascii?Q?RU+t0wXA5NHC5eGvnXwqCs09fzar9HAG2yR8XQLwOmB82T0JFs8+UH4OEoWc?=
 =?us-ascii?Q?uOUcA8rCiPEjMCjb5lF4Jxr4UtcOFBHcBJjwjKYNsLPFK5DGGS3pTY4cutS0?=
 =?us-ascii?Q?iDlI345zjUxdrnHsyiuB7Qlcd079uQKCqMo/IXRamBATUBe4ZWzkmUC73Ire?=
 =?us-ascii?Q?xUJkc+2aQBKfOQdQh6BhKJVIK9t0FkUc5IFjlS8xnVzHWUvkq18J2s+z7wgu?=
 =?us-ascii?Q?76pPSAkG4VQp9xHL58e9eJw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 260043cb-14ca-4ca1-cce9-08dd2df24717
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 01:34:35.5911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S84TuKIovEhWhbsy8sIidLz9P75eFgJ/cl7Cg/Qxgm8Qs0vxUV1vzWM3KNArP0vHhjTQUkbKZxWfUwPNHO/pQqPITThZ8UEPWxHWfiqTun98coO3Ja77cVShi6XDvj7Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12918


Hi Stephen

> These fields are from the dai_link, not the dai.
> 
> Signed-off-by: Stephen Gordon <gordoste@iinet.net.au>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Please add "To: Mark Brown <broonie@kernel.org>" on this patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
