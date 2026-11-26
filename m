Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795728546;
	b=rofGI8lKEQ0uZZPWeHUzfMYG1WcIlvdAg2t2TCfFiKscw6tFyJADleVz7WbwtBBbuCkp
	 kLqBeZvzcKKpIqyAn4W0GLfTxhE8tmA9xAuOVw+U0ussdbI1Ej5RQCBmdddnb2kOLzTg0
	 So0kYVo2VELjg320oPIe0WWXzxQk9j1tZxGt85ZmiTvqzYQNNmKhQxU7p/VH46GXQ7p/y
	 rxYR9eh6QPnUDQGHkT7QzzcDP8xbrWOIr+gnOuWMDKlh0e+VboElZ5BWg/31Tgx6Ut+Kj
	 0t55EyrtQdEWdZe/Bf8UBGMCEKmreS3fQO5IbBD4lgdkMj3W5ht8Db4/+KVHhRP+5MA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728546;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=/pd8AH2C1shVxiePYlSi/FwyD2xfwHoZ74d1HBLLDvM=;
	b=TofklVJoAq8fMnix9OLirFi+Vn5XCdqnM/MyZS/SsLLJHAiczfehr7IM4pmjE4BUbail
	 6TTFK6LXjhmdst4j4rqkQwmv8rnVma5erRb0ERw2rjFIn5XjBR7Vt4l6mNXKSC/rznLG7
	 3/8wMxRm5t9XLIlazy0BxiTZvj9LC4lptDJjKssVbATbcfcHJEFGkrMMyN8drV4ZejcBU
	 UFYcO++mtXc1UWDDgmlxVxzpQZJQLMzsvZjNThN11LXndu+n8ns4e/4WuIv5IPxuV8wJA
	 VHe2+p6HR1+/LMD/1GOeqaSg5xure/3QWAOhnknqO4fDnZDCVTfznlcwU4A50ywY84A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=h69kyRjn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.20
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19010020.outbound.protection.outlook.com [52.103.7.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838C9606A31C;
	Thu, 26 Nov 2026 21:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=h69kyRjn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J68eh/3YHTvrU6tSXbFh5ygyUqqaXg5Zj+fRVoJcp7b31GoV4o34n3spdOidGFtVWI6yg5XzDM+jq3n105uC//wHvPDV25C/YnmuHl74DEoZulrqFziao9mtNVziS66qplPBx4YkkH7hqxB4TC/GMBWd4eYbUQi/ddWT1kDQyrhjQVNGmhPp2Gacj6v2xSp6pMAiL8SinWRJER9Y6xFjUWbGy75GODJ9V3NACQhV3ODFFpBWnsGZaN7JBc06B7tQIaQYkQmPOQkwzzGCBUksHDWVeq9d8OqfOOgyvIG6KL1KHo+fmkckLkgk8Bix031VMO0x72czywVkQzOiXvaZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pd8AH2C1shVxiePYlSi/FwyD2xfwHoZ74d1HBLLDvM=;
 b=lw/XyKWfyH4VEMPZiHm1GvHZAkBl3BIEh7CQylqCVN6whfjfM+fUpMlMQGkybPiznfjsregXR0KWuJdqH21zy2AZF7ZoJ7UsoalQvUUdgI4uuSb/lRzQ8DNW+EEiG07uhh4qDobohKJRUxjO/kjPhxLmTXFme+Bif51OjXRMRwkVPZ/FntFwjnpS27VyldGifmK4TruUtV9/O8hlda+4H5IyUI2l9AkKpa1jzKbU8dzH9xhQweQK5682e6uDugw4nmeQnA0P+ExFLpAuz7WLT+o0WqPqilWsRK0d+BJbxgkp8q1edYQs2PWIiJ/2esvMWhuOCg8BBe+lC0HQNHqieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pd8AH2C1shVxiePYlSi/FwyD2xfwHoZ74d1HBLLDvM=;
 b=h69kyRjnKty/yKmkjQQ83US18v5i1F9qlQ2TK9r4kdb2Y8geHhNPSCljvjRfBDi1x6IucheLRFXrs88E2g2YHWfietRWhco4Sjf/GQ2LNkWLI0AqNxCywMjoWgyp59HI5GPnTHzC8UZmrahZF3SfNNsgop8F6yZHnQJPpdOnl/kG7c6zfSl2vdcC3dNivC+7odMkR4vsuma0Nzc6J43tWmSsyDW8gOt+REmJ53nFlxE5ABIfu+zNsEDmj//+4ItqffN7Kr9r/jO2u1Ln5afbio2NgEAsKoihMbMskPlAAKTuYcIj4vB9vo2pKTyeJeFDcDPA4rCF4F89IpBsfL8Z+Q==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by SAEPR19MB026956.namprd19.prod.outlook.com (2603:10b6:802:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 21:29:03 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 21:29:03 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] ASoC: aw88166: fix RE value accumulating bits across profile updates
Date: Thu, 26 Nov 2026 22:28:43 +0100
Message-ID:
 <SN6PR19MB2303BE99A9E0E7C4F64B516CFC422@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00008BF9.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::475) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261126212848.11778-1-marco_giunta@outlook.it>
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
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|SAEPR19MB026956:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa6792b-d6e7-488d-177b-08df4c044970
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|23021999003|15080799012|24021099003|55001999006|25010399006|51005399006|5072599009|260925184616899003|5062599005|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zvDjOnSGnAYk2DhsaUtlrKctl/6210HPsh5Rp/unSvEM+QNoZOEvaXS+d+co?=
 =?us-ascii?Q?mPpqONZ9K6s3e39U6cyoXij795ODKsUxdxtM0h6/TV1R10RpzFbhkiS64nMW?=
 =?us-ascii?Q?SzEyBbF5BhuJquxmYcNV+LOht8DOT6tkc7Va+6CYQFnDUl7gQzNm/FJsAmwJ?=
 =?us-ascii?Q?x1/fbnTrQjle0uo0jPTQQaUjkvyzGEkpFJ7WN4tSWgtz+dijELh8AuWjtpV/?=
 =?us-ascii?Q?UYzVslo/Ej2iFEeqlowbdGKEaMhYMDVeTbGY9JV4dMw95Wkkxrd6cBrw35kg?=
 =?us-ascii?Q?/QFTB34W9BPCZwf4noz1tYfp6DCm6I/UTyV09tfCVIGtTI3EX8bHM40q9OcX?=
 =?us-ascii?Q?SaBh+hWa/rhV1Hxcj/EMQavgiplHlPb3kBnaBdNOdZAuYZd12HEbYQzOGBmb?=
 =?us-ascii?Q?HsX49Go3pPFM0sVAIZwsXRvtnqnkNKBJbvftJEhmDav52+Kzu3tSmFdms4oi?=
 =?us-ascii?Q?Yvp09COHL/2Kg05qanfSU7dBevjHrB+0a0uD6uqjqGmoiqVC52qCsmaKsUNK?=
 =?us-ascii?Q?GYljhSo7mxeT5vFXY03E5UjIDgdw6D5BITIETMGRoN7F81ud4y8pnmkV8tqo?=
 =?us-ascii?Q?yAo2iUIx6LH9g86vTLH97mmpct0CbqhD6x/y/BGIVFgST6dEiJpjjg7dnpVn?=
 =?us-ascii?Q?dJxjfMpaVgSnArOUTEUnTfng3xQrZb+yOJ08Kgy/hp8KZVb41wrrST/gskg3?=
 =?us-ascii?Q?90YH7oo1k2rJEIjYxXXZ6pdf12BgUQ+3+r3k6cIT4aNploa5nT8f0FD4dnqX?=
 =?us-ascii?Q?WFRfJMehwqSl2jfx9U36FsNIdWFbzXS7vgY86jGley6ihwUrFjUKxom8QUN6?=
 =?us-ascii?Q?cbJIyWk6UBGJ843dPd+N/a+oINI3jIIXOOcZItmNICGwWjjfBrNsVcqQNfdB?=
 =?us-ascii?Q?ziYC5tGfx0dX15s/aZzhc1wfqHbeFpKBWaPIBSawjaSeR6mcbhdGuLEAq7Xc?=
 =?us-ascii?Q?kOhoT0aTUmlFvXBnNUKz1nNKd7snYAaJ+Uj0VTgKW7p/FilmeWGfN/wQARSg?=
 =?us-ascii?Q?2zL9SulnkH1A1nGm5UQtvM8Zsw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZTPhrFBh1jjS4+BmQcBwFplHgRDUerD+q+84jzDf52IK+o4Mg+EnHAWJAW0t?=
 =?us-ascii?Q?GbXzB334RaDu9XHGwe5H7n3vudow25lZKa5ZR8hKU+TKZFNGGeX7f4NFTJxQ?=
 =?us-ascii?Q?0BKo42/jEdqfRGcRZf3Bu3ULlWhRpCmZDTeoyH040iB56pOuphQ/pfA0y7RA?=
 =?us-ascii?Q?eOrsCVv3pqhkZuxNHp3y6IqBbQvx9UOrJeBa4/bqYfBjOCpWXiFBd7aBNbwY?=
 =?us-ascii?Q?6rQ9/0fgHqpjaPR3x2C/hv9tv3p+LP6hDKDWuwteA4ZAe1m/5utnNa/Ymcd9?=
 =?us-ascii?Q?r/ZGqJ/sItRxPm+hEiSA9p+EKjaD+5Ip06WNecGGdf7BM6SoSjQq2sup9QQA?=
 =?us-ascii?Q?VyQa6ui1dILgzemN24b6YptExhPDbi3uaDOhoB06CSZMcmSvraBgSVp3yCIO?=
 =?us-ascii?Q?THMN8fyeybjq4pW6EjHxoEC6gLCAHp9odETBQwnx5IyGJGLdbmgrtibkd3qS?=
 =?us-ascii?Q?zA4fvwx+7W2Qn+SSogq6fjwrX5wgLZWXdlZ1cENrY6lk2zcfyk56VP0WIrfr?=
 =?us-ascii?Q?tQrJ5ymlyIBEl3dDwfbsR7NV8vxihV3JmC0NGrHJohb4qSdVN0U9V1NZItAX?=
 =?us-ascii?Q?nvyqmCubwIAwC265K1PzolqJhNpVNGhSsC8NDAR0XAzKFekIfgDi6jdUXkkI?=
 =?us-ascii?Q?CNYj49J8fPJ9Vw9Wkg1YB2CqVel9WOK3w28VDvQdyAe+w0ZfE+Pck1oqd0Z7?=
 =?us-ascii?Q?wgYjeNWEOmoJQvEPRWxTpFXoAJ+eCb93tRLvNVWzec+W3CKq4PU2ViWp+j0Q?=
 =?us-ascii?Q?0FkuOpTCS51lfbTuxJIhVINLYztrLDy6L6kETHhfye/d2ss4Equf+e/kECPO?=
 =?us-ascii?Q?AvRP1mBu7DlaabQaCCMry7FP0RYYUvL5yNav4tiJTefOTjAtXorL9TiOqN39?=
 =?us-ascii?Q?Y4eGuEfoJ7nkSReVYSbcLR+InrLn0IPcsSGoekh74IQ4nkJhXdcEfLPmbQRp?=
 =?us-ascii?Q?OP8HKW68kQlGODUREHoyWYbVbxDeMhKl6cNquYRNkVmBAR71vdpxFPL0bLCs?=
 =?us-ascii?Q?ka9xM4GLArc8PmnpSx4R6t+auiFZTPATTMKRuX3yB+qOkcXMbucv8QF+Gc3M?=
 =?us-ascii?Q?l0O5XMArEwvSfVGTgxIUnGJzspgr5Y1QQiZKaaOdKxlqQ9gi6pBz/gcsSl+R?=
 =?us-ascii?Q?0epxXfAVDnlL5NPam9NeC2ZFY7t1q5n6oOCOWKd81WbTj7IKqG91XXhMYawh?=
 =?us-ascii?Q?bwRe3L5GgjMq3gZY5BkSL+XZRrgBGlhzX5KANOkkiToXJuzezhthgr1iQHN3?=
 =?us-ascii?Q?Slb7tV+8naccGs1xGS80fQq8AFUi6Qv9Akhy7D+qBI0CizNG3Og2Vc5Pgrvm?=
 =?us-ascii?Q?khmRZiHCFL8lSqmNc7YrPyG45f0EXreuDmh7VZUYw4Gj6czrSqHD0GmpnoFq?=
 =?us-ascii?Q?A1EHxno=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa6792b-d6e7-488d-177b-08df4c044970
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 21:29:03.8053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR19MB026956

The RE value is 32 bits wide and split across two registers: ACR1 holds
the upper 16 bits and ACR2 the lower 16 bits. aw_dev_update_reg_container()
assembles re_init_val from the profile's ACR1 and ACR2 entries with |=,
without clearing the previous value first. Since the function runs on
every firmware update, e.g. on profile switches and start retries, bits
from earlier values are carried over into the new one.

Clear each half of re_init_val before inserting the new value, so that
the profile's ACR1/ACR2 entries replace the stored halves instead of
being merged into them.

Fixes: 94e412c28e61 ("ASoC: codecs: Add aw88166 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/soc/codecs/aw88166.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 19436c001a80..b3d11e1b5d67 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -988,12 +988,14 @@ static int aw_dev_update_reg_container(struct aw88166 *aw88166,
 		}
 
 		if (reg_addr == AW88166_ACR1_REG) {
-			aw88166->re_init_val |= (uint32_t)reg_val << 16;
+			aw88166->re_init_val = (aw88166->re_init_val & AW88166_CALI_RE_HBITS_MASK) |
+						(uint32_t)reg_val << AW88166_CALI_RE_HBITS_SHIFT;
 			continue;
 		}
 
 		if (reg_addr == AW88166_ACR2_REG) {
-			aw88166->re_init_val |= (uint32_t)reg_val;
+			aw88166->re_init_val = (aw88166->re_init_val & AW88166_CALI_RE_LBITS_MASK) |
+						(uint32_t)reg_val << AW88166_CALI_RE_LBITS_SHIFT;
 			continue;
 		}
 

base-commit: de56305f9c90fbc5d78cbf094e6d1efc252bf835
-- 
2.56.1

