Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2752F1EB5FD
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375128; cv=fail; b=pVlazXOJmUcmpnmsNuMho21lP/DfCG7uhCj2WMaY8mK0+Eru8BgoDwBNWrx9uVwGQ/PGlbUJxiDQv3gtPykyrSvN3hXvkp0xjBiJhGxjRdNAu6xB9QeoH7Bo4zk8BJ3mxQs+LATCQO1ZRpcPAhPDilw9mL8rOAoY5R2NSQDqA9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375128; c=relaxed/simple;
	bh=BN3k+kZfiXcvHnS1oQH6kqBZ68Rn3/oPJYjd/7cgLvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCqLzZi94fJquuhnKcTH77jK3h8lqRR2GSPowgQ4nwDKUIx8ZPutaVhkEiS+Tm068/7NIESW1AD37ZhNolKVa3W0aX7D8Z7DO4ZlMHelRedEuzab+k3PP6KjDimFBWXrPwmKP0Li5lM4pLCVqrHm3hnjJmmbKjhtIOaQRijW5Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=G8VYGGkV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=C0phL7f9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="G8VYGGkV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="C0phL7f9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E4UeSE250268;
	Mon, 14 Sep 2026 03:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=2i6JZt/7c8OWl7Osle
	JG9IWh+CwyLjl4Byl5xSdmz9U=; b=G8VYGGkVMRIMTehak2M4pawikld5Dqz9Bq
	5zuIVE2GnjR9fn+chuNtzdE9RKDvnYfQvOg1EVps+xCczMLXdeumBTn6GTIvSi8R
	05/7UjUYp3npqfVU2E3FyJ8aFg0CQN/+GHCHIjk47bpgcGnQexX18FnOR9MPcI0m
	Y8FZIAcevkdOhxp/GaeA4B7ebmZ7fIzuK+Aor5V3mbIux2RtWE1LdZr0Tv5z18GZ
	A8pxvlogJzkbvUWMmrbC6RWY5izWZRwIaac3QvFgBhIHaVTF6M4u3Hsrdb0dlICn
	62YO9MneF31glgLR3MCmWpw3ZKZ79EWCm/ycsXCWedrjhl2dG/4A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021133.outbound.protection.outlook.com [40.93.194.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gn35h9kr7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 03:38:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijDYbtEmHbXB9Q9vG5TwOwkXmKWtSTYyxoxbkZ5Hq/g4jSpZnzY/KeANNDekXsjqWFD5QHIou8AaU8Wo7oEkR+R+n4m4LyqIZjF6JdSC5J5TQaDq4Jv2UR6TarQiFsFQpWqrCNe1pRKU1rFKhTMYt7ALgRPVoJGXBb7aM19M0RCX30Y1sLGCH2BtOZcg9Vqny6a6sKxWzWhtIZeIrqwdc4M5DgwHLpkgVF8UwmKtN7MqEWBckfG/aMeFYPgNmfwgN2QJ5rfavMZa2vlfnCUMHN2XJtQWvxtIkDHdv67JlNQx0qsAO9wacASko/AlG/qhhh2RyUe+P4y+4B+pH1mzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i6JZt/7c8OWl7OsleJG9IWh+CwyLjl4Byl5xSdmz9U=;
 b=fRYyNTRtFznGb2aBo3muoS3BptIUExQDyOdgka16cInuAY16WLIhde+HEf7Q64dxp9kMGSWxQtmvkiJAco18afRZcm8JT6bwcY2Eh/yO78aEakaqNNR5MtzvL4zMjwBLHEBjluhEvNIj8yEPHFSUBWo1pUjBQrgyUSKD/D4+b0CLL0UPfeO6ui9nq8AI/o3yo4/JVGkGd0BdgwhTvFaBvwqlrIPIQ/0641czJAd7QoWj8VJlBWwd2c/KI78qRFTi2h51aut8//ocr/7KBFINh9g7yK72BxIW1CKQzCp/v3M/AjljW9KXkhgh2GcZqghREGuf8/5TTR7+76g767bROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i6JZt/7c8OWl7OsleJG9IWh+CwyLjl4Byl5xSdmz9U=;
 b=C0phL7f9bGu4ocPMoZTPphh3z2MfkhPl0cXRQU78OPuknSCLsk729lIdTiBR7yL1c7+z+Pvx8FR+45N4uxXly1rtFlvaQZ/h/05luJibCFlPGdybyAUY2Y/Mob57IKoDnxfe5hVri6mPKhjWJf5X03Rl959sKTkv8XglaUy8Wzk=
Received: from SJ0PR05CA0150.namprd05.prod.outlook.com (2603:10b6:a03:33d::35)
 by SJ4PPF128271D80.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a0a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 08:38:05 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::7) by SJ0PR05CA0150.outlook.office365.com
 (2603:10b6:a03:33d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Mon, 14
 Sep 2026 08:38:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 08:38:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 29BA7406561;
	Mon, 14 Sep 2026 08:38:02 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 10F38820247;
	Mon, 14 Sep 2026 08:38:02 +0000 (UTC)
Date: Mon, 14 Sep 2026 09:38:00 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH 06/10] ASoC: soc-dai: add snd_soc_dai_{set/to}_priv()
Message-ID: <aqeyaMEvHg3u4eUk@opensource.cirrus.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87ik48li5d.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ik48li5d.wl-kuninori.morimoto.gx@renesas.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SJ4PPF128271D80:EE_
X-MS-Office365-Filtering-Correlation-Id: fd994209-1d2c-41be-cf53-08df123b7e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|23010399003|82310400026|11063799006|56012099006|4143699003|10067099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dMiBU7C/1iR2FieYBIvTG2y6N+MeVCLQP3pgWF12EJMS9dRoajVJTN8c6AGy8jIhdRBd4BE9lK4GBbLIwnlLpyMYvanSwccG52Aix4/q1q6LzWW/liyCJHyKUVpAW3uYL3Oe9at57tCnRI1ki3/MtyWDELzrlbEmsKPMJiJWxZB/AY1KIGhVkVmCzmbtw6pXrUVFLZj1SUgkcLd555fd9FdWKguzTustnsaYHntLcb5jPvceEWKMiD3QoM3szKKtALqneAF320Ztll5gYd37HLPyEtlgPnlVqU3wYk5mybci8ezqWPyF1gXzfSrph8P31UJum5a2IF4Tst3v9mY9ldtrq98i4VeIlxZA9P99yf8BW8zZU/m6LUQgesE/WfdkdbQX0/W6kmHY4wVZxCDa6Pzp+R9IegRu4d1O25a+x8GBfwhWXESR9E3j2w3KGQRpdvDmpmXfbgFqUErHcP/vhXV7kM1tElb/D58SQ8j3fhK60K1HRpPexuB/6li5hglkehIt319O8he/lak6yiymljm8hJEjGNFrMf2OHYjOC+Kuw9M0pMa33y5hpM/bX/h5DtppDEgnHSSgJXRs/myhOrCtPE0JCtYu6kWpod4bq70aWX6/XnJMQtO8DKl9s2HSCVMsMagtmDQbLZjdDc37fKms4mI3evaKw7Wxi1GD0tfsN+gEwtIB4nddlNKcoPm0ZkOOWcVSy4U4931Yy2KzxA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(23010399003)(82310400026)(11063799006)(56012099006)(4143699003)(10067099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ROwabDz+uw5ENcMNO2M536o8NpnuQK/WXYGDY4Gk2FghZgn0stdy8BbO4sZTg2MqPOA2G9ntSZKwR+MnH+KtF7Beawshm/KixGutdP0oLfJ60Dv4M/Vdkp0f/vb47HGoLiU4XVb1oh0lyUg/eq2Rjq7gmC/Km8+JJmRCHLzHHwO7kHx2inP0X51MHk+H7Bs7XRXBVsdF/pD6thzZxJLJWcetWldgQuJg8sJWBO/Vkr1IMbCh0ctE6AKA7zSs8L8jTWgNfQW/VmwQ1sIQbyfLoS1KNEeFRg21RGj+NnslyMdgech9FcLHpxz29hwWBxCVujkmiPEcsl0DXFioXlKVI0UBGrqX0csr7Pw+SY704hrL9ME9hXht3J5d1FtX12lyNrvYON6/13Tp0Vgsrg8k3fytaxrcVuGv91fi6qZpDlQ5X6OdpINn96cHNHwA3EPJ
X-Exchange-RoutingPolicyChecked:
	cOoCiuRSB8WpJllVEvkZJezBjfV/4puIi1psLEPUdq/Yq9twNRhjQqmcWdR6AJzLG0zwUayEP1OG/aPSFojwbfoQJWNkSLDhg9uYOR3fFmhFv41b7PezTjdzvo5G9F6/81aaSh6zjG5cZvA9Ev/e4JIRc517o87vjZBDJlpHPk5d0se1KVe8vBte26diBIjHku0H2nPU21JvU81f9IfpQnK3MiIfYMz4SHsnjcvtKRfsBDIjsb6h50tIIUNMathQ5kmXvkADS46GB/w5V9yaxQluFR6mA1lTmshKiiNkjRu5bmCY9OsWnplY5xAFXkVAGqTV454SLO+X1BoLtzG8dQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 08:38:03.9759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd994209-1d2c-41be-cf53-08df123b7e69
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF128271D80
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMiBTYWx0ZWRfX7DvMgkwKMVQF
 8r+1jeMAWTArIkBDlvM1nQYoc41eatw+5wNMJiWGBWsFpYM1+ZYHCa75GPPB4zV1anegy92N1wZ
 anscv5eW4pF9/bmBHJypeWIBuN3g0EI=
X-Proofpoint-GUID: trvtcpkL5XXjVjV-kf0SuRR1lu0YFhX1
X-Proofpoint-ORIG-GUID: trvtcpkL5XXjVjV-kf0SuRR1lu0YFhX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMiBTYWx0ZWRfX20RCAcfsk+KN
 zINKWvBP66IGKLraC8KQr6MYccumv8K1AR/MG+R29eBNS0odee3Z2Q+peNh7IZTUKkRPFihYQDE
 aP3OHH/4MCqSAQwQ1B7WuLgpZw0p51SfSMSw4voqyXsZ/bRz/izbfOoJqL3XV0xCS+9jLxTuqpp
 9YOOBQFu/MP7P4fq5vU2Dz0YiKe1kpoEoCM60KB696ZPjGQ5wfv/XGGGTI2RVHuZ2WeYpjZJMx8
 DufQOhF4w8dSHnmHOSFLYy4a5E3FjwG1Eou+Pnw69PdSeb9GYQmPpf8hErcH72aEbSuCP0F5Iip
 Z9AAII0Sbi4YAzSCB4OV73SdPgbEGZeUxMKJWV4thX9sOGKf5pcQ6SXtnwhrC0hSaqGPEsjdqB2
 kgfVBQHIFMnUfBeQpZedOsIZBL0llJJNBty9Osjuu67FKxSKExMs9kmbIq4Bfc7X7n7TKbAtJog
 yHAs+z0Yr3aL76LRZmA==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6aa7b278 cx=c_pps
 a=ypmqvA/i/yzbxHxvB85sdw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=yC-0_ovQAAAA:8 a=w1d2syhTAAAA:8 a=MRFtkMzNmj0GfpWu9FIA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 14, 2026 at 01:46:07AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. DAI priv has been mainly referred from SoundWire driver.
> Let's add snd_soc_dai_{set/to}_priv() for it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
