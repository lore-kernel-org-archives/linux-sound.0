Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03803D953A
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484640; cv=fail; b=PGXRoMOb8G4FDQo2ZFcHmaxzEYsYGinYxDqYfZ77X8iWTcxyI8jGOx0fnNoqe2Uuz1Yve5+U95PiFa3IeNrjzbLshqXrW29AxEv+kFIglwsLmgOZ8UDVd7AWV41/M1WL18OLSRLfJG4FKIwug2xiVULcTCR0dxeWFxU1bDJ8BCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484640; c=relaxed/simple;
	bh=jpwXOsro2SEBU9djlXird/w4nHcDC7U6mBsKVWZNR9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nUc3Etbz/jtoDPafPu+hQf0ctGlUP7WxS1ZAQ1CUuZ06DWhL+39pXUoAwEIK5F3P3exlicwcz1rBdo8ljFN2n3a3+Lr+wi6BKXyF5+A3rhNzpWkaE6mTIKvPcAFGV5ZhOG0sMdCVuhzxgOs6LoNZ/owUVufDEMv3nDplnSdTwyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=QUShSyKV; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="QUShSyKV"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD2496572453;
	Tue, 15 Sep 2026 11:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=eWY2d
	kZuLgs/K7hYkPFk7i5vFwjJR/XCPj+LpHtU8sE=; b=QUShSyKVb9Oijp5b+ZfA6
	8imHPnfrk5ae06ElpSa+ClruAaPfudpmVGQJEZ0Lpoi1zVCSlUQAoG87ywAKmivy
	Be/Cb98sQakFs+wNcZt8sB8nZsl+Ym4mYxCpowJS4n8rKf3aVmWCEgITCvw0r/Lv
	ekudQJ60JuLXFKJZ2XJXlc/wI2/TjinOnpHrDIAQZdmcRHzMgMofFQmzmzwo02lA
	NjOIEzh5HRxmG3cJD+TY2SFcsU++yJ04lrOcVbmsZALFBv5Sj/n7O0S/CO1CHuSC
	cKuLMJDPaXIiZqAyYJN53jDB94Os1ecA44ISvjh7hcfRLLxCB4gIoDpFC+4iXvIg
	g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gq452skfy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 11:03:52 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZnDHeo/RJ4XqGO3fw0jABlm1VJ8iz/q78TmAfbTqv7/VzWsEs0YlcbXnQtGs/wrQSLFe67Hln7pYahye2FhTTWKMxtY1IR/f+L0VIYl2i0QGPWLRuJe1wuuGYebyiNzm9c8zaJmaEPkt6EglbJ7082Mkv9P5i1ej1soxGP5IsfsM7qq6J8u6FJbpCNp1eHfb0KtvwFNK/263Z6xd4NEjZC4vbf4JpVHb8PB8ynv6Zzk2Gjl7AlEw1u8EvbqEXodnShLmMp2rLrrWXYkEHWc3xyve3Ld4gz7HeEOZLcyDm5GtRRwQmjP7PNwZ1S8PV2dRsN9eBlNd4DOv8Dk0mOGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWY2dkZuLgs/K7hYkPFk7i5vFwjJR/XCPj+LpHtU8sE=;
 b=uIS/mhpcNKDwS2LuBg2qwPI+t/MCQqejIKXIavS5k5J9N2jhrH8LJGu0Sp92yMCZJ0fii9bAcqalaUkQRjBcSrLGrcu8QTU6KAEDGz09SZyo8TNuvuHTyjr6kJLqpGw2yTmqfddDrQw874t134D4sBNBG4ZAB44NW0nVEd1lhAnNfRm0PWGuyzORYbaumvjMIc/8jYazykqAzGfMl+QMPM4I/AbCdsVFOLyh8bxAH1sL0dWHrWICGqizJDaicJziqISvPmUcXyyYQj/17RcqWEkr2YYimVvFSijvSUQkEmMReKuPk7qm0L5sRdS3RMHYT5vAag8gSdn/o/kDNWTY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by BY5PR03MB4920.namprd03.prod.outlook.com (2603:10b6:a03:1f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:03:48 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:03:48 +0000
Date: Tue, 15 Sep 2026 17:03:45 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 04/10] ASoC: soc-dai: add snd_soc_dai_{to/from}_list()
Message-ID: <aqlUINu_YUeN9O47@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87ld94li94.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ld94li94.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AM9P193CA0003.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::8) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|BY5PR03MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: 91be0460-db20-4f89-2c62-08df133a8bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|3023799007|6133799003|56012099006|11063799006|4143699003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	s6/LGNRsDzp/iRqjy6rlDiKCBKIJ6anwIpffT09ZZsEqTfVYxUSXUvlRxeeyCNRy0uwsl5AA1nE/sZA9+TVj5adTGLW9PCC6H4g/qtqG4GxMoEOUB+nafiXItkInRJsyvHcmR1Hr66tq+aMIxpyFH/OgUbGkhM05/bkB8THjHaJ12X6YTWdphOn49Ll8yO4DnzmEbLxXiz8dVJjgsnlNuCxtP1h8TLiRjYQ+b1Uxy3bwXWH5fDtC+WJXBtSZManNViEwTDAbTE2ZxbdQbbKI18jc5xL3/PHUJM0X3pJRHqgMkKC1MfuLkFSqT2U3Dm+9luuUnh5zezFuLgH8SRWbCxSLa3U8+moAts+0yvBzm1iq8En0n9lXptID1g85eyeyX9dbbALRj0wTNOqaB6bEdJn1N+Wf2XvHzCwQL+im/d3Fu3c8agfSNKBQZECxSuatBNaZtR/zPSsI8mFpCP5465JXYggVakpGXl/9iqihkX+X+6FO+lO/O/7IzM/ITvpvazEe2rRaZAGz+ZbrTDTXJo8AYkXCX8BGSbF3cJgcuUOYSvkq0234VYcvCB8cIDw08/RdPBt7slKuYQkjl4yTagYHO9sJ82E5dIt3w/blkUcndOaxC+lP5qGm9pZCMxjKysnSSW7KOFdnVK8ytALDtgSXzSqEV+9TeXxZjEB3tII=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(3023799007)(6133799003)(56012099006)(11063799006)(4143699003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHBNUllaZDZueWRweHRNMnppNHIyeDJleUdadzBrNGt6TURsczV3cE5nYW9o?=
 =?utf-8?B?bklzQUc3TDVKUHpkKzIzemwzRjN3QVhadzU4ZlZJNzN1dld4NmRjMDhmQ1Z5?=
 =?utf-8?B?S1IvWERhTUlKSGt6KzZCeUNJWWN0S01oZDlqUGJuT3JaOVpsRHZ0V1ZMUW80?=
 =?utf-8?B?NVI2bVhhdUlhQ0JsVCtMM0NqRXRkRFp3b3ZXNkZSdy81YnBaaVczM3cvSmxH?=
 =?utf-8?B?ZHRMd3ZSRlJwc3JYd0JyWXdMa05OMW9FeGNFc0NoM2ZKWmdyZy9rc3IvV3RF?=
 =?utf-8?B?cVkyRjhwVWtkSzFmK3AxaDJVNnJidkNmVTNSRTRyclJleFhHZGdpcFAveXNk?=
 =?utf-8?B?MnZEekI0cmR5Zkl1TGYzMk9qaWlva1NuQ3d2K1BpajFtTk9GeFB4NUJBbWV5?=
 =?utf-8?B?YVJXaW1SK0RjbFRPdG51blhMR29kUlc0R0pNU1E3U0h5NGo2enBhbm1wems1?=
 =?utf-8?B?aVEwN3JSc0JPNllHY25CbVlnRUY1MFdCNWtCVXZUV2hkdlIvaXBrUUphWHRZ?=
 =?utf-8?B?MEVQbjY3WTdIcytTUFE2YmRXWlJLUktFWTkzWStJOW5pK3hwU3NZSE56Y0o0?=
 =?utf-8?B?cW9XTW1NMWswaFVZYStmbUVqcEQ1QkF3VWNpZDJyZWRWc0t0TkwzNFFDenRU?=
 =?utf-8?B?QXJVd0xsSFRRR1J4YVZudFhuY3NUVnp0RG52WW8ySzBWTFpFU0dVZ0l0cGJM?=
 =?utf-8?B?cnN4TWR4bi9yeWNwWjRXMmVPb01kUms0czVhK1ltNmNmTTBtcFg2OHhpSFdw?=
 =?utf-8?B?VlBsUno5UnhjOGZ2VjZoNC9ES0VzUlpCY3NZdUVOVzRFc1lmWlN4dFplMUl4?=
 =?utf-8?B?QlN1dVJpQVZzamFONGcyN0MzRzFVdDRNL1hnWjA3OUgzZFc2MWxPN3NTZnVs?=
 =?utf-8?B?dFRLZGVUZlhDWUFJdkc4dlFxM1lNcjNrVVIwN25vS0JGcDczTjVkMkV0c29z?=
 =?utf-8?B?bUxHck93SHg2QlBqVHROTEdxQlBJWG9UQmVmeDRwQWxwV1l2Nld4dnZ2eTcr?=
 =?utf-8?B?S3M2OHd1NmJlYUhidW8wYk45TmxvMUFOSVFpSjJEZVcyRzFXeUhHeVRxQk9Q?=
 =?utf-8?B?cmhhU0dLdXErcUdjYjBPeGRudmFCTnVnZDFxWFhEUnluVjJzNlFvc3htTjNO?=
 =?utf-8?B?TUFqdHJrQzBtSlZWRVBmdFZDR01TSmptd0lKV0s1UkZXcWIrNXZDbU9kamNJ?=
 =?utf-8?B?aXNFWXQyL25id05aR1liR1dNaHRycE5FdUFOREdpeTRtbHpXRTkvcStWaE5Q?=
 =?utf-8?B?K3l0ZkpGYnNxdHFPQ1ozQTVXS0daQ0lkbk5qMlEranppMkZRQXhQMFl4MkUy?=
 =?utf-8?B?TU1hVVl1WWFmMVl4SUNVbkdPelptOWVMQkZuVnpZYmgxTkxnaEFTcEJiV25G?=
 =?utf-8?B?NUwzMCtIcHJ4MHVHNWZPVVZSN2VHS3lhdlpnYWxFc1JLL1hlTlZ3eG5aVzUw?=
 =?utf-8?B?RDhhK294VGNKdytOQ2N5b0xsb1FSOG01emNoMnA4Q3VrOXZoNGx6QWVJNVpk?=
 =?utf-8?B?a0wrS1Y5akN5RjRGYjdNZWUvYTJrcTdlcS9MU2lpSGdPOCs1OVNwcFhJcG1w?=
 =?utf-8?B?SUlhWTJFcUY2ek9jdGYrWWhZYXNCdTVEQU5tZkpjN1RwdTRmeUdCTFU5RDk4?=
 =?utf-8?B?ZXkwd2lkVVVmdUR1ZVRic3VLSGoxeW1kTGkzOUhGRExvNW9wZGdrT3E3TEx6?=
 =?utf-8?B?cmNhbGU4a0JrZ3FwRzBqMnY0Y2w4N0dCMWNteEtLL1lDRFkwUStIN1QrVWp5?=
 =?utf-8?B?eXljeC96bzNFQW1LUktER3Y0OUoxZjhQK3Y5Q3VOelVQQ1VoYW54Rm5HMTZv?=
 =?utf-8?B?RXlNOTdvZkJuUDFzcWIyOFg0WnE2TnY3ek5zRWNQQjBselNVTjFYVzJGdHd1?=
 =?utf-8?B?dXA4elFJWDlsMnM5M2tzZ2YraTRHZWsxK0ZuOVhEL29YZDgzK2NWMW5CT1pU?=
 =?utf-8?B?K09uWXhkd3ZlN0Q4ZmcrYmxjeTdMNG5TMnZxZWtuUUh6a2dwZm5WVEdFVFI3?=
 =?utf-8?B?OThWK0wwRHpxVzNsYUZuaHQwSXJWTnR3QWpkWjBBLzdXd0ZDanZhRmcrUE9y?=
 =?utf-8?B?bTlNOVdWZjAzRGpsbnVraVBsT1NZR2l6QU1DVXFGSFl1UTJPVFFjajVMREcx?=
 =?utf-8?B?VlR1NlhuSlEwRkF0cXZ6S2FERkxjY25HMFNYanlMVUFUMitGOVdXdkJvY1RQ?=
 =?utf-8?B?VDhLMldmc1gwMGJ3WFpiTVpjakgzSy9abWdhdlcvRWNaWUpGOHBWelZVS281?=
 =?utf-8?B?SVdsdGJqMnlkVWdMaDBnUjFZUXduTTBkdHRwcWI2eGtxb0ZzRGZQOFVPNnR1?=
 =?utf-8?B?ZFdXUTdoTEZKTnJHdXNIU2FqTzNiS2laVHU1cjcySTFZLzN5dXBOdz09?=
X-Exchange-RoutingPolicyChecked:
	qFSKe0+nqAKdEGcWMIqCGoz4RoPQ7Tlfw3Yr1v0ABgny/MS6GrevbXrACmEio+1vaLUpkF0BlcQO+mMWcdvKF8/7M0KWGqdw1v3SdZRzxhIL/aCKwLhaJPTTnETDYteJt01fRkO25w2+t6Xhe2AtfHvo3RVn/DPW6Qs6/AnxiBNLuPgdeHitrPhYRabnq/oFBQ12gZEIHoRk1mZuAnZt8qH+PAOfZpe487jp+F2I6ENqFXbXBUwodo2IauLQ0AcJliOWxKReZPI1QcD+At6uGWuwUkNm7YBJFRO0nyyGq0tgVT9uIBj8ENCgh3doF0V7e6YK8w6VdFTiaf5PpgSXKQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91be0460-db20-4f89-2c62-08df133a8bb9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:03:48.6572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FmT8xqBbATjAA7e1zBrdlCIYcO9B45yYhcdTLU9X9pmikddYbE2FzfGgH3/Z/ZoQ331fOW30RsamrJ2rLnEna2VxH9pg8E+mrCu8CEgA8jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4920
X-Proofpoint-GUID: lgm-Koi4wfqW3Qh9uf4jMCrxg2f0Hg4j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIxOSBTYWx0ZWRfXznL+Uqz7uewp
 p6IMIm3tLr1K5+66WWe9pwQHIxoPI1nGBzBHFPQaP1jnkdH8bk/AbZ0G/7kVKr7cgSPh8otkPQB
 9hXLesiTyW+0Wg4yu7NAND+ie8vHJztT4UNnYjiVAPkM4TKdJdEX
X-Proofpoint-ORIG-GUID: lgm-Koi4wfqW3Qh9uf4jMCrxg2f0Hg4j
X-Authority-Analysis: v=2.4 cv=ZrB4uN7G c=1 sm=1 tr=0 ts=6aa95e59 cx=c_pps
 a=htKwazZePKloe4WR6Wq9JA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=CjqNBckIvtO--ON6t7AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIxOSBTYWx0ZWRfX//uzwbt6wo6G
 FfWNQ9hvXLr5eUl3Aqy6xTDqB2vSp2qb7oex7poQaZSc0hqvouTV+rcNT03CB29aI2iAzr/Vfn5
 u49+VRHDPobcA25p6KI7fXI/dBNm0vAnLbZL+8+QbKUMNxjCtC4U1XUjO1Og2X7b1XPRTQyBU6m
 YoZk+snCXk7J0elKVPD4zGqPKCEe79J4hBkElBi7GdqswZSwgRPbE/lCU3GSmtkTf8c236nURD1
 SZaXi382PnzEcpd1MIMt2moMgyqzxg5XseJaVA0yJPTVhkb+hOM0Sts12UGBpph/b9MO6JCPhrZ
 QQE98gxFRKTXlRNn0FG1m3d9aOITNooY8Cre3MsR8yRhdQLzz2DfevNw9w72+Ubor2/iIlkD0Tb
 Cj81bzDfm083TbhverJ2owj+9fiPDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609150219

On Mon, Sep 14, 2026 at 01:43:51AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. add snd_soc_dai_{to/from}_list() to use for_each macro.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-component.h | 14 ++++++++++----
>  include/sound/soc-dai.h       |  2 ++
>  sound/soc/soc-dai.c           | 12 ++++++++++++
>  3 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index c49b59630101f..6c1acc984ecb0 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -258,10 +258,16 @@ struct snd_soc_component {
>  	void *priv;
>  };
>  
> -#define for_each_component_dais(component, dai)\
> -	list_for_each_entry(dai, &(component)->dai_list, list)
> -#define for_each_component_dais_safe(component, dai, _dai)\
> -	list_for_each_entry_safe(dai, _dai, &(component)->dai_list, list)
> +#define for_each_component_dais(component, dai)				\
> +	for (dai = snd_soc_dai_from_list((component)->dai_list.next);	\
> +	     snd_soc_dai_to_list(dai) != &(component)->dai_list;	\
> +	     dai = snd_soc_dai_from_list(snd_soc_dai_to_list(dai)->next))
> +
> +#define for_each_component_dais_safe(component, dai, _dai)			\
> +	for (dai = snd_soc_dai_from_list((component)->dai_list.next),		\
> +	     _dai = snd_soc_dai_from_list(snd_soc_dai_to_list(dai)->next);	\
> +	     snd_soc_dai_to_list(dai) != &(component)->dai_list;		\
> +	     dai = _dai, _dai = snd_soc_dai_from_list(snd_soc_dai_to_list(_dai)->next))

Hmm, I guess later on you will have to also encapsulate components, and
so this header macro won't be allowed to expose (component)->dai_list
either. You will need some function like:

struct list_head *component_dai_list(c) {
  return &c->dai_list;
}

Then it will be kind of an explosion of function calls when
iterating:

#define for_each_component_dais(c, dai)                   \
  for (dai = dai_from_list(component_dai_list(c)->next),  \
       dai_to_list(dai) != component_dai_list(c);         \
       dai = dai_from_list(dai_to_list(n)->next))

That's 4 calls per iteration I think. Idk if it really matters.

But if you find yourself repeating the pattern, maybe some generic
helper like this would be useful:

#define list_for_each_opaque(pos, head, from_list)        \
  for (struct list_head *_h = (head), *_i = _h->next;     \
       _i != _h && ((pos) = from_list(_i), true);         \
       _i = _i->next)

It's ugly only once, but more optimal (only 1 call to from_list per
iteration, and one call of component_dai_list() at the start).

Then you can do:

#define for_each_component_dais(c, dai)                   \
  list_for_each_opaque(dai, component_dai_list(c), snd_soc_dai_from_list)


It's also fine this way though!


Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

Kind regards,
Alvin
