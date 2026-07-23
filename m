Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B89047668D;
	Thu, 23 Jul 2026 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827704; cv=fail; b=h2XNsUhE8QUZ/kLK1l+F0zIOMo6KP5tq5DZYQq5CVIdBB8LAxGe4KqxtrwP8sY9Nsh+PFw2pU//oQPISNZcpYt5F5nMElUS0vQijV7gXs/+hyorDDr6vt51rUoLxWbeSdPW2JUCLF1ZZoTIJI6Ys9xFFzV7UcJcd0fXaSU1n6nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827704; c=relaxed/simple;
	bh=kn6VsuQl+GTI/QDpkTQaMstXrEy5xqHfQk4yUrIz0pU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1QfkKDIDke22lofhyzyIHA37zCe4zSpGkPvYvCShhbp+xfMmg7RGaXWOGkBjxBrXEeC8aSUAdaiJAoCdgAVpL8pS1kfkElYv4GkXJcmVBglaBs0TAZrsBGJS1ieZgpppw0UkSy3CHXTnKkxImI8/6JuyuVHYqW/jZtzzm4TjpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=L8q1FtKZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ugbeyaye; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="L8q1FtKZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ugbeyaye"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NGEYDF1315228;
	Thu, 23 Jul 2026 12:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8HZMob0GdEtySytq4M7Q7B1CWv73vJyB2MqK1f83W1c=; b=
	L8q1FtKZs5rJy7c5j9lvD87xwKciW2Y3h6fXJy4VaCx5dYJ8SNgNCOyx8BLK7n2s
	rUkE1utnMzSd+7gHaGSauPDfFLAG6BG750DcN2U5QkkRN9NdtPWOfcnVQNBza8Ke
	RHgrIsZLwvJiT0Sgnopo0yAAtj9Zg1Pj++lPYiS7u8paUzf48Mf+Tb/wpxUvqUWI
	DcPEGlqiJHfi+eGPPDXNBQbUSE9L+SmXeLCM9kDB26I7Fu70i9RJ5rF8EQazlnc4
	nIokSTJUZi5welbGhbI7/fWQF2T8o17otTyREZ2esUZZMsDiFv2YEzxJjENUVwIn
	FiZRFqwL+AuR8EOgpNedrw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023143.outbound.protection.outlook.com [40.93.196.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vyqq04-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 12:28:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Im7E96RF+ZH8kc8qjQ9Ur8ooKhKVms7uU9jrbtydB4izra1ODFX2fzWhEtcSUHD+vFXv4O5OBsiuAAJTGgrW5zXlTAmuLtnUmXcd5OiEE20JmyEYRGC7BuUejKhPEtteYooe9AJsfLg0lETs4wqS7HcZPVijTsIiz0SwFsAR/CPXx2cLlo7zziuoxevS2zw9oq4nahZlaXTLM25uSs0tWdqetcuW9VmTs/WTXBXE1xkdOOfa78QDCoo80o8pNRmsV/pXj8aV/OMBHA8bUVJLVQt7t5XPiFMcprH6OqINgY+QIjHXSoEwc3rTYAWLI6k3vX5qEW2Q17Bg26exJKdUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HZMob0GdEtySytq4M7Q7B1CWv73vJyB2MqK1f83W1c=;
 b=GUoNUYDBMzC0QvLy4q7gJF+3vB8+od5ve2w5ojcvpG+sO43e7JqZlLnpUQC5DaVriLSSP/Zv9DCtOdc0UlHWVxHVOTd7qIYkepPYb0UY9wnQjSUsTEUsOBA2hP4VMjCMBtaI7+BABHMFAr3dVTqeHLbdvysZ+9HN8xwzahdPXRnZC25uiiL5gFVNeLbawiYqZIljSfFwgPZ9PIeAkdk93++6BLcmmbYJykPDhwhU/likPGxHo3hfPZ4U1vKUW/721PPwLla60ekfP1AB9xDVNiuNsGX5LPtj43Yp84kayF0iU9d995wsJr0t1UM41wTl0LY+lxCMwvQKcV/0z2QFTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HZMob0GdEtySytq4M7Q7B1CWv73vJyB2MqK1f83W1c=;
 b=ugbeyaye2hcFn6ljLWrYJ3F4ZoLItFgMlRo5GYULqfD8MnNZXgWGBxIjJPQRJ2U6A+Izth/Uzn3Fl7/EL1Qk8meC/Tbo99Wn25PErPAkqs48EBw6riov77QfFAQhwVn72BIG2gqRrNEpkP7+iISdkpZzyJDrmFiB/LU6YGCLLZ8=
Received: from BL1P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::31)
 by SN7PR19MB6784.namprd19.prod.outlook.com (2603:10b6:806:260::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 17:28:02 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::6e) by BL1P221CA0024.outlook.office365.com
 (2603:10b6:208:2c5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 17:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 17:28:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F099D406541;
	Thu, 23 Jul 2026 17:28:00 +0000 (UTC)
Received: from [141.131.157.57] (macMW3KVPQQ2W.ad.cirrus.com [141.131.157.57])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 29A4982024C;
	Thu, 23 Jul 2026 17:27:59 +0000 (UTC)
Message-ID: <53147854-3d08-425e-8589-ca39a7b6d2bd@opensource.cirrus.com>
Date: Thu, 23 Jul 2026 12:27:57 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l41: Restore register state after system sleep
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
        Stefan Binding <sbinding@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        pgriffais@valvesoftware.com
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260615-cs35l41-s4-support-v1-1-f5a21e35dd9e@collabora.com>
 <adcf487e-a6c1-4439-b986-c421e206d6fe@opensource.cirrus.com>
 <a824dfcc-71cf-4ac9-b17c-563ba857cc83@opensource.cirrus.com>
 <55cecbcf049d3e95d3a6d0cd33004fbf6c7d01e1.camel@collabora.com>
Content-Language: en-US
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <55cecbcf049d3e95d3a6d0cd33004fbf6c7d01e1.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|SN7PR19MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a450430-377d-4d27-3a3e-08dee8dfbf71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|61400799027|5023799004|11063799006|56012099006|4143699003|10067099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+SkSsI8+MF/yLUpZGPG7OHfVlbMo16Idx1IL4/e4S1TlVqsLW6Cqu0OiYa7n8LjoS5JJM7ih34t4hCe+ijrW8gCB2kvH3TJag3nQk2vcnB2/i/5yw2ElkJLv0oLbCphv1JeF+0gd2rzySVfP/qmWdlgbhuN8y+aYwo1w8PkkiiF4bTcmHSzNaDGJ1V1YJY4iforVpxxy8sz3CPtOwIhGMngEH0W8w9rIDf9UzHhnBwXT5+YdY/5xU2tpyAiUunIvbVP3gkc9HrsIIk2WLU+6mp+jYjHOrmrojxSMRwYdSms28lCPOrek+4X5oRY2rFaN6uHGdrUNCuRhJXLqKTjeEReSHF09DusF6BwYf65xLuLEOdKy2b7gUcalI9zN21FnWsYjlWDe2NOxgU4G41NRgm/6outbCnQ5A+BFHmCWLIrb4bdY3dqM6X8WiMAvcBgx7hkcuvfcTUwb/5altblHcKtB9hxnwV3KEpcRL7fEygsLbpavPKs0cSJbYN8UizzLg9ZkGaga7EHiSYWKUxOEKgEbkfAhH4F7CHCMMvpv0Yp0PVzzrPoW6XzbzLB7rzH3UBsddmc3Vxh6MTG3dGkWHdez6LBwgbunCncTxSe3cKPPdhE/unrlghYVn70XByURCXWvomMy5XvMKaXhQYL6C3fzTQULZJNuuaFFoBc3LG9+bOjTsRes1RAt/YHutqeApvNQm1KB44iRCpafVVXtQA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(61400799027)(5023799004)(11063799006)(56012099006)(4143699003)(10067099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6OmVqd6Dyz0UHGYlCsYz6CvILebrQ8zS/FVpcgyMrHUXmrn72lquynlmmqb+n/eX80v5dxITTGLtPcfUfzhr37GHf2Q2611YYoRr3fQYU0YCEFtH0gqqmnE8hjuuocS/VdSwgc6avNrnCngFXpZmo6qSK5hdhz7DtFsoR0vDCOTpM0pFUk7idjg+w7SqVxL+BRwIMJgoWdc+6m1v5vMSstiGE1qONddW0TW9fzMsIjrcB6KWlclatU00RCdSI07Lu6CGKEqjbWid6c5LilFQsx3CY3IITuiVwE/MgPxgjPFlLUNzUh3PiXgT30CIjMU9uUXUAQUfliLB8/05THnmiRO/x196NmR7i887zQ/2PThsrad9+wAixJbciPi8GcbCGYXI6vvFumPMJnRbBAEJZoGnRnPANzNtC/bGXHBBYNLXqy+9QKeDbpxolsJrgAl1
X-Exchange-RoutingPolicyChecked:
	FZsrLmaH6+DdeF8YsGYvFiLB9iQR2qXr6G8j30hFsn34oY0PT1q6OGxjGYGLkkhlut0U7jd45/wfWS5xoqkGEagLTf6GPEombn2Qf8u6BBSYZ446kB2b3Yi6xA1uBW876oPfLaeHuc0t2SNrBHuep1rLzXJ8ySmiDspXtZkLEr3CB5QRxzbdQaxqBPfUf7xUg8dOSmWQGgf8ZRCw/4f5e7Kl+uOn2QGsGreTuhSWZj0OrLND4waH/vI6IFWSNoNzymXHVB//qqBdkcxJvLKYEE0jS57br034djQHXxsJH2ncMbAK64uGyGPCV/dFGQ4zaDTpcPRtCbw70D73MkyTnw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 17:28:01.8345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a450430-377d-4d27-3a3e-08dee8dfbf71
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6784
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE3MSBTYWx0ZWRfX7VO4W9gkV6HZ
 ppxUjUhjbS71s4uaKVM9ApbQhpv0aFJYWFeBzAt4MXucnx+RArSkIP5OelZBYkCA8AIAt1WI+SX
 6clvrsc1xZJqSvnRTi09XcN1gUr3Uk8=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a624f26 cx=c_pps
 a=qOSDSPx+mU+qTyBbANH+pg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=N-yuk1UMktN7veADnakA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE3MSBTYWx0ZWRfX2MxYHKMtyK4Z
 bwz5fQMzq4VTl2o9D9rmVbtZRym4Mlg/AormPiXVrax5C8YshirwHL3PldJfVXtCYYZWguzqzO4
 SMcjJufaZK+1UjWht9R+1ICqm8sBaW25Gv7eRGdg/mO8pGhUMVJFi20L3aRin1JShUM0t2gbuUh
 cMp+lijUs2qHXpawaNwVWf/rkWNMNFJi11slKU/VgCNvWPzp+mFE2tlLNXy4C9fgrqFbvJ41SMD
 KC/RCemUXmOW0HfmpsQ/xyFERzlHl4bvFQiNpb3icHd6p9ctRlQ+Ge9OyFcffv1KYqzilVAGyAi
 Vq+i/qknQmOYfr31Xd1jJh/Ycj1urxVKBtmyWU7sbUaOfFglS+nX/PyLDP90Y2iEf+3OtVzOh4O
 ARz/3SnOHr/bcae3HVZ3QTeysD26swFqOsL9r4IfqToDbDalH5OSHBLAfcDprEbKvhvGD0gIdg6
 OitSxgfAM/I5fm+DfUg==
X-Proofpoint-ORIG-GUID: g3NnuPsms29D6QGz3DQRe16LyO-cXXf0
X-Proofpoint-GUID: g3NnuPsms29D6QGz3DQRe16LyO-cXXf0
X-Proofpoint-Spam-Reason: safe

On 7/21/26 3:08 PM, Nícolas F. R. A. Prado wrote:

> Also, since on my system the DSP is not used, the early return in the
> runtime suspend/resume `if (!cs35l41->dsp.preloaded || !cs35l41-
>> dsp.cs_dsp.running)` means that the runtime suspend/resume callbacks
> are no-ops on my system.
> 

The Steam Deck LCD should be using the DSP firmware. Valve distributed 
this initially but it was added to linux-firmware early last year.
See 'cirrus/cs35l41-dsp1-spk-prot-vlv1776.bin'.

> Nonetheless, I tried simply marking the regcache dirty and syncing it
> upon system resume, mimicking the runtime suspend/resume, as follows:
> 

> 
> Given that my patch that fully reinitializes the hardware works, while
> this doesn't, I'm inclined to believe that the chip loses power during
> S4 indeed, at which point just restoring the register state is no
> longer enough. But perhaps you could shed more light into this since
> you're much more familiar with this hardware than I am.
> 
> Thanks,
> Nícolas

Thank you for looking into this. I agree with your conclusion that the 
chip is fully losing power. With that in mind, your implementation makes 
sense.

Given the above comments about disabling the DSP on your system, I have 
to ask: Are you working on a 'standard' Steam Deck, or have you made 
other changes to the power management that aren't present on a typical 
device? Has this always been an issue affecting the Steam Deck LCD?

The Steam Deck is the primary use for this ASoC driver. Valve is 
regularly updating the kernel in their OS releases, so I don't want to 
make any changes that affect the out-of-box behavior. Of course if you 
are in touch with Valve and submitting this on their behalf, no worries 
and I'd love to see an Ack from someone on their side.

Thanks,
David
