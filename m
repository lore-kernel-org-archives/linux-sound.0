Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DB625782D;
	Fri, 24 Jul 2026 13:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784901243; cv=fail; b=baxa/o9+kcTL7yWk+DAv1EmaWzwFKOEqUcpGhiC7Qw4jPiGs6Xko3eJVxdCgQ6KVa5fXB1sxsLoAEtIXMZEUCPRRuNEtstPOj3k65AVZw2gbrRGAKe/YFgvB2UMusHA4g/ZlHfLKodhJUnOf8oZXbIAavmwBYFdZBg/b4JTKSwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784901243; c=relaxed/simple;
	bh=gPLD+Uo0C+yoC7rFlUJCVNNQLlQFZ0KRCSPTyIwvFxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bt26Szds9TaAwlGQGnEl1OAGhxjut5SjQzgrXwSyumridYvN+MT6nENMoFG0pBAJ+wVgiLFlOX/Q0ndLNT5wML3TJQqxmA54kVUBvPhXbBTH/Fp6jWXMGaMLIcMevlyFlKFHMZGPdgxi0b3Zw4Y2uTKC65aQKfWHL10xIZOt++M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pky9Q/th; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=y9hlx/L3; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pky9Q/th";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="y9hlx/L3"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5hhEi2897547;
	Fri, 24 Jul 2026 08:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=7vK2qLgkIxgRZcjN+L
	bMoFQwxp5LJf1afgettNUyahM=; b=pky9Q/the71sE0fZqpjtkzkEcNjHqihHBc
	LuXFsiqbMkl5bBSk+j81I4Oi0SskGgtR9aCXPKo+i3MX72m7WUc/Qb268tttXhqv
	F+kBvvnw5FscZVGjlLp76+Zku4xwXfuBijeY8gZBc0dJhC0Uu0hoFO1bR+3YBI4G
	VIk91kGSaTNmHRbfQ5+XxfTr7pVmD0QPyt5x3XD68YsA2GHaS6mb7JDSPJdeNBIs
	Vgt8tmL/Vw//McOT/6gFutJ+YCtQYc553mC4DkY6RR3XZccWmDAvvNPgAp4S0+u8
	2iET5us5/jOXCpOfQRA02VwUeVVD6KjYkTAVWr2Wg8LPk4omBidg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022108.outbound.protection.outlook.com [40.93.195.108])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfgwwh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 08:53:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVgM5lm3o7ujmblCMmnu3DgTJ7sSSVpnI/DSx6PfJT3CjP3AIxFqxKHDGPM1cE1nnE+lARdYbD9jC600yCgQqoJhv4+x/jjuo26tnvJGkrhFZslusL1Dok4jhhGtzzITHeKyyooKSsOuU7Zy1PkvKCds+09HbehK4DhOEXJfqprMeT0dl2oR6UTY7G22zgUDY06meVbDErctCM0a4GfXbD34BttSpW1V0D+sa63fD3xcMUjX2NxaIneBW95ZgB3/fKTYosuzlaoyiEjTsHrktQXDPmOkqcI3uScIXXZyhgEXVOGNtuj9gcb08b5/bQ/+ISWO7WpayhL7tJ0zC0pw/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vK2qLgkIxgRZcjN+LbMoFQwxp5LJf1afgettNUyahM=;
 b=YFB4vJgx/uB7EjCOZAKE1gMdYe5S48XUcBNxWnPgWMYT6obpcp77hS/NYuHDUXAZaA3yAae10a4GhZOfpP7NnSIHkf/C+gDULO5QSv1k9clcf9IBwDuevW9HHNQLLN0OPEE3QyoH1JEw/K29DcYrQGE8EeUGnCb2exk/w4a0pr/gj7FFkhf9a/028+Dpz5tSImLPXbFu2x9nwaYNXgEW3ocpu8fV+elu7CSrBYbCg2vdsqhkVJ/Mi/rPtkeugwQEJk48iuiKk0Jm0j2fvjQYOkfnijjafG0Q8swAX21hPF+kF1XkRzu1gyI9lExsFkBvP8Omq3CK2okmXbpMpfKpDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vK2qLgkIxgRZcjN+LbMoFQwxp5LJf1afgettNUyahM=;
 b=y9hlx/L3CaN5yCNscp5OjrEAGNOhpZhGb1BOSj0tz/OI3L/0bkNerO/PlyY/qpnWfoOFJsldADTK88A73SQzPYlhBHwYAAkxewtoA6PeMgkmnpvAOarRpS/BXpL7WATYG0+QO2vx4AhSl06zzu2debjX3N7yd/Bwv7JPohpgtzE=
Received: from SA9PR11CA0022.namprd11.prod.outlook.com (2603:10b6:806:6e::27)
 by LV8PR19MB8672.namprd19.prod.outlook.com (2603:10b6:408:256::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 13:53:28 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:6e:cafe::8b) by SA9PR11CA0022.outlook.office365.com
 (2603:10b6:806:6e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 13:53:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Fri, 24 Jul 2026 13:53:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2E822406541;
	Fri, 24 Jul 2026 13:53:26 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 13BC882024C;
	Fri, 24 Jul 2026 13:53:26 +0000 (UTC)
Date: Fri, 24 Jul 2026 14:53:25 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/8] ASoC: SDCA: hw_params: program upstream Input
 Terminals for OT DAI
Message-ID: <amNuVYG3UJpUbNEb@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-2-srinivas.kandagatla@oss.qualcomm.com>
 <amNlSu3mcwKOmqvf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amNlSu3mcwKOmqvf@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|LV8PR19MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: 26773fbc-eddc-4131-5f90-08dee98af014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|61400799027|376014|23010399003|82310400026|36860700016|18002099003|16102099003|22082099003|3023799007|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	CqDJ/AsU0edH+SQK5K9qOYgoWB1phNfEOaFts2e86Fkdzrp2uuLrDDSeVzXNKb12bKpBISz21evmPnYdHAI19FoG31xpbs5vgNwF3IZHzXlnpcqnLgeMi9oAMgNGzKzlx8M1BTHENv01o/yAAaQyJEMEucWaOVq8iV3p0ckmwDiRuTc248WfMT1BVKszzl5sb0N28VNM/+Mea/SUWAJ8IwRta+jnguioUtLHBQcUUSvmvNlH2HI0bqZYa8MoEdUcQw7Qv/EuMpoJDpK/gU6YO70qoq9rbcnXv3BOhpgwJWpatD/+CU2zzLzshxa6PWG3v+hqeozJtIuOgQZ3aulTWadKfR4UcwWcHySoV/YMuW3qJidIfJOd/5D+qMQohHxk/AlYtlLzlmvAoWP+pQwcYS3AhH+f3T/cp8gix3AD1PLUVoYoPGT2RLUNwx38rnLbCNKfrKBk+wH3GsaI/cveth57r+CBA7MQlz5++7wXfUycaNbEO25xv6bVyCG8DB0isFuT+hjE05WZpRq5wOYW/hPcWFZyBu9FItW0VucpTu+q//ZQJ5ik23d31hEUxsIQ/MzV6SGJQ/8qBPhFM/xt3pux9GkOX/6zJyhE0PflyNymBTvw4XUKEo6o6qziECCHc3/gJbJZCjeVq0zDpofe5irk04bc+Vb694Fn8Z5DU2p4k7gw1HeCX28mG+iVK7N3buGL5Y9B5RpEVm4uj+juRg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(61400799027)(376014)(23010399003)(82310400026)(36860700016)(18002099003)(16102099003)(22082099003)(3023799007)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	56vOX3DC2x9arLyxil3HOyqatkFh6CxE5g+H9fmhEESXA5EdLBbVFDctQH/lthCf1nVEVkAeZyMbT/PWrxBUb3BpHM7P4E8BBq9BneV7qzuQBiz4C6qJW5K9shrxhVqb+fiPxafALxGvv3hBjDkPDxqpLwlfZ07lwNbHL3D2OAW+wUpBUBy0cgDLfD4/0M8ODgAisK1zY6MaH2I5Us7UgAO9Nsscdct4HsDo8+R2TmkSpQhgG+r6QzE7HQyg8OdbgNP1NZhnEzfzwUwQFqPYnj9LqWkVXYevKb0aJYkmROe/5CxCN58+GJJ/xJu6Mm5//hdJksw//R+JTn/do1E8wCXoP+Tj13SFld+NBvddJMF5m4xTTIKYAyYU66T4EyEHa5N45TPOA4e6O56ix/G7pRQJc7/MikBl+9Nqk6wl1SsmOp3O9vf/0CjXZva6MocK
X-Exchange-RoutingPolicyChecked:
	bYaDZZAogLYpMN4T4ZT4tZwLw2uxzomQGhqVjZnrXHBsD+WTvhLFOzYG2Zx2NB3o3/CXoIFbul8VrFmb3fAirybRh4zQg66G8kIyCvzVMBJiGwKnw0ghbRjTazXKJNSTNtU1DMEvAPQRbHh3Y4M6z7ajSDHstuEDGyvERnfRH59Qn8lnMo68X14ZUoVhfXcOb5QBj0aKv5x1sPRsugbry3IyVoLXA1tduw+l7hbI5K73KYw5rWCeH7IGKaMw/NpxGhoxEJ7cgNCSTFRotCqrWVbX0vHkOVw9lF6qOncPYMw/C/8BN2s8qR1BSHCMBmvs1FwbB4f3kd8Gj3K1Wyvn8A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 13:53:27.3099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26773fbc-eddc-4131-5f90-08dee98af014
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8672
X-Proofpoint-ORIG-GUID: vnZXAEC2-hM9evA9KWRYL4D1P8MNzQ8V
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEyNSBTYWx0ZWRfX1uFLBd7Sb2Sh
 uYpfBCjHzT2L6GI/bDD8ojj7YqyKGStD6sqE3fYsmIGYn0h6oh+tz/IQ2tjm5p3FpI1+GlXnMlN
 StA1I8LIxkqyQ5MlSOOXLaH0pwsYkDw=
X-Proofpoint-GUID: vnZXAEC2-hM9evA9KWRYL4D1P8MNzQ8V
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a636e5f cx=c_pps
 a=F8yC87VG0lzwhDI2wa7IUg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=BbeC27L_e3XEdJxTvgcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEyNSBTYWx0ZWRfXzEkjFurIT3IP
 TdrsPBjZ0c4NLK7RBx0S5Jai0xOZLaI8mSpr/beAhCBeuvrOUl/AGAdweK16DrGHBOGUy1vrHka
 zDSZb1VlsDG2c0PsDV3/L/O1DgF4UWCys9Rc0rWyMoDKcTI9c3soRjY2DRHjrXBK2xjP11zZysy
 llk2SAqHFo4/aiPbhHenVc2zltgrrIOsoIntRmH2Xu4ldv4yovnm2yEEpwvAx20uA3HwyXyg2LD
 kD1OessPAOHYPzC+LeKuNmuUoMeLH47v7PIrMx380H69MyE3x+VGPI4f4iASFvsAWdZEOb5RUFD
 hPdOUsaFMWq6C8pY80bOWdYASqeC9iq/lG1ggagMxDDqOaa460XSRr0ee1PoAEkfyhqqzE74Oyt
 bqKXxXVezU+gL69LAfBBPsJ2EzkkqvdwEESIxdJ1NLFgjPgfzCu2h9PUtdqo3fMgwZyCMAo7p6D
 YLsRFczALADBa3iKS0A==
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 24, 2026 at 02:14:50PM +0100, Charles Keepax wrote:
> On Thu, Jul 23, 2026 at 12:42:11AM +0100, Srinivas Kandagatla wrote:
> > For a capture stream the DAI is the Output Terminal so
> > sdca_asoc_hw_params() only programs the OT itself: cluster, clock
> > and Usage.  The upstream Input Terminals that actually source the
> > audio never get their Usage, ClusterIndex or clock programmed, so
> > the power domain comes up but no samples are produced.
> > 
> > Walk the source graph from the OT and program every Input Terminal
> > reachable through it.
> 
> What was the thinking with respect to the units in the middle?
> It's not clear to me things are quite as simple as we can copy the
> cluster from the output terminal to the input terminal. Various
> entities in the middle could change the cluster, such as CRUs,
> MPFUs, UDMPUs. Also possibly SUs to consider too, since they
> may change which ITs are actually connected at that point in time,
> although potentially an argument to be made that programming the
> unconnected ones would have no ill effects I guess.
> 
> Any thoughts as well on the propogation of the clock and usage.
> Its a little less clear to me from the spec that they are even
> intended to propogate in this fashion, although it does seem
> fairly logical to me.

Although actually maybe 4.4.5.2? That does seem to suggest the
clock should progogate sensibly.

Thanks,
Charles
