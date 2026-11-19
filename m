Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795105867;
	b=EN5/Ojd2DxcV33eQW7JqtOv3JqXv2X2VSJDUtNkHr1rEZumadeI5snF3fKCbew8PpTT5
	 l+UAXOfWUDp7Fyi+EfvUz+qWXcYzmie5xB3h5zXXP0hDcB8MX1L0q6yilZm/Av1hAK2hh
	 G8IOuZay2fFjUe7TytBgHrswrTt8BGTThbFhFC2gBzYbaiPG9tO2bpmroGsxrmc0/nE/X
	 mjw2UjwKxlnvmDxKs/9ETzoiVZW4U/G4f3YACMssHwKm4scg5CZP760cLF1SObxjO8p0d
	 S6aUxzWTGnuJNjpz8qMp+/Fg7SnrQYikdypvPyUXWIbjfQpNwOQ6SzL70JlcBwb1Jxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105867;
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
	bh=+QBWb7bJQKZQcJT/sqbacYIdmlCvzY05BbEK7XaUUbg=;
	b=ULvSdfM00egidRKFgnmUHnBixTodKYc1edKra+Sw+iWnjCMG3TdiYaVHmmo5Rcld1mmT
	 GWYlEmZbcNw891KkX1X5Aj1ghyRjBs9024zYinOcxx6Vz9czzvVfcwr1JFH4K6uFHOeIs
	 0d7NMOB4QKUyne8k8b+Z8b7zGvU3VzV8jICaFU2lVWjognpmO0gXBsa4fgdI0BXY14l+K
	 YHXGnTqyn5z4MvldnjezOLTjtNZ98IFV4P6kgc5oxzRMUNhgxPUmG0z08b5KT6n5Lp1ss
	 37XPIlihKDPjPf5eUEcpG/S2BsshiumMj9fNNTUwa9QQ/wrWxf/HUh8pvQ4Zyq/1AVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=A1rW2Us7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.37
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011037.outbound.protection.outlook.com [52.103.12.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205B5606A320;
	Thu, 19 Nov 2026 16:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 205B5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=A1rW2Us7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjE1tgjj3UTFMIYwtpkC1m8nj7R9JtEsNoSAqI0SJgGTB3AEQPxOMK8YzWPeIzvUlAYqRLQ3ZCOlDy/NY8wEI74mSMJBdSFZnnLW5gi+ugzLLllFZbuamQvjyR022tTILQTzYGjIucZuhH94bRCVhZAUoEQIvGeM8I5mVzbG5abULCBs4G3dY1Fwisw1akO0KEp3YEHaq1ljETCSylzwZO0NQXeJxH8ktYwyVAwFHa8gtdKcyzZuLRMvXPfMkwx/MPNnu0P7+1g45aQ8KLgX1sTTwJ5iaDAxljf6+AyT5kE2wo9RDqDZFu2EowQjQJeLCo99yVonUYMmVgedt/GGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QBWb7bJQKZQcJT/sqbacYIdmlCvzY05BbEK7XaUUbg=;
 b=qxiZkDQjWfmTLgY1AejUejh8V+S/IXIF5ZgrfoDnPhGWO9WRZh5quyv6M15tgU6rNrTmBHz2mce7UfXovLBdAw+5bvccvqY/yIJfKpyP2zsPHr/oFygeO7tpMzRXZ0wS5l0HzmUoa+FXL6OyUcJZkRk8mO5MAvn99cDOstn6VO+1o0iFhw5oEzaPtClRFIzH//jYzL1dN6up8abFdXpOXcvybqS8nvMvJNh0Hsj6vUt5tkNQSM0hqiyvG9vjMyJGy2fDH0TWjkgTSDIr38Ns6U8TtCljkaPhXOWmOQADYcFcAL1aCZNOB7mZIxWkPIYTZDCdmUTJM10snCjsHYkLTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QBWb7bJQKZQcJT/sqbacYIdmlCvzY05BbEK7XaUUbg=;
 b=A1rW2Us7qt64I8wzBYEOcKy+ufckBzKc5uxuTsYVpLpyHO8+PRPqSx5r60/XFjQcT7w28La3xhsgfOpS8xkNHoX1yjYQVfo+d38cr/eZL+fGL6C8SSqhsFPz/8d0VYuoACCh/h7Nqh9lSx9Sc4eZ8uEIw6V9VZhbhBCKWXOy5AK/YqEp0AzDV9NqqjCF17RXnhv1B0NuzgHW/Qp1afTStehHpbaZtyhbnazfsIb/MhdaBJqY3fU4dJs/YQa6L/QcNpfIfzSBOblTptj/AEzjs64UWYbB16LyMUEUq1JMeLtEUug78j//9vrHRUprWakHDJk13prK/BeOEokEt3RTwg==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by CY8PR19MB7036.namprd19.prod.outlook.com (2603:10b6:930:58::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 16:30:34 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 16:30:34 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH 3/5] ASoC: aw88166: fix clearing of SYSCTRL bits
Date: Thu, 19 Nov 2026 17:30:14 +0100
Message-ID:
 <SN6PR19MB2303CBDAF11DF2405D138159FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00004E9D.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::454) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261119163016.30414-3-marco_giunta@outlook.it>
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
X-MS-Office365-Filtering-Correlation-Id: c1cb9749-cc59-4269-8479-08df465a6f82
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaXUDTEXJGQWx6OympRIZn09tMsIzoagvKle0WOwjmxuabCv4YC9UKqhYYGy9GxV1DuSINI57vjEAcFNAAb643RjxfTT2OPo11Jmn/4xzoqgfGvNCdvuPH41OAVBROCurFImf8IFPkR49DCIj3F4WN4NJIJuootazEcDFn556C+KnDBCmpHwTwtZG+KVj1yScPqbdo2+TN8pnFzTrKosW8g3SZC2aXyu4TTBGuy29V08v+Zeqrhw6nLA367YgL46CImeRYVASxvGfiYzaj4OsoDb95EWA4EYZW5Fs2ScNjG1drWPl9kVJhx+2JQhb50x/J1qEH72FsvongTT/PFV6wi4I80WwfdVqsJrvgqyYlMg/TLGZHEKihAuPtCIBBItFEiNFOBiZG+IwekOB/xHbY89gDEtakn9ndSNaMJ1FdI6POMOEyKQIrq2FaORzP3lBQ1yv2OBO7oCtm6zscU0CimddBNVfqp6RHsHJkAYXDBTNWXJqvP1F+WM01Re38oT3refIU4OJifDR1xjeQ5z8rrVEpDU3EphHworHeXb2UZZmGOpZmETNH1yVyQiBCJx+k99PwTOlieaVGUKU8Jb5pJytRndqbWpNYD/NIuNLuWikhAXuFKU/+ZXJ6FKroAm+z6No+SxobYqhqD5XbZpvAstOLVql5s/GFiR84TXv2jdwPQh7Mni+Jw7SKW3uRKYhcOoVknG4WEw0cy5kkSR6niVAXFINAgZbVkzWgIHwFUWBrYXpeA6dgTEBZsffKZGlR
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|260925184616899003|25010399006|55001999006|8060799015|23021999003|51005399006|15080799012|24021099003|19110799012|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3C8qn3Xlwkt7FG0opcdvPC0iwN0lfNpXpUXWkgmCICSXSbaAv/pCXdV505ki?=
 =?us-ascii?Q?yDwIULvNKPMMJ+HUX68bAs6RJAZ+X7d9BFRaG/h7PUIyWU3Pwqmq+MTx/K7m?=
 =?us-ascii?Q?p2gkg16cxsBDx7vLlvu5SKOikT244irq1v3wFy3sPcRBVQEt8Q4dfDxtmYUd?=
 =?us-ascii?Q?7JiMsh4rcQt44dNjWxxHGRy3Mub7lgqhyp3XRfnsOTQRBPGTyRPtDOKxDlbi?=
 =?us-ascii?Q?7pqi6fHuORxB531Jt1o9YDnIVIvKC7NKrPTFG7wm5Q5mQKLr6vETP2F6PKdy?=
 =?us-ascii?Q?eu6b00VWe0qdIvWHm/gapqkE0+VsbMc5NkaFIuLO+Rik166HpUeAJ3LffTA2?=
 =?us-ascii?Q?RaWUl93yAQ1/00ZX04zto7Y+zzCqGM6NKtjil0KI75m9NS+bZ+XWnNEztP7f?=
 =?us-ascii?Q?DvmZuFbOkkjAjANz5VngAzCRNsX+J+UPzHG9ut1DeDIeHxqT6YsDMkGCuKVh?=
 =?us-ascii?Q?GXGsLvo6jaBCkQg7urwV3YY0u75vR7w+Q6roCVdydd6L7PxS6CF8gjfDy0oG?=
 =?us-ascii?Q?7KVO3igg2f/SEWLI8m8632fi7LqE3SNaqRKALd3JCiXv7W0VS9lZ+/4LSfK+?=
 =?us-ascii?Q?/XdbBF5y4+1Jw7PsDYTpaSBA+6cMjxI+8TgAPQUqBDDezUzXDbauVt7oPgcv?=
 =?us-ascii?Q?/nYC4NLnBfPLdff2lZ8FMVXPI7jSRQpemvGyPNp2vDS1s7zcL85cs0ieJDht?=
 =?us-ascii?Q?dQrvWg/MToHM20Xk/XmozquF6OipO6GY5Vn2qnvB0fb+FltajxKnJAwvg0eO?=
 =?us-ascii?Q?sPL5exjB45S1Q3o/zdlKW3fF9NwDpJVp/YsyYvDtvuq/xVGTHVOB0gcHm4i4?=
 =?us-ascii?Q?HeNrrRBmWP2fuhDEbuArz1+AhvpjnAwwUsO3o0cBFtRsKIXXlXPvfg/EVwjg?=
 =?us-ascii?Q?+w0SubXgebVehLTwDzK3TEcEul9vOYaQojqthgT7yhm+oIjIvL0/NIM2g8V0?=
 =?us-ascii?Q?vYc8IKsdrYTvs6xVXsHyoIAAxve8q6BCpEe9w8DGt+vzk7gTy3L3qPu4TXB1?=
 =?us-ascii?Q?XwrM?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PgxoG33shfAjVJe7V3XpQg7V0SuKxunk58yLWi60vHYV4wjMsZnj/nhDS+qh?=
 =?us-ascii?Q?aTsqev+5vfc9EZPbTSCa5PxtvPwCFxKDWLd6HTYVATPorgV929je/ianyOGQ?=
 =?us-ascii?Q?JViKQ1SBaeRSIaWprV4jPZ8/n7BaS715Z4hwoMLd+JNp6i2yN7zXCevcuzFu?=
 =?us-ascii?Q?hbn1gUPOCYb+cok9QpFi+Kb1UhGjCgPxhkq2K9o/wKPanhNjrxY78Ohlo1cE?=
 =?us-ascii?Q?kztQLrrm5tnuORvHmph/2JuiysfoQaaIzrvXZwUxiPtDAJdoPGDhI4uIXHPW?=
 =?us-ascii?Q?7khrlwSBkMLdFN3QgSLA/rMkSOyEADq+xkRqyoU6EjudusXiKhPd3h8c05rP?=
 =?us-ascii?Q?G+f0rlBlnye7i7NmJkeu+2w14+i/2rjFgbpse0f6GZgrNpS0SgSL2CUg52XV?=
 =?us-ascii?Q?hAaih5FsNFeZBjQkZpv7eMpX6RT3qYmcnWNIrcHFc3sF87wCGi0hE/SvyvRo?=
 =?us-ascii?Q?e5+LuHPkd2oGS6DocaYtAnAfcdLN2YMtEVpRmrTHVERlmnffdS8RHpyPJijm?=
 =?us-ascii?Q?K5hr9cYlqQSTQfoRwrYuR7os8uwKQpyV/fz9DdkrZncbXQdM8PBFq6KWohfI?=
 =?us-ascii?Q?EXl/ClO07eONkQzb0rR/O+0mpx2Swpz4QuSALedL8t3Ocwxh7AGhxWjes/0X?=
 =?us-ascii?Q?eB1fGGpqOEuIdzGCVBZlxPEMuxpgx0wMEokuZaJEvFQpq4kLBGpiziX+OG8o?=
 =?us-ascii?Q?GcnaUuSehzkieuWwrPK2V4ZnhmdIW19EpbtcWVjT//xoBJacK8DNQH+1o4ji?=
 =?us-ascii?Q?C9RWtZBjwgQWQLPVF6Qn9EQg3GLJqphEl6ZIr2Ekx4LDuLlWjJcuglrqHaA5?=
 =?us-ascii?Q?vc7YjoPOa/VIldeuqZqEosSB2c/DWdO+mlKQSJDuzXK/tC4KC1hJdM0qXK9c?=
 =?us-ascii?Q?D8Yjkojg7ZgI3UxN9PCRvHAqa3RqKmrNjf9qTQE5SsjykJs/uA44q/PEMKnx?=
 =?us-ascii?Q?rTVBtn+meG6+rizkeQ8sNKjQJVxMMtwsc/jgnjzokN9nC+FvlFlOEtkv78Ct?=
 =?us-ascii?Q?WQw8xP5c2FyS4hAWaG736wOrRbM8om7obWCpU3OXrGV+eqWecZIcURdcjV5c?=
 =?us-ascii?Q?KHOC9rHRqdtQxp3eLVO9Ctn3WAE5ZXPFdEsN6kmPTZzhuVicJwXAWhcZVi1Y?=
 =?us-ascii?Q?W1cDdehzGOVZhH9RFyPQv886IyxJJn6HzVHjgsXKFmt2iVElEqNqqCLNibj3?=
 =?us-ascii?Q?+cbqLizEGIzp3Pgas159WOlOYOblxLr3fRCT/+W9cYgsJG9m4T2zEdMnK5kj?=
 =?us-ascii?Q?bNuB3fMeIeYDEZvaFQ8fuzlBuB84GSDrkn0h7YC/xdgbBxKhYwZ1NI9vrVxW?=
 =?us-ascii?Q?6VklXvtQXM9X3ccWpRMmL0L5aWqaCZ1KhlzR7OCEdG7DZwitnb8n2YzjM2fM?=
 =?us-ascii?Q?uQ8EhrWHbWf77aFj/PvfitK/V6nf?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c1cb9749-cc59-4269-8479-08df465a6f82
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:30:34.3697
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
This is the same behavior as the Android driver aw88166 was ported from
(aw883xx), which does so field by field, and as the upstream aw88081
and aw88261 drivers, which manually compute a collective mask and
perform a single VAL &= MASK.

Currently, the aw88166 driver takes the latter approach, by computing MASK
as AW88166_HMUTE_MASK | AW88166_PWDN_MASK | AW88166_DSPBY_MASK.
As per the usual Awinic inverted-mask convention, these macros equal
~BIT(8), ~BIT(0) and ~BIT(2) respectively, so using OR on them yields all
ones and clears nothing.
Use AND instead, as commit b82fa9b0c26e ("ASoC: codecs: aw88261: Fix
erroneous bitmask logic in Awinic init") did for aw88261.

In practice this makes no difference, since the values ORed in right
afterwards equal BIT(8), BIT(0) and BIT(2): these bits end up set
regardless of whether or not they were previously cleared.
The fix here simply keeps the code correct regardless of the values used.

Fixes: 94e412c28e61 ("ASoC: codecs: Add aw88166 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
Alternatively, since the clear is redundant w.r.t. the OR with the *_VALUE
macros, I can add a comment explaining why no clearing is needed and
remove it, if that is preferred.

 sound/soc/codecs/aw88166.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index a520c9089425..226a36f041d9 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -961,7 +961,7 @@ static int aw_dev_update_reg_container(struct aw88166 *aw88166,
 			else
 				aw_dev->dsp_cfg = AW88166_DEV_DSP_WORK;
 
-			reg_val &= (AW88166_HMUTE_MASK | AW88166_PWDN_MASK |
+			reg_val &= (AW88166_HMUTE_MASK & AW88166_PWDN_MASK &
 						AW88166_DSPBY_MASK);
 			reg_val |= (AW88166_HMUTE_ENABLE_VALUE | AW88166_PWDN_POWER_DOWN_VALUE |
 						AW88166_DSPBY_BYPASS_VALUE);
-- 
2.56.1

