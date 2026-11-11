Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411967;
	b=NIqbSa46yuwTWCYJ3VXVYrU4jX6W4pPyG6Xd4UBx/6bphB0YcevtJuH72TRO7kTEQjfd
	 BlIK4eAr395REv6PJFlRIgyTEQVQ+ZtXhqR6CCbEvpNLmzu69PNEu7BerZxNEJXi6Y04Q
	 PorcN06yfKyIxIyblXbRD0kYa5pDbm8pDmIFgJrDQSixbaq9hSQeuuNKkrbc9peI49pdi
	 ViSjgudsdPSN7C4Wmfr2j+QZL2zVzBWHb0h2dM5As2F22an7x0iuAABMn8/OBwVWRQ+Vg
	 E2EvkfxhEH5kHx1MhtzMbV/vyFEu3EZduD0QgCyY4XKMPNg4/29ziF/71YojUimRn5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411967;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HC6QtfdXJrXlR9G/3ZYjheO6aJ/rhPvRmiF2PV+F1X0=;
	b=C38xYQ3lZiiYKylIpSTHP9PzygXWgPa9IHeCakj+lNhO0lEGwG/pyKnY69Y8TuQtRHUU
	 Tqtz7OVBz11WnMf1Oyziko8jQ8WWU+byhLI/0/SeowiY3cPa94/zWiefBaHCzXaBSr/MN
	 bRMw6Sj/VDSs0yR5CvA7WlIzxeysb+hnmjOfu4uLCl0k9RmxhFfQtkScrL8xshFu/9CXP
	 Ei4jzzLMDbPa785eITX1QU7wmFmm289rPyY6J2VIJVU6E9Al2Ns4bRgg61eeKFnHCA/i+
	 PHckqlzJ96G+07HYpiamiO/W+5x2ao77mufOhMeWG/XVseczQs+stiGj2+yz02YWnow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b="fX/ZnWa1";
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=UFU3F6rc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB608606A32A
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB608606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=fX/ZnWa1;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=UFU3F6rc
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1UXW652321;
	Wed, 11 Nov 2026 10:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=HC6QtfdXJrXlR9G/3ZYjheO6aJ/rhPvRmiF2PV+F1X0=; b=fX/ZnWa
	11dJGEcVpeIYSMuMDgyA5S41oX0/iXu+Fff8wrTpHrSwUKyHg6IR40PUxWgXDuPM
	jlSMWhG9sXh+5+w7A90ohf/gkF2xJvzNAMVFoV7O/XiltPD7X69M5k/d3hCk2+5r
	15dlAzW84z8F8vq0eZn196Q4ojwOE6D2H1CcXfJzmiykKDIrphpFx+/+SqdA6Ga3
	YB4tAZZL7pWs/46lvs+nGwkt8SHkIH/nhfs+HAPzio+SPK33PnOwzspf7g2EUXJ5
	t+LP6AhOILlbnV+4rmTVRU2U2QEegZ9au5r1AqrM2r8N79/f7EQQY2MD+UK7S2gL
	pvEiMP1zNHHb+jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=HC6Qt
	fdXJrXlR9G/3ZYjheO6aJ/rhPvRmiF2PV+F1X0=; b=UFU3F6rcX0Hu/xFEPKArh
	xVF8HGzzkv29KpQ743nEWyATi89cbSIIfSVWrDlS8fhBL9rfIlZGChj0EkIxDObo
	WjMeShspkZUeyEmDWU6JowI0XAbCCCfY3VfGEQuNcJPCVI/we8lOW/klc/hDebTi
	n+6CLsiNx4wpvSranta+8lsfC+smPUMNkABzoaCEOxf04q4Btz5Kq48kInG353L9
	LJXYINMxkT7O3CizazNS8Dl5HtX7HNDBNJLKUg88FWUEJfvXd37aKT3V3w1j+2Ko
	1x4C7abHqopS0FlPZssQUouIh5e1tNbbrX49VFZjE8kPtWhPD+ZXeQY7QiN91Szl
	w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvg57ur20-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:46:01 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOdCvCXscHd3cSc4IyrlXL7qGbnSeM6AlZDCBrvMV/956Tg98scigcIn7IEekdjWUNUS7Z2bVSAaW4i/sBOKgOhJIPjdJAxMZ49hr5/Ehp3RZ9CtuXg4B553OG19XfsTi03vWhC5/MLs3EXnbw2LFi1ZdF8a6+r5j0YuT5CepGYaHPTqyRmbwrH5oDkC8RGlj2Q6rVhulilVTuH6ooKhPhM6Us5sPwBFF2FsOTFxTqxzH1yew0RvzQuwRMbuHsBgEaFBeYbrjOIKxD75evdR6FA6EiXtD12tPBpIQNuPmC1KAVfUMji5/WPDP1gXaBejJCnkRPohps83wPmjP6aSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC6QtfdXJrXlR9G/3ZYjheO6aJ/rhPvRmiF2PV+F1X0=;
 b=gCXFcuJdHj1uJEPQNA2Gx18bt0POZbj7CiNigy5qDRC3Th3xLr3ORPOFLVVXcCfT3LNoV1xXq2SyprN3gcosAdJ3xtuPDJ4LPsZd1O6UHcWVHrwDCYuTVQbhFxfRP4pj/1QqHTr1VgN1U/38VZ272HgSmX/bNGAdPYPzmNq1tWmiT5mqtWxBr9LsIKPXizT/vjet8hxdnu8DVny/Co7CTnCMkbRbe3GbVCZa7wYpZZIk1gQlM7BneODzMKkFQ5+WEpgl4zUJjzIW4BF7lQ86lDDmYyOSvb3TD1RYmWNcV1bs+lKvroTaEoldvQ9Bzkpqk9rGx+nEuXfA4FwKxRC2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MWHPR03MB998632.namprd03.prod.outlook.com (2603:10b6:303:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:45:48 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:45:48 +0000
Date: Wed, 11 Nov 2026 16:45:45 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 08/20] ASoC: soc-component: add snd_soc_component_to_dev()
Message-ID: <avSNosG2s6RZof2M@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87wlqlmf7m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wlqlmf7m.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPBP307CA0015.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:2::9)
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
X-MS-Office365-Filtering-Correlation-Id: 3d1d2e93-d0f9-4a83-7ce3-08df400adb13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|10067099003|261021121427099003|261102123227099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7YZMGblFKnPFnmzH2HON0pPUYA+Zsd/Qdgm9OHt2uLMxfdAHsycgqY2vhYXVM8cgchz4T2Hw07735UZSJcgpRXz+TX2owirzXvEHu/RyuQvBaqgY2kT9XBH8XLYNQ5xnT+J2hbo27oe1GLWaEVSixPpOAV6Wm7NrMocey6DqZsTFioEjdaIxph7OB+BbKU8So3G0U7dYa2f3lX8iOopwhuRa2/4NKtj1RdmPxRwFaq2h4LYx3Xw/KsBJ4w84rbUBbhCOd8+XJXLVB92L91nBb8DC1LZwpc7vJfLs2WOYw+8/n/MX3rJ3MtGUz4yBIGfb0p0/fGdYDEiFh1RVmVG5mGWunDb3dOG7zy1P6ygOXbVC8lIY2Mci0hIeMFEFMQgvJMATxProHrk8hE22aFssQbjSkyILTse+ou0PxDf8dauEuD7KY9irpZzbawxtWCwRauVgOV86R3NJs/9kxrcmLJNBTSPDTFixR/ZaWm/p/inBVzOPELgpvTbLKoA4+cV6tzUEuDrLhfwi6ze9HPfPhUhcvbjElKVu1EPuv9pTUUc3m848b9x15Qs9q+CgMbFf+/gM2D+Yyk+z88YS6JWmYc/7X6nbJmQUiX0p6SfOouHajT1A8W4Tqxkw/GFjpYl3Ix7R1kTNKKJl750fYdaSfIHjEXtPE/ddqHe7Nsrj+bQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(10067099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2U2dG1zZ1RnMVBGZEtCNjlrajBqdWJrUERvWGZWMXVmSFBuMkFvU2Z6QzBw?=
 =?utf-8?B?cExjK2pWZENGWTlnYm1SeTZPTkdYTysyQkdkazVQbHhIWDBmcXRvZVZPL3dS?=
 =?utf-8?B?NHNFclRyV3MwblBIdmJkdGMrRGM2bTAvVDJYL0daK25KYzJCOG4zdzFnM1NL?=
 =?utf-8?B?UkdxcVNKdnJpRHBpSk85Z3BqNXQrb3F2ZzBYenRwalVlelFBYURibURDNzdn?=
 =?utf-8?B?ZkZoZGxOdHBYYWROWWg2bmhkMmI5MzRGd1lZeU14QnY2VWE3WDlqR0w3R2p6?=
 =?utf-8?B?cmp1emlzZUR5SW5KMFJ2aFl0SlVMaklScE5JZ2xYTEZicEp3d3ZpUzVjWlpY?=
 =?utf-8?B?aDBYSjc5WW5sR1NVUzJTRllxeVVhOEVaQUNRSjArRXVkZnJSd0RUbnBhb09D?=
 =?utf-8?B?T0w5UytzL1hXejBQZkY3ekxFd0JuT2NOQWNTT2libHM3MCtoVlJpTnRkb3J2?=
 =?utf-8?B?UnJseTlobUt4V0ZFUlZscG5qdmxCbHBTbk16VldYWWswQi9vK0d4Wld4MnZw?=
 =?utf-8?B?eVM0cno4S3FZUW5MUU1zMHh0aUxMSlJsck54T1VtTitQM1NneEZqMlJGN3Rp?=
 =?utf-8?B?cCtLRjVFWmZheHRmK1RzS3NYUnpkaFo5aWVlWmdBaWFwZmJrMHFSWERObEl5?=
 =?utf-8?B?UHJreEVrNHlYQ0poSFp1bEZWU2dwbHp4ZVc4bjNqdlVEdTlNWERKT1laWjZW?=
 =?utf-8?B?RmhsK1RzNzMyMEN2eEdqOEZnVDhkbmtFS2UySTBSblRXVEtiQzNiOVVYWmV6?=
 =?utf-8?B?NGVWR3hHTTVidVd6dkhpV3RqbkdaVFRMbmNSazVDNlloYVRGMTEzQTBMK2ll?=
 =?utf-8?B?cVlETU9PK0xKM3FUcGVsYUpNMC9RRnhwK2hETVhvelRoNTI5RDZ6SDBxQUJu?=
 =?utf-8?B?S1ZUcFNKeXhuUkVxN3ppbVUxZGhBTGRhdEp3NWtyQ3hldmI0UXBZaUcwT2lS?=
 =?utf-8?B?bUxZTFVkTFNOL2RXLzBManBiRFdoU24rSTFEQWdUalVlT3hrbTN2QXZzb3Zn?=
 =?utf-8?B?VEZybXRlZ2taVGsxeGcwcWI0ak1aSlVTVkk1SlRqZkxNNVo2YWREazltYXVV?=
 =?utf-8?B?TVhOSnArZzJ5Nm9FSmMxQXYrZ1ozNmVtMm8rS3N3S0VHWDU5N2d2ZEx4eFRx?=
 =?utf-8?B?VW5ITU1nTmNNaUszQTBybFA4d0NLWTAzSFRJUzJzWVZzWUhjT0F5OUZMT3Ew?=
 =?utf-8?B?dVBRK05pVG5kbDc3eVM0STR2emRsbVB2cm10b0Rqb0plN0V5aGxHN3hRUTJt?=
 =?utf-8?B?bVBpbGZ0ZUMrS0tiWmliTFBmVzZQTEV6NExwWm95T29mREoyN1l3NDRBZVJW?=
 =?utf-8?B?S3UvY21teVhQN3FoaUs0QTBOUXBJaE01bUFNdHBTWkFyTGs5eW1wMU5MbGR1?=
 =?utf-8?B?QTVmd3RSdyszNEF0WjdtclBidjFZZmI5YTU5bXRFWmE3eWRwQmtlMGRadkZN?=
 =?utf-8?B?RjFHdWlkOXBwa3o4VEpENW42cXl0ajVCK2x2dFpYSkF0TG40SkE4a0hiYUYv?=
 =?utf-8?B?aTk4aEVNSTM1MGhrVFQ2VHRSaUswWk8wZ3VMakN3RTNCL2drRU00eExiUG41?=
 =?utf-8?B?TitIRnRMMDNhU0RjMkNkUVlCamlSS2tMYnEwTHVFVS82SG1COHRyNHRyNlBP?=
 =?utf-8?B?QjJEWEpYMXJha2VRKzJCUzBERzYwdHRSdnFUSkp2OFlvWnlOVExmbStDRmNZ?=
 =?utf-8?B?Z2tMSmdXamZUYmpVMzljUFZnL0cvNEQ5N0FHQ0ZjQllRQjFhUTA1ZHYzU0gy?=
 =?utf-8?B?UjE1RFRPYWlNK3k0RW81VEtKejlmYzlUWm9kcDUxanFKNlBTKzRLWWNyM3lD?=
 =?utf-8?B?UWRGcGM0SXAyS3pOakZKT2pSNXlnMXY5bUdRSERYdUVORmlBcFB1OUdmdHRa?=
 =?utf-8?B?MHJJdkRMQzlXb2RsaXBmS2hOTWRSK2JSKzF1bHgyMUpJNjB0Q2xkOWVDTENo?=
 =?utf-8?B?RHIvOEhmMG11M29va0JqWDUzZFRVV1J6VlZra29OYTRzd000ZE1ON1ZSeHA3?=
 =?utf-8?B?T01pTHFRenhwQWNBbEp6ZEc0by9WLy92Y3F5dmkwUkpFTkswejFaT0xkZmNa?=
 =?utf-8?B?bm9uY3EvdERMNmNJdEU0aUpYVmJObEE3SjF6ZTJxWmNXbHp6QVNHRmNFNTIy?=
 =?utf-8?B?a214akVSTTJVUWVuSFZzcTkrK0FFTTd3L1VVRzRUUTBDMkV1WHJzbjNlcW9k?=
 =?utf-8?B?TE9UUFBKKzJ0U0hxQkw0aENiZDJObmtWTlllNk5XUjBSWUpleXEzU0pxMkRH?=
 =?utf-8?B?b081aHJCbnRVNTF6aHpReTlKNU5TZDJ3aGVvQTA1R3JuQkxVcG1mQlhMR3NS?=
 =?utf-8?B?aU5wdjBacEFwdFNHMFRMbDd4TGFRckRTYVNiT1BnODlDU1gzbGc4Zz09?=
X-Exchange-RoutingPolicyChecked:
	S9WPqPn7TXjL0Ky4v9HxKoGC4ZvV3lhRpQsWZVuYp/QTug6iQgp2/Szhk1f5t0QFlsx95zLjxRZjBfW2n0oRWglYcVlzicEEFHlbrmgUbBolGlC707vi8zCWY9lqOZJVpzHFcEOnzjwC0gPolGMH2T4Lh9hFEkR5LHCKLYGoJSs6ij42RzxXaZ11xcbUk247he4BaBIYv8bWVdq8wBOKLVjGSjAHUxY2Kx59aOPkHMICl3wSAxfka6scax/yh3OeonjEbG7Mwh6CmGLNp3YsYlSdLHQY+f5BFOtshE8adYv2muJgBqFoHydTbXiVxPyt1zcxzd+zpAtBF3KT4ItVFQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1d2e93-d0f9-4a83-7ce3-08df400adb13
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:45:48.0331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jY/PLnKLwJBiwY2TtFnRtoDZKAlMuoidOMjv+USpTHIZUybWExn/1+C96LNRnEH/QBQQRADikIMMD4uhiLfhChyIZ4q0rcVJMpv3Wwn1hgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB998632
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX653S2FvrDo9+
 fWXOHcj5CZu75ipB53ijFqDe/xTb98PJTxzfskDa3w3iu8NKvROrWCR/Ckx0VhmQ0IQDa+GZI8/
 Hq2fhgo6GevEwGserjdbkyRufk7PQEiqYccnsdMN+kGcKEcAwaRuDWAklOjb78pyYpyaU/IqPmU
 srRLTe/PbsTPSvlse0eW6teQGZax0lkak2i5QDEi4v/48TqgZPv8lJa20SuscvLUFG+u3+HVUwT
 vJCq7f8380M+PACd1kMbtHKCeQ0TzKj1ShHbB4e4kzaEJa15kTGQfnsMpxfaSwS5ELEUCD+iUcc
 4K1DFLe21Kgw9doXrH3lPdZAHScQr0iQdhi4i3qDaKyy1TgzIpXlABMxGhkgULWQlXfuoSrH7JX
 81zzsRuf2pxbGB29x7xjbMQXEcjvtEmtjw+dKyMlwdBD28HJgTwH/QBv2KNSpbrY05m0Ca5JKnK
 qcgbFEcRTmauuub5NRw==
X-Proofpoint-ORIG-GUID: qTP6Y2qiteTjI2qJJg8zRnPJYy_Smpon
X-Authority-Analysis: v=2.4 cv=ZNVCCn7b c=1 sm=1 tr=0 ts=6af48db9 cx=c_pps
 a=p4VQxza1WQsAsw6m3tlBZg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=tjWEKVCT-AxKcshQlcIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: qTP6Y2qiteTjI2qJJg8zRnPJYy_Smpon
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX4TV6/ew/ljTd
 +cl5Ch+Rn1EhtWcCZN0eDZAncWlqlNuT+rxCYSR4lGZdbtiUXANGrZgDAY4EFp3g1OCq8WsCvuw
 ngWojm1MmU4ESlOYuj9V5EmMCKw6wwyWqHHOhoZnT1+EmDha7C/A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:24:13AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> Add snd_soc_component_to_dev() to soc-component.c
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 1 +
>  sound/soc/soc-component.c     | 6 ++++++
>  2 files changed, 7 insertions(+)
