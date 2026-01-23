Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91E131AF1F;
	Fri, 23 Jan 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179367; cv=fail; b=dw3mYQa07I4rze5WN3pIXk706oU/3GASfn0+cIHyl2d8jfAk7+nn5kpNjIX5yq7O4q+hgIBDNg6zmI+FhX+ftTE1Be9sJfykncWLKCgBJ1JxLXPN1cPIgbiOYNIkwa9eQUt04M92SNb4EDKBeAlSFJOZmyQhqcBGOPyNVr4OwY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179367; c=relaxed/simple;
	bh=rDqLjUUfISKjwP9pk2pUaYWPNtIfRY2QzQs2TzgdmSQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZnoM0bzvtAgJwF0maM26syrksN7x2gd1aa5jYkHhSbztjsaabDpbPVMcpeLS32qdH1GRG3szPdBQ72G4J8ctzsGZQ/QMUxdjQPKlIl4JUiAqGJcW2inViqQRMYYPa+FfNN8Au4DcX3jE3Xh4UouJM5Iu9c7eRNt5oPEZHibm3SY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=m4fTwVbB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=aqNe6O9q; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="m4fTwVbB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="aqNe6O9q"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N7YjIF3542751;
	Fri, 23 Jan 2026 08:42:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rDqLjUUfISKjwP9pk2pUaYWPNtIfRY2QzQs2TzgdmSQ=; b=
	m4fTwVbB1Ipy9mrm5YYpHKn0zCkhhLGV1ssGZXa+V4GPze+bgo4E1ZRteM+GxrJw
	BIbPiFH1vhwpIKYIdsFAvMDnIz37lvVK47j/GSJ3t2Uh6PR+6d52TygHoFzfYyuO
	VGVftVODlalSBAfM4ILeb4yd5z8BpMKq5xmx5vkYaWJCUuw7wSPGEiUvk5rcL0gu
	2YDv3whyyIqWBvAqBH3L6DOqEzX+iRV8DcSWlaY/ZDh5qUaZjUubRT0f8ZosQgTX
	kHPVa9LQ8vuKuKLgEXExmNdo0MiRlNbXqVTf8yzM3lZebMfYPpg6IE2mPYz9XVXL
	CERPOIMdXz+Qcz1/QRgD8Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022125.outbound.protection.outlook.com [40.107.200.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4br8q1yn8x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 08:42:23 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdlBRX400wqz+nsGPoEQ1Han/FVGNzerEmoQcVPsNVm/ffp53poKPSRI0FuBcagjRZw6jS1ut6TT+BVrEcpXt/LKuywIQ5dTpvUAsIAGEQ4bsHGjTdPzEMmlzitnbOettW+Q3a94wA2yR7CMZauj91nPyX/WxXmkFhGzNvtP03M2o+O+QdAHrGIzrHXEsHQdm9C49W1cHSBQTvh4bJlQRWaXsAPPwlRH7Y37x8dA4OjpYVtmweD+TDh2u0HSHoTA8ZO/1zPi5Yjy8njoEN+X7BrO66DQ1FPtFZspgL7Adk6/+4UuCATrJaElwxeXgS0SELIXWST01nViDm19No2Lvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDqLjUUfISKjwP9pk2pUaYWPNtIfRY2QzQs2TzgdmSQ=;
 b=Og+LD5WjixsfY01986PqELra7BZq1oHmCzKuhgdZP+wa5ybJP5hVkjQmDQzA3CP5ufTFJPtgsSmIhwj967vo/r32ryndGHs8kEKoI1/Swr3QLl4EgZcRvklelU6xVGpZnPskV17rBcfGyf/dqsyzptLclBDg9LX4PBtQdzB58iMnFe/AxYE6c1I1OjWJS2XylvktfyL+rmfQLfPRNYUQS2rZTS2VzoPPG0QbuM81yu/B70qs51pWTGMzdpNbTpYFXg3E6HdCIALvMXoXduhO7vlyLhUuswrcItpuGKy7nc6OMSO3CaoPVs210/o5L/55RqvhRnffiS2dI3PNA/Gw0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDqLjUUfISKjwP9pk2pUaYWPNtIfRY2QzQs2TzgdmSQ=;
 b=aqNe6O9qMUCMr7OvB7U+fIs1+yGeydC0LiD/RE5osHX59WBpj0zUBmv6EUGdgO1vgCcXUolfdbsdz3+Go08z/SgQNQ5TBFeLxSzXohVVDRdc/KXjv2TUC+72FOJB5U87QQ7cZOH69EMdoqLVd3iRZI3KVPUkzE3z3dkwJYu0ma8=
Received: from SA0PR12CA0029.namprd12.prod.outlook.com (2603:10b6:806:6f::34)
 by IA0PR19MB7268.namprd19.prod.outlook.com (2603:10b6:208:438::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:42:17 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:6f:cafe::98) by SA0PR12CA0029.outlook.office365.com
 (2603:10b6:806:6f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 14:41:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Fri, 23 Jan 2026 14:42:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 98836406540;
	Fri, 23 Jan 2026 14:42:13 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 89054820249;
	Fri, 23 Jan 2026 14:42:13 +0000 (UTC)
Message-ID: <cf52537811c2958dda4510b50792278d04fe9f39.camel@opensource.cirrus.com>
Subject: Re: [PATCH v2] ALSA: control: add ioctl to retrieve full card
 components
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        alsa-devel@alsa-project.org
Date: Fri, 23 Jan 2026 14:42:13 +0000
In-Reply-To: <871pjgfrto.wl-tiwai@suse.de>
References: <20260122111249.67319-1-mstrozek@opensource.cirrus.com>
		<fce36281-1aa4-4a83-afa1-2470df4453a0@perex.cz>
	 <871pjgfrto.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|IA0PR19MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: fba91f31-7b9b-4a98-fe5c-08de5a8d99ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0hXcjNyNXU2U3V2Uyt0TjJtOE9ybTVOK0NUUldZWk90QUpjZUZuY1I1cnZZ?=
 =?utf-8?B?dmVxR3lUREgwcVdnOWxpVU1IelJVenV0WlNzKzZQTTFSZHkwQkNNREtSejR6?=
 =?utf-8?B?N3BGcjFJSjIxcG5FRkFjL3gxYm5sMitGeEJidVRhR0dFYmdmeXJNZzFWdnFx?=
 =?utf-8?B?K0hyS0phMG1BSlJqbUo3LytTY1NveTdHMDFST1ltTUlBeGtab0dSNUF4L1kw?=
 =?utf-8?B?ZEl4S2hYK0dRT0NHeXJ5cU5zT3lONytuT1pFOXh2MkhhcWFvenU0dmpOWDdV?=
 =?utf-8?B?MjRpdjhxQmpHQUNQcmdxUTlBTUFSQnJZVjg1NDhIUlo5d2J3T2JoYkpkMEs4?=
 =?utf-8?B?TUNwS0V3emJYQkNIVlBhWW9zdHJoNVBrMSt5VU9MSEhGcVMzbHBDT2V4MGV4?=
 =?utf-8?B?R1hLWi9pT2w2ZjhZbnIydUtRUGJIZEtJSmQ1OENTN2xjbzlaZnZDUTN3VXZ3?=
 =?utf-8?B?ZXlxOWxqei8yRzZhVU5NR2VLOUcvUU5WUFR4bUY3MFN2cVJqVE5vb0VLck5u?=
 =?utf-8?B?aVdzT2hZKzNDYXFyMmFpcE9Nc0RFa2xwem1KbXM0SW0yUFRlRW5SS2Fta1Na?=
 =?utf-8?B?d0FrRVg3V2FCS1RHazdLSEZTSFJvUGRrK3RxVkVuV3dJb1BwYWR1Y1VBZ1pB?=
 =?utf-8?B?blB2N1dld21jRE1DQ1gzYy9McHErMWdPdGNsN0w4WHR5TllnY2N6WWhjbVM0?=
 =?utf-8?B?R1pMRHdFN2U3ZlJrQXR6MmFOSDVpcjVmK3A4SVRMaFNFaDFaM2xad2o4TTh1?=
 =?utf-8?B?NlVIUU9FZlVHbEFUZnlWb3FkYXFtaHZ0R0lzMG5PUitsQjZuN0czWExVbXJW?=
 =?utf-8?B?clpSVk1YbUlEWWRvYUlJUGRiN1kyZVBrejN1a2cxNDVSWmlzaU01ZW1KbUhE?=
 =?utf-8?B?eXhMOWxRckZBaFAvb01wdHJtaTVkUDlLQ2NnODlwTVg3Y2JIc2d4eFJLYUVE?=
 =?utf-8?B?YWc5aExBSVVzZVlhN0xDbktrUE1RWWd4WTk3M2MxODdreERaVy8rUzdGbXBP?=
 =?utf-8?B?dXJkNHFzVTJNdXhKa09hK3lIeXAzQmtpS2ZUZi9rVk5zQ0FRM3k1dVpzM2VO?=
 =?utf-8?B?N05KOEUwN2RCZzdtak8wQ09iSFVZd3B5K2VvbnZDUzI2V3orVWZpUHBkVXZX?=
 =?utf-8?B?ckVDVC9lWk9MQTIzdHhPUXpIYzR3UEJvVjJKNHhEcS9DWnd4QkcvVkF3SlVU?=
 =?utf-8?B?ekVCbjZYSFU0WDJBaXlXQXUzRHVubmhZSkdFUWVFbDlickEweUYyaFVQN2Nv?=
 =?utf-8?B?aWJJdFRDc0FRVG8zalNYVlpJeE9UeE43S01ydXdXWDcvTXJZVmNiaUt1V1B3?=
 =?utf-8?B?aEgrdEhqSVJVYlY3MWZrOXVpU0pJVjY3WWw5RTZTNllDRmkrbTJGNFV3MFZP?=
 =?utf-8?B?bFk5US9SOFV6VHVFNWFDS3MyYUpBNVhVQnJPTFdsMktTdUVTRzk5RFROWTBl?=
 =?utf-8?B?ckdZYzJzV2pJakR3aEsxZWo1eENPL2pBR2UzM2lCckhacUlyRGhkOXdoQ1ky?=
 =?utf-8?B?TlZEa2R4NThwRlZnZ2g5eFhnT2xBeWVGYTBWZmU3TVRXZUN1am5hSWRuaVFJ?=
 =?utf-8?B?bVQxZnhvN3RmV3daTGlENVMzbm1udWJJdi9TRlgxSldySnJIZzNjK21WLzhs?=
 =?utf-8?B?TXlocEZ3bkFQdEh1UnNKTFlWbFZGZXVDMzIvZUdMbWNNTThaVDZ3YVdqRUZD?=
 =?utf-8?B?SXJrbDJZa0tqQVVUcHhXRHFXUjlYaWcyeVJSd1pjcnNIaTd3bGZZODI0Y1Zi?=
 =?utf-8?B?aDZHT1kycmI1eDFoOTUxcTZFdzZDRHJGMzd6allDd1E3Ynd5VE55RnFvNkZt?=
 =?utf-8?B?UzRqdVVITVJBVHhPem1sRUY5V3pjT1VFSm8zUCs0M3liMUh1R3prQkQ4eDZr?=
 =?utf-8?B?R1doaHplcGx2UnZlb1dvQkpIeWo4bHhMUTRDMFBtaEx5dVlzcWZPU1V5WEdE?=
 =?utf-8?B?dVJNQ3JDbHdlYTNBSkw1Z0hIKzFNSFAyREo0c0p4Nks2Vi9SelNJM0pLbDhr?=
 =?utf-8?B?SGhNWWpvUllvc1YrSTFEeGxZREdGOU05TmdFQ0kxSWN2cDJ5emROcGc3OS9B?=
 =?utf-8?B?dTZCWm9ERWZOd2ZJN1FUYUtYVTdWdTJIN3I4NXVvS2Y4bWxEQnJtTlFUaUNF?=
 =?utf-8?B?TXJZSVkrbE00KzF5QkYxM2hqOVRVbWFQeHJKQjhNWDVwUklNeE1rRHljb3lw?=
 =?utf-8?B?dFRWM1E3QlczL3VBQTgxd3c2SGU1YUZnWkJITkR0ZTdhZWdqSm9UNDFUbDlE?=
 =?utf-8?B?cHBPbCtzNW1rNnhXN2tjYlpCdW5BPT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:42:14.7575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fba91f31-7b9b-4a98-fe5c-08de5a8d99ca
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB7268
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExNyBTYWx0ZWRfX+jfUumo3RC08
 D8/twnRiOwMZ0lgSrGiPzwIZxUVO8ZArWfD8AtS+C4p4Hpl2ea8tpu7MyyDmQUcitLyJPGETKid
 2ndB/l6R1/6N2wSlZ31m4tDskyAXRNRkllhUZWvALXjbMR/8VTyEwm0cavdpquVJEWwK6GcNezl
 0XncGD/ODUCZxL+o7/QJ19ZfZhwAYcb9VgfSGsS+nPunJeSTUTXtGz8/mnMuMsRGJsmU6G0kzH3
 lU4Cx2YQKR1CtIAiFflTJLanCvbjsR4Z/orKewop+m8SMc2CH1s5WDoY8QdKPZA6O5DvBDh7s33
 hb/azT5abPmbAA5qHjinxMR6eVCWV3fq1wxldiSkVp7VrSh8y3GKUZIVpuwSsYaP3/tvP6/jS3/
 YLasFPeDv5zUu7yvoLwlMSnNRDdDwc4kZBH3/jQStI3szQYHRDO3OiZRlPAL+ggAiskiqZFT9v4
 gmfeDSvVM9sPiY9cweg==
X-Proofpoint-GUID: bmZEbezx2SPdMMNmSc7gDYAaHFUEas4w
X-Proofpoint-ORIG-GUID: bmZEbezx2SPdMMNmSc7gDYAaHFUEas4w
X-Authority-Analysis: v=2.4 cv=JbmxbEKV c=1 sm=1 tr=0 ts=697388cf cx=c_pps
 a=rSDpQ5I7qE382Ey34cf7KQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Smbag8mm1rjwz-7hlY8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

W=C2=A0dniu pi=C4=85, 23.01.2026 o=C2=A0godzinie 13=E2=88=B615=E2=80=89+010=
0, u=C5=BCytkownik Takashi Iwai
napisa=C5=82:
> On Thu, 22 Jan 2026 14:30:04 +0100,
> Jaroslav Kysela wrote:
> >=20
> > On 1/22/26 12:12, Maciej Strozek wrote:
> > > The fixed-size components field in SNDRV_CTL_IOCTL_CARD_INFO can
> > > be too
> > > small on systems with many audio devices.
> > >=20
> > > Keep the existing struct snd_ctl_card_info ABI intact and add a
> > > new ioctl
> > > to retrieve the full components string.
> > >=20
> > > When the legacy components field is truncated, append '>' to
> > > indicate
> > > that the full string is available via the new ioctl.
> >=20
> > Thanks for the patch. Comments bellow.
> >=20
> > > @@ -88,7 +89,8 @@ struct snd_card {
> > > =C2=A0=C2=A0 char irq_descr[32]; /* Interrupt description */
> > > =C2=A0=C2=A0 char mixername[80]; /* mixer name */
> > > =C2=A0=C2=A0 char components[128]; /* card components delimited with
> > > - space */
> > > + space, truncated to 127 chars */
> > > + char components_extended[SNDRV_CTL_COMPONENTS_LEN]; /* full
> > > card components string */
> >=20
> > I would remove the original components[128] string and replace it
> > with dynamically allocated 'char *components_ptr' with 'unsigned
> > int
> > components_ptr_alloc' to store allocated size. Then the
> > snd_component_add() function may allocate (and resize) dynamically
> > the
> > components_ptr on demand (using e.g. 32 byte step). This will also
> > catch all drivers using the original struct member when compiled
> > and
> > make the memory usage a little bit happier.
>=20
> Agreed that it'd be better to point to the dynamic allocated array.
>=20
> And, we can basically drop the limit, too.
> For example, the ioctl can store the size of the string in return
> while filling up to the given length.=C2=A0 So, when user-space gives
> snd_ctl_card_components.length =3D 0, it just stores the actual string
> size to this length field.=C2=A0 Then user-space can allocate the needed
> buffer and get the actual string.
>=20
> Or, user-space allocates a large-enough size buffer, set to length,
> and check the actually returned length, too.
>=20
> Of course, we may (should) have some upper-limit internally for a
> sanity check, but it doesn't have to be exposed as a part of ABI.
>=20
>=20
> thanks,
>=20
> Takashi

Thank you for your reviews, will prepare a v3 with dynamically
allocated array soon.
Do you suggest to simply error out if the internal upper-limit is
exceeded?
--=20
Regards,
Maciej
