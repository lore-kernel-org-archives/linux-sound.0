Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59D13F20F6;
	Wed,  6 May 2026 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064857; cv=fail; b=Ia3XdDGWaD4VmooDDgqlU8s8tfrBz4dRRwQHp2y6eQcy77KQE2F23AY9rysHExeqr8GI3txM+vff72iJd345RIMujFgXkktY79kkek3vb28dRc/zFJiT2JF2bk3IJdsS7I0JqWaBE4m7wXBDJxE79/t0kpMQms8163k1MMbV1hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064857; c=relaxed/simple;
	bh=uP2tETufVlwaBlsNvcsPq/HYISsrk2jRdPFcVkuE0YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMTZOFb8q7zc7Ipd8sQ2Od2R4qYN+wGDRzWE+IorHmcKIHkBTyZGHmFS7EppOKAz0MD8OOKHAxvh/NDFclv8QGbTuj+H4JLXLqH4SyQ3jQg6KsXRzbhJhjDOTGFJ5tp1rTjAxxxNHhKe1437AmePTJbrvHeiG2xXPkAEfabUsM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=I7MUdbDk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=b6Cmt2bd; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="I7MUdbDk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="b6Cmt2bd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6464T6JW2899733;
	Wed, 6 May 2026 05:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=971/cKWFvxIbb2rERx
	yqkmh630JFuR1Ep8ube+2C520=; b=I7MUdbDkOcDSl/a06Kd4VmQazQf8zYnuIg
	Fg36ZdePEW7dnuQmkEQFGvsMGoeOSIxnnTD5Iymad23kG4avl6ZnPygiLCMauvNi
	FHCebJ8o0GH0wsJpOOfB4NeKhJv+ac5FwJD8I3KgZY8kAYZQlTcM0CUkGTbrpiyQ
	F5gSiyLsRzeyYxAOEAYRJz/kom/GkXvqKbWfvyloJYW5hpqsemELbT22AAyB3MO/
	/1dXM3O9AVaDZ/n8r6GvBpO1X2nBlrljQjKiVqYe2whn4Z6LKqJ/uUB9zseS5V4r
	LOBfkEwITNR6okPd2Bas4l4LqCno/OHySLobDrB691x2L2ADDsSg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021114.outbound.protection.outlook.com [40.107.208.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk5980-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 05:53:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2uOG+s+MqltlLuCRgUg8/MAyV2I1ejMfjzPigk5PWEA/JnEJ/tnqwG1n0Dl8NGs1zIt9Mf6XXcHw0NE64As0pBXlNGENOJ7JjY1VW2Md7UgqJlgsrR+Mvpa2edn3oBeZDoQsfNPLiRKXVaHs6jozT9ds4c2BQWgeenwNVla1Py2baHmy6OZdeWlAO/NDl0X9Y4QQqO1q249iaMy+e4qNBxID8w+JlPpDnIbqwksgzJ5nyVdnZwxDHhfPwTaQuRhyIrjmmp/H9NbDT3KKdCrTbptTpkLa/la4UA80Z411Vo11UdYS1TuhPdEinr7+u27+4wr5sjS59js7WKK375PFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=971/cKWFvxIbb2rERxyqkmh630JFuR1Ep8ube+2C520=;
 b=JsGdIZwnWql5nzgbd4O3rWa/BMEx9nKy94Ih/ErvQ5R6YHpbTBw0BtTUTJBNcaF9FHzl0VFojMbQsOBvFWgoAjIl1hNcs6hQj8dLIXkPZlih3Nre06PVyjhYiJrPy/bQrzBIL9JiOVP59caHDA8CyMC9oEBSRo5qAipFXafCEStQI+SGxQDXHEjMkQeo8jjAeqJ+irhfCTDcH6ePvhKPlCfGzwy8A3s1B+MzZ8SLrIMQRqomQEwNtB5FRPKc5aPU8KD9DS2jzOtPs2zyt8G0i4iIXOE+NRT15ICbytsBjCBX+ns8Z9fbIaq3wbdh2TNJw+uAygQzdC0yc7vOrjFX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=971/cKWFvxIbb2rERxyqkmh630JFuR1Ep8ube+2C520=;
 b=b6Cmt2bdgjSNJTwz6ieX9Z9wmJJlHMUehcrXj1qXdrZO3Mvkfl6gqFM8DI5aeUHiYz101dp0vy/0E6gDbY83BKEypOdd2v2rGH69C9A4P18bS0KrVTLy1RtceUCbVg0/rMMklYwdJVeZYpLGOvfxSmfjhRN2AQV14hACDP7tbSw=
Received: from CH5P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::6)
 by MW4PR19MB5518.namprd19.prod.outlook.com (2603:10b6:303:185::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 10:53:42 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::f9) by CH5P222CA0014.outlook.office365.com
 (2603:10b6:610:1ee::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Wed,
 6 May 2026 10:53:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 10:53:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 90890406555;
	Wed,  6 May 2026 10:53:40 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6D54E82024A;
	Wed,  6 May 2026 10:53:40 +0000 (UTC)
Date: Wed, 6 May 2026 11:53:39 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 01/17] soundwire: Add a helper function to wait for
 device initialisation
Message-ID: <afsds+Izt5RmBmin@opensource.cirrus.com>
References: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
 <20260505164807.4108684-2-ckeepax@opensource.cirrus.com>
 <afohYUQLPLjRXjd4@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afohYUQLPLjRXjd4@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|MW4PR19MB5518:EE_
X-MS-Office365-Filtering-Correlation-Id: f3478d3c-90f4-45b0-2543-08deab5dbc9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|22082099003|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	je6mS1sAlxoq/dofn0WyaBVELkru0iOTQBN3qB4/+UUkARsfycUNX4XiAMUsPC8Qb/CyjAe5rZ7Z4Cyut9JVCBZS+iPuRYA69qHJ24fHsZWUqz4Rte1ArZhYzgirDt7fLIFWjjwhoWHiwnRIsCxNbywB/lewf5VM3IamS0G/ruMgZy/JFZlcNmIvQJ10wE+j652TI6EmzLHyv6bSawXgRUUFpw/6fMgWZBoloZ6RngrFzoeMT40r4DQBYCdleYN7d05ZEehqy0d8ogKUJQiYrFIl0LkmNbN9uNmm4t8wNn/KPKjwiayLMEVpJzdJjrDw3LFYkmJtDuA44TqcBy8Delqzw+aJcDOjCEucNCajAQ9EtKSpIcC9FmjxdaQ8E7AzWs+qUFJJ3w70hCxhuaeuQdqVE36wtL4YK7SyRDRo5xKPOPCJTzHX6G+vFLW612YVYqDCgCF1DZB6U2wcx2dZzO46ONDp1VaQnF0H3p1flTrk5rW7I1nTaXqmrDa23UWx1kUEABWeP33J/ynzQDj9wig07+0ojqSUxgarmAanNXK7fvJV3Es8B8klWKRpf2Yy2ztUiNNSyP+yQg0wGRnrPx+od6rilC1sk+LIu3jIQMdf2nKA8UD1bQXiPTrbiqG/dQx3y14eNZ7bERERoyXolkO2FoPz7Z6+g3WxWrFOvG1tILpcxBK5mSoFRjCw92gdMLLe4Be1aJi1VOJaFl1Slaj4ryMEJeonTA+iPvAt1/Y=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(22082099003)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gR/KV7tjvUbtgWAB+r4XstuidknyaFklFHTUqY0VSNjwZqvAKFousD1+csnW2vXYPk247ycSScx6cxbbtOKnLxXOnsmIP86KqRCj+EHmXfGskrqsy7gq2S1e73/97vjoIPfnI8sBsQpkS/12OJO1Cxn71HxI5cQHCjRyZqNwiUyTHjAcq/4uLef8qhJgC3l0/eoQB4+AFdidfaNYcJuwIF7u2UnRxmXveJgXL9mVjLfr8nmD5y7TRLhYt9K9+n7Jprd6+7FVqK2J900kATVzIMG1EdIfj6p6fYBuUT9jCs98fvIpKT/zJccHKBFAVUjpwi6OrA28ScCPaySNv9ftxiWWUmfanvRDTMFuJwGMdVnRGiYwZwYAkTZzVcXE27N0cMPD++zgx9BuvE6s1nDAZegDGB76UJfwv6EAG/uGCiXwZjuN07Sq5F0pt6jh2sEw
X-Exchange-RoutingPolicyChecked:
	oQxybYjrY1xMXyD+GGoT+NUthC2cs0S53H/GtGJ2gWpRzuygFmxRbhvFSboTWzrnxwBjbIYZzyEBWLddHLqfgI44FKRRwo88FzYHjHG+DhhVYUfPrOV8SCmubAJIZksvdQBaZBTI9FmvYwmqBly+EYhHzglFnx4BZbOgBgIBIWf0fRq33NQAcMrTLFmisGzueVXSzC7OifqOCbrz1mF8auKAEQOTvovy++QUvwvyNKwccqvKQcOj7u/724Ndlvm5SgrEFLKQTbiRpjD4UTW3J2HfgZxix65OQQo9xOf4n1xAnj4rACybJdC8lITBFz3/DGYg+TkTETv4+XVVu2tCAw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 10:53:41.5431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3478d3c-90f4-45b0-2543-08deab5dbc9b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB5518
X-Proofpoint-GUID: kYDVglVWpOxLp-LJImDM5ip9ZjNvSHvE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEwNiBTYWx0ZWRfXzGs2fLXLHwTT
 rUYYlYyn3SdVlD4xmN+g9SaP2LTDeA7CrawPJFWMp1uKCXMv/IZuB3VCP16MkVEIKoW8rTlS58Y
 LNBbGG0fGMrJzgNDmQm5tQMzjtgDK39KxYzeLX7NdQLFEj3yxXLwz30zkSyJSFLBPdyKd1pNKwA
 bf+tcvmPlZsH2F+s2PBj2ODGmViIhGZ4hGMaqdUmg49eb5jJiO8KZaEbY8u3/7dCkjXFWK/bsXX
 ZfB/xDhh0dU1lpo+9XO8pRlNgiyZQ9XZFZIh4L9J6lZV2ntV/UkyGEUeHQ7eJs27dLXdM5S5p2V
 sef7N9bueRkgCRWe5Srzb35Y8jeX+/YAtcFe+8N/e224/FMTUgGZPQPiLpgvggbvC0z07xkJWho
 gGE43nLaGET1sgBwVeCtFATaKaaSogEvDaG2DBdDzY7kOV2PXW1LqbcnKmUQb0oEpAjtGrriUuZ
 jQEsqnveDhaB4DNECHA==
X-Proofpoint-ORIG-GUID: kYDVglVWpOxLp-LJImDM5ip9ZjNvSHvE
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69fb1dba cx=c_pps
 a=rSpWrHmMTF20an4ACDPPuA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=mngFfiq5Wrsp5f2hP94A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Tue, May 05, 2026 at 05:57:05PM +0100, Charles Keepax wrote:
> On Tue, May 05, 2026 at 05:47:51PM +0100, Charles Keepax wrote:
> > --- a/include/linux/soundwire/sdw.h
> > +++ b/include/linux/soundwire/sdw.h
> > @@ -1093,6 +1093,8 @@ int sdw_slave_get_current_bank(struct sdw_slave *sdev);
> >  
> >  int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
> >  
> > +int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout);
> > +

This should also probably get a stub for the no soundwire case.

Thanks,
Charles
