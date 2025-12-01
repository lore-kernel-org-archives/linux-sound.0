Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCB5849C
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 07:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764573032; cv=none; b=eWNflvI9vYvO1HI+dTO0D57MKr3/JjQYdApFGjetmWbDxRKnSNHYxorEIEGPFS7GjTVE/s8sAeYhqiXrrMFW0wHJU81VDyU6Sy/1uy7g6Yhw7P6D9mcgEXppUfPBkr8T2cY7lBWQGWfamvwW0DqYa17hlTYHHyrX8Y3XTOM1cqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764573032; c=relaxed/simple;
	bh=sSBBbyl++1YBwkmWe6LW5w810DbS7G+CPeuRO/RI5cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7VsUMZ07GJbIohe2Dvr8Ka2JOrLo9QACm+WvLSsV9wL9FUhetHp1hia2ZLNr3k/fz01SQqrVUtVJVZ3d/GVsruBl4nR/TWZy9A+K6SEYZFgKUjX7im9nDZURclmtOqO1DSvfhiWpBZHpIXlC8JHU0jS4lyMQBwl1f/XB2koPR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5QykM5m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5HO6nw+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5QykM5m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5HO6nw+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUJ04ZK1736424
	for <linux-sound@vger.kernel.org>; Mon, 1 Dec 2025 07:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgTjOCXX+e8VXmI85ZYlya/qKEH2QA2cm5o0ia/m0y4=; b=H5QykM5mFA2aHvfI
	AxjU9wk/2NkVuTsZQr3dAaG4q11PTj4ne5JzK1QoNhz2hWpm2ufKjP9ugPIK4Dhi
	hN0GMTS1raMXuPBq/sTTHFdX/BqotZ4X6LD/zzvPVSepye3LPi4tUpC8qUqM0Mzl
	KoMNTs7OS44Vc556w5W7oWL6qeUIM3TW+LiCTeFcSA+O92Nr//eXWN+ifx3x8J4F
	BVUNKTb/W9a9IxxJhXwybrGWlOwXZ2dLO604cfy/cTnQyTj+W3+qmfIoBxcDyEtS
	0tKCE1n0DS9ftVJEm6caXpXHxvLGFBnNOy/BkpRb9BAsFjGTwjHVpQgTJamYwSbp
	h2+nww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt46bnvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 07:10:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7d481452732so3044367b3a.1
        for <linux-sound@vger.kernel.org>; Sun, 30 Nov 2025 23:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764573030; x=1765177830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UgTjOCXX+e8VXmI85ZYlya/qKEH2QA2cm5o0ia/m0y4=;
        b=j5HO6nw+M8KyQtoWvD5uyhaSTz1KeapkjkcaYSmftTkWM9QhCKXQKmRr4S99pniHq1
         0zQbx+zAgdeWTeI+pINLzb4YmBq+oddUMOwlcijTw3DOfF269P60o7NSM9tu+OJBfKJe
         efNDp9Q7aACDq2eQMF903Kqq1SnqUliNtFuCExFjLX9HNhxXEZCR7b30mJa8i9m7M5bY
         AzCuKp3ha2ukG1IAX53cN6Hf5JmJuSEqiDuizZC4XF5G/EdY6skAlzlS/0QdpybERTZU
         9hdfkfYPr1yN+uSNKEj3RTXEpBona80nFNcyuutAHidabCTbmW+Q/6yuttl+BBQY8xRk
         ZxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764573030; x=1765177830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgTjOCXX+e8VXmI85ZYlya/qKEH2QA2cm5o0ia/m0y4=;
        b=H0wFQ4pInFWeik9FIHl0lktjoyACZKlA9/7A0nE+mpK3EjYiIgntuGFGEpTPU093tY
         F0SUQkxFKikOzRpC/VbhikTa7Zuhygs8h5YyksfufXKP+Rb1m2MdSNFKJemN9tMp+HKh
         dp598N+VX7kLYKoVco+ihKfL0fObJ2lyswzrV01sCLFt4xPTmyYtejXlhV73Yrt3iHOm
         GqIz460rNgTwaiUJCUuegHqD2jc1C9gEXJfVWJLGWustq6zexFznev9ANbD5/C3Nio6q
         nu/W4VQG61OGpGTeo9KrkhWKX7+TYt00kAdsWHMSWmTaZAoAFcfR+K3ncluwNlTdz/5R
         0TYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHEToOKWHZSFjzGCvFG0d3TIbo7RWWmd55S+/i9EzMDGigMLQ4oBnYZ5L4br0MARgqKm3bVNRUXkLs5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbNWY3UM6m+LfH2r/0mC6sMfA80/H38BfMjiyGF+yAyXZBOTc6
	Ns+uSmK+RF+ijyjP2jQyGvWPbTGc3mvF9iFR23NH8NR3CsR+4OZ0WRV9vKcFmwp6eI+tMJggbUc
	8pGMgGIPyLyrAvAHr7Fi/ZvTdYHqdus+Tin81vDRB72JQ0fZusBfjhQR01GTppXoOmQ==
X-Gm-Gg: ASbGncvA45hNnkZA3hyFZw4Llu8njYDAeyG2daYnKz2UfjDgBRomNiQ1rYbpJu/hvYr
	90FEMGqQV9H6BZ5vMhXdtE3QONNSS1WIrN57seWavtODYtdRTjnndxrEXNXbA+paHRIZYZ/nUVX
	4GoJI6wq0g3fxAaVLyG41+0qfr5FGotJcOlgDeNJ4EUdPUd7zrj+dnF0JqXNDTq50fyWYq7GrK+
	YnzCll1BIvs3Lqpicp+6vfejA0NF0+lelOmU/AX4CHeSWiysmPZtxV+nIWlO5yvB2JCyBa6PhkZ
	wUfURoZh1p+mz57TzZCOCGtWZUYoHODJ/pOJ1hfXApInO6AvhwslaryOOwvpPyjzd+PFwLQkgrB
	170vd/B6lSPrh3wgvlQrN+Vlx3WS5xcjrdiTp
X-Received: by 2002:a05:6a20:734d:b0:361:2fe5:51a3 with SMTP id adf61e73a8af0-3614ed92c1fmr41038432637.39.1764573030021;
        Sun, 30 Nov 2025 23:10:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrptRQyAkHikm171nkoxQ9NnD4KJj6uVeHmYE8vhPKAxR6lljfsA35EC9TrUvhWUkTbvZzrw==
X-Received: by 2002:a05:6a20:734d:b0:361:2fe5:51a3 with SMTP id adf61e73a8af0-3614ed92c1fmr41038411637.39.1764573029592;
        Sun, 30 Nov 2025 23:10:29 -0800 (PST)
Received: from [10.218.23.240] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f175742sm12378644b3a.49.2025.11.30.23.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 23:10:29 -0800 (PST)
Message-ID: <04d8f7e1-c716-44a2-a32f-3d124d15d011@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 12:40:23 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: qcom: q6dsp-lpass-ports: Add support for
 multiple sampling rates
To: Mark Brown <broonie@kernel.org>, Ravi.Hothi.ravi.hothi@oss.qualcomm.com
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
 <20251118100203.2751955-2-ravi.hothi@oss.qualcomm.com>
 <be7ade15-4c1e-4226-ae0a-cd58a2b9f07b@sirena.org.uk>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <be7ade15-4c1e-4226-ae0a-cd58a2b9f07b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1NiBTYWx0ZWRfX9ig0CPRAuFoB
 VNXdPj/ze7drUp8cxpI4wMU7hFNbmPk5LxOpNj1DcIiy8tnHcR5N9wYs46e5WtJnMEaY7dH2vcU
 ZtURAke5ICcw3zUtNlKY9OlTKW3pZjkxPYLg1b/Jwev9rOLUBiHm5KoR8iIIT2I3+WEOEoOEXyG
 1jdmvv0paHG9nzsSpVla/++DzN8U4JfmEo6NkYB/WUMU6hYl2u01niiRA0Nip16CvAi5ZvrKjZ6
 XIxcmjjR+W2nzTOT7zVvCJu04B8ovoCNAZIbKuuDSLwn3iT0+C5QhbYfrB3yt/8rXXAF+HoZmz1
 o1oJKe0Q9mT600P1fjeHG4Fu1XDiZrCqKPMecQ7T0CdO2QsR5kqwvWSJ8jJpOwlTSYZLQ6TAhlI
 u3sReJya4zfEIeIP4ze6Tg9oEfyqAw==
X-Proofpoint-ORIG-GUID: iCcmjWMNYZA6TvR535ZIuPSS1ScOt9vv
X-Authority-Analysis: v=2.4 cv=aO79aL9m c=1 sm=1 tr=0 ts=692d3f66 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EnvgKWhcHj285NneV7sA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: iCcmjWMNYZA6TvR535ZIuPSS1ScOt9vv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010056



On 11/19/2025 4:33 AM, Mark Brown wrote:
> On Tue, Nov 18, 2025 at 03:32:02PM +0530, Ravi.Hothi.ravi.hothi@oss.qualcomm.com wrote:
>> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>
>> Extend the q6dsp-lpass-ports driver to support a wider range of sampling
>> rates, from 8000 Hz to 192000 Hz. This improves compatibility with
>> diverse audio hardware and enables better flexibility for audio stream
>> configurations.
> 
> This just updates the constraints, it doesn't change the actual code at
> all...

Ack,
Will update proper commit Description.

Thanks,
Ravi Hothi
