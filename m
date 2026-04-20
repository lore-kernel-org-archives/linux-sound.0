Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21D3388E52;
	Mon, 20 Apr 2026 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681391; cv=fail; b=Qcp1S5W4np/EQBXsVPXZdfLw+I/OWbDcy5xRj6+ZvYOgfHzE3FIIf4rH/luGM2WWCZpSrdk7DOrK29jDTknvM4CMm73Vz5v0FEfvVXk8NDpkWb2HoVD2mF7wJQHeGuks2Fo0YZmEX//y6wGTF5Q7s02Ud0MoIhs2Y4nh3N/NtZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681391; c=relaxed/simple;
	bh=Dn976aFI+szTm+lxE1ddY+Rm4FEvC1X0D2zhqoeMYag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWe6AJpTBaWe7mGVY3minNl0fFvprCryveTBKYSqOS0We2/D1+XG2fQEmaW4Qo5hkLAoqxIfszkb7Wt4McrM0sDs6E3aM8eOc3mh4P3svTZEFXjb+GRrgcArOacKOJxJKhIFDbz8DpkBmZevBbcnphX0LB0Xy+056oShaERkXCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=f7/wne5Q; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BRCnF+Oy; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="f7/wne5Q";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BRCnF+Oy"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KATKxk2094113;
	Mon, 20 Apr 2026 05:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Zjyi4+U9V8JIHaQDvF
	qenB2yX8gDeAxvFHA/bFBRv1w=; b=f7/wne5QHw7l+3vDKqkJVYoeg7C/k//Hph
	kvPx7kp9ZtcxV5VZ8tmwzdWgnbpFMYG1EZ09CYip4EhSkoGsTpI8WNx5BISAcFhL
	YCZo2GSXCasZtKygZgSttCrXCwa80irm2q0BtXUrr98YM3OM7ycPHMu+chR5zfQD
	eWNfrkvkWy684nhEIxRfV5Z1rldZNgmPcxE3R1KTBa+D7QSzqnyT1TAlMZ/RH8Xh
	BYnkqZVZnjUDsbgsbfumyEotRmhK+C69kkM4ZQW7MiqfiTUzIyeL+9krUAGNFVWr
	6mJl2YyB9hSynxBSH/uOyI62qCGLHhq8y/BzkSvM5OwAwUgnodLA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021138.outbound.protection.outlook.com [52.101.62.138])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dm6cfjb8m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 05:35:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bG8nIiDSpvsTwp0WoWZMC6vOqZmMWtc6ZZhA9N4SnkugQn10MaWgMhSS1GRYemxmbXrJeME8tAM5u/iqJ9G1XWWTh3QX26SXRLjL2113k3oRAzpgs+iNR9ysGEJATKH8PT4VOQ8EZ6lYmiXAcUjvQLlFiipt+5ws4Z7+SyTaGeLtPfXH5dxDxIzaeyuqbk02mIiOKgjBoCTbVQFLr0phvIQooytpTE4brbf7ZXmnB3OhMTbavF4cs2OzFgfqihKfcBfK3v/FguJSIAcuJNxs3+w97KiAHksCnadXZDbt5A1vhUYm5Bz3rjbXhrnjP4RxaTlzmxRx/qIUqg5rDp0BgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zjyi4+U9V8JIHaQDvFqenB2yX8gDeAxvFHA/bFBRv1w=;
 b=rC8hRCirGNXb0HkdTB3S6nazA1aGlHr7GL/lOOQf6T+aI0b/n6jZekAPOEm7FAJOnHMUPtpD5VuXg+HzyUuDB0CPAouHzdMjWZUawXjR0xK5mm0JuIaffKudw+jAATDLjn2mVAKGZA2IKqeJgr1nMn0CFsUmrlM6uljToCIlCZysyn2CaNfOmNgNoB9McMhM0nWZ53c7KeGMzkf7C+jkrU8a6uwmDme5I6E5a8NveO2wbQvyzPJEUy5K1OLgT3IG6sD/GEfC7l5qCKpzEh+hRUABrx9YBOjGzPuwNd7jsfL9SrS2AfLwwtjIGdLEY5AXXbuO/iyRUn29/F8XG51B3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zjyi4+U9V8JIHaQDvFqenB2yX8gDeAxvFHA/bFBRv1w=;
 b=BRCnF+OyQ+x6i1+cQJuaJdwhzkmSKO+T+cvAG1tAqKqYaVbdRPVGG62xACu64sHg2aqwgyUvVWKqjDZ4K8SyvoJLXrIFSkq06hORXmrpsBvNOM0iXC93P69SUW7QnWIDtjyblkIBz0FOdTL19ZZjpHC3Na8LvkFDo99rg40eYmc=
Received: from SJ2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:a03:505::15)
 by DS0PR19MB7499.namprd19.prod.outlook.com (2603:10b6:8:14e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 10:35:48 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::f2) by SJ2PR07CA0013.outlook.office365.com
 (2603:10b6:a03:505::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 10:35:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 10:35:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 635C8406543;
	Mon, 20 Apr 2026 10:35:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 41FBD82024A;
	Mon, 20 Apr 2026 10:35:45 +0000 (UTC)
Date: Mon, 20 Apr 2026 11:35:44 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
        perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com,
        v-hampiholi@ti.com
Subject: Re: [PATCH v9 1/4] ASoC: SDCA: Add PDE verification reusable helper
Message-ID: <aeYBgE4JQiApVvRS@opensource.cirrus.com>
References: <20260417131401.3104-1-niranjan.hy@ti.com>
 <6b72e996-a2dd-445b-b145-82644a6df8eb@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b72e996-a2dd-445b-b145-82644a6df8eb@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|DS0PR19MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ddab0ed-c1ef-4e5b-2715-08de9ec895d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|61400799027|376014|16102099003|18096099003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oryYbh7G43ld6/6JVN7cMrYUHo4ypssoAed1uTrsPqXI3sIcJIcntPVInM/QsC3wXHPAXK1oMf8E01kUN2sd1kCUypgV7eVy9/YBw4As3FfQwuhWnNdJg1t3Ymlr4uVpt3WkO403DPohD7a8p9CsrZUQbcc8OfDrf19hBjVTi4/SUDA55eccyNyg2gAkQK+On9iMjYhh+geoy660g6aIN0PHm0N5/Hg5rbptXH6VqHKnH0Zi+zfn/X1JvopgY8k07pmHL0bE0C0trtiSB71DTwTfKl4xNcRBPiiZK8vhySKWksYSw3VYbTiBDkMriUtYWu/fJgyisSmZRsPZdMIIu/bhsK6BMMStr/aQHxwqE4UIDEcuBUFsVw4P0+UEEFMRnai4/HDNJ7KHp5Ak+1E54WJ3+9m+dmb4Zcq/hAGWxuaE2L7ZNLRHTdCylX9c8OVKzAb0VQU0AeXZR346OnUYsb8jNONmFIDHHKp77MY1iVB17EwbCW46RsLEeUyGkT6wJwrs68paz9nMJdnxcr1JfaVuR0DCEZ3Pz21uWeemLEcawlw4GsLCu5hn518KIbJ9jDcNukjnXMA2BCTpDZJzbhcfBlEJMSnEAWHSaUArG2RviOLj1fPbaIc5EYIzkR6Aiz3h2smGXJwh5u20xbCi6kD44aZn0aU3QRZzKXYc8EK0ROx3+MtB6sN8rBgOshXSFWD1SBFGkhG9LAUNXEqd2VNu71GbCq6nwpdSeKLs7zP3WPZYr/ny9wArL5/XCrSCME0Vutgh3WPnqCHCp24Hsw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(61400799027)(376014)(16102099003)(18096099003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zJd+eddGW7Izi4eCaNKW/jQoSlI8oJPPoFeFZ+zP+i/NX7WGHElzcAispbBfpB3hnQ/mJLNjGxKCrfG8Td9EPtDZculfa4va1qyoVgkZuGaRY6EXAFbWn0a1u3g2VKxFLICfTfqU/BtBZLSEY12BbM/KTiJRJdS5dvycLDWILTgs4UQUhvC+luwVL7elc5h74hx1yXXOlIaqNSUNyk2UdX/Y1FSp/QpBtfJL9bFsdgbRg/gd0DPawD2mbwtfLpgqa431kHronA3rGDWSR7xMMpzu4sH+PQ7ULtl4AsXdZWUzSlVOQN7w9cK/0We/Q7Tyoi5AOc3N69+n1Ng8Wx70fDt+RM8gB8hRsXr/VZJWgqTYnLDlBqjXPBMmqV91ebxcN4R9Vsi/hj3rhHP9p1qU8RX1xhxOWGE8Cofv05aBVryA7JZHUCZ1NTgJygLoht3P
X-Exchange-RoutingPolicyChecked:
	p4EOMGOCdS+syDz0HBha4ppJuzRVLQmPdyup3Ndpi/xEw4iucmrgA3blemVlYsjvgA71tij8DIOQoxS+GVQTojNmEcgZomhCOrknT17jtmfROCsN0jEEddAvB+wvmcdMKd5tVx/QDd0ddBVEmdu51YjGoKf+piPKpQoxtOlf5mKer93WpFHqkVEflAkMn2gNlP3LhsxBjeda3MxUob6JEIHAHF563okRbkoDCfl+uXhxnBFM0kh8yzumPIrmwssRSSLW45qAQnt8dfFP7vDhABBDPCDi6CPJyM1XQ4iluDfCp1bP+6dGGBABP4btTWKCRtLX+r2BbkUo3kAILwnYZw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:35:47.4148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddab0ed-c1ef-4e5b-2715-08de9ec895d2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7499
X-Authority-Analysis: v=2.4 cv=EdT4hvmC c=1 sm=1 tr=0 ts=69e60188 cx=c_pps
 a=td2I9qAig9HcJlooGYrYWQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=T5K4icZj-6yKMt-Tg-gA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: n3csz6jjOiqR58kKFX01eSOSnMVR-51L
X-Proofpoint-ORIG-GUID: n3csz6jjOiqR58kKFX01eSOSnMVR-51L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEwMyBTYWx0ZWRfX5yhf2FHPNUur
 bLRWm8ZCk9yM8L8X9AN0qFOILlgDvTID29otfXyaK4UyBK1aJLRNXABILpbP2rxovCi40MD9kfl
 FzCTHWk2hKgJsP8o51htLTj/I4mSXutQ7nWdWQaFR85RcDxuKffUpM0bW7q1+CuRA1EpNA+ZB1F
 j72XzOLN9Tw5N2hLX9v+BbXiXSvwxpCaKwpmxq52tAKnYUjg/ofx+mFb9IBl/08XY0KR0Q3wa9h
 uGpKtBNVu+kh9vpU83nG/T1QEA4UHV8FHb+7ODCb21i2HfTkugpCXXUI4v/qsO8Civ10P6mKn13
 57GbePqW+bb3x6HM4U7CoTD8IoODQSsc1gr16L8SZCJAY5a6a+X5wUKpOOk1QTFJ9DI7Fkey9Xc
 lpQ3FbFBoNiSiyHOgzG3DZ79PelrEEPq9gPOjcL1asjxBQ0wJT2H0HpXd9g+vUKyY54IFWIwoeI
 OGodDZKMDD1Da6J1zJA==
X-Proofpoint-Spam-Reason: safe

On Mon, Apr 20, 2026 at 11:49:00AM +0200, Pierre-Louis Bossart wrote:
> On 4/17/26 15:13, Niranjan H Y wrote:
> > + * This function implements the polling logic but does NOT modify the power state.
> > + * The caller is responsible for writing REQUESTED_PS before invoking this function.
> 
> Erm, why not dealing with the write to REQUESTED_PS in this
> helper? You have all the 'to' and 'from' information in the
> parameters.

I have no objections to moving that into the helper as well.

> > +	static const int polls = 100;
> > +	static const int default_poll_us = 1000;
> > +	unsigned int reg, val;
> > +	int i, poll_us = default_poll_us;
> > +	int ret;
> > +
> > +	if (pde_delays && num_delays > 0) {
> > +		for (i = 0; i < num_delays; i++) {
> > +			if (pde_delays[i].from_ps == from_ps && pde_delays[i].to_ps == to_ps) {
> > +				poll_us = pde_delays[i].us / polls;
> > +				break;
> > +			}
> > +		}
> > +	}
> > +
> > +	reg = SDW_SDCA_CTL(function_id, entity_id, SDCA_CTL_PDE_ACTUAL_PS, 0);
> > +
> > +	for (i = 0; i < polls; i++) {
> > +		if (i)
> > +			fsleep(poll_us);
> 
> This solution will loop for up to 100 times, and the sleep
> duration could be questionable.

The duration doesn't have to be precise here, as long as the
result is longer than the requested time everything is fine.

> Say for example you have a 10ms transition, do you really want
> to read ACTUAL_PS every 100us?

Quite potentially, I imagine it will be fairly common for parts
to change PS a lot faster than the actual timeouts they provide,
due to corner cases and people just being conservative in the
DisCo. So its quite possible something that says 10mS typically
switches in a couple 100uS.

> If the pde_delay is 1ms then a read every 10us makes no sense,
> the SoundWire command protocol would not be able to handle
> such reads.
> 
> A minimum threshold on poll_us would make sense IMHO.

I guess you do reach a point where the soundwire command makes
the delay effectively meaningless. What would you suggest for a
minimum? Something like 100uS feels kinda reasonable to me,
I would lean towards quite a small value here. Other options
might be to look at some sort of exponential back off, doing the
first few polls faster than later ones.

This is definitely one of those situations where SDCA is a little
too vague for its own good. But I would also say making a change
like this should at a minimum be a separate patch rather than
part of this one. And I am not convinced we need to block this
series on updating it, although if we just wanted to go with a
simple minimum that seems easy enough to add.

Thanks,
Charles
