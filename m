Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2492395DBF
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 05:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450415; cv=none; b=t1YYFj3F2+sseTa5TV9dNuDrQfYnEaQ2U1uukdd3mrYWYJvXKlx1/1t0ftNkp2hHIR6GTNqmWeq9V7OtukbzNi7nzzgKFJcVEnAQEYJaz6C0UNhBi+OB1nT6AyJ6J7MjNVAjX1PjcJt9PN2MheZxTOJtq/wd2a/y6G7oLVoBqSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450415; c=relaxed/simple;
	bh=Xwnij+Z3LNCoB15gSkLM+/TO+U7Se9AYEfVZuETLSgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c79dq2FAWIckHBp/PC5cJa2sy7gUdp3VxDsljWK9L1jFkJEobtHnPpM1lidQYc+TWm+vWDacmOqdWaECEypL2vhvfeHbPbrD/j7B0oZDK2kv5eWwHggekUC6wnPOxllR4lz9ivtYOyyAOfQ3sFzhLtwV6klaseb6pSMpzRGcQno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2f1Vs2X; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2f1Vs2X"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so2066291a12.1
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 22:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789450413; x=1790055213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xwnij+Z3LNCoB15gSkLM+/TO+U7Se9AYEfVZuETLSgk=;
        b=F2f1Vs2X4HCudTGfDWL3XIaOk6lIpppjkyPTzwO8+BYNSIrvY9CI7zWtDPY5AzN6HX
         Dydc7l9P50X9zeFiSKJ1u9b8kMzsETGmrbAuCXrUaOOGQki9khRgx4tCmjr8moJ7aff0
         762WJfpjpTQxpiBgyXGL9F2Y3M8JCJqgYtjooznT3U6JFhPQoKWTBjwtlZ+YSt5sBCkK
         h+Babg0Td9/IsfR79f5KL4VNhXYV0v5cjK47ZNkLIREAzwj22uwy/hhxNfw2MPWpONFZ
         FFodBHwB7gv3XUJCr/suP9OpJjrLHi5v4dibWGi4q2aq/C/VXO8ALpcNLT5lCUHZYtB1
         E3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450413; x=1790055213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xwnij+Z3LNCoB15gSkLM+/TO+U7Se9AYEfVZuETLSgk=;
        b=Hh28vPOsN2N76DCJ/KcKDHR+jbTGOpJqJ7E9Xx8UhdzqByEzojvP9BTjmZFekHyZmy
         D9FE08ax6K0vU/bx+SeBmbpBKxNnu5qHPLCazBkviBQcp6sGxVuD+JC5ddpTq1iTN9C/
         Goe3sbOKaNlgBZ0W5g3E2Il9Jx/yInacSmDmG9kqlWkPynPUBQD7TX6dPv1BTIC/PiS5
         87dGwTlSzARLBPXolygnrGRQbaYfBApzaWeJwWTQrx5M98cbLSHKSvBu1vJJqOaB2ZLO
         70tE351YYBJ/ycT0UpVIfEE3qsfldQSREyTtbfP5CPHHq9vOyfYcjWrZi8hHJksbXXYp
         JV+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzD04SZDVn0XhBJb9GbNEeQi8PVIshsUB7NzpB7ljH8pRXMON93cSQFgz/vXhdD98B2plXLDhXVApTjnQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nicSAlOGwk8l21ThrVvItoNueyEtz/Mg7lPROrc+WxHPAOHfYd
	MqU9E/sIopBuEm9gYdLdX88uPN8ZLIOqlRR2PFTsSMJCVJzMaWa548As
X-Gm-Gg: AYBFou25LTfNOXSU0+9wHhvrHbrGNTT68Z4E/UECfkswGTGR5GhBoIR5haRrn9OyVkN
	X0I+mGFPk0AmpuGTOy7xOryhqbPS4cNrw9mB76gEZymyBpC/A0pjtSRu5XGNUO2U2F/QaaicCW4
	qkWD/fI7ZlK+vmDaaC3I9zHosoF3NEYpRfRDTR8Silco3Pf3OTr8x2tG9VzWuaQbbwM33TfCKwl
	6AnW0xKxAOUc8cqxsHP3CNtg/XlrUifOPtzH+JFOkap5dH92J81s/vPGbrcrLLCLeYMeRaE3FuK
	5Tw/L34v8HLSyATKhc7VAe0P1K5YpwCZSwKkdQ3yPjNGn3L3T0zkxvShv7GClpH5lDNhuPV7Eb7
	dJtC1ySQbPIm+5QfLHd50QPQh2ofuVO4qhJfffpj8mMo+aHkPl9q3rLcpkJGFLnisoShUCtcfV/
	7Cu5gm/VNqtdnIKWncDa9AB6SE8OP3bOMiHq9fUFKUq2965D5DPZdQ7rAGVFmtfcVT8P8hW03j/
	DJO+odjwQ==
X-Received: by 2002:a17:90a:dfcb:b0:398:ba56:b926 with SMTP id 98e67ed59e1d1-39dec142834mr13260587a91.25.1789450413078;
        Mon, 14 Sep 2026 22:33:33 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd9baad9sm2944462a91.4.2026.09.14.22.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:33:32 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bbnpreetsingh@gmail.com
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Release the TX descriptor on error paths
Date: Tue, 15 Sep 2026 05:33:31 +0000
Message-ID: <20260915053331.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820035203.7-1-bbnpreetsingh@gmail.com>
References: <20260820035203.7-1-bbnpreetsingh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Srinivas,

Gentle ping on this one. It has been about three and a half weeks and I
could not find it in char-misc-next or your for-next, so I wanted to
check whether it fell through the cracks or whether you would like
something changed.

Thanks,
Babanpreet
