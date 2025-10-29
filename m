Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA7D302161
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749214; cv=none; b=uKMU4r1+yG5GLoa5EICwzUWOX6/ef1Pegz4VjvkNs+RAaRuiRPMDrg5c02sFgg9oeapdA2rpwO7XGRiqa/fKH/w6xBW+ZcjlI70ikaA4jmSJnzsBWqDtkSuHH4Fky+hW+EJXeeUvcz3zk12NsyjxVjweT+fX6aEQrOd8LBGFq8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749214; c=relaxed/simple;
	bh=WlLMZwo0H4Ep9SK9cIL4i/qaXEGNycF3lxaPWFNBL/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q8Uy7V3y7HEPqko8BhvamvRXrwtfb7T9CEm9V80Jouk283nvdwmHMf45IdRsAxxkipOV+8SIPu5mD+4tQPDt9LtQK7taIyPzErgFvI25Q+/cyQ4Mq2Lu+8HHZnp3gRaP7qf00L6r/GgZgqkY1WnvlYzXjwXLGlKqU9isXeidgCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrHSavp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Km42uYIh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrHSavp/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Km42uYIh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TBvFk53676848
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 14:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3VQByPyxhbQga8wEr4/BN3Sn+0fDUaknqZU
	S5siW03Q=; b=WrHSavp/1SNze8CpBfqeOmlH3QWMaVVrl+7Nx6bSc70s8EZ7CJO
	AlxJ8sUtKvserq6JFA7HqErfhMbdZJhYgnoBjN1ipHlHD/THcG9Lpi9WbzomEdz1
	I8RL8zyFKl8dDdevs+IBsWmylI9aG57h/+mxtRo6d6kZ9olfJeFBLZWi5azLTqtd
	b3hwm+vAPw6K5cAbjKTi6H0u0m/KUg3HN8byDv6XnaLk31zLx6lmu8MOGSfMbPyS
	Ihi+gwhwHqowjofIKo1ymKzo3xsxkHyzKCcVIAt4KnW8MFtDzf0oVC7rWMAlrP+6
	2G6cywUi56DSEKmqTTZsmmf0o2Ss8ZGcFaw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1jwup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 14:46:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-880047f8636so43435276d6.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761749211; x=1762354011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VQByPyxhbQga8wEr4/BN3Sn+0fDUaknqZUS5siW03Q=;
        b=Km42uYIhCt6crVJbqvZUFh48lJ0/BkYL1rui7XQ7XcZeuSD6l+6pj8j+0UWcoUrTOp
         3FbZRgBLcZtVaVXLtXC4l0dLlMRunut2CSgVPSHt5G1WVkTjyr+B8+Vg/wGrOt8Yxhsv
         zhZxHHgHx11ZWfDYZMngmF5ce4ZxnNGMXpqFqKjOe0Z3Fkb0a9AdrZeG2ABCzX/qNQtM
         FLsDebHYELz2Q4bsNlQi1uWeqH/Qf/i6sInRAAwUiqCXELFOBOrk2BZoeBmlFVucmMWu
         BEJrwOTz5nT52BPkJuF8w2U15dHmCQG0qo9zugR91CIiX2n36WUkW3fdND6lbjAsErBk
         IRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749211; x=1762354011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VQByPyxhbQga8wEr4/BN3Sn+0fDUaknqZUS5siW03Q=;
        b=Cx39Ivq+oY2q3N1p/+wWmLaQHpPYaGGN72RGCILQAfp7GniFlAQJyixAyXjSnVPIFA
         KA5pygZr4xHYv/CX3oPWfLWZo1DLssr3GG/S5GnSSaf9Hj4ovkXYxr/gsW2aqB8xc1xZ
         q8ZPiaERf1p401pLJVBxwNSEd5Ue8KIYlqCsgVsvSqCZWzVMMyw99TBl97mq8MDVA1sh
         tdkMtpftxTS84k6PxdknWF4R3kmT+cskIU93HAx14dwcNNO5aJvpLxylyVzmTgIivq6Z
         324/clRd5w88DgnMZ6mgD9mm2bGJN7qm295FrmtD6WuYlxMYbdymnm/kTayv3+txXQt4
         ZdaA==
X-Forwarded-Encrypted: i=1; AJvYcCVzeQ/CrfGnrxNVvZ4ex8L3O8IzIQDXdLciFpl/X16QFaz5ILhpBdkrVZ4PL5teiHuJUz6GPi7wHV0tTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwnWrcm/6NpOuPLAt7w/XbRE8ZMmx2d+sOo/fi981Ypy4N9Aii
	BgY943nhMFmKmx+u5XNQrWpKFEbwEhm+WwxDHj9j09HWMDylLFLO0qsDgJp05QRB2PcXaBw11bR
	TTUv3qulD4Co6WatyflRBqN6ua2istb/wBPREq7hZp+Ww5c56rOIAZ3HTkJU5sHfq4A==
X-Gm-Gg: ASbGncvU1c0qyzsNgiLf1/DOmQjhh4aUhPSPlkyyVOxzvso6XjzhzU/wcsCqK32hqXj
	D0+V06cEfFYYy+1f+VhmOmahX9HGRJedFzSOEG3Imv0PcHNKOllLA3pVRMFcQCRGBR91oFHAbu3
	tbGECJz5NQtgMxdurzuK60eeYGc6tDJlj/hph1oqadvJY1hBhFEywWIM2uHwtfDfQ/W9FEv5imU
	Xbem5RZjV+r/16dusjUwmDtFSZmpVKX6LQSX7fE43dcS6vfEPCaf6Er5rkfBxq9FhHoZJt7ntSo
	IXCyoVSt6NXLFZMKuzAUm3y2wvIYzeSy/NcnVSJhysd2VbFUfIbRePeQmaNIghIEW+IGQxdRO/b
	AJMjkMtG1a0El
X-Received: by 2002:a05:622a:8354:b0:4ec:f07c:3e85 with SMTP id d75a77b69052e-4ed1e4dde2fmr11330941cf.43.1761749210786;
        Wed, 29 Oct 2025 07:46:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXErexYyuFdz0AmKoKmT2JVIOCX89erGQ023chN47ZncI2gn9SrZMs/CXgh80y8c6IyjAKUA==
X-Received: by 2002:a05:622a:8354:b0:4ec:f07c:3e85 with SMTP id d75a77b69052e-4ed1e4dde2fmr11330681cf.43.1761749210348;
        Wed, 29 Oct 2025 07:46:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e18bd9dsm51573075e9.3.2025.10.29.07.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:46:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] ASoC: dt-bindings: pm4125-sdw: correct number of soundwire ports
Date: Wed, 29 Oct 2025 14:46:36 +0000
Message-ID: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=690228db cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sX3_Zgyp12BJ_7Xf3x0A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: LzVm6ysSTd06i6n63Ns3heIZtinEK3iL
X-Proofpoint-ORIG-GUID: LzVm6ysSTd06i6n63Ns3heIZtinEK3iL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDExNCBTYWx0ZWRfX88RQdFXzQhC4
 t/ismRhlTkzFgECV6NT9yzkjrGSVq2x5xFd6vIo8duxYt5KtcBSOpsj8NFLf+744ufnWk0Zdb/e
 SM/7tQmoEbZRfeP33/YQf+rpjV5/h4CU1XluRvWI7DmOjHa3fKUErqSZmytJJWEMmSEyYyqtTg7
 bQcbACVsti6VxPGQ47B2Fj2/Gax6whXysM2cTshBe4iucQTLhzzzOsFOKSRhhMnGwRN87SU8Agk
 4gvLA+7KbAASvX4wUjqT8ohyyC7vXwOb+976OO4vY7omVcgFUm3v2POiKtec615Fqxr/i75ktG7
 LAZ/DljykosgwA9x7T1MxhfW00p3Iiy2HdbvCL6lJeQvFqxD9P/Bo6T4r1OB9jIQHVKVHA7Qm1b
 tyF/L/pWZ0GDc9E+lvxwGxYzj2EETw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290114

For some reason we ended up limiting the number of soundwire ports to 2
in the bindings, the actual codec supports 4 rx and 5 tx ports.

Fixes: 88d0d17192c5 ("ASoC: dt-bindings: add bindings for pm4125 audio codec")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
index 23624f32ac30..769e4cb5b99b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
@@ -32,7 +32,7 @@ properties:
 
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 2
+    maxItems: 4
     items:
       enum: [1, 2, 3, 4]
 
@@ -48,7 +48,7 @@ properties:
 
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 2
+    maxItems: 5
     items:
       enum: [1, 2, 3, 4, 5]
 
-- 
2.51.0

