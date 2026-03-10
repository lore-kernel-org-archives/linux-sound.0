Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4933B6C01;
	Tue, 10 Mar 2026 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147840; cv=fail; b=P0Bwf3waq/vaf4cbxKjsX+G+W9FMkCajHoKPvISAKQbf7soFi3T9K9Sph1XF+0Q5Hds3pggaRcKuh3R4G1va2kU39KJyym+6gcoUTVU0bLyG+3Fx5DygfUXQTJBABzYWMts5Tk+cDILjfIUUsZdZ3BfDYmRCToQBBzdo8jscV0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147840; c=relaxed/simple;
	bh=RxzhnJ9cLhM1NUKbT+GGGqaRRmkb1luXNnSBE348MiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b4CciAEaJNZ1Dio0tTu/5JdkLmaVf9acg+Cvr+2XzwSfiGYERAFo8DraKLXgkiZSD8+4zzMhY0uALbV8wAtrFoE6tTlMrjBfpb80uctlaoVLBzZsys+G+0C3EE3KQJPhYnp0e720zdo+jS67Ic4XlsB6kewVoBNyc4QPV/ugphs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p65WHXqw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZxN9aIyX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p65WHXqw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZxN9aIyX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A6BW98509622;
	Tue, 10 Mar 2026 08:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=sSDRTyzmRMe3pIyt
	ev6GdFKOLe4JlYYWn/3kx/rM7ao=; b=p65WHXqw3dVaROv0cKG0oIDxTJvFDt6A
	NJ2P6gtj4+cWjqmd2YqacT0knh/sx7f74Lkbt7KrVC6lbtxtAtJjAEtMel05+1Pp
	WUySAiZ7mklYKNPhKJQlSvJ3u7ILTPCcEOrzjRB3AVQ34JCgM2CYG5MVdlqtMEL7
	KmphgKP7PrvM3GfytTGLimbFv9sy66J4zuAGfSgnG9O5ghO6lxid1YMVRxzzgh3Z
	04b9w0r8V1WZGLPajIsCkSaj4U4XHO0zEiiYNH/6HurseEmqjgaMR0yIT06U041r
	fQgWytrjqYNrctFOiIdfQzvc0SLwpeJN5H2oC4ibJpoIVdOpJolx4g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020105.outbound.protection.outlook.com [52.101.61.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4crhapbg1a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 08:03:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXybLEKBHzh0pa0QiyZsASvazNGtZc4hOd3bD78cJ1PtZMqVMUztnTPZLtE5EhKBt2GQahyyWAMZBPbM0idUU47hV8CsGlntuvmbRlrQvU7Ctd85fhaw2/UiIwhmVTGTjnEYHfMCGW/PnyhFQA/AJYAzmbtxxPLdb83bLlanIToM6GDfzfXLoy3iuk2wGXB78rmQ2/fm34FBHRtxg7ddqMNCr7UYt8QNNo0bHrmZbxlrQuUtofGUwN7OM7w/DMq8hcGFgczkdGYQrbc5TNX44+fWJUwDT6NH7EtzGzgQ9alpkR9WLvmXttuJH3tlithTz5Wq/ZITIVYl+fvm/qSdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSDRTyzmRMe3pIytev6GdFKOLe4JlYYWn/3kx/rM7ao=;
 b=ZKziGhg5fB/8Ux2pRdn00p0fxWaXJv8XuzqIehzvoNs0iMmdhs7B/LuXUv5aeWeOW+IoDmbfPPRV+x5bwR4VgowqS6U4KRHm6uzPMivcnI0dBFn01h3ZMqtSuGDHkup/44rMML+VHO+uCnI2gJ4h3yPS6VyLMgs5/PSMFMwBH4R2zde4aTQ05XrJfopJ97EuuNs3fu/XenwJhKgRnL5ugHTUTRThKYQ745tep4vrKsblSn51uCMlRzmp/HtwPC/UFk3ybEMohJOzXc9IeqvcMpXI7wHCREDOMKp4Z4rmuKAiLdixsmR+B4voZQVZIvni5K//8EZk58WKLjuBgrb+7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSDRTyzmRMe3pIytev6GdFKOLe4JlYYWn/3kx/rM7ao=;
 b=ZxN9aIyX1A0DXl/vxdF4FWefEGS+rKpycLFymOODwlYFyclJdpXwODw71Ut/0TpHTL7cxewZMFCwY+EVuweAFC6ujsqAHweStJnXiU6UEP+K2xpnLMZIwux/BJSMclLMGjNNpzJbXo3n5qx77aeiwoKUZQHfHpM2fEiOlG4Vd8M=
Received: from CH0PR07CA0007.namprd07.prod.outlook.com (2603:10b6:610:32::12)
 by BLAPR19MB4226.namprd19.prod.outlook.com (2603:10b6:208:255::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 13:03:44 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::c2) by CH0PR07CA0007.outlook.office365.com
 (2603:10b6:610:32::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 13:03:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Tue, 10 Mar 2026 13:03:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 683F2406540;
	Tue, 10 Mar 2026 13:03:43 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 44153820249;
	Tue, 10 Mar 2026 13:03:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Simplify suppressing log messages during KUnit testing
Date: Tue, 10 Mar 2026 13:03:43 +0000
Message-ID: <20260310130343.1791951-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|BLAPR19MB4226:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c4023dbb-4030-47f9-9edb-08de7ea575eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|16102099003|54012099003;
X-Microsoft-Antispam-Message-Info:
	5lFub3mu7U+9q+E2RtTs3lwCRoUEEO66iSJfft0WUS6DwqiP+eA+zGkWwGyou0VEFEmq2sYGHMn91MEVP3UemcmMQ1W5+ZUM/OVu3MfCvapq5MMKi/ntn611mpGVtxUvYhT8pZ79XL5kJ4Qo1+VcmTncTWrUPgOVmayLWHbyG9qOD5TIGuYSWIZU1zCNnw+eEWCuSpON/7nAk0jxPgeCGyL7nLL38bpnhllykXHdDcdftUhOo3HOmteTMUlhtKEmoJBcbQIutY41K+Ac3b3Wa3bm6fkQ+wcUHEbVCnJs1vo2ENqcvTQHHtkXSRuBT7zW0KuU69JGIx5Cwn35rNPlhriHQRoOmcpOpTCM3PkAUkXirlMaVFw0UDiDJnOD/IOgIIAFwj9qe7aJv7RuEib8mQ9yrhrtwHP084d7kfPqRH1aSWgSFfoU978/kqlZJmpNW+SCxULfCdC8LHpwwQ6aG3vNJFvUNbNdD0D2j+rq22EL5iurOCWp3UD1tJPBSAreXaFAlOz1ChgDdYBk2yyj36b/ti5ogVKRE23QxHL+AofkY32a4bqwydajBWzrXdRy1QSSLVJrUyxjJtcM1XSAXD6eCIrBtvetxW/zqOZVtc42ek6lTtn9g+SxgCmfh9SfzGgaH+AVQV/9v2wANJtx+EmvnszGlBJfYRIb2uSSRKbglCrsPMe6vzUR0Idd+TGiFGEVnqAOkTiVuZ7phmMbR0qrw5PW67bvj9WQwXFFEr754DVW9UKl6jXkK9etRfXCNup8Ybc+mVe5th9qNhJ4CQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(16102099003)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kVMVG0S3JbqtX0tLMEMOl70+8N3i8KK9X8is8PZZLym2Qy73sDOlh/1sBpTfujXhv1am+NzlZAKg3RwTSXYGd9D5nJA8LgdPnFNwnKbfIfNoLCI7NJe20VezLvARp9EzZt59Gp7bGN80PUEEvvA0uFV6Rf7BVlQnSssFaK9riOlc+qIBaWl/5TQgscX8sUUzgqSEeshyByilfQsFX3H+gxCx1M3ol1+lDwpO2j9QZNx0spsuu3E5VxFJhfQe+1Y0NQp971vHBDB1qi8Wby57nSc84yJnNSBqhNKQEo6mvtdmOvgk3QpfnzKIru2x+Ua66uHqlfRwhxYLdzuUhTBPotjnaQpZyCC42HB9ZGZ9EqQNCMBcVM6ek53SLkoQcxlx7nSSDH3M/nwPmdJkYYkGkrZSTOQEd324TbaYmgziUTAoJ4Cbnfuz5QGTU9/4uPOK
X-Exchange-RoutingPolicyChecked:
	XEVv9ALQSulkO+50vbjExmvIkog1ZpKIXkS5qgiku1eWTMG3q0s+jMLReFpLPW7m2dassyULdjvt0hISRznRyDeVhXd/7kHQIC7u52w7FDG6YDC68nfLRbqKD++I1l5FVry7edPXnk8DrW91UHOinVfymNHSRY9aI6F4YDL6HxvK9Nnzvo7t7qBZYVnmw5zSGc9EsPQiJsL7qwb2vAptOTYPXnsRj+nURZBBodMeaugTuoxsyo99U5PIlR44GkecKwpul4Q9m5FVDR6VoqpqnCjapKF6TipaNFvLTuhWHBUkjY2hF3jBXJb0UPIWkuPZSB3fHKZU005yqSlThIoe9Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 13:03:44.3900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4023dbb-4030-47f9-9edb-08de7ea575eb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4226
X-Proofpoint-ORIG-GUID: s5OPNT0WZIWl67kJf_XTE8UXNhR41fDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX/chz9RkgTS+k
 dQOcBZWUO6uyR+H/oNm6mm2n5JQM/RtHE0SvS5XcO279lr+eb+ahlcBuWGHjOWka2Uue7KiMk8J
 v+e8BOMxGKXFhAaxSMIdoNOohuPJ5XMyVVp8U+z/iraN8VA/s4aDfQtBKox6d2gVdSAYigGTrpg
 aX0taKo69UPU/5YyVZiCCkIR1DMcDcySKCieXGTa72o4Z9YKCntDobEmMwMHMChuXb8dOUACT0b
 M5+OhXBj2MgoBb+FJ7WwUxNdN6J5C+niA5siouLme269zZLKvptyPqw1PcDV0Lceu+05mr4Y66n
 gZNn81MWcqBzL0dxWGI1Q6dXr8jgb0rHi1H9TiEHM/PzPkWt8SReG+U/wKacEOLu4wWgigDP3E/
 Tes9uDFcv08s3834x3ywB1qR+Yl9rr9qMkly8wwh5RI725WpEtIbb+U0QGBmXe7nxIRawwcSBVp
 39zlwV+hhjlf5D8uDPQ==
X-Proofpoint-GUID: s5OPNT0WZIWl67kJf_XTE8UXNhR41fDk
X-Authority-Analysis: v=2.4 cv=EbbFgfmC c=1 sm=1 tr=0 ts=69b016b7 cx=c_pps
 a=SfbXOumlQYQ7ptoTXzRROw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=IpQo5gl9zogK4QDgiS4A:9
X-Proofpoint-Spam-Reason: safe

Rework the way that kernel log messages are rate-limited or suppressed
while running the cs_dsp KUnit tests.

Under normal conditions cs_dsp doesn't produce an unreasonable number of
log messages, and state changes are relatively infrequent. But the KUnit
tests run through a very large number of test cases, especially error
cases, and this produces an unusually large amount of log output from
cs_dsp.

The original fix for this in commit 10db9f6899dd ("firmware: cs_dsp:
rate-limit log messages in KUnit builds") was effective but not pretty.
It involved different definitions of the log macros for KUnit and
not-KUnit builds, and exported variables for the KUnit tests to disable
log messages. I would have preferred to turn the log macros into real
functions that can contain a KUNIT_STATIC_STUB_REDIRECT(), but the
dev_xxx() macros don't have a version that take va_args, so they can't
be wrapped by a function.

This patch enables the use of a KUNIT_STATIC_STUB_REDIRECT() instead
of exported variables, and avoids the need for different definitions of
the debug macros in KUnit and not-KUnit builds.

- A new function cs_dsp_can_emit_message() returns true if the
  messages can be emitted to the kernel log. In a normal not-KUnit build
  this function collapses to simply returning true. In KUnit builds it
  will rate-limit output, and this uses a single static rate limiter so
  it limits the overall rate across all cs_dsp log messages. The KUnit
  test can redirect it to change the suppression behavior.

- The cs_dsp debug message macros are changed to only call the dev_xxx()
  if cs_dsp_can_emit_message() returns true. These are still macros so
  there is no problem wrapping the dev_xxx(). For a normal not-KUnit
  build cs_dsp_can_emit_message() always returns true so these macros
  simplify down to being identical to calling dev_xxx() directly.

- The KUnit tests that cause a lot of cs_dsp messages now redirect
  cs_dsp_can_emit_message() to a local function. This returns false
  to suppress cs_dsp messages, unless DEBUG is defined for that test.

I have checked that for a x86_64 production (non-KUnit) build the
disassembled cs_dsp.o is identical to what was generated from the
original code. So the complier is correctly simplifying the
cs_dsp_can_emit_message() and macros down to only the call to dev_xxx().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c              | 68 ++++++++++---------
 drivers/firmware/cirrus/cs_dsp.h              |  4 +-
 .../firmware/cirrus/test/cs_dsp_test_bin.c    | 21 +++---
 .../cirrus/test/cs_dsp_test_bin_error.c       | 19 +++---
 .../firmware/cirrus/test/cs_dsp_test_wmfw.c   | 25 ++++---
 .../cirrus/test/cs_dsp_test_wmfw_error.c      | 23 +++----
 6 files changed, 79 insertions(+), 81 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 42a50a4f8f58..bb93b24c659d 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -9,6 +9,7 @@
  *                         Cirrus Logic International Semiconductor Ltd.
  */
 
+#include <kunit/static_stub.h>
 #include <kunit/visibility.h>
 #include <linux/cleanup.h>
 #include <linux/ctype.h>
@@ -18,6 +19,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/ratelimit.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
@@ -30,45 +32,47 @@
 /*
  * When the KUnit test is running the error-case tests will cause a lot
  * of messages. Rate-limit to prevent overflowing the kernel log buffer
- * during KUnit test runs.
+ * during KUnit test runs and allow the test to redirect this function.
+ * In normal (not KUnit) builds this collapses to only return true.
  */
-#if IS_ENABLED(CONFIG_FW_CS_DSP_KUNIT_TEST)
-bool cs_dsp_suppress_err_messages;
-EXPORT_SYMBOL_IF_KUNIT(cs_dsp_suppress_err_messages);
+VISIBLE_IF_KUNIT bool cs_dsp_can_emit_message(void)
+{
+	KUNIT_STATIC_STUB_REDIRECT(cs_dsp_can_emit_message);
 
-bool cs_dsp_suppress_warn_messages;
-EXPORT_SYMBOL_IF_KUNIT(cs_dsp_suppress_warn_messages);
+	if (IS_ENABLED(CONFIG_FW_CS_DSP_KUNIT_TEST)) {
+		static DEFINE_RATELIMIT_STATE(_rs,
+					      DEFAULT_RATELIMIT_INTERVAL,
+					      DEFAULT_RATELIMIT_BURST);
+		return __ratelimit(&_rs);
+	}
 
-bool cs_dsp_suppress_info_messages;
-EXPORT_SYMBOL_IF_KUNIT(cs_dsp_suppress_info_messages);
+	return true;
+}
+EXPORT_SYMBOL_IF_KUNIT(cs_dsp_can_emit_message);
 
-#define cs_dsp_err(_dsp, fmt, ...) \
-	do { \
-		if (!cs_dsp_suppress_err_messages) \
-			dev_err_ratelimited(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__); \
+#define cs_dsp_err(_dsp, fmt, ...)						   \
+	do {									   \
+		if (cs_dsp_can_emit_message())					   \
+			dev_err(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__); \
 	} while (false)
-#define cs_dsp_warn(_dsp, fmt, ...) \
-	do { \
-		if (!cs_dsp_suppress_warn_messages) \
-			dev_warn_ratelimited(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__); \
+
+#define cs_dsp_warn(_dsp, fmt, ...)						    \
+	do {									    \
+		if (cs_dsp_can_emit_message())					    \
+			dev_warn(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__); \
+	} while (false)
+
+#define cs_dsp_info(_dsp, fmt, ...)						    \
+	do {									    \
+		if (cs_dsp_can_emit_message())					    \
+			dev_info(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__); \
 	} while (false)
-#define cs_dsp_info(_dsp, fmt, ...) \
-	do { \
-		if (!cs_dsp_suppress_info_messages) \
-			dev_info_ratelimited(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__); \
+
+#define cs_dsp_dbg(_dsp, fmt, ...)						   \
+	do {									   \
+		if (cs_dsp_can_emit_message())					   \
+			dev_dbg(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__); \
 	} while (false)
-#define cs_dsp_dbg(_dsp, fmt, ...) \
-	dev_dbg_ratelimited(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
-#else
-#define cs_dsp_err(_dsp, fmt, ...) \
-	dev_err(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
-#define cs_dsp_warn(_dsp, fmt, ...) \
-	dev_warn(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
-#define cs_dsp_info(_dsp, fmt, ...) \
-	dev_info(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
-#define cs_dsp_dbg(_dsp, fmt, ...) \
-	dev_dbg(_dsp->dev, "%s: " fmt, _dsp->name, ##__VA_ARGS__)
-#endif
 
 #define ADSP1_CONTROL_1                   0x00
 #define ADSP1_CONTROL_2                   0x02
diff --git a/drivers/firmware/cirrus/cs_dsp.h b/drivers/firmware/cirrus/cs_dsp.h
index adf543004aea..04d768d08d03 100644
--- a/drivers/firmware/cirrus/cs_dsp.h
+++ b/drivers/firmware/cirrus/cs_dsp.h
@@ -10,9 +10,7 @@
 #define FW_CS_DSP_H
 
 #if IS_ENABLED(CONFIG_KUNIT)
-extern bool cs_dsp_suppress_err_messages;
-extern bool cs_dsp_suppress_warn_messages;
-extern bool cs_dsp_suppress_info_messages;
+bool cs_dsp_can_emit_message(void);
 #endif
 
 #endif /* ifndef FW_CS_DSP_H */
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
index 61078da57462..63416838f865 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
@@ -7,6 +7,7 @@
 
 #include <kunit/device.h>
 #include <kunit/resource.h>
+#include <kunit/static_stub.h>
 #include <kunit/test.h>
 #include <linux/build_bug.h>
 #include <linux/firmware/cirrus/cs_dsp.h>
@@ -2155,6 +2156,15 @@ static void bin_patch_name_and_info(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, reg_val, payload_data);
 }
 
+static bool cs_dsp_bin_test_can_emit_message_hook(void)
+{
+#if defined(DEBUG)
+	return true;
+#else
+	return false;
+#endif
+}
+
 static int cs_dsp_bin_test_common_init(struct kunit *test, struct cs_dsp *dsp,
 					int wmdr_ver)
 {
@@ -2239,16 +2249,12 @@ static int cs_dsp_bin_test_common_init(struct kunit *test, struct cs_dsp *dsp,
 	 * The large number of test cases will cause an unusually large amount
 	 * of dev_info() messages from cs_dsp, so suppress these.
 	 */
-	cs_dsp_suppress_info_messages = true;
+	kunit_activate_static_stub(test, cs_dsp_can_emit_message,
+				   cs_dsp_bin_test_can_emit_message_hook);
 
 	return 0;
 }
 
-static void cs_dsp_bin_test_exit(struct kunit *test)
-{
-	cs_dsp_suppress_info_messages = false;
-}
-
 static int cs_dsp_bin_test_halo_init_common(struct kunit *test, int wmdr_ver)
 {
 	struct cs_dsp *dsp;
@@ -2833,7 +2839,6 @@ static struct kunit_case cs_dsp_bin_test_cases_adsp2[] = {
 static struct kunit_suite cs_dsp_bin_test_halo = {
 	.name = "cs_dsp_bin_halo",
 	.init = cs_dsp_bin_test_halo_init,
-	.exit = cs_dsp_bin_test_exit,
 	.test_cases = cs_dsp_bin_test_cases_halo,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -2848,7 +2853,6 @@ static struct kunit_suite cs_dsp_bin_test_halo_wmdr3 = {
 static struct kunit_suite cs_dsp_bin_test_adsp2_32bit = {
 	.name = "cs_dsp_bin_adsp2_32bit",
 	.init = cs_dsp_bin_test_adsp2_32bit_init,
-	.exit = cs_dsp_bin_test_exit,
 	.test_cases = cs_dsp_bin_test_cases_adsp2,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -2856,7 +2860,6 @@ static struct kunit_suite cs_dsp_bin_test_adsp2_32bit = {
 static struct kunit_suite cs_dsp_bin_test_adsp2_16bit = {
 	.name = "cs_dsp_bin_adsp2_16bit",
 	.init = cs_dsp_bin_test_adsp2_16bit_init,
-	.exit = cs_dsp_bin_test_exit,
 	.test_cases = cs_dsp_bin_test_cases_adsp2,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
index 888e277a265c..f879c5467c98 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
@@ -8,6 +8,7 @@
 
 #include <kunit/device.h>
 #include <kunit/resource.h>
+#include <kunit/static_stub.h>
 #include <kunit/test.h>
 #include <linux/build_bug.h>
 #include <linux/firmware/cirrus/cs_dsp.h>
@@ -380,11 +381,13 @@ static void bin_block_payload_len_garbage(struct kunit *test)
 			0);
 }
 
-static void cs_dsp_bin_err_test_exit(struct kunit *test)
+static bool cs_dsp_bin_err_test_can_emit_message_hook(void)
 {
-	cs_dsp_suppress_err_messages = false;
-	cs_dsp_suppress_warn_messages = false;
-	cs_dsp_suppress_info_messages = false;
+#if defined(DEBUG)
+	return true;
+#else
+	return false;
+#endif
 }
 
 static int cs_dsp_bin_err_test_common_init(struct kunit *test, struct cs_dsp *dsp,
@@ -482,9 +485,8 @@ static int cs_dsp_bin_err_test_common_init(struct kunit *test, struct cs_dsp *ds
 	 * Testing error conditions can produce a lot of log output
 	 * from cs_dsp error messages, so suppress messages.
 	 */
-	cs_dsp_suppress_err_messages = true;
-	cs_dsp_suppress_warn_messages = true;
-	cs_dsp_suppress_info_messages = true;
+	kunit_activate_static_stub(test, cs_dsp_can_emit_message,
+				   cs_dsp_bin_err_test_can_emit_message_hook);
 
 	return 0;
 }
@@ -584,7 +586,6 @@ static struct kunit_case cs_dsp_bin_err_test_cases[] = {
 static struct kunit_suite cs_dsp_bin_err_test_halo = {
 	.name = "cs_dsp_bin_err_halo",
 	.init = cs_dsp_bin_err_test_halo_init,
-	.exit = cs_dsp_bin_err_test_exit,
 	.test_cases = cs_dsp_bin_err_test_cases,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -592,7 +593,6 @@ static struct kunit_suite cs_dsp_bin_err_test_halo = {
 static struct kunit_suite cs_dsp_bin_err_test_adsp2_32bit = {
 	.name = "cs_dsp_bin_err_adsp2_32bit",
 	.init = cs_dsp_bin_err_test_adsp2_32bit_init,
-	.exit = cs_dsp_bin_err_test_exit,
 	.test_cases = cs_dsp_bin_err_test_cases,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -600,7 +600,6 @@ static struct kunit_suite cs_dsp_bin_err_test_adsp2_32bit = {
 static struct kunit_suite cs_dsp_bin_err_test_adsp2_16bit = {
 	.name = "cs_dsp_bin_err_adsp2_16bit",
 	.init = cs_dsp_bin_err_test_adsp2_16bit_init,
-	.exit = cs_dsp_bin_err_test_exit,
 	.test_cases = cs_dsp_bin_err_test_cases,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
index 788458d5a287..1de70e81a868 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
@@ -8,6 +8,7 @@
 
 #include <kunit/device.h>
 #include <kunit/resource.h>
+#include <kunit/static_stub.h>
 #include <kunit/test.h>
 #include <linux/build_bug.h>
 #include <linux/firmware/cirrus/cs_dsp.h>
@@ -1775,6 +1776,15 @@ static void wmfw_load_with_info(struct kunit *test)
 	KUNIT_EXPECT_MEMEQ(test, readback, payload_data, payload_size_bytes);
 }
 
+static bool cs_dsp_wmfw_test_can_emit_message_hook(void)
+{
+#if defined(DEBUG)
+	return true;
+#else
+	return false;
+#endif
+}
+
 static int cs_dsp_wmfw_test_common_init(struct kunit *test, struct cs_dsp *dsp,
 					int wmfw_version)
 {
@@ -1863,16 +1873,12 @@ static int cs_dsp_wmfw_test_common_init(struct kunit *test, struct cs_dsp *dsp,
 	 * The large number of test cases will cause an unusually large amount
 	 * of dev_info() messages from cs_dsp, so suppress these.
 	 */
-	cs_dsp_suppress_info_messages = true;
+	kunit_activate_static_stub(test, cs_dsp_can_emit_message,
+				   cs_dsp_wmfw_test_can_emit_message_hook);
 
 	return 0;
 }
 
-static void cs_dsp_wmfw_test_exit(struct kunit *test)
-{
-	cs_dsp_suppress_info_messages = false;
-}
-
 static int cs_dsp_wmfw_test_halo_init(struct kunit *test)
 {
 	struct cs_dsp *dsp;
@@ -2180,7 +2186,6 @@ static struct kunit_case cs_dsp_wmfw_test_cases_adsp2[] = {
 static struct kunit_suite cs_dsp_wmfw_test_halo = {
 	.name = "cs_dsp_wmfwV3_halo",
 	.init = cs_dsp_wmfw_test_halo_init,
-	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_halo,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -2188,7 +2193,6 @@ static struct kunit_suite cs_dsp_wmfw_test_halo = {
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw0 = {
 	.name = "cs_dsp_wmfwV0_adsp2_32bit",
 	.init = cs_dsp_wmfw_test_adsp2_32bit_wmfw0_init,
-	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -2196,7 +2200,6 @@ static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw0 = {
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw1 = {
 	.name = "cs_dsp_wmfwV1_adsp2_32bit",
 	.init = cs_dsp_wmfw_test_adsp2_32bit_wmfw1_init,
-	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -2204,7 +2207,6 @@ static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw1 = {
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw2 = {
 	.name = "cs_dsp_wmfwV2_adsp2_32bit",
 	.init = cs_dsp_wmfw_test_adsp2_32bit_wmfw2_init,
-	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -2212,7 +2214,6 @@ static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw2 = {
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw0 = {
 	.name = "cs_dsp_wmfwV0_adsp2_16bit",
 	.init = cs_dsp_wmfw_test_adsp2_16bit_wmfw0_init,
-	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -2220,7 +2221,6 @@ static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw0 = {
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw1 = {
 	.name = "cs_dsp_wmfwV1_adsp2_16bit",
 	.init = cs_dsp_wmfw_test_adsp2_16bit_wmfw1_init,
-	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -2228,7 +2228,6 @@ static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw1 = {
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw2 = {
 	.name = "cs_dsp_wmfwV2_adsp2_16bit",
 	.init = cs_dsp_wmfw_test_adsp2_16bit_wmfw2_init,
-	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c
index 79eee89a7fd5..e7bf5dc474f5 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c
@@ -8,6 +8,7 @@
 
 #include <kunit/device.h>
 #include <kunit/resource.h>
+#include <kunit/static_stub.h>
 #include <kunit/test.h>
 #include <linux/build_bug.h>
 #include <linux/firmware/cirrus/cs_dsp.h>
@@ -989,11 +990,13 @@ static void wmfw_v2_coeff_description_exceeds_block(struct kunit *test)
 			-EOVERFLOW);
 }
 
-static void cs_dsp_wmfw_err_test_exit(struct kunit *test)
+static bool cs_dsp_wmfw_err_test_can_emit_message_hook(void)
 {
-	cs_dsp_suppress_err_messages = false;
-	cs_dsp_suppress_warn_messages = false;
-	cs_dsp_suppress_info_messages = false;
+#if defined(DEBUG)
+	return true;
+#else
+	return false;
+#endif
 }
 
 static int cs_dsp_wmfw_err_test_common_init(struct kunit *test, struct cs_dsp *dsp,
@@ -1080,9 +1083,8 @@ static int cs_dsp_wmfw_err_test_common_init(struct kunit *test, struct cs_dsp *d
 	 * Testing error conditions can produce a lot of log output
 	 * from cs_dsp error messages, so suppress messages.
 	 */
-	cs_dsp_suppress_err_messages = true;
-	cs_dsp_suppress_warn_messages = true;
-	cs_dsp_suppress_info_messages = true;
+	kunit_activate_static_stub(test, cs_dsp_can_emit_message,
+				   cs_dsp_wmfw_err_test_can_emit_message_hook);
 
 	return 0;
 }
@@ -1304,7 +1306,6 @@ static struct kunit_case cs_dsp_wmfw_err_test_cases_v3[] = {
 static struct kunit_suite cs_dsp_wmfw_err_test_halo = {
 	.name = "cs_dsp_wmfwV3_err_halo",
 	.init = cs_dsp_wmfw_err_test_halo_init,
-	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v3,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -1312,7 +1313,6 @@ static struct kunit_suite cs_dsp_wmfw_err_test_halo = {
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw0 = {
 	.name = "cs_dsp_wmfwV0_err_adsp2_32bit",
 	.init = cs_dsp_wmfw_err_test_adsp2_32bit_wmfw0_init,
-	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v0,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -1320,7 +1320,6 @@ static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw0 = {
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw1 = {
 	.name = "cs_dsp_wmfwV1_err_adsp2_32bit",
 	.init = cs_dsp_wmfw_err_test_adsp2_32bit_wmfw1_init,
-	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v1,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -1328,7 +1327,6 @@ static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw1 = {
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw2 = {
 	.name = "cs_dsp_wmfwV2_err_adsp2_32bit",
 	.init = cs_dsp_wmfw_err_test_adsp2_32bit_wmfw2_init,
-	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v2,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -1336,7 +1334,6 @@ static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw2 = {
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_16bit_wmfw0 = {
 	.name = "cs_dsp_wmfwV0_err_adsp2_16bit",
 	.init = cs_dsp_wmfw_err_test_adsp2_16bit_wmfw0_init,
-	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v0,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -1344,7 +1341,6 @@ static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_16bit_wmfw0 = {
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_16bit_wmfw1 = {
 	.name = "cs_dsp_wmfwV1_err_adsp2_16bit",
 	.init = cs_dsp_wmfw_err_test_adsp2_16bit_wmfw1_init,
-	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v1,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
@@ -1352,7 +1348,6 @@ static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_16bit_wmfw1 = {
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_16bit_wmfw2 = {
 	.name = "cs_dsp_wmfwV2_err_adsp2_16bit",
 	.init = cs_dsp_wmfw_err_test_adsp2_16bit_wmfw2_init,
-	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v2,
 	.attr.speed = KUNIT_SPEED_SLOW,
 };
-- 
2.47.3

