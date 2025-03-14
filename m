Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0513C15E8B
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 01:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741916602; cv=fail; b=NjZBt/jA7KyKdwtiroTp7L+wxeyMc8lryi54P/JhyNJ8JqdF13lYh7SZyBv/Dai0oEPkRAUSCX5jf73kw0i93NwkRpOvo/I5xbUzXwN7SrPDyvhuQdsp9Zzwl9gRvAtMphLUECFn4Vuyx/XVaRrRpcX8mrt0GhakfIn22g/TO34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741916602; c=relaxed/simple;
	bh=r9uH5YPj4e6/W07qzA8ycO3QUHE/RMHii72BL4dBoUA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Gr01GiwjJqXqmfnuc+3CMn+19ckPhg5WNDr0BlWxDox7FluKnFwKBzNuyVtKAkMF7HD97mCGODv+k3vlYkqP1gjJLAobAs04p7rXJs8ME411pJSG9HcUg7Fbux2g3F1pxRXg/LQEGPNFLc9XRQE1Lu6Lxv4g5kVk66rb1HjEar0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EyF5CAz7; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EyF5CAz7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKUqdh7PX74hhvnKDiYzb0VL1CpvoXIX+gYSQUDOK53H9UzdCIdMJEynB+y8RPrRwKStifLVeCM6lrXqMUgeYiMeqsv8XJzzV8Uy56BpRkyzMPczdONWXuJvtCK1NL1WSkkxewnIQlKJzrOLl+WcYCQAAA+TQU6AVqVM0h58G+nBgD2bJXqkhKOSUMmOPAGDIkXJAe5Mo9NX3VS0vCnpLBIN2m+5gX0J1VovVTcLwrxsHKXh80Bvzc0cepX27owylDSAfs/T/yj5MF+yDJl0UaYDUCyDkz85HyY/N6jRNj80nQYjuixTFWLnzhMkB9dAvur7KFb4szrnc2A94yGCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTPes3Fq1De5Uazyyo6xxIBU3BbHLYThi9dJXsnpCBI=;
 b=LC9Ae5xkxIeG7U8tiUtGNFylSW4pwM6iVO5uqCxx6gbQi+bq6sptnYrD++hpv7nByqmmBT1WtlKN7IT1KkaGQfMuWdowI+0LihtA4N4TcBFdQrk+9Bv2QF1RKC+z62aNDfkZu2fP8FiA19ksPy+LaRe1YYe/9hCZa3Nrd+BKFwFctcf1YlZAYP+L68JWspLXZN14MggcC0KuBwFVLh4+UVnFgVy0RTYeGWv/EeMle3PAGvBfB4ZsXEvQU3Br+jjew1PJ8B/Ahi6zGjKS5Nl27WdwmaOFwIW2HiweCYSUGoNMgu2aj+XlP9so6NeBHE6FMeCCxbEfxFYob2VUeJwTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTPes3Fq1De5Uazyyo6xxIBU3BbHLYThi9dJXsnpCBI=;
 b=EyF5CAz7zU7JYziugctGT2MLgLad0nhatwCi5D3wC71FGHeE5nv8esD/d1xENIFS7SIkdfrOtkduXEHepyT18OXDpCmjpJqZ8sycUkitQgl8iQHQePiAqK9MBUHdjOKSdEm4crIB0QnAxKzlpe9PbgynmcN2YhAyos7xUfQsM84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15523.jpnprd01.prod.outlook.com
 (2603:1096:405:288::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Fri, 14 Mar
 2025 01:43:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8534.024; Fri, 14 Mar 2025
 01:43:16 +0000
Message-ID: <87jz8sjsjw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 75/89] ASoC: rcar: Convert to SYSTEM_SLEEP_PM_OPS()
In-Reply-To: <20250313174139.29942-76-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
	<20250313174139.29942-76-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 14 Mar 2025 01:43:16 +0000
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15523:EE_
X-MS-Office365-Filtering-Correlation-Id: 79971a72-7071-4953-13c2-08dd6299974b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8SoaB+BByCwd1TEaETuXH0uV8pSTpSqJrsXzxJagXD1GpObbI5tz44PUdGGc?=
 =?us-ascii?Q?um5yLZlj2j/dlYUMooKbJqiugzDNEuygy4Epxc57T3c8zEb2RoqRudx/op33?=
 =?us-ascii?Q?ZGfxmhHYnIIVVt6SbW4ZOLRoruzHiD5SQq9Q3/fsW0bX6Czk4BIEZMmvC1WM?=
 =?us-ascii?Q?M8xbQ+M7YHwcU2IUD5/BGVMv4q1H+huJsZTjdjlqa9aB0cfcdfvkNX9dNqD/?=
 =?us-ascii?Q?TXghuIsi1XQYCq58wC2XG1ejPWkut2/d/gj2Bjgj0BKX73Z8scy50CFodIwH?=
 =?us-ascii?Q?JrztPGT/mJuptntZLTyj8ma6HP/JDBAIQojqT6n2whhc45wLEjCEKkgn3wy9?=
 =?us-ascii?Q?wFGwSoDnfj0NvG9wvz3/IFhv5D9rQeWE3Po1k+dOTrqTut+K5XUm+C0+NoPv?=
 =?us-ascii?Q?tvDlVZNO0FtY7rA/vnjRgj2kK0QEhJGIx9up0YMb8A/1Ap+wS4I9WGMvcjc8?=
 =?us-ascii?Q?xcMP4hnPjSYUqZXnL8sRTbatH869/CPcHTuSo5xIxJLJVm0nX/BeM/57nWVJ?=
 =?us-ascii?Q?XR2NHDqYSgE3NShBoJG6Nm9jd3bTK5XxZfnzVP9uTroW0AGPcknyiJ+hjVzo?=
 =?us-ascii?Q?SnsbuQasANECIkT/zDW6VGzy75ngZoAJZWgOdYzVfZ9iNQ/HFiXDU8FkMNKQ?=
 =?us-ascii?Q?7iKkIiTVVnmBkXVbEsBQBfxdt5DOnSSJFpmRgbiXJaDJFboxcyApWMFh+OOc?=
 =?us-ascii?Q?eWIHsYbhtvPoE7vyNzBPWmN4Fc4EOVIDed8QYTLRrpjoDvNg22jPIymME/72?=
 =?us-ascii?Q?70QmeKXLF7gGc16poLm601SXWRtEntuMt5ohiamhqtlE2sofPLa7M8jtXehD?=
 =?us-ascii?Q?OA24t8uJIZZKdWIzVJTdnqSMn5MAf0b+2j4Onw/owU59wKIVzAwXHNlTBWTI?=
 =?us-ascii?Q?en6OOWF7WLq0FzsGqpDFy301TtCbeezSZUeSE3aSmUYU+G60HbSQyth+paVK?=
 =?us-ascii?Q?HO0DHxIBAw9E3LbvKy4ic8ZXgJGG34oePGQ2NZ9h3nPlyDm93r7juwMywr/c?=
 =?us-ascii?Q?8oklBwtdPMeIrbdz+zMhUCiDFivTxbSA/8TmnPfXsOZ+Dpu98Qh8z1JYpU+W?=
 =?us-ascii?Q?P64qSiabSgqAvRgjSbZ3uN1BrB3LKy/plfdH3RNTpNwLaH6W/VShFanhSt0x?=
 =?us-ascii?Q?IQ6xlMcvkXNcS3NSFWyau5ooamopcZT1L99X4Ls0HApc7b7Srk56h+2xTZ9j?=
 =?us-ascii?Q?9CX4RftyHmuKdQdw4AWSwC3yCwwQuGSulnoTKPQ6nkB2qxtGdJRQKUVCHKuz?=
 =?us-ascii?Q?num+b/rdFIo9MjL4MvhX8eYxD+X8iGld8ZG5LRSOfH2SP/YWV0IMBPnCYg2l?=
 =?us-ascii?Q?7nIPeLYxYy0aC4eMlqZKM+9Tqh+31mXrYY2RXnYhxJI7B1o28RuTvdkoJwsi?=
 =?us-ascii?Q?CIjhcPJjL2TXTNfF7gDpmPlAv2n53ZcCLpJtD9o6nNMHMF/zzVqicNXi+SPV?=
 =?us-ascii?Q?HvB9yOF1g30+IG+XKU1+HletCiBuymU+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qtDL5q09SvRLkq//V905IBBJmdtCcGXVr4wPrCe4ihpccjJZmTNZB5mQ+CWu?=
 =?us-ascii?Q?wKmD2tUC2gHRIeCtsnINpw5n3XdaSmd2CNMeoJZK0yX1+aRcZVV56XCFR2+k?=
 =?us-ascii?Q?98SpdZJP58kmlZWPtDLXraYxP+yMWXZJPvLmaCiMtDMEvmTJRDtLpBRdqEOS?=
 =?us-ascii?Q?GHi1IbzhtQbx+DHbHfXPGQ022bw2uL+lBzaGs4pVHPNdabdCQwiO4Ay5L3jQ?=
 =?us-ascii?Q?MKvYrOMbq5vJlErEOaAtcSMbaYwZ4t+53+AqQRwyIAI/OFNzJh8/+r97jTO8?=
 =?us-ascii?Q?XS/Wy3OFkuowudMev32pN+Ry+/Ay0G2npwLGbcn5QkjkVSl1toAaKKUgcrS2?=
 =?us-ascii?Q?tm3LWYO4y6eXNcz5BEujyX12PN9u2VdiW8mjreMwek9XYT0DqtJ2tiANGECn?=
 =?us-ascii?Q?bs5gjwZcS/EHKbTMqBMU5W1Ch7er+HRtCuviHZ/LOGWaMf5SEgcVkivhMkvR?=
 =?us-ascii?Q?uemwqqNGRMkmLm0WgfHJS0tkbpfIIW65a9zmTevWSV7x+4d8GgLkzmG9HJR4?=
 =?us-ascii?Q?SVDngx/CM92hlJCmQhvM9nrWC+QRpJTpf763/YRvouTl6cBvG7FQ2L6TlyPo?=
 =?us-ascii?Q?vFPZ/ZHLcmRNkp1fP7zgPdyY1GVNOZqvoCJkfHzJZEXJWWT1CiWROCAAlEpD?=
 =?us-ascii?Q?lIc3CmgV6Df1v5ADzjJGyKrvmX7sJ5V8Z+5mhb9jK1WLyvlqMotWbLg0vkNB?=
 =?us-ascii?Q?1jNIPvD42vNNH/iIZIqXzBe6r2ajq2svWBysDz8jZJmZj8/D+uvnNSUP8AHP?=
 =?us-ascii?Q?4J1aAvYfY9gj0UDb0yH96mvqRK4pMsKNsnGnSQxmqGn7Vxl+HPQdNgetpdCN?=
 =?us-ascii?Q?yd8OLazLvuSYs9E8o5k2WO6V0pN7S2WfYHvnqzPgS31fMobIs0BOuSV2Kkur?=
 =?us-ascii?Q?wV9+B2oTuaIjRvlEnmfTe6cs7Be8FnOYeVwGmJXemknC964x7kSyXVm1pXhN?=
 =?us-ascii?Q?ul75TcKtxiozsaihaCAm6ib3bRfNrDbnIon7/H0liV0+MVgd8hpKozl6fqv6?=
 =?us-ascii?Q?Hr7jy/ATFWWvWItiRzg+M9QXXtZcEcmsvfFzCc7h+ca1VQBGEhYenGtJrCrW?=
 =?us-ascii?Q?X6GHIlKdS++6NajbW74bopEqfiyx/b9+WknbJ6ig6s8JPV3LYltnGALqDK8a?=
 =?us-ascii?Q?VIDPZvA6JjPv3xkClfjycjRGdMYmvzMCyLR6XnjWYxd8FQHq52FWT6S19329?=
 =?us-ascii?Q?EFIwTljW/1RYjlFIKyLYXlJdBiA9Yf8xj5v1yVNYVoKxNwtkvhUdmAqtCFHL?=
 =?us-ascii?Q?rAgU/TT7xdCNIQhkQ+4MOGxU/gSJbejejF3B8lD0WCGhw8q/FqTWh8ODG7e2?=
 =?us-ascii?Q?3iBxvLsq0uDKhpZTZzrk79Mwf9aGPb9HIomaO0Q8xZ2eYL0fNKZX6de60INa?=
 =?us-ascii?Q?abcrbVbJuZCMxVf5Ku5jiGe5yCKPXD9oN6DJVkt6WL5T9FJGgdtAIkE3Vv9G?=
 =?us-ascii?Q?c52pgwUy6QzVlvqdan073tbhY0BclCAUyIDbAhaGWGMKZApXDqjd3OVyw4G4?=
 =?us-ascii?Q?pLb5ul9r4c3Y5n6ef7qOHeCyH3u/y7bBdgY+u+halkJzm/1g2Nyeeko8Y+Xl?=
 =?us-ascii?Q?EDO+SUwwMDyNXEYg7Vy6RHFOn8U7NFgUYT2jvrU1G2VYm8bwEZWRKNK+og9c?=
 =?us-ascii?Q?HYdDfOUU1zsKOwLY1U/QTHs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79971a72-7071-4953-13c2-08dd6299974b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 01:43:16.5416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzXWqo8peWg5UEeqmS3HkwJZIuXPO8nGwKVwtt2QleeJNZLGgLw6VdyG/FlKHMDELeo/MS1afU2diO8GLicf5+4cOvIaS6g+tdgGoHU8kTtCmvVTkymC2d/JT0UNzHQJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15523


Hi

> Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
> SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us to
> drop ugly __maybe_unused attributes.
> 
> This optimizes slightly when CONFIG_PM is disabled, too.
> 
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
