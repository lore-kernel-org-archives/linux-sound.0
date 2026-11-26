Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795728554;
	b=bDbc4nZD8b/oSxXok3eJX9ripyj6ZuJyisaF17kDn35C6JlNJ2eGUM6fP7eSZjbgxV7A
	 qNYU4maleWxcmM2ObFSjGjywbr2VjENg6nB0Y5YEwpnnK9+6PihEmRO/OyLGZrIpi+CvC
	 qm/7IKGvYRp10j8dan/cg91vmVYOPULmyg9rywluesdINnf49eFnZONANKVTTfeHE2Oxv
	 7h+P5FtjYwsxpJBKDfBrh5YDVu8sTtHZstyDvPfy0TmoJ8Hq4FlVDIGVmXfeenEOanTv8
	 e96sljLnaH2mUWzSEHy1OGfY7GqjQLu8X1w/Q2MIsHw2UAi7sSe8aaPP6Bv53xrTxuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728554;
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
	bh=T57u0QFKElkHq4G+vpvNmCnnmT566Sh755Epkdaw9JQ=;
	b=mhnIO+Fbgi/MqISp02OeFdlVSEEWSWO4OD15+pv2rwuhcfnBGINkSQm0r+Y32J3bWzzH
	 r1NQc9sLlOHPagutq96jbp/d3uJ+yqu+9ANjg0Bcp600+MoZPLk+/4QKUVt+aJGEDMp4n
	 vckqMr39ndIsJuQzc7JTRJtdC+NvvpMKOrO9py04U0T6j1nNHFfx/wJTntL8vSwbpms6/
	 C+wbnWqA5NTvQFFecd33cmpzAo1J7s1j2+lmuaBCiznw/bVrj/I376sEU19lv5/asaej8
	 DXKBWFqXTl251VcdeyCY+MQu6HVwfMoecaINFd/RYuPK1ZcCgPt4G/8b+Jm5EBfTkQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=UpSlODpD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.75
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013075.outbound.protection.outlook.com [52.103.7.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64731606A327;
	Thu, 26 Nov 2026 21:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64731606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=UpSlODpD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rz26C8a2VV/Hd1ssFQzVmu4gw4kleaKjft6IThNd1A5irmror1JtXvEIV7oly1rROKRUPpkeh6scge2Akgqn/cDiCu/5ULrFzNk3HcgZdoixWfvt6i/VoQx3T1VP7k4bCgtRAhLVhMvXJ1+JM2mgNQ0lQC1BePqoQoxCz708y1hYqIXRO0UUfc/Tp8UrCRzDuiOIb6OxC2igqVlVA1B71cowA1cC717M28QvGANhBPeUCo/zrBH7P47s8u5+SO+yZOT3fb7QpBETZb6LlxOEIL2zIXtUtqP0yJmju2VAK6S9N02SHJEZmvOjZySKq8kr3xGV+jYxz4cRsZv7wKXKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T57u0QFKElkHq4G+vpvNmCnnmT566Sh755Epkdaw9JQ=;
 b=flnqxQ2gLLEMQhE9TcUVMvNchLC7oLjLktNzEPGPm9nSGYg6wWPUhqKnTDcw3I9ka04w/+lxNAVRtk2cC20srgjU4n6PVG7YlZvZBEzNIooxGcqGMnXoDxb3YBHmTESUpR+EmhcwaFLUsFvlfOpPgs+78/eygb8ji4u1vIXXYnhAhSbkhgC4lhWDgmiO7IESKaEhDcEUdHLkRai8sBL7NAAKXxPTh4M0Ltr+Wu8ArM1ZKgfHPS5RBk4STmEw5ipnqnLZp46Or7jrZwY8Wv1JQpA/VFOTNTFIoloWbAU9IIxrNON7Oo/t2OfjC3Sg4FsO/DCWJ4VsqOOzcc2Myn9Lmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T57u0QFKElkHq4G+vpvNmCnnmT566Sh755Epkdaw9JQ=;
 b=UpSlODpDw7leVEpF1llPxGzBQsw6ItZ42XVHfGX3DKdvytg5ky4av68kyi/BlWuTYWxBjURHminwS9ZkxpdR6GD43Pu7F88QzS4kXTrLH9pwCEdzGO7sKniS1W13/TzDmcsmBuEgX30zYC2V0UEBH937MeP7X3NHC1noIP4nQK3m7vRxXIQHFbZkVupGzQZWN46ffcjE/fh815pVqLVCGIhtWRuD2wUVQlBHPUzYnjCk5RanxtoHSs4dRhU8wdTGNX7/bpufNDv759kTDdqHscWwUgwRUxeMcHrPDPHJuVVlwaenw88ALt8MpU+HUKCYYfg2XoSku5XjAD4GAv0YPg==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by SAEPR19MB026956.namprd19.prod.outlook.com (2603:10b6:802:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 21:29:12 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 21:29:12 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] ASoC: aw88399: fix the expected value printed in aw_dev_check_sysst() error
Date: Thu, 26 Nov 2026 22:28:47 +0100
Message-ID:
 <SN6PR19MB2303BD7F2636DFB36DE71586FC422@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <SN6PR19MB2303BE99A9E0E7C4F64B516CFC422@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303BE99A9E0E7C4F64B516CFC422@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00008BF9.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::475) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261126212848.11778-5-marco_giunta@outlook.it>
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
X-MS-Office365-Filtering-Correlation-Id: 828e716c-19d7-44a8-e269-08df4c045025
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|23021999003|15080799012|24021099003|55001999006|12121999013|25010399006|51005399006|5072599009|260925184616899003|41001999006|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KIWfKB2NPOXVugQpcc9xqrJSKjsysupL867nEMqX5mPeTzdFnjQ9iznH460m?=
 =?us-ascii?Q?JRGrWnGIPKjvtFMYSShhe4GO+zLKMo3MdBXoyhpsorM6juMzMcyNPz/9Hr7o?=
 =?us-ascii?Q?l4oj94e/z48BYxjksqRJUF/A8pNh38FA2Y2qF/1pSZln69ZcalAHq6qAthZP?=
 =?us-ascii?Q?YlYebg+ai3jZ5kmvqz8HswEA3At7QZJVzCy50uVW6Yq4j258lGMeqUtfH+PD?=
 =?us-ascii?Q?6yWdf4sWHWp7FcBbTAhCmQnAbFRoIYwEQ76A7qCVekDlJUp6IW2t0kQSbWgm?=
 =?us-ascii?Q?9M32LEAU8DCu7HcjaLZ3DJ0WVVfZUYfj+hMNsxIj3CvgUW/aUSiBGmWWEHZS?=
 =?us-ascii?Q?N4rhh9+MztoO5LTt6Dg+wI5f+fYmwTm7gWtUPTn3qfcqEHwmWpY5pljJ2zqx?=
 =?us-ascii?Q?GEOCso+56meWzBxau+QUvlPsnwLZ33iZMpXPf8O0HFBR6EcXE8EPmPXcqtm3?=
 =?us-ascii?Q?yrkVjmUeRNxCjKFualOfPo5QMclTLaSlk4wH7UwPJbgKE3y83u0iqLsESWk0?=
 =?us-ascii?Q?bn6Yqi8bR7g1tccsu1uZkaNQLzvEVm/CccEPhUqi2DIAZfrp2YIJLBSNzLRv?=
 =?us-ascii?Q?RGE4vMOLz5sFp7qkoOvPHIvaL0fyydxedQOLNDwBbXNa26TEnMa4iFvvVxSf?=
 =?us-ascii?Q?3BRQU62kUaq9l2JhsNHa/gdlzbZTjO2COA2bHtnT68+usMlQlEjy3qzR+20t?=
 =?us-ascii?Q?YrlL9ixft61O/kVDERQEHl4bJxJAg476Btb499QL4VsjQmJraMNmZJet0wzT?=
 =?us-ascii?Q?fx+W+y0CrekIch8T9QJ11TnB0zuSR4YGEmqgqmkIpKj+T1JbHaORdsKgwBFD?=
 =?us-ascii?Q?dLYc1pSloTtOe1Wq9IQ0OyV2Yo02SanUONhk7aPQ1OYPf2uBOrzMjPgdPreA?=
 =?us-ascii?Q?uS3RZ75TQXpYJsYqN4m9CDxoi3bYwChH8HV8l4gFf93x9PZgu9tuOqpnIwva?=
 =?us-ascii?Q?CUBCAIcVwAGhefhFjpfyZsCEw737FDKWVS+++hL+vkGCJVXf2WWnuPPUiXY0?=
 =?us-ascii?Q?QUb4I+MAuDa9AyKAzfW9JKQuBLuqZo7wqROQ8mOpdXwFNOw1vQB8jW2SyM7i?=
 =?us-ascii?Q?RtZ/g1UO?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z1BdK4ixR4yyexR2SX6/rQnp71XOEXoYZo4RjnclNMLfJ9fquGu2J/gRw3uh?=
 =?us-ascii?Q?3X8tYEBMwrk+i9Dwe/SDh8NvDKEw/jSZI9WnrSdUlpfpn8Y7NBFoliT5tSWm?=
 =?us-ascii?Q?/eZcLjh8cL8TiOi1faLWJ5KfQjfvQo658oLtmEvRcwCuoTFyYktZxvQtgSyW?=
 =?us-ascii?Q?5VPk1YzalYoKcjmsCQ6p8WKcAeoIo7vdJ5LeB7/k8fEkIY2XPyO0ielCrid0?=
 =?us-ascii?Q?hXdGxann1tQua3xox5jr4P3lvMsg36+3GjLqPLjsN+WaB1OlpVrzT0Q8taFs?=
 =?us-ascii?Q?wrNqoeucYC4TC334B4QV42buoXG/QilwqQfOGaLpRv+14aKtIaes1BZ6QymL?=
 =?us-ascii?Q?jRuM+BeZJFsEMHKUdbvKvyle1Y5GlJfRLKN7amS+C0USYkXngOUn972vyTzM?=
 =?us-ascii?Q?h2S4+lBytQwIB2KKy0gPTs7hy/b3LzM7vfhAcSER2wL7rCjowhRApZ6i9isn?=
 =?us-ascii?Q?gPCEnetYFEOYQ3zx/BBUxdXIiSeAixBsZDp6ZWjVUlyoXLUuvl8wmDmMJhkR?=
 =?us-ascii?Q?cg2cnF4YHgUK/+5aoF78ue1YbUhdJYCZH3+y1uYnywR4Sd5lVRqrxPSwJH/m?=
 =?us-ascii?Q?DL05JnJnz0REQZ/gCujz+xLcUJ5DyEAb4l6iNg5pA4HTuMP9B2ThsA8re7Ks?=
 =?us-ascii?Q?7JSHu64Hh2e5vRTbGw23haO0K0sQKPB1iSZuxQu0Xaj4M/fPWMdWq0iOj1nh?=
 =?us-ascii?Q?sPZt356aj49Pn7IifBmG6rJF89XEPvIvefUUpIHe1nl8zNjVkmvSXnTV+XZe?=
 =?us-ascii?Q?vUB6HVfwhFwUT/niNH9WH9lKCql6SnZCYnzCteiGlkFVcpVgWgShT6qUw7p2?=
 =?us-ascii?Q?n8egRCeLwavHzUXcPzM6mM6VV2QIGSb3C/1OkMraHGJsk/MW6pKXQ4lzPE5W?=
 =?us-ascii?Q?20ZnfvE79vTV3raSM4jvizaSaDsVDEcLinHewG1xZnjDeXhRYQ9i7qiNQepG?=
 =?us-ascii?Q?yteTwESICfsdbQ9lYkfHPafAg6OZc+PbOWtxhNNNFC6dRqVchimtyrvWyNsg?=
 =?us-ascii?Q?bFThHyup6oUwIiJPTFPC6MUNdae98O7TBN31QpUbbNU5MajE/Wx2il4Uf/rW?=
 =?us-ascii?Q?dXZUnO5wH42hAYzUHF8B1xqJkYlay8cCCZlas/9ia0D2DnSd+tDAqtoJ9Ma9?=
 =?us-ascii?Q?vNVRRYEzVV9RmiCaBklmDPrnGvxukazx9iHf0Uh/Q9szizP2dnFd2Z/ncWKT?=
 =?us-ascii?Q?aSS3BT+hzvYxeIgne19H8RTVV+NHCNvrTOwzWRIfLi0iSS+fwaMirWh/jqUg?=
 =?us-ascii?Q?VsZKiHETS00UMUBKhsNmMItxNHSZqRWsUnddbOeELfFyauEr9fWaNqqC/H9Q?=
 =?us-ascii?Q?AgWLYaLCebviE8phEvrCaOZ0Z5KsPnbj/PG4nb7qfj+F/gEkUha5uBobi9kG?=
 =?us-ascii?Q?h1qZW1A=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 828e716c-19d7-44a8-e269-08df4c045025
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 21:29:11.9725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR19MB026956

aw_dev_check_sysst() selects the expected system status in check_val
depending on whether the noise gate is enabled
(AW88399_BIT_SYSST_SWS_CHECK vs AW88399_BIT_SYSST_NOSWS_CHECK),
and furthermore removes the boost-finished bit from check_val if an
external power supply is used. The value read from the SYSST register
is then compared against check_val, and the function returns an error if
they don't match.

The error message, however, always prints AW88399_BIT_SYSST_NOSWS_CHECK
as the expected value instead of check_val, so the log is wrong whenever
the two differ.

Fix this discrepancy by printing check_val.

Fixes: 8ade6cc7e261 ("ASoC: codecs: Add aw88399 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/soc/codecs/aw88399-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88399-lib.c b/sound/soc/codecs/aw88399-lib.c
index 20e809035107..6a8dbd27676a 100644
--- a/sound/soc/codecs/aw88399-lib.c
+++ b/sound/soc/codecs/aw88399-lib.c
@@ -202,7 +202,7 @@ static int aw_dev_check_sysst(struct aw_device *aw_dev)
 
 		if ((reg_val & (~AW88399_BIT_SYSST_CHECK_MASK) & check_val) != check_val) {
 			dev_err(aw_dev->dev, "check sysst fail, cnt=%d, reg_val=0x%04x, check:0x%x",
-				i, reg_val, AW88399_BIT_SYSST_NOSWS_CHECK);
+				i, reg_val, check_val);
 			usleep_range(AW88399_2000_US, AW88399_2000_US + 10);
 		} else {
 			return 0;
-- 
2.56.1

