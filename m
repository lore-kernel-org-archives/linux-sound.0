Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC6F1E98E3
	for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831695; cv=fail; b=YMwRou7R4OSROc/OdNc14JVQeAozTiUQy7P11ZWJX4QrAKjEgvpicCkL1wX71DbyIKFHNwXRVptMIzzEWG4DVkdwC4Y1ZC0fhkd8lVsTLHrg0B0GdyUULcNSh92La/Qtqvq1r/cjZfYco5QFP7vKYHkdYM6ACB04ZCHqByCbpzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831695; c=relaxed/simple;
	bh=vPbXUANgWV8bIdsBSpbWW39VX1p6sAwg+I90mIHkgxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orS/1oP5jLFHvrMxZOQ97bAJaMhC+SdLaDhKrR0B1vdcK1It2YXl27etGgm8VCzrpaHYoKVQwJ0sR9GfV96IVZur8tO/h/5l2ZWef7N32RLhbJnj2fZkXtWEdZG90Oxqdyi03Jt9drpb/tZcCH5IdeZnVFn5wmc7X/C9Fe7Yd0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cdSRq9FE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sgonZO7T; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cdSRq9FE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sgonZO7T"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I5Fj52020585;
	Fri, 18 Jul 2025 04:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=2LQ+Eljv3JTsN1gLhV
	5odD3E/gVZAKBnMTelxkKUlRU=; b=cdSRq9FE2HhsM4UM4ExlVAEap80IkdovMT
	LWwciMPnJz07o0C0VtFuiocffmacC3f7uNQ1hHpe6gjcn3dwqjWSa8Ix8wNO+kZI
	krH6LgPKf3CfcP2FdAZPxYvdJ6BGfpja4iXqMYjbR/VpMlScfoyXFkS2jCV22yFD
	mCznmIQzXwDBNF1O58LX63YPR7Ml8XXV84GN4d5KC5SNQdsT8+LO68QtRRil1JM3
	yw59sMHFJ3/3k+wK5hiVisgB9MSQm5WYx/SsgJcfBR1trPjrBz+nsAevM2OIJG26
	9mVOx+boas4kEP1TkhufPoUscfFdxx8WVWmeXnQ07phfEfpRvoKg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2118.outbound.protection.outlook.com [40.107.244.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47xqstt5y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 04:41:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiS9r9HBU15KLk5BiGfcvD1UUxrrVlnqtA9YbnZ0ubuyhnjAZWhcRyJINIfRJpOtDEJ3nCoSXvgrJptFPXgFADKBcZoq+3CB3jgLTSC2m0BbECKLJo2njPdB+sdkUxdzewfc2phNdc8/MweiVJdkBsgj+adgyLlqKe3rZllTr+Vhx3IHZV3FLkuc69eokCLYIZFYqKjB9FltG4qpTmdr0BFy88OCIs7lI0cXaGssavcaSgall0nIshHKpXlEsRTDNleuI5OsloPO0bNSt19t63Q+ZlbMFXF/thQdYEp/leKjkyJ25/Alud/vDDbITxohAEj9HeOGIcERM3GMH6JDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LQ+Eljv3JTsN1gLhV5odD3E/gVZAKBnMTelxkKUlRU=;
 b=kXHFRFCUQG4szwt8qZ78Xtzdukds9z1+VaeJzNOF1GzQi7dWlYzUlRS5n+qi9/QBykdmX1VsWsKUsHmilXw//tb5OkPM11ILvLD2FTQOP1shkv1qdxVIKkFBlmZSnb02c17jQUXM34nxnKu4Bgra/n3hJw/wjdJpXuTeY59qSyNDztYsKwp42LZ4nEmKyt0Cp+VoKmiHD+xmNZ9b+X2dz6eqR7WNxQi5t++lyFKZn+FLMbG2vDzR6mM/1rQgUwsZUwiuCXTPq6MOqcKXXjVbQQLKMvbc+/0ur6twn+WeuQF+f8i9XO5wEmVDAe7kDgt00Kz3CiIFNBihHesAGhNV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=suse.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LQ+Eljv3JTsN1gLhV5odD3E/gVZAKBnMTelxkKUlRU=;
 b=sgonZO7TXjsg3YJBRGfXTTeCyQFOBaAacOI9L9X3QobHAmsrQ+1cHv5DlTC+s8u3TVTzQdcRF3CHpmY468Qzcvl9NGpbFW87kjYWL1GcMiFVuL4ILfE25yquQTswpB033A61vnQwzpidEIG7aCnj4IJBCERqnPerXiy3KQry+Pc=
Received: from DS7PR03CA0115.namprd03.prod.outlook.com (2603:10b6:5:3b7::30)
 by IA0PPF7478C2D3A.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cb1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 09:41:20 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::90) by DS7PR03CA0115.outlook.office365.com
 (2603:10b6:5:3b7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 09:41:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Fri, 18 Jul 2025 09:41:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 63761406541;
	Fri, 18 Jul 2025 09:41:18 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4B7DF820249;
	Fri, 18 Jul 2025 09:41:18 +0000 (UTC)
Date: Fri, 18 Jul 2025 10:41:17 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 056/103] ALSA: cs46xx: Use safer strscpy() instead of
 strcpy()
Message-ID: <aHoWvaaEqbMhcCJM@opensource.cirrus.com>
References: <20250710100727.22653-1-tiwai@suse.de>
 <20250710100727.22653-57-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710100727.22653-57-tiwai@suse.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|IA0PPF7478C2D3A:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e03198-dfc3-4008-3fe1-08ddc5df402a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JTa3zZQ5lQTDXGc4eMe19v0dk/+lI34sSlFjNkbwuHlq24NcnK2geJUQeis9?=
 =?us-ascii?Q?LYhhW+kxjbGzZFzHUk8gnVs1pFqVeFqaoN2dM6LnyehtC1oFmAJRUau1quTt?=
 =?us-ascii?Q?zgLNoM1aELvXvhdTkWoZsU46DMUcL4cAMuGkfOmx9cuOtJST2ShlrPDO1jFb?=
 =?us-ascii?Q?Wq3MbkxYar74N+FT6PLUxrFLEx1X1pQ5SVu5/60PYWk43ZHMq8fbe6+D/aqT?=
 =?us-ascii?Q?XDVchnwJhtUdLJ2a6Z4C73cchmn5m/GTnCBPhZEMXapmvPdfgZgDBYmziCYw?=
 =?us-ascii?Q?j+p2SzzvC48cGkg1z7mpDWdhfd3oH7W+7Mtf8yAg79CPH8TFWkOj+P2X0V0Y?=
 =?us-ascii?Q?7OmQaB9Pqm38GucIHPh3yiNVUDhYoxmo93QA/LnOt8QlgtDk5jgBU78c0QxL?=
 =?us-ascii?Q?dvAQhHUKaJSgbTW8QDOkymUuSHlK2GFfr659UL9lhQ5fOJQffIhE2o4EppsL?=
 =?us-ascii?Q?ClVUF/sxgHAlGM1VXQpEUg7WZ4mozTsZGqydf7G3ehQVmIkqC8AFC8GzzGMr?=
 =?us-ascii?Q?oOR0o59Z1JbrKURVpDwF71CXBbsayBRF0oMSB9ekzbOq7bJyeJYuMRFnhPgg?=
 =?us-ascii?Q?vW1osf2HLXujrrEEnb1uD9NJzzNeDcxuHiLZ4lt3JIv+fVNxVdVVangjGTye?=
 =?us-ascii?Q?Iw9umMbE1Tg23ncN05XDxaK7LPVIeqcNvsE8U79u9SrtO4OzfB6FXKeF/UEA?=
 =?us-ascii?Q?5fPi8CAMaQHjQZirSWOzw/l+FZU1mLBIFCCs4nTgNPB/FAVcfZ4rVB5icKmM?=
 =?us-ascii?Q?7A9kL9kCRIadQnfhCMtopNzaQy1W1T1LZSQX4l/tNBqDHcp+HKKl0m8LXKvJ?=
 =?us-ascii?Q?aQg3XTwz81yQwl5qhBRE072nxkF94lAiumN50cr4VCX0C1dlPSSHfMzeIExS?=
 =?us-ascii?Q?QbfKN64svmkKNzahihJUqDH81M4HdBulHyNOf0osS/LwfDuq975oSp5mbO3u?=
 =?us-ascii?Q?2WDshnvcMRC/jwzNqVvwealHbuYxkKaP+qbP+csTHgADflVEOe447euM6HTI?=
 =?us-ascii?Q?nlDqNUv2uIY6BzCFsB7mw5DLmB2JEABLfGb1GFmMILIhK1BwoYH07g73u31O?=
 =?us-ascii?Q?4ZVNsjafq4g7aY5eDyLy4F/HCEvKGz181E23bLZCzPHQoNi+IPci8vddve5e?=
 =?us-ascii?Q?BHa8Bh49G8WTp5xntpUTi22rCza362uRF3LLrCKTbXg8n77MRHK0QAc/UzYK?=
 =?us-ascii?Q?hEhyWwrlVHhZZbp2Wj7ErT+LYLF/RkWgpf+rexi6nrWxp0sXTmnOY+dTy8DQ?=
 =?us-ascii?Q?W/Lo/0+V0C7SePW2udsAeAse97yqniFx46X4ObTXx6XMPtSTcJ8gG9XTKnCM?=
 =?us-ascii?Q?3MyGOnw0wanmT2I0mfXNMzeMYBSnN62v0A8zozu9cQVUV9q222aISyyVPkus?=
 =?us-ascii?Q?WxkMl24ys3j6HqAeu3JhRZ/iwh6MK1AJzNP2GdnJXtBvB8gCoisnJgScthH+?=
 =?us-ascii?Q?/TkdheK2bqgx+HFaP57UQ3+Gnug2XMi/OH7nM35opkYXrXu+3aq+K36yvAD5?=
 =?us-ascii?Q?cpOy2QHXotDK/zUed0RtgaLbJUWENwamWpoA?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:41:19.8577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e03198-dfc3-4008-3fe1-08ddc5df402a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF7478C2D3A
X-Proofpoint-GUID: tLOnPaQweDWV4IXRgjpky57NQVZKI8va
X-Proofpoint-ORIG-GUID: tLOnPaQweDWV4IXRgjpky57NQVZKI8va
X-Authority-Analysis: v=2.4 cv=C5vpyRP+ c=1 sm=1 tr=0 ts=687a16c4 cx=c_pps a=kYxjtQCH8jYJXwz0hAM5nw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=xpKaoQlV9wSQHpw91qYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAxNCBTYWx0ZWRfX5JuCl1dpZIa8 fkZaI6Muqw6WvqzeyU6rqGcl7MyMnhQQ2C/kQ+CGUHo7rAvzSyx79o0FP/SAKjsjuHwOIhsSaUH flZLwOH383JdJ5YxQ7JhBgFYAkNPBWk+bn4NpV5HuiyBtggi9iBZGKT2EIMTl7TuF4LjpVUtiWz
 4GTWS7U+lSikckyKS8t24IXlcPPJ3a7rml6vDnvILgE1hVkfbddpcoEMlhnkuTQCWqtLWtVfbdf t4En8Z9eUCcKqva9BJCcQbDbFmeLj9yLCXpwjMYVgJwEPfFRc6GJ8rYp2e53Y5rOfoYYbTPrmEU +xpCq2/rBK02+oKZPsfGn+vhhzSWc1NnkFBc/tmHozHzNIP5UitI0XVhgjtf2TPj+H1V1xdDhbk 323FQBWA
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 10, 2025 at 12:06:38PM +0200, Takashi Iwai wrote:
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
