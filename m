Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644F5355F46
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070203; cv=none; b=Kz8kIH8ji2EqvRjaJGOEtI0JErfeqQIYUcI6w5sUBTvGeWoqSO4IwZ2dcau8c0mWcAhhJmIMvvJl9pWJb8uJ43dIwVBgjcxfxI8BhA5wpLm2CSsSmjifyDdlmMUxSn7Z/vZ1he+QFYkGIP/vVzI8pQzVSzzs/7S20GYN9xduV80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070203; c=relaxed/simple;
	bh=KJGqR8mhL7KHXySH6tbs2aCIEBTzzQRN+fAGQbvvWjg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dNwr8+HqcjWm9ygRhCGbyo1lK2pVriI0s2W5kzXLtSqFf19bSJN4A2OaYOSl+QIQElE1Jf9VtzH6sF8ekTsw/kQYYO3O+vL8dX48t/CJ48BQ0gnOaBzgxAAnbaN83hhq7mWwln+eiaLE92G8rj/wH4SgoHveO4BE7st/Knxa/To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUAvyfud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2X7LvL5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUAvyfud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2X7LvL5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M77xYA3840549
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s7/+b/CxsacuIzKFZLgR0c
	Cfzon2TIFDxtHVPPQhFLg=; b=JUAvyfud9C8oehuAXhG44QswF6M3kW07Lxl8Ha
	14UJxZTZObkkUE2RwMcsDreX/kZdn10CAsFIybtRosDzDGj8qQEpj0/HlPwkwNPU
	zenIUPSgs7v5ZTKroK+zK88W9UTR6J1JNYTyXal4hjGikCj4hpB27tFT8XQzMRPm
	awXs1niAOi5/Hh5PfHOcvu5LHv5JTHaJ/DyVNBcB4b3GZqf5VpJgxVqsps1g9iuM
	7ZA30WdQiAjQGO2svO478qy3UZrzQ+6+iQHr5/XD60kYOEazVInphNUZCbGTHKbf
	EEqwhL0/2ESxPYOupxv4qtPb3eEhMuJuCVYyJ8Pg1PHzrHaQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v53bsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:43:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2921505a12.0
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 02:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070199; x=1790674999; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s7/+b/CxsacuIzKFZLgR0cCfzon2TIFDxtHVPPQhFLg=;
        b=a2X7LvL5icJDtp1F3eKF3WIlExB6JZOUmuguqXQuqh3++cMD8Xk9MIfi3Kiy1yduD1
         bRDriPHWYJZSCRKhcg98eJs3maRs1I2BAiC0mFKU/CXX9mNDRNogTXs8v435Qgk78EYH
         kTvp7HCgT2oMDNyV3k/eX4NecLxfyJiGn3KhqXhaFBKkHPf3zmyWTx8UB0ZTny6g+anc
         vpj34Ko0EN1iIH6jSDsdY/PK7oyrQBtO4IuuG8wxwhSAW9cUQexztdxtcz7JVmTsb2hS
         hWKgUf4yTI3pnSf3ClqlWCIIyj3tBbxU2V0eJDjRDVRUOU0NvLAOObpWplpP+ZSH0mgj
         GRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070199; x=1790674999;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s7/+b/CxsacuIzKFZLgR0cCfzon2TIFDxtHVPPQhFLg=;
        b=DiLKZVJ4ksRn//rWqUdaR8vSUq8ASOt7GzDpbRbteuLDAYUs/pcKUNPkYKmBjVsTt7
         Jyf+TMtae5WXbcR7d44FH7Urw/qhA23Ot8FG1aI84f084YZ3NKt7l0LgXcgwMX5dE9jJ
         CShVGETzuGYQHj6pbkgB8j0oE3tvEYdtZTxYHw8U0Qsfd3q6oVYlCjGHkh4E1KA3rmRb
         oEiJOoeZdcb8wDyXDuYLTkBlE3Gf0i5jBuiNNd2K6IS2x9Vi+xeBDlmk7Ao9GklrmnqJ
         9vvP4cBduxneQJsQE+Ywb325FaAMP/rxlP1+6F/j83rkwPRo588eoa4bP7pOxXgG4q2N
         dAbA==
X-Forwarded-Encrypted: i=1; AKwUvBzRhr4oJIAOCPw1MH7nsvrqhvIB5jT/9sBm5tyaFbibx2CrPWFaDM4576PwetCn18c3aGEAgBMVXXVbSw==@vger.kernel.org
X-Gm-Message-State: AFuF++lygAGOpJy8LdH/MI7kGNtIiPFJfjUfqCpNn/3VnkcJmx03OEOA
	AvDVax4HXqeMxp7vMydby2taW3jyFYplLFVhposeZ8i3r/Vh0xyDpifhGMvyVRJpjTa9R8eg16c
	O/aIllgtm94hPJKY85YvlcqWU5DYA68BSjUNX/1NddALc2C8rd6CR7RIjfSgm67axvw==
X-Gm-Gg: AYBFou0T5Crk+y6Bqao1wb4sni7Y26Iki5QMjOkREI2T2maW2MfaZouJuDW5dqPhfH8
	T0zRPC/jFjGozqrCbpzbe7XPp4bwLkAMbcNM2HHk76CVlzUzWwNJs6nHu655syRyvqfs3aoAkcu
	+3UV87afz5ChFN4gITrc2aU0zh7kRwWsmm7xST403YuA6gURxLPHCmIMeiQgE/WxOq4Uoa+TIsK
	cYpDliPnbIbgdAc/NFg5lb+BYczpn447lCzQ9u7/JSCqovqPS2lNHn1NKRDQJk/i+UwlJYLJlZM
	j6hvEGJ4z6UmcgYWJOuM6WYq5a0qPfYiqoiaRXltmpp8fl2rB2icDgNbEysfhmNSDgKnD2DiApN
	7XfmLuBg9ltfH+NOvFRdzAXeyjMN9b/UlvFo=
X-Received: by 2002:a05:6a21:6086:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3ddec6352cemr785143637.22.1790070198803;
        Tue, 22 Sep 2026 02:43:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:6086:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3ddec6352cemr785088637.22.1790070198095;
        Tue, 22 Sep 2026 02:43:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:17 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v4 0/8] ASoC: qcom: Add shikra and Hawi LPASS macro support
Date: Tue, 22 Sep 2026 15:12:29 +0530
Message-Id: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIVNsmoC/yWM4QqCQBAGX0W+3x2cawT2KhFy3a25BXrsqgjiu
 3fVzxmY2WGswoZrtUN5FZNpLFCfKsQhjE92kgqDPF18S+RCSp0N8tbQ2ZLzpLNruAm9r5nbSCh
 hVu5l+01vWM+4/50tjxfH+XvDcXwA2Nex3HoAAAA=
X-Change-ID: 20260922-add_shikra_support-3e3af01ee9c2
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070192; l=5292;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=KJGqR8mhL7KHXySH6tbs2aCIEBTzzQRN+fAGQbvvWjg=;
 b=jzXUKk11dBGDDaP9zEEKhUjYNasuyXaRczB41EPHxxewMaN4QH0kYE3yBR/9U11NkVNLlq+v+
 joQ1z70G5hXAexhP7Shrtk9qrQPr1Kbz4G8fOIj5ykzQG+hcJhQT/WO
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: QrZTv3t5Tq02afXj0RhU67skqpo6V4P6
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab24db7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=QSGbU_HFu5iARQtJ-kkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX/E0Y+032Cdb0
 B95cxncCBnfnTrG22vftJr7n5XvXXehdPCXhr9v3K1/3TIEp7EaFt0pwmy47fCE0cauofcNj6k1
 4uGkVfdRUJJYOhcflKibl9AVsNNuO1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfXwk8O+rvGURow
 TayXEunQQlSDW7hHYy/BsWu3klstH5FOI5d2sO+T9w02YAi8+nZ/iQlkp1NPcbalQ6XKxhpEHhb
 fqyI3tuN0pwuJqT/vjIrYUhCDmFoAkvvbSu9ZuFd4lMLpyIYGqVz7OmCDMoZ/jxsa40rfL0NeT+
 Tll+hKNnvhOVC+MsRsyxB9zUacsBRZGeBSsuX3c+r+55ICaRendHMXAoO0G34tj9Jd7BzkV+wbJ
 ivH7AUCqeddkd6Pi2PxniIjUQ4kQRZIi6uB+7vdY/CtEzqViw7TiaavqQbZ+fB0TYWU7GO4Nv5s
 ZnT2aj4tB8xmMOuWxz//JciVir+O/UQMp/Pyr5+VmufCg4ppicamJ3yoeyL9G1byNIrtusT5UjO
 jrkDUXhofteQUs9TrLmoYByFuF6fkofRHMUrYEcolOUwtMomnBWEDF1Q4qROPj16h/NHzSHpn/G
 SLopXkNase20hZO5aDg==
X-Proofpoint-ORIG-GUID: QrZTv3t5Tq02afXj0RhU67skqpo6V4P6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220139

This series adds audio support for two Qualcomm SoC platforms — Shikra
and Hawi — by extending the LPASS codec macro drivers for version 4.1
and 4.0 respectively, and by adding SoundWire microphone capture support
to the VA macro.

Shikra (LPASS codec v4.1)
--------------------------
The first part of the series targets the Shikra platform, which
integrates LPASS codec version 4.1. This is not backwards-compatible
with previously described compatibles, so new DT bindings and
standalone compatibles are introduced for the RX and VA macros.

Driver changes include version detection enhancements (including a fix
for the missing v2.9 version string in the common helper), FS counter
bypass programming required before the codec is enabled, and a v4.1
specific regmap configuration covering the additional adaptive filter
(ADPT) blocks at 0x0800..0x09a4.

SoundWire microphone support (VA macro)
----------------------------------------
The VA decimators previously only supported DMIC inputs. A new patch
extends them to accept SoundWire microphone (SMIC) sources as well,
updating the ADC_DMIC_SEL mux programming to be resolved at decimator
enable time rather than at mixer write time, ensuring correct operation
regardless of the order in which userspace restores controls. DMIC-
specific HPF programming is skipped when an SMIC source is active.

Hawi (LPASS codec v4.0)
------------------------
The final three patches, add support for the Hawi (and Maili) platform
which integrates LPASS codec v4.0.

While v4.0 shares the same RX and VA macro register layout as the
existing v2.5+ path and reuses those helpers, the TX macro is based on
Bolero v4.0 — an extension of the v9.x TX macro that adds a port-select
stage in the SWR microphone input path and an adaptive filter (ADPT)
block. The ADPT block must be disabled before a decimator is enabled;
this is gated on a new has_adpt flag in match data since the register
does not exist on earlier versions.

New DT bindings document the RX, TX and VA macro compatibles for Hawi,
noting the clock differences: the RX macro uses the 'lpr' clock rather
than 'macro', and the VA macro takes an additional 'heartbeatpulse'
clock sourced from the LPASS VA CSR rate generator.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v4:
- Added three new patches for Hawi / LPASS codec v4.0 support (DT bindings,
  TX macro Bolero v4.0, RX/VA macro v4.0)
- Fixed all issues reported by Sashiko in v3.
- Link to v3: https://lore.kernel.org/all/20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com/

Changes in v3:
- Added Shikra-specific clock constraints for RX and VA Macro DT bindings.
- Restricted clock and clock-names properties to align with Shikra hardware requirements.
- Removed dead code from patch 3 of v2, as suggested by Krzysztof.
- Replaced open-coded checks with a flag-based conditional for LPASS
  codec v4.1 specific configurations.
- Reused existing SoundWire microphone widgets, as suggested by Srinivas.
- Switched the regmap cache type to REGCACHE_MAPLE.
- Link to v2: https://patch.msgid.link/20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com

Changes in v2:
- Updated FS CONTROL and ADPT only for version 4.1, as suggested by Krzysztof.
- Addressed Konrad's review comments from v1 by replacing magic numbers and
  lower hex reg values where appropriate.
- Link to v1: https://patch.msgid.link/20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (5):
      ASoC: dt-bindings: qcom: Add Shikra RX and VA macro codecs
      ASoC: qcom: lpass-macro-common: Add missing v2.9 version string
      ASoC: qcom: lpass-rx-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add SoundWire microphone support

Prasad Kumpatla (3):
      ASoC: dt-bindings: qcom: Add Hawi LPASS macro codecs
      ASoC: qcom: lpass-tx-macro: Add support for Bolero v4.0
      ASoC: qcom: lpass: Add support for LPASS codec v4.0

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  35 ++
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  19 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  36 ++
 sound/soc/codecs/lpass-macro-common.h              |   9 +
 sound/soc/codecs/lpass-rx-macro.c                  |  19 +
 sound/soc/codecs/lpass-tx-macro.c                  | 442 ++++++++++++++++++++-
 sound/soc/codecs/lpass-va-macro.c                  | 429 +++++++++++++++++++-
 7 files changed, 972 insertions(+), 17 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-add_shikra_support-3e3af01ee9c2

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

