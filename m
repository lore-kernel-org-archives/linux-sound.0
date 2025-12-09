Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012010.outbound.protection.outlook.com [52.103.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614263B8D47;
	Tue,  9 Dec 2025 05:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765257492; cv=fail; b=EMb8Jg+BYBFKFZF2GhTcObtHT6vqrh1+Y8EgC1SPGFdiGlXqYX3lHkV3CNaCtenX3jFIsVnc/hx8OnSGQB8FeBaiHnZvNitLQwIx2VlKLEPRoVnIP1+Dv4mIjUW4E6fCNHv42Tsl36QTWeajH31nZgVS8tMCJIn/4Uh59vG8N3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765257492; c=relaxed/simple;
	bh=WOulJiZTlcq8xLe9bwDsJDMIY0BwJZFhJTaXr7uvDfo=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=AK8bPs2IOJAjegEwKnwHjd3sbuZFQvCl6MUGdL9zxfruhKfnNW9TUmxomgVet5vFZWyYHUG+KGhCeN1kbBKfATtZU3P2XUnKR2oQzTrEAtkWTfazGb0GnpAjPEkP9ajiYS9nWrBTIFyXXFKrZ55No5sWaSCR/NitMXa0p3tOH4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=PFgwejmW; arc=fail smtp.client-ip=52.103.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="PFgwejmW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBPYj32XoeaSN4Ok99dHVDKZVGKelr69mRlfmNzroAQ9k3qaRYtDaHEwtP5KwpOnxmsB1Imiu3vo/s4TtImsitBLYG4aR/x0vLWxgeJsQDSmrFfYvJIiTf4W7IH92hFopgbnqpf6KdB60ynd1yE2LymaqFW6WldTghnc5QPJBA1MKDrhKw9Gj2n3pL17Y5WYCFcw1IlKKkDbUWA1Tp+3/9VpJATJxY+X2xmJi1LLM5S6gLHs/k6dzN7125kBhUn2ovN2UNZW28ac3uGbRC71jlvghtDdBH9T97PGXRdaneCiXmqFWUCBNnJEmHcUVPPSEdTR40ohkwSbXuyyhjOwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxbuM0gyB8QbLtcbj9SPXd3nz4OoH9CEPCCzQX4jQkg=;
 b=LT3JR51Cs6TBrMPRrwBBxwX/FCtnAAF64erM1CVNVN7c3K0zVlZHoQHjYuiESXPIIQYwE4I3HijmiBZXBzfxLruKniG9w+Qrp4osn0EGIQIbyIlcNTze8jby3OLGQPxhFlZkQpY1BC25gttdrHKA3hUQh96zllyFieflTq3kg4Dmg/uove2DrFombUB9jiH31IpJVW1K7FFZRQwkkRm9V0UErT38VPbrhGaPafYAYsLMToUWbB+hMS+CP82hQf58qbiGEbHjCXGoaEeXP/fdQVOx94UxU98DrkNWKDah8/V26Oj1OzcJSV1T2rMIsrpIpWQbKj5h51v/jklLe8VbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxbuM0gyB8QbLtcbj9SPXd3nz4OoH9CEPCCzQX4jQkg=;
 b=PFgwejmWYkumMsReL8jt2KL/rGZb4JGnZI1FEb+0ti698dd+YdtfdKCTASdDRZ6ZR2X/F7uQo6f0rN4MIbmioU1bSSyuVcvpYTToTT10pRS5LxBupx22VLhsIFlUIJ9A659d1na3c5zfPFbw7VrK1wlaZpHrIe6zZdaXh6Rt25657of0bvJyHA14iTYzzhZJC9qw0i7+JOXVMffcGNqinPdsvK9CV6HddMTAnlE/jZV4emD1d+fxMVbTz4xNfxSoZ+Y2iQD8L1r6Dt7SORE2/X7Y5CkVYrj6lsLutXcnOnT1wk8n6FStQjyYPpP6IGQP0q9QxoUXq87j0cK1YR5MSQ==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by SY4PR01MB8198.ausprd01.prod.outlook.com (2603:10c6:10:1ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 05:18:05 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 05:18:05 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Tue, 09 Dec 2025 13:16:41 +0800
Subject: [PATCH] ALSA: firewire-motu: add bounds check in put_user loop for
 DSP events
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <SYBPR01MB788112C72AF8A1C8C448B4B8AFA3A@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIALiwN2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwNL3bTMitRiXSOLVEMLMyPz5GRzSyWg2oKiVLAEUGl0bG0tAEKO6RV
 XAAAA
X-Change-ID: 20251209-fixes-28e18627cc79
To: Clemens Ladisch <clemens@ladisch.de>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=WOulJiZTlcq8xLe9bwDsJDMIY0BwJZFhJTaXr7uvDfo=;
 b=owGbwMvMwCVW+MIioLvvgwPjabUkhkzzDa/lN+bEHNvb0ZjTFTK7x/iQ3c7LZxcylycYm81r3
 2oVErq7o5SFQYyLQVZMkeV4waVvFr5bdLf4bEmGmcPKBDKEgYtTACayOJ6RYYtp8LkfE27aq06c
 PuPK+7Ib02qKi3TVN214+LJqLW/ucXFGhhmN/p/7jxzWnlmtcOhSd8wCrd+shw6cWHFMgDvyguQ
 tAS4A
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To SYBPR01MB7881.ausprd01.prod.outlook.com
 (2603:10c6:10:1b0::5)
X-Microsoft-Original-Message-ID:
 <20251209-fixes-v1-1-771a6715a399@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|SY4PR01MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: c55216fa-45ab-48ee-c973-08de36e25529
X-MS-Exchange-SLBlob-MailProps:
	02NmSoc12Dc6c3c4/rztiZGf6bH6e/ZCobJ03aQTFXB/c3MTn6IiUMlI7rPnhCs4Fq9gfSgoXvEmr6Ad2wPLeknUlA6dUGqctok/NMe6OXeWADHycO/UZa3SB5lvrcvMoTsD4IokCfLEBndn23HG/u5EYGC+45n13tLNZoJ3KlQPUYNp9WUNSQEFpw+6fH1sNXeAPq+zbMi+FqBfkqs/ugJkJd7bxDn3QdFBhne8re2S+34LO08u0Z309wlVjmRF2Rc2rAAXcXEVvHDkWu4oProJbhcOOBNdbbwyYxumHLwfQvbK40DkYzjr/mSVo0kTtLoodYf0IbF24zLeNBea7FnKturclIqq+9oXvcaQqrP2qd66F8sKAyOJdcd+2zkmhUFLEj8LB7uMEnTTR4wsVDaG2y9ZGADyeg/rMYbAvFyzGfdLg7hJlYS/hWFr1QejfA5vHqNjknTk0YDES4JlbsPtdxvV52FJxhU4trKMlsAguWiyFWBWD1+03R4SkaTSujQ9nTxDwYdswv5j+wAxq+IKS/WUr9/vRRpaJRmOrzpuFpGSvbah/9uUf9aUgXeXpf4Sj1ydOoXedlubeFep1nOpdNV2lteqPS8nVJCp4rZRWSz/wlmKJgejj80z+hRmnyPpbiJsg1OL69a+kEadckeT2LDfLrttiHrb6XYclqZGr2Ny5/FZGQE0G8UxvkukVXXWl2PJnwAqKLiFki5C76/ZRPjMWzKemrBiUOHEqoaUG7e2d1bB3q4L4fJJS/mU
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|15080799012|12121999013|5072599009|6090799003|23021999003|461199028|8060799015|19110799012|5062599005|41001999006|3412199025|440099028|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2dXL0lta1VuQWZLdC9EUjd3K1dGWWc5WGE4KzRpQzNsRURONnRNeHgxVWow?=
 =?utf-8?B?TS9vRzFXK3h6STZNWk1XWWhPM3U0S3hCZnJEa0RreS81cWFiYVhmcVd6aHNI?=
 =?utf-8?B?VU4zZVkwdVVxcnpkU1NXZTQzZjc4SnJDSHB3c1I0di9zWDdyaFcrOWRxMnJw?=
 =?utf-8?B?SG5mUU9zUCtQQVFIOXBxRDQvK0plcXBUd3FDQmJBTEs2VnllTTdTRFFqb2JI?=
 =?utf-8?B?MCs0Q203b01YWnFLcmFmTGtDdXIwbWhGQjg3UmF3M2ZmSUptV3pRU2tvSzJC?=
 =?utf-8?B?K21NdHhmSjJOeTU5S0VBc1RWUGZvT0Z6NnlFRlRhNXZoQVFzODlxTlM2bjln?=
 =?utf-8?B?TmpPR3djbWNuTTljaTdVclJ3cG1Fd29NV05CcEt1VUozcXVPT1NZNHo2WEJF?=
 =?utf-8?B?TzRDMDkyTWZQRXNpSm1JUEJLY3FTRDllcG5ZdnB0KzFyMHhrNFZRM0g1U2ZS?=
 =?utf-8?B?eHQyZm9kcjNHSkhhUUdqNzlBRVVSS0REOUVOcmVzUkZEQTQzL2llQkp3amsx?=
 =?utf-8?B?YjZFQ2hUZEFtMG81SUsrdGFJL2c5aCtzZDA4MXJicWMxdGVGVXhWa0ZFVkVN?=
 =?utf-8?B?VXF4WHQyd0FMYnY1TGNoQmo4R29QV09JcTJJcmMyOFQxWW1pU0prT1BnNmNs?=
 =?utf-8?B?Y2xxYXRXMndkdmxYVWtEN3ZnWUlZZEt4L1BHUi9nWDBOUTZPK0VuTVFraENh?=
 =?utf-8?B?cjFjcVV0Nmx5OXNKVWNLc3pJek1RSVR4TFd5Y0p4N1lqY1BpRzBuMWdhd0ZM?=
 =?utf-8?B?dGdad2Ryb2NPWC9NcVJpMFY3aUVDd2xhRkZPYWl4Ry9pMHJPOFRrT3VsTExy?=
 =?utf-8?B?WEdxNURIU0NRemIwWXMzazlEUWU0N2l3L284Nlk0OUVEMnB1QVRXaFBWRHdZ?=
 =?utf-8?B?NGVBdE9kb01GbWU1NjN2ODkrRFk5WTlmdzMwSGt6cGRIenA2MzIyVVhaWmg5?=
 =?utf-8?B?S2RqbkFzN0VWN3lJNjVsT2lVU3h6djRKSjNJYWswT1lJd240WjQ4eVNKd2dS?=
 =?utf-8?B?L0F5eFlvYjIvRHRMdktQY0pCZHF2WGpTTXFwOW1uN2FUWXRXNEk5ZEtzNXBJ?=
 =?utf-8?B?WnZrZTM4djNGamNqZXlRcDJQOHVmRXMyeFRBMkhiZ2htSmgyR1I4bk1pMENi?=
 =?utf-8?B?VjMrb2I4akhUUGZRMUlTTzZqZnlwWU5pc21IckZOb2MyM3BiaFpNdGltWU9K?=
 =?utf-8?B?d2YyR2hEbklEcWVRRnRRQUt0L0NBTnlmRGVNZ1lzV3UweTh5RGNyM25mQzJ1?=
 =?utf-8?B?RDRKTHQ4aHdGdkNCaEd3MGlDMzdreXA1QWpNbmk4aGJOZDNVVm5nc1FXWUVa?=
 =?utf-8?B?bFB4ZnRTRW02TllzbkV0UEZueW9tR3B3Q3kreVNvaExNSHNyaDNBNzJxRnNz?=
 =?utf-8?B?cUJNcWVQd2tDZEZwak1lY2YrZHBjQms5bTQxUzJyTmVFQmZlL2ZTbnZTVlhv?=
 =?utf-8?B?WEczVVVLQmVDeGM4amJKSlUyTmFVZnh4eEZTdmptalRncUVCWjBHOWFmVC95?=
 =?utf-8?B?V2lJcWJSa3grRUFYbkIwZ0VQK3B3ek1uNTZQdDVyR01RR0NLazdpL01kYTF3?=
 =?utf-8?B?eUY0MmJjc1h5SDkvbU02d3VkVmZDNHY5SVoxVkF2WXdlUzBJTkhBd2pXK0cy?=
 =?utf-8?B?QWw3M0RvMDRkWi93eGxKa2NkR0tMbllWTXVYSG03SEhQY1NCam5vUGxDMUZh?=
 =?utf-8?B?dThoMVQyRkEvZnA3U3NxRDZMdmZtWC84TXJPdk55KzF0Skd4UXgvckI2Q3Vi?=
 =?utf-8?B?anR2Q3NheW8xRnd5VnJveDVxRjNqSEhlUGdFMXVweWNyRzRBMVVicDFjY1dJ?=
 =?utf-8?B?NTB4UXNqd1NocVdvS1FZUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTIwMU55MU5kdjdqblE2UDRZdnp4U2NkSnQ3MmJBeldHR2t1b1JnUlBEajhn?=
 =?utf-8?B?WTlkTG9TWXQ5V01GZ1BtaVBpL3hhalMxOFRHbzRRU0w4NGtZQTZpZnRNbU40?=
 =?utf-8?B?VWpqdTFMbmgyRm1LSzNOZ2plQ2cwc2RpQjhYck9uOXVIZ3NoSE12T0hnT1U1?=
 =?utf-8?B?aVRXZUxmZW5zYXBZb3JoaGowUEtqRlRmeURZL3YrdVVqaWpENWJldTFlNWdq?=
 =?utf-8?B?aUVaZGVZYlFKaFE4d2NhOGNEaldETjcrRnNWdGhob0RrSGdtenVTZmUvc0Jm?=
 =?utf-8?B?VkdzeUJ3enBXLzIwNDZtQk85Y2pTRDlmSHVvbWpmMjdDRUFBYWY2ZnUrMVlH?=
 =?utf-8?B?c1NxempXSTJnR2dsUit0aVgvbDhDcHliN3NYMHFvUFZoSklmL3RyYlRmZUla?=
 =?utf-8?B?WERlTUxPNDkzd0hBdmJGLzdQNlUvKzF4ZjFqWDkzbWdMWmdFSlRGVHJPdEhv?=
 =?utf-8?B?RndQdXJHTm1iNlJsdS9vNC91bXFrVUMybTlJanRiYmZlMlRrY3FFdlhSQVd1?=
 =?utf-8?B?N2oxS054TEw0YXVraWQ0Q0RkNzZUbEZ3cS8yODQyK2o5Q1N5VUgzdmE2cW5T?=
 =?utf-8?B?eEFYNkxjU0dIUksrTzE1by9LTDNHemVpYWJPOE14V3k4djB1dDcyb1VvWFYv?=
 =?utf-8?B?UWJFTXhjMmc3VmIraWVGRFVEL2M2Uld3QVFQZ1pvQ3ZUMWlhcHlWa0pHeW9m?=
 =?utf-8?B?dmNmRUpkd2NDamM1bGE0cWJJSDc0TmxEOGxFclhaNmFiVmg0SWpuS3BJYnRt?=
 =?utf-8?B?Z3FtUER3K1JISkRRdnlleUxncVF4VGRCMVpRY2hOUThEVXRiZWdIa1pNNUFT?=
 =?utf-8?B?Wm9ES2x0amhWRDkyQmRHR1YrbnJOTm5DaUJUWitlOXJIZkd0VXU2WkdwL1Nh?=
 =?utf-8?B?dUxPOEtPYXdsUXEyd0FHT0FTQTlXeEtPK0o5RFBVMUxNRDFQb1NkV0k3ejRZ?=
 =?utf-8?B?NVZiYXNVWUFINzJIRXJmQWJJek42Q2ExaXQ2NjltQmdyTThNMWhEWEtnQmsr?=
 =?utf-8?B?b0g3cTlMazV5VWpzUDN2K2E4U0NIVDR5VXJHUGdhdzJsVTZReDB0R0k2S2pP?=
 =?utf-8?B?N1pjOVZ3OStNb09kSUowVUJiaFUraStMenkvOGRpd0NzWDRDQzJLYU1ZWUE5?=
 =?utf-8?B?TFI2b3VsS0YyWlBMZmd1cnRhMkZkcitWTFhNbjY5WTJZMmJRWXlpUFVJalJL?=
 =?utf-8?B?TTJYZGJ2MnVJQ3BtNkwxdnpQZkFEZFpSS1FMb2NZTkkyMVY2ZkFJNUsxQnpJ?=
 =?utf-8?B?RE9xT2tZSnlMZkdCTGc2eEYrK24yVDdKNlZXNit0V0VUekcwQ29PKzlkTk80?=
 =?utf-8?B?S0syTG90TlNObGl2UmFrZW9NVHY5UkJZcFJGWCtIMDJQbjlrTThFTXBzMzE3?=
 =?utf-8?B?WTYrSFhlQXVpNVlKU1JHZm0zTkF1TFUySWc2SFNMOEJEZGI1d05DajdFTzYw?=
 =?utf-8?B?NVVpNXhtOHRGS3YvcU4yeEE0YWd1R3JjU1VwR2l2cGdYWWEwVlZXUDM4WmZH?=
 =?utf-8?B?WXd6RDE3dkw2cDN2Y1d3VXhqOC8xUVBiY0x2cEx5Y1AvZ0RBNGEzbjBCa1V4?=
 =?utf-8?B?akxlNFBRcjRybFVHSGtzd25aOUFWNFlVRnZCV3RxOHhZMWMveUpiZzl6Z3Nl?=
 =?utf-8?B?bUxQSk1mbWFNdi9lUzkycVFwSFVDMXBmODlaWUxDQkw2dmdNQWRmUFdhc1Yv?=
 =?utf-8?Q?HLcFKh43aqcgG3DgCxU8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55216fa-45ab-48ee-c973-08de36e25529
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 05:18:05.5684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4PR01MB8198

In the DSP event handling code, a put_user() loop copies event data.
When the user buffer size is not aligned to 4 bytes, it could overwrite
beyond the buffer boundary.

Fix by adding a bounds check before put_user().

Suggested-by: Takashi Iwai <tiwai@suse.de>
Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 sound/firewire/motu/motu-hwdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index 6675b23aad69..89dc436a0652 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -75,7 +75,7 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 		while (consumed < count &&
 		       snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
 			ptr = (u32 __user *)(buf + consumed);
-			if (put_user(ev, ptr))
+			if (consumed + sizeof(ev) > count || put_user(ev, ptr))
 				return -EFAULT;
 			consumed += sizeof(ev);
 		}

---
base-commit: 210d77cca3d0494ed30a5c628b20c1d95fa04fb1
change-id: 20251209-fixes-28e18627cc79

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>

