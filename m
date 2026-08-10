Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E869C63CB;
	Mon, 10 Aug 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358650; cv=fail; b=eehMHemEBul/phtSXD0Q90YDw6gAhLnzfx+Z4DTZdv/u8eUx2uTh/sE0WBCWCJ/UiHZDIkV58FDiKAdA+VgWHpt/5EBxIe/cNzubmNIe9diAjYiUVvcCjF9iuslut3RG3HC6jrzoOlvLzng4vE9GrXhJYaJnMr+cDsy/ecCPAac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358650; c=relaxed/simple;
	bh=/WOnTDV5TMow/of00MJc6itnNbvrcI/r7DTyjWu58Yc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZX8NwtnM7X0lva/TyVBunCBQewN82V99eh6KYCWqRlQkxRiplXZh1MFoqyhzlRo/j5pIMGBju8CqCzS8b5P6LcdhMBcmNOTFIHSY31oJqym1Guxz0xQ9l9AuthI9XxKteuQ0SAvMmZOh8dMumtH1N7WaaXotznqeKVpsjPPgOtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YDwPgUnW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rH9R5Sll; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YDwPgUnW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rH9R5Sll"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5BvxI2119648;
	Mon, 10 Aug 2026 05:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/WOnTDV5TMow/of00MJc6itnNbvrcI/r7DTyjWu58Yc=; b=
	YDwPgUnW3gOTI08ohK2VdXcTa2IALaoKWkHf/YJCl0QGy1OaeSPPCodsjpKH+FpS
	q2uLmw587GlxKvKpirlTKs7DQSL9cLJypL4gDuLVcb4Pr/f7B0HhBtslx9tdy8QF
	KT+dEHyHlu3IBFguqmviDG1WsWllUoDFpXA8DBkNAik9agYPJ0zP4cihI0fc7fem
	VcDcbHPsHssyE3xwToMn7nQVbleG531XS92H6/91gNwaHZCGsHZWQVpYJgeKQShC
	kl7j8Xa0D2CG1LAZCOFiqY5gL82GjdJaltDoka6hHXlO8RVYPsbUXG49EAeq6DNL
	6bFD4FCdT3ac3BqkzN6o1w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023083.outbound.protection.outlook.com [40.93.201.83])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fx0vg2eg3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 05:43:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZUM4xxOnSn4+0FHfIBvs60Z095dLH8LRdj36lDCcs9VYjpl9VbkWGoHtPvdG7JL0Hcls5bSZ1HZRXsFFyllX0Gdxjd7ezWYqvLS2j+AH3P95yivlnbueCyIQB32dovVcmUtynz7zlPP7rKPuWKsDTS8MlSgEKiZ0l+jBb1rW/GXNNHI9Xbt5kUjmF4fthJbHNGXJHcJfwT53rc4fNQUxbByU9e+PmXuE6GO+GmRd5ocmPvDTezKkwsslPVhkIcqHEZx3YyC0nv9Yw7YFEvDq9kjCAv2NWEbu9Vce5t5jUiO07kT3OEkQ+WivNgFkuGZHtcXTybFPAhB5UZZ8mpoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WOnTDV5TMow/of00MJc6itnNbvrcI/r7DTyjWu58Yc=;
 b=Gg1rlWdJPO7jOxUVSFB/yGqCkIwAB68WUg3CNAjIFvgurWmqdOJIXsv6YCiclPqxzVYcfhKczqTYKomLp1K2FIBomRWGlj4KJVLYGvEpf2X9XQks59iW/eI6dIxcXuhUlB+w9Q7itjhwCFjAEvc7UojbBXCoTM0w9OOMOedNACVum+pKS3oSP7AC0O+douD26MhgylZJ9KohWPJZCItK81Of/gNfS4ILyqSgI1fVnsN2JKnGx4XeOOvtFLSnjsCZSoGutD0/4qDBflKULANBZFi9n22mAPyN5Pu5CRp7ZWOde7Smxp1RdtUYyw5mfpSLeyUWVXD3hXbefIhwAKmoGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WOnTDV5TMow/of00MJc6itnNbvrcI/r7DTyjWu58Yc=;
 b=rH9R5Sll33a8pOL0KXFKTbZjY5uJ3EmNFURYojBjEjv44VfU3PuZll57OJUcVtXb4nQTRsv6NYHbDC0SdChtrnn2jrvtnTwrUMEOvtKIVVhvTMPrneRfwTfEbLqgFWsUW+zvCQ6u3zo49V6T/WyIJZ1gPppOMBRiC0OkRH+jKfw=
Received: from CY5PR15CA0252.namprd15.prod.outlook.com (2603:10b6:930:66::26)
 by CO1PR19MB4917.namprd19.prod.outlook.com (2603:10b6:303:f0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:43:45 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:930:66:cafe::14) by CY5PR15CA0252.outlook.office365.com
 (2603:10b6:930:66::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 10:43:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 10:43:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B0910406544;
	Mon, 10 Aug 2026 10:43:42 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.35])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A1E5482025A;
	Mon, 10 Aug 2026 10:43:42 +0000 (UTC)
Message-ID: <c304c661c9c2f38f6e5e73ee4e36849d899e9368.camel@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Add missing sdca_fdl_free_state definition
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Luis Henriques <luis@igalia.com>,
        Charles Keepax	
 <ckeepax@opensource.cirrus.com>,
        Bard Liao
 <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,
        Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Date: Mon, 10 Aug 2026 10:43:42 +0000
In-Reply-To: <20260810095512.27087-1-luis@igalia.com>
References: <20260810095512.27087-1-luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|CO1PR19MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: ffac5681-853b-4ea2-2c7c-08def6cc405c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|61400799027|13003099007|16102099003|18002099003|22082099003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	5BQajKLC5Xc5NLcLRTYams8hWvLbd7qc/lEelI2tQ2hzafpAo7Z+/TkJMu7vP3XSbAx+HTKE6J1po5RAiHENZqAsNuAg5TgPNlJ4DEYuQDW8vzB5W72GDEnzQLT7lcld2ScHgNtyP+33HXQ3yBvXHrErtnj8q1sm9kgmOlFeMtAk+/px08EWyQkhQlzk7HVKSXJe2+j0WdsaMdfublZEq6hD+jFkPAIGImWc0nnh8/lItKz8tmZCFBkKTh8y1xN1JVF82HhS+KljGDTSiIrsEqeF/17uHhvLHF0duXreiiqO8R4tf6foRprevJrUWlIhh7vkwATCJRW41/cpzzIjrq9ZHVaZ4zhslw3ds37+1SQ1EOdpaUYfP92vqyq11qzpEoCE8lVKvO6/3GGii2hjO7UZOQFBLf9cOhjmhoV8gRmw7aumfhuF5blGYApih6qyC3R5/giOEDIIzu8z+cGT9rKBbISGVT/Iydk6Suycva6aRhYRKSR6qP8SREW7DDrh3JFMHXrHFSYnQ4C+Le9NRAONnVVAzqhIDllDR8rozBo5+BXdnWHBg4PaUXnFr5jgpaamZGw1O4ahVy70q3pZTGZpk/SMeTS29MBHOM6NTGTcRjShXi6lXxD4KxQ4anZKrqXtCYxFldGX3xCv2bJz2dNtgzuKpV67wCsNBoKT0cS+pJHyB8Jy6NXMeYVLhfNVYIvMWBa7x/1lukatNuVeeg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(13003099007)(16102099003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YwPwIGi+UcUkxQaQvBdin3YBbcXphiL9JJAfJ19cWGuesJhu6sePME8r7iYF6K3gBvKB8MXRCCDfJHy7AzEi564JoNSSTkz4phZGvbn2Nq5U7LMSbuWqyMEKTc9DJwHs9vjApcRwfYG2d4gaT6/6Uyvu9Dz9L1EbdncmxRQmCw68AYKkjCcZXz48ovVcg+uIMpJXywHEvDqTC5CykWMTTDaBXjtCiX1r3VEhw/+goGH0lb3PGBR7e17jPeSBO0lRGaZE5+LF/CSG+6Ai9IAJLm6SmLBDA5DR0P73KeJAYnvdOoCSl85x9IrsOwhHxuGHAVUzz5QFPIP+yVjaDcYODUH4jEoTQUZH0iFWuBH09JyOBAaO4fbCIsL6QLtOQl/BSEWs5xUf4Tt6bUYz/tINSAAu77rl/ut6HqcDjQ5vtPgsgK/j0SgtsmKjyPKyZdHF
X-Exchange-RoutingPolicyChecked:
	Iy5tswdjz/ZX7+Uulbm4NxQ/kUVFVToStiWGgbIXIlTpKtULZBATBxAwlkMsvjmmC9Sb8Th9njXLYmo57slBIMCncmMpmlDIxS7StuutI2b0TIyZEgTlcWrk02i6VeIcil/AmHrMaDuTqB3t825ejlu3QjTCejVx+OOxkxGNR3aqi4ev2RcKflrW8/ahPuyZmFnT+atFmbiF4wX0DfAUADlgFLrXTTh0hSa4T2F5h8NRdpYmCyiM0K1Ve4sEde0o3cixQkcnAi9UJ0Q4sNCfxO421FFxGmERLKAxcU0mLol+S32rfBB3yRwmFza+zvKolr86+GjBSdBKxJ1X6glpgQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:43:44.3818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffac5681-853b-4ea2-2c7c-08def6cc405c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4917
X-Proofpoint-GUID: IJ_gksmjUIGfNdA8epQ0cQOwnB7O0buu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5MyBTYWx0ZWRfX/amUUNSekjpJ
 ANfFiLQ6aKOXKIzvbAC0bLFt5Vz/LIlOPgWNFAa0LSl1zYEGi0gOBfHSAv2r3cuyj2q6v58aWJv
 zpD909Cv1OxfOFyg/X0b5TBCembBpSw=
X-Authority-Analysis: v=2.4 cv=KaLidwYD c=1 sm=1 tr=0 ts=6a79ab64 cx=c_pps
 a=Kl5DSHqeMBbv3ZYbUOuQHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=zC11uNXOZ1cbLHO7jyYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: IJ_gksmjUIGfNdA8epQ0cQOwnB7O0buu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5MyBTYWx0ZWRfX8VFCwmLAupdA
 0OewOTB1NMg6PfJpbRCDJTe3vbRCwGiDBr8ERTjOZ2IJCh3B1veU7KQXGmqmY82og5Y0HfjjD11
 WFLbDUWk5YKbSuQggQey7WOhh7ta8wX6/WHJxuEsLLJORr7TmoE9wapbvAI3D5kibbTlzRsQNtp
 gWCE0A9pHVh/eLhyGVOVOVL1YbfYLODEdo5tQunFDmgkxANrI9ctH11lpeJY27+ypN/1Hw7p8is
 TgFOrPetYTSFpyCPMJVIrZxQ0Wvasz3JsnY99FpskusmhP8ALTesz+ZQaR9347SgL8WqeS7R3e7
 5rth3Q0edj6tys1aqkUFsXCoW2nHnoCC5Vdoe8RW4J1PLDARJdjzwF+3o038xDGWcERntWdN9vj
 6voIQCWLrnSI7K5eq02XekqSj7oM9pQhfd/DwAmEf2AG9woOCeqitHTvhB2YpFQVRLOxZXTA9UY
 sj7CivGpTCkwj7FfIgg==
X-Proofpoint-Spam-Reason: safe

W=C2=A0dniu pon, 10.08.2026 o=C2=A0godzinie 10=E2=88=B655=E2=80=89+0100, u=
=C5=BCytkownik Luis
Henriques napisa=C5=82:
> This patch fixes a build failure introduced by commit 0880082c27b6
> ("ASoC:
> SDCA: Remove devm from primary IRQ cleanup").=C2=A0 It simply adds
> function
> sdca_fdl_free_state when SND_SOC_SDCA_FDL isn't defined.
>=20
This was already fixed here:
https://lore.kernel.org/linux-sound/20260730130602.3747053-1-ckeepax@openso=
urce.cirrus.com/T/#u
--=20
Regards,
Maciej
