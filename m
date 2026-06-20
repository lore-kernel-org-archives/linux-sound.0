Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724A3319851;
	Sat, 20 Jun 2026 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781951289; cv=fail; b=ZHIA8d5jXZpTIewjAzKw5RG4eRr31IzFFJNLwD7KeQmGv92vfYs9Hag0gN+uXozUyHu5UTya1P8Eg6LKBxKyD4CpIQOVoRUEdUr+kLZ7KHIxZI5zS78aPUPjleI16HYd/fKdI7HIYJzSGh5t2rzhoSxEiNt/DoURoBPjUA9kWwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781951289; c=relaxed/simple;
	bh=jV1hosOtDLJvvJalqFAnVJnzh97nrYkJFkNFhdkNofI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mltM5TA4MFcypa2qkbAu0S95CFiDLrH2GT2twrnWtqGvScxGloBxXNtE/eUZuTuY+jmIG3mOXg8pZdU6QjP6zeZbQ6J78GC3A/jHXUmLfJiy/XjY7JfHHT1qfSkS+HpYHCLdB9PyLBOWGA1SvQnoUy+9+BoRkutBJR30UjbcRvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K9z03wce; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NQVBehUp; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K9z03wce";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NQVBehUp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65K9Y8Fq2737852;
	Sat, 20 Jun 2026 05:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=txt38Jag5bF4dpb1CS
	RVyBXg0hb9/SgCq9kK66Yftsw=; b=K9z03wceLzJ9tq5oZ0uU1Kp5cow6WI1J4v
	SXBGnf5JM//AiQEJeDjBo+W6GdgJ1N4llhpf1aNReK1fBLtBxMoifIb+U2g1L61n
	l1UTVbh8DVMyZ29uGLsPsiGBq2Bbg/pASyq939U16NW5bAyodLwHJTXjtOixb55Q
	7KRSWC9MUrukR43bfHIcDH4j5j/hvCS4VfvRkUtvo0e+2sCMxP3dYcdtof///Fm8
	2wlaVVt621B1hzO5gTJKYAmSmUqH/tOf9uOBYuMNba4hUS2mPoMvO4/RJEY4oOnr
	oIAUM0wA4ts5ZfnHquDEPGds3F+7OGDthl5gQQkbBrv1U8AqgP/g==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021126.outbound.protection.outlook.com [40.107.208.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ewq9jg39c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 20 Jun 2026 05:27:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpO84InIveK/e8tYFIXbOYT77dYw0gMUDk+NtioOqKladAqakRfhaNqAuK07G2t2oLnb7YqnB8o/UhGem8xaOhOHZUbZ+Zt+rN77S5Q4FgZ1QKSO/iUpU/jFvdPTLgJgO/JT2jDXsOReNu4z4JWW6HfJy0aLGUxA0hUNnkj6/YqnlrxN8BRaB3MMFKzlWt8TrlqqjDcAqDuNS9OrNDM1f8NGe17hRfqG10RJBHQZbZmLum7Iey0+yiHY84zGcmKASa5nkQBl2BUypDm3hAKHqT6QdHgvEbzNdMsdBfTWCHFyAYy9NlzIAbfUlBL2LJVxjIguEBY4xczMAYN8hBC59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txt38Jag5bF4dpb1CSRVyBXg0hb9/SgCq9kK66Yftsw=;
 b=pgTpdB/eh1V6M2ObNEOjCAK5texrTUwhEDtJW3rNV5E3v/SgZ84C2ukkjroxf5wC//pEg+gWi5SVO3/J3PF+j1qUMf97ep4PBpWC6z5NHLY92EF8UEFVV7nADn+a4GpnZYq/Z+hdX3rSHPrGNclJVzS85nUMaWGmPwoMTUQYBmwdR6qqzPcmjysmif6x6s0qAQIgc83KIul11ZGAoAyMaQlrp8oGFo/gVKEvTiY1/GQYpdMkRi4MaCVSt8tuDEwUnT9rI5QylcIsYjOW/NdB4zkl6szC00z38iQGeQos2fLUhdFC9SK0NZD3lm05d/RxJWs6/CXmxdA6s5vP6Hmaxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txt38Jag5bF4dpb1CSRVyBXg0hb9/SgCq9kK66Yftsw=;
 b=NQVBehUp1pWGqFyCBXLUaE8vqUNaF9/f43ZnHSDgtb2V+ryCOcaa6kgXA9Fy6SKavIcuBIngOutt8N1WSnpSdzn8PlffdcPv9i+qlfbbBTXKvfBWANQw2oYHbAEzdNZvWbDfEHtk9F9tcxHXgZxfU3WRrx5TXK2cqecnbt+Wy1Q=
Received: from SJ0PR03CA0286.namprd03.prod.outlook.com (2603:10b6:a03:39e::21)
 by BL1PPF8CF4573F9.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ebc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Sat, 20 Jun
 2026 10:27:47 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::d) by SJ0PR03CA0286.outlook.office365.com
 (2603:10b6:a03:39e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.16 via Frontend Transport; Sat,
 20 Jun 2026 10:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Sat, 20 Jun 2026 10:27:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C4FE6406544;
	Sat, 20 Jun 2026 10:27:43 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A51FB82025A;
	Sat, 20 Jun 2026 10:27:43 +0000 (UTC)
Date: Sat, 20 Jun 2026 11:27:34 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Paul Handrigan <paulha@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs530x: Fix expected MCLK rates for CS5302/4/8
Message-ID: <ajZrCNMpPoln5Rzd@opensource.cirrus.com>
References: <20260617-cs530x-mclk-v1-1-0215b5f1a0a4@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-cs530x-mclk-v1-1-0215b5f1a0a4@pengutronix.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|BL1PPF8CF4573F9:EE_
X-MS-Office365-Filtering-Correlation-Id: aa97e4c5-a6eb-475d-4ac4-08deceb691ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|23010399003|376014|13003099007|18002099003|22082099003|16102099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	dVq5PzRw8OU8yoi2cUUYOocJTy/c64FfJleKXBQWAbO18gEl9S0cfnatsBdr4sAxQSRAFSkwkYGrFToKfHl+r9j/mHh7q52IvAEJYHCSFMhSIUqDSORFhLxNBQM6/0PMhxFb6s+twp48sItojLSpqEOy/qGnyI4L3jxpaIY9TUQal4gnm0k2ifII8JFwhhwyBoXk/ggCrvTbKHaNbGmB2tiVB73R7/CZkKAkZgNpccWC8znrkjnR5HpPAMQaI4Omlw2Vrf0Ose10+1Batgvgty9v8APRquOpIfBUM8i/r17CTr9N3pkES/HasSliTr4TbvxFH+vb8G3Uo6r5FX/9ZMdCmN8cMyfu7Pm+zA67MdDjYpKw4IUuJMXWIeO8F7dRb1UKSEz8WWpgOXHAH6c87l4jaOjv3Lo87CYCYpFiJ58oSF5xjdx/WzKLaU6w5JKDnNDsEIG9DOSXMXikBYdaXwV8abI8w0+VDHHrEe9T7uWAD17oOk/AyLW5yFX6STvlosO9/K7nPLY9bMdB9hW3f403CoZuhb0dueTusSzOGmmYfanqi6su+NKiQj9n4TSEhPuf/w66I5KhXWs3gDRCeaWd7muNwg254y4pe6EWZZYxHOPt+cgG9yIeaR0JyLbRbcRhMYML/NPXXwVS9DT+1AY8WKxwTWZa2YBMXd4/KHg=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(23010399003)(376014)(13003099007)(18002099003)(22082099003)(16102099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nxmDm64bKhBmIcn+8FW+jkJm1N9rzqXEjg9mYWhpjXMac0yQ/A/Ie+oR4J9bwwg0wRy5tI9qkgwggtrYby91UR1W+5mRANYJQ4ZV5hn3fXknhWzD0iU0tf4qxYlVF+mV/jTnXU+dTGDWAm6DK2q/zGrjsDdqAP+X1WzzU3bLfF5fUOcHo1kwLT5xU9UTjsJIDejRkIYfbkJJuzN0Y4XvT8ST7qklhbIspep9TzdNep34pxOe/mb/wN9SMaNUSJowAWWn9hgrSXbzGsDsfY6nQf/ykO4X9Bo+T2zWvpiD6zUZiszpTwuU6CRO8cia+YFVDpw5LDoBTrzWR2QH2qRDMVlgErMlOAg4fp6Lkm5vJYDNwQe8Cf/uMpQkXY1kES7Jvku31Lb62KEAbGpsXHWdw0s+CbcLcK/Py635PV1h5+ye5A6Z+ygEFM2kAc7ieFG/
X-Exchange-RoutingPolicyChecked:
	QJKOPyapEFRpDY73aod0jYJi/XqZTemBv9A8JV94SudVBi8/srMoiZ8So5dJpi8ySSDBthN9BusFQXydpPOjxq4t5RjAf5UMJ8ljdRItf0cuSu2eRKiK6utCml02BZcm6r0g4TVt/g1YR0RwrMe85WZoQzq27sZRyiS1FLHAOucaI5huAPRoYM+j7NMSrUAPaVvGYKeV4VcxgN65+U4dzqww92jS/KDTD+XDoHjrmQaNVFD2srQm6rdll3q8oYucJ9CpeXUtMHJsX9A3KxGjcqVs1uCoIKS6zwjRqIgxOp19yJEXCZKWQo+ehPilpWDk/VPLvTg/rFjaEt7Zh0Kvdw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 10:27:45.7577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa97e4c5-a6eb-475d-4ac4-08deceb691ed
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF8CF4573F9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDEwMiBTYWx0ZWRfXzO1/TQpmUqZB
 LBcUSdWppShBWFbD7ZAAq1tlrDcBfitdlWUB39jYJCNXy0eW/Wu6+nKBYO8ruWCmocs9XccB+Y9
 10UzoGvIEGwrRf+T+q7ZajbDjs9n2qIoTa1FhH9HUpUhMPxqSowUOhuSaCzZq/S2E6wLvJ71Rwv
 lq2utPEna48z2ELyU4+zRs6jl7Xsv8jgBph1iPQn5xHOYIcWAUJ6c8ZP5qId8jLJhma62dJfuNF
 ZN3MyTzdtU/KhRlxgGs04YebwhuVG0eyttXqS1XbTvB+HnTYf8oq4eXT2aZEMJbh9X/2+RYxM4T
 9VNzt+pGV/g47EvuwD57A8FrawLiPYJmlOiA/cfE7/RjEsCooseNeZROvBkL5NeuVfK7gr69qCo
 K83jhJ0Rof3peHDlM3ZafMT3fsrfGsetcmfO1PSoBUHUDJ9Udf6JWcSSqGNjoXqAQCRnQVK+abe
 42C9QGxI2F1nFRHx6Mg==
X-Proofpoint-ORIG-GUID: ghzvLYjBhP9uOayxHQf-MLasGNfwWHJx
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a366b27 cx=c_pps
 a=cnhvvNhNoe9VuZBm3HgdeA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=VD4S4CnHTOjTc--CHOMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ghzvLYjBhP9uOayxHQf-MLasGNfwWHJx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIwMDEwMiBTYWx0ZWRfX6VehVdFZYr5B
 VxlmodcVL8pS7XwbblWYsADJBOj5hvjIQvi+pOURh98POgDA1/23spCx7bmvNTzaS9hGmJmZTkT
 pwcp+c3vfkurIm2fqhBOss9FdhgU8zk=
X-Proofpoint-Spam-Reason: safe

On Wed, Jun 17, 2026 at 04:47:53PM +0200, Ahmad Fatoum wrote:
> When this driver was first added, it accepted rates of 24.56 MHz and
> 22.572 MHz for the MCLK when PLL bypass is enabled.
> 
> These rates seem to have no basis in the datasheets and were thus replaced
> with 45.1584 MHz and 49.152 MHz, respectively, in commit e7ab858390f2
> ("ASoC: cs530x: Correct MCLK reference frequency values").
> 
> While the new rates are indeed correct for the CS4xxx ICs[0][1][2][3],
> they are incorrect for the CS530x ICs the driver was originally written to
> support as the MCLK frequencies are halved there[4][5][6].
> 
> Fix this by checking against the correct type-appropriate rates.
> 
> While at it, drop the CS530X_SYSCLK_REF_* macros. They arguably confuse
> more than they help, especially as they are not applicable to the
> cs5302/4/8.
> 
> [0]: https://statics.cirrus.com/pubs/proDatasheet/CS4282P_DS1318F1.pdf
> [1]: https://statics.cirrus.com/pubs/proDatasheet/CS4302P_DS1315F1.pdf
> [2]: https://statics.cirrus.com/pubs/proDatasheet/CS4304P_DS1316F1.pdf
> [3]: https://statics.cirrus.com/pubs/proDatasheet/CS4308P_DS1317F1.pdf
> [4]: https://statics.cirrus.com/pubs/proDatasheet/CS5302P_DS1312F1.pdf
> [5]: https://statics.cirrus.com/pubs/proDatasheet/CS5304P_DS1313F1.pdf
> [6]: https://statics.cirrus.com/pubs/proDatasheet/CS5308P_DS1314F1.pdf
> 
> Fixes: 2884c29152c0 ("ASoC: cs530x: Support for cs530x ADCs")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
