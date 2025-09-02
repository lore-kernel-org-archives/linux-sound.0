Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9AB2DF710
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821664; cv=none; b=PQZDZiENlr7spuYU+85MtHYf1ic8GL6E7vC1ee2O76bwbWBiZXh0pW146bZRbOorgk8FbS9zpdEP0hwFz2b5uhFJ5V93Tbmq3zu+FonwZa+3kp9LJ9283x5tBHC2OzZb4agFarc0K4//G5PoV0U3nH12sfb5f7YgD/edMqJ18rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821664; c=relaxed/simple;
	bh=JJm99rnDzEe1ECFjAWGF6ytHuNYXto1CkMPXhCZn0eE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ErK+KyCxutJCpQutQpwkOUbplVSHEg/HtsalGmgQJi2nWTkbLIlY/u6SZOSk4/TFEFjGsZIR3rgpNq3asxmL3i5e4dRjvqC6XRPzgD6sI+M8C5I1fUU3bv39k0qTGONxEqd6kXZaG1Kp9qvy72Yr7ckR6T+WTH1e3twCfNRGaJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBhk9YbG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBhk9YbG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B0nl3016317
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 14:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2az2Im644tqnDNw05Ee2bX+L6BhbJIk8rCO
	P5D6QQYo=; b=cBhk9YbGVfE1KJltBOSAjAVN3ty5dm2PKnQPH8+BkaNEkf5yn03
	Qi4tOiiNDX7w+w136jSnLYS2bzvpj88K17ja6jeQWIUOysuhNLjK9p6gJmN2v24z
	8JQc1wKnUF1v9P4ws1LJu/YU8Y14l5zRF+P9hXzLReCn2zSxnhfg9iQJcl1BfBYQ
	o7U/sczHXFUUN4bFAivgNv9rMWyZsYer227cw/f2OlqR4pv6dwGTZdIeaDs+VTLj
	uriMTvcTB8dejNN4kYP72b3AblUeXhLUi7hGj9GhCtXuKXI0keWQ5y5/T+ZtSeFf
	nHb3Hxaz1F7lvv7cKyOlvPlnNNjLt+Rn0sw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw001g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 14:01:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3298c585bso32768151cf.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 07:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821661; x=1757426461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2az2Im644tqnDNw05Ee2bX+L6BhbJIk8rCOP5D6QQYo=;
        b=p2ZlB/vjLqUcdG2ZisvVPIfRDgSGSiO73K9bVDqFyGy7B22OlKtBpU9Wa3y+R/AOVi
         73gmhBpty7QEk/i719uS8uOOwX2NiN27SCbaUlFCcwrTW9TkdHDmBwrUuv8ln94y8Fb3
         hIvhN2vyzSlhWgAyw8YOx2xm0O7usqFHYumjcy33BtzenCKxYbWsGefhDl7xvFH5vSYY
         E3Jb//cJk9m3ZIj06JOQpP1v2G6ukAdvdkz/Cgep//F31VMqdAjwAKXT5ipM1kfV2DeM
         b4l2xcjucsSonunMHUEjGQybF1SBYf6+a93TjHWEecP/UQElS40QYtdlmTM1VnscktK5
         dgRw==
X-Forwarded-Encrypted: i=1; AJvYcCX5CcNXkIB1eq4UxWVuY9673WVL3CTRi8JFnHtlYJ6cEKAwBdxVIm4lOortVqC9L3Cjc9XE4Vfqbqs+4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Q8NKC0r32OUwwJkXogl0qPyBT8xmFSif2qW8z/Z0TzSiptif
	rNMCcfYlEtFboH5HjppMuaos6dd1J4j2j0xUr1K20ScrXcuIlKPv9P+7rD4BWsRmajP7AlCzHgd
	0CN0QOYHNZ+rvIeo04Q9/JMZU/+SQT7PTJXxsHf2lt/5QDfm354oFybn2yha4RJlB4Q==
X-Gm-Gg: ASbGncudSW4mbSDVQpttX1p73516gSSQz51X8c3FLM8QxFcdL2LLa8jh29T0VMKFq5f
	jx2L86G2BI/XiYwPu2WQvXxscAuh/r+5vL1p/uN0OjZC1Q+JDdIhtHwODoK8VHqbJH8mG+KeDqI
	ksN2yZTaZsHodlwnCKHEgxmM4m0HVvHqvBmYafNicp4vZJPYUMjfBxT6P08E7UN5ibUbT7gnCOA
	K+zDTVRdKKFC9qErpRtkUdYQrvHNf0TCHe7Yl4l2YQuwe3bqX31VRSUKU9USM9n5FeW+yqoVJFG
	MNPPHiKRYslZInakjk74lUHNi7stN6EuwE49A1YcuzurrqfI+77gZQ==
X-Received: by 2002:a05:622a:1111:b0:4b3:7ec:d238 with SMTP id d75a77b69052e-4b31b85ed4fmr135598071cf.4.1756821657059;
        Tue, 02 Sep 2025 07:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPhaC3o/U4JWaz8rPrv8EPnrnVo7uBTe7rQa0n7CsRBSYcKVshYqyzlm+d72I/Hi9srgNHSA==
X-Received: by 2002:a05:622a:1111:b0:4b3:7ec:d238 with SMTP id d75a77b69052e-4b31b85ed4fmr135595041cf.4.1756821654981;
        Tue, 02 Sep 2025 07:00:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:00:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/6] ASoC: qcom: add support for Glymur
Date: Tue,  2 Sep 2025 15:00:38 +0100
Message-ID: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tc26QggQq7q2fw1VuASHCayMYGpXgiRr
X-Proofpoint-ORIG-GUID: tc26QggQq7q2fw1VuASHCayMYGpXgiRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX5DkDi597GW2R
 Tvq8Lg9zV+SocTYH0IDKoGDtK60tvG2Ibeyy/0LSQmhOvSr06+HARI0jkyja1dyAP47+OSPLZyZ
 Z7R7ocBjSCcIGnkbAlnlKUsDS20zXWuTtw3CBwqToVV7sd2SfVzPvm8ONJf4S0sl3ouyPsvbkdl
 2QL2MHPOG2vvLbWp+SZD0k2UFSWrmUGwx9h/8sRumZiNXD9U03oHv9eM9QoB2qKIJ8S7D4GXYtw
 fs6iNFE82Rzuzk6c2F2P7KhWDMz168WtQV00l3epwuqcopaAyjgP3JITtTkhiwsjLexnliC62p9
 31xwlcTHGbrReHLIswQheur3KtTiqJKFDxRcPL4rrK3hR4OWpFTX7sPjqoUlhHe2VzOLdS45DMy
 fWH3Wjlr
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6f89d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=FrvE4Lm6qVnUI7UI9j8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

This patchset adds basic support for Glymur sound card,
- by reusing x1e80100 snd card machine
- reusing lpass wsa and va codec macro which are identical to v2.9 codec version.

For now only tested WSA and VA, which is why tx and rx codec macros are
not added as part of this series.

Tested this on Glymur reference platform.

thanks,
Srini

Srinivas Kandagatla (6):
  ASoC: qcom: x1e80100: set card driver name from match data
  ASoC: dt-bindings: qcom,sm8250: Add glymur sound card
  ASoC: qcom: x1e80100: add compatible for glymur SoC
  ASoC: dt-bindings: qcom: Add Glymur LPASS wsa and va macro codecs
  ASoC: codecs: lpass-macro: add Codec version 2.9
  ASoC: codecs: lpass-wsa-macro: add Codev version 2.9

 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml       | 1 +
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml      | 1 +
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml     | 1 +
 sound/soc/codecs/lpass-macro-common.h                        | 1 +
 sound/soc/codecs/lpass-va-macro.c                            | 2 ++
 sound/soc/codecs/lpass-wsa-macro.c                           | 2 ++
 sound/soc/qcom/x1e80100.c                                    | 5 +++--
 7 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.50.0

