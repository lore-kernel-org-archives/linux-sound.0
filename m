Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA202C86D
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 00:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768611547; cv=none; b=WFWHPpCfqzC+yFN+kB5M0f4V8ZUxpcCdfjlMro2MKmEduVCzS6OXkJIIuCq/bjmKLJRgmd/7UphN5kCipLtvS1xqxRrW4gfUqvHDrTKJgPRmG/pifzh7iu20IRXXw2HxvxXIWq/B08iqqObTU1z6tfhJrPUrlCBK3UL1j3JQEDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768611547; c=relaxed/simple;
	bh=ZveipeIP7Bmtra4tJV836ZoRkFGm7qdMZOJGSTZHv5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APLRXs8wY05124UrhjrTqJQQ8V7vIhPPjmH5gpTwelGfFvn0slcj2w6CfOumVmABUrMpPryBUCq76mZy6RICr60Lvg38f18Z3hrDYEpEMIOBnJFZJ6J/MHhA7gN9IbEYnxQa/1olv2RwWbpGiFdJbdOFDKgqCoBWjOqvwEi5uoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhI+LvMa; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhI+LvMa"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so2137487f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 16:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768611545; x=1769216345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wzbNnTwPY3sl1kDBYO8pjwy7AQ3U6oZDZIuHTJM1cw=;
        b=OhI+LvMaHSser8ogUVoWen08Y4NvsMT4duH30zfQaOucwAYuWbKrgK82rtSCfUZJCH
         atEz1QdpNqqFd+FUzN+IAK+tqA5PES3gUc0sMmuVo2iEc9lX09JPwLNtUZ3mKKS4iTfQ
         oVccuUVQMubtxoukZroBcWgY8kGMMMQe0qbjO24WTOql99gI/wcq3z5k8CRktpbNGjO6
         YJ5R5AbWWKFY93FlYYiOQl1a6Sjp1SQp6u57MwSXNQya1nhBvONMnXSl8xyUp8dm6+3L
         MITX+znpE6JV9HWgcyzS0f8z64h298AL9OAo/bd6j2+97OE+D+IZr5Om6IKBtuuQ18BB
         J9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768611545; x=1769216345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wzbNnTwPY3sl1kDBYO8pjwy7AQ3U6oZDZIuHTJM1cw=;
        b=OiahCfK9VeJu2zWf+XCpWf/rr2Cb1vEP2PjwRu6vBxCdm6q1rAp5oy0FCvaS7XCQCq
         HTzev/eEfnLwaxRhHKue8KrasL4hJeBsjENd3CsOQQzP8Usf7IgWts1IWbQ0QgnWrKAk
         AUfkdAZf/ev8Wf6jswhbAUkf07wSV6izVW3bJjM672hCrxLjRllGnwnb2nHfNJOhn50R
         AkMiczlkVHkpe80Uk+z67vRPhqR6qEgLuaPk7CObgeu4GcJtI5n8u9sQ8qZNQFZWGbr3
         LBFID5dg1uOdaij01/vBGkoJbbLHWnc+Ryrci4m5q1qyDUBGcH5HQCe8LNFKsKgu6R4X
         z//A==
X-Gm-Message-State: AOJu0YyL9pJ0CizUrWo9SMi467zUZGt/V8TB4csENq94dViN8/WE2Jkr
	Mr73cdRVkuq26s+DY6V7/UeuxKy3elFRvgLvaAUycIp4UqZg38ltFZ0y
X-Gm-Gg: AY/fxX5l3Pg/WTR5/BijoQbag6/hEk2CtZkCj7Fuysm3HMNeoqbFGC2nsmzGsZdViVw
	rd5JRxqoTeCd4dw0trA2qqN6AIUFbdIIMNlDsyY+V32Vq2OlMgBUNdo0KnWzNsNuiZmdRwdeh7X
	pop2+nba3cjgdZges9L4bg4h9nu5eL2N0VaiEsTvV8Y0WIou9PyCGyJ6IUOALUnagqYuzj6C0iV
	GI0E4WJ7NTlo0Le8zZFLTse3oUcjH9r9JY6Uc4xggdaOFDLgOKnX3KKBpf9+ku/30jULrSh6uBr
	RycEBBY/wN1KHIUuKUw3o9L2SWezdhFFVU38Nt0WrPhtvDv7djRnCEBhOTbEJxcl/Bbi+RoRTWW
	xZ7QFNleXJt1k7myb+xiU2neGlcZP3iSfb5zf3gLK9uiJkbiwwZpQI09wZK3HLzpKAYH0/3WtTN
	mZ372oBfnSmGuiCUGvGeDWHJ91Ok12HKVCBjWkOlHVaDe6AORtBhrfrvgiWX1ReKCoYaz1kxXMa
	SErsbBVZI1o8eK/1Q==
X-Received: by 2002:a05:6000:288e:b0:430:f622:8cd4 with SMTP id ffacd0b85a97d-4356a082f50mr5383723f8f.49.1768611544731;
        Fri, 16 Jan 2026 16:59:04 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921facsm7885225f8f.5.2026.01.16.16.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:59:03 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: dt-bindings: realtek,rt5640: Various fixes
Date: Sat, 17 Jan 2026 01:58:55 +0100
Message-ID: <176861152450.1947082.2637987844354037789.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108143158.351223-1-jonathanh@nvidia.com>
References: <20260108143158.351223-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 08 Jan 2026 14:31:55 +0000, Jon Hunter wrote:
> This series includes fixes for the realtek,rt5640 dt-binding to address
> a few warnings that are observed when running the CHECK_DTBS=y for some
> DTBs that use this codec.
> 
> Jon Hunter (3):
>   ASoC: dt-bindings: realtek,rt5640: Document mclk
>   ASoC: dt-bindings: realtek,rt5640: Update jack-detect
>   ASoC: dt-bindings: realtek,rt5640: Document port node
> 
> [...]

Applied, thanks!

[1/3] ASoC: dt-bindings: realtek,rt5640: Document mclk
      commit: 601a821631c55014b02371740c39748d0af916c1
[2/3] ASoC: dt-bindings: realtek,rt5640: Update jack-detect
      commit: 2efe28d11cc19b69b19b9bcdb6f498c1bf842fbc
[3/3] ASoC: dt-bindings: realtek,rt5640: Document port node
      commit: b2788f6320722d6059f849f35a77eb082608c627

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
