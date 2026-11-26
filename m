Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.87
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795728555;
	b=mwjgtZaFPW+giAlJWNXZ2kOXk/G6nDA/6TqI1dwxmhAf2rC0pSeAGiTIZa52767qfr8J
	 bqQ6IyFXOaLc+Yd4YGFyS4InixYVqLhDNd8LUZEMXTHKLA8Ro0L0l4ix7MWECeoNN3S6D
	 JFI7rM7kPx5NL/HLPaYPA3EK7Vqo0d48GtSRHBHGWhcKXothuz4lbWH9M2q8bvMBku7H5
	 O+dXxjBZReTRtgUAf7rLadK3z+BhYbTrm6ir4XRD5WEesn+lZHiBFHcdlA7EHCn141eQt
	 LO678JrAUsUIQcDHY5d7vDVQvLflW4F5+DwvUkpBeE76/EgO53olKxgxrsxkFAoWh7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728555;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
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
	bh=DxOF/X+YPHLS2pFCnJnFWNWXVHkeELEiMM3RNhdyjVk=;
	b=y135wpXbNwhLuicUCwiX8mPfHO7xNAawRT+DpxEuHoaWkjSpuzI9YvX+adoA8bUMG1+3
	 c5yN7pOlLIqi70heJKoptLmvbPaA1yl3Jsrr3kRs1crMkFm7BMQddx8sTxfFikrG1RejW
	 EEg0w7fIogWIKnBCeGXuT7h3EeHdkKzWr6k4h2jAeAmpoUtDR/HogvxdRyG0lrXOYEjd2
	 FDH+wg2O+3263friZru0v3iqoE4HCuLFR1Ih7xi1/A+lq//Y+gKDLkFNJrkz6tStAe8Oz
	 i4unsI/Ff49nulO4710/i9UF6Cmu2DkQuqcL9B8BCzyWbO2vMbPqvMT1ntuiVWLHcYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=QB8r62kF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.87
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013087.outbound.protection.outlook.com [52.103.7.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13481606A68D;
	Thu, 26 Nov 2026 21:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13481606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=QB8r62kF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1tH6y2YIL1KuwUsRhXFqNLSQyFrsdgoOYy411NQC2V16xYdrZmf2k5Xj5jd9Jxmif35Cu/L7AoCt2IjJkz+XalxzpeHCNBZTNdO03qmpVk3zLqGtPqbB8SoyicA+2N4LmzG2vNq5swzxlF2LN/4S5lYOwTxyCfOURyOUnXZ9J3ydHmE5YDWOqDgAumt/dxLF5b5eP5WCRgKgk2ogISOXIbvBsX2J0DeA5tMWAffBqNVEsi38QzzneQRWwoRTZivwKqmmV6JmL7tC1EOnwcR4pIWWrJQakmtxzrpN2n3R9MhOwYBVOBXA4HF0YZD0vFiFfD8bqiWG9hdicSStwvfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxOF/X+YPHLS2pFCnJnFWNWXVHkeELEiMM3RNhdyjVk=;
 b=OXUlFvTkt39VRZ7PSiYkgfqz5qirje6kokLSA+djyq0JQs7BbTJMS+phssKYa37rVAKdRPQMYjFVvweXjErQ+fG4v87HsUNVnp41OVN9aMygMUm8sThA+EcPykep6v8eZux/Kq7Zl2xF0s/AqX+nMKtQWn5C7K+u20h/FI/5yALufE+zBWXvfMFI/fCz1oTRgQj+yTYpzr0nxpfhM2EY9lXB9+cgyk+PlQzhyPvxUbGl9PLxhSnIMRxevEO5hJ74P1J/a40dKGbYNRPu2m4i79FKuyGnTzG42Jxp6L7Vw+eqo6Wm0eB+JBLNsB4quQCGaWF9mjTAZEuaRG/w5M4i4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxOF/X+YPHLS2pFCnJnFWNWXVHkeELEiMM3RNhdyjVk=;
 b=QB8r62kFswzZvf5ahYhBqOdsCGNpbXEc0XPOsOOVqLsFokpIBWWzWe0ZXsK37wMdHvPIxOqgwBYb+3FEyfS36VQqPjw/iYv9wZCZkbzMUOidpdxb743E1BhII4emgktrXUr+Amk4pwTNG4IPrGtrmey2jPhQctF1bAkDTHrBsr1uNNxe4fAvz1F1Un4f8Wef/qCq9PG3Sde2mUxtuILd3J4VEDa9gIDHAh6C9GJuSM62tsxuw6UPipS5QHm0GSOM4Yg7XNODJH4mzpKtK5K0feX4+VtkbtI6JwlpNt5mmFGtnIakT5NVLq4eIO7xlAObav0Gh4ShCEyIZcb8eYSl0g==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by SAEPR19MB026956.namprd19.prod.outlook.com (2603:10b6:802:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 21:29:13 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 21:29:13 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] ASoC: aw88166: fix the expected value printed in aw_dev_check_sysst() error
Date: Thu, 26 Nov 2026 22:28:48 +0100
Message-ID:
 <SN6PR19MB2303E13C47AD89DDFF4F7192FC422@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <SN6PR19MB2303BE99A9E0E7C4F64B516CFC422@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303BE99A9E0E7C4F64B516CFC422@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00008BF9.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::475) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261126212848.11778-6-marco_giunta@outlook.it>
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
X-MS-Office365-Filtering-Correlation-Id: ed880968-a216-4b32-de84-08df4c04511b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|23021999003|15080799012|24021099003|55001999006|12121999013|25010399006|51005399006|5072599009|260925184616899003|41001999006|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GvkZik9k0zdRL+N2VBrhncDvwgIB5TP9du4++WReqyJx0r1E27v6BEwOisX2?=
 =?us-ascii?Q?+/IfPuO7AGfKaSEBIeQCwH4m5PM3PzKc5xFwfdSgWlyjUAIJJrxQ8LgSXI+l?=
 =?us-ascii?Q?X+GF4o0Vx4A3tyDzKxJMubcteJkywJ/kXMXeS1+bjW7/LPyBZn3N09jrDMzr?=
 =?us-ascii?Q?jNIo7flMYI0ua2lakJbuUFsD4fov0+v6HHzVciLVQVlNgJNMA7TRBCpu4XA3?=
 =?us-ascii?Q?R9GQU+pLTm7b844Aqolkh6aho5jsz73AyKHr0oe4nn8SQTiACfH7Zy4tRAHf?=
 =?us-ascii?Q?rhjBaAOAkml4s+UPXKS0tWbBK21uWwndQEEriLMrVjbr0Gas9APScdKEixXN?=
 =?us-ascii?Q?cTycpAeqU/9iacBaLAZE9whSfN08aN6AGaUiK0LKwoqJfZLks2JuiHFrxcDZ?=
 =?us-ascii?Q?2XbuA2ZckuMrmAL4gR121peIAdaQTpLjBkxgqSyKv2JMSwJaAn2M6ESoO9p/?=
 =?us-ascii?Q?zRqkQrYMOzjd0hLw7ymHToewh/57JdQu8i5uiNZ+WnxNt12KFmJv+S3jd/0k?=
 =?us-ascii?Q?zD3bzAQjeUW1ivMBQZjVggVD+Dd5GpkLO/k1J2LWeIISChJMWYI9vjfZB+0z?=
 =?us-ascii?Q?i6LoT3sz0v+XSRnp09qLlkPNB7XmshDYMNu21FKy63wrgPseVUsr96bMncjt?=
 =?us-ascii?Q?B0RcPgr8nQdTT9DylK+lxnkPtp+KAWG3ZeW2VuGTuhacIEMPZUN8p+VCz+CZ?=
 =?us-ascii?Q?Kgzs9epAqGjJk5Q5EZVmpGxQWfMJYSUBVLe0NwbRrF14h/xg1H6tuG/j8p1Y?=
 =?us-ascii?Q?krMs4e3zVgKzb5LwFOsyRJ6caba1OV8QsMIddRfNqxPZ7w0AYu9bzDZySXcp?=
 =?us-ascii?Q?FeaCgWrnR5IcqUrnFI1t6AS+3kzZx+2gcDIksCNlrKxdGGGODVbtAF38R3pq?=
 =?us-ascii?Q?4vreBFsyzah/0Z6DAO3hEs/QrU5ssYzZaKmT5BVwJSlmJhrileZ87MpDPCLR?=
 =?us-ascii?Q?WEarmrMauPJH0M+pGQhhOOX+6H6wS5+G5jbRI/cFPz7SINCSX1demYFdHcvz?=
 =?us-ascii?Q?9w0cuj9Y+CnuqEGEl/Yy0DSz0Hk0g50h5M6nIkAI8EI2NKWcTM4fMQpqZ3/4?=
 =?us-ascii?Q?p4A//9Wg?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6/7WXoA62sVeKg+njCUHN1uyXCQDB65Ybx/JsEMfuaTUIZ9ZNJs8MyUcrEdY?=
 =?us-ascii?Q?QpEOs9+rmwBH3vO27GVWJyiIkHw7z7H0azdrXiHlaCiszijSQZ4yGHoQ04H/?=
 =?us-ascii?Q?5aX60GC4lIH+qIvFPCRtAlRcz4QtRipn6Nzg5jxcvXSkjhOXk13kW//1IK01?=
 =?us-ascii?Q?pMpD6+GdYS+aNPAHyo5L/n2n+JMsY/0c2kh5/OHdZgCI+gFtYdOQq0nc+Nd6?=
 =?us-ascii?Q?5EuNnKyM4jtECT3rvY54LSrtLblYefGPxGF9J9tpVU70jLU49bYUlRvjbbsy?=
 =?us-ascii?Q?6YP1qI6MENECjXIHCKzNO17MNPdHPGnkCvJnCjtgK0XCiKbW89d3XrvoSER7?=
 =?us-ascii?Q?DcrxYsiilRlKgWGX2QbEd54zO3T29zpUa9Jpl+nZPOydRAusPMvJWpgeQ1EH?=
 =?us-ascii?Q?X3u0ewFzdt+JTRYtjElZVjzQd0hzOkrEYz12C0nAmAwFh6rnLsrVxHd2rEaq?=
 =?us-ascii?Q?h881IJvJ5Xkt/lD+K9uQsvTId7QBAvjOoY8ZQYzv8w4XqKM62igphhgg31kY?=
 =?us-ascii?Q?CQLn5UdHeUovM/ijnspEd5jrcl5/TR2IEx8mDNna5nKPA6flz1vV1JpPwoy3?=
 =?us-ascii?Q?Tgb7aQT3wKxgkml7KSwTSzH2srjiGZUL/gzBFKHVjDCcUVKhj0WUWty6e5ct?=
 =?us-ascii?Q?UVGtKlpVtRYF6n9bMOeanqx86+IoXBEznL9tUjHMt+xRXVkIViJzERQWIMbV?=
 =?us-ascii?Q?fJ9+DR3eUt4kDptaqQAYVXypmmMuox5UI6SJJ0nLnRr+l2oF5vLnP8Q29Fxy?=
 =?us-ascii?Q?pcJ7Y/wD9byvk7jT1RNQczjrJZHgqvrR5747DNKc5MDudknGRk4ZnA12pGfr?=
 =?us-ascii?Q?L3b+up3zASmDNmwGBWJbxqLZ8fPFVUhw2gWgjb/jDy219OCG6g9eBL2yDp+w?=
 =?us-ascii?Q?Gl7pq+bWb/FqWwktC2YdD+6f8RnDmpzYYieIqDkKKKUSUazmfo2XzEPOFQ7i?=
 =?us-ascii?Q?nx9wLng0NwVGJNtp4foOLkP6Kl66LhDANLWBHESSDsJEMSghpZbSWdNSrxgi?=
 =?us-ascii?Q?uVQQm+9HjlKkpLiM+lOrYSt9VDMujfjLkcgoAaao9ro8RYOHuL7Eb8HwiTTB?=
 =?us-ascii?Q?lOCYe/oV2U0waRUORruTDZHN6ED3Bz4Au1KaQ5kTugB9VBfIsSxjIlQoDm5X?=
 =?us-ascii?Q?cdgKwxkfaao5x4Rnv7syEgOOjApcw2FIrdAPJ66Oqe9PStFzJRIBn8BSgXla?=
 =?us-ascii?Q?3/4pyMkkFZyYO4ySOX3hZq+QPSKTSXTpoUhHh4ezzez7PwZ0VR2kVzWU9imC?=
 =?us-ascii?Q?p7uv8/oxl1ZdyuWAGqnGTBVT6aryZQkHz1t4tJv1Qns/gid+ejsojiNRZ01h?=
 =?us-ascii?Q?0wSVZMQnwvyDNC0xRbx6dHlXU4L2bhnemrragNDoEHPWLUHOqBuSp9VzWF4M?=
 =?us-ascii?Q?YAZxA3I=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ed880968-a216-4b32-de84-08df4c04511b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 21:29:13.7475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR19MB026956

aw_dev_check_sysst() selects the expected system status in check_val
depending on whether the noise gate is enabled
(AW88166_BIT_SYSST_SWS_CHECK vs AW88166_BIT_SYSST_NOSWS_CHECK).
The value read from the SYSST register is then compared against check_val,
and the function returns an error if they don't match.

The error message, however, always prints AW88166_BIT_SYSST_NOSWS_CHECK
as the expected value instead of check_val, so the log is wrong whenever
the two differ.

Fix this discrepancy by printing check_val.

Fixes: 94e412c28e61 ("ASoC: codecs: Add aw88166 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/soc/codecs/aw88166.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 92034c90d8d7..89ef6af6cf68 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -205,7 +205,7 @@ static int aw_dev_check_sysst(struct aw_device *aw_dev)
 
 		if ((reg_val & (~AW88166_BIT_SYSST_CHECK_MASK) & check_val) != check_val) {
 			dev_err(aw_dev->dev, "check sysst fail, cnt=%d, reg_val=0x%04x, check:0x%x",
-				i, reg_val, AW88166_BIT_SYSST_NOSWS_CHECK);
+				i, reg_val, check_val);
 			usleep_range(AW88166_2000_US, AW88166_2000_US + 10);
 		} else {
 			return 0;
-- 
2.56.1

