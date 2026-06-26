Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63683B14A7
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 05:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452689; cv=fail; b=Vv8HvP4w0X1wki1m7JYYTlajoHbaLZ3XL0GM8cbjfIfwwQz12hajTQ1oC0ObSDCAU3g6rsW1ZV3LktkuIuEV9NVUrK2xdQjpgJJtg0JcOJywlSRLjQy+7ON9pX5tdyd7Tt1sZvA+fqNVLk6A4Ll6u30WhpYD0OXoj9T6nr1+tRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452689; c=relaxed/simple;
	bh=pwcD2jVlnjReMR5AySDwm9EOXUnXDGAuOvptaso13bw=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=hC7aejHtgWLiPuSPBmtaOLP/yLVBjnPg4Adcvhs2JyoZedU32b1WCYqMKO7zTdcWQF6ikYbTpXT9FHOuYvufYVnF4ze4Lp+ymXRiGSjjh4TF04I/z2Z3YU+b3XejiKSrUuFumN/DpZiVFRhGbd1xPW4EJE/EwYkCZKII3CSPgcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=av4E1nvE; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="av4E1nvE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRKEL342QkL6Vu8ZTgyDPUwH20UgZeRx2iFfxeLJKNN70sBawFP9pSKEim5AKjTgUK/3T0L0OJA/3x938FmiLJQqidVE74v9+7SZBCPhk6YiuWsQNSrE/8xMNS28Av9BzhQPZQLNlxXuYQpDXC+B3QXkjwZMwZymsoNvqEZFm7CLxLmJiv1ulRILpT8i0W3gmJrtkAw7/lIALPauY1QcpQu3/fUm4Jr4M0lwX1LM4dauiGZyC0Z7e+RDRgwYovEHpjZG5B157BljfVGF/YyIpFfgk1Pp7nOPdCxrJ9KgTTM9VSXMb9aXAbjdNZbN0ABnDj5YiUvdyCXDHBdr+/th8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0l0PIFSbYeKwuqWcTiDKYuwsBi0muJOmyH4scw1Eg8=;
 b=GAhzUd+nknjjZtx1ebn5+zh5M/rltTFi/onZ87JqRxaaMlMJQa1bYKKO1zLgFGbkl+PYjD+WfXWuAfplz/b9NfCBYs8Oc9uxqjrb5WuFUAloZ75TPLt3urofZg4eRm74ahbn98EbutKLaytiq9Vd1JI4fOyvbCKdhgXLqUlmIBA7IbEvB+NFHRZsrzfogJgxpedFHc3aWCmXuNVMVaSsMmUYJNLRsA0g5kdqZk30CwJNl0bxSx0TTQkhtqkuSBCGPPzv65MOS1FgqsK7r394Vpz1zqOBnstyzjKc+uhyTb1LsuPzh9EjqVZd5Z5i9iAqQtlXiPX3VU4bYKxIQHraTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0l0PIFSbYeKwuqWcTiDKYuwsBi0muJOmyH4scw1Eg8=;
 b=av4E1nvEiejkGrwvJp1PCYhx3f+Us/dZ2iRCyXgYCh+3ZM7c/6w/OdrxJKnXsskoEfrYK1l0jjLPe2taRXpoZuCuelLOEku5o2hM1EqQLSSxaNLAOdhkx6xGedRq2q1M/2XOqDY47brYGjy3/O1xr1uq/7aix6DElSdDgmCCUds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6606.jpnprd01.prod.outlook.com (2603:1096:400:ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 05:44:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 05:44:46 +0000
Message-ID: <87ldc1etyp.wl-kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai <tiwai@suse.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: sdw_utils: tidyup functions
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 05:44:46 +0000
X-ClientProxiedBy: TY4P286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: 3676d483-cffe-4a46-0579-08ded34607b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|23010399003|6133799003|56012099006|11063799006|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	CvLGQnigVaSMT6E0FDdNrYCaX1KLZa+UTJhb8rDpznsmyaX5XYPyy1E21UWrHh5T1SgI3pfGQLpeEiMzbsvEJVm+04D1jr2tZREQm9kIO6eE3RBAeOroax/S+z4NNbOdArhgUQUOnQSrqFOEOoZLmUloNql7FhlHrcMAasTAtlPYjFc2ZpmzB1Dp/qGQlROXjJ/Vb4DI+cNrlh0X2y05cFdBpr8pE1eqtMPM0avyFumUPL+euFYAtJhoNrafWkzNJg/gE6TkqP0GjYozy0z1lGwB4CF+oXEo2EWDxDHF3k3IMu8s91qmQWea5RoeXFAwUOwKfxs9nGptYzF9qhN/y4Wa0eN3Qi9cajvjgnmvJGLUU0QHY34S5qsGGgu+go96wi/3VwEdGZXnsG595IGjd+dorThnpdwtANiRpB5BuABT/qh6X5Tccmo+zrJOgn7/c5vBtP6rrMpga8nsnI7pLt9bbENtXDdk/6woX6OBf4L5Ugwx2a94UuvtSr5CA4QSG5OPWriYHL9EwlzBUYYeqfrN/zwAX0gG/t0Ie+CZPSYsiwRKtN3JEqtQo5wgWSKA9KbuQuSbLIOgUL6k6lNb8Xm4N/ao2tWVRY1nfj1MHsMESkajhR3HENblHuT4Ti4eRuKWppt7+7pOClywgm3sHKytxrTlMxn+IgzKaUr3XGdKlOOpekLGw9fYqnTOKZiG3NhbfDfavJ8qS19XMJp41JSQt+ZPejYhBvebp9TyZ2s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(23010399003)(6133799003)(56012099006)(11063799006)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wVsIvO+5ACk2OrkJH52mykij7AcWJusIoJgQWCyqVvk6R816uqKmuVFB+1pj?=
 =?us-ascii?Q?1TZxZatrhhV1uZ1eYqQM5ZtzN3KmS7VFVTapRyl6WgJ0YYDeNIpjBz/rrzUo?=
 =?us-ascii?Q?QmZAygQfHspx+5cUl7Ml9ZlOOWdj3zHOIzVoGAb96+x58JObNMV/1vtXG7em?=
 =?us-ascii?Q?JS1AdTJMK0DZbnWNOiyAXY/ZJ48YruPMm1D1c8zQRnNh667vDjBw/NTByLbs?=
 =?us-ascii?Q?jkMlMyex0pfNqPT2Mh1/xOtMGQajuMOIXtfO5FQSk4DecQbma16urlbvJIFi?=
 =?us-ascii?Q?6HFldoYf4NZYzj32Zy+hMHLeeNuLZRd+FK1bZoPXb52aVTz+smfu1z/K9s92?=
 =?us-ascii?Q?DS7Cx+GIVgetkE+EOeCXcQZtiFFEoiJSFmNu1VCGYJeYqzUVrPdRsH0u3Fca?=
 =?us-ascii?Q?adMxVh2sEsfvpxV9G060y6SfkWAFt2/FuHcLyxAdj3LuUDZVGnRH7dTEEoP6?=
 =?us-ascii?Q?i3fPc1A9eX/1iUIrhz0j/VgcZse8R5DK6Ua7LW3EF0D3mbcT3y442gEbM8jh?=
 =?us-ascii?Q?GksE6+q7DA/z0DnTja/m7JSCYbcPP+blQxQP2jR2eenvIKeKjgvwluYMKaSx?=
 =?us-ascii?Q?RGFzaImZVUYaifJ/Y12lg0tvDaNORqa3cXDP4vKwbZtpBRqH+cdQZ7AVSNQo?=
 =?us-ascii?Q?NYHkbGrq4Z3Dp9YFy4FNvz4UFxEtXwq+bzHIVpA9z+MyLHwbIrz0zH0keFvo?=
 =?us-ascii?Q?9WlNPljU9kCn44FD1PNUCGH4E7Iq+bGW91cK07+Zx6/K9Z18U3g7uTDMKiB8?=
 =?us-ascii?Q?i91bmU6dB7DtyNSMB/TUUUbQ+ZVqA+tONgt0GGrZ08X0C0uobivkGha+KYa0?=
 =?us-ascii?Q?OW6EfmqCOW7ckNYHxwCh0kvaGFm4CPg8BMedlbIeEwJgRJ7bqyGPs6ar1W4Q?=
 =?us-ascii?Q?RK0CJae7FAWPvcf0PsdghwrKSbb42T1p+IOl1r8s7cm8Nj3cASv7C7P4gq1q?=
 =?us-ascii?Q?sRSuu6x97zMc9i/xNDBVCxtpjVE2x4Ahtw6GPr+fOAoNpvBoBJbknDnoogg/?=
 =?us-ascii?Q?lXUBP1TxTzy2a8kPD4LstdtdOIkzxvfFs9YLMDMhv65/57hxvX6sBaBwa2gp?=
 =?us-ascii?Q?tIDG3I1wPEANeTa+ot0GlKDPG2qTenIY0jwyVx0GfpIurJvJ9yPhB/Th8Efv?=
 =?us-ascii?Q?iLbT2ar4CgQ1YR+dL+JwCpWl6kpcOP4hoxK/bhMSBECtopsPShajsaf5TkG7?=
 =?us-ascii?Q?Bmn+NLE4GE+utLmo4BOn3rgaPy61uFqvOO1WvOU34DTh5vW7maOmIAa2h6Uf?=
 =?us-ascii?Q?CN6uZPvwB+GtPw8RFDHOL+eQcJQE1nzukWC67KYpX6HiFbIspi97zqQ/QwaN?=
 =?us-ascii?Q?K8+Zuk5Kujx9om5AIYASjvOz3X1QnYi9ND/4kdf0smgXZ8kjjap1xNJaIPpa?=
 =?us-ascii?Q?uAYAtBZenalW5UaaJQjXBv5t4Nl1PbvzQua4Go+Epkkf+iOhS0z94v6342tb?=
 =?us-ascii?Q?uz3rYoE20F5ed6XLe8v9cy2v3uOSSZh8fjJQQavM5qp3wn8PXgoDIjvMrMwr?=
 =?us-ascii?Q?5m2pOZ8kYe68DtMZPUF36xf/XOroH3rOFmOklWfFjXV0UXwgc+UeKZ8rG7Nr?=
 =?us-ascii?Q?8Wmp6TeQtkmKA5JwzEL94oL8JvbFf7AOMOZqRPs6C9IbFvWHBL+3sr4vLo59?=
 =?us-ascii?Q?LjEPBbSb48e3KgX0PspdiI+VBKwJX+VE1AXWF7e6XmHzNQ9qcfhI3hTDeSFU?=
 =?us-ascii?Q?As4uKQqiFOkncg6iLNhe7hKqq4s2l6288nONDbITmSdzMuZl7IgQ5ry4PY5g?=
 =?us-ascii?Q?wu4JnJUXniErqfB8c0Fou6PGswoFDof+3Uh46x8kwRC/X+9ify8O?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3676d483-cffe-4a46-0579-08ded34607b8
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 05:44:46.5138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWHstgPFqNjhyMhWPG0U0DTMdf6SdP5HpFUbNtEBflgH85UYnKVNcxfbR6ZyvYv5x3NIr2jbQwRA07mY0ycivRxEF/liWeV/ZJTdPZ432QHec+PFfzugF657nQy17yHq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6606


Hi

I will post DAI/Component/Card capsuling patch, but
current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.


Kuninori Morimoto (2):
  ASoC: sdw_utils: tidyup .count_sidecar
  ASoC: sdw_utils: tidyup asoc_sdw_parse_sdw_endpoints()

 include/sound/soc_sdw_utils.h                | 31 ++++++++++----------
 sound/soc/amd/acp/acp-sdw-legacy-mach.c      |  2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c         |  2 +-
 sound/soc/intel/boards/sof_sdw.c             |  2 +-
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c |  4 +--
 sound/soc/sdw_utils/soc_sdw_utils.c          |  7 ++---
 6 files changed, 23 insertions(+), 25 deletions(-)

-- 
2.53.0

