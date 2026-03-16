Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559A53ED10D
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 19:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773690936; cv=pass; b=XqUZwpMWPj8IzItPKMaFxQYuvkkkzDOgvVpuRkDYJq7OPBPFDR8CAGMrKzlwz/3eQdAbLUkZOtjsxMz1H/0FpiSMaNmFJqk2p/bJHfI+rT2C1fye7wDlurYRsHPOjDTipVAMv8Q1Bt5B0RDyoEGO9IJ3wsWokO+ka/3i+7VAa+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773690936; c=relaxed/simple;
	bh=exR6/S1P6dU/MDkurSY6eHAE8/Y0Wvpc5icWr9EjFSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vENqEZqazfHKSYAt3e940BOjMp7UebABbGK9cn0OKQpp7VyalTwPtG3VTY/H1SFPf7pIj1xOz7huVmTpJausjhVGhhBRP5G044/E+RwrXzP5gbej/ph98OSRaljQ7s+bkHhrfIgnI+AF116jvxpDTjKqWlfatF8KmcdYx8ql6yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9PevT2p; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9PevT2p"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a12f88d839so5074492e87.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 12:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773690933; cv=none;
        d=google.com; s=arc-20240605;
        b=OVd2VeTk90oA4CZSCbWpEViqX2q517EdA6lBcrmfKLZEXLMHLIoKrXXfXgqulLwp7q
         SkuX1Y9Ew7PBk/1ZYbT4mz+AtOyYe6kcpWYWnvtyUEzT0m/+3pS/zaow/geqP615EE6i
         oxUuh5AZZZV9b/zdEBPrIiav/jtzUvo4Im7lvT+d+DRpqzpFCZ3aEJ4evlCyxNz3d0FH
         DzzD0RTKUapQZnK6WVC43q06N3zRhFvL8JEUB3aQKNlUL+ngKJ7NIJsIch1Vqv57xoJv
         mer0JyTnC+i5Xl7GbZTNLZ+Beshly/QVBbnmyp+9ePXgpir3Bb0paIpd1h48Fl8VF7OK
         5PeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+GT6znZXieN+WJyWcGR1ayq9ux9lzHv14SdC47d9GmY=;
        fh=W4Y8JgPWgU5N9LmKdUAqqeJBcupbxrjikCj9frfdC9Q=;
        b=SVrd8Zn8UgJ0B9e3FP0a06gSezPz7D/voYXMM6XUb1cWKHVwJb2QLNNOqdoKQmjPXZ
         Q47vbURB7ksWvwV/Cj+ar84Y7VfB7W4adz14oMFwm77P/hQ/NXY9P7nuxekA8cKBu8rI
         11rpU2C74MfGNDzjhcEEb2xg4O+K3ynRGAyhfTfuVq95G2wi114PlkMF1FZQdZ+mqCA6
         yTUuQV6VNVO2SSAWZH6oIT/pA3YoKHPn2SplR0tMy16eqp04ZxfLlSMUF/AQ+4cCmHQp
         2XaWdF++CcwfFgKQUf7TtQLknCAC0D3/qp0wkKKcS8Bm2vOiISJ8YpWiIDhqGXa8b621
         jetQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773690933; x=1774295733; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+GT6znZXieN+WJyWcGR1ayq9ux9lzHv14SdC47d9GmY=;
        b=m9PevT2ps8K9uep0DRP66Fe0e5a3LPMdy9m2rrlDR89HHO0v3rA8ZRNTqVHcixiZ8p
         bTbVX9Cf0ezMW3fd2EF6jXOD9HeTwCP2//jaikV6Z1d31+KheVZLIqydqEIOiZRh5C+g
         qK/wPV+9tmvhdoW1sFT+/TP+ht/rfts31WZnBJ0DSZ97d3aQwBOZkIHJqHect6WV6Baz
         d3S92KJBW9EQsLwG0Suw5njkJP0JYz79imR4T0JTlYZgziXX0Vl6fZPJbiwBPFPkirLn
         H4zQuwvBctMOj88iG/tUqSHMr7M8js3c0b+O5MFENQaonnAR2xNUVyckH80D6Ms7GoE4
         L6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773690933; x=1774295733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GT6znZXieN+WJyWcGR1ayq9ux9lzHv14SdC47d9GmY=;
        b=qTQFrk9i3hifVKb3i/BxgTdDAmRMffNTgEVRaUgu5ywA5F00HlO7xdIY96wr/SXeiM
         pX9AcD3Y7ZYAveY/o7iUD1L/A0ZNAj3+rqWJFVzODuvrllrkMeCEwZFvaVRZ38dipRy0
         0gB1qIa6o2aijAZbbVai8vLKggv8UnK+LPUGWa0yqY6rqWYgEFyFQag8FIp/u3ME8o+U
         K98d8933yWiwMQLfUq0Tv9dl73QMwWovREfLgIacW/Q/vBjLHNMtfuviWnzUMOPghOmr
         Xz5Eqq6g4NV3mwO832+vNRRevREqngMOEN01RjUdNBq+qywS4+KqmoPPNuseLrKN/7Fi
         hKew==
X-Forwarded-Encrypted: i=1; AJvYcCWeFZnwdR4QdG1+94bKdOvHU6Y2I9RkLtVV3JSQugdfZV1+PuQHpCj7O0aWVuQ4RTVmKIvWl0nPUU5cmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUMdqVmliN/zjwHkORMXCwgrcBpPyJOyJoipaZ5hzppJla1CbK
	ezIjsTOeMXcaurNYsYDdaIEW8DzjGTYMmPlcrYq4jtrFO/eCQ236h+OU35dG0rCTZwTTV1X33gk
	+g1Kd2+f35PMhZDRgAY19opszVSptTk4=
X-Gm-Gg: ATEYQzx5wyvgOFC5pVLQmrpTxkMC3d9DbmGiI/1HUj0ZJEiQzJwdxcE08O9ppARRQzl
	8rhEL9IiSt6wOHvv2uof9333RG7966aWdUUwWUxGKNIO4XQotaGqfUsc/HI5RDbRxN82CQTW0eO
	lZ8eC7sxVUSu94l/Wnk1+BgHQmX9EGOOBo24GsPTQIer/AZeLEoE0oLvBd/FOpA7iDmiCbSGF3m
	FYMiOhMH1gN0S8UawnqNvnaKepmAdJcMWVWv6NGEzrnlQUOe43SbGk2QaRs/89UpRid8UESBqvQ
	YGWcTqCkPRvSol0hpAH6KENoiJEbv1LaMiWBvdHM6MT9XklaF2DMti0Btl/4a6Xj4yMJ+9FHvA=
	=
X-Received: by 2002:a05:6512:63d6:10b0:5a0:4344:a519 with SMTP id
 2adb3069b0e04-5a162705a67mr3198343e87.4.1773690933118; Mon, 16 Mar 2026
 12:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315215447.276886-1-piyushpatle228@gmail.com> <20260316-macho-vole-of-security-e549d9@quoll>
In-Reply-To: <20260316-macho-vole-of-security-e549d9@quoll>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Tue, 17 Mar 2026 01:24:55 +0530
X-Gm-Features: AaiRm52pgTqXpxNrSqYy20MhbWj6W5L2QOpsljgPgd5ge4Ij9NOJat0naNkkygk
Message-ID: <CAMB+xkbevtKHrg=93Wttp1-OQ-qh3UGpW8rxhNoQqQ65tvtBWw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: sound: adi,ssm2305: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
> With these fixed:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you for the review!

I checked the subject prefix using 'git log --oneline --
Documentation/devicetree/bindings/sound/' and found that the correct
prefix should be:

    ASoC: dt-bindings: adi,ssm2305: Convert to DT schema

Should I send a v2 with this fix, or can the maintainer apply v1 with
the subject corrected?

Best regards,
Piyush
