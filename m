Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968404;
	b=NP8NprujyHcAqrcDNNuJmlV08btZDfpwMzEyze7yJFWbOaZu4ye79PQh4jkrC568juq9
	 R9VxrToTP0d7pkBtH8bHZ+U2CQLzhnkPeiu696jcsZ5wAB9TG168tJ/pqjdfhZ1Ey+WH5
	 0TaNJFm0OZU9f4BF4tf0HLQmK8cYiJJwBfnXgcnnG0qBc2ZenGvZIR+mj45B781snG7ds
	 F9U/qvUkZiPKyk4BdThPN31IajmVlZmu98B44K/TLjDluTFLx9MY1aLFH3P4vWZnDkK3Q
	 cELLhziya+5+aacbAhx+niRBirz9ut7/ri0mM9xIUi6BCJC15QtqJmBOpGooElXa82Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=edn025/LYw3ytj6a1I7v8ax20+2ljCy/+E2aTr8xOMc=;
	b=z9HjFLFH8sWYhti9/wl/M0ANhCdcSm7QuY4uOzer2dysjCorrZp69xhxMxBwejIhuryH
	 Q+z6vK7pmJLeoNSRRy1U/Mosi8ilJ1MpzBjIIUqoZ02dkpIOgD+UZ27v1pExsKlzWen7T
	 XUKsUvgQt0+aJyLXYKO6nGp2d4rwkKuVTPKPFSG5eXuqI4rF8nJrlPX6agbUzSKT+2VXL
	 H5ArktfKVocWxB/C24GYFmxxiYriZUqLGNySJkeR2WBIorLVyhsk2+Fv4qXmIoiQzwZmf
	 XmUSZjjdZgC/b4KbYswqdqpoCoa/1Efp3uF65vrBSptpLdlst8iH+JMKnXIrRlE3ROw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CbIAElqn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jL43DNXo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F61606A32C
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F61606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CbIAElqn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jL43DNXo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APNeZ527482
	for <linux-sound@vger.kernel.org>; Fri, 6 Nov 2026 12:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=edn025/LYw3ytj6a1I7v8a
	x20+2ljCy/+E2aTr8xOMc=; b=CbIAElqncyqFs3WS7NRUBHOIJwj8BqpMRDqrJs
	T2OLqd8z46F7cBdU8lHeGB4BlVG9J2almTrvDFiJ5I6bx8glChaERyyU1DxQqivk
	2r/RbmgnU7dyi40zKzuety7jLffyyHoeKQ+nPMBz+6KHXHnsPSaEe90cCam814Y/
	HdRFNcZ2G6Qn01NhWdw82bSkQEpRNpiKWGiXdLwbFgnUEYhRmq5VwIP4iLl6DDR3
	EYLlzvXo7JKBqvMpCR8LAoZYr2DVei9ZrrHHhbTekIClJ1ix0UZGzi9G2alCSIdv
	VkTdZsB7mLcHlCoa7yRq3sRk/baoaj5lzq6Qs8bKgmJ7LEqg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9ts5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 12:33:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1078940eec.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 04:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968402; x=1794573202; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=edn025/LYw3ytj6a1I7v8ax20+2ljCy/+E2aTr8xOMc=;
        b=jL43DNXoxEMkpyK6IkAR7Gi4JoGESuGvwxhwn/cmF1xUdUhYX7+lpgN4ISpTelm107
         W9s8hg+DDidmfSKYNtAk0BOgE3UO5gSbo8tS+oP7+VtURDjn0mZktnMyq3WItqRjRlRR
         JoYCiMRBHdqccda5a7EZXGfjzvdW0xF1SVEl76BINflKwpM6pdeK2hV24px274N3vIpD
         HNdSw6yQdVhxXeKlKBgsm9Z3SgtKvweHosbmt/suhE87DuOfRFryQeULVVuMVFcrXMKe
         U3VfhxWSj7b1hrjJ5kEv/5Xv8TD5nUMNCT30TQyEm9TP/zFS/ERUj43lq7vCSM6AFs3j
         wLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968402; x=1794573202;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=edn025/LYw3ytj6a1I7v8ax20+2ljCy/+E2aTr8xOMc=;
        b=iheB2LaULIioNgZwgwRzQwYyI7p5ZY7euk+FLR3OHjuga2g12TPPkVq39mnXpKyjRZ
         1/5FuwN5Vu390v95jngF1ZRx60KplfdC0Dk8goA6sOSgNhPn/5oNUfoOC4oI3DKj6CUC
         /AHyvwNbRKhpsBMY3L8E7zzSDvML3OkcQRnor0WcH+9DCw4Pc4fTIyJEbPwYXDLb9qzX
         cUkpGd31mPUIR5tddU76vh6X7VSpPzO20rkG171uz3OEaa2VabbVdYTRFAexh5Jjgd4Z
         B7QmV+3DEMwL322+5ceChq3BPxUjmvs4XtiCk9jGrcmY95qY781D2W9SdaCWC+Kd1+eQ
         A56w==
X-Forwarded-Encrypted: i=1; AL+hErHlUxsURu536Mj+td2ZlELPEzrPfCuXNKPl1QbLb7HQ/nT3iuSnnX42T2AlCpKsUoH9nsaBMd517aHQ7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9xpf0LY1BxF4KrBOWqZwqraRtxk79fkjrtOlhyKhwTJT4DZXEr
	hAqBoKhYCxxUUicHaqx4ZxJrN4DPIZTgNGpagSq5oU5W2mgxSkCH33nX+oKkjnguycUq73JHXtt
	JOEP+T5JWxJ//UZMpbbT68Os1A5+feguSULQAUfbQaT1yJSr8nQWNDdc/YU2hUSsjgA==
X-Gm-Gg: AYBFou0bD1yCer9sPgJZxKw0jm304Gcfk8orz/UQArlzfv2RYE35bHcjVE76x9FeLPT
	pYqTyoIHTB0jRmKBYWiwhaRWZXhN+pUIfbUpEt7iN7tc116W/4VqAbmN53XPx31akMmBgGsgIVv
	Z2Ozp8v3XeUvhzjYx4dNY137ysR9AIAQnGf1YSKF8pER7XqowzFRDCEBymz5qXlDUTPQBEz9N5V
	zQQKkU71OhsnF44E7fydgxPpmxcr7IdOo+Mh+fygv4BzAAmNXy+kYN+2WiL1Zt0J1UTB8Mi9QWl
	k+aTBdGN84eThaeqJd6Li2W3re300YTBg+XQZzrx8I5WebV4W1HQv5rxKZWB53OiyfEKGg/0H+e
	036DKSZlNKvWFsCqHS1j/qoslVfcvuSGjL984tg0tN6hIWrvYG4OWUe+iPo4rkl0AHjBLn5Iftf
	TaVrHSsFwh
X-Received: by 2002:a05:7301:182b:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-36f7641e9aemr3044087eec.27.1793968401765;
        Fri, 06 Nov 2026 04:33:21 -0800 (PST)
X-Received: by 2002:a05:7301:182b:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-36f7641e9aemr3044051eec.27.1793968401066;
        Fri, 06 Nov 2026 04:33:21 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:20 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v6 0/9] ASoC: qcom: Add shikra and Hawi LPASS macro support
Date: Fri, 06 Nov 2026 18:02:59 +0530
Message-Id: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPvI7WoC/22NwQ6CMBBEf4Xs2ZIWag2e/A9DSKGtVIViFxoN4
 d8t9Woy2WQ2M/NWQO2tRjhnK3gdLFo3RiMOGXS9HG+aWBU9FLQQjFFBpFIN9vbhZYPLNDk/E8V
 bKcvKcM4LiMXJa2PfafQKQUD9++HS3nU372t7qrc4O/9J5MBSNkEo438gTTiSKEpMWxkqxEkLV
 l4cYv5a5LNzw5DHA/W2bV9ub2uI1AAAAA==
X-Change-ID: 20261106-add_shikra_support-d4baa39f4442
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=6697;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=q0m6LhhAS8YVHU1g2EoCoxmxufiKL9BK2EWh1X8mns0=;
 b=6a6GFvDGOPT6r6VrgJt+8gVunH9bTjdJtq37rXohyNgxTY5CITFaXPk9Ixb9UhsvefdY30500
 txfrSTSAW0iCF3e4z8oai8RA1FqVq+8F3fLPcCKR7rSR4L/K3bWiKNu
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXzG3LmnFblM1J
 CSXXqIlBh9g0FyquSXlUMuBvMkDHEwr19PgD59FXDciYBQ8ZLgS+bRXNeeyfkZ1d48F3r1tLX/M
 fmrCU5fkmXFBJ+pCyB/vwB0cjqNgu2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX5aVyKHQu9OVR
 Zzre2CP9jqVFq49SnPLR9cqQR8LJGBCSyIsyfVD8hq+OeIPryvPG8jUmSNO4LlkkNg1Nrm9VP14
 BnuHZbG1Cv3eYUZArJKFYV35Ryp2kgDvP9T5ikfDWqF6aUPjSg6YUI/uL66K5Hv859qOppnS0zw
 y6KKe9jR2wrG4CkBQ9mUV96Vi2OLOIvYjish2oc9NH6xpLQBkSmilnJGrx2qHjI/7dknr+mAUPR
 9Wv+YIIKgxzRCgXfnr05MODegUe/fvaEQa1MlGrEnCjWJwic7CH2WcM2kx0HGNs1UVbGPJTngUe
 690FxaaH6zeqNWF497NQrUs4OOLjilvZjJ55yt9cKYf/arOAnw6wSGNZTVs9MsYAhifSF1nNN9r
 X7X9pvnGK2nwv8JMMingZpdNPw/XtLaLUjuu8euBhdppY7xhDHikkv6o2p0cYIp1dK4g3Spix8A
 hAxXJMfnuJQTc2625Qg==
X-Proofpoint-ORIG-GUID: t5L3xbNlVwu-Tsum6Ff_ggkpnIoKKCKl
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedc912 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=sKXgnk-ZSZCjcCUwTa4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: t5L3xbNlVwu-Tsum6Ff_ggkpnIoKKCKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

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
Changes in v6:
- Clarify the LPR vote naming and document why Hawi uses a standalone
  compatible instead of the SM8550 fallback.
- Reorder the Maili/Hawi fallback before the SM8550 fallback.
- Link to v5: https://lore.kernel.org/all/20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com/

Changes in v5:
- dt-bindings: rx-macro: drop the redundant clocks "minItems" from the
  shikra conditional, it is already set at the top level suggested by
  Krzysztof.
- va-macro: shikra: do not hardcode the codec version in match data, read it
  back from the hardware and cross check it against the registerlayout
  selected by the compatible, reported by Ajay, Sashiko.
- va-macro: SoundWire mic: do not let a write to the DMIC/SMIC mux that is not
  part of the active path reprogram the shared ADC_DMIC_SEL bit of a running
  capture, reported by Sashiko.
- va-macro: SoundWire mic: clarify that only the HPF zero gate assertion is
  specific to the DMIC path, in both the commit message and the code as
  suggested by Ajay.
- Add device tree bindings for Maili.
- Prevent duplicate registration of TX DECn MUX controls as suggested by
  Mark.
- Add v4.0-specific regmap_config and default register table.
- Link to v4: https://lore.kernel.org/all/20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com/ 

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

Prasad Kumpatla (4):
      ASoC: dt-bindings: qcom: Add Hawi LPASS macro codecs
      ASoC: dt-bindings: qcom: Add Maili LPASS macro codecs
      ASoC: qcom: lpass-tx-macro: Add support for Bolero v4.0
      ASoC: qcom: lpass: Add support for LPASS codec v4.0

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  39 ++
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  23 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  40 ++
 sound/soc/codecs/lpass-macro-common.h              |   9 +
 sound/soc/codecs/lpass-rx-macro.c                  |  19 +
 sound/soc/codecs/lpass-tx-macro.c                  | 576 ++++++++++++++++++++-
 sound/soc/codecs/lpass-va-macro.c                  | 434 +++++++++++++++-
 7 files changed, 1114 insertions(+), 26 deletions(-)
---
base-commit: b53be9121a651e0b0c524a24b7238f56f0f6f28d
change-id: 20261106-add_shikra_support-d4baa39f4442

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

