Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C429A190696
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533689; cv=fail; b=gkeDZSWZ7rmiIPMVPZteB/HAgoB3XRQijF6ZJvhtOwS2D57Agky9ZqnUl2cqD3d4kAr1iygREWOEy8a7oh0CSC9BfLJWDEazkq3EjainB2HjGzLnwJNO8kJShdlPnhQGH+RWaGj4hhYRnGXcfX77wrFTPkw5fCWfxXcekIXqB64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533689; c=relaxed/simple;
	bh=F3hXsJDuuNO3asVHMjJaqn4YG5pVy4YFobvHlfF8pRE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HCAUzi7fi3dDCdrUg4WA15wgJrefU769LmGYnJWaXZS+Qc2XzY0lEpgoWlh/9Avfo2opmT6FDxZt8bo2SHFX9imAYFU1T4sU/K4W1l8IFTqWt1ILIMSPYndupA7i5C62Bb41XC7JQwsUGi6WXr/SuwuXIQK2FirpWOgi8MZmevw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Hf4HM0kn; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Hf4HM0kn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyBxgPm4otEdLu5p1d2PHR79dB04nbejJqyt+zv8JHDtrejCQdBdjSsKs2Y+fZ+T+xfENuB7+pk79o4wcZdIUQ6I93chGCPXDVPuI7oJC0JQOnL/9Ds3AHpcK9blCsFXHaff5DEG13zfOMInPtHbgg9RUAcJG8ftlbPC0Nm4Kl3nxK+p17lsrXQukV3vsjJjcHg8M02aB+D7yip20OjYd0o9F9YWcwFUThdvyHhRC76WCf/Z1MJ9s9vQJtqMdKm1/4i6xMaIcs8p68+xCUGG2mYZj2TrMcFKRdAdKfpkRlkLCQjmXpIDqH51RQuWJtK3ZPISf5hTK4tAsLZu0EOAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7r4JbGSgl09xxQqwEp+7DBsBZnx0duHlyuPL1yAMSt0=;
 b=l8YNSFbM8BuCqswBBhy5OFIWSr7JAjUaNJSYqWcku41WtZ/a462IpddR3Acpfx6Xz0KuZ4QbrXjusjnKvWYkNynYeYD2ta2ggNFbuT7b8AM533qGKFow/GYFZQz4QdMnYux1P0RgBgMYabeIBn/MrlexYd3EMzaOBeKZAqA8kXvCtSQoA5gsSxgClzrRfghkQEqYtnN63/RLU8GyF5PLk2FQ2MSKFxLE53egUZngABoWHIPtudkmmISYbm9k/Guy2g9BolNjJ7IeyUtxd9PfIEPShciT9Smmws8SbnOjApshGd4yutfuwiT+cc2Hz0J0j4fJKnUnHWyhqm7821wDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7r4JbGSgl09xxQqwEp+7DBsBZnx0duHlyuPL1yAMSt0=;
 b=Hf4HM0knI6EZhX/m0+6N+xjK9NkRtwBL+soLpZWln3cxnS6kq9qCeKK5ddIm8V5QrOtm8z+qyAcwTmC+UXe3ZaDP02Wmzaqbn6ayfu5iFnE+q/qtNNCFVy8DXqc9roP3R3lEVnrcnjEW9S5meEvTToetiLM/eU935OJ2K6sqwoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:34:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:45 +0000
Message-ID: <87h64hcwui.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 074/157] ASoC: codec: wm8728: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:45 +0000
X-ClientProxiedBy: TYCPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bde99c-b93c-4f1b-3648-08dd5605c028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mZEW/opU55HQSOLdVE9wPrhesyUeVkZF1dZgY8XyG+6cvkiTBR5mZ2SSw1xf?=
 =?us-ascii?Q?y1Ska0k1N89HmCkhWasi/YvjldFTz9sJqgGMbG26Rvd2Oz3Xr0/OwVKfb1TI?=
 =?us-ascii?Q?KbpoKZKESudK1rHVM39dQ1jDRKkgLmEap2lj8LnCsTprV6hxF+o4JHZqLiPE?=
 =?us-ascii?Q?yh2cVM1oOfVNUhtQvJI5iMbNZFkCbK+sIBsWhkGGaz8ABxmtcOKfzibAmEOf?=
 =?us-ascii?Q?9xs/0TC2gXclrNBNvw3mfRoZwFROufYQsM+xuIS2dSEkgGNDercGBvld7zpR?=
 =?us-ascii?Q?3rAdRRDmIt5EmJf/hLxudpn1tS2p7GOmYK3dVY4SMFG4uPHQF3DmftwA1cdt?=
 =?us-ascii?Q?xD1SKIiUpPLDbjf4Q6WUUNYClf3mTfOQPVmwtHV5sO+HsF3ZVdd03A6X/aud?=
 =?us-ascii?Q?hqW0HCZb7ljT/KXVKWwcB1bItLylQV7uxQsyXqjKe0MOV/1rJI6SoymTWCn/?=
 =?us-ascii?Q?MOcTXoOssxmcWklaWhx0LWWf7B8e9yoToELWGKTIzfh+c8Da5gSHw5DsplK+?=
 =?us-ascii?Q?rVU3c1CuIyyuLy3GG5SXBY4oPgd9H/YDCUyrXUl+amvbquAXlsPMRRDGiOnF?=
 =?us-ascii?Q?er64l0rGgPkp3cnzDOd7SGx13j/oZA/owUUrHvUFcmIliVw3ZoQgRk+yUOVl?=
 =?us-ascii?Q?vihyF2iNYO6/w2cl0apO+eU/0UJyLD8nr+ML3DfAMhSQMconfSSml8ABSLxB?=
 =?us-ascii?Q?gr0unEHKmi6e9qEANPa77Odjxi4Aa47Ui0wSkAkmokoLxiDrPCUq3urxlOZh?=
 =?us-ascii?Q?N/GgxgfGRCKbv/Tbs29cTvXKh2oEj7hC5RJMudqC27q6tZDoUjNjiraPg39u?=
 =?us-ascii?Q?aanA1aqzVTxyFpwHwPKGmRxXjUaCahqttzbmbqRsRwK0dNSc8m1o1hNsfb/H?=
 =?us-ascii?Q?yH/7TRAdglGE0SvkrPuFZa5CtoXv5Iy6/CjWd+fQGTUx4Q2U3//vUg03ncDl?=
 =?us-ascii?Q?X586bLz8ISs7ZGQVucplm3QklgcAsPqvdjAeAV0DwqcwUI0Y0Nnsih+TGjDd?=
 =?us-ascii?Q?8HmpSYj44uks1+R142etJR2jCrbkzt7L1RApP57SlvlQ5XrJh4Kl5oB62LAr?=
 =?us-ascii?Q?xyi4u1NEee6jnn7UMK2K2B9WL4U/wi8FF24N4fA80pTB0IYBbtRCcv9CzT3z?=
 =?us-ascii?Q?SRQhH2Id0ROTHony+XONoIoP2QmUqioccFlXeru1SS1you7Gx6dPipzqeCYC?=
 =?us-ascii?Q?A3+NACCSEgFZ576i0hQgCSgWAWuV2UILijdZrq0FXPjqq6vfWYBEUL0v/iUc?=
 =?us-ascii?Q?dZdI5s3IbRzBe+ST9sFL5n3kKyQDb/+xNfzqucFOJ+mlXnaP/uISff+sOMTy?=
 =?us-ascii?Q?ruPeFJia5Yy9+zqURYBAoTqGafDMZB3gNgjg0/qQqhCetbKtNFTJ2M2n5Gg9?=
 =?us-ascii?Q?nIPbY2WMVzSitQ4znu0GJYLVuJ8MwFnjaZqeZI4q0OK1jOxlXqc6UNPXA5vz?=
 =?us-ascii?Q?4S4otbNFBkyI9wJBdhX5VRflUK9hUuE6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W8CFss2j/SEsAojHyQ03iQk2KJcbAWuAxeuKQ7KMOUSSeDU4EQiY9vCivqdu?=
 =?us-ascii?Q?zHjduSGSR6W6/FDoz4pb/mq3j+5C7cNHb7pzUnJovz1XO2UYuEn3LMSgL/VB?=
 =?us-ascii?Q?Yg0boDU/0CgNDvvF0qC8T0CboZHwmS9iqCnzpd7gXJAwLwSjOy1e0pL5R3AL?=
 =?us-ascii?Q?wW36IbJAzinEUCM3S4IVcNm2qW/0/1t3jlRn/JjtW19bOJ6p3vnB9NRPvVPo?=
 =?us-ascii?Q?1wWO30VwyIkk5aaYONWD16fMubJdnngI3O2/7OGaZAjJbfa9N4qJ/jvrUQ/R?=
 =?us-ascii?Q?EgIaD7KfkknhS+TJcbiDZ+9OwSFyIeKQc8zVxypS53R+NuWPiTEIwMcVCcy1?=
 =?us-ascii?Q?w6GhQGzfeKzIgXb4olWw+W33vNxvtMyZuMICPaTvweb7+YYFgX5VEvVpgyQi?=
 =?us-ascii?Q?H38+GPQn8nb6LoGN34S5VHF16RiQtaOog26+F3kVGIfYMWFiYdeA9qtycnWc?=
 =?us-ascii?Q?+bjkIejUoE3reprGPs/f4WVxtmilbBsveYCDlrYucTYGBFFTRDYYXTNgEoG3?=
 =?us-ascii?Q?lJwlthM0C/SR1DqTKDyfhuDo2jBtwovfEPO9H+LPw89w2sTba8+F/np8puPi?=
 =?us-ascii?Q?b0d/+x1olj99qACvJ2JlC6p6KbYDq46VSn2LKTHgh2yZ+ZL1LY8JPUgJAB0d?=
 =?us-ascii?Q?llzgP3FAX4VsNiIrF31jlrxFH/Tj/evL4j5sFdud7O3FxCGvFAG0pyQe3Gr6?=
 =?us-ascii?Q?1qLnPf/1RsG2IPj6zMEkfBOY+TUk4ornYPOF5EqdcTLL+Q4p6KE9CHPVQnpC?=
 =?us-ascii?Q?Q1ZMsgu6BXewD2O+5ckoLOy8j83EmuoTK0suJF7+Xy3y9XKofJRrvHj1rtnR?=
 =?us-ascii?Q?gBmJpuaLuGRuAQUJ2oznMgzbP7mQ58UYR5MFmVwX2rBOxvonX3DzIS2Aannu?=
 =?us-ascii?Q?7PJFPQ+7Oou+Fanc1DweqEKuPpxnga2yNHpPAo3lB4rSS8erfXvkKwdQDkJl?=
 =?us-ascii?Q?xJIzA6zjaKvZXDtkn7X+an91ACmn4dhgmL/DDyglt7Im3Z+zLOptRrj0DUlO?=
 =?us-ascii?Q?mv+NVO7hVvRZVluaSopfkKNvZCwzIaLV6pC1swEdcwoyvbXXq4hlBfoDzO68?=
 =?us-ascii?Q?hGtG5EJtKiF/7Lelwesw2aVWQOx9+SnXqFgdjvv+Td950U74DuIrJBfU3fUQ?=
 =?us-ascii?Q?+tl980z9DiB8l3UgcwC+JbClH8LF5OxToqdKeuFdlwWqOQ7CqcQ+6o2duQl0?=
 =?us-ascii?Q?T0eXWUEGJQCfjBWqg7UE6tySlRcJ04x8SydGSzxiIH80ODg3iquJp8L6p6mH?=
 =?us-ascii?Q?xmn5/rtF4+fMjTiy2VFXQxyFCwqHoCLpmG8hfU/lKBDxNOzVkaucCOl2Ic93?=
 =?us-ascii?Q?HYSEdwiP9ZJPk1BIIwfoAdVrWlYDJjCS9pU08W6uHfsjlsF1qyCbXVsGB2AP?=
 =?us-ascii?Q?URbRG4mOkkKa7Nd/9Ltb1DTfftx9R7rBYPICNgG5Ic+AJHwILhOMkIG8WByl?=
 =?us-ascii?Q?W8a3NEK4d4AJ1jfigDa7Uolp4rmPZ2kgi66z68ty5CyqjxWS+y4SPHf7u077?=
 =?us-ascii?Q?+gFvYokw73GeiBcJ2y3jDFa11pA0dSn2I0s8ow0w2Zj6cWWyAOQTQwYG58Zi?=
 =?us-ascii?Q?c+E2NIesUXwruJ/0Io0mrVa6JJl8IiKCHF/oFSuTsxyM3HJyYnK0FspwryKz?=
 =?us-ascii?Q?a/Y7VYWiEah86+ohztIVqzM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bde99c-b93c-4f1b-3648-08dd5605c028
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:45.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZW/TBB7xk9FC8jFNooNLvGfWurRgn9XonUO0lgGS5GwznaV60r+rtQRlEKtYfjfHNrQOQoWIHqB3zJ0W4s7oQB4MvE5FG/PtLJyx+9XMMmzzgXP0BeUiwG6lrQ6mCvZ8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8728.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8728.c b/sound/soc/codecs/wm8728.c
index 2cbd6b189416..ea0a588da40f 100644
--- a/sound/soc/codecs/wm8728.c
+++ b/sound/soc/codecs/wm8728.c
@@ -128,7 +128,7 @@ static int wm8728_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* The hardware only support full slave mode */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

