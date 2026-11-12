Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794488370;
	b=5o3T1Q/Qm/jnts6CDh0d+lZ2e1Pk7YfgJ8RB+08BlzNYcH/i6aiUuCUyij6DDdSuBjuC
	 MZdq/ldo1XJIiFm6Yme1d07IIdqL2yAUo+EHZYGDfsBxtHgOTp4zUaxiF3YXDvLHZVM3f
	 1tA/Y5GzRNUzMzrH4Ljy7aXtTIldygtgVInzN2Y9JAWiBx7RZNaMmuMZGTLz8Rtzn1x7c
	 8U7OyvPsqyAgme9cPh1e8njuD2FV+KXtp22Cb9bptRuOfnmU1BXbMZT5zUVhMTZB7RoJE
	 hrRfr7SaK7Bg5Ug9BEr16coapAmD7EW/HIHQSRnlUCWv4IYi8xr5R4IsqkjsTtreKzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488370;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=16bep67TLQblbmxW05ZtaIN3dRjIPQm1Bf8cvWx+XZI=;
	b=IBI/R0NlmnUuTLh5axlfhrod+Va7RiXyGe/r0kPFRcmtSwqVCqrAkwoW8LHMl1kVA6It
	 G6fcuXIbZvu5tHTBDueFxvXJ0hPP5vNmtcQwgZZkcyezDkm0/gZmPadVFIrCd1bUAWPY7
	 lCVUK3EKVSUM7H/4EK7F22ktvp+7Xx1LduczBJZe3BsZPpySzpfI+SHo1E9k/xii7CkvW
	 yOlMHoUWU6waUzP3uDUTgz/es41mrtXEpeaWlLGjYWCM2vyfcqGYa0v0MIkV5xax2n7Ib
	 Fw5txtnSOw+PFFHvpbgrW+Wg0YmPUz1SXRhHctDVROvhNmzkSOYRvy1aNXIh/55FSJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=rtGNrrW6;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=qjCp8CoO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4616606A330
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4616606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=rtGNrrW6;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=qjCp8CoO
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAGDqN1914700;
	Thu, 12 Nov 2026 07:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=16bep67TLQblbmxW05ZtaIN3dRjIPQm1Bf8cvWx+XZI=; b=rtGNrrW
	60pnBJvvWhI8oeJCiWjdIfdKUmzEpwN8uG7EvZPacimJ7Z65GkVdftJUInav8fEq
	fHIEjcVaCC7S80KC3IScoKR4rGze5pBJxxUSjuwle7vocrHHz9Lw2j3WphQCJuF5
	MstExFdkGx19I+WSP/LiqladGMajDkmdxki0YPBtKcQktFhJpLo9Z+/X6sqEubdf
	W+/u3cHHoeNuyp3GFTDmXkNMSUsTRl2uwPQK1Jab8icjc6kw2OTwOfx7cODzcLLa
	z1gpMOY+QNMb88KQVS2pn2zZEKam5Y39PFiTOjjeF51pBh9ZEY3/OohZvyYyloVm
	O437ja9ndIVImLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=16bep
	67TLQblbmxW05ZtaIN3dRjIPQm1Bf8cvWx+XZI=; b=qjCp8CoOrN3qu9amKu/H6
	DztbiIjxay3OeQ8MlY+iyGnyxbl6fdvFLL218Ybb83Zf8YLblwP7w2pLw00QyotE
	W+kkIkCHWj2+56Qc5LCYr+6aqQ80TFC794yKcMHlUlP8rhDen+uz43pvMpf/+lGt
	gMz9BSPW09jcRevYFf1pLvOG4eOorouPzAJOvZrdSYYb9IT00eBTozBdZ5+qpxCG
	/DUZMZg+25mlxSGnYQi5CHUDycBUullOeDqukDhhX061ZPXkF4QEkbkVKdIqYhAr
	/b7sQjOcfkGvJURPb2xMX+SjPGNXaK7n4RypD7oUg97o+o7gOtMcQYO3xzLeAVDN
	A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvhw3gjhy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 07:59:23 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxBqJMrj/bdXBJXwpCeNZpJxRU/gHknD61R+ZJ/5sIuvstPs6tmF1FXnu05lrpecjXHj3GfhEM7lGH5eTF2vLLFOEi2CM0TM7Qbvs8e71fzVnpcgyDNCAVgTZoAp9fK2fgMUDBkfTY0dY7L+SNr7r7mXXLiyc4/5rLirPwN/7R1kTARsz0JzgyR45ByXgxJwnA2ipaCQVfktoPDb3+5r5WOe4q1vDeAhyy75R0oR4C0AVsRdvNKQxuFq98LrcsgGl64VZdBXJnnC+BYVYVeaSaQvmEm+C6MySPU4lUZKfGe8He+aEBnvTTUkxs+o4somsmzpzX8+tuYIKWAjRWceyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16bep67TLQblbmxW05ZtaIN3dRjIPQm1Bf8cvWx+XZI=;
 b=QtHxOQ0UGDyz9PYd/obioBUFv5uuwgLlkW9BPbxN+M49qLNDKuIiCyB7isP8FGBCs/QH7Y2rwLk/M0O01dbLrudsJDQ5mDXjGAvr1mxFjk5No+QBkAbkYbDhNGGyBcbc3J08eg4UhpQjiJzX7lEzZslVZLsobIgET7SJYetlYF6A5apCrLrPsfqcA9swhKm8XK1p2P42p4JaK2UFbAnneTgE/XFgJAalt+NGju3dSD+xUbFTeI3PDbLrsoJ0nNJm8QDU0LMzgZ3MpOjvfPFRecwbjXWPt8aGlXOFxs5D6hX2bAWe4SjlnYaAArLhsxmosCfIDVfcTJlRNXTCDVjuVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by IA3PR03MB8476.namprd03.prod.outlook.com (2603:10b6:208:546::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 12:59:21 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 12:59:21 +0000
Date: Thu, 12 Nov 2026 13:59:17 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 08/27] ASoC: soc-generic-dmaengine-pcm: use
 snd_soc_component_unregister()
Message-ID: <avW4HRj07s32svNx@analog.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
 <87o6bu28ko.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o6bu28ko.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: BE1P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::9) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|IA3PR03MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 45db7efb-ee99-4f2b-5986-08df40bcc485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oBQ8f7yj8DwT6xLH9HeKuzW3gJsX1YXvQGxSEkgaSadEbc0IiJenumZC/wGhF4i4baXjRTITI0MaxfLht+960klBotrGXwiRSYwtaWr6WwpBl3XJZs322l7qmN4hxIJAl7uwr9/zKP77SY1lwUUFBYijnXfsiqgXterAVwp3oMeni8cDTLOyMcF5Xx+q1qKvNRmUdYzOD2jKRQ2pDl14Koz4F0N//uz8eAy1VNx2U4xa/anU+sS1/UWyjvdCvX+bQJ1a62WAYndcPamGE9SSTSQiowbwa4WrY+GydJMXYkGGhzAFogAwHSzz31Auo+v0hsUlq/2lWJpBw0bZL0RfLG/85o6WpaMUHU+sKrw2JnL97w5oKO7SKh2ji5zrWaGvxzR/Qi7WM1cOtg2ZetmRch5tUQ84o7hpesc9jRLZp3FJWR6DwDF+gq5S04PwooL4Bmqc1/cQgv19r09FG2oyuPpI3j6gecufvOorYgqa9JtX+2ZbvX4JI2JZtmeBICQycfS3P7DdXY8nNPY3CH5jIF3AO+RypC1RxjlnsWCvtbAp5x2jJXf4LFUFo0JbaJgMPZbpLSuWFPVAf+mHQPQEy+WyKBWREwB2xw5SNILFuo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGhpc3dEY3hiNDhFRURsMzY2RGJGYnBDWlJSNkorTmtIR0w1NE9CWGFDU3BI?=
 =?utf-8?B?dityZVBkOUE3cHFkQkprb3ZQZUFMN0NrdnpBV2d0ZjJJZEQybVVUdTdwQ0Zk?=
 =?utf-8?B?a29UdnVWQ2VLQkNaWktCZGJ6MFVCemVacWVoeXZhN3NYZzNHTUs1Zi9FQ3RP?=
 =?utf-8?B?Zm9vUGh1ak5tRzZvaytSZERiemZ5V28wbXBQTVBRZ0l1d3ZvWWl4ZXVjY0Ex?=
 =?utf-8?B?VEZtTlBvRzlmaytBVnBNWjc5ejh5NXJqOVUyeHVIWTJXOHVaL05OOVhrazho?=
 =?utf-8?B?RnhLRHdRb2M4S216dnJYaGY0VlhQOGlxYlZ1R2lGUjd1VnhCZCt3eE11WUdr?=
 =?utf-8?B?VlN0R0NSU0U4REdGc3dDTzBOWUFKUGVQRjQwSDJRRWdOdmhFem1zaDRZajlq?=
 =?utf-8?B?NG1JREExbDk2Tm1HRXpJcmJDRUR3UU1CMzdON3FsbnhVbkdaZW5NcjBYUlFp?=
 =?utf-8?B?T2hXMExQTzZHNDIzQUVHcFo4aG10bVpzVzdzZnYyQzVaWEljdTVYMzdmaFcy?=
 =?utf-8?B?cENocTdPZUVwZ3BxN1h5L2xoQ0pqdkcra0xYT0RxeDZPdC9WaGEvZjdqdEtr?=
 =?utf-8?B?bW5JeVlOb2RzeThZc0Zad2d6T0lUL2lva1lPZ2RZQllrNmV6b20xTE5BQ2d3?=
 =?utf-8?B?WjRBU1lsTkFnVjRrU3dzTzdmOHlKb0hoRDlsU2JHNnpWTmlUc2JnczBWc1U5?=
 =?utf-8?B?UTB1UnRsQUUzcU5YWmoxbENSMk1Kclo5eER4b1l2QllUSE03cXpRaFNYelRu?=
 =?utf-8?B?YjF0Sm5HVGVVQzNGd1Zka3pxQnZBSUlTbHpiTW5ObDFjSTVlakxENEtzcEFh?=
 =?utf-8?B?TE8zcWEzUFYxTDNZUGVRU2NmK2xtTGFVSE5yM2gyWDIrMlhCNkR5Tm4zaGFD?=
 =?utf-8?B?TmZJMytpbjYyWmozOUFrRktIcUl6Ykg0K25yWXRqY2NpSjlDTGtIV1NXc21v?=
 =?utf-8?B?TDFZTkwyalJ4OXhkYk1pWmNMQVJrTHhMMU05QktDQ3c3TzFYZVJ4ejBhaWhy?=
 =?utf-8?B?NGwyNGl0clk2OXAwOFN1RGp3b1JoR0xFNW1PVnpOeFExMXM1QWU1eDJ3QVVX?=
 =?utf-8?B?K2tobXVQem1pSExiSmhHSkRFclFacTg4SkxiUXVGRTcxT0MvYmRsQXpSbFBX?=
 =?utf-8?B?VldCY0tQaVFmOVJGbzFjcDkvY1lPcDhVR2xrckxaK0JVZ0VybUJSMzVkRFR3?=
 =?utf-8?B?eXdQU3oyd3drdlFabzJFd0ZLd2ttaXRidlZaTWJRTDlEU2dSMmVHWVRQaTBX?=
 =?utf-8?B?NkxCY1F1QlBRSUFoc20xVGlGc3RkOUF0b1FKdWxlSW1jRjZvcDlQQ1VJQU5C?=
 =?utf-8?B?RUxFeW0xU09kUktlUzdzZm9ObTJOSTJYWWtwS0lLNG85UnV6bEE4anlIdFBi?=
 =?utf-8?B?NEVSRXhHUzVBSFVaY2ExR3hoRy9BMEpXVWRCVWJqelo5V2dBd0hKNDZoNGND?=
 =?utf-8?B?amdHcVMzMWtTNEVwMGt5NHBxWFZXTjFuc2Y4ekUrWTdHUmNadnBUdUE4aE9s?=
 =?utf-8?B?MitleGFqaU9nLytiNE9VdTRBRllpOXpzdldkRXlUUTAvMUxRa2c3M0tXcjdN?=
 =?utf-8?B?RE9UeDFUOE5sdCtMcjRTaElnbWFYcE03bFo4aExYcHB4NExFVkk4RitBcDhI?=
 =?utf-8?B?cGxiYmloWVgrc3Njb0hOY2lyQVZsNklHNVNUMm4rdEJzTTVXcHVod2phbW1G?=
 =?utf-8?B?dUQ0K2M5TkhNREZ5THpNUWxZYmVHRmZ0MXNXS29FaThKcTVEaG00T21jVGZm?=
 =?utf-8?B?aXF3VkJ6Y2lHc1djSXVFdTFEZThpN1hEaGVYUnI0TUZKR1NCUENSZDFKU3dk?=
 =?utf-8?B?eEVMMFgyZGh4aVBnYjlYV3RqY2xHdmFaVUswalFLUStEK0ZNdGJzRzZzMWc3?=
 =?utf-8?B?Y05yL3VZaW9DUUdoZzBOQjdDaXhEVEdPOEZXL3VUZlFCZUxqMFhoMWtNaUoy?=
 =?utf-8?B?R2ovSHcrTHMwR2twWE9IWnVmM2F6dVM3dFVaOTBMcTM1ZmtsNnBDejdxVUxZ?=
 =?utf-8?B?SVM4ai9UZ2lFSGVmbndXclVITXoyUHFrNjI1Q1ZkWGkyTEljRzdxYlNON3hr?=
 =?utf-8?B?bTAvU0JiQWk5WWd6SndOTUVXOENwSGZVK1AvejJxcW43aVlrcDQ5enZ4ZGRk?=
 =?utf-8?B?azdHd1lic0dIUFdvd0tDR0xZNU9LYzlmcFdPMHZLZmc3YUoxNWM4RkRlM2c0?=
 =?utf-8?B?Q240SnEzb29KeHJNOVI0bHBNamdra1VVeU1ERGFTZmFjdkNQTEN3N2VEeVJS?=
 =?utf-8?B?L1pENnh2STFoYnlKampnMG1teG9naTBuNTQvNXVmYW0zRjNHV0JvRlRFUk9B?=
 =?utf-8?B?aFNxdzBGL1FkOFFNVFBLYm5KcDhhYy8yZDVhVDEwYWZTYWRRdnFXZz09?=
X-Exchange-RoutingPolicyChecked:
	bpZ8dorCuob76dhLWEDHIH2j5pRLqpRofjLdepoKKtm5sfwNQO8T4eEr1nR2xwAwN2AeceD436GT1HaU0dKk/Jofb1FUuqlclZ1avE9QQcSxjnBMd2oERkuXhVqVE/USyPMLwQ/gaxdZsrzWTGSV+oqtaXu1y7BZRgI6uleUFkgGxCsByy1LyP9v29GSYC1EBrKs1iAhP0t0Sy5H9li0Z0W+1ojPVy0R0N6p8JUi52EBvvpYyDrLEB5d087QCO0UEnE+nyuK+0X2YPRbfgFJK8X3TiXC/KEh2bHQN5KWY72wcPtZUiQq44IH4OE+1Waa3V56JfuclO6Th/Gn1mMiOg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45db7efb-ee99-4f2b-5986-08df40bcc485
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:59:21.0320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+8cxXcImnwYdwaZWokgCrWUfDHe5uskDGPtjHmxJtehQkV8PV82AMs+P1JQCLYgQf6Tky+w6etHJ4fbJTUtL6XTE1T3HBFxDyrKvR/IQ0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8476
X-Authority-Analysis: v=2.4 cv=VJhIDNPX c=1 sm=1 tr=0 ts=6af5b82b cx=c_pps
 a=N2nRAhBkfDZD2w7gbJJ07Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=bMKiYZeWOmquZn09_2EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Jp8zoc5GjPxjd7hHykyZhLs-AoIpWlfr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX55RpGQbYlqIq
 EQtomspDppnjHNEaMDnSGMFT++234gVVjiSqlq6p0kd5TT2bd0OFchAI8mO/TTctEo1TVeRhsun
 7QlMObrIsumSYBUmxrUsOEwwVG2o0BLMJQXrTpP8uFm7k5nyENby
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX/WkkkRiUsLkr
 jkhW0+FB6K5YTEeosd0l/C0mpI0dYLijpNyY661UrHziDx3sgfyHUtHJpAeKdiuErwh6i18Gjpg
 XUC6Ox2I9s6KX5yTZIRFN6SqlZL9Mnemk7Jc3ox3Tj+vcF1SxQcXawPqxNcMWqLkUbC0iS9kRHB
 w8VizSBvGl/NSxecn5XeEaH4XZf0MYtBAVy6yw6zQGU7xxI1CAtbzMae8ipobFBT70tY+ENTWHI
 K3IICm+jFI3R9Wt7iNeZ9aD3wdzosBoQdEZWbprutNucD6VBE5wT6Av3jC4aJegzTcgYWS41gQg
 l50bxj2GSW5hybDUW2ckCbAJKJGnF6VH79ozH4H8Zc/m+1MGd2codFHpCQNuFzJJbrKAdfIaqgS
 ey7ab4rvKrJXT/paasyyMISZjvjoF/hXab5KdC4xuoN6vgONSZrRUPQpYoxqN4UH6iuZbBvDyeK
 fibjImeNwV/oFNktu9Q==
X-Proofpoint-ORIG-GUID: Jp8zoc5GjPxjd7hHykyZhLs-AoIpWlfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120051

On Thu, Nov 12, 2026 at 12:32:23AM +0000, Kuninori Morimoto wrote:
> Current snd_dmaengine_pcm_unregister() (X) is using
> snd_soc_unregister_component_by_driver() (Y) to unregister component.
> 
> (X)	void snd_dmaengine_pcm_unregister(...)
> 	{
> (Z)		component = snd_soc_lookup_component(...);
> 		...
> (p)		pcm = snd_soc_component_to_priv(component);
> 
> (Y)		snd_soc_unregister_component_by_driver(...);
> (p)		dmaengine_pcm_release_chan(pcm);
> (p)		kfree(pcm);
> 	}
> 
> But it try to unregister all components from dev (a).
> 
> (Y)	void snd_soc_unregister_component(...)
> 	{
> 		...
> 		while (1) {
> (Z)			component = snd_soc_lookup_component_nolocked(...);
> 			...
> (a)			snd_soc_component_unregister(component);
> 		}
> 	}
> 
> snd_dmaengine_pcm_unregister() (X) need to care/free pcm which is connected
> to component (= p). Both (X) and (Y) are using lookup_component (Z).
> So (X) can handle first component/pcm (p), but can't handle 2nd or more
> component/pcm eventhough (X) was called multiple times, because (Y)
> unregister all components. Let's call snd_soc_component_unregister() (a)
> instead of snd_soc_unregister_component_by_driver() (Y) in (X), and
> unregister target component only, not all.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/sashiko-outbox-206296@kernel.org

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  sound/soc/soc-generic-dmaengine-pcm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
