Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576D3632
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956743; cv=fail; b=mNfobXtDQdMchk61HND0fqqciwiQaBloskdLKar6FkSlU5E9IpaaMyzxim01jDyxNruVmqUFxOORDV3EzIAh118ldpGQQTfB8TG3+v5pYPlwq7ngTTG2P0Cd2/37EoyxW1xPEhVV/o1m6s0nVpkJRCRZ+YpwQeF3RT44m5r+SNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956743; c=relaxed/simple;
	bh=OFXWKYlzpwcb1pYZu3W0VgDqWPxqGJGHdcSJcWC/nAA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TEqyH2gzejEK2X+eO9S17Ts8blwdm1K704WJxaoGAXPawpA1XNWU3CuuVv0yo5R0ZKaJoAeGA0W8LHHZvFEeRWjZf8uYJfIMnlJwcR7LiAe531RkBOYYER7XrIYRsitiUxffLlUmSmzwFJ1n82xrHRCx3ETsSVjtU/MtVN38lVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HLxa1FP9; arc=fail smtp.client-ip=52.101.229.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HLxa1FP9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnFslUHMjgurswbzHmxsqjsNModgzx2sqLreglyxXQta2gWI3CZk8+LA4R0q5Dij4dudj/EoHhbfjRmohh6T58aYNmF66o1a3THcPQC/vFVQqZaQ/Mg+ukUJSPdHxkHQ0+3qTTU6pUXW/rova+awhentKqc4WauEDYvX1U+4bJOYvzlDWnL++Dn2cKb0M4Nystb8EalB5WN8Itq4ENxv4u35tkNKeSHMTlLLpWh1ybbsajHI+qs6cLYv0bJq05JBvgMCVAKwDNVn8SzJpJCMJsc2Ib1qrwyG/0a10Qj2yikyxWqHMXeq1juOuoTkmV5DCnEHcNHbQcYoklFDK1mabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvqD5AqvDqh3V1q26Htb3dniP0PypY51ywZwWoiARHE=;
 b=r+dPoMAsWNqn4cY84K5R8QLxyCMJGZ9lgDm7RGzaRPkb8Q64T450bsQeIR/Wcoh7o3CirJVRgq6UPQRwK6sdflF+ZAF2AG0C0DCPilG0ffgKYX7yvne3eClZUmbcbNRs+embGHJ7tH3yvi/cgfEpM4pckpWeKBULHrg6DDJ4KOnkFVP7MuFohf8lLpuENtjBWhw/ABbqiG9CvhYvbK5PneFt3GztOjlOu22XAUnMMdrz8mDC+zev8zfvS9cpLzJSLBiLj6ObG5uPUIu5W7SDWjPbEyP1vGEaNMC/hYzG3z+kyvI5F1Z8JVYy6zsHEuqNv6Oy01wwtuJHYfudavBNmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvqD5AqvDqh3V1q26Htb3dniP0PypY51ywZwWoiARHE=;
 b=HLxa1FP9Iw/mOydXzo9SavHPxctRNBRIAltBMub2Dst59ZSVZxU4NNbbW/lQPZjlQ+sjbErPpazE4nZcXgB61Xmxva1M8xLZTjZEJ9m0cbuDb+SKoGvU6VW2b1xnkHxOfCmaPMa9bpfgATZD0PepoybixOs8w+9+5u+0jz1INec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB16053.jpnprd01.prod.outlook.com (2603:1096:405:2e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 01:45:40 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:45:40 +0000
Message-ID: <877bnexiyj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/12] ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:45:40 +0000
X-ClientProxiedBy: TY6P301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::19) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB16053:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ccf68e-35ce-4bd5-2e77-08ded7db9f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|56012099006|11063799006|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BGvPlPw4PKQTURB9EQpTtuSAhn5w0nLROCOoIz0Gz+cHtDNOi4uvChxZDwvUQOkMU3iMCLo0X4LlMxKVXBYYP7Kqz2BfPZNc0+uZ2BuObXGxz7DZR+0xkIKHGD4HVFv+JCfhl9s3cwj0YSTNaan29MtNFD8kL+Erwc4TfF/nR/r3REsbjRjAo3NtFZT4uhx+kmQaPrdNxdYKKK3m7/l7XKgaTJWjBPuRFMUpXvKPzj+Kg0JIX2Piih1BgWr6jXlm1k/gShH00Ard2fF/e8NICVybWwb1ABlfjyeO8pZNmRdIu3js5XI492VaFBY3aUKzioaGBqupWAixz8SAYISc2t3OVqVwwe1Z9GKSPGP9NWf/nWZZA/EZIYVClMnIiljqWgqtb+hTQvJTZrZdlpQ9L7R5j5RomawtbW42hITUnk3AIXqBU5xzPrh/NDRT3YRhus6+NMUNwYIN/L3sr1lyU9lPdTvTXYRJYOjEAyvAKFaa6aRc2Sv6v5OvUFM+kLSEbgnfU+1WMRSHWR6sUc3mTsLhON1hnuYx03DVahz+M6iE4TZi0S7fPShEFNXKEeZJ4re6P++sEHkrEjfWp2tTq/GkhvEkgzejTOFP9w+1nq6WD9wrQhGwFtRDAAB1PkGXjkFN16vYQFfZG9OhJNQwBmmVVOsJYSj4l4vYac0+VCjiC0/SrqV58z2706jgR8FANWtrBQm6lqdPynTnjW8U9dAP6Z0Xxsswk1ls7lCiT6E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lcbtKyLNlF1WZ+1zUSALbtflQSqcTK0h+HtO8FbzV5ETEjaGM5hk01I7Iky2?=
 =?us-ascii?Q?5d1uQ70Tg9do4oo2k+m/6kXs9w8ulPy+kymDDbJOzENwOVDFKs922Cw1X5gu?=
 =?us-ascii?Q?Sa4h9nO7s2y0MexH0mrO4AQRN/iXuSLBehq5gxxU3Bd8RI5yjBjaiNlrfR82?=
 =?us-ascii?Q?PN2M+j6Ay1PSDbRo1FbX3tJbwDigcDRrBURHYDOA7A3rRPlc6NKhuyJJKZpJ?=
 =?us-ascii?Q?nr/BHG4o879DS9yHQOWh1suOYEZ/Y+CMi5sD7hq9DsIl7430vFMDaIXoK4p1?=
 =?us-ascii?Q?6a2voiAdkMcvCtElbaambXGYD43csM28lLiSK/9dMqTm+rotk4DsaHSNj7TJ?=
 =?us-ascii?Q?ddjMbgirHDPvzT4lIZVMrYj5toCeOBeQTjWng9ju6tn9NH4r7sS5ojOSEiiG?=
 =?us-ascii?Q?2M9NUglvH+lGkBz+2iycW1cZ4+TQUrYXLRSamJ1+q09lj8L4a3nh2QwnxWpf?=
 =?us-ascii?Q?tZ0MADko0LZPfLeQQLW7q+V63BTZbH35yXTyNFBHjjKwDlc+A+RjgybHQv3X?=
 =?us-ascii?Q?zjbsii6sE0wcF04pKMy0WoTZn7dKwPyM8Tu4jDqyEbewOR6Gi0bFlXHX/XjV?=
 =?us-ascii?Q?bJBvk05ziOp5rJXWg77AcBzlelpGIMkL9OgL+EiutY4M2OtV5OuSxLUNU+DA?=
 =?us-ascii?Q?KKFZtPAioPMd95Wke4SSNxAmANxEjid+ZtNcAwGfrBncIUCb2mBT1HtDxfjv?=
 =?us-ascii?Q?EgObXd7uaVURr2ojcfQlrE6GPadbbvMV1UpMgjR6MH9N1Nvasv5IrfvmC6K6?=
 =?us-ascii?Q?pWf12WYLhCWNmBSl4O4vkoovVCXsKrGzRnZ1DY46KwYGIQ8It/IzHtf8P5kx?=
 =?us-ascii?Q?vdfdp125tLeOIA3Gb1Gpu4BctPGYSsr6QT16D83d5aQPl9AqrvL/NtMx9M2Q?=
 =?us-ascii?Q?pim7aiJropinccI1sRmJYTYHnMU9TktcUAxYqbceJkoG0OVXPuLX5/sNjk7E?=
 =?us-ascii?Q?+D/lB0WJjTVS4hmWLU6GL9LvBM8hx83ZqAeggl067HdX0L0Cg2TRvu0nRvcL?=
 =?us-ascii?Q?8DesZV1b0a2/3OQT7MbwsMX7or3525PBL5k0rHWS0NGbWzQP8EAXdQ1Tcca1?=
 =?us-ascii?Q?GcggDhuMY88bJ+iZRcmLq0KAvasfn90+hS/3+ZRDRXNQ1x2aPkbB+UF76dlz?=
 =?us-ascii?Q?yzXre4tzw2VvHwAN75ROPmBv3YyJkVrsJctC35kdiWQTdPgNfSCI3JX4gQGd?=
 =?us-ascii?Q?a8sOLVdLOkRidDYS3TIIUouGtVXR2EAsrVMMP70O/JttxBTDHU8Ma6V0vyGr?=
 =?us-ascii?Q?13MJrm5E2dM98ZtPR/m+oDq+kq9WLX/z8Wgq8fo9jI2lHygCCdOX9kh90Qka?=
 =?us-ascii?Q?SbLkkF0QIdnlRmeJby/7r2gXdtUg8ON2YQ0+s7A/WQvSLZzHN05Qy7OVVGpX?=
 =?us-ascii?Q?A5kAOM/3ddLShouG9InUHKM2XRa0bV3CIbuEdzCeMq0wD14QX/JoEjuwgBby?=
 =?us-ascii?Q?T6kBVmKC+sNQpDKazbWr/6ROZM417CeKw6VnES9yaN1MlJTuTYqaHUiZ6OB/?=
 =?us-ascii?Q?U6SBAXep3PQBA2saqcJZf9+AASnN93qUprLywL8Dog/o/u5g4hzYK8ZPOLQf?=
 =?us-ascii?Q?THU5zLF8SqilmL/NPGBZ81faADcV6iiQhj4DYcIZ+qPpkv3Lh10YXkLA9OVQ?=
 =?us-ascii?Q?Jv/Y7jbkcd/nUk08C23Dr6hVUGIqIYGvmPdNbmgs+zKwXNFMR3Brq5BniQcm?=
 =?us-ascii?Q?0btPPlWFxKEzuXaSOEZk0ZW550JKkUqKC9QW3EV4gLszmq74cvOuWEgp0ZAl?=
 =?us-ascii?Q?rZgKnmK4SpynZj1NqWcY2ZukbWu1ckVZeSGkRHHO0U3n4xjpqvba?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ccf68e-35ce-4bd5-2e77-08ded7db9f51
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:45:40.4992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75DbXiqVY/6oFgo/2nETVr9JorYkTVmbeC+isT51pJJ9gESi/8jDbth3sfOkcufOU7jPiVa/zQLZpCEWHptr0OYQ2p0XpSg7EfxWuDjsXJuZUdxTRS40Mt8OjJ6/aEHn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16053

simple_parse_of() calls simple_util_parse_xxx(), but are random.
Let's gather them all in one place.

Let's keep same style with audio-graph-card/audio-graph-card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 4dd05e7262136..a67f4aad01883 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -704,23 +704,23 @@ static int simple_parse_of(struct simple_util_priv *priv)
 	if (ret < 0)
 		goto end;
 
-	/* Single/Muti DAI link(s) & New style of DT node */
-	memset(li, 0, sizeof(*li));
-	ret = simple_for_each_link(priv, li,
-				   simple_dai_link_of,
-				   simple_dai_link_of_dpcm);
+	ret = simple_util_parse_card_name(priv, PREFIX);
 	if (ret < 0)
 		goto err;
 
-	ret = simple_util_parse_card_name(priv, PREFIX);
+	ret = simple_util_parse_aux_devs(priv, PREFIX);
 	if (ret < 0)
 		goto err;
 
-	ret = simple_populate_aux(priv);
+	/* Single/Muti DAI link(s) & New style of DT node */
+	memset(li, 0, sizeof(*li));
+	ret = simple_for_each_link(priv, li,
+				   simple_dai_link_of,
+				   simple_dai_link_of_dpcm);
 	if (ret < 0)
 		goto err;
 
-	ret = simple_util_parse_aux_devs(priv, PREFIX);
+	ret = simple_populate_aux(priv);
 	if (ret < 0)
 		goto err;
 
-- 
2.53.0

