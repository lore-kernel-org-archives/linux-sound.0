Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D623876DF
	for <linux-sound@vger.kernel.org>; Wed, 14 Jan 2026 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384762; cv=fail; b=uGL29BdAccce4WLYGOzhldzdzjC58ULoqRhMgKrRmaLg8If4eb/uWf17w9HQAMcNWB2micwr99+ZvyIKrlJVA4pRWkd7P3ZSq2BFXPPUBmPx2aqxLKtImkxEKAFfCC17R1GbBLqaEJdx3wyK2EVYEXEmKqKHcRrWShWdcXwlidw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384762; c=relaxed/simple;
	bh=7xV6ihNlokyXwjzZ7k9NghbkIqXbnzdOCc5RKb9e4yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrXL5UKq3JCC6OlYyKpScm1t7BtW751Sx8rW709Uwxah2zgzhk3UXZp4tHgAXd2EbiAnKlemfoWFnaMuKceOT+1FycGQ46Tu018lcB7PAzHszrFVUfwvMcdgSthqJKU+mTBj+TACEvR/HhfE0moNDZ3u1s8yULnI2Z+x14WOJAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aJviKNsX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KLP8IBhH; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aJviKNsX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KLP8IBhH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E4GKSd3326269;
	Wed, 14 Jan 2026 03:59:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Uru8iQhY9eTqVv+Urs
	AXFX9/qaPEuQu6b+ObPd3Gmzk=; b=aJviKNsXWxbYEiddd8l7ZUd86g7cByzpPm
	pFeFHI/sPGxHT6f0C2SxODiSpisj6kTb+4kyTKyumwUUJFtrsa8OFUFLxPvNY+nM
	oFgHtZF0CMBOY5WYH9/UspuCXDWpmpk3VQ9r7/exKiB0BZ9ljYm9LqAm4Q1O3wqH
	pQt14r/tt9rgUkm6mb5AIvF89pSvTXgmKNgcKxk/LKaVRUCTEEr0i10eTXkUulGA
	E7Nc3ea9m8UdRIPwZgp4/qXIBCZJp+NXeWkLu/fg0CBleMBOIjJBYy5nuz1ClnwQ
	Sa1KFJuHdxu4KaJP2MDyrinDfV1nnE0oJPNeFylgrrm7Q2U8Wuew==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021094.outbound.protection.outlook.com [52.101.62.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n47pg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 03:59:03 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfpulLJfThQfPECT6nI5C+DGh5Fti06Ex7lSpd8DJrj2bbd5nwF7/NWOvp7R3EdA6Q42nui46pjuibhtn5Ddkbsywe6ZMAr1Hv/HOtTFvvr8/YiaLiNh7kKnw7BVstiYDlGbKm3sXjP+znIKfn5pqtQ8BeickVWlmIS+1GbxpWZs03fpaU/F52cD/FCOhicbSXqjMRxdenq7HVk1C9S3TUioo2D38o2YJrBd8gatoZsa9uMqElJYNKIED4ETQlt6dQdIvApqkR663uRAKaiRweshKT9bFeEdyLdZ62r8OPmxdYMYW4oa0RYs6Nd8Wy9Wm/54FpNi1QTtQreST4aB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uru8iQhY9eTqVv+UrsAXFX9/qaPEuQu6b+ObPd3Gmzk=;
 b=KDnX70Zblg7cEhHgZXJGHpbI6q0iXUR2OQbDAbfkdl6iVKYrqW8jJVvBUTPm5Qoc2Vgi7MWKLRUXTaHpU/4++BvsfxGBGVTbkpMPA8ok4n4BJ26cT/dld6KAQc1qKXWCspkNF39NRTU3cO+zQzeSufGa6wcqjQzxY+hFRQN9MaCjoYfWCkpWRFYLhRT9TOYDkRIb/+qVABQf2kLBJSZGB+sZzKeWavezQq5W/9FoxL23z0U+5WgcEpuDRqPuC6BJiEAUTxCMGe2ohQ/4b2V/QJ5DKFBDkTUNnm/eiXoVCNhuHRvDjA6uh1S44H8vVJz3NDjEdf+OQUSzbQsCeVz4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uru8iQhY9eTqVv+UrsAXFX9/qaPEuQu6b+ObPd3Gmzk=;
 b=KLP8IBhHWHgCOu94rSztavr7sL7ArG5OJJXThqOSFGCtBXhRhl1wnDZJzGoD21xH/mzkwjIFXh9m4RG/k4+XlcsaLHP4csQsfyN4I63VwuEdbfNcLMawxebtCvlDwT8aShJ1bXNlwe5QpdDbh7RR+7ilJMdBbt+F63ChTvGGxYY=
Received: from SA9PR13CA0051.namprd13.prod.outlook.com (2603:10b6:806:22::26)
 by BY5PR19MB3988.namprd19.prod.outlook.com (2603:10b6:a03:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 09:59:00 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:22:cafe::93) by SA9PR13CA0051.outlook.office365.com
 (2603:10b6:806:22::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Wed,
 14 Jan 2026 09:58:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Wed, 14 Jan 2026 09:58:58 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 80B8340654E;
	Wed, 14 Jan 2026 09:58:57 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 64304820247;
	Wed, 14 Jan 2026 09:58:57 +0000 (UTC)
Date: Wed, 14 Jan 2026 09:58:56 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
        vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
Message-ID: <aWdo4CQB23XOk+QT@opensource.cirrus.com>
References: <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
 <382ce438-5251-4d4d-af44-863197c77b94@linux.dev>
 <aQo0d3UWKinyzTYT@opensource.cirrus.com>
 <5dcb51e4-e9e1-4b26-816a-90c92fbb200d@linux.dev>
 <aTlDoVxI0gJMQOuw@opensource.cirrus.com>
 <0c9837fd-5ca8-464a-b365-a2e2bed3d9e4@linux.dev>
 <aV0HDh57C2gdtYc5@opensource.cirrus.com>
 <030c6d7f-cccd-414f-a2b7-51df88c7991f@linux.dev>
 <aWaAbaDiuJlCnL1Q@opensource.cirrus.com>
 <2ba6e4e1-1040-4eaf-ac2d-3a308866097c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ba6e4e1-1040-4eaf-ac2d-3a308866097c@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|BY5PR19MB3988:EE_
X-MS-Office365-Filtering-Correlation-Id: 9574a528-35c1-4617-2d8d-08de535389a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KrpFWF9K5EB7RzJYTIflTbW4i0oCqllRVNyjl2NPnlq4F+OfJwdmKlGE13dy?=
 =?us-ascii?Q?Kd27JddZ2yxI8u4VlD0dM0nQ1cNGNrfnrA430f6eDD/RIVsaT0FWQQFXox8f?=
 =?us-ascii?Q?0kpu9hrr1NN0XXOevZmtc3Yy8tnaTlM/I/F9OdzwMA5e4JvfG7x9nQx8LleS?=
 =?us-ascii?Q?3y+v319KYFXzaGRBcL+Dt+UBCWG+X+lHtcOYciQUu/aQ2LuglbAPIdVQYQoK?=
 =?us-ascii?Q?odMF2otQK59EqlgnH9N5Cp7Y31xNwkFiKQvOh+UBwxGYwUAFpWUWfx9ngqEs?=
 =?us-ascii?Q?xCnNNisTbi35kpFQXugg2mCmdho3kR/EGo65jfFGo6f+GchrNFFpED+Ud57Y?=
 =?us-ascii?Q?856PVfEJthOruIHbUIhzKq3Bcl1GJ9vEv9UPEtYPK8yXAWk01qYPGKSH4cmm?=
 =?us-ascii?Q?Dd7wM4mgQwyQ8DwFNWNJNh6h8GXEN1ax9MaFMUaqMg+A2CHoMKmZHthtilXL?=
 =?us-ascii?Q?7opFyq0KB2+mMna7HXWQpLFFAfCjrHy2+2BFinc83OzG3xT8M1G3O5uf7tlO?=
 =?us-ascii?Q?fM8kMIlqbIcADcwHv59B63jWvLQ4fuhu2pET6C9LfFr87c97rePYjGAkCFs9?=
 =?us-ascii?Q?yUtQOwp9bf3IqvIDnaIrzJR9liBYDT/EnylY5Nz7SWY/zZQbIFguF73dMvS/?=
 =?us-ascii?Q?7QUDlJnArxD7fki2t6xtxMlRy3Syj4kWwytQ32Yb1DTO0i2of5YlMscYYC2j?=
 =?us-ascii?Q?XKLv7eVUX+uwT0GZ4mmE0NS/op4G5p/H8FY3QcL+OmT/7wJVp7kbBbSlOMr4?=
 =?us-ascii?Q?+JtgT7JGbUr5A9USkytXKCOInYFuxP+dQ6/Y22yZGsdacSNrSsXf3CovYkDg?=
 =?us-ascii?Q?hxF00Xmqmj5OjShEF0r7tWxoL2sLh24N6QFN000sM8i7MRRyqxj3DwIylAHw?=
 =?us-ascii?Q?q6ebsep8GCmL4nUuOtLK1THRmup0PL1cRJzw6wNGKvVuNWFjBWrbSEaDz8nr?=
 =?us-ascii?Q?1p5Tpkf+wmiKIoSUoPTNdtotY/ECCYNFU2JS2LEic+F3mbXr+z+6L1LSlz7F?=
 =?us-ascii?Q?PJ3M9pc4xPho9rSRlEhPBPiMBzhNB82Hf3FjlTtLwpphuzeF8IJEA+fYDrVe?=
 =?us-ascii?Q?6nngpfQQfw5DaZWs9DixHmig7NOzmMg9ETn15tn9tY0MdF4XycNjqlagXaSv?=
 =?us-ascii?Q?Ng4KMQI4PrTM0ZhUhXTvraKMbO56k/pKQQsFK6Gxzfr17xmkIxHm8kfv0/0D?=
 =?us-ascii?Q?ffktnLBm1PO6rOEVSvKCuNAZe7+PuvZN84O7N0YWNv9tbrgJw6I/eGWO7n8F?=
 =?us-ascii?Q?Tz9lD2hhJ0Yny21Q5NMtMjURKPfNnNUDd/sqcIpbR8P1SKi6iR8dmsM0xjyW?=
 =?us-ascii?Q?X8KkC8UfIJcI20qHaP0/CvBaFxLIl0TtPwPAAYa9Rg/hmR3DYSY/uw4GtLdD?=
 =?us-ascii?Q?jGj8wLdnTh+hsNfP6mUJDPmauzh7Z/pzzWW6cNzab3lNPvj5uj/rVQULgs9u?=
 =?us-ascii?Q?prNx3Leeu4Ch59u0QS93IRRWnUAOFXEDcrIAvIy4cML1g+6YEyAiU96bpX3u?=
 =?us-ascii?Q?cGhtcpByVWGH9kpvenin2ubD5kcEAbgmN07c61KCyT1xqFZWxPRk8swD4DtE?=
 =?us-ascii?Q?HZVgKFNdMkYq5zVr+8k=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 09:58:58.7022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9574a528-35c1-4617-2d8d-08de535389a4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3988
X-Proofpoint-GUID: LqE7eFdMgpaF__W_Hj5R_lz8dvRJ4Pcq
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=696768e8 cx=c_pps
 a=QffN0g5EZ+Wxgj/Qwxz7mA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=hJPvjt9x6o9K6LftsbsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4MSBTYWx0ZWRfXxIVNpO9RLq2N
 8Ao6o8vH/qylT9oDPC89vdKvXlwWTg/TSOPvFkDGKMoB+dw/EpS2WcfcskbGVikEG3mmv41h/nC
 RwKZqL8XV0JBH5LchqmXrbDqZJRFljHrXH4hf6q2Ag3hd3hkT/4HkgPbLbq80zV7BwIp48sCgLp
 WVr+kiCMjjXlCeGfsq1X/SI0LqRgZJoI689/jMZ3P36zZRdytIUoXarQp/laqQVtu04mbDbKTac
 pG2SHESXN4vfzPSq0brqu6KTa+gzXje/2lWwxravWGBAWd0hD4B0BQcLweQ4hAbNqgyaAHZmsro
 fLIPYrzaI1tSF2Q31CuFWm+V3s/LcRwgzMN0QVKOU5GL2zYm2ZwcgIEUSnxE5hipXGYsaUMXfpw
 fe1DVGD7GrKKJ2sBZAEGqXQ+QhCrx19cCtOROngDVMotShtQSSj9vg0r0tjfa9KVR4vWL5QKWYo
 rviIx8HQezIpsm64uLw==
X-Proofpoint-ORIG-GUID: LqE7eFdMgpaF__W_Hj5R_lz8dvRJ4Pcq
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 13, 2026 at 11:05:31PM +0100, Pierre-Louis Bossart wrote:
> On 1/13/26 18:27, Charles Keepax wrote:
> > On Tue, Jan 06, 2026 at 06:10:06PM +0100, Pierre-Louis Bossart wrote:
> >> On 1/6/26 13:58, Charles Keepax wrote:
> >>> On Sat, Dec 20, 2025 at 12:04:47PM +0100, Pierre-Louis Bossart wrote:
> >>>> On 12/10/25 10:55, Charles Keepax wrote:
> >>>>> On Tue, Dec 09, 2025 at 12:47:06PM +0000, Pierre-Louis Bossart wrote:
> >> That means the drivers need to deal with cases where accesses
> >> to devices might be delayed due to slow sync or sync loss. As
> >> long as everything recovers we are good to go.
> > 
> > Yeah that is a point we slightly disagree on, I really am not
> > a huge fan of auto-recovery stuff. Been involved in too many
> > situations where the auto-recovery recovers *most* of the time
> > and takes a 1/10 fail to a 1/10000 fail.
> > 
> > Taking this case, if the device loses sync during audio that
> > is gonna glitch the audio, which makes it a problem I will be
> > expected to fix. I would rather get a report the audio stopped
> > with a log up to that point, than get reports of audio glitches.
> 
> I don't disagree about audio glitches, my main problem is
> with sync loss during initialization or suspend-resume.

I think we are in agreement then, I would consider dropping off
the bus during init or suspend-resume to be times we expect this
to happen and the driver can take care of it.

> Maybe a tangent but if a device loses sync while audio
> is playing, there would be no xrun signaled to the upper
> layers. The bus allocation reserves specific slots for specific
> streams, and the data will be written/read whether there's a
> device or not. That's how we tested the 'virtual' devices to
> create pretend master-only audio cards with no actual codecs
> attached.
> If we really want to report glitches due to sync loss during
> audio playback, we have some plumbing to do. I tested with
> a couple of years ago by forcing a device to reset with a
> debugfs command, it wasn't detected by any ALSA layers.

Slight tangent, my concern is less about where the glitch gets
reported and more that I don't want them to happen.

> >>> Yeah these can be fairly annoying. But both of these can be
> >>> tackled with either handling the situation in probe, or if that
> >>> makes boot too slow, moving to a similar child driver approach.
> >>
> >> Both options are not so good IMHO...
> > 
> > What is it you dislike about them? Just the slower boot, or
> > something more fundamental?
> 
> The slower boot isn't going to be accepted by anyone, and
> in the specific case of HDaudio I don't think anyone has an
> appetite for changing the probe/workqueue approach that's been
> around for many many years.

I mean there is certainly an argument for not mucking around with
HDaudio, it would seem bold at this point. We have been managing with
how things are and its a bus that is coming to the end of its life.

> I don't think creating a child device is much better than
> using a workqueue, in both cases errors during the two-step
> probe can't be handled, you end-up with zoombie devices that
> are probed but not functional.

No more than you end up with a zombie device using a workqueue
system. If the bits in the workqueue don't succeed you have a
device that has probed but is not functional as well. I really
don't see what the difference is there.

As for error propogation seems better with the two devices
setup, everything that is waiting for the child devices knows
they haven't probed yet, so can fail itself.

> The only benefit you get with the child device is that if it
> provides the resources required by the deferred probe you have
> nothing to do. the open is what happens when those resources
> are not present due to sync loss.

I just don't really see why the sync loss thing is different
either. You need to decide in either approach how to handle when
the device loses sync, things depend on functionality provided
regardless of how you structure the driver.

Thanks,
Charles
