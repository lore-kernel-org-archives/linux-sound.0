Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86657432E84;
	Tue, 21 Jul 2026 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629869; cv=fail; b=CQ2U8E0Yt/XTEbpAQCZFfHAq3KbbXuZ6Ux92DIomcVn0jrmVfiRQM9Wh7zEms8/QB2tmlNFgK2AB4bnp5Yq+6Wk+J4pO6ehjPCxFy6paKdjhpyHBykh2TMVJ/1s7FSn//v8V8IXBnN4AxF4SoNqzpKxBpLgrjQPg9QD5SFmsAC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629869; c=relaxed/simple;
	bh=bnFz/XA05+A42KcvYn1QHlhuL6oBYMKUfZxQP+4+xpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkvBH0kkHUtB3apf+qIDnGA5vFurVf6wrsQsglnHAaxYMBazpP9GgWMmk1wS7kVsHINrKsH4PdI2ufO7bo0jwjSUgZUkdY288MS7YZuHSyufB2g2t2bwmiRJQIH2+5kcrqSbjhcMx6MyYbF7Oj7eBRLSttZB8XH+6nzuwpwsosY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Mr/2sxjv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RyGRW61a; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Mr/2sxjv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RyGRW61a"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4w3Fl3878144;
	Tue, 21 Jul 2026 05:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=xd1KcKJwUgL30ecU6l
	VWcMJ/hxExksXYfJh8BTGoeWI=; b=Mr/2sxjvWO+/mH/yb5EYZxGp4yIS5wQwA2
	gKDFfryAgbeecERJqWGTjthC0WfjCvFLWy/DpJ771D3KcZM0xrL85xWbkgbhS1Mt
	a7da4GDumf8t5I12o8Gzmq5ozhPhMRFsWkFcDVkJ0OZ2dwv8EQGryGYMjAFmxsao
	mCg2JYQ0JESHXliZHEroupf7enVcejUFC/qLgSlIsZyo0dFxaVUc8BWLGqMh4L2V
	fMul04LglykkBEFCVIbmPxDFSg7MeqtsDuOnoJpCvQOVg4mnSrPqdzJAC1aRpkE9
	aFuI/cZ6PvDE7YAlR+yp6KcInofb5urBLweG2jH1PafSmaLrMfHA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022091.outbound.protection.outlook.com [52.101.53.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfbvh0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 05:31:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fee8FIMG5dPlZ7gkBy3dMBfT+Ae9fpOE4d5Th8GPw6JuAG5FCrnEY9saU4rbKCMa+t4ETS7SIiz1U+0ksJNPU/V2T9OQe4SXTnAXryMx1ulxUnK07WG21IXipuW5COXSG7tmYetgGokDiXb1Cjw+PkPkqh2dG/NbvY7NpJF+LK7NgT6FS+uoKNuUVkcvNG6jvCTcYb4PtGhYznj37WpvW5xbwRgNnsKsbiXDHPuYg0PueUdr1kdn7fOy2mEOoFpJrCZSedNcd00KS45L9kq1YTXIsM19N7R5c+JVkGHHI83c5XeuHsbC6euTV7fjtfnaKzKVNRgZUMrSVAEI76MqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xd1KcKJwUgL30ecU6lVWcMJ/hxExksXYfJh8BTGoeWI=;
 b=bweZnnt3anwp+Q7bCpsPvO9WqCgpFPiT4OO4LETOrdfcVQQd3N+KyuR5B26QvP7YWUQU3v8cyNoNQvrpO96cVB3tNEAaoPSekuZJ5kQUVqFkGRuxPGPfQcZBBgL+LiUC5lAWqUIco16LieCL0sz8j0GD5OsaAvP0hi0U3/vLV1BZzifU+9ltds05+bjaiOMeA8mx+GnBkNU1FURIA5Gd3WPIuQ4XolUID/9icY1m/1Z6jkYoCq9o/lI4rJkKP343PHYqHK7HzqL69pbYM76/ztUZ917eDwWJaXJVnTFreyF2XTv5TAifn4P9yZzCvHQc9d0Y2aYXYKsTSKJxB7Whmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xd1KcKJwUgL30ecU6lVWcMJ/hxExksXYfJh8BTGoeWI=;
 b=RyGRW61aw829G5ym8Q/Ty1F1nq880qnv32Ja5uD8W6b3lbJbztICH0mqvZkQ2Z4EJmV1HmCrqg8BIjIImHlG0/vXa+Pqk0hSm0ZhbWlNqrUIcOg42IcWnMSR2NsUNne/ltEqToNxRGRs0oNcIJrBUMGmxbutBmKB3DYjsx5AW/c=
Received: from CH0PR03CA0236.namprd03.prod.outlook.com (2603:10b6:610:e7::31)
 by SJ0PR19MB6632.namprd19.prod.outlook.com (2603:10b6:a03:47e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:30:56 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::2c) by CH0PR03CA0236.outlook.office365.com
 (2603:10b6:610:e7::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 10:30:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Tue, 21 Jul 2026 10:30:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D8494406541;
	Tue, 21 Jul 2026 10:30:54 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A15D4820244;
	Tue, 21 Jul 2026 10:30:54 +0000 (UTC)
Date: Tue, 21 Jul 2026 11:30:53 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v3 2/4] ASoC: SDCA: Populate IRQ data earlier
Message-ID: <al9KXWTZAVG5A5NI@opensource.cirrus.com>
References: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
 <20260716142639.2306757-3-ckeepax@opensource.cirrus.com>
 <5eb4f715-4bbc-4dd7-94b2-6968b1dcd273@sirena.org.uk>
 <al4xKTNo9+Zm96IM@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al4xKTNo9+Zm96IM@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|SJ0PR19MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 4103423b-6bc8-4928-8a77-08dee7132607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|23010399003|376014|36860700016|22082099003|16102099003|18002099003|56012099006|5023799004|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	bZEM0dcfAzPI7/iO9PwZ6xTtB50QLgVe+wXzkQWnCJBga1A0z2xeznpfOt2cxk38VF2xL184BZUzvHI7QTmnZANP3IWjUxmlT++K4mHzQAJ5dApscQz8p2qtyXYbPT/VtBzKCPdhLqBJpDRD2sxUeJUFhOEeoqLw3oMoBTLcVujP/L3asBLl5g40ceQvOM1Er3XrDK/kbpoTkX0flEhhXqYaJEBqVxZSzwkSvymokKmQgs/lZxxO/MUYTYd0Jg8qOnJHo2xcEtz8w2pSvEUUXxQOIYLmPlrjZX+5PeDvYfxpW5UJpPrfeCP/Sslr0XQ6rtUNvnGSY+BCofECpjcsbmZ2rzRq0rVbau6zouyVRn0hJX2e3NJdiuieMFoQioa75cqK9/X6p35HfncD/AIdrWqTwmA/Oj7L+0B3vERhNE0Y/csxSk8V63UWeAz4YLDYPxAoshgT9WcDcRoSnM3cKcXpFMCad0w95CqlalWTqN1HFHT0j2wPLyCLS/XDUKhs2PnNmergwgwbTIFW6cPBjC4+FniANEU30cGmzOVzyyf3HgEBZep1USuFqYwsIsOff2+rsCJv5IGmBZrNtyLMI9UU4xoMuC/nNZBkBQaFIvxIWvT8r/OICG4M3RM6QQTakKc/llPKXBtg6TOhdmshe8EclCq3YZ5tgnfnYavOMHakzF0taGlYecKbsXWMez771kPHYbLGvr93m/qbeU4L4A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(23010399003)(376014)(36860700016)(22082099003)(16102099003)(18002099003)(56012099006)(5023799004)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U2hIkwywcfFOV6w9XnTZ5p9e7JwNHc7U+qZQybYRr8qm024OIncWKknmrV+Hw6auOdCgjXsSFU7sItciGF34wzd2GZnCuqIW6nIpBtBDPYEwXRRS6k8A7ZcrFDZzp8P6kGUcZ2zJydrJ6bVglFy/c1bHsK7H0eYXznb6WwO3ZthYsPFi+KeP/HONdOZS4nhedt67Ecat71+Egn/hAyLbdvTlPRmER/zeZAFcI71Io0OQMQuqn/ESmP/5yxTNWWtwRtz5j640sWkqcQmwQgyCT7eZ71J65hQoIGKP6NAm0vjCjBQ4GkY1tYSMTnQ40XGex9P+xSgyF8SLMk3jwheOOd0BaKzcFfMVdIZVQbnFoR8NXKpkmOFRpW/ixK5F7wHl02cY1vgmxoH9ilkTJm2gEuagoEOFW9XwX4BVsLVTh3gtl2JHqynXWKHT8APEX5d3
X-Exchange-RoutingPolicyChecked:
	UmcihE5w/qLvew00u5e8iTR0cz3SfNE0hOKcC/cOhsos073dJM5TIKM/OMewuuaO11BEEFfIs6irx42b5XWqIUMc402FIM0YAmThQeym4RJRQpYhHoWIovA1GlQiZycsY9EBhvaI4eVbMZZc1U13yKmB+C/Jxy8G4EaJC+csfE/tNTzG0XOUpC9t5xIrcyeLGj5oL5TdSDigbqr0nlWXJ6+2gkCRYtt85FX+mMvh4kGK0i8cAUkWStoyS+emPBRdWB291FBdVi5iKaVYNZ7WyEP24NSr0bdZK67TFGj0lI4JPhO4m6n2Y9G9H1QlVokpWLfJGeVtfDUroVKr9EQA6w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:30:55.9256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4103423b-6bc8-4928-8a77-08dee7132607
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6632
X-Proofpoint-ORIG-GUID: icAdNijyfE6VNQjNzCv3z9MSnxPIJpUR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExMSBTYWx0ZWRfX6t2OCvfQ18Y5
 AzKrdSKaZwO9URVknfpddg9UB5HEi9SNvlDSl1nAdl+E38dQKBVzOQvJ/w4TGqAFKWezzq9MAzX
 AovaYujWzvOPvjvDRRH4mcZX3NM7+Uc=
X-Proofpoint-GUID: icAdNijyfE6VNQjNzCv3z9MSnxPIJpUR
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a5f4a64 cx=c_pps
 a=Xsn+9nYcq8ItZ5QxXIZu4A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=6vu0V5xjExhwFY4AeMgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExMSBTYWx0ZWRfX2GEJ7YyspmBI
 NmBD1RwXwLbNrS0X63oySPtHeNfNFiVygC7Doo5h0w7W8FS4NuAhNRC5csmElD4ShyYpMy0oEXM
 6K0O4lViVZip+YYSlfFI4qfgnr3zrELuh9zLPuoo4Ct4cR6wwQdPrKSw9c/J3+PKjqVb5/WQMJH
 dK8EnOdmOEgxhoDc+/NaoGV4noiPEKuDxVfBtwtNwOaMG4p3rsDKUU0p6CzKbFW/YfKTsK0dkja
 LKxnXhto2a16b566KQqxhRlHt6HvaMy4UkoEvpsf8M7Uh+MY7pqRfWKB8NbuMn93KZBrD0j3c7u
 fl4qj9QLabQKyJS74yLMWNTcg4DSr9SISzRfavs1EFW/enXDca4CB7EeBUkJSTohBrxlSwjwADP
 TiwdddjJ4Zky65BHFzvdxQpSsY59DCUzJry7ZZT3NBYafRGt49N+hP0pTjedhTNdqodIZiiKHT8
 LdPdNTqjJ9+ecWJYCUA==
X-Proofpoint-Spam-Reason: safe

On Mon, Jul 20, 2026 at 03:31:05PM +0100, Charles Keepax wrote:
> On Sun, Jul 19, 2026 at 02:24:26PM +0100, Mark Brown wrote:
> > On Thu, Jul 16, 2026 at 03:26:37PM +0100, Charles Keepax wrote:
> > > Currently, the IRQ data (attached Entity/Control/etc) is populated
> > > as the IRQ is requested. However, this can cause issues as
> > > occasionally the setup process wants to access specifics of
> > > an IRQ before the IRQ is actually enabled. To facilitate this
> > > cache all the IRQ data during sdca_irq_populate_early() and make
> > > sdca_irq_populate() simply request the outstanding IRQs. This
> > > also has the advantage that sdca_irq_populate() can now just
> > > iterate through the IRQ array which is much smaller/faster than
> > > going through every Entity in the Function for Controls.
> > 
> > > --- a/sound/soc/sdca/sdca_interrupts.c
> > > +++ b/sound/soc/sdca/sdca_interrupts.c
> > > @@ -375,7 +375,7 @@ int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
> > >  	if (!dev)
> > >  		return -ENODEV;
> > >  
> > > -	name = kasprintf(GFP_KERNEL, "%s %s", entity->label, control->label);
> > > +	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s", entity->label, control->label);
> > >  	if (!name)
> > >  		return -ENOMEM;
> > >  
> > 
> > Moving to devm_ makes me a bit nervous.
> 
> Moving to devm should be good here. The expectation is that
> sdca_irq_populate_early() is called from device probe and this
> moves all the allocations into there. Even before this series
> we had devm_ allocations being done by sdca_fdl_alloc_state(),
> so the requirement to call sdca_irq_populate_early() from device
> probe already existed.
> 
> With the split of the cleanup into two steps though, we could
> move everything onto manually allocations and clean them up there
> if we felt this was a little too hidden behind the API? Or
> document it more in the kernel doc I guess?

Ok looking at the patch Pierre pointed me at I think maybe it is
best to update this to not use devm. Will provide slightly more
flexibility for the calling drivers, its fine for the class
driver as is but people are doing quite custom stuff outside of
that.

I will do a respin of the series later today.

Thanks,
Charles
