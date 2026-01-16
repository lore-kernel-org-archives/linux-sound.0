Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012038.outbound.protection.outlook.com [40.107.75.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16F25EF9C;
	Fri, 16 Jan 2026 06:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768545190; cv=fail; b=Y99Hz+9LLqQ1u+3APmb8MBBzDzPH6+RGuhQbW2yKIR2Jdz5MGC5sDaj+ZPNALSqORfCWvIISbcs4dsT+AvpGXIBqlehdRanCJkWwugZp9ZSNm9NM8qLw5l+1iKw3PWJMhOjCc8/h+we3BmFGTcm2DccQhm5tAGPPDbKVYQ+wWfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768545190; c=relaxed/simple;
	bh=vcYAAaokr1kW5pYryIi60XH+uVPCSddd3e2kzlVBI/M=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SgNMEslRJB8BDOgxR3yM6AVk37I8ZymKrOBlnx6ds2DVagDCL2NHIl47MHYbpxumqAfo5uJk+fVQbqVfrJd1YNBNX+Vv6aIqp5OfF3n56i1MgFGBBQbhMunRPnVQCM50P5iNIsKXzOlWwEqNrGkVxfg753d2eZMTglnk7zRUU+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=YnrQ4bU1; arc=fail smtp.client-ip=40.107.75.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="YnrQ4bU1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Abwbt9KHFfhYCfRzq/W1uvAsso+znbZhvbPGNn5XP7888dPqh+8HDvmxvjGcZkOKjU2S3fh1OBTAsasex1Wi0SRevJSY4Zkzfru3CLrx9qIH0Nn8/ao7DcppBsGK9nhGSOLAWxy3+/PYU8IIXrUPF/Hv4kFmXHdPQmk7+ddhI8MPAYAA53xbuZ5Ri+P4Btp2/hC7E84Hh9LZGiMB0E7p56893Dx6zkZ1MkzKs8OuR32QqV4jcmiq33ndK6dtapZxCbTFrByI2zLwTwbbvOpamdSjzdkNro+O/YrvZxnSWcSHjXfU5IqOp/3Mp8edCo4vhkS7Tce878c9MwOUMVU1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcYAAaokr1kW5pYryIi60XH+uVPCSddd3e2kzlVBI/M=;
 b=Nf2sf+4S1Cqmqk2vuSYJzjmmVWri/3MSpWQhHUby9n3OXHZvXedbIck/qrO5VCq5Om+dDMCWm9p9ESQMp1zX9IutA9T6XVxQ0fL/hL9vLcPNt55SbXV7a/+FBGZLifJoFlecHUAbHDNxgBHj4AnxjrSyvap5zOWoN0X2L7X9fPQm7QtoYqNPWfqgiHaMczkVL3R86yJqvuvwgpnEW5Br/5hmfZyk3eXiLMHXxWUBQ2KPIAA0/MPYMVrCMKiV1LZ56W4CImEZ3HnN1UGNeONN6vxTA6twaNwcAKozYcYCW6C+Uz/kGHVlSXm8+036kOOOefnyOWl9D1rFSF8em3ZzyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcYAAaokr1kW5pYryIi60XH+uVPCSddd3e2kzlVBI/M=;
 b=YnrQ4bU1fW+ctW0zbE0G4uuHnhE/pL4W8dks7yEaFIdFHB1c84cE61pacPdP89bAINajPEIxYxfPyXzJLqHtA0KY6zLCc6aLGHFBP6LmnjK1zZDYddkp6KG6/zO7MYmdJmVXITUzxS6jM1yIN3x8qgDsLaqUMB5OaV8RhwGJnLUbpXDDStk4fcj7ZGTwLGIElOBHLnoM/L13Q/DDZaqc/31q2qSuyJ6XQrdQkkN0Kzb+DS9KaUHeKs1Hm52P8JVRaeATv7DGG1QIVh6JUVDwdTMn5XPD0KSDzSIdui7RbvRWiSKvXVY5Fi7fxnhPJ6SgaOkYW22jofu8CPMalm2Rmg==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYSPR06MB6608.apcprd06.prod.outlook.com (2603:1096:400:477::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 06:33:03 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 06:33:03 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>, "roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH v2] ALSA: usb-audio: Add delay quirk for MOONDROP Moonriver2
 Ti
Thread-Topic: [PATCH v2] ALSA: usb-audio: Add delay quirk for MOONDROP
 Moonriver2 Ti
Thread-Index: AdyGsZ99wz4xwPCkQx6hpl6O7NkXYA==
Date: Fri, 16 Jan 2026 06:33:03 +0000
Message-ID:
 <TYUPR06MB6217911EFC7E9224935FA507D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYSPR06MB6608:EE_
x-ms-office365-filtering-correlation-id: bda537e1-dff0-45c4-f145-08de54c919d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?dXhBNWF2dFZxUStmaGcrR1dTaG95bzZYbUg5SngwYnh1WGFqSGdOcmV6cURU?=
 =?gb2312?B?UjIzVlpxNDVYNnVpT20yQkNmTlhUWWhOM0xhL2NIUTg4eUl3TXhFaktzL1VJ?=
 =?gb2312?B?S1ZHZUxHbTJHSk5JdzUwbEJjYnhBTG5GbmdLRUlrQ3ZuWk1wQUk3enMycUF4?=
 =?gb2312?B?ZXZ4MFl5YmdFOG9uVC9KYWRVK1NEWWRwTi9VTU8xWXMrbFNIUkdld0hYdXdU?=
 =?gb2312?B?L3V2TXlCQ1dCZkh5RlFkNVRqOHVJajRxNWNLUllOYytSeEJqaW0zZ3hBYXZP?=
 =?gb2312?B?eUpJcmcxN2Y5YXpIeTBTTE45UEdjU2xWN0gvWmVQZnFqamprbDkxbjlvSE1h?=
 =?gb2312?B?cnAyVzZYVEx5aERjRkJFQlhHcjZJL0pUdjM4a1RFVjNsemxhaC81WkJwelgy?=
 =?gb2312?B?MUx2UHNNQm5palpPbENrZm50VUxwVVVQd2JSSUIrL0FVRkxsTG9uT3oxb0Zh?=
 =?gb2312?B?MitsakRhcjlhWlh6bjV0SE9YZVY3Q2xFdDJsbVZPZHZpZHBPbDJ5Yjl3Y0ts?=
 =?gb2312?B?VnhJZ1NaSWJXNy9rV3JsclpIR1lFV28yeDlLNG5pem5oN3loR0JUWjdYU0Jl?=
 =?gb2312?B?ckVRWUFDOVFoSWtwMmhSZitRam9YT0dDMXRocC9jaVFFbXlLdjh2VHV1YmdO?=
 =?gb2312?B?V1hHWDYrOWdSWlRaSmxoU2pqcngvVlBmbjlEd2FWVGVPQXpXZHN6ZnRMTHlX?=
 =?gb2312?B?VnZOSmxKVDNkdC8vbEhDUnZ1UExBdEN2a29MSU4zdVBkQkxKS2VGTWZ4Y3Q1?=
 =?gb2312?B?SWJiZE5sTmpUN3ltdDVXTXpDeFgveHdDeE82QVF4ZzhCZFVaS05qQkJobCt4?=
 =?gb2312?B?TVZKNWdWOGk2Zm44Uitaenh3YUtsbmdDQnR2UmFVU1E3WDZtMHdKSHhYeFFW?=
 =?gb2312?B?c3UzUml0aVp3WHl1SysyYXRNTHpwWm5tLzhweWJSMHJhdWdZakdyT2lmQnRo?=
 =?gb2312?B?aUIwQlZoSmU4MFJqN1M0eTJDMDhXeXpxQlA5cm02YWFrdUtkRG9UZ2xLdFVE?=
 =?gb2312?B?T3gyOHFvY0JQWGMzMS9rVlRQdURBVjV0NEZFU3phaGFwUFVnNHpyY3lBMHRT?=
 =?gb2312?B?RndUTFRBVVIxWmtRRndUWjlrYStoeFZ5aDNMb1VLd3JjRm9TNGM1cWxRSE0w?=
 =?gb2312?B?UFhjSkw2UVNFeWJXbnlXQWRONjBFSThaVnlYb2t4QWdndDlxVk1yNXRXd2ow?=
 =?gb2312?B?YzRFWmc2TkpSN1VCQ2diaHI5R3VXM0RDVkIvMjJsbkdydkVRazVLY2J5aFZK?=
 =?gb2312?B?OWdqQ0Fuc2dmNEVkUFU4aHR1cDRXbW9zNHNXR3Zmd3VKK3FyZjJKeCs2VlpU?=
 =?gb2312?B?emJlcU94dDlTcU8zUXRvQkhybjVMb3pTUk90NEdQQndQaWN6T3pkajBSdUJo?=
 =?gb2312?B?blJxbkc1Y2Z0em9TTEVPMVlvaEgzUTVqckN6L2hONUl1UnhiOUhsZmFOOWxU?=
 =?gb2312?B?N1dIUmNsUkpPVTdqWWxFVGt1MnFsaythNlNrZVAyOGNxRGc3MUxpY1JXMDIv?=
 =?gb2312?B?b1FHOTg3bjdrYjV1aW40WjE5Zml0K2hMUzhzaVliU0xQd1VGOVliVUs0c1pr?=
 =?gb2312?B?eXg3TVBQMTRYNHdyM2dKUkZrWXF3V3lDNzQzTlRyUDRiS3pvMlpCVUxsSTFK?=
 =?gb2312?B?bElQVEorelZPdGFqN2w0ZGNOMHZKV013aHJMbDdNd3RFNHpQSHFJZzRlOUFJ?=
 =?gb2312?B?S3JrcmR6cm10UFgzbTBEbVFWN1o0dmt4Q2p6dEJYNU9tQVdGa3c2a2NyYUxj?=
 =?gb2312?B?bCtLQVMzc2tURkF0NisxVEtWYk9TZ3ZDY1ZOdi91OWpjVzIvWnlBa0VwT2Zr?=
 =?gb2312?B?WmZBR3NFYm91WGtxSzRIUFBkUHJrWTVNRnFIOFdRQm5veC9MdlBpdzdCWnhM?=
 =?gb2312?B?RmZlbCtTWGQ3d2NjTFFQWkx0TjNadTZQeE8rYTV1SUkrZktrMWJoWVJXai9F?=
 =?gb2312?B?aFQvWWhpM3pYRVF6VmZZRE5VQWdNWk5xK2I2SFluN2xENmRBQVM5eUdMcTNw?=
 =?gb2312?B?NjFRNGxNYVErc1JyN29rbFF2L0lad0NTZndJNzh0aGhTNjNQYUQ1c0o1dE82?=
 =?gb2312?B?Rng0QytJMHZHaFJkYnZuUDVzL3hIWXFwSmxiU3hOZUFYNUUzdHkrQ1p6RFNk?=
 =?gb2312?B?ZnZkUHJaZmRIRHA5Z3drVWl0aEdiOHdSY2xqY2pzZmx3SlFhUG0zSmdJblJQ?=
 =?gb2312?Q?rsyb6XR3gG1amXxYBesyoSk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?NktxR0ZXZkgyelV0aHZJeWpveWF6VVBkTmJCTzBtVkIzRVNrMmN1TUsvWHVn?=
 =?gb2312?B?R1VPS0pSUXpJbU9OdEJiUk9SZ3BUT1RiVkVOS25DMUl4VFl0YWcvTmppckF3?=
 =?gb2312?B?MktWVlFXcnV3Zkx4TEhrdmg4RU1JWkVvVVN3R21EQ0U0ZmxMUFowNFRxRW0w?=
 =?gb2312?B?VkdnRVdoM0FZQzE0YS9oS2tYYUQ2MEJKa3BkMFRGYTByeG55UkRvUURtZVFU?=
 =?gb2312?B?azNIcUQyam5yK0FEWGRFTXhGczAycXJLMysrRjZpc013SGRsMitadGR2SE9D?=
 =?gb2312?B?QkhvRlROazBNenV2SmJnZDFVcUpCd0p2dlVJa2J2aERpLzMzdEprYW1xZ1FR?=
 =?gb2312?B?OTRnLytRTHhySlF3aFhrdEZMem1CZGlLRGFESUl4OTZ5NWxpWjlQOE1CYWFw?=
 =?gb2312?B?OVVmNzNEcGp5TkpETVgrUjY5Q2NJQjVJamN4UDh3dkw5LzBvTUttd3YvMjVk?=
 =?gb2312?B?WWFUZ2RIUEdiUmFPQXlVY2FNbTlPRTdUdTVKelJTdGorYWo2VlM4RXN1Zjl4?=
 =?gb2312?B?b2RZRjRiZEFhVGhGekROb0d3aXJSVW5RRkU3dDdRVHBzMVJTbWs4bDVzZnVh?=
 =?gb2312?B?TGYzaGdyY2JtVzNNRUV0alVpeXVjVlN5Q21PUENLTDJZbzY0bXBTSU5SNW1Z?=
 =?gb2312?B?NkxtYTJBS2wwS1FGb2hQSlg2eE8xN25aM2xOc2lUcEVvdXF3YkhMb1ZIOEZK?=
 =?gb2312?B?RVpBaXVPVUhkOFNQRVNrbGlUTjR2aUpVZWxtRTdoOGxXbG1aUDA0Zk1ZNEhD?=
 =?gb2312?B?ejRJc3krRkpIcDRvNTI2RmRoZXptNnk3QTlrVU5vNmR6ekJnZ0hqM1Zsdmts?=
 =?gb2312?B?QnBhYWJqYnVqM0I3bFZwSG1YREVTSS9NcTZWSjZ5M1l0ZDdZVEpWMGwwTGpn?=
 =?gb2312?B?U3BlSlZQZ3preEs0dThtWXpsSGVzbDllT1lFeEJQSkxoaGZDNmxPdlFCbE9V?=
 =?gb2312?B?RGg0L3V6NjVmaVlDQVU0N0c3Ri9LNm1HMGxKMnpoZVFkQzNLTnA1aTlJZmUy?=
 =?gb2312?B?VHdjalczT0dkd1JnQ0RaZU5CNndGWWVmOTUvM2duZGpoUGVuSVhwNzR2SWJp?=
 =?gb2312?B?ajFGS1BXOTZsa2JnS2JiZzJOaUVpdnoxNVQ0bEFpa3Q2MjRpSkxmb01IRytx?=
 =?gb2312?B?Z04wa1YvRkgzUVdjV3pzTTJKbUg5RzhyV0JPL3lXbjdMbEJ4TCtTSUpWSHI3?=
 =?gb2312?B?d0VUdm1wcE9EaWIrdjZ0Szg3eVo0TnVBTUN4UEo1QWF3SDZsY2thWTM3OFFz?=
 =?gb2312?B?OUswSkluR0J2Zi9YRWtZWmljZXhxS0tlM1FQYnp2SGZZS0lkdjhQbGMxSXFo?=
 =?gb2312?B?WWJMenorZk42V1FOeGJZZUVJTzViNmZXVHVrbm5oelZSNXpQbXJoQlRUK0o3?=
 =?gb2312?B?cnFhY0c1bU0xUW1JSTRYV05EMVlRa1dodDVRTDBDNkEzOHB2L05oQnp5bitz?=
 =?gb2312?B?dmVmUGJCY3h0bFp6UzN4L1hqRnJaNzFmTGdTNWFEMmlGWmVrMFZWaVE1ek1N?=
 =?gb2312?B?OEVDWFVVZkdpU0ZJQXNha0tnRmE5eGVyaXlqMWVPUDZSSHIxNVRHZUJUSVNG?=
 =?gb2312?B?amJKWnlIT291REFuOGtURUl1bi9HVk9NdFkya2RqVjZFRG1ENEJxVm9NSTlt?=
 =?gb2312?B?TzQxVHFtZE51LzBJWWkyVWtrcHFsSWJnNlhGSFhEbThzYkRrajBCcjFaamhs?=
 =?gb2312?B?dW5Tc1NuNEZ1Ykx4KzFkYTNNSFFzWEtYVGw1RzJUNmtINThjWXYvYjlEWUpp?=
 =?gb2312?B?N0Zud0RtSHgyN1p2U2pKejRuaDE1MDdkd3hrUDE1UHdHOFZqOXNlaVZGb3gz?=
 =?gb2312?B?YUVyeHZYSDI4RHlERWpMaFlET1JRTm1wSFl0TGxCTUZDMFVGaC9jdC9uTk93?=
 =?gb2312?B?bDRHR3ZSWERMUHFHanJvallUZEhYOTFPd1M2UjF0dTVVdkUxOWZlL05HN040?=
 =?gb2312?B?OExOOG1LaSs1bFdUY1BkaGluVUNkaUZXb2tjdTJyRGhFdzMzQlF6NEsrM2sw?=
 =?gb2312?B?SnIvaU14dHFHdzFnN3FNaFJ6Sm1nZ3hwNWpuM3puOHNsWjVyaVpaOGQxU2RK?=
 =?gb2312?B?T1VKbi9RSjlVZU51cUMreFJLUlV2QXJ6cHVrMzF1Q0VobWdxNTFXR1RxQVdq?=
 =?gb2312?B?ZGFPK24xcGNmL0gzKzVqbzRYV1VqRS92SVpNQ0VQOUw5VHJQN2tSK2pKSVBj?=
 =?gb2312?B?eUpCZDQyLzJVUlRDNFUwM0h3YWQ2RjA0UEpLVkFneWZYeXVEL0oyTDVPMlAw?=
 =?gb2312?B?Rlk4TSs5aCt4cytFc093My9OMWVubmpaRzdrajZFTkY4b2FzUDZRTXBURFg5?=
 =?gb2312?Q?fD3UXSQx2N0emjEy0T?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bda537e1-dff0-45c4-f145-08de54c919d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 06:33:03.1582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkQZs5y0b25IVor3rikYlyzupUnzsivrTW5kQrGpT0hpmNwNVd7t+AOZWXqu5O3tohqSoBpqFIBUS1DFOVCjqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6608

QXVkaW8gY29udHJvbCByZXF1ZXN0cyB0aGF0IHNldHMgc2FtcGxpbmcgZnJlcXVlbmN5IHNvbWV0
aW1lcyBmYWlsIG9uDQp0aGlzIGNhcmQuIEFkZGluZyBkZWxheSBiZXR3ZWVuIGNvbnRyb2wgbWVz
c2FnZXMgZWxpbWluYXRlcyB0aGF0IHByb2JsZW0uDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNl
IGZvdW5kLCBpZFZlbmRvcj0yZmM2LCBpZFByb2R1Y3Q9ZjA2Yg0KdXNiIDEtMTogTmV3IFVTQiBk
ZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6
IFByb2R1Y3Q6IE1PT05EUk9QIE1vb25yaXZlcjIgVGkNCnVzYiAxLTE6IE1hbnVmYWN0dXJlcjog
TU9PTkRST1ANCnVzYiAxLTE6IFNlcmlhbE51bWJlcjogTU9PTkRST1AgTW9vbnJpdmVyMiBUaQ0K
DQpTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxpYW5xaW5Adml2by5jb20+DQotLS0NCg0K
Q2hhbmdlcyBpbiB2MjoNCiAtIFJlb3JkZXJlZCBieSBQSUQNCiAtIExpbmsgdG8gdjE6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC9UWVVQUjA2TUI2MjE3Q0QwQzgyQjExQUQzRTY1OUQxNzRE
MjhEQUBUWVVQUjA2TUI2MjE3LmFwY3ByZDA2LnByb2Qub3V0bG9vay5jb20vDQoNCiBzb3VuZC91
c2IvcXVpcmtzLmMgfCAyICsrDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KDQpk
aWZmIC0tZ2l0IGEvc291bmQvdXNiL3F1aXJrcy5jIGIvc291bmQvdXNiL3F1aXJrcy5jDQppbmRl
eCBmMzgzMzBiMDk1ZTkuLjJkOWYyODU1ODg3NCAxMDA2NDQNCi0tLSBhL3NvdW5kL3VzYi9xdWly
a3MuYw0KKysrIGIvc291bmQvdXNiL3F1aXJrcy5jDQpAQCAtMjM5MCw2ICsyMzkwLDggQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCB1c2JfYXVkaW9fcXVpcmtfZmxhZ3NfdGFibGUgcXVpcmtfZmxhZ3Nf
dGFibGVbXSA9IHsNCiAJCSAgIFFVSVJLX0ZMQUdfQ1RMX01TR19ERUxBWV8xTSksDQogCURFVklD
RV9GTEcoMHgyZDk5LCAweDAwMjYsIC8qIEhFQ0FURSBHMiBHQU1JTkcgSEVBRFNFVCAqLw0KIAkJ
ICAgUVVJUktfRkxBR19NSVhFUl9QTEFZQkFDS19NSU5fTVVURSksDQorCURFVklDRV9GTEcoMHgy
ZmM2LCAweGYwNmIsIC8qIE1PT05EUk9QIE1vb25yaXZlcjIgVGkgKi8NCisJCSAgIFFVSVJLX0ZM
QUdfQ1RMX01TR19ERUxBWSksDQogCURFVklDRV9GTEcoMHgyZmM2LCAweGYwYjcsIC8qIGlCYXNz
byBEQzA3IFBybyAqLw0KIAkJICAgUVVJUktfRkxBR19DVExfTVNHX0RFTEFZXzFNKSwNCiAJREVW
SUNFX0ZMRygweDMwYmUsIDB4MDEwMSwgLyogU2NoaWl0IEhlbCAqLw0KLS0gDQoyLjM5LjANCg0K
