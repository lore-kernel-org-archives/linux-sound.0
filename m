Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9409B233927;
	Fri, 24 Jul 2026 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896611; cv=fail; b=IS7qklnmpoCWsZLi7lYHaHmv3Id1G/2OSU8OJ5Yw31lAep/Sv7CIZDP6wuG24xShjJULZQ1th3c1dmNtvGDRLriBY3O1B8V9EPbOUbKLsVxz/TQvbixyhOKl6364dtGZWHF96Kty6A2SXzT8cTUoPmq9l4G83eEviMZ0OZKKNRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896611; c=relaxed/simple;
	bh=KEoY72FUhZXdGoV/3MCA+E2BlO/2FgPc9u7e9EZlVRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCeWbZWiOVW8x42CGQzjpL03rT8ahVF0Un2SyPjhskQGn/focnN+IH4NNYMuKFlzth42dOC/GY6HFgkxpOOtzMGDG4PsD+j6kd+mTRDIysCF9ppoUDUPinZgm5NX+X+6wvxxdn99h14urBBioaPHEVQk1aNqhHiIJ0kg3zLdgDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aHbbHSjT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=V3qf/Tja; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aHbbHSjT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="V3qf/Tja"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O3uD9n2715973;
	Fri, 24 Jul 2026 07:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=DUmP6sGdTYUgP229J9
	VpA+bCoogw5OIGbObTe+Z6Orw=; b=aHbbHSjTWHJjec19uULqpVF1K3SkxD3s52
	jQT/qY/v7I1gSSOLW/sDPcHCdgvp1FqYLYtjB37K1FW4uomTp3ZXQgi6sr4PaKim
	AL9nfQ9aD43K3AwH+LkGLyDbvjrya39dGvifWKeIaLuQcK3ByKGJJf/RWwI5eYAg
	EyQyztnkRNlWpnde1cLkVDtQOM9sZedv0cXPl9SQQg8lysg9HkWdXUjcsclUJJmb
	iRoSATOjyCNCWDWbqAYWCrmHcEOFmUFssNAQ3nuUpqQWheLvbwVl6e2xWjyQGF8/
	ORMkgtex9porSrmQ1HndEETjVVNcNcG8VpNnMbXLMiDQSnoDM4Pg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022092.outbound.protection.outlook.com [52.101.53.92])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfgu10-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 07:36:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZSMu48EK756PtjOWFS7rBKjDFRGZxs6CfmOmjKnuZGs0k8ATGZuRfH2ebWfKA9VvtQh4G36ZWDcJiMgUrGrEiVWxpOXdBT7ZvAtOkg2ZxI5zjOP3WWs5fJwXLTs39xe6F5c4RgeSsy2snQZm2ZbB9qpQjADJIF7hVAFge8FdQuNzGfQJj0nP9+O6ZvH7gF6NOOice0f3/id6lwhOefzcbvo0eR3qEdq/qqtarlP/d/3o8zafMjp92VNJ8FM8xcRxgIAVqXJsV0IExj2XTjJDvDvLtcLrItrocuTylb3E6xQOHrzj51XvvGqMjYG/VxBRXoVU0f2dqvlAvJNJ+7lbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUmP6sGdTYUgP229J9VpA+bCoogw5OIGbObTe+Z6Orw=;
 b=HQryZcUb8fH/rh7OZamkQW5tbFo+8I3Dqcvr9sal9OdoeCJlK+uosVGaYA0uKIfluJUHKuSnzafHrNa0i+zM5wlkQ8wPKuNbEq8nOrIwMOYez36EHzE/pSOG0mG7R6Eu5n+oxwzQw5jiiOhXzH/dZF8XE14wQVp3UVMV2JWy928YEmcgP8Zcw6sOLuy7tL+sXCDacayXSgugP+hD7AZ86TEA5OAnRtNVACizZstfVTfl8edFGIzhSNB6g/RtuMA1lx8/CjjJCJG8eD7Vnvh4hrig4X43RPKcghEZixSyQKAyqAPJDbvivQ9gm11dd81hAw9rYr9r7HmvbLs1RvpfJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUmP6sGdTYUgP229J9VpA+bCoogw5OIGbObTe+Z6Orw=;
 b=V3qf/TjaVoHExoJ2FcAiw04fw+xJRu6DoiUlgA+xdvzXvhtiaV731X657RFQh2e8ASHp+7oTDppA6e/2zmML+D1EdlNczevtrEV/JOX3cKtafv0fUd6AXa7FH1kmuqFwr4OXwop529BQzvEPPcfUpG2pmpyb0QmdaHuD+S8+qf4=
Received: from MW4PR04CA0292.namprd04.prod.outlook.com (2603:10b6:303:89::27)
 by SA1PR19MB5184.namprd19.prod.outlook.com (2603:10b6:806:189::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 12:36:08 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:303:89:cafe::4f) by MW4PR04CA0292.outlook.office365.com
 (2603:10b6:303:89::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 12:36:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Fri, 24 Jul 2026 12:36:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BDB28406541;
	Fri, 24 Jul 2026 12:36:04 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A2BE082024C;
	Fri, 24 Jul 2026 12:36:04 +0000 (UTC)
Date: Fri, 24 Jul 2026 13:36:03 +0100
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
Message-ID: <amNcM0AxYAe4bU95@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <amHqO5pMFmKRNYTT@opensource.cirrus.com>
 <87452472-0ca6-4ed5-a891-3a688598b5b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87452472-0ca6-4ed5-a891-3a688598b5b3@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|SA1PR19MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 068d9c85-d63d-4c88-9ac0-08dee980220f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|61400799027|23010399003|82310400026|36860700016|6133799003|18002099003|16102099003|22082099003|4143699003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	gKiisagwcA6HMB8INR0rhNnK10VupHNeMLS/rcmMDL4qedlmDxYYarcN4VH+N1B8QN5YZAtabu3TI+PpdINkZluEuhfosm/LkxOIFzlSls0NAJGP+RQzmO6omobSzts3PyamgwEyt329n2lMNENlt7Vx6u9f5Q/Hn2IY5GMokHQXCZKnrohPy+Nj4s4LSP17wNMPNRNUB48ja2hq2yHALKuffjsx4pLyaoUUlKrix9ng5bDSorupFKIY8PKOnsB2+8FOEqnJI85E/wN1HTaQDb1oMkmBKDJJX/CPlWHzksvGoWiyymVv8P24RmOhb0c6hZRhMZRfqbXPfvEeNgN12vgnLTvtESpqfZzFn3OQfXDDTgCdYwD0fR/8M+HJTYMFdV8d+AGEC7f+Gv7KFLVH0viQ66JL6sB5jvKzirBIDQeQombtNDYwxL2vO1ErIUDfEjMs1LADWSCayGXS23uTE9nmgPLXGuyT0v+yr8skYwHVJ7ebK81ncALatV5UdTTbkxHrbc1hG+kiYb/9m3exxLUN+Ki7mo/Jo5uGjSscoJfMQaIKwCVpu3PnjT3QylmmWYSZCGhYyd9uVzmqe3qNgekG7uOreNGblE5EQOKDZr9w33nfoCEK1evz0AT+BbgJNfrkWMLzHbuFUP9Ndm7gKkjy08GpOoWTKW8ggqppag+bpvz0JXO4Jbg4qmuCUGduNmJJ3g1o8iSZCbiila/EuQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(61400799027)(23010399003)(82310400026)(36860700016)(6133799003)(18002099003)(16102099003)(22082099003)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H8n7UMdqbr0IoXKBdy/gHVb8CfkcGbdHDDHpBNsYAvgMP0YXvzRfplv/ZOY23k9M6siOlixEvCPAzyk+Ed82WMCgcJVv9mK72v87FoPJb3n6Fj8qrnZVMX/wldE3afQq3q6GZnc+OUONhUAsCDKNRdpF0ct7BwbIjMceQYJYiJhcrKTNFgjBq21QB62yH6FGAA8k9sqn9bufZH06WR3tg53RCGzHPw8HqXAHjbGuhIVOXTzkNyTBeRriC4mkoBOsnI28dV2mBWxIEaLD5ej5O/gr/IjMfKPVBeWVAaM/6VAK1o8QNc5BSRS/xNcaUk/QnPIZRxTUSlvUs9s/tGrm+PdCBFZEzBDw80ncEnWDmIdKjsdLjtXnOcEBz9qcbxH19/kYGVaKJbKX3+45e5/+diV+UgtVN3+Na54IxvJIH+EZcM9aEXqqQX2yvWxH4NN2
X-Exchange-RoutingPolicyChecked:
	YyDjzFca0xXMvfu6yv+rIZyu9Prz2C+cAOMMEN6yqvBakdvqS5VImp8KiHYJJRmB9aiMKD9u6uXdCvbYS/gCEKRApiTrDg3FZFXf0yW1izcwE4zpPOdw3UkGeYM0m1ZL4Bkp/ZTNnLLyWqP7AAHKLlj69iEiBNrflDR6xIlXlTEuO3Tm/Vt6fTvOgXYVJX+VtxgQLO0WoWC+FZj2z1ZG1xNMfYMXseaaDTQFoimfQpVgUeOXYojw79fAr2zQi68/8gRUVnOcIvoilpFl21YB5dDir4pJjUmmY9/WTWjPocehz7ri5YcCxXyPRACodw/GLj5d5/0a7e3jMKHA1dAuaw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 12:36:06.6366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 068d9c85-d63d-4c88-9ac0-08dee980220f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5184
X-Proofpoint-ORIG-GUID: gsxkKUm_ZA3vMpvDIjlwe9bvewizXaYh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExNCBTYWx0ZWRfX7dw6YbAV6MK9
 VGiSr5W+YNUiHIf9FAyhTKrgbIBYfOi3jSJuzXk2IUg47onZSWO+5AS8/wWP3rgmSacTqdZUAM1
 bZghzkGEUWbFKuwVCIeJCKufBO0/CBQ=
X-Proofpoint-GUID: gsxkKUm_ZA3vMpvDIjlwe9bvewizXaYh
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a635c3d cx=c_pps
 a=KO6HEfrki8vYvSjcdf85Eg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=AE6WaQBM-Rrf1ngJ8jIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExNCBTYWx0ZWRfX+JLpj3GSWoks
 V3NOloRJgp++cdS4zaq+Sw4x0R9/QPbZ9CFvMI9tLGWzP89GV9BBIZSGgJ4BGGatBp8Yl8mNZxe
 JNSKj+gu0GdRnX1HlkNYb2qngd1Ng3aJiQVIvkhrfFrCqDPI8xX1s/71pnXti8+2gjKsDNunqZi
 RIWrU/vKwx1sDlIZ25yck4pLUqLDc4ooCB3mVyuHgquetDPIqrcoehjOPoKEL0friyAN+XrDc5d
 y8VpT5zbJJSi6Xb8QThE0DvoXAtydZEWXX8OC2kXjZz1tNvwFCVGoavpozQpcIN8ROn2xQy6NB6
 3Ox1kMapFbEN6kRuVWPFlZMFfkO5nsnhYocCAeNlIWqRSn5CB5RKSfN16xJx2cOevleHYmePSif
 3MBkMKPdkqAj/sCD/kbIs5Tmy+jO76sn6ieKtbHkwYBnNA/uKj8kDkro0pSs/x/ORFu80HdonmK
 71KkWo6kOsmRHWkhK9g==
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 23, 2026 at 02:24:19PM +0100, Srinivas Kandagatla wrote:
> Thanks Charles, for the feedback.
> On 7/23/26 11:17 AM, Charles Keepax wrote:
> > On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
> >> The direction from that discussion was to let DT platforms reuse the
> >> same class/function auxiliary driver plumbing and have codec drivers
> >> supply the small amount of static function/entity metadata that DisCo
> >> would otherwise carry, plus hooks for device-specific bring-up.  This
> >> series is a first cut at that, with the Qualcomm WCD9378 ("Tambora")
> >> SDCA codec on the Glymur CRD as the first consumer. Static table that in
> >> part of this codec is generated from acpi tables.
> > 
> > Fascinating, a shame I missed the discussion. Main question
> > I have is what was the reasoning behind using static tables
> > rather than just putting the data in device tree? All the core
> > code uses the generic firmware parsing function so should be
> > perfectly capable of parsing the data out of device tree. The
> > only bit that is missing is really the sdca_lookup_functions
> > bit you ifdef out, but updating that to also support DT should
> > be pretty simple.
> Two reasons
> 
> 1. This is laptop platform primarily works on windows with proper acpi
> tables, These tables are directly derived for ACPI asl tables in
> windows. Ideally I want to use it the way it is supposed to work.

This is a little confusing, could we not just the ACPI in those
cases?

> 2. replicating full Disco specs in DT is going to be challenge, Because
> DT describes hardware but not necessarily at a level of register init
> tables or to an extent where class drivers need it.
> 
> > Looking through your presentation (thanks for linking that),
> > am I to guess this was mostly a device tree people didn't like
> > the stuff SDCA contains problem? I do see that some of the SDCA
> > stuff isn't an exact match for how Linux has traditionally liked
> > to handle DT but also really not sure I see any benefit to DT
> > and ACPI support being different.
> 
> I think there is fine line on what can go into DT, some of the hardware
> init tables are big No No i guess, Power and other ACPI things are not
> something DT does.
> 
> I will let DT maintainers comment on this.

Yeah agree be good to get the DT guys thoughts on this. It seems
like a misstep to me to insist that the SDCA spec implements a
completely different system of storing information for DT. SDCA
is what SDCA is now, and supporting two different parsers seems
like work no one needs when the one parser we have would work
fine for both.

That said I don't totally object to the idea of an option to
supply a static block of information as you are in the series. It
could be useful for transitional and work around situations. But
it doesn't seem like a good choice for SDCA on DT going forward,
it is basically going back to the board files that DT was saving
us from.

Thanks,
Charles
