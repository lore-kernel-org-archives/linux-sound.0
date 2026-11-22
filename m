Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364099;
	b=MZAufnzIycpR+FCTJjRfR3raD7PGUV+6J522EPUqcNetZTluMf8fjQdWmnFvor245ilW
	 iF+mPDyeneX/R1R40enE1o/pwA6/7KZcX9RNz624TsHRL1X0okQAdHZGhyzURcotPFf6G
	 B5Wh7aaBykPi8s3cwRk0Pk2he0pXSBQ+zYr7qBAkMcmPWsX8jjSxXMfzYx14i61VYnRI8
	 aZMTZUYko0qeF/xgUC9Rn6+6jpuzylycXZbUCPw5J9alUFXXGma7dEQHWqmPoR2lyuuqo
	 HZLmrlVGJpGl7MsxJ6Ll2ny7xYv5NS5gn06Avf5PE/Pf7bdYQs1YhOibUKh9sTWUeLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364099;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
	b=A3aCZooGPhY9dzTSOMUcWV8P9VccOh4gZB71bvvU/OQn3dwdPrU2NwA38AoQDCtuyrxP
	 qWwbp1vvRu5oRvIyeGKFwOhol6xzkKA15tQ7i7aaBR3JNsbTnsO5X8BnClmUH+3aOxS4w
	 fMFWApLIqwYSTWysogqaGJqzFHgdPK3ln7ihNyMF2SnSwwdMfohjv1pyeXuG7LUfH3Ob1
	 SWOSDZa5cMPOBYCVUVuqgWYhr/Lb6zhKNmOMcpHeVzE0IA1Avjn13jrxZjuPcobMDFQHO
	 Jp9GO53CDiR/8QpgqsxcE14VDk+eLy9WPbWn9GffjEk3mN/12ybTXA9ww9QlpK3v31A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pv5rWnXA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCVDwtzr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0860A2615
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D0860A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pv5rWnXA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCVDwtzr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQ9sG1854224
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sdHfAwVsSM3
	RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=; b=Pv5rWnXAOHiOMlusuRf6oQBoUF0
	hB7OVlCxAnYy2lRljKUro/mpgAsVeECe8RggnmLu9tQ/X9NPOp6JDokaAl4OgDMm
	0bLYWY0BUWcIF6mTWM2dTXUIYsIp7LEuLImMooQBdP+01nve5feol4hEITT94kPz
	9cbowoOZ5o6xLqlWRyfXYly+B1XFmqpmfaaZIH6bUDXHqfCwSTSQUpOwD1assI30
	MORj/NWCfD1JI+Sy4/Z7WbXLoauyE7+1dnKpms1ivyT+EOraS4Zt5+heUn2f3p+o
	FJ+dWX5o6MmuxNW620OUWUrkCLImb1XAH+Rp7dm5w1hJI2mVb16jwq9Ze1A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv3xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92114c39cadso50961546d6.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364097; x=1795968897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
        b=WCVDwtzrOWwN+i89thKUuaWZlcr4KKpHIF0zmVvqXx1QCUQkZtUB7gBHJ2rBY2Qd1v
         ShA4FUdfa7KZA7yeGsbLuUxmbrdEwdYchuO7n5m2iZ30q0ym6RixIhTi6otASUwEcuid
         uELuMGY4pS5ruxiJ5/DH7pRnK/F50ZQ4C1lfBEAldMKJ1qgDbApCfLDFd1Jtoi/c5ARF
         ScxGdmYaU3M8na62UcWrznmlRFD047N0Qlu9uKbr5C6kIn5MilfaOO1J/2lfHiYJ79NP
         m/ejPbfVnpJKtocYLEDY8aO2FzW+VwqKPR6teIRJDkYRiVRIPBaY0dyuVaGKn5at+CuB
         GmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364097; x=1795968897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
        b=ywuxLB1mmkM5sKjgPloNr8eiqlIC7b/x3eobCJpjmtEMxZKiTklM2KU9HCRdcOmj8e
         spo2jcwdJGVG+ENFGYd1sE5wWhrNcfek3EAsRzHT8EJWusjUvNWpCTZMb6aof1AwEnMk
         0mJcWNkwY8N+nmCa0/6UTMpxPtyU6e09mzWhewl66RFMnJV8GOTkBnX3GTBAZQW9GWwF
         IA4/gQpmQ2aUWIw10emAX+vB5H94yYfPC+Cb2tN9stdAsKC+fNn7Qhsy9D2OSwL6v950
         dWYgQ7MfCv6UzEUZshoY8oXYYCn1mJ5BVURmMYoJSU+W2J/3VSQ8e/BfifMGry41xeCC
         4UiQ==
X-Forwarded-Encrypted: i=1; AL+hErEnX9ZW/EUA8q8Poxkn/3ze4pqh8YYH3RTGKw3JfOY9UKnEAoOlbC4LTrgo4qqhuEA5Ap4kEzRnUbEqvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+mWOLeDkbrRU46Jlsu102NIDSf4hF579k7vELzTX+MuePMd/9O
	iljKItSO3d/+SKanD5ZF1asGasuN4+Bd1WhxGQA/SfWKxGGxkUeJNjTQhYaqWe1kbB3vstDKkQx
	7XdgVNA/S5biC/ki3Y2/xAmcK1wvJC7D3CIBgICRm9T5fTEa3MYyksGRFqUqirbJBWw==
X-Gm-Gg: AZFdTZeMJWgUXimLCWhULOSUtUWYzG7kgSmuZW/Gn3dTU8v3EADRTK5djJ13VBBXfyB
	2tv1aWKYr/cpe9wRHwYLP+y6Cnp5a1kfMUKzVBvaumZYoBVcXelDpyetytor6YaLvVOzy6JtCS9
	PZo8lQxC94h25uEzOGSX0Wce88YDhPH9yXvjuLjr3DkswkPtsNSYKQpMJWyunmnrAbTA4Ge+u2I
	e0DSPKm3rRzNAtaNtg/N47X3WrMq9WvBKnFzD0f4QBzquqYwnxK6d5jyqKSnOS9eQGWPSkM3JgN
	Pp6O/GCNqclsg0s2r8SDV1ryH51NxnLUoNS/Mj7OM+eugrjn7OJ+tE39jDTBemMCmd+U84xATKI
	KJnJjF2KuKVd87W+A/O+vjZcMsDJUMI1X1cm1aM2XAaruswlmFUt0bmhsSWSqJ7nQ
X-Received: by 2002:a05:620a:4403:b0:93c:7f48:8f46 with SMTP id af79cd13be357-949ba7e2b4dmr1532058185a.4.1795364097194;
        Sun, 22 Nov 2026 08:14:57 -0800 (PST)
X-Received: by 2002:a05:620a:4403:b0:93c:7f48:8f46 with SMTP id af79cd13be357-949ba7e2b4dmr1532053785a.4.1795364096750;
        Sun, 22 Nov 2026 08:14:56 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:56 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 05/24] ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
Date: Sun, 22 Nov 2026 16:14:18 +0000
Message-ID: <20261122161437.5994-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX8Yss93i2jlXe
 6TN5ShJ7CrxCeg52W9JfBBvoE+yG+89HXdFStI6oarZy7FRv87yeHyKcXBvDj6+IFBPfy0J1Lsj
 TVCXPwHwMRVGAN6B6697Rz8BWqe6WhxUhfStPNi+yPOWgbtgDkwJGrVcG7o0yRilIkkm3s6Y9Tc
 csmnGXskxEygREFx9bRuA7DDXUecMNA0w/ylbeJLxuuJ6CC98ZrhfWqTYKrf/Brmdex5pDhfbGa
 rDZ2FnsvRV4+s+hN0jEt38sxgBJLuvaLpgAf4A+sKYjRAdxss0j4BsSPn1ipNaGKfZUlnDqTLD2
 mHvqOrJoLrrkxVn8bL6kWuxV2sopEdmAHGl7lstjH+EUO2YfyTQz1rtn1REiT+tIWac7vSEe14Z
 deq3RRaUuMWO8TX9WkItR4wv3sQtmkrKrHK9S7LUelPUhx1EJjVe2nlFnIJG8bB1Xw2lkewQl3U
 tXpoyB/cRC1GD3WgQkg==
X-Proofpoint-ORIG-GUID: o4aTbyimPwu-CXEOs5Ts9ALNjSzVgbc_
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b031501 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kSI3p4Jxhxt2vPjtXf4A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX/2TVRNvrMXDl
 GJfZwsRdlSxUZmWhcGCWIZJFwv5gcZjBh58wnSUKCAImmwCJTmId+NSK1Y2Ih0OX4djeYJscCKD
 0cbi7/MoglP/N5wYr2cEB8DlbFEJiKo=
X-Proofpoint-GUID: o4aTbyimPwu-CXEOs5Ts9ALNjSzVgbc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

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
2.53.0

