Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603122;
	b=l49xcdJPkODVHYyPq7KNYtIrbZf41s0qC91aAvNXq8zvB43HlHH1feqfZv02a/0uzdRN
	 Vah1pEtbOzJlSKu+l8O+GMk7W7M0o5JIpMXgheidXzG+aS+Oi+gm3ZzcUTBOJmArJmqqx
	 IkcAQLsJ3nSp9Hd8gfHzWiqU8d9bI7glofyoK1eKyPSSf/QicfDGKOkwFhp1shbHHQ+Co
	 31C6ODxAdAgEYpnvwm9CiBBGlshUR+LUSfVW+nirA6csxsMoR/qzKjPCRq94b3fnOz0d1
	 TdzrPdP4Zh8AvylVNlecceqMjt9Bx7oFATiz1sGT8DtXxKBJuU5cdfvYUoLzH7UWlzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+hZ6yiArMMGW/4xOEf/vgB/V37r5/1JqrJZy10W2Qx4=;
	b=lXs/kq/zbXgF5EdnKGA/urclUy/70p0wpeLekT9b5zYoEQLnilID1mLEh8sIWDkSBuda
	 8tL/6tHWu84IfqzvLndbiTW6kunOnmna3ybXgXZITC4Q85aok3EuxTeVDz5BNMuxEow30
	 z0CSZArY/Hvhf5+ev46T8mFiPBxe5seXk4VVMqrSjpI+5f1UnikPQY72pnJ7kcW/noDAp
	 WOhK1yx4aYPMR2pgLKTw5Df2eUoBvmFY/y4i7wZQb3UkX3cI6DV/pJiUondgoCjGwKtpl
	 skMAZj59uBjprxzy917UEMOn9qT2k7UTRcjwxONL7/kIa10phxRUEdag484WfgwyjNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ohXFrsaC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Pz/MkxiX";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB8D606A323
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB8D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ohXFrsaC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pz/MkxiX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mFE83126472
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+hZ6yiArMMG
	W/4xOEf/vgB/V37r5/1JqrJZy10W2Qx4=; b=ohXFrsaCJZZOCfG3HGTW/uKYT4+
	0nQpEVTZUyRrr8A1sCqUajvSxC+WUmgHJbAlW19DR+L60bILvZwpSNI2Zy/uafld
	dxqcfBHyORRp6WmC8zqXii4p3uVyXlW53A7e/Ed/hrloyxIVeJm64sqffckEWKJ2
	AjgtBKSmdCrxPbofMWCnwaVmsk9d4wXrT+wfbgqcbSW7lli0XtQKmZotCzrLzhn1
	hf/ojZeGFM0MtcGGzGDjflkl7Q1X0zlPYwtUhVtTh5zRwvyuEgkcIQMj9GmO4F0k
	UTEAKvtgFnK9Dx+zHJcIRIHas1fDioIW0758krbLY/whGvXCG8NZyxJ6B2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbqvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949dc497896so406941485a.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 02:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603120; x=1796207920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hZ6yiArMMGW/4xOEf/vgB/V37r5/1JqrJZy10W2Qx4=;
        b=Pz/MkxiXKPMxnpbAsl4sTfEoGSVKuz5rTdXUgVJDuwkBbLnO/f4KaMroOwIUsb+NyK
         I12IgE9DIanlfbGUA9paTigU0/+93DFFYP5pIu3cMTlrfik1oFiX4u6sLYEf1IH5Jv4X
         vki5xDaXdffBl1v3b7tFowYk31joh0np0wwPh4N2mXaqndbt1dYmdtVL5NYTvHDZ2mFy
         DBRYVEg8SN5hgDLxX+WO6QnfPulQo8RaFR9z0UGun0FiTGVv/eazmqwnhAFfcPAbQTcj
         JQ/VZcyy50GUl63e04vyfORC380tH/kERD3uGQhbV2LiKu52TRnNhEgqp9gJaHhUTGqC
         sGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603120; x=1796207920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hZ6yiArMMGW/4xOEf/vgB/V37r5/1JqrJZy10W2Qx4=;
        b=ips6NlvZcX+ZGecHK3wShJkBQczOXlRZMuM9bEXfVEuOuEAdDztKD2tsSNAAYDTIbI
         bk2QwbxCDHvh0x6S19sAcZX0VqpgC+KXcUE/YfDyx34Buw9pSybzaiXMNUVkyLFes6cL
         goQ64GRbDUW3b0D5eM4ODPbIs2PjTnEszcWgCKywUPdY8U/OxLW6TK0nsokDeH1SA+uk
         1f9jU33cRtDmrTuqbr8RilnEJUJiMmUCxI1UUYIMg1HaageRLBaM7o8tZiT0GPCGEHAz
         ECEONSNHaye/RqAIHs8NImeBEmayZNzTyvjD2eT/YIWWTSSdHOZ/9VCiir9oLwpfFurI
         p0Yw==
X-Forwarded-Encrypted: i=1; AL+hErFfdjs89SaPlM0Mt3si9S9hR/qAnH1thcJCegwDM5AFXbHHrIm7MMR62y5+AXs3yQiYu9GJCt8c3mkmKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ieJGqbco49Vb93eu5MSLIFtCBJVLZX8yhwEkoiXO87qLAt4cy
	/xlXlXFlvT/9MA+vdqcXicA9S02r3mT2EMpSixAtR+8AHJBJlA88EG54gjGgA6x0DM3/1XugVlG
	Fh4+fzM160jqJvS1jiW/n3FcNGC9tWxX2O14szoGoo/sQ7Lm1viXhMXtPDAxPWOQGXA==
X-Gm-Gg: AZFdTZdGs9LAuLs5rRXS+/8R/RwxcPW2DnrXPbkozcO7FnAbTd6EgeCe4l1t3/O+hYo
	OEYX6cqkycaNAaE/DSKxkbAKWCcfeUAF9EHa+CF4CWspkpPhSJvw1mq/89hAPpOF5xcIlYM6sJP
	enif4Txk6mcIthaNINbBU4uPDxONytshP4ufB+tUu91wjKwrFJCOlxPFN9llszuqfG9+4EwHWO1
	kHleMrL1CRznJP4P+6LUOW0mBVaFN17HwbXiI9igu8BiIULH1xRrTDlSpHttkM+P0Fq8B0r0wFL
	n5s519bTimG0ldsdjhQg1Yo1Dby3eSSJXOGNALtzXMxDVi7xvSIDJz4DSTrssNS7JYPozYaAn4W
	7jtMV78BKDBk+ZZtM/We4Bt3HIjnTNmqXTNvRJBagdMZTHL5No0sJXDWiVcCA2l4h
X-Received: by 2002:a05:620a:2a12:b0:93f:102:566 with SMTP id af79cd13be357-949bab5ee1fmr3046338785a.67.1795603119907;
        Wed, 25 Nov 2026 02:38:39 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:93f:102:566 with SMTP id af79cd13be357-949bab5ee1fmr3046336785a.67.1795603119456;
        Wed, 25 Nov 2026 02:38:39 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm34171502f8f.48.2026.11.25.02.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:38:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, stable@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] soundwire: qcom: skip offset2 write when unset
Date: Wed, 25 Nov 2026 10:38:23 +0000
Message-ID: <20261125103825.936939-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX5EFkhvnhcbGg
 tJy6rhKojqzYf0BBfZZ7qzzb6PZdC3JOe9XZknckYvHFPDKhF3cDSgj5CV66c9DIZAq0pd3sw12
 JmPHvNdXmC3Uq0Lh+jg6fYwTvpKez6k=
X-Proofpoint-ORIG-GUID: R1VoagVGYhCTbKaljGLSHVx3W-0Ph3QT
X-Proofpoint-GUID: R1VoagVGYhCTbKaljGLSHVx3W-0Ph3QT
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06bab1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=h8pHtkhTcpIEMHaiu1IA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX7CCkzozUuneO
 YUvg+fFf4ta7ZlBB0gP8p+0yB0z/wBP9iMIDJ0j1awG3pDKasD5yUSjmJVlubxBZZeGpDn/el6p
 NUEFldBPOCvlpkFt2DQWvi/lxZaA2XhZIhqMldFsbfYcsb0TcfHSD4VvG8/BSCn6konJpwE65Of
 oCZFaBJ+N6+NhI6UnK4MQr4DTRmLr5Pa2b03rbIn5I29dTqFdSWlwzXbFRHYwoDZIDhpERpa/sA
 sVKclsnIEOfyhsNkeYDZqf+afQtzzB+vjy46R82tiAlbZp2AwrC66ZjTRm4urp03nSkz5Ts8Dxa
 +bYBD4CTrsclKYeH5xESXu8go/8rNRAWROhn26BrFVf89cb0DOlEBHVVA0DJX47KIZGkR7CfdKc
 u27qkxYbzDGr5q0xHe72wJPqRbGT4YbJyYcqB1mvamZrhwLs0Hk3W9dVapnQ/f5JmH66FIHggPe
 MzdPlau2Yf9QW5nPpBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

qcom_swrm_transport_params() writes offset2 into the port control
register even when the port does not use it. Many DTs mark such ports
with 0xff (SWR_INVALID_PARAM) in qcom,ports-offset2, which is then
programmed as an offset of 255.

Skip the field when it is unset, like the other optional fields.

Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
Cc: stable@vger.kernel.org
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
(cherry picked from commit 65aca3ef0d1fb2f6b20892f0d1a3a1ef391ccf7f)
---
 drivers/soundwire/qcom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 95444eee4c0b..b29e2aec4ae3 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1232,7 +1232,10 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	pcfg = &ctrl->pconfig[params->port_num];
 
 	value = pcfg->off1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
-	value |= pcfg->off2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
+
+	if (pcfg->off2 != SWR_INVALID_PARAM)
+		value |= pcfg->off2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
+
 	value |= pcfg->si & 0xff;
 
 	ret = qcom_swrm_port_reg_write(ctrl, params->port_num, reg, value);
-- 
2.53.0

