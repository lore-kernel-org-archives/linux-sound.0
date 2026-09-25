Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F11B4D2EFB
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352685; cv=none; b=t0+HuXXdWvABhObONZIhsUPTUBjjOYgAmAhAOjJ1U4bFwwLSJNS5CnaOH7BC6U79/ZGaCbg0MHhO+fYTnZiBjQpEXG7AX3n5w7IxMU70rHxF0kHOPu2LHX/D6MBbcD1m9PJSCb5T9Z8TP86V2/nDbtlRr7yxMdaGSt0ce0cO0v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352685; c=relaxed/simple;
	bh=F/iXP+JEwA9EqSDT0Nx7e8u4H23peONoXgJq6hUIwXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cMj65/KCtGEkfst9mv+WwdWIXe3+fdEqGBkJodRC8Vp7U4b+Fa+TQCET2Kkv4ZvDbg1EQqq/trJxfZDFZhY6Kdzwf5aDnzXhswC7w1WUjkWchcGi3zYG0k8QmpsdjbVYfrQdjB0rlfBWaRwUtVhCZy9Imc4Duaq4ouuX+LYwiac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6QBTTPx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPwoexXP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6QBTTPx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPwoexXP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG1gtj1668876
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=98Nyoih8+3YA2/Q1yypaUxBVERYILXDNomX
	DQkZMf+A=; b=H6QBTTPxTtU7MVj/xJvc1Oe9/O/wJ5RTAKLBbXPlRy0wNKLjDat
	Kk48gFVHpw7Bxj5FMBE8eVFHIoam8bQgNXOLiUjec+6tfaMyLKJNH+vxPOGqbSCe
	e077FnBXVRIR0mgEQqmwnCw00SsfeFsI0cU4k/UGCTSjdrjSgw+sCqpiWILbTPad
	ix0TpAmu+hxRxMWTWxea06y7lctEFASsjmVqfu6uSGUDeRxfvNeHk6o7sZACjtUk
	aNRL8BPRea7S7KUvWQiwMDRYqi1jwOOvpLmlUmbrgSQk2bDS3kkuewfJBooE/NfQ
	yWkQVTiCo4FRI3j8+FhwNvzh0LMGGoWKHBw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898vau9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:11:22 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82c2e9761so286741e0c.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352682; x=1790957482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98Nyoih8+3YA2/Q1yypaUxBVERYILXDNomXDQkZMf+A=;
        b=iPwoexXPwWuv8wOMi2H/T2kBfRqx+TMD+e2P+RxsC00lypk5LAtdl+NOxpizb1Rz0u
         rWlz9ZrHHKnAb++mEOmjHAUS1C8b2nrCrZIm+bJsejYJr/Z8+N18BqpVyPGf3xvEw9a8
         hE77N6RZtb+/ODCbgXHDe1saTTo5ijye/VA2pLDAoM+XNi9RqSoBKoY+2RuAtBAKy97A
         XJVHlPKW9xYs/C2hihE0F/m9TVIFV0JpKJc7a0BzjwwxSPg5ZqrpSXm8h9qTDrUB6BfX
         xyyU6o8xU3AFTvH5nOcBr4uAzuEDkXATE7+GZiXsWXpXi6BDi5jvq6Q1nyst3T4qKGnC
         anDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352682; x=1790957482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98Nyoih8+3YA2/Q1yypaUxBVERYILXDNomXDQkZMf+A=;
        b=tjIDIQmalR5cMkCL1+9hNHHtlV/g3h69tfcoviKbvnTaqfL3mxGmjI3DqrTpT2lu0d
         kHBX28u3z479Xk+9MzRa6M+DO1kLsVWKU3N+gk8NcXax4dsrO6vn+f47GcGzZK3Wn+P4
         VDdGjnX1t/OtpIlG6r6PD25OMDdrkk2wHa9doI+8JncHpuW2BXXic6tRV2neHJ+70amr
         PzVjXF9qerqj79YeyD11hbTp2NIYyekbT61mbs0temU+2X5edKxtLtBAjvmGOb4BVvQ6
         2v3q+3R2Lq8a31qdQxbch/LHBYru/W9pkYTEj1tklci5dXiHKi6+TBAKU0kYRYBhQ9er
         +FKw==
X-Forwarded-Encrypted: i=1; AKwUvByZtCC/zypfQDJiByHvPM5YfVOc9vFIbxPWZ3IohQPJq3r4Bg2dWau/h06oYpWixT3kQkBM8FVAT/eTeQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lG6JaSXG6krNOD3ygJvn2zrgcslrpD1+nEm77Lkf2FUbmkTCAN
	30rfSJ82m3QCrgrH7Fe2tEhFkKUiD+q2qPZLY2oi97iy+++ZAOWjEeDqUDeolFl115tq9/AvCJO
	/8x9UgAfMcsgHcD8OJ0Ld21RkFWYoizNFuhF57qlgoWeKNtDwy1+4VnEh/8kkhNDmVw==
X-Gm-Gg: AYBFou1ZVPETwDvwKVX8+IMkyFztravp+uaM9vg7TFoYydCnKaZHTrIEYSRYPIclcM2
	T6lA6v4WehN+BROxRYXaz6CvRdo/VD61xQN7izNA2U3RKLRER1OtsROYT7Xc5tNci2aA8jUD1gs
	zh8K5GdeSvIT20VxhT/w2GI//9YYLwD5Z/YU+Zom65221oL6lr2zp5cvSXB41VbewZJ7p18TuYB
	jvDrjAhu4vC3AzLs7SDJ8DB2kTRlB5Mvg1Vtpwzuw/k+P37pZkbrl/fyCUF5U5tuqspSW28GoaQ
	xwY8RN2AqHLqKA6dw/OysFMa9XMXP6u1+uVm55EIwj3InKHhEzX5whqwS3jXMUMI8CSCFGY8cCK
	BXfYm71gtRac0
X-Received: by 2002:a05:6102:2914:b0:7a6:e08f:9fa with SMTP id ada2fe7eead31-7af1cc992f3mr2742523137.13.1790352681247;
        Fri, 25 Sep 2026 09:11:21 -0700 (PDT)
X-Received: by 2002:a05:6102:2914:b0:7a6:e08f:9fa with SMTP id ada2fe7eead31-7af1cc992f3mr2742498137.13.1790352680681;
        Fri, 25 Sep 2026 09:11:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 0/7] ASoC: Qualcomm Tambora (WCD9378) SDCA codec
Date: Fri, 25 Sep 2026 17:10:41 +0100
Message-ID: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfXxp62AyW71TqP
 YFfXkxjSUnzBE1XwVO1eGp6fg0YzaozPFhOf6hLw+sLDH7TmT9X+DxR66KzaXX3+ugT5FiWeSR/
 6mQ5mc+/LyAyrLmjOoMUEu4LypL3y27m7Nb4ZxRPePgtV8n/TOWSMoFuku2apniVGN0CIJEvqXY
 jYATQbl0CTm8VOHA1QXzVStPsdy8dRbBGLDk+wQcf6P3JSJU2V9glNT7ryIzfHBNj5+hgRhrOw+
 Yod3IM2gp/XsGIcCcLcpvA3CGLtFnMYyWKtPkN9rEpD6K66UBVLuzq1VEJXoqV+PR36RPhpMW/n
 IoFeZjoTssBkPoqBaa/+DcKESBfgVAFwLtdDqr16hNd0xZV2kt/UgZwcqF5En5NXNha5+ukG9yU
 WFMeOABB2+h3Cq+s/6vq12Sa54fz/n3Pd17xmelrgBtCqHpcZuNaENW13Ysk8HZHATQV/R7WqcK
 Gi7j3PS2NbrRmGHfeTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX9CH1XiyNxJke
 2/beiBgR2umJAJ+DXCw3uw1F0naVEGNlfA9irIcvA09WLMnfaZC9a9x9xFGig7wqMq42T4qMZAa
 VMFXE0VUABQuLZTqVgecDfal24rhW+8=
X-Proofpoint-GUID: HuAORlXZXm5iiYtFLeGponSc-Qn4WxCR
X-Proofpoint-ORIG-GUID: HuAORlXZXm5iiYtFLeGponSc-Qn4WxCR
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab69d2a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hYdbEgFD419NYT9lHAoA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250064

Add support for the Qualcomm Tambora (WCD9378) headset codec in
SDCA-compliant mode over SoundWire. On ARM/DT platforms without
ACPI/DisCo firmware, the SDCA topology and SoundWire port properties
are supplied as static data through the codec driver.

Patches 1-5 extend the ASoC SDCA class framework so that a
class-based codec driver can be built on ARM/DT: allow builds
without ACPI, expose the SoundWire probe/remove library entry
points, add class_ops with a populate_function hook, and translate
sound-dai cells by entity index.

Patches 6-7 add the WCD9378 dt-binding and driver. The same
silicon can be fused for a mobile (non-SDCA) or an SDCA-compliant
mode; the two share the SoundWire class-ID compatible
(sdw20217011000) and are selected apart by the qcom,sdca-compliant
boolean property.

Tested with HPH playback and headset-mic capture on the Snapdragon
X2 Elite Glymur CRD and Lenovo T14s Gen7.

Jack detection is not wired up in this series.

Changes since v4 [1]:
 - ASoC: SDCA: add class_ops with populate_function -- callback
   now takes the SDCA function device instead of the parent
   sdw_slave (Charles).
 - Drop the v4 sdca_apply_default_control_classifiers() helper
   and set is_volatile / has_reset directly in the WCD9378 static
   control tables (Charles).
 - dt-bindings: sound: qcom,wcd9378-sdw.yaml -- $ref
   dai-common.yaml# and switch to unevaluatedProperties
   (Krzysztof).
 - ASoC: codecs: wcd9378-sdca: fix SU 35 Selector mode RO -> RW
   so the class-layer DAPM mux can drive it; keep SU 43/45
   cached; reduce reset_max_delay to 25ms; drop the
   sdw_slave_read_prop() call (Charles); lower-case hex literals.
 - Commit body / Kconfig help corrections across 1/7, 2/7 and
   7/7 (Mark, Sashiko).

Changes since v3 [2]:
 - dt-bindings: sound: qcom,wcd9378-sdw.yaml -- drop the
   qcom,wcd9378c front compatible so the schema plays nicely with
   the SoundWire class-ID compatible; introduce a
   qcom,sdca-compliant boolean flag to select the SDCA fuse; drop
   the fake top-level wrapper node so the slave sits directly
   under the SoundWire controller; drop '|' from qcom,port-mapping
   description (Krzysztof).
 - ASoC: codecs: wcd9378-sdca: gate probe on qcom,sdca-compliant.
 - set SDCA_NO_INTERRUPT correctly on controls, (Mark).

[1] https://lore.kernel.org/all/20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (7):
  ASoC: SDCA: allow building without ACPI
  ASoC: SDCA: export PM helpers keyed on sdca_class_drv
  ASoC: SDCA: expose class SoundWire probe/remove as library
  ASoC: SDCA: add class_ops with populate_function
  ASoC: SDCA: class_function: xlate sound-dai cell by entity index
  ASoC: dt-bindings: qcom: add Tambora WCD9378 SDCA codec
  ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

 .../bindings/sound/qcom,wcd9378-sdw.yaml      |  105 ++
 include/sound/sdca.h                          |   23 +-
 include/sound/sdca_class.h                    |   70 ++
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd9378-sdca.c               | 1080 +++++++++++++++++
 sound/soc/codecs/wcd9378-sdca.h               |   20 +
 sound/soc/codecs/wcd9378-sdw.c                |   51 +
 sound/soc/sdca/Kconfig                        |    6 +-
 sound/soc/sdca/sdca_class.c                   |  148 ++-
 sound/soc/sdca/sdca_class.h                   |   35 -
 sound/soc/sdca/sdca_class_function.c          |   45 +-
 sound/soc/sdca/sdca_device.c                  |    4 +
 sound/soc/sdca/sdca_functions.c               |    2 +
 14 files changed, 1531 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 include/sound/sdca_class.h
 create mode 100644 sound/soc/codecs/wcd9378-sdca.c
 create mode 100644 sound/soc/codecs/wcd9378-sdca.h
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 delete mode 100644 sound/soc/sdca/sdca_class.h


base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
-- 
2.53.0

