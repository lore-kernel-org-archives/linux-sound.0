Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012068.outbound.protection.outlook.com [52.103.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029792459F7;
	Wed,  3 Dec 2025 04:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764736108; cv=fail; b=geprubJJDtsNscqzuBqS+loFC3QoIw7YIJAn/orke22FzmZ0D1gbNIO0GjtPwLQVILyyFogO8M1qlqZ4hczyHq6ovmnWXndKl5XmrRbdUL6cpMH9QaeIa5BXynHbQ8AJmf+kFEn4DMYms5rmc4b7nBfsfF1RkV9+NC+qz5cDO84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764736108; c=relaxed/simple;
	bh=iNW2wFMJ6CtajfXu14JHZFxU2cKCPQQDYOnp5RgJSvs=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=usq1rxUGb0bI14l5Tv0Y6Fw77m6ghp2kixt97B8hyYyPcvKULt3x5Ta5CI7AmHbF2zDbgik10twj+CJAljthPXezn0kc8lwYXgcmmTbtbDuszAwZiixFb1v1c4RH4K+pf1longDP/Y2ikb1akGv+aAqonrrVee6Qx6aAoCC53jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Wclqql7n; arc=fail smtp.client-ip=52.103.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Wclqql7n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoqPVAaePsVFc4xCjRQopAubInXVKVKXR/VHjGAYfBdJL/dFcuT/fnhoBM2hgucJrMXo1BDgdBS71yu6xIF4JvPDWFX/OW0v585GKrGnUoNmJcKpYE8kEL3z5JXQ4Smz5drPDosZ1wyGVavMgoAxcnx8ixPU3D7Fah96YV37RYXnbrAf1F81bE7zYQtKU1JjfYqF17g0lbLIwsVDjwpi99IkYpx5tkue3LlfIwRxkYOkLNJhddaJhv/mL19/kqikSTdNebBqH/5kbvj0UXQNH9Hfp27AMzJ8accKM83US1bsLNfg1T6ZOiQ59T1nwHdkEV8LOwbekUbvYDB3QqjiJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pjosXhFu4gcvikVv55qoIndLDJgCELnjOMie0ljhX8=;
 b=IAKagM3ZWImN7CIGn3Va5zJhcOUvhzGHUsa6lqGhuVxKkWBWSxi6ArDL0vWN2HNRrFqvPT/kxnoWToRjgEP77NlkE1TJa/iJJcw34x4JgiEB8D69z5+OQ3TKVLxk7aZElTbptvjYXvcCed4NcWFhi6kF33kKKCMMJk7613PwL3yq2cM3KUjVVHXLFtPSyd54xs82KukzP/NG2FuN+7yfLGPCLiMqtPTu4rpUYM08saXYSAQg8aO8uicT7jbbAECzZB1RBeMBd+RpSpvg9cKGAqpR8Nl7wYVYcstYCKe5sD6IkGi3bHnDfNNtA1hu7rgGRUSB3mG/Yr7OU+NR0X7DIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pjosXhFu4gcvikVv55qoIndLDJgCELnjOMie0ljhX8=;
 b=Wclqql7nb9rbvv6i2n4+KOu2sS3Aee9FakABulabSCIB0BLpW/17tsSS4VeqpQtl9/CNkRwH228cQDFFTFXIo3Ysuj/hL6W2iCNXoZW8LNSL/7emkyMIx/zFODurp+mLTUs8H4NbvC81QrKqqJAwHkT7JozQe4MzMjOTfmxrJtVTQbPGiuRCQ3df5YtLGDs6zQ9MMgQM0/s+dvFpTCNGOzeZjF0apPvYp3L84ly96rZSWRsHsnEJQyIaZuYQKhAIr4tY6uOpdYYgIVeLMzssOv62DazTZKUqjvIOSB5U/P0vSGXxlN3aVheYAT8loCG4uvKuV2IwnFRavOUBxd7pfw==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by ME3PR01MB8145.ausprd01.prod.outlook.com (2603:10c6:220:1bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 04:28:21 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 04:28:21 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Wed, 03 Dec 2025 12:27:03 +0800
Subject: [PATCH] ALSA: firewire-motu: fix buffer overflow in hwdep read for
 DSP events
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <SYBPR01MB78810656377E79E58350D951AFD9A@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIABa8L2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwNj3bTMitRiXRODZGOLVOPU5CQDEyWg2oKiVLAEUGl0bG0tAMBkSmx
 XAAAA
X-Change-ID: 20251203-fixes-40c38e3ecb04
To: Clemens Ladisch <clemens@ladisch.de>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>, 
 Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=iNW2wFMJ6CtajfXu14JHZFxU2cKCPQQDYOnp5RgJSvs=;
 b=owGbwMvMwCVW+MIioLvvgwPjabUkhkz9PXHdapnr0/4//96av/6581qFriVFWjc0ue0WvDf3i
 RCJ087tKGVhEONikBVTZDlecOmbhe8W3S0+W5Jh5rAygQxh4OIUgIkEHGP4X8WqKVWpnflu5Q/h
 HzybY6xX6X3Zc9hs77OUTbyf9jCqHmf4HznfJe9ZPEeNRVGa98c0lgMqrCe8zzmGH/v+fFHH1jd
 K7AA=
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-ClientProxiedBy: PH8P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::12) To SYBPR01MB7881.ausprd01.prod.outlook.com
 (2603:10c6:10:1b0::5)
X-Microsoft-Original-Message-ID:
 <20251203-fixes-v1-1-47ba9f5990e4@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|ME3PR01MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a76d367-8f0e-475c-b586-08de322463f7
X-MS-Exchange-SLBlob-MailProps:
	02NmSoc12DdrOUoZhYz8lg7+EiDTeBxIinhKSMh+Z/V8GeSpJVPSq67ui240S7iTJ/iQFiirxK69xo0e/py5/C9qLbH0BFjDJA9DMKzDORoOhs46OleRa7PHa3Z7qdwqczHiznARsrbAi6bmKXWwE2LcsoEbeSka873TL74jmGmdx0d5L3RdCgCqYn91pFmKwfHg/lR0lQTMX812R73ruyjEMbbe0Kr8SDUb6BSjInP1ZibxbsjosuQLpvg8H6BNhHQqbAhII9v9/bhUTF/U/lCCxbzxx8ucUeUCcGrgvgMvum9hH0aZEZt6mgbt17f0ece94cIEoQBifiLsQ1z1IMW/AYrzradGavQyUlmzkWQ4GQ++2AtDAucG6FLmOzvmuxA0zHLmPuPsXmHZHSquOBN2h+SugMVNY0QRkr2Jd9+asWZpTlnk0iNpBdLHiS0qyLk0QaOfnu4hYU3gvPpkk8O6mFD+lfNhKu+jyEYaf0vM5DBRSMZ+Kcy64qUfFVRFFcFNRG6Xsu41gYzX6PCy1rVpKf1ug6FkIBH6qHDxMy4z4Ka/VB21+zrojKvDl67xkw7vvA7MqwvOoyaSTH1/NUULHqnUtdneEFvqRC5OGfm4YEn0S8bDgxZwrOWvu2GNTJ85Ng9HmDfS+Sz4wRtZEMaV8toEmfWemEX99kPYwnwa05QPykkrlF3d3cA4DLS6BdCv1Y5P7F0/ECmpi9kmxOgZRJL5h51qoTRpMlRsqnVp6AmiRD7hyh7R8SeEbJdt
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5072599009|5062599005|6090799003|41001999006|19110799012|8060799015|51005399006|15080799012|23021999003|440099028|3412199025|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2tzaHBDVS9qclV4YnhOUzVzeVU1WnRFa2NzZWkwMGJFNUtqU0lqb0dCY2s5?=
 =?utf-8?B?ZTc2dFdmd05sNHk2UldwMkZQeXMrZU5OUHZrUFJDSkd4MXNOWFJUa0pMTzBU?=
 =?utf-8?B?eDdTMXR4NG9xMDJMRjVrVGJJK1pGek5rWXBOaHNWQUtBb1ZPMVhtZERoRCtm?=
 =?utf-8?B?aTZMdUhKWWc4cVU3Q29SRnlYaVlXTVpFditJRlBRNnpXMVNoRHk0U0Jlbndh?=
 =?utf-8?B?NENhTG9DVThmdCtsb3pTY1JZU1AwK3FUZXlWNW5ib1FsSHdETkFhVUh3ejdS?=
 =?utf-8?B?MElsbWlFcmh5UUs1WG5Db09aVllnSGZVbHZwcEtPclNiWmUzNW5RL01TQldp?=
 =?utf-8?B?SkdDaDNlbVNlbC9sdnpZNWNMaVNLd3duUGoyMk83NWdHd2wwL0ttc0ZGaTFK?=
 =?utf-8?B?aTRYMDJSS1BENGl1YU5FQysxbnFIeUs0VkdTaWk1eDBUYVBwb2FadzFvbVBm?=
 =?utf-8?B?V0VoSmhzbElUSXJJU1Ruemk4NXBsV2lJVlJwQWQ0UGpYS21OclQrMTRvUHQ0?=
 =?utf-8?B?K2Ziem5RM3BidFA2VmVCSXNrd1RkT0x5NFBNYXpxS3NkSnorUFdzVFE1NVpG?=
 =?utf-8?B?bFN0VmE0emEzdW1pSGpzRVdNcnRDWWx0YVVXWFltU09kcHVsVTNBRXRrZzNX?=
 =?utf-8?B?eVRzYVFhaCtIWVMxNlBaSmFCWnNrSzYvVkZWcVoveVBRNUpnVy9VRCtGMnJG?=
 =?utf-8?B?SEYyb1J4OXZDL0xscERhTU8wSlpaeWQ1RkF3cXNiaDY4V0lyV3QwRlVndHBl?=
 =?utf-8?B?SkxwT0dCY25pZkNhMlJEcjVXYWt1R01RaXFDMXpaMzVjaVpRQ1ZNRDdzajBG?=
 =?utf-8?B?Rnd1citYZlR6eE1aTVZMMUJnT28rUkpoQ29EelpyYnlKZHAwT3RxKzVVM3Uz?=
 =?utf-8?B?K1lkTXpTZTdLZzZtOGc3Z0xuOG0zWFN0cUZ0OUkxbjJsY2Nmam1zWHRtbVNO?=
 =?utf-8?B?eXdIcHZDT29kdEx1NFJsYzU1d2FiRUxtN29RYStNdjlJTHdpbjhtRWd0TS9v?=
 =?utf-8?B?OHlpa0ltSXgvaEdtakVYY2NYN1RzdnhlNERZYks2TlpVREl0MkExMUFCRGhW?=
 =?utf-8?B?L25rSzZGTnZJMytGL1hGS3lPTUpZTEd1aGwzM2o4NnVHQ1ZOKzBHUGhpM3Iv?=
 =?utf-8?B?WGE5QU9ueTBhYnBvd3A4Yy9ldHVoWDJYZGFmY0M0U3l2NHBLYkJWY1BJblhQ?=
 =?utf-8?B?UGF5QkY2TGdpblp3b0U4b0orUTRNQXpxMkJJUVNlaDBmcmRDczUySklwYVBn?=
 =?utf-8?B?bjlZSy93MGVEdVg1Z3FtZ0NacXcwVUhwWFJwUHZsOWhUdEp4UlZIcFdEWEVB?=
 =?utf-8?B?U3dlVGpBaUJ3YklIbnUyQlZ6MGRHTHhKaDdUcWgzQ1NBVEVwYldiMmpLWmdJ?=
 =?utf-8?B?VzQ2QUJJVkt3Y2FEMXZDMnBkNmxjeFUwbXJLSW4rcDRkVnJidXBISWxjc2dn?=
 =?utf-8?B?aW5RakxMZTZIcDV2bTRMaXNkelA5bnFTU096a3EzczVqMmFzMmo2Ym0vTFJX?=
 =?utf-8?B?MjlvVG42THhTMWhPOVZ5SU1YVWovSVNhU3YwTEZsOFUwZm80dms5cTNJaUNC?=
 =?utf-8?B?eU96ZGpZQVFLdzRGT0V6ZzJibWJpZ3Rac2M1T2FXcTF2WS9pVGlGbkRjajNa?=
 =?utf-8?B?SE94VFpHVjdabHh5V2xDUERrMDVUcWg4QmNXbVlHdU00NTdwem5YQitTMTJa?=
 =?utf-8?B?dHlzWUR1WUltZFZScXB3UDA5VFl1a2tVQ2x3STFrTEJuRkJiU0V6OG5WeFpS?=
 =?utf-8?Q?B0dK1VY2di5ASvE3p8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEZhM2RpVWY2ZGdaelI5bWtxWE84QjdSTEFOS3J6RGhmYlkya1R4TmFWbjFI?=
 =?utf-8?B?cU4ydlJBQUE3V0NGSWJzNGp3SGhwU3NSclgzWXJTam1kelBPTUlTMkNVS2tQ?=
 =?utf-8?B?Um4zdHBTdng4cDBGSE8xS201SWNCa2dmWVUzMmRGZFJYMk9BQ3VyYmFHV0Ju?=
 =?utf-8?B?TVlpR3JwT3cvaVdSd2c5U0lRdVdNc3BoZ09PbnU2WUd6UGVpanFXYjJzQW1Q?=
 =?utf-8?B?YnpxcVhlbGpaaGtrZlpWVTlzMW0wVDlRVnErbkkyTTVac09XMzNla1Z3K0F6?=
 =?utf-8?B?Wlc1TnFaYmRialBRa3h3L2gvQTViU2tydmdHblFFNUFFdjRTL2p0Vkh5SE1E?=
 =?utf-8?B?QllWR05pMTY0cDNPTEcrYWFpdlA2YVhLQ2l4a2RtcDloMWYrbjBUNU8ycSt4?=
 =?utf-8?B?ME9CZlltR3NWeXhhbTBHeHd2V0FkVmpZTi9CSHlCYUh6SVR5Y3Nzc1FlUkpw?=
 =?utf-8?B?Z1B5cFV5aGUvUjNSK1FQY2I0WFlKYzFDODBOQjkzQ0Z1dGhYcnlvRVkxWUJr?=
 =?utf-8?B?V2plSXFCeW5BNFloZW9GSlFienhVVk9XTjlOaU9LQVV5Z0dhU0tiSkp1YzBJ?=
 =?utf-8?B?V0s4VlQvTXRHOU9BZkUyZDh2SUVaakVMNWNLNWZQVFBaY3F6dDBheXlzTmxa?=
 =?utf-8?B?V0xTMXBGQmhuSnVXYWVzcGQ5clpQYkFYNjA1WUtFWmlZZlN5YzRUT1FicVVw?=
 =?utf-8?B?d2R1RlhvQnJlUlM4RTk4MzVLSHdsc1hGamsxT1BPRFRUdElhb3FyaDNDTmg4?=
 =?utf-8?B?TVVoeTg0YmpteE14MjZmQkVLRVZ6NFREcEs4UitVSzVCKzFHZTVKNldvZHRz?=
 =?utf-8?B?TG0wbUpCcmJnQVdnandyRkQ5cllrZWhJS0l0ZEh6dUIrclg0YWYwR1NUd1FO?=
 =?utf-8?B?Ly9CdG9nUnU0ejhFQ05RcEpSVWZrQzl6ZURVK2laUVBIQkp5WWVTaTlteHZ0?=
 =?utf-8?B?UmRGeEpZOXA5MG5yV2ZGY2FtbE9nWkFiejJwM05zaS85U1BITFhpMDhvTGkx?=
 =?utf-8?B?djZVVEFzckNVa01LV0JMcFJRTDhPdzRwb1BnTmF5WERBOUZPOEovVUZURnJJ?=
 =?utf-8?B?RzA1N3FlWmpVUVg1YnV5R2pPd1dFcHFVWkV5Z2V4TCsweFdXS1Jyc1FMRjVR?=
 =?utf-8?B?ZFUxYm92ZGxHU0VxRHR3OE5YLzZtOW8rSEc0UHdjOFV4ME0wdnZqc2szVzNo?=
 =?utf-8?B?eFVxV0oxV0dlWERLVGlzK3hHNExMY0I4TmNaSzVJSmRjYkdWUG1lTDA2bzJV?=
 =?utf-8?B?TjZwT3c3dFd1QkFmdVhtTlZndWtSbGcxRndSU3ViNVFpOWtScTNjMXlRN1ZJ?=
 =?utf-8?B?Z1JTNEdzd2xqOWdlWURSeWlTejdoc0IxUUFvT1FOdnFTT3ZTNW1pSVp5WnpW?=
 =?utf-8?B?Vm1hYlJXbUZSNnBiMGgzckdueEl3ZDZ2UVJJWHdvR2k3ZG40eUlBTjJWTmM5?=
 =?utf-8?B?emF5aVNhSk9KTUtQaVlYNlpxZkZVKzMvSlpoL0JhUzZHUGhLeWdNUnMwRGhj?=
 =?utf-8?B?UDNYRVJ6MGpCTWNRTTZjdEFVZ1FTWjdpbVZqcEo0Z1REbThSY3RIbk1lelY3?=
 =?utf-8?B?TWZrcTZDQU9ITXVqbTBjZGZtdlB4c3RPVjN4b014WUI0ZWErakJMaHZqTlcv?=
 =?utf-8?B?UFNkcGhnLzdjUnU5NG9rbmhWdlpwOGl0dHlvRVhUQlgxSGwrUVp0aGZ2Vm8y?=
 =?utf-8?Q?P2Lq95mikx0irKQ10Nr0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a76d367-8f0e-475c-b586-08de322463f7
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:28:21.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3PR01MB8145

The DSP event handling code in hwdep_read() could write more bytes to
the user buffer than requested, when a user provides a buffer smaller
than the event header size (8 bytes).

Fix by using min_t() to clamp the copy size, This ensures we never copy
more than the user requested.

Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Reported-by: Junrui Luo <moonafterrain@outlook.com>
Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 sound/firewire/motu/motu-hwdep.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index 981c19430cb0..6675b23aad69 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -83,10 +83,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 		event.motu_register_dsp_change.type = SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE;
 		event.motu_register_dsp_change.count =
 			(consumed - sizeof(event.motu_register_dsp_change)) / 4;
-		if (copy_to_user(buf, &event, sizeof(event.motu_register_dsp_change)))
+		if (copy_to_user(buf, &event,
+				 min_t(long, count, sizeof(event.motu_register_dsp_change))))
 			return -EFAULT;
 
-		count = consumed;
+		count = min_t(long, count, consumed);
 	} else {
 		spin_unlock_irq(&motu->lock);
 

---
base-commit: 4a26e7032d7d57c998598c08a034872d6f0d3945
change-id: 20251203-fixes-40c38e3ecb04

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>

