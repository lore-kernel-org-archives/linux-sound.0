Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBC029B8D3
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283785; cv=none; b=AAwoP7UYFXkYlbUbzMPLEMyZEM28aPvTMDhp9znBY2gY+gO+cO51YtmB29jo1i7UStjJnXw+VlNn/lohxuGEasmIhbHVogAhtsUt2LLoreEDry88mzsqyrN+T2rAv8q11VH3ZFYLEYtUeOuG5QAZhnq1w2grN1NWJbKRMDQXRr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283785; c=relaxed/simple;
	bh=G951bHOt3zRWlDUs6OIKgea/UzV9atCtarwfJQDrQdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZX0e5Fn1X9qnsknexEymDZQTrC0Ww9ipKisR33ar8zjQMNHp6cxg0QDcxvZoJvkvS00XwfO1xsMsDKxeUQXbhf3+ScpSIDkVRyOi6qxJdk2g4AzKkJZcSv+nYqeJKgySn7t8U6KlbmMlDv3N3QfTFFuKbqnxXt10cy9XwHw2IM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H35p5m4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWxTZ+6k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H35p5m4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWxTZ+6k"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9ocob1178288
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2izcNj1xZ0p1yofZU7zInuq1w3gym7l3w+3
	PyLHbXUQ=; b=H35p5m4srJzotebwEjdTTpkORh0ew8BMgzEnh21axS9lwJfw7Ky
	Ri85jmdalPuP0d+0lzR9mfz0fdPQDnOfD8AXIu70nk4ljzltIQFfK9tMPyVdUlcF
	Roz1j+9k/Y20cH3HmrJuLhalvOxIOB8n/MFEoka0MI0UcNSwnjdwg6vTPWbUrFBX
	yTrgT3MSsZ0WIwGEP/c0SZA9vs2ZuqERIstey1veFV3C6Q8YQ3RUQBj/PmG7AWKs
	DS8ahnIZnmqpinzBb82IRhDPqDx2R920H7eFKI5Y7rRhggA27n+JHB5m+CzFxuMO
	O95M3RJzxDyarHIZOEIbRkX2xReVcN8Yy3Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6rs2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 13:29:42 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95ccfd9b58dso7795760241.2
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283782; x=1779888582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2izcNj1xZ0p1yofZU7zInuq1w3gym7l3w+3PyLHbXUQ=;
        b=bWxTZ+6kP21oFtky03bPVIsdzGfWWFIgcDFAgPp1T2wS4sX1IzFyCbitmELA3OVjSO
         gyviZMDxq9Y8kU81ayo/juE3TOh1E92cgLKRxdKMvd6pbpoTMB6AarFFqlZNq1WRo7Lf
         pcMe9WnKeqbJLsb6/93TVI/Bn6/+CicCln9lGzJBpHqSvx+PePADJdIMi8vDD60ZcrCD
         cANGZD4mFImhur74mVhWonqjk4ovQePo+A2FT04H9Gu0ieZXJQnyFR7HWwmvyAJ25HRf
         0eYQCoH2h1h0V9ahfH1QuugN64j9hqYEaQyflye77kdKqkgTo2uRQei69KY204ddKCGh
         N3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283782; x=1779888582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2izcNj1xZ0p1yofZU7zInuq1w3gym7l3w+3PyLHbXUQ=;
        b=gkUf5k6hWkh6wz0hpOel4QyotWajQMhMcKEVzLrWAwhSKPfTkrLUIJwWiD+JQXrgKe
         8FixtXs0UGFU9FPWLwBmG1sp2TDizyR1U+67qMMhA07EHvxl8L9vPuRm3mNR6mvkILO3
         VJHv1KanTrfrmD7FmnOMSRbwQmtoAEz0UM8De84QLu3hEzG1CN0xxieVHgpPFhna/fg+
         l5PnfiGVaI+NMubPQQtzVSuDffddH6QSUmIe5U5Zi65DsZ/3WY3ajD2OGXadzWWgVboJ
         bS69TdVUZ3WhfWY6un7ToALNKVGNG4fF8FD+s2TeTcFtTmAg+FumaNj4PV7s7x6Anwny
         kKrg==
X-Forwarded-Encrypted: i=1; AFNElJ8loa5M6LW+uaEibicrX1S9EZKGPZWkIbVI7W0pfjyip9DuMuxFsDPKWtfq8yle7Vy9e4E7vJHuR5j9uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+g/lUlcNsvjaqlkfyrmGH07Sx+rPlkj7Kd9ppgWHZ6xxGQ5+J
	Pjn+hHy9aoFHgIKMXAJjz1DT8+ysEXt+eVJMnXSlWs0ygOUFpeRWM7LNqridW7jrBzwgumN8D//
	HPUh+8xgCINJvj6+cePh2i7O5p4q7OAoRBthkj3O641Fy8jbOoNX4zCnIsq4J1nf2nA==
X-Gm-Gg: Acq92OGkQTdJt49mytyvO2ubMm0mvANGDJXpDJ+zLjwTVSKPITQPOIlpI9oRpltbM5L
	uIbTQBkHGyy2DqDpz+NyF4RQbtxmBk6UP/PS79yYFsmxflTKjIN4Ba3A0Ej5q3v0Yy+y0D8mdZy
	DAYhD0NSAJQQsb3/MISDSDPQH1tgFgwOObD/lS8q5guG43+bUeT3Qq/OoI9khTkl/ALh3JvJ3IZ
	1tId+9hUil9EHNaVUiyWIiKf91wtjl+p3UrpMVrFYF+Fkb70Ktlb0AD6Y1hHYhZtYTuNR3p+6kw
	ZtTSB6ecrGbrKpnvxxr+O2y1i42xa0fQfre42U0GWo8A+at2iBAHa4k4I4V+TyhF5P6phmE1O48
	fH0JHfrPo5YOJOMF5CEt0bwXQ/RTTXUUE+WRkC8TkLxIMbq5Vx2FPaAA=
X-Received: by 2002:a05:6102:8644:20b0:650:9174:f0 with SMTP id ada2fe7eead31-650917426bbmr5562505137.19.1779283781914;
        Wed, 20 May 2026 06:29:41 -0700 (PDT)
X-Received: by 2002:a05:6102:8644:20b0:650:9174:f0 with SMTP id ada2fe7eead31-650917426bbmr5562477137.19.1779283781572;
        Wed, 20 May 2026 06:29:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm223771535e9.11.2026.05.20.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:29:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] ASoC: codecs: max98090: switch to standard set_jack callback
Date: Wed, 20 May 2026 13:29:28 +0000
Message-ID: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fITPjid1l5imsQOZzmi4ThZ1BvVAtjmU
X-Proofpoint-ORIG-GUID: fITPjid1l5imsQOZzmi4ThZ1BvVAtjmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX/xZp5nwYVKoD
 /WWalHG8CUHCsT8lRE860RgnnpCKRE+sZA5qGqAlIMhafJG9JBrEsFxXizk3BzBWRQKyv0XZp0G
 wlOseKvm4ICmx2UAC8T5BtDdrTR1FjmtyaE8+UbT93Aa/P0RdYnp+EP72wUZ+yc/O22u0wJuY3o
 5DUmBoRI+LjkDNfGVWk77DXAyq79BUbPoYpk+tTmUJBQh9JKzJhO8s6vTP/VQ2HLLuc3S4fhcxy
 ZF2TlAK4KrldjmZgImkP5zrcR5FR5gqIrmGZFq1MG3XLvtYqQv4kkv74cBGNY9RFVfG9apvpQWf
 txOJKsSZB9ymI2k7LFn5nWU2mIA+OXAWR3OJGwdLVPA1NdHLM+WT9dltDYQ1k/QgLauPUft3w+E
 eYVhR1Oe6eNQCim4Nv1aQtdzrEzG8izarUgWCYlKlCI/A0HgkIsxFYk0xBEExFvIQYxZtf5njr3
 wxTPcNxWIJi5QfbEc6w==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0db747 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pfRRIDRPQivS3abtoGoA:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200130

The MAX98090 codec driver currently exposes a custom
max98090_mic_detect() helper for machine drivers to register a headset
jack.

This series converts the driver to use the standard component
.set_jack callback and updates the mt8173-max98090 machine driver to use
snd_soc_component_set_jack() instead of the codec-specific helper.

Using the standard callback removes the need for a custom exported
symbol and allows machine drivers to use the common ASoC jack
registration interface. This also improves compatibility with machine
drivers, such as Qualcomm platforms, that already rely on
snd_soc_component_set_jack().


Srinivas Kandagatla (2):
  ASoC: codecs: max98090: use component set_jack callback
  ASoC: mt8173-max98090: use standard callback to set jack

 sound/soc/codecs/max98090.c                 | 10 +++++-----
 sound/soc/codecs/max98090.h                 |  3 ---
 sound/soc/mediatek/mt8173/mt8173-max98090.c |  3 +--
 3 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.47.3

