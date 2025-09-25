Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC33155326
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 05:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777442; cv=fail; b=mWIS9NQxBPvy2eeJjoIaBvnPX+BkziR6g2E2uTi0ZfXh+fONhbizzneXdK/F6hvTYUSGroz3EKuRpLTixWb0Y7ASLMrEzp+HEKamCcGUthE+fgmlls8346sSTf72kR2GFRxQ0UK8nuqR2MaJnL9o4Kn3JGO7qSwo3fOu1wn09Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777442; c=relaxed/simple;
	bh=5Hc8Xbsag8sz8AZgUnzKQvpU+a4FLyq+APMN09DKF0E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nxpf/w0PUxW/hEFoqsiLDGikFwTFPEyLh+FBrXT6tY3PAEm2vtmrCtWq9JFfcsih/yafFboaBYWCXWckrtcnfAlKU86TgrOaXssrK0ebP+WDxG+A5jSD5ZiMd8wcbITMDCRyBgHZ/C8MibOoq84XEDEKPZ5muCXQR9y0KTg/joI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PuT7huwV; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PuT7huwV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycDOo4RVKoiFZik92jkbzmXCqkoUzMKHeo9juyuCqAZ0OV+DAKw0X0KeKss5IV8k/qG9y+BoFT3OPTvOIoiI5ChA1hfLNCRHr6R+o82O21vfxm1vGjAbkCek7DeakHHV0qUCusspeVOPI0hFEfMHgG9HRIFbLqTTPsVyOCWKXdvF138L2prIN/xDmpKmz+suLoEvflO/YRrleZZ5AnpdP3mPVx/FfLDWIt0Z6Em+F0bBrEBkeabQHomuEJY0zSfahiXDnaku5KF1Lrf2EEq7+VZ761V6Qvl3i3uYx4wt81heoyGIiWBi+/O/YindMPss4go4Lmmk9fNueEPO6Xiq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEf/BX6qTQv6i4GggKOvB0WMdv8Aj7MGmOTLrMHHrNM=;
 b=NcJbmDvMJyFhKyw+h+x7uZjma1O3JsbOi1EraONZi7s7brMm0iKJwIMmr2HNrGEmLgo+ePCH4AESJnfqLUL5RJyLs/2CdzhSeQhBtr4bmaCMKrIgR9NdkWb378k1K+bEGq1bzA0jpTKXGKrQpl/5z2mrZnqaQwX6QbRRRF2BDZlHxN6pRwDFnZn/52DgODv3MnX7exgaoZ2m1Soz8qBIJm2WdgxIz9HH7vOiMnvKdLfRpCv3s61tejvWMx+Nf8U060VDyn1sKLgUbueYItnOfxEicszwZD6N1jJ7BPmBAZu/ba65AiEcRpEq0V+OYJgJgCW1cyOHXjDdtL6LmRldzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEf/BX6qTQv6i4GggKOvB0WMdv8Aj7MGmOTLrMHHrNM=;
 b=PuT7huwVlzq1r3beo7E+96aKuNBRfByP5u8UznkTqigSoiQpVpTmB2YOD9c6Z33+SuER5YK/hqjDK+9U+KRJGXS4Isj5if5x4yhqH2G1vnMzTgheoIrucMLhEo6IXB5R03nlD1O5Bu/g0G62rksPZIpEWJa436ZW3j5OK+0FYNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15474.jpnprd01.prod.outlook.com
 (2603:1096:405:274::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 05:17:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:17:17 +0000
Message-ID: <87bjmzyuub.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/8] ASoC: renesas: msiof: set SIFCTR register
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
References: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 05:17:17 +0000
X-ClientProxiedBy: TYCP286CA0302.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15474:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ecd16a-aeab-4671-21b2-08ddfbf2cb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hHLZuPThGjNckzVMx3PjcrAb7IM9wJtKX0qQf5e3QYPb5+4nuhi6hSjyCJUv?=
 =?us-ascii?Q?k7HiKGP7gSYT/qxYoQOmMoKa8+dRSJ9Hn/DPoXNT0gGI2/7zjVAbuZ3hI4w6?=
 =?us-ascii?Q?erqeT4OZ1NhMVryOVTS5/S7YEJxdMPG9fJq/moSdvKACloKSAeNL/YnEaJXq?=
 =?us-ascii?Q?LHDT7Rtw9GuUKKrzKjlkljnrHA3Dux/nSJK3Yg2Jwl1rVxsDigC6mKZENUqR?=
 =?us-ascii?Q?WjwzCDShpPHj1uUrm3QR6todIT1TauNVGf3FMa3LyfUwIooTWpQKZThzIzm2?=
 =?us-ascii?Q?LxtL5fMbGhkT9Wl7TrWfwQhfrPASJHwC/A5ZJDPKw633ibIg69PfvUZ8b3p6?=
 =?us-ascii?Q?2dcPNgx7Hy+DgYltqQltKIlZmoabuWEBdQtCHrYMlGAyH/ScrrFSYVBmUCi1?=
 =?us-ascii?Q?va6ToX31bNOjRLcPnUiFB8BCqUX6/1xZirJxGmSFIkbmtImVL4VxvAQ4Bx+O?=
 =?us-ascii?Q?9tIZJBFQVgWXwdVx83AEhKbT36xHePLTDynjhqFghaAVaZ2ndyR7gSElJcVy?=
 =?us-ascii?Q?yTg7uxQFTx3bFEZZklDkapnuJfq5mnN6H2pn822JVkCxqyTOuet/jpZC75ML?=
 =?us-ascii?Q?SQdPdR5XR6aTMUsCA4jFLeBQoME3FEigQbcymbEo2/mJYuiiKX1DTOEqO87a?=
 =?us-ascii?Q?z2Wtv2Z9uRDEeNKd5GlFbvvjqAbm08TMiMl5OkTN6FLnMT4ICk/rZkUAL82G?=
 =?us-ascii?Q?XrGRaVjj+ATqdTbnt1i7bbcIZyJoFQaqk3/3wZUg68hb1i/6oMkiPC0mw5cj?=
 =?us-ascii?Q?pKrG0BigDsNlSZ8suGKwEOuLrZt113c5TCSmA96EsjNROct/Vg+u1aze5lB9?=
 =?us-ascii?Q?dJKXlKaKO+iQvRfaHrqxtQMSB/QDo1coo7loQziy64uQ9hs867PX3H5EPAq3?=
 =?us-ascii?Q?/U7nySgyr2flMm+I9rr3d4mFnwBREppDQfS7mNKRRgFgqfI5q06IpEgyB4hl?=
 =?us-ascii?Q?Zv5ibs/TRL0d6xDu4ysa91zAtzGI4AIXAX++surkzBeJ1THyZkzJQavDU5Qi?=
 =?us-ascii?Q?Z0hEx66JHe9GoHdaVN2gUTEPnkajFcbmBTHIKNPNSp2cjf3s19t4gCwTlPJr?=
 =?us-ascii?Q?zUdWIOiPLKmVzj7NArwnHXO2s0lw3xvgbr73SHHDWy3QihjqppOQ/a07E5MU?=
 =?us-ascii?Q?h7UxbN5OIlGjURkYZUUWKOgh/TR98F1UgAzxx84mJ1u9s66YhvZPSIIEEoo3?=
 =?us-ascii?Q?kMChkMpgdVRkVTcMo43Ba0tPIw/9UtgnAFeio3Sw0G27hGDiVbxOVZn3yasA?=
 =?us-ascii?Q?vc3UV1sLNMV+qHLvNCYfYeo1ZQz71hkAxuqMRYulTItJLyWSwY/D05Q8zt4E?=
 =?us-ascii?Q?KlIOaDNEUPcytq+zoJLSamyHsSgBo6TsAeUW0HJ2LLY0nMSF1KELWrghj+Py?=
 =?us-ascii?Q?G7FUTmw8Oly4T0hhUtariBBSh5jw8UtLPAOu4/Rj8Y8gvAXl+aRmUpXtmdm0?=
 =?us-ascii?Q?IQmJfwOLJRQN4g3f7efw6beqUZEmJagB2GjhdusFftXKW/k6Fjn01d/jkYC2?=
 =?us-ascii?Q?K00rVt3EO6B48jE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D3A34yd8Nq3sZwySEO1/3liVI+GnbDf2wVO+COrGCu0KwzHvjwkgUtTRwccZ?=
 =?us-ascii?Q?usSRxrXrVLYkgCWLtvmLjUCYY6LYcyFafIeG5G/JZCBOnZU1u8u591s6ZJt1?=
 =?us-ascii?Q?0RS/Zd5U29HMTSL0fAK+gm3q397Bhq88h5wbXpeGQaS2yvn/zgqrto/k6K7H?=
 =?us-ascii?Q?yGxO2LC9+dl5rz13zUGLQshlY5nGkJE5RZj9wqGyNgcP3LjaiuKo5ztcXbZZ?=
 =?us-ascii?Q?YzVmOL0rRvqFvwr3RCk3gVkBNDTifVBwaMxKg4ugOwKQtYFtdF9M/cuNwTCF?=
 =?us-ascii?Q?40QZ1c32X2nR2+nt180zR1ug/DwCQpcsR4UUqEJ0sgrk+9sVEOPiIttIpry8?=
 =?us-ascii?Q?/R1gtsHzRalCjOSgQJbPN5/Tw5NayAnr8X9JxFOGYSKNw6WgtlArZcZgR8Bi?=
 =?us-ascii?Q?2/9VoRlNZH+goynuojz7iHJk7TmDez6N5kkt3QjVq0H2ZxmBpgThlb2EE729?=
 =?us-ascii?Q?y/BZ4uh68XRff1+8Iiwb45Gw0Qr+gyYRtpFEIMKP87Vum+AC3LyoLE+GC8V4?=
 =?us-ascii?Q?BeqUlNPESkAojn85WPlDdrxNW4/NOUTVzuMWYd6//yGEy5Ohu4UXKZcNIDdp?=
 =?us-ascii?Q?n4zOIEp64n//zgR1noHikNrtPV0AlWirqj/ehNpRmU+zcjxIAU7cm8IyOAt1?=
 =?us-ascii?Q?wwR+zy7iXnz7bR+3cK0q8U1GY6i8rX/ciWmwjDKl+gq6e8SreeUn3kMU5aDs?=
 =?us-ascii?Q?XLaNzjKEo72DU8auabxPy0Z5fgSqEYokl1RvCpyJCJ7O6aldWxgPiEK5bwcv?=
 =?us-ascii?Q?6NQ468UGVOyfUPW/yHtTfTn+z9dCNHwEW6InFQKVGppkGa8G2o7cR7DAuObd?=
 =?us-ascii?Q?YKcAeYOyTSpG6ZOcdpHqGvDxXm2ndpt7niWb7SvPl+Ii/rjT6ckzA2DvPdE3?=
 =?us-ascii?Q?qJcL8uZXv8PY/kSPmhwsnvWBFnseIb6VgLQZdjzRK1hPSn7leFB1a5jvlKUf?=
 =?us-ascii?Q?jLqrK4pcSUaqL8h+CwKd1LtoGSeyE1X+DGvGgxt4PFljkkKS2aRazQAzBnFf?=
 =?us-ascii?Q?Sq+KuuRJGm+bhKxMn6tgQAzLKNpXuqJL0ua95YD7Nc1cIz4tJ04v/EAOVWlF?=
 =?us-ascii?Q?5m2Uy2GxUBRUlIf5DQsEETAxksD1dxfAS1VgNSsi363y8ndjahvCe3drEWdH?=
 =?us-ascii?Q?qxVYKjmMnI2ihHoTfWzbGAKzXojc6ADY1IFTkdU7O78tDUDbokuTJUqI1/3l?=
 =?us-ascii?Q?hBSWcR4L/mZdnv9eF7hUTZEpj41haVe6n6CGJbqYNiMQnkg4oC4Bj7ji3W9M?=
 =?us-ascii?Q?xB1BnoQw7uFoIW0bRAh/hNOWfwP+F2N7H9y3/+pn12G9s9QgJWMNb6kQVazK?=
 =?us-ascii?Q?rEnUeL0WPS42GDBZTdvBkv9qrkfGP4+98rqxyLpV9F9zMcrtC6Bi/nXLwt6+?=
 =?us-ascii?Q?DLGX2JbZT5SQKgi41Bx+rZyRlYv97kvHaEczQj4Cc7MgC8JtKKldXe8J0MQ0?=
 =?us-ascii?Q?m1c3hXCQg9SwJ8M5EAgcgNP1apCmimgoqdaP35Ptid2Dw6UkjwgJo4xrVwm8?=
 =?us-ascii?Q?rOMfd58z2PZbu6jl0nArEsWBkHjfy1IrPDj+MMAjpKwcUmRCt2EBtKyfl6Bq?=
 =?us-ascii?Q?vsZfeens45lq7j9XL4AU5imBWzgNOlkq0C6rCHQuz5t6t+QNoCEHes2R6oml?=
 =?us-ascii?Q?rtw57HIdONSGMOIomWicIuA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ecd16a-aeab-4671-21b2-08ddfbf2cb7d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 05:17:17.2585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2oWUBPMztnBO57zyHXc7beZY7N3m1+cmGTg0ZHOctKYCHjGAEC2cn81471MDAVTqdB7iipfS5MjetyWy4+8TqDOycBZ7d+r5ktgJwAzTG6a4kzAdysV653c1CZBcQ1F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15474

Because it uses DMAC, we would like to transfer data if there is any data.
Set SIFCTR for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 87bec248d5c1..a239a88543ee 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -193,6 +193,12 @@ static int msiof_hw_start(struct snd_soc_component *component,
 		msiof_write(priv, SIRMDR3, val);
 	}
 
+	/* SIFCTR */
+	if (is_play)
+		msiof_update(priv, SIFCTR, SIFCTR_TFWM, FIELD_PREP(SIFCTR_TFWM, SIFCTR_TFWM_1));
+	else
+		msiof_update(priv, SIFCTR, SIFCTR_RFWM, FIELD_PREP(SIFCTR_RFWM, SIFCTR_RFWM_1));
+
 	/* SIIER */
 	if (is_play)
 		val = SIIER_TDREQE | SIIER_TDMAE | SISTR_ERR_TX;
-- 
2.43.0

