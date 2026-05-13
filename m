Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D93429831;
	Wed, 13 May 2026 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690796; cv=fail; b=NFKrLbl+e+hUEL1+Tu5xpeBfDOkBnXmGhAfa1cUPZ0QHZNKR9+R6nqhCY4h1cMr9W7bdWbAECnZSrB+9nbI61YXBPGLbaX3w5S7eiRXTImlUjShOK7PJ4PxVb0/KmRW5FNF8drQzYrSxSSXkOCnK7pYnfTzxvkFS8W4CMNsmqus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690796; c=relaxed/simple;
	bh=XnzL1/ybc8bpclHcxSsihlwyPq5g3+K7RxC/XGThDOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gar5W26JXED2+j2MSMOOLmX81d9sBRxE9Ce4h0gM1sVV3HnzZp5tAXXIIV2rJFc59CvGzyofPgFuek/hckXtvt1jXGmLP+X+gzNe0r0PRPzPvCCTHQfbn7ofWwfggUZMibJ9NPTf373ASOeeyQcPwtp6LZULqLzhRKj7E2dlwb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SshPF9mK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SipdDdd7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SshPF9mK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SipdDdd7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEQjMG943526;
	Wed, 13 May 2026 11:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9jL3cMPoELjYCmFxx4+bRg3PqDEry/lYxYyQlKlVf/M=; b=
	SshPF9mKPFx8mvzgzx6cl+YMGcH1I+OUksCMEPFRrdhcjixsWRx4D6D4eGMsu95I
	GFTo24tCyOIBJttJlMR7AYqW8vTOzuSslkJOjIQ3+vRVjCZCnJhVM/lyU+6PRCuA
	Xwd7EVxSgmCPmphb2T7AWEoifzFFGD9IROxevf0AZqbOqbFQ6wnlMu5Y3lbhumaj
	x05MRwuqtI319OKVp+AJsmGrd4fGpHE2VFzrWlXVqeHOldjCweYqDQX8yEFGjxzg
	lnBtFpmufhSAid/WUrtcZMDH5uPdXF3pUnDUVVNgWQxqOLjElBURsuBOLRGODZaD
	oucfQtf1jbilhmxPBdzTVQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022139.outbound.protection.outlook.com [40.107.200.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e4c7q1603-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 11:46:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWv2//h/I9SJTyldFXOE4SG0Uoot6mP6eraw2xjeS4ddtyAANSFSOK7rkCsRw9tqXpOoYsCPMfQaLuPqDzt1w4BOMEDZtPsG4CauzcDbHNUNPc9Fv97n6pWNn6dYGnM+xSkqJoyP+DlpLNtiiWBJs8bl7gpYj4iPbee/rmKURsgy2/+s9CPdW3hd9vVbUkB0RFougYgaEa5OEBewzyHGIEtnlpizH5BVzRq00xDChPOKXGuo8VxuMs2zvloAJ18v4361qZAjSgbqoHZvGkv4yjQiE+0YPFEdJNsaryggtH3Uj5LNvs5hwv+pTckFGdg5q14af6JvNiKdgk7gB3QOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jL3cMPoELjYCmFxx4+bRg3PqDEry/lYxYyQlKlVf/M=;
 b=Ead/IQE74Z8XK4TF2NtiM66pwa2P1jEl6CAf5mboaV+pNSXa3tngcosVVCerK+OE7oYFvKe9Fi78tYOG4ne80CJsrY2RLd+dVhrM2WXy8+ARtIN8GZSwG9xkinm9f7cdLPMatCPcM2k4seyP5vtyGmU5mTitz1LPuIwa1fL7qQGS1BDC5+JNka+EXTlhqZVddyc8d5C6kiyImS9GYZZvfHXMj7jbtpGEFFQ2EDcWLTYebOqVXtrkDZP3i3oPLl28Gb2O+qtsAmx++Og+ov2ebIqhLAVYmwqGKVHgqhaKI1pW7Sp09RAS0br2ZqNjIf7aDOM8o6kxX4cM9XzvnE74LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=linux.intel.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jL3cMPoELjYCmFxx4+bRg3PqDEry/lYxYyQlKlVf/M=;
 b=SipdDdd7q0xpeqI54DDBZmSG1GZ+DutyLrSOGK5p42nlPZUmEbOJfRajdm9S7v5r3DOSFPPn94ZxzseTSX8Y0LakcXhPm8HHfWJFovBMtdYsice3XS4QFEhqfnpjX2TjudKwYgTTx4N79sLjULwn8QQEWuz9vzeln4KdbFNZv34=
Received: from PH7P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::35)
 by IA1PR19MB7711.namprd19.prod.outlook.com (2603:10b6:208:3d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 16:46:06 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::c8) by PH7P223CA0018.outlook.office365.com
 (2603:10b6:510:338::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 16:46:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Wed, 13 May 2026 16:46:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 79B38406540;
	Wed, 13 May 2026 16:46:03 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 63A8282024A;
	Wed, 13 May 2026 16:46:03 +0000 (UTC)
Message-ID: <48cf7f5c-4135-4111-8222-659c07cd44bd@opensource.cirrus.com>
Date: Wed, 13 May 2026 17:46:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ALSA: hda/cs35l56: Drop malformed default N from
 Kconfig
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260513162758.365972-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260513162758.365972-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|IA1PR19MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a0d976-fcef-443f-be57-08deb10f1fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|22082099003|16102099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	2IdeKweh78GfjwHMun5e/NDZcee5wHN6k06GVL/rQzgkNZf9UfhvsJEEPuwF+/K83G3dcXBh1CZIkPoUeNvpXilEsW8I4zSMCgPiWDUwEZQBQLzov8nuK9i50RXbrWd5o9iHxvTcsXtURc92V9H1O0DWP8eHo5b0Fd5iAbOm5LW3wwk0kgIxZfslX8juzUNGyuWVUwZUOV/yw5rCTyR3q90xBoXEd+qPuRzs/MB20yO5boy6fcD3gV3nQ/MaInA9DM/zSNOpPjHwBPkzQ5d2PZhsDUN6EP5p8iuOJvRSFPips/iqFNjAurRWA2lGF6LxLqZoiZM6KcwqB5n8wwHDxpfE1OY4+p4cVPjHvdfTKW0ge4WZk4XjWlmQuxzWhLFpBAiiqtmfTuGJ+NP/pI4RB/WRfl4mir1WLUmSPCpigBkRY+72pxhfR8v+LEm0nUs8nvBa4ERMMznq27W2l4+OKzK8olHSg2qeYHt62TkMOnnfTuJHZH6WoM5L1XvZCS9UCmiwFq+kl/MwijuFQ5pvVAU41k1jtFZ+Bj4GscEJVvGbueKnICu9c5fhOxzWbvs8hQa38djXgjz1QWKordD1MpxW0YmLPAps8KyF6pEo1dy3X3rS7ZToIxJ6+AbG0kw5d526XL7NqkipGujCTASanZD/7t6BcSp20gTpOEnjy+4rlXQXNtoOr/hqameOzehC7SYuXG/TxDPVo+puGiaGONiCbfgVdVUSH7o+Bt4ef78=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(22082099003)(16102099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r4DPcVEuOBWnjv62S08HlHwEpe+p3/joKuaUJWBqNxLwuLHkFqTeQMrs1uZqYEyz30/yJUKU7paguZEIVIeALfUEwPHhZjP7yvD/lZZsw4Z/F6O5gDi/U/ZDKu7rRuq+nihrarXlqc6UL9D0Rx/FkVt5PsZW/VfG2kWVL7/n4AuupNB/7o4BUkdXgWpRW+cVGnDdDuNz1RFZ2sT2QxDSqcBnKPe/2sxrQCAp3uIVx4tBrSqvG+OGcVAyAlzYHrTSVEQtrs/W9EdcqGEAXwHTo+7x3+QP34vqQcQTVHcD6Te0Rnxfh5wLfzD6UBBblSjgXApFaRkAAzRCxQwkpvSib83gK4gSc1+2d1neqK81V9CXZ4k5Cn98i3MzStKoRlvVxz/FpbVAS/8qAyvn5KCafI6OYdGaamOiJEOZHK3lalzJYUZrS8+hmfES4W6MPwjm
X-Exchange-RoutingPolicyChecked:
	htrZU6SE9oneNmseA34dPjx3Z6oQohOen8yFV/jf/JvvbUjILMYnTrXjRQ+Ipolb0tVbtSdJW4qwzhRn4IUQWyhIOsFCM7VbHNHYZJJR6M8SYeXzX2sROL7Tk5dLUm+jgmOjQaVl92vy8wuBDli8QMYT9oWsnqKRxalXzFY9tv5UDLcXPAfuOa/weLV/3j+DMhrTAPP0Cxsv4F4N7YChD9SDYblibzFnyGVjVMLye9YxY17MVdBajrqsd2q4yzKmuaHr5u+oCFE+QU59OOPbN4fnfIlKr1KgS1Pa1rWgrKh0152p8UOevh4vzJqeLtnxFvnINZfj92jFD7FP0bcxkw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 16:46:04.6960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a0d976-fcef-443f-be57-08deb10f1fd5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7711
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a04aad7 cx=c_pps
 a=3IUGx84TntR8WEbolwO0nA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=QyXUC8HyAAAA:8 a=WDjZYYtDVvHkqy1ilmIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: i20f2WrnDNgLtyYAUDllcL3q9ZGwzgui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OCBTYWx0ZWRfXwU6TW5ogZ6oI
 TkI91Ttu6nee7wzS+uS0YBp5eULpWat4Q/OWF9eDLus8CMIv5Z6liwgDyel/LOmVXSnhdFiXk0X
 QCHZI/xh9ZTufDg8GWkUWfmfLM9vzuAstHgRtTQ3c30arN0j+F87WgtMZ9zA/6Hn4ViSbjWdvjQ
 ixTYKbyjtkobtGHYdNWgIJfJtESwNPJfcXLHaxeWmOw6tOqKaqZNk5ptS/ZlzMutQgJFWxie85d
 NqH0nkwy88j/QOlXAnxYcHVXXfSNKdw7tC8ToHan9ZNCbpHGD+cbdr8C7hj+XWvRylZFzBewCsP
 x6+j39WhjMv9T4d0ssOdFsYW1lYqEKIKcbq8gKqc0vj7ud4R1UVX6tgQFiz6ZjQY2CD6MP/pQqR
 52g0v9NVQGX1YIf+t45ICJtYNfm8E5ZUF5IM17jcUUUK4axGl/QP99N+UzLMI1WfRPEKdP7KWxR
 19LeVL3DKvaLbhW1LCQ==
X-Proofpoint-ORIG-GUID: i20f2WrnDNgLtyYAUDllcL3q9ZGwzgui
X-Proofpoint-Spam-Reason: safe

On 13/05/2026 5:27 pm, Andy Shevchenko wrote:
> First of all, it has to be 'default n' (small letter n), otherwise
> it looks for CONFIG_N which is absent and in case of appearance
> will enable something unrelated. Second and most important is that
> 'n' *is* the default 'default' already. Hence just drop malformed
> line.

The redundant default was added intentionally to be explicit that the
default really must be "no". But if that sort of thing is forbidden you
can drop the line.

I apologize for the typo, but that is why you shouldn't use case
difference as language syntax.

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   sound/hda/codecs/side-codecs/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/hda/codecs/side-codecs/Kconfig b/sound/hda/codecs/side-codecs/Kconfig
> index fc5651e555e3..e51964c0a091 100644
> --- a/sound/hda/codecs/side-codecs/Kconfig
> +++ b/sound/hda/codecs/side-codecs/Kconfig
> @@ -94,7 +94,6 @@ menu "CS35L56 driver options"
>   
>   config SND_HDA_SCODEC_CS35L56_CAL_DEBUGFS
>   	bool "CS35L56 create debugfs for factory calibration"
> -	default N
>   	depends on DEBUG_FS
>   	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
>   	help

