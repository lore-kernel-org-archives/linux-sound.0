Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8156125A628
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714852; cv=fail; b=F3rVIFaEzNqEveyXBizYk/hOnL6jqwHn/6v0T12hRYS5g+/p48Iuq4XHD0E0yjzKP9ibNdi2zTuFnhunw3kE+h5BMTCUDwiFw5VCB1cEOv5nAw6NQw9t5K1KTkRrKzkTx7zg8y7wtBF7wrH2v7DKytkeUSYri82BJZCbot1m+dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714852; c=relaxed/simple;
	bh=InR+NaZGbseaoc3uj1mRxf2qmrdz532FwxsAr8RBhuE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OLNl0JXM+oaiAj01IeaA/0O9WYin6FYGUiDjCXmQky7EhUUn3MJVaJ5sT4Fpufw/CWoaYLgw6ySQu55aqQsD6EwedUAphnlnEMwFHs96wVBk1/EcJ96HH4mjrmqrjh1iyFWk9EdmydFdfkvI/xgApSf4ndppPP9AOQDFOdYvy4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gdTdbivp; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gdTdbivp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcRBP1d9F60OGKAsIQAnhTNetw+j+6R01wMxTxYT8AKvnmQ3feWrWgX6sdydyB/mxf8lMxYJ30sRC8D0buG8yDABdmf9nIBvQKDfpZfQfyywwpLqJZ2fbwxtvkYGfAHw8pay/Qs01JahwrG2DyDqEkghUru5ND7j4eFU8jUK0ECTGFxrPgnVXU8a5FbmtglyK39pRK/Kc4zDA+gmHpcuGAmfVwpGSdKNrdGmWoRCqdwyxEg7RwmrQi96JYr71v0z6wlGv1dSo8EMpwt9M24/443lqxt4jxH/ZmA497iIbrbUNBq0AHZnU/m92xh9uluxvUA6LOKvWktEH7gqn4qRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJBP4EW54UO3us++buBOdJcWZDvdAlneNjUAqQ3QJ0U=;
 b=ClJgQ2d8N/dpr+87ynMZpKaIH3c1w7fJW332wsQIOsoOfu5nw+I4v2ya/zOPGm3nWQ9PgO7S6cilY22/YP6O2PFnw502ADEy5XCYVyZaAsYlc9yqEH53HF9ArwwjbWSvnaF7C5HJz7uZXHvNwm2E/Gwv1IE4o/8alm13bzidHXuz28nO/+AU6dPX+ZWh9Cx5ZAQLpnGxYEEJbO8cnSpbQLh1mQIruQf9Urg59pa+KgYAlTBMJjbRTRW8oal8TeIbxM9DuJjLPeqlPxu4oV3hmZLirhBbBuIcpM41O9SSQT14bBGbLsdEDL0xA0K0ngFkmjJmA+D+hD06KVy2NA5uHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJBP4EW54UO3us++buBOdJcWZDvdAlneNjUAqQ3QJ0U=;
 b=gdTdbivpKAEOpPG1S1UPR15qRt7PurupUTIZ1HtFfpjWFqsmyMn8OSsODMq95L5w7tQDS/pkjo28KTedgDu0AOsQ4XdoIa6Njf3YAFD0nnenits4KwZXpVPMrMHPA23J+TbeWKOi0ormS6ikf46+OGSqszEIsYzTy1AGhZdxtlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10242.jpnprd01.prod.outlook.com
 (2603:1096:400:1d4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:20:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:20:48 +0000
Message-ID: <871pwd2qe8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/3] ASoC: rsnd: adjust convert rate limitation
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <875xlp2qf4.wl-kuninori.morimoto.gx@renesas.com>
References: <875xlp2qf4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:20:48 +0000
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: eaec96e9-089b-4436-53a3-08dd457af0a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h/S5sySHA6WxyqFmLM9TEVByRLstjF0rEaDklTYXYaF5W/Ef2Pk5Ic2sTWND?=
 =?us-ascii?Q?1UbkLpERPWtZlJo3zqN2M0o/nP2jzAez5zuFdw4DBbZzXVvfduvMzYRGQE4B?=
 =?us-ascii?Q?FNYLRPd+x1ga+XmINMJhh2/GtSmJBmy+7fDMFDFs9Of1LrPQNx9j6e7ZBmCB?=
 =?us-ascii?Q?HGICTq8MAwzexTsCx3/nyH6uHZTHrzrq536LreEPbZ+rS9OAvD+ObJYpRMXQ?=
 =?us-ascii?Q?rpwu65IkJWx3yE8Fl9u0o1ULRSnf85IbD4P5Pw4QOvSJKFRYY/gNXIdhpA5k?=
 =?us-ascii?Q?acPIntuKsDvyTkjmK6VHhUiW3JTBodUMZFi39Bzc+QS8c9Z2rO442u4z/BRE?=
 =?us-ascii?Q?5vEe6fz6rUC9vJi+1RAmM3V++yAUMK7BM0hWk415rKXojzL7ueEII9XDxRbj?=
 =?us-ascii?Q?PWH3XTqnm+Fmim6novYrvk5pxYF5Dg7e5RTGaP8JzNJjmZzUmnxXgNVcB+UK?=
 =?us-ascii?Q?zEwwaEO3Flqhz65ue9oa5bz65isiEfZtM+yhp5yAdCY4BjoiSa8it/NjltPQ?=
 =?us-ascii?Q?uV9HniENbYvt2xuYSdHyj+s5VW9c7j2G74TU5URBzhph0VHeYJH6PlSqzCmd?=
 =?us-ascii?Q?ZnCTJi1G/8U7d7s5g7q/9bFu3vpBPiT4XjatOR4haQ318KC76h+gJ+y6Mrol?=
 =?us-ascii?Q?prj9IxGmtOAdvw+Ns2QfVxTGGr0K7DayTaSlD8EAjKEWmtDS6cIwIzKPaW+X?=
 =?us-ascii?Q?4Zpxu7anOYgyvYV6Iw6THsccgWhhK+WBcR6QDqKqx05sKLl9BF5glaRySBnd?=
 =?us-ascii?Q?fO9nOmynDwqEiVJmLeJwLAQ3nHQNtdeqaD5GMmlfILjOka5FMgO7SlemCMUd?=
 =?us-ascii?Q?LD5fv6YUW0mXCzAcZCOXUai33nhQ6Lm7GRzEo/S/IlCUyud8ThfW0rCfu++w?=
 =?us-ascii?Q?juF/FWvprSteXduwHPuHW3Yv/QY7Wb0+jIO2A3TY888kW3sPb8BZ8D659bIw?=
 =?us-ascii?Q?uX6CVBB/XHIUwdNGYJym2cSu/tE38byLvMmte0hqhv+ruwRTiExt+ub3j5bf?=
 =?us-ascii?Q?k27BqvqOtKi4YzDMHxa9ZgIT+nZGONZtqs8w4wt6JMdjcJqgn59zv9v+gyXo?=
 =?us-ascii?Q?6MsyVD7bY55rOHWeqJCulGBTnXd71/JqPtTF+1GjoeupXhto5Oyat2NXk+nP?=
 =?us-ascii?Q?iv46DKjdoq/jsYYtph7/Wy0HMACLvRn3f9PrerzMWrE1jMGsQdRl057YoS91?=
 =?us-ascii?Q?b9IgTAFZoBbPknGh4+6MTzewX/UkhFJ48XKuRcp8yYVuXV8CujiqoHKxo95/?=
 =?us-ascii?Q?ryIxrbmjx1GckG+S1UbvY05WXJbqKmemR9h35Ztbd3rwAG0agwKpY68cx2vk?=
 =?us-ascii?Q?/N2t2tOMlsH/MkUhzROULrHbwxQvS8OvRVUnPQAF1WSycOR9j63B3duMRQi1?=
 =?us-ascii?Q?NKkZhPNuCxlVv/S7RaUwlSLJ5V+wXotg53N0j5Tr3+jSSbIFfRgKyzymjiNh?=
 =?us-ascii?Q?6Ka5D477KvFLy2tEgnx9F76bivVUUjoG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xRFW1uiJfSHjrhUAUoW7N+9oyNeusy25DECGt1xiDeSYAYYeMP07GcvvN5by?=
 =?us-ascii?Q?A7Zalz6vG2haeGHcKlG8ZLAcsECQairxyrTVXq52HPjHj9GWIyQt6kKig2D/?=
 =?us-ascii?Q?bLJXi9SNxeTxKN8IdoE6OmTBJZSxfMYrSeyIMRo+I0jO8A8jWTfwsYQdl0EQ?=
 =?us-ascii?Q?T/pze+H325p9afiebjxTKhZnHKes55WsxkZk1crNeSAiD8MSHgSHA3KNjRQo?=
 =?us-ascii?Q?MD5y7IRkfS8RRj8KzgPDwl9J+ALPnusZNTVPmYbi2Q31YJkyBy5aAoEjqdrU?=
 =?us-ascii?Q?nPGW9m5RBmQfwkzVR1qmudCdCI4kVVhRXEm2N79WKEjGuVM8RYfDdzl/L3yV?=
 =?us-ascii?Q?ir27GreGCk/fira2jEywOhbbiKvAD0wcXVBgndmQuT7WGnKuZDdowJZA2UaX?=
 =?us-ascii?Q?G7CHL82QhwL0Swl45arVuCBE8oUiCif0STDbA8Pxoo0p/L1+YRaRB77T/6mr?=
 =?us-ascii?Q?k0fTjmLGf/HClokQI/sPFiajnGFXQWyBKxztF1KwOo9Jt+JigHjPLNlHTm+T?=
 =?us-ascii?Q?o87AzlSPG0EB2OCrDgnoHHqMSYY0R6TXOBMeJJtzw9rIMsiPS2M0l9OZqfUT?=
 =?us-ascii?Q?xKdnB6esi/yQMeYZQ5pLCMZUDUWQ6PGgkrsH8BAxddTuha/T52E2C3XljSPE?=
 =?us-ascii?Q?GCLoBOqWaabC4bSefTEwrflkfGWv412CFqoQQKH246jqjWjQywglKPD9VkuD?=
 =?us-ascii?Q?KK+5faS7OSGnr5awIqUUASQQ8CHvZI+U4Zm64mrmHxSRgtXZJbvRG9I1CFgx?=
 =?us-ascii?Q?etkPJaeiZx1q0sltBXLLdQA7knNDesayS2EgAWqwezAE+MWNfPCeEyJpw4Iy?=
 =?us-ascii?Q?tCCyvpbWwnLHzC2B1qbM4RGXQAZjOVzY5jooN+vGlHHrKECIXSi1hn5Gin8f?=
 =?us-ascii?Q?qVPwKjhhbUjMOIL5GiQbd5i/Z9PxlN/GNxnQLcBkdFh8quidtocqdibhQmIr?=
 =?us-ascii?Q?t8XIarLvzkdNn7nudNuH+ASsywUNtEzkjlH3kRZhyLfjKIS/W6YrirKly/aW?=
 =?us-ascii?Q?91xKStbR9aIR6kPFlfj0d3ikOUJhIHQlnT8kNl+GtBhc889qeMm06z+216yw?=
 =?us-ascii?Q?xbgtPBxtbc1dYuLPqzhfdodKcP1jKT3ZdEsCLQNvCT7iD976VC5ETD6atw4I?=
 =?us-ascii?Q?fES3Alv21xKFbkjTcpOLda+UzOyKqxbamX36I6sCcL+/lO879MH+BN1akGAX?=
 =?us-ascii?Q?MwXT5B/ZjTuLoghZgpV4IdbqaBsshDNxlIR0QlQDoc3+xvfgGj6kV6sVTAZf?=
 =?us-ascii?Q?HrX3lSgVnaZPuPIddmLiNPvhH20+uajGoAp6FGUyV6ePMkr0QCRyVqHVCkM0?=
 =?us-ascii?Q?KDWlGGWyE2/xbiTSGp0qxkn+43Px46mAq3DFDpxcuJ3oHtIAMr1+eIgRuT1T?=
 =?us-ascii?Q?GZWvgI4n3v+Ycxm/VplisH32IeYFXPK0dnaesXz3PbkFmyfqf+zuUgCsMDeD?=
 =?us-ascii?Q?cTjSkLqurewsGkaqXjn8LjkFInbXVKfp4JxlemxZAar8xt1+HbUEjIlmYOFx?=
 =?us-ascii?Q?o99MdpfmgfiLcNjPu50KLVdub8+5no8lskDqLqBUUEOfYIp5a3SHBLmkknL1?=
 =?us-ascii?Q?E5mWkM5cfn+OdBbq1Ku2yTLrVwbSK0+mv42PJBnY/hqV+P0O7f2DYpNOtkqm?=
 =?us-ascii?Q?byjkNPfxWj3UUCKPaDxIGSI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaec96e9-089b-4436-53a3-08dd457af0a3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:20:48.2942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fsMpanzzETMFVKxtTK615yhNd8Vcrv29IYW6NzIpb//Crnsb8iXfrRwiY4tAsvy9LNXkMq2O4JVFWmnDDV5Hlq1OjsDZEaeIIpUlbRR7qCUT6lMuyMOWDC79bi01s2D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10242

Current rsnd driver supports Synchronous SRC Mode, but HW allow to update
rate only within 1% from current rate. Adjust to it.

Becially, this feature is used to fine-tune subtle difference that occur
during sampling rate conversion in SRC. So, it should be called within 1%
margin of rate difference.

If there was difference over 1%, it will apply with 1% increments by using
loop without indicating error message.

Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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

