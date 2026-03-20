Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10843CCFB2
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018183; cv=none; b=Chc43qYbEqRHUjSqWNrB7eRwqQ+zd7y8yNntW4hm0QaKp0wmuDik4r1Z/6JA8w6Kvl/H2PqXZGWECvlP6Guyi6WvxRd11HT6mKClTABZSXhyttg+ULNyrg7J5Ta7TrA2VL1hd3ot+u9idVp+plJyymKlgmF3JgHPdCJ7tJTBnkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018183; c=relaxed/simple;
	bh=Fl/z/x1vRgiwJd1pRAYk5uDKCPsjPZHEyO/+LZ3AuNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCVN8UoPFfVHKFwFo7S8907VElG2WTiwLWmUKzGIMkeN1gX8LxsZf+POk3doufMPVuC3tM1A5y+IitaHrPHnmO3dsc6nNEAxx6shjJwyenbwkgyKva8M4WjtZ/AuwYz8FcKQbmISDilLyBnaZcMxFN0i1dAttH2cmJMr9U7WzPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMShffJ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N6Sc4Dd4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMShffJ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N6Sc4Dd4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KEXaWX1691830
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ngH86D4QhHS
	BBEnIjfBcEjvZR9eSdOdxegad2SenX0M=; b=pMShffJ6x/zgFCY6PFR3XFwR3/J
	Y2NRbJTEpUZVqKDPBzSJ3g35nF6ZtPuruRFo18djvgL+dsNVA0J+eD1fjjjKwsaR
	67E87l+IST3t+Fr4R378h8VXWofaMCGZNbdRXfS8jC1GN6K85iWRK++VtQA2nM0A
	PSqaJCJaiTNt+HRdjcKJxk0JfpSJ0skd4n/euGbWNrj8cFIyh3itps+PPNv1MBOB
	oefLECB7tvmsm5ZoapnB87A+KPRrQro/J7RQ/75P6hnDJ6xbLOvWjsvfpGtjo2F9
	znMy5H8Ukvd0yT0QGP1eDKNUw7W2HlyWyxQsV8JdHmYkc41/ZnR+OF6PIEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0s5d2aq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937cf66b5so103979241cf.3
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018180; x=1774622980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=N6Sc4Dd45ZJvu8ujs/mAJPIo44i8ATFjTr3lwllFyaX1e8KHs9vMAgee8p3X7h9u4Q
         cb6FfOUFUl398d1LfSplB6bcIR1jhDZ/C+flIoqgakwMvSfwqvprzWYs+x3nFbu061oT
         Wo6uZ1XFZ7euYOFbX9pm76+VjCbs0+pvMIjvtjvl9/hCTFrSvs48ZyPXTIdCJoA77Q8V
         afxA2fKb5C3bmeOwg34IzN/blijZbP4vUIrV8B+oNzpINu+Om0cZWCWDKSXp99sR5Dkx
         Viu5Ra0L49VycQtLS2T1wX0LbYKu7IkDFLEbk9Y0rMjQXC4ddnxdYmSB5cyVihCwptlA
         Ji7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018180; x=1774622980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=ewJTR6dLTQiLVB/OI1juQhoWvmP47hUQAjN27pp5+ZgobRGTWpP6W9SoVc3J2JGkTA
         WO5xDPXcbRY9wGE2A3pSOoxIOaJj6JedbvlkFUBpvQLuNVNsfaBNh88WjncjTfZgEw6A
         Lrl0vOhLCR2tQUdDC/CNyKZLhpqm92xZs7WzW6ZUXgStiKGRHXf/2c3hx8ehztw5sYMl
         pvlCH8LbUkDiHZrFhT1lUJtW6vdZfgR4M+f18gNA3AIDiC/eW92KHWpA/t//uAaq8C2w
         BWT8LP6Wo1QEYaOvRO2HVRJlBgahgBBQIa2QpnIBH0YFa7O5lBRWdFaXFoJ/vcVDO9JZ
         DHgg==
X-Forwarded-Encrypted: i=1; AJvYcCXgTUBLNt+oDXy2BXSVGOH2SNiC37YlOX+qTyBlIUevv4WS0L++zA20/e4qmdWGIkK84ZPU0Q/CQ7L/xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaSB9abEgYAiWPEv7LZNgvUcqLCqQXStfenntbXybGajZe433f
	8LvuxVdOkw1M5p+sKRY439z0vOsD7kT1OyRi2lwEH9zcQzqUDY1MypogZO30NnJPWN7vhrUpw0N
	WxMJNAisy5Mx+H9IyS/2g626xvl5H9j2Bxd5c4R0iMKWZqOozdGufb8vQHA7Cf1hzkA==
X-Gm-Gg: ATEYQzzUex13I4KtJ9P70oJkt9W1IvfZr1G8MlaCC1MMFn1jMYo+lQqqS7HbgS7RWSS
	GTFjBdowjU/PG5JFDF43N8wPpIxJiMSgTl5M3URX00HL2NyCOw/UDa6+04HlaOCrVnYxrJDKjui
	bMueLzHo6bRj0HdCPGIzmv/3vA+kPO4nBtR83jOVsPgBFqwRmX3ImBn2nIYVR5UTSS0OVu15MfQ
	fIMsqDCY6wwMnHC96xhJDob5p6QzeuXCr2UGbtLWpchzg8WjRiHhpwI4FhX3a0+Zv0AO6ramrl1
	YLCbTiP3ynS6eomWnTjqw567YqBA+PNeZPFNm32Yw94Ia2u+coRQaPsu5vuHFbwmmQV7KIH5gbk
	jjdQPmmuVzZxl7oz+2mOG4f/aJmEzpFDuSDrvTKpbkBgTxLHGWQKtxp8=
X-Received: by 2002:a05:622a:5c9:b0:50b:1ecb:36ff with SMTP id d75a77b69052e-50b37517bbdmr45417871cf.49.1774018180131;
        Fri, 20 Mar 2026 07:49:40 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9:b0:50b:1ecb:36ff with SMTP id d75a77b69052e-50b37517bbdmr45417351cf.49.1774018179675;
        Fri, 20 Mar 2026 07:49:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v6 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Fri, 20 Mar 2026 14:49:15 +0000
Message-ID: <20260320144918.1685838-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8YblMO-IUaiZbc3_bn3lt5RT9j0ilh1F
X-Proofpoint-GUID: 8YblMO-IUaiZbc3_bn3lt5RT9j0ilh1F
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=69bd5e84 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX+HOD1UzZpJPE
 WxdW8T1aw2rygKld8noJb2MczT8EzgJWS6l5p0zi1GXU1dB2+r1RZGuzUGQGPs10YwwjkWIE33z
 Nk2dtO1Kk9IJvKh7EwrArKR+GPi4TdJexSeXysuo/0vYzzOd5d/gu2PRcp45CA7VU2DLpki1aCr
 4NdIt4j+GvanYuOYQQoX9fKy/nTfkuZs/8BQQ5m+d2mfVb1OyYi7Q9KieZdXw50lpUQZ9WQnFCe
 64um7JJsLSRvB3AoEKZk4p/IrI1F42VuxO4WJrRS4EH0GwrQTRI6BPzmPjQzVlvQIKT1NEznHBv
 i4WYNvEeoMyZ5ZZFH9SjVOqgRM5OVpBGQDwZt4t9EDoZaQhycaHJ3dFJtYQMBbrEjWoaaKdzEBB
 QXG2lYLLQJ59ROW0eMq/Bn0zAaGqYDRj7NVNAsznEsttKx9Wbt7HxCzSI4uYX2z5XGNetOVeVKC
 OsdfdGfU8XolkorQd3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index ba64117b8cfe..87f6db12003e 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "failed to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3

