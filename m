Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046364B1272
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491436; cv=none; b=IKedIt9IxxhAXKNA4AY0RRdYer2Y75c2iOumAvWkA7gdNbDVYLRwjqTj3bmea7rZLI9oyBAQND49OBaCBFyuwwnxHovpdWdw7sKv6zNqaw+4l4m+87iUHPsAg7GssmtLmD4GxaOZt++/Z55pTCpGi5YaIanaUOfu8HnvluzIF7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491436; c=relaxed/simple;
	bh=7sZXCJrlcQe6tWAnvFSzQqrjQWl6F0vafplST4Apil8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mdZyFZ6sRNnDJjFb7FR802z9T86IFdkWHB+fz2qS/iZmy9mMsOkpwJBGu3g9zyrS2PmZmVRsjqrrNDz5K5VnWR7sjmR3NfdxBOQ7aJP9eyIe0eVXESmLlQY551KSeC5HaR/b/13qtiCOuFZ8yKq0+pdBlYPEOKMv8/+jjWemEuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjZnOgzx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7GAPlaF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjZnOgzx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7GAPlaF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFATxO4176129
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MI9Kl7QZCeP7JVMjKmDtliZY8ZENsVTkKBw
	Bqm3AWGs=; b=OjZnOgzxB/Ny/uKwILwfTDmDBotboGiLbs5GjDZllgRDP51/nrp
	GIaviMks4eOhaIu/0bdDTfgotEs1RFidTkcSbGEa4HV+nOBqWwGuCcXeX+1dMDeI
	vVvOxDjfHMilqgx//l2LikFX+ImGINhUYOxKbOx3FJRKM4XYZXyuNQdNhx4CuMSL
	WRIZoOWB6dlHyx3OdxlnK+mcxVbQOn35gIGV76EzpvkkvVjJVaF+G/UsOXcl+DLM
	vPiWfs/r5pc3QlnQSjxmsOPwTJStpkAFX5q/Th2Ugcw0m/IxkPBunw0iKiths5gp
	1aLcfC9Kgl96yvrBrOk2fPILLY0IfW03KaA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc2jhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-790376c9f8cso1192481137.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491433; x=1790096233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI9Kl7QZCeP7JVMjKmDtliZY8ZENsVTkKBwBqm3AWGs=;
        b=U7GAPlaF7yJEerwi+ZDWNtGQvumHelZKPJ3MiIFdiAVCw1ZT6hDOqDq0Ynz5eCbeba
         PBF38+wy+Wwzd2e/KDl/sgltxZxCVNXiEMwFnwkjSJlEJYl53wtcQ626e+VYfkjiU3gH
         tlAnraghCb7ob5unwhkLkJSz48Meic9nGZQ+128UzYeuKy6v4YW4tEBtTgieXEuuWY7e
         Gu8/FskHki1v5y6NlfzG9aHY6AcpfPaxzplFxsdP6dlfYeRPiMM7FvN6PjwjO7oVgikY
         dP2XziQbsAh4pnTE6Xhx7nuoxii2ZNZnq5CpEoqgthUg3zlxqWxIJNCogiLU3Q4UtA/j
         Qv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491433; x=1790096233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MI9Kl7QZCeP7JVMjKmDtliZY8ZENsVTkKBwBqm3AWGs=;
        b=HD1aCoaE8A2JXm8X+veJaGfOLWpimb/ZtRmfazA8Rwpak7SG+pvPd4tlC+Q+VDr0fE
         btvjErFz4HWPHxlZ+4q2cmLLT7wZRkwlqYTp+/BY81xzGU/fRqJx3JUrqlYie3s/hAA7
         CdVQJx3fdWoarfxHd5FPfgN52AJKdI6iBUpsdfV63XQFEECnXKb/91itGQxU4h8Yjho6
         k5TpVLPY2KodSwZ2jNEtvLVodQNcGCAxxbk4saN6l5np3XujHFY5+6p9WLzioMYA5Zi4
         5Gcoo6yKh+cs0gRwqOFwQVaU9EPtuyD0H48tXGVscNkFAa+AAAIqqj2EolQ6IY3UiIWc
         nTvQ==
X-Forwarded-Encrypted: i=1; AKwUvBypezgVrlTjXwwaVOioGPEZDR616H+b20raWExI7lEpgLY5BuyKJoMIJvkhWyrSrg2coZz2Cikq4bbG6w==@vger.kernel.org
X-Gm-Message-State: AFuF++n4IaU0w7rqLuoehhfCV1H3somQbB2Rc9WuoBMgJt2jeDrlMRLa
	xpcTaA1E0ynooR6fV5NoqXqA8KYXRxIJEvTfRyxjQoYFzHdxvUFV/PWWI42lZ3VtU/NgeHvDYkl
	HTnkoCJPa9Y0yFrTQYNH7mHgrqig73PBDhaxgxs9GjBwbez3Q9CBvqwc/jg++dAYmyw==
X-Gm-Gg: AYBFou12p0N8Fboco9+1z0cCj2Wd1zj9G659ASoEz9FFjPj0bvwGlmBgSEE0rcPtNuM
	c3czu7hK3Npi6InbNXhjo9DURtxF/b9MiCyX5Eq54zNNWihQUJ3YDlTfMfAxBsYG3BBZGYAZ/ke
	q6+dg2VsesSNn40J/CX7isVFArGGStMm9zcEfUygDTaX2+cd5I73y4bxJWmx3eAOXZ1QYUhC2YA
	EDi3uKAoGL1ndayrdVPwZcKgWvZj0AxpzPgYnw/IHslPJCy/mtec3DPH3jBIALtAGKAFczJXcdV
	GURLOLh2iRE4uSNQkjB6OP63uqmuYhPGECSNv/uUgUtKTCx4HK4nOiK83wygWqllUqREJ7fTs4t
	EHAR1RRi1nDcuGg==
X-Received: by 2002:a05:6102:6407:b0:79b:ff9f:74cc with SMTP id ada2fe7eead31-79bff9f793bmr8266155137.0.1789491433066;
        Tue, 15 Sep 2026 09:57:13 -0700 (PDT)
X-Received: by 2002:a05:6102:6407:b0:79b:ff9f:74cc with SMTP id ada2fe7eead31-79bff9f793bmr8266072137.0.1789491432543;
        Tue, 15 Sep 2026 09:57:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/8] ASoC: SDCA: Qualcomm Tambora (WCD9378) SDCA codec support
Date: Tue, 15 Sep 2026 17:56:42 +0100
Message-ID: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rqAToK0eZ0EWXqOrdp9ZNfVIzkzJWWMZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX3UYtX9KHUrHP
 HP9s8xIGAjU3XMzVwFK5PIRjsOYvhsPQPTKQXFk5G3XYg/2Y5FDplIyupGdUKezW/vMvrLGP1hm
 Boh+76kAV1opS3C0gskULdvX09vQU0g=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa978ea cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NRmDave84CxBQQXzKXEA:9 a=O8hF6Hzn-FEA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX6XvTBfC+fLQu
 5bgHEY602z/bfBzxlKnJ3mYVnepfCO3b6BrmW2NweoT6PsW9zxL7o46bq8YjETOAzrZTUnAgjcO
 l6DQGNnyMJIAkdDjF4zER46fIKLYGeO2VB1CJbHAujfkaqkAbCK9ALk1Feupzd+uyunjQg/dxcB
 LQkr+IqkTcdUUVSt3P98tIj57Re5BZwgtft3JRI/6enmKYr+wbR9KMpvL7K3b2cOP01nV7Bpm+T
 rPYakk47T/H5Q8uRupx4Olg2cwLF0XpitsiTYb8xUUVo5pljGTy7xgjDi20DdlU5/eIoStsiy80
 HgJFHc05vV+7qL15a1+DAK28JL1vin8EGPz7TXp/L/fSO1w+oTmMgpuMObvBYcA+OXihxhmYDyC
 32E/nArOBvsgsZfGlmyj7lmZwWwMKl8YEvrifln4Cf3Tp2rnXzVnqQF8la7D7qjLlcaBLLGDLGO
 +fgznCyheumpWk2QbJA==
X-Proofpoint-GUID: rqAToK0eZ0EWXqOrdp9ZNfVIzkzJWWMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

This series extends the SDCA class driver to work on DT / non-ACPI
platforms via a codec-provided static topology, and adds the Qualcomm
WCD9378 (Tambora) codec as the first user driven in SDCA / compute
mode. Tested on the Snapdragon X2 Elite Glymur CRD.

Patches 1-6 extend the SDCA class helpers:

  - Kconfig gate to build the class without ACPI enabled.
  - PM helpers keyed on a codec-embedded struct sdca_class_drv, so
    codec drivers can build their own dev_pm_ops.
  - Class SoundWire probe/remove exposed as library functions
    callable from codec-specific SDW slave drivers.
  - class_ops with a populate_function hook so codec drivers can
    supply the SDCA function payload from static tables on DT /
    non-DisCo platforms.
  - Class function driver registers SDCA_FUNCTION_TYPE_SIMPLE_JACK,
    and resolves sound-dai cells by entity index.
  - sdca_apply_default_control_classifiers() applies the same
    is_volatile / has_reset flags that the DisCo/ACPI parser would.

Note:
None of these are functional changes in sdca core, all of these are
helper functions to allow non-ACPI users to use sdca core.

Patches 7-8 add the WCD9378 SDCA / compute-mode codec:

  - dt-bindings for the SoundWire slave in compute mode.
  - Codec driver split across wcd9378-sdw.c (SoundWire plumbing)
    and wcd9378-sdca.c (SDCA topology + class_ops), sharing a
    wcd9378-sdca.h header. A future mobile-mode driver can plug
    into the same module by adding its own files.

Testing: HPH playback and headset-mic capture confirmed on the
Snapdragon X2 Elite Glymur CRD. Will test it on Lenovo T14s. 

Jack detection is not wired up in this series.

Changes since v2 [1]:

  - Un-export sdca_class_pm_ops and per-op wrappers; keep them
    static and let codecs compose their own dev_pm_ops.
  - Drop the exported sdca_class_read_prop() helper; codecs
    open-code the four lines locally.
  - class_function: check the codec-provided ops hook first, fall
    back to sdca_parse_function() only when a firmware node is
    present.
  - Rename sdca_class_hw_ops to sdca_class_ops; populate_function
    does no bus I/O.
  - Drop the hw_init callback; codec users moved bring-up into
    their own SoundWire probe.
  - wcd9378-sdca: MIC_BIAS fixed at 2.75 V via the init_table;
    drop stale qcom,micbias2-microvolt reference from the commit
    message.
  - Rebased on b-next-20260911.

[1] https://lore.kernel.org/all/20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (8):
  ASoC: SDCA: allow building without ACPI
  ASoC: SDCA: export PM helpers keyed on sdca_class_drv
  ASoC: SDCA: expose class SoundWire probe/remove as library
  ASoC: SDCA: add class_ops with populate_function
  ASoC: SDCA: class_function: xlate sound-dai cell by entity index
  ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
  dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
  ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

 .../bindings/sound/qcom,wcd9378-sdw.yaml      |   91 ++
 include/sound/sdca.h                          |   23 +-
 include/sound/sdca_class.h                    |   70 ++
 include/sound/sdca_function.h                 |    2 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd9378-sdca.c               | 1005 +++++++++++++++++
 sound/soc/codecs/wcd9378-sdca.h               |   20 +
 sound/soc/codecs/wcd9378-sdw.c                |   52 +
 sound/soc/sdca/Kconfig                        |    6 +-
 sound/soc/sdca/sdca_class.c                   |  148 ++-
 sound/soc/sdca/sdca_class.h                   |   35 -
 sound/soc/sdca/sdca_class_function.c          |   45 +-
 sound/soc/sdca/sdca_device.c                  |    4 +
 sound/soc/sdca/sdca_functions.c               |   31 +
 15 files changed, 1474 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 include/sound/sdca_class.h
 create mode 100644 sound/soc/codecs/wcd9378-sdca.c
 create mode 100644 sound/soc/codecs/wcd9378-sdca.h
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 delete mode 100644 sound/soc/sdca/sdca_class.h

--
2.53.0

