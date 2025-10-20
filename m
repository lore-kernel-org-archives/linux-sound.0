Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFE42848A2
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760976908; cv=none; b=Wz3St3JkY48Gn9PnHs4HJw0f60ZeZPA/veCa3WshTaqQi6Hpv/VbQwZWhXQlr6cLXDrYQmkgjpQvfin0E3HM0kiwrBasnXL9jh+1ID5iVkxdBn2cGsOF2xkhGYjsQM3SofEVGrZBDvsuJZ0qdX5Z68Gf11rCrLP+B8ACaIw0Ofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760976908; c=relaxed/simple;
	bh=Jua4BIwx1wftC9YUkccQgpopg9gTW50dQgVx8gQLv7k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GvN32uthD6nnzpSSTvEkAICGxWtmiZuHgCK90RI+EyzNhz/s8XkvfSyF5C/nGMfslySaWvCV0lZB8sot4316VXPYV7yvvU0x+f9Nco8kqjDO0Nem867eBUg8eIdirRPUTCXt/fJcaXZyero0q6ckX1RotYPsUevPFoloGoTnqR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IdUH978P; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IdUH978P"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47118259fd8so26550695e9.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760976904; x=1761581704; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sni5/6MbmNzQeyCmE1PCgBk84A0B0wyk3qAYIl/S1Js=;
        b=IdUH978PtIEnPcNnfYf0AbosmOVgeSuiNE/sUZIoNV6/30qFzPSYmIC/rRKylImZuA
         ZUdw+e918WMlo9nGKTYgh20oqbI7wqsqRcnSQXEqmk4cUY7OSTLy7s1TjFao78dFdwjS
         uRQw7xMznsVtXcLGdHwWWXwTdr0v1YL7Wu99dLqsqyPHfdB4vbPLks6FNQoZpk/nNdGp
         DoNy56o5dTxZI/YG5MpQCfbnFursh2lPhN+VU6Gp/UpBft9A7S7iQGUmOz7XRz0f4UoL
         hJZpYHziIRol4jidLH96XiFQfcIhciyBtfqkRIE0s/IJlsIQIoVBC65YiXhnR6pu2xeq
         l/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760976904; x=1761581704;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sni5/6MbmNzQeyCmE1PCgBk84A0B0wyk3qAYIl/S1Js=;
        b=pQDprQ8kviLw28WL7jH5fmoJOKJyy/a/kZ/Q/A11ugR0tTC7FKGIbdWicFs7JVq3yA
         erafmKkvjRPVG/g/merzYupbeUJKT0HUh9/jul0zLbDvr78UodzX4kYfXhrHhlFDCXWp
         K8B6tHG3bvsFQWc0VZeDtRwBAcSj9E2srYoAIf7y9EmmDTNaIGanDXtYSN6l396Kai/j
         i9cNDaX7uWryHExPrnSdFZBhK3HqZzp8OrxW9GV+Q2IUgAGgngjuyscGD8xoBBv5Kfyt
         htuZ0MIyeYO7rzQtU7Y77/lab8kj+N/+R8zffUmW+Lf10jEcyYVvN5B8QrY2xdxtP2Es
         kT6g==
X-Forwarded-Encrypted: i=1; AJvYcCU7rhvrvqJH/rKRkw5L53V6x7x7c/3maMmpyapO1236AsvQ1WmZrmKXyjKks83k2IS8I2OYyqhhnaLSKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjfyTON+whaFeSqs7rXSJtF2yxWyCgI7Hq+RkOXynZR3f7ybS7
	3M8795J6/iMW1ZT7r3Ze8Kig76TTfDAgjENE3XubMYmO/N+dy5D/RumQ7DNbLeZL66A=
X-Gm-Gg: ASbGncv7Wn1BHcTtCsp5HEootP1wSlMmtMmhVy8TeelCvZGqW9ZYGoP8zUhGdvZqDZ9
	olDfBaZq1cmlHk48vzuYpS7lKSSMTYjaKYHOYSU8wKQzFOKsKqTEzVfGfS3DzmPK4sfbtR47t5r
	FSVMCPul3ymGfTMrAD+od0ZxjVEoRjWVkRB0Ryo1C+m0h8LtSOoGjCj6qqxdUXvC4PbIOB0r2Yr
	0hAvc02Afxl2m+62x+fmKshIEgqAoC44wdzueevy3wu+W2E45W7I/c+L94ZQXX9NGqjGhDsKh9U
	TDqPNh4ZcbtChUq9wDD3LR4FPAxL9Yv8zQHPIwbTavMcsHbSVNzURwrb+iUFqok7vqeyFbP2Bu9
	TPlq1CNWpgWvVEzDWbfxr67jdxf5qoyNcKv5YZxzI5LbgrAEkqsv2JRC7pgE6fjkQVhBxROmdqd
	kWC9QrfGSVqqC6CuQXrx21C6M4
X-Google-Smtp-Source: AGHT+IH+gc9K2IC1kig15CAHz3blcIpeF1+MZI8wwLj0FCfsFcBo1OSzfR+iD09YwCtZptUMS2gWQA==
X-Received: by 2002:a05:600c:670a:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-471179017f3mr85002415e9.21.1760976904492;
        Mon, 20 Oct 2025 09:15:04 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:9f99:cf6:2e6a:c11f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ba070sm16146014f8f.42.2025.10.20.09.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 09:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 17:15:02 +0100
Message-Id: <DDNA7OTLQ0GF.2YAUOG3GYV50A@linaro.org>
Cc: <perex@perex.cz>, <tiwai@suse.com>, <srini@kernel.org>,
 <linux-sound@vger.kernel.org>, <m.facchin@arduino.cc>,
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

I tested this series on RB5 and RB3 boards and it seems to work.

It becomes a real pain to verify things on RB3. There is a regression
related to slimbus regmap and linux-next is broken on RB3 starting
with next-20251017.
The tag next-20251016 works just fine (after applying slimbus regmap
fix).

For the whole series:

Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3

