Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2795273D67
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 08:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408239; cv=fail; b=sQMlSj3bX9pg9gVU/fFmMM1Vws4rwSSFhVGrAEMH0Yi4qxxUXz/ZvZk0gF4Z4OL+FskXUm/9IJLijbM3wjBScwe6T+nqyqxUv9t9+V0IEfMRouQX/3n5fqHZXbMKHsT84vjnOyILWn26lNdvC7CsmgUmIr6tPR4U2Zfrhng9vmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408239; c=relaxed/simple;
	bh=MqC3BawXuPhGHgBQNGA7Ua8OurrYf6ivzjhnEit+4ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0iPprHP63XjApg9Rl3jbpFYIngNI0wJ8Og3Gboma3SLF1ybTPjLzFao3kUs6QvI0Gpql6GMDU8Zkk/KZreZBv3bSHbiccOXTx7modS1ecsnj8zpuabzQ0wh+DccyOLwOTPMGcOJpH3ukIKkPP+z7uVe6PRl5yA2SuUMplDgkuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cOV/F4xW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gIZSxhui; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cOV/F4xW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gIZSxhui"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 588KTCVP1252810;
	Tue, 9 Sep 2025 03:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=e1EkCKQVy5eRYHbvPt
	3ZPEwnaqOCYqyolIyJ0AnWVpQ=; b=cOV/F4xWHpAgCkHzjYL+M2yCrESM7flihW
	NneEitBR7xlxWyaDnspkjp8TIj8iMRQXhFQuyScWszy7yrMSAHcK1EPg0VqsWCM8
	NX6UZdxOf8QK5C0WxqZCYG43MUHvaggwwinJ6YAyQjBNip96XOgmm+dC6/eua4/o
	+5ZONBwkN9s/bw9vRgJxk10gDomrUu76Ocfw6SfhkY0RYUpOahgvr0av+W2dtBzE
	st4+KgDTslsq2JJZlqtHkCqRAh7TIEYeAsEIg1oJG0aH9Or9Lst5+ELDXAyKJmA+
	ZbXeLgSwCa3C47B28BXk/iosBstdsII+vaiQfgWNg4EQK0sKJzcw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2130.outbound.protection.outlook.com [40.107.93.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49227r8vh2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 03:56:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bk5LA9kMjz/BOXkTmTAysJs4fgh/IRjinzqU5VHqIFGkFernxFAF5GLvxDBPbnsRNkvbvjds/ytf4+cDj7RnJKJK1IhzwyJGyiC1X4w7cTDnSRnQw8fUtRuaoQHavIatO+FMjjCqFV2FOCReHvFGL7ZbCnCNsRwcmSwTAwqk01rexV1SMgJe47NYrZW3fOkAaMvJmfTAYSOY2j8gW37kmXWypLobpLFrMKR2O2fh8ibtEVgkAl1y+PT97sEy4VNmz7gKRUBsqJnWuFCZgk2Pt8YYUveXicMYDn/+qkIwmjxmTV9OWEewUe8zwYXBMgohBwGcXHUgSrkZE3PGOD4xEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1EkCKQVy5eRYHbvPt3ZPEwnaqOCYqyolIyJ0AnWVpQ=;
 b=tpX6je85+YT17Xae5iEp58kwxHM9yvqLC3oKpGOkzlSZeipFUGxGwLDQDlQtI4osbMkfJhUUk8vovj9CrXMPi+Q9yEzkXaPxvTx4ySKeZ1WexN2pR5e0w2FFqmKZY0Q5PKR+Z4U0nL9bu/NuV3EFpn7XZOcDDx/of6bUDnYpS6s7pxzGNIe7sufrAYSmAXRmVozbAGd73eBHdwOIKakLkkGRcPIgduUYx4vHlHlfcU34bGtyYJ4eYCIZJWg8tzknsSls5AqjWc9ithZWfQuoY/aZgOs195b4EDJl/6zwaKdwr0gm/vcUMcipL9PGzaZhAkBRgSMmFE13g/6uwdfdVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1EkCKQVy5eRYHbvPt3ZPEwnaqOCYqyolIyJ0AnWVpQ=;
 b=gIZSxhuiO6fmNVJi6DRsbYvP/0mwEeEBy5srfi/vmOQb6jc+C4m1NXQLNVfU+AxoOhbo0RYLKqKATaMtfPO/9v5PKOcoOrtXaqYuEyBXKNj1uDkwzlxEfxkVVpkL1ZUMA1KAcaFv6lEV0HQ8i802lcNTA6udiZBe00LbmhI3b1s=
Received: from SJ0PR05CA0205.namprd05.prod.outlook.com (2603:10b6:a03:330::30)
 by DS2PR19MB9150.namprd19.prod.outlook.com (2603:10b6:8:2b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 08:56:56 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::b) by SJ0PR05CA0205.outlook.office365.com
 (2603:10b6:a03:330::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.10 via Frontend Transport; Tue,
 9 Sep 2025 08:56:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Tue, 9 Sep 2025 08:56:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9EF57406540;
	Tue,  9 Sep 2025 08:56:54 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8641582024A;
	Tue,  9 Sep 2025 08:56:54 +0000 (UTC)
Date: Tue, 9 Sep 2025 09:56:53 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
Cc: broonie@kernel.org, rafael@kernel.org, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, bard.liao@intel.com
Subject: Re: [PATCH 07/15] ASoC: SDCA: Rely less on the ASoC component in IRQ
 handling
Message-ID: <aL/r1XQmDnK6ZrkF@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-8-ckeepax@opensource.cirrus.com>
 <01bc3a67-6ed7-4bb5-8106-531af7f29d63@linux.intel.com>
 <aL7SmSjHTZ0lDm8l@opensource.cirrus.com>
 <aL7rltyvMy/ctrFU@opensource.cirrus.com>
 <7687e3cd-2f66-4092-92aa-774b7ed7e487@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7687e3cd-2f66-4092-92aa-774b7ed7e487@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DS2PR19MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 2990d6e6-4bee-450c-a105-08ddef7ed425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FRao1nfiSghOcqGsyRVtF3nkVtcKSf6oNu/Kfa5ASF7vuqXDU5/cQAlIl1GB?=
 =?us-ascii?Q?8mkOY3pu4s3pKEEFbpRDnzl7ErDUixJeMef/Qx6DFCN1VxVnJ5AugGDZZDXp?=
 =?us-ascii?Q?qRMjBX7KPHUS6N1XP+k/aT9xwy70w9/xESUu2lQdqj4yS2PtW/5ZA06E705R?=
 =?us-ascii?Q?5yERkgk+VvJepE18ChHCr/i9kom09XkB6fazsTJw2gExKUVGIi//gw0bjlpZ?=
 =?us-ascii?Q?9nvG6xwRIyG+motPv/0nTQEHBtA9HxYu3KZU4ZiBcFDXYvEb1id52gMTqur0?=
 =?us-ascii?Q?C8sBjTE/E7rwubjmk+fIF6wKp+yXBhIf4vomX1Sy1Vb0SCoXFWpbqyExuhKs?=
 =?us-ascii?Q?q4rvTA4EB0BuGb+w4RYA0Ok54OJZfInVvcNHHNwIfMCSyVzm8KOImMUbJtLt?=
 =?us-ascii?Q?iiwPKuPuCnKHRHy2qwzMkR22diL0UGcK46EV8/wTCv4KSb5fvyanhYlmsoJq?=
 =?us-ascii?Q?biPil55DJLgTXpEINPw24wpEcvt1GgCaTqII1Nls/UFdCquVNFBsY9fcGFwP?=
 =?us-ascii?Q?7ktkrpn5LK8cpNyjcQbwxaqYsqdanLtir9yvRivxWD/mYYBDXf7qCxa5WYKP?=
 =?us-ascii?Q?IB5QLlyuH0E8df8tFFrGfzSPn+ZkBW2IiiXw8jX+0xSr0jeVs+a2HWzsVTpG?=
 =?us-ascii?Q?e394rsaKxf5R7heXMM5iB45O0PMiIDA8SPguHsfWIgaDr8qG7PbQy93fGVwZ?=
 =?us-ascii?Q?hBXxRuDc3vjbz0dgs8YOw5JX/DaPBr8LnkreX/2zMTX/PXW5z7RFjuiZf+uk?=
 =?us-ascii?Q?yXxIkNOcwSmj7jr775v+KCMxlNZk6UVXSJWP6UrvujwcDXkSGy74kJbJBVmQ?=
 =?us-ascii?Q?0g/O8440rDXD8j5WvUgSJMpdWJZsJprI+GgkSKs8cE4afTAzwTRe2H/aNyvS?=
 =?us-ascii?Q?ZiryENjohENgx9Q4Wb6ovvnFT8Ks/RvDcD2quZOg8Ut7zJAhx3pTBiIX7xvt?=
 =?us-ascii?Q?ITMzaSOmWfSwJI4Wk4+0CTNARmijGaBcDJqImOR9tSs05m7gryxHSAPMXgRH?=
 =?us-ascii?Q?xTWSpeGjdDLnAULMgsBBub2LikBP5Uv0gQumdM+aAN/r8DG7t6aJgtFRexcK?=
 =?us-ascii?Q?D0emS1sHbaiEfUlqC8q0TfefDZ4bOfq7uoreYJYFgNd+obWMmwyUFKrCXDIS?=
 =?us-ascii?Q?M0+vLgWFvhiP34l7RbaeZJwcgZNq0MFpM8068Hpoc9KznXAixFXW3+F9mWqd?=
 =?us-ascii?Q?srew4Vh5QLp/WMWZUGy3d05vM75hQTbYDtCBqW4NzDgf2pEBeJ0Tt6WfRixJ?=
 =?us-ascii?Q?vcg6OcOjo8Mj7rtjupZNOesoyCsgsykUtecLR8a1GCBWVWMNse2Vi4ZfVa3q?=
 =?us-ascii?Q?aqvUonLfEHmCawb/kgiuwBy9weO3P0kYJ3fXOca6GfXkiLj/AUWHBF9KOvZ9?=
 =?us-ascii?Q?dTTEeY9utho2NztKZdgPXz/inDHAUB2J8CkCau7Vkb969qmJjC26zd5wjN5t?=
 =?us-ascii?Q?eHVJjA14uj11oYFQPiPBJiZahKmKFXQ5yzroTM5q0wzIFBuqmMbiafLm8Q16?=
 =?us-ascii?Q?LZcN/ITSoRBYVVTk++ZuSA1jdFLB/i+j0q39?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 08:56:55.7774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2990d6e6-4bee-450c-a105-08ddef7ed425
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9150
X-Authority-Analysis: v=2.4 cv=f+FIBPyM c=1 sm=1 tr=0 ts=68bfebdb cx=c_pps
 a=0CBzKAtbur25xjsvgbLWCA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=eGIY-NOgzIOCrT1opjAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDA4NiBTYWx0ZWRfX3BrPeAGrIwcr
 RQ4x6TzJM52PEk+i0n8dFsQXY9FeGTa1sb7W5IwWtLeB2GRnDD/9d49ePubiowkiFfCMEgh2fPL
 qLxrHiMc2SPPb+Ualr3/jLU3nUx5Df2CoImCm2Rm4s1/ZyB5Uz7AxoHBLL3N55wVDIN6L555X9l
 VvKmT83U72xfOM7mPOQ7D/5atjFRLFKmGGaakZhngVQKgOkiWXMCY1HxcAAw891TfXLFZVJNNYs
 q2F8ZGSZIalK6LRMHWgTgbeeQR/OlJVZl/n0pyHhuUtS+9UvqtNrOiQ4Pw3IVIRQfluiHuKn9x7
 rrFSRdD8GouealDCiQ1/9aR8cwM0C1/U68S/gjUVS4+EU/cnBIzyIIlj8Wz3hY=
X-Proofpoint-GUID: XCzULpa5bVBpzTchx7v9ng_Z9iYkJjrF
X-Proofpoint-ORIG-GUID: XCzULpa5bVBpzTchx7v9ng_Z9iYkJjrF
X-Proofpoint-Spam-Reason: safe

On Tue, Sep 09, 2025 at 09:42:20AM +0800, Liao, Bard wrote:
> On 9/8/2025 10:43 PM, Charles Keepax wrote:
> > On Mon, Sep 08, 2025 at 01:56:57PM +0100, Charles Keepax wrote:
> >> On Mon, Sep 08, 2025 at 06:27:40PM +0800, Liao, Bard wrote:
> >>> On 9/5/2025 10:31 PM, Charles Keepax wrote:
> >>>> -int sdca_irq_data_populate(struct snd_soc_component *component,
> >>>> +int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
> >>>> +			   struct snd_soc_component *component,
> >>>>  			   struct sdca_function_data *function,
> >>>>  			   struct sdca_entity *entity,
> >>>>  			   struct sdca_control *control,
> >>>>  			   struct sdca_interrupt *interrupt)
> >>>>  {
> >>>> -	struct device *dev = component->dev;
> >>>
> >>> Previously, we assume 'component' will never be null.
> >>>
> >>>>  	const char *name;
> >>>>  
> >>>> +	if (!dev && component)
> >>>
> >>> But now we test 'component'. If we don't assume 'component' is not null
> >>> any more, we could test 'component' at the very beginning of this function.
> >>
> >> Good spot, that was missed when moving from an older version of
> >> the code. I will get that fixed up.
> > 
> > Apologies I had slightly misinterpretted this, and thought you
> > meant we were dereferencing component before testing it in
> > sdca_irq_data_populate, but we arn't.
> 
> No, my question is about whether component can be NULL.

The expectation would be component can not be NULL in
sdca_irq_populate(), but it could be NULL inside
sdca_irq_data_populate(), if called from somewhere else.

> Understood. I had the question because the change below.
> 
> +	interrupt->dev = dev;
> +	if (!regmap && component)
> +		interrupt->function_regmap = component->regmap;
> +	else
> +		interrupt->function_regmap = regmap;
> 
> If both regmap and component are null, the interrupt->function_regmap
> will be NULL. Is it valid?

Ok... yeah I see. I guess it depends on the IRQ handler that
ultimately gets registered. In most cases I would expect the
handler to need a regmap, however, we don't really validate
any of the data that is purely for the handler. For example we
don't validate function/entity/control either, we check dev for
NULL because it is used for devm allocation of the name string,
not because it is data for the handler. I think doing it this
way saves us making assumptions, once we start doing so we start
to constraint what can be done through the API.

Thanks,
Charles
