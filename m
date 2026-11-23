Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462525;
	b=cU//dxKeC+1DZgWf446WpIi7e0SLOjkKSsIMFYDaibHfWJ5b5joZOXLi6SXp5qnWBFIm
	 ofdd+hUbgkINTC3RINXSe4Gao/m/BwBHRlltRwvwidNUE8cHrix/GAfBmKrM+3wHsNMYl
	 E+wV9cFsqNguSH7U7sFIQmk3QAEKBaFxrKoq0MnXMYA9NkFE1vz0KkSWAWClMg2sbN58h
	 VtTLnW0F+Xc2x3xda7jaP0WiK081vYmw3U02H1WIfqZHyFyM2Xggue14q8mVYNDz82xA0
	 ce3cp6efmPa80/J0wGLgsuiAafCgQp//txY+VXkgSimeQ+Q1ejay0HmC9q4SkZPEsKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
	b=IhRFloIGrvfE82wWuJcGbNP7XYU4hOKKWWww96KCnWttzHwdBA8fQ2iiGOK0hs20gZTW
	 mbhGunmysv2YM5zHZ7nUBmxgYBnSlav9BMijMbJ7kF2wmSLVW16QshN4RijDdJFUJIN1t
	 DppJvt85LdPKYeS8WlnlFYC9XUh8/pZoSozZE069l/cJC4gjfBp/hIZn/yVfRC1sQ5Ik5
	 MLRF53G4IT/boP5wU8n4yFLEC0rxw+TWx+Sr5fD2uvJ/ksTZ47/Gxf7ZzK3qVwgTGk9yp
	 XYRtTfsgoM0gm7pFnLocx/KIhh0BciPMPpReYQQ11eMrnaNO1Yc7DFagvtZ0a2pquDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0kM35MM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evuPWXBg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257FA606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 257FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0kM35MM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evuPWXBg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH8Gv2487483
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=74mX4a3vRqZEyTV8MaSaXTpj
	++Dtm74ijLlv0eeiueg=; b=i0kM35MMHabLAbMOP4SVW3ovhIuBCRprPcSdpGRR
	1j1pJ+96IZXsT1MNg5tMrEEZnBOBuXNHWOA6cWZ2mVHyqAqy5902QVXjQuADfDTa
	FjLmZBnM+ld51CWIcT/1sDPHHKSP+DDHeJW57IM+TvaLWsfoseZEfNUtNjAlS+pi
	9jxNWzT5jyZTWr06p4kc2eBME22hGa0ju0stzwpMyY+qY/v7HHcs7Wv8pVBmuyUE
	d2163ZYt8oynYY6rPHZt0b8nAIkCVBOU1XqCtJ6H2H6J7bBLeraUaV+EuSmPY2p/
	ODrGLBWyO46RnmhEkLlUo1ai/Ca+7RkDRriy1Okd5fVvpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy035kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:35:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so892308685a.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 11:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462523; x=1796067323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
        b=evuPWXBg2S1HDs02kVAFSafa1UPDJ/qwUXhXw4tcKqyhkg5WJz+fJ9pxPHc/oXbUUa
         QeyVeMnGivjh87mhEFVW16GXiiTEns6O2+61ZSlsQiCKTu1M8MUm/QtcAOpj8f9fgsbC
         tSQvql/i9k8TOGkxuZZCMmig4n47F67fYOTO7eeLA53Nh3ZVaCgPm7lVOzgPoi8LihK8
         S3cXpxzm0L8jjgQzmL44gLOI+59swUHL3dg/6wvBV5waJaLKp0M0Gi2AcLClC8+5/UJP
         xNgaX8iGcxnpdDKoZiHe3IyJlFXDY2wjIPtPcolCB+AAuNO0X0PrwR0f4sQenwuzmyAN
         sEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462523; x=1796067323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
        b=VkH0nKBh+XZ90mKUbztVG8OTAofg8ziCz2GROfyaiImxHzLXBGsPbWeMlJC1lRhaNp
         9W9/ed8BgbMB0uitbQIvRqEjBcjy/OyTjoAAjcvn8t5/KiHCZS8n6G+hlw4+5s4T9Y0t
         oG6IcqugCygO7OjIW6v9K+aWhefbgqHdqljz53r+RwxU3kAKa8qds3esn6t2njWwP9Cg
         NF0nf7KUq03yRPzUQIbNNxzDtb6HP1fwjTqDPsa2NKCwtRn3BeOusEoFZuUPn9DK7KgE
         UvJ5ae3+MgjBylUDgQZgodm0W32yUOQUrtsi74H/UkR9UDt2OGkNLvEHbGS9Wt5wnh6U
         UN7g==
X-Forwarded-Encrypted: i=1; AL+hErEP03H9o4G0K0dCNdVHr1yTREGsu9g03JHd7YY0Ox5LNr90591/7Ks+OZAxAqbv9WEffseqhfkJJWMrsg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8B+eukz+OL5t2SS0PoQhZ9ICFRSTO9ZFb1jcNZ5wdxefwfegCy
	KLV25zTaO41W6eyeKJpSQBX6jnR8XMaLwmc/tJofXIAdDR9WcY7IfVPkf4Nt9BAmTB+Bvcki3Sq
	+slBLtcIQJ0FO6xi5qr/W4W0TBQNR6ICslsPkbBlfn3ZNuR2xqm6NmFUhXVXOayxv+Q==
X-Gm-Gg: AZFdTZc8Gc4ji3Z75pARzcOvzKAgvSl8AdXY4PNzGvT7o1i6mf0lAs71zCANT/+rRRW
	QAorlQBuKjq03pXSeKKf3E24yJC+Qq6MtDiZ6iFi/+SPdfB5g/Up99+ps5+wiCaT8BiDsJSrHB+
	HAUp5zCXhouGrBK7cJVGaF2dQkgDcctb5Pq9hjmuVpM5frKLbfQ69R26tumaHzkjy3TmHlUmmGi
	UgiPnGIjJcREeYSQTJU3qoDxDVp6rP4fRqi4GAX0+zFqAY1JmgtXSdcMoid+Mof5JiK3mI3MVLw
	bLYMMVLT9a1pxBmB7f4s/Hvqi9duZVe8FMgIBHfzHLU1ZfC+OQqegKUAXcmdw12kBoRtYiDRqOB
	JWTpQ2jkGRlCmwWkWeMxsusc5tKu7ZlJ0NdKcYyPt+P51xfIqLE4bR/KMyfZN18eT
X-Received: by 2002:a05:620a:84ca:b0:949:6fd4:354d with SMTP id af79cd13be357-949ba8483f8mr2134936085a.8.1795462523408;
        Mon, 23 Nov 2026 11:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:84ca:b0:949:6fd4:354d with SMTP id af79cd13be357-949ba8483f8mr2134926885a.8.1795462522682;
        Mon, 23 Nov 2026 11:35:22 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm184963885e9.3.2026.11.23.11.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:35:22 -0800 (PST)
Date: Mon, 23 Nov 2026 21:35:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Subject: Re: [PATCH v2 22/24] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
Message-ID: <6ps6o4mexhrbmcodgl3yze2pobq2vzao4lrbhqomhrc2vbfjb4@zmuby52sku6s>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX5EqoQejDy+6w
 hNAFBuSksv8EMXczhMQsn6z8AcgfLtQ0/W7HqM8ht/as42WlSJx9TVc1sfBDA6VlqvwSgYTlh8v
 bGAQrCEGd3ATwqsBVDHWKmzW+pqqz8h5OcrMdYAqp07ZFV4ztcjxSO5LYDQ8eYc8lKU2a6mMloU
 D2cX0QMVIFciqJO91rCSR7nKef6Rerhc1UbeFxtg8o9J2WcJIkHXcea7/8icysgBhL27V6Zk6zd
 l8Btbiv7ApkiDKn8yavwCw9vtGqqkVtuFlo+yjBTaLUB39fXv8xpGpFT8CHRxX3/YwpKiLTQ0eG
 A710vLgmOQtcj2BjMJsELi9p8OlKyP0IT+DkvD865/ArDz9N6pHWf2BJTMsUZkbx0CI4/9y79z1
 s6wwxEp3qmiUhGISExrVk4AQ35gdQn2Lf9fyWlSje4GsqqeWQ0IFg2OIOCricK9wb66lBDI+qA3
 cwiA4bLUa/x31aHD43w==
X-Proofpoint-ORIG-GUID: ZHErqCWMNao3UZLCXXq8wcZxm1w0sdnN
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04957c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IQcQmC8h3zhotARXj3UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ZHErqCWMNao3UZLCXXq8wcZxm1w0sdnN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX3z3hUEjlwC24
 tu4O6nZEUojai36MWTfYndVpnYI/FEUQrx3y8sg9vbdQXOIJAZLZmry4ufGKsV1dH541n2y2NE2
 QgBMHmHZK972eSX9U3vwwbQcB7/DnDE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-22 16:14:35, Srinivas Kandagatla wrote:
> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> 
> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The playback-side WSA SPKR codec DAIs sit next to the speaker-
> protection VI capture-side DAIs on both WSA (left) and WSA2 (right)
> buses on the same WSA Playback link. One MM1 playback open brings up
> both chains via the machine driver's multi_direction_codecs flag; the
> SP<->SP_VI control link in the topology handles the DSP-side pairing.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
