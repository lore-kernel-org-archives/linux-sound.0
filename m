Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462609;
	b=wxZO0Dgkesz2EFsGRioIC/aajLro3BKEQM29qYkY1CCi5G4n0ryvC/TrW25cg/cSIsdF
	 R5XtBqDp6gzsob3H5dE1bx6/zlnJckdzL/qMVzdliPGro2lDSASehblHm0br/xoqTn+gE
	 6r0xb/3YJRkcI1K1KYjxEAMnV/n+Ws3fMWyJo3oOPxrw+xPcQ38aLUNboA1OVBlXrnZ9p
	 x9HM/AaBHRdU+JRTdN5Ex1vVoUiaqse1WngWlhP3TG2eJ8sy7Qj0jTLKaYa5oyH7b6ko6
	 wq5FlbsFkI2Ixo/OVJQCKuKFSQS1MA3Q9NU1nsmTg90DfuJjmUs9PbxSa2F4LMkhG8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
	b=M2ow1bbWNH3TcVnDnWAs+IMMCwT2Q1MXo5YiSEbgzcQEQC85QWsKIKz5AQ+Ye6LtQizf
	 R3ChobF57BAKKASIt/oT2GSJU/JuNeaNNx7jIQ2Yn66Ljx1fQtXQ6qrp5KXGiBNTW3uqU
	 XgARc5hTxEDrfB1P0o46zC4pxGpTLnmC0M9iTZl+Eekxc9gScoiqi/7qDKn7IA0Bo7aFe
	 kXVVEX1tROABSkxHnoOjqZJgOTNz/9vf0gSATNcfrLoQTrdr0SZNzEZzgBYamZJXxEqmV
	 8MIoDQCwXuDMwamfeSFOSZurEinqtDTqgrxfnISxiOPm2HayJFs7dLvPAcjX3ghiSIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVxyptQy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKAti34M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB7606A31E
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6EB7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVxyptQy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKAti34M
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNNVY3440505
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6aU+cchuetqDtzjD9jSrzXmm
	5L9uzDfuqw5ewOyVopE=; b=iVxyptQyjbLdiD3MOBcuca1LHEDdlI/vq7mQDPNn
	L6TB/voo6VsCPcz55NyJQ2q4PbOshmC2Rzxl5Iahos3fItygEA+NnHwNcPP3w33T
	uWgi1qjKEPmolYVbfpX+3zntRn9lIsfl2hWnVmCWRUm5cV/q7TKAZL9zTuDAJs2j
	l/Vw8B8fzaKZNoUIkZk9ZvIwFl7eBD7cUQB2npHEWqwasg5QcPsm2Mz9XbhXOuV0
	QUhdTmByTU5OVQ1sQ3oO8qNmuIYcPKqGLQ44u/rKh5aVjloFkDsV2YfAH+d3CqdM
	UKs3aJBrTnJOzE9A2qSFxkhY7GpGQdwqlGkPsQc9UZWUxA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr81kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 19:36:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9210ec7cb34so99919696d6.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 11:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462607; x=1796067407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
        b=bKAti34Mh7WNLgI2C9TuC+tqXFyihBwGWkk/rJotugXxvSJxfNzciunb4KOALivbmG
         BKDhp5fTyznyglrUoo2fYidmonWKVPnFX3zX/kU9ELWe81fzr22g7XAsiGq+og13RcsT
         zGNvvcDMhpvuMltMz2fI/l3UDLNldg6EAaStM4zfIsAUPAtFhLm1cde0UsraXojq9xyi
         jfZRnaoIITipuOxd/EMIKCn8dC7Sv8EmuFbTWHT7cWMHdpkc9f/zyX5tyHNXeJ5y7dYC
         H4Pl+rvtQTD9xYqfgOlMpc9IKMCoMb7k7lOsrOrDe/zcE6RAOnMPJCEwUpNES4xlsKaN
         wlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462607; x=1796067407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
        b=dB9szZD1h+eqElJWLv2Jnjyw+JVNUV52NQqLlqezBnpnzurhHpHrhjeb1fStHNoa3i
         wLC02Yjce+PlqB96Kp5suPFsXYBQv9q/7jt640cz8Aa6C/vM9p29Zxx29Nu3GcGhD+6t
         o0UgmeuID+wqfrzeonqIHrgngqFjsqr2fvg8uc1i3syc+vQ+WjnjE001Ah8eYB9o/Qzj
         i27E/tNl+g8w4b8iZ+G9EVDAV42I/h98PORYizTAEdRNwALkNlOtaWqp9HgUhW3+ur5W
         zXg+LBVXxFe/xjw62Yk35dz7qMKjNvp9/atwPBm3yr/6lJL0Pm2ijJhs20z4afGHtNzO
         xkzA==
X-Forwarded-Encrypted: i=1; AL+hErHqmbrNf3DuGoOLoyLBZu3kUFhoBewKJzlrmTsbu2Vw5YJx4F9nvm0jkNlemuKPzLNwpjWNy22wOqLVRA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9S+kuqMxoQsGogs/cvjB4dZ2WAkn/UsHIBkde53qsQZs54mKhX
	Y2x9200gARTz+LWm1SlkZlvxaTD8wc6riGuTVytggRYVRdP0BjZ6t7ToxcaLB7g5fUD2PbXKkky
	PlmKJPh9wJsJBhdFF/I4nVvTQaiC9NTuEaNMAQcgF51/5HZAhpulZVRQzJNKrgSY4Dg==
X-Gm-Gg: AZFdTZc5c1My2ERssthvazsOXDZ2Qh9DBf89CE/Wh1RKMhx7pxex8wmjwEiJNPCj0WO
	S1O6/xopCNfk4ErpcQC2KOvK0yoes+ilVjsuWmu/21SpvRQdMMrZQw2BhTnTP6DXyeeLPS0AzBT
	/PimCX5KwF7Id5zp7HKnphihGE8+L41VQEmAlW6LqBlJmlG1fhAXc+tbzvZi66wgjmanPkD+IWj
	Ed12I032Jp6V1g5QqUgP6qYSniUk06aRS7OtL61VDF0BZlinPOFysCAqzGgpLjVqbxdzQ7UT1xg
	pslo09IWEd5rcKxKkrSvyujnkbagXEJ9aG1UlIi7eUug/gbSKPSafgyeGMuYDW01hcYJ8oFFJZL
	kpraPE/oDmm1Y8GyYzMLpLXq3V3h8U+LWrq9sToACe+RnTfcR9aSYrHCZtA8YQu1R
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr2280102985a.14.1795462606843;
        Mon, 23 Nov 2026 11:36:46 -0800 (PST)
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr2280096985a.14.1795462606303;
        Mon, 23 Nov 2026 11:36:46 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm336356205e9.12.2026.11.23.11.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:36:45 -0800 (PST)
Date: Mon, 23 Nov 2026 21:36:44 +0200
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
Subject: Re: [PATCH v2 24/24] arm64: dts: qcom: x1e78100-t14s: add WSA
 speaker protection VI feedback
Message-ID: <j4zssaws6gb4cico53bwweb3755agxwrunxao3ykvbpa4rbzi3@j3lkijgta4as>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3WVjsAL3eMf3
 beWjh6mcgsc034dg2+8uVeMPHvLG+4YdwxeUVTmAvPWEp5+yvMnYJSiC4dpd9NlFAkmAb1okRgX
 JerEpo7nzxai8iVlTfSyyX20lLazwPc=
X-Proofpoint-ORIG-GUID: laSgjJq9-4bKCvdhQx1KMI_Uy8sFCRry
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b0495d0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=M6omgQR0Woip3EZOlBYA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxfnZkPSvNGzl
 CpU6d/Evc9nnjI2p8L9m8uGljm8aLytQUj0uqZdx7N3t9eerfyhVJ+7vlIQ05vDJdRwNUncQpf8
 TKw5eSPCPPzY1Sq8XBBlCPPgHRI4B8RJpk/T0UxouxbiC6if3/LpE/oR64pHkluXSo1Hc89gvhu
 RzD9+g8QIoZW5oPaa1fXxyTvJwhv8ubrQCJvEtfSjv5PQ0cSvMeF45KqsCcRWhomWGqUbkKwmeI
 T73stIV35awo74S58YsOK8qm1U76P2Mpk3LTVYo/UGrXmWJkrNdmuf2NUcbDYTgs7aF6nQqB6OP
 KcM7dAHfjs/CbvF2N+bQ+3IxgstVBFQwI4GIUQHnVx+4UAh0mvCJAYStC/WGkqxE8BZ6+No4m9O
 4M6rrhaPeUeOSkTv9zvtlkA7gJLZWkNuXnfpIXEWp2287O0L3zfUQxg7NMVUK0KK6iZKSYxdHEf
 n58+UwR4Z8yo1CUGbuQ==
X-Proofpoint-GUID: laSgjJq9-4bKCvdhQx1KMI_Uy8sFCRry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-22 16:14:37, Srinivas Kandagatla wrote:
> Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAI to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The VI sense master ports (10 and 11) are picked up from the VISENSE
> slot of the per-speaker qcom,port-mapping, which differs from the
> mahua-t14s Gen 7 layout (12/13).
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
