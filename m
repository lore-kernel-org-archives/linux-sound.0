Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053C83BE659;
	Tue, 24 Mar 2026 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351452; cv=fail; b=RV2jlPIuRXeHLzLDWS0o8VpIcODzDCvc66pToYpZ7UMUBEoQigvSHrpWyLsMGW2oSWoj3YFQZaSfPLHWjgBKdDp7La1dluKiB0X8fRsXaHbMcEnpbA46cNkL1FsEeZY9f5KcfoTVAw88Yt9uhG+2kTxkn4SW91Mut8/auhVQMeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351452; c=relaxed/simple;
	bh=w+2Vqn5XbAXZtIhr8E4UaKFncrgIBqhBSuzU///dTMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKCnIz4vwAkSy8GPvRYbFBV+5FuUodeyrDIHBcP6Fi4RpWNeZrQUibgzXhWb7xChoR3lOXZy7DPxJJaBafmpXgRxe94JJuXDPGRov/VnL/H/q0A/I9McfuAh2YAySAzyrl977A7dBBDrgfKtI1Qd6clMYZefn4EFcT3j/LVMOX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ibUaOwqo; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=O+Asf+v/ reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ibUaOwqo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="O+Asf+v/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NNkaIM699356;
	Tue, 24 Mar 2026 06:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=1su9aJMndwYvwhhfhTt62mi9WROKG1phklzJMYr0QSU=; b=
	ibUaOwqoF/Gr3yUOcOvXSpuF0sYZMLpyLZEvZI2jdQ5Vv0Zzna3UaNVG/hqDBDV6
	Zm0mwgI66Tl4HdGAuqSEQHgcHZfM5xIdkvHxNUfeJLc39oA/jXMspecvmWC5RZ8H
	WjfmFvPWXBc0J7Xol8mO6gb8Toz71eBsmlpGfe3KnzSBRZUnGjhH/clPVFLJQKAk
	rMforNF5CX7XLxxyzSn7mCmQbQsXTaKQcGLL0Lxn7DahF+7nY4os30aaZYh2zUhw
	GmuA5zCCrwzwCIDpzVcjoJbMnDUmIaCQrjqYwPRXKWbpXDrQgortHlfpMYhXa9Jx
	BIwix0GYjZtFx43jRZ2PpQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022091.outbound.protection.outlook.com [40.107.200.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d1qrfb2d4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 06:23:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/vufndjkOQyxiPFDD/83gbWIM+3bPf5hffFvPS0ssa44Ylh1VGbzgy4tT4pZ/XiTod4+lJ/TinooKwvdF0+zbXRQGrwPRupJTB1DZUU/m4rWA2Ujnw2L243m0kx4N2i7ZugwAZzz6rnsPvI4uW0BuD8ssly/kEfV8qLP3zAp22G4H/c+hnKnIMESpK0cBbo8GVQdPv351ZB8T+GrhhLM4+fnC2lCfHl76I19SSjPXusBQ0nu7BfuNP/Okthx4W3kJ0YI9vce7di45N/uMDEyeD5lo8u/05XZHnCqg3xxYLpwpmruayhFM8ziTqyjgQ/AuBgUikBQzOOZ/LHRINAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpNSsSIlJv4Mo/7aA4TMQPuvOOVDYGv39z33UAA0Nlk=;
 b=Efu38na4qVA/j0aG0GfqDYW12bSl4BVeKL0SN1vP76g7QN2kcRzZrXWWjMpXjgFUKMivk6xOPcV2E83+HvAxNCh9hWGAAYOtdrJKliKwl97q75lzBgz1sF+AvajOEGUF5tUxZKMno69+Z3VHwqvKMo1toDfT7NrbSeE1jFGEcFbpWjvX3APl54VE2NBSyOUq1Cqs0ixsaARAnZEyd1NWibI66N+tqN59muafjTqHUuel29CL2uhtiau2uUMzrxclGjElHbULXaYAm8GBfvFtz19NAuk8zXDSDx7GFf3oOnmTKsV08JyYkVo0KEicxaVvI8+dWMAA38dIq54ATcBFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpNSsSIlJv4Mo/7aA4TMQPuvOOVDYGv39z33UAA0Nlk=;
 b=O+Asf+v/sDK2l07My2WVDqj+zRRy04p2LpR7HXHDyJ5jQa0xGlIcO38V0eKL/bwDM9ZJwTjxjO0nCi1Cc1P1kWs/zRakV+nETzJH0qO46DziOD0aIp95MVE73AOOUOGITchMUg71swekcR27XGOXsv6LjY0fG/nxJEKRHZ29dzw=
Received: from PH0PR07CA0075.namprd07.prod.outlook.com (2603:10b6:510:f::20)
 by SA3PR19MB9552.namprd19.prod.outlook.com (2603:10b6:806:496::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 11:23:47 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::18) by PH0PR07CA0075.outlook.office365.com
 (2603:10b6:510:f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 11:23:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 11:23:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 661EF40654A;
	Tue, 24 Mar 2026 11:23:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 410F4820247;
	Tue, 24 Mar 2026 11:23:45 +0000 (UTC)
Date: Tue, 24 Mar 2026 11:23:44 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: =?iso-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SDCA: Write init table on function status IRQ
Message-ID: <acJ0QDa7w06fsJwE@opensource.cirrus.com>
References: <20260324-sdca-function-status-init-irq-v1-1-bba49417a4e0@gmail.com>
 <acJXZudDv8JjWrMK@opensource.cirrus.com>
 <acJnzC0qrMXcMGEW@ortodist>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acJnzC0qrMXcMGEW@ortodist>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|SA3PR19MB9552:EE_
X-MS-Office365-Filtering-Correlation-Id: edbd31d0-f712-41c6-86d8-08de8997d0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|22082099003|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xkFtNnitimEemfZON7NWEu0FC0kKpyjZBPfa0RWCNLBVwlODhs2R35tAVpYa/oAivWcbGaOCrT+LLNRsTnuDySJ3rdE448U1xMZN9Tf8jLkrr4KgIwe7PVnKhArN9fJAVNBq/ZxKAEaqp8Tbzgmf1a6Y+K1wvZeQq8JzGG5I1RwBrdf8JaDfzgjDZKyZbw0U95H/7F/b1iIu/QImWFBDW1HLzwYpeYc+ML4MFq4C9NZtZnULeleFZVSruV5hXI6M1WkuDMwwm0hX++cx5UNq9LV6c189ULOwkM2DHGfN+JIh9kiDMUcY0c2d+AcwoybU7JmR6f1NLWvKnJdmUvGtLSJTTMhAWwq6kgPaOCZCWIsK/W0wbg+Bux3oGK916P/gfc1N6Vy1WNpwBKBBV48TiQTGDRvVoAmVta9j4QFAPrOspK4pcMjV8FYEvQSTgbwi/Sii6yIxgymwHOTd78dsrNyZe0X3+Zg3dRKDdbXwVy7wr5ohE1m7a/blZG8CAKtsjb4zGwF/bGQRNGFLWVXNpjhRP6Yux7SwxIsGQre3uszpBdRrpoaHtrn2i/2KDa9Jl9F/Acg/4ZSy+NsH4k5hrxOQRFgzz1xWTQno9dhXLv/YAMVSOWf+TijQiX0hXEg327wSuRFO1+YU25LuA4vil2xpEuDW3JXHLA0CWfiXUdZFg0hZVyL5eHndlf6xCBSh2/SVMsjJRisEGmGf0640A3A4gaj1Fx7gk/sa8sJP52DufkFQodMDRCZC1Eceo9KBsUN4+guoF/QJjtwzbxwsdQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(22082099003)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NnHTCd2Z183S7llAfDhenwYyJQCRrXCXpgLdt8QYe4MzzwvjSqMrkzBEQK88ZoLAoJwWEUTWhTVi18p+9vrvZQEnR0VxnMBoDeNjYXyoa4ruoT8JtMBK8weLafxEcRJR4fDgQBXToc+NT+Zm6lSlG+9EwGTPgHacU/RjvXTq1rjYzdgnpxEMvPU6+s9HABvqcOXaOcZnhYPe/aLycvfVOErwUa1OQa9BukrHlAUhUjUeoIyCi0/Y3vP+wmRrsUgQXr/z92fdHhKLL18sT26lZ9uotxkWqwzzqsDhgzqXy+Fw7ixqRnK9CLfFeXkGHKnq9oU2dtR50VAc2Ufiz5U4VQUlIddkMGZ3I50f7QCNIl+iE+dvGDuZgCmzO3BY9uLMVGMxVI9cfZbYCWMzVxnguecpZHmNIokPXCAufApE5KxtjNLPnT2LKL48eUu2PA/X
X-Exchange-RoutingPolicyChecked:
	bowc0yuov8XRILn/wMVAs/hmcOGBNHUXfCSMRQyTalWYdEWaRZxCxcAdGRd7UnY0xkjjxbSSS0mQWINgqYNRWfAot6hXqTG2c1kGUiHrKZmtPAMxfgE1IWMZ4Naexuwh+93vUG467WIjwxqXVdjc+GkOQun6nIJXzgBvV4z07EubwPVS0QjWMeTXxHuQ7/otBb9Z2eb1hUd02cmIxhmyueFM7EKP899F2sAq9q6+IuP5Gm2OaUw8zMSKGU3WAcemf4TmgN+NkubcCKB+SEVhyz+bU5xoZglxvHq89GZD0V33wKufALINV6YTcBOrrf8UNOSi3pIONQ5s8ay3Z0scVg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:23:46.9591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edbd31d0-f712-41c6-86d8-08de8997d0fb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9552
X-Proofpoint-GUID: s8mZ4WSNOksClmzqk8OU8EOrYmbHSCWA
X-Proofpoint-ORIG-GUID: s8mZ4WSNOksClmzqk8OU8EOrYmbHSCWA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA5MCBTYWx0ZWRfX0Df0qGHuDlYC
 vP4ljfQdgSkl955D+ph9G9fGD+G8nO7F1PNBwRCXnkyx6G66u/I0fcav2kDVweEP6IqzCTDoS0h
 39IWYZBUrLwhzl9h94iHfY1Bm4twiKrTcHnw8rtvP9f+mWjHuligotopeyXU1j6FI6YHU1Xr6A6
 2iqw42Y+3t5ruMdkKpPtBg+2XWDFT3stHfQm+U8NlbT4tN4tC3+u4ZbHAXois4fPIqXmHeaLevY
 1WClxPAAYqavgo1i5vZtAx5BjXoLMOjIY7dG1dCkluECAigSjot37U7F53j51BjHioHRHpPWVsc
 w9v6n+6lRSsQd071WI+NBO+LScpAy3MYiWBrAkWJcmF8+p2KRiG3iq8EmcWFfBbiU105oNWlARl
 hV/jR1KHYLwoE8wwdODqKLHfgKv9z+J11jPDjnkQ9wjgvKtzx2V8O7hGK99T/O9+xvfh3EOY/sK
 QTjUtxWIqh5YXyJthbA==
X-Authority-Analysis: v=2.4 cv=FM0WBuos c=1 sm=1 tr=0 ts=69c27446 cx=c_pps
 a=70jXYUHAk1O2tkEs2HJmJw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=GCb3xT_uJfNdfaju-0EA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Reason: safe

On Tue, Mar 24, 2026 at 08:13:01AM -0300, Cássio Gabriel wrote:
> On Tue, Mar 24, 2026 at 09:20:38AM +0000, Charles Keepax wrote:
> > On Tue, Mar 24, 2026 at 12:03:59AM -0300, Cássio Gabriel wrote:
> > > The function status IRQ handler currently acknowledges
> > > SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION but does
> > > not perform the function initialization writes. Since the
> > > handler clears the function status register afterwards,
> > > the request is lost.
> > > 
> > > Use sdca_regmap_write_init() when the initialization status
> > > bit is reported and apply the writes through the device regmap
> > > stored in the IRQ data, matching the existing class-function
> > > boot and resume paths.
> > 
> > Generally speaking the init writes should have happened as part
> > of the device boot. What are the circumstances where you are
> > encountering this?
> 
> This was found by inspection rather than from a concrete hardware
> reproducer.
> 
> What drew my attention was that the current class-function boot and
> resume paths already handle FUNCTION_NEEDS_INITIALIZATION by replaying
> the init table, while the function-status IRQ handler would just
> acknowledge and clear the same bit. My concern was that, if the bit can
> legitimately appear in the normal IRQ path, it would be dropped without
> taking the same initialization action.
> 
> I do not currently have hardware evidence showing that this case is
> actually reachable, so I will drop the patch for now.

Cool, yeah I think the situation is a little more complex that it
looks (we should perhaps update the comment to say so), because
it seems likely if one gets a function needs init outside of
the normal boot proceedure that the part has reset whilst
operating. This may well require more handling and I would
be keen to work through it when we have some hardware that is
hitting the case to test on.

Thanks,
Charles
