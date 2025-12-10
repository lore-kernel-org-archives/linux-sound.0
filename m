Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20605265CA4
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765380475; cv=fail; b=PjJNcL0ocnK8OPNtdjCNLOeIhNYYx/lFSoNpsqt1L9C2Ya4v3zOPFV5uEuanD6FB6xBO0wmtzPxiCR22wud2BlgCbROpyebhZZX9u8zIkesg2F94BJe8UPCwoVP1iacil0cPJl/yf9DOYsLhwyCpNPLftEcj7eAc9yWAHnT7dCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765380475; c=relaxed/simple;
	bh=B5ZfAFeBc3vSfLqTg+eLC75kJI4F1K3MiWh2gTkvNMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ggx8J9I1n1FMPzcbaOBgg1z/oZ3ZXNjSzpKuxiXXE8IQQexQdpH+c0ZaD/hUkVbZLZVwbhnbGI3ZjyyQ5INeSARQzesimgnOZHTUyWs0hr8akxZUAaxdFs0ytA0S4gptGlbnDWwDbWKKCStKNY1avFGtWAdDa56+yABDpWs5g5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=prDt5uaN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BXfmU31s; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="prDt5uaN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BXfmU31s"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA71wc82790931;
	Wed, 10 Dec 2025 09:27:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=iXAsAnN9kYTxEw/7ia
	Fg/ijnpR+OGW2uFaVTW+6ipeM=; b=prDt5uaNXorElk19gun3mhb6xfsfbPp6vW
	VAiFoaKd/nJRjQJCfHpg/hdh+UlC0jzXaO/a1+Zk1sJN8UxOwGuvXbXq7xjIxSdt
	hrkG7bxkZXb9PgUsKC/TwOa/ZqCadUBkhME1UmYn+VjXzS2zdmLptkE7WDzGnCst
	oUZzmDDbfkA7GVr3m9TopYDE+eE4jZt3PVEznhLzZhzck297uLXfO8jPhfrr9Vll
	sEMuxacjla1bthZAFwzTQwDvKd4dc032NnuPAQWsj/m9v0CvOKRTBO4abZ2u4zb0
	gxXmqXVGctbHXHNpXGAAzHOd9HqlCAQEfHcEJTJF7ixa2BrxMUCg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022136.outbound.protection.outlook.com [40.93.195.136])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4avhskt4cs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 09:27:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHvRXAZgs2dom4pKOawh5QndVYDUGz42ePoAZCDmLRLwlfxLJZ8HjIn8POsbt0pOWsCWLFDxo1z+aRQkA4HsFZKEqU+zTTre4vmbb0wT2GMGCPxbL59ZVbG3vfufzSDm0FDCzfhTDAcAmiLZu5WwMB+FIk+KzCfKSH8mLkL8IKGKWW02XQ2M+N9ki2V5K9Ewy7m6esYzK4vS1qmM7z8+EfcRtwhHFnmCOgl4omMPzwXnkCKmuxw7AKx+uPSJFhB+peeslxwK920b1NiWcBuvZ3WY/EAnk6zbduzu/pPgLb4L0RCXaQOKbXpaRcmEwBZ4/HlHgA6d2gJ8u3N9Ugou7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXAsAnN9kYTxEw/7iaFg/ijnpR+OGW2uFaVTW+6ipeM=;
 b=nCkWxQyuGKoNQ5LUuy/POJGeVZKx0Wu2Ns0CBGw4YlwYYE/HCIFEDh9sEGDaNpcOzKVGCfQYjsudk4dPxRaXnKt1mB7X20mi60sh5CV0ZEQD60JFCF+CZOMaZGIRJJeE31oSgfVWqhVNM+ot46Bz+sxU7UjECVHlqYsQez+795p7yoYJGLBMkjBWvNhH5HegejjrdxdrgpjlPdZF52G5zVZTfI2H/+gMqixR1AMtKVVgnWF0slOmSOzDjJh91Pr95JYE/cUAKOo8X6aVJq3Bg/NAion4tDo7LaWvXUc+xRX2TaASwiJT1sDLdsS1dcru9GjU7Gh2+vlaubV3tk9e5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXAsAnN9kYTxEw/7iaFg/ijnpR+OGW2uFaVTW+6ipeM=;
 b=BXfmU31sAbtZI3qtgZ2B6fYhnl9+FHo91Bfyo0PJvFEexmUFkK+zsrGGtsBiFsSojkCikr3hV4JGfhgDMko2Ip6yUlXaZZXQOI4jQTHC3mUtvPVv+P54LNs3fFM089c61DZ/AqJ2ij1g9JG1VO/BTsxB0+ANcJ60o0PLNC0/c0g=
Received: from SJ0PR05CA0108.namprd05.prod.outlook.com (2603:10b6:a03:334::23)
 by BL3PR19MB6441.namprd19.prod.outlook.com (2603:10b6:208:3b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 15:27:30 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::1e) by SJ0PR05CA0108.outlook.office365.com
 (2603:10b6:a03:334::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
 10 Dec 2025 15:27:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Wed, 10 Dec 2025 15:27:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 29A0D406540;
	Wed, 10 Dec 2025 15:27:27 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1234B82024D;
	Wed, 10 Dec 2025 15:27:27 +0000 (UTC)
Date: Wed, 10 Dec 2025 15:27:26 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com, vkoul@kernel.org,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 7/7] ASoC: SDCA: Add lock to serialise the Function
 initialisation
Message-ID: <aTmRXjrJceokKJoi@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-8-ckeepax@opensource.cirrus.com>
 <9e306719-a954-4ff4-b2a7-5fbf4268929f@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e306719-a954-4ff4-b2a7-5fbf4268929f@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|BL3PR19MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: f964184d-e367-4da0-99a0-08de3800a138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vPOzvjEnTsXFdJ7svl100pgH61zpimujamjxJez+jJaZOy2UPEdBcGg1JUgu?=
 =?us-ascii?Q?2ga7npkdv2qxQfYrM+rIzrVBZloLpu+hMijR9IWbq6qXweYAURfHBTupiYIF?=
 =?us-ascii?Q?eyumK046cNnASFhS4D/nVXtgQR4O2KbbqxO/nko5UrySj/DZKembRwP0g4ff?=
 =?us-ascii?Q?pP6gNjMRDyQwXHscUxf1OLRtkwqNwSR/c3MiGVcneoBiPj4q4dZ5jsPKlsw1?=
 =?us-ascii?Q?GSjFIGaPmYaejmmO3HLF23pXCyHe/l6qureYPATStdIzG44UvSPYwP8+nPo+?=
 =?us-ascii?Q?ail4XZcdj2FR2x/OrfX3Pd5imKrfHfPpIEnmRfbtVdFXtHEYq/l59kGhDDUF?=
 =?us-ascii?Q?XbzItAHtxwdlK+dFcwnAFv8IO/I4vEa2doAEsku3KxQ9dwnnHBhcgDDU0qf8?=
 =?us-ascii?Q?PLyC9B+YmozyciZ//olCNCBWVR3Sz8B83BG78oxIO/lh3kzJmP0BLpPqqzpC?=
 =?us-ascii?Q?cE7KIPV1eE5EG7ud2VJ6ZCZOOZJeVu8DR+reneNNS75lSb8JxseRlBgqVcqx?=
 =?us-ascii?Q?GW9pI8pTV/q2WEEZw91j6T5qaXYCucxCbmOxnO8YTno6XH1GPKCyBqqI77qk?=
 =?us-ascii?Q?SBmW1BXrSjmK9PzhQ1t3ta/NMlhIH3mut/KZ/P2bmOwRmqBZ/TafUAe6ykK5?=
 =?us-ascii?Q?Wl2pPQGGGbArrKm4uQgF78K0kq+84rEgfeOYJS5E1WN3dn44uY52O0q3osNS?=
 =?us-ascii?Q?bP+Ab0bEiluLIXL3WDRh3iXi6iIqQnAwC/3uPue/QUjmetsLchXyng2Wj7k/?=
 =?us-ascii?Q?Wt2fv5XChkXU3y9CxnxOJwL7Q8FIDdpJDL9/ONrQ2E+iCkQ0QIrEYd7Y2Mn9?=
 =?us-ascii?Q?sB8H4xLmiPM8wvomd5gNtkC9cbav3b2ZihJAyzZwJ4R6uvGwEd1Ye87gQjJj?=
 =?us-ascii?Q?/3ImuK3FPZowzw9RlO7Jd1nTw4zat8m2M7km1+AZPgHZuKOKTYxlIXYg1jU0?=
 =?us-ascii?Q?w0CsRCHXRKtQWewyFlrhHXYGNLDmKzwuA4x/UFXZm5uWqZYx4zmBpo3FvmJ3?=
 =?us-ascii?Q?YEJhK/pTGpSf2Tf2O7StTIJjlNiN75vHoeIOvETZQW4CwidwOSk94rPKLDfh?=
 =?us-ascii?Q?mjbrupYFDN01WTc49cuthGupW8SW62mCRoGp2QamP3onvE/IIB6W5Q6+FTyO?=
 =?us-ascii?Q?h66T7LQEDcrfyegLUFDi3x99mUwt2SM5QB2QZq0tEWTz+L5gJO6LGKtJcP2a?=
 =?us-ascii?Q?FkME+LfbdyDtNg8FblOPE3hJqJIcrz4t93EfHptw0a7TKthn6uJTk205897X?=
 =?us-ascii?Q?BVaAtC7w+7ybcffj8JcIaE0DkDkWCEKV+4ere3q4GVGYApnl1VlgCR4V6iUO?=
 =?us-ascii?Q?SUyGJiAuAMaJ6gSy5/ze5DQSkaX8ghs4lCxUTDOZIq1rNaxa1N6cFIjhnf9t?=
 =?us-ascii?Q?vu0wDjLGdBPeZa2T7K1eHfYMqSNTY3BhNj9lX+dmqRT1dLdgJBYbTITHpSFA?=
 =?us-ascii?Q?65XGwCk9FzU6fyTHAFiV17uujNX4HvyQ7+J0prbO0ii1zpAVIqpsqR1SROg8?=
 =?us-ascii?Q?dD7ubyyKgQXM5Q1IbYkjI7RvYFR3ZqLDDFPOxoV9h8UMyGfSxPYitqz5AKfd?=
 =?us-ascii?Q?ZMEXdec6qxZHrKJYULw=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:27:28.5854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f964184d-e367-4da0-99a0-08de3800a138
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB6441
X-Proofpoint-ORIG-GUID: vE8q5AtmSOOnzeQg6d4LpvafUwwdqGln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEyNSBTYWx0ZWRfX23slBv8qZ4Lp
 /y10y67SeAIQvtwgtuNYddWsH8oNmgoIhZwydpJXQ8ynvt39hwdNJH0sOW6iX8xdScqwp+VX522
 JJBuKg+5L2Xn4gQ19/Z8VgeogeMF1tXSEqv5+tH0rNcRjrJ1KbGV0CB2ey271rFg/rTQNPizIH/
 F3aNNWb5n0onTz/a4lwME30rOD+iMf1SYxuSeTs3nyJT9E6pUJm5hBkmsliKXsE6bRaRplyeTtK
 JE21QmouBgFGqDREKs55uVWJ54NLUgoUUpICFkkxueokKEEsZy6OAnkIkEpHrd5c6vCpjdEtpS+
 RLchWxMv+PbYSjeEPeojQo6K2l+gl5fiIqNs3OuTi5vBBdFsElEK3p0iMdJjDhz0gnqg8zh0wS7
 n6XPlaDHboGNxzl7jjX01PZEyh8Yfg==
X-Authority-Analysis: v=2.4 cv=DJ6CIiNb c=1 sm=1 tr=0 ts=69399167 cx=c_pps
 a=2hJN3FG5vRdYsizhUtvj5Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q8b9sAv2mEqsJwU6lfoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: vE8q5AtmSOOnzeQg6d4LpvafUwwdqGln
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 09, 2025 at 12:20:41PM +0000, Pierre-Louis Bossart wrote:
> On 11/25/25 15:21, Charles Keepax wrote:
> > To avoid issues on some devices serialise the boot of each SDCA Function
> > from the others.
> 
> In theory all SDCA functions are independent, can you elaborate
> on what the problems might be?

How do I put this... hardware and firmware teams are really good
at always considering all the implications of the spec.

> I can certainly see that it's not efficient to try and
> download multiple firmware blobs over the same limited command
> or BPT/BRA channels, but I am not sure I see the dependencies
> between functions?

Generally the dependencies tend to come in from the implementation
not the specification. Whilst logically the functions are all
entirely independent, that is not necessarily how the hardware
will be implemented. I would guess it will be quite common for
the functions to be implemented on a shared back end.

We could implement this as a quirk instead and only apply the
lock for parts that require it, or we could force parts that need
it to use a customer driver. But, it seemed like a) others might
end up with similar requirements, b) the detriment of implementing
it for everyone is quite low, as you observe it's probably better
not to trying to kick off 4 BRA's at one time anyway.

So basically some parts will need it, a fully spec compliant part
would not. But as it has some practical benefits even for spec
compliant parts it seemed better to just add it and see where
that takes us.

Thanks,
Charles
