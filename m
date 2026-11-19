Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795105833;
	b=JYdLLQtyZbxdl6yONVDjk9ldC85um0BLMr/UsqDKw7lFCOwB9rkN71CHyG3/b0OrIDrO
	 OXqCOGE6jnvT7MsHpa3MiPN7V5hnp9Pj6UBmTxvGKVw9VAYA9jZv8j0Jce3zLjRLP1Otd
	 oKca5Tdt9+rwDF8jis0NjlAxXlChU/OjyBhuofo9xXUKDr/rCeOValfWtKUJYPgM3W2vV
	 5U4qrBp+zshwHnydmBremKrtn3RZGWnGAy47rAenSCtMGfC2nskt1RGAaTmlA/joH5dIp
	 eY18kl9hMRWn2LItJ/XJXCpG0AjsQEuGJuN61XqGQOqM2i/Wfv6TTJ3VcoyatYqAigg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105833;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
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
	bh=YA42pR6Zo1v+xBqeuz+Ji+/wmoIjvqKuRcYzOeaiwjc=;
	b=hIhkHFDgqKRMa6PumMzIaxWtT3NcTthpOhQVHlp8OVXA+AjpVZn5TcpOxbN8RxMdNDZu
	 zrMm8JVK6yvPyMEwE8BsJosg+BOqjgoLbLeph9J1GSY1Q+LBYNRJJD/vVPTH53lha/7kh
	 Uf5MXcdGbj7xPRSoHfKwai0yqOI4KFqsbo2TRzzwxgclpKLQJmpVbLkdBvB2d1eoNeueP
	 J9bLPPkbdqZBLU/+8NnH88Rwnm4aaZd2aL6dizvy/ljityqmKqr5Uhy0VPlPT6YKwnHTg
	 NIxxO6dgjUuaTMNmsYuYBPi4stGhyVmC1LlVEcm5X/qSVQ/NZnKdAySntkm2rpJnQqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=vKl8DfMn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.86
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013086.outbound.protection.outlook.com [52.103.7.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA5660A2601;
	Thu, 19 Nov 2026 16:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA5660A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=vKl8DfMn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtM12YER0q7TscXPI+2i6HlKeUG65G+Ac7sy7yYp/yq9dDu5IED2Gww/3Vs/yssRlcwSiy+1JRNyuYXL5LjM9k+UUAKoOjssNqBTirSr9MArntgIthLeqOjuxDKa7jmhqQFmaPLBH63OdIkI5Lk1rdinqOgoe+1tePzOHzPNuo17uhrr3Dbdf2zPHl9EGj4e43lRtlMx+iL1TQ4WDPbpkzS+J2NB93ADL5IjX4M9N6habrXpKFNiD58lX3g8rAWwCskaSGF5x+y0dn4XMqc3dc24DBv7fVwBVdxwAg3/OiXOLQOqsny3EeZUJu7D6mZeJS9TMlGhSG7M33IJoG2+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YA42pR6Zo1v+xBqeuz+Ji+/wmoIjvqKuRcYzOeaiwjc=;
 b=U11bmanYCVbQ/Dj0ySYaJY0FsrtXKjeGke06wSgUX0OKvDdEVX0wxoh3mswnkp7wM5t3BNHbH7Vb8B5XmV/KuVm827yiownDeisUExrhEci5+wzlG+F6ALi4BBZIoRB0S03hE0fMzP+QbIW/WYMGUNkeQLAPy1ghYeP89cB7tQs6R6eTKdtvlppl0loNPfkpWrIbZy9NnzLAX1nyDBeWFEXFdBfXjMI3ozHErwd/DrO1uMSJi8AtPL4YmU3jBw11D0ARiUxqGiMNOfOEDYVDfgA7Yq+AidAhT9Vcu5Nxva1rpjEwBE6v9LcZM0ajAUTKBThShNvCY+h5BCgXLgXPzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YA42pR6Zo1v+xBqeuz+Ji+/wmoIjvqKuRcYzOeaiwjc=;
 b=vKl8DfMnjNgg+9y/D+G1FJKbBltV/j6D65jlxyuUzlpJ5AcQm9CiV7bXX8Q/pTQOxuF+8ZxhGPRAercwer+ld+TLZxooGF6FeJJD9Mfxlb9Z9rCdYoYAUiaoiOrtG3HhDpm+pnDkhUvB97BW/LiZSpc773+LFbFTG11vh0Z3oT+XNHFlrnZUSRdQ/VoRRnKCLkqWGYabGTPneABWsgYtgUuuAF2bTuSPg2DhO/kmehsdgQ+YtZCwD+/L4gxApRCwrso8oV2Nbeig6LYUu9+VzQV8ogeyLacbsifXa/K5tvSLe3msT/XmJzJiXoNHzopG8gSx/HHHeomhcnysquSNAw==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by CY8PR19MB7036.namprd19.prod.outlook.com (2603:10b6:930:58::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 16:30:30 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 16:30:30 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH 1/5] ASoC: aw88261: fix sign bit check in aw88261_dev_get_vcalk()
Date: Thu, 19 Nov 2026 17:30:12 +0100
Message-ID:
 <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00004E9D.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::454) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261119163016.30414-1-marco_giunta@outlook.it>
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
X-MS-Office365-Filtering-Correlation-Id: c943ec30-aafe-4cee-3f5a-08df465a6b71
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaUFyZuoDEdFOJ2LorLNmBnhLaJJS/je3RXsxhONhB0iNJy0NdL3ALNuQf4czBbnwDQBOKeIfo0SnMrOni8bu0AiEo1OfasJfgbA25idwAElvF0iNyTKhIviNu43mFscK+ZAiXTWIXTWAxxOpFH74kemKS4Ra2eJRZm+CxJZTiFDzOVk2KZFQxkIevRKXY1rZhxqvzOuJtoY3J5YS67zwVglc8m3e8eNAcrwhyYgh99/KCuogqHeZNS6WokXeU5ZKfcR3yNSgdZybDMyUud+v+FCI4sWyfhtKuoyEczBgihixuGM5/NXBV0cYcOtqxB72ZNUVDPrgBDZkc5bgjaILyJ3twLDoKvE6JFkEm9T9nvQf2TrbDYBMzfRty1FyN5xL6YkK+7fMGJelXZZvtlL1BsfpUvChmrIMJ2e6JGdv1YP3nOP4kt/qbFUUm70dU1kDZigItQ7JaDvfz9VnK1iQpIngNwxRzrNon+JDnNTf1e4eeec8fsgs4TdZy1vWTnb3ThrJW8P9qwxPTzY9Gdm+qMPDSDbz50VdfX0wU1WYEawmFWqTVgBT4jYw7tUAuO2iw8r8NfyH4QX0H+lY4vkU6Qi8aO8mRllnvphRHwMy2jecxBhnXGoHPuJTznwaqYabMVDhhSGggGH9uMA57UFnymsbSTXUQvf2NZcFOW4IA/TMNuA0AZGTgolZUmKHIVzl2MgISTtyzcUJo46CTy2Hw8yx8/0e80sQH3OsUdsaCoECM0GoZJmeYBqRW/+saGGYW
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|260925184616899003|25010399006|55001999006|8060799015|23021999003|51005399006|15080799012|24021099003|5062599005|19110799012|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QWEOmioQRvoH6VNtoO+ukWIK41ZpyaPV5M7xMyh8hK0q/ALcSssXWXTIFUzq?=
 =?us-ascii?Q?dK+GJm3acubIdY2jHmzEzTD4iBizbjS9ctGRXNtpy7S7AgnbHODJCcSB9eGL?=
 =?us-ascii?Q?3+bGQ4SobE4YIzaIXPveDscDPLf08sAVl1BuWQK30nIkp49mnI5v7qJ8eRRV?=
 =?us-ascii?Q?3or3+7yz7JqrlbN3gAzlAGK0WzI+Cx6qBP9c1NKtiX0b/pYNz4BsfzdUek2B?=
 =?us-ascii?Q?S2paEPx3pMLtp7xs4kTTqpnhpqjq3mK5suLfpQGgYQTebfQJNZV0+BQNyOh6?=
 =?us-ascii?Q?LvBI4wNC9FPEJ/01ZvCpbOXM+drXgb706FxLHmu4yBQvTtKQ/6H9sKXSyfgt?=
 =?us-ascii?Q?FOwQaoQi/ngEU60My4VkoNe60WWBnBn9jHhqk+FpkEv3qJlm3snA8sY2ErL1?=
 =?us-ascii?Q?jLrR2DDUbTe5VNlwjZusMAZxkWRhAALXiZ2SkIUNCDY9MIfr6X5skjOuefEG?=
 =?us-ascii?Q?zI+coXznU9ILwkZgGWWYD4AIOOucSnYF9ekcDdfdjYDENgXOVV7yz/cpSzKu?=
 =?us-ascii?Q?RGqWg4FuqQ9lfogpHIVsXEZKvTC7u7qyL9AkVaovQuAmgtQ/wUGFwCFsfmwt?=
 =?us-ascii?Q?tPcRVr6g8xm0usAjZipZsm5wY0A63qqVfnzpQSsDCwOopS6hMVXqw1wcQUlW?=
 =?us-ascii?Q?dDZ+zc+z4FEd3AUaTwPLq/OPtZy2vZR6WkvYAJwAVEAahWtC520du7pB4de7?=
 =?us-ascii?Q?XOiHpkwn4Uj3ZXV6UYPPTI1NDkn1f2p8EAf9AdE8mZRI+bllDvlJhQnCZlpa?=
 =?us-ascii?Q?oQMHykI0GpFlHln+qofp78Qx0PLuyxoaYBdXJaT1f9LtpH/Ah886GR/PR/u/?=
 =?us-ascii?Q?uTySVnUS04ZPQGFjIbQkHBZF6K3u0FV+UPokDDtpVAQ0adRI3mthoLXK0p2W?=
 =?us-ascii?Q?rzCQZUeEWmDWV8Ks0koT8ECKCi9sjnA9VO1OWaX6q/vVrMbpgrRY2Bsug9Ri?=
 =?us-ascii?Q?57ZluXhMTb/WYawYsld2PM9gUSfJvXg5yoqsVgmu4PcUcDVirHUJmTDOuvFE?=
 =?us-ascii?Q?BCcB/itqL1zPsuUVQPcvL6tFkw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5G+PhfSgzSc1MiEuq0l04CdJA631lH1Os5PpeH4XS06h1HuKN0RiDGkopJoV?=
 =?us-ascii?Q?+QlYoHfKyw2xM5TAcY05MF1jxrtPPwTAsCPvudJ25tacx10Eg4c4q1OEZcNp?=
 =?us-ascii?Q?vaLQ+1E8A8QrAzrFybqqW0EH/pyKmVQ+uGUNpf9uvAiMeZLZQt7+XNTkEUlB?=
 =?us-ascii?Q?ZcasAHWCLnTrC7sTwN6DtmUfRk3oADpLp7DIKETJZd229Qk8X9J1dyA8y3W7?=
 =?us-ascii?Q?ckPzz3hTpZIJ+4TMjzlS5CKEZEKbVu8Y6uXsMuHh5P59XSFg74iLVBYOV0ju?=
 =?us-ascii?Q?DAqRNIFcc4Ov+o6LY9DgL5BzZZiID+KX7VpAEDjVavrhXFK2K8wiHsf7R9CP?=
 =?us-ascii?Q?KS5oImXVmYHwzpuuGOQE72zmDq/5wsBTaAVH5jIB2SNzIZX5swbehJDCNfjo?=
 =?us-ascii?Q?G1ir5F+s5kwHx2xEMFvSgi1k9RD2MwSBaGWUfuuNhSI0X9SKtGhetzocAdwA?=
 =?us-ascii?Q?b34KAQ+icQhbNfTQItSPFE5nWsxaNPETTBpWnrWXYAPr+Yxiil4wtPGiOhDz?=
 =?us-ascii?Q?pVrs1Nd/5OHkFF3V8S/q4ZW4qiTEUp2hYhES7tGuFrZcKKSNxCzR+scspqVT?=
 =?us-ascii?Q?KKTwd8ew08FcnWVsQfG8T4LvPmlFU7GDfSB+BAMy7Pcu7iAxj+IJqkXd4KzS?=
 =?us-ascii?Q?xbYIwqQXndj6esMiO6dhZ/dfyFeXLw3k6B/+pYhhcIItsXXwwXRtYX02dYSm?=
 =?us-ascii?Q?92N8xmspf4KfzNQQhUSU+2lyAS066QFXV/HYOLrGUnenxuNJps5FeVHvPkpA?=
 =?us-ascii?Q?7JUwYFT/8dyOqkHK2xuw8TbJKdDWHccVbtNn+cJ36f8hl7l8OLh+mmkGRjnE?=
 =?us-ascii?Q?fK6GlyGgmk0cVOyaZHuKYkEDk9jDCPjn5UJZNLXCMZQFJ9Wg0TrVN1eOEBch?=
 =?us-ascii?Q?UUCu+IHdBjiN3nqUJNchWAjnveIOmtu0Pglmzi/EmSySEKgHO1gtK78fnuWr?=
 =?us-ascii?Q?LZGku3ZVHlDQ+6DWRdTEQxeuA67/dfd1U2QPwIVatpqCfxtB6FpVss1rMgkZ?=
 =?us-ascii?Q?yD1a0PBqNsSyeblRFYtcmuInt/qFS173hIacS6wdDwIxG4sKoPdz0Be6dV9G?=
 =?us-ascii?Q?gm04T+IngKmkl+gr0jTwBxPY00hPxGqoYMXsOZc6oMaqqA434h0SroXRfyzj?=
 =?us-ascii?Q?IEbqNvG92AZ4TpPZg0zMOfeF56ZZKylbFcMCmnV8cuwg3DemxMuOEtJeAody?=
 =?us-ascii?Q?kApjoYH7h3LZCawtzI2lCNAD9Tbv8+gNbv+KASZ6Yt+g7CBrSU/jNQb9yGqW?=
 =?us-ascii?Q?F0Djpf/b38RpWrrVZOlXWm1DUK6smzt3DABdMSONjaUhtRKKnuT1KKF/73jZ?=
 =?us-ascii?Q?m6Mn0k04bc4SpKYc0tuGBSbywYbHRy8gNbEqXbdHHl1ce0d+tkWjDucTZZal?=
 =?us-ascii?Q?KrzU6gsQYgbrWpSW4ORKixuDpERu?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c943ec30-aafe-4cee-3f5a-08df465a6b71
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:30:30.5701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7036

AW88261_EF_ISN_GESLP_SIGN_MASK and AW88261_EF_VSN_GESLP_SIGN_MASK are
defined with the usual Awinic inverted-mask convention, i.e. they both
equal ~BIT(9); therefore, their negations have to be used to test the
sign bit.

aw88261_dev_get_icalk() does this correctly:
	if (reg_icalk & (~AW88261_EF_ISN_GESLP_SIGN_MASK))

while aw88261_dev_get_vcalk() does not:
	if (reg_vcalk & AW88261_EF_VSN_GESLP_SIGN_MASK)

Add the missing negation to fix this. This ensures that the aw88261 driver
behaves like the vendor Android driver it was ported from (aw882xx), and
that it's consistent with the other upstream Awinic drivers that have
analogous functions, i.e. aw88166 and aw88395 (aw88399 has the same bug,
which is fixed in the next patch).

Fixes: 028a2ae25691 ("ASoC: codecs: Add aw88261 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
Hi everyone,
I'm currently working on an aw88399 patch series targeting some QOL fixes.

While working on this, I spotted some things needing fixes that I'm
sending separately now, as they are all relatively straightforward.

I checked whether the same bugs were present in other awinic drivers
and found a couple of matches, that are included in this series as
well.

Overall:

* patches 1 & 2 fix a missing bitmask inversion in aw88261 and aw88399;
* patches 3 & 4 fix an OR that should be an AND in aw88166 and aw88399;
* patch 5 fixes a forgotten rename from AW883XX to AW88399 in aw88399.

Best regards,
Marco

 sound/soc/codecs/aw88261.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index e14df93e67f7..d4db919d8a2d 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -306,7 +306,7 @@ static int aw88261_dev_get_vcalk(struct aw_device *aw_dev, int16_t *vcalk)
 
 	reg_vcalk = (reg_vcalk >> AW88261_VCALK_SHIFT) & (reg_vcalkl >> AW88261_VCALKL_SHIFT);
 
-	if (reg_vcalk & AW88261_EF_VSN_GESLP_SIGN_MASK)
+	if (reg_vcalk & (~AW88261_EF_VSN_GESLP_SIGN_MASK))
 		reg_vcalk = reg_vcalk | (~AW88261_EF_VSN_GESLP_NEG);
 	*vcalk = (int16_t)reg_vcalk;
 

base-commit: 20a21fd8ba1bb23c907ee5709f9232a9c84710a1
-- 
2.56.1

