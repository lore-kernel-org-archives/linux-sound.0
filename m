Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011011.outbound.protection.outlook.com [52.101.129.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF6F23F29B;
	Wed, 15 Jan 2025 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736930777; cv=fail; b=t0yh4Wb0uYD7u7vOGh1rEohzqCoNILon7+KaXfUpUr5euzouZlIjsPnyNVsq90I0KoSZZgHFjUTNcuXtd2i0Xda9101FJym1KwpoDAJqVXnRQfYDxLN4JFNRDYWtSqkuv+tpsQ0ha/Ul0CEXCfSNgAP+NjSWSJuvWZUPISe5rWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736930777; c=relaxed/simple;
	bh=SPtOUdsR78VXu2E9FW+oCZ19+0aqzRdoJsQqoxp/EOE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rv8Juubr2U/Ww8GhiniZObSen1TpGeugU71Rm85NEyCm0Lv03ndffy0wwV9kdGrjfqoxkpqZDM3SeBiRkrjRQ5M5xc1I1gBSKFHaiRi2ynilG1cKYtujwuDJyiS2/+aHeRQqrFy3ijhXc8ZjZ25lzG1E3KE+dy6EbMrwecup/1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=o0BW9Kgs; arc=fail smtp.client-ip=52.101.129.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="o0BW9Kgs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWSoiXT1gKR9Gd2ldqggjNuAJ9DcXRzB4fFaMU2+hm8cwhiqruE8GHNe8YEpyR3BmmRaN8bJKVnPxVt3+9WkNtZZm5zI09lFus4C+myUuaDwfwD5F9j+8mppbM0Ouna9mV6uB5kKglUb7F1xfQ1o9i9RtTHpwUu6WKgxtfQce1/nFEElYeMClmN7Ah6UjAHOXG0afjToJVD1zOXc4B1JwSiQSL/M0bst0bo/9klHreeuojZYBbItrMIuRhDYY3pmD9zILD4vKNFJBBqdiZTHczSqwifE5L31P71MIIoa+FGSypGhxuMuZBiuOWp+X0dC2kHkbUJm9mMD6Fb3SYlP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPtOUdsR78VXu2E9FW+oCZ19+0aqzRdoJsQqoxp/EOE=;
 b=NIBl4FO1g/lw/o1EQ7HkTos1zaSyZYLNrskpPsu5xTEgISGZMmGXGkLEXrQgyX6WHhhCJjmVXuJ06SRdLctFz0MdL2Qh86lgjyLGPqQ+PxoPq+PjcOHxtRN8z9y0fSfT1FLVZH7eQq25Bt/wIL2bY2BQ/aeDBUTvTD9BgxWaMR8uxxiyPzqzfVMLocpPLsEdlFS4imILRmimdPQW3AK4cMogh15p7Zu/SMkms07sBFoaidp4VCo4tNk+rNb6k9ApQIvVCUImS3DlfjndpjoSBid9AYOxAHYqguQOC6I0vuBjsDDgxLTBrUrLUP/78XrDXKl7e3q1aha5T0LEmyuSIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPtOUdsR78VXu2E9FW+oCZ19+0aqzRdoJsQqoxp/EOE=;
 b=o0BW9KgswY3GxEzRI+GAEbyZqoU0TmtsHoTjGpSmXZlgukm20ctHwMNUUJuIRh6DKgyqSHR9Hdeg87fvZVz8W62IjsQLRiQNNTVkRpSvoNJd9Mr2U/BVQnrwn6JI+Ns89RVn+Il2Kue3gbiE0dw2FfexNiC6WReQrXE7vvtZF3F3EgNrW8U2GPEcAHJwJqG8zqqpADzgye013F/FCmQiIOzn5hM3NcQ9LVV4WBsTDpC/ItO8a/STsfO4W4GljpmndMvba8QO4dFOEWXXUS5C4PA2F1kWqbgLTHJIMEJn53/o3J6eO7NGwNQlq7zG6eHmRCceS5U0nTpq5hdnMa2MNw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYSPR06MB6713.apcprd06.prod.outlook.com (2603:1096:400:479::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.11; Wed, 15 Jan
 2025 08:46:10 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%7]) with mapi id 15.20.8356.009; Wed, 15 Jan 2025
 08:46:10 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"lina@asahilina.net" <lina@asahilina.net>, "mbarriolinares@gmail.com"
	<mbarriolinares@gmail.com>, "wangdicheng@kylinos.cn"
	<wangdicheng@kylinos.cn>, "cyan.vtb@gmail.com" <cyan.vtb@gmail.com>,
	"dan.carpenter@linaro.org" <dan.carpenter@linaro.org>, "bsevens@google.com"
	<bsevens@google.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?gb2312?B?tPC4tDogtPC4tDogW1BBVENIXSBBTFNBOiB1c2ItYXVkaW86IEFkZCBkZWxh?=
 =?gb2312?Q?y_quirk_for_USB_Audio_Device?=
Thread-Topic:
 =?gb2312?B?tPC4tDogW1BBVENIXSBBTFNBOiB1c2ItYXVkaW86IEFkZCBkZWxheSBxdWly?=
 =?gb2312?Q?k_for_USB_Audio_Device?=
Thread-Index: AdtnFv8z0lRZHPtzSmuJqDN3ZgXhGgADMiKAAACxLIAAALHGgAAAHS3w
Date: Wed, 15 Jan 2025 08:46:10 +0000
Message-ID:
 <TYUPR06MB621751EBD63ACB0655CA22BED2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217F6DFCF671E7B0E001D9ED2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<878qrcld30.wl-tiwai@suse.de>
	<TYUPR06MB6217CFAAB5BFD9308351BD32D2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <875xmglb8u.wl-tiwai@suse.de>
In-Reply-To: <875xmglb8u.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYSPR06MB6713:EE_
x-ms-office365-filtering-correlation-id: 69f0f759-ad0e-4d18-fc85-08dd35410f4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?UUs3OWlvMlBYQVNPQVU2YjlyczRpWGlud25jWDBPN3FoVUJENjVrYmo1c1l1?=
 =?gb2312?B?U0VBWVpaQnpYVkh0M2pobDNoYXN4OTMveWtod1BOKzVlTDljUisya1Y2VVd1?=
 =?gb2312?B?MzV1Q0RvQWcrK0Y5ZjRUbnBsb1NOR2pDZzl6M2p6QUp5UnZXSm9rR09xbWFh?=
 =?gb2312?B?SCtheWZVNlpJZVExNEFaK0tyUEM2VXlJTGpHNksvbUM0cFFJUnc3Yk5DRG9r?=
 =?gb2312?B?bTJBMFJXTzZpNHl0N1BtTjB2eXR0cDVuS21WT09sanZpVGRjV3dWaFVHRElX?=
 =?gb2312?B?eEMzamZNdmFieHJ2d2dCWUpid0w2cTB2Q3k5REZUNk5wN0YwMFk4SUg5Q01T?=
 =?gb2312?B?cGZwaytERmJOdmpVeGE1UEt6NG1aR3RXVDdtWUZjYnRVeXU3RDdGQVUralRa?=
 =?gb2312?B?WnVrdjlNNEhrZ3ZkMG5SeklFKzlNcEJkOWNIRjE3ZmtLdFp6eHdrdlN5RUhp?=
 =?gb2312?B?YnlhRHBQWjlUazhVN3hEejJDQTN1NDlGYkRTVlN2aG1EMDNrWnRZRG1uOUJq?=
 =?gb2312?B?bjY0Q2JndW1BcE1QVW1RMHVzMWZCRWdvVWt0SGdPTS9kZzhLWHlIdUpLREtj?=
 =?gb2312?B?d2VGWit2L1QzaHNBSXlxL2lHdGw4aW5DODhNaExUZldyOXg3WjRreGl0cFE0?=
 =?gb2312?B?YU9UVkZOQnVwRXpPVlM1Q2tDYVN5bktGL1ZHcThtSWJZYXVGdk83Ti9BQVdV?=
 =?gb2312?B?WURzVzV4a3hKRnZvSENSYWFZZXNjYm1xMEFXRDVLRmFVcVdrVEo0RFZwWWRZ?=
 =?gb2312?B?L3p5cVk3VUtabnhGelVxTUZNN09sL2YyN2xjbmo0eHdseVhidHpsSU5VM0Rk?=
 =?gb2312?B?b2VFam94NVZkNHh6VFVhcnpqZDROQ01nemFMRFU3VlQ1L3dwcVB6TkswaW5R?=
 =?gb2312?B?eW1qN1dzMXp3L0I5SFVoUy9yWCtrWVpkL3k2Tk5DY2gxUE5lVzIwakc4SWtq?=
 =?gb2312?B?U0dYa0x0OXE5NGg0ZzhqaGE0aTJTUGxBR3A2Q21Fc3lrR08yU3liU29Sd0xB?=
 =?gb2312?B?cHkzZjlFUnNmRk80UEJBNC9OVlR4VWxNd0dzNUxSZndGampoOVEvR3lucXlT?=
 =?gb2312?B?MHBVZGlvM0RpVHNSalU2VXBxMGxjZnlTVkFNU3d5RmJwc1FSOWJGTktBQ2RS?=
 =?gb2312?B?RW9jOXZlallRUUJ0eVpmam1obUhiNGVFR1lsU0RtcjI5eXpoQm5hZEdVS29I?=
 =?gb2312?B?bUxoK3dGTDNqWnVLTXBjVXVMOHBnU0doeVd6cFljSUIvdmVwNElpeVpwdndu?=
 =?gb2312?B?c2FTWHhEaG9sM29HVVExWjREQmhaZFRnZ3dkUnZlVW9UTzRFampYRG9Iek5C?=
 =?gb2312?B?MUNMallNV3BsZ05EN1lVK290UDFNMVY2R05LZkpuNnEreG9DaWJmSkJIWnlM?=
 =?gb2312?B?ZG9MLzdDSVBjKzlvQkQ3eUNwbUJDaHljN3hieDRsQnQwakpRVHhITW9hT3l5?=
 =?gb2312?B?cC9USE50Y245bFE2YjVGS2Z2U2NrKzhoNDM3K0ZJakRkNENoclgvaEdFd1Iw?=
 =?gb2312?B?Q1pteHRmK05HcS9HQXN2Z2VTRE1MUExuYWhwdVlKNW1VL29CSEFOc0d2c0h5?=
 =?gb2312?B?NUdac3BnZzFIMCtmcmNwTExwRzN1K2NiUnFscytWcVV0VlFsU2Vmb1VYc3BT?=
 =?gb2312?B?RERaNXoxblVNV3htMVNKZzdycDF5b3hCMU1iSGdROC80SXlVeFVuelFLUjQ1?=
 =?gb2312?B?MFlYNmZGRG5SYjErcWc5YjY3aEV3SlFma0hYRW9uZEQyZCtyYnVqZFVDNDFF?=
 =?gb2312?B?d1pDRVljQ0R3bkF1MFJjcW5xMWJtaXl1bXhaQzdDUGRRTVhsTUNjK2hBbFdF?=
 =?gb2312?B?bEpSRldqYXlFd1pYWU1adGdaQWZlUVphKzJ5aGk0ek5PZ1NOanpSeXllZ2tU?=
 =?gb2312?B?U0tJT3pud0RSNitUcXNCRFdialdSQjdpMGpmc2J2TENmU0RHYVlVMHRkWEpD?=
 =?gb2312?Q?zSb+kVvzkI8F3K8nMwVl84Ky4Wa+ndi2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Z2hPelRVeHVQKzVWOCsydFdMS1loZXgzaC9DT0FPb3RsQUJTb29oc25nZkox?=
 =?gb2312?B?S0pLSmdkemlZbG9ZcmZSQ0hLUEFDdWdNYUhraHNOYisxdFlEOE1SSVl6dUVr?=
 =?gb2312?B?WHRqVDdQdG11S2tSQXBkSGtEMzlFVlBTdVlvV2FmNGFKUzlIMUdvNC9TSm42?=
 =?gb2312?B?WGQzVFFrMGZqRytPKzZxVGxJaGtoVkJPZ0Irb1IvVHdyWlg0cm9Td0RHSjhP?=
 =?gb2312?B?U3dqdGliT2Y5WFBFYUJvdEo1WUVkemxsT1NmbnpnUVRtK1JNdENLQWxFYWJz?=
 =?gb2312?B?QTJKU1pVcWd2V245M3hQOW1YR1JMVDBIZTNJSnNNcVJOcDNBMEdZdldwc09v?=
 =?gb2312?B?a2wrbnh3Vk8wS0NvMnVEZVF0OXNkS3VRNFhWMXc3SWdDbUQ4VDQ0TGdmWGJK?=
 =?gb2312?B?aWZ6c2xVN0toSVNETFNhckYxM1hKTC91cFF5SW9rd0JmWmlmRk1KbHY5cXNZ?=
 =?gb2312?B?Y0lYbU1qVDRRK2t1ZjZqdjZ6MUxIS0d1aDJ6SmlXQzZ3dkMxNzZHd1hJMkpp?=
 =?gb2312?B?SWhyYUhXd25mcTltSW9Ha2ZyRkZXMjhMTm9VM2VTdFBNRktaY2R6K2Y3dkQy?=
 =?gb2312?B?b2xLQmRZSkdUekJtQnVqRGFxSjFGTStDSFB3c1duS1FPU0xKYStQdzh3QytN?=
 =?gb2312?B?bjUxOHlKTDhweE5QRis1LzZoMkF4eVdKcWVldWYxaTRJOE5YZ3pzYkxlRExN?=
 =?gb2312?B?eXBaSzlQRWd4bU5QaXNJT1Z1L0JvN0lLYTZtQnFLTXRTMUFmUUJzMUNDa2lF?=
 =?gb2312?B?blVPQ3JyQ0FhRGR3THYxVlJnR29ITlVUWUt1ckdDR00xaStsWTNUNW5XSVNm?=
 =?gb2312?B?eEZCMmgvWUJTU01PN3lNQW1BVkVUeWxDcHJUYW1MSGpJRTQ3R3NZWUkzV3Qv?=
 =?gb2312?B?SGFnbnpIM29Ta3JMVEhxZFMranBSNHVkRnV4SU13NmZwSGx6WXlsclhQNzlV?=
 =?gb2312?B?SVFQMGQ5OElQVlZQZjFLNVVxV29kRTJrTHhCN1NGdVNYSDNzYWdyWmI3TDRv?=
 =?gb2312?B?QmpENk1rQXpKbktIbGx4RzVWRjI1ZEhndGN5TlA3MXJ6VVVhK3IxSjladENN?=
 =?gb2312?B?N2ROL2V6TGViUzl2ejdpNzkybCt4aTA4aERsSWxCWTJmQllpRzJZOEZKN3ZD?=
 =?gb2312?B?TjNTeFNxLzVJN2RJN3lCOHpWVjQyMXkvM2hYU2l2NENuR2Rjd1NhTUFSWTZQ?=
 =?gb2312?B?MVRkZ0t2OFRSSDdGTUlMemN6V2RHOVR4dXR3ak82WlBWNDlaL0xPQ1g0bGRp?=
 =?gb2312?B?YmZPamdubWRPUHJQRktiaVF5TmhrdWFpa2hxc0Q2T0p6ZXhPd1VCK3l1Y3pN?=
 =?gb2312?B?bS9wb3k5KzFpdVJEVUcwWWdOSzJybnpIU2lZMW9zbmdUbnR6bzQraXEzUksy?=
 =?gb2312?B?aW50QWNUWUdnZjRzU0pzTStkUngrZXFYOTMzajJYdFI1U2VWMGJrYllpV2xu?=
 =?gb2312?B?QnhiTHNaN0xrVjRvSXo4YWR2WTZGbkRRL3Y2Y1VRL3Z2bDl1eTdEQXdDdHRG?=
 =?gb2312?B?Ymd1NkViZW5MbDFVOXZmZGp3NzNsMDZFNmtzYUNJUXVJQ2dBV2YwQWtjd0dO?=
 =?gb2312?B?NklOZGNTK1VBVGtXM3Myd2ljZEZMNWxIZE1MbE00UGluSi9JWnZ3OGphblN2?=
 =?gb2312?B?ZFBVUTZQczlUNWM2VWVjSVVzR0pYVVkrWFYreCs4OSs1OEZzVjhrODg4d1I1?=
 =?gb2312?B?UGJ6UU5tVjVlT3M0S3M1aGY4S0xuU0NzRUc1NzZVOUIrREdVaFNVZVc5Tm92?=
 =?gb2312?B?bWg2WU1LWDd0VHZ0aEwvN0toTi9DajRJL085T2dNVkxvY0x6UENkblR1bE00?=
 =?gb2312?B?V20xMUp1TlNxSzRiZkEvQTZsREhtVXZXSHhpZG9vOXg0SlFzZGVUaE1HaUw3?=
 =?gb2312?B?dTdUZ0VrbjcyVGFnbmwzNGdxRlAxc3BFaDdyV0VBOXhKa0k5b0JLQSthempj?=
 =?gb2312?B?Z0RGRHhhVVBxMmJVMWdGdFBDUWFzaUtVaG45ZS8vTXBtK0lGaFhuMkd6YTZv?=
 =?gb2312?B?WklKcy9GQ2ZFb3NoRVJFK3huemRvSUNwOHVCRytQWVBMY05lQUtjK0FQb0pP?=
 =?gb2312?B?NWIxWWdrMTArNjdwOWl0b0NVby9KdDRTSkNFMVc1N28yTkZ2dngxT3lFa1FK?=
 =?gb2312?Q?0nTw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f0f759-ad0e-4d18-fc85-08dd35410f4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 08:46:10.2020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W1WltV8dKYb7P2BUJRVt7NSlcyXK7EL/LMn4t0bcelftNoSA1AN19f55dfmLH7s3tH8mKX+jP9nyNwdDAug4gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6713

SGVsbG8gbGludXgga2VybmVsIGV4cGVydDoNCg0KDQo+ID4gPiA+DQo+ID4gPiA+IEZyb206IExp
YW5xaW4gSHUgPGh1bGlhbnFpbkB2aXZvLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gQXVkaW8gY29u
dHJvbCByZXF1ZXN0cyB0aGF0IHNldHMgc2FtcGxpbmcgZnJlcXVlbmN5IHNvbWV0aW1lcyBmYWls
DQo+ID4gPiA+IG9uIHRoaXMgY2FyZC4gQWRkaW5nIGRlbGF5IGJldHdlZW4gY29udHJvbCBtZXNz
YWdlcyBlbGltaW5hdGVzIHRoYXQNCj4gcHJvYmxlbS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogTGlhbnFpbiBIdSA8aHVsaWFucWluQHZpdm8uY29tPg0KPiA+ID4NCj4gPiA+IENv
dWxkIHlvdSBnaXZlIGEgYml0IG1vcmUgc3BlY2lmaWMgbmFtZSAvIG1vZGVsIHRvIGJvdGggdGhl
IHN1YmplY3QNCj4gPiA+IGFuZCB0aGUgcXVpcmsgY29tbWVudD8gIFRoZW4gaXQnZCBiZSBtb3Jl
IGhlbHBmdWwgZm9yIHBlb3BsZSB3aG8NCj4gPiA+IHJlYWQgLyBjaGVjayB0aGUgY2hhbmdlcyBs
YXRlci4NCj4gPg0KPiA+IFdlIHVzZWQgdGhpcyBzb3VuZCBjYXJkIHRvIGNvbm5lY3QgdG8gdGhl
IHBob25lLCBhbmQgb25seSBzYXcgdGhlDQo+IGZvbGxvd2luZyBpbmZvcm1hdGlvbiBpbiB0aGUg
bG9nLCB3aXRob3V0IHNwZWNpZmljIHNvdW5kIGNhcmQgbW9kZWwNCj4gaW5mb3JtYXRpb246DQo+
ID4NCj4gPiB1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MGQ4YywgaWRQ
cm9kdWN0PTAwMTQsDQo+ID4gYmNkRGV2aWNlPSAxLjAwIHVzYiAxLTE6IE5ldyBVU0IgZGV2aWNl
IHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsDQo+ID4gU2VyaWFsTnVtYmVyPTAgdXNiIDEtMTog
UHJvZHVjdDogVVNCIEF1ZGlvIERldmljZSB1c2IgMS0xOg0KPiA+IE1hbnVmYWN0dXJlcjogQy1N
ZWRpYSBFbGVjdHJvbmljcyBJbmMuDQo+ID4gdXNiIDEtMTogdXNiX3Byb2JlX2RldmljZQ0KPiA+
DQo+ID4gV2UgY3VycmVudGx5IGRvIG5vdCBoYXZlIGFuIGVmZmVjdGl2ZSB3YXkgdG8gb2J0YWlu
IHRoZSBkZXRhaWxlZCBtb2RlbCBvZg0KPiB0aGlzIHNvdW5kIGNhcmQuIFdlIGFyZSB2ZXJ5IHNv
cnJ5Lg0KPiANCj4gV2VsbCwgeW91IGNhbiBwdXQgc3VjaCBpbmZvIGluIHRoZSBwYXRjaCBkZXNj
cmlwdGlvbi4gIEl0J3MgYWxyZWFkeSBoZWxwZnVsIHRvDQo+IGtub3cgd2hldGhlciBpdCdzIGFu
IGFuIHVua25vd24gLyB1bm5hbWVkIHByb2R1Y3QuDQoNCk9LLCBJIHdpbGwgbW9kaWZ5IGl0IGFu
ZCBzZW5kIGEgbmV3IHBhdGNoLg0KDQpUaGFua3MNCg==
