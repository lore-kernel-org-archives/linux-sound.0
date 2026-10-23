Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775877;
	b=2XjlmIzLDmCov7AA0MxIEmnmpBJV7blFD2wHIzbO32hPoAMJ2DZLBhbhVzIyrZJsjXyD
	 MUSKO5k1a8vJ4nNYZ6H6JgtfZgJv6mQ22XijpyOn96u2tSGLtnx79hECoKU5wpReDjKOC
	 wMDPHXL0DDgiczkG9nPC70P9+57FuEMsqAjOzEe7fWkNrCAfG0Jpl2ChukMCd3h0OqHWt
	 hEwMrTaRS79JbJdiJ4L1OJWffXZtIPKOFEjiXbeolBxnDglGydqzbuxXEL7RYew9yoV6J
	 9j/s8Ynr18ZCBCdoO9TETHjEU1/Ngvl9Ky4PZvtaAdGAw8P0oU1cQ8m3L6ulhvJybsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
	b=XWgLper60BzNKqY8RvaXkZDMhbQQVV9ZJnkLAAUzMp1e+eBercf3eMiV0biGDuFpaROd
	 P4N+mBmoMYrGPl03DSvFX1M8c7jEitIsgSemm5/RyqmOolRAAbwvefaC9Ab8dvPAbrjCX
	 vFa7Kcqos1TiwfIx1fgksA0twRZ0LXSXITocFpuEK502/JKRZO6DkFKb1niGPJvHDZ2RG
	 8TCqCMvNxZqaQw73iRaEAy3EgQUaGYBo5pztv2Fi8qRMQfFvo5NpWrcfmbjJMD1g8ETaO
	 MT+eAnT0SZzSsz8YNC02K7jdqkhb3CK6GDVCykNAaNGOQb48ZE/mTqqOseBwPVW1MBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i2U4hhB/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeEMfGzc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9843606A31D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9843606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i2U4hhB/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeEMfGzc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6q2m3001100
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k44WZ0y2BjN
	G6OHV5lN8787fSShc67v39pliE/OY8Zg=; b=i2U4hhB/VXBPwwFTdMKtAeyEP4b
	db0K+zAm99lAe4dN4O+Mho+bRynV30T0EeMxPx3IqpuWrfro5rKzgWAtHJ9j68ud
	P+H42h8cazW451uiTZTxB5tLz+kcEK8bUU0mKxkbTuK+uhhpBkBT7KPRNEHGDPTM
	CwBQSjbD+ZxOxeRm0FCwU8nn+/ehsiarOEs1kcHIsUOsFD2aOcOHTpsdf+7dtC9T
	p7nI1UjHH5XBzZoIZAaVtNhU8c3BUdnmfL54bHx3avq+w06LG3HkBoXhk3n9Xl6V
	jq8Ag2oD+hg/oykT5HBbGVsF6kWp568ObpOHXds7+9qATALopz8KvvMUhOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn14f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:17:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so227096285a.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775875; x=1793380675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
        b=TeEMfGzcqO98vG0GPuPD55MCkwA7vIpcSwzQ11AQjDzbp08ypEDZ/dw+B11sqHjlvV
         uyYkd8qSZ4e9AMbxfO21MG9cqkhpuoWHlYVxgplnGsq9fFQlW0PjO4xDyUmB9bOMRZJF
         tbJjcY6lhiEx/u9IbAtUCknbKOWefxqoWTMwfrTuL+KzPS/KkkezCy/Nzx7sAievPrrO
         KzRq9puwIaLZ4ckaczrFXrhYPqEwl0sG52immISiTvvGaXWTEol9DkHu1DIlzQmALYI/
         UEuNYTEoOAN3p3YSZ5Jro1OKqanXNLlKpAeIE4Awf8j+O9DmxJRcBwf6kEBKkJcdDmUu
         BW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775875; x=1793380675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
        b=zpD2wYMo4vtO3HsJDZIi1DkMJlBt9wi12v01C4zcM1a1cC7IbnAzj1BGuGE7ik98Yj
         W5eDBWNZfpP7RMXnghaHv4ok+i1wbsO87hHbG2O7PVKiq6o3+7/X+7yr0XmD6TO5JQhf
         dWu9g/skXbGa0hABWzpZHKva1olGOQRD3ZJxRad1Fv7v08l+k4HA2Nm3vpoE6ncfn+xi
         oUm++VfhJisqJ+r56RELuJ5Q9koLdMwhxHtUz/+P/ISBTxLJuaNAyCob6Yd0iPZ7zzfo
         5CsDS8FRDDEy1DJoz4bxECNx2amv3bnM5139TYWiVoCtj8BvK6Lq1PmFbnFaSizbXi7o
         Nlqg==
X-Forwarded-Encrypted: i=1; AKwUvByQHEjXadvEbQ4BRehco+adhXz/rraPhSmzYpmz1CyJEboQrLLmjLY3YLaK8RdYvujwp6NxaO6W/UxuMw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVd+sQRuIEyj1fIsNivqTb0wV9nq7fS4DXm6AIrqE8ca94NnhE
	LvH34cDSeqUFfW6gCXinG+B3UWaW+XlJS7jVa7d8fhdKIsTfxGFRo1NGKN3Bl1Y0tiRZNazffiH
	aSAbi0yhPO9meqWeo68Bq2hfN7SqTlGcbdaL+EkpBz0ybNaDREVfo6tu3yisI1olvQw==
X-Gm-Gg: AYBFou0vB2y8CzcvBTNXrPwGDY8G2gxcC8i6M2PTaa48nUA3VUSZGheWlJmfhT+ptqf
	WdjwSKIRPvDQAan3+D5Pr0Ok/B/m2QApcF9l8gmTbQXHR9f6uOOcROAJVPbkp8WM6Zro8eZ6jPC
	l8MuF1VkeSfCoBdb2YdXABZE5kuFdRXt113rDd6jHOJ44pyR64tfpiA4BpgaCSRl72hLNl1LWwE
	Eotq0vJiXWzf3XWilaQI41x/K3i/aQUV2CGuise3obQX+FMUWa9XWbxEWI8nIrZKSpE+vNWz3uM
	4MJhcL9OUdhu/Bcnxgnj4KHdl5BHUDTjeAFNeiWCaM5ZW9gOqnzE9w0LBsPetAptzfKdd4nZ4YP
	y2qnHB4xI7PfB
X-Received: by 2002:a05:620a:17a3:b0:93f:3395:53f5 with SMTP id af79cd13be357-93f627ac9b9mr960273185a.34.1792775875164;
        Fri, 23 Oct 2026 10:17:55 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93f:3395:53f5 with SMTP id af79cd13be357-93f627ac9b9mr960268185a.34.1792775874548;
        Fri, 23 Oct 2026 10:17:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 04/23] ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
Date: Fri, 23 Oct 2026 18:14:14 +0100
Message-ID: <20261023171433.820092-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7Mslw/x62oM6
 lZ6mqnVXrfI5BDOdBmKamI1SQ/BbdzFuvZ5VBmJMnPgMM2pGih8HEbOqaD2efXrgakArj7RjPXB
 5E144+hPFMF+Jb2LHLs9Nf5GOzq04SV5zp0DrfZLLIKy0PgWV1S8dV86QACbitq+2lr40MleuCL
 FIJevnOGVuhMHCV7lg1b2OPO2f3mgGdLIOJkzmYTgOGXy4Oi3WANu+xlIniwYlRiWLmGcHLs8M1
 vmjYrgv2D+/ynf1G7mbs2rm+jFqww+HM5dl6LB2cvmduZgHUVkXmWYy7IP4eFLI9FUUqJ0NOKZl
 D4qLiKPP/8b4S/bD0MnNgVxoYC0Zdu3NACV93rvXeEL7DaRVya2G4zsNFKSdlYkbrQn4UfJO7LN
 lMUgo5W9hyXV/6n4GeDb6eIcsXO0z8JRBK8q6M+QGIuZRkLzmmR2N+jyyo5QLBh1mWnInQFprwr
 icd9Uv8XoksQ7TLr4Pw==
X-Proofpoint-GUID: eVOqbEfRY3grCLnkhdRvaLSmvd5O_SNr
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb96c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kSI3p4Jxhxt2vPjtXf4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: eVOqbEfRY3grCLnkhdRvaLSmvd5O_SNr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX07Qt62Ohj+2K
 HTN8RfynGwkafrqxNT2nSzDJDhe1mjgVNmlFqjzIxmqv7WUwWIuISHD6R8H4Qu1tJat0F5tBvkH
 j6z7KQEa9rjYHv1RgDZ7qa1LY1Pt/1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The codec now has a VI sense capture DAI next to the playback DAI, so
boards which wire up speaker protection need to address them separately.
Allow '#sound-dai-cells' to be 1 for those, keeping 0 valid for the
boards which only use playback.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 866c5e780fb0..42ae6d60a874 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -41,7 +41,10 @@ properties:
     maxItems: 6
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
+    description:
+      Must be 1 on boards which use the VI sense capture DAI, so that the
+      playback and capture DAIs can be addressed separately.
 
   vdd-1p8-supply: true
   vdd-io-supply: true
-- 
2.47.3

