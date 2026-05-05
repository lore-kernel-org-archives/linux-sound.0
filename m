Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3562C1594;
	Tue,  5 May 2026 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974399; cv=fail; b=NHfoFtEWhC5jsJF41trros1uxHEywgtsRcre/4QS2n4oSNu7SaB0h9aSigzVoJlWYtz5jGuIEdHa1yHVKnvC9POsC+p4ju+zgs8JzK6VFy2G/iluq7RkKrcimZ4BY++qVfbJsUm1kY22oNuen2869z1anWqJqAw7Bau41cydJvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974399; c=relaxed/simple;
	bh=cHZ3QCoDdyPFUjk5vgohH7Btw/IMCgfAbSg1xl0T9po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PgxXJpcYliVziPsJy3Sp5/9m+OTbGZrfKU33CRS92S7vUws6yLInb4XO0T3xZoZPogYMYPZIacOR3L51XSj02+PSaeIZxp1/mP1WtN9DUgZupj6DrzNty4rMe9tcQLWmdLSYU9yyLOlovo/NiN9IkntAXgsreN5dVd2kmwFqO74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hvxi56sJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Hhmnh8w3; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hvxi56sJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Hhmnh8w3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454rArA1749407;
	Tue, 5 May 2026 04:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6CbP4ZtHUWHdH2WWIge66z1a4cKHhL6rrxdHbabjPic=; b=
	hvxi56sJ5z1m0TD82h297j1b38ECnB21DNfJ9evgioiraZWd82SrrYcImCtzgmcA
	9IeYv+XYfgHewRJOqGRswXv7orEtky0BzOT9fgRjRaPT+GF4+euFDt9aoFWTUKsI
	JyTemDmlaot0mlb6/lgh+KM8BNJ4VYHaWjG4PGGh1+57a+O+SNt4+bRdD9mmlNKA
	8u9SwCbgQ3mzN3+wwYfiOaHs5QhoJn9eUCzwK+BNucKRVCkvILxDyH9FPgdtDRNF
	Dj+zWFcehM6DuE1QP5ZTZfQnfXDTOr7+qEBFUk3iyfW2OeEzd9Pk25Oh88ohrT1+
	wdOUugjoWBUNhyLN1Qjojw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023134.outbound.protection.outlook.com [40.93.201.134])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0u8rd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 04:46:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCmcIp7+pM4ajbGwNzHzBD6bhPCa3IdnGCoeFh2mfDlucsAOIakOhtUXXvhNVnMV41fhsgnmN2LrlyQ86CRE05bHwuH4HKh8h1zOJQyIblLapFdI0qAnMQvfP9o+feKuSUc5giMNrfgIUfrDe95yNrPYD1yar19O+GmxTqDN2amZioPUCBwarRICod//01UobkI3FhhFFWp3qBpoFgEvdjkxUqgWtjl+Qd53PuRBFFi9JJg3/7iC5YAwpVVT2iVIU6FCwgeDXex/MD0+PSD0cFIMnK9a/vSl5yOYNhkhT5uambU5OHYqfG9Sbp62thzWP0SojnTsUBeEN4FTIw71PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CbP4ZtHUWHdH2WWIge66z1a4cKHhL6rrxdHbabjPic=;
 b=fTnyfsIKp8xJwDrF/38vI0SZ2e+Pk8c6SwdpkjdWFHPRyXhKQeoUp1UdTBogeJYuN4mR3Wh+6J3H1VGTSqNdyc9Lv17NEmM2zVd5V+XC1H44J6+6Hraz+/x04UkQ39e7p+gNidPXj1Qpa9wxjRrrrUniYyRi4bJoA/LQp+TL4/VDr2CLLn9IQyl2Qv3pzO3JTJMp0WzRL+hwjr6aEIyrLj30zRfy7UMPnRNOgwvvSJs3u4o9DU8OXsJ+CeX8Tmkzrw7n56ErD5YYde552yagDDm4zXKJyDzMhhdn7X/uoBs1sChHnLnui18n5qWAYJnHZBIcHvfbe4U3ClWc9y1FYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CbP4ZtHUWHdH2WWIge66z1a4cKHhL6rrxdHbabjPic=;
 b=Hhmnh8w3mQ5fvB4FwqyhCIKk6dnFg3gB6Cm22WDz/z2KGmtEPj/R3UYB7CbKXjFBLaTettS5sc/vJUgLZC6H0QAPwHgdbHz6tjcAmPI7M7ZpXGaww5pScVQ4bEKNtCz7bZOiKdczV8QMSPeIpqp0eaoV70u4RCMq7E8FoTt1SIg=
Received: from PH8PR02CA0050.namprd02.prod.outlook.com (2603:10b6:510:2da::19)
 by CH3PR19MB7212.namprd19.prod.outlook.com (2603:10b6:610:144::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 09:46:31 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:2da:cafe::13) by PH8PR02CA0050.outlook.office365.com
 (2603:10b6:510:2da::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 09:46:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 09:46:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 13B5040654A;
	Tue,  5 May 2026 09:46:29 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C36AF82024A;
	Tue,  5 May 2026 09:46:28 +0000 (UTC)
Message-ID: <c376b094-9724-4605-aaf4-0b4592b74a48@opensource.cirrus.com>
Date: Tue, 5 May 2026 10:46:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: cs35l56: Use devres to destroy workqueue
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260504151006.3374934-1-rf@opensource.cirrus.com>
 <e322b673-0eda-4342-bebe-2a444b004bc0@wanadoo.fr>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <e322b673-0eda-4342-bebe-2a444b004bc0@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|CH3PR19MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6d8327-efe7-474f-2f9c-08deaa8b2f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|61400799027|13003099007|56012099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WP2BRgQfcPsUauhfVm4DZH7MIyhpsKFgSxhnMkVvIiVOjATO+vtFalNGaGzu8AsJAjqC7iC++u23OtqTQ7ra7senNN4Vm4JDdgsI5AmeMBdCJfPxMBwz9ftcju1gAC+Bor6urIoolUOM2LjlsbjemtqwrAKNzJfgA4sJQX3giHPAfePxAMX222keUjjp5fTK6MLjRq85vEjwPIRiy11pp0qxxWzC5EuAsQ3ghcZ2p3TTrHaYbqD0ACa7qhies3woEIDshvfiIdWZ1GWe9lxQ/6RgZ9OmA96aOTbr0bthH2FbqMzq/yhcsx1aD0y8fZWWdgZjmI7Z7iJfoy+KNBjQzFgZ4MdLubJ84p14u26dE/RL26hZxuKM3w8vruk2BiCBhmRXTISRcSIz2yZVumIhWXeZHv+Y5zNsepNzx1qEZBs1yVezzplNYo33U0paTnKcG0r09v9clFQ2Khg36FN6MBcr/QAqSOF1vwSCPI4dBBkDaqpDKYPf1EuRR/3HwQ079umF8u5Ynta3fEj+UPC9Aw1x8B81Tljx5LJzkKoGTetRKE0670O5v+A7iVxCQjxICskD8JIk7NS0L0slodKgR0BheurneuGXeQvNgCbPIOxFVs8p14vwk19UsLijyvkPtE2XAzjlYDc1RwjMp3FgZDu/SXaEx5r3IJNRRzUXcEM=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(61400799027)(13003099007)(56012099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dE6DmAm/+DmrrrmJk8eVYazNjPqVW32VSIFHqDockW+4CyRPFjJH6V+/K8oRydHOmyOs+5EscADwyefKy4YyR9cxbD3gjPA6T6b/rH2vdbolv/tL4DkwU//7NacNzlW/BGncOi63T/umP1+U6WN915YYZugpU5jxxWVaE4zZ1c7h+4iv9xBs9FFD5eyrDx3FywaclwSEkK7x+ufyTHF5b3y6S7s7WTo5vbMAo1NQXhqA+MspNUQqLy/3J2le2lgpDDpQBauJAJ8OuRQ0zmN/HS2yfHy67jqQim52Nr32VXxppqoZfxB0lhw0YIUQYvZGEuHBy/K3NisHgKdVn1ONPiSQPsZxMnIQ+6FR0H1RsfDmwAb1v47ACYoqe5+Em2IR3JRWUB/6kpSQXik/FpJ+23vATsS5fxHwLW9dalN3L44ms4k42K+Du6uHAY6hurep
X-Exchange-RoutingPolicyChecked:
	tx0y72T4JCd329E2arN2i6y9pVWAkrMqesEhZeB1jvzU5LaFLeJyObwWlrzMRbaVCgnAPqCbuFALT3qznKs+Tx9k3ykJjY+GUaqZ02lABQFomtvyQ2d9MMmnVYGQe9VxrcW5FGA6ivtukhiKvgeOBrXI3Kq2IVgEKIleZziw+mDzykJLs4xFcdD59YSqNIk89hZCRL78KoMddhmQ9A78OtS96BUUGg12mGeY8QcXDf2z9InsaPsO9xXMCj8YSu4XeFGNOVVn+k3nb2Hf1+C5PkAs96bW180N3/prmm/olPBOQz8z92REnZCDkE+FpwQueKiQ0CyGZoT2QQSG5PwG0g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 09:46:30.2287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6d8327-efe7-474f-2f9c-08deaa8b2f5d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7212
X-Proofpoint-ORIG-GUID: uFn1HNS1QFy4jDR2r2HlmGgzmxUKF3X1
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69f9bc7b cx=c_pps
 a=kguG1nR2ma0GTtLk2h9wKQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=c92rfblmAAAA:8 a=w1d2syhTAAAA:8 a=-shhNCbG7RmcuK1FwAoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5MCBTYWx0ZWRfX/P2Kz/9Ybqrc
 Vs2zfGwyALHPWH8JFUqIra5XsZ/CIbb9dITtOaNbQ5TCreOA1ngVoK3WIlZ1/p2H4C248yOKCnV
 5JKuJwNoFFXFnrTvlE5PK2hlHPhH5EMupPkShmXkNbBW3iaqT5sL7aTtO9pEhiLY+BOEYlvmT0j
 QN6ZWc0TVUbvpPAsQZbhTCAcpmqdj+IS7y6Obhri6mSGPzX5NOchGAUJgvQSOgE31xbHMYSfMqb
 OTJxuwG8feOO5H3wXRC8dTylZugAeeutWsyCLOFtyoVzPwRs7Lru0o93ykxvOh+VoUwas0VLUEM
 1CGL257OvISomgGc0DlnszEqDZECSk9bGv7lgA4f2jWipZE7c9pMnWSjDe6hljo3KiDJmMeZjpG
 bpZZDSjtiPZVecM5zOjTPR8AMsj6y/JYkvhx1vusW3D74nT/VoTjjcfp1J9JlLzBVFE0PHlqesX
 cf9EEZtoLBhFN6CaOPw==
X-Proofpoint-GUID: uFn1HNS1QFy4jDR2r2HlmGgzmxUKF3X1
X-Proofpoint-Spam-Reason: safe

On 4/5/26 17:46, Christophe JAILLET wrote:
> Le 04/05/2026 à 17:10, Richard Fitzgerald a écrit :
>> In cs35l56_dsp_init() use devm_add_action_or_reset() to add a devres
>> cleanup function that flushes and destroys the workqueue. This replaces
>> manually calling destroy_workqueue().
>>
>> The error path in cs35l56_common_probe() did not call 
>> destroy_workqueue().
>> Using devres keeps the destroy_workqueue() automatically ordered relative
>> to all the other devres-managed cleanup.
>>
>> The call to destroy_workqueue() in cs35l56_remove() has been changed to
>> flush_workqueue(), as pointed out by Sashiko:
>> https://sashiko.dev/#/patchset/20260504110743.3341869-1- 
>> rf%40opensource.cirrus.com
>>
>> The use of devres cleanup was suggested by https://sashiko.dev to avoid a
>> small cleanup inversion window if destroy_workqueue() is called in the
>> error path of cs35l56_common_probe().
>>
>> Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic 
>> CS35L56")
>> Closes: https://sashiko.dev/#/patchset/20260501103002.2843735-1- 
>> rf%40opensource.cirrus.com
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
>> Change in V2:
>> - Call flush_workqueue() in cs35l56_remove().
>>
>>   sound/soc/codecs/cs35l56.c | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
>> index 378017fcea10..26fa94c98775 100644
>> --- a/sound/soc/codecs/cs35l56.c
>> +++ b/sound/soc/codecs/cs35l56.c
>> @@ -1627,6 +1627,14 @@ static int cs35l56_control_add_nop(struct 
>> wm_adsp *dsp, struct cs_dsp_coeff_ctl
>>       return 0;
>>   }
>> +static void cs35l56_dsp_workqueue_destroy(void *data)
>> +{
>> +    struct workqueue_struct *wq = data;
>> +
>> +    flush_workqueue(wq);
> 
> I don't think that an explicit flush_workqueue() is needed here.
> 
> destroy_workqueue() already does the job ( destroy_workqueue() --> 
> drain_workqueue() --> __flush_workqueue())
> 
>> +    destroy_workqueue(wq);
>> +}
>> +
>>   static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
>>   {
>>       struct wm_adsp *dsp;
>> @@ -1636,6 +1644,12 @@ static int cs35l56_dsp_init(struct 
>> cs35l56_private *cs35l56)
>>       if (!cs35l56->dsp_wq)
>>           return -ENOMEM;
>> +    ret = devm_add_action_or_reset(cs35l56->base.dev,
>> +                       cs35l56_dsp_workqueue_destroy,
> 
> so, I guess that destroy_workqueue() could even be called directly 
> without the need of cs35l56_dsp_workqueue_destroy(). Not sure it is 
> cleaner.
> 
> CJ

Ok, I will change to manually destroying the ASoC component in the
driver remove(), instead of using devm_snd_soc_register_component().
That would make it safe to directly call destroy_workqueue() from
driver remove().
