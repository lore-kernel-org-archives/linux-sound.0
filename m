Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794759204;
	b=i3hvdToi0MTo19tvKQgtByFa4HQeZ+CnLxKqvQ9ixhNnkGFiUmGm/xUlFPxv5xYoRR2r
	 A/a/UaZuBcEBYK3uC3y9gFQd+15gfRtiM0d44DzSq1g5uktb++oSc57fdprvd1Scx8JMm
	 BoVL5l5dtPdksLVSswgY91XgiM2bzKzfJZuXGk9XmHiSyakeucoeoGhckphDzzISQXNrl
	 G72OSIYeQjpv/uGwsVDAUlslvkDRx0+iSzSNwby3zufMebdPBukAjkitDiCEEM13kj7zd
	 yFMJnTo3lAcRB6AOqVII3yzC6GHkfNcV7PRVemEoUoQaJBcQ98QNqs4mz4f6XRf/1Aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794759204;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Cc:Subject:To:References:From:Content-Language:In-Reply-To:
	 Content-Type:X-ClientProxiedBy:X-Microsoft-Original-Message-ID:
	 MIME-Version:X-MS-Exchange-MessageSentRepresentingType:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qvnEwU086ccEinAKc3mx6N8/6+sFaSOL5H7scHWPc3E=;
	b=yK8ums6p6UuKNXdMyKIv4zbBHutBj4K4yXKMbiynsg/ahaqiFJvlTO2D0Rfe9Fy3Qv3j
	 s5l1b+LUf0/AmO1ZEQncenFtURkmx03UnRdX1c0LPScNgTlfQsLdHqMhOkmd5mk1DaSK/
	 aDLukXpqNsvY9+EgtBAwyg1VpAdS6tYKtzczdPHXVjxPXGjFKT5hyQPiyiIBJZue6XD0i
	 UYL1AllRLOR/t2rXdnH3u7FFGacTyyLadHJOno6uhkrXgDRhb+EZFfovlrl9EI/51nTUR
	 /n9k18VDnyafLdZ97KCdlaRaGmPetELOluwqlsy9GQCpOFzZNZcGC16aBreFLGtYBRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=G7L8BLd5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.6
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010006.outbound.protection.outlook.com [52.103.66.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350C1606A31A
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 16:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=G7L8BLd5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+QG4C+p5EUmsRdQ21esa5JHYeGgf+Iu4w/bITq24eL1wFe5H/YKEo7Zd7UGwOrj3dUb3X73kDWwQLrbKgUaZ0bCZWWL/7OCR0Ym82vANIkKQTcRvYpbBRB61AajhtT/fj3N1HpBah2q/EDpVtoKJoUzbT/E7k7ZlGFsHaXCf7l1MbWeIGQpfX1IwNKcmumNwcCzSWz2KuCH87M523I+B8nBKzKtSES3Hy6vxyiAEJM+j849SmrJ0/+ktyyZkIn8jlRApC5TveIKdBnH36rnWwvg/YF9vWDdHP2x5Cv4Rn3mB/4/PfpShyNOGGymGLJhMuRx4CshKl/fz2M/lv9kAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvnEwU086ccEinAKc3mx6N8/6+sFaSOL5H7scHWPc3E=;
 b=pRMGE2PCXc/BwTROxLYDU2zp/33bI+wcMJnoPf47MLjHymGl+CQonBzTyM489eDY903LgCX+/Aat9d2RRAeYt94uTpCjsf7mr8JHd0Vc6hUXhISbenj9r2wE3eYr+epe3zAfWfi7u2Q5aZCVzS5xTD/KKqzTQgC5H8PA64Ik4kkkhfEUsDCi8Vi1sg+aQf3bKft8VgPfP5WushsaXlfvIQTmt1kkrhFpCzgzLfp2b/nwnpgptHKm8Ee67Dw/hNqcp5VUagbJ9Hvb0UycidbDHkTHfLhR/O/qpXtJA+rlDmNnczh0lquqUnlQ4d28WUjKvC1LmMPMsidUHA7xFdLL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvnEwU086ccEinAKc3mx6N8/6+sFaSOL5H7scHWPc3E=;
 b=G7L8BLd52zuuf0FrjtgXxf27Zlbv+QZaiAjRKCv4p8esUzMhn88ck4jw7xdmPk0GG7JyCL+NRG2rm1uRj/puviPEpZ0A4jTLkEM93TK5NVgoY0VrqGXid8/KwXxHzCLBH0Gv683zuqLl1qvxuBkR9XdIYWENyUwlonSi/N8LTtvXXQiXYOaWwBJAJv5sjc4vXwUJcZZn+4MXAXMxIBvTbhjQT1YjhIo6kII77S0CskzVbYRUoKIqbmZNG492ETNbCSwyaFeXG5f4rQvpVGleCANiKhp+FlDXhe9BZzpRN0son+al1c86vtqqNBCJh9S5n5B7bZp6Lfb3vrok/eJHGA==
Received: from TYVPR01MB10892.jpnprd01.prod.outlook.com
 (2603:1096:400:29a::13) by OS7PR01MB16952.jpnprd01.prod.outlook.com
 (2603:1096:604:420::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sun, 15 Nov
 2026 16:13:20 +0000
Received: from TYVPR01MB10892.jpnprd01.prod.outlook.com
 ([fe80::911f:7aa6:717e:cac3]) by TYVPR01MB10892.jpnprd01.prod.outlook.com
 ([fe80::911f:7aa6:717e:cac3%5]) with mapi id 15.21.0615.013; Sun, 15 Nov 2026
 16:13:20 +0000
Message-ID:
 <TYVPR01MB1089232416E425C62CA7C0439987D2@TYVPR01MB10892.jpnprd01.prod.outlook.com>
Date: Mon, 16 Nov 2026 00:12:50 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, Frank Slotta <frank.slotta@posteo.de>
Subject: Re: [PATCH] ALSA: usb-audio: Add always_set_rate quirk for Yamaha
 MODX M
To: "Geoffrey D. Bennett" <g@b4.vu>, Takashi Iwai <tiwai@suse.de>
References: <avnJGI3L/sf7KQCi@m.b4.vu>
From: Shengyu Qu <wiagn233@outlook.com>
Content-Language: en-US
In-Reply-To: <avnJGI3L/sf7KQCi@m.b4.vu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------weQ7a5Gofn7yKFD0ylDqKJct"
X-ClientProxiedBy: SL2P216CA0211.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::19) To TYVPR01MB10892.jpnprd01.prod.outlook.com
 (2603:1096:400:29a::13)
X-Microsoft-Original-Message-ID:
 <87e4e47c-b82f-425e-b5b0-d425342d8afd@outlook.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYVPR01MB10892:EE_|OS7PR01MB16952:EE_
X-MS-Office365-Filtering-Correlation-Id: 75738cc9-56e1-4017-5919-08df43335d74
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|12121999013|8060799015|4140399003|19110799012|15080799012|23021999003|24021099003|5072599009|25010399006|10035399007|52005399003|40105399003|440099028|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUVxeEgvR202MUFadFhaOXhZYjdwQnI1TXpwVzRrVUc2eEVRNTdRc3dCc3No?=
 =?utf-8?B?UzR1MjIwbTZ5TjJMOTRUbEFNdzIzSmE3YWxzek5zZVRhSlFCYTBlcU5FT212?=
 =?utf-8?B?b2VDUi9UN1dCaDBXMzlaUUZXcXB3V2VpdkU1a0dudmpGUFN2eFBObFlSUGw0?=
 =?utf-8?B?bjNnK0cwOS9zY2F2QnNmSzEwaWUvZlg5VThkQUFnblRoS0R2S0F3REFjVGg5?=
 =?utf-8?B?YW9oK1FWaVBHWlJjcHc1dFpjdXU1eHBDZTl3QzNlbFNZWXJjM1hMWU9OdytS?=
 =?utf-8?B?WTJzYkVjL1VvZkJ3NHJhMWJmLzE0anRkOENmNUduazVyZHcxU05SNE9QV25U?=
 =?utf-8?B?Z3ByRGhFcG5uYzJUcWxLZVZJcW5iM1FyRkVXSVIzbTBNOTNHMjF5MDBwS1g1?=
 =?utf-8?B?dXlNWVc3d2dPS29tTUVGQnhkYWx2U2p6V3dwQ1dNNnF2VTdqdjBpYXIyOWlQ?=
 =?utf-8?B?dG8vZ1hVbnFEYWNHYWtZNitxOC9VeG5wb3MvcnR5QVBtZ1crYzBsczI4MG5z?=
 =?utf-8?B?enA1c3lsbnFhdmZRK0hFcWVoRmRqdTJuRndVeWpSc1VkajdRREFhWWJITVgv?=
 =?utf-8?B?QXI3VTRFcHRTUE0rOWdJWG5DYzZaVG14cEVsblFXVHBHYW15b05FL2xNVFh2?=
 =?utf-8?B?THBQUTlQZ0ZNdS9qN0tBOXlmcUxWbVpGbHEyNksyc1VrVHJWSG5EVFBLNHNi?=
 =?utf-8?B?QkNqK1RBQm1iQ2d0NWl5SERFam1vT3VFS0NrZy9YNTdMTEVlaTJWeXhaMklp?=
 =?utf-8?B?eTdyZUpJa3lPVVp3dzN4MTc1MWxrcWdGVnFMeDRmYVlibGtrS0lJSEluamFq?=
 =?utf-8?B?dnRUY2dBYVpnQVI4TmpuZzRpSHBnZk5zbno1RWFQT296M2U0WWtwdXJnbTlC?=
 =?utf-8?B?bmdLNGFvZ2VNOFllTnlHNHVxQTRxVlRFOEhMUExHVkpYT1lrZWpjV0dFUVNK?=
 =?utf-8?B?YU5kdnhVbWZBUy9iNlAyZXVMU25ZUjl6eHkwbDIzNlZDVG1YR3VmWjhiWnp6?=
 =?utf-8?B?eVdQMlROditIL0pYNXppL2IvbnpEUm16Q05GMFU0VVkrVTJwM0p2Z0pYSHR5?=
 =?utf-8?B?dit5bkxSSlVqYTBjSUlmcGVLcHpqL2dNbzJ2ZkJ6Q3FwNkRSaGNvOENmZ2pG?=
 =?utf-8?B?eFY0dGpraVZuSnNQTk1zUHZzNWk2c1lhNnVhMkQ5M0pQUGg3ZTVtZURDTXR0?=
 =?utf-8?B?L0JOMjZaM2MzczFHaFVpUkdaUFhGS0JrUlFLNEJRdFFCd1pIdU93TFRmVVZj?=
 =?utf-8?B?RkFZdDZUSFI1bEJQcmZBeG5lclhrU1BVL1BMaFR2V2h3eWVYMjBybW54bWt1?=
 =?utf-8?Q?aN2BfOBXBfzmQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTkxT3dCSEdNay8rclkwZFpoRHdWOUMrQWZLSm92bWJTQ0paRVR2WXRZcjly?=
 =?utf-8?B?K0F4Z2Z6dUNtMEdFTFQ2YkwyWERGSmwyOVY4dTRlTm9BNzZ1b2lsZnVDWUZm?=
 =?utf-8?B?UWZTSllUbVlFL1ROZ0IzOSt0Nk44Zm9aTlZmK2NET0NwaWlwZEFpTGh5SFBT?=
 =?utf-8?B?REdSZDdxRlVDYjZZZVZYT2ZDYWhYeTcvTU5LTXByRVNzcFltelBjSEtzY3Zn?=
 =?utf-8?B?UTJHeU1mQkxKM0s4aVVyckROTTAxT2JwNVZzWmNxVU94VzVWS2taV2Z4cFUy?=
 =?utf-8?B?YlA5UGtjTlJFd1FTdDhPVFQxZFBLamtMWEk0WHVOUXBOMlo4cXZqSjQ4Smtx?=
 =?utf-8?B?MjhVNXFRYTgxMnQyVE1hRTUvam1tMVk3YUMyb1Z3U1VTTHViVnRqalhuOHNR?=
 =?utf-8?B?VFBTNVFIVk9UL0JNRFRDd004aytldTA4eDdtTW5pa2xhdUY0T01xR3NlOC91?=
 =?utf-8?B?dmttV3NTMlpmbTRmWWplRUt5ZGZRUUc3cFc4MFAzM1gveVNNeWJQM0ZWMXZk?=
 =?utf-8?B?c3B3ZlYxdVhoclIvZExjeXlLb3R6ZXQ0V3J4dmhSNnNjOHdtRW9RM1FZSWda?=
 =?utf-8?B?dzJMaTBpMTB0aUlCRGZGQXFqbHlpRUtVSXhsRWJRUlUxVGNhWUtkdWlaQys2?=
 =?utf-8?B?eHo4Vlp4djVNd0VhaW04S25SY2JKZU41VjZiU1hFMWlSbFF1OGZSWmc0SkJH?=
 =?utf-8?B?TlVNblNFRGVtMEZqVlI2ck1YODE4K29VUXBNMmhna2FvN053YVVCNzROUGwr?=
 =?utf-8?B?cUNiWjlNdDJMQk0xNnBRVGJCVE0zeUlubExZaEkvaXhPdXk2cHptZEYySnow?=
 =?utf-8?B?ZmxXT0Y3VVJoRkdaenc5ZkJCRDRsSE1qV0RWYk1GQzFCU3R0NWxoLzJHV2Er?=
 =?utf-8?B?VUNHRERTMTZKQnhFcDdvUXU4cHo1Z3AyZjA4UWdwdHZ6WGltUGdPRW82TDZI?=
 =?utf-8?B?djR1MUltNzJqbXMvMXgrZ3FERUQvSVdnZUNZTS9pQ3hKQi8zVWZPMGo1NWpp?=
 =?utf-8?B?ak9pY1JiZFloS1VZSGZXRTZqbVFZY2tDZ1F6azJlQWxGTXhqekh0YkorUkNt?=
 =?utf-8?B?TXVWOHdXeHRjYTNlWUp0S2RSeHJ3bnpDWXNhUmNTS2wveTg2bmwrSExxTW9H?=
 =?utf-8?B?cHZ3K1RSSTAxY3gxbEFDSlloUFdIZFBaUm9ObUI3ZnpiMXE1UlFPVWQvTUpL?=
 =?utf-8?B?NytKYU9sZThnM0RRZUw3SE9JU2dWVmVrM0gvNHR3Q2RQV2EraFMrRXllRWc1?=
 =?utf-8?B?UkpKQWVZNEVnT0JQamc2TC9hVkFsOGU0cnk3citBYStINldDZ3BXbTdHRmVZ?=
 =?utf-8?B?QmY4NHRPZHphZHM4TWE5K3ByTk5wekszeUxQTGlMN2RNYnV5eDMyaWdvZTNz?=
 =?utf-8?B?NVNGZ2dLSTFGYnhyWStMSjVNY3FkNzRNb3pLdUN4TlhvMjlEVEN2eTBXcHU0?=
 =?utf-8?B?WmxBS1M3MUJwRkxwU25JeUg1RWJUY0VGODZxNllqWjY0Tk4rWjFwVWZvRDNV?=
 =?utf-8?B?UTZXYyt4ZnBkd1hRMXROVzEyNDdPSjRjL1FWN3BFT2FZWHhtOXprMmZaRnVy?=
 =?utf-8?B?THNJWWVwWC9pOGtPaGs5VUQ1M1JiYVpScU5TdDRwRTcwWHF4cXZianNjY3B4?=
 =?utf-8?B?STNHcTFoR1laWjdUenI0bnJnbVpUODhKZjFOb3dnRTB1RkpiSTJnR3FBdVF2?=
 =?utf-8?B?WmNMRDJoa09Eczh6T3dPMkwxbG14bUtnZ1N4ZHVHaDIxaW9nTS9DS0hJTStS?=
 =?utf-8?B?b1poK1JTVjZieTZ2QUhwaHpvcEZ2VDNwSUFvQzRPNU5qbHh4aHpseWlDNkxt?=
 =?utf-8?B?L2pTOUwrc0prQVBuSTBkQW1RVlovVTZOeVFKbG8wNU1TdkVEN0JZSExmbmJi?=
 =?utf-8?Q?pY1KrwWLHXzgh?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75738cc9-56e1-4017-5919-08df43335d74
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB10892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 16:13:20.2681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16952

--------------weQ7a5Gofn7yKFD0ylDqKJct
Content-Type: multipart/mixed; boundary="------------0hM45XWVKNirWz0NSk0Al5X8";
 protected-headers="v1"; hp="clear"
Message-ID: <87e4e47c-b82f-425e-b5b0-d425342d8afd@outlook.com>
Date: Mon, 16 Nov 2026 00:12:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, Frank Slotta <frank.slotta@posteo.de>
Subject: Re: [PATCH] ALSA: usb-audio: Add always_set_rate quirk for Yamaha
 MODX M
To: "Geoffrey D. Bennett" <g@b4.vu>, Takashi Iwai <tiwai@suse.de>
References: <avnJGI3L/sf7KQCi@m.b4.vu>
From: Shengyu Qu <wiagn233@outlook.com>
Content-Language: en-US
In-Reply-To: <avnJGI3L/sf7KQCi@m.b4.vu>

--------------0hM45XWVKNirWz0NSk0Al5X8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VvZmZyZXksDQoNClRob3VnaCB3b24ndCByZWxhdGVkIHRvIHRoZSBhY3R1YWwgcGF0
Y2ggYnV0IHRoYXQgOTZraHogbW9kZSBpcyBhY3R1YWxseQ0KMSBzdGVyZW8gbW9kZS4gWEQN
Cg0KQmVzdCByZWdhcmRzLA0KU2hlbmd5dQ0KDQrlnKggMjAyNi8xMS8xNSAyMzowMCwgR2Vv
ZmZyZXkgRC4gQmVubmV0dCDlhpnpgZM6DQo+IFRoZSBZYW1haGEgTU9EWCBNIHVzZXMgYSBk
aWZmZXJlbnQgVVNCIElEIGZvciBlYWNoIGNvbWJpbmF0aW9uIG9mIGl0cw0KPiBhdWRpbyBt
b2RlIGFuZCBNSURJIHZlcnNpb24gc2V0dGluZ3M6DQo+IA0KPiAgICAwNDk5OjE3NzIgIDIg
c3RlcmVvLCA0NC4xLTk2IGtIeiwgTUlESSAxLjANCj4gICAgMDQ5OToxNzYzICAyIHN0ZXJl
bywgNDQuMS05NiBrSHosIE1JREkgMi4wDQo+ICAgIDA0OTk6MTc3MyAgNSBzdGVyZW8sIDQ0
LjEga0h6LCBNSURJIDEuMA0KPiAgICAwNDk5OjE3NjQgIDUgc3RlcmVvLCA0NC4xIGtIeiwg
TUlESSAyLjANCj4gDQo+IFdpdGggMDQ5OToxNzczIGFuZCAwNDk5OjE3NjQgcGxheWJhY2sg
aXMgc2lsZW50LiBXaXRoIHRoZQ0KPiBhbHdheXNfc2V0X3JhdGUgcXVpcmsgZmxhZyBzZXQg
Zm9yIHRoZW0gaXQgcGxheXMuIDA0OTk6MTc3MiBhbmQNCj4gMDQ5OToxNzYzIHBsYXkgd2l0
aG91dCBpdC4NCj4gDQo+IFRlc3RlZCBvbiBhIE1PRFggTTYgd2l0aCB0aGUgcXVpcmtfZmxh
Z3MgbW9kdWxlIHBhcmFtZXRlciBzZXQgdG8NCj4gMDQ5OToxNzczOmFsd2F5c19zZXRfcmF0
ZSBhbmQgdG8gMDQ5OToxNzY0OmFsd2F5c19zZXRfcmF0ZS4NCj4gDQo+IFJlcG9ydGVkLWJ5
OiBGcmFuayBTbG90dGEgPGZyYW5rLnNsb3R0YUBwb3N0ZW8uZGU+DQo+IENsb3NlczogaHR0
cHM6Ly9saW51eG11c2ljaWFucy5jb20vdmlld3RvcGljLnBocD9wPTE4NjEyMQ0KPiBDYzog
PHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNy4zLngNCj4gVGVzdGVkLWJ5OiBGcmFuayBT
bG90dGEgPGZyYW5rLnNsb3R0YUBwb3N0ZW8uZGU+DQo+IFNpZ25lZC1vZmYtYnk6IEdlb2Zm
cmV5IEQuIEJlbm5ldHQgPGdAYjQudnU+DQo+IC0tLQ0KPiAgIHNvdW5kL3VzYi9xdWlya3Mu
YyB8IDQgKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9zb3VuZC91c2IvcXVpcmtzLmMgYi9zb3VuZC91c2IvcXVpcmtzLmMN
Cj4gaW5kZXggN2M1ODFlMjgzOTAzLi4wYTkxYTY3ZDgyNGYgMTAwNjQ0DQo+IC0tLSBhL3Nv
dW5kL3VzYi9xdWlya3MuYw0KPiArKysgYi9zb3VuZC91c2IvcXVpcmtzLmMNCj4gQEAgLTI1
NTgsNiArMjU1OCwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9hdWRpb19xdWlya19m
bGFnc190YWJsZSBxdWlya19mbGFnc190YWJsZVtdID0gew0KPiAgIAkJICAgUVVJUktfRkxB
R19HRU5FUklDX0lNUExJQ0lUX0ZCKSwNCj4gICAJREVWSUNFX0ZMRygweDA0OTksIDB4MTUx
NiwgLyogWWFtYWhhIFpHMDIgKi8NCj4gICAJCSAgIFFVSVJLX0ZMQUdfR0VORVJJQ19JTVBM
SUNJVF9GQiksDQo+ICsJREVWSUNFX0ZMRygweDA0OTksIDB4MTc2NCwgLyogWWFtYWhhIE1P
RFggTSwgNSBzdGVyZW8sIE1JREkgMi4wICovDQo+ICsJCSAgIFFVSVJLX0ZMQUdfQUxXQVlT
X1NFVF9SQVRFKSwNCj4gKwlERVZJQ0VfRkxHKDB4MDQ5OSwgMHgxNzczLCAvKiBZYW1haGEg
TU9EWCBNLCA1IHN0ZXJlbywgTUlESSAxLjAgKi8NCj4gKwkJICAgUVVJUktfRkxBR19BTFdB
WVNfU0VUX1JBVEUpLA0KPiAgIAlERVZJQ0VfRkxHKDB4MDQ5OSwgMHgzMTA4LCAvKiBZYW1h
aGEgWUlULVcxMlRYICovDQo+ICAgCQkgICBRVUlSS19GTEFHX0dFVF9TQU1QTEVfUkFURSks
DQo+ICAgCURFVklDRV9GTEcoMHgwNGQ4LCAweGZlZWEsIC8qIEJlbmNobWFyayBEQUMxIFBy
ZSAqLw0KDQo=

--------------0hM45XWVKNirWz0NSk0Al5X8--

--------------weQ7a5Gofn7yKFD0ylDqKJct
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEndez/blurJ1OdxJq0EdkUReHwWwFAmr52gMACgkQ0EdkUReH
wWycsg/6AkJOI7+yOyHSoY7uoseHWkbN95BqxT7fEYzvqycvY64jjH+zQZLCeffB
dOfkAkGe8Gh9tbi0UcCsMDz9J7Ht/l0Dv2By1FhGBVe8nUOqHyiwJjze/e2wSxk+
71yjkCDJhZWSbvBCXh3suCza+6Z7k3MYw119BFcY1t00EIJJZQe5SLekA0VTa8FB
H+9lo1MAtnfPqzkEGOeIR76dTHPMucf0K4SJoyH5hRvHtgcATJuwVek9hFu/pj7t
TVdAjwzqIC5+x2Yl0LpDc4C79XZBQ0Hxu4d1CwOUDZDCbT7epD/jMHA0YaVHSdQT
Jpw02jgOv93E6UW5SfoAQPtVaD+ZY4+f8Kd28ugpqTdqzs/J5AwHuz9Mp9GxrG8e
AyRHOjmzlzgRgS1Tkl4tiL039Ahnwloqps7soDe7ukBb1URb4Ru7uO7znmtZv2bP
h+HO9JGX7dlMzkDceo3jjaxyrJfYSehgG7bEqUsvQ4Zi61vLXPsuZjLO4FK+jNqR
fG+mkPd8TC16NV82WYM+bsGjkSC5QewB0OI15IoY32+NKZU4AprzpXvd9v67T+55
zx7t7uNYyYvZxl+5bdibJyX/yXFwYdaER+6qMD4DUdJeZDzr4zH1tfAP+iCuU6Bn
gJ+u8eD4ptqoeMnSNsaU7wlYNTuglcfl2SnEB8EmwIKS3O3iidU=
=+ht9
-----END PGP SIGNATURE-----

--------------weQ7a5Gofn7yKFD0ylDqKJct--
