Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D78D4921BE;
	Wed,  1 Jul 2026 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909415; cv=fail; b=EYU983fgiGClEIulODH0UcIa6dqG9aMFD1SWpWv9anrBe3TOF6wUcMOcxmoaBAOavjaxVqyIwZmHuhdiylv7WVOKYtl/t5/11wiCvfMxWcMoJiN+pAUhffXF3o4ikW2ykT5hNMPd9WMtxU/ekrfXjXitigpaW5Rh6OctqlYu7Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909415; c=relaxed/simple;
	bh=idB1W0ysRTlm4SltWNKGCxG+dkS1PfYSKqhg2lw5NQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2E1XTIjEqJVoysrxpF2JvBAU49J0y93Pb9J0SbIgksF9j34yOqwFK5BHhq3Duxd0gSq945fiJJ5JAFloOHTloNdWtFEI4ecklQrgrSsQNUnzW666W1JGIoXvzChypC7laHs4fMIjnp67GdBM2wPUvOPoy1JfaTw5a4H4LuSWTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SJVmSrfP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=h8TsEylY; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SJVmSrfP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="h8TsEylY"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661CR8vC1787887;
	Wed, 1 Jul 2026 07:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2ANgslrb7NRDbYdRzQACg07v+4lK2Tt/eYKjeZmK6Tg=; b=
	SJVmSrfPsKVLqd1Cifz9FJV0jpHYGHT+t89zZC1zt4kq+zHU95XZh3/q5w0e3Y2d
	210axlgTbgMu9AX9kgR32G2rEEJZjU9Gvzgix1fiiV165dpr02HRnr2IXytZdL+i
	rmrmsUNjoPlo7TZ0h3vJq3lHpG+QS9SqA8wILcl3LlYPxaJeSK/dc50jcTpR1vim
	8D0uWYoMTN5nekM9+3PT1B6ZKz5mw2hAsxecS+VTog48bj2apvCs1VpjLg6LtPjn
	+bcNK66r0QEcQ+snZHOkiUl3BtlCt3APiz3ijYrBkE2nak4+Y6nE5Zv0TGyZBnap
	Pw+kXmrDE0dKR+0L7SWz1w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f4e679u39-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 07:36:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q98T5JDYjWbcT8Tq+0ZpEysaE5Qz8F38aF2dFLORqZki7Xfk/eBGfBafYs+PFYzggyAjlL4sxzaErtiPQ9MaJXk/cfiWttZJzqb1i0O0zbtMqgZ492VCEpmiM6SqWhMHZfoyUrF3S+uzl6ajwnJDMHiz1PEqXRqJtmBkqzMkLWyD/cbMjoCgUMZRY86vqQ22V61i3RM0HsPKyYfXUcQT/EwFjwPrD8d7p9X5/3zK75JZXTZFowFGl3JU+W9lEwJCLBRsNLdX2L0u3pOv0blUSNSQk38mBNstlVO3UV1FPYXGYOikAjvzlwu5eEb3sWM3p0jJyaZl8Fe4sgEjg5a+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ANgslrb7NRDbYdRzQACg07v+4lK2Tt/eYKjeZmK6Tg=;
 b=UBuGq9tFJxqZ2TG82DJc/JqlwDOtsV+UzZlVvFCclX/Wg6UFSdnFb3p9mn1p3un3NjrE9HS7vhGK4GWdzXTpMn0hlHOMAouvKKGiLFpjnKf6beYFzOzOslbPY7orTqtEIlbT4VV6hQQXX9DYlbV3be208PbtUykkOWde1DlB7HhrxJYEiislRKz3T66ExOVpNr3IWAk2eT/NJOcfyg4c9DSNozI+Arps/ITHFQDOF0FmMAc+qwIdWzsL7kmHrEfxrjTsdXOO4uUrxGORNlPbBd9MemnDt3+RtTd9q7rwcopNAIlHVnudY2LaxlJsV8TqjcOYllCR8Yi+8Soon90pOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ANgslrb7NRDbYdRzQACg07v+4lK2Tt/eYKjeZmK6Tg=;
 b=h8TsEylYO7xSU8COVwHzNATeWny3OU64GIftvE4XOzZRNvldCHcjW7WRTBxevirbQLjyMi9DHHs9FqpgpmLsqFferg0pJYsk/t8a7zQh6CY1GJACKbx7HpJmHdB4JhBKMvZNX1Jvx4/oafC34uVjgXj2Pniwz/2BLKJyikyaVVw=
Received: from SA9PR13CA0050.namprd13.prod.outlook.com (2603:10b6:806:22::25)
 by IA1PR19MB6396.namprd19.prod.outlook.com (2603:10b6:208:3e4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 12:36:44 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:22:cafe::30) by SA9PR13CA0050.outlook.office365.com
 (2603:10b6:806:22::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 12:36:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 1 Jul 2026 12:36:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 390FD406541;
	Wed,  1 Jul 2026 12:36:42 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2DC4C82025A;
	Wed,  1 Jul 2026 12:36:42 +0000 (UTC)
Message-ID: <fdff542e-5cab-40cc-985b-f8884691247d@opensource.cirrus.com>
Date: Wed, 1 Jul 2026 13:36:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        "Liao, Bard" <bard.liao@intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        Richard Fitzgerald <Richard.Fitzgerald@cirrus.com>
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
 <20260629144450.2096823-3-yung-chuan.liao@linux.intel.com>
 <11f8d158-9ddc-46fc-9cd5-11a696d3413f@linux.dev>
 <SJ2PR11MB842410EE22537B0673173EECFFF72@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <520f67ca-941b-4e08-8985-03f0e09b0313@opensource.cirrus.com>
 <46af3cdf-d704-4cd2-bb24-cbe9fb1303db@linux.dev>
 <e326c51a-4690-44c4-bf3d-0870591b1eed@opensource.cirrus.com>
 <74bb6575-7d92-43af-98fd-dd46a83b2fac@linux.dev>
 <7c8e8242-8850-4664-b3ad-1099ac83c8c1@linux.dev>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <7c8e8242-8850-4664-b3ad-1099ac83c8c1@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|IA1PR19MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 397c746a-f745-4dc1-aea9-08ded76d68a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|61400799027|4143699003|11063799006|56012099006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h0Fnd9iIjVSA+Cg4CmuSsui4aktKl2WzlY0TJbKcT4VVAoKgu+t7lw6hh42NmdYtPS5eGdaHQoI5pdN16fidzVlBtaBkrSRkSFiAYkpoU1a0/soiKk3u0kcY16goVY5Z+Hue+wV6wX1eOa+upIA5+DBbCNBei3rg+8JJOic31JHecxleuvqYyxugHHA3yuRdmHVMjOr3uGLhzk5ReezXZZVh9wcy9X2Fn7xvUV0ZZcYuKZVIPu780yZl5SUXdpccAy9iXcmml1syC0f0aJyk5tX+XsaTrDEwzlb9K8S3EmdAssgNbIwum4RErTC5CoIC1Q0w5wCu0coA9sMXwgtTpudp7Eeliis+S1QggrWIPomgDbTkiFwUIoljJ0MnZe8h8qhknuyR0vIaLWKpHj4MDRg0bi+tm2BvrPVuR4TFH5fMZGWXBF9reDRAcqgMt4cfQssSeO4PJHAdJpuK9EqHnBE6AWqo+8VYf9iPaumYi5os/dXYyF9wU1XDKn6b8JWGoAj1tmv1m75q4EzzJOTS2pGNEHycXdDDSiyazzIglRutXtpH3to2j9kHkfYiMPh1cy4uIRXtw+OW7PNc8q+fjOM6Xms5+FFwYb60tbr+jn4J1j3q/IzioRlGmSCvEFukrRgvVGF7XyigwtCFJU6B4kITBr/U3hb+YtvnH4lfZdNl4XY545crbi6VQQ0b4wgyJUxEEQy1/Z1QB/xXJwjJWg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(61400799027)(4143699003)(11063799006)(56012099006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LFGg1eEP/2L5iLuW3sHXAfw1jP6X3VpHqij1jxhm76O19WcnroZBo1As2RNuJGZW0X9ZKdEWraDJdVuCSxhYLTpquEKwujMxWunAyptwsS6/NqZx2G2clmRb6UM+UPaLsC5sEa62Z327kA57A1mYoHzHZlsXJBwA99V5uQvSZXnhQ2uaBch/0qXdKdhFfp4letCKRyr8G6db9/mu2lrOwcQ4PB5m6fZvxBWr8p1BBZizN9jpUzVHt1WDEusF7cvsMr+IrpdnEM95Tbf66pEJFYL1pBO5yeY2ELOksHWOcsKKO6TqG+5+n4cXbOxMI6gW8/7BmPIeyW36/v///ycdVXXANTtxvLgSD9daY1tc6u8R6etpdApc0bqu9o08OGZAEwMLv5Ng6K/IJhDtJjMV8KwT6KJSfwSE585tmnVW4oFjiscAX5vviYR4INIyzsX5
X-Exchange-RoutingPolicyChecked:
	Py7pNKIrwb0FIuWMOd5DVuUNEuyueO29nBzg/an2zRVwGyPrRlL+7AQ+sea5RdNSGKzHhUT2oWwig/8dMU2BzF0uP4MT+Hbpr6NQYv94nknEhLUIUnWkgmmbq0l2D7sxAO/PHfqIT0/ebbscUuv8Sj61YDeXEtX4nqw/+pmwDcD/Nq1ru2MdvskgLW6ULEwrbmIml/+mXOWY3yg7vc5oOlcZexPhzy2UQrTAOQUwkvEYmD34/+z9+OT8tANMSoOIWYd2joR7v1YPrBwSwAO91++KRy6Flr7wuyIwnFUTtPM4DPrKEG0kyIFwodDW29+0djMQ1Xt8BNac8dxXHKgb/A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 12:36:43.7813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 397c746a-f745-4dc1-aea9-08ded76d68a9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6396
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzMyBTYWx0ZWRfX+9xXiupbW5e1
 nXBw1xfipdHqgpHCalPcHlFXogSpKOv3sb/dxXgOfzkkFboObUxl8wJjdaj+Wq9tsaEORvoi6Mx
 DRUZRd3CLKENFUR53dktZeEIo6XSoNY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzMyBTYWx0ZWRfX6z7lkIcE8zGA
 jzIXUZr4IBIzuaeo3nqrBrIka/5OhuJuaY+xx5e5eokFdDK9zPKlkMUaHSwSv1p8zalyV4AldD2
 xLQ6qWO7wUeXyNMi4WG63m4449n+ivPAsUF9krR5jmwWmswx3EzQy7hnxQM/g9vzLRUxMjUV3Hk
 eNrveeJ3ji3kbgwwdOCHstm9CqdqU2vSM4qkv5tQRB2HJkbyd3sc5aVxH04fcHvE6Sfo+Y2oRlx
 QnWtuBEBHUeQcX3CDJBwvrhW7IxstekQs45HfnqgfJO9K5KR0f9m8mY3zMHSZsuZ17Xa2QmIItX
 blvTgXHO1z/E0IVDQG7qv1u6eb8NNdfhKWTsomO+vR6zu3FxNNetog4XYnmm8+jg88nyOizl+4P
 h2iEoZ55DHTzQqXsT7mbFsu7jkvGtYrXpKvRpkR8XJVBPMGW7ikUPI3oGSFjWFn62Nc6TBfo6co
 179+x5XXcObYIlOm5RA==
X-Proofpoint-ORIG-GUID: kRslqRLakQ2Nai5I4AbxvPadAScGJS8d
X-Proofpoint-GUID: kRslqRLakQ2Nai5I4AbxvPadAScGJS8d
X-Authority-Analysis: v=2.4 cv=PrSjqQM3 c=1 sm=1 tr=0 ts=6a4509e0 cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=XHFSYswUhxNlNBz45CQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 01/07/2026 1:00 pm, Pierre-Louis Bossart wrote:
> On 7/1/26 13:55, Pierre-Louis Bossart wrote:
>>
>>> If the Manager doesn't send a clock-stop, the peripherals don't get a
>>> notification that they can enter a lower-power mode. The clock suddenly
>>> disappears without warning and without the peripherals being notified
>>> why, so they don't have any information to know what is happening.
>>
>> that's not quite right, see below.
>>
>>> The Manager should send a clock-stop notification before stopping the
>>> clock.
>>
>> That's exactly the existing logic in drivers/soundwire/bus.c, the core does notify all peripheral drivers of a clock stop transition.
>>
>> sdw_slave_clk_stop_callback(slave, SDW_CLK_PRE_PREPARE);
>> sdw_slave_clk_stop_callback(slave, SDW_CLK_POST_PREPARE);
>>
>> These pre- and post callback that can be used by the peripheral for imp-def actions.
>>
>> I am not sure if the POST_PREPARE makes sense, since the clock is already stopped the peripheral cannot be programmed. IIRC it was added for symmetry.
>> The PRE_PREPARE is most likely what you are looking for in the implementation of the drv->ops->clk_stop callback.
>>
>> Hope this helps!
> 
> Oh and in the case of a system suspend, then you also get the notification in the driver suspend callback. In that case no need to be notified of the implicit bus teardown, you can program the peripheral to enter lower power. You do not need any clock stop mechanisms to deal with system suspend optimizations.
> 

the codec driver should not have to be working around the Manager driver
failing to write the clock-stop notification.
