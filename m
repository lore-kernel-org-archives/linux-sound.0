Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218A3453A44
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 10:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618427; cv=fail; b=hwGHQAMzX1GMyNg0LYvIiktmFbshvBZAnmZIsL/Ktybhwh9/pYJHOUX5T0CJCw8T3C0XnVYHjcsSbxosQz3IRZKyo1VYHe50sZIHJofd0AF5TPztWK2vGIZ4fS/qU5xCpNFBOubBm14jpY/eGgimrqvvxo8zDoI2GRdYBP7NSC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618427; c=relaxed/simple;
	bh=YQOu6OCYeSVaRQC63b0HWQvVZidmeAAKLC7IF9CzF+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYtdDxPY/u8aIEYQ6E1aU4coez9aMyw6XHe0rqr9K6LAOnSlYwN5ErThoWuUFoDZNkLVqWcPAVAJsr2fPL/6ftlXaxHPdsWInH86+6iuB92G+RqaMMOba858nf86w8FUy+fYvh0zFBolWBlCcDy+hfYPQWEnV4PmkUICACcbXM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=g/MXoVQ9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FvIILC9T; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="g/MXoVQ9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FvIILC9T"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DAhTGt2751968;
	Thu, 13 Aug 2026 05:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZF+gwQe1Pvje9Y/2jJ+zLKOgsZz5GW6WZFbhLSdu3OM=; b=
	g/MXoVQ9QtIjQcim54O2S4s9YSwzf9FmuX1UeM1Ez8ES9M0UX64HdRNs9eGGFVx/
	+8Ag3uHMFSmPrrCJm/eqoPGJX2zDqLNo1mmYiO6bOLs3z9kw0gCHVe4JUVvUFYCJ
	7H8RznFUjN9oKPQPmze9Vk64SDbhhIeUGzqiJf040KbWaAv392C5r6URGAd5vM4o
	0IHe4+t6mennc9UjZpXaSYtEl9NL49q0LfnW0bnYVBk4RJyCA+XXfv6HE66V6bsA
	+K8NXptqog9cf/B2oxCrw1yHVntQpI0tjC+caMdEgH1s/EwrCpFrVijzl4dmDL5B
	xkeyN6Pu3+MRlH2ki80iig==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020098.outbound.protection.outlook.com [52.101.201.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g0msjt839-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 05:53:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZdtds2S1LurwnYik+tru00i+5KEPFdqIeFj9rZn34cIOnTGiQ0CmanuwEw89Q1PpQWackE/q7gfkvtqkPXgUpmouibO8e8xeSxgu68tAlno6+WbQRD1evn67fdVaV4kOuEEsxwZ+GQJZPSyMrKPzMcIY70GGEAywdB7tcPPOZyR3vH+0MyAMhtHJhw/IorQ93SJyF9KKDpmyFmwOuK7Ce7gHPaq8oqu2KM1xzUcwcmR1RspDnlzQ8DEnyXWXSnYGe/2OLKunzqbQc4nAlIgkf0vDGSL8Vy5lAmPhKAUC2nYNSA+nj3gPyBHW5xiRN9697nImvLOgh0ggsaM2/vVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZF+gwQe1Pvje9Y/2jJ+zLKOgsZz5GW6WZFbhLSdu3OM=;
 b=UXmqXOJL+2IAC79fchsxcKynsJjhDGEiKU1gLeme4CPW0zaJT3x/qk1u89jwngqbn9Qzy6PbWxlAK2olE1LjZPBD+q+leynUsYke411cqIjDiAyFLhtK+e80wPhzSX9XvvDYCnXYXAzT2ZyL2BMu8Us9RbpbWWV7tsbBgE2frFM9HLFExZUrdfslO1obv5bqkxKy6T7hVuCJfV3ZB/zPNS9g/1wBivqPGSHkcpfU0UEMXgTO7aqKl/RBHdpSNffJ5kLxIpgmPGMEjNZKDKTq79ZmPZqeRcunptnwfMAMkiS7P8dUvtM/8a6Ap8jEhkScrte8a2H/ma9QNAYZnRqp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=intel.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF+gwQe1Pvje9Y/2jJ+zLKOgsZz5GW6WZFbhLSdu3OM=;
 b=FvIILC9TChedEhoyzPu3sKI2mTUFQQyD1Ym/rcty7xQPEoH+BX37M/oMrXTn+ZEqwELM5P5HXv6JaZMWLhhgk6BEIn92LEy+wRQdk8N7vfTGERrdsd6GITRom64PTrQ47cj1WzyIA6xkbQZZMYGx0SlBK6saK0ZAvymkyVhTSso=
Received: from SJ0PR05CA0098.namprd05.prod.outlook.com (2603:10b6:a03:334::13)
 by MN0PR19MB5780.namprd19.prod.outlook.com (2603:10b6:208:378::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 10:53:04 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::47) by SJ0PR05CA0098.outlook.office365.com
 (2603:10b6:a03:334::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Thu,
 13 Aug 2026 10:53:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 13 Aug 2026 10:53:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 50904406540;
	Thu, 13 Aug 2026 10:53:01 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3B462820247;
	Thu, 13 Aug 2026 10:53:01 +0000 (UTC)
Date: Thu, 13 Aug 2026 11:53:00 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Qianghua Wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        bo liu <bo.liu@senarytech.com>
Subject: Re: [PATCH v2 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
Message-ID: <an2iDJ6snX9FZ9HQ@opensource.cirrus.com>
References: <20260813024527.42294-1-qianghua.wang@senarytech.com>
 <20260813024527.42294-2-qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813024527.42294-2-qianghua.wang@senarytech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|MN0PR19MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b521cff-adfa-465d-68b9-08def9290cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|61400799027|7416014|376014|36860700016|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XgBZ4NuOVQJJt2C087nApOA2wQYmlOpBzuHIX4gbzdkQAOpPGsnTQ+KttehbtxlbIyiSDWasaGuuUQT2qgyyUnaovej6ljZ2+2GWOT4Pjkv3jO+gD+CROMrLAW7GcPKpcncx9tMADIPeMTSxV+UygADxYlb7Fzt/uth/v3Idnsu7fp2Xn5pYrwo+wa4lyM/kz2Hk+PrFmiDHd4P7VbzQDJFdOQ+8ORGNmF6ep8U46HU1PbroC+TaCFqi6vYL4nJHZ/HAvjYqgSqxPpWGei0bNKt2A95B6xLi78T/Nf955y+2TK6bQkc2C20vmLVm7gjKBMsn/ny4tinjL8t9oS4FwQ+FFSZ3oImC6M30ykJPmthD2K6ZvJ5F2gEhMqyGSBaq3PhId8oQUPiS9wfC/wWw/jGRx9zHroKyBcVxfwtFAHLYpCPA4+QZZaYafK11tUXCfQRgGYPlHTYQB3UcuKDl/1uKvTHUJiA85d/D7O0pIKl3WltPs50gEHD5daVSUjMHw4pQsRQ8uMvuTJuSS8C9cZRdNZZ4oEG81Q7nDn2w999IwLcsSS4p1UFSpjr+LbPuqaNFHsR90Y132Zb3mKJeMp8hdHcA/LcqARfUiFlGOP8Tm2wqxbvaxTJyTH3RezWvesQsJL1S5BiXp262IKey5Pd23QBKUQABAPDCyTr5iCxsAY63NUITe198l9pHlAY5
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(61400799027)(7416014)(376014)(36860700016)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EAaeosDqlYmgIEml6pQcxY4LfDgF7O/cfiE664zYv7pGmoz6uL9nyePOmR6QtkrK5CleqMBJ3LU7QJycPgVRIBjiPHSLSzmjpjN5T5FspQwEfN98kkvNsGCwTqv9b0BismIUDXL7AW9pdR2XyTk6by9ATjNQ2bOl9bgFYjyMBVopJnVHMXOJCxYh9w4ufVEjRiATJ3UgFaiJBJM8Cdgq/YvBbk+7N+isfHdvdNx12K/tpbhdqxiJSSJYB660shxmaddYUWdohsCuNuMzE7Ib4ukhoFasj3eOlWYdTMfgdki+Cdlp5E6ao0vUiYnYK1IENxISyzxbOJz+EsZTAuM3Wesnsw/J2zwTtpLMZ5xSnnNYsuZhu/gng3VArkbUNM6sowY3ntgIjYmQzuuUocaMnGl1AxFPVL8W4k4tuT7gMXa/W8wGnL69wisOKD/ZozLm
X-Exchange-RoutingPolicyChecked:
	SUoBKYfLXujGP+bN5rRVkogF4OlL2RQL7xGEJN0z4dv5W8p8PVT3TfvfG2MHoVsAvb9AUH468J+NG6HqiqpO1R6p6ciN+yQKmETyh6FkOxggOcBDqBTDKNvY0Z4JYgyya3lxeVeO9xjYrfd53ZxgdameBg+mBYPK0ZMxiqJbDDb9fULkr5ByypiQqQyeD/Phebh5hSOE9HE4nwuTMb6pR2yh3pTXAXlQoHdr/cZFTq5UeEEYV19iXQed5njqE28koSRELc2qPKFWqL0Ck8xVKzCj3k9sAci89SKby8Rklcq7i4FAEF+wU97PiB0RwxIPLY/u2flKc1FxNcxU2GCh3g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:53:03.3954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b521cff-adfa-465d-68b9-08def9290cd0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB5780
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA3NiBTYWx0ZWRfX8uj206V1JrIY
 jutL5gtUhLfcndo+zV1g8RjShU9KdODBrBDOOwiEszpxgLx9KdhJKPSC82UpP6XvOMmpkMHM+to
 5rFhNDfBKSUo9nNfKiEO/WtNS6CVMh/ddwGBO//prUUr/pWzUC46u2AC7gol3MvvxKC5Sd8lNEY
 fOrqAU1HPCbIHkPLhq8BqE7J/00ykdSj7vI/vZf2p1C8hazvRSY22Or4ryaM8gPdQNeYOVhDFev
 ccErPILpgBHI3E/5PUNblxXpGKuGVKPAYBFNeBFP9TJGx23uINk4rNmX4BCvlhpriA7jjkZBB/L
 3bpUY00VAsnQR9hgvk8RMrpzfZuBtn1Uo47Ox1Q9EzoLWIdNbk9cDCo9g1lD+UHqnTJxgq9kGK7
 g9Ug3eNlbz4EDZt8bbR+DNt+QGgh9Sph3r+cWp1ASqI0Im7DgDxtiej1dVY9A7iDFzu63pX0djA
 bXsZ4VjwuFFdRP8LvSg==
X-Proofpoint-GUID: -_bHtqgp4z9nW4tsvpcLe6JG1qxJRjz9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA3NiBTYWx0ZWRfX5c8jPkHb5Ck+
 aT2zcIpx6yh6kp0943VeyW5z98Pr3z0OFlI6pcjgcdmp39BgXLJLbEPbAliLeX7LWig/r+hZrN7
 TKT2QJnvHrxUOo4dAwDYIcLXUgpT8fo=
X-Authority-Analysis: v=2.4 cv=VdTH+lp9 c=1 sm=1 tr=0 ts=6a7da219 cx=c_pps
 a=VmHzJY20YZOiQKV2ZK05+A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=qSUwe0_5AAAA:8 a=ZqMqgqETfRavZcIdnEAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=CHXUDulezz0qOJydz7Nh:22
X-Proofpoint-ORIG-GUID: -_bHtqgp4z9nW4tsvpcLe6JG1qxJRjz9
X-Proofpoint-Spam-Reason: safe

On Thu, Aug 13, 2026 at 10:45:25AM +0800, Qianghua Wang wrote:
> Add a SoundWire SDCA driver for Senary SN624x multi-function codecs
> (jack, speaker amp, and DMIC). Program SDCA SampleFreqIndex in
> hw_params, keep SDCA jack IRQs masked with poll-based detection, and
> extend the Senary MAINTAINERS entry for the new codec files only.
> 
> Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
> ---
> +static int sn624x_sdca_mbq_size(struct device *dev, unsigned int reg)
> +{
> +	if (!SDW_SDCA_VALID_CTL(reg))
> +		return 1;
> +
> +	/*
> +	 * FU_VOLUME and GE35 DETECTED_MODE share control selector 0x02.
> +	 * Only list known FU volume addresses as 16-bit MBQ — matching
> +	 * DETECTED_MODE by csel alone makes GE35 use SDW_SDCA_MBQ_CTL and
> +	 * fails with -ENODATA (-61), which breaks jack plug/unplug.
> +	 */
> +	switch (reg) {
> +	case SN624X_REG_VOL:
> +	case SN624X_REG_CHR_VOL:
> +	case SN624X_REG_JACK_OUT_VOL:
> +	case SN624X_REG_JACK_OUT_CHR_VOL:
> +	case SN624X_REG_JACK_CAP_VOL:
> +	case SN624X_REG_JACK_CAP_CHR_VOL:
> +	case SN624X_REG_DMIC_CAP_VOL:
> +	case SN624X_REG_DMIC_CAP_CHR_VOL:
> +		return 2;
> +	default:
> +		return 1;
> +	}
> +}
> +
> +static bool sn624x_sdca_readable_register(struct device *dev, unsigned int reg)
> +{
> +	return sn624x_sdca_mbq_size(dev, reg) > 0;
> +}

This is just the same as return true;, and as 00268f9452d2
("regmap: sdw-mbq: don't call an unset readable_reg callback")
is now merged you can probably just drop the readable callback
completely, assuming you are happy with everything being marked
as readable.

> +static const struct reg_default sn624x_sdca_reg_defaults[] = {
> +	{}
> +};

Do you really want a completely empty defaults struct?  Wouldn't
it make more sense to just not have one.

> +static int sn624x_parse_sdca_functions(struct sn624x_sdca_priv *sn624x)
> +{
> +	struct sdw_slave *slave = sn624x->slave;
> +	struct device *dev = &slave->dev;
> +	int i, ret;
> +
> +	if (!slave->sdca_data.num_functions) {
> +		dev_dbg(dev, "sn624x: no SDCA function descriptors from DisCo\n");
> +		return 0;
> +	}
> +
> +	for (i = 0; i < slave->sdca_data.num_functions; i++) {
> +		struct sdca_function_desc *desc = &slave->sdca_data.function[i];
> +		struct sdca_function_data *fn;
> +		bool is_jack = false, is_mic = false, is_amp = false;
> +
> +		switch (desc->type) {
> +		case SDCA_FUNCTION_TYPE_UAJ:
> +		case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
> +		case SDCA_FUNCTION_TYPE_RJ:
> +			is_jack = true;
> +			break;
> +		case SDCA_FUNCTION_TYPE_SMART_MIC:
> +		case SDCA_FUNCTION_TYPE_SIMPLE_MIC:
> +			is_mic = true;
> +			break;
> +		case SDCA_FUNCTION_TYPE_SMART_AMP:
> +		case SDCA_FUNCTION_TYPE_SIMPLE_AMP:
> +		case SDCA_FUNCTION_TYPE_SPEAKER_MIC:
> +			is_amp = true;
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		if (desc->adr == SN624X_FUNC_NUM_JACK_CODEC)
> +			is_jack = true;
> +		else if (desc->adr == SN624X_FUNC_NUM_MIC_ARRAY)
> +			is_mic = true;
> +		else if (desc->adr == SN624X_FUNC_NUM_SPEAKER_AMP)
> +			is_amp = true;
> +
> +		if (!is_jack && !is_mic && !is_amp)
> +			continue;
> +
> +		fn = devm_kzalloc(dev, sizeof(*fn), GFP_KERNEL);
> +		if (!fn)
> +			return -ENOMEM;
> +
> +		fn->desc = desc;
> +		ret = sdca_parse_function(dev, slave, fn);
> +		if (ret) {
> +			/*
> +			 * Init table is parsed before entities. Keep a partial
> +			 * function if the ACPI init table was already loaded.
> +			 */
> +			dev_warn(dev,
> +				 "sn624x: sdca_parse_function(%s adr=%u) failed (%d)%s\n",
> +				 desc->name ? desc->name : "?", desc->adr, ret,
> +				 fn->num_init_table ?
> +				 ", keeping ACPI init table" : "");
> +			if (!fn->num_init_table)
> +				continue;

Not sure I follow this, what is happening here?

> +static int sn624x_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
> +				     struct snd_pcm_hw_params *params,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config;
> +	struct sdw_port_config port_config;
> +	enum sdw_data_direction direction;
> +	struct sdw_stream_runtime *sdw_stream;
> +	unsigned int ch = params_channels(params);
> +	unsigned int sampling_rate;
> +	int port;
> +	int ret;
> +
> +	dev_dbg(dai->dev,
> +		 "sn624x: hw_params: entered dai=%s id=%d stream=%s\n",
> +		 dai->name, dai->id, snd_pcm_stream_str(substream));
> +
> +	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	if (!sdw_stream) {
> +		dev_warn(dai->dev,
> +			 "sn624x: hw_params: no SDW stream (set_stream not run yet?)\n");
> +		return -EINVAL;
> +	}
> +	if (!sn624x->slave) {
> +		dev_warn(dai->dev, "sn624x: hw_params: slave NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = pm_runtime_resume(component->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		dev_err(dai->dev,
> +			"sn624x: hw_params: pm_runtime_resume failed (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		direction = SDW_DATA_DIR_RX;
> +		if (dai->id == SN624X_DAI_JACK)
> +			port = SN624X_PORT_JACK_PLAYBACK;
> +		else if (dai->id == SN624X_DAI_SPEAKER)
> +			port = SN624X_PORT_SPEAKER_PLAYBACK;
> +		else
> +			return -EINVAL;
> +	} else {
> +		direction = SDW_DATA_DIR_TX;
> +		if (dai->id == SN624X_DAI_JACK) {
> +			port = SN624X_PORT_JACK_CAPTURE;
> +		} else if (dai->id == SN624X_DAI_DMIC) {
> +			port = SN624X_PORT_DMIC_CAPTURE;
> +		} else {
> +			return -EINVAL;
> +		}
> +	}
> +	stream_config.frame_rate = params_rate(params);
> +	stream_config.ch_count = ch;
> +	stream_config.bps = snd_pcm_format_width(params_format(params));
> +	stream_config.direction = direction;
> +	port_config.ch_mask = GENMASK(ch - 1, 0);

snd_sdw_params_to_config()

> +static int sn624x_sdca_regmap_resume(struct device *dev)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
> +	unsigned long time;
> +
> +	if (!sn624x->first_hw_init)
> +		return 0;
> +
> +	SN624X_DBG(dev, "resume: unattach_request=%u\n", slave->unattach_request);
> +	if (!slave->unattach_request)
> +		goto regmap_sync;
> +
> +	time = wait_for_completion_timeout(&slave->initialization_complete,
> +					   msecs_to_jiffies(SN624X_PROBE_TIMEOUT_MS));
> +	if (!time) {
> +		dev_err(dev, "%s: initialization timed out\n", __func__);
> +		sdw_show_ping_status(slave->bus, true);
> +		return -ETIMEDOUT;
> +	}

sdw_slave_wait_for_init()


Thanks,
Charles
