Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412049;
	b=Npt0ZRslP95nKa/lfaXXrOsvnHc+0aGfcbc4rmttRXOHY7YvEQlV++Kja3a/DxluZYM8
	 aX8Nsev+8ie1JcqWuE46UgQfhCYZExcii31MGdjX9W9GaSCxvCkByX8UmjwZk+DMJX879
	 TQe/HzV+YZv4I8PQV+03AxNHuHV6AwH1Sd9S93eEuQjBvNP39qa75y40tme/3I6SrXuEo
	 WAEfxhm8Fv9tcZ7FRfdqUM5blaEDk0Wqrlut9Kq3u1ULmDf6BqGJDQYAN2RGNjz1EqN/U
	 2t/2dkK1jwdfXd9ipSliYypbYre9MZqM/clSSMdTEMYnU4+3ZIBUZSZjzIEhplhw80w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412049;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SdcWpAhv2J9uc5Tpmmuq5LWo9P5AiVT9atFs51PffWY=;
	b=cmc8hTxTgM+znS/T8yzVsIqpEzkB+EhRK8IzUBT5QYR+Adz8sVJO5Ie0rDhaAdgr6mGy
	 oMRIZXaRttwsp0Gl/kBmeDwN7mVJC7ZLoSX6e7VSGDs2r9yVvAAUMLmCvpzFTzCvD1KWo
	 +ZdhgO9447Vyjqo76R0UON72AV7hG98fHH7NhAv7+ULo5CdJsaleMjT77oCpC2jwqzrqV
	 LJkBgLrUq/fMchOCMH8GwanfjXA3KTCJI2fhQ6VlH1KljrSdViiVrefjooroXaHDrNMri
	 ya+YnP6uS62wOdquiOKL345M1K80LwIl74a0g5A35bkiA2tYR0vyB2C1Y39UENjFTIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=FOC+P1Fg;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=aDNWPkhi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2B0606A326
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C2B0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=FOC+P1Fg;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=aDNWPkhi
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1jfV409524;
	Wed, 11 Nov 2026 10:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=SdcWpAhv2J9uc5Tpmmuq5LWo9P5AiVT9atFs51PffWY=; b=FOC+P1F
	gcC40OmSsBNUS+rlfDrI187zcP2imltjTRaylUhXM6QqgznCrPYxXhluxLZzSlQ+
	soV/INdpqy9Skvv4lJZcMBKaBNsY5DcIRJye7JxpHSBgNF2vyV1g1VhwUEiVAIWB
	76a4ThoG9Ay6u/000ehCJFOvq3JPwKGiNnt8sy5qRbS780mjScZGZfUzwHCyhtU7
	FdpxIVG/eMUjY/cqYOGvuehaldppemEyE//fO9Bo1osynIEH4tcu6BEZ4P+opxD7
	J1J118gpiP8oLREkiouKQ04cQVugRkju1+YDqz6+WrNh2LUdYN00gz3NMAFuVXZO
	NR68EY+QsNp3/Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=SdcWp
	Ahv2J9uc5Tpmmuq5LWo9P5AiVT9atFs51PffWY=; b=aDNWPkhi6GqPkVBcrSxsV
	EJgBKUM+XgRQvtxNUDlPy+mPhaeyA0k5BO24+mFjNZE4RIU3S0ZUG2o/HREP5/pc
	8Y9XyCekl0S29eT82Y6xqAJKD5kctuHiapEbdUsH0L9V0ny5lNEhYYyPttKkxoum
	ZHk3Jc3dxVPAZnY24p2qQrzkaOFujvPg14Ct93LDQvaQX9u6rzlfmst7x43yl90C
	cF5OuP89iig/Eh2OViiBUI9DQIvB3cq0xC/NoHOLgRtA8wsLlPw1jydEQ+AzxKXP
	OgLED1LcF+kfCr5gMRM7XqTVMvPMPFje1UCRmIKvFrLKlb6pT7+ayPUq/tR0dlpT
	g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvqu917e4-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:47:23 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyouKRxKUvnHuKJGdrdHzeS0fU+Z6YZTOx8nR+7fDlLCB5LntYsqfmcm4vaPgmdX4Z7JwY6HJ7NWpjnxbrMLnETLXVpvdIjOOZvgVf8CYwTUXoqWdummH27lagRygLg/og5RiqLd0XxWPHeG1FmyZigfsdnoOMjCg2dRKcBb1KdbBz0vn/IQEkcn/5zjGt5wZP0LrrysltRMBAId/iksrsF9lXCaMB+z/9F5gUuhTXjSnrnMRlyKkN0KB/D27X/8MvIcy7EGyYQQWKqAT0njVMkc1QB9k4X71QUxJ/iw0vI7zp98WwxeDdL8NTtoDNUH672w4gyzJkBP09P3PX3hZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdcWpAhv2J9uc5Tpmmuq5LWo9P5AiVT9atFs51PffWY=;
 b=EnNs39pRanz0U2+/TNhCDPcptPBAdfQGiEoc4JDTD0SQW2efQR7ADeWqAdS0trzOL33GHzEaSlznl3O4WUBdNvXBazyKFWYNQW6YDdrF3Lw6sLXEzoG6EdiyKOx6P5MvpJk0wWFjHhQmfbYl98Lcw3yzcwLugqrdkxPYzx7zAZpD8Nyhr3IG6aCbc7uXgRzwe9Tz6czcoWJkmKkmX8DKanhigWaIY9fIVKQB1ncJjytj0K1H3NFEmCI5akJLOcTLtPDgBrNz6sH+eEEbphgGJ/H8M++zHwZzStV96jjB/pb83kV+zgcOYAo0MoJtUF4g1/IcUXMLJsXHK1lWhzp9Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MWHPR03MB998632.namprd03.prod.outlook.com (2603:10b6:303:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:44:19 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:44:19 +0000
Date: Wed, 11 Nov 2026 16:44:15 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 04/20] ASoC: soc-component: move
 devm_snd_soc_component_register()
Message-ID: <avSNR0r0QAYg4YQ-@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <8733t9ntss.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8733t9ntss.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPBP307CA0010.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:1::9)
 To BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|MWHPR03MB998632:EE_
X-MS-Office365-Filtering-Correlation-Id: 321ed10c-127d-495b-d1b2-08df400aa5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|10067099003|261026121527099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	R7weA21ik52B1UfhotnE352QcJAk3ScB1rS/XJFCqaFzaq/JSEA3+Zjv7ujQIdST5zK/2TkFWoNpP1MpqTKIHYu6KMHTl603uMtHoHzQc1aEjKR1vcR1SsA9CeuK80TNgV1D1SaVk83YT8zabAumgEWtq5yf2xpXo1gGuqNRJ34OpHsmyTqSoVuaZw4uktJmjCFsEjDQKisvd4afKGGxAgJRMfgLAA+A+ghJDSGMDGriuJyN8Ci+bIRC0HUWGFXafOUbgSHsFP5JPgvxUc8akLtd5mMguFtxVIhbBlfmxthdwPPikiY12GalTR5ipI0Kn+xBTwH8ujwaHUHFTTaNhdprCXeN6EoOWoOD55D44qQYNqr3Eh7VOKSwH66oeDQaPTmFTbdCDCRIf8bE1iS6rxDYUEtJtvv7Dmzs3/wrF+coEy0PTfgVuyyHgsIZrb2jltPSUTKNPfCzBQILIGIpEac+JoNSDpO2NIZZdyT2OxkELRcGMJmT5ckrX7i2kOqrHGO5HpcrRD+7GDrB1eFdXZfqvnACeZR0EkrgSjuPMa8Ed/la+bYPLO3zqHl6KAjndG6tap7SDjKnTXy1dxWa9SbG7rVsY3Chx7j4y1c4XzJmrKtS8Y587enDiDrJqRLTFIbv8FV2B+UZ8wRcp6CwsMhLxeAvzOoKPmaz/zu9m44=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(10067099003)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blduR1ZzOHpqeFk5Z256SDF6U0lsdEorUlBYTTc0QUdVazFwc0x2b1J0STFP?=
 =?utf-8?B?T3VCU0lZZDVYWjlFTUs3bXVVWEc2TDR6ZHZUZ0NnNERqekYxOFVQZzQzdS9H?=
 =?utf-8?B?ak5hZ2gxK0x2YlVHMi8yUDF5U0d3RGVSb05xSkE0L3NEQXNPSWZ1NzhYYnBr?=
 =?utf-8?B?TDRtTE9kTHFVUmZFc3FSVXR2aFU5OGdkSGlkNWRWU1puZVQyS1paL0RENjdP?=
 =?utf-8?B?SnExUDBwUkVWa0lmZTcrSTAzMTJ3RzVoRkNPQklnK3JVVmNXa08zUzBRM2ds?=
 =?utf-8?B?cFJrMGVzTXQrOEZQVVVFZW1pM0pKYjI1dzNrWGZOK2N0cEg4Ujd4WjNWMTY2?=
 =?utf-8?B?anIwZTF0ck0rOHZvaVRFYklCUFV4aXJ0aFdxTTk5S2xSUFVKdk5rYlExZmVn?=
 =?utf-8?B?ejkyd05iWUhMZzI0bXR0WFI2bzhWbHZhdXV5S3BLN2hJUFZMS2s3VjRoSnJq?=
 =?utf-8?B?Y1RJOHhWajJBY0tLaTUrYThSMzU0YVduT0Z6dEFqeWZiZ2tQbjg2cFlvOUV5?=
 =?utf-8?B?emZHaSs3ZTRTbHNhQy9CZmthZktoRTFjcGVXQUgwNzJlU1RrdnJBbUNZS0hl?=
 =?utf-8?B?WjNYVUR4dzloMDBOcUs3KzRNMDhybWk5OWNJLzFHRVdidXlhMHlhZDlPUVpZ?=
 =?utf-8?B?QUxqYXJ4YkwvTDI3ZjlKVXJhRENtTmdlMDF6eW9WR05ITkM4dzU3UjZNendx?=
 =?utf-8?B?ck5zaVA4Y1FmSFFTSk50QWlhSFd0ZTBsZnhmYWlBTXJvaVRRcHRmQUI0bU9z?=
 =?utf-8?B?OTREM1RiRWVaRUgrVXlUSDk0NGRSS0xOcXArakNreitpOXBMUUtVdjZWZHZW?=
 =?utf-8?B?aUtLalU2WTF4citXOERkRkZGZ0lQWk9wTTJua0x3eVBrZ0xSU3IxYVhVZHNl?=
 =?utf-8?B?bWh5UHRCZ1V3Mk5UaUNKNDZOQ0RGZ3RIZUkxbzVuaW9Fb3RyeUw4QlowREFH?=
 =?utf-8?B?MXgzM2VQa1JqVXdVRW8zMm0yT1pmVmRscVpRbmFSMU1UWmt6ZlI5RExBOE1X?=
 =?utf-8?B?VGsrWW50QjJIQThod0ZEWDRYTGlRVHh6UXprdmp6RUV5RGU3MW1EeUppMngz?=
 =?utf-8?B?bGRUY3VTV0hJSWFKRUh3YXV3eG5ZeHg1V1lUMGlpSUovcEVMTThqek41dVNt?=
 =?utf-8?B?VDNoNWRKbzZIMEZOb1I2QndoRDNUZklycythRUJ5dnJHVzArZ3JPczJlQzhG?=
 =?utf-8?B?TW9sTGF3d3pQWWFweEJmb1dxZktMUkpxRHd3TlFPVHFjREFmRVlWQVkyc0Q5?=
 =?utf-8?B?QzgrSUVZZzA0SGVKZnJqendNRzBiRmx0M0p5ZEhaUFNxWU5QMXZWRS8zUXNw?=
 =?utf-8?B?MlFFK1dHT0J5c1JrRFJvOU5YUGNRYjBTKzZ1RE9IZzM3ZEptSnNmMSs3UEhP?=
 =?utf-8?B?TnpaOHBhbzFkTUY4U0ZEL0JEYk1FYzNWUDBSUS9Rd2s5VjEwUXVHa25OT05l?=
 =?utf-8?B?WXdzQkZPOSt5Z2VEUWozN0lFbHdycTI3cjZXQXo0ditNNlA5R2lyWit0MFpC?=
 =?utf-8?B?MEhoL0pxL251d1lqZy9uZXFha21aQWVON2RjWklnaGZ0TWJUaUxNNjlFeGRl?=
 =?utf-8?B?SmwxTzBDeGhEUFcyVDVVNkZrVTRRUE5pdjlnMitwSWtRWE1XN1VFYzdEOExh?=
 =?utf-8?B?VCs1U0FrUHprbU9JK091YU1ZcW40QWM2L3FKZ0xnUVVRNXlmZlpBUVBlYXNt?=
 =?utf-8?B?N3BscU1ZaUZzaDRzYi9VUGlWRC9nTU1zcUs3VGtxSzFVVFFlWDFTNDRSdUpB?=
 =?utf-8?B?QTF6dTB3aCtQcVZKYkp1RG45TlVqOUZrVDRsK1VHdWZmQXZtZGZKcUpWencw?=
 =?utf-8?B?aU9GVHEwb2pFeWRWRkN4QnBMaWpkRjFicndwVmwxbzRCdFhwNTNPdVhGblNy?=
 =?utf-8?B?RFpXdGFTYk5nWlc2NGFhTVJxbGFMdm15b25RTEtyNy9ES2gzRm5pdTJlc0Jx?=
 =?utf-8?B?bHNpbkNyN2wzMzFYalAvTlE3TkZmbVVwRC9VaXFGMU5aa2dxQnB1Wm1qVkp0?=
 =?utf-8?B?TVZBcGxXaTNNWW5TUytqdm1CRXJWZW1nWldQZm9wMm9kclllenBGZUFYZmx5?=
 =?utf-8?B?Q01KZyt4RnF5NWZMaTJuZmF5Z1o2d1UzTytsbWxja25xZ1JORjlGcmFRNVpx?=
 =?utf-8?B?Ry9zeWpDZEZxTkhRc0ZlT1RianNrcDNqVVREOGNWM3AvUHY1UVMxQWkyMEtt?=
 =?utf-8?B?Njh3UmtaclpFWDBOOEEvd0NJMmZFdVdYbXo3aDVmZkR1UDZ0L3BTN1J2Tktm?=
 =?utf-8?B?UEJTUDd2RWJlVlQrWWRRRGV4UmpHcVRvOGx5M2ZVdWZuYXU2UDNtWGhnenhn?=
 =?utf-8?B?Unhva08rcnpwOVlrZFNCYm5TSVhSN2xaL1VLSlVFaVpsSDVjajkydz09?=
X-Exchange-RoutingPolicyChecked:
	sq6TpER4gEfF+Kqfv/nLlzkFTkIigm8Q0n//zdqRtVjOnLbzz1oqccgQvB67llWxojG91l8EVeqE/44VB8ijvjf32EYrO2Tzmei3nbHZeLoq1hmGI3CYPe+9JWqzCKk1/bjc3aTVp/NiR8qcuJubzEreZdQrRNFAQRjWYmXZ4Z+TFziG8oXIesHkn2Zv+iFMvU+KN8zOKuCnEhgNu9DZwWWvBF+89a0JM044LNJhUCs+htXo/+W9hy34Z8pEjisdlZeZq3P4GKLC/ubIYDgOhQP2X0qE3aqmFFjxAIbllS9fIVSoeCoxmU5OkazzdNmabiO9Y+wxbg6gYyIbp+2w9Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321ed10c-127d-495b-d1b2-08df400aa5fa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:44:18.9835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JL1YO1nriDDOQwUf4+HJqw8+2xBxhGQwDmAGWGHINYYmFmD2oD8B6gpC2cbsFC4IK23hY1lIlSmsc8tWyszRT6ALaZb7OjSpKuPE6BgpjU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB998632
X-Proofpoint-GUID: aVQJ_rlPKghUDKlueMtTOeO9SbHOY0WI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXz9MShB+ibtHY
 4MG8HSuvsuvy/aNM1lWP7/EHVnlksToWDKIDKP2GpN+/6JM4wjvyHfrTwc11HZbiUuRQRJzUzK9
 wrLyLswrbjoHYbZKOjANbNRgjZ7M53qOSOQT+1zdJO4u4Rd+b+NC
X-Proofpoint-ORIG-GUID: aVQJ_rlPKghUDKlueMtTOeO9SbHOY0WI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX+RMGzjBNGk73
 zIbrqshhiVhI9xIu0runDGm/u23+v9Hob7OxiRqQKkeMm9pE1qD+CYNbpsypvCxQclg3rr0t7Fd
 4VJiS59GDKJR8an43DYUJubUd8ktnaKobH9bCy26Ni6JbbIhjCBtcSipxteNpAjm7ITKsaCv554
 J4hLtmMdileqLm8wGkOKGupEfFjGX609BQYo1YWa2rFC/rldc/KMykFCgXrwPDWTvedp5WEPcGx
 64p0nPQ3WQ4dn02+HMr/FLD8jM6VK1GMORoMdAhbWjqEavThDwOwOpZaX9aP3WIvQVLsyC+xFiq
 2aQ65dDJQYGxa4CSBjyWvWdnI7/fjT4NjA0y76wM024wOadSMPSQW4wF0Nn+j8NQcN8xMtZDMOv
 5MFYNeUN0mSfMyXptugiJ8VaO6aL1KbYbaTMzM47HzIIgaNp+uGeROi/jVPWthEisZgUePpS96a
 dvKFlhYVDgppuUzy2Rg==
X-Authority-Analysis: v=2.4 cv=fcc4WEQF c=1 sm=1 tr=0 ts=6af48e0b cx=c_pps
 a=PWz2vMGk566g1z9MD32Dlw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=3KJ7hPrX1tNDSSpXURkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:23:48AM +0000, Kuninori Morimoto wrote:
> We don't need to have component related function in soc-devres.c.
> Let's move it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  sound/soc/soc-component.c | 40 +++++++++++++++++++++++++++++++++++++++
>  sound/soc/soc-devres.c    | 40 ---------------------------------------
>  2 files changed, 40 insertions(+), 40 deletions(-)
