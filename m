Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72A63D522C;
	Thu, 16 Jul 2026 13:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207879; cv=fail; b=WW+uHsLQe3HcKLVo3rQNfdZzQpVPtrLJR3r4f6tTphI8aXUTHJTyvSDf1VsIj3Wi49epildq+bBz701+CmDEPztsMmUiRlWuHRgVKuU/KZI/95BP1thLojyygchSFtzlw2FrBgSKrPMdFr/KYMisVJrytLnzRMaXWNkcdk4aIr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207879; c=relaxed/simple;
	bh=b2L9ZWv1JbwPVw9X4AS6X/9zxmuq6YHChBVRXltjuJY=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=BQ8zne02gB4k7Fw9AhLAwxOT7tVdIw1prJdnz6o3xJZoi+hA0VEMlNvA2v9bvKyt0x/P3c6oDBh7XBOknvaD6ienrTW3g3chwj97TVwIESW8Aobx6EDcUIH4CnBEIvuyR7Z4xyF6yQxsk8lrH3wPhOYS7jDDx8IzmyJv+XKUe84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XgW4Bu2j; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EJKmNTSA; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XgW4Bu2j";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EJKmNTSA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G4lGm32667203;
	Thu, 16 Jul 2026 08:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7p2L5fwUkcpV9BhNSFW1EGRdhgfFs/6CCbd0gQrCH2A=; b=
	XgW4Bu2jKqJw8g1u95ybJVxYebPy/3m4tizGGNB7jJ2xpOmq/QUpJEWbnyD8Q9Ab
	ZEKyOcolSsM821Fjgyb/KZyz5BGa4b2J+17anjrEILsT0uqopxHiSBhTjN238Rrg
	CcvSrX3TU6cgoA1dK9BZL1oJlhyzyEKuCZwaYpBVeeNJbhZOdUsEfl7ruf05zjpD
	4XXp3E7xHe28qMxuzbtEzU/DJhnsvDG4CBRQZC0b0i4jc3iDui/BR7An2bE/oVf2
	8TdjxKoDWdN1m5kTQ8R2QD/L9mFGWD00NbC76UZ02Sc4tLx7lsrcDbXiPEY9nicp
	YlOBCzJe/8RKx6mH5y1cDg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020098.outbound.protection.outlook.com [52.101.201.98])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vy6hf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 08:17:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLQEV1V7D/iyWpEwmZ9FI2WuLIaDYkuWL5gEz3chr4q2rDuza2pH1vMQsF+JmyQdUkJ3zh/+WuPyvtNTROunAJD2PLAFgn6vh5nq31q3WjtnoQKXw9DGmc1nAsapdFgH0Wt+apigC7K4kzpF617wlDQd1o1O/DrMWSJveujrQC29y10SGiocmUWj/sPSpQNivc5YdU+Gx2g5oULCLOHwCTMATwm/1/rrTPh6PLvUnFV6xdyvyD+J7DQwaaX52w7QZ9Z8a+nhPKOeUAOgy5D4cS97+Lb/hbOndBRmVM6jZYRcvitBx7wb1KMZtnDkXX6pye5PfyzZmHCBlhAW0waNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7p2L5fwUkcpV9BhNSFW1EGRdhgfFs/6CCbd0gQrCH2A=;
 b=u3qyDul5EdBOJAJTZTlJGycXOvl7qFekO8akFB15QCEu5fYBT4wV8cTYR0ocmRmBnvNlxYSoI4Xxagr5XTuqZtwuBM/R0bUpb6G8cWK1jOTUxg6GLQWVGwQXTJ26TMV+Q6VAxAt3ReaROIfhd9NxxguN5gKqrYcymfkPYWrF+ucKfkU+6Cfzbivf6KEIj3lkZHO/u8oe247pF0HMsHDeLT19/OmtCJCeOLtlQrDExOkuU8yMe8ayNoISvIzCOprzb22Jjq5IGmSIZHTLXLKOXICZAkBKbzk12GYT8b51/o+M/ouseGc9zrm8c6+JIhuuI9Mx8dNAdPV95o10t8k3fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7p2L5fwUkcpV9BhNSFW1EGRdhgfFs/6CCbd0gQrCH2A=;
 b=EJKmNTSAYRraAn6Mr6cS+jmfi2VKKRYryfduv15oRudRL9KvwXPkKPNXsjtuUsrntMU/trJqEM8pxRI7YQtHnnl7ZrkggyivL/HAlFq16i2bqODvrn6euctvYVfuUA/2dGvtAYmilQfjjkMHRbZ7cwuhpnKQMl9P0FGlYYfbZLc=
Received: from SJ0PR03CA0028.namprd03.prod.outlook.com (2603:10b6:a03:33a::33)
 by SN7PR19MB6734.namprd19.prod.outlook.com (2603:10b6:806:265::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 13:17:28 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::a1) by SJ0PR03CA0028.outlook.office365.com
 (2603:10b6:a03:33a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 13:17:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Thu, 16 Jul 2026 13:17:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 170C0406541;
	Thu, 16 Jul 2026 13:17:26 +0000 (UTC)
Received: from LONNCK4V044 (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CA0A6820244;
	Thu, 16 Jul 2026 13:17:25 +0000 (UTC)
From: "Stefan Binding \(Opensource\)" <sbinding@opensource.cirrus.com>
To: "'Takashi Iwai'" <tiwai@suse.de>, "'Yufan'" <kuangfan955@gmail.com>
Cc: <linux-sound@vger.kernel.org>, <tiwai@suse.com>, <david.rhodes@cirrus.com>,
        <rf@opensource.cirrus.com>, <perex@perex.cz>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
References: <20260716101708.86725-1-kuangfan955@gmail.com> <87ik6fut08.wl-tiwai@suse.de>
In-Reply-To: <87ik6fut08.wl-tiwai@suse.de>
Subject: RE: [PATCH] ALSA: hda: cs35l41: Fix Speakers on HP OmniBook 7 16-bh0xxx
Date: Thu, 16 Jul 2026 14:17:25 +0100
Message-ID: <003901dd1525$71ebe080$55c3a180$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLfcaamvUDNT59OV1JbArLyrjcs2AKAvwOLtFdWUyA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|SN7PR19MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2656e2-4c48-4140-2273-08dee33c956b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|61400799027|376014|36860700016|13003099007|3023799007|6133799003|10067099003|16102099003|56012099006|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Xs4lyLzM4GjpQZzsUHsuSyYrBF8gnSZsy/tw7umojFcmYUKyA1VqU7rIaqgwhD7I6sHdMmjQGaOfVtRMQ4ko96H8qm2DaV8gYsHIgVxn4l/kromD46mMbJBp0hOvtq3iwTfZMoiRnes0fpucbnFtd//btKeI0ZpWGbnyFt94PrNC2T3tM2vPM6YmZbZTQnbiVOX3VsBm5M71FxCJ9sgxT2p6XIqOCNfXkyspypNcmiA6B0iBmMWSTlDlXXamiq7wBRRWuZSJ7IN/n+2vQ/2BOuUvIebD7k/CkH3ykyveZ7DtOYjAi270ZaHtWIKu4uJ4Xv6AFW3fC0cd5MvkKL4ByIpQVl1AaFUFfklRDjukeLGqxpe9GeacaMBg02L+kJrOeHPrAix/Io7GAhHYZ5eHAi7KrD/xsb2zvuI4OXWc8YWWYdbNHb/7I7kl680cP9i4pu83Wv4VOIkGeStpIJ65XQdsnEUEHApvvWGYZpMT9LZH7KXZIU4xC9ruaJNHDjMj8OV/jWltb7UDkF59nJ+xW/Oq+MCGT5NLIod9FmKrjbhebrQr9UCfnGfyNIFjw1I1aEaeKwwZq2E0yM0PlRwpNt/PIlBElKfaCuoXpjYh4C4fQEuAuYwKQ4bixBFkdCjgCTBPhwxuRxzrh+OBSCn/SasMMVzAginWkwvE3JFLwrpcXUCepjr/JJFXdRPmC/n4BxAY9pHSZwOTL8g48atCCA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(61400799027)(376014)(36860700016)(13003099007)(3023799007)(6133799003)(10067099003)(16102099003)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GvC8gkpEFb32co9TLMnac56fZwx99ydBop/fgJW/tpY8Xa7/hfxib99aw/rextF+X81z0XMrY7UX4f6z/jbAG70BmjYZqZVVSayYcrwyBbIOF1QbSMM5YvmF3irkm1UCA+VSvDcSrtpTezIcP5PzW661xEcp54anIVPpUzNcoGhsy0+mBTToggCQmklRFxacOhS4yakIyVcafAEQOCYhbdALS9j/VMeCmVmJ8kHKrNgFHpynMkAkfSpxBX4I/O3lzHcVSyTI6iZYVoC6W7JtD9uxwybwwLzVBqq0HPyEtHCcZzX6sxZTRs5BQhFErOELeMKGhwmSZwtQgX8ydREow5At1jhL7Qwbmz+287I+CyofmPed/aBsU+5udFHJWRYCyenqNWzMzqIivJ4dJPd2Eqat7gx33I+ZlMmdXsw/y7HaJp4DDZNHdbFmQHSw8Msz
X-Exchange-RoutingPolicyChecked:
	W8mdCM2mmhdQoN0bQ3bofNR4Z7vrF/AcpL38BeOfysGj7/KJWXLldjXEYleMGKKsyxa1k43oY1rhUJoZjyk858t4X1hPH+4LfXbSse+jt9/6oFfa6giuU3gbFnw2bqBGzBUA+UFfO2tu2DskA+kmaBstr3xc/zll5uMd+/fEF0xxjKxQz42HI8NLRBG/cmUnSNwMzzH1TPTTrdtKsM5918AkB0ltKsMdcjtEHZ9X91uUZXKYHIW/DZWK4fbIZ5fWbaSF6i9Qijqz/yZsfyR8Q7GXtj/XwjwJ7SD8j4GQ7ONVccT5ZBG66JHmEHV7Fbih9vcBK/6QSCf6fQ9s/s1EhA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:17:27.4372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2656e2-4c48-4140-2273-08dee33c956b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6734
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a58d9f2 cx=c_pps
 a=VmHzJY20YZOiQKV2ZK05+A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=LpNgXrTXAAAA:8 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8
 a=iox4zFpeAAAA:8 a=hZu76g_DYw9XGLO25g4A:9 a=CjuIK1q_8ugA:10
 a=LqOpv0_-CX5VL_7kjZO3:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: dl0NcEcwS8RKNwFMYmy66tpigCEkY43J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEzNyBTYWx0ZWRfX0CIwqF/2PfrZ
 TQE8mgePSD50J7sDGJCUxadhqJ2pIQPnT7zxYVzC+BfSzUj7sTHo+81LeoP7ik542ZNY1XfZo+y
 zmztEv0YZO6pn8DxdtB/KyPub9D7TjE=
X-Proofpoint-GUID: dl0NcEcwS8RKNwFMYmy66tpigCEkY43J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEzNyBTYWx0ZWRfXxXyrN/Ve7rGy
 oCO6NkkNWdgtTVeOe0BRyV4VVANizIIPyJ7Dj3WNyRpa+zogIYXy//DAC8y8ejajTyj+rjv1WZX
 C8Kjt8v2izPmeFYEFNeoxNwBeKLdUC3JrvzjQt3jGDFwN+upfk8eQp+IOjfS2fxBHtGYEpRETbu
 TdVCKQI7ea+zB6VLX7lpzwNraWgvlm7i96I6XfSaUvzFLAIA7SS6mipqKfaicTloVQ1WI4hkZUo
 lGNzXY3el1X8B0lLiX3Ifcjpf9FKZ9q7XNYoMNKTA6yjq0uirxrx3HrRnDYHLcbs4dZFhHpDOBY
 jj+0R27/qPLtj/lU3JWAkSlVvDdeybY4rGdQhQBAPlQ0K5A8U5UJf38rp1vlMm2QYMyYTDfWnCb
 9XmmAorZ30iUn5ZW+qp7XVq/dhIuadhmOhiBCqr/xi9CRRFd9RvMLpfION4jMdLO/2rIfP09PQU
 Yx73Uv6fCPKGLH1z/ww==
X-Proofpoint-Spam-Reason: safe

Hi Takashi,

We should be able to add entries for this laptop and others in
cs35l41_hda_property.c to override all the missing properties from ACPI.
The ACPI in those laptops is malformed, which means the entire _DSD for the
CS35L41 is corrupted, and appears to be missing from the kernels
perspective.
In most cases the malformed ACPI is also not correct for that laptop, so its
not a case of taking the settings from the ACPI on the laptop itself and
putting them in cs35l41_hda_property.c.

However, we should be able to determine these settings ourselves, but end
users will not be able to.
We are actively looking at doing so for this laptop, and several others.

Thanks,
Stefan

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, July 16, 2026 11:30 AM
> To: Yufan <kuangfan955@gmail.com>
> Cc: sbinding@opensource.cirrus.com; linux-sound@vger.kernel.org;
> tiwai@suse.com; david.rhodes@cirrus.com; rf@opensource.cirrus.com;
> perex@perex.cz; patches@opensource.cirrus.com;
linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] ALSA: hda: cs35l41: Fix Speakers on HP OmniBook 7 16-
> bh0xxx
> 
> On Thu, 16 Jul 2026 12:17:08 +0200,
> Yufan wrote:
> >
> > From: Yufan Kuang <kuangfan955@gmail.com>
> >
> > The HP OmniBook 7 Laptop 16-bh0xxx (SSID 103C8E60) has two CS35L41
> > amplifiers connected via I2C with internal boost, but its _DSD
> > provides cirrus,dev-index as a Package while the driver expects
> > per-device scalar values, causing the probe to fail with -EINVAL,
> > leaving only the left speaker working.
> >
> > Add the SSID to the configuration and prop-model override tables.
> >
> > Tested on a HP OmniBook 7 Laptop 16-bh0xxx (BIOS F.12) with CachyOS
> > 7.1.3-2; speaker-test confirms both channels work correctly.
> >
> > Signed-off-by: Yufan Kuang <kuangfan955@gmail.com>
> > Assisted-by: Copilot:DeepSeek-V4-Pro
> 
> The very same change has been already submitted (maybe multiple times),
e.g.
>   https://lore.kernel.org/20260709214414.8461-1-skbotnl@disroot.org
> 
> The problem is known, and it's basically an issue of the firmware.
> But obviously we need to address *something* in the driver side.
> 
> Cirrus people -- do you have ideas to fix those HP laptops?
> 
> If it's not feasible in a short term, maybe it'd be better to take those
quirk
> additions; although they aren't 100% correct, but they do work somehow in
a
> certain level.
> 
> 
> thanks,
> 
> Takashi
> 
> 
> > ---
> >  sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> > b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> > index 416d7bf3e289..e14a87336478 100644
> > --- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> > +++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> > @@ -85,6 +85,7 @@ static const struct cs35l41_config
cs35l41_config_table[]
> = {
> >  	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
1,
> -1, 1000, 4100, 24 },
> >  	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
1,
> -1, 1000, 4100, 24 },
> >  	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
> > 1, -1, 1000, 3900, 24 },
> > +	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
> > +1, -1, 1000, 4500, 24 },
> >  	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1,
2,
> 0, 1000, 4500, 24 },
> >  	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
1,
> -1, 1000, 4500, 24 },
> >  	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
> > 1, -1, 1000, 4500, 24 }, @@ -511,6 +512,7 @@ static const struct
> cs35l41_prop_model cs35l41_prop_model_table[] = {
> >  	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
> >  	{ "CSC3551", "103C8CDD", generic_dsd_config },
> >  	{ "CSC3551", "103C8CDE", generic_dsd_config },
> > +	{ "CSC3551", "103C8E60", generic_dsd_config },
> >  	{ "CSC3551", "104312AF", generic_dsd_config },
> >  	{ "CSC3551", "10431433", generic_dsd_config },
> >  	{ "CSC3551", "10431463", generic_dsd_config },
> > --
> > 2.55.0
> >


