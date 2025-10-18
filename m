Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4EE19DF9A
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 04:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760763319; cv=none; b=osj1bslrgjnEyau77owz1fPWQKHXHDM0gXbWnkq3g5JTlLw+OvmDgGqzJDr7VmY9Q3LqZNxFgJhluHpZS4cFKEZezlkM2bC0eU/CnByxM/3ce+LGGyvAJvsHMkvypCilVVgWVS/hmQ1RzadDxIKP7iMub8dv5GC3eZQ0K2YrIio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760763319; c=relaxed/simple;
	bh=ylW2XE//NO5FaS2GRo3y6bDQ5bXrKLQ1fYi38QPF9Mg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GzX/wgT3TlrpSf0MzVOX8aJJWtVGCNN4If2iFUxpN0/HIq4Eh3hVwOOIWxgvERAzRQrqBxoyRn5EMFmEFkB7MTXGr/YDA6OAmNtjHxL4h3Xc/YvAK123LKRUXLA9lczOZz3HJCndyAwWYeKi3/2ESOYfHTbtvQvgJADEzMduj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aW3+E4dH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aW3+E4dH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42557c5cedcso1465914f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 21:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760763316; x=1761368116; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lev9x6dFfmdCM6nU9lvB+aId3gAOWip6By2m8dIzqR0=;
        b=aW3+E4dHSrakor4dnozLsjQIlv8RN/iSsLbT3RO9FZxm/6x8ysPes4d74J9PQ0bQX0
         0D1Ntro1d7gW9B69OndpZw0CwIIG6xm+xNVWKWPpVMgirzCGTtBZf5Y7V0vbMcp5iS/C
         93Iy7KOOrg9g4nEjFnKyY/M59KXTlee0CaVwYUPhERI0o/e53pnu7wvRVoHLd74bi6pW
         J1EggmDni+0Ws3Igh9uniwfjuomlsUs/g76O4uJgBnx66AdtTt3v+6v5+hJAul+8q6LD
         Jbns83QWDNe4Ay8YrQDyDuj2qYMbPGYSsfiz9VnebaeGptMzFyMaylCFGnK8C/prL84u
         gIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760763316; x=1761368116;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lev9x6dFfmdCM6nU9lvB+aId3gAOWip6By2m8dIzqR0=;
        b=MxNcXyoQA9eLIiXNTy/02RoqupLF1+2c2/UESoR5Yhq1vKen0gThKqG5DmPZxjMFtC
         jQ3q3UILDWqY8wkTfeftkwXN8tYjpXQ1Okp1VsqcMQBOsI4FKJt+xWVjRySNPsopv3Tv
         8y97ZnsQW11LXmoTWNzZY+VUclJnw0+sLdzrromP5yeN0OUw9PX4+QcnPl+SScZ1tCch
         kCl6k9o49571w+M5FIso3daL85nRdDYnnjUYuc0bI1MEDbTUalWt7zRKdi3v+EDR66AB
         NHo4QACJnkD1JmWgwXYmoaQzQyoEoDSQO6yKify9S9alTxW+susyhF7pww8lZPvM8aG4
         pjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGymTEr+KYjJU3fCKNLwzW9aHJLRprQy+48fQ8PhzZNEJjuz4E/fp/48ByER/G1zbdwqN9ZJn32Inf1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkjtGmM91mRJigDW+eAw77KToSco2012tPXOevjfLhUGoBWQqe
	/Ieaq5c8gGMBl0RT9kuYiWjmPypuaCFDSGB2LwM50/Fexuy65gpNlH6Nc97n+xHc3Pc=
X-Gm-Gg: ASbGncvoImZ99tOv3MoSW917Fln3dlOQLJb1Vh/qG7/szqvjrE2BTwBAbhbTdNJZPUG
	x8J9/vl2UcZkBRwAgTUaF8AkXVq1h23YSHtJJF4XDARl4fkDgwUVt/S7hSNBRzzgxEebc7e4XcU
	LgOe7gTGvO/7il2kBjeToylbIaLGNgQ2Kv/PJTOTkOFwLtlH+VAHTvIZyjxVz02BOLOB4SxDjz3
	ERMYR0V9KIlUVk8y5SHTUjS4GqSVTkLpD7we4d3vrw1mUp7VMSdqHtUSFUdgYHmDl4C1zOLhXJs
	Wz0Vnklxos7GJoH6oi8/yRXB4Vh625VCXz1yCkSzIKc1eHzaHyscDyhdHT5wdJkmHRY5xxj4ieC
	e3zLsxvsJJ9xOjD7wND7pB5R0LenR8es9boRWWPSjjE3XSSgXHift7zvismfst6D/UyyOBmndlT
	I9yqMErOU3PBsKYA==
X-Google-Smtp-Source: AGHT+IGQ2PwsTgBVhX4BIKplCiN6Fm8dEPVQVzbBaqOMGQ2re1g52F54o1ZfdXxv+FuOtuW57XJ50A==
X-Received: by 2002:a05:6000:188e:b0:428:3c66:a022 with SMTP id ffacd0b85a97d-4283c66a3a1mr577628f8f.40.1760763316335;
        Fri, 17 Oct 2025 21:55:16 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:a618:4d7b:922:a98f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm2706026f8f.24.2025.10.17.21.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 21:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Oct 2025 05:55:14 +0100
Message-Id: <DDL6I3XL46VX.XHDZ5GTAJK09@linaro.org>
Cc: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srini@kernel.org>, <linux-sound@vger.kernel.org>, <m.facchin@arduino.cc>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 0/9] ASoC: qcom: q6dsp: fixes and updates
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>

On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
> This patchset has 4 fixes and some enhancements to the Elite DSP driver
> support.
> Fixes includes=20
> 	- setting correct flags for expected behaviour of appl_ptr
> 	- fix closing of copp instances
> 	- fix buffer alignment.
> 	- fix state checks before closing asm stream
> Enhancements include:
> 	- adding q6asm_get_hw_pointer and ack callback support
>
> There is another set of updates comming soon, which will add support
> for early memory mapping and few more modules support in audioreach.
>
> Srinivas Kandagatla (9):
>   ASoC: qcom: q6apm-dai: set flags to reflect correct operation of
>     appl_ptr
>   ASoC: qcom: q6adm: the the copp device only during last instance
>   ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
>   ASoC: qcom: q6asm-dai: perform correct state check before closing
>   ASoC: qcom: q6asm: handle the responses after closing
>   ASoC: qcom: q6asm-dai: schedule all available frames to avoid dsp
>     under-runs
>   ASoC: qcom: q6asm: add q6asm_get_hw_pointer
>   ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
>   ASoC: qcom: q6asm: set runtime correctly for each stream

I am currently testing this series, so far looks good but
I'd like to test it on one more different board.
I'll also have few minor comments later.

Thanks,
Alexey
