Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022110.outbound.protection.outlook.com [40.107.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630AD42AB4
	for <linux-sound@vger.kernel.org>; Sat, 21 Jun 2025 06:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750486483; cv=fail; b=JbTpRMHaiuqNX/c462IyeLv8koJ5PlgJev8/vhJ0DlacxYnUGWFDkG8ziwB0z4bW08w1Yx5QdwLLQg5d/vvZk+yWwNdox9EkWOjQpIDMSIa84DLG/c+86tZ/s0pRLoP+B1ph844lWKBRo3y+r83uGJrwm4zFTC4JeMhnKHLVLLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750486483; c=relaxed/simple;
	bh=ZVEujg4PwXnVl9ksBVpkWt8fVXisA5aixHNWSstepYE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QZ6oLyiUHMPmVR2j34ULU7CNO3DSX7KpA4U8ZaVA+XS2/MGW1tCiH4NSga0i9jVpqrRkN66N/O/wvbly8/F78m38EP19YB2WB9uGeu0RmrsS/Lx3lH+527QY/B5GPY979KKF4Tkzwj4SsOykNpqgMRn5RiGtC7vsbN5T9RyAu1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppouGt6DFAiC1HFOVML0SxijWJ4z2ZMi8g/X9JWfUrxJWVszLmAuTVK4eUjCCsegODxITrY7NRLA+K1tXFh17sd9LkSX3jZnsUXoHFvVS5A8lxAysUl4pktWC5jVKBf2LdbgwNOJw4zH+CfC7Kr0DUtQFLW6djKr3oSFuC7KVrrKFqA7iWqAyP68fQdJPuLrKfa1goWo/NuMdSmnJgGBiz4/zlB66oVJVBx7aPBqr/gw4lxS0rgXBth8hBLATaKGPvdGdsCj9Uz5bgp0NscuKvbl8viWHorpIYDn+/tUbWxJt37Ge4ntPSREkEEkNGymVxUan07DdQcT80mLeUWQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVEujg4PwXnVl9ksBVpkWt8fVXisA5aixHNWSstepYE=;
 b=bAiM0SSiWQ1w5Ge0EfuD0vywicisZM8z9kVstwGw7YafMtV+9dcCC5doCv++SCCmRC/ehdsz94+M5nhGAz5M2C46PIwsWJebieTBIYBVGEEkVjcMHzAqsNeDzeovVBw7erqNttUIaDruc4mU7bHUBPDUqGOUdXgOFWr/muovjljMgWGe+Y/bJSZIky3BtAzEzd6CPn2bEfnttpgyd9mY7Y3Lq105vdKjdk5zLjOjrn3abfQcWaZ8SeD/8gUbQXI/lWUdrx1vygTvuRS+ivUQtn9LA46WWbb3sGLrkJjg6g4L8BMh+16uGablxBWoY1to+IvQ+9rqKmmlHiljEYmWqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5)
 by SI6PR06MB7195.apcprd06.prod.outlook.com (2603:1096:4:24b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Sat, 21 Jun
 2025 06:14:38 +0000
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636]) by SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636%6]) with mapi id 15.20.8857.025; Sat, 21 Jun 2025
 06:14:38 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"chris.chiu@canonical.com" <chris.chiu@canonical.com>, "kailang@realtek.com"
	<kailang@realtek.com>, "geans_chen@realsil.com.cn"
	<geans_chen@realsil.com.cn>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggVjEgMi80XSBBTFNBOiBoZGE6IGFkZCBub19waW5f?=
 =?utf-8?Q?sense=5Fupdate_flag_for_jack_detection?=
Thread-Topic: [PATCH V1 2/4] ALSA: hda: add no_pin_sense_update flag for jack
 detection
Thread-Index: AQHb4L8sO5xzfgCTa0S12FbEOv/9/LQL91cAgAEuGfo=
Date: Sat, 21 Jun 2025 06:14:37 +0000
Message-ID:
 <SEYPR06MB62781BB8AF7B964F54B4C2C5827FA@SEYPR06MB6278.apcprd06.prod.outlook.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-3-joakim.zhang@cixtech.com>
 <87cyaywr31.wl-tiwai@suse.de>
In-Reply-To: <87cyaywr31.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6278:EE_|SI6PR06MB7195:EE_
x-ms-office365-filtering-correlation-id: 88904a84-65be-4a2c-3e02-08ddb08ae6bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NGhhUUdnOHVobVNpSFJ4dlVDOC9JM25NdW5rMjJJdXl2UlUvc0xaNkRpTVhn?=
 =?utf-8?B?dm5LQzJEczE2ZHErNGZta1c3aUVoN1hSbXR0OTQ0eG5CZHNVT2xqLzhTeWdi?=
 =?utf-8?B?R2ErT0NqazZsRlJWd25iQS9SanlDK1NnRG42Uk9kUlhGbFVXSy9Gdng2WmRH?=
 =?utf-8?B?ZkFWY3FOQmlrOWhROHVtR245SHNpeStCSE1KakhUajZoNngvZDhMV0lxNS9L?=
 =?utf-8?B?Qk8raEwxSG5BZmJEOU1sWGQ0eHEyaWVQb2kwRzJrS0NJUEZOa0h5ekJJeGdD?=
 =?utf-8?B?VTlOZlduZ1NrL2l4Si9Zd0FueUJZc2xBTFA2d21BWkt1WjhoZmlMTG15andW?=
 =?utf-8?B?K1djamxoL1VsRkRzRkFwODhvTU02WFlncC8vSGhFZVdzaHJDU2dQSk12YjE4?=
 =?utf-8?B?VnhNWHBLMWwwRWNNU2tLV0ZPekR0ZUVpQWtEK1ZvUDJ3eExSajdmWjlvdFY5?=
 =?utf-8?B?UFdVQXVaWUEyWTlyUDRSeS9lY0lKVjMzRk9JYkc5VkJNTFlyeTFVRFYwUFVK?=
 =?utf-8?B?NVovb2xpcXl0YjU4b28ycmhyYmNRbU9GeUhzaTdVaHNWYVU2NndOWk5BVXNU?=
 =?utf-8?B?QWY2UEZ0bUMyUldTZnBZZnFGbGtORmhlMkFTbEkyTDZXWVNJRncxSnRMaXJX?=
 =?utf-8?B?Z0U5OE5tSWRUQzVWNFdxSXpKM0ZNdjk3cmFXU2xTaFdOaDMxbzhuK2F6UStk?=
 =?utf-8?B?YTFuTVlnL1FTTjRFdnE2SXdIdUFud0FmaTF2ZU9jUzlFWHB5VHFYcHQzQWc0?=
 =?utf-8?B?bjJQSEl1WEtPcXJSeDlvTTBLVW1abFlRb0xpMU84cHd0Ui9Qc016andVdXZ6?=
 =?utf-8?B?VkpDUnJaTldjdWV1aHcyWEpyMGNOVkc3QUpPempROWF1VEhqMkJIVm1VL01B?=
 =?utf-8?B?bXgzYWdHdnhhZ3NTV3Zwdk5vQ1RmZGJGL0QyWjV2MmgxbSsxK1lEVWwrZXM4?=
 =?utf-8?B?TUJXVjBRTk5wb2NyNkliV3RMaUd6Z2ZhaGRXRzc0bVZyRk1wM2VYbVlhU3JY?=
 =?utf-8?B?YWxLbHcxTDB1VkV0Y1N4U2w5cmxOVHdPdUxvOVJ6WFdMKzI3eG1hQ3k5NzVZ?=
 =?utf-8?B?djI0VHoyZTRUNDNkc1l3MnlDc2V2U3d0TmVYQ3ZUWXBzNzE3bU5RQmVydEVY?=
 =?utf-8?B?dXdaSE5tRk9WbFc3NkV1Zkl2czQ1Y2RCSFhMVC9Jc0h5bE9kWHFXK1Nqd3Fq?=
 =?utf-8?B?d3U2YTY0NmlxYVlnNTQ1NEZnSElzVlhhdkFJUmtOMzZsSHVpYi9EQ3I0SC9r?=
 =?utf-8?B?YmRKdzg0Si9hN3pvMCtiN043QmF1MmJVeHYwSFRkSEx3ZXdDVXk3VjRPTndw?=
 =?utf-8?B?Y3ZkVDBDZDVUK1NjOFREZU1RckV0UE9mVkh2bEtqTWJlRlNjL2YvYmVZWTUz?=
 =?utf-8?B?OThlL3ZuVkJOSlZNR3J6VzRVY0MvcXhiS1Q2dmdWbWFsNnVYaGJyckxTVlVa?=
 =?utf-8?B?UjlmMWdZcTBPTjNzandOcW9Qd1VIZGtNZWVBd2l0ZmxHdmgwUklHWjdET2tk?=
 =?utf-8?B?TW52d3A0UitxSmwwVlk5TThjam40V0R2Z3lKTUM1a1hiWm9NRUxjczhDbkds?=
 =?utf-8?B?aTdzUWJMSnR3aUlZUXRvc0dRUlA0UHZTL1RmVkdxUkx3MmtwVlArTkttSFFy?=
 =?utf-8?B?NmJYV3pYSjRBZGFpcUdyYWlhL1lFa2xxUUJ6djVzZW01MkFZUnRBMlVWWUpw?=
 =?utf-8?B?TGdwZjNqaCtuU0pOYnd3ZXN4QnYyWm9BY0JVMm5UeGtLK3VGektyeklxL2Q5?=
 =?utf-8?B?dUtoRlhvb3ZGb3NtSFAzLzFJNWFPSUllRFJDcXJlOUR2WENkMk9ya01VMTB2?=
 =?utf-8?B?MHd4cUxnNzF0V1lkQmloZ0V5aWtqbnZtVVZXTm5WS25lTHVYUXpKbmFHd0dq?=
 =?utf-8?B?ajNVU3pQNmJCTVQ5WG03N0QvQzdObW1VYXlEV1cyaGwwNm0zektxckVNdGZj?=
 =?utf-8?B?Q1F5MlNFRDVkNWFOajNsdTdITHhvdkVHaG8vdjRTZUlvYWE2dXl4cXBkMS9Z?=
 =?utf-8?B?ck9NQk1vZ2xRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6278.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFl0RldVNU9CNHppdHRXK2hjcjk1aUdhMmtPdVU3TGcvT3BKYXNncWlMelhP?=
 =?utf-8?B?RkQ1Q0czcUNQSnljVFJrZEFBWDdDT0Yyd1ErTitDdWZoV2UwRFNxbnNSbmt5?=
 =?utf-8?B?QzNFdGdYL3p5MjR0RWY1azVxZzE3aU5GaklZVEM0azF4WkZCaTY4UHE0UHQz?=
 =?utf-8?B?OExqNmVvSnQ2SVdlWmVkRkdOanNNMVpSeTJra0FNSG9VQkpuSnJnZGkyMHFx?=
 =?utf-8?B?dEpXN2ZySTJOckk1cmlLb1U4N3dscEJWeG16bDJOQi9FRGpEWnE0bTk5YzhG?=
 =?utf-8?B?ZFpOcm0yaEdUdTJXNHFGY0hhcUVqQVYxaHBqcVZ0Mk91RzM1cU9uRVplU2VB?=
 =?utf-8?B?RHlPaGkwemRwTUxseGdUS0J0Wm9JSW40d3kyMVVSMWlBai9lSEpqQm9vRm1a?=
 =?utf-8?B?Z3FJVlB4QlFWV3ZZUlA4K0tIRm5NT2FiV2JxY2plYkZzMmNlZmVkM04wRkhT?=
 =?utf-8?B?d01qbDdVWmZnOTlPREZxa2N2MVdvUDhLL2luRzNncXY0R0hWQ0VUNVZmZ2do?=
 =?utf-8?B?YXBVWDRnaVpKSEVibDhRNllIWXNIT2RPWW5PVUQ2dG5PazJIeHV5RmV0U1Rk?=
 =?utf-8?B?SzNnTjIrbFVXY1pVOXBBd0dxZE04bVFCdHJmQkRVSE5NZjFIMDhmb1FEVVQ5?=
 =?utf-8?B?MVNSUk0wcklXYkxzM2o3VlVCU29sN1BXV1ptdmhLZFRRSkd0MEFoVTJCbDdi?=
 =?utf-8?B?cVUrNVhKcXYvd0FMc2R1b3Q0RVF3WkRiV3R0UGQvY2lUT1VFZGxZQTlyaGw3?=
 =?utf-8?B?czVaeTNFTTBVOHZLZjkxazgvL1E0Y1BoS0t5SmlwUk9mTWpyWm5DMWw3aUhH?=
 =?utf-8?B?TEFtUXI2ekxFV01LUUlPdTFqWmlzanRWMGJOTWVnTU1URFlqOUQrZVZzemJP?=
 =?utf-8?B?WEtGNm5yUUErRGFmcGxrMFBack01YytKUzNGT3I3bmFsdXJVZTJCMWljaXdU?=
 =?utf-8?B?aEVoNzZuQlBvbzdXZW1IeWwrdUtlaHpsL1ZLQTFiSlV3ZGFZclUrK2lWVmdu?=
 =?utf-8?B?L0lUTU9IQm9ZR3JvWURFczBGYlY2T1dJSFdxRDVXazBEcnJhWkdPamhnb203?=
 =?utf-8?B?ZTNJOGJOSVM3MGlRdFBnYnVDeEZoNUlVOU5JYWpHLzJUazRVZVlMMlRhZlhC?=
 =?utf-8?B?aVJvS0U0YWJUSlNxQVdVeUJJai9ueTNSN1ZFWGhUMTQ4RmdwRE8xeEM4VkZJ?=
 =?utf-8?B?RHVjTmVYZVY4Z0VIN1htUUpaTWVBT05LY3hBL3F2eXZRVG9kSUhpL3dLTUJC?=
 =?utf-8?B?U3Y3UXJrNk8raE5jZTM5bUZ3Wmxud20yNkxjcGttbnhjWkxhTEJDaHZobWtL?=
 =?utf-8?B?ZXJFVjIzTFdwRWh5REhra3Nib1JIcFBpek8vbVlnV3ZPQjNrQnhuUVg5Zmpz?=
 =?utf-8?B?Zlh5SzJ4TmtEQjFlQkExM3hjTDZmdnVHWjZCdDdWVFcyK3p0ci91WTQxeU9B?=
 =?utf-8?B?Q3lRd2JiSG9qWGU0cUZHZFhQdElubGNqRHdZcitGKzFOMTJZMFFwd2tjRDJU?=
 =?utf-8?B?eXFXSGl3bloxYXJLc2NRQ2pqanZHZTVmQzNLczR6dVZWbHUrUFRZU0k2S3Zy?=
 =?utf-8?B?aGdLckNqL0d4RExCenZVbi9aOW5ISmpxL29KY3pYbU9DdThmbG14KzdHY2dy?=
 =?utf-8?B?WCthRVJGMGhHOWdIdFNyS1lMTzkzS2RIcG5IZSt0N3p4Slo1RmZ4NUdwWnJv?=
 =?utf-8?B?NUY2VDBhSmVRcTJ1eGp3MEI4eEpoWXNxYTNJVFlJbXNkMlVIdGY2TnVUWmQ5?=
 =?utf-8?B?Um5JUDM2WUp3YkxaSjI5b1JEYW1oRWo0UDI3dmJKVU8raElXbEVlM2JvVU1z?=
 =?utf-8?B?YTZOa0Vjbm5UQUdYUU5yTlhDM1pmbGpUL2hUdXpjaWY0WUZKOVRHenAyc0xl?=
 =?utf-8?B?WEhrVHZDWk1aV3p6L2hhNjZibERmZUdBWFN5bjJ4U21Nb2NFd1B2Nzg4bFpm?=
 =?utf-8?B?czdLNkRQcVYyWFdqL0laUHduTFZ0cVFlUm9KR05qNHJ6Mll2cVZNdVQzZlhP?=
 =?utf-8?B?ZmdUazZaTkJTZ2MzdG9XUEgyb2FKemYvc09zK09nNkhjRGRVSEgwbEJqRTh2?=
 =?utf-8?B?L3JWTGU5SkptQjY4VjA2SWFEazhJSDEycGZRNldCZ1lsdjFqaVd4YUhTcGx3?=
 =?utf-8?Q?sCO8nLw8dG1eyR2NqxY8a9fbK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6278.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88904a84-65be-4a2c-3e02-08ddb08ae6bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2025 06:14:37.9225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ui8rpMgQ3JbsvIzQ3OIhWXhyxtXZuObdg6yowrIXKLsLr+1X1Z/NXOPNBKSgNqrRfD5aC6X8BBkk8B/dmb20Jrjw6LvciZRq4ROz2FZuc3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7195

CkhlbGxvIFRha2FzaGksCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
5Y+R5Lu25Lq6OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+CuW3suWPkemAgTogMjAyNSDl
ubQgNiDmnIggMjAg5pelIOaYn+acn+S6lCAyMDoxMQrmlLbku7bkuro6IEpvYWtpbSAgWmhhbmcg
PGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4K5oqE6YCBOiBwZXJleEBwZXJleC5jeiA8cGVyZXhA
cGVyZXguY3o+OyB0aXdhaUBzdXNlLmNvbSA8dGl3YWlAc3VzZS5jb20+OyBsaW51eC1zb3VuZEB2
Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz47IGNocmlzLmNoaXVA
Y2Fub25pY2FsLmNvbSA8Y2hyaXMuY2hpdUBjYW5vbmljYWwuY29tPjsga2FpbGFuZ0ByZWFsdGVr
LmNvbSA8a2FpbGFuZ0ByZWFsdGVrLmNvbT47IGdlYW5zX2NoZW5AcmVhbHNpbC5jb20uY24gPGdl
YW5zX2NoZW5AcmVhbHNpbC5jb20uY24+OyBjaXgta2VybmVsLXVwc3RyZWFtIDxjaXgta2VybmVs
LXVwc3RyZWFtQGNpeHRlY2guY29tPgrkuLvpopg6IFJlOiBbUEFUQ0ggVjEgMi80XSBBTFNBOiBo
ZGE6IGFkZCBub19waW5fc2Vuc2VfdXBkYXRlIGZsYWcgZm9yIGphY2sgZGV0ZWN0aW9uCgpPbiBU
aHUsIDE5IEp1biAyMDI1IDA0OjA4OjQyICswMjAwLApqb2FraW0uemhhbmdAY2l4dGVjaC5jb20g
d3JvdGU6Cj4KPiBGcm9tOiBKb2FraW0gWmhhbmcgPGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4K
Pgo+IHNuZF9oZGFfamFja19kZXRlY3RfKiBmdW5jdGlvbnMgc2hvdWxkIGJlIGNhbGxlZCB3aGVu
IHdhbnQgdG8KPiBkZXRlY3QgdGhlbiByZXBvcnQgamFjayBzdGF0dXMgaW1tZWRpYXRlbHksIGhv
d2V2ZXIgaXQgbm93IGNhbGxlZAo+IGZyb20gb3RoZXIgcG9pbnRzIHN1Y2ggYXMgcGF0Y2hfb3Bz
LmluaXQgd2hpY2gganVzdCB3YW50IHRvCj4ganVkZ2UgaWYgdGhlIGRldmljZSBpcyBhdHRhY2hl
ZCBhbmQgbm8gcmVwb3J0IGJlaGF2aW91ci4KPgo+IExldCB0YWtlIGNvcm5lciBjYXNlIGludG8g
YWNjb3VudDoKPiAxKSBkZXZpY2UgaXMgZGUtYXR0YWNoZWQgYmVmb3JlIHN1c3BlbmRlZCwgb2xk
IHBpbiBzZW5zZSBpcyBub3QgcHJlc2VudAo+IDIpIGF0dGFjaCB0aGUgZGV2aWNlIHdoZW4gZGV2
aWNlIGluIHN1c3BlbmRlZAo+IDMpIHdoZW4gY29kZWMgcmVzdW1lIGJhY2sgYW5kIHRoZSBkZXZp
Y2UgaXMgYXR0YWNoZWQsIGl0IHdpbGwgdXBkYXRlCj7CoMKgwqAgcGluIHNlbnNlIGFzIHByZXNl
bnQgZnJvbSBjb2RlYyBpbml0IGZ1bmN0aW9uIChwYXRjaF9vcHMuaW5pdCksCj7CoMKgwqAgd2hl
biBpdCB0cmllcyB0byByZWFkIHBpbiBzZW5zZSBmcm9tIGphY2twb2xsIGRlbGF5ZWQgd29yaywK
PsKgwqDCoCB0aGUgb2xkIHBpbiBzZW5zZSB3b3VsZCBiZSBwcmVzZW50IChidXQgYWN0YXVsbHkg
aXQgaXMgbm90IHByZXNlbnQpLAo+wqDCoMKgIGFuZCB0aGUgbmV3IHBpbiBzZW5zZSBhbHNvIGlz
IHByZXNlbnQsIHNvIGRlY2lkZXMgbm8gY2hhbmdlcywgY2F1c2UKPsKgwqDCoCB0aGUgZGV2aWNl
IGNhbm5vdCBiZSBkZXRlY3RlZC4KPgo+IEFkZCBub19waW5fc2Vuc2VfdXBkYXRlIGZsYWcgdG8g
Y29udHJvbCBpZiB3ZSBuZWVkIHVwZGF0ZSB0aGUgcGluCj4gc2Vuc2Ugd2hlbiByZWFkIHRoZSBo
YXJkd2FyZSBwaW4gc2Vuc2UuCgpJIGRvbid0IHVuZGVyc3RhbmQgdGhlIHNpdHVhdGlvbiB3ZWxs
LsKgIERvIHlvdSBtZWFuICJkZXZpY2UiIGluIHRoZQpzdGVwcyAxLzIvMyBhcyBhIGRldmljZSB0
byBiZSBjb25uZWN0ZWQgdG8gdGhlIGphY2ssIHN1Y2ggYXMgYQpoZWFkcGhvbmUsIG5vdCB0aGUg
SEQtYXVkaW8gY29kZWMgZGV2aWNlLCByaWdodD8KCltKb2FraW1dIFllcywgeW91IGFyZSByaWdo
dCwgd2hhdCBJIG1lYW4gaXMgdGhlIGRldmljZSB0byBiZSBjb25uZWN0ZWQgdG8gdGhlIGphY2ss
IHdoYXQgSSB0ZXN0ZWQgaXMgYSBoZWFkc2V0LgoKRXZlbiB3aXRoIHRoYXQgYXNzdW1wdGlvbiwg
SSBzdGlsbCBkb24ndCBmb2xsb3cgeW91ciBsb2dpYyBmdWxseS4uLgpCYXNpY2FsbHksIHdoZW4g
c25kX2hkYV9qYWNrX3JlcG9ydF9zeW5jKCkgaXMgY2FsbGVkLCB0aGlzIHNob3VsZApyZXBvcnQg
dGhlIGphY2sgc3RhdGUgY2hhbmdlcy7CoCBJIGJlbGlldmUgd2Ugc2hvdWxkIHNpbXBseSBjYWxs
CnNuZF9oZGFfamFja19yZXBvcnRfc3luYygpIHVuY29uZGl0aW9uYWxseSwgdGhlbiBzY2hlZHVs
ZSB0aGUgamFja3BvbGwKd29yaywgYXMgZG9uZSBpbiBteSBQb0MgcGF0Y2guCgpbSm9ha2ltXSBM
ZXQgbWUgdGFrZSByZWFsdGVrIGFsYzI1NiBhcyBhbiBleGFtcGxlLApoZGFfY2FsbF9jb2RlY19y
ZXN1bWUoKQogICAgMSljb2RlYy0+cGF0Y2hfb3BzLnJlc3VtZShjb2RlYykgLy8gYWxjMjY5X3Jl
c3VtZSgpCiAgICAgICAgY29kZWMtPnBhdGNoX29wcy5pbml0KGNvZGVjKSAvLyBhbGNfaW5pdCgp
CiAgICAgICAgICAgIHNwZWMtPmluaXRfaG9vayhjb2RlYykgLy8gYWxjMjU2X2luaXQoKQogICAg
ICAgICAgICBzbmRfaGRhX2phY2tfZGV0ZWN0KGNvZGVjLCBocF9waW4pIAogICAgICAgICAgICAg
ICAgICAgIC4uLi4KICAgICAgICAgICAgICAgICAgICBzbmRfaGRhX2phY2tfcGluX3NlbnNlKCkK
ICAgICAgICAgICAgICAgICAgICAgICAgamFja19kZXRlY3RfdXBkYXRlKCkKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGphY2stPnBpbl9zZW5zZSA9IHJlYWRfcGluX3NlbnNlKGNvZGVjLCBq
YWNrLT5uaWQsIGphY2stPmRldl9pZCk7ICAvLyB1cGRhdGUgamFjay0+cGluX3NlbnNlIGhlcmUs
IGJ1dCBub3QgcmVwb3J0IGphY2sgc3RhdHVzCiAgICAyKWhkYV9qYWNrcG9sbF93b3JrKCZjb2Rl
Yy0+amFja3BvbGxfd29yay53b3JrKQogICAgICAgICAgICBzbmRfaGRhX2phY2tfcG9sbF9hbGwo
Y29kZWMpCiAgICAgICAgICAgICAgICAgb2xkX3NlbnNlID0gZ2V0X2phY2tfcGx1Z19zdGF0ZShq
YWNrLT5waW5fc2Vuc2UpOwogICAgICAgICAgICAgICAgIGphY2tfZGV0ZWN0X3VwZGF0ZShjb2Rl
YywgamFjayk7CiAgICAgICAgICAgICAgICAgaWYgKGNoYW5nZXMpCiAgICAgICAgICAgICAgICAg
ICAgICBzbmRfaGRhX2phY2tfcmVwb3J0X3N5bmMoY29kZWMpOwoKSWYgdGhlIGhlYWRzZXQgaXMg
bm90IHBsdWdpbiBiZWZvcmUgc3lzdGVtIHN1c3BlbmRpbmcsIHNvIHRoZSBqYWNrLT5waW5fc2Vu
c2UgPSAweDAsIHBsdWdpbiB0aGUgaGVhZHNldCB3aGVuIHN5c3RlbSBpbiBzdXNwZW5kZWQgc3Rh
dGUsIHN5c3RlbSByZXN1bWUgYmFjaywgdGhlIGphY2stPnBpbl9zZW5zZSB1cGRhdGUgdG8gMHg4
MDAwMDAwMCBmcm9tIGNvZGVjIHBhdGNoX29wcy5pbml0KCksIHRoZW4gamFja3BvbGwgd29yayBn
ZXQgdGhlIG9sZF9zZW5zZSA9IDB4ODAwMDAwMDAgKGJ1dCBhY3R1YWxseSBpdCBpcyBub3Qgb2xk
IHNlbnNlIGJlZm9yZSBzeXN0ZW0gc3VzcGVuZGluZyksIGFuZCB0aGUgY3VycmVudCBqYWNrLT5w
aW5fc2Vuc2UgYWxzbyAweDgwMDAwMDAwIHdoZW4gY2FsbGluZyBqYWNrX2RldGVjdF91cGRhdGUo
KSwgYXMgYSByZXN1bHQgdGhlcmUgaXMgbm8gY2hhbmdlcywgZmluYWxseSBub3QgcmVwb3J0IHRo
ZSBoZWFkc2V0IHBsdWdpbiBldmVudC4KCklzIGl0IGxvZ2ljYWwgdG8gcmVwb3J0IGphY2sgc3Rh
dHVzIGltbWVkaWF0ZWx5IHdoZW4gdXBkYXRpbmcgdGhlIGphY2sgcGluIHNlbnNlPyBJZiBub3Qs
IHRoZSBvbGQgcGluIHNlbnNlIGNhbiBzdGlsbCBiZSB0cnVzdGVkPwoKUGxlYXNlIGNvcnJlY3Qg
bWUgaWYgYW55dGhpbmcgbWlzdW5kZXJzdGFuZGluZywgdGhhbmtzLCBhcyBhIGhkYSBuZXdlciBt
YXkgbm90IHVuZGVyc3Rvb2QgdmVyeSBkZWVwbHkuCgp0aGFua3MsCgpUYWthc2hpCgoK
