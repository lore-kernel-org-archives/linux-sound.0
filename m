Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795105955;
	b=Q6zsOa6KhG9gPq+SFlL186tkugklSPyrqEWLCFiB+hqJANZ5ZvbMzp3KHD7AZiYWClFm
	 Pz65YWEb97Q8Mj4KrGWTKHHfuCjU2n6CRrbwj/p/m3ZrxzwLgvPonhgh/qPnV0SRC+cjd
	 hcltUcLovrKr7A6M1ftdjJcslpBG8bJA0ykkRH9gRo1vbpDvlP8kAg8SMto04+Hw+VVAO
	 m0kwzSBXFzT+m3VPD3KrKXZxljF1ysvh5YJUnfEWHu4PCAa+SnmmuTyEWLIKM/Lkvgv8Z
	 fEUgiFKy6XIQgB0r/eUWHk7Vl7c3tUiT++LTZ4IxWLsdSrk/Q93j/dxFALYRIuFsKqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105955;
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
	bh=xT049A9yRYyAwSs31MAZM2XZ6VrkTDP/hxt9JK9/ikU=;
	b=DRys1PvRcDaNgEWo7T4+X9RfL9I/Ff3Jht0Y3e0or+/XqK8NhYOX8rl3BQIT/0qB6BFz
	 qwPgNDxzN03Nx0l762K9U+xNx14SrRy1svYj/Ms4oNhW7hgJoiQ1lg4grCS3R3467CwLM
	 mrkCeVwmxlN7Ptv/cxKRIwRGfWbmcLzkvgd14pH0U7aA2hv9Fz67LrMOdK9K+5f/vtqfX
	 12BT4Yl1G6RGPWWPZ87hcKDYSq9mN8gU/Yz9MTcxnNd6SRNU1jMMfct+BLL1C60k41pOT
	 2V5u3tYJLYejdmTceb11gGqims/B0T/9HS7TSO1TTB72gyosKYCONBnwzmbOOBkP1WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=MIp65C7c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.34
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011034.outbound.protection.outlook.com [52.103.12.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41497606A320;
	Thu, 19 Nov 2026 16:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41497606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=MIp65C7c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5YPgu89+lB1xQ7JVhbDaUYiEUZYT+37XzvJYlVOWX8K6iIoxlvqcX/e2s+BNVOOJVHMR89Svbqth+fg0FLKs43kCip0QIf8JBLv+kmXocRPjNL5piOFeJHrSJ3iS4Z2dfMGuvzdRgqm6mRxF3sm2qRJDamYWqTNyTGMeMK7sATzz1HKhP9eStpOBmaf6axKf6FXPey3Y4wEB/DzRJbTTo9Qr2MyG/spLY1l02iEu2mkIUVsOwef/EdSLX1xa+CJbMmf6EkSnUSfQ7Fj5rgUl25MXvANy68FJn1+tzSHrLs7RRF8vlQXxylyYQpH08ABR4nE4cxpLGMF4yNLJ+J2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xT049A9yRYyAwSs31MAZM2XZ6VrkTDP/hxt9JK9/ikU=;
 b=X955B/yxMzl2CTZFMi3+nldwfwZU2u7oE/69CnJbyKgfJteJ8iAhvKraqCDpNstWroCyHYW2rncs3LK5dZSVT53c50QRXT05cBFFC3/mTVfLyra+VnDhxC/HvQbD57mgoz8aSp0ok+QYIbN8zNTrmVI/UvU3vn0NgtHTvRGCWVsdqQRFr40gfDQonFckA3wRz5dXoYqmdDsAIEaUV9kI5Yq/6/DfvxrDRlCn6ISpGRd3/DHPX+1PT8FKVNhST/18CjwrfYbyTdoBTiDtSI4xU4uJ8YRpAwfKm/DfJRbbAkiNcR02taDxQVV5VO+eP9IV8ENRe4jFPJOL61K4MzhfeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xT049A9yRYyAwSs31MAZM2XZ6VrkTDP/hxt9JK9/ikU=;
 b=MIp65C7cni6mvCxGRfcEGdOmuH8e+v0lyacuqorX35x5NFciO0+r4miY1w6sspQPyjFzYU6vQV6JIGDkc4DhzQ0iKVvsmvRM2KGQBpOx/tbzQZySUg1KZIZ1MIIQtbBGb1Soyk6VtUl6z7Pp31DhSBGwohKedANJLPjThfb3CsnaYbXOY2LJyD9Xn9xGi1oXpBFNlijhhdHpeiAqT6j8iNQA+7ftZHKF8iXwrIHEpd/FsNI9VgUz8QgVJFozMlMuwdZcIXY1aNbHIYV++7Jclba0mutGijIrwmklWAXGynd2TKzTY0p6oxS/1OXzvU41kr0nMfgZEoOGsw8c7S6FtA==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by CY8PR19MB7036.namprd19.prod.outlook.com (2603:10b6:930:58::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 16:30:32 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 16:30:32 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH 2/5] ASoC: aw88399: fix sign bit check in aw88399_dev_get_vcalk()
Date: Thu, 19 Nov 2026 17:30:13 +0100
Message-ID:
 <SN6PR19MB23035CADF2988E49E618ADE4FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00004E9D.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::454) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261119163016.30414-2-marco_giunta@outlook.it>
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
X-MS-Office365-Filtering-Correlation-Id: 7a272ee6-5a67-4cad-58b5-08df465a6e6d
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaUFyZuoDEdFOJ2LorLNmBniZ5UxAO/jP61ziCNgcA4ZdizWnU4ZgPWJNdtIWKvgfTdCKDXQQgqEgce96Zh15dhyaUQI46XFTCrUgynavS8or35O9DDsch2o387Rz/uERr5AyimPq6BPQUr+GNSTaxXmm3raNBfKxhKPF24S/Mh6WrPTlelpnVAJwMcKH+bbpn2bB0Ro4V2VD2kpGisqsnf4YIz3LTxwiuhUydyABEUe7LR1sT1JmGX+Wv6zFQktdjSzEKNvLOjLpPBR4+X0Yp7/MpUqDdoEHPLQGXjayEUQHUFtLISunqQLvaBM5rLFsuiUHlxYoSqjRZgw9C72d7DCHA4cHZo0qbjwBpdYPm32g0N69bBOxdFZ3+B1H+oIHK8kmUDYNTBCSoNAtHKfTNSWn1eM1Vr+5DjkILq7S9zPYKWIDNSwHyudDNH+IA5gK055nsr/DLmjTNldb2TGcGtmm1eepf3E6Zfr723BT6YH03/XgLve8yoeulROi0J0aKJVBRXFFxhsI2Ycl/sqmtW/X9FZ69UHyEcnJymRxClKTWgWK3Mlu76MLSG08jhbzqIPypzhE2JKgAmOJCcXlFzZI/OZVAxhJIPIur8TZnU28w5H+Rd6DA6y5DdBqZatO5D11Ky4jDFDALD0TBABmusDUdrJEBCwlZFAGHsy7wnYlYQixI4qp6JLZMzIme0vpx42xvYQJ1Lia9Os3cQM5dQ4BptD2UMraT8H0+z0aySArtjYhv4c89LAUaqkqJqI57
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|260925184616899003|25010399006|55001999006|8060799015|23021999003|51005399006|15080799012|24021099003|19110799012|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PGEEI6jNGCW6M12gXv9+xeDS4mJ4kQa62U5PLMxtTWcgfZMqf9BrNF/VR5N8?=
 =?us-ascii?Q?lSAnvV9ROrgb0FwZyb8/N3plaKz1lbS8UBB6EARxPqHyp65VFBMhyNKiFMHD?=
 =?us-ascii?Q?DdkOjc+dX0XZkUkqxRHtlTZXuaemPmy2ZmIVjymVySAv7i4rM1k5jglGiMmp?=
 =?us-ascii?Q?SpyF4X0N5GDmg/JCkdbP/lAgDJ+aj6cDi9nKC9XGGGv1bTFNw0Si5TAwtwcm?=
 =?us-ascii?Q?mgxSI0zvZ7Lcadah9AJQ2T48GZRBN+BJZ5NNS1uQp1wh1e9Sz8boPBJIBDVu?=
 =?us-ascii?Q?oM6jeN4DriFd51k+UIiJ11dqAGkEFeowqy+BslHSVbhhMmmQNa0aLlh8lzGY?=
 =?us-ascii?Q?f/vW5g9Vio39zmq2zKkJUIuTvzFZD28KtywLJMg3D+hR3hGckiJp8Sa1IQUk?=
 =?us-ascii?Q?eay0XzkkLqzSAYXP4Pp/s1KtQ0MaOlpHzAFosqGTVJ4uoCR45JDu/ik1BuAQ?=
 =?us-ascii?Q?fsscU0jmgDTK7I61rjvKl8BBJJBTy9JVkQUAvD7zbsEfK5zjTQcfojVS5HXK?=
 =?us-ascii?Q?CLpKw709I9gTpXRhzQNqVSJWF53nIz0vjmMoNWtmvn7RVPDJiIFhvpj4vv0S?=
 =?us-ascii?Q?7qknp3SJlpGZaytQZtClhq5kskl0hPvNH0jz3CYaEv4Zb/Zbpt2TUXdR3j+c?=
 =?us-ascii?Q?RU/2FpHA4tPxL0eg5BG17UzcogAV3Ea61cQdJ4IF5zA/mzEBeSAFSMQvjILg?=
 =?us-ascii?Q?glZig8oZuBxThbJdB5u9+erGVLiFjn7Rqc9JnxV65TdYmGsKkwcfaSsftBG2?=
 =?us-ascii?Q?QE8DNjIGalQFy7YqJ04/wyR46IGqVfI1MhvCYgpkz0Nn4G9lpk5kJDqIMHFV?=
 =?us-ascii?Q?VdmrnNcHhGOcQyclu9qFyXEEIid/X1EH3eVH6bIBm1SX9rMvp0Gve+OF4lJa?=
 =?us-ascii?Q?XNqPDlZnuaml96IpUyKkxV4BfeQ/ViGgPWcIRHMBM1zetreg6LDZxyLNrN2G?=
 =?us-ascii?Q?9tE5sEtv36ExgQQN6Vjugb1duXJaUBWpoWAKAXv9Z23WNzUYqC/K1nPK6bmN?=
 =?us-ascii?Q?a4Ph?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KT8qIWcXUM/xUMysKvkQmucfkJVQblUxUUpH8PaMiit5kEjC5X4qgzalNSxs?=
 =?us-ascii?Q?3ezKq08gtulqDV8Nfxd3cn1NlaJ4JA6qg6enlLzc7TjkuG6LV9BWoevdKdEw?=
 =?us-ascii?Q?qo+y92KO4v3v4fM8KYobPzCZjEEa4ng83Q22H2M5S/gmOtE9Hbyrxl5t2Z8V?=
 =?us-ascii?Q?FgmN+A6gta5xnX+iS7NUjbuUA5s68+jjNeWtg7IX6Gis0ype+PiFPtKzWOUA?=
 =?us-ascii?Q?NJA8zaKZ2tWIzFOH2kdf/tk+UZd4/6uHTIHAfZhVYMFttia7WEsymH+lbzYP?=
 =?us-ascii?Q?bvEAHimzSmi9s7jInG1mlzPWZAo4OF44k/uMj+x/+6pbk6PwKCYAMYZwL3uS?=
 =?us-ascii?Q?afbUPiV00n/cyJiGD6lmr8aW00dK4FuyuFSnMqJMjN+8A1ev6kcTixN+K0FR?=
 =?us-ascii?Q?q4oB29mSZ+QD2CB5FeQ4ct5N4LTZyvoFNP0Dpdwww9yy2r9nk8wSpy2eXz8W?=
 =?us-ascii?Q?L2SliNwfrqh+xAqD+aRPPZWIM1xrQY/kN7skrIUENDbn3T0Ib3CfEAeORWaf?=
 =?us-ascii?Q?E8ddaJlqhtabVdxh0ByTQuyMP9xOCJKiyq5hE2lAfzxthwfJWQEpxxWd0tGE?=
 =?us-ascii?Q?rbN2sf1CukMvQNfqfM88sJRlQWbt+be/UWjQxAr+8VjgXkenuIWYJLqXazlY?=
 =?us-ascii?Q?eHeUf0qeyPe/SoCLpKwVXxKU+ioGZ3Ke7UjCBri0Yxm21qx52kdROwVk6Qqe?=
 =?us-ascii?Q?8ZgVdH6iM2KMlHL6k4cRRkEa/uOXIFidqw8Cw+iG6hCVsvrHzKCP9CFmMDTz?=
 =?us-ascii?Q?FWiDNou5MNkqs1nUM7VB8EQukizo8mb1JEVoYTQyGpir5wqXKngMZY/zZc0d?=
 =?us-ascii?Q?uuwOgfmzic/o4JLF7g6XHYlCoXAywAflGeETDblM1a04K6sZEMxbh7+pD6Kj?=
 =?us-ascii?Q?hUi+19ugXlHReu9t3oRuHOSvztJS/vUDCZZ4x1ls8RDIUqbq0cfR3rdRuxVq?=
 =?us-ascii?Q?CJYWJEVMu4c3hQOeSgJctmPWfBO321BfVWdykwLhu/dUl4pPyVmEopwK7vOH?=
 =?us-ascii?Q?UlGpJJ3+TbyUq6DvMM2dh3zcvH6vEcnaDrItBdkWcc1C4YD/QYQDtJYoxX52?=
 =?us-ascii?Q?+qgZPYlSf/QPALlbRXeTSUJ6IrsXf6c1dnLBG+5ihdxMFNGPAyS3F9x4JAD8?=
 =?us-ascii?Q?Y1Kcj+LGJuz1oMtIz/qfVVoLiPCFPbT6EvhNBg78W2vV1hh4e7v3lZOegRLm?=
 =?us-ascii?Q?vX521WfxKRxVVZpwdY8fjWbB/dBGLeL7jRPgdbYGnx2RbzJixMRVdjPxzjor?=
 =?us-ascii?Q?r619lPneT0nejmolCBL8sNnIDd1v102NzZkzjqo0LgxcY55PT4a7b0TXVHiS?=
 =?us-ascii?Q?4asDQBTkMlg+GstTNvpwo7DQhbb85Zu4KouuWYzXQNq0iGQWnT9o+E8YxlQf?=
 =?us-ascii?Q?XF3nT9WxLv0v9wV9TF5ZtW374gbd?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a272ee6-5a67-4cad-58b5-08df465a6e6d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:30:32.6151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7036

AW88399_EF_ISN_GESLP_SIGN_MASK and AW88399_EF_VSN_GESLP_SIGN_MASK are
defined with the usual Awinic inverted-mask convention, i.e. they both
equal ~BIT(9); therefore, their negations have to be used to test the
sign bit.

aw88399_dev_get_icalk() does this correctly:
	if (icalk_val & (~AW88399_EF_ISN_GESLP_SIGN_MASK))

while aw88399_dev_get_vcalk() does not:
	if (vcalk_val & AW88399_EF_VSN_GESLP_SIGN_MASK)

Add the missing negation to fix this. This ensures that the aw88399 driver
behaves like the vendor Android driver it was ported from (aw883xx), and
that it's consistent with the other upstream Awinic drivers that have
analogous functions, i.e. aw88166, aw88261, and aw88395.

Fixes: 8ade6cc7e261 ("ASoC: codecs: Add aw88399 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/soc/codecs/aw88399-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88399-lib.c b/sound/soc/codecs/aw88399-lib.c
index f2e2c88f5ec0..39a752171aa1 100644
--- a/sound/soc/codecs/aw88399-lib.c
+++ b/sound/soc/codecs/aw88399-lib.c
@@ -296,7 +296,7 @@ static int aw88399_dev_get_vcalk(struct aw88399 *aw88399, int16_t *vcalk)
 	else
 		vcalk_val = vcalkh_val | vcalkl_val;
 
-	if (vcalk_val & AW88399_EF_VSN_GESLP_SIGN_MASK)
+	if (vcalk_val & (~AW88399_EF_VSN_GESLP_SIGN_MASK))
 		vcalk_val = vcalk_val | AW88399_EF_VSN_GESLP_SIGN_NEG;
 	*vcalk = (int16_t)vcalk_val;
 
-- 
2.56.1

