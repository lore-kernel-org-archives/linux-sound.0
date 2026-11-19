Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795105868;
	b=auzkoyz+tebfdszp0IZnuKzb3sGbld3oh/srfKMsCpoORSpnLMWwbhLs/hU+ar0mXa15
	 3YmMvT3Mel2I99r/+GOyK0trLuTzMqx+M3hpBU+dx3uow2ppYiY2gVJjtG+GQ/JiQ1QjU
	 HnApYmn2gp4RBiDXKxeutG9cBr1guONbAuCO+DKfHxMx1lqtzueD/GWsshunURzIHBf8t
	 pTMMYKMWNeRr6w7vX1a+dqZIK6FQQNKgjcoFVjTuLd9yLZt7wcz/N7fJ8Ykkr6O/lTmcL
	 aOiEodXdyRfNEo2f4RxVfE0btRCcod7f13UZOq01adls0OZ3PtmtqlneWif+gch+6Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105868;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=e8NAhaKzIEgDyTS1HNHTe66+ys6DwTZ0DDhnG/FEgPk=;
	b=BHEDgwptwoyo7qQvgw2Vm6sF2e3LMvWtS3vZw9XLHXsdqG1TdLPqRbnsab6yP94EI+YI
	 /Q0rqdrUN9Ys4fEkQ8bm3PWQlRFDD0rfHcTs0WLHWGIkDZsvf1GL09S2LwrvwLtdonSYE
	 W8uokDz0fS8Ze4/TpiB8LDQN/YIPOe0VQ9hluk3FFVafgVF2MviWN/Nl92r9OUlfKwekO
	 edZWzS8Hr4JnXtpmfHbOecWTvTrcmKRcvQDXo4Btl9JtlOOopPnbuFDlhAzXhC3RKE5qc
	 OKFcVesFyIITEYl+Wjlwwnf6WdsbKk91cTnZVKbl6E86YpcSdj/9DxgZdLnC0hZkcnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=T2KQO49b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.37
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011037.outbound.protection.outlook.com [52.103.12.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF04C606A331;
	Thu, 19 Nov 2026 16:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF04C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=T2KQO49b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZVHPrXVQw1Y7W4c0W7cdQEcy3gZRTPWBoLSWg2l99KLK3Jw85ONZ6i0b1w0093ZgvFVNWUaP+s3JRbrl9K1zmmNxK4hz57iLOF0mZqK81vlvPoR8K5OT4r7o2fgxJtPJqo6jCKBVxluoQTRG8fA0yPvyAybmd40TODX9KThoqzhWnYywURRkwyz8j/5IdSdon5yHPFN/3IIvKq53Vqn3crvtRjLHy9AIE2zgY0JxAka2WczeSRhgxcyRa7nwQMsv0oHmdnhy30yWf9UITr38etBG0Cwe4cDeocVacHFiwIY4ga8JMQZxTzuo5XMkfi+szq8NFPazOrmWuPdcy2Lqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8NAhaKzIEgDyTS1HNHTe66+ys6DwTZ0DDhnG/FEgPk=;
 b=FuUX1/dJTz+GlXqyyAPBRrbPr9MQIvIIy+0UFbg5aUDWOZq941WGPHUlv9/tN8nCvbWibVSaNMkCmP4918NOn7pvm7nPpd8e/eXlajGU7VGYL30SeKDnGqKUFuo8g/TjHivNk1vNioOn4DyapPTWJZ1rRxBFPDdcnrLBhoRp22Xt+E41QkooYv/WK4xmjnCuvVLCnabQKpo0xpym8tWq/LQBs2ktAKN0oD6rftDAEOw8fWSnC4z88qN9g8hHR82FbNgqoY4AY/qrWmy3aN81YJENHqt7cWS4o7hJMTTrW5gu7uhk15rMIeoZOIER4sEFcgg51WWpspmPNl5JyOzYQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8NAhaKzIEgDyTS1HNHTe66+ys6DwTZ0DDhnG/FEgPk=;
 b=T2KQO49b7gB17Mf4qFU3sGRLU4eTEBcY/VK7b6lWla/JkA1YQU3GS1h3NiIcLdM8spsermPhZSzOoWWFpiAkHGEIdK+6wKOBzBXpEJrTtOmuvAyCzEcFnicpfsruEeB6a3S/SaqEL1UnBtbjBzoU5Kuiy1jNrBhYvrRqCK3amLPiOz3kdPJ3eCH0xQhOWfsCk0PrXyIz6qFlZUMwxDdmZQDtX9fvrNtjBq2JrNydx7xE06LcEzVMDCQ6gBezA9lsNuDov/8XHzEI3cyr2y5HvDcQBA/jCKaTdR/JVR7tZXXa3Ud/BpB1XXmsdYeAzEw+F98qBieT7SKzft9omVg55g==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by CY8PR19MB7036.namprd19.prod.outlook.com (2603:10b6:930:58::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 16:30:36 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 16:30:36 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH 4/5] ASoC: aw88399: fix clearing of SYSCTRL bits
Date: Thu, 19 Nov 2026 17:30:15 +0100
Message-ID:
 <SN6PR19MB2303EE6C412E5102D89F7FC0FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00004E9D.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::454) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261119163016.30414-4-marco_giunta@outlook.it>
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
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|CY8PR19MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: aab3961a-48d6-4cd8-19f7-08df465a708e
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaXUDTEXJGQWx6OympRIZn00ArpYC72TG8oHwzrIxgioLgnRt0k1ctP1lHkDS2TWcCgrMj5YCgwzAcujR1yo3GAdV2Tn56/Cye+XEEuY6CZuu63kEaM9S9C4AId6EKqrvGUjs8iBLZcW8Qmu6u1Hj4OpoOHyg/EcIZCJuFoIX2m9A430OyhIqxaErvVKyk5O02jvDJdbSKrGdThG+JG7wlt+YzLNOubryXRIBx0pqiE+g9lVdusw/pZ+Mh+RQ5Cg0zxXgJyXvt5CXzyDaOxeLTxf1AyYtK59AypiQo4pXqDIeu4HiSPz8xqFtgtLMU4Am3gbNZusWc6slItz9d+C0ZVUyH3akQ5GVxzH+WgoCpFCtd7AiOWILZDevsKf7NP9Ys7tDSFjFHq6FfQ7xNUWIUkdLfcfrXJ1yFeRSOX77SkSrGNl9x8uGgHEfbAaGb0eK3Zdz2atAwrEtcybeDrQtGyXkt/zn1I4+3vS11dPzhMmdUbkR95THUFYUTxlbRpNBs9dMArf0E0xnc5OMGXhfORce4LeJJjA2vqOfyfPpxwjpTZO9yhYJYSTqjcOCVgK6/YH02XMV01NWPUZa0bFv7t7eoytVJPvIQ99tmx2qCTqeOpOMuoB+xKrZyeMPIJSFcsIAeu2dNUqj2Bgvl6d/PdFJPQE8vZgByzDjZnZgXu3PNqcXJvAq1OXHN7OvFS//u7rjut3dzzu0tUry/S2pIIx3BU9VBkUEb0Uq4GjlAHQFJ7hL6FjWrWC123r0TVKtt
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|260925184616899003|25010399006|55001999006|8060799015|23021999003|51005399006|15080799012|24021099003|19110799012|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Ps0TGxH/gEpsdCMqmYwdSHuV4fg3sWBsApguKtPNXUZS0FYPs3LD/ih9mRJ?=
 =?us-ascii?Q?sejBqBWJtUsafRPllU7O6mLY8YZoOYvH3KpRk+a7xgOBS3rkzq4yfA829V5v?=
 =?us-ascii?Q?vtBOEzsIP8ZfpDCT2XVTBa9hqO/6yBzRLzy6/dzWxlV1hsC6wFyRnDvLJ5ao?=
 =?us-ascii?Q?9qaJb2ihyyAgBVhwaUlksaTTFYODMJollUwjDBIp2THpibIpZYdz1U1BZD9J?=
 =?us-ascii?Q?QJJ6Rxe53q/BtTxWN08EZEk6QOGQ7OduSD4Oj4tXEwQ6H8FIwmDMiC+auDzP?=
 =?us-ascii?Q?Qar3xyrS2Scv84DVXqWbVSih9cW+cXTbBS1/njlWnhxw6pe2n7KznCWWyaKI?=
 =?us-ascii?Q?0SIJwrZ/IHcvpPXmj8w75XmqnruL0//CXEBNMCVEBCt9XIWv0Uv+wzk9SUOr?=
 =?us-ascii?Q?UNSIJpLj4jDx3CJ4VkWx3tvdpfWp/Mb9PQDvhUBFZ7XN72IRo1g7x7wktZSC?=
 =?us-ascii?Q?ch+9+MhsLbJHRBPlAOF+UIZ8L1O2/HhHJmo2nfu24ZPEslWfDxfM+7t4+J5P?=
 =?us-ascii?Q?kh4korj/K1ePJ24OTeYc+Qahhy9RwGzjSfNzIFeS/OiviGgdLbut1udtre0T?=
 =?us-ascii?Q?HhHODmbwtIJGef3OvB26wuhlJO2xSqsTsXyrh8vE9KJztPTWh/c7Krwl9nK3?=
 =?us-ascii?Q?m3I07ZdnhwipDuPeZt/fA5D7jk1d+aNBRoSYFSl4BEo4j7GluZc+6NWFb3XC?=
 =?us-ascii?Q?inJL1KeeR3TqdRnLJg8CPz1lWZHETr1NQ/xOifPXsrs4hTggRQTmxjnA+WYz?=
 =?us-ascii?Q?oKCySXJfZkcWd2CDeb8BMhtK3FYFdwJFcxTkxENUxK6m47F1XoEyNc3WvPoC?=
 =?us-ascii?Q?6+Gzu3y9xGltI4734F6/s4SgQ1q+gbF0oB0UFqEK5OABwaZS+XzsVpZUYMab?=
 =?us-ascii?Q?31Z4aPxFRqEF5dxFC38c3hNn9k9i980halBgt7ZvTXxZZ7XsTDQk0Y7T0dE5?=
 =?us-ascii?Q?1O1Rb4+msyJSlC0xeEsiA9FcVRmz9k06elf5ZGt294ARomTh9Cr59EoubnTI?=
 =?us-ascii?Q?6C3J?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GwmC37vFOleMY3S3P31NaFX67btiH+TO/6LP/2vWkqN65Yvu7blBkUqbeAnQ?=
 =?us-ascii?Q?+W42H2+OvtdRV0BhSplaXQ6Rr/Cwrsk+9bWsRok11crvcTWFrjmNcqXL1l/Z?=
 =?us-ascii?Q?E8rnTEMFNRB4ZjpQkrSRtTb9JpjFOsM3zNc5PTB0R2xM3f4FrzBmKzkdUsPc?=
 =?us-ascii?Q?rkN3S+kvtEjSY/8g/j9U5tQtQOsjy7F8YXJjauL3jY978Xs/uLzhdpd0AAOv?=
 =?us-ascii?Q?thfbPVEX4xBLHhgfO+VV63tyX4zwfzlThTNlpEJsx7g6xIliy91q7xv74Vk4?=
 =?us-ascii?Q?KL0VDD96lkW99W3rNE5MDtAYlYetWAU3U5kKuS3JAGKGHSwUQHv+xSh8oPIW?=
 =?us-ascii?Q?mGt+EIwIZ59mIuhnIuBQv4kTUuJmoJzRZwL7iwRDW8KWkPdL+dfeW9YUrdLZ?=
 =?us-ascii?Q?mq6bEQ+B2Ek00jOZf9+s2lPWOKSiiuuLms5KorMW1Dx5hi+UZMe54pIqLF5a?=
 =?us-ascii?Q?naYx5DTD0v8/3esIDTMOX1v9M6khbZX4zYO5Vj7XqPyRHm8QI8gRGp8Q6iwc?=
 =?us-ascii?Q?/iIMltNuUS29oqUoiGpESFiZE6HqmIiCQ5JpKw660PQvIX9uT+yOb2kFhClD?=
 =?us-ascii?Q?Jt/P2S2fnKb/wv5naEWeDS4owXtomtElr1IU2RdASPgtLDGgb9wpLHygqdL7?=
 =?us-ascii?Q?nW1kYk9WvSmoSGMoLkGi2MQQB6C6CMhGVYBr+awbZNpj5u4O3HlEhqrNsPfc?=
 =?us-ascii?Q?ellNy23fry2GIgUJ4b9SVHBBAZNFKMCfCr48DgAwPZ89oueN/fhifYNeSK6L?=
 =?us-ascii?Q?gxdg5aRNfSAiN0BhnJPC91V2oGCLZo7yAxaocMEDaOT2b6KtGEfJ9iGG4UB5?=
 =?us-ascii?Q?l7RC5nODKIfF0A8ufYahs4gH91AA513NVnfEyEPaRyXxrjpHQWxXMZIE6DkO?=
 =?us-ascii?Q?tFTnedxRtiIkTvTNuzQuFrTO0d4tKr9261zHjUU3KIxF47pq7E2XtE1q0Cik?=
 =?us-ascii?Q?z5Z2DXOvcW1/amCV7/gTpQgQG4ag0WLAGeTGEvvzgG4WUILgbXptxfUt3vob?=
 =?us-ascii?Q?C522bOtKrAIc8fNlC6ykZZcS3kOgRtqDlepLmVbu6gR6kFmKIcXHOJO9V75h?=
 =?us-ascii?Q?54xJ+LYtG+ks1n/KSMDNto5WyFaFyji2VMWwV+ugbciu04Zu/8qeMBQ9/odB?=
 =?us-ascii?Q?Ev8wpMrtYcYJIrVky6dMizUDM33GF/aSLZ8chx4v81bzBEl3mAawh/M9I6xb?=
 =?us-ascii?Q?aXPVxcF72vc3ppBMT5JbRdaEB+UCldgrscl6mWa8VZSoLb01zKPuWpYCB4wL?=
 =?us-ascii?Q?gS+Vsd8UwkspnRf0adxRNhDC4WqwG/kduz0Qnu55z9U6fvzveuNFhQwqrsQR?=
 =?us-ascii?Q?8CKjFRX0uYGcHuGELNsTSugo56zK1OkYukohkWxCjg4UOvox3TEqSPRcej69?=
 =?us-ascii?Q?awYyTlNgjk/Ykrl736KEX+n7Toyp?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: aab3961a-48d6-4cd8-19f7-08df465a708e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:30:36.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7036

When applying the SYSCTRL value from the firmware,
aw_dev_update_reg_container() means to overwrite the HMUTE, PWDN and DSPBY
bits with fixed values, by clearing them and then taking the OR with the
intended values.
This is the same behavior as the Android driver aw88399 was ported from
(aw883xx), which does so field by field, and as the upstream aw88081,
aw88166, and aw88261 drivers, which manually compute a collective mask and
perform a single VAL &= MASK.

Currently, the aw88399 driver takes the latter approach, by computing MASK
as AW88399_HMUTE_MASK | AW88399_PWDN_MASK | AW88399_DSPBY_MASK.
As per the usual Awinic inverted-mask convention, these macros equal
~BIT(8), ~BIT(0) and ~BIT(2) respectively, so using OR on them yields all
ones and clears nothing.
Use AND instead, as commit b82fa9b0c26e ("ASoC: codecs: aw88261: Fix
erroneous bitmask logic in Awinic init") did for aw88261.

In practice this makes no difference, since the values ORed in right
afterwards equal BIT(8), BIT(0) and BIT(2): these bits end up set
regardless of whether or not they were previously cleared.
The fix here simply keeps the code correct regardless of the values used.

Fixes: 8ade6cc7e261 ("ASoC: codecs: Add aw88399 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
Alternatively, since the clear is redundant w.r.t. the OR with the *_VALUE
macros, I can add a comment explaining why no clearing is needed and
remove it, if that is preferred.

 sound/soc/codecs/aw88399-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88399-lib.c b/sound/soc/codecs/aw88399-lib.c
index 39a752171aa1..447ac5fb01a1 100644
--- a/sound/soc/codecs/aw88399-lib.c
+++ b/sound/soc/codecs/aw88399-lib.c
@@ -957,7 +957,7 @@ static int aw_dev_update_reg_container(struct aw88399 *aw88399,
 			else
 				aw_dev->dsp_cfg = AW88399_DEV_DSP_WORK;
 
-			reg_val &= (AW88399_HMUTE_MASK | AW88399_PWDN_MASK |
+			reg_val &= (AW88399_HMUTE_MASK & AW88399_PWDN_MASK &
 						AW88399_DSPBY_MASK);
 			reg_val |= (AW88399_HMUTE_ENABLE_VALUE | AW88399_PWDN_POWER_DOWN_VALUE |
 						AW88399_DSPBY_BYPASS_VALUE);
-- 
2.56.1

