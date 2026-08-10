Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2296A35C1A0
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 17:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786384351; cv=none; b=o0Fo6vGakqbDRB3SHGdbJ8ZS4+5Sz7vkprwCcTNzSolmu397lCCTyb8+0v32EC3Lo2pDHks/1oi43pnE+Su/hZLXqN/JZdpQOMx7k7oW952sFK2hpraNqCvc94n1IHy510JUEz5OGKeGAJG5+CC6zHGQe+Ei0vql8XJbSVX5zB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786384351; c=relaxed/simple;
	bh=aliK82T6KYQxw/3hpLsCQ6N/jchY1K7iXkz58Jt/q0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DwvdQN8QdGfG7rlN2OJjLjt5X+cpWKUE3vtJ5UuvymGORVs4V5Wrf3MO5md5Zih0q+OG3RBrUldMIWCqx+f2Aop8zSRavHedZHJgKVWuQXWkku9OdP2isQSYhC8AvDUxNJqvK9aGxiZjQxggYOlSjX65eAG9h48cVMXxDaDCs48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSkrgMm2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQ5HVq6V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSkrgMm2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQ5HVq6V"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AGtHDG1483448
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 17:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i2fDcHme8fEGRpxzmxPzv/
	MbcSjAJj5X4PquEbrTLtw=; b=JSkrgMm2gUmRFXNFlT/VDPDlhX7yEXYIyqtIWd
	iXM9in/JtE0lQ3G1fiR876pg9fJiBcdtIlFvm/0ekIiek5kXXDess3uxE3iDixLS
	UkWUVXuHEbUHQJi+sj3R5myS6s8D6CvirU0xnA2dpXj8FJ6Sq4Kw/IJEPYnwmJIz
	7kWwEhZAB9CiQ0eBUmFZS53xKSt5NlO9MUBNvC+SqK8pJNg4bwIdcrkWQBDFF3V/
	uDkVwP1KWPeD4unz7A4JwoG30SR+hH86AsPIQuD+VRlJ4HOnevoEaUI7rOqbzFHQ
	+Q1do41S+jB7L09beyTfetXlMW0SJF8FKg8v0Kz4wpbMkktQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk7882e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 17:52:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso28870955ad.3
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 10:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786384349; x=1786989149; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i2fDcHme8fEGRpxzmxPzv/MbcSjAJj5X4PquEbrTLtw=;
        b=WQ5HVq6V+QerZmzfnEQHs9YWX5L8BEtAUWS+oBwNbCnLsl5Im9u8nvUH4cY1NIvub7
         67HBbQa59nCWIkdgwFdRKvNqBwEyifDrHq58MoCqV3NWLUchMkA7ewPzc8YWD/aYq5zm
         QdM7qAWuYIs67uyNJrZP2nlCcS0k1yHc25Z3O1CdfJ5VNvb0LmJikI2pC7qHKHtMenz1
         lqR3QxnKsOxCapj4pJp6q3gLrwk7rdL+vRQg4+n3kDBauMmW4GhbBRV2YG3aa5H+onI8
         cZXIEc3ACzwU55lH8ELRHjOkSnIsBrp7fCmJej3D9N3rX+vg17DYaq1l+s/fpuctJTb7
         1lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786384349; x=1786989149;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i2fDcHme8fEGRpxzmxPzv/MbcSjAJj5X4PquEbrTLtw=;
        b=oJyUSLGDBdMlNHh8uLpz35t6lvsdGZ70UIyILQkWkOakMfAPbGDC161/qQgXAM3OmC
         bEPlIel2ntjfi1En/b6vgTpJ3FJmp+ey6FnZob+dJ0UVWwLQWsOQ0vBbvCJd/nL43FbM
         G1K9y3qhw2l3LY4r/5Z4qoL5EK4KuZw8M7O0J0y5/Ed/RDhu1qoa431lWV4iRZzSzn7g
         /EELTMblodJr79GYApKFsQkp+TpEl0zEgIPM1Ji+ggyCMNltXoddd+bWt9DHSNb8Mwuy
         MEhUw45v6VpOqtvVu7RkyUK9gE+3GCBiAq2JaPZ47w4BfvV9pKEWDhdJ1eIq0E4gGVph
         IqNA==
X-Forwarded-Encrypted: i=1; AHgh+Rpcr65Yu7RD+rKUWlHw1XoJzQ+xqr3K/ZIwhIpLsNt5wy5ZHujgdpP6PUwerK5n1ucBqk8dnbwFJYlvkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzps0vHzbDDFeM0XUezL2WyE018lHY7Rvs2gjm7GTH1mDU4T+T
	lamxWqd1AHW+c0wyvQ9OG7RQfFw+L2gYin+U6NbVww0nquOP1Cut53VI7I6bSGTnitIlbLW23u4
	GZVZe3XZ+p6TPTcwmxkDc0ivNq7O0W+RA4enOnQJDESnjYWqZp65EZwlNDkClxJFOxA==
X-Gm-Gg: AR+sD10tQ7cM0QU0gwftDZsMquTSPN5T9RQYDYrEDrtA95C4RlWjlq3jziJJWrgNRIX
	7ClUdPBjbgx+f/TbHaoFEpa74F72Y7Qqsgi+8yXhh3vQ5s4BDqaaW9hrIlIMJHU2lIKyMkqzfWg
	CGkvoUOu8dIeB3Utzt7jbVQdI1y1XgpvJgBk5PxrwzMXBbOBuihxsiQ1lQsTkiesLsivTyxouoq
	SBGGVmhZTnfHlSJTFHUxRT0gvSekcI1i3GQlkwTGBhnMuvt/QlruZBNiC63huuLolECiU1oyNCB
	JtNJquB2gpw/zO0a7JYsK+NFIJUe4ccDVGsKiSNWHDyic9LcQGz+5eyRYXlDZ03M1pJK4y25VSJ
	w8/u0tfmOHg6NcxDvzXIzPL7rh1Gc/WowslTg
X-Received: by 2002:a17:902:d985:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2d2ffc5bd27mr41640045ad.6.1786384348507;
        Mon, 10 Aug 2026 10:52:28 -0700 (PDT)
X-Received: by 2002:a17:902:d985:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2d2ffc5bd27mr41639385ad.6.1786384347982;
        Mon, 10 Aug 2026 10:52:27 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4a9f0fsm39661585ad.68.2026.08.10.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:52:27 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 23:22:19 +0530
Subject: [PATCH v2] slimbus: qcom-ngd-ctrl: Implement disable_stream
 callback
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-slim-disable-stream-support-v2-1-c2e8fcc3c99d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANIPemoC/yXMSw6CQAwA0KuQrm1Sh4/iVYiLAYrW8Jm0gzEh3
 N1Bl2/zNjBWYYNbtoHyW0yWOcGdMuiefn4wSp8MjlxFV8rRRpmwF/PtyGhR2U9oawiLRizysq4
 LOld0GSANQXmQz29v7n/b2r64i0cJ+/4FSuUpHn8AAAA=
X-Change-ID: 20260803-slim-disable-stream-support-43599401607f
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786384345; l=5939;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=aliK82T6KYQxw/3hpLsCQ6N/jchY1K7iXkz58Jt/q0Q=;
 b=4ZMCst4nPrpwfjtlB9lAHMxF6N6ap7RDAup29GBOXw9/Wr3Q4zBmn1DsYX1lrDyJfD+z5zqt1
 wBCK0yAQo2hB4GI4XpS05xAthVteUc0uLOykrkISOcjpCGPQSKcdpqG
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=Yus/gYYX c=1 sm=1 tr=0 ts=6a7a0fdd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kKA2uLVnAdZqmg0bn4kA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PGbQjQU_hYuRkoODbrkYwvYQmCwg36wy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE1MiBTYWx0ZWRfX15/m1Hgy5BgB
 sCtFTkbs5oKgGewaSysDJq1hIyd9RTbpGgfI3ADY5ekwD8lOKYC/pIf1vE7Ui3gNovkUS8wJjxD
 H/f5s1uQMPwtFCbUpNqNwx7s4EPSz3W9wbcFJGfXHSWohKNUCpVSDj5hVxzIDT2SPApL6PSWWE4
 vcVmz8u6anRQGCTwSoCptMjpMsL9QeWDPL3FbP3qa92GKyGnb/dndReAANHbZIIWqgt3O5JKAmE
 Qv95k82JFpHrdNA2zhy14QbAlRiQz6MrwaBGtP0vWp2sm+md1gD6bZfT9uPSp8ITqmpXWyBr801
 3veZGhNbGQwokKzZN+50DWWmwia9tGgmRbujgw0lwQLvy8NtlsEQNvpFKqznN6B/CCjOA4IukqQ
 EvYdqY3BkF5PzabMw1YxsJDkblup8fBNQGiUAmwHt1VL97KYgRG1Rn+bSmy48Q621ohL4JEQNZB
 6GVCPVT/aD61vBMy3GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE1MiBTYWx0ZWRfXzmfmFOzRsZFM
 A4udWHP2yz2O5+eMy0FPOq5Qum5FSHf6WAgi6QCymRS3oe1LeyE2dVcQb4K+tms3XOdLufHwIrK
 CTA0dlXLTHI1fbFryotGB4Y5o+d5d38=
X-Proofpoint-GUID: PGbQjQU_hYuRkoODbrkYwvYQmCwg36wy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100152

Switching a channel to a new frequency without first disabling the stream
causes the channel to be re-enabled without a clean shutdown, leading to a
crash on the DSP subsystem.

Implement qcom_slim_ngd_disable_stream() so clients can properly close a
channel before switching to a new frequency.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v2:
- Rewrite commit description for clarity.
- Fix initializers: use { 0 } instead of {0} and {0,}.
- Use reverse christmas tree ordering for local variable declarations.
- Replace open-coded shift/mask with FIELD_PREP() and GENMASK-based defines.
- Add SLIM_MSG_HDR_LEN macro to replace magic number +4 in txn.rl assignments.
- Fix dev_err format strings: add spaces after colons and commas.
- Update enum slim_ch_control comment to kernel-doc format with @member tags.
- Link to v1: https://lore.kernel.org/linux-arm-msm/247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org/T/#m3b50aa43a6493f8d3b607b1607b37bf14b199f69
---
 drivers/slimbus/qcom-ngd-ctrl.c | 82 ++++++++++++++++++++++++++++++++++++++++-
 drivers/slimbus/slimbus.h       | 13 +++++++
 2 files changed, 93 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 934c44c5bc1a..30d6ac52072b 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1,7 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
-// Copyright (c) 2018, Linaro Limited
+/*
+ * Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
 
+#include <linux/bitfield.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -86,6 +90,10 @@
 #define SLIM_ROOT_FREQ	24576000
 #define LADDR_RETRY	5
 
+#define SLIM_CHAN_CTRL_CMD		GENMASK(7, 6)
+#define SLIM_CHAN_CTRL_LADDR		GENMASK(4, 0)
+#define SLIM_MSG_HDR_LEN		4
+
 /* Per spec.max 40 bytes per received message */
 #define SLIM_MSGQ_BUF_LEN	40
 #define QCOM_SLIM_NGD_DESC_NUM	32
@@ -1085,6 +1093,75 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
 	return ret;
 }
 
+static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
+{
+	struct slim_device *sdev = rt->dev;
+	struct slim_controller *ctrl = sdev->ctrl;
+	struct slim_msg_txn txn = { 0 };
+	struct slim_val_inf msg = { 0 };
+	u8 wbuf[SLIM_MSGQ_BUF_LEN];
+	u8 rbuf[SLIM_MSGQ_BUF_LEN];
+	int i, ret;
+
+	txn.mt = SLIM_MSG_MT_DEST_REFERRED_USER;
+	txn.dt = SLIM_MSG_DEST_LOGICALADDR;
+	txn.la = SLIM_LA_MGR;
+	txn.ec = 0;
+	txn.msg = &msg;
+	txn.msg->num_bytes = 0;
+	txn.msg->wbuf = wbuf;
+	txn.msg->rbuf = rbuf;
+
+	for (i = 0; i < rt->num_ports; i++) {
+		struct slim_port *port = &rt->ports[i];
+
+		if (txn.msg->num_bytes == 0) {
+			wbuf[txn.msg->num_bytes++] =
+				FIELD_PREP(SLIM_CHAN_CTRL_CMD, SLIM_CH_REMOVE) |
+				FIELD_PREP(SLIM_CHAN_CTRL_LADDR, sdev->laddr);
+
+			ret = slim_alloc_txn_tid(ctrl, &txn);
+			if (ret) {
+				dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
+				return ret;
+			}
+			wbuf[txn.msg->num_bytes++] = txn.tid;
+		}
+		wbuf[txn.msg->num_bytes++] = port->ch.id;
+	}
+
+	txn.mc = SLIM_USR_MC_CHAN_CTRL;
+	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
+			txn.mc, txn.mt, sdev->laddr, ret);
+		return ret;
+	}
+
+	txn.mc = SLIM_USR_MC_RECONFIG_NOW;
+	txn.msg->num_bytes = 2;
+	wbuf[1] = sdev->laddr;
+	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
+
+	ret = slim_alloc_txn_tid(ctrl, &txn);
+	if (ret) {
+		dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
+		return ret;
+	}
+
+	wbuf[0] = txn.tid;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
+			txn.mc, txn.mt, sdev->laddr, ret);
+	}
+
+	return ret;
+}
+
 static int qcom_slim_ngd_get_laddr(struct slim_controller *ctrl,
 				   struct slim_eaddr *ea, u8 *laddr)
 {
@@ -1624,6 +1701,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	ctrl->ctrl.clkgear = SLIM_MAX_CLK_GEAR;
 	ctrl->ctrl.get_laddr = qcom_slim_ngd_get_laddr;
 	ctrl->ctrl.enable_stream = qcom_slim_ngd_enable_stream;
+	ctrl->ctrl.disable_stream = qcom_slim_ngd_disable_stream;
 	ctrl->ctrl.xfer_msg = qcom_slim_ngd_xfer_msg;
 	ctrl->ctrl.wakeup = NULL;
 	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index 00a7f112574b..c1137e8aedf4 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2011-2017, The Linux Foundation
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _DRIVERS_SLIMBUS_H
@@ -316,6 +317,18 @@ enum slim_transport_protocol {
 	SLIM_PROTO_EXT_HALF_DUP,
 };
 
+/**
+ * enum slim_ch_control: Channel control.
+ * @SLIM_CH_ACTIVATE: Schedules channel or group of channels in the TDM frame.
+ * @SLIM_CH_SUSPEND: Keeps the TDM schedule but halts data transfer.
+ * @SLIM_CH_REMOVE: Drops the channel or group from the TDM frame.
+ */
+enum slim_ch_control {
+	SLIM_CH_ACTIVATE,
+	SLIM_CH_SUSPEND,
+	SLIM_CH_REMOVE,
+};
+
 /**
  * struct slim_stream_runtime  - SLIMbus stream runtime instance
  *

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260803-slim-disable-stream-support-43599401607f

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

