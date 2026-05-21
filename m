Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB583C8192;
	Thu, 21 May 2026 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365696; cv=fail; b=ONGeOvQIOIMwRDmtVsc16UDBjbgedS//F2hvwZHJjxl8i/BtsAVtq2Y69J/g/GtVi5lkwltQAm4rv5DtSuU5KvP4ibZCxqhO10xpWej42eSDPdZD7/C07GJ5Rfhlcbda45Nk6FiczQoWRL2AK6C8qj9v2/K3F0Avbn5jasU1dGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365696; c=relaxed/simple;
	bh=m2L7cR47Z35+lZTeom+wZMOh0rHi1y+KEHmANvfcnAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvvVBVo8CbPHo6lbEoW4KU4nGHvVXUPo7XmSFfr8WuM0j2tPSIyuFOxQknp7Qj7QAjFtOg9TYPbKYv7RjKFcmiEKXn6yIsrPGUkSmWn4IxWEjxvT5nYSC7nKJELDAfC8lw5GxLULyFcG4X5+E+Hrkc35WdCKEjETl3vRJhaZ2Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mFzneJVI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=U5L1F8VF; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mFzneJVI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="U5L1F8VF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L3qltU2717405;
	Thu, 21 May 2026 07:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=kOe8M2KXtiCC/kZIar6UKR/TQyI/uN1PP33YFWNSUYE=; b=
	mFzneJVIL5jDIshts0de2qbHGh9BNEsRLaOj77lIJI36iApNSReDeGnR+9IrFDr8
	Vy0Is5Y0CV6Q3h4wQYprZ9A9siYxSEP7vn3RIVmzaUIhfOKJQO4/Sb+3O/zKqKH0
	ttd8QOTAs/gun4a6L300aBiTya+AMg3WExpo8F0RfJHfam9nvqjduigarIJOSe1U
	bHzj7Kan7rvDx2mK5OlGI41soD9/QVRRxMVnejpTJmeC9tjOm91LNLyAQsUYGYkp
	0XkfhKHtDuy/8EWBl1TCjNeAuAl4pUmH3Y85yP5xIUUylsTCvvV/B3sii6xp+/qF
	vD0SLt+SgqUFDQix/GiI+Q==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023126.outbound.protection.outlook.com [40.93.196.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e93g1jbbv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 07:14:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODpR1MOloHY/mG3ZMSovmzvmVgq1Hqo2HUaJ/YPfHOLfIYbU5ssfPPdnwStEJzx0hjghHS49FId9g3+/IbVhX5EIeRWfdz1QFSjymZufav9VnaH1GZe0sOBaEjks8nO4qCL0DKvKx4KCFThKr6etXvMsokQRcKtPuBkF9R6XMCl3n6fre7qyDkzAbaZYoCdfH8qt697fjvCmkPs4WoIExkCc6JciVXOlbjy91ajCVlxohhgfULinmIV11v2mtIhBEkBhS5V+64Lpu4mqBPLcjHTERg9izx+MfgGUXwKKBVtmFM4Jk6brndj9rjnfTdM0dVZxmvNLa/XcOYyvS2SD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOe8M2KXtiCC/kZIar6UKR/TQyI/uN1PP33YFWNSUYE=;
 b=s3rVKsI0W87hAHk799RncubyBG/Rg2U8bIlNBjsWKDWxIPV6zAZWOx7a79sO0/kavyWiAidiuQqs/N5lCW3DQhFxiA/a698BugI8IcKTcqdHWY6vcDNIehQL1zmY3+B09iyTscNxEZJBKLj7sAVnZZ+jHQKtngklnrZf3e0P8MK5ex/sq++P5NI+gnz6H5fEbrfxySso495upUoiTWJCjprCzz23FMhM7rOFX6T4iSd0SdXKfQbjOoKNNEfbzzAKMCh8VYPzRgW9laX4M5VMn3/JgjHGPOt3/Mm9T+K46+CcPGqAWMfwpbFz7p++pMhPyyS24U0d2fWMjvyhztiLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOe8M2KXtiCC/kZIar6UKR/TQyI/uN1PP33YFWNSUYE=;
 b=U5L1F8VFfFb4+K3Kb+7cozV5IQHsqtT1JfV3rdGWI9r/eH6GsecK4Vdn/6eJNJ3pQ+qBAXr4HmdqBKnPT/ElbTOqQUwbClJcZcQimNPz7HKJ05t9J968TUo0Uls5rMucCGXneyiT30XCirWehAnGxF/7wa46xIEhmaeksRO3f1w=
Received: from SJ0PR05CA0040.namprd05.prod.outlook.com (2603:10b6:a03:33f::15)
 by SJ0PR19MB5490.namprd19.prod.outlook.com (2603:10b6:a03:424::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Thu, 21 May
 2026 12:14:37 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::9a) by SJ0PR05CA0040.outlook.office365.com
 (2603:10b6:a03:33f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.6 via Frontend Transport; Thu, 21
 May 2026 12:14:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 12:14:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D7193406540;
	Thu, 21 May 2026 12:14:34 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C6C0A820244;
	Thu, 21 May 2026 12:14:34 +0000 (UTC)
Message-ID: <243581c7-8b17-4415-bd8b-bc8fc4560f1f@opensource.cirrus.com>
Date: Thu, 21 May 2026 13:14:34 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ALSA: hda: cs35l56: Free ACPI _SUB string on
 errors
To: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260520-alsa-cs35l56-system-name-leak-v2-0-60f26c159023@gmail.com>
 <20260520-alsa-cs35l56-system-name-leak-v2-1-60f26c159023@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260520-alsa-cs35l56-system-name-leak-v2-1-60f26c159023@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|SJ0PR19MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: cfabf635-fa05-464f-bbe5-08deb73286dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|82310400026|4143699003|16102099003|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	6XStwrhraYVsRdMa0InVKLAuIGvF84uMT1skdqnseqrgrebUFD7yOZklHLs3fUCpKCBdmvtWlMZiCb03wE4Y/5pTmQYngvagHSI4zQFVdV9f+5eqpCmNxP4dEwlseBAXo8iiBQ4ooV4wPmVOTa//aGaBxsKQhwKsLM+TtYvlE9haQtH0jvwuefweYVf1bK/6D21QpwSbWP2ACAQ//HEXhAYYZHhB7WM0xMmjpJ+Nsz33bZXTsRLcvKjCoNOBjrdhFg4Brb9OVCBmz44HiOG1X0KJFKFWVeGUvW7Cfprmf6KMBb2cQfzA60knIkTYM9+OEoeU7H5IlPxikkTRfrkCK7kiZbheKl9n6YW2uH/bhMuJlws1LfYh6QKjlQ4IvyxA7lTbPC1p+YYF+h8TudZRXrXCubGjDvZOVoF36RmNZXwdXZ1Qb52026AbTKWn92ioX6AqzSBt2h4NuEegCs609NL3XtvR6a1iZ7lGjiS0dIQT01uDLo1Obz20403wkRyOS1bALOsgqddn0+5lkzPSWSbQpB7jvCxjluOTiJxGDPofVP48nIJj1uVxGF4K6elD3pzefUvNgR2aeRYyLvnHfcrmyXLpPanskswiIPS0vH+cY54JnQ3QUU8ObVJ6257ZU8NvtBrlX8E25G1Krugzgi4c6pbM0rHRdLOW5LUpjYjKKJvoWfDQTieGB1Dcb5rK/jwBoifNaSl5zMRhxeuWpEU2yfeFv1Ih8OhZl/bgFWI=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(82310400026)(4143699003)(16102099003)(22082099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0jtCGz7MxU8IG2P9PbnXZduR3gQHFT1f5iWsVoZArbAmSUfoTZuVzc0FBefxlk6/fAGIhbGHdiTAJ5YWnX8petW6++2A57V0wBoHWLBdoJxu/0V0M59vHsj6FPMnvbxfetHq+UAlJTl124zkVFgGd2Unb9ALSBKF+4WKULJCPrh2M7NMDz2V24WfiJBs8xpxpXwNYRd9Q6Kys3S16o+A0U1pDRFgftNtA38flX0raNKI7GHeg77kPN/at092NyvK1XRY1Bd0xLyIPttYNlqpGvKn4W8D4PyDqi7FTHXDk/DjFJVEMnqh0TUFUr9QaaSCh2LOic1t1O4p4BgN30EC4iSU1ANSJJLsapkR8bREksej6vy3EYul/XQG0VvPZL+47ohN/Ai4l999D9VkU61jpCYMa6HjKFokDcIInJwJRSQhncxYL3r0EJ71RQCOskrS
X-Exchange-RoutingPolicyChecked:
	AUlbD/u50jz/38T9linBOQ6IFF/tWGnZJCkaK0Cb1vRIq7a2GeSoxEEGE/xwG7Js3SxMLlIPg7w6cfukD9quacGRFf5H4NuiTIiR7oSRFbmdMmnVxoUrJOd/I9CU9HgSe2AGhUgd8NPcBb+GVeBVwiv2aBUXv017rV6uZQ9FC88Xf+WXJN1QUMy/bmwrgTso7bf3fUnoFjD2/AIF7GPYvi+ImlFbowUD3shy+iXtRe/ZXkNfvoOg+X3L27UHzKR4PtOUhH7TB/39WFHb3vJ7Bp519/yAm5tqTHpGWMNt6VMF8W9KZXp4kPq8HgkPsx0x43vANHHewtLuM6lDlPZD4g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:14:36.8780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfabf635-fa05-464f-bbe5-08deb73286dc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5490
X-Proofpoint-ORIG-GUID: 6YjP1zG4Uqz1hCswGDu6Zlnoafqv5dkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMiBTYWx0ZWRfX/CYgjYqf0rLY
 lYjZumtU3zfXF7HEnC7ZGwYLwZrxZhV5PvrnzbFRqH3obRjzNVX+bxegbp/oBTb9MGWSx6qgFXM
 7vyYNIjs/OjCuioissHXps2MNCdL7WQwE9NS5yJKjKfs6iOXHi6mc4U83Y7tJFvw3EodQ5siO4+
 YQy6NTjkeO9uZdIsUMjHkGDHx0dXqgG6bvS378DAv2yyPs0+PB22SYjxOeMMER7Sc6ddHGuGj03
 gHq8qRrrvw0RN29D/+ZMV7UGtgE6pwnxjTiOKjd+Kvg+BgadL6OgazTfecM6MpRsH8jbSusyDas
 m4Cae+A8J8wQfGd2iwLJMeyT/n0ct5kPc5TE7TWxKQ2P6rHrNDJWz/5NHgIZ0U3vuRTRY6Xovp5
 j3O/CXK/g05cmQNCRoHgzRN8qqA2GMOTJfU+cyilWS4B+tyHm7D33mxP0Xun46k3H/gg9zYKNwB
 /Pxe+FK0FPIYI1PxRzA==
X-Authority-Analysis: v=2.4 cv=Wrcb99fv c=1 sm=1 tr=0 ts=6a0ef733 cx=c_pps
 a=y8YxP5mruHbmkpqRckQjqQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=UFODGii6665CmO2oU3MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 6YjP1zG4Uqz1hCswGDu6Zlnoafqv5dkg
X-Proofpoint-Spam-Reason: safe

On 20/05/2026 3:50 pm, Cássio Gabriel wrote:
> cs35l56_hda_read_acpi() gets an allocated ACPI _SUB string from
> acpi_get_subsystem_id(). On success, that string is either used directly
> as the firmware system name or used to construct a speaker-ID-specific
> firmware system name.
> 
> Several error paths after the _SUB lookup can return without releasing
> the allocated string. This includes speaker ID lookup errors other than
> -ENOENT, and errors after a firmware system name has been derived but
> before ownership is transferred to cs35l56->system_name.
> 
> Use scoped cleanup for the temporary _SUB string and the derived system
> name, and transfer ownership to cs35l56->system_name only after the
> remaining failure paths in cs35l56_hda_read_acpi() have completed.
> 
> Fixes: 6f03b446cbae ("ALSA: hda: cs35l56: Add support for speaker id")
> Fixes: 40b1c2f9b299 ("ALSA: hda/cs35l56: Workaround bad dev-index on Lenovo Yoga Book 9i GenX")
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
>   sound/hda/codecs/side-codecs/cs35l56_hda.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> index cdbc576569ef..7c9c98436757 100644
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
> @@ -1047,7 +1047,9 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
>   	/* Initialize things that could be overwritten by a fixup */
>   	cs35l56->index = -1;
>   
> -	sub = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
> +	const char *sub __free(kfree) = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
> +	const char *system_name __free(kfree) = NULL;
> +

Initializing a __free(kfree) to NULL is controversial. The kerneldoc
warns against it. Though I think your code is totally fine it might be
best to avoid.

I can't see any reason why we didn't use devm cleanup for
cs35l56->system_name.

So

    		if (ret == -ENOENT) {
			cs35l56->system_name = devm_kstrdup(dev, sub,
GFP_KERNEL);
   		} else if (ret >= 0) {
			cs35l56->system_name = devm_kasprintf(dev, ...);
			...


and delete the manual kfree(cs35l56->system_name) in
cs35l56_hda_remove().

>   	ret = cs35l56_hda_apply_platform_fixups(cs35l56, sub, &id);
>   	if (ret)
>   		return ret;
> @@ -1095,11 +1097,10 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
>   		ret = cirrus_scodec_get_speaker_id(cs35l56->base.dev, cs35l56->index,
>   						   cs35l56->num_amps, -1);
>   		if (ret == -ENOENT) {
> -			cs35l56->system_name = sub;
> +			system_name = no_free_ptr(sub);
>   		} else if (ret >= 0) {
> -			cs35l56->system_name = kasprintf(GFP_KERNEL, "%s-spkid%d", sub, ret);
> -			kfree(sub);
> -			if (!cs35l56->system_name)
> +			system_name = kasprintf(GFP_KERNEL, "%s-spkid%d", sub, ret);
> +			if (!system_name)
>   				return -ENOMEM;
>   		} else {
>   			return ret;
> @@ -1118,12 +1119,14 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
>   		 * line and reset all the amps
>   		 */
>   		if (ret != -EBUSY)
> -			return dev_err_probe(cs35l56->base.dev, ret, "Failed to get reset GPIO\n");
> +			return dev_err_probe(cs35l56->base.dev, ret,
> +					     "Failed to get reset GPIO\n");
>   
>   		dev_info(cs35l56->base.dev, "Reset GPIO busy, assume shared reset\n");
>   		cs35l56->base.reset_gpio = NULL;
>   	}
>   
> +	cs35l56->system_name = no_free_ptr(system_name);
>   	return 0;
>   
>   err:
> 

