Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20D61F30DD
	for <linux-sound@vger.kernel.org>; Mon,  5 May 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433519; cv=fail; b=q7+ysWIrdbocZoPc3iUooUriIhAQVchjNkRPoKkOSJ1k/0CK2urEijxEBHKiMik9Nup9tSeo/+WKUuB6B7RTlg/t7SsO7Hzzn8OeXfDT2f/OjYLaswD3xxNX28fbikPy+BP0d4QLAeikZTZ4xXkI87tXT8u/eoVtgMpyLqVkUOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433519; c=relaxed/simple;
	bh=e5VC4qB+/sfN5u1ilNmCaqEZXcayJEmW4lDu6B8weR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvpLwhD4MjxTEDROuUdM9wyDWYSuo70rn9RA7w6hAI1tL+3z+MOtycRT+ZaIx1glBQqlbcCuUsCZZufG5HEiImHGUHxOlZUQaU4IaxTMU4z6ugZvsyCW2kAZWMTjr5yZ4497/S906G9Xvxwhf/7wsBsDRV4n1gjDzcz37/rDqks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YvZQRn8i; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=qqBMpqBf; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YvZQRn8i";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="qqBMpqBf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5455nQgT030335;
	Mon, 5 May 2025 03:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=XL/yQFv0A1o84VrbzR
	3jYd0oRAzW2ZkdNugJu4/S0cM=; b=YvZQRn8iCMT62wVHuGuvLBuSkNnapsMDUr
	7BNEM2AhHrTBuQwD7p0uhAT6o7Kd/E1aM5FoFrscDP5Ripuq/7xzvRbPikAb8jlH
	+A2O14FfxP9dDjbUc7Vs3QeWf4OXT82/wFqKpX32IdgUNsRENVvrkvACkZ91A9e0
	cr7GqlU5dO67IaJtVBPvermCAKseDZeb0aTpnemnv6wqVYHG4y1bhcPTzk9Wx6Hn
	DKpoklYeqcYqvNM70DZXUcqgHEMYKE/ZLziiSu3d1GL6ZQzQY7pixx/WKhdEfXk8
	PYMsiZQpQK3cNqRaoEnK9EmOOaxxJ95Fs/RdxHR6fWMK46hYaV+g==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46dgj21v30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 03:24:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neygOOj7Sbbe5XJSt1HnpE97FEod/AfM80SWC08LrZPtS8x8ywnTQfOAcOZFifKFddbMFnp3NWBu/pmKdVk0KuIwAYLihUu2ti8Qa9P0LgAO76LoYTU2LKwCdJ3q5SJxiqd5+Da1A7t7LIJ2UoImYHXIabRLVf+dHMGY03CobgNbNoV6+15asrDnekESzDLK7Zg//Gay970Mx/9oubhWQS8+Eu1jfIaXiC6Lca/IvD8dKaGviLQ2kZL2tb4WlE+xPBJVZyAZl6uzcz//hvknX64wXcaMnSggOxAzKknzCP3JNOk/2oz12ST+Syp1jfm9lP0RTqE86049SdgqCa9MWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XL/yQFv0A1o84VrbzR3jYd0oRAzW2ZkdNugJu4/S0cM=;
 b=pd+rJwLsxxABmAix2bynOy3a5wmEG3wUedVRQGnJmr6RwulFgHx237Eiq93Jsr0BLoHyHmdJDoUaSaBdRnlmppf40K/FnyADYv3MbZyYSLCEl05i2fPldo7l/FPsf5nNY21uD09o9/rFaMIjh5jhWAD0cNKTOLr+GXuYg+rP4yQcZbXSsDWZVExwfwsF5pCvHt6nDiRkicZ3kJA+G79QRQbnm2a4KpK4+3s4lHHHpMBI9LMrlL14BFPnfPp8YgSKOMjj1Ws47+6lRG+sE+l6GaRgz7KcLJfxlEsxbIlgKw2/pc+U0kxzZdjAIxnNmYkQ2y3NpAdRz2h2obLlghgadg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XL/yQFv0A1o84VrbzR3jYd0oRAzW2ZkdNugJu4/S0cM=;
 b=qqBMpqBfER8MdHh3yFZ//tEwWXH6HxkdEnTn5lxJ7Fc0bTr1saFetiOLjqMbGBcBhQWFzpS3mq/larMqaPN3Ri9FFhmQY7dDw4+/eu8/ctE1W/xqVVedlsWw2yPanns8yy0XvQxch+0PJctUXOEijjFNkYjbR60SWaVbWmf7sb0=
Received: from BN9P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::26)
 by BL1PR19MB5723.namprd19.prod.outlook.com (2603:10b6:208:392::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 08:24:50 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::36) by BN9P220CA0021.outlook.office365.com
 (2603:10b6:408:13e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Mon,
 5 May 2025 08:24:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 5 May 2025 08:24:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 94B29406545;
	Mon,  5 May 2025 08:24:48 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 814CC820244;
	Mon,  5 May 2025 08:24:48 +0000 (UTC)
Date: Mon, 5 May 2025 09:24:47 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
        kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
        Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 2/2] ASoC: Intel: sof_sdw: Don't bother to set platform
 string
Message-ID: <aBh1z9HufYwwVZQZ@opensource.cirrus.com>
References: <20250429093931.343725-1-ckeepax@opensource.cirrus.com>
 <20250429093931.343725-2-ckeepax@opensource.cirrus.com>
 <aBawJxaiReagn596@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBawJxaiReagn596@finisterre.sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|BL1PR19MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: 61826eac-b4b1-46a1-6838-08dd8bae4da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hG3vZ2xwUoehe7t/AlakMgz2227qps/wLYbxVk8DD1GZlGZ+g200uv8iqZcw?=
 =?us-ascii?Q?vc0WbSgNnc7qKUhlAskOSo0vhJkakg+T8xr0sxy5AjZy0RgFgPaZTg+GDa0y?=
 =?us-ascii?Q?7y5FjPtNwIyRhBqQZi6Mdk5BLUyp0Fcnn5qj7hIdTh7W4kRtUbq3X3vS68eu?=
 =?us-ascii?Q?o+sfYV0XI5mlks0c1i6NXgpEMIWcM4Y3uXPvBCq4YeXfZqxutDQp2EE7DB1B?=
 =?us-ascii?Q?tszhDe6TV66K8Gh1apfUh65gtlLbFt2dh+kvvY1cmyyBjWMRqS5btvynCa+s?=
 =?us-ascii?Q?j2bmNn3SWODI+WCg6VBlhkjhXROBSwJd4Csu37MdNxUl1oyXco6RfcnFFRG5?=
 =?us-ascii?Q?RFpEUCXapd70F0AFQN0wRnDVq8PXgQElFtsMDeAm25TioDVcGsTZl574QTb/?=
 =?us-ascii?Q?B7XImhi+zTwuF3J/C+aVMk+xHegK1RLAYcpNp5gopdViPEcHS8ppAx5mS3Zj?=
 =?us-ascii?Q?7czrIYkSChs6APV0+YNUJQXUE0AyCT32iJF4ovlgVGCShljujH6XWWNrdYVm?=
 =?us-ascii?Q?g7vw4AglEXsvIuJxEesZ7n7pW2aIkpAwycKW1IZAU8XEm4lslMwMuuqSMmMV?=
 =?us-ascii?Q?BdXT7T/UWfsdkoDmausVcclMPxBwOGvpg6GPMZJEeXIece+SW9qfxVn5PINN?=
 =?us-ascii?Q?1lwCTclQ7NTg3fDsOAp6hP7aOffXoTwKd+BuHgLiuBALQ14+IaqDAXYLqvhz?=
 =?us-ascii?Q?GR/ZrUw7It8Crdc23gUjBbVkWlJjk/HGuBEfxFqUZ26pU2M3A3iuIgBRflRk?=
 =?us-ascii?Q?orNqu3lS7d90dwJt5tAcMCDQUdDQz1Vu7sEHpJaVnW6QI1Vq8F2N8yLUMGFI?=
 =?us-ascii?Q?rhqziQvCMAfemY4NTyV14s3zDugy1TkkomrewdKoK0wNb+0rYY+LU6JxeMB4?=
 =?us-ascii?Q?vCiyCVWmKkVJin9egVjGZkoqB+F4qrJWdF9zIML/4Uh7FLrXM4QoHtavs+zq?=
 =?us-ascii?Q?9kdSAzVSWiQtw1r1gxtXj6ZbBNPjkYl3WNvKewF9RFx7esK6z8+2flU3Ae9W?=
 =?us-ascii?Q?S9cIb3gcpCe2VBU4XzPkz6qS/y9kRsLDzKyX7eFwfZcy2uHVM08rdmPssGBP?=
 =?us-ascii?Q?5cbKCZU4q5nQ7Kr2ef8x+AIjmEefEULm7vHoh6h4w/mwZZMWecfS3VzZXBSx?=
 =?us-ascii?Q?tlni+usOllXlNIoCcO+1uafHpTYhJkQniYh9Yaq8/Tw20YUkVwlJFPyBbcNQ?=
 =?us-ascii?Q?00MtIQTaQRSAFuEnvouog2Q6eC84JV2W+sWCubdZGhtOo+k0FfnydhHKO6wo?=
 =?us-ascii?Q?FYQGwLMvW89T/Csp8B0G8HDcQQwxAKvsAO5LADVnLEE0xUAcE8+FFAhmVGKL?=
 =?us-ascii?Q?QKSr7ofAN43h5nDEMS7kjhaKkQyYC5bjO24LWPo+eo9w0gD0ROB5fqEVPDsM?=
 =?us-ascii?Q?+MxWBVOiIrRRr2PPAFDVLj7W36U9CEwWpYud/zps1V1a1x+8JWAO91Ceak5P?=
 =?us-ascii?Q?3qL5sdzXgSK4J+1tzJHQeal/YJbWBMV7CJo68TNO52Sc05VBGo+eQxXYR74L?=
 =?us-ascii?Q?uhLb+cmzds+gdeqWX7XO+2E3N7aV5eyRNH2W?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 08:24:49.7858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61826eac-b4b1-46a1-6838-08dd8bae4da8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5723
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3OSBTYWx0ZWRfX17OrTHHMQueC cshUkI95kQJhMZKcMuRX9n2Ka3CrkQ+cFa67InvPewAPeWp/LbdtsnV+lNgknRSWpbAyj6WM23b AryMbaDeCZoYMjEzbkNm4879XxgYhr57aDcJEAD8GlLQO1fwb+Ydu5y9aPnJXpsExiWZ7JODCMH
 B/Ck17r82+9KYFrGrvLzW27C8+X5le2Rth53QNl1ss4WpiGtXXAVCVBapMk0rnxQfmfCFH/9b97 0nwiEMtz9TT+KTarNTp1dhEyWUx4gOLHvfq2JC2tc2Ddc2vgGxpO80GAhQIScs0fZdf4COwO9op 39RCYSBtGazPgnlsyUsZX6kZ+nH4e933hTqJzy5ZML/jPgDA3bnAZ6zL38rLvKQLQG4sri5+vv8
 6YCkzW4p059FRS6NhhQbiIQRoCvIpR/G/KsOByjwfz42nf/KJSc6z0ysRMYbjMhSNms+h7MY
X-Proofpoint-GUID: 4vKo1oYfNbKeRG4IV3TPB0MpbDNiMiFN
X-Proofpoint-ORIG-GUID: 4vKo1oYfNbKeRG4IV3TPB0MpbDNiMiFN
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681875d7 cx=c_pps a=yF+kfS/uWKtSACHbTM5LMQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=OsC-LIATmBCMWaY5KY0A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On Sun, May 04, 2025 at 09:09:11AM +0900, Mark Brown wrote:
> On Tue, Apr 29, 2025 at 10:39:31AM +0100, Charles Keepax wrote:
> > The static platform_component name string is overwritten on card tear
> > down which will cause a NULL check on it to fail when the driver is
> > reprobed. However, it turns out that the ASoC core sets this string for
> > all topology systems anyway (after the aforementioned NULL check). So
> > there is no need for the machine driver to set the platform at all,
> > replace all the platform_component stuff with some simple place holders.
> > 
> > Fixes: 52db12d193d4 ("ASoC: Intel: boards: add sof_sdw machine driver")
> 
> Similarly here, this seems like more of a cleanup?

unbind then bind does fail here, so I think the fixes tag is good here, however
I will try to rephrase the commit message a little for v2.

Thanks,
Charles
