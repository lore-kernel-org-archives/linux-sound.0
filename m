Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FDE347FF2
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143646; cv=none; b=O7hd8Xx+Czbtaawd4AEkQbuK3mW4IsGPF2VvfOE0ZrNsz9x5/VgtPAnmyx5ewMdvmqrAkWPnIuOhuq/k+AKGFfRJOI04PqQCjOJMW0QjLOyiKB8m/ZfhFq02CbyaGdp4WxZ+FI0dlmT8avRNrXe0KTBLs5Y6wCSRfptMU0PPPGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143646; c=relaxed/simple;
	bh=ByQ0z78twGWg1KYZ7j4NhE4+tO/gGgH6slyRYU8eq4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ezp+0irkoocChgIH4jWmKAFzTGawuo04fESnnZK2OkBA0OMeUHGRpfP+d57sq7Mi0ZRRo+orRzqe8O6hEqCl2kG2GVX5wDS48ETb7IVqARJk4WZXeH6EX+zpYJ0py7SaRYx8ZkKkJjwO3hKodgZlELIdv2yB2BBgfvTENyCJggI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9rMDpvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9rMDpvG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAvhmV004647
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=L6UQFgQJReJOjnGLiJBPDnY9bAoXvAFd3Xw
	aP6LDOwQ=; b=R9rMDpvG1rM5GVjXKfCP5elBKVktl1EP6fWnW/BUXeZWnqbkp26
	0LktdWp7qDWs95y4YvgV7hFIoieneFBc5KuhgfDkhmlEW1hOxfO6pXyZx2TvEwXq
	2CGtoiq8hklaB46VnYtkBqYY3kiSZdmIfSyYAxi5g8xCYbcioAAiEjTvD38tl2Su
	y+cgyJoyAqaJRUYW6x8Zwn7XSiK/5DIxrts63R07XuAA8PN70ZI2m9uJnrbeOLQr
	GDIs35jV77EqMFEICBp2rsupJke34Pg+QnHjX2TQFaYbBVIwuXPDuB/wmaQ7hSjh
	nS48JQG7FcJQ2Daxkd4gg0MgCsd4b8JYLag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfmwu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 14:34:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8984d8833so51839821cf.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 07:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143641; x=1761748441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6UQFgQJReJOjnGLiJBPDnY9bAoXvAFd3XwaP6LDOwQ=;
        b=GJ0rKkCiicmYHR83R8cdwA+APGz+hUE+AzrU7BNArydOBPB30ExdJzbhJ+vn23mgvu
         m06ntjSWiLDHsDam0qfOryEhNoihcxxZdmJh2i7Qh1se2Sv91FwTJajQ7A+bA/AVIQaI
         2WYMW8VToYoteJHn46Em3U0aU6J+aPoYy+25sgaw3KzDZLyaukbS13ujDYnEbr+Q4N1Q
         nO1aCmoFmEzxSzuC+KCtmbt5m6JE+JZPI4aBISDBkxYzsfRTj/h3OKrqP3XI8ZEugUIN
         Tm5OkANndQtjo8+dUJP0HHDFs8q58MV+hbWPiU9ie+rs/ZMbxOTSwhdwp39Mj4J47McF
         T0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCV406G1gU4x1Qbi4USnOwaFmfvypCXHHx3bp/fm87MIknDpkA2g7/ozdoVbvm3X1eqC1zf735dc02w6KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMWphZxbIJ5bJwKhV0JzV8/4pBi3DmZ+Hf6rmL0Eai68b2Q39H
	iqmU7ODs0E1i6cdCYxZCWJFznukuuMgLU/BiYxfAI451C+7WNLEKbHIIHfDCgHSDJPcxsIHvvN3
	OzbOnr23ElEyguIIFQKWw/PDne7zo2zxHEUzBO/SrYRta5osYTdCw9Xc6CeRKjaQwZQ==
X-Gm-Gg: ASbGncsRIiXuUYJDT1MjdWbGzfNkyAWcT1rFmpmVsECv/8prNDirwVefVAN/87IWf9l
	XPEhPYAsx1371GI0yTSBFw3X4n/SuVRXK53jcRBSkXDd6n2j09+rg/8HA82PKRygj2593mNFi8o
	XTVLYBMj4+QYvDW3s6OZBYcfopIBSiAtcccJCqyodJl0pj9k/h8OexN/5NAZ3Jd6OaxDrUuTrzX
	JxGfqYAqiZGySxckB4dgtk1VN0xFzI3wGGp+l7oNcONBexcrc+mZf/MqEblPRxFBgq4ASDgR9he
	jeYfLMfVgp9WVYWMnK0a8cgzbN+gHro1sksSln7MRCTn3Cw+0zkCwxCy3vIxsoHBy4t7j8LcDNc
	TBDeUrv3HtT57
X-Received: by 2002:a05:622a:1998:b0:4e7:3a2c:6d57 with SMTP id d75a77b69052e-4e89d2633cdmr244271881cf.20.1761143640955;
        Wed, 22 Oct 2025 07:34:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfti4ovqyhNMFPiWFChOJkzXieKbreTpBscjhGXxDDniD4I6sBt1IuD68qD+kCZiFTOmf+pQ==
X-Received: by 2002:a05:622a:1998:b0:4e7:3a2c:6d57 with SMTP id d75a77b69052e-4e89d2633cdmr244271401cf.20.1761143640450;
        Wed, 22 Oct 2025 07:34:00 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm25544910f8f.24.2025.10.22.07.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:33:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/4] ASoC: qcom: sdw: fix memory leak
Date: Wed, 22 Oct 2025 15:33:45 +0100
Message-ID: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IXR4V-mvsGPX1vNu2XbqGGMANYPqWPv_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfXwjfOz7MDdw6I
 glthgfLzOTDl+zW6vr8eGJWDRXufX99SNALUfKAqvMpVjiF/BBe6qYam7lDxTE490nXPxO7ouBw
 w0sp+jVMaxlKPsHFXdQFN0teI/svum7XTiHUDxaQ1fnvYvvjzIoZv/LD7tw/n4f2d6C61GUzLYK
 Mmoy1ZKqGCxoq4CCEzEMK6/WjwD3VlkJ/njqyhWaqj75a3k/joLlXrdE87OtBATSN3RboWe3nCN
 rUZHhFfQmWf9YNXtLlVRQMx2tDQZlnW23pt+L6GsmuWnlwFx2G/W04OVeVbgfoMmaxz+JPRZRh2
 VZWDYxliv0IXDS60aw6LY6Qy+DmM0QRPPf/O2q6wITZ8lYU6mwPA7uPgEmd48d+SNnYF+XMhzCh
 tQTzCehjt3wjXsTjl71wJ7HFCVzmbw==
X-Proofpoint-GUID: IXR4V-mvsGPX1vNu2XbqGGMANYPqWPv_
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f8eb5a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Tmn-ty_kyiCvGlHJeRgA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

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

Changes since v2:
	- adding missing return statement in qcom_snd_is_sdw_dai(),
	  reported by Steev

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
 sound/soc/qcom/sdw.c      | 128 ++++++++++++++++++++++----------------
 sound/soc/qcom/sdw.h      |   7 +--
 sound/soc/qcom/sm8250.c   |  33 +---------
 sound/soc/qcom/x1e80100.c |  33 +---------
 7 files changed, 93 insertions(+), 261 deletions(-)

-- 
2.51.0

