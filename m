Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD91A3A16AC
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117502; cv=none; b=p8spp+djQPBdtuWmKuo3/JwUyyPZbB/SXKypzCUCL9YkVEeSoAmhJXvcKaqb+6jiFn/ivkKIcS3lNqHkmzCtGlpyjays0ECFWK+Ky4R9hf9o0PfyP08JiRd8CRSZIPUzH4uSoyd91SD4ewvwUbk9DrKaqOW5qHRsOm9qPSESAxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117502; c=relaxed/simple;
	bh=BssiN8tl0qU1iQXG8+lB5lBZKyz1PiocGJtwp+eWGEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N2WFvbgGrtAjaHcVv8Kou5ngd5cER86YZ3BTBYqF/4UyOt53uyCeuw1gHQKyUFOqDDzbuLIyJOErYxDO+tnZv89w2W6c3PuekHiZ5mjbENg3rQEpt0Dafn/7fIz5P9GD77iLq0ueeO/6fLwZuHuMuhrczyHBBG9Af5JeW8GKXgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfqF+dvo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DG1X5DSu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CfqF+dvo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DG1X5DSu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63273Abi2903314
	for <linux-sound@vger.kernel.org>; Thu, 2 Apr 2026 08:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eSDnacEmZXI
	09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=; b=CfqF+dvowD9s0QhWzwX1dXqey1Z
	T9ZpC4k8ZVF4hFHsP/E1TaJbOKyDE9GVQQoXhEUYzSYrpKTBassT9RppSxxb0/wQ
	ecWvwifwjmUlD1MUkWy+ZJVjwDGCSW3LVdhG1qpBxX0vMJCLJwUVb0zQYfaZSqpP
	+Goj4VaNHxV5V8CWZOLRV24/rxTLIY8/8VIuSAKDoMSR61+l19j2G56GNfLI1HPx
	QsmaHh3j9HKTu0Zus2BRTpjARINLso4ZjUcCxFalEbJBC2leozFT8mnDpNnnxJno
	ky1jgDPKnNcARi56KO9HsqiiLHfgfoy57SkqRqCR7/97hoThb9skwhOd5jg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954cbnys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 08:11:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so16338631cf.3
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117491; x=1775722291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSDnacEmZXI09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=;
        b=DG1X5DSu5SG0U95yTjCxBKKGUxnRBZWK7zjbYmkfJM9zNEUxPv42Z1OmpirO3bh4L/
         ISGUIIV0GmEvbe2/Q0ElAeCuKd4/ea1CPosbftMtB+rVqrINSJqJBjn397coYJE/GT/Z
         3xojJMFsy9SgSDxKVW+ZU3ExstjtIYgvVX0aCe5txHNHl/vpvu+nGPQMqNH7f/quc3kA
         UNL45lm9kigFMoJGZKjSppUy7h2UQn8l0dT2D4l4afc2D7mqZHwTnG/PMRm7qekUjAIx
         x9Xv4fQG/PtkqcN9TJ1PsiIXXPMMCj0BlwDWeIooTeB5V8gOugLp50BNOt1/UfwrvtqU
         Nhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117491; x=1775722291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSDnacEmZXI09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=;
        b=Nvj5SeQ6DihhOL8bxzJOORMrJZ5lGNV/3H74rsRdAR77cUOh1okdiHc5a465uBNY7l
         xW08uhn0mMlY93B/YuUo3YDIxmyPs4fftIYd9R4Kgcly9KqHkw1rYkmooggmNZXRekc5
         iunVypVX1TDyY9SedxuKxeJMLTf9RgQ0sq1rUUOQbO0rHzh46iaEbCrBlpHN1TzrmrVX
         /7OUY0zZ+ZnNXffMbjQLawG0H4fl+X1NVt2v6/iIbx/FxECzOBStOalZ81KeCs7by/sP
         /wW5h3mLiMUZtVyK9ELQTICu8WJFz3XiWWpPf4QtrYqs4apcrp7BjCAufngOfbTAc7uw
         zYJA==
X-Forwarded-Encrypted: i=1; AJvYcCVGp1dwDd1BOLODhpwT6jHnwdygjyl/7rkRL24JX2pM4rbs3OLguf+K/bfleHik4gmVW4zrHLf0+EHUUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS6p68fZaJ3bYjCVv33Jdc1VV6Jd0z+zG5qUjVK7QZp0piDKF8
	5MyKU79aI9KVBnRdPtaDjxtY5sGpK/iMU8WxMluwoAFlfwii8WXFW+Tkavrm6gd4MATK199LP87
	p/1EeEH0MwV37b7uobm5/j/DLkCqOO9hc8KWYL1MfJlAd6IFV8fIqSJ4OItGn5iaJ6w==
X-Gm-Gg: ATEYQzwfBz2JRC8Jk5Aguo3csDkjsQVjOaLyKmDvmtEO2uL/FyzFDSb1olBZDJa+fx0
	f3cA8xU7toXISzjxDNperPZE37wVnh7n1D3xBpUhkNF0TXIkq9I3cFH4WtLhltljTAoiXx2/K5h
	Yu78ddk9b3P+77dZV04aZ42WPOLdiSzDXWho6MVBl3+MGzPA2uLh5zCpwEf8vAy2NaircswH/22
	Ac1dk/QLlgXq3w4aIKvqEVvbo6Zp09EfD9h0T7vh6KSmHTtkvDpoucyEifKYIMcx+j1VLZbIBCW
	m7mlKIamvbZlTXK5Mwxg2MlNGaoui1yREEQgpbLA+YiHYgBqcKik0G5dkIQX+4kXEfUnSyUdaTK
	1r690sXIyv5wtgWz94POTQUmrr0Xm9Qul6xEHN9u4zcS+hpOEi546cZE=
X-Received: by 2002:a05:622a:54:b0:509:2858:3c63 with SMTP id d75a77b69052e-50d4bb5f1c9mr36507581cf.23.1775117491405;
        Thu, 02 Apr 2026 01:11:31 -0700 (PDT)
X-Received: by 2002:a05:622a:54:b0:509:2858:3c63 with SMTP id d75a77b69052e-50d4bb5f1c9mr36507241cf.23.1775117490889;
        Thu, 02 Apr 2026 01:11:30 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v9 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Thu,  2 Apr 2026 08:11:07 +0000
Message-ID: <20260402081118.348071-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69ce24b4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WbEMVPVtDBSXEMPt_8MA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: oOwLoHWhhRjd6N8yr3-pHQsqNEdKdPIH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX5gljgINOiPVv
 PWLIvgn2UOZ91MiDQkDKT7K41KK1Egtmap4mhWYn9TWoe06dpxXCJc7tgMoDnRJ2zCIKCCy+zNj
 nATFxfIxzZaaH8ydvndMf8FvpvlJp6UIgEvKlLSpNLB2Wg2QfnsUXnPmQ8c1xgZmXVerc7Fwl7E
 IAPauW0JlL4ZqXY1ThtSsTk/ungM8Xt0DflYh0QNZQTin19mr89TwZW17nITVDxbaIEcMDYRKVI
 KXUdZMGvoUXvXA3M5nl2709mSEb3MsHmmImGnqbDBr7p19Hf8gOyPsYcbjtsYbYopyJqXMl9USw
 13RRKKzeo9r21t1aqG/KPFhR0lfsPaAFxqfbJqey53mviV4PztZSCfMEfu8RZ3b+Y+oU0U9OS0P
 rv40DOGiUnJyEx5DAGsR2xb1Z5sTKSQ7U0wWNRYMlD+i1gWMgHzneUkG0JEkgfb5hDZiQL3fjFz
 iFeTL9Wr7uPXzm4XH5g==
X-Proofpoint-ORIG-GUID: oOwLoHWhhRjd6N8yr3-pHQsqNEdKdPIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by depopulating them in remove callback.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 069048db5367..2dc525c8be42 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -762,6 +762,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }
 
-- 
2.47.3

