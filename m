Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD5F38C427;
	Tue, 16 Jun 2026 21:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644509; cv=fail; b=HkmaNFiv0IY05LnXM+SPMLuPwYnClXSaBdWtZr78EYc4koTlEZoyblsKbtQh6b1NfEBA67cLpHaOKTbpHS/lJhn3OZT2+NJNBDs/wxDzDxkhg7aA9aLY2iUAeQ0+SctHLtfja+KpKd0LHatAUW3zpLxJw8+c/MlXEvDHXtN6ebk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644509; c=relaxed/simple;
	bh=AQAw63FsmqqwRkaaJsBUuKsQvJr50QNRftRMljEqyqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GcIv8a+HrBFHWZWeB0bZjveKLsiAaP0/Ul1yC+x9WALGIg3Fo7ges9yqW7nZvazzLV2O8uGCkYj5LzZBhwWqD7Tcl1JJAe3Ql3cUc2nQ8yV6k3VZVZLbzPYPlonvE3eyyISvb+uO9E7ldm2l2+1qaXiO3rN3y8iC5u5bECbXVKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=gP1hsj9N; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xESxHiRc; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="gP1hsj9N";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xESxHiRc"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GISfdj4067857;
	Tue, 16 Jun 2026 16:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+VBnBbZknDd8W3e9sfNSMzUCQ6b16U9hDjf65aY9J
	wE=; b=gP1hsj9NnGohAIndJC5H0xkSgAgS9DGYWFRG9Vaj1lZ42tArokCPLEppO
	gjnH7rHJgiCoYFYEAYcxbYGlYsGXTdRbv+T2lc4AZalVrhBhp5s6MYUdr+ZfQPHM
	UZcgLgKETxagvknGJYPgfJLOI47f24XIYWZbxLgWjCUldmV2SQKR6UzwFD5yMnqH
	pvScpZMYSsAhsBJD8/4mcHvzyJ95p5H5sjbxpQwgMigWGYGSe0w5bNblQ2BgTOex
	rJ8qfRRotykNCs2drTuSqt4IFNlXc+Qx4n9R4yctxf+hkFs4sH9O1IFAc05vxZt8
	xb7tIheKYT+GmmbzSLNDfu8+UIHdQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010002.outbound.protection.outlook.com [52.101.201.2])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4etgc835jf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 16:14:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkK2+SZ62WJMFZAqhjElmti0r/qyDPQZX7J11QSP6mz/Eyjql+KcxaRkAJULAI5fmLx0+Deiviz/II7MyXfuiwcU+j973C6FrJ1fy4mPcBgmZQyHZekUKV6bLvHden5BhMRefo8NvKVWXUhamlo7N3wYudDamqyilOlMLlaUQGfKE9+mItJ2w30PPGXggNeQmD7EdCfkgVi4HwkWgEn7CWgEzELBMxt5gS7yX3ztlk5ZqoxFFXDsfWdTTIHc0WYAJy6TTKI5QQXejtTNuBzyy8nOyiSiXsMEmJQZpc5gsd/X0O2xFi7tuONXQKzuUlViWF8v3gQPLghu32cKESgrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VBnBbZknDd8W3e9sfNSMzUCQ6b16U9hDjf65aY9JwE=;
 b=shRMhHW7qmoICyZ21/+srlnw1Q8mEsw4WThFLvdic9jJXD5cpyhj5AyXk+tFkZ3PFuB8eByhhiLI301lg7254bLlUT1EKeIZZOTqX+W145wvf9cTGPhDTLdwsCklAciOro5gV7oQdkv3hq478PsrTjRus97Sjbl7juv20mc4CW9A+sXg4uWdZJ5Q/VSkoahiCJOiIPrltn3Voa02kJ6t/PF3LZ+RQRH6LeLr69/FlnrKMVkPWY0fi6gpZGeUGPExyQ+0qAt+163eq9ywPzahP3cH0tuGIGXTRHmSIsSVBVlGQ/zKwFTorsg5ONe50dqu2Z1wGIcQZYQR9G/weN04qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VBnBbZknDd8W3e9sfNSMzUCQ6b16U9hDjf65aY9JwE=;
 b=xESxHiRcNjTIZHmjvKgtal0WTJCBP1Hm+ArI3fJaH9qJooKQu4L/YCPE0AHBLadRHp/Vv5DAg015HJm1GWkXQH1sIKTfmyVn1/lXfGPzvZ7v26EkJvVLFub1dcMcp0J+jmVMyTYK4UfN800zXiJIpL57BfS2QLIjtlW10lSAxrY=
Received: from PH8P221CA0043.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::23)
 by CYXPR10MB7976.namprd10.prod.outlook.com (2603:10b6:930:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 21:14:48 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::83) by PH8P221CA0043.outlook.office365.com
 (2603:10b6:510:346::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 21:14:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 21:14:45 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 16 Jun
 2026 16:14:45 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 16 Jun
 2026 16:14:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 16 Jun 2026 16:14:44 -0500
Received: from [128.247.81.37] (ltpf5gwk6l.dhcp.ti.com [128.247.81.37])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65GLEiOT282056;
	Tue, 16 Jun 2026 16:14:44 -0500
Message-ID: <95e84e30-673f-4638-8d0a-1d0d756c209c@ti.com>
Date: Tue, 16 Jun 2026 16:14:44 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: simple-card-utils: support system-clock-id
 DT property
To: Andreas Kemnade <andreas@kemnade.info>
CC: Mark Brown <broonie@kernel.org>,
        Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260515161358.1462453-1-sen@ti.com>
 <20260607163845.652bcc73@kemnade.info>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20260607163845.652bcc73@kemnade.info>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|CYXPR10MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: a97dd1d9-a93f-442f-1fe2-08decbec4a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|36860700016|1800799024|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	P/9z99yv87yiDyaGQhGnzSi3/EdAychgbXUUhO5RhdtICU8ivuy+r3Os8tejpZylpVqFnsE9YM8bZP4i+g/AmR7n2U2Q1in3GZQ5Gdih3dUgOGS+tFc7LtE4AwUAc7Jcs9endThwzB82jU0j/IMqIMTdC1ttUd2K7WJstxeCsJ3IM8wHKcjWDqIXyLbMuxAyoi2MeJUJUiGnNs/qGebh+G+E5pDApMaHdLcKQa/t5PLAIz1e1SRnH/w9Wg0vpH2fR2qGpd2Ek9alpmWYgLsHFKEL+xyHKnkU3+jitkiKy4fasFf4EZYIXnixqBprXem0dAs6Ogr6Su7c/Bc78sAzI5yRcCtZ19MzhAyfO8m/ZZFfUBTBm+EshrYbt+A8F3h37fZ2wfZ3GuDgw3ptEOMzTfUlH4RXKueB7+L1aLZg7TX9il/ZhYH2E02Mf3wv3pk6bEwkxKBxNPaxm2NlB3WlCStVv9oXRlIrgoo9NA0OIQub+IWVrmOrj5nX4dfhkmJb8VuNq1HjlDVHQP5UtQDcJM8gg6pa0VMg276vU1HaXpYMSfP7Cve8f21GxQo3xaZp4V2D7l1Dzn1Ucs5EkyXrrFVpCknlURQ1FeDp3kWfwYJk20B/jr4qvqTd4gAZ1mcVmDB3w5Ykitflmyhgt8SJFZa1EbMUrV0uhiNVNKSv6frA1DM6tjfTxxuo0DMVSocD4NeZFN8ZsM8Y43rAxO7Lef3akDZCX4WEQqpJhRri4YE=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(36860700016)(1800799024)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cq5YtjncbrEWy2cKEP7LMi/6qUlgmtBQsscWefrHp+qSUD/o8Ax7FACDX3ixJIR+1LAOR6rVu2PXkD36UaD6wfDfiA3aie6H5345JILUsGmmoSesww9PKgaVHzE3spEyG6vZ+DrP5H6aUOUuntJVlihFRQb0Kboe534JlscSAPKThbrsV9+Wu3YQ/QKP2/MTrDwuw6BomSmVxtzBwOCeyuhpKJPY4Ot3CqE/agNQZ/ZQJyLs67YdxywxbYm6lB3/6QkJxsyanLQZ7XWuchS2aV37HI+I8Eb2duHiTyEechHs2l6CvJkQ3dLws4wcKcc5QND3ZgstOdNNDYjCwFvw3YLGVkFpK/NLnY/hOdO9X9QaoLp+rM2pk9MzshUBCnM9U5izdqZV+zq3uardNQTdoPetf//mlasgyBKD+seciS5En4VDIETrjMR4bdqgTZe3
X-Exchange-RoutingPolicyChecked:
	XwisclJHz78ACUKyV9VKDL6W6XT9zFgYmfeqokzyntxd1fcOnAle55Q3lGIJJWuPSqD0SuQcglWpzMQU3On9tmnAQfGdadrtu9C48LfcZbCGgNywcZvmPIFFKk241WFH603IMrY5vp5e1HccNearWLolWeCHoFAnhYUxo5OLYvJUD+6J8wDTjX1QlAvuHsDaVWYE6GNZVASNLc/Q+I4iIsBQ9OePW2pnsRdwi2S9aByInRP1KBZ9poWJOEOlqPPI93ngSUu/C7+O7Wo0gR3RGTyS3JL8MuNYsCTCwAnyo9QtCLHZMmbTMFc6gh4otw3A0T2hhOt8y70oP2UAtd0gZQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 21:14:45.5570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a97dd1d9-a93f-442f-1fe2-08decbec4a89
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7976
X-Authority-Analysis: v=2.4 cv=SrOgLvO0 c=1 sm=1 tr=0 ts=6a31bcc9 cx=c_pps
 a=N6h9FcIU3O7PIE8+NyeJww==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=oesMNQI1iiiqKw5mrg0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: cKxT7minaJOGnejIKRk31nFTtR9dKsqR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIxNSBTYWx0ZWRfXw7wwVpG3g73Z
 LfZei/INdoy6cwU++S48XwPnYd8x638SMh5Q51wAV7mEPI4I+HHAWlvPf5wogFJK5Wl2KAMovn4
 bWWfqVtB/RHHGkgZ3ZpwdB+pahHFvtY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIxNSBTYWx0ZWRfX/II7rVTX0kNs
 XWWfiHUZkhNESHcHbuV9mubK4C9EBfPo6JLMJ3BIrpLGhp8OPeMcsuZQXBb7qaH0deD5bmdLUtm
 EMsNi9gQBfZP5s86UNTIeQkPSjDFd5nAgShUqdSd7wDuUWHGkR22FhDBdguSvK5WE8Zys88YzSu
 +pwfXrLpIN485f4l6lJqkmwjBdvZtfKyTj8wO2M0mZLH5tzSRV8KiFHmlvvt0Qin4zk9yb/aTlb
 7+hL7sxs5mDjkVpTmOzUBXN4ub8wWIsO4xiHoajBZC+NIRxNSRA7LfEMSbdIp0xKHlqoax4VexP
 rA/pDaUb0itN/wV6RMJJTd3nnBt39DdGalFiPZhcoA8Mz0xk0ehvDSaEzNJLimNe9SO1W8Djq6e
 gdF31JPg+v4iONV9v0h1CLRTnpKEOiY4+G++r2JGlfP81cQfXfryv12IWeMdf76uDLyo45mkrTA
 oWWYG+QhEy0x7vR9NoQ==
X-Proofpoint-ORIG-GUID: cKxT7minaJOGnejIKRk31nFTtR9dKsqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160215

On 6/7/2026 9:38 AM, Andreas Kemnade wrote:
> Hi,
> 
> On Fri, 15 May 2026 11:13:56 -0500
> Sen Wang <sen@ti.com> wrote:
> 
>> Adding an optional, u32 system-clock-id DT property into the generic machine
>> driver so clocking topology info can be exposed in DT.
>>
> while having this binding would solve some of my problem. I am wondering
> whether is the right approach. What about modelling the clocks involved
> using the clk framework, so let some more codecs/dais be clock provider.
> So things can be configured that way.
> E.g. tlv320aic32x4-clk.c
> 
> Same for set_div() which is also unavailable in these generic cards.
> 

Hi Andreas, just got back from break, sorry for the delayed message.

I agree with you, in retrospect, this patch is indeed a hasty patch that 
only covers up the legacy clk-id scheme rather than adapting the modern 
clk framework.

Modeling individual cpu/codec DAI clocks does seem to be the way to go,
not the one patch fix-all solution I'd hope for, but I still wanted to 
see if I can reuse the existing CCF patterns for drivers with 
clk-id/div-id as an alternative.

Best,
Sen Wang

