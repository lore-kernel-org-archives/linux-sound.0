Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C2736B046
	for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768589978; cv=none; b=SFsmWsAbOV787VheSs3bIrTF7W1367nWv7GbL58wPVhvAvk8AvElNsE46OJde+eeP4WHsiqncVqH9Ihi30ZrB8z4/Yxu6s9xLvGyrxSU7aiUC7ZAWSbZXfke7eQ3cOUddordookj6hd/HJi5w4/N3/8RgTAdOaEGU7AJufrC2IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768589978; c=relaxed/simple;
	bh=TzSo+tlzxFxHwZ9wkSBmczjkeQhikq+vs+l7Oy23ORw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aSDTUdc77a27pcO84huJHLC65N1wlSkf7AYm2nud7EIKiIlnQsuPZ+igUp7FZqOW6ACh6V8daxHIGiNg381AHAJ8MNSDBZ94P3QdYWYdgjRu4uCjtw6TYb7vmDLTqD8/4s6BhKVMpqSrI4yS9/VCmWTECVuDs2fsk6XTumlFz/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlUCJCIT; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlUCJCIT"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12336c0a8b6so4849543c88.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 10:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768589976; x=1769194776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsdpmGsyOkVZsi/y+GsHdikzRvoYJyk6QlblSikl37w=;
        b=dlUCJCITWmOW4mqAG7Xbkgj7NRmaG6VLpoK2ZrOwa9PzqpvHtGbpNt5DdfpbMfI6f8
         MBGic3fBcQxkFvtOjk955jVpueQA5L71DVScE8srthwcmmWi6tvUIoZqdNi2YffNpGmk
         nqVy3jRkPUWNZnptHQNu2KRgIOL7hsgUSXO1eWclnZgNriW3n4x8V9A0JN1Rz/eg+0fz
         I5uYs8QjYI8lqZOB6xDQN9pNTWgLwmbwOgRq3tRDln7ik7iB7ngax4onYVoAZIby/bP0
         gdQh79wASr6VolTux/EhIL5Mm+IT6ZYbr2SZABz4upgyfMN2j/1vF4xkRiVh0oXGcBrP
         GlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768589976; x=1769194776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OsdpmGsyOkVZsi/y+GsHdikzRvoYJyk6QlblSikl37w=;
        b=uPwa8mDUct8viulRMruBqDsDmz7HiIVoo5KOkdhTsejeP2dsd1efcuWq9oxDSIWU2w
         y+h5LmAa6BXQMD1ekNEPgSPbtWWgYf8FwaE2WRKjd7/fLzRhfnogcyv5CpWLzxLgesEL
         M8LYTEg16XfocBVe6UiXdWyq+59nmi6pwk67eBPPYsK4CDomWQVj4khaneJvnOvvjsIE
         1mSUfwwXZgoZ1dpXVpbQsM//nEBsm3Kf8d5CzgKOTVtncZm0cBNw7krxVk14aRY9sEH6
         4JX79PjtoxHAAdFUkAI3LuwbxLuwoD16AI4TvwReyOl8DXcteqEb07VGmbqrqUokR35O
         bU0g==
X-Forwarded-Encrypted: i=1; AJvYcCWB5H9n0rGkceuNREfaVE/9YDWoDGdBP8zrtsFXWxGSYpZiUON1QwuE1JrFyqKpBvQfDtXt6w3/KW85zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztC5FyInnriEeT+fLvjf97xsDq24s4A/7ZeulZDQZvOJO9wMb0
	2luNBYSCncVH0i8poCj4IEhW1xqY9Kkw77ZuLcjFb9vQgzDC56e/9Bk0
X-Gm-Gg: AY/fxX5+askXrICFjCNygNVthdzL/1U0O1WtNXYBySy86N3L2UsbDPLSsLUBjWi/bVI
	B64jnxKzX6o9azQzt+6E4DrNlVO/KbKa7l5ojM1vcDyS8xeeL2ReqBvCUW8r+Zs1fMNoS5j0j96
	MTW8rPEXUba4imeKEzYTo8/WxKqEnJ3T5uV6P7FsXjwT+dBZffBwepFSwS9wjT+lTUJLnY1OMpV
	GoIaFQXTs91hybLehCnEIp8vwksJf7D2h5hne/ePxi4dVESqobcpQFFTsyvVa+i+VjK0vXhOhx9
	yO2UG0GNxS1OgnMIhEFbDrWgFsnrrzc0fXFsHvKP40Yz7R/5hv1OhdyYF7ZoRPCzWGQJ4sxkYtO
	cWo6YY2y6nq/fOmF2sFvDEn+VMh29wK2HVuuPzgcKf1yJpqhh9epnE31PyGXUQL0eVUuNrr5Uj2
	pRo/8dITB7M9GNzvXOYxCyKnw6R89RDEnec9UZmGVhI8Mc3orLFajo/ByhFBYdOFmdsAdtX1suF
	BLesJY=
X-Received: by 2002:a05:7022:2397:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-1244a75f051mr3682555c88.26.1768589976312;
        Fri, 16 Jan 2026 10:59:36 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac57fd0sm3522534c88.3.2026.01.16.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 10:59:35 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Sheetal ." <sheetal@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: (subset) [PATCH V2 0/4] Add tegra264 audio device tree support
Date: Fri, 16 Jan 2026 19:59:27 +0100
Message-ID: <176858995889.167465.8638060731154515673.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250929105930.1767294-1-sheetal@nvidia.com>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Mon, 29 Sep 2025 16:29:26 +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
> 
> Add device tree support for tegra264 audio subsystem including:
> - Binding update for
>   - 64-channel ADMA controller
>   - 32 RX/TX ADMAIF channels
>   - tegra264-agic binding for arm,gic
> - Add device tree nodes for
>   - APE subsystem (ACONNECT, AGIC, ADMA, AHUB and children (ADMAIF, I2S,
>     DMIC, DSPK, MVC, SFC, ASRC, AMX, ADX, OPE and Mixer) nodes
>   - HDA controller
>   - sound
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: dma: Update ADMA bindings for tegra264
      commit: 919f6cd469c605f1de2269d46d04ebf80a1af568

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
