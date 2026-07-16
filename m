Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2940C39F165;
	Thu, 16 Jul 2026 15:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784216866; cv=fail; b=DalcGepIFKKW9rteDswUO32f1fDyoqcCOtzJ1whBP+cWrM7iE7kKyr67aje8Hf4AKpNFxTQmK39q6QXJtsZVGg30fT6IUQwDEEP0xjUZOdkYfYJwk/21iMxfikOOFsb0JmU8Buj+tI9GDtU0g7VI06AGuukV4DRWI72Af0F0uWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784216866; c=relaxed/simple;
	bh=xJzvzF5R9ksLfEt3aYaRQbi57SjwRl+yNW53FnROlEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3hCETB4XyGPQeo23HBcQIVB6HsikD85uh0W7F9l9LH8EJmH397xdJ/0uAx/TmzXUK8gYJlttqD7/k1WPv630WHpjO+yHwfZ4KzlGVNs6PyC2j0dF1bCuP+AWWZEjS0DQmitPYtW9CrsOWjmrxzd9ffXPmLBU80r6RnnjkMFdTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FVjgMkA7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Pv9PCJUz; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FVjgMkA7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Pv9PCJUz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GFKIhk3707103;
	Thu, 16 Jul 2026 10:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=E0V3yKC9MTQek4EwMn
	APe8WcBloO0vCpBUnOHVFvMRA=; b=FVjgMkA7yOhfLnriK95LSHq/9jMk/hvojx
	W9PIPbXMQyC3tcoR1EwgUmLhs0f0R3wMRy51D/xk0mxcGgbZ0FTgunGJt+Imhi56
	YUk85629E4pzOteInUg3KzrLbu5E+H5umHiPS3BBpZTy74B0ugzsi9NzhO+cuQpz
	lHD3YNr6mM3vwjVGWS7Z4PEcdZzj/o93ko7kv3Pw8aFBuOLE2pqP3Q0u8AtG3QE8
	ffsm3mwSSZWbF1irf0/Tq25z248hrG3RQ0UDmrBkNICiyritJLgyhd5QPyLbZxME
	cViCyIjkSzKd5evA06A9iNSF/C3IFM2+A8KMI/Q4gIb0ztrMvZFQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021085.outbound.protection.outlook.com [52.101.52.85])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vydtx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 10:47:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcozWo5a7nZY1k3rwZ93dZeneVxYnWfsHp8mOvpoSQf0DCEBn/MXZQS1MKaB50mcPx0RrZ9lZ/8K68td0vGeIIo0l9qL7b3TO9oLo7c0JalWda5EKD6q0TQWQEHies7UEiBSgjocUERlWxiPjscy33hpEcUpYOxuKK4lN8FIkXgRVAA1RLDlBAgZlHlDKNmicepb+H89ZcHP6Ho4KPIphSAJ66v/6FQupMlNr1EJbyJrkspGQsiy4B9rHKmWJZSLcjHR0Nv5D+mcgSgKVTAxvcYnqeBlvQcWldUH5iaNY/0qMLn9X/QpvHLlejwDj2+iy9d9ZvAAX3u6nvIXN5ZwfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0V3yKC9MTQek4EwMnAPe8WcBloO0vCpBUnOHVFvMRA=;
 b=vN8m11xdxavDT0yaHeETbUCn+lF0iG+gfLjPC+6AcOer33t1lwskKUtH3UsC8UBkjhFSDcHxkKWIjCPPYE1P8Nzfq441qaZ+Zkp/ltrokRFaKGcWvYB1Xy34eHbn1Q0wOmo0IgW//ZHvRAS4+JxCYWAZmawg39t91DwqWGprcV2h6tSNy0+goab9iv8QofulT3VWc5SMOh/jImtHMdlWpsoU5QaNnFXurtEAGDzc2p+I3B7wEYzpzSg/V27LOV11Mm8PvsAGndtK4CTCIR/RItgPgHj9J0g2jm/IOYgCWAOxCKwD5l0yTJz1SFynI/xea+xaBrDfSlmok+cJwrk4Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0V3yKC9MTQek4EwMnAPe8WcBloO0vCpBUnOHVFvMRA=;
 b=Pv9PCJUzNDG6jOZ60IFwWNEoLjfbMvRlMaGLqgpO8SirJD1NLwhz30NsVq/ku6kTsiAKlpR78hKcCl8DKkFg48k260FGhVnOWP3rKK01bGoaM9Z5U1sBosFPWAymE7WEKUheJD+KXInfTh9O14BvwpQu31/bbbsujIaBqMy5Quw=
Received: from CH0PR08CA0013.namprd08.prod.outlook.com (2603:10b6:610:33::18)
 by PH0PR19MB5671.namprd19.prod.outlook.com (2603:10b6:510:147::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 15:47:37 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::54) by CH0PR08CA0013.outlook.office365.com
 (2603:10b6:610:33::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 15:47:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Thu, 16 Jul 2026 15:47:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C2960406542;
	Thu, 16 Jul 2026 15:47:34 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A4DCC820244;
	Thu, 16 Jul 2026 15:47:34 +0000 (UTC)
Date: Thu, 16 Jul 2026 16:47:33 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] mfd: cs42l43: Add support for new cs42l44 variant
Message-ID: <alj9FS+pm5gm8Fp3@opensource.cirrus.com>
References: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
 <20260708140039.1993489-4-ckeepax@opensource.cirrus.com>
 <20260716151437.GA1409595@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716151437.GA1409595@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|PH0PR19MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: 05aca9d0-a782-4d2a-7a65-08dee3518ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|61400799027|82310400026|36860700016|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	RenlJWBXomq4tGkrPQTmIrf5dRcu1jZkku4rmfc6Dt8bVc/XpY2vNQwwmSbU0M9JhGFt0uOZ0v8UTiaGnk/chujwdwamnndM2ou5qaztmcUTr1P/HiezaPkAgthy67wB2xoc7eOFBRzoMA6DJOBzNqeKT9HB7oBIEr5eksJUJYLlanH7Lf50OgTLYuj6/WzLK10XcTg3hr85SQbq9O4xSa8yS+hX+t3BiT6kA2bqHYI9DwAbMIARLNSW9reo8vfUU4ymTF63ftDEEbZmsnI24BrzqIOKn7K2l4zI6bFd89tM9T6nI/l6MbyfHTiom5Xo63voWe/2pf12f4aMqIU/xHx6ANLHOutkKpt0fG6NWR5WTqD4Gkq1CShnh+L1d6fkCx+g9r32pn5NKkLtDqZh0y00vzZZlPSAv9El8b80Cv/mbIhEQIQfwyqql8BkUYoKdFzP4b6vmq4VgwYqqTbnuHE9XuftNBi4NgnkcIM+D6UMYER0lb4MfB+V1wi5HDakQQyo0JOt9eDuPwkqvlFJoALTGXhqoh9V8ernwajPRc+aYORhHWg5AKRGPPidRpwRGHDdOV5wTR3wSMeni2X07JDcxClyK1Gv9imhAc8Dj9dH0aoB3Zcpi1ed10F3+LreHzgSJ46+JKPXQRam97sMBMbvV+u9RfmGMJpswC7QgQyOY3DMEuLolZCl62Wutgqe72Bsg/l9qJVuouBL0D86Nw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(61400799027)(82310400026)(36860700016)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PvTjch+U4m73gsrZm+5qg+2Ymojsr8IjTvpmIAdkwVrXihPIXdba9IJSj5z95qMNuIOQpPcN3AgtBgZaDPGOx2JgF3Rt6y8Jbruhxj/tNLY3ZY1LyAKkWxCERXak00bdPi5yzQeZJjJEtEXIWPBDL9uHKPmc/hFsQJxSn3jYGjRr8NGjlNKCd+mkBPrMWMff62YaRvvTU31TrBuBKLArxWZQKCthzM0G/0jzXojaOAEoVtsOvlVXu9Om1ewBl0ZX5+f68Xz4NbX1yL3oxLq7fVs+j+85QjJqGt1cFi6JL2t9kJOFR1so2f141yU6b24et4iMV2m41DT5ml2q3oUhYb3CnOKT+5BckCBXM91JYj0BVYVMErIgPW19R7aSArajchdASWBJ3BtWE3bq2weR6CtkXywfqcd9wm9DuI2KeJPfbRuFPMZ7D/btWwo63eXK
X-Exchange-RoutingPolicyChecked:
	nR4leeoZiR7JdKEwaFQDQC3YVA5807GaAWx3QzcSpBQLirItYxhuYOeU5R5gl+0sNi0d3F60oUm7M1QOPem1t4zAJbNq+ZzVo1Nc2NRaSrYF3lPN9l1oFL5USHS3kGKZn4d3LdMi6JzROc0QNsR5jjFMlawNf5kioliUzdQshNHqiw87pXCowkl2OOPQYfO1kCdVOwm0W++NVem73RKnnauFJeEq3LuAfzHfJuVzViYG+80CfJUdvdg7dL6myAaAsQ1syRODWzXrku41uzFoaNCynREG1YgrjmSMpFfHmm77BH6EYohAo7C7Zyd/6yxW4pOHuMg65d1bfHs/QWVNtA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:47:35.7994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05aca9d0-a782-4d2a-7a65-08dee3518ec8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5671
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a58fd1d cx=c_pps
 a=GzbtWuAz25DTP0J0usuZ9g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Z2RoK9TSSqQ8JnCOYEAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: ESJHb5PwFZRu80AWh9WiOfh-m509AK6k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2MiBTYWx0ZWRfX4CgqNbq175C3
 3UMhTHr2inP+zKJ1z9h3IBdoehdlvNKIwjO0cCUzPC0nk4ZsycDHxpUILlog9/S1Ob43+REW1Z6
 7rAkthOyZqn93AG0sOshjS2ItbhcF7U=
X-Proofpoint-GUID: ESJHb5PwFZRu80AWh9WiOfh-m509AK6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2MiBTYWx0ZWRfX1iVam447Hxpu
 GSSnI6sfvfnU7mWd1trQ8T1+bEUnfhbER5O2GJwXtroA1IN+gYCjUL9W1Dyu2FqyNBp432qVu1O
 WstKg7rARyofJyVLcjxTtUdMQaOZIWPyL0ojELV5fb1k7UnbcAVr0TzovwUsPOkgZLWpUvjZFc/
 e6SKY4uf7+o6Ue2m69qh6JTP9MvteIFeVaDcPmUptZgF2L9B+9+liqCQZmSRetq2dw5wZn7gdV7
 ZAykceRze8qDPy3vCq6m4yw6PrWqeURS4cEdH736D9nb0f5NmUAIzkkxWJlQfxegc3KKxwkXlSG
 trJCj/Z1hqfloABlNJp+LOfLtJQPcr/YjnbLXjZ7e2IgGn0JrwAJS/eIOiHQ7Tb7cDou+oXSQYN
 VNgYMzTrrefxaGy4Hn6LYGUXAgBB8Ece8wzzgX8DE0bP37AhcbLosN7FDOl78mMyyfadjVEnJiT
 /5SVUTpT4NHxipPHSIA==
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 16, 2026 at 04:14:37PM +0100, Lee Jones wrote:
> On Wed, 08 Jul 2026, Charles Keepax wrote:
> > The cs42l44 is a cost optimised variant of cs42l43b. Add basic support
> > for this new device.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  	switch (devid) {
> >  	case CS42L43_DEVID_VAL:
> > +		valid_id = (cs42l43->variant_id == CS42L43_DEVID_VAL);
> > +		break;
> >  	case CS42L43B_DEVID_VAL:
> > -		if (devid != cs42l43->variant_id) {
> > -			dev_err(cs42l43->dev,
> > -				"Device ID (0x%06x) does not match variant ID (0x%06lx)\n",
> > -				devid, cs42l43->variant_id);
> > -			goto err;
> > -		}
> 
> Needs a fall-through statement.

I thought they weren't typically used if the case had no content,
the resultant code looks like:

case CS42L43B_DEVID_VAL:
case CS42L44_DEVID_VAL:
	valid_id = (cs42l43->variant_id == CS42L43B_DEVID_VAL);
	break;

But happy to add one if we really want it?

> > +	case CS42L44_DEVID_VAL:
> > +		valid_id = (cs42l43->variant_id == CS42L43B_DEVID_VAL);
> >  		break;
> >  	default:
> >  		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
> >  		goto err;
> >  	}
> >  
> > +	if (!valid_id) {
> 
> How is this nor handled in the default branch?

The default case ends in goto err; so this doesn't run in that
case.

Thanks,
Charles
