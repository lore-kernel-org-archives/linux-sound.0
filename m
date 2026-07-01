Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011013.outbound.protection.outlook.com [52.103.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22770349B15;
	Wed,  1 Jul 2026 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917815; cv=fail; b=qUdkZlJtkbTG468sXY78+1pBBRwYZ3+0vPmOq7uTfoyN46CsVmlBSwT7rt+HJ7xqA3ceTAIYvpHQLmJHkRR/e/vq+KE7oP51RoB0Ubioc1SkTL8MJV9dd+7EbuRgmmLbGl6NMAJDREGXdlDHyubGhu68LJKL9XO5IX1RIpfOErw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917815; c=relaxed/simple;
	bh=gWy1q2O6d2/95z7dm8WqVdMfh2ya7JBQghHbH2bth7E=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FhjWXqfXifV0o4vcaibVE6jWovmaCSb1QJsyFMwnRcNFr90UQzWyCbeyZbX9BeFcO2/BeXRzkgZjBNpfRMJ3kArYi7VE7TXmcWDexmuNWRPAjrCy+NlxtN5ifOnmpDpoCspTxWtwo0eP6HGL2ASTmk+nFXL5EiTewYFTWNJk0aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=FyiFh0Bi; arc=fail smtp.client-ip=52.103.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="FyiFh0Bi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdXKeNnvSVvEDZKd58sLHWA2TckOoBqIrrcI6Y9i87/nG4wZ9lg+/ZCxvE1sKxAvKUY+qm+lLDH1C1MvVvEU+EJtfIED4n673ihgtCBk3bMvbf6xFDI2EXwcgYJS9try+1/0XpYeyBLWhEAtXmjHtgLJveh/zRA7qr2ABxxPDUq7lPO5y5wNanVDMKx97h9PAhE0UOb2sMw7BchcoSYiBxZ+FNGpso1He0MwR+Q48bCZVj+aOW3F36IzOWCqjZROpDeQ3DdX1xWgBP4dLfPEwQwCfIzdueanupeD9mBZO+ah4E+BUgYVrjQFyesfiMc5ZOrKXyuGQgtFw236vBLqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ/+YO5qyKHEUDM1u7Wj1A5En0eB1fcfDGy9AsQVGUY=;
 b=nT+/+81DFNmq4AMaYxdmkdOUU7+ZQDXXNFDztvbGWg+Fl0qMFEvzlGR0036vscrbdic2SJgwDLyBJO7ZjyY5ubUcu2GOf458gX/CIOLH2zbVlk2Aa7j1Ff1Kic+0tvwlVT0IppxCQxhcHXJR9aaEpTx0aTY0UAZYkwjRwbycLy1tSxg0Y/mzVtP9lMDfr5JOKYn5HkefrhE2l2bVvMcReUZJU140sH+53D20JyV91LD6qNk3DPAPIm3G0BGCyqzKnwoE5pjYngt4hCo+9damr71TVnmHdDHpdmjOOdY9kSvmlawSkRfZ7a/gQsiFbsIQ6OqcdB+XTzZJSsT+JHv9gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ/+YO5qyKHEUDM1u7Wj1A5En0eB1fcfDGy9AsQVGUY=;
 b=FyiFh0Bitz+uTccBHeSfOjlOGsIOqR0rkJZwM5FnwvghzMGFiVptL+BRUkDwjDzUFGsxov3QpokSo4FEcFX6lffnr0J3JmM3uwToUUWU6fLqYEWFEnB8M1CW6PFPKmzP/2+TrnUSDHQy7e4Aq6dlidUjHugJ9/oKVujK4Lmy8XSGT7fEwBwFSeijdpYNJpXjJdrlw2OZOFjyWlmBXj1hbCZMnzKkwibhImoqWjXl4YP1Bg+Lte/3PPpm0YX0Wry6fMtvWHwMRcubK+trUtb3CcuigBjuSOtShQz33+RJYOg+yBKAkECDjyORB7zPxsu9xIbYP0nAmEPM9ccMFE6NHQ==
Received: from TYWPR01MB8728.jpnprd01.prod.outlook.com (2603:1096:400:16d::5)
 by OS7PR01MB18069.jpnprd01.prod.outlook.com (2603:1096:604:4c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 14:56:51 +0000
Received: from TYWPR01MB8728.jpnprd01.prod.outlook.com
 ([fe80::8cb1:624f:bd48:e92a]) by TYWPR01MB8728.jpnprd01.prod.outlook.com
 ([fe80::8cb1:624f:bd48:e92a%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 14:56:50 +0000
From: Tianze Shao <shaotianze@outlook.com>
To: linux-sound@vger.kernel.org
Cc: Shuming Fan <shumingf@realtek.com>,
	Tianze Shao <shaotianze@outlook.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rt712-sdca: reset codec at io_init to fix silent headphone
Date: Wed,  1 Jul 2026 16:56:06 +0200
Message-ID:
 <TYCPR01MB872223CB999D2099A5E0F58DC4F62@TYCPR01MB8722.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CWXP123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:73::31) To TYCPR01MB8722.jpnprd01.prod.outlook.com
 (2603:1096:400:18e::7)
X-Microsoft-Original-Message-ID:
 <20260701145606.49647-1-shaotianze@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB8728:EE_|OS7PR01MB18069:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e7a079-10b9-4900-1328-08ded780f9dc
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|21061999006|22141099003|4140399003|25010399006|39105399006|5072599009|5062599005|15080799012|23021999003|24021099003|25031999004|440099028|3412199025|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MOMJ5UMJCTwVyppJtSHgx+HHngvdDx5xijJIekQk58aWSGDDtluEG9mJI8oh?=
 =?us-ascii?Q?Xe3xVHOz3lDDarL6mUn1aIp8GA+a0RyG5mYkqglH2xBjln62fiStN2/8cWOE?=
 =?us-ascii?Q?qbEjxTd3pWRRFYUxkUzh29HjviBOCwtbs/p6kylfQhb7qVMnMggjIOT0x9Hv?=
 =?us-ascii?Q?jCGNMtElPXmkdTp8psDWqG4hxqbrCjC9/lgFktTWUBJIgOZumMXOi3FjN+cb?=
 =?us-ascii?Q?yPl1U6K5ItgjBvFLY242EF2VicLteI+ah1jKUo7jMYoXBT0cIvZlKMET6Ept?=
 =?us-ascii?Q?hhLc6BIleYWN5V9HghRlHRs4OFtk++SWlttXCqLQQUwrSQkHLYkBGxsmVthv?=
 =?us-ascii?Q?iuUUfjXwo/3XSMyuOOveflgy8aQaKzyXjAMFHEqvDCWKRRgcljEQ18X1YRBI?=
 =?us-ascii?Q?j+MN+o2fNDXVjeqqumgf7BQ1v19nGdPWtGBxvdwraIB4J6KpRCPb9GHkJJ1z?=
 =?us-ascii?Q?cclGeYZk4INZZWhqwnJ+FFkyiSnEgAfhPw029V7LNTcfoj7wgx+vaNPsSGUM?=
 =?us-ascii?Q?oHI40UbINW8unyyZjs/hN2G/sWmc3nHBVAF5ehxbZK0sz/Ejhvo/Tf6BHN1o?=
 =?us-ascii?Q?PzLyfb/56PcPa4jcXb80H1guW98AqxfQSa1ujdCnnBMhtTLr9VrTAQSy3ajX?=
 =?us-ascii?Q?IA5PumBjd5bOI/q+P84iqJTTOSpLJl9SAy7aIQundgdwcvE8KJR5UZnizhmo?=
 =?us-ascii?Q?+kRETBrznFeVxm3QKRFBl+ixizuAy2bpewPzLUrmnHPq5pg9368Gx/sH+Tsf?=
 =?us-ascii?Q?3y3CwHelzNVN8sLuZ4wkhPz0OoliboPHBBjRc5/QHR+mo3d8T2naHRqz0OuC?=
 =?us-ascii?Q?03txS9XRlep++1KpDqj3v1dFyr5eUAaA03QgU/XrDuURi/OXsMfu6DfA6yyS?=
 =?us-ascii?Q?lnN8K9f3ab2ArDfJ/PPCLcsZB5wqwBsrmdd9Q5gjm6JY5m+oxR9RRDf/Nux/?=
 =?us-ascii?Q?9BU1Nk5i45/Mw5G1/b2NyvnEAaZCtDx32WOPYsrUeYtxVC2jlOe8ERn/xmVQ?=
 =?us-ascii?Q?hHd0LSw3NXgaF7VomRV+eiwKKRripRlBNW9lVscvM4qVpw61YxHN7sXkRO1S?=
 =?us-ascii?Q?XeUx4lNWVpLkaTDYIZl+H4kexXZ69g=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NPAh/Bd+ww1NcCB3BmV+RpkB0jyGjYm6SHTPYc6UxbcgPzHqenmcRulQia+c?=
 =?us-ascii?Q?kmCqvXfJG6bUb/5KTTgo+d1ljMC4AbnIe1+hMK92fXJGDvxYPBeKWSB7BQEC?=
 =?us-ascii?Q?h5evEygAp6snpuXFdP4rlmvs5IjfhgB61QT2JJg6dGjtHYNFenN81ZsHCQxj?=
 =?us-ascii?Q?W5KPcI66072/ltS49YPvSTmI1EF/YOYWLq5cQvg3ZWTM+c5GhqXt0KaTdZyQ?=
 =?us-ascii?Q?c4O2PIHelIMQ0C27jew8GUlgtym9xy9b7PJDPNr1duEs9BsUc5Ljry/+9pOa?=
 =?us-ascii?Q?+sRdDg2CGkLYVO7CHeC9j5jHcLe+uVkV/dRXu/DoylV3kmpFkIjmq2+I1Nlw?=
 =?us-ascii?Q?o0IF1wst+VtUKusmYKdx7csetL5hUDDcMy7R7xIZZ7WEA+5EqGjPmVTN9LrJ?=
 =?us-ascii?Q?Cqk3H9j2v/+9/3VCerLssWq5p6rhl4xzQOA1QzQzribkKK+XcVd3ALy2dy/g?=
 =?us-ascii?Q?TZXLQWvr+wyMOo9zfn4ycc+4/7geIym1O6LTYRKP8+nwTjn/EwE1bJ8esx4S?=
 =?us-ascii?Q?iFSl3kfEz2Pp7afKtOQltpBQVTueZ04dXp0WGajtpnnhTK/s6Qaw2z7FQjl9?=
 =?us-ascii?Q?1ExNUCH72HmksJSAKxsuHm+1Mf9S92m3H15TulNYLbP0xdL1ozxvTmopnKl0?=
 =?us-ascii?Q?uVtZHZR16NCRwPh0EHMzAFZ8J0MOQ6xeMC8eQt/b7j7oVmjQ6/1VaV77j2Ga?=
 =?us-ascii?Q?O6bkMR5mEViVp0OjeIqU8fzFndf059eRSIpw7w/XhKgbhUXO01NMK0NmXQ9f?=
 =?us-ascii?Q?lHDp15KC62UNLtIKHwS2OnxuLbdrIYMeiUXqCkwYfnHow7wk576MSZ3gzzIp?=
 =?us-ascii?Q?kHZM/4xN5Fr3BvPE3I8SO6IcxNveG4UIWWlepZjpXgobWiGQSHHsPv3bB0eM?=
 =?us-ascii?Q?swVX0hCO/7CODZTkGkL5ZVC5DDwBVA83vC9Cvsc/l+KUX4vg10oUX/CIhgqX?=
 =?us-ascii?Q?XduV/oqQ9TzzCYHWIyCo3neNJsIuJSY4r/HQ45fFVF3IakNhw5HPNSFpRtBL?=
 =?us-ascii?Q?eawBOh0TeH/rp1ZagMGgLZmhSnt3Le7XonU1sI9cjIJz6vlEFx4e1Fz/2r4f?=
 =?us-ascii?Q?vzBl5jhblN7kGW14huWSo/kjPPksWBTXFhObLDrmz+ByCf/82g3Bi1wuEoCl?=
 =?us-ascii?Q?EchCkjoz2/9HgP7lIvKLu3noSZXzSHKxwMfQY6O5aQwKLEXzMddXcUHRoHtm?=
 =?us-ascii?Q?DAqygYylDzzCR9HmxxVWTgbmPy/5YylrPVYgFOi55yGN29A2T7YvDWNGbuOE?=
 =?us-ascii?Q?wXdIkvkCSi4WY9+iW/xwE9TkZu/+WpR0XL8cHYWlQGVA3r/lgmZ9YwCUyb62?=
 =?us-ascii?Q?sudYVzr/sbgRSL7QvCy9YU87UeaHeFa+i8GvYmTG0feiy2FSkAgezT7YAgiF?=
 =?us-ascii?Q?gSHNXiBt+C4vZFJwAgRVj0DQv62BS5xdvBm6Vbc3ZXSE8CQRT3I30IJzLJUC?=
 =?us-ascii?Q?EZnx5HZB/KGnWzpX4y4HFv/Dmqz3LwOa?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e7a079-10b9-4900-1328-08ded780f9dc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8722.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 14:56:50.9035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB18069

On ThinkPad X1 Carbon Gen 13 (Lunar Lake, RT712-SDCA version VA) the
3.5mm headphone jack is silent after rebooting from Windows.
rt712_sdca_va_io_init() gates rt712_sdca_calibration() on the persisted
vendor SW_CONFIG1 flag, and io_init writes SW_CONFIG1=1 at the end
regardless of whether the calibration succeeded. Across a warm reboot
the codec keeps power, so SW_CONFIG1 stays unchanged, the calibration
may be skipped, and the retained state can be invalid, leaving the
headphone amp disabled.

This patch mimics the reset sequence in rt711-sdca.c, it adds an
rt712_sdca_reset() helper, and calls it from io_init so the codec is
reset before initialization. RT712_PARA_VERB_CTL,
RT712_HIDDEN_REG_SW_RESET and RT712_HDA_LEGACY_RESET_CTL are already
defined but were unused. The reset clears SW_CONFIG1 and the analog
state so rt712_sdca_calibration() runs from a clean state and
completes.

Problem reproducible: boot Windows (headphone is good) -> reboot
to Linux (silent).
The reproducibility may depend on Windows' behaviour.

Signed-off-by: Tianze Shao <shaotianze@outlook.com>
---
 sound/soc/codecs/rt712-sdca.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 4796fce084ff..d6353af07380 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -1843,6 +1843,15 @@ static void rt712_sdca_vb_io_init(struct rt712_sdca_priv *rt712)
 	}
 }
 
+static void rt712_sdca_reset(struct rt712_sdca_priv *rt712)
+{
+	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_REG,
+		RT712_PARA_VERB_CTL, RT712_HIDDEN_REG_SW_RESET,
+		RT712_HIDDEN_REG_SW_RESET);
+	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_LEGACY_RESET_CTL, 0x1, 0x1);
+}
+
 int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
@@ -1870,6 +1879,8 @@ int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_get_noresume(&slave->dev);
 
+	rt712_sdca_reset(rt712);
+
 	rt712_sdca_index_read(rt712, RT712_VENDOR_REG, RT712_JD_PRODUCT_NUM, &val);
 	rt712->hw_id = (val & 0xf000) >> 12;
 	rt712->version_id = (val & 0x0f00) >> 8;

base-commit: 665159e246749578d4e4bfe106ee3b74edcdab18
-- 
2.53.0

