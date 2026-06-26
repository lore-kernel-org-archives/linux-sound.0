Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE4F3C9ECF
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 05:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452719; cv=fail; b=NW7h88Zjrqevt3AjMQHCqW8PEqISc2eOXHO3puaE1gTqu9HXVTiDg87CWI4mTrFXQAKLPrc6h/LNqbR8xfzKLHaFEZuuLfXXMUHu73cFoSoCmVrdAWEFuVhO2xSJzeLvxqOH4u0aEQk4SAWvpm6MqiVSqfzGfk+Wh94i1okSv2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452719; c=relaxed/simple;
	bh=bmr3P6cCgFB5uYxoSKaawdyCSUoYVWFuQLOmGQHSYVk=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=emIMfo2i82wT764Lsf7VDfH7tMjEMULlOWcBc/Wor0QUPX+P0XkUevgIvDMLL0PlLaSE6kaerLH+u+bWqLr1jLKa5kx31xg6Ezn52G7VLFoXXJz2qx1euy0GzkXwnCZGHg/OEndapuwmkCkw63bFY/HWHWU6VK54O42PYQA9/l8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IKI/9dB6; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IKI/9dB6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU1fxkABOSNQ00GWaSKJMq7ubH4xfzLQ9Lnwn+p9TY1dUSia00Aj+ws0QC8FpViXxosbIYz9Y0+2pGkLJG3YF2L6OJ242BGJPhfVrs4UgUVOsVEIVL5QBxBEgTCXbwF5t+r32HgR16exN58ubYWkrs46sbnInnKt6y7s7UETKcIEhcYxoq8fpdTh7fRAbR6MvmJxtgWE8gNZfs//peC3aLXNyWiI7qXgplbtHcgEq/6doLxH0D9gCO+j433PmQw14jMQANm+CMux/52kyEGQeGJgdW0xYkiMSRCrkF3bV5S54WchCiakj7AXE3kn62CnsCq67zfBCb43Onrvmv8KEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6Dn8GETC4uv0NJ5GId/7TRFS0Qg176WhuNtuYxgVno=;
 b=L+2uiy/5Asqki+DX1Ea/5IizhDCjuuxNVc3HJC3u74O1e9PR+/u59dUOrLdzYFe/tSCSGiNCXferNDihyo+xqDgRqkBmPfAwVjRsZW1/TBI0IY8E6nq/Ok527ik2kvMBkMaDoBVDfdJL/CDCqWIz0C0DDVmw8oEtjUYPRtV1GUQ8vdoM8RuABFS8EYyw81J9GOdfaSubM/sA4JA8TzRwHo3xcF0Z2hRNrRfkFa1+XorJS9tN7sG0pIvdUU2bjxeUaYuCGqQT5s9L/0g4s/sg/fzzgXDThZbOHmDwGaBceYVfklDbChAbtM8HMzPRDAD/jBXLBPX33T5Jcw4BGzBzBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6Dn8GETC4uv0NJ5GId/7TRFS0Qg176WhuNtuYxgVno=;
 b=IKI/9dB6DKvJPwAIqP4cYaDl/wDy63fpTZXarcLBwjXGMmFOvqLa/01YmECd7no+XmeLjSka0DTBwy/Yisy9gtIy6Y2FK713Z+OP18yQumOiQHdExzDiM0TLyn3+o5l0LNQdkAM3qximFQPUCALcxC3Xtte2ZTCjHDSOSkF54cA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6606.jpnprd01.prod.outlook.com (2603:1096:400:ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 05:45:15 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 05:45:15 +0000
Message-ID: <87ik75etxw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: sdw_utils: tidyup asoc_sdw_parse_sdw_endpoints()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <87ldc1etyp.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldc1etyp.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 05:45:15 +0000
X-ClientProxiedBy: TY4P286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e648eb-cc18-4301-e04a-08ded346191a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|23010399003|6133799003|56012099006|11063799006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	HI42QbV3FJKFPESJYh3Osn0hQ5OblNgswNj3M3D3HR2EXoBUvRR6Sr+MCUTTVtz7j6Ddfio5fuopWU0IaksAb9AcpCxA+59fJInGoNb8k6U/wd70bS3akn+4PpwZVFIwXzj7V41gw8mXEN9xJUuESyY/3aPET9eNbbquOp7JD8h2qegX2lW/0iDUNNhPTQOWlhlJN1K8UQyWIIAvb4FTPUXCUfRG6q1rZUkxCUfx1/P7m7+3yzZZm7JjkDpjFXSLj/e78A0VyNhTlgGIh5pNRK3E5UD4ANgDJJrmZmjEgcc2m74WXsu1xvevL9GcFcAjjpKGYM0PXzAxgqHa5o92x5TSR7V4NbJXMW4nr4AN159kGEhTDQFmzZOK2Bk5r8fY/FGz0c0+QDzc4TsRoxjnp3z1okwdbRWNuR/ABF70cF8g8y4TNLnUkOwUnhxNKPjtAAN3US2lU0x0dwwH1n2yVC7mroPbuZvKtUF9lr/0Iqx1qwA1+kn3+Dlst52Tbf4gPQCu6S457/kIw02VtB5xRWUJ8/toI2p5hhDiTZbMKudw59NpcFqFOmrlsZYkCDRbAPiWWMflrJn4I/WBwyia8K6wRiNWY1j2Iso14xh0gvvOadYzu1PkOqpcxA1OVDZmZep9uQjP2PnMrZrCwQFoaQB7Dh5kP2DzFDbynlFWdvP0J2xv1xAkd4IdPhLYynXZP/hXM6VjEp0AzR7ErrtZlH3BZuaFhUSfXZ357GD70p0TK1I3VEoNhqzMGNWoyPcy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(23010399003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lGQwkQxmJIaMF2rlkFbZQcmuTWVfib8esq6h/4NWmliZ10FC8Vnw6acCoNPH?=
 =?us-ascii?Q?3+M0KMM2Upb+DBEdozyvhH0hE+MKuA299SLNjLpraTs1e4ok2tyusE5xR8ma?=
 =?us-ascii?Q?BWmHABLgTwvaxgnvUbtgFbbgz+rumzlhHaSxF/cBceSqmQ3KoYX2ZkYNYZ5I?=
 =?us-ascii?Q?+BoLEmwwksGtUhTUpjNyWFVKmOHj4F+1yAtyqJCzXVnm6qak8vsaw57sFIRF?=
 =?us-ascii?Q?3Qc5SBPFJMRCdAKkuSbpUMRYcTW7b9epICh2pYJQYiXETiZeWUOmMwIoz9FE?=
 =?us-ascii?Q?SDtv2FwTiaZH71dHtFNY6T4GrZnLv1l6hLQs+Ai5UFo58hUA1CjCWcuxctQF?=
 =?us-ascii?Q?4ik8mpEjKPD25QA6STC+Io/0gq+LJUaj+yJ/q7KqJmyLCmP+VZLEyHXwmipf?=
 =?us-ascii?Q?F6Gmo0SsM1sX7hIdNRqXQ/cQNl/Vb+ABGcpwhOP8nP8Dof2YrxSYu0C+yfNT?=
 =?us-ascii?Q?E+7EGP4rm0JgV7xHHLHVCXthsAlMxKsz90K2TYTcCEucC+fuTy5i4FqCy3dT?=
 =?us-ascii?Q?OF/meSDYn6LhJL/CWyTJER8abcBBPa3FRMuifcrootFzF8oAa89SuzleKN4m?=
 =?us-ascii?Q?LBrz17YyL5kNb9uOziiWqXGs5SV698gnPXyjCEar1iJeO31FeWJ5pktKNUVV?=
 =?us-ascii?Q?I3lA9baD+swMo+o7bdMQGQGLVkq25S97Dn7DIe+XOyrIM1wwBw0iOtpuetGb?=
 =?us-ascii?Q?SHQdJkJ8KPt+UP3HXRbx5EKN+44d6z3VXg+bG3iqvIV7SEKlk2cVHEXeVSO+?=
 =?us-ascii?Q?lqUA4rL3bhbpYDXd1Vfn+0uZTrumUc9G3aGODWRgRpc6A7jPnp4B5h6P4Dzg?=
 =?us-ascii?Q?V4gGpCfULZvy0HUuebwpSptY68nxDcmNQ7ud/gTziqw6clmoggiZYDwP1iSO?=
 =?us-ascii?Q?dIb6SncIOW0L4UaUD0DlLgifIQuJAXCr8qJLPMC4BWwkohbxBe3LCWiVhRG+?=
 =?us-ascii?Q?yb6JdHZPDMZQ2u7xN3NjjdgoBNyPskjmrEol94Ju+5GBjHGzfGhDzrrr71/o?=
 =?us-ascii?Q?7yWntICjClepz/PLDyHyJZ8W/CL8zZvAsXyIzqUQ89oSlt7wabQdmI+cJShB?=
 =?us-ascii?Q?mOigkCbVdgr/ak+R9d8B/4prL+1Nn6xdJTQIstrB1llryw0z1PIBMSlOJXVf?=
 =?us-ascii?Q?UM0jH8cBDQJiE0yZ/+6G5DO0VfxQLJ0Nv0hjCz1eGyTsUOkOArgbyh8nS9cj?=
 =?us-ascii?Q?P7s+Vp2aWoFwOrw5QeiCYod5zXY809xr8Td4yqUWkFZuYwi+xlXdQ7InIkXe?=
 =?us-ascii?Q?IByF9573CgQz89V5mxkytTP1hVlazcywLodsMKBw43FMLZsrSN4UiKWfrcC3?=
 =?us-ascii?Q?G13jJubCBzWvwaP3ET1H5kMJ9CJomik+sy0j3OmhrqK/N7fTvJYPgTNFsEbz?=
 =?us-ascii?Q?Q6PM5jEgbIJhGvC0ZbsnyT240PuqivD+s6RzKF9wUFYYQ8lToBvXN4XkUZX9?=
 =?us-ascii?Q?aIteTLj2rFehYGaZ9IKm1NCpqhDp/Z9ZLDFMxQ2piWBy3oCWNYGugZel11J6?=
 =?us-ascii?Q?e4+AlGtlXZf6nNmbPBDdk6N07BnUfr4UsSYlXzcUaT6AOQzNZZNvyfNIl/me?=
 =?us-ascii?Q?dyEjszNPpdWBD0d3DSwA7MNCJ1P2JhEVDflYrr+cxuQzUCTR6NvGM8wWNFs+?=
 =?us-ascii?Q?IEu+w+Cb811xnYho2ETVbpXu5MnzXbN5T8oCrVOqQaxS68olZywLDSr7dxlJ?=
 =?us-ascii?Q?mY3QVetLZRXUXS22fIDVIydxqXRmKk1n5eGHcxJI9Xqp2xGKruKgAzvm6boU?=
 =?us-ascii?Q?D5GjiLHjcxadHnIrJc71O6hP9XUkLcEZrTrJSvB66QqVmVw70v2k?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e648eb-cc18-4301-e04a-08ded346191a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 05:45:15.6708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cO9nDCYd2/ToShiZN68xiiHP+X7BWKFcKcQLK6RW8MLl+UrRx84rn03O7i/xhOyXE9nB//oPBbZdb0Epc3Muah60dC3LR2P5jJuP0l1HelzV6gcuae4RQ9MIwh4pufw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6606

We can avoid to use *card. Tidyup it.

Current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc_sdw_utils.h           | 3 ++-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c    | 2 +-
 sound/soc/intel/boards/sof_sdw.c        | 2 +-
 sound/soc/sdw_utils/soc_sdw_utils.c     | 5 ++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 443d63dc6ea37..9b28e9aef4f1d 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -182,7 +182,8 @@ struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks
 					       const struct snd_soc_acpi_endpoint *new);
 int asoc_sdw_get_dai_type(u32 type);
 
-int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
+int asoc_sdw_parse_sdw_endpoints(struct device *dev,
+				 struct asoc_sdw_mc_private *ctx,
 				 struct snd_soc_aux_dev *soc_aux,
 				 struct asoc_sdw_dailink *soc_dais,
 				 struct asoc_sdw_endpoint *soc_ends,
diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index e8b6819cc4b45..9726a9d33ec6e 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -432,7 +432,7 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 	if (!soc_aux)
 		return -ENOMEM;
 
-	ret = asoc_sdw_parse_sdw_endpoints(card, soc_aux, soc_dais, soc_ends, &num_confs);
+	ret = asoc_sdw_parse_sdw_endpoints(dev, ctx, soc_aux, soc_dais, soc_ends, &num_confs);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index a423853f3a97d..963ce6fd40122 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -303,7 +303,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (!sof_aux)
 		return -ENOMEM;
 
-	ret = asoc_sdw_parse_sdw_endpoints(card, sof_aux, sof_dais, sof_ends, &num_devs);
+	ret = asoc_sdw_parse_sdw_endpoints(dev, ctx, sof_aux, sof_dais, sof_ends, &num_devs);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d43daf9b025df..24226a387cc2a 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1285,7 +1285,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_dai;
 	}
 
-	ret = asoc_sdw_parse_sdw_endpoints(card, sof_aux, sof_dais, sof_ends, &num_confs);
+	ret = asoc_sdw_parse_sdw_endpoints(dev, ctx, sof_aux, sof_dais, sof_ends, &num_confs);
 	if (ret < 0)
 		goto err_end;
 
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 073f3f9205a73..dd2cc57059d6a 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1976,14 +1976,13 @@ static int is_sdca_endpoint_present(struct device *dev,
 	return ret;
 }
 
-int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
+int asoc_sdw_parse_sdw_endpoints(struct device *dev,
+				 struct asoc_sdw_mc_private *ctx,
 				 struct snd_soc_aux_dev *soc_aux,
 				 struct asoc_sdw_dailink *soc_dais,
 				 struct asoc_sdw_endpoint *soc_ends,
 				 int *num_devs)
 {
-	struct device *dev = card->dev;
-	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link;
-- 
2.53.0

