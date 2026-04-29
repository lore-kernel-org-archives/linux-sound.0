Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AE038BF75;
	Wed, 29 Apr 2026 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454691; cv=fail; b=rLSER0g1KtF3utTSbQ69XD1V1LWSFokDqRGn7iKGSyoxXU8XJRfI3UlPRJPPKTfHyT4ROB5IM/f0q2zL5qTu8RBfKxmRTMqnsM+yY8wLuIgtu5mg9K/rvYjifjMivgfsdH/1mUfGhdYfieko/Htpc6+TaFOrsDW62Y5I9t4xQro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454691; c=relaxed/simple;
	bh=OtpFmplYuzfCfsCrhnUXFCTifW4MDa51OLT/zcmpfnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPnqINilRQF5owjUmZLpRn7abBZ901tIz3MVmNketpLbzJl/aSHYuLHLfoFb6fSn7W2cDoXamNjMwjBa7e+QCYTtCZ6/8OiNVF1H74IL9+ifgW7hcwVJxsmCWCDl4K9NFRPfcTMHxsoUoCH2pOg/Se4GOXwFJZuGhP20VrKSfPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BBv5NlJf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=e1PArjke; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BBv5NlJf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="e1PArjke"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T0c29j2087278;
	Wed, 29 Apr 2026 04:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=KW2Qlu3VS+uHBmwvXnrJFBsUuQljgCnA30OCoo07dvg=; b=
	BBv5NlJfpeBmJKMo+77Ll2udZj4/R9YuNkHPiCo/q75Gst3OgDkwVdwt3ClhM8Cp
	c7WdYm2SUlWkTrkpeHhKq6Z88sx2gf6FYNeIw1E/nv5MaG01VNNHAQ/E3YBu/T7v
	WNZuhUPJ38CFrdzNl4Xnq6RObfNoS3pcUCiFaNs+yAOe/wWP9/wZhy+//l+2F2HR
	6s8ds6HzRIywPtzjqL8BUV+D1DQZ0W3jlVPMA7STTb3HuGDUXUb6aQHJ/EgWdU9w
	EuWJ+JlP+SgKAGdWb7ufL5hP8IJiZdlz1mXc1eIXGLHVSylax/tIit0IdExU8u8L
	VpyhrDaZBx339heG5day/A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022111.outbound.protection.outlook.com [40.107.200.111])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jnba1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 04:24:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqDW3xh76WTGVe4JOIDdXnZLdBNy374rbG7Al16RtNPD14KJpTIqk0jUW9V9mkcD1yUZk3FR8+XJs1OfL8Lo2HP8EaJyMDavJ4WlptN39fcC4hFtUcIvqoYexxelPIgk8w4YfDMzTXa/bt+2u0GLUzamC7xXAFRZKV9h0SzBr1eYpzsaDds5HwMN4W5I/yk6dVxaXJEIzOnnYG1PWWT9dvALmp7sWz6PaPSCp7huIMWKWZwu53txskZmIiVUeSp8nGaWnMCfubGzWDW5wUeAie9cn1wWaS2aNKWW8Q3XODlxJ50dOnFDej5X+NzrdR0a8ByUbPRig2KO40d8HYqazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KW2Qlu3VS+uHBmwvXnrJFBsUuQljgCnA30OCoo07dvg=;
 b=T1a+8ZnHdC2Vme1nu/CDFjQFihi1lVEcSNkonJ3edfm3bT/fY1t9hRgqrB9HWiVLuhSK5jMFIQEuAKOvyddlsVZkKKo6u2RsSCca3/ajCspuU9FxHUA6CP+xHivVldOkP6rt+5WkvlYQvLXAzjmDa4OOnNEf60+vPmbV5sHPVc59rFtn4h7sU04ZRUk04Wlu/j0RWe40bjjDuCzGTgsn80Be1ximJZW6PgzWV9EcnKCa4+16B5oJVUI31HHb73NFdLvv1rZxCPVArk+gf0YsnruN6cCYoTCztdKU0oLAPCbawb2GNA+LeuIfvhojKA+f7jOt+M5UrkExJcCFWO3uwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=canonical.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KW2Qlu3VS+uHBmwvXnrJFBsUuQljgCnA30OCoo07dvg=;
 b=e1PArjked5eepGDq4q5lpQFAgHK6nVpGWdvrY+fB3vehcOSVJ4u9LIaOFrhtIqh39PW9fro9ISui+Q45llWH8WU8be+26vg6kxuaFkfVzqS2PAbgFuQ/tcl8fWaudELcQk6nl+HbFygAYqmbEbXKni3IrtjLYnbfZ2L9MxdLtT4=
Received: from PH0P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::13)
 by PH7PR19MB6777.namprd19.prod.outlook.com (2603:10b6:510:1b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 09:24:00 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::3b) by PH0P220CA0009.outlook.office365.com
 (2603:10b6:510:d3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 09:24:00 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 29 Apr 2026 09:23:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 04D5340654A;
	Wed, 29 Apr 2026 09:23:58 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E01B3820247;
	Wed, 29 Apr 2026 09:23:57 +0000 (UTC)
Date: Wed, 29 Apr 2026 10:23:56 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Aaron Ma <aaron.ma@canonical.com>, oder_chiou@realtek.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "shumingf@realtek.com" <shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt722-sdca: add FU06 Playback Switch for speaker
 mute control
Message-ID: <afHOLFWeDgwPhzUB@opensource.cirrus.com>
References: <20260423101338.1040131-1-aaron.ma@canonical.com>
 <76827f27-1a27-422f-8e83-5f5e5ae0f7ef@linux.dev>
 <CAJ6xRxVy5+PnoNDK0z=15PrsUXewAgZb6y=a4pdUQ5JTqphk8A@mail.gmail.com>
 <5ef5113c-b66f-468f-a906-72a8dcb67920@linux.dev>
 <aeuR4AddzJ2sKU1e@opensource.cirrus.com>
 <04b94a00-18ef-4540-ac49-a93d2247a603@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04b94a00-18ef-4540-ac49-a93d2247a603@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|PH7PR19MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: bf2535ef-beb2-4955-724f-08dea5d10bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|61400799027|82310400026|56012099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VJE8qQ/LBwMkuNfgYYKtynL0NvgD+mgKFYxwrY0weiBCHw4AR23sa5deci6PCYovguNOquy1ttcYen7Cbt4K9NQzEF8PsJDw7PrRQeNyDNUAa2hk2WcomPdDTwnbeBJ4ZyNfv8zVpxSusm63D18GV0EBBa0odAMW1nAQT0Icb3T8F2NHTlNRapwPH0sqDBT2z9fDdqDQtTDP4JWfQc1mqIgBdIzA1AO9wujWLLtgey0YVpM+69Qkiw8Xe9NMUFKw+WAwGEq8gLLTDIJ3SZcBDd2bNyBLKLQYWFbqcUEJnB5M9YaOd5egWlqdFwCRXBrlyzEI+sqfBkBZeTGYl3bODodbJpp7aApxYr4xHsD3APBXUG1Ce4lhvmGH0CKEBQF6ETowvaYuRxfIX6KeKVqBGsuO0pOW3ycn4Jcr9r4bz9Q+WYweptCCCEUlWdV/+vQCl05Atmp4UvC+rSkx/hCeS5xFhqDZcmIW52MbkDWwIioFMMdEodgsXoKu2AAX03OfSnj/7hQgAjWxD2uZGl3aF8MGernUXvSg+adhKICAHEBwQ3tmIn+SryBSsZhNRjqUc9ObD8nMZ21aXhfPWWEFp+pLDO5wpHtWWkZv3u9kJAo28H/HCmsNpnrtC4eWmvngT6bO4XMCkqFtDmfoncy9+Bot8MPF33LfL75YnwEmU3fBLx1OdTTtHjndzppnHIp6uQijLs4GwJiSQE77H/HCyrnzJl11sTE+3y5XXn4pguh0wQH6ug96GYP4dcQJxjdE
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(61400799027)(82310400026)(56012099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rr98Bh2QcXaWqGcBWzxTtZjRObBi/SX6XOLApsRDMV+A+q3WpOAYoh34SDMgdOnmzSNOBJO+E81AtCzT5SC1zu8HLshhYFGoE0SgOhIqo6hBZzTlAnW+dFksY3v8sHfkU0LFE0rMiwBqDhO1NtAk6eVZv9F/JYjQQ4PcXgqsmXRgQ3NQ0yHtpfW2kyMNrdl5wLQCLOJmARfQRJRYdJQUaKQ1vo7wY4fUjeE614AyHdoiOgt0rF6fYldiBEL60Xldj1AJp/IezOpsZgOZctHBPbCSwlr9Jk1cSZvkl3cPAYFBZi8f7LlZZObf/Tytf27A8N9eBGN4FSBlt352/7ZpF08zcuI70fjPwFHLgU5ItSWBAT/1xwABjkMaAygQ7jxQ+6wK4ECK8r3QO+FtlxXgWgWXNqmCuRboFVHwStLUrRQXQh2WvQzGVr+u0FBUpYnG
X-Exchange-RoutingPolicyChecked:
	vbc0vYm6K6l/PkZa/jOQiCZGYrEtF4hSCz5mIKa4QG4ttaNHv0sdjy+9JNvq4g7CWC+L+LXQKEZhCtR2QpIr0t8PRCT/dVj9Gtr5u26zZNq6ldi27sUAopiR/Pu3cbpvZYLzI6FTPBog1ngZpDB5714hyF6mpUHfuhxUlsu1rnF0D/wg1MPsG0pzlROA0bnPJzRsMKRTIb4tppAZ3dDnfaQQrIfwBO7tDMMPvHnPrsm8ruWSJizlbc6aJ3hKjb3+PaHNAwguqRkYw1mJGSm1NiMga/csh03DV01o7mH7AFMGYozDRYJeDfyM/QZOIhN03VMD3yw4KzQ9tcsH3wTRCg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:23:59.3466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2535ef-beb2-4955-724f-08dea5d10bb9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6777
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69f1ce34 cx=c_pps
 a=b67Q/1ysVWfJPtmvsZ4wdw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=nM4Y-fn7TgAo_09svrkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: mA5rfdBTUQV627SaoLgtp6OBDdyUTLA8
X-Proofpoint-ORIG-GUID: mA5rfdBTUQV627SaoLgtp6OBDdyUTLA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NCBTYWx0ZWRfX3UtEDqsmeBZ8
 uQVnU0b5cK8nu7rnoSJn0OdPSu6X3WhbEDz4nInvds/nhjP4Jl+nWd2F6m5qyBgnqrTDIfQjZeN
 z38XT1WrASRMF+pqQ4ep7Ds3LD7vqtxejXsnH3ZaBP8eLGKuHz2iLQpsqMZZSNJBVgaZAJze5sc
 V/N5IcHG8a0YVTzawkYHFZj4ycXteqIR665BbgUG0RNue996JcPU+WDzPYxx5ZlMhOgikP8vNiv
 Fk2i0B60KZ1UpRDsDq0JqMedp3QUDclW1dgunxWqe17aw4U5H43dVaWb4/5L0etDh9V8pWxf08D
 RdWVVGEJrD87HMRqWlRP0lRO8mAWZTC2V81F9l7fpPq43tWUEVQZCatTac57SjWgKpU6an53IFZ
 RoD7O5VdMu9wjSd9Jjo9Gf3CxK0srLbMrsvse5dpAgqV2bSL9jxUuj17F3Oyiy0SPxBgEp2uBuj
 Wf6644kOH3XsgVVBpyA==
X-Proofpoint-Spam-Reason: safe

On Mon, Apr 27, 2026 at 04:53:20PM +0200, Pierre-Louis Bossart wrote:
> On 4/24/26 17:53, Charles Keepax wrote:
> > On Fri, Apr 24, 2026 at 03:09:10PM +0200, Pierre-Louis Bossart wrote:
> >> On 4/24/26 05:52, Aaron Ma wrote:
> >>> On Thu, Apr 23, 2026 at 9:01 PM Pierre-Louis Bossart
> >>> <pierre-louis.bossart@linux.dev> wrote:
> >>>> On 4/23/26 12:13, Aaron Ma wrote:
> Yeah I can't say I have a good view either...
> 
> In theory at the Function level there is a Commit Group mask,
> a Function can be a member of multiple groups. The fun part
> is this statement in the spec
> 
> "This Control selects the Commit Group(s) which contain every
> dual-ranked Control within this Function."
> 
> but then the SoundWire spec says
> 
> "Every Dual-Ranked Register is associated with one or more of
> 7 Commit Groups"
> 
> interesting wording, I am in the dark on how we would know
> which controls are part of which Commit Group.

There is "Atomic Behaviors Using Dual-Ranked Controls and Commit"
10.3.8 (in 1.0), 13.4 (1.1), which gives some examples of how one
could group stuff. Although its unclear to me how much these are
"recommendations" and how much they are an exhaustive list.

> And then IIRC there was a desire to update volume controls on
> multiple devices, e.g. if there are multiple amps the volumes
> would be updated across devices. Not sure how to achieve
> this...

phew... yeah I hadn't even remotely considered commit groups
spanning functions or indeed even devices. That is indeed some
scary stuff.

Thanks,
Charles
