Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C153F9F22
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404175; cv=fail; b=Oc8yJstqAtLNWG+N5A3FOCfoKP/vnNMc4WgbfEKAPV1lA5MGUPge4iFQWQaSZmRu5AfVGCKRp2vx/Wioe4AKodxoXHqMYKHl/xnwslmXdN90DSLrmqGzHZRmmdNBIpK1tLRY4j+HKNUjT96UFAItz84kbH0PDYZ/frONMFMZAoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404175; c=relaxed/simple;
	bh=PO7SsUMDhWF4goK80onIAJMkjQqzxs9VYL25BgZu5rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATzylK4FHtOClz1yAMYlQ507ZIcTFbeKerH4MqPSHSD1BHPJlnYfjqp2sGb71PnJ1UQuIPMaHcZVhccaYUPRKzEUO+YyJ+4NgYeR4PJXvsmn41zmANY/2lFdrKSasn0MA9Ak6dCnkMxkIwLKtsyQZ6Cz37Zl7Uj+80sK6hQceNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AmK9ZNWk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QJ5mbQOt; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AmK9ZNWk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QJ5mbQOt"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8otki985097;
	Thu, 30 Jul 2026 04:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=+8MC7fqyhrMuG4L8wR
	0G9DohLQrHQ59ZloS9TxiJaog=; b=AmK9ZNWk73QmJB8u8JXsTHLCeNPW+6IhLG
	injdg16h0cs96+nuvuy1ay7T4LkA7mip4Y2+7dyb7zposnDmJlFfARwt6H+MOUZI
	YEwcPUDDpu1WgAk+kOFowjH3k27NLj01tRF5UcmXo3Prp+Ru9FgFDF0EyYuiwpyN
	FUjKEfuVMAEQAx4ENLounCB8dkwL5SU+lnMkWsn0DBvMyybnu+rC9DPnMfmmwg4C
	72RixYoWTEBQgjr4gNhGv9g8keoc5Gh9d4LSIYHJJAc/7WM8ESBCNWmglml4ftr7
	kLmJDWl2C9RRrITsF8KOeVMD7/UYsdS8r/Jp64MHzOC+p5ynIiiw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020093.outbound.protection.outlook.com [40.93.198.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fr3f9r1n0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 04:36:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ij6X1qo5OqguhRbEhDYAivYEvBI7GFdBb2ybkUBzWj1xalotKLAbE0VfQnxDs+1v0o5fylVn+MdzdGxhDlWMXJAnGjAZwC5VUEGuT3gnVfYpn2UVqNn0F5bmX7wyO9ddvEu8/EHTNhwny8Yp+jIalLrQq67ICo8cM5qT6P7KkLlOY9Wq7VJQ5gRM1l4jn3+HnbmKpskoR6YXZee6fDEYvMMJFxBSLPaRd+jTF67EW19nMZ/PoMIboU+lYBlbhF7KTkKMBp5uKLYmaQxkSLrEPVC9zis9lKTuYHzz8GQBTspKgyVmWPvuteAcKCTLZpawSsOL1WXjJGj8WZpsPKL26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8MC7fqyhrMuG4L8wR0G9DohLQrHQ59ZloS9TxiJaog=;
 b=iir0N0qnU81XR3EntecFlja8Zg8Tsj0CvRlDNkklAg6vODZjlR7GMSUeelWUgYGBuFeI6Db97JpnFqT4teWsxaLLM1HiGQWQa0Ef3JYBUOhQw3BlEKM02LYwLuQRqRv3MFzZApyyYz5tK4OS86311Fo11/KTvQbNiKsJ2UJe3pHzNZ43ML452rqEgF7XArJ/UvtkzDlLy/7lTbfuOoxoxC0cx+dJ/Di1lb6kEy639ZoriBjIizCvUVLwwrJx2rptw511Hm5aFXfs4gNYhvIU7Ln85m8bECGPCIaRkSY06Z2fxUqV1qU7fmpAnviOTZbgZadpho8cM+jQagmIpny7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8MC7fqyhrMuG4L8wR0G9DohLQrHQ59ZloS9TxiJaog=;
 b=QJ5mbQOteoZ9zoRr6fKSniB65uShPBoAbWGhtHI+WgExtTbsOEl6C9yV6sKzNscUdWeWi95VgNDx490Pr5NyMeVfSn0vDTR5ugiQmE6jN7DPuVK90eXNx4RGTs01RxLzVsa0uzqB3330hLWjPuNYsOPfvFVbaVr1J3bV5IFZBp8=
Received: from IA4P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::9)
 by SA1PR19MB5101.namprd19.prod.outlook.com (2603:10b6:806:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 09:35:59 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:559:cafe::5) by IA4P221CA0006.outlook.office365.com
 (2603:10b6:208:559::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Thu,
 30 Jul 2026 09:35:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 09:35:58 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1848A406541;
	Thu, 30 Jul 2026 09:35:58 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EB5B982025A;
	Thu, 30 Jul 2026 09:35:57 +0000 (UTC)
Date: Thu, 30 Jul 2026 10:35:56 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 06/14] ALSA: hda: cs35l56: Use auto-cleanup for firmware
 loading
Message-ID: <amsa/K5eyyCBwNLa@opensource.cirrus.com>
References: <20260729083735.120219-1-tiwai@suse.de>
 <20260729083735.120219-7-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729083735.120219-7-tiwai@suse.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SA1PR19MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: 7815a261-2757-46b5-1b15-08deee1df696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|56012099006|4143699003|11063799006|10067099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BGULNa1Kg03XbvlvAuiw3dzj04/iqFNy3Yl6OVKRYuXxoGySwKBDwlXcW+cZGZWs2etQwRkTIZX0ITLX3UVVQW8FyEwYb0+LQQGw0pP3VGdZkU29+Z0PxxGGLJjegZ7PMOH3TC4BIbAcNYIkEAXJVkhNvxfNixONJKL0iYb47+DDJ9B7Ft9+jgjCIci/RtiLMNRJ/cinz6AuMNFvJ+q+CiM9Cnpltb9DWEYjW9NwFjWSDMUtYf160WeAykyVaD5ss1MmroGPxxwXF4T1v76K/zzV82xOow2v1pPJ7xyxnsc4oX053kEA2SHVFZKiyF5cnN3LGOphNDExrRPEoX6IfDSIP+TfaJwgN8utS1s3YPRUMU0jQb/8Sz//ef1ZCmIv5w1X3WZCDLgeR33TAiQVwl2G0pOEFw1SfliYJhng1Z8JfACMqqr5QM0PoDqwXlcITu4OjXoQdsEzL3I1ElKdRELPQO/mHJ/MQb6q+8ZYjevUctQCoEsFZhBV7qb43OU1gTh2l0WeTJlE6QWM15am+KLsP6v9cCeyxu7J2bfwAlDXylPdBDzL4rs42JmlNRjp5uejugDloPM8ERTmtZ+s6Gxwxm1MwAEow8MvQfIou5oyS+Ow0+witSY6J9Jfx8igHADfJHXiLZ/Q91YY5l5Jzt8XpSIjzJxkxxyIZChcdszU0wPzaCo9A8CqTcKlBiix/I5yV6+Spa2+3TsKLkTPbg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PxWIkAR5F4ycFLGI5qcZUPUBPIDMtrYYM3SPSxFsTEwIERdWfivaPU76qtKEBW0/RVvRFMf8ZWVHVDcg0Q8sxKzEWhxMTHAUnSMslaCTyahTICW0Ovl69gqM47Kpu6eE5GikOzsDzvp7ZYU2oX7D/5y0p2JqQdBBXK6Yz8W8dai+0BOXMKwLqxqUE5Kwl+p90xe+PNTNdRg9SlkIyMfJtZ6RGCjNGas9/nkrLiVJ/nz/D/wBVrIKB5wosSESUZFkRqqReueo6vdrIKtW9Nbp3xfs3w3TLg6aEKQ+f3noX8u1pyjP/WVjp8c8WiSmWoyZzCmb6rvKVPztnjdJ6P8LVfKCQ1hsdUhDjfgjULpBoshSdXiVg2hXX+koX749LWPVeWSnLqBgf7njk7ST12jnrbMKMQPZ3Tvp+eon8BFcXkbSEHw1SCU0MbEeYAUZvt7/
X-Exchange-RoutingPolicyChecked:
	RiLYFK4J+zxvDfbw8t+VYsrDEqQNxQGXORdx5PPxBa4JWXZkzaVbwS7yw7H1YgIL5Wk5cABxn3sx4Kddg23jvm46vFVB7Smfdv0l8tQQUPlFajaJQf1bynpHrovdogwXtL46DQVAYL1HJYLOHhoZjQ1DMI02BOG7NbCU96iKqanYGAreXnxVWvDubBsdYFTk4hDWn4o/tS1ExrFT4RnSjK5ULUWj22mqFC7PYFDFs7hp56KR00DWZRUugNhSLnTP9AuGqoJIOd5lc4sSq2xK/jbjG/0Ls88U/t/GJan+Nvo8vAf2JE/8AcLT7FYKAnhP2IV2bIsSS07smSOyZXRCBg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:35:58.9616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7815a261-2757-46b5-1b15-08deee1df696
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5101
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3MCBTYWx0ZWRfXwVJ4khScfpku
 EyFTNjcuxB6U2aLDN/GeF5l5DYiAvdgcR/QVIOV61xcfsNg/Qci4tcWeTrv1LRFi4N/FglxhHjV
 Lc8AkINUF4xGw56Tte6Q98FS3n0KNWPmAjUm6GFc8InrvrmOYjH1uA0P9gCBFlmUcKIiBZBdOhV
 RVC4rH0XORx8Awq5xYw8bEzRka5T7qtwVIs9bZrQTtHbCeYPfXMARJxlq8czDfIXvjtUZcQTWRG
 mx8X+gL+VlQI5s4NBldEvM93kF0N2H6J77jo7dNksBGNLPJ8OTZGDa05MUveBDVUeYg6OGuELEo
 bCJq3mD5rV6RtAYSVVB5RFkjg0GqmZeklu3VejB2ShSbbvVvo/iCKnyoe90azrc8eq8VrYTAU7R
 vwJmiNNMR2HMv1bLvvRQ/qqXRO/+sT/ZBZvnfSPymX15vFoYbEPETDoXjsyUmsU/JydeOXiFxca
 LwaGs816GpzvjL05m0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3MCBTYWx0ZWRfX7uMsBhIE8IJE
 HM5iqWJdaTQ38wl8smf2QQ2o5KeDHd4TJNdaraTJtoNeq8dIM4Ei7QCjSGJLnhV4PbhB0sUf9BD
 GlNVPwJxlMdC3Zdea6QUiVccrAoEn50=
X-Proofpoint-ORIG-GUID: 9KIGFLApgzVcmBGpZRNB52YH1BouBiJc
X-Authority-Analysis: v=2.4 cv=OOIXGyaB c=1 sm=1 tr=0 ts=6a6b1b03 cx=c_pps
 a=bGwgGCu/CPolCU/HHR4Rmg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=sZhAjo35UYjW4UvrTzkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 9KIGFLApgzVcmBGpZRNB52YH1BouBiJc
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 29, 2026 at 10:37:24AM +0200, Takashi Iwai wrote:
> Simplify the code to manage the firmware loading with auto-cleanup.
> By the use of __free(firmware), we can replace the manual mutex locks
> with guard() gracefully, too.
> 
> Only the code refactoring, no functional changes.
> 
> Cc: patches@opensource.cirrus.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/hda/codecs/side-codecs/cs35l56_hda.c | 35 ++++++----------------
>  1 file changed, 9 insertions(+), 26 deletions(-)
> 
> diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> index 78c2cf387a00..bc207ab5b020 100644
> --- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
> +++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> @@ -527,18 +527,6 @@ static void cs35l56_hda_request_firmware_files(struct cs35l56_hda *cs35l56,
>  						  base_name, NULL, NULL, "bin");
>  }
>  
> -static void cs35l56_hda_release_firmware_files(const struct firmware *wmfw_firmware,
> -					       char *wmfw_filename,
> -					       const struct firmware *coeff_firmware,
> -					       char *coeff_filename)
> -{
> -	release_firmware(wmfw_firmware);
> -	kfree(wmfw_filename);
> -
> -	release_firmware(coeff_firmware);
> -	kfree(coeff_filename);
> -}
> -
>  static int cs35l56_hda_apply_calibration(struct cs35l56_hda *cs35l56)
>  {
>  	int ret;
> @@ -561,10 +549,10 @@ static int cs35l56_hda_apply_calibration(struct cs35l56_hda *cs35l56)
>  
>  static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
>  {
> -	const struct firmware *coeff_firmware = NULL;
> -	const struct firmware *wmfw_firmware = NULL;
> -	char *coeff_filename = NULL;
> -	char *wmfw_filename = NULL;
> +	const struct firmware *coeff_firmware __free(firmware) = NULL;
> +	const struct firmware *wmfw_firmware __free(firmware) = NULL;

Is it definitely safe to replace release_firmware with kfree? In
most cases that is all release_firmware does, but it looks like
it does different stuff if someone built the firmware into the
kernel?

Thanks,
Charles
