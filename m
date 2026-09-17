Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091AF768EA
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619913; cv=none; b=mkx25Oa437g2YF9fHBz/JL6IGLMJDhbo8lAjLemVT8O8tVBJbNLFl2TovhH52e1rLVawbZ/gq0hl0zIMSrk9MwZn4WcxDYb13zJ++de/Tn7uMjN7vNQKjYcMG4Gm34hwrCrmi0CGpWT3FYPQ94BKzj8y7GLkyZG10GrnjJpYb3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619913; c=relaxed/simple;
	bh=8kaMCvclbLQw9S7ZDklhdwNqhDsVvgFTFLKp64qWZ4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iT0CdgqjhjY+8gJLLCq9TsmJnONe5GS3nq4hVr9Odkbd7wz85px/EWBJd4uEA3B/Buv5mTCylHY+imRWgAjrrj7qDCGsvjKPtNW3m8NUkQYCoofDHKRcyp6psDNUuKwVPspivLFvS/AlpijcOsOxiScfgedF0HySOtT/fXnIrdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0quwsQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZc6tP9C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0quwsQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZc6tP9C"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0aQLZ210468
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sj6fK4VlMZisL8kp5PhpfNHu+n3mB36nthMXIo2bTEk=; b=a0quwsQJpjqq/rBw
	kDQ2Gdi0BM/T/aUTGIm1qLIRSYhFP2OotE8HIbEiGUvuE1dz3hGrSkyKiENzyLR1
	91TwdWUohmbb19wzaTXXtPoSaDOrfUHdzbomESQcxFGIQoHBNqh0J56s3JeDW4Dl
	0Qn2LO7rnLt5bE3C5/XX96HgBi1zeIGU7I7o+qHuDKiT9y+BcpJxGMPwIRoQc69Y
	YY16Z2ly1KZVyvp6LrJOc6upOFOpaQDeQGVxl9PUgkwtVMxXn+aNuDk2Iq72znO0
	4jJdQaIdCFcdF+Ff8WLx6FmqoREswMzgMSXfgg1/XIh7LLZ5fVRi4cYaTh1Fp2W/
	wzHoEw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxw8tkew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so1072958a91.1
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 21:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619911; x=1790224711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sj6fK4VlMZisL8kp5PhpfNHu+n3mB36nthMXIo2bTEk=;
        b=VZc6tP9Caxm5dHNvehKR37/5NTe7K3FHSpkogg+6Mxs+pD6YsT3E+UgrfmAKgnmP7E
         vGJN58FDJEjMEHRhe1/lUn4jRcwumfkJZjYjJrdA4+nMuChH1R7hIfjYjswX9xad7GnL
         3HP8V6GAjGDHlt3HRZz+KbGdzba7k6GMvit6ZH6XRJMGyPYdop/uAQiB65shb21rEP7V
         Jnxjtuarsi4Vsn5ahly+/g4aXtVtWPFga/V0TGTkfgKCwVJNvrOxYhRba6FLodDabBb1
         HZyoCwOfmPYxRgRhBJ9ORpredwIfZ2nI+d++zNcg+ZXuaIVTWPIdymA62ZEWcTJNU8fp
         Of3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619911; x=1790224711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sj6fK4VlMZisL8kp5PhpfNHu+n3mB36nthMXIo2bTEk=;
        b=a6G4ugDhvpg8LY0ujDoULBLB6Xpz4WDy29/6iLwI449olA1xekK6CU9p5XxJeY8wG3
         FTfSeUCZNuYhjC4SeqqaQ0yaqN66HlEvoKrxSSrF82eSkf5PuFX8/06kqr2Yg8go69L2
         PKrhRK3lnyxADt2lEzXUN9KLbEmTANeSWSrOU6vyr5QPEx+eYwzqL2FMQtQqRf3FOm0c
         vCd+mMMUR684wcotH4AUPSORedUoyOm6iKakoJimI3pu5VlWT7vDZcgNDo1SNQj68CvW
         Kz3Ta4iuPbDAOc2cMIi/uAe+/yyhttIUwuBXdK38879zv+e9JKRzb+aPVB2sXVxVRAec
         8DyA==
X-Forwarded-Encrypted: i=1; AKwUvBxIkgrF2/DHZdhpRVZiz5zOtNCi1czX4tue7qYJKiNPatdJgSNfJ81snYnVKFnb4gLOxiq75AoACBD+mQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nFbVsZm0eV1zh8H0dZJE6gxhdRcFzDoe8QxXoY0Lw6cbs53EMz
	81MRGgoiGyNaEPOThNeT046hG29xLmux1DOXDCOr/CxZFy/Y1Iz1O8SopuXqJLVoMmncBtYF2qL
	gm+CC9dfewyXpnbu9sLj7GTwE/N+E7vmPUowPbXin6qOaS7LQE8k1+5JuE8UmqbkEfA==
X-Gm-Gg: AYBFou0U9F4jRJ/xEQemSc2OFb5VTwaRaxDTGYkayZ0/vQPZUeQZ6AXVxFMjxo8TX77
	LmliqYklpaXXT/0OBMBX8D1N7f0YdNOoe/G37rlEfr9vsI1ANyLnAugdImnnE6ao2BoLmj/w63+
	4LUxu4LkdhA/DlJ2lWdOxrB4BVe3jx4Eo1OxgPCiEewKZvUDGg85vmjmGU3mB18Q/FwkvU2CMZa
	Ns/o2p7cxIh6p9hwS580NYDLkJQyCO9M4PUCObZOxzNM2YxvRYAylGrFZz968wCJ2n9gTpHYADf
	xuP0p+vybfqe9FUoO1u5nGLn3Yr3FrkuSnvZoNmMoUZ1qzYHXxRYNA9rXArQvKvEHtQCrpwgO7r
	mn747EUokXoEDN+A8W97rLy1tUV5/iCbYrVGB
X-Received: by 2002:a05:6a21:1f8a:b0:3d0:57c3:65f4 with SMTP id adf61e73a8af0-3dd5f3c194emr14296913637.5.1789619910689;
        Wed, 16 Sep 2026 21:38:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f8a:b0:3d0:57c3:65f4 with SMTP id adf61e73a8af0-3dd5f3c194emr14296872637.5.1789619910298;
        Wed, 16 Sep 2026 21:38:30 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:29 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:37 +0530
Subject: [PATCH v3 8/8] arm64: defconfig: Enable Qualcomm PM4125 and
 WSA885X drivers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-8-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=1168;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=8kaMCvclbLQw9S7ZDklhdwNqhDsVvgFTFLKp64qWZ4o=;
 b=2wszZrKCrkhKDPuY4Fr7BYeiS8xtabwHGYisO2WY88tvo0JOz18xc9xw9d5JdzaxXWspkGX6N
 dc+ryicntvzDR52tuS/vdy88OdRvqdHotWZaueGm2R9GoDmXlE5//Lm
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: bhdWjSbyOddSsSVE-CFAiZDXceNZ0Er3
X-Authority-Analysis: v=2.4 cv=bY3+w+PB c=1 sm=1 tr=0 ts=6aab6ec7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX2yV9RC9+KdK+
 WaXBCK0ZwbMkLyXgF7CBiqKmU4hNNYX8En9SeWJNC/fPsH9Ct1Po2WP7Ela9Tvm4xfcWL38DLY7
 FAa4cLXKarmEKJ4sRyiDqidNrEDwSfA=
X-Proofpoint-ORIG-GUID: bhdWjSbyOddSsSVE-CFAiZDXceNZ0Er3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX34XVV4wxAxdM
 OmQGHnKV9+NBet4lXhlsfqwgoxmMPgGWYcJIlXrrwDQPyPmBTPMlH9mhnRwFEQtuIRgIiubsZsJ
 YlE1rE+KF6vbgvoMItLU4+5VuPwMhb998BpEkHojkef53WGkQKevps8uQ4mrzjw65AX5y7OWuAb
 cMXplQ8wFUutLn3DTE4Q7Pzx+qXn9YHfNy28kvXadnkp9X8hHp1LAPetrWI4UsXM7E9FIEn3zJh
 GWHFVlV9J1FsAxFbegBq68ivBMv5KyDNuT+iPWVA6Izwgjj1j+jvjX0+l1ab8eJ6eiPSJ08/QgS
 R/t69fDvkqqR1Mrj85P4MwIqfgyGuP47ZTDuseMFAThqP5P7VY+kqudeegJpTc0+89ax0cbrHQv
 /xpjtoMeiyvRS6hK2MmABYw6FgM63w67GrmxY4n1Ujyqz1WhQyx9z+cvCFcaJpqajnOOqm0mOlJ
 QVbJKmaMycrVU7uZa3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Qualcomm Shikra CQM and CQS EVK boards use the PM4125 audio codec for
headphone playback and capture, and the WSA8855 amplifier for speaker
playback. Enable both drivers as modules in arm64_defconfig so that
audio functionality is available on these boards with the default arm64
configuration.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5217de386edc..0bb07c0f4451 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1167,6 +1167,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1189,6 +1190,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_WSA885X=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m

-- 
2.34.1

