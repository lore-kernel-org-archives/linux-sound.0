Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376473;
	b=H1kIqgsxiz0d9HR0jcstYyCoYoEf+R2fsothTpGIiX2/nYQj4nQP3apNdjXYtRA8s+dt
	 pb5v55lXok+ga22Ofiw7EXKnryA3vp6KKnfntB6YS8RpLB8gMVFE0PA4TzTIYC/wPWqBt
	 ZQxxMsE9xTxB+Kqk3N1chK0tt+w4+Fl0fWZ+EkjGu12uRyda3g+K1v1Usbh2UlFTP9ka4
	 odAOKKHdygwX2J/U/zs3/x9LBRH8cublkxim5q62zFyHUrg61a7EgiGeQvZx2835DMlch
	 OqIgzzWW0/m7D0nkTS7ThECz0qd+Lvz2mPVR5o6c0ujUMeTJfiKG9Qet/mgGGf/BSLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=08JJ9gvzdH5RSu7lCMC6gz25P8IY9qc6nWmBwjiJQ+M=;
	b=LlWZXOV1AlvS0E8s7kxJq0KMSSdg7og/354/i8Cd1tfMr4zkR3ufl3hfnhC8ApgYYn8a
	 MbNmMvnNPw6OTdCMC1ZyCwSbUsEnPrk5x60Fmct98WQCc99mgXQb3LO+Xt63Wx3rem2SY
	 a8i+1lDVzh1kLWPs4nVjB0lmHV0oM2TMcRFN0wdEh1dGioSUGcLTowio71tbJE0WKNeow
	 M37zdQwvHNulbY1xa6mqJ3cl8vEzYCNq6oav4PQh/GGWp/ff2kyPff4YVpcUtH/lU33iU
	 wc/ZQzN997uZ6u56n5T2s1x6N0D6En9pqQNmLZdtug18OBL2mg9MDMQZuSleOs3iMEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fWQVHv8K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRWuavx5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FED606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fWQVHv8K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRWuavx5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVAW81380868
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=08JJ9gvzdH5RSu7lCMC6gz
	25P8IY9qc6nWmBwjiJQ+M=; b=fWQVHv8KUbHKBlNOGxKzqfioXZa2mMNPUF/fcw
	Ab3cLg48+FK7qBIASUS9NG+i69mDfPm/imGUt2Ez5EC0ti3ApGRmcgFHE4l4w0kQ
	uhm8h5TMx6vr3Zydk13i/aXaInf0py+KfBE02LV6/VdV2zK7DNcCQ1YIr7L6SwNh
	Ff/mrqhZdteIF4EZTllARbAfWjQXkQHuENyzELR/mECMLuwxP9cJhjh4pTLOwfJv
	qsdASFvc8YD8AdWZjpMDRX+b3Z8oR5czuskaHYpudjoZ1TGYwerJcAZD3rYZmoz5
	CDjQEaCFoUD8BP2rSXvA0doFFZK+3E7npmdawefoPrLkx85Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w044wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so1207383eec.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 11:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376471; x=1795981271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=08JJ9gvzdH5RSu7lCMC6gz25P8IY9qc6nWmBwjiJQ+M=;
        b=GRWuavx5Euxm9v9+PV03+r6hAVCTGVDlSi052r0K8X3OOqfrEy1VsZjeCZkAFALv39
         tZ5WUa16cK5B9e+sCI3db37jMYm49TN12NBFAiMx8VdYI2ksBBPnJtmw5DVbfnGFs8kL
         D+51K3JxsxlkhzcAsnuYsKcyQJ8lrOkAHoQH8xfeyp2TygifsLqovVLd3R6Uj6J7Qxg2
         5EdNi+fmqbrFD4FcW45Kltjx1Augz8PMkvHkswYRaWsQ9k8ZMiZ4PTJsPVtaNZTkojBT
         O54YjuFp7FNPmU9oOWaiHJUEMUfCjjIgzt/yEd2fMShFZbSaqx/32mkTz1Ny5P/SPEJL
         Lj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376471; x=1795981271;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=08JJ9gvzdH5RSu7lCMC6gz25P8IY9qc6nWmBwjiJQ+M=;
        b=HE8D1H3kKMAqXwHd4/6DP0Qde50owbCZf6gC12++SsSc8dwfAnWM47Wrq5iBJn8/7W
         smESGkp3WJSIQ2n0MIpJ4ZP8Lzbzvql6ErIFB2rrQXogUc+4MFQUXtvDld4unJuoKTJW
         TjmY3V1RAdNrbx6PMx9xUPppyO+CEyKp0z0KMglxHbcGJv6mpDJGq8IXkVSN3T68Jt0d
         zZjgItmOhd1wXTkKrGiOsXM/FCphljjgYk9sKUtKEM3O2EhWONmKgatcCey7dazSIKI6
         k4uBS5i9hs/RY5J9NsG+nD5xmczyPu2Kr3p/635kYWHW/c4z8Bgq/fwoglJhetTvl6Bn
         ho1w==
X-Forwarded-Encrypted: i=1; AL+hErFN7yeX/GRRfhvt+qd9mrEAgz2hvWTG26Oz3dNayT2ue6Qt25Xlz/95N7xWMFVBUT3G9w5Xs+FwF9mGbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9CqsNvQpOhNjnRb4F4hJE3X61pM0D5lGsy3eWVJKRUKfWnsTlS
	3QXBtrXdEokmw+uyL6/d1jz2xkc+LDN/aCPPwBbO06AYYEaKj8U7duP5PmVSbph4mWuB4Wqzjry
	LDKRfNk72NcPk3q/9/0Rgr0OmWu5h3YA+0mPnQI1zZxr6ASnbImOIvVYHSnA1uCu5Lw==
X-Gm-Gg: AZFdTZe8dSt4PhcYnrAyirmfRRKF/CggxF5mUAzuVJTMgKpoA2RHAF8xZcSMurILT5a
	ODko+JkrUv0Ff9n6yoZOUvJHb8OqZhns5SX4PnO9KzHXwW0Ei47w4IrTNeqWHBz98gHl2GGRCrw
	gnMh+Zh1Z7Y9lMw7nIWg2LkFNVrav04g6+ykokalh8fbc6kr9XLmmFakVA+Ox1pI9Np0OSfobp7
	08d3bwTr/CUntZgm94YWzFLbFveBOywCC3ydJvNpjnFS/eUpZvYcghDp/wBZouJL104tzGOz4Of
	FgoUxVgUJIOenUHVWvgy/R+GpwxLNR1GvYSEAy0QzLpOmCPHnpg1lDokZ+pmvKBSmCLu/IxOQ0Q
	WKzZC8jeh+PDhd1owH0xmotYVJMX1LP4RrnrDdbVFwHJMQ0We/MehCHlGqP4xA9W/lA6otutL2Y
	5eBxtEblHJew==
X-Received: by 2002:a05:693c:88d5:10b0:386:9e9c:867 with SMTP id 5a478bee46e88-3869e9c2df2mr5049517eec.10.1795376471013;
        Sun, 22 Nov 2026 11:41:11 -0800 (PST)
X-Received: by 2002:a05:693c:88d5:10b0:386:9e9c:867 with SMTP id 5a478bee46e88-3869e9c2df2mr5049488eec.10.1795376470476;
        Sun, 22 Nov 2026 11:41:10 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:10 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/5] ASoC: qcom: Shikra machine driver and DT binding
 support
Date: Mon, 23 Nov 2026 01:10:45 +0530
Message-Id: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAD1FA2sC/12NQQ6CMBBFr2K6tqS0gVBX3sOwKO1gR4VqB4iGc
 Hdb3JlMfvKS/9+sjCAiEDsdVhZhQcIwJlDHA7PejFfg6BIzKWRdllJx8niPhg/GehyBO6srULa
 pTa9YGj0j9PjehZf2xzR3N7BTtuSGR5pC/OwflzL3drnQpfiXLzKf4Lrr6864qtGuOQei4jWbh
 w3DUKRg7bZtX5y2zSrIAAAA
X-Change-ID: 20261123-shikra-machine-dc95e3c86af3
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=2669;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=AK+isnXFvbL7gDAUtPlaSgxjaBL6KvTPiIfM1qx0PsQ=;
 b=TYqDYa4h4N9mtgP5Vz8Y245ECRAgzkjsgdE1GP2thducAZFSQfY26at/jWq9zQPFNcrihRsI2
 zUpGRuQgYUQAuRJcyoKRWCPrNoZYzBnbviabw6cx/L8KslP3GukQxmf
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX19p2vxeAJhRC
 GOZqFNiLhk6a+09acIDgVEm8RR2ShwSmtUDnMtPj0GZIWJjTLoZMhUXY9MLgI0nCDb1r76o+KUH
 keMJ9B1pXs5q7gs/V/afOuBQEb0eobqWModzlrDuXhAJ+bZ4hxYM5sOSkxxNwLK8mgjb44p8Rov
 0Sxq7UGErAyov0Cad56m0SxbMMMM5ksLK4Futyf958vLfGh0+vLaqEUpPS+eK65PFdl6cFPCsUN
 gwSvjYgGjtmeQCvmurZ1zznGzW+eyaSf3UiqBXFePSXohdS2POARFhZD+pG0E3MuU2YKjhagUfm
 qV8QpX88Oiz9ExAH3p1wO7wkqeXHlcFSQB/JWP0rgrfkSjR0lPS+JW7kQgk0p8SQSGeswtHhOGX
 tepuQY4H8XKCO3WVwayrnsgZsUMsZYRPYbsyDRjfggkTfunNSf6N4vMH9q0Y9p0+u+9I1B21snQ
 MSm2dQt5ei9yKDU4gvA==
X-Proofpoint-ORIG-GUID: 63q27l8xusbBcv1iSZ1rwhzWCBpBJ_LZ
X-Proofpoint-GUID: 63q27l8xusbBcv1iSZ1rwhzWCBpBJ_LZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX202hApfxb+oa
 g9qBr2Zcc95msUby/GVNOTTzddNdW/vQU9amIpKOgaY8ddBrvS+gZT7ZrCNK/sX8ggIDdP6HTLg
 dUGsuztvn6VwZ1HU1oWr8tZLNWC67bI=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b034558 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8
 a=FU4AtH68Du5tlk7Y-9MA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

This series adds Qualcomm Shikra sound-card variant support in DT
bindings and in the sc8280xp machine driver.

Shikra EVK variants use different audio components and processing
architectures:
- CQM/CQS use an I2S-based path with WSA885x amplifiers and
  PM4125 + Rouleur codec components.
- CQS uses modem-DSP based audio processing.
- IQS uses a third-party MAX98091 codec with modem-DSP support.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v3:
- Fixed the dummy codec backend ops issue reported by Prasad.
- Fixed the issues reported on Sashiko.
- Reused the existing DAPM widgets.
- Link to v2: https://lore.kernel.org/all/20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com/

Changes in v2:
- Split the single machine-driver patch into four separate patches
  as requested by Srinivas and Dmitry:
  - Patch 2/5: extend hw_params for QAIF MI2S/TDM DAI ranges,
    add cpu_dai_fmt, VA_CODEC_DMA_TX_1 and be_ops filter changes
  - Patch 3/5: CQM variant support
  - Patch 4/5: CQS variant support
  - Patch 5/5: IQS variant support
- Carry forward Reviewed-by from Krzysztof on the DT binding patch
- Use correct struct type (qcom_snd_soc_common) for all priv_data
- Link to v1: https://lore.kernel.org/all/20260611112946.954172-1-ajay.nandam@oss.qualcomm.com/

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
Ajay Kumar Nandam (5):
      ASoC: dt-bindings: qcom,sm8250: add Shikra sound card compatibles
      ASoC: qcom: sc8280xp: add Shikra backend handling
      ASoC: qcom: sc8280xp: Add shikra-cqm-evk compatible support
      ASoC: qcom: sc8280xp: Add shikra-cqs-evk compatible support
      ASoC: qcom: sc8280xp: Add shikra-iqs-evk compatible support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  3 +
 sound/soc/qcom/common.c                            |  1 +
 sound/soc/qcom/sc8280xp.c                          | 70 +++++++++++++++++++++-
 sound/soc/qcom/sdw.c                               |  1 +
 4 files changed, 72 insertions(+), 3 deletions(-)
---
base-commit: 7884221ca9857a317bf4bd81ac3bf5528f266feb
change-id: 20261123-shikra-machine-dc95e3c86af3

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

