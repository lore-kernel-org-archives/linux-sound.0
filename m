Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E5247F2DF;
	Wed, 15 Jul 2026 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128600; cv=fail; b=IX8x13LTT4YrkaZuO/9piPLum+PA1OmIZcSXO681rqU9BR6Qp7VoE/0NXOqqebiKnDbuIFgk7sicVtbuheRIWnchAOElsC8sjzu0OhtTGw4d6Cl1iBbzpIjx07VHpCNxw7yYxz6xKF6aZ2FxYnJ67P9HFVluFppP+H1kUaKXHrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128600; c=relaxed/simple;
	bh=takggJ7Zk1wXY/fE9CPJHJLeaLZxdM7CAT+kzTA1q2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWWrIcSDBSe6bkakZpDkxvRZD0H9+2SWHEQRBIYcBk1TtrExw1J7giKJh2Ikdi0Ov5quv4nmkL1KNg+iTVlggWI0i6L/Ag6JX9nKRm5soX6uRbyr73AS0S/09cYoPGNUQkzKk7zBeTXTR3rWcmQLdXKf+eenj2kv84AIW1maWPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Wi7vHZZ6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QylyhHW3; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Wi7vHZZ6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QylyhHW3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F4PWXd275548;
	Wed, 15 Jul 2026 10:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=takggJ7Zk1wXY/fE9CPJHJLeaLZxdM7CAT+kzTA1q2o=; b=
	Wi7vHZZ6HM6bUCCSnv75SswL+22KCDj8m9HgcAw4tdsHBBDtVZvXy91h9A4DSCsx
	YykWqa3++vnHcqon4MPABRWI9jBstucuB0E0EudJuiR0HhRazvFT5ymTxrWfBTQU
	6uWkpLXynMeClpIasGOKyvipld3osIu/1dbdkDlLYLhkFbSuRvQ5cITPgkWRCh1s
	tvUvojfJowBA7v8xQH0HJxA08zIk4bz+nbYWP2CvN3HKR+xZJejyBb7/yA4bV1M4
	3NL6rJ2uTE5sGwz+KPqAuYqN+EeCc6HLv5HEN8dOHxqCqole3EIyxbNiNeQSBfyZ
	HgLQUn//wRijMI2s/aaGkA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021097.outbound.protection.outlook.com [40.93.194.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vwqm0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 10:16:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fl4myu8fLxM3lf5rOqjFRxKus266ZRaxfRBe65pW/y0yYdTq1xZyH1Y5qF71I/KPcgUH7WKS6XVPmesYyGTR1GJA8BUvPkS3nATPSI/D6nYHbQ7ktdL+/GVah2e8FiBdKs3timY+vDp8Nr/gzEIjq6KbNyBpiQHS0OP/AMEP40KevFtV+YcZi4DqFBXDd6kImx3IgMcXk7mIwRtx1nwkxJZrTaK83dQIXT8UmpT3t+4LYYrIwMaWmYXTHYiNrIQZuM+2g8uQhjutGh0QsS8gRfFbmf/H/UcEi139nsUnlnig7fo0GuwbsZdKh9b52+WMQWBwVlhWotwTc+r/nRSQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=takggJ7Zk1wXY/fE9CPJHJLeaLZxdM7CAT+kzTA1q2o=;
 b=qz6PdL4M5RaH4UFcdk+HWKdzF1330ANI/nT7psIrP/J6E0JqIuICgi3upN6vELRUummbeOgeuQpj1ZRXweCa1hThAlAtzce0LgoNy/AzUApPYjmzzzSZrFnUuep0VjdmJmaMOE7opTWeqrVfI1zKSdZf6gGM8lFU1OuFyWDDnV9j24pUOygaZexxI/zj0RyC6MFcYVMf433+kKJFt8RzSRFRZsMY6QZmkvLYckxFKG//cDX3Za/oE88FBepPLJeFzgxsD6bG5Jo0Xyv7HoTPylXJbXa2Hp8O6xd5G5liPD37Umy4gtdHa76UhhiMvv+4U0BOBqoIoZKqMou3pB3U0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=takggJ7Zk1wXY/fE9CPJHJLeaLZxdM7CAT+kzTA1q2o=;
 b=QylyhHW3sPYWYFtwoHg19QvE+ENRsHozdB8kdyQ9SBtG7c3kBc7ldHtMTrG8GFKD6dYmPGENqVPqWkmJ/EoOIQ6yMzA1UW3XGMoTbQ8t9OOUAIpC+bUn91Q/gdaBTVGU8vSMcVVbbifYA0aOBv3nLdc47tY+tvjbVDORGkBWYZ0=
Received: from PH0PR07CA0089.namprd07.prod.outlook.com (2603:10b6:510:f::34)
 by SA6PR19MB8717.namprd19.prod.outlook.com (2603:10b6:806:41d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 15:16:23 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:f:cafe::82) by PH0PR07CA0089.outlook.office365.com
 (2603:10b6:510:f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 15:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 15:16:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 84B7F406541;
	Wed, 15 Jul 2026 15:16:20 +0000 (UTC)
Received: from [198.61.68.151] (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 584A9820244;
	Wed, 15 Jul 2026 15:16:20 +0000 (UTC)
Message-ID: <0921e5a2-f8f9-4802-b40b-ec332b1aa4b4@opensource.cirrus.com>
Date: Wed, 15 Jul 2026 16:16:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
To: Steven Kendall <skend@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
 <6cebda31-08b6-41e5-9335-a40ce2744d29@opensource.cirrus.com>
 <CAB1bpFAXpjRYgc1aeCZo3vhbRq3zsCL9HjohbPk-ESx_8ia5JA@mail.gmail.com>
Content-Language: en-US
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <CAB1bpFAXpjRYgc1aeCZo3vhbRq3zsCL9HjohbPk-ESx_8ia5JA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SA6PR19MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db327ac-0b3b-46d3-cb2f-08dee28407bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|82310400026|23010399003|18002099003|22082099003|16102099003|6133799003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZDjVqLBxmK59srfsnmGJ5VSixBvuw+50fZaPSqA9n/x8Z4FNWSVt9/ESygLO8Rjs/c15Y2HgRkB/KfX09UaDO2Y9TAzQyFj8AkHgRXv8iftBAkYoWheojPF7ln0h1MVZMHHIzWNuB8S/YeqFnghSMeWIUVcmFD//ZBCuhGpqG8FHWiE/QGaYhE+U3HyI6HAMYmCYuTsoN2PH3H10DfRNrlh/L26VRkZksvB4GULKbYApPIuxoZWQJO9kSONn5nWYblyjtyHiSMRgVDtv1Vg++ovxZjAmO8IxLJV7jx0Gbb2Ar9uyqw54Y2INVfPPyurlg7NfCJ5Fh7iytXxV5rXh3DWGm+78EDtVkcZlFxxNGZ0ujW7bsiBUJsPsJcuNkAYQnN+eSLg7QUy84WYRkSYSUOdrVtB5yl1E09eV0LDbSh5CtWJMDH8AfMkqUkcunH3Ul+qshDdprGGKr0s2ZTALu9niTHDd2arPM17Nf6oGytw8F3xiWHzqr9PfN+nx8/dmSAVkt5/uJeYOXJep5kbi3RvQ/bXjJzQygBDNvqOTXR6RMyADb8DQgTZZXxUGojoG57KOu9s70S18OJrKdbarLpbEy5OmPNfH/S4SJmSNGNM+2hDpOhZ++Bw7so3entxTAApbHsSjmqm3Q7fZAhLt/1j68O6M/je6D3QgklygyxHstydZAWVRXk/1m2qcdP2ZltoV7yHByoFOW5gN+4uPjQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(82310400026)(23010399003)(18002099003)(22082099003)(16102099003)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NarTQNTK44FFkeWsojlIxIPz7w+nkscuV0Nmm+frtG++JVWx6C26mm5xPzL0bMDFPp4I/MMCEfDOM9DL5wRv9ZF3XIuKxc0tHLYuo/qTzfXYBmF/dMeR3vsaaRUI38k93WKw8yiYx/IQyDZ7z/j31kngmuhrgdFbSz7mJlDwaF+r5vM306qe5+IWLOCspYc9cZdYTpMnEZrBENAXHUx4/FDqzXv0c9Asu92HaULxm+DE31s8CPVAMsxGUCeBd35BN0C2XBKzyUJGynWLnfpp4SxnRol/4IOVyE+5EY8OA0H85CzE9y5y4jAqyBIjiTlcjK990T2wgUXPP02/K8/x0+wDNwhASTiw+BVt/YF4CC+ylvAPmIpjZ4ImVuv63N0wM2trRpng7BIlSWbxFCWfIAkwPy752am3Dz9PcQdc4qbstHQGiGQqPhyWSMhzk2xJ
X-Exchange-RoutingPolicyChecked:
	A5os+XeeT2PXMzZXVSNGswPXuZD2Jqq8EOMr+s0gxYZlFIz891VMsgw6zQwj2ffcM79H6GlbhQVUXEXDCX3kPzmUZi2lwf2+u1d2Ag1QKvQIFH1zCwgHR4O68iScFMuX8cc5Yrfvs3CWGVYXtX08rfhdV2sxUS628LtZeok10mp6sJ/gecUFRbDTVF+AnHRvzid7d/pyuRDaw+sjOPCVjAxk0gPN+HDY5DZY4Q/eHfjWYKHMPDCuY74glEZIzI1jLM83suFx8xH5vHyARIl+80+BgEMaWep0rdcY3re756Kq50m3Dg9YoTjBfIM/1yyhhi9C4d/defOC6o+80j+CIg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:16:22.3831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db327ac-0b3b-46d3-cb2f-08dee28407bf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8717
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a57a44a cx=c_pps
 a=9OPjPng9tO6d8HsITUYRUQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=7IC1ul7pBlHS5SCsi8IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 123VrS6JMZVm_z5ob35S4c33bXGwdYzK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE1MSBTYWx0ZWRfX2NcD5mhILSao
 /LW30Dizs1/XhbTpEfAse+51VLprLGsbiEnVsAYyeWhYXpDhxJ50TkKzTUBK/2aItEZ3MbniJMM
 LkZio5hbxBn4CPmy2W1FS+DFdFlGeQo=
X-Proofpoint-GUID: 123VrS6JMZVm_z5ob35S4c33bXGwdYzK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE1MSBTYWx0ZWRfXwHpATWf6dsge
 bs5g02FHq2/CDbhFDZtha0lP/uqQ44KtUFVqRbfQAp9xi/BbU+Kd0w5dse78pVRgm8AgWV1ghG4
 c614nI+uo2fhkFNj2QoYoC77+IuldIpXdMlfsuk/Npe13V2GyL9wpVLtYCuJTP9puSP25RE/a/+
 /9LJqUzObO7Dky5m+us9Xd0NpxL8yZ2igwGLbMF6/0Cv+VDgv3mf5uZvPYojOzYqpCLIKe4U+Yq
 MVqPxJEthIZKQzHrBeVsDjMwyHkQBzkmYkwmwsoEt9EnkmmsMeLYU1sQtNsbEY5cXoAW1/xBpjB
 pK41R/VkdmoVGHDkFTYLSyQ1IrC9pGjPUWw0XHDGnvv7FuTX0Si9ArP8FUj19VW5ITGmKa1YeyY
 BzFFc+h+mnE/qoPvByBCiy2M7HdR5CIYvKcFjGAYCi/swoLqM5yKbgrIvLwhTnQMaZNbh7FiOPD
 pA/+viq17FPlTROBSdA==
X-Proofpoint-Spam-Reason: safe

Hi,

On 14/07/2026 20:26, Steven Kendall wrote:
>> The original design on the driver relies on 2 different interrupts, one for Jack Detect, and one for Type Detect.
>> I am concerned that these changes either prevent the interrupts from being enabled at the right time, or enable them at the wrong time, and possibly simultaneously.
> Thanks for the info. I had trouble getting these interrupts to fire on
> this machine. Have any advice for getting unsol events to fire? I
> tried a few things but wasn't able to trigger any and resorted to
> polling.

The interrupts not firing is very interesting. To give some background information on how the driver is intended to work:

There are 2 types of interrupts that the CS42L42 is configured to fire in this driver. The first is for Jack Plug/Unplug detection
(which is enabled by the call to cs42l42_enable_jack_detect()), and the second is for Jack Type detection
(enabled by the call to cs42l42_run_jack_detect()). The call to the second function disabled the interrupt of the first.

The intended flow for the driver is that when the system is initialised and resumed, the Jack Plug/Unplug interrupt is enabled,
and thus if a jack is plugged or unplugged the interrupt fires, and upon plug, the driver then runs Jack Type detection.
Eventually this calls snd_hda_jack_unsol_event() which informs the HDA core.

The Plug/Unplug interrupt will only fire on Plug/Unplug, whereas the Type Detection interrupt will always fire, regardless if where a jack is inserted.

This is why, after initialisation, the driver calls cs42l42_run_jack_detect(), to check the jack state after boot (since the plug interrupt could not have occurred).

Similarly, we also do the same upon resume. We could never get the codec wake to work properly, so whilst the driver is suspended, the codec is asleep,
and the plug/unplug interrupt will not fire, and therefore will not wake the system. If you are expecting to see interrupts occurring whilst suspended,
you will not see any. Instead, when audio starts and the driver is resumed, type detection is run immediately, which switches the Jack at that time.

On Ubuntu, the driver is resumed when you go the Sound settings menu, so you can see the interrupts firing when you insert or remove the jack.
I am unsure if ChromeOS does the same. Alternatively, playing audio will resume the driver and the interrupts should fire upon jack plug/unplug.
Inserting or removing the jack whilst suspended will not result in any interrupts until the driver is resumed (either by playback or by opening the setting menu in Ubuntu).

Thanks,

Stefan

>
>> I believe we may have one of these laptops ourselves, so we might be able to have a look ourselves, though it may take a few weeks for us to do this.
>> Can you tell us which OS you are using to test this? This was originally tested on Ubuntu, but I think this is ChromeOS you are testing on?
> That would be great! A few weeks wouldn't be an issue for us. I've
> tested this on Chrome OS (Chrome OS Flex, specifically) but I also
> noticed some odd behavior on Ubuntu even though everything more or
> less worked there. Alsa wasn't reading the jack state as
> plugged/unplugged until audio played. I'm not sure if that's by
> design. I wasn't sure if Ubuntu had some additional kernel patches I
> couldn't find; I was using their LTS HWE branch and when deployed on
> Chrome OS I didn't see any change in behavior.
>
