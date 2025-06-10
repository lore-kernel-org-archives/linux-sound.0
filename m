Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890198F5B
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529120; cv=fail; b=N2VKySGRZ7/u4PZqpaSxXTapykwoNMa+o56pWKH1T9dAqtUnVp/vx8ncQ+jts202OLZsDaNh5Yf427PtVX5rAOov2Pbez4PEMqEwRjIZp0IJ4r8gBzaCmgwy60P5iL1twvSgY8csZUr8jALGo5v7haYNbQk2vfs8F9dr7pFE/4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529120; c=relaxed/simple;
	bh=OYQoZ/4jaqi4P262agLhrnTeyw76lktIk8dWr7Ck2vs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=m1PWb1+aGNetENVUckDTCOnryIuDTaaEg7FlRPwX2olHbUYeW5AMO62MSUhXYdqagpUQYE9y/EHDW5Z1yqzKCtlZgtxevg4zE5sGdJ0bXcBR1LjoIEr/wkoL2qyqbIfmaPcUTXw1aWQwOOh0071Jlpt/ftOitrUX1AlER27A7Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n7tJoHY1; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n7tJoHY1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSnYG3B9rlP6jAbJKugigp3I5ATMqngT5h04h9lNPP5FMF3QnJfVoSitQbyeUud6KYf4C/haOYnXp7xASkApzuuxal6HTBiP8Jgh5zjGI/ttdlNSd1PeUjBcfjSxs+9T2QvKlXD1quAo/NTIv5q5ZFhVspcoiz1m/R1XDKIoCEMeRLpjWtiYBYsmMjCHHmetMCYIG1dQ3e7YUx8J2g+9vKIUhEeMuVgz2z7EnXXU2HATgurKLK6n1qxrmRtmozAdOLJ64vvGaISScHfnpO8TsYnBRuRi5Hd5+RDjTyePI407cjQzc0bRNf+BN2dkyz52aj2dfg3OYBDUS96oqpHqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwnAyekUaUkFpuUrjm83IaKCoALOEc6n7a+HzNt+JHA=;
 b=l6xTQC3wH3lnAsf/8ZSs+6boS7xM57T2cJBSf2NAlJzJvJ7MLv5Rv7S7ZSKJPdO4aUM8iNwTgEIllPy4bI1P8JSrn0UGOx4J28H4L1Zn76xx2ynkNeoWaqJnLwh7z7hLI1Ij+w5jAOhg4XG4ezCSOzaU5y8ZLG1Ya0FoxIsjxnX9KxM+6e7/NVNFBCy84eB7YektVz4XFKmDXRF1Cv3MsXnPw2TWPWnqqaJMWZXLLDDtKC/vPi0AhzBlwHAxwILKN3r4E6RcAaWbk+BOGzS2zjsUkGjc63HD6k9Euih+GURy4L6G/mNc7fdJfM2/izbTdRIkADcGYiricqrcaiZ2Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwnAyekUaUkFpuUrjm83IaKCoALOEc6n7a+HzNt+JHA=;
 b=n7tJoHY1SW5OMI2sywgILVIxC0YR9Sw2nI/MEM8hAgYeUDcAEzPG+i4QDvbkU6OlxUfQP0dGzXlfGceDDc3V/8ZA4UlaoFFy4E7w5zyD+QDjkl84iafeWfF54ghPdTjigxDTaRroI8PS1C/eDopUyR4049jFFIPktE0UgPTwlak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12485.jpnprd01.prod.outlook.com
 (2603:1096:604:2f5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Tue, 10 Jun
 2025 04:18:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:18:35 +0000
Message-ID: <87bjqw8c11.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: wens@csie.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
In-Reply-To: <aEet9HP7WWBTdz6P@geday>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
	<CAGb2v66xb9duevXtZf=YcUM8WvoopG76_yud8PHXOnYD+i=kQQ@mail.gmail.com>
	<aEeqsul4gzxde4Mx@geday>
	<CAGb2v66MU_Sz6bVPrvMacL-wX_XU+JPWxMWjsfN=vPkzRsRoAw@mail.gmail.com>
	<87cybc8d0k.wl-kuninori.morimoto.gx@renesas.com>
	<aEet9HP7WWBTdz6P@geday>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:18:35 +0000
X-ClientProxiedBy: TY4P301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12485:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf08f33-3d77-4b34-86ca-08dda7d5de00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TImfq5YLpFmXuDPKHOMzcMnoUTVsD60RMnn4h1THbpdtXpPyjoU9YE+DC3un?=
 =?us-ascii?Q?cEl/AOh3ia1Map/UZTva3ZScNCTNMOI5OKHxO/0hMaqYMBhL+4b5hzb39/rh?=
 =?us-ascii?Q?UliTe18nNz/tNTBz6UeoEs9FCwZMVybwA7eSoY8P19KpC4x34DV2phyQe9uB?=
 =?us-ascii?Q?flTpcfnO46+3OAJGABdjWeaIwCoYWNYSSEJG1Ufz7tuau4wKGPZ5m7DcRqZY?=
 =?us-ascii?Q?W5RPT63U1RhQVfc9ug1tIs5vURhtu81IX9YpvrqLNW0AFVYoFNIAX+icP8dH?=
 =?us-ascii?Q?csKtGeOTfCfmLphgNnFW9QNy/DjLzNTU9HXQRwBENoH98/B7AYt+rT7nwDx6?=
 =?us-ascii?Q?ZGCLW5krID9DRwGOUjITk/AEUPJ1obNbPGUfLw+1qoRj+1rDHXf6/zHZp3fd?=
 =?us-ascii?Q?WMx9vyPQSK2GA27f6Sf+e2IrQ2bTuPw3lmmVWrLZO5pTAPQuMhvy2IKPvyPZ?=
 =?us-ascii?Q?GdCZuSARetw6P2XbJATloQXhV8iDpvlGw/+QoOgQY9EccFD46eSRvayrI2gG?=
 =?us-ascii?Q?aO8gxwzy6uPSZk9AYuAIeRPU18eFlG+EUNSKocHLSRCRN/IyMIQDFBQIGXgl?=
 =?us-ascii?Q?LA8kc6UaHa156BxhQOT5vOoNSkvVQZLBbg7PWXFDmSnFO1D8CcTGZau02mUP?=
 =?us-ascii?Q?vQ5W9PIGkeFP/j3VHMXN6ylOA5NbWB44/WoP3FlH2oDIy3sw+DWlmRS5i8Tf?=
 =?us-ascii?Q?frZ33wxZDZF+Z8RN8nqa9PWhhwDkKfwPOEQ7Nxf7khQ/i96bg3AbOWwR7LkU?=
 =?us-ascii?Q?DE3FaiunCsMnvpF26sm3yyAN5YiI39qV8ztsvC5FwrHpAyJKCiP+PVKx1HgE?=
 =?us-ascii?Q?SiVY2ffSHOkMYVPpoZE5Pgb96fjL723QMEeFEPHQIr2ZoSWVnrRHCDePbi5M?=
 =?us-ascii?Q?FbKpgchnfhyTpvzo+hWBVjSKAhri6w6Ildnk/tS33GAyZIauXzNiQB/UhsxK?=
 =?us-ascii?Q?QP9va4e9hE8cIFIinQMwS5M79CluL6FjcJG8H1y+JxtM+dfdFARJIR+gBf+Q?=
 =?us-ascii?Q?Z+3O4+fHhK6CkhmMvJzCN/M9KxwEPkSvRc5MZzje8hhAbZKcbxwSOdb5sV0G?=
 =?us-ascii?Q?qAyJuxp/YGKokI21rczF8nMG1fWa+O4iq2DUYHBdfEr1D+xyqUMvaUPMygcN?=
 =?us-ascii?Q?DOumJxBzXIW8SKEofCRqdUeUaXcoYIRUUrQTviXfGv0C8uERD6siEREO+yB8?=
 =?us-ascii?Q?Rf1pPSY3y9US/nriilEJ34ATufdkvUtGv5vdYXVgqj2TSWBWFGjBG+m9TngC?=
 =?us-ascii?Q?OGrKt9+0aiBDatyvM2eV+vKtdpG5FW59AkuRU8g4ctmabxheA41YmIJKUVa2?=
 =?us-ascii?Q?jP8ThzWXbq2MH15eh+ZxP6gfPVbTMVQ5Cp5dvR3S3y9VOBxKiOpO3sVZjdPi?=
 =?us-ascii?Q?dBm7dhdP34BIqR58xJIA5zatV9gqS1wwy4L623/7IJPIb7x6DK0vFzv/Evqb?=
 =?us-ascii?Q?ji+rhWI7SHRIntACnLnqJcDzBtIVkn9/Vp1qPXL+wMM6uVTnOPgfQA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7RBrN5qrYevNw9Zr6SycfDsCLS2c5ltaqzgzLK4T2JbmhjvI6ZXoNR7mUp8Y?=
 =?us-ascii?Q?mTbcQUFbe/4AXstE+32jf2xXypWBrn8h910ui5YtJnwQYS43nI60l6o774pG?=
 =?us-ascii?Q?+UvCwgD/M3ZLb5kBwoJpRjccK6oxUpU5kch81foFjWtP+UVfAt4GToDSumTA?=
 =?us-ascii?Q?iO9/5CiPrayw0Cmlbzu7eAI2lNDuooLlUKCBNgpOaCZl946k2r5dQIdqiCdR?=
 =?us-ascii?Q?bgdpFiLsfsKPwrY5kjS/uMwGF8+Ma+j7MPig6eosRAYjYW1je8ywbM/2cejt?=
 =?us-ascii?Q?53Xd0S6QVfHN4JEFSq06CpMdnmmEeMVzQ5LZ/SdkmeuXSXp3Pvn+5Q6bJjVL?=
 =?us-ascii?Q?MMKtwy8RvlrN+/agGkDkqK7uvIOgmkcaAW3PRfyWFVpeAzhScO4IPtUb4DW/?=
 =?us-ascii?Q?y52vz+Q0jv/AHyWKOM8scSfcjUEbUttUUK6M3rR62S0+oRxXDjjfXJ219q79?=
 =?us-ascii?Q?G1m+2wI7bf+F2LtW8vHnFWkTEiKMXH80cH/+A3eEpsWCZxqWTggJ3IvxdpGD?=
 =?us-ascii?Q?92hhevMQDsbJmydai03tIWwoiywKwyfIzui7jey9F/7SRMHTehrxK99NfCEg?=
 =?us-ascii?Q?2Lq1GsFmqCw3mm+2JMPnZmmvD/+i4IgiyprxP4tneLSdKG/Dp5cNFeq+w7zU?=
 =?us-ascii?Q?cDJ6K0ZKJw7UucCbfX5bHd1UCAr1O5QCeV0HW6PloUPXZJlmLcIVpLOzbADz?=
 =?us-ascii?Q?MrkMO2ibB5tB+TA74uKdnHLSQSa094K1Vg0vjNATnLIS8QgfHbG46dEln9LQ?=
 =?us-ascii?Q?sqhdziaB6QCrxGGByHC55Wzi1vdpX89xGGwDlLEvmWcZr3eczF6GUydrNasj?=
 =?us-ascii?Q?izsBL5jeXp4D0/4rq7vgaUld6sRul7RwQ/7oURFeEmmUedXBpmWfzNAsk/4L?=
 =?us-ascii?Q?QxgECBILFIw/teZPlAmS3dEQnNtmq3/kgK6uAwffrCDZBhPUZpN1WUmfkBpI?=
 =?us-ascii?Q?g25xQMKxMsuJhWTVUIA/TrPuvgp/axr/XG6rgDElNDLRGh6ZE/gas4ZJXLBW?=
 =?us-ascii?Q?d5dY7407wm+TzOw6RkthwipN4lBiKIyFjG60v1JSd766CqJ++PowqI+OEOPI?=
 =?us-ascii?Q?eTRfj+1JajedZYxVxhMNZuQXCtR9iykHc0/EnWuxUnQScLmiagS32No7zIrS?=
 =?us-ascii?Q?N9FcWLoI8WK8nmjgGG23wc2Em8eLnBwdzhNJwmKBBbNSA2r3fpMv2gnq/+/Y?=
 =?us-ascii?Q?6cqmnRFqMrd0kpMuRrNfEucJk0JhbUTJ1SqYVphyZDhW8WYzMI2CZuBtZrsj?=
 =?us-ascii?Q?cmi7zMMlZrRAHLAMMGGaXSnnLn+wcv3vbvBIv0J7UxYyWGsvjZKZI06mx4ZS?=
 =?us-ascii?Q?/srY/61/n9X4g9XLi+IEXoyUSjbkAtmbuZT/ltqfBLbz0vgRzfRc2V2Z/+3B?=
 =?us-ascii?Q?eqdnPKYFZe4mtrF+SzoitiqGZcosOqvnYvtKfX1NhuW2K6i1Gr0KdIRCe5Rk?=
 =?us-ascii?Q?wLcQOiIMn7IK7bpfgErEhNOlrIPL4WW80slyshZeCG/bTcPSXSOQD9GYASBH?=
 =?us-ascii?Q?56IadVkTXVg/paTUd60mOzv4ei4NfSOxuPvWCdLCj7UzSnSubWWpCaK5OD4b?=
 =?us-ascii?Q?VNB1GxCOZdOjppPhqccavu3sJPzvK21oQtpCiiXWxp/sTk+gplZCke4+EYjF?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf08f33-3d77-4b34-86ca-08dda7d5de00
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:18:35.2129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sw/TMx6Da/T8urCWuXGD2fmBnMTACUYQY0pVJgGvYK3dWVV0yeykYByIHkmo6v5Ff0QCPpqteuiL1uMEO8KtfivT24PwcJVFiDyOVx1gqmyL8sEpFNS09kdIPvVSu8EQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12485


Hi Geraldo

> > I have checked posted patch, but all patches includes your mail address.
> > One concern is I added your address on "To", instead of "Cc".
(sniop)
> Sorry to intervene again but I think Chen-Yu's concern is about Cc:
> missing to open list (linux-sound) not his own address.
> 
> He was referring to the (likely) fact that you forgot to Cc: list...

Oops, Indeed
Sorry for my miss, will post again.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
