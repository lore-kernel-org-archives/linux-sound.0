Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FED230F94A
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424984; cv=none; b=BcaMxCiMrgvbuJB0OIMIINTw++cIugm34zDgrk+imRVu72c1IIoVDoNvfdiPs0Vp/AdbLk54kNTTHOLfuD2bTKa94c0oer2OBfFIdt5aNIy6F2Z4bXLJtizk1jgQ3vUbiRF1vhPVhrBf/IE22QCT2l2LGDPY2YfxlZrbOn5Vutk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424984; c=relaxed/simple;
	bh=Uh8OJJhQouGil3zYUiOAr2BWbxzrgTvVuHg1TGtywUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BIWD7SzPjla9w5BRfAUz3iOa48yL1j+IQ+zpEQSr1H/8jb+WDneEs7VL+x6KzwTEdC/4tLlxzYTpzIW0E8kWAjr9m0HLqdkmth1j+rVWq7onggv1f2j/muq6GoeLlJDrsxXd6CN3YxoF/RHEhHrtxKwYtAwkpZKHA/wzAJVsBvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA/mqe2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IoYZ6Vqh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA/mqe2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IoYZ6Vqh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATCMffB3006969
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBn9TsgNDmvjax4JXmC6W7uKKCA5IQjJq9VNdLP6D1g=; b=aA/mqe2s86RZlF+T
	qCeK2XJawk6QnKdVDABsoZkdDtlcyeVHcRQPtULbuaffjULhLi6yLmNOvSZUvUk1
	3gmmEuuB7q+dzSM06a8C0ei/vxLFSqZ0Mwg2bxrt+GL5zyU41cbNw1aAyXE5erpd
	edsEke02wqyjR/uQ/2o2fVfq0jRmWQVkNvZmo9VrEubVVdzqDR9icM+maX9wSpvj
	tYNzPgC+tuoKBUGEZJ6hXaQ5pc7/Vz9hnThNz0dDbmwku/Wf2gXraeN+aiVWrUc+
	4+3lzgBLJ9Y7SLFjj50yU476OrORO1x5PNs+Hka/EC3NFaXxir5ou9XBzG7JMrxM
	UDusaA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqyw5g5nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 14:03:02 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55b29194c04so1619027e0c.3
        for <linux-sound@vger.kernel.org>; Sat, 29 Nov 2025 06:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764424982; x=1765029782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBn9TsgNDmvjax4JXmC6W7uKKCA5IQjJq9VNdLP6D1g=;
        b=IoYZ6VqhH2uM8CDgx/WjjQKA8MtxYaul1CnICjWUe7MDv1SWKhHkqW+ue1lvbVdPRK
         GpLLq8ODHdoZ/YifIO0aL5wIoROLyzZ0JrZozJWhZ5xjHG8hwRxWdzWBsCJeRYCt7eWS
         2YRtvxjoRF452LPN7lUmAPDUN1v8xX8Ppunl9PSqiuk7fTKapKU0oJMAeVJo4hsAnwY9
         96fVgJmATvxd7bzCrNtZiH7yaWG6ivEdBpUYo26lkb/5ywkFIAj5ZBLyHMVwypzCgDZq
         nWWw3LAqN/lMo6EK0oaOU9vr0GmY/4b8f/SBw9Xzow5FDpPzWEL9bTXQfuhO+eMXW9IJ
         m1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424982; x=1765029782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kBn9TsgNDmvjax4JXmC6W7uKKCA5IQjJq9VNdLP6D1g=;
        b=LgKQ2Lofh1/P82CL7cIL3T5M3G2XXLPX7baTGav88eKm3JtPSHYNSsEz91jJl4gcH4
         DalNHGRpWZYw+3MFSuh53gsdZbIrya/iledbkaXi+7nHag5DXUAiE8ZIB1yFEmRG9uxr
         ki0SmN1CI/dlwoXRnwdqAn5hsegD1rPkVofoj2lGbshSq565lYaTwvUSZEaE6iA9N9vm
         ue1jjQeaMJ8Pr9JYvnQkCwKiFhbR9hAICYNnWH/QZYQ1o3x3suYMdygNernLGS+k4Zw8
         02Zor1x2+SvFwjhCJ+3iKUINPYlw70jqztHJ0rVy9ywQPNI+ljiduv1GUI+r8aJLAMyk
         8nWA==
X-Gm-Message-State: AOJu0YweC6MP38ybw4o5OWDwVjvYh7XxP8Y4Y2YBzu6pw1BGfNBAEqhZ
	QYLRBPXjGu//+yvdGJSP0MTh7NZOtuKnaeMn7/oA13kyxM6qqAS58zw0BvRMKJlvCwqvkozptzJ
	N1KIUTH2HljDZg07HJzEjwNJ2GKAGlBIvLYUQHi9ydrJQM6kUNIMO6+PDPjBWk+QPGw==
X-Gm-Gg: ASbGnctAypPaKIqhpi1A5VKhSqMap+e5ME0KhremrxtLyVeLk34FmfS4pbghInx43oU
	t1HlH7TOwJNKZyxhQi2AV7XYppRQGdtuWvgYZUwf1weL15L1UzAiUBC6C7wSNwJCusAdVYknj2P
	GaLpx/xwwkRRy2wSnbSa7bJ2BAd+KnWLL51DiC6Pq/G5/Wv6FCEAbJ+ry0Cct9CGYwdDM2TDZYm
	V3tQ3OU4dv1XPiJ3yk4kakT56VgsSOvKHyX5JZgXKzbaRuGXOskdtjXTkW4YdwpexXwv6mSgbdu
	82CVy+/uWsAdESzqbGDtdBPkP/kPAldP/tqVlWtQrnIK3L6yZfwnRq3rdtWYm3FA9prKk+UTXbz
	CveQaHOIPO3sWwieuTpcuQe0+9RYulIT2uw==
X-Received: by 2002:a05:6122:2224:b0:54a:9927:7ab7 with SMTP id 71dfb90a1353d-55b8eefed87mr11187367e0c.4.1764424981745;
        Sat, 29 Nov 2025 06:03:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpkmdrXXPWF0WiAWH3OAz3608v38FLnkyad5YOk5ObUmJUfouiwgMuePXmWs1TEMHBF5mXXw==
X-Received: by 2002:a05:6122:2224:b0:54a:9927:7ab7 with SMTP id 71dfb90a1353d-55b8eefed87mr11185892e0c.4.1764424962108;
        Sat, 29 Nov 2025 06:02:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm681649866b.37.2025.11.29.06.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:02:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 15:02:31 +0100
Subject: [PATCH 1/6] ASoC: qcom: audioreach: Drop unused
 audioreach_control_load_mix() arguments
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-b4-container-of-const-asoc-qcom-v1-1-67a3d3320371@oss.qualcomm.com>
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
In-Reply-To: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uh8OJJhQouGil3zYUiOAr2BWbxzrgTvVuHg1TGtywUU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvz55y/PVilHoj7AfbnqhjQ5K7jUPXBcXtVyX
 v+HV4KZSQyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSr8+QAKCRDBN2bmhouD
 185LD/9rQ1QOr+t1X8ZMDEDNnH2CT+Tk9k1IVV6S8AzrjYDwyVZD0WFr9d85uiWuTq1+MviaUWR
 MrTF8iF8Db/FfO1nnQCXzRKwlsopIi0drDIT9SPa8awJGenTh6qoJPhK1EH2igTh5hLBIjERxih
 hgIjlqa05HFqErrIB0uI/vKDKgTE4LKTaUYSZI0hjDNpdsxQrVl8Vo9G/xanoTMWIU7klL2Cihm
 Lrb1+pCUZ/wekjvi0JdkN9bjllZWdeHTGEhBMFyltR9HIleOdgE3AzPoyg75CVquvZjRvXuNJ/3
 S9SPzGLFr3JVEdJ5cqq8k34zjQ+z+F/SVlSuh12p6VTicmAE6VJKQ2HNtUj/RvzTCjfsPjVBhND
 nDVSDVzUHw/dRtVzifawuq89duAixtfn0fkkSI+Y8QEdkL0CYoAGMGeq85yjIsKMqMO9CNZH+xw
 kLyBcoQZsM9P/L8QJQ6j5VmOUllmhLamdAWBnppq4REbXDWvPFZJoqKhPhkbJog95pXngmhcUKI
 F1IgkG7aLQD1zz835/Mu2f/w1IF/ngTfOpNpIFSyx6eOipVYHA8dohHAH5bqzEu67xp0sR8O9bK
 Lu1cuKIZPqfiywmqGr5Z80eiifOd90SCM5HYwKz3Guoo3ABTw8zV0uB9l9+HVkMzMiW9KMYvdaL
 aA6iHteXHoA3iag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: hz22IBo8zxZnorr0oMiUEjGBaELYKhBR
X-Proofpoint-GUID: hz22IBo8zxZnorr0oMiUEjGBaELYKhBR
X-Authority-Analysis: v=2.4 cv=SoKdKfO0 c=1 sm=1 tr=0 ts=692afd16 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FyqqiJggdn_6IRYEkYUA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExMyBTYWx0ZWRfX/Z8cC27/Dp1Y
 2l4Pu62PO3lpJ/EmumBwyHlo24FZUxCjiotBkmQXjw+Otyke+/XYGDxcYN88Xr73CASDQun2Hk6
 c2W3tDhxL8USRsZ5aULdRCxWU2mnvx2a56v1qyLWwCfPi3oxI7tx5or7Np8YAquT6bovR9EC87k
 C68N7fO7aV5fieLsSLStr28mjgZ+xHScVg6Vfq3ynE56YoyEFOKxaMJOc33OfqpcGlBHzZca8qR
 L0S2XFZ3/sPXSv55VNYHG7PIJHJe6DksE9VQRBaed06atb7JkIaaCiQnDBt5SFtwDQ1mB7F/BPZ
 J9CYoKRT1aDRXOkopXxelc9GN6JDoyTtuNjuot7/REh4B/RJWAm4tyYwG3JhzCUW1BmQAFg6jSV
 tGCxN4NqBsln71FrpMLuawZ9mEpBpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290113

Simplify the audioreach_control_load_mix() function by removing its
unused arguments.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 5ce6edf3305e..5d138a956ca8 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1203,9 +1203,7 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static int audioreach_control_load_mix(struct snd_soc_component *scomp,
-				       struct snd_ar_control *scontrol,
-				       struct snd_kcontrol_new *kc,
+static int audioreach_control_load_mix(struct snd_ar_control *scontrol,
 				       struct snd_soc_tplg_ctl_hdr *hdr)
 {
 	struct snd_soc_tplg_vendor_value_elem *c_elem;
@@ -1256,7 +1254,7 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 	case SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX:
 		sm = (struct soc_mixer_control *)kc->private_value;
 		dobj = &sm->dobj;
-		ret = audioreach_control_load_mix(scomp, scontrol, kc, hdr);
+		ret = audioreach_control_load_mix(scontrol, hdr);
 		break;
 	case SND_SOC_AR_TPLG_VOL_CTL:
 		sm = (struct soc_mixer_control *)kc->private_value;

-- 
2.48.1

