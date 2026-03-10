Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7330C340A6A;
	Tue, 10 Mar 2026 11:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142331; cv=fail; b=r81D3CNItP5hvg/6RHqzabIDJ8N7qeEHP+mPyVRB4+nA81ZMPELmplFvqtH8dgJSzBvqIVokRCt1+wnwk7AfmTDRlPn/XCN/aO958cbJObwqjPADSjRgXzkSNsJDxUy1+brV7ve1dOaXul7BrwR/8e3kyHuIxTE3D/eUwRK0+8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142331; c=relaxed/simple;
	bh=GuD20pX1ClFNxOMTp2lWwK6TrsOCrvdEI9dZiH4ElFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bfHdrmYInupf8KVyTr3ADjNipLKWzdEjDA+5YhLHqkxsHnw/75IQkNnwyHOm0hyxy+dri5vLgXmrzxuqhLj3/SmOC4hmGzpEdDQvNXlT2Fv5PqP+tS/X2fCLI1oAz7CqnSgRYrSjd3hsO+FHja+N3PjiS7ERK7tKX8PMTNjmRiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Z4+XjZnV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZeBkyItx; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Z4+XjZnV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZeBkyItx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A4tHnU383696;
	Tue, 10 Mar 2026 06:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=CO9LKfLAPz8sPv64
	TrskKRuM2Tzg5IA6rEQCwgJeSS0=; b=Z4+XjZnVLr3U3+bEWDUhcpxp2338ljFT
	R9lw79h8CsFKi3QjFz6KV1ye0gP5yNDQWZA0ba7OdC0flAXNfYqrVnE5qZTdbu0z
	45K4Rappx5gEEBHrBTr2kiUahY+5anXxdqaW8lWdpEIJRzB3BqbWZ+qGDOM0g+4J
	d2ZU6Ct1BMiWmvk6/xyuytXUReOd1DFJZ049p3hh5NKTmu8+ov9Cl3deLdMeUoSU
	VYvR1CUoZtawh0HXALuFzxl49P+255wBUhLEv2f67jYWi3bNJAafdu/1tNiV7t2W
	xJGPqfC8m56LSz1eBkubvm93+WXv4itazFbYbhAMFiq5BE5+qVmpmA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023112.outbound.protection.outlook.com [40.93.196.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4crhapbcnu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 06:31:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kK063ApwPwZNi1YvYckqixeeJMgfO+aELz2qfOqldup4pM1GvS+jiNYLEe/iPWb86BO+lnqOGb3+uPpgUgKFYst1XcnOhffzfHO6YjgL0L6EUS7fnjieBZ7qrDX/4+y97POn2RMzCftE6Nr94F2Q15btGQuP5bPDIpiNnJDFu+rYMDUQbfDH9RUMLYqEltDDJ9D5nfTPEuIEbGfM4Nu05dgmdf7lqGMfcY0Fyqv9U7lrmFiXTqZ04mxoEedDTRFCSoKfhpwzhj6WrJShoSRFBocXAoOjS5hZrGQav38tlvdOOiinO8flFsghSAi70PKBXvLgpLgQig/gNuZ4/sWYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CO9LKfLAPz8sPv64TrskKRuM2Tzg5IA6rEQCwgJeSS0=;
 b=AevrRUxWWcVuBWExl1XJApgzOIGoEpMaUNNHGJADCzvmn2mlvP8gEZWFksrYpk12jPCz0Oi/Dmn0QhurnezfvJFWRFfM/mZqF8AxUdDJ4KnXimSnT1p9SAGXG3NEPIqx/s/57cAof1buKEZ5RVV84RjKHBFM0lbRukN73ZFdLBVq3IGM/gGhP+t1GPbMFKt9KDvCS1rske0dshTypWC13rDWFllU6IzV7Z5flVQgNi5sc//nC9g92ANWjEpQI0ZTrTxVt40VAU6Pz2muugeSgSTNsaS0XyR7tapPPHcFu3sehGalvIY3FrElN6XPJ1e4/APVh/UteqZ4Ggwf/a2FBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO9LKfLAPz8sPv64TrskKRuM2Tzg5IA6rEQCwgJeSS0=;
 b=ZeBkyItxN6dxITD5ZDs0UnaOaWSDX2JmF0V/tdjBTNP/7H6qVICGA6KU4cWId0UWQxeuFG+jDiDeBtONOiVzkVQhCX+yYi+XqRTNVYJrjNOgB9YxVbOcckKWn+0SkAY4iI04HMD1mSeBk/lSIOcfi2XtaRbX6XCev45Gs6FEFPs=
Received: from BN9PR03CA0035.namprd03.prod.outlook.com (2603:10b6:408:fb::10)
 by IA1PR19MB7253.namprd19.prod.outlook.com (2603:10b6:208:42b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 11:31:35 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:fb:cafe::ea) by BN9PR03CA0035.outlook.office365.com
 (2603:10b6:408:fb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 11:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Tue, 10 Mar 2026 11:31:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 29757406540;
	Tue, 10 Mar 2026 11:31:34 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0EA36820249;
	Tue, 10 Mar 2026 11:31:34 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: cadence: Clear message complete before signaling waiting thread
Date: Tue, 10 Mar 2026 11:31:33 +0000
Message-ID: <20260310113133.1707288-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|IA1PR19MB7253:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 992c36da-48e6-482d-a4f3-08de7e98962b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|13003099007|54012099003;
X-Microsoft-Antispam-Message-Info:
	bskjXKi2ROd9j1AJU5/CT7trgZOb7Bl6jjlNNWmD6A8zLGMMC6txKLpFucqtvpdeKyadUObdtUqtHXJ2apngSZnB1hAxodRHjncxwj8881/WEUA3n+kkOaUo0DqGin84ndjPbnFzk1qdqSavcLBnCU8f5/WQJm3HwHBwbYhTmKoCuGz7nmd2xHYgiyRCnfH8k/jl8EjXiEHPvHGS12mun/z9p3F2gXRPxBCvFIvJ9Q0jtsxp8F+2yBh/xaFF5qc2bdetvt8pokEv6ZYWNDLR4braiNJ6JQcofW+jgy5CI27My9vo0NaqgnB3Omq50UveicQ0DhH03JZCLWm2zH9ZI6T04Oi4cg5x2kBTWAXyA3ORjA6jGOFHvg9Y9BR+E7ty1iEP7JivEhRFrDQ8UzEIrXsVkpnUh18swbQL3gpnaWu5MIGdLBumEg8aH8ZzKjv0iO2fBIzVlADkXhkBWPc6cXRYrkHLuR76bm6UqwePoEoU9jjEQcX86/2iRYsiFs1e2QHBKoQ7C1wjMaLShI2QX+KxWFVMKpVK7lDvswXxIyLjV9BByFPh19bUVNO+7At1OsE+QERJXHuqlbDH6GWScvm6+nxvrvyibCuxG/OWhAr4Gfii2zEKcfYIDvc0Pjz7YblcXbIU2Y0N7blZikexouGIcrTfEpvwqknIC6e5M+UHPKSeREwZpgKaNGEVLyKLXXvlg4ptguixo3I3TJlNxwT76f1h2Rco4RnagyWn2mY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(13003099007)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fu8CQzh3JKz0IPTrID7+2Naq5qJ3wmj9BSQycuwIY2TjbOISHOSl+16hmDFTk9dWbP668486q/JwxyxNapcdVn6ky32TeV8t51N3QRHhWwzrrnHQhZYhokekq3WHPXG9GjG22HVtGLGfJyGZ85tHRXBme42VmMWMD3swR1c72+9PO+9eZpJhs/mz0h8CmVJV8X5Q3rQYYtWY/GTPF844MtjQDnJibK6FXlhk23+mNgw+XIHotcsCatVm7Q/3+csHSz1WZsEgFe4K2R5pXDlYy8Bxp+pudujYe566d5HN31+3UHJ86/JqivGEzT9MSmF8K+qEmN5tlHveU8GiD+eybM5hRQ6NOlIFRhjw6bcsxc+VFQa3vW32GA7jDW4GRPnuVuHo2Q/raIn81cUkPQ3+kuwKJ6zLN/vXiyC2WQwt9ART0y14tBBnUulLijQRjBIm
X-Exchange-RoutingPolicyChecked:
	c+bqqb1RFzq1h49sFRT9zdgveQLrwSGR0ZS95pT2NMdvlEg6QpBpsI6Rontu39tFDVIWcSF+lv+179lV5DfHzj53fLVhDC9kCl3Do9JqR6q5k4SoFmmVX6isgyyw+YLBibMSxN8lmPv6ln5a7wc5W1JG+UZRlUz9KUhfUIfbNdytP6Uv6kGLzP9K1nuCx1xUndl0CvnIHZXrF/W3tWHXfdvotPqF+dKOOrmZu5VrVCmjWTOesZhb2U3FKFg/uih7r8uQhGG4sQiIoePIPyke9Tv9dVgXCTsXwbIKG/f4EIYtkyNwTNGQ9l1a9RJurCTHbGIpO6fYCp7J1C6CBIQlUQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 11:31:35.0628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 992c36da-48e6-482d-a4f3-08de7e98962b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7253
X-Proofpoint-ORIG-GUID: 5tF9YUSTg2ygQ0LCFtASftJQBtt1pscj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OSBTYWx0ZWRfX2xg0KvivsK0H
 4rST+qZRmjxCaraALpPrghskpK0MJnSEWXncknaW/L25pJCtJRAzB9AK1fvLv1DLG9XsnycD4sl
 PjwFaduhRwamSJiRNPlSjOTP2gtVKt6jyDN4WW627ZEHhR7anpgt2UupDzbDHH2beasUJVVMw4S
 28AJUwrdQtuUY54AorhWeFRtff0tqeYSS5VRbT0thii6kNrUFQdltDLJmtrNAPUPj+MR4OFKLJH
 zCWSWgxCVcbAiYDMvGa4P/Gi0i/UKzf/B/9bffpES0dFa+PY5Ca+0by2ESMyOA2hRhM/JLAbuzO
 1BQ8eSrS4A1jD9LSrdwXUQjAAlraniIZQx6GO4gbzAUsxF40G46ZFg741QYHSN2W/Zx2Fo8X3A6
 dFrk7TXY4tG3omzCOb4x0rYlaiU+AoWFcdS2gugBr+2lshFFFS5UpEQR6lM16yNrtoDRFTqpm94
 pcDp6xUGT82CawHIjCw==
X-Proofpoint-GUID: 5tF9YUSTg2ygQ0LCFtASftJQBtt1pscj
X-Authority-Analysis: v=2.4 cv=EbbFgfmC c=1 sm=1 tr=0 ts=69b0011d cx=c_pps
 a=dWZueVx2hxoXd+HKFvf0WQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=1XWaLZrsAAAA:8 a=w1d2syhTAAAA:8 a=X0n5ma9evtijOd32JNkA:9
X-Proofpoint-Spam-Reason: safe

Clear the CDNS_MCP_INT_RX_WL interrupt before signaling completion.

This is to prevent the potential race where:
- The main thread is scheduled immediately the completion is signaled,
   and starts a new message
- The RX_WL IRQ for this new message happens before sdw_cdns_irq() has
  been re-scheduled.
- When sdw_cdns_irq() is re-scheduled it clears the new RX_WL interrupt.

MAIN THREAD                        |  IRQ THREAD
                                   |
  _cdns_xfer_msg()                 |
  {                                |
     write data to FIFO            |
     wait_for_completion_timeout() |
     <BLOCKED>                     |                       <---- RX_WL IRQ
                                   | sdw_cdns_irq()
                                   | {
                                   |    signal completion
                          <== RESCHEDULE <==
  Handle message completion        |
  }                                |
                                   |
Start new message                  |
  _cdns_xfer_msg()                 |
  {                                |
     write data to FIFO            |
     wait_for_completion_timeout() |
     <BLOCKED>                     |                       <---- RX_WL IRQ
                          ==> RESCHEDULE ==>
                                   |    // New RX_WL IRQ is cleared before
                                   |    // it has been handled.
                                   |    clear CDNS_MCP_INTSTAT

                                   |    return IRQ_HANDLED;
                                   | }

Before this change, this error message was sometimes seen on kernels
that have large amounts of debugging enabled:

   SCP Msg trf timed out

This error indicates that the completion has not been signalled after
500ms.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 956baa1992f9 ("soundwire: cdns: Add sdw_master_ops and IO transfer support")
Reported-by: Norman Bintang <normanbt@google.com>
Closes: https://issuetracker.google.com/issues/477099834
---
 drivers/soundwire/cadence_master.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index f245c3ffb9e9..b8b62735c893 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -933,6 +933,14 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 
 		cdns_read_response(cdns);
 
+		/*
+		 * Clear interrupt before signalling the completion to avoid
+		 * a race between this thread and the main thread starting
+		 * another TX.
+		 */
+		cdns_writel(cdns, CDNS_MCP_INTSTAT, CDNS_MCP_INT_RX_WL);
+		int_status &= ~CDNS_MCP_INT_RX_WL;
+
 		if (defer && defer->msg) {
 			cdns_fill_msg_resp(cdns, defer->msg,
 					   defer->length, 0);
-- 
2.47.3

