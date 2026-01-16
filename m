Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012047.outbound.protection.outlook.com [52.101.126.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E420B3594F;
	Fri, 16 Jan 2026 06:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544121; cv=fail; b=jBSbAXyspz52PrzFLBnaAPIxoPi2XSEtaNzVUSG4vkmXhbdY+OHWBfOLdZDOL2wdAHYGtiHo/6Tri2IhtfC3chXEWrV90gc9sStWj6OeQurLj01Q1jS7DWzQ3klkG+Bb0+l3/ldTk/82oYu9Y/4RbY1KxJ5gdh+cwZtw2rsktrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544121; c=relaxed/simple;
	bh=V3g23+4Qk3ZpGLvNVEZU7W7w/8wCYCVBp5MfGWhnd30=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HbxQDmsC6ns7pUeRIicg3NzrAucYVGUvnsy9lFq3BI3gONzGp3qrNPNnrZb3zRmPMKtR6NIw5TQZS76ePtklRQ0rLqcxdMy4IHKV55Hdycj7nxyyPfm2JJE9KXzQluRvVjN2pBvu2WuacDbPBykma7mKAxh5oLRyc/oDmSxn/3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=XeEqXHEZ; arc=fail smtp.client-ip=52.101.126.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="XeEqXHEZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMfaFP1Cvk+72lIGryo93uiutjFqlsaTd0Phwkw/hYpVQVAXJWlilBB7TV51E7byX7SfYRjC40Te70JGyr9U09Fpq9DP3z5YdMA4xkqgSIaGmZrQ3w8EgvJ0qcHm0w/nYqIWu08aIv3ZcX+c4AdxZGjfNjuBScnaQ0jPlmqvvtgyDggM2CD/3P/BI9oZq+RW8aNZJFycH4agCYn7wfot5EEjSRj0FO639ytlssnNU4lVclAnGDhcrC+A81DffpIAzQRDaTyYdXgzMBCQ2O0xxvtLoEsM65Ey+BLy+/z4LP217aY7sQDX+8GYyssGT7AvC1BQaABrT+TY2+djz8sccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3g23+4Qk3ZpGLvNVEZU7W7w/8wCYCVBp5MfGWhnd30=;
 b=ERQilvKOZf8GIC+qB8+hdqnlUaHkdqYfWO3SMLvJr9UYYNVIMFoKVTznsMjGWHLkuZlLinDtGMCeCu8O/TacN1GjI8fWbFwchZp020bWuVr05SxI4RgQYX0qIrp7awn8bulz9mh/OsDyc2712nXM9VDO6D1YY9NHyp2bNQXPp0Hwesw2039UhplbkZEKodP2iC/6POMBMwyBohygmgE/x1zKY+oAx97f7ZCn5FYgSWN4IGldgdIOFe+vnjwDaNJvAmr6Ks3b85M3AGnesQZbLVohrNRPhvlm+LjmilwHbPz0Qg4tuXz9k/z58swoccxZgeAZ2hILzSqkaTep7TSN8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3g23+4Qk3ZpGLvNVEZU7W7w/8wCYCVBp5MfGWhnd30=;
 b=XeEqXHEZ0VklENQRTv63di7EZYyjkUhlmqpc3U+lF1qtNnbGUwIaXioEFAXLEx2tf/c268Et4qWTHoNlv/yP8OS6YkxySCOoi7Woo8GUnIE5fJ+7Igaz7uudz6NqFjeCsGxiMcxltxVUd7trLLGKcKR+VuW8iKbtCmPOf3YDJV15LDWuYXcqXT/VO4IIQ0myMTtmbxOH3myOqXT6TUYIeatJ1Yq72UCZ/nNnELq+DXMKievTwbEMF5OGiKOHge84YjRTR8wGvmUbdYizovhVGZWfEGJoRUubw/ebagqzeL+L1cB2fn9sd3rL2cp+OEdtR7Jd8DUoEMPKbRetbcRR8w==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SE3PR06MB7959.apcprd06.prod.outlook.com (2603:1096:101:2e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 06:15:15 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 06:15:15 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Cryolitia PukNgae <cryolitia@uniontech.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "pav@iki.fi"
	<pav@iki.fi>, "jussi@sonarnerd.net" <jussi@sonarnerd.net>,
	"roy.vegard.ovesen@gmail.com" <roy.vegard.ovesen@gmail.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?562U5aSNOiBBTFNBOiB1c2ItYXVkaW86IEFkZCBkZWxheSBxdWlyayBmb3Ig?=
 =?utf-8?Q?MOONDROP_Moonriver2_Ti?=
Thread-Topic: ALSA: usb-audio: Add delay quirk for MOONDROP Moonriver2 Ti
Thread-Index: AdyGnEsmL+94Nt7iSpi6iVzxZ8VQOAAEhbMAAAA2GJA=
Date: Fri, 16 Jan 2026 06:15:15 +0000
Message-ID:
 <TYUPR06MB6217214E0BDD3574D95FC408D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217CD0C82B11AD3E659D174D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <0FCE737713CEF540+3c332023-e0be-4742-8f8c-f2ad09e8c99b@uniontech.com>
In-Reply-To:
 <0FCE737713CEF540+3c332023-e0be-4742-8f8c-f2ad09e8c99b@uniontech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SE3PR06MB7959:EE_
x-ms-office365-filtering-correlation-id: 67cb8826-04f2-498c-39fa-08de54c69d89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NzhjVHdpVjUrMnlkTkxaUmZVeUFvaTR0UHdIcFZIb09QOVZyOEpPdGFUbUk4?=
 =?utf-8?B?RDJsaGZCK2ZkN3k5cnNndC81RVBFVWtQcytlZnFYNVZNUWh1SzFKQVBXeW8z?=
 =?utf-8?B?eGRmclFyRmVERmpLY1hWT2FMWGhta2NIY1dhNStkbTkrQ1VGUHFMQmU1NW1w?=
 =?utf-8?B?YWRTbGNxUWl2b3UydUU4Qkx3NHJBdVNOaU5NbzNnMVJ1OGJXcHJvdnJnYktL?=
 =?utf-8?B?OVVHaUNOaFBqSHl2ZUFvY2dNQjRvQWM4dHZoQi9OSGdEenpTUU84dktjSU9s?=
 =?utf-8?B?U09wT1hHV1RqWVFiaCt1WHp5b0FkTmVOaDV5VDF0M1lpMkR0ajd2TVpRNXNT?=
 =?utf-8?B?MERrRVFyMVljcGlZSU95dXNvZ1loOVdrcGlXNy82SW04OE9TNmorSDdQQ3JD?=
 =?utf-8?B?Ymh5ZjFPc3RVbVB2WmFUZ0RuM1RmdG1Pb3R2Mk9QWlVZNTkrOWdNTzdYOHF2?=
 =?utf-8?B?Q09ZUU9GdWxoZHN5dlNFMmJZd0owVlM3cUpYV1N5RnBmK0JFS28zem1Db0ZW?=
 =?utf-8?B?MG1FSDhNMWlnQzdyOTZWSG5vc1FBa1VTS2xad2hwcmhpU0U3a2NRc3h5VFpJ?=
 =?utf-8?B?em5ERDNTK3owbW9GQ2oxM05HR3hFMmNoMW55TnNJWElGQTA4NEZZN3U4M0cw?=
 =?utf-8?B?a1F1UDdGbkJvTks2ZlVPVTFsVDZIMUJnNDk1SS9HMW93clp4ei9pcHgxUmNy?=
 =?utf-8?B?elgrYW5VbnNKNFdOeTFCRG04RXJiSTUwcEdoYVZnczB4OXg1MW11OWVlb2JE?=
 =?utf-8?B?aUxCVjJoRW5hS3hIRnB2RVR1T3lGOVBJaHNza3NXeDFxNWMweEp0YVhRY2NC?=
 =?utf-8?B?VzRvZVZGYmRHVmFlaFY3RDNBaGZTN0wzZisrUTZGdklwU2pYdmg3akZNTlhM?=
 =?utf-8?B?eXZaWUloUHI0RFBJNEF3VmNVR2VVN0w2NVpvYmZaUWVDRjNXRm1hOXhwU0ho?=
 =?utf-8?B?SkNFZ2k3bGQ2bUJKZlNuOFliUThKQUFZN3BScWtqVnhTK1lPZndvdkhLTUVL?=
 =?utf-8?B?QXBRM2hEemdkRi9aV2VYZ2FkOFAwZU95NGMvQm93eGNpZm1TM3E5d2pLSG1t?=
 =?utf-8?B?VGcxenBVc0pock1ETVRFcmRSelJudjR6eCtKUTFpK3ArV0xJSzZBbzFBR3ZS?=
 =?utf-8?B?NXRWaGF0c29OQ1plaENHVVhOOUY4ZTNmZ3hJYVhSNU4xMC9iRkg3N3Y0QUp0?=
 =?utf-8?B?THQrU0tVOHFSYzY0R1h5N2NJOVQ4T3lyM0NydVF5WmNJV2FLbEtDVkwrMVZI?=
 =?utf-8?B?eml1Rkx0VUw1TTJFNVNvZHBPdTBhZnBBQ3RsRGZwcDgvb0dDdmR5NTZQenhx?=
 =?utf-8?B?RGhwZ21MTXF4VzZpTnllK1FteVlMcWc4MEYyVWZONzY0UEg1T3c5bWhOVDZo?=
 =?utf-8?B?eEZ1ZzgvQk1IbWhxcnB5L256eFJYeTB3OGUvbEkwSWVJeWFRNDVxblVqbDRB?=
 =?utf-8?B?c09iUjRBQ0ZBUHFqRnZmTmdzWkFBR0o2TkwzK2FobDc1YUVYdXdHL2ZETWtF?=
 =?utf-8?B?UHFNNFhYYXU5YVd2VUE1NzJBR2xGaUZGeE9TUkVmem1GOWlKNGpjWU53Yjhr?=
 =?utf-8?B?QmRBUncxRGRmUDZJSis2K3ArQUlwLzgyWER6dm1KeTE0RGU2SFlwSTBhaGZW?=
 =?utf-8?B?ay9JR0lpNTZUaUtaNElsSm1Qd1dVcG9PTzd0RnJVMkdIQkFHTXgybGovYVgy?=
 =?utf-8?B?LzZITmhySXh5UG1CekJrOHN2QXg1aE9uYzhsN2poZTBDYlQ0Y05ncHRvV2l0?=
 =?utf-8?B?eEtxWXcvdlJVOVFLRDViOU8zT0lTOXpSenRIQlEyMWhlU2x2Z2w0OG41OGEv?=
 =?utf-8?B?bzhMa1hmTTZHN2o3alNoNlJXK0szYnl5a1VDQUVmdkU0d3RRN2F3dXVpMUJw?=
 =?utf-8?B?MitQSUhYdEZ6M3ZjRzl5clJiTk50czJJbFZuMGl1ZGVta3dGRGtQdHV6alZO?=
 =?utf-8?B?NjI3WWYzVktIdXUxWTJVUzNJOTlESlhZSkNCcGxoNlUwM09qN2hyVGJPZ2Ev?=
 =?utf-8?B?bVZjZ2p4d3BzODcvMFNPS3diSW95NkVvWmkydmpzTkgzeWRha3FYOHhlNGRP?=
 =?utf-8?B?QjNhY1pTUlFmbzBkWmEzQmIwK0h6UEswdnRpaUpEeDF4T2tWSmduN09aUS9s?=
 =?utf-8?B?a000bjVrWnloM3RKQzBjRnBPZzBFTmdwNmwxb2NkR2oxL05LTy81d1ZkTHdX?=
 =?utf-8?Q?S5TGHF9TNt0IGW5U1Xv8Cnc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVVrenNndHB4TVV5R3hURWRDM215U1p5TXZWbVJEd1ppQ0luemo3L2RQR1I5?=
 =?utf-8?B?c2ZXeGlFMDcwRjIrYU03TEZjN3d3Y3VMV0gzN0YwREhQU3pkeEsvRG56TDVP?=
 =?utf-8?B?K0sxb05KUi9UU3piMllETkhWUEsxeGUyOWc1RUpLSFF5WWpYcUJJNk1vdXJx?=
 =?utf-8?B?VWZIYzdHMDZidlFVaG5ZK1lqRE1BTEdBL1VYZld0ZWl3UDYyZmlCclVQaVVT?=
 =?utf-8?B?OThidkVEd0t6alBMSy9OU3J2Rk9YOWdVMS82RXBkalZsVFpnMEJyZlFVdndR?=
 =?utf-8?B?TnFWRzZQZ2tJQVFsM1FqYXhLMW5mWkUrRTVSMGZBV0JodTJsSHNHK0Zuc3dG?=
 =?utf-8?B?dkdoWmY3TWRVdlNVT2N5eTNJMGxWZEh5cDNGQzc1Y1BkcjMzUGE3OEQ4UVBF?=
 =?utf-8?B?Nk5PY044bnJMaURmdE9zdEJvbnVPRjRtWTJibDJPR20rVHRHWGs1aGcxTTRh?=
 =?utf-8?B?RGxEM0dtK3JVSEtEQXI3RzNwYUpFc0Y5bzdpMFdJcGNuR1p0d21TNE8yYnJl?=
 =?utf-8?B?NURhaERXdlVwNkc3QXlyQTdPNHU0bWFLWVlMUUVscTRvK095RDRacnV6Rmxm?=
 =?utf-8?B?RGROYlMwSVplZlhtdGxHaHJjQ09TRE1GMVd5ZCt2S21YaVNIVDIvejN2c21x?=
 =?utf-8?B?YTYzVW5BQUhkN25IYkdDUVpBcEdWcXB3RkVkcjhJMnVyOTRjZVlLYzgzQlhs?=
 =?utf-8?B?dkNlalNFOXI3T1ZZUmpEczJndktkNm1qajgwZGViQktIVWx0WVJ5SDJFeGRH?=
 =?utf-8?B?VlQxUDlYU2poeWRVQUs3QUg3YkRuVG1yWkkweXFzZjhlTHlqOUlVejJmZUJW?=
 =?utf-8?B?NVdOQlBWSFhQbkFwY2RPc1h0QXczUnFHd2ZtV0xWN2JWaTVJdFE0citwelJI?=
 =?utf-8?B?cEdaUTM3c0s0MG1DeHJkOVA0SWZ3R3p6QmpMcGdXQTA1Z3pOUjFkTjlCbUhN?=
 =?utf-8?B?TzBQcjcxaVlmV3g5VmJZUkJUNDVVaTUvdENVWG9qZ1lZYzAydWp5dlNhU2dJ?=
 =?utf-8?B?THI3cVVEVWpOdzNSLzNUM3hsMFg4UEwrVXJ3d1EzcWE3RlU0R3NaRXJqVUpn?=
 =?utf-8?B?RHYyZEw2UkVDWmdBcy9pa25iam41dm1lRk41MXBUZjIxdmVZRGJ2R1BjbXV0?=
 =?utf-8?B?T1ZDVmpBMVVuVmxzMWVFOHdpVXFOcER1eElyZGJSS3BqK1VvTEdKWkhoU3Va?=
 =?utf-8?B?MHA1clp2S2NBaTB5RjFvMThlK3lJR0JHVEl6VXZrcDF0QnI1Q3JMMXdPU0Ux?=
 =?utf-8?B?QSsyRnVpZ3Z3OVFGTjNoanJ4TDdvZGw0ZnJRZSt0bjlZS3ExbXFaWXMwSFBr?=
 =?utf-8?B?ZWlEMDkzZFJrdjVFMlljSGdqcTFUMjBROWxzNmw5MU9EZ2FSWVRSR29ER1FI?=
 =?utf-8?B?ZVpLL0R0cUpyeFEyOUp5eW5COHI2QUhVSi9LOXh1bnVHelc0ZzRkdWl1NDUy?=
 =?utf-8?B?S0N3ZEZJSTBMVzVFTVdLM2d2SG8zMnJpOFhLUk9IR2E1eXo0cUpCbDBJZ253?=
 =?utf-8?B?aEQ2aEs2M0dMUi9SNmtveHkzbWdKYi9qUTJ3K0ZWREEwbktBMWI3dTJwWEJN?=
 =?utf-8?B?TTJCdXBBa3NWdjRPZVdvY0ZHK2Z3am5DYVdOMS95TnZUNlBwTkc3Y0RZL1Za?=
 =?utf-8?B?N3pvYjhydDBHT3RJN2Y5MDhRYms5R0dhNG0yR3YzRXBYWU1LU2hrcUwyUUxu?=
 =?utf-8?B?bzV5eUFteXk3RldsaUdJdVlnV2hMcExRdlNldlIzWHlhdGV6cDcycjc0T05U?=
 =?utf-8?B?elpwajlpNW1ZQ1czR0dhMFdleTk5c2FCeVM0K0M0UVNUN1ZodWNwQVhiMkJi?=
 =?utf-8?B?UVRBOVVYQldLZ3NaOW9TS3ZCQUlEbjVJMmxHTWF3dEJjelVuQXdUcXE1K05Z?=
 =?utf-8?B?MVZKWnplZXZjYkI5dnFwZVJjeVRwU0tvcndqS3paeFVuR0h4NGc5eFJKWFhi?=
 =?utf-8?B?cEU5U3czUUduWlZ2UkJxYnQzMXYzdGtKcVd3aEo5ZVVJazQzdDI1NlFrdkFT?=
 =?utf-8?B?ano2aENKUXhwSnZvN3o0aUkyUEk5alo4dFBYZEVhMnpzeHlsN1ArZzVDb1cz?=
 =?utf-8?B?RytEako4K3pBUWM3dEdJcDhOZHdQSmZVb1RQZlZiUEpid3V6UCsyWTFyaXl3?=
 =?utf-8?B?bWpDVmRrV3lBLzBoQmVBb1puOXhsaVNZK3B5dVJ4UnpKSDhUN1ZIT0FYMXQ2?=
 =?utf-8?B?SWpzYlRYZndSUGc5UTlxcTRwTUtEVXJDcER5bkhYQkJGazBHWlVTY3FKZDVo?=
 =?utf-8?B?cGRkUHgwR1h2K3U4cVhja3AwWWxCazhIZ3FHNkhjZGM2U011OUJDUmhjd1Fn?=
 =?utf-8?Q?ZhA4bfosl8vxWISWqG?=
Content-Type: text/plain; charset="utf-8"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cb8826-04f2-498c-39fa-08de54c69d89
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 06:15:15.6136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZdeLc9Pz/zFEjq+Mg0F0QuHnYQk1pid7jAOUfGocfeAQcI0X6+r1yHuC0uer2beumdTB5/qwvlJBlOl2pUJbjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB7959

SGkgQ3J5b2xpdGlhIFB1a05nYWU6DQoNCj4gPiBBdWRpbyBjb250cm9sIHJlcXVlc3RzIHRoYXQg
c2V0cyBzYW1wbGluZyBmcmVxdWVuY3kgc29tZXRpbWVzIGZhaWwgb24NCj4gPiB0aGlzIGNhcmQu
IEFkZGluZyBkZWxheSBiZXR3ZWVuIGNvbnRyb2wgbWVzc2FnZXMgZWxpbWluYXRlcyB0aGF0IHBy
b2JsZW0uDQo+ID4NCj4gPiB1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9
MmZjNiwgaWRQcm9kdWN0PWYwNmINCj4gPiB1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBzdHJpbmdz
OiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9Mw0KPiA+IHVzYiAxLTE6IFByb2R1Y3Q6
IE1PT05EUk9QIE1vb25yaXZlcjIgVGkNCj4gPiB1c2IgMS0xOiBNYW51ZmFjdHVyZXI6IE1PT05E
Uk9QDQo+ID4gdXNiIDEtMTogU2VyaWFsTnVtYmVyOiBNT09ORFJPUCBNb29ucml2ZXIyIFRpDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxpYW5xaW5Adml2by5jb20+DQo+
ID4gLS0tDQo+ID4gIHNvdW5kL3VzYi9xdWlya3MuYyB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWly
a3MuYyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KPiA+IGluZGV4IGYzODMzMGIwOTVlOS4uMmM1MWI1
OGE1ZjE1IDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3VzYi9xdWlya3MuYw0KPiA+ICsrKyBiL3Nv
dW5kL3VzYi9xdWlya3MuYw0KPiA+IEBAIC0yMzkyLDYgKzIzOTIsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHVzYl9hdWRpb19xdWlya19mbGFnc190YWJsZSBxdWlya19mbGFnc190YWJsZVtdID0g
ew0KPiA+ICAJCSAgIFFVSVJLX0ZMQUdfTUlYRVJfUExBWUJBQ0tfTUlOX01VVEUpLA0KPiA+ICAJ
REVWSUNFX0ZMRygweDJmYzYsIDB4ZjBiNywgLyogaUJhc3NvIERDMDcgUHJvICovDQo+ID4gIAkJ
ICAgUVVJUktfRkxBR19DVExfTVNHX0RFTEFZXzFNKSwNCj4gPiArCURFVklDRV9GTEcoMHgyZmM2
LCAweGYwNmIsIC8qIE1PT05EUk9QIE1vb25yaXZlcjIgVGkgKi8NCj4gPiArCQkgICBRVUlSS19G
TEFHX0NUTF9NU0dfREVMQVkpLA0KPiANCj4gcGxlYXNlIGtlZXAgaXQgc29ydGVkLCBzaG91bGQg
MHhmMDZiIGJlIGFib3ZlIDB4ZjBiNz8NCj4gDQo+IHRoYW5rcw0KDQpPa2F5LCBJJ2xsIGhhbmRs
ZSBpdCBhbmQgc2VuZCB0aGUgbmV3IHBhdGNoLg0KDQo+IA0KPiA+ICAJREVWSUNFX0ZMRygweDMw
YmUsIDB4MDEwMSwgLyogU2NoaWl0IEhlbCAqLw0KPiA+ICAJCSAgIFFVSVJLX0ZMQUdfSUdOT1JF
X0NUTF9FUlJPUiksDQo+ID4gIAlERVZJQ0VfRkxHKDB4MzI1NSwgMHgwMDAwLCAvKiBMdXhtYW4g
RC0xMFggKi8NCj4gDQoNClRoYW5rcw0KTGlhbnFpbg0K
