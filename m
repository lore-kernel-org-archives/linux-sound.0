Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1FE3A961B;
	Thu, 14 May 2026 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771071; cv=fail; b=pFWM3+nAcD5UJbzk4148j6bnkEngBGWngnFQBRcXHAhG5MfHk02tXaFE2EA0/4CQIlG+dMQg2NVFhL9kyiNtcStaynWb/aCgoK3NY7X2+Hxmee4RvDXkSKTpC9fVrymXcY7FIB5cDb/Ax8dlIIdg9wBUejJWARIN8qiN6sRtUdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771071; c=relaxed/simple;
	bh=Ieda3U11cPapEgfgMJDYtNJT5A7dQTilYk97JyvshSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CyRPQub5HOPxDmg3TzUAs9d1LEfJmItuIYGW2w91jAEUGxsVFTmrjMqjR6FVcZeKEq2p6MKQkRduqvAEwgzArf9j3HB6aSztQAAfwKZZLm4wJNagPl/mmBFeg0Zyion5oopEnmhLI2r9lTfSIlg95ycrjxvXnot+ko+mbT7XGxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PkQe9DQF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mOtK6g+/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PkQe9DQF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mOtK6g+/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EEwi9D3326040;
	Thu, 14 May 2026 10:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZXbrg9YTDOTyBVwo8kr3kLSEl5kKNPt9ZXIvMnl8IFs=; b=
	PkQe9DQFe7Al24NO5PxeSa0skJpmfSsaEdPDFLK12RXXRQGfb9NY3sz65rKD5P0j
	9y+DLWC41L+Tk3O+XmJ15x8A2BG01ZPCOkDjimZOrlsnIVdYqS7MuPnjK5e84QQ8
	4xmG8+zzq3Z8PH1efTJhpNersPNndi22QivmfoSbY5Cz8Uewbyn7o/3IAZ9z63PM
	JdJEmGdd8EOSE+AKoV+LmHEOCOrETSF+Z2Flq9Cj6BdNjIqFojTc1LG7a3AU3u3k
	Omo2JfZ+7LnqFKF4QM0Tucrnq/kN0duy1HKjZ1lABkD3CyzRMiT7UdE9c5C2Q+Xt
	FyZSNAlpbS3H8pkjrksTkA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023105.outbound.protection.outlook.com [40.107.201.105])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e4c7q2k4n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 10:04:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdriwiWZJcNY797URopHLrmTV/sKQq4fWM8Zcwk6GuivM9BWmu+e0kTnf9ZLRF/8PEgA2FgDEOA5hXEDSehobvHZQU+91mb96YhCt7CHfAJ24JhuIL6xQMlxYQIVk5k2nQEQQiJsi2cLpFPfGcGQlspvAQn5+SycpVKqjEPPnUsyGMBchVY0mtrgJ3Q+IwjD4C2bKSWaVjhVmzd//gZyhx1om1o/41jLJ1sMC0srUMCuLLjG9+u9gw/gbI6q5F8UfG7Qr3w8zfJ9cxsYSYUDF+ogKK6Tzfr88L6HWC1O10o5VxqRsbyAz4X61sfakxkg48PgoT+AS0GQTYE5R18YSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXbrg9YTDOTyBVwo8kr3kLSEl5kKNPt9ZXIvMnl8IFs=;
 b=wdu8ZBTCaxWs4vk12zeVYml8dXbSOB3uJkjU9N6IvqUDZ9UBueKsPhEi9/lNjK4z843PD+/LiDohk+gTf5pOxiLA7NwsRk+OqVGs/pISVxhjSGP+WkO+8gf8xIfpvDsnhPwmhg3tDdlptDYtITmEo4g3GbCnxJySd/SWkgIpHvbc87w3iI9amys/bPHEHeWXEOtS5aDQw7R5g9lrP0AhT4977zyrjX3xlFhFjZ1ZxJoclBY5bkdVo1RfwoF08DmXLrjloD2H7kT2t90eC2LQ3ZNnLZUn5RzjV/V5PD8HYRcbMf9qG7Ll7abV+SmWHf5YzpNIj8ndsNpGcHoQe6dumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=linux.intel.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXbrg9YTDOTyBVwo8kr3kLSEl5kKNPt9ZXIvMnl8IFs=;
 b=mOtK6g+/M1AnZpQJx6DwiWV4VD9UP2EBmsiBxWCjGbarH9cpSLh6IhVP2IWP9pDtXD0ZmAhE06GaH48vG/b0zNBuO0B/P0pZJF34YRtk29Bu9aSylOQbe/qcLrD9Gc6/5qp1Heh+feBAOVr9qZsrPhEPxhczmMwrUT6GzWDMIks=
Received: from CH0PR08CA0029.namprd08.prod.outlook.com (2603:10b6:610:33::34)
 by CH2PR19MB3832.namprd19.prod.outlook.com (2603:10b6:610:9c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 15:04:03 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::6c) by CH0PR08CA0029.outlook.office365.com
 (2603:10b6:610:33::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 15:04:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 15:04:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8BBD5406540;
	Thu, 14 May 2026 15:04:01 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 667D782024A;
	Thu, 14 May 2026 15:04:01 +0000 (UTC)
Message-ID: <73f69782-2758-495f-8086-e971483133a0@opensource.cirrus.com>
Date: Thu, 14 May 2026 16:04:00 +0100
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|CH2PR19MB3832:EE_
X-MS-Office365-Filtering-Correlation-Id: e19dbc60-8d49-40e0-903d-08deb1ca0930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700016|18002099003|56012099003|16102099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	ISOLzwgRsQLsczpdSqXZtCxyB35hRlHpeFIDeD5cMQvNnC7F3EmdHSBKJX0CjLyyJypJ/bypJbi7TTW7eZnf6YV3c480VBcGLsLb77zVmkjLE+A2i6WNabLIjPrd220iUGpLqksjU8PUqHu1eGSBQ1TDcLLPP6G8jKV3Ww+F/PRbI96IrUdNA6RMNIuyFFAcKCJ66p1OEPTe7YtW19qujDxUg2Jj9hs2C/UtBUkoeS6xJ6z3Lz2FY8FP7fNIIgpkRV/J1BYzV39g+PZQYQjOu3tX8TTrBEWRkxxklALR080VRbpcXvP8I8kQtEtxlmbBmAHffVDWZxawkHrIJ+Da5uZM72fjaTKzWFrZyWKUdfK4ux/EzslkztjSbTg321G14pWh55gcnZntmaKeqsUPSfr5Rb2x1XFgDWh847jtSNY9OaKQqQxCLCg8U3qnOI6ABW79i4INSN9mXdPOia6yUdCbYLKMGYWW3E0Wr00UeuzWI3ZJRYOM5pw5Oan3eBpmXNfFmw+tR4acP7oDPgFGkICzIf63OGPShMZCaBjtHP2wpd6xOzOlD4lHOOPVy1scj6p1njXtonq/BIc5sXeQ6G7hE4MpIJjl6Vh76FTjFsq9+SemS1BZmjtL08HyOBCFhAAt61CLXRsN2S0Zu/3KmmN/I3Rkn3wjlggic5l/ytY0335RAuDxtiYYwC2EqRcFuoDj/THC/mS/0L94U17iaTFVdhonJjQ0sYwhFK16CGU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700016)(18002099003)(56012099003)(16102099003)(22082099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6GPuNYPJdRnb8D5qq8T8iPCOp3NZq/dO0CuVrTf+gY+7LOn/nCOg3QuCDH/GsSaYn5XixwKKJzOMGtwoTTHXG1ZVa9izv+6PO9XYaklNhD6km+zt+/iabUVQiAGcz0hywSDsE8l9sg9DmUUYA2n8M7dL4wL3Bl/cmTwRIopO4Op9oGCmrsj8YP0faGOIcAs4mSHwS42f48LpqKjgmPbLPHPdlOexUEBO8vifVR7xgMQ/XH5yMFMo2LNFHn+YvL/MjGzdLrxFtu2JgE6dI1IZdzhiNbRfpvvkt+3DDyQoDDg8nJbYNuhNTxWgR+MURd6IhlACKvFqyRk7tmFdfrNVwQ9r2N5lfdy5S3H7WvNuAZts5hffTI8PNFxrK+IZk7helzQh7vjhegPn9Jp+MltsuJB+MpxO8zMJObKO1WrQuQopIylslB9aG0kHK79Lhw26
X-Exchange-RoutingPolicyChecked:
	nicUdw3JxWIOk7i4u0pDaMQbS5kKRRR5jo3jnmoKxNS4P1wUVifniPy8iS95Yek5azKh7OzPIvFc4DbudWKCjDfWiH7TWlTU+srG3Sx+bKw0EX+3KeI53v5g9JIzWn/mID2FB2fe1qKATbdpmFfJ7uWHt1jbcYYYtL+ycgwC2i4QPxMYspzC5Ir+sLDelrf8HrbtMB14j4eRpuR5y2kX5AEwxi5OMDWAzwm2aYJRh+BBBlsW7fljVyfyqH1ra1+kaJfdjUStH+iCMq8Gbmxr3TZn/2RD+7wewuxnM84HIAJHlys78+PpOy8VKqOyvlGGFKzfHWWiNqqW4ggseqT/iQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 15:04:02.6516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e19dbc60-8d49-40e0-903d-08deb1ca0930
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3832
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a05e468 cx=c_pps
 a=mXWPUgXNGD4LDRIkHGcDmw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=b8D-plGB5X1cvMOrIeYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: oL1kZdEgF0uvLpNIqNU0n5YMHcIX-cHB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE1MSBTYWx0ZWRfX/sZ9eNhiwWWk
 1YtaDdp35mAKZBjj2iuZsHUIlm1gEzDpLSP3WFwrlVUQ04hwDPEnj8mTUTrUkYO6q4PyiT66epM
 bkwFrbu5FPdNTFiHCFydo0e6mekR0e5ipKotydeE33EtCsvnfi++5lbo0/IayizKCclY06N9op9
 TzYB+/3F9dNppWMrU6vJ6wfg7OTDwxqc+veveAVwFwG3A4C9tzP11lrAUQ1EaucKs9ALbnVHeyu
 P20zdlXq4aKlh/I19+WW+OYfJmwAj9SWnuT9kwGsSZ4tfrkfrxrLJUX380GLZld/XYn1I7QQnT0
 UHzfhZAtE+MzEuiM9HFAOhUnBlLWJ+HV8t1JfKgzcEFQeTunfuSWSLvCSPZnQynopoYRGFajFyv
 Z9fJ7sSwZEXCl2sf0AglIpC09ZRSFtJ2+dLl5cGPLEUuj/VxLJcw2+Gk9jmowWwZ1pb8gQQu2GC
 ZoqWsIXUDcXudIafLvg==
X-Proofpoint-ORIG-GUID: oL1kZdEgF0uvLpNIqNU0n5YMHcIX-cHB
X-Proofpoint-Spam-Reason: safe

On 13/05/2026 5:27 pm, Andy Shevchenko wrote:
> First of all, it has to be 'default n' (small letter n), otherwise
> it looks for CONFIG_N which is absent and in case of appearance
> will enable something unrelated. Second and most important is that
> 'n' *is* the default 'default' already. Hence just drop malformed
> line.
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
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
