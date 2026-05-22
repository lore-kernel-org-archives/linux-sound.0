Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7E73EA974;
	Fri, 22 May 2026 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450558; cv=fail; b=GAZIFLoC3ql6+b9f67r04xzTB7551G4m4AtXhP3wAhN2y19HCJ4AL0swsR/dHjvkczXedCX99xuY8EScRCsbdhmIqd0UDoQ6Q3iKVCEKYn4pKD2yE8ZrIjJoC9Yn9cTcDQqr5B/cuLR9GP7PsEfk5wQ3SRwGZ5Io1pUUSp3knvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450558; c=relaxed/simple;
	bh=Z1ftp7zZdITYwvPAwUla+OFScpgEHNlBLxfYNAsWZ5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DA7M10Vyi/hFs8sm0nIpPJeg5qYY9t4Oe8C+AKOP0FIXxn1p8W4RgpKLEDJ+LzqoYKC7kRfh6I7H9+RpjH7kkHilkAFFeKqg8yGaXchO1JhBJKaiHGUbOfB2J5gYp39aFC9xB6OB8nBNcct+g5Qm1m4TaMYze9PURVGICHPe6xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XVAHmLit; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sWZV/iRo; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XVAHmLit";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sWZV/iRo"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M360dN669172;
	Fri, 22 May 2026 06:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=x8XK2JCxA5eTPF0vGGFs8FNZc4kQmUXhGPQlJn0ejyY=; b=
	XVAHmLitWBZHvoAVF2fCAtx7h5Cuux8+mc+QMMg7fJ/NBo+c2EaHK6/EJXbRnfoL
	StBEv5NcIVe5ebGSKaCr5+YTlDkWx5KflZTpZuYpYcWTgiOP+pdqNpGOpZ/jF1v3
	uE6ECryxDWVOsyD4735CAE6L0cHi/ui5vK8f4qo2p0Ipf5cvt4/NfdoB2LLrr2WA
	U17dPGCuXT6/xACRjXwBXznWCpP/HCDW2ElXlUlShU1hj1YDBHiBCHNRR/UOaQpU
	ExbEDrQC0HfRi1nGoF3K6YEpNKsSJr+F5HaGLfcBHeN31y9YuAtQYpSGdAlixoYj
	jypn8vkA25GV4H2/P5jh/A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022140.outbound.protection.outlook.com [40.107.200.140])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e93xckv6m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 22 May 2026 06:49:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WReEp1lig9QeXqJ38r6+n3JRtHDyg003+6/UTVs1Wmm5oJGkkOmUH2jPffg1zbWgxL3tFCOHUpywzegPYGFCon5gF4V9BjmQp/pzJkWG65bsQWHw/ykEhxvXCR7iA3Hwf7zhamkDrB+Chsoz55k49rCVd9tRWFgo8BudK6eApcI0syiKC8VBK29lpoihX7D2zYyFTKyy9+ZIGe7bABDwLGbzMr055QEoyhFAkjujEAzr5qlCRK5bbJqG9O8MGuiyIBlgJbyOQ/xfY2PVnFmU0upCkkuIA8bqITO9CqrLijqGqOHZ8ttlIIoiW4dXWr1H3DFG7sJTROtYe+fqd1FeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8XK2JCxA5eTPF0vGGFs8FNZc4kQmUXhGPQlJn0ejyY=;
 b=KZVT5OpeP97i/u2ogf2k1K1/yCxDvBtuNnm+p+B0x20Pj0yEXDdIziSKUI00BNAfLe91SdgTE7qICrjy76fNJfP9J7XFWf54Um0Z4qhqitNIYCMHtDVRmJAfWs6khaQfA7i9eDXAuXV08XThI/ARufI8fHmx4VseNKZRRYHlpZ2Q0/ge68L979BNcbCD/Ios0Aiw8R/Z0rXmggc1YqDXnQKQZ7oiUMfymLGNLvKx5e8iR6Ib0QoGKKynGttIGKo31mPJ7634xSu7+QmAUkYOX+uQUm+QfiM9f4EI84ZCDX45Agf8HFkkiwl2Z7eo1VZcbCAnDz9kcoeq624v3krOYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8XK2JCxA5eTPF0vGGFs8FNZc4kQmUXhGPQlJn0ejyY=;
 b=sWZV/iRoikZU3hK0xlw6gU6cdIFLFJ9whh3oouewIRJX3mpYc4OWIteT9hXXHwOj3e+bqNR/AsSPMKYVb9ALMp90ZgbnHulYG13LFIY2/Np3cSDTgywOmIbodaTk749vUzaD5DoeGkvaVX43XXteXi8XANcRDqRgbN9m2+xtxxc=
Received: from CYZPR10CA0023.namprd10.prod.outlook.com (2603:10b6:930:8a::16)
 by EA3PR19MB9303.namprd19.prod.outlook.com (2603:10b6:303:2b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Fri, 22 May
 2026 11:48:59 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:930:8a:cafe::4d) by CYZPR10CA0023.outlook.office365.com
 (2603:10b6:930:8a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 11:48:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 11:48:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5EA6F406550;
	Fri, 22 May 2026 11:48:56 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3FC74820244;
	Fri, 22 May 2026 11:48:56 +0000 (UTC)
Message-ID: <6f4a69ee-d338-4c22-a2cc-bf8e8596cb60@opensource.cirrus.com>
Date: Fri, 22 May 2026 12:48:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: hda: cs35l56: Fix system name string leaks
To: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260521-alsa-cs35l56-system-name-leak-v3-1-9dd4e2dcb473@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260521-alsa-cs35l56-system-name-leak-v3-1-9dd4e2dcb473@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|EA3PR19MB9303:EE_
X-MS-Office365-Filtering-Correlation-Id: dd27e604-d815-4d9c-8da1-08deb7f81bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|61400799027|13003099007|56012099003|16102099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	/Hj9A1oJgNg0IyuFTrIyn3EDn4Bcx/vH4QyVyWMCRtMGbOcOc/rT4Ny3TBNpPVk0qqNdhOmf3B7b+ylip9ocuE89RsO7AkYBzb9qs5YtsAezVwSVwW8jOsabeZuNMB071Mq16LUHSo91nQgTXdkn3p8t6gvHdL49sP9HW9RAw3pn2eEXAlaJ9RHAZuK7B0SjySBpX7XAtzz7ZcrSKVzl8H73jQzsCiYLMlVhKGzJyQgUphJafd0AA4fsnaRTBYqIk5wzukn6FZfd6WW/TDiFf4X3BqL49RrU3xRoZ94cckri7tdOe5b/j5MGjXgK++TBfoBzxiY4ziJRW5yM0tk5GSCFd2CjxXbOjlRtZ+XpO/aE9AvqbhOPZZMoupl7pc4AMQvV847Z1jF9MpgP6pJHYZzeWt17qItH2kP6dspnnKmnrgC9RD9NYrwpRrUjyAoxzfJp/qACTRrE8Vwgxiku7yACiVxGr+JWfJtdwtvKBwgKIFlr9TOq3bDS6VBczklg9nOh8hc+WE6T21RvuDFAXoLwj29V5XoZDfntcl38/GNMQgBa8uEEvwDEmi0Pb2NY7cvu4zWIlezVsRSrBaOM0RQYkHQK4HcpYY4o/8rDpSNhxJViKXbGqaDluRe7yutlVVbam+eE8czwiVIK2GN4X//q7cNKapNmfgICckJZ7d6XYK8pNYduCR/hrfUBYNpm
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(61400799027)(13003099007)(56012099003)(16102099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qzEH5PQvGmmC9hXOqHE/XaxvrdYygQNi3pLjAJpWSAIcTTAHWRUJgeaQg0afaEX9QsPokcxPQua7ier9QjlximI//+3he5yBO8iHKCmE32tVV50SSMLXIhetdj3E/KaFA011Ra+Z/PUzK0rOivpZIWBk2QfmF7ZLx5LNPEYI2u65UX7o3dVpQ+VbBQIwGJmMKQRtxOdGOknWpG3AWk55vMYl+teAY4LxyU3QttcOXFLigCYXHFCe8lAr0ZW1FjolLiJL/tSkjUtXYFqm509QbawHnJbUOSBgHxLaHPne1W2WNhJqpw00Uh5n9aIZwxiJg/klwF54D/pm3cKgjNyMkThuQQPM+Gky+YYdIiyiZ41wOUf5H1vgUd89EYs2EjMWzcJ29OaVFy0SM7u+jpt5HgUJqfzgbL7cBFtPkNk72BtQdSQrcBt2CqnsowSVAAWR
X-Exchange-RoutingPolicyChecked:
	Wq3Un6OSoetiryKXiK4D6YFggVl9+AqrAqAYgZUZ3XZw6SDBuYi6jSdZDWAEIjVh0ijp+F8mcCugfZUYNre5oRNz9fM+e6VPCmvMT+eh4Nh7H7Dbf0rJItVw69d6DUmXFxMPHJA5WCn+SoGdNgdEgLJwI7+411OIoh7U5rSQz+ofitqX/4MRuMIPmsr/NUinSO16HStB1LBGNbE81O73Ki/mMj/hAH/BuCoMbOTw5U2JXS0iGbrDOwQhGR8BORjsWZKKqwzEBKQ8idJIDlU7CaWvJ7lj3DjV7EuUCjsbXkWpQxTdAqPxgNNbg2sxwpGWHboOPMts/MXY/ZnflL6bww==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 11:48:57.6546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd27e604-d815-4d9c-8da1-08deb7f81bce
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9303
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExOCBTYWx0ZWRfX2Hiyyisye7zf
 TqvcAfYhZRrA5lw9qc942wxd46QEpT1GdxHAVnK9IJwSKrQMGP7QcAePv7IJPD5aD9lX254Xn8x
 r4APl0j8kmR8wtCiIZXr4TW/g25eUJTQIYYhsYRUH6W2roMHP1jG5FNdzvHU3JxV0hiAyxy38Ls
 KfJfPgRppXTI/Z7cZzEut88ftIF5V1zl7L8Rz/ha2G6Cbx0Sqeyoq9d6ybxP4pBTkVdoiwdLQ6T
 Sg5PDVuKC/BrB4C52W3n1eY53EIIOxBHcpNCegV6NmexvCNPnichug9OTKH80sTCYuebXGs8C7K
 8YQqk081+EMdXHKBZMeocaI3ZdfazBAn7pHot37iUiJ88zZouJXal8rh4K6rEFNIVmFJ+XkXtiN
 FjxKaQoy0TBWrFyCXt1FfqYW9pISzPZMC9DobWPf3Jp4OC8i6R0j35TT+Z5FNpGAYLrNs1HoLZv
 T433SfnnAskC09qPEYw==
X-Proofpoint-GUID: fVmquBDnaK2tbOD6pvhxClQxCzZtyzxk
X-Authority-Analysis: v=2.4 cv=Wrgb99fv c=1 sm=1 tr=0 ts=6a1042af cx=c_pps
 a=nD9aSJBHEqN8PAJeTwPSCQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=FxRKdMWo-Rrf1ZYG25cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: fVmquBDnaK2tbOD6pvhxClQxCzZtyzxk
X-Proofpoint-Spam-Reason: safe

On 21/05/2026 2:34 pm, Cássio Gabriel wrote:
> cs35l56_hda_read_acpi() gets an allocated ACPI _SUB string from
> acpi_get_subsystem_id(). On success, that string is used to create the
> firmware system name.
> 
> Several error paths after the _SUB lookup can return without releasing
> the allocated string. This includes speaker ID lookup errors other than
> -ENOENT, and errors after a firmware system name has been allocated.
> 
> Use scoped cleanup for the temporary _SUB string and make
> cs35l56->system_name device-managed. This releases the temporary _SUB
> string on every error path and lets devres release the firmware system
> name on probe failure and device removal.
> 
> Fixes: 6f03b446cbae ("ALSA: hda: cs35l56: Add support for speaker id")
> Fixes: 40b1c2f9b299 ("ALSA: hda/cs35l56: Workaround bad dev-index on Lenovo Yoga Book 9i GenX")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Changes in v3:
> - Make cs35l56->system_name devm-managed.
> - Keep __free(kfree) only for the temporary ACPI _SUB string.
> - Remove the local cleanup-managed system_name variable.
> - Drop the probe-error cleanup patch; devres now owns system_name.
> - Remove the manual remove-time kfree for system_name.
> - Link to v2: https://patch.msgid.link/20260520-alsa-cs35l56-system-name-leak-v2-0-60f26c159023@gmail.com
> 
> Changes in v2:
> - Use __free(kfree) for the temporary ACPI _SUB string.
> - Keep the derived system name local until read_acpi() succeeds.
> - Transfer ownership with no_free_ptr() only on successful paths.
> - Link to v1: https://patch.msgid.link/20260520-alsa-cs35l56-system-name-leak-v1-0-d13b54423198@gmail.com
> ---
>   sound/hda/codecs/side-codecs/cs35l56_hda.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> index cdbc576569ef..8213d62ad74b 100644
> --- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
> +++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> @@ -1025,7 +1025,7 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
>   	u32 values[HDA_MAX_COMPONENTS];
>   	char hid_string[8];
>   	struct acpi_device *adev;
> -	const char *property, *sub;
> +	const char *property;
>   	int i, ret;
>   
>   	/*
> @@ -1047,7 +1047,8 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
>   	/* Initialize things that could be overwritten by a fixup */
>   	cs35l56->index = -1;
>   
> -	sub = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
> +	const char *sub __free(kfree) = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
> +
>   	ret = cs35l56_hda_apply_platform_fixups(cs35l56, sub, &id);
>   	if (ret)
>   		return ret;
> @@ -1095,15 +1096,16 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
>   		ret = cirrus_scodec_get_speaker_id(cs35l56->base.dev, cs35l56->index,
>   						   cs35l56->num_amps, -1);
>   		if (ret == -ENOENT) {
> -			cs35l56->system_name = sub;
> +			cs35l56->system_name = devm_kstrdup(cs35l56->base.dev, sub, GFP_KERNEL);
>   		} else if (ret >= 0) {
> -			cs35l56->system_name = kasprintf(GFP_KERNEL, "%s-spkid%d", sub, ret);
> -			kfree(sub);
> -			if (!cs35l56->system_name)
> -				return -ENOMEM;
> +			cs35l56->system_name = devm_kasprintf(cs35l56->base.dev, GFP_KERNEL,
> +							      "%s-spkid%d", sub, ret);
>   		} else {
>   			return ret;
>   		}
> +
> +		if (!cs35l56->system_name)
> +			return -ENOMEM;
>   	}
>   
>   	cs35l56->base.reset_gpio = devm_gpiod_get_index_optional(cs35l56->base.dev,
> @@ -1118,7 +1120,8 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
>   		 * line and reset all the amps
>   		 */
>   		if (ret != -EBUSY)
> -			return dev_err_probe(cs35l56->base.dev, ret, "Failed to get reset GPIO\n");
> +			return dev_err_probe(cs35l56->base.dev, ret,
> +					     "Failed to get reset GPIO\n");

Spurious change. Not related to system_name.

> 
>   		dev_info(cs35l56->base.dev, "Reset GPIO busy, assume shared reset\n");
>   		cs35l56->base.reset_gpio = NULL;
> @@ -1254,7 +1257,6 @@ void cs35l56_hda_remove(struct device *dev)
>   
>   	cs_dsp_remove(&cs35l56->cs_dsp);
>   
> -	kfree(cs35l56->system_name);
>   	pm_runtime_put_noidle(cs35l56->base.dev);
>   
>   	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
> 
> ---
> base-commit: 38c607c673155d6335591cdbd9c785fb2b7550e5
> change-id: 20260501-alsa-cs35l56-system-name-leak-7fd779eac391
> 
> Best regards,
> --
> Cássio Gabriel <cassiogabrielcontato@gmail.com>
> 

