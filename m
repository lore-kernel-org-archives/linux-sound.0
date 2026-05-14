Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0542F069D
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773872; cv=none; b=pBu+uiuCrzFaSB/gbtHZVf81CglySFM0f3j7D0a2mtrXzWLdpn4RdjH0O1hDENbfjzAOB8YjlbqLK6jmWYYCK7aa0LNtPIVZhQMooV0HBx/aNEiWC1LU843uy0ruYQUuGgOp+has9u+Ypxeph3tn7OhO6Y9Up6otP2kQUhFPgr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773872; c=relaxed/simple;
	bh=8MEl+BgGkiaZBwbz6FvWwT8L3rP9aORLehU5yrQrfCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBsHp8PrjEVDzhllyMm5APNA3z8GXLH3UvI3dtCRlN3WmypCVHyaviJBiKyGB2BNPi+JOL6kQYu3m7W2ZD90tyzukviA3SXnv38wHn6hz/Oj9Ls4tLn6+UlofMemNYiDYxKC+yG4w5ehbyceg576egaQbvjmzubCB28cMFzqo1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQKXIe/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdrm9DTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQKXIe/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdrm9DTt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeQZn3951585
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kp+b1sDmdyU
	7/z1soTFzi5u3lYlucYrQChAjmvIDfQI=; b=GQKXIe/I3Za95Z0qTsXBMembtZj
	nw5pKpCq/KGNVkfCuNOKA/17oElGpTuKE5WJr9xZ5Lun4OIUwgRpfxr8pySLAbv0
	S/9bLTHWh5X9uXTuLJ5zJI/MGep2WlgQ5Pk83NOHmkDV8aGf4WxMwS9oUdutCSK8
	lwBhCzD4fe7n5vV4iEmljHBDJwegv5nHmTHe4YE0YCnB3e7tcoeT70Zd7SKFOL/q
	9tv+A/WKwU9G47qYjYXC55fJFFJbIMNC4ElLCQwS0EezSDX+DPXd7jd7ROo9Z6lj
	JWXPAhnsxEO/f9QKpjoiwo9GwrcWOuiNITytDWBd1J6euPQBlF7MzEXDNEQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57kst9ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:51:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cfe3d4c16so12412105241.3
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778773863; x=1779378663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kp+b1sDmdyU7/z1soTFzi5u3lYlucYrQChAjmvIDfQI=;
        b=kdrm9DTt+MT00P5htNXy1L/aV0QgkAYgUQIz3DCQXO+abv83iEn1lSjq7eX0qEXvnj
         KtOuzKV8dWe9zyBCnkdjtTHn3LR/2Mib0VxqXkvnuPp24lLMyCVKDuKWyq4hZU8RI+Rk
         MqH7gf3vHsVXv0HseqzkNd22w7QMM8sQ8Jnwr7k+iFBvmQN3nbHEzH1n+qeXp0V84j29
         4fMVXxZd/S6ucvf+2YgyYeXXZ2ta7fbAq03CQhj/m04dUev3147WhoUkY7bUk+q9viue
         Qprbt8E5yzEkyByeHTnuXRfgjadZ34WCFjJPTgb+zDuTKxxz44Ojd8riocdNVtpjI3TC
         ErhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778773863; x=1779378663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kp+b1sDmdyU7/z1soTFzi5u3lYlucYrQChAjmvIDfQI=;
        b=jXt1GYgfTZA39VN0ten/tBT+hIs2UfOmN6l3TuqbFnQt7xufYTBelFnFx4Any7ao5v
         QwPg9otyymMyEsFmrWwtioap+wHLd2Rum8SMeEp8BSmECZX8w2m6QimvrMKIY+XDaRu6
         QWAn1hXflCjSlceJ2J1KumEBxgyizhImdtmorIG2+5u2gSSD1VbgQnFtbVF/FiW50/Ax
         6R6mg9ymwPFmZXiZfuS6TWVcBwOUyUiVKEim5+6enwBLeArhWGNWNmxyO3DGc2qHZVnu
         EpJE7J9KULXy4uZF8iUrirS5Y/UPXqaW/ovFPxg95DLumTkV3mRwnBPf451r1qkUFM3C
         RrIg==
X-Forwarded-Encrypted: i=1; AFNElJ/rCw3Bm2yYevZIGV2uueY9SiQ1NzF2UReuZeziKJCbywcN1YQfYSpO7hGw3ITDbGRyRuldHAM5m1gYAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRNuPcSIprsb4q8rB5/XjQE1BmPQtE22Zy1s0AREUDfGvchjn6
	xIfjHaK4IS3uqfWkXB5CHLY2xwB1YRGwp4Tg9eXWQHcm52IbkSewDEhaZkVUWORj2lpad5Lknif
	crRbqdgOIo12wFbEl+MtzC1urkfI73X91+1OmfSnyrgomNG95fXKYRxP5BBJAJkR9cQ==
X-Gm-Gg: Acq92OGKwgn6jv1svuUEPmayAU8trAH8BNCf2G4tRBynqot+qwJIqaWoCRIG9yoecdV
	4LlpIidzpw0k8FwyrBcq3JG6yGxi1LrdFFV9BGKd65YuSxl1Ue0QfyZNyjflsVgkVQkt+krL3s4
	pdmICt82JwaSKNS5J1exNMoMjFHdT9R7yH98km1MJErYWjOL05F6Tf1ncVrmERJElFRaYZqUSR3
	rp8L511gqyhxtR144JjDHFW/CCQtohH78rcoUBKbJ2wST3YrrKBgIkoDiWbunnkollJ68mmkwko
	tvL4qgKixT2KoRQ1LqcWlmuIFfhH1zMg4/V4acFWYfOfM4+5oEyaPVdB3LqUBx4Q0+avvdPHs4P
	pcTQofxA4SyYNtGgkmO8AxsHwhi9M9AXDG5QmgmCQUPHppY9yqttb3QE=
X-Received: by 2002:a05:6102:32cb:b0:631:44d9:2ca2 with SMTP id ada2fe7eead31-63776780cb8mr5037606137.30.1778773862983;
        Thu, 14 May 2026 08:51:02 -0700 (PDT)
X-Received: by 2002:a05:6102:32cb:b0:631:44d9:2ca2 with SMTP id ada2fe7eead31-63776780cb8mr5037585137.30.1778773862563;
        Thu, 14 May 2026 08:51:02 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm6967067f8f.36.2026.05.14.08.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:51:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/3] soc: qcom: apr: Check response packet length by router type
Date: Thu, 14 May 2026 15:50:50 +0000
Message-ID: <20260514155051.2593354-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IBu-4cUMcbyGqMuwIbbpPrDER9lePa4x
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a05ef67 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=DocHB_6yuvdUiAEOOo8A:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE2MCBTYWx0ZWRfXzHksWO64h4CB
 xtXCGFPCTstMKpl8xTroVBmD0i6IexYP8WVUG5r8zqUbDMk4PAmC4Rfqbe4nA7teu+M8Y+OVh9P
 QRE5twlx1/js6k9NjOM0ePxwosQu4ZS6OqKLhfsQbu3KK2sR2lQ6YOiv4Wy1vles7qgotCrK5sC
 afwBC62eWANTMW4WESokyZX12/s8/MJSTH9hxd78KtRRKGFoxvEIyem9FgIDIv9ILNGLwto9Xt5
 HhPLOf+H4M0YKogcPiTH4nlOxFLTY8u1U2SQgiqym4IzfSCf/9iZFpU2FGLlCYNh3w4CBb0MRYL
 zWssZ+JtC7RzV7YTrr04GfbjFDczCfU1pkKHziVtDmIB9g1Sbgl/1tG1NelGqBei9xDFuMX0UCm
 pcFYSw2HdKBecXaZkm5W4ZP5kyHdafeMTE+guFM5BBVIB7rLy+eLK0NxhmEkTWrBqp901/b2F7f
 eokV7KUlSEMtqprezrQ==
X-Proofpoint-ORIG-GUID: IBu-4cUMcbyGqMuwIbbpPrDER9lePa4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140160

apr_callback() currently validates all received packets against
APR_HDR_SIZE before queueing them for the RX worker. This is not correct
for GPR packets, which use a different header size.

Validate the received packet length against the header size matching the
packet router type before copying the packet.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soc/qcom/apr.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 127204c195ea..68b357462438 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -165,9 +165,20 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
 	struct apr_rx_buf *abuf;
 	unsigned long flags;
 
-	if (len <= APR_HDR_SIZE) {
-		dev_err(apr->dev, "APR: Improper apr pkt received:%p %d\n",
-			buf, len);
+	switch (apr->type) {
+	case PR_TYPE_APR:
+		if (len <= APR_HDR_SIZE) {
+			dev_err(apr->dev, "APR: Improper apr pkt received:%p %d\n", buf, len);
+			return -EINVAL;
+		}
+		break;
+	case PR_TYPE_GPR:
+		if (len <= GPR_HDR_SIZE) {
+			dev_err(apr->dev, "APR: Improper gpr pkt received:%p %d\n", buf, len);
+			return -EINVAL;
+		}
+		break;
+	default:
 		return -EINVAL;
 	}
 
-- 
2.47.3

