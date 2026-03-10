Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5043B2DC35F;
	Tue, 10 Mar 2026 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152320; cv=fail; b=ekInmgVVtvsUGo7ui2uwEa1Yi4FpDNIngjyiDfW0IFww5rQXXbq9ucdYHawHi9AC2hB7L6C2nFXt0cld3m6ot6PCXi5UquGkLW42CTZZsIHAWlA4q1+3xLnkuMj6DX+Ow3lau4aoVp+/rPtQw2v4u0gWNW+Bvoi9Z3cr7c7edeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152320; c=relaxed/simple;
	bh=rFM+tHXaa7Ob/7T46rHNsWVKHXSZAGFOIFu5J7yRLZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HO7j23/Y/nfqRVJFC5IuA+ImrLb7QxoNUPyV6dZbcD2LJC9K27ZOCy8jgJnUXVe/6RMPc0iauAWBnH7fJ9PSe+uT3ZcWyLxtRp4EEXZReiEPrgF1TEhaBD/SjIYVsIBhayVjEHSOkeIInJcyGA87XSEWE3OE5tj+XdJIrK2hNic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aF0BqRW4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=K7ci/HHd; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aF0BqRW4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="K7ci/HHd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Kvbt82288204;
	Tue, 10 Mar 2026 09:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6S9CnCeR3I/73F/ci7xcoLjjbn1tUm3KDIMsnPI33aU=; b=
	aF0BqRW4g9cUHXLMdHZS1VMqSsULYVXU9r3xOGrTW4hgNJOaaXlLw7smY6v9qD/w
	C46ckABqNxvlTGamvx+rnHz5QkVAbFJhohbwHxtsGEF6evXW+b829WxsRQWMJRQJ
	w2JpaG/PpNKiLBoT5slW8OA53hUBvvx/623+KX5Pu+pxprFfFBiKSpdVEu29TeoW
	ocuJF/85k84A0l02Cd3kfYdW687kLNIm+fGuCUPX4R+l5eASNHfuIFlSRkyLmsDi
	zWLqunqrU2EPO6/aSgJzqgts0QykS3g6W5mtRiVGzsgZEQDrsfVQqZmaU9SOCRXz
	ycfcOTyK/Obq55zNNPcltQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020085.outbound.protection.outlook.com [52.101.201.85])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4bk2b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:18:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xz1roK+spWV96hEg9Uo1cJ59nQqrSxSwxpif2NHWVifeGz837rcj0KJmrN4DCyhbPckPhzegaErKSk4qB4NTTQIIWbC/3gyD12IwixzuMvwlq/SqaDIZ/LeIfORv0brzEgakCaG8HmQmzwzB++JL3dRZyXjEBij3Mdly8IvIUY3k/VzNjd7uvpVXzstI7SIqZh4MYYMV7a7bZVDrG/rT9TE4a1A1aWk7YeDIxvRQToMjCMHHCw7QB911cQkNQKy8ichEoRSs3vVWe4efkP3Wh3YvaHvREzYBuY4fMMrjJJogo7jyNZeP6tExy341jofyxqnkafd+zPb4i/WI9lrsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S9CnCeR3I/73F/ci7xcoLjjbn1tUm3KDIMsnPI33aU=;
 b=UhsdD/N3o9mP27kl1a5+6PhLgjVsH8HS0m3KzM/nH4+p18Eekkv8sC82Bdv/tgnjg9I+ywgGkAVi/7zIFLTL11k+ANUgxuCxxXDaZzIEd9qpXnhwvyLUErq+JEx19dOdPGljsMWNyNGnFL8vx58VE1GQDwBduZmRFVxthv2vnEoTFpN1PRPW/GdTgtm5lzCR44hRz96zTNvVtSXfeu7yON9B/MEwuM7TDpwBL3u+L3/gvl0D8JyE1qa/rhaWlz6PMokSM53o9/9YUH30M63wqD9a6ivXIE38pCuqjaC96DU+lVDSDdxEmjO47DCw+74NEQQTWI6g1I59lGlrp7lhvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S9CnCeR3I/73F/ci7xcoLjjbn1tUm3KDIMsnPI33aU=;
 b=K7ci/HHdza++7F9H5kqd1J8l/uoVMWUnjrErmCJQmmjpqYqSk2bgwdPqNJYOFrRUdbJUVjgd204sZEDl+TTRXj+lDM6NZVc5gc8BnGlZzanIohLVsjfn82T4ONAHYZo+PdlilGcI7SuQnOhMP1vh/J+FzPrzSV0ONrpNapzV9Ks=
Received: from PH7P221CA0078.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::9)
 by BN0PR19MB5295.namprd19.prod.outlook.com (2603:10b6:408:156::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:18:22 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:510:328:cafe::55) by PH7P221CA0078.outlook.office365.com
 (2603:10b6:510:328::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 14:18:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.1
 via Frontend Transport; Tue, 10 Mar 2026 14:18:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CED7A406642;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AAF6D822548;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 10/10] ASoC: wm_adsp: Combine some similar code in firmware file search
Date: Tue, 10 Mar 2026 14:18:17 +0000
Message-ID: <20260310141817.1871794-11-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|BN0PR19MB5295:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7468dd97-bc84-42e7-d800-08de7eafe2c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700016|18002099003|22082099003|56012099003|54012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	5Zwe6ZcyUpdOWaYT2vNdTblIKc+qsYbsNSkRtohRFTdv4a1t32IJgeXQSj726G9xNHO0/qjkduwj3BMrAZmAE/vMwpx86ruTiZAmeD/hlrtm3AC/egpx6TSenG2mS26kus0nWlviqrWkn/ZNTiIpcA6xlF/o8na5dv1QlRA0Xjry+lKEK1HyegVpnzm+1YkDTpyaLI2H6mGROf5rGiQYpYZGhgA1b0ffX5wcKu1bkGcxHJTvcEPtipFku/rx0iqkX3WCqnp9ms8JA0iIZIv0l/g8q/fpUTCcVF51+9Q7LZ35NOIzdoVX7oPJJTs8qSans8XNK6dYhVNw53BjlJcQmi7rqbYTl6pXDG8dAj/x6EhWf2/XubIHDkkjx14N5hvrQudo0/PUfNjogJSDzFdB8cpgbvy6mU4Qe3/TGhYpyjUihTdkOxfTTeciQW+QB3jyJ3fD0L3PTBT0n5yhDYoz5gK52DmgwynV1fJBohsD75Li+7W9acKCiKt79llva3YzQcW6IVJGkHIHAvQyQo3GM9Cz1B77SUvNwm27jxpUYc5iwgC251FWQL4EboiDbflWmA3cMVQp4PpRyCmqlK8e3519b98FI2yITzdKYvhXFjR+64+ZAypwgEFOlpl/enaqRmkmeGhac4WqarQoMp5qaiCTw2c+XmUdk774d+NOqyT/IbT+zIP0uzWS7wgTw8EpOmSho884yXmUQBoG6Ep7oGWOd7q7wpzhJ2r2EnPUP8EWKA9YFqgyUTAWtKoY9ukVlmoOsWbZ6nrWlfie86OiRw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003)(54012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GRQQzKKMnsjFMQFDXIbLmWSjoHhwGNVylVu0Y4w3x05JQ17ud4uuPIr7Yrzg7GUd4+LcjE6GNDeQWO+CBuknKviemfg/j2HzozwEZo1+SFTVhlnysqBIM+au7eYH32jnNxOETLswpwxuSCAQ9PO2tZRfdoIZsahGPmRyd3og4MIRHpwIfswlpqoFlPncGUFQGZ7x6AiyIyE26NcgL6VJ0Yr3ubmXu03++ywc1HbTm9DBQJGOzG3qUgaOB324z4V1zcjbfYGLzANuX6vhusVuwtpZPqZWCJIV5r30ptwoY37OpoI61xHU8TqcsQsLEoe5N6PaoZZ9KGcs3xdCWiFCAkh5G3G6Cwhp8U1MA3RuKlgeek8z7b5WINTpsPOfe7IMdnujBOEnPA2kyk2yx1zM4S5IttTP3YApxIzOCFO46VA+Ybyn4nZPrGmGOg9XQ7SC
X-Exchange-RoutingPolicyChecked:
	X4QRVHZdAjwM0vi5avzuKRleTn0zNt1GyNAXHrvEE+Hlx1RMxxLT5lUBfA/m56nDIao3y0PohLlSoppiAh5KM80XZd0TGmtB7pj2CpiM4FpsHgwX+gCpx9mv1o05yjZtNZ8+b1mJ7q5qCk19suMf3lA9Y/nXZqiJP7BkomHdIUYhQS3PZYqUStRcha88hU0r7bHmfexintaXODAzgNp94BZXBHlfbARpYBWtmdBG1MvNuFiNCg4YSpKBkQS0LgBWzwZt9Ysh4lsw7VGLbPkxQ73Q63UQD72ZH2yzPqIuJGF1v2wI6vv2sgLZ6lqMwXWiYdaTuYUXqvn5JBql6FArBw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:18:21.8757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7468dd97-bc84-42e7-d800-08de7eafe2c3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR19MB5295
X-Proofpoint-ORIG-GUID: xfvFFXOVSKi8tmanA8EUM-8H_RKC75OD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfX9cQgRZETyuJI
 RPJF2Hqw0CdW9Pc5qXb+qXPIGQAzod2fhlFivtuiBvubG2P4dVz2UOuwbZgxYCZr0q3TBIdBHG5
 XRdWjODnk4q/KiYjYR960rE6Rx3LJsAaie5fwzY0AuzVEhvq2fQrvP3Qa8ZvDwDCQ5U0FcNYhik
 vZRYl80PsAQYbQEK9jcNU+oUYqULSxMfO9prQ2kjku6EYhxvBmj1zgKPHNRbxsdIDXlkxRXx/YS
 uwtiik0vx2HbgvmII5HqV24UjCIBeWEWgYFom4ayAdFO7Jk74xFdeM1gPEF/+SFx5v24kplkgxr
 m38cAWAWqZhc54dSVTG5Gro7GvmXz/POw6996gtn3lKPHpcTyPreLBeRYqB+JOEmtfij5wfP2WP
 uiCkTtz5rb3npgwYB55UI/tGBFWGfv+yEyFGCxzVUat9/x3C63JwhyYyB3eA2zuak9ZT6fuJL/F
 WDatf1brqKfDjhWw1Ag==
X-Proofpoint-GUID: xfvFFXOVSKi8tmanA8EUM-8H_RKC75OD
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b02831 cx=c_pps
 a=H3Na7JgWheL2EZIWx/c7UQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=pikAlEzSmbeyXIGJbxYA:9
X-Proofpoint-Spam-Reason: safe

In wm_adsp_request_firmware_files() squash the if (system_name && suffix)
and the following if (system_name) blocks together. This removes some
duplicated code.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 49 +++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 1c480d59bd55..a637e22c3929 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -804,47 +804,42 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 {
 	const char *system_name = dsp->system_name;
 	const char *suffix = dsp->component->name_prefix;
+	bool require_bin_suffix = false;
 	int ret = 0;
 
 	if (dsp->fwf_suffix)
 		suffix = dsp->fwf_suffix;
 
-	if (system_name && suffix) {
+	if (system_name) {
 		ret = wm_adsp_request_firmware_file(dsp, &fw->wmfw,
 						    cirrus_dir, system_name,
 						    suffix, "wmfw");
 		if (ret < 0)
 			goto err;
 
-		if (fw->wmfw.firmware) {
+		if (suffix) {
+			if (fw->wmfw.firmware) {
+				require_bin_suffix = true;
+			} else {
+				/* Fallback to name without suffix */
+				ret = wm_adsp_request_firmware_file(dsp, &fw->wmfw,
+								    cirrus_dir, system_name,
+								    NULL, "wmfw");
+				if (ret < 0)
+					goto err;
+			}
+		}
+
+		/* Look for matching .bin file */
+		if (fw->wmfw.firmware || dsp->wmfw_optional) {
 			ret = wm_adsp_request_firmware_file(dsp, &fw->coeff,
 							    cirrus_dir, system_name,
 							    suffix, "bin");
 			if (ret < 0)
 				goto err;
 
-			return 0;
-		}
-	}
-
-	if (system_name) {
-		ret = wm_adsp_request_firmware_file(dsp, &fw->wmfw,
-						    cirrus_dir, system_name,
-						    NULL, "wmfw");
-		if (ret < 0)
-			goto err;
-
-		if (fw->wmfw.firmware || dsp->wmfw_optional) {
-			if (suffix) {
-				ret = wm_adsp_request_firmware_file(dsp,
-								    &fw->coeff,
-								    cirrus_dir, system_name,
-								    suffix, "bin");
-				if (ret < 0)
-					goto err;
-			}
-
-			if (!fw->coeff.firmware) {
+			if (suffix && !fw->coeff.firmware && !require_bin_suffix) {
+				/* Fallback to name without suffix */
 				ret = wm_adsp_request_firmware_file(dsp,
 								    &fw->coeff,
 								    cirrus_dir, system_name,
@@ -852,10 +847,10 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 				if (ret < 0)
 					goto err;
 			}
-
-			if (fw->wmfw.firmware || (dsp->wmfw_optional && fw->coeff.firmware))
-				return 0;
 		}
+
+		if (fw->wmfw.firmware || (dsp->wmfw_optional && fw->coeff.firmware))
+			return 0;
 	}
 
 	/* Check legacy location */
-- 
2.47.3

