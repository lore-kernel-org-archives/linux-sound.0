Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A174338AC8C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092530; cv=fail; b=E2O7gSqqqj1yNU86pcSpSOk8i0kC71Ohx1A2GosGIExQYHA3JTpuCQDAyxj6PfL1EPlGwmLTb4n5tqGG8XFpdbe5Kr6ivx/NhKmKXO2BcLomkbfMpKwG/qjvRtlfaORLrcUtqwxEiRD234mnErXjqlYTOY2ZDYjn66+Ulj4q3jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092530; c=relaxed/simple;
	bh=HNTCYQx9l9YBphPVsx/TvvqAiBebgDmMM1xeFsKoG/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNrpZZg2zlVbbfgBf2HufyqpudBkrIOPm4nv5tJInJ63oT2boeX62oyHQIcHaH8E9jUSGJfpcAsNsypfbfshHX4WnjS6lG7hIXAVWvqFglZo4/kuhU7d+jb5LXes59bsthCAx885iLEtbxunWmYnFRJKstJhEiSOYYZu0DAnH+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=juqhDNHR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bsokxGIa; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="juqhDNHR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bsokxGIa"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6773mkiU3839969;
	Fri, 7 Aug 2026 03:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=NfgIY2QqWdHuMK9DC7
	rAV5vXIq+4g67X0Fo9wsdPuAM=; b=juqhDNHRNelUCf3RMDOwgujR/v+3U0dnpu
	fkiuZhyjMq83XvtnNh2BfJWCDjhgWdxsaWqBhZpbt2Vz5+hDnHzZJYCh7iFhR1WU
	KzDRBQch0MWv86ottjUszAUmjckb06/wbEac5twAF6mCLyXedBpKynwu6vFPCe8w
	5Pz5JfkJtP5IqhlNWmCouLs++uvjB0XImmEjZnJ7OOiYaRq9wxqYiHIUt7E51nGj
	mmjlj58+IyHXgZRJ+lttP3YxPOTu52T5Ee8l5+ejC19FwjRVZX+az9ROG+gtub6/
	pqapw8fR59wzIMcBiei1Vi5pRm7L9A7Te17ca3finnVI4H7tRxXQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021120.outbound.protection.outlook.com [52.101.62.120])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fvxu69a5v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 03:48:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MysQjdjohpqG2Z6bQthhBaxHmAV7YIZgrLOlEJQPbzl/tHzWbpZKE/KvXjw8D0Bx+CvqN71LQB/eMLrdhzTmB41YJRDMQueDEbBRYC92peLoraf2pq2MBWZHn9wYlD7AaSykIJ34RAlTNamsYZ55D72DnNyqLNRQFvtuob3J04lYYS2iXx9QA9ZQ3KSZc5jEpgGN3bbEyv66EoyQPJ04qMPDNjVfvl8GbzQDBT+8Ztdm72jOe0xxgIXYQJAmhxyB8URxuvGKe1+OjwdJW/v62tliqBBpSm6mg+9ihuQFmkyBYoAkyvVH7m3Oh31hZN51XXcSWB2Xo5kRgzgUBn/eEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfgIY2QqWdHuMK9DC7rAV5vXIq+4g67X0Fo9wsdPuAM=;
 b=OPlDGLItI6NKX+DXrab2fnyWo1Y1wb31goVMbYs8+38jBD0YzVO0hX56SwjgwXC1lZJZ23DCBTFZIiRcTMLdD2Sie/oMIg8+NicGNdUQ5621HU3J0Agi7NoXGK9ItC/kLu1uo4d9y1DhsW6lEMIUemGL38nwn6g7Jrq7vwrt6YuiBcM1vYM22/fCNMrILOiNKgcDfxIXd+9wbvnwuuTSSvXEAbupOv/AtWndNnHXFBjwQD/98l/gWBDbCEj4UNVhqWtRUz468630uZuTCC5ioOg3An/zQOgoh5ZnEU2j+phRl6zAnd+IxQpOiLcRHqrU8jkFlUmnqj/LSKYqdA/+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfgIY2QqWdHuMK9DC7rAV5vXIq+4g67X0Fo9wsdPuAM=;
 b=bsokxGIaEoLJOjRfia9k+CS0G/FiGjHdJVP5iWHxP/XkEbv7Fb/FKTq/odafwc5sVkhSJHBDm3ao4mM1iocRTJZsKBVk0smlZ5DL0aOakVoSqBMs/wkPBGBL7KlSy9Hv1eIltY/C88y+3giehcjLKTIM04DldsACOf6Wk9uEE1s=
Received: from SA0PR11CA0133.namprd11.prod.outlook.com (2603:10b6:806:131::18)
 by BY5PR19MB3827.namprd19.prod.outlook.com (2603:10b6:a03:225::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 08:48:30 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::73) by SA0PR11CA0133.outlook.office365.com
 (2603:10b6:806:131::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 08:48:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Fri, 7 Aug 2026 08:48:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2043A406544;
	Fri,  7 Aug 2026 08:48:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0B71582025A;
	Fri,  7 Aug 2026 08:48:28 +0000 (UTC)
Date: Fri, 7 Aug 2026 09:48:26 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 21/44] ASoC: codecs: lochnagar-sc: use
 .auto_selectable_formats
Message-ID: <anWb2knwZt76B6r5@opensource.cirrus.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
 <87cxvuu4uv.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cxvuu4uv.wl-kuninori.morimoto.gx@renesas.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|BY5PR19MB3827:EE_
X-MS-Office365-Filtering-Correlation-Id: d7de267b-aca6-4d21-b5f6-08def460a7a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|61400799027|82310400026|4143699003|56012099006|11063799006|10067099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UMYJKVhCxWMXMk2Amkt+MXyvDicSjK63/F1id4S1U7SoR52cmsdeKIk7Kn5MVt4FDM8wKfGNKQsadsuhU32KdOGJ+jGlP/i7uD8AfSI/rDtf25X1eG+BX1TOBIp+g6Arv3AqkxK0kGIi9HkHW4V1hYTJesxvCPquHJexZTElV6Ekmkn//gp6lK4vMe2QcLqPWPBJ/MgoMyU7qBppZEtpngD2qmzcVL9kCElFVnLzKjtODMBonU5msNe9rEGW4T44pITZR5t8vAr2LBhuqT494LW7mNjjpN6peCcx2kb2KIwnTK0KC8lFfHnELzBUBDfWTyY6OVqvabCEzUCYY0oNdshrRjdpN/2Iq5PE+UjsaRx/lZlBuzLnIsahqY+wf/JXd9Qz0nm9DKolaojzIWT3kw4mc46eqcGfyiLdJl87xL09zazTGB8deJJRGBIO26+KVDINMRP5RATt5B/PZ2GAcNkeyy0/ymbeu9VIek8x0wJuDG8zbc4/jT6HexDuGDizrSzmfxnnVofzslMwNB+an9XT7v9lF7AdV7Iu4MGYe6gzhvXAzdEcu6ptEBKDZBuoFyg6BEB/0X/YrjHaB+JouHy3Lf8U3QaojpbsAUOOF+KMniOiq2O2Gwbf8X8dJXaLaAlvmfBP21SWZy68ckMLrlrxyHZqSYM1xnSoR5S3LXFTI/XTkEH+rOtVfI63xOjD7rjMAKhK23WgYEtoCX9qBg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(61400799027)(82310400026)(4143699003)(56012099006)(11063799006)(10067099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QhXG9LD9nTXgkqkO7zT1Ysq1faSv64xhQi3Q8xOLkrI32LUimiT/7MAY2hGKjklqblwj04XkIYq2COm5jZ009jP6NeooRLAITvVhsyzFgLaQIf9BJecfIibQfgHIxrIWS09F+PCoB2BFPw5XJNMadn+glZsqMhhNJC4djziBDDWXm8efxIFO4ULAScy5XTbUqpd70fwGLTQcWioFJsuPOOJyHNydS7q3hT6sob0WKiyildV9oUEJKYmLajsn8ZcBrvQa+L0VoTMFAF/GKTSaLLmouYS0Y2En7/07WyrakajyGiUuG1fD6SD9oixuSQVzgUcCsPfEyRE3t1L6Ki6hjCgL8h1yD8K1hH6L/0nPjbHF9zzk2HU5gj0PFEWPsCc7d6xrPJ/bzRnPWyxR1I4SvpSVLgqyWSesz3lGbqExP/HAk3u1zTXuvj9vjVVG7ob8
X-Exchange-RoutingPolicyChecked:
	nB54KS1JbGqlT2mLYfzKK3rWK3VTq9U6PgqorAeYGdNzpb1haz8WCgQnr/FmkjRy39aodjt0j8COu7U1gaul6Sw3lhYMGIrB2f8W+ouZSRmcMXNjjh9/Uv4k7IubOC6t6eC2diq8IWAGCNvRnSe/UdNJFH8IwCAROCHwyHHmGXufHSC7dxbF4NMfOVqCtcS5vmS+W/GW6EQgqTdkA+pTC1hXMtBFiw6uqy/HwfqrVH47yDGYF4Tg5gW5XQfwpQa+ogwuPxI+nkNJLh1S0imKSTV2KgjBMvd/E9E/C/anuoyMdyqiQ8M+lyHe7QeTeDF7w8MhYXj+S96uZzPbG1iomA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 08:48:29.7198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7de267b-aca6-4d21-b5f6-08def460a7a6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3827
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NSBTYWx0ZWRfX9D2Biet2hVLn
 VYrHpYwdpOQPDFbHdgrZ0Vquw+xFUO52298Ndbm7chGkTnN2Iq6uXDQDujA9hyaGmPfSgbi2DBG
 2gi61mLuiInI9JSkHrVPcFHkPPhZ3V4=
X-Authority-Analysis: v=2.4 cv=JurBas4C c=1 sm=1 tr=0 ts=6a759be1 cx=c_pps
 a=mAqY+/86XVqNsXA081Qh+Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=yC-0_ovQAAAA:8 a=w1d2syhTAAAA:8 a=fCYEM5yUJuOXIdsSaJ8A:9 a=CjuIK1q_8ugA:10
 a=Ha9PRq4w45QA:10
X-Proofpoint-GUID: lbLCFTX7U0b6ftivIm0LcxKp_hjOQXo9
X-Proofpoint-ORIG-GUID: lbLCFTX7U0b6ftivIm0LcxKp_hjOQXo9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NSBTYWx0ZWRfX+i3T7HH+jOSF
 oStXbnHU2sskev2bkJhUWsmjuDin/qGpFAdnzk5eMUgwUZKtGTOvqYNoFSo/5hzjGoe0TR0zwK1
 hYcUTdL/J/q7FUS3YMHymqWOts3Ii+iSsEGYG6xfDW0T+pKy0/tXIUbxFgHHW3bQ2kPg0OWBJz+
 Q6o6lg/yb2/LMiPLvtXs+SuLGELm3kndcfZRuoDeC9UnsYoQinOZU8VX3YyXhpUH+bk3zI/OCfo
 NeSrONTD2Zyt5fGelawjC/YbI9khhcdTVOU0fh8dNoOwjFwg4fi06pVZFH2r+ChDb6amMorcfVo
 LPwGjt6Ors8XpvULQNJeB4Z158blT0xGG9J+1BHd5xu4p2xczkZmc7OnZgWo/ykUTeW7QYz7GGk
 hpOki6+aPQyPmVB6DZY42p2SSiightQVNwV5jpuZz4vCjFizXIlArKrmrfJsJpcjGY8VHqHekTf
 kG3l6yA1uCj7uJB0Xtg==
X-Proofpoint-Spam-Reason: safe

On Fri, Aug 07, 2026 at 12:55:04AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
