Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013015.outbound.protection.outlook.com [52.103.33.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C6237A4B8
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404384; cv=fail; b=IhvgBuROwFQtX1kTWf5+TSk64WO8GYYr9YXFtHNSPZTyoTy/YFhcnWSE3XYFvJ3RAasbRrTHhnqs80hza1GcGFsqqB9wCnZTkxrPrQ+gujFbou+71xdaefh+ck/84yzUPGGCkoAbkNX1GF/9Yf9aI9m47WlPXAFnjwUC+xztkVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404384; c=relaxed/simple;
	bh=i0EzyOWYrlCKD1QbXJESI+5TFqDSgnkBdaiFerykqDs=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=DGwqk8oOJ9FXCy625AcjsAK0yGuDsf5hCLLViWrisQUPp6wSBZfV9BdyJnQjxx1Xg05B6NE8kI7RDUL4kFRt8lhQtOy6k9n6pYe134E8RLD+GPVgJc8D88fI7FD5ZAg8KfoCBUkLsxpr1k98Z3s4PPCzJDVkbJ6qp5rPESXfsxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de; spf=pass smtp.mailfrom=outlook.de; dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b=QBWtU1s1; arc=fail smtp.client-ip=52.103.33.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b="QBWtU1s1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJZYW2rC99Ju9KSIQKJqljzmuGKlrfFSygQEHBkEretm/l2nJXq/7/V1jXyJjpCnZwjh49WG2aaRdklbK3o1IdP3gpwieNTFeL3s3lj0O8e52GUAYK7VymbXDKA3QPFkgYzX58bF3qQV1ofkykTV6ugLpuNqpxSJE1HCD6opWYKKJVOPBxIXs3kFdPWsu5sIcbNpS8BZqHioWQ+aS37Fakh63dY//EVDtka1vHZoGkWn6Qc+PIHJXytmJc7aQzMrvekyYLUBpij0E2EAysAVtfd9Wgeub/3a/C6qImIEAD+V65le/nNboddz6+ANkJWzQ3jCrcPDiIDs0lrLRu8NRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noYj8CZxyNWV+DWhTKYRGIF544r/v2/USxmn3apIHXg=;
 b=wnN5A/o8LDVT8NlxumctttvyDVaH5l9Vw9IlJx990uWzhlCkF9YT7H18iRiO0khoQ0wcEuagZgxz3AR4AhQ5Mm02+6RpEJ9iedCB/R0kZPDfVkrRTekGAU+gbeWlXZD3NFuqRG8jN0+j0/BPgrZdxr65V4YEabrEyp9ZzALS9rMKjaoz8/QLoj++ac3/ehkDakhbQxdhNA2UQPkJ+D9875GVYpgv5zNAqnQ+V9KUi1F1f5TVihqpfIuM89y7lj9qNYfhP5t8sdZ3D70QqUVy5bwIwo2R6Ey0jci1oPIYvmbZcBzrjf96/mec8G4xtt+yH2XyrnfY6xeykTvo7E7A4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noYj8CZxyNWV+DWhTKYRGIF544r/v2/USxmn3apIHXg=;
 b=QBWtU1s1+6I8fo7CcExp/VeK7lC0yySwNX2MZtpqi2xP5Z+wRftndcDSqPOFNwcg0FS89maPyM/cvFP2vlEdy2biLdupXHU9JXhvemC++rOaRZioDGmAi+YHqLZrSuscZuoMh/tr+b2MN6WTv+NRkOLSPdldLhfqo5PhgDBfcAmLlKdG+tsoIgAD+ONZUNXS2rEVGHrWGRgVtOFPXCreNAZGTlZzYuO1ehngaEM5wM7dbzJTng/VZhtseheK8sQMaNFczWUEoMC0Rf4jmCtZNnGO1RD8OoEXyTi5UWbr6vJFe2konpJdEpuSfyLO/ku9Cv3hBWmypV6Hi+er9xBDfA==
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:6b0::11)
 by VI0P191MB3007.EURP191.PROD.OUTLOOK.COM (2603:10a6:800:2b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:46:19 +0000
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883]) by AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:46:19 +0000
Message-ID:
 <AMBP191MB2886BF4BED02C050FB4D6B76CEBB2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
Date: Mon, 14 Sep 2026 18:46:18 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE, de-DE-frami
To: perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org
From: "otzelot2021@outlook.de" <otzelot2021@outlook.de>
Subject: [RFC] ALSA: how should a card name that is not ASCII be exposed?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::20) To AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:6b0::11)
X-Microsoft-Original-Message-ID:
 <c2e00419-3145-4c8e-9125-c770ce3889fc@outlook.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP191MB2886:EE_|VI0P191MB3007:EE_
X-MS-Office365-Filtering-Correlation-Id: 4811a851-49a5-410f-cb94-08df127fb3ac
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|55001999006|24071999003|24121999003|22091999003|25031999004|20031999006|6090799003|39105399006|5072599009|15080799012|19110799012|23021999003|8060799015|25010399006|4140399003|40105399003|26121999007|25131999003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?di9GcGlEYmpkV1lnYk1lRWVNOUtuV2tmOUdGZy9kVmU3SnFjWEhGMFdhS0kv?=
 =?utf-8?B?SzFTQmovMTlBSWttd3YzdXIxZ2hQaVdVZG5iMzBFUGF5RXZQY3ZsYzZ1NTBa?=
 =?utf-8?B?YWt3bVlYRmVHcUlIcEk1bXlPem9RNnJRMjEwMkR0dVN0L3ZDRm1UMUZjRWpY?=
 =?utf-8?B?QkJWazVWSkEyclZoSVhnOHR0cE1wKzBrMGZxUTIvcHNFcHdtNjVEWnZGbFE3?=
 =?utf-8?B?ZXc4MERUenNyaVhOSWR4dUFUSmpJUUJadVF1Q093NEZxaVpwUkkvZ3M3ME5v?=
 =?utf-8?B?andGN1MrOHBqelZ0QmxIQWJIZ0ZTeXJNSFBQUEw2OXRrSlY5QXhKVHR6UmZZ?=
 =?utf-8?B?MldwM0RTaHMvMGovd3owMWsyWUFhdXMrdmJWMCt5L0p5N3NEVG50Z1J2Mk9K?=
 =?utf-8?B?WTJNL1p6R2cvRHBHY3BWY1RpVXhZNlZSVHBtbDFES2w3T0tXWmI5VmRlRzVo?=
 =?utf-8?B?R25oNWd4aE8yREdmZk01RXh1ZWY2blRaWjQ3bmt1RTNCYlUzS1psd29uUXRM?=
 =?utf-8?B?SzByb1RUbGNuV1V3WXFITFNVVE0wWVI3ZnMrWnNZV0tNeWUwaDhzM3RwdkJE?=
 =?utf-8?B?YjBHdHovbzRNMDNmYTRQeDFjRExpdkFWc2hGbUZLTDF0bUV1VlpMNzlrb1RS?=
 =?utf-8?B?U2NLNzNUQVp1cnpuWE1iWXNsZXFXVFZDMnFpL2FIc1JINkplOUhjcUluYlRH?=
 =?utf-8?B?ZklySlhjQ2x4czBET2p0SmRGS3RhUnNtUWZmblJXODhZbHhoQk8xOWtHTTRL?=
 =?utf-8?B?UHFtaWVYQm94Uld2NWM5dVhCOExCZEIzRlJkNUtoMHo2aU0rV0QzQzNBRVZT?=
 =?utf-8?B?TlBqcHRtei9QWXJpalhDYlN4bUNsWk00Y0JmWWM1MTBmRjNNWEIzTXRkNnZr?=
 =?utf-8?B?YkNxK2F4cHg0c2diWjR4RXhDMXZJamhiSm94YjhHRlNRRmlDQzhPaGxweDRp?=
 =?utf-8?B?SzAxZXV0QUR3blBUWmVsOUo4Zm9wUEt3M292VllzQ0JTR01hTVBQcDBpZUJE?=
 =?utf-8?B?WEgwa0xkMGhjbzRjTDZOSU5pZEc2dnFQTHM0MzArN2dEdU5OZmFheTB1OEcw?=
 =?utf-8?B?dWsra1RMazJnZWxRMDJOR0xvdXAxaGxmNTE4a3JlRTdMT2xmeE8wR0VJdWFm?=
 =?utf-8?B?MmF6RmZLZDJ1bjBGNVd6aHo2YURWOGdtNUFNbGZvYSsyUVNISkd3ODlXQ2NK?=
 =?utf-8?B?TTB3TUNuVlBMK3ZYVkZnbG00WHl1bVZxUFZPOGMrOWVEdmtUeHVQSnhDYTNt?=
 =?utf-8?B?R3N0VW5QbmVETWl0MGV0UGZGaitIOTFUZEZWOHpvdU1Jd0FubnVjc1prZTRq?=
 =?utf-8?B?V2tzc1IyUkhDVWo1djlhT1YxZGJuV0xGUjFjNlJiRnliUnlGYW5pY3FkZG41?=
 =?utf-8?B?dC9QMHRzZTV2aFQzQXg3NzhqK09vKzNPVzlwRHM3NncweDhzUnhsZlpGNGVI?=
 =?utf-8?B?VmVBNHU0V0F5Z1ViTUxIcUZLYnNJaVRlMytacTEwSjFqOFZncUx5eHNPOFM2?=
 =?utf-8?B?eDJGbERiOGJOVTduZ0hycDVqY0d4T3RBMG1oN1RrUzRFS3BuQWY0UmxrR2lX?=
 =?utf-8?B?c2p6N2kxckdCYlhjWWNvWFY4UCtST1U5eEJyTjY0QlYvd3NGNkZKdUZJS0Ey?=
 =?utf-8?Q?flRqcfMiHNk+0XIO5A81pLBr8W9ZsQd2zYzPM9x4DEsE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck81MTdBOTVuYlhDTjlKQzRKaGExZXFJTjFPOWZPR3pKRHR6ZnhzZ3ZnWGVz?=
 =?utf-8?B?NVFNWGlvN1NZcHhFMXR1b1J1TU9YWjFJOTBvWFBMVkpJemhaY1FNZU5pNTRv?=
 =?utf-8?B?WEN5WTFFblNJMDRMQ3QyZlJjdHZ5Ymt4ajRxOFd5NmNtUWVmbTVxUUxtK2Rm?=
 =?utf-8?B?VUlhSVFWVWd5cWoySklPNlhQYXc5R1REV1FXYzIxSUcySWJaaXNKTWROZVVk?=
 =?utf-8?B?d0tFT1Q3SDIzWGRnY0tzK0J1ZzVjYnY0aC96Z0VYVkdlUEU2cHF2SUZsVzFu?=
 =?utf-8?B?ZUR5UEtWeHJWWnBObFlXa3l4NURjYnR6a3JmbFFYcXlhWWpnbjFDM3ZZUUNP?=
 =?utf-8?B?OWI5dzh3YTcySUdmanMyQmpRQ3U1ZENBRzhIOG5NMGFrQ3BDSlZocFNqQ1Bh?=
 =?utf-8?B?TTY1Q0pWeFpsVnk1UXFSekVkcnM5NUg4L2tFem0zb3BTZUE0ZCtqZE11TEl0?=
 =?utf-8?B?eVNlZDBNNWdtcS9mN29jYkNGWmQ3bE1pNnhzS1hSWlJMUXNOZ01qdGh5Yldt?=
 =?utf-8?B?RU1qMVNwUGozZ3dDbmg2aGlPb0dDcmwzRGRmdE9OenlnY0pYU1VoV3lCZmhY?=
 =?utf-8?B?Yk9jSzFHVllDR1dmRTFmb3h3N1g2cU5xZmprYVJIVCtsRXVuYnVwKzlUR05t?=
 =?utf-8?B?OWhOYzJMcHpuU1puQWtvVXRRUzJWTzVkU0ZFNDN2NDhpN0VVdXpJSGszYU9t?=
 =?utf-8?B?dGxYYzliRVM1Rm9qaFQ4R2g5SFBDUWlkUFJWM2VoeWlvdVhHWEIvVy9IOE5u?=
 =?utf-8?B?RXVCNU83dUpJMUJwZUdXMUNQTVJwbGo0UEpYYnk3SzluS0hWTWt4OXhVYzNz?=
 =?utf-8?B?N2d3dkFKb0luNmxYUTR6RWpFbVZpSEpQcVV2K3VQaEFTc0NBQ1V1blBCYkk3?=
 =?utf-8?B?dFFjQkUxYTNtUDI1R0lIYklrRVlkOS95cG8xdm5GU1JqSkl5d2dVSWx0RCtv?=
 =?utf-8?B?cjNMMVd2RnByTjBXQUhrQ2c2OHd3eFNYcURDSnZNenRIWDI3SHZrYTZOcWJH?=
 =?utf-8?B?QUNSNWtzOExTVE5zZWZkZlFGRUNhTlYzRXFudGo4S1QwV0tZbEFPM0lkbVBn?=
 =?utf-8?B?aUM5bUc3SmFuK1RIVVd6blkrUHhISCtvR1hlSTQyU1ZMWUkxNnlRRU1WMHVz?=
 =?utf-8?B?bHJ2RUJZUW1TRHFxMDBlTktZVWhHcTBzTFN1NStmcm93N214b3RBWUxZOFRl?=
 =?utf-8?B?aTcvQXJEbUFVV25mMWJONGd2VkZmQkRmU3hXOU42TkNUTGJ0SXorcm1FUUpP?=
 =?utf-8?B?YUV0cUZyRkxlQ2ZGS0lhMnlIbUlkbTRnUFRsUEZ1TTBGWmZaOGRDSlorK0dq?=
 =?utf-8?B?RGFqRGYydThNcUNXSzhqNXlRQ2JpLzlzSjM2b3hxZnBIR3JkNHRnTVFBS0hz?=
 =?utf-8?B?K1dqMzNDQkFEM1pVcUtZNE5tdlBWU0wzb1pwdFk4dkx6WGZlZ0RkbS8vZi8z?=
 =?utf-8?B?M1RUUFZ1dnFwZmVTOURlWjZtb0x2RnFZcHgwazFtbUhzQTlQcjhIeHNDem5v?=
 =?utf-8?B?eHhFcURFVmFxSXZrYTZZdkxBK1Vsb1FmR3M0MG5WY1llcGZNV0hIdWJkS3N3?=
 =?utf-8?B?cGdBcVk5ZmJzU3dJdDRNNVhrMVd1L3FUVm5TcjltN0ZIS2VocTJxU21jTjkw?=
 =?utf-8?B?V3RRWFB5WUhRZE9lTEVNOXl1bmltMmhkLytPSmhmbXljV2pJMmRPcmxHWG0z?=
 =?utf-8?B?RE1OSTJYQzExU0J6UEcxckNxQjZ4MTd2SmlISjkxdFN4MndLMkowSGZoaUZP?=
 =?utf-8?B?UFVkaUZPZ3lTNFRRcm0rWWl2MWJuU0VocTFRemtUWmR3WE40RVJYNkJ6M2Zm?=
 =?utf-8?B?blloTk1qYlZqRUl0dGt0elNzbmt1UVNTSnJyRXRCTVhaMHFCekQ4cDBRb1Rr?=
 =?utf-8?B?NzkvVHRETlJIWkxXekhrK0lqTStFS05uU1VnUlRLVnRPV1E1dktXanB6Ykdw?=
 =?utf-8?Q?lVpw6IeK6rf6hwwYLm9mh7mJuCRCiRus?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4811a851-49a5-410f-cb94-08df127fb3ac
X-MS-Exchange-CrossTenant-AuthSource: AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:46:19.6657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P191MB3007

Hi,

before writing more code I would like to ask whether the problem below
is worth solving in the kernel at all, and if so, which of the possible
shapes you would prefer.

The problem
-----------

struct snd_card has three strings that exist only to be shown to a
human: shortname, longname and mixername.  They are fixed-size byte
arrays with no defined character encoding, so everything treats them as
ASCII.

That assumption does not hold on USB.  usb_string() converts the
UTF-16LE string descriptors of a device into UTF-8, so dev->product and
dev->manufacturer can already contain multi-byte characters today.
usb_audio_make_shortname() then does:

     strscpy(card->shortname, dev->product);

into a 32-byte array.  If the name is longer, strscpy() cuts it at a
byte boundary, which for a multi-byte character means the last sequence
in shortname is truncated.  What user space receives through
SNDRV_CTL_IOCTL_CARD_INFO is then not valid UTF-8, and it has no way to
repair it: the missing bytes are gone.  longname has the same issue with
its 80 bytes, and it is the string that ends up in /proc/asound/cards.

So this is not about adding a feature to a working field; the current
field can already produce a broken string, silently.

Who is affected
---------------

Users whose devices are named in their own language: a USB interface
sold in Japan, China, Korea or Russia, or a European product with an
umlaut or an accent in the vendor name.  32 bytes is 8 CJK characters,
and a vendor name plus a product name rarely fits in that.

What they see today is either a cut-off name or a name with a broken
character at the end, depending on the length.  Desktop stacks
(PipeWire, GNOME, KDE) show the string as-is, so the damage is visible
in the device picker.

I have not found an existing bug report for this, which I take as a
sign that it is a real but low-frequency annoyance rather than a fire.
That is part of what I am asking about.

The cheap option, which may well be the right one
-------------------------------------------------

Declare the existing fields UTF-8 and make the truncation stop cutting
inside a sequence.  No new fields, no new UAPI, one helper in the copy
path.  It fixes the "broken character" half of the problem immediately.

What it does not fix is the size: 32 bytes stays 8 CJK characters, so
the name is still cut, just cleanly.  And it retroactively gives an
encoding to a field that has been encoding-agnostic for 25 years, which
may or may not be acceptable to you.

If you think this is enough, I am happy to send just that.

The larger option
-----------------

Add UTF-8 successors of the three fields, kept alongside the ASCII ones
rather than replacing them, allocated on demand like card->components
now is.  Either side may be empty, so nothing may assume a name is
present and every reader keeps a fallback.  Drivers fill both and keep
them semantically in sync.

For user space this needs no new ioctl: SNDRV_CTL_IOCTL_CARD_BYTES
already carries a variable-length card string with a type discriminator
that was added for exactly this kind of extension, so three more type
values would do.  Nothing existing changes, and an old kernel returns
-EINVAL for an unknown type, which a reader can treat as "use the ASCII
field".

id, driver and components would deliberately keep no UTF-8 counterpart
for the time being. They are not display names: id is the unique handle 
and part of path
names, driver is what alsa-lib matches configuration against, and
components is a token list.

Questions
---------

1. Is this worth solving in the kernel, or should a desktop stack carry
    a name database and leave the kernel fields as they are?

2. If it is: cheap option, larger option, or both (the cheap one as a
    fix, the larger one as the long-term path)?

3. On limits.  For card->components you asked to drop the artificial
    size cap.  The same question applies here: a per-field byte limit
    (I used four times the ASCII field size, so the same number of
    characters always fits), or no limit at all with the ioctl reporting
    the length?

4. On validation.  The kernel cannot normalise to NFC without depending
    on CONFIG_UNICODE, and it cannot detect homoglyphs at all, so both
    stay recommendations.  It can cheaply reject malformed UTF-8, control
    characters, non-characters and the invisible/bidi formatting
    characters that are the spoofing vector one actually can catch.  Is
    that the right line, or should the kernel pass bytes through and
    leave all of it to user space?

5. Who would consume this?  A kernel-side field with no user is not
    worth your review time.  Should I take this to the alsa-lib and
    PipeWire people first and come back with their answer?

6. If the fields exist, does exposing them as read-only sysfs
    attributes on the card device make sense in addition to the ioctl
    (udev rules, inspecting a card before opening it), or is the ioctl
    alone the right surface?

Disclosure
----------

I have a working implementation of the larger option (core fields plus
validation, the CARD_BYTES types, KUnit coverage, usb-audio as the
first user, documentation).  I am deliberately not posting it yet
because the questions above decide its shape.  Say the word and I will
send it as an RFC series.

That implementation was written with the help of an LLM coding
assistant; per Documentation/process/coding-assistants.rst it will
carry an Assisted-by tag, and I will of course carry the
Signed-off-by and the responsibility for it.

Thanks,

