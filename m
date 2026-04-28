Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0CD374728
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 08:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364785; cv=fail; b=WHksNd/ZaqiE0ko+I0rd4g/S4RC3c6uoD2EpkgRrxy58KRGIvBRWJKrwivAZOgoc+G+KhGpUbmZGWZjgIw6GLmqggNvVuT5qbMyZc4wMzRb1gAENSe9VF7odhWViyCwTUcs9eJJvvIMDotYnAg5RxRyxvj7Vt0tfefpbNhut1P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364785; c=relaxed/simple;
	bh=YhPfFQN1sfYJbit4N3c7A/xJIkxacQO8T/dbgPsCYAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upV6mRelywQSakgWypPHxji7royiBvNWiG4WiHxDbwia5mHigdmRlbBkaszIGqZL3XVt8l8l5SRmNLIUi0DZduisnJqFWIZEOGrmyCRIYe82VdbXnF4QjU4zwyDfzTK2XjnKMLZU17NkEdZvR3BDfCaISTZqTVSfPgpsf6Y+JpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=J3W29ykA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=p4bVDDYT; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="J3W29ykA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="p4bVDDYT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S814Gf427086;
	Tue, 28 Apr 2026 03:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=q4bpzl3FK5Yl0HRWiF
	sZ9wq6nJtBS8mj1aDAdTsct3k=; b=J3W29ykAN/kaSCbHl60MtPiw6Dwoo4/UG4
	urprGdbMJ7yZH50HwWc2tgI1L9982OwE7rkgeyK5Mg/blEmAwGeRn4GaTyoN6jbw
	EUmYNVnQYLG0t8jskjPqPxowO1LqganfI61J5voksFqOB1LwpXXxESHP2XFNmBWk
	YBvOz6AD/vm6xdmzKnITDi4WkF7a0z60hn7rQYBHlOlD6trFK7z6xmK8ZDrnIvPm
	XzYFe8z3sKHOVwamDshNn4iq4HoY/ZMkxOD5YXDCioryxCqeQH+O7tJjzqM3Kte9
	HujQHJqYcNAPBYo0GTsKzrgtaOsL7ldDrohi5cFe0dI6pORwafNg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020133.outbound.protection.outlook.com [52.101.201.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jkqcc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 03:26:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2/zdM3PaKqSeWI/sEKh9f/9yjiMkD/cuMgbvls7WhiJ8TupU2VJXpLiOO0KkDQJg9kmjDM9k/2WUPpQXeGZ7K6+EF6eZZyzERw6J5bCPcEbwtWC/DwDpxhZjxetFSRCLN5AkNricOi3urp1OgnO8P9IuODhaZ1QSR2AGl9jPMb40mjPBdz85g0uXhu2B+TFJTESAsG6fdMgUkyRxagzMLLmTgVhOULxTOODpBtso4SMnM6fj/G3xAjnVbkNGpBXtF4MeaN8qO0W+bzAAknttBooKBKnFbt70Q3+tYlf1JRIfyk+dL/+yESwKSOlWbO6kNn0hHiXQB8m094SfcVmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4bpzl3FK5Yl0HRWiFsZ9wq6nJtBS8mj1aDAdTsct3k=;
 b=rewqram4xocIrJ4o/nj23NQvYuKVl3KIStuJv/8+uJW8s9gOInFQ8q6b8Pi0OSRrhbyi3aTHybWxexoqiqsxIUzV7fSo4Dzg6KZuC5rDbVwCnToNc3dZGZeUbjbSViS0Vgt+5S+6DeQY54GqoBBQIFnefgWjzQZ/TLgzSH35XUjGWBz051JsgLgYKCcxUEZST9Y/3p1tQA4YVPygB1fL31Vxv9bLgs53XbszV9TuBwEtEKYQkdhrsFrAOFj9Zdf9qRGYFGCwFGbRgvX8ns4y3HqydRPjRoDR+Ys9FP/QjNOzQhjmo3gZ4S0HFCKx+4yJ1KG5Rq/pmMnMliysv8TXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4bpzl3FK5Yl0HRWiFsZ9wq6nJtBS8mj1aDAdTsct3k=;
 b=p4bVDDYThKte3QQpyb84RbxrvobhLJT/GWqMT6HigmXU0MbIJZImmSWuzfTLm91SpyvzljshRGLdOc/8qW4tmLsubAnHf0c8ZsNWacbZ95U6YQtSI2Bckj1wnxa3S4H/g/nyhcvEAOG24dqDmkvzK5POffXYadTKD7eiYFVOL2o=
Received: from DM6PR07CA0059.namprd07.prod.outlook.com (2603:10b6:5:74::36) by
 SJ2PR19MB8178.namprd19.prod.outlook.com (2603:10b6:a03:564::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:26:06 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::6b) by DM6PR07CA0059.outlook.office365.com
 (2603:10b6:5:74::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 08:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Tue, 28 Apr 2026 08:26:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6DB13406540;
	Tue, 28 Apr 2026 08:26:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 541AA820247;
	Tue, 28 Apr 2026 08:26:03 +0000 (UTC)
Date: Tue, 28 Apr 2026 09:26:02 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] ASoC: SDCA: Support devices with multiple functions
 of identical type
Message-ID: <afBvGqzp/wDhVh4c@opensource.cirrus.com>
References: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
 <20260427115925.3801099-4-ckeepax@opensource.cirrus.com>
 <ae_w6eh533e4UTnD@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae_w6eh533e4UTnD@sirena.co.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|SJ2PR19MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d9d9b4-1ef8-472f-2be3-08dea4ffca67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|22082099003|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	45wLhE2HzDTCF/5zOXcxrYfi762Oyh4PNn1f2aeBMTraTrna+VMrzu8GmzXMIdiZsJ5LcM41ug8xB44UBtx50/npG3GCbrsFr3IIxjDy31qQjalCekLMaw7KsglZyr6WhsFveLEfNx0Ci1jOUN+jT6pGExpRGRbw7MGLCIWJZKDAvQx3fUsGpHEC7QgGg9ApofzB5FT5cE4BrKB2Ap1Mi8sDv0ef2epQtu4gAjI9D+WONDy+Qo64k4xf9O+IQ+w9bTi6M575Iz8Wid5YrfQKGs/3uaWvLFhJAbP5D6JkWAOXL6yxnlGiLzUtdk1F5YO2SsUsBixNczVyy7HZ98Lwzn9MsyP/BWUy1ZYkcx1pm4A/zbhyR//kGl+Xebo6YY+gQyDtdBPd5qw/zFiVmQjuV09TcfAP5ondNDM7ywaBn2PgXo6Oxj5JaTeSIxsu0VNAWDnmYRtJHLIk0uT3r9woo2/whW4sRPPx/30LynJAVzFk7NXjT758OsnGtUMbm9U7mNBNX7ByuniznYjsER+oI2EOo/ZRsOdvKCi0d6hxBi7siv6OLfnBSGduVAZwFZzM4DEVSK0/YpVYZapo80NU7gCqYk8scdNgmCSom106HvS0A0vT6CE/Ih5dJB33bCp1UpbleDGpJMgTXUE7Mrm/Cxre527JicLgbOdWWdMpROcOAMa4Z4hTGJjG5jMReQWewj7ZhITVqGy/f484r3jiv2/Nk08SLKHcf3fEIvHDVwZhKHlXTPb8dpjBQunT22xvm5C+9vdV/+zDjrwH37kz9Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(22082099003)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tj62q0BoDdmnOt9rQ50QTGLxHyKJ1yapoZ+0mG7HfJ9oG7M1b+gq90Eh5nSfAcJtpRySmRtDl2r4XMaGBAg9a5J+MMIuZy9IxI3sG5Lk5Ykz2M4Dj2eTxT+2V0U42OMreMDem2DuOksH8JJhwvG2JXvc8Y/p9PxY64vPyIdDTxE2R+sopsVAIxVQuGJ2I8UgZGe/5B27+UdQGlPKWYs+JFfzPcPY0ZxqbuLE7wHeT27Xxm9cBSGmxLA5p7PhtyPGufqQAUFH2rNNwtpS3QQ3+ic4VTbfD/P1LjD+xn7DLBofoOmfQ+jT+0XcTOHAL9p71DHnvy5KUy52ggUrkcTtyBzrLVhEuBzccXCZLZFL/DlG325ClRfvMvrH3EofuQYn+vSFpNUtuYwZrOVZJeYNNecneKyJy/LrAGGuY+MQSMw/o5JcB/hUtV5afokbCLz2
X-Exchange-RoutingPolicyChecked:
	nM6K6xsfpwgsgSHohPadIarvL8M++o5jqGkG+zUB2ddyf4spoQtFr6lCZspbkufxLGckUwYsehAIiQWTOmmw68gDM7YOwPejYEzKi+6D6UHFGM0po1dRqo5JmKXPQ4LIdrVJOMl79yT9VrGR1/5WxdbRvWqswzarYrK1PVBWFEzED7XYwAg4E+vb+Pt0GvxDgoS6kJ7+/PPF6o0mkMzyIqllZsOmutiAWYkn3Nx7XizuYRoFL80q68id4DrLsDDt891MGKdzKsT9YhdfDyaRfH67sPIPTOwOaeVefuZWqnOIMuXU79XSDvshJNS5priQrtqDNSLHkrZFCtYZp6VcVw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:26:04.9797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d9d9b4-1ef8-472f-2be3-08dea4ffca67
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8178
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69f06f22 cx=c_pps
 a=jUwHYlc/2yWvgdYQnTyS2w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=1ZhzczErrauljYpjnLgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=QYH75iMubAgA:10
X-Proofpoint-GUID: QBLJCvRMYXnZDxEK-w6wzNSbIEwDtneo
X-Proofpoint-ORIG-GUID: QBLJCvRMYXnZDxEK-w6wzNSbIEwDtneo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3NyBTYWx0ZWRfXxlqfzgtDEd7l
 xUb+k2noIyJUkexfihi4YeBfZUK/QY4B4+NwkKqBfxEG+bK3SV4nAZNPtj/3JGYmmWfSRwrE8/e
 p/P/ciom8jbuj+hijnqHsISpeDJYyF7JKFLihEHAhJ7HnVq5LKSi/Z3JiBEQLV8F4qGdeuwdb0p
 Ou4A3TREfstfP49ULPXi7+mQD9JqXWHmEUmHQEC1GPXOMi1XeB9BxLMqbICbSoXA+PEPbIXHsH0
 Bp4i0gPbbpPmmkj0dPmz/QBwMNUifBrh3CWVJB9TBV7vjJnlsuYjFkLX2AHuAMzLNDXZnGCT6BC
 klEQjhCLxmofl76p+MB7sjCgEBMKtlSKGjrJb5YQ4SiYsJ5xvE2DTysdkKDhyGV2iookVCUKLfU
 NzCziWZXnoMavfD1YPka2/PzJYel3Vc0VKEmLlVzuVoRgMw4WZvrsrc8PAtewQcrI1mnyTpYLFF
 B0E1dxKPw9/QgiqP06w==
X-Proofpoint-Spam-Reason: safe

On Tue, Apr 28, 2026 at 08:27:37AM +0900, Mark Brown wrote:
> On Mon, Apr 27, 2026 at 12:59:25PM +0100, Charles Keepax wrote:
> 
> >   * @adr: ACPI address (used for SDCA register access).
> > + * @bool: Internal flag to indicate if other functions of the same type exist.
> 
> That's the type of the variable, not it's name!

Lol, sorry my brain is a strange place.

Will fix that and do the rebase and resend hopefully later today.

Thanks,
Charles
