Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013012.outbound.protection.outlook.com [40.107.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50B279908;
	Mon,  9 Feb 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770626315; cv=fail; b=pHd7PGoT3g7iYBFU7MacDs5vdB5yScms2fCbjcGeM6IJK6EyRHu/uxZEvZG6P7IKObw36NaGSl8ZfR9sIcUTc+/qbucokA4P+EagR+0fdRZx6IYzIMfhh8ghCroyKFvmgvZg1DRPyVBkQdlVk7l3QmfTkO+p4chW5JuAiSspURE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770626315; c=relaxed/simple;
	bh=7rY7uBcRBzjMgMahgTifPPiFmm8FkZ5PV6JpzEbbm6M=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=q1RGQCajUEAYeq3DTKiZ4tkKfRjy8LUEgr/AkYjsge7YFf1zg4y5WM6JhnBOG75n0GuWXcEfruUrA3MfizLXLHKFxO6qLkpIV4Jc4uky0+PEtbCSttaPY0AaPojEXFv+e68XANWLaK185Phq4raOn15crZn9PsuNFWVMUgnkhI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=WEyA9l+4; arc=fail smtp.client-ip=40.107.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="WEyA9l+4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVUMhTMp397NlaP5KLP2kh+q/A1hX4+vql93Nnp9D34rMmnL1J/PwJ1o2zWrSY7j9VLaU3hDQmEEM+UxCsTgX0kEXVPsxeNG9jmdflCDYtrRgw148beJWDTtdXgONtiV8gI9eZ739PR63FBYKZfVFElWOv8Tx932UcdvOdBstweOVOCrFWmfP89QjHNQai3CW3uUkd/KUpS+08UrAQYhSHPUWxkOgzRV3bZRLPmO2MprlabgyelWiLSdrQwYUsU6C/PM073lcmUqRI/eqG9pUcwiaxVQ2DJsH/fbO+hJdLroEyAG1/q2pS+BPoDw9v7TX6679tIgQZdckUwaNJMiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rY7uBcRBzjMgMahgTifPPiFmm8FkZ5PV6JpzEbbm6M=;
 b=TsJwmV4ZpElj+kj2GYVNk0Yz0fH8LcIjN9fAhxKJ6R6G+v/YTm7V6We2cqQFZL19XiEb/swkhde7NBfJlorFy4dCdynFQJqGujKIZdLuK7ivM19wiJ+rWvUlWSqaZyKmXND8NUoO2fQBeETw/7XyV5qmd6Or2MT+mBude9t5wz0cm/YjCiMUubsUZshLgx2LyXJrpbeUWxdgOvTtWEyB6z4E9BG8kl3qmhTwOkD2wOB+LPmHBJae91OAQVKa/jGZkaB1XKQCjB8ITIfNZrnNI/3aMaZy3Fpvz5YfoS5OnzizgjZf+LHj2qy/FEG2D6gzpgZ8kT8zgc3eMd7xBdtDlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rY7uBcRBzjMgMahgTifPPiFmm8FkZ5PV6JpzEbbm6M=;
 b=WEyA9l+4Z+CP5J85EY1595uT3wfcM9xRahvD8ZA31Jab/dtSkhRTwQjhVcnBCU/Iy4T4vJK2qrB1tf1a27tcZe8oTZeX7i8kLmqwIqvsN2Eon7c0Y75KlbUB4/3BbqjKT/dSIejS8S+6Sk3ma5V+pzs5lR7KOIzXyhSLXuyn7JaUW7v0hf2Cby2Ul6pB0JqbRie81d3LC05gJAJgJsSwNf5DjKBhTl4c1sGmtDOkJMyqioa9WpdSwfW58VO/iSgHmi4V0aRMfbytaU08Ka+Tm/eMU2kGWAvfFGo/DFOwsQWVSPX81f+VC+5YQRYJOlCF9GBvFvyT7MPYOnUxDFP2yw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KUZPR06MB8024.apcprd06.prod.outlook.com (2603:1096:d10:45::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 08:38:30 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 08:38:29 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>, "jussi@sonarnerd.net"
	<jussi@sonarnerd.net>, "roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for AB13X
 USB Audio
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 AB13X USB Audio
Thread-Index: AdyZnvAYs5iJc+ksR6+Zx3IA7JWG3A==
Date: Mon, 9 Feb 2026 08:38:29 +0000
Message-ID:
 <TYUPR06MB6217522D0DB6E2C9DF46B56ED265A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KUZPR06MB8024:EE_
x-ms-office365-filtering-correlation-id: 8cddf653-bfe2-4055-3611-08de67b699c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?Syt1RHNzaTF5Z1RhdndrK096TWZ3Uk1Rb0FhY01MZ1FjSEFlK0plbDYvclpD?=
 =?gb2312?B?S0RWYWkwSHk5aVlJSE9Wc25mTC85ZlYrQUpMQjhhODJ5SHZSUlYyTXh1VTVH?=
 =?gb2312?B?WHBuVlpZYnR3KzJlczgwS0dHOEJlRlBtNWpkams0d1VmTysvV1FJdmRyZitw?=
 =?gb2312?B?aHFXN0tRaGlrTi9iUmJJRU0xeDQzMzIyZnJPempSd1FIYnY0VEs5cXRFaXEy?=
 =?gb2312?B?aG96YW4vZDJPOTZtN0dqYVN0ZlpMTlJaSW5FTlIwQXU2ZjF3VE1Bc29BOHl5?=
 =?gb2312?B?cGtJUERlWXRGZTB3N3ZCVlQzWXRPbU00U013bTd1TW9tTjlRRzZTTUFyWE0v?=
 =?gb2312?B?UXdlWVM5bXY1bmc4aXBlZkNPRm9RaEttQjFxMVNpZGVjdUNhb3RkZEc2RTJM?=
 =?gb2312?B?M3hLVWdwQ2lEeHpVMXNJTDFOTkcyd3IzZGIySERncDh3a3EyWTV0VW4wNWxM?=
 =?gb2312?B?UVFZc1l1cFlBVVdUTDNLbWtJaVNEcUh1UndnTGdXVW5BRjNZbHBSWW81MUJa?=
 =?gb2312?B?Zlh0Q0RqdW9neDdDSDN6N243Y21JNkdyMG1qWTB3VERYQUtPdklSNXlQSEhB?=
 =?gb2312?B?Zzh2MTRvcCtHUWVSdjFrdkJaalVaOFovcEtDMHhoTGNPRldDd1V2ZTY3NEJn?=
 =?gb2312?B?eGp5alRXY0p4Ri80Z1p4OHprbmNhaHduZk8wVHdWbGtEbldXRzZiMjV4bE54?=
 =?gb2312?B?SWdYRWJSVGw3RENmRHg2UjhIYVZuWnlyQ1Z3YmdFVnNCZkJ6dmxsL2t6bnRG?=
 =?gb2312?B?U1hvOEo3V25waU9neGlGL2RrdWNndVV5OWt2UzlWMnY0R2lNUCt2ZVkvODcy?=
 =?gb2312?B?blkvcGQ1eEdoVWtxeVJ5YWx2bDZvZTMxZFpNWnZ5MkdMdWZPSTlQVGdJWW85?=
 =?gb2312?B?WVRIZC9JNk15dEhkMlRDQXVnQitNdzVqT2Q0c25TL2RQbTRnUlNWV2JiZlZ5?=
 =?gb2312?B?akg0azFNUmFoWHNsb2RNREI5RzZveGp4MmxmVUVWdUFMSW52QUpIcCtDNDM2?=
 =?gb2312?B?NmtINlVYTnJCd2owOXBDSHptci9VOFZvdUZmQWNnVnRmZ0pDYjB3cFpTWmNZ?=
 =?gb2312?B?YldheHlnb1ZjdlJCNkU0QzA1OGZ2UDNZVzBxNFZ2K25pMjlhYU91YytWY1Vh?=
 =?gb2312?B?bmIyTVVwZ2RSbTJ3MzdSb3UzOTlTLzBXUE5VSUdEenZiYzhtQUtXbVluOGNG?=
 =?gb2312?B?dGpmcGI4K1kxc1BUQzhtcDl4UDJJL2pHK2VpTjhtRXNZRzFYRktzekJVQmVV?=
 =?gb2312?B?TXk0R0pITkdCTVMxK1NkOEFKZ1lVdEpLaU5rZGp4c3pNRjJzY1lKRHlLd2tU?=
 =?gb2312?B?eFdYMis4TGhjSkxRb3BQSjRhZGV0VVNLVzUrcTNPV1krdWtXZHlmMEw1WUF3?=
 =?gb2312?B?T3pkdEVLbkZDM1cxSWhFMzNFcHlLc2lMZ3I2QzdBUUtOeVlYVXE4MHozdVpK?=
 =?gb2312?B?ZjlCcVhMZGRXRkFUbEdkSHg1L2dnSHhhTnRyUW1WeHZnbm1iZkFpLzRGZGpP?=
 =?gb2312?B?dWp5VXFwU25RVU9oM3BzSXQ5NktrUVNUVll2MHZSY2h1alRRWmoxWWFPMXc0?=
 =?gb2312?B?Nm1Lb0JDckQ3L2E0T05wK3ZKQ0ZBZ090U01VQUF5eEVuQTNQYW1RMXhpQXNG?=
 =?gb2312?B?Vy81WDlrRTRuZHEzN21ESGZaWWs0QURaUVVmL1cvMEhxR0pSdFNrQkdLK2dP?=
 =?gb2312?B?Tzk2eVVMQkxidnB1dFZ3dFFteVZvREc1Ui9DOGJibnFtKzk3clZFNmFmMHlm?=
 =?gb2312?B?Y1gzbk1SOVBIRjdnZ1RVQ1lhTmVPQU01RVhnRGQyNS9pZDZRMWhNejRWczlV?=
 =?gb2312?B?UlR3MkRJbkR2NXNLYjJHaUM1V2IwUWhsbkdsdFpWcnhlLzd0VDl2VG1WQnpt?=
 =?gb2312?B?L2ZYRFhudjFBT3RoR0dpTFFUMGdVYk8zcUNxM2ZrUUNENnAra0docHNuS0Ux?=
 =?gb2312?B?eEcrMWd6Q3pSWE5EK2U2d1FzN1Z3YjgyUG4wMU4zVTEvNjdma1U5Skl5cllt?=
 =?gb2312?B?UHoyNlpFeis0MnZYQWZqUXJSdkpaM1ByQmRuWHJMS2tqTHhIZXpoL3k0T2lK?=
 =?gb2312?B?bmFybnh2dnF5SFV6RzVnTGswZzJPZWJuY3dUSEtqUG1sNExHRnA3VmtObng3?=
 =?gb2312?B?YitqL3JleFVuRGVuNTUya2xBc2VBTDd2aW55cndzVlFab093OEtETWgyY1F0?=
 =?gb2312?Q?0qM9C45VZ8IgBuDKAbFBc9w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?bThJdlpLT3VmclY0bFdjTkNhdDJXeFY2aUNqMFJyTWdyOVY3VTVpL0FHTlBX?=
 =?gb2312?B?ZldhUmFmYUorUVdmQVBaRGFLQm5qSFpUVE1nUlJZMFJRUXhXL2NMWTN4eUF6?=
 =?gb2312?B?SlVxUzdrWXpLR3Rab25kci9ybkVPN2IrS3NIako4UHEzdkk2OURjVmxYWTRO?=
 =?gb2312?B?aTlpZmFvb0VscGR6UUxiSGIrUW5UNHNKbm5WNkIrVy9EN0xJYTFqdks5WGhn?=
 =?gb2312?B?a1JueG55dHBmNW5pUm51N2ZPc05zUEZadko2TlQxa21xNU52blFKVHVzbTgw?=
 =?gb2312?B?TU50Y2NmK0xCdjhBV2lJenFCeFdoUk5qT0ZzdWNFTm80SmJtQW5sQXVzUG92?=
 =?gb2312?B?UURUUXV4UTNRVWhRNzNrUDVZZnJJb0RBampWWW1GamhvZG1KVFU5QzFnUTZo?=
 =?gb2312?B?d3U2UkpScUF3eGI5K0hxL1lnUUR4NXBrdEpaZVlwOCt2d20xOEhia3FYSGtm?=
 =?gb2312?B?V0ZXSmR3aXJ4ZGp6bG00OVlhMzVRN21YbzN3MFgzbE9lSkFxUVZGeEs5RFVi?=
 =?gb2312?B?b2Q5QWtwNlRhY0xLakJwbGNzeWdhbTRUWmt1Z25MTHlPWDRyUjBjQjBqTW5N?=
 =?gb2312?B?NmVpWm5tMVlzcnV1L01ZcmM3eXJEcUNrRkRoUVo4eWlUMGI0S05rUTZmN0k4?=
 =?gb2312?B?WmlXSXd3OFB6OFkzSWg4RkxuZ0JTSHdxeWlJL2Yrd25leUpxaVJxZG55MTZH?=
 =?gb2312?B?RTN4cStWQmtCaWMvMUFTT3A4MzhmMVc3YkVOMVVUbVY0TFlqU1VpWDJ5VUpN?=
 =?gb2312?B?L29EZnYxZXZyOURvMU9QVXV3NWMzMUdaZ2tlU0hlek5pSnpHbDlXS0NOYThy?=
 =?gb2312?B?eFBuOWhrdmlXTzBocXMrVFgwNnBwc1BZUXhnM1FVVXFkUjRMMExPOFovMXJy?=
 =?gb2312?B?RUhPb2RmdldlK2tCT0c2Skd0RHY0U2ZUaTZxOGpsbUtCZWVkVUJuem9Ya25W?=
 =?gb2312?B?NUF5eW5SaDc2bkNWOW5VaXlUSlg3MVhjSVVMWXBRVUVlUkdqMUF5OEJ3NUdR?=
 =?gb2312?B?MW5xRGpQZndLS3FpejZUR1NFcHY0K0Z0S1B1eER3T3U5UktMNG9aSDNIdlFr?=
 =?gb2312?B?TmlmUmhJcCtjako4elNiNVZ4dXY5dXdVWTV4RWpkcmNFNFNSdFMvN21tL2pN?=
 =?gb2312?B?Q210UnN0Rk5VUHdwdDg2RE9zRXVpcWltT2t4czd5REdqOC9yYlUyekM1Z2pi?=
 =?gb2312?B?YmdzRkQrMGMzMnpIRlFSNDZHdENRNzYrUlZLQkQrd2NDUlhaTTZWbFlvd0sy?=
 =?gb2312?B?dk9TU3M3M1lwV1poSEh1TDU5ZVJzSzEwV1gxWlZ0R244VzlFdHFnQVE3ZTYz?=
 =?gb2312?B?NXJlZFFCWklCZUZESmNlZDgrSWF0V25UK1BmbCs0ZnU4Y1ZhSWh6eVhxWU1n?=
 =?gb2312?B?NnU2b2VVVVZwQkE2dmhPZUppbEJuS0JRYkVTUW95QWkxdzNiMHRnZTd2WDVS?=
 =?gb2312?B?UHNyVFJGU3VOTTZrZGw0TVkrc2dQQUZacW9kUWpqQkxhN0F4eHJyVFIrelRL?=
 =?gb2312?B?N281bVQ3NDhJY043VTU1MHVjVFpacWRSNEIvVDFrWFV2SmEyTjU0QmFlWnJr?=
 =?gb2312?B?d1hoYnJvblpoUzhvOU1GN1hMWDRqV3ZnUVdyLzloWUZPNUxZUllBWStzM25q?=
 =?gb2312?B?eEFyb01iNmZseHNGaGljS2JtdUVCSXJiWjRKL2g2Z21SM25xS2lZWTgvSld2?=
 =?gb2312?B?L3hxaEJTd1lqYjJUWWJwOHl1RnFLamZ4TG5jV20yV2RlNC82bW1ySXorcHN2?=
 =?gb2312?B?TUxMMGxjcS9qY0t5eC95c2RQTDdKbXRzUCtKSWlEalhkWDdEZTZvRU5jcDJx?=
 =?gb2312?B?dGR4b0lVOWVPMDllcE41Y3lYWUJvMFFaOUI1aVgrVEV3eUswTVI4K1ZsWENC?=
 =?gb2312?B?UzMyQjAwZGRGY3IvR1B4UlpkZFkzdzFtNGNRcVhZK0Y4SzBBQVIvSCtmVEow?=
 =?gb2312?B?V1cvOHFhdDV6N2hha1MvbW8ycHMwOEQ4SjZIM0hFVzhhS0xZUENpaUZFQ0tM?=
 =?gb2312?B?WXFHN1RUSW5yRitTaHR4M3o2c0l2ek9lTFBnYVpGbm1nNGpDNTNGcUtqR0pN?=
 =?gb2312?B?cWVBbW9Xd2FDRGNRVVZuNmRYTFhGY09CYjF4TDNTMTljNjNpanBMekNKNXd2?=
 =?gb2312?B?dVRDZ0FydDJYR2lPZEhMSEUwYUdLZUZQMVBPMndlSVVJSHBOd05pUHRrS2Y1?=
 =?gb2312?B?cVcvbWliZWpGd1FYUTg2NFJGN2FFL2k0QUJQLzBGOVJ3VXpuamRhTmlOZ3g1?=
 =?gb2312?B?UzBHTGIzbmlCeHZaeGVGdEpFZXFhNThlU0k1aDBLcjJqQXFNV2YzWlN6bmw3?=
 =?gb2312?Q?SiHo46W/U/ANUkeYOJ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cddf653-bfe2-4055-3611-08de67b699c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 08:38:29.4859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FMM2MTHHZPRzjZOtyPrVMTHw89i3wNyWdzXqA8met2o1EdeLYTviBbwJLrhHATidwukPVLsmi+Mjd5ceH+zCRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8024

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRv
cj0wMDFmLCBpZFByb2R1Y3Q9MGIyMQ0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczog
TWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IEFCMTNY
IFVTQiBBdWRpbw0KdXNiIDEtMTogTWFudWZhY3R1cmVyOiBHZW5lcmljDQp1c2IgMS0xOiBTZXJp
YWxOdW1iZXI6IDIwMjEwOTI2MTcyMDE2DQoNClNpZ25lZC1vZmYtYnk6IExpYW5xaW4gSHUgPGh1
bGlhbnFpbkB2aXZvLmNvbT4NCg0KIHNvdW5kL3VzYi9xdWlya3MuYyB8IDIgKysNCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9zb3VuZC91c2IvcXVpcmtz
LmMgYi9zb3VuZC91c2IvcXVpcmtzLmMNCmluZGV4IDJkOWYyODU1ODg3NC4uZGRkMzQzMDc3MDk4
IDEwMDY0NA0KLS0tIGEvc291bmQvdXNiL3F1aXJrcy5jDQorKysgYi9zb3VuZC91c2IvcXVpcmtz
LmMNCkBAIC0yMTQ3LDYgKzIxNDcsOCBAQCBzdHJ1Y3QgdXNiX2F1ZGlvX3F1aXJrX2ZsYWdzX3Rh
YmxlIHsNCiANCiBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9hdWRpb19xdWlya19mbGFnc190YWJs
ZSBxdWlya19mbGFnc190YWJsZVtdID0gew0KIAkvKiBEZXZpY2UgbWF0Y2hlcyAqLw0KKwlERVZJ
Q0VfRkxHKDB4MDAxZiwgMHgwYjIxLCAvKiBBQjEzWCBVU0IgQXVkaW8gKi8NCisJCSAgIFFVSVJL
X0ZMQUdfRk9SQ0VfSUZBQ0VfUkVTRVQgfCBRVUlSS19GTEFHX0lGQUNFX0RFTEFZKSwNCiAJREVW
SUNFX0ZMRygweDAzZjAsIDB4NjU0YSwgLyogSFAgMzIwIEZIRCBXZWJjYW0gKi8NCiAJCSAgIFFV
SVJLX0ZMQUdfR0VUX1NBTVBMRV9SQVRFIHwgUVVJUktfRkxBR19NSUNfUkVTXzE2KSwNCiAJREVW
SUNFX0ZMRygweDA0MWUsIDB4MzAwMCwgLyogQ3JlYXRpdmUgU0IgRXh0aWd5ICovDQotLSANCjIu
MzkuMA0KDQo=
