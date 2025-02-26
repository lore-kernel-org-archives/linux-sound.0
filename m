Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E5118DB12
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533529; cv=fail; b=ViPOwIdCbVMkJhW0McbnImmmHJoIxxFtllocuiKO7wEOFV3dCdCzTvEqzcvK27obTqHkaww842zzCjKtGmYgBjyFugKOhRAUi9mcBhR8iEaNLgW4C1v9BIDEwMvxppVwdapKnn3z9JX/FGH+OtFnVH2yBZnYpSyenHbaaOYPnUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533529; c=relaxed/simple;
	bh=MFraLkwg8vDOqo/AHbbIGcemA7H3Tv/iLC8JSz2dpQo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ldDZWmTDsTPyRBjJaDgUjzuXP+JcDmtvMimgvc/44me/JtXEepXYFkT6o7dgwP+fs+ireadr2MdjCFb8yDaGBpYsH0qj/pj0EIYcQh5+vynMPBOt9Tq/dbpfCgAuQ9wg0SK/oANrqniZTKHKbpu89kh1xlV3yeeLLqC529QZv+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=L3okGNK6; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="L3okGNK6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNxnQZZSFvQ1hsjdGkwqI97aeksgfLP0SHrj9cjFlWpTWCxKZ3QC6dRu5on08WwchVoLnQpdesy1OrkA5vQzudUq9o386VpOXyOd6c27uWhJ0R4rS9KyiiHCEQpSyJxNI2Yj0LNXuvXp5E2IDfS1+owgTV8GGvnl6hdsaYcCRhbovAOd+GZ/sMkwfnrKLyK4SIuHmamvy/zlYVtGJXw+4JEKIauNX75ui03P5qYnJysaUf94XRlIWAqH7Kq8PfriFTLUMDNDHyifKvWlD6FYhvOSpwZ4Men585WlrLJZe4UzdthkCkhJPiCfyxT8wHGONrrORB5OV1FUQ6WxrP6ECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmsiR7pEOZ5qiB9/41g4oukkpas6HOhZgOyYJJfvLGg=;
 b=TAXgVU2mMzUDhgRPbExAxUwpXsAU1LM8oW1nKAeRjXVsctevvWRQlKGwDWMNtlaEcHRDLtXkJpzEct5gaRGGrtTX5g2reuAk4S3BYf8IXFCvRN4HL+ytRM6918/wjwnL2CTy87AT3F7+BSVkBWsgSiWaOW23kIyJW0Pjd845tkXKLr5V+ShsKp979phfW2paPKeYTChEzDo7Qv9akYS0FII8IOoIA5waqAwWfc5bc1X93x1DpcCrt5kftIH2eSfCiEqLiVpOMRo6ofT5TsB3QxWYuUdFwr9yagSL4rJLVNd2+fA20zUTw2IZx62pGYkKC7puCvulp6Wh1lRuQ9jddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmsiR7pEOZ5qiB9/41g4oukkpas6HOhZgOyYJJfvLGg=;
 b=L3okGNK6JcvHW7z1MH864KOIe1xcQNELZQxc1vUVhO1wAXS1lcSSdJCkGi1K1t4TuYmaIDUy5Fc4hFphu3GWlUp3V0v9TWvIj3PwmhFNZ13ooqfbzUNlaRd+xqMPBk+RES65ZoYmLfhj1taOsKyBf9C2g4chi8mJ4LYdn2e1Pd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:04 +0000
Message-ID: <877c5dfq3v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 031/157] ASoC: codec: cs53l30: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:04 +0000
X-ClientProxiedBy: TYCP286CA0350.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5c2356-f40c-4a20-c26d-08dd56056055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q5iHmQar1IuO5ghL4MLiXUjArFj8hcXhhFlThaXpYg+bU67i1ZBKXPFLh77h?=
 =?us-ascii?Q?3Xk+t0zz+iG55xMd54RiywFcEloTorkxe3hOID1XDrHaoJohdnJecInesYZK?=
 =?us-ascii?Q?WHkKp4+sKnYA3J79koP7I7rgTWsvTdkll2fkZuBNheaWvRFvg4gxdPPYNfun?=
 =?us-ascii?Q?LcvEZICVZthgP8i2vv7NWRmj+jMktO4GGzWqvJnakqMhioOmqDzNmDPM2Uv9?=
 =?us-ascii?Q?ApT5dx4mE9hXEKmhowYCW8wjKK3d+Kku9tOWSiz+ToC1v63NosTSjHTHFt5+?=
 =?us-ascii?Q?mxpMZJifjMe6g2yUhSK6wggxj+GJm0X5rLhbgevAhDrG06xe9AUhRJHuKbEF?=
 =?us-ascii?Q?Ytz18aFQF4EtOkPPx1MFGL+QBcq3Jon6YhlM3CTV09geQxVqRMaJ9W4vxIMG?=
 =?us-ascii?Q?7FZFimg3HthCq+3yJu5P1ctE5fe7D8lQem2+QIBrUSQN6g97F/6ebjYXohe+?=
 =?us-ascii?Q?UCFbM9sh3X661FNzWQxb+ncFZgigEp2+izSP34u2Xrfn6sDG6vXpgLVFm/Dy?=
 =?us-ascii?Q?QSJsmXovaw+VrXYnG2RJR/lOIPsj+LcqDwIt4T4hW765zsCU6d9iOKmFMzGv?=
 =?us-ascii?Q?lt4jdL3Vxo+eq5OIVKs487O6YZ367NEqy8X0Y598rEs+FT18MSDMCUKv6bUu?=
 =?us-ascii?Q?XXxvvAiwKuPAxZ2ARIELxLZykN6oz3jRSV+XFmG+KBo7Y8QWcc+hMlvlxSOK?=
 =?us-ascii?Q?B2C7eDXQaCnbxpS8V/N5srxU6/khy7DXz0IcmOJyHE1kl1+PrFz8oeeYZIoP?=
 =?us-ascii?Q?3pFAYMEMoSWv1XCq5eOC1FZIpNyWZ9+QfxihX7UTCwn4Jmw7rufgd+J+3ZJo?=
 =?us-ascii?Q?COzFtYwnaY8L4esyuXOL47gklDNcS2N4tZUKtKYftFop80IB6y4utDeG9ryT?=
 =?us-ascii?Q?Tf5MWMuPEohh9Jp4ccY2S7xGzWaJQg4o5O1Cb/Cp1QDI5r1SXKE21PodByt2?=
 =?us-ascii?Q?YPzphB3hNCcn9XKnPY+f6PL+xSanr+1/T8bCKKaGj173m6w7/j83mHYpUoJC?=
 =?us-ascii?Q?JEsR+E4muyBSJ8CIq9fwGQzcardqgn65bhr7bBqHpI3xDNBW8sA0mjEqxgU5?=
 =?us-ascii?Q?IFWyRfULkAul7CgsKvx++P+ofa+qe+djOR4xEHqQRvzZOBPEY/0wsAgSt1IL?=
 =?us-ascii?Q?mTIZVD/HlFMKxjVimQV7WrGXldA9pHxjCAO3FCbYM94L4RhTuRziYJrgVHGk?=
 =?us-ascii?Q?wtD/NDDtUsnj9r2pgYkkz3gx+PTaByIBPS2/cBma4jwz4moBk2C8vUBDTkrW?=
 =?us-ascii?Q?zEztpx+4PotcnywIM6oGqEZ4q/PJ3GEyxsCndXpcO3hVE3i4kzJS0ynVOikt?=
 =?us-ascii?Q?uMvUB9D9mdp+JXuIjsDAjCsxQYE3ixKVY8LIGCY9YrNdJGIufyTgJazSKnqz?=
 =?us-ascii?Q?iNhDTBs8nNeAhDIOwcFEQo26zq3M4+zX/mMQbMP5e5SPciMWFKK4w2iUefV4?=
 =?us-ascii?Q?bQ0WdLLKnOatkKpMzkU0B052GSIYLdhS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uLKqvAQIRDw1KxMq1UzO5yxQEh6UWKExZi17IqQo53ovF1E4WzjV42XyjYd1?=
 =?us-ascii?Q?rjmjVgGuS+9sWpxGor0fQmVvyl1dDecGmymYCh/6KP69eDHGpwiV+aODvZFQ?=
 =?us-ascii?Q?MwgpDVk2Rq9xVXUcoaujKs0Cjmu4eBvsnz82GQMAiC/1O2IFJZ+AMeCmMqL+?=
 =?us-ascii?Q?HC+TbXTSYhZlUGB2SwRMBx8Wfrn5CvfRxsfGkBZXRzOoE9FBYf/bmRfrnAJE?=
 =?us-ascii?Q?d2e5GxFg0n08FHxEwv8EAUnRTn+cWmfzDIWwtLA3LTk6hQtmefyu0Sywi38r?=
 =?us-ascii?Q?6wWNrAtZ3CgC5zzp8OrKhEAqmqLO1rRMzOMh2Z78PaURQcSe+mVZVE4LLHZy?=
 =?us-ascii?Q?nafxSiwPr3ULujeh2HC6faBBOagCC0KNeOFffeTp5jlDplA0dyKlHiDg9q4B?=
 =?us-ascii?Q?vpsk/QRn4XPvRd0tDMf8GZQEwklokjUfga5GYNyotO49dtldBdmWFnWgm3ZK?=
 =?us-ascii?Q?/3IAhvA3Tp5CJTqMk60zCFnSA1+FJvM0M1dk0v1aZkoBEp8+VWh34SwuClmP?=
 =?us-ascii?Q?9Kr8bLmXl8fkF6zbbMHb95vYxz/x7Sztn8ST6WOflchyIyVvM2ZGyjqXaydQ?=
 =?us-ascii?Q?BBGiYgNu9Bfw0QAl1xfRcplSlQiNG/ky1irU0v1xtZZeiINLWUFsQsl/C1hF?=
 =?us-ascii?Q?i2oVBkgIeVtH96wc5sJm8XON/yFLH+x5TydOvRveVSgaA9DzrKHAmXpLZdR7?=
 =?us-ascii?Q?kMgHRVe7s2++EoDnuvhcAWWpW+wSUNhtpzs/N9JdZBzp64KAW63GsvrMhiJ3?=
 =?us-ascii?Q?h9GmRxukRRNdw9/uHX7vWSrPC4AP1E+AHn+QqrXLSHqzca7lNhSbTVg30YVr?=
 =?us-ascii?Q?K4S7Uu6cKrn6WA2oB4Cw5Lj0LnpwgyhU/a9vfvqtJ++H0btYWoVSp65TBEkR?=
 =?us-ascii?Q?BZY77Yluc8FcVpD2AbjTO8K3jbOh+ChFa7LQsKVi/bXXchf3rh4CKRcUF3o9?=
 =?us-ascii?Q?OUZNC8orZ8/7ngQesLB/jpoDCqB2AUsWdvGS7206H+3+k41Lll75UZLI6Zty?=
 =?us-ascii?Q?+T7utftUkNRSJTLccvaTOZkGVSO0GwgyMRkeA1bMWqVen14Q+Yli3XrBxaLh?=
 =?us-ascii?Q?L/L3C7L7jCkoYSABg6Q93jmbEpMk3CbX8l/Au5kZ3lH3NZx1P7ShWkcv5823?=
 =?us-ascii?Q?lFkDFzvj+UoVQxVcJhqfBVD0mUzntpIJdVRyo9zGFURiXNYzJxPvkz8T58Br?=
 =?us-ascii?Q?wGAC7IWdGitLrpF0Q2PPDS8jDnK0AIMLvVthLX93IuC3F/hP7JTDCRoqrA0z?=
 =?us-ascii?Q?QRm7rZdTlIaT60Pcd2NkZlWEBeKCBxzpU3vDClPNL/QT0FLhird519NrlRC8?=
 =?us-ascii?Q?AZvFf+5P05WMA3phzcqLROrPfJ5oqA2W8dHc5EBzdNIUszL6GohBa36AX/CM?=
 =?us-ascii?Q?uXoMZGmLmGZ/VtWTMa/Mq2D3H0NqNoBuRpzChUba8NnuHxJWQ2RWdpzIkI0F?=
 =?us-ascii?Q?nqz0lPE+hKoQBAqFhVGvsxhoIlBJtlnulCHkhNvaCq9kAPDpB4uqoUDQvJ96?=
 =?us-ascii?Q?9YECYlFi68Hl0W64e0OVePQOtk+xlEJrEqpPQc7APEJJbXaQh7GwqMLF6KoL?=
 =?us-ascii?Q?HYHSRRHm2RFlU1cvbiiK2uYNMCS7e4V1u7IGbHUbYNa3VWGgTaHScBmaKgRF?=
 =?us-ascii?Q?2a1qMCFAdTY/Ayyv5527Jq8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5c2356-f40c-4a20-c26d-08dd56056055
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:04.8764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkhfkMsEVY4yFrxiRdqXo38lBGLU8XOAS4pJgYYUi/B2daqmnvSX5Y6tvvNakZgN4JAHwY+w0ZirewM32UDTukkGlp6T5F+3DVe4tDBbHADqmJKImv7l/5gvWaBSuC2F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs53l30.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 28f4be37dec1..aea4244fb275 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -572,10 +572,10 @@ static int cs53l30_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	u8 aspcfg = 0, aspctl1 = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aspcfg |= CS53L30_ASP_MS;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

