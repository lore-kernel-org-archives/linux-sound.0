Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022108.outbound.protection.outlook.com [40.107.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7A11EF094
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675197; cv=fail; b=d1Ndd3s3+w9mtw5aU++bqxnF8YphlIWi6eU7j+OA74cwo5VwS5wLqzQ6UCPRhxK03pJh+mflG1FdG23ZkdiweN0edReB+pCCPVgI0cGf1npXw8rCzGVGNne/aYQCWWsyVX9ZrMqlB1PpG4pbMzFdQ0ySrB5AFa4lvtVuxGRAa4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675197; c=relaxed/simple;
	bh=rYL77bBcqGmhQIXyYfeLaaNSFDSesKeHqzxzCWfyrDI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RD3eAnQw+FbVyIujFrQE9zvLhV/dIZkeFpbbXzh0eeSHzwDpFnOcDwwZQw/5QY0f8qlpBls7uw0vcvwFCfSVAEJmRBeTbsAqOxx108UGIXULou3ryThP/DL8xyVQVxHHge0aH0Qth3XWnKeMQ+pzagKOhK8IE3jWsE8sfiGTsKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AS8BT6WYtuIRQG8WlwqwyqR05UsmfyR1MNLrKsFq34agE4VaV2Me3E5Opdpi/Y98Xk1Te1TQ22TFZjynzNBUE73IjFfr5ISkD1LJZgJ6j8tTTa/zAOBQccLl4szMnCHOSRHKYUzTX8sESY1tgd6rTA5QKQltaDHXS90xszyFcdgEIwhxq0+7cTh3BRfTwLUcnkFnORoPef6Y/KVXbcGnmHsDs5iLyEpguGhClB571awA67cPgzqVdI60UUyxbJ9NYb8lejXnwlit3ZAnWP7Mjp7TifBzAIX6sFRwGBHumtKPOWkYN0hj1tb3/pG6TBv6jCUd/UPwZ27L68/hqjYgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYL77bBcqGmhQIXyYfeLaaNSFDSesKeHqzxzCWfyrDI=;
 b=SsRFUteVDPEvcNMnrN8j4ihidH577V6Yz4N335BYsxeYgtjve3KYwQwuXDuiwJimla3A22w/rsvcAinhVpBOeBVZ3UW3+sT3pni6qhiWWU33lQPWqfNLmBzfeKYleyPi5FikwfEpl172L9bOo42gSIEy22qBhZ8JfVXgxc98yEB42mKzsyFz3wry86Yxna1yyIzYxK6E1PKpi0VvV/bjL9aVDYvgjeyPq1IRmVsRCV5vPQ9pMFjIyU5Fr30ONAwLzwO+Q8ntfmQC4u61A4GyqXWdVm1kztI6KsOJ9lX46g9uKujEAzlEMw26HFaGV7q4ydAYrWtcdNfI4Xr7nkzOPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5)
 by TYPPR06MB8036.apcprd06.prod.outlook.com (2603:1096:405:313::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 10:39:49 +0000
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636]) by SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 10:39:49 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"chris.chiu@canonical.com" <chris.chiu@canonical.com>, "kailang@realtek.com"
	<kailang@realtek.com>, "geans_chen@realsil.com.cn"
	<geans_chen@realsil.com.cn>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH V1 2/4] ALSA: hda: add no_pin_sense_update flag for jack
 detection
Thread-Topic: [PATCH V1 2/4] ALSA: hda: add no_pin_sense_update flag for jack
 detection
Thread-Index: AQHb4L8sO5xzfgCTa0S12FbEOv/9/LQL91cAgAEuGfqAA2ZJEA==
Date: Mon, 23 Jun 2025 10:39:48 +0000
Message-ID:
 <SEYPR06MB627832E929730EFEA1FD7AED8279A@SEYPR06MB6278.apcprd06.prod.outlook.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-3-joakim.zhang@cixtech.com>
 <87cyaywr31.wl-tiwai@suse.de>
 <SEYPR06MB62781BB8AF7B964F54B4C2C5827FA@SEYPR06MB6278.apcprd06.prod.outlook.com>
In-Reply-To:
 <SEYPR06MB62781BB8AF7B964F54B4C2C5827FA@SEYPR06MB6278.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6278:EE_|TYPPR06MB8036:EE_
x-ms-office365-filtering-correlation-id: 7584ae61-12e7-4c79-b1fe-08ddb2424752
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dTY5RFJNTmV1ZUlNL1VRRTF3MnF1aG9YYjBvWGpWZDQrblNwWG9JcVF3V3lK?=
 =?utf-8?B?Yk56UURpS1F3VEZHMWpnNjAyN0NHMy9CWjZtZVduVVBLbjRqYTkwaFVSNXRJ?=
 =?utf-8?B?MUZWMTJCdVhlaW0rem5YR1Y1WDd5WmhuZ1hzYWtwczFwWTFFdHMrWlJQNDhV?=
 =?utf-8?B?NGZwTllYUWRQODlyUEpnQ0NxN2hzU0ZlN0xpalQzbTZUNjNtZ1RmNmRRR1Np?=
 =?utf-8?B?cTF5aFpMOUxTbFA0eDBSS2l4QnF3LzBqU3ZlS1RpT3JMaU5OR2dxd1pwNGh2?=
 =?utf-8?B?dXV4cU9vUHdUZ2lzb1lnTW42eHZWWmlWZWhqdDVOQzF6akp5enpZemhmRUtY?=
 =?utf-8?B?d3B2WGJ5dyt2L2NFNW5JdjkyaFNJanRRZVJhakxCSHdLQ3NIVXJjMGJNTnJL?=
 =?utf-8?B?WDNwSFYwT0FsZVJvOWFDQkFReSt0aTFhUUttK3F2VlF1amlkdXlmWlJRK0Fz?=
 =?utf-8?B?VXRlYnI0THZTOTRSenEwSGM0akF1eDFhNTRLNFcrTW5qUTJYenNwN1pXYXI3?=
 =?utf-8?B?aUFuQ1U4dTYyRTJLSWFpMUtPcUprZjBiTGNOMGZPbG9yTWUzdUhOdmxXVDZC?=
 =?utf-8?B?RWJwKzJ5U3c0dXc3QjFaRHlqY1UwbUdvdTVxUDE3YlpvSWpZbVdtNzRUQ0t3?=
 =?utf-8?B?dThJaVBISEdDSWZ1WEYzNWQ4MCtIVVp2VnNLK0xUVi9SYnU0cWN6ZzZLT2VD?=
 =?utf-8?B?MVBneXh2WGdGU3d5SnIwM0tBc3dNUU8vcGxKTVFBQ2Z5VkMzY2tKNjJXZmE3?=
 =?utf-8?B?ZkJRajFKanN1WmtMWjVtZDh5VzQ1RkJwbmhnckZzMGU1Z04vaVE3bHpaK0Vh?=
 =?utf-8?B?REN2eEdEOENFbE9obFlrNWtvMVZqUHFPNTdSenJVaU9haVZteWY1UEdZZ3dm?=
 =?utf-8?B?WnRoYWN1WThvbTlEeVp6WU9NWHJWZjhJOEdrM3NnRFhyVTh0Vk1EaTRRdlNY?=
 =?utf-8?B?Rjk4U3FpUXVYT0xOS1ZQdWJzbXFhekZMZFNTT3ZsbGFHTXUyeVpieXlWZ1I5?=
 =?utf-8?B?SXVuMDFOYjJCbE14emtQdlVSVWJwRVErd2gzamRPb3Z5bm1qNGcrVkI5TFBK?=
 =?utf-8?B?UUdvYUZzU0szWThrdGVmUktJaVM5dDZpL3kyU2FhdVArRmEyQ3hzTFZRS3Nq?=
 =?utf-8?B?TUxVYjYzMWQvNUZCUk1Qc3hhTnpCVHNBdDZ4clVtZ0I0RzBVV1V4UVRBbEs0?=
 =?utf-8?B?cmg0YTZzMWRVdTZaTDVHZ3A1K0FiMkFaa28zeWRJVzZ0NjNqVmlNakgrV0Vj?=
 =?utf-8?B?TXhkVU4wRjN3bVkrZE80UEJQY2gyU3NDeUdqSEVnRVluLy9PamxseloyZVNw?=
 =?utf-8?B?MFh1MWRDc1BsaWNudWY0REZNaUY4TmpaTVZKa3gyVU5rdGtadmtvWEFWSVZB?=
 =?utf-8?B?TkhKMmdaYStNZVJqUGI3UTF0bVhpdCtNL0IxRVp3Q0J2Uk81RnduVG5kWmRX?=
 =?utf-8?B?em9CY1Y4VjVrVjdlTmJiUzNwYUsvWnlaeXFSQU8vd3hzdnd2V0ZLR2EyUWxj?=
 =?utf-8?B?dTFjc3lNY01EV2JzM0ZWVkNqNFN2MWlOaTJMSFo2WXBqUWhKQldDZ3Zlcnd0?=
 =?utf-8?B?NEc0dVZJNGJjZHhFOW94Qm43bE9sdm9lZTU5SjY3ZHg3b1FISCs4aEt2SkNL?=
 =?utf-8?B?Ulp1cUxKeFU0Yk1ER0k4MzJmM0lDYURCSFRrWnhwSmdnbDZlVlh1L0MyTzdP?=
 =?utf-8?B?NC9UZENBQXAwYXk2L3VRTXcyMmd3cGpZcFdzV2lNUGRJMjQvcUV4SDJ2TVU0?=
 =?utf-8?B?N3UrZ2FLL0htUlNwWlNIaWREck51T0RIQ2VmZWtiRTJpdm5yMzRuWDQ1ZzE5?=
 =?utf-8?B?TWF6dTUwcU9IdHlIS2RqdTVURzgvVno5UFZiVFFJanZVc1dEa0F1S2p0MUpM?=
 =?utf-8?B?SzBnRWV2VlhCWWM4TExMc1Rid2ZpTE5XWVRRVWl3YXM4bGV4UXlyaHpnZEtT?=
 =?utf-8?B?VDlUKzFXVVBHcUoxY2F1TEdTSnpDU2d3WnJoZkUrTTRQTU9HZHNUUFZYNW5u?=
 =?utf-8?B?dnUrQkF2UW5BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6278.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDVuSHRMY3hFNWJTYk1nMzF6cE13MXNML0R2Wm5CSWc4ZlZiMEJLSndNUXJH?=
 =?utf-8?B?K2hIWVhlTzYzdVFRbHplV2lUejNmdlk1QmN3aG8xa0QwWmlTdlpTQlhBSTVY?=
 =?utf-8?B?dmovTEtvdFZONjRIQ1RtRmNDTE1HYVd1WTh0TzloM01KNlFBMjRmUFFmc0Uz?=
 =?utf-8?B?VFF6QzcrdDdOdEtxV3I4TWxEL3VqdHorbzkyZCsrU0QzL3hNVVpEbkpwZVk3?=
 =?utf-8?B?aEcySzRHZnc2QjJMbEFiTldnUWRPRDZEZHFxOHhDdXVWYXBLYkNOcS84cmlD?=
 =?utf-8?B?dHFkcUxmWndsOG1mTXNwUzJmb3FNNExMZDlKeUkzTzA2U1BpVXNiMW5Lb1JQ?=
 =?utf-8?B?UjRXRVZVdGoreUtNaS9jbFNJWkoyMGtMK3NRd2ZDZWhKbFBsUGhUNWx6U1B5?=
 =?utf-8?B?UGR2UFBwaEphQkcrS05tWTVNaXNuNlkrbXU3bmdLeUEwK3l5UVkwcnoybTQz?=
 =?utf-8?B?cm55ZWlVYzhGVWlLQlV3dE8yVG55ME5mb3pFRllrbk10dXpBYjRWRWgybnBi?=
 =?utf-8?B?SUl6SFJuYSszb3p0TkN2Z2ZpZGtKMjI0cjBmbDRTTm5ZL2NIc0JNcXZTL2hx?=
 =?utf-8?B?QmxLM3hwZjBaVjVUUjdXdlFyYnFuUytEc1I5TGdoaXgyUE5aOEpOQzR4cjdl?=
 =?utf-8?B?RXE4ZU9hODNIUXFlc1hvK01EWE1aSFFQTlVqUWFnUTU5dGNyWFFmQWhkNEhk?=
 =?utf-8?B?SUpFd1RrTEc1SFVDN3AzT3gwN2k1ellxZkJCYk9SSHRPY0t5QnUyNWQ0STlD?=
 =?utf-8?B?U1ZraDVFV2x3eExiUkRnMEJPcjgxQTVhdWdsYnpJV0dPMUVlSG9pbVRJNmhv?=
 =?utf-8?B?dUJob0FMeG9QRjdQWmt5MmQvS01Sd1k2ZE56Ti9kUzhiQjhzQThyN3lVOWtS?=
 =?utf-8?B?NnNZVnNyakIvMlg4ZEJ3N2pkUWE0aWtleGtDM25MUWl0TjdwS3Rxb3RlNkYy?=
 =?utf-8?B?anhnS09qY2dreU4za0E4WjhxWmtqcnF5WHpldkxPVzNNaDZDOHhUVDF6L1Uw?=
 =?utf-8?B?VTdVV3JzQmt0VXlmTXltL2VjaTZJYmlqcnZQNys5ajlmL0VqQko2SVpvcUFF?=
 =?utf-8?B?S1hwTHNNVFV5bW5mTEVsQ2c1cGZ4RFRyNFBTeVFNV1RnYno3NE1VYkpyWWd6?=
 =?utf-8?B?TWwxUmhFaU1lejdITGMyeC9wZnJjbUV4bmlNVk5XYmVIaE9uZS9QYm81TDNV?=
 =?utf-8?B?Zm9HTWcybHdEdERPOU9LOVMvM2tQbjJzNzJNb0o5d01ncVJNNnZ6N3FCNnJo?=
 =?utf-8?B?WmVxc21qY1A5YVZ2bWtCcUJSb1A1aDVMRGFlOFEyelFIbmNPM2RVUWpNMjg2?=
 =?utf-8?B?VFc2L21PZk1PYlZZSkgvRkdJK01ybUlMaGNPV2xCNGszUWxLeWtWU3JZc3ZV?=
 =?utf-8?B?aEQyZnZiQzZFdUIrVk5ZenFoV0pWK2Vpcklwdnh1bXpiQ2MxSFBGVis2ZjNl?=
 =?utf-8?B?U290NE8wL0ExUG9pRGhvSlhkR0pnRkFsWU01Y01JajVQb1k4OWgvN1QyTGpT?=
 =?utf-8?B?YktQSmdQQTZUSlF5d2IzTmdOUS9FK3hGR1c5dnhZNG1iL0lIMDlZdE1JRytQ?=
 =?utf-8?B?ajE2VWlneU1rc3dkRkZmQlQ5TVF5MHJtZmpmVmRoRTNkMkpCd0J1QTJhMngv?=
 =?utf-8?B?ZGsyRmRHdDJWUGtXTlFmQkhhb0Z0NnVqaG9uaExnNTJ1S08zeDFzaDdKalRu?=
 =?utf-8?B?YkVEWFNFeXZSR2RZK3hrdENkVjI4SkxSMlRLcVB6Tmh3bDRUTzFYUTdJVldo?=
 =?utf-8?B?YVFlNVl4cEUrcWVLSWxKYnpPYmd0RHNYaUpja25ZdFRIa2w3NEVkcCtUUndU?=
 =?utf-8?B?ZllQRkRvcWJDWnFIbGNaSXJMRk9CTllGbGs5SzRDLzNTbWtoQklrYU8rNjdh?=
 =?utf-8?B?YjMyVVhpQ01GTnJoc056WGFadExlYWd1aVZiR2xpanNZNTI0dUlubFR0cUly?=
 =?utf-8?B?elZNNDUwWVRuVk83QzNTOU13aFN0Mi9MZ2RGNHd0b21PRFMrcnQ1ajVsUnY5?=
 =?utf-8?B?aFBodEJJS0hRZ3UxVjI3NGRUQXF1dUE3bnh1THNBbCtpTDJJMTM2S0Vpb05i?=
 =?utf-8?B?Z21ORGJMcjdQVjdwNU0xZEFSWmVHY2swMVYyQWljb0hTMmc4Z1VvNFFRbGkx?=
 =?utf-8?Q?OJ5KczvrwptbxbKv1QRoywh/m?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7584ae61-12e7-4c79-b1fe-08ddb2424752
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 10:39:49.0273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +hH2ytNUWoRExBAlXrcOxGGI4TGT8YBEKBgJnMtPJD1fMJLvNNpd2SXkKswo7JoJJ1grMc8LDoB0yjiHoqYPG47A8pPmIE4xCmMNBOp0AKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8036

SGVsbG8gVGFrYXNoaSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBK
b2FraW0gWmhhbmcgPGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gU2VudDogU2F0dXJkYXks
IEp1bmUgMjEsIDIwMjUgMjoxNSBQTQ0KPiBUbzogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRl
Pg0KPiBDYzogcGVyZXhAcGVyZXguY3o7IHRpd2FpQHN1c2UuY29tOyBsaW51eC1zb3VuZEB2Z2Vy
Lmtlcm5lbC5vcmc7DQo+IGNocmlzLmNoaXVAY2Fub25pY2FsLmNvbTsga2FpbGFuZ0ByZWFsdGVr
LmNvbTsgZ2VhbnNfY2hlbkByZWFsc2lsLmNvbS5jbjsNCj4gY2l4LWtlcm5lbC11cHN0cmVhbSA8
Y2l4LWtlcm5lbC11cHN0cmVhbUBjaXh0ZWNoLmNvbT4NCj4gU3ViamVjdDog5Zue5aSNOiBbUEFU
Q0ggVjEgMi80XSBBTFNBOiBoZGE6IGFkZCBub19waW5fc2Vuc2VfdXBkYXRlIGZsYWcgZm9yDQo+
IGphY2sgZGV0ZWN0aW9uDQo+IA0KPiANCj4gSGVsbG8gVGFrYXNoaSwNCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiDlj5Hku7bkuro6IFRha2FzaGkgSXdhaSA8
dGl3YWlAc3VzZS5kZT4NCj4g5bey5Y+R6YCBOiAyMDI1IOW5tCA2IOaciCAyMCDml6Ug5pif5pyf
5LqUIDIwOjExDQo+IOaUtuS7tuS6ujogSm9ha2ltICBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRl
Y2guY29tPg0KPiDmioTpgIE6IHBlcmV4QHBlcmV4LmN6IDxwZXJleEBwZXJleC5jej47IHRpd2Fp
QHN1c2UuY29tIDx0aXdhaUBzdXNlLmNvbT47DQo+IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9y
ZyA8bGludXgtc291bmRAdmdlci5rZXJuZWwub3JnPjsNCj4gY2hyaXMuY2hpdUBjYW5vbmljYWwu
Y29tIDxjaHJpcy5jaGl1QGNhbm9uaWNhbC5jb20+OyBrYWlsYW5nQHJlYWx0ZWsuY29tDQo+IDxr
YWlsYW5nQHJlYWx0ZWsuY29tPjsgZ2VhbnNfY2hlbkByZWFsc2lsLmNvbS5jbg0KPiA8Z2VhbnNf
Y2hlbkByZWFsc2lsLmNvbS5jbj47IGNpeC1rZXJuZWwtdXBzdHJlYW0gPGNpeC1rZXJuZWwtDQo+
IHVwc3RyZWFtQGNpeHRlY2guY29tPg0KPiDkuLvpopg6IFJlOiBbUEFUQ0ggVjEgMi80XSBBTFNB
OiBoZGE6IGFkZCBub19waW5fc2Vuc2VfdXBkYXRlIGZsYWcgZm9yIGphY2sNCj4gZGV0ZWN0aW9u
DQoNClsuLi4uLi5dDQoNCj4gW0pvYWtpbV0gTGV0IG1lIHRha2UgcmVhbHRlayBhbGMyNTYgYXMg
YW4gZXhhbXBsZSwNCj4gaGRhX2NhbGxfY29kZWNfcmVzdW1lKCkNCj4gICAgIDEpY29kZWMtPnBh
dGNoX29wcy5yZXN1bWUoY29kZWMpIC8vIGFsYzI2OV9yZXN1bWUoKQ0KPiAgICAgICAgIGNvZGVj
LT5wYXRjaF9vcHMuaW5pdChjb2RlYykgLy8gYWxjX2luaXQoKQ0KPiAgICAgICAgICAgICBzcGVj
LT5pbml0X2hvb2soY29kZWMpIC8vIGFsYzI1Nl9pbml0KCkNCj4gICAgICAgICAgICAgc25kX2hk
YV9qYWNrX2RldGVjdChjb2RlYywgaHBfcGluKQ0KPiAgICAgICAgICAgICAgICAgICAgIC4uLi4N
Cj4gICAgICAgICAgICAgICAgICAgICBzbmRfaGRhX2phY2tfcGluX3NlbnNlKCkNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgamFja19kZXRlY3RfdXBkYXRlKCkNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGphY2stPnBpbl9zZW5zZSA9IHJlYWRfcGluX3NlbnNlKGNvZGVjLCBqYWNr
LT5uaWQsIGphY2stDQo+ID5kZXZfaWQpOyAgLy8gdXBkYXRlIGphY2stPnBpbl9zZW5zZSBoZXJl
LCBidXQgbm90IHJlcG9ydCBqYWNrIHN0YXR1cw0KPiAgICAgMiloZGFfamFja3BvbGxfd29yaygm
Y29kZWMtPmphY2twb2xsX3dvcmsud29yaykNCj4gICAgICAgICAgICAgc25kX2hkYV9qYWNrX3Bv
bGxfYWxsKGNvZGVjKQ0KPiAgICAgICAgICAgICAgICAgIG9sZF9zZW5zZSA9IGdldF9qYWNrX3Bs
dWdfc3RhdGUoamFjay0+cGluX3NlbnNlKTsNCj4gICAgICAgICAgICAgICAgICBqYWNrX2RldGVj
dF91cGRhdGUoY29kZWMsIGphY2spOw0KPiAgICAgICAgICAgICAgICAgIGlmIChjaGFuZ2VzKQ0K
PiAgICAgICAgICAgICAgICAgICAgICAgc25kX2hkYV9qYWNrX3JlcG9ydF9zeW5jKGNvZGVjKTsN
Cj4gDQo+IElmIHRoZSBoZWFkc2V0IGlzIG5vdCBwbHVnaW4gYmVmb3JlIHN5c3RlbSBzdXNwZW5k
aW5nLCBzbyB0aGUgamFjay0+cGluX3NlbnNlDQo+ID0gMHgwLCBwbHVnaW4gdGhlIGhlYWRzZXQg
d2hlbiBzeXN0ZW0gaW4gc3VzcGVuZGVkIHN0YXRlLCBzeXN0ZW0gcmVzdW1lDQo+IGJhY2ssIHRo
ZSBqYWNrLT5waW5fc2Vuc2UgdXBkYXRlIHRvIDB4ODAwMDAwMDAgZnJvbSBjb2RlYw0KPiBwYXRj
aF9vcHMuaW5pdCgpLCB0aGVuIGphY2twb2xsIHdvcmsgZ2V0IHRoZSBvbGRfc2Vuc2UgPSAweDgw
MDAwMDAwIChidXQNCj4gYWN0dWFsbHkgaXQgaXMgbm90IG9sZCBzZW5zZSBiZWZvcmUgc3lzdGVt
IHN1c3BlbmRpbmcpLCBhbmQgdGhlIGN1cnJlbnQgamFjay0NCj4gPnBpbl9zZW5zZSBhbHNvIDB4
ODAwMDAwMDAgd2hlbiBjYWxsaW5nIGphY2tfZGV0ZWN0X3VwZGF0ZSgpLCBhcyBhIHJlc3VsdA0K
PiB0aGVyZSBpcyBubyBjaGFuZ2VzLCBmaW5hbGx5IG5vdCByZXBvcnQgdGhlIGhlYWRzZXQgcGx1
Z2luIGV2ZW50Lg0KPiANCj4gSXMgaXQgbG9naWNhbCB0byByZXBvcnQgamFjayBzdGF0dXMgaW1t
ZWRpYXRlbHkgd2hlbiB1cGRhdGluZyB0aGUgamFjayBwaW4NCj4gc2Vuc2U/IElmIG5vdCwgdGhl
IG9sZCBwaW4gc2Vuc2UgY2FuIHN0aWxsIGJlIHRydXN0ZWQ/DQo+IA0KPiBQbGVhc2UgY29ycmVj
dCBtZSBpZiBhbnl0aGluZyBtaXN1bmRlcnN0YW5kaW5nLCB0aGFua3MsIGFzIGEgaGRhIG5ld2Vy
IG1heQ0KPiBub3QgdW5kZXJzdG9vZCB2ZXJ5IGRlZXBseS4NCg0KSSBjb25maXJtIHRoaXMgaXNz
dWUgZXhpc3QgaW4gdGhlIG9yaWdpbmFsIGxvZ2ljLCBidXQgeW91ciBQb0MgYWxzbyBmaXggdGhp
cyBpc3N1ZSwgSSBxdWl0ZSBhZ3JlZSB3aXRoIHlvdXIgYWJvdmUgcG9pbnQgb2YgdmlldzoNCiJJ
IGJlbGlldmUgd2Ugc2hvdWxkIHNpbXBseSBjYWxsICBzbmRfaGRhX2phY2tfcmVwb3J0X3N5bmMo
KSB1bmNvbmRpdGlvbmFsbHksIHRoZW4gc2NoZWR1bGUgdGhlIGphY2twb2xsIHdvcmssICBhcyBk
b25lIGluIG15IFBvQyBwYXRjaC4iDQoNCldpdGggeW91ciBQb0MgcGF0Y2gsIHRocmVlIGlzc3Vl
cyhwYXRjaCAxLzIvMykgaGF2ZSBiZWVuIHNvbHZlZCBzaW11bHRhbmVvdXNseSwgcGxlYXNlIGZl
ZWwgZnJlZSB0byBhZGQgbXkgdGVzdGVkIHRhZzogDQogICAgICBUZXN0ZWQtYnk6IEpvYWtpbSBa
aGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0KDQpUaGFua3MNCkpvYWtpbQ0K
