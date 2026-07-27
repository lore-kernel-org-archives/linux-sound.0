Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32643EEAF8;
	Mon, 27 Jul 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145888; cv=fail; b=H6uIAjX0rxnT7sXCUSZkCUue/9D/1f1ru4i3iR+eGqJRpZj3gV4TtjJKvk34GwZ7YA75ObbxUZM9y9NdbuGRIu57JWP1LWKMSNFjkLWcO1BNoUKTtzOVRTPIMbfNGcm5YRyQiDMR1qiWTeBNFSeOLvRhGGGKdt9+kbOLmQQQewk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145888; c=relaxed/simple;
	bh=sA7IlSSoqeAv4YW6bClYkXYexwte1szPhRn1JqBswh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2elhMEJUwognp8nG7coH7V1cfB+ArDG0XPA88rYWPz348YUx+DjGaS69Tn74lfDmz0pTNsrBxJyPvLa/0Hcli1AP1ogaqccX1tJlUJ9xN0ZRr2gpFp3w3KdTUo3BkOXKaQKsE6B2InzeXpJlhTkHpn9Ay3oStyjS0ey9L+Q+6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S6lyF1Y3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YTb3dnZp; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S6lyF1Y3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YTb3dnZp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R0VwjN1219171;
	Mon, 27 Jul 2026 04:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5SQE4sm+0x6IKOqCX9KE82v0F5Ters8b9KqF7rx2YAA=; b=
	S6lyF1Y3bAOBGZ6d+ocKc+wVFxPWMaMwh51ijBbwdDcFf3IJ8YOuwdP2hGrTl02P
	xnkjVcNPNq4SlowligQ6xlsKxBAI5tPPyUwl9yrK8r1jQMiiRTqgRW+D3YCRiesE
	cfDruTmnUKiANONJS9jzW64mvmGgD2EV6K0MRfXNlUF5vRZAA1Wx1D+sszBNbuqx
	zS5mOVOxa2NadPdjIZ6gr5L/W6Ip9/+wYjWtv37AXTFps6/g8vzmw9n2Vi44Zk+b
	VMWMUidPWgmRouOASwpY86AUgfD1njy+Ygyxes4shyRfcWCX5MM4Iy1ddX5317B6
	Gdj1REIPCyqyxAL1EJmXtw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022103.outbound.protection.outlook.com [40.107.209.103])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fmsjg1wbs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:50:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNlIaeekrtvjVZ4XSkD+MI4om+WBge7XpPtgSoGSCM5w95/VfHyls/rKzna63sRsZVXw3sX9mzP1n80WOgAAbzUav1tZ8a5912Lnw5g1qtoTaEC4cjCC2G9DcJ2LV1wqdh7cwqpN1p9DPEcj1Tj2PwAyvE5p4QorD4aRfSc/luwphct7GYv9J1lGGnvh9RElB54/JsyTzS0OkNqPgZCQZ5Is0JwiifukwKvG2NfKrD80m7cxbUbv29km4x42+Z2+DLM/XatO+c9OXhK/UE0Hdp9Zsj3wQGe0DhcMNqpHiYPG1EJoQ0vJDtCfHO7xZi0X2uyIZzBW9eZ7ZBl4eHs6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SQE4sm+0x6IKOqCX9KE82v0F5Ters8b9KqF7rx2YAA=;
 b=Xfw7FG2a3E9umosgQEsmq+gHQmKRsh51N1c2+EC2taSncjn/nXwGhf0KwrAeMh1y5qa2Ws+5onvts1FTIGI6bB/xL5MVU0PkvaxdfYsYKcFbN8cZOupDFApC+18sTfklPjafEpBE2QLC14BOmk16KxpKfWg0YwgBiTxQJjkLfC/dyy/EwDLYgf2cREi0XJRnLwAR/rbrwVK3EuLspZjNSfk6b/ADE7UStzXJdQaK4GYUxkPILcugm84rxhMB2jgQsNqsAp/Lz1ohkghk0jLgrir0bB+ydrAdqkNw/W/nBtCBVxXPBLhoWImonHMfeBxGW09oGmWbmxHgKFd8rTqS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SQE4sm+0x6IKOqCX9KE82v0F5Ters8b9KqF7rx2YAA=;
 b=YTb3dnZpBMeBsVtU83IE2kEtiohrcmrTu+O+ywsUqTVgptg1BVm6Dn0CISZKBtVVCSYyyEKyWzszYMmYowZ2P1gO0O/P5FWJL6O0FqvuVQ/N42tDbNNfLFr/B1HSMgYGj+8x8P+ESQ2138Esb9/3d15NSa4GBAbqLHf96rq/xY4=
Received: from BY3PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:39a::25)
 by CO1PR19MB5013.namprd19.prod.outlook.com (2603:10b6:303:d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:50:30 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:39a:cafe::a5) by BY3PR03CA0020.outlook.office365.com
 (2603:10b6:a03:39a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 09:50:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Mon, 27 Jul 2026 09:50:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3D1D2406542;
	Mon, 27 Jul 2026 09:50:28 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 22F9A82025A;
	Mon, 27 Jul 2026 09:50:28 +0000 (UTC)
Message-ID: <64770f30-bd05-4751-bfb4-dc320e9c9173@opensource.cirrus.com>
Date: Mon, 27 Jul 2026 10:50:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/26] ASoC: codecs: wm971x: Use guard() for mutex
 locks
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
        nuno.sa@analog.com, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Linus Walleij <linusw@kernel.org>, u.kleine-koenig@baylibre.com,
        Thorsten Blum <thorsten.blum@linux.dev>, Kees Cook <kees@kernel.org>,
        Chen Ni <nichen@iscas.ac.cn>, Bartosz Golaszewski <brgl@kernel.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
 <20260727094046.23001-25-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260727094046.23001-25-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|CO1PR19MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: b4807072-af6f-46f0-0271-08deebc47e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|7416014|376014|23010399003|18002099003|16102099003|22082099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	RhClou/jbBH7ljx74FzhqJOOyk539pDGp7YuCDbGGnFKVgO+gqhMsqQV/rqHFna4cWHGrCB3w6lpQf9pjk3p0mLLfOO1O5rsSQC19wA+rB9YkdeeWnF/jE6ScYzc43/vVR2wQvmAxkE7U99LEGRETdEasB4p2Em533r9OAc8PVPuY+u6neNGq3mHZIEZb9N6hOLLzT3MnaYp6ivKuzEQ1KjCB6rCa3c8nGbB96jtoZaJYotcuy3Rg2xoOchMwBzRrnoqOABOVUsRAH/FLUpgaQLuIcn1s5/nAkPscPnBQylMMoQSQuVG0V455vbQV899B8WGMgL1KRucEgfHunaYSocGJXeOJ1bURZcvapW1RPRz6xBeMEDvcbIQ5luO2Ng6qUEyYSrrlXro+wIYZFd3Rk+kfjvurNaBkwII2x6Po1W1Cv9oLSg29ssCn6m6HOKV3Xo8XBA9zGal1ug5yJGZ9xsPSQLN+H95usVt/jRDaySBYY4pbYSmo4Mkz5QVkKjCuv0lBfM2w+F7lOT9969qOQYriOzw6SDVcUdvbdrsVKhpfpflZa8s6A87yh1yUGMIwlCFzt52V2qwlp8mb5CDeMreX4vqo32gNTIYDlEnMkiTkZWu8tPat1+V55xGmwtt7MKlwGl+1LEU/NI5kbglOm53AWAXcmSI/M67T81nUSpV/hvWG+3ueMf2MuXsUk0U8GexjB/pzBpJGZWbYDtnxA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(7416014)(376014)(23010399003)(18002099003)(16102099003)(22082099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DASmRqP0b1YqVwmo5J+TcdcIA6rHHtofFIXk2bhNJbxxDrNZlOFaTWU/2DAh/kjXeoXzoKXm0wCDBvMiJHABuSAuaHghYJQGHzQZ/Wbjnn4zz+7K+xzXQq+3bGXSIjPXe2+ESo9x50gSjg3NGGtVK6JtFMJSaTlnvzAsRPfbpsQtiHScptFV0DYpgpIR9dgPK/7ZvcQwFwz7AQ7semQBzqkT0Bz2gB0jeIahK/318xdTty3V+jETHclgJPWWOaiLjA+l06n9PNyNHIcaKImRl3KqZ7jbLi3F3V2asfO4IRYcKcWem7n8sCXPCVA3IrSp13Gg0dbDto0I9r3Jhwi9rEB1Hb9CaIhcxoh6HWe5QNOwiuT6/xvNUYlDmLGVGPLnsDKcr8+ANXiPJUU1Zuqyv/8z+FcG3egfGAsnysKJbwDTv3MLXirBjsPrlizIcPZV
X-Exchange-RoutingPolicyChecked:
	ohMFxV8D3MrVhuZt7hnHIdcWZOfTEVWh9KRgcj6x46Fg9qK+ezOoe0tPic79mRg3K0+FV5UD2BW/sYoyPLzviRkkvNJTDi1kpHUssyo9riyXQN+WtsZ/frzekqcraE/EDNER32P2ZjXWgVlbWhfhw9PeY/pLpU5sCLnSaLPNmBUz3MDelVBZbp7U26cpAGX6UBbYKRedlZb3fVHwM6OS423TLHw5J63EfpzFhyvhE7tC5RyRwYKErx8QEeso9s7SdIh/ekLJjYkRRc7kC8xIgX+7IkL0XWHm8JCuMBbSins1RnQGPgAJMHVhzt5jO88y8ucFN2fl3CisUgfNOvKH9Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:50:29.5770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4807072-af6f-46f0-0271-08deebc47e58
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5013
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NiBTYWx0ZWRfX62tFAm4fiYHL
 EHXO4vrsWW9cfI/91sNAF/RWkyQurjp8O49V3fQwPKfJnBvOwoa0ph6kduGWGfXwxt6cOnJfXb9
 4wtJuWdfscbBCG0OLFp3mFerphVwQLc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NiBTYWx0ZWRfX7DqRmFnK0/6f
 4/7O1I4UDW93VWLul79tZqtx8rwnVqLyPL3xlkigaiCS5fG5zhyKt9APNDXlWw6TDU+5if53cm0
 v8YZbEaQDO+0NlR99KeF7PjHWaU7sQyJu96dMd7XspGxiChj1X9VltpvUlIYSOOVVXKKSiv82/2
 iWDurHmMDcXGFjcre9je9smNha9VbcjD/3oW9Ufi8BmPmYv7Z2H7yCMhhMK8X/sJzg8poJQsSU0
 XdsvdK2FZ7lKuZ+j+3LKc1ccrOmQ7ZDmMMGDvcjjlfgUgkT3UtJZNR19dnEm/9ev37S/mq3TOmF
 vwnQKwjKHpKCDLfMlD8XMximE+/B95plX/O8OocTEFaPVSRU7kZOrdtu74NCkqa2Ms2JGFFqUx0
 2G+tPvYylQ2VTtQfptBEjW/blOCwOpWZbfoJitU5ifhEP7ru7Jk84tpiaOQY5I9PAILYT2bAtp1
 H9r45CPtdrCSGoDqanQ==
X-Proofpoint-GUID: jsXgrPVpaq3KEEnhYfqIHEJvF18cP7LI
X-Proofpoint-ORIG-GUID: jsXgrPVpaq3KEEnhYfqIHEJvF18cP7LI
X-Authority-Analysis: v=2.4 cv=XLwAjwhE c=1 sm=1 tr=0 ts=6a6729eb cx=c_pps
 a=xj9m5St4rme5bLz9Jope3A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 27/07/2026 10:40 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/wm9712.c | 5 ++---
>   sound/soc/codecs/wm9713.c | 5 ++---
>   2 files changed, 4 insertions(+), 6 deletions(-)
> 
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

