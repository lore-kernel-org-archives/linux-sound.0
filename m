Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F7543C04D
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423138; cv=fail; b=elxVZWGhx6ZWJoi9VDAClXTnqi97IOReFNDRBHO8mHouiz1vGhZWv8ijoWRUAvM4z5a++OlGYjF8j30vcL2TLQ3kIqDaCNba2yxsb2EsJLF1q2tEjQW69lZRdux8WBOQOxqnXnmDN+CY1uuc/FvguHwbvTSKPU6oQ+apUGgSeu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423138; c=relaxed/simple;
	bh=gmXy1zIyr4BlKEi5YzV/qj8ZDYKI/t/o29KIEZ3t7os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxAiZRJLDH9ZC51hPN3eJVd8OuZpxplWTEDY8vWG9u+3dJnifvrr1RVau0Ieb+UvtGMY4tYtIuOXz13k5WDPAWB8/Hk5AJCmR50o5HgGm29K9s4Kpp+wj9a8G8sc8w0yBW0XKnZxIm44geGf1KNlNQVgpq25Xn2ftYXmG18P+R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gfVgMTE2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EfLPmZLI; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gfVgMTE2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EfLPmZLI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEC8Ea2873481;
	Thu, 30 Jul 2026 09:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=OPJwAhUqylF7Lg1SMKYwMvR6wQm/YoR5h7oEtrY0v1s=; b=
	gfVgMTE252TkHgGaUl1VKRQgmZLXsY75vntKL3jndKUBDCDQGjm6tGJSsLfViqNe
	EolGEZjzHe3lcs0K3TTIq1+dOQC4uxEBlktA0Rl8X25X+Sg1YhSQiE5kQo5L/JNk
	eKv1aVGxHFUtu3apFhhMwLXmywDZx+Is8/iULn1lMfiFPPotFnewvw8f15uC6EtZ
	36W1KbwuK1vIMGX+W4AvJ5F6nMz587SChktaLZ/OdIRzpJAvS+NO5pabJNOi2DJV
	4CjI0Jt99+zt9ixCeoQ/8bXzscIl45NY/XrApBCKUF6bPBthid7gQ9tok+U2+O/3
	sM3qSAhZxC19PmngNIS1tw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022121.outbound.protection.outlook.com [40.93.195.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fr85sr228-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 09:52:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ol1ZO2+ys6E/6MUwwMRCLzpsE+p+icbEOj4qN8vp/0nVbMvnSvNYDn0Md0LRJ6lcdZrcB8YkKwNm0EvRHRXkl2jtSjr4DOGCKkg8qr7Zwv95bxISNXnHHaGpqYfZbQn3mm8YURFhZ5C3CIsttgyvg0+YkvcCYi0OD6wpxnw4GEGnioxVqK/FCIqSinaTK9nDDQLGJJ3PKUrXUFLKUwnfXWP5Qh54DWZIsPCnz/y2hX3M/uJQZHg7QDod5D0l5zB51Yt3Onz1bgWqdPOViPr5B3Rp+A2mWKSF2zzK3hzBK7Tarz4e5u1rqbk0TO6d4tchS8cC6ZmLA2W2emImLs+lTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPJwAhUqylF7Lg1SMKYwMvR6wQm/YoR5h7oEtrY0v1s=;
 b=mi6cfFIr5/aohiwctNeSRvt9eaXvE23c1Ib7oG68+yb3QZS4VY4KNVkdxrca8UcLdralNAfkcvTQk+H8pKHTfmSG45UOQyGG9uUMFJY9ipAOYr+jkY6gL7EpvNh+pi1kQxLI0dgsHeEogxiYweDRjkYYT2qXR68mbM8fTmVH1xGOR12lSVtoImzwdAHLxvVKQJCCL83DMNjuc1Xrm3HuUW3vA7hVZD0bFUNz0rCqZtKr1yOlXydV3eqNd3pIUdX5yQmvrPT9OYfXwGzM5ydk5C2sftM2m0WEFRfvvGmgiIxlXZCJotfXjxcuS2u2wXY3rOdTHMztQm943BiL/f9rnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPJwAhUqylF7Lg1SMKYwMvR6wQm/YoR5h7oEtrY0v1s=;
 b=EfLPmZLIgAhiNEMhOpgToKfsk8KdMQx+/LrTHvQC8qA05rM1H6CSTSWXiSAbMxul8sgkydbyGi9fNO88OUWwrn8uUbsIDJPDWJDmfmDn38irII/Ty4t+ev0+tNsqba7i3NQBO/efTZuoO/cGbZkPwIhOgEmFd7jr1RbnzKnd9po=
Received: from SN7PR04CA0204.namprd04.prod.outlook.com (2603:10b6:806:126::29)
 by IA4PR19MB9161.namprd19.prod.outlook.com (2603:10b6:208:55b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 14:52:02 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::24) by SN7PR04CA0204.outlook.office365.com
 (2603:10b6:806:126::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 14:52:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 14:52:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6DCBF406541;
	Thu, 30 Jul 2026 14:52:00 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0A00682024C;
	Thu, 30 Jul 2026 14:51:59 +0000 (UTC)
Message-ID: <2921cca2-8fba-475b-9241-acc4807739d3@opensource.cirrus.com>
Date: Thu, 30 Jul 2026 15:51:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] ALSA: hda: cs35l56: Use auto-cleanup for firmware
 loading
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
References: <20260729083735.120219-1-tiwai@suse.de>
 <20260729083735.120219-7-tiwai@suse.de>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260729083735.120219-7-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|IA4PR19MB9161:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a602f8-29d6-4da9-af37-08deee4a1d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|61400799027|82310400026|22082099003|16102099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	VbOUCM8sbxORZFV9SHQqF8dJu+yQVKyxXUloZGlyJszEy6qlcc6A3Oj2cMPyLZHYsLNjBlavYmKUvcKFHAUINq/+wq0GsvY7EUh7rOzODtfr6oTGnBZ+19zC7esEE27aOYEcc7nfxDBBmD7om6wSCYjvXuZW4fbTpTDJLjHp+24T11YuI0i5ROZwLM2/2j9MVQsyILizE/XtIhO7bD8DyP78OiHnTMxyqRH1xqnxQQUXQKg/QAwUruusx/JRAyNV8R16pQG5XngaGHBtZ4IlIWkllV5Bz9b3xOjA9w3FJq5GZIkquqUYiFUap5hnKkPiU+JgfeD/nx05n4YYujlsS+/+DEk4Ca/4tTBfpoUS+P8ykC6lBf6fa1E0F+HpHZLTyYyIIHAtueJROUmOXKcqBQJYbAjgWJUS2/tgxA+HmwgYhIxUwMtEdyiRFuJgCyYDMjKvN3qrajO+WtZVtk6NJnA/FlimRyl5IMSGufAOeceiB2U2phXiqAIBCdJp/L5pOaBiQt8UIRBUnhh0838wuHPvFtpQJW2jLAWY2wrLyjMvA7Jqx7zsNdyWRjdXrBe26AqvbJdTnok/5BJRPL2zXJxJGbhDBvFXn4N6uC4eTiB/C+ChOSmXqb9S2yLdH0bB8O+bwPPRIRykSN3wcTAYnQSdYA1cPb84jkPIG8YlbMDQx6SHqKP3yVqV5YCpixxcm5Q0lvdNQyYixE7eEQKQVA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(61400799027)(82310400026)(22082099003)(16102099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o+6XYvnkEn6Gmu1lMAXp9Aw5rocYo7dtZ/qYPcR/cJ6aRldHGo9a1KITwLCW3eS5MIY2F2R9IqktZpt76XdO4QxqHsgOmeU7ZRl1+o1gvrHyeeA5C3mgM5PDJf+lo7K9gQUBxoVZxwwLNzOiX6cO3zf9e3EmVCpFgiDzzeMVqrMnQyHZBIFN1iCtSwEel69nG/8Gb/yQqgxOV7V8jSjdMTJfw/NfDI7gkK1mM514Cg4Izk1Cq1MR5pQ29bjirxD5dBGPfir2vf/cM1HODUSym0JGsGy00BlpsmzPyQYo5M3bMJOeAi6n6NNVRtVII1mRVRkEMigRYV/EutM/ctJMR661N3vt1zYvni/inI/MJuJJ7zCZZDbfeA+T/lpb/2YTl0DlPiVbThQb9KSlaNlvTlvHSgLA6B1k+TCe+yvYPKQwtnjW9cMRTCk58wwl6XSD
X-Exchange-RoutingPolicyChecked:
	LON8rmIngoweyj15XGuenRI49GGNEGRtYSbjGpYGfpZDoNsSLfdueJTECVcfzPdRQIxeL8HieFfrT5Ls4YaY7yn1Eez7GzrLXP5qMzzhEGd+yEWbhZejWcsBxeOOcFG0CBSQqkF1/bDdCLzJGd3EJbEoEjNs5NjFJxevw2KVe1frlRKMDcvIdgGnx02enwsMnoI3hib1o3fkkiCBE+IeV9jtNuIhi36n33GvztLtiN4PSHPCoT4cZKB2U3QAdIMK9zHQuQqZgr4Xmq0v56h3MPBJXYTiAxRViDxl10PdlQJNmFJRUWgsXAc+wv3C7GYK+Jkt4txNinNLuzUs4iT7xg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 14:52:01.5984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a602f8-29d6-4da9-af37-08deee4a1d3d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR19MB9161
X-Proofpoint-GUID: rKyvB4uPkkgkjaNPtUKeyjkpFQVQNoZb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfX5O2HLqBc51Bw
 q/80IPCQQM9tt5+ZCZHeJdz06imT1q4JwJNFVuHpRhM4RXIjmF7nhLIEum7hjAnHJbDJlGSwHnR
 EbHzdUy0cidunjFpdenWCkvyIHIS3Io=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfX95C1K+yf+LPB
 u1YIbACgW+lHsMflu1gDontXyDnmLXaV4/YB5f4tfbiFvc0+fgrObK0UhTcL+pkJBWa+8U8Q+6A
 iQrCTxBzrc9WqXpcLbjc19IWPV7Lx00q6obkH97VOsvx3R15tklWdmn06emgYaZj29m8EOVXnmL
 LTQFJU9MtZ9gOpzlgjPBliX8QY6bjTp9JOadjYbEI994Hc1GT+hL/pJI8DS/sU8Hbu1fP6eyT3y
 PAdngZdNV+pEroCsZ4fX1ttGWLx6tFyyth0L24ki0K6WmdJ2rPNd94T3XCuAQVy7zmNHWGZEqv3
 Y6jR8CK9iC9zVnLULEj11qIaFKXCopooOr0BUpNX9B0yxT6+UJ37JcRF9zR2JmefjYsKTNI/pm/
 K/MHvtpjuPhtwYmbPab3Cso1b6O0H32KKZEXA5ZCSyI8Y+snocTsPP9XhMBslZlcMUPgCY9Afcn
 EoAvcXvvlo+Vy8vO/Eg==
X-Authority-Analysis: v=2.4 cv=BYjoFLt2 c=1 sm=1 tr=0 ts=6a6b6516 cx=c_pps
 a=DyfKEl/nMH7vw8kk6njFLg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Zxe7iHbnagCTz0wJbgMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: rKyvB4uPkkgkjaNPtUKeyjkpFQVQNoZb
X-Proofpoint-Spam-Reason: safe

On 29/7/26 09:37, Takashi Iwai wrote:
> Simplify the code to manage the firmware loading with auto-cleanup.
> By the use of __free(firmware), we can replace the manual mutex locks
> with guard() gracefully, too.
> 
> Only the code refactoring, no functional changes.
> 
> Cc: patches@opensource.cirrus.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/hda/codecs/side-codecs/cs35l56_hda.c | 35 ++++++----------------
>   1 file changed, 9 insertions(+), 26 deletions(-)

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
