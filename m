Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391BC3F2114;
	Wed,  6 May 2026 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078257; cv=fail; b=VH+bqvcU7GFkRlSRxyKRiyl6qiGWqzL24ClN10UYLhrz3DR3sNRlOcy9ZIUiZiGtFUNTNL13aIKQw9Y0XEebyROffeZWLXOq1AFbv5PwFOQRdxIQ/ZMVKMBNrYsx8BbCZnofoDIk0JSVoQid4sF0OATBbm9i02bN3JnEpr4sPy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078257; c=relaxed/simple;
	bh=ptgzq8S/MbGZyUq7EiQMP7bSNl/cHXdlz94cLb7LFX8=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=pLz1MeD12tzaLvAiIrngzWceEniGo4u+MgNvTAYTgGU4o5AOPo131TfJCyhyWJCyRTJ0+wN286vDRy25xGIHu/l+jlfWtB5bJ/4pwLLVroCM4eDRnG3D4lg+RN3VqRhNdVzi4piWbBLmg3SjEyD59GfCNUyvPB3PY8cxsQx0IeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=i8tda9IX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WrYRr2ux; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="i8tda9IX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WrYRr2ux"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6465Sqrs280722;
	Wed, 6 May 2026 09:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=s6rDKYJcJa8QJQYZu2kP4sxrtxeLcSdm4DIpcHr3B2c=; b=
	i8tda9IXCwSVmpDtdCF8HsG99v5YuA45MtGJvyZ5z4RbKreQiCOjxj2N0UKQ8Tex
	ZkNLEeMVNu2xNt5KFaSTZOt4k9As/qTNlh59ZErYYijjGkzKIiJEG4nWI+CQVGCn
	Y+uNiN+ma1W6E+BCGrPT7g7qJHHBvWNGVeaYTZcCFG+uUYki3CFCrSCsZd7HTnF6
	TVoGQ/hqs1YVkQcGYBmCdwFwM1Dm6dONv2mEbohasw7j3qsoqowWOEka1kNEwi1/
	5vVL93/SkX9Y/wpHZ8hjs6yoXyFcTAHz510C2pqs1MSCun6QKi9+01kjiU0EuTEm
	J3zWWs9WS2RdKY382BBugg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022101.outbound.protection.outlook.com [40.93.195.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0w9wp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 09:37:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICAkccctIMvkxaFO/OiB91Ygq/b/gnOxs1P3pj3Kqoq80+6knult2F5qSNDhun5t1C2tLVmcY1rbcCYYpjMInrL5qme79HPfHpusll7e2wJU9gDwvUfWfayOw3kVTcxrt+nwbYikf6rIIXbgw1mCj4YuJTyB73kPVSFOtdrA/luu6ChD9gioCEfOvXSpIXelZChv/TLJfeZpXZShhIorNATamhFPJpV+Du4KNLbuwJarpnHSPSG1vtB/GNl/pkBDiEIHAJtCUgXMjg8Tm32uJry2kd+rN5mkBXH3yKyzZu0S5iB3FZm0JGC8uf+3FVswJebnAaYukgXn2OlJIRKq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6rDKYJcJa8QJQYZu2kP4sxrtxeLcSdm4DIpcHr3B2c=;
 b=SdHnyyS6wi0cjzV7+uA462JlM8gKXddFqAHQlOCD5fbzlPSSl1DjupTapqu0xWUqfOAs5WJDOwJZtJGMxSlhLsZm9f2Kx/i2/KSOeJilgHHyJjIHZNlq330WXyhM919gaSxNHngGl45epECrzi4NhELEqTitQW96sFraN8LYwwWhF6ShrftkPT8+Ni09hGi2it+DvlDl/XuvhKhgA75R4CXlxdd9+mSsqSnwqYRm+pV+MnbjVHkWly+T4Kz4cg2bE0nj2Rq9hINbSdTBzH5AiXU+vQcjdnUFScZ6X/vZF6NuV3MNbtX599NCys2xCgeKw8ugq8X6koyNNg1NF2YR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6rDKYJcJa8QJQYZu2kP4sxrtxeLcSdm4DIpcHr3B2c=;
 b=WrYRr2uxps0uqib8yXqApBzmZrNGhjfplM+RUfQvwdpjaCsBfG+ZpgQml09QPcOclelp0BHQhIeGdNXOWyp1gCaoKR4Yz4NobSH2gOL84ngmqG3Pjt5PMsGA3SJyqQqn+ctkvGxPw4mExD6scZCMtcDNygXyUk2sgCg37YeSro8=
Received: from SJ0PR03CA0225.namprd03.prod.outlook.com (2603:10b6:a03:39f::20)
 by DS0PR19MB7297.namprd19.prod.outlook.com (2603:10b6:8:149::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:37:07 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::77) by SJ0PR03CA0225.outlook.office365.com
 (2603:10b6:a03:39f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 14:37:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 14:37:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4654D40654F;
	Wed,  6 May 2026 14:37:05 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 07F4C82024A;
	Wed,  6 May 2026 14:37:05 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
To: "'Shuhao Fu'" <sfual@cse.ust.hk>,
        "'David Rhodes'" <david.rhodes@cirrus.com>,
        "'Richard Fitzgerald'" <rf@opensource.cirrus.com>
Cc: "'Jaroslav Kysela'" <perex@perex.cz>, "'Takashi Iwai'" <tiwai@suse.com>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
References: <20260428074415.GA1632446@chcpu16> <20260428104044.GA1898666@chcpu16>
In-Reply-To: <20260428104044.GA1898666@chcpu16>
Subject: RE: [PATCH 1/2] ALSA: hda: cs35l56: Put ACPI device after setting companion
Date: Wed, 6 May 2026 15:37:04 +0100
Message-ID: <002c01dcdd65$cf39cf60$6dad6e20$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG/HCtvkK3h9lu4DoyCLYcsP8Ba8wH90Rv3tiyjYtA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|DS0PR19MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f22dcfa-29c0-4940-da9b-08deab7cf2ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|22082099003|18002099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	CViUZCcZXHtkCtZo5MASB6jeXHTNJpTj17rKmUMG23qETQIUEr5wMlw9Q1OCrb8l9hOblLQv7QJoSSkZPk89oGnExMgYjHBsU2SfDvVDL+0Ny+d7e0adffHX5P4nBsRBp3W9nQxKz5/VsNnZAENrg8W54mYp8M9nR1whMjvSZUIWDcZAG26+LBUzxGQKaFVDbjM3159repBbfXPVC18NaW7Zp9RZmcrPPaEmixBvLuGXw5JZschP7JZWxUXza8rRR1plrMGXuAslHntmnF3q6bYxJSVvehs1t3EEthsN5LCPAL5kJ1D15Wb2AyFokD/RxzMNsw5XLbaI3QG/GiY8/KnxmtgqanHOVXR8+i2JNujUzHn7iPuS2yT+vtQK/4qtzKJTqW76gTAaUyiNgfkjrvXA1ACB/ouNslTl8mvnK5lEAraSVvNbHHDNj3Kh6HYvW+CH9asMTabJGyBOtkJ4w03woc3HZD+sN/R2VNy3ZN5JAOFkk0Z1LHx2wxKo86B1ptx9tZx0yGzPyUIsToFIRj2GLDQbKF0QoA2oHd6Q/MDToGtgtj+fcgSvEQQt34zxhc7kWoRGdS9AMib8HB6b4Zb2isX66bQdbl8QPWo4P+aGq662tMF+z4rJ+a9tV/K7mzTKVmZ/S8JfCGAaSdaVb9OwgGruoDWS9ygSUk3d8RAuoOJqzB5XJMWBy5527r1AI9YxYClj6lF5Yi5xMjIjOgoTgd6U9/vvCS8sAJm3dE4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(22082099003)(18002099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NuUb/T4/YLFswQllUSd38ud83k8netigCOniuk4l7lrgztFaIXsdNge/pC8MPfcM5EgJzM2mut95uMi8usg/9Pn9ibJo6F5LISfbpZ+BdQj4kSU4KfVyK8SPER9uXYcp4Ckur7+F/xBDHoil0O+zqDSNiP/00wNPerhlWOFpFtTXAb230+AqXA++4qg+Zh8d2XMJzEzmntxBhv9p3yk+UceTyfYTblJpw3xgE9Tzpd198lN9Nhp6eya+vrpl96tq2hVf3evYReddLs6+I4Zoibi9Kz1Hn9SGbx6XARPefvp6Zi3RdOFGIEISNmEDM4kP0vnPjvqsZUx+GRe/HOuhreg0zunsVrvyCg5n8/VkRYJwNADgH3FTRAe4PQirsFv6Gj4dIvpqhhqZD3R/hy9FZHiMmqoZqFzKrybTmoLqd1otOLLVx8X2ExHFcqa/gIME
X-Exchange-RoutingPolicyChecked:
	DN/9fa74tJlRobOTqNxqvftZTtwp5rdUVuqnbmiCu9V9JrGgnGrDMmXMZ0MUMZ49q6sQGrSWvXsW9g1xnUz7s9clDQY2/aXe9gD6h7GSgMpn2CJjw64d9edpo2HaBDYxeA4FLalGJq31FXpq46xHz9HVyA5sPUDagm87p8RkQFb1Ewe1kKKffz4vtO8dotebUpPehVIptidh5FNWaH6hjRIjVFLKi4uvPSbFaulGIGup4yXyMTAqZJGH/ik0H47UeofTWfsD0137ELp/LFtTbqjHJKSlIiTacfl+XebVhlrI6beI1+PZ+F2fMD0IPqLL4X3FVqLKpC5YDfvaUhYWXw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:37:06.7832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f22dcfa-29c0-4940-da9b-08deab7cf2ce
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7297
X-Proofpoint-ORIG-GUID: 6TAbx77nH7ADjj99V9BjL4zD_dGfjzQ4
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fb521e cx=c_pps
 a=qdGNMY5putnn3dTEtBI8ag==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=xAg-tSu6luC5IIZujc0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0MyBTYWx0ZWRfXwanNku98LN5/
 oXIN+WhSM/pAuU3zhNhD/q/ZjAwD5dM1+F8PrSeif5cHw4aBHIED6rdp2q614UwMJAUFI+iWs63
 NLuLH0boIJl1vfxGd4/7oH2fWqcrSA/wCYaqlDf4PrfdOs/VB76cbGAgJfRW2Sfcs+vbk5uKz1E
 6eJ3fF/7hhIeBbvfDPeCYrdrF8jrPOjAFfGL/AmG5vGvoN6RQC5a8HEtZGM5qivjcc0KWekq7NU
 1bmp3+nOt6Z7RygGcfBdDZY4sgU5RogklVJRmjPRXOgE02J8wCB5rXni/mLIz2YwT5Ou3czzyyq
 S7mhYKQGXzosleZVAkoFBKDjQKFTdW59zPJyDauVtEECpg/w8ATsNemkKn2NP2HN8oAl8DIEceN
 tXHI3WiMGHpnZS0aCoW1zotvMnm6J0N5HIalePksdvEC8NTYXH8Ppcl+v11cglXsnGFMFE+esKa
 KUQcDpMaSNYRThhgJBA==
X-Proofpoint-GUID: 6TAbx77nH7ADjj99V9BjL4zD_dGfjzQ4
X-Proofpoint-Spam-Reason: safe

On 28/04/2026 11:41 am, Shuhao Fu wrote:
> Hi Richard,
> 
> > Are you sure about this?
> > I remember when I wrote this code I checked the driver core and saw that
> > if there is a companion it puts it when the driver is removed.
> > That is why I didn't put the reference here, it would have caused a
> > double put.
> 
> I may well be missing something here. But from my reading of the current
> code, it does not seem to cause a double put.
> 
> The place where I do seem to find ACPI companion cleanup is when the
> device
> object itself is deleted/unregistered:
> 
>   `device_del()`
>     -> `device_platform_notify_remove()`
>     -> `acpi_device_notify_remove()`
>     -> `acpi_unbind_one()`
> 
> What makes me think this is not the matching put for
> `acpi_dev_get_first_match_dev()` is that `acpi_unbind_one()` only calls
> `acpi_dev_put()` after it finds a matching entry for the device in
> `acpi_dev->physical_node_list`.
> 
> As far as I can tell, that list entry is created by `acpi_bind_one()`,
which
> also takes its own extra reference with `acpi_dev_get(acpi_dev)`. So the
put
> in `acpi_unbind_one()` looks to me like it is paired with that
> `acpi_bind_one()` reference, rather than with the earlier
> `acpi_dev_get_first_match_dev()` lookup.
> 
> If that reading is right, then I think the ownership looks like this:
> 
> - `ACPI_COMPANION_SET()` only attaches the companion pointer/fwnode
> - the lookup reference from `acpi_dev_get_first_match_dev()` is still with
>   the caller
> - `acpi_dev_put(adev)` after `ACPI_COMPANION_SET()` balances only that
>   lookup reference
> - the later `acpi_unbind_one()` path would not be putting the same
>   reference again, because that put is for the separate ref taken by
>   `acpi_bind_one()`
> 
> Part of why I leaned that way is that I found a couple of in-tree examples
> that seem to follow the same pattern:
> 
> - `drivers/platform/x86/x86-android-tablets/core.c`
>   does `acpi_dev_get_first_match_dev()`, `ACPI_COMPANION_SET()`, then
>   `acpi_dev_put()`
> 
> - `drivers/acpi/arm64/mpam.c`
>   does `acpi_dev_get_first_match_dev()`, `ACPI_COMPANION_SET()`, then
>   `acpi_dev_put()`
> 
> So from my own understanding, those examples also seem to treat
> `ACPI_COMPANION_SET()` as not consuming the reference returned by
> `acpi_dev_get_first_match_dev()`.
> 
> But this is only my reading of the current ownership flow, so if I am
> overlooking some rule around manually assigned companions I am happy to
> re-check.
> 
> Best regards,
> Shuhao

Tested-by: Simon Trimmer <simont@opensource.cirrus.com>


