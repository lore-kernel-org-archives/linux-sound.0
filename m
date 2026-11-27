Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787541;
	b=DJ7CP7y1vIF3cEdhpWf0GnGTqPyCPaHMycyLAm0lRgzas9BbBdQLnWzVvX/THp/UnMYc
	 wyAryQi/MgwjYQ1AIsWR2bGmTOk4VVtshpq+Qq8DSWj7FXef9cBP7NS5p02ivhUPver+v
	 mCGpiljmXyCd8oTpW3tgN9TsDTvVXtYJbhB2A+DW4hHSxPZ65dlzbUeTfOLb3pI75jOnc
	 K5SHYmCX713a+YpdafrS9aqUjXyFUtfBuKFuyZuNi4sCYKyqPdHXZQOkYu1ho3kWKzr7q
	 KCNwLXX8gN8sIkN+37SDP1UKms4FPVcT1WmWgVIs8ejS8EiWykbXhl6wbfjMTeSemdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O5xD+8eMDF16hwZZu12S3/pCswr+wuLD/806G2DAhCY=;
	b=DMGe3Myv0+O5tzG+OX5tUCvbWrfpJOPuf//zcT2dEv58Q8H+C/lTgIISk7vS+sz7lJhk
	 KxogRhJ4fKJynHIjxncKtf651LoABsGMNGZFxF31yt/UJ2A8adozdXS3GFgKN7H8ckxzT
	 CeuWhVlj3vI18FSy+R6ue/Na2xJbAD4VbbGSSSBhmbdSJP0gzpvMeuwDLb1xR7xR6mGKf
	 OisM1/uRdxDO4sNCa8kX/YK7LTNSl92rnFKKdZ8hzxEks4lIwsqY+iDp9luweIoAE3YYe
	 mjaDe2pG+6j79oIWFw4Fm8pAyIKeGmoRO+T47yMYoe5CEgAqDo4MgbpGjL+T12+c1FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h0tkHij/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifHX2TKt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD5606A31E
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 13:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3CD5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0tkHij/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifHX2TKt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChQN6516261
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 13:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O5xD+8eMDF16hwZZu12S3/
	pCswr+wuLD/806G2DAhCY=; b=h0tkHij/4SY0eDvBolIGOzcNCa330Vva9CDhxU
	6dPCSk1pdi8pe4hfmjia5P+Y6jj62Icyv8Y2fmdmHaTW3E95qUblc0ekSbSDFPZV
	b2dIGVQnb2YxZO/rO/mpRiY8AObq3GthE25MdVvqa0RJIjZdEJ8kLOCIX2sSRVF7
	E5aWpgQPD/eRsnu2g9lpoxeUGuwcUVK+k766+6sX3f0Yt6rUgULfOet0ehKISFPS
	lZ/fpgD5mHESWJpWZOKSci9hOqM4AxATc8XSfIb7cxGzoMsLwMj5v2bOBKaaIk3W
	bnhj5LYVYOKtLI70cpTkoUSQSbUM7q8C+ic2mZSvSmspGiOw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49b90m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 13:52:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a073778890so6039663b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 05:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787538; x=1796392338; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O5xD+8eMDF16hwZZu12S3/pCswr+wuLD/806G2DAhCY=;
        b=ifHX2TKtC6JkkiKwy0XUloRYyVlSiamUQZMXAdkdYTBmzkQf8Qogd9Vdomp3YPTJde
         Y96j2XNq3jxIOBInX70DkanYBqOdfihoNulL7c3zP0kL6L2xA99ZxA+XGrcMjumxIhYn
         0+ci56VtuBZgjS2ejAqUkVqjEdvskZ/YSvsFqlcnBN3o4e6zhey12R3IUKbBNHY7miTx
         rYJv4ZnkRyF7aMNu9sinCmEys3FyIpWAqQME4l4rpKaIZwrJtZdDXij8Y1lrTj0wJeqd
         DQYxasX/j3WSUeqZMBrLWoLg+CbwkVsWz5ydqYB/K8q0LSSJ/Idzd3r29c4BbnToKvYF
         snbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787538; x=1796392338;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O5xD+8eMDF16hwZZu12S3/pCswr+wuLD/806G2DAhCY=;
        b=REFwPHm1xrqq6yEGVBd+dBJ1qGkiUlC8uVsaOLuUeuCTSK8iW/isWM5fB++1f7YbZZ
         4qN8C5Vn8VAlP1yuGnku30Bf1+4ofIMbaktjJGIYqLwkTZP8kUTxD6ng3PewlNreoGZb
         AqK68Ek1cLNHEDKa+VPrrEKJm7Pz5EZFed3SL6Tk6M4z3LnOkIdL1JD4r8acI2aggBaZ
         YffrAkA0SVn7kLc+RLOePX6MMPs8yb+gkGggakRwJjwEFR546KLjhYOxfmuRI4+r8oq1
         hyVwi8A/QRuPEeKv4/PZKxJaMRm6ybwoCKppz5XanOij6Hm6b55+PUb+LfE/wj1ilPUW
         lyTg==
X-Forwarded-Encrypted: i=1; AL+hErFbDfJINPiod/8ZnJhZsG1dtnti9GcnS2lNYoYFl+kAucqBperFpkj7v9O64fumFuFstJS+HF/dBuQHNA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qy5/H7LNEJlbCHSsWm12HMWCHk1PJKJdfEy5rzpELsMI+nHqi
	1Zy6rAms6YYw11JLNRi96gZT7+RSBPiSLYgiBf9OBq0PurJFRwOFZaIYNNt5impud8gwE5uqtTx
	94jX6V12ZMEW2aZJ9bA1iKJWcZMqwWVTEMjn1Ga20EwBhztMg+0R1hm6yOXvHoXfwXw==
X-Gm-Gg: AZFdTZd3qzhNBY0pSBuY1jQI9pNyVTsvHU97/hLpjqn8YJx+w9WKGMKpxlXI9dWqhcM
	KDUM7QlFoopTmmCyr478EbWouzOT77iJ36v80WKpAbB6FObKU9mvnI2lSO/DXZO7H3sR6Dy5v8h
	x7/sufK4n6S60u4YU2nr5E2mOZnMXbsFsuyt0iYD8QW70y/R8IImZUUMQP+lynBk014oXbfUEVC
	k7cxXRzd2KdJwcF650NdjQJn6O1yrD4moVqXXNuQ2OOpGep3jTKVGNXfm3p0XlNJ5zJ6D4Ig4pt
	tBjW0CnZwmRYEB93A9U/5jbq9O3fzjdimFTfp+I2KDBXQxYCYxYSJMgk+OCXySdw+oyZMm0DQbh
	v5CfVhW6zmOf4+Y0WB2cyrdF6Dhv87VW7WaKh7cS4dJRxoyhALLLH9S3+GUprfhd4XB4n4OV3Yg
	WbR2k=
X-Received: by 2002:a05:6a00:2d96:b0:890:e6dd:52ca with SMTP id d2e1a72fcca58-8c87d228520mr21817217b3a.47.1795787537999;
        Fri, 27 Nov 2026 05:52:17 -0800 (PST)
X-Received: by 2002:a05:6a00:2d96:b0:890:e6dd:52ca with SMTP id d2e1a72fcca58-8c87d228520mr21817187b3a.47.1795787537475;
        Fri, 27 Nov 2026 05:52:17 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm12747353b3a.2.2026.11.27.05.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:52:17 -0800 (PST)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Subject: [PATCH v3 0/2] ASoC: codecs: wcd9378: add non-SDCA (mobile) mode
 support
Date: Fri, 27 Nov 2026 19:21:46 +0530
Message-Id: <20261127-b4-wcd9378-v3-v3-0-397e5ba2da55@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPKKCWsC/yXMQQ5AMBCF4avIrDWhRXEVsaAGY4G0lETc3WD5v
 eT9Fzi0hA7K4AKLnhwtM0OFAZixmQcU1LFBRjKLY6lFm4jDdIXSufCKVfDcZDpXKfBntdjT+fW
 q+rfb2wnN9kbgvh8bzyEWcQAAAA==
X-Change-ID: 20261127-b4-wcd9378-v3-b49611a67835
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 7uWYAUsQG_8SN6c3BqqFwMFXQOo3ObQb
X-Proofpoint-ORIG-GUID: 7uWYAUsQG_8SN6c3BqqFwMFXQOo3ObQb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX4hRymLU+01qF
 qEKb9t4yfD2SvkWkWMTfiWssM23y+Xkwx2qLMggFw3J6OPvPXM2Hw6SE3CM+E74XXsz+vvJriuY
 jZutOvhrW1T5FUYmqd216tzJHqC4bKQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX3kBVb+ABXknI
 Th7+hFutItyJ46SmB0ACYjRZJfYNfP9otMMZiuoDQHLpYUvU3AyApmB/c79ifsh8T4l06XJ5URb
 clQmgOX1UsK7kHy0+EKJliLiBlEVEtKFX3szVB+dVjmx9gXkz3FQsnLSWC713xoMJVB/xc6r/EY
 6xEU2mINzTqfgYDbuB0AG5ZLBAToftDbncfIRlUtjty85LeLKNv30JGR/ch0+0Tz29oGY6yzx74
 T2lijFQwEfGUcIAjRisa8Idk9uC1aCEJWapEkdLhb9eThurr52Qz75+giRzr9i7dCKgbIvqoDKE
 RnZq03x0fg+zEnzkXoQcNOn0ULBGO9JoCE3gfc8ZXL05fZidUIzgjSowsDAXme3UxWqaQTDBnz5
 oO4D43ze9HQHWx4Lc6OFzdlvmlmPZW2sL5aHlVs5LIOYPZHm0R+f9GytJqtqOyOOLIEV+cOmq5w
 hyrZ2kt9Tp0kBTO8b6A==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b098b12 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=GYSh3LzNAAAA:8 a=EUspDBNiAAAA:8 a=T4HdZaMeGz766qfeROsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055

The WCD9378 is the audio codec on SM7635 boards such as the eliza-cqs-evk
and the Fairphone 6. Support for the SDCA-compliant fusing of the part is
already upstream; this series adds the other fusing, the one used on mobile
boards, which is not SDCA-compliant.

Which fusing a part has is decided in silicon, not chosen by software: the
same die is fused one way or the other and there is no switching between
them at runtime. Both fusings also carry the same SoundWire class ID and so
the same compatible, which is why they are described in one binding file
and served by one driver module, dispatching on the existing
qcom,sdca-compliant property. That merged-module shape follows the
precedent wcd9378-sdca.c already sets for this same part.

The non-SDCA fusing puts two SoundWire devices on the bus instead of one,
normally on two different masters: a capture device on the TX link and a
playback device on the RX link. They are the same part appearing twice and
are told apart by their SoundWire unique ID, reg = <0 3> for capture and
reg = <0 4> for playback.

Every control register, the analog core included, is reachable only through
the capture device, so that device owns the codec: it takes the reset GPIO,
the supplies and the mic-bias levels, registers the component and the DAIs,
and reaches its playback peer through a new qcom,rx-device phandle. Keeping
those resources on a SoundWire device node rather than on a separate parent
node follows wsa883x and wsa8840. This is the shape Krzysztof asked for
while reviewing the SDCA series:

  https://lore.kernel.org/all/6a901a72-fbcf-4478-b798-e5f234c5e9d8@kernel.org/

The Kconfig symbol SND_SOC_WCD9378_SDCA becomes SND_SOC_WCD9378, since a
single module now covers both fusings. Patch 2 also touches wcd9378-sdca.c
to drop the fusing filter at the head of its probe, which the shared probe
now performs before the SDCA path is ever reached.

Verified on the eliza-cqs-evk: headset capture and headphone playback at
48 kHz. Verified on the Fairphone 6: handset mic capture through the LPASS
TX macro at 48 kHz, repeated across reboots, including UCM-driven use by
PipeWire in a Plasma Mobile session. System suspend/resume is untested and
is a known limitation, described in patch 2.

This is a respin of Jorijn's v2, which he withdrew and handed over; his
attribution is carried on both patches.

Changes in v3:
- Restructured as an extension of the now-upstream WCD9378 support instead
  of a new binding plus a new driver: the binding patch modifies the
  existing qcom,wcd9378-sdw.yaml rather than adding two new files, and the
  driver is a second entry point in the existing module rather than a
  separate one. v2's qcom,wcd9378-codec.yaml is gone along with the
  top-level codec node it described, as is the accompanying
  wcd937x/938x/939x and wcd93xx-common binding churn.
- The capture device owns the codec and reaches its playback peer through a
  qcom,rx-device phandle; v2's qcom,control-device boolean is dropped.
- qcom,port-mapping minItems drops from 8 to 5 so both fusings can share
  the property.
- RX/playback added: HPHL/HPHR with the per-channel companders and the FU42
  channel volume controls. This was follow-up work in v2.
- Kconfig symbol SND_SOC_WCD9378_SDCA renamed to SND_SOC_WCD9378, and the
  redundant fusing filter dropped from wcd9378_sdca_probe().
- Clock-stop handling reworked: a runtime PM reference is held on the
  capture device for as long as the codec is bound, because the SDCA
  function engine does not survive bus clock-stop.
- Both soundwire prerequisites v2 listed are upstream, so the series no
  longer depends on anything outside itself.
- Rebased onto next-20261126.
- Link to v2: https://lore.kernel.org/all/20260729000649.263426-1-jorijnvdgraaf@catcrafts.net/

---
Jorijn van der Graaf (1):
      ASoC: codecs: wcd9378: add non-SDCA (mobile) mode support

Ravi Hothi (1):
      ASoC: dt-bindings: qcom,wcd9378-sdw: add non-SDCA (mobile) mode

 .../bindings/sound/qcom,wcd9378-sdw.yaml           |  172 +-
 sound/soc/codecs/Kconfig                           |   23 +-
 sound/soc/codecs/Makefile                          |    4 +-
 sound/soc/codecs/wcd9378-sdca.c                    |   14 +-
 sound/soc/codecs/wcd9378-sdw.c                     |  636 +++++-
 sound/soc/codecs/wcd9378.c                         | 2201 ++++++++++++++++++++
 sound/soc/codecs/wcd9378.h                         |  324 +++
 7 files changed, 3311 insertions(+), 63 deletions(-)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-b4-wcd9378-v3-b49611a67835

Best regards,
--  
Ravi Hothi <ravi.hothi@oss.qualcomm.com>

