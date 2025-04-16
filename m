Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66010229B02
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 06:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784840; cv=fail; b=uRoyQ7AC9DBGvelm0+RzITtp4irHGbOpoNNXm/OYTtGqvmkp2At1zSs8T7pIhDwpW6C1y/Eqbhp04UivYUUXb1J0NDy1hL5eng0wq1Vaiv9b/8poR8V2CGQbNG5idaQ/5/jOKgatUA29pOnF87OUUVUB80HHR5IXlRnCZiOt9Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784840; c=relaxed/simple;
	bh=Cu3GWuTHUQZy6tiE4ol82qzq1SedpeLfIGSxnIQ675g=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bG22xjPcTucbkiSYN9pcPq9xf22YnGsECzlHI3F4ZV4Lssnkutpetu21aevMgtUQFMxf8hShpKB4iezDzFwcaxrLv9tlUzoUNQu2RFshzq6i8NBgJuQ88B+psY3z6FSUOQT/7tJCUpmBWDkALoG62TVv7/xxBXID0xJCLp0QEgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SU6A92Kk; arc=fail smtp.client-ip=40.107.74.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SU6A92Kk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gA8VPaQ/LssycTkgMj0tPPThB4NRioAxN9J/4FyVzxrPikUSLdhgre6SyppXmByC+CtEwwSIqIAnhX1a0oWsg1bXUSlkRCMRzx2uBjbcK9BpApssAggg6+4Q3+oe/Q1DDBUz8VusilW9h3yKK5WXDYlokbXtGSMBX6NhFFSNINmIDzJDRy5VccLy4QouD2hx/Ptmf4xMXEUehuqNbHuz1plDel36/E+l//gT8NjjJ5it8/cKVjJg4Mwc5/886iz1zJg+WeTVY7p34uGTJWkGrC/zqI1d647EpS7tSy85bIRpET8060NpP+sBUFng+2CI0Ol+dYe8XIrFb34NQm/yXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr1E1YEwUd/Y0myIYv4poJqs+uqVb8Yy+AXR9GaT3o0=;
 b=H7kwu6jo/IpgyuubPBZhXtTVWVyMHNkrvBet9i0sbcraxRowITjervWQ/n0FN6yigeFs/yx2lUU+a0CJYKvyYs3ZnkkhJsX95LSAmWI9EJ9rYiGebZLKGfiPLI+RFCSrjCOOdtbHUg7lOkFVMoAAZmrzd9EbDQa39/4SCZiiBwlwplc0ez551Aio2xh5IDCFn2QtJSwhcwLdDfA6FpJwXWX6qtKi72x31BqaElLUdwhoQJ7SsxtFcjCMHE8UyWTAA8nJkCtkW7AQuBVN5BQDn1iZpy0O2Xcy0ELPnhFykCMnUUrT0pwu80f5RoGbsfj2+cmkdWX+uzpm83qtdK8Nmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hr1E1YEwUd/Y0myIYv4poJqs+uqVb8Yy+AXR9GaT3o0=;
 b=SU6A92KklZezq4ymWg/+dhOMVwlqcxDAPgxLUDuOKJL8CWytNvLnXIvTRjoJej+aPNOba2YOSuXw3oSlxyfYE5Xc2zCdUCY3m+wHnWL5gFC7GeNMSaXIfBjlJDZ/SngRQwp3tVvOovSEusAoyiOXJnmoUdP2pxVnwvWF/gr6im0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15955.jpnprd01.prod.outlook.com
 (2603:1096:405:2c8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Wed, 16 Apr
 2025 06:27:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 06:27:10 +0000
Message-ID: <87cydc8vup.wl-kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: soc-utils: add snd_soc_dlc_is_dummy()
In-Reply-To: <87ecxs8vvc.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecxs8vvc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Apr 2025 06:27:10 +0000
X-ClientProxiedBy: TYCPR01CA0182.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15955:EE_
X-MS-Office365-Filtering-Correlation-Id: a960a47e-b95b-42f0-26bb-08dd7cafb80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Xc38WrlkhwBtlQE74nubmikbYhNUraPW1TzwG5qZQVKXuegmW8hcVfeZN87?=
 =?us-ascii?Q?fmqBRU+qRsym9aNBZtM92d3FoxqCAozOmLr4p2+rMhUNDRMVpM6OnwV1OcZz?=
 =?us-ascii?Q?gUy8/u58j+1CcyTJoYJAzLg8HYSCMJChySuZ2krOFkq1+/JFfnvGEtxpTh+E?=
 =?us-ascii?Q?9YkCbNtu4TqrlzaYqE5QVQvyFdA5ldgQYZQ2WheCVsrBT56hbbGtCgl9S3/V?=
 =?us-ascii?Q?XopkxJEjGjQL9G3AnACKE87ws5/aUZyU7cjSj1Uk3uO0iWB+NjjkGSKsNnZq?=
 =?us-ascii?Q?or9dSb53jOUz7mE1uZh+Svk+PdynNL7GabJ6APQM34wAHP0I/L6WJhOMooVz?=
 =?us-ascii?Q?gCuFt0Hq0dyE2+zJ2wVANm7KM36QqgjyV7js28sBj32SXmlR8a0/AjFWqKzj?=
 =?us-ascii?Q?6QBZBCyoB7S5g2FS0OjCFfWO79/DwPWyCte9yw4DGMWgAvIE3f4cVLL4RWLq?=
 =?us-ascii?Q?rE2gX99qLzYgI0/ZW6/S+klSePVI9Ox0hSVeXT2eTbP+PffC5bneiwGQpxCK?=
 =?us-ascii?Q?g8t17o3EFn1qdM8Wy7hYq8g3dTgrWTAkDSgnKJzOPK1f64kHpdXFtLKIeRpC?=
 =?us-ascii?Q?QDxhcUsIcv4Ges3dhIuXcQvC3OtH82A9GpWBPvSUq3A1jNAgvAfhDNh7xbx9?=
 =?us-ascii?Q?4/SdV4JGpHz72qhbeocSPtpwTua15tKkakv1+WxSofSTcwhpKaweYUHtqCHd?=
 =?us-ascii?Q?/YcrWkKIXw6MM0BQBClwmnQXeZMoiCy/G5dflWF2fPso9XTZGCLMkGXrepxa?=
 =?us-ascii?Q?E+qreYlmBzzRTsl1NS6mBnMNKJNb8l4UBUauWRs/JIk09Y9SMddRj6N3llXp?=
 =?us-ascii?Q?Ikt3yJCRlrG1gtncxxCxgQ8lKU3p6uXSbyZuoKPlssZNH982qRlWqpINGa66?=
 =?us-ascii?Q?Xpb2euOhHHH3NZRLXHODGANBX4IHaU4dDniiNPLTUmmf31W4b9dX0R6iqtQ8?=
 =?us-ascii?Q?HqeA2Mw090WRkkyVlJGYiKfGF5RJfdUaZbc8Fh1G0MDSMKi62tZ3jLdibhnY?=
 =?us-ascii?Q?+17IupTVLVyG2+30IJojTrfNagZpHbfr4tsHpTUMJYbujyUd/YvPcZttXFLC?=
 =?us-ascii?Q?7kwAexd6HaB0xBpsIJ/WiDncGR3j6DH6tNRHL3WdCZ4/wZN2LEEg6w3BUzc3?=
 =?us-ascii?Q?/TyyMVKJibVN1LwEMBigrZI07m+h0SIrTKBqpKIxki360YPAk6Pv95qEcuQA?=
 =?us-ascii?Q?a/uJUtnvyh/Q1F3m74ZGBDcoVvqVntH/ztBuxxr/tczGvc0XkwfxwQ8jcrm3?=
 =?us-ascii?Q?iSA3ADZJtLrul9R/n6KEZjoVvpSV6sknvLha6Wro0IMCSuUH5HBbTxkSXXp2?=
 =?us-ascii?Q?yjhew8lmQLGusC/LTWZv2pB287hEhIqOKNLAh1515Zk+VMUtFcMU058yhD5+?=
 =?us-ascii?Q?fhCrQgWg+8hFo6C8CTzypltfn/6Q942E/KrqVzzXCMpCswiUGp1V0dxh5YTD?=
 =?us-ascii?Q?Fi6EaTXlxbJfxsGZoD0hWEAYzb/PJHvNMv6iek3pk3Ryf35rYFUYdQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WikdndgjFxV7al/jp4Muez5cZyrt8ba9u6+Qkj34PDELznc7U2zD89DVd3iK?=
 =?us-ascii?Q?NIzuyVjToYoHvT7y/j7LHTCGsZSjul5attQF+S3gxi8cr28FXYeeaOl3BuRU?=
 =?us-ascii?Q?WqrILqqvVfsFOXaE9bonb5E/oLn/IFbFyK8OC0c9uO+ncucqKDVot5f0BFIL?=
 =?us-ascii?Q?QYL5pa90KxMMRHh283CHcaaJpVVxnBbNaR7U0kXHFG1M4cUIdv+iT7Ly8Mtp?=
 =?us-ascii?Q?ApnDSjLxAlZfIbuVnMk0m8/ggqPTxvw2+nh1OZ3573Zf8kuw1VFfYce+lvnS?=
 =?us-ascii?Q?lVyBtX74gwuKlI3CZue4M2P5cOWTkbK8/M7Jj8Xnrz3szCvwE0O5dUU20nTL?=
 =?us-ascii?Q?dhoJiM5t2KfeG9+I14BLpvBvFpti+qHE8a9eluALQ88NUWu3y8zra3+mVO/H?=
 =?us-ascii?Q?SPCCEaoGOcfWf8T8Z1bMTiHwWeWLoc6PXXtU0LFY7RZgl+9mZyXW/wOusz5t?=
 =?us-ascii?Q?4KvURs9U2I9QPr0M3DCRjAOQN0/z+bfQz8x6InqA0A2UDBEjpentAuZizxjt?=
 =?us-ascii?Q?99cMHcE1PpfrIqPugm7RADz/bbPeYoVS9LtwCfNHjarXzoPtW2e6Ypb9rA1L?=
 =?us-ascii?Q?yJNXk5ljJcMVwxKapyINaqSy/EufUOBUT3y7Q8YduWS/0aPM9YP4qefSZ7wB?=
 =?us-ascii?Q?QXe1vPla89C54Z0M3qAhAzeHYB9f+PHTKw3O1bSj4zYDx3OQvg3pvkODjDcB?=
 =?us-ascii?Q?WbwkzfOwnnDehj/9W7Ycurm7pNm+2ngBe8+ZanJkQwfYUaHxl+pDPAt8r++U?=
 =?us-ascii?Q?7CTfAdJ7lZcA6vWy4DxYjaKyX6P3CPvvxbtMRaDTb429nT0nEfopGqsmL9fb?=
 =?us-ascii?Q?b2Rm5Npr8CuB2kPn4suIQ3P4Qo0GpuSEgul869fuH7bBYi2PWtRAi6+WRwVq?=
 =?us-ascii?Q?nWDSlxYzl2AB6j8XDGZx94uMsdpZ6Ofm2BmTGykx/gvQKSidTqvt1U3ln4RQ?=
 =?us-ascii?Q?1rpx0Di9uYL7+04ZU6jsAzT+8VmPhX+VuVpF8+olPwgnpD05/tGO5zPQ+tDd?=
 =?us-ascii?Q?qV8g1I4msDXLQo97bW3xRsGnsOli5cj08f9FHIBq9tF5V1XVWEFYxgZXY7KE?=
 =?us-ascii?Q?Kecfur/2w4AqcmOsePdxOG73rH1L+M8Ja5sw+NiIlWHu2PWnF9HMv5/0TGIx?=
 =?us-ascii?Q?ZSrAcQcZX9gJaPcQ5fOC1GQLrArlaI12I/FN7YT4WyOkyCiu+p/erwWP1Et4?=
 =?us-ascii?Q?F3aEkk/BO3T1G4/S8LzanufULu7mOKuGr6Zqy0hD+4h/HOL9/XjUcqANKJNm?=
 =?us-ascii?Q?2RnTqx3WUDmSEwS9IeWE2ZvFG/rs7vP+aO21sTek+KFpamw47NMqrwKJ7xl3?=
 =?us-ascii?Q?HCwMApHNuvk0gB26ZXZR+BJ1J59LIcOxWm3CY5lgyU9FMSkCIelZPTq2jG5U?=
 =?us-ascii?Q?ZIOgfZa196E6GlsFtDOo2k2sg70UbyOUfhqtFEB+4/FKyi2kOcDpJj9krHxF?=
 =?us-ascii?Q?PhcJX6in137Ell0S3+agHcDYM0nsjOXb3Inji6/nM1/voc8tgjY2gNnniB0i?=
 =?us-ascii?Q?OXqcnGAaVg4FfAYv8h07Q3Y6V1pMO3zWToG6XiIYB9B1OA8ZhTDvp7MfSmzN?=
 =?us-ascii?Q?ghvuO8XnPx540YEc59bdTrKzEevkwUdtSiBB+iOe8OqxJojP/UVPgvCoMe6B?=
 =?us-ascii?Q?8rVlRc+84E3Ikh4XaXmGo+A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a960a47e-b95b-42f0-26bb-08dd7cafb80a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 06:27:10.7259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqKfj5Yjr6hnA71ufFKNAe1b8Oy5ZCGLiS2sgOR5cXxt5tjiz+n671ykjJtypFF4vVEk53Om1li+iFJggJ325rPcB7/4HXseZMo0MBOd5C9w2A4XM9tujiYMKuK71RJo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15955

We have snd_soc_xxx_is_dummy() functions, but not for dlc.
Let's add it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h   |  2 +-
 sound/soc/soc-utils.c | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 484d8b3a34f3..e425394c3ef4 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -936,7 +936,7 @@ snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 
 extern struct snd_soc_dai_link_component null_dailink_component[0];
 extern struct snd_soc_dai_link_component snd_soc_dummy_dlc;
-
+int snd_soc_dlc_is_dummy(struct snd_soc_dai_link_component *dlc);
 
 struct snd_soc_codec_conf {
 	/*
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 5e3e4f14c392..a1bcc852a6de 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -262,6 +262,19 @@ struct snd_soc_dai_link_component snd_soc_dummy_dlc = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_dummy_dlc);
 
+int snd_soc_dlc_is_dummy(struct snd_soc_dai_link_component *dlc)
+{
+	if (dlc == &snd_soc_dummy_dlc)
+		return true;
+
+	if (strcmp(dlc->name,	  snd_soc_dummy_dlc.name)	== 0 ||
+	    strcmp(dlc->dai_name, snd_soc_dummy_dlc.dai_name)	== 0)
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dlc_is_dummy);
+
 static int snd_soc_dummy_probe(struct faux_device *fdev)
 {
 	int ret;
-- 
2.43.0

