Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D23769FF;
	Wed,  1 Jul 2026 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908151; cv=fail; b=CQhpqAY9SL85/eYr/10/LP3dbZwl2xEckk7BElOT/RmrN3/HcOAYDE38UwufUQMSHQRJtRGlfyGHbtlzqsZauBAdh6kdj8bQNhxWDDaNtKNoVP8AQJgWELKTAhmvKycDU74Pfa6TMY+/8eCUlib5a0kDlhKh4kBdtOTHHm5Fmtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908151; c=relaxed/simple;
	bh=tPk16puBgnNLYeSK/T0f5UJIXUypzqzEoUpkx84ekpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRARGwBybPFVcDrnxSeQqrLgZ1wy1OMSgrnuCHcWtANtrtF+JUl9L+k0RdnUcT7Xa+W1uiyVt7I3Z6MNQ7G556SYxi+y1QBZYe1ot9X6V8rhF45Os90QXjonBPD33m0KZPA/MZOVCpABDga66hgSoyquFCt4gOG5hRVyhUc8sb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gwAsJsfs; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LhkC3s6m; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gwAsJsfs";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LhkC3s6m"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615Tk4g1102252;
	Wed, 1 Jul 2026 07:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mg7VgVSQLQnAJl9PWBEgQ7fSWnE/OVv+Z0D20odD0Qg=; b=
	gwAsJsfs/XdYXGOSM0JTKzBcT97VZ1ND3c9BP4wjlP4XrIGqv5ziTHUz0YUA5ED4
	vQTSKVm7/maXFlEsMW8vMpnfsM73XXFxObOngXsLZyBENcLtui8/TVkAgvX9nRTa
	eqvq6clj5W3vboO6rRvj3E9Li3QwyHj8Z/N5W9MS72abaY/wIEcvLXCbFZkFCAeb
	saJidcLf4K/YJMAcePkPJ0jiA+8m3+52s7VsAYoHWST8sxN7YUGlx5M3s2QzAiHX
	yFf1K/SC7IVgSvSOu0jQW3xL7nM3cinLPxs5mg5FO240L/jR8mut8ioipFH4poDD
	XkhfYV7ZK/xH0jZiDYJB7w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020081.outbound.protection.outlook.com [52.101.85.81])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f4e679t56-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 07:15:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNSOW3E6xiqOba3PpZ7F47nF059+ttskWRKOkReEDbdLhza1TDPOpwOA8YIFeao2dU37tmLhGTA872cfD/2t0C9TWzZ1CWp65TJIfCryRDL7kwq+/g8pbTzIc3oyVdIlpY7mUC/RsYlR6NzW7ESxV2MvV79X9+FB0e0mFpTnsWqcezglUqXoA2ZtiLEUcSEtuoDGkno2W9UW18PhrPZtLMvWCXx++Y4rho8XF3vPLWA0hGDTysEQYKuzBlE5SJyCuz0UsR3hczPFursCB7iwwZz2nXTCKiGlZrvcQasWygn0DbW9BB2mgnbcBEHX8AoOe602Sl9rvxnxvPKermdJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mg7VgVSQLQnAJl9PWBEgQ7fSWnE/OVv+Z0D20odD0Qg=;
 b=chKbCEqYF/F5dbaObtPc+mVo+6XIDDIsTccKxzMroeljRY3ZCGscR7GNlzv8EnCAAgkfV8gVwter7lycdYxqpsRFKzU980DJ3Zej0j3gA5mRcZapg+hwC5+b2yEi0o+4Xw8UZ0k1wxcWcbTAGPFQCOGK3tHT1hnjgW5z0GP8wyEJlhKLfSvL7F2P045gU5ap1QkI/tVn7pK1uiiwVA35lz4hvbhPpYNWn+WCScjb4EAX/oNEhoU7znqCAPL3tVe54sc7o+qPawf7rT4sdqxOvFBDYqdCf+umlQifHGitVm7YmibHAIIu/RYoUPkfFHnMRE9K/IlROLWNMN7hGG+69A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mg7VgVSQLQnAJl9PWBEgQ7fSWnE/OVv+Z0D20odD0Qg=;
 b=LhkC3s6mUlZk/JogYWjVh3qAUtilTD0vq3lZhqcvjoBN1oi3LcEA0k5Xrr5x1YTnJGrm01XHLyGTjuxRBlFF2oNh07ZvxUca5ULLkrjrOnZmYSFqc4hk3qmmvvJlN/X6m2YyRxTLuDaat7nTMTw18wh9raGHShklCbgCt4WjZT8=
Received: from DS7P220CA0122.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25f::6) by
 CH2PR19MB3733.namprd19.prod.outlook.com (2603:10b6:610:96::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Wed, 1 Jul 2026 12:15:17 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:8:25f:cafe::4a) by DS7P220CA0122.outlook.office365.com
 (2603:10b6:8:25f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 12:15:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 1 Jul 2026 12:15:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 14EFF406541;
	Wed,  1 Jul 2026 12:15:16 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 079F482025A;
	Wed,  1 Jul 2026 12:15:16 +0000 (UTC)
Message-ID: <f895956a-a5fb-4b52-813c-110dfce8549d@opensource.cirrus.com>
Date: Wed, 1 Jul 2026 13:15:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        "Liao, Bard" <bard.liao@intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        Richard Fitzgerald <Richard.Fitzgerald@cirrus.com>
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
 <20260629144450.2096823-3-yung-chuan.liao@linux.intel.com>
 <11f8d158-9ddc-46fc-9cd5-11a696d3413f@linux.dev>
 <SJ2PR11MB842410EE22537B0673173EECFFF72@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <520f67ca-941b-4e08-8985-03f0e09b0313@opensource.cirrus.com>
 <46af3cdf-d704-4cd2-bb24-cbe9fb1303db@linux.dev>
 <e326c51a-4690-44c4-bf3d-0870591b1eed@opensource.cirrus.com>
 <74bb6575-7d92-43af-98fd-dd46a83b2fac@linux.dev>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <74bb6575-7d92-43af-98fd-dd46a83b2fac@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|CH2PR19MB3733:EE_
X-MS-Office365-Filtering-Correlation-Id: d36d1e47-cf11-405a-a822-08ded76a69d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|61400799027|4143699003|11063799006|56012099006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/Wn/ltyvdXafjdqEyfYciCkbybRTKa3Smyohd6ARi8q7gkzRd8eChSyaeDleCTYddpbSIgSwZSH6bGnPBRvq0nSeFwiG2UJ4WY6oFRDWKvW+J3a0a5nstjfJ3pcwIvPk7CqWjVyefcmsgHrOdHOPCYIAPtTT7nHd9r2S+ufQDLnTfTmYNzI4KG9C44b+uahO2uAd+SF6jwQewQq3WEB4HrnfG09tpeDAmQDPADd557SXDxBlXwtkxtuyzLfOy9m9d7ZUBRz+X6Y7/GRdAYGAQBpv4vHOLZQeH+hpeKZooLoG+tnYSJ+upTLZRO2khiUwBErj/Kw2h/XihvHT0iOkW/pKwkezr+r8UR9jpHDE0zm8+/8ifGUU47LTOZH4LsOeP6KoE+K2iRrwMX385WmR00ff5mPfHCGJ5MnTOX78kiFwnudCFR+9Uq56nrKYFU02z1hZCjHb9v2XnXt7LbPo0d4FbQQuCwZm5JChyoozfDiwyn4vTRtkI0IA8vz5QTr7ZfS3B4+lUM492WqjS5jdaMgvnt8bPoCu9X7bzC80Qy95r2FG4WT2ztIZhnNNt6UYUNRXO9OD0XiMSmiAYMdMJzMJd/+cRz/diXgV8AttKu4NGu7RLWy0AfSMhjHh6v8qF0YKfrgn/3Ht6dLfFDYyqLhMAwV+kKkXfhL9yBQC3ZQxdj/ifti7tIgh6/Mi1lANMrK+V990Vl6iP8M6gJkg3g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(61400799027)(4143699003)(11063799006)(56012099006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fVY/KcTkUZ6PbO2vJl813PaWPfEtR8wv65TBcwksidImqrRbvtSJhFgzBv9aECgx80rLUti5+57IfQNbXtnHvoN0saVMPYUifShqEEoTYkpIFSVsZ3Jas7RdddT+Gv3GfxIPxfMUa4GlXkh+CTu9lJI54KxFnD/akv6lZIhYJ4rW+pFY0wh8eRnNWIluZAHplprvn6zKucxIbQY4nPjqOYFqMq0yokv2dwkBD699h1ZiWoYvf6CwaT6mx2tM6oBd4JB2x3WrqiWe9rzBpZ15m2MRo5kqMlBNGo/PmV8FIxOhQihf9lcjtJlfc07tj2iZDaUBnmascwZaIhLZB39xp9WkdLQT3cH7zUYOFIXEZzaJQyC59ii8RvXQ2ElXtlRRyZCDXWD2dFpdkP3dVl4+olXKb5NY6x5cIeNibl+xFyl89WQ58KIQWy4/YQzuLSGg
X-Exchange-RoutingPolicyChecked:
	sjdQfrFOqPC2P6LGlOWq+Mx7dOa/1TqlLr5D7EBqNbPWSNxqVUkF10mdZdkuR0OAK+n0FBvbMqlQtb0yInpAAMwHcW8UbEn2TePKrB9GO2R0279VjCD8alg+XiCDDbT7a7vXcUGaU+inYA6U9X9wmkZeE+KIziF9Da+aYMYWauBWcgfLnmFF9fXdJ35bCavpTIKe8VOncSg2h1ctJgKvxTTdylL+PfedCin020cFm0ot0AKop7XM9NKBAZAcgs8GDFhhxV2szBRYUyhvdCjsy+uSC8nggGb1JTWGCmQ/OUwpX0Tx4wkcO//3YW9tbsdC1zUOfUDhtPKH6UtXXrLPfA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 12:15:17.2527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d36d1e47-cf11-405a-a822-08ded76a69d5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3733
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyOSBTYWx0ZWRfX06tlONribzAE
 Pg2OYnBu0yVLK9PSahyMZRmlxYJGHDAq98j/vEBugN4DaBmWeqJQfgBhv00ndW4CQmgXIk10wKX
 aoSmLrzljF8dVyETh5vGpG0TpYhSRmE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyOSBTYWx0ZWRfX+5sq0dKRNGGW
 pS/0qMerYYoAyGyjQeGp8JnPRHKe7WZ+YcKZOeWA+hdzAtSP8HSCJWqcEYgZrFXjUxQjToyoAXW
 TCKVr0xs3Vlz0QtR/akpi6QZx3+/mrYEh5kujzjVXN/SLun3YGG3CLiFYK/KP98+LCvE8PFu1tP
 8QDVmRFJfj+30hIe7OawKencccWhh3AFbm2Bdo4zwggwiRG/hCEwsGGZ32OxqDv3pNDbcRsn7zg
 zwY1q7PTl9fUSDHGSeY48yY/xYPEKVkZ26A0ME9HebGPOTTnAGMS+072bSWl+f/gnKlxY6nKNa3
 xxJS3IrN6y/ltzrRRnWwDPnJSI50musvAUziHmogOzfkjB+m17YI9+EfnMRqve8Y54LgvK8sTXq
 mcU0HjrdJg0WE6qwG9o/GWCHoy+1T1uOnEO6W2I7tw3+aFbd9q6crPNj91e1YcbZiDjxcLZsx7Q
 20CAyF6VntKCvdwdI8A==
X-Proofpoint-ORIG-GUID: zL3nrdcZ_JzyjeRV6pDBYpJImtbIVo3T
X-Proofpoint-GUID: zL3nrdcZ_JzyjeRV6pDBYpJImtbIVo3T
X-Authority-Analysis: v=2.4 cv=PrSjqQM3 c=1 sm=1 tr=0 ts=6a4504dd cx=c_pps
 a=PrKk0R3FxLq9+u45pGB2Yw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=eIzNlEQKd79gDlqRmcYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 01/07/2026 12:55 pm, Pierre-Louis Bossart wrote:
> 
>> If the Manager doesn't send a clock-stop, the peripherals don't get a
>> notification that they can enter a lower-power mode. The clock suddenly
>> disappears without warning and without the peripherals being notified
>> why, so they don't have any information to know what is happening.
> 
> that's not quite right, see below.
> 
>> The Manager should send a clock-stop notification before stopping the
>> clock.
> 
> That's exactly the existing logic in drivers/soundwire/bus.c, the core does notify all peripheral drivers of a clock stop transition.
>

It's been observed with logic analyzer captures on real hardware
that the clock stop is only being sent in runtime suspends, not
system suspends.

Because of this, if the bus was in a runtime-resumed state when
system suspend started the clock would stop without warning.

Bard - that's the observed behavior this patch is fixing, right?

> sdw_slave_clk_stop_callback(slave, SDW_CLK_PRE_PREPARE);
> sdw_slave_clk_stop_callback(slave, SDW_CLK_POST_PREPARE);
> 
> These pre- and post callback that can be used by the peripheral for imp-def actions.
> 
> I am not sure if the POST_PREPARE makes sense, since the clock is already stopped the peripheral cannot be programmed. IIRC it was added for symmetry.
> The PRE_PREPARE is most likely what you are looking for in the implementation of the drv->ops->clk_stop callback.
> 
> Hope this helps!
> 
> 
> 
> 
> 
> 
> 
> 
> 

