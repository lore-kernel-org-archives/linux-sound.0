Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBED24DCF6;
	Tue,  2 Jun 2026 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408521; cv=fail; b=S+BtklIX4L8XZC6C82x6lu+MrhMnpfxO/fjsziAKy4cKpARcTWu0PxFrUsYTrOrYWhshMSCwBLQpppHacRVKI+I2WzQV/CJLsVtrPsIPMXaq4llj3u7yb2wuiyPeLr4DMocXw3l7tdj2TbpjCOxuR04WzOmL6RnOXbJAzGBNXOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408521; c=relaxed/simple;
	bh=mFeYgJQcXW9MvT8oH/Q2eSB8MgFgJTColtuB5PuN1AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsX+tqPnUjrJ/93Rypz33h0T624DwbQVeBukl2CYWiDib7p6yGPtQ/qogxh19UwgljNPdQXUAbRg7uwbl6ircHZvx3ZgBlHOa7unYY+ug5IXXAWgDqnsoIRwgVHzCppBqGRayiGXQWAe/EbX7SRqzdE4oAq9E3c+gVJBN8Iuk3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VaqnO4av; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NqpwTwB1; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VaqnO4av";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NqpwTwB1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652DHuHS273933;
	Tue, 2 Jun 2026 08:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aoj/x7/1dzJT/XqDB9zhUsZeXTnMX/ARFNmhTtbs04E=; b=
	VaqnO4avWCCnH6A6Ql7gPBLYAz+dXbjV5SU80si95JKIWK9KyKOf55tmO750ufyW
	J6PNeyz2TnwYeZLcEmsAKqqtbwpCzLT8klJVa878Bh9pxwoGGlphzYjv58hCCzWT
	IJBECrngCwT9XxPUDwxsNSR0XAXmeriylhhB1ZNweya4CTYknNAwn1PSdjr6T/5L
	i5xGRwgLzkSklI7SgHJNideAOjHvjAy1dnC122ffs5697VbjF7G6NyaXDt2hH6EI
	4ExR7KxQMQu3Z6tdokfKwFCcCgpPCnxX7iPaJ0w2DEtG4t7K8rdfXyWatSlUpjlJ
	L9u9pzLK3WCrhTZTr5mghQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020114.outbound.protection.outlook.com [52.101.46.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4efvagcd5u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 08:55:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKGjhOy0eBV9rGsjKgiXfxQ0UhXr09cb3mJEXmbFEKVwUFUKG+f+F+584s+ekWXn4+B93bAVILUpZNWUI6SGkkvMiHaOadM+0UbLynQXfaaTiAN6keBbsCU5QnOeo+kVIrVKBlmv1hXDZM4oWnE165vrEWhhx0NAhONPbtLLWUF6xM2LOhYJ4Ejq2wfOk0n3a9bcFDwnpJq2iQYGoT6P4SQKSZQEehTYcG5YQRPqVjc8uDm3OA89iJxeBATB51B1+Nncx30SXGD20Uc5odEzEP8lB7jw1c2YYLWvAToDThfvGTe7iIIAYgbW8OxM/ebVMSWXFgR3r9yBFzvR4ZcOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoj/x7/1dzJT/XqDB9zhUsZeXTnMX/ARFNmhTtbs04E=;
 b=tDzoyxv2CoOyjKUTFgWt/0SSB/LAZyCbqphf006q5h8K1VvMTEDLKTKR4+aezNd9u6ksvIIeIgiHBOjCarhlp3/Zq+8d7DWcbLoDcodgvYnqhKjvTUzGlP6GxPNHMVKfrjjcf640AXy0kEpjWXS14x5Wv/9Gaah8BeDOQzEcPwX1eq/FJ9FX9eW12HpSi4siQjbWtlET1d/VUWGx8dgfJcEZo/lnB574oWu+ckl8EiG1cJIBQ54fQR4vAPskp9aotYPpKLXtZ2ysG50DSS/RrjCK6IL9QHn6kOXR9tMOusNeM5C0Lp6o3PjPS+RUn3pFkR6zpEWV/Mxw807yxYYllA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoj/x7/1dzJT/XqDB9zhUsZeXTnMX/ARFNmhTtbs04E=;
 b=NqpwTwB1/Pg47v/NG5UaiseBsDwru0QvOKCElUl8dRqf/x6BxvIR+lnMAJuR71TTedAOloC8dHEEck7hCEGYUanDc04abI6kZIj3j0TXCDvVk0vN8+5cF1hkGKFvrA+wOS6gtTr6YN04bimqeVSW6g4ZlKjNwlssUfDu79DpeI8=
Received: from MN2PR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:23a::25)
 by LV3PR19MB8366.namprd19.prod.outlook.com (2603:10b6:408:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:55:11 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:208:23a:cafe::9) by MN2PR03CA0020.outlook.office365.com
 (2603:10b6:208:23a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:55:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.0 via
 Frontend Transport; Tue, 2 Jun 2026 13:55:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1AA4740654F;
	Tue,  2 Jun 2026 13:55:10 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 09C8D820244;
	Tue,  2 Jun 2026 13:55:10 +0000 (UTC)
Message-ID: <e2e34915-1194-4965-b02d-4e64b44a2701@opensource.cirrus.com>
Date: Tue, 2 Jun 2026 14:55:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-core: Create device_link to ensure correct
 suspend order
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260601142835.282301-1-rf@opensource.cirrus.com>
 <0aef9b01-65fa-473e-b999-0c5b285009c5@sirena.org.uk>
 <f47bf7df-f1fc-4d77-9293-938e20600826@opensource.cirrus.com>
 <b9c0e5b3-13fa-4139-815f-5652ff494031@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <b9c0e5b3-13fa-4139-815f-5652ff494031@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|LV3PR19MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 92dfe701-7f4a-4610-7fc5-08dec0ae908f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|61400799027|22082099003|18002099003|16102099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	eL0wVs+2Gw895sn7sLxDLJAgKdfZf4ZraLPeseAHXmqwWNO2xW4fx/tXPQJCYp1IWrbZCl7vbGIyHAGAPSU14JbvDmGOtKqV+Vry6rMKwmlZ4K5NMTIyPO6ucWVveoiac+AlQGUphxE9ZuRYUMAN7gSCOEMAjL5y5uCqhBvRIThSBsaDnHVCNBzicLZxb/RkoeMjyr3laqFiE2Cv1NbktIs9cvx39iwe9feK3TvfvN2QX3AVvAm1/5nCNW8pPkWJDzzmL7pNQY7OCvbV24tYGSTKNmbsuMRq31d8gNZFeKnROzI6tQP2sgcgtJ1lZr0WsbAukhuNynDNns6Ek3w62jb7SUBCFcEaoSyj/dkIeGSQvWeh5dJGMxaBhfDo5XqbbBnr5qR5HuNcmhU53tyMoW68Z3Rv52/WBf+/V5XthCLWG1jNHXLuKQpZYHU0IYCofh1rKC7PxDSq33puT2VXFc0p99HMoMJ5iFkyfzJBU1R+96tYR3GB3wczY24/zZAVXaRHRC1x7ToM2NkgQrCPot0VxEVY7HN+3o45gALtIL/RzSy+CTip/vWKd7YXEU7DsKcHTzleNiqzvHK0ki4999HeAHoBN6ULJ+vS+XK1FINtjt/pwMEIlrwHaObcP4Qp0zIa7t4R57phRFHHEPMMAYgZ7PkfmdcV15EdvFs5JknFzF4knRPMymX8QiPrRmcGv8rEDYJV71jhouJ72rfYWFIN26pJdVp5kOuSGx2dww4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(61400799027)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7bIUgSabbywezc+4HI051HFJ/kkG9vEvwSezrf2tA3EN31RqdtVGr7AjSyk7A68+QrZyT/Tku2FqGgAuTTC7yoGnhu+aXag71je/7+dc7DlPFmLlXNX4Z8yGmLyh+zHo07rFG4PudC1Dshr3wM71MtR9iAOfpK6HRB+rik2jdrt1m7c19nG6DRlZGSCce2vUC5jdkfYAb6PO/3JohhwrJpp2WISXWmDWXm86Z6VRrJv1Kif4XWwuzADYGQmZmdNQQNEIprc9L2Yzsbr4KGfFvdkm4SSFmN5rx2pzg0s0Q2ZbVJE/f2mzOPZhAmvOOt6XE/TcjdzfamvyC3i9yhy8R4AbHQhGaHqJuxqcCaOYL4fIj95P/R86M1SWIcgL1Wk7KqziF8sdewC95V5d/Lvq2Mt+X0IN9Ad+FrPHQcSqSm/Av43ToNd5+K0nUSG0qh00
X-Exchange-RoutingPolicyChecked:
	XPRw5w3+O7IlU+AfV8ElI2d5ZLRtqHKMVzmNOL/m11GBd/SCpAWhVsTS1S1cgYT5KFeG/s1CgMZFTmUBfZT7vBbULWvMjtXLcTYQDWNAefzZrLCg7x/6W9drLcZLPjpn2QRksl/JwN37QhcsTzFSV9HKh22BkuiWVtvNvfpHStoBYGs8fNTQzeYNBsXWYdSzQ7ivZf9BRHb1XqQGAYqpPfk2g0m4tAlmkTDxkfJWeh7jnwHGKzk84AOJzUuWB3lxwPi9HmdSvS2fyDUCvkdvXB/TC9f2EjOLUF9QtbXi9zglUPjWidBUFiDohYXiRoJlPwUfzbW6HSxuGRgMjTWIMA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:55:11.3238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92dfe701-7f4a-4610-7fc5-08dec0ae908f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8366
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEzMyBTYWx0ZWRfX/kR78hxuFp+q
 pUQwLjjNHz/gH0iBuOLqL+nKLnEz6H5rfbNrucDVWqtaav/5zv4iY/UiWIMzzg81hk9W3HN5W3P
 ds3MPUg0MWPWOvH10c+QPvdvjT3E2Wqk/nfFcVlrK0LXKyi2xvipBZjRDRQHPlBeNxJ6UcHIU8p
 oFLEYrv6JXw7ydAGledtlCmw5SyoAcsnNeuftV9eYnofFf3+2eah67L5lGg2TgC2A7TZwwgBEXy
 5h61H/bL+FcHt97PY93uXRUbGviVcbBm7b5znFVS8LBsohoR4ARKWo1WUI6/8dyPiWdobOSTBXz
 53oo3n1aJAbQ6hpnOXFJtgvdpPxmak5SN+QVnOqdz/WC/ec1fIsgLStUOabLhKGhpswrY2dD9j4
 pvfjYpM3ZvTK0LqZC+HMXgmqN3PEREZVXo3WdEGNDVN13DzHPocHp+EtdjUSgHoXIQPSjYvrEK0
 SdSzUoRn2kgiA7eAm6g==
X-Proofpoint-GUID: YOsG49mXyW-6O1c1qF-6d5dOrlKhFMk6
X-Proofpoint-ORIG-GUID: YOsG49mXyW-6O1c1qF-6d5dOrlKhFMk6
X-Authority-Analysis: v=2.4 cv=ddywG3Xe c=1 sm=1 tr=0 ts=6a1ee0c5 cx=c_pps
 a=LvphRkG1ZSFrSK8rCZP5oA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=NKvEb_upML31vi_-C5gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 02/06/2026 2:46 pm, Mark Brown wrote:
> On Tue, Jun 02, 2026 at 02:34:53PM +0100, Richard Fitzgerald wrote:
>> On 02/06/2026 2:31 pm, Mark Brown wrote:
> 
>>> Do we still have devices registering separate components with the same
>>> device for DMA and DAI operations?  They'd end up duplicating the links
>>> here.
> 
>> Ok, weird, but I agree it's possible for one driver to register multiple
>> components. I'll make a V2 that skips the device link if the component
>> dev is the same as the card dev.
> 
> That wouldn't avoid the issue I think?  The card is a separate device,
> but the DMA and DAI are two devices registered separately.  This used to
> be because we had completely separate driver types for DMA and DAI,
> prior to the component refactoring.  A simple move to component would
> keep two separate components, this could be refactored into a single
> component but that'd need to actually happen and I'm not sure we did
> that for everything.  I was wondering if you'd checked already, sounds
> like no?

Oh, you mean two components with the same dev, so that the
device_link_add() gets called for the same (card,component) devices
multiple times?

I tested multiple calls for the same device pair, and it's ok.
This also covers the case where ASoC core now creates this device_link
and the codec driver also creates the same device_link between the
card and itself (hdac_hdmi does this).

 From the kernel doc for device_link_add():

"if a device link between the given @consumer and @supplier pair
  exists already when this function is called for them, the existing link
  will be returned"

