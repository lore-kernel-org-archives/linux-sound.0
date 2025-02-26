Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36096194AD1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533836; cv=fail; b=K3ZloLGDL332ejOOas/TRP31bSjFVOez4sjNZiBzVVN4I0PuyW89pn2mbKYB3uPkDOU0Ccj2QuBvGrD1RNk5Sw4t6UsfQ/zFQ7mWcivSE8EzrantWtuLw5eLhEEIkZ77ntyAOj4sKNEpQXW69h/QOLxirBdLlg0NaWLFLvLhtws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533836; c=relaxed/simple;
	bh=m+c6Dsx/I4PUYUxcQ8V2O+NmRrNjVDhSYh1BL1NvJJ4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ssM6qbZPZPI04vLTrVBHBWcqqka+R+dOLH4aMhwAzmx7QVe1zrwVlR6MQVgpA32OnfsQAKa2CHczRHrk1V+TwlGQG/euH5E6tzf+MD5ERk+1hxWq48dFP7k5U8+qsD7wy+WJwECm9aN2EH6X3XI51JpGwJxqB4jR0dJe9UFeHXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p9h46sKq; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p9h46sKq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iw8NLHzF803XhY+OHHw4yPqPNpcxPQbXhZ1uC8ov3PDD2gU3IJ0zML/duG6H2nkPtE6t9ZhUzRPgwQNWkyHsNBPffiOdHNdZayQd01SshqnYPFHwUemxIGNF2xwYNnj9pr0ppuIlDUoxk4vN+xbCxjtupXLT+12QishrmFShhw3qS6Vmq6Fq8ga8L10Wru91qYqgjeYjY4wxhyKLHV5EZ91ynZcA1PdI/91Hg/dkS3qYHq3nU+aZhPljuyIyNuElGsLFBKV6NIj54ueSnvJnp+Yl4c1al9nnY9qo7Lr92CZvkxWLO2cU1YuMASTN8WgacYIKYcVZk5ihJCjtXOfBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnAUr/yi94Gyiv/aIQbnifFbFY/da3XCzSslNhn0cGU=;
 b=yPINyCAWcYq7a5wCG3pDyH64HZBrXUrfRep4/DQ8KRDYuZCn0boIhsaCizUp1mGERYKWuC144CqpkFQRbbeGnp9O4LYWxo8qnzKBWW0iB8/sJaXMdhmRvxhuqtqEZB9vkjkany5gLp6URnkrGrIi5BBchlp/OlG4ie3kQUcJU15vEPr2af2FcpFbCYnXaKZ+No1K8deny/aCmCzd3AF5coIxd5dLVrHWwiW83WYG4nr3WroC3F1mHNDEAMolJhdemOW82g+xAVjYRLX6VAYFWVFRsR/+lWO+hAfREnScYa+s3leG3t9B69WFR9Ligxx9Wf1WVmMSTbXeB1x3EbKAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnAUr/yi94Gyiv/aIQbnifFbFY/da3XCzSslNhn0cGU=;
 b=p9h46sKq7rflY/G6qaeTuNLEDTfN2jdFVHUKHwLHfABLOAKdFicuMnQBkh7oRikNUOfaK14G4Ro0fW3y16pEPlvJ+vWBE2iM/qpBWm1RpnBhEEMsLkyq69QIp17piChwHaYbz9Ju5CP4hMVzxU0IdOBn5SEhhj9OMBa2iOsr5GE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:37:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:13 +0000
Message-ID: <87tt8ha3li.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 115/157] ASoC: intel: rt274: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:13 +0000
X-ClientProxiedBy: TYCP286CA0370.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: acec2644-6530-4333-1177-08dd5606184c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?km9MDdGp9k0ZIlEMH/nUXXj40KnQ8lRailj5ph/5Vc1U5s+k67ceQeUzkO/t?=
 =?us-ascii?Q?NBADjoV55E2tKBw3lPpXBRirEBIg0/HSaJL07rgqgGCH59GxIERLKrlgfDas?=
 =?us-ascii?Q?eo7Q8HGtRMjgtytU/O67pr/9zQWgdfSdQupXoWnQC+MyCNX3vrdpywbhl3zQ?=
 =?us-ascii?Q?kGwGyI3ufH7+8QzXVZpN/UDmsHRFMhEK8mvEyL6LGgwdQzOa2pDWjWIS2c2D?=
 =?us-ascii?Q?IGkb23I11kIRGLg3dekuCwRWunpo5anxPoI3MoY/DypQw5yKHxpyQ3L3xyrm?=
 =?us-ascii?Q?wQ6M5nJwNwuwlHbdexi5sDxIju7i0Ajud/eqqlu/CUuKL1HUHakkK58+DE+W?=
 =?us-ascii?Q?ejQtyR8wYka83BA+Gqhm54WqK7Vp9KDDajN2OaF2ajm81lkxczP4K3WvHAPM?=
 =?us-ascii?Q?ljVaekgQO4RFb/S0XN8pHEFp2XxYFalyZAnNQHlfRsnNSNnKrRqRgx5BnH82?=
 =?us-ascii?Q?FNvvwzPDE/KfNUFVYQM4ZfdWIKfcBU+Cmhyctza3QkEXTRjaInG5rS43IAiF?=
 =?us-ascii?Q?lcuWkImkKfncCcBVXAftUH8yDL+CKrWho4HVqxDQXhp5ZyX/BYot8oZ+zzOI?=
 =?us-ascii?Q?uXhyTiY5E4ny9VHc1hLZUUanLF8NNrD8BmDtUw2zQvA6MuHGLV0sKxqp1y49?=
 =?us-ascii?Q?gNcrzRpXacRqVkmImdPTNgZjVY1eLEZbw+uz97uXKuFw45dY5dqC6n4xfyaA?=
 =?us-ascii?Q?MJFOHGhZOSiKpy7JEPufL95OB11deVrhjIyf7xu5RvzYeyIniIlaq4il/d9Z?=
 =?us-ascii?Q?EOZoRojVIrPL7K9MN3GTIbce8NkG08HPKfeQcdqNI9p/DOcjy8h7LPaK1kRt?=
 =?us-ascii?Q?jyrTIsx0ObbdLs1HyXLrdMH4sskuKIUzFFnPrQBJiBH+pFNrFpECUcCKIH9w?=
 =?us-ascii?Q?+nkIvGNk4TktXbYa1m6Mshqw68YOU3eJdI0mWZrE0QNcaESYacY4YMplXqEy?=
 =?us-ascii?Q?BOO64Txe7Rpz0iWCoqtsLIeynGdtJZ1ZB10LrGlpDV3XwLpqNmk1G7In53Pk?=
 =?us-ascii?Q?JFmQHNLHBuaP1DiInxK7wyrlMvnXpsU2yD2YisJHAMMNPh6n26CGC90AHgEr?=
 =?us-ascii?Q?PCE1cs6fGTEsMgFdvJxeUvpkK4M2WA1Vj7CXDmvYYqVtdWIrDz82JTizeLHL?=
 =?us-ascii?Q?jLQN1rrI5JayFJcgqSG7FJdrxtjJBZ3rFpyOrDNdRYtzbh+IRArOzzqHF7sh?=
 =?us-ascii?Q?of3nQa7ov36u3MXyuHRbeCfYwBCKQiaxin9l6uVa0hsSN1j4litRmQi+msW1?=
 =?us-ascii?Q?LYN5r/Gd7DabjGJX+mFGk3a3ZpNxce+VqvFS/oJjvLM5A3XDrhqnvCf2y5yq?=
 =?us-ascii?Q?QDIhgFOwKri6pMlwCM4I8pIAiAtfGdv3demm6r/hpmr8B+GW3+INwgUBPSXk?=
 =?us-ascii?Q?BcrKCZ/5W921gx+7Uz2bUdsA/kOpw0eygnZLZSURMWwjWGDGlTrRHNrm2zkd?=
 =?us-ascii?Q?FxqW2ATrbiwhIKenA/7rCFv2UzCpd87d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X423EkUAmPz4jCjL32cKRM/n5Xbb49V8iEUEQ+W8LZBfK3ZaaUL98PHfotvD?=
 =?us-ascii?Q?X2pr44Uc18qdv/4meJvmD9ZTEPzszhe99w/qQFLTGv+IDR8/1lJNH24w6NqS?=
 =?us-ascii?Q?eyLdttwPfQP8BJE9laR8TCnRegwTKjaJIXrx5zAHjyoPN1jWSyuj2wyScnk5?=
 =?us-ascii?Q?dGUu2dswWwfmoo6ZSL2amUjB8hR+CBB1aJBj50nmXUAbW+XFw2/wzLJMdug/?=
 =?us-ascii?Q?4jAFlLryWr156Bs5BAVMk4mCcKxxCgqHt1wbAXS8pJAUWuoT1THIvqB//nDi?=
 =?us-ascii?Q?FAjheJQ1XVXc+BJD5puGaZ6XZb3XjSSX5YOivOwRUPVJs1i4nnsRWZZpr6o7?=
 =?us-ascii?Q?aaFs/rANcKj8JvLfCqkFq95dAkhgQbgKBWidLvt5MFUlipD21Ugpc9zjKZ37?=
 =?us-ascii?Q?TpnYr2U7SFL5srRdBst17CHAKJZamSbZmW0oW3hLnssBjEeQfXFYBnnhP+82?=
 =?us-ascii?Q?TV9mpZ3/Qz/Ko8BOaFf8vy2STsxIPf1uWPxRgD9aEj+744Wcehio/ebIXuzP?=
 =?us-ascii?Q?CeJmvIEDkK05SMCiLK96jwf2NU4COPqmbFMC4LaoUxdmdAmGNOQZ2E6AbP8G?=
 =?us-ascii?Q?cfie963vpd81G9zsp07oJtmv1Kb4DdbntzJ+kA/bfujl8sQyxfpPeA6xruRd?=
 =?us-ascii?Q?1X17Yz0shfP+p1obMvbrnZE/wuapj7gN9FqXicAdjhn2cZ5UXPkxXwKiAQCs?=
 =?us-ascii?Q?zX04O40LEttSddt2LhL8CrsHpRk7eN/h0OleaLIe3TRVYRRy/RBoD1jPSQY3?=
 =?us-ascii?Q?N/VmWPlBzZF4im6u5f3+zzrw/r8Pd4VQB5jF/oh7KtM9avJ2/41lUhHci5x4?=
 =?us-ascii?Q?3heeoCEUo6xjOt3ibp9jeXPWwG++bWsdo/GMuW6W44k5Hajc6Sj8QaoX23to?=
 =?us-ascii?Q?VL5nI1NhI+8gSl4+53hlgcy9PIQjqLpITJskGYDBXXlswnvvlfkkD8CXgau0?=
 =?us-ascii?Q?8ibFZfVdMCWSnkBCbTboJ07ucyFYFKDMvKEz1K1OxisztfDV8I8jj2L9ilCh?=
 =?us-ascii?Q?z461FDqfqM1tl+9f4nYTmTq2q6j3tNww4PF/6JRj98gCvLKuOF3XroE4y1BS?=
 =?us-ascii?Q?veKLF52iGRRtambjejdBNSkkGB1CUKiopJQ7ZFfdCsmRE4g1SGOE4foC+8ow?=
 =?us-ascii?Q?Dur2MSeWR9LiPvpxUFtYCPOnOzulcHJG0pALpTICZyAg4z6xLicTxvXSU0GF?=
 =?us-ascii?Q?UsUTMoNpmQVsNOejxaaFGApMqpuGdF/609q5JaZUidt10I3aDbx6Tzof1+kV?=
 =?us-ascii?Q?RrBdma+b17CKQAtD4zhtFLjqvAMm4kq8zvGmtRr9cqLp/tiJLGyIJVNfaw4x?=
 =?us-ascii?Q?VDod6QjIgvA9Cd+WZnRtn81u2VNiapqr/CBUOjDU1cIYvDEK8HxFRVUTw7DM?=
 =?us-ascii?Q?FblH5GiEKftJ16hR6BCLTRsViGK9hA8rxqxScjw+W9nbKgTIPb1NvqJQbrLn?=
 =?us-ascii?Q?AR5i/tyva/uWS6l+E2kdx8GWx7nz7ZQiW8E8WH/EHwg9GOn3js9KxdUA4ZrU?=
 =?us-ascii?Q?XLuV+50PE54P4S9R1s4BqMLYptWZk2fmeleL8KGSiw97B75fRE+8W2txW7W+?=
 =?us-ascii?Q?ZczpnVkGeu37ljcpaWlV8u2Ti7eSJj24Irn4gmAegPLuQXnEExjrUKZo/WOB?=
 =?us-ascii?Q?vn0An8mp1EX+kusvGqFCf8s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acec2644-6530-4333-1177-08dd5606184c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:13.5083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GS3Mt4Dtr7qa7xHYhM7RZrLpEaMsKKaBxXOJmyd5xt57fnRHBvE891OoXWXaBNdFlpHIIxr1ehPPIX6ks6/j6RkwR20W0CeFuuvc6K274xF5qRUzGSrCS2ztVe5B7wvu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/rt274.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 4b6c02a40204..aa4be04753bc 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -178,7 +178,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->platforms = platform;
 	dl->num_platforms = 1;
 	dl->id = 0;
-	dl->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
 	dl->init = avs_rt274_codec_init;
 	dl->exit = avs_rt274_codec_exit;
 	dl->be_hw_params_fixup = avs_rt274_be_fixup;
-- 
2.43.0

