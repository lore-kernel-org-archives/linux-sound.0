Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462550;
	b=QpJR9NCmJH2nirMEb0OfQ14i0xEYL4JQfDNlQ1yTniB5qf9/hrkLOesanH1EvXQ6Ek//
	 bc5cfMR/Dw8dLi5RorciGlJcLutqafd6fwKKFkj0kAy2d3sj7XLyX4Nh3IOCK6n0ArppF
	 Lin1pFOzXsglulWjKZAlW7YVr9WOKAS6IWuJcLSKsm/OTbzqenoh8jCcQggoy0RY8bBW9
	 D7CjG5EIJhDJ4O7+S/udKszO/7RXJ7bvh+Q/2AIIEF1SBaRnRCR4bqVWtpLBAL8lAcUf8
	 4/ET0n5b7Df1CnZcmzRIS0J7WXNbemEqZjSnjJncx7HULPfrU9ieSyZKi/kesWCzOmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
	b=S4S/pEICbI+1vn/HAzwIuUaHDYOtRkEyS9fBLmZQOwhhuppCCbOxO3i1slpYwLltr/uO
	 o2L0qXhcVVZIW+hp6vzIhXqJkvf5hWF/eNpC13BauoRy79vEkyH7AtYSi665QYjMuKSOs
	 N/l2l8s4oij1MfvBLy5SgUXqLkJgL0YYYXRhahriHR/2QgRoqkKEcG0jkwbloOoOChDD3
	 v3TAWfQIWuz0DHRYA4vsmwMv3YY6Ni8dt+HHau5rlBodZ6TNX7b81hDnVaOKjcBYVsXgI
	 SJjUPIGOnJkWGDnygVBDPWy/N2NQLXYytObahwHJNyYtRdBx86NTCd2jrGPlnKEU0Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbW++9hU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNvIce9Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0334F606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0334F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbW++9hU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNvIce9Y
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1jHu3211886
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ATnvF+h260FN8MLJBDwPRObd
	JGnZLhXg2pCZXyHXGbU=; b=mbW++9hUY1fsY0j9H3BpmGB5uG0rq0SXmEcrKWuU
	Wf9JYPwsuvAOK+PxMP6Kj2JzDlPg7DrlLg3lK/QuOAv9ufsKe7D8kb/iiU84RafK
	GSX5Q0Ia8SGbmeXx3kecdW1ekt4nqx4aRfQ+q6Ge0Sv8wg0d2IvUmt4xfT2tXbAF
	mSkuTfXYcLzvmpC3cXl55FdIZPo9mD2KRqL11bK3xKGobnxx7UQMisoVFgHnWfuo
	kdDF85Ike6zWOL22+nXTEQ0adUvll+OdKsjQ5hIHBayH1Iyr0+e7mRYxHiHSZ2UX
	Gvj2jesB0GjQyyjsoXYd+71GxaWKkfvx67aV9VXllJO/NQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr4jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:35:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so598861785a.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 11:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462548; x=1796067348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
        b=FNvIce9Y9kl4KucMgjkVaUy16fyeRO9AkJnYoQ2f3mbyc16DaSBE4X0716+/GTPnZE
         MX230URmWf1ItEIC+95VmNbh1gpJXUw52WGNRPLPwnYTUJbF38aNYluAhr7RyhLNtCMu
         0zNk1MaE9wlgXjWvifuDUzlG28NC3v4tObJ+1LccpSS50pGJAZbvEj3vItTXnFKW3yca
         Xg8gtug1KEyef04U6Fp6oZxzQ18oT7BSqx6DVJHXgqoVKet+/kVNTJeVe6Iv/MSSHOcA
         vF9nDyuAfZ5Q579Jaadp53XlVjgCiEIQTp8W7fd6kTnuy2Me/Muv/X0woVwJxWIv2Wi5
         /urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462548; x=1796067348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
        b=HNpSdBz3q2CdTt//wk3lP3hlT/1X67tYx+kZ6d6LXcydPfz0jBleMTw3SsrkJSSuSI
         xswTAUwNPKfnelzIOGEoHz21yOOepyjrLOzNgAspjClA7e6tnJ+wBb00M4bvEMH1zDWh
         77sSDEsiMn7UMmlSWAeca5x9cEP0s846Qd5G/MnmMHGUpLjWKzuHhvNeGY8ZoMu6CBbX
         qPBBd5QhTWWDtQLkG+yCm++w1z/veJ5/Xl7fXdmm2g24m/2Arq6PGr/Wy6CIzFlx9qtU
         k97DaKYjnfGdqk+oXuBCGv85CuwswYUFr+gPZik6gY2ztWUQDsbEzw1euq2fiLzXHH+b
         rlFw==
X-Forwarded-Encrypted: i=1; AL+hErGXBa74zr55tJoXlxdiX/AfRZAEGJK6gaS2lCDr0b/IwDhtYEAoRqfby4fj5/Cj/5aP2pgf4ccPmt3sMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZIaR58TqhJMV37Z8ZsKinoZ6Zu+Uqrcr0DAwla0m7gHX9RazS
	Oxao2o+I0ODRmFcINZQkC23IwhEKpQHV07793Y3O/KHr7bWegkNe63rwQQQhW04sx4LGCu6+emb
	O+0kVNWASq76VSQgIzEgzOCETXILL3p+8JKGb8O2PBQkP+5wakz95QC/gL9Eg8L82zQ==
X-Gm-Gg: AZFdTZcXdKEOSjjUVDxWQGwQZQ3h5hE3CVpMYtUsbmyy4xX7BtbDmpH84NLJ5TQvTIP
	LlMoHyoHOxUT48jyaT8Zi/UiNj7D2XU8AGsLKpok6uttQhP6cr5JkJbDkUrIUnztg79j17kx1OK
	5BAA3hXiUJdeRRpXCDR6dpunJxR6qGIq2ohUmVFGSJiJ4cmqv23Wo547vaT4qOaoPbvYjKxnmOi
	z868X37EgFJHu4B7waC7aN6seCBG52MWSGa2ghXFuT9uOVjgu/hS/bU9XJut+QndprMi5UxcuRq
	1klCabtodXVA8g+MxJnW8jgPNjYPdpi9RYsovZWchQa+707czAgvMH5F2bOU+Wk8CO56BBxHlYK
	EBBXKSefQkx5MgcgWGW5umagS6DCPKjUmGMqLqYs0sz9uS8RFm0fkvSVxoAvLAECZ
X-Received: by 2002:a05:620a:450e:b0:949:75de:b222 with SMTP id af79cd13be357-949ba965bdamr2368359285a.26.1795462548303;
        Mon, 23 Nov 2026 11:35:48 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:949:75de:b222 with SMTP id af79cd13be357-949ba965bdamr2368353185a.26.1795462547715;
        Mon, 23 Nov 2026 11:35:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm693167355e9.4.2026.11.23.11.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:35:46 -0800 (PST)
Date: Mon, 23 Nov 2026 21:35:44 +0200
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
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 23/24] arm64: dts: qcom: mahua-t14s: add WSA speaker
 protection VI feedback
Message-ID: <cqt5tjq4n3tezxy7qtqrnkthykx7hjocp3lxcxujkedqjaimi2@6wth3npbs5zu>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwvQGRvTwpjax
 af6jAR86RQTqGF/wkB1KCgVwU5mxRznTGYKZfgtcAamOoelyv2V/z9phKR/jVW9FPJpycSzyc2W
 EwLe8x9DtIIGCN1q6v3VD80sSmeVVAAIta3W5Jt3IeYmwMkoy0fDBJHZ58nss6O7luLMlefZ7rR
 0GylRML7tTCwFj1UC8PW16bQrIMzZEUAwB6FR5vVw8QzJZttfsY2tuO+IhrqyneXwGzQNzEGzHD
 f7U7AUQ+PWzeE04CLk86hB/X7m3ox3qtL7lvumhO16mpyTGJ3fObRbYTCV4+PVYd0jsVjvu4eJC
 Hq+7/XdUUZdiaJ3HIhVI9Xg1Obryat3X99gGF14oYNGSaG916HCwWLWO0t+rtqRmQ55xBga7R88
 2nmz44NY7s4Az6TK8ivyl0QHTiVOX1FxKczCQ5DOeNuPaLst7Sn7j31IC/3WWKDrMKloswEp5xQ
 iYgXYdgFxBuenGqBMPA==
X-Proofpoint-GUID: WGa86gDGZRYlr70P9IuJoMFoms564jCn
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b049595 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mYPpENzYAmZ0sQmgenMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: WGa86gDGZRYlr70P9IuJoMFoms564jCn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX9fAzjtraZRBB
 9XqbcobttvrcRpW3q1qw5Wdgn3ED1dig9jIVa5JoXPUJt7SkCNRx5mfGla/jHNMaF4f642ukedN
 Gyk6XLCviH5KasRBcjDQ4MWcGiRYETk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-22 16:14:36, Srinivas Kandagatla wrote:
> Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAI to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The playback-side WSA SPKR codec DAIs sit next to the speaker-
> protection VI capture-side DAIs on the same WSA Playback link. One
> MM1 playback open brings up both chains via the machine driver's
> multi_direction_codecs flag; the SP<->SP_VI control link in the
> topology handles the DSP-side pairing.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
