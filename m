Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3A53CBE66;
	Wed,  6 May 2026 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056042; cv=fail; b=TUZ16sxtkCvtwQjV4PPG76pPvuDBIzeANuf3F0mwFqTEwJwwJl5qgd6tWUSUBoKxZJM7ELk/NmRpnB/aoH5ySrHVTsYUK0lEi9G5iLoN5478DXA/05kWBzMRhk9vQ0AaYItvrWUwZpAoSHi5Pdj1R4mID3qW97+KgOrjDTQsiac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056042; c=relaxed/simple;
	bh=Q/Ou1KiKt47e1bB+flNbHZiHDd+dV074Ncy9LeBO2po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPwGjEUipK29WfF/fCDepA7ym8FWBUAsrEj/nA2C9zHW6jDi5zpGJI6cmbmbj+midEV/tX3ZdnUliPVVe0aqDzZp7NLlv/XaPbeLBHg5lnXIImINha4BkjrEJiIJr+S2CMM5qMNOnY0QvCS+b9n3NQJ+v8ucpY3IdYAqM0KtgvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lDLOnLKT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KckJgpeL; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lDLOnLKT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KckJgpeL"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466wLrC424261;
	Wed, 6 May 2026 03:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=SnGRKYwgE3cudk0OxT
	xq5iBUKqP5q6Cm0vnJQ1qBttQ=; b=lDLOnLKTa6kfXavjxETEFOFXsJ4Dl7pK6p
	lOpCGmQidb+MPL3pxGcRzaJ0P/ktzbL3geb3adFwuJ2sV6+zb0OgrsS2pYM0U9sr
	dG+0ffu0lA+6cdXSHDl7Fn3kxmj0by9mUGB1g29N2QzaCLfpoYmPrOgeB5FEIyQR
	9z3votSfdvMg0ftt0ktnxBlvTMoQyHxTsR4YfcrFeh+9heI9oGaFbGqpzfWkVGCj
	BUv8hnjoYskT3m0Xny+T7H1+WZmnZbOHeUzRYiXiCEgaVF4E9tMgA7llowX/ysgN
	+fJ23I10RYm25OS58bAVVuIEOaTATBNi2y3ZS0+wUk7TKe8vhX+A==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020130.outbound.protection.outlook.com [40.93.198.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0vugj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 03:26:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPSWumPBeGrfphdXEI1+ubNDPQg+AdT6XpmC+zGld7C3P5ADwIpbArQvc0wyvl+ooMlF/IDK9VuNO92TrWuZ6UU7+Mu+pxihuv/2XvWL7+3drri5nz/gec5Czu8r6iLgRTDw8l6ncaTzSgC06BlUXi5UCSnyTBuvWKFVa+qfT2PVh06q9GGDg5neHlt9dAGpoKZGj9584qCWVy7r6Se6nl56TD8+OdbIB2PtTbgI8GUAv2MUoo7wmZ71VusiBBop7jtl1fXQkdoTAtU3AUt9tMnlv8lN7N4SyETDerlaplFBPBZkI96AyPSorejaWlAgRuorRBE2O78ngp4KOkAmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnGRKYwgE3cudk0OxTxq5iBUKqP5q6Cm0vnJQ1qBttQ=;
 b=Je394ZRkRQOHFwm7YJ1WlKzxUkWxPZFH3XLnyzE6ayU6WLWZ2MVUgnACJjpTR5sxlvPbzTxNkgSH89B6LbQ+HM4p9tRChenUC5vzc10JqihHXkoTlf9bXP97deL8ch8REUmVzAw3ZJcqnDSque1Wgwsz/9AizaYOax0D2EpX55ZVxzJpQZh6qACVwke/U9M2/bZqPc5tCBhjSQktED2VOb4Ztm38m28ivAWOKW8BVUd1gMYHk11U6qB3TtRrizkeGbxuORYRJmTmPLfM6EJiRtdcyAWTaKgzC/SiSJbRnFPtFoCGGU5R5u5373WojqPPtC7y8AvOy5rh/ssH3PyEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnGRKYwgE3cudk0OxTxq5iBUKqP5q6Cm0vnJQ1qBttQ=;
 b=KckJgpeLuBWGbaFS0sNt6m1niaZnchGCRu8ufUTcK7Erjts4y4k3Pux6qIjGeY39Rgzqu8AiIWuhPJtpi4AEhlxYQ0Iebv5a6wzV4SJDhwzEicTLG0NruGoY/5HjggvS1ncU7wobfZSkl9lmHpgBhzJf1xoM1l4kAw8wpQEXXMk=
Received: from CY5P221CA0054.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::25) by
 CO6PR19MB4788.namprd19.prod.outlook.com (2603:10b6:5:34a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Wed, 6 May 2026 08:26:50 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:930:4:cafe::ab) by CY5P221CA0054.outlook.office365.com
 (2603:10b6:930:4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 08:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 08:26:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 212A340654A;
	Wed,  6 May 2026 08:26:48 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0A06B820244;
	Wed,  6 May 2026 08:26:48 +0000 (UTC)
Date: Wed, 6 May 2026 09:26:46 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 02/17] ASoC: cs42l42: Use new SoundWire enumeration helper
Message-ID: <afr7Rmyc1XdhLU+Z@opensource.cirrus.com>
References: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
 <20260505164807.4108684-3-ckeepax@opensource.cirrus.com>
 <afqHw42Vcq-mPSFg@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afqHw42Vcq-mPSFg@sirena.co.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|CO6PR19MB4788:EE_
X-MS-Office365-Filtering-Correlation-Id: ead83d10-b02b-49e8-4d66-08deab493800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|61400799027|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ABG5lgD5P2ZLmb37D0pkhmCwC31snTKidfkH4zJ4w45sbtQa+17hnEBVTNqChzrNr3utyKngj9oybJKuVT5amBk+W1JvKFUEE9sRd+BRzzbZ0W3Vx7J5wkrXOmrcduWSshMjw36zklTbN91QpsQSrxsRLFR62i/0h+3N3KNPc/b96h0n0kug6TNwgv8cEwsFypoNmmwVeSJtjmpyu270T8KQUPRNqejOZ1UsVZtdIP3wOKcCl0msIUNT/F5Cz5zb4W4h6fmR1cesRHulZTPcqW1u0aSrLFOzlM+sgrNbb3zcX/dW5po/1+AgRVKZlAvcZX0h/P1y9oEYM5FxiED/n4fX0mTjxhXr9rjWqP4iMfqJnSeAZt3j+t8LFeLMtcp6zaDaDENr7JNMKmbGqS6P2W42/Z5kVFry+J0XAeuL/xe1NxXSxILGWbjOJVHE0VFpdwy+yeDGsXrqDeZE8Su6tcoQ01XQk/EJCeRV/9dnGqp9eePWMXR0+hdzPDDRpof643TcmtzFyQblJM466HtYjkJpYYmcJsujWvT1ueUo7AaB2VQJIiwghgOdkLgERcW0n1FtwaVShtN6oFybZdVCdwF+yMWZoT5sdEJzw+zqkncbV/2ZDewl2hpZObV+hAyLqSwcX2w4jwuGmlXLyznDZ8kJhlB/KgFwSF2th6y7uWU1sEQ7QB6dOAfASN0/v6Voq+yGlFBRlrIjm3dQz071ucxph+Dg44QHYfgE1UCN5Pk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(61400799027)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7h/FtEiSxM39qdtOdbWZah1qpJgxwB9gOPKa16ieGsTm0d2EiBELNAqdUiunKEMdOz+hDQH1QnCwIROnsX3CU3b7vYjCSred7BXg3RWe6yUwuMQ8jtTmT/VAhSeDHkh40otXgWyvreOtWT9u1ta1fZ51NLT07WxXsTj7idDc2ccj34+YHDepUzXQGSHH0cum9z/6LHiHeCes6oUnVklc/VhP5pcxVxVZxv4gMp+XXB1w+VOxZN1K8lnyzOI09KiYtD7QKsa2npA2wrkjCJCROvuZU7q2LEm1q/Y0pw5wIMlXNz36v21u39Oq0NLM5cKEX7PqVIv1EH4C5jShlCIcdOx8khTUkZffq49cVtM5Z+tKZ1Taz4HgHDeofaXBaFSkeC2ohqXIN1taeeY7FwcY1FIGhCzXjLVAQ+5ZAq9jFVkXthNrhRDLvmrx3IoMGc9E
X-Exchange-RoutingPolicyChecked:
	flwa8D6WG16JQ8n2PjZEcKhUhiN4O/5+9TTsQHxMTAP4djvrvEM5ShdziIxOBKRBHnSJKJf5B6k+Wvjjh60znYLfOvV842KEVvTHkHAS7flLtZnjKtkqslKIbKBnVysa/PGBGVB8IAJ9RpgjQCvXgGc6QF+AAZtVnrL2PN1GDpE1X0ZLRz0/H1S+DSOQs8oA0vlNm1HDZVNtOx6Zjq6fYhE2pIj55rlYv45+rEIrwEiNehH9FXEMSdKPAxfpU3oSIhEXCcW/W7TnuD1ne6YrqVQICLqTkhrxVRH2HuanaQIa4pqihcqtswMlElUl8c3nGIYs6yzYcml/WzeL69Q2+Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:26:49.1337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ead83d10-b02b-49e8-4d66-08deab493800
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB4788
X-Proofpoint-ORIG-GUID: s1tNtgBEn7YR8oxMAymQu2rTjGBOMwJp
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fafb4d cx=c_pps
 a=MBb0aTAfGfB4Hxob/sbgZg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=Sq9S73vtxh365nyIITMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4MSBTYWx0ZWRfX4LktG3Fq+hYu
 kdwgJIjLEqRwazJqYX10qZDYUZD2vgJo7cBmMNdfkIp6pA622OuM6wS4XqXbDnm9CBKiY7R35wh
 J7mSt1XyZxSOtBdFW2R9ZfZkxPE17kXF0AxmWgOCz/hwkIbutG/sz8d+X1kX1DbmUUyFiRZ3jsm
 04kxLbGGtzLkU0LCyJYwoZCxT7znbHdVbb0gAnQ7u00fN13ZvlprMfcT47IJfn8tsSZMLO9tYfV
 1Hhw2Ni9X0t5HEeRDEW7nf7LUr1mahJZXfX5fgp2QbD/bXS3k6XUDc62MAvxVwoeyRoXzVHe/jl
 Lj+IjBdSW76tR8kzIcREQd+AHKmbrbmGePYJBkquUW0ohTUS4zYBl9Ns82XL3nwwMi8spkpDpXp
 rxAGryLN7Myl99qI+iSIAt6CccwVcOYptDBH/5tl/pRmmN33vDW9SyWYgThsfsOk4YlH/Oo+svo
 nJLXXCryh3lBJMU7ugg==
X-Proofpoint-GUID: s1tNtgBEn7YR8oxMAymQu2rTjGBOMwJp
X-Proofpoint-Spam-Reason: safe

On Wed, May 06, 2026 at 09:13:55AM +0900, Mark Brown wrote:
> On Tue, May 05, 2026 at 05:47:52PM +0100, Charles Keepax wrote:
> > Update the driver to use the new core helper that waits for the device
> > to enumerate on SoundWire and be initialised by the SoundWire core.
> 
> >  static int cs42l42_sdw_handle_unattach(struct cs42l42_private *cs42l42)
> >  {
> 
> > -	if (!peripheral->unattach_request)
> > -		return 0;
> 
> ...
> 
> >  
> >  	/*
> >  	 * After a bus reset there must be a reconfiguration reset to
> 
> We now always fall through to this block of code instead of exiting
> early if the device wasn't actually reset, the new helper doesn't
> distinguish between no reset and successfully waited for reset.

Thanks will give a couple days for any other comments then do a
spin.

Thanks,
Charles
