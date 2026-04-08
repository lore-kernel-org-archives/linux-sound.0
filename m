Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E234165B
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640287; cv=fail; b=KEJddfHlwbjUbQ1GuuIfPMK2PR5klSoSJwSmakGv2UVaqi+rOV3wDpk1j5ffWpFpASBCjDhlWX+szq0MUEOs3gs6G/GYEWpWSzcXjSwM6LdB/zBa+AY7ZQddnEZLl8VFdRAUa4RfRkZ6ATqAUOidgu/eaxhIGPPCFyCujO/Jog4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640287; c=relaxed/simple;
	bh=LF9s2N/pwVWo466N146VctXNoeNLbme26j3kCPfhbwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTGVoZynrWTP9UeOJuP/B/sxE23MyDHSCYizYEnxyeo4Xf5k69a1d74KZfzwRTMc0e+bfLdK5u2YAhEeYMk7pUNJX6ymIi1lvRRU195NLg3wmHc9v4Vu0CD+jE/RbWNGIC8+un/2xzvj+XcJvLV7up5WrSliESHZ2Un4021Kf2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TlHWsWzZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XY8KwtIT; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TlHWsWzZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XY8KwtIT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637MRMYN2093556;
	Wed, 8 Apr 2026 04:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=UQ96Ak8Kra1zXEhvT3
	WpK/a8HbE506dK3m0btKwx/UQ=; b=TlHWsWzZ5jqsbQ7ZDm4HevBliFDED0Lp+I
	U1DFN1PVFGllpRWQDsnOscxVGvtiZ0qV5fTrVwt8Fugl2c4xqlF0+8huTYZxnGzO
	uJxmNRTt6sTHxsVRrsycNpeSV2tTjwJHdc3WuonGxTaDER4Tp+9nTTTfH16xO2vm
	hFqOBn10OnhUh9wbYintDExGphh0Mln1RicdzNEUdrq7Khjbe0/RlOHzEh5+Hwc5
	JVkUltBcLPsyhvds9SrT5I1EZPRjR/hj6A7eKkxsvErHA8n0DRbQ/CaISDIn/iZB
	JnJFAIWF0xhStyEe477mp6gOZzhSFBzmL9oHSNxHkC3J7RuBZIkg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020131.outbound.protection.outlook.com [52.101.46.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr4t2h3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 04:21:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFTm+RA/E8RJZicW7CNWQxTh6GBb8ojW/xbFfLigbK9meA58+mwB6UYQZJdK3iN/gKH28Pm192/TZ8qlhpMqY71ZPnlh2XIHvo2QjkT/zgkbKwjBDu+PBNMBLYPGhvS3J0mS3/0S+PY0GjIZoWeOlxvCwvF+TrjxVDEavBl7pH9JZpByIXfHwzR7l8BHlkdGV4qSHbb0keNrPhvAWx/qizapTwGwepqetQjPcsgQ8TmGZVbVM4f1n7L1vAFDZmQDxVEWW4qdFNeiOiumXdtMHrxe+dQxLB7/SNt1U55QIJs1W/mncWQBURXNVsDYEcwzRmQsFEFwLDZQaRfZvn3xww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ96Ak8Kra1zXEhvT3WpK/a8HbE506dK3m0btKwx/UQ=;
 b=Fcm1W7Wfwc/PDMsgQKj14EO19p4IRJdnDTtYfihv5U6F9ynv59rMTEZFfc1BSIm1PMBu9VSrm9Lr/iKbNRW071foVocg7XQTHl9ZYPIZAlDSe3cSfELB7y8OPemu/7Q0uudBJ+7bA/edm3KdkM/AtPU2WvS58KdNWetmirM18sRSMFxWnl04FGePkLU4Nf5KsEeQo23K9FDT9QsQ72uAQDTVM5qN40qlg+Wg9fjvIXOwkeLCiJmA6VDMoM+Izc4MOwYGvaCrlnwkuEiCxpxUQM+hDTkZzqCIYmhIoDGBO71YStagesL0LKBKa/5zJFGuLluqXBBpLDwLJ7Nb6BEWKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ96Ak8Kra1zXEhvT3WpK/a8HbE506dK3m0btKwx/UQ=;
 b=XY8KwtITZS5ocmgMGHTACcs1xkU0l6I0uWfclSkndccQV0kih73NtlU6fkUWVZNrADDqVHFKIo/bFgbmQXkLSQUJKLs9xTsk7AB10i+wxj2GAoZ5DW+2HMUq49yoOr8kqzjmxI7kCDoCfb8ngI8T1jvFUv9p6Ex/3VknETQWnak=
Received: from MN0P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::27)
 by LV2PR19MB997212.namprd19.prod.outlook.com (2603:10b6:408:37d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 09:21:53 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::b9) by MN0P221CA0009.outlook.office365.com
 (2603:10b6:208:52a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Wed,
 8 Apr 2026 09:21:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 09:21:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 57F13406540;
	Wed,  8 Apr 2026 09:21:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 429E082024A;
	Wed,  8 Apr 2026 09:21:52 +0000 (UTC)
Date: Wed, 8 Apr 2026 10:21:51 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: SDCA: restore the settings if power is lost during
 suspend
Message-ID: <adYeL2xsalE5dcY6@opensource.cirrus.com>
References: <20260408085607.3813488-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408085607.3813488-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|LV2PR19MB997212:EE_
X-MS-Office365-Filtering-Correlation-Id: 2756c391-7025-4d28-c324-08de955045ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|18002099003|22082099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	YSHNCPJe6RzxkyfPt2D8VvHuA85Ul6UTMEe6Vhbf2EedjtoSXNrZf3nT46aeWsZimwD2K0I2OHZyIAkeoJApGivJ/65f2w789Nq1aJAhUtWHP7x0so8P6OjWNtRsCU7eoCOI/NoETjzVOHoKY4eEHCZkYLHkwCzLJB2y3nwefj2D6LrfeTmWju7pWU05SKolSe0TL/U4OoxSawD+egsmkItLtao8d4JlxuRBxjTOHg6r1BuUL7ENSGqgRgGd+RHgpuHn7MwzI2t6rrgaZJdJWJv3lHk1Kc5U7I/QDTKQen+mbLmA4aJYNSKQM7j6OnJviPU6NrGSe1K15ZFcZfg4ann1i1yPWl/KfQcoRSZaa1M1WAV4W+bPHEgvOVy2ZNb1pOq+QjJ0FulhSeNVs9SWKzwBvNDHERlPwV1G49NgPnTsU0MV3UDgoxcjX3Wz/7bzsK76Cks3+8Dh2BO37xXITHdP7uw+/EKKp63Ue2q+pZwx0ywg7ZVz6g987b+W1EaLw/LUNi3GOoDA+BFtr533cDcmRwpgjwrUDcVlaw1PYQz+eChQRbvMkEP2qBeDL/X4ctbbuvRgewK0Hr330JV5K9ntv/sAaocKBg1Klw0oasgZgn6k+uLWbPdsFCTLIZ6OlSYjxwuzoufsT6wDgQWoUJtTvrP52+J1nLOiz/jxrNj/VsJLWLu4TXvvl8SESMZ/iMI3HgZOQUeS4Y+ly3evch3bwjPOxhk0LOqrQ0a5FyQvaC1IDGHAyOZ2AWr8O/Brkx7et1lY2GWONIQv8LlqvQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(18002099003)(22082099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1Siau54eO8Az7ROK+XU6MM/iEPKvsuXrFdAwyeOeplptSkCujPvhkPDEJk7ZHe6zg8zml+TEObRDkSN76SnjvOTRqkPg8CHQpN3UIuAzqbsexggu/GvSfjM5HR3A0GX6k4/KBoSW+oohzEQQCZpqvVSUwkSDufpHoSomBX5B6hAJlPlVPTXeZJMN8JcbNwMksryZS+Ja4zyoJ/hwFwOfZjF0nQNq1j6MxUoa7Hc26OeqfiEtqiMCbo/E5vw69M+QATgGbCEY3NoZtznqHS3AV+D2y4tMf3qZYVfqW3P3EdA1h8GCEX2MP+J55ptXJdgN5GXXur6gEgCMG5bclYMgjoKGNQSjz7CFACPbc3UPExRvDQ61ClTkMfpUJs6XLqvy3aYJ2HAocUuOlUkgCrIuFCdfc1xWqxRYXAGOO3lYTeakZ44JWewXW8/oyfm2jG5P
X-Exchange-RoutingPolicyChecked:
	hneupWwl8+VEURa1ew+wSUeaLZV12YuguvA4Y4Zqa/J0Lz94Uxh9RAeE/k/XeVtIGOU9SQxe/RH7RPyncNCQq5nSXz+6dcDj9h/r8cqGaoMou8aLrZPJB4qyJZy3KlRwwR/c3v4Jd4NMX54nWxdkf5ZdftBqWVkGWjneaj26Uv/aQd2VcX0WjUbIwXAzvR1DOZBchsSQlm3ncPI8uol7t4QrVG+m5FtuOI+KwNo24PxkyzWO5lgrE7YJ9SmvcEPQPumaG9Sf9yyY8hj+/rbuQaigjf3AefYREB4hDiD8vuMrfjBQ1JFhj+Fo+Lg3aRZ9FUGqx6yL7HdOuFqPMLs0Ww==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:21:53.2151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2756c391-7025-4d28-c324-08de955045ce
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB997212
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=69d61e35 cx=c_pps
 a=mJ7H1brUzsHLkRhawgXoow==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=n9Sqmae0AAAA:8 a=KUjy2GFLLANyNMevr1MA:9 a=CjuIK1q_8ugA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX4TRRne2mjvHd
 LSZOVrsskqSumXUcZGa5jIz3l0inPVfTzZh30c2shlqyBFxqgW5GiVgJOAYHMEUCg5ZvP4I3xY9
 /e84KQu24XpyHetwhft/dZ6p8EjU3tKEPPRhy+0V/jreamvK4aLm/UOrRyKU6deSp0YRxaosEWW
 b1ZWmO/ilEBWvQD1ASeq+Ln+C0stAKAW1kyvB/xaeeqXkD/FZcYVpRF3dfx9Nz0ijJbJ3Oqu9Sh
 M61/tr2zPL7iqiWa+s/TL6G02zFFh59kzqrVDvAjJrwthmknbn7MmDfXtm8fF6kptP631JuSUCe
 Rp+MUxnp2Wp2TzuXxqdkOEXlQwA4LXTkuY3mB7CRcxeTJk7R58oVfV3mmBS556maCM4IODQDC8t
 /0Xm+169bp2DDqxP3XpWJdr+MrWtn0uHZ92xt2f1TuW5+P2JpdhIujGDu1fAOvyshA52dD8/Lzn
 6LUDUk1KbVtfm7IGtNA==
X-Proofpoint-GUID: hpeYof8mdyPHJXbqlHF1Bd0vs9EOvXLQ
X-Proofpoint-ORIG-GUID: hpeYof8mdyPHJXbqlHF1Bd0vs9EOvXLQ
X-Proofpoint-Spam-Reason: safe

On Wed, Apr 08, 2026 at 04:56:07PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> We should restore the MIPI-defined registers when the device is attached.
> If a function status interrupt occurs, the device will trigger an interrupt to reload the settings.
> 

Are you actually hitting this in practice? What is the situation
where the device loses power but it isn't covered by the normal
suspend/resume flow?

Thanks,
Charles
