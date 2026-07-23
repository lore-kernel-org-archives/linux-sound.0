Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7002640B115;
	Thu, 23 Jul 2026 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801887; cv=fail; b=nA1hL92GmctTL+xyaJgvvSkl3H1MVXkk2ywMB7Cj2xWVP91gQojUZhnnB2uzB7QgwfrHW8Sy4XTe8K4IU0t6y+qJKyvguZeIUBu9JUAv0L5FBJbjA7OZVIPWvlKj0fdZtuKcFhJOnQug2ENy2Cnm2DQXNBw1HfvDYrPLBRccu+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801887; c=relaxed/simple;
	bh=ACHoYvXI52qI64511zetb29ieroD6tBojjfG8sp6cQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fuhg/KUl5PRVsuSZEg44bruIt2nD9saoVmxcSEQlBSt4juG0m2lJs0HeH5Zys3j3lVUIF9M7jAwf5IqcgAgkWA4xlHIwgL9NfIonCBD3OZTGSohHY6KPbT6/dsClT0m+1ylOf3jnR7ikxmeXAikwQJW3mlH15HmtjdurcQd8DAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jdW4I5wo; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Cyhmrsoe; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jdW4I5wo";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Cyhmrsoe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MIeM383530724;
	Thu, 23 Jul 2026 05:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=w9bXxco3eAzI52E1Vd
	5FOdCGeOgmkFSUSLN0aA+m4AM=; b=jdW4I5woCM1uYqUsqPXi4fqq9gJwpYIbcj
	xJrxy4sUYEtByIuaLEbEvd942vnI2666/NAR+6QwsK3/wrQtV7hKrZYB6lFXFw2U
	aqiDq90j0xBM9qhQkhL1/MdDpKrOnFFzZ7IHiXPzsrgrJCub5KDojXwkKeIq0B4j
	29zOTuPLDcMmnynBnaSPLi2P/77rsK31+GICI2WeFjJd0blkzIelAc0YqCeuYLyn
	t7unYQwvhdTkOorRZDRqqHhp3d6ps9FpqdTH4rW7M5Ti6DjnuFZSouMNBllrqTNk
	MY1GI+HZgibUhvvkqFtsLEX/TfCnNBnmOtQQx8m2A5xqFR3zilvA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021087.outbound.protection.outlook.com [40.107.208.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wff5xu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 05:17:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfOTBvxMEnrzx5r+wDBSchEo+iAFv/Yefi4/t9xUOe9yd94AtBcaJyTY/UltaPnQz6xMBUehfqq+JSfb4E1lAlXnfmfpQbAVV0K3qIER/szITy0/+KFU0NB05TQv+mbxv6RItjNROl1Swqhw9qB3dW0eGfVd3TGT3r5XlbdqtK9Eb3oAtAUtA2QOvkhA4qbuCVxEsVN3qT8W3E6DDuN2F1r1FZMzk3g98LbG4fVZ0Jrfp1IyKF578DJVgwDIp9IAJclROYkBiss4wXMKE40lly9Co3RLMMdifhX2UK3SoXUK4JoaPDPyhWbmW21ZBXDJ7Shnpvi+NWZ7wvsOr+wjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9bXxco3eAzI52E1Vd5FOdCGeOgmkFSUSLN0aA+m4AM=;
 b=G2QZJorS2nv9ctkTC7zFsLM/YZC6cKXeGQC/pPsrU4472+PnoYGEihOwZQ6NHklgBPaUq2gzWwfGuY7cXPG0Q1sZ1UKmw+zItGKVOZDMUmtmUjFMHzAunuih76sGdl/UPWHQN1QiZe8fG4DwfTsk2/lYZ5QG6kwGBx48rhFty9idOQmre2KJ5WNLvLcwZBMy14GD8cHqAFff90vqPLNVgrQ2dkV1bSqFBs9d+vf1U3GMRJwG//FjHNt0woSXjc70VjUYPacIMn9CkI72qrxctQRIHwdW15mX7Nsh7+BcDUjrcgI+QsPwymX19HAY02pqr5faG/OSwrq4Wk7w86kmAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9bXxco3eAzI52E1Vd5FOdCGeOgmkFSUSLN0aA+m4AM=;
 b=CyhmrsoeWMpezQUvhi0JkmDSBSy1r7QNVhRj2UCIvOBMTLVi0f2Th3EZOQ+fSQIaR+Ewv3L2C3/XiwVbBlu7Ju9BzIp+fcFDUIwd2Tu4FtUE/jDct/e2axrJL9MmPozlXQxyahXoTsHnrOmCZFjzt10cnx2F/GD5aptveQ5QrMQ=
Received: from IA4P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::13)
 by LV5PR19MB9106.namprd19.prod.outlook.com (2603:10b6:408:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 10:17:34 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:559:cafe::77) by IA4P221CA0010.outlook.office365.com
 (2603:10b6:208:559::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 10:17:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 10:17:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AF09C406541;
	Thu, 23 Jul 2026 10:17:32 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9732E82024C;
	Thu, 23 Jul 2026 10:17:32 +0000 (UTC)
Date: Thu, 23 Jul 2026 11:17:31 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
Message-ID: <amHqO5pMFmKRNYTT@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|LV5PR19MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 39cdab2e-87b0-45cf-cc45-08dee8a39c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|61400799027|7416014|16102099003|22082099003|18002099003|6133799003|3023799007|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	3j4zGy7u/P0J+/rGFKwIQyKojdsJuPbJAgj4tId9HhR7wOp5810yrhel7VJJstw7mMSPx5gnPpkydMNBg/O8CWz5799QgADnQG5lb7f3uedcz7iouxqFyJP8jlXgiTH09TGs+GX5hJTjvxrhQbywFiNTBSqLdn+d2pj2WuXn1h8rPe5fDm6kqhT7whJW8hAn9bsUJUVU33l/DPEp4Q1dq5HW9umC8s72Uo2nwm/ZCLlwhw08UyM6SgWbv1PGUcXvDJUix0AdB8zHg+rQi3XpGW65VKcWmXZnnJD2OUUkBeNKmTN4XZvIoyJjyNCkeg2YBcH0iYKVKQwLRDo6P97tWwpZN2TSKERNtWU2og6qE703qDfwg6rQEV8xhLkp2W344gxdTJPDfh7mFZ7mbsuT/7dIZ2kKPVh2cQ32x/IhHDxJgG7ruZunPbKVJt+5O1zrlgJCYt4ujJ22pk0YBDBRBsotyfG9/WEqa8nuCmX3etjPFLXlIgvBMW+Q5lR2Q5CEhBw0BtrX85z4mAY2ubOaxY1XesZBmP0dlvS6vbaNXcgpUxnCv2RYUlfzOGOAB1pU7itihhz/su19R9VpizVa5RqSDluNPCrQoN4saJh8AHZSAsa5NXHGTK7JvGlNaOMaVudbq73XD5uvu4BHK9PQPF39swnX/hZqeRh0Tfa1sXwxGKNunBYgfWme0D0oODc8c9ynDHUxhpCKsnZogEWrWg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(61400799027)(7416014)(16102099003)(22082099003)(18002099003)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CNOkr5nyUYDYuvzJkin5p0oSg0IR/52nHGKUaHisSU+gzKFW8EELxEnQMwF7GfYbaVuwokBOwQ1c0nVWEspa6P5hxEXMg3+6v+T2kYTS2ZghKw018TwXd3OoKWvPtR1c5/SHEarfmRtmU0qKNn3desFHIUWsl9JdLI4oWiMN6ZpPu3ovAgIagPdISm3LwkqW2Jpz+lAHQef3pYFO1X0EeXDmzctU+fX+pWaJ6FLwHH5notJwX1k0ZazzGJEqNCnrGpKzb+t/KLAZRqFBd3Gk8OyainY9XTL4ejBPL1WyeTijJNyVQaA9731ZD1V9QRzHnW3MNwmmGe/UAmc39T2VJBPDPd1/JIjVYBlmv+NnAkTyUxL5SAbL4aRKXunAKWUYn9gP3f5qTidXNaTAhAOnBv7wY5Oi8rNBpF1P3tBT7NPvkQCCXA6SkaLZHl2f+6lW
X-Exchange-RoutingPolicyChecked:
	gOgGs4X7KCHowtrJPa+IThkY9Lqud0GQ5EtoR+e43al8sJeqNUPFpwZsqwMiUaajjk+X2p2to8DMIV0TkTOrzRx12WpXLgyMeWTBaWsb5UHVGNVEZyqMAkq3LFLZFm1na17lJOCVgSmwr0pbKdUiKcLM6dH0g+I/TwJHMC5aqmvrn6gN8QlVeBDtmiuPAk5+jk/OC0J7G1/VZPa3CX+Mi0VJUw8erRxjJUx80b4t+tj9N/MKJs6/Kj2hwVBtBRtMDDmnBLaKl8keuDO7xulF5BBGZM1ZxI0zlXeHOdI00uc2081F3MTTXgpMjTlDCJ0HnlPmC7621LtjrIxu0zZ82A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:17:33.5949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cdab2e-87b0-45cf-cc45-08dee8a39c9c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9106
X-Proofpoint-ORIG-GUID: B2y5eTfgJFBmPHTiePnXbi1HSJ59tJ6N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMCBTYWx0ZWRfX1jD0lAeFO6KP
 /C1ocn66xpbqw35FIvxO/w/qSVzG4pXqOxKBJOGnw5fSD4Y6TCnLSquCAeSfgeO3VOH5C5urPb+
 Ybz2SvzAbZ1RFAecGdpnw9Pn7WFizZo=
X-Proofpoint-GUID: B2y5eTfgJFBmPHTiePnXbi1HSJ59tJ6N
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a61ea43 cx=c_pps
 a=eOWwnDVbUqOPKsrteEnlPg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=yJQjHkt09zqE_HiXXJIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMCBTYWx0ZWRfX4lNeAoj+roBx
 1Ea1b1s+N7GNjnrLLYWbbFwWDiw4X+Njo1YObMYehw4QU6O+zdSFZ2APzOIHDEw/zzsa8jXt07X
 9AmElyylTdSDiZqKO9AhcesaAtkwjMTk84eFypANV2WbQiycuKxpeuN9l1UvewlyVxutQKdu960
 Hiyhuo7pYPOaK4KD3h4EXMbGu1VAuZT+AdVhesgqauNb8u2OM2yQXXZdd51X+yAf6Zn/7EjW/Ml
 S07BXOXjf0ozVvYpP+ADhas01EOrp9sMqzCvdHDKkBCeP0h7C+cA2XQE/xzl43qmiJYp1pI1WA4
 2jTRt1ebq1ipkj0srvJMrIAwMgyX9wYf1CHCLB98ZMEqyoSszP3zd1L/83tnpT7icYt3bcdnET/
 QD0AOGkAoAyuWP/ikSLWJnFVVmVoQFZq8LJIMx7BOCwO2sJl2MpTNRjU0R4cwnhfxihIjkPl2xo
 6mqKskoxibBcy9sUAow==
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
> At Linux Plumbers 2025 in the Devicetree MC I raised the "SDCA and the
> classic ACPI-DT problem" [1]: MIPI SDCA is built around ACPI/DisCo
> firmware descriptors, and the in-tree ASoC SDCA framework
> (sound/soc/sdca/) enumerates functions, entities, controls and PDEs by
> walking those tables. On ARM64 DT platforms there is no DisCo, so the
> framework is unreachable and sdca codecs will not be able to use the
> generic sdca drivers and duplicating.
> 
> The direction from that discussion was to let DT platforms reuse the
> same class/function auxiliary driver plumbing and have codec drivers
> supply the small amount of static function/entity metadata that DisCo
> would otherwise carry, plus hooks for device-specific bring-up.  This
> series is a first cut at that, with the Qualcomm WCD9378 ("Tambora")
> SDCA codec on the Glymur CRD as the first consumer. Static table that in
> part of this codec is generated from acpi tables.

Fascinating, a shame I missed the discussion. Main question
I have is what was the reasoning behind using static tables
rather than just putting the data in device tree? All the core
code uses the generic firmware parsing function so should be
perfectly capable of parsing the data out of device tree. The
only bit that is missing is really the sdca_lookup_functions
bit you ifdef out, but updating that to also support DT should
be pretty simple.

Looking through your presentation (thanks for linking that),
am I to guess this was mostly a device tree people didn't like
the stuff SDCA contains problem? I do see that some of the SDCA
stuff isn't an exact match for how Linux has traditionally liked
to handle DT but also really not sure I see any benefit to DT
and ACPI support being different.

I guess there is also a slightly risk the standard committee
eventually get round to device tree and adds support differently,
but an existing large user would be an excellent steer on them.

>  * 1: hw_params fix for OT DAI upstream Input Terminals (found while
>    bringing up Tambora capture).

Thanks that is indeed something that needs some work.

>  * 2: allow sound/soc/sdca/ to build without ACPI.
>  * 3: turn sdca_class into an exported library and introduce
>    struct sdca_class_hw_ops with hw_init + get_function_data, so a
>    codec driver registers its own sdw_driver, supplies static function
>    descriptors when there is no DisCo node, and owns regulators/reset
>    at probe time.  The built-in class_sdw_driver stays for
>    pure-generic parts (hw_ops = NULL).

Yeah, we have not really implemented any XU type stuff yet. Some
discussion about whether we want to proceed with adding custom
callbacks into the class driver or just call the core functions
from the end driver. The later was really the original intention
although I do grant that there has ended up being slightly more
boiler plate in the class driver than would have been ideal.

>  * 4: pde_pre_pmu / pde_post_pmu hooks in hw_ops so vendor drivers
>    can stage/commit register writes around PDE PS0 transitions.
>  * 5: of_xlate_dai_name that resolves sound-dai cells by entity index
>    rather than positional DAI order.
>  * 6: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in the class function
>    driver.

We can probably just merge the simple jack support as is. I will
have a look.

Going to likely take me a few days to work my way through things,
but please bear with me. Great to see the SDCA stuff getting some
proper usage outside of us :-)

Thanks,
Charles
