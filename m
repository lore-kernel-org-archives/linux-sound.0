Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44EF25DAFE
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 23:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740612404; cv=fail; b=Quxq1VN2Kx6lbkEVsQcGdOhOBtBE3yBlgryax0sWb10KQFeZZBm0+rIoKq2YCbLmdJDVunC+fVhNArymZf0tPPNTU+beR6hyma7BIsMxLb4RDWOFKNxCAJPWA/kuTn7uzo0HesV5wezlc0dEmnM5BVD9l9ga1SzJEtdLT7lin5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740612404; c=relaxed/simple;
	bh=B6XIv9MHhLkZ4xEgKXZdKZuLUxHKWgCBI2667FzHL7U=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=mKP8M7SSJkRoXPd1qbivqhHZQtAyJoBRsSFBcrkCBcldlibr8lsYjT2bs0lwbfh3z6Uvh71d6+ZndFuHduOnGYXQqPuXUpDcNze4r1LH1dqhNUuWUX82LyArmybKP2PRZMCJknWigGD12IJrbhCeSz07dDooOWmakskiVdXKa2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DkAOBt07; arc=fail smtp.client-ip=52.101.229.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DkAOBt07"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifNH2tHv2GvfZACTqzu/u9AWhWGahrrUC4bufbLf7DFS/p1xdvFkZjtI7r08J2qtYQPuKgeNQaalWH4HHEvlc2vixKuOTpV1QVXmqy+VszXSjnpgRd7kqT4EVVHe9ODwSjvAGpkul4OA2dpiP6KBBjDtHaCfkbrRvSLDudJpcCbzZDSjSk7gqWuKzI6WdjTrKGcZ6tXofmsyVBghgvxN6msaNS/rxpegjmRkrSGcbc4C+F6HuBmAqpagWGsAGdlpAbd1D2nspDzlXwTLVXHrJPhTHZXb7b8TAioFtZfB6nf69qdFpeJdFZLZRoHx4Y65DOUVFSR2/WXr/uEBgGLVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWtJxnBAnh0xqP4WNyObV7+gbVZCaCof9y3YEYKNJMk=;
 b=HBGgXxnjRW+pEogr4HU1O/s31qhLoNdY1CBFeb2WAy9t6p290+FoSLwrJQ7a21Akzg3nlSVsKmF9A1L7p05N30nLr7JLYsfatcUs2bYD9j0zQ3uQUsDIYlubpRa//9Ii7PVEBS08os8rgmf+O5yAm7dKS7f0fPAfZUUisBwVgUdfXPn7pULXu/Ek1tkJ7izdDaEQS6G2TaIqdu4XIUWS44GwrvXKzdxLAvDzi03A+6tKvd0QLZSpFVNllxgAwcbCDUXoKUz/dKqXQR8slJ2y0C4pnKx16DW7piO9D9wuqOFMKsG1Ca9uhITxMq+SPlIxEjRm1velT+ls1BFEeOiHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWtJxnBAnh0xqP4WNyObV7+gbVZCaCof9y3YEYKNJMk=;
 b=DkAOBt073dStkVxXNFN8rBl6Df5x1Q66sPEAcYJUSVyBdw6eauKYQYy5LhaM/IMVb98lxmwfE1OnwPBKVkXQK8ws4okpm7Tqzz+w6bzYKwkeiXNcqtR1i99VD4AeoND//YNDvDvWq57ulkq7j1nMdlM9DK6JTkA6puivy20V5EQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8688.jpnprd01.prod.outlook.com
 (2603:1096:604:1c4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 23:26:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 23:26:39 +0000
Message-ID: <87cyf4qocw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: hdmi-codec: use RTD ID instead of DAI ID for ELD entry
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 23:26:39 +0000
X-ClientProxiedBy: TYCPR01CA0163.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: f7832847-b6c2-4b51-6b31-08dd56bd0537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/rU/TukTzdBDd5tc0FO5Q0cgy9Az7BbfF05Bei9xLSvojWcDwR2ddZBMsszS?=
 =?us-ascii?Q?b5x2glVJ8P1l6tHLLWL5wop4MszfmpmxW6JRdsFuhQWuaShrpq5K2n1j2vZo?=
 =?us-ascii?Q?O9QH7f9fjxNOrclKBWiWISXCe0deyuWUK0wxEX2yCTZTNgOxq2EXUrv+aTCb?=
 =?us-ascii?Q?4LwFRRNOKboouOVDPhci12Xdnl1dJ8H7DLz1SgrqXDlSd6aPL2pll1vXwH+E?=
 =?us-ascii?Q?Tm+8oQ36/FC4/g4p6rdzCvqlPIU5uwpAF32byYcgZoV/OfU372kATPZI1Ro4?=
 =?us-ascii?Q?uR9bPKuYriO6bbj/VlyAF9art9DFVp/Lo8JuL68wZaFvIOIFV1JGXVOsda4G?=
 =?us-ascii?Q?YxO+JiIrS1SbZrkH3SpE2iw3rkgVY8rrRCgPqbKn4V4XcELqK/bmh/FxzT+9?=
 =?us-ascii?Q?6mtO1r4p4kwgyUAKLBg/LxYt8ScjGmGalJ4FkMF30rkNrw0OfQsP7x793JRX?=
 =?us-ascii?Q?tcVAfOmSzlG6eC1ysYu3+Xmcw/A0AGpHBDzEqK2xyU95bw+kMBN9v/L/RI53?=
 =?us-ascii?Q?hCII6PmrwCpD/QE93nsk6LJtmo39M7NH8dvKatP1J8Iz0iZwOVxXU8DDLHbI?=
 =?us-ascii?Q?Cn+VIurWh2X40Myf8Vf4Vr56Q6/z7vhHWVLV5szYlylwpr8ZttaLjW25F+zS?=
 =?us-ascii?Q?EJk/1PLYoDEx1Tk7bLS+UqkuVO+w0BUBAB0jo3K+Dea/LDUz8ewHx2C5nEVM?=
 =?us-ascii?Q?oPS0DbgZEGzFsKwsVhu/Z0mQUCfkp5AiDsfFRYm2Dpu2ZclD74oqO8z1lKCJ?=
 =?us-ascii?Q?p3vbX1edPNsmgRK7bpQ+cGgZ2MFNmfVKqZX/2hyz70Gs91HmTbXTZFPCiiQ9?=
 =?us-ascii?Q?WtapKauuV2FFJ8OnUS3hI+2gfY7C6twZEEBnhzCB7YJBFIl/nwpZxRz8JYSt?=
 =?us-ascii?Q?KdK2ld+pD3JMaIgOOJpR5YmAKDU12HO+AD5T9L0ualJLlQoDcaMyLwg7O2HV?=
 =?us-ascii?Q?o/7ifm+L1AvNYahsSn7L6fFaL9A9bbux+GqprWIIdqHimx2M0RH4+HVAxoxa?=
 =?us-ascii?Q?1uxmSH6Z/rvQ3ZYI2Pb/rcZcThziXEPpQ8hda8yF3gAee+850J0cvXKWpWgF?=
 =?us-ascii?Q?cmBtZP6DCkRa6Z7HDb9tZ2ORvZ7MKG+Fgt1GgQ2kyUBLeDN1FUlz+MOxf/Sg?=
 =?us-ascii?Q?UWRGu0iAXQQVyrSlU1rhjmH76Lj4LO3bZ6qYJrurjsQLUANDgMy1YCWYzEFM?=
 =?us-ascii?Q?VQSub2pYPXrUVBEwTbKrV2kmexXuJED/7HgtD/GJlAs2pBWTfGBd5uMHSxYe?=
 =?us-ascii?Q?wLLNO6w2zFMIPN4im34uLVf66PmYegAKc1WYMAWD2TKHdBrVrZtOincLQErw?=
 =?us-ascii?Q?/oXTc3Wlc6p8zLVOER02D1fyJqf1mN0DA925UJaD21U3QOtjYMP+i7+lA+cC?=
 =?us-ascii?Q?pF6vAdShf0Gw/BGytst59XggT7qSGulq/EMAKGgsf9d9shz46C1JmiugZkFE?=
 =?us-ascii?Q?GhJulrM41Gvy2qGPs3lIQPR8p/WCVAB+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JPIJKXnKLI9aHIE1NnAFjPjokppRAdJiKemiyc3Lqz0/Ew/mYJQ+mga+XHB6?=
 =?us-ascii?Q?L85NN6OtrWL9Ml07/q+P44mRCIiJb8YgBDvKxA/tKiM9pbpZRSKbs+YiUwXC?=
 =?us-ascii?Q?c445mSDTrNeRhpNrdleXkyNSpasayb7D6IWwfGBsmLp1NRqYZF5/ecfQqXr/?=
 =?us-ascii?Q?LNEdgS6r/l19vKqqac5ISIjq2WuYWnKVpIC98j901YQnY5drB8sCOUi6I7D8?=
 =?us-ascii?Q?e505S3xYee+32RVlvhE82wf2TjIvkAHS+cAaQANDTOID5xpIl5v3f+xUI1gT?=
 =?us-ascii?Q?JzDZjbR1og6BWwCM/MT9HFlaq1iz5hOtLZimtDXFx2I//1Q5nk4VjiiqWNuL?=
 =?us-ascii?Q?QNnXm3T51XxYgayuFxueZPw4Rf24uGZMQhbdxB7Mk5KDljp943iRU46Tv3Ka?=
 =?us-ascii?Q?xmD1cm7BOEY9btJW6o4utuuO0DHWAoiiuzbMIhWLooMvfZthcfgYjZWphvfU?=
 =?us-ascii?Q?nxnouJ6TxYc3CptaamrwM+rx1pI50s5NK2NcaVugU91EJ2ZVeJ86OhrNLtOt?=
 =?us-ascii?Q?mRWlwWKvISpclKFolCrsGtFXmyMoNQPvOWI6wfH01TaGSS/i60zM2P2rfk8C?=
 =?us-ascii?Q?VtGyBw0pud89yDRF8lgN6fFp7gZgxMRxS3jrYK4yCMXQaFeAsYDy+YyTi/ZO?=
 =?us-ascii?Q?cVosB/+RroDhsJrcQbqYDsR2QKxANBp3Lwwq13ILaqHRQfjc+l3BTWcDdhFk?=
 =?us-ascii?Q?8oXpMKJFZOQmxasuiMtJ/nT+bGwXy6NSrQdhuf4JZghfzPRMJQYq4nQsrwoM?=
 =?us-ascii?Q?BkvKDFILfHaMLuPM275j7+6cApqjAL8aN0FuZXyTmVRAiP//DnmshS39O5hr?=
 =?us-ascii?Q?gbkCZe2RhU9jIq9iHQGMN6lyMGk3FAfy4k1Usw4hzat45lUeYc/BBUFPnJRw?=
 =?us-ascii?Q?n9KEv2VLKr7yz7T3ZQSgzHe9eHegPKPpB7cH6pWoiuxIy/l/4qzjbSCso7k7?=
 =?us-ascii?Q?/ZNnFTB9UA+08BzhQvdZAWC7FGXuvqRRhNbvPqFimC1Uu/LFglkvv3GeV1Ou?=
 =?us-ascii?Q?PhPxK/+AYqd39cif8Pks553N4YZ1WzhWBTTb46m2bMUzqw3k8+0vhHzMuu3K?=
 =?us-ascii?Q?tx48DDjS6Orj8+lOR4jbb9yUtdBF8zmbWFAKDrVPBuBEEJPP8Ki+X+VKTRFi?=
 =?us-ascii?Q?CuU9g0fwkzQKRYE2xzETYNDDA+ZzrMOXQyolsnhJxjxQxJOpfqHqx5yVR4W5?=
 =?us-ascii?Q?9onth0vPCR7cCtkUC59rZc9a8OF6QIpG9idIqSegyqlG0ES+iSldYF7F1TNg?=
 =?us-ascii?Q?XC7lP+mu/nIFXEYbHsK8Fd7ceFqdcYoW7n5WwWQefvhVFHfIPGBSCjDJ3P2Y?=
 =?us-ascii?Q?9zSiNyXfBvxvMo7Jy78bXPbFxRNk8sx0/WR8xyr6UH1Yyer1yQiknVXg0ADK?=
 =?us-ascii?Q?p9o2mZkBdi4xlsmAailvF1LJa7GHiTOsjoXsH8Kdc5mCjJGsfSVrB2kitBU+?=
 =?us-ascii?Q?RFSy1M0GbkEWYFlO3AYkg2il3ArJ3Kwznla7UoPFUPlaGp/5E1Kyc9rkwx33?=
 =?us-ascii?Q?7QCUvTrBuVFJs25LUKdLKQzcqjSCE45S3KbNc66j8ORoZGZn4YLQLRLaUGq+?=
 =?us-ascii?Q?uchLcp4gY94YHbxs5yKErr0hV1vi3QdSI7lhLEijghmZu8BWoPFsJKe39xAE?=
 =?us-ascii?Q?eOv5LgV4VJjuaAsUHacNZKE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7832847-b6c2-4b51-6b31-08dd56bd0537
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 23:26:39.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwgdtLsosEeJEz7SnkZHY/zLnC++kqdATTvTEU0FyAwDXJZVwc183WimokR+qoBtyAN+QrAP3qtktk5sZ+fm0NjPmyZAtxFc/JfEi/ZHNu0ltrqxUI5jujAplzrD4jNp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8688

commit 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs") adds
"eld#%d" entry for sound proc. It is using DAI ID. But it is possible to
have duplicate DAI ID on same Sound Card. In such case, we will get below
error. To avoid duplicate entry name, use RTD ID instead of DAI ID.

	proc_dir_entry 'card0/eld#0' already registered
	WARNING: CPU: 3 PID: 74 at fs/proc/generic.c:377 proc_register+0x11c/0x1a4
	Modules linked in:
	CPU: 3 UID: 0 PID: 74 Comm: kworker/u33:5 Not tainted 6.14.0-rc1-next-20250206-arm64-renesas #174
	Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
	Workqueue: events_unbound deferred_probe_work_func
	pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	pc : proc_register+0x11c/0x1a4
	ata1: SATA link down (SStatus 0 SControl 300)
	lr : proc_register+0x11c/0x1a4
	sp : ffff8000847db880
	x29: ffff8000847db880 x28: 0000000000000000 x27: ffff0004c3403c98
	x26: 0000000000000005 x25: ffff0004c14b03e4 x24: 0000000000000005
	x23: ffff0004c361adb8 x22: ffff800082f24860 x21: ffff0004c361ad00
	x20: ffff0004c14b0300 x19: ffff0004c14b02c0 x18: 00000000ffffffff
	x17: 0000000000000000 x16: 00400034b5503510 x15: ffff8001047db447
	x14: 0000000000000000 x13: 6465726574736967 x12: ffff800082e66d30
	x11: 000000000000028e x10: ffff800082e66d30 x9 : 00000000ffffefff
	x8 : ffff800082ebed30 x7 : 0000000000017fe8 x6 : 0000000000000000
	x5 : 80000000fffff000 x4 : 0000000000000000 x3 : 0000000000000000
	x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0004c15b3600
	Call trace:
	 proc_register+0x11c/0x1a4 (P)
	 proc_create_data+0x3c/0x60
	 snd_info_register+0xd0/0x130
	 snd_info_register+0x30/0x130
	 snd_info_card_register+0x1c/0xbc
	 snd_card_register+0x194/0x1ec
	 snd_soc_bind_card+0x7f8/0xad0
	 snd_soc_register_card+0xe8/0xfc
	 devm_snd_soc_register_card+0x48/0x98
	 audio_graph_parse_of+0x1c4/0x1f8
	 graph_probe+0x6c/0x80
	...

Fixes: 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs")
Reported-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Acked-by: Mark Brown <broonie@kernel.org>
---
v1 -> v2
	- tidyup Subject
	- add Fixes tag
	- Separate from patch-set

 sound/soc/codecs/hdmi-codec.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 17019b1d680b..bc01ff65bd6f 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -842,12 +842,28 @@ static void print_eld_info(struct snd_info_entry *entry,
 static int hdmi_dai_proc_new(struct hdmi_codec_priv *hcp,
 			     struct snd_soc_dai *dai)
 {
+	struct snd_soc_component *component = dai->component;
+	struct snd_soc_card *card = component->card;
+	struct snd_soc_dai *d;
+	struct snd_soc_pcm_runtime *rtd;
 	struct snd_info_entry *entry;
 	char name[32];
-	int err;
+	int err, i, id = 0;
 
-	snprintf(name, sizeof(name), "eld#%d", dai->id);
-	err = snd_card_proc_new(dai->component->card->snd_card, name, &entry);
+	/*
+	 * To avoid duplicate proc entry, find its rtd and use rtd->id
+	 * instead of dai->id
+	 */
+	for_each_card_rtds(card, rtd) {
+		for_each_rtd_dais(rtd, i, d)
+			if (d == dai) {
+				id = rtd->id;
+				goto found;
+			}
+	}
+found:
+	snprintf(name, sizeof(name), "eld#%d", id);
+	err = snd_card_proc_new(card->snd_card, name, &entry);
 	if (err < 0)
 		return err;
 
-- 
2.43.0

