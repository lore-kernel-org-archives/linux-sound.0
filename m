Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E03B3C0F
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 23:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775174014; cv=none; b=dZmKyXQnW55APudXRL66sNlxwHAj/0Ip3tzzcUM31VerYy7BJ2mWpij6GGFue1IKNxMvcUT8Ap9lo7ncBXlajW5URO2mU0KhCI/b6C4zl4SJifgnxBcWRIQH+Ao3JFaJQzy+zl/AvTwwJdWG2zR+2KZIWovofh/ytCqbTCbsCGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775174014; c=relaxed/simple;
	bh=Yg4ysDs0Q4kG/t8HXvX3mU2PCk0aq/j6RJ8x7/yv0fA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGTWmaeg23mzirvxFR0anzYfauJfrPrQf32YU2TYCp5F/2PXdm/5oQ2o7oEzi9+tpg8IfOzlXrN9Cbw9asvZVF1/D3gHseWHzHB/rkgIsKCtYsXJw1ZWcZ/AgbuO2+3pnycmBv9nrUQe89d3K3vI+WD4H/cuBDViq3lplXYsq0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4/H0b72; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4/H0b72"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56d857af2a3so542920e0c.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 16:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775174012; x=1775778812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlCm9p0nxRbzkLk1CSJoTc6OlnGjcRCsgMFK0DSaHlw=;
        b=j4/H0b72uPgqV37NvCYMFyf0ArjHBDAeoSPY9Lk4dipQHTRVuwEjRBE5kRTxSeE+R/
         pHrTj2dXhh3mNccmS1t0N+FatACD1MizmMvve+sYg2APMbOr0AavoAQOML3Jkaaxd8aA
         lNkZmwrGrpQB2UXe+wBqlFdmVwk3wUD4OKU6Xs770jPzuJ2ZED03Pykuxdl1PZHqsF6A
         FwjEbS7n8K6lvVvcqcSO76wVYVQPl+UgEe6NNR1NBmDRVacae4FvieXCAfv8djIdXSfQ
         hYUpr0afXqeIdq8BjhipqL4LAKcNCBwV7VEV4qI2XGwis5mF2IjPjp0MdLuwHB4OJbQT
         MxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775174012; x=1775778812;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlCm9p0nxRbzkLk1CSJoTc6OlnGjcRCsgMFK0DSaHlw=;
        b=iTxgNsoH91iPfvHyMNc5RtzBxOkoTHHXYGmOiMSO/tr+PEyglCygyeaovwF7kFL6+9
         cMftqHinS0d0kdcX9jyfb1u3LslVBlO7ap65LLSqANqh8OOmD63zmswBgCSxiOsFVpgn
         N/hGZ6aqcjKIdgJ/VIf8qSx5g3XFclBWtDMcV7a92/aeODpxs6NLfOWwjEzQniEpjvHc
         Oy72R/yXR0QMd7AQo5fTnm9KbbdjWLmQWV5iTVDeHFKPAbchQYAJMIeY7nzwv1ZF5HUA
         9Ae0VqjCBV4SVivrxYr59xivwDYrOfYmgjepHfed7h40XKIY6Png0PgrEUprsDzCpSZh
         H3fg==
X-Forwarded-Encrypted: i=1; AJvYcCXBrItQ49aDuMpzz+ltL33VZ0DrKjVbOImhM4GmAr750tneeePdGIkvOjG575O4u/E1LqVmS4wdzFoP6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye8Izcuo8YnFkQwRlfruJUCUC4l2HN1tskglk1BEaX/nOFg2jh
	HDblOWhFy/FqohI9Z+PBq5ShWl44QkcUNYiTVMk0aUn+8vDbrnEVRkel6/dKY+72
X-Gm-Gg: ATEYQzyfxQV3VMXrhgEML0fIvypAKrAIRTt0I9gHNBE+ctbHGtgs3Q5+nOxFYxQGKVp
	/jTt5N+5gv5XBM6iotNH/ZMdPZtRF1MYlJOSCTmH+jS+6P0i8XwHOy+rUHMtiUoKo0ivQ0fYoCp
	KJiStbL8Xbji/SxK0GjwlkDYcNRbOttUN2TOITRoA3Wnfd5cNU2V5GXxMHptlvUNYAuA3CiEZMS
	fD/++QnspzeFMsMjixquxl8dLLtYvGXL2jOw+LQCuq5eTAwPPg0rE2VRJZ+Pf6f1BSV778xn8iu
	TuUC2RltI0tbmBxRF5kDMoD9VAYQUnHt7X2PrJQUHS2ki3imFM+KcwWFpStE2iXdZZmShnLehhu
	oYQSrPS+Dx+2D3SfSZVvPqxPbBLY+TjenZ7ovV+yYz6unGoth4iCjeUYPw3z4d1e+HBUWtVmrLc
	Bpb1e1qVMjzMwgNtynBIrGgQhzaslBYriRrK2PbpSExNi7ZbtFbMFRPw7+28VryRVajxTkyL1Qk
	hwB
X-Received: by 2002:a05:6122:7c8:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-56dab8e9fd0mr363153e0c.6.1775174011637;
        Thu, 02 Apr 2026 16:53:31 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-217.user3p.v-tal.net.br. [177.4.161.217])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9baff553sm5208171e0c.8.2026.04.02.16.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 16:53:31 -0700 (PDT)
Message-ID: <5c3505fc-fe80-447b-bd6a-5816fc8c9479@gmail.com>
Date: Thu, 2 Apr 2026 20:53:27 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ALSA: hda: Notify IEC958 Default PCM switch state
 changes
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-hda-spdif-share-notify-v2-1-7c6584ecaa21@gmail.com>
 <87fr5dibu6.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87fr5dibu6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/2/26 13:08, Takashi Iwai wrote:
> On Thu, 02 Apr 2026 16:45:13 +0200,
> Cássio Gabriel wrote:
>>
>> --- a/sound/hda/common/hda_local.h
>> +++ b/sound/hda/common/hda_local.h
>> @@ -12,6 +12,8 @@
>>  
>>  #include <sound/pcm_drm_eld.h>
>>  
>> +struct snd_kcontrol;
> 
> No need for an extra declaration.
> 
>> +
>>  /* We abuse kcontrol_new.subdev field to pass the NID corresponding to
>>   * the given new control.  If id.subdev has a bit flag HDA_SUBDEV_NID_FLAG,
>>   * snd_hda_ctl_add() takes the lower-bit subdev value as a valid NID.
>> @@ -203,6 +205,7 @@ enum { HDA_DIG_NONE, HDA_DIG_EXCLUSIVE, HDA_DIG_ANALOG_DUP }; /* dig_out_used */
>>  #define HDA_MAX_OUTS	5
>>  
>>  struct hda_multi_out {
>> +	struct snd_kcontrol *share_spdif_kctl; /* cached shared SPDIF switch */
> 
> I'd put at the tail of the struct as it's rather an optional stuff.
> 
> 
> thanks,
> 
> Takashi

Thanks, I'll drop the extra declaration
and move share_spdif_kctl to the tail for v3.

-- 
Thanks,
Cássio

