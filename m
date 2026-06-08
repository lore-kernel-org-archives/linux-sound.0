Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516633BF69E;
	Mon,  8 Jun 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914527; cv=fail; b=KbiGdbevQT+mDR3knOj793ZjzL0vX7oFQaZHCm9F4C8ul9GfMfBACD8IL384ukG9oGU3AYfYoONfvaA2sUTPKcDjerL5e/x7dg1QRDQ8B3xa6j6Rf2rIqyWRq4tVHhbg6KjSPghphPi844Mhk5daEYDw8lemhUm2AVaUAtD9EtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914527; c=relaxed/simple;
	bh=IpCkU292tO8QXhF96gibwEnZWBekebCZnOHcU2/Ebug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pXLb3suzrLZsCUIpXuGh0dpEZznNrnKcFYmeIi8mtNgVJqOY0KMHJIWcq4KLIRPnAeJW6u7+2tiKLrplX8PSa7T8sIyKjO7qX5QF9yzcu9aENhj+0PcHoQhSmfgUDAF5tC4tDnhBRRqxQm9OLNv9JEhF9svEnbLM4XPV0Z2n25Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=d94+9792; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QTKn1N19; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="d94+9792";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QTKn1N19"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6584wSqQ1866096;
	Mon, 8 Jun 2026 05:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rnhFVcFD7YfXcxt+PKmDa3KaZA/ahaMUA65FN3Z9pzQ=; b=
	d94+9792DvVHHkr8YEKYjvLnE283lYgOjOq11egffiOczD1MMFOPc9qJJIEdRDGJ
	RabpATzHWlp9h1ZF1jQiLMZNz3FG3lfP4WxHLtMk/oz0cV3jeTQQiOr7vL14AjrQ
	dYQ5XegFNJIeXHMR4GxsYwx7T/RBGoc3//uskAI/xENPzqZKvKH1YYY8sbja16na
	319o0Wq9YSQf4Jj6xF2EmJ7lXM++36mH82zVjquElrEmoY69ykbMugJhKqUH2JP9
	Za0ioAyks9n3mSq5VMGjfT93m/+TUykeL7IC41k1FdTsPfTF9ulV5g0aJ8hMLJr2
	K6wAnsacet3CDnHUlT395g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023108.outbound.protection.outlook.com [40.107.201.108])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfyga9ey-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:27:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gG82GrOPL/l5YASKYCmaWHPrz+rGciKBr1zCCLiSWlWHy3nD2/0gDG3RyoJReZjEB1y5njHCjwILcZj8zhnADfNpTeFUcWOA9Hv6bTDg5ULFwnHExj9R8KFgP2J7tY/H8KVxVvxfRacIVjNbkXXFGlw1MfRu+cvr8uJLvvEkPZTcqaNVroBB78Chynl8jk6XMvDgjsnrg/kT00Bz6gzybG/u9XboN82b4XpBYjvh2CX5fn6M+t6/82DD6KXTtb2FvT8Z8+kZCiEmhtEKq9dhjnDTFRrEOhSluSvVO5lhSTwnwD2Zla08J0XHaCXzAufsyQrfNNZt9umiQBVoWxoSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnhFVcFD7YfXcxt+PKmDa3KaZA/ahaMUA65FN3Z9pzQ=;
 b=x/icwjFu6ZNIjJ8CJjdVNdm9160ESkxNhyP5K6jdpDAm/gc1QbAk6wo84E6xKVr6r7lMz1FtMtz2P8dFzVNTfPYh7OOKweesinhCx48eqx2Nfobbm+g+1HwZE9OUewxydWs1OrCIGTsJav3i0ZkJWiF+teHIV0KSDAsOixkHjJkTPU/q/NJXS3oruYgZGV8pYwuKqE/faisjBBOY5NfN0uU/t1aXqv7fZJe7OCFI5vobmYSk8Shhrro43RGX8GVIFxLwxK/veBg3J6X0ddo9KSaqGe3sTEWpyrhX5HAV8ICi7zVPE9hvO7LOeMPzJSNYIhEJA7nBDDIvbAxy5FQl7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnhFVcFD7YfXcxt+PKmDa3KaZA/ahaMUA65FN3Z9pzQ=;
 b=QTKn1N19oBSNo3qOVbX/VMCZ8/NjncUQvGbBUsWsnRPLKValJQ6xh/c7LxR7jOS17skdS8U+ynB+PWl0GDeTq/4DQr/+mVvhwdO0Wj0ud6jfLcDEpf7zlNLehklxv3RmjPoGB3O+7VjVsu/n10HVJzlB8AiyOReMxbWTGGKAW1c=
Received: from BL1PR13CA0415.namprd13.prod.outlook.com (2603:10b6:208:2c2::30)
 by BY3PR19MB5076.namprd19.prod.outlook.com (2603:10b6:a03:36f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 10:27:20 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::5a) by BL1PR13CA0415.outlook.office365.com
 (2603:10b6:208:2c2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.8 via Frontend Transport; Mon, 8
 Jun 2026 10:27:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 10:27:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F2994406555;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B785582026C;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 02/10] ASoC: wsa881x: Use new SoundWire enumeration helper
Date: Mon,  8 Jun 2026 11:27:06 +0100
Message-ID: <20260608102714.2503120-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|BY3PR19MB5076:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 01dfd46e-e290-4f86-6052-08dec548851f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|7416014|376014|82310400026|22082099003|16102099003|18002099003|6133799003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	SLsTS0ScwrQ0aPOjA45CyWgtn2POGUxPvNL966EkIPn8HsmDYW1f3n4VadmvIPMJ9yRpcZQqiR+q2HjtekP7KxYxeH/Klr2wDrDRvH+/3uJ6a9DYmKXNmSTMG+u/RVeSCVYVj5/FCLzUxGUUT0q1eukDs4DmwWXjnzBXMEkJ0Gms47t4zLBBA6fLoD6sly+lZlTqmai4UoD+5ThuD/nNQJ4NDtKdBWbgLGtq+35sV7Ukbb4k8MeVQe/qXk1GSSFcXVN6b4iV5ShuIylik7Uzn696KomQRNLVPSy4GoI+ogRmjJ/DRnBbQbOY04Q5EiMYcgqoDxCsmRWXw/xmHju21xaTdZJmkYVmKXuE27Cb57uuWv1tNJ0p1v7EhfpQSa2fqsAdeXAlZstZwBygEsXj18HUqG+zkYPTog/r1+W7eZQxHtWI9KoqmvCQPr9mj/TdY+NWXJmX+vfeESloKw++fTHvlPMJk1lnLkn6g0Dz6D6LUPhCkjrqY7sRhH7OmZCwLpuTBxP6jCvtmaywm6Mf92s+wOfG9alPfpL1GOQlV42kXlQRcngL3u9f4Yjr8WCmd1Sydb6+nNQ3b0ihiLyqMgmnmz7QZLujwMEvt52pKoYOfW85gLMpk8lrf7xpUF6qhB+m7ewchEQzTmdd63yRnu7guUTOCH6Ix3DYSGvaqtPHg1V3TAfl3TxHsIKknSzTz2OHlr2Ir/A5J/osxuwUxCNN40HRDDvibcNYOBJwznE=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(7416014)(376014)(82310400026)(22082099003)(16102099003)(18002099003)(6133799003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WuQNTQZ72XQot/VHBnUMIpyzSrG+ZX5YhB/Y/gd5Zh42lEPo/F5y0vGlCx52PZZYMB0W1lUZzMz/UXxvzdPzHsh87ifF05NbsZg5Z+ljA2bL5ZfrrmdY9W7civEl9pbKLfdh7PjmOJtahYeyBav96viLSdC9oUTw92dPW1fsFt+hH1cycyJeCMrp7O3O/hkg8kElKnkDLTZhu2GSwr0F2FV3n7/kixiWa45RCsZe9A0QICoy+1WBv9rQ24FO3bR2w8Z4yKu5D3uZ4tQGq/6LB1SQGK9rSYtYkpFJ+YBv/1SFJyWjmD9f9+i7QznKqmhghSbdep92mQN7HX2tCIXJ0kvaKFV4I4bSKYWF2VsXNV17ldyQRyCGtW+N/vcmYGzwFMUR4kIZ5YaoEiPxgK/FaOm5AVZlgxrVVpOuxCPYveBwxfpxu7XCwHdnbQ+ZaZEA
X-Exchange-RoutingPolicyChecked:
	Lw2NwhRnVvY9ccVStLVY1MmlSHXW+UAPEEY/eDAxENVX0Ncm0TI01ZMh4yEHpSbTeV3xcNqSDwDXMPEfgpcNYLtnZ2B3XdUlOcml6uugkHYE69lfgblEvQimWlCzmLeQct3TJMMs27wpM4MunUvJJBlBqcCh0rAOj2+sdnTg5Fr515higtoE3YERCigyhQ1iNR4pqghWp2Vr+q2FXXKLsmNvz2izltiL58ahI8yeUs+v2KONZcixDIPM0WLnWvdrG/ezMdVyE4GGSMvpSMnhPwCgN4anIuEFdlrJVe8NXvBhqnjdoSFzv/RXH6veMjY9YEkhQyhQ2bW4q3Y3njZ63g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:27:19.2742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01dfd46e-e290-4f86-6052-08dec548851f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5076
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a26990c cx=c_pps
 a=ZLXFQchnQ28/TEUTaBYKyg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=BxSnUCk73ilfYBohU2oA:9
X-Proofpoint-GUID: WxdnsmU1ejKl_vOSkP6NZfq8nOvie0Oi
X-Proofpoint-ORIG-GUID: WxdnsmU1ejKl_vOSkP6NZfq8nOvie0Oi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NyBTYWx0ZWRfXwpNSvP6xFaJU
 Zgl+ICztUp6DC/5czFLMLOm8hOMB/TmXqtQJr8EuEKs/N0T/Q3gn6+1K+18afN/ni0yuXB3UUKK
 fgJ39FpDQmYBGJKthdl4kuYDAQndSOjO+EsCystWYYTRC3DMXKTwsjsX2VTF3lx6Y8c5i55oucU
 5AxyRCLuuUMq0MOspgNSR5bvx7MMh6jx/tmp4S71pcI5+Y+dH5KZuKq9RAGFBEFs65ZAKwMBlwb
 49MvxO0hFSDcmIHsjkjV4M8mazHABTCGDihxUvaO6dT3wceW343Bs7C53uVSnI7mIbOxOPVutL4
 ceAv+cSZvfFI00bUc1Gf5cG/rW6icAI9unPb8i1DT1ySbN0jjXH3vHsYkJRIJI7pJMIkpCW69Oc
 AMy9/JZa/1i6VRswfO1j0jrjcy0XB2yy9Ss2LNWEICHezAqClb4osBl96TfrzZLDxchB9KbNUfX
 GhyqH9a6mr526wOuSiQ==
X-Proofpoint-Spam-Reason: safe

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it can be used for code that also doesn't check this
flag. Update the driver to use the new core helper.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 sound/soc/codecs/wsa881x.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index d15fda648dada..5174614c3e837 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1167,16 +1167,14 @@ static int wsa881x_runtime_resume(struct device *dev)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	gpiod_direction_output(wsa881x->sd_n, 0);
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(WSA881X_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(dev, "Initialization not complete, timed out\n");
+	ret = sdw_slave_wait_for_init(slave, WSA881X_PROBE_TIMEOUT);
+	if (ret) {
 		gpiod_direction_output(wsa881x->sd_n, 1);
-		return -ETIMEDOUT;
+		return ret;
 	}
 
 	regcache_cache_only(regmap, false);
-- 
2.47.3

