Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306513B2FDA
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858913; cv=none; b=sKtYy5Rc52Ng5I4iaEKPGWoI33cFyI3e1gPufW6uSYqiGtY5VeydIGvLrJQX86G6NMMU3u2+bLpwF8MCYmzlZjQDlCcZDCgpqmyJtu1F+TrxZnqoTVJ/TLVVI4uprE34EQbvT3742wF0Vqa3QZaLsOYbtP6RooyhyRbmdiPPSck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858913; c=relaxed/simple;
	bh=Fl/z/x1vRgiwJd1pRAYk5uDKCPsjPZHEyO/+LZ3AuNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dIeTTZGOK54iKZt42Q/J/4wjcj29tLljfJh5XhRgAornZHkLx2wXlMOvL/TPdpLh+PXhorGz7oz9Y0H/MXw5ZiA3QLYHbQF9K3q3GmTYyd0yxQPHxVH1RnYKg6bqd2uq/FebOHiCZ9bmneT1Yb0bnTBIEf38GX5FkpF9F9SsgG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgpXg1/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3HymKQh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgpXg1/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3HymKQh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7ZAgI1246114
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ngH86D4QhHS
	BBEnIjfBcEjvZR9eSdOdxegad2SenX0M=; b=NgpXg1/IkQtlUVvVJV2usXrnLZg
	vAnlUIbsLPW0T+za0MzY4z50hv7bvd2pQm+kgena4BJJp/LLKda7hrOnO9w2vTlD
	ajG37vOR8nrDuvOoIM8D4W3Dm5Xnpal2j9RJPXwojFoP/rZ/kRkP7c7df+bjuwZ6
	tBEmdg3W6sxSMIG00W+FT6SIaDUysNiLUZLLRANA2VEVaVV6FCeCm32P9JPyAVFv
	eEd2Y7iePrAJjnE77YoJvc/hZk6z+WFr3nt3fL/h0uSz27TibcF6DIIPKkAmKDUM
	5WejlukzlZJ+CQN6d3LNnPGPIeGmZ5+RmKmzzy3AwYlZ5IhpLBcOzaXTb+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d677155y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50939597b85so109446051cf.2
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 01:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858910; x=1775463710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=M3HymKQhLgIjrfXK63ttmbk2TerakC+HhPnW+ExehTVDFKSrxRkz/qqqCvRB6YTDnq
         4zkklLOCvDfta1mGiskae+oF7/sqY2wbilin3N6QYMXcIGLdQ0tR1KXtjyniXIG+MJ8p
         zjg5OFXju/Sn+ndWfuqza2O8dW7xWGPlLCCtt7mKNs9fUiorHPUV+6nKQOJgKCEgp1E6
         BzC4s1HU5sY02R8mEcp8Ec7FySZ5CN6koLRO5tDJmx+Dilr9pOjCsH99PlmIiN3gnSgd
         5Fj9b+pO2xh5PDLPbxTP0Ayg8+UT3dTwZy0Aj81QPAjF11dK8PNyc3XXdH+ucpou7RZc
         LEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858910; x=1775463710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=Ac4KhjfEoytVLOoQX4XBVh0vQE0ldUe4G7nwFvbq5i23LrJ42G1ucSrg0TiKeNvpFt
         dpWce4SVKfaumrzRwvfbg0TynFOvCtpJJUA0DPlhf6h6q5SgslNvRjAaI2wNJCIGd3d4
         hQutF0aRfyzEYvfmC42WbY9C980PvelCywLlboOPja8/fHR565ZzzYYA4ktv9nstMZ6O
         8V14NEefokeB3jPnWMcsCUxckdszO2lyZKckmfIuaJRxmVYBVukHRwyfwkPmV8B7VLYH
         QFn1+s71zPYc55iHsKr+mNYF5W+p1PGMksu4Emov9dsNxY43xzNgdxYZ0i6ecmAi6rlr
         bWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyzAC554andRf4STU/DlU6OYaQVTwqu/MhlwTAs1G3Ptv5rTRzLmSwwMhOV75A/f43FRAMQOVLDNQ91A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkU/h5EVy7IRUDFLEN/jIHcEV1x3H8UfsD/gG9C5ialUKv1t40
	ETEUSvUcUKwNr3JcStQf2l9gjf2K1FqK9LW8ijiUz7M2Ew5x0GTboCv/9mZu44qTCT+K+fGV0eV
	h/l0Yp2DzhK5YVk1j4t5UhnYB3IpJCk7AuGefOjGZaZ3QKDuNJuuQuUGSeTeT+9Bs6A==
X-Gm-Gg: ATEYQzyxhz3LSpkaifeHzpnzHhRwtzcLn0WHTMQdjyBqKIq+N27A7Y0qTc6ljTLAz8C
	AM5pAWR1g3r3moNPcHofboCoWE+nkG7sNjqKPGriE8+WxNSr/QIyI9PTBY4mPS25ASz0jQMXUK8
	hZtSMxZbhL453GmLz/+McBhEYpFQqesTXWw2OfM97Ml4lmHvtRAA7ImylGXQ5gttnet/08iT+5N
	9djlM2yQOq+18/N65MgEvhWLcGyudQ3zoxB2xfl5IwlwA3HAqjL8cKaG8HXr6J+HRJ3fYbzuM8d
	tsdHk1MxuRk6ZSsardJ4A+ePNe7N7lYQysQ+2eO3+yeRQM37Eb12lrVaH4NDSrFOe+mZZLdb83q
	7QNgzBGy4DUuPZhk3UPQVgbk2Ca5T6y3NSBSgeGmUUjHB7scz4/v6K3U=
X-Received: by 2002:ac8:5d05:0:b0:50b:4eb9:a988 with SMTP id d75a77b69052e-50ba397fe8dmr161748831cf.56.1774858910501;
        Mon, 30 Mar 2026 01:21:50 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:50b:4eb9:a988 with SMTP id d75a77b69052e-50ba397fe8dmr161748671cf.56.1774858910050;
        Mon, 30 Mar 2026 01:21:50 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:49 -0700 (PDT)
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
Subject: [PATCH v8 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Mon, 30 Mar 2026 08:21:02 +0000
Message-ID: <20260330082105.278055-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Xfqi8mm3CYcmMLTr-ZPl4jMdSAH-hRPw
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca329f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Xfqi8mm3CYcmMLTr-ZPl4jMdSAH-hRPw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX542zxaA5OedM
 wtoYi9Ap+ap6lxCGRsojoUTiGFSPmUAsnOs/V9Etqk5i7DA45UKZADfOpCp2R1otYwyuCxDGs/e
 RZGS5E2qVEom6Xm2fYu+wFaYDUwxzkvWmvHLqk67YUsRgbUwY9Mm5jBGnf2bS8J3+9T+/Cquw1q
 rUjRBl1hJ0vEjkv4tebMQGT/Rg/KkQ8bwwZ+cP3LQyEueosD1eyWSPVc/R0RZ124xq7knfh56Yo
 LBSU0IuCh2+NduO7fiawVK4/q183LnDJt1gPNbf536uc+fCUFfJMtgknJvgvs0+lKslYkr8JbXE
 tjmzplLE2L/X/cvkuTcsSb6Fe4TYHt4SUbi33nqNq7OtLID+aH7S3dbtaMrTobmvzLylHWweYyC
 I8gOudKACVWaKuWrPn2APzu+4fM9UbOR+q5VXGOVRSa807DnGJwc1jEyY6mGEvP0vV0xPzY4o24
 UfzTaQ9wckzhUhj/EUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300065

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

