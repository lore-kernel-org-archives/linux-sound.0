Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61873FCC;
	Thu,  2 Jul 2026 15:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783006069; cv=fail; b=gXMu8fwpSc9Eshzs26Y7SYn1KfeyyUfvgK33+WQ4jMvO8YWfvWPU+9bmd/FFP9EOzBRv+FmCuI/xijolT1i9prU0zdwAdFyyJxP5/pnx7Q9xJcFtXg6MPv0PZwF8Ps84uorzWD/grZnpJAdoL0UaBowDM4j3F+C3HYehSdECPXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783006069; c=relaxed/simple;
	bh=x93RqaMLNPE/hCrtxnYhf26CH1tKZT1amv92Nkv7bGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppduc8FZP9PJ9uy1O2UjwgAS864qBE/Wh9sH9waqTU7mdTNe/Cg/DIS113eh1PX8XTWnaOM+HgkdG7gYvkHRmkQb6TAtP+Wm4pGQq6F5Za9XldcKZRYTzycacCDt2GlKclgCTvtOLOv7cV5wR3izwBQy3nzt58XDFKfC7VGNrGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OFvWCpFU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Tsff1gvj; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OFvWCpFU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Tsff1gvj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662Ci8sv459841;
	Thu, 2 Jul 2026 10:27:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BGa+Nx2Eiv/Tz4C5fVTtolu8VNpu5QYNKOlD6l0/7tg=; b=
	OFvWCpFUpEnV8ij2k9bi+qZ2fZo/K4ibVkWIyv+visVNt6JRc+FEUEHEPcUo7GQn
	bZgG6PoS/fZKTPaLM0RPOlc3uoKt3nD1lQ2FG6KtL8fpbQ/WReUZQ0nhO79f2ckh
	xpIWFYnYCmcTVOvOVSLOa+Y38Vj63rHaVSIwbw/x/0MkSL9iIbajhFQqkJ+C+nFy
	c10SIAltboYU7W7cUkia1sfxe5ck50CRJ9RSS4/I5PfJfCvDg2TB1VeFaO6Krif4
	svS2zpFNZdBf1ITPpewKq3TCaxTbLHgdlcKMNKOAEZN3freoUkvcbLsFmUm4dl0H
	52sYF3bntxK7Xm+4Uhh1jQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021082.outbound.protection.outlook.com [40.107.208.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f4e5r475f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 10:27:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJdzmAus4IbEXrrbHrbW9OxuwKRz7SAXcUZ4xZHIwdyGhDJmr+1BssSCUY0VvlzmzsR5HnlzGxZG7bHBdGCHGdh3y0F9EEAXEQ1pznt8aBCaebFoGRezS7Dxt8PzHQZa6skg7gXD1U+KfboZoASeg2TGJorVls/sk5xUlQEctWHpc8op18J24E9GTvzC1TRbjZpw6yYQi+0knUrlGrBKRbwYogyyfLYQnUq5gRJebDO0MotJ9bGET6RDqiqvI+ei4PP0sxSNXLECSy/bdgEgV++vmkLF/TxxVGi1pgo1oDePOpV1seWGvt0ByUQnwsLfu+BHtgAdrNqu0nYSXM2EKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGa+Nx2Eiv/Tz4C5fVTtolu8VNpu5QYNKOlD6l0/7tg=;
 b=TEEOgwOBsmNau00VO7j+5MqEy2gYIzARrfktMi4nU0HA+D0/b/Vl9fx69PqlS+kmIGTYOMY6QGGfC+aL8yvgZ7MU6VlZ49yXJfFLWsGp32qIE6UDiQc85v2GcERnRw7ZtKaBZUJ4MScXEl27u2BIzhJ+grqouPfH3t8+xUOkZUYnxh3OtlA/8NrV8ra7pYfRNq+0ygjaXrlcYzYj3yJcC4uGWAoqVpOFa7uDjLuOl7nyVahpA85fkSYanAnSQK8JMvj1wK3QWRihjlmaJJPma+Ph8UJPzSmj4TcC7+iBtlNf4fhwhGf+ZhcmOD3Z0WViVzJyXVWdrXXoagd4fSb/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGa+Nx2Eiv/Tz4C5fVTtolu8VNpu5QYNKOlD6l0/7tg=;
 b=Tsff1gvjI0ap2OiG/srmXWH/rYckKD7grJZMdVmKSgJJn6YBPPrNgRIRi9u67eYnWTMBkT3RDD+P2DZf0nT1V7VMqZ/vY1YTzKBHculaQrq714+fw4muGfFC1fPFdNd0tU/3cDX82juzcwM1MjhWotepCVCTMfM1sOUdwOjD5XQ=
Received: from CH2PR17CA0020.namprd17.prod.outlook.com (2603:10b6:610:53::30)
 by DS0PR19MB6501.namprd19.prod.outlook.com (2603:10b6:8:cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 15:27:22 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::7f) by CH2PR17CA0020.outlook.office365.com
 (2603:10b6:610:53::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 15:27:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Thu, 2 Jul 2026 15:27:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C4D4D406541;
	Thu,  2 Jul 2026 15:27:20 +0000 (UTC)
Received: from [198.61.68.151] (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9077782254D;
	Thu,  2 Jul 2026 15:27:20 +0000 (UTC)
Message-ID: <3d947f2d-7b76-4462-b1c2-fb95d1d106b1@opensource.cirrus.com>
Date: Thu, 2 Jul 2026 16:27:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ALSA: hda: cs35l41: Add support for Alienware x16 R2
To: Vadim Lysenko <vadim.lysenko.ua@icloud.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702144147.100523-1-vadim.lysenko.ua@icloud.com>
 <20260702144147.100523-3-vadim.lysenko.ua@icloud.com>
Content-Language: en-US
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <20260702144147.100523-3-vadim.lysenko.ua@icloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|DS0PR19MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 7837a330-fee5-4549-2e04-08ded84e6960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|30052699003|23010399003|4143699003|11063799006|3023799007|16102099003|18002099003|22082099003|56012099006|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	+pXP+vxvewhewoPBIuEWbMG9mAnDXurXqqCHN+VytpXqDiY7byKMMD32v5xiEwNC8P7A5WIcNRNpZJx/5q1za8S/FFhJ9JLTaoAz927C9X3S9DjGxoir/AuO7naNHpQd9+I7B8ZXyu8tmjd0KLWWu2/aF9GqKRY26oruCe6ksEMzGDV0nuGz8l79I8pm0fW9LhRLhzz3uAhW2vVbiYmEmGBN/XmN/AZTQjSvs23VhKUdxmristhdCFNHyli5foxo+0w7DhwJchHitVCSCZ/4BL7CrhUZ5JXpc5+7V6Se93fPBzJCRJRd7tleZJZiCdI/xvZLLF8nAUFYUW8fhnaXGCA+UQJqvynmscOoD18ABBUDQH1SfR8fG2bTeBWhaGyBduiKcuOq7GAJzmzgLD7bqMnGEl6l0qt0lvVLjNqHMgNYY32IOKfKiAYzlwmqxmcY126OsmrjLmFtDLbRfAmw9MOfpk/PgbpO1TDlmoSg+ZNU8A99Z0uHo7bQlWYFSg2Ku4LL75os2vWy6V/eJsy+LaSeWF97ocbfnoStqaEtuoc/9g0Ji/kqdEqZyX+9/XYm1blKiXStfujNwkfSETSeEy1ZmHjENybBL81LgaXRG1qfS+UYicWaqBkhiz9E+pXwErvc0KDx2IKL2+MtBhlUJQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(30052699003)(23010399003)(4143699003)(11063799006)(3023799007)(16102099003)(18002099003)(22082099003)(56012099006)(6133799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZL9QB8VwmJYSwXr++scmDodJYzlXwIPiIm+Ort28ElwFanGaPhYbiS/zToqyMSUhydZYRPON+udHtqz8b5utLvgvuLRY3+oxhvqr1L2KQe0ATLZu8xz0cYcDYHYk9G6YfSrc9hq2pZzXerpscSObeRIP7gt+jme+PzH97cYzF240uHP/bi/L58Vpk7/zBo9v3th6eVPLcNH3tUVzVZw8s7BiXqhofRn/LX88ytRvPVlQ+TvSm4j4rlNkclo+MuH6NwqlLL8/i4deDuQ0jgjOTEO6wkPzaI1vDdnCq+Ml12RIeNcbqOvPV5h1fLraQlqglTm71ZESyglLb95HCkizSVohuJcr/EpeibqLqgWeiCWuRWOT5gqURNPajqo9DzEKFbtS0SCm+hILGGxhNL/FxJ4qnc2bylS9HxZvCJt1y4vMYfqAFbBHfl59rtEQqVeU
X-Exchange-RoutingPolicyChecked:
	WiucUrFDXxIjlhxymMlFI+qJWUpga72eC9rtxM+tW13zM2sAD9NMuG9erb0I5/6Oa06hzKEyiCHU6rkbH7rM6wuwWWNGIIA9Cp21KgRd0nojvZnFtAs+cX/E7U14RNIwjBlCtq0W+wF8JS9sq5ZIRcstSEqqCYiePYiZiTm/RoObMzxf4oh1mfQM0Vf6ZKF26SEsfTjp46TlB4yV/mH37dmzT+ZRR6kk50uWa8vvSxMxzXLBwz903CFlqHQHhd2HMllamOd2YtVjiZlq6oWSDCpqwqV2L57MkpiWJ8HAdtgJbK5huRiaUYGNi/VdE+FmlZm7RJ1qQDQrWPJfsygu5A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 15:27:21.7787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7837a330-fee5-4549-2e04-08ded84e6960
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB6501
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE2MiBTYWx0ZWRfXzmkzwcI6eIwt
 +O353ICoHwBGw57F4T6unuIV7pLkzti1Ebmjx06yx2OyGCt84xfsOLBtcJ836JbNrgvigbszyEi
 Kwgw6Bf22aHH2tZufwMtIOW2sHMrdpg=
X-Proofpoint-ORIG-GUID: BiHqd66egmtVewq_wYancoRg1JUS6at-
X-Proofpoint-GUID: BiHqd66egmtVewq_wYancoRg1JUS6at-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE2MiBTYWx0ZWRfX6eAqvH2j5sNn
 K1T9xLsaw8mmRufdWxbWV8XyUOQRN7vrVyakLVklN+w9i1NYbJ1DYBHLXC3F+zajl/Hlv3FEAjB
 gRsSZDyDtY8/KvK6Sn7PN/v51J8h1ZxkbvIq5dX3S7zvB7y/mO+wZh1iFdkrhEOUlTD4g3QYF/7
 20Lnsj9DKxz9sCPmZUhVGywGwuw1sCiiJUUUwePvaoWThK+nu+UG++oy879AhFj6k5x5OXMP2de
 eIjqQEfq6chbJ+yOzthnXht7FechxRXrzPCQWjku3M7Bl3aRaI6UGk+03SCSyAkZzKhrQz9UyR8
 6R0s00r0UeURzKzXjoX0TYQcgs2HHD9DrR12UQ2XOdY+7HkUjkTorV5HPKds63mPZAaBQlNrQ8Q
 /AcvNL1Z6BNCLLZLAl3HGxt/dCBb3JMvQ42jmW8A5OY6OhkqXwnUIQJUAjMmTM+C28d75YpPMf+
 lehyb7WzDhORHDJuD/Q==
X-Authority-Analysis: v=2.4 cv=eLojSnp1 c=1 sm=1 tr=0 ts=6a468363 cx=c_pps
 a=Wfyg2MIdxp6jvjeZNnPfXA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=VwQbUJbxAAAA:8 a=v3ZZPjhaAAAA:8 a=PLtZthQwqoVX0COlhMcA:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

Hi,

My understanding about this laptop is that it is actually a 4 speaker laptop, but the ACPI only has 2 SPI resources, which makes is very difficult to support.

I think the values used in cs35l41_hda_property.c are also not correct.

If you create a bugzilla ticket at the below address and CC Cirrus Patches (patches@opensource.cirrus.com <mailto:patches@opensource.cirrus.com>) to it, we will investigate as soon as we can.

https://bugzilla.kernel.org/ <https://bugzilla.kernel.org/>

Please attach an acpi dump and dmesg to the ticket.

Creating a public Bugzilla allows others with the same laptop to find relevant information pertaining to this issue.

Thanks,

Stefan

On 02/07/2026 15:41, Vadim Lysenko wrote:
> The Alienware x16 R2 (Dell subsystem 0x1028:0x0c90) has two CS35L41
> amplifiers on SPI described by an ACPI CSC3551 device, but the
> firmware provides no _DSD properties, so the amplifiers fail to probe:
>
>   spi_master spi0: error -EINVAL: failed to add SPI device CSC3551:00
>   serial-multi-instantiate CSC3551:00: probe failed with error -22
>
> Add a cs35l41_config entry so the driver supplies the missing
> properties. The values were derived from the machine's ACPI _CRS and
> validated on hardware:
>
>   - 2 amps, left/right, shared reset on GpioIo index 1
>     (kernel reports "Reset line busy, assuming shared reset")
>   - speaker-id on GpioIo index 5 (driver reads SPKID: 1)
>   - chip-select on GpioIo index 0 for the second amp; this lets both
>     amplifiers enumerate ("Instantiated 2 SPI devices")
>   - internal boost, matching the sibling Dell 0x0b27/0x0b28 entries;
>     both amplifiers then identify as CS35L41 rev B2 and play with no
>     boost faults
>
> After this change both amplifiers bind to the ALC289 codec (see the
> realtek quirk) and the internal speakers work.
>
> Signed-off-by: Vadim Lysenko <vadim.lysenko.ua@icloud.com>
> ---
>  sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> index 416d7bf3e..de70d511c 100644
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> @@ -38,6 +38,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
>  	{ "10280B28", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
>  	{ "10280BEB", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
>  	{ "10280C4D", 4, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, CS35L41_LEFT, CS35L41_RIGHT }, 0, 1, -1, 1000, 4500, 24 },
> +	{ "10280C90", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 5, 0, 1000, 4500, 24 },
>  /*
>   * Device 103C89C6 does have _DSD, however it is setup to use the wrong boost type.
>   * We can override the _DSD to correct the boost type here.
> @@ -470,6 +471,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
>  	{ "CSC3551", "10280B28", generic_dsd_config },
>  	{ "CSC3551", "10280BEB", generic_dsd_config },
>  	{ "CSC3551", "10280C4D", generic_dsd_config },
> +	{ "CSC3551", "10280C90", generic_dsd_config },
>  	{ "CSC3551", "103C89C6", generic_dsd_config },
>  	{ "CSC3551", "103C8A28", generic_dsd_config },
>  	{ "CSC3551", "103C8A29", generic_dsd_config },
