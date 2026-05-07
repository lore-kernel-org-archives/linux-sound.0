Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5DA36AB53
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168185; cv=fail; b=LCs1CWdunSxF4b55OiyP4YaoKpEku7YHPmr8yxwkP+eVp87FRXftsV/O6e6mAaDKAPRvRkNQAD2sdIkGWcfAoUd80WJkytU4xvUTrxZ8gaX1kDxrJlHe96+daV5bBF/RCznNhrgIg8cdxnsIG5AVwpVd22gCw+t/jXHdfI/w2ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168185; c=relaxed/simple;
	bh=Q329+aEnAHnyYI9xgPbGRDgD6SVV/W8jIn0rt1yzlkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9HmcxYxVwwV8xQ3QSGn3nXINk3VplFpwLfy/SYLYs2xHvk4eDDXkFDxWLzdfPEzX/6+TYkuDbH1EnzPC3x7AnllJgoMAwoj0+Tq7lJEzMDkD5RfJpOY5LNTjsh4o3a0bOEfsD44jImllTLZvks93V2n1eP0JzLhsAz5DNOjOPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SIjJ9ZjY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NjGyIHQX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SIjJ9ZjY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NjGyIHQX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647An5i01753361;
	Thu, 7 May 2026 10:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=O2HAM1GNsblCotS4+X
	6hh2r1FWDgi10Mxc1Vo5p1Nvo=; b=SIjJ9ZjYnDJBAjgHepZwK7kdxJmMc6AHyi
	VlyodoxoLYei5aAnJ5wvN1oCVOGlGvMLDgEEX1Cdm8Ofp/GnztuynCXR9KpWJLn5
	lsLLJxsz662Ma1K0r2NJxOHoVQaT1qVrM4PChxoE6YVvAiJylcOebKsTR/svtIf9
	F16rSg/65wQWJg8VpG/EMGYHbFhmmSwGQOsg6sF6KRAcPE7h79n5Qflhfpu5MFin
	yi1jLPmmkpTzLc0cq/Ux3xwWawJaHXhPXexDMzLWmiBQVqxjm5NRT6XB6yOfqD2H
	chf/xVhiEDCwpApKmHw2oOXxoDiWhhPRnHn8YctmrRfslKWib+dA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020101.outbound.protection.outlook.com [52.101.193.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk7c10-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 10:36:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdWAoNgMIS0tRmcnh/wf2nn6B9JvpBv6J5EMh67nuuznKVXVxrcKU2Pi0oSCd2rPaB/KkTCDXt4DrWfvkHVeecWKDoDIaQ7fJh1BR3DocVg9JOGu3IUsSsF4SnVXZBZ6GaRi7X7FNKFoo/hPrvT53gyum4pXEOdLzQlESqI72jUzp2TT+Rd4E8QsWP2jBLmVbXWIGU0PAab8F7OAjlKE2XenRDLzvuS+hztZ/CcC7p+agKMR2+6w+iksiqbX2tfAkR/NYogLLWZYY+QcfycGIqogy/c5wvEhCCtSh84INYX43VsO8rks/taSAc8n9lRVnTGf+1tP//491bFzuOsKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2HAM1GNsblCotS4+X6hh2r1FWDgi10Mxc1Vo5p1Nvo=;
 b=EOJ+i/3AApv3Ujh/pBf4d7Hvu248wTHQJc/iysBzVvh12lpOGU1mg+TCTQXiXqWpyRgrtM4kiXR1QYFHFyuVpg2Plw8xADBljnZLd7LSXs4V3V3FuxlHLR82TRmHCgdt/XHNxG2QCGnCck4v9tIb00SFNY1K4M6g06E6D99PrmjAcdDBcJgKnr2PE/ee0vQ4WoSs80b9dFYJCzvyJjVtrBWuKLWAfcf9qeMlA4Fo7KRI+qoZ7E1o+ipFy6sWVtHr1vzOUyiBPwATgMKaQZu8hDus5HjKo9h0uZTK6M1FL3+C9p2bpZJ0w6Yx6/sd44vfwKFUx8zEJO1lWvvJbnj++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2HAM1GNsblCotS4+X6hh2r1FWDgi10Mxc1Vo5p1Nvo=;
 b=NjGyIHQXPafdGPwpEL289Jrnl7nOLhhGOfedR91QtOPoUlvQ5y4v8ja4+TNCvVYK+XKmr+N+Ja0zAa3YC6PjnFoKa4dffFRWSzuePVWhWL30gXqk2XimMzlvAWWLOfG/x41crU8akKlCMcvdnjFgXw3aS0J/CpK88xhL62a9lXU=
Received: from CH2PR02CA0020.namprd02.prod.outlook.com (2603:10b6:610:4e::30)
 by DS2PR19MB9460.namprd19.prod.outlook.com (2603:10b6:8:2d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 15:35:58 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::11) by CH2PR02CA0020.outlook.office365.com
 (2603:10b6:610:4e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 15:35:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 15:35:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0D20C40654F;
	Thu,  7 May 2026 15:35:56 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DE2A582024A;
	Thu,  7 May 2026 15:35:55 +0000 (UTC)
Date: Thu, 7 May 2026 16:35:54 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Tobias Bachmann <tobac@mailbox.org>
Cc: linux-sound@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
        Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: cs42l43: SDCA reattach timeout on Dell XPS 14 Panther
 Lake; chip stuck across distros and kernels; worked initially; still working
 at hardware level
Message-ID: <afyxWuMCcawIE2+v@opensource.cirrus.com>
References: <cLVwl4lrR76pLtv8VxMSaA@mailbox.org>
 <afxZdCOyzzwocQON@opensource.cirrus.com>
 <y6AZlQCPSdCp46upW40QCA@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <y6AZlQCPSdCp46upW40QCA@mailbox.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|DS2PR19MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: e2aaf8c2-fdc9-40d1-24d4-08deac4e559d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|16102099003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lldcypk+FzQ8dT9pIW3snCYvynASZa4Lo0LFB0sJnqguCadgyTqSZe6pk0A4NMv4Y9zhQc8la5k7aIBpyMuRGKLZUo1sHQGSnSuSecq4foTGCuIQd503L7jR83HvnHCJPZsgj1vA+Ms+gDN0XzMNLOBOrKTqoZpC+6Oj0z1Bto57XzRSVWrY9k6ELkxLONFKl6oXQYAPuumvE5vlelaaNrgo9v7y+H/7nT+yW8cAX8XBTH9jBuYDAiLE7wvLgTvqU6NxDXFZ/3U2meO7cXMRzgcJ8AGrhoIeZJ/dxMQVycPHk5GI/rsFekPlVRGPq/w23+cgojxpzprtM39TWZ8ZkWJBetcGp8C0ACVhEjl8c/fOxvHGJwODASiromIyb9nOiKSlJNDthdHWd3LpwzKjwxSykn8vecXUWXvu7V3w2UwcFkUcxc1sey27NtLJoAZFAGGOqte/TEoHgC33DDA+9g+l6pJEfxWHTBVezosJ8wNu+bI3Z037OmHmsv1EWd26qCU63L1IJM3QbT8vPUFF4F7fsVZnfcQ8iJdv1XGo/VkXp0jDuDqZIXoFQcPIuigDVZzcUmqM9v4k0WnRs7tfbCQSXPn+vOECUFM2US2wM1dR6nRSMt73SkqNXrzzXg0abYm2NqHnyfeP1q7cCOs0FzXqhOychAqZWOJtASjvGyejf7W3InhUzYH9yqRpQpjFJtSBXfDa+faC/nritX7UTsmtUGzcrQn402VdzwohJoc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(16102099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VOCr+J1WGstDAo73u4uO4qzlRCd5olXemEJOk7vIl4dmwcvaXbu4i8qH7FE7hdHWXi8O4y2Cm5v+4kVWQOfThWG4vXCgo/uSknWQZ4ItfJ+QVF0NJ1E27ireCyvUruqHLHSmseMRmpYe4u1nkTxZ/i7ZnNCnPdLKlVOlZTtFXEStNMk7ri2ennh4l1GjguE9zfFyvhqUs8mO25/3svhOklb5WTOa0ZPRNKprR+tGOuwbh4UYOinN4y7+cPV7NWP+78vtapuSNGAAHUTLU3SvSSLu5m/+KhJzuWgLaQ5/2NOBJwNREDtI4TeWH1V87R1fILXDOABuDM3GBsvLpGGLHSMZHKXyx95NaOiPw3ehxdnN+VzwveNIgOt1JXr3ttC5vJ2kbOpJpIHNyHTEroGaN9RlVRX4DwrgEgOu6KkWs8G2d2Ei73OvA/VjPNkXpqkZ
X-Exchange-RoutingPolicyChecked:
	v81jyTbla2iPj5T+MSaQZf6Z3AyLdxnLRy9+6Yvtv7HenV/V1vQmtC2NKJ+mjLpGruBHQ6UiiIkRyraRA/wP7uMd4SMQfKM3zGOOBFi51j46FehyVcchRxYxf5AJ9q8BljgzJr8LQelpBthGVaggagoAlcSkiKzLzG87dUGoGHGkOXyN0I+Q40kNJe2DpAZ9j6meSEKNUQXkQCeZ+a7VWettVuMaH+TavgNIn/Vm/QRrposriPS1RWmoJXOhlJE/FC8LOO+jiuoDSishd+V+tJcfW+LWySNiVt5i4zp2rAQAgvhRx4UIQdt+n734bXwzWLEPtIJgeQcrimjhGSkc8Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 15:35:57.4619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2aaf8c2-fdc9-40d1-24d4-08deac4e559d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9460
X-Proofpoint-GUID: GER6dT4NZEf71CaJhZJjzitO8nLuBeD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NiBTYWx0ZWRfX6g23gpcfUL3q
 5d5TIOqmYW3FbWTbFx6GWI5koRG5iYddcYIq0nmuGxOwzLsJ7UZiWAwlEReVqdUnFO5UndnGmri
 iJXnxS2n3D+DC43iIU/Fm/EzaHJMwGWON4wq6oFUibhUPvgSFYGw9bHh5NK0p5vHXFAj7HndYnT
 Fc5JTi6lucx6g+5CUyYajWTqkBVTZalDlDIUGqoG+iFKtI2bl5pfjDR8YJfdwiK744I2gqPXdnm
 ELI6SX72hEQePr7u6bZxHmDs9tW87MtiTDAtfwBvUph92F/8o8TYg8O9sO23ORRA5CLRCqSKfn2
 /z49ottJrcEz9sgMpIXuPVU45z+OH/AhwOw+TpMegCS7uRuyJkqcq+RCHw4cnoonJH3yMhm7vn7
 7lfeJcwzMVa+P80u+R24d07I+vwGWxlqE9Ld4U1kANAGAc6Msp+xwlzx9pI/YoItKt61ZW+fi8f
 KVcDjEUW0fMCYPKPoAA==
X-Proofpoint-ORIG-GUID: GER6dT4NZEf71CaJhZJjzitO8nLuBeD3
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69fcb160 cx=c_pps
 a=IAlGFxvWO5AZskdmYTP3vQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=6AsUN9F6HgPPI4PLLN4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Thu, May 07, 2026 at 02:32:21PM +0200, Tobias Bachmann wrote:
> thank you for picking this up so quickly, much appreciated.

No problem :-)

> On Thur, May 07, 2026, 11:20:52 CEST, Charles Keepax wrote:
> Does this mean faulty hardware is the most likely option? This laptop
> is barely a week old. Or is it possible the driver left the chip in a non-
> working (but potentially recoverable) state?

Yeah I am afraid this looks like a hardware problem, enumerating
on the SoundWire bus is pretty much only dependant on power
rails.

As you say there is a tiny hope the device has got into a weird
state but isn't reset on a reboot. However, given it looks from
the log like the amps were reset:

[   14.603448] cs35l56 sdw:0:2:01fa:3557:01:2: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)

That patched=0 means the firmware has been wiped and that only
happens on a reset and as far as I know the resets are tied
together on this model. The very very long shot would be to let
the battery run down and leave the device for a bit to try and
super make sure the power rails went down which would also fully
reset the device. But it is definitely a long shot.

Thanks,
Charles
