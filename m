Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3282A4FDE76
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016858; cv=none; b=nTekc9S8CHWZVmP/k2U8fzD+2Vychaz+RGk6ewK5wm/ib0e+Ed5QU5uIpKyT2MrmA0H9c1p4N7CiMjJwaOyR0GBGwCeBlmAkfBRC3JDKxbKumu4CniwC0E9lo006q5NQL7HMb8mVyzKt16JvRsw9p82oP5tpatyRJ2sLjvcmGkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016858; c=relaxed/simple;
	bh=3zPDkuCDmQ38oUL9/eF9wJT7+qJydWJzTsR5SSVPT00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AbbhS+HtSi3J/of023mfbH1w2ks2YHSSUKxl0w2YPJozWOk/DtIYa5OnzptSNUfpEl7DDJdzOrf/UZwrrmEczKR6mGgx4+O2vCM34Rf/rNtzsuRAx23Lz6Xkfqi8aANw8/ZR5gQTvRdUIN2r9OrJiP2fBFdecB1eboGMZt+xhK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msN5azof; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d888pvTU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msN5azof";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d888pvTU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHKaeJ1821782
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 18:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=; b=msN5azofTke6h336
	QEV+s3kXcsG5zyUzCo6sIk+77SDV80V2Z24aMOoFwVI87c/y6QJGSYK90Ie1kuqV
	J1wJnF2CirCMX48kME/JKkjzSOAyGTu0MMa46gdtSZpfJFYxlYfmgDonHtgkbvP4
	9YqRbuLS0El/3c8AW9NN1RTBWR3ICcbwsD72e+XJ3orAqg+f4+miLcnMeN0HDGuC
	C0fUzizQybk7dA/B6CKJkwPqF3CIkydM2kBZoUH/a3UUg+sCKRanDzVHUXO/dc9Q
	oVyIQd544EraUHvNUd6LJATnskxy8A1cQk33OxyJB7ZD8DNlFRRKTEBfWn6EDCGy
	+9PT2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w78bmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 18:54:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso5887960a91.0
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 11:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790016854; x=1790621654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=d888pvTUDs6PjuSoybfrxkGa5V4gABlsrnOzs3kcmQWXVLri06aXkb9nsnW7j7qKDL
         08rCbrXQC6RMz7+PJdyeE6cLQ0erakJsXqRt2k/HH89oaB0AfXYVqSnNlWCHvQNqgDD5
         MF8NIq5OHA1LEjim99T12JrHmbX4NdfVb5vnJsejN12sT/pZPOz8TCuTBOGTCkDbIEAK
         dAOUNj4Hs9NDihj9WjIsLtV94SKqWwwSl3Jelbl6eIr+vcbSBGgAH5fJbHihsdrVPRNO
         QeDmxvG00kPu3Q+RU+7Pzv7vjzjQHhYFE+RGiBLuhTlX4SLSGXY9MjQmjS2yYtSfg9TU
         pDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790016854; x=1790621654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=xpucnJjrBrrtsAAuVQLfcUGzYk+pr5sGLAsFG4bP5lgxpHXigQfmzN+p2vOm7BZq7S
         mix9FTVX/vOcQG0XCOZbuqzpihYUGtepU5G6ITWqI+MHSxVokdJwVkRWp6VVq+Q/pJHB
         88dxJ3Q2BMU0pxN1APUyzSOw7TRwzp3rsy2eR0tfexbFR5JY27EnFx3HICMOjxydC9hc
         0uCsiaoUsKTrH79GhYbk9rCahPl5qvfk4/0YYWMF5XhBavY+JYgj03m4cWBdXpXMUrIC
         sZEXDGntUwf75WmVNydUK/6HyZ+HSeCBJ60UajUYEY8xVVigFc9yq7wMF0gXWr0B7A/1
         1Wlg==
X-Forwarded-Encrypted: i=1; AKwUvBygja7g2x3rtwYIvmPtU9xcPoT16QVUKLKbDxaii16MRkxK3IRPRB4uqH6bL5Qz1IQxMj9sooTOwOOsRw==@vger.kernel.org
X-Gm-Message-State: AFuF++mkPkN9WJTprNJPm6NvGbB7n4CE+MKf1ErLcVI6xCO56y4xW+2X
	F0yf4WmUfG1lDXza3pzpNYF5hZ0dSEYroKVvTGoV8oQdajzhCUL75WmH4oLXcA58AiaxQ7g8XAd
	mFpjKKrTn+t8cygZmIKJ8LyQB1DnAcVNG5zHImxMJH4RYKKhP3G/tFmZhz+RYlukHQw==
X-Gm-Gg: AYBFou1OcsqaCNi/1Fj6WqLhUEnOikJ+gS/lp9WQix+sWibb7wMmO4YH79im4orGKbq
	mxQ3BqeePLh6VgO0S6oOvRD8O9MSZQQoitYgP2ZK+uFtwrQzvxSVCCeQtkUQcbXPijUpjDSdAXA
	FerP3oLDC1pBLp5jCwnEljJeEz92IlZdZ1c2YbsKO9C1wKNhGs4odTklK9/TM1EcUoghJa6eVLp
	4hGU7XS4AkWrdnwAcdpFZp3ao4+zrWasZqEfY8vtiCfUs3jDYxKFtxleeWXIbnJ7vHhMnYoDLTo
	o9Z9v9DsQt5tytTLelBWRjXHiWZEl1+A4RsWKnpjXJXBoL+M5AaBmXex/y7UnxwUxfa3w5rU0Cc
	oEhOXLMxEBCxLx6oHMUs5AR3kqzQ=
X-Received: by 2002:a17:90b:288e:b0:3a0:2ffd:1a51 with SMTP id 98e67ed59e1d1-3a02ffd1c66mr7699754a91.10.1790016853985;
        Mon, 21 Sep 2026 11:54:13 -0700 (PDT)
X-Received: by 2002:a17:90b:288e:b0:3a0:2ffd:1a51 with SMTP id 98e67ed59e1d1-3a02ffd1c66mr7699722a91.10.1790016853470;
        Mon, 21 Sep 2026 11:54:13 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331433besm33696755eec.16.2026.09.21.11.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:54:13 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 00:23:45 +0530
Subject: [PATCH v4 1/4] ASoC: qcom: q6apm: clear g_apm on driver removal
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vmid-v4-v4-1-5fe21b1365a1@oss.qualcomm.com>
References: <20260922-vmid-v4-v4-0-5fe21b1365a1@oss.qualcomm.com>
In-Reply-To: <20260922-vmid-v4-v4-0-5fe21b1365a1@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: x6S9VEzbmy4ckmCgEN3iITbAL5LiIhBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfX5XoHsoPlf8Je
 mKll6lCz+hcd82GhFvfyPSzifyUr59WGIbjHROFcbzzUjOvXXRFOZRtY2DzKcgdv4oEOwZan9Wf
 qoYRIIWQnYeuJFYIWMoqR/PbyySMPs+1Fr8CR7jZe15VWAF1KCz885SIiiHPK7lzDclChtzrmrh
 V9Ys4cNlOkofXZbYaZ/AKw726GB/3CfG8czz4w+JhHiMTYnnxi/laS1sMXxOXPiqaHOaHUvWir8
 NtbACc7OaPfrm0tVjYZ5PqwKugqiaSyCihPA88EeHyCqaWWQufdm5ttEDsilCMcD4Eym5KJ46is
 HMlXxMnsFtI8FhJwpP/GaRi86Qkhdaol/ANp2MQkXvWG4beJq+IoC4HxeuiopZH8leJnMGrdE21
 LuZEYciQN/4Fx7sp/Ia/XSQsglSjAwmwn30SHrNp6GZXQF1JKht+jLyjTtB6qNliNOfvYS1pWcA
 NMzFzoTZbM1OKlk2Ohw==
X-Proofpoint-ORIG-GUID: x6S9VEzbmy4ckmCgEN3iITbAL5LiIhBj
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab17d57 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=i9zpEd1wrD5FINdKp7YA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfX0nuluZowratJ
 sfayRCXo0Q2t8QoapXCjhCm50q6EXgmcxFiZ84U3lAGR/gUQs/iJriR0M3cnxInK7P1qd73fCUZ
 LhMZST3CwvkfMyt6stvux6uOMEL9t8I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210276

The global g_apm pointer is set during apm_probe() but never cleared
in apm_remove(). After the driver is removed the devm-managed struct
q6apm is freed, leaving g_apm dangling. A subsequent call to
q6apm_is_adsp_ready() dereferences the freed pointer.

Clear g_apm in apm_remove() before the component is unregistered so
that q6apm_is_adsp_ready() returns false instead of triggering a
use-after-free.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 641d6d243229..12c6dfe4c58e 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -894,6 +894,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	g_apm = NULL;
 	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }

-- 
2.34.1

