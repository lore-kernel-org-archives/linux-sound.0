Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010035.outbound.protection.outlook.com [52.101.229.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC6B1925AC
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533789; cv=fail; b=FdLaPjBtoR3a7M2zkIljQbq+iTVReOvGFgNu+eiH2W3FaxYP54x1Tra1Yj7IPn2J+w8HvfrG0Ct0IsVkHMM+LawZnOmrc6g3zAO1ZzwS6vnQYFuDxAFqiGN9pRujCAKIoeV9SKCh/ptcFdN5LK+b/9hyupP4SNCsYkk1KBAneD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533789; c=relaxed/simple;
	bh=K1og12w/95hrHD1tfMZgvQ1yd96PLSqeNoRDrSldBqM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cpHc0K4cGK8TvqeYNCznRDWu8yNML3Seg2kNOKCOZO/ayaf/YYlrpKs+ysqy7/INkTs2sUPVbCZs1IiHUj8GTvAtAAe0wUYNMTbrdopR63i6kY89koAyTEgmubo4FvkRWIlsmwQ3kGjs03ylQQs95kRFB4GUmv1W/tmclvhxIU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FbsSNGdl; arc=fail smtp.client-ip=52.101.229.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FbsSNGdl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXWGRCQt7RIgVVjuBaREHSIEh/vG/Z06CDf+qph9QpWZXOBmjOy8TX13TXedSxPG/VPNxYqV3jh4d0Tf5qAM1fxIVKiQKNbdnXF/1HzXZclZqg+oFt8YOlAgM3NCVMQ7FArXoAyzaHTVZ5cPPWu1OK1Re5fKKha4bUg+28uMHjw28Ju/Nx4QQVj1AYnzpqGY2jrq/sTSwsRHP9dFml2wHV8OsXqE1gOr07FNLdZO25dT4221gx23oFmt9fojSk041o/OvXx1Z0HmS4oP0fQy+AjroF6YcvaH8VKdMg8myrg/z2faF5CnE/F0sLUnCMl31GZIaJ9vbg+DC2w86cFebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYjVaSpB6DA3OSPcjou16wJ0sb4Udl24CQVRRSePaFk=;
 b=rPjcB4i5Qd7izLOQKPkb6zDxkVZ7yDhfrdukoxe2lCMa4SYH1KNI88eZpq3ShTAzpRtotFGViS1v1IJFYyHg2Uxvo4Psho9mim9PHCXvws78segFbiz8/7Rq3Y4dUuMYf2T+sKGremoDULQBkN9wN/i+Naj+Hf8F0858JJGoCpBTcRqObRM7jKQmSitZ8bDluK9BS0jeiM4W6wnAjpHJW+53Q9Ot2kOqRK5O6X/bnb8w/wu1E5MssRTs1NJXTAh566qzUdxsJKSKvpgwgsbrVJEAFpYEYOXDhGrOfb6eSN5WyjYCVs+aI4a5UfKLqS4jrjUbs288A4EdUiTSn6YtIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYjVaSpB6DA3OSPcjou16wJ0sb4Udl24CQVRRSePaFk=;
 b=FbsSNGdlz04qyRgknC2xrO36jwXlaUluUlr6un16JJzdGIoCO2sw8LSs6S0xzNrhPAwyyQ28yCm3DFjHpXJ0QXx9hyMjdE6pqW4M7Wd0QjrvEUBP/MR2NGlyedkBGA94DdlouQJFvEC5TQYHTXwhpqsUDZnM0By/ovk09MGSnQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:36:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:26 +0000
Message-ID: <87cyf5bi7a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 102/157] ASoC: codec: wm9081: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:26 +0000
X-ClientProxiedBy: TYWP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: f74d49c1-fb4b-4404-6bc1-08dd5605fc16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m3XE5El8g4UK2pqEGy+66qs5s6E9GTrrvVQjv0SuOnFXUR1Y/fNcLC8yGM5D?=
 =?us-ascii?Q?GZYLFAMBnir9cml8U31IF7IVERGIs09iMsjsNcjbQJ/PoDUIxl2GfRlvDAVN?=
 =?us-ascii?Q?BGJ04TOA8IdwTQiqysC16RymVY1WmaLPOqHLJQ6JuttqyHROzqHGZthVi09f?=
 =?us-ascii?Q?kFB16/spsw6PhLPL1kQXHvNBN69Ge4mCx2icBJGY7GhwIPW4sf/HtmiV4UYq?=
 =?us-ascii?Q?tCtrLU0DhO898rqu46gSIxJgWT9AVV6xyGgwkXzqlu4SU3Rhvvu8QDZe6/Bz?=
 =?us-ascii?Q?HXC0je574QgljvBYhkkl4qEV7vR3Q7D53f6mkJmImjyVJmvhTrUkpWerWCci?=
 =?us-ascii?Q?EKBOLfdaeEajVuguuKaA1LvUSbL25kXYAdRK+IMA58qIrjC1B7g6wp6VqqMI?=
 =?us-ascii?Q?tDU+4AqQQCdRxbADpjExqVa3RA6p2tak+9SV83CZ8C1R541OzaYlxx/2pTzk?=
 =?us-ascii?Q?By33qOiplzj1+cT+rd7m8SH5t2ra+5r6SQjSRAmcItMGfYs47J7cHl9jXqjN?=
 =?us-ascii?Q?SFXG1RJ4VYJ3i0gnWxz96Sglh+YQAnn/xCuT9WdSP8dUYQ3Zv/4/9YJjNMY1?=
 =?us-ascii?Q?ZCbngYxWFx1y31h8w/6cSuvp99/rfs6CUI+XNGBbXzfG6CsEBf/A1LvfED/M?=
 =?us-ascii?Q?jExxfaAk5dda9vm0+KdqBQho2vx3XV3f8cIx6ubrtTqlU0N6zo7zvq+wTSwO?=
 =?us-ascii?Q?GP1lW4fq+NMvfwAIc97Kd0HjcTpDHJvCJV5TWyUecAfLoyD/o7Cul9gk/HRT?=
 =?us-ascii?Q?tY306zyQM0lXrFmtL9i2ExKsT9Vy2jHugre9EBJejmyFKdIxEoUKi31m85H+?=
 =?us-ascii?Q?34IPa2rgvCSonekxz4hTVswdTdpHW1HPVx7T4RY3GLSsG1k16eZ4D6T73QHv?=
 =?us-ascii?Q?hG1SWW+y8pHqAU2uZbFSzVNZc2LipKDt9QPSEfPwKDNpXzF9hXHk7gTrPBxq?=
 =?us-ascii?Q?Z9SWyrUACJSmUVyNjX1ZLS4ozNVtwHvXisMHU/u+XKK3HbcRIzPRhD13X6hN?=
 =?us-ascii?Q?nMqYkRUcmRm/x3/Y/qayn8J+phQZqnphCqJRHJ2S89jBcfP1WRDoJHvtsWDO?=
 =?us-ascii?Q?gvzFlmwT0FOZwy7UJoWSRCUzzxD/N488+chB4OYZeQv1/93te8Z5WHNckYba?=
 =?us-ascii?Q?ctwTsQIwveI1TjrdBgmTizO4Q9D8w07e6V3uvcnW0YG4F7//iAJbix3WghmK?=
 =?us-ascii?Q?UtrLNG5thND3aoJdGuOOoqpx23R5urQ0Gb6no83pjg+udZjlv8LTfsigE+Mj?=
 =?us-ascii?Q?ye1E2cKFlyIVwr6ENkeHO7yWwMrq0QfE7swSLeFFRgfYoOs6wuk8GZOH4Ib/?=
 =?us-ascii?Q?KureK0JPfGzhUMNvksFVp27wUNPiwlMvstX4IjO4fG5gL/fPws4cAmLMHCJ4?=
 =?us-ascii?Q?BIBVxHUK1Tl/DPB7pxprXDEnk3pGsFsdAspNG9L5c3pb4zK/AxYoBJOWI/XP?=
 =?us-ascii?Q?GG5f+hyu42B4jD3fFHcVNi+OB/aI8WR7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MXVJcmfmUZU/poxktXDzPtyPrnSzFcTy0AVDa/g9vk+c5x4rYspze65JXmrn?=
 =?us-ascii?Q?L7Bald2fbZwt+Ml29nYrkFBENUWM3nwQ3qln2fLM8AfIL3ukRvC04J0CxWrT?=
 =?us-ascii?Q?prBlh7kiIHpF/jWqR9asgS3HFs8hQePjDkhdhUKiq78idpNGJRgBG1VRHtWs?=
 =?us-ascii?Q?Ge5Zs7MMT5IGwNdJBFovWRb2Y/TMTHD2PGxgvKUPDP9R59LnbkWRJItvrZme?=
 =?us-ascii?Q?IYmdfJbpvoSIoCWu77oBJtKlOFXZ/EZvarfGd4s4Rp7egnlZA1oFQ7WQ98nU?=
 =?us-ascii?Q?3Kj1+iJbIX/ESYgQnXFMlNax0DAQ0kO77tpFIug4ztDUS+yb5EXDKr3OhBB2?=
 =?us-ascii?Q?hshYdPDhzhl4/rnXfG/N+C7zzdouFxhwzsl7Yosk3/G6GqkAn2PPfjags6fX?=
 =?us-ascii?Q?qyVcrximP4znC9cv2lisnUxnTot+w6P0RaBIsu6VM/dbhl3lB7ST9qyrqUcA?=
 =?us-ascii?Q?HFienucHJZq080nUZfbB1OA4ebn8txszLy8lu1t+oU6+mAExtnSgaRARH1QD?=
 =?us-ascii?Q?pC88JvXO57tzEQIPX8qORICQv60GcfJP2NqDLeims2BCd11Jxwxq239+ZfcU?=
 =?us-ascii?Q?Vl6K28Xm6/UcBFkRk+QCpAAleuRTxzGZCD2d+ZSYX7201Y5cvdw2b1e2ez6B?=
 =?us-ascii?Q?OIGPpCEUnVSJPeBvfMNfpNr6mGkLQsR7jXbnHMDjuhAww4whDq9Ltws/c9Zz?=
 =?us-ascii?Q?np6EC+7JzYyD0nPf7zirnlpH6joVGCtyt8/jM7JRb7gU82AYXKQKpuIsekZe?=
 =?us-ascii?Q?JjJropwvMkLe4cuUg2M5G5/x0IJGwkEJ1YwlGS9LnnB4HZibu4MYeTP2NTdg?=
 =?us-ascii?Q?lCk25Ykt/TJic+GMrbcP37LgyIF742GlOjsHZRnvL4Yl7o71ayCx/Ma88lUq?=
 =?us-ascii?Q?7kI6t8yuWrdaxBuY967rteXUcq3npWgOKQrFEvRUalcl9mVyQHO5Qo0KvbTS?=
 =?us-ascii?Q?zFfkvM3ynWMfq5ZhjNaroIyq+VpK004y60tll9JFDTG4IYdPLx/YJAQkMR1C?=
 =?us-ascii?Q?2tC51M4bm16PMXgOgc0s3tfD0D+qLJNpnxqB8wEfxbQd5+qMDkMHuGeV6BDv?=
 =?us-ascii?Q?DuyIUxne+x4HeQdHXQt/GaOf3UW7hVKX0ESJAJhWJbLUqkmNmrKLc6P8SUWF?=
 =?us-ascii?Q?WC8hVGk6ctBzH1OdoeQgImazhLMzval+H8q46MEjP0d3yZcbvdqRuUhLmw/2?=
 =?us-ascii?Q?6qxph/pWQwKOWuNCaPHe8OoSBK4jT8ov1VLhV6K5TdUmFVD9og47w/OG0XcS?=
 =?us-ascii?Q?iQhO2ehCjjWugZCEcyV67lO93d/BT+iB6D/q9DMIo2RbWHWAPEx+yW0SusGZ?=
 =?us-ascii?Q?u2HUcXlE/HgUUGlB+iB8w+DuJ8CCXpb5ioJcvYy/GYvFcIi40tBbBfZvKbZB?=
 =?us-ascii?Q?uKjB3o2dGbNl2qGzFq8tFAwhQZtf2GIBEbU0kz3X4vl+tZ5kr/rztRC4T2K5?=
 =?us-ascii?Q?+QCoVgCs74owK1ItSj1+Cvz+tV6cfuDzuHgupPmXJDZKtgGw1quWknvW33A9?=
 =?us-ascii?Q?+xvjaTycJaAdj+4mZ0Vh82Nef6hB+X+AUuwcmBRahzjvrx6MAg84LkrNwgGN?=
 =?us-ascii?Q?OW4ntAZgS2pHGQyugBSdyHbu9QU9b3scJd8BQf5mrE3DXEb5EfHboombG+JK?=
 =?us-ascii?Q?iRFkx8o/Ou+PCw4uw1NsBws=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74d49c1-fb4b-4404-6bc1-08dd5605fc16
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:26.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xc5QhOTHiZAGd9wJhXh7osogACKheek4DPXo3KdRRRL/Gdir2GPKDw4EG+qGWfMXOpBpKWk9JDoLG+sW+/60bGNfoSmE5fMT8JtrZYOA6LpWV/uoRSSV2M2YBb17e35p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm9081.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
index cb9d040b34d6..94d8571360c4 100644
--- a/sound/soc/codecs/wm9081.c
+++ b/sound/soc/codecs/wm9081.c
@@ -907,18 +907,18 @@ static int wm9081_set_dai_fmt(struct snd_soc_dai *dai,
 		  WM9081_BCLK_DIR | WM9081_LRCLK_DIR | WM9081_AIF_FMT_MASK);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		wm9081->master = 0;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		aif2 |= WM9081_LRCLK_DIR;
 		wm9081->master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		aif2 |= WM9081_BCLK_DIR;
 		wm9081->master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aif2 |= WM9081_LRCLK_DIR | WM9081_BCLK_DIR;
 		wm9081->master = 1;
 		break;
-- 
2.43.0

