Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370B44279FE
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 23:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097558; cv=none; b=gXjvdGRBiAl3dzJWmKG1rnE6G7Zh+TWK53yQV5pRioKkTNuy1h1g8zYKwBflNrSPzUxTx53wjwUQB8F37bl2HH4SEez/LNgmxXGrRXNdOHfyVFkWhImwO1mMvn1K8HnijhZPpXkbQQC59sNUX0lnfZEOWRBJnDHJa0XHRAmncl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097558; c=relaxed/simple;
	bh=ulxSsa7188EBz+8PhYCrmatbVk0Sh+N5SiDD0XnhX7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMTw5cyJ/EV7qtwOWAHB4KLwyqqA792j5TZ2DapjjT5gRPvNn+A7V6fzuKU5cUhtqMCzRT1v7iCP34ze+SxgcyZrLeeucd9jLW/9kJIKTU94Q+o4oSiRSVQ/otwIACCfEaMXAiT8w4Vfv2//eUZSiyk1IDYn7h3GpPxcmJ7JvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaYhT6ey; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heE5DFLZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaYhT6ey";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heE5DFLZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBlbK296193
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 23:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/gz4Ge3MHwk
	UDTTkujrW9dZ+6p+ProQlBVOR/K4PwRg=; b=PaYhT6eylqd83bpMQFYbYaV0W5S
	mkzH1MgbfuAvBJ/7ojSkvwmB2brtv9Dy0UGX8UfrUnxTxvdkTdNan6OUS2+NvZ3e
	sF4nS+5Yv9L3QfuMDCsD6Y+UAuJmb43YTmwqFS/Gys81rzF0MMxK7v08rJZhdA1b
	WV2fQRVJm2zf+akHmBl5+inla5z3FhhzRUmrUlgsAKzOM7bgrX6B1OO3v2UxpUMA
	AYOSjkMi2Tv+TU2zS8pwaDgeJpYWAu2pVQBaPXzhjOTfhZ+VLz3I6w89RDpVfuLp
	GxB1r5AI7dmq8fbxWWH/M/nZkJFhPG1GwJ7GLHTCooGJvaSAAf/y037ZHYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy1rvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 23:05:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7de0e161so1264098985a.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097555; x=1773702355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gz4Ge3MHwkUDTTkujrW9dZ+6p+ProQlBVOR/K4PwRg=;
        b=heE5DFLZZBFfzHQy57r9wHCcM5YyZkfzpeXU2HCzt/OvFiUW/GmmCMHNUKMFHibU9c
         yP4bGFgz/mapyRq735LKe9UDNwcX1Sm3nJhW8scXKUSJvK+xYC6O1p2h/Sh746jQfc9f
         8dU9JpiWIOplw9CKZL4pUEe4UWJ1vC1lMybwsRSMqBQqCMFgU6f9IGs+f6urSWiIYHzu
         yi/zvoGtPs+CGXb6QOZDdISu7Bt9YXMJ1EgEhNevR+KEvdK/S72EbScaUAZYCWCbyfUN
         U3J3ya5ezlxjBm5Y6GZ1D9s4eVEZrJBI9YDE7oP7FprjG9WvTGPmjW85bODcPm/CXPem
         OjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097555; x=1773702355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/gz4Ge3MHwkUDTTkujrW9dZ+6p+ProQlBVOR/K4PwRg=;
        b=wZvfMlPKWkHwhIw1bPOzy56pwDbUo9dKVSnYFvvN4SR3HlRiNaodFMJQ5R1sMTo3Sq
         8x8jxkE7ov/XKkNfecH6uZWTk0Jexk4DLJ++PCik/q69O5b/htRIAJDzpZY20Aw3cx/d
         PdETX/SQIxlVQR45MvnJvcSepkCyCJNMzeqEnSXHHrX4T6MUfAeMMby+hjNNuw8PjFvl
         mo0XQu90PMx3ikSEnloUQIQAwbb6P05dwXu0r+qiGWEu5KgWXthSMMtRWssp7ky9kghb
         LA6TGSaC8tyI+018ae7+tZhi/eWP+HCR5wZdIlocwGXxgLEWIRXGU+xKrfjH7gHD9tic
         LwcA==
X-Forwarded-Encrypted: i=1; AJvYcCUitlPv801HdoYEVBYLJvKqvg9FKwl8oODUqv/zeqKKvm6K/EX2SBg2Jo7/SUot2b4qHzQWVfeWym/HCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdeJgqNb3pNjQ0Zk+hV42z2DVZ1Q+4PFXLLMEWY9QiIGRHAzIt
	YS8wQQ9+jfXvomo0vQpHl0SBF5GhbNLi+3nMnZEViqzLETAHafhWhN7t3mwEODBCL8iturhYOv/
	rWiOKvMhDbVn88pbKykWQDIRm84nwgrrRCPG99zS9863Px2RkSaQYY3SBicqwaQw3pg==
X-Gm-Gg: ATEYQzy00kl0qjFVVGFreT4LHeykYGqbgI8k5DMaSqZ1xssRF8ZFCv5ySA25EeYRBYO
	I6EVlXk5CkRaClKoD75qf2WBH1roZxB2aTlZFnEtDMwysJEdKNR94xofZkrWHepkqf1B1/ilNyy
	FlkAGBfwgO3l3EtPpWUEz/Em7mQbmH0yfVZG+usCghKJl0GkQf88tZHZndqIMfnmPVH1vNVUqsi
	TuI5ZkwU1J2bi8tH/qfqcQbBwmHYYBZQ5Mdnablf5uWOk0gVIKwo9UvYJogZlhJhiyqeNaNbEXe
	P/4Eg+hITuoTNbqUbZhZz5rq1ZO5woDdIwClWXWQoLyiwlpd2TQ4zOy4JfGyXcoS1aW+rP6/zsa
	BXdQIP0KVGkf5px54IpfmVRi+e8c9UGxSW2mUjrCfK0Xo9JBEmg==
X-Received: by 2002:a05:620a:1728:b0:8cd:8e8c:2076 with SMTP id af79cd13be357-8cd8e8c242dmr439791385a.77.1773097554758;
        Mon, 09 Mar 2026 16:05:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1728:b0:8cd:8e8c:2076 with SMTP id af79cd13be357-8cd8e8c242dmr439783485a.77.1773097554104;
        Mon, 09 Mar 2026 16:05:54 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:53 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 5/8] slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:34 +0100
Message-ID: <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX8kaWcFJWFC1z
 HKwuXVsdNLx3pUyBwdH9OemMCqWQzr+lgFNv8W8gj16vewmNU8CNNhmhlOFvCU1Gm3yZNyr7tUs
 lXZ9w/9nicKbtwWxn1MnCG+tpkqINaIqBoGYMotI7Hwhu8c22j4+VuOPwobgQgeeo0NxUZAWz5S
 lLldJKMZyyeEbbtNLYc/4tGR63C82g6h75nSRrq4OIKiIvz2BgagSfnIGkC4Bxli3uw+4vQF+5N
 fKpy2imxJiVnLnYc+k1nE1MZv8FvfgqO5q8Nq+Xovx8A6hsssYSRa77LP/T+3IoClP/FcTx0VWY
 jiEYPEJGL2BXQKgaYRhQxVWJBh8AC28hKY3EmnCDa0jXSgeHeLpBtSxDWrXWS4SS++Efd3RP1vB
 B8pC/ae/u/AILKnBXYZh9sFeosnYx5VzFNO5QVXuXwbSpScTqUyx2IDWrbMUFsBHuYkk5EqiC88
 vA1uVqKPWotW6zCCEsA==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af5253 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=PhtMypRRY1SmXJO8NnMA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: oqw6D6BpatKrBDZUv9r_HQ7WS6eKJKxa
X-Proofpoint-ORIG-GUID: oqw6D6BpatKrBDZUv9r_HQ7WS6eKJKxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d..0b88b8577bdb 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -48,7 +48,6 @@
 				NGD_INT_RX_MSG_RCVD)
 
 /* Slimbus QMI service */
-#define SLIMBUS_QMI_SVC_ID	0x0301
 #define SLIMBUS_QMI_SVC_V1	1
 #define SLIMBUS_QMI_INS_ID	0
 #define SLIMBUS_QMI_SELECT_INSTANCE_REQ_V01	0x0020
@@ -1408,8 +1407,8 @@ static int qcom_slim_ngd_qmi_svc_event_init(struct qcom_slim_ngd_ctrl *ctrl)
 		return ret;
 	}
 
-	ret = qmi_add_lookup(&qmi->svc_event_hdl, SLIMBUS_QMI_SVC_ID,
-			SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
+	ret = qmi_add_lookup(&qmi->svc_event_hdl, QMI_SERVICE_ID_SLIMBUS,
+			     SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
 	if (ret < 0) {
 		dev_err(ctrl->dev, "qmi_add_lookup failed: %d\n", ret);
 		qmi_handle_release(&qmi->svc_event_hdl);
-- 
2.43.0

