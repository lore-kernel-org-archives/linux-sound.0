Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411851;
	b=d9wV6dbppEXtEu8pEbRO4xidoSJJt2NUOH5Fh73bljES8nsiz6pQLreoAAj8It1N5D3m
	 7Hm/rAWvB6u+6txJQXGeCxwqllGOJEpKOEWdDFx0ldhg/BdtgXhXNTUh7YK7IAss7aZGo
	 +D6iRhUmHTbenv/4zabSiBlbCk+n1FmK8gociRfjFiVO3cn3nVM9dgSCFcZcna0C75FKn
	 gxgHVkDbjJ6C1uy3+MjICgV4aiXTOCvCgUmnBHCNHHlJxBL4W3U7szNjOLTBj68hwniGi
	 Cyft/5jKDOc0t4Qwpbbwue77euFom4E0VwvgxGvzZG5wQHUHH5wZNpHtIO3/NKVmo7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411851;
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
	bh=iK/7VVbKjWk9Ut8kYluAavX+tsW2k8QTONYnALf/Nlc=;
	b=gBAHA6ERQOf3hZgtsgvpxSpzv7r6mSgS4SnKoEkr9K2l87KHj33cKrkSydClMZNliqBb
	 EX0o08qs/M3Dr3Z/Rdeg9sP6erm/7BmooqLy154MDlMsk9tEJgShSa0G5nPSkwmTytVlV
	 zFc/ELQWXihOqz0r6S0c4RADz3/vcw4lI0Q9AwNLtn2pxVwfB3dDaJuDaCEk+0DBNqSMB
	 ByCqOaaWjeOCeBbZrHkPJAP74dzbBuWJ0DpmiCEANVlcqguIog5MacYqf/xsSH3TJ5Rx8
	 73Gt1Lh/Qxs58oBZcCfhgaeTP9KTdfILtAnMGdXC27P6iseNStAMn8lDcfsdYk5//qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=WTZORUoR;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=anwrOs22;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F14E606A32D
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F14E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=WTZORUoR;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=anwrOs22
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1iMI409502;
	Wed, 11 Nov 2026 10:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=iK/7VVbKjWk9Ut8kYluAavX+tsW2k8QTONYnALf/Nlc=; b=WTZORUo
	RXZiCJnX5LG7OQ8uOXnEaqIm/h1PlXO4UWvYmOj3vdjqjINBBD0NuYrCAL4qzZE3
	zhiPnBay2alZXMI5pW1q22fG9BwGPxNZ+LVHvwIvBntyLmDGiE0eJBBjYv1N1HlN
	iZMM/hr3QHwrHgqjkC9i6ffuo8rkaMY/2eF6rmqnllZXD+ZXLKA7RI/YpAhqCXMF
	fCR/qqE1mwYKK19ggBi7xKBypkwX9f+CRTsllX/5uYXLGLGMFar8AnI5Z8d+rWGQ
	ONXyGWPVGCkObXQKf9nsr2g3PTOiENm1tcqA3n2TLSEUhpI7vbZRgfEgvtVLTaxV
	IC7HC0stnC5wKAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=iK/7V
	VbKjWk9Ut8kYluAavX+tsW2k8QTONYnALf/Nlc=; b=anwrOs22St+Ih972scx9F
	Cjxb91ErBIlBgEhFXwfITf2BBclY3QiIkNMn9FpuHy22MfPiD02BTeYv4Laa0Pu9
	4eH4ub9kVdes3SukPNDJSN8AS3gwHrK3pyRc9uH9j/O073o+PqUcDRIlutkO1kHn
	pBswJZT52u7Ox2NB+/aulLkJR/CVl1kD+NM9S0hTQ21clxUpl3FI4qvRgIwNT1+6
	YX1FHHMrtUC8fkO7RfClZRsoXS4sXReije300veADV9mP9E9POhapbCFKjSu7zHV
	GhgZxG8BS+ml7chJ1pmGD29iNrxUcpvA3j7Ycts31RMOd7HE1+3Z0tgn4piqV8c9
	w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvqu9170v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:44:03 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqt5N7qp91eyjKP+VEOa3P8ijqN0nEgpCiN3XDq9ea6ZguTe2pZl6oy+xcsyXWaiKvpifPvQy4ho9yemojBb2pLNOafvhUQ+kbXqBKOqbM5MfYHIHRKDkTdAILD9C/8gLNrH4MlgMRrmYUAdXUFWwxMqxyBPgrzLh/i210GVfmKnkb2vY7pqKHhQN+r0VRBIct5z2PjrVk3pTjFm0FgH7mr0PjHlJw0mBkkNN/kom3b5o1Ex541wg099igbFL4HLyXLbdUUWjTmASYW9Yv+YbxNVk/r+mnzzIyPIZVmxPbJnGCDFKfh0wB86qgtFct0kW/MNRBznEX/OPl8rrPW3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK/7VVbKjWk9Ut8kYluAavX+tsW2k8QTONYnALf/Nlc=;
 b=ivjtScsqr0QgBEn1LrTsIKsP1bQuXwn1DppP7KAdXYye0hlVDzUnpVGN2NFyviGWNWGQK8TFnhK3doXDUA5JPcQFnoa/Dga1vAf5OE5sckXdNKm1VhvOMMRCTfE6P1VC/zfKHOW6/jpV4LyKsEYLTEKUW7ZCv8Tw3h3uQRrRfX3hjw1UM5xD3XjiKqud8pMgRCL739YHu6N/KL4wZZQCzKil2DNK5OuOwdLUF48EylgfrXAurHUcVqxFSnANt0nhMIV7A1dKdiYjlhDqCxm0L/Xra9ysAyceUGh8hSlFTD6L81oTJ/t1fYI0Lv7yfavz7uiHGotbOPms0LRmM/bdiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by SA1PR03MB989268.namprd03.prod.outlook.com (2603:10b6:806:4f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 15:44:02 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:44:01 +0000
Date: Wed, 11 Nov 2026 16:43:58 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 03/20] ASoC: soc-component: move
 snd_soc_register_[un]component() to soc-component.c
Message-ID: <avSNM2TntwbafgNC@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <874idpntsx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874idpntsx.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPBP307CA0007.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:1::10) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|SA1PR03MB989268:EE_
X-MS-Office365-Filtering-Correlation-Id: 0225fa4a-f1af-44b7-9ecc-08df400a9b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JpHdmcKZxaJNYgzS2Ecouw2KixTK0uZsq0tnVFhG3mjX+qfNJIRKv/gAynVd1ouKRAEYfbVP8FNpM5uZxKDoLIBlsyG0Eojdm8kCyZpdcoeues2F3Y/vQ1a8PhnuK0W1rgeuyOXOcCcl01YYCvlZGTsRTdUamSfJ2YnIKXJiQpYtEW+qM+OoY3cujFy2DirT8+nhr9Ocqxa/ERpdTlzpVxBMIUols0q9ZX7EtRpXCDfQqfAjKeqwSu7JMUT5Dgk1CIUIeL0UbJFn7ocy8bzVDL8TKDqYkiCQOHnsCF1knY2oUQn70qtkichXH4D5h4dWFz+0xXzSfZpbHsgJj0hrzR8Sjl12xPf/zPyTx/SHK73Ha51zJMR1yR6HaHxz3qFK2t8CaVQgxcjYDZgqyFMCXhy+snZ96IXgjhHchk+dyvNjejPIAHvEEctoLaYY7zwBJXwIuVKfhpDA+8sWmzONm4yvDu8K4siI8mBGh9fZ6I++zgFtQUPY6lE0jl2PFV8IktRj9RtjYOBqXmMj3vC2WcDNtVZas+hqln0mDlpUPAOezfXGKh+xnj/aeJI1k578jpNTnRLlcju/ciUeuNz7G+auIoVvn/4fB1aSogl9tAKerrv67CcsdCEHz9fSl/frMPG4bN+C2K4i1IcVJaw0RYFIx+s8iwSLI/37puqWRIU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3NsMlc5UDFuemFubXM3QWpZM211K3NMNWIxbmtvYmFMVnlXYXdsdXpIZzgy?=
 =?utf-8?B?SXdrL1oya3R1cFFSMm9EL2JIMGJUdUlWTDI4ZkJjL2xaZDdGOUVZd2tWMnNZ?=
 =?utf-8?B?UkpNcEYvY3V1M2cvZzc1R1dDb3FJQlZnczR3Ymg1aEFYYWd6cGh5emVWNWRK?=
 =?utf-8?B?QWkwS1RnQy9DZ3d2dWhEQ2IyS1IrNVJkbGYxbVlUNy9mYXZ3V3lTLzNSdGho?=
 =?utf-8?B?Q0kyVk9ZN1FNSlM2YkhoU2FodG9RbEFEM21JbWNMVHYyVURTQkN3WHRTb0xQ?=
 =?utf-8?B?N21nTFlNWXl5aHB1U3lSUFV4YUpTYXFNczNRVmFjNW5jM1Z0MG5GWmRSeWky?=
 =?utf-8?B?TzZqWXNtaGFNcklkOVZJeUxLYk9lajkvVksvWmJQNm5kQkQyZDdyK3VlSHJZ?=
 =?utf-8?B?dkJTYzF0aDlaRFptVjBkQThveDRhcmZnbEFVaFlCTzFySy81TWZhM2ZWTzkr?=
 =?utf-8?B?MkNlL3pSajkvVlllcEZMMmRUanVBWURmcm43Q0hmK3lpZXEwbEJ4TU5TM0lt?=
 =?utf-8?B?NTE4eVUxUlpmbmNtL2VFdlNkejdMUTlCQ0J0US9hUTRiTGZ6aTgxZnJ3d0dC?=
 =?utf-8?B?QjhEUCtWVTVTallncjdnZURZT3lJSUhIR2lXS1QyUUVZNytDTGt4am5RQ2xE?=
 =?utf-8?B?S2krMk5UMVp1SFBwTFNPTDVwK3BmaERLa2ZPdlRuV2NuVjBzSU9YUFZXRUp4?=
 =?utf-8?B?dG03b1c3a05KQXVHdmo2ejh4YVhQRkw0elRHTU1DSE5EUUx1WE40S2NBdDNS?=
 =?utf-8?B?VXljRDk3MUJnQzVRaWZXN0YrSzJXNXc4cUxkQ25XUmVUSTdzakwxbEp0SXhF?=
 =?utf-8?B?aDFXK255MndYR09pcU0xRlk4ZkUwbDVEMVhkZTJMdGJrd0pZd1ZTc2lrbTda?=
 =?utf-8?B?Zm9hMkpyMGlNbURiNEQ1UTZlMEJNbkNyd1NGYVZ1bXNsakllYWh3R1JmVHBa?=
 =?utf-8?B?Y0JxV0h2QWFaYlcybUxqcmVjYWZpNE5EUHFVOWx2SmcrMVlkdTFvQnJUbzZu?=
 =?utf-8?B?YmNvL2tzNnFMcHd6T2F2eStRMXFETnpKY1ZpaTN0Y0FKVFE3d2xEME50OHJZ?=
 =?utf-8?B?dUtPRW1sSVpEVllQa2tKZ0RlWVBUWWt2WWZDUUdSbmVPT3VudTA0Wmh0cjlF?=
 =?utf-8?B?OWplcTdPdVdnRmJOQVhFYXltbFlRZVNyMlpuaFhxVW15U3hORlJXbWVUNTdI?=
 =?utf-8?B?Wkx1Z29BZVl4VFdaUTBDWk5nSFpva3grTjlLREFzU0FCdEs4VGVuTWRHNi9h?=
 =?utf-8?B?TXYxdnBSQzRNV1A2R2FYNXUwYXlzc0Q1VGJ2V0ZkZjdkeXk5MWdyRUJudysr?=
 =?utf-8?B?VmVheVE4YTVVQUw4RitXcEJId0s0MjQwWlZJam1NYVFma1NmVS91STZiQWlY?=
 =?utf-8?B?K296ckNQMDJ0M2VsRXUvcEtmN0FuTCtjTEJkeDBSQTFtVUw5RG5MeWgwajIy?=
 =?utf-8?B?QmEvUHo3dWJramd4Slhab3dTMkwyQzVhUUY1Rm1MNXlvZUlyN09oT09jejZO?=
 =?utf-8?B?ZUowKytOOCtCcWRaQkJjNWx4ZjV5MDdMcDl0U242bGh3R0o0OFZNRE1Ub1pL?=
 =?utf-8?B?U1RmVVcxVWJ6VWRrdjVXUDBaeUhrdi9BT0RvWVdnOWN0YzNVdFdvQVdnam1z?=
 =?utf-8?B?NUUyMEJIR2JUZk5sTnQvOFFVQlA4bXhkVUFTTVRWVjBuMWk4NWlJVmxLUStm?=
 =?utf-8?B?WnB6akpHdC9qVUVUcXJYQWU2YXdlWS9XaHY3Mi9uSlpXbXp3V0FXRkRRQ3Ju?=
 =?utf-8?B?U2tBMzR3UFNGZVVobHEwa29pMngzTVFUK1lPbno0TGQvdmNDOXU3SnNnalhR?=
 =?utf-8?B?cUhTTE1iT0kvQmY0bHV1L2w3aW8rTWtPTFN3cENDR3QyaFJOS250dGFmM0Q3?=
 =?utf-8?B?bG9NcldVV01sc1MwSHYxVE9KZkw2Yys5TUFWVUZ6UWU4ZmhqZ2M2MHhXM2Fu?=
 =?utf-8?B?enlRZmk1NDhlYWtCRXBrcGphdHV1bUc0eFZ0Rld2czhnRkt2c2tJZFhvcnhN?=
 =?utf-8?B?US9jZkR0aHlDUDRvTmZqeWF0Mmg3blhNN2lnSXFPZzlhK3YreUx2cGpuZFRY?=
 =?utf-8?B?KzBHR0ZDdzV6M2gvdVE5dG1TYWE5QUdUVHY0WTdSbnhoUml6dW1PQlRXYWtG?=
 =?utf-8?B?elJ4elhjK2dVbXVkWlZJVjc0SUdKV0xKNEtKRDZjbjYreHdjT1h5R0YzOCsx?=
 =?utf-8?B?VC9BbSt1ek1hOFFtWkJuRllVY1NIMVpKKzJOTmtFbHp6UjBMT2U2NDl1ZGtB?=
 =?utf-8?B?bXFPaC8reHVnaEFYakwxSjF2c1NydkkzY1J5UnREQkw1dEk2MDBOTTdnUDAv?=
 =?utf-8?B?dzdVNGpraTFJVVRqMnY1SmtiTFdxWmdWL2tLQk83b0l6aXo2WENpQT09?=
X-Exchange-RoutingPolicyChecked:
	xeQuYHUaOs8UOGCqx9GqjDNqpIXbAigNnMWu/bqLSnEYluorwOf5+kAoHBfvRuNa0hoUlY33lpMwdxhf29RKbvOmfBPxu6rHCzS5xa18au0Z8NLOn+UhMbExilrpaA2ZeBsk4gt2iNhQ4Pe8e/TInE8yCbh9jWHAksvqWCJgEtZiCHQxHX0xkLd2XDYdPavaOzvMdsVcs6Cq8hpNKCe/ZCMXicpUP3SeDXtrGOcgxsnwFf8oPOJNl0JuDzKBLCoBH8slCRMfg8+pkmRqIz8z1x34gSqohGylcLoeAUKQ89BqFOVribBFMozP6rzNTH1IE/VNvFkAKPUk+agG9ji8oA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0225fa4a-f1af-44b7-9ecc-08df400a9b91
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:44:01.6281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrpAMhHCrPyB8KtqQGOIQXGeLcZe5IsfqGuyzURI1dbkw3rQTaqsOj077pflzrBHKkxoREybNJwMWXBMoJvVCJgz8MBsaXv8z8VaaVNM+q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989268
X-Proofpoint-GUID: iMQcqFnR11i1PpJ3gaf8K_nUdQ6zmWx_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX0ZiSAbeiwnBx
 scgsOefQi8CPm4uf+a0VzUMbuTbDAnr6wOmTqHWMz8BbfnreAjZD7v5yN31Yy1mkGyxlua1XlL1
 lIknEgnxolb275lN83WfEgWr1IYRrlTwoTJKR73z4iLRBj7PtbSU
X-Proofpoint-ORIG-GUID: iMQcqFnR11i1PpJ3gaf8K_nUdQ6zmWx_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX2bg7Fr8kxhLq
 Og93JlHctQzgEU+0zdaG3cl0SFvKaa7u1NO77r5Rd/FHRixV3r/rlEyx0sorRmCr7oIm9LGRIvk
 HOqwYEvNJbpytxMZQYYVDlTu1I+Cl+nHujgLWbMDwm3uauQY8QMKO4ZtDsiadLeHVG64ifTiwmc
 HKM/7YtDwH/7U1q9fGvQX3pZuj3Xk3wRs7QHeAVVWfwS+JuMXBsmJRbnEnUEGbtlk3d+LFEOPYv
 C1+SBl15LEayhFPfr741Rmp21N9Zo4oat4vLJVrLfSCI/q3nVyB9NA/igHEZLe650M1YSYTIv9i
 WvoKh7vvCIfI0WwF8bGRa6SvLcHsB6A3t0oNGzSfSIWT9oaG+3R7+hvFYTIPkEa+HCSuW2YsiiG
 nmiUts69hBtQ+fQui5U/FGFafpng2FpNYOhFfB6vPuLXM57yXSALa2zsk1X2wfI2jxOUgxEgayh
 cvyBVdB3ZUmAqKHL9Xg==
X-Authority-Analysis: v=2.4 cv=fcc4WEQF c=1 sm=1 tr=0 ts=6af48d43 cx=c_pps
 a=vcXwJhCbSog8BousImPcCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=OErBuBj6skbQTfkdpu4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:23:42AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> move snd_soc_register_[un]component() to soc-component.c
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h |  10 ++
>  include/sound/soc.h           |  11 --
>  sound/soc/soc-component.c     | 214 ++++++++++++++++++++++++++++++++++
>  sound/soc/soc-core.c          | 212 ---------------------------------
>  4 files changed, 224 insertions(+), 223 deletions(-)
