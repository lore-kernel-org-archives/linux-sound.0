Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521D52868B5;
	Tue, 10 Mar 2026 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152318; cv=fail; b=ZjOYAq0ns8kSQzggqoI+o10Hm5GbUMeuTawM++Caey2TgYYQQlVPQu8kPOXvQNzoZDHZ4rGNPKE6OydIPL1qM46/SsnLJeTsQAmBXyMVIco0mOyumHL5vkrIF6KiY4QW3acqQTWVRWpxPBks3E+wZlTrgpl7Fs5t6h8WGnaR6Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152318; c=relaxed/simple;
	bh=RIr8ZxPW4hgYwQsKtj6WNMqvzyWSZaQPTpW7YY1TuSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWXNhvndA/ea2MNrpKwfslFhQJ5uUwAdK4b1vg0kj0NWHYx+rYbbJMCSPyZZqIcUmo2Nh8/HKLB00k77fuAKQZu/2vfFwoJiRXcb8mOQmlIuWm0oS0Eysb2I8cvr2ius0E8BPfAC2kkD3xhpFZMk+S5vBizC6iLyuFpuVI/h05o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pAKdPRz0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=C9D0to7m; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pAKdPRz0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="C9D0to7m"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629KvbtA2288204;
	Tue, 10 Mar 2026 09:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zUUWjZgaeHDAoKUlZ8hksJBm2GPYpCPLFfbopS7A0uc=; b=
	pAKdPRz0764Frh5OnLL+jhLN4K5t9bWKNXqIiBJTczvn00Sm47NJ/P6nxIJlwTsM
	nShru7ZUnPJSe7/IBmMull/l3j585Rm5dKM1F5bAbYXQkIzc8wIct47yG8van/rC
	/x9/GLF1FvKa+ujCfBwCeU0R7l1A1lwcvrNmnjE//JKvGIYyXWI/vT2pp543YjNl
	vDo7U1WVuZULIGI3dJUwweZfqeA2d8dBZU2XuN9EtKsRvzlP7mJzKdYCRxi3okGb
	bBVLxeaDshXG4b28SKVvSaZ/RGaFNkJy9zNCk1RoPi74y24lBS/VjgnRhi2E+9/7
	EBJC7fL6VqM0qq54/4hbEw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022139.outbound.protection.outlook.com [52.101.48.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4bk2d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:18:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSvmX9fsqn5MbteamwFoN14Sc1VpT3wYG0godY94bNBGLn0FW1n1blqlthKWkOdQ3rTcY48Y5fTDY5F7r7IVzKo5fleRKQ1w0Gd39/9HKXh8zoWewH5QqEUGM8+3e9Fqu+32J8qS8YuknqWq4gzGTl1bhTIJaQrXmxjFbO23FvD8h8jzgYYH+hT/NLihcbT+1Z/8qFDNKeVEuobpwfLZs3PzRqMFN9hFzzevJeQTAo92Dn0da13UgYm3dF4rkMk4d9sEzfelD2uF5mTTx/+xXQTAVWTEtq9Tx0p+Cm0UEfDQKCN7DNMzCzI1UL7/bwZ2xTuVF4GBUlZUuxacn0k+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUUWjZgaeHDAoKUlZ8hksJBm2GPYpCPLFfbopS7A0uc=;
 b=Iz/QWAswBZpspfF4fz5n0JqBKzvMPnUYr2uke1pQFVcHgRLOy1h4jmI5e08Q0ffO28KUyXmBgHhAH+PTqqulOFZQyaCpCemMgkRGUlZx5t+i+6TJmbrAJesM7GryrIko//IO0tFrW52zG6gCyWzrqZdCXszC7XszvcNxso6I1NSmepwO+GHyofWZKboKyE3Dj/0vLp4cPvxzwCLGlQq36Z2ahEUSl99CupgbhTrsWxDYmg3R6U9o+TpcAw2dPMDk1iMTNDRQWxtDUeweI7+WQYYEYOOnoXY4ARDX724sc42rBM3hmvqU2O7rh6E6ipdRgoe8KVzP8iyxg4DYjdxE/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUUWjZgaeHDAoKUlZ8hksJBm2GPYpCPLFfbopS7A0uc=;
 b=C9D0to7mlyKp01/a58h4j0G3jFSAGYje95dQiUzTVFFnsChTWC5GruIEnwYykKR4FpHB6feXa9bOkXFpjmoZ63eCDLXvJ3qLeGbD1GPrKDfiLfyvw5JQ4nFDz/A5yGrz5av/aBMzulaAhP1OOVt4JZFzFDfkEK8HGlvsWcBY7TI=
Received: from SJ0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:a03:333::31)
 by LV3PR19MB8367.namprd19.prod.outlook.com (2603:10b6:408:20e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:18:21 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::9e) by SJ0PR03CA0116.outlook.office365.com
 (2603:10b6:a03:333::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 14:18:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Tue, 10 Mar 2026 14:18:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BE876406554;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 91F4E820249;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 05/10] ASoC: wm_adsp: Remove duplicated code to find firmware file
Date: Tue, 10 Mar 2026 14:18:12 +0000
Message-ID: <20260310141817.1871794-6-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|LV3PR19MB8367:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0b64f02b-e362-4cad-40a1-08de7eafe233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|18002099003|22082099003|56012099003|54012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	Hnxc+w6/uHYgSv8xm35gGLKEDN5JORYUlzB9ttqSB+9nZudQMrVJW7eY51kL1OANnXXVwidAyuVEqF0/YPvY/Q+BoAYJX8+mEUJsEaUSqBrFyPoS4PXOptqfb+tGMvYbEAR43ezJuG37zqsu77O9UxYaEdAX+h27bUB3hBaZ995SronrkZQbkf9MhWHlhnZt/0uosgxymt2TYMEqUGpnFyzxg6L/WrbK0eiUcIjwtloXc4qKp0IjQ/39egR8x7mo9Pm3HObzn2/lM3qShEzkrS1kyq9GhDU6m7Xilh4lpUGJjJ3f5TzSkYKZdjfrkLbcC2UdRmUvnjvP2N2y3532+DZrfISSoppTQNxE5GPALUI5V0jWiMK0f/RH9977uQvYPhb0GGTUuu7iba0T+ViRsJ33QOHIKSxIx6PNTOeeJSbL9CncDg8RRojivMD1+z80/Btv3lp4KXmMIRF9DKziu+P1+2wU2o+R4TlHQwo8S8Dia8HlBZ4+kFyXiz8QdvkomQ8lJyKg9GFf1pRJDm5efF2ZcBMQYnV3FypPB3utSMn2IUjrl9B/T5b2+iSgg7B87Q2sHqBOSfwXTNeQuIi/FkH1wGVE5lcT1wsz0ZaaVX4yAIIZWFkQsTPzHkrm/5qadTCrOma6e01Kwk8vGgzd0xqFAR9C2zLfmXEVSqUR2CyyDpGPA0SgIFVkXKokv2wizBjENZ6FE9PGcNOW4Vc/9AAExnSRBpKtO3ba7c02DiFYuTMb83J4iPrMwnRYi76WsvlT84id46KufzMXMVtxog==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(18002099003)(22082099003)(56012099003)(54012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ro3YChHbN0t4Pp8p8YQtFnd6TfKzUVufOu6CxEOI5xyEfxM3apRSpA8WR5Tg7iQkoDz2bP3/hH8EWrCV0pS7BGPJ5iMC5QdjGRzsZbsdckGWuNHXd2P4G9rDOpeHtdtDfFJ7t+WMTISkpV0HcgQr0yvFd6hvR2XWCQavjKF7Sh4F9sumBHQ1frQJhwneOu4ASaO2XvwMK7gmjb2cDTQB6+2zY0RNTe6qiqcuCT+n7CHe+dj5Xgf/j7+ADhFlb8Aw2C+rIUkdmgLrGhMO5BJ318YvTfvDc2BdrJEN31a269QhcaLyeAt1dGT98NTflkggS6tnIJzOXmAK2xmuwLCEcOq45Bbk7BQC8wrx34fAc9dXAlUPgQ7sMGFukvjs1Nj+JnfjojEXh04+2yvVD60bsxAW3XlDPOHcST4rRna7M7kgXiSHmSxUIcm9bhmEP+bS
X-Exchange-RoutingPolicyChecked:
	ujdvDb99Vb7fB5fFI6SJ8g3k00CEthuR5xwi1LGA+P7BZCFIGKY7MP0vwfoeUO0qTSopJyupK+ejNo9U/6rB9m+87UpINq4ql8IKPPV/As8Ecw2dK3SJMCchAMjF76Ltu2rN039egJEmI9Sm32nxMcCAscYNw2zSgkl/cXk/0RFE97b2nu17eyXZmc2az9Gf8b1wCl3Grrf7EzbtdsGO890simhPMuxERpzSKh6ImwWdxR11ZE/VkGs4lmfdVXxp4U1oaQ/E5Y4/MT0c+CM2qYdWFPorQ7cuWRCMqIqzf7SfDj0yRg7nl/bb3nibQDzgrU5BbXuYbxAwcbrSHQ6ezA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:18:20.9418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b64f02b-e362-4cad-40a1-08de7eafe233
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8367
X-Proofpoint-ORIG-GUID: 7NWe4hIoiSdHEaoqcnp-47t85kSBVgLW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfXyUZiniompKhp
 Q3psThIxKWs2HkQv6pdrX1KTtGrox80ge/GGEUEj/3AUPXc0SDjMrd87PGodK0YRXbnKTAZGtC/
 vWV320c4heW+D1yWxCt06b0iCQ0uzLGI/22zWGJ9USYZ8Tq+063y/0/HrXi1FgUIlxJe46S3Rc4
 WhYklPDMvFK7VbYUj3UA0zmRsUobHOaoi5bWWoyLbb8ExLE2Xha2qvMOG9F/r83Seq+Tk2Hxq8U
 tKB4+E6zkXRFKGNjllnXgVqylohY+COayFKnHNv6kb9R7uDAOPJ8v0fxyyJJ666cBGzr+U9WQb7
 eIMjxIq9VZSPWK0WkGmI8FopKEAn6MTyLSpHGCZmeNyuc4Q68w4nbxulpTdNd6JsjcbGdUE0nrX
 7bkaHnVTcpaQMKUDFJ64JO/2yFk6HKNITVDCkYU9pfenLaVe8twm/v6OzI6/IGpTgrNB7HZc3d9
 DsEALUvPPr+WiYS1Jfw==
X-Proofpoint-GUID: 7NWe4hIoiSdHEaoqcnp-47t85kSBVgLW
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b02835 cx=c_pps
 a=s29O/COy1YFP/2RSJs/JUw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=GLtecoyBIyGoLf17jBIA:9
X-Proofpoint-Spam-Reason: safe

The 3rd search case in wm_adsp_request_firmware_files() does exactly the
same bin file searches as the case immediately above it. Merge the
conditional from the 3rd case into the second case so the duplicated code
can be removed.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 79695ead5788..b904d1e1b00c 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -828,9 +828,10 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 	}
 
 	if (system_name) {
-		if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
-						   cirrus_dir, system_name,
-						   NULL, "wmfw")) {
+		ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
+						    cirrus_dir, system_name,
+						    NULL, "wmfw");
+		if (!ret || dsp->wmfw_optional) {
 			if (suffix)
 				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
 							      cirrus_dir, system_name,
@@ -840,26 +841,12 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
 							      cirrus_dir, system_name,
 							      NULL, "bin");
-			return 0;
+
+			if (*wmfw_firmware || (dsp->wmfw_optional && *coeff_firmware))
+				return 0;
 		}
 	}
 
-	/* Check system-specific bin without wmfw before falling back to generic */
-	if (dsp->wmfw_optional && system_name) {
-		if (suffix)
-			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-						      cirrus_dir, system_name,
-						      suffix, "bin");
-
-		if (!*coeff_firmware)
-			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-						      cirrus_dir, system_name,
-						      NULL, "bin");
-
-		if (*coeff_firmware)
-			return 0;
-	}
-
 	/* Check legacy location */
 	if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
 					   "", NULL, NULL, "wmfw")) {
-- 
2.47.3

