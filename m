Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282CB32D7D3;
	Tue, 16 Dec 2025 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765897659; cv=fail; b=Q2tEDBchzg77LpZ3X1qruOnpZ3IywuCJAF4NgGr57OUBr2fZU9tsJg0Ef/JKi6oEgL9Qb3snvFRSwBApOkdHYXwEfNBmsv7kksr1jfeS6w5DuRZGIr25Ok0dlxF8mOF72yny6oUVFuD8bNpjnW8whLYiWr5HvPdyyK86XWYXBPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765897659; c=relaxed/simple;
	bh=+LiboVYW0qJBmSzKgfIC4WIMCoR5cVFhfx4CTaW2JpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8I9pYT/svju0tYerO/Hhw3O0XbKZydycbuMOUOqlf4pILBn/rxt8fS4L+u/i/hYOKmAyZPW+w1Rj1ZulcfEawJaTgo+MiHICeE+zpWqVCeeIBGz0PGeg4T1ao0IN/ysUJ6jXfZyepU/StCNCFNgdplb1Cxg4gfPTUANW4/4S7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZV7INFb6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QsiTZFHB; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZV7INFb6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QsiTZFHB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG18HnJ4074181;
	Tue, 16 Dec 2025 09:07:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=258sK0bN2fuJ1iVocr
	Of3VUj1/eJC87ihTHef2RaR70=; b=ZV7INFb6X+8sNk87vrV0B0f/Ybj/driMrH
	ErRk6Ag9VJS7o9JTiRbiTTUEj31c/aHvpK7jsUTl3ED+hUtdyqbGLjNiCvvY6iwj
	pOCWmMO2w/p8AVt9bgQUe/2ylx4XU8hbHxAtF6tOBFxwhTRoW864nEnWjSHsTDU1
	eZHIr/DM7+k0zegAUSKDAJZXyqtr4EGBH4lmZQ14UPn9fSs3HwYB91lVVYnOpHYp
	unKufkW672OECbJioEFJT0d9XL2q7sUAtW1Kh6UIcjScDDWkUmPF/pVkzkpabzjb
	hhJflFjGdk2UE8hsggx8fQt5RW326tAC4+RRV1q0Kl04+wx/6oxw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020079.outbound.protection.outlook.com [52.101.46.79])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15ejbj23-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 09:07:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPCsS+FlmNj/BOEh/SLbdxV0gki8ge28SzcE2FHFCdI3xWOLxn0ryikfyVBnRxrHJjSAqbsH12WvPpnmTHhUZ1yCM8GocmvE7DwqgUxUXgsDFaCUl5pK0HxFW7z37EOA4ve6pC+wPJiirRkFCDdit+cQNPm8cIwcwbhu/Ne6LjhrDBjN80NZTXufwMSanwad1JBRyhyyQ4LgHk/wc4yDvVMm1vJ3mcrqsWP/6sEKVDaf3GNsplmQS+zm0d5Se0WlJfkbtsSPH6lftrjv624+E9crrEma4mdwlQBGm2Eoo6WIEuJpN7Siz5i0BGK/cFkBbmBeDdjeDgSlHh+XivHXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=258sK0bN2fuJ1iVocrOf3VUj1/eJC87ihTHef2RaR70=;
 b=DJI0mgyOY4MsGaSay8LF6PLvlh/oaAgdY23uzVJtZMjDLF/77eZVMuTMSOvEA/Vsp6Lqce+g4NN+12+brW80YEqMRFkcO/FzwV5qOKngQHBCwXeVZrKDvGqDhrXnd71Q/b057b57IzNcINIynFboeXVG7lOVCiHKpkmDlabl/c0BdIctHnK42067FbzAeBFmg3T8E3Myv7v+jepvd5a2DOZo3Z+9aZ/Ldkc4kIsFdQFst9AmUSaNmhFmoC/LAk47B/ADZ3HkUWU+TqdFD2RMqaIMJCJOXPeumhWO58tgbgFg1w7P0EtzBEuLpVZfwFUl+H6kg1kmf/zK/hVqxJN5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=258sK0bN2fuJ1iVocrOf3VUj1/eJC87ihTHef2RaR70=;
 b=QsiTZFHB+dX8qc/O7zD1HmRK6fVEa5pqL6JO67K+WwfQXINlKxb49Vags+j0cz2WEnNAD8zXjXMrAXAVHpNOol75cdJ2XpJItEQPd33H9qZ0BG9s4PNhVJ1d+Ka0h1LbN7jZ7PYJ8O7nJn7cucslXY4wvyTNt7x+/KPwR9N1Yss=
Received: from BYAPR07CA0104.namprd07.prod.outlook.com (2603:10b6:a03:12b::45)
 by DS3PR19MB9461.namprd19.prod.outlook.com (2603:10b6:8:2da::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 15:07:31 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:12b:cafe::11) by BYAPR07CA0104.outlook.office365.com
 (2603:10b6:a03:12b::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 15:07:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 15:07:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DF1BC406540;
	Tue, 16 Dec 2025 15:07:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BC59E820247;
	Tue, 16 Dec 2025 15:07:28 +0000 (UTC)
Date: Tue, 16 Dec 2025 15:07:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: SDCA: Allow sample width wild cards in set_usage()
Message-ID: <aUF1rxCXnKaGZcwb@opensource.cirrus.com>
References: <20251216142204.183958-1-simont@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216142204.183958-1-simont@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|DS3PR19MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 279e9380-504f-4d56-7ee4-08de3cb4d577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EhrGTH5EBGBFIxyDC0207UYdLMXH+X3+5o5CVWOHyhZqBd3Fq+wrnMSuA+qD?=
 =?us-ascii?Q?e75p7mBbU9cx8l2Je3VS8emboHe+hW8yBXqI3RlhCKIWTWgqzRC0vB4Vreio?=
 =?us-ascii?Q?LJXyVlQOrwIR6MCDJZsAgL+8vUi10lMzyy5Ts94x+mBF+HWe5fxAaTPJFDv+?=
 =?us-ascii?Q?WCwNBMqNds/3LzOzbLUczhoX/sY7DbbZOCnnMeUBMOgYjrRRlqV1fZ/EwhFp?=
 =?us-ascii?Q?y7W/qCZTUkD7VLr/gv3S28WZAPsJL/Q0dBo0SDYPfh7PhybRVF0Q7z2WFew8?=
 =?us-ascii?Q?oYEntIPwvSc+1fpErYZABfOyWTo3N8dRMGxS5UN6hyMitfSDxhIMu7kdHD4f?=
 =?us-ascii?Q?Xo96ZvhW1K1HYwnz+oBS4mAYwhkf7IT7v+53gFomH6o2x3fcd4nZNK3YMZpx?=
 =?us-ascii?Q?IPShRIFcKznTJ5QQr+ppqB5oHu+iYPQcoVSIhiWzwYlrugjgRUC0n2++LN+O?=
 =?us-ascii?Q?rwhGTU3arAPKDb5hX8gj7TFaerKt3xF/4eN3mEfAq0gdmQl340hsbTbrWqJp?=
 =?us-ascii?Q?3Ji4Pkh6n+6stsNnSewJPmVq1sbw6gr1HFXN3+avuXveaib8/yO3LvzGBDeB?=
 =?us-ascii?Q?gnq9SswNYGWg+9d2qoCYp71Lwus09uUSendsbreo0cs3Z56BR6wj1KNLV2lG?=
 =?us-ascii?Q?GIgfZW6AAfrSj7NyhCCoC3ih1MuyAeRtxGvvMQJ8FxyAOSHFPa4gnXMf4qvM?=
 =?us-ascii?Q?e9qByvdptwn4mCxKM/uJHO5aeeeFpeQfM0Io82RneNiaRUfccfFrzDB1D+G2?=
 =?us-ascii?Q?kUoUesezqsEwVhPS4WLa9w0G+5RASs6Z9AxHhT/bY5d88l/D6/ukvqURVJcO?=
 =?us-ascii?Q?5IqAWke7j4pxlu6mstNxXP/N9HqiSTccNg22ELqxT1kH0XrI9zWqwkbpygnw?=
 =?us-ascii?Q?SSE07lUvvPxjEVnnNhGs/Zhc0u5Mz0HnUwvvA3WZs9ZyOaKKku9WBda6nicv?=
 =?us-ascii?Q?RjpJk7Onj7ByV+cOU/p5A1BXa/cS2AnWYuyJS+nwmjkiL3dE3EXBV6HNTRk8?=
 =?us-ascii?Q?ruz+tFieYkOLOhFs6dl4NdSvAaXtT59sKjvJChhJj7BFbG+L7825bS84FQUx?=
 =?us-ascii?Q?oYCiM8ELOtVr5YSQWlZ3WnIhRMM9KKgx79ACibEcGQ+N5I9SiC1ztNLcY0sO?=
 =?us-ascii?Q?dfmICUsr2cqEvvWNz8kco+unGI5nWKxTOJCIer5j8bEfvsiTVSTdVZjxrjwd?=
 =?us-ascii?Q?t3Tq+V4idYAClN4ioLrjXjhHYAkX5j7frPRNGKknLmllCAA5ojEH8Ahd2Yay?=
 =?us-ascii?Q?W9p6lAm7uZXOYmtp7kculR0ClfcFOVOnuelKBTvdUhzckuev3zHdFplRExkw?=
 =?us-ascii?Q?huKTdD95i7L8gGzH6O2GX8Bq7fbPVuWSSfAmJjWQIuO4shOO/XKd3XSPZUcr?=
 =?us-ascii?Q?y7ZjhZqoSfZUInzIm4rNKYsO4UHd8jAIX+ZMs9/y6c5JquTraPfA1/dHCUY2?=
 =?us-ascii?Q?SBwS0NgzIBYQpQ61iUZkRSSD0pkiMsEQ7owUcJHAKWmd+lkwBVadVO66e1UP?=
 =?us-ascii?Q?JhOpyfsrVlhi4bkvndil9Binlj6O6Ro2MObgsv5PtRoKTn1RGzyUBENBl4MU?=
 =?us-ascii?Q?EmOw43mSwtmyAUbSlUI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 15:07:30.2930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 279e9380-504f-4d56-7ee4-08de3cb4d577
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9461
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=694175b5 cx=c_pps
 a=8R92SGvJzS8WgIKP7Y8NHg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=FkAu1s3vRHt8nZNXbuwA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEyOSBTYWx0ZWRfXzKT/bTv5TEcj
 TR/fZmcXKXE5R3FE5q4e5sPeqOOOXkIpi2lhmK1QTCNvwDgOjdPCpcpo/nORMvmUMlSxsyagB6F
 gyPHMnCQx+kbWHKlxtVizl9Fi76Q+wR7X0nPngixH+T4Hdvpocu8OG35DRMMJfAHZuMYP2knMK8
 e7gnJVpus0bjgxn8na2uiTS6h8Dm1aBoFBLAQtZQLsxYuikTcJgEIYjUmAw36v2HIlv7bHgr4ll
 a47sdU4zMIs2JGAHRnhE4yKpirRq6d3b0NputEZtCJGoZWBeywHiCfXXGOMGSQl/YlIqTFExrgm
 yPADmgS5ay0iLfYAQ8sdbXyYLvEDAX3r1gHIrnVQt5tCHNEG7LS4eXpNX63AUkSLFgODBSD9ExO
 EFWh5RMPpCuOoH+uliCkblsol613pg==
X-Proofpoint-ORIG-GUID: 6I3aTA5rbthlnFIyWA4nBL4UQGUsd4pL
X-Proofpoint-GUID: 6I3aTA5rbthlnFIyWA4nBL4UQGUsd4pL
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 16, 2025 at 02:22:04PM +0000, Simon Trimmer wrote:
> The SDCA spec allows the sample rate and width to be wild cards, but the
> current implementation of set_usage() only checked for a wild card of
> the sample rate.
> 
> Fixes: 4ed357f72a0e ("ASoC: SDCA: Add hw_params() helper function")
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
