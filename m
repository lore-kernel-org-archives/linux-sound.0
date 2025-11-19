Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991D932721B
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 11:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553277; cv=fail; b=mjb5ZIMBrM55GRlOB1cOQ51oAS1csjjmU1ea28hRl4DzDwjwqQtXhl08azT9rcSqP/aD/aVKL1aLWGJ9vluD1oHCPDetZzufNwIVDdHTAdS9mBLoQAq8kzk1XqeZJ+oJnoNEP2YSng24K0ShtK0/+yVO7HvznO/ecKNF4eqgee4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553277; c=relaxed/simple;
	bh=/nK1h+yUTb7oTP6eochfq6OAYT0Y9OV4vDEiDB3hkvM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YVpdFnlJ2BotcZCJFYu/vJA16JXMSpYVQQcVVdF8ICyaV/2jWydp20m5awWSNemeLOKalg/8vnBhFvNZ3cdTBMy/0s9nv/QgQYkK9YZalYpHmFnhhVu7m5DzRRZuDQexnqOOhwFS7SvvzQI760x73nCzif/e3qoUimpf1T2ckak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dtxaEnYb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=aP94TYtD; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dtxaEnYb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="aP94TYtD"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ60kao2358492;
	Wed, 19 Nov 2025 05:54:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/nK1h+yUTb7oTP6eochfq6OAYT0Y9OV4vDEiDB3hkvM=; b=
	dtxaEnYbzk4InAoYPiR58Yqk2feRX2F5+NiFWTZKinXWiGtvi0eZdvwqHwpulTPE
	aT8okJ3ej7ga9bpKz01GRykXMZBIBWGz0KHhrRfuS+MLjDbtuMW7VFN79JCVbegV
	2PkpJQ3w2Xqeupwr0eSX+EY6SLXMO8gkxFcx1lbz+8a/ZLwLokR2TJjg/6Kn0D4c
	v58tIIAfGpxF5szorixLjMTrQe/dXOYSWQR5Nkb71t7lMKAOOXShB4f1T2t92koN
	71JrAwcPd2TPUkyu8jAMDuwnX64ES66F/dSN6dv3AO/Iovt6oSOSPlqW1ZGubTXi
	9QcGBI1IulCtdeI+gqke9g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021075.outbound.protection.outlook.com [52.101.62.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1cupr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 05:54:03 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9mJ4I4vo3p67N2YM47CqkcrVBkQNcEZF+VFG84zjXAPgclA9dJQsmnlnsK0r5U+mHOb82/2H+lKlQesqLciGPeNXuqd09Wr0tJY8FeGw+XWIGbNTqaRU2J1ClERIMILR8nZhw20G8uot9gB4HmBMese428JJGitqCOjMaqscoPKO7aNYjARJ3XgOssnqT143NrAfDQeb5Dwf6YuErx4FeFfwEUhOp4xKHT2X1HxKd+DLd/tbmsQT9poV2ZKUiVdoEQ7wyYrnkpgM67mUduSVTxZvtxEKTClDxyXKwlLqFEtgwnMKQS9hz+va1bA0GYICjkrc6s0oPD2lcPG65+vlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nK1h+yUTb7oTP6eochfq6OAYT0Y9OV4vDEiDB3hkvM=;
 b=Ry6VvrkPREf07b1ujITXZPrmYR9T8NJPSGSwHNgB+ORV9spb6s9C5nur3nyW46WAMnTB+dWgBVm0mF9bwlaHRJLJ/9Ohh2u8MVGairppNe6jbO2lMFjjXx0rcJdXezEhSPT2BT4fBYy0WgsflDp8GXravsTpW7w9cv/zi4/5bOKGnufWmBWMgL8JWcdrXGVnOL78phHk8Hc+n4GaiSqI9V8CldHNUpdSFu3ff+odpY+Wmy9WRS1C2xkMkV9meXX0wpAXNozvQOsm7aiQM83RecC55mz/egqe+axdqR4L9jNbr6e2TjfXHkiUfKBtIpA2MTzu+SNsezHQLWa8M39syg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nK1h+yUTb7oTP6eochfq6OAYT0Y9OV4vDEiDB3hkvM=;
 b=aP94TYtDgsJ1CNogFIvewPMXmb/o2sEf+xQdhRkhW00D2x4RrhD5sw6DJRQvrffCab83c9wcx6ymBjUBBWRpqKQHmF9amVdpEI19kdrV9jHsFb6se2T+Y+/LXhg7bndQ7VfVb1UWVDWwOrG7yQ3TIn11Z7FGhUxJDNU2LKGgy+g=
Received: from PH8PR21CA0007.namprd21.prod.outlook.com (2603:10b6:510:2ce::13)
 by BL1PPF3344A9E8C.namprd19.prod.outlook.com (2603:10b6:20f:fc04::e97) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 11:54:00 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::c3) by PH8PR21CA0007.outlook.office365.com
 (2603:10b6:510:2ce::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Wed,
 19 Nov 2025 11:53:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Wed, 19 Nov 2025 11:53:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4A204406547;
	Wed, 19 Nov 2025 11:53:56 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 38859820247;
	Wed, 19 Nov 2025 11:53:56 +0000 (UTC)
Message-ID: <fccb91629f85d9e60259b4573a7f56bd5f93ae4d.camel@opensource.cirrus.com>
Subject: Re: [PATCH v3 00/13] Add SDCA class driver
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Date: Wed, 19 Nov 2025 11:53:55 +0000
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|BL1PPF3344A9E8C:EE_
X-MS-Office365-Filtering-Correlation-Id: 113472e2-89d4-43e1-4075-08de27625288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGtHMlZ4WU05eXJ5VmZPRHlzWG94djFFZXh3OHdONGtVd3ZvTnExaG1JMzAv?=
 =?utf-8?B?TSt3cWVJSFBXWFk4WjNuNlhpSEZkUmZ3V0xlNk9FU1NBK0g0ZkF5bUZ0Z1hR?=
 =?utf-8?B?Y3BrUzZ3aEQ4eUNQVmp6czBEOUxZakhSa3pJTjB1aGhNbllCR2FVRC9NNjZO?=
 =?utf-8?B?SXRIdjFYSHNsZStVcSt0aVdreG9kdnpJRnh1WUpxTnAzY29TekUrZkVpWW82?=
 =?utf-8?B?SW5NSDFPMmlNd2QzU2RpVUM4MW82R1lDUjNhQlpjS2VicDNqZGM0aEhSK2dZ?=
 =?utf-8?B?OVlMRFEwWE0rS29QTjVsK1RtUlhUeEM4TXJqUU1xR05mUFkvd1RTWXZ6Z2hX?=
 =?utf-8?B?TFRqMk9xMldNUEhnZnN0YUY2Z1plRHpnWnpNN0RXWlM1V1pZcDVuMnk1Wlp6?=
 =?utf-8?B?ZGtNOWI0ZVhDTlNsT2dPeVZTQjdycWhWMVAwSVdzTDQrUEVWOSt6M2hRZDIv?=
 =?utf-8?B?RkRHWStDWnJydjR4UlpGL2J1MmhXVENNNEEvTVcxUHNjVUtaKzdrcVFEL1di?=
 =?utf-8?B?ZHozQVVPS2RxK2N5WjJvUjhzZWZraVlnS1NycGg4cEJ3cTBaOFlSNW9nWjF1?=
 =?utf-8?B?R3Z5ZU45N2tTRDUzejU0REs0MzA3UmxXTkhlUERWcmJDV3JWMnlUSzFEaHgw?=
 =?utf-8?B?RmxocEdhenMrSGE3eUJPTUxGWDlXd1BaaDlUNlRicThEWCtXUFNEMG5hZ3RE?=
 =?utf-8?B?cyt0TmF2U0hrMzRBUlVkTm1RMHlWRHpEaWJUZjNOZkdHQllVdmU4OXppajNF?=
 =?utf-8?B?eTJ3MmljZEtIdG4vU25WaDNlalNpWlhyd0hWTkh1S3UrQzk1Um9ieXRyWVFk?=
 =?utf-8?B?K1Ura0hyV0hpTDNLYmhoZm80RlZNbWgvTnp3WGRBUGJXY21HeEV4eDY0TGxU?=
 =?utf-8?B?QnBWd1RZM2RwUmRnZVZqQlVUSFY0SFk5Nk9aWVZPOFJCUVErK3V5QzNXMFJ0?=
 =?utf-8?B?dUJ6RFpDY1dqSnY4eWxxdVJwTDdMQjU5UWFiVy9nNFVzYzFuc1o1RmJKaTlw?=
 =?utf-8?B?K1VhYVY5TzloVlA0M1NJQWRVMm5yaTZQTStkZllOcStqUDMyQ0VJaFdLZ2FI?=
 =?utf-8?B?TWpHVEkrRWlyelJsNVh5TmswYk1CSFh6dSt2cFhFNmdyOWF2RGpaZFYxN00v?=
 =?utf-8?B?WGJCa2szU0ZNZmZDc2xXZWhiTHRBSTdFeVY5YjlqU2ROeUdOOXlpbklMa2dY?=
 =?utf-8?B?U2IraGMxTVpMV3VGU0JCNnlpb3dtSXF6UUh4bk8wMDZUNlprVlpyWWlPK1ND?=
 =?utf-8?B?RGJuUjFaeWdIcDJXSHhpelltR2Z1dDhsajlHY2FxeHgrNGNQT3RLS1RuYkUx?=
 =?utf-8?B?MHorMzVwbE5YOXlGdVgrZmVtZjIveU1ZaUc0SWlIVFpFQytwWS9SMzY5NUl3?=
 =?utf-8?B?N3dVUXVHUXdLZDZ0c25mYnpaTjlIK1ErZDRhOWoyV3JZWmJJUnlrcE4rZkYx?=
 =?utf-8?B?OW80c3Q0cGtRb1grY0lPZ05UdXk1ZkJUOUpUc1BsYi81OHVOSkkySUJuaVZD?=
 =?utf-8?B?OXNNbWdSajJHUjZzNEJ6Z0VyUGFlejY5Si9BamZ1OWVqdVNDSGlLako5RmRZ?=
 =?utf-8?B?VlFsRXBDeTNFSzgxYVJDemRLMlB5ci85aHBNRERhdGJKa2JjR3JBTUxiVTcy?=
 =?utf-8?B?dml3TXVHWnJ3U2diWFliR0szaVpmcWlrTlNITGo1NjN1bnd6VVZaM1NXeUdt?=
 =?utf-8?B?NnhlUU5NR1pmS3h5bHJ1YnU2MVNvcDQzcFRYQTVFazJSL2FzN1B6K0UzRWlC?=
 =?utf-8?B?b1FQTmRuekxnK1NqVmsxMGN6ZUN4akprczEvYXNCRHJtTWlKTWhGYUllOWp1?=
 =?utf-8?B?QWRWR2pLditYczFJVUhxckY1NVh3Sk9zK3JKd2M5YmNoU1Z3RWpsbnJMUkkx?=
 =?utf-8?B?ZUF1Qldvbnh0ak5QeFMreEIxTmQzcGF5VHFNWTVEZ2sxWWtPUmtIT2twTE42?=
 =?utf-8?B?emtkRmRmUUZJdUpWTjhqTjhHY01CTjVSQ3Z0OXVvMkRUVzA5Rkc2Q1k3VEd5?=
 =?utf-8?B?eHV1MlRRdHFHU0VkVFUwT0RFb1YwM3VVTUs2WlRhTDNFZkFTWHYxaWl5TVNu?=
 =?utf-8?B?cEFBKzYxV2lPQlpXaEtwUCtRNXgxYlRZWWVPV21udGJTVTcvT3Q2VjhyYkZy?=
 =?utf-8?Q?ZqDY=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 11:53:57.5228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 113472e2-89d4-43e1-4075-08de27625288
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF3344A9E8C
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691dafdb cx=c_pps
 a=APgIdIbuBBIe7PXa++EYhg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=aZ0qJHIkvmz7pr7F8IoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: FzT_i5G3g9H96_eO4i2ijbA0RB-uTc8o
X-Proofpoint-ORIG-GUID: FzT_i5G3g9H96_eO4i2ijbA0RB-uTc8o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA5NCBTYWx0ZWRfXyBl8MmSyt/hH
 83/jPKU7sElstvhvJhvI2ZH/UJ0DH9W5Jia2xHg6OSTY3UUDytRfB6MQhO068/ve6zts1ZGtmBq
 UJqKTF5F/yee1mdZQ89kiMInZahLSQ0BojtPTFti6N6wSAtgxMfBtGNQfA0sy/NTRiCfQwBaYFR
 u3MExv6bB8A91stR+q11Gxcn8UPJ5RKBeHvmVZMb9xd6DXOfva6ivaXAob+48PUttY/QI3BHw/U
 NOU2n1yDYFFULlIUe/gKhsJKSdt7yIgQKZg9JyRiwQhgErYOsci2ifgBmuUImuYN1B+DGX+vjku
 McrwD12b7vBj6xbAK3cx0NLSTVp9mYDQCOEzRk7OLiSaux12YjxWdlaQJoth4EDq1C6AThhfs66
 HPyYaAc1QIu/PKmbeSnxNwqZhpWZvA==
X-Proofpoint-Spam-Reason: safe

W=C2=A0dniu czw, 06.11.2025 o=C2=A0godzinie 11=E2=88=B644=E2=80=89+0000, u=
=C5=BCytkownik Charles
Keepax napisa=C5=82:
> This series adds an initial SDCA class driver, this consists of a
> primary driver attached to the SoundWire device, and auxiliary
> drivers
> representing each of the functions of the SDCA device. These drivers
> all
> use the APIs added over the past series's to provide the class
> functionality, as such these final drivers themselves are quite thin.
>=20
> Also a few fix ups at the start of the series that have gathered up
> whilst the last SDCA series was in review.
>=20
> Thanks,
> Charles
>=20
> Changes since v2:
> =C2=A0- Updated the locking in sdca_fdl_process
> =C2=A0- Correct some spelling in comments
> =C2=A0- Renamed suspend/resume functions to be a little short
>=20
> Changes since v1:
> =C2=A0- Add a bunch of bug fix patches
> =C2=A0- Change some prints to dbgs
> =C2=A0- Add some additional comments
> =C2=A0- Flip order on regcache operations in resume
>=20
>=20
> Charles Keepax (12):
> =C2=A0 ASoC: SDCA: Remove duplicated module macros
> =C2=A0 ASoC: SDCA: Fix missing dash in HIDE DisCo property
> =C2=A0 ASoC: SDCA: Add missing forward declaration in header
> =C2=A0 ASoC: SDCA: Correct FDL locking in sdca_fdl_process()
> =C2=A0 ASoC: SDCA: Add comment for function reset polling
> =C2=A0 ASoC: SDCA: Move most of the messages from info to debug
> =C2=A0 ASoC: SDCA: Use helper macros for control identification
> =C2=A0 ASoC: SDCA: Factor out helper to process Control defaults
> =C2=A0 ASoC: SDCA: Populate regmap cache for readable Controls
> =C2=A0 ASoC: SDCA: Add helper to write initialization writes
> =C2=A0 ASoC: SDCA: Add basic SDCA class driver
> =C2=A0 ASoC: SDCA: Add basic SDCA function driver
>=20
> Pierre-Louis Bossart (1):
> =C2=A0 ASoC: SDCA: add function devices
>=20
> =C2=A0include/linux/soundwire/sdw_registers.h |=C2=A0=C2=A0 2 +
> =C2=A0include/sound/sdca.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 14 +
> =C2=A0include/sound/sdca_regmap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0sound/soc/sdca/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +
> =C2=A0sound/soc/sdca/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> =C2=A0sound/soc/sdca/sdca_class.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 304 ++++++++++++++++
> =C2=A0sound/soc/sdca/sdca_class.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 37 ++
> =C2=A0sound/soc/sdca/sdca_class_function.c=C2=A0=C2=A0=C2=A0 | 460
> ++++++++++++++++++++++++
> =C2=A0sound/soc/sdca/sdca_fdl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0sound/soc/sdca/sdca_function_device.c=C2=A0=C2=A0 | 117 ++++++
> =C2=A0sound/soc/sdca/sdca_function_device.h=C2=A0=C2=A0 |=C2=A0 15 +
> =C2=A0sound/soc/sdca/sdca_functions.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 52 ++-
> =C2=A0sound/soc/sdca/sdca_hid.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 -
> =C2=A0sound/soc/sdca/sdca_interrupts.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 39 +-
> =C2=A0sound/soc/sdca/sdca_regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 89 +++--
> =C2=A015 files changed, 1089 insertions(+), 81 deletions(-)
> =C2=A0create mode 100644 sound/soc/sdca/sdca_class.c
> =C2=A0create mode 100644 sound/soc/sdca/sdca_class.h
> =C2=A0create mode 100644 sound/soc/sdca/sdca_class_function.c
> =C2=A0create mode 100644 sound/soc/sdca/sdca_function_device.c
> =C2=A0create mode 100644 sound/soc/sdca/sdca_function_device.h

For the series:
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>

--=20
Regards,
Maciej
