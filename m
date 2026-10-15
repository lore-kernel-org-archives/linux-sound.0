Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B495252FE30
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073640; cv=none; b=GYrnEWjVXTVy9/nyQ4Hfx4V1DqXMAa7gV4wtscyRZ4jumPCTOS8hhI5C1KLVpP0VCSBOoSLUZdzsyTUuSyWUVxpaPfCNDUTqDtfYKYglInMAGfMLBpPSgB/9Ar1HC6Ug/X9o5nCv4Fcqa6OjGQ0IZwQEGb+7jwcBmldESaAk+Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073640; c=relaxed/simple;
	bh=3mVsYGXiiwpf6viGIhH5LWtSTVWvMiajDJFeX6+lfUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJy7Zgvk0jF5dCBB1KXdiUWXDita9492S5wbuyf2Y1D/dETASYoaMkbZuD3naTeMkBGEiS4oPzS1Wa4yCBFm16ww3GS0SrBt3//uKqtxrKW7CcjPoy27zAp8ZcjOh9rN9cAvadL/vWRPyCkWwWWZ5/fKm3/NcD9dNYnFNp78z3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FptxEYiE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZo4yLBE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FptxEYiE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZo4yLBE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPeAV4100219
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 14:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78JaBiSdGdVB8tVBAmbcuycnivABKd8hEIK4UQtEufE=; b=FptxEYiErWSMJjEQ
	f735Qo5x1rDqox3F9deQ+r2VokeKuq4Fuvtiyd+4Nl8qndwULE2FzkcPzRbB9iaV
	BcUuUlR3kS9qT+80Mu9EMDjw8a8oqIisDyK/tNX7HJldToLitZpOKQACxgoP1m3X
	7NWMibAtAVeSgh3dzqpRFrN9nDT8CxQkMhKG1KehkM60xP/Sg7OXhcP/MvVnBfLy
	hqYt/ytkFfZ/9hP27TeR0Svsj7hdWYvtUe1WcnHy30Ptt7T3gyj4t5vGJ1Dw0vxB
	36aKWDtjKV1YaQsd/CKGXFdf9x7OMTvJukx7uzln1FcoDCAkKpwujjpIySo/+ydq
	Vfx3ag==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8ux3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 14:13:56 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6de6afc4ad3so2770315eaf.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073635; x=1792678435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78JaBiSdGdVB8tVBAmbcuycnivABKd8hEIK4UQtEufE=;
        b=PZo4yLBE6mvM8ageRf6Pmxl4J+3ktcSgvzpTisUvzKwWku+2ed0W1wwEL3L0M9j2Dr
         MT8nQ7YkckrIrJ9T96E0AbWK9bNZa3dtdPLEWhE53c7ZL0KxIQdPOEeA4xmiQtJRqt+o
         iODjEMl1TE+6QYaySOJV5QonfXQyoY5l43Wgt5rP1cYNh6h/5Kyra+WIAOl+14dHBc7P
         NlGZox20fNV3OcbYQGZ1OqeKZLMsrWCukeVIHrxY9GnO9m76XA+dEeKS252Z/foq8r2n
         Xn4t7PPJqPh0uCNo4S4Yr9uv8HTD5GvAsi5S0Y/AHzEzYz4mPcEKm5MiRcSThjdzUrGP
         t9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073635; x=1792678435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78JaBiSdGdVB8tVBAmbcuycnivABKd8hEIK4UQtEufE=;
        b=BVES2JWPw4gr0HYFAlt3O2O+d4wRAhWtr1doPQBejQIT5D93GiXiAAd4g9Fubngql2
         2VMg6PJSs7ukKcnH6mJrYtKSwqdYc0AkpovGiIHdCfmE4otH9Iloz1NbdOHrK2qShJbp
         LsxHyqxme8VkXHT0GUrO+Zvv14or/NUVehRPcA5bS8V2rEWt92yZuAbiXgIib5xqO5Lw
         Z3uU4JYBZM1Nc3AP8NBMgQ8PWtYF5fj9Yl0x3iVPG+feVT53L+pBQ8K091MyIeKFCV4h
         Gt9OEAxFQPGYUW/d2Xz2VPnpsGN5LQhvcWRCiO52TwC6x9BcVvlCPgm2cn7ug73qho6q
         RSxA==
X-Forwarded-Encrypted: i=1; AKwUvByEqcAMAoI/hNWU7pYZw0xY9U8aoR1CLWhxX6w1j9DCNLRkidrM6qrQ92ddspNC2K6wuVlnbIx3AyE+Mg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJGlr+0GTxkUmQ7AyO4QP6LXihwxPiGBvvuXCcY0OOfQfhDdV7F
	zYSTbQOJgFUoKFWLHqhc3iHv4h4Ea+63NpYfu5SfwZ/Bj2l8K+wFnA0cYqTL57mXUCMwkEave1z
	TeVEDREH7lK1Dj+YUUS37JCXtingVxymB3CpKUG+jgnnf0JWZPvdNwAgKuI1eRQSrJQ==
X-Gm-Gg: AYBFou32YD7+PmxI1RS3pTu4TUdU3/OY+UAhKdBSZScBS1aumzVGhmBrpHZY9kgZztM
	asw+UwP9Ke/pgavJYdaaK0sqKBfF66JpkiEqUXvd2pVrpG1PeEBE8AVN7GsfI06tacIQTN6SD4n
	j/0NQIohAcFy8ADjvfaNt8Q3NjT7R5KSrBKkWJuXnqndIbV81jtAsqBd+vpKmAr7J3nnKc99/uQ
	tPub4HPy/Oipqk56rJiOa5k1EvCjX6FzJJYMSm1Pbw6iCeaQ7dfBOmWjRhI37sjOqhS4hxU/spc
	Ygj5Ii1esLddU0tiEiYjMj4TYOwYptZI6bfgjeIKhbsHo6ZAAE9bmT0iDvJSW43Erae5zBu0xAg
	MmyJme+19tweU5Q7I09MleojWfnm31Yfvpbw=
X-Received: by 2002:a05:6820:98a:b0:6de:f331:cced with SMTP id 006d021491bc7-6ef0eec807cmr14079789eaf.15.1792073635010;
        Thu, 15 Oct 2026 07:13:55 -0700 (PDT)
X-Received: by 2002:a05:6820:98a:b0:6de:f331:cced with SMTP id 006d021491bc7-6ef0eec807cmr14079765eaf.15.1792073634496;
        Thu, 15 Oct 2026 07:13:54 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f47500ae30sm11366719eaf.1.2026.10.15.07.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:13:53 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:43:09 +0530
Subject: [PATCH v1 1/4] ASoC: dt-bindings: qcom,pm4125-codec: Add the MBHC
 jack properties
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-pm4125_mbhc_support-v1-1-8bc1212db6f7@oss.qualcomm.com>
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
In-Reply-To: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792073622; l=2653;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=3mVsYGXiiwpf6viGIhH5LWtSTVWvMiajDJFeX6+lfUc=;
 b=Sz5FAnpi32YdCHufp4Xxkua7FbY7UD6EiOne3DNpxBPmkvJYs66qg5tLz49A5KZ5Szd20TLMx
 uYeLI8G0cUtAqpfAqxkCP1Ap/5YhpoOvYOzm1MnzoQ0WztgDpVTiH2O
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX3twIXHwRmKpU
 RlR25XcWPnDbjIGvG/zZ343mJM3wMwDFFPkbhoGQR6tROmIEN1sHKGb8xunQKJgyl25VLLtKJY/
 r1Qu+PhCBZNAous45xbHzOturTR9eRQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX5xVIkaQcD5R4
 I8EJUSuB9ggINxxNyp/Ht/7EtVRRoDJAtFV8d0kkTdQEeQNzpxTfHUPraLciUvWmxzO06NF34MO
 +MZGEynOKquQJk14mlMxf7OmSzaze5pwJrHSxdiGVMc4hpVcZLLdQCUxfDyBiA2CbIb39kwtDEV
 4hgbkveIY96dDzGzU+mqYtrej2ldGlNhx82v6oRzHlEtoXH8ATbw8hyOlpAktA/nXoGsRrvrIEt
 oBdrFjlMv1PqV/6m8RayYnWu3gh+L1vMms1xGjOLgUqCUj2nGRZUY4TeiDZLj2vXkP4yRZoRt/2
 w62AjAY34DK/CzNIRpWD7yHN5RNP+Iz1DtbJTxTrpIGbOe3GKz4xEOtqDJ7kpkMm1R/3TZFMkhS
 C501E0uI0AfRcKLy3374Mr9mWnxi0clUw6S5AIGkIofML0gQBcACM1PiQIxnsaJl0tTcQnZfUxh
 y0hULjSYlZFWKTs/O+Q==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0dfa4 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TNDt8W3B58Lfao4rjqUA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: 68saOoUzrNv9oZ4VggGcYoqmtiffCB4v
X-Proofpoint-ORIG-GUID: 68saOoUzrNv9oZ4VggGcYoqmtiffCB4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

The binding already describes qcom,mbhc-buttons-vthreshold-microvolt,
but not the rest of the data the MBHC block needs to detect a 3.5mm
jack, even though wcd_dt_parse_mbhc_data() reads all of it from the
codec node and the schema has unevaluatedProperties set to false. A
board that describes its jack is therefore rejected by the schema.

Document the remaining four properties, matching the descriptions used
for the same properties in qcom,wcd93xx-common.yaml:

 - qcom,hphl-jack-type-normally-closed and
   qcom,ground-jack-type-normally-closed describe the board's jack
   switches. The MBHC logic has to know the idle state of the HPHL and
   ground switches to tell an insertion from a removal.
 - qcom,mbhc-headset-vthreshold-microvolt and
   qcom,mbhc-headphone-vthreshold-microvolt are the ADC thresholds that
   separate a headset from a headphone and a headphone from a floating
   jack. They are board specific because they depend on the jack
   wiring and on the microphone bias voltage they are measured against.

All four stay optional, as they are for the wcd93xx codecs: the driver
derives the thresholds from the microphone bias voltage when they are
absent and assumes normally open switches, so existing device trees
keep working unchanged.

Assisted-by: Claude Opus 5
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,pm4125-codec.yaml   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
index 6e2f103be..54e5b7607 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
@@ -64,6 +64,24 @@ properties:
     minimum: 1800000
     maximum: 2850000
 
+  qcom,hphl-jack-type-normally-closed:
+    description: Indicates that HPHL jack switch type is normally closed
+    type: boolean
+
+  qcom,ground-jack-type-normally-closed:
+    description: Indicates that Headset Ground switch type is normally closed
+    type: boolean
+
+  qcom,mbhc-headset-vthreshold-microvolt:
+    description: Voltage threshold value for headset detection
+    minimum: 0
+    maximum: 2850000
+
+  qcom,mbhc-headphone-vthreshold-microvolt:
+    description: Voltage threshold value for headphone detection
+    minimum: 0
+    maximum: 2850000
+
   qcom,mbhc-buttons-vthreshold-microvolt:
     description:
       Array of 8 Voltage threshold values corresponding to headset

-- 
2.34.1

