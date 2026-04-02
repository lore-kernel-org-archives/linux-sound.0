Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C563A372EEC
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119750; cv=fail; b=Wx7AMBcKHb7uqrQnbx3niDqkfrBkg4iZHYGdzGcZhtdxXQtnJVitzy6Q/hWfMsDTfoGEuoISe6jWFaGazMA/gzHGj6bPz4du4ppx7X5yWTWT2j+VuQWabM2vfb1mF/S+FQvuivCRf4lO/9PwXfWHPOIoCphfYhTyRNDHEfbPpwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119750; c=relaxed/simple;
	bh=Rnb1n4gQtJTPlDb6Rhr81rvqMNtfz/KDTiNyVbTwwFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5iZ2a1KmLkkHmx74hi3qZvJ/JyA3IQUTgS8EabXRTTsIgueLem8ZXTtsbZB5/p2u48Hsox5mIA/RrULyWQzuF7x7yvcDHWmhCKo6Kraap45P+OYMRjbbxgQbfLLoxr7HufF9nLoYWfbYtx9n5me+syxzcKw4deGwviQUiEJtWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nwaINUhL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mha8x+th; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nwaINUhL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mha8x+th"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6322FJw52963751;
	Thu, 2 Apr 2026 03:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=MdmUZglt+BoCLx0mZxb3QPWEOnIvtNEinB+ImESIm5o=; b=
	nwaINUhLaATgGuh758QOk0zRIBpIPXa3S4dUn1bBDP31sH2zyHOXV104ZI3esDLv
	epl8oOZNtAhk7g1bUwCFDeV8oiMJrZR47uHBFxWv21z52r07IohV/K2z3NGKftQu
	FUO76vTpJfBS416ApK+2FucrPmhGLHPImgYxD3YjhJKVVpIlD1IY6oSBTZgesoB5
	5RxF7NXwEAnVfTB9h587VD7Dl6QoX9YvpzGXkJCq7QciXUwhdFmijW57Y0cRncET
	zVDjBKHtxGrKS1IMef0sa82xvhhKHosWHtupfX9fpBcf6n95Eu0fnZjkqAvFbXkV
	Ct6V31H0wsIgUjtxU3M2/A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022130.outbound.protection.outlook.com [52.101.48.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d6ccxx2dx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 03:49:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRu0fGtkFOfdc/Tx5HErQgfaW7mMQtI+pTVDLoZAh+ObR/LOGhBaIfgz2WWyn0ewY27opSGvO/lNTIpeNcipi+ADGPRN4rmMN1rD5vNvfcbLE+j/0tEd9GM1cRTJqfCPQkNBuhx9TwIUcZmcx8oHcV/ZxJl1Uq7QQ1GA1UxwEN/UR6gmSnUONO+rgIAtQiEEXJTKg0y+MAGxKnD2P4yBPZYn5kr26rgEDDjr24LEbvNHail1D0dPozX9dBA65hl1GuLYFy617ELj851CApE4retLILoArewQiZPqORuL2FhhilRrpZmzFrCI5UEYNM0JWtdJuUo7WG0mzvzuXDuOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdmUZglt+BoCLx0mZxb3QPWEOnIvtNEinB+ImESIm5o=;
 b=JhU9ouXpD99QeLPqvuOTnxLA4fBqys+4/D1bEkjVa3GGYsDl6c/MvJKhan/SF44dTwibwzvLvqdEcNKbUtS+PUdS8e3hstRlMpl65c/ctIry0qoXEyGrsl/JDXWggDiWfojv9SEt2pkNaXLYaFViK9FHShntz9SoNljDbdRTd0Y1ilbIK18t23cnhDuFoUyqSrDiCOAGK3tw8QOGqNBbw4WbIlSGXJCuqAp23h/tQmgiWoqjyR059p2wiDlxLAlzRxYir4h+G2g3K+302g5EJP8pIhfyP53XYCLqfICYDz8xRbB0ZJli3Yb8j9495XoLWIrlOMo8FDLCoApKZZxjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdmUZglt+BoCLx0mZxb3QPWEOnIvtNEinB+ImESIm5o=;
 b=mha8x+th3lVX2pvzcyBLJgONmEHvPqq9ZnoDKg7tUgjV6OuSYZhDD7Yu26OkFlqYnNNDF+9FmlwEIAEdGr0ZXdQ/N42PZZj8Po1KoAtKfWwgRuyrFBEW3fBh9u3pWrnTwR6ipJ/ENB1E9z6rYoCBI7iLhObf7cv2Bb5kO+VUkAY=
Received: from BL0PR02CA0052.namprd02.prod.outlook.com (2603:10b6:207:3d::29)
 by PH7PR19MB5702.namprd19.prod.outlook.com (2603:10b6:510:1e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 08:48:57 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:207:3d:cafe::7b) by BL0PR02CA0052.outlook.office365.com
 (2603:10b6:207:3d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 08:48:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.0
 via Frontend Transport; Thu, 2 Apr 2026 08:48:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B8709406540;
	Thu,  2 Apr 2026 08:48:54 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A6B4882024A;
	Thu,  2 Apr 2026 08:48:54 +0000 (UTC)
Message-ID: <eb455a0a-2944-4509-b1c9-41bdb8366295@opensource.cirrus.com>
Date: Thu, 2 Apr 2026 09:48:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mfd: cs42l43: Add CS42L45 SoundWire codec support
To: John Meyer <jmeyer@fdma.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Cc: ckeepax@opensource.cirrus.com, david.rhodes@cirrus.com
References: <20260402001045.16933-1-jmeyer@fdma.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260402001045.16933-1-jmeyer@fdma.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|PH7PR19MB5702:EE_
X-MS-Office365-Filtering-Correlation-Id: 720dbf56-7ff9-4e1c-c716-08de9094acfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|22082099003|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MQyw6v3kh4ceggxOdfK06+0mYI5KRnAfXQpJbBg7gz65HoAplZHJ+CymJz3pThXHfU7XVO6BfQCA4DgXGvxBZAqa6R21o+twvBU6M7hW7MagGKyBwws30JbaS+fonvVpIyKE26NsG9t48n4ZDH1HQF2fRUd/mnNxGrWGEMIJ+0/7MjIr52kylqlmy6Cgu3hrvvnxb1ffn32MV7r1l9sY5qi+DhmLlAXN/ctFiicnF/cfEaT/4LSdskdVBxpidIAlCWZtHRa0aUO77nG2ctHOBBVgoKRjqNlwUJvued02/Rgmm+AFCRMYs51/g5KI+RZm4jC4Hhb8qu4jQ4oOScZ7QyLcUcgQ+Sih8L6ZTSNnOTKzxif7RxvYcKOhoLmGt6K80/Szp7wDg9eCz3TBTNAFmzeBf42qTrnq0mB0zUtvKCC3OeAPvAfYGO5kjZGKZFmqwbo+q0t5JtYk5eUYH/IxGnqpaWm1vKwuld3mh61bEQwohxlcVMafY8k3xCk9CXxZadK3aDMS9/4+k87krWlLTBfJwEzXK99cCCPaDKq4VpkF/B16yCLcoz64ar03LVGzKEZ0NuPrqkRIUvnokOuIAOtOJPDZWz3g1ir6rRbSJ6jk8gow0mQ3WlAj0If4jER3983bH2R1xoJb0FKcSxprQLcnWOGzUYV4+lKnRnxHIRcZV0FCZ1exotAcnhclP3e5x225EUbSa1fe0A44FzMTFX2hZB6ZNU1idtkFBTOOMbmuw+nSXv2plmmlJRd3IwWggYfMqqWrxgoGXWHCWhmfHg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(22082099003)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	77H1ZKeBgirH+tKKdqDpuAIS3g9NQsDQo0imhBmYM63UiP/fvCpS2pLgLhbC8nz086Ihap9m9cwojYwQJEW8SZpBTaqQ7fVxOZzL+WCUSqHSNBwJ9UuovLFJl6s3nLbshD8BlNULAdj1spSbx7bRlsfYrX76mNfuNKYy4UPmPrag8VH+eMwB+TiRuO7uUkc/2iVztI9qc78CpuXKMGV5gWxwRg5ZmH17tW3OF/pY4pJ4Y5HBoQCZAvrHnyVeXTUUixIqZu6NN6hhm86/T23oMqiUG7xvQDCgiyTm+liVGuP61qULRY24hEzsnS8lu7EwQvqFm6/ONPt79Niv/Ip3UD/hIUM8kqdomkoDHcBg8xQSG5L+jjB1Z//i0tyLGn+CpMxY470DtUnMhDDCJ9fgSuOK0Miqo2hwQhktw+8qjYS20/uwTV/le9lI+pqTWeBi
X-Exchange-RoutingPolicyChecked:
	CgJMZm3LYi6zkVGRr9V1Q89Fza5rDWAVsRyeimnf5qHpvSaFPRf5o56ymq7BIbOUDnX5tK56MzGqJsEuKEMFzi6EAS9XlaAx5hD10wQ/kRdd/9MruXGYSSiKfOZZ3HwMkAtYPzwXOLl8zPqcB3KmXO1CAt6OgATFLXyzIe6M0UUU0AQhEV1BePBeQ8U+8ds0E+Vu5fOq38rJHl8trY+JFqk2z+vX7wBySWJa/sO5fqozYyVpC0bDVvEAD9sE7VvXXCydmwhbjFJtEHWjPFlhNXttOZKA1TH/sYnC+PKI9Ywk1gMk2hpoSv6giOtT8eomhfuJx+w2oFtEfRMSWp+UUg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:48:56.2877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 720dbf56-7ff9-4e1c-c716-08de9094acfc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5702
X-Proofpoint-ORIG-GUID: 8e5cx98uFe4LfCXElHtjQtljN8Wvb7v_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OCBTYWx0ZWRfX7A0Jq6Yk1N48
 3TBCye2+3qNmBm6Vzo3ARVPd1YayJlwlA4gaQAS4J1uE2rVvfLZO5B+S9j782iLOGn7eoxH0+gg
 tLkk3aBcZsGDuTvtPAGOx7HQge34obsyGnVYiMRoF4GLfTHtwGDFcbkSTFztPVhbyaxxys1No9O
 wD6m8HJQUvg+DotfFGyyWdDiaGuqpANGngiZoje/1reFJ813/WOJ3KWIlkEVhrjVXufP2eREmqo
 ntJydWOAyJuaZYG5CJdlUibI5ezE90Xgkp2HixzWMd4aU1d3OsQp21hu26ChUHEvQOckMmnOgm2
 Gs5by0lrJ3gEPrRtLuJh13/cfj26bm33m6a+mRaw6wPNFDLTUo4VKkpTVi9y5BGtVBoJfVZCugX
 h4SKuHZI66hxpaGYxfw2GixV/kYtWoMK4VQQqAkswdKL8WD/9nXYxWh4dPRKDywpwuRnMc1I00q
 0dT2QxihHtnsGUC8wWQ==
X-Proofpoint-GUID: 8e5cx98uFe4LfCXElHtjQtljN8Wvb7v_
X-Authority-Analysis: v=2.4 cv=Xvb3+FF9 c=1 sm=1 tr=0 ts=69ce2d7d cx=c_pps
 a=5U2/TfBw33PfA2YBhd8Q5Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=B8Fw15YqOM4AaEte-c8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 02/04/2026 1:10 am, John Meyer wrote:
> The CS42L45 is a SoundWire SDCA codec from Cirrus Logic that shares
> register layout and firmware infrastructure with the CS42L43.  Add
> support for it to the cs42l43 MFD driver.
No.

The CS42L45 is already supported by the ASoC SDCA class driver.

Where did you get the idea that it has the same register layout?

And it doesn't share firmware infrastructure with the CS42L43.


