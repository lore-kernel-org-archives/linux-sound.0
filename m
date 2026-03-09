Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E72426D0B
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 23:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097559; cv=none; b=X3Gx10WJZYuLgBwJqe7l61u0f1w28URXDfI3l5hbHcSdpnmpLVQ9oFU2ttiR8ogrKFyl/4je/QEmo/ffinvaaRyEw+MprSrVPmlBWk21PH9P8LnQWtIbLWEdrLmhpGeINn8KcMj3NhbRLcsIyblOTpak2ROUoUE3pptMgCLfJC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097559; c=relaxed/simple;
	bh=gSGrdfWBD1PJQNA8FSE3vNlGaG4+Xx3EyKe0Xq77gxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HaTzfQoCGJJpin0HFlumh6zzXtMBvzX+QPJxX2Rn7VP5Bx6h+S7GekwTFPYrJKQXslzQAOUt2fPx+ejvtu4zCyNs90P13fBxPmCZ8fXahQA4GPKi9oGKwxvP0ZJG+D/o9V17MFyrGyGsxF2O15O4DxCY+3XOlPb5OyI+oIeNSK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifd7yez9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1jsX6D6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifd7yez9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1jsX6D6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBovj1920921
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 23:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xPJuWGqmD+8
	ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=; b=ifd7yez9Im1NWd4QlgNWMkyW57W
	tVINyWDwUayU0ofvyVrNXpJlPZbi5BzPstvukcndCx8+sBUFqHybdIZIswuEEhzK
	zmFpSttCgyQIzDo0Uwgdl/0FaMmmN1EjgnaCA4AQmAxAFh50YkxYu49Gn997mxRc
	S575adbLb8WMzcm90Y2nFu6XMVgbx1fF0IPOGRUXNpT3vplyiumkPNTVWF65gXp6
	n/mkmfTxImEfRtoCU5AyWCa8kx51DE8gFX6qwq2zP0hpXCvTgGH+HKqnmqVBKNzL
	PXY/qaHQigjhC7ZOOOfC0z4CflOArbZEHdbza4Mjlv/EpfwKbVd4mpZCysA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy81uwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 23:05:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd39bso1734171985a.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 16:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097557; x=1773702357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=;
        b=Y1jsX6D6D+gLOgPuFxjayg+3QDScUD1CtS26lwPEkmuoDWRju3/eG+yepQujaaYkbA
         SKahGwmiLonxF2bQ7PATwaJK19e3T+fazzoiRPThmJ0Y+f4cBgSjiTDp1mntehlQskZg
         i06XNupQTr5Jva01NbnYXbkNU1h+tebSH1FAgnf6hB9CdHzgIrz+gBAbE0bpDbcUrhlf
         xcwIblwVrRA6uFthIKoEsI5+NYTpoQ+hZlNliKiPqD2UuADgTRFXFXnAu+vfAjL5Velw
         nFa+bGAHZfybtW20rQbA3b5TKcCe2qzOWsupZ+PS6oHabzqZtPpo+KUZG5yNcxWKH7w5
         iY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097557; x=1773702357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=;
        b=a1oorvFkdT2Ki1yiNfpDBHJPbLnv92dLAfI0QCElG9Rj+6DiIn0siPNKXF+HXafbWQ
         BjKXWdJKw5MOu6gulUhJbONHTxJHsK3tHWNHS50AH1cpHu5OnKpw+6aXMkn34egUQ49R
         xEbDG2/2jTV5epDhbZIYF3mKFodcPQbcN9DviYztlj/kxwHwdU0VcP/PR05LK3zFfwHU
         vg7/dMck1JWZE3zA1wL1AMGH5DmJiKPqb5W5A8YrlO6pSB6cyozF6zo5u98XL4lcAj7T
         U776GJsUTpBvdvS0iZoYIzXg/1E2UtH7vCQ3mIhg4z3FR0/OqP+DQDMkiSaXzF1lRKnB
         HdfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN5BkIrozs5nnOXSheF1IIiRAWcYBiNIggegmPTaPMXyGofq0JZobMm2WWNhNrRChh6GseVN6nRiw9ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvMcl2O4LYxijd/B1TizaC3DbSDeOcWasnaAKr0Mt1kOGh8itq
	tdVsX1y5Do1sTll3tBaq6QLx3svwSEy+B//M7Qp373ZRQSmi3+VqQjq4uVV/SLIbqJAS0Uh3p4Y
	66hEUpR36Yz7D9OpYpx9GYOeNLpHaqZTnKQRQRRWV61u2jR27FL6in//mzi3qWj4X6A==
X-Gm-Gg: ATEYQzzbG0pSlMArv11oQsFNsU95umpQ/h0bMiBPEZSt/fWhwZZprsbvSMZjAvcvyS2
	agAoLBg7xDNA0rPAljb9d7GHi0IG9wABdCHzfRzFd1REMtMXsTce8S0o5DQiawFYVoBXjNZdCiY
	Nh1t/aFcJwwrk7z16L3k+CNCrbnBcNB8hcM2A0VDzyiTJdI4+jfklLLP5rVbGPVmSJ1dQNIrXZG
	G65+4xE1wm64u1aiMbkKjxe88hxL768fABBP1WH5X6pxInyvCXER1OtQuAUEJLXhDKzvkjxwbR0
	JRXxIHH/xLft0LIe2qdjqP0+WtrR4SKbgosmteOGKdLl0s7cXyeuCC2mwqJe3QNtTSWg5edAubF
	50Erb858+UjfGXhMtWC5EZMXPa46XeUkABcq1m1ssZFS0DheM1A==
X-Received: by 2002:a05:620a:444d:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cd87512fcfmr673413285a.58.1773097556792;
        Mon, 09 Mar 2026 16:05:56 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cd87512fcfmr673408485a.58.1773097555998;
        Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
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
Subject: [PATCH v1 6/8] soc: qcom: pdr: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:35 +0100
Message-ID: <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af5255 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=P-X4VuwvMnWJEdMca_IA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BrtnjlEqFHfsCHG_URiZu1yQLoAtxQ-M
X-Proofpoint-ORIG-GUID: BrtnjlEqFHfsCHG_URiZu1yQLoAtxQ-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX82R6iBsJDVgg
 dfhJdmeIWmAvRIkKE9iJrpq8HIYiiDOOvlQrg/BvMn60a5q2mai0b7JxpAxMEdC7HpX1S9PVD+7
 Pf+GYPje1A7LhfvwI5qUNU/9kORVPHqUvyBt0kCr/j0RpEN4hLbFDrUWaqKhnjTkctmSiAIkq/O
 laYeHD0K1KIZMGybFh7uOm6y//w6XONJLOU8JqMEBNvd9yYV21WWeBh+4Sj6fdzBn4uCrdd2H3m
 hheSpDZG1AAFTXVYkBqFFffLVOAZfFGkkfI3+qPCLoU0o/Qz4NuhvCEem5VI2FkkBQhHqHPR9BR
 h3f8M+wCm7TEjRjRCIUixnZvIUZx6gy2wuoMhBgbZmrPaY7aMY/dr/Cyuakv7CPHjKSn3vz8kKr
 XuhWLB8QoYs+mfI7GJlcJh/RlBmDwpcJOtpINKvw4UWtbdyPux6TxOPJhhzEUmIEkfssmjGiGCV
 hi+/2X8F9HWRT4y2luQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/soc/qcom/pdr_interface.c  | 4 ++--
 drivers/soc/qcom/pdr_internal.h   | 3 ---
 drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 72259f489075..6d879e1540b0 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -523,7 +523,7 @@ struct pdr_service *pdr_add_lookup(struct pdr_handle *pdr,
 	if (!pds)
 		return ERR_PTR(-ENOMEM);
 
-	pds->service = SERVREG_NOTIFIER_SERVICE;
+	pds->service = QMI_SERVICE_ID_SERVREG_NOTIF;
 	strscpy(pds->service_name, service_name, sizeof(pds->service_name));
 	strscpy(pds->service_path, service_path, sizeof(pds->service_path));
 	pds->need_locator_lookup = true;
@@ -678,7 +678,7 @@ struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
 	if (ret < 0)
 		goto destroy_indack;
 
-	ret = qmi_add_lookup(&pdr->locator_hdl, SERVREG_LOCATOR_SERVICE, 1, 1);
+	ret = qmi_add_lookup(&pdr->locator_hdl, QMI_SERVICE_ID_SERVREG_LOC, 1, 1);
 	if (ret < 0)
 		goto release_qmi_handle;
 
diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 039508c1bbf7..6cd8cbe26822 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -4,9 +4,6 @@
 
 #include <linux/soc/qcom/pdr.h>
 
-#define SERVREG_LOCATOR_SERVICE				0x40
-#define SERVREG_NOTIFIER_SERVICE			0x42
-
 #define SERVREG_REGISTER_LISTENER_REQ			0x20
 #define SERVREG_GET_DOMAIN_LIST_REQ			0x21
 #define SERVREG_STATE_UPDATED_IND_ID			0x22
diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index dc10bc859ff4..bb60b5c40554 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -656,7 +656,7 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
 			goto err_stop;
 	}
 
-	ret = qmi_add_server(&data->handle, SERVREG_LOCATOR_SERVICE,
+	ret = qmi_add_server(&data->handle, QMI_SERVICE_ID_SERVREG_LOC,
 			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
 	if (ret) {
 		pr_err("PDM: error adding server %d\n", ret);
-- 
2.43.0

