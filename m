Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20923FBEAA;
	Fri,  8 May 2026 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253518; cv=fail; b=mZiqzTdCPTiMjnNfGC9A+JD2oAOtUFPQCwdLcXmiu1OYyCVbxJEdcJjz2Z10yAFjzh2WMU1povCHAiaHk+p/JfpEQVYRRTrjkt/AQ6IGPcSyoqDp3ohjXSu7JWgWzKwIBM2fMeKYXFJAgu2qMm/o9N1O4yrOE2qIAm71yKFEtwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253518; c=relaxed/simple;
	bh=8ugA9EX4XVZeKzwQ4TVyD5hKt5/IRuEtba0aIrE8GOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g26qt5xn0YBuE0EjjnTXYL2rC1g1ToxoitYP+mV9/ku3Xh8jW2kJjs9CNW773egAYruypTvvvrcH+Cq1YpziqeB3j/88am2nT9t07EXcF9dRZMZSaC1WOgZhFbyc8P6SzXzoywWYJvlls5/6dD5MrxvcQ/C8P8eRkhD8cOBcL3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iAh4wPAA; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nUOQf4BY reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iAh4wPAA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nUOQf4BY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648Cf2tF526589;
	Fri, 8 May 2026 10:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=oEk+6tYIBmsP+sMH0G2AoCVz4tSR9AXlwpF0tXxIDx4=; b=
	iAh4wPAAzy4aHbnPD6X9BYdqIS50P3hLVF5OXmM4f0r194Gpugu6LfUI1bemFdDF
	mNg1b9MMtuXKGWUUiffaCFb6N7nXbzZej/VtpC7GYb1dwxGSPdEonAntrRGtCfMc
	8+o3XHkzgVIQ/xnsaUTTEdjMafGahbiw73hTUtPgC2j/j3h6iXZMp2vSHmx1kmoN
	S6X4lihM+Z1baOfEXBr4COcwV1AnNYUrsBdqBmEjlUzG6cbzww0qT9YeN8nKpmg7
	p32wt3FPO2m/YMjrWnRUZzEQ+oLF0Hq947zTmQIYjtU22tyt+gtoY3Opp3S6bPno
	g4/6ygPyTCngIYemMq6rFw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020075.outbound.protection.outlook.com [52.101.193.75])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e1g20r6jc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 10:18:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8Fo7bn9sXFPntcC/4kwsmFgUHRmHXEpH/lMmtHHSXRrcuuetQE2oWCrN2mnnGk7JzWxE+N6CUIPSLx+6/A6ypt6uC0C5TeDsWIvnTghx7odqCgr0ud68dYamp6DI3fiE5/OXTdtSp8SpJ//6skaRbFqmk8Vvd1a1kAjhHseFhUHZ19IJsWBUA6k99VYUOs/CBtx9oGK8LwA+aVasq2tQc2Le5E/9fb7xm+PHDSRr0cVhc2IQjIPBIOhPrfEtL4gBIzufa1n9wiH5eHtp3XB0ibicqlnIkEfpBtF+j0P4JvKr+BwsXoaRzkMQxmgpumU1Ss6O7QoikElaV+78FyMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBZQGeGOz16vx5ywxRbWwpFAcf81BeJ59YVVzeOPYl0=;
 b=mhP1o7KwgR77GUSnTecJ9kN85PuuOEOUEOxuvjx/5E/b94CfSpfDXUCKqc9GIEHmLxDfXwTziriL2aYGjC76djAqbLiC04GfTmqPYhFo065VkEfXVXWuMRxccTaYlA151cGx90Vhe7Zdudj8K982s6QdsyzMgDVMdgdnZlzAfjFcQqR6/tQEMVwtDKcpd5nZ5IhrRjmk0fo6tyNvm2yNf+Zusk5sF2NACNtwjvf+byi/UHc85P76f+q4UG3qn3YhbIlK9vSpOIzz4/9PVTm/XVMTYyjmeZO0KZEFAggugoif8k6jnBEXlaGkofs6GJ5M+N6UGBHyiCklDmWG3Zx/ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBZQGeGOz16vx5ywxRbWwpFAcf81BeJ59YVVzeOPYl0=;
 b=nUOQf4BYqCKRUNkiVPF52pKBNYlV+SeoNTiujPXMYiKB0hoZeby9UK3JazFw0mJG0tQD6tDFfuLovNoDoQwN3prqOUl6NWKW5zTosMbp4ySV0cvncs5BPOtkiaD3sOmmf9oVeFvWtOKZGYK9QP5WBsZ1JjAYS1GnRBfz/FC6Kq8=
Received: from BN9P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::18)
 by MW4PR19MB6577.namprd19.prod.outlook.com (2603:10b6:303:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 15:18:00 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:10b:cafe::fc) by BN9P223CA0013.outlook.office365.com
 (2603:10b6:408:10b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:17:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.1 via
 Frontend Transport; Fri, 8 May 2026 15:17:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B804D40654F;
	Fri,  8 May 2026 15:17:57 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9C5EE82024A;
	Fri,  8 May 2026 15:17:57 +0000 (UTC)
Date: Fri, 8 May 2026 16:17:56 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Michal Hocko <mhocko@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        patches@opensource.cirrus.com
Subject: Re: [RFC PATCH 1/2] ASoC: cs42l43: Move long delayed work on
 system_dfl_long_wq
Message-ID: <af3+pGgkbD9GrcVb@opensource.cirrus.com>
References: <20260508150327.351779-1-marco.crivellari@suse.com>
 <20260508150327.351779-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508150327.351779-2-marco.crivellari@suse.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|MW4PR19MB6577:EE_
X-MS-Office365-Filtering-Correlation-Id: 463169d1-2d79-47fc-7204-08dead14fd49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|7416014|61400799027|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zO9yfKOGNZzPBozhokZH8F1m0XRAsu9VkTBAF6WhSkMMugSImXcIHi4ockGpd6DeXUubCAwQisg7ewFVAhizyiUie+mFpTz7BOcp9n5BZlq3KnAYlaVUwJPfBvR0REEK5UdtQ/TzGuhvRvSnqmmP7uNNnmL5LEiLTRfbdliS9HeymfwInm+XBy/1KhujqKoZfZ6lm+QXE+lAAYLAjmLyvwNcC8KF2ItZ6+3nTiwh962zhmlsv0hVbP4BbmZtcxo6tFXRw/lJUGs/2Reb8/kYt5l4F3QIzqVI6C8uQUPa5cfDYPuKE0aIiLj7Tgy1UduO9PghYcIoQrRIPxwVjm841iRxDa1cbcWvU2r5Xv6oljRkbP8cX3v4ecJrVzlTrzwhtxvI/f/3zflSsIWDn2iUdXn7myV2arbj6/E+OQqEB4TrJV/mE0UBC3hEZ3ScV3yMTIxoFeenbrGqMY/hRhT1xZSJwbbRuKaSZu8rmJLhDZA0ePHHcrdWXVX9vRHT2vlwRQe9xfwvCsgbSVMOQQRHBwHi+SbzjSQ77It3Q2+M5+U58I6MsfaZqdgHu705bGxpNNIVN53ZHhjU1E1GCa+zbiSJ2GEOHShvs1J0Oi1aWTxCa8dzVOqc5nRFYujzAVNYswzeGO/5nBzIEB2KJbMyLKB1C0QmdHFo6j7HBqH+y7FRgsq4LLKNZJrejXBs+21r5IQIosd4nxPlHIKWaeJIHS1L2oh5eA6uuDc99yFfimg=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(7416014)(61400799027)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qTJ9B7p2R8BgYKKwyyJ3pfaZy09gyK5UptA09N0omMxK8Y2rGx3c6+rQ4/qipHoUILwkq5vxwJTg4w3gTobB42recJUlan6aWaBcEd0hSv9wjObZJ6dANL05/5ADUWgeRb0OF2BBM1rSA8pO2C+WXGdB1Lb6VkpkvlRy6aAQqAEwOLnaCoUaZE+2CdOYCJ0F2RK7nlitXxsIHSsN9tfsHYCOtzY17GPVwKiF22KFarAHGt9ESB5YJzqBFEdpl08xyvAcOCnkFnxX4KyQ3zk03purfuZYZB4H13Um4HJ6qVb1PDd9K912tPi0Y2PPEr9lSWZaXZ+qjZcyvB/jAbCPw9YhNhlo+6+81NB1ScbTPOHr2QB9uX0aRqE8W5Fp0lvoa516MBCzFFtx+u1/y6hPSUFYhtS/hrjGZEHsJGtYWnAsuCEgdU1K+ojBiHX10JZu
X-Exchange-RoutingPolicyChecked:
	F9Q0vEOKJVKluRjEDhetqU+Ah8FDvvYXR1gyskCkgFA5v7bro+HZQPCIAl2imzE8W7JtYOlj7G2OsbzBKbmJBMMHesLGbjio9Htd6lUDfNK4Od6rnB5VqkNaqm9Q5z02pkdtxCuEJSxQtWV2jFeVBMoC2QWe/yRFfht/htuYhXt5rBiWsWLnU9bJXGtHQR4OyboYxZCr9qv8+faK0WSuWm2iN1d9RtNqGg6+IwpyaDdramgMvBmwZofiHRCGdvAWvsw5TrL9wXVBizmOf7HJr4sQiEk9+irnXsZBqCnmg1O5dUZamoROtJH6FvZOHd4z6lijWPtA/zJqwD/TYiUlNQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:17:59.1449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 463169d1-2d79-47fc-7204-08dead14fd49
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6577
X-Proofpoint-GUID: fAtXnt5x6oB8Ie9scYfevpSOz-5eAHfD
X-Proofpoint-ORIG-GUID: fAtXnt5x6oB8Ie9scYfevpSOz-5eAHfD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE1MyBTYWx0ZWRfXwynZKSzQUFbU
 UoWRc5zCguIQaXQeM+OnsB9YRstFwgu5Wfk4ySjDGfgY/tz9QDqrVXfZ5YYV+3YhuXjHjLFTjjU
 GJSsmX4l7Lj6Wu+QSHuFjcbfhvCLTtya2QVyr3YP/g9uZiVMlCWWcpiXPj/qeP+3PwUrK/NJVN6
 gFvJnr8B+VCk5ZecaptAON7lVc0Gbd0tZ9pgv+WcOPw401izforFu2EqXgucRMqO4peFKMWY1XF
 3u4arVT+DeKHx6Zwk79aOrW46bgUqB8c/cfAjjAYec58drGPpNIbXF36TNNgaIwCy3P9za7F0Gl
 7hjcOC8hKKL4a7Qzz7QEtTKOEJp4Og+W7H6btKXc8gIEpuEJBNkuACLndAgbwgvPI9ZiCCChWyC
 5Kqy39l4FRQMmyx2GtYUuGJlK1TIVtDQgwg9H3Gv7vEgZZ3v/9w3gB2CuXw81L8rs42yNxjV8xm
 VX3eYjD9eh4tscD1lyQ==
X-Authority-Analysis: v=2.4 cv=Nc/WEWD4 c=1 sm=1 tr=0 ts=69fdfead cx=c_pps
 a=dTGz0tuhMYfsSU3NwIzouA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=iox4zFpeAAAA:8 a=gjnNrjkLmPs1wrZNC7IA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=O8hF6Hzn-FEA:10 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Reason: safe

On Fri, May 08, 2026 at 05:03:18PM +0200, Marco Crivellari wrote:
> Move long delayed work on system_dfl_long_wq
> 
> Currently the code enqueue work items using {queue|mod}_delayed_work(),
> using system_long_wq. This workqueue should be used when long works are
> expected and it is a per-cpu workqueue.
> 
> The function(s) end up calling __queue_delayed_work(), which set a global
> timer that could fire anywhere, enqueuing the work where the timer fired.
> 
> Unbound works could benefit from scheduler task placement, to optimize
> performance and power consumption. Long work shouldn't stick to a single
> CPU.
> 
> Recently, a new unbound workqueue specific for long running work has
> been added:
> 
>     c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")
> 
> Since the workqueue work doesn't rely on per-cpu variables, there is no
> obvious reason that justify the use of a per-cpu workqueue. So change
> system_long_wq with system_dfl_long_wq so that the work may benefit from
> scheduler task placement.
> 
> Cc: David Rhodes <david.rhodes@cirrus.com>
> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> Cc: <patches@opensource.cirrus.com>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
