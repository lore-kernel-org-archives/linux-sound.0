Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA844C668
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 11:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116550; cv=none; b=c01bH+llLJ+yhV4KtUmXskFCiHEpTZMhipcb0WGiq408iw6wTwpoAMl0K+thSMVRO1EI6hHvv39Jb/elMW1K/2Af4mkNoxcAJd5zIu8S71bS2TohYFFKjovWVLLY5cnIlKO0eDG/0sB8qzZI+PUm9ipphdyaBrcEyyUtYkCxB8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116550; c=relaxed/simple;
	bh=tlrqHG6Scd8WESdDMOGUbRo9WK+K8RvG+IkQ0ktjTFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XgYyq4RhtKaC8rstYe43R/G5yJaFsBHnQ4H/QrFgYNF/9soGECY780VW885osVcwFac79cKWVPaBSZH42bGryzxErZryN5QGyE6XngBgGWqsMPe4eCFTKROq4/lj4/LEpOsZaRaKKG7PuWXl4+AgYSMCkr7tuP1mgG9Wmn4MTF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQDUitUq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiireASH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQDUitUq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiireASH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBclmX3678369
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 11:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5ZbptZa375DFz1qKm2R4NvNcPPWcrq8OiKOVg+aw2M=; b=jQDUitUqiuof4D1t
	efOaOKn4ORCsNMSD/LAUWzVaUIfRHppQtbWa2m6W6lHkjbuK6kd8uD7cdon5hCq6
	t+0ytCIlX4vhLDGq8XdEhWhrerlzTDKQxdPZGUY7k/NcD/5tbbAOPEfPSThchq2H
	/cQfe4T7EzeRImBn/w6v/+0h3+haRtHWM9ipXaoaR+hQ3a/SOdd3CbOQH08aB3dO
	qUgw+4pPVu51Y/HjGvbtI25NRxP5Im3MyhmO9pkv4XkyKg70X1jFR0h+OqyYuxSC
	3P/LH6L3ngbc5Ssr1+ovOz6zIoQZMlAOPZNyguHb/kI18IUhF7VMwYx5OWYw58Zl
	9MN1BA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe6528ytg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 11:55:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so8609203a91.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 04:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784116544; x=1784721344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5ZbptZa375DFz1qKm2R4NvNcPPWcrq8OiKOVg+aw2M=;
        b=YiireASH3rkxLaBZ8KzCjLsLuOLSzQqsqKJRkt+CBdNqx8UoNT5wTTJLnOUl58GUV/
         m+XXn7YWAIE2HJ3PervZc4O0ZMZAiJw78UqO/ZolbAaG8LJOcLp52febYlSmYNmyw196
         PX8TyjHYlX8paPDa1bkQp50nSkUmFybctIJ7DM9Ydo3BkZGUwcT8lzWGcZb0c/jgNKx7
         M3CTe0Pqho1m8y8Jj6wYWW0wN6F0HBzJkzfrl68c7t7AGWAIZKvo9WtldzryQmvEgMOy
         pbry69QFH1K92Mnkz8U2eYl9NgcCPa4vO9mAfjQbiBRDBEBJl/BRfZJmUK2+JmkiOgEW
         G85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116544; x=1784721344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5ZbptZa375DFz1qKm2R4NvNcPPWcrq8OiKOVg+aw2M=;
        b=PBA2J7eDq4hruy9EZB5WtD1Km2+abRSn3aAXMImENzMmhvX/Oiddr+XOMuuyKP8rI+
         eZlew4HLQ1hwL9e+vPioBk8TT/RARCe3XC8G64qGaOU/9ftCRIfJ6qwVoLG9KPg2XOGe
         s4fcua/UDAcVRII092eY8iL2NRRptRNOYJPZwe1SehmgT1nRMpNS2Jgkcmam4F4WvNZQ
         bzLurA8NKt9eV7+pZubl4EHPQ01jGAGEIdYy5KsIY1XYE2ywajx668Y3VIJW0lkgFMVR
         ZiPOZVIDvQZ96vqugNrgnTOQvVZ4CGgYzQpE5HsXqZeD+d6BKFHf5tlCiHgFk7gyAIGE
         xGuw==
X-Gm-Message-State: AOJu0YzoMEjj2gxlL8U67331kEnZv4ATIM83JMMhz9BWbYUlTrQw9uTb
	GQxMCT9BQorhXwy9a/Q3ZbHiU+xheVwTJHOW6fkiIgJ+dG1qRLIp3+A6Oi5CE6oIymvH7Q6acI1
	zkEGkYC84nYgvg2f8D1ekwvcrFbxPtkxpltFWlcFZbh7Q5nE8U+iBJyks1vgdKHWzlg==
X-Gm-Gg: AfdE7cnPmF4bMdctYZCtGCVh77GO/iarBRc3CvZnap4T6BzZFN9bH2k/gtiYkpD3mcl
	rL1bJocenG2FSPyQXv1H9zFUfaxTDO94I2mIE4Zz8tlo8zlcDzcSGtW/r0848SmzAomD3nb25Jd
	sppodsjOkgxQumuKh60Bh+uIsJ+gxqP4CRIKgwQ45LcaKI1LJ038nKBGk8pLEU/KTdWClprniRa
	byU9oOToW1uT5SfKG3zegtwySsm1YZzOpD3KWsPp+cjE4xnfhMGYBN7TtEp5kDs0PzbUnmYapoh
	2U9a6VtJP7TTKixEpMiYKFPFQosaShD/8P2w/MTvhLIEYHVuXrL7n4QHc7ebxqvmMWv9CPaZOqB
	V4ufj3cE0oN2k8J3amGNj3KHjd5/bIYxvBoj3qAs=
X-Received: by 2002:a17:90b:1c81:b0:384:5dbc:cba5 with SMTP id 98e67ed59e1d1-38e2a01cbf9mr2556118a91.26.1784116543739;
        Wed, 15 Jul 2026 04:55:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1c81:b0:384:5dbc:cba5 with SMTP id 98e67ed59e1d1-38e2a01cbf9mr2556085a91.26.1784116543321;
        Wed, 15 Jul 2026 04:55:43 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5326c0sm870683eec.11.2026.07.15.04.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:55:43 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:25:14 +0530
Subject: [PATCH v2 2/2] ASoC: codecs: lpass-va-macro: check clk_set_rate()
 return value
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-2-16ca64c2b929@oss.qualcomm.com>
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfX2/75sYLvmnZ0
 qYmW+d6x6gdSDgNSuJznR57iiZZf0/y3W9ehGsynWh6ymT6t7uQCuDxmp/K0qJxzwv24NYdb6hE
 HEzbZm3WN2nZJc7RWQUze1suDfUE1k8YO9LOcrfew+Y5e0O4qvXC1J0KJJxvjlj2H3vNMf5wrNU
 XVPJX9d4OMOyokQpStuv4TRg7zk7k3q0j/nSQHvmCawes9pwCZ9B1e/b2u9BYHpBiAA381fUZqz
 z0nmIOD1pP7A1WcI3S3aO7ApciO8Twe7nSzsExcTvVDSbWXEwsd5sFilm7dr0YSqaMqyxWEtHiA
 6rglj7tUqzhg3aIb6dzou2rEmqItR+3AJr+eDxMdlIa+820BGDcBl0IPgGn28XsYV8xKB+K//5b
 C/Gf/KLYdGeFqmPgBnVi3XCVSQxIFyjWHLjLCFnRPBesZPI3sZ1lIMR9E83UOVG4YXduu1NYths
 PeQRegppRs3yczP+rPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfX90viZjKrK0bT
 7KelJsRQjQXPsbijQ5B+b4q6Y8ejhWOX2VYt57T+CGS2mrx2NkM9c7RvA6KVOpjgnyH9ZEPLVE9
 snq+j5TCVSDWKj+ep73K+g8SlHaUCG8=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a577540 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Rw-3s851JbwrW9yZSY0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: knRon9eXw8O9tx9_HulwDU8wIFHff8ie
X-Proofpoint-GUID: knRon9eXw8O9tx9_HulwDU8wIFHff8ie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150118

clk_set_rate() returns 0 on success or a negative errno on failure but
the VA macro probe function is ignoring it. Check the return value and
bail out of probe on failure.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 946051698420..dbc5795b9273 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1605,7 +1605,9 @@ static int va_macro_probe(struct platform_device *pdev)
 	va->has_npl_clk = data->has_npl_clk;
 
 	/* mclk rate */
-	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
+	ret = clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
+	if (ret)
+		goto err;
 
 	if (va->has_npl_clk) {
 		va->npl = devm_clk_get(dev, "npl");
@@ -1614,7 +1616,9 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err;
 		}
 
-		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
+		ret = clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
+		if (ret)
+			goto err;
 	}
 
 	ret = devm_pm_clk_create(dev);

-- 
2.34.1

