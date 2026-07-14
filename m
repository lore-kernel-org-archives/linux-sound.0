Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4833655DD;
	Tue, 14 Jul 2026 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045860; cv=fail; b=OpPxqC+eTBRLpkPnzEi/Z+0scYhV0cnd/NSODksGD5ZolvFZslUd85mLoJ8/ntaHQYH0PtA+SZRRJH6WSiMJR5DS2QHA2Vgh+a4T0qY9VCN+q8kVv++snRx4uM878ASk5Zd6r7btERMRO9DNB7R23SK7VgYq2vK0ydxkSzfD3xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045860; c=relaxed/simple;
	bh=5YVNfTefhonC7jcUkJxl3JkQrpPbGDGyf2Z+Cll2g0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3scUyDn39ZLikYO1FN+D3x/ppFcdJHSCcxKeLEf79z27+ylgxEwt1Qv1TO4+ePgndJ4DIaIi7x7zylh5vDrt4gdLNPEbGEjGPOXdtKzQcmmGzSUAJbj579kZKVAMvM3WEQ61bDhhbJQsme1iPe3dGBP6ZtBHS1oJtpu8dDbH/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FwzBXXHL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RhcxnxHA; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FwzBXXHL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RhcxnxHA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E4voms2160427;
	Tue, 14 Jul 2026 11:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=azm6R482AylOLMFS9Rxl60q268WuRdttFMzXBYOunHk=; b=
	FwzBXXHLM5JZujIo3E17WyBZpr/Q0pamlBSlyfovSG7Nj/RhvM0dxEWnfQ/Wa+M4
	ASM/leSU7v3o0Y83xcsZmc4jby3eRgSF6qXus+DHBKSrVC5YDPKmVO9H65bATwya
	5k+KkeuN24HPgBTit43INU93htmCT5tQ0r3a4f8HeLkJFaUQhuZQNHigxZLkFG+A
	M0p0Zr4qyCxzzvvK0luN8uoz5/b4k0+QH/N6C05Mhf3OZH/g5OpU5BUrg//msZfv
	5djQUpRqN0mYiu/+8gzgn+3Rj2fKJZtgKgv22qGvdal/rlE/V7UYsX5GUnEByDmD
	5m5HJtKQLU/5uYHubddLkw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020113.outbound.protection.outlook.com [52.101.46.113])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vv5dd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 11:17:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xywH2SYOo91dcShmhhEhIXjGrc3fEgrDV44118/vKYFMQhzmSpl4k5eq3s/2OhrOpIDKZdK9zxWeb0vn4L4g1Qnp9i94XBJbNm0mthtpL3+uwAgpFHA77Iy2ozXfhA+zmpHp4qEQjyyUe3W6oKhKHBs7965Wvb7CRZeQ7T0bCrbeBtgKY9ITSgjb8HKxrdRKeM8TFirB1mVmELY58gVlkNJYr4GWFhgUK0cGM7Ysf9lkQ2mF2OT15Z5p83vfVX1R2ZfzScLyCyHMCLqzxBlTBiDy7RM7dDAEayXoREtuW1//eIwWpLbQMpgPRz7RQMG3E61ZWPM+7wl7yBSbIKYJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azm6R482AylOLMFS9Rxl60q268WuRdttFMzXBYOunHk=;
 b=l2DpmAOKM0RbKlU957XQkrm+YHMMWmCD6opULmgqVSTfnynL/uWI+irTZvkRpvkji+DOv+VMp0FjKj4OWuqWIOar1VWdFqftMwS/RtpUB7NZOIu8ARFjw+SxquDlcWVOi+b+TvlKlgnQn2FiNok3aWXnGmDhRqiQAO6AHRp45jpkqJW5SXp168Wp7T0miPiekXgxcvJK557yRlCFZFUzcK8yCiCtFAF1jngGCWoQNVyXjnziaFNMKCBqRiZQMXJig1ZntIXyeRWHdJGJAIg2XyNmbtLorruvaLQdTYOl+MkW53EEqVaiakE+vhot4OYRWci7YA2jT+lowzKgYlcajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azm6R482AylOLMFS9Rxl60q268WuRdttFMzXBYOunHk=;
 b=RhcxnxHAruSnz6lexCWf3I3CKmsuOf+gaeJUxiGB7jrxSLQ9oZEBqttpXZHU7FEXaNbKMWOilJJGrefxu5XDgJnQbBXEUASY3ywelDTeaO51hfXrjwLBvbgpKI0M05Q2TN6QWbCcZiJjgrJ2YQaKd+o2D5vGdzU8XpGz1rntD64=
Received: from SJ0PR13CA0204.namprd13.prod.outlook.com (2603:10b6:a03:2c3::29)
 by SN7PR19MB6565.namprd19.prod.outlook.com (2603:10b6:806:26f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 16:17:24 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::17) by SJ0PR13CA0204.outlook.office365.com
 (2603:10b6:a03:2c3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 16:17:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Tue, 14 Jul 2026 16:17:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4E90B406541;
	Tue, 14 Jul 2026 16:17:21 +0000 (UTC)
Received: from [198.61.68.151] (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1F3D182025A;
	Tue, 14 Jul 2026 16:17:21 +0000 (UTC)
Message-ID: <6cebda31-08b6-41e5-9335-a40ce2744d29@opensource.cirrus.com>
Date: Tue, 14 Jul 2026 17:17:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
To: Steven 'Steve' Kendall <skend@chromium.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
Content-Language: en-US
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|SN7PR19MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ef8695-eea1-41a2-65c2-08dee1c3630c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|23010399003|16102099003|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	LuFp7YSUZj21q+wYkzqDHys4g4sKFSs+TD+mzuEkKFVXOU26OmJUbzDmXKh/3y5aq46EOlNszCgRPscywGzOIewdFBaY2ANqN3H4FzQd1zbHiXZ6RtgyKKMqzWshYOrQQzMnkg1E953XXMbCdt362ljw7jMZxlKYeZAxX4Z0yqTm5L/UoUfSv+r94nfJKaWhws0+GvkbNHj77H2P3QhHrNTY6BiFxldKCZLZg/2qxVCSz7dWugmhpx6sSs+gMBXlJd7HZ6xs5jEkHywNNLvzt+FTg5g5q1X1WCAYOYneW41AH3xUtOL8qMNxFkH7VqKFBAs1PuDHovLSd1bMNBdj9h/HSu4u2v0IjoGxTdkMquAZZW4ElAbGfWlZiwjsGc10lCiRCo3HPklCaVAA5INqt5JYWEygJ0Hh8nx7pr5GVCVr5jF2U3QqOfmILcH7l/nAOVU/rWuA6zsXfeYKs7H6IOqbBhfOGpo1wYt+DvLwG1tNS/rkAlY5+9+erAiK1Z97LHCiX90x3kOIjeeqo16fUY1nQKl1HmP8pHbsIMAd0MO0mJHvxKPpqBnpJbP8cCCOdr3/lXK8jzl5ux/Kh4bAZqt2h9sRgufMSDfgLe6JgdLFT7VZSL2lFR3+Z3AW4ZN+wJdbPPa7gJjvP0YQKoqlSlmaC+f6NlzpjknToZ9TvsK8Oh7AQ0/p/HU0sQZz03Ta0yU3LRaxAqAfchqkE+DlfQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(23010399003)(16102099003)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MHeBDXMI5t+6KtrkdFIO0v+k1Mm5QtZUenUAHijHb9uvQHaM+RX/wPBrMO3N6CmbRzSrP7BejyKzP3eCTUdJ0dEbSf+V8J9x13FquyMCVBJhLP2x4HgkNTvzSU3hqG563EkYI/eAqe0YZ3aoYKTOfPJ1IiL5ToPM9he5YCdgJU5ewU7XsQviEdgipjLj2dydmaanMpr7Kq28Zx/YhTauQgYC1ITOmFGx9riK5xP0QqJWa67z6Yr8DzAIf6H7+xuwKdxlV8l/8MvhQi6d7du2xiWpUlFXecdVnXyWOZOPMB+KBxPNOFPAg1Y1mDTcRXtrcTjeJHmSOKC37GYcWLRjQvrkB9aY5aX4czkRXGj1hTz03Y3C8CfRHOXluqgvPG0fW7wNe50bd9fzIm3GEWaxEPyO+cdFry/CDYrR07sie5qFHhjnQBf4ZYwYiqhNGPRP
X-Exchange-RoutingPolicyChecked:
	nFz7dGK5TpNGA4BLzemOFVpEBmXlPWdSEy7OmPzz82QN1q7fXvMcpEDt4QTrWozBkBk+IZNWUTrRysdrICYSBWvIVVwB1EVMsjN8iuP6ENA/WNl8nQlwGJe3EUDq10ZonEZCCQDFu8fi7sBqV5tXJRprx8qd/NLlIWvdgfvvhujPBMJzhawofc1kjpS0qckgBrgEtzpCcSfm+BbnBm0TlM5cASgBsnS0zLNdF9syzQcloJF3OtdzD+CYY5UlbRrEktAVq1cAWA25h43j/FzctQOtkIC5gckU2S7zzpajnftMIIZfgjN59kNFhE/Kc1Zs0OQRfQ24SzSQE6TMyVWJNQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 16:17:22.6590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ef8695-eea1-41a2-65c2-08dee1c3630c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6565
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a566118 cx=c_pps
 a=K4Uj+CE6H5eOf29xRfO2cw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=cm27Pg_UAAAA:8 a=w3Y2KIkmeJ-tHWYATmoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 46QbYopE0sWHBv3IWo5b8KHwj05DAFC7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE2OSBTYWx0ZWRfX1G+IwJCjBgKH
 jnTCY0mBbG176JP3HL9UgmtG8s4XlzB+39X/gRiBeRadewCFZoIWfREX0PPBynq7MWy66slTJi8
 Fn+ZArUgVDztBFX4tCwYEgWplbIGafI=
X-Proofpoint-GUID: 46QbYopE0sWHBv3IWo5b8KHwj05DAFC7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE2OSBTYWx0ZWRfX/69PLRxpv5fG
 bgzOEGGs+stRW7jpJE2U6vtOufGVeptASkIktnHbwpbF4uZA1HTZAatS8ndP2TswOsLFmny90S6
 AFLGEaIojV4pPCJTzjlYKYnXBh4oQ6pBAvzkK2nJDRFxRs9E6yHONs0ytYfPC90RtxmxPz5GAj0
 7UoCY+Z4Bhe/RNBzGDoeXZzA2o2AaPlDgvTfn10STNFtCy4b0N+orYznZEl7WBIzyIte5ZqlhvE
 UeSY/EqzjFr28YVWbleQWh8aJJ1XdEVy/iTNisvUEWGpF5fjlD0hKA4kaamSAAG7QWGpnQ8rBjz
 zHc/+cnIyba7PaRqaMCelJxLeR6/OptWObZJeClvzJrNAAdMi05vDJJlDmyyOaZiYYWnEnOqJ7B
 4CznKeHFAG5Yh7MvrF4MHrc8eqCtjDp4sZ3ZiVfeMdWBr/FaX78apceDzX7HxvlvgHbDJPStAe1
 p4sz/aQloZggbMiuS/Q==
X-Proofpoint-Spam-Reason: safe

Hi,

I have some concerns about this patch.
The original design on the driver relies on 2 different interrupts, one for Jack Detect, and one for Type Detect.
I am concerned that these changes either prevent the interrupts from being enabled at the right time, or enable them at the wrong time, and possibly simultaneously.

I believe we may have one of these laptops ourselves, so we might be able to have a look ourselves, though it may take a few weeks for us to do this.
Can you tell us which OS you are using to test this? This was originally tested on Ubuntu, but I think this is ChromeOS you are testing on?

Thanks,

Stefan

On 13/07/2026 22:21, Steven 'Steve' Kendall wrote:
> On some models like the Dell Inspiron 15 3520, jack
> detection does not work. This patch switches to polling
> and more regularly queries the lower values rather
> than cached values for the headphone and mic jacks.
> It also includes some logic to prevent the polling
> while headphones are already plugged so no
> audible "tick" can be heard.
>
> ---
> This patch switches to a polling method for a
> specific Dell machine (Inspiron 15 3520). This fixes
> jack detection for this model. It's possible the gate
> on manufacturer and model are unnecessary and this problem
> is common to a wider set of machines, but I've only tested
> on one machine thus far. I left the other logic ungated
> as it seemed likely the cache was not providing up-to-date
> information broadly. But I'm open to gating more or less
> of the content or changing the approach entirely.
>
> Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
> ---
>  sound/hda/codecs/cirrus/cs8409.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/sound/hda/codecs/cirrus/cs8409.c 
> b/sound/hda/codecs/cirrus/cs8409.c
> index c43ff3ef75b6e..733234844e7df 100644
> --- a/sound/hda/codecs/cirrus/cs8409.c
> +++ b/sound/hda/codecs/cirrus/cs8409.c
> @@ -766,6 +766,9 @@ static int cs42l42_handle_tip_sense(struct sub_codec 
> *cs42l42, unsigned int reg_
>  	/* TIP_SENSE INSERT/REMOVE */
>  	switch (reg_ts_status) {
>  	case CS42L42_TS_PLUG:
> +		// if jack is already plugged, ignore plug event
> +		if (cs42l42->hp_jack_in)
> +			break;
>  		if (cs42l42->no_type_dect) {
>  			status_changed = 1;
>  			cs42l42->hp_jack_in = 1;
> @@ -776,6 +779,9 @@ static int cs42l42_handle_tip_sense(struct sub_codec 
> *cs42l42, unsigned int reg_
>  		break;
>
>  	case CS42L42_TS_UNPLUG:
> +		// if jack is already unplugged, ignore unplug event
> +		if (!cs42l42->hp_jack_in && !cs42l42->mic_jack_in)
> +			break;
>  		status_changed = 1;
>  		cs42l42->hp_jack_in = 0;
>  		cs42l42->mic_jack_in = 0;
> @@ -1092,12 +1098,14 @@ static int cs8409_cs42l42_exec_verb(struct 
> hdac_device *dev, unsigned int cmd, u
>  	switch (nid) {
>  	case CS8409_CS42L42_HP_PIN_NID:
>  		if (verb == AC_VERB_GET_PIN_SENSE) {
> +			cs42l42_jack_unsol_event(cs42l42);
>  			*res = (cs42l42->hp_jack_in) ? AC_PINSENSE_PRESENCE : 0;
>  			return 0;
>  		}
>  		break;
>  	case CS8409_CS42L42_AMIC_PIN_NID:
>  		if (verb == AC_VERB_GET_PIN_SENSE) {
> +			cs42l42_jack_unsol_event(cs42l42);
>  			*res = (cs42l42->mic_jack_in) ? AC_PINSENSE_PRESENCE : 0;
>  			return 0;
>  		}
> @@ -1157,6 +1165,11 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, 
> const struct hda_fixup *fix,
>  		case CS8409_WARLOCK_MLK_DUAL_MIC:
>  			spec->scodecs[CS8409_CODEC0]->full_scale_vol = 
> CS42L42_FULL_SCALE_VOL_0DB;
>  			spec->speaker_pdn_gpio = CS8409_WARLOCK_SPEAKER_PDN;
> +			// if Dell Inspiron 15 3520, poll jack at 250ms
> +			if (codec->bus->pci->subsystem_vendor == 0x1028 &&
> +			    codec->bus->pci->subsystem_device == 0x0bb2) {
> +				codec->jackpoll_interval = msecs_to_jiffies(250);
> +			}
>  			break;
>  		default:
>  			spec->scodecs[CS8409_CODEC0]->full_scale_vol =
> @@ -1208,8 +1221,10 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, 
> const struct hda_fixup *fix,
>  		 * Run immediately after init.
>  		 */
>  		if (spec->init_done && spec->build_ctrl_done
> -			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
> +			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in) {
>  			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
> +			cs42l42_enable_jack_detect(spec->scodecs[CS8409_CODEC0]);
> +		}
>  		break;
>  	default:
>  		break;
>
> ---
> base-commit: d96fcfe1b7f94ac742984ae7986b94a116abff1b
> change-id: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52
>
> Best regards,
