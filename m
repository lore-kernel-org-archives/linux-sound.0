Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAD2155326
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 05:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777475; cv=fail; b=Uz7P64WejK2h4OgpP5VOvVuDqtMf6nR/yF0wCNKv/N4B+gWI3JdUufLtpFKVCthDMgdbQiSVslDJ38esSnRTomWMOPSBV+PDP2qzhC+W8FQ2AaZfBCF12Ec3tMpKuFAn8tEV+DR3V+Fd/edKGYjXNDerzNCmsOuE5r/mU+wYkVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777475; c=relaxed/simple;
	bh=vXIH1LNMQ8aQLKz5a1g2Y1UJqHalFlBvavr9D1/LsSA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MLLIJtdMAuLdDg4z6hxSTqu+F9xXK5RHJm6dS9PiBGN2DOLDUXwy8UJj6OeodVAeVeyYMgpXfTlKsDXQbDffn91JD1BS4zV8rj7xbCtrRb7tDsvpsgqtpiY5girLhzmRjnrYg7QfWZkVW6k6ASOzgst4BADqWRCJ6uJBgTLr+0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KSf3I0RM; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KSf3I0RM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2SHoJt/a1i4sHzc+hEPt0ryYd7ycQFzoXZueQefqHzsJTvhU5PUzGoPfQNm5QJ/IKZdiXaVDh3orZ0U2kp2eoIgQ6Jt/bhcT4QRFLYoDhyuSc5E66bhzMeSITB3tOiBjA6wm9y4Ww7imPglAm2zFueisKRSKIX/hJIhn0cpJ6LyBX00BYbaGRIxmsOHQJpgdP4CD/3Jui0/h1SU3PD/2V/3FxB+p/IDgBsftw0InlJhkgZ7eX3BgevlSzKqbxEeNOjqoBB3QO6+RfICaD34Wwy34vM/plqnTka+VqkEbP55dF2FFPNgaxD3m+GvpzP1UVrgOu7+ltb9OdFSY6q24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BA3OyAB9cqqDMdbO8c0azFEPjifG7uBW1IPh6VEUCv8=;
 b=JlPDPa4+dzDX5+h1aKSVbmsROPEMOkKDMcUip5+mwtfQLfpPV/viZ3dpshpZIBvvK7q/D82xnCX30xG0tZYvFsKbBRrVwbcWJ6udiVb1xdXvEbpSVETO9iMh5f7VPhqNx8EevqTZxeTV/T15TK0q8dBwtRNjYkyz6V1X1N4eXsWabzdR6p+tRXp0Ewz1hICi4FTFrFqRGVmM2el4ILvM2swThzSVSE1MnSitNwgxCbWo31ykOmP2z5RuDhPUKjPX+EQblEPaQb2atg4GisYYiPU8w8FizROl0Dm18ubXqrbE1VTH1sfivyp+/9r0C9K8DYLfn61s+YG9Rpx2rfatYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BA3OyAB9cqqDMdbO8c0azFEPjifG7uBW1IPh6VEUCv8=;
 b=KSf3I0RMVotfa+aIr7JIvTQc41SBIfdOErVGNmIBllE7Dt5jwT9fyHxdPlY16L/4XjowR+wNo2SdCP3mQaFP/qVk0FaClQylJwcyBgxvmW4YcfTuUiL4Csy5EVTz3+GHEUWurinKQ5ACAX4pYnD2nnkMPPYds2xsLAbXSXuKKoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15474.jpnprd01.prod.outlook.com
 (2603:1096:405:274::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 05:17:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:17:48 +0000
Message-ID: <874isryutg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 8/8] ASoC: renesas: msiof: ignore 1st FSERR
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
References: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 05:17:47 +0000
X-ClientProxiedBy: TYCP286CA0181.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15474:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3d6c11-62fa-410f-d19c-08ddfbf2ddc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Vp0A3edlhuhLUldKtf5y5RjAYBKHoUFpAtkjFL6Rwt2eVpHFwRHnA6tymEU?=
 =?us-ascii?Q?2WmrspWCljv0Yg9PzPr1+c89CstmV5tdcQJ3MCbqDiYo6zLgcVWUEVMttfvv?=
 =?us-ascii?Q?TjK5rRP0wewn8xJRKoV7+NvDRLlA73CCJfjRRj6kbz96GDensnmpZpsv1RNG?=
 =?us-ascii?Q?3KEvbK0TYl1uBwaAjt7QxKVL6AnuJq4SOScDgybSyRlt662NwCo5SeHwfPky?=
 =?us-ascii?Q?EGbPdlQhYr5fN6D6qZss0MCRlkSbnzaGl71yJlJqb8Lw2smTaV1aDkFZpfts?=
 =?us-ascii?Q?ivTfONJ69ZzK80LZlj8hBoosjwhU8LkZro6NJwALA2dKq4BG5PedflKUz2IK?=
 =?us-ascii?Q?ZucX7/tUTdDDpaVHaPTrDhHlCgOdJ0QoABaqLECuiMC8ZyEOYSugnSDPvxAq?=
 =?us-ascii?Q?LhAk8yMCLaVGRbKX/9vMzjgkKFJDIRhXolnbnyK/iMdTK7+Bhm9dhgpvMM8S?=
 =?us-ascii?Q?xN3ErDSRFjljfXSEbjVRNqtmi93R4npi6So4YawAaApfl/5tC5cS8Ci7ydf7?=
 =?us-ascii?Q?vntsaVVHg0BUsa7lJYxQ9mMFc05UIwlFBBEpmOtrLnFu5HQzOMHBrwdPAOxP?=
 =?us-ascii?Q?gUck+i9o05cClQHbw5s5vDWDh66abvUL5BbrFtgxD4U2b2FQ1ElvKpDtUeOc?=
 =?us-ascii?Q?3Pzuc2903CuKQJiUPUvaDfx/BbR3NCvCOhZVabawwDxtvd+cGRKfz3aB/lNy?=
 =?us-ascii?Q?kYx1+bDoNSavHjsETKiPWKW0g5b5zo8P7CzeRVlN2VqucXvBpji3MEmL80fx?=
 =?us-ascii?Q?t1d9MfDSE8+v10V3Y4b7am+WPqtLemfXpxePDY/hfntE90MyFphVy0Y71Y90?=
 =?us-ascii?Q?sNGJGrXTmdH7yefMW744pF8Cg+9sD9DTX/itxEES+BrBee9AmzFRvbtSUPAj?=
 =?us-ascii?Q?Uto1GFSSJiQ3PoqR3jB9MNCO32ZUZzzt6eKYfvNDdWWFuAKjiMDd1SGjz0BA?=
 =?us-ascii?Q?Svyx5yhm2Wl5qUw+v2r05xGUz9dQ/6/dqQ8y/os/PWtX4pWt9RAhahugZHOa?=
 =?us-ascii?Q?ZTeQQrE1gZhcLaLhnab7a05F/CgMJMR1EhHkUc/MuJP2Ms8Clfxf7esJo1+o?=
 =?us-ascii?Q?aFjcijlarUZUiRccU0ugQ4SJzKpGkd+npXK2cR9V5FATBP9XnQrhMh6ntQ42?=
 =?us-ascii?Q?SKScrTxI5puwX7Up/WtDk3+aCZA2ysduU2tmMB5AwYBhbMHtNaZgyjO2+AZs?=
 =?us-ascii?Q?tkPB2tzSATAoYc6hi6xEeO/TUz5KiSMJ0W6zUVKD+I2rohHgilOUzobEHjgm?=
 =?us-ascii?Q?C4T/JWmtagfJL6GMzlugOqNDUr0yNKNjbV/ZRhsVK0xiHmVuHg0i5JRwONKa?=
 =?us-ascii?Q?xwYFRAs9upcygRnONPrLYcqC8CzmbkYPecuaN3MZPoKttvPlPdvvtBpZbIh8?=
 =?us-ascii?Q?9Td00JQL+PjKFGY5/eR4EUtnWIIGgFgO5Ce/vxrfo+iILfe+5bB60Y/7Tvuu?=
 =?us-ascii?Q?fU7xUOy1Id2MakewBoZ0t8GyIU2sqin8CR9XzuPDCwSUbuwcNpwtpyXozOO8?=
 =?us-ascii?Q?q/8mYQd592C2bBA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W87ZTm/a1zQn0+vzxSgPDlzw/Og8I4sLVSeyf71LqJ0GPMXbB8hX7S5y8xgu?=
 =?us-ascii?Q?Jzp4DsjdW+xXzqJGCYw2NR3ziULSfTckDdWiYRsJUbog5xH0fMEZPzABes5r?=
 =?us-ascii?Q?7nyZRRGLuNuYecX+5EhbiTDwADehc47rZuhpl5Ixb+F2KeJdZz7VUO9Q7fDV?=
 =?us-ascii?Q?RoFhp6Dfa4e5KZrfwvHlA1swTJsJhbn7dA2kHbKnWHVrBgQhM1DwMOMsSagK?=
 =?us-ascii?Q?qe60DB57kq6KZ9XeRw33k7RUOaFj+EzH8N0e8KHHk4y2twxpqc9T9m0xko31?=
 =?us-ascii?Q?FWo4c6LlMVAPi9AFavcn300ASeE86MQ6HlVmeVAg62akzUO9bANpx5nIN2QJ?=
 =?us-ascii?Q?oixe5nc7NQR1DXtPG3ZAd/pKF2xl8C50G6aNLdsgR4czho51ByY318S5jt9g?=
 =?us-ascii?Q?ESL+AkOS8OvUOqKvqadK8t2kpoU+kFsQTNjKivfC5VE7UjRzf8LCih4SlJW4?=
 =?us-ascii?Q?2D5t5Bn2GRso14qoB9PSTYNRQClCsO5fLwMRWARdf/zTNU8x309sprvDHsyK?=
 =?us-ascii?Q?plQCwRDDKY10QWmOwVjuYJkOlpitwPPyZ7QnK9Dekb6b0ouPujMopPKjP4YU?=
 =?us-ascii?Q?OelBhlOS28cUq3hWBVkZEaRjV7hSimUdxbD+mb8aEdhKKMbiMtaE+SqDB5sx?=
 =?us-ascii?Q?VV9r4ue9nFXeHv4Pq6hskYSG7mqUjTY8kl766YZnV6woMpwK3meY9yrcRpbe?=
 =?us-ascii?Q?IvsHxcXbrlan2AvXHYVLFk2thY8tQVDBqyRxSnNF27hCyF2A1rKZBI+CKzBM?=
 =?us-ascii?Q?JLY7CJ3n0AVzkebx8QShkg3DO2pUDOQfNQgaa5qGmndWT/O1FSrjQmqchD/p?=
 =?us-ascii?Q?pZy98EVCOGQwdanCKbTJtO4DNH/HXrQIeMFyj6ELpgZ7bmImVjXoNv9SZx+q?=
 =?us-ascii?Q?asdr3BeOWESuv1jVqY44TnUatLnDOpG4Ky6TpvDrOYMsUv7QoTi/QGrs6eST?=
 =?us-ascii?Q?FzAbRXFAePEXLkuu1VvVOKFLk9khrKKveRB4aq3610S38CyTXlKSdmgXbcHu?=
 =?us-ascii?Q?zlxGgoPBNELkcjeQy4PGFHz8aRNs4L7+UHJSIL2nP3DC5Y4OpwmaaTb+1OSS?=
 =?us-ascii?Q?16f/dcu3AGyoKfvfZvTrXD+P/nCaS8n+mqa501A31qRlQ6UOf5wBTY+qcnBc?=
 =?us-ascii?Q?Q/cJXlmwz5+dBoObqpmO5uDweYITUUdI1DYkGxvfTFFcgpC9PJCXKyUnQR39?=
 =?us-ascii?Q?zjC2S6SHdBj2HC1t4zg2RVNi9fhgWTsucUIMuOuyVC1PUfTAut6zQNACba5Q?=
 =?us-ascii?Q?0QSsgVLZu7POWPR6G7weVpKoOB7ChVHUPPAA6EC+sob8cnGD+TivnCo0uU5/?=
 =?us-ascii?Q?eyJgtulJG+ydgK+kD6wyGW/6RwvRNAVl95lsgmnHj2PcQ+p0koraLyWzl+mT?=
 =?us-ascii?Q?vrt0iD9vMPwa3iPpVejGZksTk3IivKYrrmSVjvXKpKfwQQdRk3r6UTP0B91V?=
 =?us-ascii?Q?2BM6Uwc4rPTpCggpSwOx1Lty7zoCHiV+TaOZdp6fdSUUajei99UkQ7xGt0Ds?=
 =?us-ascii?Q?d5cbo26U3A42DdlLo4flu3ucFJqSWwLnM2oC5DA8AnFVEn8thUCsKT1i6CgQ?=
 =?us-ascii?Q?woS8qwAIRlgHgRqDTfCJFNIAQ5oNdHlmzVl3nj1AJcJ8Bq8XEpfE3HBVmPye?=
 =?us-ascii?Q?0rVpCuPGAYhOEEPTq8rWc8o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3d6c11-62fa-410f-d19c-08ddfbf2ddc2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 05:17:47.9901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bovloahN1zbZsUyb0d1PlkYtrG7SoG3XCi/yXlWxVzlH2epfEuGsQ/Eej1H279X3p/kH2EXmI3UfxWRa/lZ6k0AqsAhxoiw4edjr8xlCC3O15ahCuWL6wmpdQ7MRf6T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15474

Renesas have tried to minimize the occurrence of FSERR errors as much as
possible, but unfortunately we cannot remove them completely, because
MSIOF might setup its register during CLK/SYNC are inputed. It can be
happen because MSIOF is working as Clock/Frame Consumer.

Ignore 1st FSERR which we can do nothing

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 330b65b29597..f2addfbac923 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -65,6 +65,16 @@
  * how Codec driver start it.
  */
 
+/*
+ * [NOTE-FSERR]
+ *
+ * We can't remove all FSERR.
+ *
+ * Renesas have tried to minimize the occurrence of FSERR errors as much as possible, but
+ * unfortunately we cannot remove them completely, because MSIOF might setup its register during
+ * CLK/SYNC are inputed. It can be happen because MSIOF is working as Clock/Frame Consumer.
+ */
+
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
@@ -186,8 +196,13 @@ static int msiof_hw_start(struct snd_soc_component *component,
 
 	priv->count++;
 
-	/* reset errors */
-	priv->err_syc[substream->stream] =
+	/*
+	 * Reset errors. ignore 1st FSERR
+	 *
+	 * see
+	 *	[NOTE-FSERR]
+	 */
+	priv->err_syc[substream->stream] = -1;
 	priv->err_ovf[substream->stream] =
 	priv->err_udf[substream->stream] = 0;
 
@@ -279,6 +294,15 @@ static int msiof_hw_stop(struct snd_soc_component *component,
 	/* Stop DMAC */
 	snd_dmaengine_pcm_trigger(substream, cmd);
 
+	/*
+	 * Ignore 1st FSERR
+	 *
+	 * see
+	 *	[NOTE-FSERR]
+	 */
+	if (priv->err_syc[substream->stream] < 0)
+		priv->err_syc[substream->stream] = 0;
+
 	/* indicate error status if exist */
 	if (priv->err_syc[substream->stream] ||
 	    priv->err_ovf[substream->stream] ||
-- 
2.43.0

