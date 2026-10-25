Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932817;
	b=y1rSRXsUm1xlzb0NhSM6T/puLT/9KKEviVogJrHGbL3C3xCaUQKrUzgH4AAdG3cVDmsO
	 8/WpzSiVvwll8AYV2KKMLVuFCnkGFj0GiQCLfpk1yRpHdwuinX3m6pFo9wl/wJtX5ZQWB
	 Zau50s8/gI0bSSAS/CmV1aNy9TfzuH826lywiawsqZZm5HWGvMU3BWO6fVWkP93U/H8QG
	 3YZ3GxiaYUybaO15+bzheKZ8q6X3pfqSfEEtPC/E/PdBMIfeqRmIT+rxFzUMFToPbNf6W
	 RpouR3WNHf+E3BpC875lkqU7PdUCjYYZtHIVBxoCdjjz5XXImN0f2g6LwWEgtznellg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MK0x3nBQPvSgNRrTqRWrccBMM8y8IU0drMw0at/VEos=;
	b=cPIlPTkyFT1CQUOUynHlSrrub88w5Q8mhwb6SbJkdMD+CuUanVGe8ZnjXQxqinQ8H+8N
	 v3/nxYOEonBNZ9QA0z/lgFFbY/H5nlT0UbEXq1fPZrZvG2dyCWzOLchDFzUzS5MpQlmIU
	 X/4xgd4u4O2qAIDqePseZeW5mjt1MFROUkKFYn2h8dV/I3Zk2Sjr9kIkWsdz9qkThVk87
	 hDcS8mKAAVQ7HrIf2npwtg5/C+fasmP0/igq71X/SW46XEiwpL6G8ecdhBNJgBJxnQh7S
	 A/GLgmlz9DuvnawGq4KwzPdP2si011urojuv1cuE0ZoFukOgbITHGfx6V/c0Q2cxAGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBjLaSaD;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FC6606A31A
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 12:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24FC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBjLaSaD
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a208d93758so24634035e9.3
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 05:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792932815; x=1793537615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MK0x3nBQPvSgNRrTqRWrccBMM8y8IU0drMw0at/VEos=;
        b=FBjLaSaDH3fZfQWRluwUMgZreHqpA5e7QVqgiXVE2TBAvUPiYk+tfdCfjqnU4S3IVT
         w4FlAjggUyXYJYQNf4Fn6e4aASunt1Q8VlqmiI/nSVuZTQmcX0oF36lV1a+mEQ3+NBM6
         EWwEjfO++fjR5dR/RLhuUe6X+aK4Dbk0y2i2wtvyOoZgUZbbOH9lqvv/CiLxYl/nlAHt
         51YIVXvgOd2nbXsrgBySQCexfP2tbToiLV11Rvp1uOUX8TUa0gVSQXyZtG9FGN9jc7dh
         DGvFZUbihe/jP2Jchjf0qMxHaLtc2sJAqxPmhUpqZHr/0xQkBognGoyFQxm315GuA5B6
         70hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792932815; x=1793537615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MK0x3nBQPvSgNRrTqRWrccBMM8y8IU0drMw0at/VEos=;
        b=FzsY3t0A3huCVyrMqTKoyQhKWrpo1r8vaH5vXKCQD7B6bpIzTnyb+QANBKDprqhk8e
         Gw54o4MGXSUIjMZjTCcMF6hrOH262tnR3T33V7JFQ3Y3POjoVbxQan66HcZQR1RpT5Sk
         3csR/bOnnQHUu92yWF2r4mN5snk99DX2UE3Thva24bs0GRubarUmVn++TG0dzohb64yx
         4NDFvs6YuTxBXIea1Zy/D5E4gfrcKsc+XcqK4Y6oEnqomYr6P9ou+xPcW3WgDJ1MEYd4
         Yja3iRYCDRfxGSQBD2y0M0rYb9M9ZWDIZrXxw2y2bSDNkfqKCXrzWjkn9kFCkesCZ4NX
         GyiA==
X-Forwarded-Encrypted: i=1; AKwUvBygcrTRjkvCE3+QAn+a0X/vrjlcuD0XCr1uPidUAOlgWaBlKLBG7dxjKiPtE9W/qCMglRPvf9vEShCb0w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKksYNiYWjSeGKaPSU/R5CpdMRYeTvLlXhsF4FTCjDVxsEx9n5X
	E0awC3KasqegJVpWfp9VpzLyqjk+hkaQp8Kx/Jilhd/4y9hULlVkWh7/hxuXsYokVQ4=
X-Gm-Gg: AYBFou2idSkAG4NWSOao0H6pjAYvOfNn0Pz6fMyftp098CJPj32IjEGRa0GR0NJ8xK5
	3EJHNiUIzv1WQWn7V6vatKb7vaHkrvqK0xwBfEUSLDgSOB0C9y++2RqU3Rl9kJCfhSaVhcbV6xh
	cSV74nayUNmzJgJE9OGCm5/xZOF9zwcecHWhmpHGbhe1gIZe53NFqcuZC/cvwgdFFwwtQ9/HyOo
	CJOxJkZ6n74aeAG0WeYW5xbmICJR6b+IsFIS9V1iScXa/AeqCK4W/Dhvxpii2tlliws4yy8HPyL
	zsEIaoFZ1KfCIblxviGNZ6Dckg4JJw+PaxBm8W1FC5EaUP9LH/Io8KwzU2x2IpmNONuI+zZEjS3
	KFGQP1wIQ/LrVCq8yplO8VfttAQ3XIRMNDHky/SmMISI2nfty8o5Qb9j75FbQN/MOPARjzg1xbS
	LyDrRuuf0btH3LX03iTXJ4YWXUjfBbUThSQcRYgYVwbitUo1FTi+/kPLyIKCTH6oiA421AuAsvU
	UNPS5Ua0SU7ucAMmjb/PDCnAF3z6F8oTIdB4+Hv+VaLkRru4WPCubr9u/c8+iaDdO6PvnqLsiL8
	rhCSVP0iynH+pDRE11pMKgagbJ/AvwdEM6FC7W9F8QBoKWm413r8VCkI9pog8uM09F0S
X-Received: by 2002:a05:600c:c110:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a35ac91142mr63664005e9.7.1792932815147;
        Sun, 25 Oct 2026 05:53:35 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm9792478f8f.16.2026.10.25.05.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:53:34 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass-macro: release macro and dcodec clocks in runtime suspend
Date: Sun, 25 Oct 2026 12:53:33 +0000
Message-ID: <20261025125333.208382-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f17f962d-22d7-4a88-bdcc-9be6556040f1@packett.cool>
References: <f17f962d-22d7-4a88-bdcc-9be6556040f1@packett.cool>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/24/26 Val Packett wrote:
> You're working with a tree that's months out of date! This does not
> apply to linux-next at all.
>
> Commit a5ee3180a2a7 ("ASoC: codecs: lpass-{tx,rx}-macro: switch to PM
> clock framework")

Thanks, you are right: I was on a 7.2-based downstream tree. With the
PM clock framework in all four macros this patch is not needed, so
please consider it withdrawn. I will check against linux-next before
sending anything else, and I will drop the attribution tags.

Ramón
