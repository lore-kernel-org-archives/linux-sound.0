Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794491614;
	b=J3KjL5DKjtI4cXCuKsc5FMG+A2zrvJs0bGQEuky7k0YyzNX1tLPBh4NZT8KNGz8jVBnZ
	 KNvelloMtN9YXu2rT48+KY2j1aUK7+VueQ77R4p1Lq5+wJdWWdKBV26Jcg33L3efh6s1w
	 gRQ2BlhsHrcaDPlgVyJP1r2N4Gk1HHvHbKUg5aseJgW6O0XwepBeBjEoqatdwXlcb/u+O
	 vrrpz1NLUDQwjl5tRQj3iJy+lEvdCA1XscbMIwOXSUFbXKKc/xOLzjZYl5BT0/JdK4jOP
	 5w0VTqCX9OJPbpiyGT1IMByDAddXPHvDFQGUGKPO/XpXm5FSvgDreJnlsYCWilwYvvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491614;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LijnQXR09PuMrK4UxVyJkmY7+loNY5/PQtNxsxmYmzM=;
	b=5rpjqFoavCiRdZbBCJylNCQygE/uSK9QUkDUGCFGrUSGev8oFxTxLMd3h7FzxgKpwG7K
	 daYQwAMqZIasWX3M0wxpawcQ47vlzo10l4eQIOl9Q/nF5+hiTrnG0i44lxhdBxGOYvFBa
	 CKtSJ3Ao2qLZchvPXN8ASE2apUVtJuVtk0EK+iGi1v4KensjCZI8chnq5i4SCnoZFvN0M
	 W9UaXpCkG0fiEzuyj54JeVy7B3kRfunC5ZKPbS/Q1CN6DaudAV4TerMdohci+e+q+586s
	 NuGiaSmPW0XU2+kTbq4plDFvdrQrTyB7Y4WqzSOUYJJ4ogynQ+Z19jIQcQbhW9CkQ3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=m23qHB++;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=XRvFoucF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC62A606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 13:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC62A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=m23qHB++;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=XRvFoucF
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACCvOKP2714201;
	Thu, 12 Nov 2026 08:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=LijnQXR09PuMrK4UxVyJkmY7+loNY
	5/PQtNxsxmYmzM=; b=m23qHB++Y2hWPWPE5HS+wto8AJtXfgb9+Uyikp4clZGvR
	vu57qyHu29Sg+ZmECtAIALzWOsko65kKkEdyJPWR2tb7Nni4p5gyKFwEZT8Qhy1m
	HJziUUDwdjCJ9kxBfeb0YLeHAuUzx4s04eFBxhQvi2pKVJjxbE659uvtS/5UcdMf
	CscznPpOe4unzJ078872+8BFcm4W2LaPUFkYRkQoob9XeqqLIPVrtIqdGkNv+jW1
	EPauY7Xp89qbaFCTebK3cxQILqoq23uxfguEmJ3MKyFjey7r6r8YcH5Dkoz7bCzF
	6RVb2doVRW079JXXhpyrj7LU1coPxfVYtPQ9akLTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=LijnQXR09PuMrK4UxVyJkmY7+loNY
	5/PQtNxsxmYmzM=; b=XRvFoucFsCXcnV4JK/Yb7lKqITSpSpto333JLOJQmWSe+
	jT9xnJVI89XNZzb94fguHyKX6daPFJMSHDtacIr/mG7ZfD3Eoa1nBi/pENGXd/cr
	7E4EOrbczRyzZy/JpvTSUr6DCxGs92mOgvK2jmNR8iP/RDdRH6uDoPm215Jvw1Lo
	16QfB4+jjhtYpBOY1mrLEJI77lAdvTTlnm5xQIwc1i8br+z10ANxW9TLvDgG+r/Q
	n3gM+10PauVDeJupfQOVMsirIzPOmkhoeadiBDWofetMq7ePPXR7ebU/3GFw3JVY
	HfKffdO3a5+NKSXaR00K/IWH43hDynSrllFslMKaA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvrjx7g69-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 08:53:28 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/jsXgSCu2JCXRa/Wn5x3iUd64KRqFmWcXDISY3VdYe82jQvtgS4horyI9RvoGbwXrKtsEFUCClRO4aTZMxro5ZRfs8v3r17ptgIe9lamz87EESBhOs6q9wl0cUbrikhhs9dqLEtpCLNE7ojac9OgR7f+q13N+Im0CpEwNM9PbaeIr7hqztK7HWh5Fm7epgMZmBBHg8xMnB3S+ZUftDErE3tI7PYmhzkjsI/NZm4LZbIs5llwZEl+WjJn/k5f0JzOGmbJSDRsDcHfAwWw2ZhlBRFmegT/KiQ6j2Onmdc1w3w96xJk7FxeYqV2C/CyVPlkYcbTyHqtPmzNxqBp+fh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LijnQXR09PuMrK4UxVyJkmY7+loNY5/PQtNxsxmYmzM=;
 b=jjsiNAgPeXZM1X44Eh09ILfAvLCTSt72SwdFCmU6vPeLjxClAdBcoWHtYGOM9p6JsSWAJTHsYdp0hBQ9mqj92fN21b6PyiufxUrfyco0SmyfHHCRpTboqUQ+LMcBq8XCSBjgDMwoIzs/x+AZ6GBLKn4DW/Rm2m3KIeNO7wX98SM7xseCdRrHenSDEkV1LjwN0eXeOkWDCtNg0PkaT5ZMhb3VMiBesTZcPB2bxLo9o8SsfoaShuEnsx6ng93ypWon2vGMJScEDVW4EYsQaXOWvUDZA5BYKm19S8BEpDr/UTckS1tsXdHjh/B5zuQDWwz76Tedm+6bprvqch2sUybH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by BY5PR03MB4919.namprd03.prod.outlook.com (2603:10b6:a03:1ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 13:53:26 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 13:53:26 +0000
Date: Thu, 12 Nov 2026 14:53:23 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 08/27] ASoC: soc-generic-dmaengine-pcm: use
 snd_soc_component_unregister()
Message-ID: <avW_0Tnvts3ArV8-@analog.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
 <87o6bu28ko.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o6bu28ko.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: SV0P279CA0034.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:f10:12::21) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|BY5PR03MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: ec3a9a46-e450-41fc-428f-08df40c4535c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NAe2NP/E33DdMXdo793Epw7yWvOj6Ay87Vyl1sQR4oOBnxnSBu7jdc/VEoyWrtneedkD5Yc2XlK89TMrxHTJOMuh61I7Icf7DNAkFVCDpIpdQbluKFDt+5ZthXK0oGxpd9niOa2NHdimfR+xvOu+snw363gkfA/NTScHLyZANqdsRiRN9x6+PRTpB6mLgFtyZJI6j0zCC10OQrRdSKWpsFsnSPgI6y7r29+trAk1ISWvHmDJgTaQ9UUiwE5nOGoAIMPrMqjmDR5f+xfhjZEB+rFuT3vybsjRjcfLA3SHEoBr3PBhng9MZbOQQKvH25aKbFgvplkmmzYDBMrCWMJRPu19FrtugZ+60ewh2++ByJMQS/vviQtRtWyFYFx+4bIAf4oQjEjhOXMPVJTsa1ZtO0l0Agb4Z/a0Va1JGtRXpkSIgsX3ewCdkalAcymiNJ3GTJRZyk6ZIM0nG30xeC1E//bhuoYJWgICTKiuopRpIoDgd1JomcfZN3z6jHEMm+Igx7SNAaTkQNKTXzRRwGPNzZFZBOcE83FVHiiEGsoofZKZPpacVnfOZQo/nhkz7kfgHKKqPvDq99WNuUnbowK3A1C2mRb1di8NJuCCExFXwEwRKjCk6OUOl5ox6iF3Lg01
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkJBYkZ4M1B0WE1sZHgwdDRiMTZJRlFIMmFhQ0FUc0RlTXBYbDJxM3c4SWJT?=
 =?utf-8?B?RUZPemdHQ3IrRE9tWHN4UEU4eEw4em1zV05PTCt6Ni9OYy9DT0dHLzd5WmxN?=
 =?utf-8?B?MFlpZ1BUSEQrZ2xqemdYLzQxeUNkVFdTT2NHZTB0bjh2Nk0rZUpMM1I1Z1Ar?=
 =?utf-8?B?L09GbEVNVTREWWU1dUtGcmZ0TzRFTlRNQnFjOWd1a09LcThybmVxVm5aaFJN?=
 =?utf-8?B?UFZaRk1WN2ZpQXdJemZ2d2QyV0tVcFkyM0ozZnZnc3JQUzBKT3VrbGxub09J?=
 =?utf-8?B?ZFV5WUg3cm9BcHUydXpqY0JiVzRIY2NEMEhUcjV2NEl4d0JZTlZFSWpZd0VT?=
 =?utf-8?B?LzFCNzRhWmlHT2NKZkR4VjRqLzFuV2ZnOHR2U1hQNjJEV1FsYjVFbHZDVTJG?=
 =?utf-8?B?OHIwbExWL2VhNWFhQzV2MG95ZnR4NnFZRG5mNThCUzRHbjh1RU5hRVlHbGVQ?=
 =?utf-8?B?TE5uNWVQL2VyTGhNTWgvUGplTS8vTlhSVEp3V0xidHgyTFA5MnFYcE9kdEZ5?=
 =?utf-8?B?dTBCOTdmVlNva25nWDNvdTJGTTZ6eGc4aTJFanUzS1BCMUhBSmZHSWlRRWtr?=
 =?utf-8?B?dFhpOTBGK2s1VFh1RlVQZ25WdVdKY1JUdldKNkdOamhPbTlHdjJzVHJrZUtJ?=
 =?utf-8?B?Z2NKU2tPSkorbnc0ZC9pRU9hMUJjNU5NQ3ExRTVoOTdUWncxV3lIcHovOUVk?=
 =?utf-8?B?S0FxWFFDRFBuUzl2MGwwQjlJTFBvcmdENUsyNHUzcVoxSzhIYXp2MVpHR05Z?=
 =?utf-8?B?cnVRM3hxMFp1TnplaDN6VU5zZ2RHSTdMbmJpVHNsWVFkNm5aSHhiTUx3OTJu?=
 =?utf-8?B?VTJsd0c3ck1QVFpiSzJpNDRweUgzcDhmVlA0Z1JEYU0xZ0xJcnN5V1dyYy8y?=
 =?utf-8?B?TXl4eWk2SEFVa3NxSklYcm5lS2gyVHNmZWxtbEUyK3g5SkJhalBVZWZKK2c3?=
 =?utf-8?B?NFRUWWVIZklPb3M2OUc5TGQvMGVEVnpabFIxWjlnQXBjdGhYV05UNEFCTXYx?=
 =?utf-8?B?d3l3dlVoOUNRdG1aL3QwY1hUZUZqbFN3anR2SVZaM21Dcm1VSmh2NTBORXVK?=
 =?utf-8?B?Q3FYd2RBNHdXWVpsM3FybE15bklKZjF1SlJhNzBDZ0lmdGx1c2xYK2lyd1l6?=
 =?utf-8?B?cFE1Y0lKWnR5UE5lOXV2VVlNYmppSW1WbEx0U2pEZ3ZObTNRblFvckxBN0tZ?=
 =?utf-8?B?RFhsbGJLOW1xQjFVbDBkS0ZRRDhPOTF6TG9HNnFsdWxjb0lIYmhDa3h0NmZ1?=
 =?utf-8?B?dG5wWXpESVY2Sjk5OUZMUjB4NFVBTTdBalZpUUprMFo2eFozOS9yaE5FVU9x?=
 =?utf-8?B?akloM2F3RGVldXI4TFdTMzlGaE9SUGNLOU9TR29XdHB2dVhoN0w2L0dZRklU?=
 =?utf-8?B?QkFlM21BYVBQTEJNYU45bjIzSGJnSlY1ZG5sUWZ0RUZhanBpNEh0VHBHVHJ2?=
 =?utf-8?B?SU96SDBNMDRQd3djNkE3SS9EM2Ntb0hJRDNtNTZmMTM0dE1JaExlZEZFalho?=
 =?utf-8?B?d1JvemVTbmJUbEl4TXFjYkN1d0ZSUHg5MmhJYVg1eUt4a1FXK0NEMkdtcWY2?=
 =?utf-8?B?Wm9WREhEQmNlZ3JoNWZ3ZGR0dzA5ZjN5VUs2NjVhQWU4dTZHVFlBWDQ5Wkx6?=
 =?utf-8?B?RFBIcnBKcG1VaEs3bC84Zm1KQ0xjcnFpRm12Q0I0dnpESDIzc3hXLzFXVjlW?=
 =?utf-8?B?ZGhsdWJhRXBnaUpVZmJObEdXY3FMeDN4SllZZmh5NGhkNUlheStIU1N1bzl0?=
 =?utf-8?B?K1paQU1jYXc4R3RnVERkT2xnallZYXhNMjN3UmRtVTN0T2NBV2NlTmdLaFBC?=
 =?utf-8?B?a3JqVFgrNVpXWWYwUk8xc0FtWXBDQzZRakpxVDNrQkJWWHpjRXVXRHNIaHNK?=
 =?utf-8?B?aDMwb2JZMHRxWFMzQ2M2aTVnRVRaamRtV2g2bktBblZ5SWxIMnNjU0lFRnZM?=
 =?utf-8?B?Y1BOVHJkSFpuNnpGVFpaMHl5R2NLNkhMVkR2cDRmY3E5KytvUVJZazZtc1ds?=
 =?utf-8?B?VFFwTFZRSzJ1T2tyb1lJWTUzMlFYL0FMYlh4cmRCMEJwaFlDZHI5SC9qREdC?=
 =?utf-8?B?UE9WaEtoTlpFMXpIMWVVU1VqQm9UTEc4UXhYV0JGU1d3RThEL3N5M0p6SjQ1?=
 =?utf-8?B?UUFpZC9RKzJmNU9GaGloTWxEQW95K1N6SDF3SEpEMWExV21xUjRWZDlIYW9Z?=
 =?utf-8?B?RWd0YVhTcjh1d2VkV3NUT3J6N29jVjJhN0hoMjdrODJTRTNrV0RkSTRITVVW?=
 =?utf-8?B?QzZkVlNCbGljU2cwZWxmMEJiQ2Y0MCtqc25YbFRhQ2FOWGZvMkFFVFA0bHh5?=
 =?utf-8?B?NVFYZWNXMkhtT0xkS2hmVUd1WXRuMGtweGp2VzVKUzBTT3NBNzJFQT09?=
X-Exchange-RoutingPolicyChecked:
	jPeq/Se8QbGlgrPLpvnXY6ZrUwPRF+hhnwD1YCJhobnCTyuVe/cwAOSkZP0gbRrSuXOYNkKbV3EJvPIuwebjx3beDksUQFvy32lJaMG3/TYp1BAszOivmJGfXUU2jGxk48T/F8+3Jhq8HTM5UZuUedo92TSOZZ4dAjTcomlKR+6RffaMZmI5VgZQXpa5dPrQLkxDEEzh4CggwPEuiqukYTmUK2Xk6RD8c+qtbTC1YoNeQqlzDU15yqZ+U3thf7gqIKRVL4pjAmBhfvkaIaP9M63YjHXar6poN6vJl5NhXdQm7zsqsiPEepoDKQy/Pr36+rC91gaOJwkkyz7s7yagzg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3a9a46-e450-41fc-428f-08df40c4535c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 13:53:26.7280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Zwz/kNjUz799+eexCF0vXnImwUydWwS91D7PSS/k7WhyWfZDEUIYGjRGPAdF4h6hxYVi4fxE10NvPtJuj9YJQWweVrm0bd1pZJYH+9/iNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4919
X-Proofpoint-GUID: _fI39QB4pA75USK9Tkb5zSag-aWe73sH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfXyjv7uGjp1d0I
 YsL1IkCmU36iJDVqoZtZDtf4NTL1MbN46evzW+7a7VBYmy9cClHY0saIfeR0jSXA/zh9432tbuO
 nYhl9kt+9/Q2EwS1sOI8bKK/d3RyYZL/znVJbtHZpJIcFN/R4gGj8yMNcOk8JFn230Hei0ic6x8
 wya0ZvA9dhnN4U6M+A+aPfyOFutirZs32o9ceFnaoE/N/yyDUkbLqVT6Do9pbEi4PeC3LW4nlMc
 hZkTpo3sjd8kh1GDuvL9U8tmzCEXM8YUnG3sgK3RXVy9E7FUQIP3eKleGxBmVGNPxDhiWN2HJgF
 N1B01IJUeBHAbAQhnM0CXmyHRMbI4neMR99luMWRqaM5dHQLpBb+zreoRaakrl3flNW94X/p+R2
 IlpeRpId/gA/LjtnGN3OaRbklSvBnYLSqmz5TxcCX8XZBAeSGgxOIU6MLwk3i1ddPsM+qn8YGSC
 mcuhfk8enyiSLjNRGZw==
X-Authority-Analysis: v=2.4 cv=P7KvFSAu c=1 sm=1 tr=0 ts=6af5c4d8 cx=c_pps
 a=PeFxPTU/9IdxQzUa63kYNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=El57Aswi1KbQ2igVqLMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: _fI39QB4pA75USK9Tkb5zSag-aWe73sH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfXyU7OzFqx2qVd
 Jv7GZtXoow8uDvEo2f2OiEi1ITOc5MzVpiFt8r4Mqt2mdAXL59uis/nyzuWD0LgSmGkFQk5mtmQ
 CIRoSkf2XgjwVVu4p0BuKtkMc+ofb2sKJq5KRV1BaHfm0GglnIRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120055

Hi Kuninori,

On Thu, Nov 12, 2026 at 12:32:23AM +0000, Kuninori Morimoto wrote:
> Current snd_dmaengine_pcm_unregister() (X) is using
> snd_soc_unregister_component_by_driver() (Y) to unregister component.
> 
> (X)	void snd_dmaengine_pcm_unregister(...)
> 	{
> (Z)		component = snd_soc_lookup_component(...);
> 		...

Sorry - I was a bit too quick to review this. I think there is another
issue.

(Z) expanded is:

	component = snd_soc_lookup_component(dev, SND_DMAENGINE_PCM_DRV_NAME);

which will walk the global component_list until it finds a component
matching the dev and SND_DMAENGINE_PCM_DRV_NAME.

If there's more than one snd_dmaengine_pcm component registered on the
same dev, how do we know that this lookup will pick the correct one?

It looks like the code was written with the assumption that there can
only be one snd_dmaengine_pcm component per dev. But I didn't look at
the history.

Does such a case exist? If not, maybe the easier solution (for now) is
to check if one has already been registered before registering another
one:

int snd_dmaengine_pcm_register(dev, config, flags)
{
	component = snd_soc_lookup_component(dev, SND_DMAENGINE_PCM_DRV_NAME);
	if (component)
		return -EBUSY;

	...
}

Then you don't have to worry about the 2x unregister problem sashiko
pointed out.

In general there are not many users of this lookup feature. Besides
snd_dmaengine_pcm there's just mtk-soundcard-driver.c and
fsl_asrc_dma.c. Both look a bit weird too. So maybe there's a way to get
rid of it altogether...

Kind regards,
Alvin

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
> ---
>  sound/soc/soc-generic-dmaengine-pcm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> index 1ecf3feb2bed0..62f86d97668ef 100644
> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> @@ -514,7 +514,7 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
>  
>  	pcm = snd_soc_component_to_priv(component);
>  
> -	snd_soc_unregister_component_by_driver(dev, component->driver);
> +	snd_soc_component_unregister(component);
>  	dmaengine_pcm_release_chan(pcm);
>  	kfree(pcm);
>  }
> -- 
> 2.53.0
> 
