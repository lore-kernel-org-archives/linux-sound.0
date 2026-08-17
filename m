Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0A03B27F9;
	Mon, 17 Aug 2026 19:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786995255; cv=fail; b=etDmvWm6qNSvFqeeySjXEiiUshcI3CsEkFIMZ6QIEUNHNzSfmPCOMEi7yqcua/NfjaLv8octUjjSggQskc77jhZmqjMFHrkYM4i6XSFOqWD9uwkvS9vC3p9RP7X/7N6201vBRU2yXUy2F5Exum8tpJxiJcouli8zKZNPNJWoOYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786995255; c=relaxed/simple;
	bh=mf7HeMamJy9EmRTLzoxHsUQivhP5Z4oA1u98bgPw3tI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkQV6WanHHSaB0GUDs5DNZh6TKYWtEfTmhfvFKHlhCOdntIfABDoVoEuCC/brKvZGFgMXWS9gnOSHb0o568LsFudFgFHcMz73BY9xXaca8MhJWhhS5pHc77FizOF9QQflA503c9rcV+hLj83B9P84HdBQ/ZiIBiL8dNflhbHUBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=L6kQ0piV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BqAqsyeI; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="L6kQ0piV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BqAqsyeI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFdKfr354626;
	Mon, 17 Aug 2026 14:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JCl7gZXZiI1d8CdT70nYTk7jG6gn+UDCeHBydWohoXg=; b=
	L6kQ0piVA3udi5n6iwily4/4UebYZydt2GmPj91crJqkvgWh7bixT7Ue9S7zjcWH
	8S+814qjr3YBicVpo83EH4YSeT4x0PqAwmlg2/d+Wl+EXWOOAecCgclyQVqGqbfF
	e2WOXC+6pk17oiZklIMAcfrk4XnfaS6I0mHMh0989Nx4/yLD3nXaPFlH4Pf80WRf
	Wyyvy9LscIhmbud8jt4mkuncQ7GPl152g+wGw49L+R0WdiwTCdT16cfsuCT7/avE
	atgoTnLpdy6C2/jlpKO6BtZV9goK1zT4xP43SwUP0giCalfP6ikeqQVACBv8TGa1
	jgs7Y1nvEZ1P/LXJCJ+uMQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021094.outbound.protection.outlook.com [52.101.57.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g2mhettdg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 14:33:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVbfuNYkJt88mIm9WlztTlim1rm8vS5MPuhYOuECvgruRzPdwjZ4nPJSprVjvK+RJx5i+8369aqnmJuaiUKRIfmtiDAd+v3rvK2zginJ8sBizG+76z1EDgta38xmHs718/9dByFTipxs58PD3QGfnXt8EX3c1F6WKieY70fahyAKvCWOYP2Z7rw8c21YlwCRiggFbtFXBUG5JWxlcYBwlWJvcQGWPRIP4hXZbVFXpxSu2MrtEQAYi46xUzC4bjngvhI2B8dkOc8Z5ozZ9CFJrijJLgkk6z/9OlRDbHB9J6He5ewU5etHCjrVlNvfsyxufT243Q4BCRaQZZsZmjhBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCl7gZXZiI1d8CdT70nYTk7jG6gn+UDCeHBydWohoXg=;
 b=tb77hzjDwGCDI+q+4j7zctA4PyzqCmd8j3p1LfDOehXIsrQ1AhGaztI3KoM7t2LFNRhBZHm3yPMcpxfSyFf9MF/7PJbCCDfgTx2vtwih6lUKUhULjJ5IHIP69qtvHbyH2O+VKrYFyuMnv2ywyQqxvXO4vScXZL2lE+/7pKxEf0IHc5XWuRT/3Zt2tsKTjusl5fioZKPZ1xejp6fZ3yNOzttyKu1K4XO+qLBDvbZ6qXk2uKTPXU80/ajPYIeldRbLV5sIHORuRLG88Ugr43WiMb48ERaHDw6qUDZ7O4WvoktfeOAsaFrcj8GTnEOPvP9Nx+N8rtMsWIXjnBIoFpWC2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCl7gZXZiI1d8CdT70nYTk7jG6gn+UDCeHBydWohoXg=;
 b=BqAqsyeI84y/IxLEtziuPS54/0/aGEdzewWPoNnY3jH3Ak6kHo0rEFZHNfDXoNfIuQazujsjd3zdoX/ipVXQh9ROyVp9rvaWUe3EGREHFYvUzNWJTGnk8CMzv9kmhBMFZAX/reI0x6xizeSvTb/4npva2CIl6mc9IAyRaaV1f14=
Received: from DS7PR03CA0091.namprd03.prod.outlook.com (2603:10b6:5:3b7::6) by
 SN4PR19MB5343.namprd19.prod.outlook.com (2603:10b6:806:1ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 19:33:53 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::88) by DS7PR03CA0091.outlook.office365.com
 (2603:10b6:5:3b7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 19:33:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 19:33:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4328B406540;
	Mon, 17 Aug 2026 19:33:50 +0000 (UTC)
Received: from [141.131.156.116] (unknown [141.131.156.116])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 81A3D820247;
	Mon, 17 Aug 2026 19:33:48 +0000 (UTC)
Message-ID: <d9761554-06fb-4dcd-8711-81080ff8951e@opensource.cirrus.com>
Date: Mon, 17 Aug 2026 14:33:47 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: cs35l45: Adds support for SYNC bus
To: Mark Brown <broonie@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
 <20260814223456.611160-2-rriveram@opensource.cirrus.com>
 <0d322627-7a01-4cfe-b09f-368f6b81f322@sirena.org.uk>
Content-Language: en-US
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
In-Reply-To: <0d322627-7a01-4cfe-b09f-368f6b81f322@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|SN4PR19MB5343:EE_
X-MS-Office365-Filtering-Correlation-Id: c35dee06-f6ee-41d4-07a3-08defc9677fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|23010399003|82310400026|376014|7416014|56012099006|10067099003|16102099003|22082099003|18002099003|4143699003|11063799006|4076005;
X-Microsoft-Antispam-Message-Info:
	CPfQewndP6QqDOcKq0uMkdW7btkhn9fdn6xjlNoqNVIbWJqGadE2uAB3dnbIvWmp3VrrYeDfBZLoHjVLN6+087tW+jf/pua6pWZ4IR3/1x33KiqUp4r5eGEcyTrMJbfiFwEx/Cfbfj8bIhOEqxjQw2LDqoJxTUMJbnJfBM5ZxBVllbQ+HMbGBd9TEo58s4i55tQGOujE2NiI/Kd0Q1quaNZ22mHZpalzRaD66C1dvI0DNqtKOdncxTpRk/u4L912atLD12A/GhiLalFKb+8f1g1PxnbU6WpI8zgprZ9qwMIRdAcwlcZwBU4HJRHfxDJsgFtHjuQeW6oHh/JWtasdgYS4YVkw65ELblywQQQDCZyx/FWd73Zsf+t8WZagSKhctDJbMKU4jPRUSj2LNrkMheeDLwStwpYkmAySAkI0S2lSnVOg+3yLS4R0pwV6dxLCHKqhKOWFydgGMw12PJeVLpPibnJXBGx5hVHdhnHjOoSL5XypDECRA9NvchABjbsScd5LscwbGalsPs9ru/3UWmRUEGhIDUlEunHulxNzijzKfkxK7CWNM1CAlON6yF6yYRlJxPhagK5fo3J3pRy2YsnZC3bfORWtZ6ggTsU1JDB1N3yAyjew/HB6GfhLxAbWeH/gvLgFdtfM/qjtojpRjYNmw+WOjTIcNVNJFY9mw40A7GoBWSXA2sV7eUhEY1n1pi/2JOVjUYlCiCM1CGsZEOVuDxyDFM1CvUNCYyJ5FFGJn3TvIa2lAzvYkqbVVaZH
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(23010399003)(82310400026)(376014)(7416014)(56012099006)(10067099003)(16102099003)(22082099003)(18002099003)(4143699003)(11063799006)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TyXF03rHvGGeh4GgCsvwzk5j89UIknLZfV4luvoF4CjWGI3UYt29Tcvsw563T/Y3A72SWPdknLIHMwSUzpR7KH9RBja9UYzus7Fc3VgPsCdHpr+MurkdPPb+pfy2H152gmR6P2ZhRb8cfcW814U69n2i/SE+mmqz3wDJTvSB27GDn0clHuzfHMyUNbW1EV3bOv/H4rkxRmH0sAuPV+FYeaXA8r6w/l2xOvwjPcNTYh/wL6oBkoTDe1dBlL6p8NLjd/m3titrkD4s9pRLH+FGYmpA9AqgR1sSo32MqRNmiaMt/nm5w+UIMS9xKYg559cAVrTdypt+UZk0HO2mhkdVCdGhSmWwYBR9AVsNiKCaux8yZCuFr3xlkCdrp2DLdHFNRZvU0y9/7/xp5+54n3r9IKyHf0TbznUtxRauiDvnv7IOoPVV9T50v6bQXLioR3OO
X-Exchange-RoutingPolicyChecked:
	qw+1lqx7NJEThdazpnlb3oqlSnhoifFwdjKJPwegFtRyzWWVP9vPbTlrROkTRNWydCJodMXiXWq8ZozRVoR3HuxXx4w9c0LBv5siAyFMtkhnbFwMlsG9MfkwhZIJwKmsg8ufv86OFRzQpsrE6PZoD48+5uTBc/F5ACqk3cV4s8YG9SRSONDj0r044ueFH1ymCjM/II2kMFvR0+ZLT+B7ts2b0DRwQH4F3ggeaLvsNTxpT5KyYi2o8yz0iOrVyz3+ETvrgw6T1Mj1B2iQkuOjNk50k54E1Ce2paWKkS1rAKg2k2hUuGvdIFzkT8tz3REyB1yNgOdNpoY4TRS0AokllA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 19:33:51.8811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c35dee06-f6ee-41d4-07a3-08defc9677fd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB5343
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE0OSBTYWx0ZWRfXwlp8VGs4qsXP
 kQxmVTrRZ+hIx9VREX0kVGkFzX+uGbHV9Nr2BpO9A3gHOs8PAirgUVd4h8HH9IDHlwopJxMZUtc
 jhIX/LGGH/C0FVpsLGsoMclnWqiEBgCtAfRdSY+mLKWNUfnj682LeQpqt9flDXpsisoOS3i73HV
 nYoEvmXtVgF1RsXXjo/d6CaF7g+SP7eMW7fmfAJD5kqdYnEwqCo9kf2BlY7CBVW6t8z15/QtMQP
 W/0tAr7wCWYwjJS3l7gBgztjaR7lXfnKK7frVTOzTKo1BKEMk/ctxlp9DmFKNi+AFMCrmlR46Mq
 s4MqwykcdYy4hCH2wjKW92kZ127VoFkAr8T7Mzt72YmTuqXM+Odzb84EvTrJwurxNcNjsDZU59O
 frBhJykVusy3EklbU6Lkhk70uoFiPtbtl8l7lmTnsT1aEeDo8yLjTigAoAVzIJ8NRYdT3RdB2j4
 dxeqNo5oGjkVYd9MWNA==
X-Proofpoint-GUID: G3hx3ypBE4hKMrwn8KZM43g7CvbAI8bJ
X-Proofpoint-ORIG-GUID: G3hx3ypBE4hKMrwn8KZM43g7CvbAI8bJ
X-Authority-Analysis: v=2.4 cv=FLMrAeos c=1 sm=1 tr=0 ts=6a836224 cx=c_pps
 a=0WOB02Oqeq4Pc9Acia+LIg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=2lUcfileCgnrionvnSsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE0OSBTYWx0ZWRfX7ETwHMja8wZR
 DVL5y3aRUlzgB6BJqsSfxP7rBqo0pF++As1Ji+G92kp0bml2GunMQu7PANNl9Sgm6rKD0cxA2PT
 syAo6fjeyXR0APORJHo916h98mNnxhg=
X-Proofpoint-Spam-Reason: safe



On 8/17/26 12:37 PM, Mark Brown wrote:
> On Fri, Aug 14, 2026 at 10:34:53PM +0000, Ricardo Rivera-Matos wrote:
> 
>> +static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
>> +				      struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component =
>> +			snd_soc_kcontrol_component(kcontrol);
> 
> $ git grep snd_soc_kcontrol_component asoc/for-next
> $

Ack.

> 
>> +	struct cs35l45_private *cs35l45 =
>> +			snd_soc_component_get_drvdata(component);
>> +
>> +	if (!cs35l45->sync_pin_set)
>> +		return -EPERM;
> 
> This will result in an unwriteable control on any system which does not
> specify a sync pin which is just going to confuse things (eg, does
> mixer-test think the control is writable?).  It would be better to only
> register the control if it's valid.

Sounds like a much better way to go about it. I'll add a 
snd_soc_add_component_controls call in cs35l45_component_probe to add 
the sync controls to the component.
