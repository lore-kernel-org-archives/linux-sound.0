Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D112367A6
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732785; cv=fail; b=o5DUcAhvuw+NOjUmRrUomGtUcuLNCA44/A3L034EHTCj34WAscX0vtfR9JkrRcbvLWzNg/d+ZQEJR7rkfEz48f1lszpNyEzo0+qX2Z+JvJTL7xtsTHEAUu62BLCWF11SpQqGHQXjm7fvpzFbQx/r/n08/kgnGJX9e3PsrYwexYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732785; c=relaxed/simple;
	bh=0On/3cxlM+FWyzl1FioxBeA6VLLyt6RxNdK5BC2C+pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVjuvwtP3Cz95jlmVxvdJ57J3B1+NJNMpOTQVXovQZHifnQg3uaeywEdRHYj2s8akKIR6cqqWze4uUTjhq6mq2EH0BAT+EH79aeWHim9Ic/lxZPgBAOp8pAGdjJQd66d6H4mn0rpe/1J3M9LxWp9rXnGPr+A+VeZc+udqCbY//8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dkDP72Jo; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NUGReGNE; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dkDP72Jo";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NUGReGNE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C5Wq5o029379;
	Thu, 12 Jun 2025 07:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vE4muzvl0dvT7TcfIQ
	gTOwQHi3GB18pj8D68rkeQ5eM=; b=dkDP72JoXnpw+2svO5hdJNb+DOyYSDPXeW
	Ukl+tLpq/SsFHeHvDFYddajvRW7zLmuq9+3hMAW8+5O5hN/ouNtjtmPKpElCv7c/
	Xwun2UR9iQ69CYUU9H26Zmdj519yG5lJzoyu9VOgI3hEosaFuW0JAtXXAQvQFyvj
	0ZFOJUvA0IQL+Jl5fasYfVKzWgf4NIGpGEz3VW1WN1wAb24QwS7t+L/ZPQ1Mer81
	uPI7CbpuV2HDosgQIqjYBI/Bgo27/FErth23nNNP6RtI35Y6ZwxAS4b9fFfLpReS
	rU3Rk6HUSBaO7Ic2/kQoITH4GVKbDiatnNM0HnQ5Qf1xNncNas2w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2100.outbound.protection.outlook.com [40.107.92.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 476ksdbtuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 07:52:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRBwEqpMKxiWL3UNS6z6kTQizk0C7BqQ/0bajbjHibugogXBjtoS9DMaNzY3ukUL7vT3aE08CYX4EQDAXSNzZk1ddzy79DLILweP27HdzAIZP9UXFpCb9P52VjJOccmrE6/w6w/g8Iyj8vX+4wIUWoBdZjP5PaTJSf45w8ENnm1XjaFW/REFLhp0tiSmltZZOzhIkF7IDoO46NAghZwtQMaqr1Rh8eR0VMoqA4VvUkG0Dz3iActPLPZ7fxZmYpgNdZ/OzHEGwuBo5UC0VFOHry9kM6pPCV7VRGbvaBzp0nSNYfyThZ0+91J/VJrdkDWEg5qBS1N2lWe/jRrRaLJ7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vE4muzvl0dvT7TcfIQgTOwQHi3GB18pj8D68rkeQ5eM=;
 b=Xc36hAHzcRRzs136NBtw/IoQVJ7FUNbYm16mgvFM3fIpBSArhPLWnhTYzPPNbr5x0Z0F3GwYrCYQWqkLVDu3dXpLRYI781poLN6NSqytYDUqobk0GnN6BfD8h/Qeu4AEIstDqDKzuSpTsJIqchkrkvlHwH9GC8D/5tJjYR3gn4K5Mb7gQ5GW3BC5Rh6db6LcGIkixMNRn4prt6PAUqlGDBcyLEzyFRv4GvIl4Xk+QJdxOMgaQiBj9vGtdjI7SzloxPN7MSJdV/X4zP5WEI570VDEZIRtnujDkIj+LDJvXk3EJlkjKE0iC1tQE0mvmy7R7N7a+xGfU3raPP1Oku7OIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vE4muzvl0dvT7TcfIQgTOwQHi3GB18pj8D68rkeQ5eM=;
 b=NUGReGNEtN4QNZhD+ilutX/1L786XdDrRaAac0nKPR5LealskWK/mbNfF3wydYmm/BZv/3Az9OD53x6qc7xVXSWrkv08/MMearlpL9wvI0pTEGNUzWex112bC73YeJZJn8hrpZGabcTRt2JNOmU7VXySQxslvNhenXEyRV7eUqk=
Received: from MN2PR13CA0005.namprd13.prod.outlook.com (2603:10b6:208:160::18)
 by MN2PR19MB4014.namprd19.prod.outlook.com (2603:10b6:208:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.17; Thu, 12 Jun
 2025 12:52:39 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:160:cafe::93) by MN2PR13CA0005.outlook.office365.com
 (2603:10b6:208:160::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Thu,
 12 Jun 2025 12:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 12:52:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D062E406541;
	Thu, 12 Jun 2025 12:52:37 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C0C2D82024A;
	Thu, 12 Jun 2025 12:52:37 +0000 (UTC)
Date: Thu, 12 Jun 2025 13:52:36 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com, bard.liao@intel.com
Subject: Re: [PATCH 1/3] ASoC: SDCA: add support for HIDE entity properties
 and HID descriptor/report
Message-ID: <aErNlPlbzgHl1bJH@opensource.cirrus.com>
References: <20250611102549.563070-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611102549.563070-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MN2PR19MB4014:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf0ed3f-1b40-40e1-52cb-08dda9b00385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4jF07DQV3WalHztqcKzbMNvv63qF2G1UNkRsQ+Oea+1f13ENjFXYbADRhGby?=
 =?us-ascii?Q?RCAcmHqbWvQV1gnvaeJyBmbKPWFRMrGazf7oOyyivxcZETfy2/U0cZvnOEbU?=
 =?us-ascii?Q?Zr+ciqk4DF3ehjQY8dbZskpflEUnQRxxKGSXilSqjKed5/UhTuBqDVS/2DwZ?=
 =?us-ascii?Q?+UAxDObMhB67VKiz/7UgQyoUeCzTq88Y2CA4R7Q60anUwYA6q+utvbeep6DX?=
 =?us-ascii?Q?VUmkd/by7L44/xaFCxRZt7MhB9EahOGkPOPeA1fUVLUMAsrwzXIxDdG0xJdN?=
 =?us-ascii?Q?IaUItArhINhbyRAXSLDb/Ozv0j1aU+CJMli/xawOtha8YSYUhwNBFQBwTDxF?=
 =?us-ascii?Q?V/x7INWrhRbeAzZkZVtm/QDMSXYcVvugEYXW934+sWV2A7fAtT7rMO0LtT+l?=
 =?us-ascii?Q?Fp1lOg5TkdIyY1V7eUU1ENtZpyfbS2+xOCSvDPYLxCrsmBouvr8UHu4kEoqa?=
 =?us-ascii?Q?li3wPL09PaxRw1vUVg9QQ6eJ3fXB8F4Sl8aNWPnnPD23Tm5EmzI+Om0h4wCd?=
 =?us-ascii?Q?VUErRzq1293S9M22CM84S4sXyyofgb1Ew5MYOBZu+SAZdsZ9JQRfLiGYo3S0?=
 =?us-ascii?Q?MR4QW6CcigJBMMBVDURx4ISbs7YD1Cmifnqyq2OTt6orCM/qj1nl+1Z+Fp5Q?=
 =?us-ascii?Q?WEaJer9q9U/XsjZWNPnayno4XlFks150ST+8qCvfNVSoAq3+e+kxTv6+Q7Ke?=
 =?us-ascii?Q?14kV6t0td+NGxbVlINu4e+LKdCqlVXUe9NozTIOz3DqPChHKMFJY3pRH21+4?=
 =?us-ascii?Q?jTWHx0pgKifqElQDqXzwpYlLVMrAWuJZjM0xLLD80xjVkhUlC0uN8dI64q49?=
 =?us-ascii?Q?231vdaSGs9/MFgQZBhDUSwdb8zfZ8zP0937oRoFuynqykL72Ln+t2tW8Vrwt?=
 =?us-ascii?Q?mUptuMr2xyyD1XVVYeaSdkMAtop+gLVjFTFVeAcoXj1Gc+qqocwTDwSunTZU?=
 =?us-ascii?Q?cSCbygEzxb+e1Otep0INrOW0yX9St2kzxHg0uY57ok3f1JTlQGaahLKT+i58?=
 =?us-ascii?Q?grXJ2+auKLcFktDPXQ1KQKgPL8eT3tm79vr2gEJogKYFXq2GlvgGpl2N9v8f?=
 =?us-ascii?Q?9FBWaEdwASL1XAHsg3akEHSsHFnbtC9gR1A0vYx7qmt3mOhwSTPKMdKPRbGH?=
 =?us-ascii?Q?mS45FuJT9rrvSzxJAfRYY09cEOR7D09oGqAEFT352K+xtZaiHVBysJlu0NMc?=
 =?us-ascii?Q?OsZ93stk78g4bXyXR01raxUY18jvNyvOy/gFXmLH7mdWc19fF5lZQxjl3mmP?=
 =?us-ascii?Q?+v63LHCC/c1UvL5FLn34t04vL8ynnSPNJ0CaRxEMkF+Z1KnhqUKsG1tAvs7M?=
 =?us-ascii?Q?NRzg1QbTGJO6YKna0ZzZENasQEX+9f4hsNi88V2P5BxWK3WmL+tx/sO92Y5R?=
 =?us-ascii?Q?sTjj6zC6zDUIlT3srJrW9C/3pojkKg9DLE6Z9dzDtd6AyevDa5ZsqLVXn5Ml?=
 =?us-ascii?Q?6C6CZkEUr0xb5xDyog4xDdIAUrxKn5Ugp/hQW7opnF0tFCSu/K52HmM08WVp?=
 =?us-ascii?Q?+DAlAOnzcTH1ZurePaWlhcf0GJnyEqUpAS8R?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:52:39.2798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf0ed3f-1b40-40e1-52cb-08dda9b00385
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB4014
X-Proofpoint-GUID: iaQEN0j5gP6G5wcimqglE-wa7t2Kx2FY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5OSBTYWx0ZWRfX68ksq1DlOssr wWmNDNZhQYGP84zJQEfkGzabRKHqIqMyq+sCZqQpv3hLfURnMtzqrJ2S2XT9ON0uEKBpUcDCQM4 SlmnZN1JKLEruGRMaUcJoreclbvy7xLD4Jb9uLj092OLMivQlhO5q8m/pw8o9ChyTKO1dXKdiV4
 bgWpOq2CVeoZ/MfVRR/HTlsg7ieky/l/21VUMlcVxZH7lQKmbmqult7h07HsCrcZikQaSfDX7s8 gpxwAOagW7g4uFdypHHHYXIlo5KiygfMkF1BHXsOaKfwPx8kcddSfotAZ6YDo/5xQZQH3C2cUwd F9Cyefw6uTG3E8ia+bwjFa+MRcE2KqobETMqlOfMNsh2UOlWXh4w9/JXW2hT+VGy+iXJzOli/Be
 Z4ZpQd3hLlRy3r+N7SJt0rEyE4me5jHo65ese7CC5+1oKpferqL3i25v+vqBVaC54idE05pW
X-Authority-Analysis: v=2.4 cv=c5OrQQ9l c=1 sm=1 tr=0 ts=684acd9c cx=c_pps a=NE+w6TL7qZ80L3NA32co+A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=OSXEr-UlpKYyCdK6pPYA:9 a=CjuIK1q_8ugA:10 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: iaQEN0j5gP6G5wcimqglE-wa7t2Kx2FY
X-Proofpoint-Spam-Reason: safe

On Wed, Jun 11, 2025 at 06:25:49PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> Add support for parsing the HIDE entity descriptor and HID descriptor/report
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
