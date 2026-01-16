Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012030.outbound.protection.outlook.com [52.101.126.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC573446B6;
	Fri, 16 Jan 2026 04:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768536243; cv=fail; b=oooRl31/sWPbX6fxpI4A0r/3YhlFnCJ+oGg9HFAI0zpF3o2WE+kF9xI8a44ppvZcRss1nO+321x6CBeDtgY9M9e8ySG24GK03kN7+VaZSNaw71pfygaUXODnJJBdwdx8pBvdpOkdRJ1LxCYJJ2j5rUh4ld1CtIC5hOSSpfaFoVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768536243; c=relaxed/simple;
	bh=bQeHB5en1/K/ZghssUMX/Pk5aZXkk6Juq3CFMHbewbk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=clbLv84q0H3iB8F/Cx0x9Cls/31BOiBzXw/vl0/yARKJwEHyksN8YKkKVRc74QOJaXvPqvc0Y3Z3z8l0x6696/3BRSeWRoJoJkMdmJ7eUppj4SHPrmHSjB5YEfFzH6XX2F1nDAs/30z9VSgBZZ/YsxPUqrCy4Vd9+C8L852cTnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=dfZKXAhk; arc=fail smtp.client-ip=52.101.126.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="dfZKXAhk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGHebhO1HFukME32xi/8wnO+w79hQtXZAN96JxcPsrbfrfD1MGhLzlwwtiMY/BFHdY2aKunnkA+M3ZZKXZhd/eYGs30M+A99ivKbXylA7XMjcI8LXPQ/gRCDWW8F5O8kLTGpXsL8vHCc3JKp5rMKRsUMOGPPa2xKXnYdhq1fQx0GBROHgD4VUEe2LAw2r6hkRCEWxOwCnBExO29pjl14uzv6VihURPSt5oy6Ewe+v3DsEBIh3xviaPn0o3oxEY2808GeBu5vhhHOtZ3/tf9XsoIAItOJ8FFlzwfYZfeG14Q5/CQ3xVRHiKVUvwymD9RRc1amMcFOJfjfMZg7LUFGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQeHB5en1/K/ZghssUMX/Pk5aZXkk6Juq3CFMHbewbk=;
 b=Mq1TyRkPamksbkfiRGG+auMOq9JRUZXFsd8UuheJTrUJyWigLp+KISn0EoO9VBLEPM5HbENJwx8hMT1VbIZuVHF8IYbgMo9Sm+JqkSTcKh0AoZUIUbXrc96GeebOWw1YwdtfDhCz3uiDmYpWiH33fqLuBhF/5aq1mOWU2nk7qGgR+/JP/eS6brpo59t/a05LHaJObesN/YEpls/FtRWMl4b9LnoohrTVX3gm5udAUByIAdRXals1Bv5zDuQEOqew56OB+KonAKubqLVKbVVyqZ3Yb7mzeP5Xs6w+BIBh+VVuKMOBJMZJcRfntn2HIiJ+/g0GunniZXACSIv1nrB7BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQeHB5en1/K/ZghssUMX/Pk5aZXkk6Juq3CFMHbewbk=;
 b=dfZKXAhk8eP12mrxEKNBK0FFiBB8htzeZxoSLEo9b6UAgqlADuwSo0Cc0nZkWG5jVsWbPq1a8QHC9m6ugMIfBLXjhBprt+47w2R347Z5ZdY6fa/ds2ajK7nQnQ05JD0e/IeFjo2kkTG+ghnosuMOsJ4cL6ifb11l4RjUg8gStv9ZhEwbm60SXNfix2jI/JJdvNJq9jxkVKluFPXH8xKvF7wJL6HCMamvZPQujBmYs3E1Hw0rQ9p3j/cwFBslBvb821O7lpT0oYYws7FG50S8s+FBd10IIZTvdSAwI1DFAMeFvTRiAULhBwMGZLUdqwZ8O/RHGzkpCXAKxWdHMQO3hQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEYPR06MB6251.apcprd06.prod.outlook.com (2603:1096:101:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 04:03:48 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 04:03:48 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"cryolitia@uniontech.com" <cryolitia@uniontech.com>, "pav@iki.fi"
	<pav@iki.fi>, "jussi@sonarnerd.net" <jussi@sonarnerd.net>,
	"roy.vegard.ovesen@gmail.com" <roy.vegard.ovesen@gmail.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: ALSA: usb-audio: Add delay quirk for MOONDROP Moonriver2 Ti
Thread-Topic: ALSA: usb-audio: Add delay quirk for MOONDROP Moonriver2 Ti
Thread-Index: AdyGnEsmL+94Nt7iSpi6iVzxZ8VQOA==
Date: Fri, 16 Jan 2026 04:03:48 +0000
Message-ID:
 <TYUPR06MB6217CD0C82B11AD3E659D174D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEYPR06MB6251:EE_
x-ms-office365-filtering-correlation-id: fb040d53-9202-46f1-0c09-08de54b4408e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?R0NVNnhCRkdvUjNDOFdyeEZlZjZsRW1McXRablR3V0Y5UTFmWm85NUZianpp?=
 =?gb2312?B?L1cySnNjMzRWM3N1UGZvcCtxdkU4dHhSTzRRcTB5cEU4M082bEdaOUZUSUVK?=
 =?gb2312?B?U3IySXNZRlc3K0l3T0c1bEdmUnJSVS9YNWw1QWpQd1o4dXo4NlpoNGQ3WHBM?=
 =?gb2312?B?OUpIQW5WZDRITVg1VVljY0FydVc2ZnJaK3BJWUZkVkJEdUlCbWpxNjNQcFVF?=
 =?gb2312?B?d1RyN3ZSYmVoMytkLzZibFVKV1VQcDNVK2tYRkJrZkVKNm5WNEpSMTRtYlJQ?=
 =?gb2312?B?RmVYbnhEL3ZFZDJpY2NOQVh6OXdKaFEvMFowbXgzR0o1dXl1cHU1eE0vNnE2?=
 =?gb2312?B?aFhhU29CampMS00wT1FjdnU2ODdWZHVwdHRtTFdBRGlTWG04L3JlVDVGZkU0?=
 =?gb2312?B?NHN4dEgrOGwxYjhEZ0lZWjBwQjE3Z3I1b2FVT3pUczI1b2lFUFdOcG5ZTytU?=
 =?gb2312?B?K2xjUkRzSU1MVElvRVkrTUpNUlJkaHBiOFF3dHJwQW5tcVBGazB2RkJKdWJk?=
 =?gb2312?B?RXF5bS8xVENDdjdIM1dkVVBOcUlGU1I2OUhCcGF5bnFmcHlveHNmM3RFczNR?=
 =?gb2312?B?Nko1MUlNRk9ZbURMcEtBaUhGcElBa2VuYnRTbk9FOFlDaXk4MkhpYitrWFpv?=
 =?gb2312?B?SnZRSnEzdndudXozYnF2dTRPeFlsd2lQU2xEQTlXTHo3cDJubjZiMEwvTGNT?=
 =?gb2312?B?cUI3eVNRaE9qTVVpR0lkbUdUODM5WE5ROVJ4VTl2SlRhSUV0RUxTN0JYajVS?=
 =?gb2312?B?dkV4RUNCWVZHMnphbGEwWE1CWHpNcUF4czBqdkRSK25PWlRWK1BnbXBOWjFj?=
 =?gb2312?B?OVI1OUh1d29naGRhSHVNSS9tVFg4dzRPeE5JQy95Q1Yza1FjRWM3L01DS2xZ?=
 =?gb2312?B?OG1OZEdoSkJ5Tk1HNzl1d21rMzdQUmk3ZTlOYzVwNWJmelZSbXB5MlNCNzAw?=
 =?gb2312?B?ampwMXRhdnVqNlU3Z1NWdjMrdnhyVUJ4bUx6SlBUdVk0QW5XWUNlN1FFTTVM?=
 =?gb2312?B?VkFRUE1ncDdZSGNPMmdwYnZIeCtIcXN5b3hTRy90OTRldFlzZldiU082S3Fo?=
 =?gb2312?B?NitSS1VzSlBFZFpFYzFscWpyNklCNmg3SVFJczJLQ1JJWmEwTEl5STZVSTY5?=
 =?gb2312?B?SFNua05oc3l3RHNhZGtxYlJuTmxXb1dhaFdsYS9IMm5yVWlnZDkvT1JBZzdY?=
 =?gb2312?B?eWg4bVNOS1c5VHJUVG1oR3NHVFlka0tkWGVTU05MR0Q2Q1k0SlhodHNNZ1N3?=
 =?gb2312?B?aXJ6RGlocU1OQVJ3SnFYNGtZOStTOGlDcmZSUW9Kd05SYlFvMFAyOWY5WGxu?=
 =?gb2312?B?MTVnL0dtSkVFZXNlVVg0R0tOTTdrUU9mcXpCMkx1Z3Zqc1I1TmF3VjZabTJ6?=
 =?gb2312?B?QncrdEMzSEZqZCtqZmo3ck5laWpUSFFDSGRUWUV4M290RWhkY3Q1My9aVVBa?=
 =?gb2312?B?TWUxTHphS1BhTkJIWW9YazgxcGdHUXFXWlBUOWY5S3NWT2tXSG13YWtTeUNa?=
 =?gb2312?B?dmNybnM3ZjNWSVFTQk93VnQzaFQ2dDFVSXJRUkdSUXNiWHZrY0xFbEU4VGNr?=
 =?gb2312?B?QlQwcUpjeVFVdXNDUmdtSXJGTEhwRE8wVkZQZjVZUmM5R3lwcjBBVmFvbmY4?=
 =?gb2312?B?UnIrVEVHUUtxbVk0bU5ZQ2hkRHIvUDJ3dUpFWk5PcnhKaE9hSzA0dkl1enR2?=
 =?gb2312?B?THhoakc5L3dpcjk3cEdkWnd3cXFYMnMwZDVkbWhLYjlzcFp6RnpXWnZaVCtH?=
 =?gb2312?B?QWFvRm5iOHVLWG85UHBiQmJrQ29PMVdCZkVDcU95QzdSbDhEY1J3TGxCU2lJ?=
 =?gb2312?B?WFlqUXg0WGViQmJnNUdOWmE1aVRNWE5KK1RBZ2pnQ040UnJXdG9TdjBYS0J3?=
 =?gb2312?B?RmNHUjBCaDNPSXJ3Y3kvWi9YMW9FU3pNZXlBQm0vRkQwMll6TDRrK0daOGor?=
 =?gb2312?B?UThNYWRWZmFJQWhCNkFUd29PU0FjQVFYY0t5UlNSdUVwMjNHdGlqMjd4OTQz?=
 =?gb2312?B?ZEJTdW0zUXk1SlJnTjBqMW9aSkFMWjcxNldmYkRzUHU3L0ZiVUcrZnpNZk1Y?=
 =?gb2312?B?WDhLSWxVRGU5MDM5aUlSNnZtOWZmL3IrY21KOEZTNWdzZHU3OVNaTXRXbHJ3?=
 =?gb2312?B?aFJZclV6d1RSdmd1SjhUa3czYTFEZGNjcEtxOXpvSUMxL3ZLVGYyNEplYmR5?=
 =?gb2312?Q?z17nArzxc6ZyhleKoyFV1zE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?UUtnWXpzaTBqNHJzVkZuMFhPL2hVNWVHbGxHcDBYZkRPcjY0ZVlDNzB4NUFC?=
 =?gb2312?B?cDcrRTV2M0h6T2JzeXIzd2lXeGx3bVdLWTFGYW1oalAveXlsNkNjYUs3VzY2?=
 =?gb2312?B?c2VuWXBBaUFsR1JpZVM3bXVyT1RvcXpmZURRV0w3dUs4SGxtK2ZnaUFOVld3?=
 =?gb2312?B?U0NPSkdvcldoeHdJaVlJUm40QkJtQmRacVU5OVNReXQ0MGhSeHVpVzR1L1pT?=
 =?gb2312?B?NTdIZHZTSzhOMHZHQVd6aFhhWS9KL0tGOGF1MGdrZ0VoUUhoTjJkRmRldEhj?=
 =?gb2312?B?djlVeUk0b0xGNGh3cWtnaUdDVVRyUHNUUGZWSG5yRUc4V2ZvUmowRHdWTmFE?=
 =?gb2312?B?QVUzOVdsd0N0MWkrY2YyY3kvQ3FOZ2Q3MFlFOUNPM3BOQkxON2RGZU5tdGVP?=
 =?gb2312?B?ODd0Y1pHWng5ZURmTVlHSThCRFZ2Qm9PK0ZLUVhiOTJGMFo4Z2g2ZzFKbGlF?=
 =?gb2312?B?QXJKcTRodnV1OUtoY0pNZzBON2xrYmdkWGFTWHpCRWU1Ri9yUDNrNWhqeHZu?=
 =?gb2312?B?N0d0Y3RpTzFVQloyajlSTlJFdzRJVFBwWVE0QkloMWhHdjJyVWl3ZXk4dHhM?=
 =?gb2312?B?d2FjSjBqaDdhaCs5Wm9MMDBjdHBKT3pqb0twamhCU3FJa2V3RXdFSVdkQVpK?=
 =?gb2312?B?WEpYODlBa3kySFFVTDRtRUcxYjZJQ1ZuRDhYalZTbVRPRm1KUmJOc1VVcDRR?=
 =?gb2312?B?RWRUL2VQbTRYN01DTTBrY0hWODQ4blpXRHhIQ2NLQkZXY1RVNW1nTTM2YkVW?=
 =?gb2312?B?LzN0OUh2ZVpPOU1KL2l4NkllYnN1bW5NMFdiaFFkNEVrRUl4dWVNV2ZldWth?=
 =?gb2312?B?Z3h4WkRRQnpJMGx3YWh4VDdsOFlOcldLcmVuSDNZdFdMQ0o2blhER2VKTjl4?=
 =?gb2312?B?SExmU1VBak1kdzNjMHk5U29DM1plRkFwdjgxVzQzYTZ6OERKOHQxMktMenlh?=
 =?gb2312?B?NlVwNGlrWkpwYW9STkd6Tkc2R0FkTXkvV1NzOGlOelJKRHRBbU1ZUTVKNk9r?=
 =?gb2312?B?dVBIYkVpQTdVekM4TGdUY21QQ2pDbXZRTytXajNJMnJNN2F6N3VUaGgxY2No?=
 =?gb2312?B?VmViYTVDWmR1NXVPQWcwdUdBSGRoV1JHbzczdFFNaE9qLzI1Z1VzRUNWcWdE?=
 =?gb2312?B?WVJ4bVpPbEd2WVMvVStKdXJkSHBnT0dzVzhLdjlvN2tkNEg4eXNPbHg1cmg0?=
 =?gb2312?B?amhDdXhlRXlMVTJSNkpmcDNDOEtFdFlMTlM4b1dWeG92dXdwR0tmWlV6MEhV?=
 =?gb2312?B?N0JmanJCazdnUkJROHFQak1KODc3dmxWOGc4cmpOMXptM0hNcHJzeE9xd2hh?=
 =?gb2312?B?MC9JblQzcW5JVDYwMWZJTk9iSGdjQzRNYlV3ZFBzdExSdXVHZ1o1N3RUWnpQ?=
 =?gb2312?B?ZVR1cG10VDQ0bkFXODAyWEZWM3BhM2FtMHQ0NVhaYlZHbndGNlZ1K1Mwd1dj?=
 =?gb2312?B?YW5Icy9MVDhuTEowU08vUFd4OWdxQjU2WWpGdEh3Wk4weGxCTDVRUHJKcUpI?=
 =?gb2312?B?YkdzYkZmMFV4Q0ppU3FMelRlRHcyZlQ3SWNlb1QyOE5manNtOGlqUUpkM3ND?=
 =?gb2312?B?ZFFsV08xUzIzZ3BKKzZMendYSnpZNDc0aThOcWY2cnFYN3hYSzF5L1IzY1JB?=
 =?gb2312?B?QjFKYkYyUGhldS9sdkpqUjh4MWhqdFp1NloydGRYNEFxVm9uTldwbjJNaFZR?=
 =?gb2312?B?Y1VpZWFTazFFQWlqYlJRaCtQVTNwMEdDSnJ0c2txMzNEWnFLVUJObDBvL24v?=
 =?gb2312?B?SjI5eVA3ang1WlhMajRISGdEMk9jM0ptc2xGS01wSHFqWE42dU93L0ZUV1Mw?=
 =?gb2312?B?WmlXQ2tLV2l4djduK0pWemNMNjg1NnFqRWxTZEd3Q2hvN1BrcStGSlBnZEVX?=
 =?gb2312?B?ZDNYU2tDVkJQVGVpeGJ6aFBOK2FDWlAyQlZkTHBLbkRCc0YwR2RHVENHcHA4?=
 =?gb2312?B?TUpmbHVXUlNWN0FpaVcrOGgwVFVBMHlhTk1vTEo5L0Q0bS9tTDNjTlF0Y0ZP?=
 =?gb2312?B?QzZwZmRTajFSR25VMVNUUTYwMDM1RGJhVjFzT1NBMlRlRkN0Z1pZeHVVMlA4?=
 =?gb2312?B?NG1YYVErWVRSUXUra3ZLSkE4VS84VjFmb2FxcUVnRnhKMXdIU2VueXNzNVNX?=
 =?gb2312?B?K3FZV3RhQnZZZnVneWVoOGgyUFlra01RMTN1eWlFbllEcjhZZU9qQWNOSHUz?=
 =?gb2312?B?eitCODVpcTU4ekN1TGVYZjVaLzl3SHVmUXBpa0JBZXNxL2MvZWQ1cC9Tbkw1?=
 =?gb2312?B?MjFhb3pFSEdYZ2tNSkRZSFRwRk9IRXEyU1FaTi9vZGtXc2F3SGl2TnhTS3I3?=
 =?gb2312?Q?JPXyc5G5XO28mAvLP8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fb040d53-9202-46f1-0c09-08de54b4408e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 04:03:48.6435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NYFR3ObXGWOidxM7GH3kyjuVlOEp3uyquO/lP2KjPl1+ETIUsNMeyJjTdmsRKepf3zn+qkd/YQsujKS8bSEcvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6251

QXVkaW8gY29udHJvbCByZXF1ZXN0cyB0aGF0IHNldHMgc2FtcGxpbmcgZnJlcXVlbmN5IHNvbWV0
aW1lcyBmYWlsIG9uDQp0aGlzIGNhcmQuIEFkZGluZyBkZWxheSBiZXR3ZWVuIGNvbnRyb2wgbWVz
c2FnZXMgZWxpbWluYXRlcyB0aGF0IHByb2JsZW0uDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNl
IGZvdW5kLCBpZFZlbmRvcj0yZmM2LCBpZFByb2R1Y3Q9ZjA2Yg0KdXNiIDEtMTogTmV3IFVTQiBk
ZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6
IFByb2R1Y3Q6IE1PT05EUk9QIE1vb25yaXZlcjIgVGkNCnVzYiAxLTE6IE1hbnVmYWN0dXJlcjog
TU9PTkRST1ANCnVzYiAxLTE6IFNlcmlhbE51bWJlcjogTU9PTkRST1AgTW9vbnJpdmVyMiBUaQ0K
DQpTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxpYW5xaW5Adml2by5jb20+DQotLS0NCiBz
b3VuZC91c2IvcXVpcmtzLmMgfCAyICsrDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQ0KDQpkaWZmIC0tZ2l0IGEvc291bmQvdXNiL3F1aXJrcy5jIGIvc291bmQvdXNiL3F1aXJrcy5j
DQppbmRleCBmMzgzMzBiMDk1ZTkuLjJjNTFiNThhNWYxNSAxMDA2NDQNCi0tLSBhL3NvdW5kL3Vz
Yi9xdWlya3MuYw0KKysrIGIvc291bmQvdXNiL3F1aXJrcy5jDQpAQCAtMjM5Miw2ICsyMzkyLDgg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2JfYXVkaW9fcXVpcmtfZmxhZ3NfdGFibGUgcXVpcmtf
ZmxhZ3NfdGFibGVbXSA9IHsNCiAJCSAgIFFVSVJLX0ZMQUdfTUlYRVJfUExBWUJBQ0tfTUlOX01V
VEUpLA0KIAlERVZJQ0VfRkxHKDB4MmZjNiwgMHhmMGI3LCAvKiBpQmFzc28gREMwNyBQcm8gKi8N
CiAJCSAgIFFVSVJLX0ZMQUdfQ1RMX01TR19ERUxBWV8xTSksDQorCURFVklDRV9GTEcoMHgyZmM2
LCAweGYwNmIsIC8qIE1PT05EUk9QIE1vb25yaXZlcjIgVGkgKi8NCisJCSAgIFFVSVJLX0ZMQUdf
Q1RMX01TR19ERUxBWSksDQogCURFVklDRV9GTEcoMHgzMGJlLCAweDAxMDEsIC8qIFNjaGlpdCBI
ZWwgKi8NCiAJCSAgIFFVSVJLX0ZMQUdfSUdOT1JFX0NUTF9FUlJPUiksDQogCURFVklDRV9GTEco
MHgzMjU1LCAweDAwMDAsIC8qIEx1eG1hbiBELTEwWCAqLw0KLS0gDQoyLjM5LjANCg0K
