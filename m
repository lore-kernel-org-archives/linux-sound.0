Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843C9394464;
	Fri, 22 May 2026 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455595; cv=fail; b=UIqzOPI00goaI6mnTO/ScTTvknZZY38tHh8xdfbkioboaaDaZ/hmN77exM8wKhOOIg2I2rRaoAUtO7D39JyHj/a3OUsX/QJCfrNtRplgJ4EqePiN0+7Ll7Clfg5DRKsE1oroemR4jEoy4uUi7q1l8udl4KfzXvLNqG63y4HKxzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455595; c=relaxed/simple;
	bh=Src0MlKfiOgqsd779ejGmQSAjYgeu44+Tm/zu5ey4HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qC9PWkm7/cRn/g/mwTcimSuR9X38ce8agTzbWaebxhsOxLajvXa4I8OPGjahOo8pRyPEI1Fwt5xiCdKxNKCPesv1Yh6n87dRxIC72PF0KZlmQtXODdfcPBXmCFq1/s/78VbdzS7pvgAAYLVh4sgXGmZsxgOIYYl3P/B+VxxYpco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qmEJOdFl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cJbKdxUd; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qmEJOdFl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cJbKdxUd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MCINmw1573848;
	Fri, 22 May 2026 08:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=IoJPDDVeJceTH/9t0vYCy7FyYOgajWpf2dEXQQmyl9Q=; b=
	qmEJOdFlOCUr42K3Yn3eHpzI/UJrdQgNrFoTDa2cB0HlqhboEJQK+70c2dQtVawH
	GaSZfsM3VC2CH/NyyJd27dXicbn081DDQOdFIt7Tyi4X6YS6vny7voiux/ag8CDg
	htwP/qERpHwmKqRFbLDQhY9puUpMgr8ScuQkjiwOO5p5GCR3QGwxMArI8nst5gmT
	U7Fb23ssr10Zi4EEjNW+jM7gg0THr2l4mD7/VAZCGTtsI1qpwSEeYyZCH9hSKePf
	mRT8WXQRZp0O/PY2E0wmp1rhkw0krkcDnPs9/VtNVKs7PE7zF4TK0zlFg/MoaIhT
	SWq93JpvRy3WCO2JYsxrUQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020100.outbound.protection.outlook.com [40.93.198.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e93xckxt1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 22 May 2026 08:13:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOjaciPpFEC32aK7vm8PhDzHth3c9iWCCBz0xwdd8oX91/T+jfLEjBnqv3cvKdqVnNyfrPZJw1/W8Q++KB6i6/qdSJz4FH+q393eFFMPU/PVJzsu6igLpOZnucNR+QdDzMPGaZMZmCnE4OQebsGmMHJJvMGtJsc94PJqN4aCM1ln1EhD1CWVJaxl3x0ZoS9bZP+htztWhCbEE5hfKX4w1THWKgtlpIRTTm0LC2LJCQNeIrah7R16v6AUbMSvceswT2oAvIP/yeiWozDnI7lIPIjz0ET2XcfHeB7DKldF6BJasfKe56J0Z8xkBB/zFuJ70ju21tD38tGUipqog7bHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoJPDDVeJceTH/9t0vYCy7FyYOgajWpf2dEXQQmyl9Q=;
 b=cKVeQxk+CuWNeKbldwwc1zhQprDVMQA18QG444qvGGaAbWObJVBzfzVd54pRxbEF2x/8ephRet/tdmfZgCreKFyn4EePKlgswygDkgY2xoj/gsAv7ETQ+PuRzBWUJyGOPIOiXigmyv2Q89MHjcbPB130BXJ3S6s/OWyupBBXx6Y5Jqmfw5osZKfSD45H2w5PNrmhacMhFj3Z9unYYxoARdn3cQGeOGz/YnZeQH4cuXW39xnV9E8YDJ3RB00wkLy5yg51QnCCV3tQQtRrginxySnsNwtlzezBROLNdkVnw1hY7bCPm483LuSMrg8ERQvqoQB92q7hdjKoCCoU5gNuyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoJPDDVeJceTH/9t0vYCy7FyYOgajWpf2dEXQQmyl9Q=;
 b=cJbKdxUdXRgEjVL+BqNCCyxBsGf4FPQ8ZOHQaaJDM+WwRbcH1CSsfnoB4VHK4uA5MyMVH5eL6BI2AkDXZYK0abs0FGS6/fzbkYqz6hKSupbjOzTTOMyJg1fPPEw46kiGgLnVgZHsuaikI69gYkJGMDbNh0rohnKcEgHfKwLY3no=
Received: from DM6PR11CA0022.namprd11.prod.outlook.com (2603:10b6:5:190::35)
 by CY8PR19MB7252.namprd19.prod.outlook.com (2603:10b6:930:9b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 13:12:57 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::53) by DM6PR11CA0022.outlook.office365.com
 (2603:10b6:5:190::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 13:12:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 13:12:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E1DDC406544;
	Fri, 22 May 2026 13:12:54 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DD4B2820244;
	Fri, 22 May 2026 13:12:54 +0000 (UTC)
Message-ID: <5dc15f63-b515-4205-946e-05fd8f80b1d7@opensource.cirrus.com>
Date: Fri, 22 May 2026 14:12:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ALSA: hda: cs35l56: Fix system name string leaks
To: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260522-alsa-cs35l56-system-name-leak-v4-1-a6154dd09cd9@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260522-alsa-cs35l56-system-name-leak-v4-1-a6154dd09cd9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|CY8PR19MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 6298ae21-c213-4562-23dc-08deb803d715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|11063799006|56012099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	XMkHJLtaLqxr5742PIuabGPXPQvTuLs/SisUhXo4Jz9ZFJhCH9j/scyFOVOwqcCzRTqQOYLn9UXeSy9AS+0dKPJ0JcKUlZS0ri6c4rhoIeJdkad3KcKbGXlqF3QH5F1OPWB4Vkb2qVr8EhgPxN1eg7JIGiO0MIBHePtMw54Fvg2m9Yg5ChKCr8aJoC1eBM8BRmxkj6c9OaPxF0LYaP48RTa4lLWhiGt2Lzzys2BUuzIlK+Edrt3w5S4ao/N+JkGCBlTqiddD5r+QaCqcotpFd91E7YiRwYspjKa2TMPjPd3rlCAEepN1KLqd1kb4ilaKqAxwEOO6a/d76rXmqhBsxJZ+WtiXh9QVeq7EghLrjxBOJaM02TsLp74kYMIrC34W4bGbkyAfytQwy0Xd1BlMJ+y9I0jHzQ7640li8bh1yytUqjj5dV4Jgc5bIX4edq7vUlj3dAOK+/ZjU5aWTLCCiECyYgyzfQLTgrkqUGQ4aSdCy0KiZ4skuMN/0PV2XkLGFJDBWK885DkCrJlyErP4bXIvII+EoizOQ8ETUq5fvzrtsv+SGsTVvxsWDq/546kl88V1ExJiBEL3EFhon6Jbhf3yMhtE0QmfL4+dFJQY4+rl2bTByU/tSSNMOANdeZ4wkNJobQnFBSMDrCtmv5Ff3rJg7jxiwbzsqPrtN/H/AstfvDk0Mnc9diq7imMIonJv
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(11063799006)(56012099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0quac1NU1V+i0QqeJTNz0rEiNr4ykilnG/PhQ4cGAUydNx+XQsgyTFf4QP7N3t4f60f3Gl6Mf7ujTqnFfDpFr1PWR5ahI/yRsCvUpV9mfQvZJttBAmnABqMvxXBnImOa4T+S9KhD6iqu6xzWOGg0607tAX3NiUnuE9ssmVe6OHF5DHLNWyW2ezcpHOXGQDN5ErRgXr7mXQRdTn3FlusfNKpqHe8Qv871CM79EshYUW2N1f1OrenTpGU6h6ja89QmC5keFLbk1vNqIA0AOB2XdNEwkd8MkD3KgxpwuCPEYgM5U/f0qATCm5GystYTx1r/E96KN5SyU9p79WTXC6a+Uhcm2hqWiASKNe3D1SOZa9dAm6cQn1R6A7gIlNRTS8DEPvDMCAsnnACfes+WtqAj0Z5LzKY2OnzGuBrc/dsykFoGJC2przYCCK2ELaHgznAS
X-Exchange-RoutingPolicyChecked:
	hen9KT4Xso5CvAGv8b/74Xvr4UP3Br9/0VHPpWBMtzUy6uu6AifJS5y7IyysLOkev3zamgRUVGlGg2j5G4iQy9aYa1Kk+LCnrDYdvv9LwFs6wPzIShBRmHt7nXVTINCAcX/wrzeUEXT6FL1oxXUlGvf2jP4G9FRn/veaN908jDKnixnLNfah1hf1I+14+xP9Wgp9bqwNLF/mB2Wfbd8h4eu1qkzZF2EJbHWDkiYJRFAmFPlSKTR4AqCy7NFCt3L+tGBQMppjXB7HeDZrpbqCrpOujHX68JlQM4bHFuuw/zTq80iF+RSLV/8dswH60sgNhclwHkzk2bXPW6jLM+3TxA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 13:12:56.3245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6298ae21-c213-4562-23dc-08deb803d715
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7252
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMSBTYWx0ZWRfX2aXKpVx2WNrW
 ltjUtN+vFk8E1cDvmEqLRmDOW7+gIliWyURKJauR3P4u/hHrHlHGB0/nR93rltiYZuS5UXWd8l8
 p4D5lH4NvjpVwlY+SRDJ/IfFJNdbd5l3uz42E4DAmfMdrJPtZ4sTS7KRg8/zMPba3NkFNthlGcX
 IAozVdQZU+DDNrHIZGE4xcWASBOGrq37gheMPaozHN5cpRfhbcH1XGqp6yf9xqR7CoY77R1lIPm
 XC+NdGzFi7msPHAV0ZnCjiuGM320WYle4qfIOS41/FB7nir0mU4nJB+pHBC0UP6NjgP+6HjpFuO
 qnb9BNtpcwl42fcH7vixNsC+1F80O1gzrNfws7VcqaJKz9ItZpbkyhfHFfKzPSXObDLCQCJvh1j
 cWICljjxvrbf3mqxDidA0AKTfYQI62JYYCt9/4pJRfFEUwJfqvjqeFwAJX7AmytTOTTrPE9aPiP
 M12NcXCnTks04TMAcXQ==
X-Proofpoint-GUID: PZHr5jWh8zCdV6WMA7pRsOQ1E3M_33S0
X-Authority-Analysis: v=2.4 cv=Wrgb99fv c=1 sm=1 tr=0 ts=6a105660 cx=c_pps
 a=rsLXg5VPEOJQy+C7BNxFIQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=FxRKdMWo-Rrf1ZYG25cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: PZHr5jWh8zCdV6WMA7pRsOQ1E3M_33S0
X-Proofpoint-Spam-Reason: safe

On 22/05/2026 1:49 pm, Cássio Gabriel wrote:
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
> Changes in v4:
> - Drop unrelated line-wrap change in reset GPIO error path.
> - Link to v3: https://patch.msgid.link/20260521-alsa-cs35l56-system-name-leak-v3-1-9dd4e2dcb473@gmail.com
> 
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
>   sound/hda/codecs/side-codecs/cs35l56_hda.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> index cdbc576569ef..a0ea08eb96a9 100644
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
> @@ -1254,7 +1256,6 @@ void cs35l56_hda_remove(struct device *dev)
>   
>   	cs_dsp_remove(&cs35l56->cs_dsp);
>   
> -	kfree(cs35l56->system_name);
>   	pm_runtime_put_noidle(cs35l56->base.dev);
>   
>   	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
> 
> ---
> base-commit: ef807cc07dec16edc7863d437e9250e20cb73741
> change-id: 20260501-alsa-cs35l56-system-name-leak-7fd779eac391
> 
> Best regards,
> --
> Cássio Gabriel <cassiogabrielcontato@gmail.com>
> 

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
