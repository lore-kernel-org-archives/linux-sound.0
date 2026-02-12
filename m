Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013026.outbound.protection.outlook.com [52.101.127.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721313EBF21;
	Thu, 12 Feb 2026 04:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770870040; cv=fail; b=LLHzvlWL1jRRCp6YcgoeNSbrGu6N9WwvT4V6mcCiGCRANv2SYdZvE3GmUewF3jXorxhrdb5emKz7D+K24VQE9dp4NO+nGQFnnxggCCI44t5RILjrAC6+hKHfzqqH1uE/Oo1EcRZkqXDnq9nFnfmrYynOTCjL//B4H4EDwm3poSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770870040; c=relaxed/simple;
	bh=6FbQKMdnNl4LnvOZCPRLlgUYp4F7k11cVczJAllIxmM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=L1JPvAb1rY5ZLWOvmXvDuYE/swGZ4rHhFjjhFjUfkZJJxVwzioIv36iIIrE8YQ48BR1RMKUBDLVuoWxomkISkPOHkGwHLpm1a7GTrQIdNuQ4nsBZ6zqnRCFL+ywqedvwu7rTp6F/3LcjUGev65jwOnjZgX8Qh+KGd8TdTHPAjIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=H7wj9PuA; arc=fail smtp.client-ip=52.101.127.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="H7wj9PuA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eke4uUsz+EQsZSC95uuiv0Q4rutpDMRj0o1ZlH68X7frRWetne7ecjD+ZiD3BG3eOEKodcfrdXUHW7V6r1VuuZoW0OWsBweu7R8jVynCTBes1km1nOHuqhp5ipt6O7AVoZwRqhLnNq39IU4Ij1IeAxbmwB8mVj8tH7eJqvtUe+yQoAezR6dh+UefQYl73TKBu6DOMb9pjX0Qkx/wbZlaIOhcT1KxWD2yZaytjDhFfp1f13W6qWGXdSDZNbhG7LqhlqTcTZDyoCBHphSVCq0C/1m6/hqOmuD8l+IjbrOZ0+biJz2xOIIG5XjOFsCfKfDa5NSMDT5IRTnMGska3HgcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FbQKMdnNl4LnvOZCPRLlgUYp4F7k11cVczJAllIxmM=;
 b=GElYfdwQw2r3Ady3CxserAhBw3OGhZooPXfM+Gb9Iq+VgM16pigHpw7fu8HL/KTrCCLzauij9y+/uQmdce9hTjJK2D7DhckwDtXzYM82Y9mhivJquef4JRuFz4CLPCH4jdXew3rlKw4LtbvBkUHeH0u0Ieq0ElT1kceyeaQFIYoa2akeu7HksTdk0vcBeTcnTdQEA9vIV1WZm5WAqKXzlUBYKW/lIyRhNTVQOr534ztCmiJcMVQr4unpsjsVEy8oNYXhpeB7vOzYaX8T6cSwlHyR8dqOdmvH/6JSgxiseyVAa6grkpBSHa5RRjpwqw4f1+bweWLjXrXrZumH/nLEEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FbQKMdnNl4LnvOZCPRLlgUYp4F7k11cVczJAllIxmM=;
 b=H7wj9PuAVN+qnDfbd1Hn9HeBD9zygvBkSm+jt4PGAn2Ces8+x4uCSjF1g9xS+x6yzuNh/RuBzhZJTeRgz9qamQSRq/nK+IVICrjiuBLaodD/z7OYGx1ExJvHoLCK2WM+C6MipJ3JnTcBWDUvGtZNlJqwleVaLfBzvVK1vXfDabAKppD+JqYgQebXWnh0Ibc1Oevwnzqo5ligbjznNmkMKly3ksDdDG91hbyRCrpppgxGLC6giAviK+PRMrjngGTbKdpJzSLEttE6lpTu08FV4LOeeDC/qq84dvCrm3gIuXZoKbkdKh12Oj5OAQkM+ywoS5mFKGSnnAdyOiHuAPsYfw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYZPR06MB5420.apcprd06.prod.outlook.com (2603:1096:400:200::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 04:20:36 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 04:20:36 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>, "jussi@sonarnerd.net"
	<jussi@sonarnerd.net>, "roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for GHW-123P
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 GHW-123P
Thread-Index: Adyb1pg/ABWkiS4YTRGjy4GXk1i+0Q==
Date: Thu, 12 Feb 2026 04:20:36 +0000
Message-ID:
 <TYUPR06MB62176831E47899AB98902012D260A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYZPR06MB5420:EE_
x-ms-office365-filtering-correlation-id: 5a800f70-859c-4d07-3d6b-08de69ee122d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?emV3MGFocXBzc0RwUWp2d3dlbGZiOGloSEtEZDhKT3dQOUhJWXlDT3ArNk5k?=
 =?gb2312?B?M0hVZnRoMkFNMEJLUytNNGVLdk5FWTBlU1dBNjc3dDM1UXI1Q1dUMlhvNk5n?=
 =?gb2312?B?cGpRZ09tRTk3dTJ0Q05aUDY2WnBROW5vMkVSS2IxZDdxdVVHa1dpQ1lFOVJ1?=
 =?gb2312?B?Zm93dk0yN3hvK0NVUCtXQ3E1Uzd5Sm1tdFZjeGVwWEJ4S0duN1dCNUFLMk1C?=
 =?gb2312?B?VHF3ZnZ5WUtqUHBJWmkxa0FtMXo4OFRGcXBuRDllMnhtUVg1QmtoY1UvUjFy?=
 =?gb2312?B?WU5BSEpUYmZoVHpidWIyQXd2UVBWMGxUUERQVEtHbTdPSDMrTW1xN1ZOSHV5?=
 =?gb2312?B?dXJPYlpWSkJWWjExMjVycXdjVnM4d2RscGxFUWgrS2x5WlZDQ3hwcWNOUW12?=
 =?gb2312?B?MSs3eGJVb24zblB2VFVGdmc5RXFIVGV4NWhPY29PQjBJWGJ5K1RheTB0NzE0?=
 =?gb2312?B?bkNVY0c1OEJsUlIzOHpMZG9aRXVHYUhyRldNN0RQK0tVTTlYOHdBaG5xRVhZ?=
 =?gb2312?B?R1cweHdKUks0WEF2U241UFliRDdZVVcxYU5tSGRDVDFyajFWdW16YVRTZjBh?=
 =?gb2312?B?T1hZVzNhSVhkOTNXVW13d0lGVHhGcW9qRG1tTGt3UjZXK1JnYUpvREJmWTlI?=
 =?gb2312?B?cW9qdjFPNkt4aEQ4NFZKVU1OWVdvc0pJb2tjbjcwK3U0Mlc4aytiUW9PK3ZS?=
 =?gb2312?B?T1N6U3pwMm81d0pSa3ZBVkl0VkZSWVhvVkIvZjR4YTgwd2NETmRsUHdSSkVz?=
 =?gb2312?B?QXprZWJVb2tXSVVqVCsxc00rZ1FmKzZZME1vZFNITiszbXZJQjlrZDRFS1kx?=
 =?gb2312?B?WkxleDZKTVR4R0NNWnMvRVIvTlJRNG44cDdWc09VYnlGVDFwQ3VXVVd2M25D?=
 =?gb2312?B?UFlIandNSTRBcWRWMDBWbU5qdDhJUFBRZ08zeTJyenlZSU05RzlKWHd6akNQ?=
 =?gb2312?B?dkhPVjlPTE5DaXhIQ1BvT2FjUnkrWC9BSFdMWFFCZzRabncxWi8yRGs1OW5L?=
 =?gb2312?B?a3ErL1daN2lLUDdCS29jK1hqaGNXb0hhR2NVYWZsdVFJNFhUZGN1Y0pyOERt?=
 =?gb2312?B?UmRHWVZqdjEydm11ak02NlFHUDRKZnhQdndUemhML1dTd1daUGFqYWFFQmtI?=
 =?gb2312?B?c2YrU3dGMVp5RTJaUjFlQ3lRUDgvK1dmWVpZUStVS1NzNXhnOCtlOTNQRkhi?=
 =?gb2312?B?ak8va0x1MWkvNC9SaldXaWI0MG9OV3FPK0tVTHhvSStwRUlxYTdDUjVQUjBR?=
 =?gb2312?B?NVN1VkNDTjNGMUxBaHVFMFptelAvUjJYTGVxUTh0d0xCZmJhNndrM3lFamFU?=
 =?gb2312?B?SEs0cWVOK0JiV1cwTzZyQWQyclhpSFdLR1hORy9TakRpRk9MNmR5Um1YbTBW?=
 =?gb2312?B?SlNOVlpCTGFSVE5sRHdEcEFIMmRuYXg2RlBpalpDQUtlMktKUFJxbTBEVWd2?=
 =?gb2312?B?cytteVEzT2NvMFhzczkvanJpeGZRaVNrUHdFU3dpUUs1cFFBSWh2SXVMcHdG?=
 =?gb2312?B?Um85RUI3MXBzR2QwSlRsTnBPOFBpTE16Sk9jV3YvRU01QkUrV29EclRhYmUx?=
 =?gb2312?B?RFFxUWJPcnFnQlVPeUJjUkNMenYzV1J2alpKMmhDVHkvWVRjUi9BTXNpRnd1?=
 =?gb2312?B?MCt1VlNUN2FkQ01qZmFBaWlFeEJxMytOamw0K2ZYbDFNdXoxWStHL1FQNHNT?=
 =?gb2312?B?cXhVRUxFdFVHL3Y1WFdSK3ZaeDRkYTY5V3ZCY3hta2N4cVAxS0lpTDNBeVdD?=
 =?gb2312?B?Y1VRUmt5RzA3aDZxVVo1TmNIalJSQ1pMa3k2ejdmSDJxYXErTUE1OFpVSGhF?=
 =?gb2312?B?NmU3OFM5eVZKZHN1UlQrTTVwM29hUEwxMDVzL29oUW9TVzN0SE5CYjJ3d2lI?=
 =?gb2312?B?MXhBUzBFL2ZSTGxCaGdyOWtFWENYazNHa2pBTkZ2dzNkZytScGNLWCtFMWx3?=
 =?gb2312?B?b0FPNDAyckFTYUxIZy9FeDhJTVpaVmtlZHRwdGNFdGEvcEdBWW04clhZMGxZ?=
 =?gb2312?B?QjNSUXdYMHBvMG9aN2ljM2h2bTRuZnQ5ZitkVk0vMSsvSURRMjlXOHQwUU5K?=
 =?gb2312?B?c1krenBOMFBFRGVIdlFaaHk0WE5hSTNQUTRWRHQ3MEl2V2hGMFFHWXNuNG1N?=
 =?gb2312?B?OEpkMEFXMm04Y1FzZjB0YkxYQkFRUmd6WHNXYXQxQ1Bod1lnQU1YV1Y5TVlX?=
 =?gb2312?Q?ifcQDJpkxXG5FRpf+wO+U8U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?NVYwRGYvUkFjdjR3NEJ3QkpqU1BSRTBZTUJhS1JMRWZHNGRjOFNHZENFOVNz?=
 =?gb2312?B?UjVNMGVjZkM0NTJsL0pVaHlSbkhIYURQMCtPYlROREJ5YVh4S2NlN3p6ZVRP?=
 =?gb2312?B?QklCU0paVDJZNFN4Y2VxekRGRnhtWnhVVnpMRlZMNkRmY1VVZEdDWDdiRXVn?=
 =?gb2312?B?RXFOTUQwYXhhN0o5cjF1NCtwZFpnWTZ5ZGJnb2pKWFVxR21lTUpJbnZ5Mksx?=
 =?gb2312?B?ZVViTUN4REx1dDRwQmV0VXJPQ1lnZnI2ek4zOW1abHZJd2xGMHhZMUVJb0Uy?=
 =?gb2312?B?NnFJNitBQkFXbnI1YVV3TmFyTndFc2lvbmxWR3VUSjVYR3hscWZWMGFZd1JK?=
 =?gb2312?B?TmFLYU9qWkhmYWRUUUMwK3BGTkppWk5aLytFcVd6cTJOSXlibmpwcXR5QldZ?=
 =?gb2312?B?QzlKRmxsOTdSVHJKQXNmaVVyaUNmZjVPcENZNXo4OVdWb3ZTK1FFdWFIRzRy?=
 =?gb2312?B?Y0wvVEt0d1EveHI3K0srMzAvUW12V1g0WlFJMElYYXB3M3V4YWpLSDh2TkZE?=
 =?gb2312?B?N0xnL2o2K0RRei9yMWxsSVZCdFRDTy9tdVQzSSsvUm92MjFEM1JuN1p4ZmFG?=
 =?gb2312?B?WUl4b2EzUGJTUHdUL3NhMEIvSFZqTDhjM3FEWDNtcEJHTlNETjQxSzM5bHhy?=
 =?gb2312?B?ZDcyUUpwNm9HekM2MFViL0Y5ZGc1Q0xmSkQybjZXZnBTTEVlc2hpNTZUbzAr?=
 =?gb2312?B?VjRVY01RT2w2UW9HNk1JVkFnRTNGeTA4SWQ2aVBYWXNVcXBXRWF3TTBWeDBt?=
 =?gb2312?B?cGJGUDJFU2FrV0JadDl1YmJoSCtPUFU3N0JQV3pXNTNndWZiTFFYN0gvSmhW?=
 =?gb2312?B?M2JvSjlHMndFWDE2VGppOEZ0L1ZXbHlxMVd4YTA5ckk2UzdJeXdBd0NjMTdm?=
 =?gb2312?B?SUFMNU8zZkdwUFZFV0VNT3BZblEyWXZoUUFBU21OQnRKRW5kRFZoVjRST1Bi?=
 =?gb2312?B?ZDBnRlBIek5wZkU0b0RseFBybVc3RE8vRGU1ckRrbWRZQXJyeXFybktxZG5p?=
 =?gb2312?B?a2dDeW1aUTUyOUNYc0ZtMjBLVTFDOUgwQ0J4MTNqQzJNVGcrbldXdWFwMTNw?=
 =?gb2312?B?aHlMbXFuZDJudHlxOGZPb0UxdURlVURCbzY0bHVPcmpLOEx3elh4dGRVVUg2?=
 =?gb2312?B?Mi9WbE9BU1JaTjVxUDFWaTVhRGNnZUFlUmJMNjFhR0JKU2FHZjF4NGhIQVFk?=
 =?gb2312?B?aGMvbEE2V1ZubW03RkJhbWJJeVE0TE9SNlBuV3FkZzdPREJmcGRPaFg2VlhU?=
 =?gb2312?B?Rld1UFJVL0FOeTlaWlBIOVViR3EvNU1RakMzYlRqQXU3VUlKc3M2dkFzY0Iz?=
 =?gb2312?B?bVhEYVEyR1lIRDJDSkI2aVVkeC92NDBzTHRtWWZXRlk3TkEvRitOTVJHMVJk?=
 =?gb2312?B?RmNlUnBPOU9tTWltYWpDYUpaYW1nVlZMZHNVcU9qWmVNc2xCWTdiSXY2S2F2?=
 =?gb2312?B?V3VLNG9HampxYWpTNHJ6TEN6QW01NkpOUCsyNXV5QUV6MDVzUS85NXhUT05l?=
 =?gb2312?B?UWpjWFpKNkRqdDBxVE1IckhXWmNyYThuWGV4SUF1T0tqd3Vyc01NOE1qb0lH?=
 =?gb2312?B?TFIwaVk5NWVqMi9kUGhrcUNlZ0F0WmJFUFYwN0t1Z0F0ZVV0MnlzdEZWNTFV?=
 =?gb2312?B?Q3FsT2tSa2N4UmZGdEY3UWN6N2NIek9YdEEvVEMxaGRxZXF2c255QXJreUtH?=
 =?gb2312?B?KzZNald6RE90YlRwZVNhN0ROd3drMGgxYXIyUWVPRnJlTExQakNZQXhrczNr?=
 =?gb2312?B?blQwM3REeWNudWJkaEZCWmU4WVNLUi96ejJQYjdMVThlVS91SFNwU1RYOUNG?=
 =?gb2312?B?T2RTNVdua3g3RWZ0c2FRUUkvaWRFRGFvVmc1TlRwV0JUd2grWmIxZmlXbWxP?=
 =?gb2312?B?T2ZpS0ovQTQzaExXTytNNDZwVEw0NkY1SENuUW82WGFVeS9tbUNUQTFQUHhY?=
 =?gb2312?B?WHpSaDRkTUVIZnNNN1ZNQzdvcUNRMS9pZ2dMVkplekxqNWMyb0tTNVNoMmh6?=
 =?gb2312?B?eFBkWTFEWFoyUmVTL2hkUWV0SFVrZEJvWHNrN0dzaytYRUFjZlJ2L2Y0VWQ4?=
 =?gb2312?B?ay96RkFrSFMwdVpKYk8rQk9FUXQyMEorQWMwa3pnYmljZmlCY0JjN29WK3hX?=
 =?gb2312?B?NmVNckdaZmx6Sjd2bGFxQjQzZVhSODFtVHBCV2F1Qmd5Rjc4L3E1ZldrNXNF?=
 =?gb2312?B?a3BEcjhuSlUzQXowdjUzdmtTMWJNcndhekJlcTVIZzFkZnE0T3dieEtONFNL?=
 =?gb2312?B?ZmlrREgwdkdaNkhaMmt3bDNqQUk5bVlGR2k3NFdzYU9VaHVETEliTitReUNU?=
 =?gb2312?Q?+eliSosAkKwCD/0VEr?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a800f70-859c-4d07-3d6b-08de69ee122d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 04:20:36.0987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQ4xbTJvK7/aK5vVoxxo3pLl5YS4LIScvBHn06m96y2BOQrjhGqC2xAuyL7vQ6P9XgR1OF/O+Xttal4MRXmnDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5420

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRv
cj0wMDIwLCBpZFByb2R1Y3Q9MGIyMQ0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczog
TWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IEdIVy0x
MjNQDQp1c2IgMS0xOiBNYW51ZmFjdHVyZXI6IEdlbmVyaWMNCnVzYiAxLTE6IFNlcmlhbE51bWJl
cjogMjAyMTA3MjY5MDU5MjYNCg0KU2lnbmVkLW9mZi1ieTogTGlhbnFpbiBIdSA8aHVsaWFucWlu
QHZpdm8uY29tPg0KLS0tDQogc291bmQvdXNiL3F1aXJrcy5jIHwgMiArKw0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWlya3MuYyBi
L3NvdW5kL3VzYi9xdWlya3MuYw0KaW5kZXggZGRkMzQzMDc3MDk4Li44YzMxOThmMDgzMzkgMTAw
NjQ0DQotLS0gYS9zb3VuZC91c2IvcXVpcmtzLmMNCisrKyBiL3NvdW5kL3VzYi9xdWlya3MuYw0K
QEAgLTIxNDksNiArMjE0OSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2F1ZGlvX3F1aXJr
X2ZsYWdzX3RhYmxlIHF1aXJrX2ZsYWdzX3RhYmxlW10gPSB7DQogCS8qIERldmljZSBtYXRjaGVz
ICovDQogCURFVklDRV9GTEcoMHgwMDFmLCAweDBiMjEsIC8qIEFCMTNYIFVTQiBBdWRpbyAqLw0K
IAkJICAgUVVJUktfRkxBR19GT1JDRV9JRkFDRV9SRVNFVCB8IFFVSVJLX0ZMQUdfSUZBQ0VfREVM
QVkpLA0KKwlERVZJQ0VfRkxHKDB4MDAyMCwgMHgwYjIxLCAvKiBHSFctMTIzUCAqLw0KKwkJICAg
UVVJUktfRkxBR19GT1JDRV9JRkFDRV9SRVNFVCB8IFFVSVJLX0ZMQUdfSUZBQ0VfREVMQVkpLA0K
IAlERVZJQ0VfRkxHKDB4MDNmMCwgMHg2NTRhLCAvKiBIUCAzMjAgRkhEIFdlYmNhbSAqLw0KIAkJ
ICAgUVVJUktfRkxBR19HRVRfU0FNUExFX1JBVEUgfCBRVUlSS19GTEFHX01JQ19SRVNfMTYpLA0K
IAlERVZJQ0VfRkxHKDB4MDQxZSwgMHgzMDAwLCAvKiBDcmVhdGl2ZSBTQiBFeHRpZ3kgKi8NCi0t
IA0KMi4zOS4wDQoNCg==
