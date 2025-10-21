Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F4C261B9A
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043210; cv=none; b=bml4QT1AakOIRmPHoV0hiQtNOCDTv7o3Q4WNjbJjORZvEW0sgztIEFyEjlBUwV+34q40/ZY1oA7ShjVA0zs20Ylb+/v3lNyS+Tu/6YFoCZ0kLibk+aaBT+JIWBHggLTw0xoGfC72gVI2HWTmOyOC/d5mrnEKeSWmKS+rbzqetdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043210; c=relaxed/simple;
	bh=0U8hAB45yH8EGsTy3EJNkB+JbnjcAFL7FugSc4yQ26c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMOvcraLI46rkkeH9dthGdfKjdV7aiE7wu2FZTwsoG2MiMqV88UEebKMp+W4xz7J89D6hbqL/jreLQEOSI7Xwr0/3+mr2By4F8EsLfJVG0G7Z2Td5hZkClJG6fcqPEx7Q0iqmgOn7IaOv9aiSdfT02q9Ee/hBHQ8cdLc2cN3RwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXJfatr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXJfatr3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8OKHi010821
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EbXFKjfP9YV4IPAFXNS5yLFyAT4bZfexbjP
	y0N72g9w=; b=SXJfatr3apnPlPBnqM8wKB0PoiyDlgDFs09jgJ2elDGlV/PTeqB
	vK8qBrm+1bPX0AdzYNCMXzPU4KXl9UVQQiwm+n9OxutRPfwWidOdDKIY8a65ckhZ
	7a+iyrVy3QmixHEpg1+WeyB57BeJNQXgiNTXbXdrkjM4Ho0cVSToBaf84vutvTfa
	l2h/rou3aeRxnBTv7Tf/hDkvt2FfrNhg4nqk+Ebm0g69XI5hJcqcbV1zDXW2HLG8
	HYm9EgrmGKB5o7AEYPF3lj0jRP+vdCXnWPs8goDGHwMBL0nVR3UtgKPY7fEuS1U0
	JEMB9SmF2ZlqGHzwHsHg/cQwyop2wX9voEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wtgetmdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 10:40:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8908a248048so796093285a.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 03:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043207; x=1761648007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbXFKjfP9YV4IPAFXNS5yLFyAT4bZfexbjPy0N72g9w=;
        b=BCF+hKixxZI/J6XfjeQC8i2q1QfTRve9UuuqjvzQWwQV4MxMghr8Kqnv8zWHHYZxap
         JcL4+Er/8LEpIbTzlIlGOJONITGIvxUgJ7mAUhwNFVK/rSm9SJaN1k8F0QKIpV6QDsHW
         Jwa6l4tZiGwh0ag/u4hCEjC753r7Y5/Y9Rv1Zt9x81BY6jdLpWWot9TpG3Wzbg/xndL4
         iZ8x9cPdq9/4mVixNV5izgx6K8w+aWul+Deddvhy+hpJD+GFPwBuhCMosMyqJTld729X
         Y6Q7nuru0cqtNnw7P1vW6IuscVEZxiDieIA7LfC/S2ypaeNWHqWO3UYstcSEW1aSe8XE
         rB1g==
X-Forwarded-Encrypted: i=1; AJvYcCV9LLxXZ/uwY49DTDlG511sqGqUDfk/uv1YhqXVkedek1Og3WoNGg1f5PeXk3KMytmXikzub3wDNkObrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn5Up91RLd0BsSm1UrdrooOcRTxt/co49+N4scAd8Xi5P8Gehr
	NfFjvuq1V/0OBreDuUP90QAZdQPHvLVbCtYP8QtkSBMZQhti9q3LToAXaiWpowxWw4IqpJbhu7z
	mUDYA///tMXQE7tiBffEMTrWtUoS5axsCI7rbWHLko+//04hPFafVVXXxdaKOkt2+0w==
X-Gm-Gg: ASbGnctuUw4D15HzdxgTCP6jKqQcXTOPwwRo7aanI3X9f0h1z67IdYa6ZahfevZSPkv
	Vwqi9LaFs3/lt4/WvOBmLwV85u6qCQUViw0XxUH6h83UBlrO1kVKy/9LuEThxqG/lD/J3/bJC3z
	UUyJPyYG7IbEkYGmbBYyUrYE6Om5ST6zlmyVAnNHdoTsQlVNfvWCi2LS0rPGKsnyYTw+Y7X0tI9
	oyjDMGmfPIeswbvgy6HAo1B458VlxWywAUZn1FxqaO06/xikoX5N61sYSTnRiBDbG9/Ua0N0KNF
	k21vML+ATJ92QjHFvJGaXMLYT4NvruByAlw71Qp49EJjgK3JakGMs10hwaITTG2jbIxO9NRRDXY
	8A+plSJAGFs/T
X-Received: by 2002:ac8:5a11:0:b0:4e8:b55f:af22 with SMTP id d75a77b69052e-4e8b55fb2d4mr121141811cf.53.1761043206566;
        Tue, 21 Oct 2025 03:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK7ENmoHQ2RT/4VjoSrYVZ4wOzzLy46jV66xunwwgH1MxVbYZONvkuQCmOMnkT2v/D3Mvg2Q==
X-Received: by 2002:ac8:5a11:0:b0:4e8:b55f:af22 with SMTP id d75a77b69052e-4e8b55fb2d4mr121141551cf.53.1761043206041;
        Tue, 21 Oct 2025 03:40:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm20087938f8f.32.2025.10.21.03.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:40:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/4] ASoC: qcom: sdw: fix memory leak
Date: Tue, 21 Oct 2025 11:39:58 +0100
Message-ID: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PEQI1JxJw6RZuyTmFrOLWB79WXBMYx9y
X-Authority-Analysis: v=2.4 cv=JeaxbEKV c=1 sm=1 tr=0 ts=68f76307 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Tmn-ty_kyiCvGlHJeRgA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: PEQI1JxJw6RZuyTmFrOLWB79WXBMYx9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE1NCBTYWx0ZWRfX+GuVGF5ConBZ
 CW8fdc/z5F3fqSe5SiIvfGlqM1dG2YZaGEBFIcCCiAwZnkIJMx/gX3l1KC3zK/G+oQM0ixaDrjX
 WxFnRqYhVTEAPsdWVDDFdG3RtV+alCT6TFSSvB9NRtSw/JKFiRK7OztYKUnLwA5OCvWMkhMucUM
 LRFev+vkmRtSHef4GovYD21YZjzfIToNanPEbcEY0y+qJMa3Gtp/YDCkigNdnUxQvBKPcPTeqgY
 ozq8ss7dIzLQDLZTU3tw2Y1xFoSBFAI23Rj3f19VMNQHZ3evEGTAbOONLknncsFANflNMKZQ+CH
 NwwxXOCzqp6TTl+igY/ucxpunous5OZit3D9t6nwmA+ISf0MFuDo00HTUDP3Sp577gmDMJSIN7B
 wjfzKzJOIggkem15KurbwRXB7fIiBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200154

For some reason we endedup allocating sdw_stream_runtime for every cpu dai,
this has two issues.
    1. we never set snd_soc_dai_set_stream for non soundwire dai, which
       means there is no way that we can free this, resulting in memory leak
    2. startup and shutdown callbacks can be called without
       hw_params callback called. This combination results in memory leak
    because machine driver sruntime array pointer is only set in hw_params
    callback.
    
All the machine drivers have these memory leaks, so cleanup the mess and
make them use common helpers from sdw.c

This patch series fix the issue, and while we are at it, it also remove
some redundant code from machine drivers.

Thanks,
Srini

Changes since v1:
	- added missing dais for sdm845
	- moved all the machine drivers (sdm845 and sc7280) to use
	  common helpers to avoid memory leaks.

Srinivas Kandagatla (4):
  ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime
  ASoC: qcom: sdw: remove redundant code
  ASoC: qcom: sdm845: make use of common helpers
  ASoC: qcom: sc7280: make use of common helpers

 sound/soc/qcom/sc7280.c   |  67 +-------------------
 sound/soc/qcom/sc8280xp.c |  33 +---------
 sound/soc/qcom/sdm845.c   |  53 +---------------
 sound/soc/qcom/sdw.c      | 127 ++++++++++++++++++++++----------------
 sound/soc/qcom/sdw.h      |   7 +--
 sound/soc/qcom/sm8250.c   |  33 +---------
 sound/soc/qcom/x1e80100.c |  33 +---------
 7 files changed, 92 insertions(+), 261 deletions(-)

-- 
2.51.0

