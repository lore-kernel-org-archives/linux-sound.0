Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A559F37BE9C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304342; cv=fail; b=DitjqKYQ6Xz1l/nu/cXs2JhArkPaNMQcVYxWM+3W/Ml7q9v/raCtUTGTuGI7F51/3MMPNrDpJuf32HRWTsKGB8F1KY+n8QI1G03vYxboOcoEfYfL0S8liO3aUBHu+TX/uV2c09st9m5dSNRRBnYQFyuIqydbUd0YJpEYNuE8+Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304342; c=relaxed/simple;
	bh=n6GPIQ44EGeTeNsThbr+01URDBRwS4v71PIriDFluxk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nrR3jP3qKNHPZeb3ETHHhrVbv5iydvp5vAP5x+wzhW270hLieE21rGGb9Sg4MqYLEZPX/2pGpC4h2pVMYoizuDawDeGSdpY+B/UapZ9VXkNcKxGJ/V+smPiAfp7H02nNwqvWWXYnkdLR6nEDRsiEoTdqf1NIaMV3lbOqc7KXOqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=psi6SR+W; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="psi6SR+W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSklZYBwinH9cfjxG4Ar6z+kicqmQi36rhkI0TdGAngS7lz9Op9qu0rjswQkpLVxJpZYRCQZxt6TPHra43d3WpTuVkQ8QNYUgiCgHh3ol/QZi3c71+Sk5sLbDAwIsInH+uXr1teGiOO+HQp6QufuzT22i+G+vLnr6PCJHZ+MTWeVfgBvaQJ57ivpNE8pX4W/R1tWkAzkvwUejQFEYzxZ7iwJ3tcXJdReCN0XvNOYADSjWfvWLJwP4bRGqu1SSedpTPylLH3kOfn7dVJnkzWovOYaRk18QIv5kgIIo4ajNCcMZfdBwHDCw5iAr/2kToxDVf23vAWuyiEjP9fwNYY+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wh85RdHxr7t/B5e1b73hIGH9Yo+KoUdCKxjZeUflRGs=;
 b=S14DSuC9jlf459WSN1U8f2BOwMnVOup1XqE/Aiuggw0K6eFNBXc8N7ULaTQWPjYkt/TUES3+LXqrBM90vAizG6J9HnSljHp8Tbx6D4LRh8W11MbJ4S8p+cSJkiXKA0HzqHJHK6SftqC16YJl9DuaSwf1XXmRRWEpCFbWF3+42pK4ahsCSjUvu2iC4c8+gp6rU0pNbuDs4i6Creak7jJH9wDmoETqB1CP6mdpe5WAuNIvMkNsh/Eg1glhY5b2ph8f1hOlpXLh0TGD5LUbUNdlZMtdTiDIQ58f29Wp3s5v0eBA8D+ybI2wF/YpXljZ0+N+jKCLB2F1caH4aseeVMh2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wh85RdHxr7t/B5e1b73hIGH9Yo+KoUdCKxjZeUflRGs=;
 b=psi6SR+W9v9CzJigeYh0T/eAziF7yI1UKSZpDM4kNspqGsC2LQNbDDRYBgYuRSHz82E4O4AAIhkRN4lOULmVKaoHPiczXPzG61t3I+r9+1601PCIJD54mhi1XNp5/BednPRsz09ye2/jtnpD+kjIVah5DdRKj1piVW9XkWwCqVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6963.jpnprd01.prod.outlook.com (2603:1096:400:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 02:18:58 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:18:58 +0000
Message-ID: <87a4s4c12m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend v2 4/4] ASoC: spacemit: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Kirill Marinushkin <k.marinushkin@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
In-Reply-To: <87fr1wc13y.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr1wc13y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:18:58 +0000
X-ClientProxiedBy: TY4PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: dd858726-e62b-4c00-6491-08dedb04efad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|366016|1800799024|38350700014|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	fOtF6wBOQHBUsvIYVLRBd2XkUw8jfY30UVT4qluddP4AtXxOlOkLPG/k6P1fOpWxaQQHI3O7S2HoBAeQr4g/VLv1d68VJ7aCMN9Vw5Qj//zrCesGobyeXd8+zOl6THi6zECavOEyeG/f64nb3ArLh3L5uX1emdVawct8gEmPyxm4SQjLFM00cIYnTxmDkV4oyBM/zRqGreTqAIfmCVLABUGvHL8WQf2OvzJC+sOLCucE20mF2RKhr/o4IRuxt703X/+jI8jqcfMAFF05bPmf0oo/znb9MGfzSYdLSmAAp335s2clZO8DD5xWmNl63Xsc13wGs6aJbnMqR+hfCYLUe5vB3C2aGJsMx5M66zBKnjKs5LbbXsE82PFOt+AUmlvK6jOqXWs8GThFaLcr43XcFdfpfPIoqSpudg2Fl6+80Xtcjky2tQwNFgyHufygvG1i0O3b54DeiOMzheugAVdQi2aEgQp32Ybwm19pFA3+W42O5wAi8jUGzPKARgHDVHct8XvfHln9naFAe1t7B7aBWcTKYXMLU4LESqGIAkWNp7Ry0cuENEk6YJhSJz6cMJ+mPMAFhCbjmoz2p3SRJQtstNHEReL8xEGEXM1j9RIXIv8rkn3gBYFR2DY2dbmZ+dTKvnLBSid7WcOEwmv0zwyM34KJMhnfMhHe43vL9P8uIFNR74F/m/BP47L37a4/HTXAbJEWtMMbycNAtofByIHof4UKykmVD9QIEXHxte0WQ+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VS/W74Imnu0TCauUHxlwjweXqB08lD8ZD07WZ2O8f3Gta3mjFSLzF4IcJjdH?=
 =?us-ascii?Q?V4h3DM24VOhROA1Pnw0nEG8Mglc0OLYCRwvBJxlfMUsd5o46k2eVXzXgmtBq?=
 =?us-ascii?Q?Ab9iyjcWfG8/9X6U5atFR8s5Q3xHdblz/vn6AklGy1L2PwZd1piAqhPlXjUT?=
 =?us-ascii?Q?UK7AVhEUk2kpMZB3Uy7KRm00DUbSkyn0pcsBhw4OFJiVUmRN8QVevXBFNqBg?=
 =?us-ascii?Q?4r0WVW2r5svARZ/wwDowWnxrXkKEW3n7+moc+g4Yn5c1cqFOxtwpYtUgWBlX?=
 =?us-ascii?Q?VPzijWUOao6pzEqXBvmHFmrBy4OyZ3EKQ/hAQy0Gtkioz6AjjcwMtRmliZV0?=
 =?us-ascii?Q?cLhppy/lKW7tl0gUEOFkORMsFfIk7yJHIo0BE7SfiAiFi6Jh1RLMev/6mjPQ?=
 =?us-ascii?Q?HEf+/fBBqiugXxXvodv/XsGk6wUVZu2tSGwM+ygNwizBpcDuSWcH5NuvaL7C?=
 =?us-ascii?Q?NnhNFnb2v3f9fZryqFiuRKje2/e7fpPofpbBh9NBnaNVtCAjQCVp80F79mN+?=
 =?us-ascii?Q?mBreUCpP4p/Dr5kSEy+w96fV2M0v937WAlzqj9sQ7fF1iUJpnd+dbWaICQEv?=
 =?us-ascii?Q?vMUS2V9YqOxBMZB7VPTxeXaPlk75WyOew26t5K6gqr4e5t+a87ffbYBzBBiT?=
 =?us-ascii?Q?jgCTqY6y0+moqsLdILFe74sorWOmKKSPIfFFB7zDznDzhuZOGRTmujI/y3IZ?=
 =?us-ascii?Q?cSi9JT1qCJ8yfoJXRfPnLiNKL5bebII6A/vteuh1KQQ3DwfvyUrlhpAM28qp?=
 =?us-ascii?Q?SYw1fl6TUsIxAj10rTT/YjcZjgNmSSw5RsNEiw0XDLx+BWgT9jN7S6BGdsCR?=
 =?us-ascii?Q?sFX8D32jUk343vJkRtWW4iJ0jvWCgdl2WCagsG7WIQAcXOgiggCTW79hEYgA?=
 =?us-ascii?Q?o2nfstE7i5PFsZQweXwxOZjfDgQ6hHoBA9XGONueNILZUn4bPmUl50cxyMSh?=
 =?us-ascii?Q?YWZy5kSjF7ULfopND/nme81jhdxsQSWVDm9cemgC3zCf/5CYsdAR4fR71y7S?=
 =?us-ascii?Q?0xAiVm6t8QTQfWpzJKXw+YWWgT1rqgq2S0yjiI13XGOOvtti9w9ZMpY+eBJ7?=
 =?us-ascii?Q?1SsHFm+ryMYT5Bfwoc61ldWKBByhI3tPPTPyWNUntDsk6M7nEBZDUAwT5jue?=
 =?us-ascii?Q?rtinT+9QabQP0GfPmQ4prblPmgoHMP3Bnkj97GN7CUmy7PxDPo/Jbci7ulcB?=
 =?us-ascii?Q?dO3lAHR1Nkx7Nc4MwhyqwzVlQ70y/oVNQBR/S5LObfndVhGU5Dz/T5u2ASHb?=
 =?us-ascii?Q?k0HGrsnj3mc2ohpLOZSQRFTeg7Fh+xRVlj6WgsudrfTfuQY1VnADnZ0np0Vs?=
 =?us-ascii?Q?cgpDGnBdqjz60r9P1rP/2c7p30ZxmEBvC0fxfzdiVEiaF/ry4COLP/ZZNR3+?=
 =?us-ascii?Q?Udg4EFLelE/+KRffqdztPYmgGAToOTPXKqnK+DqMfTRAmoytHxXTrYf1N9DA?=
 =?us-ascii?Q?ULNB5NpVDbl0XQQtQ/L6eKAo6NdfREZekcOq0Pgvn7z6a4POu2gPkZQubjCJ?=
 =?us-ascii?Q?HVKl+mlE75yYdlpfVV2F6ybs9pqBPvOuXj1FraqvbT5j6Szljxvj4B5RytfQ?=
 =?us-ascii?Q?tObSPpwSPqguoEHDFPqihhc2vkUkOBktGoJl0S2kGe5P3UMndQFjctF0s1Lj?=
 =?us-ascii?Q?+TEZKdedfDqLUbQMEDRMhIZCTBTMVEHCy40sWqEEQnU3B91HTI1LXoOLr7u9?=
 =?us-ascii?Q?gShbI+PWFSzcvk9Cc0LHNCJsCG7UoKTL5PbVSmPBhK+njUvDhcJhIs8q7uoV?=
 =?us-ascii?Q?OssFKj766vMuzoVzR4kzMo0p10aVg1yVWSpLOcBrURPIcaqNArFn?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd858726-e62b-4c00-6491-08dedb04efad
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:18:58.4117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFCOo08GMqaFRF2HCryErypzOoiTbOWIw+up3JV84MK9m2HI1O5iO3n1BtlcNce3mTOqL7RwH0sskFRtbY+ETNr4yNp5audJ0sfPCS6X48Qg5ngjJxEZLPfklfJZMsdg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6963

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/spacemit/k1_i2s.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 8871fc15b29cc..cd461f2aa7567 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -335,6 +335,11 @@ static int spacemit_i2s_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 spacemit_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 	.probe = spacemit_i2s_dai_probe,
 	.remove = spacemit_i2s_dai_remove,
@@ -343,6 +348,8 @@ static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 	.set_sysclk = spacemit_i2s_set_sysclk,
 	.set_fmt = spacemit_i2s_set_fmt,
 	.trigger = spacemit_i2s_trigger,
+	.auto_selectable_formats = &spacemit_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver spacemit_i2s_dai = {
-- 
2.53.0

