Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011011.outbound.protection.outlook.com [52.101.129.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CB923F29C;
	Wed, 15 Jan 2025 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736929823; cv=fail; b=LfC+RuiCx+OjPmMBAqQi7douk9MSYENopLEVmh7MfBrBR1Y+v5CytNIMbYHTGANx9kXmO45X2JPo4z2zF6RR4T5ECNU+PPdg6qUjLydumt4GJvmMKMzzsWtsA61MIhEFAk6ifHAif61IN2N4ZzZiS1qLbLpMKQktqJg949pLMsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736929823; c=relaxed/simple;
	bh=ppTMttFDhuBM2yOjX1UELyNZ1bqvBChMvJBh1M0VaXw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AXRjaYTA5ammNdZvjlNyMaZHymiOgmMmu5XdH18LyKoe3comdoWo5HQ3aUSKdShjU9mQRUoRBd5yOyG18Kt1hmPFmzjkrxM3NN6wFhakto0BGFJIVIaK8ZsY8aU9XndnD4yZ9liILIvT7vkTtUngucEEis2PgBvF5eadl9fcqPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=QSiu6Zaf; arc=fail smtp.client-ip=52.101.129.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="QSiu6Zaf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAi4fp4n/P9XTBPm3sK2kyEuou2Iac+VZzJU0QNJg/lt/Dr7z9mrSBS8k8R1f7qAxARmh6ns+iYCheisZ7YeVpovA+9jBPs8xuQW1j1TqA8AEvD0vGFOgYDrh5jkz+QaSqSN1vw1+AocDACOv6kRAxYVJUjMSKwQGQ+sdlWv9b4j70KI7KTO5Uy2OOr07/hHj6vf3ftGhZ7/+PomgLA62RXvUi8Qut6ZzzMPpDrIRjz7Ozw9Dm3FMUS3svQdH8+jAY8VJo/KQMF6a2z1SO66UVGyLjt/g1Fbee9+riEAV9rfOn620I6OCHiyWIe2auU75EaV/aSUbAuQO5kWs3nAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppTMttFDhuBM2yOjX1UELyNZ1bqvBChMvJBh1M0VaXw=;
 b=wxBMiPvIurUA7J1p2isrlvwHxcFW6yNkfYqqHQIUzbhSweB6f3nm1b464sCvq8wfd3hCH+bHES8BfrU9B2QVVt4WmtM00sklOvr/9UtcOOdHQxf9wt/bnBbTMnHOsGs2y90EhQs/TshQ5I5rX8PQ6u7fwyohi5IcUvMOXeOS13jGLruTd3ZfhfZxBzOOoYVIwYUAyDM1vsWYUAkcnxUFNRpvi1qa+U06gqs925/6IammgSAix98iIgTbszDakS/x4aewZjmVkr1MNqz2e/mtuTnXu4prfTbEUTbYO8YwG+4tCmSHEuTok+H5Hb6mTSCh3jRKsCkvSKCs98FPbe7Fng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppTMttFDhuBM2yOjX1UELyNZ1bqvBChMvJBh1M0VaXw=;
 b=QSiu6ZafcYGGrisazk2NjHOxvli9D3HMVR4jjNAYohhBW1S61VAHmNuDa6XXNMvK4SQkocwoqj1UNP5I2KAm6G7lbDdW04ALXrFqQyzW1+PSNB3Q60mtSpoR1iDeTXUClRxM6GkmapuL9GFGbJwscxEXme8lUWeJtrrMr0P4acUldN3C/xHdDwm1K6JMzZLc1QJzbyEVpS3lgE/CaLN6Xlml0KggCSf3J6sIlGgo4ZyALZsxHAbPuRMNtWnWEjU6houtAroIgphy94fVVLFawtxAQTui2uG3AHRE4ppajVlVHdkhBi7FQmRt9ayoPD/vIMeTvzk/szP3VYO0RPotUA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYZPR06MB5073.apcprd06.prod.outlook.com (2603:1096:400:1c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.11; Wed, 15 Jan
 2025 08:30:14 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%7]) with mapi id 15.20.8356.009; Wed, 15 Jan 2025
 08:30:14 +0000
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
 =?gb2312?B?tPC4tDogW1BBVENIXSBBTFNBOiB1c2ItYXVkaW86IEFkZCBkZWxheSBxdWly?=
 =?gb2312?Q?k_for_USB_Audio_Device?=
Thread-Topic: [PATCH] ALSA: usb-audio: Add delay quirk for USB Audio Device
Thread-Index: AdtnFv8z0lRZHPtzSmuJqDN3ZgXhGgADMiKAAACxLIA=
Date: Wed, 15 Jan 2025 08:30:14 +0000
Message-ID:
 <TYUPR06MB6217CFAAB5BFD9308351BD32D2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217F6DFCF671E7B0E001D9ED2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <878qrcld30.wl-tiwai@suse.de>
In-Reply-To: <878qrcld30.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYZPR06MB5073:EE_
x-ms-office365-filtering-correlation-id: 6beca7d1-6be0-41c8-e701-08dd353ed5c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?SjdEaE42MEdiVTlhRUpVSzRub2RaNmxZYWUxSk1YK2lOQm5oVW1hNVFDUWMz?=
 =?gb2312?B?V1UrRnJiL0NBVEY3d1lSOHdqOS9hZWRpNE4zRWYrSnpueE51K0ZOallDazVY?=
 =?gb2312?B?eFVXK2lNbDhURXV5cTRKL0w1cEE1QXAyMEtTVElCUzBaYXk5RGF0T29UMWFZ?=
 =?gb2312?B?S2VuMVdTUnppaE1UcnJjTFd3eGUrSGY5ZGFFeTJKTFpsN2doRzVCMTNCTG1w?=
 =?gb2312?B?MUtTUTJLZVVSREpLQjBkeFNNaElucmQzWGFJRzREN0Q1cEdadTZSQUxSbmVW?=
 =?gb2312?B?QmRsSW1HUEMvQ01RUlFjQ1E2b2Racm9oMUFzZkJoWDg0R21KTlNIMXhwQU9Q?=
 =?gb2312?B?c3hka0JGNXg4R1pBZ3duTEdnSCtZNFhsWFl1dGhKTllpY1FEdVRYaXRVWGhS?=
 =?gb2312?B?OVBpZjRXUkVWT0hJbGhZWEtLZXlvd1NuOEQxMTZqWkVkQmdUVzlsNGVyVCt5?=
 =?gb2312?B?WVM3aU9YeXJvS2RHcng0S3hVWDM0R3YrSE44UEd4SVBRWmVjbzFPU01Dbkg2?=
 =?gb2312?B?Y0RaSnZURm1RRFprUGVJekpsTU5ZMUlWakZVSEVxbW4za1RLQ3V6M1ZRY3Zo?=
 =?gb2312?B?RUhvRGNQclNvWG1pR1h4aXNnSktDekdscFY2cnRYOVE4R3BnUDlYb05BdFBK?=
 =?gb2312?B?ci9rdFZmcVNVYTZRQnFsY3ZSOFZUNndaUTNWTmhxY3ZkTTJ5VUtmenk1dTMy?=
 =?gb2312?B?ZStlUVdBSWRhaVYxZ21pM3prQ1huaGxoRVcwR1RCaHh3VDY2MXo4aDFNNEFj?=
 =?gb2312?B?bWRhUlZRNUJMQnVlb2E5MUlRK0Rsb1lZMnJ0T1JmWk4vTVVZT3hJSm1UZloy?=
 =?gb2312?B?Z3luNEttSjM0clZQbStsVGc2K1lxR1BaUmIzN1pUQUxvelBBeEUxN1pCRDF2?=
 =?gb2312?B?Wk9tUlc2Zmtzajd1eGxnZTBKODhBaEVnQkhGV2d1NFdjMjdBQ3U5bkVwSm1S?=
 =?gb2312?B?Mm93dUVoYmdHcjlWNWRGbng1eXVaczI5bHhYb09EUG1tV09tcnM2c3NWRDdZ?=
 =?gb2312?B?Y3ZuTFMrTWtzbGdjWFhCVDNqbVR0TyttOWdsUEpncm90WCtpMkFKVVVVYksw?=
 =?gb2312?B?MW4wVUlBWFNWTUhYTEs3WGdSNTNMLys5T20yaG9oSFVuSlg1SGtwS3lzYUtU?=
 =?gb2312?B?VzQ5L1MxSmNaSjVFd0dRbkRML0ZQVkpIbG5Ud3g3MWtwdDVaSlRmZE02NFNu?=
 =?gb2312?B?MkdOS1ZzLy9Oc0dIeUhaVHM0N3QyM21vdGppZzY0OHR6SVpDaVdWQnBESFVO?=
 =?gb2312?B?OGQvOUdCYVY5YWtKb2hwa1hjUVUzQlkrRkw1U1ZQUVlMQWdYKzA2aUJielhY?=
 =?gb2312?B?bXJpZVdnVXhHOTFtN1FmYTVNbjQvSjNUbmRvTUV4WG4xSGN3Y214a3BiYnpF?=
 =?gb2312?B?Qkt0T2V5ZU4wY3ZveThIRFEvRTIwRTc1MTQveDVKbkxabENJdDlVem82bTdB?=
 =?gb2312?B?ejdXdHNWYjUxVzhUTDlrQksvQVh4dElFVW43ZXhPZXNGREJOOTlQY00xVlpk?=
 =?gb2312?B?bzJQQXBscDhUZS9pR2NBajN3QWMwbWxHZ3gxb0szMmVNVXh6cUU1Y2dSWGlh?=
 =?gb2312?B?cDRidjQyYVFhSzdoS3pqTE5zWEYxaDh6eUR6OVE1TkU2cE1vUmVzc0htUUxJ?=
 =?gb2312?B?bU0wckZRY2lyNm9JQWdDRkxxVUJMMzkwdE1XS0NpVlpFbVNORHdxWmUvandC?=
 =?gb2312?B?UjhrUEpheUVUY0cwVnZVNm02Sk9lMUNQQ2FkOTdNYnJ4UCtDbjVMNUVGdnNr?=
 =?gb2312?B?WjRBaGdDVldBdE9TZVY2aHZpKzZsMTljQVRiRTVkT3hKNGx0WC9uZjdmeThX?=
 =?gb2312?B?U2FZWDcrWS9UbnQreXNJWGNpcDBtWWhwOGNzRkdiaTZrUG5JZXRkZGN4aGxu?=
 =?gb2312?B?em5kMTl4ME9OcUdqWXZjNlhuOFJBajAyb1FGNElQZENHdk4yQzl3bUR0bXl5?=
 =?gb2312?Q?6S0V5wSi+/zkAuEMVj8N2F/zX47bHjEV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?djUvVlFGcnpLM0VSZkdWZ3kvVTBCbWNqL1ZQMWFicWx0QjN4bzBDRkI4eGh6?=
 =?gb2312?B?N200dUlTS25QbGY1Sis3YjNabnVPM1Y3RmNIc3N3RmxsejZBZkNKbFlNRTZI?=
 =?gb2312?B?SWEwUHZsOWs1TFJXb3l4ZW5IZG1Pd1J3NUQ2TEpPUDQwQUhWejY2ejVlbk9h?=
 =?gb2312?B?ZlkzWHd6RHhmRUVxYVc0Y1psbk5zNENMdk1NZzdZTEpJVGxZT0hKUXhKNlo3?=
 =?gb2312?B?aGdqM2hZZFl6QVd5cEdDYzF0ZUFXQUZ1b1VWZFpUQ0ZlUGFTc2pBS2xyNFMy?=
 =?gb2312?B?TGFXZDBKZDh2azRUUFdsK3NEaGQrV1E5NE9FNnk3ajJ2SmxxM1lJd2lMemR0?=
 =?gb2312?B?L0t5VlU5STN6bGFBZUl1eTluMDRuaUhMcnA4R1JLeDl1WXFsWlhwMy9iUFh2?=
 =?gb2312?B?U1BCVkZHM3BEaWlyWDM3clUyTExqL284UllBZ2ZYUElDQ0VwODlvc2Q4a0pa?=
 =?gb2312?B?UlBpZlpMNlhYcDhFRWlOOFhPeWlqZmJDeGMwK0FsQi9rU1A4NW1MQUR3RnJS?=
 =?gb2312?B?NjRoSXVCMkhZL1RuRXFySlFFWFBzZ0IyNEN6bnlabkRoTEIrUlNSNjR5cnRV?=
 =?gb2312?B?MHpGYnZGMmRTQmNXQ3FCaXRTbFR5akZ4azlQL1JIRy9lODl5SmFramJyNEkr?=
 =?gb2312?B?M0VLaGxCakNLNGhmbm5PdkxSRFpKWTA1SjVyNWd6aVk4VkxSRHZ6eUpka1ZK?=
 =?gb2312?B?NFhYL0d1cGNQZUlFRzEwdFliYWNsOHN4bzUzblNQTGF5b3I5L0Z0eHdvamxm?=
 =?gb2312?B?Y1BzY2J4V1pabm9YdERKd1k1eHZSa3pnYkpwYzgzOXlwMmdIZUMrMklMa1h4?=
 =?gb2312?B?dU85VHhFN1dSaFp6TTNxdjlndTY0YzZSa3h5M0NYNHlZZS92L1BueDJ1WWxU?=
 =?gb2312?B?cjJ3cS8xT3p5K3NKaFRnaENBanV1RUNaRUNoN0gzakJqcE93T0dZQmNGM2d4?=
 =?gb2312?B?dWNKM3JUVTZua081ZUo1MFMvaXRhWEozUmZJaTdaQmlsRGRNUDVaNmNjTEVt?=
 =?gb2312?B?Qm5LNTIwczB2WlJDcVNTcW95dFc2aDFRcHNzYVVHQ2FJUU9ta2QzN0NHeXBr?=
 =?gb2312?B?bVBudUlhNThrSERickg4cVdWQitYQVYwbkZNcnZRVzdSdUthMjZtcFFlNlVM?=
 =?gb2312?B?bE9iR240RytMMktJUnA1aFM2MFpzUDRGczdNOHdGQjdGeE9PSnRCa0NQem9r?=
 =?gb2312?B?QWVqZXBoY01EWW9wdktiRnVub2hEQ1FvVTBYYTRGc3NUZDREeHB5NnZuRTVC?=
 =?gb2312?B?ck42SDIrN2lhbDFPa1R3M2lIcEw4T1djOEp5bWI1Q29HcjIxV2t3L2lnOGVv?=
 =?gb2312?B?Mk9IQ2VqY2h2dWxqa0I2dXhwMndaeU15Mmw1QW5nSWtaTitFOW9PbG1qOUJ4?=
 =?gb2312?B?MUdKTWxjeTd0Rm5EM0w1dmkrcUh5UE9MdFZtRzdMODJQZ3pjMG41cTFEd1pW?=
 =?gb2312?B?NC9YK29qOE1DTzFvMmJxUURZVDh1TVpQRm1YZERjWmFVUCtXcUJHV3J5Mzh3?=
 =?gb2312?B?WnplSUNuZytvQjRGYjBTYjE3WENXcXFRcTFLTFo3SW4xYWdlN2Q4VnlDSGNE?=
 =?gb2312?B?NnNRVk1pZ0J6SkE1OFk5SFZGT2xPejZGVnpLNDlYdlc4VkRyQ0J4Ulc4MmZv?=
 =?gb2312?B?SUo5dmNOUkxydmZabWFuOWwwc1B5N3J5N3JKd1pmVW9kelY3SHNTVUF3REk4?=
 =?gb2312?B?UDN5WFM4cG1lUzRQLytnY1AweU8vM1ZJd1h1K3N4SFkyRGdBZ2ZNRXlqZ3Q0?=
 =?gb2312?B?azY5L3kwRUlyN2VSSTEyalpNdFAyeU96TG45SDF5UTlMSEkzdlZIODd5cTBN?=
 =?gb2312?B?QmZSU2t1aFcxdUxvdDNYT0hZK0F6Znp2RC90dEk0WEZlbm9lWHJYWWgzUHJp?=
 =?gb2312?B?U0NQRWdmQi9MVW04OGhqSjZJVTB4K2ZQY0RpbEtSeTUram1TOTdCTVhEeGRn?=
 =?gb2312?B?ZEk1cWZuMFRPNldEQ3ppUzNmQTF0YzQ5NEJERmNHa2ZkeENuaXBPS3hETGkz?=
 =?gb2312?B?d0ZEcDA2TFpZVC9OM2hIMVBjdkMvTjNwMjZsS0NPa3ZRemREMzR4UTA0bGNo?=
 =?gb2312?B?eGJTL251bE10eEM4c1BUVkM1Y1ZDaFEwbUtRWjI2dXVkTnhrR0ZYUGZRajVO?=
 =?gb2312?Q?xObo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6beca7d1-6be0-41c8-e701-08dd353ed5c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 08:30:14.7128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gdi9I82xEPpIz4DiUDEWYM7f9gyGMxtm1Bj3u7zsNZ8f9XPNAx5vUB101xJy19YdLa2n9JqXwYELDDcUB7Qv2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5073

IEhlbGxvIGxpbnV4IGtlcm5lbCBleHBlcnQ6DQoNCj4gT24gV2VkLCAxNSBKYW4gMjAyNSAwNzo0
NTozMyArMDEwMCwNCj4guvrBrMfaIHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogTGlhbnFpbiBIdSA8
aHVsaWFucWluQHZpdm8uY29tPg0KPiA+DQo+ID4gQXVkaW8gY29udHJvbCByZXF1ZXN0cyB0aGF0
IHNldHMgc2FtcGxpbmcgZnJlcXVlbmN5IHNvbWV0aW1lcyBmYWlsIG9uDQo+ID4gdGhpcyBjYXJk
LiBBZGRpbmcgZGVsYXkgYmV0d2VlbiBjb250cm9sIG1lc3NhZ2VzIGVsaW1pbmF0ZXMgdGhhdCBw
cm9ibGVtLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGlhbnFpbiBIdSA8aHVsaWFucWluQHZp
dm8uY29tPg0KPiANCj4gQ291bGQgeW91IGdpdmUgYSBiaXQgbW9yZSBzcGVjaWZpYyBuYW1lIC8g
bW9kZWwgdG8gYm90aCB0aGUgc3ViamVjdCBhbmQgdGhlDQo+IHF1aXJrIGNvbW1lbnQ/ICBUaGVu
IGl0J2QgYmUgbW9yZSBoZWxwZnVsIGZvciBwZW9wbGUgd2hvIHJlYWQgLyBjaGVjayB0aGUNCj4g
Y2hhbmdlcyBsYXRlci4NCg0KV2UgdXNlZCB0aGlzIHNvdW5kIGNhcmQgdG8gY29ubmVjdCB0byB0
aGUgcGhvbmUsIGFuZCBvbmx5IHNhdyB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uIGluIHRoZSBs
b2csIHdpdGhvdXQgc3BlY2lmaWMgc291bmQgY2FyZCBtb2RlbCBpbmZvcm1hdGlvbjoNCg0KdXNi
IDEtMTogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTBkOGMsIGlkUHJvZHVjdD0wMDE0
LCBiY2REZXZpY2U9IDEuMDANCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0x
LCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0wDQp1c2IgMS0xOiBQcm9kdWN0OiBVU0IgQXVkaW8g
RGV2aWNlDQp1c2IgMS0xOiBNYW51ZmFjdHVyZXI6IEMtTWVkaWEgRWxlY3Ryb25pY3MgSW5jLg0K
dXNiIDEtMTogdXNiX3Byb2JlX2RldmljZQ0KDQpXZSBjdXJyZW50bHkgZG8gbm90IGhhdmUgYW4g
ZWZmZWN0aXZlIHdheSB0byBvYnRhaW4gdGhlIGRldGFpbGVkIG1vZGVsIG9mIHRoaXMgc291bmQg
Y2FyZC4gV2UgYXJlIHZlcnkgc29ycnkuDQoNClRoYW5rcw0K
