Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C230E821
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 12:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765454459; cv=fail; b=NgUaFL0SDaFco6KI/D9VX9oGuau2ZV09XRL36FScY0GWxsXyfi0KdIppNQThBvp4d+yzkRQS0+ZjT1J36GVLiFawpvV2z/2sGafIRXrppOg6a5500aW3HFDIkJYwHLR8I2IW74suV798UybJpA5J2SfF6DoP+kBC7r1KEKNeucs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765454459; c=relaxed/simple;
	bh=QSPaXd9NCffsOGK3D4FLmSayajvSRSnuWtBNZwqHSCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDAwYHvZ1XXybJzxz40O7pXfPfmhk8B7bnsffEfN0hZQReqmpKB26Ff2ZAG/pha95tsHWxwzRb8JN1jAllRCVsTw3U39TGko69DJZjh3WjtjrjH6a94ysmOc3ovFa0B5eOroD1enM+LKyFuOJlf+9/ntmUg4nYkZDBJlXcFoV9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IedX300T; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wthi8fUZ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IedX300T";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wthi8fUZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB5ptxG1153750;
	Thu, 11 Dec 2025 05:59:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=L19MhjWJLHirGgxBCX
	V0fv3BGZCKT2RupKnWvyviOXk=; b=IedX300TAqkuaiYOfa7RH5qC6vbRLNMzou
	Lk08ZvbMChqgHmit2uqriqor9CtBuUsvm7q0k7t1MW/IFS8H3nkk+kDgoVu0JPeE
	6G/EB/plKDALfoFokX4iwPDxf2JXizQLOsW/v3oYGLHzY5boFlZxwrMMTB9sbwLp
	GU1JpzNykTuTdMJYsRGmeN97oLA5RJhbKOw5yoG0tHpZb318i9SAVrtAkt4NtYmV
	axse5YMwpd3u62qOBvtoFrIrebmyJ8gIAcRdSgG9iZglPVTDRsy4sZpbZW5ZrjzG
	aOQD1Vh7LsRorbG47+eLeZXf9cP9k6C/itfX17gvnnLx4pE87xdg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020079.outbound.protection.outlook.com [52.101.56.79])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4avhskufha-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 05:59:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAQ32hPhSTctJTcqejsTua161QAQTY6aIhoa7tbtH2LBliTA2ANRnIL1duI8a0tRAkuawsrcGeRCXKWLyKxqZpyz3XS6nLbY0/+X+HNuh76BkZBAOEffyaFCtwEDL8DVPhm1GwHszPxfW8Iq+FVX3Rp0Lw/Gvwg7yq/2zum7GCDARHn2rEoRqwEQz9+f+NzgDXIP+QKFGEwpprJBDDZUg+OKfXq9GCDqNB7cufaSHhtr7fE9ekw5zrnqQF4GNRa2UTWTaCVtMZU1b4yrm57uQAWJ2dSkAEk5Qs9y5R9ZNJzb0HBOsMJFFhA7Qq+vmvcTqbCjWY5whM4PH2DNiYuoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L19MhjWJLHirGgxBCXV0fv3BGZCKT2RupKnWvyviOXk=;
 b=wjfFGHkjyR13cqusoz5p5/IkXIAaX+NG89LMzy0NeCTOnbNEA/n9YQLUw91bct6s01WeaE6zw6NZDisA3REk68u2NZFZhVntvWuYYmfcjwI3sRQzYrLwBT4Xx+R1sJ3Oajh0tFpP603pUaGevLExJC7OUTMoPm1y89C1cLR6L2HnPTm8KMA67PLj5Z4DOKQDBmVGeynUFiH+LEaoxrBNQQaFcROOvq5WURWLmy2iKHIcRQ3dS62dfcE7lOxGaVHO5BrjDzXO8UAuCuZGM/UkXRMPYPBUBv5AxvKi/COtKPbKb6sDEUIwpp/uGub2ILI/euh/uoMpF6hDuIoXSifkyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L19MhjWJLHirGgxBCXV0fv3BGZCKT2RupKnWvyviOXk=;
 b=wthi8fUZTgbxqeAxHfji39C8smlOC3DgNLqCdeOz+jNSqOSj6c8ZwG9iusv+zbufSn/PB/eFP7+yU2Fgj62mmSPr8IxBqOM56rprrfn4osXFisRwQpRwPQaUoaVXuA3oFGT4QruzFJeCbd636FanBN6BAO1hT8Orda4Xq89vXfQ=
Received: from BLAPR03CA0171.namprd03.prod.outlook.com (2603:10b6:208:32f::31)
 by MW4PR19MB6960.namprd19.prod.outlook.com (2603:10b6:303:21b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 11:59:36 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:208:32f:cafe::9f) by BLAPR03CA0171.outlook.office365.com
 (2603:10b6:208:32f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Thu,
 11 Dec 2025 11:59:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.0
 via Frontend Transport; Thu, 11 Dec 2025 11:59:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 91D33406540;
	Thu, 11 Dec 2025 11:59:34 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 77860820247;
	Thu, 11 Dec 2025 11:59:34 +0000 (UTC)
Date: Thu, 11 Dec 2025 11:59:33 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com, vkoul@kernel.org,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 6/7] ASoC: SDCA: Device boot into the system suspend
 process
Message-ID: <aTqyJe7t9cq1UUya@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-7-ckeepax@opensource.cirrus.com>
 <c8448dc6-7a90-4eff-9758-146c8bb09c7f@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8448dc6-7a90-4eff-9758-146c8bb09c7f@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|MW4PR19MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: e6167fa7-5b17-4f89-daf8-08de38acc0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qrKos8Mi/Q+KbvBO7B/WMK6edoywzqVEoFdk64ktF0nbS3AfXhBfIC5SUEjb?=
 =?us-ascii?Q?x3SgaWc5ilyVUipaFkk/SoJV2FUjGBVwFP5a1Wnr9VPUkkbHB1RAeD5nI6h5?=
 =?us-ascii?Q?vxEXCULu86a+kUzi7ViOsI6sdxCa5VJS+qyOZOt19Hug8A2G4lF+pX/QDtwv?=
 =?us-ascii?Q?aU0Oe9sg6AAKFOAUMAZ7By1RBk+4uSbn3UiObNZxxkxzDkR5DJ5MCPd3uP2P?=
 =?us-ascii?Q?FcOZFaPz8uYDvVRycEa/m0IDW0JmVRJG3FOVPm+CzRt47QCEnFl+3YIW8phl?=
 =?us-ascii?Q?iWRDeBHmWYYCe+lbF1BN7xAVjIDstzjqClz2gaN3m3PC2MGrHxTjDs7lx4T2?=
 =?us-ascii?Q?eMXmp2HOHEFNEOYPawTr06VniL+I1SmtMP0Xe9/NO9Gz8lDU2RW1XxRJNXa0?=
 =?us-ascii?Q?LA+szd/H3+TcS2Ba52V7dM/3kEB3XjCV7YxJvBWuK+iNrCfnjsZ7JNNYnrfZ?=
 =?us-ascii?Q?eYmMO+a5pqH0xAVMHt5Xz545ehjJGab4HOWz2EQGk+u77p0cmwjmGuiw4QEz?=
 =?us-ascii?Q?zV+rA6zCNsknZDhUfHxm+9INyQPTni0wWhQvMp3kho8KvNbf60+rsWltRGFt?=
 =?us-ascii?Q?6L8AEixdu7heCQgDStpxAhH2/dkn0oKhUc7KiiMPqs6XJ4oUHOG6XMGa27kC?=
 =?us-ascii?Q?QtBmuPsPAcIJ3djBQnHrk+Jxs1++efJR4C9WVj1tHPBlabps0dCq7fvEPltl?=
 =?us-ascii?Q?iomSgWP8amAjRY4oGarVCtBAmW7/eSnrRF6dW/prwBVXai6rBuGkyMPhWV75?=
 =?us-ascii?Q?28sfk0ZtxZSBBZQTGs9+vNmJ0YJlDGEVtQclnVpjllJjmmYTTA4o7INm6zwY?=
 =?us-ascii?Q?yw1R3ZQcKT9w4OK1irxfiByqdABo9ZLjvL/6FB4Zj+NKrZIq69vHe1muK80M?=
 =?us-ascii?Q?XfooGNsYUzsoOVVM3FBFqcNlTSNcBe7ZBd3NNMuJtyfdibiNUgusOOYK6Zye?=
 =?us-ascii?Q?s1atNHRdhIZBqQSJYan1SHuGu3hHShERcCVBHYgAWuB1lmiDT75Y0iK+V2rN?=
 =?us-ascii?Q?XrhUQFJRVuotBP0gOUVbHex0Wp2t3PPY7zXtF3FgjTdnazMU/jdtYNaoO3mv?=
 =?us-ascii?Q?OUM0dwqWPgZCy8ep/new1aC4G2R+BNWHXKsNiblZ/LPmelvk7+/MAu/0eSdj?=
 =?us-ascii?Q?ZJAjlZ6hdNucw25oNFBkZASN5GTFa9woKtrFqt3dF8wwyKxYhC5KYg4aF2LD?=
 =?us-ascii?Q?FJyqAqdTbVmd96cJ6T9kmBqLHphT7LCcTZSj1OG7VkVsoWhueXHSWrrKOKvX?=
 =?us-ascii?Q?JhF3WWD/dFWnPK8tX2MKdYhQORJtn2YidU7NMAB3Q5H+7Hx6ZAaVTZwNn6z8?=
 =?us-ascii?Q?b5e/3IqNTPLer3NADr0H6gMvKOjS81bN//YrcJpqouqSFe5eEWvzDQzjhu8j?=
 =?us-ascii?Q?IzyI5tjIftI8Hn8HSavQLa7iRdjIo5MDTuttClIwqyGsZDvRzucqlzRzjn7T?=
 =?us-ascii?Q?d/2iBA/Q5wmbt7MMsyWuwkEgx4Y+F76/4Jkh2Su92RrH2c1hGW7z9xjb+IuQ?=
 =?us-ascii?Q?Pxvm6EKQ9eVrY6EvZGVNaaUHLY6Wmes9FFfE6ho9uG7IGoqjt0dR7m9Bkg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:59:35.4320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6167fa7-5b17-4f89-daf8-08de38acc0fc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6960
X-Proofpoint-ORIG-GUID: 2vCvtM-PtlmxKhueOoWU6navcHLgtLfi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA5MyBTYWx0ZWRfXzxoZ54g/0laX
 YP4R8hc3V9i+4Dz5us6F5Hk8zT0cq+1DLZ+Ip1N47zZNG4Q177qmCnNgnOFng6ffRjxsV8horJ8
 Jd6NbLI0igTzCrDU+TaQxVhgknYxF/ltPE0m5Ykd7z5kJbjN2n2Suk2zGU0OLM+Vf71s7qI6kRL
 4X1JgOeb961ALq76dt3J5OSr70opNPq13Ne6HBQlJjnZTFoGXHbP5Zwpi09W5xNK/duuTbl+HIv
 IY8zae0H6X5eJrwNVeAjSZATrNj7PQQZ86G3z2T+APr5K6j8Cqj0bvd3Ym2LwStRnbG2ArJfoRN
 umEVQEEd8xFBm5LDuUT6H6c7EA63pFFRnDMA2Xd3OALYKH1JBWRdHhSvKAug7mWgaHuxhNUQF5k
 KldRHur0C4Ta2fc1Tp8o7Kstc2Z8KA==
X-Authority-Analysis: v=2.4 cv=DJ6CIiNb c=1 sm=1 tr=0 ts=693ab22d cx=c_pps
 a=kNb0EPoEURSSyKZUeQUlVQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9karD7J3QBu9dDP3WrkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 2vCvtM-PtlmxKhueOoWU6navcHLgtLfi
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 09, 2025 at 12:18:09PM +0000, Pierre-Louis Bossart wrote:
> On 11/25/25 15:21, Charles Keepax wrote:
> > +	/*
> > +	 * FDL has to run from the system resume handler, at which point
> > +	 * pm_runtime isn't yet active.
> > +	 */
> 
> aren't there cases where FDL also needs to run in a pm_runtime
> resume case?

Potentially, depends if someone builds a system that does that.

> My understanding of FDL is that the host would *always* check
> if the device lost context and if firmware is required then the
> download takes place. I am not sure why we need the assumption
> that firmware is *only* required for system resume?

Mostly because it seems that is pretty standard for PC systems,
to only drop rails on hibernate.

But the primary issue I have is the "check if the device lost
context" part. I don't see a good way to implement that under
SDCA. If we figure out a good way to do that then most of my
objections to allowing the firmware download on runtime resume
go away.

Thanks,
Charles
