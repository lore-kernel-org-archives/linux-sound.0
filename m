Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022090.outbound.protection.outlook.com [52.101.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B401142AB4
	for <linux-sound@vger.kernel.org>; Sat, 21 Jun 2025 06:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750485888; cv=fail; b=kwW3AckTKzweJKTtFKC/aOlpzQXXSoKUcOs3/oGStk7AuXiS0cH6cZCDrvILjd1IUNn1Yzremm8dpQQOd//2xmb8FRZ6zb9JjMC58sAaGBlFEEIFhXkz5lmveiJbHSSa82giB52UXb9pcwvl5Q70Vz9lZyL+iXHz2TJqIHtMfH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750485888; c=relaxed/simple;
	bh=etqkI4waPD4/+Qpkgr8qbX8gxPgFO0DtKDrT+9e51Lo=;
	h=From:Date:Subject:Message-Id:To:Cc:MIME-Version:Content-Type; b=YVRZvE+CC1DVtznfrktmaHZS3a9FWVFgaIMyoK7KiEMaEFD8d8cf+GYGfT9hI5THTYCH8SK/J/0pghyLJETzrEE4L3NydYrOf41E9ZXwosYj+cRAeH2zwz2D6W2vyJUXULgFPaTgHGgdCPhswgfRZ3WV/P7faKaWeF+nt6TIr1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYxtL8pa/4KE7yyhbCfowo7u0ycdtZt3wtIZx0P74G8eWoy0wpU2vSzLhWRgjCbq4YEamcMC3YaZZQ0CyKNH5GjM7TVVpa+THos/FVqUJvRkXt2Xf9gwkv9KmcnP2DmrMdViCpxzM19HPVY/xdcwhCEFOY0BfRiklPcxpoAUr3c2+/8F6bH8+7MUPprtMu6BnmYK+GBRnXEq7IJOiJXu3ityvZ4muLi74wpVHm0dFuJzp6cVVh1Hztbb4twXR9ZkwdyUei94h+RoBpBzgNCqMBzidwSYJsewREOHa3bj7HMl+WpYzjzZVosJKDmUt3OfoQq5ZbkULJnmMJycviwAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etqkI4waPD4/+Qpkgr8qbX8gxPgFO0DtKDrT+9e51Lo=;
 b=Uz1CEvEdoi5iefUE1b3kEVKXKyDByEO+lBv8yYpnXAoqFwNPAgQyBEZqZLmGgEH43Kdm1mPjq8ZteMBnYlmwQwkURX66X85G4WpAodGl2mcnE4PSZkYLDnsfJ7EWxOeZ0+CnEolu1i4ZGfqkMSWQB2uzJezLm+uJTM4ncSyyE7Fby6oq1hPx60vWvL0ZfKnZbwgp6KdmRR5fqMHtZXzZ5xafdbW+I32wne7gUlNoqLzqd4hgXCywCsJV8Tpv6m8Gb3JV+QmV8bW2WNs91r46SMDiHer+d3RFSKaj3GfPpJS4dkgkF7CxxpEUBueg5aXqcr4oyTF5TpMHNVQTCEF9mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from substrate-int.office.com (2603:1096:405:84::13) by
 TYSPR06MB7247.apcprd06.prod.outlook.com with HTTP via
 SEWP216CA0018.KORP216.PROD.OUTLOOK.COM; Sat, 21 Jun 2025 06:04:43 +0000
From: Joakim  Zhang <joakim.zhang@cixtech.com>
Date: Sat, 21 Jun 2025 06:04:43 +0000
Subject: Recall: =?utf-8?b?5Zue5aSNOg==?= [PATCH V1 1/4] ALSA: hda: fix
 controller cannot suspend when codec using jackpoll
Message-Id: <6K0ZS6G9HQU4.47WOZ3EPJ7BS1@se2ppf8519e92e6>
To: tiwai@suse.de
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 chris.chiu@canonical.com, kailang@realtek.com, geans_chen@realsil.com.cn,
 cix-kernel-upstream@cixtech.com
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-MS-PublicTrafficType: Email
client-request-id: 08a28b08-8223-4cbe-14ac-93735fe9ba37
request-id: 08a28b08-8223-4cbe-14ac-93735fe9ba37
X-MS-TrafficTypeDiagnostic: TYSPR06MB7247:EE_MessageRecallEmail
X-MS-Exchange-RecallReportGenerated: true
X-MS-Exchange-RecallReportCfmGenerated: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2JLbzVLaG9BN1g0WGxTekQ4Q2NGYlZiVEhJeElyLzMwLzFCeEtYTWN3cExz?=
 =?utf-8?B?UjhRRmxsek9MbHVYZGs3aHd1VEhvZ0dCc1U0MTRLVEpKM1dWTGkweTFET0lK?=
 =?utf-8?B?bnk3em80cW9ObS9Sb2JLeTRJYXA2WmhmOTg3eXgwNGM5MG5wUFBVUHcxd3gy?=
 =?utf-8?B?eFBlOWdINGhNQXVwK0V4YWtJR1FaTFJWOFNyZVlBZVpwMURVbDFKZFFKbEpG?=
 =?utf-8?B?SDljLzhTaWlqdzlrLzhBUC83cW9PTFcwRGJveEp0RGNCclRCa0drbnFlVVVr?=
 =?utf-8?B?SUZuOU1nK2lxeno0aVZFUUxnQ2F0MktlREt1TjBqR01GZXcrUTRRdFJqN1JX?=
 =?utf-8?B?Vi96U29lTTd0RWZ0dVpabmhsUXFBS2l3RnA4S045NStvV1pqcXZBNHJkTWky?=
 =?utf-8?B?eDNlQmt1czNjL3Q3eHhyQnZwbEloemxnSWhPSm0xOFZDeG5WbG9jaW16V3pO?=
 =?utf-8?B?WVR5d1ZoK3VqbUE3V3Yzb2VLTnRMTDZhT3dyMzBUV3JBVzlINWRUTCt4NVkx?=
 =?utf-8?B?NklmWHVoaVdhVmRxeWI4MzZzcGRHVG9KTUNHL0oyNmtsRlI4RTVFR3ZZbG44?=
 =?utf-8?B?aTRKbHpwSzNMbFcwZ2J6UzUrOE1FUCtFZEhZL25JUjBJTVdoVGRmdEs0OEZU?=
 =?utf-8?B?MVhjalY3V2wvaUhkR09TWUxlM3QwSDdUMm1QUFM0QXJ4WmlHSUNvUnZpTTRF?=
 =?utf-8?B?bjhHaVV3V1RvTVNWWkQzeis0V21tMHQ3VTB1UUk1YXJRSkxjb0RkekluWFhL?=
 =?utf-8?B?MDNCdUd4REU1NjJERStFd0xaa0svOFhuVEpYd2d4bUNGbFhEZER2WmN2bG5D?=
 =?utf-8?B?TW81aE5mNllRRXByRUF5ZS9wcnV2NTJZUVlpdkFUbk9nb3JDdE5iMUlGZ1ZM?=
 =?utf-8?B?cEhwMGhnTjVuY05JTVA4UENqdm1MM0gxMDk4NXNtcHl5NTRMM01BdXVFNHh2?=
 =?utf-8?B?TlNiTE1mWXNFaThyaUZWVUExakVYQWtrZ0xlRUl1bExDWUJlbHNMOWpxM1hr?=
 =?utf-8?B?NlBlSkdpeFAvd3BHOFpOZkxteWxJcVc2em1JRlFuRDI2c3A5aElRcHJOYmc4?=
 =?utf-8?B?WkdEVnBtZk5keStLbGk0OXFXanh2clVOcGo3elNxWGRqTmdTSnRSVVl5RVA5?=
 =?utf-8?B?aFZ2STRmMk5HYjFUVXJzYlNsbkp1S29rRWsyTllBVHA3bFRvcTJjR0VLYnFv?=
 =?utf-8?B?L3EySnMwQ1V1UTc1cFBuVk1YcVI3djFBbEJRN3p0SWt1SGRMMFd1a3JoWUZK?=
 =?utf-8?B?S1d0Y3dFRm9hajZOREpua3dnNVZzdC81clF1NFlEdXRFdUZ6NGoyQ1VSVDQ3?=
 =?utf-8?B?QkxNMEZoZjlDeERMVkxiQ1BheUNsSFBwRXdsb3IyUGFWTVZuWTBpM0plYlN1?=
 =?utf-8?B?U081WU95eUY0eWYzZzBVL203NUZXZDE2eGFYeVgrZ2VYeTZYV2dGRXB6anEx?=
 =?utf-8?B?ZWhnUVMzSmtKNS9SNjdRaXhrNjEvMFdEVkRhQnBzNzlXVDR0RllUeWlkbnRG?=
 =?utf-8?B?SUVXTXdsU0kxbE1ySVM1WW9NQ2xUalpQSDRzRDF1SkpWOFFKSGg0Q2MzU1Jk?=
 =?utf-8?B?S2MwOE14TEpYSnpqK1B1TVc5d04vczYzcFBZZWhRQ0l0Vk9zZGhodDBLZ3U1?=
 =?utf-8?B?MU1mb1ZVaEtyZDZReWhnWWo2Zzl3ZTdzTEtsaXl1dWRyd3A3VjdPZUJRa1FM?=
 =?utf-8?B?Qlc1bG5YNWRCTm5QdDMvTkVmVHU0YmpCYzhoa2NZbjhaYk82cGo5MTJGMzho?=
 =?utf-8?B?VFdIeTFIdWJxMTd2eFp2elRnU1gwYWlwVU5EMFVaTmZYYjk0Z0QrMFhYdmRY?=
 =?utf-8?B?ZElTcXZHZWN2RnpNWU4ydXB3ZHpiWEZ3djk5SDk2TGNIandLbmVDVkNyNlcw?=
 =?utf-8?B?clZRdk04RE9QUTlFRUtZSGdzV21hRzNyQVA0c1FMd1NNamZNY1M2QkpkSkpV?=
 =?utf-8?Q?Cgj2ADmeoEs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l87FQDr6bKNadpELmzrMf02too0Q2b04zfvGQpKqpGlP6E45FIl6gKPwJ+eqvlA6bqeAg4LaSze6kfZ5/+xYK84xHPMfDMXul9ClQ8tSwUc46FwSh85ZROn/QCcGSG30oi5KjzXAA5t3Y3IwhchDjZ8aiZeky3ub/m/hcd5SGUUyQn088pKeZn+V1sp0Q4gnUMuc0xX0udtKo+xEfpqNWNnkFjUd0nZQ79SeppT7sCfhMOyY1MsPjOUQuP9cmi1H8iJy40ISFlpib2+TWkzxCaeU9f/WAZkhBdJTIe9IklpOU8BUBhKlb/Cy4o0Sv21lK5EaHNQWx/2Njj7pDnAPbWox0FU00lJ6m17B9EsbPMEGqT1JHt4X7aRpZgJ8eH+U/xTWQ6KLQY5OllHpUS/v05wqR6lUPePdIeSFTmmzCqI=
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HttpSubmission-TYSPR06MB7247
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 06:04:43.0393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 610be750-ece3-43ae-4da0-08ddb089843c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7247

joakim.zhang@cixtech.com would like to recall the message, "回复: [PATCH V1 1/4] ALSA: hda: fix controller cannot suspend when codec using jackpoll".
