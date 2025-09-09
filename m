Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B1935CED9
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757436802; cv=fail; b=JsaDVpshVDbISYp5ZVGUUZ1KpzB53Uhnjgq6mDeqxOEDwxU+PebWNKVoPBv18sQwEtFJwVdqYf78gc2bWmehqVIig3X92RiBZudt+9nWzTA1BBf/Yn2sQpyLiReV/Me9Fms/xCGNzl1Xb8Vt1ZGlN9QAqY/FQ5LrlQwkovc67P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757436802; c=relaxed/simple;
	bh=YT9gyQLai6ZPMiuVlLQUwaKilJoRXTwhXWODKisD0gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Klgy2iU0EY8VKDdSe1aj9fC0vuI4O8ubUHgZdliR4n6xrHxnpKqHb3+nb/DFrAD9sqDKV3l9NpkkvmRD5O1Oa9iMgaT5xLaWDqCLPZc04G23T3XZlb3qHHJJGwaidkQF7qxynwSjAPWwW4b1pwbpjpOkrl1I6YuFCYMYnlApZ0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=djVq567j; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YtSGUAOM; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="djVq567j";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YtSGUAOM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 589Fltbj3627629;
	Tue, 9 Sep 2025 11:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=lAa79HI3PyQj9qR8vx
	xnV6UfyroE6xL7bHlBj0R6Zao=; b=djVq567jZ+KR5MKU+sKVV7d8PQAjBbq5HA
	AEZlq6AA/i92lvco+SlbHYuPo798sE5BfqPqQbror+SzWvQ1EEu7xiiahoE5DSrd
	5xpxfXC0lEX6+ERwoIBbcrGJafmyvYuDLhjIfEI0BBzvkMLIWrzCOyS38+iFXPW5
	LknCDxsBzxaqv9F6zU29cwBCDyt2rn9IUJPjpK/Fh2AMFfd5BjRkC0oRBplunEfC
	11y/oCE/8wEEwynBPz6fdHjKJ9BZ4i8STkEeb0vhAdyaTj+/kHHJDHeDu433O1bh
	ClCqY8qL4Zfjmd1AHcNKZEBBzczSL350DPKKOm4JQ4Age1emlF8w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2110.outbound.protection.outlook.com [40.107.92.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6t83hu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 11:53:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZ+Y2jtO1bUk9c1VaL6ep50sM5A9oad7zU/UvI7B7k4BS1t7eJcTZI5dhQ/d3aIApB8ocsq1UkMCetK/TgqlGaXCfNW6RN0t3mq5aAUaeNeoBpLow/HNd1S5jX9GDOODl4s1vp5eE8cstXN+SV+XregOyW8hSnWqwvqpvws8maqTiNaJF1JVzcEnJEj8EQajv93ySnQwTnvQXJF7BCA9vkvC0hCD1qOKv73AK6x6lbIKMHyIGCNive9A41p5pK7p4uUQRvb+z1VXcFT9NlzKbC+x9l+G8Ur/34+H9/phWU/KZbgKSU4S4XLKHilZRAwcAIsU2F3YqoNNDjwC0sltOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAa79HI3PyQj9qR8vxxnV6UfyroE6xL7bHlBj0R6Zao=;
 b=FB0MlI/76foZyajr8M9be+pJJR/zWBknSPuq3J9awJBhQinpDzaSzPH9TUUBaUqwgnW5EVVPd3nmX5l+Hod5YovCEkyNrssflXfDV/mc/D7F0P+AOcGL1ODm3z+C4w+hoQCzeA1GTY+dvla9NMXRkCqMeKQzMuuHQmX7o/AdMHmVUeaG9wIANX9AvrmyZqkG4HSQ9vzfHytYWcjzuB/2BjqmKBdilH7rT7qwoyoe/NoMQ+PZQkqCu/vnu2CAouEGLslfUuaToFNTZ9j0bvfTX3N+966QkdbuAz1CODykJXLNEtjdTp0QumLM1Fpe6AU8fXIXSu4m6C+T1sVFDoSpbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAa79HI3PyQj9qR8vxxnV6UfyroE6xL7bHlBj0R6Zao=;
 b=YtSGUAOM7NAI0t+wxc+lN4ITtjQeP0xJpB74QXhcOPRdyEZE3BvKSqVCIk2qyBjuHaBAcCmYx+ISZN2Mwbha0n2oaHVQEoIgO1pEyNDNOOtigCxXgQOwy3yU/U/sEWtsh1K1zWFVQCOKuWlCKLSCPdZBN6PR+l019zUd3LuDt10=
Received: from MN0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:208:530::7)
 by DS3PR19MB9221.namprd19.prod.outlook.com (2603:10b6:8:2e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 16:53:02 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:208:530:cafe::c5) by MN0PR02CA0026.outlook.office365.com
 (2603:10b6:208:530::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.23 via Frontend Transport; Tue,
 9 Sep 2025 16:53:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.0
 via Frontend Transport; Tue, 9 Sep 2025 16:53:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 34B4D406540;
	Tue,  9 Sep 2025 16:53:00 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 12ABC820247;
	Tue,  9 Sep 2025 16:53:00 +0000 (UTC)
Date: Tue, 9 Sep 2025 17:52:58 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 09/15] ASoC: SDCA: Add UMP buffer helper functions
Message-ID: <aMBbavEX2RyzBy1o@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-10-ckeepax@opensource.cirrus.com>
 <e85fa12d-727c-402b-a7c1-493d2224f228@linux.dev>
 <aL7W3iS1YxGfk/AP@opensource.cirrus.com>
 <2a069e04-8f72-48b2-af5c-6b45a0ea8e5e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a069e04-8f72-48b2-af5c-6b45a0ea8e5e@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DS3PR19MB9221:EE_
X-MS-Office365-Filtering-Correlation-Id: 573ebea0-8be7-430b-d155-08ddefc15664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QAxAp3Q9FksJKDWsXqQoAQE+bj+GTnfYx+/zTZrLuylvsfBT7QYCx657USZX?=
 =?us-ascii?Q?PGdImAP6CEaJfNDRaEj+dT2QUj3R8jd6nd49EnQb1mkk+u+L1e8TEA+3BHus?=
 =?us-ascii?Q?bjDr0NcP90fcUVAOXjQuXfky3b/+WYzhkvTaKLdH2lU1YO529cFg5Vx4B+VJ?=
 =?us-ascii?Q?UzSab6VK5D99+FGRBsOWykk5+KRm/mNT5oWw0UxQLKC0MTd0TniubYyt4Oqb?=
 =?us-ascii?Q?O/93ez3uHxpoXph9EPXxGDyU1oGRd21J6i0lgLYNj3lgJGgIH+RLIX9V1yfL?=
 =?us-ascii?Q?HJvLxF1Kzm5i8GhC/M8e8R+p0HGNK/ojrHcVFCGewkmmK7ul9iP7Rwzx7i1z?=
 =?us-ascii?Q?2IrcFevGZIHUser/VLFRSXJWYvx6VvA4nQ+LIs6D3KKQ0qgsXAawfHalwV+a?=
 =?us-ascii?Q?HX0i484sS6eni0/St533dL+Ulp0H2nUm1Pn/f8nyPZ2QboCNceZfNWx6Mdsk?=
 =?us-ascii?Q?QO7uYF+O7yL5U00VRfbHAIQUVXp6cILrSIwMhjjb8vQpZEChlpAcFry4ay3J?=
 =?us-ascii?Q?f1sLCjBwD/4FnvFHrEacWzA32mEIbIQs4Cs5ib02wFvKRUZSXukzCV+2DQSp?=
 =?us-ascii?Q?bJApWC1wtJ7SPUSYR23/HL/iXJjchKuH8JW2J4MtJe1fj+CGCwr5B4uzupBx?=
 =?us-ascii?Q?LxkIArnds0RcaR76zH+YtHFkzZ3O06wlIe2UWuG5Ih2/kg77d7W/MjwsaXhM?=
 =?us-ascii?Q?vBUTcAlMAL3/0eZKsjphoNNJINMi4bxKeXKy75k/QRSbGXCivoBuvG/M9nkm?=
 =?us-ascii?Q?VnigRFs36ZXAh3W6p5zp4xahxVQNac88wxbMIvZxvBAvUws5NyjLEDKnw6Lh?=
 =?us-ascii?Q?vuEQjkUlOPxxrgDrqPmWyFMaNJxIRoUX/0Eog9YY4K2u3pDrCxc5mV5Keon9?=
 =?us-ascii?Q?q4g0dPZgjqB6xjMUyDidIOH5HUwkbvyVsMNMyzegy5gWKbTH0r8hSqBQkNhv?=
 =?us-ascii?Q?qZppqx5WbduRWa3AjnfZp+VBs2qFWRuKySgy5R2fQvLiOfsjPgupLJOGVv3e?=
 =?us-ascii?Q?dAzRhuVE54odmZlFSceAvLQ4LonFRj7SEVigLQdfegFnhc5420FQ/vJRm7+p?=
 =?us-ascii?Q?gh//iI3Q8OBGRmNcQYLky0Y4mh3ivpJvVE426XOB5FLQ435GaojwybCLzYrL?=
 =?us-ascii?Q?L8HcJ8j0n3Rk5C+IAXFte1/n5hWwiOH++xeAes2c4bk5HXCBCOwofalZm5wK?=
 =?us-ascii?Q?TfWtqHTG6qmIBSlPckDoxn3OthaNUYwiLxy6Y3KzOMK1NrqiU1v52ZRPdGYp?=
 =?us-ascii?Q?c18peiHeARWEMtEqYZ56nJjFBw5BIMsYk4L3zP7j0+yTN2P0HAHjO/g0VegF?=
 =?us-ascii?Q?xi9uIBkGzjctkR2QVgDUFoxldc4R5A6GOoAWNZSWRqJs6aRYzIxnfK1Yeq3V?=
 =?us-ascii?Q?AugEg4HcPMkZhBiCV9QIl8WbgEdviTxl4mRC1p8Hnu2yDGzF4WC/AXh8adsw?=
 =?us-ascii?Q?iF6bArS64UDWoNpat3W076D5lNe+r56bFwyZOIjytUpQr6Y9O+bIcPahkCOa?=
 =?us-ascii?Q?Pb4XMkzV4V+VG0Q=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 16:53:01.1448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 573ebea0-8be7-430b-d155-08ddefc15664
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDE2NyBTYWx0ZWRfX0CtVWuGWiHt6
 k2uk8+m62bGz5i6PV+zbWUBDMYx2z555IpNiBSd+4JeNkZZPTSQKgENPfXeth+x37/0/NBnrLbt
 43MeGIpaijeZbumjvlHsqSuA9Y/zRh6z9MeO+LTRkUyuJY3+6LX7KJ2r1YAzGcHqZfHfvpJhvEq
 +ANg2aH1xSMn42le9q9hgmWGIX1wz17kO1ZwFkppMWU+pqzUflcsKbcg97u8g3/THWm/7ONf9dr
 xXQi0FKx3Y0FTqp0/h2Qo8yUPrKfTqdIPDcDcbIfqxBlgLOoUpoC+v56tbUe8/CYGNkqHV7Wuog
 7yEOp+M1zR7TZQkpKkV1rsLvzEjt++lFUj5gFKPCMTcqJwSAVLMwy7ks/F7AmQ=
X-Proofpoint-GUID: -DRv_JJWorjUrYpiC4lmizLjHNx9HvaJ
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c05b70 cx=c_pps
 a=OqTse4armd8RuBztg9TYog==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=YDMKhvUW4AwCc899GYwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: -DRv_JJWorjUrYpiC4lmizLjHNx9HvaJ
X-Proofpoint-Spam-Reason: safe

On Tue, Sep 09, 2025 at 03:14:00PM +0200, Pierre-Louis Bossart wrote:
> On 9/8/25 15:15, Charles Keepax wrote:
> > On Mon, Sep 08, 2025 at 02:02:09PM +0200, Pierre-Louis Bossart wrote:
> >> On 9/5/25 16:31, Charles Keepax wrote:
> >> 4. host detects ownership change or times out with a failed transfer error message.
> > 
> > by receiving an IRQ on the owner control.
> 
> but that IRQ may never come, in which case the entire protocol would fail.
> > 
> > You might need to elaborate a little more on what you think is
> > missing. The four functions implement the four operations that
> > power a UMP buffer, checking you have ownership, passing
> > ownership back to the device, reading data, and writing data.
> > 
> > One could combine more of the functionality into a single helper,
> > but then you start to hit problems where you need to do extra
> > bits.
> > 
> > For example HID, very simple just: check you own the buffer,
> > read the message, and pass the buffer back.
> 
> I remember one of the early implementations of HID support
> in a Realtek driver needed some sort of timeout to reset the
> communication in case the ownership change interrupt never
> came. It's reasonable to expect that things will go wrong at
> some point in the communication between host and device, isn't it?

I will have a look see if I can find that driver and see what is
going on there. But HID seems like a good example (or at least the
event part of HID) of why the wait isn't in the UMP code to me.

The only notification that comes from the device is the the
UMP buffer is being returned to the host, which indicates a HID
event has happened. But there is no time out on HID events, it
could be months between HID events. Like one could set a timeout
and at each timeout just verify the buffer is still set to the
device but that seems very cautious. Or one could check the buffer
is set as expected on boot, but I would really expect the SDCA
reset/boot logic to ensure that is good.

If it is a UMP transfer where the host expects the device to do
something and return that may need a timeout but as that is a
subset of UMP transfers it feels like it makes more sense to
implement the timeouts in the places that need them.

Thanks,
Charles
