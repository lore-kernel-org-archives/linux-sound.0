Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60FA35949;
	Fri, 24 Jan 2025 12:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723473; cv=none; b=hpwQeZGQlpSuO/G693KAiu1YsUZQG3sBCCQxW6XbBnCyXw7x+1+evPbcNDg8Cgx2YA2seqs40cwJwffaxMQN7Y/yX8YsTvRoOEuL4Mjk9ApUCtj1MyXL4E4mnbnW411D6TcBw5sARbQjPiAa0SG/RE3doL9UgWvmwwIEhRXjEa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723473; c=relaxed/simple;
	bh=7awlSBGzVQB7n9R+tIGhQjexghDL/PnMAgWAg/eNdDw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Gzm1r6PJ7+WplFmV3RsD0hW+EfCmHN7eIU2mzBq0IJxC/KAQlTxm7ZPBd4vc7q+9LgNPeSLJvNmLVzJk5iTb5jcRdWUiVHIFVgjMztVOIz4Lmk5klzt5HVF8CLeBOEM9tLp/w6yk41LOHR1Wu5pIRDtHNJuODhJLQQWLE0wHhEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V+kVIwDn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V+kVIwDn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAlkN0031028;
	Fri, 24 Jan 2025 12:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=TwhDTC2Bs055
	9eVPrT77FYVIKT9EkHkPXnQgMnY855Y=; b=V+kVIwDnrNr1+d+sFcO8gxeYkG34
	ARz6zisjEdVl/mo/keWsIoZh4q6An0vsDSVHNMAjCO0MIp/jAnB7SjjBMJWYxI1O
	L5tiKX8KpfRGYJ15M6r0zde5GbimLNl1TwF03Q/lyQYy47HIPOE12O8JbFbALRoy
	Ki5ELAtC8uacfRJs5v8If14mk5wa06o5qh8Rtjpz7QcS3s8Vk4I9H+A6CX06o0or
	+MThG+y+Q+5Ig4+Tc0zy3BmifVrUfb0kSDdpQznmUvk0Ubnlc3PfUVdfRttOgRmc
	kVEI5e9ph++TqGskvLUEAPqInwMocx2RklRD8yeNDurUoxauzchUEOsWPQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c9e20c1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 12:57:46 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50OCuEnx012389;
	Fri, 24 Jan 2025 12:57:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 44bmyxmq16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 24 Jan 2025 12:57:45 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50OCvjCH016239;
	Fri, 24 Jan 2025 12:57:45 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-vtanuku-lv.qualcomm.com [10.47.206.121])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 50OCviQj016233;
	Fri, 24 Jan 2025 12:57:45 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 410733)
	id 3A2DE50059B; Fri, 24 Jan 2025 04:57:44 -0800 (PST)
From: Visweswara Tanuku <quic_vtanuku@quicinc.com>
To: srinivas.kandagatla@linaro.org, gregkh@linuxfoundation.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Visweswara Tanuku <quic_vtanuku@quicinc.com>, stable@kernel.org
Subject: [PATCH v2] slimbus: messaging: Free transaction ID in delayed interrupt scenario
Date: Fri, 24 Jan 2025 04:57:40 -0800
Message-Id: <20250124125740.16897-1-quic_vtanuku@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QrmXCp5qyYUbRLESgc_s6wf3aebfbgJS
X-Proofpoint-ORIG-GUID: QrmXCp5qyYUbRLESgc_s6wf3aebfbgJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_05,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=749 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240095
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

In case of interrupt delay for any reason, slim_do_transfer()
returns timeout error but the transaction ID (TID) is not freed.
This results into invalid memory access inside
qcom_slim_ngd_rx_msgq_cb() due to invalid TID.

Fix the issue by freeing the TID in slim_do_transfer() before
returning timeout error to avoid invalid memory access.

Call trace:
__memcpy_fromio+0x20/0x190
qcom_slim_ngd_rx_msgq_cb+0x130/0x290 [slim_qcom_ngd_ctrl]
vchan_complete+0x2a0/0x4a0
tasklet_action_common+0x274/0x700
tasklet_action+0x28/0x3c
_stext+0x188/0x620
run_ksoftirqd+0x34/0x74
smpboot_thread_fn+0x1d8/0x464
kthread+0x178/0x238
ret_from_fork+0x10/0x20
Code: aa0003e8 91000429 f100044a 3940002b (3800150b)
---[ end trace 0fe00bec2b975c99 ]---
Kernel panic - not syncing: Oops: Fatal exception in interrupt.

Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework")
Cc: stable@kernel.org
Signed-off-by: Visweswara Tanuku <quic_vtanuku@quicinc.com>
---

v1 -> v2:

- Added Fixes and Stable tag.

v1 link: https://lore.kernel.org/lkml/8055a3db-5bb3-4550-b434-28a9df85c7a1@linaro.org/
---
---
 drivers/slimbus/messaging.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index e7aa9bd4b44b..6f01d944f9c6 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -148,8 +148,9 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
 	}
 
 	ret = ctrl->xfer_msg(ctrl, txn);
-
-	if (!ret && need_tid && !txn->msg->comp) {
+	if (ret == -ETIMEDOUT) {
+		slim_free_txn_tid(ctrl, txn);
+	} else if (!ret && need_tid && !txn->msg->comp) {
 		unsigned long ms = txn->rl + HZ;
 
 		time_left = wait_for_completion_timeout(txn->comp,
-- 
2.17.1

