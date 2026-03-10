Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5215940DFC5;
	Tue, 10 Mar 2026 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152319; cv=fail; b=YvTIXFs69zlPfpqAJBIjZ1X4xmhg9QB6iTeAYGfTVLdz2HZP4jwAHUcZWcZ2fgP+qU7Tr04f/DL2VPinbIkhoduywwQIPzj8DC+2D/VMISWVTWu4RdodgYktpdueW73J3N5cRWTX5TOrsy2BPVHOUSWLszkHahcz4d57PmqV1zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152319; c=relaxed/simple;
	bh=5510vXpIFy2v0i26ppGS1v/QkvRcv4jKqT2kViw26bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mXFXN2liMaBpSo064Svt5/qpnlrWuAIENTfShGvETDtq7/EM7WWkRmgFgvGlQc0LNsMYlZ+WVPptKI9IMFGwoCX34g1+ZN2sGS0P5OhebKSx1QJwqN5Vi9unA6k32/Mt7TLySn+sMnsp1CZZbng7DXZTxy78/CHzL9gQRFm+FpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DOlJ3uKi; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LsNGN0A2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DOlJ3uKi";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LsNGN0A2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Kvbt92288204;
	Tue, 10 Mar 2026 09:18:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7TSTHxEGAxcJvxYJEZzyv71dG8Vq8czP72cjYZrygw0=; b=
	DOlJ3uKiuG9E9dpQIw1XtGWO5nrRY0BhxRNbhOw7zaE/C67AOtalU16u8eJz19yR
	nT+vAenQXTLhkbKVpstAe0xMj0qkLpWizepx/Ms9v5no100a+PMiBYgbga7wdU2v
	JUXR3BRY6/kmZj6ttvJvMPH0DvqJyVfoonKdZiOF/jFef9LPzYCMRST4qG9k2WcD
	Ii1osmc0C2WacxTXR9q7fgVNy7uzIaVmZ16yCqyMEnzKDYs2ig5tf0DMZKFzU5hH
	hiBQBIc2Gqgo0ZavdK7KT4H6hAgKEG8sZobPehuCNwalC7q6vj2xqkFj28KNqqBT
	IX3LmsZ1WcKlp1QxqzjsPQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020125.outbound.protection.outlook.com [52.101.56.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4bk2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:18:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LE9XdHonO6PGG7SDcT2voBejI+KEgjeJV802jRkE2YbUh7RCCa3uX5ll6HxFoskbrMHSCNJXOzQ11ovx3wcbSt46EE3N3Lxr48QaX85Sh1R16Z3loxpJ5S+B9C1nRJufzcF+eVI2sM9znuf7WFApu4dQZaLYZf8pTcrCeNkBSNKSglCrD/ecxzB6dxYX1rhYlrYgkJwbr2aG4iiDGrHKr1y3Wu1iMVqueUDcJ3aB6NdZmm7Bc5b69SbDwW8zqJQmzbP4m/Cur8w88CXaKgyozMqHM1m0pIErbXURN8p0FurO0vXXz+4XjYsMg0Gxp6rI/HRWKFGu8MhyiXLX8sezbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TSTHxEGAxcJvxYJEZzyv71dG8Vq8czP72cjYZrygw0=;
 b=thUQOB5Zux9NfYcmpxZoX0ScER4CYvJItJ8dUVs0Z5ZVMZo1FE/K51zecuEWxhQmggX9pYNcXxCav0WXNliHgYQa55gS43sIB7PRBO01eMtaIyuuQx/XOoAufru+SH12NGP2IWHT/i60BCoqwGDdTcW0ru+WXtucnSQPpusRTtY32chE5dl3KNmAxjM/PVD0nMm+pXpF2B73KcwngUtwTpleDZ3P+KwgR4EikIqRDgaCx4SZrNVmz8g/mqRI7B29PwPC4cFkRw2d6NaDeUuEhkqVChc3OAu6hUobHw6FSoqxWByMyZaclcKGawNhO1sl7IIxsHVVteIpFXWW9n0i7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TSTHxEGAxcJvxYJEZzyv71dG8Vq8czP72cjYZrygw0=;
 b=LsNGN0A2dVgoNMbB02lHu16F8rtQDRNeaXmoi3ds2yCR++cFlylbykQouRfV8u9r4cdB/B0o63BuJTkrpD0Y5wVJdVDLKE86+GIvaFOAy9mKtvhUhGMfmJ4rbXu22H/3X2jWOK1XRZWx0sfCWfMfFDv2iYdRngXvMMEmL+NMpuo=
Received: from SJ0PR03CA0079.namprd03.prod.outlook.com (2603:10b6:a03:331::24)
 by CO1PR19MB4965.namprd19.prod.outlook.com (2603:10b6:303:fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:18:23 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::78) by SJ0PR03CA0079.outlook.office365.com
 (2603:10b6:a03:331::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 14:18:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Tue, 10 Mar 2026 14:18:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CBB4F40657D;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9E9C9822547;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 09/10] ASoC: wm_adsp: Use a struct to pass around firmware struct and filename
Date: Tue, 10 Mar 2026 14:18:16 +0000
Message-ID: <20260310141817.1871794-10-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|CO1PR19MB4965:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bea26a03-df1b-41c7-a4f1-08de7eafe2d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|18002099003|22082099003|56012099003|54012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	hBXF5tw8eqW4yA7GVR23+izju3CxcgcRfOcVJ29i+BXppbK2M5pyybT/URW58NXR2zK2cflc0WFFAterv1tUCqpLj4ZJ9QLmyfj718K/dKGkVi6CZuWul5kVJBGRozvh0Hwu+sj3OvcfIjZ9qoBSTZsMoZfd9dGH75iTLSICAdAvxMDo70rLQbY7PocZOEVqzZqIwvaWedM+mhIub7KaI964+iX1Lbz7ixmbtaP/a7VulqaarfbblP7WLqOy4d3Ij5MDypILR0TOJJV7ZludWEVZ4eTymoZ6PudI9O4LNhreXJLRAzCEREFq6wthE0/p3wJkOCon1uMlfZyy3BkwGsy9BT8LLHfY+6dnSCpYhSYUDjGzSLutSYSYMGgXbJtdIhWT3usfOkTA7vnhZZxPSSAaWP9H7EJlr8dWFG3fp6IqXQAZW9nxuGM8+vu5N52+QYDJQa2NTlUAIFNWdc3cMSZZ9g2tuG57SiauwveBBSLf/RG4RRdEHnVgyyrUefaaB1tw8Pj62sV+jCC4W2CcW0JGZj2VWkw2TJhJ+kKZRNmsRumKQCDXt3L8+ztuuxa+kdE4jwLKick0CdgbQ50xHDcNmuIUTZwRHkz/EtKRY+AeNbCN+X/ulS+ApniN/G9bO7MMmrKFOabp72Xs1zcqhZyI84mJKzxy8tx46npoudr95JFEUP/1pDyU9Q2jtq1vee4nMhbMI/0rb7sW0zmhhFqr+keARd7tJN3YaR9eEIu6UmaFhEDqDMhQdp9bolxwmZkRLoUxu2MJGiqg9I0Zvg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(18002099003)(22082099003)(56012099003)(54012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UgKP2WiuqKy8Cua1y9DG7sSnu/6m2ceuXPTwvilBQMhCZ+K5PkCeMVljExCrmbJv+r+VpGfZ1Ik+WicHP4HNjHqp9o7oxCFwcpTX6eTx6qUeFskt8WhGi/5JDuDsp3izvw9rquFsmdYTJJSiPICJsfZveNJXFJ0o44rGdocWjIXJjTyZjuDsbAjDknIB4OkOL8Ts9k8qm2R+fvltupCy2HVOpnSFW8ZEM0b/K3yyzk8QvC6EVJ6yyM8J55UzwHQ1gYSFHKwLajIYCK06ZxxTOHj0stoMJx+mUZB8sgbqHD3pYO9HK14s1eA+jd8LM2IqCm0bJ0RD/vhtrsbk/7LtAiME49Uj1nP73gxsatThCKDOI05m2l8leZkq03VSneHlgy1dFH3t1+HpZjgxqGJGhOklS6v5kM9CVk9g2p4Voq0x7xDXTcZwzypeJJcPzmUD
X-Exchange-RoutingPolicyChecked:
	ElkGmLaL0CALIlUmxyAHIeF03lM0cX0wVA9crhzduE7T2mMQejN15rs+ELY+WmdG2AgE4SdD0IoON99R5UMgTOkxLfE05vbFKK3GRtqVzYqfOQQ9/VxY7s/h+PocOYLcZZHlJ/YxrdiHhQ/5tAXs/uo1P5ukVbYDdJ4z+edn5GgrjcYadVgnkLdQY+WSJGn1CNh1XgDaOMApmM/BnWvPaObxwgUc1nGvxSJgbz5gAgl3aNfikmOChiPyXaf/SLDL9NrclhXYcRrGamI7IP72cy1ogADfxncfoG98EDAl9EQgARKTdJayqbU2joqN1SnTMMkPG3HOPDWsQc//86sCYQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:18:22.0019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bea26a03-df1b-41c7-a4f1-08de7eafe2d6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4965
X-Proofpoint-ORIG-GUID: RdC1p4lJ_lGLx1tN-zYjsWRuhCyeHPTX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfXyr9Cuttxh+OS
 FPr7CGJ4uOoIjapOXjB13tNVHZCD2bjKoc8XquXLpcBve8dZeAi1K7FtC6DUlA/2GEeNe1/0Btx
 9AUNxYr0L+MJfAh96ey51RXP2nI6iKCbErnISPsofLFty6+x0DcW3jLP8r/Rqv+fK0/LkS3UQGL
 Wf//Usf9vdm7JxH43moB6OH4S16Wfsp48pgOxMCHuVqoAP8F2DQX79BF37epQN7mag93cczui7b
 rrSjPD4WBhPWWdRC1OMt8Bwnxn4Gt55/Na3g0jzBZPduHd0bUteVjROAooev/M4x61+JDhXk9JJ
 q/tjCTpsEJx+2iJdC6VJfpSPgCePsTCVjTE4NTqFVr3zkOf0kdlKFOhwxDGGTXG+0G8cYZrDnWK
 iGceFa1jMIs1hbb82PecyQKJ0iDNuPx/Ug2ZS4L36u45nsC9rJI0sRPnttlLJ/h57yHE1YQ4NRt
 kPNyy9GZM5JMKPeD3ag==
X-Proofpoint-GUID: RdC1p4lJ_lGLx1tN-zYjsWRuhCyeHPTX
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b02834 cx=c_pps
 a=qoAvcrxUHY3FHMzwJxUv3w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=7SzLS8ox6QvL2X636aoA:9
X-Proofpoint-Spam-Reason: safe

Bundle the pointers to struct firmware and its filename into a new
struct wm_adsp_fw_files. This simplifies passing these pointers around.

Changes are also needed to the test cases in wm_adsp_fw_find_test.c that
use this API.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c              | 123 ++++++++++--------------
 sound/soc/codecs/wm_adsp.h              |  21 ++--
 sound/soc/codecs/wm_adsp_fw_find_test.c |  47 +++------
 3 files changed, 77 insertions(+), 114 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 034766760c86..1c480d59bd55 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -717,20 +717,15 @@ int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
-VISIBLE_IF_KUNIT void wm_adsp_release_firmware_files(const struct firmware *wmfw_firmware,
-						     char *wmfw_filename,
-						     const struct firmware *coeff_firmware,
-						     char *coeff_filename)
+VISIBLE_IF_KUNIT void wm_adsp_release_firmware_files(struct wm_adsp_fw_files *fw)
 {
-	KUNIT_STATIC_STUB_REDIRECT(wm_adsp_release_firmware_files,
-				   wmfw_firmware, wmfw_filename,
-				   coeff_firmware, coeff_filename);
+	KUNIT_STATIC_STUB_REDIRECT(wm_adsp_release_firmware_files, fw);
 
-	release_firmware(wmfw_firmware);
-	kfree(wmfw_filename);
+	release_firmware(fw->wmfw.firmware);
+	kfree(fw->wmfw.filename);
 
-	release_firmware(coeff_firmware);
-	kfree(coeff_filename);
+	release_firmware(fw->coeff.firmware);
+	kfree(fw->coeff.filename);
 }
 EXPORT_SYMBOL_IF_KUNIT(wm_adsp_release_firmware_files);
 
@@ -745,7 +740,7 @@ VISIBLE_IF_KUNIT int wm_adsp_firmware_request(const struct firmware **firmware,
 EXPORT_SYMBOL_IF_KUNIT(wm_adsp_firmware_request);
 
 static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
-					 const struct firmware **firmware, char **filename,
+					 struct wm_adsp_fw_file *fw,
 					 const char *dir, const char *system_name,
 					 const char *asoc_component_prefix,
 					 const char *filetype)
@@ -761,25 +756,25 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 		fwf = dsp->cs_dsp.name;
 
 	if (system_name && asoc_component_prefix)
-		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-%s.%s", dir, dsp->part,
-				      fwf, wm_adsp_fw[dsp->fw].file, system_name,
-				      asoc_component_prefix, filetype);
+		fw->filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-%s.%s", dir, dsp->part,
+					 fwf, wm_adsp_fw[dsp->fw].file, system_name,
+					 asoc_component_prefix, filetype);
 	else if (system_name)
-		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s.%s", dir, dsp->part,
-				      fwf, wm_adsp_fw[dsp->fw].file, system_name,
-				      filetype);
+		fw->filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s.%s", dir, dsp->part,
+					 fwf, wm_adsp_fw[dsp->fw].file, system_name,
+					 filetype);
 	else
-		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s.%s", dir, dsp->part, fwf,
-				      wm_adsp_fw[dsp->fw].file, filetype);
+		fw->filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s.%s", dir, dsp->part, fwf,
+					 wm_adsp_fw[dsp->fw].file, filetype);
 
-	if (*filename == NULL)
+	if (!fw->filename)
 		return -ENOMEM;
 
 	/*
 	 * Make sure that filename after dir is lower-case and any non-alpha-numeric
 	 * characters except full-stop are replaced with hyphens.
 	 */
-	s = *filename + strlen(dir);
+	s = fw->filename + strlen(dir);
 	while (*s) {
 		c = *s;
 		if (isalnum(c))
@@ -789,15 +784,15 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 		s++;
 	}
 
-	ret = wm_adsp_firmware_request(firmware, *filename, cs_dsp->dev);
+	ret = wm_adsp_firmware_request(&fw->firmware, fw->filename, cs_dsp->dev);
 	if (ret < 0) {
-		adsp_dbg(dsp, "Failed to request '%s': %d\n", *filename, ret);
-		kfree(*filename);
-		*filename = NULL;
+		adsp_dbg(dsp, "Failed to request '%s': %d\n", fw->filename, ret);
+		kfree(fw->filename);
+		fw->filename = NULL;
 		if (ret != -ENOENT)
 			return ret;
 	} else {
-		adsp_dbg(dsp, "Found '%s'\n", *filename);
+		adsp_dbg(dsp, "Found '%s'\n", fw->filename);
 	}
 
 	return 0;
@@ -805,10 +800,7 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 
 static const char * const cirrus_dir = "cirrus/";
 VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
-						    const struct firmware **wmfw_firmware,
-						    char **wmfw_filename,
-						    const struct firmware **coeff_firmware,
-						    char **coeff_filename)
+						    struct wm_adsp_fw_files *fw)
 {
 	const char *system_name = dsp->system_name;
 	const char *suffix = dsp->component->name_prefix;
@@ -818,14 +810,14 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 		suffix = dsp->fwf_suffix;
 
 	if (system_name && suffix) {
-		ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
+		ret = wm_adsp_request_firmware_file(dsp, &fw->wmfw,
 						    cirrus_dir, system_name,
 						    suffix, "wmfw");
 		if (ret < 0)
 			goto err;
 
-		if (*wmfw_firmware) {
-			ret = wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+		if (fw->wmfw.firmware) {
+			ret = wm_adsp_request_firmware_file(dsp, &fw->coeff,
 							    cirrus_dir, system_name,
 							    suffix, "bin");
 			if (ret < 0)
@@ -836,45 +828,43 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 	}
 
 	if (system_name) {
-		ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
+		ret = wm_adsp_request_firmware_file(dsp, &fw->wmfw,
 						    cirrus_dir, system_name,
 						    NULL, "wmfw");
 		if (ret < 0)
 			goto err;
 
-		if (*wmfw_firmware || dsp->wmfw_optional) {
+		if (fw->wmfw.firmware || dsp->wmfw_optional) {
 			if (suffix) {
 				ret = wm_adsp_request_firmware_file(dsp,
-								    coeff_firmware, coeff_filename,
+								    &fw->coeff,
 								    cirrus_dir, system_name,
 								    suffix, "bin");
 				if (ret < 0)
 					goto err;
 			}
 
-			if (!*coeff_firmware) {
+			if (!fw->coeff.firmware) {
 				ret = wm_adsp_request_firmware_file(dsp,
-								    coeff_firmware, coeff_filename,
+								    &fw->coeff,
 								    cirrus_dir, system_name,
 								    NULL, "bin");
 				if (ret < 0)
 					goto err;
 			}
 
-			if (*wmfw_firmware || (dsp->wmfw_optional && *coeff_firmware))
+			if (fw->wmfw.firmware || (dsp->wmfw_optional && fw->coeff.firmware))
 				return 0;
 		}
 	}
 
 	/* Check legacy location */
-	ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
-					    "", NULL, NULL, "wmfw");
+	ret = wm_adsp_request_firmware_file(dsp, &fw->wmfw, "", NULL, NULL, "wmfw");
 	if (ret < 0)
 		goto err;
 
-	if (*wmfw_firmware) {
-		ret = wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
-						    "", NULL, NULL, "bin");
+	if (fw->wmfw.firmware) {
+		ret = wm_adsp_request_firmware_file(dsp, &fw->coeff, "", NULL, NULL, "bin");
 		if (ret < 0)
 			goto err;
 
@@ -882,13 +872,13 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 	}
 
 	/* Fall back to generic wmfw and optional matching bin */
-	ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
+	ret = wm_adsp_request_firmware_file(dsp, &fw->wmfw,
 					    cirrus_dir, NULL, NULL, "wmfw");
 	if (ret < 0)
 		goto err;
 
-	if (*wmfw_firmware || dsp->wmfw_optional) {
-		ret = wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+	if (fw->wmfw.firmware || dsp->wmfw_optional) {
+		ret = wm_adsp_request_firmware_file(dsp, &fw->coeff,
 						    cirrus_dir, NULL, NULL, "bin");
 		if (ret < 0)
 			goto err;
@@ -903,8 +893,7 @@ VISIBLE_IF_KUNIT int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 
 	ret = -ENOENT;
 err:
-	wm_adsp_release_firmware_files(*wmfw_firmware, *wmfw_filename,
-				       *coeff_firmware, *coeff_filename);
+	wm_adsp_release_firmware_files(fw);
 
 	return ret;
 }
@@ -939,29 +928,23 @@ int wm_adsp1_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm_adsp *dsps = snd_soc_component_get_drvdata(component);
 	struct wm_adsp *dsp = &dsps[w->shift];
+	struct wm_adsp_fw_files fw = { 0 };
 	int ret = 0;
-	char *wmfw_filename = NULL;
-	const struct firmware *wmfw_firmware = NULL;
-	char *coeff_filename = NULL;
-	const struct firmware *coeff_firmware = NULL;
 
 	dsp->component = component;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		ret = wm_adsp_request_firmware_files(dsp,
-						     &wmfw_firmware, &wmfw_filename,
-						     &coeff_firmware, &coeff_filename);
+		ret = wm_adsp_request_firmware_files(dsp, &fw);
 		if (ret)
 			break;
 
 		ret = cs_dsp_adsp1_power_up(&dsp->cs_dsp,
-					    wmfw_firmware, wmfw_filename,
-					    coeff_firmware, coeff_filename,
+					    fw.wmfw.firmware, fw.wmfw.filename,
+					    fw.coeff.firmware, fw.coeff.filename,
 					    wm_adsp_fw_text[dsp->fw]);
 
-		wm_adsp_release_firmware_files(wmfw_firmware, wmfw_filename,
-					       coeff_firmware, coeff_filename);
+		wm_adsp_release_firmware_files(&fw);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		cs_dsp_adsp1_power_down(&dsp->cs_dsp);
@@ -1037,33 +1020,27 @@ EXPORT_SYMBOL_GPL(wm_adsp2_preloader_put);
 
 int wm_adsp_power_up(struct wm_adsp *dsp, bool load_firmware)
 {
+	struct wm_adsp_fw_files fw = { 0 };
 	int ret = 0;
-	char *wmfw_filename = NULL;
-	const struct firmware *wmfw_firmware = NULL;
-	char *coeff_filename = NULL;
-	const struct firmware *coeff_firmware = NULL;
 
 	if (load_firmware) {
-		ret = wm_adsp_request_firmware_files(dsp,
-						     &wmfw_firmware, &wmfw_filename,
-						     &coeff_firmware, &coeff_filename);
+		ret = wm_adsp_request_firmware_files(dsp, &fw);
 		if (ret)
 			return ret;
 	}
 
-	if (dsp->bin_mandatory && !coeff_firmware) {
+	if (dsp->bin_mandatory && !fw.coeff.firmware) {
 		ret = -ENOENT;
 		goto err;
 	}
 
 	ret = cs_dsp_power_up(&dsp->cs_dsp,
-			      wmfw_firmware, wmfw_filename,
-			      coeff_firmware, coeff_filename,
+			      fw.wmfw.firmware, fw.wmfw.filename,
+			      fw.coeff.firmware, fw.coeff.filename,
 			      wm_adsp_fw_text[dsp->fw]);
 
 err:
-	wm_adsp_release_firmware_files(wmfw_firmware, wmfw_filename,
-				       coeff_firmware, coeff_filename);
+	wm_adsp_release_firmware_files(&fw);
 
 	return ret;
 }
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index b4d5bd321c0b..8922732479c2 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -79,6 +79,16 @@ struct wm_adsp {
 	SOC_ENUM_EXT(dspname " Firmware", wm_adsp_fw_enum[num], \
 		     wm_adsp_fw_get, wm_adsp_fw_put)
 
+struct wm_adsp_fw_file {
+	const struct firmware *firmware;
+	char *filename;
+};
+
+struct wm_adsp_fw_files {
+	struct wm_adsp_fw_file wmfw;
+	struct wm_adsp_fw_file coeff;
+};
+
 extern const struct soc_enum wm_adsp_fw_enum[];
 
 int wm_adsp1_init(struct wm_adsp *dsp);
@@ -145,18 +155,11 @@ int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name,  int type,
 
 #if IS_ENABLED(CONFIG_KUNIT)
 const char *wm_adsp_get_fwf_name_by_index(int index);
-void wm_adsp_release_firmware_files(const struct firmware *wmfw_firmware,
-				    char *wmfw_filename,
-				    const struct firmware *coeff_firmware,
-				    char *coeff_filename);
+void wm_adsp_release_firmware_files(struct wm_adsp_fw_files *fw);
 int wm_adsp_firmware_request(const struct firmware **firmware,
 			     const char *filename,
 			     struct device *dev);
-int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
-				   const struct firmware **wmfw_firmware,
-				   char **wmfw_filename,
-				   const struct firmware **coeff_firmware,
-				   char **coeff_filename);
+int wm_adsp_request_firmware_files(struct wm_adsp *dsp, struct wm_adsp_fw_files *fw);
 #endif
 
 #endif
diff --git a/sound/soc/codecs/wm_adsp_fw_find_test.c b/sound/soc/codecs/wm_adsp_fw_find_test.c
index 11047851fd80..44c26e991b35 100644
--- a/sound/soc/codecs/wm_adsp_fw_find_test.c
+++ b/sound/soc/codecs/wm_adsp_fw_find_test.c
@@ -16,10 +16,7 @@ KUNIT_DEFINE_ACTION_WRAPPER(_put_device_wrapper, put_device, struct device *);
 struct wm_adsp_fw_find_test {
 	struct wm_adsp dsp;
 
-	const struct firmware *found_wmfw_firmware;
-	const struct firmware *found_bin_firmware;
-	char *found_wmfw_filename;
-	char *found_bin_filename;
+	struct wm_adsp_fw_files found_fw;
 	char searched_fw_files[768];
 };
 
@@ -101,28 +98,24 @@ static void wm_adsp_fw_find_test_pick_file(struct kunit *test)
 				   wm_adsp_firmware_request,
 				   wm_adsp_fw_find_test_firmware_request_simple_stub);
 
-	ret = wm_adsp_request_firmware_files(dsp,
-					     &priv->found_wmfw_firmware,
-					     &priv->found_wmfw_filename,
-					     &priv->found_bin_firmware,
-					     &priv->found_bin_filename);
+	ret = wm_adsp_request_firmware_files(dsp, &priv->found_fw);
 	kunit_deactivate_static_stub(test, wm_adsp_firmware_request);
 	KUNIT_EXPECT_EQ_MSG(test, ret,
 			    (params->expect_wmfw || params->expect_bin) ? 0 : -ENOENT,
 			    "%s\n", priv->searched_fw_files);
 
-	KUNIT_EXPECT_EQ_MSG(test, !!priv->found_wmfw_filename, !!params->expect_wmfw,
+	KUNIT_EXPECT_EQ_MSG(test, !!priv->found_fw.wmfw.filename, !!params->expect_wmfw,
 			    "%s\n", priv->searched_fw_files);
-	KUNIT_EXPECT_EQ_MSG(test, !!priv->found_bin_filename, !!params->expect_bin,
+	KUNIT_EXPECT_EQ_MSG(test, !!priv->found_fw.coeff.filename, !!params->expect_bin,
 			    "%s\n", priv->searched_fw_files);
 
 	if (params->expect_wmfw) {
-		KUNIT_EXPECT_STREQ_MSG(test, priv->found_wmfw_filename, params->expect_wmfw,
+		KUNIT_EXPECT_STREQ_MSG(test, priv->found_fw.wmfw.filename, params->expect_wmfw,
 				       "%s\n", priv->searched_fw_files);
 	}
 
 	if (params->expect_bin) {
-		KUNIT_EXPECT_STREQ_MSG(test, priv->found_bin_filename, params->expect_bin,
+		KUNIT_EXPECT_STREQ_MSG(test, priv->found_fw.coeff.filename, params->expect_bin,
 				       "%s\n", priv->searched_fw_files);
 	}
 }
@@ -181,27 +174,23 @@ static void wm_adsp_fw_find_test_search_order(struct kunit *test)
 				   wm_adsp_firmware_request,
 				   wm_adsp_fw_find_test_firmware_request_stub);
 
-	wm_adsp_request_firmware_files(dsp,
-				       &priv->found_wmfw_firmware,
-				       &priv->found_wmfw_filename,
-				       &priv->found_bin_firmware,
-				       &priv->found_bin_filename);
+	wm_adsp_request_firmware_files(dsp, &priv->found_fw);
 
 	kunit_deactivate_static_stub(test, wm_adsp_firmware_request);
 
 	KUNIT_EXPECT_STREQ(test, priv->searched_fw_files, params->expected_searches);
 
-	KUNIT_EXPECT_EQ(test, !!priv->found_wmfw_filename, !!params->expect_wmfw);
+	KUNIT_EXPECT_EQ(test, !!priv->found_fw.wmfw.filename, !!params->expect_wmfw);
 	if (params->expect_wmfw)
-		KUNIT_EXPECT_STREQ(test, priv->found_wmfw_filename, params->expect_wmfw);
+		KUNIT_EXPECT_STREQ(test, priv->found_fw.wmfw.filename, params->expect_wmfw);
 
-	KUNIT_EXPECT_EQ(test, !!priv->found_bin_filename, !!params->expect_bin);
+	KUNIT_EXPECT_EQ(test, !!priv->found_fw.coeff.filename, !!params->expect_bin);
 	if (params->expect_bin)
-		KUNIT_EXPECT_STREQ(test, priv->found_bin_filename, params->expect_bin);
+		KUNIT_EXPECT_STREQ(test, priv->found_fw.coeff.filename, params->expect_bin);
 
 	/* Either we get a filename and firmware, or neither */
-	KUNIT_EXPECT_EQ(test, !!priv->found_wmfw_filename, !!priv->found_wmfw_firmware);
-	KUNIT_EXPECT_EQ(test, !!priv->found_bin_filename, !!priv->found_bin_firmware);
+	KUNIT_EXPECT_EQ(test, !!priv->found_fw.wmfw.filename, !!priv->found_fw.wmfw.firmware);
+	KUNIT_EXPECT_EQ(test, !!priv->found_fw.coeff.filename, !!priv->found_fw.coeff.firmware);
 }
 
 static void wm_adsp_fw_find_test_find_firmware_byindex(struct kunit *test)
@@ -221,12 +210,7 @@ static void wm_adsp_fw_find_test_find_firmware_byindex(struct kunit *test)
 					   wm_adsp_firmware_request,
 					   wm_adsp_fw_find_test_firmware_request_stub);
 
-		wm_adsp_request_firmware_files(dsp,
-					       &priv->found_wmfw_firmware,
-					       &priv->found_wmfw_filename,
-					       &priv->found_bin_firmware,
-					       &priv->found_bin_filename);
-
+		wm_adsp_request_firmware_files(dsp, &priv->found_fw);
 		kunit_deactivate_static_stub(test, wm_adsp_firmware_request);
 
 		KUNIT_EXPECT_NOT_NULL_MSG(test,
@@ -278,8 +262,7 @@ static void wm_adsp_fw_find_test_case_exit(struct kunit *test)
 	 * dummies not allocated by the real request_firmware() call they
 	 * must not be passed to release_firmware().
 	 */
-	wm_adsp_release_firmware_files(NULL, priv->found_wmfw_filename,
-				       NULL, priv->found_bin_filename);
+	wm_adsp_release_firmware_files(&priv->found_fw);
 }
 
 static void wm_adsp_fw_find_test_param_desc(const struct wm_adsp_fw_find_test_params *param,
-- 
2.47.3

