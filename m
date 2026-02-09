Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010022.outbound.protection.outlook.com [52.103.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29F61B4138;
	Mon,  9 Feb 2026 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631468; cv=fail; b=qOVpLDNS5PoVSGqUMLTEWmuoD/1LKZh23hHxFzWNPfjqzLJSk8KUoTYZB+M2/BqCqPh99UoYVRc8RKFppcmyco8z7TVgW4H7rb65WiSnZntVk4U0StAynNylZK2/mpIQULa+L3r2krjT7xIjtq1DQhGDdrjPYTJ9N53ZIn9c8Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631468; c=relaxed/simple;
	bh=6prYtV0KI/DscAddeQ97Gi5ulV7r09FSDcrm3w5fHRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q0Pc+Rlne6GYlUxxC6J1HVGPL2IXQDclQ/apFCN00Xj1VQthJQLgoPCw7fC2OdJhPEsiaJc0o6+wzch7E5fvoo5sX2rtbAQQau2EashP1ohx0C86hfJa1svd4n95MnmEN6fEeF30prpBb5qLhhthuNvkit1uHGWSzHdZGzW/8rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VUdYisxf; arc=fail smtp.client-ip=52.103.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VUdYisxf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQEH0Mo/vyZOJEsK1sQx9+bPKV6I4HMOku2hs7GVpXpkYc1oH42GazlbZnQywveqUoifK/c1oxLFUAF32PQj9r/6TA6I8GPaNRZgaRdQ8v7zd6Y9TpRFM8l+0YiFpKaNCH4iGNjchnM8CmdOq+KMF0+un6+2wKypOQlqSjz6cyHqxQ/hQC7T8GfOtvvYj+bYOcX1PuKr2y3E6CxIlJO1sFTTPTF5OSG6bjo2RE+qmBc52Atuuh1E2ujO3umOB8twi6x2x96mJGWH3kx0LaSbCqwK5n7nSACFixML/miq40do2rQQ3n5AFJ7HnHjPl1y5vc7I0K2lhO+lltosefVR5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezOoSCCrH93uhXMhVQBLh5OQOShxt6Wy1Qu3bZZKkvs=;
 b=k0nCman55Eat6ghjQb0PSR3RXBF8Fv0PSiEEIc4RI/yUoajXRwa2Qz9AtkieCzj3q0Nv0mZkbfG2vV4xpUZerjWrA/egtI0TGYENNzvcHAcij4OEPnSVYTzw2KbsYZDPdr7I4fPHnUxhkZu6xObr5ySGS6ytel3r0shfUFOtRAj67NvAFiW6V1YjaBD+Tpg8jO1+Ccaf5YpIkV1E2Kg74TahUS6xxBvVvFJqDFK1oaWRtmtBIB4sDjKlddB7RHhfbT+qV5pYSVB3tfaAJIw6ANImWcbcmcvEKp4gAJnHdLDHbnFoHawcUBUkBKu3BxSb4Biv8nHTGDg6FqEXzypxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezOoSCCrH93uhXMhVQBLh5OQOShxt6Wy1Qu3bZZKkvs=;
 b=VUdYisxf1duyQpgH6hfvNNOTH8zwkSxf/Tz95O3DAzqToPqvxf8dYCwYeTr8DQqnM9+k0ZiQJcw28LebsnU0ix7m5XOvKRwcl/PZf6XjTwGOXbNepWQqzJUqljW3NTbj6Otx+20te9GKjba8x3kE45fSp7itIZv3J1oUQWGG5Ak1fQo24ZHJL2cEEqCvF8re9+qYpB3tgfmJgT8pjAu+D1Hb68SRf1Lc2ism7rqz2JTd8Xyjn/Ai59TlAZxyuUW7HQTGKuvdhcHl3cqMCDKCMHjMyQZXrV8eb/lp+xzSq1GXVfrTk0GhvQeiNDTZsIRDtS8zyfGluAHpshgD8YeEvA==
Received: from TYYPR01MB14098.jpnprd01.prod.outlook.com (2603:1096:405:212::7)
 by TY7PR01MB15036.jpnprd01.prod.outlook.com (2603:1096:405:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 10:04:25 +0000
Received: from TYYPR01MB14098.jpnprd01.prod.outlook.com
 ([fe80::5a23:52e1:8e19:2748]) by TYYPR01MB14098.jpnprd01.prod.outlook.com
 ([fe80::5a23:52e1:8e19:2748%3]) with mapi id 15.20.9587.016; Mon, 9 Feb 2026
 10:04:25 +0000
From: Qihang Guo <v-conet@outlook.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	V-Conet <v-conet@outlook.com>
Subject: [PATCH v2] ALSA: usb-audio: Add DSD support for iBasso DC04U
Date: Mon,  9 Feb 2026 18:04:18 +0800
Message-ID:
 <TYYPR01MB14098529E0BD900921BE6F42CF465A@TYYPR01MB14098.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <TYYPR01MB140982EB52459BA89009AED3BF465A@TYYPR01MB14098.jpnprd01.prod.outlook.com>
References: <TYYPR01MB140982EB52459BA89009AED3BF465A@TYYPR01MB14098.jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::11) To TYYPR01MB14098.jpnprd01.prod.outlook.com
 (2603:1096:405:212::7)
X-Microsoft-Original-Message-ID: <20260209100418.210757-1-v-conet@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14098:EE_|TY7PR01MB15036:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d331e14-f426-4436-59dc-08de67c29a8e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|461199028|5072599009|19110799012|8060799015|51005399006|23021999003|3412199025|440099028|40105399003|19061999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x2DykfEp4QL5xkHUVE2HbmtRgk/H8VF9h8MEegJZd/LECnpOwgcO1EbirRGq?=
 =?us-ascii?Q?dHZjCGFr3eoKhYMomb9AA7Chu7HxlIRmhTIZBmhM1xdh62fVAvtUxA7lRTBQ?=
 =?us-ascii?Q?fuZHZe4rJzHQWXLyzHZnb5bj7ov1Gq7zStgmr5F8CwuJR8DrMmdF/t0i3w9C?=
 =?us-ascii?Q?hQLXkkvSHdUNpEs/FfcTaHCFYxhnPhb84X0YnQWGRFB2bsxaEAehjjZh6eEY?=
 =?us-ascii?Q?dhsaZEwgvwchFxuRw6JQis9wqimBNOQJVIRGmLHSmVMgzO6bYYoEatOiCqTS?=
 =?us-ascii?Q?OzwdkBv6Ik4B21uLo/YADsF6vYYAUBnAeQMi9atUCkNfcCj1iLAGGr0n8mM3?=
 =?us-ascii?Q?Yyh8fMbgf1OG8O2okK8nTVoxnj9YUKW1+iCBwGxapiI1daj2aPimI4IqHS3F?=
 =?us-ascii?Q?N6Q9mHXzJJMDumLK1AxbA1eYfdjNkAVQdOke0iq3QkrIphw3CdzlBMJu86Ps?=
 =?us-ascii?Q?yAeA/zHS9K9TA+UWRBUSAN91m5fr1onWiTlM78AgPUmf8XfAkR3DSMzUpASG?=
 =?us-ascii?Q?aX62Xn4jRvaKnrFXyWI8pkdIF4uOVsUzMeFLsCoO8WvSg6DKTagHzas5Awtl?=
 =?us-ascii?Q?mestD2hT/7kTk8My2xLxyehyHvizBcCBCR3TIra8zwuSF46fQnZD0n3bahmc?=
 =?us-ascii?Q?OZVn58eWhHjuBLbSXVdJdavW9h46wu1Bt58Uq28nc91jGdmo1mbx5jdBTbIL?=
 =?us-ascii?Q?2GOkhzXfJX7yVT8GaCYxC269AninJyXgNclOj19yeOJzexcsVTbLb+2uIYIY?=
 =?us-ascii?Q?1b6TlUJ4TaCsGMztyyhASj+c2SOo28+CcNQLWQyZMSAZRKI+PDPpTtBlrSBt?=
 =?us-ascii?Q?DQS5CYb0DSLVDC2MqYqgyFIIX8hLYMGcrIBnTF6BfsSFwMcK1HFsF9oO4MPf?=
 =?us-ascii?Q?Z9QLk/CK6ezfdn4jP7SczEpZaSq0clFAwonylEuG58zK8f4/nBGC6QafwrpJ?=
 =?us-ascii?Q?v53i8tWGSzPybheRVoVQcFMw/z9TykXCCjJNMfn9+8LNEeDkIcmelJ7J1qrq?=
 =?us-ascii?Q?G34TBMAZSuMRfOL7rWulU0IYjXXL2oR7iKf++c063oboR5dmEY3eZE/Gxj3J?=
 =?us-ascii?Q?uwShuS0Obh4/vI1fK85cFZzRevqiShgwnJDsv1sncuQsjvGN2dqCnUOjJzjD?=
 =?us-ascii?Q?+EzlLU8hT8n4Oc68Mar9tlaAL06SRplnsBPTdS2d+zfOKOkTLfQiCHs+naj2?=
 =?us-ascii?Q?OCt2pouN+uQKsgx4MF3Uu5QNFHAkwSVlhR7WzSDpjW/I17jSjfBlKoEVmD0?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ikPrJ5Ucuq36Ddbbd7D+dMDnPfG4VTWmD6TAAPqb2UwIswrrqu4bRMo9f+YI?=
 =?us-ascii?Q?Owf31MvGqxTsJ8o5+M7QPYQleve2pCrXP8rYkf/Q83z3bBemGLi8w9XJ6DTF?=
 =?us-ascii?Q?KmHCWZihu6NP5GHRPS/verzP60qLorE4JMiwe6TDcH32Mz2Z52Yhmn5ACMAs?=
 =?us-ascii?Q?h2POZ67zCXHZ0by7iUmoRQwIiaKr5ypLBXspKlbrsXu2rikpOn987deDu7eK?=
 =?us-ascii?Q?ESuTYlgXhMOmM/XpFDr0HDAKkz9wVOulcwH9Vi+sOiOcbCANEdnJj/jcJNOU?=
 =?us-ascii?Q?+HSwY9Yz9365jTrDBw9JZrHr1Vmv3Ij6lupSklqrQ3qkZuIXgeTqNcRTAHMy?=
 =?us-ascii?Q?LhU8o5GpFBg6f0hPRhiPMWHfbZS+YdcdeaN/hrs3Q6XxccEw4UeNPkYmZaTT?=
 =?us-ascii?Q?9cyoNSh+Al6aCh3MKOtOkfhUzJwf8NaHoppCRWjeh2A6wXGsKWQ4t4nXISUZ?=
 =?us-ascii?Q?Et7+UMzDL5Ty16JK4VoIM9oXxdY9d8LBaaA2mmZE22Ovv9JHQVJmWsW346p2?=
 =?us-ascii?Q?ULGWVKVOpS6AxafYJV6h9DFWyeFkbwnUk9KKy8zBacpqERSAKBkEDqSqllzH?=
 =?us-ascii?Q?E/C9FBAeGcSCtQOK+I4GAsVf6E71ZQMzTDxwhOMnYGJj/ju5l0UHLGgNqsx6?=
 =?us-ascii?Q?eR5neGYUy3in+ZcY8EaCPTzNqhVM5VUHwFKDLYOBA9WpmbotCEHS7Jc3dlYz?=
 =?us-ascii?Q?QcxAxPSp5KYv2UzlgcOHBhJZ7nt/CehqWAWMbzFL1q7M6X2kD2iXgWjZuI0v?=
 =?us-ascii?Q?TriyZLnkPbjM5STECDsXWeKA7kXl0+UhDFI9G0ghQFgqVji7o/xvGfjDcRRe?=
 =?us-ascii?Q?mE4bLYeWZzqn1xblT/tFZvh53n7FWotTJ7SrH+K+4WeDVPGY/WkFba7BizFn?=
 =?us-ascii?Q?Wy8KyTnK0U8KneTenobXM77ejYZTgdTk/svp0Fnc7rZxDnzyH2zIh5QHvBc1?=
 =?us-ascii?Q?GsBKMlCA2tXnDzhnPtm6oJGM0qycegqFVw5X8mCMDbEz+ABjXoNWh1cJUQuC?=
 =?us-ascii?Q?NXLtQWkZjt+ouhdERjX+5O5Vs0CLrUXnlmI6m0hTEnCnKh5paBhJGlI7smjb?=
 =?us-ascii?Q?ksOubkvg4ce/U0MtuIrGVusnJCaaDzNdVISdBSkkniLI37u5Y4uq2Xuwo2EK?=
 =?us-ascii?Q?9vP2T0tOnWDSSuV72UA2NpaMw/8YUrEe2GdfZerjbA5mphghZSEJLIavcgra?=
 =?us-ascii?Q?XUZamNI0+W7KjO7bpZReWVXibkUFHhheeLlTWHWqDdQF+hxalglwIVSHtKpj?=
 =?us-ascii?Q?OpNm9C3gZl/fyixDDrP2rBgNdXI7FcWoOLbHslbUVGFDmt1P8Z55t7sD3prN?=
 =?us-ascii?Q?OR64UgsXONqY63UCwFojiwOtKLxoybya26vXDB1Fz6ZU4JOSKLMG4Je4CQKQ?=
 =?us-ascii?Q?wPZkS30LjIOpqnhxKCnBMrO1U64E7xaVmXzEa2Rvm8a1pmIsjfEHTkTfKcjC?=
 =?us-ascii?Q?CRF1OiQU9YPLIPS+WmVTJMWXSaZsd2p7?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d331e14-f426-4436-59dc-08de67c29a8e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14098.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:04:25.0782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB15036

From: V-Conet <v-conet@outlook.com>

Vendor ID 0x0661 is assigned to Hamamatsu Photonics K.K.,
but is used by iBasso for iBasso DC04U (0x0661:0x0883),
which supports native DSD playback.

This patch adds QUIRK_FLAG_DSD_RAW for iBasso DC04U, enabling
native DSD playback (DSD_U32_BE). The change has been verified
on Arch Linux using mpd and pw-cat.

Signed-off-by: Qihang Guo <v-conet@outlook.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 2d9f28558..d550c84e7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2236,6 +2236,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x0644, 0x806c, /* Esoteric XD */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
 		   QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
+	DEVICE_FLG(0x0661, 0x0883, /* iBasso DC04 Ultra */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x06f8, 0xb000, /* Hercules DJ Console (Windows Edition) */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh Edition) */
-- 
2.53.0

