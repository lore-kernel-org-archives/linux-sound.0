Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47905B1EB
	for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 02:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769566745; cv=fail; b=ONtJ8hk4XDPwIdzXGtTtGt6yOb1nFYRRzf7XlqGmOyS5kq1i+CUbEpsw1yaPec709mzyXafxWtSTueu7WIC9sbrpuwAKwXLFTpawTIXJFxKB1ZOhn+lLKouu12arG5qXAG4twktSxwfQ81TmGsNfyXHVpGWtvZGDcT9mJFlzP2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769566745; c=relaxed/simple;
	bh=snLT3xEtEQXZRaVji4vW2L6TioggNfp/dujIXLmuF3o=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=Hpndomf4MWQRqK0Cr4MDYfo9TaRUbzh9vFLVFhR4MENLc7F3vgAqeikrdiE7HzOm9nDeToJigiKp6QnW221UGA62VI3//bboqsbC4zr7uJAFFCM4e6Kb53l+h8TyNQvAVoM0q64NQdKNNSKyuHjMdEFB0ABP4nfCVMGXjpAhR3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CDJnbUGr; arc=fail smtp.client-ip=40.107.74.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CDJnbUGr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSyIeznDkFtMGmeBphKEevPJcg9o2FnPp5TrfZpR2SQSpWI51F1d8oDtguXkLAcU3JbX0kEu4HYl4+LjSjMwKsLQQi1kNzQLk6W3RBbyg1RtoEQ/4AZf1MbhWGaR15d2ByhB5XGLF9LpI7CbXt7DPH3/8GRe/Gc5mKg2l6ix1vVXCppQuv9/itxSnkXt2ejB53+r9d7KgThaDe+oPuUyvoJd2R/ZQ6dHw4CYLUtfsHKFS5QZIHyCvMTYuivckO0IzSepTNFMhMp/cjTBbz8oWs3l02GA/kqBSUCfwpmFZyf7pUZaMyM/5ykSH4rqMui3TycvT7tqDjTuT/WAGPLvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2TcWSSAXhyIaFbU37RjhgaCCNIHe0VmG4MMmidQgnA=;
 b=FYgc5m2/E5RgMQsJ2frO/S9XSxjAKwCxdfm0+sQl2k/F6YY8VJpuxjxMWbdHAalWv17iaAofAtaI8nbiJ9Q+hMQ4vfClr4r7VZfNq/BSAIwZ3IDiJiG7U54LaU2PVNfXrTOaAkRw02c7zAVB4TDFEM/kEsokJD9tIn64w13ekcnHUr/h5OAPcn9HlsDZUHiHKliZU9BLlVnKEY6pf70mLW7KzO5sZ1M5yOH9KnUDsmMoDYYNT2QC+1KyzWrpDvJtgkR8Z/MmX35+27sCJLoscVhVV/h/5rP0XB/LjITKEndTPZmKvb5+1pyEYHYq42dF1KFzZoD4i1Pwne5830S+bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2TcWSSAXhyIaFbU37RjhgaCCNIHe0VmG4MMmidQgnA=;
 b=CDJnbUGrD4OH9PvXdJorWjPgJ4oGkqBRqeW3kOx+oRkwKRKMSjg2Si+SC6BLOKJGtr/vCXwk8+sAHSQJijd9kAPeaaYGTydemRaMQ2kyMqIVGQH1eCa+F0qmD1/PSooc2U75xvsVWKp57GfU01qp3LQRh/KBQKm3SJnVd21VTKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OSZPR01MB8735.jpnprd01.prod.outlook.com (2603:1096:604:157::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 02:19:00 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 02:19:00 +0000
Message-ID: <87jyx21nu4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core: add lockdep_assert_held() at snd_soc_unregister_dai()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Jan 2026 02:19:00 +0000
X-ClientProxiedBy: TYCP286CA0337.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::15) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OSZPR01MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 397ca9d0-3c3a-431c-829d-08de5e13992c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nC0U46kCAraM8Vb+mDkfxVKf9DYlH8P3BgkgBN0Fw71FSArBs6VC65XeRL0C?=
 =?us-ascii?Q?/UxbNLim9LUwqU+CUnChNWCzsCSPt2+cNZHSbUf6g8cithH+9a82nu4W1XH2?=
 =?us-ascii?Q?DB1DhXyjTTqCj+GY6kWkxlhFL6KPUwUQWb8pXCKJ2AOz6RvI6y/YcWvuktuI?=
 =?us-ascii?Q?hooB9RFa+k0DUzUlAlcvLpwVcn7OYn0Pd17zTxy+04JstirHDYKp0GZXjTp1?=
 =?us-ascii?Q?MMsjUHth3KDfVAUcUAut/q3fdb2f7ZUOr0LICGgo1MIy0yZEsyknSCSAHtZO?=
 =?us-ascii?Q?nNW+Wm6julyXaeg0DspcNpLFjLhGkMZ9N91Z6StgAwsB//yBLwoX+riphls3?=
 =?us-ascii?Q?ms9IfaXfra2eSFhi9Zjk4/e8FIgwe+EY7sgKSDRKc/Wkc7VDlXKmlL26ex3A?=
 =?us-ascii?Q?/NXi0jAbJn8/oktUtmDl5bO1zOhzGo1YYkui/cFxZwgnxCtkMXq/p7v7da+K?=
 =?us-ascii?Q?qNzIb36r9sQlBCOyMtPIM5h8FnJHx2SCTppWghjuA8o+cel3ltQTb2o9GCVJ?=
 =?us-ascii?Q?n3Tke9YymY7RfQ5UbItVQNxM8uKoEMa3EQNRwqYw9ZGYAAUVu4Xt/spxBNkM?=
 =?us-ascii?Q?9bhd1kFnZUsIGuKFU07Ua0kkBjqlBg+gZvk/0x7ZOAiKTonVLCrVbl0OiagI?=
 =?us-ascii?Q?qK78XyUlWj4+0HrvfThVrK9rDapHRYM4t7rnKUsc4q0mHzPMt2GQnk7rgMcX?=
 =?us-ascii?Q?dh0yDvUkePmCJ/4N9cm+wn2XrAA4Wid5nmMDyVktcBW2UM3Dse4pq1FXRxVX?=
 =?us-ascii?Q?WbvxgoParhwQIPYSyKhswbUkMsLPf/hIFmxWFcTxZaeiJVisqB5IWcsIHuVw?=
 =?us-ascii?Q?9rZEbPt2mSHWPKadNlvthBzlPl0weFTa7lIzfzjMBwtaWtaScmQXG8qS2SQJ?=
 =?us-ascii?Q?jg5tcdj3cPzE5g2++mS0oprGoQeA5uqHlamDDJu7kFmqCBny9RUp3UHH8WAf?=
 =?us-ascii?Q?9vADf6mkuZreseRBiU5jARDV9CF75BHGLVMaDTyzrxbhaPo5K+ExNDqRLdd3?=
 =?us-ascii?Q?zLPmoAd1oQphECf4W0yk5leMPaOE9IBY1UQSV8Uh8I7kRw9G8eMc5w8yM+OP?=
 =?us-ascii?Q?cqYyWWFnRyUvnXFG0wscWWKVwyhASfI4YGDWiGfXzI1tTKBGVuzgdyateDS0?=
 =?us-ascii?Q?VMzU8/kZ2Tmh5TmOgwuKhhMMirYDSQlRKNhkwAfXJZsaKAVlRWpjMJQcKlTt?=
 =?us-ascii?Q?use3XgKH0ubXOVDNHiG7ZNWLl5A4p3q4Rq5NKXFjUkz9vxZvGV13vxkwrYYZ?=
 =?us-ascii?Q?mWBCp1iB32EbmUc2lEVfTzGGvF2j3f2GYvVBCkwmuk/8LbHXwRgdHEHV7LbR?=
 =?us-ascii?Q?URuTScciOQv/1TlG6g2KeNbgTopM67pVXf5riLLFbOGzxX2XyQfPlF371St1?=
 =?us-ascii?Q?XzsAgYmooqAi3oGhhgBYQUTHMJK6qtB1lnG5mUog7iEFCEei17bDFgwaZnWm?=
 =?us-ascii?Q?aT2Ym1ZjyZMkNWLDghmPki1UXtOxg0H+49tYXWo/QD/Yxiauv4zqZuWgp02a?=
 =?us-ascii?Q?UNMxtKuXioDFCJY50+irwB9XaGQW7HG0MfH1yO+NaFhkOPQbVuDPg19LMVyj?=
 =?us-ascii?Q?gn6O8Ti6Mh9F0XQfjS9oUpkqz1IFD4tnd5h4f9wVBBYGzXmsNJ6/SKTj5SxM?=
 =?us-ascii?Q?eI6oUN7kIyRJT72LiS4qtB4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+lz8jEXZgmODdVAXfd02/KWZ/o/n+d/TVzHuEYPTZGAe54Ks4zh7XICyaiUG?=
 =?us-ascii?Q?AQrCHalLBinWJJ1aMD6eq/mxlI67SLWe3vC718pmi83LNa1dg6sivnYjDPx6?=
 =?us-ascii?Q?nbRZv/1YBpKZGmJ9mzZd4FIe+XSZjnpskEWDO9rqefeZ6fQ+rj4AvP0PFHUl?=
 =?us-ascii?Q?uTuQZrLHMQWnzqG7XU08b3BPzTr/qg/7J0BASJZw6Ok/uVmG9lprHhMYbnTY?=
 =?us-ascii?Q?+Fr+DtV3QSryRjLwxC/3Ieof4giC/yAOrPf335/eyY6H0kbbGKIZx0yC8JkN?=
 =?us-ascii?Q?FAgzhlUyD05jifcbEfMsaHMVwj+opVZQjIvQzyk3alsK0aeB8+q1lbTxOgWk?=
 =?us-ascii?Q?QtQmvpyc/Pf2yTJ9DGq3LNAKcNz9vhK2pG9/RWrrYnYTB7o2XeS3Sp4S/chd?=
 =?us-ascii?Q?nAH745zMmQ9pxNeG2gKO8E6yHFTC0Iapl50QEEojjB3M+0EdQKLsyZud9Tx0?=
 =?us-ascii?Q?aEwVibkXHJlfO3yho5G3TzKzEfZdXc5wkso3brl22Myy0DFZMSYo96i2xgXw?=
 =?us-ascii?Q?cBMI86PG2EU4H1/4PyDsM78TvqAUrzCNERYE9bf1jLx1y4bycMTB5mnQHreU?=
 =?us-ascii?Q?SkxX4aBH8M49mfWAv+zjih0gOgZVN1tzoM3crk9A3BGzvwHwP0xTIXIaKmap?=
 =?us-ascii?Q?oq1hCc7Dm/PzBBP8hLV0fTJQNYwxwVyg2IDhbaPW62Q7bNdKep1bemmtqNzY?=
 =?us-ascii?Q?4JcqKniVKEioyOwoo4TguAKWbEbMT/o7Eoi0fcZ+mmv8Dbp7pzP5ceiFT6rK?=
 =?us-ascii?Q?Vhmzhuv+ZULaF3TC6My11u/ehhAE5T3F+bH0JA9ud73bA/IfzBzIXS4Znc4C?=
 =?us-ascii?Q?rjIiRnlJ1AtsDuKG0ZCgmdZLy7TTPnmR1OToKWvMdEp4LPZHZyX3jaAmkPpP?=
 =?us-ascii?Q?iiyTYP/Hj0Crxl01zljhB4jI/riguZT7X2Kg2NqXo9hmu7pOgbHEFuY9ZcMN?=
 =?us-ascii?Q?nJWScfxvQeZmoDGmV4YQ/YO/TWyv0bER4NuD+HjeqXUIQNgyrjthkI/pqpbb?=
 =?us-ascii?Q?4zEUz9jKHwZ186RPLQBkOvOeDEYWgJrdusuPCjsTXUISBJr4CEMj0P9cggDg?=
 =?us-ascii?Q?5VL+/9ZsRpQNumujNfhMgWbomVxHux4qI11uxytB3YaBgKJP0KxoI58T/pgP?=
 =?us-ascii?Q?9HNDYflZS9ljpY96hb2V3sAZA5mUYwRxIBIt4N3qW6gJ3lPCljsPo9DvhMNY?=
 =?us-ascii?Q?dsc03TRp9Ttx0zIsl0g2pXwheHHWW3TCkmgsuU+9graE9SWko78gG2c6q34A?=
 =?us-ascii?Q?ziD4ahMom922yfGvGaCxG6NZ+jGLRY0zrW1ixZTj9nDGmo35FIzEP4Zl4V/X?=
 =?us-ascii?Q?PlqPNz3ar9FgIJTPiy8sD6Nje4DSDm85F9gU+5ddiweN3bi+ZrqFNAdixPeQ?=
 =?us-ascii?Q?HEKOruO8gknGPa8gM/XfHF2DssMhPYvZKL1E4zE1oe/Lnjf3kGNWcMtA0oYZ?=
 =?us-ascii?Q?WGG9ie46bTeqtsakEfUNtlGVR3Qq+JfQsxt8nBfLzQYuE/aqjRbbRKFPs/Zl?=
 =?us-ascii?Q?DKwACT5JWrtRUltkL/5Q8PnyTJXupScZurufI7oh8yEr9rfzir5t9xc1S2g1?=
 =?us-ascii?Q?GtiQoOvCgVq8VG906wrvE6IiQg2yocmmxMPf09d+3o9JdAT2p+vsRfPWMLnY?=
 =?us-ascii?Q?7JC+c3Qj5NqLcbuMcGnLb4sp3tD74zdt9A9XWUOYd1Iuk5gQfawQRt0fw4xd?=
 =?us-ascii?Q?wptk5LmpFgsE1F/b7XpJDfLDyceEEnjpWdE9FPGzlfNFaEiJ3l7lba7RIuuc?=
 =?us-ascii?Q?R1zwR2r7Mhtt7ih2TChos0z81Nq72NQyDJYvfk7QawfaUuP/+iNv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397ca9d0-3c3a-431c-829d-08de5e13992c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:19:00.1243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFzXogRQyCoGzh8Cm10Gp4dcSZvBG35OylDCSTOeB42XAIr4JpYmgTpZFlHXL0N6/uukkIAEpxmGDVRvIDOa7dNLqy2myTKrVMKoZPp/NtuCyEMqpKlw5cPGzZJWErlS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8735

snd_soc_register_dai()           has  lockdep_assert_held() (A), but
snd_soc_unregister_dai() doesn't have lockdep_assert_held() (B).

	void snd_soc_unregister_dai(...)
	{
(B)		dev_dbg(...);
		list_del(...);
	}

	struct snd_soc_dai *snd_soc_register_dai(...)
	{
		...
(A)		lockdep_assert_held(&client_mutex);
		...
	}

Both functions should be called with client_mutex lock.
Add missing lockdep_assert_held() at snd_soc_unregister_dai().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Mark

In my check, it is called under client_mutex lock, so this patch has no
problem/issue. And my board test was OK. But needs doble check.

 sound/soc/soc-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 498a6e86f9f6a..2789711ac8cd5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2402,6 +2402,8 @@ static inline char *fmt_multiple_name(struct device *dev,
 
 void snd_soc_unregister_dai(struct snd_soc_dai *dai)
 {
+	lockdep_assert_held(&client_mutex);
+
 	dev_dbg(dai->dev, "ASoC: Unregistered DAI '%s'\n", dai->name);
 	list_del(&dai->list);
 }
-- 
2.43.0

