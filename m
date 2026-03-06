Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029E7364EA9
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799736; cv=none; b=EBLPJZcZ2cNok8VoahnX+YZoBTM6n34v5lXmjGZzp7h868POP4gvquY1Lk+MeFfxSY13JKizNg2GroSJ6cC5NDuLbbFDC97OtKmAdL7tJIoeUX37RV79VZXmmLMAN8GoO1d6N3qdta6UhzxlhKFyO7fslOM4NzSnJfWhTIAXvJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799736; c=relaxed/simple;
	bh=VGST5Brah17d1wPyKLpwY5Hj5+A6sMXNTyNGXYgoTDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSrQV+8318HmbwTlcl8wvzkzYb7Sy9HKmWHbZvJPVXsfNbzQdaQshLSodtrjteX9yl3ChXzpugJLY/wJX2WtLgaXibUhAGxyUJdop5PCwjRs29RQxrm7ALX0YqkqvG6cZuEo7E9rm9x33s1CF7sHnAZOBxj7nBpL9UI2+WNp5nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQyxH/pI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmKXA0QL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQyxH/pI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmKXA0QL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbHfn4151025
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 12:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=118jvOZ59eK
	ci70KA7rIqIZSiuUuG3oFP4GJ6waca7I=; b=IQyxH/pIW1cMfvWxfjrN7eWq2PO
	hcOCVBVsuuC0MpgHr8qXaxzpewGxWebP26xtVZlkRwKM2Bh+GY0TkmpLkKU1VhwY
	mILJBqtwkEUruoji84BycgI+Xm/09KO/VxnYqfcFWHJASdGGq3G4PFmfjXW6ZKjH
	K65feqeNPYrXuBMP8EBVTeE406NZQjU0pWVAQfvvFmNpSgMNh/Vt/+IKqs+Rkcbp
	CNAV9V206ePC4YOVvcg+h6pyNnhwPOS8o09bwQmAZnkIb1HODdGiMQByayLThXVJ
	UR/+kX25r+ub1NlzJJ2W8Veo0L2Mq6C8s2NM+faTdN85KdGriW1OXzKlrmA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25u4em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 12:22:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so4839235285a.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 04:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799728; x=1773404528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=118jvOZ59eKci70KA7rIqIZSiuUuG3oFP4GJ6waca7I=;
        b=UmKXA0QL1YOx5PtCLb29JW5skfLlcP4eoT1zdYulG2dxzUeg1cBvNpTGTae/PwP3yC
         CpvEwjW//KfNjFAloDB3PvXsrIlqs8BT7HUjf6KYM4pMlzQRmrmw/+ntUacgTjT9raxz
         fDYlQXlj1BF5IfY+FoI9oBEs0uBthL887nGW1H8lg7ISgqfQtf87izbCEOjCIbu5N/to
         bI4yJhXrUC6TAndWCjFg0xZzyEsYAKel8AfEeVruAk3NUihgLm+uw+Nuy9M6PZc0qG+O
         bAqAzz+zFJHTD3D20L4ERmBRaY+3Bd7NQje44VvbEw43B4jV2lUDdVNj/ZG+S8vUL+rJ
         EgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799728; x=1773404528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=118jvOZ59eKci70KA7rIqIZSiuUuG3oFP4GJ6waca7I=;
        b=XU5UAGuI86DyXjb5ZLbaHDM0psz+TAC7uBlnwlyjbJPXMQelKZjKm66GkXvcmEwgH1
         1vxVwXgs0nzoT1n7qIeVErDlGOb4LNeKriw2bFZ+/Hq3xM2BgTPd/5d4jocTpTIYoa6D
         bEhHwrK21Yw6JbfPc7gky8qVf6ctxX0J6XgM1sY8QxFbr6yhgkywDengRrwZEaTLPRo1
         PW6NoDMkBu9+1Waexo4kyVKcIsDGIgbLZwfbCj0rBvhWi6UGMRCpIxO0DWscEUDj1DS3
         92jyyz4W7qDMRp3pzkvrHQmNgNHJIZCJoz1oirIUamxHiMMvIqEKdSYhdWoJDZ3P5GPT
         m3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5K0LrxXO/x4dDP8jXlFs7MT/TWFZ7J07FZxw5Skb5/tkXUGjyMlFHguaXuOOluzQDLHJKi4ElmqTkaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIjpUKLSV3XVgA92Mgz2CqI/jhqflDaj/9lPt4n91009H5ObAc
	Lbnp1vvQo59n6ApDnLCo5rN4XYkPUWLyn/ciabnvX51xCpf9ZRAqYf4T6eJka4QP9nVVEzti1pW
	Via8zuE8CBqed6XjWWb9zhK/F84ihYYtZGXZQGLZeYQtbh/C9FhgI0P+8781m0cmisg==
X-Gm-Gg: ATEYQzxZE1yocTrbSRuRfl4eGrKE1qFXoIi4OTnhNEfPz+UUdwpwzQU0wJQqN+nwCqv
	2qJARqxgaMST7GzQvBTNKlyfmrmy/wCPswisUisN+27nyeQ1zvcif4QISNTaBvcxWBucrieCEXO
	yfmCyDPvrzcA+ZAk44q4GQbHTNYwTbx1vo5oxUaRlHyz/eek5XGQZihWdnjGvwNH0ytEAajOnkU
	BOO32/YhRLn/ZY4e/E56NRNP6foY0T9NTqMlLUqMIZ56Fssn8OPpZ49b0IRWyZ6TnxS6oKv9tEi
	zQaNBPxzl6Wki6Vc9q7sii5HrIc5FlTs/agiyIoyGo6Htjuc/uw/TJysbawWsuv8WP9bRkUfMwT
	OEixLNv3y6FjXVIbdB+0ZHuW0FpKuNb5FFzm5J8BL7BTksqOH4R5udOA=
X-Received: by 2002:a05:620a:468a:b0:8c9:e98a:d9f1 with SMTP id af79cd13be357-8cd6d37173cmr229474485a.30.1772799727909;
        Fri, 06 Mar 2026 04:22:07 -0800 (PST)
X-Received: by 2002:a05:620a:468a:b0:8c9:e98a:d9f1 with SMTP id af79cd13be357-8cd6d37173cmr229470285a.30.1772799727469;
        Fri, 06 Mar 2026 04:22:07 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:06 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Fri,  6 Mar 2026 12:21:08 +0000
Message-ID: <20260306122115.509705-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pihxgnqP21TaVW9K1z_xn7X3bc6x9ZvL
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aac6f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6P8UuP444nAwg2htitIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX3glwjxAyHNrs
 SSMPKCeiFfQNLKpUthXPL9umtLDqnisaVqCgA90CkvzBviT8kiXO5O+AD/XFmyq9UQUe9nNgc3+
 AAHqRxflfvMJ7IQqpBazAFYUgrswQp6RaVyteE7Yzfgi/zlxJsdLVOe/4KxAO70xeRN0aRZdYau
 I+amfXd7AaESSHzX16TyibmYzyr8p8VgQ4uadPNaB0bcEwQANtylHl8jK19k+dK0FsjrBFx1PF1
 7aoZbwD1coO+nm7YpYfzJ9snCtMMHKGS2T7unkueEWzj48EyPxsH5atgM2Uec40naKc6jt3Xci4
 jHWB4H9r+7rwStm6f6DEIQsShwLIjz2VLfcQ+tS5BtBYczUazmrHBcf62vRw+MBHVV8qpYCVkJF
 txHEbj2qjER7CPhu/P9JmanDsxoYUoCZupJ85rB6FZ3WYGY9seGHutw7PoTIaGK058fPSYWLOly
 HrWnLr+3b7tQFJHqMsw==
X-Proofpoint-GUID: pihxgnqP21TaVW9K1z_xn7X3bc6x9ZvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117

Add new dai ids entries for LPASS LPI MI2S and SENARY MI2S audio lines.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml       |  5 ++++-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h   | 12 ++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 08c618e7e428..2b27d6c8f58f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -126,13 +126,16 @@ patternProperties:
             reg:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
-                # QUINARY_MI2S_RX - QUINARY_MI2S_TX
+                # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
+                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
                       maximum: 23
                     - minimum: 127
                       maximum: 128
+                    - minimum: 137
+                      maximum: 148
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..45850f2d4342 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,18 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define LPI_MI2S_RX_0		137
+#define LPI_MI2S_TX_0		138
+#define LPI_MI2S_RX_1		139
+#define LPI_MI2S_TX_1		140
+#define LPI_MI2S_RX_2		141
+#define LPI_MI2S_TX_2		142
+#define LPI_MI2S_RX_3		143
+#define LPI_MI2S_TX_3		144
+#define LPI_MI2S_RX_4		145
+#define LPI_MI2S_TX_4		146
+#define SENARY_MI2S_RX		147
+#define SENARY_MI2S_TX		148
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3

