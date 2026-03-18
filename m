Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F123A962E;
	Wed, 18 Mar 2026 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826316; cv=fail; b=PSdXMH03dl2zg/zaWo4mz0Fp83V3wNydmLNBDDGAuXFQjBVL+TwWTHY9/ESN6fb5xPwTVEKhV4kVuxaSIJdlQAcmMDEK0RUK4a691T7AixTJDF9SVQ36eUFJXqQAYQwlOhQLyJD3L71K+PZ55Ar4BEZqLu1Qr3EG7J/Ew+RGoK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826316; c=relaxed/simple;
	bh=sIKr0/TfzCP04UFbRmloRD1pf3pJdMRFAR+njjeRZtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCya5QqW69Vr4Ms+hehouFlBW8+KyGO4AOxdtYEqXkX/LKg0dfThEYVGJKkJyhMz81iWZfVIstPAdbCzhOgyTe5R7bnP0D/RNSjn29GdaN3cITdaUt357Dn3mgKWVBh95vqa8yTERdJyN69vA0Ljko1N8TBj5xrcpuI7BEnb/cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S4eYS3Vz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bKSo086F; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S4eYS3Vz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bKSo086F"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6moTD1587983;
	Wed, 18 Mar 2026 04:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=elAhQEmg2TqPkVeQES
	MWmBaLjPLiiyC3RU1zKNDxrpg=; b=S4eYS3Vz0PkCrI+TnoparLNVyi1GybZW6G
	KHjNlRKqLfxugfzd3Y5hHCLiOjbx39x2D9DOyo6E7muLIgd0McaqHe8y7yo+Djj2
	Z2QkhtlDUSuLIRfD8m74O7xglf2CT4Y4VvQWpcvA29SsXClK7Vj+mOGv0DHDnAv1
	ALUFnfzo8lz8+ldv4AbMZjpHoqafQAEuD3bUBIQM9c0t3sM8j+GC01xN3rJVN+OJ
	7I3UKq1s3IVaujOVrNYek/8reARe3P9GoRjOrkW68zJmScwmA+cGw7nb9HUg0ZkU
	eqfjioRFVUhao7RISk2zVK4HIUKLfrsnv1mSrFpZmx6QTvN0gGZA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023100.outbound.protection.outlook.com [40.107.201.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cw52v504w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 04:31:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB6IlQpUFdUAoD7wHq2mprEE4uA7TT/rWFpV3a/6GR3/DS9nrQbcmp4ZsSTNGv0LwVLyACdD2TOXEZEbwrUExcBz1IKrN0+EQLmYKYuki+16TgF8pVtiKS4sPYpC0YmDCFagSQNZK/KSUjNOct7FXZNWRwxyxZU2Vy2ncxjpU9SVul2RjwjhKCELgpDW5quV9J9mmtxL1nvgd6RUCqrjTJhMSZI8JeL3ZMBkSiFXNdI8M8wAt32dnsVTFgTBrG1g8XrHwvyzFCUYuxbTnugM6rJRmGHBpVk6EcGrSYlqrZqmREPpGR20ZLOLTJ6Z8bE9d+5gwBJstmdLFvJRsZGjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elAhQEmg2TqPkVeQESMWmBaLjPLiiyC3RU1zKNDxrpg=;
 b=QmsilxZhOwFcu9zbsaac4BzVTsooJeobFmUV/0HwkZu9HohB6ypnknnkSgYC1CawduVqwOrCaiWlldD9mmo2w0SzqC2TPG9zZf9GiEbkkp9rGNGzpAovVOPOCqBjFH2mx2PFBJ/IskWZNnSgY+bbeO3+hP/Vhooa0piL+QrG1SgTEp2EdFFQcPb3tYboV03hPkOHMvzkeBQ3DJopINmAzBhVOxy+ODPA0dJAkqztfdqTg0K+L4yatv5K7Yfpk8+HIUalG9CFBTDVV6MKZpkS7G+w6A9nKwY66H/P1F3Tv/+9f2RZxbNLqLMkCGTq7nGhT+SuTNFJVzvn7Kr59CSj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elAhQEmg2TqPkVeQESMWmBaLjPLiiyC3RU1zKNDxrpg=;
 b=bKSo086FzvvQu+9TG+tbYbtxXXRE+bAMGDR2qY1KVDLhJxLcye4f83+7APzS3QWduElP7zoeQsCt8g2hNV+AkPCeuEWks/8qZm/1jSec0nroDr0lbbRrv7zV2W5UAi1pwem6QJ0fRyR+GXN80DFmk85l1wcDmaCwx0l1f93sQFQ=
Received: from MN0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:208:52f::23)
 by CO1PR19MB5160.namprd19.prod.outlook.com (2603:10b6:303:d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 09:31:44 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::6c) by MN0PR03CA0026.outlook.office365.com
 (2603:10b6:208:52f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 09:31:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Wed, 18 Mar 2026 09:31:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 10A9940654A;
	Wed, 18 Mar 2026 09:31:43 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ED9BE820247;
	Wed, 18 Mar 2026 09:31:42 +0000 (UTC)
Date: Wed, 18 Mar 2026 09:31:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 00/10] ASoC: wm_adsp: Some improvements to firmware file
 search
Message-ID: <abpw/f/3OPnjFW36@opensource.cirrus.com>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
 <70c45f75-7ccb-476b-8646-3896181a2569@sirena.org.uk>
 <e9fc894a-4183-4d22-a9d7-6ad05167abe0@sirena.org.uk>
 <abl4wZyYTJf1C4ml@opensource.cirrus.com>
 <abmTp0NcfyCjfdpv@opensource.cirrus.com>
 <b6c7d439-7c46-4c99-9213-30369f1dd443@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6c7d439-7c46-4c99-9213-30369f1dd443@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|CO1PR19MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b56fdb-5967-452b-72f1-08de84d12b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|18002099003|56012099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0xh1nUEGeaqJe/mAC2tTc/f+5lYT1G4IXJ1SS+Ryu/eeyTxCt4+9DySqFEFfVYj3cflnxsBOd4uPmk7eVULR+ROtifx2cYu5gCg++2w/4gtE8cCsQXinBKNrdSWY4BAiqE1Gr23qbMcdRyegFbhUN64vzWOfpDCtJ/WucnoWLjPiQE782Qpgrb7rOIovP38DfBozWc6G3DwXGWh/47/tLXz/dyC4U7pfzYDzGSvHLOj9XfTUTLJx7gUeobbzaHH9DffYEjlhGjthntHhTCXCo2Y5lL04FX7VaBXW6i+RQOWSLFxynZ9ZyMOEGnPQbB9RhnUs6NHM6EyPvQcBZ6DWEhw3ThRqQo9z2+f61cFNH7jl3DhZ4kX5bJmA+25aXa7jcXqqyvF8vg1hWeBCcfuFwL5/DBey27GlP/gtOPZfdFLti8OJ+HEvBVHgJA2JzYb5UL6fczVo94ZRQ+huG2crZtrrJgvpnpf9r33GQD6fr8dm6ZGBXlWA5Z1BRk+sOVeg/jYOwFn299hiQfUdVG41ieoJBLKy4sjDlv6vg3Kf8dcuDT3GHkm8pusDolNwfbHRLSVXqcrFUQJ5Uh/a7mLfqoS/lmJUw5muMomvcG7IhqDCBJAgdTy6JNA1rN8LmvWm72cv7lgwCm9NWfG+7OLySXWzM3G092knDfr8V6fz169TdtF5fekzmc2hK0NBvCSf0iyZmlISrRutod6F2YTYh1XLaCAhn2wks56NgdVgi3auIq4RAh5A5JV4AEEEwpLiHFZIK6a96mwAYbPXWAmDpQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(18002099003)(56012099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wiKS2U57oACwIOGzS9bEUtWXz3liNKGoPYtiCE85oZdA/wohGCrBCLmIMQkVOQtSMH4V0qSqo1y2j+5S68DhN8NyJ4eRNeSvEDtV5E/n8Ro1Sb9LWQ2yO16iTDwAou4b2+mIH+BITNIOoGHvcYdqfVHtwXqwLS8z8sbi0v4R4Imu5vAYsz6aJO6SiOuF1LT8tHos/LhpWREoOEioxHK4nSX2mYFn4IbWBpw3RZ6w2UaZeTwh3QAJhe/jncxVmIZYQBI8gi3B3g4RPFku/BIU59lNmavg1B6FH8N811nyZ7rxMMN1ChhbQzvUZqVbkmWis6oHgJJu0Ebb8cqHvOolppGS05pXxrdERPkJs8rOqXWv317lu2R4WcMQQXhq3ZYOl/1eoRVfjdrVLCQLK3yTZW0Z0y2rcGRJqo61Sef19fPJjleiGpNuhp78a0PSjDYG
X-Exchange-RoutingPolicyChecked:
	be9jJp7JNUlk/bR/QgF4BpWtz8uO5ZjwF3c82Zicy1SzIF74S6rvmjsgQy1hffDmBRB3XkoDnpWyxC4djo0joD6aDK05j3TqV+cd9dqGZU4sWHUzyE5PoVYe65gK8jqanty+RQ7HFoDYfXzoSAu2MkU+E5LAt1HRVE2ALUK75u7Q2XoucdNkZCzfdJkiqRZ8/l9G7eWY+A+MC7ZjxZ44DQEVFNCMne4DB76B3ZJASUGRF6bpdLQuTEX9KbCZ3GjiOhQotkF5rZ1DS47dk1wLxzvUqOr2ROfvfeHJ0i4JUxw+0wcnZ6GxhL3GZMDi8eOlQi7xQ2BHrRFkMUQQEkJ0pA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 09:31:43.9144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b56fdb-5967-452b-72f1-08de84d12b37
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5160
X-Proofpoint-GUID: MpCpcN5C0Um8XxraSF89_nk_WyusLu-Z
X-Authority-Analysis: v=2.4 cv=MpZfKmae c=1 sm=1 tr=0 ts=69ba7104 cx=c_pps
 a=8qNi12VDA0sjaHsBEHPY9A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=Y5fBYdVWvqd5RRpoibMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: MpCpcN5C0Um8XxraSF89_nk_WyusLu-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4MCBTYWx0ZWRfX+iSIXaPGuf8I
 7qrD7QnI6SIQ8GB3hOkkCdnKHaczBr3gS7N0zYoyGr9inJmPsKOT2OYxkL5dWEl49t29TyI4m/T
 bwTFdexP/R8hbdlD7Ld8rrnjJywldWu7b094WUKGzxcsRIIXjsQ4cagxsCOdfx/7md+eKNmaRRN
 kKaJoguTlDkm3hnGPVYIZWqVj33dVLuf3mLIACTLHx1NSLO0pgSZECbSwCiau4IlVFB7//LDZAG
 BAZ2Pmc7x/Yxjk4FgxcZMJjzJ+wgigH+s3MxKiyJRTouMR3fPPABqcyF06hafqG2i9kWEvdrUAV
 pVOH8AShp8kfPYfO5sCTxWdElSe1Rpn94zO6eKlt1Dp3qKUAykDaPiM1imEL1dknHM1zgim2ZQm
 mHOhEMwu3xyXqWjxktm/N4WFmn6GpxttBGGmwUqUraucGS2BUiwS0S4/JPSATRQeqztmdgmIsiK
 ibJe02E6o5OQnX/hzEg==
X-Proofpoint-Spam-Reason: safe

On Tue, Mar 17, 2026 at 06:11:23PM +0000, Mark Brown wrote:
> On Tue, Mar 17, 2026 at 05:47:19PM +0000, Charles Keepax wrote:
> 
> > The rabbit whole looks pretty deep on this one. As far as I can
> > see it fails adding the device because the device already exists
> > on the bus but this is the first time it added the device and also
> > I can find no evidence it even created a bus in the first place.
> > Feels like there is a large piece of my understanding of how
> > this is supposed to work that is missing. I think we might have
> > to wait for Richard to return on Monday, how much of a problem
> > is that from your end?
> 
> This is holding inclusion of any new ASoC code since last Thursday out
> of -next, that's pretty disruptive really.  It might be easiest to just
> drop the changes and let Richard resubmit when he gets back.

Ok I will have a bit more of a gander today and chat to the boss
here, but I suspect you are right we may have to revert the
change. I will report back by end of today if not sooner.

Thanks,
Charles
