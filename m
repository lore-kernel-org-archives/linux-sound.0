Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E0A27E074;
	Tue, 10 Mar 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152308; cv=fail; b=tWqkf/XDBeffxnv9iVXzBkX7ab8R8y/cfCdZuP//fJ8fbWTmaUxWivbmamnUN/pRJ2626Qx8puTyOSAhloTyjsvdF8Wo4OfmmCejG0Gn6xrIYvO3z89Pes0ulmdW03apwUZ5Fx1iNH6YgXykwdDsq7gLFz5BKkBXpHljp/FzdKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152308; c=relaxed/simple;
	bh=5kwtNjG0v21DCLfbpFZ6vGRwvSaRkCQDJxVfjSldZHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sz86TH7zSbC74BlOrEUnzz8Mxd8UpToyxJaMNFIfUUzLVFBQ20IfL6/mTsNeb84XJ6Y7BKkcvlyAIV2RfVli5x+Fbqjo82WdNxiN5lm0l8BY8XnACCUw2AzER7mGIu6oEVWqrIOHYao0yvyM1qmIUEJ5nDGnZhR6qPa12Wih6J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K9Uh9Q0J; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UwIlmNjs; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K9Uh9Q0J";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UwIlmNjs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629M0MYx3893326;
	Tue, 10 Mar 2026 09:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=kOtXB6b4j+WQa50q525YtgTRtCoRlhwBX0Jn4yeVFBk=; b=
	K9Uh9Q0JnMaV1OINo/GcoAnW1tILyKaCvRVUC2FhhJOwM3C4CFBPRHR+qFKXDmdg
	9E7dzCg47Ijb+f44ZZXhfXicwL/4RX2fzp56/QKUorNq+uKmaCvVlUYY81nReNFY
	JpXCgVTePnRE/nO97aE3B05onU4KQOnhLD0W0fY5NH8enW8NtklBhZbPmlR2JMd4
	t5JQq+MyVLp6NaQ9hUzRFXov6jg9yYxg+EdqHV1RHx9T3QbHHKmA4QCftljqk+x5
	NnTEopBR1VfhtPSR7EfdfhJZVukH5e6VCubi/TQAqFKI4EW6yrWg4K2Y7qwOvLrs
	o0aQqFQpydzWkqvWivIm5Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022118.outbound.protection.outlook.com [40.107.209.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4crhapbkfj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:18:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JO19ppAYRzMAsQUEOfkXxCF8TD0i8aggtfkCS5UzZhE7PNN3E8N+vJUZ0rx7xj4iK/iyjbqsAnd4Hzr+r7NneXVW8L03zafFFbE7LEsKqLC+F5QLgydcwUhWQhy0LGlh5X5TpWz9ctd3DVAzJF8tla0hCjAN+xFHwi+u/ZFr4qfAtZ7Ax7QLeEgBTDguarWE5fYNsnJR4I8wIyp48l3vdYQ9TbXrBdyzLEccGcDeSEOZXXI/SrfyDceAIsyAL0dsZqcCj4WVBlJLML9lzElOff3Zfb+taNCvMYWFE+SBGClbvoD2/nEhfGic4EYv19ETiogJ3kt7Yk22sLOxDBezOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOtXB6b4j+WQa50q525YtgTRtCoRlhwBX0Jn4yeVFBk=;
 b=HFhDjK2MMRcBIYZ6op1HfIl8IDAZbi4Gbn+zbjooUgTiDcqbnxDn8uIinlc55EuoDSR/ivPS7qMPPC/LT0eWjQeHwYTmYmA86ZhtV3UsuPGO88Z4awQjSmkEzho0LBvEj0eWT6fFxIeA/Xi16u+hDpsVLS4WUfugTUP3Tp+m1jPU7/Qp/crTYY/5nlx5ZGTl1T3IJ0y/6eA1GYDRyF9ojHvuDcTTWflBKsJRd6FVFBIw6xJQLDTDCSAxOPR5K0q+sBIlEJpS2uxi6xn9fxEY+mdqHnP3LTVCcyUgb3A5bxdZ9EfLqlqCfJfJnE5ZkA9ald02VWh4Aq+WGWMAqb0y3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOtXB6b4j+WQa50q525YtgTRtCoRlhwBX0Jn4yeVFBk=;
 b=UwIlmNjsI05ugopZz9eOuCso7WUI8Nu3YfOUZOOz/SNapMEQk+GKVylZxVZelhMuJi37KzHYAZjEIGnqkfbTRyHSHK3ApUvWJy9UTJFDCMBLEVKAVAgZd3F+gSgCjRKGnjf6pdNg16fPuIqhyVS7xwRdmYZrQoc11KJ6XQRlLuE=
Received: from PH7P221CA0071.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::24)
 by PH0PR19MB5444.namprd19.prod.outlook.com (2603:10b6:510:fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:18:20 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:510:328:cafe::ca) by PH7P221CA0071.outlook.office365.com
 (2603:10b6:510:328::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 14:18:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.1
 via Frontend Transport; Tue, 10 Mar 2026 14:18:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B707140654F;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 872F7822542;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 03/10] ASoC: wm_adsp: Export function for KUnit test to get firmware filenames
Date: Tue, 10 Mar 2026 14:18:10 +0000
Message-ID: <20260310141817.1871794-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310141817.1871794-1-rf@opensource.cirrus.com>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|PH0PR19MB5444:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: be3a98a6-bd5d-4525-c6b4-08de7eafe13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|18002099003|22082099003|56012099003|54012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	Kny/1/ZTAIgdTcoldVaSO8Km3zhBAwoOiXca32azh71vwG/a1a3gKaCRNjg1RgMD9cDfehKdjS1GifrafRM/J1ZmXSeLbXeKQSAcAetJInS8z1rfw9qv+RKdHCpUnDCo9M5t9nRbQAimr1UTTFaicG1pAWNgkNPqTT2btPkIOi7rt607CW16I/5eU84HsIr+wg68Y0JChtvN1KdCdgxBU5WjgVBtX2SykOBRMyD07hE1Zw/tAWPeDfT0iEK/xbkjO6MnBw52Kl7GQ9DF7TrwrdvJ1Ri0ED3kiLZfaqcV/CoaCtWKp2HWovpp45lTRocATKMFyHjyk3gh133MEcW9/tEOswhT9rQDnzKtYvUOktyisiAB3vbwnzNmHwg3sqR4kLe4Z0YMoq3yUASwPr7BRXKjQwrqhWTh/8BCYsafn8OyAAxAfRG620HgMlEEFtuLFVTrrBhymWlZdAHbRza4yIhiDoDRkoyEV8nrqua/hlYixZqSXAQLrO3PXWIDhez4CSFa2QKx6spujbf5Y5jM9ZzgDbV+rvUAaPQQvWPkUS9YaXXwQHsFXQMma7CDU+gxqaP5TN2Zzv0k8DjUneJttr7Q4cNfDMhkgz2uTsNefq/Djxx/EwsyPmCJrYWkjdd3kuTbSLs7dK/+VrX0Ilt0QuVUoPlL55/f5XbibR4Ex5GVGlkKj8cBCLS4r1/MKaP40mF8v+wm9Xh/mWr++4Id/IH1xXYlvO1/txkLa4r65JnWnnp5LWEy1yamQJ1vxJPh06LLblSMkQYD0uTAzSusQg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(18002099003)(22082099003)(56012099003)(54012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GgCNfzHgla6R4bAotNBRXmUT7lumLpxy+cLa0iYoKam3KjGGuvphv1ZvY1UO4To8qIS93FlWB2puMmC/p+o4tB5Bi6L+gxcYtp4DW6TzIBRC3XSfwAfbBxnXgev2fFpqeYsrQHLdzrmLHqYIBf1Cyfw7NVTm/4A13tA/ub4RBBuAfLuiHnstD67r3wgf7o+HousLExdCEGsBTtFw7rFRjUKIi2hZQICn5YNo3IrTaqMU/L4YzgpNF5s31a1YYh4vmAsv4fNquYP6OumJ6tmmdTpcZ6IQHU9/pPYHZgw7RhyAYAV2Z1/rrmvlncGZOTxJypBr0WSLqH2Pw8ZuMPH4UXbo503mc7OQHWf51Licmz443JnK3fcBRYFyStVENZu4GUPPQQwmnPsaY1SyS9DB9s3busuQySesdIX888YOBpegJIPmgskYONiAL8VbcBwF
X-Exchange-RoutingPolicyChecked:
	H37tscVAYzqQIz8kfJNn/DYs9/BRdiSKnenJ58NuVoRHy49ALpjk0gJtTJc584sGWU1vO+zwECSjL+jcLmeNOWTGfhKxvDM9xnKQbwMjuRBmBxpMC7Gy7M/zkSBvcaWAAxigJvTkZ4DqIJAYlAXvLXH6dR5CHSrSe2iuXhOS9uGr05D4KidSY86ZyAo0k4xk4+p7ptbF5yAsR5faHLz+gK/vIMVKWRNmzFUQ8n5y0gAAzVVEcXthRIR5caAk43En8VdRuRgW/HWH2GD95gso3p+dycDhuEtj9+DbywCeXbCkX1WSWgbskLxlpDCr/KvHtF9OfD/MsCSvNvNKv93+oQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:18:19.3219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be3a98a6-bd5d-4525-c6b4-08de7eafe13e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5444
X-Proofpoint-ORIG-GUID: PZzENv-dKITb0g5u1n_LohuIS6RIxuVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfX2/FOCeLUDfMy
 gAI9GmQeVHUeBQp8ljOa+9As1cIhhNFqoutlcJncrqMm3c7SNc18G75mcQs+phzLa7KhDj3VRHp
 OeX2tFnkOHZcjYP86L084z9DcBxtFzAHJ+d/Bz6/IzxngYW8OYBZNEesdkT31k7e3rjO5hIF9gP
 jsncx6L826YEoFliEpmFYgzPDP+sMO8Qe3ucUHlj5p/fOwHRN0yM7vqDWshJC70nL4DWKNxUlmL
 NzfStBsfzOg31uA5qZqOyKeUxOF1ancYYbcrXO/lH9AiGTxY1fc/BWlWpzAZ4a539wp8oCIqAvV
 91iEX6xHj7uJuW7DfG51cV4/6rNSjf8WXEDA6cvYb2uXViqzoesrU8JWwwID0UgeFWU+b3RgBRZ
 EY6aRThavVQUoNwCsJ2oXMwfKxDC9dmrSOCdpp1OZuqhcju0zI8GYfzxKP+YSIQTZ/q5n2Bg837
 YzCPedOq/pPitdzttgg==
X-Proofpoint-GUID: PZzENv-dKITb0g5u1n_LohuIS6RIxuVv
X-Authority-Analysis: v=2.4 cv=EbbFgfmC c=1 sm=1 tr=0 ts=69b0282f cx=c_pps
 a=X0DbKXi7RYM5x2NUiypu8g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=qKDmiOiLRtuvbdj9iSYA:9
X-Proofpoint-Spam-Reason: safe

Export a function that KUnit tests can use to get the firmware filenames
from the wm_adsp_fw[] array.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 11 +++++++++++
 sound/soc/codecs/wm_adsp.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 68e00970b8a2..79695ead5788 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -318,6 +318,17 @@ struct wm_coeff_ctl {
 	struct work_struct work;
 };
 
+#if IS_ENABLED(CONFIG_KUNIT)
+const char *wm_adsp_get_fwf_name_by_index(int index)
+{
+	if (index < ARRAY_SIZE(wm_adsp_fw))
+		return wm_adsp_fw[index].file;
+
+	return NULL;
+}
+EXPORT_SYMBOL_IF_KUNIT(wm_adsp_get_fwf_name_by_index);
+#endif
+
 int wm_adsp_fw_get(struct snd_kcontrol *kcontrol,
 		   struct snd_ctl_elem_value *ucontrol)
 {
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 599be409b669..b4d5bd321c0b 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -144,6 +144,7 @@ int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name,  int type,
 		      unsigned int alg, void *buf, size_t len);
 
 #if IS_ENABLED(CONFIG_KUNIT)
+const char *wm_adsp_get_fwf_name_by_index(int index);
 void wm_adsp_release_firmware_files(const struct firmware *wmfw_firmware,
 				    char *wmfw_filename,
 				    const struct firmware *coeff_firmware,
-- 
2.47.3

