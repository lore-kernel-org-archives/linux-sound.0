Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012039.outbound.protection.outlook.com [40.107.75.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738A2284693;
	Mon, 13 Jul 2026 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946158; cv=fail; b=giQiOUvTO3BsTCNF1KJ9bierlDohB1BnqV1gwrZVtvYPM362ZpW1uFvEjA9hOTCfWmD1bQpLAQYnibNHOcCTmloQAWLYjP+s/GO1YtlNqsPtZJuRX5+jfSnNACEUrCGx1Tx724c6X8xeq2gbj4+2DGEqsMkSaxcXwLRAndLZ5ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946158; c=relaxed/simple;
	bh=fYXQpL5qhtoGeGK7Ua3Gb6ZXRsH781FjCf4e01H/ulQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oXspD3RNHgyhmGVvphzZDtlCdL0LGD7H2mqupBR2G/PaJhD6S3Sv8k2cZQHSPzJSrOVUGHBfqIpO/X5kGmTeqIvU/bRs8WRjgXdKd0tXUk7Gi+SVoKH3YSn0vcxR1afRmQAonLk2DJmfplRosPsy8BzjsPugHADF7TH+V4Xn1Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=GqYXV+we; arc=fail smtp.client-ip=40.107.75.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="GqYXV+we"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zG5HKLB1r/pSZ5H9djMXjmwssXqk1ryfkP7P3mXJX59IUenKdrNZQO9naMCX2/HveKv7ViJFQmteHKqL0toA9OOy8TCM8PWmepP5SqJCF+3qwfVrA6YVanf1eKGsQST+bU9HQ3MuTpZV+Zry1vZiowvHkPX0BoxX7CGEeh2zKJYGVg64QGaQg+h7V4HqVcc4H15BzZsxU5uzwcmT3b1zz+xrfu6N/s2TTGqqgMlQXlHkMKoPIjxthk2884GnUbNc7gB3FEpZuAllzLBdV8QkA/BbkaWUl7NodiJnGvO3BNDDG0DoauYbFDGyTUdN77fhgwGaqbero+WHrykt9DQwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYXQpL5qhtoGeGK7Ua3Gb6ZXRsH781FjCf4e01H/ulQ=;
 b=Pqi/48olB+d4mrmuQ6pJ8qebbYr0b0BcKB7xr+USyS5PcwH35HK3H2yzOrRdEE5lLMhlr15mlgWvQ8XblLLuJ5g6gXhfSa5a+xCLWSZ/eUUNVNMPTTKO8ZgqFW12Y2o/rAkOrH8fYNTNzzSBv84D8YHZh0sP7oxePxYWY8eTTKPC7pDkqY5I8qtH7IIpuwIipRsj5zNlw2NCH8XuioD5M4L8U9P3h7T2Ibn35NXSY1D66GjBJS5LZ+WsBEmOZhMbmT0P+DRU00LUvKz0ppJpYQ+uaHDl72WPtCyYG9kgyStfQOtEmMAJNmQVZLPoWpxl6HRmCmQmi3pP8nzsKfOamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYXQpL5qhtoGeGK7Ua3Gb6ZXRsH781FjCf4e01H/ulQ=;
 b=GqYXV+we47Hw6xYece1n87nEU8CIAm/Stoe4wvOD1Tugy9NDYjEphs3rTFCs8JZz9xB/dO8+34i6oREOhd8+qzt10Xn+awP34UTI8AgIyLQdZhwwSJm82XsOW3zelmtOGUlUqnZN5rwd1c22DS/UjvgjVr35pza4ATxU3PkSdzpLYtyHODenQSp7/Z0Oij7GIFbCHSZaXOswJuTPIkcypgfUkWEqcGDCF+zLFwPFUd86xTxzqksEB/0K21Q4lgBRXV+J58ISxgGdyykGBgwsztRc4IisuFZ9IzqZvGI5UEuFEFL3mBWW7Vy7AmeLY6Xrn1c0J0p58a2nZrYc0AP/UA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KL1PR06MB6760.apcprd06.prod.outlook.com (2603:1096:820:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Mon, 13 Jul
 2026 12:35:51 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 12:35:51 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] ALSA: usb-audio: Add delay quirk for iBasso DC-Elite
Thread-Topic: [PATCH] ALSA: usb-audio: Add delay quirk for iBasso DC-Elite
Thread-Index: Ad0SxBViEmMlNUq2SsSyiGFQHYfloA==
Date: Mon, 13 Jul 2026 12:35:50 +0000
Message-ID:
 <TYUPR06MB6217D8FF419F24378196FCEFD2FA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KL1PR06MB6760:EE_
x-ms-office365-filtering-correlation-id: dc36dfe0-ce29-49dd-b976-08dee0db4608
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|23010399003|18002099003|11063799006|38070700021|56012099006;
x-microsoft-antispam-message-info:
 CoZshF2q0bt4DKEbCKfiUM4fxg4yUWsKWcXb1wsWyK7qzGp9xJePjdt8SqFZH31jmcX1S5LDhwZYFGj1vutUmYqzbnjlqc6KY2KTL9qu/+t4AZAdZGAt0yjeSOoQPDjzv6y0MxFyBdO7s01g45Vj0DdkoZQmCnn7b2YXdqDfZGb15bJSiwh7f3qMnvRxGXnBxgGe8OuYNbf3MN5fvTbN9ECJeEPMQW8go3A8W7eeyzDpXVy5XiUPpZKQBKmcCG3KY9Aamx2hePYv0uhryxrrG8U7m+kIVxWaXMtDWPksEDEQdMe7TUHuLU5HgLL116ZMEyuCMQ98ydPbuJkZaOQq1mE+VprUvt2UhSCtG37fxpSU3q21xUpnYBy0DrxpIWhvEtDqJptT5+Vp6z+EnAz2IKCtPmNkaH/Y49qQyi7NeFo7F/6pEy23nwYzX+nqjF4M9vR5n1SBmJms2npIOu6xvKEU/QL6p9EePUbGa5TxmTujQCPkMm/3ux6I0Z1+0z1s2DsaWjaDXGco8A1dCHVRiHiqG4TXPg/IDZToKx8IeatKzrsHgx2AoZSAXB6bvvqci3rUaYvdJ5HbFGk6AUxogIZVlo4PscepAPloqH21rk717LARJjHgvjdd7Vq5aWdkJUI0l1fBu006ey5ZtC59Rr0N3tXXf53BvJx73l7oEaX9ArwIqkXJaAIpb+Ktw1iImMRZqDIcdPmauWmdYP6LNVpB+boreBRWsQ+Kx/q+kzA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(23010399003)(18002099003)(11063799006)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?eWhjalhCbUpVNzNQOGRscDNLUEVCTEtNanJHR2M2VlA1L0ZFWGFnRVZoaytz?=
 =?gb2312?B?dW9PTWpWWDlFVFYyaTQ4Sk80M1JkKzdMbWpTc3B2Qmw0R215Vy83TTREN1dh?=
 =?gb2312?B?Q21ORHlwZDBWMk1iQ21LWmJqamdkQitMWTgxQUNRVW1IUTRZRVp6OWFmVDJL?=
 =?gb2312?B?NXJBVCtmdmxkNk55SnJCTEtVNzhqa0lud2Z2QTFEWWt3TUpqVmRpWDhySzc4?=
 =?gb2312?B?MmdrNG03M01vR0Q0OU85VU5UbExoY0xsVTR0T2hPUFNPWkQwTEpTVlo2WHlh?=
 =?gb2312?B?UTVGOVU5aWVjMm5uN3M5UmJLd2JCV21IbUU1WjFzOFZkaEhCd2JZL3VIVkxZ?=
 =?gb2312?B?ZjE3eU1ENG03Um5NSFZJckt4OERSb0g5WGpINStONzI4U1o0dWFDbStyTkFU?=
 =?gb2312?B?YzdjN3UwQzl3MVZiaVdUOXh0VGJXeUh2b0c0bnFIak1icUJZdjREdk5YQVV3?=
 =?gb2312?B?MlFkVFN4ZkxQRm5aK1Vkay8yUndEOGVuYUg3cm13ZFZFMVRqVHRDMENxWHpR?=
 =?gb2312?B?eFo0K3pwdy8wNnJudEtZTWhCU3l3YWJhRE1oN3kzaGFPUkQwbXppaHR4Vmlv?=
 =?gb2312?B?bTNPeFlIWndSb3FGTW9zRzR0ei9UaHpHMVNxbjRDSmg2ekcxNHg4WnF5T29J?=
 =?gb2312?B?NmpRcnBxRFpneWwzVFR1V05CWjBHdEhKcStPUXZicm1SSnQzSXJtczZSRjhM?=
 =?gb2312?B?ZHBsRmNmSlRKREhyLzIxYkxScjNyS2ZUR2VrZWNlTDJKZzlwREpyTmE2ZDVW?=
 =?gb2312?B?YXRydEtRVmdrRnp3eDRUQVRvcjczL3UyaUkrWTBpRTlXNHBmV2hBdTlRVjc5?=
 =?gb2312?B?NnlGWXVUaGtrejZUb2p0T3lwNjBTalVTemFuZkhOSUVnZmJoOUplM0lVbVlB?=
 =?gb2312?B?QmxpTTlnWllNbi9uaHE3U3VwdzR5NWMyaEZVOE1OWG5mVUpwY1JUT1huOENE?=
 =?gb2312?B?T0YxMWtQbldOQmtPMmVnVzBKZG9EY1F5eHVKSlRBUGJVR2REWU50dmdzL0FU?=
 =?gb2312?B?QzRGbkMyQ3NreVN3eXI3ejV2aW9FWTE2clAxcHJ1ZzdYYmlZSXo2QVpmNFhx?=
 =?gb2312?B?RU9jT1dxRUZ3SU5EbW5GK3pmMDd1RFZyaGxHN3YxNy8vRkZsbDVsbkFlazdz?=
 =?gb2312?B?elJNWU80OTBuRGFmbm94V01BaDVZK2NXRFUxa1dnZVRIQzlFU01XcDVjbTNF?=
 =?gb2312?B?dFovcUJEa0U1ZnNUNEdiY0RROVZVS1JLT1FsR1dGS0ZXR1pLM3VsdHpCYVJr?=
 =?gb2312?B?STdXaEtkZVovMXlLNFBWMUFaQmp3RU9kU0RxdFlhWmRHektnVmJ1MytIVW4w?=
 =?gb2312?B?WFE2MUt1TXNLcVNLRGNKUUhFSS9IR0JuZnVWM3h4UkpyWUYzRkpVQytoU3I2?=
 =?gb2312?B?d0dXQWhNeWtoSGF2UnRlcTZLd0EvMU5Nb2xqelY5azdCMHAwTDJJQnNJQTYr?=
 =?gb2312?B?RlB0RW5mLzcxdUZRQlRGb00yNmdaTFpBbm11dnBsUmRJOHd4NTVlTkVpSnFu?=
 =?gb2312?B?TkgvSXdaSnY1ODZ3Wk5OSjlhb3N4OUhiNUI0SlZjbjgyV1pMMzhJcnZNZDVK?=
 =?gb2312?B?cVNrNUt5ZmFMWlJ3YWxUT2tXdVFnRE5sU1ZzZ0xRRlNqYVdTRjBoQW9tVU9N?=
 =?gb2312?B?Kzc5MURPait4bEM2OHhXQXVCM3VNTU5kck5sT0dCTEhUNm1nc0Z2YWFpelpo?=
 =?gb2312?B?UHM0d1BDRFJFY2ttd0xLaWZwQi9Gbk9JSHorWUtDcVhqOUNvU0N5NmtjNDRt?=
 =?gb2312?B?bzZpdG84Tm9HZDFDeS9UTHozUnlGWml5T3RJQjlYSHp6ZERkS29iejRBSXhk?=
 =?gb2312?B?bVpaMnprYnk0blYvSU9SaEFFWjQrVEQ4T1FtcGF2eXJJc0c0S3IrdGN3dVYy?=
 =?gb2312?B?WjJ6NHVRakJVbjJuSmNCU29kbnJSZVpibnFLelk0T3J1bXZadnlyc1RuVHYw?=
 =?gb2312?B?ZjkwWjQ0bXpYVER2Mll5U3JldHp1SitUbytrSDE4YUhEakNnRDlCSDdDa0tn?=
 =?gb2312?B?clNUa1RSRzJlWTRSMkdjbkJPR3pNc1ZsNy9ERjZBa2lsTHVCNEYvN3lSaTJl?=
 =?gb2312?B?bWU5UGhYbVFodWd2SlJZSkpaWHN4akUrNmZKdUMxWDcrc1JoTkxkdFk5NTZ0?=
 =?gb2312?B?aDl4VEJiaUcrQXVONnh2V1dhR3BrTHlOM2dlYW9EdGR0ZnZDTUJXT1Fnd1g5?=
 =?gb2312?B?ZHlTUll4UmxYeFBJd1pHWHpVTlNWUzB2K2hZTkFmSlVCYm5EU2lvM1NkWGJl?=
 =?gb2312?B?QjRqekVSWlh2T05LQXVNdmdXNDZOZ3FuckwwRFBvcTFYYVlKbXRSZ1VaWFVw?=
 =?gb2312?Q?cRjN8VXXBOR6dk42gP?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dc36dfe0-ce29-49dd-b976-08dee0db4608
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 12:35:51.0433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9BnWLCY/qXH2VmXws2tsAM9QId8gDOSdZgZqTa16WtPjsq7tE1LsW8uhjIcnrgNcZhh8BeIQ0N+fGjyQ/zXtTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6760

QXVkaW8gY29udHJvbCByZXF1ZXN0cyB0aGF0IHNldHMgc2FtcGxpbmcgZnJlcXVlbmN5IHNvbWV0
aW1lcyBmYWlsIG9uDQp0aGlzIGNhcmQuIEFkZGluZyBkZWxheSBiZXR3ZWVuIGNvbnRyb2wgbWVz
c2FnZXMgZWxpbWluYXRlcyB0aGF0IHByb2JsZW0uDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNl
IGZvdW5kLCBpZFZlbmRvcj0yZmM2LCBpZFByb2R1Y3Q9ZjBiNQ0KdXNiIDEtMTogTmV3IFVTQiBk
ZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6
IFByb2R1Y3Q6IGlCYXNzbyBEQy1FbGl0ZQ0KdXNiIDEtMTogTWFudWZhY3R1cmVyOiBpQmFzc28N
CnVzYiAxLTE6IFNlcmlhbE51bWJlcjogQ1RVQTE3MTEzMEINCg0KU2lnbmVkLW9mZi1ieTogTGlh
bnFpbiBIdSA8aHVsaWFucWluQHZpdm8uY29tPg0KLS0tDQogc291bmQvdXNiL3F1aXJrcy5jIHwg
MiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3Nv
dW5kL3VzYi9xdWlya3MuYyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KaW5kZXggMWNiNTg4NjkxZTE2
Li5kMzdlNjg1NjA0YTkgMTAwNjQ0DQotLS0gYS9zb3VuZC91c2IvcXVpcmtzLmMNCisrKyBiL3Nv
dW5kL3VzYi9xdWlya3MuYw0KQEAgLTI0ODMsNiArMjQ4Myw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgdXNiX2F1ZGlvX3F1aXJrX2ZsYWdzX3RhYmxlIHF1aXJrX2ZsYWdzX3RhYmxlW10gPSB7DQog
CQkgICBRVUlSS19GTEFHX01JWEVSX0dFVF9DVVJfQlJPS0VOKSwNCiAJREVWSUNFX0ZMRygweDJm
YzYsIDB4ZjA2YiwgLyogTU9PTkRST1AgTW9vbnJpdmVyMiBUaSAqLw0KIAkJICAgUVVJUktfRkxB
R19DVExfTVNHX0RFTEFZKSwNCisJREVWSUNFX0ZMRygweDJmYzYsIDB4ZjBiNSwgLyogaUJhc3Nv
IERDLUVsaXRlICovDQorCQkgICBRVUlSS19GTEFHX0NUTF9NU0dfREVMQVlfMU0pLA0KIAlERVZJ
Q0VfRkxHKDB4MmZjNiwgMHhmMGI3LCAvKiBpQmFzc28gREMwNyBQcm8gKi8NCiAJCSAgIFFVSVJL
X0ZMQUdfQ1RMX01TR19ERUxBWV8xTSksDQogCURFVklDRV9GTEcoMHgzMGJlLCAweDAxMDEsIC8q
IFNjaGlpdCBIZWwgKi8NCi0tIA0KMi4zOS4wDQoNCg==
