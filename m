Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795728549;
	b=Uz/r+7GUXZN7Ra+bkPar71sHa0WfsB9U+8uvaPCz8Q8l+VABPs5LjdCaapJeNw9zKeju
	 sGQD5CfA9UwYrPonVr0780UquwZguk25RJmmMb1PIHv33ZBelAQJOm/tG7Ui9nGq8vAin
	 1WlspmWcOCQlvKUZyGpYW7k5CeUJy1+tTYgwRixbLn87CUfLLrDQ9gJPYDAOJwUeLh3CK
	 dFf56IpNv9cd9q5/9Umrd8SNvdcpHyCoU2OQulGuasD4RritXZH1ATpWiJEt/TCc6Q3PS
	 YVR7iZcxQRHqYyzKNupNEa2eyoeo1JwbMAyYq33kDA/a7qstk03WDk4c/IQEOwDwlRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728549;
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
	bh=UZns8ekaB/z9o8qcNqZkidJ0bC0J7LfJg+sG+qctCD4=;
	b=dm0ssQkJotjeoe67UTuwEN2EEU/ImL1K8p4+3MffWWsIetpUUqm4jL68kRJk3ssy1E8/
	 eh6jnVffrUrgENKuKminefalTFw3hSzvzpmPKppwSIpb+4WCEcQf1hZATKUzxCQv7Gxdz
	 d1GYfQKhYxUDjBGKALjpZFNxygkqmbKGgaifo7Ggrw9vTcq66fxetPWuwl0OvbW4Wisd8
	 +c56DIdNNKS3cGP37xNXKEZj0ZUXDegQBzPosgswtm9GWo4fSqfMhHtinb4fUnbaM4mlH
	 L5q0pvh8Je70dgEF/EkzUYkzvop6BAvN3NCzUCA+X2KmErTTtGMCc99PS2O+YuHVznw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=Tezp2qTz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.75
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013075.outbound.protection.outlook.com [52.103.7.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7CF606A33A;
	Thu, 26 Nov 2026 21:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7CF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=Tezp2qTz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTkW4OOrlaRsky+7dODk2kjDdzJ9V4Ox7Je+Jl2Pmq6UbjGwJcq12ayOSEiKCiRbgz1D3wSA7d3QpaknZxK8v6zQBG28TDzQu9OQQl9Q3fDgKz7e5MESegz+rL0cQG8GE30Hq/ucQW72ObeQXt7hSyA/iBa18IswbykLnR+Jsbt0Pt3lwQQcGwCUH4/9pHPLDiX66765ReDO9zad/itJy3LJaLTiZatJvL9h3HA2BExmcjvpLfadlYcynLy7JDOs9vj/BMxFT+YxoLGMSsPNG63OyhvP+WGwr3nYloY/NGpN7NlQ1a3dHQIIfYn6ESilopciDJZEEFIwVMBnAXtKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZns8ekaB/z9o8qcNqZkidJ0bC0J7LfJg+sG+qctCD4=;
 b=ipfj4ZD0xH/T216F5g9JzP7sRqw8O0/RsZWS2N+eRgt/30UrBm+xKSTje/j5UdraD1FR7L0BA+GhRHGqUXhWlB8OHPsbQ66ObQvQGUJ9A16F/efU7EPuX8eHM5f4HwKssNEFD21a4iBWqkq+mzBXE7QqnVOZIbNGVOU1tiolViQ99LZhWP0HPizVT6BBB7BpK4A8ipU7pbFfydtYwOUPXswivPBPQS7rwK0hpFNUr0bnwORQkttabjA3Q35Biy+Qkp97mVDZKahYNKDyR2BcP88RuKmEHu67DARuvYJZ+6pE3LIOsFy3qoafPMXZYIy/tzin9AmRN3m47/OP+BcM+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZns8ekaB/z9o8qcNqZkidJ0bC0J7LfJg+sG+qctCD4=;
 b=Tezp2qTzdSehgM2IdAu4IMn4M3a9bo+vWBf95+dhGJmq3CqVv7uwyziNgTEKpIwLn/6MhaAobIKPjVGjlgUotstK+keYn/m8BNiBDmZTAozqbWu2bCRX6m7cUbYSUd3wwTnYoH+DF20Dwv3FIyUem+vpM0/FkaT9Fwg+MmsRNHZm4HhYwK10pLNkbzfG0RlZ8Stto5JH60Uc6MBAYhRaDYnrodKCWlJTGv6HwV/6qx9zbtUHDMznAsOwt9lUA0VqIDX6XVhZSRW5ZAu/JzRqbQfuvNyrqaijcRsJ9vcnOlpq8ENB9QH3mvxMxYrDYqWDVB8Xwo0hZ0nawEf6ZLdTBw==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by SAEPR19MB026956.namprd19.prod.outlook.com (2603:10b6:802:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 21:29:07 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 21:29:07 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] ASoC: aw88166: fix error checks in aw_dev_fw_crc_check()
Date: Thu, 26 Nov 2026 22:28:45 +0100
Message-ID:
 <SN6PR19MB23031FC6AE5B062E752CDAC0FC422@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <SN6PR19MB2303BE99A9E0E7C4F64B516CFC422@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303BE99A9E0E7C4F64B516CFC422@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00008BF9.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::475) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261126212848.11778-3-marco_giunta@outlook.it>
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
X-MS-Office365-Filtering-Correlation-Id: 11e358c7-0e87-4b3a-23d7-08df4c044da7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|23021999003|15080799012|24021099003|55001999006|12121999013|25010399006|51005399006|5072599009|260925184616899003|41001999006|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hWnbMu8sD3yal6NL4Jv83AUcCz8wgg6feDyupTMUDpxV7RZh4gHByD1OGAn3?=
 =?us-ascii?Q?2FXd9PJ86t6r0vngRYUp+gDATgZmNrQNRgJ/sRcVmF9mgtuzGjIWUk4DodTS?=
 =?us-ascii?Q?hCSZWep+nZu0oAqfQEUBBiZxEQGIiCv+ZRI+DLsjOFrqPePmf/lZ8bus2b0A?=
 =?us-ascii?Q?6R+tAer+sW29l2M5KC5TGQHckFG/0cytjxKbihgM6/VyBtBsjQ+6ubNMPEyM?=
 =?us-ascii?Q?GqXgiqCLyAtaBOSa2rMcWo+8CSnqKLfFlvbssLzxXinILZGe+dCcsD4ZcOjm?=
 =?us-ascii?Q?9B0bF1X/HMWOPS6DXp9ttnkfhABV17dPvibnu2IWCsZwg22kFJRfkt0zVkZU?=
 =?us-ascii?Q?eHRTOIbxXk1ZS/V3C8kPBZfihZG/C+s81DKu50+hGqNoV/L/tj9qMt4bk+sA?=
 =?us-ascii?Q?kdxsI9yIjli2b5f3mXxBLsEBBhS0Eedc8LYAdH/YX6MsqSGZwiIVDVWyVSqO?=
 =?us-ascii?Q?Wgam7qBAPw1RblLuflef/WAdvSkUccuilpX4ISJKf6nB+Zz9K9i00NDpcqsn?=
 =?us-ascii?Q?4ZDFWd/n0ASUS8K6f7C4Hsrzam7FUOaJue9zNfIbJht1l8rP5gcZJb7XFVi/?=
 =?us-ascii?Q?e4jMj8enF3m9TYeAo+ZquWw+L95upHVlLNiGbxk7o0jyf1/zu8lVOED49zkp?=
 =?us-ascii?Q?yh8E7YqbnUk6lL/yTFll+N8HTqIWwU10CJupCAeHyt9YjzWbfOtHf+VjpgS4?=
 =?us-ascii?Q?CH3BlUiE0LXKk2K2aZ3/f9bPKj8WZOYPq6hvIKnBTE1DAHzro4d3iqJl+iv0?=
 =?us-ascii?Q?xCQa0AlBx3eDDDeIxOeDSRoNYi+jZGLkCx6d0xfmKl2Si6YwrHjvy9/LZIJz?=
 =?us-ascii?Q?pAouwK628W09ph62gJK3HHDj6bjTkH0S/CQPHYE9ss5oBbdPVGcyEI8jFdW/?=
 =?us-ascii?Q?4KkUxIc8+UlzDRO4LMxAOZhX5x1T0Lu/wO6HDY6U/BclfWPnssBa+Nbgjvvs?=
 =?us-ascii?Q?Zi708KjHwmQXUkuCV4AQNi/VueSH7/o/0YWsdG/dHv6II0yH2yTSTu2XRxv4?=
 =?us-ascii?Q?n+GVd8EFn6xFxVYkx5cJqSLzlA7yvenurXEv1fpaHSsYYrB5RBfKjaGAEm95?=
 =?us-ascii?Q?grKzMAwU?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jl0dZS12CFOaPPf98FN8KBchTwpbXXATxsYBWcIV/ZjMlyaTmpcOrnrkqrdW?=
 =?us-ascii?Q?0zuK/rX8Q8FaC99Robu7z5hsVTJRWWxyR/H33el7hWl0izEPOAEtbqn9a9xx?=
 =?us-ascii?Q?buy2rAGvYf54CfGz066jqOqUwvMKaatslkx8bimROYUSvQyp89AU+yj7QIB/?=
 =?us-ascii?Q?vBI4ENVJEf1OPG1OQhBzKQjOYc5J0cW2jjBO1is1hdZP8E6K3U0pvfK71dDW?=
 =?us-ascii?Q?8jL+9JRXbPvmJnsaR+F+WMuS42taw7J5kjx4o+OYU5bShm0UK9NtTgTXrPyg?=
 =?us-ascii?Q?cD10MOE3FnGmun5TJHpQFUZTz0O/KBsAL9JycX8sctWGDKbkqvPBPNJBSVHs?=
 =?us-ascii?Q?hdWcuSmyaXnHq4jI2T36aFO8Zi+6fi1zf2MBT7S23Zq6l5zdh3J9tWi7zIYV?=
 =?us-ascii?Q?+c4eDbQfxjJ4dOScl8PBUAZ6sf2aafbNIjqDMDwQntAm73JQ7L9ClzWrEJs0?=
 =?us-ascii?Q?mNzWWn9SbomzvHmEwXpuLCYO7wX30Gg90UwWXoOE+2nn3F7aMo+6m6s5UI3h?=
 =?us-ascii?Q?ArShW9ikPPU+VBBIc7jpHgwg4ntUrZraeas+3JZ0OhE6Lclzj6+pn0QJ/vUz?=
 =?us-ascii?Q?3e5sdIPUr1IS3XOVnWrrOGQPtTft1mF1EsHtjjK8TNYvOcXWFpAJvey7pYHV?=
 =?us-ascii?Q?fYtFcDmUrWxrBOxKda97a5rMhL8Y1qlALLPGoJ2GWHgmNC4t+QUadStrMeQb?=
 =?us-ascii?Q?pS77FGhmdhkKnRdYH0mD80q1EJS6uE+tM/Iexa+zfqeeYctg3RIF+5cIlQG7?=
 =?us-ascii?Q?GhuN0rt4H6vNLYzZh1dmBVoqKfED8biyBHbZzrTFLKoI5tYzD+23yM+0y7sn?=
 =?us-ascii?Q?VLbul2JLH4XilpcvYvsRRDaCR0Ew1bSrqt2JdkWohqwpPZVxNMKT4aGBATST?=
 =?us-ascii?Q?GZKAoYl94c4Ow+O5ttIPWJYwQEq9M/aJt+qLJDIJ4U3itc2z4ei2J2V02g3q?=
 =?us-ascii?Q?Y6vUloLiQNPv588Sq86CYFcUfuc7v3gGPAKIHOftJABC1uJWMVc/RLhZbnvG?=
 =?us-ascii?Q?pFtiIVMlAdH/7D2RdZKmd8A9sCL/mk10FrWm0BOoGDZ01hAqB5ew7maM7SRm?=
 =?us-ascii?Q?O1udZHTWv1siwUTMFccB2nSQmgm4WkJeCkdK0v+uVguaSZ+uxE9+QQ18DnOp?=
 =?us-ascii?Q?KzyeAF6T5FTMpJDHXLU0WIRaJ++5MLZXYGhtCMCgMjeq4QX42cVFdYK8+dUn?=
 =?us-ascii?Q?ZtGRBX3bt4hRG2n+umT/xeFNURNcDcnHuBh7u7mKf4w5kIJuXchc6icRrmub?=
 =?us-ascii?Q?nx4GZWKfcYb+17pJXGJq/houvaO6feR2MbEyAjHL9UHoesQWPVQHK0M4K75+?=
 =?us-ascii?Q?Hq5w/yOHwGHr457gnsEEGfVOJ/SQa3QuEiRLF02cvokKqxfdH/T985zZuLVI?=
 =?us-ascii?Q?zwdpixs=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e358c7-0e87-4b3a-23d7-08df4c044da7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 21:29:07.9191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR19MB026956

aw_dev_fw_crc_check() does not store the return value of the regmap_read()
of the CRC result, so the error check after it tests the earlier
regmap_update_bits() call instead. A failed read therefore goes unnoticed,
and the CRC result is taken from an uninitialized variable.

Store the return value of the read, and check the regmap_update_bits()
call immediately, before sleeping and reading the result, as the aw883xx
vendor driver does.

Fixes: 94e412c28e61 ("ASoC: codecs: Add aw88166 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/soc/codecs/aw88166.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index b3d11e1b5d67..5e891bf99bff 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -461,11 +461,13 @@ static int aw_dev_fw_crc_check(struct aw_device *aw_dev)
 	/* enable fw crc check */
 	ret = regmap_update_bits(aw_dev->regmap, AW88166_CRCCTRL_REG,
 		~AW88166_CRC_CODE_EN_MASK, AW88166_CRC_CODE_EN_ENABLE_VALUE);
+	if (ret)
+		return ret;
 
 	usleep_range(AW88166_2000_US, AW88166_2000_US + 10);
 
 	/* read crc check result */
-	regmap_read(aw_dev->regmap, AW88166_HAGCST_REG, &reg_val);
+	ret = regmap_read(aw_dev->regmap, AW88166_HAGCST_REG, &reg_val);
 	if (ret)
 		return ret;
 
-- 
2.56.1

