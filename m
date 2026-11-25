Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627129;
	b=DgYNPOVyu+vf6wYQpSpllOWlLzp+Xndg/xEhtZa4gDzTDWLdyEj+1qShuUgYs5hhcC/F
	 HDRf7E6cHN4YEvsKPjHHXIR+702xfdhHSGu5+t7QLM5lDOQkt0HKS8Oak7KrTcbdGZWFr
	 +bb/0m5wZPOhg/ZtuIei0XUQU75r2wtH8NwhocfgPyNJMjGTE1cDeBIrVdaa5Lm38tfjg
	 nUtkAyNauV+wXCeFyNBPqe8DE81lILMZOM7q/l9jXAfz6e4tQD2VNyR5wnwtGqMAZmSDD
	 XLkDafZaUqiAJH11j6xncIYYhM+VVBurTSVu9wCTciH27U/F6hBnl2iZXx9o1tKnu0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627129;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
	b=MN1l1euukilnakr7isfBY3GDi1dbBrRGI4JpZ9QnHV616jvMCNpz3cfIM6serC7JZi3V
	 tmUEnMHvSTwSPFJVjD1UlPzAm+JsCGgTWWb38P4iatCVdA3irGSsw208BmzHIw5fGyNrr
	 ncW8t+DX1WYw6vn8JhTZXG1NVvwglkjrIo2xxGyMTNT6D6RAy1pTBGq2hG/2BwWv3CLhs
	 oOypHQLT+gb2dcz8toEimF2lm0JhgiCrTzg+ANIB8v2oKs0wxTDJZO71/Q6/VtLCyhY4M
	 yTDhpLa5jK8RLwDV2fMZ7ks/lFoQSM5aMrx+evgiHLX7M4aUyzjiXrT/5CpjuN3uWAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h63YnrRU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PbRmn1os;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1142F606A33B
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 17:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1142F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h63YnrRU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PbRmn1os
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ5VC1670791
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 17:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jaDldssiLH8
	yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=; b=h63YnrRUqhEJZoKuXYZ3r5Bxath
	h3/Fq8hWcUGRv1f7STKGPr1C3+acLo48wxLfgYbp/4MNbEMeS4GzCY4JXhG7RtV4
	SfhSN2EhxJ52dcE9xrXVMlASOPBFBUOs9GEuSeLiRxq+4pwUQESSPk6dFgQpxsuy
	Mo7zrRtdurFKjh5YYVVnYrhqsYDSEIxLY8sIMnA5XF3h2x23iMADbPyH0VtDZzFV
	w0HHPeaEX1tqK3E6Q0PRA1rVYd1gy4y6wIHbp0wD6G8dxU7nPgR1PLKwuB9x9EmB
	pq1J56cpnnVT0hS2cxRIYp4xQhRnq9pT16ieLCXq974z/J7uSZX8tg0LeBA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vara1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 17:18:48 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4fc2d32caso84367147b3.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 09:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627127; x=1796231927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
        b=PbRmn1os8HBDadEK1RWhU29c1VOgNVcrsrOSBGWhJklsnfUz253XCJ+YkvMbuYgeuE
         e0ZkwJn7h831ffM84BklshjenUta243oXDbZm19kFaGykc9gaU3Pd4vbsBSLkq0qn7Zu
         zr4eKvqnYvioVql9tHEV1IeALA4ykI2d94hS1LUUlJmG45+jz7gpVPHN0A2tK587ONeS
         5rUNWl2FjCQWRliZp+mC4ia/JOfW2K67VX2U2768Ncfx2I6+oTJ5wMjbYkwcLBJydoT3
         jRPCHENwEei5z+VtLFpv9rYhO957pU5leqO+a5EApjIg3klkOYVhhvcW4PByJ0urFOul
         kPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627127; x=1796231927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jaDldssiLH8yWXgDTWe1Bjv6Sjv4//UF47a8amapFIQ=;
        b=H2um3TqeOUG97Cs1YXZknTXFx6REYVg9dUPIgldiyGI4OUt5D7jzEaxueQ6qQGMXNi
         2IkFyg18KVRAO2rfLFHwCOOy2oRYwyfPikiHo6EWERUtTeXOgUPl5i9Z+EGXMlSDPYxo
         l+r1PcAKVDR6RhepO+YiCHlLyyqQ1qEg45kn956y0sAIyggdmX9Oj6O6P+ixCg11zleQ
         UmOFTITHsz6qRXYZwrTT+mc1gi5dfEie8JXvah4X/iXUABU318u1O0LwFeH00TsSmP0g
         Fj1RDw8HIpjhmEvLfh3ym0pMgnldPPTxHX6h9ZMbd+atoIngH2bX5WaV5JlQSXjU71um
         p63Q==
X-Forwarded-Encrypted: i=1; AL+hErEnDu9Jc4uDD4+7BVrquD40JNQAaNgG8NUgUKDJA8LWZBBITCLxXUVBnUVNGPlrO2IgFVkfl/gZ75B+8Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DRSfpAIjTQiHotQJgJIJDfDMCxGePtegm7EtHrYu41sT/T1UH
	OaUp6KhACS3bjlsLdmVMr0/Ki6RI9gAKophlj74n56bgyMpgWenUL0ra8rVkkE6Sm8oeQCqKDOB
	/rfXjaU9g90bXkm4iynOSuTSNUSyvs6/cRSndMqhPK2aRtFfs313VDEHIUwkrJUM/PA==
X-Gm-Gg: AZFdTZfkx3EieyV/g92HCFmK3GUj7DVcOBfu/BpSRMsQGF95j5lv175Euu9iXqNcQgj
	yhOnlEGFTR35nwgYE8PZ/D/rHmVnvjfeugHG16TayWp005bdssALHoPX8ABMM31jqJqUs+HITMw
	Kwcdj+OLUKH56eH3U5YrBowaG21dXHmYc2fYGwjTqvZZ3D+9o6lTA94T6QCCe2HcdwfH4t7QqfV
	J1tHetumzh7wkAMMT1pZYXpa8mcHJakB+eCiNYshWUHONmUe2OGyaaCt78oRhn0MwUdgsn9kdMF
	pLcGBi7xpU9DsfYNJly8WzT0kwob1/b5h9lSNTCr6QC/1PO904JmFlRb6GfFGjolzQ7QmtAP3qn
	mOPXaNIEeCi3j8OrgwU1jIq0LeLDv/+g6DB4i+9CwY7RZiviM+gV0rYCJH81wQP+Q
X-Received: by 2002:a05:690c:9984:b0:8b4:f326:c4de with SMTP id 00721157ae682-8b5204ff226mr58945107b3.87.1795627127311;
        Wed, 25 Nov 2026 09:18:47 -0800 (PST)
X-Received: by 2002:a05:690c:9984:b0:8b4:f326:c4de with SMTP id 00721157ae682-8b5204ff226mr58944987b3.87.1795627126791;
        Wed, 25 Nov 2026 09:18:46 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: handle LPASS_CODEC_VERSION_2_9
Date: Wed, 25 Nov 2026 17:18:30 +0000
Message-ID: <20261125171831.1458954-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXzQEJdDgrXnP+
 SOprRIqkmJtA1iUgiZy2+H+BwznfhYNwQxFpzzKc8wws9ZW1f7j8JJzsFsndBQNGWtHfzCcRaZb
 km8kqRJSFvHr6rXTO7jF76b+4d4wWQ0=
X-Proofpoint-ORIG-GUID: NJ_8UY6FAlTWYhqqlSchZsW9KtD1OeTZ
X-Proofpoint-GUID: NJ_8UY6FAlTWYhqqlSchZsW9KtD1OeTZ
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b071878 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=OjCvDKFjsN1F9Zy31NAA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXyUhdjBKYz3jt
 JzUlL5YQ1jKXhzP6xqEV+5zdatVTqT49onsdbj4PEFfqGN+PEVEjer7CgWKVDLo1/gKNf9Q6Yeh
 yAAL3Vf60BogAqVdV/ilqMF5XOsj7DU4WTzmuXaJ+1/QW42RDX2L8fj3u4C/Spw3az32NioVdVv
 mF7DHoykR1vRHMl2UcFmPbO10cmhnmSennKq91OsEammLZ30Cv4+/lQtDsaS6kDgloqPM4ZK51j
 2d6JKLpxeCaOjkm+Kce3INOIcS3r6YiBkEdKp3d/B1Zm5ldJ0nZKPK0X5RMKcjYYcpTZ81XfSLi
 Z5uAeqU6vXJ9vgnuQ0jz7qojMdTPalOVBJrAX97AEEGprGVr/bEwBjv5NstFvGXBi9C6RwH16ho
 RyamIkNNdXwL58y5vY89yIWsMwRbdPtSdTAgjjNQzz6DC1vUT0KIiNbEVaE6pTs7qdjYZQ8cvXS
 iDlk0LWzbABUQN48WmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068

LPASS_CODEC_VERSION_2_9 is reported by va-macro on Glymur-class SoCs,
but the rx-macro probe path, component probe and read-write register
check still fall through to the "Unsupported Codec version" default
arm. Version 2.9 is register-layout compatible with 2.8 (and the rest
of the 2.5 family), so add it to the same switch arms.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index eadd52ea2630..94a272916ece 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1659,6 +1659,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -3698,6 +3699,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3883,6 +3885,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_2_9:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
-- 
2.53.0

