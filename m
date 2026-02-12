Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CC8233704;
	Thu, 12 Feb 2026 21:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770930949; cv=fail; b=LeCe0CHFk3rFlhrTghTBU97YlaTCY0deOAlLK2MFLYAUY2xnTWV6wU7cOXK6KeoaAE8ZBMcI3GJ/fyt+fAKyOZgpZNY+Zj6PENVtZ+1QKu2688e94R3PQakbO6R8Hf55t5x5OW+8KdBLTVF2TR0gpRa9jjOAX0Cl48RJaX1RdI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770930949; c=relaxed/simple;
	bh=ik8bVQWJcZx1mBpLkdqNmGxtgqaEhhZmsa/fdQlmwlM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=PDqrW78pylYpDiyYOp0l5FojEWiFl/KvgYLS5PM6s3Zoxw9tPSIVl833EZE8wmf1zoXMR9P5sFeouw2loPZWqnRxDdu17T5VpkUDuArTJZbH1V2wFg/H4YPWGtuo093LT6SkubmyWoHrqfmx/hWgYbLOCFPeDRKcpPm5SkarIwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=k3XC4/0u; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="k3XC4/0u"
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CJmAin2681613;
	Thu, 12 Feb 2026 21:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=hNYknHZ
	/XudK9V4Z6qDtUhfxzDs7Hy3IUT6XuCYtVqM=; b=k3XC4/0uNERvMCsfljW37fV
	TPExKnquB1mM00pJoriELlQ61nqmJyD7w1F1ILJRalV8jfLjinU3M64XcVfN9y+z
	S3yJMGcwmAp7+rnfgjiOQ7ZeR25qoktlTzo0TKX1/ZQOfXe1ClO4mPpzqmL0QdQU
	v3wz/6lHEsVwc6hq00lMlhVPqD/tD6oxk/IR4/YK8muSBIWjPGwlsL5JRZ0HnZoI
	GNXRYkZ2484hCQUWnbbeW2cf0EChfELMCgELiMXQLGcgkQU3frHGMHvgKJc8YHBI
	Kr8NuwoxsVNIGTkLoEHNWHQBiieZtOrGa8leO0zUe/abcUnF4iZ07HOd5mo+bFQ=
	=
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4c610w6650-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 12 Feb 2026 21:12:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vucPRvdeGuuuGRmyiUknNDaefGXWh0Ro+ve7VZIPXSn/ToKQMLE13E3wLKTrHaf2jsyapeSWG4oMsnEFq5EyWeG/gFFr7RJ01BJ0hZABPGLtDupM/yzp1bDd6FZGxmasWKFomIQ9QE0aDMUZo8VsOkbMc/c1Bi37WT+Drj1Et6QwoSKV4+ux9MbtxR0BxT3xUb4n6qq8Z/ro5q96NYC/q4thRP40HLspFwUINup+qlxBIjTe5R9eFfOZ+K/w9Uv/xKaYQuX25wEZTwxFE/RnOpNDLyh1aPrG4yWT0TbA2SweydUSmwheShfYtIw3CzOmbBx6m+9QbERFV0oc6vcFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHhbioMeoF0z9m4agRCTfs+SZcOyyHPng+gckuEAVhI=;
 b=LxauY5nMvlB0xPfzCVoxbiy/o0MjNUxP7+ZVSM8sUx6/QgsxhjI/CtN07AzDx24hICOYVtKvJVlgH/x5KGuS+b537KElGLhEdPDLBBwB4f80Qco4Va0K+SZyr4W0odmLG9eOflU/ymRz/yAXIsLCXwFghHacdE4COlocf0WNnDccFaOsKduo6X+gG+cujkIzFEfT2Hlr+NvOMg0+dRLQ/NLdtaFs7cJFL74n0r6GEMTl/rDQ8ROZjrXThjLU6aB2/L8N0C95hp0l3OSkrC9igxHL8o6iKgOhlJGFGUJEleOpLocrNMdDtKwHIzYXo5iy49eE8bEusGpj0wBw7QgZ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by PH5PR13MB7684.namprd13.prod.outlook.com (2603:10b6:510:34c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 21:12:44 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 21:12:44 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Richard Fontana <rfontana@redhat.com>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "clemens@ladisch.de" <clemens@ladisch.de>,
        "tglx@kernel.org"
	<tglx@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kate Stewart
	<kstewart@linuxfoundation.org>
Subject: RE: [PATCH] sound: drivers: opl4: Add SPDX id lines to files
Thread-Topic: [PATCH] sound: drivers: opl4: Add SPDX id lines to files
Thread-Index: AQHcnFPUE8nzbjqDNU6ELegYd9deIrV/cviAgAAWNpA=
Date: Thu, 12 Feb 2026 21:12:44 +0000
Message-ID:
 <MW5PR13MB563268BC53570D4C8D3ABAE6FD60A@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20260212191416.3723397-1-tim.bird@sony.com>
 <CAC1cPGzabh8d0MQ52d4iPfWdVG731Js8JmdPhu_dMOx9kOt5Ew@mail.gmail.com>
In-Reply-To:
 <CAC1cPGzabh8d0MQ52d4iPfWdVG731Js8JmdPhu_dMOx9kOt5Ew@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|PH5PR13MB7684:EE_
x-ms-office365-filtering-correlation-id: 2e8eccf8-0558-4412-c48d-08de6a7b7719
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WHVTcWVMYkhxQzdoU1RNK1FpR2FHd3VJN3l2eGxmd3JmelV1ek1nSEdGZG9a?=
 =?utf-8?B?bVJ3T0lOTFcrRUNpSDRYcHhybjBDMEYyM3dzMTVoNUZaY29DUmE4MTFRNjVi?=
 =?utf-8?B?QzNJUEVBS1o1Rnp0dElRQ1EyaXA3aXRuTVc3eU5nZ2JJS3hyRUx2enIwVFo1?=
 =?utf-8?B?aTZPdXJDbDRIRUFyVXlDbXlZdGI4UTEyYUs3R09rUlB0UUJDaVFCRndQTXl4?=
 =?utf-8?B?N01UL2c3OGh2Wkc5NTFBRWFOdDd5YTBXbDhCTzhxbVBCS0JyZVlkdDBKOVdw?=
 =?utf-8?B?ZHJvS0djVWRIZmJQVE5zWWY4ZXFzRVYwRldMRXB5SUFTMWd6VFVHQ3RuaDZY?=
 =?utf-8?B?TFJ4UHloZytKclU3UW55UWVKcmhhMHM2RXhZdzZ3RHJEWmN4NzhBcmVvRUxC?=
 =?utf-8?B?aFlWd0hMbkxLZzhRWmVRQ1Uzb205Q1dhSGMrb21CdE5FbERiTlVGSEpoSUI4?=
 =?utf-8?B?QXRIYVkzalpMMlh2RkJtYVpBSnA2cGcxejI3OWU0Rko0NDgrdWxrNnFGNE1E?=
 =?utf-8?B?OXc5NjZXdHYrZURMOUFYK1dabElSNXpzSDhoUnNweGdzeTVyS1JPYkJlbnE1?=
 =?utf-8?B?ZXdqQXNiMVk0Y0Z1SmFTV0hsY1g3TmtMS3lObUo2UGh1MmZsbkROVEpnbHA5?=
 =?utf-8?B?a3hXTFIrV2RJZExHMkF0cFVtYkZJZmttVUl1d01JbjMyT0lHaHBKY2hLRkNP?=
 =?utf-8?B?SFhldzlKd0REUjlLYnRIRTRqNDVwakJldWtQRmpXQTNWaVorVHh0MmxqTkIv?=
 =?utf-8?B?RjI2aXB6UTBMNjV2U0FBSkRzZWUwUm5pL2RrVjMvUEZnaW1wL3R6eG5EQUNh?=
 =?utf-8?B?bW0vRVl4WWNERldYWGJsbEdxcDBrbWR2WmNIMWpMZVFseUV5cThzdzlWaUJ5?=
 =?utf-8?B?OTRWZ3NnaFl0dWN6SlRpRERGeVNFRUdrSXNCNk1La08zSjc5M2xGK3RPR0tC?=
 =?utf-8?B?MUwwNTluNFdyaU1iR25WSjlqN1FLUEF6eVVRZW1OQ05aTThBdnduOTdtV2sr?=
 =?utf-8?B?WGd3QmUxZy9ZOWVQaE80UTQwb05zcE1WUUUwN2VzS2hGUWRKQm5acXJYNlpF?=
 =?utf-8?B?d3dsR1RGSGtiNkFnWE1tSHo0cXNwb2k5b3ZGR2dYT3pNKzU5c0E5THA1QnNX?=
 =?utf-8?B?YWEyQXR3UlRjV1MrZzQyaUZERTNKOUt3dkJ6enI0OFVMU2ZzMStpT2tEZUM3?=
 =?utf-8?B?aTRsNjBReGR6NWcwcS9JdHdUdSsyRldmK2FLWTVQeFlHWmFnd2NvMVQ1alRl?=
 =?utf-8?B?NGR6N3RyaFFxQTlPVmFZVHhrQjUwUmZJS2dyaTJyWW8rSnBubHhMSmxHL3Qy?=
 =?utf-8?B?dDZQczVGYllLL25uLzVLQndvaFhUdDNWWWU2R3NPVk0xVXlOVWFqM1hDUU5w?=
 =?utf-8?B?R3BsTWVxVHZUSFcySzRYSldrZkNLT3dmRjI0MEVKYXhBaUJaR3RmTlJRQ2lp?=
 =?utf-8?B?aDRxNitsckVEaU9kS3Z5b1FVMjk3VTlIblEvejdnR2t4TGRoQ1lQdDRGRDZt?=
 =?utf-8?B?YlBpOXNZV2ROSktpeE0wa1BDNHlXdmZSUmF5dHo5SUhHMG1nOEtxcTJRZm5S?=
 =?utf-8?B?d29tVjJSU00yYW92d3JyQlN1VUp0Z1FkUTArWGJVQ3hPeHJwckdBVVJlMnhz?=
 =?utf-8?B?cEVURjlObWRwUHUzc1VaR3pTbStlUTR2a0UvUndrOEJMUHV3ZU5iZWkvZDNB?=
 =?utf-8?B?aGFaaUZ0eUxIWEhsU2xYMlZPNnFKTGtyV0JsSklGNFVIZ09vTE1xV2c2KzdX?=
 =?utf-8?B?UHNxVnkvWGMrQmtmdm9CU3c0bVUwZHZlblg4TXZIOWY3NTI1UEV1bU96NXFs?=
 =?utf-8?B?a0RBVEt1OUxBQVN3dFgwcmNvRE1nd0dNeUZPenE3OHY2QnlUa3l5a1prTzdW?=
 =?utf-8?B?emxmN0hlQWlWemZTODlMUkdDUmIvZTY4UVh4L2ZEWWJYUU9wL0NkQWJUWDFs?=
 =?utf-8?B?OWFjUU03TEluOTRYU2lZLzhUZlVRb09JclFXVXNhVE1HbjFlbGZyeGx0NlJm?=
 =?utf-8?B?dzRmZW5UNHo5MXczWkdJV2N0TlQ5SUVKd1kvZTd5UzFMQ3dtWmRoZGhXaSs1?=
 =?utf-8?B?VmJsRTR6NndoNUh4UFhzbEJUKzVRdDZaYStMaVI1TVBuRi8wblRteVl0ZjEz?=
 =?utf-8?B?eUFOTU1YUEduU1F2MjlkK2phRUdIV1ZaUkZ4Q1ZKdUZSeTVYcHRUVlhDRmky?=
 =?utf-8?Q?33XyJmqLq9xLsdBJXGTLh1I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmNBM2tQTGtETG9HTDFZanFmaUN2TjJ6eklkTW16bWRuRmFUalFaTXZTaFd2?=
 =?utf-8?B?Y25GUml2dWprUUxQTUU0NnlLUW5hbXR0MENqRy9ud2VlQkErQ05tdmx4S0k5?=
 =?utf-8?B?NTNiT1JWd3ZKTGtmNFhTZHRXSWpxdjE4eHNrZ0JQMWVjNXQ0QkhYNkRsdGRU?=
 =?utf-8?B?SzdmQ3czb1M3eFJaMkpOei9ZVmlFRldKdkExWklYWVM0M0FYWHJWSDlDdVhi?=
 =?utf-8?B?eGpmeFdPdHVvaDFkaEk0K0drSUw3MHNnK1V5bDVtcUtwTndKZWxBc09GTGI1?=
 =?utf-8?B?akVEMDhwZUNyc1I0dkJxclVQYzJObzRSUXY0UVdKdnpoUDRNSHJ6dUp5TWtB?=
 =?utf-8?B?WndRcDAzSlFjQit0cFNleVV5VC95aWVMaFplb0RGMVJZMG0xNGh4emVRdk5Q?=
 =?utf-8?B?bUZhTHhhdmRQN1FIVnh6L24vYTdXaDR2aWxJYzBpbDNPS1p0VTh2Vm44cGVY?=
 =?utf-8?B?SDFJWUZpUzZyanhxUjU2aWkvaEZqVEJ5MmtTVTBNOVdJNE9LSWJuTVVHQ0VL?=
 =?utf-8?B?aWRSYkFLbDR4enhxeVg2bHViY2ZHd093T2w2OGVvVjZGUElxeG5hN2hwbVFJ?=
 =?utf-8?B?K0VsWFBhd2hMUE81NTEwWDIwZC92QWFkNnpMTWNlUDgxSUtYY1lJcG43c3pK?=
 =?utf-8?B?eDhWTDgzRGMrYm9RSGNTTUErWDdqbjBHUjg3WnZjZi9WN1pmbmRzNW5kSU0v?=
 =?utf-8?B?cENWUHBNNldLa1dBRExSZ0hvVE9HdCt6UjdpRGR5WkM0U1pRVHp5d2NWakRu?=
 =?utf-8?B?VEZGek1QS1VKNzAzSDk0ZzY3Y2ZITnFzUnBUSTlYK2N4Uk03Yk9nQTJHczBp?=
 =?utf-8?B?WDBkeGJpMmV6NGdobHgxRFlSSk9MYkRSTVRMNU94eVZpSGpIbE1RT1F0Si9q?=
 =?utf-8?B?eEh1KzY3QllvQlp5U3E0a2t0Ny9yYm5LVGt3RFJkU1VNdVNxVGNPOG13dlY0?=
 =?utf-8?B?TURiR1I0UW43Q00yR3ZlZlVjNU4yL2EyNElmTk85NzY2TFNvcjhYWUZ3eW5B?=
 =?utf-8?B?WTNPVWhSTWd5M1ZCeW5NNmY3V2xKR0p4QmlQRExnQ3F4WHNXMEhwL2Z3K2xD?=
 =?utf-8?B?VGxoNm9JYWFvZG9mVjQxYnFpaGxwbFppU0VlWHNCYm9pTUpMZnJUbEtxMHRG?=
 =?utf-8?B?YlhZQkJWU0dWZnFWS2tmUTZCOWg0RmRMbFIwMytxQThtMEJTTVZ0c1Q5UzVt?=
 =?utf-8?B?SFpJUlg3WGdaMGEzRmNjcFBEVlBPRE9VNHRxMXlTZHJycHg4V09WWmFtRENR?=
 =?utf-8?B?MCtzbzhsSUZEeEZoWkd4ZUx5ekg1eTRNcmtPZHBNNlppd25CcGRUSUxYVWdh?=
 =?utf-8?B?aWEvaDFzUUo5Y2I5dHdEZ3dWeTVRdGNnSHJPY1R3QXJHbTRhQ3hkWmVVZG1B?=
 =?utf-8?B?L0N0YWJGY3JaTzBTU1ZiMUcxc0tmT3k3dyttMGl5MG1HTHBCMTBtUTVDSndp?=
 =?utf-8?B?OVNKbkc1RDllUXFDckpOYUIwMVM1aW1Cc0NFR2lFS3hYUzEyVFB0alBwL0NL?=
 =?utf-8?B?Z1prazZQSGVHdDZlY1FrWG9UMjFFMW4vc0dZZEQzcHlNSTF2bmt3c2xyZmlj?=
 =?utf-8?B?bnU2dGFFV1Z3Mk1BQXhuUmhqclhBcCtmSW4yV2dPSU1hVkEwVndXeHFsV3ZT?=
 =?utf-8?B?WGw2QzlUakJPTkhsSGVvZS81czJlVUcxdFRHdzFLNCtXam9tUlZDNlFvY1NU?=
 =?utf-8?B?YTdOWDlMaC9JWk1GSXE5QzJZemN4ODl2K21sZUh1c2ZkNCt2aHJmR05EWk9t?=
 =?utf-8?B?cVNRODI1U1VkYlluQjVDMHNaK0I0RGp5VmlSTm9lTzhSYytJeFNzaHZmQkZp?=
 =?utf-8?B?L09PL3E3WlBtWmZiWkxSR0JsejRHaWRYVm9tM3VQUExlNFFvaXZ5M01ZNFln?=
 =?utf-8?B?c1ZGdTNmVjNZZ0NzMXBKaFAyTWZzS1B6VUk1aDJvQjZZTmRrWkJBZk9LY24x?=
 =?utf-8?B?VUlBTFF0My9FZUg3V3ArMnB5U3NxcWZKSUFUcFNIVzNpci9BUk5KNStrbnpN?=
 =?utf-8?B?Y2FIczBqeDNxZkVpRkNQeXNoeVNFV21RU3NJL3BlV0svYVhRVkEzaWdoNnFT?=
 =?utf-8?B?bWZvM0R4N0RPQVdGU0tvYUxOcnpNNUhMamM0dlNtTzFXUVhsRFlCWEVrdzh5?=
 =?utf-8?B?cWhwUFA0TFFIbzVCOEFyRkU2emhoaktDeDZiOWFEQ3lRT0ZFaFhSTGJKdU9K?=
 =?utf-8?B?SUtmMmlCd0J6ckFmOThwcGpsaThtQmgxUWVPbmJXTVhnVEJjMFBmTHRIMWM1?=
 =?utf-8?B?TWQ2amxlMzlwTHU3U0pERm1LUFVCNXVySHY5R0tEQy9uaHN2Y1lKVkhtUWla?=
 =?utf-8?Q?BaPoCjF9oW30IpuDRx?=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rExNTrw2oL2GKJbn54MnC8b75FpZYRnPvuvJwF20AqaCWhm6+xOy6Eq/F75C9Z3nC9bh7joD6vhMSrzM5QEVYM2PfIMJaxcp7biwI4uOPWfB/r0ybgNLg4qZJfz08usMECSGkd+3Ol66KIPN5ChK952Yo3TBRrUbvnySTMkuf+RtVrsW1gOZKOXUOEfzOI1DevctcFGS6TPiDSQ45nqIsPOTJMzmVhT3dJIEuKXEUfnu5qDuiBPXhC5x7tGYs9NzErWPP6zYIQIGptN/kkl5CIwG18yDok6JTHHG6+DpX0HTu6UDv9xGDsisAni0DcgC5fN/n1s0EtyYcJbLUPTwdx7l+GrsbRa1oe1SP0rhpW5mlwN6b7Td4xh7BNFvRS9YlvRSX37fBK5Z7UUlAqvApRS++BY7C7fiDteeMukvPVh2/E0+H3xORITL8/8z55Q0CQ/jKcs3/AUjaktnBBE6EIuRPBvZEJsS4KQMnQDYe+MWgQhGGv88PDSbbXMWe7kXY/aO7ER1swz9QRnBMs5P0DtUSLFI9mcJTGWo3vVMWNGINEsuinS7RomERAblQelzeA2Rf1OT+0uom7SH7boCvUt5b1m+1sOVb2ba98e4NZO4Ho88awUOMFpVMHLzLE3e
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8eccf8-0558-4412-c48d-08de6a7b7719
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 21:12:44.4297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /1sLhzEbVzdK2v8FBZxmX26RIQawT4k21DgsUl0yFbtvPwERZEvdf0EkxiyUk4/PKwdPXruTBNKXxmg3cnfsnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR13MB7684
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EN4LElZC c=1 sm=1 tr=0 ts=698e4250 cx=c_pps
 a=Jpon84a9jUr9T0N/wBB0/Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=24AZYWMyAAAA:8
 a=20KFwNOVAAAA:8 a=z6gsHLkEAAAA:8 a=NEAV23lmAAAA:8 a=QS6xa2zXLYwL0NnhP4QA:9
 a=QEXdDO2ut3YA:10 a=bG88sKzkDEFeXWNnvthB:22
X-Proofpoint-ORIG-GUID: w603Ifwttlzxwk3gTfXElhO-GqweCC4L
X-Proofpoint-GUID: w603Ifwttlzxwk3gTfXElhO-GqweCC4L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE2NCBTYWx0ZWRfX4dKj4x2OKc/T
 Q+8YqWNRWQxeV0ns5XQukGLxwK9md6tkqHTMvH03yygROT/Ud+kf+wwzAGKDrpRGAQnX5AofQD4
 w9ScJYPrG7Z7eD2pr4ybKiU9ZYIJfFsPp/Dnuh152oi3UDyz3KWrCEjh77dn8xIQL7LG2rfUeXo
 fuqv/gXfEoFsYJI0NmW5pWQ18XDpuMXdxKUv3xpBuGkxw+kLg9CxEF7teKLIJkLB5mgNwj2dvP6
 jIJlBbCCgVxcN+ClwfOCPgLubPm72eZ5ckJCsyZz2mxfIPzM4ZMI2EC2+6rHX37aXT0vqP73ItK
 q3l/FH6qZVoK1ckPoKSfK6zsvkRtaMoA48t2KZAz2NOCHJ7LW9KL3vVOBmuBS69CbcGaor2twtD
 Oh3RaXNJsRmBPMC02zEvdRHYwxchltNiefgw/QSb9r6cc9MpTpES9cCbIl1cLP2oaKiXAoVLuVi
 5kiaQXCUtbYrU/GZN/A==
X-Sony-Outbound-GUID: w603Ifwttlzxwk3gTfXElhO-GqweCC4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01

> -----Original Message-----
> From: Richard Fontana <rfontana@redhat.com>
> Sent: Thursday, February 12, 2026 12:29 PM
>=20
> On Thu, Feb 12, 2026 at 2:=E2=80=8A14 PM Tim Bird <tim.=E2=80=8Abird@=E2=
=80=8Asony.=E2=80=8Acom> wrote: > > Add a license file to reflect variants =
of BSD licenses, with the >
> first variant being a BSD-3-Clause license modified to > remove clause 2 =
(attribution
>=20
> On Thu, Feb 12, 2026 at 2:14=E2=80=AFPM Tim Bird <tim.bird@sony.com> wrot=
e:
> >
> > Add a license file to reflect variants of BSD licenses, with the
> > first variant being a BSD-3-Clause license modified to
> > remove clause 2 (attribution on binary formats).
>=20
> > diff --git a/LICENSES/deprecated/BSD-variants b/LICENSES/deprecated/BSD=
-variants
> > new file mode 100644
> > index 000000000000..83f24d68fb87
> > --- /dev/null
> > +++ b/LICENSES/deprecated/BSD-variants
> > @@ -0,0 +1,32 @@
> > +Valid-License-Identifier: LicenseRef-BSD-variant1
> > +
> > +Description:
> > +Here is the "no-binary-attribution" variant of a BSD license, numbered
> > +here as variant1.  It is a standard BSD-3-Clause license, with the
> > +condition removed for attribution required in binary formats.
> > +
> > +License-Text:
> > +
> > +Copyright (c) <year> <owner> . All rights reserved.
> > +
> > +Redistribution and use in source and binary forms, with or without
> > +modification, are permitted provided that the following conditions are=
 met:
> > +
> > + - Redistributions of source code must retain the above copyright noti=
ce,
> > +   this list of conditions and the following disclaimer,
> > +   without modification.
> > +
> > + - The name of the author may not be used to endorse or promote produc=
ts
> > +   derived from this software without specific prior written permissio=
n.
> > +
> > +THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND
> > +ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> > +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE
> > +ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE=
 FOR
> > +ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> > +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> > +OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> > +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, ST=
RICT
> > +LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY =
WAY
> > +OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> > +SUCH DAMAGE.
>=20
> As far as I can tell this does not match an existing SPDX identifier,
> though it seems to be pretty close to `BSD-Source Code`
> https://spdx.org/licenses/BSD-Source-Code.html .
> Might be worthwhile for someone to open an issue in
> github.com/spdx/license-list-XML to add it.

Thanks very much for the info and suggestion.

I looked and didn't find an existing SDPX id, so I ended up using a
LicenseRef-...  ID, which is not ideal. It would be better if there were
an existing ID I could use.  I agree that BSD-Source-Code is a close match.

I did a cursory check, and found that this style of BSD variant is sprinkled
around in other kernel files as well (at least 10 more confirmed, and maybe
up to 50 based on grepping without closer review, yet).  So this BSD variant
seems to have been popular at some point.

There are a few (minor?) wording changes between the different versions,
mostly having to do with naming the author or organization to exempt
from endorsing the product.  I'm not sure if legally it matters if the exact
entity to exempt is named or not, or if "AUTHOR", "ORGANIZATION" or
"CONTRIBUTORS" is sufficient.

I wouldn't mind getting opinions on a few items in this patch:
 - use of LicenseRef-BSD-variant1
 - my plan to have a single file under LICENSES to handle multiple BSD vari=
ants.
    - for example, do I need to list all the possible named endorsement exe=
mptions,
      and somehow preserve them in the SPDX-License-Identifier ID, or can I=
 use one or
      a few blanket license texts to preserve what's needed.  Note that the=
re may only
      be a few names of authors or organizations to exempt.  Possibly, the =
SPDX matching
      guidelines will cover the text differences that are present in the ke=
rnel.

A broader question is whether the exact language of the disclaimer needs to=
 be preserved,
or if highly similar phrasing is sufficient, without needing to duplicate e=
ach and every
disclaimer exactly.

Thanks again for the review.  Now that I have a pointer to a closer SPDX ma=
tch I'll review
the situation, possibly ask for a new ID, or see what the SPDX community th=
inks.

 -- Tim
