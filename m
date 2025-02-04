Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A547DA6D
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 01:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738633298; cv=fail; b=FUPRl58Zfun+DJoFA0L9n5ZggCd8DuDwGqHip51aITUhvlxNHnqCYqCqFCigz35h7OoTybARR+MQp0h1DubiFV9Pyvn2iT3z0GasOQT/SFVrnylvnIKM18RUZf84WEzD2RvPnm/ZCi7D/V2sI8jWAVpB4wTF/7KxX+1VdlOx6Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738633298; c=relaxed/simple;
	bh=iKbYNeCqC/7xGgosvLSdx13YImZBj488Rq30wqHQPdk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BOQUhzO39pVjnw6JK2CQSWEDfNuXjNPc6KDeSc9w2yujlABh484K0iRvXcLKbaqUoQjm+8EB0Qld1qjA20EKzys/qhCWEsGlxKMUB0oayPXFZyFhahLxFAY1DMYxecWqT0Fs7S/i/aL6cyCN3+obHpZzRPCzlawsYcQBQg+b7xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LeaUopZq; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LeaUopZq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYZ8QYJ2sNxFSWvmN4qs2eP2X3UEBBs2Q3vj5BL7z5PcVan/lATkoqd6lWKhJ/AgRJpkNWa8dcguIZEgghzAqoj3fLhLRq4X9IXZa0fRuPzvzRGfp5vNlVYq73B/LlYujQEozUTiTZYtXy9tDRrZWJA06FvrF6vuqLUINobDCsDuPTpTV37fwSNpS4q7toUf4tmeTSWIKDHuWDRJVGqqD65cwMT4yxxB2hTxXx1zqp3CqIEWh+Qqt6uC6yV1kyhc/6rP74Z/yDpSm0WcbM8AcK07hKfvSvuPft7wPdneSDWBT8htIYX48Zgu9zhw099g6fcKvBGs4GrDA6g4lUgN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p9VHat92opL7HSoJiPI8h4TrILYWCIqdk6gSz+Ells=;
 b=mlTCsvYXbsFW7GQPVgd0bs6gSre/8kfiXG53crFMk/v/mQ+CVMnqaOZX9bpkVsi8imrMnHXcZcDFrJQDg3L3ptXkKycsVyBOulpiTCMQGeMN/GyDW/NWBqGj6Umn55LjGeM9rBrEp4j32ta0GrzXpINZJHHUutMO591X55VRYjZhRY5Y6w/i1boBIzsitrzE+Jyih7IFaNK+otjJYQNcEVBYMPfxn2KSvBOe8uit++nlLQ7fh3RFVHstVb/IIXqBcH2G+ZbwT/JNNJOYxbqvkoI9qB50YO13gOQgglDcd0sMVLo2hgzWDQFjmSd8G8ag7BJS5THmG2kHkVb+Ah2aRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p9VHat92opL7HSoJiPI8h4TrILYWCIqdk6gSz+Ells=;
 b=LeaUopZqGU/GmtAH5pHJX533KLks4yQoe5KSE53NvBxBXZy0vzztt+ISkdygqg6DM5OMkdUtDZm1nZGgo4NnjDB4LVTMvh4mLzysTYBVPVvZD1HSx10fw4lwoDUu2RbFUIZo7SGsqIA7bye+6CSIrPHeWYhV+bbUO0HPdwlKlWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13000.jpnprd01.prod.outlook.com
 (2603:1096:405:1dd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 01:41:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 01:41:35 +0000
Message-ID: <87jza632r4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: rsnd: adjust convert rate limitation
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Feb 2025 01:41:35 +0000
X-ClientProxiedBy: TYCP286CA0094.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13000:EE_
X-MS-Office365-Filtering-Correlation-Id: 90fc3f06-c732-4a0c-8391-08dd44bd0f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1L/Tx1mkN3h71sIjaDvWJTdqwkGTYmZ8Pwa9mQS/IyNsDeRWx0J4YAIR56RO?=
 =?us-ascii?Q?ri+5d0mmSK128B/zgQsJ9uZbdnFIakUBPUp0W8Z1Nf17dvUeLDo7DkGyn6kV?=
 =?us-ascii?Q?Tx4dkfXkAIrIGdzmlbuhYQvP/AdWzl0EEFXKTzp7eYwoiyKiLX/xn1zvgcj/?=
 =?us-ascii?Q?/+GehF1hSouO8nkWrvDsB5GgFe9TApYSKTM2NwuA83GdTX7NnKba50Q7FAFB?=
 =?us-ascii?Q?fCfopKNxGSpdDnuKKUdN4MylgZxqsHXqcGHp5igPpMw5dv0lfBCFbCSlCL10?=
 =?us-ascii?Q?emFYzrotykDdT6BEgDm8E0X0A+eWnizQ7IfMRcREc1wVMrMAS+TmzdLwZ+g8?=
 =?us-ascii?Q?X5Yh0caqhPuWeE9CJAv7I/YlT/SaniUrtfUD6OBWnq6SM38xxS6Tw1Olxmom?=
 =?us-ascii?Q?3AIEQjIa/xk744BUxGpCF4PTWMNfIoDQK7/7tfh7tOSyqnwyr/LFN34pdMns?=
 =?us-ascii?Q?epfvSq3h1IXTr7PTVEJc0WySpGhPeN3zsxwZTJd82b7hlO954P//m5rk+pt4?=
 =?us-ascii?Q?/0KndPm9kZHT3toxBjzfOmA8wPymMR+kFotapYQg7LoNYBMJvHh8YwSGUVPP?=
 =?us-ascii?Q?XVBARDxJS21wKJLS2Unh/lt9RdSvJlw5E4nfHv+cbmyBPKbfXsyCwYDvXkVZ?=
 =?us-ascii?Q?uFx4hz3YGc/Jxa6qcB+G5VApeskCtZhHgmSmLn3MRSha/u6DiN+62w+0K70p?=
 =?us-ascii?Q?goNTjEEkgO+/ZJchp+FTqTdSnFNThgtguk37MWjS9wQgMXahbbLK3gtGPa8/?=
 =?us-ascii?Q?JEJMSe/SYyo6RlbTFANjIiq0C6ai2iRce6xrYwF4qAGUDOmH277OWq9uEFf9?=
 =?us-ascii?Q?hA4KzUkFtm/qGclEhaNKJoVgILgoWxMLvzYEd3wYw2uAA/NbHaJxW9moDOAC?=
 =?us-ascii?Q?12F+0fVvJQFl58BF0wa72djcug/mUEI0KM3VRLQU0YBbS3QQ+C1QtQcfREfz?=
 =?us-ascii?Q?bCHakzcN8MQi/ORQbnqYSPshG9RGkjoqekk3/aPi6yruPVDbuc2gCqevEQ/G?=
 =?us-ascii?Q?t1AuHfQVxlcqJdQC4sMipierb5Z8GgP6+YtGcV+MOqP2n1o7vFkHbshOkkez?=
 =?us-ascii?Q?+AIRDQgXWQ+qTqHe7tKv1QFSuvjPG4pKzIMn+hmhPLDWG2v1SWZpXL9gq7Sy?=
 =?us-ascii?Q?UKocDjiOgITfdtEUsojWzjHlNl0qWaUT7onzgnSopOwh2buX6ZgbVA//2Deb?=
 =?us-ascii?Q?E42OTFM5YuvR1S7EkTQiPOs66g6/qNDnTPh06pDXpwgXhJDL56GstAz8pXxm?=
 =?us-ascii?Q?+ycNsr1M07F2EGJIlAkQ+BIAaFs1ISXjzAfVW2Gvt9a4Z7b+i4U020CyZAl5?=
 =?us-ascii?Q?MIoEGDzkNSCdNXZ2Hp5dkyBvFFCzyKan3Dp9uehBkEztXl0aR4VwuIYxHpql?=
 =?us-ascii?Q?wDef37jQuNsH3dCnaPH0UckL9fPCe2etfvMBP4JYnZyjzyHTbqqhizniJl1c?=
 =?us-ascii?Q?uOZiSQu+QKWMHd0zStSjWzRL9Po3UcYl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DypIawNlXoo0GGUJUgjZ3X6YL4HQXtzX2p1J7v5r2Vi677WGxZJNmCFi0XhG?=
 =?us-ascii?Q?GcFdRNWY1z6dIyLXL714UWg+FaqIfI580/Ri7hHdbH3yhV6C7aBKUTNoVNFg?=
 =?us-ascii?Q?bR1hE7cFk8zFHkU4zrxhUEnZk3sOhq7jf55QzAqZcPoKVSKRASGrKuhr8qEW?=
 =?us-ascii?Q?V5lgYWldcAZ4raUSQIu40Sv6Vh6JOZhBa0eOYvLYMBKlS1iZfdWQ0m1kasd5?=
 =?us-ascii?Q?KX1YvMDLXX9f2cN5R9CLpAZEbkI66IlNZEhKQpbxwmMT1XTGQSCkehICFYZS?=
 =?us-ascii?Q?1aoOkPufiZSrF1rwGm0/iRO5uC+oVAkXWgUmz3IjbVC8q53Ju68zZEzCfBI/?=
 =?us-ascii?Q?JIteZtrXsgMCV2vhx6IdvcThtMEtFIqT2Ca6E2vLvejxKFPEKW3dbsng4IYn?=
 =?us-ascii?Q?YJoy/OC/xfzYKcwE4VmMocpPAFykTFR81h9s+re2tG69vx2QhcZgIuf+h+hV?=
 =?us-ascii?Q?Wh4oLhiIC3e3tFvAPfylc0wCEnBSvR8CdzF9AmuznbrEaWXy9/EmrxdA++Jh?=
 =?us-ascii?Q?OrsPJpJ/iZprxYGDg+oBAuwY/Ln0SHD1Zx0mLW6ft7td5iC4va5BAgiq/+Wd?=
 =?us-ascii?Q?J5UUfxowHInkuAOAtni8ywLA7wulXIkyW73lFknX8xgga7WHL8F+isF+LKba?=
 =?us-ascii?Q?3l0lT17w2eJBeO7qZumMUy7sX+kQl/cRJjpDuWIZBc+fE0bIJE5+xPzD3QiL?=
 =?us-ascii?Q?cK1uI+wyA+U+61kG4K70QHKY8EfKDjrd8rLGM7lBkro04RQ39FtYnTd57B2E?=
 =?us-ascii?Q?tsxmBlfziCxt2ESHWKpa0uD4K/xikVRfEPrub/owRwvsd2ojeRNx2l/LK/V9?=
 =?us-ascii?Q?AmAqp2wZ1PRbGawjR89o8XlbqvifcVu0vZWHRtJfHlc5FmPPBhw75cOeqJca?=
 =?us-ascii?Q?4O9mgi0UlyKKtlrXKRGWF5TZWdG6twvoEUKc4B+oQNWHc99Z5IA1WLostHBg?=
 =?us-ascii?Q?2baJAgu7jjjxzAdKdoiVE1zZhsssGBzsHafZohmVq20jzV/TQ6pjO/n6c4k9?=
 =?us-ascii?Q?5S/M5w8YGh8JP+ZEbv0eAkUcjHGbnNfvzZXUgrF1Wjt0sTI7YvXMfKDrJEmT?=
 =?us-ascii?Q?gPcspIWa2M1KVxtQryxvZS/a50XqdTjpOXPevNDeQtRpSDZLELZp5m3dKjxB?=
 =?us-ascii?Q?UCzqe+u8Zj5OAJhVMdTfl5VcwJY9HCBuWud0uKZ21wyblAlw/Wm4OSzb1cUu?=
 =?us-ascii?Q?yq146ARY1M9l5BQMu1RDkncD6dRecFS1ryErPDO4J2bmY13+4XUx78qBRBcK?=
 =?us-ascii?Q?ZhW9fjOcBoXhTRrcj8mW8KlYTDHE+LxcvmqIeW+XcVhjl3Y5sE1XQume+b4c?=
 =?us-ascii?Q?3vqyEQc33EUFCgoEfUFMrPYYKhou6Px17haDu+cijXH5GloComnC8pides3A?=
 =?us-ascii?Q?Dkod0hHX5sb1lJLz+I9vWVzDXPte94PymAxu+uxR7AfMAEwFsT4qyhbn8+O8?=
 =?us-ascii?Q?fAl0zLTrByeh9vRQV2DMTv8KKurBLt0oUAdt7pe3WCHVk7A3jgsPs3W1vKIH?=
 =?us-ascii?Q?EV7/gttS3wy90S6d4NPDrTofuLMTcac+ErrDQ2qOaRzCrELsMtlHcWRZkffw?=
 =?us-ascii?Q?T/wBgOprB3LFFmnGERNgShHTttvtLA5yoEdQ4BBWYhGfsFVHXadkcTLpB3DS?=
 =?us-ascii?Q?VkUHsKDx+UyYIKnmL7jbCqA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fc3f06-c732-4a0c-8391-08dd44bd0f7c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 01:41:35.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Wmt4/oMgBFhcs3/nRMS+rvUpHw3+hqLB2adhE1lUcs5QtDeBglXxDpquBRHmmWXBofHLTj8zPq6Xw5tU7ZmQHEmKvHDj+0BSxp0Li77jDoAx5xhCVsG/Sw8DmTbL3cP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13000

Current rsnd driver supports Synchronous SRC Mode, but HW allow to update
rate only within 1% from current rate. Adjust to it.

Becially, this feature is used to fine-tune subtle difference that occur
during sampling rate conversion in SRC. So, it should be called within 1%
margin of rate difference.

If there was difference over 1%, it will apply with 1% increments by using
loop without indicating error message.

Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/src.c | 98 ++++++++++++++++++++++++++++--------
 1 file changed, 76 insertions(+), 22 deletions(-)

diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 3099180297722..7d73b183bda68 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -35,6 +35,7 @@ struct rsnd_src {
 	struct rsnd_mod *dma;
 	struct rsnd_kctrl_cfg_s sen;  /* sync convert enable */
 	struct rsnd_kctrl_cfg_s sync; /* sync convert */
+	u32 current_sync_rate;
 	int irq;
 };
 
@@ -100,7 +101,7 @@ static u32 rsnd_src_convert_rate(struct rsnd_dai_stream *io,
 	if (!rsnd_src_sync_is_enabled(mod))
 		return rsnd_io_converted_rate(io);
 
-	convert_rate = src->sync.val;
+	convert_rate = src->current_sync_rate;
 
 	if (!convert_rate)
 		convert_rate = rsnd_io_converted_rate(io);
@@ -201,13 +202,73 @@ static const u32 chan222222[] = {
 static void rsnd_src_set_convert_rate(struct rsnd_dai_stream *io,
 				      struct rsnd_mod *mod)
 {
+	struct snd_pcm_runtime *runtime = rsnd_io_to_runtime(io);
 	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
-	struct device *dev = rsnd_priv_to_dev(priv);
+	struct rsnd_src *src = rsnd_mod_to_src(mod);
+	u32 fin, fout, new_rate;
+	int inc, cnt, rate;
+	u64 base, val;
+
+	if (!runtime)
+		return;
+
+	if (!rsnd_src_sync_is_enabled(mod))
+		return;
+
+	fin	= rsnd_src_get_in_rate(priv, io);
+	fout	= rsnd_src_get_out_rate(priv, io);
+
+	new_rate = src->sync.val;
+
+	if (!new_rate)
+		new_rate = fout;
+
+	/* Do nothing if no diff */
+	if (new_rate == src->current_sync_rate)
+		return;
+
+	/*
+	 * SRCm_IFSVR::INTIFS can change within 1%
+	 * see
+	 *	SRCm_IFSVR::INTIFS Note
+	 */
+	inc = fout / 100;
+	cnt = abs(new_rate - fout) / inc;
+	if (fout > new_rate)
+		inc *= -1;
+
+	/*
+	 * After start running SRC, we can update only SRC_IFSVR
+	 * for Synchronous Mode
+	 */
+	base = (u64)0x0400000 * fin;
+	rate  = fout;
+	for (int i = 0; i < cnt; i++) {
+		val   = base;
+		rate += inc;
+		do_div(val, rate);
+
+		rsnd_mod_write(mod, SRC_IFSVR, val);
+	}
+	val   = base;
+	do_div(val, new_rate);
+
+	rsnd_mod_write(mod, SRC_IFSVR, val);
+
+	/* update current_sync_rate */
+	src->current_sync_rate = new_rate;
+}
+
+static void rsnd_src_init_convert_rate(struct rsnd_dai_stream *io,
+				       struct rsnd_mod *mod)
+{
 	struct snd_pcm_runtime *runtime = rsnd_io_to_runtime(io);
+	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	int is_play = rsnd_io_is_play(io);
 	int use_src = 0;
 	u32 fin, fout;
-	u32 ifscr, fsrate, adinr;
+	u32 ifscr, adinr;
 	u32 cr, route;
 	u32 i_busif, o_busif, tmp;
 	const u32 *bsdsr_table;
@@ -245,26 +306,15 @@ static void rsnd_src_set_convert_rate(struct rsnd_dai_stream *io,
 	adinr = rsnd_get_adinr_bit(mod, io) | chan;
 
 	/*
-	 * SRC_IFSCR / SRC_IFSVR
-	 */
-	ifscr = 0;
-	fsrate = 0;
-	if (use_src) {
-		u64 n;
-
-		ifscr = 1;
-		n = (u64)0x0400000 * fin;
-		do_div(n, fout);
-		fsrate = n;
-	}
-
-	/*
+	 * SRC_IFSCR
 	 * SRC_SRCCR / SRC_ROUTE_MODE0
 	 */
+	ifscr	= 0;
 	cr	= 0x00011110;
 	route	= 0x0;
 	if (use_src) {
 		route	= 0x1;
+		ifscr	= 0x1;
 
 		if (rsnd_src_sync_is_enabled(mod)) {
 			cr |= 0x1;
@@ -335,7 +385,6 @@ static void rsnd_src_set_convert_rate(struct rsnd_dai_stream *io,
 	rsnd_mod_write(mod, SRC_SRCIR, 1);	/* initialize */
 	rsnd_mod_write(mod, SRC_ADINR, adinr);
 	rsnd_mod_write(mod, SRC_IFSCR, ifscr);
-	rsnd_mod_write(mod, SRC_IFSVR, fsrate);
 	rsnd_mod_write(mod, SRC_SRCCR, cr);
 	rsnd_mod_write(mod, SRC_BSDSR, bsdsr_table[idx]);
 	rsnd_mod_write(mod, SRC_BSISR, bsisr_table[idx]);
@@ -348,6 +397,9 @@ static void rsnd_src_set_convert_rate(struct rsnd_dai_stream *io,
 
 	rsnd_adg_set_src_timesel_gen2(mod, io, fin, fout);
 
+	/* update SRC_IFSVR */
+	rsnd_src_set_convert_rate(io, mod);
+
 	return;
 
 convert_rate_err:
@@ -467,7 +519,8 @@ static int rsnd_src_init(struct rsnd_mod *mod,
 	int ret;
 
 	/* reset sync convert_rate */
-	src->sync.val = 0;
+	src->sync.val		=
+	src->current_sync_rate	= 0;
 
 	ret = rsnd_mod_power_on(mod);
 	if (ret < 0)
@@ -475,7 +528,7 @@ static int rsnd_src_init(struct rsnd_mod *mod,
 
 	rsnd_src_activation(mod);
 
-	rsnd_src_set_convert_rate(io, mod);
+	rsnd_src_init_convert_rate(io, mod);
 
 	rsnd_src_status_clear(mod);
 
@@ -493,7 +546,8 @@ static int rsnd_src_quit(struct rsnd_mod *mod,
 	rsnd_mod_power_off(mod);
 
 	/* reset sync convert_rate */
-	src->sync.val = 0;
+	src->sync.val		=
+	src->current_sync_rate	= 0;
 
 	return 0;
 }
@@ -601,7 +655,7 @@ static int rsnd_src_pcm_new(struct rsnd_mod *mod,
 			       "SRC Out Rate Switch" :
 			       "SRC In Rate Switch",
 			       rsnd_kctrl_accept_anytime,
-			       rsnd_src_set_convert_rate,
+			       rsnd_src_init_convert_rate,
 			       &src->sen, 1);
 	if (ret < 0)
 		return ret;
-- 
2.43.0

