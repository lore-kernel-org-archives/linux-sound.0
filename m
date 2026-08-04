Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650FF3876A7
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 11:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844793; cv=fail; b=NVGuAmfhx2sD02mY/bbnKp/u+AvhsILZ4ZHpOPSulfVHURgd496t4+X37n4ROk+toJhFpTor2uMmTpO2wCcrxpjUaGTdXk1acGZ+4fLuxwLJgDRho4vlfQfUenZy/XHRB6GD4mGrVsndNw+2nm0+Y8qjUSSB6RG6x+xEpMWpsQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844793; c=relaxed/simple;
	bh=qycJ+b22skJmFskt/XEoDXXNFAud1bu6flyP6qL9MDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoAWw4XPaA0s54VE8a7BhwiFIsYZi8bJaKP/BnxzjEWk3hzSRudgdTiPQ7jJRpigbatYLxn+cF7gTu8TPN9GWpdBkFOVH3yxnb/xGlyVcDoPABpJ2twy1A/Q4HflhhBxejzUHMMnr0qDgJ3wUVYsqgEO8gmH4DKT28L2nWZchcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kYpIJ1yA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yW1izR+f; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kYpIJ1yA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yW1izR+f"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6744vgf9134671;
	Tue, 4 Aug 2026 06:59:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Gw88N2HTWaTTc0TiJB
	hy8lXzgMGS1VZbmZ2l213V0iw=; b=kYpIJ1yAWlqjwPuaqNON6vw3D0hXwhvklo
	pmV5frcequLdGLQu+qXbaWsUBT7z5bTpyFibkZz3T41Pyjgwxd+gjEtcYdcz51u1
	1UrJ0f2EFOSuwt50PycxazybxeagtqjVeCq4kO72Uu3TNaarlZM1zvnRQo52MJ+9
	XNiR1B3yBGMYhz97msbtht+Td3RSsu50FqHeKSCVBDA40t9bFRxhRU8Wrq3ULj8m
	Lex6xdBz1yt83GNFhM1fTgWqi6enGcehJVAyVQiFWiHJ0oVTntGQewJrMTGZzJ2V
	GMlBXhOl+QIp6Wv4UFplEXJFinHMWEn3Rp24n/9AxPZ4Ay4Kr3SA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022088.outbound.protection.outlook.com [40.107.200.88])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fsd7h3pc7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 06:59:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8YXA9dJaMEsUxZ8v2lNX4m6xUli4634WuPuEn2rrxRboVSYrVa0RTcxox3JSP8OH1l3IopsczTk+957IPsCjrJHAN6L0vOgdyeWfx/Qgk+f768ZxtjrWWPtdn073VMrxlCHpUegZaMsEYGaoW3h2Ug7NOaXQGVuTPnXaheVI/A9Ku0Jcl5we0EGToXREUlH0OgfrgnTAh96KxzBG+KU9xx1RUwoVnzoAzlCFWtHJhhBMggki44zbbzaQafX/8VOYpw4DV4Uqcf4cw93mIigo4dUxB2xGBYcr0siH9en4I0S458LVMHP6hG3p7LEbTVrXKM7o6jS6ia5m16fipQ/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gw88N2HTWaTTc0TiJBhy8lXzgMGS1VZbmZ2l213V0iw=;
 b=AxA72UTs+ji5lK9JA89XNKtuF3hhuwkbxlNE7QjGTnQwafKmi2L6+8omCdtpT0sCG0bNBkIJz8Jn7oIK0iEU94sV2+WPuAaIIInc9op/RPLd33e1ICejnfhrfjZMRxTf9oSt/OhxIhn3eVbW+kP8cv7ejEtMJ4oJS0qCDHGi81e0VquVn+nEeZXIrByWwPAqhkEDA3rg7zwAqrD+IW/uzH4HBHR9cblC1T5LvfHCV3E3VjO6+MvuNTXq6XDT/OpzFmSTut9SKzkQD+yxohlQsHxqsX6Sy7bzqh8wxxvEh9pf0TEIhK+nstfKUr0S66k7yYQco5QftKQtWtRObqdDpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gw88N2HTWaTTc0TiJBhy8lXzgMGS1VZbmZ2l213V0iw=;
 b=yW1izR+fDZVeeywWjvqQ5vzrDLDDvsRqZnAY1Cq0ThCVYD6QBNN+fvOOb9tnNPWVo4kkuKfnsdB5XkICOstqveBWfAmg1bM4xNNU6+ROmblILP1XB28oE3oKwVTgHTdtq8MFzrarpPGkaFvybamznNbLce40VmNpVnJ2P9VWcHw=
Received: from MW4PR04CA0126.namprd04.prod.outlook.com (2603:10b6:303:84::11)
 by SA6PR19MB8784.namprd19.prod.outlook.com (2603:10b6:806:43f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 11:59:04 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:303:84:cafe::7f) by MW4PR04CA0126.outlook.office365.com
 (2603:10b6:303:84::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 11:59:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 4 Aug 2026 11:59:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 19FD5406541;
	Tue,  4 Aug 2026 11:59:01 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F06AC82025A;
	Tue,  4 Aug 2026 11:59:00 +0000 (UTC)
Date: Tue, 4 Aug 2026 12:58:59 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com,
        pierre-louis.bossart@linux.dev
Subject: Re: [PATCH v5] ASoC: rt766: add RT766/RT767 SDCA driver
Message-ID: <anHUAw8HMLSqFqF9@opensource.cirrus.com>
References: <20260804104828.557228-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804104828.557228-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|SA6PR19MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: e7735186-11ab-45e4-6a62-08def21fc6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|23010399003|61400799027|82310400026|10067099003|11063799006|56012099006|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aLdUSqAakii1hJPOmNYJtViBCsUrOaWwZzHQ8YcQKPLuAqRO9jlALXgIwWlCzTEhWxofBsLPB93aO9Igs0B5UXYPAkCe3xcuyjVjUzCBHtkDq3ImfF74iVKqpf8NNvM2RbUG/Nf8Gw0HXOicP7vofFq1diwqfREC9VJBTEAWEFEI62wN2GMyObS+sk7LyQR5w6MUuJcFcUeRboG70oPUzRa8khRJU8DasW1jOGUjv7ILSKcNY/jgYkW3fxN9xh1UtXEDCGY+H6bb/UuUlfKx4XJslDaT5OYYNAwy0GLrapybCdJfUjkcmkIvypFf/gWdqUs0eEE11W6v6NYqkwXg+8alS6ERVLT1Mrwp5ScokdgMUYt0lIkZTRkwK8RPypbsjbURN+3jTu+fE2XDUZMCkvuCC5oS4+G0+9WrI+QPNS+qC7qxtNVea0rWwhLE61ysXV60+JZJFAfQWar7XbhSFoxABOcickahjLAN0AAtTRqP9/ZGpW4hETvJSdiUSRmE5k13Nshi5o75pP6pfJ0HtihFzgTVpbm8m4PM98yR0KRWFZYR/kOHsWkczys92dY4YrRt9G9Mamwixa3Qay8MerJxYXkiOCG7csbiLEG35/Q5Mpunxl4NmxvF6I7dP7JzuXOhCc/o0NlilsJ229ho9A2NQSMLBPsZchn8c1KRls68HgCaLjaREoGzwjx+lZ5Ec8Bb7awo7vw9SbarCAH9KQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(23010399003)(61400799027)(82310400026)(10067099003)(11063799006)(56012099006)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AmvjzqkOfgaLIje382IIG690w6fJQ3COlTOFPbnVOUkgww59opZk0F+0XZkmgNCN9gvMScFneiZMqUVBm/vKg5N325Bj0EghAXXPw++zeuxc/UzMJmvG4tlfYbDLZSS2ucxxAj2dmoDH8f+VIXKq8sJnjXLF0JA1T+RNyqXbrQBDegiZ3dNRLUuEQLWUu+COZ0HiTedbMrg0wJE7rgO56M40S7S5TUTd72Rr85wfJpTfqVWLwfVOObol5EDZ8WtJrquj1Qgr4NWSVPXfUxqV3baTurhbWMv8Hsi/19n2kI0WjZ3Xto5nxYdoZO0WQ5UJIfmXLq5NWZyhcybJVxaJQAEiQ0oVL7amEAlp4jdQwO1GS4JE6eB0k5qDFtOtBstwlErsLs4R8XlJ3/onDPBRhaPZCqNKXwg4m5x99cDZB8ZKcLNEuADStek/kCtpArPh
X-Exchange-RoutingPolicyChecked:
	EML3KV+gR6Ot311t9ouytcWF3lZaB31e6DsqtpasZYISiaoBb5x5ao5/sGVN0yZWGS+f/z8iVVrJjrJMqYLP29+7f9hwJvt8dK0h3m7IqWcm0YOpE1eS5HaxDaSFjQCBAzZDjn0Wo4umRsk0pNzT97Be1EKkpiSrzgeCUysI5jTpFmxcDuXpYsts6ixzH4SfFADFdQ8lpha9o0r1Cxd0DVGP3A7+VJmu2sQ8HeWQHaXVQQeQrrgNqYPwGdG3ijdp/KowPbjo7/DJ5OnbAr6GET20PrxjGF47BYYqFJPy9HV9cDZOcbGtbzDBdjCZM7Oo+aI1UYl6RZ9YQ8/nGAYoMw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 11:59:02.5093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7735186-11ab-45e4-6a62-08def21fc6e9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8784
X-Authority-Analysis: v=2.4 cv=ZK/nX37b c=1 sm=1 tr=0 ts=6a71d40c cx=c_pps
 a=72vqVjiraSETVmPwcAq+qg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=dw-OsU28a7kUvvSaYqQA:9 a=CjuIK1q_8ugA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: 4BSHh8U9UND1gomy7XgjCrziVP9bKH81
X-Proofpoint-ORIG-GUID: 4BSHh8U9UND1gomy7XgjCrziVP9bKH81
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfX+tlFbtqerO+9
 S12FFMhXQXlfuFtQJbMap2PwOxkxlhbOU1PN0ULgFI6lMeYFCm0LTgN+RbGatfaUsDH0PlVs/y7
 okfkxKLn8DGanFe/wZeUguu84ZRlwLTqlOYauQPvnTCxDPS5t/ZBguBE761uQ3+th5cF1AvpQqb
 3APwT98jlNz54TIzmK8qwUphdIbl5HQIjKq61zlL964p5LEL25KtctN0lBvgabxgPdD6QM5Dtwl
 SxlKc5DMsW5kGU2NqULVDgaOQ0TJ5paLmCcf3a7J2UoZR/rgklnCB80k+kJL5E2O5PQEJIkUZM0
 MB0yPCcoKE2sJm/evMxzoGWlc/WCuo+SRVJKCqaXlx10ZDpZB5aNF7zIutURZVDXx2z91ydwFMw
 I3EgDNAm7JxdZMmYSyOVnuPHo2fbatTB49NvJIH2VO3iu2AlkrcTn1kV7xHlE5KjAvA9HfqRRV3
 /tUQgFSHpFatAsFKIrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfXx6JuxcrM6gpS
 aV3O3w+YDhbUm+yrD9Zd9dZ0+yFblqQKu5Zrlo6wuzpxax80a0JbRLB2nLi8pU21jveuGBrp6ZB
 k8OhtJWfQXzm8Zgr3Vua8fS9W3mpDus=
X-Proofpoint-Spam-Reason: safe

On Tue, Aug 04, 2026 at 06:48:28PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch adds the initial SDCA multi-function codec driver for the RT766 and RT767.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
