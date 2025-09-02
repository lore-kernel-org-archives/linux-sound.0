Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640EE3054E4
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 14:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821667; cv=none; b=AEI6/CmcDbNjtrfqeraEO7GJFzY83rLdhlUvLl2BiA5RS/QsJ7SAO01dyPke8xe0QEwqr5ztQTY09rPJlnl7d2N1cXwIfC9vuTKVnDJrHBov1PDhKnl9h8O4DKsSObYsO2X2YBatRIAmXqaYwGpixcuGldQ6Xj1F35czX6QU7Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821667; c=relaxed/simple;
	bh=lzi7PjmrbdiTIxDM4q1qCQWpTdwTH0ya6B+wcBwilSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZVd1+HEwWQIWnNOTZor1wNN0ZmOlF7SF2Oin61dQtIe9TdwdNz0557WxiwtRfYu6eU9fLk1cYOOR3M8s8NNp4i7OHbkWPsx3abR8sXDFYygREFDzqrqyUYe4kTlnW1hf7IdcHfZGlkk1AzSWc/39hGnZ2SL4S0eAJc1n/XQijFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nolUCwk5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nolUCwk5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BMtPT020623
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 14:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4elZEAGxUxZ
	vEJD8DID/5RqvZhZy/oGpNYortaWIzhs=; b=nolUCwk5gI840TZbsYE9bsSF2so
	/8qyZgP/r0pDHDc8qE1TamUJx/C6Tin+c578ghNPCzQu5Bpc9sVAs8Az7VSp4AoS
	8pIsV7maTX5gp0lqlcFd9cGqC3qKhtRDgHrWP8jsXWpONMPsGLtKYLj0chIIX+dW
	/2L9VVEQZpfMQJIAVL0ccpzoxUrwUdPtxdEeuet1eUwiUQqwXoQeREzclF0dZEmU
	XKSjUGwXAoVJFRUBH9H2Uw9duEHkKOwv0u1RRTCUmslkHsh5zhlF4GyADB3nwohz
	OkzrGiYcX2iOIivK5rkfDr+dObxP9Ve2k4ufAk+SQ2sJlAWGQfDwATePL7A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s03tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 14:01:05 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-899a854e99aso96613241.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 07:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821664; x=1757426464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4elZEAGxUxZvEJD8DID/5RqvZhZy/oGpNYortaWIzhs=;
        b=iPOwJd4y5zG27/vBlxQsqyuN5kOoHZ/ROsjqz3uVA4Um3DmVWlJ5CYaLQtm7pxAwLs
         9+U185q+oeg35eNxnQPwrjjm5z5SjTNNOdcfjqOfvw+56eCoQqudESvh8iHcsKU1n1n7
         ufo4+2ryW122N1wP4K2bz6su2D/zNycSrpc2vQaCJIgQ2AHgnVf8X0mQGoRW5bONPFUe
         7YrGvnK7ePeYSQOG7Jo9JIZeV5tuLnSWyIjWN6rdDar0vFo5hsDXIys2OHjTYkWZ+GBo
         5kMPr41L6Vj/NeyqHIt/wiQdlMKMFxlaxCaeLju9AND6//MXn4uTP8pQ7ZbYlcnvkMo8
         HlKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDXMy6w8Tb3YpHllS1rVhbkh3yR+i1515uOTYtwA+ouIDr7sTsyarBDOpBTWGcV3E6g9PqOnY7E98+gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ZuKXC4iQjSnW82cqiRkb3wBM9X8VHoQsL/yusBKllqgPwEjM
	lwinwk7V9cOHt/zebW0dkHyW6Hh8nqP/Jv4vv1rZNPVmBKLH4tHZ40IqK0ZFmsDtQkmi3Y8p70M
	douUQOSKOoOeJ24UeHGbJS5LafyHTZe9ualSK+BPHbBS5iTCqVBH7JXL2Tl2vtc9vMA==
X-Gm-Gg: ASbGnctkxxzOLRiJQkaEBIGbbjSz7+YKkdMZC4BTRgL1VN4la+j6R/ZlBktmbaCYNR3
	5vJSH8q+Ul7p538/JiiGNOtRnWUAZYfS31uT6XEpsLcd+1TXtz3CqI226UfVDrYsZ3xyR1gsK6v
	NixRlmIbWUpSKN3jVxa/u9Mw7biJy9OQ4zrJoSd6G1hDlhpUy/qrkGQrSP83UAhldB4vuCRRX+H
	m+uIkeptzK9GAropeoLVCqWjxuhEDv1viDya5q1eoZ9Jv5Q+YW3oWdEaCJfPKnLSmoOiE1Hd72+
	kqOae9+NMIl6gbpv/JrvKCrHDgYndKwbM4ddwbmxU8EGU8csIUwsow==
X-Received: by 2002:a05:6102:685b:b0:530:f657:c1c with SMTP id ada2fe7eead31-530f6665444mr447388137.0.1756821661522;
        Tue, 02 Sep 2025 07:01:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4XanQI+P+HUm3egZOKx9hQOOG0P1c24g9VEwtKc0I4KsM/LPaQOP0PJ6Mb77+ov0hpW2oDg==
X-Received: by 2002:a05:6102:685b:b0:530:f657:c1c with SMTP id ada2fe7eead31-530f6665444mr447186137.0.1756821658795;
        Tue, 02 Sep 2025 07:00:58 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:00:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/6] ASoC: qcom: x1e80100: add compatible for glymur SoC
Date: Tue,  2 Sep 2025 15:00:41 +0100
Message-ID: <20250902140044.54508-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXzhLg70Zq2Wt4
 U8wbh/n6ga+7I3jHHWriqmOMLZbE6qHn/Tmg3CSrvTSUdPRGuAvjiFAEIcnMNJqtxfleV7h8cs9
 jj+Vi3o0rtYZjpO513rCGKRwK47kHPCRIgT2SQ+gardF+uGVuwT+dNessGHmEbK9aYqua4xYp5S
 xYlQ4V91vhouE9JFbu/MTdrpDjrydNMTMUWIOHbl0SwfG1h0EIr76FL5/vajVHoEQO53pSBe7xU
 c+Hj4bzWIBtaao5d0yXPMFYmwJ82uSSiFgHUs0wBVvKtUYXUJPj70dudzEjKzrgB+mGRjS5nYhK
 NfpBOypoMxhngHbFHJOd+ZrUWIx/xvO//zKwH7g/OblRuWvdyjeGDJueeQvaNWknifRZIRR7n5x
 sKT9cmeT
X-Proofpoint-GUID: DVNBaapKtw3Yh9KAymxxBgdk-UVBsLWN
X-Proofpoint-ORIG-GUID: DVNBaapKtw3Yh9KAymxxBgdk-UVBsLWN
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6f8a1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eB2jmeKzBhuYpaM94Z4A:9 a=zgiPjhLxNE0A:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

Add support for glymur SoC based sound card support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 322010d54af6..444f2162889f 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -218,6 +218,7 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_x1e80100_dt_match[] = {
 	{ .compatible = "qcom,x1e80100-sndcard", .data = "x1e80100" },
+	{ .compatible = "qcom,glymur-sndcard", .data = "glymur" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, snd_x1e80100_dt_match);
-- 
2.50.0

