Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD063FFF82
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156171; cv=none; b=dNrQVj6OHcdTMHTKhOUX+g1NQX36KDkRV/XrEp3/PJcf/uFY61VWdE38Kzd81bvCfQ7hjS/gZdP9z0hvpdPAMG5t3NbjyMozZjigomR/OK3iMz6/MszWYJIHhjeJfj6iMNgV43Cf4Zob1dphjsn1xgboZxtgwhWkesV8b90nCPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156171; c=relaxed/simple;
	bh=P3bcNk2ItdYNy9fv7D3XFoVJLhJ9Kx2btxWKnvnZJDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=as3MutLMzuq8oqXvlI8pYOEQ0AitHQkiyblY0ahayGTsvweohxXniTDokgz231oBtidI6BeI5zqbbnzsk/z/6P0mMqiW99E5xBxDiTarGMKf3kXRnrz9UGJTpU22eU/0Kd5zFhdSFyioPJhd2yFUFd80oyaGUfc7bDdDlQhNgUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKIeD0Y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZ5yqK96; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKIeD0Y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZ5yqK96"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM0FW391949
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 12:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B126ndC369ZSKqzxhDuIkJaY7WNwhTlD7hGGb6MU6/E=; b=LKIeD0Y5IeHRemRK
	ZiYPOwbZZj6nhF5smsr8WBzz6opMQrtw7NHCk9XjlN8tc7BAyvhNU+i0vfy5nLT8
	S6cEoVnY4e03FbH8tc8gHstdNjh9jJRYTm3Yy0uvZSHATNT5wvnEZd7ttTI/eH2H
	Oy4b7F3pxgLqZUZ04Lf3QGKii6xdTKx/TB7aqYpDiCLLpozdBIjcmFWWL3yoGIPH
	7bkuylVJuWhpt5YBh2SFY1PEXe64Vd7kEov0PC2CMuSWIxLjlraMJHiOXSuT0tSa
	BpIYu+rZhc/vcMQJ6YDSvDJgFl8lZn57mjf6pzU/rItjGM/hHL9JdTEGdl+MVcrI
	eZM+sA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9whyak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 12:42:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-529ae8e96e8so17427181cf.3
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 05:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785156168; x=1785760968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B126ndC369ZSKqzxhDuIkJaY7WNwhTlD7hGGb6MU6/E=;
        b=IZ5yqK96U0aBLHyBmHig4XCr6mCRgmCP+zJqC3d23n+5CgA0hd3vQPahxcsUDex7Fk
         4Lcl8wbxExkvIU/ldV0VA+w0rcQMDnMeoRtJj8OSCU/OCwrK4alsRywbJNp5lpF3dzBv
         EBvyseTppivhs6v5HdENU59orKOfJZN8PQK35qeIm+XTMkTKemLzHiRWCR+jxlTg1hmc
         eU1LMqkrmeal6n7C9ltybrZqfq6ODYLt5616KiGmNKigr5Pgs4yO4tr3Uxj7sS9JWKSU
         LhPcMuUoZ8NFhk7zR8sTfUbfBA4vGpzMOD8KPzANnixhMXB7GebZjdGzzDHNxFVbG18m
         fW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156168; x=1785760968;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B126ndC369ZSKqzxhDuIkJaY7WNwhTlD7hGGb6MU6/E=;
        b=sxxhf21AseW22GeqAnp8Y981VOnufkhykehDKtl6Ilwa6cwx75Ow/P6v3Wg6nQ/pwT
         nW2Gw3X6yAslXTrma8T0V0emiBoExjauR+U6LyOC3T2oHj/RImJvSqYfXj6T/nFJPIE2
         8RsowTPgrGIEqq9UQKaFHb2kKL1gS2H2ZQpeNR1Le2FPtnKEofpw+fEZFctpcw6WnCPa
         M24UkfH+KEFt+HwrZxIRrSHrgWmRe3JYhY42orfCpipjW25FDe63cb/C+VNTT3y0U46B
         Y8NOTeOIyZEt3HK3bXzPkzD3nAgCo1x/m3zCSwEPBb/bVo9YmjZbLiwLHF4LRsArq2JW
         unUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqN8wFTkvLHSgf0JPltEZQyB5GMO38LnK+iAz0Lnk2CAw8xp4tvlTm+KpnhrJVYDzZV+rIfRfnxruLoqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8KpQ/gXk2VLyL3M56Cwi2BMTHcDQYPr8VIL1to7jdiSjY4zY
	B6fzJTC+uH+S33721LQLi3+Ac53iJKcxwjsnXmX2S9BLSZqBLXqF3P+iNOKmW7aBT7nKT3FWONc
	Lhmi4BMsgC0IhbgpEMdUTkJC1+XAQ3NchftiL/JkvXC+muTyVOo4N2DEfLwTt6OyWCA==
X-Gm-Gg: AR+sD10lhnorKpxBNwFGF8RKevRp6rfMdyRgrBRf7daxsvJw4k85UyYqOklgYu+j6Da
	vPYx89dVELt4BRb1nPZkBVpkDkHjO7HBiOeJnoRFDoqSAV28EyLCQ5bYC4tYjLcS2uBT6XYHMzz
	SnXDXJC3NOvBVlGftTfBIsy7ztWc9hqmb+vbY1Y8JZrWQKLekHZSASwy5QeQhIcOwcoMiiZ2icd
	rN3XCiDeLBBMdGIIoGx1A+SmOLtNT432oGs45C+ktOMr+PqDD/56eAs+sWn9PAtxA+DUo46nmED
	A3IXE4nSMbol+lWR24qcJjf6tlzDUg2iWWiwPHAWzmTRcQlkLQxK5CUUruyXU2jy4zBPZAP7RoD
	l3gQXTF5OvL171yvR9G9khrYxwhc=
X-Received: by 2002:a05:622a:550:b0:51c:7b11:41b5 with SMTP id d75a77b69052e-529a887fdddmr84157601cf.81.1785156167957;
        Mon, 27 Jul 2026 05:42:47 -0700 (PDT)
X-Received: by 2002:a05:622a:550:b0:51c:7b11:41b5 with SMTP id d75a77b69052e-529a887fdddmr84157101cf.81.1785156167408;
        Mon, 27 Jul 2026 05:42:47 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b4ee0e91sm222355475e9.4.2026.07.27.05.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 05:42:46 -0700 (PDT)
Message-ID: <53bf0259-d7f3-48b7-bf6c-ae3d58856b49@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:42:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/8] ASoC: SDCA: hw_params: program upstream Input
 Terminals for OT DAI
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-2-srinivas.kandagatla@oss.qualcomm.com>
 <amNlSu3mcwKOmqvf@opensource.cirrus.com>
 <e37d8a26-0e06-4e9a-98b1-9fef43745b25@oss.qualcomm.com>
 <amcX2FWcpFFTsUVe@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <amcX2FWcpFFTsUVe@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNCBTYWx0ZWRfX/BUOVxkx6vRQ
 U93ROoC9yIVGP2fourG6Hrs2TXJ/sQ7yfC9QNyPb739RbjQH0piJYbJgsxaHXkGYZEi1+qvgc2j
 K756poMYWjwnC5MPI24e8yEDxLySL3/u/MV7wUDpaMAp/lz2wqAAubzI/oKP3s3jeisS5zxyOKz
 dZObClmBN60iXvfla5Gh8FWPbsqVrSEGy2l3e7a4D2uHlG3Z5lVk0K0f03b4+gZGtsxyBmhg89X
 fC53i548GcTRA0qVZzvyQR7S6BLkrwvouChJ8JOEBAy2v9vOnZyj3zetq3p/jm/9qWf6LKNpvVS
 DodfQbgdVtdCCpUTAbxBKOa+AeipAX+tkrahSihZvLUq4Q90WpELAYX7MR285sKiqUMxaF+3t2u
 MIVZYW56ERMv4QetzCXbhj6bt0pdLSh1lvqNM04dmv9sYgQLu/gs0oqOuTQ6FR0MwyiZODmRXWM
 MMXqYxeTu7y4AU71A/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNCBTYWx0ZWRfX/2pQaNN5I9vG
 vBHVgCk6YP2T9UKCs9QvjqLxf9tT+v90/rpjcSvM/f3A9DpExh8N6bY4JWxMhda9zkBqU7xZh76
 q3PjuY7U+W0sULffAdZyA5gFFXlPiAA=
X-Proofpoint-ORIG-GUID: 9RZRrcTbSOB4UJ0ZvrWY1j5-aqIpVPPr
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a675248 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=orBqx6od7Nat40pafO0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 9RZRrcTbSOB4UJ0ZvrWY1j5-aqIpVPPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270124

On 7/27/26 9:33 AM, Charles Keepax wrote:
> On Fri, Jul 24, 2026 at 05:35:36PM +0100, Srinivas Kandagatla wrote:
>> On 7/24/26 2:14 PM, Charles Keepax wrote:
>>> On Thu, Jul 23, 2026 at 12:42:11AM +0100, Srinivas Kandagatla wrote:
>>>> For a capture stream the DAI is the Output Terminal so
>>>> sdca_asoc_hw_params() only programs the OT itself: cluster, clock
>>>> and Usage.  The upstream Input Terminals that actually source the
>>>> audio never get their Usage, ClusterIndex or clock programmed, so
>>>> the power domain comes up but no samples are produced.
>>>>
>>>> Walk the source graph from the OT and program every Input Terminal
>>>> reachable through it.
>>>
>>> What was the thinking with respect to the units in the middle?
>>
>> As per $6.3.2.1 and 6.3.2.2
>> FUs does not modify the cluster, its transparent to cluster, Output Pin
>> uses same cluster as input pin
> 
> But that section is specific to FUs, all the other units I
> listed below do appear to allow cluster changes:
> 

Yes, other units will not preserve the wire format, this is what I was
planning to send as v2 which will stop traversing at any other units
that do not preserve the wire format.



+/*
+ * For a capture stream the ASoC DAI is the Output Terminal, so
+ * hw_params only programs the OT itself.  The upstream Input
+ * Terminal(s) that actually source the audio (e.g. a mic input
+ * behind a power-domain entity) never get their Usage /
+ * ClusterIndex / clock programmed and stay inactive, so the
+ * power domain comes up but no samples are produced.  Walk the
+ * source graph from the OT and program every Input Terminal we
+ * reach.
+ *
+ * The walk propagates the OT's channels/rate/width to the IT,
+ * so it is only safe to descend through entities that preserve
+ * the wire format on their upstream path (PDE / FU).  Stop at
+ * any other entity type: source-selecting or format-transforming
+ * units (SU, MU, CRU, UDMPU, MFPU, PPU, XU) would either clobber
+ * an inactive branch or program mismatched parameters, and a
+ * codec with such topology needs a smarter walk than this one.
+ *
+ * Depth is bounded by the number of entities to defend against
+ * a malformed graph with a cycle.
+ */
+static int
+set_input_terminal_sources(struct device *dev, struct regmap *regmap,
+			   struct sdca_function_data *function,
+			   struct sdca_entity *entity,
+			   int channels, int rate, int width,
+			   unsigned int depth)
+{
+	int i, ret;
+
+	if (depth > function->num_entities) {
+		dev_err(dev,
+			"%s: source graph too deep, possible cycle\n",
+			entity->label);
+		return -ELOOP;
+	}
+
+	for (i = 0; i < entity->num_sources; i++) {
+		struct sdca_entity *src = entity->sources[i];
+
+		switch (src->type) {
+		case SDCA_ENTITY_TYPE_IT:
+			ret = set_cluster(dev, regmap, function,
+					  src, channels);
+			if (ret)
+				return ret;
+
+			if (src->iot.clock) {
+				ret = set_clock(dev, regmap, function,
+						src->iot.clock, rate);
+				if (ret)
+					return ret;
+			}
+
+			ret = set_usage(dev, regmap, function, src,
+					SDCA_CTL_IT_USAGE, rate, width);
+			if (ret)
+				return ret;
+			continue;
+		case SDCA_ENTITY_TYPE_PDE:
+		case SDCA_ENTITY_TYPE_FU:
+			ret = set_input_terminal_sources(dev, regmap,
+							 function, src,
+							 channels, rate,
+							 width, depth + 1);
+			if (ret)
+				return ret;
+			break;
+		default:
+			dev_dbg(dev,
+				"%s: not walking past %s (type %#x)\n",
+				entity->label, src->label, src->type);
+			break;
+		}
+	}
+
+	return 0;
+}
+
>> entities in the middle could change the cluster, such as CRUs,
>>> MPFUs, UDMPUs. Also possibly SUs to consider too, since they
> 
> Thanks,
> Charles

