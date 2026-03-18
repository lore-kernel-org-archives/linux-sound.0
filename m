Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3201528312D;
	Wed, 18 Mar 2026 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829647; cv=fail; b=JkGUJeMWhYdQBnLYmyQCAXRrlu3tJLmFwYMUowzqDXPDaaKzkEvmanINaaUhjgrB4DGy7ahUYFVtP6JItm60UD3QFZBkoNUFFLha19o1pXs0oG8n1Hz4mYgPD5uP+eYpOlYOtstg7NUBqhlRgZskN3xDmwJYOZevTTZLvFOLMcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829647; c=relaxed/simple;
	bh=yKyIpSeSkgXzEO1N6pWqkWn8M8Z4SkOX6LBxH7xtyIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr+52cAttcuZtOe1WY73epGU+azv/XfS+9hDn1DjAw62lXKrJxtpoyydsoRqTmhnJP3I6KVdlotEcUzwSVIQn+ltD0mwd8+V+WFRe0S4b1H+ZYPh/j/kax7e8lNTn2GQ6A+T8DUFnaLWeFY+32NPvinLAIf7LGW9Rko3a8AMfqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WbhE4QW3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=b+rWMShK; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WbhE4QW3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="b+rWMShK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I4HWH21345803;
	Wed, 18 Mar 2026 05:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=MSyJBl7MNwBbi7lgcG
	wpterDdFv6iMKkNmb4xqlk9nQ=; b=WbhE4QW3vrxuvwPwE8p+3F7V/XxWu3nZnk
	UzVK/iTWt4xWpMzfn/ObNFVD9Hb/vbOnEX+5FQ5UXh41RmDAZl9M8ugrIjWJ+VvG
	0OggsDCw9/PrdIYovonCTCfBZgBEzGHfDm76h0CXy7qZ7Y15HbCoPbAWNerWK1Q6
	3HmHf9mZWTpAol2oQIB2OwOERjrAyHO+0AhGGW8BSUCVjBNszsqo/H/36LY3LniD
	BiCXO6eOi0Rj7nzV2y88oIj64pSdPD7rPEvuFOwJsVv+BjP1BGJTbf6Fy8C9HroA
	lVWqZZIFyxqyhc4LPSUWrBnZ7j4F2DLnTpKw5jdgaOs22S12D9kA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022126.outbound.protection.outlook.com [40.93.195.126])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cw52v527b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 05:27:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCsV8bWS/LWgrfLl5gjAckP/FtGSJ0heLkR/SxkNUpb+RrgUK/ByxHauVHdOuIlX2dDU3PZt9PBYC4xeDbabG4golf7srfb9xDqviKaQna32aunFerQlIEBxksS4UnJzBXcrdrSTKrEIcMnHwaatuwJH+wtP0XC7X1ZSqUAHzpoY84m73JY8UB858+h/1/R8bM5bxOyyjXkQinV7nQP/gJjslywreAweY16JboBhAIIitxgd0wEy4fVOTmsPBrPiPvRGoWfWVPVg/MzkmfRFR6uiPYt+ipDWhfiPks7y88rGipK7CLuq7MCufy/h8nWAZcrkFiYXuOGvzfSSIQ1Ogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSyJBl7MNwBbi7lgcGwpterDdFv6iMKkNmb4xqlk9nQ=;
 b=s7n+SV7TSE3XtfUz+oYcbxPpZz0nn+yWzZx0lZN93n2getYZxxhhh8LFq8XlAfNcUyC2beLzUEY9X/tYMFp0z/jaXLZ/n9TurU4aAfng3NcsaYukn0WP+PjrqFJFkl6hKIYCGQs1OONnS9vDvtTwQsiagGoqqxpwgGbS8wHGiwjZfB4rbU1bF4w8UqifqpwMo+K1yqqpiQArWLWID8ws1AcEdIt1poh1KxssaBxG2t+ud19nVk37Ll4cI3nS6yfkM6WZ77V2Li2jY0BQiuyrCUnxf3sRtQd3tojMcZpdCOgUc0AZHtlk44erMR7FNMFAGZpQ8nOWNwW03+vSVlcNgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSyJBl7MNwBbi7lgcGwpterDdFv6iMKkNmb4xqlk9nQ=;
 b=b+rWMShKnhPIoFByZm9B3LGuFYiOhpriiJ+bG5t2PQpb28XmBCMRCpDE1PDXfe2NRFsQSWeFk5+tUIPjRR0hRivO1Hzd3AHtsSSLlJawdHpq+cFLLlpLDl6kS/shHr7Fu2pSQyYxjp5M44ffTc4N/oONZMxXqoe1SMxtcKuHzic=
Received: from SA9P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::11)
 by DS3PR19MB9391.namprd19.prod.outlook.com (2603:10b6:8:2e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 10:27:19 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:26:cafe::54) by SA9P223CA0006.outlook.office365.com
 (2603:10b6:806:26::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 10:27:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Wed, 18 Mar 2026 10:27:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2398A40654A;
	Wed, 18 Mar 2026 10:27:17 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 01087820247;
	Wed, 18 Mar 2026 10:27:17 +0000 (UTC)
Date: Wed, 18 Mar 2026 10:27:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 00/10] ASoC: wm_adsp: Some improvements to firmware file
 search
Message-ID: <abp+A18W3n720HQy@opensource.cirrus.com>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
 <70c45f75-7ccb-476b-8646-3896181a2569@sirena.org.uk>
 <e9fc894a-4183-4d22-a9d7-6ad05167abe0@sirena.org.uk>
 <abl4wZyYTJf1C4ml@opensource.cirrus.com>
 <abmTp0NcfyCjfdpv@opensource.cirrus.com>
 <b6c7d439-7c46-4c99-9213-30369f1dd443@sirena.org.uk>
 <abpw/f/3OPnjFW36@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abpw/f/3OPnjFW36@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|DS3PR19MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: 2faa48dc-f000-4b06-cb38-08de84d8eebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700016|16102099003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Rh1QpZhlSxnjWAVhufJDVreyGVdXCP0ig/X+CPKdEuqoBod0vMoQniPJpbDpYlxkLauZnpRECoY5sU/so5UAhbM4crlEUyjQ63qj2aTTGb413G17iV6hZVhCcv0yfHmn22JxGgVHMpRql+zbN6+kZR3lrf40Jknl+3wFSqmSFQrJcV2qlhuH/fWcIyj1WMbArgN4fBb939Hi+IiT47U0e+ocyVAhq+KHToq9PUrN2b6c8R3Fn/poYKtj1bGxLjW63z09HglT26qMzJPKWGH5lF+Y8kgY9y3N/khKTYDuzEnqHv05d+5sGZ4lrPE6k8JpW9hmbjUhgTU3uecNqACIhhc6OsueFPj661vn3zhTLKm6euyp96TW4pyobaNhrhXKfLQL8Mr+WgKWZzrlrReeSRcpHSLqToTXcifVPXNDyESKlvWWW6x5Wa2F4e0Vfs2yhUrdvHwcdrlod97ks3t8xu2BQqt45KmSQaYQcJtogpF/bP9DrwOUM/6TQYDI3ktnQTUpcFzlJG7rgUriuCZJnbnFLnk9eQwsWF076acsWZbmufahs9uJGICMXT0fG040Awx+k9Qg3ByruqNC95CpEGORyP/6r3o3jnzOpfLYqz0rDDZzswVri7UFwYxpE4Pc2Jq8bPTkGwmifdstLoy/lp0n+y5mLaRM8C8xQdqd/qfOVZuEHbjklyd9MGBcHTDuxDY18UTlRtIvUDipeCEN/VnLXDfCGLAGCkh4oaet4CfW0lsAs1Q3UZF5O16OUhDnLFPJ5VDGAJunsXSKBJ17SA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700016)(16102099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4VxQMPQLeZCJEDU8P20mOPGl4ErTM6V2vymrlEifZvmZiH2fu0t0TxCerwkZG9oO5MwRzyhpBxCySqLTiDO4gfRvGT4dLi6OeqfAPJRL78TBzKSW7WV2PAg8gvfGwOiEDTx13cXeyXfZUl0eTF2qbVNBzRKNfS87Wx4QqgnacuIr1gjSak4Czvj37pVOqZtSNRdR4T+hp2Di2w0wAC3Ahp/qjZbS7+iUgkAGlWTCSI+VL+a1+cyVl/iJ65koZSjWgTnoMdUshz5gPPS88AF/Od4DjKIFn5V/IvUSRNCvSV+2BVIfsp8jmjGmuDepqiBJPXZk1n0MLcwm3NTANvhjYDvNlS+57dt7MjL5DeAieL/gDWPQtbwLoiIEPepr6mxdbJjj5ypG8Tp4CmiHTCy7EDXvHsTtDOqqRdwxEoaiE9YhIryXG0SQ6DNSeC5U1fCD
X-Exchange-RoutingPolicyChecked:
	Zf7gRNOsa9++lPF1/QVqIV278PkH1/2QdWMte7DMykrTKWilGBoZ0xUkDfF0UIxvkbPnAACasF3Q7MnSDHeDxrgPQyFOe70EIs7VQ4GJ6eMXEx0rhHbtTzhEuoSayhCd1ZN3ckovycVYrH1WNPn5K7kLHI4Glz/KnLMI/KBKk7VLPj0wa7gS393B60pYlvhr8Cno9bTHJY3egV0fJ9Xyz8Wu3UG0w4Zbfz6jCcHZi+3Ub4ZbPuPgbqLxeZw3GKkdtqawz4svlmo0AO7s6i+Eh2TJpd4D4UaUCfnEgx8g41I4/V9E/opFebOtzBbrRbui5Pa6oEEyxYiUWhcZdTFbtg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 10:27:18.3468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2faa48dc-f000-4b06-cb38-08de84d8eebb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9391
X-Proofpoint-GUID: MisUOjV3RbH_uQvl9mDjQu8JTj8b0AtD
X-Authority-Analysis: v=2.4 cv=MpZfKmae c=1 sm=1 tr=0 ts=69ba7e0a cx=c_pps
 a=uymmTM4Y+3Yl+2F0nrhS0g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=ldZDY3-sMaoGq17lgr0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: MisUOjV3RbH_uQvl9mDjQu8JTj8b0AtD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OCBTYWx0ZWRfX/yDNrK40a0RA
 qNg+BP/iea5FUMgrz1HHDzCcU2/oLg9seiEa62zKncjP6HjLVkhlAOVelb7InPh7Otcb49p06I8
 wZ5Ll2vW4hTPBw/eQWDYibsIGfyLm6DKZcqR3Qmb5RZ919NCLPLqBiAMmQns01r2Msg+9bxEEsM
 gIj4QNaCG67k4ZQj9FTpQrklVHg+fFo2VqAAqjLHnMoYPtM5Ptbon0FKeSK5vnJROeM+LTqSrPG
 h32v/jzjrYPuqcZw4BLTR4wYqmMPLXiJozMMrjTbs0C7bYEnNk4ORWQThWCiYN5Wlm8VnhnMwBM
 fP32hycOiwOhnY+5rvcnUiV0rWwcH0K6vVQGG05uZ3wOuIzVvtdbJGpqLEoW/KNQ8IYQtt5ZTqc
 X+iZZgACUe7riavUnxdT397SXl6OcBg8a2H8MuLnnCbfjmiacexLIe7du0ta4frR+CK3wtZpGlg
 v5pdCIsP0JYGVEtCN5Q==
X-Proofpoint-Spam-Reason: safe

On Wed, Mar 18, 2026 at 09:31:41AM +0000, Charles Keepax wrote:
> On Tue, Mar 17, 2026 at 06:11:23PM +0000, Mark Brown wrote:
> > On Tue, Mar 17, 2026 at 05:47:19PM +0000, Charles Keepax wrote:
> > 
> > > The rabbit whole looks pretty deep on this one. As far as I can
> > > see it fails adding the device because the device already exists
> > > on the bus but this is the first time it added the device and also
> > > I can find no evidence it even created a bus in the first place.
> > > Feels like there is a large piece of my understanding of how
> > > this is supposed to work that is missing. I think we might have
> > > to wait for Richard to return on Monday, how much of a problem
> > > is that from your end?
> > 
> > This is holding inclusion of any new ASoC code since last Thursday out
> > of -next, that's pretty disruptive really.  It might be easiest to just
> > drop the changes and let Richard resubmit when he gets back.
> 
> Ok I will have a bit more of a gander today and chat to the boss
> here, but I suspect you are right we may have to revert the
> change. I will report back by end of today if not sooner.

Ok looking again with fresh eyes I think I have it. Turns out
most of my problems yesterday were just finding the right
incantations to get kunit to show me all the debug.

Patch incoming shortly.

Thanks,
Charles
