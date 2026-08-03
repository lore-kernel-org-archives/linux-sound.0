Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5585B30BF4F
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785746091; cv=fail; b=Y1VPA5YeT8KBchOWl1dPKEK4blrH4rLuMA7dMekIP7qxgnvRmPpBmAMPZTbUbzp1okFqpRR6ykrt9bd9h6lBZOsqrvmOiWSrmPZW8SPU3qedRwmL9XFaeX3kt3v1CKe9EJ6fuRRaiyZUBUHWvze/dIJDHBd3yDhdgvgAQtuF1vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785746091; c=relaxed/simple;
	bh=JJ5uCFFgyldS4Zxwwilzine4S8mvQ09Buzh2Z/jXgsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3z7WevWXjcXPqisG3HD9yJM9SqLZDhJd4G6uCpiyEofw6Yan+Ab28By2CldG6D0aGyPRGjV1KWOchK0QNJPLlIgzqDqZSwCkavqnJ6JEjtApywML1YfJ5KY42lrfR5IA3+B3dFNCtWHzvOA7aErbMGcwI2BRlNrcN9ExHlkg80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mY7KJNfT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cf1i5k0P; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mY7KJNfT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cf1i5k0P"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6734VXNh2862713;
	Mon, 3 Aug 2026 03:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=QbwnIzS7h2XsEjIXPaXVwtnsJnoU002JSunBz9Pufjc=; b=
	mY7KJNfTJd2fHMAxEoRbo1JYT4+QurApmJgy/++1eeFWP51a0qIyGpO0g9FcFx+Y
	y4uke6wAOn65FW+W/rUf50bTJLmYE2LlPL0QaVUrlL4J24TrTlkYc3We8/1JV4Zh
	5/EErXAXIP3URb1Kf1jcFCvRc7k3+lIbLxtmytkx+BXItMzxcBHn+Fut9yyXBv6D
	CfPM4MsqQg8IXkuJg3TzQHNIL9oTN0ElmdxwckT5ENG8PxmjVUpaT24JDjvV5kOU
	Jci5bnjHt1c0IkI7hQNX+Ub6UcVIDjfp5hBEE/gFtrWsbmiiQADw8/vHq9GZo++Y
	wSuE3NMVY0MQjZ2qk402xA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020090.outbound.protection.outlook.com [52.101.46.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vhmce-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 03:34:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U92iiMWN/5SC5pAp2m3hwIYBB+9hBLFI972JgQG57I0R3pDKbtV6qcstY95guDH4gDLRTIFzSUCNUkkO4sH883PX2DuLvnJqEM263ZatxRdYMmb5Ty+k3/19SH+GYwEGc5Y+bFe+55Iaz6RBgyz2C/orK9vE9+iPgbp1MsgNPQPvGvMtqAOSqa+5GhaND30P/Hx2Z/as4MQ81EQ3BzyIf9j6jOWyh2750hMJ5qFt9m0m/DYccpB5GK+V/TsscwkbtVbttY2svE7fvCupP3J1g/80XSy6w4yrNjxp9RYeu2+FrVf0B6omY+ehPtd6dvmmt2lMeXdVhD7mLaqj7cjXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbwnIzS7h2XsEjIXPaXVwtnsJnoU002JSunBz9Pufjc=;
 b=fOrA2lx2kXJWd/b86jyp55lYcJZZpdA5f1lVCAaG89KShm0omS2FEnMaRdq2aAcACEF7k0uOq47cWQQpPvtKw+QYiurWPIAgRoTBWOa5VEXPsmTSY9huflFj6oHVABWdn7KrApR1WO6JRpnrW80cwd5jG5403PVnGxNBtNKBC9HCd7H3eDVAMADqAxImmMoUcu+vW8+3EeRRu6jSyHhUO2IXc6Na4w+BsPDKesv314Y8I1HWihelOUDCSbpR9sPZcjEtE0CA9TBb/lB92w3XzngQZWR+sqGlAu6PUTg3dyrQxGStdR4UW+gp29AoWq9+Ay1EnC0IjobbUTLSWTQymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbwnIzS7h2XsEjIXPaXVwtnsJnoU002JSunBz9Pufjc=;
 b=cf1i5k0PdQCAKXGOlYpVH/PjQ5XHEsnQ2A7XwW7Dq9ae95Bbqjqz4/i0DFr5suBgbX+K4SporY3FzpebH+lzsain43XukJ8/2sckhDVLXj0RvOq6puJ4Nr6Fv1ZT1D0MbFqvMuNtWWnve6hVSlFl+jeaaFJvFKP1kA0HvuQeFhM=
Received: from MW4PR03CA0187.namprd03.prod.outlook.com (2603:10b6:303:b8::12)
 by SA3PR19MB9501.namprd19.prod.outlook.com (2603:10b6:806:49b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 08:34:07 +0000
Received: from CO1PEPF00012E62.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::3a) by MW4PR03CA0187.outlook.office365.com
 (2603:10b6:303:b8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.17 via Frontend Transport; Mon, 3
 Aug 2026 08:34:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E62.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 08:34:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 636D2406542;
	Mon,  3 Aug 2026 08:34:04 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4E13E82025A;
	Mon,  3 Aug 2026 08:34:04 +0000 (UTC)
Date: Mon, 3 Aug 2026 09:34:03 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
        "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v3] ASoC: rt766: add RT766/RT767 SDCA driver
Message-ID: <anBSe4j6ftGMntSp@opensource.cirrus.com>
References: <20260731091037.4144022-1-shumingf@realtek.com>
 <amy1NRAeDxB683hr@opensource.cirrus.com>
 <83a748883695468eafd125be3c90d5e3@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83a748883695468eafd125be3c90d5e3@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E62:EE_|SA3PR19MB9501:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fc98c14-287f-4221-f028-08def139fb57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|61400799027|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	QkvBnVaoHDicx7X9v7B1XxwelsBJ3Dry0tLXd1PkLPuQuLoHdFMpQWz9wi4cxEDiK+N72saAgE210dKZknxjnQ2P+Q4v2P6rtrRtN/TwhKKNZqmIbux4JvdZ72cQ6vlqxwNKIHuLXvt8TPOXogZjnweU7DuBsYkbK/QrbnO6X2fYYBPtYudPY5Ilxs4lRmtl3CsnBnjNUBJLiVfqpvKoJ2o14Yd+xnlGPWSIpAQJBAtHiMuEmkzvX/G+6Ldac/WTBsjCHxEZrCek2QAcjgiIQYBgAux8L3j48IeLYGtrBP9rDdbiSLVXVyir9tJBarP8lnmcsQ2UWqPlmC2izq3BfdGgRC+rzi4flCX2Yr0PvD3ahROLMRS56kKNPADujZKmNYvscxmC00A+zIOA6bmdJeOWd3OjjTSF6lccr6XwnZnwZqKVPo9fIR78ZuHttOOOBUJ1vx1afRf0BbxVebnWmG5d4UbE0UrTi6JlYBFSY+A9NUCu3MZocxJG00l2RDx2IqnPNjrBFB1JKF3jM3/BeePUx/2fbMhve5RoyJLkopgOsNRFScmsKOxAGhbQpeTH1N04L70musq7piRwTcBAJuea+hQ39o0UJeHxTpfbWKsuG8unqMAYperd8paj6QUnKPZjKigRKpTwrY6YEPDUWOQXJxz4iokxqL3MpgFXrhXoQ9tkSwGeVDqNHjlBUrtQfRgCAcoIKNFOgB4n1CYvag==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(61400799027)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GPWB+c0s/Gvq+Iwb1sgiae6VEjcMsHwEOqj0fcYgmmYeLsmbgHVcsynl6z+ta1ZkIEt7UyLQq8FsyJNQvQj5AQ9Y+wE7I+cC/txBhAwQvwS3/ZXxbiUVRq1NxRAqWz+bGfGaPZyrTdGA/WUumPwIqew5d3nUfJHDD8zSPIvh5GNIWSQVNWimIhmMQh3pWfdq2MyaoerT4PoSy2IsMyOkZt8e/2VQ8s0/ZZCmbOZ+1elbs6xlT/wSsJqoIEhgklEAZj2HQslrkTKyhiYZpvCXzM5pQHJV1ri0JVfuc9DF1rUnC1LQ30i5Y9YFcu9sHz9LxOU9ms3fe76SbulKmP6zi1SoRSRt13wEe5QeQxHAjzS4UAH5Sp4UJDKEMAkH9uZHuAU3ooG7alc1CRU6ZCpEseAMaU8HGYYL/fsRWD2k0j0oAv69ZokgUF5seVeLcy0P
X-Exchange-RoutingPolicyChecked:
	He3PR5Vq0Ek4g+KlSekYeCVU2HiGp7+P3warXCkN7jY2qyjGt4zqD6q0ltkz0BPnrIkB7daDtFlBoOCc5zJBmc46o7esPtZbXALvVdB7uSw7C1kXGI4N799DcM0D5C02T8udS6KXxOan8cLfq1gt8wmKaiEWXU3jN/dpMWZqlvDIbm6jaiaoMtzIyncjEEgBs6wezQfJ9vR33CQmDNjgvWQpVvi0qvptKw4s4CJb48KXyH0qePJXRP9aTPOIwXlpfQ3I4lpsEa1103fgWyGqWG8Q3OeKGa5q03SV3kpA+Q5H0dwR8xjkJU8d4hHd+rHXpuaou11LbKWLyIKzGGOWWQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:34:06.2281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc98c14-287f-4221-f028-08def139fb57
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E62.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9501
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA3NSBTYWx0ZWRfX60Es/zP1hJpn
 nzBTof4/roKL+leCs2DMbjOB/rABvrmWAvWikC7Tmhc+imBUjZKehuYWGIAgfyG/YUTBNFlKT7M
 QEjY/ZY7SBl+fGcNLT/PTM3hN4YDkGg=
X-Proofpoint-GUID: iNBvITXK4qvn57mQ0MgPhxRMD6poGrE-
X-Proofpoint-ORIG-GUID: iNBvITXK4qvn57mQ0MgPhxRMD6poGrE-
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a705282 cx=c_pps
 a=mKvPdnfujGBEPWwSy16I3A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=JK02XUrBHEmBqpLGkbwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA3NSBTYWx0ZWRfX4t/V9mAPtLma
 U9rBXCteiQl8RoY7po6iavQA1bdwscMM1y3Hd1tQTn3V78y2j+0iYiIY8MfjkKLie48Qnm8THsJ
 Gtrw6fjEubPmrrwfBGeY2af9SrNRS8lM1RriMjq7StFbImrZuihErICLVY7tu7uldU9V+TK8Dxe
 OYSOTsUD590eJyT5wfMBTm7A1ZjNPY3buzinAUo2IYRR7cdO9no7Bxzj6PIDg5KGP4jsgafYPtV
 INgL5K2k7aGbmdf1XOpOsuhL0lP1umgzqkiJKfXMupOHRMK+CQUosMBXGw21mbOc/gNrPOImM2M
 8nFpf/4FZQgSCNeM3QYbt9IHDNja1nMWW1wxO8DwUyOzpCnuNyYf36UHE8LhEK01Ya0RZnInpcq
 557NrwrXlXTarCIKSAo0dWw5znD5nS18+403FCEyj/Yo1rF7sv8AHjKoHHu5wt6Su796HTh8+d0
 9EwBjMKOp6qWZdVDHig==
X-Proofpoint-Spam-Reason: safe

On Mon, Aug 03, 2026 at 06:19:02AM +0000, Shuming [范書銘] wrote:
> > > +                     } else {
> > > +                             sdca_irq_free(dev, info, irq,
> > > + interrupt->name, interrupt);
> > 
> > You need to also free the IRQ name allocated by
> > sdca_irq_data_populate() here or it will leak if the jack is re-enabled.
> 
> Thanks for review.
> I will call sdca_irq_cleanup() to free the IRQ.

Would need to be cleanup_late to free the name.

Thanks,
Charles
