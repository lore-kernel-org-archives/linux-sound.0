Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010022.outbound.protection.outlook.com [52.103.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8990D21019E;
	Mon,  9 Feb 2026 02:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770602859; cv=fail; b=MBpdFZ55e/mvDxZyvQRw3T/Y792V4HWcHm7AlvumnqOgO3Asdr/fyUW5QwWJAgixw6Y5j1pnFBDB0AMnbhE3nE+vNWe+Yo35yScUXpNTBPPZDs2ZiM6OrgzAu7KFlzfEuDwu4GmaLXtn27h1jMhhKUlUDhY+7uAmBEGiATtHWk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770602859; c=relaxed/simple;
	bh=KXBGdkhqz1jqV9kyfsgUpXwF0gJu9fo0x8W99rCI0Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mfUp41nQQcTk5QLgcziM66vvSoGBfEJ8xMEgsu7Jb+BpnV1QMqoWskXN1vh7hE+9QfUIhGkQwdrDaeOAnVQXFSEBJwwTcd9Kzsl0pFKjs3nzVuxKnvHICZPIOaKuZFSTTtgBENli/dFsYahKn00x/hYYWNlZcYr6uLht4Cai7Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=J3IZYSXt; arc=fail smtp.client-ip=52.103.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="J3IZYSXt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RafH7+vYSbmFW34u/z8Y1ysJvBD3SegL7TKlP/NSeYgGUfaboGndEKe0+mNZJla2UCOxxZfnJYR6zWv82E4y7Utv4aciGM7QDJdnLoMZzlfKXtk6e6qiOMNHVSCVCj34YV2T/4iVE/eP5oWXmvxxz2I59EWyRRYdBIoQGFwwu+mFHBZX0M5uGGFFOaCHAJA7gOkGf9Xekd99VrXxZbn7djtkoYJSG2l8bEYZ0C1/qs3XxrstjYs0xFusXjeZ0ICktOcY1XSspvWJY9X94VQDeQKbQK/iXHAVdOdKGXybCJovRIALafezLtoHoFUTBYbK327cK8cxtuBDZ31kci2Rkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vD6vdpM+lO0UICIAbAEw/uVDs/vmUbcLcimJIKSbeNc=;
 b=OPaGlzr9LYPBlqC6IE7eNzepPyl1keFtj16FimlnRA/+v/4UfuJHfw9vF04vDxwTGKdA1RhVRVNCBqkvETyox6fCzgpUdJbc08bVxT3MTRPpY0PaGCwVnKtYPcrOyQk+1un90t/tQ5CG2l0huTKxvCWpO7N+X58OckVilbAKHpvj032K0iNmnSzrsZLv+XDnvDcEM90gRR6kxaW1w2CaW0tHe9mmCz5m8E0VnPuNP1emj4Kod3gLN2a4YqS8mVMIRDyfmWvfVFELM6UszQe+NOR5X2ORRhcvw5FlAGMNhm2sueNk+04/IQtaMW8XuXJT0iP4EJfNYVvXbybZ2YMvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD6vdpM+lO0UICIAbAEw/uVDs/vmUbcLcimJIKSbeNc=;
 b=J3IZYSXtil30B9mgkX3qPWxG6gf6vy6UIGpdqwM958i7Fw79K+X5AkvyeX0A2C1vNeun70TdW5I9iOwbv3mxiHeQhty+jXTxkeLt+U4wgzgox0t4e507/DkcFOkd26mPn7bEbfFWTHLyBvtl2DTJxMnKuoe9QqAizCnhUPSc52OIHSvfzD6eTke79/hBteVNM8a4ZzwlPuhEol6Pnzf6dVceQhcesVpx7sSKufyDmTyYLrg6XF+IzFUgiyMrOzrF4K7IpX+VDOt6orWUkHtDJAj+aCi7uiWIVRYoBWTWUihd3pxDq96lhJsncxXgGxttyTfPBILbRdubqAwRT/JVeQ==
Received: from TYYPR01MB14098.jpnprd01.prod.outlook.com (2603:1096:405:212::7)
 by TY7PR01MB17170.jpnprd01.prod.outlook.com (2603:1096:405:365::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 02:07:37 +0000
Received: from TYYPR01MB14098.jpnprd01.prod.outlook.com
 ([fe80::5a23:52e1:8e19:2748]) by TYYPR01MB14098.jpnprd01.prod.outlook.com
 ([fe80::5a23:52e1:8e19:2748%3]) with mapi id 15.20.9587.016; Mon, 9 Feb 2026
 02:07:37 +0000
From: V-Conet <v-conet@outlook.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	V-Conet <v-conet@outlook.com>
Subject: [PATCH] ALSA: usb-audio: Add DSD support for iBasso DC04U
Date: Mon,  9 Feb 2026 10:06:47 +0800
Message-ID:
 <TYYPR01MB140982EB52459BA89009AED3BF465A@TYYPR01MB14098.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0046.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::8) To TYYPR01MB14098.jpnprd01.prod.outlook.com
 (2603:1096:405:212::7)
X-Microsoft-Original-Message-ID: <20260209020647.23525-1-v-conet@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14098:EE_|TY7PR01MB17170:EE_
X-MS-Office365-Filtering-Correlation-Id: 9972482d-387c-4830-6208-08de677ffeac
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5072599009|5062599005|23021999003|19110799012|15080799012|8060799015|19061999003|40105399003|53005399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pr/3+xT4K+qFZR9MruWH5rmBMF3tXY6aUfZOYr+mM40fLILzH+r0j6NuZZWS?=
 =?us-ascii?Q?nad4JF0FP5pFD83uf8e6XkDqPvVIKaSmc5MwUp3jjn27QwkOiv6FhZSSji1D?=
 =?us-ascii?Q?jcCtAbzlVzbeC8KdCx/ud0gNWrAFj4NZXbAszl0FTuOuXlfxSxlKAes5FiXx?=
 =?us-ascii?Q?WeOhr9bxvObEIPJ8S8W++n12tvrv7g1KzhwrUhWT6DDwVaCsY1g3j2FDx9LS?=
 =?us-ascii?Q?DxziKIavUbonJdy24Y+SitV4yXLAfrD+I1LWVoTtGXvTELpbezgZQXP5r/zj?=
 =?us-ascii?Q?cg0iu4QrWLIP0bYjOe83b88VwB0WS7xkEjlMXbKrSZlV1nz19X39DDbS9Mec?=
 =?us-ascii?Q?rdo6U+Oi2AjMfH/dYG62gotns/x/q+zHAd0ALdfET/Q4M3qBk6FSrLv+/pac?=
 =?us-ascii?Q?W00BAZUYTdNUFavpF+C2V5sGgqVVcgohDZF2H8gY8cI0n5K0mwKufMOCY4Io?=
 =?us-ascii?Q?+NTDVdFJzjiciZQhL7zeFlrQ1llQxbFkpR0aBDXQ6iXpGCqH3ZhECdCmnHJE?=
 =?us-ascii?Q?eQnoAnDsqLRe+Yi+TXfGa1NfFuyqAk7BBgUS3tcihf1hGnZGs+BX3nQWcsd+?=
 =?us-ascii?Q?N0XtJdMCkQ0iuz8dngjQPE3DHciGQS5OftqFGrD1N+fMY3/aSEgPLg1rFdYs?=
 =?us-ascii?Q?rquqXiSVuXVVYi3CoswDRHuNNI9fNSyW/9DQJgIpMGPFTrfHHCtO5r2bEkhk?=
 =?us-ascii?Q?I5GWWr5OyTLhXfRPzOBRd8xf7VIjOQHjlXG3Md678T2yxQtzbqjfu6B2/lWH?=
 =?us-ascii?Q?qdHOeb0r226JiJp3lw0Il1WjlSjKniR5rMx8eACHce6YwFonfCa4OhK0ai1j?=
 =?us-ascii?Q?x7uloTt+OZgqo73YMy2RvxQhYp83v4FGdLz8hWbcKFyMITUIEw+BIyRY4mtw?=
 =?us-ascii?Q?UcdW4SwlG5eDIw8N17uMUbuGxuRjztzT9v7lZh7CRIObsM6bJuIL8YjCRqM+?=
 =?us-ascii?Q?IOGgrD0Np5sBSQezN3kYHcxTzoZSJdydWk2F4hW4K0qxJjGDNjplUb/p3NuL?=
 =?us-ascii?Q?y8SK/Bs/pF/N4ymms2wWozbNf0J2tH20ZtCVpklSI8ejM8ldj1njdytrs/Gr?=
 =?us-ascii?Q?NXPNNk4Jxe9A06IQhcCXzv7BLQTuY8k+oV3jLuHpmRWS30aoNYH9W2X7GtPo?=
 =?us-ascii?Q?vk+uN3jJymIywPlyR6jXULGP9dbx7ehW3elg4zuFy2HCYVl2usjc7MDJcUP8?=
 =?us-ascii?Q?0A008vWpe61QHL+uGcb1KPrfwxqJx6cp3EirACDF16kWXUcnBerFg+BgkokE?=
 =?us-ascii?Q?vWZ5ZKRtZKroZa+Ju9Opi8VuHaXx+83reMG6WctDvA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5aJfE6nL5Wd+w0J5eU6WjU56RsV/Bk1+G1aClqrXU67BTI4E5CV1RKqQW/dJ?=
 =?us-ascii?Q?Otu8zjfPEFOsE5feMQxfmCg0VirJHZGGniQYgOFRERSOVrXLad30eCKcZZXZ?=
 =?us-ascii?Q?Oe+BW0NyZxK8g6RyQfgWwnDjHPtg2No0NatnH9hLuJY3oneF6ttq5FX2Ugti?=
 =?us-ascii?Q?oDX2NC6sFF4hy0QuSySifBZK+sjvOmpeJqnXZjuVMda7fzTZ0Po1lOyY4Ple?=
 =?us-ascii?Q?XhvHv8S2pQsXOojYJ1H6UGCSBont7HUaNif3V/b5zLmbIXVPpxVOq9z3bQ7E?=
 =?us-ascii?Q?iuc/8L0xVA22LmXlUkEdCd5nP0JnoIPNVif3uunGISGVKn7xA59VnmuMOX0n?=
 =?us-ascii?Q?9NkPt5Qk3ET3jY6WkAIrWOn7Gu0YiK9pDtf8d5CToIpi/nHBKdv3KDP1I2z1?=
 =?us-ascii?Q?zieHaAdDegi5zHQMWm1xeDBlYO66sg7WKNzzNiXT0/KDIAWhN6Ih3Mc8/T/P?=
 =?us-ascii?Q?auPgONsOAEap4TQT868g2NF8g0DpDs/Yo/RRccjbT4wi1VXXCA11VQwI7/e/?=
 =?us-ascii?Q?w0m8OuSlYy57U4npeXA37u8yPWE/qq6m9zH+N0Kwy/ne6psDq1rxx2wHXy4E?=
 =?us-ascii?Q?xUR873pBQSWI88NKlBXlkYvZ8eQ6I6OYtiQADk8Wrup9VSc7VD6CGphqltxt?=
 =?us-ascii?Q?3peeedRQAw77oXULrl0DnaRwixCXkQzn311OLsAhT8SftZeS0XmdN74MkEYP?=
 =?us-ascii?Q?NI3s8k0vgQU6ISUSU+CLNLQU6mTtUVUcJKsCA2bKq8NHvZQ87CT77iwg2+jh?=
 =?us-ascii?Q?NF8l2GnsyrpU8qR494twF1nuukQb1pzQtN3R/SPspSMPdbu/YgTplDQyHfzh?=
 =?us-ascii?Q?O1cgp3PRPPce55eTYyOxt3NU03e7RFScaqBtzX+Y+Hxc7qq8hlRQx3IoeSFp?=
 =?us-ascii?Q?z45BqnlP5JKSrZfChDNIQE7xNphCYGZQpIh4GaHptjBPPNrUewJl+crJKOQ6?=
 =?us-ascii?Q?7QVNikfOpFdhRIF4AyiTUKpJq/WpH86LTrVzcqoPE2Cr6I1stYBSqyv4Lyi2?=
 =?us-ascii?Q?SWEro+CbRVbHiztY1Cofa9Nskx/oy8WJcxnnenQ19lHB6VCxAItwTHyj1heU?=
 =?us-ascii?Q?PUuoodMz3RPGbnyTSzMxxeara3OffbIU4Gyo2QwEVndtYX6esncUmrFkJx4g?=
 =?us-ascii?Q?6lF10aZlEVKl4Hcb/njDE7X4QpMLNMHD1GA2z337v7kph6/aoeRdr8KOoJ8j?=
 =?us-ascii?Q?2PKhCeqdvaaAy7oMuF4xX9l58SHidA3V/GU5c20KAai6VfKrAoby0S09Q4EI?=
 =?us-ascii?Q?tmqsConoqq/1dgHV81s9P9mweX1KIWo5VEE3Uaqj4uXNY/GVCorEpmj7pMPH?=
 =?us-ascii?Q?IheJyN3+xgn2WnKiPcLNZm5gTIfZFXzJtCvYgRnTiUuqS03s/hVfX4cb4Xeu?=
 =?us-ascii?Q?1KyhxuMxRxrrCi8ta8D7LwO7X4DjU3w3sfwf8WTzX/MZhsuVbs5qber38Hyc?=
 =?us-ascii?Q?QFEamgqnc5q3JI+LQmeg0Acux59O2Ftw?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9972482d-387c-4830-6208-08de677ffeac
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14098.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 02:07:36.7439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17170

The vendor ID 0x0661 is assigned to Hamamatsu Photonics K.K., but is used by iBasso for the iBasso DC04U USB DAC (0x0661:0x0883), which supports native DSD playback.

This patch adds QUIRK_FLAG_DSD_RAW for the iBasso DC04U, enabling native DSD playback (DSD_U32_BE). The change has been verified on Arch Linux using mpd and pw-cat.

Signed-off-by: V-Conet <v-conet@outlook.com>
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

