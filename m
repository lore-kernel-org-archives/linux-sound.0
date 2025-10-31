Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D516C34A788
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912468; cv=none; b=hbTKpSI79pz2EmHX6dbPkKGVfaWcsvPhazBUuiNjddH4tjly5uhyLilg1u12lMTpuGSe5NRt2RdsTmd492DstGgPkA8XIaeg7nyVHGulZqjm58QgBorvUaURqfuMl3Suka5fmStDBRPSh+uifJeFWbLMCVCtrQ7Q5qLyg1y2Al0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912468; c=relaxed/simple;
	bh=6qhZ2V7jPWMlO09vJWcPidbXDMoiF5TkOHsCoJUNPBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcV8f492irtZHlR0aO09++TO1n19fcfhwEgSPe7H9VCWL4GIQ/uZ6AurzturWNaADE08rxDMjPen63QwQoyQgZaku2Fd+9nSRy//FmKZFnneWJ+OMDfPSTgBZAoLMet294demAJ00MapdyduORmzTHj9daKyZ9Y5uLAw19aR3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEd7prre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LG8c45lq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEd7prre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LG8c45lq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9pl7Z1416929
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j3qsn+XRU24
	M9cd/quCxFZxsbCcNEdloWtUmT5MmDVU=; b=FEd7prrestWyoKETHQBoerJc837
	SIWTZf41NK7n0JLuilnqqyhde9T2dgRnxQN11rk/GHucwnAvWxXkokIy2T9FlX//
	ttevhlR0MyBS5px6ojw8Gz7l+S/Gee/aNpep9DqDuFZFyCIHF630x1Y4sjnOFgjL
	vtsXq+Pe1wHgBr9CB+pMgtrvA3pwxgjP0Vh7IDfofmP6L5pct2XyT2d/SqPlJQHf
	CZdT3bvnyQXpdsPx8xgQ5U1FNHGaY/JCN7s+arDl7Ay28bRlvmr9GlJ7A1vBdeyS
	PDipplnPvKIFlCWCERinjqq1z/I1vHJYE9VJAS7YNMuGMUdU3oZpFMFd50g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69hnbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8984d8833so96452751cf.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 05:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761912465; x=1762517265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3qsn+XRU24M9cd/quCxFZxsbCcNEdloWtUmT5MmDVU=;
        b=LG8c45lqnz8qX0p52rX703EjrBUqIFhlcn0IiU/kxbPO6lvL+bRkzHQx2QG08r5yfj
         rDglBx158GTpCjPStHwJ8wo740iZtI2PW1I7K+1fkfHYT2xLw7fl1Gpzz7dHHWGxBo5Y
         siMovyKowc7jjy6X8PHrVm30RfqI7YlBZpNziTyoelh07Y4GTjg+rMwes8mKv1ORVB8B
         npYQLLU35fV8uuzumOkiZOg3nVn9mD8J6s2o0Mil77qSNZ+Sz1EshJAVBgffZVTI+SZb
         X7VmLOjdg7BuU58BrpMzWFK6r14HLprj9qfqAu3gVdD2gIpkETYrHxl4ziDqyKJfIc42
         40aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912465; x=1762517265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3qsn+XRU24M9cd/quCxFZxsbCcNEdloWtUmT5MmDVU=;
        b=i/4nsU50aiCPTORr0GwIAkceKpi9kqb76mFr9/4g2sN466W1UFriwdZEGvni5DrvHP
         7UPx9QKndvXBaajn6xO8ux6BluKiDbyEO+op8RNp4bruaS6brmy2bsW8HrxpZXvs6DmX
         CD9BjUJG4jRS+JOS9iffC+4LeLMBxTfY6blFUvyuAB9UFPEXos8myERji+32Lr78prQE
         lgGEuijixctQF76KOgn04AKSEYJWi4JLoPhYTE2iqTiomCZ80xYSrWPVggzowBKZKDss
         O/ws3BNPSOh7jYopiAjCk617GY9aMea+im/dp3E3dQBdIQiOMB9ilDjPcn0AQd5ShI/j
         lMjw==
X-Forwarded-Encrypted: i=1; AJvYcCXUCcRrWRHaSNbnDQ8Mqm1Qij/HK2nCLuf2vVrAD8Ec5ge35wZvgC81uB6s9AvKLVw+e7XXAaooJYRkjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4feQNhL+C2b1cI0fsXMbbQqXLQBdE8GCHyQdjC7aI/xfHA26G
	qa0I2V4C+xsU/OIYj9KjtWKJm7kD96AVSPpy6x9P6BljSXOMdbyuDgjqtULWCvlB1DTnZBa4g1l
	M5fR2lAGRHo8oSAkBzmzPu+hZmOL8+9b6NIJ6Uw8xBO0ooXWoXA0O+raVCZ+Fb6i0Cw==
X-Gm-Gg: ASbGncvwUEnEnx699uU7tPM5wRIyz7g7M1jV7oQjhTmHEty0Pr4gs+PjckGABpA2hSd
	tANoN4ni7u9Oicvlk5EKM1p7qjqUwtowQrKPOEAXmj41ZfjsCWJXpXns0+117Jaz0WKo94p/Yvg
	Pzi/ZpCp19Pcb7uCuDhT/4mAI9QXqqApI41VO63do1yVc4iMMNO9qYJ+YeVMgUPR3nr13W6y8R7
	dWnougqsVy6WQVpjfLoimA27MJKFKCLmQso10jV7MixsfQQ0pXR4HFphra0AfLTrlK0txr38Oel
	DRF2IVYkgaF5pvXLK/Cfefn75bA9LnLjpXpeI9QYLLfTV46lji00Hy8LvCu5XfcrE/keisOULjH
	lf9yodLkcsi8X
X-Received: by 2002:a05:622a:180b:b0:4e7:216e:1fcd with SMTP id d75a77b69052e-4ed30fb9efbmr34589871cf.54.1761912465229;
        Fri, 31 Oct 2025 05:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJClcu9eyN2QYo/qOUiQu7qbIyULvLlv12XdHaf3aRKwPnIwV9Hf8bBaGrhHr/S2hRkb5EXg==
X-Received: by 2002:a05:622a:180b:b0:4e7:216e:1fcd with SMTP id d75a77b69052e-4ed30fb9efbmr34589321cf.54.1761912464767;
        Fri, 31 Oct 2025 05:07:44 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fd280fbsm21273995e9.5.2025.10.31.05.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:07:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 6/6] ASoC: codecs: lpass-rx-macro: add SM6115 compatible
Date: Fri, 31 Oct 2025 12:07:03 +0000
Message-ID: <20251031120703.590201-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwOCBTYWx0ZWRfX1xbvC0vK7IRX
 l+avi/ZTUwFcr7LzANykcY+JsBuxe4UvPqY/St2uL1Gk7Lyl2aaR1tgyiWAwF+bD3dndoEBDJoF
 K7oUfHP7cOkYIqnLpsU02nYMEWWDXfFaPViNeMO95/rlu+umYyKY6VsokpXuMVF4QZ86CYG5Vqe
 sine4//uK6iRzXgHaJnD68IfVd/JAXX/7c/nPByIq52vXYJhd+zTE+tc3cYi5obGZxDS2odL52H
 yx7Gg4BYNabRuPXU6eIZklUDoTbFbruIuIvSMxFceyqTxuspaRMXjWCIY+Moq0MNcd3BZusXAPv
 fdl5pWyQeL39xD31E19NBldAky0R/mERxpQj96+ze5s7lXVIGUskV71aogDp1l5eWcOVQlX2bT0
 +34TuKT8QW3DTI72CIuMleNDF244Qw==
X-Authority-Analysis: v=2.4 cv=Bv2QAIX5 c=1 sm=1 tr=0 ts=6904a691 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MaTAXlxkpdZwQv4a-28A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: an02cQDpI8b9nKWIb235-QxIjEFiOEpx
X-Proofpoint-ORIG-GUID: an02cQDpI8b9nKWIb235-QxIjEFiOEpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310108

SM6115 does not have "macro" clock, so its bindings differ with existing
SoC support in rx-macro. So add dedicated compatible in both driver and
dt-bindings to be able to address that difference.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 9053c93bd44c..f889fd17f166 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3951,6 +3951,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
 		.compatible = "qcom,sc7280-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 
+	}, {
+		.compatible = "qcom,sm6115-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8250-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
-- 
2.51.0

