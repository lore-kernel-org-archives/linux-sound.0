Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871C33F9F30;
	Wed, 10 Jun 2026 10:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089113; cv=fail; b=dUdm7qXu9M7p284sF39SH1G+Z+kRoRe5uCkH4Ff4DnjfdPHu8FzquEC+2qXRSb8njsRk021Ish/+FWrFhKBEbo0T69CTALResZgt8ALmOukyz9LXVG1wovK9vvdVZmfHbEfN+rVF0SuYkJV+Yf6xTi5JdgBlv2gl9dQ2ZNXTsuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089113; c=relaxed/simple;
	bh=81H2myhIm+PdCEl/kRardBnyot4wGnq7vPa7RnNciA0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EEVhoj9L69K0g5NaZ2p+hmbfrOaZPnm7KI5VxUGSM6NBB++5RPipXLwJT6YyYlEr6I+ys8aMcP6JZUTwrWY5czBUIovtUYhvuyeGfCyrJ5/Et+IqJpx/ufJrmPNX8B4e8RT6Q3EAdjJKsV4s4Xh9CymmK+AAcqcf4wk0yGbcXwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Va6mRIlj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=qpMUag/v; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Va6mRIlj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="qpMUag/v"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A5TZ442616004;
	Wed, 10 Jun 2026 05:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=QkRgxue9u2IDsonPAitJWVwtVC39rO69Wk3tbqBknZ8=; b=
	Va6mRIljWrLmh5XjOHHsxcmHk7U5dXxs5TId3bm4UkqjYX/lV6A1ld6QmzCqmpX7
	99z7db0A2egwsSawTmwKQQrKHLLEcW0TVivzCftWigaAEa8OGBGGfzG7lUNyD6Pd
	pJhP1g1zhstLYbvkeRYCQp3L3izWrtxafhQ2dH3pqLyVRmyjTEGWApAwiv0cyLAl
	8q7UwVVf4KOTDRjb3+W1x0RHrgcdeR+Sg7kxe1YLQLDkBMYvCQaLz6PRKhMW9N6s
	zAdud8V8ylBk4PZEjZPsDmicKWPTvg52gAV3BZA5hQiye5DhBrepgizixfnq4w/7
	70u3N9LRP1bAd5R3TOYM0w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021077.outbound.protection.outlook.com [40.107.208.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfyge4gt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 05:58:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHbpbTEFc4EJbABK+ppcQ+diWWw7LJzHyfYzm21QcnLTXTDHAKK27/hDN3jFUkdrDiWnUEM0X7xTWGjS0jflzmgdZIeNVDZoiS5+F4qvf+6KJhY5shmmCz04aEUaW3WFrtxyQgseTY8o+dxM8/Yof4LiawNWBI3TwCtu6XzUtqQFpbqwHoCRzsWUZGqFG65fE9EMzrCm1SQvd7ktgzx4uFg7nbOTUkGFUFiPcYqKAbjBDZDsp+MxansN246DTj9f1yw1mUOlZOdQHBpxAQUZnGZhCUywyrGPlEq5latVlP2RJ4oKjsco6THHTlw9zS1wNIWd9wUZevTgIsdqSzEzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkRgxue9u2IDsonPAitJWVwtVC39rO69Wk3tbqBknZ8=;
 b=NcEYKe7u4QFXsX9dOTlhqvof8V3vCohxSfTkUcOwMQom3hmFls7H8h4KUHAXBR7GGVJezKiPY9ft7D0/YXLwDxIIgOs/ea7QiEEpFj+oYM8/KXGTWP+Yqs0/wOdvE4FpxNRooiExBFI0u88E7vq+mHnCY4DkGT4eIcuP2y51uj6j/jrDHxdm2DGE6lSBiH61JYzsMkhUMIU4kEQGH3PpY5I+XfiLq1YR6hm6sSDxonCozONKyH3PeDZHcY0kANz18UO4RPm9rt/ffVE7wX1Y1FHBqyHHG05O4HG0PjRRqc8owddvTF/1R0138mrzQw0+3v2Tt9Tc0lH2aB952nLrDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkRgxue9u2IDsonPAitJWVwtVC39rO69Wk3tbqBknZ8=;
 b=qpMUag/vDsNLwfsiiwfkpkq1ZSdE6xToiU7Wt3GLMXEHaj6T8ElpUtfYS9B1A2UZj3i9wUOH03m6KGA4Ry9Xrw+0CmqUInRsi/kP5iX4j4UG0A6IyGrhWtkF7UrFmklsSkf9UErrDpAaNJao4/s35qkc7jaQY8DNzBlRGqlktUI=
Received: from CH5P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::14)
 by SN4PR19MB997553.namprd19.prod.outlook.com (2603:10b6:806:505::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 10:58:19 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:1ef:cafe::5f) by CH5P220CA0010.outlook.office365.com
 (2603:10b6:610:1ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Wed,
 10 Jun 2026 10:58:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.1
 via Frontend Transport; Wed, 10 Jun 2026 10:58:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 848D0406544;
	Wed, 10 Jun 2026 10:58:17 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7657C82024A;
	Wed, 10 Jun 2026 10:58:17 +0000 (UTC)
Message-ID: <e3f0a98a-6229-46b8-98ea-ba9349564f28@opensource.cirrus.com>
Date: Wed, 10 Jun 2026 11:58:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Don't leave parent IRQ disabled if
 system_suspend fails
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260610105556.612830-1-rf@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <20260610105556.612830-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|SN4PR19MB997553:EE_
X-MS-Office365-Filtering-Correlation-Id: 92fc6728-26e1-4da3-10fb-08dec6df2e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|23010399003|16102099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	L9FyAzm7NdRX8IUox00avXa24co3I4OUW2urv0W62vqLqjqu+wWuamyv+//A1Gk6XTnnTxE+jY4E4e2SQDfl8i06FonkqyS/jYYqcXsvLYf81gulcCCvJuYmDEkqF5pzYjmFnhEnRNesFpPAxdrook/XsH9hNpNlh6A2qI7pnL0aza6fT0jHhGJzG9YCBqwPCcMFL2EoVkQa+eBI56W3Cpd/zIX9SWwApanyi7kx6+TAdn7hXtWx8F0XJRxqSCQ3Ybxle9k5WPIw5ClOfVxzlKxxqU/qIVLo02rV5EkfQXQ/bKHECwsflxTio2Sw48qC8JECfoh/fDLJD3vMElefSer6+9iXBKbG8LH2ZzKOhHjYumldsAS+GgAgAMfvI5zD3/bo7jc3dJiv1TGDS7FHTN23RMy9Ww5aeytWRAazHCKG56AUh5RBmoem6LGrGuypxYvT6d64Ne1Zf5ksF6YHPHndCYdiAjfo1ChSwLyXyoEiitQKAonkiFFxXReppcj2zk0kgyVaubLIiGGhfglCujIEiqoJmpvY3ZyPIc5ZUTmf4FWj7Iqn5iWFDZOrcsJHvE0X5B8r00x3szYg2U3UQOQekFdcDFE13l/d8CST8rbUXQWv4LGqmc14GU11fXEABpD96/AWdJU6zxMiDjI3LJDX2FTCyzJ/qQyK7nAUquiclBs+WYnkjrHpP2SdruBhF9+Hml17sEADdKkkK03Eix9z0K5bZjGfH6mKRq4DHEw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(23010399003)(16102099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SWcpI6/WIISpDVaJ+zAE/I59Q5lJThxMpXY17S++kzFE8eUgRGZQy/4LdTqLvCP7LGa9Z8FDqQuNSn2swLkOII02VMLPJQvOA0CzxVnxYvPBIWN8ZGvrhcI3XEzm6wp+/AxP7KE4Z2CS5gdt8eD4tyLBVzq+QTzEtLAOy9Q1/G8NAG6rQi/xDAK+AyJJF+qHTeA6fOaDyJF4SCJLqbyWRkXh3OrYlN0USKZ8kzsTTXmTPnfZ36f2OdYZiSAGPBndgBGaA2HEtfVR4EiOoc+HRGtXVqr0fNsXp4e7XFwmN6nXEqkM+Mi2y/B/usn6BA3Y6qcWAwSBAxatNgMtrYk4Td4noVu4o1x7T3W8uT7fZCkWM1Pqk/sRQyGxTwfgL58uDos/PeOmiV+e/CdG+p7dx9flDwhECH6HMw2yE2/J6haPNOGLL7MFs4gUFq7loFQ7
X-Exchange-RoutingPolicyChecked:
	QhOg10iAyXBXjRkMKzC4NceNLcYz0LHpoBSnVwerk9s68dq61S5/+s2zmjaw+Cew1LgoGo5FKanSGj/AAY7OW/Hd3FjHlFAZ5VjjccUAXzBUimNeX/apABe8dcMnLrcwXLrseiZRuYDvkuy1H1+dpq/7ZAXzfdEmp/zcyhq8dWEue8bEmN6l/ZMuLXlzFPdCkSt4YhDKroXTKJMe7HVtHgxNQ614NUUJkMdGHNtdT/GE/er2qmT03hHQSXbT/IF0LaA1W0tTQloQInpd9uj84dZESUaqRg/z2/GRxxomQGp1mx5/NmxY/mDs88UA1kxnHp1lxLE0H42IVam7m1cc5g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 10:58:18.4232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fc6728-26e1-4da3-10fb-08dec6df2e19
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB997553
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a29434e cx=c_pps
 a=56BXxs5GTVekWDSCh43ZEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=7VlgX1-KWEgDdBRGANkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 8gnanNntbrgbi6hGA2xuWGjuFrGx-D-K
X-Proofpoint-ORIG-GUID: 8gnanNntbrgbi6hGA2xuWGjuFrGx-D-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNCBTYWx0ZWRfXyKOh98cysjXx
 hOzFEFK20KwCo9pYqmKgccZZc4H2iZxajncnqyu+OVitrB7ycwaustgq1MjONbWycLMi28TASkx
 3rHsdCZZBD70v9aPvvyhYN93HRWH4CKmfdxB+EJv02QBFgSBaiqYSP7RioOZsrC10rrzvDoUEw2
 pnaxMyFuJ/S7C06lGJ083hnEJNUJ0LZr9oAljDsTOmjMv4dLjneM4vYSfW1kHIroUcNni4PeNN5
 S2jO62yvBcOhgwJSQGke0DLns9ZphKy7LqR0+AVKB3EAvw5tdbm9pVsN+srAwpexUqTvavubxas
 6s29LV3yFidCAVmOun823Jhxqbc7rOWYUePM6M34nFR8jhceCMuVnldrAFG5MIbBwZFtqESngwG
 5wuN/eQJrzercK9Q4tkhAtWb5mkcEuUyQ8lSmq8QEre2ooa1GmlVXhwPhrNcMPlPwUMF3oIinLG
 dwCvzrk5btCiHHs6n1g==
X-Proofpoint-Spam-Reason: safe

On 10/06/2026 11:55 am, Richard Fitzgerald wrote:
> In cs35l56_system_suspend() re-enable the parent IRQ if the call to
> pm_runtime_force_suspend() returns an error.
> 
> Fixes: f9dc6b875ec0 ("ASoC: cs35l56: Add basic system suspend handling")
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---

Forgot to add this note to the commit message:

This is for-next.

It's not critical and can be left to trickle down into backports
from 7.2.

