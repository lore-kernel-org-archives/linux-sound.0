Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775623;
	b=kD9HytnXxR+KPc2Bq3D+WSxDGoGLKpbJB17FeHgTdoGpWauDUko3C4lZFOMIf0gCVYlP
	 VeOAP6LAUfd0vazsogtdTtWEr+Jg2ZZ3DsJqneEVykYIai/VXC9vl2TcUijROe7XIYPBY
	 /GpRUeQrO6iXkhAEDrzzyzWWZUcdjbNJmPV4hh1laLqartxodPuD5PewekE+myUHjMxSY
	 aU/CuOQRGnf/+1AD9sAYADHtzUu82Q2a6xtgaZxggcqodQEfSgupAXLWLVl2Zvxo//i19
	 2b1RM1/cHElL74uZ6kEiJqwdO73kNE3G9FwHUpvgE0ohDKWAvPkvhuEKLYeCFfFcCPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CUrQmn/iwVmB5LtqJVz7lG2XrRhl26j7ewBang1CM10=;
	b=T5KFvZM2fsLfDAw/cVREC2iyLbiARHZE7lcugmtGiwSVrJP+GfO77qkJiQt2FzVZPDoN
	 /lrMtGGmCDZaXj4jfFhWNAqmy+urDyQ+SaAxiJIW98hi6GPJf6QjDe00vz5NFRZeCQBBx
	 U70jgbjogLeUMxmqCKSH6kxf+m4rRuCEpIONtWkWy5/X/RenfttWWtjYeXp8hl20OAKS6
	 W5R2aVxwerf/YwVTUVYKJx9vx0LfeeIT0O7dajyDlXbS8rWmsd7JI1AH9O1mNik2fPrj4
	 S+wKW7WsWT3+iSnCXaEegd/NL6yopwvyfa++NJqVehQuvtog2J8Yf0fhisxK71IwpBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQy3lzNN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WdhkaLIb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5903E606A32F
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5903E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQy3lzNN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WdhkaLIb
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG2wne3733912
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CUrQmn/iwVm
	B5LtqJVz7lG2XrRhl26j7ewBang1CM10=; b=PQy3lzNNYhVdY1PYLfvnG7ooPAz
	CQqsiVkuSvXDBLsI7btGce8Lo+Fvys02bFRioBMXzZ1GaMe/Gd/32L9AAKyC6e4g
	Z1Zl1srJd7iNdCK17MF70h0u3XFsJNu9uOgLQ7D+/kTZHfi5LZsmNPk/Yf8KEb0e
	7Sd2YwUbueX5d+6Jh8QtUczhyDCUwzkKAjQWrVAZ9arigq7Er7bOhhbwDwAVGZQx
	K2wGtyrh15gN3ryXeTbBF/ddU4BsBCTEPBVZEVy6qF6eOqIu5XBTjGJWFKTTwfHb
	T6WM6JOFN4Ot+f84SA7XQQQ7zuZfk9tU3Ez1Hfb2fWzwG2++hgs6+zoaBvw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug8vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso191565885a.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775621; x=1793380421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUrQmn/iwVmB5LtqJVz7lG2XrRhl26j7ewBang1CM10=;
        b=WdhkaLIb3JiTSpgrhVaOA6zM6k3Pm2bVairPnuYOoMPJb0V+jl0EbFX0c9TO6FSmsf
         n7V62zx9comt+aqf66Jq5ncuKyElhOlXP2sdl/ey+Q0dh/w4jKhn0fNquZvOzGlqgX6U
         QTh6Xp14BahzCz9O2SozLbZmyN9Q2HnkLDV1VzTI6JhbB/+LC28G2TWBCBSi0Y3+qQSa
         GKabtKsgixczIYjnf36uxAAwbUeFfm4w9G4vfMoE6Od0/dPALqrUtXqRAauPS24nmPrr
         dd+at30UbyexZhQ8Cp+E8hK4OG0Ivvd6E3CGBuBG5gWkfZAvwf6pw0hkWGp7hPkcVVHL
         nCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775621; x=1793380421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUrQmn/iwVmB5LtqJVz7lG2XrRhl26j7ewBang1CM10=;
        b=U8yQUTIj846heg06z3FJhLmqF2FxvWVk3XKjlPf69giAoyUobPUk1oDSZb8t/6nt+n
         d7kHX/sVpLxAgzKnS+Vj/19lW3WuJ92myZ6nux+i3ZT0NPlmfWxlx0u5ohZDUCwVp4D1
         wmtqc9M/SCHlM33BU//f+dhjzEw3aOGDGUEqkXLb1nudXJ6xgUsWMDgvDK0rYm/N/kQO
         YFrjrQpYAX94gbaDvq6E/XFRLFyFZARwwqHt0VnpEfw6/hRfY86cp+pq4yEP6Oy5iFUc
         QkMkgz7RHbWkq8gi0rYXlHYAcNJx/S6fdMYBrfLET7bb7rAhzIyVv/h9WNrN/lwvepcC
         YdLA==
X-Forwarded-Encrypted: i=1; AKwUvBynIfxDKvPlbp9QrjXKn6sxgc6QtuF8Vv75Cxh+E/V2teEPMela/J3EQlG03QawgDsHVxNVzT0zpQIBoA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIBvnwSuFVuv47a54Dqz0AMHmrSuqrk/ptI9V6nIG4kQmEhA+F1
	LiTgGfqk1Bk2uyvtp3yAvP3p8ZL5Wzajkx3Mm169IXAa6gyRVKHlFeHGu7deVDCrPyBsf4b2nki
	nlnaeEtaF44t2zt99myguo/LT7vc0+AWtk5bzYUDfu90iDQ+Q2dTtV/GYmUVyjpe5eA==
X-Gm-Gg: AYBFou0TOqflaTi9uSUccKDsIWORqAmod7dwanr60Fs2OKrDiQIrrGVKbRC3fAYugu8
	TxjRKsXNfx/DaD7BPb3J3AbELwMmP/WHP0kCi0cHu7mApAO8sZQAbez/T/UunWlf/uFE5caIEDu
	bj2Zlkd0AsfzL3Du+73o2Hu1EAT0TrXb6/9UquNyigs2Nfa1NgBSJ2hLaxiN341X6fGneHLq8E9
	/3y9RJmuzo6jW67BCC6OLNNfEzrFDzmEjdywkBIcEHZ+cbYU2mmm0+cGbbH+EBkmoTUav1cFlrh
	3+Jfqxce+DUqGMpn/aWfXcWS+NH1kYFDVWVd0KDjMaE+jEtusQwmRu7oxVMOvcAYpWKWLiAWXQq
	1M3wxxJAVlvyU
X-Received: by 2002:a05:620a:4686:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93f6f7d372emr507963085a.43.1792775621009;
        Fri, 23 Oct 2026 10:13:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93f6f7d372emr507959285a.43.1792775620577;
        Fri, 23 Oct 2026 10:13:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/7] ASoC: codecs: wsa883x: disable runtime PM on unbind
Date: Fri, 23 Oct 2026 18:13:14 +0100
Message-ID: <20261023171316.819857-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1rC2HGKY4mkJ
 HP06fuJaMnwwuZAHlyUnQq7gMI4tYD747v6QP8YMqVkKVvepBSpxSJOx/WmGMDn/J1ZpEOmf1WH
 rZRTe9Zc3qka4tAW9QCHl4ZiF6l4jYY=
X-Proofpoint-GUID: BQO8XLp22DuN20Bm9CltORL_TVHlvGea
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb95c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=MSACiHdZT0qMT5F2yRoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BQO8XLp22DuN20Bm9CltORL_TVHlvGea
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX5PyaqUSlrw2X
 lW44tpMC41rydK7df+I1Dht1F5KKipJIcEsWzb5DVhxc2k6pWgha6qrpxbrI23KLMXxW7Tv3hdI
 aONbv9CjhxNY0/yK5ROphi3k8H4TUBoS/gWumhGfRBfCq83qA3Jb84IYeIRy+SjcTdF5PmIv13T
 +7wybevCKDddTvtmrJ7PCo6mZtzvJYYFfCMwe2RAD5O/0Kqal3YRdfjzjW9aecqAnPnQR85rXek
 fgCIZJ6r4pMMv7GzP61WllOQVVBE3N7Clgk98ZUR26ez7V1MDDXBJkGayvrw96lU12Bhki9lS1B
 3XM0RMPjo6jFwP6R6/kvsGlqUCmdt0pmgqmg+uzWNxmTlMIH6iKvRMBPTtB8LCcOJVYYP5nzU/a
 WRu6yDZgsTcbd0y1L2y2mOod4Pkul7Pdxsa5/o147MxhbZLKzmLS28KZdJ0oXMj58NvtucrRCNV
 SJi4xjcccJHoq7NcUBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Probe enables runtime PM but nothing disables it on unbind, or when
registering the component fails. A pending autosuspend can then run
wsa883x_runtime_suspend() after the devm-managed regmap is freed, and
dereference NULL, as seen on wsa884x.

Use devm_pm_runtime_enable() so runtime PM is disabled before the regmap
is freed.

Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ccd4404c1644..b09ee3db7ed5 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1669,7 +1669,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto err;
 
 	ret = devm_snd_soc_register_component(dev,
 					      &wsa883x_component_drv,
-- 
2.47.3

