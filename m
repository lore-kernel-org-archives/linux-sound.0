Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012009.outbound.protection.outlook.com [40.107.75.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF0C363C7F;
	Mon,  9 Feb 2026 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770629215; cv=fail; b=gqe+q+Yk4RcLtp6ZFPMYMEQkHWhzilhjmWpgWszoEIjbdL4Mj3JpUWAW4wIaPShEe8DTokRuUnYdXsYMQt8Wy5BY1NsvZ0RfcyCFN+jb/pC3yz+n9/waGzF6p/FKA7wWA2dhW+W+pKCWR+QYkkXukpOCBuhPUrAe7Cu5ZDJ55nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770629215; c=relaxed/simple;
	bh=ixSB9ZtOnMzbNK1sSl9tx0qptPywx8kf4FCepFDO7Uc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EMfBBTNGlwWsaLLwgN1ZYnIT0P2HFU32xu5xWmSw7t/UIsMFjtJDr92CCvfm2y5xR05vFP6GjdmG4IskhzLBpavieLwiwl/fg6dro2T6+s+1NehfMhEKOSgGW9dOtoHqusf7L7hKAP6dl8ZbRsnSfM0jiEtbCBGbvecBueDLfY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=pOVqlokQ; arc=fail smtp.client-ip=40.107.75.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="pOVqlokQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otZnBdTKKXnEDazARWDrID+Uv+7JvhdkJ/M1pqUDo2XefxK4Leu9aQ/TLcjtxOWM7bG+EQJswOX3NmUZDYwSGXI6ZmHl8MGLL1wcNCLzLmC8YXIUaHsWru5rl+n+IIMNj3A/WDr45KZSwxrdF8De00DTIelDykzPXBrrNQzKHQy/vZAlmM1Iy9YeXAEmxnI6VpyEUGANb5udSM+kB8sJ53q7DnWv2zewFkzpCEOSs0Jh52FKUcnE1uNLNA+eDPlizTYRIcIcRbvHfKCY4T6iW+qo9YPHWwp+peg8x8jZDoLMUjAWM3x0yBR9oIG7g2neunRiZWeaczav7i42NtmiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixSB9ZtOnMzbNK1sSl9tx0qptPywx8kf4FCepFDO7Uc=;
 b=vKzfC3oQSbOUAQn8szR0W6jIwZERtz6/vYe1Tfa3XOPqb7KV1DUizM5qInBkMzoGQ8dRFKjtqDYe8qqVpojDteTuI4U8hPayhAkuTMITizwxQv4llZKoOpCTtBLi/HlFqZr15zxjJKpCEuNAvAivFuSKjHSRjR4K36hF/jPFQi+GFiqdAEVAK7Z2GkR6cPAI3JnpBB4L6SYkLrC6U9jTZ1ej1fVjL/7Dk3yscuiJ7ud8UYH7DeDgF1+PWQBIkfRRhBLE+GU1KSrVl6TzUiMiNy0PwEtkXkO+rjfv+ead1dxkp9omSDxhJ9UHcJQQJGC7EioPe8/jcD/+xdP7WpE90Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixSB9ZtOnMzbNK1sSl9tx0qptPywx8kf4FCepFDO7Uc=;
 b=pOVqlokQWvj8RhhJsdcfSDib4EiQjie0/LSablU2qp5LpX8/MCpwEF9kR4BSsBEcEfO/nXbiJZ6FE62bnkASXZ4NxQHITB6oewEXhtr2uZyDlnE9lBi8UgNd7zIyR8XLygEm4cyxLoJAS5fIDfxPC1VX/ub1PF0vyhZBR9VvDLQ+q/9PHxonefwRhjCFgK4jRo9fndVFmRVyObvgnfua9n+KTdYw84wUZqkactBR23aNdFbiuWFFu3uSASyrX2hc8yvdtPGEht5OBN4W1oLuwnspYwLcIY8PHcg3HrzQQcmGsf1wQcZUSFjFznn2SSzKVKyUBMb+0yUuQCJtvYjdCQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KL1PR06MB5969.apcprd06.prod.outlook.com (2603:1096:820:ca::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 09:26:51 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 09:26:50 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>, "roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?gb2312?B?tPC4tDogW1BBVENIXSBBTFNBOiB1c2ItYXVkaW86IEFkZCBpZmFjZSByZXNl?=
 =?gb2312?Q?t_and_delay_quirk_for_AB13X_USB_Audio?=
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 AB13X USB Audio
Thread-Index: AdyZnvAYs5iJc+ksR6+Zx3IA7JWG3AABkmOAAAAtT2A=
Date: Mon, 9 Feb 2026 09:26:50 +0000
Message-ID:
 <TYUPR06MB621791C06D1E683E87FBA590D265A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217522D0DB6E2C9DF46B56ED265A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <87h5rq2s0g.wl-tiwai@suse.de>
In-Reply-To: <87h5rq2s0g.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KL1PR06MB5969:EE_
x-ms-office365-filtering-correlation-id: 0d24afd1-0cc1-4801-5160-08de67bd5ad6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?UnlJd25KWk4yakZyWmZ0V2d5Z09xSFVKWHlEZm9PVGttT1NiWUYvb3Vpblp0?=
 =?gb2312?B?aDJVbW56T1NhY0xDWW9DRnlVVHVSMG45cDhQZktPWUdabGVkOGpDcFJLNmhi?=
 =?gb2312?B?STYxWmVSWElSWXBWSXpPc2lha3MyZFhQSWRmdG5JUHorSjhFVkdmdVl2VkhV?=
 =?gb2312?B?MnJmbnlKODdiUjFmdUlhdHRQRzV2dGFVaDRNMW5uM0FESW5CeE1uVVh2UEg3?=
 =?gb2312?B?TW1SNTBYaW9kWE4rVk5uTTZCSWl1WW03d1BNREUvbVB1U1RyVEVPU2ZHNEdH?=
 =?gb2312?B?V3NzQXZWMU41ajZUREtGN1pMbjdvb2gvUWlaQjNvd1JDSWtDL3NjSXRXTjJE?=
 =?gb2312?B?NG4weHl5dkFlSFhLa0pHRGJUMGRGZ1Z3NjkrVUFKMFRIeXJSa0JyOUtSZ1lG?=
 =?gb2312?B?dis4NjY4c2hHUGg1UmpNN0taMXk2NHUwUnJJamZvUldKUjhVRmc1Mm9pYVJs?=
 =?gb2312?B?SzFRemxVVXo3cXZWak1IUG0wOURMcXg5VVA5TmsxNTRjREFyLzI5ZmdiTHMx?=
 =?gb2312?B?ZXRHNlFsYlgrTWpucjA0L0tyV2ltRVhlS1gwaXh5cHIyc3NYM09nVUZZM2tF?=
 =?gb2312?B?QjVGS0dLdFJ5TXhCbzBTenVTenFLNHpkNkl1UmVBRWdrRkYxYS80Q2ZBM3ll?=
 =?gb2312?B?cXFQUmR1SW5ILzRDK2h0U2FIZ0UwQnUzaDNmNENzQU5OZzd0MW9BNTlNRFpB?=
 =?gb2312?B?VWxWVFlDZUozV3VDN21ZU2R0ZVZTWGdEUHBZMHl2bmlPeDA4SHg4anhqOWl2?=
 =?gb2312?B?a1E5MjUvU1BaKyt5QzlJK2MvazRSTHdFWlJFU2hTcHo4cTNWTk9mYVgvUE02?=
 =?gb2312?B?eEcwcW5lK1QwOUZORjdqTmtIUzR3cExMcE9HVGtocE9FUGxiWlhRR3R5L3lw?=
 =?gb2312?B?WU9zaDcwaDdpZGRlOStEOEtrMnI1ZGFlV0N2ZkFwRDRFYzdHbml0MExRZlQx?=
 =?gb2312?B?RG1FeHF2T1RQZzZLdXRWT2JSbFg2dlVtU24raUh5WXpDc3MyZEtTNjQzSjZT?=
 =?gb2312?B?TEZaUkptMCtWb3RORGoySDN6UWNaMTZaU1IySHN2VHJIMXNUUU5GQkpnNFNR?=
 =?gb2312?B?dUQ2UTI0bkwxaFR1VFpPRG8wdTBRZnlUNWcyNThnWHZMcTNMZW1hdkdxc0w4?=
 =?gb2312?B?eGxtenBjWnhLS3l6a2FzeHg0dU95ZlE1UkFEM1h1eHU0S1Z4NjdlSElGczdV?=
 =?gb2312?B?V0pnR090WXo5MEp2TWl2YTBnaFc0MW1qZ1ZvdFYxY21NKzBndXlhTjlWaUtZ?=
 =?gb2312?B?SDlOUU1XRTkwak1oTDdldzFBRTQ0MUZDNE1zUWl4S1dGRWY3SVhYVEZHWHV4?=
 =?gb2312?B?S1FpRUl4anhDaHZma3dxbVVBclRqdnhESFNWc0hYc0tiYjA1aGF3cC9JTkdn?=
 =?gb2312?B?blFqZUQ0NE8xQ3h6ZVBGOEJhVlNkaURob1N6NmpGallZWW9pTk5ETWVKODRw?=
 =?gb2312?B?T3l2ZUJYNEJMM2tOMzRBRnFVOGNJS0hYWk5XbEVZTW55cC9ZVzVwTXZGU2xS?=
 =?gb2312?B?akdFZ3VTQXcyemVicTI4eE9aUUZueWtaOEI5eHdnZkpuUFByMzluY1QxRmIv?=
 =?gb2312?B?KzdsYXc3ZnllZlcvVm1uTitsZVlwQ0tUM2ZXcmU3QUdveENjTUNqUm1mK3F5?=
 =?gb2312?B?SDE2WkRzazdWbWQ0Skg2VjVNU1hLa0R1VFhvdkQvQmVvWWNsTTU4cVBkOUVD?=
 =?gb2312?B?Vi9wWWRSYjVlOUtyU0R2UFZOaVdQaG5ZYjZoUUhaUXYzbmhFRTRtRmJ0a01r?=
 =?gb2312?B?d00zaTdaMy9RSjlUQVZVVEM2Zy80SkZhRVFtQUtPNjV1UFFKcHdqTWRURkY4?=
 =?gb2312?B?Q3BpTmtOZTBoNUdqN2ZXVG5FakZUcjBsb1crVmhJVm10K0l6Y1NMWHFxYmI1?=
 =?gb2312?B?cm0zeUpqTWhNb2diaEpQKzJkU3E5Z3FZbUpJTVBscE8xdlNPZGU2T3BaQnBu?=
 =?gb2312?B?UUc4TzB5by9yUXJycXoxT05nRUdEc0xwRm13MCtqYWk0Tk9oOUtXV1FmZXJE?=
 =?gb2312?B?bExRUHh6SEJWWGhzZjlDTTVOSzJ3WGdhM3JMMWNmRjhZWmNTeXhNaVRvRjFk?=
 =?gb2312?B?TUNycS9IUmRxMVNiNVB0Slc0YUJDaUxVT1p3NFJxb2xuZ1BTMzFIek5mc0RL?=
 =?gb2312?B?bzMyQnN1VzZXbGF2MmgrYUM1dnZGNkozbFpmd1dab0IrTFhxZXRHVThwNlZs?=
 =?gb2312?Q?uO+SdzRmg6gGCSu+MpzfHGg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?aHpFTDVQdkluZG9TSUVBWllzbURUcUpzTVY3MmsxQkdzano1OUlJZ0R5RGhj?=
 =?gb2312?B?VmRvK3lHVkVlVFFIN3lxdkVMZXp0L3ZMUG5NbGtXRTFPQjdVTnRETkFET0Jy?=
 =?gb2312?B?NFdzWDBXZ2VMMTRBbEo4bjFINFY1TWQ0UUN6bkpPTDllaHBtM0Zjb0Rvb1k2?=
 =?gb2312?B?WXI3eGJkRWszZnJObVIvWDc5cnAremlPWkkrWVNSSFVwV3RlTmtVMVRzWXE1?=
 =?gb2312?B?M0FIRGFiVFdES0RsV0tjRmZiRnZLTGswNUVxaDZLTGhQWEJvNU4xU25FaFB3?=
 =?gb2312?B?b1h1VXZ5dHJGanZQOGtCVzZ4cmh2bTFNN2hRZk5GZm93WHRyb1R5TTg1emgz?=
 =?gb2312?B?dHdkZHlhUzNDV3lUODJmaVpDTHpNVTJWbWkvclVkWkRWdzJmVG5LelNoc25C?=
 =?gb2312?B?SnE4WTNPOGRuVS83bi9QQmtuQUdycUpHUG8xV1BlcTg3emFMYUsvVlhOSklj?=
 =?gb2312?B?VENDNFVXRm5oRElLQXhxb2p1YTdIb1ZKVDhCWnhTWWc2Q2Z1QVdFN1FldkJV?=
 =?gb2312?B?dHVKWm4xNjFqNXZyK2VJSm9lQTd6NEF3ZkN3Z1RYODkzL29HLzRacE1ldDhB?=
 =?gb2312?B?R1B6bGp3amF3Y2ZrZGx4cTNYby9NTXhPWHBIQ0krVFdJS1E3Qkpaa29ScEpx?=
 =?gb2312?B?WGUyTHhCY1NRREI4RTlDMlFHcDBZYkxDNlpENUZQWXBFbUpyaW1ET3AwMTNT?=
 =?gb2312?B?MGpqRHBrb2Z0U3ZVOHJSdWxxdXlza2FpaFQxOVdXRnBpZ0ZuQ2J6bVBudlRo?=
 =?gb2312?B?anlEcGs5WkM1Mk81R3FqYzFJbG5JYXJRdDUvNmdNZDJuQXpxTXE2Z3ppNkRO?=
 =?gb2312?B?Uk1EMWc2dFlOTjNSMUV1YjIySG8rNFl2NUZYUGtGNG5hSzVQNVBMbUIvaWY1?=
 =?gb2312?B?Tmo0eWRhU2ZzOUYrV2ZXSlAyMkRBTzVBQS9UT1hPU2o0ZThIb1Evam9HQlNM?=
 =?gb2312?B?dVBMbndEYSt6Y0hocUVjWGJKdHY5L1BoWExXSUQraTRWVDBtQmx0MGROaWVV?=
 =?gb2312?B?NkkrZkg5VXcwR0pZNHdqWFhjTFBLc0VwK1pBaHRKc0dsbUZrMkdKb2N0UFJs?=
 =?gb2312?B?SDgybE5haytybER3YWFIU3NzdDVManlEdVJlQ3BNVVMwZEVkYnFHeXVCUm5I?=
 =?gb2312?B?NU1yWEpOazZMdFF1cmhTeWhGMCtpbDUwOXR3M2NtckZ3YWlia09jN2t1TGpD?=
 =?gb2312?B?QnhXaG4xZzFSMEFYaG9tM0RnQlhYTHAwZEZvYzMrVzZEdE9abWR2ZEF0cXpo?=
 =?gb2312?B?bk9hMUZ1NXM0c2M1RmNicElvclpqYVp6SGhEMTVxYks1d3ZlTWFSZy9ZZDl2?=
 =?gb2312?B?bklMRDh3WVFBRkdQcEVZakthR3lxWGlUS1cySVpWN2w2Ykpaemd4bDdrRUhq?=
 =?gb2312?B?bW0wVkJZS25yck5qeDhTV0JlQm9ELzRHdkNtY1RGcFFEczZQODhmRCtRUE9h?=
 =?gb2312?B?SDZFdUhORGJaWkJiTWRCcE9CWE9yTGZQVzc2d0hoaThud2RiN2c2UEpxeFBJ?=
 =?gb2312?B?WHBQYzRWdkhDZWt4OVJuc2dYS1VZaWVYMTV4RWpDc1FrUGJpajBIYzJWS3Jj?=
 =?gb2312?B?VDF3dnV6c3FnaEszUlR6Vk9VWm4rWXlKY05nSkNla1kxbDJLc2tPOEVYdVRm?=
 =?gb2312?B?RkwwYnNYVmlET255UzNLWFBHbGFibTlxdmNjaXpMcVBaOW1DWkxsSlNXL0Rk?=
 =?gb2312?B?bTBtbGhiM29hZk9SOTdwM0xicjQwemNMRGtqdk9oSDIyTmxhczRESk43S05i?=
 =?gb2312?B?ZDRvbXNiM2YyZXlrU001bklFdEFhSC9WS2FaTzdqcURNU0Mxb0lKQkZ4Z2E0?=
 =?gb2312?B?eUVxUjEweXYxNklNOE8wRk1MbDVJRTRWakVzTzdEVXZsTk5EZXpjMFloaHFs?=
 =?gb2312?B?Q0dkeEpKRjEwSUs1aHltT1l0WXBwbUlrUFE5L2o0SFBuV2hBR1k4dHlOUzc4?=
 =?gb2312?B?OEVWSUl0QnhLamlGaHEycWZGdWJtemkyWVMyMlZXQVV3ckJ4MFI2WndkME1a?=
 =?gb2312?B?TXlyVGgrVjl5bXZJWk9RRWhCY2xaam1ieUdKbzFBeExZekRGY1JtT2tkS1pE?=
 =?gb2312?B?Um9lYTJJKzA2WGk3TkdjK25HZUNOZVYxNUxHcjFrcFZDaTd5cWgvSGZNVTl4?=
 =?gb2312?B?UE1UQXNWandTeDF1d1NnRzRHTHJNcndUQ2dwNURyVkNkQzJXc3Y5Kyt2U1V2?=
 =?gb2312?B?d2tabGRpaFBHQTgvK2U3Yk1JekZ4UGwwcDdUaHdBa0NtdFlTbDVsNDRkYWo3?=
 =?gb2312?B?Y0ZKSU11clYzbWorVCsxamk1elgxaE5tL3BoSEtJc1hyN0V0QU9NeWRoTmdY?=
 =?gb2312?Q?yuy+3qx6mEa7qOe8Bo?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d24afd1-0cc1-4801-5160-08de67bd5ad6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 09:26:50.2685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Foqq6LSVpHETS9ba+7tpdknY7vjh6v01qRSAS8GeSZzQXw+tkjx+sdvJQs7KoKlWdufdEmebaX9P617wwnPCcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5969

SGkgIFRha2FzaGk6DQoNCj4gPiBTZXR0aW5nIHVwIHRoZSBpbnRlcmZhY2Ugd2hlbiBzdXNwZW5k
ZWQvcmVzdW1laW5nIGZhaWwgb24gdGhpcyBjYXJkLg0KPiA+IEFkZGluZyBhIHJlc2V0IGFuZCBk
ZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0ZSB0aGlzIHByb2JsZW0uDQo+ID4NCj4gPiB1c2IgMS0x
OiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MDAxZiwgaWRQcm9kdWN0PTBiMjENCj4g
PiB1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJp
YWxOdW1iZXI9Mw0KPiA+IHVzYiAxLTE6IFByb2R1Y3Q6IEFCMTNYIFVTQiBBdWRpbw0KPiA+IHVz
YiAxLTE6IE1hbnVmYWN0dXJlcjogR2VuZXJpYw0KPiA+IHVzYiAxLTE6IFNlcmlhbE51bWJlcjog
MjAyMTA5MjYxNzIwMTYNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExpYW5xaW4gSHUgPGh1bGlh
bnFpbkB2aXZvLmNvbT4NCj4gDQo+IFRoYW5rcywgYXBwbGllZCBub3cuDQo+IEJ1dC4uLg0KPiAN
Cj4gPg0KPiA+ICBzb3VuZC91c2IvcXVpcmtzLmMgfCAyICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykNCj4gDQo+IFRob3NlIGxpbmVzIG11c3QgYmUgYWZ0ZXIgdGhlIGRl
bGltaXRlciBsaW5lICctLScuDQo+IEkgZ3Vlc3MgeW91IGFjY2lkZW50YWxseSByZW1vdmVkIHRo
YXQgbGluZS4NCj4gUGxlYXNlIGNoZWNrIGF0IHRoZSBuZXh0IHRpbWUuDQoNCkkgYWNjaWRlbnRh
bGx5IGRlbGV0ZWQgaXQuIERvIEkgbmVlZCB0byBtb2RpZnkgaXQgYW5kIHJlc2VuZCB0aGUgcGF0
Y2g/DQoNClRoYW5rcw0KTGlhbnFpbg0K
