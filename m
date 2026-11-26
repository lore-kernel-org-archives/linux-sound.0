Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687471;
	b=S5Y48xY7+4YDxxF8f82Z/dyTC7QkwejNJ5KCABaiYO+aTjBUXe9cGyCy6vOwFMjq9fGX
	 EdNpBNRQU/YSy9U3xDgHYDunmy2i3584O+dJ2Rp2mo22XnHNPmEGc1pNv3GW0F6WuHjZd
	 ORZsSxLBr5iiF0ZLn4rR3Zqw72N9YHGEN+2PYLpII/IexhMEH8FHDNb03KitUnOTCmyDu
	 g4dMffhcTZZ5Vjzrr7qXU24cSFlRCXttXuMwHnxl3HYfnApBvC2JUf37m9kaj9VDJ2Vvu
	 2nD4jU0QNHx192O9Jq5c5Fn8qnY52mRsvs0a6Nh0v7EIc/vy8d9sypf9+sojrRRs31Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q9q4oISP+d48iEC4VDxqm6KhZNMHQhm6ABIrAZnzI/I=;
	b=mSmri1td6vnH6j0LM+OHURGyerLRTUfEtmKEx9hUfuNgoRho4lk5OyBVD65griqbfTMV
	 R3V8Wf+nQVxuf2Ywi7FJnpN6+6kW7Sx0JMUylyocOu4gUCvVKG+xVXPIUky++xEya1SnW
	 f/8wIeZ4elR9zmVOvyrRmFAi0wBCUl/9hUqginFfHqZoVoIqqm3vrYyoA7TGj/Nx6kYIN
	 jZhrKs3PfjhJsKfd2IxAuAygChycAzVi4R+R05oSWZ3jVTao4aqucPZ6iW8OFbelNzAEp
	 PkTVO2a4uKblGkzhLPLRwW6ujOvqrKWKY69dAnzTr5rjDfoFYrDx6FtOuhkR3YvB9kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFtC8iDp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EL27T3bO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51369606A31E
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51369606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFtC8iDp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EL27T3bO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B5PX3548359
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9q4oISP+d48iEC4VDxqm6KhZNMHQhm6ABIrAZnzI/I=; b=SFtC8iDpYXhV1ode
	fvwUVn0JHQzdg33UGZ+9z2IwSp1abDbcSYrYggwCH93pOZxJcklPpPtpjA/pkkVm
	rkZOevoDeyQKjapUEBVvZRToOtJaAXsz9JPosZpprfz4J/x3aM/V1uY5PSREsbCo
	mx9o5SxrzrEbd6CcU7dsniPxV+2I/9WKz3TuMPDW7MwvOJdx+X55CdcCSXLhvnLG
	NwDFP7DSpTaarFbmX5GUb7N0pOzh0t8T6PZ2lGqNhOfZEWsu+jFi8Ui21isp7dsX
	bkDrMiqXesUhAc6WhoKcx+ODDFT49KX58FO3gjPTUGuhFGGFX1bugc2biUXL36NQ
	CRI7jw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vauefr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:04:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so1489766385a.1
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 02:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687469; x=1796292269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q9q4oISP+d48iEC4VDxqm6KhZNMHQhm6ABIrAZnzI/I=;
        b=EL27T3bOsqW3m2wBzs/602UAelKGs+uqt9kbpEbvu6YbY1LacQRPx3dOGIz97RSve3
         d9mJ1Nu7LG0yDPylW/mujtYB5ZK9SrCkgSjAo6ODdVHZZSXXzcXwC0qAHZ3okIfy48sY
         RVNdiuYVejrh9VDxEiD/YSCwqV6Ou7gylB17HRbKBlsVtRtpbENplmQsgipGDSPAH3dg
         W0f5GlrK2iWwynmSrccd0rjeu71ETyN2tRNdADgfMHQHkWJMpNIhJucZ/l/RrhxaxLWo
         ii1VJ8CXVoYnV8V+sGZ1T5xuqOm6G2IoWopkVN8hzEICJESI8DCYcZRIMmr+9TOJ88Jz
         LWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687469; x=1796292269;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9q4oISP+d48iEC4VDxqm6KhZNMHQhm6ABIrAZnzI/I=;
        b=MnOvPypweBkk4SxsrZzKqF8lBd1OCXJzYI9OUJTor0CXeAZzfjmOajWwE9lCowkLw0
         ang44bpxyjn8Xv3w68KBFwwt9ZuRYmfDAz+okb1dKiZEyUhnCf3vbedTq5BUAyq6CAoh
         4zQPMpVs9kxj+ieFDm+8p7bY9+c3vOtlfpc9inmxtDMK7mM5sv0S1mKaqssqMw6Sq4mA
         aW7qWQov3U2CKapnDzByC6cueyFxPlmcGtRiyWNw3YPMtw93V7R53seWP4UT3ze6VQcO
         uu+4G865kSh3cLWCEYXAFay2k1lKZ7hLV4cogKXMI4sEDmRt6/gMFA7jDXOcC7WF/t/1
         7KAA==
X-Forwarded-Encrypted: i=1; AL+hErFMPL2UReL5aovaa7HfqqR7aFpZhwPkJiy52mxgG4Ur0imFpKNWrjyPJG+W+aRgkMOBMw815opaW2Pwow==@vger.kernel.org
X-Gm-Message-State: APuU4Z+mrdFXTZckxrBdiW/HJ5qykAWZoUqSnrQ43iFtydzeIrRXi6ZX
	OOF9hgkZer7ByFG7BALuq0Lcp40pBQw667R3ctSJPtWp6+2Ncm9SEefP+z0DnlAqcJZ7dDlWjvx
	8hZrmYaWIzQWQX5i/rhx8IxeytIKakiAfttTXubvig1xr6gjBw/yi5d3fJivkZ80TLA==
X-Gm-Gg: AZFdTZfIUm5d8YnaQYJu8l5c+alWkE3Miqn/WOor0tIoD2r3TctAY8JyWFi4ZMAl2PJ
	gM5u/fKhzvWQmX1nQCNw/amLapn+6rChRU7ZAuYqCBoTplQjkjJSCl3nQOSEAJkstqx6sFWcfHz
	WBsyEoCoXrVmdpvOX2sZhPphCaT+mXA6ARZq8OM9QjWECYI+e+WgIijPfuwd93vEvjv8gCwADrG
	KRGawodcZpdYdK4LYVaITfLT7XcqAb3ufeolpXyYnZ+Z0weeVEp9fqWskch+zllm24myaRy2yJt
	mYtjzTRSnN9P4iQ2J5M/LM8K4eLb84MAf55eRhm43CMrEmmrc2nZqpedERBI1ycdp9fMYv1qxn5
	rrDkTk3OyW7bkQhtQkEW620U/vi/SrhCnMfLQlahFZrByI56KE64mynMiLEbVmEN7XBXNgtpz21
	n5TA==
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr3216365285a.80.1795687469557;
        Thu, 26 Nov 2026 02:04:29 -0800 (PST)
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr3216361985a.80.1795687469034;
        Thu, 26 Nov 2026 02:04:29 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c513ae66053sm735887466b.19.2026.11.26.02.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:04:28 -0800 (PST)
Message-ID: <fa4d15c9-8657-486f-bf63-bd1290e4ff39@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:04:27 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: qcom: q6asm: Correct the 24-bit PCM format
To: Demeter Barna <me@fromdisposition.org>
Cc: Michael McAllister <me@michaelmcallister.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org>
 <f3485a790ffdafe635b84b5d68730dad@fromdisposition.org>
 <179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org>
 <16b8f649-f464-43a3-b372-868351df9117@oss.qualcomm.com>
 <8832ef4d735b3fcdf48a2bf2a9997975@fromdisposition.org>
 <b9143689-e390-463d-b486-ffd468be0805@oss.qualcomm.com>
 <b6287bf200500db6b8f358b22bfe99e7@fromdisposition.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b6287bf200500db6b8f358b22bfe99e7@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX3ULneBcYfiOW
 BeDniecJEi6a8QZBuoobnZI6pz5Voqfi2iEt1S7G01qVeefCFR4lV4r4kxr80ouuDXTKpaMvJKm
 +e0IJA0OXOgeCk/SjT1n7pXSYbGXFzc=
X-Proofpoint-ORIG-GUID: gDc9CDcmMdljs-RKHrYVGRAJKk2gyz_h
X-Proofpoint-GUID: gDc9CDcmMdljs-RKHrYVGRAJKk2gyz_h
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b08042e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ji1vl-U5_Nbu3xLppSoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXynV6KkJkvSb3
 467z4YlIGp26hu7Rk3aRQYxoA/DfT+JwGzIuSNGEwg8+jBfez3rKWGU/H4ReeVodTX80EfvT8AZ
 dS0RS2gOJby7paJxhxowlsLOLbm9dd+EKQj5VOMuIF2JHAr/bHg4GxDik+1a4BwRNSgqNa368zr
 nXXfIA2kE6PSSXY7czDNkAk7X0mPAZrt5wYn8pDq40NzH9hbZp6CStqhdzQSGKXd1f0E1f1aRNZ
 iIqwDtNqMKMkHgTXdd0kPVyfjpflECB1cVwg2zstOb11/rBd6JQP5PXTpYxGEqqj38RQWbrrxFF
 35LsGvp6kKnf//53kcpYowxTiXUtB80F6DUY9UoeXahhk9of43o7eA6KO65O7f4zWScbss9X8QR
 N+OTZBkBYjusU6m6tCNQv0WJZ5m6QTbjMI42omdvSW0j4SFmYMH7OCGcu74HXqiUPDJEPbYdyoJ
 4YOZ1vdhRO0ZjPKpW6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

On 11/16/26 4:49 PM, Demeter Barna wrote:
> On 2026-11-16 15:02, Srinivas Kandagatla wrote:
>> If its easy, Could you try:
> 
> Tried it: mode 0 behaves the same as mode 23 and as without the patch.
> S24_LE playback is still 48 dB below S16_LE (the same samples shifted
> into bits 31:8 play at the S16_LE level), and S24_LE capture still

Thanks Demeter for trying out, am back to desk now, I got hold of db845c
and tested 24 bit playback i hit same issue.
Digging down, I learned that the dsp does support 24 bit in two modes.
1. 24 bit packed mode (S24_3LE)
2. 24 bit packed in 32 bit word but only msb aligned.

However linux does 2 with LSB alignment which is why we are hitting the
-48 DB.
Now I did some hacking and added support for S24_3LE which seems to fix
the -48db issue.

So i removed S24_LE and add S24_3LE rather than removing the total 24
bit support.

I will send the patches in next few mins, I would appreciate if you
could give it a spin and see if it helps.

--srini
> comes back in bits 31:8. So the mode doesn't seem to matter on this DSP.

