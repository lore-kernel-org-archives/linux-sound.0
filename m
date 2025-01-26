Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010017.outbound.protection.outlook.com [52.101.128.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C2B183CD9;
	Sun, 26 Jan 2025 03:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737863479; cv=fail; b=cB9bvW6jkZOWp9h1oAuhZEaTrgnHLM5UVyGS7xdm4i8oThCqJYi77m9FN9NH/niITCpJsVnKrlsZLZXgCPhtZTFOYQ1Pcehs8FCf3aix0qL8d0R1O49vCyuY2+3GLqadlRyRQVFcvKIXzI0PiKr7kP9FhuhJVpY5AZ9kADDhgKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737863479; c=relaxed/simple;
	bh=t69txdvRR51pg+0fOIQDlgxTs8lkaqe1Wy60Q/mOgsc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=krs9wM7gqYHqEUo5rWRTPcImPz0QM0Z43iG9/dF2lgozmFttx8hARZordk0CR8re0rC3OlTJh/k7SvI/A3juwD/7zPS60i5Jre/hzeBvS59fYe+lUWF33srUTp0dfxU42xl4MyvEle6tJ66gwwBQCyzofIPoXEUKeBU1q/3dWrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=QY0B2LN6; arc=fail smtp.client-ip=52.101.128.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="QY0B2LN6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxCl5OI+R2Oj+nHaYhFn4Yl7t/0XR4ql4mOGsx+5SJcDKMyqS9lVDB//YDnlnZJUxG1PBaPm96nDdDPE2gwzNHZwT9KEXtj+uHg+nNsVbnbYZ9ZKndns7c/l9WfDgyvygK0spxhq4ffKa/mLtzHiNBiiC5KTnGONEWUxFAiRNCnum8phqYNwhIo0TKinNwoslhBkQrvajZdoQU/d6fP5Jz2gydiZvg/YrOiSvLsbCODxfxZypPM6DnAmdeTq1fwQ3RflwspizBFjMPBgsdx+78/lhdL0gX89bT1lJr3YvGMDWwmIp1dnTkuURMEDl8YYRTysg/yrUf8U5DoE3i4mAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t69txdvRR51pg+0fOIQDlgxTs8lkaqe1Wy60Q/mOgsc=;
 b=TQN6npNV3hfUqbS2nZSTxwK1IAknh3Mp1j/lY/Or+BAr5FHO60tuwkLd4wa7Slpe4wbLDDS8BEynGotZ9MVJelGDXRAA6VS/BFtJINE7RC75Cjkqg0u1L9mZYExMCLmKD1zMcbiSB361UjX6uPi3466q1D/HXzTxQFeJT9+/pUHcwupG2inlAjQVN5Bgju6IBPJLsO+YNQ34+7jjOrofAPPYW8cXNjPixBvsJ6CS7R0aytUgqL7OkO/okpV/LAbCNaoXdcMtivUW5ACkmZL2Jkoagk5YBpL16ifnTa2fN6mbVwXz2fAxNLU+j6cygkyKh4hpzQZ0qq6g9B9zfWtNww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t69txdvRR51pg+0fOIQDlgxTs8lkaqe1Wy60Q/mOgsc=;
 b=QY0B2LN6R1gaAyGYD64bQGBQIGMynYQhjlswbu2REwYftaOLORFV9LxumrYJM2zTEWvcEFNkhfl0TWC3MGEs+zC/UiSmbG3TFbiAgyw1nwGrg5x+ORxkNOXaZTPg3YgQbMCW3V+12B+3EQTzPNpy78JGVIFuPJWa/6QwuIVOA2sCzV7UPHBHisNMK0yO84/lODfy2ATChpkBZaLjo60m63Kfgcij5wMeESfKcX3uC/60q6KCx0y8jgNsP7kukGMlIX6EEK+z6Z6dgCI8JLtw0RrSVHQIjqokL55UkNAx/9VmYCEy9iTuyYqOaxVLEseGLMorJuo6lGmeWJfNY2Dk6A==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TY0PR06MB5401.apcprd06.prod.outlook.com (2603:1096:400:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Sun, 26 Jan
 2025 03:51:12 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%7]) with mapi id 15.20.8377.004; Sun, 26 Jan 2025
 03:51:12 +0000
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
Subject: [PATCH] ALSA: usb-audio: Add delay quirk for iBasso DC07 Pro
Thread-Topic: [PATCH] ALSA: usb-audio: Add delay quirk for iBasso DC07 Pro
Thread-Index: AdtvozzemHLIfeu+RJOdXz1Iffg1Hg==
Date: Sun, 26 Jan 2025 03:51:11 +0000
Message-ID:
 <TYUPR06MB62174A48D04E09A37996DF84D2ED2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TY0PR06MB5401:EE_
x-ms-office365-filtering-correlation-id: 1ffd00ef-58f4-44ce-a592-08dd3dbcace1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?Z3dHdGJqZndnU0tZVGtKMkh6eXNmQ1RzR2dQdjZhSGx2OUJoR1A4SVNFQUpz?=
 =?gb2312?B?K255SXBhNHUwTEZocVFqMTd2dDhnaFBEQXAyT1dpQ2l4eEp6MHpyYk1BV3FI?=
 =?gb2312?B?VEE4Q0JHUU90eWlrdXJBRG52WUw0cHhWWGtrWkNtRG1paXNOVHhQSzdMSjcx?=
 =?gb2312?B?TFN4c0k0azd2NlIrejkyUUNMdjNUOEV0bldEYWo5cnMzb1MyZUQvd2VKM1U4?=
 =?gb2312?B?RkZwNjlxS2tTQkhWYUlyYjNGa2FIcTZpMU5rVS9qRnRtSlAzdlYwU21rWUlr?=
 =?gb2312?B?MzBISWgvRy9OVkozUngvOUQyOHRhSzRpZC9VV1JOUVA0YVhIS1pMd2wrdEN0?=
 =?gb2312?B?N1JxZk8yZndwTHJDQmNFdE5YYW40QWV5RHBtandpYU9xeVRJZWhCaEVhNEVt?=
 =?gb2312?B?MHRVKzZaT0d5ZGIzZ1QyZzF3MGFkUHJuejNRV0dhYkFWQnlQSm5MbmpHbWJi?=
 =?gb2312?B?YXYxMTBpcVZGbUNvWFlYS2VFWitBNlNRcU83MStUdFM2dW9rL0d0Z2d5ZXJX?=
 =?gb2312?B?bHQxeW5qSmprNHlCL1dKZ2tDaWpGT2VtTTg3eG0vem9IOW5vWGZTeUYyQjdv?=
 =?gb2312?B?cVBPWWJaNDU1cHpBTytUanZTV2RaQWp3SjZ1R2Q0ZHNrTnRncDNJVitqb3kx?=
 =?gb2312?B?WnMybFVVU0lac2VlTmxmeXpnZ21sQ1EvMEZ4TUVta3ZYNGNZMFNVdmM1dzY1?=
 =?gb2312?B?MGRxWWVxOG00NzJxWW1SL09uYTdOdWp5YlE4VDg2QXpkQmVoWDMvNlNsUzhR?=
 =?gb2312?B?Q01Nb2V6KzVENm9uM2tqT1o4djRNS29ZYStpc08yaldmVTV3Y0lLakZKZWxs?=
 =?gb2312?B?SXkrQktTdEJoYmNvT2xDS1UzVlJUb0FQUm51dUFsSFhiY1ZadzBtMnFuQmN2?=
 =?gb2312?B?SDhqSThUTkxSY0VyQWlwMnNZQTlPUk0zMEJpRW9SUFZDeW5JbXBDYXU1cmNq?=
 =?gb2312?B?alBUbnRSM3JsWGlIOHVNckIrZjNJNkVFZW9qUVpXTS91L2FZVVBiWU04TFhZ?=
 =?gb2312?B?WGM3M3hrQ2xTQ0tIdjh0RHdlOFRQMnRVbnZ5b1VhZm0yRkY4QlMvTnk5QmU1?=
 =?gb2312?B?TWl6L28yaFJ0c0lEeWsrWllUQWVDRWZpK3pFczZzUjFhbC9XVUl4dmN6S25p?=
 =?gb2312?B?a3FnVG1YaDUwVmZhN2NRcG85MkVTVWdrcjZrVUJyWmlsWjBEUkR3WWNmM1Vy?=
 =?gb2312?B?MUtLQjM4cUVvTkF5Ym91T3Q5Yy96ZWpMaUJ4NmFyUjlYelhZSFFRcXFZcVlI?=
 =?gb2312?B?MWtLWlNmLytqZ2ZqU09UWVRqQ2lrRkNvNkxQelhFNGF3aHBkNjRxeExMb0RD?=
 =?gb2312?B?YjVESUtrOUR2cVdjZENKNTlRTWxVM2EvbS9SUEhsN2VaWUhkTVY3SDFhVVpI?=
 =?gb2312?B?ZldPd3RyWFo3enhHQ0J0MWg1eTFlbnBLL2dqeW5Od3VqemsrWlJVY0c5a0o2?=
 =?gb2312?B?OVdqbEU5Zko3eHdnY2JaN1d0UktrNVJ0L05EWXlOckxvWEtnbTU1SGp2ZmFt?=
 =?gb2312?B?Sm1NT2hRdm1nU0JSOHJsTDlIelJSbHJ2aG92ZHA3TitjWXlhYUk3U0Z1N2Jj?=
 =?gb2312?B?b1kzTjh2ODE3cG1NS3p0cndMRU5QdW5WbVI0NFN0b1ZiWGNNY1dSWHBzMktj?=
 =?gb2312?B?dFV1amRFWFJGUzUyWURZeUlNVWlGNkdBYmttbjdiS1hMaUNmTThIMGN1SkZP?=
 =?gb2312?B?aGtxejVlTFpSeFlKd21iUzBibGV0RlNmT0RjMmdTODJacWM4MUkvMFVIeDh3?=
 =?gb2312?B?VnBidXVVcVhmSC9kcjZPRENMUGcrbzh0blU4cW9LVEdJaTN1MW5MZUxyQTcx?=
 =?gb2312?B?aUlieXVibWhnUE5oUGRMcG9zb3ZHMHhHazBzRERDNXdjdGtWQy9zMTNyV3Jm?=
 =?gb2312?B?UHc0eDdYUDdBQnl2a1NyaGFpUSsxeklkd2Z4OFdKSkZDaDBwQ3pkYkVjTnc2?=
 =?gb2312?Q?ujd4rqA6H8JaUiX1VDXDO/NHtCWyVoEq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?N01iWHlFMFdFei9mU0VlUkdWR0JSbFVzT3F0S0Y1YjRIM2ovQ1RFMjNtUzN2?=
 =?gb2312?B?a2dMTzBIeGpFcGZLWk1nRThsZEpsbTJmOVlhTjZMM1FyR1BDWGo2SzlRK1JK?=
 =?gb2312?B?SEtQWUJvNzR1ZGNXY0tXbm9VWEJGN3FVRC9FanlsZC91Mlk3ZCtUYTArdmNV?=
 =?gb2312?B?aC85bzd2NFg4UjJtWjV4bGcxR1JvNFFNQjluRTlWTXRpMmk0bG1UT2pNZEx1?=
 =?gb2312?B?UEFDS0hoNHF3TGsxL0FJMWFuMExTNkw5alg4akVYY1hnd1ZMVlJCYWlhTXpL?=
 =?gb2312?B?NGhSTGYzaVIwMHN1S2dHb29ob0ZQcytDMTdFN0c2cFRDSEJ3RlkrU0FQWlFu?=
 =?gb2312?B?REI2eVBvVTRiaDM4Rm5WRDhxVVVCbzVzK2ZuZUJyMTFWTitwcEVPbWo2SnZJ?=
 =?gb2312?B?L2VTVkNxcWgwamwvenVyZUk2dVZMdHplRmxhZTdoQ1ZldzBkQ3FIc1g4NFht?=
 =?gb2312?B?UUNMOElwc3lvTUZBaVBZeXZLaXhGclRuVmZhbGdjd1VnZWhnNkVJVnp5OEdR?=
 =?gb2312?B?RjQzL1dBelNvSDFXZ2NZMFluYkd5UG1DWU5kalByZ1IxVWdESDVxUE1tcyts?=
 =?gb2312?B?bXllWm16NmVoR3BUR0NVakN6RUVlT21ZdWVrQktTbmlpS08yL1JKY1ZLem1v?=
 =?gb2312?B?UVhEVzN3bDI5bjdmUjJyeEVMTXNPQUhwaXc1WFd1TlQyRGUwNW5RUlg2ZWZY?=
 =?gb2312?B?dGdORU1yM1ZJVkczaXdUTFJOWDJFVjJjYytUdkdpWTc2UlBqRzRhRkt1VHdD?=
 =?gb2312?B?TkNqWUJMb2tjL2FaOG1aeUIyYjNXajI1Qk1UUXlCSzR4Sk5wN09YWmhRcVZ1?=
 =?gb2312?B?ZEl1N1pteDhjc3JiVVBkaENqVkR5ZlJjMk91UGxkRElkdHJoY3p4Ti9BNmhh?=
 =?gb2312?B?aTlSM0NHOGxhOG02MFo0WWRYOG9UV1d2QTNmOWprTVNTUHNvU2s2cEEzcUtx?=
 =?gb2312?B?b1JheXN6bGt4Y1dRS2RscUo2NWdYMnNrOEZQU0M4WFlhbXVWdlZ6RXJzOVNk?=
 =?gb2312?B?TTJqZmNlRGRmeEtVdGxKTklhMXYyWnVLR3M2cEExWEFyL0txL3hzL1MxQWpj?=
 =?gb2312?B?V3FGL3ExWFB5ekt4a1h0ekcxVTYrblBnaVUzSWtOdGxLVFFEdWlZcWNGZlpY?=
 =?gb2312?B?dm5Ka3RCcVl4YUtGdHkvM1NvaUtkbHJORGhPVDN3S3N4cGZQaHNzVWpOVUhv?=
 =?gb2312?B?QU43b1FvdnRjZUtoak9mY2tHbzIyaDRnNTdHMlRBeWxDZHpVbGx5ZGw2SGdn?=
 =?gb2312?B?WmdiT3F0OUVGeVpXeXBMYXY4LzlwN0FQZ0xSSHlXK05aMEh0NnExRG5raTJL?=
 =?gb2312?B?OHhnT3JSa3JPRFhMWkpDemYxa2hKcFpFTW9hc21tekxDUlNaemt1WWFXV21x?=
 =?gb2312?B?NEVGQjg0YWxWWE0yaGpWcDlXcFMyN2Y0TWptdmJoa1YwWS9YSFY3eWtiZDNI?=
 =?gb2312?B?cG1WODR6N296ZUxldVB2VWpIMU80a212WVhzMFFmVkRHVGhIb2wwRGl4dzhY?=
 =?gb2312?B?UDB5bGFyNUgwZm95N2VSYXk5Uy9pUEZaWWxjMWhVWndqckNjbzlPWlhpbDRl?=
 =?gb2312?B?VWhoU20xb1Iybm9nVS9HNjdlVWw4U0VCTngrZjFDQmNUWkc2UG9ITnVUUE9u?=
 =?gb2312?B?K0laRTRraXRMNFd5TVdJa29XZms2R2FWNXArWUkrOERSNjhhUU12Z3pqSUlT?=
 =?gb2312?B?bCsyYWpBT2NPTDE3TDdjVWtDMVdzL3ErREFRR1NVUUJpZlMwdHdxMjdGYjZj?=
 =?gb2312?B?bzMvOU8rcFEvQnZjK2VSbllKcDBhUUVCNmFlWXFRRGtONS9IYjQ5VjhpdTBP?=
 =?gb2312?B?ay9xOGk5bGJaNmoxTTUwN3dEamhGQmZ1NFZ5Y1RUSmVNaDZqeE0wcmlpUVBa?=
 =?gb2312?B?SzYxVVBaWmwvTXhqRjJ2YzFrWTM4OEJmcW9CbzRuQkdDYnhxaW5HRmQzM1J0?=
 =?gb2312?B?YnkwbUM1L2R4ZHRIVCtUcmwwcjVOd1l6UXhiUE5xdUdCOFo4MkExZlVheGJZ?=
 =?gb2312?B?ZENXZXRGRnhrMHZoVHhaTXNMWmNSWU9JTm1JRkl1NC9LL283b1VDcDRaWTZ1?=
 =?gb2312?B?NUZWazAwVmlFYUlsWkZXVkZmeWpVQ25pdDAvcGJ4QTVCRHdGVS83Q3dkSmsy?=
 =?gb2312?Q?2QDw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffd00ef-58f4-44ce-a592-08dd3dbcace1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2025 03:51:11.9939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gTjboNfkehme9y7sxQWe9ON8Lf7zgShokwZ1hxsvWj2MITtssYx/cYbicF23v0baef2XXNeY+si2nxB8FTfsfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5401

RnJvbTogTGlhbnFpbiBIdSA8aHVsaWFucWluQHZpdm8uY29tPg0KDQpBdWRpbyBjb250cm9sIHJl
cXVlc3RzIHRoYXQgc2V0cyBzYW1wbGluZyBmcmVxdWVuY3kgc29tZXRpbWVzIGZhaWwgb24NCnRo
aXMgY2FyZC4gQWRkaW5nIGRlbGF5IGJldHdlZW4gY29udHJvbCBtZXNzYWdlcyBlbGltaW5hdGVz
IHRoYXQgcHJvYmxlbS4NCg0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9y
PTJmYzYsIGlkUHJvZHVjdD1mMGI3DQp1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBN
ZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9Mw0KdXNiIDEtMTogUHJvZHVjdDogaUJhc3Nv
IERDMDcgUHJvDQp1c2IgMS0xOiBNYW51ZmFjdHVyZXI6IGlCYXNzbw0KdXNiIDEtMTogU2VyaWFs
TnVtYmVyOiBDVFVBMTcxMTMwQg0KDQpTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxpYW5x
aW5Adml2by5jb20+DQotLS0NCiBzb3VuZC91c2IvcXVpcmtzLmMgfCAyICsrDQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvc291bmQvdXNiL3F1aXJrcy5j
IGIvc291bmQvdXNiL3F1aXJrcy5jDQppbmRleCA3OTY4ZDZhMmY1OTIuLmE5N2VmYjdiMTMxZSAx
MDA2NDQNCi0tLSBhL3NvdW5kL3VzYi9xdWlya3MuYw0KKysrIGIvc291bmQvdXNiL3F1aXJrcy5j
DQpAQCAtMjM0Myw2ICsyMzQzLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2JfYXVkaW9fcXVp
cmtfZmxhZ3NfdGFibGUgcXVpcmtfZmxhZ3NfdGFibGVbXSA9IHsNCiAJCSAgIFFVSVJLX0ZMQUdf
Q1RMX01TR19ERUxBWV8xTSksDQogCURFVklDRV9GTEcoMHgyZDk1LCAweDgwMjEsIC8qIFZJVk8g
VVNCLUMtWEU3MTAgSEVBRFNFVCAqLw0KIAkJICAgUVVJUktfRkxBR19DVExfTVNHX0RFTEFZXzFN
KSwNCisJREVWSUNFX0ZMRygweDJmYzYsIDB4ZjBiNywgLyogaUJhc3NvIERDMDcgUHJvICovDQor
CQkgICBRVUlSS19GTEFHX0NUTF9NU0dfREVMQVlfMU0pLA0KIAlERVZJQ0VfRkxHKDB4MzBiZSwg
MHgwMTAxLCAvKiBTY2hpaXQgSGVsICovDQogCQkgICBRVUlSS19GTEFHX0lHTk9SRV9DVExfRVJS
T1IpLA0KIAlERVZJQ0VfRkxHKDB4NDEzYywgMHhhNTA2LCAvKiBEZWxsIEFFNTE1IHNvdW5kIGJh
ciAqLw0KLS0gDQoyLjM5LjANCg0K
