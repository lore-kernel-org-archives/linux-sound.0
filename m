Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423CB2D9496;
	Tue, 10 Mar 2026 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152319; cv=fail; b=V4EtFgTzIageAqB9lCTI/M09UhhyMbPab8zbq8un9HjPb7U4d4fVtVuvKpPhYGkLXdIKqgc75qYfJ6f7aduPeQ7kn8X3sCopd8twzYdqYw970nhr6fjnrOmruIBlCpgHgZyp6EFvZoUI5NkFNx9KTXJ7lVv/NwzV2SLPBmcYGH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152319; c=relaxed/simple;
	bh=st1l2udEJ87cpNRDbgg8clmEh+GHXgPbzkNlAKeRJhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WAyll2X3Gr+m8/FRB9XK0hlzGZCatMlJI/MVJfpRg3LVb5w9GSs5RR6T/bEccxr+VciHDK5GqEXnh/AMQTwa2gCJattDubsrlPksuaWTjzs1+Qeu6RWBEknhmVlHcxZYL+4n4Ba635ahteYoQ81TFww3uQu6UoWX1qU9buqrxLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p4AjbASd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GzKMZ8JT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p4AjbASd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GzKMZ8JT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5IOPK3088252;
	Tue, 10 Mar 2026 09:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=n1B4Mps19CVXTWT88nM8hlVyzXESeN/nVb+zFGEAwkU=; b=
	p4AjbASdhoJq4qymIHpoE8BKvhLG9N10xj9eFi4FMR01FUDwkNNenjFsKwFO5/M2
	3OGXtyG4pwN3GcrSN9c03nnBJtn+2FpfcRTi21XGvVZdsnhgmD4L0heAEpZRFUog
	KzdimGIg6GYxIc6RqcM/8JEGEn+PiY2uCc+YBk4bS349gTstHiLq64Uvhamb3ASy
	XUNYQ7wH7KVmcF4qLRqmnxHaHXCzlFbWhe1p78A681lr6s0TCNK6oEYaQ2+Dl6jz
	ENozcTsXvawN1HyQ8TUNCFq/4pAhAntRnKzq9jOFLn2+GuV6KAy41UMJPZ7Oth3Y
	RSqYtTIM4Fhs4e+gNAiXpg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020117.outbound.protection.outlook.com [52.101.56.117])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4bk29-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:18:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ3mg3BSQK1ewHBCbI8X/8rpRax+m/5V9/4k/IIlDqDNPSqLWQI2Xr831fmpsGCggi6GcCIJTnOvPqFUM/Vl9iQg6WZorBD8Pj9cO59edptcsvDdH2pHEfHsv9U0WART21uV7BazVti3Ch5jsFL/WiNJh6l13e41R8AZy4kMOjoRFvnFvsJulkH83V+i4xE3mhixYg7e2NLiiqX1liKD+Koe5P2jNdXNsOD35bMwqS+E4f0AuhacHBW84bcE0kR5wxkRXQpXhwWZjKItjHHtlVT3QHzMf8nWTmGX+E8CWdYMx3OFY1lF/X4lB2knnbc7Vzik1Ol/DeRyTZNNX4AkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1B4Mps19CVXTWT88nM8hlVyzXESeN/nVb+zFGEAwkU=;
 b=kkOfIdSESlT3Lb4d3q8ju1ZeS4qpsgIql/Xqut37twQkZp+YaObycuKyA8uz+D5w59zQxRjynjPmFXoW+xpdzcNw1o8pm8j0cgUTxUkqnEhD6VSOk9jomaIfGVpQNuyFabj3dTx/kGGLNGvIxCz0UCzxixfphITVuPAevjbzOtyNCdRQiFxkcPTUZWno/DAJ7DRZSe432cWiP6Ww+ANM3KYIy40/t3Y9VwPd47w2I6ZwTyJbeb0YE1QxPS+pbGPUp+tDuRB58d16YD5iHhl9ZUu7Ing32Ga3cSsuB09qV31pVaN9LKtSAblaEHa5Y4DIISvXq3lShOQ4Rqlnv+ScdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1B4Mps19CVXTWT88nM8hlVyzXESeN/nVb+zFGEAwkU=;
 b=GzKMZ8JTxa9oO+NlQGgRMfbUBzqvYDOPS7V3xrAuAZR57XV0t6V1nVqTMF0DqhI+2VkEt7f0yuOKroahbeMB0AMFaWI8dwL5sDaIHfjOIRfLIRHePxx6mc1oks+S/SIJct+/qHtGiInKPUuZBR5lUSiGf/R9bqy0YMNEA8r0M3Q=
Received: from BN0PR10CA0004.namprd10.prod.outlook.com (2603:10b6:408:143::18)
 by DS4PPFF2D687DD6.namprd19.prod.outlook.com (2603:10b6:f:fc00::a60) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:18:19 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::c4) by BN0PR10CA0004.outlook.office365.com
 (2603:10b6:408:143::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 14:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Tue, 10 Mar 2026 14:18:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B119540654E;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 857B8820258;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 02/10] ASoC: wm_adsp: Add KUnit redirection stubs for firmware file search
Date: Tue, 10 Mar 2026 14:18:09 +0000
Message-ID: <20260310141817.1871794-3-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|DS4PPFF2D687DD6:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: edd023c7-3c47-44b8-c12b-08de7eafe0b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|18002099003|22082099003|56012099003|54012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	xtSYYYvSkiaWl85SctHJ50ixRR8PEExkl4mydNO6RmzPXFugLsfphDqwmSXlRw9KvQA+7Tbpdr9IUdT7jXseeuM9L3fBk23DfP3LUV5ajqlW58rdDaIxVRHcmiWtMp4C4slWzcznp1vkCe4k991sP6BKp2k7vs3Nj2XPREFwifct295ei3aLVrnaOGmIy/mY9JndedUI7jWN1Z6Vf/HEhRdwZaoTaS3gDkcpPA0tmjIv+TagjiCQQGHIQrdM3ZgaxMfhoLzj0GMPjztmQhGjwV4c9XfKi0PkHiP7fSsD+fnT0o64ROjatqoOh4TMmIOEAMQZaegVWlYCWyeOBGZ6Hpp5A2KlX+vxhnIE0aWTWVLvMZTc5CEWP84yOKq6B74BUVu2AZIZayJHcUIe+aRYycWsJgUDCLskN/XPOerRb5PaxFmb5Hl0hpjahAZsbdzeF7z5NJxFn6xtFDajdNDmPP2F5XwS1TE2I0Qtj5J13/OQGL0sPTv7zsWao9U64UTanyc4ZnqX8TLDj9g0ZPO4aa8MuS2VOr418mO0wPSVX58k8hcmf6sxNkDk7fhop5Jxs7gBZo6iCH6/8h9HGRpXVepedkRQdo7cwU4AiGeVsKegyzB+mfo8tO6pw2S+kKZua+KN5rKhBkVgbihyJ9SO/43qLmrz1m79+IiZptvq5MOEfu+29mh23bq10gw2phzGXw/8SQ1BCamOEuWw4vtoHpvP5TIOH6ATSeH3AO8+uXlfZPNc8G5ol1llnsty0wHZzVLhLGYQD5o2Ud6a/XfR8Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003)(54012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	97f6RkMeTg4/7qKl12HjdvppiUpWfxdITCiM1fz+8h+nLGCIWC9j5WUS0Xs6ur6SqByluHh9+/fF0aEnMT6st5XsmohPD2Z7NdtlxEC9pF/szAJqKo27gppLp7DCqkR5i+1mcv6CFpw8/gDnQZRcZQhasPitTSGVh92aGDwePSf7rZPJgsb3Vradh1IfVG8gzY/PVe6A2LxnQFl8+Ecrit1rFrr4htTAUujcrFOi1C+cZPjbkteFqnggnkjcCrEaSDjiEy+LDKJDOYBXKi02luscwezd6CtYU0j5u2iaHg3vTyrLTQRI9tkjv3nWgroQk3k1WFhRpN+1PPLHUNX5CX614IjkLDsD8rpt1AZ4iygbABtlDhkRuzN/pRfvIPhxyhDBGuPnd/ZsEhRHD9VU71cqxr0rC39C0G3zlOxHlC4Jzuf5P7vK1N0W9Ue1Z25w
X-Exchange-RoutingPolicyChecked:
	Oq410Ru52fSkfgltQdmHIo6u1rGkPH6S4t/AYMP97S9mGeigqsvXSDlIRyk3+Fmkd6cNPGgOnEwSP43Wy2oHn9769lbpCE/e6N7sw11bdJyyGW9nbjtvIGtQ9cFw3rqi3a9MCjJc4Udn7Rv//PJ7ppId4jaOLhxxqIOfBjh+hGTWENU9Zj2I7XGKEUCQCyIrmTkFnqYEXgtFq+XJ4yOuB+6nQ7CQkOiJCyN07p2vd6qMf2JaPfK6U2anv1lgU0/HAHY4ofeAmimQubFkIOSAKS6vvUMyOtY/EYo+9Mqb1MPdNpasfMEWPuibQqyJvKwJggVlbYhl4E7gWByDiWo5Xw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:18:18.5373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edd023c7-3c47-44b8-c12b-08de7eafe0b4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFF2D687DD6
X-Proofpoint-ORIG-GUID: EXluPBBfd5Cl4QlWaIWCVJngPMOLl2xu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfX6J1iBeoP7ZD4
 Z7OrrVgfBqcH578/y/4Xly8H1FAguyZeSmw4bAEECWXoCU6HScOxlgbX3SeWNEnGxvaXr5wZopK
 uAlataDz/SdmGtNJD1zZJIWjoV3DuRH1xH8BhX8Ml8PyzGb8TJ7iEpYdgFhG5s0Bqfln3zAAiIL
 XwSX5pTtD7ao048GciHRUuXYGFc+c3dYvUgL8T8F+E03UOCHdAsnxsV+fOHiQPZEcz8kwDl/QRc
 47MTrThrUEw/mX3+9HfrmZ1kjSb3NsjLo46zfhNYso0+UvQ8St9B6fbt+PD0+kF56OQ5uAcH5Ii
 bOhxpXdk7YOYG0b2iV6eAaa8iPRObzvyZERzTM3DIudiw91iFF3EVpoiOA7YA2nr2bmx6QD4TLp
 POJKwezOly3KkJguW4diZJDeY4m0tiLwrcSbfIAL9VD8HcIZyiS7/njmkdB1ew+nFHsnzmelZkC
 Mz2xgeU0qI6w7VQygkw==
X-Proofpoint-GUID: EXluPBBfd5Cl4QlWaIWCVJngPMOLl2xu
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b02831 cx=c_pps
 a=v6Z6meDQFn3ji2zknzBGMg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=wggVRkVUAAAA:8 a=8nC0gXimzEi_ISW0fRoA:9
 a=MZpHe7prQc2n3JaO1KVd:22
X-Proofpoint-Spam-Reason: safe

Make some of the firmware file search functions redirectable for KUnit
testing.

- The call to firmware_request_nowarn() is factored out into a wrapper
  function so that it can be redirected.

- wm_adsp_request_firmware_files() and wm_adsp_release_firmware_files()
  are made visible and exported if KUNIT is enabled.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 38 ++++++++++++++++++++++++++++----------
 sound/soc/codecs/wm_adsp.h | 15 +++++++++++++++
 2 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 4b0c53d4f524..68e00970b8a2 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -7,6 +7,8 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <kunit/static_stub.h>
+#include <kunit/visibility.h>
 #include <linux/array_size.h>
 #include <linux/cleanup.h>
 #include <linux/ctype.h>
@@ -704,17 +706,32 @@ int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
-static void wm_adsp_release_firmware_files(const struct firmware *wmfw_firmware,
-					   char *wmfw_filename,
-					   const struct firmware *coeff_firmware,
-					   char *coeff_filename)
+VISIBLE_IF_KUNIT void wm_adsp_release_firmware_files(const struct firmware *wmfw_firmware,
+						     char *wmfw_filename,
+						     const struct firmware *coeff_firmware,
+						     char *coeff_filename)
 {
+	KUNIT_STATIC_STUB_REDIRECT(wm_adsp_release_firmware_files,
+				   wmfw_firmware, wmfw_filename,
+				   coeff_firmware, coeff_filename);
+
 	release_firmware(wmfw_firmware);
 	kfree(wmfw_filename);
 
 	release_firmware(coeff_firmware);
 	kfree(coeff_filename);
 }
+EXPORT_SYMBOL_IF_KUNIT(wm_adsp_release_firmware_files);
+
+VISIBLE_IF_KUNIT int wm_adsp_firmware_request(const struct firmware **firmware,
+					      const char *filename,
+					      struct device *dev)
+{
+	KUNIT_STATIC_STUB_REDIRECT(wm_adsp_firmware_request, firmware, filename, dev);
+
+	return firmware_request_nowarn(firmware, filename, dev);
+}
+EXPORT_SYMBOL_IF_KUNIT(wm_adsp_firmware_request);
 
 static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 					 const struct firmware **firmware, char **filename,
@@ -762,7 +779,7 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 		s++;
 	}
 
-	ret = firmware_request_nowarn(firmware, *filename, cs_dsp->dev);
+	ret = wm_adsp_firmware_request(firmware, *filename, cs_dsp->dev);
 	if (ret != 0) {
 		adsp_dbg(dsp, "Failed to request '%s'\n", *filename);
 		kfree(*filename);
@@ -775,11 +792,11 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 }
 
 static const char * const cirrus_dir = "cirrus/";
-static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
-					  const struct firmware **wmfw_firmware,
-					  char **wmfw_filename,
-					  const struct firmware **coeff_firmware,
-					  char **coeff_filename)
+VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
+						    const struct firmware **wmfw_firmware,
+						    char **wmfw_filename,
+						    const struct firmware **coeff_firmware,
+						    char **coeff_filename)
 {
 	const char *system_name = dsp->system_name;
 	const char *suffix = dsp->component->name_prefix;
@@ -856,6 +873,7 @@ static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 
 	return -ENOENT;
 }
+EXPORT_SYMBOL_IF_KUNIT(wm_adsp_request_firmware_files);
 
 static int wm_adsp_common_init(struct wm_adsp *dsp)
 {
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index a9118be793d7..599be409b669 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -143,4 +143,19 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name,  int type,
 int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name,  int type,
 		      unsigned int alg, void *buf, size_t len);
 
+#if IS_ENABLED(CONFIG_KUNIT)
+void wm_adsp_release_firmware_files(const struct firmware *wmfw_firmware,
+				    char *wmfw_filename,
+				    const struct firmware *coeff_firmware,
+				    char *coeff_filename);
+int wm_adsp_firmware_request(const struct firmware **firmware,
+			     const char *filename,
+			     struct device *dev);
+int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
+				   const struct firmware **wmfw_firmware,
+				   char **wmfw_filename,
+				   const struct firmware **coeff_firmware,
+				   char **coeff_filename);
+#endif
+
 #endif
-- 
2.47.3

