Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578133B975;
	Tue, 11 Aug 2026 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786459249; cv=fail; b=Lpnn9O9UxuBwWoBA1wNlMX6TMXx19WOkKieA8bZuteoGXGZs0nTTeB0Pl0M09VT/7Fq2WzCUTg/jOMA7iihx/+bCQ1vW1yrb5rG51WDFT7IfPpKQhbwbYZWW8RRrqLPNOoMMgH2BOjXemRCVgwgY6utX6nzJAorutzgBt1xSOzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786459249; c=relaxed/simple;
	bh=SOZ64z5WPVqEfKfhoPyUdK57EJ1IZjqxuM1AzwAUdfk=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=tvFtp7Ki8mCcIgpLQI1Qcz/AdhodyNHEAKi18sruv9q3ltBqLBVIZfgHWmDtxfhg/Ltpsdemp0MBAYKmbQSbzRjmRCVj4Rpm8mGHCqu+mgZwxT2lCZTgMb+lvHpeY7TmfyLs94kgSCEnadhL6SCWlevLnO+7jjVWt56r5gmFj4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gokOZfUI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cXwYTZDO; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gokOZfUI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cXwYTZDO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDHsA71536135;
	Tue, 11 Aug 2026 09:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SOZ64z5WPVqEfKfhoPyUdK57EJ1IZjqxuM1AzwAUdfk=; b=
	gokOZfUIdPlZkozRkXLYzdyGzHZuZrOqDNuwhZJPcK6X3esmzVNumj74sDs96hP/
	4MJaLuxTVft7JTWYdUeclZCjOVo1ccGyuHXEARLwmI5QdR8VpB6JdNuvl2q8AH0S
	t9IhV2yTnboTjzneG/ISeamS8YYjJmzyTC3T+yEu/e4Lv6vmy71GMvITcPlZ9ZiW
	bttwW6pEPBh5i3bVc7E9Y8zycfqjqEl3ljhzD96Bk/9bBWT7NUsfVqq9ce1VSckv
	7I0mKdM9oIsDnP7nLl8mVyoC3Ov97RUmro8HHB7BEeU7u1jViV2rm4KJjDCwPAwG
	8rWEfrSLzkCo4le+13YrYQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023104.outbound.protection.outlook.com [40.93.201.104])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fx1v0w8y2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 09:40:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7eB2INUDIeuFS3ztdFzuObewjK5EkKv3pHEWZjnI61r2LNhVG3+Zqqaxtk9xwjvwUKZ2b2f81UZC9Mv+q9oBfV5xeusi3BKg+1GsUI9uyyVWspAyu2rsYmtwc8hhqPcRwft8ayMtFs8oylEeM2jYd3+STUYml21zWnFUvtXOZRpnZkLTJP5ui3NH99lcU2qjl68SEanK6bgJkegz4/ClQDtLnNgotdtlvSfgpBoWkQn1+80wiZjQSJ6BofPDftDVVAB/WM8KtPpreiUgWa1QCcW7NqG8iozKwvlXrZb0yzf2PJ4TSf/EqIyqY/eUrxVr92BpjVtTLH2m59hpirHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOZ64z5WPVqEfKfhoPyUdK57EJ1IZjqxuM1AzwAUdfk=;
 b=uBywHFtZuWE1CI7lWcqgfU/N5oiHdybErgxGyEQP5d/8FrRfcT61a6djTatCv7wRyEooARF+rU6yNCsRM+9cTlQ1uqGwmKUYCRLxOO2rqMRvC55LQalczcXRAgnOFo+AEejUbtI7cxsoGQZPsz2lTZHKWa2P4U/JV6TGhjwWBNSwKRMBG0jSvlmx9YGDZT5lGC33LbkfML/aj6qYDc5rX0w4en5NtFMCrAQBFv/Lm4//ge5mP+YUfDcNSBAooIgIWyWzBWGDRy6GFfJOzUGGXIs6vg8ymZZt48BnsSACIVHg6I/cOQy925rAyEcaLnRSp+0MCxXjEnZXPkqxY0/gaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOZ64z5WPVqEfKfhoPyUdK57EJ1IZjqxuM1AzwAUdfk=;
 b=cXwYTZDOE/CLAEVLVjVznv2y6H969mTSqARsVLSYAMNttbqvU3KLL/hfnY5j7VXAEDbDlyIlDdWciw84Aezyo6aYPBpLFh4gyLC9sWSvvbAoLnkxKggiP7x7XL9jtQsqYgABVLBNeztFsrkh67rotIk2hz6mXJS/zv+u4nKrFB0=
Received: from SJ0PR03CA0284.namprd03.prod.outlook.com (2603:10b6:a03:39e::19)
 by SA1PR19MB8845.namprd19.prod.outlook.com (2603:10b6:806:45c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 14:40:32 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::16) by SJ0PR03CA0284.outlook.office365.com
 (2603:10b6:a03:39e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 14:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 14:40:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7EAEA406544;
	Tue, 11 Aug 2026 14:40:29 +0000 (UTC)
Received: from LONNCK4V044 (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 44B9182025A;
	Tue, 11 Aug 2026 14:40:29 +0000 (UTC)
From: "Stefan Binding \(Opensource\)" <sbinding@opensource.cirrus.com>
To: "'Steven Kendall'" <skend@chromium.org>
Cc: "'Jaroslav Kysela'" <perex@perex.cz>, "'Takashi Iwai'" <tiwai@suse.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org> <6cebda31-08b6-41e5-9335-a40ce2744d29@opensource.cirrus.com> <CAB1bpFAXpjRYgc1aeCZo3vhbRq3zsCL9HjohbPk-ESx_8ia5JA@mail.gmail.com> <0921e5a2-f8f9-4802-b40b-ec332b1aa4b4@opensource.cirrus.com>
In-Reply-To: <0921e5a2-f8f9-4802-b40b-ec332b1aa4b4@opensource.cirrus.com>
Subject: RE: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
Date: Tue, 11 Aug 2026 15:40:28 +0100
Message-ID: <001a01dd299f$5aff42c0$10fdc840$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIsEWDBVlIDLVbhcN/JFu2K6u/y2QLJrp32AMjQH1wBZXFKJbXTW6Ig
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|SA1PR19MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: ada91292-426d-4357-86a5-08def7b67e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|82310400026|23010399003|6133799003|10067099003|4143699003|56012099006|11063799006|16102099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1kzlzNaCtx87UhBrmqo0KpiNBZNtz0Xdtuy6YPwnFJPWocvBNkBqj3f6v2xgi9qACoJuzYWchCTXlkvckZM0EO1X6BXJbYr+5SQO8pylW2O6HTuDRMw/QnrwCGBWQt7pAJdu8x/r/jAf4hvHjdJcOHDspGAHW/2Zr0qlkiaO+0PKBxiah3Os/ku+zNehMX6KVX4C+40o+Ly8SWOzVEJO40eM1PZ4RuEfJd7EQnVWPyJ6Ei/bH56KXA11R0SE2z6AArOH00ubhpLLKGzxXz/hf/ZDurRrd/SUg1hG4hNSEPIxd8bVoFvC9NBssQHcki7s0kXNS7O2EPI6CR+hPbhUWz98tNcSeRM2EbnSXhOzk/38kItdIM90LS0bH07I1h8LV3/w6sTBJEWshWCa5XpO4vISxKNx6IuHIrYWcvcQ2RM1uqADFIEgsfMDIfJKbTnPqom2KSC+x+Ov8s6Glf53DHe26nPns2wrnc0l+6BOfsByrl8Ez61x96QhWnaUhbaWk1YM36f2sY+V5Zdya8wRAmR8/d64/nWl2ROvsziqQV6sTHtdGLNo/FZ4w7nUyEb0QeQI7rx5yDua8B42SafDgzya7BmKdp26FH/zGaxxt0u5vr0xy1Iso9/y0RDTh0t7yhbT7VHPTWAEUcP2lN47Y61kg68Seo60yBHe8wZRMJ2qhQPZZ2MDTjW4M9Zp2vtULtPA7rcbokHJba5tLTgPQw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(82310400026)(23010399003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(16102099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vsuLyxkjD0fPG95X4AyvfGqbv7UQ/RE428wa24//qQJ9/PNYQaFVzKAVijbp+d6vkThE94qw7SMCHgVN7rO7PFa55qHPBAzxpuDHpsCGrCmhtngJVOUJLUbOGpyqPF13glaw8TnykJIFo4kx0l2v2PtnVjfWxYDJU4qWrgfxA5eopHsrbW4nzcl8ruB1SX3Tu2GyY28pFiOHW/d1+FsI9FlelTuNv0N5U977pvk0LhCssTZ2tU/xk6Zf37i0bR7jLhZGB4Y46SPVkuJxwKP0cZ2SQE86Fmwz27KfGCpXphEq5P8ikF1eJtqXCI57BC8pa9q7uJeeaXjfpDdO5aQmKmJRA7/4VKyWpvJUadg0Cpg7s4eAMi3qf2pUFr0VnVKCv4ZCCmVBW4RrFh95i28ROP/fLcEZfMeK6aeEFTrcch6b1TnO083ECmzYDs7Nlmm8
X-Exchange-RoutingPolicyChecked:
	q50EnSvmNtl9wUHeqyIO9o6rUbfdmbl/BdeFj9ATSS2/nqk8m+GmIWML2ZSd21W94eWaZ8bJwqHLdcf9o6ttRkn7C5zB3PF/bKWf6aEHXAsJc9Kr+/8W90dF6P9Tk83bdOtDadgGBDzomr8FpRp3q7nj1J4xh83zyHONzMyb/OgTsjwbE2zlIml/ukDyBhrt/CiT665KzbgWmVhExqrghl3wqj/nOiGMP80VFa7pTEaJEAzSRDEWNjRQ4nOYVkge1iSwlrbhTIc4Vc/y0ZTn3OtVAgxb41/naZdAwR0Wd3GYpvX31+bCyffBDJSLBnuiNwbyLLAM7tivLV8fnOivww==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:40:30.9126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ada91292-426d-4357-86a5-08def7b67e8a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8845
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEyMiBTYWx0ZWRfX+LPRgiAitAn/
 oO9IAXEd05Gph2nMC66qiczqdgKsbllAla7ql638KSamk2GvfBleB0vdW39XjrMr929/MSmiMNA
 tKR0OMPSj7pHdguFJe7p+giufnDK3gw=
X-Proofpoint-ORIG-GUID: PdnX0pp7fzqehkl0qAP7Igf3khzuBxVa
X-Proofpoint-GUID: PdnX0pp7fzqehkl0qAP7Igf3khzuBxVa
X-Authority-Analysis: v=2.4 cv=ZMrnX37b c=1 sm=1 tr=0 ts=6a7b3465 cx=c_pps
 a=0zbhqlog1HYD7RdPDvTXcw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=cm27Pg_UAAAA:8 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8
 a=IeKTNHJJ_ATfiCsTSZsA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEyMiBTYWx0ZWRfX5Q5XmRE4UDu8
 pXq8d/zOCF3jT7hpT7NBc+c3+64sJz1eXIVoBlu2ckaV3t23Z3oj6knBwsoBor+QFoUmx5gfxGT
 zlxu2QzC6rXBeYQwyc2ESGgcHp4nsH3YANUaDOMV3AWkD3DJlvOgA9jb+B3JV3xfMKSNlJf0xwA
 gycyNBwOFUpfHJFmrJ4DMSDNUXHCiVu4GO0f4V5bKkOiOaatoc9vC66fvvnJNnSP3Y1yDqIAZkc
 9x+Cpb/SdnauGrBHyq86ZyHzneMdCw4OGpPUDZsV/pzSclYc48/8kREVFC8GP2UkFCfBniMgzrx
 gkIMcKqndE6j1WS2xvRgQ0lNOsSncnvZ+OFhcVzMlC7NSTJpbJmkq2FSaDR0nkQyPWAb43ryN5a
 7VR2oPuldd3eAuVun5J0IkZUHYgMU5qOst6fbUGGR5joIFTgOIJF24OvaX0aEt6fTjoCktGkW5K
 CZ16unxhTGOsTiqtNNQ==
X-Proofpoint-Spam-Reason: safe

Hi,

> -----Original Message-----
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> Sent: Wednesday, July 15, 2026 4:16 PM
> To: Steven Kendall <skend@chromium.org>
> Cc: Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; =
linux-
> sound@vger.kernel.org; linux-kernel@vger.kernel.org;
> patches@opensource.cirrus.com
> Subject: Re: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack =
detect
>=20
> Hi,
>=20
> On 14/07/2026 20:26, Steven Kendall wrote:
> >> The original design on the driver relies on 2 different interrupts, =
one for Jack
> Detect, and one for Type Detect.
> >> I am concerned that these changes either prevent the interrupts =
from being
> enabled at the right time, or enable them at the wrong time, and =
possibly
> simultaneously.
> > Thanks for the info. I had trouble getting these interrupts to fire =
on
> > this machine. Have any advice for getting unsol events to fire? I
> > tried a few things but wasn't able to trigger any and resorted to
> > polling.
>=20
> The interrupts not firing is very interesting. To give some background =
information
> on how the driver is intended to work:
>=20
> There are 2 types of interrupts that the CS42L42 is configured to fire =
in this driver.
> The first is for Jack Plug/Unplug detection (which is enabled by the =
call to
> cs42l42_enable_jack_detect()), and the second is for Jack Type =
detection
> (enabled by the call to cs42l42_run_jack_detect()). The call to the =
second function
> disabled the interrupt of the first.
>=20
> The intended flow for the driver is that when the system is =
initialised and
> resumed, the Jack Plug/Unplug interrupt is enabled, and thus if a jack =
is plugged
> or unplugged the interrupt fires, and upon plug, the driver then runs =
Jack Type
> detection.
> Eventually this calls snd_hda_jack_unsol_event() which informs the HDA =
core.
>=20
> The Plug/Unplug interrupt will only fire on Plug/Unplug, whereas the =
Type
> Detection interrupt will always fire, regardless if where a jack is =
inserted.
>=20
> This is why, after initialisation, the driver calls =
cs42l42_run_jack_detect(), to
> check the jack state after boot (since the plug interrupt could not =
have occurred).
>=20
> Similarly, we also do the same upon resume. We could never get the =
codec wake
> to work properly, so whilst the driver is suspended, the codec is =
asleep, and the
> plug/unplug interrupt will not fire, and therefore will not wake the =
system. If you
> are expecting to see interrupts occurring whilst suspended, you will =
not see any.
> Instead, when audio starts and the driver is resumed, type detection =
is run
> immediately, which switches the Jack at that time.
>=20
> On Ubuntu, the driver is resumed when you go the Sound settings menu, =
so you
> can see the interrupts firing when you insert or remove the jack.
> I am unsure if ChromeOS does the same. Alternatively, playing audio =
will resume
> the driver and the interrupts should fire upon jack plug/unplug.
> Inserting or removing the jack whilst suspended will not result in any =
interrupts
> until the driver is resumed (either by playback or by opening the =
setting menu in
> Ubuntu).
>=20
> Thanks,
>=20
> Stefan
>=20
> >
> >> I believe we may have one of these laptops ourselves, so we might =
be able to
> have a look ourselves, though it may take a few weeks for us to do =
this.
> >> Can you tell us which OS you are using to test this? This was =
originally tested
> on Ubuntu, but I think this is ChromeOS you are testing on?
> > That would be great! A few weeks wouldn't be an issue for us. I've
> > tested this on Chrome OS (Chrome OS Flex, specifically) but I also
> > noticed some odd behavior on Ubuntu even though everything more or
> > less worked there. Alsa wasn't reading the jack state as
> > plugged/unplugged until audio played. I'm not sure if that's by
> > design. I wasn't sure if Ubuntu had some additional kernel patches I
> > couldn't find; I was using their LTS HWE branch and when deployed on
> > Chrome OS I didn't see any change in behavior.
> >

We have retested the hardware using Ubuntu 26.04, and everything works =
as expected.
The behaviour you describe where ALSA doesn=E2=80=99t detect plug/unplug =
until playback is
expected on this hardware, due to the way the CS8409 works.

As for ChromeOS Flex, do you have any instructions for us to try and =
install this to be able
for us to test this? Is there a particular image or version we should =
use?

Thanks,
Stefan


