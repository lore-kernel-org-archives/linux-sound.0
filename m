Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481957;
	b=WTBo4HHnwhOwJ6rvjTbQ31P2JuyUbW/u7B2/bCm3ilW2kgkHsTCQsjyJi7xG/G0SxG4y
	 wB2OKXOKMvLLXeYUnmoDQ3UWl7QPq3uRoW6kZT/hsGTrL7j2BudI2TEDiTt64CzpihU7Q
	 Qlue0wnq6W22eG3P8mjExsK3dCj02vbBffrkppwqtMYL3beksG1hUVN32uEFP5B0gEwM0
	 0ZP0zevFZg0ljIvsKw8o5xFpxnYnBaXyqMw7pmH4wOqVwJZeh6jAuuIrZCWng3EvEVOPm
	 YWjRZ57jz9FKdtFdq1SB3sb1B0tYUjaijOzqFajMTzJ1IXYDzDDgD3A7OQFW8GyyPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481957;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VgK2cMLsx+obslnqu5sYrnrzY/q9pv3tI9Vj5znR6zc=;
	b=gQI/6/J197gvW3D2IDJrZLhVGAvOBLHh2iRRrhCqUgCyVWzAj4yIM/lROgQw3reGGtcb
	 YBdoebUQi1qSHGgtxsfFevPf+ReAnde2zYOvLoVXxwYklzRACCs/oT2dtAfMDa5DI295x
	 xW+r1HZ5MFyWJHBlQRJ6HutpLogngitgGCQ6b/MV8j/xMdaEOnYrnRek4yIKBUZA4CNZD
	 nqmm0azG//Ehnwm9z+iJK4sGeWFd3aOryd7FIojRWGwjhKO0gnMgsErHPfnG8Ek+krQse
	 rzZEvMO2HEdY7sPKZOlD+Pc5cahao0dTl8aoo1Jzhd1tk8s9u2SHN2lg2giXgndO5/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahIuoD11;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MyG1mfr2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F1760A260C
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F1760A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahIuoD11;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MyG1mfr2
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tRTw186814
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VgK2cMLsx+o
	bslnqu5sYrnrzY/q9pv3tI9Vj5znR6zc=; b=ahIuoD116fOXstk31lDWAqcUl2c
	d9HLvw7XoiG+xdPmPzCdZ7vTt6TFxsnb58rMI+tae31LlvxJk5d87DRHcXiwdefp
	V0EGRJejVm5imVGORfkfcEivb1HKZfjtxAMQ432rrL4uDcrJA4Xw0t40VaakucJb
	L8jeTUbWGCpaOIdRBVj7bmSDTdebKP+h+zCO4dDpSsX7VIcGaPH8chYYxZL0eQxT
	aiLnjBgaNjx/8NkfPNQoOB5RY9FEIm9tfDNfVfT3D80xPWsa/EFcDhF1QU5Ay/Bq
	s4/3fluD3kyD617vP7+l0C1Lyk/S7+czMIcvBK60rQnD3zrmcM0opv+UenQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nse6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so762841585a.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 00:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481955; x=1793086755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgK2cMLsx+obslnqu5sYrnrzY/q9pv3tI9Vj5znR6zc=;
        b=MyG1mfr2B3QiXx3WTaz3WIT0b04CT/EIC9JmbGgpxCo99ljXa0leLBBm7tie4353CS
         f6JOZpb86sZVX+g0HDV/iGjddhNLHYOYZ0lxireNka8kCBSWgs+AiGuMlNsPD+bv0j93
         ixQqifdi7LfEOV2tuTTCVPGJiXzcwDjilkUfZwss0P5J8HzstZjxJn1DY9ER306H09IX
         czOqApmMupJ8e7fCru5qvdqVm9yzMnLVuu38McXTQYZ8hfCK/aYOQQm0rcallUwx7YDC
         KzfwqSByfl3w20f8WAiberXlyAXu/s6LP/qwK6bWbh7SZ/cHq93eJ39t6wa2Og4fsaQ8
         PfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481955; x=1793086755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgK2cMLsx+obslnqu5sYrnrzY/q9pv3tI9Vj5znR6zc=;
        b=ZB7WYWxk8AZdJCos2QwfplcXI74QwzTqiNNWTAnkN8vo09NEmNCWO3EIu5a5YtWM13
         IeJMLEJOn90hsvyie8MNtionOdxp4WxpNWCnaQTpVQ3wvZJHRXdBeFnFj+YjLDr5q4yR
         dSM4WhmKn4snsFiKuBB1c4rcOMhev6FZp0RF81ufrY6qeDtI8/lh3A0rlKO1c+D60FsK
         LN8HaAdy8LjvTiaKM5EDgEYpXIAHnelzHxCnICBN7kntkntxG3hNk364G/Is1XlTcNxM
         dHChw7O2OHTt3WWDYa85kuAg8X9KNIQ9yf2q6amQklGxLoqMB/9YF852jMJdtTgn3XYH
         ZnWw==
X-Forwarded-Encrypted: i=1; AKwUvByGZtCscjV05LQLSjUYGWS9K/zpUSyldgvDMIFE0ZOpvH5j5Ewg6trTtJTzarQWafeM/RTy+94Sj2xYrw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKmSlX8W3U6Ww3l03SQ+b9QWDqgE/qUvVv+o4oqk8FolORhgdvB
	XTNwyOMG7LdKjLyFdWJ90Ob/9r/8g8ZYXHpVF6yt1IR0QQ90Muni5gwC2UJ34cCC1VtsRhhVFPE
	l1RslM1RGPB2JVgu2n/QqiCwb7Z8y0/SA3FxtiwejyGwpLQq0WBmuC6wsO8VOg6wafQ==
X-Gm-Gg: AYBFou0UbKeWDgyO3szunrfztMmGT1Sno7mlYbNHQwQ70BgFb2ipIK0mgFHoxHOoAXY
	lP/oqfNrY/iwb+P9fjaHkOFJtbX8QpoKoHiQ8zapkRARl9iiVcXqRe5C9jvsWxb7knm6ejmZhI6
	5D9IKY2z33THewgPyQ1S/OlTr/9kg0GFawlx/Au2y2fs5scKrZkmfyImwVlKjBIFSA4YMViqBTM
	zTXYYJDX/Qr+EBSK5YlureXRgp0IsMYhi/+Nyjb2O0WSRYKqhye3p4B0mpRc9ECfo0VcbZ2ncdM
	iDdeAG4yVzVNCXDz5ruOCmBBttjHlnV3h3Q8K0/Ae6Zspmml8BjNa3hKw/xNfLQXL3YoYk6r8Ty
	bohsWbLuntIpA
X-Received: by 2002:a05:620a:394c:b0:93e:5861:34df with SMTP id af79cd13be357-93f29d7be8dmr1654905385a.47.1792481954681;
        Tue, 20 Oct 2026 00:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:394c:b0:93e:5861:34df with SMTP id af79cd13be357-93f29d7be8dmr1654884485a.47.1792481948317;
        Tue, 20 Oct 2026 00:39:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 1/6] ASoC: SDCA: propagate sdw_slave_read_prop() failure in class_read_prop
Date: Tue, 20 Oct 2026 08:38:51 +0100
Message-ID: <20261020073856.1177749-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: 1kQ6p0Zuau2E6mIgoaT7AcbzXHp8apcB
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad71aa3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=w1d2syhTAAAA:8 a=EUspDBNiAAAA:8 a=jwOcZKWdBhvvz7EOEfMA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1kQ6p0Zuau2E6mIgoaT7AcbzXHp8apcB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX7Ht4dCyiBSL9
 U1vcPHAPvesdRkbshabq+7wpDyr5UDUThgFVolI0fyMNbqATwQjdKcuUmKfHoAsJ77u3kzCKAfA
 Pm4A3BUeu2vc7vIa/hN71wqcB2KtkgZpK5Rhk2I6j9uMcUrhpeO0WFLXOLNM9MfrSQ5YDfSpsfo
 Egtgwi8vvKOJGcqw+7OuVmc3IZUpSbnl+7jbntepv7qf4Kl6MnmmEjpTzaTvnVaxByV6y7hvtUh
 TGJO6GNfim7nO3pnHis2N8I5Hyl6Uf8SAOcGFpVrKdreu8L9guqOpBIhOAdjISJyC8Vt40S1xwA
 vOP2Gtojg+k9ARqJZ4fMD7US5HdOfiFXaxiiAElbO8Yje6jWkBkJPN1F//X0G8vnIl7BccrmmXp
 C0s7ToJOiGi0oCQepWkkNoxO4yf5f9N4dtaF0XvpUQ+ZZrXLFS4UQ5iXkYrhdrFZCd4Nut6ixhl
 3RDLW/Zn1QUHhcZKq5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX/TD1Ij8m6gUR
 R2FytOoyzIkHx0A9WObFih8fmCod3vPpZ9iCyYHT+G80vndCDgTyeiQHSssF7RbJRqr4nZ6tZ7V
 PfHoslQK5OgbJ29PsbrhoJye0L2eYGg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

sdw_slave_read_prop() can fail with -ENOMEM; propagate the return
instead of leaving slave->prop partially initialised.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Cc: stable@vger.kernel.org
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 79fdb672be1d..bcc660aeb739 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -27,8 +27,11 @@
 static int class_read_prop(struct sdw_slave *sdw)
 {
 	struct sdw_slave_prop *prop = &sdw->prop;
+	int ret;
 
-	sdw_slave_read_prop(sdw);
+	ret = sdw_slave_read_prop(sdw);
+	if (ret)
+		return ret;
 
 	prop->use_domain_irq = true;
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY |
-- 
2.53.0

