Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F09318B84
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769767589; cv=fail; b=cqSMli7zMv7v/Hvoml/PefBtw4d+zYrdowVjKsd0MN0/oMTHQvV8S6/Yr+D5NLJxnJyPidM0JQN3xBwkAAb15uU2dIQJtwx3Lu9gCrHZX/sKDE7A9hvQNoMK5/EIMOXvsOvrXFbHHyFdPMlq+VAA44vQ46QGeNCbGLPahISniJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769767589; c=relaxed/simple;
	bh=STF6o7v1/jCe4wVqPXYxuKYFj61XapxK7Y/ytaKleDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFRjmtKVg5AOhEi7ebkECpt8K1mWidCXmLG0rVb0SfOiFLAabLPBCET1XF9b7Ox4sxJa+lZ6fRMzb+4ZL+TK2wkc8VG//dSAL+TJ214+QzgI4ck0pmBJazscNmMvV6Wdoiqb6Wqtn5wI6DOwOeD0vdxMsxMaDVhcBHi3r/OgMIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=D7EVw9W1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DWzweDWK; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="D7EVw9W1";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DWzweDWK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U6vbGi3231261;
	Fri, 30 Jan 2026 04:06:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uYJlaFyiTunwmIeixk3rs70fkv5RbnKC0JVhbISxL/s=; b=
	D7EVw9W1sxakUUw52DFsQFvgBFeZnEGST79XKw4ouIqUcjAXapJaUsVNSqRcUloj
	nnCgABBDsL5HHHfoZIZ8VaQRbo2U0t5D/Z12c0b6ZAJoOJ8QXiYLV5xCquPTKwju
	9U2ZttnFEJ07BQUN5jIvrz3lSg67QwD7JJbv7SQRzPWfe/ltUUEDbJP5ylNnGTNE
	5Q+cIrS89bmRrYkChypsHsG7cYbJ4TpAMS3x7UR2/XvW4RoI/f0TtHlCJhIrRjnC
	6c8nlULwdWR6YvOnxJEn5UYkHEuuJZpPUtPtkaZw0/96pWo9JiY/jOcQHplJipqR
	1tomlpUkG77UmqwZ5pRecA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022099.outbound.protection.outlook.com [40.93.195.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bvvc06kh5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 04:06:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIY+tFHMiChYpQhBmKKnI3oE9FAtyaaAh1DUuzdiWs+qDhoJEGT6qw5uxKZ3+/xCLkk6HMNj8fJY9LQ1b8w+WMBtc7lHJRmGuB+2dLYvxRkcz5DgaxiNAxeYPDJq2oCDJF8bOLFEi0Q4PKRAHmd+EZdHJeQ9q9EdsxjF8/xoQo+FMD1td5Q/Ee08M03+K3CQ0B9a8o9bE39JrG9RroXZGzR3T1KSCaG4mzXwvZIwUidArCX0u1Z+RIguA3wIr4TAxZux9bDeHq3U+KWnXhNQn3GfJSBG+GiUJ1JUDxVfCfZCHsK/+g7X2d7MuP+a2Lfa9m5OpsdmR46C0kH3ffujKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYJlaFyiTunwmIeixk3rs70fkv5RbnKC0JVhbISxL/s=;
 b=GVsevEYztYGE74jAJ7tClwsJCAdrCg36u7edS1p8FJniBQW3TD282ebosjdRW2YB/tJIUy/vkPtEG6VRQAtyDAxprJ/hKqw99/DkAQYpeC0cncpvrbDl1CN4D251yFU+FQJ6RC3ArWMSJRn1ly8Ld2fQZXCReWh6XOzuQfHg17dPvsgmQnYWb5JaF5II/1YMPdH5MNzhztCnQkXZTKmd6awQ5h3ZErD0W/XAZF4tnbmu3/VqcXH8j2oiHiUo4jM2QQpjGW7+c8LcVAO+pwYyXjapnXBaW1vsM345SwFqjb0XwF15WLo0sTiO4fHT6RLCxfXn7tRL1ranDTS8a1ErjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYJlaFyiTunwmIeixk3rs70fkv5RbnKC0JVhbISxL/s=;
 b=DWzweDWKHLahwCoMTbn4/HRfNL6ExbMM/JJ7V0K0eyqjFl5GmWvFfARRCYUsePHxNAdiPc/qEQO99300qoXM0OgOgxFqDP+feCiEHni+UhwxySwpJ8COhIGVNTP16wLyMPnBOIVuMZn9n0hN7tID6KXEQXgTZD+9XXnTSwsNdpA=
Received: from CYZPR14CA0023.namprd14.prod.outlook.com (2603:10b6:930:8f::20)
 by SJ4PPF23FF06C03.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 10:06:10 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:8f:cafe::68) by CYZPR14CA0023.outlook.office365.com
 (2603:10b6:930:8f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Fri,
 30 Jan 2026 10:06:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Fri, 30 Jan 2026 10:06:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2D6D5406542;
	Fri, 30 Jan 2026 10:06:08 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EEF37820259;
	Fri, 30 Jan 2026 10:06:07 +0000 (UTC)
Message-ID: <af393f08-facb-4c44-a054-1f61254803ec@opensource.cirrus.com>
Date: Fri, 30 Jan 2026 10:06:07 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KUnit failures in the Cirrus tests on arm64
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org
References: <28d988bc-0c6d-4368-ab96-a82f1a15fc11@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <28d988bc-0c6d-4368-ab96-a82f1a15fc11@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|SJ4PPF23FF06C03:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a85299b-03a6-4c2f-6207-08de5fe730e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T09Zc01SQXQzOUJXK0pHLy9IN3B1WFcyNEp6M29WYVc2VjhQVVVUNCsyMGh2?=
 =?utf-8?B?alVjdUxmQ1FKcTJVN1VjdGtlSGR6R2R0NTEyTnlxOWdQYjdRMnZ5Qnc5cG5k?=
 =?utf-8?B?WmdKQUxhd1Rza2tleW1QSVEva2x0Nk5VUGdWRVZEVnpyYTZua0IyNk9FU0xH?=
 =?utf-8?B?U2J6U0VWS2k0OFBPQkNmaVlXcGZxQVU3R3ZzTDk5SXZVOVMxZXlzOG43ZmtV?=
 =?utf-8?B?K2FNNnJmNnVPZy82MnFmRnJHRHJDN3NndnVaaFl6TFBjY3BCa0ozd0xuSWR3?=
 =?utf-8?B?T3VZdzVpa3VUWHQ5QXovditJaDl6Um9RU0E2eFdPRzJTUTJyaUtvMENPTktZ?=
 =?utf-8?B?SFVYb3R2TU5JNHZ0Tm1xT0NiTk9NSmNPckEwY0lJNWQrZENWZWRnaWdVa29a?=
 =?utf-8?B?b0duL3J3emFpbDRiVEZjRDRJc1k2RlJmamNsNmdkeXZjMU9Ua2syUU9XNTdq?=
 =?utf-8?B?QzNZZk9DcnRCcnNNT2Mza1ZYN21iUGVDVkNNTXhPNVM0QmE0RjBCMktDWVlo?=
 =?utf-8?B?UXBFdnpHaEVUS3cwTG9JaXhwS2E2QkI1djYycmV6OUVmVTRaM2xqeFR1NHFw?=
 =?utf-8?B?ZUo2U3Rkc253RkQ5YU1XNytJR0x1THQ2UlVqeHpId3pxK3hUYWF0bGZubFFl?=
 =?utf-8?B?NkdJSWhQbUpQekpNMDdtKzZYSXo2akg1QXBlb2Z1ejZGNDNSa1ZmeTlBTWcz?=
 =?utf-8?B?TGlLdU01UW9TSTlZZDRtMHRYMDJDRHlYa3FPUXJvSVVlTGtMZG9yZ09IOVJk?=
 =?utf-8?B?b0t5OHVpSld5SFRXaUk1VnJxc3NiaGF0RndjWlNUaitUaHpUWVZZeUJsd2VQ?=
 =?utf-8?B?Y3ZKNVdrQ2dVSnZvRHh0enFjUGVuUmdLMnRJM3JWNXZTemN1WkVNTTJVcWxZ?=
 =?utf-8?B?MUl2eis5THgwVytPbXRRQVdORnI1MG5aaC9qTzRJUVpnUzFRZGYwbGtaYnda?=
 =?utf-8?B?NnZadTdDRGlUb05nR3ZnV3hvZVlQVDdpSEw5VUJzUENuQThxL3hUT2NabWhk?=
 =?utf-8?B?Tyt1MU1mWXRRdi9SekVGTDVPNkpFZEVGYjhjRDRLeWp0clhMd3Y2OG9lN3Yw?=
 =?utf-8?B?MXpMakI2RldHazVyMVZRMVk1N2xqUlJ2eWcyUTBLYzJmS016MnlzRml5THBt?=
 =?utf-8?B?b2ljanFyRjEwZmYzUVZPb29iUnVhM2twL05lQVRnbmJEbWlxRE54aFdpWTlo?=
 =?utf-8?B?M2doMHRDK0RBVEpBS0dTZE9JM0t4NW1pRUNtYktPMDBENlVnNnZiekhkWXpp?=
 =?utf-8?B?Zzc5UVNPc3p3YnJjUGU1cVB0emFBNCtQOGpvMzdaRkptQkk1UkhHemhQQXF4?=
 =?utf-8?B?LzMrSTJBQXFMaDB2R3RYZ3VMUitJUVk0cTVISTJuWHhDMjBzbHVsL08ySzNl?=
 =?utf-8?B?YU1tLzhGQlVoOWJyWDVCUmdoYk44cEJ1U2d4VnArQmZvVkFoSXRoOTc3QXBp?=
 =?utf-8?B?M3B6MkRnUzhmM3RXVTNWbWtuVWRjOE9tYTFKaDZmbndjdVVaNHBXVGx5YzRM?=
 =?utf-8?B?NTBwQWs2M25pU25Lc3BJdVUwOXJ6R3BOdWU1Ly8wMW1JME5iY1JienhMYXdr?=
 =?utf-8?B?MENWOWs2SFM3M1dIcmVZa1NvQytEcmtxWEZYKzdZL3dTUjFIQUEvdVhRakE4?=
 =?utf-8?B?WVpxTEpnY3RyUlovSGRtdmhSTC9sSVdHVXd4bXFZOVBlMGlNa2l3MTFSajFl?=
 =?utf-8?B?SzVtSkh6Rmk4Q09KOTNLLzBZZ2hUY3p1YlF4Y0wyY0ZCbE43aHJUcVRUc0lD?=
 =?utf-8?B?Ti9qWTRsc3U2VWI1WjlydTEvMzhJU3dqZXJRejJIK0tJNy9RUERCd2VOUDZl?=
 =?utf-8?B?OFZSTkFZa2xFRmRrV01ZWms4NW0yZjNKbkYxT2FaUUxkb2w5b0hacis5Tk84?=
 =?utf-8?B?VlNJdUZBc0QwZGRpZVZHNzd4VFJPVWxvTm5UMWh1bGFtUGZQM2xEeE1nYXla?=
 =?utf-8?B?Ti9nK2lic2JpNWtzWmVGVXhGVEZGeXRtNWwvZCtpYlp6MWtqMHNFSDVDT1V4?=
 =?utf-8?B?K291MWQyREJjSkNYTkVyUHBRemkvT3FFbEYxQjBodlBTd01Ec2xDclBXU0VQ?=
 =?utf-8?B?UVppS0pRaE9YTU95ZWwyZHI4Mmx5ek1yanEyb25pME0wUUJCQnlqYWhBM0dF?=
 =?utf-8?B?RERUOTdyZGs5NlJseGJYVzFDYVR5WktnWmhQZk9mMm14WkhYbGltamVsNmhL?=
 =?utf-8?Q?ts3oAx5wE8+zVEoGwm+niS9IHenhIaJNmouPfGw41A3u?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FTIP8bmggT2iSO8J0u+WycZoXMbh+rrs0+tzyRgXjgo2ZprDfFs40nDCf/PKtBXTs0MAwJeZgYCPMpp+GlJxKmjas8fWrq6E7mDTLGS5ywd42guXgPsXBdoncPG4uw3LZqtjNoYrJ0GNBQN58VADrdnwtCLIKN1Gn6RJE+dfXE+GQ7DN7ehdB4qcUQEsnNSCG/iLF1aD6TKUBrW0C+vv9jK9c+KWiOyGqCbuROChjN2++Uuyu0Zuy1gUyaa7HrJUw1mSO3ClkUtIz5dxu5pO76AotXvQ6jNQR+3DGqxW1V8gGCtFC5UC9Ba8dxwIziFCJfhBVvqjgpVKGSmh4kPrIxoKl7MJ+rdhiAVba77P4OUDbOlVLhx5TSqU+dt0JirlrovXrjipCugHnwksqpboHTQF8jhek5FZuIORJBpbygg/mTqOt+vtiMUUEQ9U0/4a
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:06:09.2914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a85299b-03a6-4c2f-6207-08de5fe730e8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF23FF06C03
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4MSBTYWx0ZWRfX9xyFclAYpgPg
 jIJciKh82rRAwftbQ675mmvVEjGhjHOD0pyOC2LeMlV5h4/KlJMnX7mqJjopSToQawzrFOfZM3O
 iU9p/vvh3XIh2MMEECzod3wvxdBNdor3jlWf4T/j3l8nE6gSPr+Ub8CpwZuShTsfcP3PhSq6Ksv
 M0Z1tWvOADqAtZWO0XjsmI5wmDkch9B2xyNk/lqtUIs6Z3B3fGkBXrMjJpjoRFdJCHrQxX4Vl58
 CtNHitVCtOV/9YgWyOSxWityG9u9xXB1ijly5X/fx6cBOwlY5Mb8z/deL+K838IlVsSleW+uqaF
 msTzw2f9wJrIuIbR3lnIoHk8lYr4nVEoRq7MACvyAqySM+5GSW5v5BJcJ8K/Iv178aKyT+C3A9R
 oUHY6NrydvHlUPK3ekfmBEfSbKV/Tv63U0hA/aHdHipw3+NlkRExKOwoqScedcB8pkOfASnCCc4
 49tN0LGxCyERkFHVC+A==
X-Proofpoint-GUID: VjPJlyLtej35Hqt6jDS21ladX47hsmy3
X-Authority-Analysis: v=2.4 cv=KvBAGGWN c=1 sm=1 tr=0 ts=697c8296 cx=c_pps
 a=QfAu5cRUQmedtNjS8psswA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CIHl82p9_Ni_lBFsCGAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: VjPJlyLtej35Hqt6jDS21ladX47hsmy3
X-Proofpoint-Spam-Reason: safe

On 29/01/2026 7:36 pm, Mark Brown wrote:
> If I run:
> 
>      ./tools/testing/kunit/kunit.py run --cross_compile=aarch64-linux-gnu- --arch=arm64 --alltests
> 
> with -next then I get a bunch of failures in the Cirrus tests, including
> some crashes:
> 
> [19:20:54] ======== [CRASHED] wmfw_too_short_for_block_payload ========
> [19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected subtest!
> [19:20:54] [CRASHED]
> [19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected subtest!
> [19:20:54] [CRASHED]
> [19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected subtest!
> [19:20:54] [CRASHED]
> [19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected subtest!
> [19:20:54] [CRASHED]
> [19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected subtest!
> [19:20:54] [CRASHED]
> [19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected subtest!
> [19:20:54] [CRASHED]
> [19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected subtest!
> [19:20:54] [CRASHED]
> [19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing subtest result line!
> [19:20:54] # module: cs_dsp_test
> [19:20:54] ========= [CRASHED] cs_dsp_wmfwV1_err_adsp2_32bit ==========
> [19:20:54] [ERROR] Test: main: missing expected subtest!
> [19:20:54] [CRASHED]
> [19:20:54] [ERROR] Test: main: missing expected subtest!
> [19:20:54] [CRASHED]
> [19:20:54] [ERROR] Test: main: missing expected subtest!
> [19:20:54] [CRASHED]
> [19:20:54] [ERROR] Test: main: missing expected subtest!
> [19:20:54] [CRASHED]
> [19:20:54] ============================================================
> 
> 
> There's some other errors there (including in unrelated tests), but
> given the crashes I'm not sure I trust those reports, the ones I've
> looked at run fine in isolation.  The equivalent command happily on
> x86_64.  I've not made any effort to investigate what's gone wrong.
> 
> Thanks,
> Mark

I'll look at that.


