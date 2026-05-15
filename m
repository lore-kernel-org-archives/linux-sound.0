Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593EC40314A
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 17:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866686; cv=none; b=a30nI0TfTrzlTJSYaRO2JjLMhDoeFpUykw3gAb0PRks9AwpHYkVTsV94fZhYBGw4ZvIa1Ac8VxSG49IMqpCMVGjs6AzwYVwskSmUan+u9GEIwskIpvDkNjudBVk8aPdW+hq76FG0SjmFbyuU5U+R8kpuEO4SWFOxAAyEP5qJq5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866686; c=relaxed/simple;
	bh=W8+Ig53lVpXsjPq/DGx3IqIz3WpimTkvM1JWwQQWFUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nVAEDMY7Rmxh7NxZRQot/VtleEGnqVavRB2F9O7KmGScTYFWC4Hu5wrcfhSLY8Ys9KyFlVODAdyU/oeVZyTIZT4gEjT3PCxmWR2IWoZN3iI+RYy1S4wOdD5UAJOBXteNY3uaX5TZRcpad4o8vIrWI2twJkNl90yX7iEBRvqKKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W67+M+7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQbkJLMW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W67+M+7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQbkJLMW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FGQdlh481350
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 17:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u1p71XwV9G4stoeAHVhM1++Uu6Qtd34Vo3RUYJGOTL4=; b=W67+M+7ygw9oZQmf
	NU9l4bIgR95RlgqgI2TUwEfO0ZnM+hRIxe1G9Bahp+lbKa/sJnuwRhiHZWcYm/bK
	GukzqldGA3NBPKtUlDWlEIiBWEv3BmpYXo8536BodWPqVXj7xJhMMJxLzQ6sU0j3
	Meo/MW1jo9yrg9PdJTac7CiHUFPTv6BMiDs6Caiz7pbq1/pfR++FFBvv8dUpCVW3
	IxIlVcJy+xNNaByBTHR8W5bnL8jV0qzkuPg35Zco+tf3Zf2k3sVR8kNlZBcsDq3c
	i6z1HrLS1iZDx1a9fPUuFFx1HzJ8HgvxeQmZzCE5TVtNBtd1jAKo/QCtpkgA+SaX
	MNVu5w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e670u87kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 17:38:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f13da9684so1427391cf.3
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 10:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778866684; x=1779471484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u1p71XwV9G4stoeAHVhM1++Uu6Qtd34Vo3RUYJGOTL4=;
        b=jQbkJLMWGTXe2oSF7qrko3jL/5q3wDsE+1aIwxuegmDLMduLJJefh4MP0DdOP8Bf60
         HGjjJ6hCFUpnGCWD0yaUapXfBUfEQlvnbPkikd3EoE0F2/9i90dA6TgneFDGiyTEbxKl
         79D9/KGP2Ezhbo9Faj0osEoOqleI4D07Rt4wwcvcybC8qF7cIjCGbQvg1lkKJPnW39X6
         2zCY0Bf528v46tnaoNStwOUyTHB4k3hOKVMkn0v+Uz4cHoyGOvqYK3WOY9fWLrPVgMW0
         IePp/SoN+0dvzRRj+8nCzHglViHKppFBUcyETiZMkUCjmtU9RnlUIoZl8DA+fvh6RUum
         s6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778866684; x=1779471484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1p71XwV9G4stoeAHVhM1++Uu6Qtd34Vo3RUYJGOTL4=;
        b=niANm2gO/lfdG/UJ6uwAYakj+XJCR8fnGtTin2Gewo+sMgzsPxEF2E7LBJ0VlfMMm7
         KdABN2D4DJpd/FLROQ+qHOkkbthTTESu3+DRytIkHS5pooJU6DUKXbgSWEbwpGpr4Pvc
         z2OJkQrx9gTI+1I4RFgCj1GEJReN8j7BjONL8iVOBIugTCw4o5ET3wS7NVFV+3I8u0C4
         axDoZ6LOlI9seC4PjdkeZrL+ERFNjRWcvnjWVZxkQFC0n42QhplPY5X43PdqjDeaff8f
         PDuV//Hyj71EGo6yDVyvoNxfoO4pt5SdJRwe0cBVa0wQCYP48e3IWij2vMcN2FJFGqVY
         0EhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QWS9gwgcHkIR6gPBof5u1OjLVU+4A3MaS3tQ4CBWiAZOyyFBsBxTDOpzc/3+hxinnwCPxXuKpfcjjBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXLuNOkfTq+hhokxdOqVhVfUw8H6e9zDr6EExlDvbeXJky5nJ
	8iL2OJD9/nTmKDJwgu5RAvVeBrep1h86uGSi1ecQeJbN8ZJ1ktrx4a40AKiDAHaZ4AAPJrxIH8B
	ZFA56WEe9eSQ1SMdWwKsoJR6BRK5cXffxx2mbnIfGoGiNN/u0RQmSBaEbD7HbVKMC+w==
X-Gm-Gg: Acq92OFJD7JZdXKHQm7EAGMvSLRVrqp//qKrBjjHQM+jCJ2fm8S5Mu+NkbE8IovOidT
	a7ZzwY6VV0dXX9cCXjTlhRZeiEG75HGW8qDUrWh8BQlLkj9fBd3ZKQMQtXhagE7Y2Gq4XcPkcIx
	wNgcxKEAVzYDBljmh92RlieTTsgPEj31ntsyT1neiows9nd9urueYu7Wsxo1bnCGvJgeyhv7pHP
	y1zQ48WPx9mge8LT2g+n86+BnYA+D4ZHoyHfTVfJtD4reB99+1xDrDl+wKlONIh88fzfY2c9sF5
	siWSlgvmybCeu/KVDQ8GLBBcAbQzSuNxGeiSS0oNPu5UHfHXBUpFTr0QXJZp+4er7PWpMsp+0Sq
	McNCMfNUqXsM1khYS0rrTCeFQ+Kne+qDDBuKOcPaE25chTxNx
X-Received: by 2002:a05:622a:59cc:b0:50d:7406:8f05 with SMTP id d75a77b69052e-5165a0010a3mr65671791cf.9.1778866683612;
        Fri, 15 May 2026 10:38:03 -0700 (PDT)
X-Received: by 2002:a05:622a:59cc:b0:50d:7406:8f05 with SMTP id d75a77b69052e-5165a0010a3mr65671171cf.9.1778866683113;
        Fri, 15 May 2026 10:38:03 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm14967386f8f.3.2026.05.15.10.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 10:38:02 -0700 (PDT)
Message-ID: <a5b81f6e-3d2a-46de-a8dd-bf3d6c33b768@oss.qualcomm.com>
Date: Fri, 15 May 2026 17:38:01 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC q6asm race condition when stopping and preparing the stream
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook
 <kees@kernel.org>, Joris Verhaegen <verhaegen@google.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <afS7rTHdc9TyIeLx@rdacayan>
 <DI7G2SF71B39.22LPDZWBG87O9@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DI7G2SF71B39.22LPDZWBG87O9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VCLuLPXgfGeNcjwfaYUZ2BY7zKk5Ah6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE4MCBTYWx0ZWRfX0/XBPJapOezs
 z18zXLQPZE41HDWcVfQ5ezgDn8ycGzdPURCtGmKyPDjVGWSZp/23+XiuqW6FUsg1Elgl6thnaXJ
 wrbiAy3YFupVkOoFZwta6ZVozW7eC2VRZHiKIUZc5x/j3G69EKMymDgbQ/gPV/cDJAjdjtXGoHp
 DqJ5+htcp5rKSweeQERUtc7u7yUm+nsraA55+hOPdbys+BBQ2G11dvBkyGPnwUVau6dJ60uw2Gc
 8SyBlwqa+4A/sayGqHT4t5bem8dcx9PAhD2xaEX1ssR6mRL98nepKneSXIuHS3J5dVOL6iO3Cb7
 3Sd3qqpzYtO7WQrnQdh6U6bAuiNTYasbbJsOumJ/tqrEk0J4lAorvFwsVILvGkL9fwhoK1ErD1U
 J9+TObOpvXonDQ6E0wAt6Gxjj+pEOvo8n45SxvInEH7Q1BFNZ7vy5gPFD0ap+Rblt8AHz7bHOJc
 4pBlNih0wpiNfvyId3g==
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a0759fc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=LyhoXnAi2jyefnR3urYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: VCLuLPXgfGeNcjwfaYUZ2BY7zKk5Ah6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150180



On 5/1/26 3:27 PM, Alexey Klimov wrote:
> On Fri May 1, 2026 at 3:41 PM BST, Richard Acayan wrote:
>> Hi,
>>
>> There seems to be a race condition in q6asm when stopping the stream
>> (with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
>> driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
>> ADSP. If userspace decides to prepare the stream again in
>> q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
>> memory-mapped region appears to still be in use and fails to map again.
>>
>> I believe this race was observed since commit 81c53b52de21 ("ASoC: qcom:
>> qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
>> need to verify. On sdm670, we are coping downstream by keeping the state
>> as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.
> 
> Do you have a reproducer or specific steps to test/reproduce the issue?
> 

Manage to reproduce this on my UNO -Q device, will update you once I
have a fix.

--srini
> 
>> Can the ADSP emit DATA_WRITE_DONE or DATA_READ_DONE before CMD_EOS_DONE?
>> We might need an extra stopping state between CMD_EOS and CMD_EOS_DONE
>> so the driver doesn't request more data transfers.
> 
> Thanks,
> Alexey

