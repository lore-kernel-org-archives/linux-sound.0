Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27D83C276B
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836667; cv=none; b=aNnEBHEntcIx59nQZeldKLufimlgajKqCWYVRntpGzp8M7Jjxm0h/nKyhXZmgA55RZACs5tfwpwgOBc/FOzSAlTUa4pszkC+b7pJzwdSa0+caxg3/x+JIgo6WjpT3uKvE1nwK/HeUNWD9ODKYQRzmecGckcM1uwabwHtgT+g8v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836667; c=relaxed/simple;
	bh=JZTw67nNsqgHy2aR+AH+SpVsT+MYJ6AXI/iUpn9bhsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g6aT3LBK07fQHWpyVX7Y0T9m4fHcF8vldCdqNtzB90PhO/mthecEYZVXm0ZHr/6vPv5DBO5HG9Q/T8trBDczGuWE5LcyFOeVEUlixyx6G/y+l+a1raHqttMFFkC4BN4VAZjoMVvHmheHN2XlCRpeotmEhhECGmEyv83ZhnNXGNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx11sRa2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+B7j853; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx11sRa2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+B7j853"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5DKNf2678563
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 09:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RPVEd5Ws7PMkL2UvTGYvywwSu1vfE9SuAGTbdEXzWeU=; b=Xx11sRa2zySAoaeZ
	JJD1orXvUJtsm9aX2C2iOtVJR7W3tbxneykSHzsu8qXpFY+YX3JNKpwchA4f7sU+
	+MH7Jc+J5+G2WbnFUoFUayxQD5movL2Z4PnOvwUkLKsg+VU7PN3lf3jDABMsBdqk
	bAyDf6cUr16Z8UtG95LDY9ME+YCKJJIK0k5H4IqgqARX8F9t/MYRzD8GLNz4MgEs
	ysYwBsAHtqfHZza7mhpIKXWwfXNwoAWI87w5C2oDugX1cFr2XV3wpPlrFzh2y6EO
	HSE6WomD2795xwg6FStTU0pLFqTp4IAF+9O1bGwIf1cFlP7dbk6wz+aSjMDj0OUs
	kxrbUw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vtke6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 09:17:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575597e1259so198046e0c.1
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836664; x=1779441464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RPVEd5Ws7PMkL2UvTGYvywwSu1vfE9SuAGTbdEXzWeU=;
        b=U+B7j853M9EaXdq33jX2shedWvuy4xeIWPMiQhUZW/alLKhF6bBsSeUkQjKP/wijX9
         dD8bwIiRkv2SEwXEtFZYHMkslFihOVOUSqLzM4z+mpwqC8QqkPu4Xpu1LjqMvg8mc6Xq
         PfS6CCQGOIeZ61Z2T9Ggw8tMxKWzX+s3pyM1kubDiWcLlvaIx1aIT76xxe+41XgGYTOC
         3WFwkvYCeqvsDCoFqHODakQq7G/c9qE3K8gFNUuc9mvobTqrfgQsQWv//SfjWxKx0cA0
         uNXl0sUPcyq2miQBsyiW//ny9biuUWTnm8QxCveD/MLQ4XAuLDxqTrpiNr2m+EMiUfij
         WypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836664; x=1779441464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPVEd5Ws7PMkL2UvTGYvywwSu1vfE9SuAGTbdEXzWeU=;
        b=kCc6jX4EGxkVFZP9xcCca290iAbEzNkMnp27+3Dp6Ju/EzabvSaaeIpFAusV6w1GmN
         iFNaiLpjN823HkhHsm8sXhc0Tw/Ag5xRAwgOvRV6i1eXNyUFHJw+txjx+3wROnl/xtnT
         jveZlHHXVPgoKmYeGM7VzUVfN4FlYIqx5WoehoqPbRG61ssiYjQA7Fs/MpNPNJwl9bXK
         jHByrf7h5dx9gd3d/S9t69OvgkVX/NMz1G3i5J1lOLEFo6D8s5wysSH0Y8ZlHsr0SC/z
         E/DrFtUwgywQiDEmYKNcxnNBkMtXX7FvzJKcCAwIXQ0xDNoIImVABHXXHgLCGP16TewM
         i01g==
X-Forwarded-Encrypted: i=1; AFNElJ+4n0Lhv4vdRLgUbnd1IxzyWeytNKgYidpaVRT3i8dXWnnkcGENAv2zCA9/BOOh+OLGmUuWJqPHPy0geQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL2p0He6wd0cxClnqL1xnThCgl002mQtM1t8f2K7EYHYipICTk
	FpEVPF1i9hntss4D/BDYI65CfHFdWiqP4i6IWZxhyE12C5n8uR4yE3LSZRPKYc9WsBgtX9LZloo
	FGiMOSK2Lss9uRTW/z1Y+o3JN4dRoyACgLp+VIFCoMZSTy9JgXPPG2xsMLmo1E7NIxQ==
X-Gm-Gg: Acq92OGTyx7zsnswQRYegD32LYEJzYaJFUY+9a/8n6Dj9cI1FjUUmuENmRG4csTd+0F
	ABy0LGmUUfcJIU5AtIToMjI+g3cwEH2gmOHjAfrYWtYRF7bQsH/21MrQSV5GB8VySz6w1EPtCYg
	ZV3PC5ogAXo3UcPvX7F5aUpVZWPaQRS0MgoT0cTSJoA2AzrqDzh+EaTINW0Iwjp26vAeUJ36Ltx
	M1TmvQSYnvWMj/yMH9v67BAyE+xDHoyVgWg+4VALqCJuvPEmM1v9mGY/bre5CZispztrkuLvlc8
	JUyidswAtut47Mpxxvbb886rQyy3aCzsqS/x7UdNqi7Z/8lIV8xIZnkZe6niwHk6Cea48zlge/Y
	L/dgFuRY3SMw+ofFKvbJ4e47vUBoF9QJ3bhS7JOf8RmyJXVZE
X-Received: by 2002:a05:6102:4a8b:b0:631:26f6:701c with SMTP id ada2fe7eead31-63a408b9ac1mr1501091137.31.1778836664085;
        Fri, 15 May 2026 02:17:44 -0700 (PDT)
X-Received: by 2002:a05:6102:4a8b:b0:631:26f6:701c with SMTP id ada2fe7eead31-63a408b9ac1mr1501086137.31.1778836663684;
        Fri, 15 May 2026 02:17:43 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bd4f4e21b1esm197389266b.44.2026.05.15.02.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:17:42 -0700 (PDT)
Message-ID: <9efb40d3-cfc4-4db0-9568-058e51292a40@oss.qualcomm.com>
Date: Fri, 15 May 2026 09:17:41 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC q6asm race condition when stopping and preparing the stream
To: Richard Acayan <mailingradian@gmail.com>,
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <afS7rTHdc9TyIeLx@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a06e4b9 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=TA6Hy007wzxYe2ctAm0A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MyBTYWx0ZWRfX+sxVTedjR4vz
 GxT37R7MSzi5AtzRmLyb9vXWjsUOg7Qf0P6uFekBV+5Qg9BSLDqabAuaBhnhMO7OZ2YEg3bFC+w
 zl7j6vFrhuXxNVBnLoRJebvfcdZkSgRee6ALsG90u65wO4LgpKju9nsCTByFcDf2xb2XET9IJ+i
 U1yqxwH2xGBn5xFv4TFZKEQR4slSKhCHjDLAk6NoG6Tj4jjQz1KpHAaUwFL+vATVYWc2cypoBk9
 lPSknmQN5UAefaRJsCbV0hTceR4ySCEAAbVcJznvmKD/udYWWGhKbBcYG07XMJ4Osis7X8DLMsX
 moy4eIu/MuXVPnm3Xvx1Om315Xvku59taABVxC8657utEnbMEbfxU1dc6Gr9glUuCmGOxPKXmUp
 ZvmKptYOnBT3n9dTCXB1/4em5iDPSavG/cnc0vDc0hy8ume9DfCzHoIvx/cNwwy4aHurzQ7nkhv
 NIZ+fDL3bfY/lWObPzQ==
X-Proofpoint-ORIG-GUID: FOfEtpEHdtmhP_4i0TwuyWLyHjzqRBLL
X-Proofpoint-GUID: FOfEtpEHdtmhP_4i0TwuyWLyHjzqRBLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150093



On 5/1/26 2:41 PM, Richard Acayan wrote:
> Hi,
> 
> There seems to be a race condition in q6asm when stopping the stream
> (with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
> driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
> ADSP. If userspace decides to prepare the stream again in
> q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
> memory-mapped region appears to still be in use and fails to map again.
> 
> I believe this race was observed since commit 81c53b52de21 ("ASoC: qcom:
> qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
> need to verify. On sdm670, we are coping downstream by keeping the state
> as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.

Can you please share the full kernel log.

--srini

> 
> Can the ADSP emit DATA_WRITE_DONE or DATA_READ_DONE before CMD_EOS_DONE?
> We might need an extra stopping state between CMD_EOS and CMD_EOS_DONE
> so the driver doesn't request more data transfers.

