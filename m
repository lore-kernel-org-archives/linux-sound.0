Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCFC1E98E3
	for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831731; cv=fail; b=c+ibny3xlUwtDXMPiA+158pExrJQD8xYQC0iPjFPjEFHp/rlKqFE+Yroo3KqvMBdR8ALBZWmwAnRPSqji9tU5gZVv/VswO4pRJc+YtDNmhv7r27HizOxt7XxY4eZOd7O47EllFM+Wx5Vdue+iwbpSOzrrTgL7iMYzSFqwCkniaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831731; c=relaxed/simple;
	bh=1kRW1EkSCy9zvbE3ArFbeZ3Cgo/+1vgbLa8Aa1jSlHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQ3YpjgxsVNeaHY7iDvyqsTqRwiZCriIUlXI7f0kYT+tDoQrRr94tG90IcUmVcH3se2yYnQ3U1SQ0OdASMECK1ApF8IoFIomyyspo42K77d4xqVcZVxIhspSdM086kNO0sp3jihUvcTS8iG+iCRWzT8TeRxnGw9n+KLIkT3xdPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GWZa2FIV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kMPQtLwz; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GWZa2FIV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kMPQtLwz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I4qjvN020806;
	Fri, 18 Jul 2025 04:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=+DJDCPU82s+UVuUnyJ
	Wg0fj2C8crQDLJwQlO46AOiLA=; b=GWZa2FIVPlJfEgFVQj6GWmQOgooRCjFW1q
	qPJksztr54SFfRy4MZy69tXRklsx47Za21Z78Xw3wwdCHSTnsWbiM/OWL2LrwL0t
	6VJI2FK0BWb7WgDi9boRLIUXq6+gPOumaPh4JTEBUmZNB3I8AoWXti5tU+7WtmoZ
	k28fgeSaQrTix8w5m7ijKyhP25VCF48m0ZixCSbjgVTzEDBYWOY27z+jAaJPgw2i
	LNaykvlI5/H+OfdmY/cGuTmbL6ItSExJeyZyYaonaN9gofLnM/RUoILFShsSFeAz
	5EuqjZ0iv1oRaynDtOlGSDHmxWNnEegk87UcMilQsA8dJYU9eNoQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2134.outbound.protection.outlook.com [40.107.237.134])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47xqstt604-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 04:42:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wayvlmWmCnvTzwDKM9Kn9WEhDnYcLogr9al8v13JEfyrrlDnX/0Ci8cGrAtqIS6+QCKwXjyr2aMvgBl75f9okw9bVxntn5zfvkEaACUDD3Bc7tpZv7IfXiSLZ+zXFQPloK+8l+LIZvQObMwy6RxQkn3EybLmm/rny2SSqxgMp/YdfQcTiQCR9/AYX+BU/Sxr7UceM9PoqyoVFG9ghpguv3EXf6ywrsdGxNAO2/nLcTR8ezYlaxYQoMhRdrB4PMUzCUpC+0rytLqR8Paq652vzC6KjPno8MvFzNb3FCz1EHBBeJ2pshaBk2K29UtzExjRQ/cxV94ibIHqMWdQXgupVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DJDCPU82s+UVuUnyJWg0fj2C8crQDLJwQlO46AOiLA=;
 b=kF53NDi45TuSZ/6PQBhHqsUyofzewSEQhAlnK5qVJyQqsDsGbEFvEmk7O64Vvf9eBTDRZDAtkDTuNI5ZiD6WU4NRO9SP0Zx+yTZOy3fsyZdPfEbSv8r4MVDcYNhHW5byI0UtzQfLRP1pyc1Qu6j7eX8KQNVZFf7tePsIFW06ZKk6WsWzCvJovoDQXM/ffLJYGhBD+SRZFV/iGvpZBQj9RBHJrCYMfhIDd3Tqb6gvYwdRvuedVU7gyhOouBQpET8kGBnQM0Mgw6dRHbC2jB2ZD26U2YpSbjshnPqjnL/48CasAQCBSm3/otX3OlkUlot0AVBHEfWoDB+ZzIeIGxLd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=suse.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DJDCPU82s+UVuUnyJWg0fj2C8crQDLJwQlO46AOiLA=;
 b=kMPQtLwzUQJPvEQfhQkdbF1rT5BKnIB+36AurvRNEhOdN1vk98YUem5LACcjFx/ZzfmtuH7V3wReFS94ScgdGaEg0t103tUl/H1MvDoY0xaa1VwUoWfih2aGpVrqfXDJJ0gM88IEEweHX2YF9FgF35yYklwz5CPUWE/CjCNHnns=
Received: from DM6PR02CA0072.namprd02.prod.outlook.com (2603:10b6:5:177::49)
 by SA6PR19MB8802.namprd19.prod.outlook.com (2603:10b6:806:41c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.26; Fri, 18 Jul
 2025 09:42:01 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:177:cafe::e7) by DM6PR02CA0072.outlook.office365.com
 (2603:10b6:5:177::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 09:42:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Fri, 18 Jul 2025 09:42:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 302B6406541;
	Fri, 18 Jul 2025 09:41:59 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 182B6820249;
	Fri, 18 Jul 2025 09:41:59 +0000 (UTC)
Date: Fri, 18 Jul 2025 10:41:58 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 058/103] ALSA: cs5535audio: Use safer strscpy() instead
 of strcpy()
Message-ID: <aHoW5jYuEEZd3Abl@opensource.cirrus.com>
References: <20250710100727.22653-1-tiwai@suse.de>
 <20250710100727.22653-59-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710100727.22653-59-tiwai@suse.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|SA6PR19MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 418ef913-2fab-40ec-2a8d-08ddc5df5874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SQca5L+NwNJfEb9m+1bFULrGaryq8DuIzxN9TpYMBhaH0sMgloJMieWvAXiL?=
 =?us-ascii?Q?yKKOmJ+VzuMQ5UIeU2akaLwvExC6NzyrGgobSNU89HVh4/qTMzMgHpI4eEuy?=
 =?us-ascii?Q?3NQN0LvIDA6yE91VR/zZY4ynaqH9OC4FijU3mQiqMBW330KLvVCn5UlKRWUn?=
 =?us-ascii?Q?WZDj/NQIZCjr8jg51l9Bpehz++3DZiiH7RQpaZpCKepUDyD6vC3qZgA9S2aI?=
 =?us-ascii?Q?fTHze6/PDkkLG0mkJcPH6MXYXkl4MG+bBg5WAG8EVTd9FSSGVxY8KK1x1Hla?=
 =?us-ascii?Q?A+G+bYeNgyqY54R5EbmWPgs1ynuyqLWn+Gu0LcSozxI03yqIyVoqsmD67r0R?=
 =?us-ascii?Q?0mcHsoKYs2H0+jYPus04wHY4tMj/Wl3mcO9QQNpVlHLmYBEo3uFtOxQ7uOY5?=
 =?us-ascii?Q?qvZjhGXm+HUgB0uPPAvZujW+39dMS05NkOzE0Jus8aoCWIDYN9kY9iDdjNBW?=
 =?us-ascii?Q?2IZT0+wlAODETerL4bKfoTIRBY8/EisE/nZSxNVifT3fyPAnnZGBYL/HwLNB?=
 =?us-ascii?Q?1H9NQoprqsBm6WkCNqdiyIvoBjFpt/19/IL8q2IBhlVnDj16G0algOQMzKZw?=
 =?us-ascii?Q?rP2ZHxzGdlQzqkZR9974Qp7EJtWl4L4YoXVbiPnGm4VSjq7TjfciZOhzIzw6?=
 =?us-ascii?Q?C8AYpbg/BJY3dPf9LFDmSGTSY76+1EDowdQSU1GQW80JZgCr1bgGlzuJphrE?=
 =?us-ascii?Q?gNP7PTymvcYRR1IqwI6EPI3UPQup7PZVlOJePnETDzTAkJG/93AFtHXVfbB6?=
 =?us-ascii?Q?61qH4zNeaEOPfSBvS+i21dBLlDineMcdqCF33T8tiMpgDN257STdEqW8t+Rr?=
 =?us-ascii?Q?c0f6B92uCKrNUl9+MCQsPAZq90UEb8coYO5+33P2TyjEwbzZgtJqZYBslhQ8?=
 =?us-ascii?Q?YWfF6Y1QYrapJxAkbxTi1n+2sxDINrJI1OiW7I1zt7LFB9CzoYw+5qei4KBE?=
 =?us-ascii?Q?GS+fgVahtslRHa3Szb+Syb2jbfHUMRjmRVkLFTFMngbiZLNAc6DdJK7AgJps?=
 =?us-ascii?Q?eaKe8pJu7VFNVx0PGyuR+RuZIyo3mEPH58Q8e+g4/BRUFBSKBr16GGILULWN?=
 =?us-ascii?Q?V6g6BRBjeEJHArTF3ivMRW/x+g37sk83A3jSDUTNYdCdQ0mOYVP300Eu921r?=
 =?us-ascii?Q?FK8qLrhPexutiIhN5S+826cG0LBjob9Y9QqhjfaNhpiysk+Gnz5ll7Wg4Slc?=
 =?us-ascii?Q?jwtJtCBAQepWEeUD+qa3kHm1ulKtoN940lJV5mmlm5FTHpW7VID0Qfu7Lxbi?=
 =?us-ascii?Q?GN4OSAzMnoXnBTzpWPB/As6CblqPmYj0JeLwdK00rH1GG/miqqiuZGFch4tX?=
 =?us-ascii?Q?14DbGGqdC2P/86yXX/1zT06u9rqBs9F8IjgH8MPNttIs1V4QqW9JlB50ljmO?=
 =?us-ascii?Q?VhKNAjmu/ldu+BC6QFu8+I1+vNgyV1Wn41Nwv4Rc74dRA025L+rzQLdYCMEB?=
 =?us-ascii?Q?IPpwCHjaiJ8JRSO1NG0IcHy13UVnV6Q/4M7x6GYDYKOYfTnvp7nwwu8U/K4A?=
 =?us-ascii?Q?WNbIGzTMeQlf3hSc0IWSgfPTDPjTPkCCje1N?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:42:00.6071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 418ef913-2fab-40ec-2a8d-08ddc5df5874
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8802
X-Proofpoint-GUID: X6OAb-99ooXnKkMRhpx979ERo-ncMOzk
X-Proofpoint-ORIG-GUID: X6OAb-99ooXnKkMRhpx979ERo-ncMOzk
X-Authority-Analysis: v=2.4 cv=C5vpyRP+ c=1 sm=1 tr=0 ts=687a16ed cx=c_pps a=pY245xTeqmh+jIDTRgos9w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=xpKaoQlV9wSQHpw91qYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAxNCBTYWx0ZWRfX0k/yd6Rp6uOn L96VRrhGBOV1f4jA3BROD3tn27YPCDkHoHIsHW7enYTHIrIEdShob+ORD/Zam+54ABtO4lbi1kt +xooM1kDMiJSud/X+jog/NYQP9U/HIJnVC93zPMDDmrMKFo3t46l/5O5K1XMtIwEDa7NBCm++ZL
 G4INyqTiscyHZrYB9PLI77nwC6yys/z00bSvNSqcoj6fg+qmOQWxP5lO/atXb4E6wlCv6Tvhq5O vztOJW/q1mWOh5Txi7ZM1xNGS4xhgzs8oDugwvS1RagL3n3jDdF1KHfqNIofj7HxxTsDwfL7to/ V5aS/q0pFRtqiRwjGPRiBP7a9+5mcDh7VQefDqsE93boYIMPHW2+/vjcCyiUjf4c4mGbXrnFHVY tB9GPrkb
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 10, 2025 at 12:06:40PM +0200, Takashi Iwai wrote:
> Use a safer function strscpy() instead of strcpy() for copying to
> arrays.
> 
> Only idiomatic code replacement, and no functional changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
