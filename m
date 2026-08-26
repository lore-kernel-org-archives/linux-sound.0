Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317DA3BBFCA
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737398; cv=none; b=hiJx2AmjwgywZX5+Xv1kYpIovhqRwIGBY67ZNiUGrJWHAdJQ1vu+tO816YRY+eNa0Kap4Zj4dkX83Rk0Rzv+8CFtA/WEd+Ew3Q9ysNR/5nANuB/oAIlE9JAzf+l1eHPl/yW/xqmtgO6sJ1m7MV02+MNCEd9ogrGEwnkUW2+PdEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737398; c=relaxed/simple;
	bh=RxPP/KygzieReiaUUbnP9JD84gbVNpUwLXjmMEnNHeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6mFkSnIbKHXKVNi3ZB1jVp9nsWuDlTf9mGp4CsuJ98y9m6SI3TCrnnj1MgjT4qCRM4xkKKlXmSf9IKmq15/8uemwgKD6r++oSnNSYmVql9fn0aKQbEtzlLwTidX/5Asv7KCtCRE10YNLoHsEWhuyHRrtm0/oNvEoyyi7+6rHEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJ/EGBr7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AacYQ8Db; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJ/EGBr7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AacYQ8Db"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9Cfwc4065858
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 09:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjQhBuqskdUFBO0f/zqMao6iOGEdlMCcGr7zbekgvn8=; b=NJ/EGBr7DDQg845a
	CkrvXcF/DlBqRz98cy6yANqOMNls+bJEpTXMYzm6U2S9daX9RlCZ6xypsYYpr13X
	BUPHhF7kv4HrbpFUmE9uI9r8nL+O9AwPZPLhgkL0QKkxgOIG9NIyklMFJl2IOrCU
	+p7iIthftlV9YiPoiZHMn7G7x10Up59gAi32++3Z5ztDzcR8uP0irkUYs/slf3H5
	tZedVoK+bZ8qTSmVOn5SQdd70aSDGxAsh5OEGFFnVTwqSN/g+hgqX5VbfFREP2uX
	AmMxmPhC5OjE2ksJofMPzDiDNLd5T6SAjRHGkaMoxDVhDchjPKej15X9ja853hAR
	w8AksA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn386g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 09:43:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283df62d68so8778281cf.0
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787737395; x=1788342195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjQhBuqskdUFBO0f/zqMao6iOGEdlMCcGr7zbekgvn8=;
        b=AacYQ8Dbe9UgBCjYbLebXWEg3wciKdisKGQLRzqkbi6MzvFbm7YutgIqcTtwV5TRBe
         Dq8waveaISKz/FbhpH3aEgLSmrRF3wVYH+ViShfemEBerguzUsyIJh6X6oLOIDdy9des
         sOIrRjbwv66rLEBckV6llBVttx71TzV97bC5K518fKSTlAz1lhmib428cgs81kAYQ4CV
         ATdnlULt5O7LEy+o9qu+g9ead7wpfzLoZdBfEJ5qMY/rmcw672fYq/g0b7A9nn5oLvDj
         fYz4C7Tamq6A/PKIBWmqMD+F+wHpanGg3dK1qxKlNmx2T5zL2tXl0GeCSDSNI162cs53
         1ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737395; x=1788342195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjQhBuqskdUFBO0f/zqMao6iOGEdlMCcGr7zbekgvn8=;
        b=YEXXgKrBOsltI4dfK7hGQ87rJTtk18+cikc8/DIWrnrHuTFjrUDUOShfJkDBRUziZg
         gMoDsNjNbdzIW30THAUyAPhvoBHVQp2mXZBc7NMFQgSWZRgItbIo4WsrzzQ7wbqbjj7K
         XqQ7ylPDdsO2slqbXzDHTbD4/ethXCXAU+MtdfwA9knJJBI3PNkSPTYiV6Up9MY29gWp
         IuKHZiEU63aAA44QRHMP40eNdrOSIg6ivEhnu6dA6bOvdV9JPGVswjHtQaJBsw7zjhRP
         sPNhwg6Y2e8AaWmffFCqQeqHmE6seQRHYARwaaMI2xrd8YyDYFW0x/GT+mmSg0wHFKAm
         PQvA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3CSVf90a+JHr/9LpJ4Oop/8lI6Vl6l4iNXmx8JHQFT/PAToikHnzFsxJgg3fN5KcDUCM8h/aiaMzTLA==@vger.kernel.org
X-Gm-Message-State: AFuF++kNyRc/CThu1XpOyji4TB1j1OpUkmUL67YFNts0nxrwAtbZht/8
	isXvNjv3vtUmq70r7b7Wcz3mZGWxGdOzy3NDmDg+Tos8sN/1HA8x9gKsjIjxxGLY89BILa3FRZl
	tgUVywN6PW3WCArvn8wzROFkEOMRVpNLNIWgpP/ahHkazcgCZFY8mPWdrBY+2j+vl+w==
X-Gm-Gg: AR+sD10of9PohbDpckYPP7rVNU/R9T3Dx1xEBt0++Trc7ckpiuiuaegYUeepoHByVd4
	LuTzNiCNZMC4i9PKDOi0VVoRth4h6duuEp3ilWouXAxKKYOpZiQ9EHAPvLmdBF+pCEw9QH2LemF
	RqFWojNXnE85b2FbVp6GIHbYk4RzCoCatzOeYCgS7MY3VEU8I1lJBYmBM0sgDORGJDE0QO3DXlz
	jZg42HpzfzEw25TXpgbX29j6o8+j1yLgaRzxzsOvoRGKhdv7rKj99HoSagYF67vet11LmgIvXNu
	glb7mEBiAf5Rg6Z8FHwfGzmIRrzMYM9u70CKNV5w8fnsAqvi8BssxQZeQlCPycf9qT6wfVlBjz2
	GHOyrdqqevDYluy/LWVZv4si7agc=
X-Received: by 2002:a05:622a:244e:b0:528:3ae6:14b1 with SMTP id d75a77b69052e-52e423e3af9mr52733401cf.43.1787737392347;
        Wed, 26 Aug 2026 02:43:12 -0700 (PDT)
X-Received: by 2002:a05:622a:244e:b0:528:3ae6:14b1 with SMTP id d75a77b69052e-52e423e3af9mr52733071cf.43.1787737391945;
        Wed, 26 Aug 2026 02:43:11 -0700 (PDT)
Received: from [192.168.68.107] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e4f0c8f7sm1448336f8f.27.2026.08.26.02.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:43:11 -0700 (PDT)
Message-ID: <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:43:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
 <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TpUZQk2npZehmjpc7Ec7d41dlu3Bu7Yi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MCBTYWx0ZWRfXyR0qvPj0AgRx
 QGMURLe0EivxIlyWFDdEA6uAyWqiljYOo6k4Wo+arDYefYvN3UdeVOnhD1SATqKfmRFfST829vA
 51ilseC0Efpbb4LYmJnItV/ZD9kcQUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MCBTYWx0ZWRfX9xR+ysEo2Dhw
 j00//hzxat7Qb7EkOJ9l+/5wcIhqBFYgRR3B5yJwbn5N1YNx17RTYTjKttifAYfjMpLzlsnB1Z2
 hBbFmIUVfA59h2NWPYKmq2pbTFlxoGCPbAywspwTxu2Wmf0cRsFNAWwAHR7hY1midT2S9+bOchh
 vhwW/3F4lYc8Ycx/mO8lwv6RZcRDdkSmYsC/WL2PSb7apecwgSu+LtNlDH3W+jTAC67NdCY/17B
 lkiMy/8QIF+3H1ECQQbpqLnDdyWx6MGT+2Lc+wYMWtZWhnhDS93jrBLvQYFd3rhfZU/e1v2OUDE
 biu9NS8cEeDmOVSJBvGChGwndgW/aO/FxEMR19x7OSrJ9YuN2SCxVes9nZn1hPcVoBxIeNpHZyk
 SCJgrieU40K1pMLH2I48Y5jH6LP12qSRz5SXl9emvl/LgaFi/9/9Em0uSHnOVDEjV+F6Pm3bxyW
 4qN6NcR6z49+Ui7aClw==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8eb534 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=CtHDKKOw7fTWfhNV2KYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: TpUZQk2npZehmjpc7Ec7d41dlu3Bu7Yi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260080



On 8/26/26 10:39 AM, Harendra Gautam wrote:
>>> + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activity codec.
>>> + * WRDMA channels collect audio from the VA codec and write it to memory.
>>> + */
>>> +#define QAIF_CDC_DMA_VA_TX0  246
>>> +#define QAIF_CDC_DMA_VA_TX1  247
>>> +#define QAIF_CDC_DMA_VA_TX2  248
>>> +#define QAIF_CDC_DMA_VA_TX3  249
>>> +#define QAIF_CDC_DMA_VA_TX4  250
>>> +#define QAIF_CDC_DMA_VA_TX5  251
>>> +#define QAIF_CDC_DMA_VA_TX6  252
>>> +#define QAIF_CDC_DMA_VA_TX7  253
>>> +#define QAIF_CDC_DMA_VA_TX8  254
>>> +#define QAIF_CDC_DMA_VA_TX9  255
>>> +
>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
>> card registration to fail.
>>
>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
>> beyond the supported LPASS port range.
>>
>> Best Regards,
>> Rafi.
> Thanks for pointing this out. We can either add the range check for
> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
> qcom/common.h to validate the supported DAI IDs across Qualcomm
> platforms.

You should add these ids to
include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
conflicts with common code.

--srini
> -Harendra

