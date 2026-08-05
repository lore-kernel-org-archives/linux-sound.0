Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2133747F2FF;
	Wed,  5 Aug 2026 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945897; cv=fail; b=fOx01WJx6gRtZ1iQuBZRePi6XnTitTObxyyDpOEMNRdVuQ75kHEZEmLnQhpqEnjWHvKbEJ5jfjIWd7Pr8VoeLmz/prHvCl8hAI2VtSdQGxOGgypptdjm+4CVScd7fz3Asn6zsFC6LyZP6RO4ULsxQRsgeViRVaeJpByJB4faCec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945897; c=relaxed/simple;
	bh=+g/qgSYIR8qg0fRRwW9Bpjl6AI+wqeiUM6nyYkPjUKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmjS+eh/tcEDQ9j1RgaNLgUGli72lkRu1A/677w3j+Ww5gZGwpe7nZYFZtG4MilQlYmKtn1qkHBCSeGTtLYZGySWpXNB3h9QMpfStYl04pDHpqTftqnhAkb58mknb5mekJmmZUvUlyc9vs+BEVwVzmMNQKBBIr4xR062R3yMMZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q0wWbgN/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZJzgRe8J; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q0wWbgN/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZJzgRe8J"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675EOSLr160386;
	Wed, 5 Aug 2026 11:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=pUEkCC4BZKTyxkJt4z
	6V9xfIEKIKLniDgJCk6bfU8Rc=; b=q0wWbgN/tfX7K9R0Dzajve+VAX4akjibwR
	ib5oFTHxUbA1M8jZB3vklX0WXpKoMP2l7HdzgoeF9Et0tSYYVFybL2aPlS1lydng
	kFwSfMHhV2steIFwHcgnCkbDDw80Sna4+YfDEC3RXZUewGweMFyK7PfHbvx3pi+Z
	fYxR9mVjL+y3T81xXBmWFuJmd1qT3knUzAzvz+WgL8/WtvALQ3V5vJC6pBGgbC7+
	+2LzBpaperuKhroSfctTaH8ePe9sgsNqevkoFI6lrr8GqGpK5eDMLruERU2ACfxO
	58OLu1AVJtNA+t428yxLP6WNO3hmk/UwK/omlhvP9s5z904ut9gQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020125.outbound.protection.outlook.com [52.101.201.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vp37c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 11:04:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLm8LevbsNHono1NeV8ogyvlCYK5jmS7abBY1Vla1SkytAOmoS0+fHZCkB/Zmb14nqBDz1aE3iKCxeEs2PLfEdyIDqP0KWElX2PZW/pY2/0cU6u9Y8O090ACSzdV8BB8n6+53qPWD7YM74FecF7T2gKzaymgJmx22JF1AMvJBEFMlkWVLDjennq2UNhLxYV4TuNxBfWb0R6+Gaj4Wn+sva7CJN/GTw+ETFrC/42wFoKISCzp71xw51KNPnPMhaUvY98iQzEIULq6DFLRQEHEIYzNpb0XjMTR7/y/ThXWkP20thvPigYuul8Bg0R8hA+7kIT0hdZTmI1ZHqUJg2TE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUEkCC4BZKTyxkJt4z6V9xfIEKIKLniDgJCk6bfU8Rc=;
 b=Z1vTh3HGrGpw7EA462bYvJf+pf4bhIbjrLiSGli8E9PrKH44k1Ddrv7vbFpL7dUuJj++1RS3PKTv9HUKHq8e5+aLGZsjulbpMRoH96LqvLhSUL5H8l88Q6EUKKQrTK7nJ/oBBXKFBbb33U9LIzAd7wFDfj2eWTShGODtynnFaLGtq8uXZ7gWqKfpQrn9MImUOKl+g/TSuk5LcTjJAHm2hix2VSgH5h6jcjE1U+KhOn7JPfqSwDmHkMy/ZJy8btJupFg+GNGF2jKvDsApo1gjZnYX6nMDdR6tSeSAavxMsJWrfp9ycDLD7H4fyLi2EP7FBCjXwUdLrfReLvD+iXIrZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUEkCC4BZKTyxkJt4z6V9xfIEKIKLniDgJCk6bfU8Rc=;
 b=ZJzgRe8J/94/EPqIBsOS/gSRM/brHGAvb9DyOJelRd9RlIANDnbkIx9NufBpLAPWsH1LdDi9ZO3y26MdSGC9vfUT7oFg+1yssmMMoVeTP2MBvb5g8kLCtitrmC06Mwlypgi4ne+CibZ311XduFxUjluKhxE9AhJLsHDdsaL1NQU=
Received: from PH8PR07CA0015.namprd07.prod.outlook.com (2603:10b6:510:2cd::20)
 by SN7PR19MB7336.namprd19.prod.outlook.com (2603:10b6:806:340::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 16:04:29 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::4d) by PH8PR07CA0015.outlook.office365.com
 (2603:10b6:510:2cd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 16:04:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 16:04:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 54180406544;
	Wed,  5 Aug 2026 16:04:27 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 37A8082024C;
	Wed,  5 Aug 2026 16:04:27 +0000 (UTC)
Date: Wed, 5 Aug 2026 17:04:26 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
Message-ID: <anNfCj2e5kPZhaK0@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-9-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722234221.884765-9-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|SN7PR19MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 67612533-d637-4419-d808-08def30b3ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|30052699003|36860700016|82310400026|23010399003|61400799027|7416014|5023799004|4143699003|56012099006|11063799006|10067099003|18002099003|3023799007|22082099003|6133799003|16102099003;
X-Microsoft-Antispam-Message-Info:
	PMp2wVJSIYYwKSVw/tU/IRjAzcBdHyZAgCHBuSzOkHGSQ9DA9W5Cz9c8d+nPNUScc0uN+VlHcEPkMB6g16AZiOJNlxnkdl3Tuwc6DgWWfFcNtCZaXJLtegts7mEXyKsBsXAZ0waaywVS3fH5H43RomtWRznzvuFs7Ob7Fw/g625Y5FVTqSAmc9svZrtq1MJlvvdoVbalOcT13YTTF4s3e3U4BGXFcLl/FUFv6o15KrcTUkAFcA/j2Tz0UgstoKGn36WWbMiIDddiQ1MTajJTtVVtD+PX5Xg4lT/KYRx+XgxdcFD2mGosD58O4JXY2oc0lwx11xydg4eilriSIAYCug56lj/8YvgWC7q3+BkrS65zExSTXD2Y4FjDAdoBFxnQGzXzQM2pNiIwWThsI6SR++bbxy9jvtZx2zzJdOU/N3Nf4T1eYwLBTIl6S8bQc1jhwIJYjcV1oBgY5lLK7DGnqOVnvxeAEeML90t2IsJXSZ6i+Q0DzeLOv6xORdlkVqNM9ErpkPDmPgJ461kKRH40zd8/jAyfeuQKspONzk+CvwnXLy7ggUCDT9UBSwMel15P8fkkzbIloKHuMuw1IfG8UZlqJJ9YkLxHReHR/4bVnB789cNVribmN2GTt4mQ9vrSj0qkwW2XPZMO4qjwMEXZmDwlQcpveBD+RSmdJsoBp3RZKCVK+0WeuJkXZC/ON+oZajbZiyn3ytnpGqi/OSWThg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(30052699003)(36860700016)(82310400026)(23010399003)(61400799027)(7416014)(5023799004)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(3023799007)(22082099003)(6133799003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gUku8sFg5LI3c/4Kxq2WscYDmP9pA8gpcbiDeZyL2+LZEKkDZJinpHwJJnLd6awNb8vSvNTTc/n1q6JNac4eJO57yc12ZkBK7Bedei9Xpz6i6TdrOc1noAtyk967sCLOxWJjtm+kyapP3FiTPa6UL7tYNzI+YaBRGLfVI66fC9wjcg7aI0yZ5/NgYlmlya/5Z2V6OWDN2tJctrZHmoxdb/SmY085CHl9oP+OwnL9qpCy1Z9NJ9R5FmL26k3MTpDL8BayNfuhUZhhnyhKD/YYI25VlI/8dzr3fDn5Wfckr3CfQve33y+3Vo9ab/HdwI4sKcudSEvt0ZNPt4i4lPTnvT+46xT2HHs176y5HV05B/i2rH+rN7JX4LTEQ1Zt0LB+SY1gVghVBZ7knC57dbhjgSCz+NyPzuNKl0W6aoAFgD38A2fxPmpyTtpP8s7G1qZl
X-Exchange-RoutingPolicyChecked:
	hwB4VbxgPDRKXsJaU8wyrl4ks+fpSMCeJ4e2ro5ITegY/XNWVmqvt+qIbz9Nu8zT9Pp3HypoUEtJrzimgAY5Ko/H5N7jz2xD0v6eehJTFp3O2iPOU2r6wgtT+gcDWjIhr6vEeOdK3v1prf4GMHUmmEjo5WHyu3/IA+QMQDbcmxG92B6YyOL9/MaAAOJctjuQV7iUSDcKQwX+bQ/A2C/FyLYkqwWJsJ2y9pf3ZZA1ilpA6HcdRIeEHqhTZaG9kn4xR42x1T35QRjn2rULBIafi/Nv8c938e6gv6s8orQJc94Xq+Pw1l/oXRpx0FCrarYscM35n2kbaCATM411ju2+xQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 16:04:28.5331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67612533-d637-4419-d808-08def30b3ab1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7336
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzMCBTYWx0ZWRfX9nga6FjOWWUx
 FKIO3zovY86p3zYKkzrzGTmafZXKKnTlfofO3OkIzKIUQ3v4rAKSdrQ9Ivvn3IrIbkMnzKwzmMn
 75h0f5Y6eaM1McVey9DM3WNQ33qDfDc=
X-Proofpoint-GUID: sdwTGOkEaJfgqz2Y1tg58DJ5YdRyCaTy
X-Proofpoint-ORIG-GUID: sdwTGOkEaJfgqz2Y1tg58DJ5YdRyCaTy
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a735f12 cx=c_pps
 a=kB/eTyLYv2HckPafvHZuPw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=CV8L17ol1Tayo9yUOJMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzMCBTYWx0ZWRfX7cA17JZV0fdx
 Slo8rYRw+ab3RcUkgMm4fQak85ABN7/gHjGyvRtJpssbL1p555xwNyQboYnFk1OqI7OJwsbNlef
 LzMvwLVavUaghP8ehc9tGgc5VuNu1asIcACixm2UGCbnnNe6838IovHvI3lJkmhrh0KWCKnhGop
 pVeZWezfkvfkA1uU7jlZJWiZnPbj+63nrKZzLI4n0rjDBQWwGOu7wC5vTkr2UX0l23TWqiHgZm0
 s641+uiEjcvmreG8bBIstosbCC3cMKFuklf9yjkzy3cxCvrE1ZgXIAsjE/MZHDcJfuvcv8H7NH9
 BzmWByRuWeMDpKkW9CB0JvV/0rQVqXyPtDYXeH6NRkPJmGUAly1kvx35seTUgwtVG1V/ypIW/FG
 l4POXI/9IEHvXlCS9Uyt7EyAbO1yWpH+Y4MguXfGZkvG1PwSXvYVU3zH768mKXPeoTa3+v0JyWL
 l++cfR5sq2gb1FgpLyA==
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 23, 2026 at 12:42:18AM +0100, Srinivas Kandagatla wrote:
> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
> mode over SoundWire.
> 
> WCD9378 ("Tambora") is a low-power stereo audio codec used across
> Qualcomm mobile and compute platforms.  It integrates a headphone
> amplifier, mono earpiece output, three analogue microphone inputs
> with independent programmable mic-bias supplies, jack and button
> detection, and SoundWire dataports for both playback and capture.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
> +	if (entity_id == WCD9378_PDE34_ENTITY_ID) {
> +		unsigned int mic_bias = SDW_SDCA_CTL(function_id,
> +						     WCD9378_IT33_ENTITY_ID,
> +						     WCD9378_IT33_MICBIAS_SEL, 0);
> +
> +		regcache_drop_region(regmap, mic_bias, mic_bias);
> +		ret = regmap_write(regmap, mic_bias, ctrl_it33_micbias_vals[0]);
> +		if (ret)
> +			dev_err(&slave->dev, "IT33 MIC_BIAS: %d\n", ret);
> +	} else if (entity_id == WCD9378_PDE47_ENTITY_ID) {
> +		/* Announce commit-group count for the FU42 writes in pde_post_pmu. */
> +		ret = regmap_write(core->dev_regmap,
> +				   WCD9378_ENT0_COMMIT_GROUP_COUNT_ADDR,
> +				   WCD9378_ENT0_COMMIT_GROUP_COUNT_TWO);
> +		if (ret)
> +			dev_err(&slave->dev, "Commit_Group_Count: %d\n", ret);
> +
> +		/* Let the master's WR FIFO drain before PDE47_REQ_PS=0. */
> +		usleep_range(2000, 2500);

Feels a bit odd using these callbacks for commit groups, really
that is a thing that should be implemented more generically. That
is a pretty serious task, so I can probably look past this as
vendor specific thing for now. I guess my only points would be
can you live without the commit groups and just use the current
values? And if not, are you prepared that there is a good chance
this gets missed when someone does implement commit groups and
this breaks.

> +	/*
> +	 * Unmute FU42 CH1/CH2 and stage 0 dB volume via the _CN (NEXT) alias
> +	 * so all four staged writes activate together on the SCP_COMMIT
> +	 * below.  Writes go to the vendor slave regmap because FU42
> +	 * addresses are outside the SDCA class regmap's routing.
> +	 */
> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_MUTE_CH1_ADDR,
> +			   WCD9378_FU42_MUTE_UNMUTE);
> +	if (ret)
> +		dev_err(&slave->dev, "FU42 MUTE_CH1: %d\n", ret);
> +
> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_MUTE_CH2_ADDR,
> +			   WCD9378_FU42_MUTE_UNMUTE);
> +	if (ret)
> +		dev_err(&slave->dev, "FU42 MUTE_CH2: %d\n", ret);
> +
> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH1_MSB_ADDR,
> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
> +	if (ret)
> +		dev_err(&slave->dev, "FU42 CH1_MSB: %d\n", ret);
> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH1_LSB_ADDR,
> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
> +	if (ret)
> +		dev_err(&slave->dev, "FU42 CH1_LSB: %d\n", ret);
> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH2_MSB_ADDR,
> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
> +	if (ret)
> +		dev_err(&slave->dev, "FU42 CH2_MSB: %d\n", ret);
> +	ret = regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH2_LSB_ADDR,
> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
> +	if (ret)
> +		dev_err(&slave->dev, "FU42 CH2_LSB: %d\n", ret);

These should all really be part of the function regmap they are
function controls. Also would mean you have the MBQ so you don't
need to do two writes per register. I assume, with the commit
group stuff, these are writing the next value rather than the
current? But nothing here updates the functions regmap for the
new values, is it ok that those two get out of sync? Or do we
not define these controls at the function level?

Thanks,
Charles
