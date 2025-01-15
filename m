Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2056.outbound.protection.outlook.com [40.107.215.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B885223;
	Wed, 15 Jan 2025 06:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736923540; cv=fail; b=kNKcaam+D30gX6z2rzvtxpPanRHYacWFeNfCk8HVFFe07dJM4gwcv5YNoe/CguguYa/5qeST8vshsz3DM1Blup2bc71PRdPp0/Eyvp5TQR8ytvQr2zLXV/EVNJMpDFfCSiNI28uL5t92ycIua201y8iTuh79jL6toPKaO4BZT0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736923540; c=relaxed/simple;
	bh=qFlPMy2DndVgrI1qcE88GO924g+PCx7jkXpjqFTwcaA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XR+0a8TBpYAo3G3J1Ee3/dpK6j8dQ7WO/NKtmT0+bG6p9wh2IZPaLAL83gKY7ucZki6jeRpyfU+yHpmo639fBYSu0R7VarktJX3XXYGGKr7UTrjobx4f6YKNJYQ0q/R5lDUlWEcWc36fQPeazIZNV50kwTm8xY4P2tEBhbEFcOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=AggI5xkk; arc=fail smtp.client-ip=40.107.215.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="AggI5xkk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4N9HVK9eDwKnQDgHFx7UMSSvCXZPMT/rFZD3W4Hv0lwr5mLkKUYwAAtHfoKpGot6l1UVEl5rbHN/13hkk4tar4+WT9mCSXRrS+9hLoXNuidlZod9cwFuZm0neL1VnAd0Q3CnPa9Q8VFTNc9A18B43mHtSHAcGa6jUjv6GBFGPOxsbIz1GiYsGfClJAYrphteCavKByfA1VMJlW0E48rgJy7NCi6yh5Wj1wTozNg1Enoqrf3gzI67cT8/HrYBvn/a/be0xMte6Nj6z2gnBPtyzpGGI9WYlaWTdlFxzlf+2Dq/2Et0Vyo1og/+iQWdewJTxUWT+NodSi8pfeCB9UhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFlPMy2DndVgrI1qcE88GO924g+PCx7jkXpjqFTwcaA=;
 b=UVguC1zXkt4Imtt7s0FIZlHwuDWzby1p+GDouHQQPezITAESDpH9aVIovIfQ1m4GPzr0tK2bxDzDWN1IV7DZnopyhuRwvdC1DjJWlnmQOb1I7PspBCGI+osRReLh6nyrrRQIf0wsNAdUIRQ4JA5TnzhjkV2pbmUqnvkKahybpTXuOe0bfjGlcS2JlKG5ZD11frkft3i5Tf4mCpWjxcMNAc9lXrgmXqWkVC/yJEGu5pX0++ypy/AL0/X05AnHFiHgjKr9mPc9/yCyKykFw6Ry3t/5LD2p9D2gVuzkxS1JhwVs4TbfHWP3UgDFZQ/iZ65mpKgUbFDw4EvvPRFyLCNLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFlPMy2DndVgrI1qcE88GO924g+PCx7jkXpjqFTwcaA=;
 b=AggI5xkkrSVBk+TmTY59Bar2mjMclHSkILbRF2rr+/b3CMGk1MnoqsA9L/ooFr1vltVg7jB9vwOMyX4Cbe+wKG6y+/IL6kv460QAGwQsHdr0KZ5lGvA/lY4Ifh1bcgZpPRkdrpxtKThE7/xcRMw5KSanzRCcLTLEtNCCJnIPZZxNHiJPyG09zHA1081lqRZMXNAVpX1FzlutytY2NX9a6rdijvNfQF0wBv6xqE9ky9SC5kdDTskGJ4wczSWgLUL6wImoRXSsSG6oRAezgKDxrwS+zmEy6Qwo6s8ah8VIAqL+0pbMNsd/S/bvRZGt1X9IemRCHpZnEbJC95l68wcdeQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEYPR06MB6453.apcprd06.prod.outlook.com (2603:1096:101:178::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Wed, 15 Jan
 2025 06:45:33 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%7]) with mapi id 15.20.8356.009; Wed, 15 Jan 2025
 06:45:33 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"lina@asahilina.net" <lina@asahilina.net>, "mbarriolinares@gmail.com"
	<mbarriolinares@gmail.com>, "wangdicheng@kylinos.cn"
	<wangdicheng@kylinos.cn>, "cyan.vtb@gmail.com" <cyan.vtb@gmail.com>,
	"dan.carpenter@linaro.org" <dan.carpenter@linaro.org>, "bsevens@google.com"
	<bsevens@google.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] ALSA: usb-audio: Add delay quirk for USB Audio Device
Thread-Topic: [PATCH] ALSA: usb-audio: Add delay quirk for USB Audio Device
Thread-Index: AdtnFv8z0lRZHPtzSmuJqDN3ZgXhGg==
Date: Wed, 15 Jan 2025 06:45:33 +0000
Message-ID:
 <TYUPR06MB6217F6DFCF671E7B0E001D9ED2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEYPR06MB6453:EE_
x-ms-office365-filtering-correlation-id: 6b6f9f3d-fc29-452d-506a-08dd353035c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?dEl0bm4xczdoNkVmbEJtZis1bGs3VmRPWFNsSDRpUWVrZlJsbEczZnhQSGps?=
 =?gb2312?B?b2RqWUhFU01RaEUzbHkzVVRqWUtKTnZVbTVrSkx5Mk1kUEVvblZxRFJjNVM0?=
 =?gb2312?B?aXZTU3NPRUt2TENMcHpLVUVucDN4Y1RiWUdBd0ZFeDUzZHFTS1FabXNnT1Fj?=
 =?gb2312?B?MXlTRDdZVmFJbWxKbFVlNTVTM0Y3NzY5a2pDYXEya2REeWN5MytZWlhSTUJa?=
 =?gb2312?B?S0FlOUkvR0xZV3BRQkxhaEExdnhzQ2loc2ZFREVpSzVMMnNBNGRZdXo4Yzhr?=
 =?gb2312?B?UVh1SGVkSHAzYTNJcTlEb0lGQ001VzF2dWRYclhZcFlEdXd5TkMwRHVBN2tS?=
 =?gb2312?B?WEtLa0pFNHc4TWlTVEJRMHhNK3l0WWg0WDBJRVJGendhdFhRWlpVbFZHSVpa?=
 =?gb2312?B?WC9ZT2JZcDVodDVzbVBMQ0Rscmw1ZXdDZFhXUDdVVXV0VXhtVHpWc0UwRnc5?=
 =?gb2312?B?Y2RXVlJvOXlmZXRBa2M0MUFnLzYyMDR6c2NrcTE0d0ZlYmM5aUdOM0hBZkp2?=
 =?gb2312?B?OC8wWTNjandWR1hrRzhabUdoTHZucEtXdjZ2bjRENU95NlhrcnB2V1JPWGFK?=
 =?gb2312?B?eGQ1OGluZXNncTlvVkg3Vis2VGVYRU82cDlBblZLakxsOXpnVkN6Zko0Zi9r?=
 =?gb2312?B?TjNqSUc2ZWcySHV5SitiYzQycmdhZzVnc0xZVWxiQWtyU3VOTEN6VE1PUnZQ?=
 =?gb2312?B?SzdnSjlmVmdmZlJPZjZDdEh3cnlFTFFRbE1mZVhEVVhpclVGMTZpYTV5TFZH?=
 =?gb2312?B?V082K2c2S3J5OUo5TzJQVTBPRXlIZUpZRzB3NVNLUjV5WXBYV092SVU4R2pB?=
 =?gb2312?B?R3dTWk1tQ0JBa2VsR20xZ3RZNVZhSlN2YWdjdndHbXE0ZWJUN1FTLzZjTzNT?=
 =?gb2312?B?OW1jTFl0eThSUkplY0hIWnlKdERXQ25qNEl0a3hzWTFMTUhGTGNqQ3d6TjlT?=
 =?gb2312?B?SUhMeTNvdko0SE02eG1DY2lwclhLMmI4ZHlraURBaHp0dTdoSzhveXVuWUhC?=
 =?gb2312?B?Vi9KTWRJaVg0VmJZaFljUXdqeVBLRnI0eWtqQ1pGN0lJWlZ3VVR5bWNwRjFW?=
 =?gb2312?B?MmdaZGVYM2NqVUFESWpTSUowYmNpNVo3aEkrTDlHOUc4cC9hRE5nOHdUTHkv?=
 =?gb2312?B?V1dwaTVxbDF0U1UzUkpuMEVXMSsxVEhENllpLzByTmVQUWpGLzI1eEF5bEp3?=
 =?gb2312?B?d2lEVi85cHdCdFQ5QjVJRjR0bFcxRTdIM2ZLRk1jSFp5S1YrMVBLTUo4d0F5?=
 =?gb2312?B?WTlvQmJSZzdnalE4SkR4ckpkZS9ZVXQybjdqRTNsUjREemVYSWdxaXNiT1lz?=
 =?gb2312?B?TlRJV0hpVDROZVJZNEVDRDNWc045aWlHOXdzZ0lvM0puRlVFSlhwK3VvS0hq?=
 =?gb2312?B?ZzRVWUVwMVVqckFEUGFHTXNQZ0VUZ011L3VsSEVpV0Q4OU0vSmh1K28rYlNn?=
 =?gb2312?B?VlFsYTA0TmR4UzQ0dVZWSFo2RDRseUZOZ3RqSjlhUnZCbStUc1FiamhvdWZW?=
 =?gb2312?B?VWptTzNDUFo0bVFOUHF2VDZFUHRMYXB0SXFPMnVKUk9CUTdjSGoybUFTdlIz?=
 =?gb2312?B?MStQaXkwNlVFbHZUTWtTTTFrRllwM0RLNWhhTUgzT2ZlN3JqR1VTNEhSbWlx?=
 =?gb2312?B?ZVRTWVowT3BrTU5jTHdoRGU0VDFMakhMRjl3OXAvOVF3YllCNXdpVThuRFFR?=
 =?gb2312?B?RXpwNXhKeTBLWjFneXI1NCs0T3pMd0JjY24yR0JPTmIzSHF1T1dJZjRzbEJQ?=
 =?gb2312?B?Z09qbE94cGJlT1pFaFhCNUwzNDcwSEVjS3NmM2g5ei9BdTRRNUZBR1pVeEhT?=
 =?gb2312?B?YnVHQWJVUWNSRW1KZFFPL0t5dkdFa2dabkRQRmcrdmRkZnFGRHVnYzN2dGh0?=
 =?gb2312?B?RXdCM0R0ZWxzYnZlTVp4UUhlYzZWem1vQjF5N3lacnVtTnptNTVGS251S3Fu?=
 =?gb2312?Q?Pb/7ylwOUs+aRYMC/RbHph8ysRVNP7F9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?SkxQZi9JZFd3UXhvaDVDeHRzd3dMWFViczhjZUt5RWl2QmlLUllPbG5ZUGhE?=
 =?gb2312?B?TEFlU0dTdGJHREp6R3F1NmVRNFlLV2wwa2pFZmZiWW5Ta2VHVU92Y0pDSmtL?=
 =?gb2312?B?eDRFUmp2d3Q1NURIdWFZY3oySnhzUzlSNTI5bWIwbFh6ajlXUm5WaVpXRkdO?=
 =?gb2312?B?TjcxdWJzYmtLeWU0Smxxb3RSOHdTb2Z4WG1yVTlrRkpicVNIbUJzZ3dWMzVm?=
 =?gb2312?B?Q1dsZUU0ZjFDSDE4eWk2QVFyc2pQc1N4dGV4QUxnZkFXS0tiSldML0Y0a1Js?=
 =?gb2312?B?dEZMVkc2Wm5CMDRTa05QdHJCRGY3cUxpUVVLblFqMFltM0dRQTJiZGxHT1dF?=
 =?gb2312?B?YTNoV0wzRVh3Z2IwNHlwTkZKb3V1MUt6b2duaEVNTys2dVRMZUxnK3JSamFV?=
 =?gb2312?B?dFlVYnZnek5IdmhOZWNoNjdDV3RmOU5vamNRQnR0ZEZKNml2TDc5U3BGVjRS?=
 =?gb2312?B?UEVuSlI0emk0TzFGMnJWTWtFejhwcTd5UnB6aUdXRWljcWFwWGQwVTJUZzlJ?=
 =?gb2312?B?V3ZoQjFQVDBzOElURXBLaFFJbjFHa21OYTNRWE1UUmhpNkt1MXpBc0JpZksr?=
 =?gb2312?B?czgrS3ZEZDdzUUtQMkdMT3RndVl3bTNnVHZHYis4bWlKb1Q3bXFyVDFMTXdB?=
 =?gb2312?B?RUR4aHhYd1hGUU5rQStxbk9xQVBIbWtPN0krUndNbTZSY0VidEJXVmpGelNF?=
 =?gb2312?B?aDhFMWk3VnlXeWZLVGI5dnFUUmk3TmVVVlBPekJGYldxTTlFdVVZaUp5MzNX?=
 =?gb2312?B?WHdydHlMV2RqRFU2NzBYOTREK3haazBNQnNneG9UWlNueFpZUUtsQlRoVWlw?=
 =?gb2312?B?T05PV2pLTGhDT04xSEhOTEszZm5SdHNoYWRianQ4N2N1TjJIazlJSHZjTXFR?=
 =?gb2312?B?UkQ0UlFGcGxRZUZtUzF3UDlIVlNwRzY4Z1orT2d4VG9RTHNneldrTXpGT1Yw?=
 =?gb2312?B?dTRsYStMV08zUmpqMFQ1eHdmbVZzelJVVWRqQ3N5NUxoakFLaGJPUzkrV3FY?=
 =?gb2312?B?QzREbVU4Tjd3VFY1Q3RBR3lRc3g1Tlk2cHVZOTU2eVpMVitKV21vQzV3Wm8x?=
 =?gb2312?B?ei8wRlJXRkJNQzZHRWNFaWQxdC9yU2xOODJXTnZJcnBkdHMwUUF3YlBMT1kz?=
 =?gb2312?B?TWE0MXl6TFRhUnJITXJmQnA4K3RrZUtPczM1N3hMbEl3UXlOUEp3Q3o1TTNo?=
 =?gb2312?B?bGExSkdxZFp0Sk54aFhZR3hyVVpzRHE2ZUtUZEV0M2h4cTBOVkplU29FYlBU?=
 =?gb2312?B?ZzNONHJzRGgxREtxUDkvSjJiRDc3eFU2dWYydEVHQnEyZ1JZb01hSnV6NlBu?=
 =?gb2312?B?L2Y5cmljWHYxOUtFeVl3dHlrRUNub3FZMmJ2b054QTRsTU1xUjJpa05LQk9z?=
 =?gb2312?B?bFh1OVBXNUhZWFJqS0NSeklSUWVWWXZycUgrZGwxMHd1SzB2eEFGbWN3NUFJ?=
 =?gb2312?B?eUZTczU5TFMxN0RYcGpRenk2aDdqYk1HQ3dDYUJNakpBRkZENXg0a2tRU09n?=
 =?gb2312?B?NW9JM0xPV3MwWHIwTjFGcjZVeElhZWRqNUJ5WHlPd0QvczVaRDRXdUVtV2dX?=
 =?gb2312?B?bnZhRllrNFIreTBzOWtiSHZWTUZ3MWxFejRqWTk0TXU1MDFCaHpERzB3K3hw?=
 =?gb2312?B?TDFIMERQWUxvSHlPQ1ZsdTRCN05WbGRzM3JKM3dFcDlndnBJUlhMVHhJOGhl?=
 =?gb2312?B?U1A1eEs1SENIZ0ZjaU04RGVKak5YYzFOTUUzQWxjWVh3TXVpTkxjejZqOFVn?=
 =?gb2312?B?Wmw1cm5QbkNvaXZZOTlGWkcvOWU1b3VUREVkbDgrNE9GSW9jZkR2VHZqUjZH?=
 =?gb2312?B?UlNDSXcyNkZTdDY4TVg3RkVVRXA1bUlYY3RGN3p6VFJyTEFycDE3dWRkaTAy?=
 =?gb2312?B?dVp5V0xxajJMakZybkcyUHkvTXhmVXMvZmxhWWRSMkg4cXBIeW1HMUh3dXZ4?=
 =?gb2312?B?WVNBdFd0Uk05T0NwTkNUMlpxakhKTnhkb2hvZjRRdVV1UVV6NVpaTkZMenh4?=
 =?gb2312?B?QkEzWXNVMDQ5YmJYTG1qc2xGcjZlMzJGTmxtNFI2S1MrcjZmU0FIRkdYQWN4?=
 =?gb2312?B?VzVWbTVNYWJrWVlrbm51RTdPUjFndWN2a2hLRnNweDVqVHVYbCtaRFJydzVi?=
 =?gb2312?Q?lipY=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6f9f3d-fc29-452d-506a-08dd353035c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 06:45:33.2902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5/DI958c399ZpB8iZpW7j+Mf+hWDJq9eF/1WZ1/pdtdeXcu5WLnoclBgaA6UBxTJYfuZK7YUue8Pbhozjb68HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6453

RnJvbTogTGlhbnFpbiBIdSA8aHVsaWFucWluQHZpdm8uY29tPg0KDQpBdWRpbyBjb250cm9sIHJl
cXVlc3RzIHRoYXQgc2V0cyBzYW1wbGluZyBmcmVxdWVuY3kgc29tZXRpbWVzIGZhaWwgb24NCnRo
aXMgY2FyZC4gQWRkaW5nIGRlbGF5IGJldHdlZW4gY29udHJvbCBtZXNzYWdlcyBlbGltaW5hdGVz
IHRoYXQgcHJvYmxlbS4NCg0KU2lnbmVkLW9mZi1ieTogTGlhbnFpbiBIdSA8aHVsaWFucWluQHZp
dm8uY29tPg0KLS0tDQogc291bmQvdXNiL3F1aXJrcy5jIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWlya3MuYyBiL3Nv
dW5kL3VzYi9xdWlya3MuYw0KaW5kZXggOGJhMGFmZjhiZTJlLi43OTY4ZDZhMmY1OTIgMTAwNjQ0
DQotLS0gYS9zb3VuZC91c2IvcXVpcmtzLmMNCisrKyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KQEAg
LTIyMzksNiArMjIzOSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2F1ZGlvX3F1aXJrX2Zs
YWdzX3RhYmxlIHF1aXJrX2ZsYWdzX3RhYmxlW10gPSB7DQogCQkgICBRVUlSS19GTEFHX0NUTF9N
U0dfREVMQVlfMU0pLA0KIAlERVZJQ0VfRkxHKDB4MGM0NSwgMHg2MzQwLCAvKiBTb25peCBIRCBV
U0IgQ2FtZXJhICovDQogCQkgICBRVUlSS19GTEFHX0dFVF9TQU1QTEVfUkFURSksDQorCURFVklD
RV9GTEcoMHgwZDhjLCAweDAwMTQsIC8qIFVTQiBBdWRpbyBEZXZpY2UgKi8NCisJCSAgIFFVSVJL
X0ZMQUdfQ1RMX01TR19ERUxBWV8xTSksDQogCURFVklDRV9GTEcoMHgwZWNiLCAweDIwNWMsIC8q
IEpCTCBRdWFudHVtNjEwIFdpcmVsZXNzICovDQogCQkgICBRVUlSS19GTEFHX0ZJWEVEX1JBVEUp
LA0KIAlERVZJQ0VfRkxHKDB4MGVjYiwgMHgyMDY5LCAvKiBKQkwgUXVhbnR1bTgxMCBXaXJlbGVz
cyAqLw0KLS0gDQoyLjM5LjANCg0K
